Return-Path: <linux-media+bounces-45548-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CB5C093F9
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 291AF4210DA
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA3D304980;
	Sat, 25 Oct 2025 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HrFLzfm8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4912E3043B4;
	Sat, 25 Oct 2025 16:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761408785; cv=none; b=jJnUVXlgr5SRqEQfOvNxAirYoFwtoZES1j6QFEb7yN8CnYxq6GSLt99tDlKgPZDgx6/l3hHtrqS6vqB8OSc+tufELUf0FJahNcv12J5ktAdQxyjaItIG013pt9IGYjJGkG0hBEfa37PljRh9GAXkUAyz+/9d0H/0+kFv/TGFa+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761408785; c=relaxed/simple;
	bh=5SzTLdKlW/im13PYmd9glXPYlnj0ulJWHw2nvQB0mLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EPbr7bV/QW3HLd694sSwutLeKhZaxL6L0x6C2AcwLntJrG9aXah5xH2zvsaCGavTcEqCYTYiv/s7OUL7DMB7+aQx4/tgWdUGdqkOEY85shz0PG8Hpbed25twxBNi5YbDS32Ft7F3kf1gfCdz9QYOL7D6CDPWQxLJvIZVUyeAQmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HrFLzfm8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2161C4CEFF;
	Sat, 25 Oct 2025 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761408785;
	bh=5SzTLdKlW/im13PYmd9glXPYlnj0ulJWHw2nvQB0mLk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HrFLzfm8pVzue40gEq8fagiPGa/tXRtMlmWFRCKzmO1LXcIh05KgAVKuRDqTXKx9u
	 Eq5x++fuWPRM33oW2Iu5ZYgaFNKSLqu9RW6SsIcVRCXWPGag0XKpJIvt+orN7drSGL
	 WTu/cuTls00+dPluhuV0QUQ9TUmTM5krCodO+3GrdUCPfNWsByzBz3SO/26VuRA/6U
	 XBIoNx0aJbj5vNiUpto+tErSWn8xgCNZliXsy99E2b7omRvTqKG6LAXBn7mw/wIytX
	 ykDZ9EB3EIrngvE4B0W4168Ue9kMIDKMqAkcmaflbDO41WHoNXJZ1msJrMQ8K3BZ+N
	 eNyDix14Sngag==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Hao Yao <hao.yao@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	jason.z.chen@intel.com,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-6.6] media: ov08x40: Fix the horizontal flip control
Date: Sat, 25 Oct 2025 11:54:59 -0400
Message-ID: <20251025160905.3857885-68-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Hao Yao <hao.yao@intel.com>

[ Upstream commit c7df6f339af94689fdc433887f9fbb480bf8a4ed ]

The datasheet of ov08x40 doesn't match the hardware behavior.
0x3821[2] == 1 is the original state and 0 the horizontal flip enabled.

Signed-off-by: Hao Yao <hao.yao@intel.com>
Reviewed-by: Hans de Goede <hansg@kernel.org>
Tested-by: Hans de Goede <hansg@kernel.org> # ThinkPad X1 Carbon Gen 12 & Gen 13
Reviewed-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

- What it fixes: The horizontal flip (HFLIP) control polarity was wrong
  for the OV08X40 sensor. Hardware enables H-mirror when bit 2 of
  register 0x3821 is cleared, but the driver treated setting the bit as
  “flip on”. The fix inverts this polarity so V4L2_CID_HFLIP now matches
  actual hardware behavior.
- Precise change: In `ov08x40_set_ctrl_hflip()`, the write toggling
  `OV08X40_REG_MIRROR` bit 2 is flipped:
  - Before: `ctrl_val ? val | BIT(2) : val & ~BIT(2)`
  - After: `ctrl_val ? val & ~BIT(2) : val | BIT(2)`
  - Location: drivers/media/i2c/ov08x40.c:1651
- Scope and containment:
  - Only one line in a single driver file is changed:
    `drivers/media/i2c/ov08x40.c`.
  - The function reads the current register value first and only changes
    bit 2, preserving other bits (drivers/media/i2c/ov08x40.c:1646,
    1651).
  - Vertical flip handling remains unchanged and continues to set bit 2
    of 0x3820 when enabled (drivers/media/i2c/ov08x40.c:1666), showing
    the change is isolated to HFLIP.
  - The HFLIP control is wired through the standard control path
    (`ov08x40_set_ctrl()` case V4L2_CID_HFLIP →
    `ov08x40_set_ctrl_hflip()`, drivers/media/i2c/ov08x40.c:1735) and
    HFLIP is created as a standard V4L2 control
    (drivers/media/i2c/ov08x40.c:2153).
- User impact: Without this fix, user-space sees inverted behavior for
  HFLIP (enabling the control does not produce the expected mirror),
  which is a clear functional bug affecting image orientation and any
  applications relying on correct orientation metadata/control.
- Risk assessment:
  - Minimal risk: a single-bit polarity correction in a register write,
    no ABI/API change, no architectural changes, and constrained to the
    ov08x40 driver.
  - Safe behavior: other bits are preserved; change is applied only when
    the device is powered/streaming via existing PM checks.
  - Real-world validation: Reviewed and Tested-by are present, including
    testing on ThinkPad X1 Carbon Gen 12/13, which reduces regression
    risk.

This is a small, targeted, and user-visible bugfix that aligns with
stable backporting rules and should be backported.

 drivers/media/i2c/ov08x40.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c
index e0094305ca2ab..90887fc54fb0e 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -1648,7 +1648,7 @@ static int ov08x40_set_ctrl_hflip(struct ov08x40 *ov08x, u32 ctrl_val)
 
 	return ov08x40_write_reg(ov08x, OV08X40_REG_MIRROR,
 				 OV08X40_REG_VALUE_08BIT,
-				 ctrl_val ? val | BIT(2) : val & ~BIT(2));
+				 ctrl_val ? val & ~BIT(2) : val | BIT(2));
 }
 
 static int ov08x40_set_ctrl_vflip(struct ov08x40 *ov08x, u32 ctrl_val)
-- 
2.51.0


