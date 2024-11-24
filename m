Return-Path: <linux-media+bounces-21874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8F29D6F51
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:07:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B12902818BE
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 724361D5CE8;
	Sun, 24 Nov 2024 12:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qEt21PdL"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDC81D5AD1;
	Sun, 24 Nov 2024 12:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452609; cv=none; b=HX8PgwRObxZntZoRKMkTRP8rfEhc64EnN9Swy1xgV2bjiTKCKz7YJHXCWscUDnT8lJXk/sXdwQUBHX45AGGpPiyADVSlWk8R9QqFpt9OKSK0WwCti9mr0gJmo0L6Sl+1+7ciU7R2MOhoxPB+k6Qoq45xNS8z7J5kqXLD5Gov/iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452609; c=relaxed/simple;
	bh=ckJ8mSyjRbnvMcrzsk/ht+oa3fJ6hy+exNOb+432GSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nn22IolcplN57eE8ccTRNAoqM75vO8RBRvHRMx6aartndOABpWNx9vH440lgZVNNLiW2VZVCnyvvoTADJfeUW1VdCpkB+qxnBo0ZhrXC0FBuLzZSzW7yld2dfsaiZgU5fyp+YcR2EGjdiotzy2w+kQlJgyT2AdJLi9k4qAK4034=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qEt21PdL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6F8C4CED9;
	Sun, 24 Nov 2024 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452609;
	bh=ckJ8mSyjRbnvMcrzsk/ht+oa3fJ6hy+exNOb+432GSo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qEt21PdLyjup+bS5GvFqY90/Ho4eEHkPutqt1pPq6vKUKQM0vJLnHvIwSTGCekRCC
	 zCslvI2gpRj4eiltLEe8IWWMjMrSh5VhLA5BY334yXJQcta9rTNscgRxW3Yw+q2+H4
	 mkcvEPamjF6+XABpP6NH0s4+JCmbONq24XkGIny0johbrXMI/4JIwFVgNL8TlFp3Fr
	 V3eHQHHyDSHpJYpOKFU1OnGuqmiMd+B0tA8Mx5hROx85cVXM7mEBM/uNS//rs8OHxV
	 UEvTkOGzvowj9/BY6F5X/cTt50rgO/ECqqiyznvn8Z+GWDfcWYqR4eitVUfaC28+kt
	 TX4k5zvqBJ6LA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Dmitry Perchanov <dmitry.perchanov@intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 09/23] media: uvcvideo: RealSense D421 Depth module metadata
Date: Sun, 24 Nov 2024 07:48:20 -0500
Message-ID: <20241124124919.3338752-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124124919.3338752-1-sashal@kernel.org>
References: <20241124124919.3338752-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.1
Content-Transfer-Encoding: 8bit

From: Dmitry Perchanov <dmitry.perchanov@intel.com>

[ Upstream commit c6104297c965a5ee9d4b9d0d5d9cdd224d8fd59e ]

RealSense(R) D421 Depth module is low cost solution for 3D-stereo
vision. The module supports extended sensor metadata format D4XX.

Signed-off-by: Dmitry Perchanov <dmitry.perchanov@intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://lore.kernel.org/r/d1fbfbbff5c8247a3130499985a53218c5b55c61.camel@intel.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/usb/uvc/uvc_driver.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index 0fac689c6350b..44812e307d094 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3072,6 +3072,15 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
+	/* Intel D421 Depth Module */
+	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
+				| USB_DEVICE_ID_MATCH_INT_INFO,
+	  .idVendor		= 0x8086,
+	  .idProduct		= 0x1155,
+	  .bInterfaceClass	= USB_CLASS_VIDEO,
+	  .bInterfaceSubClass	= 1,
+	  .bInterfaceProtocol	= 0,
+	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
 	/* Generic USB Video Class */
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_UNDEFINED) },
 	{ USB_INTERFACE_INFO(USB_CLASS_VIDEO, 1, UVC_PC_PROTOCOL_15) },
-- 
2.43.0


