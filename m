Return-Path: <linux-media+bounces-51631-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIi/KIWfeGn4rQEAu9opvQ
	(envelope-from <linux-media+bounces-51631-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:20:37 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518593832
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A82A9302D587
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 608F53469F8;
	Tue, 27 Jan 2026 11:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjeMNMFI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9786283FE3
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512722; cv=none; b=fAbC7ByJ/d4vDdoCrjonM4nxTdcJHYqfCvvnryTZrkQ2ALAguKAF9D9ajDf4NpIM3mY7AgIFNh8oRctKiBHZPdVlau3o8Jp5lYs33EwfYtB5HKj9LsBRiRwk/mNpeaeWz0vRMqMnimvzziY7LcGlnWS9g3MnhcIsSyq0nTZITpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512722; c=relaxed/simple;
	bh=c2cDFudqFx+HNvWVxRh28kX9xZK/oto1w5fY7RYvWF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bhDCrR07enzOOr3nFytThWTOesuTi39QjlkqaJs3JVUyXZ9WNbBdxKbDIyTHlQ44Sg8i0TcEYq8t9RvWp57hvnECc6j5jd9yXqxT+UhOkg0PGSo+ZcFO1lR1WGJ+NrAB2EWiWBy3I6gxVYdLUH+DcGn64pa1Kf7rYVBEEenmGpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjeMNMFI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ADFEC19425;
	Tue, 27 Jan 2026 11:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769512722;
	bh=c2cDFudqFx+HNvWVxRh28kX9xZK/oto1w5fY7RYvWF8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CjeMNMFIVkbY1nKEsZMLdvPntO053p0L21eI1LNSdDRzP0aiQGoboJl17uCuVzsag
	 3vxA8hBugxZSRMZ7xcv+hZLp1vMnU32HrpPF9S6Diy/aciU3kO0jxXqGSpgtMaTAXz
	 AopccDRKbVRtU6JN+ZDt3inW/BB0zX9LujnrqAas+V871nCyV6N5KS8ATlA5jivhS5
	 YZfgy19pawfaqLjX/tOzhNqSt0Qzl22rgSD6yqoQTQWXl/DWmvCMrrg1c3lSurhilO
	 SKz7sylDOnKc4ku+p4aqDWjtR8VoVtK2tc14vdvJ3ItC2swXAO+zCPtZkKBaJjSBT8
	 lx9EwNG6xssJQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [PATCHv7 1/3] docs: media: update maintainer-entry-profile for multi-committers
Date: Tue, 27 Jan 2026 11:53:25 +0100
Message-ID: <4478ae7ad952117a76b648ee2db7f8f92775ddf7.1769511207.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1769511207.git.hverkuil+cisco@kernel.org>
References: <cover.1769511207.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-51631-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gitlab.freedesktop.org:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mess.org:email,patchwork.readthedocs.io:url]
X-Rspamd-Queue-Id: 1518593832
X-Rspamd-Action: no action

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As the media subsystem will experiment with a multi-committers model,
update the Maintainer's entry profile to the new rules.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sean Young <sean@mess.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 .../media/maintainer-entry-profile.rst        | 382 +++++++++++++++---
 1 file changed, 321 insertions(+), 61 deletions(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index 2127e5b15e8f..be4728b97759 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -4,19 +4,25 @@ Media Subsystem Profile
 Overview
 --------
 
-The media subsystem covers support for a variety of devices: stream
-capture, analog and digital TV streams, cameras, remote controllers, HDMI CEC
-and media pipeline control.
+The Linux Media Community (aka: the LinuxTV Community) is formed of
+developers working on Linux Kernel Media Subsystem, together with users
+who also play an important role in testing the code.
 
-It covers, mainly, the contents of those directories:
+The Media Subsystem has code to support a wide variety of media-related
+devices: stream capture, analog and digital TV streams, cameras,
+video codecs, video processing (resizers, etc.), radio, remote controllers,
+HDMI CEC and media pipeline control.
+
+The Media Subsystem consists of the following directories in the kernel
+tree:
 
   - drivers/media
   - drivers/staging/media
+  - include/media
+  - Documentation/devicetree/bindings/media/\ [1]_
   - Documentation/admin-guide/media
   - Documentation/driver-api/media
   - Documentation/userspace-api/media
-  - Documentation/devicetree/bindings/media/\ [1]_
-  - include/media
 
 .. [1] Device tree bindings are maintained by the
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS maintainers
@@ -27,19 +33,271 @@ It covers, mainly, the contents of those directories:
 Both media userspace and Kernel APIs are documented and the documentation
 must be kept in sync with the API changes. It means that all patches that
 add new features to the subsystem must also bring changes to the
-corresponding API files.
+corresponding API documentation.
 
-Due to the size and wide scope of the media subsystem, media's
-maintainership model is to have sub-maintainers that have a broad
-knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
-task to review the patches, providing feedback to users if the patches are
-following the subsystem rules and are properly using the media kernel and
-userspace APIs.
+Media Maintainers
+-----------------
 
-Patches for the media subsystem must be sent to the media mailing list
-at linux-media@vger.kernel.org as plain text only e-mail. Emails with
-HTML will be automatically rejected by the mail server. It could be wise
-to also copy the sub-maintainer(s).
+Due to the size and wide scope of the media subsystem, multiple layers of
+maintainers are required, each with their own areas of expertise:
+
+- Media Driver Maintainer:
+    Responsible for one or more drivers within the Media Subsystem. You
+    are listed in the MAINTAINERS file as maintainer for those drivers. Media
+    Driver Maintainers review patches for those drivers, provide feedback if
+    the patches are not following the subsystem rules, or are not using the
+    media kernel or userspace APIs correctly, or have poor code quality.
+
+    If you are the author of the patches, then you work with other Media
+    Maintainers to ensure your patches are reviewed.
+
+    Some Media Driver Maintainers have additional responsibilities.  They have
+    been granted patchwork access and keep
+    `patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
+    up to date, decide when patches are ready for merging, and create Pull
+    Requests for the Media Subsystem Maintainers to merge.
+
+    Such Media Driver Maintainers are not just someone who is capable of creating code,
+    but someone who has demonstrated their ability to collaborate with the team,
+    get the most knowledgeable people to review code, contribute high-quality code,
+    and follow through to fix issues (in code or tests).
+
+- Media Core Maintainer:
+    Media Driver Maintainers with patchwork access who are also responsible for
+    one or more media core frameworks.
+
+    Core framework changes are done via consensus between the relevant Media
+    Core Maintainers. Media Maintainers may include core framework changes in
+    their Pull Requests if they are signed off by the relevant Media Core
+    Maintainers.
+
+- Media Subsystem Maintainers:
+    Media Core Maintainers who are also responsible for the subsystem as a whole,
+    with access to the entire subsystem. Responsible for merging Pull Requests
+    from other Media Maintainers.
+
+    Userspace API/ABI changes are done via consensus between Media Subsystem
+    Maintainers\ [2]_. Media Maintainers may include API/ABI changes in
+    their Pull Requests if they are signed off by the all Media Subsystem
+    Maintainers.
+
+All Media Maintainers shall explicitly agree with the Kernel development process
+as described at Documentation/process/index.rst and to the Kernel
+development rules inside the Kernel documentation, including its code of
+conduct.
+
+Media Maintainers are reachable via the #linux-media IRC channel at OFTC.
+
+.. [2] Everything that would break backward compatibility with existing
+       non-kernel code are API/ABI changes. This includes ioctl and sysfs
+       interfaces, v4l2 controls, and their behaviors.
+
+Patchwork Access
+----------------
+
+All Media Maintainers who have been granted patchwork access shall ensure that
+`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
+will reflect the current status, e.g. patches shall be delegated to the Media
+Maintainer who is handling them and the patch status shall be updated according
+to these rules:
+
+- ``Under Review``: Used if the patch requires a second opinion
+  or when it is part of a pull request;
+- ``Accepted``: Once a patch is merged in the multi-committer tree.
+- ``Superseded``: There is a newer version of the patch posted to the
+  mailing list.
+- ``Duplicated``: There was another patch doing the same thing from someone
+  else that was accepted.
+- ``Not Applicable``: Use for patch series that are not merged at media.git
+  tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to the
+  linux-media mailing list.
+
+If a Media Maintainer decides not to accept a patch, then reply by email to
+the patch authors, explaining why it is not accepted, and
+`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_ shall be
+updated accordingly with either:
+
+- ``Changes Requested``: if a new revision was requested;
+- ``Rejected``: if the proposed change is not acceptable at all.
+
+.. Note::
+
+   Patchwork supports a couple of clients to help semi-automating
+   status updates via its REST interface:
+
+   https://patchwork.readthedocs.io/en/latest/usage/clients/
+
+For those patches that fall in your area of responsibility you alse decide
+when those patches are ready for merging, and create Pull Requests for the
+Media Subsystem Maintainers to merge.
+
+The most important aspect of becoming a Media Maintainer with patchwork access
+is that you have demonstrated the ability to give good code reviews. So we are
+looking for whether or not we think you will be good at doing that.
+
+As such, potential maintainers must earn enough credibility and trust from the
+Linux Media Community. To do that, developers shall be familiar with the open
+source model and have been active in the Linux Kernel community for some time,
+and, in particular, in the media subsystem.
+
+In addition to actually making the code changes, you are basically
+demonstrating your:
+
+- commitment to the project;
+- ability to collaborate with the team and communicate well;
+- understand of how upstream and the Linux Media Community work
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
+Media Driver Maintainers that desire to get patchwork access are encouraged
+to participate at the yearly Linux Media Summit, typically co-located with
+a Linux related conference. These summits are announced on the linux-media
+mailing list.
+
+If you are doing such tasks and have become a valued developer, an
+existing Media Maintainer can nominate you to the Media Subsystem Maintainers.
+
+The ultimate responsibility for accepting a nominated maintainer is up to
+the subsystem's maintainers. The nominated maintainer must have earned a trust
+relationship with all Media Subsystem Maintainers, as, by being granted patchwork
+access, you will take over part of their maintenance tasks.
+
+Media development tree
+----------------------
+
+The main development tree used by the media subsystem is hosted at
+https://gitlab.freedesktop.org/linux-media/.
+https://linuxtv.org/ hosts news about the subsystem,
+`wiki <https://www.linuxtv.org/wiki/index.php/Main_Page>`_ pages
+and a `patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
+instance where we track patches though their lifetime.
+
+The main tree used by media developers is at:
+
+https://gitlab.freedesktop.org/linux-media/media-committers.git
+
+Please note that this tree can be rebased, although only as a last resort.
+
+.. _Media development workflow:
+
+Media development workflow
+++++++++++++++++++++++++++
+
+All changes for the media subsystem shall be sent first as e-mails to the
+media mailing list, following the process documented at
+Documentation/process/index.rst.
+
+It means that patches shall be submitted as plain text only via e-mail to
+linux-media@vger.kernel.org (aka: LMML). While subscription is not mandatory,
+you can find details about how to subscribe to it and to see its archives at:
+
+  https://subspace.kernel.org/vger.kernel.org.html
+
+Emails with HTML will be automatically rejected by the mail server.
+
+It could be wise to also copy the Media Maintainer(s). You should use
+``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
+Please always copy driver's authors and maintainers.
+
+To minimize the chance of merge conflicts for your patch series, and make
+easier to backport patches to stable Kernels, we recommend that you use the
+following baseline for your patch series:
+
+1. Features for the next mainline release:
+
+   - baseline shall be the media-committers.git ``next`` branch;
+
+2. Bug fixes for the next mainline release:
+
+   - baseline shall be the media-committers.git ``next`` branch. If the
+     changes depend on a fix from the media-committers.git
+     ``fixes`` branch, then you can use that as baseline.
+
+3. Bug fixes for the current mainline release (-rcX):
+
+   - baseline shall be the latest mainline -rcX release or the
+     media-committers.git ``fixes`` branch if changes depend on a mainline
+     fix that is not yet merged;
+
+.. Note::
+
+   See https://www.kernel.org/category/releases.html for an overview
+   about Kernel release types.
+
+Patches with fixes shall have:
+
+- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
+- when applicable, a ``Cc: stable@vger.kernel.org``.
+
+Patches that were fixing bugs publicly reported by someone at the
+linux-media@vger.kernel.org mailing list shall have:
+
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
+a. Media Maintainers' workflow: Media Maintainers post the PRs, which are
+   handled by the Media Subsystem Maintainers::
+
+     +-------+   +------------+   +------+   +-------+   +----------------------------+
+     |e-mail |-->|picked up by|-->|code  |-->|pull   |-->|Subsystem Maintainers merge |
+     |to LMML|   |patchwork   |   |review|   |request|   |in media-committers.git     |
+     +-------+   +------------+   +------+   +-------+   +----------------------------+
+
+   For this workflow, pull requests are generated by Media Maintainers with
+   patchwork access.  If you do not have patchwork access, then please don't
+   submit pull requests, as they will not be processed.
+
+b. Media Committers' workflow: patches are handled by Media Maintainers with
+   commit rights::
+
+     +-------+   +------------+   +------+   +--------------------------+
+     |e-mail |-->|picked up by|-->|code  |-->|Media Committers merge in |
+     |to LMML|   |patchwork   |   |review|   |media-committers.git      |
+     +-------+   +------------+   +------+   +--------------------------+
+
+When patches are picked up by
+`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
+and when merged at media-committers,
+Media CI bots will check for errors and may provide e-mail feedback about
+patch problems. When this happens, the patch submitter must fix them or
+explain why the errors are false positives.
+
+Patches will only be moved to the next stage in these two workflows if they
+pass on Media CI or if there are false-positives in the Media CI reports.
+
+For both workflows, all patches shall be properly reviewed at
+linux-media@vger.kernel.org (LMML) before being merged in media-committers.git.
+Media patches will be reviewed in a timely manner by the maintainers and
+reviewers as listed in the MAINTAINERS file.
+
+Media Maintainers shall request reviews from other Media Maintainers and
+developers where applicable, i.e. because those developers have more
+knowledge about some areas that are changed by a patch.
+
+There shall be no open issues or unresolved or conflicting feedback
+from anyone. Clear them up first. Defer to the Media Subsystem
+Maintainers if needed.
+
+Failures during e-mail submission
++++++++++++++++++++++++++++++++++
 
 Media's workflow is heavily based on Patchwork, meaning that, once a patch
 is submitted, the e-mail will first be accepted by the mailing list
@@ -47,51 +305,53 @@ server, and, after a while, it should appear at:
 
    - https://patchwork.linuxtv.org/project/linux-media/list/
 
-If it doesn't automatically appear there after a few minutes, then
+If it doesn't automatically appear there after some time [3]_, then
 probably something went wrong on your submission. Please check if the
-email is in plain text\ [2]_ only and if your emailer is not mangling
+email is in plain text\ [4]_ only and if your emailer is not mangling
 whitespaces before complaining or submitting them again.
 
-You can check if the mailing list server accepted your patch, by looking at:
+To troubleshoot problems, you should first check if the mailing list
+server has accepted your patch, by looking at:
 
    - https://lore.kernel.org/linux-media/
 
-.. [2] If your email contains HTML, the mailing list server will simply
+If the patch is there and not at
+`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_,
+it is likely that your e-mailer
+mangled the patch. Patchwork internally has logic that checks if the
+received e-mail contains a valid patch. Any whitespace and new line
+breakages mangling the patch won't be recognized by
+`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_,
+and such a patch will be rejected.
+
+.. [3] It usually takes a few minutes for the patch to arrive, but
+       the e-mail server may be busy, so it may take up a longer time
+       for a patch to be picked by
+       `patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_.
+
+.. [4] If your email contains HTML, the mailing list server will simply
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
+shall be validated by using PGP signing at some moment.
+See: :ref:`kernel_org_trust_repository`.
 
-The media maintainers that work on specific areas of the subsystem are:
+With the pull request workflow, pull requests shall use PGP-signed tags.
 
-- Remote Controllers (infrared):
-    Sean Young <sean@mess.org>
+For more details about PGP signing, please read
+Documentation/process/maintainer-pgp-guide.rst.
 
-- HDMI CEC:
-    Hans Verkuil <hverkuil@kernel.org>
+Subsystem Media Maintainers
+---------------------------
 
-- Media controller drivers:
-    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-
-- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
-    Sakari Ailus <sakari.ailus@linux.intel.com>
-
-- V4L2 drivers and core V4L2 frameworks:
-    Hans Verkuil <hverkuil@kernel.org>
-
-The subsystem maintainer is:
-  Mauro Carvalho Chehab <mchehab@kernel.org>
-
-Media maintainers may delegate a patch to other media maintainers as needed.
-On such case, checkpatch's ``delegate`` field indicates who's currently
-responsible for reviewing a patch.
+The subsystem maintainers are:
+  - Mauro Carvalho Chehab <mchehab@kernel.org>
+  - Hans Verkuil <hverkuil@kernel.org>
 
 Submit Checklist Addendum
 -------------------------
@@ -106,18 +366,15 @@ that should be used in order to check if the drivers are properly
 implementing the media APIs:
 
 ====================	=======================================================
-Type			Tool
+Type			Utility
 ====================	=======================================================
-V4L2 drivers\ [3]_	``v4l2-compliance``
+V4L2 drivers\ [5]_	``v4l2-compliance``
 V4L2 virtual drivers	``contrib/test/test-media``
 CEC drivers		``cec-compliance``
 ====================	=======================================================
 
-.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
-       V4L2 drivers.
-
-Other compliance tools are under development to check other parts of the
-subsystem.
+.. [5] The ``v4l2-compliance`` utility also covers the media controller usage
+       inside V4L2 drivers.
 
 Those tests need to pass before the patches go upstream.
 
@@ -134,6 +391,8 @@ Where the check script is::
 Be sure to not introduce new warnings on your patches without a
 very good reason.
 
+Please see `Media development workflow`_ for e-mail submission rules.
+
 Style Cleanup Patches
 +++++++++++++++++++++
 
@@ -183,23 +442,24 @@ In particular, we accept lines with more than 80 columns:
 Key Cycle Dates
 ---------------
 
-New submissions can be sent at any time, but if they intend to hit the
+New submissions can be sent at any time, but if they are intended to hit the
 next merge window they should be sent before -rc5, and ideally stabilized
 in the linux-media branch by -rc6.
 
 Review Cadence
 --------------
 
-Provided that your patch is at https://patchwork.linuxtv.org, it should
-be sooner or later handled, so you don't need to re-submit a patch.
+Provided that your patch has landed in
+`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_, it
+should be sooner or later handled, so you don't need to re-submit a patch.
 
-Except for bug fixes, we don't usually add new patches to the development
-tree between -rc6 and the next -rc1.
+Except for important bug fixes, we don't usually add new patches to the
+development tree between -rc6 and the next -rc1.
 
 Please notice that the media subsystem is a high traffic one, so it
 could take a while for us to be able to review your patches. Feel free
 to ping if you don't get a feedback in a couple of weeks or to ask
-other developers to publicly add Reviewed-by and, more importantly,
+other developers to publicly add ``Reviewed-by:`` and, more importantly,
 ``Tested-by:`` tags.
 
 Please note that we expect a detailed description for ``Tested-by:``,
-- 
2.51.0


