Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9D727D3C4
	for <lists+linux-media@lfdr.de>; Tue, 29 Sep 2020 18:42:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgI2Qm3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 29 Sep 2020 12:42:29 -0400
Received: from smtprelay0166.hostedemail.com ([216.40.44.166]:33332 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728315AbgI2Qm3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 29 Sep 2020 12:42:29 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay02.hostedemail.com (Postfix) with ESMTP id 9294B1867;
        Tue, 29 Sep 2020 16:42:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50,0,0,,d41d8cd98f00b204,joe@perches.com,,RULES_HIT:41:152:355:379:582:599:800:960:967:973:982:988:989:1152:1260:1263:1277:1311:1313:1314:1345:1359:1437:1515:1516:1518:1534:1541:1593:1594:1711:1712:1730:1747:1777:1792:2393:2525:2560:2563:2682:2685:2859:2900:2904:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3352:3865:3867:3868:3870:3871:3873:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:5007:6261:7903:9025:9036:9040:9388:10004:10400:10848:11026:11232:11473:11657:11658:11914:12043:12297:12438:12555:12740:12895:13069:13255:13311:13357:13894:14096:14097:14181:14659:14685:14721:21080:21451:21627:30012:30054:30075,0,RBL:none,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:,MSBL:0,DNSBL:none,Custom_rules:0:0:0,LFtime:2,LUA_SUMMARY:none
X-HE-Tag: coat61_400ebc52718b
X-Filterd-Recvd-Size: 2797
Received: from perches-mx.perches.com (imap-ext [216.40.42.5])
        (Authenticated sender: webmail@joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Tue, 29 Sep 2020 16:42:27 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Tue, 29 Sep 2020 09:42:27 -0700
From:   Joe Perches <joe@perches.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Julia Lawall <Julia.Lawall@inria.fr>,
        Malcolm Priestley <tvboxspy@gmail.com>,
        =?UTF-8?Q?Valdis_Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>,
        Thomas Gleixner <tglx@linutronix.de>,
        kernel-janitors@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/20] media: lmedm04: use semicolons rather than commas
 to separate statements
In-Reply-To: <8d73748e-be82-4c30-4550-b5f4eecb3055@wanadoo.fr>
References: <1601385283-26144-1-git-send-email-Julia.Lawall@inria.fr>
 <1601385283-26144-11-git-send-email-Julia.Lawall@inria.fr>
 <8d73748e-be82-4c30-4550-b5f4eecb3055@wanadoo.fr>
User-Agent: Roundcube Webmail/1.4-rc2
Message-ID: <c79b36c12c978d38f3ad89b1c659871a@perches.com>
X-Sender: joe@perches.com
X-Originating-IP: [47.6.102.41]
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-09-29 09:00, Christophe JAILLET wrote:
> Le 29/09/2020 à 15:14, Julia Lawall a écrit :
>> Replace commas with semicolons.  Commas introduce unnecessary
>> variability in the code structure and are hard to see.  What is done
>> is essentially described by the following Coccinelle semantic patch
>> (http://coccinelle.lip6.fr/):
>> 
>> // <smpl>
>> @@ expression e1,e2; @@
>> e1
>> -,
>> +;
>> e2
>> ... when any
>> // </smpl>
>> 
>> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>> 
>> ---
>>   drivers/media/usb/dvb-usb-v2/lmedm04.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c 
>> b/drivers/media/usb/dvb-usb-v2/lmedm04.c
>> index 5a7a9522d46d..9ddda8d68ee0 100644
>> --- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
>> +++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
>> @@ -391,7 +391,7 @@ static int lme2510_int_read(struct dvb_usb_adapter 
>> *adap)
>>   	ep = usb_pipe_endpoint(d->udev, lme_int->lme_urb->pipe);
>>     	if (usb_endpoint_type(&ep->desc) == USB_ENDPOINT_XFER_BULK)
>> -		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa),
>> +		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa);
>>     	usb_submit_urb(lme_int->lme_urb, GFP_ATOMIC);
>>   	info("INT Interrupt Service Started");
>> 
>> 
> Ouch!
> 
> This one looks like a real issue!


Julia?  Did you do this one by hand?  This actually changes logic which 
I did not expectthe cocci script to do.
> CJ
