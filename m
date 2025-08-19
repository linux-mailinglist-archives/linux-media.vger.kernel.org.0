Return-Path: <linux-media+bounces-40227-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBAFB2BA30
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4294E568318
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 07:07:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06C412848B9;
	Tue, 19 Aug 2025 07:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Wq0ROaY/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E950284893;
	Tue, 19 Aug 2025 07:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755587245; cv=none; b=YcTckxGdK+jzHsgrtcQS46ljVlkBgwRuxYjowegGt1kCAUinNByfi5fNJBc+p8FQUOHt50dP01jbTRCV1HLU6M/yXxQrLfKj2auAD/ZhyV/p2FOfiSTQZT7ZCiJRnDVUz16WOpffFaw+bzkbD8dXwTnFvcG96Nb2Ml5WUIuzVTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755587245; c=relaxed/simple;
	bh=rpTRn15G48rt3ExGDh09DluD8zO91EzisMrX6aCkyl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JI9FR4pALUHYjDjJdoFM9d3yazSOcKr53FeYsU/dbBiyPpA3R7YAFCb05pE2SFYDKZTsE4lUWG7thwG7lOCMRPz2xGmn8vpYXKit1zsUsTKILr+IlW2zFXKKX63s9CDsspmp4pjOO4BaJwAvKRzk3dttpnKE1SUAWCi2Sj9kAWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Wq0ROaY/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.106] (mob-5-90-52-92.net.vodafone.it [5.90.52.92])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 175DB22D2;
	Tue, 19 Aug 2025 09:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755587182;
	bh=rpTRn15G48rt3ExGDh09DluD8zO91EzisMrX6aCkyl8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Wq0ROaY/AQLLbrlgeRbvVqXEIiMmzuuZ8Qqxb3H6ikbVDJDv3D7Px7Ju6bLsvbLvF
	 eMpT1N3FrmMjUPJpo8Q9ZpYpA7L9uTEgvshBx4TtoCvzZ/kV+dNjsjX2XFTNm2wp/Z
	 uXK7KcPfd9cWGNd58PVdeRmgSbEhqdA+l2F/zFto=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Date: Tue, 19 Aug 2025 09:07:04 +0200
Subject: [PATCH v4 2/2] media: ivtv: Fix invalid access to file *
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-cx18-v4l2-fh-v4-2-9db1635d6787@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6197;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=rpTRn15G48rt3ExGDh09DluD8zO91EzisMrX6aCkyl8=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBopCKldmcft+/f1BpL22ywRh+erBRKgieZryU8e
 8Ii31SwKm+JAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaKQipQAKCRByNAaPFqFW
 PKhRD/9PMuD7V+auXbMYdvcCbCQRtcaQSdOn4ZLuJhUduylkPHyuN7sM31UpBwlG8mdRNPNE6f0
 2a1DM5N4/8FumKG1g1+Z+EimFEfZs36j0iJxnmwqRBvIwMwcXS9LWIp9OJatW275BG8FupJ6puE
 stX5uqUY0w/MbNPRh8oXYea1eBeLszVIIFJ2x+TtsWsWhGDquRuCvql6GJbdc9VPz4HWkwuK3q4
 Wg3uTjOBEtNMnyLxkoZGIHjsZLMSaxJWZCc9WXKfaneM5622LXH0E7MWVTbM0jXSvFKOHDh+Pxi
 XrBQQacrRtpZRY/lS9NaITAmbq4SNi/p+WBQ3fHVkERov1DQYKKt5uN8EhXgK1VCStyVNSZxkij
 cAvuUO4DVi4bPZnJSUZm0DuN8dW5aeUZ5TLf6OqA5MXozt+EjV/5U2waWNK6PeCIrxdXCMDcHSc
 sWoI106KzcGZyxGEAEkUDyfS65Q//O1HRQPtS8KehChVy4YURRnDooXrGbpKmsygDpb91dIlArD
 a2lDnJmZHfi/2qQIOccw13/Y0iGesu/Ui65P6To/iu0/SXmfCrm7RLUBrmc57ghBjL5P2VP4hLG
 TfK4OVw79okVmj0sbSlAonyBOLJiykaOBOfb9Nn4qXp7Jv52hldmjFao91Y2dUaO3CmY8nEzKoO
 JMKrDWcQgtvtS/A==
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
index 42c2516379fcbbd0640820ab0e3abe9bf00b57ea..edc05eb8e060fd64d7ff94f8f7f5c315a2fa6298 100644
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
2.50.1


