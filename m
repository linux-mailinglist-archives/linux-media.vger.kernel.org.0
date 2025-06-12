Return-Path: <linux-media+bounces-34621-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23D2AD70D7
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 14:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6D9107A46CF
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 12:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B27723C8A1;
	Thu, 12 Jun 2025 12:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrlBzqse"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979DD23C50F;
	Thu, 12 Jun 2025 12:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749732834; cv=none; b=dHdkSrt5gD/DqTY9IkVhHZVLzqMWl9oHiDLKsqpRZ+JdEPCKvQL+08IU4rhH1688y3ASmLYxhSsdHNOKUAkPyhQ4/I1zSmcxG2nA30DO0epBavzrU+RL/CKkXoV0X05FaFsbu3p8+icXJyigwI9rg+Gd/lsIsOvNEwjnnNBShSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749732834; c=relaxed/simple;
	bh=7G0cws/Pe3XBneIH9rCyYiUV0a/VekpAv58Mjc90PL4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BDBaBmEYNnI3DDOb0k1iy8Z+HD0aDkZ3YiBRjMs54GU6yDdVauw256MqsunrxHRgKvwnMxqRBF9sDRoao/Y+D3wGQtahSeAef5sdMde/0I/InMbQuWz7HVMZarSEFnYy3hfzwJbIRyvu3zTLsOb83Rg5M9TDhprY3cwhFAkykec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrlBzqse; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACF9C4CEEA;
	Thu, 12 Jun 2025 12:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749732834;
	bh=7G0cws/Pe3XBneIH9rCyYiUV0a/VekpAv58Mjc90PL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mrlBzqsepPzF+PUq2GYU6LkukotyTI9pvbrzSEyORk0GhF1O6IRtG5L6eIE4y34WV
	 H10P24rpp62YDB5pogFudZUX26qKBXIc1DHjJ+ltBFcSoVo0xSNEHwWJv6wLi/vz6u
	 GSFofoG0AO672D9MKDT3z9TZbzyo27zU1gmhXNN7MzhSc1VlwJXRWXI0ueetPUeF9C
	 qTA2ds2MAMvOZ1RdmIbwATwyK7oSZzZzRXrwesV3TOmioaRGSQGY9jRkDLB4Jm3ZA8
	 YOusdhpApujsWiORti/tAqHbWRiky/JlSpCha9XgDrALGuVQdIgDHMBwZe0JNHj0Ap
	 EOockdCOGsFRQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 12 Jun 2025 14:53:39 +0200
Subject: [PATCH 1/4] media: uapi: Clarify MBUS color component order for
 serial buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-csi-bgr-rgb-v1-1-dc8a309118f8@kernel.org>
References: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
In-Reply-To: <20250612-csi-bgr-rgb-v1-0-dc8a309118f8@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=mripard@kernel.org;
 h=from:subject:message-id; bh=7G0cws/Pe3XBneIH9rCyYiUV0a/VekpAv58Mjc90PL4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBleZ2+VbD3x6+z+//mCC3k8Px+p3r5LcIP908Oca6PuL
 jFy3+7t1DGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmMoefsT69t7dDWXBVYPiF
 RRxzs2dYz+jdkHTOMXvR7mvqHbY6PLtfNR+x7HLZPCP+SF76z7vWoowNt7t6XjXV7HroHP286Mu
 HVTw3CoSMnu9I0g+QvlawU8pA8WLWvW1vNNnC1FXvvNiwKnYTAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

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
2.49.0


