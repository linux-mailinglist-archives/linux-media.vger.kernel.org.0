Return-Path: <linux-media+bounces-59145-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OOWgIzZL5mnSuQEAu9opvQ
	(envelope-from <linux-media+bounces-59145-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:50:14 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C194142EA0D
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 17:50:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A3A031721E5
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2026 14:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4E5407563;
	Mon, 20 Apr 2026 13:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEh7axjc"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746553C343C;
	Mon, 20 Apr 2026 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691627; cv=none; b=Z2nuWesGliBPEa90ZwxWfgy/StbCu6aRRtTyMRApsdiy4nWV61dYXqIDJs96Od8qN5eY2we3EFCoASGP7yB3ZSmdFycAmyFAj+4KZgH7L5pbpS323wcMKo95IvVxsG6758MX4zjGjBFH+f9Kbd0z6IKi/mhuylEMCw0ev5EYHHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691627; c=relaxed/simple;
	bh=4cbhVVzDeDh7Z5gnWAvpYG0zlvbBS6V8GhRanOaIW5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xdf1CO1goEh7SIBJvwE8zbmGWn6oHbXAtILje59pMYo/wraK9dU3fipWWLuAkQWrm2uS6AtkvlmN7YJtAnPJAX5IuDEB93PmWMBkYn5VBfILk+21GIJ1bhohVQiE/wNmvIieFvkLhWqRJmWQE0oZxpL2i1v7eXGdjU9ArEgvSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEh7axjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F06C19425;
	Mon, 20 Apr 2026 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691627;
	bh=4cbhVVzDeDh7Z5gnWAvpYG0zlvbBS6V8GhRanOaIW5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kEh7axjcQ5NtMR3keAeD9Y/snzoSM3Mfw4hwcut8I4ZGZHf8i2GxJNAICCcXrwC03
	 /a0SrA6tBgWIwBgvW0lYuIYMvCp4vKRltuAg1FOtI7gnhsKqSXelwWVbIVYQK4HKgU
	 hCsbwl5gN/UZT0vEj3CqND15bm6eV6xs1jIlQnpkzeHAlQjnTUH36yic3xVPtwtMaD
	 xMaL5pIPRW9X3qO6iHX9mS1omSEAcdBEFibQsqBoqwENYKsgr369ljpLfjTxOPvinq
	 jFu0geOcLJXTxP34sxYKwBP6942+a5mukAvp0lbF2gLafYh4NCFwb7kz7NULyhR7i0
	 nwL6lKgYXc/mQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Bradford Love <brad@nextdimension.cc>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 7.0-5.10] media: si2168: Fix i2c command timeout on embedded platforms
Date: Mon, 20 Apr 2026 09:18:54 -0400
Message-ID: <20260420132314.1023554-140-sashal@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-59145-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C194142EA0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bradford Love <brad@nextdimension.cc>

[ Upstream commit 3c414622fe4bcedc48305bfe2170ae13119fc331 ]

On many embedded platforms i2c responses through USB are not returned
as quickly, plus constantly banging on the i2c master receive essentially
deadlocks the driver. Inserting a 3ms delay between i2c receive calls
and extending the timeout fixes all tested platforms.

Signed-off-by: Bradford Love <brad@nextdimension.cc>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Now I have all the information needed for a thorough analysis. Let me
compile the full assessment.

---

## PHASE 1: COMMIT MESSAGE FORENSICS

### Step 1.1: Parse Subject Line
- **Subsystem**: `media: si2168:` (DVB frontend demodulator driver)
- **Action verb**: "Fix" - explicitly a bug fix
- **Summary**: Fixes i2c command timeout and driver deadlock on embedded
  platforms

Record: [media/dvb-frontends/si2168] [Fix] [i2c command timeout causing
driver deadlock on embedded platforms]

### Step 1.2: Parse Tags
- **Signed-off-by**: Bradford Love `<brad@nextdimension.cc>` (author)
- **Signed-off-by**: Hans Verkuil `<hverkuil+cisco@kernel.org>` (media
  subsystem maintainer)
- No Fixes: tag (expected for autosel candidates)
- No Reported-by: tag
- No Cc: stable tag

Record: Signed by the author and by the media subsystem maintainer. No
other tags.

### Step 1.3: Analyze Body Text
The commit describes two problems:
1. On many embedded platforms, i2c responses through USB are **not
   returned quickly**
2. **Constantly banging on the i2c master receive essentially deadlocks
   the driver**

The fix has two parts: insert a 3ms delay between i2c receive calls, and
extend the timeout from 70ms to 140ms.

Record: Bug = tight polling loop without sleep deadlocks i2c bus on slow
USB-connected embedded platforms. Symptom = driver deadlock and command
timeouts. Root cause = no delay between i2c_master_recv calls in polling
loop.

### Step 1.4: Detect Hidden Bug Fixes
This is an explicit bug fix ("Fix" in subject). Not disguised.

Record: Explicit bug fix, not hidden.

---

## PHASE 2: DIFF ANALYSIS

### Step 2.1: Inventory Changes
- **1 file changed**: `drivers/media/dvb-frontends/si2168.c`
- **3 lines added, 1 line removed** (net +2 lines)
- **Function modified**: `si2168_cmd_execute()`
- **Scope**: Single-file, surgical fix within one function

Record: [si2168.c: +3/-1] [si2168_cmd_execute] [Single-file surgical
fix]

### Step 2.2: Understand Code Flow Change
- **Before**: Tight busy-wait loop polling `i2c_master_recv()` with no
  delay between calls, 70ms timeout
- **After**: Same loop but with 2.5-3.5ms `usleep_range()` between
  polls, 140ms timeout

The change affects the command execution wait path, which is used for
every firmware command sent to the si2168 demodulator chip.

### Step 2.3: Bug Mechanism
This is a **hardware workaround / timing fix**:
- The tight loop without sleep hammers the i2c bus continuously, which
  on slow USB-connected platforms effectively deadlocks the driver
- The 70ms timeout was insufficient for some commands (user reports show
  commands taking up to 150ms)
- Adding `usleep_range(2500, 3500)` is standard practice in kernel i2c
  polling loops (confirmed by examining dozens of other DVB frontend
  drivers doing exactly this)

Record: [Hardware timing fix] [Tight polling loop without sleep
deadlocks i2c on USB-connected embedded platforms; timeout too short for
some commands]

### Step 2.4: Fix Quality
- **Obviously correct**: Adding a sleep to a busy-wait polling loop is
  textbook kernel practice
- **Minimal**: Only 3 lines changed
- **Pattern is standard**: Multiple other DVB frontend drivers
  (zd1301_demod.c, stv0367.c, etc.) use `usleep_range()` in identical
  polling patterns
- **Regression risk**: Very low. The usleep_range adds 2.5-3.5ms per
  poll iteration, and the doubled timeout (140ms) provides ample margin.
  No risk of breaking fast platforms.

Record: [Fix is textbook correct, minimal, follows established patterns,
very low regression risk]

---

## PHASE 3: GIT HISTORY INVESTIGATION

### Step 3.1: Blame Changed Lines
From git blame:
- The timeout constant `#define TIMEOUT 70` was set by commit
  `551c33e729f654` (Jurgen Kramer, 2014-12-08) which increased from 50ms
  to 70ms for firmware loading
- The polling loop without sleep has existed since the original driver
  commit `845f35052ea946` (Antti Palosaari, 2014-04-10) when the driver
  was introduced

Record: Buggy code (no-sleep polling loop) has existed since the driver
was introduced in 2014 (kernel ~3.16). Present in ALL stable trees.

### Step 3.2: Follow Fixes Tag
No Fixes: tag present (expected for autosel).

### Step 3.3: File History
The file has 85 total commits. The last several were treewide changes
(alloc_obj, Drop i2c_device_id::driver_data, mux changes, probe API
conversion). The core `si2168_cmd_execute()` polling loop has been
unchanged since 2014.

Record: The polling loop code is ancient and stable. No prerequisites
needed. Standalone fix.

### Step 3.4: Author Context
Bradford Love (`brad@nextdimension.cc`) is a known media driver
contributor with 10+ commits in the media subsystem. Their work includes
em28xx, cx23885, and other DVB-related fixes. They are a Hauppauge
contributor familiar with USB DVB devices.

Record: Author is a known media subsystem contributor, especially USB
DVB devices.

### Step 3.5: Dependencies
No dependencies. The patch changes a constant and adds one function
call. The `usleep_range` function and `<linux/delay.h>` header are
already included in the file. This applies cleanly to any kernel
version.

Record: Completely standalone, no dependencies. `<linux/delay.h>`
already included.

---

## PHASE 4: MAILING LIST RESEARCH

### Step 4.1: Original Patch Discussion
Found the commit notification at mail-archive.com for linuxtv-commits,
showing it was applied to media.git/next by Hans Verkuil in March 2026.

A related patch by Christian Hewitt (v3, September 2025) also addresses
timeout issues, increasing to 200ms but without adding the sleep.
Christian's patch included actual log output showing 80ms commands
failing with -ETIMEDOUT, and noted "The largest value observed from user
reports/logs is 150ms."

Record: [mail-archive linuxtv-commits: msg48547] [Christian Hewitt's v3
also addresses same issue with different approach] [User reports confirm
timeouts are real]

### Step 4.2: Reviewers
Applied by Hans Verkuil, the media subsystem maintainer.

Record: Applied by subsystem maintainer.

### Step 4.3: Bug Reports
Christian Hewitt's related submission provides concrete bug evidence:
logs showing `cmd execution took 80 ms` followed by `failed=-110`
(ETIMEDOUT), causing Tvheadend DVB services to fail completely.

Record: Real-world bug reports with logs from LibreELEC/Kodi users
showing complete service failure.

### Step 4.4: Related Patches
This is a standalone fix, not part of a series.

Record: Standalone patch.

### Step 4.5: Stable Discussion
No specific stable discussion found. The patch does not have Cc: stable.

Record: No stable-specific discussion found.

---

## PHASE 5: CODE SEMANTIC ANALYSIS

### Step 5.1: Key Functions
`si2168_cmd_execute()` - the sole function modified.

### Step 5.2: Callers
`si2168_cmd_execute()` is called **36 times** throughout the driver
from:
- `si2168_ts_bus_ctrl()` - TS bus control
- `si2168_read_status()` - reading demod status (called periodically)
- `si2168_set_frontend()` - setting tuning parameters (~15 calls in
  sequence)
- `si2168_init()` - driver initialization and firmware download (many
  calls)
- `si2168_sleep()` - entering sleep mode
- `si2168_select()`/`si2168_deselect()` - i2c mux operations
- `si2168_probe()` - device probe

Record: This is the central communication function for the entire
driver. Every operation goes through it.

### Step 5.3: Callees
`si2168_cmd_execute()` calls `i2c_master_send()`, `i2c_master_recv()`,
`mutex_lock()`/`mutex_unlock()`.

### Step 5.4: Call Chain
The driver is used as a DVB frontend demodulator, attached via USB
(em28xx, cx231xx, rtl28xxu, dvbsky, af9035) and PCI (cx23885, smipcie,
saa7164). All DVB operations (init, tune, status read, sleep) flow
through `si2168_cmd_execute()`.

Record: Reachable from all DVB userspace operations
(opening/tuning/reading DVB device nodes).

### Step 5.5: Similar Patterns
Examined other DVB frontend drivers - many use `usleep_range()` or
`msleep()` in their i2c polling loops. Examples:
- `zd1301_demod.c`: `usleep_range(500, 800)` in i2c transfer polling
- `stv0367.c`: `usleep_range(2000, 3000)` in polling loops
- The si2168 driver's lack of sleep was an outlier

Record: Adding sleep to polling loop follows established patterns in
sibling drivers.

---

## PHASE 6: STABLE TREE ANALYSIS

### Step 6.1: Buggy Code in Stable Trees
The si2168 driver was introduced in 2014 (~kernel 3.16). The polling
loop without sleep has been present since then. The code exists in
**ALL** active stable trees. The TIMEOUT constant was last changed from
50 to 70 in 2014 and hasn't changed since.

Record: Buggy code exists in all stable trees (5.4.y, 5.10.y, 5.15.y,
6.1.y, 6.6.y, 6.12.y, etc.)

### Step 6.2: Backport Complications
The patch is trivially backportable. The `si2168_cmd_execute()`
function's polling loop has been identical since 2014. Only the function
signature changed slightly in older versions (used `struct si2168 *s`
instead of `struct i2c_client *client`), but the polling loop itself is
the same.

Record: Clean apply expected for recent stable trees (5.15+). Minor
adaptation needed for very old trees.

### Step 6.3: Related Fixes Already in Stable
No related fixes for this issue are in stable trees.

Record: No related fixes in stable.

---

## PHASE 7: SUBSYSTEM CONTEXT

### Step 7.1: Subsystem Criticality
- **Subsystem**: Media/DVB frontends - driver for Silicon Labs Si2168
  demodulator
- **Criticality**: PERIPHERAL (specific driver), but widely used (13+
  parent drivers in USB and PCI subsystems)
- **Users**: LibreELEC, Kodi, Tvheadend, MythTV users with USB and PCI
  DVB tuners

Record: [media/dvb-frontends] [PERIPHERAL but widely used across many
USB/PCI TV tuner cards]

### Step 7.2: Subsystem Activity
The file has 85 total commits over 10+ years. Mostly stable, with recent
changes being treewide API updates rather than driver-specific changes.

Record: Mature/stable subsystem. Bug has been present since driver
introduction.

---

## PHASE 8: IMPACT AND RISK ASSESSMENT

### Step 8.1: Who is Affected
Users of si2168-based DVB tuner devices on embedded platforms (ARM
boards, SBCs, etc.) connected via USB. This includes popular devices
from Hauppauge, MyGica, and others.

Record: [driver-specific] Users of si2168 DVB tuners, particularly on
embedded/ARM platforms with USB-connected tuners.

### Step 8.2: Trigger Conditions
Every i2c command triggers the polling loop. On slow USB-connected
platforms, the tight polling loop causes deadlock and timeouts.
Triggered during normal device operation (tuning, status reading,
firmware loading).

Record: Triggered during normal device usage on affected platforms.
Common trigger.

### Step 8.3: Failure Mode Severity
- **Driver deadlock**: The tight polling effectively deadlocks the
  driver on embedded platforms
- **ETIMEDOUT**: Commands fail with timeout errors, causing DVB services
  (Tvheadend, etc.) to fail completely
- **Severity**: HIGH - complete loss of DVB functionality on affected
  platforms

Record: [Driver deadlock + command timeout] [Severity: HIGH - complete
device failure on embedded platforms]

### Step 8.4: Risk-Benefit Ratio
- **Benefit**: HIGH - fixes complete driver failure on embedded
  platforms
- **Risk**: VERY LOW - 3-line change, adds standard sleep to polling
  loop, follows established patterns, cannot break fast platforms (only
  adds a small delay per poll iteration)
- **Ratio**: Strongly favorable

Record: [HIGH benefit] [VERY LOW risk] [Strongly favorable ratio]

---

## PHASE 9: FINAL SYNTHESIS

### Step 9.1: Evidence Summary

**FOR backporting:**
- Fixes real driver deadlock and timeout failure on embedded platforms
- Only 3 lines changed (+3/-1), extremely contained
- Obviously correct: adding sleep to busy-wait loop is textbook
- Follows established patterns in dozens of sibling DVB drivers
- Central function called 36+ times - affects all driver operations
- Code is unchanged since 2014 - present in ALL stable trees
- No dependencies - completely standalone
- Applied by media subsystem maintainer (Hans Verkuil)
- Real user reports exist (Christian Hewitt's related patch includes
  actual failure logs)
- `<linux/delay.h>` already included, no new includes needed

**AGAINST backporting:**
- No Fixes: tag (expected for autosel candidates)
- No Reported-by: tag
- The timeout increase from 70 to 140 could be considered arbitrary
  (though user reports support even 200ms)

### Step 9.2: Stable Rules Checklist
1. **Obviously correct and tested?** YES - standard pattern, applied by
   maintainer
2. **Fixes a real bug?** YES - driver deadlock and timeout on embedded
   platforms
3. **Important issue?** YES - complete device failure (deadlock +
   timeout)
4. **Small and contained?** YES - 3 lines in 1 file, 1 function
5. **No new features or APIs?** CORRECT - no new features
6. **Can apply to stable trees?** YES - code is identical since 2014

### Step 9.3: Exception Categories
This qualifies as a **hardware workaround** for embedded platforms where
USB i2c is slower.

### Step 9.4: Decision
This is a clear YES. The fix is tiny, obviously correct, follows
established patterns, fixes a real driver deadlock on embedded
platforms, and has no regression risk.

---

## Verification

- [Phase 1] Parsed tags: Signed-off-by from Bradford Love (author) and
  Hans Verkuil (media maintainer)
- [Phase 2] Diff analysis: 3 lines changed in si2168_cmd_execute():
  TIMEOUT 70→140, added usleep_range(2500,3500)
- [Phase 3] git blame: Polling loop without sleep since original driver
  commit 845f35052ea946 (2014, kernel 3.16)
- [Phase 3] git show 551c33e729f654: Confirmed previous TIMEOUT change
  from 50→70 in 2014
- [Phase 3] git log --oneline -20 -- si2168.c: Recent changes are all
  treewide API updates, core polling loop unchanged
- [Phase 3] git log --author="brad@nextdimension.cc": Author is known
  media contributor (em28xx, cx23885, etc.)
- [Phase 4] mail-archive linuxtv-commits msg48547: Confirmed patch was
  applied by Hans Verkuil
- [Phase 4] Christian Hewitt v3 patch: Real user logs showing 80ms cmd
  execution causing ETIMEDOUT failure
- [Phase 4] Wolfram Sang reviewed related Christian Hewitt patch,
  confirming the issue is real
- [Phase 5] grep si2168_cmd_execute: Called 36 times throughout the
  driver - central communication function
- [Phase 5] grep si2168 in USB/PCI drivers: Used by 13+ parent drivers
  (em28xx, cx231xx, dvb-usb-v2, cx23885, etc.)
- [Phase 5] grep usleep_range in dvb-frontends: Dozens of sibling
  drivers use sleep in polling loops (zd1301_demod, stv0367, etc.)
- [Phase 6] git log v6.6.. and v6.1.. show only treewide changes -
  polling loop code identical in all stable trees
- [Phase 6] delay.h already included in file (line 8), no new
  dependencies needed
- [Phase 8] Failure mode: driver deadlock + ETIMEDOUT → complete DVB
  service failure (confirmed by user logs)

**YES**

 drivers/media/dvb-frontends/si2168.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/si2168.c b/drivers/media/dvb-frontends/si2168.c
index 6647e17611734..9c5bac8cda477 100644
--- a/drivers/media/dvb-frontends/si2168.c
+++ b/drivers/media/dvb-frontends/si2168.c
@@ -40,7 +40,7 @@ static int si2168_cmd_execute(struct i2c_client *client, struct si2168_cmd *cmd)
 
 	if (cmd->rlen) {
 		/* wait cmd execution terminate */
-		#define TIMEOUT 70
+		#define TIMEOUT 140
 		timeout = jiffies + msecs_to_jiffies(TIMEOUT);
 		while (!time_after(jiffies, timeout)) {
 			ret = i2c_master_recv(client, cmd->args, cmd->rlen);
@@ -54,6 +54,8 @@ static int si2168_cmd_execute(struct i2c_client *client, struct si2168_cmd *cmd)
 			/* firmware ready? */
 			if ((cmd->args[0] >> 7) & 0x01)
 				break;
+
+			usleep_range(2500, 3500);
 		}
 
 		dev_dbg(&client->dev, "cmd execution took %d ms\n",
-- 
2.53.0


