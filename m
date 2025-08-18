Return-Path: <linux-media+bounces-40152-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17400B2A3CA
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 15:14:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EF391966D38
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 13:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FBFB321431;
	Mon, 18 Aug 2025 13:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I3X1bl1w"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C165320CBA;
	Mon, 18 Aug 2025 13:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755522411; cv=none; b=t/qUOaiu6i3DNVr4GP3rMF+MIyYbZMvyeSrzzqu7IDGNWDHjsfYWUchfN94ROHsQpyNFoYuqLBiHW0Vt1EPhirdvKFGnQLDYP5/blDQzjPqQtijwmkHrRj+I0J6y99RRYeGKYob6Hz6Ul17FmqAtCk7jy83LmYzE+8cM1rBdf4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755522411; c=relaxed/simple;
	bh=LxVHiBOsr25dNYOXjvzm0hSTV25ZEk7fNGwyFL4wrOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lW+BLL4Sj9qwIBlQ6gZ8J08IgLMUgVFJheCHqwxGopyq9+Q686z1jiBHht/lSD9+W23v+Tw/RceY4/iUod+/1MgYaXL9cyIQJqYzUoeXKYEhhKEYrgYG3F3oFc/ZY0KxmrWiK+BG0b4HDZfpXUjTsKyoMX8HbBmh8xm3RJgQ2bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I3X1bl1w; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.172] (mob-5-90-51-68.net.vodafone.it [5.90.51.68])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8E6CF2416;
	Mon, 18 Aug 2025 15:05:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755522350;
	bh=LxVHiBOsr25dNYOXjvzm0hSTV25ZEk7fNGwyFL4wrOY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I3X1bl1wYybCFs0xRAnk0nC44sedpL7gzAQ5AtjgfPu0xQiMQXKHY9NfqRAwDi0zX
	 ZvBAf927J1Vgu4exKRlQnH1mhseq3X6Sq3iUv4ikA6SZIj8x9N1OIhic2GzwzEL1xb
	 o02eEer+mHgwmD5ejAEvBXD9nYUbhwHMFUJsnQEs=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 18 Aug 2025 15:06:36 +0200
Subject: [PATCH v2 2/2] media: ivtv: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-cx18-v4l2-fh-v2-2-3f53ce423663@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4954;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=LxVHiBOsr25dNYOXjvzm0hSTV25ZEk7fNGwyFL4wrOY=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBooyVjWqa5MLaPbzPsnpHYEmG3s7SjfpVRx18Dh
 HGcfgKnNYOJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKMlYwAKCRByNAaPFqFW
 PGIpD/9UdI7SyVuH3+wLMACjJ0wEL+sVZ2hlq06Nc8p75iergEzkULhPgvuarQA6uU9Pgs5hhBe
 QAe1VQZZwxyqmG0g28cgsR3EKlpHkKpQELDCaY9OxSduj3sNZP8FjqF5ftfO5792S5rn/bOzQYs
 Tofrfu3ML2QY0/kHGt/AqyWQGhKFcRm9Qcb+tX/ShJ90gwHF62gsUbsCMYQEr67oBfmC7bc4bxX
 PSbna0/OFmKdea53kMlfus8Y505787iTe3xod1o8symwX3OldA5b8PxsgifYogov+DxAmWei7Dz
 6E3jT74R0EvNjVDlbhWV7Tn/RZfFH82PHlXilMqsizvWxgAm2zl22zMKidI1eaCPjWedz8Xj8YE
 P59UUkf7tz4hwGTRu+xfGsShggX1DiMrtLwk3DFRIhY80L87S7u2vCiiKBDMJ8roEb4vXvSsh5A
 nY9d3B6UubD3QM67iIUZF9uSUymaXJKlgGoXyut288jv+IoT0tTgoCSBjZ3IfnzYboWLOOaVw1k
 xAy7X99pSuYNyTR3vlf6mZNU7qdyx6NEgCxgonN+Vuxg3be/I8cVOpCleYu8b6v9TJzb1cr6ad9
 QUAQ73Xzc5pppkdXXk97vyz0S4c0Bz2L8zAVzguk48FIbEgKu8Xw/9+ddU7Khwe26D+Jzl528X2
 4h2Al/TxnlvEGig==
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
Cc: stable@vger.kernel.org
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


