Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 71F0A554842
	for <lists+linux-media@lfdr.de>; Wed, 22 Jun 2022 14:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbiFVJfV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jun 2022 05:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232954AbiFVJfU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jun 2022 05:35:20 -0400
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A503526C
        for <linux-media@vger.kernel.org>; Wed, 22 Jun 2022 02:35:18 -0700 (PDT)
X-UUID: 17ae810dd06542f2aa0b3891c145c1ff-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:7bd3c583-fb50-48f4-998a-31200afae44d,OB:0,LO
        B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
        ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:21262b38-5e4b-44d7-80b2-bb618cb09d29,C
        OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
        ,QS:nil,BEC:nil,COL:0
X-UUID: 17ae810dd06542f2aa0b3891c145c1ff-20220622
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 910829544; Wed, 22 Jun 2022 17:35:14 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 22 Jun 2022 17:35:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 17:35:13 +0800
Message-ID: <4e982d51ebad98ccfd3d3f135f4773b6fb7948ac.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Report supported bitrate modes
From:   Irui Wang <irui.wang@mediatek.com>
To:     Hirokazu Honda <hiroh@chromium.org>, <linux-media@vger.kernel.org>
CC:     <stevecho@chromium.org>
Date:   Wed, 22 Jun 2022 17:35:13 +0800
In-Reply-To: <20220622083624.3204916-1-hiroh@chromium.org>
References: <20220622083624.3204916-1-hiroh@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dear Hiro,

Thanks for the patch.
On Wed, 2022-06-22 at 17:36 +0900, Hirokazu Honda wrote:
> The media driver supports constant bitrate mode only.
> The supported rate control mode is reported through querymenu() and
> s_ctrl() fails if non constant bitrate mode (e.g. VBR) is requested.
> 
> Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
> ---
>  .../media/platform/mediatek/vcodec/mtk_vcodec_enc.c   | 11
> +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> index c21367038c34..98d451ce2545 100644
> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> @@ -50,6 +50,14 @@ static int vidioc_venc_s_ctrl(struct v4l2_ctrl
> *ctrl)
>  	int ret = 0;
>  
>  	switch (ctrl->id) {
> +	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:
> +		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE_MODE
> val= %d",
> +			       ctrl->val);
> +		if (ctrl->val != V4L2_MPEG_VIDEO_BITRATE_MODE_CBR) {
> +			mtk_v4l2_err("Unsupported bitrate mode =%d",
> ctrl->val);
> +			ret = -EINVAL;
> +		}
> +		break;
>  	case V4L2_CID_MPEG_VIDEO_BITRATE:
>  		mtk_v4l2_debug(2, "V4L2_CID_MPEG_VIDEO_BITRATE val =
> %d",
>  			       ctrl->val);
> @@ -1373,6 +1381,9 @@ int mtk_vcodec_enc_ctrls_setup(struct
> mtk_vcodec_ctx *ctx)
>  			       0, V4L2_MPEG_VIDEO_H264_LEVEL_4_0);
>  	v4l2_ctrl_new_std_menu(handler, ops,
> V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
>  			       V4L2_MPEG_VIDEO_VP8_PROFILE_0, 0,
> V4L2_MPEG_VIDEO_VP8_PROFILE_0);
> +	v4l2_ctrl_new_std_menu(handler, ops,
> V4L2_CID_MPEG_VIDEO_BITRATE_MODE,
> +			       V4L2_MPEG_VIDEO_BITRATE_MODE_CBR,
> +			       0, V4L2_MPEG_VIDEO_BITRATE_MODE_CBR);
>  
>  
>  	if (handler->error) {

Reviewed-by: Irui Wang <irui.wang@mediatek.com>

