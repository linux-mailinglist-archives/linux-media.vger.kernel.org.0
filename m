Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00F81391490
	for <lists+linux-media@lfdr.de>; Wed, 26 May 2021 12:12:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233813AbhEZKNr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 May 2021 06:13:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59462 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbhEZKNn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 May 2021 06:13:43 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 2B35B1F40AFD
Message-ID: <06d5432c44d3b4d6129891c46cc62f0edf735cf7.camel@collabora.com>
Subject: Re: [PATCH v11 8/9] media: hantro: Introduce G2/HEVC decoder
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        p.zabel@pengutronix.de, mchehab@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Adrian Ratiu <adrian.ratiu@collabora.com>
Date:   Wed, 26 May 2021 07:12:00 -0300
In-Reply-To: <20210525161238.1191168-9-benjamin.gaignard@collabora.com>
References: <20210525161238.1191168-1-benjamin.gaignard@collabora.com>
         <20210525161238.1191168-9-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

(Adding Andrzej)

On Tue, 2021-05-25 at 18:12 +0200, Benjamin Gaignard wrote:
> Implement all the logic to get G2 hardware decoding HEVC frames.
> It supports up level 5.1 HEVC stream.
> It doesn't support yet 10 bits formats or the scaling feature.
> 
> Add HANTRO HEVC dedicated control to skip some bits at the beginning
> of the slice header. That is very specific to this hardware so can't
> go into uapi structures. Computing the needed value is complex and requires
> information from the stream that only the userland knows so let it
> provide the correct value to the driver.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Co-developed-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
> Co-developed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
[..]
> diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
> new file mode 100644
> index 000000000000..2477573f7163
> --- /dev/null
> +++ b/drivers/staging/media/hantro/hantro_g2_regs.h
> @@ -0,0 +1,198 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2021, Collabora
> + *
> + * Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> + */
> +
> +#ifndef HANTRO_G2_REGS_H_
> +#define HANTRO_G2_REGS_H_
> +
> +#include "hantro.h"
> +
> +#define G2_SWREG(nr)   ((nr) * 4)
> +
> +#define HEVC_DEC_REG(name, base, shift, mask) \
> +       static const struct hantro_reg _hevc_##name[] = { \
> +               { G2_SWREG(base), (shift), (mask) } \
> +       }; \
> +       static const struct hantro_reg __maybe_unused *hevc_##name = &_hevc_##name[0];
> +
> +#define HEVC_REG_VERSION               G2_SWREG(0)
> +
> +#define HEVC_REG_INTERRUPT             G2_SWREG(1)

These definitions seem valid across G2 and not
something specific to HEVC, so can we rename (the ones
that make sense) to G2_ ?

That would allow to reuse them for VP9 with a smaller gap.

Thanks,
Ezequiel

