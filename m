Return-Path: <linux-media+bounces-39567-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFF6B223A3
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 11:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A0602A240A
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 09:47:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08B902EA162;
	Tue, 12 Aug 2025 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tyNrp98U"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601532D4B73;
	Tue, 12 Aug 2025 09:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754992044; cv=none; b=Mn9tzPDQJ0bHXFboGZIe34NPSPCrhH/21qKJiFMgsdaiGssmcNpUdz/TLzVm5RqWZP3oktKwbPY8uW+ZE/hITp6YCHFKrMe+6STtI5DvDcZYPHVUYBQ8J+GKmW5Anx3pocbULaKflnvZcnjMiKk5FiMsuRgOjUiSyrObCLMSXNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754992044; c=relaxed/simple;
	bh=BJs+PV48e2lUraYfb/KIiWsw8dhvx3dq+hcyOlziiHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdupjTpWwe/rysZS9FbYEEH+pS7dkPVQ8/Z92gFkc04lk2a/q3AVxcXIKjSEC+byvvrNW93YM0EB5ebDdC22XThzGCW8lNr1P+Z06MoEIGk3DprFysnB6/DMqrmmJxhlzMbA1S9uYEONtlA7ktK8CcTeb+YDqR4bmk0UTytUJbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tyNrp98U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B24C4CEF0;
	Tue, 12 Aug 2025 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754992043;
	bh=BJs+PV48e2lUraYfb/KIiWsw8dhvx3dq+hcyOlziiHw=;
	h=From:To:Cc:Subject:Date:From;
	b=tyNrp98UJCiNfosES08JBjAKl9a2ARrivZrRH7/7/83NPVVh+t9TsByTyzizdw1Hm
	 TuGAAruIuoLW4ytJ/gjfDvLFe2h/Q4OCdO5mkeox+dUuiuz4BUE6vJ18a2B0Ywr8x5
	 MMHBl0KotP2f8Gl9xAZbYyG+lcsHMrcpxuD84q7Kj9QkFGJQLvCav80t2wrCrHk6/k
	 1ka0ffHjwXllcofAM4QsDPtwnmcn/hxn1JQDneBCnMy4iaejXaJC+U0xEDS1cjpAvy
	 BV67XroGns06SghBnz+kFEFXTprR5wqAc2ekRvxXIUuQ0qWwIFlT0tI0SSjUhspeuh
	 BX4gziqIGBffw==
From: bod@kernel.org
To: krzysztof.kozlowski@linaro.org,
	quic_vgarodia@quicinc.com,
	quic_dikshita@quicinc.com,
	hverkuil@xs4all.nl,
	mchehab@kernel.org,
	abhinav.kumar@linux.dev
Cc: linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bryan.odonoghue@linaro.org,
	Bryan O'Donoghue <bod@kernel.org>
Subject: [PATCH] media: platform: qcom: Add a media/platform/qcom MAINTAINERS entry
Date: Tue, 12 Aug 2025 10:47:18 +0100
Message-ID: <20250812094718.11378-1-bod@kernel.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bryan O'Donoghue <bod@kernel.org>

Point the MAINTAINERS file to the linuxtv.org patchwork, to me for
merging media/platform/qcom and to the media-comitters gitlab.

Remove my +R from venus and iris so that get_maintainers.pl lists me for
drivers/media/platform/qcom as +M.

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 MAINTAINERS | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45..bb1b904e618cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20815,7 +20815,6 @@ QUALCOMM IRIS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
 R:	Abhinav Kumar <abhinav.kumar@linux.dev>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
@@ -20830,6 +20829,17 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mtd/qcom,nandc.yaml
 F:	drivers/mtd/nand/raw/qcom_nandc.c
 
+QUALCOMM MEDIA PLATFORM
+M:	Bryan O'Donoghue <bod@kernel.org>
+L:	linux-media@vger.kernel.org
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+Q:	https://patchwork.linuxtv.org/project/linux-media/list
+T:	git https://gitlab.freedesktop.org/linux-media/media-committers.git
+F:	Documentation/devicetree/bindings/media/*qcom*
+F:	drivers/media/platform/qcom
+F:	include/dt-bindings/media/*qcom*
+
 QUALCOMM SMB CHARGER DRIVER
 M:	Casey Connolly <casey.connolly@linaro.org>
 L:	linux-arm-msm@vger.kernel.org
@@ -20886,7 +20896,6 @@ F:	drivers/usb/typec/tcpm/qcom/
 QUALCOMM VENUS VIDEO ACCELERATOR DRIVER
 M:	Vikash Garodia <quic_vgarodia@quicinc.com>
 M:	Dikshita Agarwal <quic_dikshita@quicinc.com>
-R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.50.1


