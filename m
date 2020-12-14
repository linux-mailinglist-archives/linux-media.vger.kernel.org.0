Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA34A2D97B7
	for <lists+linux-media@lfdr.de>; Mon, 14 Dec 2020 12:55:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395526AbgLNLy0 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 14 Dec 2020 06:54:26 -0500
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:36146 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729823AbgLNLyR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Dec 2020 06:54:17 -0500
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-28-pcqbKM3nOPiSyxuchKKX0Q-1; Mon, 14 Dec 2020 11:49:55 +0000
X-MC-Unique: pcqbKM3nOPiSyxuchKKX0Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Mon, 14 Dec 2020 11:49:56 +0000
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Mon, 14 Dec 2020 11:49:56 +0000
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
Subject: RE: [PATCH v2 09/12] media: atomisp: Fix PARENTHESIS_ALIGNMENT
Thread-Topic: [PATCH v2 09/12] media: atomisp: Fix PARENTHESIS_ALIGNMENT
Thread-Index: AQHW0goctJOh4lWyOEi+CvaY+Uu+CKn2ej6g
Date:   Mon, 14 Dec 2020 11:49:56 +0000
Message-ID: <61d5f8315efc42238a5516b1dc496760@AcuMS.aculab.com>
References: <20201214110358.7102-10-Philipp.Gerlesberger@fau.de>
In-Reply-To: <20201214110358.7102-10-Philipp.Gerlesberger@fau.de>
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
> Sent: 14 December 2020 11:04
> 
> You can sum up the two lines, because the maximum line length of
> 100 columns is not exceeded.

IIRC the 80 column limit is preferred.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

