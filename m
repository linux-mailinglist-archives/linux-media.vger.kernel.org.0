Return-Path: <linux-media+bounces-66399-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 96ueCRedRmq6aAsAu9opvQ
	(envelope-from <linux-media+bounces-66399-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 19:17:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC936FB319
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 19:17:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=XdzUNJnE;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66399-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66399-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61CC63009021
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 17:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548592E2DD2;
	Thu,  2 Jul 2026 17:11:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F74433E70
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 17:11:16 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783012277; cv=pass; b=OZ5CnGjedgIQFfDAIFpWsVUs+sNBlQObE26jYE3y4Q3rbcZpdnwwvHWvwqJ823c8IwBTStezIbmiwSz4pE+rBXd029cMW/B4tRBPp4mp58YW8xgVf6AJjgtqCZqMddiYaxdL0GXu7GEDd0vLS+u+PZOK5ctheIW79Z8TjtnqnCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783012277; c=relaxed/simple;
	bh=6IcNu0rivjPxW/srq8Rphg7wvU9JPaFx79juogjMiEo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtwm5PEkXhHsdn+efytXGXcQdRKQKKXjJk2u4r7UUbiWmx5zOqAt6TZcL/x39ADGb41d7pDGzCHENPN6WZQ6YK4cVo/6txtvASfC3i4IsRZtY2xYVwovPj9p3oMiSDjrvzLW6TCbINcQqBOrZluCm6TJME0M7CNEjuuDM9D3Lvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=XdzUNJnE; arc=pass smtp.client-ip=74.125.224.52
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-6611669cd16so2953316d50.0
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 10:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783012275; cv=none;
        d=google.com; s=arc-20260327;
        b=PZR8V6qj77A0+zCuJl7r3nMyMRCwgkrWDL1j3Z2UJySSL5isdbrfDJrYg2Z5+rZFPg
         04CPVefsV0ik3/SyMv75UNsGvCSJbdNtFBJhOsiH5wzAa4InGS+YPoEhBG63B3ObNFgV
         f0sD4Dpyet/g3m52c6amaKoeuigh/XuGKHy8hMreLdQ24w+8MxkYGXKoGvRMLP9nlxJT
         AIy5T9HXrOC0272GmgXS/966tcQEVHprTaIc6hAgE5dGmLR/S9CpzvFHG17ULbuvLCn2
         YT0nOSuxmLGGB7TZ0b5NMn/8sNNW6yBrpaVCAbEeu9UkMdTQpC8JOZQbFEzlGsBMPd7P
         1f8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9iuZ9so7HvzP+LpkYFe7KLf7QKnKpT4kFTO0ocpuNLA=;
        fh=wCgf29w5Tfiwiv5ySPc/k82f0CcZCa01Bp13MVBRgUA=;
        b=cEaBz/ViA9LjUWLUe2AGHOfQdOTeW3AWgLNC57HinCZ7jpsU4GYsYtssXyWKPTQ1Fi
         eKAEjvrnTAAjam6x0T6DQhBqQAANhA7GD4r74b2mMWb5A9FQOZciF4gwOuHcwX1X+nye
         jIxHg380HibX0QzJwoAFx3Mv3SrgHsdmVzrPxKrN+J+o6ldr0yBFHFlY2YjASz+NTm9G
         iA1rJ9GvcOMmLH4utxfAn2uUHfNjkkQShnyrvbZCSMp2K6MGuI6va02v4Upm/tOokjPL
         fmCo4xTPqjLlMAk+S1dVbem0gDPkVtzYccmhQE6s1TFdloI9gKxtg0Yzb1aSuFhuX2Da
         owvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783012275; x=1783617075; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9iuZ9so7HvzP+LpkYFe7KLf7QKnKpT4kFTO0ocpuNLA=;
        b=XdzUNJnE+CAlR3aAw1TP1BVD8C8Wxo7EuNjXdGS3zgzQwxfk5uwhKnCYerSA0YL3H5
         RhiYAWzIp1S2bQ3nRUtofsxUes/G6znmGImaEc1poHXP4S0gRvc/AGXnAWnAkupz/H9/
         dmNoB2UZT8HLsHLKsHngX/uAgWi8nWaK5Ij9wJFcs8+ttFx5fCdKdEwK+04BmWzJMfOa
         XJfQMnpszgH7+FUuPge/kjWRCcr6ZMF5O9zPKU0Y4Rnd8QLcQZm71pVA4vDWwZ6gCu7Y
         P/959qMm9TUNs4MLkRZStao1MOiquABGdMroszfNM67u6rIv6zTzGnrWYlMhmLVpYjg8
         xw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783012275; x=1783617075;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9iuZ9so7HvzP+LpkYFe7KLf7QKnKpT4kFTO0ocpuNLA=;
        b=XWfv5VTrcWM7BYgO/BFUVoDISQgYM4n68/SuZE32OMra9eXYQxqh+qYxFi/AbIN67z
         Wr4q7TZCaiXbxNn7KZasywzHeBj/cq+zt9MhBsJLbS7MeH+h5zLYVi5Qd7A0etBmlGcQ
         1Y5uHh2sKFJm/HDBVuvHRxbQXJ6/rx1ps7TBIC+ChHJ9IIHx8JV5O+/CH2gL7+nJm7Yv
         zq07UjzGDvsBWm01/RiXlQF8GFqMGJRV0fLPkY/eBKL8pI4/l/McqkiNuRHZJx5LYYul
         cZtCYssQTNNqZONG/iv1A3MuJ4OKnf3xDINUk8MNSRQtyQqzn78xB3wRq4+oLcs0uy77
         78Mg==
X-Gm-Message-State: AOJu0YxvTiTX/Vago5lBpihyJXerMympRFHkwQe9sKTCW7jWGs7VzBIv
	5Ln3gi9vNohsla7bgQTW/PjO4b34UP3c09F/94U0V/6WMNM5ZtTi4PrDELgkTjRkd4tw2W5Inq6
	0waNjIpjnTrmf9Vdktd5uFekiWhhxrwg6rd5dKS8W4A==
X-Gm-Gg: AfdE7cn2YmnwaxoW4xUbfjDU0HrBS/phLZr4fKYmsBxu375HiVfWHrrITiVVdjeg7Mv
	h447rqgV1vgDn0NfcXFkSxVweJ/TACFze1SzZ106ONuzg/aJS9gEO6OiK2z3b10hVWzh+VWUbdh
	lYqrZnyhem2n/8QifLB3TxWCwdcuInvFpM0qXeUufY8qYMDKP3Nj316VRYSR9dPBnFJqCNkLIvR
	xZx/weH6mJKGBklFerxEVQxcrT8n2rvBX9StPI7eRWLth2a1zgbblcuGYHFPieOutV7qEvsZLeS
	1uQCbcCyUz8lRboHMYB3FjaFq2KYueEswCXfeunZisg4j1pqsv+iDngPtdym1dG3GMbcDbGmZK1
	bIUUdZzvDqtrfh8JSBYf/rBTD
X-Received: by 2002:a05:690e:4010:b0:664:146:edf1 with SMTP id
 956f58d0204a3-665966d3774mr5443462d50.65.1783012275504; Thu, 02 Jul 2026
 10:11:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260701122634.1728782-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20260701122634.1728782-2-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 2 Jul 2026 18:10:58 +0100
X-Gm-Features: AVVi8Ce4ilwameOzpTozSm_XcL7ObCu7aNetc2Z_A4FNpYBRdqitBTD3TpHHaww
Message-ID: <CAPY8ntC1j5NxEYep=VLSExMoDVjdJSN=TgpAXq-ecFOdv3Ko8g@mail.gmail.com>
Subject: Re: [PATCH v6 02/16] media: imx219: Account rate_factor in setting
 upper exposure limit
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Rishikesh Donadkar <r-donadkar@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66399-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org,ti.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,intel.com:email,raspberrypi.com:dkim,raspberrypi.com:email,raspberrypi.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6FC936FB319

On Wed, 1 Jul 2026 at 13:23, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The rate_factor multiplier is used to multiply a few values in the
> sensor's timing configuration and the exposure time is one of them. This
> also needs to be taken into account in exposure time margin: multiply it
> by rate_factor so that sensor's exposure time margin is respected.
>
> Fixes: f513997119f4 ("media: i2c: imx219: Scale the pixel rate for analog binning")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 223d3753cc93..05d9737bdc95 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -451,7 +451,8 @@ static int imx219_set_ctrl(struct v4l2_ctrl *ctrl)
>                 int exposure_max, exposure_def;
>
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max = format->height + ctrl->val - IMX219_EXPOSURE_OFFSET;
> +               exposure_max = format->height + ctrl->val -
> +                       IMX219_EXPOSURE_OFFSET * rate_factor;
>                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>                                 exposure_max : IMX219_EXPOSURE_DEFAULT;
>                 ret = __v4l2_ctrl_modify_range(imx219->exposure,
> @@ -878,6 +879,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> +               int rate_factor = imx219_get_rate_factor(state);
>                 int exposure_max;
>                 int exposure_def;
>                 int llp_min;
> @@ -896,7 +898,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                         return ret;
>
>                 /* Update max exposure while meeting expected vblanking */
> -               exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
> +               exposure_max = mode->fll_def -
> +                       IMX219_EXPOSURE_OFFSET * rate_factor;
>                 exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
>                                 exposure_max : IMX219_EXPOSURE_DEFAULT;
>                 ret = __v4l2_ctrl_modify_range(imx219->exposure,
> --
> 2.47.3
>

