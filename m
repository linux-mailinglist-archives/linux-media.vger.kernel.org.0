Return-Path: <linux-media+bounces-39223-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E99B1F682
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E94CD6244B1
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD092C08BF;
	Sat,  9 Aug 2025 21:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CnaKWJj+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F2D1B423B
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774289; cv=none; b=RCA8rTPAvKOObwSAs4EsHZfxTYzjJ8o2bv+xux13TsZtYJ3PbMkS9tBYQ1YmHhjBIiKom29STydsfWbVm7MNcTm/WpiVIR/l/JICD/LL22yHgp1n+RoleVDMJrzxpvtl46VAVKPYZ1kfmTzMsNHxo4pwrMn0+dTBMCtiDYEJLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774289; c=relaxed/simple;
	bh=CONJRFwUSaXF4SyNVsml/luG8bYDv2XTtePVAVdFjvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPAoD5okv4Rt0vIpDfo8+zEp0x/3aWXyn3+OGQH9v2wyedh7jJJxzEeDSh/KZMRrmbPPzc4fygIMc6voiX3JyIfUAzQX71s5wHmqx/7L+zPJbwCADWG3u5ym9k6zSJ6TLTzQ8OulHHl0XytxCJe+mr4wo+kdYBlvk/RUdQKjeZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CnaKWJj+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CD775162B;
	Sat,  9 Aug 2025 23:17:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774229;
	bh=CONJRFwUSaXF4SyNVsml/luG8bYDv2XTtePVAVdFjvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CnaKWJj++DWdZNCtHSeHGX4CZNroUt2fNpSxht8TpzWvH7sLmmHkjwoCysuDGtvE/
	 dOMoO7OcYsvamuuk32IbMrOVfjLYizEjGko6PNCM+vy914h5hO1EbnMzQQrmD0nHdt
	 F7GACFeRwQUYbc9LTYTbdmcx6/vM5CM3gGb+XT90=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 29/76] media: staging: ipu7: isys: Don't set V4L2_FL_USES_V4L2_FH manually
Date: Sun, 10 Aug 2025 00:16:06 +0300
Message-ID: <20250809211654.28887-30-laurent.pinchart@ideasonboard.com>
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

The V4L2_FL_USES_V4L2_FH flag is set by v4l2_fh_init(). It is not meant
to be set manually by drivers. Drop it from the ipu7-isys driver.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/staging/media/ipu7/ipu7-isys-video.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7-isys-video.c b/drivers/staging/media/ipu7/ipu7-isys-video.c
index 8756da3a8fb0..6b31c766bc58 100644
--- a/drivers/staging/media/ipu7/ipu7-isys-video.c
+++ b/drivers/staging/media/ipu7/ipu7-isys-video.c
@@ -1082,7 +1082,6 @@ int ipu7_isys_video_init(struct ipu7_isys_video *av)
 	__ipu_isys_vidioc_try_fmt_vid_cap(av, &format);
 	av->pix_fmt = format.fmt.pix;
 
-	set_bit(V4L2_FL_USES_V4L2_FH, &av->vdev.flags);
 	video_set_drvdata(&av->vdev, av);
 
 	ret = video_register_device(&av->vdev, VFL_TYPE_VIDEO, -1);
-- 
Regards,

Laurent Pinchart


