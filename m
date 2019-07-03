Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C36205E45B
	for <lists+linux-media@lfdr.de>; Wed,  3 Jul 2019 14:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbfGCMsC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jul 2019 08:48:02 -0400
Received: from ns.iliad.fr ([212.27.33.1]:59666 "EHLO ns.iliad.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727415AbfGCMsB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jul 2019 08:48:01 -0400
Received: from ns.iliad.fr (localhost [127.0.0.1])
        by ns.iliad.fr (Postfix) with ESMTP id 6C7B22079D;
        Wed,  3 Jul 2019 14:47:59 +0200 (CEST)
Received: from [192.168.108.49] (freebox.vlq16.iliad.fr [213.36.7.13])
        by ns.iliad.fr (Postfix) with ESMTP id 583F5206B9;
        Wed,  3 Jul 2019 14:47:59 +0200 (CEST)
Subject: Re: [PATCH v1] media: si2168: Refactor command setup code
To:     =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc:     Antti Palosaari <crope@iki.fi>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brad Love <brad@nextdimension.cc>
References: <6a8f9a5b-2e88-8c26-440b-76af0d91eda6@free.fr>
 <20190702095109.GC22408@latitude>
From:   Marc Gonzalez <marc.w.gonzalez@free.fr>
Message-ID: <6a644c94-f979-b656-472b-c7fe9303e08c@free.fr>
Date:   Wed, 3 Jul 2019 14:47:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190702095109.GC22408@latitude>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ; Wed Jul  3 14:47:59 2019 +0200 (CEST)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/07/2019 11:51, Jonathan Neuschäfer wrote:

> On Mon, Jul 01, 2019 at 01:44:09PM +0200, Marc Gonzalez wrote:
>
>> By refactoring the command setup code, we can let the compiler
>> determine the size of each command.
> 
> I like the idea, it definitely saves some code.
> 
> The conversion also looks correct.
> 
>> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
>> ---
>>  drivers/media/dvb-frontends/si2168.c | 142 ++++++++-------------------
>>  1 file changed, 41 insertions(+), 101 deletions(-)
>>
>> diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
>> index 168c503e9154..19398f041c79 100644
>> --- a/drivers/media/dvb-frontends/si2168.c
>> +++ b/drivers/media/dvb-frontends/si2168.c
>> @@ -11,6 +11,12 @@
>>  
>>  static const struct dvb_frontend_ops si2168_ops;
>>  
>> +#define CMD_SETUP(cmd, __args, __rlen) do {	\
>> +	int wlen = sizeof(__args) - 1;		\
>> +	memcpy(cmd.args, __args, wlen);		\
>> +	cmd.wlen = wlen; cmd.rlen = __rlen;	\
>> +} while (0)
> 
> It would be nice for casual readers to have a little comment here, that
> explains (briefly) what this macro does, and what the arguments mean,
> and their types.

Just a bit of background.

A macro is required /at some point/ because arrays "decay" into pointers
when used as function arguments.

Come to think of it, I'm really not a fan of "large" macro functions.
I'll outline a different option in v2.


> Why cmd rather than __cmd? This seems inconsistent.

Note: I hate using underscores in macro argument names, but they clashed
with the struct field names. There was no such clash for 'cmd'.


> The wlen local variable can be avoided by a bit of suffling:
> 
> 	#define CMD_SETUP(cmd, __args, __rlen) do {	\
> 		cmd.rlen = __rlen;			\
> 		cmd.wlen = sizeof(__args) - 1;		\
> 		memcpy(cmd.args, __args, cmd.wlen);	\
> 	} while (0)

Do you think it is important to avoid a local variable?


>> Not sure where to store the macro. Maybe include/media/dvb_frontend.h?
> 
> Then include/media/dvb_frontend.h would contain information about the
> private structs of a few (two) drivers. This doesn't seem like a good
> idea to me.

You're right. I found a better place.

Regards.
