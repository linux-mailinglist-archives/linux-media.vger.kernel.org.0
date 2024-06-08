Return-Path: <linux-media+bounces-12777-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3409012CF
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 18:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA4EA1F21DCC
	for <lists+linux-media@lfdr.de>; Sat,  8 Jun 2024 16:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AD7317B503;
	Sat,  8 Jun 2024 16:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="h5Se5bZV"
X-Original-To: linux-media@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4DD17799F;
	Sat,  8 Jun 2024 16:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717864908; cv=none; b=Cs1TwBDSS39Az5WOSli3pTZLXz9pnD0uHkGGA+Yn44XKI4XH7GyVEDEZ7UXGkxlbrC0Re/VrZlPi14ndC9ofvdtggH1NEJ2pDGufMsOjR9YVquruJwQSBvNUEowOC/ScrWB2VOovpFm8s3mGs7BnXP0uVZsywqy/bs2vNC7HVl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717864908; c=relaxed/simple;
	bh=nd8aGPyRjCPGxDSOZpqcO52E+aAhPHmVWJpLMJGZyOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BTznOvGFA1d7nKWdwrYtZaKLhAeavujx9Ya72DXquNCT8JcAbfIDviohb5Csx4KivPRccRUPdT3oBYEuYCCuJtZjZ7q7PvoYAZ7FKASG5HgDoM4nbsM85PUJmXaOVEcH32380T54IScAshDr/Pb1Tz+rmlqLKyuDClTFOLggYRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=h5Se5bZV; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2ACE2FF804;
	Sat,  8 Jun 2024 16:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1717864898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ipnAqkv8CKA5NR2Dc6toWfQ3VizrwhxjHZMdAgEtcAY=;
	b=h5Se5bZVFAGO2qAnlv0h7lrd+lxou37R8kxvhSsR1dkGtYCff9dodaqilDsf2ZIrky+a/6
	D0YRn5FwNfbsZRbxTwZKVFDXViGfvZ94PODMG0DTHfaL5o3Wb/2vDfb1yenu+j/djrMYj/
	6qXo3jYIisT8MterATHVxKcYXTLMkLTqhzgkPtsSOONs5qXrIK63zVdnBB7uLSU2CyaIqG
	TIDGQRslRKi56Ms3JSCDTvFZtS1C7wVDK0qTbjUM1yNwWXBUrEibpRpjx2FZkCHnlzRMNS
	GkXzUNz4KaJ00SAVg72yR/GD2c1F7wMzBGrzacac6Pw5FBZU87bo4YPUE0NGAQ==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Sat, 08 Jun 2024 18:41:27 +0200
Subject: [PATCH] media: v4l: Fix missing tabular column hint for Y14P
 format
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240608-jmh-correct-mkdocs-luma-v1-1-7e114a2c4bdf@yoseli.org>
X-B4-Tracking: v=1; b=H4sIALaJZGYC/x3MQQqEMAxA0atI1gY6KurMVcRFaaLGmdohVRHEu
 1tcvsX/J0RW4Qif7ATlXaKEJeGVZ+Amu4yMQslQmKIytWlx9hO6oMpuRf+l4CL+Nm+xeVNZtcT
 UWAup/isPcjznrr+uG2v24dRpAAAA
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Akira Yokosawa <akiyks@gmail.com>, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717864896; l=1497;
 i=jeanmichel.hautbois@yoseli.org; s=20240608; h=from:subject:message-id;
 bh=nd8aGPyRjCPGxDSOZpqcO52E+aAhPHmVWJpLMJGZyOE=;
 b=gUl9pvpJwAefy7Oe2Hp8P8VB6tgxPvb6HKJPwmtdnwflfp9btBkySxT1L1/K5SpVrcuB1cm+h
 vfE+50pq3VrAXNEKuV3hsRJAZHxrtN+HZoQI2yyZ8j6JHgeNnZhjTnA
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=oMZuYhJzT0j5MI73RlNUVYaA8VdWpFR/Sao0JKz1D2I=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

The original commit added two columns in the flat-table of Luma-Only
Image Formats, without updating hints to latex: above it.  This results
in wrong column count in the output of Sphinx's latex builder.

Fix it.

Reported-by: Akira Yokosawa <akiyks@gmail.com>
Link: https://lore.kernel.org/linux-media/bdbc27ba-5098-49fb-aabf-753c81361cc7@gmail.com/
Fixes: adb1d4655e53 (media: v4l: Add V4L2-PIX-FMT-Y14P format)
Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
index b3c5779521d8..2e7d0d3151a1 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-luma.rst
@@ -21,9 +21,9 @@ are often referred to as greyscale formats.
 
 .. raw:: latex
 
-    \scriptsize
+    \tiny
 
-.. tabularcolumns:: |p{3.6cm}|p{3.0cm}|p{1.3cm}|p{2.6cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|
+.. tabularcolumns:: |p{3.6cm}|p{2.4cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|p{1.3cm}|
 
 .. flat-table:: Luma-Only Image Formats
     :header-rows: 1

---
base-commit: dc772f8237f9b0c9ea3f34d0dc4a57d1f6a5070d
change-id: 20240608-jmh-correct-mkdocs-luma-79d348ded7aa

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


