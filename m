Return-Path: <linux-media+bounces-51633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHyrAnyfeGn4rQEAu9opvQ
	(envelope-from <linux-media+bounces-51633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:20:28 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E3B9381B
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 12:20:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF6E130185F6
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 11:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6C1346A06;
	Tue, 27 Jan 2026 11:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O3ezMe8q"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0193451C6
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 11:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769512728; cv=none; b=gD8Y4f0C5oIZJQ4RPT8DEW+G0pnrwXiWt61qHOU2vOkNMTw2moxpbLmuKbqYG80mgiGY52kCRjN8DKs3vIWmhk86Ndyhc0CEMtm7mOB9LOiBCRZROVk6twnoOcxoEOlbOG+8XgqnkAkejsPWzagVgn9DA9DQChuQsLb+UILL97I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769512728; c=relaxed/simple;
	bh=EgE57i57g7NLF39Zg4fElZTzm3wVgipFdOTj+VySwDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OteZNFUlxliF7VAMuaF1lkt+kzAPp2BYmHnn6Xrv287Pe1q7ETSO9fIT8MrCfXojwSZl0VvtxDegqwyPkb/Wqsei8RNsuOx0OVOO63I13cXPf1AjYacJXibkDcBfwhlCkGKxWe8RsbRbc2mQtpjsVFKjpddGcSr9S1zdaqnEzjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O3ezMe8q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE529C116C6;
	Tue, 27 Jan 2026 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769512728;
	bh=EgE57i57g7NLF39Zg4fElZTzm3wVgipFdOTj+VySwDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O3ezMe8qf9I77yWBymvBOTQkzMyZZ6jjvwlas3f7zsbnGkb5XIEi+hvx5UU/cm43S
	 i5tA3zAERIAfEbMwmti5bji95uoT22p4tlYWtZtJHWdTNCvHZ8LPW2OyqbKFAtf4Ii
	 Si/BVURbK+uI+5XOYhg2ONN+folP/4N5+SMlHHlKuysvBy3clw27zbfvvDIAeSCJ50
	 tuccgbSyqGwyVJ+O1/Iq0ZNfbhHa8xyOIG2etYh2dRwDx2Exw24X497Sr5S8HGUXVY
	 +/i0FrLdT077lxTvLqA8nVMLXT25W5uXCBDWAhaQj3o031/DmIJnukA0gfTsk76ESQ
	 vl5wOM0vzrV8A==
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
Subject: [PATCHv7 3/3] docs: media: document media multi-committers rules and process
Date: Tue, 27 Jan 2026 11:53:27 +0100
Message-ID: <68f26ff012020f37a5ad72a85f4a12ff879441ee.1769511207.git.hverkuil+cisco@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-51633-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mozilla.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,gitlab.freedesktop.org:url,webkit.org:url]
X-Rspamd-Queue-Id: 25E3B9381B
X-Rspamd-Action: no action

From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

As the media subsystem will experiment with a multi-committers model,
update the Maintainer's entry profile to the new rules, and add a file
documenting the process to become a committer and to maintain such
rights.

Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
---
 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        |  21 ++
 .../driver-api/media/media-committer.rst      | 197 ++++++++++++++++++
 3 files changed, 219 insertions(+)
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
index 4f73ee073860..0024f85101b7 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -173,6 +173,17 @@ the subsystem's maintainers. The nominated maintainer must have earned a trust
 relationship with all Media Subsystem Maintainers, as, by being granted patchwork
 access, you will take over part of their maintenance tasks.
 
+Media Committers
+----------------
+
+Experienced and trusted Media Maintainers may be granted commit rights
+which allow them to directly push patches to the media development tree instead
+of posting a Pull Request for the Media Subsystem Maintainers. This helps
+offloading some of the work of the Media Subsystem Maintainers.
+
+More details about Media Committers' roles and responsibilities can be
+found here: :ref:`Media Committers`.
+
 Media development tree
 ----------------------
 
@@ -343,9 +354,19 @@ See: :ref:`kernel_org_trust_repository`.
 
 With the pull request workflow, pull requests shall use PGP-signed tags.
 
+With the committers' workflow, this is ensured at the time merge request
+rights will be granted to the gitlab instance used by the media-committers.git
+tree, after receiving the e-mail documented in
+:ref:`media-committer-agreement`.
+
 For more details about PGP signing, please read
 Documentation/process/maintainer-pgp-guide.rst.
 
+Maintaining media maintainer status
+-----------------------------------
+
+See :ref:`Maintain Media Status`.
+
 List of Media Maintainers
 -------------------------
 
diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
new file mode 100644
index 000000000000..18cce6e06a2b
--- /dev/null
+++ b/Documentation/driver-api/media/media-committer.rst
@@ -0,0 +1,197 @@
+.. _Media Committers:
+
+Media Committers
+================
+
+Who is a Media Committer?
+-------------------------
+
+A Media Committer is a Media Maintainer with patchwork access who has been
+granted commit access to push patches from other developers and their own
+patches to the
+`media-committers <https://gitlab.freedesktop.org/linux-media/media-committers>`_
+tree.
+
+These commit rights are granted with expectation of responsibility:
+committers are people who care about the Linux Kernel as a whole and
+about the Linux media subsystem and want to advance its development. It
+is also based on a trust relationship among other committers, maintainers
+and the Linux Media community.
+
+.. Note::
+
+   1. Patches you authored must have a Signed-off-by, Reviewed-by or Acked-by
+      of another Media Maintainer;
+   2. If a patch introduces a regression, then it is the Media Committer's
+      responsibility to correct that as soon as possible. Typically the
+      patch is either reverted, or an additional patch is committed to
+      fix the regression;
+   3. If patches are fixing bugs against already released Kernels, including
+      the reverts above mentioned, the Media Committer shall add the needed
+      tags. Please see :ref:`Media development workflow` for more details.
+
+Becoming a Media Committer
+--------------------------
+
+Existing Media Committers can nominate a Media Maintainer to be granted
+commit rights. The Media Maintainer must already have patchwork access and
+have been in that role for some time, and has demonstrated a good
+understanding of the maintainer's duties and processes.
+
+The ultimate responsibility for accepting a nominated committer is up to
+the Media Subsystem Maintainers. The nominated committer must have earned a
+trust relationship with all Media Subsystem Maintainers, as, by granting you
+commit rights, part of their responsibilities are handed over to you.
+
+Due to that, to become a Media Committer, a consensus between all Media
+Subsystem Maintainers is required.
+
+.. Note::
+
+   In order to preserve/protect the developers that could have their commit
+   rights granted, denied or removed as well as the subsystem maintainers who
+   have the task to accept or deny commit rights, all communication related to
+   changing commit rights should happen in private as much as possible.
+
+.. _media-committer-agreement:
+
+Media Committer's agreement
+---------------------------
+
+Once a nominated committer is accepted by all Media Subsystem Maintainers,
+they will ask if the developer is interested in the nomination and discuss
+what area(s) of the media subsystem the committer will be responsible for.
+Those areas will typically be the same as the areas that are already
+maintained by the nominated committer.
+
+When the developer accepts being a committer, the new committer shall
+explicitly accept the Kernel development policies described under its
+Documentation/, and in particular to the rules in this document, by writing
+an e-mail to media-committers@linuxtv.org, with a declaration of intent
+following the model below::
+
+   I, John Doe, would like to change my status to: Committer
+
+   As Media Maintainer I accept commit rights for the following areas of
+   the media subsystem:
+
+   ...
+
+   For the purpose of committing patches to the media-committer's tree,
+   I'll be using my user https://gitlab.freedesktop.org/users/<username>.
+
+Followed by a formal declaration of agreement with the Kernel development
+rules::
+
+   I agree to follow the Kernel development rules described at:
+
+   https://www.kernel.org/doc/html/latest/driver-api/media/media-committer.rst
+
+   and to the Linux Kernel development process rules.
+
+   I agree to abide by the Code of Conduct as documented in:
+   https://www.kernel.org/doc/html/latest/process/code-of-conduct.rst
+
+   I am aware that I can, at any point of time, retire. In that case, I will
+   send an e-mail to notify the Media Subsystem Maintainers for them to revoke
+   my commit rights.
+
+   I am aware that the Kernel development rules change over time.
+   By doing a new push to media-committer tree, I understand that I agree
+   to follow the rules in effect at the time of the commit.
+
+That e-mail shall be signed with a PGP key cross signed by other Kernel and
+media developers. As described at :ref:`media-developers-gpg`, the PGP
+signature, together with the gitlab user security are fundamental components
+that ensure the authenticity of the merge requests that will happen at the
+media-committer.git tree.
+
+In case the kernel development process changes, by merging new commits
+to the
+`media-committer tree <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
+the Media Committer implicitly declares their agreement with the latest
+version of the documented process including the contents of this file.
+
+If a Media Committer decides to retire, it is the committer's duty to
+notify the Media Subsystem Maintainers about that decision.
+
+.. note::
+
+   1. Changes to the kernel media development process shall be announced in
+      the media-committers mailinglist with a reasonable review period. All
+      committers are automatically subscribed to that mailinglist;
+   2. Due to the distributed nature of the Kernel development, it is
+      possible that kernel development process changes may end being
+      reviewed/merged at the linux-docs mailing list, specially for the
+      contents under Documentation/process and for trivial typo fixes.
+
+Media Core Committers
+---------------------
+
+As described in Documentation/driver-api/media/maintainer-entry-profile.rst
+a Media Core Maintainer maintains media core frameworks as well, besides
+just drivers, and so is able to change core files and the media subsystem's
+Kernel API. A Media Core Committer is a Media Core Maintainer with commit
+rights. The extent of the core committer's grants will be detailed by the
+Media Subsystem Maintainers when they nominate a Media Core Committer.
+
+Existing Media Committers may become Media Core Committers and vice versa.
+Such decisions will be taken in consensus between the Media Subsystem
+Maintainers.
+
+Media committers rules
+----------------------
+
+Media committers shall do their best efforts to avoid merging patches that
+would break any existing drivers. If it breaks, fixup or revert patches
+shall be merged as soon as possible, aiming to be merged at the same Kernel
+cycle the bug is reported.
+
+Media committers shall behave accordingly to the rights granted by
+the Media Subsystem Maintainers, specially with regards of the scope of changes
+they may apply directly at the media-committers tree. That scope can
+change over time on a mutual agreement between media committers and
+maintainers.
+
+The Media Committer workflow is described at :ref:`Media development workflow`.
+
+.. _Maintain Media Status:
+
+Maintaining media maintainer or committer status
+------------------------------------------------
+
+A community of maintainers working together to move the Linux Kernel
+forward is essential to creating successful projects that are rewarding
+to work on. If there are problems or disagreements within the community,
+they can usually be solved through healthy discussion and debate.
+
+In the unhappy event that a media maintainer or committer continues to
+disregard good citizenship (or actively disrupts the project), we may need
+to revoke that person's status. In such cases, if someone suggests the
+revocation with a good reason, then after discussing this among the media
+maintainers, the final decision is taken by the Media Subsystem Maintainers.
+As the decision to become a media maintainer or committer comes from a
+consensus between Media Subsystem Maintainers, a single subsystem maintainer
+not trusting the media maintainer or committer anymore is enough to revoke
+the maintenance/patchwork or commit rights.
+
+A previous committer that had their commit rights revoked can keep
+contributing to the subsystem via the pull request workflow as documented
+at the :ref:`Media development workflow`, unless they were also removed as
+Media Maintainer.
+
+If a maintainer is inactive for more than a couple of Kernel cycles,
+maintainers will try to reach you via e-mail. If not possible, they may
+revoke your maintainer/patchwork and committer rights and update MAINTAINERS file
+entries accordingly. If you wish to resume contributing later on, then contact
+the Media Subsystem Maintainers to ask if your maintenance/patchwork and
+commit rights can be restored.
+
+References
+----------
+
+Much of this was inspired by/copied from the committer policies of:
+
+- `Chromium <https://chromium.googlesource.com/chromium/src/+/main/docs/contributing.md>`_;
+- `WebKit <https://webkit.org/commit-and-review-policy/>`_;
+- `Mozilla <https://www.mozilla.org/hacking/committer/>`_.
-- 
2.51.0


