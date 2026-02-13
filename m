Return-Path: <linux-media+bounces-52779-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD8sNC+Fj2mRRQEAu9opvQ
	(envelope-from <linux-media+bounces-52779-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:10:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD28139564
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:10:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2D515300C00C
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 20:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1D5127BF93;
	Fri, 13 Feb 2026 20:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSv/TQgT"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A5F21D3F3;
	Fri, 13 Feb 2026 20:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771013418; cv=none; b=UVEKcc4tKFAmj3f2vmLg9Ta//APG0+tBujuJFzYqVo+ge54Hbf/AZiYFrkkHQMcRxBq0gvWMRUnw72s2LFtqMGSi2A4rrZlxQcUEtGt+cBHAE6PqDxjzx5uAL6N5FatzOls0TRRtrHebp+io3VvBZyIc6HvMq3jOL3Klhqc4zyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771013418; c=relaxed/simple;
	bh=pVof8kYi5TBM1veFEGpbU5buAtwo0G0WsbuQoPnTTdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IPg0QBDQi4Ce3+rFMSqPU2Q21rbFIzeF6Li+FNF9tc9W/fO+Is8RkOeBvuNghb2aVDVwSlRHKzGAt1cN7d/bKkbAGhNl8v5dWpM5lG+dihk8PhxuJR6GTm9CTrYbDNMK1tG2BycsOuloGX6kI3/Aoql/meRHO4feEpItRjUbGeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSv/TQgT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 250C5C116C6;
	Fri, 13 Feb 2026 20:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771013417;
	bh=pVof8kYi5TBM1veFEGpbU5buAtwo0G0WsbuQoPnTTdA=;
	h=From:Date:Subject:To:Cc:From;
	b=bSv/TQgTtYNg04mDsZBq5U9hEOQkr09Dkl2lmbH+XIdU+VIOtPTDbBHo81pZqskpy
	 WI5TD4GknYX1uNu5WPjeNkRcFxeF+7p9SOgKBWhRIO6CR/jWiO8L8mPgt8/e4+w5DA
	 IoaspK03KkoRcfvmfPnF8WlUz8sdQbcgQYZ0mC61YikCC2/W708qlXSPctWv8qP7qY
	 8SdySELTd+eBxAebjL0OdGvC0w67974T2giFn4Pm80Bx0zd2al8kvCTuuxyYCw3cGX
	 k/4uslX7qFOxFXzhjxZhe6pMdVeBtLGTsNAnry90RYvOExggXdrc1Z1LLJ+gUiwSy+
	 D5lopHupfApsg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Fri, 13 Feb 2026 15:10:06 -0500
Subject: [PATCH] media: rockchip: Disable VIDEO_ROCKCHIP_VDEC when compile
 testing for Hexagon
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-media-disable-rockchip-vdec-hexagon-v1-1-3f903398cc83@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNyw6CMBBG4Vchs3YSqArRVzEs2ukvHS+FtEpIC
 O9u1eW3OWeljKTIdK5WSpg16xgLml1FEmwcwOqLydSmrU2z5ye8WvaarXuA0yh3CTrx7CEcsNh
 hjAzXdnLozMnIkUppSrjq8rtc+r/z290gr2+atu0D3JQphYcAAAA=
X-Change-ID: 20260213-media-disable-rockchip-vdec-hexagon-eb67c47292c5
To: Detlev Casanova <detlev.casanova@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: Brian Cain <bcain@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-hexagon@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1338; i=nathan@kernel.org;
 h=from:subject:message-id; bh=pVof8kYi5TBM1veFEGpbU5buAtwo0G0WsbuQoPnTTdA=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJn9rWrexu3C+xVWM38NO2R3ZN6a4ulBmfEX5/r+Vzr3Z
 u23iW+VOkpZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEoj0Y/odlaYq8zJlgdLyK
 9/WC7xdzCjNKBcU1DVPjpX9Ildiuf8zIcOv6vcv22SHzfnCzt7N+vl+58277upbbyUu2PQ3bfeR
 jJDsA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52779-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BBD28139564
X-Rspamd-Action: no action

Building rkvdec-vdpu383-h264.c can take a few hours to finish building
with Clang 20.1.0 or newer when compile testing for Hexagon. While this
is further investigated and understood on the LLVM side [1], disable
CONFIG_VIDEO_ROCKCHIP_VDEC when compile testing for Hexagon.

Link: https://github.com/llvm/llvm-project/issues/178535 [1]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/media/platform/rockchip/rkvdec/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/Kconfig b/drivers/media/platform/rockchip/rkvdec/Kconfig
index 5f3bdd848a2c..d03689464206 100644
--- a/drivers/media/platform/rockchip/rkvdec/Kconfig
+++ b/drivers/media/platform/rockchip/rkvdec/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 config VIDEO_ROCKCHIP_VDEC
 	tristate "Rockchip Video Decoder driver"
-	depends on ARCH_ROCKCHIP || COMPILE_TEST
+	# !HEXAGON: https://github.com/llvm/llvm-project/issues/178535
+	depends on ARCH_ROCKCHIP || (COMPILE_TEST && !HEXAGON)
 	depends on VIDEO_DEV
 	select MEDIA_CONTROLLER
 	select VIDEOBUF2_DMA_CONTIG

---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260213-media-disable-rockchip-vdec-hexagon-eb67c47292c5

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


