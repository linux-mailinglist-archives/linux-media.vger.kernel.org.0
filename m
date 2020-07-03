Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0B9213665
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 10:30:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgGCIaV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 04:30:21 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:49381 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725648AbgGCIaV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 3 Jul 2020 04:30:21 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id rH5Ij8D3AmVFqrH5Lj7KgK; Fri, 03 Jul 2020 10:30:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593765019; bh=K4ZVeaIkwpDUJF8k8wN+GOIsqANXeHbsL0HW+X17StY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=Lyw3z/AHYGxdfG/s21TxsZpZN0Y49U1gEfAtb4yDQVLVLoqoMff23glkXrlfZUD1/
         MIq8JDDUflchHOVwvFOrviBhjrpydprKwz0CNO3CPuSceq8Rfi1dMbPDaxzdQH7GRI
         6UXU2zuIaXlAOfp2v1FhPnJQFFewn40eshw95Cuz6nbnhJW88QDCs86BVhbGmxRcAl
         Q3moyqAh/EKqDsUeQSTCtwhbUdT0PTQBcMJNLzQuB972mYwyslhamzM+v3fganZ5hA
         wJHyxM18TQTkDIW0Uyr/n2pxcuj8mXYWRmNHuf+c7ARv+JPcltaoX0KUYnM4eSznxn
         NAXmCWXYe6KAA==
Subject: Re: [PATCH v2 16/18] media: mtk-vcodec: venc: make S_PARM return
 -ENOTTY for CAPTURE queue
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Rui Wang <gtk_ruiwang@mediatek.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Pi-Hsun Shih <pihsun@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>
Cc:     linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20200626080442.292309-1-acourbot@chromium.org>
 <20200626080442.292309-17-acourbot@chromium.org>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <84068e20-9a34-6d03-61e6-6c243680749c@xs4all.nl>
Date:   Fri, 3 Jul 2020 10:30:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200626080442.292309-17-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfN3aHGef6GoyC6YgNA+lQWNvYAc/GX6g6o3fT32/5hwSIhH59XHQbvcTien9vjQM/YRK8/kYsxaYUglP3+lhHn/i1bTs64qnSGtjtuZ3rbWpaJg5Cwzh
 ee/Qw0usDZy6YvVKe95toreYVGQLSMnyfb6IWRvnnKsJ34bNGPNobu3fmm6fWnUyFUbTMHZF/K++QQ5sJOCyjtu0b7SPStdJhozsJiDiPQnjDmpKyPmIQ1Pg
 I+IzcWGihJBgbMc1hwRM+VlCmizRCSDMvSo/j+pdqALdhpD7F1AcWU6Fz09D9h2HheACAQPCKLqSIg2yoxKiWcGJAniUolShkRzeS+5dhgkDjQcmxxaa6zK9
 szHu5TUA/LjJoQdfhxDbFTG8Do3b2nrb3eur+jpaRvtTc7LVQqC2LH3z6drkOw1A1vqzZDKC+525qEznPhXlDlrBK2I/plhFGW1TxLA45llhZhxxCvpqXFF8
 gxPiA3S1Ve+HGs14cDlgJFSiVZrKrf6UX43IuMx/GawHL1xWyN/VH12/Wr8=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26/06/2020 10:04, Alexandre Courbot wrote:
> v4l2-compliance expects ENOTTY to be returned when a given queue does
> not support S_PARM.
> 
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index aae610e6d4e8..346a33c6869d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -200,7 +200,7 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
>  	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
>  
>  	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
> -		return -EINVAL;
> +		return -ENOTTY;

This doesn't look right: S_PARM *is* supported, just not for this buffer type.
So -EINVAL is the correct error code.

What is the exact v4l2-compliance failure? It might be a bug in the test.

Regards,

	Hans

>  
>  	ctx->enc_params.framerate_num =
>  			a->parm.output.timeperframe.denominator;
> 

