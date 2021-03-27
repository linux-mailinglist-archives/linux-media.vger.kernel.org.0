Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A4C34B7C8
	for <lists+linux-media@lfdr.de>; Sat, 27 Mar 2021 15:40:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229990AbhC0Ojo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Mar 2021 10:39:44 -0400
Received: from mail-db8eur05on2086.outbound.protection.outlook.com ([40.107.20.86]:35776
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229901AbhC0Oj1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Mar 2021 10:39:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXUEwHIV5U0mGDSjAAr/lWeImdDNM+kP1x98DbShJrSPm5RP+W60YmD7Cknk+kGUtikRTridKnCSdxV97nSGoLVidAi9h2gOir5hiesyBZiU/1yIAbHzOyPoJM5raqwFKT5+YsHBiAw4EOqRIkaJvTtsMX+JsjZ5CCRetbLI2LIHIxgUUMlktrcne2yzZpq1fcg/jvf5TjIjUgpUd2eXfz0HdGsKm9QAAVP4ZstUMohFsZJGv5uWm+QgOhPpTZQ9vHpKlVo05kmsmNJUIHGfh3jdIbwqTGU6YFhRN62JA/ywctZjNt3gi/b/Os9ZK/9xLQumjccJnMqqP+ObpzfAMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLd2KfyAnPtWwydnta2YNE3EunYZWhxLsVug4x+Wj78=;
 b=hQE9VOhzwQS3N1gDEWWjC+Evu3I+aaCDMcHeBgxiSTCz9uiKJA3WuBiwtGzc+4uH2IdH7g2vXTvWR6XNx19mGQTboZ/KyS/FZ5XTENgM9m5YzJH6z+TaDUv7LcvFIgo/Rhvx6vzq//sa/McRmX2ICXAOGZVXCbCAjagKxYL82Mz9GW4GhGeIgzUWCSn6ukTuvJJxk+5SO/WT+IPAxMrVBPHZD3ot04gxNkFe3jCSjDPYJkWC1Vnn3N2Z1mFiln24eEhJ6zOAGkxuOdbiH19KzVS5+cBcuj+j69S/wU5Kqj+G4vQntv1lRrBkgv8Sz3tceRglNzvJyhh5CQlVromUzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TLd2KfyAnPtWwydnta2YNE3EunYZWhxLsVug4x+Wj78=;
 b=mawD/voQu56qS4OiDemmFlTU2OBXhG4UH1q0WBEhbNBADMj9hbO+Q+8ev8bO/jSFHuT2mYT6/RKJXKiguigmKqrgTUlYhgBNMmdKNyxo9l/aosz4Kfo2xJrK7b75lQsaJsSNoqHhn1yPBWN5ZtsKPXFbCqFOy07gEoXZzCZyHws=
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com (2603:10a6:206:c::18)
 by AM6PR04MB4359.eurprd04.prod.outlook.com (2603:10a6:209:3f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.26; Sat, 27 Mar
 2021 14:39:24 +0000
Received: from AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df]) by AM5PR04MB3137.eurprd04.prod.outlook.com
 ([fe80::15d6:e539:4f60:d7df%6]) with mapi id 15.20.3955.027; Sat, 27 Mar 2021
 14:39:24 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>
CC:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "hulkci@huawei.com" <hulkci@huawei.com>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH -next] media: imx-jpeg: Fix return value check in
 mxc_jpeg_attach_pm_domains()
Thread-Topic: [PATCH -next] media: imx-jpeg: Fix return value check in
 mxc_jpeg_attach_pm_domains()
Thread-Index: AQHXH9ZgUycnOre3+0GVHoPF1+LoNaqX7kiA
Date:   Sat, 27 Mar 2021 14:39:24 +0000
Message-ID: <8464449300167d9313170697787834be45fee115.camel@nxp.com>
References: <20210323112903.1016831-1-weiyongjun1@huawei.com>
In-Reply-To: <20210323112903.1016831-1-weiyongjun1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [86.124.171.30]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 789514d0-39ce-4805-d683-08d8f12e1dc2
x-ms-traffictypediagnostic: AM6PR04MB4359:
x-microsoft-antispam-prvs: <AM6PR04MB4359B84786910F0B07B9870B8F609@AM6PR04MB4359.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2399;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1O2+UF+2eTmmpBuyhCOoAyv2zIifxyKE1FVyzbG52WaXkIzzNBM1cCIBN8C0aYBumAFsnJ+vCeJ6k63i2qVSfPR5FGi6iwkBJdPNJvrAITj2ZyAaozbrPk4KJWgtoM48cuUWO29L1zqLF2SHSd8gu48kDRmYnnuJQfckSWtdj48ce9VJUJ3GicW3comZyvBDqsGR37CT8+6KQz6S42sXueS5E4uNog/IKpIMgHq5OqcUf8nl4vucD96C/uFCFNQSGDfSMY1upoJ9ocADRYU/gOlvB5QF8mpo/TQgetyNIxmyZ0IQT5lWgU/mcNH6LKA0J3FSNSIErWth6ajKO2GUX8+1gasbT5h2oeuHenEgdztPxF+hLzOxmIxldnwyRqqCt2e6ZUxx2qDzu16MGri5n2XvoJhzobeCD4arudDQIBj7Vc04SQnoSSaZvGfHlWeC78fvelT0MJDn6Y0e0DgVHIRpqNwPfV2a4P6bb4DTeSDXfpqiRS/cH91d9hOYMTujiTD56mW/IQ4bVbOquOu3p72MDlK4PGtev8FCb/NjLJpptNQnrk+sVJrS+HWjlRV6wRUmd9Ta73KcWQ/FKXoDXbYftLkMTVfVjzIfpdjKSUdNE49Z0T/dKgx2dciYbS2kHm39WLo3otJt2tQtr1HfKMxgkKygC7Y/Pq71dCLy6nHgJrbWUZ4YkaZMw7Fenh6
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR04MB3137.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(366004)(346002)(396003)(136003)(376002)(86362001)(8676002)(6486002)(2906002)(38100700001)(8936002)(36756003)(4326008)(66446008)(66946007)(186003)(5660300002)(76116006)(6512007)(66556008)(91956017)(83380400001)(44832011)(2616005)(71200400001)(478600001)(316002)(54906003)(64756008)(110136005)(66476007)(26005)(6506007)(99106002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SkMxZ0h2T1paOEZuVmQ5YnhFTXJBNHdseEVBQlFSb3dmTHdUcDJsT1lUYlFE?=
 =?utf-8?B?ZWt1Tng2WlFEemlIcDFxQy8wMk9oZ2tyYVdQdlNuTjRaRUN1NU5CWXo5MmE2?=
 =?utf-8?B?Tk1pV1pPb2JOL3Y0U2N1Y3NyNHFhd3dkb3Zhcm80TXVmdG9qaVNZL0pHYXJJ?=
 =?utf-8?B?cnYzQlZERnJmZklDdVFHZGY4YU0vQklBOExTQ000SlRlVldWWHc2KzEzcUhS?=
 =?utf-8?B?WW8rd1Q2cnh6ODNpSTI5L01KNEFXODFyMWU3Y2lacTZxRFNNOW1yaHRaZEVk?=
 =?utf-8?B?dGdDVWJpZkFIRXk3ZWlYRGJ5c0k1QnFqYVpJUnFZa1VRK1k1Vk1EM3hWTml4?=
 =?utf-8?B?OFNFa0crL2YweUxSNk5HV3Z4L20yNC9oYTQ4WWFMQm9SU0hzb2tQTk5RcVNi?=
 =?utf-8?B?SzFhODJIWG9yOEs1TDlnWmJVZWNuWnlwMWNVczFIRXc5RDZvOTI3VkxUdENl?=
 =?utf-8?B?T0l6YXJ1eXRBMi9hNGppTWZaSGZycWN6T1BBR25OdkZMMm4xRkxVMklGUXdT?=
 =?utf-8?B?N3V1ODk4dFZTbnNpOHk2dGFOdzJBaWxzSkJhTmtZNDFtYVZ6SWVmY3dQSEwz?=
 =?utf-8?B?V3JFOXhvblNhTXE0REgzVzNrb01PQWtKZEt4ZENNc2hPU0FhWkhJYWZXbnVS?=
 =?utf-8?B?cFZFTjA5Y2lFYUJ6VXF1UmtjSHp5eXdmeGhTNW41bkRPYXpQK0lDeU1TaTV2?=
 =?utf-8?B?Z2IwQndsMU40V0dhbVFkSSs4VjFIOFZUOXE2dWl6aW4rOGNvNzIxajhYT3JU?=
 =?utf-8?B?VElzQ0hZVUUxcTBoc2dRVms4K2ptMDBuaDB4Wk02U2c4U0ZodnhVa3ZrSnQ4?=
 =?utf-8?B?Zk9OdSttdVZoNlRGZTcrRmpJNGZNWTFnRXU1WXdyNFJkTUcrcmlNMjFFUTlG?=
 =?utf-8?B?cDh5NTQ3ZDVFZURta0dzZkdCZlZ2V2FydmtkUmRCZ2MrR1N0emFMRHJDQ0Nw?=
 =?utf-8?B?N0J5OHFqZVBFbTFhNXMzMm9nVExlZkdjd3JFTUFJVC9XemFNNndZUWNITHgv?=
 =?utf-8?B?TjZtVHBuM2U1b1NHbEZlbTBpdkNNVFpWenplVmdSdVVnSGNKdkoxa01zMFpa?=
 =?utf-8?B?T2JObXdJZVVxUzUvZ0NORG9kLzRjMXJmckhWTHJDL2Rna3BydkxrUzkwaE4r?=
 =?utf-8?B?YVFYVk1URTBRN05mSGlpSFByM3FYdHlMZDRSK2JYa0pCVmJoUHNQVWt5VWV1?=
 =?utf-8?B?b0p4TzNVVTFWc1pIUGJvbHNRTUFicjJiWnNHNEpPMWlFRWVKU2pVRENTZlZE?=
 =?utf-8?B?ZVQxbW9DLzJIWVpNcXdvSWxxMDRscFdZMnhWUmN4ZXdTSUJvQ0F0azZoRUJN?=
 =?utf-8?B?K1l2L0J2RHZLK0ROZkU5N3U2M0xjOG5IbG1lSVpMOHROYTRYRnhEQk9FaXFI?=
 =?utf-8?B?UXBRR3psWmpmNVBDeTZGTFNvaGVYNzdsb3pCZzBaaHFQaTlsWFBVUTdMRXFI?=
 =?utf-8?B?R2I3MkxPckk4QlE1QlVJRWVraGJkYUpEU3J2YzBlbUtyazAyMmpBL0tPeWx3?=
 =?utf-8?B?WFBHblRhb2tKVUpmL2ExUlFrbUtjdkVXVDVhcCsyRjF4elRRekVOczR6QTJB?=
 =?utf-8?B?MEFENmJnMlkzRWtpOGQzNDZ4d3hJVU4vTFJ0YUZQU0lwZUJwaEdOSW1sRHpU?=
 =?utf-8?B?dSt2RTdXcUozQmFJdG10MUQ2L2FMWmVGTEVCWDlGbmxQbUUrSGdiNk1kUkN1?=
 =?utf-8?B?T0c2SXBNcjk2a0V6ckpPYVdTclZOcXFWWnVTeHRlaGd1aEdxVFVDMlhkVWlX?=
 =?utf-8?Q?jeTcrGZSJDXYJKj+qxf6f0qFBxWEsrsh9llNncL?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <F76996D151863248B7EEFBCB3E2807CE@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR04MB3137.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 789514d0-39ce-4805-d683-08d8f12e1dc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2021 14:39:24.1743
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B4KB7uKwR2MtZT1uq2FTDFxNm01bVAeYwmUVYQUFPCLTTcPoAAwe93jHhKNba128A+Ta8PxQWD4ixk2Qzg6P4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4359
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksDQpPbiBUdWUsIDIwMjEtMDMtMjMgYXQgMTE6MjkgKzAwMDAsICd3MDAzODU3NDEgd3JvdGU6
DQo+IEZyb206IFdlaSBZb25nanVuIDx3ZWl5b25nanVuMUBodWF3ZWkuY29tPg0KPiANCj4gSW4g
Y2FzZSBvZiBlcnJvciwgdGhlIGZ1bmN0aW9uIGRldmljZV9saW5rX2FkZCgpIHJldHVybnMgTlVM
TA0KPiBwb2ludGVyIG5vdCBFUlJfUFRSKCkuIFRoZSBJU19FUlIoKSB0ZXN0IGluIHRoZSByZXR1
cm4gdmFsdWUNCj4gY2hlY2sgc2hvdWxkIGJlIHJlcGxhY2VkIHdpdGggTlVMTCB0ZXN0Lg0KPiAN
Cj4gRml4ZXM6IDJkYjE2YzZlZDcyYyAoIm1lZGlhOiBpbXgtanBlZzogQWRkIFY0TDIgZHJpdmVy
IGZvciBpLk1YOCBKUEVHDQo+IEVuY29kZXIvRGVjb2RlciIpDQo+IFJlcG9ydGVkLWJ5OiBIdWxr
IFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogV2VpIFlvbmdqdW4g
PHdlaXlvbmdqdW4xQGh1YXdlaS5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9pbXgtanBlZy9teGMtanBlZy5jIHwgNCArKy0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWcuYw0KPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vaW14LWpwZWcvbXhjLWpwZWcuYw0KPiBpbmRleCAyZDI5NTU4ZjE4NjQuLjk1MDllYjlkOTM5
YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9pbXgtanBlZy9teGMtanBl
Zy5jDQo+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vaW14LWpwZWcvbXhjLWpwZWcuYw0K
PiBAQCAtMTk0Myw4ICsxOTQzLDggQEAgc3RhdGljIGludCBteGNfanBlZ19hdHRhY2hfcG1fZG9t
YWlucyhzdHJ1Y3QNCj4gbXhjX2pwZWdfZGV2ICpqcGVnKQ0KPiAgCQkJCQkJICAgRExfRkxBR19T
VEFURUxFU1MgfA0KPiAgCQkJCQkJICAgRExfRkxBR19QTV9SVU5USU1FIHwNCj4gIAkJCQkJCSAg
IERMX0ZMQUdfUlBNX0FDVElWRSk7DQo+IC0JCWlmIChJU19FUlIoanBlZy0+cGRfbGlua1tpXSkp
IHsNCj4gLQkJCXJldCA9IFBUUl9FUlIoanBlZy0+cGRfbGlua1tpXSk7DQo+ICsJCWlmICghanBl
Zy0+cGRfbGlua1tpXSkgew0KPiArCQkJcmV0ID0gLUVJTlZBTDsNCj4gIAkJCWdvdG8gZmFpbDsN
Cj4gIAkJfQ0KPiAgCX0NCj4gDQpUaGFua3MgZm9yIHRoZSBwYXRjaC4NCg0KUmV2aWV3ZWQtYnk6
IE1pcmVsYSBSYWJ1bGVhIDxtaXJlbGEucmFidWxlYUBueHAuY29tPg0KDQpSZWdhcmRzLA0KTWly
ZWxhDQo=
