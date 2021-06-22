Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 754643B05CB
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 15:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhFVN3X (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 09:29:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFVN3W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 09:29:22 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A51EC061574;
        Tue, 22 Jun 2021 06:27:07 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 5C6A71F42FC1
Message-ID: <3849b99e6d139b02c670c9e8d1ec306b24f6f821.camel@collabora.com>
Subject: Re: [PATCH v3 5/8] media: hantro: hevc: Allow to produce 10-bit
 frames
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        hverkuil@xs4all.nl, p.zabel@pengutronix.de, mchehab@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
        gregkh@linuxfoundation.org, mripard@kernel.org,
        paul.kocialkowski@bootlin.com, wens@csie.org,
        jernej.skrabec@siol.net, emil.l.velikov@gmail.com,
        andrzej.p@collabora.com, jc@kynesim.co.uk,
        jernej.skrabec@gmail.com, nicolas@ndufresne.ca
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date:   Tue, 22 Jun 2021 10:26:42 -0300
In-Reply-To: <20210618131526.566762-6-benjamin.gaignard@collabora.com>
References: <20210618131526.566762-1-benjamin.gaignard@collabora.com>
         <20210618131526.566762-6-benjamin.gaignard@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Benjamin,

On Fri, 2021-06-18 at 15:15 +0200, Benjamin Gaignard wrote:
> If Hantro driver receive an 10-bit encoded bitstream allow it
> to produce 10-bit frames.
> Check that we are not try to produce 10-bit frames from a 8-bit
> encoded bitstream.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_drv.c      | 18 ++++++++++++++++++
>  .../staging/media/hantro/hantro_g2_hevc_dec.c  | 18 ++++++++++++++----
>  drivers/staging/media/hantro/hantro_hevc.c     |  2 +-
>  drivers/staging/media/hantro/imx8m_vpu_hw.c    |  4 ++++
>  4 files changed, 37 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_drv.c b/drivers/staging/media/hantro/hantro_drv.c
> index f6635ceb5111..b6373934734e 100644
> --- a/drivers/staging/media/hantro/hantro_drv.c
> +++ b/drivers/staging/media/hantro/hantro_drv.c
> @@ -243,6 +243,16 @@ queue_init(void *priv, struct vb2_queue *src_vq, struct vb2_queue *dst_vq)
>         return vb2_queue_init(dst_vq);
>  }
>  
> +static bool hantro_is_10bit_dst_format(struct hantro_ctx *ctx)
> +{
> +       switch (ctx->vpu_dst_fmt->fourcc) {
> +       case V4L2_PIX_FMT_P010:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}
> +
>  static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
>         if (ctrl->id == V4L2_CID_STATELESS_H264_SPS) {
> @@ -259,6 +269,10 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>                         return -EINVAL;
>         } else if (ctrl->id == V4L2_CID_MPEG_VIDEO_HEVC_SPS) {
>                 const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
> +               struct hantro_ctx *ctx;
> +
> +               ctx = container_of(ctrl->handler,
> +                                  struct hantro_ctx, ctrl_handler);
>  
>                 if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
>                         /* Luma and chroma bit depth mismatch */
> @@ -270,6 +284,10 @@ static int hantro_try_ctrl(struct v4l2_ctrl *ctrl)
>                 if (sps->flags & V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED)
>                         /* No scaling support */
>                         return -EINVAL;
> +               if (sps->bit_depth_luma_minus8 == 0 &&
> +                   hantro_is_10bit_dst_format(ctx)) {
> +                       return -EINVAL;

I had some more time to think about this,
and I recalled that this topic was already discussed
some time ago [1].

This approach won't work. You need to restrict the pixel
formats returned by TRY/G_FMT after the SPS is set with S_EXT_CTRL,
as per the specification.

https://www.spinics.net/lists/kernel/msg3576779.html

Thanks,
Ezequiel

