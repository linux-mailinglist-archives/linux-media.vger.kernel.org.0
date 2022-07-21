Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF6457C8AA
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 12:11:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233119AbiGUKLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 06:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233110AbiGUKLe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 06:11:34 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 931FC599E4
        for <linux-media@vger.kernel.org>; Thu, 21 Jul 2022 03:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658398293; x=1689934293;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7XuI6H4JGtOJXR1Vxu8jOR82PvpaDpg+9zmUQ4rq/Og=;
  b=BCfpm6WhNOE6MwY9NAjhqLFUX2g44pSAb6w54IMiJAE+h8ZnW4S+Bxp7
   OTSvCprK8e+Jzzyvt2WduEpkARpGtcc0jzDIW6HePREt2A/fiIJNHLXZV
   g1nPDfH3aL/uBdUG4TKy/eA1gt6SM5KtjpqWogNY3HcmxYQlANuqeJ3pD
   z/CQ2Tzkz3xbN7hXBs29E3G1dUA9e29hnhlOrlPO/eOS5h2lq6m5hLA/Z
   s90x3AtpSCEgH6Rg6Mvgzg8eJ0rvDId+fk8vUdb2h4G1mRbRZDWO3ZQ4z
   0ujr1lxKAP1Q5iul5drczEERWqNPZiUpon/sX0O/ltdG8e1E2VROMhckX
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181523"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 21 Jul 2022 12:11:32 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 21 Jul 2022 12:11:32 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 21 Jul 2022 12:11:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1658398292; x=1689934292;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=7XuI6H4JGtOJXR1Vxu8jOR82PvpaDpg+9zmUQ4rq/Og=;
  b=iwL9dyvVIKifUuur8HAD+jclWIiNSkAdjtxoFmbKYHwaNrR+JNeMA++Q
   8bUPkKfoQn4TNqZl6k/8DKsbK003nL6J7muLFYoAzPFnNpULuaef28krQ
   D/eyPFHXXsNAUG29yhtdWVRiQeIj4SItfrp1D96UnaZMTfAJhno/45A4W
   RezbDFIXhJqQnq2rcuXabqASTzGo+7Lre+rf4i7r0lmZnAnyADTwtVJZ0
   zzkab7a0qtJroL0wc69taFwhaaXhmEP/vjkxYCwVOGCEoWbqaquxyJp5d
   LBa/6kSPbuAOa3aansqTX4MyoJlXvHt7y7tElu+ZTazIWMrOVf3Li54CX
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,289,1650924000"; 
   d="scan'208";a="25181522"
Subject: Re: [PATCH 17/19] media: i2c: imx290: Factor out format retrieval to
 separate function
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 21 Jul 2022 12:11:31 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D389F280056;
        Thu, 21 Jul 2022 12:11:31 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>
Date:   Thu, 21 Jul 2022 12:11:31 +0200
Message-ID: <830803795.0ifERbkFSE@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220721083540.1525-18-laurent.pinchart@ideasonboard.com>
References: <20220721083540.1525-1-laurent.pinchart@ideasonboard.com> <20220721083540.1525-18-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Laurent,

thanks for your patch.

Am Donnerstag, 21. Juli 2022, 10:35:38 CEST schrieb Laurent Pinchart:
> The driver duplicates the same pattern to access the try or active
> format in multiple locations. Factor it out to a separate function.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/i2c/imx290.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index fc6e87fada1c..baf9941c5fbe 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -519,6 +519,20 @@ static const struct v4l2_ctrl_ops imx290_ctrl_ops = {
>  	.s_ctrl = imx290_set_ctrl,
>  };
> 
> +static struct v4l2_mbus_framefmt *
> +imx290_get_pad_format(struct imx290 *imx290, struct v4l2_subdev_state
> *state, +		      u32 which)
> +{
> +	switch (which) {
> +	case V4L2_SUBDEV_FORMAT_TRY:
> +		return v4l2_subdev_get_try_format(&imx290->sd, state, 
0);
> +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> +		return &imx290->current_format;
> +	default:
> +		return NULL;
> +	}
> +}
> +
>  static int imx290_enum_mbus_code(struct v4l2_subdev *sd,
>  				 struct v4l2_subdev_state 
*sd_state,
>  				 struct v4l2_subdev_mbus_code_enum 
*code)
> @@ -562,12 +576,7 @@ static int imx290_get_fmt(struct v4l2_subdev *sd,
> 
>  	mutex_lock(&imx290->lock);
> 
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> -		framefmt = v4l2_subdev_get_try_format(&imx290->sd, 
sd_state,
> -						      fmt-
>pad);
> -	else
> -		framefmt = &imx290->current_format;
> -
> +	framefmt = imx290_get_pad_format(imx290, sd_state, fmt->which);
>  	fmt->format = *framefmt;

NULL ptr derence here if 'fmt->which' is neither V4L2_SUBDEV_FORMAT_TRY nor 
V4L2_SUBDEV_FORMAT_ACTIVE. Same for imx290_set_fmt later on.

Best regards,
Alexander

> 
>  	mutex_unlock(&imx290->lock);
> @@ -627,10 +636,9 @@ static int imx290_set_fmt(struct v4l2_subdev *sd,
>  	fmt->format.code = imx290_formats[i].code;
>  	fmt->format.field = V4L2_FIELD_NONE;
> 
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		format = v4l2_subdev_get_try_format(sd, sd_state, fmt-
>pad);
> -	} else {
> -		format = &imx290->current_format;
> +	format = imx290_get_pad_format(imx290, sd_state, fmt->which);
> +
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
>  		imx290->current_mode = mode;
>  		imx290->bpp = imx290_formats[i].bpp;




