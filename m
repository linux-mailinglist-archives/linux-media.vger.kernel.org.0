Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7B2F289D76
	for <lists+linux-media@lfdr.de>; Sat, 10 Oct 2020 04:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730327AbgJJCYW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 22:24:22 -0400
Received: from szxga03-in.huawei.com ([45.249.212.189]:3977 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730050AbgJJCGt (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Oct 2020 22:06:49 -0400
X-Greylist: delayed 1070 seconds by postgrey-1.27 at vger.kernel.org; Fri, 09 Oct 2020 22:06:49 EDT
Received: from dggeme701-chm.china.huawei.com (unknown [172.30.72.56])
        by Forcepoint Email with ESMTP id 13048AE1962DDEAB5EEF;
        Sat, 10 Oct 2020 09:48:05 +0800 (CST)
Received: from dggeme753-chm.china.huawei.com (10.3.19.99) by
 dggeme701-chm.china.huawei.com (10.1.199.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 10 Oct 2020 09:48:04 +0800
Received: from dggeme753-chm.china.huawei.com ([10.7.64.70]) by
 dggeme753-chm.china.huawei.com ([10.7.64.70]) with mapi id 15.01.1913.007;
 Sat, 10 Oct 2020 09:48:04 +0800
From:   linmiaohe <linmiaohe@huawei.com>
To:     Jason Gunthorpe <jgg@ziepe.ca>,
        Andrew Morton <akpm@linux-foundation.org>
CC:     =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= 
        <ckoenig.leichtzumerken@gmail.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>,
        "airlied@redhat.com" <airlied@redhat.com>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "willy@infradead.org" <willy@infradead.org>,
        "jhubbard@nvidia.com" <jhubbard@nvidia.com>
Subject: Re: [PATCH 1/6] mm: mmap: fix fput in error path
Thread-Topic: [PATCH 1/6] mm: mmap: fix fput in error path
Thread-Index: Adaepvk8rUjyciszTlSJPQkfAqFrDg==
Date:   Sat, 10 Oct 2020 01:48:04 +0000
Message-ID: <94449b58fbcf474488f144c38d51418f@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.177.16]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+IHdyb3RlOg0KPiBPbiBGcmksIE9jdCAwOSwg
MjAyMCBhdCAwMzowNDoyMFBNIC0wNzAwLCBBbmRyZXcgTW9ydG9uIHdyb3RlOg0KPj4gT24gRnJp
LCAgOSBPY3QgMjAyMCAxNzowMzozNyArMDIwMCAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToNCj4+IA0KPj4gPiBQYXRjaCAiNDk1YzEw
Y2MxYzBjIENIUk9NSVVNOiBkbWEtYnVmOiByZXN0b3JlIGFyZ3MuLi4iDQo+PiA+IGFkZHMgYSB3
b3JrYXJvdW5kIGZvciBhIGJ1ZyBpbiBtbWFwX3JlZ2lvbi4NCj4+ID4gDQo+PiA+IEFzIHRoZSBj
b21tZW50IHN0YXRlcyAtPm1tYXAoKSBjYWxsYmFjayBjYW4gY2hhbmdlDQo+PiA+IHZtYS0+dm1f
ZmlsZSBhbmQgc28gd2UgbWlnaHQgY2FsbCBmcHV0KCkgb24gdGhlIHdyb25nIGZpbGUuDQo+PiA+
IA0KPj4gPiBSZXZlcnQgdGhlIHdvcmthcm91bmQgYW5kIHByb3BlciBmaXggdGhpcyBpbiBtbWFw
X3JlZ2lvbi4NCj4+ID4gDQo+PiANCj4+IERvZXNuJ3QgdGhpcyBwYXRjaCBzZXJpZXMgYWRkcmVz
cyB0aGUgc2FtZSB0aGluZyBhcyANCj4+IGh0dHBzOi8vbGttbC5rZXJuZWwub3JnL3IvMjAyMDA5
MTYwOTA3MzMuMzE0MjctMS1saW5taWFvaGVAaHVhd2VpLmNvbT8NCj4NCj5TYW1lIGJhc2ljIGlz
c3VlLCBsb29rcyBsaWtlIGJvdGggb2YgdGhlc2UgcGF0Y2hlcyBzaG91bGQgYmUgY29tYmluZWQg
dG8gcGx1ZyBpdCBmdWxseS4NCj4NCj5KYXNvbiANCg0KSSB0aGluayBzbyB0b28uIEJvdGggb2Yg
dGhlc2UgcGF0Y2hlcyBmaXggdGhlIGZwdXQgYXQgcG9zc2libGUgd3JvbmcgQGZpbGUgZHVlIHRv
IC0+bW1hcCgpIGNhbGxiYWNrIGNhbiBjaGFuZ2Ugdm1hLT52bV9maWxlLg0KDQo=
