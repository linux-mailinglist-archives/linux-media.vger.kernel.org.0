Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01E023C8403
	for <lists+linux-media@lfdr.de>; Wed, 14 Jul 2021 13:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231128AbhGNLpZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Jul 2021 07:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230405AbhGNLpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Jul 2021 07:45:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63CF8C06175F
        for <linux-media@vger.kernel.org>; Wed, 14 Jul 2021 04:42:33 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77DE8CC;
        Wed, 14 Jul 2021 13:42:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626262950;
        bh=AlKmmCpS9/UN1l8KCv3T/Ml96Tk+v9JxSPqg6OulaO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l/8g5I8EsLi2055z2IXbSihFv4TpNi5xoQkESq8jiORoxS7l+CAk+LmAqjfXR84rJ
         Oxs34WAN5cU9BBKuC3HpoLu/FjMjvsWKMVu0GGnnvKaIAVWMvugeO2sIXkT2PzCuBk
         jbtcibWz7nbk5BQrDY1fazEV1RsQfao8sBnF7Qbs=
Date:   Wed, 14 Jul 2021 14:42:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        tfiga@chromium.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: staging: document that Imgu not output
 auto-exposure statistics
Message-ID: <YO7NpSZfA65oCE6e@pendragon.ideasonboard.com>
References: <1626262180-19749-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1626262180-19749-1-git-send-email-bingbu.cao@intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

Thank you for the patch.

On Wed, Jul 14, 2021 at 07:29:40PM +0800, Bingbu Cao wrote:
> Currently, Imgu can not support output the auto-exposure statistics into
> ae_raw_buffer in 3A stats buffer, this patch document it.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/staging/media/ipu3/include/uapi/intel-ipu3.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> index fa3d6ee5adf2..605113da1aed 100644
> --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> @@ -534,6 +534,9 @@ struct ipu3_uapi_ff_status {
>   *
>   * @awb_raw_buffer: auto white balance meta data &ipu3_uapi_awb_raw_buffer
>   * @ae_raw_buffer: auto exposure raw data &ipu3_uapi_ae_raw_buffer_aligned
> + *                 current Imgu does not output the auto exposure statistics
> + *                 to ae_raw_buffer, the user such as 3A algorithm can use the
> + *                 RGB table in &ipu3_uapi_awb_raw_buffer to do auto-exposure.

Is there any other fields in the statistics buffer that is not populated
by the device, or is this the only one ?

Could you please also mark the corresponding parameters fields as unused
by the device ?

>   * @af_raw_buffer: &ipu3_uapi_af_raw_buffer for auto focus meta data
>   * @awb_fr_raw_buffer: value as specified by &ipu3_uapi_awb_fr_raw_buffer
>   * @stats_4a_config: 4a statistics config as defined by &ipu3_uapi_4a_config.

-- 
Regards,

Laurent Pinchart
