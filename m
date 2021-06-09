Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB94A3A1A63
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 18:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232563AbhFIQFD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 9 Jun 2021 12:05:03 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:46546 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231704AbhFIQFC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 9 Jun 2021 12:05:02 -0400
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mtapsc-5-2Yu2ruzTMluBmPssrWHMwQ-1; Wed, 09 Jun 2021 17:03:04 +0100
X-MC-Unique: 2Yu2ruzTMluBmPssrWHMwQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Wed, 9 Jun 2021 17:03:04 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Wed, 9 Jun 2021 17:03:04 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Stanimir Varbanov' <stanimir.varbanov@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Vikash Garodia <vgarodia@codeaurora.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Subject: RE: [PATCH v2 2/5] venus: Make sys_error flag an atomic bitops
Thread-Topic: [PATCH v2 2/5] venus: Make sys_error flag an atomic bitops
Thread-Index: AQHXXFtgDEtagiA3DU+NdMc9pzKAAasL2IqA
Date:   Wed, 9 Jun 2021 16:03:03 +0000
Message-ID: <f1da15793122432e856b5f0b00f2cf6f@AcuMS.aculab.com>
References: <20210608114156.87018-1-stanimir.varbanov@linaro.org>
 <20210608114156.87018-3-stanimir.varbanov@linaro.org>
In-Reply-To: <20210608114156.87018-3-stanimir.varbanov@linaro.org>
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

From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Sent: 08 June 2021 12:42
> 
> Make the sys_error flag an atomic bitops in order to avoid
> locking in sys_error readers.

I don't think that makes any difference at all.

It is only atomic w.r.t other bitops in the same bitmap.
Even if it contained the fullest memory barrier you can
imagine the result of test_bit() is immediately stale.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

