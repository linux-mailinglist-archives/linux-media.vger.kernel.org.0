Return-Path: <linux-media+bounces-21062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B845B9C084E
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 15:01:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 160E2B2175B
	for <lists+linux-media@lfdr.de>; Thu,  7 Nov 2024 14:01:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 458182101B8;
	Thu,  7 Nov 2024 14:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="T5fPFYb4"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661BC38F82;
	Thu,  7 Nov 2024 14:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730988055; cv=pass; b=kY/aM9v011IHVTijb9zv9vMwEUfbfQ6jrPP2hqMoVE/QsMsy46Is05G4in3t8FVKffjKzPJfy9Hy2Syb/+ARckH0X9XMq5cYhGOaZL3fKIjs1YgTNbj2g9FVKPjl7s1jR4myvY6mxshfOM33mRMtmyoqQ9DxB7SDdJISpGwZq/0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730988055; c=relaxed/simple;
	bh=LowCcCx6Ula8t6ng7q9Yzjh9W25UkX2pofT85sNfg2I=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D2MmNwGP9o766Y1YQywuNMuex90/KVwWAgU2QFrP9CDS+ATEJYZzB76n4BCnx9qW+9mBH3hMx1Kms79M1sOd78UFHfEniN8uU+rzS1TmtRu+2+gZ8YFN4iXDjHPqvZAyy6wuIbYfV7HorUgORj88M/6MpS9aFY4wvwBDfxnRDC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=T5fPFYb4; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1730988033; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EHuArcP0E7PsI1Fur70LfaLB9RsnkFWxzFDTolGcbFu9kXUMa/N4WsXRaNFa5tefcwwjzLW3qG+5smT2t+ThFsH0PFuM/JXQaE8jpcGQvug736Uy6vhZ2RZF0SLhiT0Gw+M9vFa/JGE/Ull8Kcctqmz5fiPDHDvpKNrxemXtFDY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1730988033; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mye+9MY3NuP8DCnW4hzUTlaOO4vMCwYJKn3MvFw821g=; 
	b=mhIbYPrs58zhhpshLX0jcRdwvjdNwNFuO5ti6J81sMPpy7FgkaxPgyCcrm7lo8ASBBhJkCIb2H9Zab9N24k/1MNFYvMZ7K96itzkJpBZI3N2ge0C0cdweza5lONYZrKXkO5rS+bikqjC+EhWaxRfgxQFQ6UYt8pq+G9WCt3Imvo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1730988033;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=mye+9MY3NuP8DCnW4hzUTlaOO4vMCwYJKn3MvFw821g=;
	b=T5fPFYb4jVKVbyHyTPRQlsxWJv1I2IIFV75EEyFGQ3N0GrRaj2D1iK7PpTvF6Cta
	rFamQ0kfZIDmQQC0Al4Wdd32UiQwTPt7r4aSEoVKvlYFeoyJ4FJ6Xxw8EigQ7MJguWv
	HQ22QcV0Wkr5KuUe3jFkRVC+WjjVo2bAFW9DxAxo=
Received: by mx.zohomail.com with SMTPS id 1730988031139576.9234821655158;
	Thu, 7 Nov 2024 06:00:31 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH 0/2] Documentation: Debugging guide
Date: Thu, 07 Nov 2024 15:00:23 +0100
Message-Id: <20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPfHLGcC/23NQQrDIBCF4auEWVdwtMTSq5QiRifNLKLBAQmE3
 L2m6y5/eB/vAKHKJPAcDqjUWLjkHngbIC4hf0hx6g1Gmztq81ArJQ4+lSie162WRr5ZZZOLOGp0
 Di10OwUhNdWQ43Lpv+jabZVm3n//r/d5fgGE7FSYjwAAAA==
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mauro.chehab@linux.intel.com, kernel@collabora.com, bob.beckett@collabora.com,
 nicolas.dufresne@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730988026; l=4515;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=LowCcCx6Ula8t6ng7q9Yzjh9W25UkX2pofT85sNfg2I=;
 b=mK0WlohwurHv8Tuq92fItgDRK8eMFPsAnYTnJuGEwjdixNI1V5ZpzuEujI5haPZqd1Zqn09hGewu
 SGpgZXUoD2lDZkV33Tcss/jKVeS2HnJhhLeH8egv/XKvUVHv91OS
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=
X-ZohoMailClient: External

The series contains:
- a general debugging guide split into debugging for driver developers and
debugging from userspace
- a new summary page for all media related documentation. This is inspired by
other subsystems, which first of all allows a user to find the subsystem
under the subsystems page and secondly eases general navigation through the
documentation that is sprinkled onto multiple places.
- a guide on how to debug code in the media subsystem, which points to the
parts of the general documentation and adds own routines.

WHY do we need this?
--------------------

For anyone without years of experience in the Linux kernel, knowing which tool
to use or even which tools are available is not as straightforward as some
senior developers might perceive.
We realized that there is a general need for a kind of "start page", that
allows especially beginners to get up-to-speed with the codebase and the
documentation. The documentation in particular is currently quite hard to navigate
as you mostly have to know what you are searching for to find it.

WHAT do we cover?
-----------------

The document is structured into two sections:

1. A problem-focused approach: This means, a developer facing an issue matching
one of the given examples, will find suggestions for how to approach that
problem (e.g. which tool to use) in this section
2. A tool-focused approach: This sections highlights the available tools, with
comparisions between the tools if sensible. The goal of this work is
**duplicate as little as possible** from the existing documentation and
instead provide a rough overview that provides:
- A link to the actual documentation
- A minimal example for how it can be used (from a media perspective,
  if the usage isn't absolutely trivial like printk)
- A rational for why it should be used

To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Cc: hverkuil-cisco@xs4all.nl
Cc: mauro.chehab@linux.intel.com
Cc: kernel@collabora.com
Cc: bob.beckett@collabora.com
Cc: nicolas.dufresne@collabora.com
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

---
Changes in v1 (first non-RFC):
- Move the guides from Documentation/debugging to Documentation/process/debugging
- Remove the new Documentation/media folder and place the media-specific guide
  instead into Documentation/process/debugging
- Reduce the line length to 80 character wherever possible
- Exchange |code| with © and remove the include
- Remove :code: specifiers
- Exchange html links with :doc: and :ref: links, to allow sphinx to convert them correctly
- Use markdown links only when necessary 
- Various style fixes
- Improve the description for how to read a crash dump
- Split the general advice into a separate file
- Remove unnecessary labels
- Replace duplicated ftrace example with links to the documentation
- Add 2 additional debugging sections to the media debugging guide
- Replace the lkml link with the matching lore link
- Extend the error checkers section with further details
- Add intro sentences on the media debugging guide to the various sections
- Remove ftrace examples and point to the documentation instead
- Change the section depth to allow cross references via the autosectionlabels
- Add Elixir links whenever I point to a specific file

Changes in v2 (RFC):
- Split the media debugging guide into a general and a media specific guide,
which contains mostly references to the general guide and a few media
specific aspects.
- Fill out TBD sections
- Add device coredump section

---
Sebastian Fricke (2):
      docs: Add guides section for debugging
      docs: media: Debugging guide for the media subsystem

 Documentation/index.rst                            |   2 +
 .../driver_development_debugging_guide.rst         | 206 +++++++++++++++
 Documentation/process/debugging/general_advice.rst |  48 ++++
 Documentation/process/debugging/index.rst          |  22 ++
 .../debugging/media_specific_debugging_guide.rst   | 178 +++++++++++++
 .../debugging/userspace_debugging_guide.rst        | 278 +++++++++++++++++++++
 6 files changed, 734 insertions(+)
---
base-commit: 8c64f4cdf4e6cc5682c52523713af8c39c94e6d5
change-id: 20241028-media_docs_improve_v3-3d7c16017713

Best regards,
-- 
Sebastian Fricke <sebastian.fricke@collabora.com>

