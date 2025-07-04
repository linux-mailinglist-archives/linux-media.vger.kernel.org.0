Return-Path: <linux-media+bounces-36829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AEC7AF9169
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 13:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F8133A9DFD
	for <lists+linux-media@lfdr.de>; Fri,  4 Jul 2025 11:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AB122D0C77;
	Fri,  4 Jul 2025 11:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fFEHBi9S"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8B52C15B3;
	Fri,  4 Jul 2025 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628049; cv=none; b=Ti0IiekUeAFIiCxzseFd4pJvHMzRwP1j6WiFMW3A9ejJxlEBoJINNDece/ekLQBmdo424ni95aJ4IHzJ54eNSF55EfSWi+M89sHkcZhSqKdOj2WFET2kqB9aytrLY98XnDgMRB76IQEEto0aHHjmHRmvWvayVDvumDogjS0+FFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628049; c=relaxed/simple;
	bh=jw+zgL2BPEVCRnpnX1KB1D14FCp8WL8iiaWiUr/P14k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tpbUQWGu1a4vg8XZFiZdT2SwFRxwSUctHLcFYcNf1B1EYBCYTKWlvjH3TwO0S8TlvLYFRvzQpr7bwzo6vs0znfZ16imvJWZZ3CHXEy/M1zSHj6R0MZvKGvJ4WPMjFS/iXlDoplNuL3Zuyf0OjWGxLB2IdadGBz7MhXlJ3jSGcLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fFEHBi9S; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 823046DE;
	Fri,  4 Jul 2025 13:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751628017;
	bh=jw+zgL2BPEVCRnpnX1KB1D14FCp8WL8iiaWiUr/P14k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fFEHBi9SC/AuktiK+RehdwtboCWGFDlRWYoEpm+kYkwOPm0JJopQ09HLR1RO/wAtI
	 +mvMBEktxEPeSP9MEAVOdohfBWUfHyH+m+CWNofhiLxI9u9tNpaa3s44FwBHIKWUtb
	 IEdnpQ/+XKAC7N7B6GIZgY+Yq3dZ36i3btn60qvs=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 04 Jul 2025 12:20:19 +0100
Subject: [PATCH v3 2/5] media: v4l2-dev: Add helpers to run
 media_pipeline_[started|stopped]()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-ivc-v3-2-5c45d936ef2e@ideasonboard.com>
References: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
In-Reply-To: <20250704-ivc-v3-0-5c45d936ef2e@ideasonboard.com>
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 jacopo.mondi@ideasonboard.com, biju.das.jz@bp.renesas.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5162;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=jw+zgL2BPEVCRnpnX1KB1D14FCp8WL8iiaWiUr/P14k=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZ7kHVIG7/1HdVIE5qlCJlJeOL/z5g8m/TVe4i
 bDqg5xP65yJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGe5BwAKCRDISVd6bEV1
 Mu0rD/96VXL73CdVUeQfpZX2aU2FL7da5v6s9ldTwDLV2mIsHgZUhe5L7qy1VsPcShXGGwge0ZC
 8B0VAKNmSuyrULbLoDb6WCf86p+dbgZRAXUvuamzSisJUkbZg+szqOQvCC0MVx8ck0kEOORbgBI
 hiaPp4Uf3Nf7F6aDBmBgVdcPHvrvtMygryJ1CghKCoD+HmO4bBl+dBfI+kZaT6XEnKccRSCpI3T
 uq+SiK/8YXk77Z+vP+66WIDBvCF2ETSYZ2kEn183zjxF0BMZ0Eqaj7KR7EZuYhXcOClL4VA0IuX
 VSskfxbvj4OCrzS8sZOfymwYtnQM+u0zVr7TFXwwyTTPFp9d/NCKXuFGVTOVzktnTjKmwGK7Mda
 Qs56xZnLWrbS9dn6vvS9Vmmk40FIrkUDz27yavBFekdUOInzu3u279wt56IKt9ZMk1MNbZS7wfN
 o+MA9308pFsYt3sLW9FWFgzDSOR9TjeqFd64cMQ8I3PhbSyOSahhQ2mNZNsDqt280jTzzBo3ZP8
 jauSUPpAJK4gNYcv51Ok4kH63N8lsk9+03XuK0Mv77miI4uoZVjm2q6JeCwJY/6KD99EZjQ6/5y
 XxFNY8aIu8kZZr9oaJMjesvOIVzuJT6fiPIYax5/Kxg849Wx6m6oU/qhDtgyqL31vbYbcuHg6N2
 C4u/07EabHLfMrA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Add helpers to run the new media_pipeline_started() and
media_pipeline_stopped() functions. The helpers iterate over the
entities in the pipeline and count the number of video devices and
compare that to the pipeline's start_count() before acting. This
allows us to only run the media pipeline callbacks in the event that
the pipeline has had video_pipeline_start() called for each video
device.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>

---

We could take this further perhaps and include the equivalent routine
in video_device_pipeline[_alloc]_start()...if none of the entities
involved have .pipeline_started() or .pipeline_stopped() operations it
should be harmless, but I'm a bit reluctant to force the choice to run
those operations on users.

Changes in v2:

	- Adapted now media_pipeline_for_each_entity() takes an iter
	  variable
	- Fixed the Return: section of the kerneldoc comments
---
 drivers/media/v4l2-core/v4l2-dev.c | 57 ++++++++++++++++++++++++++++++++++++++
 include/media/v4l2-dev.h           | 36 ++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index c369235113d98ae26c30a1aa386e7d60d541a66e..f3309f8349664f7296a95216a40dd9d9baae8d9e 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1200,6 +1200,63 @@ struct media_pipeline *video_device_pipeline(struct video_device *vdev)
 }
 EXPORT_SYMBOL_GPL(video_device_pipeline);
 
+static int __video_device_pipeline_started(struct media_pipeline *pipe)
+{
+	struct media_pipeline_entity_iter iter;
+	unsigned int n_video_devices = 0;
+	struct media_entity *entity;
+	int ret;
+
+	ret = media_pipeline_entity_iter_init(pipe, &iter);
+	if (ret)
+		return ret;
+
+	media_pipeline_for_each_entity(pipe, &iter, entity) {
+		if (entity->obj_type == MEDIA_ENTITY_TYPE_VIDEO_DEVICE)
+			n_video_devices++;
+	}
+
+	media_pipeline_entity_iter_cleanup(&iter);
+
+	return n_video_devices - pipe->start_count;
+}
+
+int video_device_pipeline_started(struct video_device *vdev)
+{
+	struct media_pipeline *pipe;
+	int ret;
+
+	pipe = video_device_pipeline(vdev);
+	if (!pipe)
+		return -ENODEV;
+
+	ret = __video_device_pipeline_started(pipe);
+	if (ret)
+		return ret;
+
+	return media_pipeline_started(pipe);
+}
+EXPORT_SYMBOL_GPL(video_device_pipeline_started);
+
+int video_device_pipeline_stopped(struct video_device *vdev)
+{
+	struct media_pipeline *pipe;
+	int ret;
+
+	pipe = video_device_pipeline(vdev);
+	if (!pipe)
+		return -ENODEV;
+
+	ret = __video_device_pipeline_started(pipe);
+	if (ret)
+		return ret;
+
+	media_pipeline_stopped(pipe);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(video_device_pipeline_stopped);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 /*
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 1b6222fab24eda96cbe459b435431c01f7259366..26b4a491024701ef47320aec6a1a680149ba4fc3 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -654,6 +654,42 @@ __must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
  */
 struct media_pipeline *video_device_pipeline(struct video_device *vdev);
 
+/**
+ * video_device_pipeline_started - Run the pipeline_started() entity operation
+ *				   for a fully-started media pipeline
+ * @vdev: A video device that's part of the pipeline
+ *
+ * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
+ * connected to a given video device through enabled links have been marked as
+ * streaming through the use of video_device_pipeline_start() or one of its
+ * equivalent functions. If so, media_pipeline_started() is called to inform
+ * entities in the pipeline of that fact. The intention is to provide drivers
+ * with a shortcut for checking whether their pipeline is fully ready to start
+ * processing data.
+ *
+ * Return: The number of video devices in the pipeline remaining to be started,
+ * or a negative error number on failure.
+ */
+int video_device_pipeline_started(struct video_device *vdev);
+
+/**
+ * video_device_pipeline_stopped - Run the pipeline_stopped() entity operation
+ *				   for a fully-started media pipeline
+ * @vdev: A video device that's part of the pipeline
+ *
+ * This function checks whether all MEDIA_ENTITY_TYPE_VIDEO_DEVICE entities
+ * connected to a given video device through enabled links have been marked as
+ * streaming through the use of video_device_pipeline_start() or one of its
+ * equivalent functions. If so, media_pipeline_stopped() is called for each
+ * entity in the pipeline. The intention is to provide drivers with a shortcut
+ * for checking whether this video device is the first device in the pipeline
+ * to be stopped.
+ *
+ * Return: The number of video devices in the pipeline remaining to be started, or a
+ * negative error number on failure.
+ */
+int video_device_pipeline_stopped(struct video_device *vdev);
+
 #endif /* CONFIG_MEDIA_CONTROLLER */
 
 #endif /* _V4L2_DEV_H */

-- 
2.34.1


