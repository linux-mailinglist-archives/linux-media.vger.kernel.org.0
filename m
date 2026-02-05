Return-Path: <linux-media+bounces-52271-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMO3BHTihGkE6QMAu9opvQ
	(envelope-from <linux-media+bounces-52271-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 19:33:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B68AF6757
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 19:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C88D301E203
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 18:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 966372FE592;
	Thu,  5 Feb 2026 18:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANFnfFa8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J25sMImr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JTSL7yC+"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0AE263F4A
	for <linux-media@vger.kernel.org>; Thu,  5 Feb 2026 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770316398; cv=none; b=WSKiXeypC9V0tSMCMkMGNZZLtrDGIxP4X6e9KF8eM1oa/B1TLbijXiNeo8oeOA0cEN9aH37nAllbV01oNcxfrm4BAX04iOn2DdadynSITDFCwCP5V3nDd61ePJ0XJBDUoj+vSOsMcEqSy/onpy8/DizEdLMLcH98ei3/VzfSR18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770316398; c=relaxed/simple;
	bh=tiWT17H9Dzw5aEsfxk8upMAKNqPQadh3IU0U9mH7kIA=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Type:Subject; b=mSFr6jD773gFgti55VSHlqf8aGpuhNJiMoD8rdO3Rc8IiOHkNp/ivAowClaBPXoOU2Bn35gEx8xYKuYJDnFNLuJp8ICAODpsf4sz3UgqxIrhJiLamhrr523Ee8FEWabDe8gGtsKC5aUf/pWMXQL4uHTRlgEolJjTLRMc7Fl07ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANFnfFa8; dkim=fail (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J25sMImr reason="signature verification failed"; dkim=fail (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JTSL7yC+ reason="signature verification failed"; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD19AC19421;
	Thu,  5 Feb 2026 18:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770316397;
	bh=tiWT17H9Dzw5aEsfxk8upMAKNqPQadh3IU0U9mH7kIA=;
	h=Date:From:To:Cc:In-Reply-To:References:Resent-Date:Resent-From:
	 Subject:Resent-To:Resent-Cc:From;
	b=ANFnfFa8McyUPytnmKSy+7l11TL6RHMO5B7lwVgBUe2DqZjMGiv69Mq5kgECItn10
	 5B8RigC+DfdDJqknkBbHkG4ETHHKkIbTBwfJmZjnuOsv4dhbmlu94WXpgsJC9D6DB/
	 UJCL3wyWypDiX7pXKC0e9kJFB4MWOdfMGju67vzO93bE1lfb1hOfChF50xXwL2k5lr
	 xpI3Emd54RnMrXsHbY3ZWdrrhtmy/CQLkWVsZch4BMfdsL3t8IXVLH2XwnffbCElNF
	 RI9dxKkhIman3MHdio1YpLYp5cb1BcYq1UE3YqYmuPokE1e8MHbFcxEm0VoxBHB/2G
	 1FYRpN18A7rHA==
Envelope-to: mchehab@casper.infradead.org
Delivery-date: Thu, 05 Feb 2026 15:58:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=JjswlYxeSvv/uPM6QWKl9im2x+WcPMGz0QcCVQs1Rkc=; b=J25sMImrI/ZyiRDaWQto5SkY1K
 5Gbw0DrM+u5qIwXYEe7MFRT3beRY1fckPVVWZ2+CulUPSevmK0rN567IwcZUsp/+K9snoDizAjU5S
 mADSQnRFB2C2ueIO8937OAJsQgQbggZS8xPuaV1XuAlTyRRGS6Ch40neiwj9oj0HQGBEYwGLobKYQ
 N6uhOtBS/0jZ+oEYWyV9W1WN1YjOCtXFYGknnd3iGSlemtF1uZZuw2naod/aUaneCxKONTCTSgPqM
 1aC450oPu54orVdHR0hFCh5ryrjlW0dpbBFAU8EkdOAX8PvFzDZTGnyIfy760rv5TDZ8XjPDSkKwD
 Ep5aIKhQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770307087;
 bh=tiWT17H9Dzw5aEsfxk8upMAKNqPQadh3IU0U9mH7kIA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JTSL7yC+GwhucXjgwAGRzQ6z9ia/ZMdbiIZL3wl0BYuapFfiIADf752xxYAEvlHxJ
  cVRIlMEmM4c/k9vVBUnR42DVY+Tor2/CTjsR0LtS0pPL+mqLCotGV9PGFRcCVKuP7n
  1ofa9JfPwafL6LxBb5xfRLLp6mQlVswtKIKeqMeGwL6HtzO8Pdys1CWGsWowwVmmrr
  rWU7DddyuChRt1ndyEcDgCAaxCHPT3NUK/3O9BgBWD28F+4Pc7O7kdl5+8Z+zcn/VG
  HpQZg1FQQsKHz4DpaW4p74f/GZFxc3Te+nK0+BFma37TNZQ4MCOzg0wVsb+428tlfE
  y6llKDrvpfPdA==
Date: Thu, 5 Feb 2026 16:58:03 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (by way of Mauro Carvalho Chehab <mchehab+huawei@kernel.org>)
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Ricardo Ribalda <ribalda@chromium.org>
Message-ID: <20260205165803.3dfd0cd1@localhost>
In-Reply-To: <cover.1770301974.git.hverkuil+cisco@kernel.org>
References: <cover.1770301974.git.hverkuil+cisco@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Resent-Date: Thu, 5 Feb 2026 19:33:12 +0100
Resent-From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCHv8 0/3] docs: media: multicommitters model documentation
Resent-Message-ID: <20260205193312.3db700fe@foz.lan>
Resent-To: Hans Verkuil <hverkuil+cisco@kernel.org>
Resent-Cc: linux-media@vger.kernel.org, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Nicolas
 Dufresne <nicolas.dufresne@collabora.com>, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Ricardo Ribalda <ribalda@chromium.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52271-lists,linux-media=lfdr.de,huawei];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	R_DKIM_REJECT(0.00)[infradead.org:s=desiato.20200630,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+,infradead.org:-,kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linuxtv.org:url]
X-Rspamd-Queue-Id: 5B68AF6757
X-Rspamd-Action: no action

On Thu,  5 Feb 2026 15:32:51 +0100
Hans Verkuil <hverkuil+cisco@kernel.org> wrote:

> Here is v8, based on Mauro's feedback.
>=20
> The main changes since v7 are:
>=20
> - rename media-committer.rst to media-committers.rst
> - the 'Note' at the start of media-committers.rst is now just a list
>   of additional responsibilies (it made no sense that it was a 'Note').
> - incorporated Mauro's suggestions
>=20
> Patch 1/3 updates maintainer-entry-profile.rst: it introduces the
> three Media maintainer levels (Media Driver Maintainer, Media Core Mainta=
iner
> and Media Subsystem Maintainer) and what the responsibilities are.
>=20
> Patch 2/3 adds back and updates the list of Media Maintainers that
> disappeared in patch 1/3. Please verify this whether the email
> addresses are the correct ones, and verify that the areas of responsibili=
ty
> are correct and that nothing is missing.
>=20
> Patch 3/3 adds media-committers.rst: that focusses on the additional
> commit rights that can be granted to a Media Maintainer.
>=20
> I have uploaded the documentation with these patches here:
>=20
> https://hverkuil.home.xs4all.nl/spec/driver-api/maintainer-entry-profile.=
html
> https://hverkuil.home.xs4all.nl/spec/driver-api/media-committers.html
>=20
> Mauro's feedback for v7 is here:
>=20
> https://patchwork.linuxtv.org/project/linux-media/list/?series=3D21550

Hans, IMO almost ready. Yet, when looking at the html output, there
are some minor things to be improved. As before, sending you a patch
with them.

Feel free to either integrate it on a new version or to place it=20
at the end.

--=20
Thanks,
Mauro

---

[PATCH] media maintainership docs: Some additional editorial changes

- standardise =E2=80=9CPull Request=E2=80=9D spelling;
- better list URLs that are very confusing at the html output;
- better display "media-committers.git" at html output;
- minor formatting fixes;

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/=
Documentation/driver-api/media/maintainer-entry-profile.rst
index 2c5f1eba5684..c4b6d685cdda 100644
--- a/Documentation/driver-api/media/maintainer-entry-profile.rst
+++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
@@ -79,7 +79,7 @@ maintainers are required, each with their own areas of ex=
pertise:
=20
     Userspace API/ABI changes are made via consensus among Media Subsystem
     Maintainers\ [2]_. Media Maintainers may include API/ABI changes in
-    their pull requests if they are signed off by all Media Subsystem
+    their Pull Requests if they are signed off by all Media Subsystem
     Maintainers.
=20
 All Media Maintainers shall agree with the Kernel development process as
@@ -102,7 +102,7 @@ Maintainer who is handling them and the patch status sh=
all be updated according
 to these rules:
=20
 - ``Under Review``: Used if the patch requires a second opinion
-  or when it is part of a pull request;
+  or when it is part of a Pull Request;
 - ``Superseded``: There is a newer version of the patch posted to the
   mailing list.
 - ``Duplicated``: There was another patch doing the same thing from someone
@@ -185,25 +185,32 @@ offloading some of the work of the Media Subsystem Ma=
intainers.
 More details about Media Committers' roles and responsibilities can be
 found here: :ref:`Media Committers`.
=20
-Media development tree
-----------------------
+Media development sites
+-----------------------
=20
-The main development tree used by the media subsystem is hosted at
-https://gitlab.freedesktop.org/linux-media/.
-https://linuxtv.org/ hosts news about the subsystem,
-`wiki <https://www.linuxtv.org/wiki/index.php/Main_Page>`_ pages
-and a `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>=
`_
-instance where we track patches though their lifetime.
+The `LinuxTV <https://linuxtv.org/>`_ web site hosts news about the subsys=
tem,
+together with:
=20
-The stable tree used by media developers is at:
+- `Wiki pages <https://www.linuxtv.org/wiki/index.php/Main_Page>`_;
+- `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_;
+- `Linux Media documentation <https://linuxtv.org/docs.php>`_;
+- and more.
=20
-https://git.linuxtv.org/media.git/
+The main development trees used by the media subsystem are at:
=20
-Patches there are initially committed to the media committers tree:
+- Stable tree:
+  - https://git.linuxtv.org/media.git/
=20
-https://gitlab.freedesktop.org/linux-media/media-committers.git
+- Media committers tree:
+  - https://gitlab.freedesktop.org/linux-media/media-committers.git
+
+    Please note that it can be rebased, although only as a last resort.
+
+- Media development trees, including apps and CI:
+
+  - https://git.linuxtv.org/
+  - https://gitlab.freedesktop.org/linux-media/
=20
-Please note that the latter can be rebased, although only as a last resort.
=20
 .. _Media development workflow:
=20
@@ -232,18 +239,18 @@ following baseline for your patch series:
=20
 1. Features for the next mainline release:
=20
-   - baseline shall be the media-committers.git ``next`` branch;
+   - baseline shall be the ``media-committers.git next`` branch;
=20
 2. Bug fixes for the next mainline release:
=20
-   - baseline shall be the media-committers.git ``next`` branch. If the
-     changes depend on a fix from the media-committers.git
-     ``fixes`` branch, then you can use that as baseline.
+   - baseline shall be the ``media-committers.git next`` branch. If the
+     changes depend on a fix from the ``media-committers.git fixes``
+     branch, then you can use that as baseline.
=20
 3. Bug fixes for the current mainline release (-rcX):
=20
    - baseline shall be the latest mainline -rcX release or the
-     media-committers.git ``fixes`` branch if changes depend on a mainline
+     ``media-committers.git fixes`` branch if changes depend on a mainline
      fix that is not yet merged;
=20
 .. Note::
@@ -269,8 +276,8 @@ See Documentation/process/index.rst for more details ab=
out e-mail submission.
 Once a patch is submitted, it may follow either one of the following
 workflows:
=20
-a. Media Maintainers' workflow: Media Maintainers post the PRs, which are
-   handled by the Media Subsystem Maintainers::
+a. Media Maintainers' workflow: Media Maintainers post the Pull Requests,
+   which are handled by the Media Subsystem Maintainers::
=20
      +-------+   +------------+   +------+   +-------+   +----------------=
-----+
      |e-mail |-->|picked up by|-->|code  |-->|pull   |-->|Subsystem Mainta=
iners|
@@ -278,9 +285,9 @@ a. Media Maintainers' workflow: Media Maintainers post =
the PRs, which are
      |       |   |            |   |      |   |       |   |media-committers=
.git |
      +-------+   +------------+   +------+   +-------+   +----------------=
-----+
=20
-   For this workflow, pull requests are generated by Media Maintainers with
+   For this workflow, Pull Requests are generated by Media Maintainers with
    Patchwork access.  If you do not have Patchwork access, then please don=
't
-   submit pull requests, as they will not be processed.
+   submit Pull Requests, as they will not be processed.
=20
 b. Media Committers' workflow: patches are handled by Media Maintainers wi=
th
    commit rights::
@@ -300,9 +307,9 @@ Patches will only be moved to the next stage in these t=
wo workflows if they
 pass on Media CI or if there are false-positives in the Media CI reports.
=20
 For both workflows, all patches shall be properly reviewed at
-linux-media@vger.kernel.org (LMML) before being merged in media-committers=
.git.
-Media patches will be reviewed in a timely manner by the maintainers and
-reviewers as listed in the MAINTAINERS file.
+linux-media@vger.kernel.org (LMML) before being merged in
+``media-committers.git``. Media patches will be reviewed in a timely manner
+by the maintainers and reviewers as listed in the MAINTAINERS file.
=20
 Media Maintainers shall request reviews from other Media Maintainers and
 developers where applicable, i.e. because those developers have more
@@ -352,15 +359,15 @@ and such a patch will be rejected.
 Authentication for pull and merge requests
 ++++++++++++++++++++++++++++++++++++++++++
=20
-The authenticity of developers submitting pull requests and merge requests
+The authenticity of developers submitting Pull Requests and merge requests
 shall be validated by using the Linux Kernel Web of Trust, with PGP signing
 at some moment. See: :ref:`kernel_org_trust_repository`.
=20
-With the pull request workflow, pull requests shall use PGP-signed tags.
+With the Pull Request workflow, Pull Requests shall use PGP-signed tags.
=20
 With the committers' workflow, this is ensured at the time merge request
-rights will be granted to the gitlab instance used by the media-committers=
.git
-tree, after receiving the e-mail documented in
+rights will be granted to the gitlab instance used by the
+``media-committers.git`` tree, after receiving the e-mail documented in
 :ref:`media-committer-agreement`.
=20
 For more details about PGP signing, please read
diff --git a/Documentation/driver-api/media/media-committers.rst b/Document=
ation/driver-api/media/media-committers.rst
index fd2f30700958..4ca2ac8d8c7b 100644
--- a/Documentation/driver-api/media/media-committers.rst
+++ b/Documentation/driver-api/media/media-committers.rst
@@ -21,7 +21,7 @@ and the Linux Media community.
 As Media Committer you have the following additional responsibilities:
=20
 1. Patches you authored must have a ``Signed-off-by``, ``Reviewed-by``
-   or ``Acked-by`` from another Media Maintainer;
+   or ``Acked-by`` from another Media Maintainer before your merge;
 2. If a patch introduces a regression, then that must be corrected as soon
    as possible. Typically the patch is either reverted, or an additional
    patch is committed to fix the regression;
@@ -181,7 +181,7 @@ Maintainer not trusting the Media Maintainer or Committ=
er anymore is enough
 to revoke their maintenance, Patchwork grants and/or commit rights.
=20
 Having commit rights revoked doesn't prevent Media Maintainers to keep
-contributing to the subsystem either via the pull request or via email wor=
kflow
+contributing to the subsystem either via the Pull Request or via email wor=
kflow
 as documented at the :ref:`Media development workflow`.
=20
 If a maintainer is inactive for more than a couple of Kernel cycles,


