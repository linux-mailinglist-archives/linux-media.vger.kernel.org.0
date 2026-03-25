Return-Path: <linux-media+bounces-57035-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKviHFjZw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57035-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:47:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE313251DF
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BE9CE30B0CF6
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 12:38:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 656B13D5661;
	Wed, 25 Mar 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="moyfYVsb"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9FA3C5530
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 12:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774442293; cv=pass; b=e1RXo7K891haciilVwwuvPSKPFd6gNPs3lunYxFs/wJuLislUemNZ3K+1N0mbXV1VWQ4ca95iMHYHnRNRg0Fdh+qROnhlzi3wtYlhgkkmOD5gwXRQSuwFxl6K/VcYnFZ8bn8W9qeNKJhyFDQ1NythXdUwXks/K3QfHF6YMYssVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774442293; c=relaxed/simple;
	bh=VXJt3gTVcwpZtvlxwquf349duZGxNLKE/8EMzOYa/vk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGoYp4mm2QGrW5ocOX3MHZOqzulzZorFxs+/y8x7sSF2//y2OVDE/6GR0HL0Ay2D2t7VKIxZoUmdNeG6XPbYRBjN61XP8UhebpscOQDqpkTupfvfnYPUiLKOfgrTTTrKH26xawsA8N/3fi7PP+5QyHxs2lbAoWVTcXG4rooEgic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=moyfYVsb; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-64acd19e1dfso5399318d50.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 05:38:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774442290; cv=none;
        d=google.com; s=arc-20240605;
        b=M3cJPa7BydFFPcaXdQqVrti2PjbChN+dC80XeQ/v43goY8wpfCcDbApN+vKz97YxQL
         uhP++Y7ri7n0qnKAAjgnSkYg6K8HQqaQZfyixnFzieKykAM6EALch7TcHINaK5ZOYiOb
         nEpXDYOqxZQ2Y7GqHfQvhwG2ZUGK3dhaIkMRCp/qadUFqSby/QzmDT5XilF7A5EGwYK6
         s5gyM2+Dy0Omxqil8/bMJo6J4SCMFZ68yDOtpCudy5Rr/qVlfMHN7Qi4eOtj0eebYcFj
         5tyt3wmrMV+gwRQbUZEn+SuCPT5sIX5a1dYnz3Qj0QuUzW+/S3QYN+n8dG9/TAviKYM9
         3WaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QN3QGp1gViGwO/gHtftc87uiruvNvw6VwiRV0muZUNk=;
        fh=5fvgRv0JFQ+qxRjMG7lVpR2l1RbaMPElunm4U+F9zxc=;
        b=I5jxpwk1XpgllIxi/YOZj6uQ1pmuZSDgd3gkdNhUaVaxVtqRwxvw3KW8BKDahsdV1q
         Aj8esg7ixQ/Eaec19Ty6kF7YHdxEFKpUAyiSK4i5OzMFJsrPvJNpwHk9PiPExp3Vyl4J
         TsKXZ++5Sz+oj7k3ZTBX/wfRstlTAKt4aUJQhQPEXdJLzo9v1SdKIMskwbsW0yiKg5Mq
         DyuOBzqc+Vplh3DUq6kxGAzeJpxWtY9DqRQBepvPP+E0b3rXUX/E+ZcVzhBaC/b/dkuh
         UeT+Ty843YbwTsNWHZWLQJpa2vikBpBFU9AlmSBgRmFvaj9TfX67iewQjlY6lNftAwtQ
         6HIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1774442290; x=1775047090; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QN3QGp1gViGwO/gHtftc87uiruvNvw6VwiRV0muZUNk=;
        b=moyfYVsbyhaCcXZ7ciRKgv9jMoWy3cKyMFVc6aKYXWv9yCg/D4NScSLJWDfFIUIYG/
         fx+MzHhP42yCBpurNhrcOuTyj+T4jgNV2Hniw9hPRK8HCJTsb6egN9EuJer9vHFmCxmV
         NoN/wBBiOfqhMWTo6hfQUiZ/HOR5Ev1SN1cFTLEWRRHII5nv1rmmAR/fxwPfq5dybRN+
         CEhZx73PoWInTB1TZO5kNCJ2XNpClxkMf+s4hSejqLACkCemCbX/6nRyolO/qQA+31Ue
         iFvZndx0U/FRTzkgMjdbdibFpWea3ob8OxxNliUmqwOdkIkhzxZJZw1r95ZDsU8pxUZy
         P0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442290; x=1775047090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QN3QGp1gViGwO/gHtftc87uiruvNvw6VwiRV0muZUNk=;
        b=kL5wZC623oI9y82KC0GL4Pl5tJh/4Yfi3dwpwyqq9UAZ5xdVI+dhtSywoUS2ErKdq5
         V4+KpRF7ZF6wfdhhev2PdmJaViEASWtsdvbmoruvZB/8gIBoTmRtBKaSvGPFHq8QDdyJ
         Mj+Dv2zmslggrunwlZoc74fzMArXTHz0lj/i46bMfdnlv304bKaATxEpfr7wE5rAaJdx
         WfEc2+/6nYIPJMNFZILigsrCToWLSA1NxghhJlG30ORLRPl3XlCGz2PsOZqXhAK4XlPm
         8nOrUfI2tXGZGkXRz8jIn23I6llu1WGxZUUx0BQo0QmjPWhWzB4+SpP4at2bXJ3oAiue
         rEMw==
X-Gm-Message-State: AOJu0YwfvmSTQJ+df7bxRR4Hyp5LSE3I5IZCjYQkS/wts2sYmSs3HhSA
	qk0amv7EKAOqwmV++LWPFvroJs/MlT1fIKjPUWu10PaJiQ/ftAQCCURz/o4dOFr6vxdPIdsFl2Q
	KuZMXra0fGzdj6r/KzvzaS7L/0HzVPfoaDCrLBig9yw==
X-Gm-Gg: ATEYQzzTElbxdI0YU1W3pkcQd+sDKJzRvNJZJPg5jXFRguwnfSWSzG5wsAeIR65mn9X
	UqRA77SxgC/04SXvIPLFBGxfLrgBLCupMujNnbOnd/g+fiR0aqlFt2IYHWMdNigtdY1e6RdQi8O
	Gl4MQsLmMsjQVYIt6/RkS3VNbCxPdEaMgXIxT1Ol8mfRE1bi+Eb1N2pTAHX1/ZaRs2u0voyXE7t
	OpBadBQTwu8jy/AxhhQIpt8gyONpgBCQWXdviP/K5XGiEm7qsPpYirGZ3MWulfjSL0MnCqsXFle
	Uzwaikce5L1XMV0WrfbMkXxzMFGDRctroVunvg==
X-Received: by 2002:a05:690e:d8a:b0:64c:b242:496e with SMTP id
 956f58d0204a3-64ee609d0famr3400955d50.17.1774442290152; Wed, 25 Mar 2026
 05:38:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com> <20260325105818.1176816-7-sakari.ailus@linux.intel.com>
In-Reply-To: <20260325105818.1176816-7-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 25 Mar 2026 12:37:54 +0000
X-Gm-Features: AaiRm52WFb9eWaAveFq1Z3A3ZTla-R0vU30op-qcPxmDK90TMpeltoRvep7nhlg
Message-ID: <CAPY8ntAmcychf6qCJzpSwPGW8nj116gMjwJk=gGvWMeV0=qEZg@mail.gmail.com>
Subject: Re: [PATCH v3 06/22] media: imx219: Don't update exposure limits
 while setting format
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, hans@jjverkuil.nl, 
	laurent.pinchart@ideasonboard.com, Prabhakar <prabhakar.csengg@gmail.com>, 
	Kate Hsuan <hpa@redhat.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Massot <julien.massot@collabora.com>, 
	Naushir Patuck <naush@raspberrypi.com>, "Yan, Dongcheng" <dongcheng.yan@intel.com>, 
	"Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu" <tian.shu.qiu@intel.com>, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Mirela Rabulea <mirela.rabulea@nxp.com>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Mehdi Djait <mehdi.djait@linux.intel.com>, 
	Ricardo Ribalda Delgado <ribalda@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	David Plowman <david.plowman@raspberrypi.com>, "Yu, Ong Hock" <ong.hock.yu@intel.com>, 
	"Ng, Khai Wen" <khai.wen.ng@intel.com>, Jai Luthra <jai.luthra@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[raspberrypi.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57035-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[vger.kernel.org,jjverkuil.nl,ideasonboard.com,gmail.com,redhat.com,foss.st.com,wanadoo.fr,collabora.com,raspberrypi.com,intel.com,nxp.com,apitzsch.eu,linux.intel.com,kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dave.stevenson@raspberrypi.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[raspberrypi.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: DEE313251DF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, 25 Mar 2026 at 10:58, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Don't update exposure limits explicitly while setting format. This is
> already done through the s_ctrl() callback.

done through the s_ctrl() callback for V4L2_CID_VBLANK.

I believe this change leaves a potential for future failure if any
modes get added because the ctrl handler framework swallows any s_ctrl
that doesn't change the value.
vblank is an offset on top of height. exposure is absolute in the
number of lines.

As an example, take the current mode of 1920x1080 with fll_def 1763,
therefore a vblank of 1763-1080 = 683, and max exposure of 1080-4 =
1076. Add a new mode of 640x480 with fll_def of 1163, therefore vblank
is 1163-480 = 683, and max exposure is 480-4 = 476. set_pad_format for
either mode will set vblank to 683. As it's the same value,
imx219_set_ctrl will not be called to update vblank, leaving the wrong
max exposure value.

You could add V4L2_CTRL_FLAG_EXECUTE_ON_WRITE to V4L2_CID_VBLANK to
always call s_ctrl, but that would have a larger downside if userspace
repeatedly set it to the same value.

It doesn't affect any of the current modes, but it's going to be a
very ugly one for the unwary. imx219 is often pointed to as a
reference for those writing new drivers, so this would likely
propagate.

  Dave

>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/imx219.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index a72630ad1561..ca6a5939773d 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -867,8 +867,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         crop->top = (IMX219_NATIVE_HEIGHT - crop->height) / 2;
>
>         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
> -               int exposure_max;
> -               int exposure_def;
>                 int llp_min;
>                 int pixel_rate;
>
> @@ -887,18 +885,6 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                 if (ret)
>                         return ret;
>
> -               /* Update max exposure while meeting expected vblanking */
> -               exposure_max = mode->fll_def - IMX219_EXPOSURE_OFFSET;
> -               exposure_def = (exposure_max < IMX219_EXPOSURE_DEFAULT) ?
> -                               exposure_max : IMX219_EXPOSURE_DEFAULT;
> -               ret = __v4l2_ctrl_modify_range(imx219->exposure,
> -                                              imx219->exposure->minimum,
> -                                              exposure_max,
> -                                              imx219->exposure->step,
> -                                              exposure_def);
> -               if (ret)
> -                       return ret;
> -
>                 /*
>                  * With analog binning the default minimum line length of 3448
>                  * can cause artefacts with RAW10 formats, because the ADC
> --
> 2.47.3
>

