Return-Path: <linux-media+bounces-22326-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E2A9DC2A0
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A0FC7162FA7
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA4EF199EA1;
	Fri, 29 Nov 2024 11:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMcjRQ6c"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344DD198E91;
	Fri, 29 Nov 2024 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732878918; cv=none; b=Lf39qAKmG6tGEgeySYe21rZZ0hSkIbdxkTykvbNJ1u+CnYqQ+cH/ySBvdCV8D25iABEiiPElHllU1PBt29YKasfprHk0DJXbEvVrcvOmzOd9c4pxrnEowUOyNP7J04fmX9EuCK6Ev6qhmJtCPyouC0/3ryKDDq7m4h/x2m+rv78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732878918; c=relaxed/simple;
	bh=gjYdudLtdSA4ACPGCI5TFz1EP5AcaY9/zGZORmH1pCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JxhRe5za6beWiPTfO3Gckq8jmd3OKNNDIiv9sWVGXm0INYP+meXOd4x7wnSSUl0IP2/dsFWN43Zk+WUcOnVutc8tFWgIZbxSaLr3hEJLnAW16IM6mbIa+RgpC4t/RvczwJsGo/LxxHt4pKrkWkxbRPeJbgUweZoKn3pB1mNwOrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZMcjRQ6c; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B334CC4CECF;
	Fri, 29 Nov 2024 11:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732878917;
	bh=gjYdudLtdSA4ACPGCI5TFz1EP5AcaY9/zGZORmH1pCQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ZMcjRQ6cK6TZZmP6TLS7hJ74pms+RkoMpqsANyyfaUI7uDWSZWl+M6/e8BIUUiOis
	 ZmFqQYcK6ABc95/7ofZRL2Pnv8NUv1ydQ4v7yOaSH1xlUAFuxizjxcYFNJ/JTV8Trs
	 hmHQ4bIO/f7+BjqAEUkT/Xudui0IIMT1m+jMZ4NWa5IcgQdRMesoye0ghVTkmVmXWZ
	 TShPJdi/rw+IpXmWx8Vw0643cEugYzwCIKifVJlOZH9Y9alad2MPfKW9Z8jl0tCV1m
	 z5IMWO8CKwfOB+uuudsX59EcYEbtLckBFxcCZ9jTzjPfQ0+N/mIhXxRWqu0Nf9hZZM
	 7Q86gQXn64YYw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tGxM0-0000000AVUT-2hkC;
	Fri, 29 Nov 2024 10:32:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v2 0/2] Document the new media-committer's model
Date: Fri, 29 Nov 2024 10:31:44 +0100
Message-ID: <cover.1732872169.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The media subsystem used to have a multi-commiter's model in the
past, but things didn't go well on that time, and we had to move to
a centralized model.

As the community has evolved, and as there are now new policies in
place like CoC, let's experiment with a multi-committers again.

The model we're using was inspired by the DRM multi-committers
model. Yet, media subsystem is different on several aspects, so the
model is not exactly the same.

The implementation will be in phases. For this phase, the goal is that 
all committers will be people listed at MAINTAINERS.

On this series,:

patch 1: updates the  media maintainer's entry profile and adds the
workflow that will be used with the new model. While here, it also
adds a missing "P:" tag at the MAINTAINERS file, pointing to it;

patch 2: adds a new document focused at the new maintainers
process. Its target is for developers that will be granted with
commit rights at the new media-maintainers.git tree. It also
contains a reference tag addition to kernel.org PGP chain
at process/maintainer-pgp-guide.rst.

---

v2: I tried to address most of the suggestions where there was an agreement
from Laurent's review and further comments. As there were several changes,
on separate threads, I could have missed something.

Mauro Carvalho Chehab (2):
  docs: media: update maintainer-entry-profile for multi-committers
  docs: media: document media multi-committers rules and process

 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 209 ++++++++++---
 .../driver-api/media/media-committer.rst      | 278 ++++++++++++++++++
 .../process/maintainer-pgp-guide.rst          |   2 +
 MAINTAINERS                                   |   1 +
 5 files changed, 446 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committer.rst

-- 
2.47.0



