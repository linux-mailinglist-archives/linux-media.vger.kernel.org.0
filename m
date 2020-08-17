Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B188C247917
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 23:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728727AbgHQVr5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 17:47:57 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48976 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbgHQVr5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 17:47:57 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 77041295BEA
Subject: Re: [PATCH v2 08/14] media: staging: rkisp1: params: set vb.sequence
 to be the isp's frame_sequence + 1
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-9-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <c6853613-0a08-44b0-6086-9805bb5ebd16@collabora.com>
Date:   Mon, 17 Aug 2020 18:47:46 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815103734.31153-9-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
> The params isr is called when a frame is out of the isp. The parameters
> are applied immediately since the isr updates the shadow registers.
> Therefore the params are first applied on the next frame.
> We want the vb.sequence to be the frame that the params are applied to.
> So we set vb.sequence to be the isp's frame_sequence + 1
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 134b5c9a94c1..4b4391c0a2a0 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1220,7 +1220,14 @@ void rkisp1_params_apply_params_cfg(struct rkisp1_params *params, unsigned int f
>  
>  void rkisp1_params_isr(struct rkisp1_device *rkisp1)
>  {
> -	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence);
> +	/*
> +	 * The params isr is called when a frame is out of the isp. The parameters
> +	 * are applied immediately since the isr updates the shadow registers.
> +	 * Therefore the params are first applied on the next frame.
> +	 * We want the vb.sequence to be the frame that the params are applied to.
> +	 * So we set vb.sequence to be the isp's frame_sequence + 1
> +	 */

I would just re-phrase this a bit, how about:

	This isr is called when the ISP finishes processing a frame.
	To configure the parameters, we update the shadow registers, which means
	that the next frame will already take these new configuration into consideration.
	Since frame_sequence is only updated on the vertical sync signal, we should use
	frame_sequence + 1 here to indicate to userspace which frame this parameters
	are being applied to.


Or maybe smaller:

	This isr is called when the ISP finishes processing a frame.
	Configurations performed here will be applied to the next frame.	
	Since frame_sequence is only updated on the vertical sync signal, we should use
	frame_sequence + 1 here to indicate to userspace which frame this parameters
	are being applied to.

What do you think?

With an improvement in the text (and also commit message):

Acked-by: Helen Koike <helen.koike@collabora.com>

Regards,
Helen

> +	unsigned int frame_sequence = atomic_read(&rkisp1->isp.frame_sequence) + 1;
>  	struct rkisp1_params *params = &rkisp1->params;
>  
>  	spin_lock(&params->config_lock);
> 
