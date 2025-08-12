Return-Path: <linux-media+bounces-39705-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C3B23B4F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 43C3B721284
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86942E8E1E;
	Tue, 12 Aug 2025 21:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L5Es3lyl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FC82E0915;
	Tue, 12 Aug 2025 21:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035318; cv=none; b=anoQ5zqFeAfvrBl3SJt86n4MCaYK1MoVJytXjfs4VfGr0ZDTMDmbUqMFPvhSx4kF8UUGhNkMJ8JgcdMa5VQzYdTl/Eingxz1SUP1XFAl2fDcdft/2LbFET7WuDBtQCvBtVXAYl+//efDwn6if/7KQPHp+qtNOjykALLxJhiS+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035318; c=relaxed/simple;
	bh=uXD9YFkjdH32fOGUkk6wPAsbMepaqe2zOMOXLZb1/ZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mKQwyn//dkyhIAFx6qqS3MeYGwcy0e6Y7RVp/t536vCuo5jms0m7ZsbPq7MdRT/uf1ZPrWEz+ZbX9YaOJvamP9KByCCviILvpaTHRNJecp+Bt7o1jdSt3e7r+YKbZeXPsY6/SwkP0TLC/cJQJXDkyrDunwlHScQXAP074SrGYyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L5Es3lyl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 8E1DC15BF;
	Tue, 12 Aug 2025 23:47:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035262;
	bh=uXD9YFkjdH32fOGUkk6wPAsbMepaqe2zOMOXLZb1/ZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L5Es3lylPE7h5CjzvvyhbLxoYZZrxMxoW9p7iGf3TM1YMXcNUyEwidlcnzOfVn0Ye
	 rzp4UcmpJ6KuNqnOMUh2bphQjyrMCU4spUXs/kXXxzGEJ36c2C5cNwKBjD4YP1oWbO
	 XdxQnUfD2D0yWgpDuvpOS+StAsJb9DpQPtzdl2dg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 70/72] arm64: dts: qcom: sdm845-db845c-navigation-mezzanine: Replace clock-frequency in camera sensor node
Date: Wed, 13 Aug 2025 00:46:18 +0300
Message-ID: <20250812214620.30425-71-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. Replace it in
the device tree.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
This patch depends on "media: i2c: ov8856: Use V4L2 legacy sensor clock
helper", which we tentatively plan to merge for v6.18. It should
therefore be postponed to v6.19.
---
 .../boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
index 51f1a4883ab8..dbe1911d8e47 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtso
@@ -44,7 +44,8 @@ camera@10 {
 
 		clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
 		clock-names = "xvclk";
-		clock-frequency = <19200000>;
+		assigned-clocks = <&clock_camcc CAM_CC_MCLK0_CLK>;
+		assigned-clock-rates = <19200000>;
 
 		/*
 		 * The &vreg_s4a_1p8 trace is powered on as a,
-- 
Regards,

Laurent Pinchart


