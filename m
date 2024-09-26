Return-Path: <linux-media+bounces-18616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8306B9871EE
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 12:47:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1192728B3CF
	for <lists+linux-media@lfdr.de>; Thu, 26 Sep 2024 10:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC341AB6EE;
	Thu, 26 Sep 2024 10:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YcdnK76o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DFB1F95C
	for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 10:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727347628; cv=none; b=efI/oVq/jUUPYgNaLga6OmqpkPwdryg/bVaNuPxliI7CBqbHcERFOV1Ssm+336a2z/WzCVhDR3rhzMGswyIotfrv5D8MqLx+3pcJPiZW7FyLj1/GlDx8jaRwzHgCx6IyFnyOdfuAr/rVHgC/FLwc6DFLDZiPzD2A8WUfcWekAiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727347628; c=relaxed/simple;
	bh=wUJg1OuUgHJlsXvds6Se8/uZbfg849GSvryawPMrNas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQmbWL09H3XYt9oD85uUaqkmy67BvfxixXsvR8OgxQK7a7iaA/3VA8LJEsJ6gwlHbQRaNdwbkoTCftkp3VFWUugBDH7lv0V8gJrniO9uQX3CJn20xkD4moiyDT7DfXx7mjM2D4N9WJlUrpyIhjb7WJBuE8HoAfU45LrYhfngXqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YcdnK76o; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2053a0bd0a6so7701015ad.3
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 03:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727347626; x=1727952426; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0/spgF1iJrvtpAN/nVgK5/+tt8kFYai8xmFu53bGIvI=;
        b=YcdnK76o6Aup3zsk/oepmKUsogIhKr9P72qCLmL3Beyw7BecUhjUnnMfHnlW6W5TvU
         QfhLW+5qB941r1EsaXjHyUkLFtT4+RjP8eNAUqizdebEi1L43lCSgHALdZayB0WRiBqH
         gFU/OodYe7XEYQU/zlfVf2walJCXpmX8fPSzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347626; x=1727952426;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0/spgF1iJrvtpAN/nVgK5/+tt8kFYai8xmFu53bGIvI=;
        b=UaNcAE6rpVVI7SUA5Gv7a54pVFMvqVjRfMgLS24iUOcg/Zyume7aQIqr5+0trxsqKX
         3/xJT9BHC6ouELC7ebxQYreC6rnl5tEwfR6JEpEJy0GjbD9VBzXzWordm8Yoxsw9/DUh
         dj+BRSjU93T8M9cZE1K4eb4klBJxkvaw+V/fBQifhD/AEfG5OwEM4h+eE+2miGYdLFHm
         YL1K4tXphDe4Cb8DojwEqMG5rnZC2bj3awszpaYYbYL6Z9oZH4EoRo7ZL/Pr3s/74zWj
         vNeVdmzDdkCDxBEA/2zenj1VO+1vSUYmnTLOf3pWO6R65z+Sdqlifvdr9QoL7fAzcHM9
         5OfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpTdon9u3JlC/8H3+2R9c9/ZbS4DRcec1Z0ItXZnIHdAG5bFbfzPMAe8EZ9ivnfH9eSeaHthzacKzJfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn88UX8b4XKfh4AAcInkKqzMbVYZTakgn0CBIKzq2Td93ogkC+
	o88q+mUeuN8nVBTDP6DW5dE67a22q6MgSVmbO49p6knSB09P2kvXWBNG71QCvbvMtnMwA8kEx0c
	=
X-Google-Smtp-Source: AGHT+IFBwtXSjq7TYnLfqYrb2ypMVs7amPYk36iFwusq88F93q36h6R4qr63ZXuN1/Bgayik/58kjA==
X-Received: by 2002:a17:902:f68f:b0:205:627c:8001 with SMTP id d9443c01a7336-20afc400742mr86576695ad.5.1727347625941;
        Thu, 26 Sep 2024 03:47:05 -0700 (PDT)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b0d946df0sm17833425ad.181.2024.09.26.03.47.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 03:47:05 -0700 (PDT)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2053a0bd0a6so7700885ad.3
        for <linux-media@vger.kernel.org>; Thu, 26 Sep 2024 03:47:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXfCS+wuH53NNTz+kDq5BfOmh9GFvvwpbvkvHfQ8vCAp5wT5hrqNa4YRDosHAslr/lRUL987P0heNwgvg==@vger.kernel.org
X-Received: by 2002:a17:902:e5c8:b0:20b:202b:4d32 with SMTP id
 d9443c01a7336-20b202b4fc5mr21925445ad.19.1727347624590; Thu, 26 Sep 2024
 03:47:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310> <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan> <20240925195843.GK30399@pendragon.ideasonboard.com>
 <902b2828-5eb8-4741-90af-8e42f1240e86@xs4all.nl> <ZvUpuopPY8lwBHEm@kekkonen.localdomain>
 <20240926121914.69b47a50@foz.lan> <20240926102448.GA21788@pendragon.ideasonboard.com>
 <ZvU49mrccFlKDhD0@kekkonen.localdomain> <20240926104022.GD21788@pendragon.ideasonboard.com>
In-Reply-To: <20240926104022.GD21788@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 26 Sep 2024 12:46:49 +0200
X-Gmail-Original-Message-ID: <CANiDSCvMmd0eQCWHj6rt0u8nu0uVnDbYT=GJsobxHGOHE74DZw@mail.gmail.com>
Message-ID: <CANiDSCvMmd0eQCWHj6rt0u8nu0uVnDbYT=GJsobxHGOHE74DZw@mail.gmail.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Hecht <martin.hecht@avnet.eu>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Michael Tretter <m.tretter@pengutronix.de>, 
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, 
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, 
	Hidenori Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>, 
	Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, 
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Content-Type: text/plain; charset="UTF-8"

Hi!

On Thu, 26 Sept 2024 at 12:40, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Sep 26, 2024 at 10:35:34AM +0000, Sakari Ailus wrote:
> > Hi Laurent,
> >
> > On Thu, Sep 26, 2024 at 01:24:48PM +0300, Laurent Pinchart wrote:
> > > On Thu, Sep 26, 2024 at 12:19:14PM +0200, Mauro Carvalho Chehab wrote:
> > > > Em Thu, 26 Sep 2024 09:30:34 +0000
> > > > Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> > > >
> > > > > > >>> Can you refresh my memory which processes need more work?
> > > > > > >>
> > > > > > >> I have the same doubt. As discussed during the summit, Hans and I had some
> > > > > > >> discussions yesterday, to address a few details. For both of us the process
> > > > > > >> sounds well defined.
> > > > > > >>
> > > > > > >> From my personal notes, this will be the new process:
> > > > > > >>
> > > > > > >> - committers will merge patches at media-committers.git tree at fdo,
> > > > > > >>   provided that they'll follow the rules defined on a committers agreement
> > > > > > >>   and (partially?) enforced by media-ci checks;
> > > > > > >> - core committers follow the same rules, with a broader privilege of
> > > > > > >>   changing kernel API/ABI;
> > > > > > >> - committers will ensure that patchwork will reflect the review process of
> > > > > > >>   the patches;
> > > > > > >> - maintainers will double-check if everything is ok and, if ok, merge the
> > > > > > >>   changes at linuxtv.org. We intend to rename the tree there to "media.git",
> > > > > > >>   being the main tree to be used for development;
> > > > > > >> - pull requests will keep using the same process as currently. The only
> > > > > > >>   change is that the media-stage.git tree will be renamed to "media.git";
> > > > > > >> - maintainers will periodically send patches upstream.
> > > > > > >>
> > > > > > >> The media-commiters.git tree at fdo might be rebased if needed; the
> > > > > > >> media.git tree at linuxtv.org is stable. A large effort will be taken to
> > > > > > >> avoid rebasing it.
> > > > > > >>
> > > > > > >> We may need some helper scripts and/or use pwclient to keep patchwork
> > > > > > >> updated after committers reviews.
> > > > > > >
> > > > > > > What will happen if we update the status of patches in patchwork when
> > > > > > > merging them to the fdo tree, and the tree is later rebased to drop
> > > > > > > commits ? Will the person rebasing handle updating patchwork to move the
> > > > > > > patches back from accepted to a different status ?
> > > > > >
> > > > > > That should be the responsibility of the person doing the rebase. I think
> > > > > > that's what is done today as well in the rare cases we rebase.
> > > > >
> > > > > Sounds reasonable. I'd also like to avoid rebases as much as possible.
> > > > >
> > > > > Do we have a list of cases where a rebase would be needed? A license issue
> > > > > or a missing Sob line, perhaps?
> > > >
> > > > No, and I don't think we can write a rule to cover such cases. The only rule
> > > > is that it is up to maintainers to decide to do a rebase or not, and this
> > > > will be done case by case.
> > > >
> > > > With regards to the cases you mentioned, it is almost surely that license
> > > > issues will call for a rebase. The same may apply up to some point for
> > > > missing/refused SoBs from authors, co-developers and from the committers.
> > > >
> > > > Yet, I would expect that a more common case is if someone touches the code
> > > > and another committer/developer/author nacks with such changes.
> > > >
> > > > So, for instance, suppose you maintain driver A. Some other committer
> > > > may end merging a patch for driver A without your ack. Depending on the
> > > > patch that could be OK (trivial/doc changes, bugs with bug fixes that
> > > > are available for some time, etc).
> > > >
> > > > Yet, even if the committer did an honest handling of the patch, you may
> > > > still disagree or want some changes at the original patch. On such cases,
> > > > the maintainers may decide to drop the changes and do a normal review
> > > > process. They may otherwise request a patch on the top of the applied
> > > > one to address the pointed issues.
> > >
> > > Let's do a revert in that case, and keep rebases for cases where having
> > > content in the git history causes issues other than bisection problems.
> >
> > I'd very much prefer this as well: revert or fix, if at all reasonable,
> > instead of rebasing should be a rule.
> >
> > > I'd argue that even a missing SoB may not be a cause for rebase if it's
> > > an accident, but that's not worth debating because CI will make sure
> > > this never happens.
> >
> > Does it?
> >
> > checkpatch.pl checks should just be warnings. And that should probably
> > stay. Sob: and From: being different isn't necessarily that far-fetched as
> > having an address in .mailmap may change From: field but not Sob:,
> > resulting in a checkpatch.pl warning.
> >
> > I wonder if checkpatch.pl should know about .mailmap actually, currently it
> > doesn't. I could send a patch.
>
> We have an explicit check in the CI to ensure that both the author and the
> committer have a SoB line. It's not base on checkpatch.pl. Ricardo,
> could you confirm this ?

CI checks that there are at least 2 committers that agree with the
code (SoB, Reviewed-by or Ack-by)
https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/lib/test-trust.py?ref_type=heads

We also have a separate check for SoB:
https://gitlab.freedesktop.org/linux-media/media-ci/-/blob/main/test-media-patchstyle.sh?ref_type=heads#L61


>
> > > > There is also worse case scenarios, like a committer violating the
> > > > committer's agreement.
> > >
> > > I'm fine with rebases if someone gets rogue and merges malicious code,
> > > or commits with insults in the commit message. I don't foresee that
> > > happening regularly, if ever.
> >
> > I'm more concerned of a malicious actor getting access to the committer's
> > credentials rather than the committer him-/herself going crazy. And if this
> > happens, changes are it won't be noticed immediately.
>
> That's not much different than someone impersonating me or you when
> sending pull requests. Signing tags helps, but if someone steals
> credentials, it's also game over. With the new workflow the malicious
> changes will need to pass CI, so there may be more scrutiny :-)
>
> > Reminding of
> > <URL:https://github.com/lfit/itpol/blob/master/linux-workstation-security.md>
> > in the instructions might not be a bad idea.
>
> Agreed.
>
> --
> Regards,
>
> Laurent Pinchart



--
Ricardo Ribalda

