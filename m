Return-Path: <linux-media+bounces-41303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24759B3B5CE
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 10:18:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7ED8565F24
	for <lists+linux-media@lfdr.de>; Fri, 29 Aug 2025 08:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0840F2BF010;
	Fri, 29 Aug 2025 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pi6pJ7GO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67836296BB3
	for <linux-media@vger.kernel.org>; Fri, 29 Aug 2025 08:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756455283; cv=none; b=f3vn9CuCOu2WiqvZIZpKcFZzquYgEUjoApFUqPDhSrD5hhfiNhI+zCL6SNUdH9aLViT9GxZB6Ix1kago+RXtrcRKtl2w+GNBa2fMUcXa76JnXhJyVLhhd0LqodsKiEpkv6RixaOQjZB/yeVoPwJsLIDhSnV14zvn+7kxC2g64jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756455283; c=relaxed/simple;
	bh=GxLMaH5UgUUCXz6sK7ie0FbYyY/1Jcx/f2MbRjyDk7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aUc3iswwbHXd07BcfKYiItTW5UV1lwlzbFROg2PKfnw6NyeL59D87iJjvevi+faXnRfaRRaDduB2ZRpzZBzuHpdQ3nN6nbyhROnMU0sokebK6oIZmCqJAKeeRk/7DkN1AHAUbXaYtirH3YPUNZPTqKJu2GOZmZvlJmH8oD4hA6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pi6pJ7GO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6C6FC4CEF0;
	Fri, 29 Aug 2025 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756455283;
	bh=GxLMaH5UgUUCXz6sK7ie0FbYyY/1Jcx/f2MbRjyDk7I=;
	h=From:To:Cc:Subject:Date:From;
	b=pi6pJ7GO7aoLraSNROz3gBkXzLjSevAbx+oSbRFwJSIkRyVub/o9V+cruC874ywji
	 e+C5z3+mkk+g6/danzWDbQdvtXCPXYUJnwbbRuPezq1t88KA/bmr7M9P6XWpByW6iv
	 P/CO54j/JYHDX9hjy+qiKz7DOXoLqJwktrB41DVLN6CKvqRYJX+nvSFA9oiwrhWGTq
	 p1egYdVOsJuzVJRTnvvEe7WS91oR0lekvHJ35W6ZERDRI1Ljq3K6U2Dk3GbjdFWlJ5
	 0TsHhMYK/xvOTo8CF8uRNxSsPWv4IpzKAVsDbofaRtwGG6xSjjvsIQS/8h0wcMedzD
	 jJCHaCeB6RV3g==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCHv3 0/2] media: tc358743: add support for more IF/Packet types
Date: Fri, 29 Aug 2025 10:13:31 +0200
Message-ID: <cover.1756455213.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tc358743 HDMI-to-CSI2 bridge is widely available, and it has quite
flexible InfoFrame/Packet Type support, so this makes it a very nice
device to capture such data.

This patch series adds support for SPD, AUDIO, DRM and HDMI InfoFrames.

Also add support for ISRC1 and ISRC2 Packet Types and a programmable
type for both Packet and InfoFrames, which by default is programmed
for DRM InfoFrames.

These changes make the tc358743 very useful when you want to see
what InfoFrames and Packet Types are being transmitted.

Regards,

	Hans

Changes since v2:

- Rename acp_type to packet_type. 'acp_type' was a bit too obscure as
  a name.

Changes since v1:

- Added Packet Type support (ISRC1, ISRC2) and DRM and MPEG
  InfoFrame support.
- Added programmable Packet Type (defaults to DRM).

Hans Verkuil (2):
  media: v4l2-core: v4l2-dv-timings: support DRM IFs
  media: i2c: tc358743: add support for more infoframe types

 drivers/media/i2c/tc358743.c              | 109 +++++++++++++++++++---
 drivers/media/i2c/tc358743_regs.h         |  57 +++++++----
 drivers/media/v4l2-core/v4l2-dv-timings.c |   4 +
 include/media/v4l2-dv-timings.h           |   1 +
 4 files changed, 140 insertions(+), 31 deletions(-)

-- 
2.47.2


