Return-Path: <linux-media+bounces-1490-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CED3480125B
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 19:14:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CC101C20B86
	for <lists+linux-media@lfdr.de>; Fri,  1 Dec 2023 18:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BD424F20B;
	Fri,  1 Dec 2023 18:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailoo.org header.i=@mailoo.org header.b="YYuY5Df9"
X-Original-To: linux-media@vger.kernel.org
Received: from mailo.com (msg-4.mailo.com [213.182.54.15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33F5F9;
	Fri,  1 Dec 2023 10:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
	t=1701454445; bh=66Wxc8oBzIfIpIL64ix8lAT/45XRAd7lEKzgQU4F6ns=;
	h=X-EA-Auth:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	b=YYuY5Df9ro3GQCMYQnTidpOqX/jxNc+xTKpHlonbxjgDNJIx7OaW5VtF6XW5Adgrd
	 2bjl8S5T4Ruv7CX0ISfJDVK1h+a8chyZSBl23UCD5TtwU3b0JQOzkWmyM23XyGExNb
	 CqMOuiOl6JzSBTaBpycSlbUG36Wjj8L33xkXrN+M=
Received: by b221-6.in.mailobj.net [192.168.90.26] with ESMTP
	via ip-22.mailoo.org [213.182.54.22]
	Fri,  1 Dec 2023 19:14:05 +0100 (CET)
X-EA-Auth: n5s91a8huocHReaPogKTmuy+cMqxvoEKUxxcrW3YBBVPcZ0xU9Fy/MUNkEjicxBFv3ibysTPbAnbuEIqKIdDfo6iVQY91FjXy9E1pb+sHAQ=
From: Vincent Knecht <vincent.knecht@mailoo.org>
To: Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Vincent Knecht <vincent.knecht@mailoo.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/3] media: dt-bindings: ak7375: Add ak7345 support
Date: Fri,  1 Dec 2023 19:13:49 +0100
Message-ID: <20231201181350.26454-2-vincent.knecht@mailoo.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231201181350.26454-1-vincent.knecht@mailoo.org>
References: <20231201181350.26454-1-vincent.knecht@mailoo.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document AK7345 bindings.
Compared to AK7375, it has only 9 bits position values (instead of 12),
20 ms power-up delay (instead of 10), and no known standby register setting.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Vincent Knecht <vincent.knecht@mailoo.org>
---
v2 : changed commit message with details about AK7345 vs. AK7375
---
 .../devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
index 22a810fc7222..fe312cc6a873 100644
--- a/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
@@ -15,7 +15,9 @@ description:
 
 properties:
   compatible:
-    const: asahi-kasei,ak7375
+    enum:
+      - asahi-kasei,ak7345
+      - asahi-kasei,ak7375
 
   reg:
     maxItems: 1
-- 
2.43.0




