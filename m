Return-Path: <linux-media+bounces-45555-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC3AC098DE
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 18:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3080B3B9699
	for <lists+linux-media@lfdr.de>; Sat, 25 Oct 2025 16:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66FAD311C15;
	Sat, 25 Oct 2025 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ml1TvMr/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81893115A2;
	Sat, 25 Oct 2025 16:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761409359; cv=none; b=CpCgLzzrCQTAKciLSIYLLV/R6DqMF68EW+Sb9GVu48oc0R52AxOZEe9Cs7Nrv7QIdUyySMu7ZJBWxQC2Rpi6eugTqke9MkaqnFBvVhNf1a2iqzCY58NjEtL/Ly7INjnT40tMOArGKAHQWaJ2nKVcW7XNtP9xTp/pPETBPvcokjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761409359; c=relaxed/simple;
	bh=T/lUPF+jQAYapvq1yq3yPZMTnsR3bYbAGTI6ratv5aY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dAZxc+H5VlCTUS7Vj1kA7aFC4Hwx82L6SKu8c8FyX98RrxM9kf5l6bLTRlzJpcS9lfn3q+bwIkPfrEx9xxas7MUY1Wkga6fWhjYmzrbQ6Z9Iaty7txd8J7/QwCQK9g9nzdBfxSqKETk4ANQcGx2JqzwrTm77EKX/eEMSb2z9BB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ml1TvMr/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823B0C4CEFB;
	Sat, 25 Oct 2025 16:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761409359;
	bh=T/lUPF+jQAYapvq1yq3yPZMTnsR3bYbAGTI6ratv5aY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ml1TvMr/BoFWBCEzAuJGJBgnzVOysDJrB22Lj2Pref4oni9nIB2JtF9rF1x5z2Gtu
	 1nnZE1I6kObtGWTQLU+uIRQ4O/GI+kCZPVT4E0AxzylgTIm65YtGzknFdMSV9FXrCB
	 O+YoJLscC+a05u8W6NgT32qauVEMQ2Q60POoy8t0sGFyg45y9Ut5kDoJ65Yj9A4md/
	 6shnIgdgUrTEwQq4Z84pyp0XCcSX9uZU8UUt03QGK0LqF+lzmAsfQBG4ffj4rfsmw6
	 fSQPxQ1Q1Oq9bxyWwtsQa+jnCo/6bNuhPBb98pnhVzcL5UD2tXuC6Y77X+ud1hPhB3
	 5lD4xHU3FFH9w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Sean Young <sean@mess.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.17-5.4] media: imon: make send_packet() more robust
Date: Sat, 25 Oct 2025 11:58:41 -0400
Message-ID: <20251025160905.3857885-290-sashal@kernel.org>
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

From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

[ Upstream commit eecd203ada43a4693ce6fdd3a58ae10c7819252c ]

syzbot is reporting that imon has three problems which result in
hung tasks due to forever holding device lock [1].

First problem is that when usb_rx_callback_intf0() once got -EPROTO error
after ictx->dev_present_intf0 became true, usb_rx_callback_intf0()
resubmits urb after printk(), and resubmitted urb causes
usb_rx_callback_intf0() to again get -EPROTO error. This results in
printk() flooding (RCU stalls).

Alan Stern commented [2] that

  In theory it's okay to resubmit _if_ the driver has a robust
  error-recovery scheme (such as giving up after some fixed limit on the
  number of errors or after some fixed time has elapsed, perhaps with a
  time delay to prevent a flood of errors).  Most drivers don't bother to
  do this; they simply give up right away.  This makes them more
  vulnerable to short-term noise interference during USB transfers, but in
  reality such interference is quite rare.  There's nothing really wrong
  with giving up right away.

but imon has a poor error-recovery scheme which just retries forever;
this behavior should be fixed.

Since I'm not sure whether it is safe for imon users to give up upon any
error code, this patch takes care of only union of error codes chosen from
modules in drivers/media/rc/ directory which handle -EPROTO error (i.e.
ir_toy, mceusb and igorplugusb).

Second problem is that when usb_rx_callback_intf0() once got -EPROTO error
before ictx->dev_present_intf0 becomes true, usb_rx_callback_intf0() always
resubmits urb due to commit 8791d63af0cf ("[media] imon: don't wedge
hardware after early callbacks"). Move the ictx->dev_present_intf0 test
introduced by commit 6f6b90c9231a ("[media] imon: don't parse scancodes
until intf configured") to immediately before imon_incoming_packet(), or
the first problem explained above happens without printk() flooding (i.e.
hung task).

Third problem is that when usb_rx_callback_intf0() is not called for some
reason (e.g. flaky hardware; the reproducer for this problem sometimes
prevents usb_rx_callback_intf0() from being called),
wait_for_completion_interruptible() in send_packet() never returns (i.e.
hung task). As a workaround for such situation, change send_packet() to
wait for completion with timeout of 10 seconds.

Link: https://syzkaller.appspot.com/bug?extid=592e2ab8775dbe0bf09a [1]
Link: https://lkml.kernel.org/r/d6da6709-d799-4be3-a695-850bddd6eb24@rowland.harvard.edu [2]
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Signed-off-by: Sean Young <sean@mess.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

This is a targeted robustness fix for the SoundGraph iMON IR/display USB
driver that addresses real-world hangs and RCU stalls reported by
syzbot, with small, contained changes limited to
`drivers/media/rc/imon.c`. It fits stable backport rules: fixes
important bugs, avoids features/architecture changes, and aligns error
handling with peer RC drivers.

Key fixes and rationale
- Stop infinite RX error loops (-EPROTO flood):
  - Current code resubmits the URB on all errors, which can loop
    endlessly on persistent USB errors such as -EPROTO, spamming logs
    and causing RCU stalls.
  - The patch handles specific transient/bus/pipe errors by logging and
    not resubmitting, breaking the error loop:
    - Adds early-return without resubmit on `-ECONNRESET`, `-EILSEQ`,
      `-EPROTO`, `-EPIPE` in both callbacks.
    - This mirrors other rc drivers’ behavior (see below).
  - Code reference (pre-change): `drivers/media/rc/imon.c:1757` shows an
    unconditional “resubmit on error” path via `goto out` and
    fallthrough to `usb_submit_urb()`, with “ignored” logging in
    `default:` (e.g. `drivers/media/rc/imon.c:1765` onward for intf0;
    similar for intf1 at `drivers/media/rc/imon.c:1806`).
- Fix early-callback behavior before interface is configured:
  - Previously, if an early callback happened before
    `dev_present_intf{0,1}` was set, the code always resubmitted (due to
    the pre-switch `if (!dev_present) goto out;`), which can contribute
    to error loops without even processing packets.
  - The patch moves the `dev_present_intf{0,1}` check into the `case 0:`
    (success) branch so that only valid data is processed, while error
    handling goes through the new non-resubmit paths. This prevents
    unnecessary requeueing during pre-configured phases and avoids
    wedging/hung tasks without printk flood.
  - Code reference (pre-change): the pre-switch gating at
    `drivers/media/rc/imon.c:1757-1764` (intf0) and
    `drivers/media/rc/imon.c:1798-1805` (intf1) causes unconditional
    resubmit on any pre-configured callback.
- Prevent indefinite TX wait (hung tasks):
  - Currently `send_packet()` waits indefinitely for the TX completion
    and only wakes on interrupt, hanging if the TX callback never
    arrives (e.g., flaky hardware).
  - The patch changes the wait to
    `wait_for_completion_interruptible_timeout()` with a 10s timeout,
    kills the URB on timeout, and sets a sensible error status
    (-ETIMEDOUT on timeout, or the negative retval on signal), then
    reports failure.
  - Code reference (pre-change): `drivers/media/rc/imon.c:653-659` uses
    `wait_for_completion_interruptible(&ictx->tx.finished)` with no
    timeout. The patch replaces this with a 10*HZ timeout and sets
    `ictx->tx.status` appropriately after `usb_kill_urb()`.

Consistency with other rc drivers
- This driver’s new error handling aligns with other `drivers/media/rc/`
  drivers which do not resubmit on transient/bus errors:
  - `mceusb`: avoids resubmit for `-ECONNRESET`, `-ENOENT`, `-EILSEQ`,
    `-EPROTO`, `-ESHUTDOWN` in RX (drivers/media/rc/mceusb.c:1360).
  - `igorplugusb`: returns without resubmit on `-EPROTO`, `-ECONNRESET`,
    `-ENOENT`, `-ESHUTDOWN` (drivers/media/rc/igorplugusb.c:100).
  - `ir_toy`: returns/unlinks on `-ECONNRESET`, `-ENOENT`, `-ESHUTDOWN`,
    `-EPROTO`, `-EPIPE` (drivers/media/rc/ir_toy.c:212).

Scope and risk assessment
- Small, self-contained changes in a single driver file; no ABI/API
  changes; no architectural shifts.
- Fixes reproducible hangs and RCU stalls (syzbot report), clearly
  improving stability.
- Behavior trade-off (not resubmitting on certain USB errors) matches
  established patterns in similar drivers, reducing regression risk.
- Interaction with earlier imon commits:
  - 6f6b90c9231a “[media] imon: don't parse scancodes until intf
    configured” introduced early-return gating using `dev_present_*`.
  - 8791d63af0cf “[media] imon: don't wedge hardware after early
    callbacks” ensured resubmit even before configuration.
  - This patch refines both behaviors: only resubmit when it makes sense
    (successful RX or non-specified errors), and bound TX wait time.

Why this belongs in stable
- Fixes real bugs affecting users (hung tasks, potential RCU
  stall/flooded logs).
- Minimal and surgical per-driver changes; no new features.
- Matches stable policy and conventions across related drivers.
- Signed by subsystem maintainers (Sean Young, Hans Verkuil), indicating
  maintainership approval.

Conclusion
- Backporting this commit will prevent hangs and error floods in `imon`
  with low risk and improve robustness without altering kernel-wide
  behavior.

 drivers/media/rc/imon.c | 61 +++++++++++++++++++++++++----------------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index cf3e6e43c0c7e..8668d53c0d426 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -650,12 +650,15 @@ static int send_packet(struct imon_context *ictx)
 		smp_rmb(); /* ensure later readers know we're not busy */
 		pr_err_ratelimited("error submitting urb(%d)\n", retval);
 	} else {
-		/* Wait for transmission to complete (or abort) */
-		retval = wait_for_completion_interruptible(
-				&ictx->tx.finished);
-		if (retval) {
+		/* Wait for transmission to complete (or abort or timeout) */
+		retval = wait_for_completion_interruptible_timeout(&ictx->tx.finished, 10 * HZ);
+		if (retval <= 0) {
 			usb_kill_urb(ictx->tx_urb);
 			pr_err_ratelimited("task interrupted\n");
+			if (retval < 0)
+				ictx->tx.status = retval;
+			else
+				ictx->tx.status = -ETIMEDOUT;
 		}
 
 		ictx->tx.busy = false;
@@ -1754,14 +1757,6 @@ static void usb_rx_callback_intf0(struct urb *urb)
 	if (!ictx)
 		return;
 
-	/*
-	 * if we get a callback before we're done configuring the hardware, we
-	 * can't yet process the data, as there's nowhere to send it, but we
-	 * still need to submit a new rx URB to avoid wedging the hardware
-	 */
-	if (!ictx->dev_present_intf0)
-		goto out;
-
 	switch (urb->status) {
 	case -ENOENT:		/* usbcore unlink successful! */
 		return;
@@ -1770,16 +1765,29 @@ static void usb_rx_callback_intf0(struct urb *urb)
 		break;
 
 	case 0:
-		imon_incoming_packet(ictx, urb, intfnum);
+		/*
+		 * if we get a callback before we're done configuring the hardware, we
+		 * can't yet process the data, as there's nowhere to send it, but we
+		 * still need to submit a new rx URB to avoid wedging the hardware
+		 */
+		if (ictx->dev_present_intf0)
+			imon_incoming_packet(ictx, urb, intfnum);
 		break;
 
+	case -ECONNRESET:
+	case -EILSEQ:
+	case -EPROTO:
+	case -EPIPE:
+		dev_warn(ictx->dev, "imon %s: status(%d)\n",
+			 __func__, urb->status);
+		return;
+
 	default:
 		dev_warn(ictx->dev, "imon %s: status(%d): ignored\n",
 			 __func__, urb->status);
 		break;
 	}
 
-out:
 	usb_submit_urb(ictx->rx_urb_intf0, GFP_ATOMIC);
 }
 
@@ -1795,14 +1803,6 @@ static void usb_rx_callback_intf1(struct urb *urb)
 	if (!ictx)
 		return;
 
-	/*
-	 * if we get a callback before we're done configuring the hardware, we
-	 * can't yet process the data, as there's nowhere to send it, but we
-	 * still need to submit a new rx URB to avoid wedging the hardware
-	 */
-	if (!ictx->dev_present_intf1)
-		goto out;
-
 	switch (urb->status) {
 	case -ENOENT:		/* usbcore unlink successful! */
 		return;
@@ -1811,16 +1811,29 @@ static void usb_rx_callback_intf1(struct urb *urb)
 		break;
 
 	case 0:
-		imon_incoming_packet(ictx, urb, intfnum);
+		/*
+		 * if we get a callback before we're done configuring the hardware, we
+		 * can't yet process the data, as there's nowhere to send it, but we
+		 * still need to submit a new rx URB to avoid wedging the hardware
+		 */
+		if (ictx->dev_present_intf1)
+			imon_incoming_packet(ictx, urb, intfnum);
 		break;
 
+	case -ECONNRESET:
+	case -EILSEQ:
+	case -EPROTO:
+	case -EPIPE:
+		dev_warn(ictx->dev, "imon %s: status(%d)\n",
+			 __func__, urb->status);
+		return;
+
 	default:
 		dev_warn(ictx->dev, "imon %s: status(%d): ignored\n",
 			 __func__, urb->status);
 		break;
 	}
 
-out:
 	usb_submit_urb(ictx->rx_urb_intf1, GFP_ATOMIC);
 }
 
-- 
2.51.0


