Return-Path: <linux-media+bounces-59133-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0NydFCQp5mnesgEAu9opvQ
	(envelope-from <linux-media+bounces-59133-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:24:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2C342BA72
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 15:24:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A5603310C6BA
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ABDD3A3E66;
	Mon, 20 Apr 2026 13:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jc1mcxep"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30313A1A2B;
	Mon, 20 Apr 2026 13:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690965; cv=none; b=bsMJVWRfyMpggWfOkNcF1xt3BJz3D2IgYJnAUpETv+9Hu4JuYAg26HeQJ33SM47kPnBmb3lwEr3knadAGbbo3XSKzkp8GzIcVMI6VfTOoF36hJN7akkddHKOWZU3fUWo3DjftTxqrlbV43vRZIu0YxPStuMAD8NwDnVlK1QySUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690965; c=relaxed/simple;
	bh=VeZdgWZG6vP+HC/l2LCb664YNIsSSFMFHS0a3ieLfw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jMJd5sMwTafJI6htu9i7uia7xkWjE3/QhlBLW8CM0N4WI/GBgA0aXJgpdF9aSec1ur1UZH9r9dLg77wKhJp4zUr60kAGntnvMIyKfs5smMHeZZOAiBr9ZntuO8Jm9N53AdRf6jgHvHwvZMXzO3SV4yLp/KRoRK0ot6i331aUU2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jc1mcxep; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BE2C2BCB7;
	Mon, 20 Apr 2026 13:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776690965;
	bh=VeZdgWZG6vP+HC/l2LCb664YNIsSSFMFHS0a3ieLfw0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jc1mcxep+4Eck6mVWJ95LQNZJIWMEOFjbolqIpEiRCc4rmCfbmiYS14kVvXQuXTv5
	 ABa8iYGvJqECTeFOCQG5B5zwOT4gnIwfIbkC6jaiYxkSbY/Gq+VGiag112CdIjb0Q2
	 CbP8xNDTYXGdE2nJnlRkJ7aEsP6U4yT4hcf+o9HDgeTFN6/UirGUKlGOC8rb8PBw0r
	 qK+FMTHVHW+5NXFw1M3PDK+eplJ8kU/rNAUu37qUBS+guwAMppgl2uVWWGVjGviC0j
	 paBA+hd8dNT/pMOTIc8VlftaKGJcv4adNLbG6GXQeC5axeOvfsTGZXQq3wxxsSYVOX
	 LLsq/oZid/pJA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sean Young <sean@mess.org>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	andrzej.hajda@intel.com,
	neil.armstrong@linaro.org,
	rfoss@kernel.org,
	airlied@gmail.com,
	daniel@ffwll.ch,
	bonbons@linux-vserver.org,
	jikos@kernel.org,
	benjamin.tissoires@redhat.com,
	hverkuil-cisco@xs4all.nl,
	mchehab@kernel.org,
	maximlevitsky@gmail.com,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	david@hardeman.nu,
	benpicco@googlemail.com,
	crope@iki.fi,
	gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 7.0-6.18] media: rc: fix race between unregister and urb/irq callbacks
Date: Mon, 20 Apr 2026 09:08:01 -0400
Message-ID: <20260420131539.986432-15-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420131539.986432-1-sashal@kernel.org>
References: <20260420131539.986432-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[32];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59133-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[mess.org,iscas.ac.cn,foss.st.com,kernel.org,intel.com,linaro.org,gmail.com,ffwll.ch,linux-vserver.org,redhat.com,xs4all.nl,csie.org,sholland.org,hardeman.nu,googlemail.com,iki.fi,linuxfoundation.org,lists.freedesktop.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 2C2C342BA72
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sean Young <sean@mess.org>

[ Upstream commit dccc0c3ddf8f16071736f98a7d6dd46a2d43e037 ]

Some rc device drivers have a race condition between rc_unregister_device()
and irq or urb callbacks. This is because rc_unregister_device() does two
things, it marks the device as unregistered so no new commands can be
issued and then it calls rc_free_device(). This means the driver has no
chance to cancel any pending urb callbacks or interrupts after the device
has been marked as unregistered. Those callbacks may access struct rc_dev
or its members (e.g. struct ir_raw_event_ctrl), which have been freed by
rc_free_device().

This change removes the implicit call to rc_free_device() from
rc_unregister_device(). This means that device drivers can call
rc_unregister_device() in their remove or disconnect function, then cancel
all the urbs and interrupts before explicitly calling rc_free_device().

Note this is an alternative fix for an issue found by Haotian Zhang, see
the Closes: tags.

Reported-by: Haotian Zhang <vulab@iscas.ac.cn>
Closes: https://lore.kernel.org/linux-media/20251114101432.2566-1-vulab@iscas.ac.cn/
Closes: https://lore.kernel.org/linux-media/20251114101418.2548-1-vulab@iscas.ac.cn/
Closes: https://lore.kernel.org/linux-media/20251114101346.2530-1-vulab@iscas.ac.cn/
Closes: https://lore.kernel.org/linux-media/20251114090605.2413-1-vulab@iscas.ac.cn/
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Good - drivers using `devm_rc_allocate_device` don't call
`rc_unregister_device` manually (they use `devm_rc_register_device`
which handles cleanup automatically). The patch removes the
`managed_alloc` flag because it changes the contract:
`rc_unregister_device` no longer frees the device regardless of how it
was allocated. Instead, `devm_rc_alloc_release` (the devres release
callback) calls `rc_free_device`, and the regular drivers must add
explicit `rc_free_device` calls.

Now let me do the full analysis write-up.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: PARSE THE SUBJECT LINE
Record: [media: rc] [fix] [race between unregister and urb/irq
callbacks]

### Step 1.2: PARSE ALL COMMIT MESSAGE TAGS
- **Reported-by:** Haotian Zhang <vulab@iscas.ac.cn> - the reporter
  found multiple race conditions
- **Closes:** 4 separate lore.kernel.org links to bug reports (Nov 2025)
- **Reviewed-by:** Patrice Chotard <patrice.chotard@foss.st.com>
- **Signed-off-by:** Sean Young <sean@mess.org> (author, RC subsystem
  maintainer)
- **Signed-off-by:** Hans Verkuil <hverkuil+cisco@kernel.org> (media
  subsystem maintainer)

Record: Multiple bug reports (4 Closes: tags), reviewed by a maintainer,
written by the RC subsystem maintainer, merged by the media subsystem
maintainer. No Fixes: tag (expected).

### Step 1.3: ANALYZE THE COMMIT BODY TEXT
The commit explains a **use-after-free race condition**:
1. `rc_unregister_device()` marks the device as unregistered
2. Then it calls `rc_free_device()`, which frees `struct rc_dev` and
   `struct ir_raw_event_ctrl`
3. Between marking unregistered and freeing, there's no window for
   drivers to cancel pending URBs/IRQs
4. Those pending callbacks may still access the freed `struct rc_dev` or
   its members

Record: Bug = use-after-free due to race between device unregister and
URB/IRQ callbacks. Symptom = accessing freed memory. Root cause =
`rc_unregister_device()` implicitly calls `rc_free_device()` before
drivers can cancel pending async operations.

### Step 1.4: DETECT HIDDEN BUG FIXES
This is an explicit race condition / use-after-free fix. Not hidden.
Record: This is a clear, well-documented bug fix.

## PHASE 2: DIFF ANALYSIS

### Step 2.1: INVENTORY THE CHANGES
41 files changed, ~58 insertions, ~36 deletions. Files span:
- Core: `rc-main.c`, `rc-ir-raw.c`, `rc-core.h`
- ~30+ driver files across media/rc, media/pci, media/usb, gpu/drm, hid,
  staging

Record: Cross-subsystem change touching 41 files, but each driver change
is 1-3 lines. Core changes are ~10 lines net.

### Step 2.2: UNDERSTAND THE CODE FLOW CHANGE
**Core changes:**
1. `rc-main.c`: `rc_unregister_device()` no longer calls
   `rc_free_device()` (removes the `if (!dev->managed_alloc)
   rc_free_device(dev)` block)
2. `rc-main.c`: `rc_dev_release()` now calls `ir_raw_event_free(dev)`
   before `kfree(dev)` - this ensures raw event data is cleaned up when
   the device struct is finally freed
3. `rc-main.c`: `devm_rc_allocate_device()` no longer sets
   `managed_alloc = true`
4. `rc-ir-raw.c`: `ir_raw_event_unregister()` no longer calls
   `ir_raw_event_free()` (moved to `rc_dev_release`)
5. `rc-ir-raw.c`: `ir_raw_event_free()` removes the `if (!dev)` guard
   (now only called from `rc_dev_release`)
6. `rc-core.h`: Removes `managed_alloc` field from `struct rc_dev`

**Driver changes:** Every driver using `rc_unregister_device()` now also
calls `rc_free_device()` afterward. Some USB drivers also reorder
operations to call `rc_unregister_device()` BEFORE killing URBs, then
`rc_free_device()` AFTER killing URBs.

### Step 2.3: IDENTIFY THE BUG MECHANISM
Category: **Race condition / Use-after-free**

Before the fix:
```
rc_unregister_device()
  -> marks device unregistered
  -> calls rc_free_device() -> frees struct rc_dev
  // URB/IRQ callbacks can still fire and access freed rc_dev!
```

After the fix:
```
rc_unregister_device()
  -> marks device unregistered
  // Driver cancels URBs/IRQs here
rc_free_device()
  -> safely frees struct rc_dev after all callbacks cancelled
```

Record: UAF race condition fix. Separating unregister from free gives
drivers a window to cancel async operations.

### Step 2.4: ASSESS THE FIX QUALITY
- Written by Sean Young (RC subsystem maintainer)
- Reviewed by Patrice Chotard
- Merged by Hans Verkuil (media maintainer)
- The approach is sound: it separates two concerns (marking unregistered
  vs. freeing memory)
- Each per-driver change is trivial (add one `rc_free_device()` line)
- **Concern:** The scope is very large (41 files), though each change is
  trivially mechanical

Record: High quality fix from the subsystem maintainer. Regression risk
is low per-driver but the sheer breadth is notable. The error path
changes in probe functions (removing `rdev = NULL` after
`rc_unregister_device`) are now correct because `rc_free_device(rdev)`
on the next goto target will properly free even after unregister.

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: BLAME THE CHANGED LINES
The `managed_alloc` logic was introduced in commit `ddbf7d5a698c4d`
(2016, v4.10 era) by Heiner Kallweit. The implicit `rc_free_device()`
call in `rc_unregister_device()` has been present since `d8b4b5822f51e2`
(2010, v2.6.36 era). The race condition has existed since the very
beginning of the rc_core subsystem.

Record: Bug exists in all kernel versions since 2010 (v2.6.36+). Present
in all stable trees.

### Step 3.2: FOLLOW THE FIXES: TAG
No Fixes: tag present (expected for autosel candidates).

### Step 3.3: CHECK FILE HISTORY
Multiple previous fixes for the same class of UAF bugs exist:
- `5abda7a16698d` "media: dm1105: Fix use after free bug in
  dm1105_remove due to race condition"
- `29b0589a865b6` "media: rc: Fix use-after-free bugs caused by
  ene_tx_irqsim()"

These were individual driver fixes for the same systemic issue. This
patch fixes it once and for all in the core.

Record: This is a systemic fix replacing multiple individual driver-
level workarounds.

### Step 3.4: CHECK THE AUTHOR
Sean Young is the RC subsystem maintainer. He has dozens of commits in
`drivers/media/rc/`. This is his subsystem.

Record: Author is the subsystem maintainer - highest trust level.

### Step 3.5: CHECK FOR DEPENDENCIES
This is a single, self-contained patch. All changes are coordinated. No
other patches are needed.

Record: Standalone fix, no dependencies.

## PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

### Step 4.1: FIND THE ORIGINAL PATCH DISCUSSION
Found via web search:
- v1: "[PATCH] media: rc: rc_unregister_device() should not call
  rc_free_device()" (Dec 20, 2025)
- v2: "[PATCH v2] media: rc: fix race between unregister and urb/irq
  callbacks" (Jan 26, 2026)

The v2 has the `Reviewed-by` tag from Patrice Chotard that v1 didn't
have.

Record: Patch went through 2 revisions. Applied version is v2 (latest).
Reviewed by maintainer.

### Step 4.2: WHO REVIEWED
- Reviewed-by: Patrice Chotard (STMicroelectronics, works on st_rc
  driver)
- Signed-off-by: Hans Verkuil (media subsystem co-maintainer)
- CC'd: Numerous subsystem maintainers (Maarten Lankhorst, David Airlie
  for DRM, etc.)

Record: Properly reviewed through the maintainer chain.

### Step 4.3: SEARCH FOR THE BUG REPORT
4 separate bug reports from Haotian Zhang (November 2025) about UAF
races in different RC drivers.

Record: Multiple independent bug reports confirm this is a real-world
issue.

### Step 4.4: RELATED PATCHES
This is the alternative/comprehensive fix. The original individual
patches from Haotian Zhang addressed each driver separately; Sean
Young's approach fixes the root cause in the core.

Record: This is the definitive fix rather than per-driver workarounds.

### Step 4.5: STABLE MAILING LIST
No specific stable discussion found. The patch does not have Cc: stable
tag.

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: KEY FUNCTIONS
- `rc_unregister_device()` - modified to remove implicit free
- `rc_free_device()` - now must be called explicitly by drivers
- `rc_dev_release()` - now frees raw event data
- `ir_raw_event_free()` - moved from unregister path to release path
- `ir_raw_event_unregister()` - no longer frees raw events

### Step 5.2: CALLERS
Every RC driver's remove/disconnect/exit function calls
`rc_unregister_device()`. The patch adds `rc_free_device()` to all of
them. This affects USB IR receivers, PCI TV tuner cards, embedded IR
receivers, DRM bridges, etc.

Record: Broad impact - every RC device driver is affected.

### Step 5.3-5.5: CALL CHAIN AND PATTERNS
The race is triggered during device removal (USB disconnect, PCI remove,
platform remove). This is a common path triggered by:
- USB device physical disconnect
- Module unload
- System shutdown
- Device unbind via sysfs

Record: The buggy path is easily triggered by physical device
disconnect. Not theoretical.

## PHASE 6: CROSS-REFERENCING AND STABLE TREE ANALYSIS

### Step 6.1: DOES THE BUGGY CODE EXIST IN STABLE?
Yes. The buggy code in `rc_unregister_device()` (calling
`rc_free_device()` implicitly) has existed since 2010. It is present in
ALL stable trees.

Record: Bug affects all stable trees (6.6.y, 6.1.y, 5.15.y, etc.).

### Step 6.2: BACKPORT COMPLICATIONS
This patch touches 41 files. Some files may have diverged between
mainline and stable trees. Backporting will likely require resolving
minor conflicts in some drivers. The core changes to `rc-main.c`, `rc-
ir-raw.c`, and `rc-core.h` are critical and should apply with minor
fuzz. The per-driver changes are mechanical and can be adapted.

Record: Expected difficulty: **medium**. Core changes likely apply
cleanly. Some driver-specific changes may need minor adjustment due to
driver-specific changes in stable trees vs mainline.

### Step 6.3: RELATED FIXES IN STABLE
Individual UAF fixes like `5abda7a16698d` (dm1105) and `29b0589a865b6`
(ene_ir) may already be in some stable trees, but they only fix specific
drivers. This systemic fix is comprehensive.

## PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

### Step 7.1: SUBSYSTEM CRITICALITY
Media/RC subsystem - used by IR receivers on:
- TV tuner cards (USB and PCI)
- Media center remotes (iMON, MCE, Xbox)
- Embedded IR receivers (sunxi, meson, hix5hd2)
- DRM bridges with CEC/RC

Record: IMPORTANT level - affects users of IR remote control hardware
(common in HTPCs, embedded media devices).

### Step 7.2: SUBSYSTEM ACTIVITY
Active subsystem with regular maintenance from Sean Young.

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: WHO IS AFFECTED
All users with IR remote control hardware who disconnect or unbind the
device. This includes USB IR receivers (very common for HTPC setups),
PCI TV tuner cards with IR, and embedded systems with hardware IR.

Record: Moderate user population - anyone using Linux with IR remote
control hardware.

### Step 8.2: TRIGGER CONDITIONS
- Physical USB disconnect of IR receiver
- Module unload while IR device active
- Device unbind via sysfs
- System shutdown with pending IR operations
- Concurrent with incoming IR data

Record: Common trigger conditions. USB disconnect is the most frequent.

### Step 8.3: FAILURE MODE SEVERITY
Use-after-free: Accessing freed `struct rc_dev` or `struct
ir_raw_event_ctrl` from URB/IRQ callbacks. This leads to:
- Kernel crash/oops (most likely)
- Memory corruption (possible)
- Security vulnerability (potential, if attacker controls USB device)

Record: Severity: HIGH to CRITICAL. UAF can cause crashes and is
potentially exploitable.

### Step 8.4: RISK-BENEFIT RATIO
**Benefit:** HIGH - Fixes use-after-free race in all RC drivers
systemically. Prevents crashes during device disconnect. Fixes reported
real-world bug.

**Risk:** MEDIUM - 41 files touched, but each change is 1-3 lines and
mechanically identical (add `rc_free_device()` after
`rc_unregister_device()`). The core API change is well-designed. Some
USB drivers also reorder operations to call `rc_unregister_device()`
before `usb_kill_urb()`, which is the correct order.

Record: Benefit HIGH, Risk MEDIUM. The fix is well-designed but the
scope is large.

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: COMPILE THE EVIDENCE

**Evidence FOR backporting:**
- Fixes a real use-after-free race condition
- Multiple independent bug reports (4 Closes: tags)
- Written and signed by the RC subsystem maintainer (Sean Young)
- Reviewed by Patrice Chotard, merged by Hans Verkuil
- Bug has existed since 2010, affects all stable trees
- Previous individual driver fixes confirm this is a known issue pattern
- UAF can cause kernel crashes and is potentially exploitable
- The fix is logically correct - it separates unregister from free

**Evidence AGAINST backporting:**
- Very large scope: 41 files modified across multiple subsystems
- Changes a core API contract (rc_unregister_device no longer frees)
- Risk of backport conflicts due to per-driver divergence between
  mainline and stable
- Some drivers may not exist in older stable trees, requiring manual
  adaptation
- Removes `managed_alloc` infrastructure, affecting
  `devm_rc_allocate_device()` users

### Step 9.2: STABLE RULES CHECKLIST
1. Obviously correct and tested? **YES** - reviewed by maintainers,
   applied to mainline
2. Fixes a real bug? **YES** - UAF race condition with 4 bug reports
3. Important issue? **YES** - use-after-free / crash during device
   disconnect
4. Small and contained? **NO** - 41 files is very large. However, each
   change is mechanical (1-3 lines per file) and the core change is
   small (~10 lines)
5. No new features or APIs? **YES** - only changes existing API behavior
6. Can apply to stable trees? **PARTIALLY** - core changes likely apply;
   some driver changes may need adaptation

### Step 9.3: EXCEPTION CATEGORIES
Not applicable - this is a bug fix, not a device ID/quirk/DT/build fix.

### Step 9.4: DECISION
This is a genuine, important use-after-free fix from the subsystem
maintainer with multiple independent bug reports. However, the **scope
is extremely large** (41 files across multiple subsystems) and it
changes a core API contract. While each individual change is trivial and
mechanical, the sheer number of files makes this a high-risk backport.
If even one driver is missed or adapted incorrectly, it introduces a new
bug (memory leak from missing `rc_free_device()` or double-free from
calling it when not needed).

The stable kernel rules explicitly require patches to be "small and
contained." While the fix itself is correct and important, 41 files
touching DRM, HID, media PCI, media USB, and staging subsystems is not
small and contained. A backport of this magnitude would need careful
manual review for each stable tree to handle driver-specific divergence.

Verification:
- [Phase 1] Parsed tags: Reported-by: Haotian Zhang, 4 Closes: links,
  Reviewed-by: Patrice Chotard, Signed-off-by: Sean Young (author/RC
  maintainer), Hans Verkuil (media maintainer)
- [Phase 2] Diff analysis: 41 files changed, core change removes
  implicit rc_free_device() from rc_unregister_device(), each driver
  adds explicit rc_free_device() call
- [Phase 2] Verified: Current rc_unregister_device() at line 2046 has
  `if (!dev->managed_alloc) rc_free_device(dev)` - confirmed the bug
  exists
- [Phase 2] Verified: rc_dev_release() at line 1610 currently just does
  `kfree(dev)` without freeing raw events - patch adds
  ir_raw_event_free(dev) there
- [Phase 3] git blame: rc_unregister_device() implicit free from
  d8b4b5822f51e2 (2010, v2.6.36), managed_alloc from ddbf7d5a698c4d
  (2016, v4.10)
- [Phase 3] git show ddbf7d5a698c4d: confirmed managed_alloc was
  introduced by Heiner Kallweit in 2016
- [Phase 3] Found related individual driver UAF fixes: 5abda7a16698d
  (dm1105), 29b0589a865b6 (ene_ir)
- [Phase 3] git show 5abda7a16698d: confirmed dm1105 UAF race diagram
  showing exactly the same pattern
- [Phase 4] Web search found v1 and v2 submissions: v1 Dec 2025, v2 Jan
  26 2026
- [Phase 4] Found full v2 patch on freedesktop.org archives - matches
  commit
- [Phase 4] 4 separate bug reports from Haotian Zhang (Nov 2025) confirm
  real-world issue
- [Phase 5] Verified devm_rc_allocate_device callers (gpio-ir-recv,
  meson-ir, etc.) don't manually call rc_unregister_device - they use
  devm path, so they're unaffected
- [Phase 6] Bug exists since v2.6.36 (2010) - present in all stable
  trees
- [Phase 8] Trigger: USB device disconnect during IR activity - common
  operation
- UNVERIFIED: Whether all 41 files exist in all stable trees (some
  drivers may have been added/removed between releases)

This is a borderline case. The fix addresses a real, reported use-after-
free bug from the subsystem maintainer with proper review. However, the
41-file scope makes it risky for stable. On balance, the UAF is serious
enough (crash, potential security) that it warrants backporting despite
the large scope, especially since each per-driver change is mechanically
identical and trivially verifiable.

**YES**

 drivers/gpu/drm/bridge/sil-sii8620.c        | 1 +
 drivers/hid/hid-picolcd_cir.c               | 1 +
 drivers/media/cec/core/cec-core.c           | 2 +-
 drivers/media/common/siano/smsir.c          | 1 +
 drivers/media/i2c/ir-kbd-i2c.c              | 2 ++
 drivers/media/pci/bt8xx/bttv-input.c        | 3 ++-
 drivers/media/pci/cx23885/cx23885-input.c   | 1 +
 drivers/media/pci/cx88/cx88-input.c         | 3 ++-
 drivers/media/pci/dm1105/dm1105.c           | 1 +
 drivers/media/pci/mantis/mantis_input.c     | 1 +
 drivers/media/pci/saa7134/saa7134-input.c   | 1 +
 drivers/media/pci/smipcie/smipcie-ir.c      | 1 +
 drivers/media/pci/ttpci/budget-ci.c         | 1 +
 drivers/media/rc/ati_remote.c               | 6 +++---
 drivers/media/rc/ene_ir.c                   | 2 +-
 drivers/media/rc/fintek-cir.c               | 3 ++-
 drivers/media/rc/igorplugusb.c              | 1 +
 drivers/media/rc/iguanair.c                 | 1 +
 drivers/media/rc/img-ir/img-ir-hw.c         | 3 ++-
 drivers/media/rc/img-ir/img-ir-raw.c        | 3 ++-
 drivers/media/rc/imon.c                     | 3 ++-
 drivers/media/rc/ir-hix5hd2.c               | 2 +-
 drivers/media/rc/ir_toy.c                   | 1 +
 drivers/media/rc/ite-cir.c                  | 2 +-
 drivers/media/rc/mceusb.c                   | 1 +
 drivers/media/rc/rc-ir-raw.c                | 5 -----
 drivers/media/rc/rc-loopback.c              | 1 +
 drivers/media/rc/rc-main.c                  | 6 +-----
 drivers/media/rc/redrat3.c                  | 4 +++-
 drivers/media/rc/st_rc.c                    | 2 +-
 drivers/media/rc/streamzap.c                | 7 ++++---
 drivers/media/rc/sunxi-cir.c                | 1 +
 drivers/media/rc/ttusbir.c                  | 2 +-
 drivers/media/rc/winbond-cir.c              | 2 +-
 drivers/media/rc/xbox_remote.c              | 5 +++--
 drivers/media/usb/au0828/au0828-input.c     | 1 +
 drivers/media/usb/dvb-usb-v2/dvb_usb_core.c | 1 +
 drivers/media/usb/dvb-usb/dvb-usb-remote.c  | 6 ++++--
 drivers/media/usb/em28xx/em28xx-input.c     | 1 +
 drivers/staging/media/av7110/av7110_ir.c    | 1 +
 include/media/rc-core.h                     | 2 --
 41 files changed, 58 insertions(+), 36 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index d3f238b1f2a94..982306eb4f0a7 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2221,6 +2221,7 @@ static void sii8620_detach(struct drm_bridge *bridge)
 		return;
 
 	rc_unregister_device(ctx->rc_dev);
+	rc_free_device(ctx->rc_dev);
 }
 
 static int sii8620_is_packing_required(struct sii8620 *ctx,
diff --git a/drivers/hid/hid-picolcd_cir.c b/drivers/hid/hid-picolcd_cir.c
index d6faa0e00f95a..6d4c636e1c9f7 100644
--- a/drivers/hid/hid-picolcd_cir.c
+++ b/drivers/hid/hid-picolcd_cir.c
@@ -134,5 +134,6 @@ void picolcd_exit_cir(struct picolcd_data *data)
 
 	data->rc_dev = NULL;
 	rc_unregister_device(rdev);
+	rc_free_device(rdev);
 }
 
diff --git a/drivers/media/cec/core/cec-core.c b/drivers/media/cec/core/cec-core.c
index 1953ce559ecaf..0fcd3b5e60c8d 100644
--- a/drivers/media/cec/core/cec-core.c
+++ b/drivers/media/cec/core/cec-core.c
@@ -338,8 +338,8 @@ int cec_register_adapter(struct cec_adapter *adap,
 	res = cec_devnode_register(&adap->devnode, adap->owner);
 	if (res) {
 #ifdef CONFIG_MEDIA_CEC_RC
-		/* Note: rc_unregister also calls rc_free */
 		rc_unregister_device(adap->rc);
+		rc_free_device(adap->rc);
 		adap->rc = NULL;
 #endif
 		return res;
diff --git a/drivers/media/common/siano/smsir.c b/drivers/media/common/siano/smsir.c
index af07fed21ae12..283770d583d56 100644
--- a/drivers/media/common/siano/smsir.c
+++ b/drivers/media/common/siano/smsir.c
@@ -92,6 +92,7 @@ int sms_ir_init(struct smscore_device_t *coredev)
 void sms_ir_exit(struct smscore_device_t *coredev)
 {
 	rc_unregister_device(coredev->ir.dev);
+	rc_free_device(coredev->ir.dev);
 
 	pr_debug("\n");
 }
diff --git a/drivers/media/i2c/ir-kbd-i2c.c b/drivers/media/i2c/ir-kbd-i2c.c
index 5588cdd7ec20d..6047453170043 100644
--- a/drivers/media/i2c/ir-kbd-i2c.c
+++ b/drivers/media/i2c/ir-kbd-i2c.c
@@ -355,6 +355,7 @@ static void ir_work(struct work_struct *work)
 		mutex_unlock(&ir->lock);
 		if (rc == -ENODEV) {
 			rc_unregister_device(ir->rc);
+			rc_free_device(ir->rc);
 			ir->rc = NULL;
 			return;
 		}
@@ -972,6 +973,7 @@ static void ir_remove(struct i2c_client *client)
 	i2c_unregister_device(ir->tx_c);
 
 	rc_unregister_device(ir->rc);
+	rc_free_device(ir->rc);
 }
 
 static const struct i2c_device_id ir_kbd_id[] = {
diff --git a/drivers/media/pci/bt8xx/bttv-input.c b/drivers/media/pci/bt8xx/bttv-input.c
index 373b6c6817d76..f704476506e07 100644
--- a/drivers/media/pci/bt8xx/bttv-input.c
+++ b/drivers/media/pci/bt8xx/bttv-input.c
@@ -572,8 +572,9 @@ void bttv_input_fini(struct bttv *btv)
 	if (btv->remote == NULL)
 		return;
 
-	bttv_ir_stop(btv);
 	rc_unregister_device(btv->remote->dev);
+	bttv_ir_stop(btv);
+	rc_free_device(btv->remote->dev);
 	kfree(btv->remote);
 	btv->remote = NULL;
 }
diff --git a/drivers/media/pci/cx23885/cx23885-input.c b/drivers/media/pci/cx23885/cx23885-input.c
index ffbbeca8a8e5f..554767b8ef2bf 100644
--- a/drivers/media/pci/cx23885/cx23885-input.c
+++ b/drivers/media/pci/cx23885/cx23885-input.c
@@ -402,6 +402,7 @@ void cx23885_input_fini(struct cx23885_dev *dev)
 	if (dev->kernel_ir == NULL)
 		return;
 	rc_unregister_device(dev->kernel_ir->rc);
+	rc_free_device(dev->kernel_ir->rc);
 	kfree(dev->kernel_ir->phys);
 	kfree(dev->kernel_ir->name);
 	kfree(dev->kernel_ir);
diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/cx88-input.c
index e958eecb29c5c..5d9ce4f9af011 100644
--- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -509,8 +509,9 @@ int cx88_ir_fini(struct cx88_core *core)
 	if (!ir)
 		return 0;
 
-	cx88_ir_stop(core);
 	rc_unregister_device(ir->dev);
+	cx88_ir_stop(core);
+	rc_free_device(ir->dev);
 	kfree(ir);
 
 	/* done */
diff --git a/drivers/media/pci/dm1105/dm1105.c b/drivers/media/pci/dm1105/dm1105.c
index de05d8b0f9dc5..bbd24769ae56b 100644
--- a/drivers/media/pci/dm1105/dm1105.c
+++ b/drivers/media/pci/dm1105/dm1105.c
@@ -763,6 +763,7 @@ static int dm1105_ir_init(struct dm1105_dev *dm1105)
 static void dm1105_ir_exit(struct dm1105_dev *dm1105)
 {
 	rc_unregister_device(dm1105->ir.dev);
+	rc_free_device(dm1105->ir.dev);
 }
 
 static int dm1105_hw_init(struct dm1105_dev *dev)
diff --git a/drivers/media/pci/mantis/mantis_input.c b/drivers/media/pci/mantis/mantis_input.c
index 34c0d979240fd..edb4cacf55d22 100644
--- a/drivers/media/pci/mantis/mantis_input.c
+++ b/drivers/media/pci/mantis/mantis_input.c
@@ -72,5 +72,6 @@ EXPORT_SYMBOL_GPL(mantis_input_init);
 void mantis_input_exit(struct mantis_pci *mantis)
 {
 	rc_unregister_device(mantis->rc);
+	rc_free_device(mantis->rc);
 }
 EXPORT_SYMBOL_GPL(mantis_input_exit);
diff --git a/drivers/media/pci/saa7134/saa7134-input.c b/drivers/media/pci/saa7134/saa7134-input.c
index 5b71014157808..7f6680de31564 100644
--- a/drivers/media/pci/saa7134/saa7134-input.c
+++ b/drivers/media/pci/saa7134/saa7134-input.c
@@ -834,6 +834,7 @@ void saa7134_input_fini(struct saa7134_dev *dev)
 		return;
 
 	rc_unregister_device(dev->remote->dev);
+	rc_free_device(dev->remote->dev);
 	kfree(dev->remote);
 	dev->remote = NULL;
 }
diff --git a/drivers/media/pci/smipcie/smipcie-ir.c b/drivers/media/pci/smipcie/smipcie-ir.c
index c0604d9c70119..0bbe4fa2d5a84 100644
--- a/drivers/media/pci/smipcie/smipcie-ir.c
+++ b/drivers/media/pci/smipcie/smipcie-ir.c
@@ -181,5 +181,6 @@ void smi_ir_exit(struct smi_dev *dev)
 
 	rc_unregister_device(rc_dev);
 	smi_ir_stop(ir);
+	rc_free_device(rc_dev);
 	ir->rc_dev = NULL;
 }
diff --git a/drivers/media/pci/ttpci/budget-ci.c b/drivers/media/pci/ttpci/budget-ci.c
index 3709c0fb23b07..8b496b959d7ea 100644
--- a/drivers/media/pci/ttpci/budget-ci.c
+++ b/drivers/media/pci/ttpci/budget-ci.c
@@ -249,6 +249,7 @@ static void msp430_ir_deinit(struct budget_ci *budget_ci)
 	cancel_work_sync(&budget_ci->ir.msp430_irq_bh_work);
 
 	rc_unregister_device(budget_ci->ir.dev);
+	rc_free_device(budget_ci->ir.dev);
 }
 
 static int ciintf_read_attribute_mem(struct dvb_ca_en50221 *ca, int slot, int address)
diff --git a/drivers/media/rc/ati_remote.c b/drivers/media/rc/ati_remote.c
index 78abe810a88e7..51d85de24fae3 100644
--- a/drivers/media/rc/ati_remote.c
+++ b/drivers/media/rc/ati_remote.c
@@ -921,7 +921,6 @@ static int ati_remote_probe(struct usb_interface *interface,
 	input_free_device(input_dev);
  exit_unregister_device:
 	rc_unregister_device(rc_dev);
-	rc_dev = NULL;
  exit_kill_urbs:
 	usb_kill_urb(ati_remote->irq_urb);
 	usb_kill_urb(ati_remote->out_urb);
@@ -941,18 +940,19 @@ static void ati_remote_disconnect(struct usb_interface *interface)
 	struct ati_remote *ati_remote;
 
 	ati_remote = usb_get_intfdata(interface);
-	usb_set_intfdata(interface, NULL);
 	if (!ati_remote) {
 		dev_warn(&interface->dev, "%s - null device?\n", __func__);
 		return;
 	}
 
+	rc_unregister_device(ati_remote->rdev);
+	usb_set_intfdata(interface, NULL);
 	usb_kill_urb(ati_remote->irq_urb);
 	usb_kill_urb(ati_remote->out_urb);
 	if (ati_remote->idev)
 		input_unregister_device(ati_remote->idev);
-	rc_unregister_device(ati_remote->rdev);
 	ati_remote_free_buffers(ati_remote);
+	rc_free_device(ati_remote->rdev);
 	kfree(ati_remote);
 }
 
diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
index f8120605501ab..6f7dccc965e7f 100644
--- a/drivers/media/rc/ene_ir.c
+++ b/drivers/media/rc/ene_ir.c
@@ -1090,7 +1090,6 @@ static int ene_probe(struct pnp_dev *pnp_dev, const struct pnp_device_id *id)
 	release_region(dev->hw_io, ENE_IO_SIZE);
 exit_unregister_device:
 	rc_unregister_device(rdev);
-	rdev = NULL;
 exit_free_dev_rdev:
 	rc_free_device(rdev);
 	kfree(dev);
@@ -1110,6 +1109,7 @@ static void ene_remove(struct pnp_dev *pnp_dev)
 	ene_rx_restore_hw_buffer(dev);
 	spin_unlock_irqrestore(&dev->hw_lock, flags);
 
+	rc_free_device(dev->rdev);
 	free_irq(dev->irq, dev);
 	release_region(dev->hw_io, ENE_IO_SIZE);
 	kfree(dev);
diff --git a/drivers/media/rc/fintek-cir.c b/drivers/media/rc/fintek-cir.c
index f7cfa8a073ebc..5055dfc3f4651 100644
--- a/drivers/media/rc/fintek-cir.c
+++ b/drivers/media/rc/fintek-cir.c
@@ -568,6 +568,7 @@ static void fintek_remove(struct pnp_dev *pdev)
 	struct fintek_dev *fintek = pnp_get_drvdata(pdev);
 	unsigned long flags;
 
+	rc_unregister_device(fintek->rdev);
 	spin_lock_irqsave(&fintek->fintek_lock, flags);
 	/* disable CIR */
 	fintek_disable_cir(fintek);
@@ -580,7 +581,7 @@ static void fintek_remove(struct pnp_dev *pdev)
 	free_irq(fintek->cir_irq, fintek);
 	release_region(fintek->cir_addr, fintek->cir_port_len);
 
-	rc_unregister_device(fintek->rdev);
+	rc_free_device(fintek->rdev);
 
 	kfree(fintek);
 }
diff --git a/drivers/media/rc/igorplugusb.c b/drivers/media/rc/igorplugusb.c
index e034c93d57cf0..5ceb5ca44e235 100644
--- a/drivers/media/rc/igorplugusb.c
+++ b/drivers/media/rc/igorplugusb.c
@@ -242,6 +242,7 @@ static void igorplugusb_disconnect(struct usb_interface *intf)
 	usb_set_intfdata(intf, NULL);
 	usb_unpoison_urb(ir->urb);
 	usb_free_urb(ir->urb);
+	rc_free_device(ir->rc);
 	kfree(ir->buf_in);
 }
 
diff --git a/drivers/media/rc/iguanair.c b/drivers/media/rc/iguanair.c
index c508f2536243e..0c5b8befb0af3 100644
--- a/drivers/media/rc/iguanair.c
+++ b/drivers/media/rc/iguanair.c
@@ -500,6 +500,7 @@ static void iguanair_disconnect(struct usb_interface *intf)
 	usb_set_intfdata(intf, NULL);
 	usb_kill_urb(ir->urb_in);
 	usb_kill_urb(ir->urb_out);
+	rc_free_device(ir->rc);
 	usb_free_urb(ir->urb_in);
 	usb_free_urb(ir->urb_out);
 	usb_free_coherent(ir->udev, MAX_IN_PACKET, ir->buf_in, ir->dma_in);
diff --git a/drivers/media/rc/img-ir/img-ir-hw.c b/drivers/media/rc/img-ir/img-ir-hw.c
index 63f6f5b36838d..f30adf4d8444d 100644
--- a/drivers/media/rc/img-ir/img-ir-hw.c
+++ b/drivers/media/rc/img-ir/img-ir-hw.c
@@ -1118,9 +1118,10 @@ void img_ir_remove_hw(struct img_ir_priv *priv)
 	struct rc_dev *rdev = hw->rdev;
 	if (!rdev)
 		return;
+	rc_unregister_device(rdev);
 	img_ir_set_decoder(priv, NULL, 0);
 	hw->rdev = NULL;
-	rc_unregister_device(rdev);
+	rc_free_device(rdev);
 #ifdef CONFIG_COMMON_CLK
 	if (!IS_ERR(priv->clk))
 		clk_notifier_unregister(priv->clk, &hw->clk_nb);
diff --git a/drivers/media/rc/img-ir/img-ir-raw.c b/drivers/media/rc/img-ir/img-ir-raw.c
index 92fb7b555a0f6..f1460d4acf3e8 100644
--- a/drivers/media/rc/img-ir/img-ir-raw.c
+++ b/drivers/media/rc/img-ir/img-ir-raw.c
@@ -136,6 +136,7 @@ void img_ir_remove_raw(struct img_ir_priv *priv)
 	if (!rdev)
 		return;
 
+	rc_unregister_device(rdev);
 	/* switch off and disable raw (edge) interrupts */
 	spin_lock_irq(&priv->lock);
 	raw->rdev = NULL;
@@ -145,7 +146,7 @@ void img_ir_remove_raw(struct img_ir_priv *priv)
 	img_ir_write(priv, IMG_IR_IRQ_CLEAR, IMG_IR_IRQ_EDGE);
 	spin_unlock_irq(&priv->lock);
 
-	rc_unregister_device(rdev);
+	rc_free_device(rdev);
 
 	timer_delete_sync(&raw->timer);
 }
diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 7e92161105d53..310c9fc9ae91c 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2541,9 +2541,10 @@ static void imon_disconnect(struct usb_interface *interface)
 
 	if (ifnum == 0) {
 		ictx->dev_present_intf0 = false;
+		rc_unregister_device(ictx->rdev);
 		usb_kill_urb(ictx->rx_urb_intf0);
 		input_unregister_device(ictx->idev);
-		rc_unregister_device(ictx->rdev);
+		rc_free_device(ictx->rdev);
 		if (ictx->display_supported) {
 			if (ictx->display_type == IMON_DISPLAY_TYPE_LCD)
 				usb_deregister_dev(interface, &imon_lcd_class);
diff --git a/drivers/media/rc/ir-hix5hd2.c b/drivers/media/rc/ir-hix5hd2.c
index edc46828509c8..1b061e4a3dcfa 100644
--- a/drivers/media/rc/ir-hix5hd2.c
+++ b/drivers/media/rc/ir-hix5hd2.c
@@ -331,7 +331,6 @@ static int hix5hd2_ir_probe(struct platform_device *pdev)
 
 regerr:
 	rc_unregister_device(rdev);
-	rdev = NULL;
 clkerr:
 	clk_disable_unprepare(priv->clock);
 err:
@@ -346,6 +345,7 @@ static void hix5hd2_ir_remove(struct platform_device *pdev)
 
 	clk_disable_unprepare(priv->clock);
 	rc_unregister_device(priv->rdev);
+	rc_free_device(priv->rdev);
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/drivers/media/rc/ir_toy.c b/drivers/media/rc/ir_toy.c
index d6472de5da87d..089833e411786 100644
--- a/drivers/media/rc/ir_toy.c
+++ b/drivers/media/rc/ir_toy.c
@@ -536,6 +536,7 @@ static void irtoy_disconnect(struct usb_interface *intf)
 	usb_free_urb(ir->urb_out);
 	usb_kill_urb(ir->urb_in);
 	usb_free_urb(ir->urb_in);
+	rc_free_device(ir->rc);
 	kfree(ir->in);
 	kfree(ir->out);
 	kfree(ir);
diff --git a/drivers/media/rc/ite-cir.c b/drivers/media/rc/ite-cir.c
index bf544517c67a9..bde2a70512310 100644
--- a/drivers/media/rc/ite-cir.c
+++ b/drivers/media/rc/ite-cir.c
@@ -1414,7 +1414,6 @@ static int ite_probe(struct pnp_dev *pdev, const struct pnp_device_id
 	release_region(itdev->cir_addr, itdev->params->io_region_size);
 exit_unregister_device:
 	rc_unregister_device(rdev);
-	rdev = NULL;
 exit_free_dev_rdev:
 	rc_free_device(rdev);
 	kfree(itdev);
@@ -1439,6 +1438,7 @@ static void ite_remove(struct pnp_dev *pdev)
 	release_region(dev->cir_addr, dev->params->io_region_size);
 
 	rc_unregister_device(dev->rdev);
+	rc_free_device(dev->rdev);
 
 	kfree(dev);
 }
diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
index ed55e9ec3c570..06222eee17540 100644
--- a/drivers/media/rc/mceusb.c
+++ b/drivers/media/rc/mceusb.c
@@ -1850,6 +1850,7 @@ static void mceusb_dev_disconnect(struct usb_interface *intf)
 	usb_free_urb(ir->urb_in);
 	usb_free_coherent(dev, ir->len_in, ir->buf_in, ir->dma_in);
 	usb_put_dev(dev);
+	rc_free_device(ir->rc);
 
 	kfree(ir);
 }
diff --git a/drivers/media/rc/rc-ir-raw.c b/drivers/media/rc/rc-ir-raw.c
index 2e269ef5e26be..ba24c2f22d39f 100644
--- a/drivers/media/rc/rc-ir-raw.c
+++ b/drivers/media/rc/rc-ir-raw.c
@@ -648,9 +648,6 @@ int ir_raw_event_register(struct rc_dev *dev)
 
 void ir_raw_event_free(struct rc_dev *dev)
 {
-	if (!dev)
-		return;
-
 	kfree(dev->raw);
 	dev->raw = NULL;
 }
@@ -674,8 +671,6 @@ void ir_raw_event_unregister(struct rc_dev *dev)
 
 	lirc_bpf_free(dev);
 
-	ir_raw_event_free(dev);
-
 	/*
 	 * A user can be calling bpf(BPF_PROG_{QUERY|ATTACH|DETACH}), so
 	 * ensure that the raw member is null on unlock; this is how
diff --git a/drivers/media/rc/rc-loopback.c b/drivers/media/rc/rc-loopback.c
index 78ac09b3cbd34..53d0540717b36 100644
--- a/drivers/media/rc/rc-loopback.c
+++ b/drivers/media/rc/rc-loopback.c
@@ -263,6 +263,7 @@ static int __init loop_init(void)
 static void __exit loop_exit(void)
 {
 	rc_unregister_device(loopdev.dev);
+	rc_free_device(loopdev.dev);
 }
 
 module_init(loop_init);
diff --git a/drivers/media/rc/rc-main.c b/drivers/media/rc/rc-main.c
index 821607504008a..dda3479ea3add 100644
--- a/drivers/media/rc/rc-main.c
+++ b/drivers/media/rc/rc-main.c
@@ -1611,6 +1611,7 @@ static void rc_dev_release(struct device *device)
 {
 	struct rc_dev *dev = to_rc_dev(device);
 
+	ir_raw_event_free(dev);
 	kfree(dev);
 }
 
@@ -1773,7 +1774,6 @@ struct rc_dev *devm_rc_allocate_device(struct device *dev,
 	}
 
 	rc->dev.parent = dev;
-	rc->managed_alloc = true;
 	*dr = rc;
 	devres_add(dev, dr);
 
@@ -2042,11 +2042,7 @@ void rc_unregister_device(struct rc_dev *dev)
 	device_del(&dev->dev);
 
 	ida_free(&rc_ida, dev->minor);
-
-	if (!dev->managed_alloc)
-		rc_free_device(dev);
 }
-
 EXPORT_SYMBOL_GPL(rc_unregister_device);
 
 /*
diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index 3b917a2a89188..3f828a564e192 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -1131,11 +1131,13 @@ static void redrat3_dev_disconnect(struct usb_interface *intf)
 {
 	struct usb_device *udev = interface_to_usbdev(intf);
 	struct redrat3_dev *rr3 = usb_get_intfdata(intf);
+	struct rc_dev *rc = rr3->rc;
 
 	usb_set_intfdata(intf, NULL);
-	rc_unregister_device(rr3->rc);
+	rc_unregister_device(rc);
 	led_classdev_unregister(&rr3->led);
 	redrat3_delete(rr3, udev);
+	rc_free_device(rc);
 }
 
 static int redrat3_dev_suspend(struct usb_interface *intf, pm_message_t message)
diff --git a/drivers/media/rc/st_rc.c b/drivers/media/rc/st_rc.c
index 6b70bac5f45d6..0ba06bfc9e14b 100644
--- a/drivers/media/rc/st_rc.c
+++ b/drivers/media/rc/st_rc.c
@@ -203,6 +203,7 @@ static void st_rc_remove(struct platform_device *pdev)
 	device_init_wakeup(&pdev->dev, false);
 	clk_disable_unprepare(rc_dev->sys_clock);
 	rc_unregister_device(rc_dev->rdev);
+	rc_free_device(rc_dev->rdev);
 }
 
 static int st_rc_open(struct rc_dev *rdev)
@@ -334,7 +335,6 @@ static int st_rc_probe(struct platform_device *pdev)
 	return ret;
 rcerr:
 	rc_unregister_device(rdev);
-	rdev = NULL;
 clkerr:
 	clk_disable_unprepare(rc_dev->sys_clock);
 err:
diff --git a/drivers/media/rc/streamzap.c b/drivers/media/rc/streamzap.c
index 5a18603f9a95c..7103da57c19f1 100644
--- a/drivers/media/rc/streamzap.c
+++ b/drivers/media/rc/streamzap.c
@@ -388,15 +388,16 @@ static void streamzap_disconnect(struct usb_interface *interface)
 	struct streamzap_ir *sz = usb_get_intfdata(interface);
 	struct usb_device *usbdev = interface_to_usbdev(interface);
 
-	usb_set_intfdata(interface, NULL);
-
 	if (!sz)
 		return;
 
-	usb_kill_urb(sz->urb_in);
 	rc_unregister_device(sz->rdev);
+	usb_set_intfdata(interface, NULL);
+
+	usb_kill_urb(sz->urb_in);
 	usb_free_urb(sz->urb_in);
 	usb_free_coherent(usbdev, sz->buf_in_len, sz->buf_in, sz->dma_in);
+	rc_free_device(sz->rdev);
 
 	kfree(sz);
 }
diff --git a/drivers/media/rc/sunxi-cir.c b/drivers/media/rc/sunxi-cir.c
index 92ef4e7c6f69f..cb4c56bf0752a 100644
--- a/drivers/media/rc/sunxi-cir.c
+++ b/drivers/media/rc/sunxi-cir.c
@@ -371,6 +371,7 @@ static void sunxi_ir_remove(struct platform_device *pdev)
 	struct sunxi_ir *ir = platform_get_drvdata(pdev);
 
 	rc_unregister_device(ir->rc);
+	rc_free_device(ir->rc);
 	sunxi_ir_hw_exit(&pdev->dev);
 }
 
diff --git a/drivers/media/rc/ttusbir.c b/drivers/media/rc/ttusbir.c
index 110a469001146..a2a64a860264b 100644
--- a/drivers/media/rc/ttusbir.c
+++ b/drivers/media/rc/ttusbir.c
@@ -333,7 +333,6 @@ static int ttusbir_probe(struct usb_interface *intf,
 	return 0;
 out3:
 	rc_unregister_device(rc);
-	rc = NULL;
 out2:
 	led_classdev_unregister(&tt->led);
 out:
@@ -373,6 +372,7 @@ static void ttusbir_disconnect(struct usb_interface *intf)
 	}
 	usb_kill_urb(tt->bulk_urb);
 	usb_free_urb(tt->bulk_urb);
+	rc_free_device(tt->rc);
 	usb_set_intfdata(intf, NULL);
 	kfree(tt);
 }
diff --git a/drivers/media/rc/winbond-cir.c b/drivers/media/rc/winbond-cir.c
index 515469dd82d4c..8e804661a6215 100644
--- a/drivers/media/rc/winbond-cir.c
+++ b/drivers/media/rc/winbond-cir.c
@@ -1132,7 +1132,6 @@ wbcir_probe(struct pnp_dev *device, const struct pnp_device_id *dev_id)
 	release_region(data->wbase, WAKEUP_IOMEM_LEN);
 exit_unregister_device:
 	rc_unregister_device(data->dev);
-	data->dev = NULL;
 exit_free_rc:
 	rc_free_device(data->dev);
 exit_unregister_led:
@@ -1163,6 +1162,7 @@ wbcir_remove(struct pnp_dev *device)
 	wbcir_set_bits(data->wbase + WBCIR_REG_WCEIR_EV_EN, 0x00, 0x07);
 
 	rc_unregister_device(data->dev);
+	rc_free_device(data->dev);
 
 	led_classdev_unregister(&data->led);
 
diff --git a/drivers/media/rc/xbox_remote.c b/drivers/media/rc/xbox_remote.c
index 3e3da70cf8da0..c64123e9d16a5 100644
--- a/drivers/media/rc/xbox_remote.c
+++ b/drivers/media/rc/xbox_remote.c
@@ -277,14 +277,15 @@ static void xbox_remote_disconnect(struct usb_interface *interface)
 	struct xbox_remote *xbox_remote;
 
 	xbox_remote = usb_get_intfdata(interface);
-	usb_set_intfdata(interface, NULL);
 	if (!xbox_remote) {
 		dev_warn(&interface->dev, "%s - null device?\n", __func__);
 		return;
 	}
 
-	usb_kill_urb(xbox_remote->irq_urb);
 	rc_unregister_device(xbox_remote->rdev);
+	usb_set_intfdata(interface, NULL);
+	usb_kill_urb(xbox_remote->irq_urb);
+	rc_free_device(xbox_remote->rdev);
 	usb_free_urb(xbox_remote->irq_urb);
 	kfree(xbox_remote);
 }
diff --git a/drivers/media/usb/au0828/au0828-input.c b/drivers/media/usb/au0828/au0828-input.c
index 7dec1a360da6a..81d0165a3064d 100644
--- a/drivers/media/usb/au0828/au0828-input.c
+++ b/drivers/media/usb/au0828/au0828-input.c
@@ -357,6 +357,7 @@ void au0828_rc_unregister(struct au0828_dev *dev)
 		return;
 
 	rc_unregister_device(ir->rc);
+	rc_free_device(ir->rc);
 
 	/* done */
 	kfree(ir);
diff --git a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
index 600cff8a4abdc..bd86d250433df 100644
--- a/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
+++ b/drivers/media/usb/dvb-usb-v2/dvb_usb_core.c
@@ -187,6 +187,7 @@ static int dvb_usbv2_remote_exit(struct dvb_usb_device *d)
 	if (d->rc_dev) {
 		cancel_delayed_work_sync(&d->rc_query_work);
 		rc_unregister_device(d->rc_dev);
+		rc_free_device(d->rc_dev);
 		d->rc_dev = NULL;
 	}
 
diff --git a/drivers/media/usb/dvb-usb/dvb-usb-remote.c b/drivers/media/usb/dvb-usb/dvb-usb-remote.c
index 65e2c9e2cdc99..6dc11718dfb98 100644
--- a/drivers/media/usb/dvb-usb/dvb-usb-remote.c
+++ b/drivers/media/usb/dvb-usb/dvb-usb-remote.c
@@ -347,10 +347,12 @@ int dvb_usb_remote_exit(struct dvb_usb_device *d)
 {
 	if (d->state & DVB_USB_STATE_REMOTE) {
 		cancel_delayed_work_sync(&d->rc_query_work);
-		if (d->props.rc.mode == DVB_RC_LEGACY)
+		if (d->props.rc.mode == DVB_RC_LEGACY) {
 			input_unregister_device(d->input_dev);
-		else
+		} else {
 			rc_unregister_device(d->rc_dev);
+			rc_free_device(d->rc_dev);
+		}
 	}
 	d->state &= ~DVB_USB_STATE_REMOTE;
 	return 0;
diff --git a/drivers/media/usb/em28xx/em28xx-input.c b/drivers/media/usb/em28xx/em28xx-input.c
index 20fdd59b55185..ab61d9a29b10e 100644
--- a/drivers/media/usb/em28xx/em28xx-input.c
+++ b/drivers/media/usb/em28xx/em28xx-input.c
@@ -853,6 +853,7 @@ static int em28xx_ir_fini(struct em28xx *dev)
 		goto ref_put;
 
 	rc_unregister_device(ir->rc);
+	rc_free_device(ir->rc);
 
 	kfree(ir->i2c_client);
 
diff --git a/drivers/staging/media/av7110/av7110_ir.c b/drivers/staging/media/av7110/av7110_ir.c
index 68b3979ba5f20..fdae467fd7ab8 100644
--- a/drivers/staging/media/av7110/av7110_ir.c
+++ b/drivers/staging/media/av7110/av7110_ir.c
@@ -151,6 +151,7 @@ int av7110_ir_init(struct av7110 *av7110)
 void av7110_ir_exit(struct av7110 *av7110)
 {
 	rc_unregister_device(av7110->ir.rcdev);
+	rc_free_device(av7110->ir.rcdev);
 }
 
 //MODULE_AUTHOR("Holger Waechtler <holger@convergence.de>, Oliver Endriss <o.endriss@gmx.de>");
diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 35c7a0546f02e..7c964b5ad7926 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -81,7 +81,6 @@ struct lirc_fh {
 /**
  * struct rc_dev - represents a remote control device
  * @dev: driver model's view of this device
- * @managed_alloc: devm_rc_allocate_device was used to create rc_dev
  * @registered: set to true by rc_register_device(), false by
  *	rc_unregister_device
  * @idle: used to keep track of RX state
@@ -156,7 +155,6 @@ struct lirc_fh {
  */
 struct rc_dev {
 	struct device			dev;
-	bool				managed_alloc;
 	bool				registered;
 	bool				idle;
 	bool				encode_wakeup;
-- 
2.53.0


