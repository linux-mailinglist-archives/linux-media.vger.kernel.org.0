Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4844577CD62
	for <lists+linux-media@lfdr.de>; Tue, 15 Aug 2023 15:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237443AbjHONiy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Aug 2023 09:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237446AbjHONia (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Aug 2023 09:38:30 -0400
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E817E52
        for <linux-media@vger.kernel.org>; Tue, 15 Aug 2023 06:38:29 -0700 (PDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-14-jtYcrbScOx2nz_MMUvypow-1; Tue, 15 Aug 2023 14:38:26 +0100
X-MC-Unique: jtYcrbScOx2nz_MMUvypow-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 15 Aug
 2023 14:38:23 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 15 Aug 2023 14:38:23 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Mina Almasry' <almasrymina@google.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        David Ahern <dsahern@kernel.org>,
        Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
        "Jason Gunthorpe" <jgg@ziepe.ca>,
        Hari Ramakrishnan <rharix@google.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        "stephen@networkplumber.org" <stephen@networkplumber.org>,
        "sdf@google.com" <sdf@google.com>
Subject: RE: [RFC PATCH v2 00/11] Device Memory TCP
Thread-Topic: [RFC PATCH v2 00/11] Device Memory TCP
Thread-Index: AQHZyy4cCyylGqKvQkCWO9kOPAhLv6/rVx7w
Date:   Tue, 15 Aug 2023 13:38:23 +0000
Message-ID: <58a93e4e8b8b4ca79c2678a3ae8281cd@AcuMS.aculab.com>
References: <20230810015751.3297321-1-almasrymina@google.com>
In-Reply-To: <20230810015751.3297321-1-almasrymina@google.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogTWluYSBBbG1hc3J5DQo+IFNlbnQ6IDEwIEF1Z3VzdCAyMDIzIDAyOjU4DQouLi4NCj4g
KiBUTDtEUjoNCj4gDQo+IERldmljZSBtZW1vcnkgVENQIChkZXZtZW0gVENQKSBpcyBhIHByb3Bv
c2FsIGZvciB0cmFuc2ZlcnJpbmcgZGF0YSB0byBhbmQvb3INCj4gZnJvbSBkZXZpY2UgbWVtb3J5
IGVmZmljaWVudGx5LCB3aXRob3V0IGJvdW5jaW5nIHRoZSBkYXRhIHRvIGEgaG9zdCBtZW1vcnkN
Cj4gYnVmZmVyLg0KDQpEb2Vzbid0IHRoYXQgcmVhbGx5IHJlcXVpcmUgcGVlci10by1wZWVyIFBD
SWUgdHJhbnNmZXJzPw0KSUlSQyB0aGVzZSBhcmVuJ3Qgc3VwcG9ydGVkIGJ5IG1hbnkgcm9vdCBo
dWJzIGFuZCBoYXZlDQpmdW5kYW1lbnRhbCBmbG93IGNvbnRyb2wgYW5kL29yIFRMUCBjcmVkaXQg
cHJvYmxlbXMuDQoNCkknZCBndWVzcyB0aGV5IGFyZSBhbHNvIHByZXR0eSBpbmNvbXBhdGlibGUg
d2l0aCBJT01NVT8NCg0KSSBjYW4gc2VlIGhvdyB5b3UgbWlnaHQgbWFuYWdlIHRvIHRyYW5zbWl0
IGZyYW1lcyBmcm9tDQpzb21lIGV4dGVybmFsIG1lbW9yeSAoZWcgYWZ0ZXIgZW5jcnlwdGlvbikg
YnV0IHN1cmVseQ0KcHJvY2Vzc2luZyByZWNlaXZlIGRhdGEgdGhhdCB3YXkgbmVlZHMgdGhlIHBh
Y2tldHMNCmJlIGZpbHRlcmVkIGJ5IGJvdGggSVAgYWRkcmVzc2VzIGFuZCBwb3J0IG51bWJlcnMg
YmVmb3JlDQpiZWluZyByZWRpcmVjdGVkIHRvIHRoZSAocHJlc3VtYWJseSBsaW1pdGVkKSBleHRl
cm5hbA0KbWVtb3J5Lg0KDQpPVE9IIGlzbid0IHRoZSBrZXJuZWwgZ29pbmcgdG8gbmVlZCB0byBy
dW4gY29kZSBiZWZvcmUNCnRoZSBwYWNrZXQgaXMgYWN0dWFsbHkgc2VudCBhbmQganVzdCBhZnRl
ciBpdCBpcyByZWNlaXZlZD8NClNvIGFsbCB5b3UgbWlnaHQgZ2FpbiBpcyBhIGJpdCBvZiBsYXRl
bmN5Pw0KQW5kIGEgYml0IGxlc3MgdXRpbGlzYXRpb24gb2YgaG9zdCBtZW1vcnk/Pw0KQnV0IGlm
IHlvdXIgc3lzdGVtIGlzIHJlYWxseSBsaW1pdGVkIGJ5IGNwdS1tZW1vcnkgYmFuZHdpZHRoDQp5
b3UgbmVlZCBtb3JlIGNhY2hlIDotKQ0KDQpTbyBob3cgbXVjaCBiZW5lZml0IGlzIHRoZXJlIG92
ZXIgZWZmaWNpZW50IHVzZSBvZiBob3N0DQptZW1vcnkgYm91bmNlIGJ1ZmZlcnM/Pw0KDQoJRGF2
aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRlLCBCcmFtbGV5IFJvYWQsIE1vdW50
IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpSZWdpc3RyYXRpb24gTm86IDEzOTcz
ODYgKFdhbGVzKQ0K

