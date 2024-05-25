Return-Path: <linux-media+bounces-11866-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A3D8CED23
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 02:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A8DF1C21118
	for <lists+linux-media@lfdr.de>; Sat, 25 May 2024 00:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E5C208D6;
	Sat, 25 May 2024 00:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="gM/WzCfV"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299E214AB4;
	Sat, 25 May 2024 00:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716595369; cv=none; b=n/v6mZIlz1XKb73zcaGQjh1TRRnxAS39y0TbMVqYBa0zVCZIROHTquFW0BhnHygfCG+saiHthaXJ0FRy1+aWxx1tXQsrBxFinp8iahK22moTj0ml9hsCB3bRlOeKV+tiB6QpCYtb0Ec3gtBakYS2JHwL9OaROpZr2krOFqdPK+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716595369; c=relaxed/simple;
	bh=CCcjSZqzsrKz0nV7FFyP45kQ4TL0l3/Kmr9dL8UzXb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FkuLF0qLd/W6AlORdaOT7dUUFE9QNsK6t3itt+uY+OpURQB2UjHrEVq3dZFOtWs1HOx+G5WpE0xKQoCi934aRvrxjGxJ80J3PI5e1xBOTR4VO0GnC6rJIMzsSh9qBkQHZ2HXeDglXfyfjZaS4ZqcwMa9l2xjooCCSMlm6xLbYsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=gM/WzCfV; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=47fHQ0JrYe5JAX3Z6GnvPA5cT+jmMOB4fSbGBxYNQQI=; b=gM/WzCfVpR0Tn8h7
	hq3fNwcL9ItLKNPTqwH2vrLb537Ds0YfJtLNK38I+heDV/fEz71HGsVqyNkg3fyBs564TWhNSXPAt
	tPot6Bi2MKhzHofiL073ScMz+3Kn6q6TaZQ/xyTL5YMwVGugalxBnsHD9IfXRcZ4FA4Cl34ZzECvo
	vrjF9ntIMb2dBMByzFAQ2jjWdeKLv9jzkigXcUkRSsv2M9g+1R/aHsC+QdobA4a2HxVAUEmgvQ8iI
	m5ty2d71F3ix0yW0Qu5M8DNUtxvAM7vGgVg6CpJmZY7jwJqvGyXgxcWS4JHYzNox58wOGgLRIpAjC
	K1XFRzsGvdPW20kZJw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAerz-002TKv-0z;
	Sat, 25 May 2024 00:02:43 +0000
From: linux@treblig.org
To: mchehab@kernel.org,
	ming.qian@nxp.com,
	eagle.zhou@nxp.com,
	digetx@gmail.com,
	jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/3] media: tegra-vde: remove unused struct 'tegra_vde_h264_frame'
Date: Sat, 25 May 2024 01:01:46 +0100
Message-ID: <20240525000146.282500-4-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240525000146.282500-1-linux@treblig.org>
References: <20240525000146.282500-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'tegra_vde_h264_frame' has been unused since
commit 313db7d235a0 ("media: staging: tegra-vde: Remove legacy UAPI
support").

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/platform/nvidia/tegra-vde/h264.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-vde/h264.c b/drivers/media/platform/nvidia/tegra-vde/h264.c
index cfea5572a1b8..d8812fc06c67 100644
--- a/drivers/media/platform/nvidia/tegra-vde/h264.c
+++ b/drivers/media/platform/nvidia/tegra-vde/h264.c
@@ -19,11 +19,6 @@
 #define FLAG_B_FRAME		0x1
 #define FLAG_REFERENCE		0x2
 
-struct tegra_vde_h264_frame {
-	unsigned int frame_num;
-	unsigned int flags;
-};
-
 struct tegra_vde_h264_decoder_ctx {
 	unsigned int dpb_frames_nb;
 	unsigned int dpb_ref_frames_with_earlier_poc_nb;
-- 
2.45.1


