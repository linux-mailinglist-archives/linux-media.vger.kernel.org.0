Return-Path: <linux-media+bounces-18033-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9639722A0
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 21:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8AAD0B23D2B
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2024 19:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DDC718C93C;
	Mon,  9 Sep 2024 19:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="BkI6+NS0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [207.246.76.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74171189F3E
	for <linux-media@vger.kernel.org>; Mon,  9 Sep 2024 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=207.246.76.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725910009; cv=none; b=BanHuylrb5KbAhzFJExx8+/tYzHSzhTvBvEpf0LhGn7l1+HB8NgkTJKlwpDO7gLB6tcnnzgqEhHlnASGFaOyYnW8PU3OWlP33r12iobT8oFO4lElSybjq7mCaMXRmzHlMZqSXayqxe4ECzOR27OOGwmfbgOc6CPOWKQEFQBYGFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725910009; c=relaxed/simple;
	bh=Uu832Uk5b4LaQN5ScMnX63a/5a+C3Dkjxd06KyW/bfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLBZrdzrqIBxZqkfzz04NxeKuPGZ2F/VMZTbJBDZIqbvuA+wyEUUBnkU+GG0bPNmZKHe1lL8JriAoRI5T4a4z/yOsuJqRn+YwP7+A4RAncKAPCCiGszmIcBIJLzGYaUkjung/Iatrz9unW2psmzlOlf1C4qovoztTV7hb/aO11U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=BkI6+NS0; arc=none smtp.client-ip=207.246.76.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1725909996; bh=MqUj8A8o8xViBmolQgigKvVukl8yo9wbPYV1IfunL50=;
 b=BkI6+NS0Cv+Q4HJESeMcK2GKj8uSaSQlI+BZUklvGzn6xy0bjIaMvaWK+UEV3kyLw/wSyIRK6
 o0LQC1TZgocH9jGzYrjMNJ2CaJxM5mEsMjNFgFBHFJnl8IEKkVMups63wxBAgRZNT4N46dmEM6c
 hcoiZBOQRYfrnu/yjDp3eDcqv5V1WHudpcysncazfnJl2qLYbxgg701fA80ujV2Rw3Ae7kFpstJ
 YWKdpPlHufvhfZ9VSNLwozdgLuUymFzznUqv38wCuqe4Rahv6O38x68j47wK+VMlq6SE4BpO+kU
 VU7AZJekqHxEDwKYV8BswFm8uxI3gEKwwXGS92aWL8fw==
From: Jonas Karlman <jonas@kwiboo.se>
To: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: [PATCH v6 11/11] media: rkvdec: Fix enumerate frame sizes
Date: Mon,  9 Sep 2024 19:25:09 +0000
Message-ID: <20240909192522.1076704-12-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909192522.1076704-1-jonas@kwiboo.se>
References: <20240909192522.1076704-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 66df4beac680cb8b7d2dc270

The VIDIOC_ENUM_FRAMESIZES ioctl should return all frame sizes (i. e.
width and height in pixels) that the device supports for the given pixel
format.

For coded format returning the frame size used to enforce HW alignment
requirements for CAPTURE buffers does not make fully sense.

Instead, signal applications what the maximum frame size that is
supported by the HW decoder using a frame size of continuous type.

Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
Suggested-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v6:
- New patch

With this change FFmpeg V4L2 Request API hwaccels can implement a strict
check if frame size is supported by the video device:
https://ffmpeg.org/pipermail/ffmpeg-devel/2024-August/332037.html
---
 drivers/staging/media/rkvdec/rkvdec.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
index c8c14f35ac44..9002eb3a59e5 100644
--- a/drivers/staging/media/rkvdec/rkvdec.c
+++ b/drivers/staging/media/rkvdec/rkvdec.c
@@ -334,8 +334,14 @@ static int rkvdec_enum_framesizes(struct file *file, void *priv,
 	if (!fmt)
 		return -EINVAL;
 
-	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
-	fsize->stepwise = fmt->frmsize;
+	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
+	fsize->stepwise.min_width = 1;
+	fsize->stepwise.max_width = fmt->frmsize.max_width;
+	fsize->stepwise.step_width = 1;
+	fsize->stepwise.min_height = 1;
+	fsize->stepwise.max_height = fmt->frmsize.max_height;
+	fsize->stepwise.step_height = 1;
+
 	return 0;
 }
 
-- 
2.46.0


