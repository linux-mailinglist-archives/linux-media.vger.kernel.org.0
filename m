Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55FB728E2BF
	for <lists+linux-media@lfdr.de>; Wed, 14 Oct 2020 17:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728002AbgJNPDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Oct 2020 11:03:39 -0400
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151]:53929 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725983AbgJNPDj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Oct 2020 11:03:39 -0400
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-23-5R0ZYRbzNNO_eF50pPQanQ-1; Wed, 14 Oct 2020 16:03:32 +0100
X-MC-Unique: 5R0ZYRbzNNO_eF50pPQanQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Wed, 14 Oct 2020 16:03:31 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000;
 Wed, 14 Oct 2020 16:03:31 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Tomasz Figa' <tfiga@chromium.org>, Christoph Hellwig <hch@lst.de>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg 
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "ribalda@chromium.org" <ribalda@chromium.org>
Subject: RE: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
Thread-Topic: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
Thread-Index: AQHWoizP1ionlj461EmOR7qrC05zA6mXMXsA
Date:   Wed, 14 Oct 2020 15:03:31 +0000
Message-ID: <74c9662fca5a4d5896220a64aa9ad3ec@AcuMS.aculab.com>
References: <20200930160917.1234225-1-hch@lst.de>
 <20200930160917.1234225-9-hch@lst.de>
 <CAAFQd5CttttqMXb=iDPb+Z0WGUa2g=W6JwXJ-5HbhmrDyxP+cQ@mail.gmail.com>
In-Reply-To: <CAAFQd5CttttqMXb=iDPb+Z0WGUa2g=W6JwXJ-5HbhmrDyxP+cQ@mail.gmail.com>
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
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBPbiBXZWQsIFNlcCAzMCwgMjAyMCBhdCA2OjA5IFBNIENocmlzdG9waCBIZWxsd2lnIDxoY2hA
bHN0LmRlPiB3cm90ZToNCj4gPg0KPiA+IEFkZCBhIG5ldyBBUEkgdGhhdCByZXR1cm5zIGEgdmly
dHVhbGx5IG5vbi1jb250aWdvdXMgYXJyYXkgb2YgcGFnZXMNCj4gPiBhbmQgZG1hIGFkZHJlc3Mu
ICBUaGlzIEFQSSBpcyBvbmx5IGltcGxlbWVudGVkIGZvciBkbWEtaW9tbXUgYW5kIHdpbGwNCj4g
PiBub3QgYmUgaW1wbGVtZW50ZWQgZm9yIG5vbi1pb21tdSBETUEgQVBJIGluc3RhbmNlcyB0aGF0
IGhhdmUgdG8gYWxsb2NhdGUNCj4gPiBjb250aWd1b3VzIG1lbW9yeS4gIEl0IGlzIHVwIHRvIHRo
ZSBjYWxsZXIgdG8gY2hlY2sgaWYgdGhlIEFQSSBpcw0KPiA+IGF2YWlsYWJsZS4NCg0KSXNuJ3Qg
dGhlcmUgYWxyZWFkeSBhIGZsYWcgdGhhdCBpcyBvbmx5IGltcGxlbWVudGVkIGZvciBBUk0NCnN5
c3RlbXMgd2l0aCBpb21tdSB0aGF0IGZvcmNlcyBwYWdlcyB0byBhY3R1YWxseSBiZSBwaHlzaWNh
bGx5DQpjb250aWd1b3VzPw0KDQpTbyBpc24ndCB0aGlzIHNvbWUga2luZCBvZiBzdHJhbmdlIG9w
cG9zaXRlPw0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFt
bGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3Ry
YXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0K

