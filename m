Return-Path: <linux-media+bounces-45774-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD46C13D58
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 10:33:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A559D580BF4
	for <lists+linux-media@lfdr.de>; Tue, 28 Oct 2025 09:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A488302CDE;
	Tue, 28 Oct 2025 09:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uvt6i+PB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62985302170;
	Tue, 28 Oct 2025 09:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643757; cv=none; b=qtBqMJ4/4dsrEcAi47FDGY3Fb46oA+tCpEbr3eZd5EhY7IUgKhJ/MV2v2MLg89whsHJNwZEPvtZZc/Gfl6vbMtMPSiaA8XBaVZo6mJk0WNdaclqQYqzzqRK3gddSNsRsSefgcVJ99PtHVAGcZS6Z8n7OjG7iRCZwzi3GNwUaeVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643757; c=relaxed/simple;
	bh=Gd7ZYV7eAPgH3Oz/R5YuQcQBNb/55k4xyoM4DemwAuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=iReko0zKh5EWnlsKI735RflX2rPFgL4SXzD++2/PZ3QyXf2qd9uXbQzeLvJCUGqcqLOHB3pmg73g3rKo5K3ZfZ+BGrRGkkF/kJENk8zH5IkXPXw0icNUuzL6TZaQLXPLxa3aZjW/vn1CSI3IaoQoAImT5KVI1obw+mRPD6mt3rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uvt6i+PB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6A976176B;
	Tue, 28 Oct 2025 10:27:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761643645;
	bh=Gd7ZYV7eAPgH3Oz/R5YuQcQBNb/55k4xyoM4DemwAuc=;
	h=From:Date:Subject:To:Cc:From;
	b=uvt6i+PBq6pH3q9jAVhNOXKhpoj48JPXQwFcIfD8yYnTaf2Ap/kcg5qDBS61Y50HB
	 qMDanX9YI1NLrcXlksCD+cqPXEHp9Vw121xlNWWnK14Dtt2iJtnJxSLBV0JZbcw61A
	 zB7NAD/dX8cTPXGaslBF1gjYcaW2I9Bm4Ct+8kp0=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Tue, 28 Oct 2025 09:28:54 +0000
Subject: [PATCH] MAINTAINERS: Update Daniel Scally's email address
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-maintainers-v1-1-d8ffbc71e8d6@ideasonboard.com>
X-B4-Tracking: v=1; b=H4sIANWMAGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyML3dzEzLwSIE4tKtZNMzU0NUxLMU8zNUhUAuooKEpNy6wAmxYdW1s
 LAJ1WcxxdAAAA
X-Change-ID: 20251028-maintainers-f5151fd7f50a
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1605;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=Gd7ZYV7eAPgH3Oz/R5YuQcQBNb/55k4xyoM4DemwAuc=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpAIzpmsTBwlkDbeUPLyQ+o+ru7/CGGQitu9I62
 0RhicZrtM+JAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaQCM6QAKCRDISVd6bEV1
 MipPEACirEnYbO695Vjwv31jmNY1u51HRinrJSkbD28XqgPbc+3eYb75mUsJiOOp2xC2LRstJdm
 7laB9cnWFHDqIrOv7c4Gwve4V07L1ikfHYpt6hrhisRfYib95RQdxjZ2twPCzp6hULIsE7bdSIq
 3rUi2FD7TXXhS8sjjmin1a3nJMjGXVifSHGIfWhrWan8JSPpoMrmW5nscvuWDBPcn0XG5GLsE+L
 ez2ag5//QBCx2gQLR0dB6Gs6FMb8vsqsQFh31uaeaI8s/ZoLQfc3ULJlvf7IzCi35h8ZZAaQjAU
 aoWEovYPK011X6biT2h9tZDRKU+fTy3Mh4u+BaMXELDp9j0lvz4phrg8CD/I3Zpyett6VPlbbGP
 Gpe3kgSbiDyeQIRW3Y3M9VWbm650QD2vig2IOVZ6rYzB8dp0jM8xxM56nrshvI/aaeHtW3qxEp6
 SLZj/NqRK7dv8Ele9P4vQPnrJeJg4yowLBv1wW1KbNHlWJFBM18g46QomPce+ugkFHKgUmZLWQx
 9T/Gg6VmwZa2JYae3NqwY1CVw57P64noLxVshZqw3/kxwsUHBNEinYaUGPZbJbRE44y2li2+P+V
 rMpcJ0HlFBQrmkSWtoprzTLG/Zn3xxYBgoP2+hWh++cBJFHRJdK2V0zOc4cR1lqnY1IZ4AD4J+3
 BVuePI3mHGZDuOg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Update my email address in MAINTAINERS from my personal account to
my work one.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f7351fced572eff0a18038095ec1724047890b55..bc83179d9345a322b4aa0a369b0fd1a41a97240b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7477,7 +7477,7 @@ F:	Documentation/devicetree/bindings/media/i2c/dongwoon,dw9714.yaml
 F:	drivers/media/i2c/dw9714.c
 
 DONGWOON DW9719 LENS VOICE COIL DRIVER
-M:	Daniel Scally <djrscally@gmail.com>
+M:	Daniel Scally <dan.scally@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
@@ -12611,7 +12611,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
 M:	Yong Zhi <yong.zhi@intel.com>
 M:	Sakari Ailus <sakari.ailus@linux.intel.com>
 M:	Bingbu Cao <bingbu.cao@intel.com>
-M:	Dan Scally <djrscally@gmail.com>
+M:	Dan Scally <dan.scally@ideasonboard.com>
 R:	Tianshu Qiu <tian.shu.qiu@intel.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -19066,7 +19066,7 @@ F:	Documentation/devicetree/bindings/media/i2c/ovti,ov5675.yaml
 F:	drivers/media/i2c/ov5675.c
 
 OMNIVISION OV5693 SENSOR DRIVER
-M:	Daniel Scally <djrscally@gmail.com>
+M:	Daniel Scally <dan.scally@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git

---
base-commit: ea299a2164262ff787c9d33f46049acccd120672
change-id: 20251028-maintainers-f5151fd7f50a

Best regards,
-- 
Daniel Scally <dan.scally@ideasonboard.com>


