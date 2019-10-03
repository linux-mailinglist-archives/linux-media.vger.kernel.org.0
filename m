Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57668C9FC3
	for <lists+linux-media@lfdr.de>; Thu,  3 Oct 2019 15:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727611AbfJCNoU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Oct 2019 09:44:20 -0400
Received: from mga11.intel.com ([192.55.52.93]:57930 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726119AbfJCNoU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 3 Oct 2019 09:44:20 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Oct 2019 06:44:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,252,1566889200"; 
   d="scan'208";a="205623986"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by fmsmga001.fm.intel.com with SMTP; 03 Oct 2019 06:44:17 -0700
Received: by stinkbox (sSMTP sendmail emulation); Thu, 03 Oct 2019 16:44:17 +0300
Date:   Thu, 3 Oct 2019 16:44:17 +0300
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Johan Korsnes <jkorsnes@cisco.com>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] drivers: video: hdmi: log ext colorimetry applicability
Message-ID: <20191003134417.GF1208@intel.com>
References: <20191003071549.31272-1-jkorsnes@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191003071549.31272-1-jkorsnes@cisco.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 03, 2019 at 09:15:49AM +0200, Johan Korsnes wrote:
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

Yeah, seems fine. Might make the logs a bit less confusing at least.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

PS. would be nice it someone were to extend this code to deal with the
ACE bits too. Do you have plans/interest in doing that?

> +
>  	hdmi_log("    quantization range: %s\n",
>  			hdmi_quantization_range_get_name(frame->quantization_range));
>  	hdmi_log("    nups: %s\n", hdmi_nups_get_name(frame->nups));
> -- 
> 2.20.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Ville Syrjälä
Intel
