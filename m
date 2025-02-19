Return-Path: <linux-media+bounces-26371-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D48C7A3C07F
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 14:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AEC618918A4
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 13:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3A3E1E47D6;
	Wed, 19 Feb 2025 13:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="R+9lbiSc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2B31C4A16;
	Wed, 19 Feb 2025 13:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972987; cv=none; b=W0roSWGMiuHnffPPt5EP7E1owsFxtsibJsMA80EsL881qI58fWt2U04LygkpLwEfbKAg7sfrJ8MobqpFAzekJOp3MDj3NPFyFBmgcQC3xUs0L/O/OCFrulde2lq5LGhxrVR+/8UkzUKNWlXTa2J6w+tiITg0G8ANsVnev8S3hZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972987; c=relaxed/simple;
	bh=rSI6cx/RPfMQe4oAO+y9gJg7CLsr656IO2NxzyrCboE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XBb2vwCRd2n+irfSGvIVg2JObgkntkLx5J9Cfifw+6JM8lW2etDtCfJXrqlt6Q9DurxJJnk1TZEfmOhb1qNFPo5fYd2o9tXDHOeiskyT1q36u8mBhqZAB1BG5z7cSxH5wdV1gLYyNOrDsnSwGGPuzqxyuUTaalVHIeHHNZeGatA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=R+9lbiSc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47A6A169;
	Wed, 19 Feb 2025 14:48:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739972900;
	bh=rSI6cx/RPfMQe4oAO+y9gJg7CLsr656IO2NxzyrCboE=;
	h=From:Subject:Date:To:Cc:From;
	b=R+9lbiScC/nHVPWs9+SGMll4rlZQvE99G0dNxHodkmScLMqc6qRbBCIQ1GBw2Wl/u
	 zg0C0hKOpfzXmfzaGXcLpESzUjwDu5QxTAtDC7IcEJx7rsIqM2qzKwqnWEbCIVg6Rx
	 gysF0+UACX+aXx6/LEPdnO9JaSOlhjPrRUr/LacM=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 00/18] media: rcar: Streams support
Date: Wed, 19 Feb 2025 15:48:54 +0200
Message-Id: <20250219-rcar-streams-v1-0-f1b93e370aab@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEnhtWcC/6WQwWrDMBBEf8Xo2spoZUu2TCn9j5LDWt7EIpGda
 h1TCPn3Kg70lEvpaZmFeTuzV8GUArHoiqtItAYO85QFvBbCjzgdSIYha6GVNkqDk8ljkrwkwsg
 S9gNh21pFhkS2nBPtw/eG+9w9dKKvS6Yuj6WIxIwbtSveMrRWoF2e2tQlgLZZSpBTOJ6QS54HS
 qfLNLwkmoiRPxIeJlzIjyXT+/3iUx444zYeKFtXf+L9lu6KrTJo9agcaQgoQzynWWpfNR5UZQl
 ct8KzHPdnKWiMBVOCba3R7l85NLRynzCSHIi9PCPzMqb5chilta0yVEPlmrpb9d3dI5P0c4xh6
 Qpf903TOOy9tWJ3u/0A3n0s4/QBAAA=
X-Change-ID: 20250219-rcar-streams-1fdea8860e5e
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=4516;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=rSI6cx/RPfMQe4oAO+y9gJg7CLsr656IO2NxzyrCboE=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnteFvxiG4uHuUogZ/dy0udlygvfz2o08EGqUlt
 VDbNW3puX2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ7XhbwAKCRD6PaqMvJYe
 9XkwD/sGzrtr9Fr9Y6BM5C2NgVKGxEG12mdpbbcDP3SvC+/z6sUd+s42yrr4V8N+AnYBs14BBOu
 kQYPYL20rmIkvAjAHeC1mORYiKfYz1o6V8bwlt6NB/xYPaSokFtXR4FFpJE5Y++OQ+OdSgCTFqt
 wRymxVuPALYJcxUdg21Zl/dWdDCrEyQqmwBG0V/NtisqXyCBQ7UbgPiDaQkwDGA9TVwM6O8xOOy
 m3WzzDjI4NDEDhySVuxtuA27AwLfrNMGsvPczRIDEPQDgzTC/sm2sHIE47n6577dxp4ytXODQ4Z
 Mi4a5wkn+IQLq6oevcNIPaHO9jg4ob4N4dDXqPEVl8KXJQSkoKX2EdxaE65vhM35hhf7mqox1vz
 CBjQ0bjhCg54Qdewv4gZ/BTXw4MnIWfqYhD4FAG2GgG3MMff3C5MiZ7S5AwF6L5lGjuEiD980m/
 lVMCpOInLn1T8NesMLESPkkgjg2ckDoNb0KG92zwrDi7V5PaiGLqhgWPwhzanPG33vTKHpFlM7v
 LlYP68xur7ss4e443T30SJhSE1tH2Ndm7evwZ/spkoDd4mWCLvKft0cmthUn6WFtOgVQffNRh06
 S7sOvxibfooXMev0I1zmomIrP9v6IfrC2otHI8RXaTkzGWvVtdKkRgDp8fsE2McNcdlIFp/481Y
 pJuOL48vynqnvag==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Add streams support to Renesas rcar platform driver.

The series attempts to keep compatibility with the current upstream.
However, in upstream there's some kind of custom multi-stream support
implemented to the rcar driver, which breaks at patch "media: rcar-csi2:
Simplify rcsi2_calc_mbps()".

The behavior should not change when using a single stream.

A problem with the series currently is that it has a lot of
dependencies that are not in upstream yet.

Testing is even more problematic, as the only way currently for me to
get multiple streams is by using the GMSL2 deserializer add-on board
with GMSL2 serializers. These are not supported in upstream. If someone
has the hardware and wants to test, I can share the very-WIP branch that
contains the missing pieces.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Tomi Valkeinen (18):
      media: rcar-vin: Add RCAR_GEN4 model value
      media: rcar-vin: Fix RAW8
      media: rcar-vin: Fix RAW10
      media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
      media: rcar-isp: Move {enable|disable}_streams() calls
      media: rcar-csi2: Move {enable|disable}_streams() calls
      media: rcar-csi2: Fix typo
      media: rcar-csi2: Move rcar2_calc_mbps()
      media: rcar-csi2: Simplify rcsi2_calc_mbps()
      media: rcar-csi2: Optimize rcsi2_calc_mbps()
      media: rcar-csi2: Switch to Streams API
      media: rcar-isp: Switch to Streams API
      media: rcar-csi2: Add .get_frame_desc op
      media: rcar-isp: Call get_frame_desc to find out VC & DT
      media: rcar-csi2: Add more stream support to rcsi2_calc_mbps()
      media: rcar-csi2: Call get_frame_desc to find out VC & DT (Gen3)
      media: rcar-csi2: Add full streams support
      media: rcar-isp: Add full streams support

 drivers/media/platform/renesas/rcar-csi2.c         | 430 ++++++++++++++-------
 drivers/media/platform/renesas/rcar-isp.c          | 228 ++++++++---
 .../media/platform/renesas/rcar-vin/rcar-core.c    |   2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |  20 +-
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |   8 +-
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |   1 +
 6 files changed, 499 insertions(+), 190 deletions(-)
---
base-commit: c4b7779abc6633677e6edb79e2809f4f61fde157
change-id: 20250219-rcar-streams-1fdea8860e5e
prerequisite-message-id: <20240129202254.1126012-1-niklas.soderlund+renesas@ragnatech.se>
prerequisite-patch-id: 23c9dfd64dd6176312d50191e60b0a92937c0051
prerequisite-patch-id: c49831184e0a6ff063cadbc79381c0f68d5b0f63
prerequisite-patch-id: 47104e797dfef692022a72cb62d7fad2fc44f0f5
prerequisite-patch-id: c89cf1fd9e528e6685ba8ce1e93e94f019f43913
prerequisite-patch-id: e096565500ed748974824328adf14905ae40bcaa
prerequisite-patch-id: 87a61e2c15f59928a96e9213c338cc2a65344c58
prerequisite-message-id: <20240129195954.1110643-1-niklas.soderlund+renesas@ragnatech.se>
prerequisite-patch-id: 748963119debbf990374b9eb06659381a3924824
prerequisite-change-id: 20250120-rcar-media-impro-2c37c1036e19:v1
prerequisite-patch-id: 3741e9cc665b78b56d18eee0041626d3c739dad5
prerequisite-patch-id: 99a13857e0de3c1cadc7a971f6c3fb4449599313
prerequisite-patch-id: a034cd446e21ba28273607f1d928c13739fb83f9
prerequisite-patch-id: cdf480b4562e749c4190ceec50e78a8dac155bd5
prerequisite-patch-id: 94c99ecd291d3d3f86b148406bbc383405016f2a
prerequisite-patch-id: 690790ff01515aa452e73581c3ee4312246bfbc2
prerequisite-patch-id: 74c5bed5396ef54ded950b9c449ea23b8f67636b
prerequisite-patch-id: 3a6b197715760886ab383fefe1d5f95f40d8b063
prerequisite-patch-id: e9f04f626ae08c981faa66de72663e8940a4f92e
prerequisite-patch-id: 58b5dc8fd9026dcfede60b005294692964def2a1
prerequisite-message-id: <20250210175615.1686529-1-niklas.soderlund+renesas@ragnatech.se>
prerequisite-patch-id: a4aa6a184c6a21fc4536c11e14d9b5cc61f13346
prerequisite-patch-id: 1b0091875529d392b142814005baa38b2ef77f98
prerequisite-patch-id: 4c960ae93b1e663b11194903ed1810e0ed1e4f59
prerequisite-patch-id: a5641e1dcad0f39baef8996b6731a471046f18f9
prerequisite-patch-id: 481317ba4b987cbb069c31f3372686a59c0fcb67
prerequisite-change-id: 20250218-frame-desc-passthrough-66805e413974:v2
prerequisite-patch-id: da0097f1a6c5b58f87210acd974d7eba0b721dc3
prerequisite-patch-id: 7cc5997549353a7e300f4778fd883e900d2251b2
prerequisite-patch-id: 57d4622505842a9c9b8cbedb49745a155826c464

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


