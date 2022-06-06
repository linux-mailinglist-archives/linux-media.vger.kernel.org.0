Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCC6853ECC7
	for <lists+linux-media@lfdr.de>; Mon,  6 Jun 2022 19:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbiFFROX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jun 2022 13:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229832AbiFFRNs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jun 2022 13:13:48 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91D41400E
        for <linux-media@vger.kernel.org>; Mon,  6 Jun 2022 10:04:43 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id a15so12170405wrh.2
        for <linux-media@vger.kernel.org>; Mon, 06 Jun 2022 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=1rZZdcuUtX2PH9sQep7U7WCnkpRlhErX3EQZPA1VVxY=;
        b=FyMmYYv39NVxKsVfTihCJK+GwuE3DS1JnmzWLgcrqKTGsms5OMaWqx8Wb8QjQnwqNx
         FL2iKyIjDc5uBD8hjRhsaE2fHUbHf7g6pWj1ZY8pp8YKxw+A65SexY2bOLgeZoBagPWR
         hyV08Er4bCpvaqEfjQVuZOG/CkTn4ri2+L5Xw7ShUVg24kCI2nWV5mWm6om9jHWJlwi1
         YnFzfClfh6yG/w2bmXB9XJB2txGQC/50s8Xjcr4JFcf8+2Gqr5YcY0JoggQX2m/IM7yO
         bpX0Dg68aqXwt8uXq8m/TeNOQ1/opHcmLWJdXCGgKUu+kuKs/ja79EWmLTTSB2tIaY1D
         09Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=1rZZdcuUtX2PH9sQep7U7WCnkpRlhErX3EQZPA1VVxY=;
        b=XDJPjlSJ07Xh5AFtXFb1OZJggLc9Vhi3+NyhvJw56QoskKVt+LwHSmrxyzqBHqKQTo
         q8AdrinpBHoflOTM0gP0Yv7+uaSG/9n8FsX5nmBZk8rF0eUo96snRAsuLBQJBId4tnNO
         8DH1GwjbmcZL/EzWbfHsR7oYVaweoBu1Zedb4zJJAHKuUQ99JVj415Q+Guc+HTTA7v3Y
         ixTHwFOU4sejqzdH9q5fkQuTjxp1JpVBeHXX2DdUVlxmpH912h62moar+BvOZPGVVQVc
         0xnQvUurPZc91IwMB1DzCLvncF28Uk3GYx3zq6cQ8glfeTBWzLrHQXE22J9ErdoMZCBP
         9Cww==
X-Gm-Message-State: AOAM531NpLWWZfmrfmrTkZSfCN7SxJt/giJDKp9+XRn8K5pUGdBKTdpx
        UImQshTbeIACzcUCxjp39gLkb2p7LI4=
X-Google-Smtp-Source: ABdhPJzcm3TCvxQW4xhXldsUO+tPFFNdAe+gq9zQAqlj9hym6Sje5l8rT0iblxbAFIy17xNQ+M82gA==
X-Received: by 2002:a5d:6103:0:b0:217:d24:f07c with SMTP id v3-20020a5d6103000000b002170d24f07cmr10699766wrt.0.1654535082277;
        Mon, 06 Jun 2022 10:04:42 -0700 (PDT)
Received: from [192.168.0.14] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net. [86.13.91.161])
        by smtp.gmail.com with ESMTPSA id o7-20020a5d62c7000000b0020fe86d340fsm15800421wrv.55.2022.06.06.10.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jun 2022 10:04:41 -0700 (PDT)
Message-ID: <d0a7b646-deae-1c05-5833-eaf2394956d8@gmail.com>
Date:   Mon, 6 Jun 2022 18:04:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] media: ipu3-cio2: Move functionality from .complete() to
 .bound()
Content-Language: en-US
From:   Daniel Scally <djrscally@gmail.com>
To:     linux-media@vger.kernel.org
Cc:     yong.zhi@intel.com, sakari.ailus@linux.intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com
References: <20220506211555.1364864-1-djrscally@gmail.com>
In-Reply-To: <20220506211555.1364864-1-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello all

On 06/05/2022 22:15, Daniel Scally wrote:
> Creating links and registering subdev nodes during the .complete()
> callback has the unfortunate effect of preventing all cameras that
> connect to a notifier from working if any one of their drivers fails
> to probe. Moving the functionality from .complete() to .bound() allows
> those camera sensor drivers that did probe correctly to work regardless.
>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>
> This results in v4l2_device_register_subdev_nodes() being called multiple times
> but since it's a no-op where the devnode exists already, I think that it's ok.


There ended up being a problem with this. If a camera sensor driver
registers a notifier via v4l2_async_register_subdev_sensor(), the
devnodes for any device that bound to that notifier (a lens controller
for example) would be created where v4l2_device_register_subdev_nodes()
is called by the ipu3-cio2 driver's .complete() callback. This is
because it won't be called until the lens controller's driver has
probed. On the other hand, if the lens controller's driver probes late
(after all the camera sensor drivers) then its devnodes _won't_ be
created because it'll miss the calls to
v4l2_device_register_subdev_nodes() when ipu3-cio2's .bound() is
triggered as their drivers probe. The effect of this is that we still
need a call to v4l2_device_register_subdev_nodes() in .complete() to
make sure we catch anything that's bound to a notifier registered by one
of the camera sensor drivers. This kinda defeats the purpose of the
patch as if an ISP has one sensor linked to a lens controller and one
one sensor without a lens controller, failure during probe of the driver
for the lens-less sensor will mean .complete() is never called, and so
the devnodes for the lens controller won't get created, and so the
sensor with a lens won't work properly anyway.


So - more thought needed on this I think. I still think it's the right
approach to refactor such that a failure in one sensor driver's probe
does not prevent any other sensors present from working provided _they_
probe correctly, but I'm not sure the best way to achieve it now.



>
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 65 +++++++------------
>  1 file changed, 23 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 93cc0577b6db..6a1bcb20725d 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1387,7 +1387,10 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
>  {
>  	struct cio2_device *cio2 = to_cio2_device(notifier);
>  	struct sensor_async_subdev *s_asd = to_sensor_asd(asd);
> +	struct device *dev = &cio2->pci_dev->dev;
>  	struct cio2_queue *q;
> +	unsigned int pad;
> +	int ret;
>  
>  	if (cio2->queue[s_asd->csi2.port].sensor)
>  		return -EBUSY;
> @@ -1398,7 +1401,26 @@ static int cio2_notifier_bound(struct v4l2_async_notifier *notifier,
>  	q->sensor = sd;
>  	q->csi_rx_base = cio2->base + CIO2_REG_PIPE_BASE(q->csi2.port);
>  
> -	return 0;
> +	for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
> +		if (q->sensor->entity.pads[pad].flags &
> +					MEDIA_PAD_FL_SOURCE)
> +			break;
> +
> +	if (pad == q->sensor->entity.num_pads) {
> +		dev_err(dev, "failed to find src pad for %s\n",
> +			q->sensor->name);
> +		return -ENXIO;
> +	}
> +
> +	ret = media_create_pad_link(&q->sensor->entity, pad, &q->subdev.entity,
> +				    CIO2_PAD_SINK, 0);
> +	if (ret) {
> +		dev_err(dev, "failed to create link for %s\n",
> +			q->sensor->name);
> +		return ret;
> +	}
> +
> +	return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
>  }
>  
>  /* The .unbind callback */
> @@ -1412,50 +1434,9 @@ static void cio2_notifier_unbind(struct v4l2_async_notifier *notifier,
>  	cio2->queue[s_asd->csi2.port].sensor = NULL;
>  }
>  
> -/* .complete() is called after all subdevices have been located */
> -static int cio2_notifier_complete(struct v4l2_async_notifier *notifier)
> -{
> -	struct cio2_device *cio2 = to_cio2_device(notifier);
> -	struct device *dev = &cio2->pci_dev->dev;
> -	struct sensor_async_subdev *s_asd;
> -	struct v4l2_async_subdev *asd;
> -	struct cio2_queue *q;
> -	unsigned int pad;
> -	int ret;
> -
> -	list_for_each_entry(asd, &cio2->notifier.asd_list, asd_list) {
> -		s_asd = to_sensor_asd(asd);
> -		q = &cio2->queue[s_asd->csi2.port];
> -
> -		for (pad = 0; pad < q->sensor->entity.num_pads; pad++)
> -			if (q->sensor->entity.pads[pad].flags &
> -						MEDIA_PAD_FL_SOURCE)
> -				break;
> -
> -		if (pad == q->sensor->entity.num_pads) {
> -			dev_err(dev, "failed to find src pad for %s\n",
> -				q->sensor->name);
> -			return -ENXIO;
> -		}
> -
> -		ret = media_create_pad_link(
> -				&q->sensor->entity, pad,
> -				&q->subdev.entity, CIO2_PAD_SINK,
> -				0);
> -		if (ret) {
> -			dev_err(dev, "failed to create link for %s\n",
> -				q->sensor->name);
> -			return ret;
> -		}
> -	}
> -
> -	return v4l2_device_register_subdev_nodes(&cio2->v4l2_dev);
> -}
> -
>  static const struct v4l2_async_notifier_operations cio2_async_ops = {
>  	.bound = cio2_notifier_bound,
>  	.unbind = cio2_notifier_unbind,
> -	.complete = cio2_notifier_complete,
>  };
>  
>  static int cio2_parse_firmware(struct cio2_device *cio2)
