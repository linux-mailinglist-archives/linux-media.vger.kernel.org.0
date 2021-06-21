Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA013AE29A
	for <lists+linux-media@lfdr.de>; Mon, 21 Jun 2021 07:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbhFUFK0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Jun 2021 01:10:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhFUFKX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Jun 2021 01:10:23 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37646C061574;
        Sun, 20 Jun 2021 22:08:09 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id bb10-20020a17090b008ab029016eef083425so11453415pjb.5;
        Sun, 20 Jun 2021 22:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SFuGJeqPjyUwDMBLj8Pxzn5ty0P8RjvWXkQpyPXRDHY=;
        b=lJ/zMqXZHUZwam+qwVQ00J19klphShZjI3M/4m/c9abVZqIHuRy79wXsPmULPTT32f
         oDszutihoXeDUhuEv1JKMexGjnBYkYzahVJ1qJSX9njmiWgvlzrvfUQDatW78Q8cThlm
         VPkWurBdOp9XPAMS6X5vkBu5RE7ppSv3Bq1Vm5EzIfAywfom9yKo2ZiGHcbh72pjElXR
         2TH7axLbG36bzpT0GZn4gs2ZG3PIEBRBvouWaV29845LNNS0T0Jp/mnOxjdbJYcbwDyY
         rPisQQjkGF2OV/KS3RXOzAqihlNaYxJ58j2m03tKhC8DU106YU91TwqQ/FonMdg0VWPs
         slZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SFuGJeqPjyUwDMBLj8Pxzn5ty0P8RjvWXkQpyPXRDHY=;
        b=cLqUiAAAn/f/UPflserlS6TatNaXdHN3yDIDGj3LET+UzXm0wN3Fn1/4mLzgE8bMF1
         ZQ6SwAuXZZqvaWHl+oW80XN16RyAGsDIcT23Xh/GX3+ji58e7ITBMsugWMp5sYtPjFPW
         fBz8AhoQpaPqzd9HGrPDJC80XKwnoitDG6aw3ppgSuT9+RJcVmJCzeq2j+DVaP60/kCz
         p/x20Dwa6rMpFrFSdEXK6ZIaDJf20U0ku6mrHJ3mlcgLpzvGyOIoZBqm3410UhjHFrkD
         esdSS87SeLeW741NMzHCUbpx915IFwQX4XwIc8KpbPrVO5H1LxKwsaMuuczQZCh01Mpa
         kUaQ==
X-Gm-Message-State: AOAM532Hs8o73PjDdGJhnFHHx1tMDJKHtTUVBq1ZGA7knL0Ap88JlVnq
        hkhfH5mBo/OvxRTx8pz7ffU=
X-Google-Smtp-Source: ABdhPJxw8lfnAnQLBucC6Fk7J6idNmr1qMG1WqKh1RckeZ4EXb5fSB23Q9FLDV3CUq4EO4eyuHSE+g==
X-Received: by 2002:a17:902:b181:b029:fc:c069:865c with SMTP id s1-20020a170902b181b02900fcc069865cmr16414120plr.28.1624252088804;
        Sun, 20 Jun 2021 22:08:08 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.71])
        by smtp.gmail.com with ESMTPSA id b5sm11808783pgh.41.2021.06.20.22.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 22:08:08 -0700 (PDT)
From:   Dongliang Mu <mudongliangabcd@gmail.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] media: dvb-usb: move kfree(d) to dvb_usb_device_exit
Date:   Mon, 21 Jun 2021 13:07:27 +0800
Message-Id: <20210621050729.3898275-2-mudongliangabcd@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621050729.3898275-1-mudongliangabcd@gmail.com>
References: <20210621050729.3898275-1-mudongliangabcd@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As d is allocated in dvb_usb_device_init, so move to the deallocation of
d from dvb_usb_exit to dvb_usb_device_exit

Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
---
 drivers/media/usb/dvb-usb/dvb-usb-init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/dvb-usb/dvb-usb-init.c b/drivers/media/usb/dvb-usb/dvb-usb-init.c
index edc477cedaa9..21ad51be4820 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-init.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-init.c
@@ -147,7 +147,6 @@ static int dvb_usb_exit(struct dvb_usb_device *d)
 		d->props.priv_destroy(d);
 
 	kfree(d->priv);
-	kfree(d);
 	return 0;
 }
 
@@ -333,9 +332,10 @@ void dvb_usb_device_exit(struct usb_interface *intf)
 	char name[40];
 
 	usb_set_intfdata(intf, NULL);
-	if (d != NULL && d->desc != NULL) {
+	if (d && d->desc) {
 		strscpy(name, d->desc->name, sizeof(name));
 		dvb_usb_exit(d);
+		kfree(d);
 	} else {
 		strscpy(name, default_name, sizeof(name));
 	}
-- 
2.25.1

