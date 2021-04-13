Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F08135DC7D
	for <lists+linux-media@lfdr.de>; Tue, 13 Apr 2021 12:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245219AbhDMKc3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 13 Apr 2021 06:32:29 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:33960 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S245194AbhDMKc2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 13 Apr 2021 06:32:28 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-111-z87EccfoNGWB0XIN9fdlag-1; Tue, 13 Apr 2021 11:32:06 +0100
X-MC-Unique: z87EccfoNGWB0XIN9fdlag-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 11:32:05 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 11:32:05 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     "'sakari.ailus@linux.intel.com'" <sakari.ailus@linux.intel.com>
CC:     'Mitali Borkar' <mitaliborkar810@gmail.com>,
        "bingbu.cao@intel.com" <bingbu.cao@intel.com>,
        "tian.shu.qiu@intel.com" <tian.shu.qiu@intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "outreachy-kernel@googlegroups.com" 
        <outreachy-kernel@googlegroups.com>,
        "mitali_s@me.iitr.ac.in" <mitali_s@me.iitr.ac.in>
Subject: RE: [PATCH 2/6] staging: media: intel-ipu3: preferred __aligned(size)
 over __attribute__aligned(size)
Thread-Topic: [PATCH 2/6] staging: media: intel-ipu3: preferred
 __aligned(size) over __attribute__aligned(size)
Thread-Index: AQHXLyewN18t7A08NkSuo10kWluH2aqyET/AgAAWMYCAABkZMA==
Date:   Tue, 13 Apr 2021 10:32:05 +0000
Message-ID: <249c86809f374e13ac0be28c279eae7e@AcuMS.aculab.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <f618f1fe2d13417ebed185da392fb48811593a9f.1618180660.git.mitaliborkar810@gmail.com>
 <277be5f4da82449aaf0a635b60ad0728@AcuMS.aculab.com>
 <20210413095621.GQ3@paasikivi.fi.intel.com>
In-Reply-To: <20210413095621.GQ3@paasikivi.fi.intel.com>
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

From: sakari.ailus@linux.intel.com
> Sent: 13 April 2021 10:56
> 
> Hi David,
> 
> On Tue, Apr 13, 2021 at 07:40:12AM +0000, David Laight wrote:
> > From: Mitali Borkar
> > > Sent: 12 April 2021 00:09
> > >
> > > This patch fixes the warning identified by checkpatch.pl by replacing
> > > __attribute__aligned(size) with __aligned(size)
> > >
> > > Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> > > ---
> > >  .../staging/media/ipu3/include/intel-ipu3.h   | 74 +++++++++----------
> > >  1 file changed, 37 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > index 589d5ccee3a7..d95ca9ebfafb 100644
> > > --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> > > @@ -84,7 +84,7 @@ struct ipu3_uapi_grid_config {
> > >   */
> > >  struct ipu3_uapi_awb_raw_buffer {
> > >  	__u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
> > > -		__attribute__((aligned(32)));
> > > +		__aligned(32);
> > >  } __packed;
> >
> > WTF?
> >
> > It either has 1-byte alignment because it is just __u8,
> > 32-byte because of the aligned(32),
> > or 1 byte because of the outer packed.
> >
> > What alignment does this (and all the other) structures
> > actually need?
> 
> 32 as noted above. Here packed makes no difference though.

Bollocks - it ought to override the __aligned(32);


> Some of these structs are used embedded in other structs or alone. I
> haven't checked this one.
> 
> It's also possible to have __packed and __aligned() conflict (in which case
> a decent compiler would give you a warning) --- which does not happen
> currently AFAIK.

At least one compiler is objecting to some similar constructs.

> >
> > Specifying 'packed' isn't free.
> 
> It may be free if the packed alignment of the fields corresponds to
> architecture's packing. Here __aligned() is used to satisfy
> hardware alignment requirements and __packed is used to ensure the same
> memory layout independently of ABI rules.

No that isn't what packed is for.
'packed' also tells the compiler that the structure may 'exist' at
an unaligned address.
On many architectures this requires the compiler use byte sized
access and shifts for all members.

If you are worried that the compiler/ABI might have inserted
padding then add a compile-time assert on the structure size.
But most kernel code assumes that structures where everything
is on its natural boundary won't have any padding.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

