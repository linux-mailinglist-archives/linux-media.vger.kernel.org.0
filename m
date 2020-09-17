Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2262D26D76A
	for <lists+linux-media@lfdr.de>; Thu, 17 Sep 2020 11:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726217AbgIQJMh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Sep 2020 05:12:37 -0400
Received: from mail-eopbgr20072.outbound.protection.outlook.com ([40.107.2.72]:40510
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726171AbgIQJMh (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Sep 2020 05:12:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUDprUzKpGmsGasaIsOBEUCZ40UKNys4XuIHKif9u80zhPCphsWNd39DPw8RSDlBl58uzOcfl+s0efjZnDzpxACZ4Umd3INspe+ay6OKLvsQczFRSy9kzUlY6gZ4JYod4UEydVhZpOHq35jt0w8GR7a7OAY+9osuv9Ve3y5bLOH35GOrrXeLIC4/d4Pyt8isW+lGZJoTqGgygB7Z71ipzgvJSuXYBQKymhuGf/W56CH7Ue6+RokIJihZDZjzTP5O7+xL/PriK4w775O8IW4yRCzBI+/dgtSb5ilAZIDt1FCrHFz8vtqhG8DLFYEQJZ/ESaQQfD3+OcbytD/FgJOwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CG854cfah+9raoJ+bHgls0Yatt8PYLA/zjuYZNdoVFw=;
 b=bDNT9jM0eIZQpUxFriD+7g2qRP4HVU0ByjYnrPI5Upvk96OHNhr2XZzfvhRMY9KoCq6mEX2ykrvoTCdhDEz16sypnoS8orvdBYGGLjgkd0O17Xh7yEmNoGLzJvpkUidKDKC84J8RrxL0l4mZk2v+h1o3A6dPk7kst/53eZhyFkUHIvrqy8MidtkBqzyDbAOYNJ75jYBbhKzK7YKdwqoNnyANV+MpDMj8Og4SDBNUVOJOjRMTwkMGUVkugJH/kHaDaOonfP9Q+397XICEewmAzsKYoN4pZc6UE6OK1EAcpNaliyaSiptUZs2B/COEhVV44zDYLml0EpDVxAKuvN6s8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CG854cfah+9raoJ+bHgls0Yatt8PYLA/zjuYZNdoVFw=;
 b=Qkxq1ONLGkG3hKfKF/1MaftDPHTd1EhD4QV9zYjY4RF44foCrnJ8PSzw5woz/6PORGMSM3N+VIutBLGrZy9r0tKJ2cxWLljyy0UbuQSPTqhPjcOgnxd6nBzld2Rfnh28NZhf+gMNe9TPMa7QHirkPe7VUMw4bWrMODpi6c2KBIA=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB8PR04MB6971.eurprd04.prod.outlook.com (2603:10a6:10:113::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Thu, 17 Sep
 2020 09:12:32 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Thu, 17 Sep 2020
 09:12:32 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     Sean Young <sean@mess.org>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Thread-Topic: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Thread-Index: AQHWiy4MW1TKQEfe6k2eA6q7pgHUfqlpcD0AgAMT72A=
Date:   Thu, 17 Sep 2020 09:12:32 +0000
Message-ID: <DB8PR04MB6795CB9F519D2BD277654B29E63E0@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <20200915150202.24165-1-qiangqing.zhang@nxp.com>
 <20200915093342.GA24139@gofer.mess.org>
In-Reply-To: <20200915093342.GA24139@gofer.mess.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mess.org; dkim=none (message not signed)
 header.d=none;mess.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9b8e55a4-91f6-449e-ccc3-08d85ae9cf3e
x-ms-traffictypediagnostic: DB8PR04MB6971:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB8PR04MB69717FBFF44A4CCE9FB108C6E63E0@DB8PR04MB6971.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2733;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2kzS6JdHB3bnGw+WM0+vSIudfXwGeKDzj5RFhsJUJ6gpJcwHhqq6f01ht4fgBPBMfIs0mmJoz9F1RR1a4jYuiga7bToHeMeoSCfxslGo6587oxASDx5K7zHWnoXbP12rQA0cYHYt9mu0RBL0LUgPkrQIjJ49gtMsjGqtvgWYM+bW4Bi6cNA0QTdjtzC4kLVFVJGaELJYoczFCDDJCE5IPPe1PlOtP9SlmX/2YZf/POsf9vqc0h/z+VgtnoiqI2xPKFXPfTuYX5037s1pxVLP1FcOzHEqzjAJKQg1hHFpP4ZpujsU5rFQxO95JAJqTCJBK5jUNtHf/6ajWFDOEayB7Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(66446008)(26005)(9686003)(33656002)(186003)(64756008)(66556008)(83380400001)(66476007)(66946007)(52536014)(5660300002)(71200400001)(76116006)(6506007)(53546011)(316002)(54906003)(86362001)(6916009)(478600001)(4326008)(55016002)(8936002)(8676002)(2906002)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: W7LBWnpcH3oLYCe/NDaQPtNkxDw+jHW/osQQ8Z6pQddoFBWlI3CrrCFfw8nLq9PxuTV7qbKKemTH35SWzzf7jtdmUYb0rLFy92lO419W88kpvAqX+31R9qpAtb+cChvLjDBi8rGq9kTjVkgE47kj4H25BKPYJf8cBV90fBbw4PmWQRLhdH3Q9mu0VK+CKI3Q4pEkVuQTLGI5ja4lieD3uwu91LXBgv0E+0GhMZ31N4Vls78lghlFXDRCxRVgpPl2VSSj0xd2HSrRQ/GQvy0RsZI2xehl/WW7ECvGcjy4x9yOqgu1Et854ta0R+1wGr+MwzAbws6VHPn1bbJKxvtDBYSU/XIIiAl5AUclmbM0/+MBbVB2xcIJfMYjmKoafvJbMsOmv51TmIyikkZy5ADCnIjLkSTbWwOSPaRXZ0YXdxCHzRcdtp0oLIdCXfYmFK/uD+YKCrkyLsHvm/Dwj1get38+fOuyz2HmfI3dFgNyeNRWvhUt13CvTCNXjwSHbif9Y76Wyi8PHtgzOfy5StOIrf4n6+VW7QJ3Dvo6inaoAwWTM5gvtCb49mJDrpupxgx5ql/S29mix/v7A+9yOV9AJBTd+r+zjgsM8Vf4yafmnX+0D3HJJpxfQHGy4sxcFwDDd+77GbKjPXsaj112uN4jGg==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b8e55a4-91f6-449e-ccc3-08d85ae9cf3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2020 09:12:32.2968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QD9aK6HxYL+umZLGlDrLuOWG5RsUHJdz59SZegDfPH+SROXSZuSM5TbHkpCRSDi3sWUXhKCh39OCqkj0Aqst/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6971
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IFNlYW4gWW91bmcgPHNlYW5A
bWVzcy5vcmc+DQo+IFNlbnQ6IDIwMjDE6jnUwjE1yNUgMTc6MzQNCj4gVG86IEpvYWtpbSBaaGFu
ZyA8cWlhbmdxaW5nLnpoYW5nQG54cC5jb20+DQo+IENjOiBtY2hlaGFiQGtlcm5lbC5vcmc7IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9y
ZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SF0gbWVkaWE6IHJjOiBncGlvLWlyLXJlY3Y6IGFkZCBRb1Mgc3VwcG9ydCBmb3IgY3B1aWRsZQ0K
PiBzeXN0ZW0NCj4gDQo+IA0KDQpbLi4uXQ0KPiA+IEBAIC05Miw2ICsxMTMsMTIgQEAgc3RhdGlj
IGludCBncGlvX2lyX3JlY3ZfcHJvYmUoc3RydWN0DQo+ID4gcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiA+DQo+ID4gIAlwbGF0Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCBncGlvX2Rldik7DQo+ID4N
Cj4gPiArDQo+ID4gKwlwbV9ydW50aW1lX3NldF9hdXRvc3VzcGVuZF9kZWxheShkZXYsIChyY2Rl
di0+dGltZW91dCAvIDEwMDAgLw0KPiA+ICsxMDAwKSk7DQo+IA0KPiByY2Rldi0+dGltZW91dCBp
cyBpbiBtaWNyb3NlY29uZHMgKHNpbmNlIHZlcnkgcmVjZW50bHkpLCBzbyB0aGlzIGlzIHdyb25n
Lg0KPiBBbHNvLCB0aGUgdGltZW91dCBjYW4gYmUgY2hhbmdlZCB1c2luZyB0aGUgTElSQ19TRVRf
UkVDX1RJTUVPVVQgaW9jdGwNCj4gKHVzaW5nIGlyLWN0bCAtdCBpbiB1c2Vyc3BhY2UpLiBUaGUg
YXV0b3N1c3BlbmQgZGVsYXkgc2hvdWxkIGJlIHVwZGF0ZWQgd2hlbg0KPiB0aGlzIGhhcHBlbnMu
IFRoaXMgY2FuIGJlIGRvbmUgYnkgaW1wbGVtZW50aW5nIHRoZSBzX3RpbWVvdXQgcmNkZXYgZnVu
Y3Rpb24uDQoNCkhpIFNlYW4sDQoNCkkgY29tZSBhY3Jvc3MgYSBwcm9ibGVtIHdoZW4gaW1wbGVt
ZW50aW5nIHRoaXMgZmVhdHVyZS4NCg0KQXQgcHJvYmUgc3RhZ2UsIGRldm1fcmNfcmVnaXN0ZXJf
ZGV2aWNlIC0+IGNoYW5nZV9wcm90b2NvbCwgdGhlbiB0aW1lb3V0IHNldCB0byAxMjVtcy4NCg0K
V2hlbiBlY2hvIHNvbnkgb3IgbmVjIHRvIHByb3RvY29scywgd2lsbCBjYWxsIGNoYW5nZV9wcm90
b2NvbCBjaGFuZ2luZyB0aGUgdGltZW91dCB2YWx1ZSwgdGhhdCB0aW1lb3V0IHdvdWxkIGNoYW5n
ZSB0byBoYW5kbGVyLT5taW5fdGltZW91dCArIDEwbXMuIEZvciBzb255IGlzIDE2MDAwMDAwbnMs
IGZvciAxNTYyNTAwMG5zLg0KVGhpcyBpcyBub3QgdGhlIHdheSBJIHdhbnQgdG8gdGFrZSBiZWZv
cmUsIHRoaXMgd291bGQgZnJlcXVlbnRseSBkaXNhYmxlL2VuYWJsZSBjcHVpZGxlLiBTbyBpcyBp
dCBuZWNlc3NhcnkgdG8gcHJvdmlkZSBzX3RpbWVvdXQsIHRoaXMgY2FsbGJhY2sgc2hvdWxkIGJl
IHVzZWQgdG8gY2hhbmdlIHByb3RvY29scycgdGltZW91dD8NCklmIGltcGxlbWVudCBzX3RpbWVv
dXQsIHVzZXJzIG5lZWQgY2hhbmdlIHRoZSB0aW1lb3V0IHZhbHVlIGZyb20gdXNlcnNwYWNlLCB0
aGlzIGlzIGEgbWFuZGF0b3J5IG9wZXJhdGlvbiBhbmQgdW5mcmllbmRseS4gQW5kIGl0IHdpbGwg
YWZmZWN0IHByb3RvY29sJ3MgdGltZW91dC4NCg0KQXV0b3N1c3BlbmQgZGVsYXkgc2hvdWxkIGJl
IGZpeGVkIHZhbHVlLCBzaG91bGQgYmUgc2V0IHRvIGdwaW8gZGV2aWNlIHRpbWVvdXQgdmFsdWUs
IHdoaWNoIGlzIDEyNW1zLg0KDQpCZXN0IFJlZ2FyZHMsDQpKb2FraW0gWmhhbmcNCj4gPiArCXBt
X3J1bnRpbWVfdXNlX2F1dG9zdXNwZW5kKGRldik7DQo+ID4gKwlwbV9ydW50aW1lX3NldF9zdXNw
ZW5kZWQoZGV2KTsNCj4gPiArCXBtX3J1bnRpbWVfZW5hYmxlKGRldik7DQo+ID4gKw0KPiA+ICAJ
cmV0dXJuIGRldm1fcmVxdWVzdF9pcnEoZGV2LCBncGlvX2Rldi0+aXJxLCBncGlvX2lyX3JlY3Zf
aXJxLA0KPiA+ICAJCQkJSVJRRl9UUklHR0VSX0ZBTExJTkcgfCBJUlFGX1RSSUdHRVJfUklTSU5H
LA0KPiA+ICAJCQkJImdwaW8taXItcmVjdi1pcnEiLCBncGlvX2Rldik7DQo=
