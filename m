Return-Path: <linux-media+bounces-251-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C617E9E09
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 15:05:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1413280DD6
	for <lists+linux-media@lfdr.de>; Mon, 13 Nov 2023 14:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D566920B38;
	Mon, 13 Nov 2023 14:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-media@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6168233C9
	for <linux-media@vger.kernel.org>; Mon, 13 Nov 2023 14:05:22 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77132D69;
	Mon, 13 Nov 2023 06:05:20 -0800 (PST)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1e9bb3a0bfeso2931821fac.3;
        Mon, 13 Nov 2023 06:05:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699884319; x=1700489119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOIl42bbI4IF7rJY116A1gg3ba3yNq6IkJOjFeyXmF8=;
        b=WgnlPadR0sUwJFahakY7Cq4iCaiWnCagkq6/LnKcgygAKx96F47lZEHIfzYrW1A3Sd
         iO88DlJB/gbTMM5YCWDKA+bE7QkB4IUCH0lcrwkVPbg4gA0ZqArjtK4FNcDLKasNaZZ7
         vpQR5ysNAZPWo4Q4CDCqCuSL6kLm4z1csqRPOlIXQ0WOD3W0uxNiC3GQQvMGFbVae7Go
         UgDIywegICP73xSDvl+5GHIROmyBA7V3NtqaBucsLDrTaSQ5qkA48kE/cPQw8hRB23KI
         RENlf1LtXPk2Lx87XGHcO+oywPd8k0m82ur7IvZXoG/DiFY7JlT245SUEfAkbNQWkLR7
         oF0g==
X-Gm-Message-State: AOJu0YxSxz07z2kcgYHT33mxVFwal6akbW7MQX5NS8g5HXBmyzaESFPn
	acYZkmJWGv70L3bOKdeviHIZXjKNNaGHLg==
X-Google-Smtp-Source: AGHT+IFCVVaD4GHbvGAwIkgGfh+1q1JcLDNG/6SyEJ/VtrzM4hao+Gk6RzuIVSJHeXXrKcwM3Fymzg==
X-Received: by 2002:a05:6870:2248:b0:1e9:9469:a858 with SMTP id j8-20020a056870224800b001e99469a858mr8567231oaf.39.1699884319598;
        Mon, 13 Nov 2023 06:05:19 -0800 (PST)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com. [209.85.161.48])
        by smtp.gmail.com with ESMTPSA id q9-20020a9d7c89000000b006cd093a0ea0sm813379otn.5.2023.11.13.06.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 06:05:19 -0800 (PST)
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5842a7fdc61so2286703eaf.3;
        Mon, 13 Nov 2023 06:05:19 -0800 (PST)
X-Received: by 2002:a05:6358:e481:b0:168:ec55:d164 with SMTP id
 by1-20020a056358e48100b00168ec55d164mr8542584rwb.25.1699884319019; Mon, 13
 Nov 2023 06:05:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdXfn__=z9RQgxo_Rnmm3x5CbNxvqp1+g+vcQZZQggO=Zg@mail.gmail.com>
In-Reply-To: <CAMuHMdXfn__=z9RQgxo_Rnmm3x5CbNxvqp1+g+vcQZZQggO=Zg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2023 15:05:07 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV-fMaT-H4m9twdb+Ow7tCM4GZNDD4b1vn7e2B8VQmS8g@mail.gmail.com>
Message-ID: <CAMuHMdV-fMaT-H4m9twdb+Ow7tCM4GZNDD4b1vn7e2B8VQmS8g@mail.gmail.com>
Subject: Re: [PATCH] media: vsp1: Remove unbalanced .s_stream(0) calls
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, Oct 24, 2023 at 4:56=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Tue, Oct 24, 2023 at 4:25=E2=80=AFPM Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The VSP1 driver uses the subdev .s_stream() operation to stop WPF
> > instances, without a corresponding call to start them. The V4L2 subdev
> > core started warning about unbalanced .s_stream() calls in commit
> > 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream()
> > requirements"), causing a regression with this driver.
> >
> > Fix the problem by replacing the .s_stream() operation with an explicit
> > function call for WPF instances. This allows sharing an additional data
> > structure between RPF and WPF instances.
> >
> > Fixes: 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_strea=
m() requirements")
> > Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > Closes: https://lore.kernel.org/linux-media/2221395-6a9b-9527-d697-e76a=
ebc6af@linux-m68k.org/
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.=
com>
>
> Thanks for your patch!
>
> The warning splat is gone, so
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

FTR, the warning splat is now in v6.7-rc1, but the fix is not
(not even in linux-next).

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

