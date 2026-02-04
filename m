Return-Path: <linux-media+bounces-52192-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAgFOAJag2mJlQMAu9opvQ
	(envelope-from <linux-media+bounces-52192-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 15:38:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C9CE736E
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 15:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 737FD300E462
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 14:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3618841B36B;
	Wed,  4 Feb 2026 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVpFEoCI"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2C241B357;
	Wed,  4 Feb 2026 14:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770215880; cv=none; b=nPNNQYxwO/e+AMEfdtKDayFe9sml9Rm9RaIjEIGjLKPb13VZrw5OV8KaBo+lP73D7yV3Fr0ksC0OcoXW4ru92nzgVKSNvXHLWJzn/xFJZxFz2gon0cB3F3dORMxBl+5gWC0L+wZKnYygtYB8i4m7UgqT9uzua/T/zpQpsANwXDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770215880; c=relaxed/simple;
	bh=40/oXbEippShMwoqrAFjzhHc6sw5JO/FxzN/6A16TF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tCRfUkbaUmtJtVjJgLpEGOrWdvORVerKzYmtvY8jI+TPeGn/LZFDB7JUnlDCQ/5sQC3VN1EqPv7QYGiyYTRIJ94GoVXBlvOuMYxhUVkjvCDlZTQSThkje6rIti01DaMoW6uYAs8bH/M3TlXPt6N8IRccjZJ1L4U0Dr2Jo10eKqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVpFEoCI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7853C116C6;
	Wed,  4 Feb 2026 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770215880;
	bh=40/oXbEippShMwoqrAFjzhHc6sw5JO/FxzN/6A16TF0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVpFEoCIUyEdHGPCxh2Lw/dudkEbstFlOvPu8dvZoKVJF5t5t6ZG6we1e2f6KYYUM
	 rj3UYuQKmUePlZpl7QmgYPRLKcbtgXZUKVKudJwu47FIJvIGHCgt7a3JXbA1sjzOTj
	 v5WM7hjfUI7eHYEKF9pGjjm2ZQxvcPeIAYx1X0fR9Fl4iUOffuxG+cFrpATlLqnL3b
	 lGxG7TAi1RRmHibHonaxdQkKZetlhwtiMJKiIVYKGcQlOurHqNd5OqwBcI+8Uo+p8m
	 DXterDtD836j6XhMszlgNAXvsAPACEg+y0VtXMG+eUgu8DGpVhW3ZdeEq5YrMLDyxO
	 7FeGc1R1zUemQ==
Received: from localhost ([::1])
	by mail.kernel.org with esmtp (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vne0z-00000005RPX-13sb;
	Wed, 04 Feb 2026 15:37:57 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Young <sean@mess.org>
Subject: [PATCH 1/2] docs: media: maintainer-entry-profile: do some editorial reviews
Date: Wed,  4 Feb 2026 15:37:44 +0100
Message-ID: <dc12b2f42304866ccc04053f2a3c97e84c7558a1.1770215865.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769511207.git.hverkuil+cisco@kernel.org>
References: <cover.1769511207.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52192-lists,linux-media=lfdr.de,huawei];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,linuxtv.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,patchwork.readthedocs.io:url]
X-Rspamd-Queue-Id: E6C9CE736E
X-Rspamd-Action: no action

Do some editorial improvements to the Media Subsystem Profile
documentation:

- Some English fixups and cleanups;
- Capitalize patchwork;
- Uncapitalize pull requests, as other occurrences are in lower case;
- Added bold markups to the 3 types of media maintainers;
- ensure that the document uses 80 chars per line;

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../media/maintainer-entry-profile.rst        | 157 +++++++++---------
 1 file changed, 80 insertions(+), 77 deletions(-)

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index 0024f85101b7..bb95611f0a84 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -4,7 +4,7 @@ Media Subsystem Profile
 Overview
 --------
 
-The Linux Media Community (aka: the LinuxTV Community) is formed of
+The Linux Media Community (aka: the LinuxTV Community) is formed by
 developers working on Linux Kernel Media Subsystem, together with users
 who also play an important role in testing the code.
 
@@ -27,7 +27,7 @@ tree:
 .. [1] Device tree bindings are maintained by the
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS maintainers
        (see the MAINTAINERS file). So, changes there must be reviewed
-       by them before being merged via the media subsystem's development
+       by them before being merged into the media subsystem's development
        tree.
 
 Both media userspace and Kernel APIs are documented and the documentation
@@ -38,32 +38,33 @@ corresponding API documentation.
 Media Maintainers
 -----------------
 
+Media Maintainers are not just people capable of writing code, but they
+are developers who have demonstrated their ability to collaborate with
+the team, get the most knowledgeable people to review code, contribute
+high-quality code, and follow through to fix issues (in code or tests).
+
 Due to the size and wide scope of the media subsystem, multiple layers of
 maintainers are required, each with their own areas of expertise:
 
-- Media Driver Maintainer:
-    Responsible for one or more drivers within the Media Subsystem. You
+- **Media Driver Maintainer**:
+    Responsible for one or more drivers within the Media Subsystem. They
     are listed in the MAINTAINERS file as maintainer for those drivers. Media
     Driver Maintainers review patches for those drivers, provide feedback if
-    the patches are not following the subsystem rules, or are not using the
-    media kernel or userspace APIs correctly, or have poor code quality.
+    patches do not follow the subsystem rules, or are not using the
+    media kernel or userspace APIs correctly, or if they have poor code
+    quality.
 
-    If you are the author of the patches, then you work with other Media
+    If you are the patch author, you work with other Media
     Maintainers to ensure your patches are reviewed.
 
-    Some Media Driver Maintainers have additional responsibilities.  They have
-    been granted patchwork access and keep
-    `patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
+    Some Media Driver Maintainers have additional responsibilities. They have
+    been granted Patchwork access and keep
+    `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
     up to date, decide when patches are ready for merging, and create Pull
     Requests for the Media Subsystem Maintainers to merge.
 
-    Such Media Driver Maintainers are not just someone who is capable of creating code,
-    but someone who has demonstrated their ability to collaborate with the team,
-    get the most knowledgeable people to review code, contribute high-quality code,
-    and follow through to fix issues (in code or tests).
-
-- Media Core Maintainer:
-    Media Driver Maintainers with patchwork access who are also responsible for
+- **Media Core Maintainer**:
+    Media Driver Maintainers with Patchwork access who are also responsible for
     one or more media core frameworks.
 
     Core framework changes are done via consensus between the relevant Media
@@ -71,22 +72,21 @@ maintainers are required, each with their own areas of expertise:
     their Pull Requests if they are signed off by the relevant Media Core
     Maintainers.
 
-- Media Subsystem Maintainers:
-    Media Core Maintainers who are also responsible for the subsystem as a whole,
-    with access to the entire subsystem. Responsible for merging Pull Requests
-    from other Media Maintainers.
+- **Media Subsystem Maintainers**:
+    Media Core Maintainers who are also responsible for the subsystem as a
+    whole, with access to the entire subsystem. Responsible for merging Pull
+    Requests from other Media Maintainers.
 
-    Userspace API/ABI changes are done via consensus between Media Subsystem
+    Userspace API/ABI changes are made via consensus among Media Subsystem
     Maintainers\ [2]_. Media Maintainers may include API/ABI changes in
-    their Pull Requests if they are signed off by the all Media Subsystem
+    their pull requests if they are signed off by all Media Subsystem
     Maintainers.
 
-All Media Maintainers shall explicitly agree with the Kernel development process
-as described at Documentation/process/index.rst and to the Kernel
-development rules inside the Kernel documentation, including its code of
-conduct.
+All Media Maintainers shall agree with the Kernel development process as
+described in Documentation/process/index.rst and with the Kernel development
+rules in the Kernel documentation, including its code of conduct.
 
-Media Maintainers are reachable via the #linux-media IRC channel at OFTC.
+Media Maintainers are often reachable via the #linux-media IRC channel at OFTC.
 
 .. [2] Everything that would break backward compatibility with existing
        non-kernel code are API/ABI changes. This includes ioctl and sysfs
@@ -95,8 +95,8 @@ Media Maintainers are reachable via the #linux-media IRC channel at OFTC.
 Patchwork Access
 ----------------
 
-All Media Maintainers who have been granted patchwork access shall ensure that
-`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
+All Media Maintainers who have been granted Patchwork access shall ensure that
+`Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
 will reflect the current status, e.g. patches shall be delegated to the Media
 Maintainer who is handling them and the patch status shall be updated according
 to these rules:
@@ -112,28 +112,28 @@ to these rules:
   tree (e.g. drm, dmabuf, upstream merge, etc.) but were cross-posted to the
   linux-media mailing list.
 
-If a Media Maintainer decides not to accept a patch, then reply by email to
-the patch authors, explaining why it is not accepted, and
-`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_ shall be
-updated accordingly with either:
+If Media Maintainers decide not to accept a patch, they should reply to the
+patch authors by e‑mail, explaining why it is not accepted, and
+update `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
+accordingly with one of the following statuses:
 
 - ``Changes Requested``: if a new revision was requested;
 - ``Rejected``: if the proposed change is not acceptable at all.
 
 .. Note::
 
-   Patchwork supports a couple of clients to help semi-automating
+   Patchwork supports a couple of clients to help semi-automate
    status updates via its REST interface:
 
    https://patchwork.readthedocs.io/en/latest/usage/clients/
 
-For those patches that fall in your area of responsibility you alse decide
-when those patches are ready for merging, and create Pull Requests for the
-Media Subsystem Maintainers to merge.
+For patches that fall within their area of responsibility a Media Maintainer
+also decide when those patches are ready for merging, and create Pull Requests
+for the Media Subsystem Maintainers to merge.
 
-The most important aspect of becoming a Media Maintainer with patchwork access
-is that you have demonstrated the ability to give good code reviews. So we are
-looking for whether or not we think you will be good at doing that.
+The most important aspect of becoming a Media Maintainer with Patchwork access
+is that you have demonstrated an ability to give good code reviews. We value
+your ability to deliver thorough, constructive code reviews.
 
 As such, potential maintainers must earn enough credibility and trust from the
 Linux Media Community. To do that, developers shall be familiar with the open
@@ -145,7 +145,7 @@ demonstrating your:
 
 - commitment to the project;
 - ability to collaborate with the team and communicate well;
-- understand of how upstream and the Linux Media Community work
+- understanding of how upstream and the Linux Media Community work
   (policies, processes for testing, code review, ...)
 - reasonable knowledge about:
 
@@ -160,9 +160,9 @@ demonstrating your:
 - ability to judge when a patch might be ready for review and to submit;
 - ability to write good code (last but certainly not least).
 
-Media Driver Maintainers that desire to get patchwork access are encouraged
+Media Driver Maintainers that desire to get Patchwork access are encouraged
 to participate at the yearly Linux Media Summit, typically co-located with
-a Linux related conference. These summits are announced on the linux-media
+a Linux-related conference. These summits are announced on the linux-media
 mailing list.
 
 If you are doing such tasks and have become a valued developer, an
@@ -170,8 +170,8 @@ existing Media Maintainer can nominate you to the Media Subsystem Maintainers.
 
 The ultimate responsibility for accepting a nominated maintainer is up to
 the subsystem's maintainers. The nominated maintainer must have earned a trust
-relationship with all Media Subsystem Maintainers, as, by being granted patchwork
-access, you will take over part of their maintenance tasks.
+relationship with all Media Subsystem Maintainers, as, by being granted
+Patchwork access, you will take over part of their maintenance tasks.
 
 Media Committers
 ----------------
@@ -191,14 +191,18 @@ The main development tree used by the media subsystem is hosted at
 https://gitlab.freedesktop.org/linux-media/.
 https://linuxtv.org/ hosts news about the subsystem,
 `wiki <https://www.linuxtv.org/wiki/index.php/Main_Page>`_ pages
-and a `patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
+and a `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
 instance where we track patches though their lifetime.
 
-The main tree used by media developers is at:
+The stable tree used by media developers is at:
+
+https://git.linuxtv.org/media.git/
+
+Patches there are initially committed to the media committers tree:
 
 https://gitlab.freedesktop.org/linux-media/media-committers.git
 
-Please note that this tree can be rebased, although only as a last resort.
+Please note that the later can be rebased, although only as a last resort.
 
 .. _Media development workflow:
 
@@ -217,11 +221,11 @@ you can find details about how to subscribe to it and to see its archives at:
 
 Emails with HTML will be automatically rejected by the mail server.
 
-It could be wise to also copy the Media Maintainer(s). You should use
+It could be wise to also copy the relevant Media Maintainer(s). You should use
 ``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
 Please always copy driver's authors and maintainers.
 
-To minimize the chance of merge conflicts for your patch series, and make
+To minimize the chance of merge conflicts for your patch series, and make it
 easier to backport patches to stable Kernels, we recommend that you use the
 following baseline for your patch series:
 
@@ -267,13 +271,14 @@ workflows:
 a. Media Maintainers' workflow: Media Maintainers post the PRs, which are
    handled by the Media Subsystem Maintainers::
 
-     +-------+   +------------+   +------+   +-------+   +----------------------------+
-     |e-mail |-->|picked up by|-->|code  |-->|pull   |-->|Subsystem Maintainers merge |
-     |to LMML|   |patchwork   |   |review|   |request|   |in media-committers.git     |
-     +-------+   +------------+   +------+   +-------+   +----------------------------+
+     +-------+   +------------+   +------+   +-------+   +---------------------+
+     |e-mail |-->|picked up by|-->|code  |-->|pull   |-->|Subsystem Maintainers|
+     |to LMML|   |Patchwork   |   |review|   |request|   |merge in             |
+     |       |   |            |   |      |   |       |   |media-committers.git |
+     +-------+   +------------+   +------+   +-------+   +---------------------+
 
    For this workflow, pull requests are generated by Media Maintainers with
-   patchwork access.  If you do not have patchwork access, then please don't
+   Patchwork access.  If you do not have Patchwork access, then please don't
    submit pull requests, as they will not be processed.
 
 b. Media Committers' workflow: patches are handled by Media Maintainers with
@@ -281,15 +286,14 @@ b. Media Committers' workflow: patches are handled by Media Maintainers with
 
      +-------+   +------------+   +------+   +--------------------------+
      |e-mail |-->|picked up by|-->|code  |-->|Media Committers merge in |
-     |to LMML|   |patchwork   |   |review|   |media-committers.git      |
+     |to LMML|   |Patchwork   |   |review|   |media-committers.git      |
      +-------+   +------------+   +------+   +--------------------------+
 
 When patches are picked up by
-`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
-and when merged at media-committers,
-Media CI bots will check for errors and may provide e-mail feedback about
-patch problems. When this happens, the patch submitter must fix them or
-explain why the errors are false positives.
+`Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_
+and when merged at media-committers, Media CI bots will check for errors and
+may provide e-mail feedback about patch problems. When this happens, the patch
+submitter must fix them or explain why the errors are false positives.
 
 Patches will only be moved to the next stage in these two workflows if they
 pass on Media CI or if there are false-positives in the Media CI reports.
@@ -327,18 +331,17 @@ server has accepted your patch, by looking at:
    - https://lore.kernel.org/linux-media/
 
 If the patch is there and not at
-`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_,
-it is likely that your e-mailer
-mangled the patch. Patchwork internally has logic that checks if the
-received e-mail contains a valid patch. Any whitespace and new line
-breakages mangling the patch won't be recognized by
-`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_,
+`Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_,
+it is likely that your e-mailer mangled the patch. Patchwork internally
+has logic that checks if the received e-mail contains a valid patch.
+Any whitespace and new line breakages mangling the patch won't be recognized by
+`Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_,
 and such a patch will be rejected.
 
 .. [3] It usually takes a few minutes for the patch to arrive, but
-       the e-mail server may be busy, so it may take up a longer time
+       the e-mail server may be busy, so it may take a longer time
        for a patch to be picked by
-       `patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_.
+       `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_.
 
 .. [4] If your email contains HTML, the mailing list server will simply
        drop it, without any further notice.
@@ -349,8 +352,8 @@ Authentication for pull and merge requests
 ++++++++++++++++++++++++++++++++++++++++++
 
 The authenticity of developers submitting pull requests and merge requests
-shall be validated by using PGP signing at some moment.
-See: :ref:`kernel_org_trust_repository`.
+shall be validated by using the Linux Kernel Web of Trust, with PGP signing
+at some moment. See: :ref:`kernel_org_trust_repository`.
 
 With the pull request workflow, pull requests shall use PGP-signed tags.
 
@@ -494,11 +497,11 @@ least, simply wrapping the lines.
 In particular, we accept lines with more than 80 columns:
 
     - on strings, as they shouldn't be broken due to line length limits;
-    - when a function or variable name need to have a big identifier name,
-      which keeps hard to honor the 80 columns limit;
+    - when a function or variable name needs to have a large identifier name,
+      which makes hard to honor the 80 columns limit;
     - on arithmetic expressions, when breaking lines makes them harder to
       read;
-    - when they avoid a line to end with an open parenthesis or an open
+    - when they avoid a line ending with an open parenthesis or an open
       bracket.
 
 Key Cycle Dates
@@ -512,7 +515,7 @@ Review Cadence
 --------------
 
 Provided that your patch has landed in
-`patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_, it
+`Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_, it
 should be sooner or later handled, so you don't need to re-submit a patch.
 
 Except for important bug fixes, we don't usually add new patches to the
@@ -525,4 +528,4 @@ other developers to publicly add ``Reviewed-by:`` and, more importantly,
 ``Tested-by:`` tags.
 
 Please note that we expect a detailed description for ``Tested-by:``,
-identifying what boards were used at the test and what it was tested.
+identifying what boards were used during the test and what it was tested.
-- 
2.52.0


