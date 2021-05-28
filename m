Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09704393CB4
	for <lists+linux-media@lfdr.de>; Fri, 28 May 2021 07:28:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234910AbhE1F3d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 May 2021 01:29:33 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59766 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233253AbhE1F3d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 May 2021 01:29:33 -0400
Received: from [IPv6:2a00:a040:193:3500:ed56:60fb:a74f:177d] (unknown [IPv6:2a00:a040:193:3500:ed56:60fb:a74f:177d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 53FA91F43EF3;
        Fri, 28 May 2021 06:27:55 +0100 (BST)
Subject: Re: [PATCH v4,5/6] media: mtk-vcodec: Add MT8192 H264 venc driver
To:     Irui Wang <irui.wang@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        Longfei Wang <longfei.wang@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-6-irui.wang@mediatek.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <e95b8c85-4878-eec7-f568-5f16f7fcf955@collabora.com>
Date:   Fri, 28 May 2021 08:27:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210521070139.20644-6-irui.wang@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On 21.05.21 10:01, Irui Wang wrote:
> Add MT8192 venc driver's compatible and device private data.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>   drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h |  1 +
>   .../media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c | 14 ++++++++++++++
>   2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> index d03cca95e99b..14893d277bb8 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> @@ -302,6 +302,7 @@ struct mtk_vcodec_ctx {
>   enum mtk_chip {
>   	MTK_MT8173,
>   	MTK_MT8183,
> +	MTK_MT8192,
>   };
>   
>   /**
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> index 26b089e81213..78f3dd166917 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_drv.c
> @@ -425,12 +425,26 @@ static const struct mtk_vcodec_enc_pdata mt8183_pdata = {
>   	.core_id = VENC_SYS,
>   };
>   
> +static const struct mtk_vcodec_enc_pdata mt8192_pdata = {
> +	.chip = MTK_MT8192,
> +	.uses_ext = true,
> +	/* MT8192 supports the same capture formats as MT8183*/

missing space before '*/'

> +	.capture_formats = mtk_video_formats_capture_mt8183,
> +	.num_capture_formats = ARRAY_SIZE(mtk_video_formats_capture_mt8183),
> +	/* MT8192 supports the same output formats as MT8173 */
> +	.output_formats = mtk_video_formats_output_mt8173,
> +	.num_output_formats = ARRAY_SIZE(mtk_video_formats_output_mt8173),

If all three models mt8173, mt8183 and mt8192 support the same formats then
we should probably not name the structs according to one of the models, so maybe:

s/mtk_video_formats_capture_mt8183/mtk_video_formats_capture/
s/mtk_video_formats_output_mt8173/mtk_video_formats_output/

or some other naming

Thanks,
Dafna


> +	.min_bitrate = 64,
> +	.max_bitrate = 100000000,
> +	.core_id = VENC_SYS,
> +};
>   static const struct of_device_id mtk_vcodec_enc_match[] = {
>   	{.compatible = "mediatek,mt8173-vcodec-enc",
>   			.data = &mt8173_avc_pdata},
>   	{.compatible = "mediatek,mt8173-vcodec-enc-vp8",
>   			.data = &mt8173_vp8_pdata},
>   	{.compatible = "mediatek,mt8183-vcodec-enc", .data = &mt8183_pdata},
> +	{.compatible = "mediatek,mt8192-vcodec-enc", .data = &mt8192_pdata},
>   	{},
>   };
>   MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);
> 
