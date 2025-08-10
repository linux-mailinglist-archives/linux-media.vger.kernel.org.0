Return-Path: <linux-media+bounces-39358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D41B1FC62
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 23:27:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D8B33A2DCE
	for <lists+linux-media@lfdr.de>; Sun, 10 Aug 2025 21:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 033FF287275;
	Sun, 10 Aug 2025 21:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="QkcH4F2B"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D427A28643F
	for <linux-media@vger.kernel.org>; Sun, 10 Aug 2025 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754861167; cv=none; b=JYSPH2eS7vky6L2Om2IIXTp7OaRjOrxhLp2eH++jFEuWiGh2tyuukBq7kXmkICXcJm7qfNOna+0dugJdTCdv8LuWWWtTDO6Pq/qa1IC1DvAGR5wvvgadu67BZtMo3IIaIhD/wMTy9qXbDib1E03whoGrxWDBZkpq9vR8czc4/f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754861167; c=relaxed/simple;
	bh=x8mU9Y4HhV1FCoU2AUaPuUKXO5gWbXUK1l99Ba7jfvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/hzTLab4fmdGb5bGSPq4ucViGDEFZVGeYhjwhAAC2knfbK1fg0EqeXONV8o8hLLZt37IQhu+YF90eWFdvXBkq6OoFhX5CHPi6oMbjoeVTIbMKWaMsETLMpB/ajZX5sS+yj9KOENTc+CgjUYJbe9yv1va7aT87V49OUMOY1VQgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=QkcH4F2B; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1754861159; bh=omailk5J82FETW0CF3chBXgq8BxD9mp50Z7b28u4AKs=;
 b=QkcH4F2BnxC8mqKIhjuebuu5OgrnliFhLQNdYLpl/Z7IXfw/ELlgGwHhTR6vKmEbVa9f1Gc8+
 Z0ukGvoLgjc7upluwiAkrrRlyKkT3KqY4kmvkqvxtprRL4GI0VBqU3FRJ0ku9Rr+4VEq9c0AJ7D
 sqxBuvPCvAbcS9150HVhztmxJZI8xW+Nsco8YYL3zIAMo51g63SK+ZO6FviRDMPCV9WkiWTexFc
 k+cg/UJYaon5IUZYxlAM/lfuUvN2TrYSFr0CUn6xFYA6EtxhVSu85Pgf7sac1oGOnMqFvzBUUmh
 q6dveoqGiN+cKWlK3BYSszKTd0BmCsGl6Ywd40fTSySQ==
X-Forward-Email-ID: 68990e66797ab8962779243f
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Alex Bee <knaerzche@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 4/7] media: rkvdec: Add RK3288 variant
Date: Sun, 10 Aug 2025 21:24:34 +0000
Message-ID: <20250810212454.3237486-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250810212454.3237486-1-jonas@kwiboo.se>
References: <20250810212454.3237486-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Bee <knaerzche@gmail.com>

Add a RK3288 variant, a version of the Rockchip VDEC IP that only
support HEVC decoding.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v2:
- No change
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 56807122720e..c20e046205fe 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1222,6 +1222,10 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 	}
 }
 
+static const struct rkvdec_variant rk3288_rkvdec_variant = {
+	.capabilities = RKVDEC_CAPABILITY_HEVC,
+};
+
 static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
@@ -1229,6 +1233,10 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
 };
 
 static const struct of_device_id of_rkvdec_match[] = {
+	{
+		.compatible = "rockchip,rk3288-vdec",
+		.data = &rk3288_rkvdec_variant,
+	},
 	{
 		.compatible = "rockchip,rk3399-vdec",
 		.data = &rk3399_rkvdec_variant,
-- 
2.50.1


