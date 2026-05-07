Return-Path: <linux-media+bounces-60837-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPc+EFO5/Gl2TAAAu9opvQ
	(envelope-from <linux-media+bounces-60837-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:09:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8C34EBDCC
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 18:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 841CC304ABF4
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 16:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 449AF3E7150;
	Thu,  7 May 2026 16:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mY/C3+Mh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B58A372B23
	for <linux-media@vger.kernel.org>; Thu,  7 May 2026 16:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778169794; cv=pass; b=X6uHYk1/TPZoy7LTVut917jQp/bLzZ4/aRcogfunvZUTiHlpHdL2CsfG950uRbP9GxZXICSTWHnh669oaKSCX2Uh0BCnacsy00nRz1d4ndFWz274NxLUqgH9kpHMupOKqYQ1YdNBWAK6JmhoweBb/ilLW16IcsMBI10yb3SmdOw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778169794; c=relaxed/simple;
	bh=CEhvezj9XUvsQzprwkB8A9BTXN2jjrQ9THtR9Owth/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=arJFO8O0ZBHOn0hzhv/xCmaegjHNAtM5vzJ39rUHZtNj7C/REsVwVZs2bcRjm7hX9JTXs+LzroDfE7qufJ4cHJwwwbn8f7DRcoywbtTrOvRQ9spPG80bw3nMExncz3jvgnzF5zCA0Ps1wzdcfUa724UsGzG7SmpG1EKuzdKFrwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mY/C3+Mh; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-59e5aa4ca41so996020e87.2
        for <linux-media@vger.kernel.org>; Thu, 07 May 2026 09:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778169791; cv=none;
        d=google.com; s=arc-20240605;
        b=BQz4OK+XFxXowIq1xYArGEvBzjL7kQJFYfLxdfAdoCkMc6y2ohBN/0xF4mYbUjkGpm
         bRjRK/5uMaNl8Mt5ZYYVa88RwfwDhaoVowUs9y86Jgct41tqri93OOUj8nl42en3IxaF
         MniDIdcFKx8fV1fjjAgBT1gxAacDYhFXS04ohNHHFKjkC9l+zzDJusY33qIhWg8jvcGd
         xY3ghXbX/qBs6xswT9CqnNkzODs7WpoXkS3tm7gQgRqfW5tqRRzDkZT72gtboVJDl/Tm
         vOjWpbnJq4iMnqeCB9UT47SQ/8NiJBg3tGSI9vBnIdZM++sNjIy6+vveZY50WRtHNmzy
         3USg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kSXScqi0MCR7jDi6r5iGbgrFKyoI44KBhr9uakdnSD0=;
        fh=DzH5D0UyybDWQEWQWoohfJyqsy2HvxQwJVg2/sJglig=;
        b=AtaLGfU/8CPYfSi0XP6WdGR3JlojOkzgo3EH6OremM/jCYYrg2jtv2//rvizcxvGIw
         8TjNFBCJxre26XdCzrlqyh4HFd1rRZ0hAC/M39V3WoyWZRtZpy6cXFXIYScWid5nWAhY
         P+LfX6rDZ/3DgUclBRFRrAXPYDviIbadleiFIZf3kbPjHIA/pB8/maIb5f9iwDe4hewE
         dK0QlMOivi5nCKNojcHuLy92M/T5sAAT+lLUxLyGxQf5cO5zPeghgmsZvjrhzO/kn2ZI
         v0dIQreoMPY1OaSAoNMpGIVEMiu3SCy14qpT1B4WCo0p9XARrQa6lUvDr6NTHA1O2yw9
         WMKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778169791; x=1778774591; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kSXScqi0MCR7jDi6r5iGbgrFKyoI44KBhr9uakdnSD0=;
        b=mY/C3+MhRUUicqMBIiNaf2AKrUJ+hf5+hBmzNnVlWYEyXf9hQS76BxxbV+6nphPJYf
         l9rhZFi6sPygxTTT4wMig6pKiinGRJPx0JgRByh522dTnYuqD3XgAFp5N6YIs49B6pM8
         75iD4NEulnJDtQH1OMW4oerP04w6tuLuRd4y1QoSfOD9PEC1jScr/nMHnhHw0ipoBYx9
         havJfR3W6Xrv7n6G673cLBrgKukmP5/2TA8fX2ZaW5faSkhtsrnfESWzAccIpqQ+l0LD
         y2PtmFasQNMeAB1PJFOmFEI7qXiV7OjjnVE/8UWjDmwhqR/dGyfg1e/XcbVHtEEf4Zf4
         48/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778169791; x=1778774591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kSXScqi0MCR7jDi6r5iGbgrFKyoI44KBhr9uakdnSD0=;
        b=VgDK66epGbRZ4Ui2fURkDoUZLJwo/eD8zqFIkSD5cRVJeIWNjPUK00DDqfibgVkbmk
         /q/dxZV9M8tCDpAX7WMXJ3+EDivuqJxWnoJUSino61Z1H64eKzllMaXOoy1E1hWrWpIf
         dL7tsKqNBXKCQ4WKkA1APN6AHboSRZHhRF2L44NSIcwULQcbV4U2m0Hk/p1IoTdI26YQ
         M1JxZI7cL/CTnhk/UVKyIhbB3I8CuGvNaSeBrZna5CyAIjLLb6XMKprY1JHr4w4fLpk9
         cybhgeIjcogpP8CPD/tk0pJp1WcqnJ8pS55MfzTm57JV16y+k/2mfzp0A08rOQPlFYPA
         8bVw==
X-Gm-Message-State: AOJu0Yy2MihmsztdfiXpi2q2n4iywVR4XGMY7rg0IYBhB0HAVTPO8I6c
	yCpfhD/pzZNpEaeBv+6LWfCtGtX6nMo88nATILB78Dc8HMGoV6bbefHOm/fEm9Eyyogd6xm57Bj
	Elveqvwsm8i1AP+KxYPwgUq+3pqgswbhH2xPyrms=
X-Gm-Gg: AeBDies4H2scHaAdVhF3XwE69FarzIvXUNytUWTLgmvBr3Xre655Ft1CRV6GUUOwE9p
	/Q4aoV53BylcLw1sM2pzk8JWDIZkeV2odlROoL5FN6N3p/fwVp1GNeUko6lrseAlno+e6jk5ZUN
	q4WWYcwptlyOcMw9Y3/IwGmJeZJ4zZKsNWgkWkk/0E5w4cCqjDL5UziRZ6IVM87rY8bGoTX+gj3
	QUuebTqgUPcvuXTdsLgYe+9jWK9nsP3gC4fJBih2Zxp3noNZS1//4W8qMaAsAp0UE2nv1HNNcn1
	Ymo/EXKBHAh8VduxAs3/Wav4w2b2W/whdGJs3kfZ09nck8sseRUXOW+pSi3zU/YTC7DoUg==
X-Received: by 2002:a17:906:9fcc:b0:bbe:7709:5a8c with SMTP id
 a640c23a62f3a-bc56ac3700amr483762566b.1.1778169712056; Thu, 07 May 2026
 09:01:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260506215650.1897177-1-laurent.pinchart+renesas@ideasonboard.com>
 <20260506215650.1897177-2-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20260506215650.1897177-2-laurent.pinchart+renesas@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 7 May 2026 17:01:25 +0100
X-Gm-Features: AVHnY4JAgm7pFZJtm-HLuXQ0MLjv1zwhY7Qw5YYwBrvyZIESDCz-x-IW0ECt4q4
Message-ID: <CA+V-a8vXBPhvpC6hSKykBUdpLm5dJ4oBEWERsKWY46HN4JFtUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] Revert "media: renesas: vsp1: Initialize format on
 all pads"
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 7E8C34EBDCC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60837-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

On Wed, May 6, 2026 at 11:00=E2=80=AFPM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> This reverts commit 133ac42af0a1b389e8b7b3dc7c1cc8c30ff162b6.
>
> The change to format initialization, along with the change to format
> propagation in the BRx in commit 937f3e6b51f1 ("media: renesas: vsp1:
> brx: Fix format propagation"), broke configuration of the DRM pipeline.
> Revert it to fix the regression.
>
> The original commit was meant to fix a v4l2-compliance failure, with no
> known userspace applications being affected beside test tools. Reverting
> is the simplest option, a more comprehensive fix can be developed (and
> tested more thoroughly) later.
>
> Fixes: 133ac42af0a1 ("media: renesas: vsp1: Initialize format on all pads=
")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.co=
m>
> ---
>  drivers/media/platform/renesas/vsp1/vsp1_entity.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com> # On RZ/=
T2H
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar


> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_entity.c b/drivers/=
media/platform/renesas/vsp1/vsp1_entity.c
> index 1dad9589768c..839b75b62ceb 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_entity.c
> @@ -380,7 +380,7 @@ static int vsp1_entity_init_state(struct v4l2_subdev =
*subdev,
>         unsigned int pad;
>
>         /* Initialize all pad formats with default values. */
> -       for (pad =3D 0; pad < subdev->entity.num_pads; ++pad) {
> +       for (pad =3D 0; pad < subdev->entity.num_pads - 1; ++pad) {
>                 struct v4l2_subdev_format format =3D {
>                         .pad =3D pad,
>                         .which =3D sd_state ? V4L2_SUBDEV_FORMAT_TRY
> --
> Regards,
>
> Laurent Pinchart
>
>

