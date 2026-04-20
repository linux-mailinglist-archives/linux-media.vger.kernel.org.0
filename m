Return-Path: <linux-media+bounces-59141-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YOPgCC855mlutgEAu9opvQ
	(envelope-from <linux-media+bounces-59141-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:33:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 685A142D2F1
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 16:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 336E131075D3
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 13:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C654D3F165C;
	Mon, 20 Apr 2026 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pkz+hDod"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0923F1649;
	Mon, 20 Apr 2026 13:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691536; cv=none; b=nVW6FMy+iCmZWkR9+KNScADgSBd+HSLzQvvR+ziA0m+QflyTeGk+EJ3oo6W7U/8Ut08Y9lQMODAoX4wGH0TnSa+9kQHKHEs7Z/Oiywg0CMa3XZETrGJbx1P1Jyo9p9JJmSEonr/DHH0UrdqIsBhmQPaVvnvR9w0snwmcPA6vq4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691536; c=relaxed/simple;
	bh=5ZRIdiyYEkCzCtmFZLcDUi/KMHi73p0Bfxd9c4XMJww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r6ajVosTW8+NSC5utviWVb46G0OsxqHKfSjo2xJhts+4HFCXxEWiVMvrzhvOq3UF0qceo7lCKffDE3msrvpSIa5sJC/DNRrr5WNdlYm2iuz75TGe16ZMa+L7Q7+WBzFKjPRSoVkqMZh7sqUCVRQdokjsVLVcrCCoakPv4JPJJ4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pkz+hDod; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C0C0C19425;
	Mon, 20 Apr 2026 13:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691536;
	bh=5ZRIdiyYEkCzCtmFZLcDUi/KMHi73p0Bfxd9c4XMJww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pkz+hDodACeSPzJ3i1xZkSnvoRDeZQjnfGjJmoGqimS9XSC4I6NjnEV9ApY9WGRzq
	 hisHjDZQXKNLlkGPr0FrXTFT6XcMrqKnPYcNaT5y9D/ukU2009qPSJr+xBd85rBfaJ
	 bXMZYNzGqIHiWzZUhsDAigaJWhuwB0P4SneR87d/lFkQk2QDln8ayAXsaMJ4eYI3Et
	 IaEIDgrdBMpxlOn9mYN81wAgtEQQEOmVZqq3dvZPHrnk0bE3HGuh4ZZtfZe/NgXQ8g
	 HQ3VJrqojIl88iWS0KkEYjlRhsVx29Ms2nLK8f8y7vEk5pfT81wKQE3z/bXVM9DWjt
	 I7QkL7Ve8Wx+Q==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.15] media: em28xx: Add a variety of DualHD usb id
Date: Mon, 20 Apr 2026 09:18:01 -0400
Message-ID: <20260420132314.1023554-87-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 7.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59141-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nextdimension.cc:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 685A142D2F1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bradford Love <brad@nextdimension.cc>

[ Upstream commit 724e16b166534bd01d4f5bdf310310146bd4da56 ]

Include possible vid:pid combination of DualHD models
that are in the wild.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have enough information to complete the full analysis. Let me
compile my findings.

---

## Full Analysis: media: em28xx: Add a variety of DualHD usb id

### PHASE 1: COMMIT MESSAGE FORENSICS

**Step 1.1: Subject Line**
- Subsystem: `media: em28xx:`
- Action verb: "Add"
- Summary: Adding new USB vid:pid entries for Hauppauge DualHD models to
  the em28xx driver.
- Record: [media: em28xx] [Add] [New USB device IDs for DualHD variants
  in the wild]

**Step 1.2: Tags**
- `Signed-off-by: Bradford Love <brad@nextdimension.cc>` - Author; Brad
  Love is a well-known contributor for Hauppauge em28xx devices (14+
  commits to this driver).
- `Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>` - Media
  subsystem maintainer.
- No Fixes: tag (expected for device ID additions).
- No Reported-by: tag.
- No Cc: stable (expected — that's why we're reviewing it).
- Record: Author is a repeat contributor to this exact subsystem. Signed
  off by media maintainer.

**Step 1.3: Commit Body**
- "Include possible vid:pid combination of DualHD models that are in the
  wild."
- This describes real hardware variants already out in the field that
  users own but cannot use because the kernel doesn't recognize the USB
  IDs.
- Record: Bug = hardware not recognized. Symptom = users with DualHD
  variants cannot use them. Root cause = missing USB IDs.

**Step 1.4: Hidden Bug Fix Detection**
- This is a device ID addition — a well-known exception category. While
  it's "adding" code, it enables already-supported hardware. Without
  these IDs, users cannot use their devices at all.
- Record: This is an explicit hardware enablement fix via device IDs.
  Classic stable material.

### PHASE 2: DIFF ANALYSIS

**Step 2.1: Inventory**
- Files changed: 1 (`drivers/media/usb/em28xx/em28xx-cards.c`)
- Lines added: 12 (6 new USB_DEVICE entries, each 2 lines)
- Lines removed: 0
- Functions modified: None — changes are in the static
  `em28xx_id_table[]` array.
- Record: Single-file, 12-line addition. Data-only change to USB ID
  table. Zero code logic change.

**Step 2.2: Code Flow Change**
- Before: The `em28xx_id_table[]` did not include PIDs 0x8269, 0x8278,
  0x826e, 0x826f, 0x8270, 0x8271.
- After: These 6 PIDs are mapped to existing board definitions
  (`EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB` and
  `EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595`).
- Effect: USB subsystem will now match these devices and bind the em28xx
  driver.
- Record: Pure data addition to USB match table. No behavior change for
  existing devices.

**Step 2.3: Bug Mechanism**
- Category: Hardware workaround / device ID addition (category h).
- The new IDs map to two existing board definitions that are fully
  functional. The board definitions
  (`EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB` at line 2520,
  `EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595` at line 2542) already
  exist and have full driver support including DVB, dual transport
  stream, I2C, tuner, and LED configurations.
- Record: Missing USB IDs → device not recognized. Fix adds IDs mapping
  to existing, tested board configs.

**Step 2.4: Fix Quality**
- Obviously correct: each new entry is a 2-line `USB_DEVICE` macro
  mapping a vid:pid to an existing board definition. The pattern is
  identical to existing entries.
- Minimal/surgical: 12 lines of pure data, zero logic changes.
- Regression risk: Effectively zero. These IDs are new — no existing
  device will be affected. The only devices affected are ones that
  previously weren't recognized.
- Record: Perfect quality. Zero regression risk. Follows established
  patterns exactly.

### PHASE 3: GIT HISTORY INVESTIGATION

**Step 3.1: Blame**
- The DualHD DVB board support was added by Olli Salonen in commit
  `11a2a949d05e9d` (2016, v4.7 timeframe).
- The DualHD 01595 ATSC/QAM board support was added by Kevin Cheng in
  commit `1586342e428d80` (2017, v4.11 timeframe).
- Brad Love previously added bulk-mode PIDs (0x8265, 0x826d) in commit
  `f2a326c928cca1` (2018, v4.16 timeframe).
- Record: Board definitions have been stable since v4.7/v4.11. Exist in
  ALL active stable trees.

**Step 3.2: Fixes Tag** — Not applicable (no Fixes: tag, which is
expected for device ID additions).

**Step 3.3: File History**
- The em28xx-cards.c file has had very few changes since v6.1 (only 4
  commits, mostly treewide cleanups).
- Record: File is stable, no conflicts expected. Standalone change.

**Step 3.4: Author**
- Brad Love has 14+ commits to the em28xx driver, including the original
  DualHD bulk model support, dual transport stream fixes, disconnect
  oops fixes, and other DualHD-related patches. He is effectively the
  Hauppauge DualHD expert for em28xx.
- Record: Author is a domain expert for this exact hardware. Very high
  trust.

**Step 3.5: Dependencies**
- No dependencies. The board definitions already exist. The only change
  is adding new entries to the USB ID table.
- Record: Fully standalone. No prerequisites.

### PHASE 4: MAILING LIST AND EXTERNAL RESEARCH

**Step 4.1: Original Patch Discussion**
- Found via mail-archive: committed to media.git/next on March 12, 2026.
- Signed off by Hans Verkuil (media subsystem co-maintainer).
- Record: Patch was submitted and merged through the normal media tree
  path. Signed off by maintainer.

**Step 4.2: Reviewers**
- Hans Verkuil signed off as maintainer. Brad Love is a trusted
  contributor.
- Record: Proper maintainer signoff.

**Step 4.3-4.5: Bug Report and Stable Discussion**
- The commit message says "DualHD models that are in the wild" — these
  are real devices owned by real users.
- No explicit stable nomination found, but device ID additions are a
  well-known automatic exception category.
- Record: Real hardware in the field. No counter-indications found.

### PHASE 5: CODE SEMANTIC ANALYSIS

**Step 5.1-5.5:** Not deeply applicable for a USB ID table addition. The
`em28xx_id_table[]` is used by the USB core's `usb_match_id()` during
device enumeration. This is a standard, well-tested kernel mechanism.
The board definitions pointed to by these new IDs are already fully
exercised by the existing IDs (0x0265, 0x8265, 0x026d, 0x826d).

Record: Zero code logic change. Data table addition only. Existing board
configs are well-tested.

### PHASE 6: CROSS-REFERENCING AND STABLE TREE ANALYSIS

**Step 6.1:** The board definitions
(`EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB` and
`EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595`) have existed since v4.7
and v4.11 respectively. They exist in ALL active stable trees (6.1.y,
6.6.y, 6.12.y, etc.).

**Step 6.2:** The patch will apply cleanly to all stable trees. The USB
ID table area has been very stable, with only occasional new ID
additions.

**Step 6.3:** No related fixes already in stable for these specific
PIDs.

Record: Clean apply expected on all stable trees. Board support exists
everywhere.

### PHASE 7: SUBSYSTEM AND MAINTAINER CONTEXT

**Step 7.1:** Subsystem: `drivers/media/usb` — USB video capture
devices. Criticality: PERIPHERAL (specific hardware), but USB media
devices are commonly used consumer hardware.

**Step 7.2:** The em28xx driver is mature and stable, with infrequent
changes.

### PHASE 8: IMPACT AND RISK ASSESSMENT

**Step 8.1:** Affected users: Anyone with a Hauppauge WinTV-dualHD
device with these specific PIDs. These are "in the wild" — real consumer
products.

**Step 8.2:** Trigger: Simply plugging in the device. Without the IDs,
the device is completely non-functional under Linux.

**Step 8.3:** Failure mode: Device not recognized by the kernel at all.
Severity for affected users: COMPLETE (device unusable).

**Step 8.4:**
- BENEFIT: High — enables real hardware for real users. Without this,
  the device is a paperweight on Linux.
- RISK: Effectively zero — 12 lines of data-only additions to a match
  table. No code logic changes. No regression possible for existing
  users.
- Record: Extremely favorable risk/benefit ratio.

### PHASE 9: FINAL SYNTHESIS

**Step 9.1: Evidence Summary**

FOR backporting:
- Classic device ID addition — a well-documented exception category for
  stable
- 12 lines of pure data additions, zero logic changes
- Maps to existing, well-tested board definitions (in tree since
  v4.7/v4.11)
- Author is the domain expert with 14+ commits to this driver
- Signed off by media subsystem maintainer
- Zero regression risk
- Enables real hardware "in the wild" for real users
- Applies cleanly to all stable trees

AGAINST backporting:
- None identified.

**Step 9.2: Stable Rules Checklist**
1. Obviously correct and tested? **YES** — trivial USB_DEVICE macro
   entries mapping to existing boards.
2. Fixes a real bug? **YES** — hardware not recognized without these
   IDs.
3. Important issue? **YES** — device completely non-functional without
   these IDs.
4. Small and contained? **YES** — 12 lines, 1 file, data only.
5. No new features or APIs? **YES** — no new features, just new device
   IDs for existing driver.
6. Can apply to stable trees? **YES** — board definitions exist in all
   stable trees.

**Step 9.3: Exception Category**
This is a **NEW DEVICE ID** addition to an existing driver — explicitly
listed as an exception category that is automatically YES for stable.

### Verification

- [Phase 1] Parsed tags: Signed-off-by author (Brad Love) and maintainer
  (Hans Verkuil). No Fixes/Reported-by/Cc:stable (expected).
- [Phase 2] Diff analysis: 12 lines added — 6 USB_DEVICE entries in
  em28xx_id_table[]. Zero code logic changes.
- [Phase 2] New IDs (0x8269, 0x8278, 0x826e, 0x826f, 0x8270, 0x8271)
  confirmed NOT in current tree via grep.
- [Phase 3] git blame: Board definitions introduced in v4.7
  (11a2a949d05e9d) and v4.11 (1586342e428d80) — present in all active
  stable trees.
- [Phase 3] Author history: Brad Love has 14+ em28xx commits including
  prior DualHD bulk model support (f2a326c928cca1).
- [Phase 3] File history: em28xx-cards.c has had only 4 changes since
  v6.1, all unrelated.
- [Phase 4] Mail archive confirms commit was merged to media.git/next on
  March 12, 2026, signed by Hans Verkuil.
- [Phase 5] Change is data-only (USB ID table). No code flow analysis
  needed.
- [Phase 6] Board definitions exist in all stable trees (v5.15.y through
  v6.12.y). Clean apply expected.
- [Phase 8] Risk: zero (data-only). Benefit: enables completely non-
  functional hardware for real users.

**YES**

 drivers/media/usb/em28xx/em28xx-cards.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/usb/em28xx/em28xx-cards.c b/drivers/media/usb/em28xx/em28xx-cards.c
index 59a2e4db75b72..2d19f8ecd6857 100644
--- a/drivers/media/usb/em28xx/em28xx-cards.c
+++ b/drivers/media/usb/em28xx/em28xx-cards.c
@@ -2757,10 +2757,22 @@ struct usb_device_id em28xx_id_table[] = {
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB },
 	{ USB_DEVICE(0x2040, 0x8265),
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB },
+	{ USB_DEVICE(0x2040, 0x8269),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB },
+	{ USB_DEVICE(0x2040, 0x8278),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_DVB },
 	{ USB_DEVICE(0x2040, 0x026d),
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
 	{ USB_DEVICE(0x2040, 0x826d),
 			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x826e),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x826f),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x8270),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
+	{ USB_DEVICE(0x2040, 0x8271),
+			.driver_info = EM28174_BOARD_HAUPPAUGE_WINTV_DUALHD_01595 },
 	{ USB_DEVICE(0x2040, 0x846d),
 			.driver_info = EM2874_BOARD_HAUPPAUGE_USB_QUADHD },
 	{ USB_DEVICE(0x0438, 0xb002),
-- 
2.53.0


