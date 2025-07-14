Return-Path: <linux-media+bounces-37617-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D996BB03FFC
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 15:32:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1E803BB2E6
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 13:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7452424DD0A;
	Mon, 14 Jul 2025 13:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b="DxRg24c3"
X-Original-To: linux-media@vger.kernel.org
Received: from taubenbroetchen.weidenauer.cc (taubenbroetchen.weidenauer.cc [37.252.242.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24400149C7B;
	Mon, 14 Jul 2025 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.252.242.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752499702; cv=none; b=aMtClpkDJ9T6yAxgRwg4K9rYoiCYn7ryW1RIhiB2eHNUNN418VAGeEejaef/6ARpjgRJtgSlilMGR11fLKRJounJuntZJD21sXhuzYK0JQzaprMDeYDfadaeXsG4CofnhCfBo05ydAs+uD+tbQjvrCGnaB+MoYerH8MEgUqBytg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752499702; c=relaxed/simple;
	bh=8IL/An7Yj43eAS+bkcr9o/TBnce1TMn3he0jdXyWtLo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JfXwcnSsFO5YOo5CVEm/J3hYgPZ34YTHp8YuHs2MMAHrCqyd3lDBCoDHFKLwArBBlLFW4ILgN8xVg5sbssdz1w8WnUDjY0Tf6+UrK0KElas+jlFYF59dhrc4Pt/YGpZyigVvfs8tjSDAI5lGxU+ZvhInubVeRdo6qOxPN/M9w7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc; spf=pass smtp.mailfrom=weidenauer.cc; dkim=pass (2048-bit key) header.d=weidenauer.cc header.i=@weidenauer.cc header.b=DxRg24c3; arc=none smtp.client-ip=37.252.242.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=weidenauer.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weidenauer.cc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weidenauer.cc;
	s=taubenbroetchen; t=1752499209;
	bh=8IL/An7Yj43eAS+bkcr9o/TBnce1TMn3he0jdXyWtLo=;
	h=From:To:Cc:Subject:Date:From;
	b=DxRg24c3NzV1qk4whTTsAN1ulPHuddWPFp562nlmSH7wJtNZ0XpydZykOsIEExltV
	 SHHo7EjwD5XOgsNm5+Wzu6gmO4HYpxqoZMQJ4/dEntMO98kMt/SqpQg/BT8VD2s9GH
	 0TWbl0LCV03V7hX5EISiWlXjnbqh566UCmrma95Acaq9phbYb0k2jchhPi4IPKfwmf
	 L7G8WJfq0J9d+2eOO6Hyk66V/qrYM7pcK+VDSVcSrO32QEnStmR1xrzk5PnlxUbCcX
	 4wC1Ax58wJ5u1mjeUpj/76L3Lge5Vla/W0TN29lgIH86SWCN58EqNyKTz2yyQQ47Yp
	 0g/fcSPR1zUAA==
Received: from mw-debconf-kernel.vesonet.local (unknown [10.20.60.99])
	by taubenbroetchen.weidenauer.cc (Postfix) with ESMTPSA id EDBCC63D6F;
	Mon, 14 Jul 2025 15:20:08 +0200 (CEST)
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
Date: Mon, 14 Jul 2025 15:19:53 +0200
Message-Id: <20250714131953.45947-1-martin@weidenauer.cc>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: mw-taubenbroetchen01
X-Rspamd-Queue-Id: EDBCC63D6F
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

	Hey, this is my first patch, I appreciate any feedback. Greetings from DebConf25!
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


