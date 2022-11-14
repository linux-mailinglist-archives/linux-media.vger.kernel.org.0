Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A84262742F
	for <lists+linux-media@lfdr.de>; Mon, 14 Nov 2022 02:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235634AbiKNBfe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 13 Nov 2022 20:35:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbiKNBfd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 13 Nov 2022 20:35:33 -0500
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2080.outbound.protection.outlook.com [40.107.105.80])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FDC6DEF3
        for <linux-media@vger.kernel.org>; Sun, 13 Nov 2022 17:35:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CULdJgAQW1ItGmR4JzodRWhYCcKDee6lyHrVnkaP4BUtcc00Hps/VCdym5U+YH1opIOH8JjLNzZcLth5g1Z9Qd1l4Hkyr09y5XIExmz3bML4cCDlJCos0x/pjSb3rxAKqjKLb8ipb5wndRQWxtK1VWtocpeCQJLyAoNfL9vbyTMg3hIUC6+k07eoLbhxSX8m3FvrWftvc7af9Isbktiv22jk+NpX8ynDo/kRqGX9qI5I0gzJv2FRaZ98I6A0+UIQH+1tC6p+exhGWMydZXjgZEkdi+KlYJ5/3xZ7dtxyFg0u88cmohEiOB/dbeH19pCXMGupUDmrsCJjsLLPln5WPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIJBzv1kYMTSbLz3/+M+KM4UywMoZrnSa8KkslWdGi0=;
 b=i+L4qznnMK1zyhhjda7vAL+vBBjRnDrfSwURxDtmIw6jOwuA4PvfTSI17ZL0a2StuROQun5FnosDu5JOUBjV3cnVJVsRs5ub44QBy2mizWlyPlqK6oGZJuP4WV0NSOHBtOY79RPax4I4WqengGo4L4j12tMOHUU5FXt75h4l30wW89BgRIuR6snCyU3vgENacnosOWo/Fyrv+xvS9QWXVSEiH6SjfQaqVVBayR2UoD//YhpYW7yTc2QoSuvBSfhtJaDKybtX4oT/TU/4L12dHD203sg1+PeKONf+kONNdHfy97G8wODJ41PMAOsGmJvEDq8V6LYDzYVAGVoFgqV05A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIJBzv1kYMTSbLz3/+M+KM4UywMoZrnSa8KkslWdGi0=;
 b=GlVkdZa5ucOv9mYgbGF+KLzqdFDJEELvtjX7kiJRB0P0oKX5XBHvoyI9sBnNytihar7Sy0W5KlqDSIYCYN/2H3yBNjONlWxosXhYXGCmp8+alpICANrQLsBjqPRBG47mg3J1vJopoB7Imun4+XXb4eGNGUVicln2d363b0DzVk0=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by GV1PR04MB9182.eurprd04.prod.outlook.com (2603:10a6:150:26::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.15; Mon, 14 Nov
 2022 01:35:27 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::5c78:27ea:319f:d11]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::5c78:27ea:319f:d11%3]) with mapi id 15.20.5813.016; Mon, 14 Nov 2022
 01:35:27 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Yuan Can <yuancan@huawei.com>,
        "shijie.qin@nxp.com" <shijie.qin@nxp.com>,
        Eagle Zhou <eagle.zhou@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH] media: amphion: Fix error handling in vpu_driver_init()
Thread-Topic: [PATCH] media: amphion: Fix error handling in vpu_driver_init()
Thread-Index: AQHY9ZRjMPxnMbbYzke9EbQonb9RQ649p2+w
Date:   Mon, 14 Nov 2022 01:35:27 +0000
Message-ID: <AM6PR04MB63411BE5E5999BE3BE65E45DE7059@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <20221111060926.18508-1-yuancan@huawei.com>
In-Reply-To: <20221111060926.18508-1-yuancan@huawei.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB6341:EE_|GV1PR04MB9182:EE_
x-ms-office365-filtering-correlation-id: 061a7d22-60be-4c5b-36b2-08dac5e08251
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bgv/6dV/EyUPHdcaOlMUu8WnAs7gdYdFGOwpKzucTIAuawLSuIbYWi77dqr8KCEgKwzcmwAi3zX79sqSoucYEJAT4Y+0AClvqccac7UBWXuP1pN6H4yoevCZ8H17lknhQC1SQWe6cUBSYfvx4rqyUh3CsRJnPVBNWx5vneGvmu5cUw+BiuDDdh9vGs9eoz/60/wHDNGHFLJq/owju0X+uZY7N+eJaQXH5ixgt9DPLhk7iEjJWw3wSDF46nE0jhBHpzaUJhzyd1Ga1teboOgmCNqUtbqecZ8GuxLVmU6uNSaINeTyT9an00aLHgafwlpQYcvHs4D89/UHEx5vZ4iXsoeSzJM/VtQdVA0cPw+BhVFd9eAmc/rrD3wTuJaHbmT6RXxOxHGNBmdDOAz0JlM/ozH37vpFd/a7LXgRIGwvMFufG3k7/bL6zyz7BKXsGfwrEhBFRairLmVZTP0Zphk6YMvUQzLF08TvA0R/RxUWL63z51yPN7i+31OHSEsekeLhuZOfON6OhZYtUfz8Vaf1Pu6PiTM9JXNSZwiNviIVDI51lQGZbnCn6xlmxXHi9Y27j15I2CttD8i+KYnAGMqBtZlj+A1HRuOFNmlnt1O8mSj1mr2GCmDSBK9YL5R0/6BdWlxqzdJW6IojQez33O3tu7xNchMG1BoLvtkbQv3MMR6IlT1ArE4pNXb6HqTXi9vxLx1KElpDAseSBnc7IwcAxxK3Z+v9iW+g61WRMTTUWOr7vpEDgkCrDReSdjPbYMS1jo5H96VqxpInB1b9aKi37g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(136003)(39860400002)(451199015)(71200400001)(38070700005)(33656002)(478600001)(7696005)(6506007)(110136005)(316002)(8936002)(9686003)(44832011)(66476007)(76116006)(66556008)(66446008)(64756008)(66946007)(55016003)(26005)(8676002)(41300700001)(52536014)(5660300002)(186003)(83380400001)(2906002)(38100700002)(86362001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NlhkUW8vV1c5ZVpzUnl3ekV3Sys3S2NJeGVRK2JlTnYvcmlZYXlRNmUrazlm?=
 =?gb2312?B?RzhEWi9BVmYrSDNnSHBublFjVXNaKzNYdWc0VWJKVUVObzkwNlEvaFBqMTJX?=
 =?gb2312?B?M0pyRVpRcG0ycU1SSnZ5UmgxLzBzam1VUUFqMHhpdHc1eFpETGZyNWh3dUYx?=
 =?gb2312?B?Yy9VQTBISW95RUxhYkU0VHQ1T0wvV3dVYk1XMGdIeEVOKzhsWCtvTUhGdW9x?=
 =?gb2312?B?bVB1S29HSXVEMUYvR2tWRytCbEpqMjNNcFQ2VzkybUY4OTZPWGtpZ3djU2FX?=
 =?gb2312?B?RmVvY0pCMkQzbGhycTNObkJ4TGJoNUxwWnV1Mk1GSEJ3dDNmeG5KRENicjVz?=
 =?gb2312?B?NUhXNmFLZEhxcy9BVDIvQVlFSm1GSDNpV1AxcXByb1A0RmJmeGNtYXBSRFpu?=
 =?gb2312?B?MklnRDRtMkxYcjBrWEJVNnhpQXpxdVh4WmR5OHAxeHlWcXl4VisrcDV2dnl6?=
 =?gb2312?B?QjFVaE0yUWhJZ0lxTWkyMWMveGdQUUxEeitDanlDS0lkVEdHWXJJZy9DSlkz?=
 =?gb2312?B?ZXo0UUhSQ3k0OGdScnZGYTFBclNRL3RZOEtBS2NObUlRaVh5OWZ5emg0ajN5?=
 =?gb2312?B?NWU4MCs0QnRDZEViaEhzdERnMzI3WkRxUDdycklxK2l4aE5oL3lIL1hRcDBU?=
 =?gb2312?B?WkRnaldTb1p2ODRnTC91UzJLZXVLSFlUTVVPZ1NBekZINkpXcStJT2lsSTFN?=
 =?gb2312?B?NlQyc0pQbGd5K0syYkhUODhONldBMGt4bk5vcGh0T0VmeTBtNTFwRzVnemFK?=
 =?gb2312?B?UkswNVhZeXFTaVpUVnJqSURxMG1qejdaQUlwcUVmMWtMbmRHb2N2ejJZZFJO?=
 =?gb2312?B?QlFnb1VZZVZ3QXpLRExvSW92OW5GYktoaXVPbHA4K1pFOFVidjFpUE52bFJI?=
 =?gb2312?B?bDN2NDRnTWUvZU16TTV0ZEN2eWVGUmhaYXBuVnBmZThtU3paTG1rUXJSYzB4?=
 =?gb2312?B?MzZFYlM2NFNORkV3Z3dCaEpEeVdsVDRZZXN5ejZ0WGYveDNnUzltTjhJTi8x?=
 =?gb2312?B?STJvdDVjU21IN2hIcDJ3RWoyYUhCbnJ6Zkp0bkY0UTNOakVCTVNhQVpOaGda?=
 =?gb2312?B?cnZ6dDVLaWVGbWRhOWNIemJkMTVBckRBeFpUUkJTYzFHb21lOU93NHlTZ2tp?=
 =?gb2312?B?Zkc0UzVsOWtUNkYwemhLU2lEVnVNdkNWWnJUc2FmWmxkRW1nRE1RcFNqQmdy?=
 =?gb2312?B?YjB3S2lyVFZ2ZGVQdXk0R3g1bDJteUliUERteEtaSVdQU3FqUVYvTndYeExZ?=
 =?gb2312?B?Znk0c0szWXZXZlREazdFbkRPSXRYMUN6dFk2L2VZRGZ3M3haNHRkQ3V4TmJz?=
 =?gb2312?B?ckdSdzNMbm5CWTJIRUl4cm1keng1OUpWVjF3aVBWR04wenhXcHBPTGdXYnox?=
 =?gb2312?B?b2RiV0FnYUFCUER4Z2Y3NDJEOFZ6bkdocmFyb3B3LzFGUThFaFN0R0lxNkN2?=
 =?gb2312?B?S2UycXpaUWZrd3F1c2NuKzFyMWJidWl6cExIencvNFFaU3NsRHZkbUJ0L2dO?=
 =?gb2312?B?VnZXdk5sSUxBeTZVa3JoNkNMYUJ3OFd0NEh3c3pGSnNwMVdMT0dMcFBlUVBt?=
 =?gb2312?B?NTVMR3hCRTFLZ2xzckZTL29wMEszK2dSYnJ1T29jTXNmQ2ZyVVQvQzZTdGw4?=
 =?gb2312?B?UnkzeWd6YjAwcEViczRGdkFENTlmbDhhVFFMZlNDbXYyejFIU3hhRy9rOFVh?=
 =?gb2312?B?dklyMzdLbDlsVGlTK1FwNmFyb0dCVGQramhXclQ3NnJleStrRDNKUnFFdWUr?=
 =?gb2312?B?ZVJGL3d6VUpHZjBhak1DR1licE5Ma1pvcDk2RGNaQ1gxM2lMTkljd3hZcnJx?=
 =?gb2312?B?b0s2SEs2RFArdzM4Q1BZakhzY2RHQmc5RjhqODRCcTdYZ1dRVkIyYUE1czRV?=
 =?gb2312?B?eUFKUlpkd0tZSVFYYzRNampuZ0Z2ekk2UlhicVE5QUVsd0x0N2E1Y2VHYjht?=
 =?gb2312?B?T2M2U3NrQTFHbFJVUEVZVGNmaHlES2VZK2M5ZVA4RnlnTHZiMERsNmFKZEs1?=
 =?gb2312?B?SzZtZU0vVGJ3MzhCTVVpakpaY2d6MGdNNkhWNzduei9tMTRpMU5TWVlRRDZx?=
 =?gb2312?B?Y2JYMWhtVk1TdTFXeHRaU1J4UmUva2o1VU9hTFByZlpwOVhER0NBK29aTkRH?=
 =?gb2312?Q?PEcM=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 061a7d22-60be-4c5b-36b2-08dac5e08251
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2022 01:35:27.5896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/UzYa08FnshWPkWyDIsT7c9xs/i7nAmKnBL3cIG1uwlbvFBf8BU55htyGwNIAz1BvhAQmxP0YtCpf7QIAFMEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9182
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PkZyb206IFl1YW4gQ2FuIDx5dWFuY2FuQGh1YXdlaS5jb20+DQo+U2VudDogMjAyMsTqMTHUwjEx
yNUgMTQ6MDkNCj5UbzogTWluZyBRaWFuIDxtaW5nLnFpYW5AbnhwLmNvbT47IHNoaWppZS5xaW5A
bnhwLmNvbTsgRWFnbGUgWmhvdQ0KPjxlYWdsZS56aG91QG54cC5jb20+OyBtY2hlaGFiQGtlcm5l
bC5vcmc7IGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubDsNCj5saW51eC1tZWRpYUB2Z2VyLmtlcm5l
bC5vcmcNCj5DYzogeXVhbmNhbkBodWF3ZWkuY29tDQo+U3ViamVjdDogW1BBVENIXSBtZWRpYTog
YW1waGlvbjogRml4IGVycm9yIGhhbmRsaW5nIGluIHZwdV9kcml2ZXJfaW5pdCgpDQo+DQo+QSBw
cm9ibGVtIGFib3V0IG1vZHByb2JlIGFtcGhpb24tdnB1IGZhaWxlZCBpcyB0cmlnZ2VyZWQgd2l0
aCB0aGUNCj5mb2xsb3dpbmcgbG9nIGdpdmVuOg0KPg0KPiBbIDIyMDguNjM0ODQxXSBFcnJvcjog
RHJpdmVyICdhbXBoaW9uLXZwdScgaXMgYWxyZWFkeSByZWdpc3RlcmVkLCBhYm9ydGluZy4uLg0K
PiBtb2Rwcm9iZTogRVJST1I6IGNvdWxkIG5vdCBpbnNlcnQgJ2FtcGhpb25fdnB1JzogRGV2aWNl
IG9yIHJlc291cmNlIGJ1c3kNCj4NCj5UaGUgcmVhc29uIGlzIHRoYXQgdnB1X2RyaXZlcl9pbml0
KCkgcmV0dXJucyB2cHVfY29yZV9kcml2ZXJfaW5pdCgpIGRpcmVjdGx5DQo+d2l0aG91dCBjaGVj
a2luZyBpdHMgcmV0dXJuIHZhbHVlLCBpZiB2cHVfY29yZV9kcml2ZXJfaW5pdCgpIGZhaWxlZCwg
aXQgcmV0dXJucw0KPndpdGhvdXQgdW5yZWdpc3RlciBhbXBoaW9uX3ZwdV9kcml2ZXIsIHJlc3Vs
dGluZyB0aGUgYW1waGlvbi12cHUgY2FuIG5ldmVyDQo+YmUgaW5zdGFsbGVkIGxhdGVyLg0KPkEg
c2ltcGxlIGNhbGwgZ3JhcGggaXMgc2hvd24gYXMgYmVsb3c6DQo+DQo+IHZwdV9kcml2ZXJfaW5p
dCgpDQo+ICAgcGxhdGZvcm1fZHJpdmVyX3JlZ2lzdGVyKCkgIyByZWdpc3RlciBhbXBoaW9uX3Zw
dV9kcml2ZXINCj4gICB2cHVfY29yZV9kcml2ZXJfaW5pdCgpDQo+ICAgICBwbGF0Zm9ybV9kcml2
ZXJfcmVnaXN0ZXIoKQ0KPiAgICAgICBkcml2ZXJfcmVnaXN0ZXIoKQ0KPiAgICAgICAgIGJ1c19h
ZGRfZHJpdmVyKCkNCj4gICAgICAgICAgIGRldiA9IGt6YWxsb2MoLi4uKSAjIE9PTSBoYXBwZW5l
ZA0KPiAgICMgcmV0dXJuIHdpdGhvdXQgdW5yZWdpc3RlciBhbXBoaW9uX3ZwdV9kcml2ZXINCj4N
Cj5GaXggYnkgdW5yZWdpc3RlciBhbXBoaW9uX3ZwdV9kcml2ZXIgd2hlbiB2cHVfY29yZV9kcml2
ZXJfaW5pdCgpIHJldHVybnMNCj5lcnJvci4NCj4NCj5GaXhlczogYjUwYTY0ZmM1NGFmICgibWVk
aWE6IGFtcGhpb246IGFkZCBhbXBoaW9uIHZwdSBkZXZpY2UgZHJpdmVyIikNCj5TaWduZWQtb2Zm
LWJ5OiBZdWFuIENhbiA8eXVhbmNhbkBodWF3ZWkuY29tPg0KDQpSZXZpZXdlZC1ieTogbWluZ19x
aWFuIDxtaW5nLnFpYW5AbnhwLmNvbT4NCg0KPi0tLQ0KPiBkcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L2FtcGhpb24vdnB1X2Rydi5jIHwgNiArKysrKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL2FtcGhpb24vdnB1X2Rydi5jDQo+Yi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2FtcGhp
b24vdnB1X2Rydi5jDQo+aW5kZXggOWQ1YTUwNzUzNDNkLi5mMDFjZTQ5ZDI3ZTggMTAwNjQ0DQo+
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hbXBoaW9uL3ZwdV9kcnYuYw0KPisrKyBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vYW1waGlvbi92cHVfZHJ2LmMNCj5AQCAtMjQ1LDcgKzI0NSwx
MSBAQCBzdGF0aWMgaW50IF9faW5pdCB2cHVfZHJpdmVyX2luaXQodm9pZCkNCj4gCWlmIChyZXQp
DQo+IAkJcmV0dXJuIHJldDsNCj4NCj4tCXJldHVybiB2cHVfY29yZV9kcml2ZXJfaW5pdCgpOw0K
PisJcmV0ID0gdnB1X2NvcmVfZHJpdmVyX2luaXQoKTsNCj4rCWlmIChyZXQpDQo+KwkJcGxhdGZv
cm1fZHJpdmVyX3VucmVnaXN0ZXIoJmFtcGhpb25fdnB1X2RyaXZlcik7DQo+Kw0KPisJcmV0dXJu
IHJldDsNCj4gfQ0KPg0KPiBzdGF0aWMgdm9pZCBfX2V4aXQgdnB1X2RyaXZlcl9leGl0KHZvaWQp
DQo+LS0NCj4yLjE3LjENCg0K
