Return-Path: <linux-media+bounces-22412-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DABB9DFD11
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 10:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB549B2228B
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 09:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C891FAC3B;
	Mon,  2 Dec 2024 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGR07+Ud"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785D1F9F63;
	Mon,  2 Dec 2024 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733131600; cv=none; b=XnVhM8onXaVgzSfnc8FtWIVjANqoKo/jlAVmJ0zDPN1V8tyr0lEQ+4ig0u23u+DKEd1Moa7nVfW07RMjv6Lls5Ji2ctBLjargLoNVKWQTEo95l/a5TQg2fGJ87rSdmbLcwhQRVWXVuDLjmFMtjjuknXzzGbXE64hljELDjaihQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733131600; c=relaxed/simple;
	bh=bheRIX8zIm0wt6vBYeWJdGigJom8rK0L93vFskTrmnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxCbSLaVVEZGd5K6lGQ0mD9wNheSan1nzEq8OS18a1xmfMu+Vw9ilCYR3muv7UjO+4OBrS9vzGCvMyp2mrP7rEIXjwnYut6Qt5sBZ0Rh3i/j3htZss56pp16RPWxFo52ceDf0QqMv/aTApizxMWZLMSluI2iT53JJTT2n/vtu+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGR07+Ud; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FE4CC4CEDB;
	Mon,  2 Dec 2024 09:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733131600;
	bh=bheRIX8zIm0wt6vBYeWJdGigJom8rK0L93vFskTrmnU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IGR07+Udj0sXkKQp663jRqGe0quJntmo5OzlZJ3E5OuLNnx+uo3PApEdUr0QCHAXo
	 Tou6GqinZ3LalXRaNKjh7u5wPtZzNnwmY0Mr4qZRQuUJsNrK5ITqOfr85iilPJglI3
	 G9pOfBnITSBpUS3hos37yaROHM0cbzpF5TCiV4ztOJ51Bo421jaP0D2WjJhaZVBkdM
	 rbp3yqBSF1wBw1XCfptNqD0DntLcX/BRrVRRG4kfmOd71vBW7YEfg1AZPceOjclq+L
	 L26PfyLJXsBguHppz5CLCgNqVx0YhIyqcilQmxHi4MWgV8HElPXxJ6oZ6U/35k4HuK
	 pLAXY8s8GNsXw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tI2hS-00000001tES-0Vs4;
	Mon, 02 Dec 2024 10:26:38 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] docs: media: profile: make it clearer about maintainership duties
Date: Mon,  2 Dec 2024 10:26:21 +0100
Message-ID: <f47082a84e0c799dd047525d4bc351eb3a759e83.1733131405.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733131405.git.mchehab+huawei@kernel.org>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

During the review of the media committes profile, it was noticed
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
index 705209eacf58..50568c744129 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -153,6 +153,11 @@ b. Committers' workflow: patches are handled by media committers::
 On both workflows, all patches shall be properly reviewed at
 linux-media@vger.kernel.org before being merged at media-committers.git.
 
+Such patches will be timely-reviewed by developers listed as maintainers at
+the MAINTAINERS file. Such maintainers will follow one of the above
+workflows, e. g. they will either send a pull request or merge patches
+directly at the media-committers tree.
+
 When patches are picked by patchwork and when merged at media-committers,
 CI bots will check for errors and may provide e-mail feedback about
 patch problems. When this happens, the patch submitter must fix them, or
diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
index 3c2f8f413307..ec81f01db126 100644
--- a/Documentation/driver-api/media/media-committer.rst
+++ b/Documentation/driver-api/media/media-committer.rst
@@ -87,9 +87,9 @@ be delegating part of their maintenance tasks.
 Due to that, to become a committer or a core committer, a consensus between
 all subsystem maintainers is required, as they all need to trust a developer
 well enough to be delegated the responsibility to maintain part of the code
-and to properly review patches from third parties, in a timely manner and
-keeping the status of the reviewed code at https://patchwork.linuxtv.org
-updated.
+and to properly review patches from third parties for the drivers they are
+maintainers in a timely manner and keeping the status of the reviewed code
+at https://patchwork.linuxtv.org updated.
 
 .. Note::
 
-- 
2.47.1


