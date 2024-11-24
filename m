Return-Path: <linux-media+bounces-21888-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD719D6FB2
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 14:17:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84C2C1620E5
	for <lists+linux-media@lfdr.de>; Sun, 24 Nov 2024 13:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DD0B1F76DF;
	Sun, 24 Nov 2024 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eVuMCsoH"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01B1DFE08;
	Sun, 24 Nov 2024 12:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732452819; cv=none; b=QcsON2xYmSPazLZXAS+x1C1w1Uwf/s5wRfl6+WDMkEDwtLLpPmEcjyuN8Iz8tZcQn1ZVSljMCEi3GpA9d9jBk59VZaj6nJgfw6VD25lx6ReUzW0AaMuWJuNIOar+aOrFKbp9IaOXML1eLIdlMb+I9S0C1/Wsstv0fTSfXPHDdL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732452819; c=relaxed/simple;
	bh=RnXdiFYpD6dk1Olpa5aJPudS4TYWk6q4KEuzrScYb3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MnkohBgea+S6Kjgk8XTZGoLeCFmt0BKUytYqcTKCQXzdna8VCeDjftxqd+cUHGSeHiADtXcZFhogljPSNyng4m35f3BmzkNjv8RSt2F72qw4CfIWfsRJmP+hMxL3yNNxeBUhvN1LhbQfd5BKjHBM58bCHuu5hKM/HeJU4pdyplc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eVuMCsoH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4332EC4CECC;
	Sun, 24 Nov 2024 12:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732452819;
	bh=RnXdiFYpD6dk1Olpa5aJPudS4TYWk6q4KEuzrScYb3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eVuMCsoHBl7LalHm+bPnPOan+zQGTexFlHbPp0/e2yk84kVzFGOyrg/X2teN20OJc
	 Z9u/dObV1ja/c1ULG5+omWumLbalbEyAHbQYjitIeBoBGY+xoT+C7N+zSsoOvcy6gc
	 0irCNfjcawuLYcUMJOES/eIEGdQ0D9xH1j6lCesVbg4YrFrg4+MJ6IAEfdZDNIsph7
	 oJin55w09QeZUvSYz93j8OmVBc8pBYbJcGHxRv5jQkm6bayp3ypdiJw6HhV8Vf/Rdg
	 JRVTv0nz/J8JDtT2d4gqEtIJGKi8qxsDijqnE48lRHWKrI5vRaCeXSom5bzsqR3vyt
	 Ikru4b/iTF1Ng==
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
Subject: [PATCH AUTOSEL 6.6 05/16] media: uvcvideo: RealSense D421 Depth module metadata
Date: Sun, 24 Nov 2024 07:52:23 -0500
Message-ID: <20241124125311.3340223-5-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241124125311.3340223-1-sashal@kernel.org>
References: <20241124125311.3340223-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.63
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
index 37d75bc97fd8d..455acc1b354b1 100644
--- a/drivers/media/usb/uvc/uvc_driver.c
+++ b/drivers/media/usb/uvc/uvc_driver.c
@@ -3183,6 +3183,15 @@ static const struct usb_device_id uvc_ids[] = {
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


