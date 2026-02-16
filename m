Return-Path: <linux-media+bounces-52868-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDwANaANk2nw1AEAu9opvQ
	(envelope-from <linux-media+bounces-52868-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:29:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C34143576
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 13:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 596383030B08
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 12:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAC6630EF63;
	Mon, 16 Feb 2026 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="io6k0tr5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177332D47F1;
	Mon, 16 Feb 2026 12:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771244930; cv=none; b=AEyd3hY4MawA+G8Wy/95lUf+io6RrmXCGA6J8YQojszhcAutpKm0aDzrk7gypPDJnHXIojnVsMK0yD7EqchRxnkg9K5ZYCUsv9GsneM9Y//y6Qm8alfNTsrWY0uF+XII8OKNWagMDiEwgEufWf2xsLLCINIgGDrKHg5H1nloMxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771244930; c=relaxed/simple;
	bh=/LZt/T9liTWeDgycIZZt6KHvICc1pPZDiLrpc2mzndw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fe9YTojSU92jTxMx9CodvwQdjenr2uMOVJt2JLF4h0xr415kQvdeclfIJ5J3/iF2F6x2oRu9L42/3uGg7vPsdNnJZh753cWUrH1HodXqB+bISVFt07HdhGQ/RFB7UCZh9GUMm+ChrYrbBabCgEpae3OJqc19Br5aFvMbNlfXa+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=io6k0tr5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1EE8C116C6;
	Mon, 16 Feb 2026 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771244929;
	bh=/LZt/T9liTWeDgycIZZt6KHvICc1pPZDiLrpc2mzndw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=io6k0tr5W2Shqgqo/yXfOHhjJZDs0cVYusCmLCg1g3rgKj8Naa8LpGkBUGt9O9/wV
	 e1SktPNVzRVnNZAk7Zftq8lJeCVrnqnUK0tIZqjODVCSMg0r/XhJef1WBGrsEAVee7
	 jlGd27ZCQgLEp19GpOPhS1FHN/AaiL7OMav6fGhexhifAMUxeL8zMZJe6e2Pw2xHYe
	 4UUGcrvyslK8jyCH6s62+KYSseBhBloav19OCR9Xd1f2xRQN5w+rz9XNbhxXT7Hs2O
	 fHlG/vN1NVmr4lOV61WJaQjAuQJdW9aQHkZ0gqWqFHG0e/oCBq/7ohH4QDrBmxXZ2N
	 6VDYylLsUiuxg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8EDE7BDAD;
	Mon, 16 Feb 2026 12:28:49 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Subject: [PATCH 0/2] media: synopsys: csi2rx: various fixes
Date: Mon, 16 Feb 2026 13:28:46 +0100
Message-Id: <20260216-snps-csi2rx-v1-0-747bc7408f87@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH4Nk2kC/02NQQrCQAxFrzJkbejMaKv0KuIiM6ZtNmNJQAqld
 zfixt1/8B5/B2MVNhjDDspvMXk1h3QKUBdqM6M8nSHHPMScBrS2GlaTrBteSx8pxRvTmcCLQsZ
 YlFpdvk25dP/2JJsfubYq//YY7o/j+AD9O7CHhAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771244928; l=956;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=/LZt/T9liTWeDgycIZZt6KHvICc1pPZDiLrpc2mzndw=;
 b=rkTgzCPrAU6piNT7K84+HpLVyOPTyAX2KeHui5bQp2dq3/xMINWNwdI83Jz24w8ABE0dMyR0c
 HoLmB7PJH02BkxWIiuG0OBQfef525e8sIcpGntbbI7zjlJFqmRCGMDR
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
	TAGGED_FROM(0.00)[bounces-52868-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
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
X-Rspamd-Queue-Id: 82C34143576
X-Rspamd-Action: no action

Habidere,

This series contains two fixes that address two issues raised by
CI bots.

1) A stupid off-by-one mistake in the check that protects the formats
   array. Thanks to Dan and his smatch bot.

2) A missing Kconfig dependency discovered by the lkp bot.

At this point, thanks to all the people that maintain those bots/the
CI infrastructure!

Best regards,
Michael

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
Michael Riesch (2):
      media: synopsys: csi2rx: fix out-of-bounds check for formats array
      media: synopsys: csi2rx: add missing kconfig dependency

 drivers/media/platform/synopsys/Kconfig          | 1 +
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: c824345288d11e269ce41b36c105715bc2286050
change-id: 20260216-snps-csi2rx-7b50a108ea3a

Best regards,
-- 
Michael Riesch <michael.riesch@collabora.com>



