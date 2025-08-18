Return-Path: <linux-media+bounces-40193-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82FFCB2B2A3
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 22:42:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 99AEA7B658A
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 20:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B172F2737FB;
	Mon, 18 Aug 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="QIXwreJm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976DB224AEF;
	Mon, 18 Aug 2025 20:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549743; cv=none; b=nKRxfep0tck0u+gMfTYmE+EQgUTAjH2iJdUoDdHrJtm8TCNoHm2hoVUqLzoZxd1GZGFbKTNMfr4Bsg9PaUs69eoJ1SksLrXxjLUd1hWdH6yKlgDwv244kizyKPSFOuNWGAZLWf0wkJv/qnwV0ac3TEv9rRlmKLh5CJL9CGllM1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549743; c=relaxed/simple;
	bh=LBuYHRWyxVZ3a+UY4uT8bKRYbgMZALyyAbUztdfCWoo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aIq/D+nUQc5mWr/VDlKi+ykS8Y/x51Bf7qg+zVeCOXCgp679rS4ZNAUB6RqjC1gV5AdmrOl4Kf3JFeo7zlped513A0RYpwXMTuQmT3yCt8Oh23NzI5c38Il6Fy3pP2HO4GLSkE6eYMhMx7qiHwJUA9OfxJIeuqmc5z4gNb6jiBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=QIXwreJm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 33AC11116;
	Mon, 18 Aug 2025 22:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755549680;
	bh=LBuYHRWyxVZ3a+UY4uT8bKRYbgMZALyyAbUztdfCWoo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QIXwreJm5CBY9Ag/l5oHA2TK+Qb4eq/7dEstccJksFvL5maufWkwr3RGfGqrw9fws
	 olHofxH8nM4uNMIa4crnvnU8jjJxdQeIdusFU/uZ7JEjKHDvbPNCUl1TKExTid9woC
	 SodJs5/C/IMUmnbsyhv7wn2twEln0ySVNAPCYIVk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 18 Aug 2025 22:39:36 +0200
Subject: [PATCH v3 1/2] media: cx18: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-cx18-v4l2-fh-v3-1-5e2f08f3cadc@ideasonboard.com>
References: <20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com>
In-Reply-To: <20250818-cx18-v4l2-fh-v3-0-5e2f08f3cadc@ideasonboard.com>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6124;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LBuYHRWyxVZ3a+UY4uT8bKRYbgMZALyyAbUztdfCWoo=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoo5AlKWzGYPVi4myf9GQ2sdnnyQCxQP8ak84aS
 /8Zamz81SaJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKOQJQAKCRByNAaPFqFW
 PGD1EAC/I9JoxOU9aaLpvPI2NrZqVcyA1uvwL7q7nYL5T5I9br9BQWo8GbZsPemi0fSAPSXI9mm
 4uuDJAmxcNPsBqHhAkfc9GP2jfmoc6BSYo8+0/X2ffJ4q1oeIV43Dbr+L+YWSNndfFL4cMYzGmJ
 4K8ENWInrpPyfYkxfenYh+i5/pUodU+ULPenSp3WQ/xWZXzXLmrRAa+u1cw/6F0/3V8wH6ZPqYm
 5QYbfsrKrWTDzgewKoBQ9rsTy3W6q41cD8tGwFI59kHYUkXoCSBGfJnjAk9UouNEZePsKREUQzg
 D+7I/QO39kmuyFX22QlViCmuninTLOs+NAx0ANn7iElKX7v+w7nkAXoWa3TQ5LiydKXlhYz/6O6
 40gOYd4Bds1YEZbV0R/WTOo03a+ecUMtREaNX6Wa9M9Szfe9tL9LibcWX4TymlfdrJFg33BvgEt
 RR9PhxQm/wtWSQD6+jGAc9Ash/cgdonym4Xoy7WnKVoqi5T4nMpgnjCT8/tLPadT1IKnjZmPQZg
 jBctcV50J2ZOsigisrzv+ddNaX2hPIOOBn207AivolIRKMqPoWGlpE9Ie/UrTWd4fBlrmv0k6d+
 IubSMtMxcx0UJfaltch4SgXrSVTqrrY08/EX0SRRMkjrvYVEzRSCUqgh9RsHghvNRdpWs4VNHkn
 kkl7Tlbfdg/Zk8w==
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
functions which accepts a cx18 pointer as first argument
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
 drivers/media/pci/cx18/cx18-driver.c |  9 +++------
 drivers/media/pci/cx18/cx18-ioctl.c  | 30 +++++++++++++++++++-----------
 drivers/media/pci/cx18/cx18-ioctl.h  |  8 +++++---
 3 files changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/media/pci/cx18/cx18-driver.c b/drivers/media/pci/cx18/cx18-driver.c
index 743fcc9613744bfc1edeffc51e908fe88520405a..cd84dfcefcf971a7adb9aac2bafb9089dbe0f33f 100644
--- a/drivers/media/pci/cx18/cx18-driver.c
+++ b/drivers/media/pci/cx18/cx18-driver.c
@@ -1136,11 +1136,8 @@ int cx18_init_on_first_open(struct cx18 *cx)
 	int video_input;
 	int fw_retry_count = 3;
 	struct v4l2_frequency vf;
-	struct cx18_open_id fh;
 	v4l2_std_id std;
 
-	fh.cx = cx;
-
 	if (test_bit(CX18_F_I_FAILED, &cx->i_flags))
 		return -ENXIO;
 
@@ -1220,14 +1217,14 @@ int cx18_init_on_first_open(struct cx18 *cx)
 
 	video_input = cx->active_input;
 	cx->active_input++;	/* Force update of input */
-	cx18_s_input(NULL, &fh, video_input);
+	cx18_do_s_input(cx, video_input);
 
 	/* Let the VIDIOC_S_STD ioctl do all the work, keeps the code
 	   in one place. */
 	cx->std++;		/* Force full standard initialization */
 	std = (cx->tuner_std == V4L2_STD_ALL) ? V4L2_STD_NTSC_M : cx->tuner_std;
-	cx18_s_std(NULL, &fh, std);
-	cx18_s_frequency(NULL, &fh, &vf);
+	cx18_do_s_std(cx, std);
+	cx18_do_s_frequency(cx, &vf);
 	return 0;
 }
 
diff --git a/drivers/media/pci/cx18/cx18-ioctl.c b/drivers/media/pci/cx18/cx18-ioctl.c
index bf16d36448f888d9326b5f4a8f9c8f0e13d0c3a1..6e869c43cbd520feb720a71d8eb2dd60c05b0ae9 100644
--- a/drivers/media/pci/cx18/cx18-ioctl.c
+++ b/drivers/media/pci/cx18/cx18-ioctl.c
@@ -521,10 +521,8 @@ static int cx18_g_input(struct file *file, void *fh, unsigned int *i)
 	return 0;
 }
 
-int cx18_s_input(struct file *file, void *fh, unsigned int inp)
+int cx18_do_s_input(struct cx18 *cx, unsigned int inp)
 {
-	struct cx18_open_id *id = file2id(file);
-	struct cx18 *cx = id->cx;
 	v4l2_std_id std = V4L2_STD_ALL;
 	const struct cx18_card_video_input *card_input =
 				cx->card->video_inputs + inp;
@@ -558,6 +556,11 @@ int cx18_s_input(struct file *file, void *fh, unsigned int inp)
 	return 0;
 }
 
+static int cx18_s_input(struct file *file, void *fh, unsigned int inp)
+{
+	return cx18_do_s_input(file2id(file)->cx, inp);
+}
+
 static int cx18_g_frequency(struct file *file, void *fh,
 				struct v4l2_frequency *vf)
 {
@@ -570,11 +573,8 @@ static int cx18_g_frequency(struct file *file, void *fh,
 	return 0;
 }
 
-int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf)
+int cx18_do_s_frequency(struct cx18 *cx, const struct v4l2_frequency *vf)
 {
-	struct cx18_open_id *id = file2id(file);
-	struct cx18 *cx = id->cx;
-
 	if (vf->tuner != 0)
 		return -EINVAL;
 
@@ -585,6 +585,12 @@ int cx18_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *v
 	return 0;
 }
 
+static int cx18_s_frequency(struct file *file, void *fh,
+			    const struct v4l2_frequency *vf)
+{
+	return cx18_do_s_frequency(file2id(file)->cx, vf);
+}
+
 static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 {
 	struct cx18 *cx = file2id(file)->cx;
@@ -593,11 +599,8 @@ static int cx18_g_std(struct file *file, void *fh, v4l2_std_id *std)
 	return 0;
 }
 
-int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
+int cx18_do_s_std(struct cx18 *cx, v4l2_std_id std)
 {
-	struct cx18_open_id *id = file2id(file);
-	struct cx18 *cx = id->cx;
-
 	if ((std & V4L2_STD_ALL) == 0)
 		return -EINVAL;
 
@@ -642,6 +645,11 @@ int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
 	return 0;
 }
 
+static int cx18_s_std(struct file *file, void *fh, v4l2_std_id std)
+{
+	return cx18_do_s_std(file2id(file)->cx, std);
+}
+
 static int cx18_s_tuner(struct file *file, void *fh, const struct v4l2_tuner *vt)
 {
 	struct cx18_open_id *id = file2id(file);
diff --git a/drivers/media/pci/cx18/cx18-ioctl.h b/drivers/media/pci/cx18/cx18-ioctl.h
index 221e2400fb3e2d817eaff7515fa89eb94f2d7f8a..7a42ac99312ab6502e1abe4f3d5c88c9c7f144f3 100644
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
+struct cx18;
+int cx18_do_s_std(struct cx18 *cx, v4l2_std_id std);
+int cx18_do_s_frequency(struct cx18 *cx, const struct v4l2_frequency *vf);
+int cx18_do_s_input(struct cx18 *cx, unsigned int inp);

-- 
2.50.1


