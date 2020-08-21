Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDD7B24CB2B
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 05:13:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727066AbgHUDNt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 23:13:49 -0400
Received: from mga09.intel.com ([134.134.136.24]:33893 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726702AbgHUDNt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 23:13:49 -0400
IronPort-SDR: 8ulKUA/uIixEzSzpaag7tgpuzsnIEUUfY5EH4nw8Z8rCtWUvm/tiwUG4nEAhYTO+ZIYD13l3Wn
 iMuJwttcSk4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9719"; a="156504566"
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; 
   d="scan'208";a="156504566"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2020 20:13:48 -0700
IronPort-SDR: jysDOK7Lor6Zt2Jkvq9UmkZNO6x8Rd7oHpt3yZH9vTvLuaC+T0H6H/kqOueFieMZ8lejx8Dlg6
 Kw329jO5rzdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,335,1592895600"; 
   d="scan'208";a="321114103"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 20 Aug 2020 20:13:47 -0700
Subject: Re: [PATCH] media: ov5675: correct the maximum exposure value
To:     Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org,
        sakari.ailus@linux.intel.com, shawnx.tu@intel.com
Cc:     senozhatsky@chromium.org, tfiga@chromium.org, hongju.wang@intel.com
References: <1597913349-24609-1-git-send-email-bingbu.cao@intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <14bae2be-baea-5c46-70a5-6df399dd7acb@linux.intel.com>
Date:   Fri, 21 Aug 2020 11:12:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1597913349-24609-1-git-send-email-bingbu.cao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Got some information from Shawn, that the code before was align with the spec.

Sakari, please ignore this patch and I will try to figure out the actual reason
of the auto-exposure issue.

Thanks.

On 8/20/20 4:49 PM, Bingbu Cao wrote:
> current ov5675 driver did a wrong calculation for the maximum exposure
> value, it will cause the auto-exposure can not work as expected, this
> patch correct it.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/ov5675.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index 8537cc4ca108..7592cd50807a 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -666,8 +666,8 @@ static int ov5675_set_ctrl(struct v4l2_ctrl *ctrl)
>  	/* Propagate change of current control to all related controls */
>  	if (ctrl->id == V4L2_CID_VBLANK) {
>  		/* Update max exposure while meeting expected vblanking */
> -		exposure_max = (ov5675->cur_mode->height + ctrl->val -
> -			       OV5675_EXPOSURE_MAX_MARGIN) / 2;
> +		exposure_max = ov5675->cur_mode->height + ctrl->val -
> +			OV5675_EXPOSURE_MAX_MARGIN;
>  		__v4l2_ctrl_modify_range(ov5675->exposure,
>  					 ov5675->exposure->minimum,
>  					 exposure_max, ov5675->exposure->step,
> 

-- 
Best regards,
Bingbu Cao
