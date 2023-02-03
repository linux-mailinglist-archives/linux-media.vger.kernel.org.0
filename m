Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87A6A68912F
	for <lists+linux-media@lfdr.de>; Fri,  3 Feb 2023 08:45:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232455AbjBCHp1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Feb 2023 02:45:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232602AbjBCHpY (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Feb 2023 02:45:24 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86EE4945E9
        for <linux-media@vger.kernel.org>; Thu,  2 Feb 2023 23:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675410314; x=1706946314;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xm/19LSyl939vwyRmRt9YF26kwbDBI5aMkBzZlZTpYw=;
  b=LKxDesUFCnIhOkOXNyupjmnv5OsnUgRg/u4DUga1f4a3gjEd3qtSynkP
   3eTurQHRbKPmMP5cstCR3nZeJ05SR1sKQXoYs3/qEzarIhNkKYKB1wrSg
   izPe9LDNbsc/rUy/5dmjdC1a6YZExpgHaD1RLCHt68uoWyUlF7uE2O9Xr
   q9L7Lr9b1i5cc2wm7ApswFkCROW5Fs/qnes8tqyPcn/jwFjd7zsC0lVJ9
   N00C2j2MMq+oid3DDtZrynEXBCLhX11PngWXlqoMP3Ye617rxTqfGZ526
   nu1klBBrmFS9ndBrpSS5A3pNG2IzfdHFE9L67v5zYvmM/1/lqP7hgUqqw
   w==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28845164"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 03 Feb 2023 08:45:10 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 03 Feb 2023 08:45:10 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 03 Feb 2023 08:45:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1675410310; x=1706946310;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xm/19LSyl939vwyRmRt9YF26kwbDBI5aMkBzZlZTpYw=;
  b=oisCIwYIhLCTs3jrDxsUwgNH8MxMupU2eygZpkDB1Ms3lSbNELkNGmVD
   AR7bhHiTm7nzAyqrv70i6oxPyGa73CJ5wVDPEr/pI1hS+7TFWXhR13h7A
   pTKks1xK4QLWfmA8IbHkouY2oWzcpY3D3VLv+25lopcp0rIA3CbsiGNDv
   hbJpf6Pxnx3LXKY875Bq0zN9xVzC4BB8w53m6RgCvkh0VJlT/j3+uftdy
   tT0UfoClzduBGwvZ7TJRDonp8qgeycS4vKD59act+nq2V+E+xcr8ij1Gg
   +ZMTbh10yjvLzuF3om0tlT5Rc2kEKk/WzMVk/WojKyrhoyLZs2J3SwZUR
   w==;
X-IronPort-AV: E=Sophos;i="5.97,269,1669071600"; 
   d="scan'208";a="28845163"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 03 Feb 2023 08:45:10 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 512AF280056;
        Fri,  3 Feb 2023 08:45:10 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 09/11] media: i2c: imx290: Remove duplicated write to IMX290_CTRL_07
Date:   Fri, 03 Feb 2023 08:45:10 +0100
Message-ID: <2145604.Icojqenx9y@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230131192016.3476937-10-dave.stevenson@raspberrypi.com>
References: <20230131192016.3476937-1-dave.stevenson@raspberrypi.com> <20230131192016.3476937-10-dave.stevenson@raspberrypi.com>
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

Hi Dave,

thank you for the patch.

Am Dienstag, 31. Januar 2023, 20:20:14 CET schrieb Dave Stevenson:
> IMX290_CTRL_07 was written from both imx290_global_init_settings
> and imx290_1080p_settings and imx290_720p_settings.
> 
> Remove it from imx290_global_init_settings as the setting varies
> based on the mode.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  drivers/media/i2c/imx290.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index 3413d83369ba..5202ef3cc3e6 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -219,7 +219,6 @@ static inline struct imx290 *to_imx290(struct
> v4l2_subdev *_sd) */
> 
>  static const struct imx290_regval imx290_global_init_settings[] = {
> -	{ IMX290_CTRL_07, IMX290_WINMODE_1080P },
>  	{ IMX290_EXTCK_FREQ, 0x2520 },
>  	{ IMX290_WINWV_OB, 12 },
>  	{ IMX290_WINPH, 0 },

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>


