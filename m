Return-Path: <linux-media+bounces-47071-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 606D6C5CC73
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 12:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68A644F1185
	for <lists+linux-media@lfdr.de>; Fri, 14 Nov 2025 11:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0FD2ED151;
	Fri, 14 Nov 2025 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jnvSE0Z5"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E558B2882A9
	for <linux-media@vger.kernel.org>; Fri, 14 Nov 2025 11:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763118277; cv=none; b=GRi/cfpucQArwhsqWpM2GEwnaoeHDK1wrj7OMCvtF3tRVfQ54P1JXQTPkMpBwZCtG57+JKRKpwY7p8t+NiromFava9ctvCOz/GdqEOHsC0GBl3/tITkTDUxdX50qBk4eodd+aNpkfli2clnzy59rkBoWTg5YNSjZ8wW8Vljq4L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763118277; c=relaxed/simple;
	bh=GdEHLAJ2Jr62iRJePEZGmMh0GCvvaPrR8OHwedO9oT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VP4R5pI35mh9MQIe9+38Ry4Spe4pIB5pbwejaEb4m1V9ULw5CRdBzmgqEeSDUZTZY1z/n01XS+6VI0fuIZ+ZKbiS5/DfteLDF5dGyb6AyIzgRBrU3BCmHfZdfUZDHMq2LEY3Z4gvHAjEOtXt0pQOJzC2MRcqF/BGzfxPuxbQWRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jnvSE0Z5; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE2241E5A;
	Fri, 14 Nov 2025 12:02:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763118150;
	bh=GdEHLAJ2Jr62iRJePEZGmMh0GCvvaPrR8OHwedO9oT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnvSE0Z5AXPLYMun5CtpmqVKYc3rStcTrfEBf+ST8nfBCaxGi3cjZSMHTOohgQ5XF
	 MSDmcXNfBmNZjGiSWf/Gk2TX6g/wfblPZ05ZNOfZr66HSe3AqqLdt3kxr1YkNBkhzJ
	 JX4fANXmxixJjQ36C6ELMxQi14kzasDPfPH51bLg=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: hans@jjverkuil.nl,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] media: mali-c55: Assert ISP blocks size correctness
Date: Fri, 14 Nov 2025 12:02:12 +0100
Message-ID: <20251114110213.523187-3-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>
References: <20251114110213.523187-1-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For each supported ISP block type the v4l2-isp framework expects
one handler and one block type info.

Static assert that the array of handlers is of the same size of the
array of block types info.

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-params.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
index cfa79a50083e..81e5944bc31c 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
@@ -465,6 +465,9 @@ mali_c55_params_block_types_info[] = {
 	},
 };
 
+static_assert(ARRAY_SIZE(mali_c55_params_handlers) ==
+	      ARRAY_SIZE(mali_c55_params_block_types_info));
+
 static int mali_c55_params_enum_fmt_meta_out(struct file *file, void *fh,
 					     struct v4l2_fmtdesc *f)
 {
-- 
2.51.1


