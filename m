Return-Path: <linux-media+bounces-60759-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODVCALNP/GlOOAAAu9opvQ
	(envelope-from <linux-media+bounces-60759-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:39:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB0F4E4F55
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 10:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 76430300621F
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 08:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F335438B14D;
	Thu,  7 May 2026 08:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZaYzEXnc"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13AC838839D
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 08:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143139; cv=none; b=e/wIxQGntlWVpH12vy4vv5JDET1Yj33qnKfPviPn4i2HntZAfwhAbNB3s6hcnhP26Ja8slgA8B/KFAV8RFKQKk+gUsz3+2EjvojMNUufvVD+TyWFtpivOcKLzwL6EUzhR+ZRSACYFwBvVMTzYFWBlxCZo0g/74vtONkxS5ETHk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143139; c=relaxed/simple;
	bh=4i6jv4QnUxTRpo7xFb8zX8m66+KDf6N+RF1uZDXfJOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1rrCCPusqrQ9TbKcFZe82qVseXmOUrglGG7xDtf1FZ5iMfKJv7osG6u7oU2Mz5hesAE9EjhYCINX2bItfmdJkpZhcDTsacOrvnxaRAkjxY5QAAmbpAU3J0P16Ca834QALEcozWYp6YEVVxHu91jF9APZxJF+R5FJwG4yAmIQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZaYzEXnc; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b93698bb57aso104374466b.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778143128; x=1778747928; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=14BC2eCZILxVNw7ffjxF30JLC4DeGYSgUp+9KQUeI48=;
        b=ZaYzEXncPNx0+OIT38/ZTdfv2CCklLpAtTjrYS8qVgLrk+kVTExfXn72kPrOuvqTqJ
         6tBvI5kyiBmTvH9JVLVCeEfjj5W1fZ2aNuBEn/cctGTC+i11/L8QR4iRXSn68POkdPit
         NAzRiGoFjmAGzmwM1y9aE8gkM0kOQCpwddZSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143128; x=1778747928;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14BC2eCZILxVNw7ffjxF30JLC4DeGYSgUp+9KQUeI48=;
        b=dTEFfON0lV394XHRyKyzdshOBDWd4k9L86LpxcSN+PGIqG/G8Dox7ItV68HAEhP2M2
         BMTMpkCQOAxKCoYUDCPK1hMh7nunJqqfBG/nDYFaRN6DUdJxT6ah3R7piGwwkGMyrWnY
         CBfpYZzzTD7xXR/yvCRvDde5OEYgJvDOcdnJxSSOE2eRwBvpdYP+jR7bhwfeANkEaiBZ
         bwi+JdeG88auTrYOyRdpG9D2AJok/RqFDjlpDgE9+Qy9BToFnJUFaVUhrviQM4fsAr2S
         MJvq33I2oHZYobrkIPHUw85M6bFN2alMOMmDNJ8+sU43nu16Jpnf62wChzgMQMfRFZrK
         ERnQ==
X-Gm-Message-State: AOJu0YyiZR7Byw3QxJYiuxhwQOCkYCmL+mjYtC1vdygJFlaNc9JwSVIb
	qK35jSGLbyWg5ISPNjIRJy2fhAECO3EAnHlaDZT0wkpGzH0XS8UffpqkItifKd6mjsyOXRrGcbq
	6K7cRvw==
X-Gm-Gg: AeBDietzIS/5eaG4ZUJoFZUPCc9aU9x+htHM9eYEJwt/7BXklnVh+3qTj9J52LvpW2k
	CGECM6LjWXGG0hoWt6nhbqBNsVG6jVqDE1YZTkF1xQe9neV8VWDNZABIy7wq7VNUueo8E1boFdK
	4j7SDNgzn7Qx16QJsNixKkcUIDYSLWFbHbP/OMvD/Xu5pkX8/eeu4D2MonZ1VZNyjE/AxWvw/eG
	d1dByBQk25L4RteMNLUgOp4fRbAm+uXaFGql1ufWCexX/IXhYMWR7lJxdZ5h/cDioYYOQast2Se
	rAn0iyd66JUc6QNf3QgNLVY1WrmQgWGd5ACDqv/msXOuYrKRLr8H1w8tXhXymUeQb8jscXGC9N8
	SVjF39k2dhDARCR9eQ4ZCzf5ffUHc1WyFxxzw6maKUN2/j3ydj0CjsEb6rTRgOcS5260PeMkea6
	TWSSMqBxR2E2SdY/UM0vIfVVGbS0+JA+q87Rl1IqqZ7hM24lY/f2BJLB9N1RLl3lJwbu7J8bpwH
	hm9SC8YqQ==
X-Received: by 2002:a17:907:1b10:b0:b9c:bf69:8b54 with SMTP id a640c23a62f3a-bc85cba9a6fmr93518466b.18.1778143127384;
        Thu, 07 May 2026 01:38:47 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc81cd3492bsm56517166b.12.2026.05.07.01.38.46
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:38:46 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67b32c695efso2745404a12.1
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 01:38:46 -0700 (PDT)
X-Received: by 2002:a17:907:3e23:b0:bc2:d5c8:1c8b with SMTP id
 a640c23a62f3a-bc84cd6ec27mr98408766b.6.1778143125563; Thu, 07 May 2026
 01:38:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <69fbc7c8.9d0a0220.1bdb77.e857@mx.google.com> <20260506231134.GD1778786@killaraus.ideasonboard.com>
 <CANiDSCvfB3xJGfwwSAgXEBHQEU8qoyLOrtSEEfGaBwMWYaCG4w@mail.gmail.com> <20260507081823.GG1778786@killaraus.ideasonboard.com>
In-Reply-To: <20260507081823.GG1778786@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 7 May 2026 10:38:33 +0200
X-Gmail-Original-Message-ID: <CANiDSCuR4cd5euyOzmW0V-cLcwmGngFFbXZQU3Y2SPBZdwywXg@mail.gmail.com>
X-Gm-Features: AVHnY4LtV0n5j1sVpFDG6Dz1Brl_xl7l_P8PWJWbJsNyPjHUtQXlNelTh2Po5Jo
Message-ID: <CANiDSCuR4cd5euyOzmW0V-cLcwmGngFFbXZQU3Y2SPBZdwywXg@mail.gmail.com>
Subject: Re: [v2,0/2] media: renesas: vsp1: Fix display pipeline regression
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: EDB0F4E4F55
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60759-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Laurent



On Thu, 7 May 2026 at 10:18, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, May 07, 2026 at 07:30:43AM +0200, Ricardo Ribalda wrote:
> > On Thu, 7 May 2026 at 01:11, Laurent Pinchart wrote:
> > > On Wed, May 06, 2026 at 03:59:20PM -0700, Patchwork Integration wrote:
> > > > Dear Laurent Pinchart:
> > > >
> > > > Thanks for your patches! Unfortunately the Media CI robot detected some
> > > > issues:
> > > >
> > > > # Test media-patchstyle:./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch media style
> > > > ERROR: ./0001-Revert-media-renesas-vsp1-Initialize-format-on-all-p.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
> > > > ERROR: Commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6 found in the stable tree, but stable@vger.kernel.org not in Cc:
> > > >
> > > > # Test media-patchstyle:./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch media style
> > > > ERROR: ./0002-Revert-media-renesas-vsp1-brx-Fix-format-propagation.patch: Missing committer Ricardo Ribalda <ribalda@chromium.org> Signed-off-by
> > >
> > > I'm not going to add your SoB to my patches :-)
> >
> > You did not get the memo. From now on, all patches in the kernel need
> > to be SoB my me :P
> >
> > Sorry about that, Yesterday I had to recreate the local repo and
> > forgot to set the proper committer. It should be fixed now.
> >
> > > > ERROR: Commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f found in the stable tree, but stable@vger.kernel.org not in Cc:
> > >
> > > I don't see these commits in any of the stable branches. Does the
> > > message mean the mainline tree, not the stable tree ?
> >
> > It means the stable tree
> >
> > ribalda@ribalda:~/work/linux$ git fetch
> > git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> > 937f3e6b51f1cea079be9ba642665f2bf8bcc31f
> > From git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux
> >  * branch
> > 937f3e6b51f1cea079be9ba642665f2bf8bcc31f -> FETCH_HEAD
>
> Ah right. But I don't think that's relevant. The commit is from the
> master branch of the stable tree, which simply mirrors Linus' tree. It's
> not in any stable branch.
>
> $ git clone https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git stable
> Cloning into 'stable'...
> [...]
> laurent@killaraus ~/src/kernel $ cd stable
> laurent@killaraus ~/src/kernel/stable $ git branch -a --contains 937f3e6b51f1cea079be9ba642665f2bf8bcc31f
> * master
>   remotes/origin/HEAD -> origin/master
>   remotes/origin/master
> laurent@killaraus ~/src/kernel/stable $ git tag --contains 937f3e6b51f1cea079be9ba642665f2bf8bcc31f
> v7.1-rc1
> v7.1-rc2
>
> This means the commit hasn't been backported to stable, it has just been
> merged to mainline.
>
> If the purpose of this is to check if the commit has been merged in
> mainline, I think the message should refer to mainline. If it's to check
> if it has been backported to a stable kernel, then those are false
> positives.
>
> Note that commit ID change when they're backported. If you want to check
> if a commit has been backported, you'll need to grep for
>
>     commit ${upstream_commit_id} upstream.
>
> in commit *messages* of all stable branches.
>
> > > Given that this series should be merged in v7.1 as a regression fix, why
> > > should it CC stable ?
> >
> > Somehow that patch has been backported, so I guess it should cc stable.
>
> No, it hasn't been backported.
>

You are completely right. And we have been doing this wrong for a long time....

We have a challenge that it is not trivial to fix. The builder do not
have a clone of linus-stable, it queries it with something similar to
"git ls-remote". So I cannot use "git log | grep".

Ideally we could have a web server to check if a sha has been
backported, but that does not exist yet. It could probably be a nice
little vibecoding project.

The question right now is if it is best to disable the check
completely or keep it and live with the false positives.

Need to check with my pillow.

> > > > Please fix your series, and upload a new version. If you have a patchwork
> > > > account, do not forget to mark the current series as Superseded.
> > > >
> > > > For more details, check the full report at:
> > > > https://linux-media.pages.freedesktop.org/-/users/patchwork/-/jobs/99198847/artifacts/report.htm .
> > > >
> > > >
> > > >
> > > > Best regards, and Happy Hacking!
> > > > Media CI robot on behalf of the linux-media community.
> > > >
> > > > ---
> > > > Check the latest rules for contributing your patches at:
> > > > https://docs.kernel.org/driver-api/media/maintainer-entry-profile.html
> > > >
> > > > If you believe that the CI is wrong, kindly open an issue at
> > > > https://gitlab.freedesktop.org/linux-media/media-ci/-/issues or reply-all
> > > > to this message.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

