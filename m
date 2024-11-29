Return-Path: <linux-media+bounces-22325-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DBE9DC29D
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 12:15:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8060216224D
	for <lists+linux-media@lfdr.de>; Fri, 29 Nov 2024 11:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E9D19924F;
	Fri, 29 Nov 2024 11:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvgqKuG0"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE7C1586C8;
	Fri, 29 Nov 2024 11:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732878909; cv=none; b=k4Mqyzww/hQe1sg39QK6/HZdkRBFqJKdBZWO83kgiDD4nwd+iuzungtQInUWoLRB4iO26tE3WhADN4yz2MhU7fD/T1TyKaN8xcMawbl/dF9kx3Vk1y/vd+N9u3z+dLh6ktUHFGO4GHgR44p2pcCbS6EGq1OI2fFHipcGBNd1P4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732878909; c=relaxed/simple;
	bh=g+vqenjgG+4hoUPvWp7gzWtx2UWJA8zid7qPRdVzQic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W7Cpc6bBqrXRAmZFjeXZx6REKKDWYjhdY++FKaF4x6ZzChX8emcGmK5WW+uSWMEuOcu4iZg3RQHnPZup9vdXZaAW9atM6Ma1VcfIDOzXDIbzq6ihbGwIQ/kq2GPdQ4Zchjv+gJUy/Kmf7nwkveFBoO7kZ9R1LggCitJZ7kjFhbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvgqKuG0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79BCC4CECF;
	Fri, 29 Nov 2024 11:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732878908;
	bh=g+vqenjgG+4hoUPvWp7gzWtx2UWJA8zid7qPRdVzQic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YvgqKuG0Soc1Wk4Wc5eyjw23Lt4felx0dsImAN+kpiQ3SkqbiylSov7kjuKz2cAPu
	 Vpx5HzFKFjcCmxlczOEp0VwOgTLXAWeMzBVHzn8Q0X3cqCMWyYLLHKWvOoFohiGNUf
	 JG2H7xOGvRJDyqqrEWnVu3I6srHkrjL6zwIJec4WuZwLPuO376zCze1/OwsS22iPAk
	 L4xfDCy33jYKLh7I2neyd/D+/vbE1j0zte5eMczxmwDheyG7RW0sMdsldOIf7dlNnr
	 2kFlF3ks2HS6nda8HVVZDp2DDBDtZobstwqhKVuyZavs9eLdhGlcyIiUcDDGMlfLH7
	 6YGHoURdAlzGg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tGxM0-0000000AVUW-2opx;
	Fri, 29 Nov 2024 10:32:00 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4ll.nl>
Subject: [PATCH v2 1/2] docs: media: update maintainer-entry-profile for multi-committers
Date: Fri, 29 Nov 2024 10:31:45 +0100
Message-ID: <99e1b9df713827ce2e6c21073276c97030071a07.1732872169.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1732872169.git.mchehab+huawei@kernel.org>
References: <cover.1732872169.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As the media subsystem will experiment with a multi-committers model,
update the Maintainer's entry profile to the new rules.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>
---
 .../media/maintainer-entry-profile.rst        | 203 ++++++++++++++----
 MAINTAINERS                                   |   1 +
 2 files changed, 158 insertions(+), 46 deletions(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index ffc712a5f632..47f15fad7f9f 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -27,19 +27,133 @@ It covers, mainly, the contents of those directories:
 Both media userspace and Kernel APIs are documented and the documentation
 must be kept in sync with the API changes. It means that all patches that
 add new features to the subsystem must also bring changes to the
-corresponding API files.
+corresponding API documentation files.
 
-Due to the size and wide scope of the media subsystem, media's
-maintainership model is to have sub-maintainers that have a broad
-knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
-task to review the patches, providing feedback to users if the patches are
+Due to the size and wide scope of the media subsystem, the media's
+maintainership model is to have committers that have a broad knowledge of
+a specific aspect of the subsystem. It is the committers' task to
+review the patches, providing feedback to users if the patches are
 following the subsystem rules and are properly using the media kernel and
 userspace APIs.
 
-Patches for the media subsystem must be sent to the media mailing list
-at linux-media@vger.kernel.org as plain text only e-mail. Emails with
-HTML will be automatically rejected by the mail server. It could be wise
-to also copy the sub-maintainer(s).
+Media committers
+----------------
+
+In the media subsystem, there are experienced developers who can push
+patches directly to the development tree. These developers are called
+Media committers and are divided into the following categories:
+
+- Committers: responsible for one or more drivers within the media subsystem.
+  They can push changes to the tree that do not affect the core or ABI.
+
+- Core committers: responsible for part of the media core. They are typically
+  responsible for one or more drivers within the media subsystem, but, besides
+  that, they can also merge patches that change the code common to multiple
+  drivers, including the kernel internal API.
+
+- Subsystem maintainers: responsible for the subsystem as a whole, with
+  access to the entire subsystem.
+
+  Only subsystem maintainers can push changes that affect the userspace
+  API/ABI.
+
+Media committers shall explicitly agree with the Kernel development process
+as described at Documentation/process/index.rst and to the Kernel
+development rules inside the Kernel documentation, including its code of
+conduct.
+
+Media development tree
+----------------------
+
+The main development tree used by the media subsystem is hosted at LinuxTV.org,
+where we also maintain news about the subsystem, wiki pages and a patchwork
+instance where we track patches though their lifetime.
+
+The main tree used by media developers is at:
+
+https://git.linuxtv.org/media.git/
+
+.. _Media development workflow:
+
+Media development workflow
+++++++++++++++++++++++++++
+
+All changes for the media subsystem must be sent first as e-mails to the
+media mailing list, following the process documented at
+Documentation/process/index.rst.
+
+It means that patches shall be submitted as plain text only via e-mail to:
+
+  `https://subspace.kernel.org/vger.kernel.org.html <linux-media@vger.kernel.org>`_
+
+Emails with HTML will be automatically rejected by the mail server.
+
+It could be wise to also copy the media committer(s). You should use
+``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
+Please always copy driver's authors and maintainers.
+
+Such patches need to be based against a public branch or tag as follows:
+
+1. Patches for new features need to be based at the ``next`` branch of
+   media.git tree;
+
+2. Fixes against an already released kernel should preferably be against
+   the latest released Kernel. If they require a previously-applied
+   change at media.git tree, they need to be against its ``fixes`` branch.
+
+3. Fixes for issues not present at the latest released kernel should
+   preferably be against the latest -rc1 Kernel. If they require a
+   previously-applied change at media.git tree, they need to be against
+   its ``fixes`` branch.
+
+Patches with fixes shall have:
+- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
+- when applicable, a ``Cc: stable@vger.kernel.org``.
+
+Patches that were fixing bugs publicly reported by someone at the
+linux-media@vger.kernel.org mailing list shall have:
+- a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.
+
+Patches that change API shall update documentation accordingly at the
+same patch series.
+
+See Documentation/process/index.rst for more details about e-mail submission.
+
+Once a patch is submitted, it may follow either one of the following
+workflows:
+
+a. Pull request workflow: patches are handled by subsystem maintainers::
+
+     +------+   +---------+   +-------+   +-----------------------+   +---------+
+     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-->|media.git|
+     +------+   |picks it |   |request|   |in media-committers.git|   +---------+
+                +---------+   +-------+   +-----------------------+
+
+   For this workflow, pull requests can be generated by a committer,
+   a previous committer, subsystem maintainers or by a couple of trusted
+   long-time contributors. If you are not in such group, please don't submit
+   pull requests, as they will likely be ignored.
+
+b. Committers' workflow: patches are handled by media committers::
+
+     +------+   +---------+   +--------------------+   +-----------+   +---------+
+     |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|-->|media.git|
+     +------+   |picks it |   |media-committers.git|   |approval   |   +---------+
+                +---------+   +--------------------+   +-----------+
+
+On both workflows, all patches shall be properly reviewed at
+linux-media@vger.kernel.org before being merged at media-committers.git.
+
+When patches are picked by patchwork and when merged at media-committers,
+CI bots will check for errors and may provide e-mail feedback about
+patch problems. When this happens, the patch submitter must fix them
+and send another version of the patch.
+
+Patches will only be moved to the next stage in those two workflows if they
+don't fail on CI or if there are false-positives in the CI reports.
+
+Failures during e-mail submission
++++++++++++++++++++++++++++++++++
 
 Media's workflow is heavily based on Patchwork, meaning that, once a patch
 is submitted, the e-mail will first be accepted by the mailing list
@@ -47,51 +161,49 @@ server, and, after a while, it should appear at:
 
    - https://patchwork.linuxtv.org/project/linux-media/list/
 
-If it doesn't automatically appear there after a few minutes, then
+If it doesn't automatically appear there after some time [2]_, then
 probably something went wrong on your submission. Please check if the
-email is in plain text\ [2]_ only and if your emailer is not mangling
+email is in plain text\ [3]_ only and if your emailer is not mangling
 whitespaces before complaining or submitting them again.
 
-You can check if the mailing list server accepted your patch, by looking at:
+To troubleshoot problems, you should first check if the mailing list
+server has accepted your patch, by looking at:
 
    - https://lore.kernel.org/linux-media/
 
-.. [2] If your email contains HTML, the mailing list server will simply
+If the patch is there and not at patchwork, it is likely that your e-mailer
+mangled the patch. Patchwork internally has a logic that checks if the
+received e-mail contain a valid patch. Any whitespace and new line
+breakages mangling the patch won't be recognized by patchwork, thus such
+patch will be rejected.
+
+.. [2] It usually takes a few minutes for the patch to arrive, but
+       the e-mail server may be busy, so it may take up to a few hours
+       for a patch to be picked by patchwork.
+
+.. [3] If your email contains HTML, the mailing list server will simply
        drop it, without any further notice.
 
+.. _media-developers-gpg:
 
-Media maintainers
-+++++++++++++++++
+Authentication for pull and merge requests
+++++++++++++++++++++++++++++++++++++++++++
 
-At the media subsystem, we have a group of senior developers that
-are responsible for doing the code reviews at the drivers (also known as
-sub-maintainers), and another senior developer responsible for the
-subsystem as a whole. For core changes, whenever possible, multiple
-media maintainers do the review.
+The authenticity of developers submitting pull requests and merge requests
+shall be validated by using PGP sign, via the
+:ref:`kernel_org_trust_repository`.
 
-The media maintainers that work on specific areas of the subsystem are:
+With the pull request workflow, pull requests shall use a GPG-signed tag.
 
-- Remote Controllers (infrared):
-    Sean Young <sean@mess.org>
+For more details about PGP sign, please read
+Documentation/process/maintainer-pgp-guide.rst.
 
-- HDMI CEC:
-    Hans Verkuil <hverkuil@xs4all.nl>
+Subsystem maintainers
+---------------------
 
-- Media controller drivers:
-    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-
-- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
-    Sakari Ailus <sakari.ailus@linux.intel.com>
-
-- V4L2 drivers and core V4L2 frameworks:
-    Hans Verkuil <hverkuil@xs4all.nl>
-
-The subsystem maintainer is:
-  Mauro Carvalho Chehab <mchehab@kernel.org>
-
-Media maintainers may delegate a patch to other media maintainers as needed.
-On such case, checkpatch's ``delegate`` field indicates who's currently
-responsible for reviewing a patch.
+The subsystem maintainers are:
+  - Mauro Carvalho Chehab <mchehab@kernel.org> and
+  - Hans Verkuil <hverkuil@xs4all.nl>
 
 Submit Checklist Addendum
 -------------------------
@@ -108,17 +220,14 @@ implementing the media APIs:
 ====================	=======================================================
 Type			Tool
 ====================	=======================================================
-V4L2 drivers\ [3]_	``v4l2-compliance``
+V4L2 drivers\ [4]_	``v4l2-compliance``
 V4L2 virtual drivers	``contrib/test/test-media``
 CEC drivers		``cec-compliance``
 ====================	=======================================================
 
-.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
+.. [4] The ``v4l2-compliance`` also covers the media controller usage inside
        V4L2 drivers.
 
-Other compilance tools are under development to check other parts of the
-subsystem.
-
 Those tests need to pass before the patches go upstream.
 
 Also, please notice that we build the Kernel with::
@@ -134,6 +243,8 @@ Where the check script is::
 Be sure to not introduce new warnings on your patches without a
 very good reason.
 
+Please see `Media development workflow`_ for e-mail submission rules.
+
 Style Cleanup Patches
 +++++++++++++++++++++
 
@@ -199,7 +310,7 @@ tree between -rc6 and the next -rc1.
 Please notice that the media subsystem is a high traffic one, so it
 could take a while for us to be able to review your patches. Feel free
 to ping if you don't get a feedback in a couple of weeks or to ask
-other developers to publicly add Reviewed-by and, more importantly,
+other developers to publicly add ``Reviewed-by:`` and, more importantly,
 ``Tested-by:`` tags.
 
 Please note that we expect a detailed description for ``Tested-by:``,
diff --git a/MAINTAINERS b/MAINTAINERS
index 6db07b8fa215..f9bdef1b5966 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14193,6 +14193,7 @@ MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+P:	Documentation/driver-api/media/maintainer-entry-profile.rst
 W:	https://linuxtv.org
 Q:	http://patchwork.kernel.org/project/linux-media/list/
 T:	git git://linuxtv.org/media_tree.git
-- 
2.47.0


