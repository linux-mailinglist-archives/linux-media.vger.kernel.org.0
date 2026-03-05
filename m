Return-Path: <linux-media+bounces-54570-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOMgH0I3qWlk3AAAu9opvQ
	(envelope-from <linux-media+bounces-54570-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 08:56:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C895C20D02D
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 08:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8617730330BF
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 07:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD452335BDB;
	Thu,  5 Mar 2026 07:55:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D027335546
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 07:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697341; cv=none; b=OKWyiAqzImjXARH1HxSjWYBoOx8T2UgMqt0PPDmHanKey3FD41rsu4xlo5LXQzxwym+U1WvpOrovZw/olSGt7KdqnH/oSXm+3nCR+wBOw4cEmcmEmQHDfYVEg614DElZFq2jTHLivcYEpX6miaTHQ65H7Rq4XMIbTOCSQhZHgV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697341; c=relaxed/simple;
	bh=urVD1xPdaF3hV5GqXqVqTidMinFWi7P2lc2J0G3o7gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tP86RiAgHkXw13nX6ldFxTffPHgLBkh0EEMohb+6n5cRfJNFMmBWHrE5AVwTeoujI8+m0oZr7+0DCzKb/ssN8LPglMuqzV9wPUEVppEGCF5GUgBxl17zmhs66YbtlSRcGTAAPK/IeoS52zkfEL+qyZszcqUfksyNSwj+17ua7Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4138136f02eso2248065fac.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 23:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697339; x=1773302139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
        b=Vtp2d3KGsv6/Mrw/MNlzBbJqiClw5Idvjq/jQ7u+/tt70BAaMoGeRWf6BGqjZyNNRn
         UiDLpCaspiB6log//GYzIQPreG9TxuOhO0nPnKezU8rQIzYquOUeDdhzplafvdRSo2zn
         DR1zN2x/R+d7MVKwkHpUdc9KkImruVcX2oIOMeerMFogsX0wbXWVEldGZdeiOlK8c86u
         I8/dlkvVq5r9uHh+IcFChylU6EkCuUpp8vz33J6XGXe8twI4ib+VaMx1pn0svkcD99yS
         2Vbvhk8juWMEXQ1RI+UmCXkmQtP9L7pfRCCxMokxOCMinn/g3qsfLiXTK2DLQS0Nv6+D
         8XbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVywGNrY50Xj9xRhRMvaDI/ng0eKNkHfW0F/Ar0fLuINMqJjtU7XoMGhvD3uUF2dbfHsQrz29Y/PMAK0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YymOiObWcgMWcEqyYeJV6TikY+pOsckAhN1djvlUsxKlXF615Fa
	oJN7AbtocJCIXdIQZDsLIcEjyRtFIr1qwUbdoivhBoMYOP4ugAuUI7SyTUQB05Z1
X-Gm-Gg: ATEYQzyq2/7szY4vOErItgqrsK0OXqgouV2CHXrjhDbgb14PpK4YoU/esudhKSqt4SO
	cMDsgcdR9F5fhKUcB0hQIjwROFOYPfOApajB8XOIp53blcmfPRW5Ls7Ztiyr+zNMZnThHmUIjej
	N/068P/ThSPjj4bP0fFP6mSn5qHZUX95SebOUeq+CvV3dPgOOnnubcQYbH+aMh9CliMPprxneah
	pnM+Bm5MnvHZGcsADCkRNpdJCsdPEArCvVmtn23SjSBMncamy9hjpYqttISM+Zsgp+LjiKsVI3g
	KTtJU57BAWm4iNM5koaDJuDb1YnKexEKoqo8J+67CblKRbOiQ3NDdLSGZNgz05DSEKbBwZHfyb0
	OdiY7OGTkb35qxZI/hQmwj/VmH1e7TAFZbXcAJCxY6K8GY+QM8vJeBLhXcfs1YBG5XS3xta+yNx
	RMHhUQhZuTTvMAW7BELUr6MhJF0XprF1Ur/ehfacIHz6QntAW85DjsoiVpgq45
X-Received: by 2002:a05:6870:15c8:b0:3d2:5ad4:4e7 with SMTP id 586e51a60fabf-416abb50819mr3097505fac.47.1772697339333;
        Wed, 04 Mar 2026 23:55:39 -0800 (PST)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com. [209.85.160.43])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160cff1aacsm18990024fac.9.2026.03.04.23.55.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:55:38 -0800 (PST)
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-4138136f02eso2248056fac.2
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 23:55:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVxbkCSr3HnTAsRfODUnaWSFWlv+88Iq5heRnXnQoTtJJH8paolUA2uHGI5VKab8d+910v1KLwBTYj/oQ==@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: C895C20D02D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,baylibre.com];
	TAGGED_FROM(0.00)[bounces-54570-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.970];
	TAGGED_RCPT(0.00)[linux-media];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,nxp.com:email,linux-m68k.org:email]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

