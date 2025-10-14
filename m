Return-Path: <linux-media+bounces-44452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8374ABDACE8
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2EF9D355ACC
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C61A3090D6;
	Tue, 14 Oct 2025 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shnoay6t"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CDD221555;
	Tue, 14 Oct 2025 17:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463648; cv=none; b=UscKkvEd4n0cQ2EKgv/ETsXwisXhqGKW6IZeXx5slfeI9d+HhGXTgmikZj1qOTkh0Jrp/RnrFdKVXMsnu+a/6fbrsAp7JtunKKBTkxViz3dc5i5oFpkfdjU2Q6yrJ/tzVAzca6kJTw6GK1ZtxhCshzchE2ioSxcFC9tRPuw+x5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463648; c=relaxed/simple;
	bh=jNooQ+ISNSIuvHJbhz4rUaC0GGIiE8YctJMnOdXBvFU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KS8ZObi+lLg82xoIii0cOVCZbuprSlrlKwpsj6fw4/AIE7gy832ZURcvtQADQ5elaxkiSsuW0zjy96bqiYlfcXQSr3bndzVPzTNBp3BKOLvQwjjVtQn9KOBDv++rmHj/PgbViB+scBwpmnT6/ocCZjgOqOk6EPZfxBBNCKsiRxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shnoay6t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F90C19421;
	Tue, 14 Oct 2025 17:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463647;
	bh=jNooQ+ISNSIuvHJbhz4rUaC0GGIiE8YctJMnOdXBvFU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=shnoay6tuJjr+P5Nn5v4S/o3M/v82K8ZmgRKZbEKR7sLjG2GEF+Q8fz/Y08Lg2LOD
	 435JVdSA0D2ofg9HnIdjOnrkxMiwItvwZNvjskWDC85KeROc9xxqT33i4DtHs7+AVi
	 y32KG9GiQMr3b1QMifxaeHRsn/klTpY/MEXT+xu2E6tDzXtjRbx+Vhee6C26kebo60
	 w82TEduK+MGeriy0XK9nL9HvqvGhobkOyXZ5h3r9ZlO8v1t/xqoCYUShRhai0tSZ0P
	 XoLUjwXIwSsBdvhVlcyK6y4+YDrD0qPDH9x+HkfzO+La1Ns9yEWPIaRN3zVpvGSZqr
	 IRZHA04BT/Pbw==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 05/25] media: i2c: ov01a10: Fix passing stream instead of pad to v4l2_subdev_state_get_format()
Date: Tue, 14 Oct 2025 19:40:13 +0200
Message-ID: <20251014174033.20534-6-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 2 argument version of v4l2_subdev_state_get_format() takes the pad
as second argument, not the stream.

Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Note the problem pre-exists the Fixes: commit but backporting further
will require manual backports and seems unnecessary.
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index f92867f542f0..0405ec7c75fd 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -731,7 +731,7 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 					 h_blank);
 	}
 
-	format = v4l2_subdev_state_get_format(sd_state, fmt->stream);
+	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	*format = fmt->format;
 
 	return 0;
-- 
2.51.0


