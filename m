Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD81E89BBD
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 12:42:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbfHLKmD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 06:42:03 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60607 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727678AbfHLKmC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 06:42:02 -0400
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
        by metis.ext.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <p.zabel@pengutronix.de>)
        id 1hx7m5-0000ZP-60; Mon, 12 Aug 2019 12:42:01 +0200
Message-ID: <1565606519.5017.5.camel@pengutronix.de>
Subject: Re: [PATCH v4 00/11] media: hantro: Add support for H264 decoding
From:   Philipp Zabel <p.zabel@pengutronix.de>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org
Cc:     kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Date:   Mon, 12 Aug 2019 12:41:59 +0200
In-Reply-To: <20190808103432.12062-1-ezequiel@collabora.com>
References: <20190808103432.12062-1-ezequiel@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

On Thu, 2019-08-08 at 07:34 -0300, Ezequiel Garcia wrote:
> This series is consolidating the two recent H264 series submitted
> by Boris [1] [2]. Given some patches from [2]  have been merged (namely,
> helpers for the Hantro driver), the series contains the remanining
> bits required to support H264 on Hantro G1 VPU.
> 
> * Patch 1 adds support for the sort_r() variant and has
>   been posted separately by Rasmus. It would be good to merge this patch
>   via the media tree, ideally as soon as possible, to avoid the
>   synchronisation burden that might appear if we decide to delay it.
> 
> * Patch 2 to 4 extends the H264 uAPI, introducing frame-based vs slice-based
>   decoding granularity, and also support for different NALU start codes.
>   Currently, Annex B and no start codes are the supported options.
> 
>   With the introduction of the start code control, the H264 parsed
>   slices pixel format should be renamed, dropping the _RAW suffix,
>   which is now meaningless.
> 
> * Patch 5 removes the P0/B0/B1 ref lists from the decode_params control.
>   These lists are no longer needed since we build them on the
>   kernel side based on the DPB.
> 
> * Patch 6 and 7 exposes the proper decoding mode and start code
>   on the cedrus driver. The driver functionality is not changed,
>   and only the Cedrus support is now being properly exposed to
>   userspace.
> 
> * Patch 8 is needed to properly propagate the OUTPUT buffer timestamp to
>   the CAPTURE buffer one, which is required for intra-frame references.
> 
> * Patches 9 to 11 adds H264 support for Hantro G1 and then enable
>   H264 decoding on RK3288.
> 
> This series has been tested using MPV/Ffmpeg, on Rockchip RK3288
> for Hantro and Allwinner H3 boards for Cedrus.

Tested-by: Philipp Zabel <p.zabel@pengutronix.de>

on i.MX8MQ EVK using [1], so I effectively patches 1-5 and 8-10, with
your FFmpeg modifications [2].

[1] git://git.pengutronix.de/git/pza/linux.git hantro/imx8m-wip
[2] https://gitlab.collabora.com/ezequiel/ffmpeg stateless-mpeg2-vp8-
h264-v4

regards
Philipp
