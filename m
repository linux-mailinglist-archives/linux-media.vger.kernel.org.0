Return-Path: <linux-media+bounces-54575-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEpYDf4+qWnK3QAAu9opvQ
	(envelope-from <linux-media+bounces-54575-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:29:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A529A20D763
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 09:29:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E65043072D90
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 08:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44BFB372EF7;
	Thu,  5 Mar 2026 08:29:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C47F372EF8
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772699344; cv=none; b=qCjgElmeiKZaCI9OU8KLmZUK+TMJylXuPbKLxMEYU1wfXnOP5y46lamgzfD+Kbi4eLN4nGa7Ng6aWizBgskVOkStvmcoUqZuEowq/2Zg5nUeuZJDRXO8YqvGvvCy2rbFwoerwycl7NA2TqdOn6fCWsnbv2vGJB6lEiw7QeqQeU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772699344; c=relaxed/simple;
	bh=hefLtFvtSppGuVWRD/xSsfWMjnGgnQggEUG9Y7OFLDc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGzOMc0xW+QboeFQOxhuGqYIKTo5r/ijiRAwr3hgwWJesDSbbLp8PtRovHhSlIisk6NRTJSBoHFHINi0FguSZc6LoDwnp/GuibjVizyBQkS6P1MJrvLOVnyFrkZ3vLSjXq0X6raCNYHy3fNiVyvNALoGUwhYxUg+iNnPXXgE6EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56a9076813bso3119916e0c.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 00:29:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699342; x=1773304142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=ZTOCYh8V/FneKXSkQkYfJYfbRZVLQc0YjjmUKLu/5X7qlS4Lpk5K12dalJWBkSBAbu
         LRSnNwYNetP7BAXCOt4Q5lJu9HKNQCpQoFHVAf+gX2J3ynEzzGgyLwUNFYAN+uvIvPsG
         72KHQLj9vheFD5eKxlmEoe7uHjCxYeltFd6z23hQa28svkEcgxsIPCj8FMhOq6IS186p
         fzXRko/tz+bK7Ciq7y5s+BQYOJORSXKQ98hKAeoKs24GNf/d82kWZyslV+c80WCiQxs3
         gSBGj/nn11sPqp7bDOAqJyRYtc5U50F8xaAuZqu/WgDI5BpytUmg7gw9pJbPwRu2L12B
         yj4w==
X-Forwarded-Encrypted: i=1; AJvYcCVa01I8MEflTgwYK2ZjFnFU4tCY45L2j1ee/q4bnqfLcWAlWohx6Lq5P1Zo6VaWT17uXVy1edvU31YfZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZlw/Hs5wSzeIRmSxmMPsW0zOfU9+32Piclovd9okt1/gnyEoj
	Uw10CkX5qW+Cc30iU18f37HA5JJ9SEyJ11YMHY9kD4ip8Sr2zXY2vkrMZngK63Hw
X-Gm-Gg: ATEYQzzYjyPAMl2NO7jKYRPl2XLPaQrxyCXMZ0lNatGKMsQJ6uJqOro8dBgEkdJ1/47
	S0prraj2vPbPu3yvG0X6RO1Rh54OlLpkD8mS1IbUZCpdN1e2MFLMbCEIKbAxAG4mtfFeNy0JpFe
	fhYInbBbcGc4tzhxbe99ZmC0JZ1Ftr5bnqYnE/BTcLouC8C3ytrXnNYLWwfi3JJ7JGWq5jzpjWc
	YLb0HeONmLRsIprs0RTLdBg715uf/Ejt438erkeDkp8bR5Y3GzKLxum6qrUfz9KWLQxfzkCUGd9
	+yMAUUlCkZtTlcz035pJ/IpA47SY0mCrGRh5WBvp73nqTeMDA3EhBKU3KlZZC5R5JxOgWzDpkfH
	SqPVRkCsL1Sm7OURHfOM8Wouzz7oqfErzYH+b12761ZKJphSomYMZJyicT83R3GrICpvlGSlHFb
	Vw9JlEplxNEvQ+yCpGRPo3X73alYLK8+v/3J56pBSHtkh4oNtSNqhyvYw35jgX
X-Received: by 2002:a05:6122:3102:b0:567:39dc:43fd with SMTP id 71dfb90a1353d-56ae77f4250mr2275587e0c.19.1772699342572;
        Thu, 05 Mar 2026 00:29:02 -0800 (PST)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56ae35d455fsm6064745e0c.4.2026.03.05.00.29.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffa0b23a1aso812302137.3
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 00:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6tL2r0fSwDn1uKkIliL9C7UkDuWi6si15pncA9PMsuXUsAZGAojx/mpXtOZoHtkHSUAe29bH/CJJN/g==@vger.kernel.org
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
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
	UNGLinuxDriver@microchip.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: A529A20D763
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-54575-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.967];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ti.com:url,ti.com:email,linux-m68k.org:email,nxp.com:email,mail.gmail.com:mid]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

