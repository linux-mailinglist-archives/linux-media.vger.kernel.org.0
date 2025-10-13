Return-Path: <linux-media+bounces-44265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC7BD2AEA
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 13:02:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65057189BA04
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FF126B762;
	Mon, 13 Oct 2025 11:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSkTTk3z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEE626980E;
	Mon, 13 Oct 2025 11:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760353300; cv=none; b=BOtffSIxB54SYzDkbKZmH+fn/YH8DCbhHzsztTgThFcvAxg+2NChV20xQS1PR3JtKmJeomhRoEexKc4KpvDQlIbcePFEVR9tfIF2qhek2oExZZQBee0c2qyz9bu7wIN1Xa2uHFrwh4sbJc/oLa5WN4ljuC+thKr26eW+LmEkG7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760353300; c=relaxed/simple;
	bh=+z+Ke/wL3drYAMEVfttRbXzJ7JvbhYEKSbH29MXPYEo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UM6Fo3Lq0HwqETigxUnKVG/BZiyEPAm+f7AhQrV9OQULz7U4c2tRZwZolsm1vHAlVXreJDIHnIzPwFTKR00dnJXxGCZigZlcpERP972zsWHUEHvPOhpaKqXjWRT2O7KzrBGQgQtKY7MJIjMTvhSitpEscORQdUEI59CIjgQPc0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSkTTk3z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7E2C4CEF8;
	Mon, 13 Oct 2025 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760353299;
	bh=+z+Ke/wL3drYAMEVfttRbXzJ7JvbhYEKSbH29MXPYEo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nSkTTk3zAQWigZKVt8rQnuwdU11zfpGq88gvYNwBbyR8d7H1VFf+uEXC7DRQtgc9i
	 zWWpLPqj/GmIR/NyeaAXxE4bDY2JVnhCkp91lStD8jkfJW/iaXEN+CpNhKU+5vNou7
	 W+F3LmxPDx6/xhL2xepLgGs7Zt5JbE8QO4uiFQRlgj/cJPK9eMY9jVCTY5n/9l+LUf
	 Q9kc22BcchQDewtStauRI0R3q/c/Ss9dm9yFj5TVDt2BNhdk6EQodP9PfwiezN5yfh
	 Wix3UomvdJstet05ELiQfyb4pwSd5gJZ8EeyD4ijWZhln+z2z66bn+06hqdAdhoo2D
	 Zo+6ahZ8N2QCw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 13 Oct 2025 13:01:33 +0200
Subject: [PATCH v4 1/4] media: uapi: Clarify MBUS color component order for
 serial buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-csi-bgr-rgb-v4-1-55eab2caa69f@kernel.org>
References: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
In-Reply-To: <20251013-csi-bgr-rgb-v4-0-55eab2caa69f@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2

The subdev format documentation has a subsection describing how to use
the media bus pixel codes for serial buses. While it describes the
sampling part well, it doesn't really describe the current convention
used for the components order.

Let's improve that.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/userspace-api/media/v4l/subdev-formats.rst | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 2a94371448dc07e5c7097421bd82f42dcd7e21aa..8e92f784abd8123f9ea950f954a60af56ee76dbe 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -158,16 +158,18 @@ formats in memory (a raw Bayer image won't be magically converted to
 JPEG just by storing it to memory), there is no one-to-one
 correspondence between them.
 
 The media bus pixel codes document parallel formats. Should the pixel data be
 transported over a serial bus, the media bus pixel code that describes a
-parallel format that transfers a sample on a single clock cycle is used. For
-instance, both MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FMT_BGR888_3X8 are used
-on parallel busses for transferring an 8 bits per sample BGR data, whereas on
-serial busses the data in this format is only referred to using
-MEDIA_BUS_FMT_BGR888_1X24. This is because there is effectively only a single
-way to transport that format on the serial busses.
+parallel format that transfers a sample on a single clock cycle is used. The
+color component order used is the same used on the serial bus. For instance,
+both MEDIA_BUS_FMT_BGR888_1X24 and MEDIA_BUS_FMT_BGR888_3X8 are used on parallel
+busses for transferring an 8 bits per sample BGR data, whereas on serial busses
+the data in this format is only referred to using MEDIA_BUS_FMT_BGR888_1X24,
+with BGR meaning that the blue component is transmitted first, then green, then
+red. This is because there is effectively only a single way to transport that
+format on the serial busses.
 
 Packed RGB Formats
 ^^^^^^^^^^^^^^^^^^
 
 Those formats transfer pixel data as red, green and blue components. The

-- 
2.51.0


