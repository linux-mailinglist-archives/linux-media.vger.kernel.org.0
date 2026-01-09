Return-Path: <linux-media+bounces-50327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C34D0C6A9
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 23:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 09B1C3044876
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 22:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03727314B6D;
	Fri,  9 Jan 2026 22:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RD87ctP4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11A53002D8
	for <linux-media@vger.kernel.org>; Fri,  9 Jan 2026 22:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767996639; cv=none; b=r2i8jtAQoJRWZg8jZ14zVc7os6v4LN3r1F9wMaykZOLH8rAo+agF95MjXOIRkcmvtecUwus0fciyM15geTIeWMZO+ZXFbLGcy6w7ZJcOCMss11G+Nnpq0wMpZiFZx7xWKTYFHa3eyERgzHYwHIO6lzFKjl6S0ZrH+HVJp93+vP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767996639; c=relaxed/simple;
	bh=3QJ52a/bgPzuUKTzUBTOpjnpR6DZhhOjRgWi3SR/6pk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ckDGZj7MVb5WMOVKdOv/UUjRPUOPmm5wvv5ejb/EmZD7zhiwTvx0a+8JAsp8TnGp5CLTd1mSgRsp8Hl+CYZ+IiNDpl+WwMpArEoQb6hOd56qeoUxLfCUgGSVUp60Gc+46nLRKrWYCzye6dLBxKO1rZu/nlITLC7YIiMnfd8Mfnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RD87ctP4; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-432d256c2e6so1639153f8f.3
        for <linux-media@vger.kernel.org>; Fri, 09 Jan 2026 14:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767996636; x=1768601436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfQX3D2SQZ81h5MUWXgygzdao1nDh7Pskp4FXNApMag=;
        b=RD87ctP401Xb21HlFGLTLDPbhgmAqn4QYzEA+us3ggcTMNZml1qRymN1eqN7+aP/xS
         ihYCgGnt6vIo4U3lGZXWifUfcXk5we6r7B/bPWIDesg2DNM18ZyO+82dhDvSYJJKt2Jc
         NDyltjLkltKqdUvfR7jdj21xbbpq6RXE8cgcTwsr5VYDoKe9BCshZVHrm3VF/U4e3ouY
         RbRM+ZoUYZI6+LOFQyDu3LICXGS6gEHrV2obGSTnRLPt52VWNIXK+dMXlzraikOKUg3a
         V842ZNHo3WTV4uzGMxNnxL3tm/rPM3XrYesqwFfcYJEv+0pufdArjUyvNP+YW7/wwZ4d
         uWkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767996636; x=1768601436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DfQX3D2SQZ81h5MUWXgygzdao1nDh7Pskp4FXNApMag=;
        b=CLc7nUtMnPZH6rK80XTScdGQVAr2HZcvreNDE21LfdwrOTnKTv4vBV2N7iWET0DjaN
         7R/ftc06BNNoBe/8Y9jz+rExXje1shUjTJBwsNLE/TVz09O/yVG2tJ3eKjSElIjJHipN
         n9m92cegKN+bIAez7BEWwB49XiQz5Ih03yfP+u1xjXWUt3LnvnaWOisXGnLy0G76WFch
         WBpo02iKmrA4GATDBR0X7kyP5FnD0WIKcCcK9dVwm/lN3sFjVJIx4bjvKi1ZQYefJSoq
         E+nI2aWetoxwIu5zgYgw5T16T9BnbVGjRr+5sn4dJXIkb7cmTwRIJpWBxDS9lfnv6eY9
         fObg==
X-Forwarded-Encrypted: i=1; AJvYcCVhqn1selE+XI/LrOxrsvGmtNwZMjWWdfuerjCLdLhklSzSRqL74q3pvBHlDcWK10jwDv5GVFylP0faXg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8HEJ46yrN/+TvnkVPF9mr0tYRvG/pu1rHGXc24lMialsYbSw3
	HNyRXpPm7leOrr+LyuisvDkLh+QVam5yI9bgsG4sWyzUzezq2B/8VNWMekyWspV+lfAGnYcxO77
	5MCQSFRDnAqa9hMfupNfA2HpJuhjjZjBGmUrBPMk=
X-Gm-Gg: AY/fxX5JSVkfpBKAzWqfx91lSBluFBT6i7aOaLjWq3y219/z5aP/ajgS+NnRfoFEstC
	Qyv+Eguu04qbVYbab1eXLDyAzOQ2UKkI6+9c3qZ0zHqfrc4NsFt0/87LMv7/6CBmAsbuOqa/O28
	ojOEZBFUOSFmyN4VzJXy078/3r9BWMmh7kaj9TsBw15Yc+elAi/nOBwClKE/Y8/uqu1g42SQxym
	fFIVRxHuAVO3ssSV9hg9i8sCIhJxQGeMceKb9MzARNhhoINVjeAsByf6b8Z6M47e4Tnnx6P/LwA
	zplg9ZEM3D+4qhOAW9FMIHvBB60EUTEqZO6Wmv7L/eI06N8KgpJW/vamcg==
X-Google-Smtp-Source: AGHT+IHal3Q6HFx6YVC8+0mAQiKOoH3MXiFcxAmSjJQKYvO2x41v3zKHjCGVp4VEpxzUGTgRZFvHvhW4UYQw8D8sctM=
X-Received: by 2002:a05:6000:4387:b0:42c:b8fd:21b3 with SMTP id
 ffacd0b85a97d-432c37a756bmr14376383f8f.57.1767996636042; Fri, 09 Jan 2026
 14:10:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767114395.git.tommaso.merciai.xr@bp.renesas.com> <b9aeabb34829b8e97559610a3d00ef67399a300c.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <b9aeabb34829b8e97559610a3d00ef67399a300c.1767114395.git.tommaso.merciai.xr@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 9 Jan 2026 22:10:08 +0000
X-Gm-Features: AZwV_QjTEWHsOF-enm5ILtjYfjq3ZPjFoDTCBeAIzDNXHIv7z0QOsdW1H2Ls98E
Message-ID: <CA+V-a8vqyO0w5qp-Zu1SuYOTjZiZaiRVL2VGwQSPcUGF0vuuHw@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: rzg2l-cru: Skip ICnMC configuration when
 ICnSVC is used
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 30, 2025 at 5:16=E2=80=AFPM Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
>
> When the CRU is configured to use ICnSVC for virtual channel mapping,
> as on the RZ/{G3E, V2H/P} SoC, the ICnMC register must not be
> programmed.
>
> Return early after setting up ICnSVC to avoid overriding the ICnMC
> register, which is not applicable in this mode.
>
> This prevents unintended register programming when ICnSVC is enabled.
>
> Fixes: 3c5ca0a48bb0 ("media: rzg2l-cru: Drop function pointer to configur=
e CSI")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace6931..480e9b5dbcfe 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -268,6 +268,8 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev=
 *cru,
>                 rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
>                 rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1=
(1) |
>                                 ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> +
> +               return;
>         }
>
>         icnmc |=3D rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MAS=
K;
> --
> 2.43.0
>
>

