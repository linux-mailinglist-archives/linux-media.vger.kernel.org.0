Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9604554DBC6
	for <lists+linux-media@lfdr.de>; Thu, 16 Jun 2022 09:33:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359540AbiFPHco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 03:32:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359278AbiFPHcc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 03:32:32 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A86655C750
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 00:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655364741; x=1686900741;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t18MzqsOj7RbKoS0HaLgd7YZ0X0BU7WwoWa5XPkGw4s=;
  b=W0yYYlNcoG1r8B7CwIjAe4ejQVxEQ0t2GnIkzDS9nTJrNZpAPG7LIMLP
   PgHVVMBsRMFBbjQug90oypdNLB3g4DEBngYJh5E+OZUUvtwad2nhyWezP
   XiQKifx6MCf7D4LTXK5a7BCo/rZK5Jwwx5mbGpKJkI9CRHk9gFzfYae/e
   LezLa6E8KCfToW9scYDuBsfOH2SWXZbfzj/S3CfJlU2r9ppGolAwuyFuR
   KHNePdEzvfQznhWQCEV5dW52n+yPiOWQbNbjU+hReYaA7b9kVX4r9ALMT
   j9AHm6c4fapAc8wSzdabUko+rMrK3kkfrX229wOM0mJ1KBViBDwH/iaVU
   g==;
X-IronPort-AV: E=Sophos;i="5.91,304,1647298800"; 
   d="scan'208";a="24491621"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Jun 2022 09:32:19 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 16 Jun 2022 09:32:19 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 16 Jun 2022 09:32:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655364739; x=1686900739;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t18MzqsOj7RbKoS0HaLgd7YZ0X0BU7WwoWa5XPkGw4s=;
  b=gfwmKZUYkjbjEgFRaAwYFTVbqZHr7sUnVllHo9Ylx9iSHgruc9vp26Ic
   QlHu2Vd8N4zXIbjNsnrqDGFwPVuO1QRC/M5UPSUc8M0r81XPBx6Z3u25q
   50B8OdytlH4fXcFoZL1NhCLss0vyv/SlXavuCkz8eT/MeUzFWREpS5O/u
   zHjsblPMhy5zb59JUU0DSUHHKEudExKYXACU+pjyOGqck/KrKTYrRKzrq
   Ba2jmUifuQu6+BuwstYZEj5lNsSLcWFmp6jK2662y9JUZ+6GnKvabXvM8
   uqX/sugNBzcrDEl6n5SVjDKVe6pXG8tJA8l9W9rwN0Rjw1RFPbTC7wBJK
   g==;
X-IronPort-AV: E=Sophos;i="5.91,304,1647298800"; 
   d="scan'208";a="24491620"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Jun 2022 09:32:19 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 7DFFD280056;
        Thu, 16 Jun 2022 09:32:19 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Paul Elder <paul.elder@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dafna@fastmail.com, heiko@sntech.de,
        jeanmichel.hautbois@ideasonboard.com, jacopo@jmondi.org,
        djrscally@gmail.com, helen.koike@collabora.com,
        linux-rockchip@lists.infradead.org
Subject: Re: (EXT) [PATCH 10/55] media: rkisp1: cap: Print debug message on failed link validation
Date:   Thu, 16 Jun 2022 09:32:17 +0200
Message-ID: <7310038.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220614191127.3420492-11-paul.elder@ideasonboard.com>
References: <20220614191127.3420492-1-paul.elder@ideasonboard.com> <20220614191127.3420492-11-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello Paul,

Am Dienstag, 14. Juni 2022, 21:10:42 CEST schrieb Paul Elder:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> When a link validation failure occurs, print a debug message to help
> diagnosing the cause.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-capture.c    | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c index
> 94819e6c23e2..94a0d787a312 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-capture.c
> @@ -1294,8 +1294,16 @@ static int rkisp1_capture_link_validate(struct
> media_link *link)
> 
>  	if (sd_fmt.format.height != cap->pix.fmt.height ||
>  	    sd_fmt.format.width != cap->pix.fmt.width ||
> -	    sd_fmt.format.code != fmt->mbus)
> +	    sd_fmt.format.code != fmt->mbus) {
> +		dev_dbg(cap->rkisp1->dev,

I wonder if a dev_warn is more suitable here.

Best regards,
Alexander

> +			"link '%s':%u -> '%s':%u not valid: 0x%04x/
%ux%u != 0x%04x/%ux%u",
> +			link->source->entity->name, link->source-
>index,
> +			link->sink->entity->name, link->sink->index,
> +			sd_fmt.format.code, sd_fmt.format.width,
> +			sd_fmt.format.height, fmt->mbus, cap-
>pix.fmt.width,
> +			cap->pix.fmt.height);
>  		return -EPIPE;
> +	}
> 
>  	return 0;
>  }




