Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 359B27CCBD
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2019 21:29:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728711AbfGaT3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Jul 2019 15:29:23 -0400
Received: from mail.kapsi.fi ([91.232.154.25]:46889 "EHLO mail.kapsi.fi"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726334AbfGaT3X (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Jul 2019 15:29:23 -0400
X-Greylist: delayed 3159 seconds by postgrey-1.27 at vger.kernel.org; Wed, 31 Jul 2019 15:29:22 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=ncAdmh9wQ4TR8p/g0VDjOvxfStohLJvBGksqaFMt3ZQ=; b=xFTgCVSMm7bVKiKYPO+lVNWowC
        6yaYh48tnlxpL6a2Zro0OovDQP5jmpkxsDYQEeYsjydwXpX2v5f8hO9enRHEXK6ih1D5PIXsn9Toe
        L0jYmKa82Qi5f0QB9Tqar3RlsDOwHn78GzDtwv9SKqC3taIygSMYDRVi3BX/5TEbgV7d4SFQbeMpi
        rtosyeJwfOlvb4Fb08LPV7osGNGnjWIqCxjMxJilZVXeaV4KvbC2nrtHPErRc8tV6UajHMLOw3J4M
        SHQj9dflwP5WBLJi4ezKZRnD/Fwtumxd6SBOkFkddJVzJiZ+Oz8a0ApvVCIHlcgf2UObD5kqCJ9PB
        6AY9F/Vg==;
Received: from dvbz8cyyyyyyyyyyyy5hy-3.rev.dnainternet.fi ([2001:14ba:8869:c100::64c] helo=localhost.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <crope@iki.fi>)
        id 1hstSr-00033f-8D; Wed, 31 Jul 2019 21:36:41 +0300
Subject: Re: [PATCH] media: tm6000: Spelling s/diconencted/diconnected/
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <20190731134121.18473-1-geert+renesas@glider.be>
From:   Antti Palosaari <crope@iki.fi>
Message-ID: <95aa9f00-a01e-09ab-3cc3-5f1246052093@iki.fi>
Date:   Wed, 31 Jul 2019 21:36:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190731134121.18473-1-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:14ba:8869:c100::64c
X-SA-Exim-Mail-From: crope@iki.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 7/31/19 4:41 PM, Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   drivers/media/usb/tm6000/tm6000-cards.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm6000/tm6000-cards.c
> index 23df50aa0a4af6da..9a0ffe678524987c 100644
> --- a/drivers/media/usb/tm6000/tm6000-cards.c
> +++ b/drivers/media/usb/tm6000/tm6000-cards.c
> @@ -1328,7 +1328,7 @@ static int tm6000_usb_probe(struct usb_interface *interface,
>   
>   /*
>    * tm6000_usb_disconnect()
> - * called when the device gets diconencted
> + * called when the device gets diconnected

disconnected ?

For the both patches.

>    * video device will be unregistered on v4l2_close in case it is still open
>    */
>   static void tm6000_usb_disconnect(struct usb_interface *interface)
> 


regards
Antti

-- 
http://palosaari.fi/
