Return-Path: <linux-media+bounces-42275-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3124B52CCD
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 11:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5287D7B69D1
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 09:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC79320E702;
	Thu, 11 Sep 2025 09:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPKOM0XE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AC42E9730;
	Thu, 11 Sep 2025 09:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757582142; cv=none; b=AsD8LrOUXPOMHXraiHKw/5l+I5DniNKcQ99+4nF6ai+AJ0+Wfe7BkOYiWhECcbhTZdCAMwsHCW/v6fhfNu6X7JlFYAXOvZUABZ8YvK+hzG0FxuAyrfkVA1n7cjj5/IOIlMKLbIkpU/l9kCP67L+Qmz9tPNcM/ufhgMVYxt04qKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757582142; c=relaxed/simple;
	bh=LIYL+FyEHAnJV8IzqdIcs1l232AGKZKm8aHRWU2Mccg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZKhRJsjLVhSjXoOU55No7HxZ2U6VsYpnNM5pSyM6QL1JtanpGTAz70c6x6s3llfBPLYWb/ZbxNQ6HJG2cl/nmo53/k+HJXrUxYWotdFTQl2zfVG+X9A76hW7WtGlLHZHnVxsmX72ne0btuRGmTNYdRuxXnrjYn9Wav3hJl+d0CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPKOM0XE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43AACC4CEF0;
	Thu, 11 Sep 2025 09:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757582141;
	bh=LIYL+FyEHAnJV8IzqdIcs1l232AGKZKm8aHRWU2Mccg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tPKOM0XEZRe8teTyy2AS1RYyeZmorBJK9iyG9C6wj0N96AUun9kKHISMRfTlbqvUI
	 FLWy4Y4m+pzi27eWZACMKsv7Eg0nBsv/goIVNCnineDbudk6x+7iYhpJARYsGxOthh
	 G4GqXGsoJo20YS4K0KTQLZMVuUWJEPjZ2UjNJK7GJNBpXNQAUjUBiXeOrlrDfUdg/L
	 LLIcJmjpl/EXq4oelJH3Hp85kJCtiM+XkuKVxO6hw/Uj9smZKAZQtFJz3ChfPr+DgL
	 Ccjjg9FCOS8BGwTWDAnaHNtT4PzrR65sPApLZPPYt6wRjpnOha3atXTbppj1ogitIr
	 p7d7vnVZ5xlAg==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 11 Sep 2025 11:15:32 +0200
Subject: [PATCH v2 1/4] media: uapi: Clarify MBUS color component order for
 serial buses
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-csi-bgr-rgb-v2-1-e6c6b10c1040@kernel.org>
References: <20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org>
In-Reply-To: <20250911-csi-bgr-rgb-v2-0-e6c6b10c1040@kernel.org>
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
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmHJpu9Pa2vt2il8hPT8+VsJva7N0w110yIUZdaG82wa
 /WTmNDNHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiG2cx1qm/K2DN4Uur/uxy
 /4eudfSBbpuuHMm2U39nHln3/vj1V2KVexttVlvvFnMXqks8cUe0i7HhJ49GRX7Cn6NFQkt8L+1
 yjnxs8PXuY0NNt9X73pkGNxWasbAXLwqq0nlnO9dv3ZmXDukA
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


