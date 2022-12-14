Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05FE464C787
	for <lists+linux-media@lfdr.de>; Wed, 14 Dec 2022 11:58:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238103AbiLNK6D (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Dec 2022 05:58:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238137AbiLNK54 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Dec 2022 05:57:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5922B6264;
        Wed, 14 Dec 2022 02:57:52 -0800 (PST)
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A51C949C;
        Wed, 14 Dec 2022 11:57:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671015470;
        bh=xQMAkIqI4vWKV5dcE5QmPLzMqOo+gb/S3H1p742DOzw=;
        h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
        b=jXPhuxyVGPv/nD7paM6mpWbij30f+Av6JIJQjMXcwSlsZIm66H5Js+vnhkoQEmqLE
         jbMAg4JYUw1A5xoTKj6wdSYQM5jClXiomXlqZtBiv8w7fvcL1v1zUmp5LeEtoKccNF
         6VToZQooykq5oKNmmmVySytW6FLQFS2t53ECwFSs=
Message-ID: <65eb32b9-af41-9ae9-0475-33462284594d@ideasonboard.com>
Date:   Wed, 14 Dec 2022 10:57:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        laurent.pinchart@ideasonboard.com
Cc:     gregkh@linuxfoundation.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, linux-usb@vger.kernel.org,
        linux-media@vger.kernel.org, kernel@pengutronix.de
References: <20221212194716.2995569-1-m.grzeschik@pengutronix.de>
From:   Dan Scally <dan.scally@ideasonboard.com>
Subject: Re: [PATCH 0/5] usb: uvc: improve header files and function use
In-Reply-To: <20221212194716.2995569-1-m.grzeschik@pengutronix.de>
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

Hi Michael

On 12/12/2022 19:47, Michael Grzeschik wrote:
> This series is improving the use of the uvc_format_desc
> in v4l2-uvc.h and also reuses the declarative strings from
> v4l_fill_fmtdesc.
>
> Michael Grzeschik (5):
>    usb: uvc: move media/v4l2-uvc.h to usb/uvc.h
>    usb: uvc: move uvc_fmts and uvc_format_by_guid to own compile unit
>    usb: uvc: make uvc_format_desc table const
>    media: v4l2: move v4l_fill_fmtdesc to common v4l2_fill_fmtdesc
>      function
>    usb: uvc: use v4l2_fill_fmtdesc instead of open coded format name


For the set:


Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Tested-by: Daniel Scally <dan.scally@ideasonboard.com>

>
>   drivers/media/common/Kconfig                  |   3 +
>   drivers/media/common/Makefile                 |   1 +
>   drivers/media/common/uvc.c                    | 177 ++++++++++++
>   drivers/media/usb/uvc/Kconfig                 |   1 +
>   drivers/media/usb/uvc/uvc_ctrl.c              |   2 +-
>   drivers/media/usb/uvc/uvc_driver.c            |  12 +-
>   drivers/media/v4l2-core/v4l2-common.c         | 263 +++++++++++++++++
>   drivers/media/v4l2-core/v4l2-ioctl.c          | 264 +-----------------
>   drivers/usb/gadget/Kconfig                    |   1 +
>   drivers/usb/gadget/function/uvc_v4l2.c        |  16 +-
>   include/{media/v4l2-uvc.h => linux/usb/uvc.h} | 206 +-------------
>   include/media/v4l2-common.h                   |   2 +
>   12 files changed, 466 insertions(+), 482 deletions(-)
>   create mode 100644 drivers/media/common/uvc.c
>   rename include/{media/v4l2-uvc.h => linux/usb/uvc.h} (59%)
>
