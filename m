Return-Path: <linux-media+bounces-48053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 4676DC9A911
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 08:53:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E3D54345CE7
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 07:53:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF048303C8A;
	Tue,  2 Dec 2025 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/NfM4+n"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A134302772
	for <linux-media@vger.kernel.org>; Tue,  2 Dec 2025 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764661971; cv=none; b=j6f/Z/6uW6+pmw6w421olWDvc37oQlvETVmFF81xbg+1mPyYRV+X79pVxdAoKDF+4WY+wSEOo4a7k+SecLa/CTap70y83CBOVeFal9GkO9sCdPOafvxjdjfOMpE62M/iSlJgywLi6RrVgB+0YAAs8W0Q68X/4GfDfa/9d/y3+Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764661971; c=relaxed/simple;
	bh=AKiGQS3XuZRUswEoQGNRJvdiebnl4hck8fvyF6yKs+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pb0fFNCMDTnuRQu3J8h3HLxegle+79lMoeksMibM4bD6BFPRGD5x3YtkuXfODqGdCpCpCMJ3eAR1OdZ9QJyhvGXP6srhqO+RiiRTbMLycJweidFeyNcpWLbMTez47RJAUDdo3DkdkerfmlVUTyEBR9EC2J63GfXMNmwkEyiNrQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/NfM4+n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD69C19421;
	Tue,  2 Dec 2025 07:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764661971;
	bh=AKiGQS3XuZRUswEoQGNRJvdiebnl4hck8fvyF6yKs+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h/NfM4+nPL4ayzgNSdPLcG9IWg2ez+CG8DXdXC4srk+XbKeB2HxB7VlGlA34FhJip
	 T8goxGEgA0go0T8LjQ1wvdHErOEi6aHmxRnsrsAvYkjpG3+K2SUjky/vnWiDIGd98I
	 /UUKnNsi8n+ONTiAcb2MezOtpGsmsPgN+jJSxo2Ae7FxnhDkwksTOAbBrw87eoPpR0
	 As7P3TZwSloMqX7SP27nqptCnLzv5B7HHoGP43HuIH4TuUv4k0SM3MSSmZ6Dik/go5
	 FgHT+wfDt/gggw+ILF0clPHjXDFifyq2zgiRMDC5l3yvQUevsG1OCkAf27rclKAT0f
	 m5dIRsg8Lo+bQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	laurent.pinchart@ideasonboard.com,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv3 10/12] media: omap3isp: support ctrl events for isppreview
Date: Tue,  2 Dec 2025 08:51:18 +0100
Message-ID: <88d481bca43c11e41a8e900e08cb7755c8249410.1764661880.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1764661880.git.hverkuil+cisco@kernel.org>
References: <cover.1764661880.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The preview subdev device was missing V4L2_SUBDEV_FL_HAS_EVENTS,
and that prevented VIDIOC_SUBSCRIBE_EVENT from working.

Fixes a v4l2-compliance error:

	fail: v4l2-test-controls.cpp(1128): subscribe event for control 'User Controls' failed
test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: FAIL

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/platform/ti/omap3isp/isppreview.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/omap3isp/isppreview.c b/drivers/media/platform/ti/omap3isp/isppreview.c
index 9992db782870..3e9e213c6d8a 100644
--- a/drivers/media/platform/ti/omap3isp/isppreview.c
+++ b/drivers/media/platform/ti/omap3isp/isppreview.c
@@ -2277,7 +2277,7 @@ static int preview_init_entities(struct isp_prev_device *prev)
 	strscpy(sd->name, "OMAP3 ISP preview", sizeof(sd->name));
 	sd->grp_id = 1 << 16;	/* group ID for isp subdevs */
 	v4l2_set_subdevdata(sd, prev);
-	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	v4l2_ctrl_handler_init(&prev->ctrls, 2);
 	v4l2_ctrl_new_std(&prev->ctrls, &preview_ctrl_ops, V4L2_CID_BRIGHTNESS,
-- 
2.51.0


