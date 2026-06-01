Return-Path: <linux-media+bounces-63207-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MKt/E9ooHWq6VwkAu9opvQ
	(envelope-from <linux-media+bounces-63207-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:38:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A13A361A416
	for <lists+linux-media@lfdr.de>; Mon, 01 Jun 2026 08:38:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 03259303E4B7
	for <lists+linux-media@lfdr.de>; Mon,  1 Jun 2026 06:35:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8079F367292;
	Mon,  1 Jun 2026 06:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bkFxOOf5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EC529D26E
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 06:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780295728; cv=none; b=qTpsbNDgb6WYfsf2ok7uHh+UOpUNj6znVW/QPOS255hvEaAomr789vh5Q6SvJGpQjxKYQhwTIr8PlXmw2PV4tiSPwUoTyS9SRf8PZgkDxtdoWWQxxOn+snIjl4roU/sG3sAOMpAzY5jq4QiFHmcyZQCIsCCspdpJXDF6bZsKxa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780295728; c=relaxed/simple;
	bh=eawJtJgmaLr6ARaQuua3ouKiQwPOpdcSnU71Jqoma7o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AF7p6CTgfgVyvZ1UeYmEEnSmZbcxLfW52vp3vraYK22BXBjuh+y5rUxkjpxY7qj/2ms5quJFPLuaYhyXKod4+LkzS53oB50C7iPvyKfbpOtZAgpj7KHy/RmhsHDD6LX73wYVHY9a8QtTzrLo+k/5aqlZ03PEu/mYlHXuP+Xbz/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bkFxOOf5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 905E81F00893;
	Mon,  1 Jun 2026 06:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780295726;
	bh=eawJtJgmaLr6ARaQuua3ouKiQwPOpdcSnU71Jqoma7o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bkFxOOf5tm24VXF82NmOckKt6hhYlFk7GnMFM5aC5O3wran3jm1hLGtoaIGh/9MdF
	 e33rQ+X+sehHpBSIrTjacDnxuWMj4dp7u307Bu8hojLDloS6MJCvLS5A2JL2iwDWSi
	 mnbKsMpEbOZf6vbjzoVRZzf07ZBXiq65W6qs6jmb5hvCBM59NX1gvU3uOGlpCvgmfO
	 /FEsOkUTjzzHerAvVXwU2J2O1Ej+Xn5O6CtCCbC8EXs7wk/mtdBBz9fLED476pzZXK
	 v6HZlhg+rbHkTAr+bpQVDhDlHzpMdhBTZtmvciOkA4TFWD6algM9R/WO2MhFjOICLH
	 +8zRBKFRPe35Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: update contact email of Bingbu Cao
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bingbu Cao" <bingbu.cao@amd.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601062950.131642-1-bingbu.cao@amd.com>
References: <20260601062950.131642-1-bingbu.cao@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 06:35:26 +0000
Message-Id: <20260601063526.905E81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
X-Spamd-Result: default: False [-0.16 / 15.00];
	MISSING_MIME_VERSION(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DN_EQ_FROM_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-63207-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashiko-bot@kernel.org,linux-media@vger.kernel.org];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[sashiko-reviews@lists.linux.dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,intel.com:email,lists.linux.dev:replyto,sashiko.dev:url,amd.com:email,smtp.kernel.org:mid]
X-Rspamd-Queue-Id: A13A361A416
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [Medium] Incomplete implementation / Commit message discrepancy: invalid =
email left in MODULE_AUTHOR for IPU6 drivers
--

commit 5bf7bb0779b516dd1f8a081259395db55403d57c
Author: Bingbu Cao <bingbu.cao@amd.com>

media: update contact email of Bingbu Cao

The author has moved from Intel to AMD and is updating their contact
information in the MAINTAINERS file. The commit also removes the author from
maintainer roles for Intel IPU3, IPU6, and IPU7 staging drivers, while
intending to clean up invalid email addresses in MODULE_AUTHOR declarations.

> I left Intel and joined AMD, so update my email in the MAINTAINERS.
>=20
> For the Intel IPU3, IPU6 and IPU7 staging drivers, I am not able to
> continue the code review from now, so remove me from the MAINTAINERS
> and remove the invalid email in MODULE_AUTHOR.

[Severity: Medium]
This is a pre-existing issue, but the commit message states the invalid ema=
il
in MODULE_AUTHOR is being removed for the IPU6 drivers.

The old email still remains in the following IPU6 files:

drivers/media/pci/intel/ipu6/ipu6-isys.c:
MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");

drivers/media/pci/intel/ipu6/ipu6.c:
MODULE_AUTHOR("Bingbu Cao <bingbu.cao@intel.com>");

Should this patch also include the updates to the MODULE_AUTHOR lines in th=
ese
IPU6 files to match the description in the commit message?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601062950.1316=
42-1-bingbu.cao@amd.com?part=3D1

