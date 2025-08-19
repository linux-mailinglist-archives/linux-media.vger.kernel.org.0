Return-Path: <linux-media+bounces-40226-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42261B2BA2E
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:07:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C03AE1BA223B
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A2AA28488B;
	Tue, 19 Aug 2025 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iLUDcTIy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF9B26462E;
	Tue, 19 Aug 2025 07:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755587242; cv=none; b=K7cfNLdU4gwkoORP5q0/+QlrbstFxeTvlTAgFdW/NPEQw7JoV1wKMFGb10acVDQTeKo6MrSaBivbgJmmgb/TZWw+ePv3O85f93laFKefRmTelT9/7GbcwNJlovJQM8zGHTjUJQTfPvTEDkk4ba0yF70rxC5MokZq+DGZZbNPslU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755587242; c=relaxed/simple;
	bh=ETf/u4Lpdc3XNRyiJ8tnjtoa9Gna6lhRAGwNIvHZTk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d6tZy9PtVFKRUFqv23u9Rou5WK6viXlhq1pdcKldzfozx0TpyRemn0Y1con0hdp5egodDzmrljkM4h55RgMoEu4M1jr1P8APijf15VVe7dQrQ/2AfiRBA5puXu4oYilTiNYWzqGlWWnLqrLsm0sR2WHlO5tgWbVRWnWycVCbESU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iLUDcTIy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 437CFC6D;
	Tue, 19 Aug 2025 09:06:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755587181;
	bh=ETf/u4Lpdc3XNRyiJ8tnjtoa9Gna6lhRAGwNIvHZTk4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iLUDcTIyeMTco5Kikh2r+AdZoYZpVyq+9TUeMAizmGaJ+wQ/XazCscVqeAnO+TuF9
	 zkYi1wdbr3ve5L/6EEUnXkdUNX47flQwQTD0ROt81if8PsLw62ildFaHZU6ekFzRfD
	 lx/MqUgYtdTZNG/rcGwJj0LBwuKgWuV9DsomnLVk=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 19 Aug 2025 09:07:03 +0200
Subject: [PATCH v4 1/2] media: cx18: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-cx18-v4l2-fh-v4-1-9db1635d6787@ideasonboard.com>
References: <20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com>
In-Reply-To: <20250819-cx18-v4l2-fh-v4-0-9db1635d6787@ideasonboard.com>
To: Andy Walls <awalls@md.metrocast.net>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, stable@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6407;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=ETf/u4Lpdc3XNRyiJ8tnjtoa9Gna6lhRAGwNIvHZTk4=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopCKlgkVzauhx0nA8uFPQC3lBbSY3hJsRG576m
 NwkqcbbLN6JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKQipQAKCRByNAaPFqFW
 PFcDD/9VVNdjjVR+t8Kcr/E2UcYvMgSlmp8YjwOA4byzKCpSA21euTFU1wjxRO5sFlXoWmbtTL5
 Potr3H8QNW/Py1eHXQ8S8JwPbrq5XnoNSd57bAQE208QZljJo88m9iC8zAd+WnN9aMA4Wh7n9FK
 W8kQFy9vz0XdgK6vEk4V7xfjA5Y0JOl5uTuJXREDtkfca6bz+BmqJWmZ1EePfqxhlg9YKjjBnNJ
 TSA9xqtuw4vOKEfCiqwCkE6MnV7gmiRDRYaF51j08hamdgmdYgU4vJLxCEn6KACEFLTVsma8QCb
 lg+ypyC1Icd0weEvGSXZN17MunOlZNsNQDFr0bbYnL+9/BbnDRyNuknoUdBZTY3TlKRzOY5PCv1
 YiKddEOFfWvPu2JprUaICzTW8O1oenLzd8qzGm7pYrO74J/MaGlN6sBRM5MWyDEhn9jyvOWpQBv
 D50fPgX+KebYDgm3giFgeP/CUiyGK6CMuHAVmJkZisyYicZBK2g2tALtup98q0gTiOgxQwq/dsS
 u+ChIvSfJeN1AS7699APzL1yYLefnmfBE0PO1DKW5fFNZugJ+QZqRNfT+nkbH2WscT4yFVeBwSD
 BNk9KVIcdMkYpElMybjM7XSuHGVx/7wYjwq30DcT6nfmR+AdvS7eehAH1/iE+DHuI/zzP2RQM0n
 +RYhtyy9OMMVKWQ==
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

Fix this by moving the implementation of those ioctls to functions that
take a cx18 pointer instead of a file pointer, and turn the V4L2 ioctl
handlers into wrappers that get the cx18 from the file. When calling
from cx18_init_on_first_open(), pass the cx18 pointer directly. This
allows removing the fake fh in cx18_init_on_first_open().

The bug has been reported by Smatch:

--> 1223         cx18_s_input(NULL, &fh, video_input);
The patch adds a new dereference of "file" but some of the callers pass a
NULL pointer.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
Fixes: 7b9eb53e8591 ("media: cx18: Access v4l2_fh from file")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/stable/20250818-cx18-v4l2-fh-v1-1-6fe153760bce%40ideasonboard.com
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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


