Return-Path: <linux-media+bounces-6305-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1C286F5D8
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE7D61C21942
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37E4D67E8D;
	Sun,  3 Mar 2024 15:27:24 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736F22EB09
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479643; cv=none; b=InlJog5rIiy8Oy7/gTU6W0dnnu27p7uWklhYraxHy3USl4yIUUPdEv4UfX/FrJIEx/RchADoy420w4KvIlbPPudWlnVQss0O6niOgjlaF1RJAwIPaBbVKRPvA7Vh9fqaMOh3+1LgwuE4TnIhq3ksYAEc+/iF7BneGazNPYUOc68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479643; c=relaxed/simple;
	bh=w9WmCbD3q7Vjy7dkeJ6CkfEegzqD6uqlfkFhcSSTb8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Baod7fEMaap7SNXgV79boFpP60sE3tnrw+rbs1kmK94/18YvcIEex+cnEtiRSrXj3BbRSG+P3tq1NCnTb2uTNSd/3yqFZjbxyOzUDn+2bamTMxJxT7HrI7Wd1v+KdOQU3I9apF4SkhwOtd+1rIj/C5gwCNUJL2pqUyvWiaDQw9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id AA8314C098;
	Sun,  3 Mar 2024 16:27:21 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 09/13] staging/vchiq-mmal: Add the deinterlace image effects enums
Date: Sun,  3 Mar 2024 16:10:04 +0100
Message-ID: <20240303152635.2762696-10-maarten@rmail.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240303152635.2762696-1-maarten@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

As we're wanting to wrap the image_fx component for deinterlacing,
add the deinterlace algorithm values to enum mmal_parameter_imagefx

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
index 73319a9b4b90..5007625981a7 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
@@ -393,6 +393,9 @@ enum mmal_parameter_imagefx {
 	MMAL_PARAM_IMAGEFX_COLOURPOINT,
 	MMAL_PARAM_IMAGEFX_COLOURBALANCE,
 	MMAL_PARAM_IMAGEFX_CARTOON,
+	MMAL_PARAM_IMAGEFX_DEINTERLACE_DOUBLE,
+	MMAL_PARAM_IMAGEFX_DEINTERLACE_ADV,
+	MMAL_PARAM_IMAGEFX_DEINTERLACE_FAST,
 };
 
 enum MMAL_PARAM_FLICKERAVOID {
-- 
2.41.0


