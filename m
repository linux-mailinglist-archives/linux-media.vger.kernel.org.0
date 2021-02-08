Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F245C313C07
	for <lists+linux-media@lfdr.de>; Mon,  8 Feb 2021 19:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232851AbhBHSAZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Feb 2021 13:00:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:46608 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235139AbhBHR7r (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Feb 2021 12:59:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id CE2B664EC6;
        Mon,  8 Feb 2021 17:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612807105;
        bh=Ft3y2cLhvPeVJQjkVPy7g6U6CuC59Gkyu2Hc4IHrVII=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iLL2rT37ISD+WSmUU/0KprA4MHeGxckp+cvjbu88UCXzRYx1fq1J+CyMPdfjLZQYA
         hUTE+W1GoeQQPJW3BL+Q8i4q/ACTfXX5JvFXU/baAYIUnOQGhBZVKj1uXJsEe3vxX0
         9iv3BUR7qGEtHy/BeENibVpYrlbg3iR9YRH6kres811QetnG5yKZiWYnUvvPh91k/c
         CynAAGDQ8NscXHgEoaenaqyUmws7LYlckZOjuQuhu9LShuA3ZHnUbEx3sc0tFfuV+D
         rDpo+spvvxEuxpFpVQuP/cbTf5EeUWNqrlSt2MzB1WiISu9V36fTi1FKoK52Fwxi3s
         bH7ChHgf1YhJQ==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sasha Levin <sashal@kernel.org>, linux-media@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: [PATCH AUTOSEL 5.10 14/36] media: rkisp1: uapi: change hist_bins array type from __u16 to __u32
Date:   Mon,  8 Feb 2021 12:57:44 -0500
Message-Id: <20210208175806.2091668-14-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210208175806.2091668-1-sashal@kernel.org>
References: <20210208175806.2091668-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

[ Upstream commit 31f190e0ccac8b75d33fdc95a797c526cf9b149e ]

Each entry in the array is a 20 bits value composed of 16 bits unsigned
integer and 4 bits fractional part. So the type should change to __u32.
In addition add a documentation of how the measurements are done.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/rkisp1/uapi/rkisp1-config.h | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
index 432cb6be55b47..c19fe059c2442 100644
--- a/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
+++ b/drivers/staging/media/rkisp1/uapi/rkisp1-config.h
@@ -848,13 +848,18 @@ struct rkisp1_cif_isp_af_stat {
 /**
  * struct rkisp1_cif_isp_hist_stat - statistics histogram data
  *
- * @hist_bins: measured bin counters
+ * @hist_bins: measured bin counters. Each bin is a 20 bits unsigned fixed point
+ *	       type. Bits 0-4 are the fractional part and bits 5-19 are the
+ *	       integer part.
  *
- * Measurement window divided into 25 sub-windows, set
- * with ISP_HIST_XXX
+ * The window of the measurements area is divided to 5x5 sub-windows. The
+ * histogram is then computed for each sub-window independently and the final
+ * result is a weighted average of the histogram measurements on all
+ * sub-windows. The window of the measurements area and the weight of each
+ * sub-window are configurable using struct @rkisp1_cif_isp_hst_config.
  */
 struct rkisp1_cif_isp_hist_stat {
-	__u16 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
+	__u32 hist_bins[RKISP1_CIF_ISP_HIST_BIN_N_MAX];
 };
 
 /**
-- 
2.27.0

