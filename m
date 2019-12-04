Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3917C112A2C
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 12:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727473AbfLDLbl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 06:31:41 -0500
Received: from retiisi.org.uk ([95.216.213.190]:56828 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727268AbfLDLbk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Dec 2019 06:31:40 -0500
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id CCFC2634C87;
        Wed,  4 Dec 2019 13:30:46 +0200 (EET)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.92)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1icSrm-0001Vx-Ek; Wed, 04 Dec 2019 13:30:46 +0200
Date:   Wed, 4 Dec 2019 13:30:46 +0200
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Daniel Gomez <daniel@qtec.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: v4l2: Fix fourcc names for BAYER12P
Message-ID: <20191204113046.GF5282@valkosipuli.retiisi.org.uk>
References: <20191203151202.18081-1-daniel@qtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191203151202.18081-1-daniel@qtec.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Dec 03, 2019 at 04:12:00PM +0100, Daniel Gomez wrote:
> Fix documentation fourcc names for the 12-bit packed Bayer formats.
> 
> Signed-off-by: Daniel Gomez <daniel@qtec.com>
> ---
>  Documentation/media/uapi/v4l/pixfmt-srggb12p.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst b/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
> index 960851275f23..7060a4ffad08 100644
> --- a/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
> +++ b/Documentation/media/uapi/v4l/pixfmt-srggb12p.rst
> @@ -13,7 +13,7 @@
>  .. _v4l2-pix-fmt-sgrbg12p:
>  
>  *******************************************************************************************************************************
> -V4L2_PIX_FMT_SRGGB12P ('pRAA'), V4L2_PIX_FMT_SGRBG12P ('pgAA'), V4L2_PIX_FMT_SGBRG12P ('pGAA'), V4L2_PIX_FMT_SBGGR12P ('pBAA'),
> +V4L2_PIX_FMT_SRGGB12P ('pBCC'), V4L2_PIX_FMT_SGRBG12P ('pgCC'), V4L2_PIX_FMT_SGBRG12P ('pGCC'), V4L2_PIX_FMT_SBGGR12P ('pBCC'),
>  *******************************************************************************************************************************

Thanks for the patch.

There's a bug there, but this doesn't still seem entirely correct. For
instance, V4L2_PIX_FMT_SRGGB12P is defined as follows in videodev2.h:

#define V4L2_PIX_FMT_SRGGB12P v4l2_fourcc('p', 'R', 'C', 'C')

Could you fix that, and check the rest?

Please also set the To: header to a valid value; not setting it sometimes
ends up replies being only sent to the original sender of the patch,
omitting the list and others cc'd.

-- 
Kind regards,

Sakari Ailus
