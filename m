Return-Path: <linux-media+bounces-39288-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F921B1F79C
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 03:32:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 231421899DEC
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 01:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB1491A08CA;
	Sun, 10 Aug 2025 01:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OoCIH1IJ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA76154BE2
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 01:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754789509; cv=none; b=j3XNfK+ZXrYKApBdAY/3cUchoXIEI8YLj+zUOjDPw+R/oNFLffRd4CdZrgXq5vM2jefR5IlE6OmRCxH8i3i5pebCkJ/aEFK9pa2jbIL2I8Gm73/I8ubSrADkHP703lheCWC2bJVxAXScaKtPAQ37a6E3wO+JBm8NTs50ZxOqUpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754789509; c=relaxed/simple;
	bh=CIrhkfiOJPLNv5SFgycTlKTklrX6gviwQm2kzkmh2gw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q9iavfZRXxk3rpAczU6hEGPfpmlusFPM9GeGcxhsMvUfGzdkEvc5MUoOt4bFm8v2vxBE/I/Co+P5ykI5h82uoZsmTQnxmyE6EAoZbsyv7sqSnffSA4+sOzd9QFHFowp9dVN+owWIsTxCrjAJ1i4408ODAVvY+2DmXSF7Ajd40pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OoCIH1IJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2F1C88CB;
	Sun, 10 Aug 2025 03:30:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754789454;
	bh=CIrhkfiOJPLNv5SFgycTlKTklrX6gviwQm2kzkmh2gw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OoCIH1IJ+xYIYQs1TMcP2InvtL+m0MuRzZMrh/rEIvONS7MtN6xhLZJWusZJ2GsMu
	 gzTlcY1NFPHRxUS6qP+is+zjYw894Vye4kd52CSc4oY3wCKHkj82EK/V1DNM/5aQBD
	 Ji2h43BBLIYgTqeOduv4rUIF5AnpuE0oMf73uDlo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v3 15/76] media: visl: Drop visl_v4l2fh_to_ctx() function
Date: Sun, 10 Aug 2025 04:29:57 +0300
Message-ID: <20250810013100.29776-16-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20250810013100.29776-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The visl_v4l2fh_to_ctx() function is unused. Drop it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/test-drivers/visl/visl.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/test-drivers/visl/visl.h b/drivers/media/test-drivers/visl/visl.h
index ad3d0ab791d6..2971e8b37ff6 100644
--- a/drivers/media/test-drivers/visl/visl.h
+++ b/drivers/media/test-drivers/visl/visl.h
@@ -166,11 +166,6 @@ static inline struct visl_ctx *visl_file_to_ctx(struct file *file)
 	return container_of(file_to_v4l2_fh(file), struct visl_ctx, fh);
 }
 
-static inline struct visl_ctx *visl_v4l2fh_to_ctx(struct v4l2_fh *v4l2_fh)
-{
-	return container_of(v4l2_fh, struct visl_ctx, fh);
-}
-
 void *visl_find_control_data(struct visl_ctx *ctx, u32 id);
 struct v4l2_ctrl *visl_find_control(struct visl_ctx *ctx, u32 id);
 u32 visl_control_num_elems(struct visl_ctx *ctx, u32 id);
-- 
Regards,

Laurent Pinchart


