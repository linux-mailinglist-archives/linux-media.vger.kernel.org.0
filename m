Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F1B98A678
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 20:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726562AbfHLSpw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 14:45:52 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59664 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfHLSpw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 14:45:52 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 8578028A489
Message-ID: <35a308cc5b499e5bbec8017b5b641a5f88c40be9.camel@collabora.com>
Subject: Re: [PATCH v4 00/11] media: hantro: Add support for H264 decoding
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org
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
Date:   Mon, 12 Aug 2019 15:45:42 -0300
In-Reply-To: <1565606519.5017.5.camel@pengutronix.de>
References: <20190808103432.12062-1-ezequiel@collabora.com>
         <1565606519.5017.5.camel@pengutronix.de>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-08-12 at 12:41 +0200, Philipp Zabel wrote:
> Hi Ezequiel,
> 
> On Thu, 2019-08-08 at 07:34 -0300, Ezequiel Garcia wrote:
> > This series is consolidating the two recent H264 series submitted
> > by Boris [1] [2]. Given some patches from [2]  have been merged (namely,
> > helpers for the Hantro driver), the series contains the remanining
> > bits required to support H264 on Hantro G1 VPU.
> > 
> > * Patch 1 adds support for the sort_r() variant and has
> >   been posted separately by Rasmus. It would be good to merge this patch
> >   via the media tree, ideally as soon as possible, to avoid the
> >   synchronisation burden that might appear if we decide to delay it.
> > 
> > * Patch 2 to 4 extends the H264 uAPI, introducing frame-based vs slice-based
> >   decoding granularity, and also support for different NALU start codes.
> >   Currently, Annex B and no start codes are the supported options.
> > 
> >   With the introduction of the start code control, the H264 parsed
> >   slices pixel format should be renamed, dropping the _RAW suffix,
> >   which is now meaningless.
> > 
> > * Patch 5 removes the P0/B0/B1 ref lists from the decode_params control.
> >   These lists are no longer needed since we build them on the
> >   kernel side based on the DPB.
> > 
> > * Patch 6 and 7 exposes the proper decoding mode and start code
> >   on the cedrus driver. The driver functionality is not changed,
> >   and only the Cedrus support is now being properly exposed to
> >   userspace.
> > 
> > * Patch 8 is needed to properly propagate the OUTPUT buffer timestamp to
> >   the CAPTURE buffer one, which is required for intra-frame references.
> > 
> > * Patches 9 to 11 adds H264 support for Hantro G1 and then enable
> >   H264 decoding on RK3288.
> > 
> > This series has been tested using MPV/Ffmpeg, on Rockchip RK3288
> > for Hantro and Allwinner H3 boards for Cedrus.
> 
> Tested-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> on i.MX8MQ EVK using [1], so I effectively patches 1-5 and 8-10, with
> your FFmpeg modifications [2].
> 
> [1] git://git.pengutronix.de/git/pza/linux.git hantro/imx8m-wip
> [2] https://gitlab.collabora.com/ezequiel/ffmpeg stateless-mpeg2-vp8-
> h264-v4
> 

Glad to hear things work properly. I'm adding your tested-by to all
patches except those that apply to cedrus and rk3288.

Thank you very much for the test,
Ezequiel

