Return-Path: <linux-media+bounces-52798-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6AddIfPKj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52798-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:08:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBDF13A834
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 338C13025C64
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08A2226D00;
	Sat, 14 Feb 2026 01:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tOCeLwN1"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1448622259F;
	Sat, 14 Feb 2026 01:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771031100; cv=none; b=BKSvpI/fSsH9j7aNSIkcsiZ+RmV4GWML2Bdsi6Ntkc/ZROKctXLOF/AnnL36PwjMCZr8/11RLRuUNksQRSF6uSNAR65hZFeRM/h32NXFrhgmgsKM5XCKn693sDtw+CsXt7vs8W/5sdA7NG+d+G5Aix7aEyodrqGC6yq9UpG47kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771031100; c=relaxed/simple;
	bh=ub7yL4YAin4HwLZFyRul6lAEoj73udh0K9zLa7WpwQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gBCzDhuTEv6VTlJqEvVw71QVaa+M0l/ov8C+tzQlQQJ9TvX+QNvS8IWTymB0MjbSGnAymCvFDEfblADCmRzQ8Urt7yH+qO401AOhZmWgl+DPNDeQkEheLVFi+UyjbSGPqd1jMMKnE5OgI7duItS+N9V8eRnG04Edettw7/AtmdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tOCeLwN1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065A1C16AAE;
	Sat, 14 Feb 2026 01:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031099;
	bh=ub7yL4YAin4HwLZFyRul6lAEoj73udh0K9zLa7WpwQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tOCeLwN1xri63F34SRaijUHuDNF2fX33XHzJlR1HDv3AncRmUa6g63h78RHYHYpNU
	 amzZzbBNSiWeJksTO/QbsUKZk5BJsTND7ccmV/6c7f4kf0zJIe50NcME8tQ4aJ5knj
	 bX3xJAksniTASnB3MHMXZ/WgolgCsugxK+H3SYyvBov7QkWG/G01Fwk6ipzV3x6NnH
	 0Wcn2kW1+Web6MzBcw60gSU8td9XneZhj6DsRUKsKjwvIjFmIjZP8Un5aOw0fk+4d7
	 pYMr0Ws1VWK+9pJ0O9ETN2+pLOBqK1+jCy/xIp8rmdIvp3Pvs2FUvsvbMvny51LBND
	 4bkz6Eg0eXlEw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] media: ipu6: Always close firmware stream
Date: Fri, 13 Feb 2026 19:59:02 -0500
Message-ID: <20260214010245.3671907-62-sashal@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52798-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CBDF13A834
X-Rspamd-Action: no action

From: Sakari Ailus <sakari.ailus@linux.intel.com>

[ Upstream commit 2b08b7007e55bd1793a58478d3ecea4fd95849a5 ]

Close the firmware stream even when disabling a stream on an upstream
sub-device fails. This allows the firmware to release resources related to
a stream that is stopped in any case.

Suggested-by: Bingbu Cao <bingbu.cao@linux.intel.com>
Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis of commit: "media: ipu6: Always close firmware stream"

### 1. Commit Message Analysis

The commit message clearly states the intent: close the firmware stream
even when disabling a stream on an upstream sub-device fails. The
rationale is that the firmware needs to release resources related to a
stream that is being stopped regardless of whether the upstream sub-
device disable succeeded or not.

Key indicators:
- "Suggested-by: Bingbu Cao" — an Intel developer familiar with the IPU6
  hardware
- "Reviewed-by" from two reviewers (Bingbu Cao and Mehdi Djait)
- "Tested-by: Mehdi Djait" on actual hardware (Dell XPS 9315)
- Reviewed and merged by Hans Verkuil (V4L2 maintainer)

### 2. Code Change Analysis

The change is very small and surgical — it modifies a single error path
in `ipu6_isys_video_set_streaming()`:

**Before:** When `v4l2_subdev_disable_streams()` fails during stream-off
(`!state`), the function returns immediately with the error,
**skipping** the call to `close_streaming_firmware(av)`.

**After:** When `v4l2_subdev_disable_streams()` fails, the error is
still logged, but execution continues to `close_streaming_firmware(av)`,
ensuring firmware resources are always released.

The diff is just 4 lines changed:
- Removes the `{ return ret; }` block after the error
- Keeps the `dev_err()` logging
- Allows execution to fall through to `close_streaming_firmware(av)`

### 3. Bug Classification: Resource Leak

This is a **resource leak fix**. When `v4l2_subdev_disable_streams()`
fails:
- The stream is being stopped regardless (the user requested stream-off)
- The firmware has allocated resources for this stream
- Without `close_streaming_firmware()`, those firmware resources are
  leaked
- The firmware may not be able to start new streams afterward due to
  leaked resources

This is a classic "error path resource leak" pattern — on failure of one
step during teardown, other cleanup steps are skipped.

### 4. Scope and Risk Assessment

- **Size:** 4 lines changed in 1 file — minimal
- **Risk:** Very low. The change makes teardown more robust. Even if
  `v4l2_subdev_disable_streams()` fails, the stream is being stopped —
  closing the firmware stream is the correct thing to do. The firmware
  needs to know the stream is done.
- **Subsystem:** Intel IPU6 camera driver (media/pci/intel/ipu6/) — used
  on many modern Intel laptops
- **Could this break something?** No — the stream is being stopped in
  any case. Not closing firmware resources is always wrong in this path.

### 5. User Impact

- **Who is affected:** Users of Intel IPU6 cameras (common in modern
  laptops like Dell XPS, many Lenovo/HP models)
- **Symptoms without fix:** After a failed stream-off, firmware
  resources are leaked, potentially preventing future camera usage until
  reboot
- **Severity:** Medium — affects camera functionality, requires reboot
  to recover

### 6. Stability Indicators

- Reviewed by two developers, tested on real hardware
- Author (Sakari Ailus) is a well-known V4L2/media subsystem maintainer
- Merged by Hans Verkuil (another senior media maintainer)

### 7. Dependency Check

The change is self-contained. It only modifies error handling logic
within an existing function. No dependencies on other patches. The IPU6
driver exists in recent stable trees (it was added in the 6.6
timeframe).

### 8. Stable Criteria Evaluation

- **Obviously correct and tested:** Yes — reviewed by 2 people, tested
  on hardware
- **Fixes a real bug:** Yes — resource leak in firmware teardown path
- **Important issue:** Yes — can leave camera non-functional until
  reboot
- **Small and contained:** Yes — 4 lines in 1 file
- **No new features:** Correct — purely a bug fix
- **Applies cleanly:** The change is minimal and should apply cleanly

### Conclusion

This is a straightforward resource leak fix in the IPU6 camera driver.
The fix ensures firmware resources are always released during stream
teardown, even when an intermediate step fails. It's small, obviously
correct, well-reviewed, tested on real hardware, and fixes a real user-
visible problem (camera becoming non-functional after a stream error).
It meets all stable kernel criteria.

**YES**

 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index 919b77107cef7..54d861aca0088 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1036,11 +1036,10 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 			sd->name, r_pad->index, stream_mask);
 		ret = v4l2_subdev_disable_streams(sd, r_pad->index,
 						  stream_mask);
-		if (ret) {
+		if (ret)
 			dev_err(dev, "stream off %s failed with %d\n", sd->name,
 				ret);
-			return ret;
-		}
+
 		close_streaming_firmware(av);
 	} else {
 		ret = start_stream_firmware(av, bl);
-- 
2.51.0


