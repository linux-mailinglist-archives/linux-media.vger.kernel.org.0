Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FFFB14DE99
	for <lists+linux-media@lfdr.de>; Thu, 30 Jan 2020 17:13:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727330AbgA3QMz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Jan 2020 11:12:55 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44692 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727158AbgA3QMz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Jan 2020 11:12:55 -0500
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbrezillon)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BD536294F23;
        Thu, 30 Jan 2020 16:12:52 +0000 (GMT)
Date:   Thu, 30 Jan 2020 17:12:49 +0100
From:   Boris Brezillon <boris.brezillon@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>, kernel@collabora.com,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Heiko Stuebner <heiko@sntech.de>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH v4 5/6] media: rkvdec: Add the rkvdec driver
Message-ID: <20200130171249.3ae0444a@collabora.com>
In-Reply-To: <20200129195501.8317-6-ezequiel@collabora.com>
References: <20200129195501.8317-1-ezequiel@collabora.com>
        <20200129195501.8317-6-ezequiel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 29 Jan 2020 16:55:00 -0300
Ezequiel Garcia <ezequiel@collabora.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> The rockchip vdec block is a stateless decoder that's able to decode
> H264, HEVC and VP9 content. This commit adds the core infrastructure
> and the H264 backend. Support for VP9 and HEVS will be added later on.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
> v4:
> * Make poc tables const, as suggested by Hans
> * Move buffer extra space calculation TRY_FMT, as done on Hantro.
> * Get rid of vb2_request_get_buf and open-code
>   following Cedrus. We can move it to a helper as a follow-up patch.

Well, we know what that means in practice :-).

> new file mode 100644
> index 000000000000..1293b3621364
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec/rkvdec-regs.h
> @@ -0,0 +1,239 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VPU codec driver
> + *
> + * Copyright (C) 2015 Rockchip Electronics Co., Ltd.
> + *	Jung Zhao <jung.zhao@rock-chips.com>
> + *	Alpha Lin <alpha.lin@rock-chips.com>
> + *
> + * This software is licensed under the terms of the GNU General Public
> + * License version 2, as published by the Free Software Foundation, and
> + * may be copied, distributed, and modified under those terms.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */

Oops, looks like I forgot to remove the license text here. Also not
entirely sure the copyrights are correct (might be a copy from the
hantro driver instead of the rkvdec one).


> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> new file mode 100644
> index 000000000000..529ef86510d3
> --- /dev/null
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Hantro VPU codec driver
> + *
> + * Copyright 2018 Google LLC.
> + *	Tomasz Figa <tfiga@chromium.org>
> + *
> + * Based on s5p-mfc driver by Samsung Electronics Co., Ltd.
> + * Copyright (C) 2011 Samsung Electronics Co., Ltd.
> + */

This header has been copied from the hantro driver, so it's most likely
wrong.
