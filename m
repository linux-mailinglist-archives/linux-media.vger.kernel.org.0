Return-Path: <linux-media+bounces-14509-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0579391F09B
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 09:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 507FAB22A78
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 07:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A3D3148314;
	Tue,  2 Jul 2024 07:58:17 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6395C12FF71;
	Tue,  2 Jul 2024 07:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719907096; cv=none; b=EpFxMuO5Mv8IcwufJvTo6t3QZK6ZFVoBCra+hjjA+6KaoGvaLIuOQnf993UBkSyhG/5TfQYCotC35J5U7VxPR1VB06M3u9En/0fMmgk05pBm0TYjOmkIb2EBXQJ8uFcK505xD6V9Kz/Hi/vavJ1jKV4KhHvfiFIyJ8Il7Zpd2Lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719907096; c=relaxed/simple;
	bh=V5vvGnsiu16lF6dxdd9S95j0uOlD54YOSnC5fqklIiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=otrPAM74ARBEgkH6yh236EA5VWuyypmgHzpMTUofzI+mFSuuydjQV/8urOvbCnhG+oFYxXLts+UeHbyUSPhTA9CPHb9VPP6bmydPW5zXGakocMprY+sUkv/T5RqM3bzmCG6CD+JV+rR0gnpjHxzhBXsZwiMlE1hNlX/h1z3UKDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-64f4fb6ce65so11662847b3.2;
        Tue, 02 Jul 2024 00:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719907093; x=1720511893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qIsKSgfOcA+fUI4Xzk1jJc9AwhSaTiZ3Yv2LF2f1nBk=;
        b=E2Dyy05ni5ZrdTVO3vWdv4kTKeayFi8NCEDJxcTLi1GH6xpKE0gOgmWQ1ei4kC+u7D
         Ma7vgtFD+YIn81O2Er4/+M37TnN4fU806oDMgWFghclAI2xLyMyrM8vBptjDRYLS5zPt
         DpHj43cC2ZgSEUUjpf0Nrrg9FSDN1eu1V8Hw6wc5xilNi4lWxSqe7VpuOKQC6VHebVfy
         VT1WIYl7jHo4+eElsKwiAFnre+12/xN37hDPeOHYLUIzujSqsp3barW1YvKFgW8m5/It
         J3qCSuGTxAgjaPCwflrgcZSzW6YP47iD2SLTDOns1iOUEitaF6EwYDQFfBHhpGVEIZgK
         gC3w==
X-Forwarded-Encrypted: i=1; AJvYcCVaYwilJ3tW8MEdQr4jor1lJ0GQ0XlCpcaTh/B0HtxKlQq2w//yb3izwowcMgZC3cPG2l2WHu74K+vxMu4vgE+Aj1JyLBYRKT3pI6+ma4tFkESQtxefIZNr+C0Br2pimB/Qi2X+QYvFy4cWDWfcWe8girpa1htPPR9yMmSVv+rVQO4eycnOVKXHLvQ=
X-Gm-Message-State: AOJu0YziZQ/58fN/+UJubfA7ewq/AgShMT+9m+Pj/VUMdWivu3EAXofY
	JFxQk7e3yVFPdCl/jOzt4NvTRcDSgrFw1mVveY+R/zO/Bwxeyxu0oYJ0p6ad
X-Google-Smtp-Source: AGHT+IFJ6vcyf1nmyi2wZujapjODx75hD/EeDhyFRrtPlWjUEJ6CBLs2gvs4DakvaBgiws9Us8zsSQ==
X-Received: by 2002:a05:690c:844:b0:618:8e3e:8675 with SMTP id 00721157ae682-64c71cd8df8mr72391087b3.22.1719907093382;
        Tue, 02 Jul 2024 00:58:13 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-64a9a239b4fsm16713077b3.38.2024.07.02.00.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 00:58:13 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-64f4fb6ce65so11662647b3.2;
        Tue, 02 Jul 2024 00:58:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVtu2isVbmwpebApTpNOmDCUhLfRxxfnjaM8wclsnwgDOMfW9sDU3eC2oK5jYhKD24L36AMlKYk0rSo02vd75XC0pahwteEd+jY7b6et2/ZpzGW7UOH5hVhk13eL742JGs5dmfsh+7FPJjY9MJ2BWQzwMQK9gdV2iLCyWIN6v5KecQCmmzUMgecBGo=
X-Received: by 2002:a81:8313:0:b0:650:a1cb:b12d with SMTP id
 00721157ae682-650a1cbc444mr619427b3.20.1719907092689; Tue, 02 Jul 2024
 00:58:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240624144108.1771189-1-niklas.soderlund+renesas@ragnatech.se> <20240624144108.1771189-5-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20240624144108.1771189-5-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 2 Jul 2024 09:58:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVB63hauTXXuuJdkEpHSsqwVXtfeO+jvf-CCP-9KfuzTA@mail.gmail.com>
Message-ID: <CAMuHMdVB63hauTXXuuJdkEpHSsqwVXtfeO+jvf-CCP-9KfuzTA@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: media: renesas,vin: Add binding for V4M
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 4:43=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Document support for the VIN module in the Renesas V4M (r8a779h0) SoC.
> This device is compatible with the VIN module on the other Gen4 SoC,
> V4H.
>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>
> ---
> * Changes since v3
> - State in commit message that device is compatible with the other Gen4
>   device.

If all differences in the pipeline can be devised from the topology
in DT:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

