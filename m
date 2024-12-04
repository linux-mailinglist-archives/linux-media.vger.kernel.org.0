Return-Path: <linux-media+bounces-22596-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AFE9E384F
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AADDB16112F
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D04051BBBF7;
	Wed,  4 Dec 2024 11:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NePGoTkI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7B61B87D5;
	Wed,  4 Dec 2024 11:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310355; cv=none; b=GL5UPgM18WeJLKb43kNJ13MAgVuuTmpUlL1kI6pRcQq3JuzyPYabtcgXfP20Rr2uqtfhrx1xspd4PwYFUyganHaJ4Z3mw5M7XId3v/o97v1rh2RI5USvbd1gaZFRAbrFLfOrLfyd5m4tFzNj3JQ+hvDY46egruZJ+8pK0IRYDi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310355; c=relaxed/simple;
	bh=9uSVonVe6lZLjDKA/C9zzamzFDTm7nGbHwPAR/udAeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S946lsFNA20TXZJd1+cxCsRIQ7IxoCARqLgd4S5hU2aBUqYP9nb3tfsviYlElvXSOqFR9IGCKi2tKXmZOBOgTXpLdS/uTDLwmS21T7BrPYAF0gZbt7I/jk5XR3rLYu/4WbmQfEUiJ2Oa9Hj7ct96XKtkN2K77DQYnEs1GsPthCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NePGoTkI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0F73F10B6;
	Wed,  4 Dec 2024 12:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310319;
	bh=9uSVonVe6lZLjDKA/C9zzamzFDTm7nGbHwPAR/udAeA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NePGoTkIlWnIGV5/qykt/8mfPwGkSlkDR1VHXr8XEUtyLJHJML120/V7bf6gj3E2A
	 /idymrPt8lU+dItMCGriMAU8ZDgAlORClptd1WyjavfEj8g5Ub42+PyLiV4a6U5ghv
	 oAwUub/A3lwAVYg0fPG/cUXLGOHIpMANYq8lHlr8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:19 +0200
Subject: [PATCH v3 05/15] media: i2c: ds90ub960: Fix UB9702 VC map
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-5-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=9uSVonVe6lZLjDKA/C9zzamzFDTm7nGbHwPAR/udAeA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeDh5EI4nS+x0sy2KhC3GhDuX0OqJz1HwjYs
 O4z9AFLcauJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3gwAKCRD6PaqMvJYe
 9WtoEACUBTbwuaEtEIZI7xtSRJmQmRJPNOfO1yf7K2fzyj99t9CUj6/cH/M274hqI/7+CEzrN7q
 JVAgnz9iEHhTL1U4pkxI07otQxVYd+/Q46f+NdtM1Gzc30XjVcK7qyGktOPJOgD5cb+eNm1js2e
 XtzUFqOrOfDFQQqpQply64UKqUBLJIP3knT/pOBcZrCaFFZQwKV+OTC+heUwJ0I/BwerRItqhfI
 AVTns1hDkpvv7sNs2W+tfh8192uR+al144AMZg/jAVdm8mOPQQ4O9BwCk035BRGxoWPZkSJ6A5U
 xgFweiGLUGwojsa8W+EVve0YzYxUXVj+jRx3MIIBObdhQXQb1Uzwrj8lHyncFJyVkYNh07uzH8C
 BeXlX0faDDThswWAHIl/LVMBXe2ANXUPNQL+WVW26U0jFxoR/WXyImaOhlDy0x16DVSaqDjmYWX
 FIAmE2Y1K6fkL0EFoUTE3y7Gz2xHqnFdmdpP9LNlqGpflr+lVO8+4llSI0gcSakZjMiA3yzXSs/
 cC+X3erfYzHZ8AdEv1Plkc2SHSolGNhSTJJ1zti9Z9vzhUuCsrJIcWH8fKlfx5afv6+K1quT21t
 MWikN8l9D2fx/meHFN2vMnSbRGMEyx3lDq/MHGm4Mt9h2SR8r/EWD82dEpd7gXmOuVPfPd6b7RJ
 6gi4lFQpRcoo8ig==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

The driver uses a static CSI-2 virtual channel mapping where all virtual
channels from an RX port are mapped to a virtual channel number matching
the RX port number.

The UB960 and UB9702 have different registers for the purpose, and the
UB9702 version is not correct. Each of the VC_ID_MAP registers do not
contain a single mapping, as the driver currently thinks, but two.

This can cause received VCs other than 0 to be mapped in a wrong way.

Fix this by writing both mappings to each register.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: stable@vger.kernel.org
Fixes: afe267f2d368 ("media: i2c: add DS90UB960 driver")
---
 drivers/media/i2c/ds90ub960.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index 94c8acf171b4..bfffa14e2049 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2533,7 +2533,7 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 				for (i = 0; i < 8; i++)
 					ub960_rxport_write(priv, nport,
 							   UB960_RR_VC_ID_MAP(i),
-							   nport);
+							   (nport << 4) | nport);
 			}
 
 			break;

-- 
2.43.0


