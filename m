Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 623FE222EB9
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 01:10:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727978AbgGPXJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jul 2020 19:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727924AbgGPXJS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jul 2020 19:09:18 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA04C08C5C0;
        Thu, 16 Jul 2020 15:15:32 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id r19so10094181ljn.12;
        Thu, 16 Jul 2020 15:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eAwIkPyGRUgApnVYvVLaSdADuY78qMkOmqrSvqmkl20=;
        b=LAQbNh7NmT/gFhimUxyw5ZGRQQPFka8kfWkWZ/13Zs0jGlt8g7n/YREo/Ej5h5gREy
         mZNdEeOQxOaWfYMMJPIMIh65ZZoWo7tnaE9IxEdUZWcuhaojWDzKAprj8408srQcws1S
         qbcvFagW4PQe0uGjn9UHZjfKHMITcMv2EKkwAGGo88l8SIP8dCzGsS2EmRQ0i0Oci/vt
         Hrkko6GsjXZubG//UV1cPygmiAVRq+wdhtAwBjfcyAb1vFKriQchzlKlOGnxmfHeCPn0
         3E69kmT0cdyApfYm352XihN/jTSKXSlpcUsoCOo8CFjAxCGfnCIrMgfOAW/ADCEL1RcC
         sMlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eAwIkPyGRUgApnVYvVLaSdADuY78qMkOmqrSvqmkl20=;
        b=fQ9VN+t/G0lg16Tff6Dqwm2MwDtd+3nohnkCrr870LE3n/pBu3sJ6FjO9gjBlJkLHi
         OkqWwaZoTSL1UhJmnKmyuWI2tPBRlEx1eW62f2e1BizV9AMg+nHQUTM4HcnEpW5QUfn0
         n+FkxReU4u1/YSA3yNjVMM4I+M07LRSL2xU1xUi/L+M/G51zwWw4nJsIRiXgXHKZdVDU
         hnqCMppJjJg4ElWCZg95nVzrw7sQcILo+VGe+TMxLEzRrP76xHIKQzWY3cavKxqVMeD1
         ght/cggbIqXsraNGAmeLdZZ2ABH2QUV06n0EBnNE/KOr+b7Q0EiDu3YuYbmJ355KdD7p
         p0ww==
X-Gm-Message-State: AOAM530FtP8Fu1aS6aRXCcnq/8/aY/IiRUv65dot71GcgonA4Y3xzN3i
        8Cqn3ujmerPpC2n6Dit3mY4=
X-Google-Smtp-Source: ABdhPJxZvNPGfpO07YopV8dSHfqBMO8bb1OJ3xLYJKxNAyXnhy7QbpQmHA95ZZqu+EeeVzu+uB1xbw==
X-Received: by 2002:a2e:87d9:: with SMTP id v25mr2773239ljj.53.1594937730746;
        Thu, 16 Jul 2020 15:15:30 -0700 (PDT)
Received: from z50.localnet (93-181-165-181.internetia.net.pl. [93.181.165.181])
        by smtp.gmail.com with ESMTPSA id 190sm1295476ljf.38.2020.07.16.15.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 15:15:29 -0700 (PDT)
From:   Janusz Krzysztofik <jmkrzyszt@gmail.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Subject: Re: [PATCH v7 01/10] media: v4l2-subdev: Introduce [get|set]_mbus_config pad ops
Date:   Fri, 17 Jul 2020 00:15:27 +0200
Message-ID: <4042930.ejJDZkT8p0@z50>
In-Reply-To: <20200716142713.110655-2-jacopo+renesas@jmondi.org>
References: <20200716142713.110655-1-jacopo+renesas@jmondi.org> <20200716142713.110655-2-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On Thursday, July 16, 2020 4:27:04 P.M. CEST Jacopo Mondi wrote:
> Introduce two new pad operations to allow retrieving and configuring the
> media bus parameters on a subdevice pad.
> 
> The newly introduced operations aims to replace the s/g_mbus_config video
> operations, which have been on their way for deprecation since a long
> time.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index f7fe78a6f65a..d8b9d5735307 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
>   *
>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>   *                  may be adjusted by the subdev driver to device capabilities.
> + *
> + * @get_mbus_config: get the media bus configuration of a remote sub-device.
> + *		     The media bus configuration is usually retrieved from the
> + *		     firmware interface at sub-device probe time, immediately
> + *		     applied to the hardware and eventually adjusted by the
> + *		     driver. Remote sub-devices (usually video receivers) shall
> + *		     use this operation to query the transmitting end bus
> + *		     configuration in order to adjust their own one accordingly.
> + *		     Callers should make sure they get the most up-to-date as
> + *		     possible configuration from the remote end, likely calling
> + *		     this operation as close as possible to stream on time. The
> + *		     operation shall fail if the pad index it has been called on
> + *		     is not valid.
> + *
> + * @set_mbus_config: set the media bus configuration of a remote sub-device.
> + *		     This operations is intended to allow, in combination with
> + *		     the get_mbus_config operation, the negotiation of media bus
> + *		     configuration parameters between media sub-devices. The
> + *		     operation shall not fail if the requested configuration is
> + *		     not supported, but the driver shall update the content of
> + *		     the %config argument to reflect what has been actually
> + *		     applied to the hardware. The operation shall fail if the
> + *		     pad index it has been called on is not valid.

Could this description also clarify what results are expected in case of 
hardware errors?  The ov6650 implementation you propose may suggest such
errors may be expected to be ignored silently as long as current configuration 
can be successfully obtained from hardware and passed back to the caller.

Moreover, since validity of the pad argument is expected to be verified, I 
think this should be handled by the media infrastructure layer with the 
drivers/media/v4l2-core/v4l2-subdev.c:check_pad() helper called from a 
.set_mbus_config() wrapper added to v4l2_subdev_call_pad_wrappers, freeing 
drivers from reimplementing it.

Thanks,
Janusz

>   */
>  struct v4l2_subdev_pad_ops {
>  	int (*init_cfg)(struct v4l2_subdev *sd,
> @@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
>  			      struct v4l2_mbus_frame_desc *fd);
>  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
>  			      struct v4l2_mbus_frame_desc *fd);
> +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_config *config);
> +	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
> +			       struct v4l2_mbus_config *config);
>  };
>  
>  /**
> 




