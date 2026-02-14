Return-Path: <linux-media+bounces-52800-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2GlyMp3Kj2ntTgEAu9opvQ
	(envelope-from <linux-media+bounces-52800-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:06:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C5E13A6F2
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:06:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7DCEF30187BA
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A83D2222D0;
	Sat, 14 Feb 2026 01:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KmEDFFU0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814A9194098;
	Sat, 14 Feb 2026 01:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031118; cv=none; b=b9/LdTlInQlZPpPxpz31axZc6kMI40+H1dDKtvR/hUizz1AQyQFtAWBZinrrCgWRmjjui1ByK59yWbqb9rLmpftzwtHJgPdaimeQVC6bDTUJVML4QuvHdnFJVjWN+y/BWDVfklKlg4Sry1NWMFYGZYkLnx6EDPWK2k0dihh6Ehs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031118; c=relaxed/simple;
	bh=LQBMBtLQTmfpok0qH5kG1AQJ5d8akvZJuNwR5/VKM8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n6izlnoU9rWrAIbe9X9Xg6+/zfctHUey5Yo9LXYzcunRlxHMnEF3p4iK+eGpmeVjDLNjD+canlAqTXNV4gdex1RedTopq6lAd70Ok/Hckc31rB/slGzRuUuT7rWmrxMyTTTTj2V5RlVZ8cTgQBcJLu0KJPQWZLOFQxIV8DZR0ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KmEDFFU0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547CBC116C6;
	Sat, 14 Feb 2026 01:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031118;
	bh=LQBMBtLQTmfpok0qH5kG1AQJ5d8akvZJuNwR5/VKM8Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KmEDFFU0kfvbbin+im8mXUlvKCxfKKYnMdEW05lBVJ/dcMk4eNoRl5xPkTEzbkxDs
	 aTL3EhSO3KTU4SDgamPR/I5mmBcOen6x4TdfrLVyKDfdr/LWwOoaeyAjgiWi5HdQu1
	 baZfP741e5MhI9avZ+kFEa0opGCclGtzEO1w/jstFzTNBf/Kus7NdV+e+fHNEO3a/F
	 ggtdWFd9C5RSB9LdKDosZsnGH3PiMwqEUP8wBjvqWYVibE8tTUQJiM+MOZ4LdnQ6Jk
	 DT9bL8GF7eCl2Cm5u8hho3wUnHz2xTqaLUR7Eq0H4O3bt//FcdcuCR5tDLtNOeJk5K
	 WyHCM+ecVPUCQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	maintainers@bluecherrydvr.com,
	andrey_utkin@fastmail.com,
	ismael@iodev.co.uk,
	linux-media@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH AUTOSEL 6.19-5.10] media: solo6x10: Check for out of bounds chip_id
Date: Fri, 13 Feb 2026 19:59:09 -0500
Message-ID: <20260214010245.3671907-69-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,bluecherrydvr.com,fastmail.com,iodev.co.uk,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52800-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 00C5E13A6F2
X-Rspamd-Action: no action

From: Kees Cook <kees@kernel.org>

[ Upstream commit 0fdf6323c35a134f206dcad5babb4ff488552076 ]

Clang with CONFIG_UBSAN_SHIFT=y noticed a condition where a signed type
(literal "1" is an "int") could end up being shifted beyond 32 bits,
so instrumentation was added (and due to the double is_tw286x() call
seen via inlining), Clang decides the second one must now be undefined
behavior and elides the rest of the function[1]. This is a known problem
with Clang (that is still being worked on), but we can avoid the entire
problem by actually checking the existing max chip ID, and now there is
no runtime instrumentation added at all since everything is known to be
within bounds.

Additionally use an unsigned value for the shift to remove the
instrumentation even without the explicit bounds checking.

Link: https://github.com/ClangBuiltLinux/linux/issues/2144 [1]
Suggested-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Kees Cook <kees@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
[hverkuil: fix checkpatch warning for is_tw286x]
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of media: solo6x10: Check for out of bounds chip_id

### 1. Commit Message Analysis

The commit addresses two related issues:
- **UBSAN shift sanitizer warning**: With `CONFIG_UBSAN_SHIFT=y`, Clang
  detects that a signed `int` literal `1` could be shifted beyond 32
  bits in the `is_tw286x()` macro, which is undefined behavior (UB).
- **Clang miscompilation due to UB**: Because of the UB, Clang's
  optimizer concludes the second `is_tw286x()` call (after inlining)
  must be UB and **elides the rest of the function**. This means code is
  silently dropped by the compiler.
- The fix adds explicit bounds checking (`chip_num >= TW_NUM_CHIP`) and
  changes the shift to use an unsigned value (`1U`).

### 2. Code Change Analysis

Three distinct changes:

**a) Macro fix (`1` → `1U` and added parentheses):**
```c
-#define is_tw286x(__solo, __id) (!(__solo->tw2815 & (1 << __id)))
+#define is_tw286x(__solo, __id) (!((__solo)->tw2815 & (1U << (__id))))
```
- Changes signed shift to unsigned, eliminating undefined behavior for
  shifts ≥ 31
- Adds proper parenthesization (macro hygiene)
- This is a real UB fix — shifting a signed `1` by ≥ 31 bits is
  undefined in C

**b) Bounds check in `tw28_set_ctrl_val()`:**
```c
+       if (chip_num >= TW_NUM_CHIP)
+               return -EINVAL;
```
- `chip_num` is derived from `ch / 4` where `ch` is a `u8` parameter
- `TW_NUM_CHIP` defines the maximum number of chips
- Without this check, an out-of-bounds `chip_num` would cause UB in the
  `is_tw286x()` shift and potentially out-of-bounds array access in
  `TW_CHIP_OFFSET_ADDR()`

**c) Same bounds check in `tw28_get_ctrl_val()`:**
```c
+       if (chip_num >= TW_NUM_CHIP)
+               return -EINVAL;
```
- Same protection for the read path

### 3. Bug Classification

This fixes **undefined behavior** that leads to **compiler-caused
miscompilation**. The Clang compiler, upon detecting that UB is
possible, optimizes away portions of the function. This is not a
theoretical concern — the linked ClangBuiltLinux issue (#2144) documents
the actual problem.

The consequences of the UB:
1. **Silent code elision**: The compiler removes code paths it deems
   unreachable due to UB, meaning the function silently does nothing in
   some cases
2. **Potential out-of-bounds access**: Without bounds checking, invalid
   `chip_id` values cause shifts beyond type width
3. **UBSAN runtime warnings**: Noise in kernel logs for users with
   sanitizers enabled

### 4. Scope and Risk Assessment

- **Files changed**: 1 file (`solo6x10-tw28.c`)
- **Lines changed**: ~6 lines of actual logic (macro change + 2 bounds
  checks)
- **Risk**: Very low — the macro change preserves semantics while
  removing UB; bounds checks add early returns for invalid inputs
- **Subsystem**: Media PCI driver (solo6x10) — contained, no core kernel
  impact
- **Could break something**: Extremely unlikely — the macro change only
  affects behavior for previously-UB cases, and the bounds checks only
  reject invalid chip IDs

### 5. User Impact

- Users building with Clang + UBSAN (increasingly common, especially on
  Android and ChromeOS) hit this directly
- The miscompilation affects correctness of the driver — functions may
  be silently broken
- The solo6x10 is a surveillance/DVR capture card used in production
  systems

### 6. Stable Kernel Criteria

| Criterion | Assessment |
|-----------|------------|
| Obviously correct | Yes — straightforward UB fix and bounds check |
| Fixes real bug | Yes — compiler miscompilation due to UB |
| Important issue | Medium — affects Clang users, prevents silent code
elision |
| Small and contained | Yes — 6 lines of logic in 1 file |
| No new features | Correct — pure bug fix |
| Tested | Yes — authored by Kees Cook, reviewed/applied by Hans Verkuil
|

### 7. Dependencies

The patch is self-contained. It only references `TW_NUM_CHIP` which is
already defined in the driver header. No dependencies on other commits.

### Decision

This is a legitimate bug fix addressing undefined behavior that causes
real miscompilation with Clang. The fix is small (6 lines of logic),
surgical, self-contained, obviously correct, and authored/reviewed by
well-known kernel developers. It prevents silent code elision by the
compiler and adds proper bounds checking. The risk of regression is
negligible.

**YES**

 drivers/media/pci/solo6x10/solo6x10-tw28.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-tw28.c b/drivers/media/pci/solo6x10/solo6x10-tw28.c
index 1b7c22a9bc94f..8f53946c67928 100644
--- a/drivers/media/pci/solo6x10/solo6x10-tw28.c
+++ b/drivers/media/pci/solo6x10/solo6x10-tw28.c
@@ -166,7 +166,7 @@ static const u8 tbl_tw2865_pal_template[] = {
 	0x64, 0x51, 0x40, 0xaf, 0xFF, 0xF0, 0x00, 0xC0,
 };
 
-#define is_tw286x(__solo, __id) (!(__solo->tw2815 & (1 << __id)))
+#define is_tw286x(__solo, __id) (!((__solo)->tw2815 & (1U << (__id))))
 
 static u8 tw_readbyte(struct solo_dev *solo_dev, int chip_id, u8 tw6x_off,
 		      u8 tw_off)
@@ -686,6 +686,9 @@ int tw28_set_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch,
 	chip_num = ch / 4;
 	ch %= 4;
 
+	if (chip_num >= TW_NUM_CHIP)
+		return -EINVAL;
+
 	if (val > 255 || val < 0)
 		return -ERANGE;
 
@@ -758,6 +761,9 @@ int tw28_get_ctrl_val(struct solo_dev *solo_dev, u32 ctrl, u8 ch,
 	chip_num = ch / 4;
 	ch %= 4;
 
+	if (chip_num >= TW_NUM_CHIP)
+		return -EINVAL;
+
 	switch (ctrl) {
 	case V4L2_CID_SHARPNESS:
 		/* Only 286x has sharpness */
-- 
2.51.0


