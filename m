Return-Path: <linux-media+bounces-62760-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WLhSKdFcFWp7UgcAu9opvQ
	(envelope-from <linux-media+bounces-62760-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:41:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3675D2939
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:41:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59707304020D
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FAA73CF04E;
	Tue, 26 May 2026 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c/frGZ90"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3AB3B9D9E;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784832; cv=none; b=bjFyJsjq/tLOVP4HzTgguqekUYL0OlpaWPH04IcfXqFJ1nC6o2Gd4aFNQWlZb0P/NvT/dShtU/1w4Poq/R0GVIsivb8BwwE7QJVTNgUoPSKy9V7Q773qL9y+Ncip65Eg+3+ZHwfXVlT37oOsGFwpqxIhOXV4I6SILCBY2jG4uHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784832; c=relaxed/simple;
	bh=S97JAUpv0NlzwMDGm7KcefiNCXWmBBgFYU4X8a5WTnY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y43tCTlAxLu2UY2DdZ5etlUI86X78dJrnxf6yJ6vLFUxfYbvhVm+uO193ceByepPEg+QDLJ3wU94LUrU9ZZZfUeiR4yHVVQYBya//rfNErYjvTWQgHFUJ7LPAphz0/3rB1SHuDB+upKqb22bDw6noKlCZs+sSlrmdoUjBcI1dxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c/frGZ90; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBAF0C2BCC7;
	Tue, 26 May 2026 08:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779784832;
	bh=S97JAUpv0NlzwMDGm7KcefiNCXWmBBgFYU4X8a5WTnY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=c/frGZ90qxS6VLTzZmvIvqiOfy2jhqWR/GX0ulrqmo4UZIkv7J/nMu1J+IZPHYz9X
	 EZDJKs3qEpVyTm+bOB1NgipRunavq8tYuJNVHrel62SyGS/IzP7O5I02DrVryjEcDh
	 Q4vq1+r0A/GjwyqiGjA/1ki2eJl/rAxJEQ59VqafmH3w2WRWtQbvxu/yFke2lZnw/M
	 b/nWgXDryxrnKgL/uRJVy3IztQTg9AtVRDz5UYOj/8MtYCCVXhz7XKAhj3PTxMKK9d
	 ebepU20F8DLykEWPGMeerTwxMBaTNGpCpnhExjrR7WOoGYIPapFySZHD9A3eeZj+ma
	 T0xeHiN/WSN6A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D662DCD5BC8;
	Tue, 26 May 2026 08:40:31 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Tue, 26 May 2026 16:40:17 +0800
Subject: [PATCH RFC RESEND v5 1/6] firmware: meson: sm: Add video firmware
 loading SMC call
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-b4-s4-vdec-upstream-v5-1-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779784828; l=701;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=EIbyEqiJ64VIutoxUMLEEjiZLuEMFFURkZoqXNKTANY=;
 b=NaLJku72FRu7wrITESuD13n4YTJvdOHqdM2dI7Xd+TcBlQMosaOOOV3obZfYTo7OPmWZwbubA
 036tRrLurx1CTOoTCNRPFJOSwR/ruyV+QIXpRkHl8d8WC3JwI/KBkK3
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62760-lists,linux-media=lfdr.de,zhentao.guo.amlogic.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,baylibre.com,googlemail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[zhentao.guo@amlogic.com]
X-Rspamd-Queue-Id: 4C3675D2939
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zhentao Guo <zhentao.guo@amlogic.com>

Add SM_LOAD_VIDEO_FW at SMC ID 0xb200000f in the command
table to load video firmware.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 drivers/firmware/meson/meson_sm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/meson/meson_sm.c b/drivers/firmware/meson/meson_sm.c
index 3ab67aaa9e5d..5da6c65d684a 100644
--- a/drivers/firmware/meson/meson_sm.c
+++ b/drivers/firmware/meson/meson_sm.c
@@ -47,6 +47,7 @@ static const struct meson_sm_chip gxbb_chip = {
 		CMD(SM_GET_CHIP_ID,	0x82000044),
 		CMD(SM_A1_PWRC_SET,	0x82000093),
 		CMD(SM_A1_PWRC_GET,	0x82000095),
+		CMD(SM_LOAD_VIDEO_FW,	0xb200000f),
 		{ /* sentinel */ },
 	},
 };

-- 
2.42.0



