Return-Path: <linux-media+bounces-52794-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cEVoHn3Kj2ntTgEAu9opvQ
	(envelope-from <linux-media+bounces-52794-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:06:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E27913A6A7
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:06:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A8EC30ADFD3
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2FC21E1E12;
	Sat, 14 Feb 2026 01:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gS6IKkCn"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54224194098;
	Sat, 14 Feb 2026 01:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031060; cv=none; b=nWsyF9mTldxC+ZejkJhm9p2ceHS5R4v8pvT9Rjwhk8gIWJEKrGP+hqx0/gdOIsqPZVJ8GPmxz0AuwWe0HgmBcJAA7ogkjNj5OF5nMeTEPqGdXW8j6nKpf6Q5YhKLcqnu/8vo/O+YkUdOI69lvZZEu6qIUOnuO8XOB+7svZ2RnPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031060; c=relaxed/simple;
	bh=GiusAiiS+GPxOFmE3BRGJnNd58WMBNvMSuk6l3z+MTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YKGG7Dwgs+qEOhFSYOC4lKvkFUiqZxCyWSeI6TrYtKsbDROMhq+vKCmIW8d9EfP1dPTeQPF8XOL5G4SAxza35Ki22YM5pfI2F14TUQXqWrUn2+4q0XT4VJaBQ5nO+FvoUC7WxIzSPYb2jBMW8llDb434i8B2uwL9OHLGTsqR2xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gS6IKkCn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5881C116C6;
	Sat, 14 Feb 2026 01:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031060;
	bh=GiusAiiS+GPxOFmE3BRGJnNd58WMBNvMSuk6l3z+MTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gS6IKkCnl9sPMDvptb5+vbL7DFL0clPBuMXwQWCKeCp0Vy4eIqyR2GUnCwY02u+nx
	 RvCYzLbS+ay4gGXiJ/SLHem3CW2QmiIhaOO21kjSY4LVX7XM5Ltah22A51QvSG8K2F
	 GEhWbj71z5pcOSvWQihgXENLsejYEyXOuVrsn8SpP2kYYgYNdrbUNfiVWqYRR+OxVE
	 C4WX1Hx+1gM6O9h6BRrxjtY37AGE/7SOKpg4bSCCxubTBMxNv+vDkhVD5n13y0j4HJ
	 07ii/GT7kVW7LWRC9stjHlavQLZC85lccEt1KzStE1yt33gAyFsXEdG7+1wI2+s6Bv
	 uN7kppHrzpN5w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Rui Wang <rui.wang@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	dafna@fastmail.com,
	heiko@sntech.de,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.19-6.1] media: rkisp1: Fix filter mode register configuration
Date: Fri, 13 Feb 2026 19:58:44 -0500
Message-ID: <20260214010245.3671907-44-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52794-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ideasonboard.com,kernel.org,fastmail.com,sntech.de,vger.kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,ideasonboard.com:email]
X-Rspamd-Queue-Id: 1E27913A6A7
X-Rspamd-Action: no action

From: Rui Wang <rui.wang@ideasonboard.com>

[ Upstream commit 5a50f2b61104d0d351b59ec179f67abab7870453 ]

The rkisp1_flt_config() function performs an initial direct write to
RKISP1_CIF_ISP_FILT_MODE without including the RKISP1_CIF_ISP_FLT_ENA
bit, which clears the filter enable bit in the hardware.

The subsequent read/modify/write sequence then reads back the register
with the enable bit already cleared and cannot restore it, resulting in
the filter being inadvertently disabled.

Remove the redundant direct write. The read/modify/write sequence alone
correctly preserves the existing enable bit state while updating the
DNR mode and filter configuration bits.

Signed-off-by: Rui Wang <rui.wang@ideasonboard.com>
Reviewed-by: Stefan Klug <stefan.klug@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Link: https://patch.msgid.link/20260105171142.147792-2-rui.wang@ideasonboard.com
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### Commit Message Analysis

The commit message clearly describes a **bug fix**: the
`rkisp1_flt_config()` function performs an initial direct write to the
`RKISP1_CIF_ISP_FILT_MODE` register that **clears the filter enable
bit** (`RKISP1_CIF_ISP_FLT_ENA`). The subsequent read/modify/write
sequence reads back the register with the enable bit already cleared and
cannot restore it. This results in the **ISP filter being inadvertently
disabled** whenever its configuration is updated.

The fix removes the redundant direct write, leaving only the
read/modify/write sequence that correctly preserves the enable bit.

### Code Change Analysis

The diff is straightforward:

**Removed code (the bug):**
```c
rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE,
     (arg->mode ? RKISP1_CIF_ISP_FLT_MODE_DNR : 0) |
     RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(arg->chr_v_mode) |
     RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(arg->chr_h_mode) |
     RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1));
```

This write sets the mode register but does **not** include the
`RKISP1_CIF_ISP_FLT_ENA` bit, effectively disabling the filter in
hardware.

**Preserved code (the correct path):**
```c
filt_mode = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE);
filt_mode &= RKISP1_CIF_ISP_FLT_ENA;
// ... build up new mode value preserving enable bit ...
rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE, filt_mode);
```

The read/modify/write sequence correctly reads the current register
value, preserves only the enable bit, then OR's in the new
configuration. But because the direct write above already cleared the
enable bit, reading it back gets a 0 for the enable bit - defeating the
entire purpose of the read/modify/write pattern.

### Bug Mechanism

1. Filter is enabled (FLT_ENA bit = 1 in hardware register)
2. User updates filter configuration parameters
3. `rkisp1_flt_config()` is called
4. Direct write clears FLT_ENA bit (writes mode without enable)
5. Read/modify/write reads back register with FLT_ENA = 0
6. Final write does not have FLT_ENA set
7. **Filter is now disabled** even though user only wanted to change
   configuration

This is a real functional bug that affects image processing quality on
Rockchip platforms using the ISP (Image Signal Processor).

### Scope and Risk

- **Size**: Removal of 5 lines of code. Extremely small and surgical.
- **Files**: Single file change (`rkisp1-params.c`)
- **Risk**: Very low. The removed code is entirely redundant - the
  read/modify/write sequence that follows does everything the direct
  write did, plus correctly preserves the enable bit. Removing the
  direct write can only improve behavior.
- **Subsystem**: Media/camera driver for Rockchip ISP - well-defined
  scope, won't affect other subsystems.

### Review Quality

The commit has been reviewed by three experienced media subsystem
developers:
- Stefan Klug (Reviewed-by)
- Kieran Bingham (Reviewed-by)
- Laurent Pinchart (Reviewed-by, also signed off as maintainer)

Merged by Hans Verkuil, the V4L2 subsystem maintainer.

### User Impact

This bug affects anyone using the Rockchip ISP filter (noise reduction,
sharpening) on platforms like RK3399 and similar SoCs. When the filter
configuration is updated, the filter gets inadvertently disabled,
leading to degraded image quality. This is particularly relevant for
embedded systems and cameras that use stable kernels.

### Stable Criteria Assessment

- **Obviously correct**: Yes - removing a redundant write that defeats
  the read/modify/write pattern is clearly correct
- **Fixes a real bug**: Yes - filter being disabled when reconfigured is
  a real functional bug
- **Small and contained**: Yes - 5 lines removed from a single function
  in a single file
- **No new features**: Correct - pure bug fix
- **Tested**: Multiple reviews from domain experts

**YES**

 drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
index c9f88635224cc..6442436a5e428 100644
--- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
+++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
@@ -411,12 +411,6 @@ static void rkisp1_flt_config(struct rkisp1_params *params,
 	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_LUM_WEIGHT,
 		     arg->lum_weight);
 
-	rkisp1_write(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE,
-		     (arg->mode ? RKISP1_CIF_ISP_FLT_MODE_DNR : 0) |
-		     RKISP1_CIF_ISP_FLT_CHROMA_V_MODE(arg->chr_v_mode) |
-		     RKISP1_CIF_ISP_FLT_CHROMA_H_MODE(arg->chr_h_mode) |
-		     RKISP1_CIF_ISP_FLT_GREEN_STAGE1(arg->grn_stage1));
-
 	/* avoid to override the old enable value */
 	filt_mode = rkisp1_read(params->rkisp1, RKISP1_CIF_ISP_FILT_MODE);
 	filt_mode &= RKISP1_CIF_ISP_FLT_ENA;
-- 
2.51.0


