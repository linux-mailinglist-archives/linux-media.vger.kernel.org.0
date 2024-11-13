Return-Path: <linux-media+bounces-21370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0DC9C6DFB
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 12:37:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 43887B2A795
	for <lists+linux-media@lfdr.de>; Wed, 13 Nov 2024 11:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08777200BAA;
	Wed, 13 Nov 2024 11:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="HNjqfJSP"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DEBC2003D2;
	Wed, 13 Nov 2024 11:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496658; cv=pass; b=pM9ZzD+OGB71h4nwPYkj/ty6rovaQ9CRPnV2R5YbYgh/oftL3+2Dt3gogQkKRLx/xPjPgJ+2ApjQyFutLQTDq8Z5o22jNqhtPb5EyI6ZWBWGwNzS0UkEtHLWIjErAKf1I2ZfhQxZqF7196XXCBjmA1wqRIcGbR0+GXc9Ym7EyM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496658; c=relaxed/simple;
	bh=BrJUfdQou5rFblk+7sa98eAyvIDDMEqx3lsmQNYSeTg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PMWwqQHpP8jhy3hXm56Y98KZWjX8d+02Dz9XUQj/9+QMm+jIJ7bpPLwCdNPH3nompOAYo/2p2uq3ALh7stum+t6ju2SZpJDuy9S/uZJvbEbuNkruDdf4V4PtQe5v396gz8xabWqSLTIMeerHwLgu2oOEqBaq5+vvg5oflYFUkko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=HNjqfJSP; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1731496640; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cWQ+s6ZGHaUr2HwM8VoFTh21WVAocu3YRjGuTXHJNC1Td7TDuOETLtciI62xxyyUwUecZGvZ9V2afyRS5ZPXlhCWPYwRPVYK7o/oGVYLSbSKikMuTEhoMuhtjnsymEsLqzM5ZcjV22tKKLOoTVPWMOShAokI6TZDZtc/ryhTrDU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1731496640; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Vt/3xgCafBGQY10RaO1CXj/PchZ3xMnPpyIxrYzqmqs=; 
	b=U93OrwEhchvrDk97GT9RCRSuuiGlWsfRp3KCfovu7LHngF9l5nNaugRIcf7QbCNDRKahkEDGkw2q6Q8ODvxfC3sOjaOxLrAVwHQvr5HDIpvvVdjGVWUF/viTWiDJwp2RuNNvBCcguT47nZPIu4gUSRksNOxDF0b30G/ibXVBUqQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731496640;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=Vt/3xgCafBGQY10RaO1CXj/PchZ3xMnPpyIxrYzqmqs=;
	b=HNjqfJSPtp/WCnmkfaAaS1RCHuzEro53cGXIeR6OL46SwKnuWcHV68/+dAC9XcVj
	FZmkLHk27HQh2PRXGt/ELYboDvQKA/9xq7poTjrnjgnflzqtXXXaa253kBUGNb222at
	qsGhaEKfuuGZcOlDo8G86x6Qrw9az/nJi2n4I8AA=
Received: by mx.zohomail.com with SMTPS id 173149663909913.148234824409542;
	Wed, 13 Nov 2024 03:17:19 -0800 (PST)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH v2 0/2] Documentation: Debugging guide
Date: Wed, 13 Nov 2024 12:17:09 +0100
Message-Id: <20241028-media_docs_improve_v3-v2-0-f1960ae22c5d@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALWKNGcC/4WOwQqDMBBEf6Xk3JRkIyo99T+KSLLZ1gU1kpTQI
 v57o+dCj2+Yx8wqEkWmJK6nVUTKnDjMBeB8EjjY+UmSfWEBCiqtoJUTeba9D5h6npYYMvXZSOMb
 1LXSTaONKK6ziaSLdsZht39Ke2+J9OD3sX/vCg+cXiF+jjtZ7+m/5aylkuC0q9oaAQzdMIyjdSH
 aC4ZJdNu2fQHyO4Z65gAAAA==
To: Jonathan Corbet <corbet@lwn.net>
Cc: bagasdotme@gmail.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
 mchehab@kernel.org, kernel@collabora.com, bob.beckett@collabora.com,
 nicolas.dufresne@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731496634; l=5154;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=BrJUfdQou5rFblk+7sa98eAyvIDDMEqx3lsmQNYSeTg=;
 b=NrGT1vTjUwyTwg+ChqlQarj6ZgO8iW9p0JinCJEedW+xKv4jrHw9CdY3/3XPJSeirv6Rv0GNbsGx
 aUuE1h02DSkMnZCY2sB/A4g8sroBnZuqMiUkaSweU6yvdSy0AjP7
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
Cc: mchehab@kernel.org
Cc: kernel@collabora.com
Cc: bob.beckett@collabora.com
Cc: nicolas.dufresne@collabora.com
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

---
Changes in v2:
- Rebase to docs-next
- Shrink remaining lines to 80 wherever I missed it on the previous version
- Replace italic markup with litteral markup
- Add more detailed description where suggested
- Remove unnecassary labels and jumps
- Remove the separate general advice file again and add its content to the
  index file
- Add links to the process document and the media admin guide
- Remove links from the top page
- Split toc listing in the index file into general and specific
- Improve commit titles
- Link to v1: https://lore.kernel.org/r/20241028-media_docs_improve_v3-v1-0-2b1b486c223e@collabora.com

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
      docs: Add debugging section to process
      docs: Add debugging guide for the media subsystem

 Documentation/admin-guide/media/index.rst          |   5 +
 .../driver_development_debugging_guide.rst         | 214 ++++++++++++++++
 Documentation/process/debugging/index.rst          |  78 ++++++
 .../debugging/media_specific_debugging_guide.rst   | 180 +++++++++++++
 .../debugging/userspace_debugging_guide.rst        | 278 +++++++++++++++++++++
 Documentation/process/index.rst                    |   8 +-
 6 files changed, 760 insertions(+), 3 deletions(-)
---
base-commit: 623e5747c680d3854b6b9882d9907096bc63580d
change-id: 20241028-media_docs_improve_v3-3d7c16017713

Best regards,
-- 
Sebastian Fricke <sebastian.fricke@collabora.com>

