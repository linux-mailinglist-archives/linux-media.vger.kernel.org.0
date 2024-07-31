Return-Path: <linux-media+bounces-15655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB0494347C
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 18:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A71F2861E7
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 16:54:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4C51BE224;
	Wed, 31 Jul 2024 16:53:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from luna.linkmauve.fr (luna.linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8381BD513;
	Wed, 31 Jul 2024 16:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722444790; cv=none; b=sY2j3Vf872YxhizAP6ifJfk7kT+BcKdHkrntwu6K+6a6lO5mGK/QgPTLoQkDYAWRLVcieeLdqupvpanwuVPEQ+nq7g5ZNePBBJn+uE/UByRnhjvQDblGQmrqckRimzK3JoG0JXEblvbJ+rEvedWG57bN2DJAO3xRjZ8kXpnfmc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722444790; c=relaxed/simple;
	bh=4q8W9CDGm7kj2yaWbuIWp1ErRtQpGcJXde2YvXOADAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p6E2XrOeRpjin4QxXZO+AlmG520dI3pDyScVRuvdRIQAP0W5ps2t0a9bF9ZhhD1uTWrOR7CxV2GctqHq5bi89P+NlE3LslewdQq27IVbXUk5efm5EadxxZmv/Qly9RS9apAYR4Bbrlaje/o8Adl1HBPWpoONe+g8GzQuDMV7MdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 9279114649DD; Wed, 31 Jul 2024 18:44:28 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: linux-sunxi@lists.linux.dev
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] media: cedrus: Enable JPEG decoding in various variants
Date: Wed, 31 Jul 2024 18:44:13 +0200
Message-ID: <20240731164422.206503-4-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240731164422.206503-1-linkmauve@linkmauve.fr>
References: <20240731164422.206503-1-linkmauve@linkmauve.fr>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jernej Skrabec <jernej.skrabec@gmail.com>

As far as manuals go, only A10 and A13 don't have JPEG support
mentioned, all others do.

To be safe, enable it on all variants except A13, since it was tested to
be functional on A10.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
index f52df6836045..f586bd95c163 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
@@ -563,6 +563,7 @@ static void cedrus_remove(struct platform_device *pdev)
 
 static const struct cedrus_variant sun4i_a10_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 320000000,
@@ -577,6 +578,7 @@ static const struct cedrus_variant sun5i_a13_cedrus_variant = {
 
 static const struct cedrus_variant sun7i_a20_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 320000000,
@@ -585,6 +587,7 @@ static const struct cedrus_variant sun7i_a20_cedrus_variant = {
 static const struct cedrus_variant sun8i_a33_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 320000000,
@@ -593,6 +596,7 @@ static const struct cedrus_variant sun8i_a33_cedrus_variant = {
 static const struct cedrus_variant sun8i_h3_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
@@ -601,6 +605,7 @@ static const struct cedrus_variant sun8i_h3_cedrus_variant = {
 
 static const struct cedrus_variant sun8i_v3s_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC,
 	.mod_rate	= 297000000,
 };
@@ -608,6 +613,7 @@ static const struct cedrus_variant sun8i_v3s_cedrus_variant = {
 static const struct cedrus_variant sun8i_r40_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
 	.mod_rate	= 297000000,
@@ -616,6 +622,7 @@ static const struct cedrus_variant sun8i_r40_cedrus_variant = {
 static const struct cedrus_variant sun20i_d1_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC,
 	.mod_rate	= 432000000,
@@ -624,6 +631,7 @@ static const struct cedrus_variant sun20i_d1_cedrus_variant = {
 static const struct cedrus_variant sun50i_a64_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
@@ -633,6 +641,7 @@ static const struct cedrus_variant sun50i_a64_cedrus_variant = {
 static const struct cedrus_variant sun50i_h5_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
 			  CEDRUS_CAPABILITY_VP8_DEC,
@@ -642,6 +651,7 @@ static const struct cedrus_variant sun50i_h5_cedrus_variant = {
 static const struct cedrus_variant sun50i_h6_cedrus_variant = {
 	.capabilities	= CEDRUS_CAPABILITY_UNTILED |
 			  CEDRUS_CAPABILITY_MPEG2_DEC |
+			  CEDRUS_CAPABILITY_JPEG_DEC |
 			  CEDRUS_CAPABILITY_H264_DEC |
 			  CEDRUS_CAPABILITY_H265_DEC |
 			  CEDRUS_CAPABILITY_H265_10_DEC |
-- 
2.45.2


