Return-Path: <linux-media+bounces-57015-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJuiFJ7Vw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57015-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:31:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B8B324E6A
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:31:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB26E31BE893
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:50:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F7413D6CC8;
	Wed, 25 Mar 2026 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ti0PMQrR"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C673D3D11
	for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 11:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439325; cv=pass; b=ryN2DfkhHAvhcavGhFxZ0feB6CEXIBw4eIdX7IQhxjnJRdjdQHZmcNe2QhqvQC6JxGrGv4sPkJurlQ/tLx6fodNLDhMBMcQLebtXAcwfX5XByH+nEVHzHOb84+0MhOdpPloQWR758LBwXhfqhzWZi11WgB0lBaj1qcx1JFnSO2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439325; c=relaxed/simple;
	bh=J8G5pc+I/2SDJDIeMSr8ILm7OpfiBQYJlkNcvRTLrC0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWXgS/G1joXVZoXjZUnh44YiVTXZLYD79kIMrvwwFyTYm2XZ9BicDzVZpq3ZKHn7+fZURtIMB6JDVLst4VIcJmCESTrigXBiQw7+hR8E/AJmLhA7vYbdfNRNQ6D7t8BQbLL7xueTjojGoVK3QdAhy5c9ZZO6pNKlZlwq6mz3YrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ti0PMQrR; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ca4dfdd88so4802462d50.0
        for <linux-media@vger.kernel.org>; Wed, 25 Mar 2026 04:48:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774439323; cv=none;
        d=google.com; s=arc-20240605;
        b=kfzxTzUDy2hT17tiLya/6MrVusHcGCz9WYQ1dAv/oNKoiIgXttUWzLB75Wqddu0LlA
         n06nkZxpesgPiwBOr+YsdtJ0879GNKtdYGgtpjdQxRPZCkwE02AOd3sC4srHwFS/0LbF
         kZPWLTncO33ItTpDf27GAmNI0BwoBy/xfojhGrtxRD1dtfMr/9ciL8e1WTN9hAwJLo/D
         bLKArYiy5UoMcM1F6X5hKiZdAwDsf22NVlleItXBHBzIZyA1PK1mKgv5sc8gbhT1lS1f
         3eH9d4SEBloI909x+KinSGYJA8eNYH/FlRXD8alMy590i+xDXGOTi/afEZhS6avRLeMx
         HG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JNSA8PY86TiR3EpCYDsahYet45oBTwPNX9HwTQnWi8k=;
        fh=5fvgRv0JFQ+qxRjMG7lVpR2l1RbaMPElunm4U+F9zxc=;
        b=KKa9aKP9N7HiuvWa78A0DBLYihyV975qEJEKVL3YXKsJaBVqFW4uvVi5kdTLgEJawl
         bpC9gx69+rYRoJsOkEql1frFnWuT/eYsBwqDeiqeTNDDo+uzT5KhXJB8eys9DR6pbMjA
         2/UyL7lohspWffPaU/J/gtHzEuG5UhC2/RPUepGv9n94+8uWT1MGKr69LEP2no4//reZ
         9CP7wbGaK6MvD5dbmlcQpmcCw/WYoPqo8FOKK9vnc3lRO+1c61aDa9R2cGCpSCdhTEYF
         /bh0fHXxc303tK+PanO5zX4SUkAtD/6cSrF4vYXEReFQsGWTyIFS7G/RSNLDwJKgk5lW
         M2+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1774439323; x=1775044123; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JNSA8PY86TiR3EpCYDsahYet45oBTwPNX9HwTQnWi8k=;
        b=ti0PMQrRyi67m7fm2+MIRacA+zQkEUC+DsXYAXykx43WQqI/Xfrn+8chX6VUWQzTV1
         gr6uhAnuVT72zmRx+uzU71layhu9T8pW+CZvLqIuGQkHCjdsiKYU1qLGKc3TXYdoNof5
         3Rv+D4C1+A4O3cdru8GH2biIknlCiNyppfApbAcg0PtWOhlRgfRFWR50tkQtQvdIvsLB
         LUr8CereXT8bciGO5mm2xxNJ5gg+HE4+nOFQvwzifdozWdUYtBdF+mxT0i3wbH9N1z6f
         cS5IG08fSzyj5/pY+sTphW0Tsfw7ttrztJuimrB1AYKl3zHeOMiqqHrt/dr6oOZc9ZJd
         aEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439323; x=1775044123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JNSA8PY86TiR3EpCYDsahYet45oBTwPNX9HwTQnWi8k=;
        b=PiFHnn0NnDRTbVmquQczznm1hRklzDOCtSRER8OCY/z5a2ZVSU3a6SbpIZUzIJ/jIR
         yMeifKcr/E5hB3yCIVtmcudRGGdhB43E3uZnkNiO/qQJgq+O7dMXaxDmtC+qoC5SvavV
         P6ztG1xajovrqibRF9gpG6IrD5LuZaBgtQ4G/DySXiB++85Ei4dqIavTL6u04gsOgjxy
         zthXgIhlQ6QSzEFZ2VrvzZzQ8Iss9gBMb2PR0/xtPgKRGxab0/ZoUcHdbAkPAfG2i6AI
         Vb3gF6vHekhawIK8cc3Xzjh8u09xaIAgoxEr3yZ878aygtDbGe8lbCFgHG0g44gQIteE
         K57Q==
X-Gm-Message-State: AOJu0YySJrALwbm69xtmcRJkGyRtI0my3npnbcUEqfho6AaI5dAQoL3d
	V8DmUNMh1BCmMDOmVK/XZK2npuexmQVB4Nz+oSbcksMbFFSclPL2uf7UDMQ16fsnpyTpMYn9ZsU
	3cQf+E1vgErQm/0id0cSc9rd/sSOhezHGbS2k4nw1rQ==
X-Gm-Gg: ATEYQzz7v5LU3B2nAb9DyQA0cvM8UI/CrwDDrDX9USRlkLjddiJX1pFRaoZtkqLK1lr
	XFms41tPnf30M6/vv1dvSTvua1kR7agIWwDs/HIs2IDVdAs9C6s7p9ZxDxwIgBu5hDGpUoitWjp
	cb7+16P4fk2FOeP0Rh9NgCsMrp+8r82VqpuvwO0BPbZfkljA3DVp9UH8IetP90zpJRDX1S4C/Ox
	vD/1TcPCRzuvrOzQY47r0SaGP2YU06W1+hQ1WamgddAWrQHKKgUKBzSXej0S+zGWf7aB2Ho+wpk
	2uYZ02ydZC0QZYfUZLZ94MoRSG52pavX/uB6xHj52RWv7XoZ
X-Received: by 2002:a05:690e:169e:b0:64e:c641:d06b with SMTP id
 956f58d0204a3-64ee6073408mr2845050d50.6.1774439322898; Wed, 25 Mar 2026
 04:48:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260325105818.1176816-1-sakari.ailus@linux.intel.com> <20260325105818.1176816-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20260325105818.1176816-4-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 25 Mar 2026 11:48:26 +0000
X-Gm-Features: AaiRm53LOvgQnDBa4mTqC3SdA6NhxtS0pZTKr8y10d8kfAgZhj0y1WkdI9x-6mQ
Message-ID: <CAPY8ntBdZvsxxmeH42vVif0Dn8LmUxb7mezWk57sg=YtdQmMyA@mail.gmail.com>
Subject: Re: [PATCH v3 03/22] media: imx219: Set horizontal blanking on mode change
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[raspberrypi.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57015-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 94B8B324E6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Sakari

On Wed, 25 Mar 2026 at 10:58, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> The driver UAPI is mode-based, allowing the user to choose a mode from a
> small list based on the output size. The vertical blanking is set based on
> the mode, do the same for horizontal blanking so the frame rate obtained
> is constant.
>
> Additinally, it's best to use a known-good horizontal blanking value as

s/Additinally/Additionally

> choosing the value freely may affect image quality. While the minimum
> value may not be the best value for horizontal blanking, at least it is
> constant rather than a minimum value of a different configuration.

I've never known what the preferred behaviour is here. Ranges
typically change on mode change, and v4l2_ctrl_modify_range will reset
to the default if the current value is out of range, but otherwise
leave things alone.

Seeing as you would be the one defining the preferred behaviour, I'll
take this desire as gospel.

> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

With the typo corrected:
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/media/i2c/imx219.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> index 89061dc1842d..62a23541b1dc 100644
> --- a/drivers/media/i2c/imx219.c
> +++ b/drivers/media/i2c/imx219.c
> @@ -837,11 +837,9 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         struct v4l2_mbus_framefmt *format;
>         struct v4l2_rect *crop;
>         u8 bin_h, bin_v, binning;
> -       u32 prev_line_len;
>         int ret;
>
>         format = v4l2_subdev_state_get_format(state, 0);
> -       prev_line_len = format->width + imx219->hblank->val;
>
>         /*
>          * Adjust the requested format to match the closest mode. The Bayer
> @@ -882,7 +880,7 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>         if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>                 int exposure_max;
>                 int exposure_def;
> -               int hblank, llp_min;
> +               int llp_min;
>                 int pixel_rate;
>
>                 /* Update limits and set FPS to default */
> @@ -924,15 +922,8 @@ static int imx219_set_pad_format(struct v4l2_subdev *sd,
>                                                llp_min - mode->width);
>                 if (ret)
>                         return ret;
> -               /*
> -                * Retain PPL setting from previous mode so that the
> -                * line time does not change on a mode change.
> -                * Limits have to be recomputed as the controls define
> -                * the blanking only, so PPL values need to have the
> -                * mode width subtracted.
> -                */
> -               hblank = prev_line_len - mode->width;
> -               ret = __v4l2_ctrl_s_ctrl(imx219->hblank, hblank);
> +
> +               ret = __v4l2_ctrl_s_ctrl(imx219->hblank, llp_min - mode->width);
>                 if (ret)
>                         return ret;
>
> --
> 2.47.3
>

