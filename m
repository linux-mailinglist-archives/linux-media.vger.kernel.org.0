Return-Path: <linux-media+bounces-17158-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 76880964C05
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 18:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3487D285523
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 697A91B78E0;
	Thu, 29 Aug 2024 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="iOHkCAZB";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="GDFnwU7X"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh1-smtp.messagingengine.com (fhigh1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B911B5ED3;
	Thu, 29 Aug 2024 16:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724950287; cv=none; b=C1YEzYB70U2w0EnsswBuUN8SQWP7rZvoCnYqK+S/lnnJF46ooUktY68Yvujv8emd/auM1Wol8ImgCgg0mX/xaZ/UGXGmvVPs3ls/iYVvEPTrTQ36737VxQB0ivrxXMo11hgqnNv3Cg89s2KTBqEHqXM8AoV7VENv/YOJiYNtEJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724950287; c=relaxed/simple;
	bh=dSVZZ2bPV8W6vP7O5lvv6u41qJh4Un9BiGCua3mIYnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=md9tAGFE3nC1eE2tCJgOwGfrpwEdd0BEsT8+EmXxeLm1KMmhXxGQb/Ccf2j579l3NrrZ2GWuZQtDJF47BbBuXBqxtTLSCp4KDaxQ7IanMTkQtj7qSUBwUgGXtFkYYp7n5pNRqYPMrevlrHEDPdEXiLKcSLgDor3QKy5C2T7as1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=iOHkCAZB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=GDFnwU7X; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 2139211518DD;
	Thu, 29 Aug 2024 12:51:24 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 29 Aug 2024 12:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1724950284;
	 x=1725036684; bh=jVLemmR57unJcJI+diIDepvPUo2DyEpk5n22E4yDpSE=; b=
	iOHkCAZB1yXbsYyTMyxPP8tfdB0el5b+XmBQgAcqFC0guaSvrSjCyE9alo0J9XKq
	3KPbBQHkIXl6rEpSosJeAjhm82Qwy7HiY6w3IPkCGYTOExAm4QkIOT2TCCwSK5g6
	uxhN2jZr8iFyhZAnkrnL++Gu3tu2ffJL4Hc7F0+pQ/YJv7R9/BYr6xonhmYcgiWp
	7kO0SF5WbLREmY4yvh2Lxn7etcufVaHvj8+2EAoM9JtRT46Q+klT0k3aWCuHYHoA
	XQN+T6MOaKkMkppQIlaunEwXAb7xfbbyXaQoi9C+kaQvU+gBYJss94j3jWFadrE3
	vUs7uBrC/Su00foKw96a+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1724950284; x=
	1725036684; bh=jVLemmR57unJcJI+diIDepvPUo2DyEpk5n22E4yDpSE=; b=G
	DFnwU7XjaBDrXXjYRy+5DM3AQoQ5X406EtL2V4RjBC9X4ajYqLgbyIZ05F8JLfkQ
	IvPXHnkDZWIk6FKlqqHryEY6d0wiSHXI0bSY4J0DtViZtFGQyc3ZtP7crYvrXSb8
	vbmSVG/jh0L8sMAGKXPdxoVN9+rtL/qHpV4VcuoBJofsGzIIRWO/uZm/KOCPZav4
	K5QjRIRNfexxowN3YlxFpW6f0qTipmrPWrDiMLF1z/M0rn60c9my5Tnzoel2B1Qf
	SvlXOpyvz/+OyZp8C2PTM344J3iDVcyQoBUR9So77pe+Hum7FsczckMZFd/P2uVt
	RGE2rEH9Vc/xcJWZ3MbHA==
X-ME-Sender: <xms:C6fQZsOFgvsgWwR2FbVhRkR69T_2Iq1s6xdVwbPVGQ-lQVOGWCgD8A>
    <xme:C6fQZi9CegyAfip81NOPmsnnsSOoLFgscqIUeOJsT_5qvfB69jh5aB2M6yqhfF5mw
    N6qxn73fe1oisGcYFc>
X-ME-Received: <xmr:C6fQZjTAOORixpmVPk7I77JaPcjAq_wC13H5lmRXzS1O6pI_PQDJLDGn_cpkUNXlsUkBjH9_K3noaWVpyrIajCx8bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudefgedguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredt
    jeenucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsoh
    guvghrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgr
    thhtvghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegff
    elfeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
    nhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtg
    hpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmtghhvghhrggs
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptgho
    nhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgrhgvghhkhheslhhinh
    hugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehsrghkrghrihdrrghilhhu
    shesihhkihdrfhhipdhrtghpthhtohepjhhulhhivghnrdhmrghsshhothestgholhhlrg
    gsohhrrgdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:DKfQZkv6q7UbGgVWfBWecNZjztjB0LMVwcwxrFPfdbE5mjcQ40Iucw>
    <xmx:DKfQZke4gODvgiLlLJtZN9Xag8KOuZ4eNa7v8Wxq2wGkjLOhRmwVTA>
    <xmx:DKfQZo3cuDAAFn2Z37CQuVYz9m3J99aPP1mzGBhnendINTw3IHkW6A>
    <xmx:DKfQZo8ndt82bjC24WEW8ISPVOSOMsukUCRzBgJpED5vmGTXDLT20w>
    <xmx:DKfQZj-oG8wnBICzr4iaDwBTDfbjg2AIlD4B-233exfF5OzRhzrqKeuB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 29 Aug 2024 12:51:23 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Julien Massot <julien.massot@collabora.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: linux-renesas-soc@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: i2c: maxim,max96712: Add compatible for MAX96724
Date: Thu, 29 Aug 2024 18:50:47 +0200
Message-ID: <20240829165051.2498867-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
References: <20240829165051.2498867-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MAX96712 and MAX96724 are both quad GMSL2 to CSI-2 deserializers and
are in parts similar, but not identical. The most obvious difference is
on the CSI-2 side where the MAX96712 have 4 PHYs and support D-PHY with
1x4, 2x2 and 4x2 lanes where the MAX96724 only have 2 PHYs and supports
D-PHY with 2x4 or 4x2 lanes.

The register layout overlap in part but there are differences and holes.
Most of the differences are related to the different number of CSI-2
PHYs, but there are other capability differences between the two.

Add a specific compatible for MAX96724 to the max96712 bindings. The
bindings do not yet support validating all DT properties to limit it the
each devices capabilities. However to allow for this in future a
specific compatible for the two different devices are needed.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
* Changes since v2
- Expand on the differences of the two devices and why a specific
  binding is needed for the new device.

* Changes since v1
- Group in series together with driver change.
---
 .../devicetree/bindings/media/i2c/maxim,max96712.yaml        | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
index 6c72e77b927c..26f85151afbd 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96712.yaml
@@ -25,7 +25,10 @@ description: |
 
 properties:
   compatible:
-    const: maxim,max96712
+    items:
+      - enum:
+          - maxim,max96712
+          - maxim,max96724
 
   reg:
     description: I2C device address
-- 
2.46.0


