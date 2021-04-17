Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C24E5363282
	for <lists+linux-media@lfdr.de>; Sat, 17 Apr 2021 23:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237142AbhDQVcD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Sat, 17 Apr 2021 17:32:03 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151]:57098 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237090AbhDQVcC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 17:32:02 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-220-berY7wNPPR-CGAsjwcAdkw-1; Sat, 17 Apr 2021 22:31:33 +0100
X-MC-Unique: berY7wNPPR-CGAsjwcAdkw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Sat, 17 Apr 2021 22:31:32 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.015; Sat, 17 Apr 2021 22:31:32 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Mauro Carvalho Chehab' <mchehab@kernel.org>,
        Ashish Kalra <eashishkalra@gmail.com>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] media: atomisp: silence "dubious: !x | !y" warning
Thread-Topic: [PATCH] media: atomisp: silence "dubious: !x | !y" warning
Thread-Index: AQHXM7teiyJWcTifxUyFg0sAh0Hgi6q5OhAg
Date:   Sat, 17 Apr 2021 21:31:32 +0000
Message-ID: <509f019decae433cab6cb367cdfa6fa9@AcuMS.aculab.com>
References: <20210417153627.GA50228@ashish-NUC8i5BEH>
 <20210417205613.5c1aac74@coco.lan>
In-Reply-To: <20210417205613.5c1aac74@coco.lan>
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
> Sent: 17 April 2021 19:56
> 
> Em Sat, 17 Apr 2021 21:06:27 +0530
> Ashish Kalra <eashishkalra@gmail.com> escreveu:
> 
> > Upon running sparse, "warning: dubious: !x | !y" is brought to notice
> > for this file.  Logical and bitwise OR are basically the same in this
> > context so it doesn't cause a runtime bug.  But let's change it to
> > logical OR to make it cleaner and silence the Sparse warning.

The old code is very likely to by slightly more efficient.

It may not matter here, but it might in a really hot path.

Since !x | !y and !x || !y always have the same value
why is sparse complaining at all.

	David

> >
> > Signed-off-by: Ashish Kalra <eashishkalra@gmail.com>
> > ---
> >  .../media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c    | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > index 358cb7d2cd4c..3b850bb2d39d 100644
> > --- a/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > +++ b/drivers/staging/media/atomisp/pci/isp/kernels/vf/vf_1.0/ia_css_vf.host.c
> > @@ -58,7 +58,7 @@ sh_css_vf_downscale_log2(
> >  	unsigned int ds_log2 = 0;
> >  	unsigned int out_width;
> >
> > -	if ((!out_info) | (!vf_info))
> > +	if ((!out_info) || (!vf_info))
> 
> 
> While here, please get rid of the unneeded parenthesis:
> 
> 	if (!out_info || !vf_info)
> 
> 
> >  		return -EINVAL;
> >
> >  	out_width = out_info->res.width;
> 
> 
> 
> Thanks,
> Mauro

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

