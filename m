Return-Path: <linux-media+bounces-22992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3069EAC0D
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 10:31:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF8FD1691A9
	for <lists+linux-media@lfdr.de>; Tue, 10 Dec 2024 09:31:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182CF3DAC1E;
	Tue, 10 Dec 2024 09:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Yx1G88Bl"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B441DC995
	for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 09:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733822940; cv=none; b=JyaBPSokvP/NSlv7wKkE+TjZPVMIMtGjENOzi+7ciFQPE4o3S2UuYPPsbwxeCCmry2F2yj3pOQMgNFxpLmghXOpfqQ0vYjvpW69fbJpzRAn6LbPxpvjadu2NTtBIs2WhFSm+s6h6QG73t2DDfunf/wfatCNFc2RpA3YmnSt1GgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733822940; c=relaxed/simple;
	bh=ctL5AnJGV5DJC9CXkrWVL7zWfndzHWXxxUlRLsEsOfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=go4X65v6GU04bqGtDBId351l8ewHIXNxXnEEkEnTQNHTo5ivL+/6UOPqZri0mBzAgoDvB7jXo1Ldu0AEb/bWp4jXpuc1lB2cLxxyS0785m/4FVpMpcsVxxAXLPcOn/7aPEsRcFOs5wd1/7j7ILi6kuvnRmsTIjxynKp2r0j2hno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Yx1G88Bl; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4676e708aeaso12162251cf.1
        for <linux-media@vger.kernel.org>; Tue, 10 Dec 2024 01:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822937; x=1734427737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H6+2CPj9NTbpQOo8ueUbGM8wqslpqQFkOdhDSPG4NAo=;
        b=Yx1G88BlOsFZXeZaeSr4+qTi6TLPnSqodP55Tf/fizkfz2AeROlAMrfNFuEcsO/UDD
         eJ05o4/rQakXKP7jOeapYkr6fEgA7kt1gXE0541yeaMr5zqX8jmbu+2yxevTDShahfsC
         xGcXR72Qgv5mqq2W8kpx5zm6y+S+kB0uM2lyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822937; x=1734427737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H6+2CPj9NTbpQOo8ueUbGM8wqslpqQFkOdhDSPG4NAo=;
        b=opEicQhpvlpnbpIvTe+d1o1xyZkGj3E0//BSf6JRONoMDDbyUsSCpywkfWI8fpFEhc
         GaFTAX9GsLsIdrAjis/xdJTuo9FRt8uGsqA5s7N6NYTZtXUoRuvXk4jNA8sL2YjZB2PI
         UCDr4jE9+h5JiknWohPkt0PEf6gDVwpl2dYLwqYdcaM5AIU6VfKo4WKoGqm77ykh+klD
         suyrwP6ki1RXR/jichmmXtsS1uJMn5L6lV6gfcqy159qMQPM9F2reB1zwX+JbBZ1gndJ
         j9QeCvK+duPKQ4ZDWCxbJDUfBpS01g5y46ifDgShYnwtoOZaE5C1ygPX5EgsuPpwM7CI
         +9EQ==
X-Gm-Message-State: AOJu0YyoD1sxdUhhI53YQVlrE/o3PyfmjVWgBlk9IHwm283N/7w5WUhg
	v/K47L1YMnVZum2xgPWiF786ITn/AUddu9yU0DYG9YU9icq6sWWTF1j7O6o3jA==
X-Gm-Gg: ASbGncstXRU0YYwqOro/tEZVoRwklKbv6nL7UOUo+hyg/09muMBqG6dLrG1TwFxMKPI
	lmfNZbSKr28xdywvhtqAjDpjsvdgBOJzdJ8cegKODAgG0RBwbnwx3OLohqUGw5H/QPPseE/sxU+
	KDWDcTYxaEZpOZ3QrY6t66uCWldEg0cJKdYujzLpXuIijf2qCHqCS41Fw20LjU5NithuD6tbQt4
	40B66BmhJ0WwXC7ZeE+yCjeYXNw46n5+9A1M+UKs0YQOV7divD1ov9R/EOKd5+QhN2aXZ5IMPc9
	wKi6QpXXmp4ssxYEyuMO3Zff3aQQ
X-Google-Smtp-Source: AGHT+IE8b0PM7gKALz88Rd23P5sKAeyq0cPFEHzTFCgEulkAqAHRhkOVnMDbHAXt7ijPFaIS17Apgg==
X-Received: by 2002:ac8:5fc6:0:b0:467:774b:f04b with SMTP id d75a77b69052e-467774bf44cmr28726901cf.22.1733822937679;
        Tue, 10 Dec 2024 01:28:57 -0800 (PST)
Received: from denia.c.googlers.com (5.236.236.35.bc.googleusercontent.com. [35.236.236.5])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4675dd86ce4sm24343241cf.30.2024.12.10.01.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:28:56 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Dec 2024 09:28:49 +0000
Subject: [PATCH v2 05/11] media: atomisp: Replace queryctrl with
 query_ext_ctrl
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-queryctrl-v2-5-c0a33d69f416@chromium.org>
References: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
In-Reply-To: <20241210-queryctrl-v2-0-c0a33d69f416@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mike Isely <isely@pobox.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.13.0

The ioctl framework provides an emulator of queryctrl using
query_ext_ctrl.
Replace our implementation of queryctrl to support both.

Now that we are at it:
- Add comment about missing functionality.
- Remove superfluous clear of reserved[0].
- Remove ret var.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 33 ++++++++++++-----------
 1 file changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 1a960a01854f..6b84bd8e6cf3 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -34,7 +34,7 @@ static const char *CARD = "ATOM ISP";	/* max size 31 */
  * FIXME: ISP should not know beforehand all CIDs supported by sensor.
  * Instead, it needs to propagate to sensor unknown CIDs.
  */
-static struct v4l2_queryctrl ci_v4l2_controls[] = {
+static struct v4l2_query_ext_ctrl ci_v4l2_controls[] = {
 	{
 		.id = V4L2_CID_AUTO_WHITE_BALANCE,
 		.type = V4L2_CTRL_TYPE_BOOLEAN,
@@ -1140,31 +1140,34 @@ static int atomisp_s_ctrl(struct file *file, void *fh,
 
 /*
  * To query the attributes of a control.
- * applications set the id field of a struct v4l2_queryctrl and call the
+ * applications set the id field of a struct v4l2_query_ext_ctrl and call the
  * this ioctl with a pointer to this structure. The driver fills
  * the rest of the structure.
  */
-static int atomisp_queryctl(struct file *file, void *fh,
-			    struct v4l2_queryctrl *qc)
+static int atomisp_query_ext_ctrl(struct file *file, void *fh,
+				  struct v4l2_query_ext_ctrl *qc)
 {
-	int i, ret = -EINVAL;
+	int i;
 
+	/* TODO: implement V4L2_CTRL_FLAG_NEXT_CTRL */
 	if (qc->id & V4L2_CTRL_FLAG_NEXT_CTRL)
-		return ret;
+		return -EINVAL;
 
 	for (i = 0; i < ctrls_num; i++) {
 		if (ci_v4l2_controls[i].id == qc->id) {
-			memcpy(qc, &ci_v4l2_controls[i],
-			       sizeof(struct v4l2_queryctrl));
-			qc->reserved[0] = 0;
-			ret = 0;
-			break;
+			*qc = ci_v4l2_controls[i];
+			qc->elems = 1;
+			qc->elem_size = 4;
+			return 0;
 		}
 	}
-	if (ret != 0)
-		qc->flags = V4L2_CTRL_FLAG_DISABLED;
 
-	return ret;
+	/*
+	 * This is probably not needed, but this flag has been set for
+	 * many kernel versions. Leave it to avoid breaking any apps.
+	 */
+	qc->flags = V4L2_CTRL_FLAG_DISABLED;
+	return -EINVAL;
 }
 
 static int atomisp_camera_g_ext_ctrls(struct file *file, void *fh,
@@ -1561,7 +1564,7 @@ const struct v4l2_ioctl_ops atomisp_ioctl_ops = {
 	.vidioc_enum_input = atomisp_enum_input,
 	.vidioc_g_input = atomisp_g_input,
 	.vidioc_s_input = atomisp_s_input,
-	.vidioc_queryctrl = atomisp_queryctl,
+	.vidioc_query_ext_ctrl = atomisp_query_ext_ctrl,
 	.vidioc_s_ctrl = atomisp_s_ctrl,
 	.vidioc_g_ctrl = atomisp_g_ctrl,
 	.vidioc_s_ext_ctrls = atomisp_s_ext_ctrls,

-- 
2.47.0.338.g60cca15819-goog


