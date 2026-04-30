Return-Path: <linux-media+bounces-60094-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +F8hO3JE82kMzAEAu9opvQ
	(envelope-from <linux-media+bounces-60094-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 14:00:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4523C4A2807
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 14:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9577330028D1
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2026 12:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DC793DA5A8;
	Thu, 30 Apr 2026 12:00:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632AE401487
	for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 12:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777550410; cv=none; b=CZ+85ITJDUc+G3anRud1CJa1DmEEODgkZJwmn/Q4w2dZZWSQgUy6Xcgq5UPLDGxLQvBs7LwrnJYnTeME/v51LoHcQfpJ1q5qGjNkU8FbH8ycn5ohTgtTJowg40w8EGNLQBh+66ts7BdnSSgg6RvJnGxskGwEii6J6CLznPKfFng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777550410; c=relaxed/simple;
	bh=EZZ2E4Hk4P3ioWVMaervDcnw6ADW65oM1zGar71sbpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GT+y5UU961Z5C1qjWc0243zk/CoK6OW7f/HVCM7smE/U/i7kv32ZC3wYx2jxuLn5ftUF5u1dyswt6cFggHp1cziUlFEVX3Q7VZ489Ic9tIcxwVW21WiEEZyB0hq1gej7x9HdXUXcavhUiaXvgoW1652CCAw6M2xW5HwWNbs2RSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so1175061241.0
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 05:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550408; x=1778155208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=d17y7PPucZcZE6ThPXG7FPKRMmFPCDwI8859YGCD8uSwiwwiy0tUN1BXDC7fYElOVj
         2Zb+jtjCEVY9MPlQfYj8ynvhI336Z1msgOnkEQUFQy4wh4hMQ27nbEmONgLwFdk9POEk
         9n75R7ynLiG3giP5RKDSMmLfE2AL/rHKjFdGp33BGzRk4nvNueX5OZvr00gyqJgvXDG+
         dil3X+rTg6Mmr9ka7S/fbaD+UvL7CdpjrTzWCdR5F1/7n+m+++/PJ8i0pDXw0sHPQBvD
         QgCfLm7bbFVGSfnYDPIWoORs/2/DoOHMCdB4nAfi2Vnag1FBEGzG/tdsteZKV25ZoO/7
         1slg==
X-Forwarded-Encrypted: i=1; AFNElJ+bC5tJcDSDyxZK6V2+0o6YtCr1Wv7XceAmwGrZ08lFjq6I+EC2zO0AK1eYnb7cGFXruhvbXy4yyB9Qrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSKvOMjUx1TXVvoA0PWGkfQluD9irSOu7s9KHAg/eSfa4qE5/m
	bhIjKLOB9ouP5Lv1akmPW3R0zaNuS1CZwrnNB6oyG4WYb4C4C6E2XzkVDTZMaWIAq9I=
X-Gm-Gg: AeBDiev+zAbx9KNfQzc80rDfcgpc934fQ0ksT5GIu+VOandPrR9ctFeLYijPvVJaDKl
	wnN4TZqnsBDZcaxMxQAtyegFgFbIDRdHckMOhUizWJVrxoyu1sn18JUSAvUjj0iYyLliR5fGKxJ
	pi/Z3xgUydLmWP6u0MOfGFnp/c0s+9uL5UvLkBzPcdNYkoW9IeKguSoJuPJKjIvTOu9OLtff1vS
	9WrzjrQdh68VGjC3Wbi1ViQu9fuxzmnY8QkAAygrYKeSie0ou8LMBitfEl1LstzWT70RBT8dakQ
	dKrZJav34H++BFaIHA224MHnvv55R6QWnK8OHXcXNTW9EIt30HQ9NLHG8s3MDJg1c1oLnMGtAqu
	Me5rHMjLSk4Ifu3tSvysT/4ANQ0LXfO8hJlzwVsWM0tgoIr6rEkxe3A6ULrQ0nTGTP9ShCPHMXH
	aWqhT0RdXNRWcYjaYTGIIN89pglQQ8GZpOQelgBG7oMHNK9Waz0sOgxQ48uQsGMK9zYWVhsCw=
X-Received: by 2002:a05:6102:4bcd:b0:5f5:3739:100d with SMTP id ada2fe7eead31-62af91e4b40mr620059137.0.1777550408063;
        Thu, 30 Apr 2026 05:00:08 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95cb7765acasm2581544241.8.2026.04.30.05.00.05
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:00:06 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-60fea0840f3so1197517137.0
        for <linux-media@vger.kernel.org>; Thu, 30 Apr 2026 05:00:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+RV+wSgH+EY/T6fwPItGLQlPYSt/PN3MFFB2LuVAHipZsswtGI8dxzHxb/w/axKZkwNboyi9BIRSO7bg==@vger.kernel.org
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
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
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 4523C4A2807
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,baylibre.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,glider.be];
	TAGGED_FROM(0.00)[bounces-60094-lists,linux-media=lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[geert.glider.be:query timed out,vladimir.oltean.nxp.com:query timed out,msp.baylibre.com:query timed out];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid,linux-m68k.org:email]

Hi Vladimir,

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

