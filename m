Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7641F92721
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2019 16:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbfHSOjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Aug 2019 10:39:04 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:53788 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbfHSOjE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Aug 2019 10:39:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 92748283C05
Message-ID: <a0b1f5806a0a5e5a58f1702485e36ec669c32f81.camel@collabora.com>
Subject: Re: [PATCH v7 02/11] media: uapi: h264: Rename pixel format
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     linux-media@vger.kernel.org, kernel@collabora.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>,
        Jonas Karlman <jonas@kwiboo.se>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        fbuergisser@chromium.org, linux-kernel@vger.kernel.org
Date:   Mon, 19 Aug 2019 11:38:51 -0300
In-Reply-To: <20190819124110.GB32182@aptenodytes>
References: <20190816160132.7352-1-ezequiel@collabora.com>
         <20190816160132.7352-3-ezequiel@collabora.com>
         <20190819124110.GB32182@aptenodytes>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-08-19 at 14:41 +0200, Paul Kocialkowski wrote:
> Hi,
> 
> On Fri 16 Aug 19, 13:01, Ezequiel Garcia wrote:
> > The V4L2_PIX_FMT_H264_SLICE_RAW name was originally suggested
> > because the pixel format would represent H264 slices without any
> > start code.
> > 
> > However, as we will now introduce a start code menu control,
> > give the pixel format a more meaningful name, while it's
> > still early enough to do so.
> 
> I definitely agree that SLICE_RAW is not the suffix we are looking for, but I'm
> not sure that _SLICE is self-describing given that we can operate either
> per-frame or per-slice, and _SLICE sort of implies the latter.

This is not entirely so, per-frame or per-slice mode refer to the granularity
of the stateless API, the pixel format is still composed of H264 NALU slices.

As per the documentation, the decode_mode and the start_code are modifiers
of the pixel format. As long as this is properly speced, the
V4L2_PIX_FMT_H264_SLICE looks pretty OK to me.

>  Also, VP8 uses
> _FRAME to clearly indicate that it operates per-frame.
> 

This is because VP8 doesn't have any concept of slices, the encoded unit
is a video frame.

> In addition, the _SLICE suffix is used by MPEG-2 in the stable API. Since we
> certainly want MPEG-2 to allow per-slice and per-frame decoding as well as
> H.264 and that the _SLICE format is specified to be the broken "concatenated
> slices" that cedrus expects, we probably want to use another suffix. This way,
> we could deprecated MPEG2_SLICE and introduce a new format for MPEG-2 that would
> have consistent naming with the other mpeg formats.
> 
> One suggestion I had was to call it H264_PARSED (and apply this to MPEG-2 and
> HEVC when similar controls to H.264 are set in place for them). I think Hans had
> another suggestion for the name but I don't recall what it was at this point.
> 
> Either way, if this has to be some debate, we could perhaps take it off your
> series and stay with SLICE_RAW for now, as long as we do rename it before making
> the API stable.
> 
> What do you think?
> 

With the new pixel format modifiers (decode_mode and start_code), the _RAW suffix
now has no meaning. Now, we could name it _PARSED or _SLICE. As long as this is
properly documented (as it is now), that'd be fine.

Now, to be completely honest, this discussion sounds like
bikeshedding to me.

Thanks,
Eze

