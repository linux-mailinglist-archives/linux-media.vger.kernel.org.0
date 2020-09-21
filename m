Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4026A27207F
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 12:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgIUKWS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 06:22:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726952AbgIUKVH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 06:21:07 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32B3C0613D1
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:06 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id l9so12024674wme.3
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2020 03:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=dGPy5ojL0a12oJizSoTZbHP5FGaftfAgkoEVHs65l4s=;
        b=H6312PE+010ywJeFOg4lNE3sW8va0OwgWJcvpBLNSV2n4oQ/q8IOwKVpE4MsPUnCeQ
         3lpyvqzzokBMxsB7SmGe6P7LXw7OeHq5WbZxslzvA9P2yo0fJ0pTvlMWXOzRQzKv5LJn
         qREcus9oypZcllMr4npr7tiYPVtXo8D4b/UiQDXlaqafrU8hDph/dIUwP1h0id/08Tut
         nUn/Tp0o6OCDVI6BX+DecGAk9Tm39IxMfe171qbtAJ/dmDpitBnqim6npCnJjDUAFKSK
         CjHDaVPZuxwdAuBXj+rNfxl9txyLroSy6dhuekiskmcVACAtl8XF5cgwVLhIWBxO1Pp3
         58Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=dGPy5ojL0a12oJizSoTZbHP5FGaftfAgkoEVHs65l4s=;
        b=Z1WKqLp8M+y8ijKt/v6NLYoFsP5qXoqW6rzCC/3IlgjRvPGwTBSjtDHunw3GnlWVcJ
         PRTXmHyP9M4wWbNV5nmay/RnMFVJ3+HvA+x/gLfciEb6aIgSgtwDSA4xt5axasvlytdh
         A1fMRNeFp+wRwG9ziHDl8FEoHFUdZt7Yx8PtRQmd/SIsF9/v+zcyq84lJ+q45yP4NFBy
         E5WRX6yjx8cP3AExXffAhDDZXXtavcaP7tThuXhYqDxTllIDwTCfevYOq7Od6DRrpHHL
         xmNpAeHrvvuKddMge2jzNO0ycbMRkepWDNOXzM0mxKb5I5/HXNIczklU7mIt4qLfYKsx
         8qtQ==
X-Gm-Message-State: AOAM531O9KYp6fvKsNw5mtn90dIGImAWqY3lYJFE7AkyLLBNDEi6KyLe
        AFBuwxojcXA0dGdbZDS8lwV2dNMTIfe3Rg==
X-Google-Smtp-Source: ABdhPJzNjyNJHKBehOtbtsaCLPkzNr95oSX2JPP9UpbfgavliKvqivJ0H/6ycjsOjh8/p3Iea3rfVg==
X-Received: by 2002:a7b:c0ca:: with SMTP id s10mr29336977wmh.103.1600683665592;
        Mon, 21 Sep 2020 03:21:05 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id l17sm18804629wme.11.2020.09.21.03.21.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2020 03:21:04 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, laurent.pinchart@skynet.be,
        mchehab@kernel.org
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC 35/49] staging: media: zoran: constify codec_name
Date:   Mon, 21 Sep 2020 10:20:10 +0000
Message-Id: <1600683624-5863-36-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
References: <1600683624-5863-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The codec_name could be const.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 176ce8a355ba..d956bd45194f 100644
--- a/drivers/staging/media/zoran/zoran_card.c
+++ b/drivers/staging/media/zoran/zoran_card.c
@@ -254,9 +254,9 @@ static void avs6eyes_init(struct zoran *zr)
 	GPIO(zr, 7, mux & 4);   /* MUX S2 */
 }
 
-static char *codecid_to_modulename(u16 codecid)
+static const char *codecid_to_modulename(u16 codecid)
 {
-	char *name = NULL;
+	const char *name = NULL;
 
 	switch (codecid) {
 	case CODEC_TYPE_ZR36060:
@@ -1092,7 +1092,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct videocodec_master *master_vfe = NULL;
 	struct videocodec_master *master_codec = NULL;
 	int card_num;
-	char *codec_name, *vfe_name;
+	const char *codec_name, *vfe_name;
 	unsigned int nr;
 
 	nr = zoran_num++;
-- 
2.26.2

