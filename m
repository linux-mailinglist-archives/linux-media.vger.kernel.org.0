Return-Path: <linux-media+bounces-52246-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iAIEJpeEhGl/3AMAu9opvQ
	(envelope-from <linux-media+bounces-52246-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 12:52:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1631FF212A
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 12:52:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BBD4301703D
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 11:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF4D3B8BCD;
	Thu,  5 Feb 2026 11:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bT7iB2nM"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2148378F4A;
	Thu,  5 Feb 2026 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770292360; cv=none; b=n2YWfZxGjqUaflfSTHSSf/BzVPD7RJkH1EO/oKan2EgP9yU6WetiJNIiXnRyKlh4MQEaEmZRNhINYyBHBN0EY/d+DavGF+kc8zQn1OHgvo2TA58v1X+MWkBNm98LdLLB6C7nwRJxlTHbiLh+PikbqFi76XAro3RwRUvyrkEXAso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770292360; c=relaxed/simple;
	bh=9I2d/CTCHd1EmORTa0eVSIbKP6OzNEp8Xdg/zLtTphM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gyDsHbkM3W5FRWrj2AeSjmFSp570XVDgiBHZW7YLHslyOS/+gn3w21C23fTjL+iS/MYPPy9NTTJbD09P/j66l/1afX2eHzD9HuHGNXFiaquWB9Egl0l5yUTOc9Z0Z8PyJKiEIh3xJ2KlKWeM1aEQpHQOpA7vXUHayq1v6dJ6btc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bT7iB2nM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E0DDC4CEF7;
	Thu,  5 Feb 2026 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770292359;
	bh=9I2d/CTCHd1EmORTa0eVSIbKP6OzNEp8Xdg/zLtTphM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bT7iB2nMT+4w7M/s9S33h1W2adx1kLbtDDhNy2bFaJAy2FhcJKaqmG2q4h3Z+aOH8
	 ibq5pSPmy3r+gyFTe6Y+eD8N8+OIBh0fpai0lTBulR2UzfReKP51czzQq8IQZZV525
	 Gsqh8dtbLdCl4DhucFZv4qTyRWm4+DyWlyhGwxV7ClRRBiTEL9YuIXrKa7VRXfs9nk
	 V9wL1enMkAgqykieFwAnkCnJV9FtjEQ4a4DpqcZWvE8A3QfrCgTz6IvDXjlxItvEnb
	 jfI1wKbAYbjyrao8X2IhHJKjGEsvzNnkNBmbbSANOGUVnmw2dZ6gdy8uDJP1JSM3bD
	 exd2diExYIVmg==
Message-ID: <26a44a31-3ab3-40f0-9ef2-e4bb6484a254@kernel.org>
Date: Thu, 5 Feb 2026 12:52:35 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] docs: media: media-committer: do some editorial
 changes
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Sean Young <sean@mess.org>
References: <dc12b2f42304866ccc04053f2a3c97e84c7558a1.1770215865.git.mchehab+huawei@kernel.org>
 <ada3056177e5e4e65119fb1b617777a680534e64.1770215865.git.mchehab+huawei@kernel.org>
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Content-Language: en-US
In-Reply-To: <ada3056177e5e4e65119fb1b617777a680534e64.1770215865.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52246-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,linuxtv.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1631FF212A
X-Rspamd-Action: no action

Hi Mauro,

For the most part I agree, but I have some suggestions regarding the point 4
you added, since I think it just restates what is already mentioned in
maintainer-entry-profile.rst.

Let me know what you think of my suggestions.

On 2/4/26 15:37, Mauro Carvalho Chehab wrote:
> Do some editorial changes to make it look clearer:
> 
>   - media-committers tree references corrected from singular to plural;
>   - updated commit rights wording and responsibilities;
>   - fixed various typographical errors;
>   - corrected “mailing list” and “Kernel” references;
>   - improved core committer description;
>   - updated documentation paths and URLs;
>   - added missing “for” and improved sentence flow.
> 
> Perhaps the most relevant change is that i removed a word
> that was requiring granting Patchwork rights some time before
> adding commit rights (we may grant them altogether if makes
> sense for us), and I added a 4th note to committer notes
> list to let it clear that about what it is expected from a
> committer with regards to updating Patchwork.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../driver-api/media/media-committer.rst      | 97 ++++++++++---------
>  1 file changed, 51 insertions(+), 46 deletions(-)
> 
> diff --git a/Documentation/driver-api/media/media-committer.rst b/Documentation/driver-api/media/media-committer.rst
> index 18cce6e06a2b..c83e94750e57 100644
> --- a/Documentation/driver-api/media/media-committer.rst
> +++ b/Documentation/driver-api/media/media-committer.rst
> @@ -20,8 +20,8 @@ and the Linux Media community.
>  
>  .. Note::

Re-reading this I don't really think this should be a note at all. This just
lists the additional responsibilities of a media committer, no need to
present this as a 'note'.

>  
> -   1. Patches you authored must have a Signed-off-by, Reviewed-by or Acked-by
> -      of another Media Maintainer;
> +   1. Patches you authored must have a ``Signed-off-by``, ``Reviewed-by``
> +      or ``Acked-by`` from another Media Maintainer;
>     2. If a patch introduces a regression, then it is the Media Committer's
>        responsibility to correct that as soon as possible. Typically the
>        patch is either reverted, or an additional patch is committed to
> @@ -29,14 +29,18 @@ and the Linux Media community.
>     3. If patches are fixing bugs against already released Kernels, including
>        the reverts above mentioned, the Media Committer shall add the needed
>        tags. Please see :ref:`Media development workflow` for more details.
> +   4. All Media Committers are responsible for maintaining
> +      `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_,
> +      updating the state of the patches they review or merge.
> +

I don't really agree with this. Not that it hurts, but maintaining patchwork
is a job of media maintainers. The only addition for committers is that they
have to update patches in patchwork to 'Accepted' when they have committed
them. That is certainly worth mentioning (including updating the maintainers
profile to clearly state that only committers can set it to Accepted.

So in maintainer-entry-profile.rst in 1.3 I would change the description for
the Accepted state to:

"Accepted: Once a patch is merged in the media-committers tree. Only Media
Maintainers with commit rights can set this state."

And change point 4 to this:

4. After committing a patch, the Media Committer must also update the
   patch status to ``Accepted`` in
   `Patchwork <https://patchwork.linuxtv.org/project/linux-media/list/>`_.

>  
>  Becoming a Media Committer
>  --------------------------
>  
>  Existing Media Committers can nominate a Media Maintainer to be granted
> -commit rights. The Media Maintainer must already have patchwork access and
> -have been in that role for some time, and has demonstrated a good
> -understanding of the maintainer's duties and processes.
> +commit rights. The Media Maintainer must have patchwork access,
> +have been reviewing patches from third parties for some time, and has
> +demonstrated a good understanding of the maintainer's duties and processes.
>  
>  The ultimate responsibility for accepting a nominated committer is up to
>  the Media Subsystem Maintainers. The nominated committer must have earned a
> @@ -61,8 +65,8 @@ Media Committer's agreement
>  Once a nominated committer is accepted by all Media Subsystem Maintainers,
>  they will ask if the developer is interested in the nomination and discuss
>  what area(s) of the media subsystem the committer will be responsible for.
> -Those areas will typically be the same as the areas that are already
> -maintained by the nominated committer.
> +Those areas will typically be the same as the areas that the nominated
> +committer is already maintaining.
>  
>  When the developer accepts being a committer, the new committer shall
>  explicitly accept the Kernel development policies described under its
> @@ -77,7 +81,7 @@ following the model below::
>  
>     ...
>  
> -   For the purpose of committing patches to the media-committer's tree,
> +   For the purpose of committing patches to the media-committers tree,
>     I'll be using my user https://gitlab.freedesktop.org/users/<username>.
>  
>  Followed by a formal declaration of agreement with the Kernel development
> @@ -85,7 +89,7 @@ rules::
>  
>     I agree to follow the Kernel development rules described at:
>  
> -   https://www.kernel.org/doc/html/latest/driver-api/media/media-committer.rst
> +   https://www.kernel.org/doc/html/latest/driver-api/media/media-committers.rst

BTW, I agree that this file should be renamed to media-committers.rst. That matches
the name of our git tree as well.

>  
>     and to the Linux Kernel development process rules.
>  
> @@ -97,18 +101,17 @@ rules::
>     my commit rights.
>  
>     I am aware that the Kernel development rules change over time.
> -   By doing a new push to media-committer tree, I understand that I agree
> +   By doing a new push to media-committers tree, I understand that I agree
>     to follow the rules in effect at the time of the commit.
>  
> -That e-mail shall be signed with a PGP key cross signed by other Kernel and
> -media developers. As described at :ref:`media-developers-gpg`, the PGP
> -signature, together with the gitlab user security are fundamental components
> -that ensure the authenticity of the merge requests that will happen at the
> -media-committer.git tree.
> +That e-mail shall be signed via the Kernel Web of trust with a PGP key cross
> +signed by other Kernel and media developers. As described at
> +:ref:`media-developers-gpg`, the PGP signature, together with the gitlab user
> +security are fundamental components that ensure the authenticity of the merge
> +requests that will happen at the media-committers.git tree.
>  
> -In case the kernel development process changes, by merging new commits
> -to the
> -`media-committer tree <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
> +In case the kernel development process changes, by merging new commits to the
> +`media-committers tree <https://gitlab.freedesktop.org/linux-media/media-committers>`_,
>  the Media Committer implicitly declares their agreement with the latest
>  version of the documented process including the contents of this file.
>  
> @@ -118,25 +121,27 @@ notify the Media Subsystem Maintainers about that decision.
>  .. note::
>  
>     1. Changes to the kernel media development process shall be announced in
> -      the media-committers mailinglist with a reasonable review period. All
> -      committers are automatically subscribed to that mailinglist;
> +      the media-committers mailing list with a reasonable review period. All
> +      committers are automatically subscribed to that mailing list;
>     2. Due to the distributed nature of the Kernel development, it is
>        possible that kernel development process changes may end being
> -      reviewed/merged at the linux-docs mailing list, specially for the
> -      contents under Documentation/process and for trivial typo fixes.
> +      reviewed/merged at the Linux Docs and/or at the Linux Kernel mailing
> +      lists, especially for the contents under Documentation/process and for
> +      trivial typo fixes.
>  
>  Media Core Committers
>  ---------------------
>  
> -As described in Documentation/driver-api/media/maintainer-entry-profile.rst
> +A Media Core Committer is a Media Core Maintainer with commit rights.
> +
> +As described in Documentation/driver-api/media/maintainer-entry-profile.rst,
>  a Media Core Maintainer maintains media core frameworks as well, besides
> -just drivers, and so is able to change core files and the media subsystem's
> -Kernel API. A Media Core Committer is a Media Core Maintainer with commit
> -rights. The extent of the core committer's grants will be detailed by the
> +just drivers, and so is allowed to change core files and the media subsystem's
> +Kernel API. The extent of the core committer's grants will be detailed by the
>  Media Subsystem Maintainers when they nominate a Media Core Committer.
>  
>  Existing Media Committers may become Media Core Committers and vice versa.
> -Such decisions will be taken in consensus between the Media Subsystem
> +Such decisions will be taken in consensus among the Media Subsystem
>  Maintainers.
>  
>  Media committers rules
> @@ -148,16 +153,16 @@ shall be merged as soon as possible, aiming to be merged at the same Kernel
>  cycle the bug is reported.
>  
>  Media committers shall behave accordingly to the rights granted by
> -the Media Subsystem Maintainers, specially with regards of the scope of changes
> +the Media Subsystem Maintainers, especially with regards of the scope of changes
>  they may apply directly at the media-committers tree. That scope can
> -change over time on a mutual agreement between media committers and
> -maintainers.
> +change over time on a mutual agreement between Media Committers and
> +Media Subsystem Maintainers.
>  
>  The Media Committer workflow is described at :ref:`Media development workflow`.
>  
>  .. _Maintain Media Status:
>  
> -Maintaining media maintainer or committer status
> +Maintaining Media Maintainer or Committer status
>  ------------------------------------------------
>  
>  A community of maintainers working together to move the Linux Kernel
> @@ -165,27 +170,27 @@ forward is essential to creating successful projects that are rewarding
>  to work on. If there are problems or disagreements within the community,
>  they can usually be solved through healthy discussion and debate.
>  
> -In the unhappy event that a media maintainer or committer continues to
> +In the unhappy event that a Media Maintainer or Committer continues to
>  disregard good citizenship (or actively disrupts the project), we may need
>  to revoke that person's status. In such cases, if someone suggests the
> -revocation with a good reason, then after discussing this among the media
> -maintainers, the final decision is taken by the Media Subsystem Maintainers.
> -As the decision to become a media maintainer or committer comes from a
> -consensus between Media Subsystem Maintainers, a single subsystem maintainer
> -not trusting the media maintainer or committer anymore is enough to revoke
> -the maintenance/patchwork or commit rights.
> +revocation with a good reason, then after discussing this among the Media
> +Maintainers, the final decision is taken by the Media Subsystem Maintainers.
>  
> -A previous committer that had their commit rights revoked can keep
> -contributing to the subsystem via the pull request workflow as documented
> -at the :ref:`Media development workflow`, unless they were also removed as
> -Media Maintainer.
> +As the decision to become a Media Maintainer or Committer comes from a
> +consensus between Media Subsystem Maintainers, a single Media Subsystem
> +Maintainer not trusting the Media Maintainer or Committer anymore is enough
> +to revoke their maintenance, Patchwork grants and/or commit rights.
> +
> +Having commit rights revoked doesn't prevent Media Maintainers to keep
> +contributing to the subsystem either via the pull request or via email workflow
> +as documented at the :ref:`Media development workflow`.
>  
>  If a maintainer is inactive for more than a couple of Kernel cycles,
>  maintainers will try to reach you via e-mail. If not possible, they may
> -revoke your maintainer/patchwork and committer rights and update MAINTAINERS file
> -entries accordingly. If you wish to resume contributing later on, then contact
> -the Media Subsystem Maintainers to ask if your maintenance/patchwork and
> -commit rights can be restored.
> +revoke their maintainer/patchwork and committer rights and update MAINTAINERS
> +file entries accordingly. If you wish to resume contributing as maintainer
> +later on, then contact the Media Subsystem Maintainers to ask if your
> +maintenance, Patchwork grants and commit rights can be restored.
>  
>  References
>  ----------


Regards,

	Hans

