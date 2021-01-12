Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD9BD2F287D
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 07:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388105AbhALGqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 01:46:34 -0500
Received: from rtits2.realtek.com ([211.75.126.72]:51738 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728321AbhALGqe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 01:46:34 -0500
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 10C6jgmA7000948, This message is accepted by code: ctloc85258
Received: from RSEXMBS02.realsil.com.cn ([172.29.17.196])
        by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 10C6jgmA7000948
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 12 Jan 2021 14:45:43 +0800
Received: from RSEXDAG01.realsil.com.cn (172.29.17.199) by
 RSEXMBS02.realsil.com.cn (172.29.17.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 12 Jan 2021 14:45:42 +0800
Received: from RSEXMBS01.realsil.com.cn (172.29.17.195) by
 RSEXDAG01.realsil.com.cn (172.29.17.199) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 12 Jan 2021 14:45:42 +0800
Received: from RSEXMBS01.realsil.com.cn ([fe80::99a3:1f5e:db86:65df]) by
 RSEXMBS01.realsil.com.cn ([fe80::99a3:1f5e:db86:65df%7]) with mapi id
 15.01.2044.004; Tue, 12 Jan 2021 14:45:42 +0800
From:   jason_wang <jason_wang@realsil.com.cn>
To:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "jason.root.w@gamil.com" <jason.root.w@gamil.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] media:dvb-core: add .compat_ioctl define for dmx-dvr
Thread-Topic: [PATCH] media:dvb-core: add .compat_ioctl define for dmx-dvr
Thread-Index: AdbormxLmz3ci7vZTq+oWMF0z743yg==
Date:   Tue, 12 Jan 2021 06:45:42 +0000
Message-ID: <231fa4ad3ee5423fa6c0a0a98f68c053@realsil.com.cn>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.29.52.88]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RnJvbTogSmFzb25fd2FuZyA8SmFzb25fd2FuZ0ByZWFsc2lsLmNvbS5jbj4NCg0KaWYgQ09ORklH
X0NPTVBBVCBpcyBlbmFibGVkLiAgZHZyIGlvY3RsIGNhbiBub3QgYmUgaW52b2tlZCBieSB1c2Vy
Lg0KbmVlZCAuY29tcGF0X2lvY3RsIHRvIGlkZW50aWZ5IHRoZSBpb2N0bCBmdW5jdGlvbi4NCg0K
U2lnbmVkLW9mZi1ieTogamFzb25fd2FuZyA8amFzb25fd2FuZ0ByZWFsc2lsLmNvbS5jbj4NCi0t
LQ0KwqBkcml2ZXJzL21lZGlhL2R2Yi1jb3JlL2RteGRldi5jIHwgMSArDQrCoDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9kdmItY29y
ZS9kbXhkZXYuYyBiL2RyaXZlcnMvbWVkaWEvZHZiLWNvcmUvZG14ZGV2LmMgaW5kZXggZjE0YTg3
MmQxMjY4Li40YTllMDI3ZGU4MjcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlhL2R2Yi1jb3Jl
L2RteGRldi5jDQorKysgYi9kcml2ZXJzL21lZGlhL2R2Yi1jb3JlL2RteGRldi5jDQpAQCAtMTM5
Myw2ICsxMzkzLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgZHZiX2R2
cl9mb3BzID0gew0KwqAgLnJlYWQgPSBkdmJfZHZyX3JlYWQsDQrCoCAud3JpdGUgPSBkdmJfZHZy
X3dyaXRlLA0KwqAgLnVubG9ja2VkX2lvY3RsID0gZHZiX2R2cl9pb2N0bCwNCisgLmNvbXBhdF9p
b2N0bCA9IGR2Yl9kdnJfaW9jdGwsDQrCoCAub3BlbiA9IGR2Yl9kdnJfb3BlbiwNCsKgIC5yZWxl
YXNlID0gZHZiX2R2cl9yZWxlYXNlLA0KwqAgLnBvbGwgPSBkdmJfZHZyX3BvbGwsDQotLQ0KMi4y
NS4xDQoNCg==
