Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4FC34AC61
	for <lists+linux-media@lfdr.de>; Fri, 26 Mar 2021 17:14:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhCZQOS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Mar 2021 12:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCZQNr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Mar 2021 12:13:47 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A922C0613AA
        for <linux-media@vger.kernel.org>; Fri, 26 Mar 2021 09:13:46 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 103A01F46DF1
Message-ID: <b936ce4f516948ced41a1a0e0a2d0e33d7172f71.camel@collabora.com>
Subject: Re: [PATCH] rkvdec: Do not require all controls to be present in
 every request
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     daniel.almeida@collabora.com
Cc:     kernel@collabora.com, linux-media@vger.kernel.org,
        hverkuil-cisco@xs4all.nl, nicolas.dufresne@collabora.com
Date:   Fri, 26 Mar 2021 13:13:38 -0300
In-Reply-To: <20210323185709.199114-1-daniel.almeida@collabora.com>
References: <20210323185709.199114-1-daniel.almeida@collabora.com>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 2021-03-23 at 15:57 -0300, daniel.almeida@collabora.com wrote:
> From: Daniel Almeida <daniel.almeida@collabora.com>
> 
> According to the v4l2 api, it is allowed to skip
> setting a control if its contents haven't changed for performance
> reasons: userspace should only update the controls that changed from
> last frame rather then updating them all. Still some ancient code
> that checks for mandatory controls has been left in this driver.
> 
> Remove it.
> 
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 48 +--------------------------
>  drivers/staging/media/rkvdec/rkvdec.h |  1 -
>  2 files changed, 1 insertion(+), 48 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index d3eb81ee8dc2..5f0219d117fb 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -55,16 +55,13 @@ static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
>  
>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
>         {
> -               .mandatory = true,
>                 .cfg.id = V4L2_CID_STATELESS_H264_DECODE_PARAMS,
>         },
>         {
> -               .mandatory = true,
>                 .cfg.id = V4L2_CID_STATELESS_H264_SPS,
>                 .cfg.ops = &rkvdec_ctrl_ops,
>         },
>         {
> -               .mandatory = true,
>                 .cfg.id = V4L2_CID_STATELESS_H264_PPS,
>         },
>         {
> @@ -585,25 +582,7 @@ static const struct vb2_ops rkvdec_queue_ops = {
>  
>  static int rkvdec_request_validate(struct media_request *req)
>  {
> -       struct media_request_object *obj;
> -       const struct rkvdec_ctrls *ctrls;
> -       struct v4l2_ctrl_handler *hdl;
> -       struct rkvdec_ctx *ctx = NULL;
> -       unsigned int count, i;
> -       int ret;
> -
> -       list_for_each_entry(obj, &req->objects, list) {
> -               if (vb2_request_object_is_buffer(obj)) {
> -                       struct vb2_buffer *vb;
> -
> -                       vb = container_of(obj, struct vb2_buffer, req_obj);
> -                       ctx = vb2_get_drv_priv(vb->vb2_queue);
> -                       break;
> -               }
> -       }
> -
> -       if (!ctx)
> -               return -EINVAL;
> +       unsigned int count;
>  
>         count = vb2_request_buffer_cnt(req);
>         if (!count)
> @@ -611,31 +590,6 @@ static int rkvdec_request_validate(struct media_request *req)
>         else if (count > 1)
>                 return -EINVAL;
>  
> -       hdl = v4l2_ctrl_request_hdl_find(req, &ctx->ctrl_hdl);
> -       if (!hdl)
> -               return -ENOENT;
> -
> -       ret = 0;
> -       ctrls = ctx->coded_fmt_desc->ctrls;
> -       for (i = 0; ctrls && i < ctrls->num_ctrls; i++) {
> -               u32 id = ctrls->ctrls[i].cfg.id;
> -               struct v4l2_ctrl *ctrl;
> -
> -               if (!ctrls->ctrls[i].mandatory)
> -                       continue;
> -
> -               ctrl = v4l2_ctrl_request_hdl_ctrl_find(hdl, id);
> -               if (!ctrl) {
> -                       ret = -ENOENT;
> -                       break;
> -               }
> -       }
> -
> -       v4l2_ctrl_request_hdl_put(hdl);
> -
> -       if (ret)
> -               return ret;
> -
>         return vb2_request_validate(req);
>  }
>  
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 77a137cca88e..52ac3874c5e5 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -25,7 +25,6 @@
>  struct rkvdec_ctx;
>  
>  struct rkvdec_ctrl_desc {
> -       u32 mandatory : 1;
>         struct v4l2_ctrl_config cfg;
>  };
>  


