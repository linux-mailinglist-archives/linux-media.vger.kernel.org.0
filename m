Return-Path: <linux-media+bounces-48054-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6A8C9A917
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 514053A62EF
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:53:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04DEF303C8E;
	Tue,  2 Dec 2025 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pEyHp6Y/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 659CC303A38
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661973; cv=none; b=EldVQAw1q6L1iKu6WTGp8VijiSMFbF0ZXXRoCB53v/VN6kTyRZVxV2rppj0aKxVTL68qzgtitX9mJViDlycuzRbhCO8+ipqUNvqvZtpjYy1h3mcvXOJT+HiYHTfKrFUU2SV7WcZSXsmfJXZgUIJrm3bvlZkC2HeCyMjA7vUzAqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661973; c=relaxed/simple;
	bh=NOojYF3ov7MlW8j+GsHtt8ExAS7Di90lib2/vDODacY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jd5dXShjps+k2n7Y7n5JER1X+ZOgu6GclKQuEUc+OimiQpEgebMSNjpn/GYL63CcIFhEGWv3xXPhijFF44D+rZZ2oZ9wvfBoDuh8jQjvm2s7OVk1MkNkjZ8BTAnnL4mxnqv5uheIxVXFoMiAT0x/I11PYSGJ7CNN6sbsOZ4/B7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pEyHp6Y/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A6FC4CEF1;
	Tue,  2 Dec 2025 07:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661973;
	bh=NOojYF3ov7MlW8j+GsHtt8ExAS7Di90lib2/vDODacY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pEyHp6Y/AeHEK+ZliGNDuUSBh3DCUhuB2zBTpaEzi0Oi5MhSRgpuaVGgYVmu1bata
	 J+Fud+lrDkVV0COLaXAr/GdF2dF0UnsZOAdiaXnkmGeNp1B0ExlOG+l2SvHEf2le3G
	 iLVO4taBMvjseidsigww43hmyq7v7hT3lRLthypCvCpaXeBh6qF/3b5F07dSFpv7al
	 QUuvFGaw/PapY6X9GkqH4/MQ3SUy2EN05/E4wB4XIXcKqawg93oDaN5V3gkc+xD6ff
	 CrDx2vAEO05jxDGHDDQTlBb0Lcwlgbpjh6z4otwUFGltopEYZPagyavK9U2x8abqmw
	 F1OLDeoSlv4AA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 11/12] media: omap3isp: ispccp2: always clamp in ccp2_try_format()
Date: Tue,  2 Dec 2025 08:51:19 +0100
Message-ID: <fe684d54f094ef7510177ab4b12304bf5a446923.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If ccp2->input == CCP2_INPUT_NONE, then try_format didn't clamp
the width and height. This can happen with v4l2-compliance tests.

Always clamp.

This fixes this v4l2-compliance error:

	fail: v4l2-test-subdevs.cpp(171): fse.max_width == ~0U || fse.max_height == ~0U
	fail: v4l2-test-subdevs.cpp(270): ret && ret != ENOTTY
test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/ispccp2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/ispccp2.c b/drivers/media/platform/ti/omap3isp/ispccp2.c
index f4147c79639c..d668111b44f4 100644
--- a/drivers/media/platform/ti/omap3isp/ispccp2.c
+++ b/drivers/media/platform/ti/omap3isp/ispccp2.c
@@ -658,7 +658,7 @@ static void ccp2_try_format(struct isp_ccp2_device *ccp2,
 			fmt->height = clamp_t(u32, fmt->height,
 					      ISPCCP2_DAT_SIZE_MIN,
 					      ISPCCP2_DAT_SIZE_MAX);
-		} else if (ccp2->input == CCP2_INPUT_MEMORY) {
+		} else {
 			fmt->width = clamp_t(u32, fmt->width,
 					     ISPCCP2_LCM_HSIZE_COUNT_MIN,
 					     ISPCCP2_LCM_HSIZE_COUNT_MAX);
-- 
2.51.0


