Return-Path: <linux-media+bounces-51113-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIFfJZd+cWk1IAAAu9opvQ
	(envelope-from <linux-media+bounces-51113-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 02:34:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F6C605F4
	for <lists+linux-media@lfdr.de>; Thu, 22 Jan 2026 02:34:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0985F80A238
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 12:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 511C541C301;
	Tue, 20 Jan 2026 11:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pW/z5N/z"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03DF421EE1
	for <linux-media@vger.kernel.org>; Tue, 20 Jan 2026 11:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768910359; cv=none; b=DrjbZ98L2+M4Pc/EVH5ea0qy/Za8qLEu2bsd9vMQzotFrMSdHeJQppil/z4IcS5HSAi4EMM9WZhB9Aig5ACFav+mHbYjms/qojECRbg4BaluRskyspCat83GcMXQSwEL6gQp6yxS98v+LocZphAOBRsPUGmq3XcWtpR72QlQL+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768910359; c=relaxed/simple;
	bh=V/v8dWA9uZTiLLeTojV9jz/w4Yclh7wTRFbF/J2X0XQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MIYcdCM2jGtMGc3idn785wsDxORYxWrPzUgveO+xOL7wkUB3kxrV/rdnSYPyMeC3pAgfF9rVLFqQMtuQTlcMq9kcfCkGx/pKoLst2Kxfc4WT1X4k0KKruajHLB8A1JbycQxcGYMCzH243+q7/Ty5Y0NGneKCRPW3qc7GWYUJaFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pW/z5N/z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3214C16AAE;
	Tue, 20 Jan 2026 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768910359;
	bh=V/v8dWA9uZTiLLeTojV9jz/w4Yclh7wTRFbF/J2X0XQ=;
	h=From:To:Cc:Subject:Date:From;
	b=pW/z5N/zVNzlYNnmoWJMziND1O2z7pMstNjP3imkF7OAqr4GVQRet8yL0cp+Rdggx
	 2CruSCWoZFcVqcB/AKsqtmXNT/Fxo9W9OzuElEvnj/7VbGAv1DXDtIb8kQUSsR+Zdw
	 Yn9VasmoluKR3XMtZM87A8PZI5EjlttUdCegV9KYFUZFGOdg1Sbp1gNPy+GokRFSD3
	 YoVcqZ3bHFrg4sOkKQFxfOmePcw5hafqI/AeAkVGihwj7dFZCMA+t2rw9j+2Qeqq7Y
	 /f0CdrZxPDx0bH3GwBxoYz701IpKCNKzFcJM/i9Jk7hOkTkOSq/wcCTplVBrMlilSX
	 RqFO9Du0VUZ/g==
From: bod@kernel.org
To: bod@kernel.org,
	linux-media@vger.kernel.org,
	hans@jjverkuil.nl
Cc: bryan.odonoghue@linaro.org
Subject: [GIT PULL FOR 6.20] Please pull platform-qcom-venus-6.20
Date: Tue, 20 Jan 2026 11:59:11 +0000
Message-ID: <20260120115914.293208-1-bod@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[37];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51113-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bod@kernel.org,linux-media@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_NONE(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Queue-Id: D5F6C605F4
X-Rspamd-Action: no action

From: Bryan O'Donoghue <bod@kernel.org>

The following changes since commit eb4ee870747c3a77a9c3c84d84efb64bd481013a:

  Documentation: admin-guide: media: mgb4: Add GMSL1 & GMSL3-coax modules info (2026-01-17 09:08:02 +0100)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/bodonoghue.git tags/platform-qcom-venus-6.20

for you to fetch changes up to 2e46a188b4309998014b93961820ddea050fd65d:

  media: venus: assign unique bus_info strings for encoder and decoder (2026-01-20 10:26:55 +0000)

----------------------------------------------------------------
This tag contains just three patches reflective of the transition to Iris

- Two fixes for EOS handling
- One string to better inform user-space of encoder v decoder

----------------------------------------------------------------
Dikshita Agarwal (1):
      media: venus: vdec: restrict EOS addr quirk to IRIS2 only

Jorge Ramirez-Ortiz (1):
      media: venus: assign unique bus_info strings for encoder and decoder

Renjiang Han (1):
      media: venus: vdec: fix error state assignment for zero bytesused

 drivers/media/platform/qcom/venus/vdec.c | 20 +++++++++++++++-----
 drivers/media/platform/qcom/venus/venc.c |  6 +++++-
 2 files changed, 20 insertions(+), 6 deletions(-)

