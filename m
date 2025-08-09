Return-Path: <linux-media+bounces-39195-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5A8B1F64C
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:17:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E373417D7F7
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B16C524BBE4;
	Sat,  9 Aug 2025 21:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uPXsB8tT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A26934545
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774244; cv=none; b=fRjhRt83vmyXxytL7+gDVC0OzQXa01mcanlijrT+Y3U/v0d0OMr5AC7ziAJaRJmOD+XSFgMr2x+Ve94GS76ibVNhHSs41WQNcTMiKMwNU5QiFN0SWw9Mt2fOx1KuC51ggNL5nNWS9xhAYCLOVdyKeh+rCnBagv6KWPTF6BNJ/PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774244; c=relaxed/simple;
	bh=vBUADTlE6gmXPWSjr8bivvr+kceQ2J0xnt6LqOrqEq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W4lMOpHB3vdsiFLUaqsdJDrDOUuOk8moPTkMpQMXc3u/EoipbXwm1EdM2bvdtaEESx4CVolLDGduKlrSpVB8GApfVcdr1u/p48CSbmsvgfGTo14Eu8YylUkYmhdJFCMnDdHfPcZ8kkohKkZPc3ZE2ko8XHMgDyCmWAGn3/DU4hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uPXsB8tT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 14D44EFE;
	Sat,  9 Aug 2025 23:16:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774182;
	bh=vBUADTlE6gmXPWSjr8bivvr+kceQ2J0xnt6LqOrqEq8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uPXsB8tT8/xCJkpAZhuRGt9JirYty0xJ8CawxUskqH18UpOCiPl/vSvnXyZIdEsyv
	 oM2mADS6QIqel4BtbdjqerEaqPaoq4eU8/3k8/TqUkyJX/xpsWNgCt5AI6b2kT8n/A
	 IKuvudPlbRfEAHxVTnpc27C4rQCKPTVC1rS0l8Ms=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ariel Otilibili <ariel.otilibili-anieli@eurecom.fr>,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v2 01/76] media: pci: saa7164: Store v4l2_fh pointer in file->private_data
Date: Sun, 10 Aug 2025 00:15:38 +0300
Message-ID: <20250809211654.28887-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Most V4L2 drivers store the v4l2_fh pointer in file->private_data. The
saa7164 instead stores the pointer to the driver-specific structure that
embeds the v4l2_fh. Switch to storing the v4l2_fh pointer itself to
standardize behaviour across drivers. This also prepares for future
refactoring that depends on v4l2_fh being stored in private_data.

This also fixes a bug in the vidioc_g_std() in saa7164-vbi.c that casts
the private_data void pointer to a saa7164_encoder_fh instead of a
saa7164_vbi_fh. The bug has no practical consequence as the two
structures are identical.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/pci/saa7164/saa7164-encoder.c | 27 ++++++++++-----------
 drivers/media/pci/saa7164/saa7164-vbi.c     | 22 ++++++++---------
 drivers/media/pci/saa7164/saa7164.h         | 10 ++++++++
 3 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-encoder.c b/drivers/media/pci/saa7164/saa7164-encoder.c
index bf73e9e83f52..296f50b6b8d3 100644
--- a/drivers/media/pci/saa7164/saa7164-encoder.c
+++ b/drivers/media/pci/saa7164/saa7164-encoder.c
@@ -219,7 +219,7 @@ int saa7164_s_std(struct saa7164_port *port, v4l2_std_id id)
 
 static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_s_std(fh->port, id);
 }
@@ -232,7 +232,7 @@ int saa7164_g_std(struct saa7164_port *port, v4l2_std_id *id)
 
 static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_g_std(fh->port, id);
 }
@@ -277,7 +277,7 @@ int saa7164_g_input(struct saa7164_port *port, unsigned int *i)
 
 static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_g_input(fh->port, i);
 }
@@ -301,14 +301,14 @@ int saa7164_s_input(struct saa7164_port *port, unsigned int i)
 
 static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_s_input(fh->port, i);
 }
 
 int saa7164_g_tuner(struct file *file, void *priv, struct v4l2_tuner *t)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -347,7 +347,7 @@ int saa7164_g_frequency(struct saa7164_port *port, struct v4l2_frequency *f)
 static int vidioc_g_frequency(struct file *file, void *priv,
 	struct v4l2_frequency *f)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_g_frequency(fh->port, f);
 }
@@ -400,7 +400,7 @@ int saa7164_s_frequency(struct saa7164_port *port,
 static int vidioc_s_frequency(struct file *file, void *priv,
 			      const struct v4l2_frequency *f)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 
 	return saa7164_s_frequency(fh->port, f);
 }
@@ -483,7 +483,7 @@ static int saa7164_s_ctrl(struct v4l2_ctrl *ctrl)
 static int vidioc_querycap(struct file *file, void  *priv,
 	struct v4l2_capability *cap)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -510,7 +510,7 @@ static int vidioc_enum_fmt_vid_cap(struct file *file, void  *priv,
 static int vidioc_fmt_vid_cap(struct file *file, void *priv,
 				struct v4l2_format *f)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 
 	f->fmt.pix.pixelformat  = V4L2_PIX_FMT_MPEG;
@@ -726,14 +726,14 @@ static int fops_open(struct file *file)
 	fh->port = port;
 	v4l2_fh_init(&fh->fh, video_devdata(file));
 	v4l2_fh_add(&fh->fh);
-	file->private_data = fh;
+	file->private_data = &fh->fh;
 
 	return 0;
 }
 
 static int fops_release(struct file *file)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -787,7 +787,7 @@ saa7164_user_buffer *saa7164_enc_next_buf(struct saa7164_port *port)
 static ssize_t fops_read(struct file *file, char __user *buffer,
 	size_t count, loff_t *pos)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_user_buffer *ubuf = NULL;
 	struct saa7164_dev *dev = port->dev;
@@ -893,8 +893,7 @@ static ssize_t fops_read(struct file *file, char __user *buffer,
 static __poll_t fops_poll(struct file *file, poll_table *wait)
 {
 	__poll_t req_events = poll_requested_events(wait);
-	struct saa7164_encoder_fh *fh =
-		(struct saa7164_encoder_fh *)file->private_data;
+	struct saa7164_encoder_fh *fh = to_saa7164_encoder_fh(file);
 	struct saa7164_port *port = fh->port;
 	__poll_t mask = v4l2_ctrl_poll(file, wait);
 
diff --git a/drivers/media/pci/saa7164/saa7164-vbi.c b/drivers/media/pci/saa7164/saa7164-vbi.c
index ac958a5fca78..a7e398f30472 100644
--- a/drivers/media/pci/saa7164/saa7164-vbi.c
+++ b/drivers/media/pci/saa7164/saa7164-vbi.c
@@ -144,28 +144,28 @@ static int saa7164_vbi_initialize(struct saa7164_port *port)
 /* -- V4L2 --------------------------------------------------------- */
 static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id id)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_s_std(fh->port->enc_port, id);
 }
 
 static int vidioc_g_std(struct file *file, void *priv, v4l2_std_id *id)
 {
-	struct saa7164_encoder_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_g_std(fh->port->enc_port, id);
 }
 
 static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_g_input(fh->port->enc_port, i);
 }
 
 static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_s_input(fh->port->enc_port, i);
 }
@@ -173,7 +173,7 @@ static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
 static int vidioc_g_frequency(struct file *file, void *priv,
 	struct v4l2_frequency *f)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 
 	return saa7164_g_frequency(fh->port->enc_port, f);
 }
@@ -181,7 +181,7 @@ static int vidioc_g_frequency(struct file *file, void *priv,
 static int vidioc_s_frequency(struct file *file, void *priv,
 	const struct v4l2_frequency *f)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	int ret = saa7164_s_frequency(fh->port->enc_port, f);
 
 	if (ret == 0)
@@ -192,7 +192,7 @@ static int vidioc_s_frequency(struct file *file, void *priv,
 static int vidioc_querycap(struct file *file, void  *priv,
 	struct v4l2_capability *cap)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -429,14 +429,14 @@ static int fops_open(struct file *file)
 	fh->port = port;
 	v4l2_fh_init(&fh->fh, video_devdata(file));
 	v4l2_fh_add(&fh->fh);
-	file->private_data = fh;
+	file->private_data = &fh->fh;
 
 	return 0;
 }
 
 static int fops_release(struct file *file)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_dev *dev = port->dev;
 
@@ -489,7 +489,7 @@ saa7164_user_buffer *saa7164_vbi_next_buf(struct saa7164_port *port)
 static ssize_t fops_read(struct file *file, char __user *buffer,
 	size_t count, loff_t *pos)
 {
-	struct saa7164_vbi_fh *fh = file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	struct saa7164_port *port = fh->port;
 	struct saa7164_user_buffer *ubuf = NULL;
 	struct saa7164_dev *dev = port->dev;
@@ -596,7 +596,7 @@ static ssize_t fops_read(struct file *file, char __user *buffer,
 
 static __poll_t fops_poll(struct file *file, poll_table *wait)
 {
-	struct saa7164_vbi_fh *fh = (struct saa7164_vbi_fh *)file->private_data;
+	struct saa7164_vbi_fh *fh = to_saa7164_vbi_fh(file);
 	struct saa7164_port *port = fh->port;
 	__poll_t mask = 0;
 
diff --git a/drivers/media/pci/saa7164/saa7164.h b/drivers/media/pci/saa7164/saa7164.h
index e1bac1fe19d3..7b511f7f1cfc 100644
--- a/drivers/media/pci/saa7164/saa7164.h
+++ b/drivers/media/pci/saa7164/saa7164.h
@@ -180,12 +180,22 @@ struct saa7164_encoder_fh {
 	atomic_t v4l_reading;
 };
 
+static inline struct saa7164_encoder_fh *to_saa7164_encoder_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct saa7164_encoder_fh, fh);
+}
+
 struct saa7164_vbi_fh {
 	struct v4l2_fh fh;
 	struct saa7164_port *port;
 	atomic_t v4l_reading;
 };
 
+static inline struct saa7164_vbi_fh *to_saa7164_vbi_fh(struct file *filp)
+{
+	return container_of(filp->private_data, struct saa7164_vbi_fh, fh);
+}
+
 struct saa7164_histogram_bucket {
 	u32 val;
 	u32 count;
-- 
Regards,

Laurent Pinchart


