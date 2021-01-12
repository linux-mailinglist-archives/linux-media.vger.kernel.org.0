Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5C6C2F2850
	for <lists+linux-media@lfdr.de>; Tue, 12 Jan 2021 07:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731090AbhALG2P (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 12 Jan 2021 01:28:15 -0500
Received: from rtits2.realtek.com ([211.75.126.72]:48707 "EHLO
        rtits2.realtek.com.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730221AbhALG2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 12 Jan 2021 01:28:14 -0500
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 10C6RNNP0027770, This message is accepted by code: ctloc85258
Received: from RSEXMBS01.realsil.com.cn ([172.29.17.195])
        by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 10C6RNNP0027770
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
        Tue, 12 Jan 2021 14:27:24 +0800
Received: from RSEXMBS01.realsil.com.cn (172.29.17.195) by
 RSEXMBS01.realsil.com.cn (172.29.17.195) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2044.4; Tue, 12 Jan 2021 14:27:23 +0800
Received: from RSEXMBS01.realsil.com.cn ([fe80::99a3:1f5e:db86:65df]) by
 RSEXMBS01.realsil.com.cn ([fe80::99a3:1f5e:db86:65df%7]) with mapi id
 15.01.2044.004; Tue, 12 Jan 2021 14:27:23 +0800
From:   =?utf-8?B?546L5p2w5riFW2phc29uX3dhbmdd?= 
        <jason_wang@realsil.com.cn>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "jason.root.w@gamil.com" <jason.root.w@gamil.com>
Subject: [PATCH] media:dvb-core: add .compat_ioctl define for dmx-dvr
Thread-Topic: [PATCH] media:dvb-core: add .compat_ioctl define for dmx-dvr
Thread-Index: Adboq2ai/clZ45L8Snip7ZLCACySVA==
Date:   Tue, 12 Jan 2021 06:27:23 +0000
Message-ID: <fbeef6e6cb3f4c23baef8fb7a07462af@realsil.com.cn>
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
X0NPTVBBVCBpcyBlbmFibGVkLiBkdnIgaW9jdGwgY2FuIG5vdCBiZQ0KaW52b2tlZCBieSB1c2Vy
LiBuZWVkIC5jb21wYXRfaW9jdGwgdG8gaWRlbnRpZnkgdGhlDQppb2N0bCBmdW5jdGlvbi4NCg0K
U2lnbmVkLW9mZi1ieTogamFzb25fd2FuZyA8bWFpbHRvOmphc29uX3dhbmdAcmVhbHNpbC5jb20u
Y24+DQotLS0NCsKgZHJpdmVycy9tZWRpYS9kdmItY29yZS9kbXhkZXYuYyB8IDEgKw0KwqAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEv
ZHZiLWNvcmUvZG14ZGV2LmMgYi9kcml2ZXJzL21lZGlhL2R2Yi1jb3JlL2RteGRldi5jDQppbmRl
eCBmMTRhODcyZDEyNjguLjRhOWUwMjdkZTgyNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvbWVkaWEv
ZHZiLWNvcmUvZG14ZGV2LmMNCisrKyBiL2RyaXZlcnMvbWVkaWEvZHZiLWNvcmUvZG14ZGV2LmMN
CkBAIC0xMzkzLDYgKzEzOTMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGZpbGVfb3BlcmF0aW9u
cyBkdmJfZHZyX2ZvcHMgPSB7DQrCoCAucmVhZCA9IGR2Yl9kdnJfcmVhZCwNCsKgIC53cml0ZSA9
IGR2Yl9kdnJfd3JpdGUsDQrCoCAudW5sb2NrZWRfaW9jdGwgPSBkdmJfZHZyX2lvY3RsLA0KKyAu
Y29tcGF0X2lvY3RsID0gZHZiX2R2cl9pb2N0bCwNCsKgIC5vcGVuID0gZHZiX2R2cl9vcGVuLA0K
wqAgLnJlbGVhc2UgPSBkdmJfZHZyX3JlbGVhc2UsDQrCoCAucG9sbCA9IGR2Yl9kdnJfcG9sbCwN
Ci0tIA0KMi4yNS4xDQoNCg==
