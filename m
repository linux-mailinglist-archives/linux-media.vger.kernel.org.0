Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19780272056
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726928AbgIUKVD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:21:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726906AbgIUKVB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:01 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 463FDC0613CF
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:01 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id k15so12116476wrn.10
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Phn676ck9fxFNj85BpKV8apw8QC3TViwDCE0eTe2lKw=;
        b=SPcgfzwxG+7TAk0IVdcJAFHhW8FgtzKodBdFxADUrLFsEGadjF7vCav7EEu+lU0+GP
         NoSmoxIDJ3mjicDERBPfRbNj0tsMIMvrPFRtjvcX38BcDEyPZ+/MtRLdkL1pEoHeC0J+
         gXrEKMhnbxYg66roPjpaq84u95xIeiKLqFwr6gZRgbMVE1Ejz55JtyaTrEwjb4KbTcfG
         PpIGABEtexnVZHJNYqRPwi+RilJspBYCpSHEv7rBDHbghA1z5RyiTEM2DE/c619SP3FJ
         TbuHDmkJTLnNPptMWYqQEXm86UexWo+n/qwGjWsOL0TI/mnhmAyDZPYrSSrudAVE9pX/
         XHFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Phn676ck9fxFNj85BpKV8apw8QC3TViwDCE0eTe2lKw=;
        b=lrSsfNt3CW7AMFuOT3xuzGU1iJj/CDcc5WIpzbFuIXN2DKzpZ/GHJy8CqjqvcxMq6n
         Is49BCv8Iz7FvYXh525wr3i6rz6hjJilKnSvJiXv8cnrhGsLF7qjuOdLMyUpquLwJm/M
         0SljNoW/8ArOffl4gk241q5hDEWJKt4ABYkJ54uOtizL/pN5Nb3s87Go81oyYUnTjpmo
         iJyk58iJL9TY8M/4uVQcqZ50RoNxhmsjK+Oqty1aDjFDHhDFQByQBdCD6iwfTARkco1L
         58c3t5bo/Dg2RBOxCfE7ADKK5tFdpSOH2rsdtExttmOOAo5XnznBKJ2Or53TBcqgdyAa
         sTxw==
X-Gm-Message-State: AOAM531VrWoXUUPaqs5Bf7hu2Po0Jfa67rjYGSqAKdqYJMMiQPjmF18j
        eO15XOQzW8vrYa+JXPm5vcmy/Q==
X-Google-Smtp-Source: ABdhPJzidbt0pzET/EtSowQUwY6EY9mSfVSCXN4I8uUlbcM+UuJ2gQy4RnxaDKlVsybR+D7AZPvq9A==
X-Received: by 2002:a5d:668b:: with SMTP id l11mr50274670wru.89.1600683660027;
        Mon, 21 Sep 2020 03:21:00 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.20.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:20:59 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 29/49] staging: media: zoran: convert mdelay to udelay
Date:   Mon, 21 Sep 2020 10:20:04 +0000
Message-Id: <1600683624-5863-30-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

As asked by checkpath, let's use udelay.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 3a353130afb9..82d522c1a528 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -1315,9 +1315,9 @@ void zoran_init_hardware(struct zoran *zr)
 void zr36057_restart(struct zoran *zr)
 {
 	btwrite(0, ZR36057_SPGPPCR);
-	mdelay(1);
+	udelay(1000);
 	btor(ZR36057_SPGPPCR_SoftReset, ZR36057_SPGPPCR);
-	mdelay(1);
+	udelay(1000);
 
 	/* assert P_Reset */
 	btwrite(0, ZR36057_JPC);
-- 
2.26.2

