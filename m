Return-Path: <linux-media+bounces-22602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8B39E38D1
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 12:29:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A63ADB35552
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2024 11:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C131EB9E7;
	Wed,  4 Dec 2024 11:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="S6352A0O"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE88A1DF27F;
	Wed,  4 Dec 2024 11:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733310364; cv=none; b=bw8Z142RuiyLjbkYv56MgePalhJEh2BQBasIQOTxhxmWrMMhS3dKeW40mtmxFMg90dS2kOEas29/RIkBQKx75TpQP7qJu/C6qkeUmm80xCjEmxLXPWcUwhEQIk+jALavyDpoEMQKEM2G4ZqQ6amwoc3opTDj3752PZO93eHKWb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733310364; c=relaxed/simple;
	bh=5VLNvEv71o419ZM2snWjQCE3gPk5HEiEVCAtwv2Uo+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kf/Mg3m3bGWaGYzgyB+/ai4fxMfGFQmybhH6hn1bv9xtgMYcjChNIqR/F3AQiZfqBs/vnlavhYAL2xhzqVXNQ6pfJBW8XEqfxzvFQJKnfUkDET969BA8bBhTKrBibUNLvHo713+QCn5Ox91L0Coaih6IZvmpom2S+k3GsCNzGWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=S6352A0O; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9D0961BAE;
	Wed,  4 Dec 2024 12:05:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733310323;
	bh=5VLNvEv71o419ZM2snWjQCE3gPk5HEiEVCAtwv2Uo+I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=S6352A0OQm6YlChebAOFZxg/y0VAAm7bkXqWySCNYBORbZUA89EVcElHf894qv5p7
	 LQub0m08blSETNzfPgxurhKOuOO4Y8kmqaUdNDkiVou8Lc8BFoRzVgDj6BTAWQRsH7
	 Y+Cn1MnT0qTGOZn78aHmiC601BexbsA1S7FRVgGY=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 04 Dec 2024 13:05:25 +0200
Subject: [PATCH v3 11/15] media: i2c: ds90ub960: Reduce sleep in
 ub960_rxport_wait_locks()
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-ub9xx-fixes-v3-11-a933c109b323@ideasonboard.com>
References: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
In-Reply-To: <20241204-ub9xx-fixes-v3-0-a933c109b323@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=5VLNvEv71o419ZM2snWjQCE3gPk5HEiEVCAtwv2Uo+I=;
 b=owEBbAKT/ZANAwAIAfo9qoy8lh71AcsmYgBnUDeFxi7Bh/OZerZzPkJUWz0YZXB8ex6QaO3Aq
 egoGezotVWJAjIEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1A3hQAKCRD6PaqMvJYe
 9aEID/dPTiL52Z5ftbFp2/hb3sX6uKhMxZ3pFqz1QIA/tlFjj1zvTw3aSJEPCa6NrkHSo1NnaVg
 /QdlhPml3tUukpxkWWt1Dc4hFwQFWGcHu6Veyu5VgBdCaO47H9buGQewEnUWjYIfc5nDXpoDRhn
 dkLBJb3UtDvH+TdBAWsYCL3lwW3mvIM3e5xHew0f9LfZOvLQDE8S/0Gi1f095y6QuUPayAXfUOC
 l4Us4mtu1LTr0Mgbj47KWcXZsHbeVaNGmXvGAT/tgAE5yyTeqnuJV5uDSQKdW4Rr77vr3gRuVrA
 RVw9+ni85Ro9YEof9eT2eOTvCPfXmrCmSXtjWVpIG3gYtywDsV+SauU+ATEtMB8mKc9Sc+5bSMv
 LVO2O5JdzIpT26F2qRF3ZGLxC0rRnEOwUehtAWH3gMq5oAhxwHS9R1X5UDqheA04N230C02QiLR
 r7S00rTojNMJCfGvGSzq9z0oylvBLFPURmYhu3kSTGsVEt1UAPhk/MUQjUmM5mhzgTYkqbQUsAb
 TpDzaNxnItcuToReRWX7b2LVfjIzr/yDPZhm+JoqTbi22mZ4Iy2ko4JFAGUc8GHdiTKSjUiW/3i
 trhrPEGlsH4WlDhPh4W/JVAGIld5Eppv5DUdAURYI8LFVq1iEwt6/q9tuPYMs1Y6strYy82/DJX
 XB6oY6BjmbIJc
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

We currently sleep for 50 ms at the end of each iteration in
ub960_rxport_wait_locks(). This feels a bit excessive, especially as we
always do at least two loops, so there's always at least one sleep, even
if we already have a stable lock.

Change the sleep to 10 ms.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index a4a624816d8b..64b5297c5f22 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -1576,7 +1576,12 @@ static int ub960_rxport_wait_locks(struct ub960_data *priv,
 		if (missing == 0)
 			break;
 
-		msleep(50);
+		/*
+		 * The sleep time of 10 ms was found by testing to give a lock
+		 * with a few iterations. It can be decreased if on some setups
+		 * the lock can be achieved much faster.
+		 */
+		fsleep(10 * USEC_PER_MSEC);
 	}
 
 	if (lock_mask)

-- 
2.43.0


