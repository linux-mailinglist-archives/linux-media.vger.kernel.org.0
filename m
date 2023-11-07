Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 27FFB7E3FAB
	for <lists+linux-media@lfdr.de>; Tue,  7 Nov 2023 14:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234744AbjKGNIf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Nov 2023 08:08:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234722AbjKGNIN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Nov 2023 08:08:13 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60D243BC68
        for <linux-media@vger.kernel.org>; Tue,  7 Nov 2023 04:32:08 -0800 (PST)
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C96A99CC;
        Tue,  7 Nov 2023 13:31:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1699360305;
        bh=EhvHWAx0rCb55ZIh/ztFn+tVbV72e1iNxSZKSEDrZDo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tC8zVdkbGGFvyIP9du/trlkFxa0+cWZJ9w7wWgr0jBVjfEacDv0F+tp5a8a4pu22V
         N99BavT+MQHeHRxObLl8SnKZV8eWYTFqRl8wLGNPciaz3Xbx3oRnSds0TxNejKW7Ja
         KkwcOeRJjT5fpwXv4iMTGwonvn1QfTAya4GFM8rs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231107095156.365492-5-umang.jain@ideasonboard.com>
References: <20231107095156.365492-1-umang.jain@ideasonboard.com> <20231107095156.365492-5-umang.jain@ideasonboard.com>
Subject: Re: [PATCH 4/9] staging: vc04_services: Shorten helper function name
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Stefan Wahren <stefan.wahren@i2se.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dan Carpenter <error27@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Umang Jain <umang.jain@ideasonboard.com>
To:     Umang Jain <umang.jain@ideasonboard.com>,
        linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Date:   Tue, 07 Nov 2023 12:32:03 +0000
Message-ID: <169936032386.1233626.219519021530488190@ping.linuxembedded.co.uk>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Umang Jain (2023-11-07 09:51:51)
> Shorten the helper log_category_str() to log_cat().
> Going forwards, this will be used at multiple places with
> dev_dbg().
>=20
> No functiional changes intended in this patch.

s/functiional/functional/

But if we're replacing this like this - maybe we don't need a log_cat -
would it make more sense to just make the VCHIQ_CORE VCHIQ_SUSPEND etc
just a #define "vchiq_core" ... and remove the indirection? Are they
used as enum's anywhere now still?

--
Kieran


>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> ---
>  .../vc04_services/interface/vchiq_arm/vchiq_core.h     | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core=
.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> index 161358db457c..cc7bb6ca832a 100644
> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.h
> @@ -39,7 +39,7 @@ enum vchiq_log_category {
>         VCHIQ_SUSPEND,
>  };
> =20
> -static inline const char *log_category_str(enum vchiq_log_category c)
> +static inline const char *log_cat(enum vchiq_log_category c)
>  {
>         static const char * const strings[] =3D {
>                 "vchiq_arm",
> @@ -54,19 +54,19 @@ static inline const char *log_category_str(enum vchiq=
_log_category c)
> =20
>  #ifndef vchiq_log_error
>  #define vchiq_log_error(dev, cat, fmt, ...) \
> -       do { dev_dbg(dev, "%s error: " fmt, log_category_str(cat), ##__VA=
_ARGS__); } while (0)
> +       do { dev_dbg(dev, "%s error: " fmt, log_cat(cat), ##__VA_ARGS__);=
 } while (0)
>  #endif
>  #ifndef vchiq_log_warning
>  #define vchiq_log_warning(dev, cat, fmt, ...) \
> -       do { dev_dbg(dev, "%s warning: " fmt, log_category_str(cat), ##__=
VA_ARGS__); } while (0)
> +       do { dev_dbg(dev, "%s warning: " fmt, log_cat(cat), ##__VA_ARGS__=
); } while (0)
>  #endif
>  #ifndef vchiq_log_debug
>  #define vchiq_log_debug(dev, cat, fmt, ...) \
> -       do { dev_dbg(dev, "%s debug: " fmt, log_category_str(cat), ##__VA=
_ARGS__); } while (0)
> +       do { dev_dbg(dev, "%s debug: " fmt, log_cat(cat), ##__VA_ARGS__);=
 } while (0)
>  #endif
>  #ifndef vchiq_log_trace
>  #define vchiq_log_trace(dev, cat, fmt, ...) \
> -       do { dev_dbg(dev, "%s trace: " fmt, log_category_str(cat), ##__VA=
_ARGS__); } while (0)
> +       do { dev_dbg(dev, "%s trace: " fmt, log_cat(cat), ##__VA_ARGS__);=
 } while (0)
>  #endif
> =20
>  #define VCHIQ_SLOT_MASK        (VCHIQ_SLOT_SIZE - 1)
> --=20
> 2.41.0
>
