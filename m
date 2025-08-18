Return-Path: <linux-media+bounces-40151-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA23B2A3C2
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BC353AEADD
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A349320CBC;
	Mon, 18 Aug 2025 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iDGDG/2H"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9001F3FC8;
	Mon, 18 Aug 2025 13:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522409; cv=none; b=MFyXAFLAWpTXF8PmdlWoFbxUtg8c2F5Hn0o/fgE6wQnsI6UJgb2pQ8QtA7xZLOI9dGU9TKnZ4zqOxP9uanEcBapjBzQjr7bwpaVynEB5LNpWs8sXIYfSzuVMh/Gi8n6HvMprDYfRUeObEQE5Q95i3UaFB+Eo6YTCkBHFU6J6hDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522409; c=relaxed/simple;
	bh=osIZ6hBOTw+rG2nHY+q+BADzbDl7k1HnQWvjmYS8OVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fW3mHoZ0f19sbOX+Ss23oZvxzamaVevEVuH1632/J6J6V8WucaOA9u3uZrgN8cviOnLCyjYhW0RC9YOD4FnSYAggC9u1mA2oGT4i3SVTj2wks2vEkJb1mNeW/K8QCHAPGhF8Zjg/vm2OOKtsbltf7fmjY8gTbkhvbHn9+4DdrnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iDGDG/2H; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-51-68.net.vodafone.it [5.90.51.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 651A417D1;
	Mon, 18 Aug 2025 15:05:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755522349;
	bh=osIZ6hBOTw+rG2nHY+q+BADzbDl7k1HnQWvjmYS8OVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iDGDG/2HcUF6W5AIQFSnRmesGbGUo7319BEx3lozmOXyW8h1Qe3Dp49hajSBTJ6mG
	 XlMDDyP+E6gsTARbhtDcF0Ql9y66uRNRaHt4Vcxv4cceBRSFYBYzEw5pDX7GPX3lwI
	 pDmWQHhuShv7QiP5Ut7FalcMuSEYF3tdGZOU76F4=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 18 Aug 2025 15:06:35 +0200
Subject: [PATCH v2 1/2] media: cx18: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-cx18-v4l2-fh-v2-1-3f53ce423663@ideasonboard.com>
References: <20250818-cx18-v4l2-fh-v2-0-3f53ce423663@ideasonboard.com>
In-Reply-To: <20250818-cx18-v4l2-fh-v2-0-3f53ce423663@ideasonboard.com>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5809;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=osIZ6hBOTw+rG2nHY+q+BADzbDl7k1HnQWvjmYS8OVo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBooyVjd8/T0hLA/UkjB4r49FoROHia35fJ/dZKi
 DI9zAdlhgGJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKMlYwAKCRByNAaPFqFW
 PHQjD/4il89fAALt+TT60ih1a7cpgFAlqMSOCCrKBSVhlHdZHXtw3S8IN12bu4UgVhFPhMYN8et
 9R5qngdXl3Um7/UzQrBmqWf/vju8ktqhAb/Q1GBRJwkqmB/8AmHh0m1YgpNiWPuy7NOnD4O/mJ+
 Rz2x7xCGqsflDaIgxqPoe1iySkgZM+0oJ8nLpuh4MHJpqG9NjYJlgQQFo8kXZY37JRM2+N8H34x
 wfdUJKAfI2I3WXLKtCtL7GTzcGSsXdKPzQBTg7O+4kYgSiYJBfssNiBXUlf+K7xyy9azgXp7+yg
 2NjAcGZwROE5UAu1UcdVytjk/U/Kb3+gdvSaTDAC5HvdvMvLprKbMGz3F3aucbHW6X2Pk+Mhgue
 4z7FT7Ai9iuWX+NPaDZseGr0paA+K8S06lcmI4jdiayHkYNnstG85bVHcxAnxVx/unxhtsrFHQc
 6iPHW86IwX3Fq0kRbFps2BIj0PcQPcA7PMf20bk7wqLnXWS7LIVtRUj7U5tg1lt+iRewJNiUI86
 mwe3DlLdibtHTN5EV9rbSFhNSX3OPEC1P3mMvzCcAKxc0HXakwk9O9iEuHYLXZo9HdmZw4nVTSY
 crDOh2Emgyhwp/c+tYyZbyXDTif4JG0p3ltA5NgS9L5GL45Rjp4eE+I7s3L9DijSTd/GMfNX/9c
 9irAu6CJKK28JEA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Sice commit 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
all ioctl handlers have been ported to operate on the file * first
function argument.

The cx18 DVB layer calls cx18_init_on_first_open() when the driver needs
to start streaming. This function calls the s_input(), s_std() and
s_frequency() ioctl handlers directly, but being called from the driver
context, it doesn't have a valid file * to pass them. This causes
the ioctl handlers to deference an invalid pointer.

Fix this by wrapping the ioctl handlers implementation in helper
functions which accepts a cx18_open_id pointer as first argument
and make the cx18_init_on_first_open() function call the helpers
without going through the ioctl handlers.

The bug has been reported by Smatch:

--> 1223         cx18_s_input(NULL, &fh, video_input);
The patch adds a new dereference of "file" but some of the callers pass a
NULL pointer.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
Fixes: 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
Cc: stable@vger.kernel.org
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/cx18/cx18-driver.c |  6 +++---
 drivers/media/pci/cx18/cx18-ioctl.c  | 26 ++++++++++++++++++++------
 drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
 3 files changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index 743fcc9613744bfc1edeffc51e908fe88520405a..e1798850ff78a50d7930148622c87d9303033c45 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -1220,14 +1220,14 @@ int cx18_init_on_first_open(struct cx18 *cx)
 
 	video_input = cx->active_input;
 	cx->active_input++;	/* Force update of input */
-	cx18_s_input(NULL, &fh, video_input);
+	cx18_do_s_input(&fh, video_input);
 
 	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
 	   in one place. */
 	cx->std++;		/* Force full standard initialization */
 	std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
-	cx18_s_std(NULL, &fh, std);
-	cx18_s_frequency(NULL, &fh, &vf);
+	cx18_do_s_std(&fh, std);
+	cx18_do_s_frequency(&fh, &vf);
 	return 0;
 }
 
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index bf16d36448f888d9326b5f4a8f9c8f0e13d0c3a1..507df0d885e0dd2df7446aaef9e066592496d215 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -521,9 +521,8 @@ static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-int cx18_s_input(struct file *file, void *fh, unsigned int inp)
+int cx18_do_s_input(struct cx18_open_id *id, unsigned int inp)
 {
-	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 	v4l2_std_id std = V4L2_STD_ALL;
 	const struct cx18_card_video_input *card_input =
@@ -558,6 +557,11 @@ int cx18_s_input(struct file *file, void *fh, unsigned int inp)
 	return 0;
 }
 
+static int cx18_s_input(struct file *file, void *fh, unsigned int inp)
+{
+	return cx18_do_s_input(file2id(file), inp);
+}
+
 static int cx18_g_frequency(struct file *file, void *fh,
 				struct v4l2_frequency *vf)
 {
@@ -570,9 +574,9 @@ static int cx18_g_frequency(struct file *file, void *fh,
 	return 0;
 }
 
-int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
+int cx18_do_s_frequency(struct cx18_open_id *id,
+			const struct v4l2_frequency *vf)
 {
-	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	if (vf->tuner != 0)
@@ -585,6 +589,12 @@ int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 	return 0;
 }
 
+static int cx18_s_frequency(struct file *file, void *fh,
+			    const struct v4l2_frequency *vf)
+{
+	return cx18_do_s_frequency(file2id(file), vf);
+}
+
 static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -593,9 +603,8 @@ static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 	return 0;
 }
 
-int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
+int cx18_do_s_std(struct cx18_open_id *id, v4l2_std_id std)
 {
-	struct cx18_open_id *id = file2id(file);
 	struct cx18 *cx = id->cx;
 
 	if ((std & V4L2_STD_ALL) == 0)
@@ -642,6 +651,11 @@ int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
 	return 0;
 }
 
+static int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
+{
+	return cx18_do_s_std(file2id(file), std);
+}
+
 static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
 {
 	struct cx18_open_id *id = file2id(file);
diff --git a/drivers/media/pci/cx18/cx18-ioctl.h b/drivers/media/pci/cx18/cx18-ioctl.h
index 221e2400fb3e2d817eaff7515fa89eb94f2d7f8a..bd0e6e5ac4e4a66f747789fd45b1d026c6905601 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.h
+++ b/drivers/media/pci/cx18/cx18-ioctl.h
@@ -12,6 +12,8 @@ u16 cx18_service2vbi(int type);
 void cx18_expand_service_set(struct v4l2_sliced_vbi_format *fmt, int is_pal);
 u16 cx18_get_service_set(struct v4l2_sliced_vbi_format *fmt);
 void cx18_set_funcs(struct video_device *vdev);
-int cx18_s_std(struct file *file, void *fh, v4l2_std_id std);
-int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
-int cx18_s_input(struct file *file, void *fh, unsigned int inp);
+
+struct cx18_open_id;
+int cx18_do_s_std(struct cx18_open_id *id, v4l2_std_id std);
+int cx18_do_s_frequency(struct cx18_open_id *id, const struct v4l2_frequency *vf);
+int cx18_do_s_input(struct cx18_open_id *id, unsigned int inp);

-- 
2.50.1


