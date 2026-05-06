Return-Path: <linux-media+bounces-60602-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LXDLt5D+2lPYgMAu9opvQ
	(envelope-from <linux-media+bounces-60602-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:36:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8884DB0EE
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 15:36:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7E29300C903
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 13:36:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 452203EE1DD;
	Wed,  6 May 2026 13:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGxBl+7R"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF52843E4B2
	for <linux-media@vger.kernel.org>; Wed,  6 May 2026 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778074559; cv=none; b=udPjz2KB+9qG22ukNislLA17ArpibmU5lgfPfBzRZtwHAyiZ4UycpgBxQ+m1aAJocZJwSIj6P9frpEYpLMi5cITAhu+P2qmt45lQajoCn9YeNCbHqteBMYnWKjXPh6Z0g+kvBPGUG8NSRWDJe+HB+b/3t9PdK21l0MZ2IEmiGFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778074559; c=relaxed/simple;
	bh=DuFba+jdhQWCyh8Pg5Q6OPbNHqcEdW8DcZfEbSzv4lw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=umjUgThFaGYUD03aL1GmalaogExRMXkeceTlK8WZ4jGHWCbeeKGtLVrbcpnCov5pZCs25i8XE3KpRSUDtxll6BKTo0KNEDTyHsoU0Ka7meQKZzwEu4XmD6MXBjfHAbFGOiSkXQqwVNg1erZtxcRHtS3CEY+Y22jszL/5ZnwKBzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGxBl+7R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 946C6C2BCB8;
	Wed,  6 May 2026 13:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778074559;
	bh=DuFba+jdhQWCyh8Pg5Q6OPbNHqcEdW8DcZfEbSzv4lw=;
	h=From:To:Subject:Date:From;
	b=mGxBl+7RDq7m4OZXachNe4MtkZfdWraRH8jQSItii1tVfJcnSk2s2Oduc+wP/oBCW
	 CMEfEfFUrZBrL/YzTVYIFqrBJUcPrBylsNpfPMIcxn1+Fo8SIIcfRTlx+rh2WEK9Qj
	 bjnStrYDdJvkXC41hBmjrkOYHAR1EA0EC3KOkNIFbkXRNsm/mVDCywbrWbcAmdGCt5
	 Fo3XI6aQMS7G1eD8gHt98NAw4nZJ8+xS0pK9bdc8vHVQpQN01madIvPGQpcZ55Hbv3
	 6smEn5Ab0O3o7mxRw+U9eTEu4tvxyx2eOiO46sJePgFZornITmVMDMAXnEXTadAMPA
	 FQXZGzDLpR0UA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Subject: [PATCH 0/4] media: cec: add CEC LIP support
Date: Wed,  6 May 2026 15:34:04 +0200
Message-ID: <cover.1778074448.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 3C8884DB0EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60602-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add support for the new CEC Latency Indication Protocol messages.

The last patch makes it more consistent how CEC 2.0-only
messages are indicated in the header.

Hans Verkuil (4):
  include/uapi/linux/cec*.h: add CEC LIP support
  Documentation: media: add CEC opcodes
  media: cec: core: add LIP support
  include/uapi/linux/cec*: clarify which msgs are CEC 2.0

 .../media/cec/cec.h.rst.exceptions            |  23 +++
 drivers/media/cec/core/cec-adap.c             |   9 +
 include/uapi/linux/cec-funcs.h                | 182 ++++++++++++++++++
 include/uapi/linux/cec.h                      |  31 ++-
 4 files changed, 241 insertions(+), 4 deletions(-)

-- 
2.53.0


