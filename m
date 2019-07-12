Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D77B066A0B
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2019 11:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726318AbfGLJhp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jul 2019 05:37:45 -0400
Received: from ns.iliad.fr ([212.27.33.1]:56974 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725987AbfGLJhp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jul 2019 05:37:45 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 37E9020598;
        Fri, 12 Jul 2019 11:37:43 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 18F091FF13;
        Fri, 12 Jul 2019 11:37:43 +0200 (CEST)
Subject: Re: [PATCH v3] media: si2168: Refactor command setup code
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
        Antti Palosaari <crope@iki.fi>,
        Brad Love <brad@nextdimension.cc>, Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <544859b5-108a-1909-d612-64f67a02aeec@free.fr>
 <20190712084343.GA28962@taurus.defre.kleine-koenig.org>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <b84104ca-6e4e-24ee-91e0-56aebd036a48@free.fr>
Date:   Fri, 12 Jul 2019 11:37:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190712084343.GA28962@taurus.defre.kleine-koenig.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Fri Jul 12 11:37:43 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

+ Sean

On 12/07/2019 10:43, Uwe Kleine-König wrote:

> On Thu, Jul 04, 2019 at 12:33:22PM +0200, Marc Gonzalez wrote:
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
> 
> I'd add an "inline" here. And you could add a const for *args.

I was under the (vague) impression that it's better to let the compiler
decide when to inline, except for trivial alternatives in headers.
David Miller wrote: "Please do not use the inline directive in foo.c
files, let the compiler decide."

Antti, Sean, what do you think?

For my notes: https://gcc.gnu.org/onlinedocs/gcc/Inline.html


>> +{
>> +	memcpy(cmd->args, args, wlen);
>> +	cmd->wlen = wlen;
>> +	cmd->rlen = rlen;
>> +}
>> +
>> +#define CMD_SETUP(cmd, args, rlen) \
>> +	cmd_setup(cmd, args, sizeof(args) - 1, rlen)
> 
> Here is the chance to add some static checking. Also it is a good habit
> to put parens around macro arguments.

Wrt parens around arguments, I figured they are not required here, since they
are used as function arguments. Though you may have a valid point.

Antti, Sean?


> Something like:
> 
> #define CMD_SETUP(cmd, args, rlen) ({ \
> 	BUILD_BUG_ON(sizeof((args)) - 1 > SI2168_ARGLEN);
> 	cmd_setup((cmd), (args), __must_be_array((args)) + sizeof((args)) - 1, (rlen));
> 
> Maybe let this macro live in drivers/media/dvb-frontends/si2168_priv.h
> where struct si2168_cmd is defined?

Antti, Sean?


> I looked over the transformations in the rest of the patch and this
> looks good.

Thanks for taking a look!

Regards.
