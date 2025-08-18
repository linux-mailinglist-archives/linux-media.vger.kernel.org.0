Return-Path: <linux-media+bounces-40147-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44164B2A216
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995AE170C33
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 12:41:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41C9E31CA5C;
	Mon, 18 Aug 2025 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gmRvRENN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDE531984A;
	Mon, 18 Aug 2025 12:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520838; cv=none; b=qunm2PiuQnBPqoJlJoY0HWLZM6R24SncaX/Pn3snhOAH6rynl98acHM1ObHq6MgzxdhDO2sojsFTx7hhgE8nhjYLt/gkRbGQ+43kfTwul9qXIuEkdc2qrs5wTNfI73IOq8Bv7oGVFW31ZF80cc9NSvCEFHsLt5V8Fr3umuA/VgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520838; c=relaxed/simple;
	bh=BNXVbwMGm5fu04k6qHCLn60AFGLZaaVlGTtlALJIPzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TybDCWkXoLvVBe5TRQOcKWcksoS8keAbaoCPuy6zFd0A/1Rrd1dCH8frcEXn+jhQzY7dfzqhYiCSr55IX8fE7DD8CIHuFA5IYdTeRP05yAUJ6QdwmLR2QCIu5+Z3Hm0o7vuYuQradxf3dcHwJUDGWPzYeJVtl5yh0J+6UwaFaKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gmRvRENN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-51-68.net.vodafone.it [5.90.51.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 878262416;
	Mon, 18 Aug 2025 14:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755520777;
	bh=BNXVbwMGm5fu04k6qHCLn60AFGLZaaVlGTtlALJIPzQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gmRvRENNy/D7xLF/9QiZtAN3ZHS7tHZr+q1ahjybfMTq8LVfBGhZLL9X4jIAR3EnT
	 o7MLFOQtu1XiR8rmwyVSdxvZ5vFIzA4hyp86/x6vNPItwDkfZ+zl3s1lCLrvvmoNtR
	 iAjy73IBbNNtn9+W1D2nhznl8i1GGJuET6wIDcDU=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 18 Aug 2025 14:40:12 +0200
Subject: [PATCH 2/2] media: ivtv: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-cx18-v4l2-fh-v1-2-6fe153760bce@ideasonboard.com>
References: <20250818-cx18-v4l2-fh-v1-0-6fe153760bce@ideasonboard.com>
In-Reply-To: <20250818-cx18-v4l2-fh-v1-0-6fe153760bce@ideasonboard.com>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4926;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=BNXVbwMGm5fu04k6qHCLn60AFGLZaaVlGTtlALJIPzQ=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoox88c6zeKhSAFR/KiQVNRLv1/ovYY5TCE+mWr
 LdvJqfDwlmJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKMfPAAKCRByNAaPFqFW
 PI+wD/0RILKhfdNldYyfXZQEQOpt55dblJA0ON0aU8WolN9oCyzoeHQWoBk3ygbv5OiiUT+Gog2
 cfBzgFhiQjRFRr3hoKUI2Q4e+eDpGpaWsYKJOUrOXOmfOydyzZQ1kVTpeVMc0fIxFUcSd26FVfZ
 lfnuGnfrcCGmvFvUMoU9TA5JgBoCkjtFAttIll8Ut2DLvuMlBdtNK1OAlImr8Mby1YmC3snamSP
 biCIFA2mNwygYSizLKEuKUQp+OiD/d1B2T62lLD3yX7dJcGDgSfJe5hO0W2ZD5LILHs27oiVxii
 ZvJs3xPGVJY8gsZ9XmhQ2Arbpd74t6yeY93kLfSU/JqTrV97LiehcVj+GeWcbI8Z6XeL47M/8jl
 gDxyLYW2lWYsXUxNqgRYObdJl9ShAQrYfPqFDsfi+GrtUAZ+o9f7lQZHzad2CuE822BG4WcmN1S
 2pZOrykLFeg0t1wkaMX1ADU7kd3xz2ix3TVN8uRXm/OCGXiNiTvbbeu8l5A7fNzATT/TuJK/vlT
 TDbxa9kEN/OCQJZecEdQPaJZdaZHM/Cz+hQU1I1QGP1H92MLyDDD/mjBUdt+oSJe0TAiiqIu1Pi
 EpjLoeM82kaBJ1fP8jP0L7QNRUfWOsTMcaRNOXe7FSs7CDZ48e/m+Jr8F4oHyVLrA0Z5RyelhU8
 bDB4EtubCyL1Mcg==
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

Fix this by wrapping the ioctl handlers implementation in helper
functions which accepts a ivtv_open_id pointer as first argument
and make the ivtv_init_on_first_open() function call the helpers
without going through the ioctl handlers.

The bug has been reported by Smatch.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
Fixes: 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/ivtv/ivtv-driver.c |  4 ++--
 drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
 drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
 3 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index ecc20cd89926fe2ce4e472526a6b5fc0857615dd..bcbb03271047df9b127039759dbfefbaae67f9c3 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -1310,13 +1310,13 @@ int ivtv_init_on_first_open(struct ivtv *itv)
 
 	video_input = itv->active_input;
 	itv->active_input++;	/* Force update of input */
-	ivtv_s_input(NULL, &fh, video_input);
+	ivtv_do_s_input(&fh, video_input);
 
 	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
 	   in one place. */
 	itv->std++;		/* Force full standard initialization */
 	itv->std_out = itv->std;
-	ivtv_s_frequency(NULL, &fh, &vf);
+	ivtv_do_s_frequency(&fh, &vf);
 
 	if (itv->card->v4l2_capabilities & V4L2_CAP_VIDEO_OUTPUT) {
 		/* Turn on the TV-out: ivtv_init_mpeg_decoder() initializes
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.c b/drivers/media/pci/ivtv/ivtv-ioctl.c
index 8077a71d4850ec773caa20c3fca08f92f3117d69..ba1fce42a8d6d7d9a3779bfc9dfd310060e61103 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.c
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.c
@@ -974,9 +974,9 @@ static int ivtv_g_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
+int ivtv_do_s_input(struct ivtv_open_id *id, unsigned int inp)
 {
-	struct ivtv *itv = file2id(file)->itv;
+	struct ivtv *itv = id->itv;
 	v4l2_std_id std;
 	int i;
 
@@ -1017,6 +1017,11 @@ int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
 	return 0;
 }
 
+static int ivtv_s_input(struct file *file, void *fh, unsigned int inp)
+{
+	return ivtv_do_s_input(file2id(file), inp);
+}
+
 static int ivtv_g_output(struct file *file, void *fh, unsigned int *i)
 {
 	struct ivtv *itv = file2id(file)->itv;
@@ -1065,10 +1070,11 @@ static int ivtv_g_frequency(struct file *file, void *fh, struct v4l2_frequency *
 	return 0;
 }
 
-int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
+int ivtv_do_s_frequency(struct ivtv_open_id *id,
+			const struct v4l2_frequency *vf)
 {
-	struct ivtv *itv = file2id(file)->itv;
-	struct ivtv_stream *s = &itv->streams[file2id(file)->type];
+	struct ivtv *itv = id->itv;
+	struct ivtv_stream *s = &itv->streams[id->type];
 
 	if (s->vdev.vfl_dir)
 		return -ENOTTY;
@@ -1082,6 +1088,12 @@ int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 	return 0;
 }
 
+static int ivtv_s_frequency(struct file *file, void *fh,
+			    const struct v4l2_frequency *vf)
+{
+	return ivtv_do_s_frequency(file2id(file), vf);
+}
+
 static int ivtv_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
 	struct ivtv *itv = file2id(file)->itv;
diff --git a/drivers/media/pci/ivtv/ivtv-ioctl.h b/drivers/media/pci/ivtv/ivtv-ioctl.h
index 42c2516379fcbbd0640820ab0e3abe9bf00b57ea..7c91b8963b420761c2afcab1dece4d19a4ec0322 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.h
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.h
@@ -17,7 +17,9 @@ int ivtv_set_speed(struct ivtv *itv, int speed);
 void ivtv_set_funcs(struct video_device *vdev);
 void ivtv_s_std_enc(struct ivtv *itv, v4l2_std_id std);
 void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std);
-int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
-int ivtv_s_input(struct file *file, void *fh, unsigned int inp);
+
+struct ivtv_open_id;
+int ivtv_do_s_frequency(struct ivtv_open_id *id, const struct v4l2_frequency *vf);
+int ivtv_do_s_input(struct ivtv_open_id *id, unsigned int inp);
 
 #endif

-- 
2.50.1


