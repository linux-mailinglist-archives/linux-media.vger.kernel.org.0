Return-Path: <linux-media+bounces-44439-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A8545BD9AC7
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 15:22:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2C8883556D9
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 13:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C792315D31;
	Tue, 14 Oct 2025 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EKKBqfE7"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE36B315767;
	Tue, 14 Oct 2025 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447993; cv=none; b=VbODWn/7XWSWZuWmOT8gVDv7vCEfJ1I2kauyMGLbdelUOIRsY7iCi9uHIImTUYGmgxKIWwEcP4WbvIQG9sGywks91u6ArUWCHl2GYIUcUtrRLioKQoN5ry+Vd17/QLEh4z4hiN77IGD0Q3Rdz8yDrSH5dsps5LzLviVi+5x7yEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447993; c=relaxed/simple;
	bh=4iNlYNbWJN2E2na5bqAS5fVIMurLHwzbEOZDnRERU14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PNjfHQzeP+pUtfWxuQR7hzcC4o2v07FWRPDMF+NX6+/PNTDBwjM3iIFe2jtSNx/uwkHF8ozf9l46GhFsXs2QSKNtKZsfx8yDsxPVdKVkfr+psRBmcjLF2TLrRUkoliOMv2Xk2awEfyXQdpXegQ/O6tmr1gh9OWrNoK6d5l8zTdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EKKBqfE7; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.182] (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4E3E8E70;
	Tue, 14 Oct 2025 15:18:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760447888;
	bh=4iNlYNbWJN2E2na5bqAS5fVIMurLHwzbEOZDnRERU14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EKKBqfE7Rnb0jL5Yp7i1B2eKzMbIagOxkKV187bHYYLhILI0sBEsLvdAywFY4NDXL
	 UJEAOC4rF1uXcrwlX2r5RaUQlZ0n9DApC6yxr85f4hxqdlv1XHTH7jA1ghMEBeho+R
	 DrkZVB6lYpIL8h2Y0mT144ME3jHVKjCyUnlOZE/c=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 14 Oct 2025 15:19:34 +0200
Subject: [PATCH for v6.18 v5 2/2] media: ivtv: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-cx18-v4l2-fh-v5-2-e09e64bc4725@ideasonboard.com>
References: <20251014-cx18-v4l2-fh-v5-0-e09e64bc4725@ideasonboard.com>
In-Reply-To: <20251014-cx18-v4l2-fh-v5-0-e09e64bc4725@ideasonboard.com>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6250;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=4iNlYNbWJN2E2na5bqAS5fVIMurLHwzbEOZDnRERU14=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBo7k3xRJmAePjC0rQxIUzcA0E48rke95GwMQ9qI
 K+WMokvn4eJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaO5N8QAKCRByNAaPFqFW
 PLIUD/0SyVT0AMZABE02uM/x5MoBmxeX6zU6pVNZ2YKd8Qx0spstAXHrTVUi2lKzemYtSa3W4lO
 z3htjTjG8xmaD3xjjI4fsPze1SSZWkHcTLpf6oDJsGBBgSwRXwBlFWr32jV2x177fRNaMk8kJth
 7gm+q2j69Ie19ISczTA7YFZeqlq3pgCkB6SO/8Qtz316COEwrsSwPXl/bQIhZxD3YUNBXNM+2ut
 WR8QxxF20djdSwk9OHBcvdm0siFwMBfjBDCie3/IeF1EGZ6Ha6igMRpdAALESE3AwP/VJzTT49j
 yawBnHTM2n966y5aZla08JRj4i8+zHlJES5g5QmfCbzLDirnzAHy53efFEflFjNIJowspPlY2M4
 7r98a32eUpaFQ11r6BovL0LP7Cab8kJPXXAZ17fTkXmZeS9FBv4/6zUKk+FMLeN9RzapfzTLn8p
 GqJYSYw9N1SpqRtFoSCIlgqUozB3xYI0QbMnX6yTwHBOStB1XluFgKwUpbKwTiG+fzidri4COR4
 5XlbDiWLeRRu8x1uS7PfnQXXeDRrorRlXRoIBJL6RBX6fusQhyt2XQF3GlG1SupanyP28we8eXB
 oGMfcAAPVVOjz/uHJOGiCqTVv+BsG6zHyt8lo8lSbhmTzdsMqmi/RInXVBvqVFg1lgc7eQ4UtV9
 9g/zP1bgGXYPdIw==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B

Since commit 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
all ioctl handlers have been ported to operate on the file * first
function argument.

The ivtv DVB layer calls ivtv_init_on_first_open() when the driver
needs to start streaming. This function calls the s_input() and
s_frequency() ioctl handlers directly, but being called from the driver
context, it doesn't have a valid file * to pass them. This causes the
ioctl handlers to deference an invalid pointer.

Fix this by moving the implementation of those ioctls to two helper
functions.

The ivtv_do_s_input() helper accepts a struct ivtv * as first argument,
which is easily accessible in ivtv_init_on_first_open() as well as from
the file * argument of the ioctl handler.

The ivtv_s_frequency() takes an ivtv_stream * instead. The stream * can
safely be accessed in ivtv_init_on_first_open() where it is hard-coded
to the IVTV_ENC_STREAM_TYPE_MPG stream type, as well as from the ioctl
handler as a valid stream type is associated to each open file handle
depending on which video device node has been opened in the ivtv_open()
file operation.

The bug has been reported by Smatch.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
Fixes: 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
Cc: stable@vger.kernel.org
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/ivtv/ivtv-driver.c | 11 ++++-------
 drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
 drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index 72a8f76a41f45091fdd4fe0335ecb828d555eb9c..459eb6cc370cc078a464d4f40659772ed650e128 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -1247,15 +1247,12 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 
 int ivtv_init_on_first_open(struct ivtv *itv)
 {
-	struct v4l2_frequency vf;
 	/* Needed to call ioctls later */
-	struct ivtv_open_id fh;
+	struct ivtv_stream *s = &itv->streams[IVTV_ENC_STREAM_TYPE_MPG];
+	struct v4l2_frequency vf;
 	int fw_retry_count = 3;
 	int video_input;
 
-	fh.itv = itv;
-	fh.type = IVTV_ENC_STREAM_TYPE_MPG;
-
 	if (test_bit(IVTV_F_I_FAILED, &itv->i_flags))
 		return -ENXIO;
 
@@ -1297,13 +1294,13 @@ int ivtv_init_on_first_open(struct ivtv *itv)
 
 	video_input = itv->active_input;
 	itv->active_input++;	/* Force update of input */
-	ivtv_s_input(NULL, &fh, video_input);
+	ivtv_do_s_input(itv, video_input);
 
 	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
 	   in one place. */
 	itv->std++;		/* Force full standard initialization */
 	itv->std_out = itv->std;
-	ivtv_s_frequency(NULL, &fh, &vf);
+	ivtv_do_s_frequency(s, &vf);
 
 	if (itv->card->v4l2_capabilities & V4L2_CAP_VIDEO_OUTPUT) {
 		/* Turn on the TV-out: ivtv_init_mpeg_decoder() initializes
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 84c73bd22f2daf405ba5ef98894b98d40e5c7cf2..8d5ea3aec06f3dcb36ba4f52c9a8d621511d5c10 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -974,9 +974,8 @@ static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
+int ivtv_do_s_input(struct ivtv *itv, unsigned int inp)
 {
-	struct ivtv *itv = file2id(file)->itv;
 	v4l2_std_id std;
 	int i;
 
@@ -1017,6 +1016,11 @@ int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
 	return 0;
 }
 
+static int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
+{
+	return ivtv_do_s_input(file2id(file)->itv, inp);
+}
+
 static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
 {
 	struct ivtv *itv = file2id(file)->itv;
@@ -1065,10 +1069,9 @@ static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *
 	return 0;
 }
 
-int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
+int ivtv_do_s_frequency(struct ivtv_stream *s, const struct v4l2_frequency *vf)
 {
-	struct ivtv *itv = file2id(file)->itv;
-	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
+	struct ivtv *itv = s->itv;
 
 	if (s->vdev.vfl_dir)
 		return -ENOTTY;
@@ -1082,6 +1085,15 @@ int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 	return 0;
 }
 
+static int ivtv_s_frequency(struct file *file, void *fh,
+			    const struct v4l2_frequency *vf)
+{
+	struct ivtv_open_id *id = file2id(file);
+	struct ivtv *itv = id->itv;
+
+	return ivtv_do_s_frequency(&itv->streams[id->type], vf);
+}
+
 static int ivtv_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
 	struct ivtv *itv = file2id(file)->itv;
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.h b/drivers/media/pci/ivtv/ivtv-ioctl.h
index 7f8c6f43d397f050a8116429db7a9a7accc0336b..96ca7e2ef973f72c4655726a854a5a6ac24be83b 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.h
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.h
@@ -9,6 +9,8 @@
 #ifndef IVTV_IOCTL_H
 #define IVTV_IOCTL_H
 
+struct ivtv;
+
 u16 ivtv_service2vbi(int type);
 void ivtv_expand_service_set(struct v4l2_sliced_vbi_format *fmt, int is_pal);
 u16 ivtv_get_service_set(struct v4l2_sliced_vbi_format *fmt);
@@ -17,7 +19,7 @@ int ivtv_set_speed(struct ivtv *itv, int speed);
 void ivtv_set_funcs(struct video_device *vdev);
 void ivtv_s_std_enc(struct ivtv *itv, v4l2_std_id std);
 void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std);
-int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
-int ivtv_s_input(struct file *file, void *fh, unsigned int inp);
+int ivtv_do_s_frequency(struct ivtv_stream *s, const struct v4l2_frequency *vf);
+int ivtv_do_s_input(struct ivtv *itv, unsigned int inp);
 
 #endif

-- 
2.51.0


