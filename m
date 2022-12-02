Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6AF640858
	for <lists+linux-media@lfdr.de>; Fri,  2 Dec 2022 15:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232923AbiLBOYA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Dec 2022 09:24:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiLBOX6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Dec 2022 09:23:58 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B074923BE8;
        Fri,  2 Dec 2022 06:23:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1669991036; x=1701527036;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KNrMk727asvMseqx5cDLpNnJ58d4ScysoenZgXUxKEs=;
  b=hl8VyVia+M8xHB5Xk0jYMGMnSuQjVNHnGV+hxvFoLRBvkyS9aElKiH4A
   TBU4tsnvgL55ILt7q8f2dzVIu0wVKRDY3PFLYp5A81lgH5E5ED+WOx7xh
   p7j12IEYi/Fos+neVRd/JHrsY/iJhWINjAYDnlyANjji2xVDYv892eGVX
   Z19jr0kkUMX7vtJin44TlE5pFPhyT0GL0qH3F/PxSR0H+ZSosK4ONRA2o
   t+l8JghbeFOC6X443E8/PvMhXJftlHbVddva/oBaoM6dxMoBk4PgllFm5
   6LecrxgAxTMhnk4eQhaUUwKlNwT2WnHdLyqJbLTR0A1EfW6jQ9q9xLTnt
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="317108394"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="317108394"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 06:23:55 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="769617099"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; 
   d="scan'208";a="769617099"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2022 06:23:51 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with ESMTP id B601020363;
        Fri,  2 Dec 2022 16:23:48 +0200 (EET)
Date:   Fri, 2 Dec 2022 14:23:48 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jammy Huang <jammy_huang@aspeedtech.com>
Cc:     eajames@linux.ibm.com, mchehab@kernel.org, joel@jms.id.au,
        andrew@aj.id.au, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com, xavier.roumegue@oss.nxp.com,
        ezequiel@vanguardiasur.com.ar, stanimir.varbanov@linaro.org,
        nicolas.dufresne@collabora.com, ming.qian@nxp.com,
        andrzej.p@collabora.com, linux-media@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 1/5] media: v4l: Add definition for the Aspeed JPEG
 format
Message-ID: <Y4oKdBApOGk9TUHO@paasikivi.fi.intel.com>
References: <20221028023554.928-1-jammy_huang@aspeedtech.com>
 <20221028023554.928-2-jammy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028023554.928-2-jammy_huang@aspeedtech.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jammy,

Apologies for a late reply.

On Fri, Oct 28, 2022 at 10:35:50AM +0800, Jammy Huang wrote:
> This introduces support for the Aspeed JPEG format, where the new frame
> can refer to previous frame to reduce the amount of compressed data.
> The concept is similar to I/P frame of video compression. It will
> compare the new frame with previous one to decide which macroblock's
> data is changed, and only the changed macroblocks will be compressed.
> 
> This Aspeed JPEG format is used by the video engine on Aspeed platforms,
> which is generally adapted for remote KVM.
> 
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---
> v11:
>   - no update
> v10:
>   - no update
> v9:
>   - Rebase on new kernel
> v8:
>   - Add decoder information for aspeed-jpeg
> v7:
>   - Add more information for aspeed-jpeg
> v6:
>   - Update description for new format, aspeed-jpeg, in Documentation.
> v5:
>   - no update
> v4:
>   - new
> ---
>  .../userspace-api/media/v4l/pixfmt-reserved.rst | 17 +++++++++++++++++
>  drivers/media/v4l2-core/v4l2-ioctl.c            |  1 +
>  include/uapi/linux/videodev2.h                  |  1 +
>  3 files changed, 19 insertions(+)
> 
> diff --git a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> index 0ff68cd8cf62..73cd99828010 100644
> --- a/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> +++ b/Documentation/userspace-api/media/v4l/pixfmt-reserved.rst
> @@ -258,6 +258,23 @@ please make a proposal on the linux-media mailing list.
>          and it is used by various multimedia hardware blocks like GPU, display
>          controllers, ISP and video accelerators.
>          It contains four planes for progressive video.
> +    * .. _V4L2-PIX-FMT-AJPG:
> +
> +      - ``V4L2_PIX_FMT_AJPG``
> +      - 'AJPG'
> +      - ASPEED JPEG format used by the aspeed-video driver on Aspeed platforms,
> +        which is generally adapted for remote KVM.
> +        On each frame compression, I will compare the new frame with previous
> +        one to decide which macroblock's data is changed, and only the changed
> +        macroblocks will be compressed.
> +
> +        The implementation is based on AST2600 A3 datasheet, revision 0.9, which
> +        is not publicly available. Or you can reference Video stream data format
> +        – ASPEED mode compression of SDK_User_Guide which available on
> +        AspeedTech-BMC/openbmc/releases.

What does this refer to? If it's a URL, please add a reference as below.

Also please run this on the patches:

	$ scripts/checkpatch.pl --strict --max-line-length=80

> +
> +        Decoder's implementation can be found here,
> +        `aspeed_codec <https://github.com/AspeedTech-BMC/aspeed_codec/>`__
>  .. raw:: latex
>  
>      \normalsize
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index fddba75d9074..8cb4b976064e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1497,6 +1497,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  		case V4L2_PIX_FMT_MT21C:	descr = "Mediatek Compressed Format"; break;
>  		case V4L2_PIX_FMT_QC08C:	descr = "QCOM Compressed 8-bit Format"; break;
>  		case V4L2_PIX_FMT_QC10C:	descr = "QCOM Compressed 10-bit Format"; break;
> +		case V4L2_PIX_FMT_AJPG:		descr = "Aspeed JPEG"; break;
>  		default:
>  			if (fmt->description[0])
>  				return;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 86cae23cc446..870a7e5ef8ca 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -775,6 +775,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
>  #define V4L2_PIX_FMT_QC08C    v4l2_fourcc('Q', '0', '8', 'C') /* Qualcomm 8-bit compressed */
>  #define V4L2_PIX_FMT_QC10C    v4l2_fourcc('Q', '1', '0', 'C') /* Qualcomm 10-bit compressed */
> +#define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed JPEG */
>  
>  /* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
>  #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */

-- 
Kind regards,

Sakari Ailus
