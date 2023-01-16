Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D966A66BCA8
	for <lists+linux-media@lfdr.de>; Mon, 16 Jan 2023 12:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjAPLRt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Jan 2023 06:17:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjAPLRs (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Jan 2023 06:17:48 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBBA6596
        for <linux-media@vger.kernel.org>; Mon, 16 Jan 2023 03:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673867867; x=1705403867;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6GeBcE8XofaWzRE3B/+3CbEgOPxBhCEE4XkvTPEs4z0=;
  b=CQEDgCXqqCe40DyKHiLlYllFil3zJOCKBJAMbBG19tTCO+Qa9FwWwEmz
   f4ixQKph2gmhdUfhvv1g3hHqwZI1S6G2+6Mnh2cTG7uY6a8dS1z/MCV51
   JdVbwF4P2uET4Wwdxn3h8XRfz9QEXatNeo/hlf8FKVX4CHaKCp43R0VFz
   0XL7M2O6YRTcFaRxZPP+6jXHYl8M4TuZoNArhnWZM0TdHxbvl3hRNvTkI
   V9Qmj+OBDhr37ecKAG6PFR+JQVQcbXeaapLg9pbi0UCOtf2FdEDZNbSb9
   At6tM0Ci/zGFYSO1EI9Wzc7H+e2546z2N/jRBmdqUJB0d1/nwg5lVnXGf
   w==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28447382"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jan 2023 12:17:45 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 16 Jan 2023 12:17:45 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 16 Jan 2023 12:17:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673867865; x=1705403865;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6GeBcE8XofaWzRE3B/+3CbEgOPxBhCEE4XkvTPEs4z0=;
  b=F/Zc2fuT25EW92mIwjsH6CybleLhdMOoHe9PK/ve0+vAG3v1xaPyUuss
   GFNOzY4xsCLQUm0Yi8x0XMHHrVSTm3RF/RKQw7DsWujpCdD0ysn8lsV3v
   8Fwh0q3WUI9rHioY2Sd4Xbb5Oz0nG46HAUAb19mkZTgEt01vS1WeKM/Gs
   Tk4Ib6g1yZAhsmUXqSpV9O1S3egu4YeBgGQP+CMsDuRNSLwtEZPHL5Tcn
   Jj7K1aXh4p5Rgl/Q2B6nnpLdZVQzC6KYKvepQVogqEuwTwhPcb3CwW9+Q
   q93KC+pgo5i+w8aeMQAq3kxndwPVB+YZXef6dHoLMtD7zJnuYUxUW0qN8
   w==;
X-IronPort-AV: E=Sophos;i="5.97,220,1669071600"; 
   d="scan'208";a="28447381"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jan 2023 12:17:45 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6DFA5280056;
        Mon, 16 Jan 2023 12:17:45 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 17/17] media: i2c: imx290: Handle error from imx290_set_data_lanes()
Date:   Mon, 16 Jan 2023 12:17:45 +0100
Message-ID: <3400973.QJadu78ljV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230114171802.13878-17-laurent.pinchart@ideasonboard.com>
References: <20230114171727.13830-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-1-laurent.pinchart@ideasonboard.com> <20230114171802.13878-17-laurent.pinchart@ideasonboard.com>
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

Hi Laurent,

thanks for the update.

Am Samstag, 14. Januar 2023, 18:18:02 CET schrieb Laurent Pinchart:
> Check the error status returned by imx290_set_data_lanes() in its
> caller and propagate it.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
> Changes since v1:
> 
> - New patch
> ---
>  drivers/media/i2c/imx290.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index a8167119534b..62d8d75aec3e 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -761,7 +761,11 @@ static int imx290_start_streaming(struct imx290
> *imx290, }
> 
>  	/* Set data lane count */
> -	imx290_set_data_lanes(imx290);
> +	ret = imx290_set_data_lanes(imx290);
> +	if (ret < 0) {
> +		dev_err(imx290->dev, "Could not set data lanes\n");
> +		return ret;
> +	}
> 
>  	/* Apply the register values related to current frame format */
>  	format = v4l2_subdev_get_pad_format(&imx290->sd, state, 0);




