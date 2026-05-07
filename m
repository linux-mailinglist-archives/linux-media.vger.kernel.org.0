Return-Path: <linux-media+bounces-60703-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DDtEOwP/GlYKwAAu9opvQ
	(envelope-from <linux-media+bounces-60703-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:07:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8144E2C6D
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF9F0302ED78
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 04:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF1931D75E;
	Thu,  7 May 2026 04:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evlauorW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5DE318EE6
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.193
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778126786; cv=pass; b=Vwx8j4GlFBHsHvD/QMSB8MMz7pM4eAmbJe6+UQnSg1fjdMBUI1cox6xR6Er1BTVZEMNRviaY9Bkx4Y0vmeK/swa1bJBliwQ1J86gvAXYakj8Uto/BO2rC4imRrJWxE0HLna5+20JZ7F8PfA03SI+uGH9XS0c2eP9QV+P/FqTjDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778126786; c=relaxed/simple;
	bh=b6w9augMLPsLNh/LhQPxos8yZHi0gFrreJXIMasULec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dtOpQeSDLgzqbovQ78b/DG+a9ZciMObqDc3HH0VylJQYMjP52+P3kSv6E3Go9d4umT4D8BFPJSVD7s4HY5WNWrRUnl9JDTjayknTKZlf5xJdCNQqDsrUZ8aB3ahPMb9VSbFnP4+19/jjgveRR3bxpth28pc4jDN8x/fJ721JAvM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evlauorW; arc=pass smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso2674501fa.3
        for <linux-media@vger.kernel.org>; Wed, 06 May 2026 21:06:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778126781; cv=none;
        d=google.com; s=arc-20240605;
        b=A9scmxKjjU0U0UDBAmx6hBJba/dF0wJ49lFdA1COmWTvWtTbKI0IjDQUMIyY8lZXzN
         nY9QRdllfmehn1uFwVXv2gVOmNF7RljtJJwBwv2XIBBwHqV3OSvjXAj23qVeFpW6XuvL
         +mM9nTjfTKJxjq6aWbeXiX+nYdLUE2k9yg2GVhERCqmUEpok6VlsiFEBHYNtwrjiv8+0
         US0Fe4pFLAUYyQJ4HLwU29FAQKrj1yYHkRefiXGoeq9yh7tgDXDzWa/kW6N8yxnWs3+X
         DKC/jEljqIFAj31NXfqrfwY2bSNK37LmOfGIvPXj2TVVP6ciW+RPbxHMSAm1pmaYjjVD
         oO8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pga7PntbRCIrqIHJItT0gD5OU8oLLFDpVBORILI2ipc=;
        fh=ZzMcIoLKlgR5iRw4TMZ8mJehnthUQARUXCynXTMf6/I=;
        b=aZ0jb35lCHoNkyiUEU+ROLbIQVtTJwPZ52F4wMbcGQBJRoQ8hYH3nACkqM7LrTWu8V
         qhZupADfnNkDOss7Hy9JE59Y2HvHs8r0C/qldBNZWb+aq7xUtbAif9BDA5nXQYYKscWi
         6Ic5i0h2apW3B+d1O+XUi81AgPNQ+RmVmjTeiIHHbdVUl19GRA8GTKR+oYjpRrdpIi5s
         J6y8uPgrNlNPE81pCunYD2ELovGtnz1wZwKPGQ+rmjVflU9LP3Jyuwzw8g0eEOz6jQty
         sNQZ9cmH4yc5LvLatso2I/wJMmLE53lAewwaWJK2cnyMEXaQEAi/fz0iF8vyuBlAg6dU
         Cqsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778126781; x=1778731581; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pga7PntbRCIrqIHJItT0gD5OU8oLLFDpVBORILI2ipc=;
        b=evlauorWoXxSqDAShSUYH/bp6KMMfJEiuHuyedMSei/IJYiFduFZOUSYmS6mHWq8Pt
         5NuL/Cgg7exJZtrUHCw3+l7tlGo67S89MuAbnBFVAN/NzsErRQYyM583kft+IVKnIu2T
         zTS4I2ZlpVRP+BF2fu/3ABGJW1BwqRZHrmAxJ3fzAn2EQPTR7mKbYxJC6zBJQEWraAZF
         nFgaGI6fDOPELOVWZI40HlCnpzlHTSK3i8gqGHBjOWAm9lU4Ppl40hoJn6X+w7AbzV46
         mWod8vj4RLog0K1Rqn0BiIqYz6rQK4EcF9b/UOkC0etDbDdRKy6WpFKBTpCOWOr9AgmP
         LGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778126781; x=1778731581;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pga7PntbRCIrqIHJItT0gD5OU8oLLFDpVBORILI2ipc=;
        b=LinVjPGYgcWFZUvwQdTVESzekiIf2WBV9sj3vfiFFbS1y7oyONW7RVgDEikG7YLE89
         ToatxVHWIDmRJ6DqneZrEBk7RHeRMlZ8iwHKalQhZZio6D/suNZet3IU1v9EbZgQ1k66
         bMgbxkJm2BO6YtHPveJrQRpKmc2+97TGk5DQcpOSdjQ1UpbeQg/58EZulnPyhv1bEiAO
         AM7sq3OUDT3ec4gU098IjDl+2ait7zVIIdrRLPsmZMcQAQEr56r3O4amFwkmkow+P/yr
         UVqAh4TK323HpXJQXoEZm7ZO6CL88xD18L5CgoUcnsTAwKiq3hPXLBvD2pNRUYTskrGb
         pJ+g==
X-Forwarded-Encrypted: i=1; AFNElJ9XQhXx0NNrn8FQ045HuO7ZrMknLcIO04blnMnJUnyolkswPmVcayaMU70HmkxnO00S+nKkw+9oLH2ILA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwzOjUks2ngKivBTK6zuk+yOcHnOhQeoMIClv4tRff2bUwkIo1s
	vjem41Kz3vR/XRfcEGIPHoqncN2BbYG4WlvLHrKL0jF/9cy/uaZ845Qbuz0Qi6OrvNNMrzP7VEe
	87wzf51NWXQA/TPtzxqQ98xVY3eruUTY=
X-Gm-Gg: AeBDieuEAUAl2DWy4GekamnAkYCDPEJtJAJAL4aWHnx/zaOR07sqDAQ6pDKISM2n6PC
	/0bWgxPB+c/TFO8XFVCUByy+NikzIFXfbd9Bfy0N5ikTP5ntmh+JbFMl+RTAGkpGPK8zCouoSWK
	gml8rnwnwctbIYcd8cqcA5/tJ3hte1hzvY5ZdhVVoCfXteaMwtU7LpwjdHnSKXrIkGXrKkAL+uW
	3Dbh65vr54S2z0kE5vu34p6ZHuIOubVFkeUyzSXsTX6oBVRvRX8nQPzJ/+/kQnlkIWHwcMdLzl0
	/BcopyHuaa5+j+OlIt+f1PbF7WkzUqWHqQudRoil95Gl/amYStEMwt7dgg9qGBg=
X-Received: by 2002:a05:6512:158e:b0:5a8:6c1c:6b07 with SMTP id
 2adb3069b0e04-5a887ceb616mr2202272e87.39.1778126780810; Wed, 06 May 2026
 21:06:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507022213.29290-1-dennylin0707@gmail.com> <20260507022213.29290-2-dennylin0707@gmail.com>
In-Reply-To: <20260507022213.29290-2-dennylin0707@gmail.com>
From: Denny Lin <dennylin0707@gmail.com>
Date: Wed, 6 May 2026 21:06:09 -0700
X-Gm-Features: AVHnY4LXvZPpRwU04mfq25RExhckQg69jZwE6I3BvL2PBM_X4_gLx3vbBpb4Hmk
Message-ID: <CAGEkeHc2MiJenQnyHa8wwYxpZfaBwZpy3=iXJCjAjvXrs9UsiQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: tegra-video: vi: fix invalid u32 return
 value in format lookup
To: mchehab@kernel.org, gregkh@linuxfoundation.org, luca.ceresoli@bootlin.com
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com, 
	digetx@gmail.com, hverkuil+cisco@kernel.org, dan.carpenter@linaro.org, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 9F8144E2C6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60703-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,gmail.com,linaro.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,bootlin.com:email]
X-Rspamd-Action: no action

Hi,

The media CI reports a missing Signed-off-by from Ricardo Ribalda,
but this patch was submitted directly by me and has not been handled
by any committer yet.

I believe this is a false positive.

Could you please confirm?

Thanks,
Hungyu

On Wed, May 6, 2026 at 7:22=E2=80=AFPM Hungyu Lin <dennylin0707@gmail.com> =
wrote:
>
> tegra_get_format_fourcc_by_idx() returns a u32 but uses -EINVAL to
> signal an out-of-bounds index. This results in a large unsigned
> value being returned, which may be interpreted as a valid fourcc.
>
> Returning 0 is not a valid fourcc either. This condition should
> never happen, so use WARN_ON_ONCE() to catch unexpected out-of-bounds
> access and return a valid fallback format instead.
>
> Suggested-by: Hans Verkuil <hverkuil+cisco@kernel.org>
> Fixes: 3d8a97eabef0 ("media: tegra-video: Add Tegra210 Video input driver=
")
> Cc: stable@vger.kernel.org
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>  drivers/staging/media/tegra-video/vi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/med=
ia/tegra-video/vi.c
> index f14cdc7b5211..456134a9e8cf 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -80,8 +80,8 @@ static int tegra_get_format_idx_by_code(struct tegra_vi=
 *vi,
>  static u32 tegra_get_format_fourcc_by_idx(struct tegra_vi *vi,
>                                           unsigned int index)
>  {
> -       if (index >=3D vi->soc->nformats)
> -               return -EINVAL;
> +       if (WARN_ON_ONCE(index >=3D vi->soc->nformats))
> +               return vi->soc->video_formats[0].fourcc;
>
>         return vi->soc->video_formats[index].fourcc;
>  }
> --
> 2.34.1
>

