Return-Path: <linux-media+bounces-11839-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 182B98CDEE3
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 02:29:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 495681C20B25
	for <lists+linux-media@lfdr.de>; Fri, 24 May 2024 00:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58EB54A3C;
	Fri, 24 May 2024 00:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="GvFExYVo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9ED7FB;
	Fri, 24 May 2024 00:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716510563; cv=none; b=cyWARLHD5AA3MDC3ikDAjpxbn7SUrXYx3X2P9e2bU9f9MFsN5xPH3urU+LplV1nlVOKAIdNM1A8csE0pcjtaNXsFexWbAfswoBuZN2o0YnePMoq4NY+278tXLvoJHBN8CuFdzPpHCfDpF8xEp71LfP9StU4FzAM/i585XuWOsAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716510563; c=relaxed/simple;
	bh=cv/p9a1r5Py8mVSj6PlWlDAF+VKnLAZ9gHHdoy1k8Io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXc24zwJ7wVZEtvncPq/h+L2+Fit83RvauHDp0ji05/nMvDHBL4X0g2IWOtFUg7Wwg+kW37u1WjdPv6wKyF9jmkWnAfiIQRBn4OXvHRKN0XJIXuQeAZO3A74UiWuFbyCrnIli+hr1WiurqsdQbKoIlMpf7wOTdRUpndjYI9+37s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=GvFExYVo; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=PhLGT+vRSU4IrZav39qGiNDGQAN3EsnvM7pzeK9PTeA=; b=GvFExYVopW278GIt
	yJ5IxoZi7qEcPQhcguw+Kf+OrdwG2PeQvngbQvTG+CZpgoUdQyCxHgiNWiwOxtCzCg7Z5pKr46f8n
	Z5M6CGzVW25bf1m/rsylfVf+hu3T3ignHEhSERXRnDrYilDMQw88O40GL7e2Tt1apxnNpCqDdXxdp
	w0StyGI8tQYbTzbHTOBEAt0DtVNcZbuAIBKbyUL7MGZgB/Qh1sCwe1hn2wmSjeCDjn33mPe8inVfh
	QwCDRq6WQgKABPOW5bO3hQhxSu+hhepG3inU3cVAgx7xBMAl7Z6NRV/vEZILb/1nATWgwMGWjaR7O
	V+AWct+exvrXZeeFYg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1sAIoB-002K3B-0f;
	Fri, 24 May 2024 00:29:19 +0000
From: linux@treblig.org
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/3] media: dvb-frontends: drx39xyj: remove unused struct 'drxjeq_stat'
Date: Fri, 24 May 2024 01:29:14 +0100
Message-ID: <20240524002916.444598-2-linux@treblig.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240524002916.444598-1-linux@treblig.org>
References: <20240524002916.444598-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

'drxjeq_stat' is unused since the original
commit 38b2df95c53b ("[media] drx-j: add a driver for Trident drx-j
frontend").
The name was changed by
commit 57afe2f0bb0c ("[media] drx-j: Don't use CamelCase")
and it was originally DRXJEQStat_t.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/dvb-frontends/drx39xyj/drxj.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/media/dvb-frontends/drx39xyj/drxj.c b/drivers/media/dvb-frontends/drx39xyj/drxj.c
index 6fcaf07e1b82..779cce93e94a 100644
--- a/drivers/media/dvb-frontends/drx39xyj/drxj.c
+++ b/drivers/media/dvb-frontends/drx39xyj/drxj.c
@@ -976,13 +976,6 @@ static struct drx_aud_data drxj_default_aud_data_g = {
 /*-----------------------------------------------------------------------------
 STRUCTURES
 ----------------------------------------------------------------------------*/
-struct drxjeq_stat {
-	u16 eq_mse;
-	u8 eq_mode;
-	u8 eq_ctrl;
-	u8 eq_stat;
-};
-
 /* HI command */
 struct drxj_hi_cmd {
 	u16 cmd;
-- 
2.45.1


