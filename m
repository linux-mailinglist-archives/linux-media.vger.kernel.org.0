Return-Path: <linux-media+bounces-53891-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGdYOdOUo2l7HQUAu9opvQ
	(envelope-from <linux-media+bounces-53891-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:22:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABB51CA4F4
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 02:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E2933301CC7D
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 01:20:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1526C1A3154;
	Sun,  1 Mar 2026 01:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CA3xALiG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E426175A74;
	Sun,  1 Mar 2026 01:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328009; cv=none; b=k5iEryget6re2DbVmTHBY26PIRvm+Inzf+kglwjsNRhq23//Izj2AJLmZRucZoF6B3tA441OBAZqJ2oAmI+qaGoUiwpMu7T6zFyossXx5vdgYOwZEmfLyt1tpxe7bkPZle41zB2lM7nyiohLOTojssYR0XHRUfn1IRmZOYgUYYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328009; c=relaxed/simple;
	bh=uRF/eHB8UIWEE4DF5/CVmvthHLHYNprlkY1byU0kAVA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zay05juPV/lhr+v/RIEMzJCyeegoQbHlzLJtLv/OATVagb908xkowDMStdeFnYxPT3hXo1zYJivsYJTAzELADokWOZ1MvAsHw0bkZnxGHn5LQtY8JcK8ohrDvD6BGDanpUAR/GLZ+rknLDG6DoAOTrtGKlooLyzT7GS4BKFPzrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CA3xALiG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF7DC19421;
	Sun,  1 Mar 2026 01:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328009;
	bh=uRF/eHB8UIWEE4DF5/CVmvthHLHYNprlkY1byU0kAVA=;
	h=From:To:Cc:Subject:Date:From;
	b=CA3xALiGp+3DsJI6x+qF8hB4LrtsweeBWdhf5ePKsaToJBWVt6GNwSJJEa2ngHoUt
	 ESrfgT5s0mla6bKy50TE2EM9ffBYCfBDNqP9WRPQwzlZtKsyAL2G3euJuGn42tbzCM
	 7kZqpUsyT44HN07iGtpMjTXNoXHObrUoTeJQLQijgzHKRJZXJ9cu1Q5cPRt+jXiaaN
	 7yB7Rt7vJOVyz4gPFyaIdItPecisvSYuTxwaOLYEIZ3DVAjVIn/MWycKtUVwHnIwB3
	 azSXujTYsi21iEnwNPzyZV8482v+Pk80ypZvQT9rZUmhDW0e+H/U+6IxZ2QfC0h8Y1
	 fCJMS3iVKcjYw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	hansg@kernel.org
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Subject: FAILED: Patch "media: i2c: ov01a10: Fix passing stream instead of pad to v4l2_subdev_state_get_format()" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:20:07 -0500
Message-ID: <20260301012007.1675591-1-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53891-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2ABB51CA4F4
X-Rspamd-Action: no action

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From f8563a375e7fba7c776eb591d4498be592c19098 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hansg@kernel.org>
Date: Tue, 14 Oct 2025 19:40:13 +0200
Subject: [PATCH] media: i2c: ov01a10: Fix passing stream instead of pad to
 v4l2_subdev_state_get_format()

The 2 argument version of v4l2_subdev_state_get_format() takes the pad
as second argument, not the stream.

Fixes: bc0e8d91feec ("media: v4l: subdev: Switch to stream-aware state functions")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 1e22df12989ae..dd2b6d381175a 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -731,7 +731,7 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 					 h_blank);
 	}
 
-	format = v4l2_subdev_state_get_format(sd_state, fmt->stream);
+	format = v4l2_subdev_state_get_format(sd_state, fmt->pad);
 	*format = fmt->format;
 
 	return 0;
-- 
2.51.0





