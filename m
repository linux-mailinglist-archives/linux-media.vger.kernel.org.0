Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D9F42790AF
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 20:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729822AbgIYSej (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 14:34:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729834AbgIYSei (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 14:34:38 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E24EC0613CE
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:38 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id x22so3991275pfo.12
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2020 11:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=D8qWzNWw/ylGv0AvYE/WmaDyWq/+0ija+R8teMBGwU0=;
        b=fpN+ajYgSkj7uSoxKOhaZSo2s3OPrfOIZzpgv85GTZMuOv+5VUjG3eXaVJcSX+fGTi
         NSgl6/UVPvgwWaR8skfGUzWcAJjGrRTgGNM7eC0utaO4WidKOxoGOUSaaktkJLB5G9sN
         9Po7CBCY09/CSIeqqEGXk9Kps4L55hMx/v/H9TFli+C6uo1XJDjQ0dBLu2jc7iVzHr9w
         K8OQOtHka0RK2mLKs0Iyz6TTICMX1fHDLG3iXiiO1fjPbbbXzo97jibfRajOSXF84cTK
         UmsnRACKYCpLWTc2xORmdIe3+SOKVP/H1GjxIVo0gbiIUqfsIrelUOrPb6LBFdTLJNcm
         Wc3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=D8qWzNWw/ylGv0AvYE/WmaDyWq/+0ija+R8teMBGwU0=;
        b=BMlOvt9+HUiWDgujZpgSLZy2MCZXmlwKqW4x91ILVSyaUgxHjxk2JAedTGkZ2QbrMc
         4ik80OADKF1LWOkxb/XEkSXyuWI78/2CZwba1bqXe7bxCcES+GkiRDVnJJMCjdALy+h/
         Y/y78QtXyoWKQ1djTP1kT2/XYm/MKS2wdcWVTCdCoXHpfPiOcZ2NtdxOpoNxFOhaKQP/
         wq39FgLOuBX90UeNja0DvV6pthItfDbRh+1sozxYfNZeruBwkAtisCTwCXX6/BFTBVzP
         2UDNwMs17eVJV2tJX8vq+PzqRLXTGTYXRf7RvDbaBtp0L8dt8lWD6j7y15z/+NiIPgf9
         e9tg==
X-Gm-Message-State: AOAM530Unyw4Ay2RiIwZg9jW2dutelGKEzYsvxytmJSrTpI79rX6utou
        G6isu858zzfWZnSvs7u6PbL+NQ==
X-Google-Smtp-Source: ABdhPJwzlm/EW0k1dN9gKCPbPnib2iHUnASrCFgy7qVgIF87UD01QjU3xqyGqdCUCVwA6NmHbiiSag==
X-Received: by 2002:aa7:9f99:0:b029:13e:d13d:a134 with SMTP id z25-20020aa79f990000b029013ed13da134mr565916pfr.28.1601058877862;
        Fri, 25 Sep 2020 11:34:37 -0700 (PDT)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id r16sm2554546pjo.19.2020.09.25.11.34.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 11:34:37 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     gregkh@linuxfoundation.org, mchehab@kernel.org, hverkuil@xs4all.nl,
        laurent.pinchart@ideasonboard.com
Cc:     devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH RFT/RFC v2 34/47] staging: media: zoran: constify codec_name
Date:   Fri, 25 Sep 2020 18:30:44 +0000
Message-Id: <1601058657-14042-35-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
References: <1601058657-14042-1-git-send-email-clabbe@baylibre.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The codec_name could be const.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_card.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
index 79783cbb919a..49a1d9e084a8 100644
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
@@ -1102,7 +1102,7 @@ static int zoran_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	struct videocodec_master *master_vfe = NULL;
 	struct videocodec_master *master_codec = NULL;
 	int card_num;
-	char *codec_name, *vfe_name;
+	const char *codec_name, *vfe_name;
 	unsigned int nr;
 
 	nr = zoran_num++;
-- 
2.26.2

