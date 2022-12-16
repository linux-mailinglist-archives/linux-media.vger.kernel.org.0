Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D98A64E8BD
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 10:40:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbiLPJkg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 04:40:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiLPJk2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 04:40:28 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7FE24874F
        for <linux-media@vger.kernel.org>; Fri, 16 Dec 2022 01:40:19 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F94BFB;
        Fri, 16 Dec 2022 10:40:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671183617;
        bh=FvZVwmXzi6ltNVFw9b8mogAIT1jOcSK+27ba/fna32Q=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=iRHKrow/u1d75ZE07VRoM9pf4Q98e4TuO9fJBDJNuq+weQn+Kxk6MVuMAtd2MIJ7A
         HvMtvW5rlGvB+wpKuMkI2hEAlMJxCNLBi7ZHZ89yNzPoIcrV4IOnnoIOTkVwtezzh6
         M0apHV8+XuHIPW2igqLebz17MOhvNPohrwFzTnu0=
Message-ID: <a27466b4-60a1-6589-1f3c-1e11d321a2a9@ideasonboard.com>
Date:   Fri, 16 Dec 2022 09:40:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v10 09/11] media: v4l2: document the usage of min/max for
 V4L2_CTRL_TYPE_RECT
Content-Language: en-US
To:     Yunke Cao <yunkec@google.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
References: <20221109060621.704531-1-yunkec@google.com>
 <20221109060621.704531-10-yunkec@google.com>
From:   Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20221109060621.704531-10-yunkec@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Yunke

On 09/11/2022 06:06, Yunke Cao wrote:
> Document the default implementation of min/max for rectangle controls.
>
> Signed-off-by: Yunke Cao <yunkec@google.com>


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

> ---
> Changelog since v9:
> - No change.
> Changelog since v8:
> - New patch.
>
>   Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> index 58982cd382e3..efa07428ba7a 100644
> --- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> @@ -447,7 +447,11 @@ See also the examples in :ref:`control`.
>         - n/a
>         - A struct :c:type:`v4l2_rect`, containing a rectangle described by
>   	the position of its top-left corner, the width and the height. Units
> -	depend on the use case.
> +	depend on the use case. Use ``V4L2_CTRL_WHICH_MIN_VAL`` and
> +	``V4L2_CTRL_WHICH_MAX_VAL`` to query the range of rectangle sizes. The
> +	top-left corner of the minimum and maximum rectangles should be the
> +	same. For example, a control can have a minimum rectangle of 1x1@0x0 and
> +	a maximum of 640x480@0x0.
>       * - ``V4L2_CTRL_TYPE_H264_SPS``
>         - n/a
>         - n/a
