Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226E928E7E0
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 22:28:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730445AbgJNU2J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 16:28:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729022AbgJNU2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 16:28:09 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33CC6C061755
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2020 13:28:09 -0700 (PDT)
Received: from [IPv6:2804:14c:483:7f66::1004] (unknown [IPv6:2804:14c:483:7f66::1004])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id ABC1A1F45832;
        Wed, 14 Oct 2020 21:27:56 +0100 (BST)
Subject: Re: [PATCH 5/6] media: staging: rkisp1: params: add '__must_hold' to
 rkisp1_params_apply_params_cfg
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20201002184222.7094-1-dafna.hirschfeld@collabora.com>
 <20201002184222.7094-6-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <2f1cf2ba-2557-db59-d8e9-5a2c02edd008@collabora.com>
Date:   Wed, 14 Oct 2020 17:27:52 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201002184222.7094-6-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On 10/2/20 3:42 PM, Dafna Hirschfeld wrote:
> The function rkisp1_params_apply_params_cfg must be under the
> the lock of params->config_lock. Add the __must_hold annotation
> to indicate it.
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 3afbc24ca05e..aa18a113245b 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -1187,6 +1187,7 @@ static void rkisp1_isp_isr_meas_config(struct rkisp1_params *params,
>  
>  static void rkisp1_params_apply_params_cfg(struct rkisp1_params *params,
>  					   unsigned int frame_sequence)
> +	__must_hold(&params->config_lock)
>  {
>  	struct rkisp1_params_cfg *new_params;
>  	struct rkisp1_buffer *cur_buf = NULL;
> 

Instead of adding __must_hold, why no to lock inside this function?
It seems there are only two places that call it, and they don't do anything else
in the critical section.

Regards,
Helen
