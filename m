Return-Path: <linux-media+bounces-59817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFYIFVmC8Gn6UAEAu9opvQ
	(envelope-from <linux-media+bounces-59817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:48:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5D4481CFD
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 11:48:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0E45C33523B7
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2026 09:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D243B3E556C;
	Tue, 28 Apr 2026 09:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="epK/A8GJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC943E4C92
	for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 09:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367010; cv=pass; b=HGHpU68UNIPXzZlWM4NRZVzOEMyFPit+YfFv8IAYyEqpESuEJCa3GOOS8kpFCqEOeL9PXAaTHI8Y9LcschOiATrztqhtS5aS6gXOU/G1lDAEMfcZ3zNzZAcCQyH8AKwvvy02+MAISQk18v0y3AMWPy99cZivfAbl9ptjnLRAJ2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367010; c=relaxed/simple;
	bh=WudgakiEEZRKCJgUt+BwBvOBl3iJTjt5ytU0965gmeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=km3n6lCNxWuzEfLnQvtarv0mA/9dqXrwq6aZbfjDphUeXvrK3RAZdnhvuJBuzT1IxNafzovFe+29Oi3Zoqp7Q2eI8FMxHOhqXdHzvHm+82kMfX43qVD02EDWqz09G+ttq0mlPqitfzftvvY9lEtmNawPsEiI7MYK3FJ3CRnTKMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=epK/A8GJ; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43d76dd4ee8so9942383f8f.2
        for <linux-media@vger.kernel.org>; Tue, 28 Apr 2026 02:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777367007; cv=none;
        d=google.com; s=arc-20240605;
        b=IcQW8MKGSlsIZ5CJY45eE2mVUDV+HgvDmaORBURr5hj/Mt6ZdKdtBdfDUcCfAN4Tvg
         Im0ZhbipgYY6BWVVXp9giZHgXk20UdHJWGWANWfmCK1ij0HlMNZ2hEuYQrwkplxTcZCU
         FpH4m4dZHZ48vMk3WimtkVfiFT/1mKR2M+NmJtmqmzHhYLzPwvG8o352MsB0ErlZtgng
         1glf9BcN6/yqswii0tC0BLjI+tORcYY6JezdAEvpNjYj5hJAvD0uQex9IjvaeGfWPwhJ
         GSt4fK6EW+p+iNn0SRrpfY8tjDlDjQ0u/9nv5omKSdMjC7v6MAfzKePMS13XlaRB3cH3
         D7cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TV+NCII1nqpIkeIqEPMpR/uY19H62nqeKAbbKqvdEXg=;
        fh=v5b9J9aeTsvGy6hIpjQB9neD53Q51AaMhxTw+JXTOuA=;
        b=kBQ3Skgns4SScoB2pQ7EqdS5Sfr9kC369oSbCLIcyB8Pko4easBYdlCeET/muUKweU
         STrfkFc2u1DDQ3djmTp/IMTIJdOl5Z/eaKrvYbF7PaIaJCKXtdsKdGtfcPpu+IOmZ1Oq
         ZD2I92f0HrLgyIjGUJsFPLJRZyJjDW7qyRmbvl5MBLWAp8ULpdswD6kuyG3NGgocirN4
         yqCqgA8u1eDTEnQmAca4f7cgiDQeBpJ7l1PvnHtfA8KqfXBU5hs2/VG2dvg4/MsaFfG7
         YmfB0DzTWBTT5dr7riohsmgbX3L9ISt1Oo51XKcYc5JC/gQAmVqqPWbC3b5fTKga/u5Z
         mAqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777367007; x=1777971807; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TV+NCII1nqpIkeIqEPMpR/uY19H62nqeKAbbKqvdEXg=;
        b=epK/A8GJQWhZyHU/RHKyLBAiPFbSdPYarb7Yu9mm03Y9+zoyuaR3mTjVvPvxBxtFBE
         xyn369Lwmu9IDVC/23JA/qdoFH4LBqqQht3tUD/kTAQn8De1mBeFvx5gGF8lVHQPgwfX
         PJeplDzYGTmS3H5UNcV8wVtT7BGjeIEDUH/BWka+A/0dZpDIf3hAT5HgJYzhLzlX0shT
         nrY7PvFVGfiIjufMMWdl1N2rvpeQ2P3En01Ar2Evq+UXmqtl/bfu+1Cz5KNeaDlEozug
         lgh9TYhdBl6PzgEMf3Mi4lw7rhU4dyMC9d0rLq1oAX/C5lXgTL0dFxjNnI5vLVY48KXH
         HeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367007; x=1777971807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TV+NCII1nqpIkeIqEPMpR/uY19H62nqeKAbbKqvdEXg=;
        b=i3/U9AJ4A3r1cv1DWPvF6LCw7R/KjSnSkJfFidZob8ljMtVb6tJyEIv9yjKQ3UwYqk
         w3p92lJTulMyGeCAZ5SmRNtHXzszcJrN025b6+WfyMC1wf/umLE1dtOANjNkHElXykjl
         +g0xsota0hwBiRcM+YmV2e1j93o2iMLwrH/4rPSAmybRlukUzhRIjnStrDxBIw/jBXh0
         donRF9ikh9ll4Zckj9/bR7cfXVCXZArTcUqFcPCerGTVXz8ZkaA55KJsKfnQwScc+/x/
         2jiwBWj9AL3ve/LYwjloL9qKQ5XOCJUZBGD0tReHtk0tAcgakbBlKpSEYLhBV8f3p2Hp
         QX9g==
X-Gm-Message-State: AOJu0YzSirssgTQuucrZ5/+UrbCg2b935KavzoHgzG720rrihQAPjmwg
	wrHYbzZGpWYsZRrOFDWmPkMcj7ANNPq9CmEe/ujk3cLWWpTzevTRoKByBQOZfjn0TA1d/UT1WiH
	X4S7NWdKqs7XEBLGOTkhlkSTqqiCo3VA=
X-Gm-Gg: AeBDietdsShUpIWgd5gHwDAnyKr1HBgYZq8AHbfSDvSJoQLlse0fc7Ysepnc3Oc5GGr
	MZvEFZXTpq+wGqEDvzbi+42Rcv7jWyBn3JZtz+jDoJXPqs/O1aTsjRXGNcXMhcQu5WJi0MhFly0
	b1uqnPJ7SOtPwW7ZSk0LQnkcrLQs+Cv8GRJr/6oIhplDcUTlSHIIalUmNCv67hWSLV8GrTECFuS
	j7ISEPAaj0GmFare7oIprVgZaBnG0zdl6iju0DbZo2ZjEzO/f1p8Z7bwmpc2LCvebjxMmnTDZTq
	wVyZD3DxSQwMSh8HfaHvTydBKV2zkT8Z1Hv10rPckDRzSddXQUHa/0TZEgF9duANa2Yxm2HJFGh
	GBcKHFg==
X-Received: by 2002:a05:6000:2302:b0:43c:ef4f:79dc with SMTP id
 ffacd0b85a97d-4464839c70amr4230601f8f.8.1777367006841; Tue, 28 Apr 2026
 02:03:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260425215037.3557213-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260425215037.3557213-1-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 28 Apr 2026 10:03:00 +0100
X-Gm-Features: AVHnY4K74HH73rMTr4l9H8YH9IjE_ttAYeHuyBI97H1S7pBrnmvHtUimsPZP3fE
Message-ID: <CA+V-a8uL7PAkSSvK+Qj3N3Z9LXe_B-nGJdfn9qG9rA6sXo34aQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "media: renesas: vsp1: brx: Fix format propagation"
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: AB5D4481CFD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59817-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,ideasonboard.com:email,kms-test-plane-position.py:url]

On Sat, Apr 25, 2026 at 10:50=E2=80=AFPM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> This reverts commit 937f3e6b51f1cea079be9ba642665f2bf8bcc31f.
>
> The change to format propagation in the BRx broke configuration of the
> DRM pipeline. Revert it to fix the regression.
>
> The original commit was meant to fix a v4l2-compliance failure, with no
> known userspace applications being affected beside test tools. Reverting
> is the simplest option, a more comprehensive fix can be developed (and
> tested more thoroughly) later.
>
> Reported-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Closes: https://lore.kernel.org/linux-media/CA+V-a8t481xuwava0nb7uY9CUPqF=
WZ_8EP0xrK3BgumP7HDcLg@mail.gmail.com
> Fixes: 937f3e6b51f1 ("media: renesas: vsp1: brx: Fix format propagation")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
> This is a fix for a v7.1 regression.
>
> Prabhakar, I have test this on R-Car Gen3 with
> kms-test-plane-position.py and it fixes the regression I reproduced. The
> symptoms were not identical to the ones you reported on RZ/V2H, so I
> would appreciated if you could confirm that the patch fixes the
> regression for you too.
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_brx.c b/drivers/med=
ia/platform/renesas/vsp1/vsp1_brx.c
> index b1a2c68e9944..9d93cb8b8e82 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_brx.c
> @@ -156,20 +156,14 @@ static int brx_set_format(struct v4l2_subdev *subde=
v,
>                 compose->height =3D format->height;
>         }
>
> -       /*
> -        * Propagate the format code to all pads, and the whole format to=
 the
> -        * source pad.
> -        */
> +       /* Propagate the format code to all pads. */
>         if (fmt->pad =3D=3D BRX_PAD_SINK(0)) {
>                 unsigned int i;
>
> -               for (i =3D 0; i < brx->entity.source_pad; ++i) {
> +               for (i =3D 0; i <=3D brx->entity.source_pad; ++i) {
>                         format =3D v4l2_subdev_state_get_format(state, i)=
;
>                         format->code =3D fmt->format.code;
>                 }
> -
> -               format =3D v4l2_subdev_state_get_format(state, i);
> -               *format =3D fmt->format;
>         }
>
>  done:
> --
> Regards,
>
> Laurent Pinchart
>
>

