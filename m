Return-Path: <linux-media+bounces-26512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E21A3E1D1
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 18:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DDB3189E62E
	for <lists+linux-media@lfdr.de>; Thu, 20 Feb 2025 17:04:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D92D3212B02;
	Thu, 20 Feb 2025 17:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="ldT8My51"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596FE21128F
	for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 17:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740071085; cv=none; b=K0+IMeHA9DihKQeVNfkQroh0AAe2p9oNxHDvLpAtW2PfKRkAG10Lwi/a5tr1TdIISblq9oFe+h7PJ9FI56a9JoS6YsjN3dhxol4k9K37EqOVRqDwmwnFek/GHWex2BkgDZKqBkIV5qpwbagPbU9ylNIufc0FqzdBKJ4i8FbzV0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740071085; c=relaxed/simple;
	bh=qZet+cJihvLL+ixvLo4rVjNEsBOPcayx8Jv+KahwWQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QAe7VeB63dF1mErKsY+H1SQK5JemKLklpHtPcR9Pz+W1Ibj3spJXkVKs2EHNB/T5CQ+HriNMMlR5HTlAovgNYzZ5TIutAau3t9vzPSuu4gG6VsULCGtMCeWsAIVflaYKRcEQ4GlgUOSAKBAmjM/tVk1WA8SvXnjA5ClesoDkoXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=ldT8My51; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e5dab3f37b1so998282276.0
        for <linux-media@vger.kernel.org>; Thu, 20 Feb 2025 09:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1740071082; x=1740675882; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=quvEPAElao5t0XQzQzHhr1bv0DfugHzaXGtQgJGrkc8=;
        b=ldT8My51rGUgCU33PJp4hgowrTxRbyd5NZ7tw5CxQYcO8GSXMITPFrgFARIC4pUCO5
         l1EumSw/jP9//i+x3Bp0Tv28Y/VZp2fZWhKqyQS40F7AU+4KunZDnKgeZvBT4maphM00
         kOBDYmnfH/J/E0pzv62E5bDK0/Sxta43DomfzvCDx1mcAf8Osk/o8iELH2+8I8AzY4MS
         QpPyQCxawBIJOcaynC6nqXzvMuRS3OdIDXrV15+89vQ1V9gIIun12jx3T/aXGU/EgIUo
         Uh78NaqAImHNMdBScPbkvevL0qDSD/XYG7VHC6Lne2IRW1r1pAUkZ9JDaOxrC4YO4rX6
         jJYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740071082; x=1740675882;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=quvEPAElao5t0XQzQzHhr1bv0DfugHzaXGtQgJGrkc8=;
        b=r7MQscoYGd+KLB+cOXtM3XixYQq+vY0wZJAB5vD1uu7/aTy1d+HxIQAh3C+/3SfZcs
         ExHmWBDmwhY214VsQdUEsC7RAcQySm4vDsWej4kgqqNUo2H1wMnJUOeC6rJ7W4ikjSDT
         Xkf3fzwKaDP7sVxIOKVA5Q+jqq2/+m7gYbbyv9W+ZnVyONcz9eYZL+vzds/AlnLOmBdq
         1WQuiOnDdQxvUoJIdsgM52oFlUflD2eLgw7CGxX4+rm83+nNRIX4g8PlRs9LHRYmjDbq
         e3XutVcw/8xj2LVD1EnQo1gWbDbPtrjQGP/QjADzZwcxIgmTuZkUOg4sA4FUVAfezl5m
         P3Sg==
X-Gm-Message-State: AOJu0Yw8ptnldRgwbsfmGaGhNSS9zgjB79V9ujhf0Q9zWa7xcj0UmxJG
	Bt07wGGNLGxBbSxZfBI0gyqw6rNcnQJ+Z/Od2e87xh5Wm+sWzutJyUj1ZKC19AF1r1296DnS79V
	WsJF951WejvSfD/dcBmXBYxdkv48AMDDsDMrSpQ==
X-Gm-Gg: ASbGncsKVw/cQgyDMR633LsW5N5QosUNQwy5B/K/A4/sJCQ50kxeuC+EmyRzsrUS0b4
	VFA8iWdWwGopf9uW70BLpnxi9UqFJAQMtuKgTuj3OYrOi/tFyXEmxQYG3CUwQfypcQ2UyfjZNeI
	E3+/sm8RJp2wS8+g59dtyiy2foLb1S
X-Google-Smtp-Source: AGHT+IG/czsQFNWifM0603xHlcTroe8bOHJ38ny3uBOaXue5mZIC/SYJdJda/nHzTwypNG8NSfrF9qHo3DfsJwK5Oaw=
X-Received: by 2002:a05:6902:1208:b0:e57:4db7:6d51 with SMTP id
 3f1490d57ef6-e5dc92fd402mr16690854276.32.1740071082274; Thu, 20 Feb 2025
 09:04:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250219094637.607615-1-eagle.alexander923@gmail.com> <20250219094637.607615-4-eagle.alexander923@gmail.com>
In-Reply-To: <20250219094637.607615-4-eagle.alexander923@gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 20 Feb 2025 17:04:25 +0000
X-Gm-Features: AWEUYZk2zjmITy1NKsjfpV_gkkaMabWjT-EgQt-EsIyPjXTbI3Nkid7UKua0TyY
Message-ID: <CAPY8ntAyJnUgt33Zgxwcw29gtADy2gCHks_x3f3z1kLMrmyGGQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] media: i2c: imx415: Add missing 4-lane CSI configurations
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: linux-media@vger.kernel.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Alexander

On Wed, 19 Feb 2025 at 09:48, Alexander Shiyan
<eagle.alexander923@gmail.com> wrote:
>
> Not all CSI configurations are suitable for both 2-lane and 4-lane mode.
> To solve this, let's use a zero value in the hmax_min[] field of the
> supported_modes[] structure to indicate which CSI configuration can not
> be used for 2-lane or 4-lane mode.
> Now that we have done that, let's add the remaining CSI configurations
> that can be used for 4-lane mode.
>
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>
> ---
>  drivers/media/i2c/imx415.c | 46 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 46 insertions(+)
>
> diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
> index 83b7929455b2..5f18d3f38ded 100644
> --- a/drivers/media/i2c/imx415.c
> +++ b/drivers/media/i2c/imx415.c
> @@ -505,6 +505,19 @@ static const struct cci_reg_sequence imx415_linkrate_1440mbps[] = {
>         { IMX415_TLPX, 0x004F },
>  };
>
> +/* 1485 Mbps CSI configuration */
> +static const struct cci_reg_sequence imx415_linkrate_1485mbps[] = {
> +       { IMX415_TCLKPOST, 0x00A7 },
> +       { IMX415_TCLKPREPARE, 0x0057 },
> +       { IMX415_TCLKTRAIL, 0x005F },
> +       { IMX415_TCLKZERO, 0x0197 },
> +       { IMX415_THSPREPARE, 0x005F },
> +       { IMX415_THSZERO, 0x00AF },
> +       { IMX415_THSTRAIL, 0x005F },
> +       { IMX415_THSEXIT, 0x009F },
> +       { IMX415_TLPX, 0x004F },
> +};
> +
>  /* 1782 Mbps CSI configuration */
>  static const struct cci_reg_sequence imx415_linkrate_1782mbps[] = {
>         { IMX415_TCLKPOST, 0x00B7 },
> @@ -531,6 +544,19 @@ static const struct cci_reg_sequence imx415_linkrate_2079mbps[] = {
>         { IMX415_TLPX, 0x006F },
>  };
>
> +/* 2376 Mbps CSI configuration */
> +static const struct cci_reg_sequence imx415_linkrate_2376mbps[] = {
> +       { IMX415_TCLKPOST, 0x00E7 },
> +       { IMX415_TCLKPREPARE, 0x008F },
> +       { IMX415_TCLKTRAIL, 0x008F },
> +       { IMX415_TCLKZERO, 0x027F },
> +       { IMX415_THSPREPARE, 0x0097 },
> +       { IMX415_THSZERO, 0x010F },
> +       { IMX415_THSTRAIL, 0x0097 },
> +       { IMX415_THSEXIT, 0x00F7 },
> +       { IMX415_TLPX, 0x007F },
> +};
> +
>  struct imx415_mode_reg_list {
>         u32 num_of_regs;
>         const struct cci_reg_sequence *regs;
> @@ -576,6 +602,14 @@ static const struct imx415_mode supported_modes[] = {
>                         .regs = imx415_linkrate_1440mbps,
>                 },
>         },
> +       {
> +               .lane_rate = 1485000000,
> +               .hmax_min = { 0, 550 },
> +               .reg_list = {
> +                       .num_of_regs = ARRAY_SIZE(imx415_linkrate_1485mbps),
> +                       .regs = imx415_linkrate_1485mbps,
> +               },
> +       },
>         {
>                 .lane_rate = 1782000000,
>                 .hmax_min = { 1100, 550 },
> @@ -592,6 +626,14 @@ static const struct imx415_mode supported_modes[] = {
>                         .regs = imx415_linkrate_2079mbps,
>                 },
>         },
> +       {
> +               .lane_rate = 2376000000,
> +               .hmax_min = { 0, 366 },
> +               .reg_list = {
> +                       .num_of_regs = ARRAY_SIZE(imx415_linkrate_2376mbps),
> +                       .regs = imx415_linkrate_2376mbps,
> +               },
> +       },
>  };
>
>  static const char *const imx415_test_pattern_menu[] = {
> @@ -1375,9 +1417,13 @@ static int imx415_parse_hw_config(struct imx415 *sensor)
>                 }
>
>                 for (j = 0; j < ARRAY_SIZE(supported_modes); ++j) {
> +                       int lanes_idx = sensor->num_data_lanes == 2 ? 0 : 1;
> +
>                         if (bus_cfg.link_frequencies[i] * 2 !=
>                             supported_modes[j].lane_rate)
>                                 continue;
> +                       if (!supported_modes[j].hmax_min[lanes_idx])
> +                               continue;

You could lose the local variable by checking
if (!supported_modes[j].hmax_min[0] && sensor->num_data_lanes == 2)

Either way:

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

I've checked the register settings against the datasheet, and they all
appear to match.

>                         sensor->cur_mode = j;
>                         break;
>                 }
> --
> 2.39.1
>
>

