Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AAD271908
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 03:36:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbgIUBgi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 20 Sep 2020 21:36:38 -0400
Received: from mail-eopbgr80081.outbound.protection.outlook.com ([40.107.8.81]:28546
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726126AbgIUBgi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 20 Sep 2020 21:36:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrKAwDeiSIFB1gEtGoiOn0TxSTOqofocC/yYb39VhbDra6pZfQ5hYyoyqhc680Hsr7pkiFTMTE2riCtz6jMLMrDJpuO5o7qxe07TNOOE2dH/yKORItKfp9lHh/SR+5TUNo9fTfAreTqYbVFrZPDC3dz5wU7lw2Cvpx38ajSpm1GfUvsj+xaNL1gcKU8OdmnBf/xnObRVJzZNz4PHDrKHL97YOvtKUE5dq4kd+LFuFL1VPnYr2ylyCYId7uvEOyLu1fVpg2ncK3vhnBs4mLuBUodaYk5q8MBGQgAyBfU7QNwQH3/L+HtODk70C3CdPXXkVcOkZbjsOuR4k2dNxYW1LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWGIgxWJ7nsFZ+WVDxXL5ibaKQpjFlUl22kpFUF4EPo=;
 b=lZJE9PKWGerSh992DN5DBEAyDnfK203yPsmhbu6L6iY6W2StXrLwB/AV8m2U80571wKlx0TE41ZdPeFrGD1zUS+WRcA50P4Dm7iSI91+tKcb+NVKCShgi9w1zzaar6jSLsZPPvYQ8qZy98szQJ5ckdMXdcNviQLtJUflrkOe/E7HHmvvpy1EvKaMMzDG4NzaUSJSuuGRYVrPz1fni3HxAwroOL7pE0c3Hm3zPM1M2A8bw+oHlwvtgxCwKq1T3DUnqfyLll/23ydpP0rtNk7Ga7FSjSX3zibQHnLG7VjPU90cHPa0nBRMVt55QVVUbc8q+q3Jv03ig0O/z+Cx8F4xNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWGIgxWJ7nsFZ+WVDxXL5ibaKQpjFlUl22kpFUF4EPo=;
 b=rokp9kwXUECiALNZv+jSZMdwP0ximST8nJC6WZft2nh7O/HhfAcYj3gb1Nz3Dkmtp7i+fEHhB4HCDKFD41SNepfcqUTn7NL+MW5AB/49IDfldWvtYK0cK3ocCS5ebbOUZ+wA29WOySVK4uIhCnNTU2HwJA0plT+hGFQsK4vVk/c=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB6PR04MB3096.eurprd04.prod.outlook.com (2603:10a6:6:c::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3391.13; Mon, 21 Sep 2020 01:36:34 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3391.011; Mon, 21 Sep 2020
 01:36:34 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sean@mess.org" <sean@mess.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH V2 1/2] bindings: media: gpio-ir-receiver: add
 linux,autosuspend-period property
Thread-Topic: [PATCH V2 1/2] bindings: media: gpio-ir-receiver: add
 linux,autosuspend-period property
Thread-Index: AQHWjaTqlcuZ7JHfeU2d1eE3MWnIXKlyUo/Q
Date:   Mon, 21 Sep 2020 01:36:34 +0000
Message-ID: <DB8PR04MB6795CC982432677E8DB40959E63A0@DB8PR04MB6795.eurprd04.prod.outlook.com>
References: <20200918181717.24056-1-qiangqing.zhang@nxp.com>
 <20200918181717.24056-2-qiangqing.zhang@nxp.com>
In-Reply-To: <20200918181717.24056-2-qiangqing.zhang@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 575a2a4a-eb56-4840-3254-08d85dcec63b
x-ms-traffictypediagnostic: DB6PR04MB3096:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR04MB309661C5495B7A157859C10EE63A0@DB6PR04MB3096.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yAQ/iesXaWXjEXnWNg6z7BOGoVf/A+x2qobGjGRZVv8kgnTbfNTRUNt5gLIA+6PIhyDGobss5VyP7uL+uWJpZWCVbN344LrekjTgvluS5HRDPJDOXGyTwOXuFD4PtKtIiODRx4uz7RH9UvDe4q3CV8UVFm2c3GFYFje2BXOKBQwkB8oV0zRdhF2OG9etWm/g2hbEm0nnu6WXcdKrmiTeh432U6O/l2E0pWnyGDibbevWdn1EflNp1GQFfXVidPBWRtXkM/OQs7VbWtLHWdW24KQmPXYeqbpQWCgK5AoTKhCxlOXnYsoFZso+FmJSH/hwBZE0ZS3CcUGFrYsqHdUuE0vBA9zD3Ui4Pi63jGWYpHItR9Il8BAw8va4NHAjVCwA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(2906002)(4326008)(64756008)(66446008)(86362001)(76116006)(66946007)(66476007)(52536014)(5660300002)(66556008)(71200400001)(8676002)(8936002)(478600001)(110136005)(6506007)(53546011)(7696005)(33656002)(186003)(26005)(54906003)(316002)(83380400001)(9686003)(55016002)(142933001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: zYkvB1Ykpm9V1Vic+jwOSAG5POQLNiSagDpTs93hSGR0rD7j3pLe1xinKSeUWHKUrKcF3WtokC5aLHfXIN7vhXqkRP/icdqKSD6FpAqKb5EfURszybwtZ8uk3DJ1C9iQvpF9Gtq9YVdhLuEnLhfnc/WPLRhTy1GxQ1V82lfV53E69wEB6CjEI0wN8QtgS2FUypMxmetG1pt6oWPkEqW+sf5Ee06W+n4pzZ0fr2551OQLENGpLUZH7L8NVfF+QkAe/z12CmtWYlyHUQKvVzzD1ycT54/cSd0KFMt6uJhags9AwRZKmyF1Ire6EUdlU9IIlC2N0rBv31cbwd3LtmrBk1bppn4cK3mvSPfmIubc946MXfExKn0EMjLYFjNacM16KziO358XlKuru19YiH+JQOeV4YkotDNaRFYYAfvrYLmC+LMsz1rJDwx+p1tU7D55g+GJ6GUAJSp1aZqxeaLK9ZgsTuqpRaJEiwrMuDhyxHutQEvlr0KROClz+7t/5xXLkdE9bseg3AOj375dsnUzw+RDQle36Zyl+zzSAJpouObtDNS/q92EpAOolN+OfXqAT9E1di6WvslTTMuaWra7cjcoQpnwk7DOaP7HK6pTXnF++9EixqXcF6VTxCaa1/8zxNNOZtBaSK+k7Q+jKzPcvg==
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 575a2a4a-eb56-4840-3254-08d85dcec63b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2020 01:36:34.1507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L7213oFUisbUYtaVOf1kGAa1bdTyb5yB1p20lRzpYdmlAg3rjpu2RONWyTKBdZX2rQwRM9orYG6w0B7fdX4xKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3096
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEpvYWtpbSBaaGFuZyA8cWlh
bmdxaW5nLnpoYW5nQG54cC5jb20+DQo+IFNlbnQ6IDIwMjDE6jnUwjE5yNUgMjoxNw0KPiBUbzog
bWNoZWhhYkBrZXJuZWwub3JnOyByb2JoK2R0QGtlcm5lbC5vcmc7IHNlYW5AbWVzcy5vcmcNCj4g
Q2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5v
cmc7DQo+IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGRsLWxpbnV4LWlteCA8bGludXgt
aW14QG54cC5jb20+DQo+IFN1YmplY3Q6IFtQQVRDSCBWMiAxLzJdIGJpbmRpbmdzOiBtZWRpYTog
Z3Bpby1pci1yZWNlaXZlcjogYWRkDQo+IGxpbnV4LGF1dG9zdXNwZW5kLXBlcmlvZCBwcm9wZXJ0
eQ0KPiANCj4gQWRkIGxpbnV4LGF1dG9zdXNwZW5kLXBlcmlvZCBwcm9wZXJ0eSBmb3IgZ3BpbyBp
ciByZWNlaXZlci4gU29tZSBjcHVpZGxlDQo+IHN5c3RlbXMgd2FrZSBmcm9tIGlkbGUgbWF5IHRh
a2UgYSBiaXQgbG9uZyB0aW1lLCBmb3Igc3VjaCBjYXNlLCBuZWVkIGRpc2FibGUNCj4gY3B1aWRs
ZSB0ZW1wb3JhcmlseS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvYWtpbSBaaGFuZyA8cWlhbmdx
aW5nLnpoYW5nQG54cC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VMb2dzOg0KPiBWMS0+VjI6DQo+IAkq
IE5ldyBhZGQuDQo+IC0tLQ0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2dwaW8taXItcmVjZWl2ZXIudHh0IHwgMyArKysNCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWVkaWEvZ3Bpby1pci1yZWNlaXZlci50eHQNCj4gYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvZ3Bpby1pci1yZWNlaXZlci50eHQNCj4gaW5kZXggNTgy
NjFmYjdiNDA4Li5lZjgwMmQ1ZmQxZjYgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9ncGlvLWlyLXJlY2VpdmVyLnR4dA0KPiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvZ3Bpby1pci1yZWNlaXZlci50eHQN
Cj4gQEAgLTcsNiArNyw4IEBAIFJlcXVpcmVkIHByb3BlcnRpZXM6DQo+ICBPcHRpb25hbCBwcm9w
ZXJ0aWVzOg0KPiAgCS0gbGludXgscmMtbWFwLW5hbWU6IHNlZSByYy50eHQgZmlsZSBpbiB0aGUg
c2FtZQ0KPiAgCSAgZGlyZWN0b3J5Lg0KPiArICAgICAgICAtIGxpbnV4LGF1dG9zdXNwZW5kLXBl
cmlvZDogYXV0b3N1c3BlbmQgZGVsYXkgdGltZSwNCj4gKyAgICAgICAgICB0aGUgdW5pdCBpcyBt
aWxpc2Vjb25kLg0KPiANCj4gIEV4YW1wbGUgbm9kZToNCj4gDQo+IEBAIC0xNCw0ICsxNiw1IEBA
IEV4YW1wbGUgbm9kZToNCj4gIAkJY29tcGF0aWJsZSA9ICJncGlvLWlyLXJlY2VpdmVyIjsNCj4g
IAkJZ3Bpb3MgPSA8JmdwaW8wIDE5IDE+Ow0KPiAgCQlsaW51eCxyYy1tYXAtbmFtZSA9ICJyYy1y
YzYtbWNlIjsNCj4gKwkJbGludXgsYXV0b3N1c3BlbmQtcGVyaW9kID0gMTI1Ow0KDQpTb3JyeSBm
b3IgdGhpcywgc2hvdWxkIGJlIGxpbnV4LGF1dG9zdXNwZW5kLXBlcmlvZCA9IDwxMjU+Ow0KUGxl
YXNlIHJldmlldyB0aGUgZHJpdmVyIHBhcnQgZmlyc3QsIHdpbGwgZml4IGl0IGluIG5leHQgdmVy
c2lvbi4NCg0KQmVzdCBSZWdhcmRzLA0KSm9ha2ltIFpoYW5nDQo+ICAJfTsNCj4gLS0NCj4gMi4x
Ny4xDQoNCg==
