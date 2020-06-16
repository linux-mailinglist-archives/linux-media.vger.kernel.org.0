Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CE11FB041
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 14:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgFPMUx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 08:20:53 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:46520 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgFPMUw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 08:20:52 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 9BB9E2A0E9A
Subject: Re: [RESEND PATCH v3 6/6] media: staging: rkisp1: common: add
 documentation for struct rkisp1_isp_mbus_info
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
References: <20200613091353.12689-1-dafna.hirschfeld@collabora.com>
 <20200613091353.12689-7-dafna.hirschfeld@collabora.com>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <739b92c2-1b4e-eeb9-5233-dc4add4316c6@collabora.com>
Date:   Tue, 16 Jun 2020 09:20:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200613091353.12689-7-dafna.hirschfeld@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

Thanks for the patch.

On 6/13/20 6:13 AM, Dafna Hirschfeld wrote:
> Add documentation for the struct rkisp1_isp_mbus_info with
> one line doc of each field
> 
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/staging/media/rkisp1/rkisp1-common.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
> index 13c5eeff66f3..6104eddac0e5 100644
> --- a/drivers/staging/media/rkisp1/rkisp1-common.h
> +++ b/drivers/staging/media/rkisp1/rkisp1-common.h
> @@ -268,6 +268,19 @@ struct rkisp1_device {
>  	struct rkisp1_debug debug;
>  };
>  
> +/*
> + * struct rkisp1_isp_mbus_info
> + *
> + * holds information about the supported isp media bus
> + * @mbus_code: the media bus code
> + * @pixel_enc: the pixel encoding
> + * @mipi_dt: the mipi data type
> + * @yuv_seq: the order of the yuv values for yuv formats
> + * @bus_width: the bus width
> + * @bayer_pat: the bayer pattern for bayer formats
> + * @isp_pads_mask: a bitmask of the pads that the format is supported on
> + */
> +
>  /*
>   * struct rkisp1_isp_mbus_info - ISP pad format info
>   *
> 

Why doesn't it remove the current doc?

Thanks
Helen
