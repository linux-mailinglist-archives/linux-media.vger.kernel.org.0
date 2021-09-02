Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 153973FEDA7
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 14:19:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234142AbhIBMUY convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Thu, 2 Sep 2021 08:20:24 -0400
Received: from mx20.baidu.com ([111.202.115.85]:60146 "EHLO baidu.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234098AbhIBMUY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 08:20:24 -0400
Received: from BC-Mail-Ex25.internal.baidu.com (unknown [172.31.51.19])
        by Forcepoint Email with ESMTPS id 0F222B22C10458F716F9;
        Thu,  2 Sep 2021 20:19:23 +0800 (CST)
Received: from BJHW-MAIL-EX27.internal.baidu.com (10.127.64.42) by
 BC-Mail-Ex25.internal.baidu.com (172.31.51.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2242.12; Thu, 2 Sep 2021 20:19:22 +0800
Received: from BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) by
 BJHW-MAIL-EX27.internal.baidu.com ([169.254.58.247]) with mapi id
 15.01.2308.014; Thu, 2 Sep 2021 20:19:22 +0800
From:   "Cai,Huoqing" <caihuoqing@baidu.com>
To:     "Cai,Huoqing" <caihuoqing@baidu.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: RE: [PATCH v3] usb: stkwebcam: Update the reference count of the usb
 device structure
Thread-Topic: [PATCH v3] usb: stkwebcam: Update the reference count of the usb
 device structure
Thread-Index: AQHXny9yBe2iT1uHw0mYSX48IokVQKuQqfuA
Date:   Thu, 2 Sep 2021 12:19:22 +0000
Message-ID: <ddf5d61acbef4c60885cc5372c10a1df@baidu.com>
References: <20210901124650.31653-1-caihuoqing@baidu.com>
In-Reply-To: <20210901124650.31653-1-caihuoqing@baidu.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.18.80.52]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

+Cc Hans Verkuil <hverkuil@xs4all.nl>
Cai
> Subject: [PATCH v3] usb: stkwebcam: Update the reference count of the usb
> device structure
> 
> Use usb_get_dev() to increment the reference count of the usb device
> structure in order to avoid releasing the structure while it is still in
> use. And use usb_put_dev() to decrement the reference count and thus,
> when it will be equal to 0 the structure will be released.
> 
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
> v2->v3:
> *call usb_put_dev() in the error path of stk_camera_probe
> *move v4l2_ctrl_handler_free/v4l2_device_unregister/kfree(dev)
>  from stk_camera_disconnect() to stk_v4l_dev_release()
> 
> drivers/media/usb/stkwebcam/stk-webcam.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c
> b/drivers/media/usb/stkwebcam/stk-webcam.c
> index 0e231e576dc3..9f445e6ab5fa 100644
> --- a/drivers/media/usb/stkwebcam/stk-webcam.c
> +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
> @@ -1234,6 +1234,11 @@ static void stk_v4l_dev_release(struct
> video_device *vd)
>  	if (dev->sio_bufs != NULL || dev->isobufs != NULL)
>  		pr_err("We are leaking memory\n");
>  	usb_put_intf(dev->interface);
> +	usb_put_dev(dev->udev);
> +
> +	v4l2_ctrl_handler_free(&dev->hdl);
> +	v4l2_device_unregister(&dev->v4l2_dev);
> +	kfree(dev);
>  }
> 
>  static const struct video_device stk_v4l_data = {
> @@ -1309,7 +1314,7 @@ static int stk_camera_probe(struct usb_interface
> *interface,
>  	init_waitqueue_head(&dev->wait_frame);
>  	dev->first_init = 1; /* webcam LED management */
> 
> -	dev->udev = udev;
> +	dev->udev = usb_get_dev(udev);
>  	dev->interface = interface;
>  	usb_get_intf(interface);
> 
> @@ -1365,6 +1370,7 @@ static int stk_camera_probe(struct usb_interface
> *interface,
> 
>  error_put:
>  	usb_put_intf(interface);
> +	usb_put_dev(dev->udev);
>  error:
>  	v4l2_ctrl_handler_free(hdl);
>  	v4l2_device_unregister(&dev->v4l2_dev);
> @@ -1385,9 +1391,6 @@ static void stk_camera_disconnect(struct
> usb_interface *interface)
>  		video_device_node_name(&dev->vdev));
> 
>  	video_unregister_device(&dev->vdev);
> -	v4l2_ctrl_handler_free(&dev->hdl);
> -	v4l2_device_unregister(&dev->v4l2_dev);
> -	kfree(dev);
>  }
> 
>  #ifdef CONFIG_PM
> --
> 2.25.1

