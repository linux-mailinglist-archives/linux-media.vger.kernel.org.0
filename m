Return-Path: <linux-media+bounces-12184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 848468D3C25
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 18:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39060287A42
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2024 16:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD69A1836FD;
	Wed, 29 May 2024 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="v40g8Krd"
X-Original-To: linux-media@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AD91836DF;
	Wed, 29 May 2024 16:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716999787; cv=none; b=MgO7XDz6Rz8jyX02mMPWorh9r46m3aYv9eszVRbSwopxVRGWHgDXTaVn/N0DzNdkyaoNajWbSkIJGlFdZSeDqaRCAt5gDKWGJbbXeGye3UP5fxKKbQ2HAzMgYoKGdolKQvkyGgryDuSOtaNJvG9iYUc441RaNbJnb9rqH/tyX1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716999787; c=relaxed/simple;
	bh=XGj/g7iOHJl/Awga7F8/WFGN8LmsmDCvK9/ziiAot/U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o2HcYgSKdgXxOMIl1eFB9+rsI1WFs+h/Lonml5vrNGoWaa/GStdr8a7hfVcClgNhQzpoGWN9UpjGe83Bkuz9AHl52CRw8Bi0QNe1d6pL2nbn/uNUeBoQRAevL15ADMIFiVniu10p8+jPBV0fmGJ/mwjrhPqfqz+w+tD7uz226ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=v40g8Krd; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716999783;
	bh=XGj/g7iOHJl/Awga7F8/WFGN8LmsmDCvK9/ziiAot/U=;
	h=From:Subject:Date:To:Cc:From;
	b=v40g8KrdmQ491KZ7Xniy4WCqzGAxw9T3cF3NCy5TyA/YFiq0ApiiJmAaHbJo42c1S
	 2MMm7IYCrdeG3j8LRlredviXxwbIYQePrkXqUeWHxo+E2fg76zSVLgdLX5uDh3rYvT
	 BCuwM/drC50hHxkiwp92ErcANu6IIl6AAgyclL4nxCWxU8QzQ43H8j1b72rGO78Xe5
	 DWHhseSHE6QQEQaIMSbMmag1xWGtfy3OyDZWamhD5EyLB47ew4eN/DPogcVCNxJ5hS
	 ez71p52gprzbnu9srVk9iJhZkcZbxPv6YhqgpXWo0i9RLrIGfk+UMKgbx74Rv3rRW/
	 Lha7bPZKX/DsA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4D2053782109;
	Wed, 29 May 2024 16:23:03 +0000 (UTC)
From: Sebastian Fricke <sebastian.fricke@collabora.com>
Subject: [PATCH RFC 0/2] Documentation: Debugging guide
Date: Wed, 29 May 2024 18:22:56 +0200
Message-Id: <20240529-b4-media_docs_improve-v1-0-9ddb111c4433@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGBWV2YC/x2NywrCMBAAf6Xs2YUYI7ZehX6AV5GSx2oX2qTsY
 hFK/93gcQaG2UBJmBSuzQZCKyuXXOF4aCCOPr8JOVUGa6wzZ9thcDhTYj+kEnXgeZGyEl468ja5
 1rj2BLUNXgmD+BzHWufPNFW5CL34+5894N7f4LnvP0DSKiOBAAAA
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil-cisco@xs4all.nl, mauro.chehab@linux.intel.com, kernel@collabora.com,
 Sebastian Fricke <sebastian.fricke@collabora.com>
X-Mailer: b4 0.11.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716999782; l=2682;
 i=sebastian.fricke@collabora.com; s=linux-media; h=from:subject:message-id;
 bh=XGj/g7iOHJl/Awga7F8/WFGN8LmsmDCvK9/ziiAot/U=;
 b=mC9XGCbAiXfVgn8zVFK7wfffxkYQJr/2N7cXGV68S0Sw/E5DRXgmbg5ZBxCdxaFA58W+YgFgFc29
 4bDMTIztBb68Jg/lNfE/rwpDNS6s5riFlxWLAcSU4EkqmTRlA48W
X-Developer-Key: i=sebastian.fricke@collabora.com; a=ed25519;
 pk=pYXedPwrTtErcj7ERYeo/IpTrpe4QbJuEzSB52fslBg=

The RFC contains a new summary page for all media related documentation. This
is inspired by other subsystems, which first of all allows a user to find the
subsystem under the subsystems page and secondly eases general navigation
through the documentation that is sprinkled onto multiple places.

Additionally, it provides a guide on how to debug code in the media subsystem.

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
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com
Cc: hverkuil-cisco@xs4all.nl
Cc: mauro.chehab@linux.intel.com
Cc: kernel@collabora.com
Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>

---
Sebastian Fricke (2):
      docs: media: Create separate documentation folder for media
      docs: media: Debugging guide for the media subsystem

 Documentation/media/guides/debugging_issues.rst | 477 ++++++++++++++++++++++++
 Documentation/media/guides/index.rst            |  11 +
 Documentation/media/index.rst                   |  20 +
 Documentation/subsystem-apis.rst                |   1 +
 4 files changed, 509 insertions(+)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240529-b4-media_docs_improve-79ea2d480483

Best regards,
-- 
Sebastian Fricke <sebastian.fricke@collabora.com>

