Return-Path: <linux-media+bounces-57655-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KL4QOwWeymmg+QUAu9opvQ
	(envelope-from <linux-media+bounces-57655-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:00:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE6E35E4C0
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 18:00:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 323F330614CC
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2026 15:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A54B3750B1;
	Mon, 30 Mar 2026 15:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ibgiO8Zm"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FB237419A
	for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774886152; cv=pass; b=qgigHbcvMb5tFIeLMAy1NfiUV9BOjLo8Zk10pZfq/tVpnnJDvqzO2YdIOT5Zf35ar1M72J0OxwydKyIzkjmSqniwA9YHkgTeF+zsnGzVkGQstwwXKK0e5A2ObiCJxC/+x9VHB+738G+j7hVVgq83ZqNyIyQco0hSA0yYfiiwEXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774886152; c=relaxed/simple;
	bh=gNWok/IAsMWevG4eHRezYjF6+JwGntTB45vSpo2cwE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JmssT8ztC6iv7vvzlv1SK+o2tMZScPcYLSr9gVeAmSzO/cYR8tqCR2x3qUg8/JuL9EH5QF6F04YNiWrwkdjqTYevle61NXnQisyNm/wUngE4DCnu8o4qxfv47HNqyjAmerYb66Dvm7EPPZjKuOUusepQrAH3jzydvfL7fIKLWF8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ibgiO8Zm; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43cfce3a195so751255f8f.2
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2026 08:55:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774886149; cv=none;
        d=google.com; s=arc-20240605;
        b=hXMRSftumXqsbOqKoJVN9bRItl+yhteJIN/GFdkLoa0fMEFVXul/tGkm287OAaeqLg
         XhIXpUAti55HrxRQkFEbyGstVU1cA/FvtOLIJ65JCGY/Qq0WryFK4gL091KsfulFWCS7
         UkRNP/WK1yj/7YVrJ186JpTaX/4cfg1ncrfHgMLpVp8Wo5oSXHIFhydn5im7oPhkJsuT
         kB2wv6QhhfLHFMuoMWiJwNmp6CXx1OPn3qfc8fiAiB8Y1w04MkF5hHZYJV8sZP/mQbDT
         H4Vgn12uxUs2HKlWf4ZF/3+K9EYUzKODyUcK81ulNQmh3hopEeDB3dQNSoGu8svZrSQP
         AmdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9pJcdizetzoKuJH44vn82II0IoK/ql94W08EDaC/fgs=;
        fh=5auEyz2tMneJDNA++rNDA2Cyvydluv5DHIkApTu3cPA=;
        b=N5MvSnWEeFl/aBp9MJki0a8GnbE2SF1o8tJh5Y0GTaVxYkMXl/g3C8KJGyB1BL313x
         8sGV9q5X58ABtZmEIgh2RmDhVc5KZiq2H19tmZ6V1ZTF440dQXCuS66g61NTTwaca3GB
         TpD2EVkz+fIqX8IvSPxOaVTK+sw0NSM3PVfslnraZS298D6xEN1oedCEBnz7WFNLNGgl
         FF5EJjjzyqNVc3iLDUe4/vZZrHXHPeXYen1mQpqBiATFCqJM5B6Vh8I/9SFei+MSdLjG
         dGB2Tn44YlksxKncXEbsQFeqFiFdThZ0WCK86YhJFVhdgXMwA2cAPaYogIO+3Vbku6I4
         6Zwg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774886149; x=1775490949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9pJcdizetzoKuJH44vn82II0IoK/ql94W08EDaC/fgs=;
        b=ibgiO8Zm5advTmR6wHrHY45LcMRWaqo7QpjnEKWAotI1RMLkl9HjktYrlldFBbDU6I
         FXqP6DJLjcks4skdapOy0zKmZS4tnPMbl+DK3aQlLutVvbU60dF4HPGGZSk1KJAl4Jjk
         /7Bk82gYqxYrEjeRrNXWnVEk+Rola9U3AlBHcEOcEi+kR3QkSpZw37FPi5fNl2JIyS5k
         Tf30AHyEVl1cfqMQ5cb7vZFQr1jhXDpjqyQ2Rbkkh68TvpKg6fI5y0Pkfo8Sqb0Ceoql
         COyyyA/qgGFL2c8M3OUDOLmGqz7ie9/NNdMiuSo+j3DYnaDYeuOm7Uw6L4R7VIfEK7iQ
         GOUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774886149; x=1775490949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9pJcdizetzoKuJH44vn82II0IoK/ql94W08EDaC/fgs=;
        b=Ku58aYfYSdeQYoX6F+e2fe8xWNL5mEPnNkAAoXVLQtCD9zAY0w5yylIkw//yS6aXhk
         YO9iK8keIaWTJbqYzHTHw9Jtn8qbJYoyBE7x7iJ/fp8zAlKq/7suDbeVi+7yPS4HSAuF
         51xaEU2Q4NqVHk7DXIOZV2RQkpVMyGVxGm4ZuW+j+hOyoxBKjempH9eQ6Kt4zDRuSCR7
         K3I4AoPQApx4C8jm1XHgDbEvRbtcB2OoBI11LTJ83mcwHg37LrAghDF5w8AzUsbCw0Td
         qyDTMv1/QnDs2nrzL5oXN/21zFg3nwT4EHvXNTkfUAKvfaItyyrspqN44zC2sLX6mRGk
         gduQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Jcd7bwjWtAiJVN/n4E4WiiOzoyk3JDhCEuKATdN8ru4Vg2uf0ATxUfHSoBd8sayFfo7wiPc8YQAk3g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyty/RPphbog+Rb2eLElo1CqMgR3ypwEaTqiv4iWFreVuo888xy
	SIhFDRNk7xBjljm61Ty+Ce8Ob42orM72smaqUCy6NefoNoFl5anXQB+TZt0HHHolPWHdiVriN5l
	KUEqoqoqLK/wSIuekKhdzIPrSerWUKts=
X-Gm-Gg: ATEYQzzMP21LxWQVCOG/MW7y2UJ7W4c988Xs4A7tWHWrjCUkaJm5toNdlL9px3aFsnL
	j6Lh8fR90eNNJ2wZLSIHJhFvc0wDjsIhWCqinYpFd9zWlIgOHYqZVZyGeuZtl+M0iEvVBZM/0f9
	AVxKJrrjYUcP4lnfg8WWUqwpXLqZBhupz/QvdQBN3vSdv2OZGw8GY4yrLdKYD7Jp8g0rCjzPJ4R
	mXikwmA1pdoUWkz2I5zRhjejhPivORgnbJBq/thydyKmZwAHaMZwIZLd80w0hIffVU7pHPVJI+U
	PaVDdo+o9cfLDz6Yee3HJqvbgFKjlJsHOZkUbhkOC7QT7djKT2jJAHz9O1Q5uk9ftQXkSw==
X-Received: by 2002:a05:6000:310d:b0:43d:262:c97b with SMTP id
 ffacd0b85a97d-43d0262ca87mr5056947f8f.41.1774886148810; Mon, 30 Mar 2026
 08:55:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327-b4-cru-rework-v1-0-3b7d0430f538@ideasonboard.com> <20260327-b4-cru-rework-v1-2-3b7d0430f538@ideasonboard.com>
In-Reply-To: <20260327-b4-cru-rework-v1-2-3b7d0430f538@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 30 Mar 2026 16:55:21 +0100
X-Gm-Features: AQROBzCS1ISFV8_oWPHxX645PWhua51q7t77cS-YtJt7VjmgbyhEtmV7TZOFNWs
Message-ID: <CA+V-a8tdRsivBzmVk6PRpkGo6FQvF_3LKM2JRuCVqmjOyMLySA@mail.gmail.com>
Subject: Re: [PATCH 02/14] media: rzg2l-cru: Use only frame end interrupts
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57655-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[kernel.org,ideasonboard.com,bp.renesas.com,linux.intel.com,protonmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prabhakarcsengg@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5EE6E35E4C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Jacopo,

Thank you for the patch.

On Fri, Mar 27, 2026 at 5:20=E2=80=AFPM Jacopo Mondi
<jacopo.mondi@ideasonboard.com> wrote:
>
> From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
>
> On RZ/G3E the CRU driver relies on the frame end interrupt to detect the
> completion of an active frame transfer when stopping DMA.
>
> Update the driver to enable only frame end interrupts (CRUnIE2_FExE),
> dropping the usage of the frame start interrupts, which is not required
> for this operations flow.
>
> Fix the interrupt status handling in the DMA stopping state by checking
> the correct frame end status bits (FExS) instead of the frame start one
> (FSxS). Add a dedicated CRUnINTS2_FExS() macro to reflect the actual
> register bit layout.
>
> This ensures that DMA stopping is triggered by the intended frame end
> events and avoids incorrect interrupt handling.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h | 1 +
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c    | 9 ++++-----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/=
drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> index 10e62f2646d0..5a6ac9cb09a4 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> @@ -19,6 +19,7 @@
>
>  #define CRUnINTS_SFS                   BIT(16)
>
> +#define CRUnINTS2_FExS(x)              BIT(((x) * 3) + 1)
>  #define CRUnINTS2_FSxS(x)              BIT(((x) * 3))
>
>  #define CRUnRST_VRESETN                        BIT(0)
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/dri=
vers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 6aea7c244df1..98b6afbc708d 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -440,7 +440,6 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l=
_cru_dev *cru)
>
>  void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
>  {
> -       rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
We could drop the CRUnIE2_FSxE macro as it is no longer used. Rest LGTM.

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar
>         rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
>  }
>
> @@ -700,10 +699,10 @@ irqreturn_t rzg3e_cru_irq(int irq, void *data)
>                 }
>
>                 if (cru->state =3D=3D RZG2L_CRU_DMA_STOPPING) {
> -                       if (irq_status & CRUnINTS2_FSxS(0) ||
> -                           irq_status & CRUnINTS2_FSxS(1) ||
> -                           irq_status & CRUnINTS2_FSxS(2) ||
> -                           irq_status & CRUnINTS2_FSxS(3))
> +                       if (irq_status & CRUnINTS2_FExS(0) ||
> +                           irq_status & CRUnINTS2_FExS(1) ||
> +                           irq_status & CRUnINTS2_FExS(2) ||
> +                           irq_status & CRUnINTS2_FExS(3))
>                                 dev_dbg(cru->dev, "IRQ while state stoppi=
ng\n");
>                         return IRQ_HANDLED;
>                 }
>
> --
> 2.53.0
>
>

