Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A9724790E
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 23:47:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728696AbgHQVrG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 17:47:06 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48864 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728693AbgHQVrE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 17:47:04 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id B323E2945A0
Subject: Re: [PATCH v2 03/14] media: staging: rkisp1: params: use the new
 effect value in cproc config
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
References: <20200815103734.31153-1-dafna.hirschfeld@collabora.com>
 <20200815103734.31153-4-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <178b8436-45bc-a4f5-30c1-879a9d0bf8c5@collabora.com>
Date:   Mon, 17 Aug 2020 18:46:55 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200815103734.31153-4-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 8/15/20 7:37 AM, Dafna Hirschfeld wrote:
> The cproc (color processing) configuration needs to know if
> an image effect is configured. The code uses the image effect
> in 'cur_params' which is the first params buffer queued in the stream.
> This is the wrong place to read the value. The value should be
> taken from the current params buffer.

This is a bit confusing, since params->cur_params is not the current
parameter as the name suggest, but it is only the first one.

I was thinking we could rename this variable to
`first_params`, and this descriptions would be less confusing,
but I saw you removed it on patch 07/14, so never mind.

It would be easier to read if this patch was just before patch
07/14.

> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>

> ---
>  drivers/staging/media/rkisp1/rkisp1-params.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-params.c b/drivers/staging/media/rkisp1/rkisp1-params.c
> index 8d881f1df1e6..eb77b4ed8655 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-params.c
> +++ b/drivers/staging/media/rkisp1/rkisp1-params.c
> @@ -560,7 +560,7 @@ static void rkisp1_cproc_config(struct rkisp1_params *params,
>  				const struct rkisp1_cif_isp_cproc_config *arg)
>  {
>  	struct rkisp1_cif_isp_isp_other_cfg *cur_other_cfg =

Side note: I was also thinking that the prefix "cur_other" is very confusing.
What "other" mean here?

Regards,
Helen

> -						&params->cur_params.others;
> +		container_of(arg, struct rkisp1_cif_isp_isp_other_cfg, cproc_config);
>  	struct rkisp1_cif_isp_ie_config *cur_ie_config =
>  						&cur_other_cfg->ie_config;
>  	u32 effect = cur_ie_config->effect;
> 
