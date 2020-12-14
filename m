Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E6F2D97BA
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:55:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407770AbgLNLyz convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 14 Dec 2020 06:54:55 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:46864 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2404511AbgLNLyn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:54:43 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-57-NlvEctBAMaCvCybvQIbvtA-1; Mon, 14 Dec 2020 11:53:03 +0000
X-MC-Unique: NlvEctBAMaCvCybvQIbvtA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 14 Dec 2020 11:53:04 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 14 Dec 2020 11:53:04 +0000
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Philipp Gerlesberger' <Philipp.Gerlesberger@fau.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "ij72uhux@stud.informatik.uni-erlangen.de" 
        <ij72uhux@stud.informatik.uni-erlangen.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
        "linux-kernel@i4.cs.fau.de" <linux-kernel@i4.cs.fau.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>
Subject: RE: [PATCH v2 12/12] media: atomisp: Fix LOGICAL_CONTINUATIONS
Thread-Topic: [PATCH v2 12/12] media: atomisp: Fix LOGICAL_CONTINUATIONS
Thread-Index: AQHW0gocnJO7wsTYYEGwNcWFQ1O+9qn2emzA
Date:   Mon, 14 Dec 2020 11:53:04 +0000
Message-ID: <4eef67d66b0b48feba474906431daa30@AcuMS.aculab.com>
References: <20201214110156.6152-1-Philipp.Gerlesberger@fau.de>
 <20201214110156.6152-13-Philipp.Gerlesberger@fau.de>
In-Reply-To: <20201214110156.6152-13-Philipp.Gerlesberger@fau.de>
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

From: Philipp Gerlesberger
> Sent: 14 December 2020 11:02
>
> Logical continuations should be on the previous line
> 
> Co-developed-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
> Signed-off-by: Andrey Khlopkov <ij72uhux@stud.informatik.uni-erlangen.de>
> Signed-off-by: Philipp Gerlesberger <Philipp.Gerlesberger@fau.de>
> ---
>  drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> index 2f1c2df59f71..7d44070c7114 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
> @@ -24,8 +24,8 @@
>   *****************************************************************************/
>  int ia_css_queue_local_init(ia_css_queue_t *qhandle, ia_css_queue_local_t *desc)
>  {
> -	if (NULL == qhandle || NULL == desc
> -	    || NULL == desc->cb_elems || NULL == desc->cb_desc) {
> +	if (NULL == qhandle || NULL == desc ||
> +	    NULL == desc->cb_elems || NULL == desc->cb_desc) {
>  		/* Invalid parameters, return error*/
>  		return -EINVAL;

Get rid of the obnoxious backwards tests and it probably fits in 80 columns.

	if (!qhandle || !desc || !desc->cb_elems || !desc->desc) {
		...

OTOH if it isn't expected that any of these might be NULL just delete
the test.
If they ever are 'accidentally' NULL it is usually easier to debug
the NULL pointer dereference than an obscure error return.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

