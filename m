Return-Path: <linux-media+bounces-40690-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A77CEB30A4A
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 02:28:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 633B9A07047
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 00:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BB581096F;
	Fri, 22 Aug 2025 00:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DZdvBMIB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B56FC3;
	Fri, 22 Aug 2025 00:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755822483; cv=none; b=SM543X2LVo923N9nypuLXptYwFou8iOF7+KS7ovI5vma40EqAShNFp+KOcgqf5/Yg34Kfviln5leRmNQ4RSol0ze6zBcn3qD6ercEkxVLbZ8YyCIeygGxxsosS9WRLUk0uFcH++nKhGh+rA1Wb2AZ+TC1EEnQgE203OiEMr4Hqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755822483; c=relaxed/simple;
	bh=vOq1k/ojAZ5Xa5qxpo+564y/TrWi/0/ZGtLy4wHIKxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPRE93Ri6E9v9QPWscO9pbfr1IKhqpDhgBPd6neCpp5FPwYO65sFB5ZNHUogZnOUKp//Kl2XtNPTCSeSkOYutXsTPg82iISP5pXFFXGZ9me7i6urHNXLNg7v6XNLRzO6Geu/JNSS6N5tbQdjC2e5/v09EnW9xRSt4cUTQJ1Mabo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DZdvBMIB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 0DF1A78E;
	Fri, 22 Aug 2025 02:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822420;
	bh=vOq1k/ojAZ5Xa5qxpo+564y/TrWi/0/ZGtLy4wHIKxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DZdvBMIBh+l6kqJM97tFFn0F/UDtzyv9/EgM6XPIOz55FqyelJ4u5uoCt5OfHUu94
	 oeKnhjbr3L+iwtHtjmdHkphJf55naYEe9yCLbnyNNJGGlZEV9EeMdSnIFGEWJhN0C+
	 vjpx1iCWcD69tNJTd3A5zHzpi9Vj8wujdpj3E8BU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 01/13] media: v4l2-common: Constify media_pad argument to v4l2_get_link_freq()
Date: Fri, 22 Aug 2025 03:27:21 +0300
Message-ID: <20250822002734.23516-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


