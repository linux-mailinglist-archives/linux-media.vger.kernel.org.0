Return-Path: <linux-media+bounces-52803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIU+FbrKj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:07:06 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1724513A768
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 06197300C003
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AC90229B18;
	Sat, 14 Feb 2026 01:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeV9vplD"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088D1EF0B0;
	Sat, 14 Feb 2026 01:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031217; cv=none; b=GGMoUGyLAJBfECkUlP+Oik4p3rpOStNK+fiU6QEMwhaOE1615z+1EzgIzHLERR18DQ3r+F2solyse5vtTOBOUY6SdzgcG7malJbCh4Xk8zoY6Zfg5TSPScqk26zzNVteNnSS5Q9Fn9It0yx3fsF/AIrBw/ql6hh7xjpGPaq7h9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031217; c=relaxed/simple;
	bh=8c8sukFP14utfTYrI376lvQLa5+I8ze4lJVTlbyy2q4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qXnSuq7NgT9ISa4ctsu7c5/3kMr88/P50bhZBSjWvX2+mgDAe7ogYB8pT7kV0SlLH53bvlkPsmekDM025YO4PYsxLYDsuFecmR/pSdIW7C4GwCyUVzZNOWaiZ5TpKIOwUUetZkRbLkDZBPPx6vJ2vwPbtRxJUOxhcOp/y7KJ3os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeV9vplD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ADAFC116C6;
	Sat, 14 Feb 2026 01:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031216;
	bh=8c8sukFP14utfTYrI376lvQLa5+I8ze4lJVTlbyy2q4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oeV9vplDudGC2FdxU622iJD1KAL58XswbKg/pCKTiXgl1XOdXk2Qkg01TleeOVfpl
	 aBkFIJo7M5WiiOnotsNkbMsJm2wfqzY+nuPDpVssYjygoBvode39Bc/cPyyLUq3jDA
	 Nm8CTaNoV0nCMtEdy+3223zOn+FvKiksecELExpnCC2D5Uo2oPCoocuwRr7Gctc6aj
	 l+fpGn0XbHI9aEcyLVuzfXFpmsQA/sZnsWvdkzZmhgsN9Mwja6avZxJW0lT8j0O+Zp
	 vZDTcpGHw/0zFQSUbmcLqqQF9DDXFX8IRSfjBmal9BekHCn86ZF22DPTEq+7cHcQCT
	 KJfn8wSLU9Fsw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Szymon Wilczek <szymonwilczek@gmx.com>,
	syzbot+405dcd13121ff75a9e16@syzkaller.appspotmail.com,
	Mike Isely <isely@pobox.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-5.10] media: pvrusb2: fix URB leak in pvr2_send_request_ex
Date: Fri, 13 Feb 2026 19:59:47 -0500
Message-ID: <20260214010245.3671907-107-sashal@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmx.com,syzkaller.appspotmail.com,pobox.com,kernel.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52803-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,405dcd13121ff75a9e16,cisco];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,gmx.com:email,appspotmail.com:email,pobox.com:email]
X-Rspamd-Queue-Id: 1724513A768
X-Rspamd-Action: no action

From: Szymon Wilczek <szymonwilczek@gmx.com>

[ Upstream commit a8333c8262aed2aedf608c18edd39cf5342680a7 ]

When pvr2_send_request_ex() submits a write URB successfully but fails to
submit the read URB (e.g. returns -ENOMEM), it returns immediately without
waiting for the write URB to complete. Since the driver reuses the same
URB structure, a subsequent call to pvr2_send_request_ex() attempts to
submit the still-active write URB, triggering a 'URB submitted while
active' warning in usb_submit_urb().

Fix this by ensuring the write URB is unlinked and waited upon if the read
URB submission fails.

Reported-by: syzbot+405dcd13121ff75a9e16@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=405dcd13121ff75a9e16
Signed-off-by: Szymon Wilczek <szymonwilczek@gmx.com>
Acked-by: Mike Isely <isely@pobox.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of pvrusb2 URB Leak Fix

### 1. Commit Message Analysis

The commit message is clear and well-structured:
- **Subject**: Explicitly says "fix URB leak" — this is a bug fix
- **Problem**: When the write URB is submitted successfully but the read
  URB submission fails, the function returns without waiting for the
  write URB to complete. The URB structure is reused, so a subsequent
  call tries to submit a still-active URB.
- **Symptom**: Triggers a `'URB submitted while active'` warning in
  `usb_submit_urb()`, which is a well-known USB core warning indicating
  a real bug.
- **Reporter**: syzbot — fuzzer-found, reproducible bug
- **Acked-by**: Mike Isely (pvrusb2 maintainer) — subsystem maintainer
  approved
- **Signed-off-by**: Hans Verkuil (media subsystem maintainer) — proper
  review chain

### 2. Code Change Analysis

The fix adds 5 lines of code in a single error path:

```c
if (hdw->ctl_write_pend_flag) {
    usb_unlink_urb(hdw->ctl_write_urb);
    while (hdw->ctl_write_pend_flag)
        wait_for_completion(&hdw->ctl_done);
}
```

**What it does**: When the read URB submission fails (`status < 0`), but
the write URB was already submitted and is pending
(`ctl_write_pend_flag` set), the fix:
1. Unlinks (cancels) the still-active write URB
2. Waits for the write URB completion callback to fire (which clears
   `ctl_write_pend_flag`)

This is the correct pattern — it mirrors what the existing code already
does in the normal path (the `while (hdw->ctl_write_pend_flag ||
hdw->ctl_read_pend_flag)` loop further down), but adapted for this
specific error path.

### 3. Bug Classification

- **Type**: Resource leak / URB lifecycle mismanagement
- **Trigger**: Read URB submission failure (e.g., -ENOMEM) after
  successful write URB submission
- **Consequence**:
  - Active URB left dangling
  - Next call to the same function triggers `'URB submitted while
    active'` warning
  - Could lead to undefined behavior with the USB subsystem, potential
    data corruption or crashes
- **Reproducibility**: syzbot found it — reproducible with a concrete
  trigger

### 4. Scope and Risk Assessment

- **Lines changed**: +5 lines added in a single file
- **Files affected**: 1 file (`drivers/media/usb/pvrusb2/pvrusb2-hdw.c`)
- **Complexity**: Very low — straightforward error path cleanup
- **Risk**: Minimal. The fix uses standard USB patterns
  (`usb_unlink_urb` + wait for completion) that are well-established
  throughout the kernel. The `ctl_write_pend_flag` check ensures we only
  unlink if the write URB is actually active.
- **Regression potential**: Very low. This code path only executes when
  read URB submission fails, and the fix ensures proper cleanup before
  proceeding — strictly better than the current behavior.

### 5. User Impact

- **Affected users**: Anyone using pvrusb2 USB TV capture devices
- **Severity**: Medium-high — while pvrusb2 is not a widely-used driver,
  submitting a still-active URB can cause USB core issues, kernel
  warnings, and potentially crashes
- **Trigger likelihood**: Moderate — memory pressure situations can
  cause `-ENOMEM` from `usb_submit_urb()`

### 6. Stability and Trust Indicators

- **Reported-by**: syzbot (automated, reproducible)
- **Acked-by**: Subsystem maintainer (Mike Isely)
- **Merged by**: Media subsystem maintainer (Hans Verkuil)
- **Fix pattern**: Standard, well-understood USB cleanup pattern

### 7. Dependencies

The fix is self-contained — it uses existing infrastructure
(`usb_unlink_urb`, `wait_for_completion`, existing flags) that has been
present in the pvrusb2 driver for years. No dependency on other recent
commits.

### 8. Stable Kernel Criteria

| Criterion | Met? |
|-----------|------|
| Obviously correct and tested | Yes — syzbot-reported, maintainer-acked
|
| Fixes a real bug | Yes — URB leak, 'URB submitted while active' |
| Important issue | Yes — can cause USB subsystem issues and warnings |
| Small and contained | Yes — 5 lines, 1 file |
| No new features | Correct — pure bug fix |
| Applies cleanly | Likely — the pvrusb2 code is stable and rarely
changed |

### Conclusion

This is a textbook stable backport candidate: a small, surgical fix for
a syzbot-reported URB lifecycle bug in a USB driver. It's maintainer-
acked, uses established patterns, has minimal regression risk, and fixes
a real bug that can cause kernel warnings and potential instability. The
fix is self-contained with no dependencies.

**YES**

 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index b32bb906a9de2..5807734ae26c6 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -3709,6 +3709,11 @@ status);
 				   "Failed to submit read-control URB status=%d",
 status);
 			hdw->ctl_read_pend_flag = 0;
+			if (hdw->ctl_write_pend_flag) {
+				usb_unlink_urb(hdw->ctl_write_urb);
+				while (hdw->ctl_write_pend_flag)
+					wait_for_completion(&hdw->ctl_done);
+			}
 			goto done;
 		}
 	}
-- 
2.51.0


