Return-Path: <linux-media+bounces-66376-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wQhTHVduRmoEUwsAu9opvQ
	(envelope-from <linux-media+bounces-66376-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:57:43 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E47A16F89DB
	for <lists+linux-media@lfdr.de>; Thu, 02 Jul 2026 15:57:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=raspberrypi.com header.s=google header.b=BE+o5wxi;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66376-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66376-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=raspberrypi.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A140C301AC14
	for <lists+linux-media@lfdr.de>; Thu,  2 Jul 2026 13:57:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2EC4ADDA3;
	Thu,  2 Jul 2026 13:57:38 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A31D4ADDB5
	for <linux-media@vger.kernel.org>; Thu,  2 Jul 2026 13:57:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000657; cv=pass; b=oMVz3JmYtbfoWYnDcqTitzbUHgE1KWIUyjrBKizlyjbeRzSkpAVUeqA3M9TtyqbtN6/na7ljF1gWQDTj/r/+XuOnfF/i7mojLevpLHFOTsef3VkaHu8rnJCIV1VBSIbx5K1kIUjjZHI2duDdR+iU0F9M2ucRf46vH9wfDpfdGFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000657; c=relaxed/simple;
	bh=CgLVwhzuaGigELUUyn93ur1slsiWDZCpISB6BacqHgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B9mZ9pSUjmBuvbkn8NJr9uj/2Talt0rdzy6ouyUkcSpWFow7I7Hupi2tZ2LlTqLoNmKfCV8CcAJe/W/VxH7grcjAvNrwf5/Mq2twhHWW6FMob9AbLHlhxhMixGd1aVue+dsTHw/hhayVWS5KtIeI4g17h/fF+O1Z52e3DGLtKYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=BE+o5wxi; arc=pass smtp.client-ip=74.125.224.49
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-6651bc5730dso2739767d50.2
        for <linux-media@vger.kernel.org>; Thu, 02 Jul 2026 06:57:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783000654; cv=none;
        d=google.com; s=arc-20260327;
        b=Qsmk1Tiv6M4GCFrjJPmCmNlrwMDZBPaQsGAnZ/LTE5rvYDWeOUxmJxsHp3ZsAlruQJ
         FQ9e0NR6IsOSZ+iFTXDY7tTY70IX+kWStLZhHT7cmu09W+btA/sWQF2TIS/GO6jfuHyz
         tjmMxfxeo2qWbn2e7BfhTY+Rgh1/64xJ7MWuS9twgICrdbpSganMzaWEr5IZMe6j51av
         LGiLuapUgsWVDi5guN2EaVRN6UYFm9tPCwuYU2ERnsk47clf6JvHHi6c2wfEH3CpiuxR
         w9y/jh7KA+rSudEIRjXZMzDOnIBuFkew7ZEMAzLkcjgmt0cgtE/3lpZpEA73ecw5ozu9
         Mb2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZpVM98wv+peEQ4O6jXgP6XKpYw+FjbF84JaJw4nFIQY=;
        fh=wCgf29w5Tfiwiv5ySPc/k82f0CcZCa01Bp13MVBRgUA=;
        b=GuY/FpdLmh1G6HoEHAO0M8+VfjMtC5vSncYqRlItCw9ik264gK4EI9/WUzBirNuc0C
         hWOfgiSoV1OSeCnUhStI8XvEkiVUUsphysvD96tbLJ6DJ6UWYmtpyChzIPidpHJAu6Jz
         9tU1R1x89ecx4D7lqAtG6+M6v1ee3Ang6PSzB/gsZDYzh0SHUbbaRMA3SHseizC/fMy2
         k3TzaqNsi7KTnt/9PTob5m6t0Oy970Km+ChxWiKAvFwwRwdOl688IxZMpxT+bahCwidY
         nLqS2i1maqd6t9HVwE+p+yNmGJ37F/MG/FOgME62wJyXcob4GrZGwJRpLxCWVk95RwN6
         ktcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1783000654; x=1783605454; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpVM98wv+peEQ4O6jXgP6XKpYw+FjbF84JaJw4nFIQY=;
        b=BE+o5wxi9lVYc2MHthhLNNJsZLB94H6fp4tYuklXffkLf1CXUo7tqbZRCplPdm/sGv
         kk2YiDUIq+Wr+SlBmrwyTta4dXSLC7LCXmBlrXS1AsumWjy47D2E+FwKOfbjH6QXgjmh
         bPwTYpjHGN88HZ7rwGKJmCkik4yXGGNtWo3nTO2gFgr/ziqFhphrX+LQZq7eq6yxxfbj
         PpNEZPcSwJc0R4mRY5E4KW5wOt6u4Fqu9RhNHa6zKiPMmA9QLR09Iu9vmp41ih48nYF5
         /Vc/gfkMS5phP18uej1hswPpzotBrc+WdEzJLzT0CNnfFvJCy86KHzArS0bou48yx3GX
         HzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000654; x=1783605454;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpVM98wv+peEQ4O6jXgP6XKpYw+FjbF84JaJw4nFIQY=;
        b=p7icvwd51dAz6ESaWJBCXZ+wI7LBmb9oEbas1d/42/lvqFx4mFXK9VeXsaNAXmgC/L
         j3iiBkJjhBiAJKpzE9VPZ51aL8F+Mcno4S/dOsUPnHUB+yACp2GO62Wok/rbMgOTSrA2
         2v4v7u8M1KC9J98fWWHRGE51fdND+iPn8tyhemmIVvek+/EYnTuXodUNOq7fbDLyF5SE
         Tp89jLWYosZwFcHnY22I0pnUKMadzpJsSotZll6DdOPXhrEk6x0Zh44hPsh/q8P6c2OM
         qJIDPiALXutMq/pANFd1TtVN3leGuvYbF4AAJSH2tUdHx4asboDG7EynlwnUvCRTLpov
         BfFQ==
X-Gm-Message-State: AOJu0YxC2YlIDTOts3XB5eRJKCOdIcFKwE80G+Wa86gJ0MBN1unOCHEX
	xGk/dyOqS642xqJ70InlgWp6B7f+V19ZIhY7OsTxtFj95XB3hh/L6u+7eC9/wkzRC33tcJo2w/S
	Xm6gZi90LYRU6rd90Im0eRK7SUCgq25SkJrgL9Aa4pg==
X-Gm-Gg: AfdE7cnFSI4ozd67wXOIHPpJuFdEYorQykmYvL+CdVS73voCliFQzHaJ6s0Bee21L5v
	x5/AVgS7vcbMXjYE8LA5n5/fyw5xAA6myqx4/OUUyGSwynKGhwQQdCl5XOjZX03pWf7M7mFXrNC
	hYI2LxQeHPaZUyIXfFAltBkKW+10rA+VtUtK/YTsNptfpfReKiDuTZNWh49quF6Ns7u1vkHJLF8
	Q9ChYeb8ghsXn6wJAIBdajid+0XWabYaVDsEW3PyeIe29Di2cPFS6KOCZQ9sCLN1alEIrS7NXFO
	Z36QjOShccv8ccIcouXgnEhOcMzk6oagiqSCWISl9IFExh1s0yvP3Vn9xzRWLDwbN3KP+S0T2ma
	GrMxILZFdSmnfTg==
X-Received: by 2002:a05:690e:488e:10b0:664:8836:fec1 with SMTP id
 956f58d0204a3-66521a09df6mr4593085d50.36.1783000654534; Thu, 02 Jul 2026
 06:57:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607215356.842932-1-sakari.ailus@linux.intel.com> <20260701122634.1728782-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20260701122634.1728782-4-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 2 Jul 2026 14:57:18 +0100
X-Gm-Features: AVVi8CeEY5CUICm-LUzdhYjKJU3T90fEdiPBmxV88zvaqLW_fwB5jqcW9jktQ00
Message-ID: <CAPY8ntBYXtnfNqpy6g9fscmk2iqXxuZHyC=utqYdq-7rH-bhRQ@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] media: imx219: The horizontal blanking step is 8
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:hans@jjverkuil.nl,m:laurent.pinchart@ideasonboard.com,m:prabhakar.csengg@gmail.com,m:hpa@redhat.com,m:tomm.merciai@gmail.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:christophe.jaillet@wanadoo.fr,m:julien.massot@collabora.com,m:naush@raspberrypi.com,m:dongcheng.yan@intel.com,m:stefan.klug@ideasonboard.com,m:mirela.rabulea@nxp.com,m:git@apitzsch.eu,m:heimir.sverrisson@gmail.com,m:kieran.bingham@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:ribalda@kernel.org,m:hansg@kernel.org,m:jacopo.mondi@ideasonboard.com,m:tomi.valkeinen@ideasonboard.com,m:david.plowman@raspberrypi.com,m:ong.hock.yu@intel.com,m:khai.wen.ng@intel.com,m:jai.luthra@ideasonboard.com,m:r-donadkar@ti.com,m:prabhakarcsengg@gmail.com,m:tommmerciai@gmail.com,m:heimirsverrisson@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-66376-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,mail.gmail.com:mid,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,raspberrypi.com:dkim,raspberrypi.com:email,raspberrypi.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E47A16F89DB

On Wed, 1 Jul 2026 at 13:23, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The step for horizontal blanking on imx219 is 8. Take this into account in
> creating and modifying the horizontal blanking control. The minimum line
> length in pixels as well as the horizontal blanking values are already
> divisible by 8.

I can't find this referenced in any of the docs, but experimentally it
does seem to be the case

> Fixes: cd5e2fd89923 ("media: i2c: imx219: make HBLANK r/w to allow longer exposures")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 2aab6e7180d4..52a4bd9c4fd3 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -78,6 +78,7 @@
>  #define IMX219_LLP_MIN                 0x0d78
>  #define IMX219_BINNED_LLP_MIN          0x0de8
>  #define IMX219_LLP_MAX                 0x7ff0
> +#define IMX219_LLP_STEP                        8
>
>  #define IMX219_REG_X_ADD_STA_A         CCI_REG16(0x0164)
>  #define IMX219_REG_X_ADD_END_A         CCI_REG16(0x0166)
> @@ -578,7 +579,8 @@ static int imx219_init_controls(struct imx219 *imx219)
>         imx219->hblank = v4l2_ctrl_new_std(ctrl_hdlr, &imx219_ctrl_ops,
>                                            V4L2_CID_HBLANK,
>                                            IMX219_LLP_MIN - mode->width,
> -                                          IMX219_LLP_MAX - mode->width, 1,
> +                                          IMX219_LLP_MAX - mode->width,
> +                                          IMX219_LLP_STEP,
>                                            IMX219_LLP_MIN - mode->width);
>         exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
>         exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> @@ -920,7 +922,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                                   IMX219_BINNED_LLP_MIN : IMX219_LLP_MIN;
>                 ret = __v4l2_ctrl_modify_range(imx219->hblank,
>                                                llp_min - mode->width,
> -                                              IMX219_LLP_MAX - mode->width, 1,
> +                                              IMX219_LLP_MAX - mode->width,
> +                                              IMX219_LLP_STEP,
>                                                llp_min - mode->width);
>                 if (ret)
>                         return ret;
> --
> 2.47.3
>

