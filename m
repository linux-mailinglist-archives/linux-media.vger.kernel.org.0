Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99FD03B4BC4
	for <lists+linux-media@lfdr.de>; Sat, 26 Jun 2021 03:08:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbhFZBLS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Jun 2021 21:11:18 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:36416 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbhFZBLR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Jun 2021 21:11:17 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 3C3BC1F428C5
Message-ID: <a3144cc37a11e43d984c71aa160079cab65cc335.camel@collabora.com>
Subject: Re: [PATCH 2/2] media: rkisp1: cap: initialize dma buf address in
 'buf_init' cb
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, helen.koike@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Date:   Fri, 25 Jun 2021 22:08:44 -0300
In-Reply-To: <20210625082309.24944-3-dafna.hirschfeld@collabora.com>
References: <20210625082309.24944-1-dafna.hirschfeld@collabora.com>
         <20210625082309.24944-3-dafna.hirschfeld@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Fri, 2021-06-25 at 11:23 +0300, Dafna Hirschfeld wrote:
> Initializing the dma addresses of the capture buffers can
> move to the 'buf_init' callback, since it is enough to do
> it once for each buffer and not every time it is queued.
> 

Are you able to measure any impact with this change?

> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-capture.c  | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index 60cd2200e7ae..41988eb0ec0a 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -750,7 +750,7 @@ static int rkisp1_vb2_queue_setup(struct vb2_queue *queue,
>         return 0;
>  }
>  
> -static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
> +static int rkisp1_vb2_buf_init(struct vb2_buffer *vb)
>  {
>         struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>         struct rkisp1_buffer *ispbuf =

Since you are interested at these kind of cleanups, you can
do something like:

+enum rkisp1_plane {
+       RKISP1_PLANE_Y  = 0,
+       RKISP1_PLANE_CB = 1,
+       RKISP1_PLANE_CR = 2,
+       RKISP1_NUM_PLANES = 3
+};
+
 /*
  * struct rkisp1_buffer - A container for the vb2 buffers used by the video devices:
  *                       params, stats, mainpath, selfpath
@@ -160,7 +167,7 @@ struct rkisp1_vdev_node {
 struct rkisp1_buffer {
        struct vb2_v4l2_buffer vb;
        struct list_head queue;
-       u32 buff_addr[VIDEO_MAX_PLANES];
+       u32 buff_addr[RKISP1_NUM_PLANES];
 };

And then you can get rid of the memset, and rely on
vb2_dma_contig_plane_dma_addr returning NULL.

@@ -759,8 +753,7 @@ static void rkisp1_vb2_buf_queue(struct vb2_buffer *vb)
        const struct v4l2_pix_format_mplane *pixm = &cap->pix.fmt;
        unsigned int i;
 
-       memset(ispbuf->buff_addr, 0, sizeof(ispbuf->buff_addr));
-       for (i = 0; i < pixm->num_planes; i++)
+       for (i = 0; i < RKISP1_NUM_PLANES; i++)
                ispbuf->buff_addr[i] = vb2_dma_contig_plane_dma_addr(vb, i);

-- 
Kindly,
Ezequiel

