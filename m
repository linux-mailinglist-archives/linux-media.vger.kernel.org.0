Return-Path: <linux-media+bounces-37683-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 631C2B04459
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 17:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6D3B3A299C
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B120263F36;
	Mon, 14 Jul 2025 15:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b="QfZo1LhE"
X-Original-To: linux-media@vger.kernel.org
Received: from taubenbroetchen.weidenauer.cc (taubenbroetchen.weidenauer.cc [37.252.242.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718CB262FFC;
	Mon, 14 Jul 2025 15:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.252.242.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752507262; cv=none; b=H71GQdfgQnwYp1pzZrNYFBO5U3lqJeTf0F+iIfiEyLldjph3nWVqJYIBhvQ6fIztln1/kvvRcDGBoiSCaPLUCMCOgMH/JZF39v6THQXoOFunaMiL6HqyrY8CefZPYQPwWllJuamPRBvZivNbHOsoKVdM3uxevTnlmfc1nqzY7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752507262; c=relaxed/simple;
	bh=ib3g+bH1pYw1iDeJOOs48N5w1CqBoT0aK9hMfxKRGs8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fYyNuWTBsn86+pGZkAJAXmClKjeSzAHyxF1cZRWTh1XT5xNq1j0rV2K2BwaELA8nXyihk+Uz54iwVdGpXC/UxJaXxitYrS2BuiLImSeqD/r5NE5BLP5RD9+osVaFatlU4FFL+kOzlDeQo7VmiVZXYt2smNq02xFlsqizmb+QHlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc; spf=pass smtp.mailfrom=weidenauer.cc; dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b=QfZo1LhE; arc=none smtp.client-ip=37.252.242.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weidenauer.cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weidenauer.cc;
	s=taubenbroetchen; t=1752507258;
	bh=ib3g+bH1pYw1iDeJOOs48N5w1CqBoT0aK9hMfxKRGs8=;
	h=From:To:Cc:Subject:Date:From;
	b=QfZo1LhEf3Q8ddbMJAi4Q3wzbQTR/GGa6fj0lAlbpJANgInhvgqX+dGJ9sdFW8EwB
	 qSXc/UX447sER7hNUUDGUPOzYaMTrCrg1IZREMZfK4JJPnj0anBpZb910YYnUoB115
	 euo4eL+h+D7p2KPW+ShEBmabtZoBGOEnJaS911lqIs/2tztbsr20lxbxB42HukUL8e
	 QOFViCzTpES+dHbJi0A2T8P8lWYzIGHX+QSi2iZfz3QNN3MgBwvWMvLVyRb2zbruYB
	 xW7GmKORVhTbqm2NZdiDaPdfqVFFtEHl1wyrSA+S4OOy1RRoc8Q/wsZxCU9AQwmO6F
	 h2PCnfJOh6r4Q==
Received: from mw-debconf-kernel.vesonet.local (unknown [10.20.60.99])
	by taubenbroetchen.weidenauer.cc (Postfix) with ESMTPSA id 1FBDA64421;
	Mon, 14 Jul 2025 17:34:18 +0200 (CEST)
From: Martin Weidenauer <martin@weidenauer.cc>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Martin Weidenauer <martin@weidenauer.cc>
Subject: [PATCH] staging: atomisp: isp: fix open brace on new line
Date: Mon, 14 Jul 2025 17:34:09 +0200
Message-Id: <20250714153409.46085-1-martin@weidenauer.cc>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mw-taubenbroetchen01
X-Rspamd-Queue-Id: 1FBDA64421
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 8.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[]

Fix checkpatch error "ERROR: that open brace { should be on the previous line"
in ia_css_dvs.host.c:277.

Signed-off-by: Martin Weidenauer <martin@weidenauer.cc>

---

Hi, I hope this should fix the indentation problems.

---
 .../atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c      | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
index 30c84639d7e8..7fda12d3a646 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/dvs/dvs_1.0/ia_css_dvs.host.c
@@ -274,8 +274,7 @@ store_dvs_6axis_config(
 					       binary,
 					       dvs_in_frame_info);
 
-	if (!me)
-	{
+	if (!me) {
 		IA_CSS_LEAVE_ERR_PRIVATE(-ENOMEM);
 		return -ENOMEM;
 	}
-- 
2.39.5


