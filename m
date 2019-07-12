Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57EB967648
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 23:42:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728067AbfGLVl6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 17:41:58 -0400
Received: from smtp4-g21.free.fr ([212.27.42.4]:56414 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728037AbfGLVl5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 17:41:57 -0400
Received: from [192.168.1.91] (unknown [77.207.133.132])
        (Authenticated sender: marc.w.gonzalez)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7AB8819F576;
        Fri, 12 Jul 2019 23:41:38 +0200 (CEST)
Subject: Re: [PATCH v3] media: si2168: Refactor command setup code
To:     Brad Love <brad@nextdimension.cc>, Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
 <bde6e367-61a4-7501-2459-eecad5db1d1b@nextdimension.cc>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <90fc8084-41b2-e235-ef20-98c7db350a5d@free.fr>
Date:   Fri, 12 Jul 2019 23:41:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <bde6e367-61a4-7501-2459-eecad5db1d1b@nextdimension.cc>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/07/2019 17:47, Brad Love wrote:

> On 04/07/2019 05.33, Marc Gonzalez wrote:
>
>> Refactor the command setup code, and let the compiler determine
>> the size of each command.
>>
>> Reviewed-by: Jonathan Neuschäfer <j.neuschaefer@gmx.net>
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> ---
>> Changes from v1:
>> - Use a real function to populate struct si2168_cmd *cmd, and a trivial
>> macro wrapping it (macro because sizeof).
>> Changes from v2:
>> - Fix header mess
>> - Add Jonathan's tag
>> ---
>>  drivers/media/dvb-frontends/si2168.c | 146 +++++++++------------------
>>  1 file changed, 45 insertions(+), 101 deletions(-)
>>
>> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
>> index c64b360ce6b5..5e81e076369c 100644
>> --- a/drivers/media/dvb-frontends/si2168.c
>> +++ b/drivers/media/dvb-frontends/si2168.c
>> @@ -12,6 +12,16 @@
>>  
>>  static const struct dvb_frontend_ops si2168_ops;
>>  
>> +static void cmd_setup(struct si2168_cmd *cmd, char *args, int wlen, int rlen)
>> +{
>> +	memcpy(cmd->args, args, wlen);
>> +	cmd->wlen = wlen;
>> +	cmd->rlen = rlen;
>> +}
> 
> struct si2168_cmd.args is u8, not char.

Yes, struct si2168_cmd.args is an u8 array.
However, string literals such as "\xa0\x01" are char arrays.
memcpy() ignores the types altogether.

> I also think const should apply to the pointer.

I can do that, even though it's obvious we're not writing
to args in the trivial cmd_setup() body.

>> +#define CMD_SETUP(cmd, args, rlen) \
>> +	cmd_setup(cmd, args, sizeof(args) - 1, rlen)
>> +
> 
> This is only a valid helper if args is a null terminated string.

You say that because of the "-1" arithmetic, I assume?

> It just so happens that every instance in this driver is,

FWIW, there are 2 calls where it is not.
memcpy(cmd.args, &fw->data[(fw->size - remaining) + 1], len);
memcpy(cmd.args, &fw->data[fw->size - remaining], len);

> but that could be a silent pitfall if someone used a u8 array
> with this macro.

Actually, the compiler warns if we pass an u8 array instead of
a char array. IMO, the type is actually a good thing, since it
warns for cases where we don't use a string literal.

> Otherwise I'm ok with the refactoring.

I'll see what I can do...

Regards.
