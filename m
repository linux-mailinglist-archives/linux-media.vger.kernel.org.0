Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ABC4B7BF331
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 08:39:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442242AbjJJGj4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 02:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442233AbjJJGjz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 02:39:55 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7038B97
        for <linux-media@vger.kernel.org>; Mon,  9 Oct 2023 23:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696919994; x=1728455994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WfDMlglrJiRnCIfKNosg+mcrpxnAK861x3J4NTBNF/U=;
  b=ZU8gMnBcf74OCdofyU+Edv/QnB1+ehuAoLKqOOkHx/1sejCin/RhvACc
   oiQRaGAEHy07LCmcPpquKDGG8onPVcJDFVjvSMUSOzppfOg2nSJpYjxGU
   obCfXAvW0ke9lNi8B59JXqIxitlPlF2MZpxs+KVstPqw6zv3iyLSIH02v
   gEdiwkc+AEHDb5n5wyWkOWfgBBtvn3J5AS+ntRZMnGfUorb6OOs1KJHz+
   bz6AxAcjUWLcDTSAkrOtc0D8MtkW+9JM3nUFWv5CBN9miFC2gb/PoiBa1
   JTOVmXPJC4RnWmF0Tqb7MYWybzrfTNFHM0eOyNQGtBITMLCDDLK/CsWDN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="369390503"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="369390503"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 23:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000558329"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="1000558329"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 23:39:52 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id 9A25111F8DE;
        Tue, 10 Oct 2023 09:39:49 +0300 (EEST)
Date:   Tue, 10 Oct 2023 06:39:49 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 7/9] media: i2c: tc358746: check fmt validity
Message-ID: <ZSTxtRAXdaUwTUjN@kekkonen.localdomain>
References: <cover.1696586632.git.hverkuil-cisco@xs4all.nl>
 <b4a9369bf923c0a3b90cf0e8ccee8ee2178403fc.1696586632.git.hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4a9369bf923c0a3b90cf0e8ccee8ee2178403fc.1696586632.git.hverkuil-cisco@xs4all.nl>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On Fri, Oct 06, 2023 at 12:08:48PM +0200, Hans Verkuil wrote:
> Check if the format was really found.
> 
> Fixes smatch warning:
> 
> drivers/media/i2c/tc358746.c:790 tc358746_set_fmt() error: 'fmt' dereferencing possible ERR_PTR()
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> CC: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/i2c/tc358746.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/tc358746.c b/drivers/media/i2c/tc358746.c
> index 566f5eaddd57..ce612a47ba84 100644
> --- a/drivers/media/i2c/tc358746.c
> +++ b/drivers/media/i2c/tc358746.c
> @@ -784,8 +784,12 @@ static int tc358746_set_fmt(struct v4l2_subdev *sd,
>  	sink_fmt = v4l2_subdev_get_pad_format(sd, sd_state, TC358746_SINK);
>  
>  	fmt = tc358746_get_format_by_code(format->pad, format->format.code);
> -	if (IS_ERR(fmt))
> +	if (IS_ERR(fmt)) {
>  		fmt = tc358746_get_format_by_code(format->pad, tc358746_def_fmt.code);
> +		// Can't happen, but just in case...

/* ... */

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

> +		if (WARN_ON(IS_ERR(fmt)))
> +			return -EINVAL;
> +	}
>  
>  	format->format.code = fmt->code;
>  	format->format.field = V4L2_FIELD_NONE;
> -- 
> 2.40.1
> 

-- 
Sakari Ailus
