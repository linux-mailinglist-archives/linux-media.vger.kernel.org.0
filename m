Return-Path: <linux-media+bounces-14171-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 548EE917F31
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 13:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FE2B2830DE
	for <lists+linux-media@lfdr.de>; Wed, 26 Jun 2024 11:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3A017DE11;
	Wed, 26 Jun 2024 11:07:53 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF1D1662E5
	for <linux-media@vger.kernel.org>; Wed, 26 Jun 2024 11:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719400072; cv=none; b=HRkSgtAvyvdwLLpL1JEcyH8uqgX2PRDeIGYzCjnpTe+FSzQWoR+BygtjUAqxih4B3+9fBsSVv/KprJFUsyRpn8yxTWVxyM5SE35JpXKFt9tiuKCQ0dcOdldFUf9VaGUnE0v6WEkVsQV5sbmI+LmmkvsMRJbuhH8dpVxakQK0XSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719400072; c=relaxed/simple;
	bh=fajkYxrxr69I/HqeB1GmmSmi7BGy8oxNMUMgL3D/1hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TRZY5qkeeIcubrRgcXgbFfyZTuHbQSncljNbNZsa2Bo3TlHi+1uyrsfAPIOXWomuGrfI92WpClwJMIdHs+Bwdgy2DktY9oG+hKriD5v3UNr+uZqlDd810R0B1tsZPvkmeo+W7O4ccMawsOhMD9whDPpCUCwVqMmqkzwsY3W9pRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE14C2BD10;
	Wed, 26 Jun 2024 11:07:51 +0000 (UTC)
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 2/2] media: vivid: fix CREATE_BUFS support in queue_setup()
Date: Wed, 26 Jun 2024 13:06:17 +0200
Message-ID: <14494d176bc5c722f42b5824083b70706d39df44.1719399977.git.hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1719399977.git.hverkuil-cisco@xs4all.nl>
References: <cover.1719399977.git.hverkuil-cisco@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While queue_setup was correct for CREATE_BUFS support for
video devices, for VBI, SDR and touch devices it was wrong.

This was found after adding new v4l2-compliance tests.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/test-drivers/vivid/vivid-sdr-cap.c   | 7 ++++++-
 drivers/media/test-drivers/vivid/vivid-touch-cap.c | 6 +++---
 drivers/media/test-drivers/vivid/vivid-vbi-cap.c   | 2 ++
 drivers/media/test-drivers/vivid/vivid-vbi-out.c   | 2 ++
 4 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
index a81f26b76988..38cda33dffb2 100644
--- a/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-sdr-cap.c
@@ -219,8 +219,13 @@ static int sdr_cap_queue_setup(struct vb2_queue *vq,
 		       unsigned sizes[], struct device *alloc_devs[])
 {
 	/* 2 = max 16-bit sample returned */
-	sizes[0] = SDR_CAP_SAMPLES_PER_BUF * 2;
+	u32 size = SDR_CAP_SAMPLES_PER_BUF * 2;
+
+	if (*nplanes)
+		return sizes[0] < size ? -EINVAL : 0;
+
 	*nplanes = 1;
+	sizes[0] = size;
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-touch-cap.c b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
index 3888c21b4d0c..3600b084bca5 100644
--- a/drivers/media/test-drivers/vivid/vivid-touch-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-touch-cap.c
@@ -17,13 +17,13 @@ static int touch_cap_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	unsigned int size = f->sizeimage;
 
 	if (*nplanes) {
-		if (sizes[0] < size)
+		if (*nplanes != 1)
 			return -EINVAL;
-	} else {
-		sizes[0] = size;
+		return sizes[0] < size ? -EINVAL : 0;
 	}
 
 	*nplanes = 1;
+	sizes[0] = size;
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
index 3840b3a664ac..95387d57eb93 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
@@ -132,6 +132,8 @@ static int vbi_cap_queue_setup(struct vb2_queue *vq,
 	if (!vivid_is_sdtv_cap(dev))
 		return -EINVAL;
 
+	if (*nplanes)
+		return sizes[0] < size ? -EINVAL : 0;
 	sizes[0] = size;
 
 	*nplanes = 1;
diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-out.c b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
index 434a10676417..871a56d93425 100644
--- a/drivers/media/test-drivers/vivid/vivid-vbi-out.c
+++ b/drivers/media/test-drivers/vivid/vivid-vbi-out.c
@@ -28,6 +28,8 @@ static int vbi_out_queue_setup(struct vb2_queue *vq,
 	if (!vivid_is_svid_out(dev))
 		return -EINVAL;
 
+	if (*nplanes)
+		return sizes[0] < size ? -EINVAL : 0;
 	sizes[0] = size;
 
 	*nplanes = 1;
-- 
2.43.0


