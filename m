Return-Path: <linux-media+bounces-42662-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 30121B7E5A5
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 14:47:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6621586921
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 11:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B652F619B;
	Wed, 17 Sep 2025 11:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8U64rT4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B109F2F0688;
	Wed, 17 Sep 2025 11:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758107788; cv=none; b=jqczHOf8ff9GjFgoEAVNSzRN3pnbxDQZ7iOLm+mWk/2htzK0G158yqTEVaAnCho4iUeE1JQ9NrK311FrH4FSFHas1aAxn+7JELTyFZEJzNsxx9NZoNO5ij493/Z0mJ228/tI/yOzKS7qC+QtraX43xvyB1OlZM71MufIiXc/Ne4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758107788; c=relaxed/simple;
	bh=LIYL+FyEHAnJV8IzqdIcs1l232AGKZKm8aHRWU2Mccg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Axm0QJB7vwdIG3Nf3D/RmP1KqFP8oohXK9KNuh8R/kG66Dwx0Fdckpw6wmLipeMDbBxp/YyIf35WLOXS3k+969vvJBylwUPjVnXq96JEwxle365RAS4a1gRP8ll8a9uWJXYAIuoNgBySwnJb7pODxrMEYoTx8AObJNGoWxPLIeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8U64rT4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05C23C4CEF0;
	Wed, 17 Sep 2025 11:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758107788;
	bh=LIYL+FyEHAnJV8IzqdIcs1l232AGKZKm8aHRWU2Mccg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=W8U64rT4kdE90K4lLI+/2PIC4J2Yia3ItrPqt0GsO/jEDqHoXNXntjXJTaSDaThSn
	 obaPBmbVS6riDTQLSHV55bte8j274F3lPY4ZanqeUKmU9P91lcopwOS0KSwFE+MK1e
	 NcaBFbfGNrCh5E1EgXR6pnO+DMUm6gKZWlmbWkBPL0nhDcU8hvza2LSfHYYnotOw1d
	 sS64a0xKo+EjY9QcLi4ZL4VKtY/f97lBjcNRSMu2+WmxuiOHxBDWvCBf9I0Bj5ebyo
	 HC7mOeADEo4B1nO5X2f2KOzbEFt7jbwhGZqCE8C0aNliJDDqk0KREskWjdUMc7XpgU
	 FPX75UpmJKIDQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 17 Sep 2025 13:16:11 +0200
Subject: [PATCH v3 1/4] media: uapi: Clarify MBUS color component order for
 serial buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-csi-bgr-rgb-v3-1-0145571b3aa4@kernel.org>
References: <20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org>
In-Reply-To: <20250917-csi-bgr-rgb-v3-0-0145571b3aa4@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mats Randgaard <matrandg@cisco.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Hans Verkuil <hans.verkuil@cisco.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2324; i=mripard@kernel.org;
 h=from:subject:message-id; bh=LIYL+FyEHAnJV8IzqdIcs1l232AGKZKm8aHRWU2Mccg=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmnZrTULvEU2s9UWZYwPalXVcP6dmFT1iGDKn0p04rU2
 KWaC/M7prIwCHMyyIopsjyRCTu9vH1xlYP9yh8wc1iZQIYwcHEKwESOdzLW1/+X/J5icDRTS8vf
 aELn2zjfBRJPJola1hheS3bapLrP0HnOlOpXeo8XaaZ9fDxrg95qxhqu43ffS3tdfiMRkNS9Jc/
 rxs7Y6QZM72btquBVX5rtXpE+hyliR6uUWdnezYkWIrZLvAE=
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
2.50.1


