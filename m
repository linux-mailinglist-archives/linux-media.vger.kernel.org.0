Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44356108D15
	for <lists+linux-media@lfdr.de>; Mon, 25 Nov 2019 12:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbfKYLgk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Nov 2019 06:36:40 -0500
Received: from mail-eopbgr130057.outbound.protection.outlook.com ([40.107.13.57]:50082
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726094AbfKYLgk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Nov 2019 06:36:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ij55ZDIM0F8qTcp1ei4IDXxx/E5VRnqPra/j1LfwdfbNG743c5GePfeAiP+iHT3mzVfUL8iXV9PoXAcaCp1ANkkDbfe6/lnJE7ohIx2e2UiT29ClmW0M8ezUEx2QoRS/cRUFwwnGuxTkc/EM+S65WziQOgYnteGrF8gpyG5tKlSuiZuYfVUvrfJDYjr4GB2KwXY8mQ9J+X6U7TeLBSoptEVX05DR0yWxZGpjGEjMD4pIC1bKo2yf03cSKrLB1tFVMU6ztMpdGp5/CEgdb0xhKQMvHfMNQbPtQh5/7yxQOkT1KaZ+K6RQ73iG3qn4gHM+XAMSApjQIceYvUR0pFShQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9M2GeAbjKHMVw3sbyHe+mkVEwAod9QsURMmnOGcZvE=;
 b=Paswy/hHh3Jtfy8jPXsGdTjvPqJYpmKcwg48uvX+Xlztq0uzrARGEn9fRXdJ2bmmW+sQBqmbLSZXy9D0+src8SfcAAx1+Iyg8jmR89lpiDe+Vh9jIKPdM4EOW40nzXafUnhPXgR6B8YJRQAFt0OsUSZ+vJboYuLX/LoPPWwT1FeAJlYgbMtH4b7jLfAsv8y4JL2+cff4eUL9i61OyyWiX5IQ0FIUQv87NoJpz+w8zTmf2Mq/KZ2F9xIPujft1mSwWJIwCY8nY+xVCj6FsmxYGXXSdOq5OCX1llhyZI4k6MSCB+dmQos5niRaUic2V0RXFVLjpDTo+aEqzwY6ZxEk0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9M2GeAbjKHMVw3sbyHe+mkVEwAod9QsURMmnOGcZvE=;
 b=F5lvTJJK4g3jTx987VKj/4W4iS7fM3lf4N8FOlxOVe3mEA8u5BwYOjxYDDamwmbq946/9K3ZPzqmuGndeF/SxRr602zg3uJaYWp5dUQvumdmBAkn2wq9f3SbxoMULzAxlnCgEh3pw/93yaH7XlpQTmdA6r2cs8oKxMVHnAtI2q0=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.16.148) by
 VI1PR0402MB3630.eurprd04.prod.outlook.com (52.134.6.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.23; Mon, 25 Nov 2019 11:36:36 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::1d41:f7cc:ffa2:270c]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::1d41:f7cc:ffa2:270c%6]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 11:36:35 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
        "andrzejtp2010@gmail.com" <andrzejtp2010@gmail.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "mikhail.ulyanov@cogentembedded.com" 
        <mikhail.ulyanov@cogentembedded.com>,
        "bin.liu@mediatek.com" <bin.liu@mediatek.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "rick.chang@mediatek.com" <rick.chang@mediatek.com>
Subject: Re: [EXT] [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
Thread-Topic: [EXT] [PATCH 0/5] v4l2 JPEG helpers and CODA960 JPEG decoder
Thread-Index: AQHVmjPeFoRgzIQFhUy6NTLWcHCJAKeb1MeA
Date:   Mon, 25 Nov 2019 11:36:35 +0000
Message-ID: <1574681795.19906.27.camel@nxp.com>
References: <20191113150538.9807-1-p.zabel@pengutronix.de>
In-Reply-To: <20191113150538.9807-1-p.zabel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.18.5.2-0ubuntu3.2 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mirela.rabulea@nxp.com; 
x-originating-ip: [92.121.36.197]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e7cd3c85-3c4f-4ab7-02a2-08d7719bba8c
x-ms-traffictypediagnostic: VI1PR0402MB3630:
x-microsoft-antispam-prvs: <VI1PR0402MB36304EC52A42D7605465FCDE8F4A0@VI1PR0402MB3630.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(189003)(199004)(4744005)(4326008)(14454004)(26005)(44832011)(3846002)(6116002)(103116003)(186003)(25786009)(4001150100001)(446003)(76176011)(76116006)(91956017)(5660300002)(2616005)(66946007)(7736002)(305945005)(99286004)(66556008)(11346002)(66476007)(2906002)(6506007)(478600001)(66446008)(64756008)(6246003)(81166006)(256004)(54906003)(81156014)(8676002)(7416002)(2501003)(6436002)(102836004)(36756003)(86362001)(6486002)(6512007)(110136005)(66066001)(316002)(8936002)(71200400001)(229853002)(71190400001)(50226002)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3630;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XX7Jdmipvri8Cfdq6EoBHP7bK/W/W6FasAU5ZGLaUc7YlT3IvBoUDA3yDq8P4lcYkgj69OfLEnEmS3lNZ1v+G/0siEKfiqpvFDcqbsvuYrGbY3hNfEASRITspQo7kvFhhWj8F2JTD2JPBCSLEkk4naQ6aqoJTVDl5DX3ACOYZbHQNvZ3/WjfttL3vZff9mlrZkuDZhMvQGQRivf2gTR3LByYEv3sXWZ8G2wFihR0I7HJYHapj9IH2A+0wdev/wNvkKU3ypFwG4cgdGSEq9kGRpFbxQeVX1f0ufZpufhDJfCyJCMzN0j6xyjBuYky8xe1Vgj13R3wD6AuQODs/udeywhX8K4zu0Ipj5t3fWYFvxxgygORWDYkhzy/+dhC/KC6S06/imbGQGDIlnNgVAvn5JqXDGbrE5zwX5hO65GUYGmzJqvBlG/xXNXFNtn9QZa5
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <392EC5DFC7AB7C46BCB055095E932E4B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cd3c85-3c4f-4ab7-02a2-08d7719bba8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 11:36:35.8912
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zS18PqfQ6qxXrWJezvCpT5Az406fIBX4jN8nL9DT3uu4yXjhGN4wJzAdW5tKGwvkLnGtoMGQ30LCUnYv64Yzlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3630
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUGhpbGlwcCwNCm5pY2UgaW5pdGlhdGl2ZSA6KQ0KDQpCVFcsIEkgY291bGQgbm90IGFwcGx5
IHRoZSBwYXRjaCBzZXJpZXMgb24gbGludXgtbmV4dCByZXBvLg0KSSBhcHBsaWVkIG1hbnVhbGx5
IChwYXRjaCAtcDEpIHRoZSAjMSBwYXRjaC4gVGhlIHN1YnNlcXVlbnQgcGF0Y2hlcw0KZmFpbCB0
byBhcHBseSBldmVuIG1hbnVhbGx5LiBJJ20gaW50ZXJlc3RlZCBpbiBwYXRjaCAjMSBhbmQgIzQu
DQoNCkNvbW1lbnRzIGJlbG93Li4uDQrCoA0KT24gTWksIDIwMTktMTEtMTMgYXQgMTY6MDUgKzAx
MDAsIFBoaWxpcHAgWmFiZWwgd3JvdGU6DQo+wqANCj4gdGhlIGN1cnJlbnQgZHJpdmVycy4gSW4g
dGhlIGZ1dHVyZSB3ZSBtaWdodCB3YW50IHRvIG1vdmUgSlBFRyBoZWFkZXINCj4gZ2VuZXJhdGlv
biBmb3IgZW5jb2RlcnMgYW5kIGNvbW1vbiBxdWFudGl6YXRpb24gdGFibGVzIGluIHRoZXJlIGFz
DQo+IHdlbGwuDQpGb3IgaS5NWDgsIGl0IGlzIG5lY2Vzc2FyeSBzb21ldGltZXMgdG8gcGF0Y2gg
dGhlIGlucHV0IGpwZWcgc3RyZWFtLA0KZXZlbiBmb3IgdGhlIGRlY29kZXIsIGR1ZSB0byBzb21l
IGxpbWl0YXRpb25zIGluIHRoZSBoYXJkd2FyZSAoZXhhbXBsZToNCm9ubHkgY29tcG9uZW50IElE
c8KgYmV0d2VlbiAwLTMgb3IgMS00IGFyZSBzdXBwb3J0ZWQpDQo+IA0KPiBzZWdtZW50cy4gQWxz
bywgY291bGQgdGhpcyBiZSB1c2VkIGZvciBpLk1YOCBKUEVHREVDIGFzIGlzPw0KPiANCj4gcmVn
YXJkcw0KPiBQaGlsaXBwDQo+IA0KDQpJdCBpcyB1c2VmdWwsIEkgdHJpZWQgaXQsIGJ1dCBpdCB3
aWxsIG5vdCB3b3JrIGV4YWN0bHkgImFzIGlzIi4gSSdtDQpzZW5kaW5nIG15IGluaXRpYWwgdGhv
dWdodHMgYXMgYSByZXBseSBvbiBwYXRjaCAjMQ0KDQpSZWdhcmRzLA0KTWlyZWxh
