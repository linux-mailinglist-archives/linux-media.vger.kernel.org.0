Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EC7B4589AC
	for <lists+linux-media@lfdr.de>; Mon, 22 Nov 2021 08:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238073AbhKVHOX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Nov 2021 02:14:23 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59648 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhKVHOU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Nov 2021 02:14:20 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 7DE871F445DF
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637565072; bh=fj0upe47ki7p3rwgkuOlhq1xjjDXM7SwrTixcO7uR2w=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=WkQAX4s6nppi755Nf6cRc2IByLZPXwFyt2J4LDfjvrUOQAiycE2SN1/jcomCn5IE4
         bJJyyCDANK2Z5WwcrLkjNzmqLhZ4VytLYKOVC2qU/5mzXD33/3KLp7R7jnld5ONolt
         TF7QUSKxaWIyeqhdnn5ltfVWqYpLpJS995g3o0sUqNEi3GZsafEomP70gG4C0IrA+4
         GAj4701tvXvG2e+H/UbcTwT3hSK9qLM6OpU9h02ECXeidmJi5GrBm2Wikrb8srqmLH
         5IQD6AwTXVnhY9p5iBWdTIIfJGcBCHrX9JqBfXoV7Cxe6ZhSvMQM0XV6S1IgJ6md3i
         TrrpXH0r1TI4A==
Subject: Re: [PATCH v3] media: mtk-vcodec: Align width and height to 64 bytes
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Steve Cho <stevecho@google.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>
Cc:     Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Steve Cho <stevecho@chromium.org>
References: <20211104122426.9597-1-yunfei.dong@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <725024c7-b605-2de6-0a9e-e3e044ae5b3f@collabora.com>
Date:   Mon, 22 Nov 2021 09:11:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211104122426.9597-1-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 04.11.21 14:24, Yunfei Dong wrote:
> Width and height need to 64 bytes aligned when setting the format.
> Need to make sure all is 64 bytes align when use width and height to
> calculate buffer size.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Tested-by: Steve Cho <stevecho@chromium.org>
> ---
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h        | 1 +
>   drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c | 4 ++--
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> index e30806c1faea..66cd6d2242c3 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
> @@ -11,6 +11,7 @@
>   #include <media/videobuf2-core.h>
>   #include <media/v4l2-mem2mem.h>
>   
> +#define VCODEC_DEC_ALIGNED_64 64

This define is a bit useless, it doesn't improve readability,
if you do ALIGN(x, 64) it is already clear enough.

Thank,
Dafna

>   #define VCODEC_CAPABILITY_4K_DISABLED	0x10
>   #define VCODEC_DEC_4K_CODED_WIDTH	4096U
>   #define VCODEC_DEC_4K_CODED_HEIGHT	2304U
> diff --git a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> index d402fc4bda69..e1a3011772a9 100644
> --- a/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> +++ b/drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c
> @@ -562,8 +562,8 @@ static void get_pic_info(struct vdec_h264_slice_inst *inst,
>   {
>   	struct mtk_vcodec_ctx *ctx = inst->ctx;
>   
> -	ctx->picinfo.buf_w = (ctx->picinfo.pic_w + 15) & 0xFFFFFFF0;
> -	ctx->picinfo.buf_h = (ctx->picinfo.pic_h + 31) & 0xFFFFFFE0;
> +	ctx->picinfo.buf_w = ALIGN(ctx->picinfo.pic_w, VCODEC_DEC_ALIGNED_64);
> +	ctx->picinfo.buf_h = ALIGN(ctx->picinfo.pic_h, VCODEC_DEC_ALIGNED_64);
>   	ctx->picinfo.fb_sz[0] = ctx->picinfo.buf_w * ctx->picinfo.buf_h;
>   	ctx->picinfo.fb_sz[1] = ctx->picinfo.fb_sz[0] >> 1;
>   	inst->vsi_ctx.dec.cap_num_planes =
> 
