Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0854A6F7E56
	for <lists+linux-media@lfdr.de>; Fri,  5 May 2023 10:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231375AbjEEIDj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 May 2023 04:03:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231447AbjEEID2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 May 2023 04:03:28 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2042.outbound.protection.outlook.com [40.107.8.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5278618841
        for <linux-media@vger.kernel.org>; Fri,  5 May 2023 01:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f/Xz4fs9TbHkhiafPcqBbAoYlwpX2N++bIElsBy1813dDOSZ5O/x7W/z5MaqNz7Kku9TsfQGG4KxsO02B8VB/uWcmCmvvB3iegPEf0sPod7ibGDXvooig9bpwJkKRwcRnmduVBbID+ViMHOTImogGVVk/4EjWZ3O9aYlTnsQAtcSdV+uYlVpWBfTjATPqkTUb3LYcWTuvaAHFirmRfw9ZKC/4TLbBup8qkHOsmGDHIalAzqLPIcgToeTsSl+aSSLH56nZmzBABUiTk0BGUYodBbagQZtQ8yXh6EtYNooPy1twuGO/5lVKEk48gfh/dGWT4EqHAbBLci+2kriv78FWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8REbh74uF0RTCGaG0+fsk4Nh7r/sYKIlEaUOQFwsoE=;
 b=S63emAQK9QmSWh9VkBB5Y0Xg/o1UNmEo0b8OYyxrqAoV8JQft6+fFbVe9XgjOvp+nboX4CWHXiNoRTFs/tK/IfUidpV5leWFjUVo1NwV7Qe9hm/t5LQG/umpTXoxbr2yvtnhfxjwTVXpiTSW7DjDe906SSQlPpWkeE3upEZHvzJGoVWaa1+tlEKmdiN0B2lwR0B7f+CaXQhFVeNNUBuDyB7ecmKyIBnuXsTgDv5H55pSUiyKbdxOqWpNUJONpCodA5GmI0q2cyn07RCwVQ3qnFoQGqJdpi0p6paScKryLFDQ3ncSHf49RwHW5E0zXJHbUtu8OOeSgCGnPm58letSvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8REbh74uF0RTCGaG0+fsk4Nh7r/sYKIlEaUOQFwsoE=;
 b=MJ4SIEAeVhFJEdLwCTPHIJH9YOr73G+cY8neQ3Zpp4Vf7ZQaGMkT7mzfnW7RS7QTcnqp6/iDlAmgV0uVfbuPIOFUzc1fyeF+uCOS6wTiL2ev3MWoRmjHvNLUzB1iwPAkOJswL+5XNaqTamYTm4Bc9Qj9CWdwUbI21/IVfmbKjos=
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB7149.eurprd04.prod.outlook.com (2603:10a6:800:12e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 08:03:12 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8%3]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 08:03:12 +0000
From:   "G.N. Zhou" <guoniu.zhou@nxp.com>
To:     Jacopo Mondi <jacopo.mondi@ideasonboard.com>
CC:     "slongerbeam@gmail.com" <slongerbeam@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>
Subject: RE: [EXT] [PATCH 0/2] media: ov5640: drive-by frame_interval cleanups
Thread-Topic: [EXT] [PATCH 0/2] media: ov5640: drive-by frame_interval
 cleanups
Thread-Index: AQHZfyGQI2JAdJOOSkG5qa4G74f/l69LUbmQ
Date:   Fri, 5 May 2023 08:03:11 +0000
Message-ID: <AS8PR04MB90800B7B9BA75668DC82624BFA729@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
In-Reply-To: <20230505071619.63229-1-jacopo.mondi@ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VI1PR04MB7149:EE_
x-ms-office365-filtering-correlation-id: d55a9940-a050-4eef-a0f8-08db4d3f2c03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jBOcDkI0lEAyQeGcu7JPvPsmlG4ZBG2wMaEdgGtis4jfomHB4AvR5D3CvDs3iEZCKAdMDSkfaQwbGrk/p0w+nZ9DQrR1A/4t8Rj0LaXiCSQvWp+g6vTqqzL3W6hGtUubkyjxqQzC+p8mQbo1nAlfx8wjKqxMdo8SbZDuzcqQKoMoWT9QtImooiYrnj+7esLJeFRvNOBS9pJ1rVBvQuXTa3B1PaqVSK8Eo/rjrKyq7SrMs1n5jgG+uJ0/xaz8xYwNxh0sobwn1IsvWJhLLGCEVtkJQQlfgBDX0fQHnetfqt8i3PcMyFjgiNGciCgpFYpexAgFx5w7cTBfi3eI+Rh5Lu+VW2WSnrzmb68ZFdUjb3ZAJyQ8YTBnpFQRtr6TJQIN80RQamDUhnb0bQV2mGxlzGi8TPXXnk1bTyt5FT7wkA7Ud1nXKX7/79fOZ3RCuRaQmLQPrvxJbmf14gimPP4ndk/Dyxl+6+hFxf1kFd0FSU5QhqVWy6p7BSCpK/SD9vU96Z9j2HtX560WtgJDnHpZlM/pPwKcxGP5qxfnNPpjI4cjK65BxmKjABm/6daP6qR9ia79/ehWT91cFE1yiGpMZ00erh0dxnO3zaq+GyniH+Jt1neBb0uyT+kGgh2czmd4
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199021)(7696005)(76116006)(478600001)(6916009)(4326008)(66946007)(66556008)(66446008)(66476007)(64756008)(71200400001)(316002)(54906003)(33656002)(86362001)(83380400001)(53546011)(6506007)(9686003)(26005)(8936002)(5660300002)(52536014)(8676002)(41300700001)(55016003)(2906002)(38070700005)(186003)(122000001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?NWI4bWJOanlhUjRYa085MXZJQ0NWZWJjdjFZeFIrU0M2YlpBNThaYkF5aGd4?=
 =?gb2312?B?bE93VUlXOVk5R001aHI2NndETXY1WFBTNVJnS2Y2V3d3QkNNaEcxYklvTVJt?=
 =?gb2312?B?NFRFc2w1M1hjdE1HME1YY1JtMmQ2dGlBdW1DRUYzaHI2d3orKyt0TDdjdmVv?=
 =?gb2312?B?UE9Vdks1ejl4S0Rrb0syMUR6YkdvTXFSVGdaQ1B1NWo2bFFYaEp1Q1hNWEx3?=
 =?gb2312?B?N0JNRktROWZUUVVIdERxYXBPVUhXOFJtUGh2czl0R2tkc0M2aGhtWjFwTm1l?=
 =?gb2312?B?VTd1NkpWcUgrUUhSZjFmeWFkU0ZoV0FycnliMTh3azdkY1hVU29PcTU5S2lQ?=
 =?gb2312?B?MC91Y203SXhtOGhtMzQ5aWNWUnlNS2xxT3dBY1BZeGNyZi9IT2dtejZSbndC?=
 =?gb2312?B?MS9jdWt0VS9FZUxTdmpjdGJCTk9meHVGdEFLTVJ1NkNFZ1l2eDFXOGd6Tm9m?=
 =?gb2312?B?b1FrUGN4TkdJS0xHUVFBa2V4RjNkN3VwUnZSUE1nMjRpNjF2YkJLQ2g3elB4?=
 =?gb2312?B?QlNaVGhMTG5KZUR6SEFyYWVXTWhOTzJMYkdrYWpIb1pTVHZZTnFnWE5IeUhy?=
 =?gb2312?B?VFBmQmRBRWxXT3M1VCt6UUF5ZEdYZ1Fhb05mY25BNkpFblhqWkR1NmlVd0c3?=
 =?gb2312?B?SjBUNm1wTDBGZlVDSmRSODIyUVQ5bGlpcGlXZHpMTUF3WHV5S0VENXl1STVp?=
 =?gb2312?B?WHUzd2ZRYzEwd2pveElFS1JUcTlxMnlrUGRWQW9FMUxIZDRGSi84NmtaVWNZ?=
 =?gb2312?B?UUczZnBkNVB6WDlDcXhOQWtjWnZIRzg3aVRMQ21MUCsvckNzbW5LTEpaQ21D?=
 =?gb2312?B?d3Z6eWROOHZkcUMwTURvdnRDcWVEaWc4NkdvMTFBMVJWYkdGVm81dkQrQyt0?=
 =?gb2312?B?aUt5L3N0WDU0Y29yUjdmQVJ4d2NmSExHWFQ0THA2NHdWRVd4WWVqQXNkSlpu?=
 =?gb2312?B?WkdFblZCWGNLQ3VrSUlGblcvUkVzQ0lnNWFzaVg4WDZpNmg4UzhrcExmT3No?=
 =?gb2312?B?c2tmUkdMQlF4aythNzJvVUxRaDBJV1BVbXkwS3A2eDlhS2xWb2xaKzZWUWFH?=
 =?gb2312?B?WEhXUzlzSHBMRndnRGx6NzI1ZXAvZHV0bVI5QnVaODFMbTFqRGkwdUdnMWJx?=
 =?gb2312?B?Z2svVmVaRlpSanVjUmdFV1UwUGRtTFJRQ21xMzdueS9ZUUNlVTFlVDVkOUh3?=
 =?gb2312?B?ekRYMFl0dnNUN1F1U3U3ZUhyaFc4dVRjY0ZWTXBYR1JDU2l5Skl4WjZPcGxq?=
 =?gb2312?B?TGpFb0VlUEVpSjNyd1crc0NxbmtGYUE2WGNwNWxPdzNlOFNtaENid2ZXMXhh?=
 =?gb2312?B?aGdEOXNMQU42Z3FjTE5ENEZ6cVU5MjJrVFRYMzJvenJEMVRQa3hCTE5IM1Fn?=
 =?gb2312?B?U3dVR1l0dGNMb0RUckk3QUg5ZFJZRGJnQW1JRTVqQnpiQVNOS013VlBDQ1dt?=
 =?gb2312?B?bU50S3RoS2t2eDI1QmxPWUxxOXJTdWE0N3k2dVhleUZVKzFvQU1MRTF5dkFp?=
 =?gb2312?B?RTJheDB1OHRiUTN3cFduK0g3bzQycFhLaWZFOWtjTUdyQkdOSU5XNTd0TFNz?=
 =?gb2312?B?TVpVY1JRaXNtYzdmRitEeGhQRndLZWtIUXdjQ3ZtcWhBVzh6T3pmOHovQVJn?=
 =?gb2312?B?Y3NRSWxRSEt6VkZYKysySm1Ca0huWms1RXV6eHZRZHFsQkpuRytyRXAvM1Jm?=
 =?gb2312?B?OHdOdlhxbTN6NnNlVVF4WmFja0grMTh3L1pkY2ZkWS9EYzZnQlRPTGlWa2NE?=
 =?gb2312?B?YlJ3YVY3cVlJR2N6TlNXWmZMU1ovSU5wUlJnM0RubkpFRmdxdS8zbktPekZP?=
 =?gb2312?B?T2tXV1VTU1RDQXhHcUMreXBXSWU3KzhoMU1tVktsWHNOVTF5Nnc4cDhQRG5K?=
 =?gb2312?B?VDB3bU94S2xSbG1jUlhZeHNCVnJ4YWQ1OW5JT1l4RzhMbXE2U081dWJ6Tjlt?=
 =?gb2312?B?a2Z4cDVHeStackd1bTl3YXpTdHFjSHhHY0NTOGRPcWUwUDdZWWl2OVdUaDho?=
 =?gb2312?B?NVVocXlCWjQ0Y1FwcVVGbmNvSXN0TlAyYWtLcEtMMll6RUo1L3NEU3JlL21Y?=
 =?gb2312?B?Rk16d0U4d2diZFRWOXpVOEhZYXRXcU9mQUJJWU8vbVpoc1R1NEFsdWZHOG5W?=
 =?gb2312?Q?XrKKbVxeKK5+D2eAba81zpi60?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d55a9940-a050-4eef-a0f8-08db4d3f2c03
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 08:03:11.9435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x70ugzUbILyenyIOw36SSy9Zh3sWFIvtjpTnv0QFiY5I0dUz2FxjhXh3bud9mFBvBBr6LeRxqjJVmBLJXYkWOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7149
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

U3VyZSwgd2lsbCB1cGRhdGUgbGF0ZXIuDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogSmFjb3BvIE1vbmRpIDxqYWNvcG8ubW9uZGlAaWRlYXNvbmJvYXJkLmNvbT4NCj4g
U2VudDogMjAyM8TqNdTCNcjVIDE1OjE2DQo+IFRvOiBHLk4uIFpob3UgPGd1b25pdS56aG91QG54
cC5jb20+DQo+IENjOiBKYWNvcG8gTW9uZGkgPGphY29wby5tb25kaUBpZGVhc29uYm9hcmQuY29t
PjsNCj4gc2xvbmdlcmJlYW1AZ21haWwuY29tOyBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7
IG1jaGVoYWJAa2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBbUEFUQ0ggMC8yXSBtZWRpYTog
b3Y1NjQwOiBkcml2ZS1ieSBmcmFtZV9pbnRlcnZhbCBjbGVhbnVwcw0KPiANCj4gQ2F1dGlvbjog
VGhpcyBpcyBhbiBleHRlcm5hbCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5n
IGxpbmtzIG9yIG9wZW5pbmcNCj4gYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0
aGUgbWVzc2FnZSB1c2luZyB0aGUgJ1JlcG9ydCB0aGlzIGVtYWlsJw0KPiBidXR0b24NCj4gDQo+
IA0KPiBXaGlsZSBsb29raW5nIGF0IEd1b25pdSBaaG91IHBhdGNoZXMgSSBub3RpY2VkIHRoYXQg
dGhlcmUgd2VyZSBhIGZldyBjbGVhbnVwcw0KPiByZWxhdGVkIHRvIHRoZSB1c2FnZSBvZiBmcmFt
ZV9pbnRlcnZhbCBmaWxlZHMgZm9yIE1JUEkgQ1NJLTIgZnJhbWVyYXRlDQo+IGNhbGN1bGF0aW9u
cy4NCj4gDQo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcyBpbnRlbmRlZCwganVzdCBjbGVhbnVwcy4N
Cj4gDQo+IEd1b25pdTogY291bGQgeW91IHBsZWFzZSB0ZXN0IHRoZXNlIG9uIHlvdXIgc2V0dXAg
YXMgd2VsbCA/IEEgdGVzdGVkLWJ5IHRhZw0KPiB3b3VsZCBiZSB1c2VmdWwhDQo+IA0KPiBUaGFu
a3MNCj4gICBqDQo+IA0KPiBKYWNvcG8gTW9uZGkgKDIpOg0KPiAgIG1lZGlhOiBvdjU2NDA6IFJl
bW92ZSB1bnVzZWQgJ2ZyYW1lcmF0ZScgcGFyYW1ldGVyDQo+ICAgbWVkaWE6IG92NTY0MDogRHJv
cCBkZWFkIGNvZGUgdXNpbmcgZnJhbWVfaW50ZXJ2YWwNCj4gDQo+ICBkcml2ZXJzL21lZGlhL2ky
Yy9vdjU2NDAuYyB8IDE3ICstLS0tLS0tLS0tLS0tLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDE2IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0NCj4gMi40MC4xDQoNCg==
