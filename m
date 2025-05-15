Return-Path: <linux-media+bounces-32599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 965E5AB897A
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 16:30:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A8A73A8539
	for <lists+linux-media@lfdr.de>; Thu, 15 May 2025 14:30:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2597A1FC7CB;
	Thu, 15 May 2025 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="C3eS4PNw";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fTAV4Lfs"
X-Original-To: linux-media@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1C21DE4C2;
	Thu, 15 May 2025 14:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747319407; cv=none; b=NTYGMfSSto5HrsKlogk3WK/844ZyKIrQTb5ebA2btRGNA4AZxm2mZxy6g8WTF1q8KZ7ZYpfoefQs9EtX053c02ASCgy3uHuy8DQQwGK5xT732UDVMCFxeiJfmv/oXaCJ4Y6GIv6A1Rh+jTd1+jI1d6YQnVjbp7qZvHU89+0deO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747319407; c=relaxed/simple;
	bh=yx80i3ss/njcwOPYKpAMbsSUwMCd96dYzPK4X7KLZMM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mb7G6pRjCJanOkKp6K4CLxHae2281983OCNaFVJ75EeLAwtRrRLjQ4dSD8yzbd016CGAU5XxyonrooLd3W03ZL72xKOkTqHM1uHqhlbro4uk86EZPoYY6klWpAt8gVzYx9mBy60/aouPNzV1Svl3vof9VpQeHveol+NI2b+vgJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=C3eS4PNw; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fTAV4Lfs reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1747319403; x=1778855403;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b0tlbhLxSAEmnsveQS8FGSEE3bwObFXqb/3UCcwAnPI=;
  b=C3eS4PNwG9J/kdRo66Bx+VLJiWr4BQeIojmHH0Z7OYI9DKSZZlq4S+yv
   n7dJ4PfBNDOOB+2u9QZa3vfjQdGzUROpCrMDx8VFwGISJsdFIaQ1ZAiUU
   85NRnlw/I5bvDSog6CXOPqjnW4mrOuhTIOLUtRLFmgqsxc6XfRQpObuNi
   KylH++ftkJlIA8KHGwQjb4UH7o7xV3N9nkT9XoiNctjOSaVRqUnuvsdTm
   rZ9ZEjfl5JIq1F0IJzWLlpo/7FPjcRetjhZFVkUY6Mqr7wePQYMOBVccE
   cKkFQsQBdP63rm4bdYQmvvTAmoGKnCAzhdBvotSEicjPmo03wKwGof1y9
   g==;
X-CSE-ConnectionGUID: ifQO2kpWT6iGHzb89wHLHw==
X-CSE-MsgGUID: fskjUjC/TveuJCG2KldNMA==
X-IronPort-AV: E=Sophos;i="6.15,291,1739833200"; 
   d="scan'208";a="44102182"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 May 2025 16:29:59 +0200
X-CheckPoint: {6825FA67-20-C7E25413-F4312D34}
X-MAIL-CPID: 282EDE4D20DD297041C25D142FD40109_4
X-Control-Analysis: str=0001.0A006368.6825FA7B.0013,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 468C816A011;
	Thu, 15 May 2025 16:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1747319395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b0tlbhLxSAEmnsveQS8FGSEE3bwObFXqb/3UCcwAnPI=;
	b=fTAV4LfsxM8jq31QLG9bsTHnjTM2R1Ydftfm+t52ujoCupSJqa8L12p9ijgRKipWnMr7tq
	aZECbz7plNdc5DV7cVIC64ITpMpW51S+QoPqK1HO9DWNDJO3aQOYt//ykfYjLSJw4zK+Hf
	qSBFL9JEZaW3O4fDFqoMmaIXVBknHnlq4W8V0Dgu4TK9AA3xfkVpYrpLbj44lBsjIB1vql
	uZbr1rwqb90Xl9uuj+ELAp6mPBQe0dYf/jELUDXpQ3HZFdyDCHmIkfoItcym/YCj2Wxx7L
	ipXva2eJuTBvNLxD0b2Rr4wsMYTKVaIbojLC4ahOeany/mwTib82TVw20yE0+A==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] media: dt-bindings: sony,imx219: Allow props from video-interface-devices
Date: Thu, 15 May 2025 16:29:42 +0200
Message-ID: <20250515142945.1348722-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Allow properties from video-interface-devices. The change is identical to
commit b6339ecfd0865 ("media: dt-bindings: sony,imx290: Allow props from
video-interface-devices")

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
index 8b23e5fc6a24f..38c3759bcd9f5 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx219.yaml
@@ -16,6 +16,9 @@ description: |-
   Image data is sent through MIPI CSI-2, which is configured as either 2 or
   4 data lanes.
 
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
 properties:
   compatible:
     const: sony,imx219
@@ -79,7 +82,7 @@ required:
   - VDDL-supply
   - port
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.43.0


