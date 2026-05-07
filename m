Return-Path: <linux-media+bounces-60838-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGc9INC5/GmDTAAAu9opvQ
	(envelope-from <linux-media+bounces-60838-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:12:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F10CA4EBF04
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D48F330414B8
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 16:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BED833EE1C4;
	Thu,  7 May 2026 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rqcpDmqd"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADEB23B583E
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 16:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169891; cv=pass; b=EZ5MfXUR8SUR3Xh0WX+yNOHZRKrpPnb/GDHwPb6Rg8LKXY0XnTep7WCTXcAOB9k4HubSNlrmKKSDZBM7G82eHZVFGcxFe/o691GAWo9dx/LyBGVlRAhajcVdyWG0CoWGOJIr3O45HtY5+w7VJwKQVXjKd/R5h4Dm35yrJlC5FHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169891; c=relaxed/simple;
	bh=2wD2kavczCnryPJWhPiesAN7Mdkma4UQLXcGYexMyTA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rjcWFjDWNuOVozFctmVSTWiVs3P5dwwM/aa6O9OUMl7H23kPezefmbQz4kH4a5k4YvdmYIvOUxPQN1mUasobzdbovK0gaF6UJibaP3rIpxmZpo+HAb/PL2F7twxAPL3kfr+DTPyrBl83ZWknCyC4hXv3GnW4CIpyddmz6hV9N40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rqcpDmqd; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bc47a96d3bbso146307966b.3
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 09:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778169888; cv=none;
        d=google.com; s=arc-20240605;
        b=BfG91d5E5x17iKt/8lNjga95RPIeHMqCRb02/2+N8J0wcOdeEN7+ugEc34ighwuG8q
         eEiVKjOSvS3Tp3ZFCMKwRXZ/T8q61mwf5jBwnzpAYSMpsYZNNtAWTRnNLkJyhBbKpNNs
         z9neSnXaARubz0ZVjWmQF23Hq/1XCTHu0TdMOmQ5uLUBzPdOiOq15m+x60Wj74BaTZRp
         7Ze+V+pIHqZl3+cthc+OXw9cvpTzlR7LiRR0+UbIObdHYqF+lCTwi/+1we8djP2Hs/3r
         vwzWmy9TWqMPOPQLv1R4ovtXpBQZkc5dI5zbnzJSNU3QTCI7y9fZwF0twoU/oEaxBBvg
         Tjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rRYcM1ymeTGiiOTPFjh0iZEJpeegme9tULbG2S+4zjE=;
        fh=DzH5D0UyybDWQEWQWoohfJyqsy2HvxQwJVg2/sJglig=;
        b=UQkfWobbOlg4jPVUGYGaKQtSsgCneLYBYydtrUX1dripgdyxT0jhCam1ff1OmB674B
         krt2zeV4iRw+EIsYuHjK5oqYvleQ03i0n2TdirQsFuBuAez7XHQlk0VJGgIOASHyn/Ke
         yOCMFo5LYnTGsexbg14b/kH/5RzdPYLY6FScc1G9Zi3An3FfcJ5XJvQ1HHw5YCMGyS/N
         yFXlmOnntHGndwTslQptgWfG/cLy7RsLkePNRJsX4JUIUhPeK3v06g2Vwj02qp12G/XT
         ExaIEpzBeF+f7cF/5WjKGGdaS5bfIP0jWcwOhlHnK+rVHtw8YwmsxgJCdtFaZ6zieN0+
         WOIw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169888; x=1778774688; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rRYcM1ymeTGiiOTPFjh0iZEJpeegme9tULbG2S+4zjE=;
        b=rqcpDmqdCWNDWcpWefWv/cbgjdO/d532HU4+1nqY5rup2FETbT3X/YMykgAfDyUeXd
         Zv5b2JQRlKnWlrjT2AkVB1bkKe3/6q7jSNww5UJDcYXbr1xMCi8EFg5E/wlGEJW1KLf0
         +5QbYaUp4D+NV83bldLpu4yJpI3asBnKW3IsuMtNZBm/5+ez8u7TwXzEH8LSIJG1qdRj
         kpDf7JjkT9V7p6h/tbQFDc6T0fNpcgH3iu3XKU58X6LxDK5rsUJ+v/r3g0rKSHLU4sDT
         NFUetP/l/Mgd8/WZupu2PaTl/uaKS7S0FI/FkCzkU8mXwrCn82NECa/MEYtxDpU0ghe/
         P2fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169888; x=1778774688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rRYcM1ymeTGiiOTPFjh0iZEJpeegme9tULbG2S+4zjE=;
        b=rOnN7UelAPX1RQflotTlPegzDlO2PMupHk2dozfFSClpAJNshP6HN1EzxleIk+ul+j
         5mCs7pLY7A3qGIJ0BLJUHmMHDfrRHBqcG16wPD2KfdRssrVXbKMKdVcJUyRzRbf9uTa+
         /PHHJn24cL0l5snYnugG90kaqDi185B/sS+K1LR0jXBxhFFgI8B+4U9p1n2c8DTfDYiv
         b0bNFKT+Pvag+iZd2HOGEUNifXHSqNk8MoUy+p1+HxH3xVFOM9ddE0yKM3TkUEp5OpcL
         rufastjWw7dplrCFdM0pR+t+RL/5eQTXWYo1s5TRbujmXUWpr22c/O+/V45K18+hAaQ8
         llmA==
X-Gm-Message-State: AOJu0YxFm8ExVZMtP4qxKpz0bPNVGZ/fQBj6i8ngWGX9Ufw4t4r2hiDs
	qPRtmdHnBhj+AZ4AbUEIiW1H3SsFt8ZJ02VII12iUt+c2EWcE7/UiHMzpSM2TRVbbE41cv2oluq
	cC4gTQR8o9jtZbLmvlX0WMUZrwtD9gG8=
X-Gm-Gg: AeBDievu9f+O5uFGEBWOb3rjX+Xa7So/OgNUiQNVRNCynQx3a+E26ViMLYBLPQn2ZsR
	bUTBpsG+QC245xPk1UdZxkJBunL6Gr2rcfnlOsGbxcEwFzv6WY1BUF6CmjzaGVXm+KwOVdFz2fK
	AfrvF5JKGfc2V9nBeCtkZrr+rr2eLLNM1RuPwNll/yVxQ0WRCE7NGQvdgmLfP258a2H73rswjL3
	idHRiCcjdS4HFoC/jmV1Z0ms+qSxY/C4X4AgXp98xNhD8CnJZyO1Y7BNdhr1FTJeJzfosraMsHK
	ouGbgsWQygcwLb/9zY9eDOg3xA1lDvaPlGAR0tA6ovrq+XmgI5Yt6q76nV9nA8ge18C+bJp+XPJ
	w6CzO
X-Received: by 2002:a17:906:9fcc:b0:bb9:2893:6a45 with SMTP id
 a640c23a62f3a-bc56e906631mr509502466b.44.1778169752978; Thu, 07 May 2026
 09:02:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260506215650.1897177-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260506215650.1897177-3-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 17:02:06 +0100
X-Gm-Features: AVHnY4KlCXTWJqOAp_aqpaGJYpjfW3718jgkImCY1CyoWY67EfXWi7FF_O9PVIk
Message-ID: <CA+V-a8sws8WgSzMyXSKVsSCj2FhUy9CDt7qikB6d3e_xuQpEBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] Revert "media: renesas: vsp1: brx: Fix format propagation"
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: F10CA4EBF04
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60838-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 10:57=E2=80=AFPM Laurent Pinchart
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
>  drivers/media/platform/renesas/vsp1/vsp1_brx.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/=
T2H
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

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

