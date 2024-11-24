Return-Path: <linux-media+bounces-21881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 631F29D6F88
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CF680160F50
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F92A1EF0BE;
	Sun, 24 Nov 2024 12:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mf9PR0o+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB81DE3C6;
	Sun, 24 Nov 2024 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452714; cv=none; b=iHcm/xpJE6WZGoiPd8Uqwt6AXm3se4v7G2cCqm30LS3ryYahb1F8ZO0AzhsdNjkX9O+z335+dHUDMQA/G8oTQyIr3MR+pZVsxJzOUg04CjaxVqcem0VFWS/owmpdQaJp220bhs1eqWVU5v5/OO/FeuqCPmn2Ppp/ki7yTRZyd6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452714; c=relaxed/simple;
	bh=pnpUbsT2PTSM/xHv2AcLeXqb99P4ofbV8bLVRjaUMIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nSreL2cOSSziwDB5lTf8vfkrgc9apDLkDnE993CSDkvNCCPk0VTQluuXxnbUWqEjA31cDcmYrszUAwLYDbVa4Z4XDDLYI/nRYmQ3CgmiHgYdgLdzbws6wOTaqZcMvi0ociquvE/rxAvj0JnxFg7U5GLP0oqyYGtUavzdwgtH94Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mf9PR0o+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10363C4CECC;
	Sun, 24 Nov 2024 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452714;
	bh=pnpUbsT2PTSM/xHv2AcLeXqb99P4ofbV8bLVRjaUMIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mf9PR0o+WAGOCBfKVkX6o2xyQVnIGs7B53XlCKVovEE8J9u4cShCuY0yRKYaHmao7
	 sg0jm4oW6g8Z1o90RKs4Aa0u67I2nFpVfEOAViR3UIevWv7Wl+SWSr82a+lYKonbZn
	 tUzbWu6xDuNQ8Oky9EjAbVgm1w7VwewXym+5DlGxy6Tsbpw8MyNFF3dIBgJdSUkokP
	 D93r9PnDutkxP82LMaTQ5VWHPD/y5dVqGpZ06C3M+KKJsOkscUoYW6Q7YK5OMNZQaO
	 8oPnVZ3UghHspxfqWmWNjeXqLVzeG9EaxwfuPOEoq8saYFB3ndg6SkIwgJDIg3MF5t
	 wJPo+rQD6emNg==
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
Subject: [PATCH AUTOSEL 6.11 07/20] media: uvcvideo: RealSense D421 Depth module metadata
Date: Sun, 24 Nov 2024 07:50:37 -0500
Message-ID: <20241124125124.3339648-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125124.3339648-1-sashal@kernel.org>
References: <20241124125124.3339648-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.10
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
index 2bba7123ea5e9..80925d59602ef 100644
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


