Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8F58153913
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2020 20:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbgBET0V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 5 Feb 2020 14:26:21 -0500
Received: from mail.kernel.org ([198.145.29.99]:40992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727305AbgBET0U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 5 Feb 2020 14:26:20 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A1F620720;
        Wed,  5 Feb 2020 19:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580930780;
        bh=Q/HJu0QBkh8ZWySfNb9GoTSbLQOccyPvNK9xMTiJyak=;
        h=In-Reply-To:References:Cc:From:Subject:To:Date:From;
        b=QlazzWd8qp1w8WSYWK1t6NyzdBB9lZzZ0GIkk7D25a+IIexjODahAz733h/vCpx9X
         C5XtkneSZu90gUlCBPGC0j3iazQ1BSNL2GMnWggJs4JdLW6oByzNhxmXwDH8KJ/Fbb
         HrP4CPIn9uvWn11nI9Bx5C9B+Mhd/0KGGUKpuTqg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
References: <1580235801-4129-1-git-send-email-skomatineni@nvidia.com> <1580235801-4129-5-git-send-email-skomatineni@nvidia.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [RFC PATCH v1 4/5] media: tegra: Add Tegra Video input driver for Tegra210
To:     frankc@nvidia.com, hverkuil@xs4all.nl, jonathanh@nvidia.com,
        skomatineni@nvidia.com, thierry.reding@gmail.com
User-Agent: alot/0.8.1
Date:   Wed, 05 Feb 2020 11:26:19 -0800
Message-Id: <20200205192620.3A1F620720@mail.kernel.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Sowjanya Komatineni (2020-01-28 10:23:20)
> diff --git a/drivers/staging/media/tegra/Kconfig b/drivers/staging/media/=
tegra/Kconfig
> new file mode 100644
> index 000000000000..443b99f2e2c9
> --- /dev/null
> +++ b/drivers/staging/media/tegra/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +config VIDEO_TEGRA
> +       tristate "NVIDIA Tegra VI driver"
> +       depends on ARCH_TEGRA || (ARM && COMPILE_TEST)
> +       depends on COMMON_CLK

What depends on the common clk framework? I don't see any clk-provider.h
includes here.

> +       depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
> +       depends on MEDIA_CONTROLLER
> +       select TEGRA_HOST1X
> +       select VIDEOBUF2_DMA_CONTIG
> +       select V4L2_FWNODE
> +       help
> +         Say yes here to enable support for Tegra video input hardware
