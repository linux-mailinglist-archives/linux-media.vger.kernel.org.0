Return-Path: <linux-media+bounces-22519-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E403F9E17C6
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 10:36:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B74DF165C00
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 09:36:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D627C1E008C;
	Tue,  3 Dec 2024 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fX4woRI3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3E11DFD9E;
	Tue,  3 Dec 2024 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218558; cv=none; b=TFNXovEsmZbmDQfwaNjDa+auBCS7R9VE80CaBBZiidiubTukry4R3gRe80lR8aQeOFnSldNUChJqhcGgejrDEI3+VENPcszM3y/XAigzfEHBhoIhVLx8VuLc9JtEsLZ5P7ksXnSQ4lwCMz2kyYR0q4cH02NTprMnfP6bauvSxmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218558; c=relaxed/simple;
	bh=UlqrgZNX32gBjaTFgYtp4qGVc28pfjxVMRY2vOsdL3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+j++AmolsV5D2vz/9Eddn9SgXFP1AQwzDKgcsMWa4qkIS1I087aBA9F5v46gHcHhhqsC9tuxQqwvG0eA/XwkAiDmTOXdPdCdZjwQcZLNJ+zQMOA0nlFOv60Kb8Mb4H3Dh1KS6u6CAJmGdl06gKDqA5b9OYml/xE9q4ReFDDVVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fX4woRI3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BD8C4CECF;
	Tue,  3 Dec 2024 09:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733218557;
	bh=UlqrgZNX32gBjaTFgYtp4qGVc28pfjxVMRY2vOsdL3k=;
	h=From:To:Cc:Subject:Date:From;
	b=fX4woRI37SkUiB//HD3HvzxP7c46UEffoVuQW1F3MlOxvi/z2zD64YkuFpmUSV807
	 eSc3BX+bjMqbaf26bUaY/D43qSOUBzNnLn4ot8qxoIEd8HXnh/Ac1NRXX9l1MLWdIx
	 DO43gkm9e33B1F4stGu+KyueeweVDs/FUTFcA8Zxlbfdh0UwoEZnqwniBQPUm6XpTs
	 5rnenbyFMfsNRiV7BqP71URDGzWgK8M7E87KqjNFZe8k5a21vj+CK7jSStO3NiegJv
	 cHkf6GdVa5VtDvNPCA175yQ+oQKTfigLlSU7xIX1zDLiqvafXyi6O6pANxL5dcZMSq
	 JAnkuLiahJW5A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIPK0-00000002ZIf-0kUw;
	Tue, 03 Dec 2024 10:35:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v4 0/5]Document the new media-committer's model
Date: Tue,  3 Dec 2024 10:35:44 +0100
Message-ID: <cover.1733218348.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
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

On this series:

patch 1 adds a reference for PGP kernel keychain, in preparation for
links to it;

patch 2 fix two issues at the media MAINTAINERS file (S: and P:) tags;

patch 3: updates the  media maintainer's entry profile and adds the
workflow that will be used with the new model;

patch 4: adds a new document focused at the new maintainers
process. Its target is for developers that will be granted with
commit rights at the new media-maintainers.git tree. It also
contains a reference tag addition to kernel.org PGP chain
at process/maintainer-pgp-guide.rst.

patch 5: make documents cleared about maintainership duties.

---
v4:
- patches 1 and 2 were split from other patches;
- minor editorial changes as proposed by Hans, Sakari and Ricardo.

v3:
- added patch 3;
- addressed nits pointed by Ricardo during his review;
- did minor editorial changes to improve Sphinx html output.

v2: I tried to address most of the suggestions where there was an agreement
from Laurent's review and further comments. As there were several changes,
on separate threads, I could have missed something.

Mauro Carvalho Chehab (5):
  docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign
  MAINTAINERS: fix a couple issues at media input infrastructure
  docs: media: update maintainer-entry-profile for multi-committers
  docs: media: document media multi-committers rules and process
  docs: media: profile: make it clearer about maintainership duties

 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 252 ++++++++++++----
 .../driver-api/media/media-committer.rst      | 280 ++++++++++++++++++
 .../process/maintainer-pgp-guide.rst          |   2 +
 MAINTAINERS                                   |   3 +-
 5 files changed, 486 insertions(+), 52 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committer.rst

-- 
2.47.1



