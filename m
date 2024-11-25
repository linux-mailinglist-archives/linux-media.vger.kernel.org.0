Return-Path: <linux-media+bounces-21992-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D68A49D8867
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 15:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CBB0CB34898
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2024 13:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EDC21AB6FA;
	Mon, 25 Nov 2024 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sZqjq/bX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B1E2B9B7;
	Mon, 25 Nov 2024 13:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732541364; cv=none; b=EnD8LLYiMg8RJ/1CSUEPr1E0OtmB39WMOnPx7n4bgouU1zyBVhqsB1i+t6m/WUaHQZVwNoJYyTQWDq8fokXSJALRCgGA1FbcB7MJpMCG0xHbN4CqZvU0vj7ZbtQ1+kPT6vFrMMtyjt7hvpbIGkHvSkms4Zmf7MqjcLHyPtv7mSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732541364; c=relaxed/simple;
	bh=wZ/ToZoCnbDhH0zW73Uf040oZnHyBPEMRNcg6jvsBvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=No13mqMjcqv8RpFCSU+J7j8K0m5nti2190AG9U5lXC8C12mbJp1mJJDfAfsrrmYVa294VVqmyQ/Q/Os0P73jdwAL3M3Y4aYE7GmzrIs/sGv76jV/7VEjjpXvsnsBecLFZ5CMe4QN5RiC4BOH9YMwswK7M7CtNOdNyzzls/FpoQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sZqjq/bX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4444C4CECF;
	Mon, 25 Nov 2024 13:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732541364;
	bh=wZ/ToZoCnbDhH0zW73Uf040oZnHyBPEMRNcg6jvsBvg=;
	h=From:To:Cc:Subject:Date:From;
	b=sZqjq/bXr+36Eucn6V0N14cURfXm1mUqYKQuPtx0SstWZEfDB/5EJsbIlU4FXx3br
	 02zVhx31E60O40LrUnBNM+QLEhfu/LEEcKmBIdJ1lijRLoeP3qfzm7BfNF26xcu6lK
	 w1M0o3MhoWJC7zQyUghcBwBuJYjK7tAZRHapB+KN/3qpgdc5mpsyMpwJyU3LIwuTbV
	 Ky++GoBYhxCPHvu9pjp53oWFPsnduPULsXEexFXdgsCOPsugHsbCK+1aWfuQcoenTc
	 ghh6mBEy/Fud39e+r99IdLP878e5+9okiqcBfjjTDg2hBIA18xtJ4tCiDCkgsqLhT4
	 s3xU1JZHES8WA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tFZ9T-00000008Pei-2uni;
	Mon, 25 Nov 2024 14:29:19 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4ll.nl>
Subject: [PATCH] docs: media: document media multi-committers rules and process
Date: Mon, 25 Nov 2024 14:28:58 +0100
Message-ID: <6a3e19d75e504ebbf9cd9212faad12c005dfdfb8.1732541337.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As the media subsystem will experiment with a multi-committers model,
update the Maintainer's entry profile to the new rules, and add a file
documenting the process to become a committer and to maintain such
rights.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>
---
 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 193 ++++++++++----
 .../driver-api/media/media-committer.rst      | 252 ++++++++++++++++++
 .../process/maintainer-pgp-guide.rst          |   2 +
 4 files changed, 398 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committer.rst

diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
index d5593182a3f9..d0c725fcbc67 100644
--- a/Documentation/driver-api/media/index.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -26,6 +26,7 @@ Documentation/userspace-api/media/index.rst
     :numbered:
 
     maintainer-entry-profile
+    media-committer
 
     v4l2-core
     dtv-core
diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index ffc712a5f632..90c6c0d9cf17 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -27,19 +27,128 @@ It covers, mainly, the contents of those directories:
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
+In the media subsystem, there are experienced developers that can commit
+patches directly on a development tree. These developers are called
+Media committers and are divided into the following categories:
+
+- Committers: responsible for one or more drivers within the media subsystem.
+  They can upload changes to the tree that do not affect the core or ABI.
+
+- Core committers: responsible for part of the media core. They are typically
+  responsible for one or more drivers within the media subsystem, but, besides
+  that, they can also merge patches that change the code common to multiple
+  drivers, including the kernel internal API/ABI.
+
+- Subsystem maintainers: responsible for the subsystem as a whole, with
+  access to the entire subsystem.
+
+  Only subsystem maintainers can change the userspace API/ABI.
+
+Media committers shall explicitly agree with the Kernel development process
+as described at Documentation/process/index.rst and to the Kernel
+development rules inside the Kernel documentation, including its code of
+conduct.
+
+More details about media committers can be found here:
+Documentation/driver-api/media/media-committer.rst.
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
+media mailing list, as plain text only e-mail to:
+
+  `https://subspace.kernel.org/vger.kernel.org.html <linux-media@vger.kernel.org>`_
+
+Emails with HTML will be automatically rejected by the mail server.
+It could be wise to also copy the media committer(s). You should use
+``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
+Please always copy driver's authors and maintainers.
+
+Such patches needed to be based against a public branch or tag as follows:
+
+1. new Kernel releases:
+
+   Those need to be based at the ``next`` branch of that media.git tree
+
+2. During Kernel release development cycle, patches fixing bugs on a -rc
+   kernel should preferably be against the latest -rc1 Kernel. If they
+   require a previously-applied change, they need to be against the ``fixes``
+   branch;
+
+3. Patches against an already released kernel should preferably be  against
+   the latest released Kernel. If they require a previously-applied
+   change, they need to be against ``fixes``.
+
+All patches with fixes shall have:
+   - a ``Fixes:`` tag pointing to the first commit that introduced the bug;
+   - a ``Cc: stable@vger.kernel.org``
+
+Patches that were fixing bugs reported by someone else shall have:
+  - a ``Reported-by`` tag immediately followed by a ``Closes`` tag.
+
+Patches that change API/ABI shall require patches to update documentation
+accordingly at the same patch series.
+
+See Documentation/process/index.rst for more details about e-mail submission.
+
+Once a patch is submitted, it may follow either one of the workflows
+below:
+
+a. Normal workflow: patches are handled by subsystem maintainers::
+
+     +------+   +---------+   +-------+   +-------------------+   +---------+
+     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge  |-->|media.git|
+     +------+   +---------+   |request|   |at media-committers|   +---------+
+                              +-------+   +-------------------+
+
+   For this workflow, pull requests can be generated by a committer,
+   a previous committer, subsystem maintainers or by a couple of trusted
+   long-time contributors. If you are not in such group, please don't submit
+   pull requests, as they will likely be ignored.
+
+b. Committers' workflow: patches are handled by media committers::
+
+     +------+   +---------+   +-------------------+   +-----------+   +---------+
+     |e-mail|-->|patchwork|-->|committers merge   |-->|maintainers|-->|media.git|
+     +------+   +---------+   |at media-committers|   |approval   |   +---------+
+                              +-------------------+   +-----------+
+
+When patches are merged at patchwork and when merged at media-committers,
+CI bots will check for errors and may provide e-mail feedback about
+patch problems. When this happens, the e-mail author must fix them
+and send another version of the patch.
+
+Patches will only be moved to the next stage in those two workflows if they
+don't fail on CI or if there are false-positives at the CI reports.
+
+Failures during e-mail submission
++++++++++++++++++++++++++++++++++
 
 Media's workflow is heavily based on Patchwork, meaning that, once a patch
 is submitted, the e-mail will first be accepted by the mailing list
@@ -47,51 +156,36 @@ server, and, after a while, it should appear at:
 
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
+       the e-mail server is busy, so it may take up to a few hours
+       for a patch to be handled by the mail server and by the patchwork
+       instance.
+
+.. [3] If your email contains HTML, the mailing list server will simply
        drop it, without any further notice.
 
+Subsystem maintainers
+---------------------
 
-Media maintainers
-+++++++++++++++++
-
-At the media subsystem, we have a group of senior developers that
-are responsible for doing the code reviews at the drivers (also known as
-sub-maintainers), and another senior developer responsible for the
-subsystem as a whole. For core changes, whenever possible, multiple
-media maintainers do the review.
-
-The media maintainers that work on specific areas of the subsystem are:
-
-- Remote Controllers (infrared):
-    Sean Young <sean@mess.org>
-
-- HDMI CEC:
-    Hans Verkuil <hverkuil@xs4all.nl>
-
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
+  Mauro Carvalho Chehab <mchehab@kernel.org> and
+  Hans Verkuil <hverkuil@xs4all.nl>
 
 Submit Checklist Addendum
 -------------------------
@@ -108,17 +202,14 @@ implementing the media APIs:
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
@@ -134,6 +225,8 @@ Where the check script is::
 Be sure to not introduce new warnings on your patches without a
 very good reason.
 
+Please see `Media development workflow`_ for e-mail submission rules.
+
 Style Cleanup Patches
 +++++++++++++++++++++
 
diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
new file mode 100644
index 000000000000..27b85a37fb2b
--- /dev/null
+++ b/Documentation/driver-api/media/media-committer.rst
@@ -0,0 +1,252 @@
+Media committers
+================
+
+What is a media committer?
+--------------------------
+
+A media committer is a developer who can apply patches from other developers
+and their own patches at the
+`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_
+tree.
+
+It is a media committer's duty to ensure that their entries at the MAINTAINERS
+file will be kept updated, and that submitted patches for files for which
+they are listed as maintainers are timely reviewed at the mailing list,
+not waiting in patchwork as ``New`` for more than one Kernel merge cycle,
+and, if accepted, applying them at the media committer's tree.
+
+This privilege is granted with some expectation of responsibility:
+committers are people who care about the Linux Kernel as a whole and
+about the Linux media subsystem and want to help its development. It
+is also based on a trust relationship between the rest of the committers,
+maintainers and the LinuxTV community.
+
+As such, a media committer is not just someone who is capable of creating
+code, but someone who has demonstrated their ability to collaborate
+with the team, get the most knowledgeable people to review code,
+contribute high-quality code, and follow through to fix issues (in code
+or tests).
+
+.. Note::
+
+   1. If a patch introduced a regression, then it is the media committer's
+      responsibility to correct that as soon as possible. Typically the
+      patch is either reverted, or an additional patch is committed that
+      fixes the regression;
+   2. if patches are fixing bugs against already released Kernels, including
+      the reverts above mentioned, the media committer shall add the needed
+      tags.  Please see :ref:`Media development workflow` for more details.
+   3. all patches should be properly reviewed at
+      linux-media@vger.kernel.org before being merged at the
+      media-committers tree or submitted on pull requests.
+
+Becoming a media committer
+--------------------------
+
+The most important aspect of volunteering to be a committer is that you will
+be able to review and approve other people's changes, so we are looking for
+whether we think you will be good at doing that.
+
+As such, potential committers must earn enough credibility and trust from the
+LinuxTV community. To do that, developers shall be familiar with the open
+source model and have been active at the Linux Kernel community for some time,
+and, in particular, with the media subsystem.
+
+So, in addition to actually making the code changes, you are basically
+demonstrating your:
+
+- commitment to the project;
+- ability to collaborate with the team and communicate well;
+- understand of how upstream and the LinuxTV community  works
+  (policies, processes for testing, code review, ...)
+- reasonable knowledge about:
+
+  - the Kernel development process:
+    Documentation/process/index.rst
+
+  - the Media development profile:
+    Documentation/driver-api/media/maintainer-entry-profile.rst
+
+- understanding of the projects' code base and coding style;
+- ability to provide feedback to the patch authors;
+- ability to judge when a patch might be ready for review and to submit;
+- ability to write good code (last but certainly not least).
+
+It is also desirable that developers that intend to become committers
+make a best effort to attend the yearly Linux Media Summit, typically
+co-located with another Linux conference.
+
+If you are doing such tasks and have become a valued developer, an
+existing committer can nominate you to the media subsystem maintainers.
+
+The ultimate responsibility for accepting a nominated committer is up to
+the subsystem's maintainers. The committers must earn a trust relationship
+with all subsystem maintainers, as, by granting you commit rights, they will
+be delegating part of their maintenance tasks.
+
+Due to that, to become a committer or a core committer, a consensus between
+all subsystem maintainers is required, as they all need to trust a developer
+well enough to be delegated the responsibility to maintain part of the code
+and to properly review patches from third parties, in a timely manner and
+keeping the status of the reviewed code at https://patchwork.linuxtv.org
+updated.
+
+.. Note::
+
+   In order to preserve the developers that could have their commit rights
+   granted or denied as well as the subsystem maintainers who have the
+   task to accept or deny commit rights, all communication related to
+   nominating a committer, preserving commit rights or leaving such function
+   should happen in private as much as possible.
+
+Media committer's agreement
+---------------------------
+
+Once a nominated committer is accepted by all subsystem maintainers,
+they will ask if the developer is interested in the nomination and discuss
+what area(s) of the media subsystem the committer will be responsible for.
+
+Once the developer accepts being a committer, the new committer shall
+explicitly accept the Kernel development policies described under its
+Documentation/, and, in particular to the rules on this document, by writing
+an e-mail to media-committers@linuxtv.org, with a declaration of intent
+following the model below::
+
+   I, John Doe, would like to change my status to: Committer
+
+   I intend to actively develop the XYZ driver, send fixes to drivers
+   that I can test, reviewing patches and merging trivial fixes
+   for the subsystem, ...
+
+Followed by a formal declaration of agreement with the Kernel development
+rules, signed with a PGP key cross signed by other Kernel and media
+developers. Such declaration shall be::
+
+   I hereby declare that I agree with the Kernel development rules described at:
+
+   https://www.kernel.org/doc/html/latest/driver-api/media/media-committer.rst
+
+   and to the Linux Kernel development process rules.
+
+   I agree to the Code of Conduct as documented here:
+   Documentation/process/code-of-conduct.rst
+
+   I am aware that I can, at any point of time, retire. In that case, I will
+   send an e-mail to notify the subsystem maintainers for them to revoke my
+   commit rights.
+
+   I am aware that the Kernel development rules change over time.
+   By doing a new commit, I understand that I agree with the rules in effect
+   at the time of the commit.
+
+For more details about PGP sign, please read
+Documentation/process/maintainer-pgp-guide.rst and
+:ref:`kernel_org_trust_repository`.
+
+In case the kernel development process changes, by merging new commits at the
+`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
+the media committer implicitly declares that the agreement with the latest
+version of the documented process and to the contents of this file.
+
+Core committers
+---------------
+
+As described in Documentation/driver-api/media/maintainer-entry-profile.rst
+a committer may be granted with additional privileges to also be able to
+change a core file and/or media subsystem's Kernel API/ABI. The extent of
+the core committer's additional privileges will be detailed by the subsystem
+maintainers when they nominate a core committer.
+
+Existing committers may become core committers and vice versa. Such
+decisions will be taken in consensus between the subsystem maintainers.
+
+Media committers rules
+----------------------
+
+Media committers shall ensure that merged patches will not break any existing
+drivers. If it breaks, fixup or revert patches shall be merged as soon as
+possible, aiming to be merged at the same Kernel cycle the bug is reported.
+
+Media committers shall behave accordingly to the permissions granted by
+the subsystem maintainers, specially with regards of the scope of changes
+they may apply directly at the media-committers tree. Such scope can
+change overtime on a mutual greement between media committers and
+maintainers.
+
+As described at :ref:`Media development workflow`, there are workflows.
+For the committers' workflow, the following rules apply:
+
+- Each merged patch shall pass CI tests;
+
+- Media committers shall request reviews from other committers were
+  applicable, i.e. because those committers have more knowledge about
+  some areas that are changed by a patch;
+
+- No other media committer would be against the proposed changes.
+
+Patches that do not fall under the committer's workflow criteria will follow
+the normal workflow as described at :ref:`Media development workflow`.
+
+Only a subsystem maintainer can override such rules.
+
+All media committers shall ensure that patchwork will reflect the current
+status, e.g. patches shall be delegated to the media committer who is
+handling them and the patch status shall be updated according to these rules:
+
+- ``Under review``: Used if the patch requires a second opinion
+  or when it is part of a pull request;
+- ``Accepted``: Once a patch is merged at the multi-committer tree.
+- ``Superseded``: There is a newer version of the patch posted in the
+  mailing list.
+- ``Duplicated``: There was another patch doing the same thing from someone
+  else that was accepted.
+- ``Not Applicable``: Use for patch series that are not merged at media.git
+  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to the
+  linux-media mailing list.
+
+If the committer decides not to merge it, then reply by email to patch
+authors, explaining why it is not merged, and patchwork shall be updated
+accordingly with either:
+
+- ``Changes Requested``: if a new revision was requested;
+- ``Rejected``: if the proposed change won't be merged upstream.
+
+If a media committer decides to retire, it is the committer's duty to
+notify the subsystem maintainers about that decision.
+
+Maintaining media committer status
+----------------------------------
+
+A community of committers working together to move the Linux Kernel
+forward is essential to creating successful projects that are rewarding
+to work on. If there are problems or disagreements within the community,
+they can usually be solved through healthy discussion and debate.
+
+In the unhappy event that a media committer continues to disregard good
+citizenship (or actively disrupts the project), we may need to revoke
+that person's status. In such cases, if someone suggests the revocation with
+a good reason, other developers may second the motion. The final decision
+is taken by the subsystem maintainers. As the decision to become a media
+committer comes from a consensus between subsystem maintainers, a single
+subsystem maintainer not trusting the media committer anymore is enough to
+revoke committer's privileges.
+
+If a committer is inactive for more than a couple of Kernel cycles,
+maintainers will try to reach you via e-mail. If not possible, they may
+revoke your committer privileges and update MAINTAINERS file entries
+accordingly. If you wish to resume contributing later on, then contact
+the subsystem maintainers to ask if your rights can be restored.
+
+A previous committer that had his commit rights revoked can keep contributing
+to the subsystem via the normal e-mail workflow as documented at the
+:ref:`Media development workflow`.
+
+References
+----------
+
+Much of this was inspired by/copied from the committer policies of:
+
+- `Chromium <https://chromium.googlesource.com/chromium/src/+/main/docs/contributing.md>`_;
+- `WebKit <http://www.google.com/url?q=http%3A%2F%2Fwebkit.org%2Fcoding%2Fcommit-review-policy.html&sa=D&sntz=1&usg=AFrqEze4W4Lvbhue4Bywqgbv-N5J66kQgA>`_;
+- `Mozilla <http://www.google.com/url?q=http%3A%2F%2Fwww.mozilla.org%2Fhacking%2Fcommitter%2F&sa=D&sntz=1&usg=AFrqEzecK7iiXqV30jKibNmmMtzHwtYRTg>`_.
+
diff --git a/Documentation/process/maintainer-pgp-guide.rst b/Documentation/process/maintainer-pgp-guide.rst
index f5277993b195..795ef8d89271 100644
--- a/Documentation/process/maintainer-pgp-guide.rst
+++ b/Documentation/process/maintainer-pgp-guide.rst
@@ -903,6 +903,8 @@ the new default in GnuPG v2). To set it, add (or modify) the
 
     trust-model tofu+pgp
 
+.. _kernel_org_trust_repository:
+
 Using the kernel.org web of trust repository
 --------------------------------------------
 
-- 
2.47.0


