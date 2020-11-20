Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4DE52BAC1A
	for <lists+linux-media@lfdr.de>; Fri, 20 Nov 2020 15:44:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727914AbgKTOnk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Nov 2020 09:43:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726490AbgKTOnk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Nov 2020 09:43:40 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623E6C0613CF;
        Fri, 20 Nov 2020 06:43:40 -0800 (PST)
Received: from [IPv6:2003:c7:cf41:a700:d85a:e53f:e26d:e760] (p200300c7cf41a700d85ae53fe26de760.dip0.t-ipconnect.de [IPv6:2003:c7:cf41:a700:d85a:e53f:e26d:e760])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ECE8B1F46035;
        Fri, 20 Nov 2020 14:43:38 +0000 (GMT)
Subject: Re: [PATCH] media: rockchip: rkisp1: Constify static structs
To:     Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20201119221849.147984-1-rikard.falkeborn@gmail.com>
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <5073bc92-df77-0ca0-c932-99037c92bfa5@collabora.com>
Date:   Fri, 20 Nov 2020 15:43:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201119221849.147984-1-rikard.falkeborn@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



Am 19.11.20 um 23:18 schrieb Rikard Falkeborn:
> These 'ops' structs are never modified, so make them const to allow the
> compiler to put them in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Thanks!

Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

> ---
>   drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c | 6 +++---
>   drivers/media/platform/rockchip/rkisp1/rkisp1-common.h  | 2 +-
>   drivers/media/platform/rockchip/rkisp1/rkisp1-params.c  | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> index b81235afd053..380582f68ace 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -565,7 +565,7 @@ static void rkisp1_sp_set_data_path(struct rkisp1_capture *cap)
>   	rkisp1_write(cap->rkisp1, dpcl, RKISP1_CIF_VI_DPCL);
>   }
>   
> -static struct rkisp1_capture_ops rkisp1_capture_ops_mp = {
> +static const struct rkisp1_capture_ops rkisp1_capture_ops_mp = {
>   	.config = rkisp1_mp_config,
>   	.enable = rkisp1_mp_enable,
>   	.disable = rkisp1_mp_disable,
> @@ -574,7 +574,7 @@ static struct rkisp1_capture_ops rkisp1_capture_ops_mp = {
>   	.is_stopped = rkisp1_mp_is_stopped,
>   };
>   
> -static struct rkisp1_capture_ops rkisp1_capture_ops_sp = {
> +static const struct rkisp1_capture_ops rkisp1_capture_ops_sp = {
>   	.config = rkisp1_sp_config,
>   	.enable = rkisp1_sp_enable,
>   	.disable = rkisp1_sp_disable,
> @@ -1038,7 +1038,7 @@ rkisp1_vb2_start_streaming(struct vb2_queue *queue, unsigned int count)
>   	return ret;
>   }
>   
> -static struct vb2_ops rkisp1_vb2_ops = {
> +static const struct vb2_ops rkisp1_vb2_ops = {
>   	.queue_setup = rkisp1_vb2_queue_setup,
>   	.buf_queue = rkisp1_vb2_buf_queue,
>   	.buf_prepare = rkisp1_vb2_buf_prepare,
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 3a134e97161c..038c303a8aed 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -214,7 +214,7 @@ struct rkisp1_capture {
>   	struct rkisp1_vdev_node vnode;
>   	struct rkisp1_device *rkisp1;
>   	enum rkisp1_stream_id id;
> -	struct rkisp1_capture_ops *ops;
> +	const struct rkisp1_capture_ops *ops;
>   	const struct rkisp1_capture_config *config;
>   	bool is_streaming;
>   	bool is_stopping;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 03f9a81df440..6af4d551ffb5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -1469,7 +1469,7 @@ static void rkisp1_params_vb2_stop_streaming(struct vb2_queue *vq)
>   		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
>   }
>   
> -static struct vb2_ops rkisp1_params_vb2_ops = {
> +static const struct vb2_ops rkisp1_params_vb2_ops = {
>   	.queue_setup = rkisp1_params_vb2_queue_setup,
>   	.wait_prepare = vb2_ops_wait_prepare,
>   	.wait_finish = vb2_ops_wait_finish,
> @@ -1479,7 +1479,7 @@ static struct vb2_ops rkisp1_params_vb2_ops = {
>   
>   };
>   
> -static struct v4l2_file_operations rkisp1_params_fops = {
> +static const struct v4l2_file_operations rkisp1_params_fops = {
>   	.mmap = vb2_fop_mmap,
>   	.unlocked_ioctl = video_ioctl2,
>   	.poll = vb2_fop_poll,
> 
