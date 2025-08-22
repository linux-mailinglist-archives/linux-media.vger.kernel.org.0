Return-Path: <linux-media+bounces-40731-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD46FB311E3
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 10:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C4BD5E3C07
	for <lists+linux-media@lfdr.de>; Fri, 22 Aug 2025 08:34:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BDA92EBDD9;
	Fri, 22 Aug 2025 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LgnqeUP/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C121F224225;
	Fri, 22 Aug 2025 08:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755851635; cv=none; b=AnTfuRPAFg1PUm66WG7i5qiSifA41X6mhNzRL3S2E1XanyO7ZIryB2D22BWDq75kibyjlfXvonPDlR+bWl3MHBZRNkUlnw26KU4u+yDJp4L3jZ8aovsfhImEFwjxlP9+o+dhvdU/S2H81LLNJ8Uuz4ZuWGgf9hA2bawGDytsOLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755851635; c=relaxed/simple;
	bh=hZCILAL9RcFUhkEdhO/hcljCTbxz8sP0ZtdxheVHbzk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCupCf83O7MND3YemgycjJxxFoHK9Q7EbyV00nIFT8ClHb0pIUwrEUVBwzvipass8pbrsu0qN7mU5zsb/oRmpB1QKuVFA4ilam+mafgrAcgnzeRxNSp90tXvNooimX7L8jXVSPs3PO4b9vcSmKNI764Pbq9oCnjyoHDeEzgd7Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LgnqeUP/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756DFC4CEF1;
	Fri, 22 Aug 2025 08:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755851635;
	bh=hZCILAL9RcFUhkEdhO/hcljCTbxz8sP0ZtdxheVHbzk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LgnqeUP/tH8uxoHEpSWrMOANOHCB92XjslueMvKTTID9yhxJFe4RRw4YoKWZg8dcB
	 NvK4wMXVya5Xr4gCgI4pWIPtFsR7aRSTEvrvMYB37srU5EyZDnefH/sjDpItnXJjiS
	 eSBAiJnUbr5DTh1s54pAEFUHAym8D0apBN1svARMRv8CYWQOQUI76DJ0hVh4POSgB3
	 COCeu6iC7OkZFp6xdtzmfCQjvZ3bMj1tu2n0y+yL2KzBJFCeIWNgBLWHBfivuppBbJ
	 y1OdyevFl7wlurSZUREAB2ZwJ+EEOoSq2l1zchGdAzM9RrMBiplYKnp/ftX3DBjnep
	 +3VMmaOVzFCvw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1upNDd-0000000C1VG-35nU;
	Fri, 22 Aug 2025 10:33:53 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH v5 5/5] docs: media: profile: make it clearer about maintainership duties
Date: Fri, 22 Aug 2025 10:33:45 +0200
Message-ID: <a17ca9fa81e95aff9167c6f1162b4703178c65c9.1755851331.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1755851331.git.mchehab+huawei@kernel.org>
References: <cover.1755851331.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

During the review of the media committer's profile, it was noticed
that the responsibility for timely review patches was not clear:
such review is expected that all developers listed at MAINTAINERS
with the "M:" tag (e.g. "maintainers" on its broad sense).

This is orthogonal of being a media committer or not. Such duty
is implied at:

	Documentation/admin-guide/reporting-issues.rst

and at the MAINTAINERS header, when it says that even when the
status is "odd fixes", the patches will flow in.

So, let make it explicit at the maintainer-entry-profile that
maintainers need to do timely reviews.

Also, while right now our focus is on granting committer rights to
maintainers, the media-committer model may evolve in the future to
accept other committers that don't have such duties.

So, make it clear at the media-committer.rst that the duties
related to reviewing patches from others are for the drivers
they are maintainers as well.

Reviewed-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/maintainer-entry-profile.rst | 5 +++++
 Documentation/driver-api/media/media-committer.rst          | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index 41a1a2326bef..67a18f82f857 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -177,6 +177,11 @@ b. Committers' workflow: patches are handled by media committers::
 On both workflows, all patches shall be properly reviewed at
 linux-media@vger.kernel.org (LMML) before being merged at media-committers.git.
 
+Such patches will be reviewed timely by the maintainers and reviewers as
+listed in the MAINTAINERS file. The subsystem maintainers will follow one of
+the above workflows, e. g. they will either send a pull request or merge
+patches directly at the media-committers tree.
+
 When patches are picked by patchwork and when merged at media-committers,
 CI bots will check for errors and may provide e-mail feedback about
 patch problems. When this happens, the patch submitter must fix them or
diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
index 3d0987a8a93b..0bc038a0fdcc 100644
--- a/Documentation/driver-api/media/media-committer.rst
+++ b/Documentation/driver-api/media/media-committer.rst
@@ -90,9 +90,9 @@ be a part of their maintenance tasks.
 Due to that, to become a committer or a core committer, a consensus between
 all subsystem maintainers is required, as they all need to trust a developer
 well enough to be delegated the responsibility to maintain part of the code
-and to properly review patches from third parties, in a timely manner and
-keeping the status of the reviewed code at https://patchwork.linuxtv.org
-updated.
+and to properly review patches from third parties for the drivers that they
+maintain in a timely manner and keeping the status of the patches at
+https://patchwork.linuxtv.org updated.
 
 .. Note::
 
-- 
2.50.1


