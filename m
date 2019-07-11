Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DD1365843
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 15:58:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728729AbfGKN5y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 09:57:54 -0400
Received: from mail-eopbgr00087.outbound.protection.outlook.com ([40.107.0.87]:33639
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728335AbfGKN5x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 09:57:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hjlhGb9nVfQhgbt1OK35TFvNLahZ/y2RAYYPmZc1WoDHI7VgUtGurS6E/2LhQnCFdTDr+07mhyzU0SKHiyztb7BkjZ2o58+2Dwu4gYjmVxhxOdcwvqiYUtF4UyZgnMvYlD+gGAcBQBUpOIUE6QPq8n5tWT3jLsZ3ZruBKF5Qymzf8LDQw5tuF3Q2s4ihhsZKgxf7Hda+9GdL2Xq7a0shS+nGIyKUDWt1oKaMGp7FYeyvW2IFM2Lx0X+2ull7xcMTgRkTS0O6HuWeAuFzAdWWNLOseSi2xhos2scOA44JuT4awQZxrlq0u1CRa28gHNmG0I5z1S3k2/218lk2Y7PGiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+nr2/NRCxD+ND0zAvSh8w/LDGa38Uaw8O4zNhz3BXk=;
 b=ef88NSqisBhbtOv4dYDof/aRHPefKz7piNj6b4RfYn6O3WASc0fzxSzkyPOil23JSTOZSDbydQBKHapschKgpplXE+E1/hxIgd1UwblwKnRu2T6Wo6awYM3WVYsmepMdrSf9Pqqz0MAxM49PsDpGK78FfIK9U8GkvhqF/eUoH5SPCZ2OGmKazwzeaMVyScwQeyS+180Ol1nuNuOXtob8ekIJB9vfru6QwQT1G9WGSZabTHHClTFrCI8fRueLQ349e11xCEufQI/FmtXPLmOZSGFnUaWayJb7YVPi/xa5VfbZ6rnNyrpqP7R+YYPq+bZ2lAsE3bHe0SatZuLhNJVh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=nxp.com;dmarc=pass action=none header.from=nxp.com;dkim=pass
 header.d=nxp.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0+nr2/NRCxD+ND0zAvSh8w/LDGa38Uaw8O4zNhz3BXk=;
 b=cJX3dZ3I6nvUCTbNQCfeIO0AMafMMbttlO4dwjPSj1ZkeRtHfYu8N/sYt/YdS7VHvqwKWsxyEI3A2Ux1fnG5eTOG6XB2VuaO9eQuZCkJOiyFhCUMJ0lCmXwxwaAOmORegLWoFfeG1d0lARy188bD9dUZ7F6U4Q2ahAbPDs7v2+I=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.17.31) by
 VI1PR0402MB2703.eurprd04.prod.outlook.com (10.172.255.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 13:57:50 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::a4cb:fecc:3079:494]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::a4cb:fecc:3079:494%4]) with mapi id 15.20.2052.022; Thu, 11 Jul 2019
 13:57:50 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "vivek.kasireddy@intel.com" <vivek.kasireddy@intel.com>,
        "boris.brezillon@collabora.com" <boris.brezillon@collabora.com>,
        Robert Chiras <robert.chiras@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>
Subject: Re: Re: [PATCH] media: v4l: Add packed YUV444 24bpp pixel format
Thread-Topic: Re: [PATCH] media: v4l: Add packed YUV444 24bpp pixel format
Thread-Index: AQHVN/CgZoYCDAU+vEW4YJIYV1JwUw==
Date:   Thu, 11 Jul 2019 13:57:49 +0000
Message-ID: <1562853469.9511.6.camel@nxp.com>
References: <1562166911-27454-1-git-send-email-mirela.rabulea@nxp.com>
         <20190711081808.GA15389@aptenodytes>
In-Reply-To: <20190711081808.GA15389@aptenodytes>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mirela.rabulea@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf5d72e1-b9d2-4c28-6cf4-08d70607c2f0
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR0402MB2703;
x-ms-traffictypediagnostic: VI1PR0402MB2703:
x-microsoft-antispam-prvs: <VI1PR0402MB2703172C065CA01D04DA2E188FF30@VI1PR0402MB2703.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(346002)(366004)(39860400002)(136003)(376002)(189003)(199004)(50226002)(76176011)(478600001)(11346002)(4326008)(5660300002)(256004)(99286004)(66066001)(2906002)(2351001)(7416002)(4744005)(6436002)(76116006)(6506007)(229853002)(186003)(2501003)(26005)(54906003)(7736002)(316002)(6486002)(19627235002)(305945005)(102836004)(25786009)(14454004)(71190400001)(6246003)(53936002)(486006)(103116003)(81166006)(68736007)(2616005)(86362001)(3846002)(6116002)(446003)(8936002)(8676002)(476003)(6916009)(44832011)(36756003)(66476007)(5640700003)(81156014)(66446008)(66556008)(64756008)(6512007)(91956017)(71200400001)(66946007)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB2703;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9VxV6K03EXOA2XCVZVQ5XkcugNBMw0v1pNxZAvail5KwaUvz6np1tO39UmnHdBvsoBxfB03mUCHSxuEimew/mSljieFgoW60PAv2Q+QAfAVH8tKkkqBtn9xkCbxItPvKZke6qvx0VjJ+1xaPXr7KNJy/MfJwqeoO7f9gG8Q1IqU5tNVtxEPJVZKSSCezPAwkf4ZHc4Lg5R7zA7uXmyxl1BTrKyPKnPqs+skE5CPivjafy0xkZvIbdXUJXspgXHwLjFxLPtS11Y436gJq5pNTtMzF3SmkVweNMaUZXOvucB9jB2+5NgYmKvifvXXOI4j+pAkfrtrCLSK6D86qirRi/BgXkiRna/Sz0NB6ot/+Dc6TwNqLotsXHP/N2YKCm0SrkaDpkqhQCUe1OnzMV4/FHt1tBShheEPltNgfSmHmtsI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D8B2EC59A33BC44BBFB3E3A38C1ABD84@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf5d72e1-b9d2-4c28-6cf4-08d70607c2f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 13:57:49.9249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mirela.rabulea@nxp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gSm8sIDIwMTktMDctMTEgYXQgMTA6MTggKzAyMDAsIFBhdWwgS29jaWFsa293c2tpIHdyb3Rl
Og0KPiBDYXV0aW9uOiBFWFQgRW1haWwNCj4gDQo+IEhpLA0KPiANCj4gT24gV2VkIDAzIEp1bCAx
OSwgMTg6MTUsIE1pcmVsYSBSYWJ1bGVhIHdyb3RlOg0KPiA+IA0KPiA+IFRoZSBhZGRlZCBmb3Jt
YXQgaXMgVjRMMl9QSVhfRk1UX1lVVjI0LCB0aGlzIGlzIGEgcGFja2VkDQo+ID4gWVVWIDQ6NDo0
IGZvcm1hdCwgd2l0aCA4IGJpdHMgZm9yIGVhY2ggY29tcG9uZW50LCAyNCBiaXRzDQo+ID4gcGVy
IHNhbXBsZS4NCj4gPiANCj4gPiBUaGlzIGZvcm1hdCBpcyB1c2VkIGJ5IHRoZSBpLk1YIDhRdWFk
TWF4IGFuZCBpLk1YDQo+ID4gOER1YWxYUGx1cy84UXVhZFhQbHVzDQo+ID4gSlBFRyBlbmNvZGVy
L2RlY29kZXIuDQo+IFNvIHRoaXMgZm9ybWF0IGlzIG5vdCBhbGlnbmVkIHRvIDMyLWJpdCB3b3Jk
cyBhdCBhbGwgYW5kIHdlIGNhbg0KPiBleHBlY3QNCj4gdG8gc2VlIGNhc2VzIHdoZXJlIGEgc2lu
Z2xlIDMyLWJpdCB3b3JkIGNvbnRhaW5zIGRhdGEgZm9yIHR3byBwaXhlbHM/DQo+IA0KPiBOb3Ro
aW5nIHdyb25nIHdpdGggdGhhdCwganVzdCBjaGVja2luZyB3aGV0aGVyIEkgdW5kZXJzdG9vZCB0
aGlzDQo+IHJpZ2h0IDopDQo+IA0KDQpIaSBQYXVsLA0KeWVzLCB5b3VyIHVuZGVyc3RhbmRpbmcg
aXMgY29ycmVjdC4NCg0KUmVnYXJkcywNCk1pcmVsYQ==
