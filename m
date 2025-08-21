Return-Path: <linux-media+bounces-40497-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C2FB2E944
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 02:10:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27A35E2F29
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 00:10:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A4114AD2D;
	Thu, 21 Aug 2025 00:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vyHaERdw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EB735975;
	Thu, 21 Aug 2025 00:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755735013; cv=none; b=UXdsthzwMvmXijr1tO5ufdFNmabG4HsJtiqDs5mKTLYWfDOEIeKenklLGudKsT+Cg7Hf0qIZnR3OFREelpu721eEE8Ye0a0o9Le11Ee2NuR6+B98/9et5F72JEYZ27gaGFApqJP/3QT3PDTjvMBmegVnlYVib0sNqlzdjrxPNZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755735013; c=relaxed/simple;
	bh=0qkR20lf56u8fmx7aMiqFClT7ntROxnOMZyBFXa+dW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fi/xcUXB1T8JG2QQkDJCqy3DS+FkMB1REPy2zb4bGiHqKyzOGeGtfAOb82k73oDIuAzp8Wpcse2f8eN1wA9461Zp0GjlCoQ1ec0dsvawCn1TF+QMBc7LLERU3f3PYfBCJBpITo5K1AgTZp0BOsaxOFOxGLPIC3OZUYlGG1gDyTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vyHaERdw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 25A6011D5;
	Thu, 21 Aug 2025 02:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755734951;
	bh=0qkR20lf56u8fmx7aMiqFClT7ntROxnOMZyBFXa+dW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vyHaERdws74EABFhq52+jVBNk9nt0uz6y7LmFjZrhqe5dPKQzao5MTFQ6cD0TkBCy
	 /cxNUNR+6bOS1+MoFMJJY/WOKn5t2h2rsMIRXGwfFmuso9PA6DHv7H3ehcgkhiLGYj
	 NiRP6HZ5NJXKyi4A6nOIzDg9/UCIaKWX2M0eplv4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 01/12] media: v4l2-common: Constify media_pad argument to v4l2_get_link_freq()
Date: Thu, 21 Aug 2025 03:09:33 +0300
Message-ID: <20250821000944.27849-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
References: <20250821000944.27849-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The v4l2_get_link_freq() macro doesn't modify the pad argument. Make it
possible to call it with a const media_pad pointer.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-common.c | 2 +-
 include/media/v4l2-common.h           | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-core/v4l2-common.c
index a5334aa35992..4d686338e345 100644
--- a/drivers/media/v4l2-core/v4l2-common.c
+++ b/drivers/media/v4l2-core/v4l2-common.c
@@ -551,7 +551,7 @@ s64 __v4l2_get_link_freq_ctrl(struct v4l2_ctrl_handler *handler,
 EXPORT_SYMBOL_GPL(__v4l2_get_link_freq_ctrl);
 
 #ifdef CONFIG_MEDIA_CONTROLLER
-s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
+s64 __v4l2_get_link_freq_pad(const struct media_pad *pad, unsigned int mul,
 			     unsigned int div)
 {
 	struct v4l2_mbus_config mbus_config = {};
diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 39dd0c78d70f..ede24e60dbec 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -580,10 +580,11 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 pixelformat,
 #ifdef CONFIG_MEDIA_CONTROLLER
 #define v4l2_get_link_freq(pad, mul, div)				\
 	_Generic(pad,							\
+		 const struct media_pad *: __v4l2_get_link_freq_pad,	\
 		 struct media_pad *: __v4l2_get_link_freq_pad,		\
 		 struct v4l2_ctrl_handler *: __v4l2_get_link_freq_ctrl)	\
 	(pad, mul, div)
-s64 __v4l2_get_link_freq_pad(struct media_pad *pad, unsigned int mul,
+s64 __v4l2_get_link_freq_pad(const struct media_pad *pad, unsigned int mul,
 			     unsigned int div);
 #else
 #define v4l2_get_link_freq(handler, mul, div)		\
-- 
Regards,

Laurent Pinchart


