Return-Path: <linux-media+bounces-32823-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03BDABC177
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 16:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 679093B6BBD
	for <lists+linux-media@lfdr.de>; Mon, 19 May 2025 14:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 134FF2853ED;
	Mon, 19 May 2025 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gxG0PCY0"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10131284B48;
	Mon, 19 May 2025 14:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747666691; cv=none; b=cnaSpfBVC6bKIBGD3CFe8lGmkCV4sNM/E3pn6w9DBr6lXrjgt7BeVAnLEbqb7+26A0Et06NgPVOzIrjmRyRawHVqO+LgucwLy1laEEobcLjEAmQRRnLjHAiwhyxU4MSPL3EWxZ8vQvZopQi2PiJSDxqnfZoYEJymU/Ra3HZM/98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747666691; c=relaxed/simple;
	bh=bkbHdlPUhb0Nqu7Q3OpkLLg0PDr9fRsPPKWz5i062I8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lZV9Q5ztlGJwwDDTX4yxzs3+AwkvittlvkXT/lcfJcquGO9+IHsCAzG5HXVkMQBfO92UnGvyNT5qbOyGtlILsvroHOEp5fz3zGuiPQ3N1mbd0OCmnda8btJLlfX5Obx+QfCmLf4JOJWpDF+hen+ghThws3hcGDH22rtyY//FHU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gxG0PCY0; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D33811E5;
	Mon, 19 May 2025 16:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747666666;
	bh=bkbHdlPUhb0Nqu7Q3OpkLLg0PDr9fRsPPKWz5i062I8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gxG0PCY0LTtrAjp4s2xCe+IjgkCNigE1QS94GcuIuJXKrUHeChJKFxJm82foaTelW
	 dOVST23AVjDXxcGix3nNSIjv0l9QiRvqkxQWJnDjVDSwNP7KHZ0W9vS9pvH79LNm/x
	 VST8v6TFihgVCBk/dc26Hn5oPmU/fEXzofgK67QY=
From: Daniel Scally <dan.scally@ideasonboard.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH 3/3] MAINTAINERS: Add entry for rzv2h-ivc driver
Date: Mon, 19 May 2025 15:57:54 +0100
Message-Id: <20250519145754.454005-4-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250519145754.454005-1-dan.scally@ideasonboard.com>
References: <20250519145754.454005-1-dan.scally@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry to the MAINTAINERS file for the rzv2h-ivc driver

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 514bf1f676fd..37ac0e6b423f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20225,6 +20225,13 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/usb/renesas,rzn1-usbf.yaml
 F:	drivers/usb/gadget/udc/renesas_usbf.c
 
+RENESAS RZ/V2H INPUT VIDEO CONTROL BLOCK DRIVER
+M:	Daniel Scally <dan.scally@ideasonboard.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/renesas,rzv2h-ivc.yaml
+F:	drivers/media/platform/renesas/rzv2h-ivc/
+
 RENESAS RZ/V2M I2C DRIVER
 M:	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
 L:	linux-i2c@vger.kernel.org
-- 
2.34.1


