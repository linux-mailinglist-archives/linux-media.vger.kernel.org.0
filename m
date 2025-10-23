Return-Path: <linux-media+bounces-45423-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 18957C032B1
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 21:24:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A9C6035AC75
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 19:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BB034D917;
	Thu, 23 Oct 2025 19:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VducTAhq"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584CD34CFD1;
	Thu, 23 Oct 2025 19:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761247460; cv=none; b=ZKNHH1sj6A0i8pYqQEw+8AVdJyqulcBRNQAPWWQMFzo3/txv0Un8g5x66y1XW5OC5h4fy6ozzP6N4clU08L4cK0tfyVjwLYZ4T0NC0iYCOS1gCF2WWCAsDdmh9A9jG871lqMeTj5GlxWC/9R1bsvNrojb61hd7zF3EIQfIdsP0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761247460; c=relaxed/simple;
	bh=rdfOFrGw0lZEyQTo+2Qo9k+Mpd1nYAXgb3iOAyxHaP8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jB6QAzf7eXc8XnBpOTZe/eD6GhUO9YnVEHHhG2nVQGy8m+nRDFuUQYQ1pZGPXMCbduRTnSGzhz9ZRMiBJ603zyp88DqkwxRsgCGtmWH+wEbrpl2YAbk6N2/vbMNZjFm3PMSNPxrc8/KMO9SlMTlQ5h6+hC6tZIU6NlmSdjYTPu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VducTAhq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E34DCC4CEFF;
	Thu, 23 Oct 2025 19:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761247460;
	bh=rdfOFrGw0lZEyQTo+2Qo9k+Mpd1nYAXgb3iOAyxHaP8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VducTAhqM0ehHkS5XIq2L6Vwh9xNuMoG+Q3f8ujLE+Atj3q3oAiWu92P7LcwwL1iW
	 shERUYHoZWNvt5FhgFYzTYUlNJLEOVXkNKDoI1Jpv241MTnsubA0tjvWd8NaNYRyZU
	 s3JrT3iDVdjXl+GwUmiioWoS95xENq3kyDVLTEqWbtgLSnYkj2gMUHF7m3taMsm/2L
	 JFB84m1+YX6KWNF8w6ENHOIxA0iG4T5gVUF4uIsb6XlT3LSnBemJiL53ql36AeEB6/
	 ExdDFJbhyI4BAa294akhCPjyLs6sIo9QJSEkF77+tCUtFEyz4b0KQ7uqMRARwfhNVF
	 hxZgHoqBYmf+w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE6FCCF9E3;
	Thu, 23 Oct 2025 19:24:19 +0000 (UTC)
From: ymodlin via B4 Relay <devnull+yogev.modlin.realsenseai.com@kernel.org>
Date: Thu, 23 Oct 2025 22:24:14 +0300
Subject: [PATCH v2 1/2] change: drop 'Intel' from RealSense camera comments
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-fix-uvc-v2-1-1c93853257dc@realsenseai.com>
References: <20251023-fix-uvc-v2-0-1c93853257dc@realsenseai.com>
In-Reply-To: <20251023-fix-uvc-v2-0-1c93853257dc@realsenseai.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ymodlin <yogev.modlin@realsenseai.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761247458; l=3968;
 i=yogev.modlin@realsenseai.com; s=20251022; h=from:subject:message-id;
 bh=7fC0amnjI3i8ZCMek8+FyPEdsTPz6GrCi5GLQmNFBjs=;
 b=znpXR5S/v/Ug/+AiV9/jxXhpZ3LXltKsUKt2lCsaDbC5Wa4zRpsc+VDfJBGVImw141a/3wc7X
 WtZhA7ttk2CB2mKgs6IdhZVuUbdvdEvnQOsEAPQtc8DplX5EjOlnAVq
X-Developer-Key: i=yogev.modlin@realsenseai.com; a=ed25519;
 pk=V3EENbzJJO6YkqjrHtGmN67ulKS2b5TU7Ze0hVi1G1o=
X-Endpoint-Received: by B4 Relay for yogev.modlin@realsenseai.com/20251022
 with auth_id=549
X-Original-From: ymodlin <yogev.modlin@realsenseai.com>
Reply-To: yogev.modlin@realsenseai.com

From: ymodlin <yogev.modlin@realsenseai.com>

RealSense branding is now independent of Intel. Update all driver
comments referencing "Intel RealSense" to just "RealSense" to reflect
current ownership. No code logic changes.

Signed-off-by: Yogev Modlin <yogev.modlin@realsenseai.com>
---
 drivers/media/usb/uvc/uvc_driver.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
index fb6afb8e84f0..b1457678833e 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3142,7 +3142,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_QUIRK(UVC_QUIRK_DISABLE_AUTOSUSPEND) },
-	/* Intel D410/ASR depth camera */
+	/* Realsense D410/ASR depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3151,7 +3151,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D415/ASRC depth camera */
+	/* Realsense D415/ASRC depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3160,7 +3160,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D430/AWG depth camera */
+	/* Realsense D430/AWG depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3169,7 +3169,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel RealSense D4M */
+	/* Realsense RealSense D4M */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3178,7 +3178,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D435/AWGC depth camera */
+	/* Realsense D435/AWGC depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3187,7 +3187,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D435i depth camera */
+	/* Realsense D435i depth camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3196,7 +3196,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D405 Depth Camera */
+	/* Realsense D405 Depth Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3205,7 +3205,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D455 Depth Camera */
+	/* Realsense D455 Depth Camera */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,
@@ -3214,7 +3214,7 @@ static const struct usb_device_id uvc_ids[] = {
 	  .bInterfaceSubClass	= 1,
 	  .bInterfaceProtocol	= 0,
 	  .driver_info		= UVC_INFO_META(V4L2_META_FMT_D4XX) },
-	/* Intel D421 Depth Module */
+	/* Realsense D421 Depth Module */
 	{ .match_flags		= USB_DEVICE_ID_MATCH_DEVICE
 				| USB_DEVICE_ID_MATCH_INT_INFO,
 	  .idVendor		= 0x8086,

-- 
2.43.0



