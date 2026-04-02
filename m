Return-Path: <linux-media+bounces-57967-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFdBO7p4zmmMnwYAu9opvQ
	(envelope-from <linux-media+bounces-57967-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:10:02 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ECB38A41D
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 16:10:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87EBA302F0F9
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 14:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9E03E63A8;
	Thu,  2 Apr 2026 14:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LFogEVTI"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7163AC0FB;
	Thu,  2 Apr 2026 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775138814; cv=none; b=X+Zc+B+vCkHtO7htGIl2YrRR9q2Zt5w7vKnqxQ4ZWDH5ZP+FCOZny0Vg7wQGxwT99grljAoY9vBBHB3gLKgMD1Uz7b9YS0SyeD1aL4o/kk1U1XBMut+k5wwkF06BnEFmneRjPPtSBaD3K9q4enFF4nb835ACeNK6D8HJuKUAGig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775138814; c=relaxed/simple;
	bh=QK06DeIrGJLo+skpQxZiMaOTbSFroKiAVBO1zjQLL8s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J3eovSHSz85d96bBwskJCYc52k02Q7KJLSCq2v104YrQrO2fZ/zyOlVTaevTlC7PBxYBlrrIbo1fit1geVdaDTd5QDjlKih0H87xQ2h57ZL0Mn1QvmRQd+hdYyrNT7zZzOyB4efiWOP5cL9Tkfxjom5Uf/LH+EFIOJI+X4tp7Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LFogEVTI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1775138810;
	bh=QK06DeIrGJLo+skpQxZiMaOTbSFroKiAVBO1zjQLL8s=;
	h=From:Subject:Date:To:Cc:From;
	b=LFogEVTIizHA9dz8cc7MtMaY27t1BL8kIFa3b2Dah2VYrBHqYyeWwlhC9njLL/YwN
	 CYzUAxIrgSTmwkSLCGwmJvhnrgiIXEs4hFf4M/8lVRe3B+k4XR5whz0A9QX4gDvr7F
	 /VfWhjLBiZSyw4eU6pslcWytUeG7/GW92jdigFhln/PQyLhlfY46zvoSAE7TLFuWYy
	 h5okdLGQdiXV2Derhst7wleIeWhSHR8k0WB6e39hs6r9O8hbD2qoM0dCQlRzzCBxjf
	 eqoO+YzAzGvbRKp5gIolZYwnQQNGhA28QYAaLMSBFN6gklMqwORefb7AZbwCnnGFre
	 PVs9V1yfe8MQQ==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 71C5D17E7827;
	Thu,  2 Apr 2026 16:06:48 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH v3 0/4] media: rkvdec: Switch to using a bitwriter
Date: Thu, 02 Apr 2026 10:06:35 -0400
Message-Id: <20260402-rkvdec-use-bitwriter-v3-0-2072474ceaf4@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ7CIBQFr9KwFgO02NaV9zAugH4sWosBipqmd
 xfqzo0uJ3lvZkYenAGP9sWMHETjjR0TlJsCqV6MZ8CmS4wYYTtSshq7a+xA4ckDliY8nAngsKY
 drVpZKl0rlK53B9o8V+3x9GE/yQuokF150RsfrHut3Ujz7kciUkxw2zClm5pJ3pKDssMgpHViq
 +wN5Uxk/4hYEgkuqppXknDafIuWZXkD4F6jABcBAAA=
X-Change-ID: 20260327-rkvdec-use-bitwriter-f1d149b3cf7c
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Jonas Karlman <jonas@kwiboo.se>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 llvm@lists.linux.dev, kernel@collabora.com, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.0
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57967-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,kwiboo.se,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]
X-Rspamd-Queue-Id: 43ECB38A41D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Using bitfields in large structures where fields are mostly unaligned can
be hard on the compiler.

Issues have been reported with clang ([1], [2]) and, even though those
issues are addressed by clang devs, some setup can't or won't update clang
just to compile a driver.

Even when fixed, the compiler still might have to allocate a bigger stack
frame to manage misalignement. Coupled with other features like KASAN, the
stack becomes larger than the kernel's maximum [3].

To avoid this, let's drop the bitfield implementation and switch to a
bitwriter. There is already one for the older variants, so make it global
and use it in other variants.

Note that only buffer structures are switched to the bitwriter. The
registers representation structures are kept with bitfields, as they are
properly aligned every 32 bits and don't require heavy stack overhead.

Also note that the VDPU381 SPS and PPS structs are kept with bitfields,
for the same reason that they are small and aligned enough not to require
heavy stack overhead.

[1]: https://lore.kernel.org/oe-kbuild-all/202601211924.rqKS2Ihm-lkp@intel.com/
[2]: https://github.com/llvm/llvm-project/issues/178535
[3]: https://yhbt.net/lore/llvm/20260121230406.GA2625738@ax162/T/#mad878ec24a8224e1387ef5e73cb77b9ada55e3f2

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
Changes in v3:
- Change bitwriter function to static inline instead of its own object
- Link to v2: https://patch.msgid.link/20260327-rkvdec-use-bitwriter-v2-0-a5a4754b0518@collabora.com

Changes in v2:
- Don't use BW_FIELD to compute buffer size
- Use correct size for buffers
- Fix missed indentation issues
- Link to v1: https://patch.msgid.link/20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com

---
Detlev Casanova (4):
      media: rkvdec: Introduce a global bitwriter helper
      media: rkvdec: Use the global bitwriter instead of local one
      media: rkvdec: common: Drop bitfields for the bitwriter
      media: rkvdec: vdpu383: Drop bitfields for the bitwriter

 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    |  39 ++
 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  |  51 +--
 .../platform/rockchip/rkvdec/rkvdec-h264-common.h  |  40 +-
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 109 ++---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  |  93 +---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h  |  57 +--
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 171 +++----
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 351 ++++++--------
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 502 +++++++++------------
 9 files changed, 562 insertions(+), 851 deletions(-)
---
base-commit: d0c3bcd5b8976159d835a897254048e078f447e6
change-id: 20260327-rkvdec-use-bitwriter-f1d149b3cf7c

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


