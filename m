Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1DD919ECE4
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 19:30:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727390AbgDERaD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 13:30:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58454 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbgDERaD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 13:30:03 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3440611C8;
        Sun,  5 Apr 2020 19:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586107801;
        bh=s6FDCX4gt9wfmVcxq5wNwUmrBiTJg7COQxP+wX8LvRE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UPYgK1AVbai93AIGdGX7d0hZLijs3dkH2MOYjdDXeBBXpL/AVD5wcUuU5t0wyopcU
         8joNGPU5B4IcguOHizIH7qbZzBIujFTrrtiivhtfmhd5OMKSAQMQ7oBMqjZAemLU0j
         w8bODQxZVfH2etmAWV1xXn8z+hSFccEH5NM1B9DE=
Date:   Sun, 5 Apr 2020 20:29:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Helen Koike <helen.koike@collabora.com>,
        linux-media@vger.kernel.org, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Subject: Re: [PATCH 2/3] media: staging: rkisp1: rsz: change (hv)div only if
 capture format is YUV
Message-ID: <20200405172952.GI5846@pendragon.ideasonboard.com>
References: <20200328105606.13660-1-dafna.hirschfeld@collabora.com>
 <20200328105606.13660-3-dafna.hirschfeld@collabora.com>
 <7445ddcb-75f5-7792-0807-47c0b0d0d54a@collabora.com>
 <711657f5-005b-fafd-6063-f8c8b61905e7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <711657f5-005b-fafd-6063-f8c8b61905e7@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dafna,

On Sat, Apr 04, 2020 at 02:09:20PM +0200, Dafna Hirschfeld wrote:
> On 30.03.20 22:04, Helen Koike wrote:
> > On 3/28/20 7:56 AM, Dafna Hirschfeld wrote:
> >> RGB formats in selfpath should receive input format as YUV422.
> >> The resizer input format is always YUV422 and therefore
> >> if the capture format is RGB, the resizer should not change
> >> the YUV rations.
> >>
> >> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >> ---
> >>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 14 ++++++++++++--
> >>   1 file changed, 12 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >> index 8704267a066f..5721eee29ecb 100644
> >> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >> @@ -389,8 +389,18 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
> >>   			&rsz->rkisp1->capture_devs[rsz->id];
> >>   		const struct v4l2_format_info *pixfmt_info = cap->pix.info;
> >>   
> >> -		hdiv = pixfmt_info->hdiv;
> >> -		vdiv = pixfmt_info->vdiv;
> >> +		/*
> >> +		 * The resizer always get the input as YUV422
> >> +		 * If the capture encoding is also YUV, then the resizer should
> >> +		 * change the 4:2:2 sampling to the sampling of the capture
> >> +		 * format (4:2:2 -> 4:2:0 for example).
> >> +		 * If the capture format is RGB then the memory input should
> >> +		 * be YUV422 so we don't change the default hdiv, vdiv
> >> +		 */
> >> +		if (v4l2_is_format_yuv(pixfmt_info)) {
> > 
> > Can't this be moved with && in the outer if statement block?
> 
> Actually the outer statement is not needed at all and can be removed
> since the code return if rsz->fmt_type is RKISP1_FMT_BAYER but
> the resizer format is either bayer or yuv so there is no
> need for the "if (rsz->fmt_type == RKISP1_FMT_YUV)"

This sounds reasonable.

> >> +			hdiv = pixfmt_info->hdiv;
> >> +			vdiv = pixfmt_info->vdiv;
> >> +		}
> >>   	}
> >>   	src_c.width = src_y.width / hdiv;
> >>   	src_c.height = src_y.height / vdiv;
> >>

-- 
Regards,

Laurent Pinchart
