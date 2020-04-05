Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBF9619ECDA
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 19:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727575AbgDERTx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 13:19:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58376 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726696AbgDERTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 13:19:53 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B8A54312;
        Sun,  5 Apr 2020 19:19:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586107191;
        bh=p1cER/m8g0ljI1ODBGISmXncHcvejrhRsCs+YuGUfS0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gNsw3USPu6G0IJxG+EAgA9xa8kxw3ghGf3ZcRDTcAaj7pS6tK2c+jTUISQtvAnB2i
         o6K2AHhuI7f2YTF8xBAxGN4BF3eLvDb7USF1JEu/iP9mTHQAgcTJTpbcwOaM3YzMRm
         aKf6ERTldCjr1XtxU21o1uBVQcX2uBG5QyoPO9/U=
Date:   Sun, 5 Apr 2020 20:19:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v6 00/11] media: imx: Miscellaneous format-related
 cleanups
Message-ID: <20200405171942.GG5846@pendragon.ideasonboard.com>
References: <20200404224130.23118-1-slongerbeam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200404224130.23118-1-slongerbeam@gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,

On Sat, Apr 04, 2020 at 03:41:19PM -0700, Steve Longerbeam wrote:
> This series picks up Laurent Pinchart's series:
> 
> [PATCH 0/8] media: imx: Miscalleanous format-related cleanups
> 
> with a merge of two patches from Philipp Zabel's series:
> 
> [PATCH 1/3] media: imx: enable V4L2_PIX_FMT_XBGR32, _BGRX32, and _RGBX32
> 
> with an additional patch at the end that splits up the find_enum_format()
> functions into separate functions for in-memory fourcc codes and mbus
> codes, as requested by Hans Verkuil in the series from Philipp.

Thank you. I've reviewed everything, there are only minor comments.
Hans, do you want to go through the series before Steve posts the final
v7 ?

> History:
> 
> v6:
> - Moved the last patch, "Split find|enum_format into fourcc and mbus
>   functions", up in the series, which makes the patches cleaner and
>   reduces the patch count by 1.
> - "if (sel_ipu && !fmt->ipufmt) ..." should be
>   "if (sel_ipu != fmt->ipufmt) ...".
> 
> v5:
> - Added a patch that renames the pixel format selection enums/flags.
> - Added a patch that adds another format selection flag, to select
>   the IPU-internal formats. This is an alternative to the previous
>   patch "media: imx: utils: Simplify IPU format lookup and enumeration".
> - Add comments for the struct imx_media_pixfmt members, with a
>   warning that the codes pointer is NULL for the in-memory-only formats.
> 
> v4:
> - Constify mbus arg to imx_media_mbus_fmt_to_ipu_image().
> - Constify ipu_image arg to imx_media_ipu_image_to_mbus_fmt().
> - Return -EINVAL in imx_media_ipu_image_to_mbus_fmt() if given
>   image pixelformat does not have mbus codes.
> 
> v3:
> - fixed derefencing a NULL cc->codes on return from imx_media_find_format()
>   in several places.
> 
> v2:
> - fixed a bug:
>   "for (j=0; j < fmt->codes[j]; j++)" should be
>   "for (j=0; fmt->codes[j]; j++)", in the mbus format enum functions.
>   Caught by Laurent.
> - move some local vars under the pixel_formats[] loop. Suggested by Laurent.
> - decrement the index passed to the enum functions, instead of introducing
>   a match_index local var. Suggested by Laurent.
> 
> 
> Laurent Pinchart (5):
>   media: imx: utils: Inline init_mbus_colorimetry() in its caller
>   media: imx: utils: Handle Bayer format lookup through a selection flag
>   media: imx: utils: Make imx_media_pixfmt handle variable number of
>     codes
>   media: imx: utils: Rename format lookup and enumeration functions
>   media: imx: utils: Constify mbus argument to imx_media_mbus_fmt_to_*
> 
> Philipp Zabel (2):
>   media: imx: utils: fix and simplify pixel format enumeration
>   media: imx: utils: fix media bus format enumeration
> 
> Steve Longerbeam (4):
>   media: imx: utils: Rename pixel format selection enumeration
>   media: imx: utils: Introduce PIXFMT_SEL_IPU
>   media: imx: utils: Split find|enum_format into fourcc and mbus
>     functions
>   media: imx: utils: Constify ipu_image argument to
>     imx_media_ipu_image_to_mbus_fmt()
> 
>  drivers/staging/media/imx/imx-ic-prp.c        |  13 +-
>  drivers/staging/media/imx/imx-ic-prpencvf.c   |  13 +-
>  drivers/staging/media/imx/imx-media-capture.c |  42 +-
>  .../staging/media/imx/imx-media-csc-scaler.c  |   3 +-
>  drivers/staging/media/imx/imx-media-csi.c     |  42 +-
>  drivers/staging/media/imx/imx-media-utils.c   | 526 ++++++++----------
>  drivers/staging/media/imx/imx-media-vdic.c    |  12 +-
>  drivers/staging/media/imx/imx-media.h         |  45 +-
>  drivers/staging/media/imx/imx7-media-csi.c    |  15 +-
>  9 files changed, 327 insertions(+), 384 deletions(-)
> 

-- 
Regards,

Laurent Pinchart
