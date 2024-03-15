Return-Path: <linux-media+bounces-7112-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F387CA57
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 10:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23A60B20FCD
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 09:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11B80175A1;
	Fri, 15 Mar 2024 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ahRII5Fj"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E7117BA3
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710493452; cv=none; b=s8/jwWekhZwacT1+sK7n8BTpNbmNmSYe5zSG2xULtar4JzZE47SxaiJSyemjH8I7lolOUVnqzWVRtOlc0xjGaYP9ypycc+CurFt5LmXY5g+06bJy8dTgpegNrCnNPy6ZqRTO4UwGf2jhKznH8F4YdSYDHLfSIAQ5R2HaP0G4zCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710493452; c=relaxed/simple;
	bh=vBfLUcFU9OtEDtFNUKfrPhOfCDJvPHFhMTGHmpyAmGI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M3h2e6tvGfl9W0ImMx/x5Lh1ahw4bO191vUmDwiRrBnGhRWlIK41UIIh3Ct0DkXlLMMGFF4m0TNy2B4/y1624FW5i13kc8A7vTVTKqdqJHN0wHk6I9IuI0h1gh9Qdmh2GGNY8tokIG+ygmu3liJ/v8R/sLf87DWrTggZtoUfmCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ahRII5Fj; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710493449;
	bh=vBfLUcFU9OtEDtFNUKfrPhOfCDJvPHFhMTGHmpyAmGI=;
	h=From:To:Cc:Subject:Date:From;
	b=ahRII5FjyYvvVsND+eeEGZ3a2Equgjwa8EmidH0NSLXxfVvrox2ohBY8YI6zt0xkJ
	 FXGEFqQAriLjoy7I5Db4Yz0TUMN4RR940lvWc+Zx6dnw0U3CSOtesHEFCo7Ngy0x9V
	 EqGpQW6fF+tN9JzFio7JKovpaBVWYcGBw1NBB6CNJHOSYeqcs3LO0cbeKw9u1Ag7B6
	 s1FSFlqAJdoiU2YLGEyB3BHeKG4ZIFoc1XAoXQeKjrFj6oXnlKgdBiGljA48dwUYjF
	 n0/llNoKD78kbPg2b9GXiIRgriSIcpa8Cjx9KTTySWN8qHNPwTayg8FQaY/fG2obCR
	 L0mza2ZqPNYLw==
Received: from stla-brain-8255-1.home (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DF6B237820FD;
	Fri, 15 Mar 2024 09:04:08 +0000 (UTC)
From: Julien Massot <julien.massot@collabora.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com
Cc: linux-media@vger.kernel.org,
	kernel@collabora.com,
	Julien Massot <julien.massot@collabora.com>
Subject: [PATCH v2] media: dt-bindings: st-vgxy61: relax data-lanes restriction
Date: Fri, 15 Mar 2024 10:03:45 +0100
Message-ID: <20240315090345.1213957-1-julien.massot@collabora.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ST VGXY61 sensors support multiple lane numbers, as
well as lane mapping.
---
Changes in v2:
Add minimum/maximum items to restrict lane index to 1..4.
---
 .../devicetree/bindings/media/i2c/st,st-vgxy61.yaml       | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
index 8c28848b226a..a76434ecf23a 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-vgxy61.yaml
@@ -67,11 +67,11 @@ properties:
           data-lanes:
             description:
               CSI lanes to use
+            minItems: 1
+            maxItems: 4
             items:
-              - const: 1
-              - const: 2
-              - const: 3
-              - const: 4
+              minimum: 1
+              maximum: 4
 
           remote-endpoint: true
 
-- 
2.44.0


