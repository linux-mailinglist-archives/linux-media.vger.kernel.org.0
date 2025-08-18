Return-Path: <linux-media+bounces-40146-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB90DB2A1DC
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 14:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8BC2E5E8127
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 12:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF07931B122;
	Mon, 18 Aug 2025 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cC36GTEf"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4916827B321;
	Mon, 18 Aug 2025 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755520837; cv=none; b=q8TWWvEMIQN+AFkVkJp0j/d6LIQIlf1pTfU1RKzbFiZkSvRMVavZ4Y7zt7WrwjDdJ+sbrk6wl42GLIVpifHgPKOnJXD2ibZI82W24+tPXmxi37eNG27Mo2JF0Ah5awZpbNCU1XqhNOUSvBNZkjVz/6yJMMxZLpM1AnvY968bv6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755520837; c=relaxed/simple;
	bh=UXuHFNNpX75v9q6w9S1wkqusy58/KWJyuSY9vtrWLJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPVcul2fiKbcN8YYPFFNTUHV7maHNbaoQW3bQ76+UnVlhyGuwTdbF8m5W5j0Q5npbnpeujgcJ7iViPULdO9eK/NZzbzP1qJbU1LYY7Q0YL6GLxLybcZiQEWI53jnDGsNApJ27I5YBEn5MhKRPB/AeBfBBFuIH5TIHmAkOtyQAWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cC36GTEf; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-51-68.net.vodafone.it [5.90.51.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46E592394;
	Mon, 18 Aug 2025 14:39:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755520776;
	bh=UXuHFNNpX75v9q6w9S1wkqusy58/KWJyuSY9vtrWLJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cC36GTEfQLBlaXtdlPis06LUn21yCYayrfrQPYWUN+KwUhIruO6J4OMQ3Eiyl/sZA
	 N9IHa2eqXAh8LKwzRhqKxh3PAz5Jqx9B+n5ZvF8a7VIt0DtvYZqLP35KiyIctFY1/g
	 uSKz4Wo+T9RYihZXOIjlonE5fE9RWCcKrGajkQuY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 18 Aug 2025 14:40:11 +0200
Subject: [PATCH 1/2] media: cx18: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-cx18-v4l2-fh-v1-1-6fe153760bce@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5781;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=UXuHFNNpX75v9q6w9S1wkqusy58/KWJyuSY9vtrWLJk=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBoox88dpgV7oL6jVe/M+/P38yw9OZNEqo/NdXOl
 7WQmk4lqO+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKMfPAAKCRByNAaPFqFW
 PCcEEACum65sXHfospA13RQavr3SzupFnAHpzuG/Uqe2kVU7UQu1GeQxLKOBPZgLfRIHtChDePE
 c2/affx0vfSO86eMeriA4gbmvzuaYk6mVFJLjKWpwX3R/KkbDZgGX9LQ3ie5HZVKWuPDqpBHXiV
 41ZaJDdMdaWVKnt2CmxMUkIMuw67woCH8HgWh5cMXsE5IpGs3L1ImyrL1TbKTtmRTnJhb+Vgogz
 9KcRJ4/fqBwtc0iXqA7kRVLE3QRTcK4G6kY9JzqdsqFszhfHLsXMusx0798NXF8l8mD3VRa6gMQ
 XWVfKSsqg45uu7/64V0UjZvD5MtIw2ykSqD1S4pLiOVbr/dOGwdogGcgfrEPqwFOLgVyOoaYlSG
 QAW53DV/gxBhKB/6A3lhZQpcnK1yz1DFisRgh/p53/c2aKli1XU0RPcESYGreGC18Xy2AguP5tD
 gGGbu/7OEC0HsX2xrawBJGOBWV36PDWyhSXeapuYvMNu2174K3RvxObopECkFJZH0/eGJv5I9Wk
 O16qajnF1u8aFENaxEmzyZUf0zj1/395Jk/hRoFMCZz126DswDewFe6PS/XitKkx4h5zQee8gNp
 43DzcTqur+QDbQErqzDOSr9Uede0JCQix15GtjfE9w0e7g/E6OMx6Vtt6t8FgMGilqLdcC8m/8q
 TUf7nSLCxXFXTcQ==
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


