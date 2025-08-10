Return-Path: <linux-media+bounces-39308-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A71F2B1F7C5
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:34:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04A7E7A9054
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0603E1EE7DD;
	Sun, 10 Aug 2025 01:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="omzoMt+j"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E1E194C86
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789543; cv=none; b=Ncx6MpxxyATZv2L+byHbZAh04T3p0MK8n5I9xjoGC85RullPCKoUJKIeR5TOiT6f5mVfHeXJeiOCA1sxt/6Zy7TfHxJWeTExlufrBlRnpHiGam+fvCzPUnbkzRJEVFwPookwAlAknIZKpM9n/gyAessOgjombPmpCWh+SZNfjlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789543; c=relaxed/simple;
	bh=PVOG6t05aGPjNpP/2Go5tsV5hhONfrl+BwAPe+jc7m0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bq+of9lDXWxF9L3DmJAj7wLn0Moz/vuC8QIV7QiPdnSz5/KoAg4qftgofAkylf9r0tbZ/8dxtokloMmWTmo4xHBl7yNyfdFa8XsijoVLrlTZPYN7fTyaTSSnlgJvidneQwzeAOvqVIUja4fGBz8O2ElQQfsBrZr13LsDxriIm+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=omzoMt+j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id F2C9A18B9;
	Sun, 10 Aug 2025 03:31:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789488;
	bh=PVOG6t05aGPjNpP/2Go5tsV5hhONfrl+BwAPe+jc7m0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=omzoMt+jY31/Oy2NVyeYwK3t3BpUU2NccFywUoJRR1Bj5u+hB54gyokxpXmMgqDYT
	 YF7cqaZRAGcUOJslryUM150RRRv2F/8YP1nbfmtR4zLnNsuRu0b8tj6/5SvyyxaHfW
	 0Lc4glKTM8FHwhAm1k9+sMiTfTiSXd7gH5LhPS/w=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v3 35/76] media: v4l2-ioctl: Access v4l2_fh from private_data
Date: Sun, 10 Aug 2025 04:30:17 +0300
Message-ID: <20250810013100.29776-36-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Now that it is guaranteed that file->private_data is set to point to the
'struct v4l2_fh' initialised by v4l2_fh_add() the v4l2-ioctl layer can
be modified to retrieve the v4l2_fh pointer from the file *.

As the __video_do_ioctl() function, that calls all the handlers modified
by this patch goes as:

static long __video_do_ioctl(struct file *file,
		unsigned int cmd, void *arg)
{
	void *fh = file->private_data;

	...

	ret = info->func(ops, file, fh, arg);

}

This patch introduces no functional changes and makes it possible to
remove in future the 'fh' argument to all ioctl handlers.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 33 ++++++++++++++++------------
 1 file changed, 19 insertions(+), 14 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index 6c684884873e..378a2a149fec 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -2295,7 +2295,7 @@ static int v4l_queryctrl(const struct v4l2_ioctl_ops *ops,
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_query_ext_ctrl qec = {};
 	struct v4l2_queryctrl *p = arg;
-	struct v4l2_fh *vfh = fh;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	int ret;
 
 	if (vfh && vfh->ctrl_handler)
@@ -2319,7 +2319,7 @@ static int v4l_query_ext_ctrl(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_query_ext_ctrl *p = arg;
-	struct v4l2_fh *vfh = fh;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_query_ext_ctrl(vfh->ctrl_handler, p);
@@ -2335,7 +2335,7 @@ static int v4l_querymenu(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_querymenu *p = arg;
-	struct v4l2_fh *vfh = fh;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
 	if (vfh && vfh->ctrl_handler)
 		return v4l2_querymenu(vfh->ctrl_handler, p);
@@ -2351,7 +2351,7 @@ static int v4l_g_ctrl(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
-	struct v4l2_fh *vfh = fh;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct v4l2_ext_controls ctrls;
 	struct v4l2_ext_control ctrl;
 
@@ -2382,7 +2382,7 @@ static int v4l_s_ctrl(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_control *p = arg;
-	struct v4l2_fh *vfh = fh;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	struct v4l2_ext_controls ctrls;
 	struct v4l2_ext_control ctrl;
 	int ret;
@@ -2411,7 +2411,7 @@ static int v4l_g_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
-	struct v4l2_fh *vfh = fh;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
 	p->error_idx = p->count;
 	if (vfh && vfh->ctrl_handler)
@@ -2431,7 +2431,7 @@ static int v4l_s_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
-	struct v4l2_fh *vfh = fh;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
 	p->error_idx = p->count;
 	if (vfh && vfh->ctrl_handler)
@@ -2451,7 +2451,7 @@ static int v4l_try_ext_ctrls(const struct v4l2_ioctl_ops *ops,
 {
 	struct video_device *vfd = video_devdata(file);
 	struct v4l2_ext_controls *p = arg;
-	struct v4l2_fh *vfh = fh;
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 
 	p->error_idx = p->count;
 	if (vfh && vfh->ctrl_handler)
@@ -2746,19 +2746,25 @@ static int v4l_dbg_g_chip_info(const struct v4l2_ioctl_ops *ops,
 static int v4l_dqevent(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
-	return v4l2_event_dequeue(fh, arg, file->f_flags & O_NONBLOCK);
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
+
+	return v4l2_event_dequeue(vfh, arg, file->f_flags & O_NONBLOCK);
 }
 
 static int v4l_subscribe_event(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
-	return ops->vidioc_subscribe_event(fh, arg);
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
+
+	return ops->vidioc_subscribe_event(vfh, arg);
 }
 
 static int v4l_unsubscribe_event(const struct v4l2_ioctl_ops *ops,
 				struct file *file, void *fh, void *arg)
 {
-	return ops->vidioc_unsubscribe_event(fh, arg);
+	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
+
+	return ops->vidioc_unsubscribe_event(vfh, arg);
 }
 
 static int v4l_g_sliced_vbi_cap(const struct v4l2_ioctl_ops *ops,
@@ -3062,7 +3068,6 @@ static long __video_do_ioctl(struct file *file,
 	bool write_only = false;
 	struct v4l2_ioctl_info default_info;
 	const struct v4l2_ioctl_info *info;
-	void *fh = file->private_data;
 	struct v4l2_fh *vfh = file_to_v4l2_fh(file);
 	int dev_debug = vfd->dev_debug;
 	long ret = -ENOTTY;
@@ -3121,11 +3126,11 @@ static long __video_do_ioctl(struct file *file,
 
 	write_only = _IOC_DIR(cmd) == _IOC_WRITE;
 	if (info != &default_info) {
-		ret = info->func(ops, file, fh, arg);
+		ret = info->func(ops, file, vfh, arg);
 	} else if (!ops->vidioc_default) {
 		ret = -ENOTTY;
 	} else {
-		ret = ops->vidioc_default(file, fh,
+		ret = ops->vidioc_default(file, vfh,
 			v4l2_prio_check(vfd->prio, vfh->prio) >= 0,
 			cmd, arg);
 	}
-- 
Regards,

Laurent Pinchart


