Return-Path: <linux-media+bounces-57272-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAnoIiegxmnrMQUAu9opvQ
	(envelope-from <linux-media+bounces-57272-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:20:07 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3FC3469D3
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 16:20:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6456A3037452
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2026 15:16:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 801CC322768;
	Fri, 27 Mar 2026 15:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NczD2fvs"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9F4E55A;
	Fri, 27 Mar 2026 15:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624569; cv=none; b=PKF4rCO5KBMt2fW1FrwrgQq7qhJGm2aL91n153APGouwyBXv5Dv5+z7l15W7sTTfRQzjhxLGSl4EMsF1NFjpc1ITGpXEB+ziEcREw+jwu5XJFDvvb6dkiC2P99WXGFzj8zOXlEyCcAPW1/Wd7tZVx7z3kbvPK0U3fb3NCiJWqg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624569; c=relaxed/simple;
	bh=GklGLwJruxxCBqdiF2yNlz/pCwjKi6IpbWoG97hl45U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=blB2TnR51FWLbSwmVvzvyy0Vxb7QkDPeNizjLgTOSSdTN+wG7pWSxleIjDCp7dL2dJYTuF1WSsXJBtRVCUpAaB+5HJvM1Cps472Vb2OeK/xng55e+DP5EIbAoXY8S4LhxsIPLlZXN0Wacxq77NBqTUUhA1AJJoNNt4kGUmle2Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NczD2fvs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1774624564;
	bh=GklGLwJruxxCBqdiF2yNlz/pCwjKi6IpbWoG97hl45U=;
	h=From:Subject:Date:To:Cc:From;
	b=NczD2fvsNvnPYKVl+HB0VESISWa5CSibbFLoh6UlXu3EChWSs1GQm3Sci17xbRMg7
	 cjK4CShwTzoHL+92HAp0lODxLULkNrmY2rxRbf6RKfXc66nZHaRKr6WQKXXyjydjke
	 WJ+jDWseoArnDRt5MQGnHQwbBXXMM3BMYcUrTli7Oi3sO/cptkgJaOcUCXtvuzCaWt
	 eNZ05UnqSOl1Fxu/m4toBSCDkGMZ9Ei7Y7MMksuuoK+qovWVpjwqD4HuC29g6x1Krc
	 ThpnmO7eqCXhOPOY8r9QbSiY9EikUHH4E7Kb6R121MHJ2u8UPBkde+vFtDmyaBU5DR
	 aMUIAWX9uNyEg==
Received: from [192.168.0.15] (modemcable014.2-22-96.mc.videotron.ca [96.22.2.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A059017E58B9;
	Fri, 27 Mar 2026 16:16:02 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
Subject: [PATCH 0/4] media: rkvdec: Switch to using a bitwriter
Date: Fri, 27 Mar 2026 11:15:59 -0400
Message-Id: <20260327-rkvdec-use-bitwriter-v1-0-982cf872b590@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdOEDQPRVyEcXNdpNUHTDjQhv
 LsTjt/h/1cwVmGDS7WC8iImr6nA1RXQ/TrdGCUWg29817S+R30ukQlnYwySPyqZFZOL7nQOLaW
 eoKRv5STffTuMh20OD6b8f8G2/QB+N5kQeAAAAA==
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
	TAGGED_FROM(0.00)[bounces-57272-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[vanguardiasur.com.ar,kernel.org,sntech.de,gmail.com,google.com,kwiboo.se,collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[detlev.casanova@collabora.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:dkim,collabora.com:email,collabora.com:mid,yhbt.net:url]
X-Rspamd-Queue-Id: EB3FC3469D3
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
Detlev Casanova (4):
      media: rkvdec: Introduce a global bitwriter helper
      media: rkvdec: Use the global bitwriter instead of local one
      media: rkvdec: common: Drop bitfields for the bitwriter
      media: rkvdec: vdpu383: Drop bitfields for the bitwriter

 drivers/media/platform/rockchip/rkvdec/Makefile    |   1 +
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.c    |  30 ++
 .../platform/rockchip/rkvdec/rkvdec-bitwriter.h    |  25 +
 .../platform/rockchip/rkvdec/rkvdec-h264-common.c  |  51 +--
 .../platform/rockchip/rkvdec/rkvdec-h264-common.h  |  40 +-
 .../media/platform/rockchip/rkvdec/rkvdec-h264.c   | 109 ++---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.c  |  92 +---
 .../platform/rockchip/rkvdec/rkvdec-hevc-common.h  |  57 +--
 .../media/platform/rockchip/rkvdec/rkvdec-hevc.c   | 171 +++----
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-h264.c | 351 ++++++--------
 .../platform/rockchip/rkvdec/rkvdec-vdpu383-hevc.c | 502 +++++++++------------
 11 files changed, 578 insertions(+), 851 deletions(-)
---
base-commit: bbeb83d3182abe0d245318e274e8531e5dd7a948
change-id: 20260327-rkvdec-use-bitwriter-f1d149b3cf7c

Best regards,
--  
Detlev Casanova <detlev.casanova@collabora.com>


