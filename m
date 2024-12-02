Return-Path: <linux-media+bounces-22432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 624DC9E027B
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 13:51:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEA8D282691
	for <lists+linux-media@lfdr.de>; Mon,  2 Dec 2024 12:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 873F61FECC0;
	Mon,  2 Dec 2024 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="X1uk4vJV";
	dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b="RedWev36"
X-Original-To: linux-media@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12E4A95C;
	Mon,  2 Dec 2024 12:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733143866; cv=pass; b=sbEDg+jdhE6m+9N9XBLbfCSyEXolzwVF1fL70/1xpl/GjA0PnKJ+pcQ+ab8sZx6iou2SVVldQTC6XRM5TCjkHv8HDy1P3Phf/bl3HfIpWcpjjFVGAfsbLG7mMPOi3cjHEVEjhtOYaCbFEFZmD0C/5PExpLsjgOlcmXn2FIhsqJ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733143866; c=relaxed/simple;
	bh=jv9MIFM6/vODgqRaA4XGml1MgZQARwlgu8AP9f/icL8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z6BUM9sjMEdNQb6/C91TJLSavNm+2DVPftTJWdUbtDDgodag/sZq47JOucOUDSpUrCpUlK81FKtUal/zTFcYLOpKSo1HT1+scn1QnTCkg89zmEsRHz9A3h15HtB8grx962HW4ySAPiU73TP7np+hlYUtxYZjEe2gANbFnJQu7M4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=X1uk4vJV; dkim=pass (1024-bit key) header.d=iki.fi header.i=@iki.fi header.b=RedWev36; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from meesny.iki.fi (meesny.iki.fi [IPv6:2001:67c:2b0:1c1::201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lahtoruutu.iki.fi (Postfix) with ESMTPS id 4Y23Ky6Xv3z49Q4w;
	Mon,  2 Dec 2024 14:40:54 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1733143254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FLuXpS8bPO2BGlcakHcPrgUS8+CnUYO2YGVMwkM75II=;
	b=X1uk4vJVOvmXR4F39D4WyrHbWWKFBhBu9NQeVPUuYyf/rcY3R5j8RUZeOrn2zkE0BmM9Uj
	OW8Gx5Q041N8/m4amv138gnOHf/dC9HHDlWHkVi83l13slETKfv0ni6ZokJnCcLWr6MYkW
	jmpB491gazXYgSyjaXY+ylyyo9lp/QZLgd1WU1LWdCvERqm2Y01rloFmGjd3p8WLnyPScy
	I19T0UC6HDGEURxvYHzzGy6yi/IbZRzrdBXS+dAnkIT1p4Me1r7DaGaVp5bxwWVur0IgTv
	bUnWNRDD6pdwPU1cOW9ajAmpNdbeezlCqNU9lKAzBLsx3anWGQ0r9fD69fVLTA==
Received: from hillosipuli.retiisi.eu (2a00-1190-d1dd-0-c641-1eff-feae-163c.v6.cust.suomicom.net [IPv6:2a00:1190:d1dd:0:c641:1eff:feae:163c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sailus)
	by meesny.iki.fi (Postfix) with ESMTPSA id 4Y23Kp1J4tzySM;
	Mon,  2 Dec 2024 14:40:46 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=meesny;
	t=1733143246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FLuXpS8bPO2BGlcakHcPrgUS8+CnUYO2YGVMwkM75II=;
	b=RedWev360nQ8tt3S5z+2EdVpkzrRxbk7U6V9qygpbZBwRA6i3rdD+RgVYAoHw6H3L8Fj1D
	ZxxiXLt3m7yucde5k14MDc7QevQlpp5tRahbm6NNSATKs3NZLXYQNVelIL3laTjS44ymOU
	AKv+q7mYhJhbxxaQSh8qLm0GKfkhMRo=
ARC-Seal: i=1; s=meesny; d=iki.fi; t=1733143246; a=rsa-sha256; cv=none;
	b=OMLP4gyM0J8blQk188x/sFZV1Zwiu0tH6JkpcYmRHcABDrTEiL3+JXUQvvaH4DBoT3LCJH
	uJGiG7TmC1Gai8RG0wbKDNkfcW90bWF+ejTE2atJL1VTO9cb+kypHy9L0V2znNsQcNjpWe
	reqMVxgsQGhhhqZ6cbNgTcCkpdcrEps=
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sailus smtp.mailfrom=sakari.ailus@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=meesny; t=1733143246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FLuXpS8bPO2BGlcakHcPrgUS8+CnUYO2YGVMwkM75II=;
	b=wjtg2EHOpBfhrO5hkbBio67EXXYyjaIDkxAXia4eXjTd+QMZjnOtW6X6IEv8vHkyFh7aUP
	aYjxoiYSE1XlpG+E16P5hYxK+9vuzzxobwoZGFeOIpi14Xn/Bv+mS5ci68QYzsmcA1l5lS
	tj+PImdn9punfGnlnc749X73HSHd1c4=
Received: from valkosipuli.retiisi.eu (valkosipuli.localdomain [192.168.4.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by hillosipuli.retiisi.eu (Postfix) with ESMTPS id A5443634C93;
	Mon,  2 Dec 2024 14:40:44 +0200 (EET)
Date: Mon, 2 Dec 2024 12:40:44 +0000
From: Sakari Ailus <sakari.ailus@iki.fi>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hans Verkuil <hverkuil@xs4ll.nl>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: [PATCH v3 1/3] docs: media: update maintainer-entry-profile for
 multi-committers
Message-ID: <Z02qzF7e665uq44a@valkosipuli.retiisi.eu>
References: <cover.1733131405.git.mchehab+huawei@kernel.org>
 <e9a5f9f49b185c694d38ea620bd68252eb52e9d3.1733131405.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9a5f9f49b185c694d38ea620bd68252eb52e9d3.1733131405.git.mchehab+huawei@kernel.org>

Hi Mauro,

Thanks for the set.

Looks good overall, please still see my comments below.

On Mon, Dec 02, 2024 at 10:26:19AM +0100, Mauro Carvalho Chehab wrote:
> As the media subsystem will experiment with a multi-committers model,
> update the Maintainer's entry profile to the new rules.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Hans Verkuil <hverkuil@xs4ll.nl>
> Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../media/maintainer-entry-profile.rst        | 208 ++++++++++++++----
>  MAINTAINERS                                   |   1 +
>  2 files changed, 163 insertions(+), 46 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/maintainer-entry-profile.rst b/Documentation/driver-api/media/maintainer-entry-profile.rst
> index ffc712a5f632..dc764163cf1c 100644
> --- a/Documentation/driver-api/media/maintainer-entry-profile.rst
> +++ b/Documentation/driver-api/media/maintainer-entry-profile.rst
> @@ -27,19 +27,139 @@ It covers, mainly, the contents of those directories:
>  Both media userspace and Kernel APIs are documented and the documentation
>  must be kept in sync with the API changes. It means that all patches that
>  add new features to the subsystem must also bring changes to the
> -corresponding API files.
> +corresponding API documentation files.
>  
> -Due to the size and wide scope of the media subsystem, media's
> -maintainership model is to have sub-maintainers that have a broad
> -knowledge of a specific aspect of the subsystem. It is the sub-maintainers'
> -task to review the patches, providing feedback to users if the patches are
> +Due to the size and wide scope of the media subsystem, the media's
> +maintainership model is to have committers that have a broad knowledge of
> +a specific aspect of the subsystem. It is the committers' task to
> +review the patches, providing feedback to users if the patches are
>  following the subsystem rules and are properly using the media kernel and
>  userspace APIs.
>  
> -Patches for the media subsystem must be sent to the media mailing list
> -at linux-media@vger.kernel.org as plain text only e-mail. Emails with
> -HTML will be automatically rejected by the mail server. It could be wise
> -to also copy the sub-maintainer(s).
> +Media committers
> +----------------
> +
> +In the media subsystem, there are experienced developers who can push

The media subsystem is generally understood to comprise of what's under
drivers/media, this should be referring to the community instead.

> +patches directly to the development tree. These developers are called
> +Media committers and are divided into the following categories:
> +
> +- Committers:
> +    contributors for one or more drivers within the media subsystem.
> +    They can push changes to the tree that do not affect the core or ABI.
> +
> +- Core committers:
> +    responsible for part of the media core. They are typically
> +    responsible for one or more drivers within the media subsystem, but, besides
> +    that, they can also merge patches that change the code common to multiple
> +    drivers, including the kernel internal API.
> +
> +- Subsystem maintainers:

s/Subsystem/Media tree/

?
> +    responsible for the subsystem as a whole, with access to the
> +    entire subsystem.
> +
> +    Only subsystem maintainers can push changes that affect the userspace
> +    API/ABI.

This is ambiguous. I think it should intend to say API/ABI changes require
approval from Media tree maintainers.

What constitutes a UAPI change is a topic of discussion on its own. Does it
require adding a new IOCTL? Taking into use a reserved field? Changing
little-used driver behaviour slightly? Fixing a bug in a driver?

The first two obviously yes, but the latter two probably not.

Also:

s/Only subsystem maintainers can push/Media tree maintainers' ack is
required for/

?

> +
> +All media committers shall explicitly agree with the Kernel development process
> +as described at Documentation/process/index.rst and to the Kernel
> +development rules inside the Kernel documentation, including its code of
> +conduct.
> +
> +Media development tree
> +----------------------
> +
> +The main development tree used by the media subsystem is hosted at LinuxTV.org,
> +where we also maintain news about the subsystem, wiki pages and a patchwork
> +instance where we track patches though their lifetime.
> +
> +The main tree used by media developers is at:
> +
> +https://git.linuxtv.org/media.git/
> +
> +.. _Media development workflow:
> +
> +Media development workflow
> +++++++++++++++++++++++++++
> +
> +All changes for the media subsystem must be sent first as e-mails to the
> +media mailing list, following the process documented at

s/^/linux-/

Also I'd refer to it as "LMML".

> +Documentation/process/index.rst.
> +
> +It means that patches shall be submitted as plain text only via e-mail to
> +linux-media@vger.kernel.org. While subscription is not mandatory, you
> +can find details about how to subscribe to it and to see its archives at:
> +
> +  https://subspace.kernel.org/vger.kernel.org.html
> +
> +Emails with HTML will be automatically rejected by the mail server.
> +
> +It could be wise to also copy the media committer(s). You should use
> +``scripts/get_maintainers.pl`` to identify whom else needs to be copied.
> +Please always copy driver's authors and maintainers.
> +
> +Such patches need to be based against a public branch or tag as follows:
> +
> +1. Patches for new features need to be based at the ``next`` branch of
> +   media.git tree;
> +
> +2. Fixes against an already released kernel should preferably be against
> +   the latest released Kernel. If they require a previously-applied
> +   change at media.git tree, they need to be against its ``fixes`` branch.

This would be a change to the current process that I don't think has been
discussed. If I understand correctly, generally this applies to patches
that have been merged to the development branch (formerly media stage tree
master) with Cc: stable and Fixes: tags.

> +
> +3. Fixes for issues not present at the latest released kernel shall
> +   be either against a -rc kernel for an upcoming release or
> +   against the ``fixes`` branch of the media.git tree.
> +
> +Patches with fixes shall have:
> +
> +- a ``Fixes:`` tag pointing to the first commit that introduced the bug;
> +- when applicable, a ``Cc: stable@vger.kernel.org``.
> +
> +Patches that were fixing bugs publicly reported by someone at the
> +linux-media@vger.kernel.org mailing list shall have:
> +
> +- a ``Reported-by:`` tag immediately followed by a ``Closes:`` tag.
> +
> +Patches that change API shall update documentation accordingly at the
> +same patch series.
> +
> +See Documentation/process/index.rst for more details about e-mail submission.
> +
> +Once a patch is submitted, it may follow either one of the following
> +workflows:
> +
> +a. Pull request workflow: patches are handled by subsystem maintainers::
> +
> +     +------+   +---------+   +-------+   +-----------------------+   +---------+
> +     |e-mail|-->|patchwork|-->|pull   |-->|maintainers merge      |-->|media.git|

s/e-mail/LMML/

(see earlier comment)? Same below.

> +     +------+   |picks it |   |request|   |in media-committers.git|   +---------+
> +                +---------+   +-------+   +-----------------------+
> +
> +   For this workflow, pull requests can be generated by a committer,
> +   a previous committer, subsystem maintainers or by a trusted long-time

s/previous/former/

I'd also use plural in all cases here.

> +   contributor. If you are not in such group, please don't submit

> +   pull requests, as they will not be processed.
> +
> +b. Committers' workflow: patches are handled by media committers::
> +
> +     +------+   +---------+   +--------------------+   +-----------+   +---------+
> +     |e-mail|-->|patchwork|-->|committers merge at |-->|maintainers|-->|media.git|
> +     +------+   |picks it |   |media-committers.git|   |approval   |   +---------+
> +                +---------+   +--------------------+   +-----------+
> +
> +On both workflows, all patches shall be properly reviewed at
> +linux-media@vger.kernel.org before being merged at media-committers.git.
> +
> +When patches are picked by patchwork and when merged at media-committers,
> +CI bots will check for errors and may provide e-mail feedback about
> +patch problems. When this happens, the patch submitter must fix them, or
> +explain why the errors are false positives.
> +
> +Patches will only be moved to the next stage in those two workflows if they
> +don't fail on CI or if there are false-positives in the CI reports.

s/don't fail on/pass/

> +
> +Failures during e-mail submission
> ++++++++++++++++++++++++++++++++++
>  
>  Media's workflow is heavily based on Patchwork, meaning that, once a patch
>  is submitted, the e-mail will first be accepted by the mailing list
> @@ -47,51 +167,48 @@ server, and, after a while, it should appear at:
>  
>     - https://patchwork.linuxtv.org/project/linux-media/list/
>  
> -If it doesn't automatically appear there after a few minutes, then
> +If it doesn't automatically appear there after some time [2]_, then
>  probably something went wrong on your submission. Please check if the
> -email is in plain text\ [2]_ only and if your emailer is not mangling
> +email is in plain text\ [3]_ only and if your emailer is not mangling
>  whitespaces before complaining or submitting them again.
>  
> -You can check if the mailing list server accepted your patch, by looking at:
> +To troubleshoot problems, you should first check if the mailing list
> +server has accepted your patch, by looking at:
>  
>     - https://lore.kernel.org/linux-media/
>  
> -.. [2] If your email contains HTML, the mailing list server will simply
> +If the patch is there and not at patchwork, it is likely that your e-mailer
> +mangled the patch. Patchwork internally has a logic that checks if the
> +received e-mail contain a valid patch. Any whitespace and new line
> +breakages mangling the patch won't be recognized by patchwork, thus such
> +patch will be rejected.
> +
> +.. [2] It usually takes a few minutes for the patch to arrive, but
> +       the e-mail server may be busy, so it may take up to a few hours
> +       for a patch to be picked by patchwork.
> +
> +.. [3] If your email contains HTML, the mailing list server will simply
>         drop it, without any further notice.
>  
> +.. _media-developers-gpg:
>  
> -Media maintainers
> -+++++++++++++++++
> +Authentication for pull and merge requests
> +++++++++++++++++++++++++++++++++++++++++++
>  
> -At the media subsystem, we have a group of senior developers that
> -are responsible for doing the code reviews at the drivers (also known as
> -sub-maintainers), and another senior developer responsible for the
> -subsystem as a whole. For core changes, whenever possible, multiple
> -media maintainers do the review.
> +The authenticity of developers submitting pull requests and merge requests
> +shall be validated by using PGP sign. See: :ref:`kernel_org_trust_repository`.
>  
> -The media maintainers that work on specific areas of the subsystem are:
> +With the pull request workflow, pull requests shall use a PGP-signed tag.
>  
> -- Remote Controllers (infrared):
> -    Sean Young <sean@mess.org>
> +For more details about PGP sign, please read
> +Documentation/process/maintainer-pgp-guide.rst.

s/.*/:ref:`the PGP guide <pgpguide>`/

>  
> -- HDMI CEC:
> -    Hans Verkuil <hverkuil@xs4all.nl>
> +Subsystem maintainers
> +---------------------
>  
> -- Media controller drivers:
> -    Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> -
> -- ISP, v4l2-async, v4l2-fwnode, v4l2-flash-led-class and Sensor drivers:
> -    Sakari Ailus <sakari.ailus@linux.intel.com>
> -
> -- V4L2 drivers and core V4L2 frameworks:
> -    Hans Verkuil <hverkuil@xs4all.nl>
> -
> -The subsystem maintainer is:
> -  Mauro Carvalho Chehab <mchehab@kernel.org>
> -
> -Media maintainers may delegate a patch to other media maintainers as needed.
> -On such case, checkpatch's ``delegate`` field indicates who's currently
> -responsible for reviewing a patch.
> +The subsystem maintainers are:
> +  - Mauro Carvalho Chehab <mchehab@kernel.org> and
> +  - Hans Verkuil <hverkuil@xs4all.nl>
>  
>  Submit Checklist Addendum
>  -------------------------
> @@ -108,17 +225,14 @@ implementing the media APIs:
>  ====================	=======================================================
>  Type			Tool
>  ====================	=======================================================
> -V4L2 drivers\ [3]_	``v4l2-compliance``
> +V4L2 drivers\ [4]_	``v4l2-compliance``
>  V4L2 virtual drivers	``contrib/test/test-media``
>  CEC drivers		``cec-compliance``
>  ====================	=======================================================
>  
> -.. [3] The ``v4l2-compliance`` also covers the media controller usage inside
> +.. [4] The ``v4l2-compliance`` also covers the media controller usage inside
>         V4L2 drivers.
>  
> -Other compilance tools are under development to check other parts of the
> -subsystem.
> -
>  Those tests need to pass before the patches go upstream.
>  
>  Also, please notice that we build the Kernel with::
> @@ -134,6 +248,8 @@ Where the check script is::
>  Be sure to not introduce new warnings on your patches without a
>  very good reason.
>  
> +Please see `Media development workflow`_ for e-mail submission rules.
> +
>  Style Cleanup Patches
>  +++++++++++++++++++++
>  
> @@ -199,7 +315,7 @@ tree between -rc6 and the next -rc1.
>  Please notice that the media subsystem is a high traffic one, so it
>  could take a while for us to be able to review your patches. Feel free
>  to ping if you don't get a feedback in a couple of weeks or to ask
> -other developers to publicly add Reviewed-by and, more importantly,
> +other developers to publicly add ``Reviewed-by:`` and, more importantly,
>  ``Tested-by:`` tags.
>  
>  Please note that we expect a detailed description for ``Tested-by:``,
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e930c7a58b1..c77f56a2e695 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14510,6 +14510,7 @@ MEDIA INPUT INFRASTRUCTURE (V4L/DVB)
>  M:	Mauro Carvalho Chehab <mchehab@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +P:	Documentation/driver-api/media/maintainer-entry-profile.rst
>  W:	https://linuxtv.org
>  Q:	http://patchwork.kernel.org/project/linux-media/list/
>  T:	git git://linuxtv.org/media.git

-- 
Kind regards,

Sakari Ailus

