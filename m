Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1AEE35D91D
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 09:40:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238673AbhDMHkl convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 13 Apr 2021 03:40:41 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:53776 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229937AbhDMHki (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 03:40:38 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-221-ecZ__soQOzqGJyvfJqYHXQ-1; Tue, 13 Apr 2021 08:40:13 +0100
X-MC-Unique: ecZ__soQOzqGJyvfJqYHXQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 08:40:12 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 08:40:12 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Mitali Borkar' <mitaliborkar810@gmail.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
        "tian.shu.qiu@intel.com" <tian.shu.qiu@intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "outreachy-kernel@googlegroups.com" 
        <outreachy-kernel@googlegroups.com>,
        "mitali_s@me.iitr.ac.in" <mitali_s@me.iitr.ac.in>
Subject: RE: [PATCH 2/6] staging: media: intel-ipu3: preferred __aligned(size)
 over __attribute__aligned(size)
Thread-Topic: [PATCH 2/6] staging: media: intel-ipu3: preferred
 __aligned(size) over __attribute__aligned(size)
Thread-Index: AQHXLyewN18t7A08NkSuo10kWluH2aqyET/A
Date:   Tue, 13 Apr 2021 07:40:12 +0000
Message-ID: <277be5f4da82449aaf0a635b60ad0728@AcuMS.aculab.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
In-Reply-To: <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
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

From: Mitali Borkar
> Sent: 12 April 2021 00:09
> 
> This patch fixes the warning identified by checkpatch.pl by replacing
> __attribute__aligned(size) with __aligned(size)
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  .../staging/media/ipu3/include/intel-ipu3.h   | 74 +++++++++----------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h
> b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index 589d5ccee3a7..d95ca9ebfafb 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -84,7 +84,7 @@ struct ipu3_uapi_grid_config {
>   */
>  struct ipu3_uapi_awb_raw_buffer {
>  	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
> -		__attribute__((aligned(32)));
> +		__aligned(32);
>  } __packed;

WTF?

It either has 1-byte alignment because it is just __u8,
32-byte because of the aligned(32),
or 1 byte because of the outer packed.

What alignment does this (and all the other) structures
actually need?

Specifying 'packed' isn't free.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

