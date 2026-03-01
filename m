Return-Path: <linux-media+bounces-53903-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2MCADq6Uo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53903-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:21:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F24581CA443
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:21:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF7B7301BDF2
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F358227EFFA;
	Sun,  1 Mar 2026 01:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fuyFI7sT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DA42BD0B;
	Sun,  1 Mar 2026 01:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328038; cv=none; b=RaRiN/Ktmr9ZOSMclAt7/1NdvI4ASTn/Ay9LeEasTsl6yZmSvzvNCyOx6c8OTSZXtYB+LmAn8ReTT8moEg6wenmS2tXGCS2axt4/yfWWyubiUzC5zb6cPcx9l9e/k8ntP+Gn1hGOpw/YyPudzrqghnD0x9lZz1m1x0LFkyx0bJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328038; c=relaxed/simple;
	bh=dHkm9CqBqeyzfKma+crNbBHgwgXQE9NcrLhYNDq+GEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SiTYPRVkVBGd//uOKHWHu05s7DFwjPbzIkHwGaJ9AxWaXgHNTqaoFXPyZzgm+LJ93khcQ7tsHjjhAWvBVZ7y15S/46+J9Evoot15zutjKJnIDtxNL2sqX6IpbbYMo62YD9nIayScJxLQE8aW5+VMWFS1PMfKQWyEt+0cLjj8PZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fuyFI7sT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A215AC19421;
	Sun,  1 Mar 2026 01:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328038;
	bh=dHkm9CqBqeyzfKma+crNbBHgwgXQE9NcrLhYNDq+GEI=;
	h=From:To:Cc:Subject:Date:From;
	b=fuyFI7sTHR0BE8ewcM7G9PYE65J4HFptWY4vozP/hRmnwhdj492MfVrCgOfwxY5Xk
	 aTNAsGQFd0R8aXwkmXq3Dmaqc0dxDOWHc3BOu/qTa7VN3azpcZYO+hNYsp1/x+eAmA
	 4YF1gld1P+YY2H5hwwEgnbSLET7FpZpMPc1VGOt+FemvsvdX9f9bRVlx/0KK+4EM9o
	 iBiuskl2TAFCq+5if6EBBxLMrTjAeIFB2M78+bLOH/0vz06bh3Fry/Ln/c8nlJlVXa
	 Ss9IyDAVgqS6Wk21LdIjSxoIg61YebVkEhuo4TPRMD6DC7+SVfDltShAZ3+W45pvAK
	 pOqcYbnNkkFJQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	sakari.ailus@linux.intel.com
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: ccs: Avoid possible division by zero" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:36 -0500
Message-ID: <20260301012036.1676195-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53903-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F24581CA443
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 679f0b7b6a409750a25754c8833e268e5fdde742 Mon Sep 17 00:00:00 2001
From: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Tue, 25 Nov 2025 00:24:48 +0200
Subject: [PATCH] media: ccs: Avoid possible division by zero

Calculating maximum M for scaler configuration involves dividing by
MIN_X_OUTPUT_SIZE limit register's value. Albeit the value is presumably
non-zero, the driver was missing the check it in fact was. Fix this.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Closes: https://lore.kernel.org/all/ahukd6b3wonye3zgtptvwzvrxldcruazs2exfvll6etjhmcxyj@vq3eh6pd375b/
Fixes: ccfc97bdb5ae ("[media] smiapp: Add driver")
Cc: stable@vger.kernel.org # for 5.15 and later
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org> # build
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ccs/ccs-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index f8523140784c7..dadff8c506794 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -2346,7 +2346,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
 		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
 	max_m = crops[CCS_PAD_SINK]->width
 		* CCS_LIM(sensor, SCALER_N_MIN)
-		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
+		/ (CCS_LIM(sensor, MIN_X_OUTPUT_SIZE) ?: 1);
 
 	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
 		  CCS_LIM(sensor, SCALER_M_MAX));
-- 
2.51.0





