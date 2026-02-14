Return-Path: <linux-media+bounces-52788-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAnoFMDJj2nMTgEAu9opvQ
	(envelope-from <linux-media+bounces-52788-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:02:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B8D13A3EF
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 02:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 02A37301F7B6
	for <lists+linux-media@lfdr.de>; Sat, 14 Feb 2026 01:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 823C01DDA18;
	Sat, 14 Feb 2026 01:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoDQrvxR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9AEA3EBF2C;
	Sat, 14 Feb 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771030968; cv=none; b=Esy4nXOqErLpAev6DzGYDkIfYaRHLAV6L1cWSCWjkyRBcW9nqGTp482IMXvjo3Isb/ssAh3HuL+CmsTNhwcLd/SIJIj91TXpfIEpLR3VKqp0tiehFZRUzErHBNgYatdMzcHvGcjCtTZ5i7aYYztYGbgD1oezjyFefGuklWr/Ecg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771030968; c=relaxed/simple;
	bh=UePWfbBxgT7I3H7m3efoMmny1MCBrzsMkljxq39MG+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=o7ezbsZUm6IoghiB5xpB2+Trk9vmX2OG4CP4R4og313PoZ/+rx3RRUtMzQYD01PuKZVh3hMw5JLVSxskp0SNygAz+YuOVXHmp6uHjX0JIUls8dkmfBNXflIWtGgksQzINRo1D73ENkQo0kCqpMuawxv7cCJkY/KYvYwrdV6ySpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoDQrvxR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE4CC116C6;
	Sat, 14 Feb 2026 01:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771030967;
	bh=UePWfbBxgT7I3H7m3efoMmny1MCBrzsMkljxq39MG+8=;
	h=From:To:Cc:Subject:Date:From;
	b=VoDQrvxRxIPXIqF379p3ekn1CgqfqdSFbkoV2ss+HNVqRh9ioOu7DOlEffIGyZS2a
	 5y6icfR6IrBl59gV5ya02eK7f/nuUuiU0r211BrfuDqVwb8L8Y1f/EGPBYxgypMPqI
	 TyGTgq6IdSDKgcHh8MnBrAfFjPVJrEoclBCJF8WC3L7bbcpeKfjuUUarKL3lUsitZR
	 87gr2vopQU6fD65E3W3flvJIYwN+PpFxPVutUqrAomkPSX9iIe5xj4DxNKCamfaFWS
	 Sl9iSF5PXYhZ1u9eC5gpt2Ph9Mce+cauTcEsHFJXgmLVXxuGQpBTKxLRdw2lBeye9T
	 qhCUNdpHT0FyQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.12] media: ipu6: Close firmware streams on streaming enable failure
Date: Fri, 13 Feb 2026 19:58:01 -0500
Message-ID: <20260214010245.3671907-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
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
	TAGGED_FROM(0.00)[bounces-52788-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 13B8D13A3EF
X-Rspamd-Action: no action

From: Sakari Ailus <sakari.ailus@linux.intel.com>

[ Upstream commit 5925a92cc70d10c7d3124923c36da09b9c1a6eeb ]

When enabling streaming fails, the stream is stopped in firmware but not
closed. Do this to release resources on firmware side.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
Tested-by: Mehdi Djait <mehdi.djait@linux.intel.com> # Dell XPS 9315
Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### Commit Message Analysis

The commit message is clear and directly describes a bug fix: when
streaming enable fails, the firmware stream is stopped but not closed,
leading to a resource leak on the firmware side. The fix adds a
`close_streaming_firmware(av)` call in the error path.

Key signals:
- "Close firmware streams on streaming enable failure" — error path fix
- "release resources on firmware side" — resource leak fix
- Has **Reviewed-by** from two people (Bingbu Cao, Mehdi Djait)
- Has **Tested-by** on real hardware (Dell XPS 9315)
- Reviewed by subsystem maintainer (Hans Verkuil)

### Code Change Analysis

The change is a **single line addition**:

```c
out_media_entity_stop_streaming_firmware:
        stop_streaming_firmware(av);
+       close_streaming_firmware(av);

        return ret;
```

This is in the error path (`goto
out_media_entity_stop_streaming_firmware`) that handles the case where
`v4l2_subdev_enable_streams()` fails. The existing code already called
`stop_streaming_firmware(av)` to stop the stream, but neglected to call
`close_streaming_firmware(av)` to release the firmware resources.

This is a classic **resource leak on error path** — one of the most
common and important bug fix patterns for stable backports. The firmware
stream is opened and stopped but never closed, which means firmware-side
resources are leaked every time streaming enable fails.

### Classification

- **Bug type**: Resource leak (firmware resources not released on error
  path)
- **Pattern**: Missing cleanup call in error handler — a textbook error
  path fix
- **Not a feature addition**: Just completing the error handling that
  should have been there

### Scope and Risk Assessment

- **Lines changed**: 1 line added
- **Files changed**: 1 file
- **Risk**: Extremely low — adding a missing cleanup call in an error
  path
- **Subsystem**: Intel IPU6 camera driver (media subsystem)
- The fix follows the obvious pattern: the normal shutdown path
  presumably calls both `stop_streaming_firmware()` and
  `close_streaming_firmware()`, so the error path should too

### User Impact

- Affects users with Intel IPU6 camera hardware (common in modern Intel
  laptops)
- Without this fix, firmware resources leak when streaming setup fails,
  which could lead to the camera becoming unusable until reboot
- Tested on Dell XPS 9315 — a popular laptop model

### Stability Indicators

- Reviewed by two developers
- Tested on real hardware
- Single-line, obviously correct fix
- No risk of regression — only adds cleanup that was missing

### Dependency Check

The fix is self-contained. It only adds a call to
`close_streaming_firmware()` which already exists in the codebase. The
IPU6 driver was added in the 6.8 timeframe, so this would be relevant
for stable trees that include the IPU6 driver.

### Conclusion

This is a textbook stable backport candidate:
1. **Obviously correct**: The error path stops streaming but doesn't
   close it — the fix adds the missing close call
2. **Fixes a real bug**: Firmware resource leak on error path
3. **Small and contained**: Single line addition
4. **No new features**: Just completing error handling
5. **Well-reviewed and tested**: Multiple reviews and hardware testing
6. **Low risk**: Cannot introduce regression — only affects an error
   path by adding necessary cleanup

**YES**

 drivers/media/pci/intel/ipu6/ipu6-isys-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
index dec8f5ffcfa5f..919b77107cef7 100644
--- a/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
+++ b/drivers/media/pci/intel/ipu6/ipu6-isys-video.c
@@ -1066,6 +1066,7 @@ int ipu6_isys_video_set_streaming(struct ipu6_isys_video *av, int state,
 
 out_media_entity_stop_streaming_firmware:
 	stop_streaming_firmware(av);
+	close_streaming_firmware(av);
 
 	return ret;
 }
-- 
2.51.0


