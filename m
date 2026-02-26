Return-Path: <linux-media+bounces-53476-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SN+NHX4goGmzfgQAu9opvQ
	(envelope-from <linux-media+bounces-53476-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:29:18 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF9E1A43E2
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 11:29:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1AC19300DA56
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 10:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A15493A7F40;
	Thu, 26 Feb 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QY0ksPGt"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F07D3A7F60
	for <linux-media@vger.kernel.org>; Thu, 26 Feb 2026 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772101726; cv=none; b=uXHPwSvAVPoqDCUk46ni9bv3gYbdaI/a+KYKxguMJgk7ZcZescPCmq4d/hCyfxjd90IgZSCSNnzjtckTGsJLDHozPf3wT2/JD0v3NZlnaLuSkk5Iajqv/JPkS3KsbiSD3nGWaYEU5fmzt3uGmZo6+Cwe8lULq6lzVYBv1k3YtOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772101726; c=relaxed/simple;
	bh=h1xjBEDrOe4iUI4x3HrTryumOOArXGT3pc8Pzv9Zr7c=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=hUZt3yMdwVZPeY+ILo01VlgtAexliWmYcthE8WMDfcq/uTYyInnO9so/rPAe+9Q2GGUQR8QtKQ7HCvrcOBrMHp1naiEgmcf8wBT15tIqZqroS/48UO/rBBmbLXI6eY0CX4L/C/r1MzN25SltMC26BLGl4ynNsCOpZovj6PdZd9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QY0ksPGt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03422C19424;
	Thu, 26 Feb 2026 10:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772101725;
	bh=h1xjBEDrOe4iUI4x3HrTryumOOArXGT3pc8Pzv9Zr7c=;
	h=Date:From:Subject:To:From;
	b=QY0ksPGtqWMxqZaqd1irxg13ezca7kHT9N02a2lJuFMRMOlCTIPhDZTE5tiaFf3/f
	 ks57YP6aS9szSZ9nYm7sGEhhYwSMyMxp/o50r70S1hW+cUfQ6wRCp9rgGl0B0WiNkt
	 6MY0Oe95W8Dnf082NMv6QBhYbraZe2BRin9yr8WKcpKiR2ODJjWumG8aJyBdQAbq77
	 PIvMpFMZ6BFBLioIva0idCWGOrvFQOZZlIfQE5ACVqJE4bG8jQEtKFQTm20/htroh7
	 AyyqDi+5No7Q1ccUl739IoEpsc/pD58cvMVwSNCCdncRXzQMZOlp+ZUcLko/jnhHPx
	 fDIejdkrek0MA==
Message-ID: <d1836871-2b76-4ac1-8ef1-b91f80c85b11@kernel.org>
Date: Thu, 26 Feb 2026 11:28:42 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US, nl
Subject: [GIT PULL FOR v7.1] media: add multi-committer series
To: Linux Media Mailing List <linux-media@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-53476-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: AAF9E1A43E2
X-Rspamd-Action: no action

Hi Mauro,

This adds the v9 patch series for the multi-committer documentation:

https://patchwork.linuxtv.org/project/linux-media/list/?series=21721

The only change with v9 is that I added SPDX lines for these two documentation
files, media CI complained about that.

Also included are two patches from your original patch series:

https://lore.kernel.org/all/2d8d4e6eeb3c5adbf0f34c8096d594c6bca2c82d.1756807237.git.mchehab+huawei@kernel.org/
https://lore.kernel.org/all/2cfcaefd4680270a470a5ada6d07128c0133c317.1756807237.git.mchehab+huawei@kernel.org/

These two were never CC-ed to linux-media, so they are not in patchwork.

Regards,

	Hans

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://linuxtv.org/hverkuil/media.git tags/br-v7.1a

for you to fetch changes up to 0838ac33deeb82da95618f3737d5182ebaa8b2df:

  docs: media: document media multi-committers rules and process (2026-02-26 10:09:55 +0100)

----------------------------------------------------------------
Tag branch

----------------------------------------------------------------
Hans Verkuil (1):
      docs: media: document Media Maintainers

Mauro Carvalho Chehab (4):
      docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign
      MAINTAINERS: fix a couple issues at media input infrastructure
      docs: media: update maintainer-entry-profile for multi-committers
      docs: media: document media multi-committers rules and process

 Documentation/driver-api/media/index.rst                    |   1 +
 Documentation/driver-api/media/maintainer-entry-profile.rst | 463 ++++++++++++++++++++++++++++++++++++++++++++++++++--------
 Documentation/driver-api/media/media-committers.rst         | 203 +++++++++++++++++++++++++
 Documentation/process/maintainer-pgp-guide.rst              |   2 +
 MAINTAINERS                                                 |   3 +-
 5 files changed, 609 insertions(+), 63 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committers.rst

