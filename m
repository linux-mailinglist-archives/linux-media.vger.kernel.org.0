Return-Path: <linux-media+bounces-54569-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGE6IF02qWlk3AAAu9opvQ
	(envelope-from <linux-media+bounces-54569-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 08:53:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D51BA20CF61
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 08:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 366A13031AD4
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 07:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 485FD32ED2E;
	Thu,  5 Mar 2026 07:52:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AD927E05E
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 07:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772697175; cv=none; b=nY7vKa8+DUh9nfNL4V0IkY8581+oMRW5q2YlPDL/yh7IBTUwZmqPUGuSLlJWB7rP6Vye7EacDp07aAvMXrAKgT25I1i41PZouWlrU6+VXfewNqEunJHDpum5X4OkHjyGqiZ1J1TSMakDTODw4PunOizijGlv+fjARSl0bj3WIjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772697175; c=relaxed/simple;
	bh=1VrdyW7eBzn3eIzcJ/qwIsXSzypVzRQDxfUgekinKYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HW0kjTk7S1XcTs7NRi40/CfCeGyLeWvU9E+mylTkRsbp50xYJiaUEKxZ2RlA5fbyhHOMn+NHy03YicMvxdQwLYHs27OrZaecyjETWkqEOH8vSlf/NgDJ7ghyzGX9R/0ZAV5Z3KJAJY2a8cmSIU4femO5NiLG9FduD5WSL+7nIs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-506251815a3so69109041cf.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 23:52:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697174; x=1773301974;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=VAyaVg+AcxrwNZbYS7zvE+mz2LUFQBeqqZYCIp1udGAkMvBmP5BENa1DtPfQ17EbLa
         9dF+lUh8djJ/OrSJovtCOKgqn4CIAzdglTN9Cd9+yFrRjNWNJGeoEN4qF64wQpLW5HVM
         4tP02f9jaK0s/uRdUGixjz62FPwzHit0T9iE8mmLxuNlTqAlpnyB5OwFg5Plv1Z5XRgb
         J3p3Dh8hhKZ50Fsfd610kEP8jAxbQ1hxBzKzU26aSfT/uHZ2FDrjs1Ubcf5HMab8bLiC
         NT0PbeUkHx4sjQPFjwtBQzQBKYdPzHO6orJXH3jBYCdao5LOCjd/DPxFga9qtGL96AmC
         lxCg==
X-Forwarded-Encrypted: i=1; AJvYcCUcPG3wEmqvTWLiU1tU59cpxuOns1ea7rHjBmJGW2/5W5CpLejYKeEKfVAI8Des7Ku5/N4nNI3ZTmn2fw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+OKz9eVZ0YahrKceksdp1eZ/H9Zc7aZJONeadOkR6pHBOEjQT
	t3E63jYL21km3Kc9G9wfqde9W3gfDpXZ5DgAnUEUP8+LncfVUF0rV/NxyOqY84RJ
X-Gm-Gg: ATEYQzxfgEsn+BW3/5G+X87DAbRN9CZwMGRJXphPZm56b5OIOjqVub7bJJQ9KyRum/D
	PE82eSys+9vpLUg8786KG8x17ATfupxfIb+utl6qmNCju0QX3SCWtpoHAKAf3AbrFhdeS4XoT1P
	WeNNH3xYbpOwUlqxwq762NzuD1xBL6XyR/LvDGYsms4O3wnuPiKEwMdneJZvTVN4YksgOt4y7tJ
	dunGQWBPhtq2P/C6si8+L8AZ4M2ZqWqYndehZNeNGPOj9nzZ9JkcugYhg3p0rr5XqrkogA42syA
	UBHBilyptRT36zSoESfxChrmUyeY8UyHbJeJb3BC074+SYdoLGjpSHYrqX48JiZrf1nqD3+aGR4
	AW38h2OLAomZEjxyiqPrhf/t6cpzH7HI6iKXCfofpHsrkrlCpHyYMfKOspW3YSuaIt1+vcS0+0e
	mvTxzOpAVTwkvnCFOXrhZxntGgk8CE/Ij/er1cben/Gdfe/G0k1ZRPsHW3sCCPFmMX
X-Received: by 2002:ac8:5e13:0:b0:4f1:e0fc:343e with SMTP id d75a77b69052e-508db364e0amr57368551cf.37.1772697173772;
        Wed, 04 Mar 2026 23:52:53 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ad8f8bsm175368081cf.27.2026.03.04.23.52.53
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:52:53 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb3825b0fbso757138585a.0
        for <linux-media@vger.kernel.org>; Wed, 04 Mar 2026 23:52:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX+qTlVj23kK/RothYk7tyDTjBOEVQkK6OXgwCufEUGMNxeZotgISR/kM8HZX4esJtVu4Jyt4autbt8nw==@vger.kernel.org
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
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
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: D51BA20CF61
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,glider.be,gmail.com,sntech.de];
	TAGGED_FROM(0.00)[bounces-54569-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.969];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

