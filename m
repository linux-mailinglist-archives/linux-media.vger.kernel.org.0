Return-Path: <linux-media+bounces-29162-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F920A77E57
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 16:58:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E4923AD585
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 14:58:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35A1205518;
	Tue,  1 Apr 2025 14:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="pjCS6mef";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OTP42og4"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CAC2054E9;
	Tue,  1 Apr 2025 14:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519513; cv=none; b=pYRrmFeesyG137CEyiOze7oVvJJEMPrgIWWtdniN+LgaJHfPeaP/cJCK+mZyTAgiTpplaZndUXAMvhPy+wzRBUcZs/axwxMnJpd64fCEpLa908xDw8CDRC4xIdy8jDUsGRxc0qT7mcx6pYFzMPDp4V5UeVCM7isXxGgyVuDeAeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519513; c=relaxed/simple;
	bh=kKrSJRKxG6Oo8a53ImmPS1bX1Mb/wo/W9WNq1FTLY8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=L3CC76wfx24Art4Mx1s9DIghRTwIlj7jrTcLuuhMcPuNp3jdL7UnBb+pO/zs/mqpnUhTvJ007Zp/nvErCMxg0vwPYA5fz2mDG8xcNI77/aQ0avodsDXtpMiTYvf0aD2ieskgI0/MqDzYfOiRmCWOBRnzBRS9MXwmtLh4gOvf3I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=pjCS6mef; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OTP42og4; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6D89C1140228;
	Tue,  1 Apr 2025 10:58:30 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Tue, 01 Apr 2025 10:58:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1743519510; x=1743605910; bh=KC
	7mtGUrl9eJOorNVhvs5IRYDxTtF1iPCLypMstgG1M=; b=pjCS6mef6g09gX95WZ
	jBXTy/wLyOHduNKnSK3N5s4fGRN29gF3uvFtOwQM0kuicutS+T4avobqYPwGOofV
	iyLOMyxyvCYVkoO+44arqlsmIKRP3OyzJz0SKfb4Fgfd7CPOs2aneZixLCKhtDuL
	RuzwiXGPW+Z3eZ1OSq5UoXQ2JEISpdAZ4+MC9b7q1ZndjObLiZfiY7m7kIubq13G
	2lAvpfo20MjeI5TawaKwQQ1P21EyprmAivtMiKUgrWA9RkRvorRz1ufvJ7qIkIQc
	s7CfDfq98pazwNVjCAVFD46JqKIbcZfxuN620m2oeOkd1EWPmnyYN+W5s8rxw+/H
	su+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1743519510; x=1743605910; bh=KC7mtGUrl9eJOorNVhvs5IRYDxTt
	F1iPCLypMstgG1M=; b=OTP42og402cI82T+4HldBJdTdKEAkUREAlQH+T4HsUBi
	8OsjyrJNyhTZ1T3tF2cNDiSsNML4YGsLEXWxnwIon1gQcilbYRzf2w4sM1NBKf17
	NJQOzlhzUFKIDmCY8eW6t1h9cjyYAt7huivyMaTGl5fKhpcvaF8zYt6c1Cy9WFlN
	4PY/nPUSqbvJGRV1flX08EfJ6cykryGR8ofe91XaBdXqVxd55Pqfv65m2BXYeV0p
	ACMgXWaqIaBjS4rJZ8mpwa/PyZHPWbbu7MQSvwswDQll65sXt2qLtZXsFtU9EEIM
	t9ssjj6pJNoHD4v2NVd4HsZziX9V/nkZP9VDzLDV3A==
X-ME-Sender: <xms:Ff_rZ3QhDKVzEwqFZBsHX9mDIEWLsHB58IUi4Ocs5UuQHoVqyP5tTA>
    <xme:Ff_rZ4ySHuMzXcRBQiZGoKQrpCZhjbwpLz9GDpldJDalhbv8ppHK-_i63J0TlqKBL
    7VoLOv34NDlPimgY1M>
X-ME-Received: <xmr:Ff_rZ82FHqSchCBN2RO86CLdbYde3CS0sFF8Vh8NgJnk_5oQ4iukIkUNUiKhUoK2aIfexXRCFspxaIt2DMEj_ilu5Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeftdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdej
    necuhfhrohhmpefpihhklhgrshcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhoug
    gvrhhluhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrght
    thgvrhhnpeehudelteetkefgffefudefuedvjeeivdekhfevieefgeffheeltddvvefhfe
    etgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehn
    ihhklhgrshdrshhouggvrhhluhhnugesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtph
    htthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrvhgvrdhsthgv
    vhgvnhhsohhnsehrrghsphgsvghrrhihphhirdgtohhmpdhrtghpthhtohepmhgthhgvhh
    grsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    gtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhhrgifnhhguhho
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhhrghuvghrsehpvghnghhuthhroh
    hnihigrdguvgdprhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggv
    pdhrtghpthhtohepfhgvshhtvghvrghmsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Ff_rZ3CSFLEkejZ_FDMs1pFhiblXqSiZGk5j5mI3joXiAW5s7DIivA>
    <xmx:Ff_rZwi-1jyDXUfpl12NKeFhecoNaOWq3IqBBLQ-NrE4hDpLyxGzdg>
    <xmx:Ff_rZ7q1cHbfXjm2atFOF3EkE_y12kpetl9gBt6NZcTwg56eZhatNw>
    <xmx:Ff_rZ7gNWPeyil3TiqemXrziJH8XLPoP4AV5y40kJELG-A1XeU0Skg>
    <xmx:Fv_rZw6Vj5Mo1aNJo0S3unYucQho7l_Mj96jOA9_rmAaD7wMuRbinGtQ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 1 Apr 2025 10:58:29 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH] dt-bindings: media: i2c: imx219: Remove redundant description of data-lanes
Date: Tue,  1 Apr 2025 16:57:58 +0200
Message-ID: <20250401145759.3253736-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The bindings already reference video-interfaces.yaml in the endpoint
node, there is no need to duplicate the description of the data-lanes
property.

  An array of physical data lane indexes. Position of an entry determines
  the logical lane number, while the value of an entry indicates physical
  lane, e.g. for 2-lane MIPI CSI-2 bus we could have "data-lanes = <1 2>;",
  assuming the clock lane is on hardware lane 0. If the hardware does not
  support lane reordering, monotonically incremented values shall be used
  from 0 or 1 onwards, depending on whether or not there is also a clock
  lane. This property is valid for serial busses only (e.g. MIPI CSI-2).

What the generic binding do not cover is the behavior if the property
would be omitted. But the imx219 driver have never agreed with the
description neither. Before commit ceddfd4493b3 ("media: i2c: imx219:
Support four-lane operation") the driver errored out if not 2 lanes
where used, and after it if not 2 or 4 lanes where used.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
Hello,

The data-lanes property is a common property and the driver have always
operated as the common description, it seemed silly to break the driver
to adhere to odd specification, then to correct the bindings. However a
more correct solution would be to do the work on the driver of course.

This is just a drive-by fix in the hope of sparing others the time to
discover this oddity themself. This is only tested by using the bindings
themself and by 'make dt_binding_check'.
---
 Documentation/devicetree/bindings/media/i2c/imx219.yaml | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/imx219.yaml b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
index 07d088cf66e0..31beeb2be2ea 100644
--- a/Documentation/devicetree/bindings/media/i2c/imx219.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/imx219.yaml
@@ -55,15 +55,6 @@ properties:
         unevaluatedProperties: false
 
         properties:
-          data-lanes:
-            description: |-
-              The sensor supports either two-lane, or four-lane operation.
-              If this property is omitted four-lane operation is assumed.
-              For two-lane operation the property must be set to <1 2>.
-            items:
-              - const: 1
-              - const: 2
-
           clock-noncontinuous: true
           link-frequencies: true
 
-- 
2.49.0


