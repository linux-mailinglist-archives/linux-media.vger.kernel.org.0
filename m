Return-Path: <linux-media+bounces-8588-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0221D897970
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 21:59:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93A9C1F2719B
	for <lists+linux-media@lfdr.de>; Wed,  3 Apr 2024 19:59:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6118B15622A;
	Wed,  3 Apr 2024 19:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mc7Z8ZwZ"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE34155755;
	Wed,  3 Apr 2024 19:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712174306; cv=none; b=HmTvX+Sb/uCmCttsUzgfXT11X1+oTfQ9J853WBjEzkDqbV58Yd/Ob4F4a/68oOUSPmtkJQ4R95Pim61gCsQ3AGNsWaJYloX363m6Kstejo8M1oejm1mcMSdVL1nuArsztzqFtJfDRQlQx05iTP5f5xj8ylotj88waLnvGFO0Nik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712174306; c=relaxed/simple;
	bh=40uh/wKUId8Vzuahx/WopdPsq9bSrg4TfoGpA2V/BrE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FFQvjdtfrSMEvNhjzHO5upHzdRF8h2nfXayQdEKbrfj8ZnvfG6e3uinG2cbi95a3a7s97KUhtSwtssjkyVCJTtUIlDnLW69G3ppxFIk/CsXXLRC2q86GqiMJkmfEheRMa5YtNTWrDJjrMisZUsRj4DX8Uo2qpwQq4G7UG5vPbYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mc7Z8ZwZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4FEBEC433F1;
	Wed,  3 Apr 2024 19:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712174306;
	bh=40uh/wKUId8Vzuahx/WopdPsq9bSrg4TfoGpA2V/BrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mc7Z8ZwZoEo7fY9eOEmoJPFBJBnUxwWtuMstgMLv9obTygRm7wZeGZNalZUbRVcFC
	 kplY32jru+rKFfbpMLZ8xz7MazXEWJCfOtJmSryDRBN9hOytQYF5PqNVoqheRL//w5
	 pvh8iBXCCH73q75333bjaprz5bd1G4B9TOIGG6UxXsM55e1Z4VQzI0fpJz2avgGHXi
	 jhawDM6I7tnHSiZaG6VOBzZulnWGnMPxh2PkfRxasJj/mXoQD4C/rrZ706aaKBlPxc
	 wf/PjsjDrDSUoTWmvLnso4dgWbJKpKKCYwZqMcYzp9JQxN7fr1jKIKxNQKsNV4y8tD
	 EO1/K9efnSdRw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EBFCD1288;
	Wed,  3 Apr 2024 19:58:26 +0000 (UTC)
From: John Bauer via B4 Relay <devnull+johnebgood.securitylive.com@kernel.org>
Date: Wed, 03 Apr 2024 14:58:07 -0500
Subject: [PATCH 1/3] media: uvcvideo: UVC minimum relative pan/tilt/zoom
 speed fix
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240403-uvc-fix-relative-ptz-speed-v1-1-624c9267f745@securitylive.com>
References: <20240403-uvc-fix-relative-ptz-speed-v1-0-624c9267f745@securitylive.com>
In-Reply-To: <20240403-uvc-fix-relative-ptz-speed-v1-0-624c9267f745@securitylive.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linh.tp.vu@gmail.com, ribalda@chromium.org, soyer@irl.hu, 
 John Bauer <johnebgood@securitylive.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712174305; l=2495;
 i=johnebgood@securitylive.com; s=20240325; h=from:subject:message-id;
 bh=QZxJ8IkQ+0S1QgP+EtdvdygUUbw+bFRKj/oMsKdGp5w=;
 b=uUDdtIbM/Iiu2FN1XodBx73FkpXtnAmxQXh9J+cIFGTHjyXDcY402bq0qlgqRZZwR4mHQ7qqN
 bnaBCLaMwDXA8JygZkJyHJPYEC5MYfnxCmXqVeCD3MN4/nc+CM7L6MD
X-Developer-Key: i=johnebgood@securitylive.com; a=ed25519;
 pk=RN31Fmrxbidp1TwtZGNmQwTDjUWMPnewQJfA/ug2P9E=
X-Endpoint-Received: by B4 Relay for johnebgood@securitylive.com/20240325
 with auth_id=143
X-Original-From: John Bauer <johnebgood@securitylive.com>
Reply-To: johnebgood@securitylive.com

From: John Bauer <johnebgood@securitylive.com>

The minimum UVC control value for the relative pan/tilt/zoom speeds
cannot be probed as the implementation condenses the pan and tilt
direction and speed into two 16 bit values. The minimum cannot be
set at probe time because it is probed first and the maximum is not
yet known. With this fix if a relative speed control is queried
or set the minimum is set and checked based on the additive inverse of
the maximum at that time.

Signed-off-by: John Bauer <johnebgood@securitylive.com>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..b389ab3ee05d 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1322,9 +1322,25 @@ static int __uvc_query_v4l2_ctrl(struct uvc_video_chain *chain,
 		break;
 	}
 
-	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN)
-		v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
-				     uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MIN) {
+		switch (v4l2_ctrl->id) {
+		case V4L2_CID_ZOOM_CONTINUOUS:
+		case V4L2_CID_PAN_SPEED:
+		case V4L2_CID_TILT_SPEED:
+			/*
+			 * For the relative speed implementation the minimum
+			 * value cannot be probed so it becomes the additive
+			 * inverse of maximum.
+			 */
+			v4l2_ctrl->minimum = -1 * mapping->get(mapping, UVC_GET_MAX,
+						uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+			break;
+		default:
+			v4l2_ctrl->minimum = mapping->get(mapping, UVC_GET_MIN,
+						uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
+			break;
+		}
+	}
 
 	if (ctrl->info.flags & UVC_CTRL_FLAG_GET_MAX)
 		v4l2_ctrl->maximum = mapping->get(mapping, UVC_GET_MAX,
@@ -1914,6 +1930,21 @@ int uvc_ctrl_set(struct uvc_fh *handle,
 				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MIN));
 		max = mapping->get(mapping, UVC_GET_MAX,
 				   uvc_ctrl_data(ctrl, UVC_CTRL_DATA_MAX));
+
+		/*
+		 * For the relative speed implementation the minimum
+		 * value cannot be probed so it becomes the additive
+		 * inverse of maximum.
+		 */
+		switch (xctrl->id) {
+		case V4L2_CID_ZOOM_CONTINUOUS:
+		case V4L2_CID_PAN_SPEED:
+		case V4L2_CID_TILT_SPEED:
+			min = max * -1;
+		default:
+			break;
+		}
+
 		step = mapping->get(mapping, UVC_GET_RES,
 				    uvc_ctrl_data(ctrl, UVC_CTRL_DATA_RES));
 		if (step == 0)

-- 
2.34.1



