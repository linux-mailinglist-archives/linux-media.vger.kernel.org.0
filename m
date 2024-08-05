Return-Path: <linux-media+bounces-15775-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9679479FE
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 12:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E3CC1F2162A
	for <lists+linux-media@lfdr.de>; Mon,  5 Aug 2024 10:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59621154BE8;
	Mon,  5 Aug 2024 10:41:10 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 898271547EE;
	Mon,  5 Aug 2024 10:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722854470; cv=none; b=VOQh2ABX28S3GedmGYay8FBRSU/R+JsnEEWAIrRSZt8THdx8fubfL7SELC895Uzgk0HU9cr/wquhhqAnYl79V7wgXu9xWR3kMK5UWcuA00joZSTPDdgJcvt+DqbRzLr86E2FSHxS82LuND6DhpfeefMVAopjmRwfVwoiiJT4S9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722854470; c=relaxed/simple;
	bh=mFZJ/xqQhQgTJMIYPZauUt7NSv0i6nSIow4u3O+J1gg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lEEWvhb/qtw11j4u3yx7Ozo0xkj4g+/9d8HdbRrN8xcFTvwdm7u+GfIJgLt31pDp59tGwlie9Kcs60z9EJ8DT/Oyckeb7jC4aqAD3wXHM6k0QbPGVx+EiAB//Dx5lzQAIbkQdiHPX6WnVYsXqoy2ll3SyIhPpo+6HA4B6h+4KpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.09,264,1716217200"; 
   d="scan'208";a="218688163"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2024 19:35:58 +0900
Received: from localhost.localdomain (unknown [10.226.92.197])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 46A5D41FB3AD;
	Mon,  5 Aug 2024 19:35:54 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v3 0/2] Document RZ/G2UL {VSPD, FCPVD} bindings
Date: Mon,  5 Aug 2024 11:35:42 +0100
Message-ID: <20240805103549.92369-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series aims to document {VSPD, FCPVD} modules found on RZ/G2UL
LCDC IP.

v2->v3:
 * Split patch series based on subsystem from DU patch series [1].
 * Added Rb tag from Geert and Laurent.
 
[1] https://lore.kernel.org/all/20240709135152.185042-1-biju.das.jz@bp.renesas.com/

Biju Das (2):
  media: dt-bindings: media: renesas,vsp1: Document RZ/G2UL VSPD
    bindings
  media: dt-bindings: media: renesas,fcp: Document RZ/G2UL FCPVD
    bindings

 Documentation/devicetree/bindings/media/renesas,fcp.yaml  | 2 ++
 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 2 files changed, 3 insertions(+)

-- 
2.43.0


