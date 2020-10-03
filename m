Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBA0028232E
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 11:33:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgJCJcr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 05:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725681AbgJCJcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 05:32:47 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49B66C0613E7;
        Sat,  3 Oct 2020 02:32:47 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id w5so4338412wrp.8;
        Sat, 03 Oct 2020 02:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7uJ62bC16MrSr6uSldD46p7GU1CUZKLsMQMphnOGugM=;
        b=oFlR5cM2b095zwjByjCQoPIkSdmIc3Ts69gOAZeR5BJ37WNr0C5Wh/K3+D4+iiwjJP
         jhNgZI6L66vksaITQQ8cDVVXaFvEQtNhYWYPT35+btHsK02++xGrX81vm3c5gyQTJJDm
         +iCfM27NJccsYqMGrq7SEHa4HVWvyEz2BZFOZftxSxx1V4n2u2CYW+bHqwsx9qRwSF9d
         W0L4jZcBiBinVM99twcjk74/BfVGiZwBjlsVEdCsIRXQ0zHvYilmNUVvd1dR2AfGCDPb
         3si14Y2F6kneyq+KdhMI1XYCcV2tSDtM+2zDfHprV8tjZ/JDruDXbgjUYej7jCgSKvEI
         FidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7uJ62bC16MrSr6uSldD46p7GU1CUZKLsMQMphnOGugM=;
        b=OQg5ehJuNyiErNq9UxLaeYHPpplNRXbLvqsF6SXxyFUubLmRU4DelrWqKrcgLv093O
         OrBQk4gLy7z5BiV/bEsG2mdtIGLdz8nDlVrVrEpp52g1TsYs6zlWAqWY38XRb5ltVAa0
         vEGiaVFatSrtc28HscB1gxmwU76Xpium5zeJWhMc6hFoeps84+zGEBa/wO/tVtQJLtrq
         4BTbaA0LgvRM7roXwpCpvHX818cBJGkL8PW9AQoi4k8Uj53D+Jz4D0GL8Ru5+eDPOYye
         vq5PbSgbplR87dbumXwfkNC3ZlK2q9BCmUWhn6pbNUMgy+5V2+EtyVunzrdM6vI+nb6Z
         Z70A==
X-Gm-Message-State: AOAM532LFeLQOX0JkJWuJMbwpxRqunxWt3EazmJgPhrU43qEPBRqJ1+9
        oInEpZqSJ9Op7Sa0mW1aW4Ho8B3Yfoc=
X-Google-Smtp-Source: ABdhPJydSV1blJIcRFsAVRknnA4q90JvCwk9ypDofxjEv2KNk5Jya9zfBPEZghMoIyAaZCVqdRj1vQ==
X-Received: by 2002:adf:dbc3:: with SMTP id e3mr1346903wrj.1.1601717565958;
        Sat, 03 Oct 2020 02:32:45 -0700 (PDT)
Received: from [192.168.43.227] ([185.69.145.159])
        by smtp.gmail.com with ESMTPSA id j101sm1162452wrj.9.2020.10.03.02.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:32:45 -0700 (PDT)
Subject: [PATCH] media: lmedm04: Use GFP_KERNEL for URB allocation/submission.
To:     linux-media <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Joe Perches <joe@perches.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>
References: <e6cd92faf09722fe729a7de03e7bde592f62499c.camel@perches.com>
 <d4b13e5d-6c97-2594-0ca6-346bb2129b88@gmail.com>
 <20200929190953.2f621541@coco.lan>
From:   Malcolm Priestley <tvboxspy@gmail.com>
Message-ID: <d6a1c5ab-d125-72b6-a6c8-538292fc0685@gmail.com>
Date:   Sat, 3 Oct 2020 10:32:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20200929190953.2f621541@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


lme2510_int_read is not atomically called so use GFP_KERNEL for
usb_alloc_urb and usb_submit_urb which is the first in the chain
of interrupt submissions.

Signed-off-by: Malcolm Priestley <tvboxspy@gmail.com>
---
This patch is applied on top of
[likely] media: lmedm04: Fix misuse of comma 

I have tested both patches with hardware and all is well.

 drivers/media/usb/dvb-usb-v2/lmedm04.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb-v2/lmedm04.c b/drivers/media/usb/dvb-usb-v2/lmedm04.c
index 9ddda8d68ee0..0f5a1eed5ea9 100644
--- a/drivers/media/usb/dvb-usb-v2/lmedm04.c
+++ b/drivers/media/usb/dvb-usb-v2/lmedm04.c
@@ -373,7 +373,7 @@ static int lme2510_int_read(struct dvb_usb_adapter *adap)
 	struct lme2510_state *lme_int = adap_to_priv(adap);
 	struct usb_host_endpoint *ep;
 
-	lme_int->lme_urb = usb_alloc_urb(0, GFP_ATOMIC);
+	lme_int->lme_urb = usb_alloc_urb(0, GFP_KERNEL);
 
 	if (lme_int->lme_urb == NULL)
 			return -ENOMEM;
@@ -393,7 +393,7 @@ static int lme2510_int_read(struct dvb_usb_adapter *adap)
 	if (usb_endpoint_type(&ep->desc) == USB_ENDPOINT_XFER_BULK)
 		lme_int->lme_urb->pipe = usb_rcvbulkpipe(d->udev, 0xa);
 
-	usb_submit_urb(lme_int->lme_urb, GFP_ATOMIC);
+	usb_submit_urb(lme_int->lme_urb, GFP_KERNEL);
 	info("INT Interrupt Service Started");
 
 	return 0;
-- 
2.27.0
