Return-Path: <linux-media+bounces-22414-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6679DFD13
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:27:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9B8F281E05
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 09:27:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2771FBC90;
	Mon,  2 Dec 2024 09:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F5l/qRl+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EF081FA827;
	Mon,  2 Dec 2024 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131600; cv=none; b=j/CPDHnjQeZVUKuXF/xTg9aUJPL4Cjke+fq2WW1Pkm4RdBB4rOnHm0yzz/7/1N56rDOuwSWvbvWLaIkxXJw0Z72TE9NTXNv5lCkWUpKj98XqYM5KGtqwPtdIOqhlD2CJDnl0y6yZqRLjyS8WQOwoKueI0W3FBGSDyYOBJ8LygQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131600; c=relaxed/simple;
	bh=xBQ8oSIh/eaNimiONFdFxIWJQ9Y/yhxzyAi7eFAhXY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uunw+BmWjU88YCnAF+1XfQ3pbmngFqgQGm4aOzi7E5rDSkFSVPWuDxWX6ik+Gec7ffBjiJF5bhdg0r531ohCbr7XtCHxkBOVaPNknq26ThNzIOTNaLxborcp4N9XY6C4IkRXmfqF20K9QGWCEft2D1Z0SuSkxCR2RfJlgRhkEsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F5l/qRl+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14490C4CEDC;
	Mon,  2 Dec 2024 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733131600;
	bh=xBQ8oSIh/eaNimiONFdFxIWJQ9Y/yhxzyAi7eFAhXY0=;
	h=From:To:Cc:Subject:Date:From;
	b=F5l/qRl+xxXCPV5ykx/hY22GvnAcHNkbWjppGYMabgBJuvnli46msAkXDDajFr7OB
	 i+ZiAZnAI0Z7f91X0Iz6/fTziH/zS/jN6iwwnD+vLCWdgGCGQ04otVPV2HN+rTnyon
	 dOobXhb6ZOWxhKPiTxMh0iqXrcVQqjR2BZMBQaz6nvRWZSVy6Wv3952tFOFCQxIM80
	 /zLvxZF+8VbyYDw/0s8YFdqaaPyQty6ysFA2wfN/tVlkpa4TzAr4hRGbeM+4wPQBWQ
	 RznTh7uqPlIJ3+9DTt9qiB1E63hVwXQDXIovnGRnViMgg/lTPM35db+CHLOQEyU1Me
	 ODSOnPGzxF59w==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tI2hS-00000001tEH-08ti;
	Mon, 02 Dec 2024 10:26:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org
Subject: [PATCH v3 0/3] Document the new media-committer's model
Date: Mon,  2 Dec 2024 10:26:18 +0100
Message-ID: <cover.1733131405.git.mchehab+huawei@kernel.org>
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

On this series,:

patch 1: updates the  media maintainer's entry profile and adds the
workflow that will be used with the new model. While here, it also
adds a missing "P:" tag at the MAINTAINERS file, pointing to it;

patch 2: adds a new document focused at the new maintainers
process. Its target is for developers that will be granted with
commit rights at the new media-maintainers.git tree. It also
contains a reference tag addition to kernel.org PGP chain
at process/maintainer-pgp-guide.rst.

patch 3: make documents cleared about maintainership duties.

---

v3:
- added patch 3;
- addressed nits pointed by Ricardo during his review;
- did minor editorial changes to improve Sphinx html output.

v2: I tried to address most of the suggestions where there was an agreement
from Laurent's review and further comments. As there were several changes,
on separate threads, I could have missed something.


Mauro Carvalho Chehab (3):
  docs: media: update maintainer-entry-profile for multi-committers
  docs: media: document media multi-committers rules and process
  docs: media: profile: make it clearer about maintainership duties

 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 219 +++++++++++---
 .../driver-api/media/media-committer.rst      | 278 ++++++++++++++++++
 .../process/maintainer-pgp-guide.rst          |   2 +
 MAINTAINERS                                   |   1 +
 5 files changed, 456 insertions(+), 45 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committer.rst

-- 
2.47.1



