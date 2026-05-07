Return-Path: <linux-media+bounces-60862-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UK1LAqj+/GmxVwAAu9opvQ
	(envelope-from <linux-media+bounces-60862-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:05:44 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B94EF1B2
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 23:05:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8733230356EC
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 21:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD0E340A43;
	Thu,  7 May 2026 21:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQT7y8zJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD72DFA2F
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 21:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778187914; cv=pass; b=EDUzipcZkfglJdsWuq76bkaJV30sB03nQlvaH9A/FNMR42t47T+g40KxkWHjhWqDVwS9soWRKwPFcVZZRkP2UDog7FJ0VLHQ6/GZHZX1IDF/Ojrsb5UA2z6Jc5p8U0bD/iaQf5RwFfDn4BOT1PFO+WEb7qoro9nkIg63RfNN8jQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778187914; c=relaxed/simple;
	bh=jE+/jUqv7pNoCfzauPI8lFa2VQ2OKNCvpXHgcRT4LRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q2q4ZMzrmxDhHwni0S6czd7nhMBDOCv5vnBi0alEQEu7E4qYYEHRd4etbP7PqKoUkAiOAjRFhYAaqy9uKOf7yGAStIN+EbRLqivG1dpEay8yU795QQERfwDbMuKNDhByaDdVhd7H2qGC6qzN5eiAIQGK4tT/hF+omE5H4s1Cozo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQT7y8zJ; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40427db1300so962563fac.0
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 14:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778187912; cv=none;
        d=google.com; s=arc-20240605;
        b=lh/PD6ZsLhSgqrGrx1nf35QnTdcL8tYKKpGoGxejElsOkp7LXfnJZbk5e4/FgK3IXz
         t0Sz7/4+lIIUehoWvQnxMoihwS8ZOArfXro+kpQqWf84Tu/nm/SngTr+SxsoeHcCN+FH
         8ArYjm3rK8qdy9nI8rz/VXEy4Ee7Joei5B3GRxefs/lE6Cj7bRo0CdDndE1VT9hcbg/y
         nGy0KQE5zUH9OzV1+EdwRA1AsN18WHaM7nlb9bxHn83FxiCtlQOLWi3bmsUkS4ETYFc7
         YrK0zn5/G22ovvPNk4Gj1ccSwF7aHqAXTPXLlWpvO4nCS4H38ebF1UwOQRZnelj4N/Mq
         +chQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uM69f/OhaRvPDM2WKfYEa4uqX5GcZJHERLXCxzT36H0=;
        fh=r6grmBQVOj6clol87cXC/dUNpgGujFnOw2W+3AyoJfY=;
        b=Q1U6aDLsVdCf474ULDmzHBVXxYbOFWrXcLRJRA3Nv7FwxJYOwf6Sw60Mpb11EqWDYP
         5yJRg49mOp6RxKKwivCjPPCS9xKCknhFjXUlRqiFUzVvniuOr32snje1GF59zreIeKvy
         kU+aMJNHBvwj4BNPwOfM2N5kE1ehj31zfirbJhTWGI2TZisgTEfGc2QB7GbAOJH6KL8G
         pBg1jxBMrgR/mkaB6hX9OKxN+A99ROEVPbYlZDkIUpTRU0JKM6UGUj7KwORvqQ8m7VS4
         KrLrFYONlLSoSBZtbOAoEyHZOmvED5pv52gKPL4QLOXzx6qCazPcSbY1+RM2XzpYr+JN
         nX/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778187912; x=1778792712; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM69f/OhaRvPDM2WKfYEa4uqX5GcZJHERLXCxzT36H0=;
        b=UQT7y8zJUNngkSy3gAzw+8rnMY8/4vXj/C4XUhtCXuZKbCwGD1IWospAmNDp/u9H9V
         cSkI/H6ZBC4CzjZu2TDCmDKKSEQPgRdM8rrTSnu4gcJGMNVEYa1+bFqCs6kuPIERcSwa
         AI5AdSSbFFPiTo5Ta0VV2TpmL2PewmKgmzqYVBJvyvSs34Z8C24fdEmKzUX1zT1EIqhf
         xivwaVHal57PDDpLd83JYYT312jJRAWhT5qJAsbEMizoQuSjfDJmBf0IbltnBAGDBuZj
         F7en4wISZsCo8VHYNqRg6vWpT7zaVBcibcye+4tXhU+mKTNrVJEPWfZJooijv/Leu5zy
         bbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778187912; x=1778792712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uM69f/OhaRvPDM2WKfYEa4uqX5GcZJHERLXCxzT36H0=;
        b=Av9NEbYAnHRRPgJbfriHC8J/CDrbsdUYIQBypN+9bsufHri5fCzv+FyTS2SfiQh1WE
         0lfzBRlGPW8xQZNa8rNBdZ4Ggz92vpTdYagUPtOS9DhV9Kjb3zVUn4MXncs8WW5SWcd9
         OTBxaO+jEA1G4QtgILJZ0N8DGhQINEde1V6ApNrABgb4K6BK9xKxsoAwsyUf6IE/QqRD
         bRfMt1iz4yXjlahnolC7V+UtmYDfJkfb+dubqJxAMvqRwSHS6q58bkCL3ylAjYAtPJis
         nUHJYH/YDleWTDsW4C8nRrB4sfi7VCDbvI9ikl3uMytpmSYNPipSlYiGffGM1ogk2XZ6
         sztg==
X-Forwarded-Encrypted: i=1; AFNElJ+PRCwxtfs2oFQu30RoEh15MdSaTwBbBfbj1nhRramqWE6gHMfJMjQo8UDFzzwaPQQpHkBRFwr3lPc8ew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYuSSd4NNK79JeJkReAf6ZA76tmAqj6f+OcH8hY6AcR7rMi0AJ
	e15xNORn1J5JHYHS9Sp27t5Oyk/2QSsgNRPXyeWdcL7E56+sCS7D1UGa3GF3nw1eVmj8hEqDH2c
	8RVC3kzJOEyG7gPWvcphN39cGlaTvMIQ=
X-Gm-Gg: AeBDieuuz65n8POVfBxjE3a6bpse9MegfytKovniIqp3xkGkFkrv7Y5fREZmnW6nBI7
	xpigh/6taECUq6Rbliv4tIM2PAoasPM/NYknAq5dRK/qcJ29Q60rtM4YMaeh7EHXTE4oEozHemM
	gIk3EKuRDfBZatEY+6jyVbTK9gOiU/jNw0B/8eMhTvAFDj5qhqWPApe0vq3ajyx0Vsug41GCWJJ
	MacBMlwWsCHXmfz4NGbY2ALRVlZPKoQStD+o1ZJD1po2yslornd8r/I7KT+tefEFNl9YyIAoSal
	KeVJcZbcuWS7Gbg0n/BIXWGIZot8N6qmspzBEQ==
X-Received: by 2002:a05:6870:9120:b0:40a:605b:518a with SMTP id
 586e51a60fabf-434f64f0e2bmr6401085fac.27.1778187911702; Thu, 07 May 2026
 14:05:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507022213.29290-1-dennylin0707@gmail.com>
 <20260507022213.29290-2-dennylin0707@gmail.com> <CAGEkeHc2MiJenQnyHa8wwYxpZfaBwZpy3=iXJCjAjvXrs9UsiQ@mail.gmail.com>
In-Reply-To: <CAGEkeHc2MiJenQnyHa8wwYxpZfaBwZpy3=iXJCjAjvXrs9UsiQ@mail.gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Thu, 7 May 2026 23:04:51 +0200
X-Gm-Features: AVHnY4Jo1IyTHyb9HmNlTOZ-S9HjOMOViUseCpdHPNPhWjhasIYCpZvP3cqqYK8
Message-ID: <CAPybu_1RvjRQ5ySkJum3AzTX9-bxmNmkcMMK7Q-Q14tZPSQHnQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: tegra-video: vi: fix invalid u32 return
 value in format lookup
To: Denny Lin <dennylin0707@gmail.com>
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, luca.ceresoli@bootlin.com, 
	thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	digetx@gmail.com, hverkuil+cisco@kernel.org, dan.carpenter@linaro.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 744B94EF1B2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60862-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ricardoribalda@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,bootlin.com,nvidia.com,gmail.com,linaro.org,vger.kernel.org,lists.linux.dev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Denny

On Thu, May 7, 2026 at 6:06=E2=80=AFAM Denny Lin <dennylin0707@gmail.com> w=
rote:
>
> Hi,
>
> The media CI reports a missing Signed-off-by from Ricardo Ribalda,
> but this patch was submitted directly by me and has not been handled
> by any committer yet.
>
> I believe this is a false positive.

It is indeed a false positive. Sorry about that

Regards!
>
> Could you please confirm?
>
> Thanks,
> Hungyu
>
> On Wed, May 6, 2026 at 7:22=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com=
> wrote:
> >
> > tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
> > signal an out-of-bounds index. This results in a large unsigned
> > value being returned, which may be interpreted as a valid fourcc.
> >
> > Returning 0 is not a valid fourcc either. This condition should
> > never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
> > access and return a valid fallback format instead.
> >
> > Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> > Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driv=
er")
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/vi.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/m=
edia/tegra-video/vi.c
> > index f14cdc7b5211..456134a9e8cf 100644
> > --- a/drivers/staging/media/tegra-video/vi.c
> > +++ b/drivers/staging/media/tegra-video/vi.c
> > @@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_=
vi *vi,
> >  static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
> >                                           unsigned int index)
> >  {
> > -       if (index >=3D vi->soc->nformats)
> > -               return -EINVAL;
> > +       if (WARN_ON_ONCE(index >=3D vi->soc->nformats))
> > +               return vi->soc->video_formats[0].fourcc;
> >
> >         return vi->soc->video_formats[index].fourcc;
> >  }
> > --
> > 2.34.1
> >
>


--=20
Ricardo Ribalda

