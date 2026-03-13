Return-Path: <linux-media+bounces-55755-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLXyCftItGk4kAAAu9opvQ
	(envelope-from <linux-media+bounces-55755-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:27:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AD9412881A7
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 18:27:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 15D3231EFE0E
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8D83CAE98;
	Fri, 13 Mar 2026 17:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bPWw+Wm2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA03CBE8A;
	Fri, 13 Mar 2026 17:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773422725; cv=none; b=k+kyInkW3nsdPm7qUZgkb9Kpu47OO73z1JJ4ax06Bsf+sIsQRonN859a8J1lMFVgGVgRB5EkPkpDLOyp6aF4/kXUqyjnJ64ho0qOV9Lc3yRUnJBAraijhPZMPQlPAkp4HZwfPSrckGDINqZZixP096p5d2/qAolARBJ6ofE9WiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773422725; c=relaxed/simple;
	bh=ml4brZgYysNGyVbeOm8a2m9JHM+roqQsETGmno23LcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GgCuTXpPh5TLo7kzFqB6uA6E8UXVa1B9bWYajjb/IbFgx8pj/YPwCyRhq5V1A/7yP/GmI/N8IXBPbPsB8t7Tve+qC6Fr0n/Ynx3oeo7bkfTrWtcd+gR2TQgQdbgw40sBxqEHu/+L1+bVOEMGIxq0+qJVQN5ob+Wli1Z5HuuqTi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bPWw+Wm2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F630C19421;
	Fri, 13 Mar 2026 17:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773422724;
	bh=ml4brZgYysNGyVbeOm8a2m9JHM+roqQsETGmno23LcY=;
	h=From:To:Cc:Subject:Date:From;
	b=bPWw+Wm2vENS0R2etVUo52Ys6ZStKULfae6XmmOinT+dnd68U5DQmopUMqGOmzdG8
	 a8uRfq6QRCj7WOd3kChdIl0lSXD4JwFks82csjU2kB/1V8ij/f2U5TOQ6yGD2hqDr7
	 g8LXhAYWIfp/F5jR5tDh+qNBIE/zapkVjgg6OUKJ5Xx3Z69Quslgi/ibnXv7Huyruh
	 SukHaYpysqQ5cHSBmCAaZksdyFAaUJT0kQn/bmC3rJ6bd6pClR+I4m9yctJ5dsoPOM
	 6Iy5ydxLRU1Cd2ReN+qVOHlbEMoQnMgZpid7aYuPCL3JMzbnc+WkksBepuN12v4r27
	 RB3f7cGYxRsLA==
Received: by wens.tw (Postfix, from userid 1000)
	id 033165FDD4; Sat, 14 Mar 2026 01:25:21 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH RESEND] dt-bindings: media: sun4i-a10-video-engine: Add interconnect properties
Date: Sat, 14 Mar 2026 01:25:03 +0800
Message-ID: <20260313172505.2321212-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,lists.linux.dev,lists.infradead.org,sholland.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55755-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wens@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AD9412881A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Allwinner video engine sits behind the MBUS that is represented as
an interconnect.

Make sure that the interconnect properties are valid in the binding.

Fixes: d41662e52a03 ("media: dt-bindings: media: allwinner,sun4i-a10-video-engine: Add R40 compatible")
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
This was part of a series to clean up warnings for the Allwinner device
trees. This patch was not picked up by the media maintainers.


 .../media/allwinner,sun4i-a10-video-engine.yaml        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 541325f900a1..01f2afa023f0 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -63,6 +63,16 @@ properties:
       CMA pool to use for buffers allocation instead of the default
       CMA pool.
 
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnects:
+    maxItems: 1
+
+  # FIXME: This should be made required eventually once every SoC will
+  # have the MBUS declared.
+  interconnect-names:
+    const: dma-mem
+
 required:
   - compatible
   - reg
-- 
2.47.3


