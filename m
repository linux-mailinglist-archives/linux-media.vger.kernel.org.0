Return-Path: <linux-media+bounces-52261-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN9jA1+rhGk14QMAu9opvQ
	(envelope-from <linux-media+bounces-52261-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:38:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1993FF41EF
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 15:38:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5A43E3006212
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 14:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57A740756F;
	Thu,  5 Feb 2026 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uf9Y8uEK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A3CC407578
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770302231; cv=none; b=mhYyh3rU8lae8Jy/UztNUWteSNR0cInBYRMExlJxK299V0vcS4Sb5nquaR6uX4fVll39Y4GDEr+z8jXr+9zlZj9yhtNZZ/qdroQS/Ykq5AQ8aARCkZZqH7GtHLYQwUqGwCbLRMrPbSUvIMWFfk4fGJdKoDsd9oQ679S5S74g6Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770302231; c=relaxed/simple;
	bh=Y7bC4SIwCwvHNs9ak6VWLdXF0SuCtnkqWIP+UNk5IRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=unsNA3KK1np9i8Lswip1aLl8e1q7TaIgMydGfTnHqxOX8I12XPYYn/EbebhvvBGqO7FnFc9z3KS+up7LQJl10Fvv0T4OOFB3IzLV4ORtvIxMr3DLiap/F1OyRuW66Q1b4oyEnNvlv4p1m/AdBzoBNDd24bcw272MhbXW/UY3npc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uf9Y8uEK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0FCC4CEF7;
	Thu,  5 Feb 2026 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770302231;
	bh=Y7bC4SIwCwvHNs9ak6VWLdXF0SuCtnkqWIP+UNk5IRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uf9Y8uEKUjjkoUhSZbTFqNuSB2WjOSWe978KZwxvgNkOEN8Hhn27ylkVs4kYJ8csF
	 Q3K+7yxuHlC3OFhkrs2CS/qJhj+JYP/SnBSA2Iu03W1mRKyp8bpw9wINOh390fCKwV
	 4d50grTK5sSyJJyUtQeUHqzCqTlBBf63jUlpZRlTuSDh7vJSUDEfHVioV8N1F5l5pf
	 HIxDNBmAoBdjy/E6pw5edH0808IRU/+9pXGnMeNSztXh0KkfsgqMF9nzD8eSvIE1Lg
	 W3sOedXu+7+VzsiGN1wag8hmLhYUGgpj/k67zSNhAqZuev7cTxVrxh4/RrVrF1Xd0X
	 +ued3JdCMc5Bg==
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
Subject: [PATCHv8 3/3] docs: media: document media multi-committers rules and process
Date: Thu,  5 Feb 2026 15:32:54 +0100
Message-ID: <14c1bf61786f99901c3c711aae9123a4042e061f.1770301974.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1770301974.git.hverkuil+cisco@kernel.org>
References: <cover.1770301974.git.hverkuil+cisco@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-52261-lists,linux-media=lfdr.de,cisco];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,mozilla.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,chromium.org:email,webkit.org:url]
X-Rspamd-Queue-Id: 1993FF41EF
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
 .../driver-api/media/media-committers.rst     | 201 ++++++++++++++++++
 3 files changed, 223 insertions(+)
 create mode 100644 Documentation/driver-api/media/media-committers.rst

diff --git a/Documentation/driver-api/media/index.rst b/Documentation/driver-api/media/index.rst
index d5593182a3f9..08fc2cfc07a3 100644
--- a/Documentation/driver-api/media/index.rst
+++ b/Documentation/driver-api/media/index.rst
@@ -26,6 +26,7 @@ Documentation/userspace-api/media/index.rst
     :numbered:
 
     maintainer-entry-profile
+    media-committers
 
     v4l2-core
     dtv-core
diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
index 6513bd281354..2c5f1eba5684 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -174,6 +174,17 @@ the subsystem's maintainers. The nominated maintainer must have earned a trust
 relationship with all Media Subsystem Maintainers, as, by being granted
 Patchwork access, you will take over part of their maintenance tasks.
 
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
 
@@ -347,9 +358,19 @@ at some moment. See: :ref:`kernel_org_trust_repository`.
 
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
 
diff --git a/Documentation/driver-api/media/media-committers.rst b/Documentation/driver-api/media/media-committers.rst
new file mode 100644
index 000000000000..fd2f30700958
--- /dev/null
+++ b/Documentation/driver-api/media/media-committers.rst
@@ -0,0 +1,201 @@
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
+As Media Committer you have the following additional responsibilities:
+
+1. Patches you authored must have a ``Signed-off-by``, ``Reviewed-by``
+   or ``Acked-by`` from another Media Maintainer;
+2. If a patch introduces a regression, then that must be corrected as soon
+   as possible. Typically the patch is either reverted, or an additional
+   patch is committed to fix the regression;
+3. If patches are fixing bugs against already released Kernels, including
+   the reverts mentioned above, the Media Committer shall add the needed
+   tags. Please see :ref:`Media development workflow` for more details.
+4. All Media Committers are responsible for maintaining
+   `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_,
+   updating the state of the patches they review or merge.
+
+
+Becoming a Media Committer
+--------------------------
+
+Existing Media Committers can nominate a Media Maintainer to be granted
+commit rights. The Media Maintainer must have patchwork access,
+have been reviewing patches from third parties for some time, and has
+demonstrated a good understanding of the maintainer's duties and processes.
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
+Those areas will typically be the same as the areas that the nominated
+committer is already maintaining.
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
+   For the purpose of committing patches to the media-committers tree,
+   I'll be using my user https://gitlab.freedesktop.org/users/<username>.
+
+Followed by a formal declaration of agreement with the Kernel development
+rules::
+
+   I agree to follow the Kernel development rules described at:
+
+   https://www.kernel.org/doc/html/latest/driver-api/media/media-committers.rst
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
+   By doing a new push to media-committers tree, I understand that I agree
+   to follow the rules in effect at the time of the commit.
+
+That e-mail shall be signed via the Kernel Web of trust with a PGP key cross
+signed by other Kernel and media developers. As described at
+:ref:`media-developers-gpg`, the PGP signature, together with the gitlab user
+security are fundamental components that ensure the authenticity of the merge
+requests that will happen at the media-committers.git tree.
+
+In case the kernel development process changes, by merging new commits to the
+`media-committers tree <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
+the Media Committer implicitly declares their agreement with the latest
+version of the documented process including the contents of this file.
+
+If a Media Committer decides to retire, it is the committer's duty to
+notify the Media Subsystem Maintainers about that decision.
+
+.. note::
+
+   1. Changes to the kernel media development process shall be announced in
+      the media-committers mailing list with a reasonable review period. All
+      committers are automatically subscribed to that mailing list;
+   2. Due to the distributed nature of the Kernel development, it is
+      possible that kernel development process changes may end being
+      reviewed/merged at the Linux Docs and/or at the Linux Kernel mailing
+      lists, especially for the contents under Documentation/process and for
+      trivial typo fixes.
+
+Media Core Committers
+---------------------
+
+A Media Core Committer is a Media Core Maintainer with commit rights.
+
+As described in Documentation/driver-api/media/maintainer-entry-profile.rst,
+a Media Core Maintainer maintains media core frameworks as well, besides
+just drivers, and so is allowed to change core files and the media subsystem's
+Kernel API. The extent of the core committer's grants will be detailed by the
+Media Subsystem Maintainers when they nominate a Media Core Committer.
+
+Existing Media Committers may become Media Core Committers and vice versa.
+Such decisions will be taken in consensus among the Media Subsystem
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
+the Media Subsystem Maintainers, especially with regards of the scope of changes
+they may apply directly at the media-committers tree. That scope can
+change over time on a mutual agreement between Media Committers and
+Media Subsystem Maintainers.
+
+The Media Committer workflow is described at :ref:`Media development workflow`.
+
+.. _Maintain Media Status:
+
+Maintaining Media Maintainer or Committer status
+------------------------------------------------
+
+A community of maintainers working together to move the Linux Kernel
+forward is essential to creating successful projects that are rewarding
+to work on. If there are problems or disagreements within the community,
+they can usually be solved through healthy discussion and debate.
+
+In the unhappy event that a Media Maintainer or Committer continues to
+disregard good citizenship (or actively disrupts the project), we may need
+to revoke that person's status. In such cases, if someone suggests the
+revocation with a good reason, then after discussing this among the Media
+Maintainers, the final decision is taken by the Media Subsystem Maintainers.
+
+As the decision to become a Media Maintainer or Committer comes from a
+consensus between Media Subsystem Maintainers, a single Media Subsystem
+Maintainer not trusting the Media Maintainer or Committer anymore is enough
+to revoke their maintenance, Patchwork grants and/or commit rights.
+
+Having commit rights revoked doesn't prevent Media Maintainers to keep
+contributing to the subsystem either via the pull request or via email workflow
+as documented at the :ref:`Media development workflow`.
+
+If a maintainer is inactive for more than a couple of Kernel cycles,
+maintainers will try to reach you via e-mail. If not possible, they may
+revoke their maintainer/patchwork and committer rights and update MAINTAINERS
+file entries accordingly. If you wish to resume contributing as maintainer
+later on, then contact the Media Subsystem Maintainers to ask if your
+maintenance, Patchwork grants and commit rights can be restored.
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


