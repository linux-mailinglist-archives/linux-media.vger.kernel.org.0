Return-Path: <linux-media+bounces-51630-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oAEwKX+feGn4rQEAu9opvQ
	(envelope-from <linux-media+bounces-51630-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:20:31 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F1093824
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:20:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 595753052EBC
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 155F3345CA6;
	Tue, 27 Jan 2026 11:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ3lRmWX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7973430E851
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512720; cv=none; b=c3AszgA2ezw7pCG2GzX1AWFPE66xQNoCJjdudyVS3g+Q7Pwdg3XfMROaNLYdzXeb1NoUALh59pM5x23P+FC8IHbBdCOXhx2uY1WGi3ShY3hzmdMIxwoVbPV1t62zOUqEl7HrUU1LFPpcgvFkaoCamuKfk7+f9zRmPQRqo4butSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512720; c=relaxed/simple;
	bh=pV2GITVwm06IMK23mcFqnyjWYQKCgjia+kU+gDbU8Do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=brzr1lv9DxNZIN4YgjA4Jt6a6gFAXk6W88/90H60PeZYX0hz/D7yehW6b0nS4Ac2PUEFbkEhOKJ1zsZp1TPtW2aQJ528C5MUBYRMpXx+S/rYu6CMLR/YLdRTbufSHWLabt0bygycL/HpPW4inoU97DtYVgBUgQAyj9fY5XXD0rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ3lRmWX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CEFC116C6;
	Tue, 27 Jan 2026 11:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769512720;
	bh=pV2GITVwm06IMK23mcFqnyjWYQKCgjia+kU+gDbU8Do=;
	h=From:To:Cc:Subject:Date:From;
	b=aJ3lRmWXybX6wSXKozLUtZ7TT8ERvC9kyr5eqCp2k5p/tYwt+okUHhGSyP+ZPs/yI
	 Y0EhAVEqJv+EaUByYnyeqhojFz5GlZJw6M96FzJqcabyUR2cWmXnKrKGiDKn2xwvKD
	 KIY5BSrPzAl8TXlnGRh7A2XtXEls1lUTJdcxe0sF045mg4m/uPI2ln+yJ8Qx3YKxs3
	 DQPvcXQCUONgOouTWzEYAusWDe/YsCFNPXwmUBaL2jSG/oeWFI7SnmXntAVPauGKY6
	 7+y11y5ht4Fw/f/iIYH+Sdo22YhXdpfZLPfM09XXja25NgFPHNiQXHwsfuboKS6NFt
	 VjTQ10DB6l4fA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCHv7 0/3] docs: media: multicommitters model documentation
Date: Tue, 27 Jan 2026 11:53:24 +0100
Message-ID: <cover.1769511207.git.hverkuil+cisco@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-51630-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 23F1093824
X-Rspamd-Action: no action

Here is v7, based on yesterday's meeting.

The main change is what a "Media Maintainer" is. In v6 I considered a
Media Maintainer to be someone who has patchwork access and has
responsibility for an area of the media subsystem, deciding when a
patch is ready to be merged and making PRs.

That was confusing since that name was too generic.

In v7 a "Media Driver Maintainer" is anyone who is listed in MAINTAINERS
for a media driver. "Media Driver/Core/Subsystem Maintainers" are collectively
called "Media Maintainers".

I also added the distinction of being granted patchwork access: only Media
Maintainers with patchwork access can decide when a patch is ready to be
merged and make PRs. If you are trusted enough to be able to do that, then
patchwork access is granted since you need that to be able to delegate patches
and update the patch status.

I'm still not entirely satisfied with this, as I would prefer to have a
specific name for such maintainers. Saying "Media Maintainers with patchwork
access" is a mouthful. I can't think of a good name, though.

So the hierarchy is as follows:

- Media Contributor: posts patches
- Media Driver Maintainer: as above, but also reviews patches and is
  listed in MAINTAINERS
- Media Driver Maintainer with patchwork access: decides when patches are
  ready for mainline, posts PRs, keeps patchwork up to date. Optionally
  has commit rights.
- Media Core Maintainer: same as above, but is also responsible for one
  or more media core frameworks.
- Media Subsystem Maintainer: as above, but is also responsible for the
  whole subsystem, processes PRs and has commit rights.



Patch 1/3 updates maintainer-entry-profile.rst: it introduces the
three Media maintainer levels (Media Driver Maintainer, Media Core Maintainer
and Media Subsystem Maintainer) and what the responsibilities are.

Patch 2/3 adds back and updates the list of Media Maintainers that
disappeared in patch 1/3. Please verify this whether the email
addresses are the correct ones, and verify that the areas of responsibility
are correct and that nothing is missing.

Patch 3/3 adds media-committer.rst: that focusses on the additional
commit rights that can be granted to a Media Maintainer.

It feels much more consistent to me, I'm looking forward to the
review comments.

I have uploaded the documentation with these patches here:

https://hverkuil.home.xs4all.nl/spec/driver-api/maintainer-entry-profile.html
https://hverkuil.home.xs4all.nl/spec/driver-api/media-committer.html

Regards,

	Hans

Hans Verkuil (1):
  docs: media: document Media Maintainers

Mauro Carvalho Chehab (2):
  docs: media: update maintainer-entry-profile for multi-committers
  docs: media: document media multi-committers rules and process

 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 436 +++++++++++++++---
 .../driver-api/media/media-committer.rst      | 197 ++++++++
 3 files changed, 577 insertions(+), 57 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committer.rst

-- 
2.51.0


