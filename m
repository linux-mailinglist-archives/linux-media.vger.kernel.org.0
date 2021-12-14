Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B58474764
	for <lists+linux-media@lfdr.de>; Tue, 14 Dec 2021 17:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235756AbhLNQRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Dec 2021 11:17:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235740AbhLNQQ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Dec 2021 11:16:59 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD349C06173E
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:16:58 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j3so33311725wrp.1
        for <linux-media@vger.kernel.org>; Tue, 14 Dec 2021 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jsAZmzA84HYr0fSj6Nj30TuRXcwtejrxLGTaWhzAlMQ=;
        b=Jkgd5bP2htU6ML5q7CKo+fwr8qGgeOdl7vKmxlxevccWOC5a+p7ykDSeeS2ziPy/s+
         GEwgjtqrspok2T/pINKHxN1vu+b8eIloHYQjoLvRfacYMNDLKmmlRfanyR19mttzDchO
         P6CspvtzORLWonE9y0FaoQLjH7lRsOt8yWqhoFGe/nZDwfF2+QmoL4nk6uEF/Hk2fhcE
         PDRcBz9jK9PlalTp6Cfzuz+56i+EcgKCKeXQ6SuLUkJlBA0VMCNg6xytq12dUfzI2x1G
         DGGO7aB1qSddlKfLoF9drhc1ekejuFpy4g9vlr/CgjnmWA0Uu7a1BsSR7AIpSsxtwU9M
         B/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jsAZmzA84HYr0fSj6Nj30TuRXcwtejrxLGTaWhzAlMQ=;
        b=7iepy9V/L+h7EzTSsZkWdXTcrwdT7SjIY19TStrGhj0L60oJ7nnCR52fvnznoBV0OI
         cxdce2oq/qPaF5dpTH8e1QXRSVE2zgKnLI1M2FD5215NXnZV32hLEo72+k6C3BVUtP2W
         ogReHVXIJwbLtqX321lTdpB8frhnEjYvfWUwEXqOyQ7eRRv8k7czN8PpN4+HET85RkF6
         7LhVU8MxvKYg4fIFSJDjd//5fg0iWKbShFxpO6RNOBH/krz1xv6BceGdj99bcZFkG4Ny
         TykKl8qM+/3fOkKQdlwCxm4k1Qhuv43qlrb/UqjbTQxusIrhXeviU+t8uMF1xoNcVuqt
         5V4Q==
X-Gm-Message-State: AOAM530SFQi45d2VjdiKOJr+2TICFP5I7kPUqyeamXNyXsnmsPwBSo5T
        UGCMHI+e2dkqkjfGgNiGwBNTQAi8viGusLeO
X-Google-Smtp-Source: ABdhPJxnf2p7/7jIa5LrKasySq737CXPpzkhbrROQqeWGNd+jJArY7j2Vhv5EdFT0fhauh2j0pcoHg==
X-Received: by 2002:adf:fa0b:: with SMTP id m11mr6781251wrr.152.1639498617427;
        Tue, 14 Dec 2021 08:16:57 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id a9sm295116wrt.66.2021.12.14.08.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 08:16:57 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     mchehab@kernel.org, hverkuil@xs4all.nl, gregkh@linuxfoundation.org
Cc:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, mjpeg-users@lists.sourceforge.net,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v4 14/18] staging: media: zoran: calculate the right buffer number for zoran_reap_stat_com
Date:   Tue, 14 Dec 2021 16:16:32 +0000
Message-Id: <20211214161636.1886900-15-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214161636.1886900-1-clabbe@baylibre.com>
References: <20211214161636.1886900-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On the case tmp_dcim=1, the index of buffer is miscalculated.
This generate a NULL pointer dereference later.

So let's fix the calcul and add a check to prevent this to reappear.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/staging/media/zoran/zoran_device.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/zoran_device.c b/drivers/staging/media/zoran/zoran_device.c
index 5b12a730a229..294e459307c3 100644
--- a/drivers/staging/media/zoran/zoran_device.c
+++ b/drivers/staging/media/zoran/zoran_device.c
@@ -814,7 +814,7 @@ static void zoran_reap_stat_com(struct zoran *zr)
 		if (zr->jpg_settings.tmp_dcm == 1)
 			i = (zr->jpg_dma_tail - zr->jpg_err_shift) & BUZ_MASK_STAT_COM;
 		else
-			i = ((zr->jpg_dma_tail - zr->jpg_err_shift) & 1) * 2 + 1;
+			i = ((zr->jpg_dma_tail - zr->jpg_err_shift) & 1) * 2;
 
 		stat_com = le32_to_cpu(zr->stat_com[i]);
 		if ((stat_com & 1) == 0) {
@@ -826,6 +826,11 @@ static void zoran_reap_stat_com(struct zoran *zr)
 		size = (stat_com & GENMASK(22, 1)) >> 1;
 
 		buf = zr->inuse[i];
+		if (!buf) {
+			spin_unlock_irqrestore(&zr->queued_bufs_lock, flags);
+			pci_err(zr->pci_dev, "No buffer at slot %d\n", i);
+			return;
+		}
 		buf->vbuf.vb2_buf.timestamp = ktime_get_ns();
 
 		if (zr->codec_mode == BUZ_MODE_MOTION_COMPRESS) {
-- 
2.32.0

