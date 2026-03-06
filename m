Return-Path: <linux-media+bounces-54802-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SASXF63oqmkTYAEAu9opvQ
	(envelope-from <linux-media+bounces-54802-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:46:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 180AC223028
	for <lists+linux-media@lfdr.de>; Fri, 06 Mar 2026 15:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 10F8C30439FA
	for <lists+linux-media@lfdr.de>; Fri,  6 Mar 2026 14:45:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13EB13A1D04;
	Fri,  6 Mar 2026 14:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHOCI4Cx"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B64437C91F;
	Fri,  6 Mar 2026 14:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772808313; cv=none; b=b02mxIwjmZPedadV6vIadTqfQBnskqok9YAUPc6NKnWRT/Hyk9bbu7wkFI58cZLXGLOjTLSFmzQy8VwX1p+nHc6Yahs9ezE9FwzeGMv4cP8/rCJeqPxa5VmRhBwStBIjZX/K2KojNUhS5L7AWlJsSU8s4imp4+NjrF1kw6AR8Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772808313; c=relaxed/simple;
	bh=sufv+0EZytRd0W7t3hT7ZcyoWueei5+VJySsCcTw1HA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NJnIC1KYrscuxhXQIpoTx00U/nLynxoOtY7WDjDqCPVCh3SgQ74tPnwkjdUwHFSaFx9J7uQY7Zm+AZA9e2HbUABrbwZNJ0K4R2nQCOybM72iWrvFEN1QNnNJY2gdDEjvRlKLno1j+RDabHZFZuKeRwTpkD4dNUAM/AE8wQ+8rI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHOCI4Cx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53265C4CEF7;
	Fri,  6 Mar 2026 14:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772808313;
	bh=sufv+0EZytRd0W7t3hT7ZcyoWueei5+VJySsCcTw1HA=;
	h=From:To:Cc:Subject:Date:From;
	b=AHOCI4CxB8BTaox3/4hUOaCEqj9+9XIOjebG4pxWbRvEWBK7vYF7YjAtdKafF2RZt
	 mZaYiOwCKo9lgZAWsAOoNXpqeLXh4Ne7VzXyTHFGfY3o5AqJ/MH+fBpBBTzHf9a9qB
	 K72VJXsoBxYpyh8qi2tlDSLnNBdu7gxwYWclrjJEKlXHRVoeTc6PUMVCIyauBwKvsk
	 3nqrBRpdsssGubmVuxR5ZtIqW24mZBKAJjp89htCKpgMRfk+WgXtURR8fIi58ZLfNV
	 kJKyFdAcWCVzNqY0r6zwbPQq5nR+YjteLNNxFm/1RkQJGdyaJKbgeYFPLwQU51TqT7
	 cdpUZgmttsVsA==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: synopsys: fix link failure against GENERIC_PHY_MIPI_DPHY
Date: Fri,  6 Mar 2026 15:45:01 +0100
Message-Id: <20260306144507.3449000-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 180AC223028
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54802-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,arndb.de:email]
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver uses the generic mipi dphy driver but is missing
a Kconfig dependency:

ld.lld-22: error: undefined symbol: phy_mipi_dphy_get_default_config_for_hsclk
>>> referenced by dw-mipi-csi2rx.c:240 (/home/arnd/arm-soc/drivers/media/platform/synopsys/dw-mipi-csi2rx.c:240)
>>>               drivers/media/platform/synopsys/dw-mipi-csi2rx.o:(dw_mipi_csi2rx_enable_streams) in archive vmlinux.a

This is in a library module that needs to be selected by each user, so
add the missing 'select' here.

Fixes: 355a11004066 ("media: synopsys: add driver for the designware mipi csi-2 receiver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
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


