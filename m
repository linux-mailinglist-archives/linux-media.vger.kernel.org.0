Return-Path: <linux-media+bounces-52258-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MHsPJxWrhGk14QMAu9opvQ
	(envelope-from <linux-media+bounces-52258-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:37:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B30BAF41A1
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:37:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB1EA3011F11
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 14:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A264E407562;
	Thu,  5 Feb 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAArChi9"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1985F3F23DB
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 14:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302223; cv=none; b=afeSN2voJpy1vmKvca/HYK3EvVaxixmICgZMW/QuyXtOKc5gktERNmUqhZffo+bBhFqES7yMWubCZInKp+2Nrf/9SADfPQ4LGwMyaDPJVSyVO9StB5R47K2E1SDX6W70n4MkpVNY5clGCfGR2XofugN6vPMw3Pjl7YHrn7sbPlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302223; c=relaxed/simple;
	bh=aKUho0pWbNFBL+JEEtoWav+yqzY5Gf/GRpTP+CvNlEM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iH3ZVfHalTG/fqJBCIXHbPjCGgPTPtDq8rOMz6WBc3aRQjJM2ef6oThI2FG157jl7ncspoOEw/4BP/odmfmpBBHt1taO37awn/3KhkzyJ9qUoLyeF3HAjUoT65PcWGL4Z6xYWDzwgLYuovgJbJ+5S5/qj6+CpZecvdQLUPHla3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAArChi9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0421C4CEF7;
	Thu,  5 Feb 2026 14:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770302222;
	bh=aKUho0pWbNFBL+JEEtoWav+yqzY5Gf/GRpTP+CvNlEM=;
	h=From:To:Cc:Subject:Date:From;
	b=ZAArChi9Fj7wEKTuNZ3grquWtgDsRdPttw2nunerTlcH84uG2D00vTpRCkREEUWjh
	 U94eyLz7t4cQPBWn7dvvV4OeXI3YoVV+PZdpiI95LAnFREQyf5fBgqbIscquM9qoTR
	 rEbmQq/R3kJbxhQBROJTjYRE3WJJRz5vn2SAZ3APkstFpQ7uMtnYbMnnEU23H8KK0v
	 yrZH2Jg82FWUdWNmKXpd5gP9en31CeEAinVMeMx+csEmJKDr2kCwI3sDbege8R8Pvh
	 2t5V8+u2doBwtjdZJJ1D+4En7Mho7bu8F2Le8iSIiU2AZZ3Pfr+KJN7oltOIAERt45
	 /Eqy/DMreLxxA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCHv8 0/3] docs: media: multicommitters model documentation
Date: Thu,  5 Feb 2026 15:32:51 +0100
Message-ID: <cover.1770301974.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52258-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: B30BAF41A1
X-Rspamd-Action: no action

Here is v8, based on Mauro's feedback.

The main changes since v7 are:

- rename media-committer.rst to media-committers.rst
- the 'Note' at the start of media-committers.rst is now just a list
  of additional responsibilies (it made no sense that it was a 'Note').
- incorporated Mauro's suggestions

Patch 1/3 updates maintainer-entry-profile.rst: it introduces the
three Media maintainer levels (Media Driver Maintainer, Media Core Maintainer
and Media Subsystem Maintainer) and what the responsibilities are.

Patch 2/3 adds back and updates the list of Media Maintainers that
disappeared in patch 1/3. Please verify this whether the email
addresses are the correct ones, and verify that the areas of responsibility
are correct and that nothing is missing.

Patch 3/3 adds media-committers.rst: that focusses on the additional
commit rights that can be granted to a Media Maintainer.

I have uploaded the documentation with these patches here:

https://hverkuil.home.xs4all.nl/spec/driver-api/maintainer-entry-profile.html
https://hverkuil.home.xs4all.nl/spec/driver-api/media-committers.html

Mauro's feedback for v7 is here:

https://patchwork.linuxtv.org/project/linux-media/list/?series=21550

Regards,

	Hans

Hans Verkuil (1):
  docs: media: document Media Maintainers

Mauro Carvalho Chehab (2):
  docs: media: update maintainer-entry-profile for multi-committers
  docs: media: document media multi-committers rules and process

 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 451 +++++++++++++++---
 .../driver-api/media/media-committers.rst     | 201 ++++++++
 3 files changed, 591 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committers.rst

-- 
2.51.0


