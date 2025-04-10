Return-Path: <linux-media+bounces-29982-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2CDA84D90
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 21:53:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6B3C4C44E3
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 19:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7F5290BBD;
	Thu, 10 Apr 2025 19:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="unbyFn9i"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA7D20370A;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744314798; cv=none; b=pedmnKQqH6EU5cKr9kIwa8VFTkPfZByMtpaetlDmnLrCdv/ZwmOt5BQ5iu/ES29Inq0jg7a2ogzFyrVjMingYvlTcVg+hMkn7Kqw4TpD3LHxm+UMSm44Vuzx7zBh0qaMwcJh4eY48tdoHrfD/x5+Zke32vMO8A4LW3w05y1fBW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744314798; c=relaxed/simple;
	bh=n6EutrSAcLmews9PDUwMk28zAr+0O6rZ5fDlpjDG8tk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXI8K+I1gtdjox1tKjrtg1F35oc8TLXESTMwModgmD0yH2LTLJtCUF2hvDvmbKx5ivvFNcdB/lsxmUIQePR8ygAYTZg9Nh9tf7r3aWr9iXk1fcqBrvcJiubI659DFNijiVmUR448HeICZi+b16HQLI8uyCGFvmvU+nfOJFLKRzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=unbyFn9i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B7C1C4CEEA;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744314797;
	bh=n6EutrSAcLmews9PDUwMk28zAr+0O6rZ5fDlpjDG8tk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=unbyFn9iSrcrZKSGQI7M/gHNolrfCvB/gKXIuyB7g9qqt+HMQCt441frDxTd5C9gF
	 5JIdRV70y4VLa/metLJ44gAbSBWB8TR2GCxBT9fWeJ3u1z8bKETpWnq7/Qy6pqC+5z
	 Bx1vd0x+o0qUNgMEd4rI1zYRft5j6NxqK4ssvglr/FvZ3GkL2pDcvZsJQQ/TafHYHI
	 Y+Iswsw1sD4miSul3uFNYLrVMxeNKZlR7UbPNWIfoL1Y77ODT/cbuEs6r2/k+T1f7o
	 bxXTt8SVfU8Xq6gNDzYtGm/9kRSscvjoX/wxs1jMWEEOm1TXyv9sTPZSCCTNd/8sb3
	 QMpyAprMvbj0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6ACC369AA;
	Thu, 10 Apr 2025 19:53:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Thu, 10 Apr 2025 21:41:31 +0200
Subject: [PATCH 2/3] mailmap: add entry for Michael Riesch
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250410-maintainer-mriesch-v1-2-cdc5c6c68238@collabora.com>
References: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
In-Reply-To: <20250410-maintainer-mriesch-v1-0-cdc5c6c68238@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Collabora Kernel Team <kernel@collabora.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744314121; l=816;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=6Z5/XbKtYyNw6Q2JmOIgsQpgVRAR7KrwvnW77vAfPY0=;
 b=+xT/vkZbiIRlR5HS/yuc5G0rEJT8CwSd141Q5F+xqGL9Va+EA2uYQx4fQOIcSUWzWaTbroLdG
 eRgsgFxspcIC8IrKzP/Mmmw0zDMtj2v9kCtqxzrhteyNZaqqiJ+ZDuN
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com

From: Michael Riesch <michael.riesch@collabora.com>

After five interesting years, I left WolfVision and started to work for
Collabora. Add a corresponding mailmap entry.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 4f7cd8e23177..59f99aa83185 100644
--- a/.mailmap
+++ b/.mailmap
@@ -503,6 +503,7 @@ Mayuresh Janorkar <mayur@ti.com>
 Md Sadre Alam <quic_mdalam@quicinc.com> <mdalam@codeaurora.org>
 Miaoqing Pan <quic_miaoqing@quicinc.com> <miaoqing@codeaurora.org>
 Michael Buesch <m@bues.ch>
+Michael Riesch <michael.riesch@collabora.com> <michael.riesch@wolfvision.net>
 Michal Simek <michal.simek@amd.com> <michal.simek@xilinx.com>
 Michel Dänzer <michel@tungstengraphics.com>
 Michel Lespinasse <michel@lespinasse.org>

-- 
2.39.5



