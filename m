Return-Path: <linux-media+bounces-56008-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P5zEzkiuWnQsAEAu9opvQ
	(envelope-from <linux-media+bounces-56008-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:43:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F502A711F
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 10:43:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 765983030B98
	for <lists+linux-media@lfdr.de>; Tue, 17 Mar 2026 09:32:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F61372EDA;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxT1sfvb"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAEB36403A;
	Tue, 17 Mar 2026 09:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739944; cv=none; b=dputFqWMR2+2ep5I8KYsE3iZQsM0OGLHCBq0NSrlxY5Fev+ZdiekbPJ80vjBVsnEvJwYTRwZGiwso2JpDtdfkEaa5I8BkXENOvilAbyC31MxCEuKEEDoGLXnE1EvbJSwbYaiG0dFGwKxAvywrMgd9rBOS1O/+Vv1we8VaKdrpEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739944; c=relaxed/simple;
	bh=p8cijtpU/HSsGMiP46YwtSX4nNkA+3J4pw4gPojkcGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GgG/TgZbi+MvazJr4B8+hjY86sOVro7IYeeTD7rNj//nx3NC03VCExN+NIAMyg7no0gbrKVFc0+TXQWaYcrKKWrLunZ/Xkf9etQJN1kptWVVLltuf6aRgIaoCuPsC4ruumsjZ3pFVvCY1vifP3Nd5oI363m1wguBphXFzTdBxOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxT1sfvb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEFA3C19425;
	Tue, 17 Mar 2026 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773739944;
	bh=p8cijtpU/HSsGMiP46YwtSX4nNkA+3J4pw4gPojkcGs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UxT1sfvbxgTb3B9ITJ/TbmS4lHIDkn/zydRUjoKNKIrt86o+P6srfZAE6loUauh1+
	 BEDPiUtzt4pqLtW5kj/3n+6xTJJ5eSSQGaxZuwz/uwHHbmNtGzI8RMbrfTkhz68074
	 XhSR9XIpKhKT9UFVl/yxv/khTsTKWvzCh6xDdt2S7kTLVn0xo6szzHWitvdvRrwIyC
	 3+aW9n7AW4p4j4ZEPGYRia7joJW27YZYx4hlGGVZbdkaoMJ6gw7RGRkwhYMO6bRLbh
	 bfYlNwsjni81riLPTQ6niTYnTgSY4NwIF+Kz4v7V875O/tXcANr1Fxtd7GOi49u+mh
	 5YEuPx9EUbkrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1441F33820;
	Tue, 17 Mar 2026 09:32:23 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 17 Mar 2026 10:32:19 +0100
Subject: [PATCH v2 1/9] Documentation: admin-guide: media: add rk3588 vicap
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v2-1-77de5ee9048e@collabora.com>
References: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v2-0-77de5ee9048e@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773739942; l=4703;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=+eC6O18wtYpvs9VlVLfglS6X0TZCIanqcH/7iXnFd4I=;
 b=q11rIe2Goh3Zc4dkARzS0JFn3gmHBBTXW8XXeo89TPokkuSqBK7B646840c+h/eljYONw2tnm
 32ZB5g+PzNrCcXukt6/yl4xHYd4FITsE3izMv3aQjEZ2vrqhX1Bxuex
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56008-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:replyto,collabora.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rkcif-rk3588-vicap.dot:url,rkcif-rk3568-vicap.dot:url]
X-Rspamd-Queue-Id: 58F502A711F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

Add a section that describes the Rockchip RK3588 VICAP.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../admin-guide/media/rkcif-rk3588-vicap.dot       | 29 ++++++++++++++++++++
 Documentation/admin-guide/media/rkcif.rst          | 32 ++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot b/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot
new file mode 100644
index 000000000000..f6d3404920b5
--- /dev/null
+++ b/Documentation/admin-guide/media/rkcif-rk3588-vicap.dot
@@ -0,0 +1,29 @@
+digraph board {
+        rankdir=TB
+        n00000007 [label="{{<port0> 0} | rkcif-mipi2\n/dev/v4l-subdev0 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000007:port1 -> n0000000a
+        n00000007:port1 -> n00000010 [style=dashed]
+        n00000007:port1 -> n00000016 [style=dashed]
+        n00000007:port1 -> n0000001c [style=dashed]
+        n0000000a [label="rkcif-mipi2-id0\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
+        n00000010 [label="rkcif-mipi2-id1\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
+        n00000016 [label="rkcif-mipi2-id2\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
+        n0000001c [label="rkcif-mipi2-id3\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
+        n00000025 [label="{{<port0> 0} | rkcif-mipi4\n/dev/v4l-subdev1 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000025:port1 -> n00000028
+        n00000025:port1 -> n0000002e [style=dashed]
+        n00000025:port1 -> n00000034 [style=dashed]
+        n00000025:port1 -> n0000003a [style=dashed]
+        n00000028 [label="rkcif-mipi4-id0\n/dev/video4", shape=box, style=filled, fillcolor=yellow]
+        n0000002e [label="rkcif-mipi4-id1\n/dev/video5", shape=box, style=filled, fillcolor=yellow]
+        n00000034 [label="rkcif-mipi4-id2\n/dev/video6", shape=box, style=filled, fillcolor=yellow]
+        n0000003a [label="rkcif-mipi4-id3\n/dev/video7", shape=box, style=filled, fillcolor=yellow]
+        n00000043 [label="{{<port0> 0} | dw-mipi-csi2rx fdd30000.csi\n/dev/v4l-subdev2 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000043:port1 -> n00000007:port0
+        n00000048 [label="{{<port0> 0} | dw-mipi-csi2rx fdd50000.csi\n/dev/v4l-subdev3 | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000048:port1 -> n00000025:port0
+        n0000004d [label="{{} | imx415 3-001a\n/dev/v4l-subdev4 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n0000004d:port0 -> n00000043:port0
+        n00000051 [label="{{} | imx415 4-001a\n/dev/v4l-subdev5 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
+        n00000051:port0 -> n00000048:port0
+}
diff --git a/Documentation/admin-guide/media/rkcif.rst b/Documentation/admin-guide/media/rkcif.rst
index 2558c121abc4..fcd7f8cfc5d3 100644
--- a/Documentation/admin-guide/media/rkcif.rst
+++ b/Documentation/admin-guide/media/rkcif.rst
@@ -77,3 +77,35 @@ and the following video devices:
 .. kernel-figure:: rkcif-rk3568-vicap.dot
     :alt:   Topology of the RK3568 Video Capture (VICAP) unit
     :align: center
+
+Rockchip RK3588 Video Capture (VICAP)
+-------------------------------------
+
+The RK3588 Video Capture (VICAP) unit features a digital video port and six
+MIPI CSI-2 capture interfaces that can receive video data independently.
+The DVP accepts parallel video data, BT.656 and BT.1120.
+Since the BT.1120 protocol may feature more than one stream, the RK3568 VICAP
+DVP features four DMA engines that can capture different streams.
+Similarly, the RK3588 VICAP MIPI CSI-2 receivers feature four DMA engines each
+to handle different Virtual Channels (VCs).
+
+The rkcif driver represents this hardware variant by exposing the following
+V4L2 subdevices:
+
+* dw-mipi-csi2rx fdd30000.csi: MIPI CSI-2 receiver connected to MIPI DPHY0
+* dw-mipi-csi2rx fdd50000.csi: MIPI CSI-2 receiver connected to MIPI DPHY1
+* rkcif-mipi2: INTERFACE/CROP block for the MIPI CSI-2 receiver connected to
+  MIPI DPHY0
+* rkcif-mipi4: INTERFACE/CROP block for the MIPI CSI-2 receiver connected to
+  MIPI DPHY1
+
+and the following video devices:
+
+* rkcif-mipi2-id{0,1,2,3}: The DMA engines connected to the rkcif-mipi2
+  INTERFACE/CROP block.
+* rkcif-mipi4-id{0,1,2,3}: The DMA engines connected to the rkcif-mipi4
+  INTERFACE/CROP block.
+
+.. kernel-figure:: rkcif-rk3588-vicap.dot
+    :alt:   Topology of the RK3588 Video Capture (VICAP) unit
+    :align: center

-- 
2.39.5



