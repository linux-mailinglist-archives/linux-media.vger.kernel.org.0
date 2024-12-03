Return-Path: <linux-media+bounces-22520-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B179E17C8
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 10:36:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C1DE284EE5
	for <lists+linux-media@lfdr.de>; Tue,  3 Dec 2024 09:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A5E81E0488;
	Tue,  3 Dec 2024 09:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OzByEBuA"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E4D1DFE07;
	Tue,  3 Dec 2024 09:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218558; cv=none; b=NhfsayW4WzOpIU5rp5hjzA03WdVN9FPk4LvRqAlMMeoxu7SINlvJnAKT6DAQ21pK5xNdSPwEInBlsVvbIuvGPGleCu1CcljEox6Kiq31uPKUWKfj3pHx5I5wC0Mmug+hZexccVonpERRcz1cF5xUxHIqWIl0QkuDDDHXTFU5pMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218558; c=relaxed/simple;
	bh=a8DOKAbHHk3Uoi98wRsfxUMOehnt2Xr/DWBiY9unq5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IwY3b8o606m1YZvLD9YyVM0Y+qD4l1llI7syE2dcF1I9fKkpzlPjbgwKHSuHMRs9Mg4CUq6ink4bORtWztRi0e/yDDvj0HXc2nqxhOgUmEqjGkDzc7NG56FSlIlOH+JFWVoA1D98AM1ioGK2NZXHlIwsot1bGnQJNzcVF0mX3rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OzByEBuA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57363C4CECF;
	Tue,  3 Dec 2024 09:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733218558;
	bh=a8DOKAbHHk3Uoi98wRsfxUMOehnt2Xr/DWBiY9unq5Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OzByEBuA1gRLIgTyuFUtUbv0qEFmB80uw6hlvCRr3MhMD6+ZyG3TgVRh/o6PuzwV6
	 UWibBdDCqGCdNXAe+hIbRC/cVQ3QBFfeQV/jRoXccKqhPzxR7XbqQhz4RYPRmZDBkX
	 qjhEFyxw54dL4pJVMPs9jPU0p8SuBBjwOUH75Uy7jrvNGkoaKypIATHY9D1Mt2hLKm
	 9jjlq8nI4YM0lZPILcJTJOZmF4TDBh33+LG0xVUotEqjXI/RVwE0MD9yrQX6qooDOp
	 Uqyh43eCQb+ysJnyfyzT2aO20mKLn8lnDyogjjlkdQD01PRtwZ5jR97Fn1cU7sav1W
	 8Z98W45LVRvVQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tIPK0-00000002ZIy-1Is6;
	Tue, 03 Dec 2024 10:35:56 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v4 5/5] docs: media: profile: make it clearer about maintainership duties
Date: Tue,  3 Dec 2024 10:35:49 +0100
Message-ID: <f74d32eba4c1799fe7fd407a3889a3de91fb09f2.1733218348.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733218348.git.mchehab+huawei@kernel.org>
References: <cover.1733218348.git.mchehab+huawei@kernel.org>
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/media/maintainer-entry-profile.rst | 5 +++++
 Documentation/driver-api/media/media-committer.rst          | 6 +++---
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index fa28059f7b3f..87b71f89b1df 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -173,6 +173,11 @@ b. Committers' workflow: patches are handled by media committers::
 On both workflows, all patches shall be properly reviewed at
 linux-media@vger.kernel.org (LMML) before being merged at media-committers.git.
 
+Such patches will be reviewed timely by the maintainers and reviewers as
+listed in the MAINTAINERS file. The subsystem maintainers will follow one of
+the above workflows, e. g. they will either send a pull request or merge
+patches directly at the media-committers tree.
+
 When patches are picked by patchwork and when merged at media-committers,
 CI bots will check for errors and may provide e-mail feedback about
 patch problems. When this happens, the patch submitter must fix them, or
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
2.47.1


