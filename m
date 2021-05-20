Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE88838A49B
	for <lists+linux-media@lfdr.de>; Thu, 20 May 2021 12:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235468AbhETKHC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 May 2021 06:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235420AbhETKFA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 May 2021 06:05:00 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130D3C03542F;
        Thu, 20 May 2021 02:36:12 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id v14so8720836pgi.6;
        Thu, 20 May 2021 02:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8VdCk0Xr5OKjr3jMTbjvJ7ymRpuonD1B8tTYgUKgw+g=;
        b=Xe/SYEbSK4NP9VtMvTGAt3vex7IeT+pMAIP6Bd4w8ASuj/NtH/YC9ppidKcFE9SWew
         sxHb1qrL57xOSizySBDQVzDLph4elKg7LP9zqcv+ilrXBkyUNqAR8OXHWFv7oAozR1nE
         8Ia4UZKW5IajVewsKhOaPD/TN1WC9wunJWevYMIsr3nrWXC68f5EKIuCx913PTB4Vefe
         oD9j/OKNews5e+j2nbklC8CUMNIaP+365IvU6UbObPXscG02rHImYfd6yn4oAy8VwX6P
         SognfXzbMfvmAcuowst7AHkQratB5lxsYGhqEjVdg/Hr/2Huw3x5AQAf2pkCGAucoAAD
         LR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8VdCk0Xr5OKjr3jMTbjvJ7ymRpuonD1B8tTYgUKgw+g=;
        b=WoojQ+c70B+c8QDeSzbrzS5MfpvIsx1QQLJ6NdQy/lFB0w7ajOtwiKQ0bh9AC4uJvn
         xIcph9chGIwDFt38oAUf9bvpGhDclXvw2OhKpjJRWbcpXY8d7+TcvDmx9y9jTv3la/+K
         eTuGemR5EU+j4WI29cOB16LVd/XMbguy3tgaoxDw2jcWa2Jz9G9jbxxssuuRzB0H2fmt
         Mu5aT0mjPiVugSf+vlv00Tq7UBMC8soqfiWrdufoe9zIWxrhp436uukdNLh2doCAKYYj
         EBrWS9GwLbW6tm80+5eQfQigDp4Lln1Hk6hk+4Eatv1qOx/Z/z5q4fNqmZ1zF+/mzp9e
         nKoA==
X-Gm-Message-State: AOAM530KgFx737fRheb9noyP9j9JxFril6L0Becnxk7iGvxWtBurHA15
        gZsVmlvYtldzSB92rxsU5qU=
X-Google-Smtp-Source: ABdhPJwyN3kNkmiThSRbwr3YndagaFARc36+mO+xipFRADroDvNHFi+/SiQ+TV+Eja1lJIYVXJux/Q==
X-Received: by 2002:a65:480a:: with SMTP id h10mr3695444pgs.63.1621503371699;
        Thu, 20 May 2021 02:36:11 -0700 (PDT)
Received: from yanshuaijun.ccdomain.com ([103.220.76.197])
        by smtp.gmail.com with ESMTPSA id a15sm1450871pff.128.2021.05.20.02.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 02:36:07 -0700 (PDT)
From:   Herman <herman.yim88@gmail.com>
X-Google-Original-From: Herman <yanshuaijun@yulong.com>
To:     mchehab@kernel.org
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Herman <yanshuaijun@yulong.com>
Subject: [PATCH] drivers/media/usb/em28xx/em28xx-cards.c : fix typo issues
Date:   Thu, 20 May 2021 17:35:53 +0800
Message-Id: <20210520093553.5652-1-yanshuaijun@yulong.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

change 'Configuare' into 'Configure'
change 'Configuared' into 'Configured'

Signed-off-by: Herman <yanshuaijun@yulong.com>
---
 drivers/media/usb/em28xx/em28xx-cards.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index ba9292e2a587..c1e0dccb7408 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -4065,15 +4065,15 @@ static int em28xx_usb_probe(struct usb_interface *intf,
 		dev->dev_next->dvb_max_pkt_size_isoc = dev->dvb_max_pkt_size_isoc_ts2;
 		dev->dev_next->dvb_alt_isoc = dev->dvb_alt_isoc;
 
-		/* Configuare hardware to support TS2*/
+		/* Configure hardware to support TS2*/
 		if (dev->dvb_xfer_bulk) {
-			/* The ep4 and ep5 are configuared for BULK */
+			/* The ep4 and ep5 are configured for BULK */
 			em28xx_write_reg(dev, 0x0b, 0x96);
 			mdelay(100);
 			em28xx_write_reg(dev, 0x0b, 0x80);
 			mdelay(100);
 		} else {
-			/* The ep4 and ep5 are configuared for ISO */
+			/* The ep4 and ep5 are configured for ISO */
 			em28xx_write_reg(dev, 0x0b, 0x96);
 			mdelay(100);
 			em28xx_write_reg(dev, 0x0b, 0x82);
-- 
2.25.1

