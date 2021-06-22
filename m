Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 422753AFEBE
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 10:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbhFVIJe convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 22 Jun 2021 04:09:34 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:41722 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230013AbhFVIJc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 04:09:32 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-17-gw4DaDg8NEqcQhGDvViG-w-1; Tue, 22 Jun 2021 09:07:13 +0100
X-MC-Unique: gw4DaDg8NEqcQhGDvViG-w-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 22 Jun
 2021 09:07:12 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 22 Jun 2021 09:07:12 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Mauro Carvalho Chehab' <mchehab+huawei@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "linuxarm@huawei.com" <linuxarm@huawei.com>,
        "mauro.chehab@huawei.com" <mauro.chehab@huawei.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH v3] media: uvc: don't do DMA on stack
Thread-Topic: [PATCH v3] media: uvc: don't do DMA on stack
Thread-Index: AQHXZqL+Rr1YUDB8sUS3jMuLXE5TdKsfq6kg
Date:   Tue, 22 Jun 2021 08:07:12 +0000
Message-ID: <d33c39aa824044ad8cacc93234f1e1cd@AcuMS.aculab.com>
References: <6832dffafd54a6a95b287c4a1ef30250d6b9237a.1624282817.git.mchehab+huawei@kernel.org>
In-Reply-To: <6832dffafd54a6a95b287c4a1ef30250d6b9237a.1624282817.git.mchehab+huawei@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Mauro Carvalho Chehab
> Sent: 21 June 2021 14:40
> 
> As warned by smatch:
> 	drivers/media/usb/uvc/uvc_v4l2.c:911 uvc_ioctl_g_input() error: doing dma on the stack (&i)
> 	drivers/media/usb/uvc/uvc_v4l2.c:943 uvc_ioctl_s_input() error: doing dma on the stack (&i)
> 
> those two functions call uvc_query_ctrl passing a pointer to
> a data at the DMA stack. those are used to send URBs via
> usb_control_msg(). Using DMA stack is not supported and should
> not work anymore on modern Linux versions.
> 
> So, use a kmalloc'ed buffer.
...
> +	buf = kmalloc(1, GFP_KERNEL);
> +	if (!buf)
> +		return -ENOMEM;
> +
>  	ret = uvc_query_ctrl(chain->dev, UVC_GET_CUR, chain->selector->id,
>  			     chain->dev->intfnum,  UVC_SU_INPUT_SELECT_CONTROL,
> -			     &i, 1);
> +			     buf, 1);

Thought...

Is kmalloc(1, GFP_KERNEL) guaranteed to return a pointer into
a cache line that will not be accessed by any other code?
(This is slightly weaker than requiring a cache-line aligned
pointer - but very similar.)

Without that guarantee you can't use the returned buffer for
read dma unless the memory accesses are coherent.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

