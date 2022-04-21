Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05A6F50ABD2
	for <lists+linux-media@lfdr.de>; Fri, 22 Apr 2022 01:08:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392632AbiDUXKv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 19:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1441812AbiDUXKu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 19:10:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA4A48886
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 16:07:59 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5568492;
        Fri, 22 Apr 2022 01:07:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650582477;
        bh=1c7z5W6DUmIRaAUsGYANTkyt6tvL36M0Fu3NJHrIj/g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FFqNno8LI+k5i5GBFxa3FeH19ulI+4jK/9UtFYw0NTWW3oWcXbytI4C+t18ROIKza
         h881Uy0yntzvsptCp53bbVpPjS3cQiLoRA+5WJmFZPJRJGFdvkvy3uIJyPW7SED3tn
         asTfvEDPthD+2i7ON4MNfx8BweqFmsoMICN0xfUI=
Date:   Fri, 22 Apr 2022 02:07:58 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH 3/3] media: vivid: Add support for the new YUVA and YUVX
 formats
Message-ID: <YmHjzpy/l9Cb7Z8Q@pendragon.ideasonboard.com>
References: <20220307180342.10666-1-laurent.pinchart@ideasonboard.com>
 <20220307180342.10666-4-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220307180342.10666-4-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Would anyone be able to review this patch ?

On Mon, Mar 07, 2022 at 08:03:42PM +0200, Laurent Pinchart wrote:
> Extend vivid to support the newly added YUVA and YUVX pixel formats
> through the TPG.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/test-drivers/vivid/vivid-vid-common.c   | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> index 19701fe72030..38d788b5cf19 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
> @@ -198,6 +198,21 @@ struct vivid_fmt vivid_formats[] = {
>  		.planes   = 1,
>  		.buffers = 1,
>  	},
> +	{
> +		.fourcc   = V4L2_PIX_FMT_YUVA32,
> +		.vdownsampling = { 1 },
> +		.bit_depth = { 32 },
> +		.planes   = 1,
> +		.buffers = 1,
> +		.alpha_mask = 0xff000000,
> +	},
> +	{
> +		.fourcc   = V4L2_PIX_FMT_YUVX32,
> +		.vdownsampling = { 1 },
> +		.bit_depth = { 32 },
> +		.planes   = 1,
> +		.buffers = 1,
> +	},
>  	{
>  		.fourcc   = V4L2_PIX_FMT_GREY,
>  		.vdownsampling = { 1 },

-- 
Regards,

Laurent Pinchart
