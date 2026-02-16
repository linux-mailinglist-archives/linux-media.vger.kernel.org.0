Return-Path: <linux-media+bounces-52869-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NsxJ6INk2nw1AEAu9opvQ
	(envelope-from <linux-media+bounces-52869-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:29:22 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB3914357D
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:29:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F0D8303207E
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B503430EF6F;
	Mon, 16 Feb 2026 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auiVmCFm"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294CA30E0C0;
	Mon, 16 Feb 2026 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244930; cv=none; b=b7OXB59wKUnPCz25DSOSLqMlKf0qtkeqGguyN5D1BJdmzsm8rtCenBFBOEAMzfVhsZnVWbcL4fxxkg5c/Fs1hYrScI1rmm+ST4rbMxnNnWc5Tvik5UUv575mMBs8RbFUv8MArjqZqSdVEJ8GpoQuZC7/8dUw2hVt9okPbyi/e20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244930; c=relaxed/simple;
	bh=sJEgQivnScC/y69GSX7R+WB6QtVAFvGURYCnsoCXlJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SD84E9njx7vOmlMYu6dvcSi8U45/wj7Hiiki/YKUSZuFP+B3VUJECG6bYHOyo9k8YTalURI1tyrpkZvwn9jAQRySjgM0RBk6Bxx6xla4chC9Vd5M1xRutj1wUB1Flf8ObqdSMePzFgnY8s+9YMvbb71j0DdzE8bKWggxYMrDkx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auiVmCFm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6432C2BC87;
	Mon, 16 Feb 2026 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771244929;
	bh=sJEgQivnScC/y69GSX7R+WB6QtVAFvGURYCnsoCXlJE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=auiVmCFm58yL8UsjaRxgBMyEzib0PpiNAwwWSyBn7jLXUjaT54yCPZDs+LmZZL0/x
	 uWRPj20RuqAM4voF7C+LcthxyVTknKPpHq9EOy4vmuOElayySgym4h8YEJdjHA4LpC
	 dvwy4aC4pu0NZ2iWkV9oaZaUj/vfI4IykI743SfBn0N/N9VwyFnu5rWkJFpm0CbAsM
	 9+RGg9SOVVAkEFEv/dypAqiUFQpNuLljbxrsPqC4tR08C+AwdiSmo+JlS4IEmIfSlE
	 E7aBYdp00EDpPP0kvw7poLYXOBOgfA3vZo9Nk42L39lnVLKMgFxak5wqXXNhAly/qP
	 U2nNNQ7U1kpvw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BA8E7BDAF;
	Mon, 16 Feb 2026 12:28:49 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Mon, 16 Feb 2026 13:28:48 +0100
Subject: [PATCH 2/2] media: synopsys: csi2rx: add missing kconfig
 dependency
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-snps-csi2rx-v1-2-747bc7408f87@collabora.com>
References: <20260216-snps-csi2rx-v1-0-747bc7408f87@collabora.com>
In-Reply-To: <20260216-snps-csi2rx-v1-0-747bc7408f87@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Collabora Kernel Team <kernel@collabora.com>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@kernel.org, Michael Riesch <michael.riesch@collabora.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771244928; l=1083;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=bgY+jc+2uqZDs40Q2hJUGLpFX/0F5uA7sZoal/DHrPA=;
 b=XS5jme6dD3eNof6m0qsSTKtUXpLB/FM0/lx+lwRfop0lsPEn64qyAdqK+gQJcufWjxOcdujAr
 YtMBQpFUBpwAqxw8RNOO11N41nbhmgj6JUVBnCra+AvEWstQpiUYQhE
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52869-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2AB3914357D
X-Rspamd-Action: no action

From: Michael Riesch <michael.riesch@collabora.com>

Fix "ERROR: modpost: "phy_mipi_dphy_get_default_config_for_hsclk"
[drivers/media/platform/synopsys/dw-mipi-csi2rx.ko] undefined!" by
selecting GENERIC_PHY_MIPI_DPHY in the Kconfig entry.

Fixes: 355a11004066 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
Cc: stable@kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602130253.BZnVd4jh-lkp@intel.com/
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/synopsys/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/synopsys/Kconfig b/drivers/media/platform/synopsys/Kconfig
index e798ec00b189..bf2ac092fbb3 100644
--- a/drivers/media/platform/synopsys/Kconfig
+++ b/drivers/media/platform/synopsys/Kconfig
@@ -7,6 +7,7 @@ config VIDEO_DW_MIPI_CSI2RX
 	depends on VIDEO_DEV
 	depends on V4L_PLATFORM_DRIVERS
 	depends on PM && COMMON_CLK
+	select GENERIC_PHY_MIPI_DPHY
 	select MEDIA_CONTROLLER
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API

-- 
2.39.5



