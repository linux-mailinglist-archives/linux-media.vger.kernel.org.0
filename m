Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56D2AA52FC
	for <lists+linux-media@lfdr.de>; Mon,  2 Sep 2019 11:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731201AbfIBJjF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 Sep 2019 05:39:05 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55428 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729690AbfIBJjF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 Sep 2019 05:39:05 -0400
Received: by mail-wm1-f65.google.com with SMTP id g207so9797063wmg.5;
        Mon, 02 Sep 2019 02:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=references:user-agent:from:to:cc:subject:in-reply-to:date
         :message-id:mime-version;
        bh=TuI9rd12MfxFCijDCnxps6RQxMfXZ9+gpL/KNKqGJec=;
        b=MvNFZ1/jbfE4vo5KXjxBEUkydGqOUTy8/La+RmqGYg5z2JPMO4Qd0g2/1gppakerEf
         R+9Sj7AHvlz/9wAfHYLgtAfERiRSR9JjQa7RSa0vIohbKMR7hJPH87Bgf/jVqZ8nCo2a
         l71eHN00Xhi7Dnp4J/12HU59pZXlaoSB6fYGx6pWRC6n+SU6CM82+HEnH4AVywthNWtI
         zG6kcdf3TtKfKoFTLPdQ8PY/9oi24mzPlTBu1oytWaJG7bv8p7JTIL2cXqRivwJuRva4
         FfZdqgg24TrobN/IjD4hgTjIitilPnkaWpFgJGp7C1epJ8tFPCy0C2MvvdFI4kMzRgnK
         stkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:date:message-id:mime-version;
        bh=TuI9rd12MfxFCijDCnxps6RQxMfXZ9+gpL/KNKqGJec=;
        b=lMAqDzdhs2YrajgO95Na1tfpZM5sn2M1J4QACHn3tYe6b5y1VxJkVTqFn/JiWGWOOi
         W4Dt+3cRncYPLKQAhURwU/iYy4WC5BoN4YRYvad8pFHW8nkxz6E+Mi/jXKMuk8eF4owH
         Zi2Myrq+KmkMaDDW4sUfSm0gb3Xp4SJ3bVq4A8LbzFbQLk6orU4Ogj8O1X6Enn9gW6qA
         6PRmOA624L3a9yo2undCiCLes7vBG99se4dXD2AUYWa8j98WZXdXQEgpGpeqxUF1tLs9
         D1VYG/o/MS8OcMRezv0QwVg7TrikTBoa1wiCr9N+LQz7fNCXAEr5HfgCAxpaB+H/ryNm
         977w==
X-Gm-Message-State: APjAAAVBuSOuSmX54XHj6tL6jWdT9l7Muhb76qJwlBIjn0rkyUNDkQ9s
        ZmldsHGTGvcx/BMc3+WCxhADV/Kvv1U=
X-Google-Smtp-Source: APXvYqxLMl9twPuZRaBPGCt6IQrTMUDpWGDiRa+m+TO/WYNNG1GFTxiKSkMi81n2v/MwR6YMiUQ8ZQ==
X-Received: by 2002:a1c:c909:: with SMTP id f9mr35144152wmb.52.1567417142665;
        Mon, 02 Sep 2019 02:39:02 -0700 (PDT)
Received: from arch-late (87-196-73-69.net.novis.pt. [87.196.73.69])
        by smtp.gmail.com with ESMTPSA id t123sm14100440wma.40.2019.09.02.02.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 02:39:01 -0700 (PDT)
References: <20190805233505.21167-1-slongerbeam@gmail.com> <20190805233505.21167-16-slongerbeam@gmail.com>
User-agent: mu4e 1.2.0; emacs 27.0.50
From:   Rui Miguel Silva <rmfrfs@gmail.com>
To:     Steve Longerbeam <slongerbeam@gmail.com>
Cc:     linux-media@vger.kernel.org,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list\:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
        "moderated list\:ARM\/FREESCALE IMX \/ MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 15/22] media: imx7-media-csi: Create media links in bound notifier
In-reply-to: <20190805233505.21167-16-slongerbeam@gmail.com>
Date:   Mon, 02 Sep 2019 10:38:59 +0100
Message-ID: <m3blw35970.fsf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Steve,
On Tue 06 Aug 2019 at 00:34, Steve Longerbeam wrote:
> Implement a notifier bound op to register media links from the remote
> sub-device's source pad(s) to the CSI sink pad.
>
> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
> ---
>  drivers/staging/media/imx/imx7-media-csi.c | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/staging/media/imx/imx7-media-csi.c b/drivers/staging/media/imx/imx7-media-csi.c
> index a1c96c52a606..f71ac485f780 100644
> --- a/drivers/staging/media/imx/imx7-media-csi.c
> +++ b/drivers/staging/media/imx/imx7-media-csi.c
> @@ -196,6 +196,11 @@ struct imx7_csi {
>  	struct completion last_eof_completion;
>  };
>
> +static inline struct imx7_csi *notifier_to_dev(struct v4l2_async_notifier *n)
>

As the other one add the namespace for the function name:
imx7_csi_notifier_to_dev

other than this, looks good to me.

Cheers,
  Rui
> +{
> +	return container_of(n, struct imx7_csi, notifier);
> +}
> +
>  static u32 imx7_csi_reg_read(struct imx7_csi *csi, unsigned int offset)
>  {
>  	return readl(csi->regbase + offset);
> @@ -1173,6 +1178,23 @@ static int imx7_csi_parse_endpoint(struct device *dev,
>  	return fwnode_device_is_available(asd->match.fwnode) ? 0 : -EINVAL;
>  }
>
> +static int imx7_csi_notify_bound(struct v4l2_async_notifier *notifier,
> +				 struct v4l2_subdev *sd,
> +				 struct v4l2_async_subdev *asd)
> +{
> +	struct imx7_csi *csi = notifier_to_dev(notifier);
> +	struct media_pad *sink = &csi->sd.entity.pads[IMX7_CSI_PAD_SINK];
> +
> +	return media_create_fwnode_pad_links(sink,
> +					     dev_fwnode(csi->sd.dev),
> +					     &sd->entity,
> +					     dev_fwnode(sd->dev), 0);
> +}
> +
> +static const struct v4l2_async_notifier_operations imx7_csi_notify_ops = {
> +	.bound = imx7_csi_notify_bound,
> +};
> +
>  static int imx7_csi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1253,6 +1275,8 @@ static int imx7_csi_probe(struct platform_device *pdev)
>
>  	v4l2_async_notifier_init(&csi->notifier);
>
> +	csi->notifier.ops = &imx7_csi_notify_ops;
> +
>  	ret = v4l2_async_register_fwnode_subdev(&csi->sd, &csi->notifier,
>  						sizeof(struct v4l2_async_subdev),
>  						NULL, 0,

