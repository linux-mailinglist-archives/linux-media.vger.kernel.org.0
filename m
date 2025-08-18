Return-Path: <linux-media+bounces-40194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EE6B2B2AB
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 22:43:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2901D7B6EAF
	for <lists+linux-media@lfdr.de>; Mon, 18 Aug 2025 20:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC6E224AEF;
	Mon, 18 Aug 2025 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Gi/16nbL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 479C927464F;
	Mon, 18 Aug 2025 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755549746; cv=none; b=jAnpig9AJvBSnXOz5atpCv90WvW9yQx+tj43F1t90nY8FijoMaE4FO15yNf+qe+MEpfK3shOobkdh+0zTxC+g0+r8A0RDBH1ZpzzRMmiYyN5Fwtrlc59gt9POc011IOBgL+wKvkSo9lAvJaE5GIOAkaXdlN95gZSHvy4cnIlzsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755549746; c=relaxed/simple;
	bh=pASaZZUa8G/kSzlS/eDqbEmaIuYle5Tg6zJNQzxv4+w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pFyMitQJx5hBTfdVLKg0SWtF4+Af8c6JLKsgCgccFEEkroEUnpsY54iRwXPXOSrX4OV5IufBsW57uC49vdflGLIIKRsDXvQaSq6AQepKyeNYd0FJstbyF7OFXB+/Kyg6KusngWoC1phjdmwDjaMMuN/7PdU51vbkJJs+yozX1+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Gi/16nbL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 052B811EB;
	Mon, 18 Aug 2025 22:41:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755549682;
	bh=pASaZZUa8G/kSzlS/eDqbEmaIuYle5Tg6zJNQzxv4+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gi/16nbLZUP/QS5ixbof3mx1iEnbOylMFFv/mp857+sKrOFrznaEiPO4Z/iEpWD3p
	 xePUXUzxFGZCy+1SLwbPpGAkYrTvdoKW7AEjuFsAjjtZFwuGmeENxH7JsV756lvjHF
	 NPiATQsQ7HMhh0ECn1G1r2XihTJpIee/68Gaum0Y=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Mon, 18 Aug 2025 22:39:37 +0200
Subject: [PATCH v3 2/2] media: ivtv: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-cx18-v4l2-fh-v3-2-5e2f08f3cadc@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5849;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=pASaZZUa8G/kSzlS/eDqbEmaIuYle5Tg6zJNQzxv4+w=;
 b=kA0DAAoBcjQGjxahVjwByyZiAGijkCWiszx0ya1IUjfDJzAXDwMl1n8tOhzS/7s3TRw8gLXJd
 4kCMwQAAQoAHRYhBLXEPUiAmiCKj1g4wHI0Bo8WoVY8BQJoo5AlAAoJEHI0Bo8WoVY8icIP/18e
 V0aTRZ6D3TZYaEWMLp41bKXBT4ks36jTn0o0kp/dn//rCeYHUOyWuS+/ICoUcpAIcEtC0BWFJCp
 clL9tYpGexwitrUW05WLFlAVLOAvEr/bW+OV8vnKVzzY8//HDAALLsh/H/vACKz37wGNV77CuqZ
 bL5QlaEwJbcXubllVx/ylzgusmF5q+pTBj2xLXetFdepGS6m2XjHmgYzTG2KQE+S2lJSwCbwc2v
 bNMNTGQjNLMLz9pvs5TBqH2N4rHggqRzUWSQzdjCM7sRZ9yTsygbuG/0B85yjXAUnrTLscatPcB
 zXtATIo0ZDkvnLcfyeoYkYMksorQdtN0wxw1+5vqSjjU1HhpAvadByqwpHS6AGjFsW/ZPnikatb
 JbvzIUiEgXYh6IqtVFWDEHH5LjAo89lVGO7vacFEIAkFm5ellTNpzHUISuSsksaa3p0hNdwvPM1
 HV4lnyM0PqveN1eR2wCDXW6nBxlq659iJCUND7oJZkLXIPj4o14cl920TD6n068HnofH030uV8W
 ZwPgzH0ghJhonCyT4b7ZS07snG7WHr79DdM3VVdo6KLGwfnZRV/VIrejND/VzqSn2v0paw8LyvF
 aHtrzEOmUXOrufKeYPjsrG7qT21WjNNd2346H+c1iFeb2V6Jn5iksSJ+/TIvXEw9EwnZ5lplpll
 BRrQl
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
functions.

The ivtv_do_s_input() helper accepts a struct ivtv * as first argument,
which is easily accessible from the DVB layer as well as from the file *
argument of the ioctl handler.

The ivtv_s_frequency() takes an ivtv_stream * instead. The stream * can
safely be accessed from the DVB layer which hard-codes it to the
IVTV_ENC_STREAM_TYPE_MPG stream type, as well as from the ioctl handler
a valid stream type is associated to each open file handle depending on
which video device node has been opened in the ivtv_open() file
operation.

The bug has been reported by Smatch.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aKL4OMWsESUdX8KQ@stanley.mountain/
Fixes: 9ba9d11544f9 ("media: ivtv: Access v4l2_fh from file")
Cc: stable@vger.kernel.org
Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/pci/ivtv/ivtv-driver.c | 11 ++++-------
 drivers/media/pci/ivtv/ivtv-ioctl.c  | 22 +++++++++++++++++-----
 drivers/media/pci/ivtv/ivtv-ioctl.h  |  6 ++++--
 3 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index ecc20cd89926fe2ce4e472526a6b5fc0857615dd..7e2fb98cfccf02f701ceb4484dd1d330dd1dc867 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -1260,15 +1260,12 @@ static int ivtv_probe(struct pci_dev *pdev, const struct pci_device_id *pci_id)
 
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
 
@@ -1310,13 +1307,13 @@ int ivtv_init_on_first_open(struct ivtv *itv)
 
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
index 8077a71d4850ec773caa20c3fca08f92f3117d69..dfbc842b22453868a2075935a81db7ae313ee46c 100644
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
index 42c2516379fcbbd0640820ab0e3abe9bf00b57ea..dd713a6b095e5ebca45a234dd6c9a90df0928596 100644
--- a/drivers/media/pci/ivtv/ivtv-ioctl.h
+++ b/drivers/media/pci/ivtv/ivtv-ioctl.h
@@ -17,7 +17,9 @@ int ivtv_set_speed(struct ivtv *itv, int speed);
 void ivtv_set_funcs(struct video_device *vdev);
 void ivtv_s_std_enc(struct ivtv *itv, v4l2_std_id std);
 void ivtv_s_std_dec(struct ivtv *itv, v4l2_std_id std);
-int ivtv_s_frequency(struct file *file, void *fh, const struct v4l2_frequency *vf);
-int ivtv_s_input(struct file *file, void *fh, unsigned int inp);
+
+struct ivtv;
+int ivtv_do_s_frequency(struct ivtv_stream *s, const struct v4l2_frequency *vf);
+int ivtv_do_s_input(struct ivtv *itv, unsigned int inp);
 
 #endif

-- 
2.50.1


