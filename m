Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66BD0CA0CE
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 17:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727326AbfJCPAG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 11:00:06 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:34675 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726393AbfJCPAG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 11:00:06 -0400
Received: from [192.168.2.10] ([46.9.232.237])
        by smtp-cloud8.xs4all.net with ESMTPA
        id G2aEi3TBOop0AG2aHi8jEM; Thu, 03 Oct 2019 17:00:04 +0200
Subject: Re: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
To:     Johan Korsnes <jkorsnes@cisco.com>, dri-devel@lists.freedesktop.org
Cc:     linux-media@vger.kernel.org
References: <20191003071549.31272-1-jkorsnes@cisco.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <3d11335d-8e5c-f062-91f5-fb3bf87c77b9@xs4all.nl>
Date:   Thu, 3 Oct 2019 16:59:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191003071549.31272-1-jkorsnes@cisco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfKDkvMUeIn38ureWIwWMm33yN0MHYKU+4LnlBRDGrKBrH1fZG3iyKkvzqtMn7rEGttWC1u9qg42KbH6iL607wPofKbpFlq9kB8bgA421spce97zTBRN0
 HEFZR4vldaCjqMIcnEEw9WT02eRZ5YRp9YLFFZHtTilZ5yC12fX4UjHhDOEmWXzPg2Gdy1EtVhFhSsA53gbuYoATRm6B8fVtN75ZdIIO9cLEZjtNcB9QOdHE
 2TKA2onWe16C9aJUs+LB3Q==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/3/19 9:15 AM, Johan Korsnes wrote:
> When logging the AVI InfoFrame, clearly indicate whether or not the
> extended colorimetry attribute is active. This is only the case when
> the AVI InfoFrame colorimetry attribute is set to extended. [0]
> 
> [0] CTA-861-G section 6.4 page 57
> 
> Signed-off-by: Johan Korsnes <jkorsnes@cisco.com>
> ---
>  drivers/video/hdmi.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/video/hdmi.c b/drivers/video/hdmi.c
> index f29db728ff29..a709e38a53ca 100644
> --- a/drivers/video/hdmi.c
> +++ b/drivers/video/hdmi.c
> @@ -682,8 +682,14 @@ static void hdmi_avi_infoframe_log(const char *level,
>  	hdmi_log("    active aspect: %s\n",
>  			hdmi_active_aspect_get_name(frame->active_aspect));
>  	hdmi_log("    itc: %s\n", frame->itc ? "IT Content" : "No Data");
> -	hdmi_log("    extended colorimetry: %s\n",
> +
> +	if (frame->colorimetry == HDMI_COLORIMETRY_EXTENDED)
> +		hdmi_log("    extended colorimetry: %s\n",
>  			hdmi_extended_colorimetry_get_name(frame->extended_colorimetry));
> +	else
> +		hdmi_log("    extended colorimetry: N/A (0x%x)\n",
> +			frame->extended_colorimetry);
> +
>  	hdmi_log("    quantization range: %s\n",
>  			hdmi_quantization_range_get_name(frame->quantization_range));
>  	hdmi_log("    nups: %s\n", hdmi_nups_get_name(frame->nups));
> 

I just realized that there are more fields like that:

content_type is only valid if itc == true

quantization_range is only valid if colorspace is RGB

ycc_quantization_range is only valid if colorspace is YCC

Can you make a v2 where these fields are handled in the same way?
That would really help reduce the confusion when logging the
AVI InfoFrame.

Regards,

	Hans
