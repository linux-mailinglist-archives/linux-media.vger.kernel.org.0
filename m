Return-Path: <linux-media+bounces-39208-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F87B1F66A
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 23:18:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFB91624E0A
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 21:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C4B27C879;
	Sat,  9 Aug 2025 21:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZfM46CwY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA05927C152
	for <linux-media@vger.kernel.org>; Sat,  9 Aug 2025 21:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754774268; cv=none; b=Sx/Es7cKdOLlt6m/RjOgrFrfyDtYLRcnEsp6nwzqTmCfvh9HWzZ/F3mh4Qj/dg+1kjXsu611IK3COfeYdgB8jDvDtIeArEks9QEXovY+03iXSBtFGEtJ8O9LJcNJJ6j3P39IeVVp5kP1rChilYpgo6vAmYtVIgPU79vLjK6mQ6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754774268; c=relaxed/simple;
	bh=i3ncbeaUP5md0qw5nE3d+UOD6ybSR/3a8bLfT5+D2oQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rt1suMlnXPL83qK3Nr5SdLjSpSRPc0BEKa8foG0jVYw9w1XVqpfILGTax778mmYdTECcjviiQTHmWHCoYXot7yjDNw9y6P9cqpBrGod6hefb8Tp8B/CtEuYOESTfbKL8XiV6qkIXkOoUOAVaXq0KIJ9HOllEddFn6+C319Dc2iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZfM46CwY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9AFF7156F;
	Sat,  9 Aug 2025 23:16:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754774203;
	bh=i3ncbeaUP5md0qw5nE3d+UOD6ybSR/3a8bLfT5+D2oQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZfM46CwY00F6bDr8CAZlplnGiCSNa0Dx3kVjnVU/+iCDAT7Z01Q+ROEGJhAHq0eA5
	 fzFoJRWkmvD+T7nwbw4pjocgDAn0YWWC2JywMuCU2z5GC5QVoyYv4C/doAKfeMb4fr
	 Q+PvJiL+dmJHl+qKbz8W/WmhU0K/njiBUaxb1Olo=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v2 15/76] media: visl: Drop visl_v4l2fh_to_ctx() function
Date: Sun, 10 Aug 2025 00:15:52 +0300
Message-ID: <20250809211654.28887-16-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
References: <20250809211654.28887-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

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


