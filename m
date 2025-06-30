Return-Path: <linux-media+bounces-36274-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16430AEDA90
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 13:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE918189898C
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 11:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EE7425B311;
	Mon, 30 Jun 2025 11:14:04 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EF725B67D
	for <linux-media@vger.kernel.org>; Mon, 30 Jun 2025 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282044; cv=none; b=drJr4bgyYIFE73jrpC9gZnQDPsd3K2xcrIxqc6POKBu1IG7NNDovuktD8DJhWrQuFwOoc3zRRr5Zby+K0RSunjadw+rNY8KNJk15U8jhz5mzhXGcLRqDqmQyWfw31KVC5p2rPUriJtbGUJ2QZwEWI2nn2ejQb5YmXEsK0S1ex8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282044; c=relaxed/simple;
	bh=Wi4e7EYaHCnBdaUTJf7HBaT24fBVDIFn/Incuka7XYg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzeP3ipfAXOHNfM/WSuDC7vDkRpmNTAaWYRtOxTGUByoARwvYTpb3BFxzfEFS4XySWkd/xhlX42UxFepr8QwuCzLTseuy0XJ8orDACaSPFc1SWp4ixWzq2pG1ZHfUFVnflvW7DSHcIJrg3z6vSRRHvZMp/+e8kPcxATHF/BNeqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10ABCC4CEEB;
	Mon, 30 Jun 2025 11:14:02 +0000 (UTC)
From: Hans Verkuil <hverkuil@xs4all.nl>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 3/5] Documentation: media: cec: update error inj doc
Date: Mon, 30 Jun 2025 13:08:48 +0200
Message-ID: <d88eae34a4ba4b8cb67ed104ba09afb10fb60531.1751281730.git.hverkuil@xs4all.nl>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1751281730.git.hverkuil@xs4all.nl>
References: <cover.1751281730.git.hverkuil@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document rx-no-low-drive and the new support to inject
glitches.

Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
---
 .../media/cec/cec-pin-error-inj.rst           | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst b/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
index 411d42a742f3..c02790319f3f 100644
--- a/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
+++ b/Documentation/userspace-api/media/cec/cec-pin-error-inj.rst
@@ -41,6 +41,9 @@ error injection status::
 	#   <op> rx-clear  clear all rx error injections for <op>
 	#   <op> tx-clear  clear all tx error injections for <op>
 	#
+	# RX error injection settings:
+	#   rx-no-low-drive                    do not generate low-drive pulses
+	#
 	# RX error injection:
 	#   <op>[,<mode>] rx-nack              NACK the message instead of sending an ACK
 	#   <op>[,<mode>] rx-low-drive <bit>   force a low-drive condition at this bit position
@@ -53,6 +56,10 @@ error injection status::
 	#   tx-custom-low-usecs <usecs>        define the 'low' time for the custom pulse
 	#   tx-custom-high-usecs <usecs>       define the 'high' time for the custom pulse
 	#   tx-custom-pulse                    transmit the custom pulse once the bus is idle
+	#   tx-glitch-low-usecs <usecs>        define the 'low' time for the glitch pulse
+	#   tx-glitch-high-usecs <usecs>       define the 'high' time for the glitch pulse
+	#   tx-glitch-falling-edge             send the glitch pulse after every falling edge
+	#   tx-glitch-rising-edge              send the glitch pulse after every rising edge
 	#
 	# TX error injection:
 	#   <op>[,<mode>] tx-no-eom            don't set the EOM bit
@@ -193,6 +200,14 @@ Receive Messages
     This does not work if the remote CEC transmitter has logical address
     0 ('TV') since that will always win.
 
+``rx-no-low-drive``
+    The receiver will ignore situations that would normally generate a
+    Low Drive pulse (3.6 ms). This is typically done if a spurious pulse is
+    detected when receiving a message, and it indicates to the transmitter that
+    the message has to be retransmitted since the receiver got confused.
+    Disabling this is useful to test how other CEC devices handle glitches
+    by ensuring we will not be the one that generates a Low Drive.
+
 Transmit Messages
 -----------------
 
@@ -327,3 +342,30 @@ Custom Pulses
 
 ``tx-custom-pulse``
     Transmit a single custom pulse as soon as the CEC bus is idle.
+
+Glitch Pulses
+-------------
+
+This emulates what happens if the signal on the CEC line is seeing spurious
+pulses. Typically this happens after the falling or rising edge where there
+is a short voltage fluctuation that, if the CEC hardware doesn't do
+deglitching, can be seen as a spurious pulse and can cause a Low Drive
+condition or corrupt data.
+
+``tx-glitch-low-usecs <usecs>``
+    This defines the duration in microseconds that the glitch pulse pulls
+    the CEC line low. The default is 1 microsecond. The range is 0-100
+    microseconds. If 0, then no glitch pulse will be generated.
+
+``tx-glitch-high-usecs <usecs>``
+    This defines the duration in microseconds that the glitch pulse keeps the
+    CEC line high (unless another CEC adapter pulls it low in that time).
+    The default is 1 microseconds. The range is 0-100 microseconds. If 0, then
+    no glitch pulse will be generated.The total period of the glitch pulse is
+    ``tx-custom-low-usecs + tx-custom-high-usecs``.
+
+``tx-glitch-falling-edge``
+    Send the glitch pulse right after the falling edge.
+
+``tx-glitch-rising-edge``
+    Send the glitch pulse right after the rising edge.
-- 
2.47.2


