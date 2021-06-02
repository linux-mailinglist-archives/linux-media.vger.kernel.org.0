Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06C6C3989AC
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 14:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbhFBMgm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 08:36:42 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:45963 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229610AbhFBMgl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 08:36:41 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id oQ5FlEdPIEXL0oQ5Ily3aK; Wed, 02 Jun 2021 14:34:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1622637297; bh=7TiMGW1Zr59Qnryt0yeaJD/8xsdG8zqZCv0gLOdIeZo=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=tjQUVIoNgWXHTIYNG9gEkVCtkhfYQLiuszDJUOjnNvEoCDUnllu+io6K5eJqHY65D
         9cJDAg0tW0nSmH0CrCk0rSqHf12MEXdt1Iplew3ak/hj8JZSbKkCr8pvSf01O7nx+m
         fQF75AMTwZlRy4JteWUHgOq31/ZR1q64ufOMl6i0CGIvr7mnlNz8QN7r4W/h2iQYuM
         j0b6/ZNXQ/kgii1z1OvMW69HrfQSvLCXPm6J4FFdQNIGYaLGhi0WtMClAnV0FJKSrU
         phG6dhOJyps2xqcQYKjCqvTfVrag8hNJu7S9O3ylPcNOa3nCbhOqip0N5J210KrDRy
         tVV3q/za1HUCw==
Subject: Re: [PATCH 8/9] media: dwc: dw-hdmi-rx: Add support for Aspect Ratio
To:     Nelson Costa <Nelson.Costa@synopsys.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jose Abreu <Jose.Abreu@synopsys.com>
References: <cover.1622631488.git.nelson.costa@synopsys.com>
 <79c8b378a0b9d73e8116fe31a1ebb06fcc6b0925.1622631488.git.nelson.costa@synopsys.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <0004bb3f-13dc-b376-d491-f4023c716aa7@xs4all.nl>
Date:   Wed, 2 Jun 2021 14:34:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <79c8b378a0b9d73e8116fe31a1ebb06fcc6b0925.1622631488.git.nelson.costa@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfHGC7GTrsg3fkrTrrdFa5FFH9baUKH0FmMAoEHdWB2v0dMk8yOyNiTckqvqO+v5EXe/gPDFRfS4KIEoBeiYG9351l2hg29E6qUleRnYSLLaMIMdPyhCd
 xCkXF6KwEIgiPgnG8bYfOrE+w9D21Q0khRMm1syxdfJTZ06EZtiLkJWkteWDp9JK0VTcnM0t82YdLOLD6E9sbgFdhCq/u76NuFcLr8M9n5Q1CCDKBMqQo0yq
 n91Omb8eoL4pZYtIpz/26TbAEqwrz527oJAaBbP99OJMqdMCrm9cyf+6cRdcy1dieHgbqlsxC43378kCMathqLXjmYB04w8DhDHTz8/w86B4N6n8ec/yfJhb
 4NpKdao2chP9LPkpFu1UokUl2feaC9BCuMEoCBZxHQj/dZMVUUib59df8cbmjMPDbj1zMEIMxzIop4UcEgJ7rb+36XJ9YjW2fxPv7uqf2+h04+rrHLP4phqz
 VDUJUnfYFq+qxpMpza7+8xHeeNUh6OXF2PF9UXbtlZ9s7n88hVuxMJsTVjE=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/06/2021 13:24, Nelson Costa wrote:
> This adds support to get aspect ratio for the current
> video being received and provide the info through v4l2
> API query_dv_timings.
> 
> Signed-off-by: Nelson Costa <nelson.costa@synopsys.com>
> ---
>  drivers/media/platform/dwc/dw-hdmi-rx.c | 54 +++++++++++++++++++++++++++++++--
>  1 file changed, 52 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/dwc/dw-hdmi-rx.c b/drivers/media/platform/dwc/dw-hdmi-rx.c
> index b20eccc..a468a93 100644
> --- a/drivers/media/platform/dwc/dw-hdmi-rx.c
> +++ b/drivers/media/platform/dwc/dw-hdmi-rx.c
> @@ -2250,13 +2250,31 @@ static u32 dw_hdmi_get_width(struct dw_hdmi_dev *dw_dev)
>  	return width;
>  }
>  
> +static int dw_hdmi_vic_to_cea861(u8 hdmi_vic)
> +{
> +	switch (hdmi_vic) {
> +	case 1:
> +		return 95;
> +	case 2:
> +		return 94;
> +	case 3:
> +		return 93;
> +	case 4:
> +		return 98;
> +	default:
> +		return 0;
> +	}
> +}

This should be in v4l2-dv-timings.c. It's a useful generic function.

> +
>  static int dw_hdmi_query_dv_timings(struct v4l2_subdev *sd,
>  				    struct v4l2_dv_timings *timings)
>  {
>  	struct dw_hdmi_dev *dw_dev = to_dw_dev(sd);
>  	struct v4l2_bt_timings *bt = &timings->bt;
> +	struct v4l2_dv_timings t = {0};

Use '= {}', it looks a bit nicer that way.

>  	bool is_hdmi_vic;
>  	u32 htot, hofs;
> +	u8 cea861_vic;
>  	u32 vtot;
>  	u8 vic;
>  
> @@ -2351,8 +2369,40 @@ static int dw_hdmi_query_dv_timings(struct v4l2_subdev *sd,
>  		}
>  	}
>  
> -	dev_dbg(dw_dev->dev, "%s: width=%u, height=%u, mbuscode=%u\n", __func__,
> -		bt->width, bt->height, dw_hdmi_get_mbus_code(dw_dev));
> +	if (is_hdmi_vic)
> +		cea861_vic = dw_hdmi_vic_to_cea861(bt->hdmi_vic);
> +	else
> +		cea861_vic = vic;

This definitely is needed, but note that this is unrelated to the Aspect Ratio
support. This should be done in a separate patch.

> +
> +	/* picture aspect ratio based on v4l2 dv timings array */
> +	if (v4l2_find_dv_timings_cea861_vic(&t, cea861_vic)) {
> +		/* when the numerator/denominator are zero means that the
> +		 * picture aspect ratio is the same of the active measures ratio
> +		 */
> +		if (!t.bt.picture_aspect.numerator) {
> +			unsigned long n, d;
> +
> +			rational_best_approximation(t.bt.width, t.bt.height,
> +						    t.bt.width, t.bt.height,
> +						    &n, &d);
> +			t.bt.picture_aspect.numerator = n;
> +			t.bt.picture_aspect.denominator = d;
> +		}
> +
> +		bt->picture_aspect = t.bt.picture_aspect;

Why do this? picture_aspect is only used if it is non-square (V4L2_DV_FL_HAS_PICTURE_ASPECT
is set), so there is no need to set it if V4L2_DV_FL_HAS_PICTURE_ASPECT is cleared.

I don't see any reason for this.

Regards,

	Hans

> +	} else {
> +		bt->picture_aspect.numerator = 0;
> +		bt->picture_aspect.denominator = 0;
> +		dev_dbg(dw_dev->dev,
> +			"%s: cea861_vic=%d was not found in v4l2 dv timings",
> +			__func__, cea861_vic);
> +	}
> +
> +	dev_dbg(dw_dev->dev,
> +		"%s: width=%u, height=%u, mbuscode=%u, cea861_vic=%d, ar={%d,%d}\n",
> +		__func__, bt->width, bt->height, dw_hdmi_get_mbus_code(dw_dev),
> +		cea861_vic, bt->picture_aspect.numerator,
> +		bt->picture_aspect.denominator);
>  
>  	return 0;
>  }
> 

