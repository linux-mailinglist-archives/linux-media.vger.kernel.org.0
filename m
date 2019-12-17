Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2E6C12326C
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2019 17:28:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbfLQQ22 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Dec 2019 11:28:28 -0500
Received: from mail-eopbgr30078.outbound.protection.outlook.com ([40.107.3.78]:54214
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727906AbfLQQ22 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Dec 2019 11:28:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I2iUNTlCxbcbLxUKTkxKorxQJ9PG9gPK35yigVD8NgOFSIyMpeOHKWZwMzv2bAaLxkGbrSaMtzyn1URBS2phMT69VWzV/8h8TSczOnA3zlmMCpXxsgG0vBnxEFs3neeLGCsX9CO0y+2YVmHhQ3TMgSuJvPAbKmG7tnESisdQRAPzVKFvfzdjjH5BvHR45y//9A2cV7oiD/cmD4apHJpH623NTc6fVLMINxc19n6ugDvdLfSo/htGHHuNeL+hmcjCvja1EoC1o1+SA6MCtwKa5enD4bbGOlnt9nkF7pPaVifD2ogbmpmWNq042LlbxY5kazzulUyU62nqIQy18Iz8bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNpIHqHLebtwFmZLxkKAgbq0N0cU4YnNjcl+5giehho=;
 b=Mmdtan7vtjJYEAudQNjErKMbWtgHJ+K59SFahyDojF0HjNJIh0jMZkYAqQaXlVat01Vy5ezzi/Gzsqr5yt/7OD6TsUCjmSuFtWtOT9YBBC3kSHYz9ouBlXyYeXD+IBsjE5b/os+tHqm2jHNqlbtBWCb3L2UMr7I956ErgAffP4kSw4Onz6QCl6hraPz6GELAH3XimrPO40BqzrgV49MWuWozNoXY2vjS/COBtLtkdd7i4CFsJuA53twXI4yb2oXuGGvEGjY//VSEPj7LplrgTfz6DWR/9bmZu0vBv4cyFczA1qVZAHrRhfH9I+q26XeR7o/EM/p8YPB1ILrF+HNtxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oNpIHqHLebtwFmZLxkKAgbq0N0cU4YnNjcl+5giehho=;
 b=UjphGrwG5jK/uj+vvl50rSJ2+l/s8ctb3TjxP4yxLPuOx01XROr69XlRjsQhs0XxXAsZYX9HJxQwGQS11ogYE5WzoevrXboM31NoQdVO9NZAGIJ5MQOPe3fjrGgvvGCHrbOxdgxg5OAjz+oVPRY2wCZ6t6EvVpNJRpB9hSdrtBg=
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com (52.134.16.148) by
 VI1PR0402MB3341.eurprd04.prod.outlook.com (52.134.7.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.20; Tue, 17 Dec 2019 16:28:23 +0000
Received: from VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::69c1:8385:67ab:cb0f]) by VI1PR0402MB3918.eurprd04.prod.outlook.com
 ([fe80::69c1:8385:67ab:cb0f%2]) with mapi id 15.20.2538.019; Tue, 17 Dec 2019
 16:28:23 +0000
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
To:     "robh@kernel.org" <robh@kernel.org>
CC:     dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Laurentiu Palcu <laurentiu.palcu@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "paul.kocialkowski@bootlin.com" <paul.kocialkowski@bootlin.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Robert Chiras <robert.chiras@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "niklas.soderlund+renesas@ragnatech.se" 
        <niklas.soderlund+renesas@ragnatech.se>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        "dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
Subject: Re: [EXT] Re: [PATCH v3 3/6] media: dt-bindings: Add bindings for
 i.MX8QXP/QM JPEG driver
Thread-Topic: [EXT] Re: [PATCH v3 3/6] media: dt-bindings: Add bindings for
 i.MX8QXP/QM JPEG driver
Thread-Index: AQHVsa3VTtrMyqMhREKZeLqsBXBpXae9EOcAgAF5vAA=
Date:   Tue, 17 Dec 2019 16:28:23 +0000
Message-ID: <1576600102.17593.15.camel@nxp.com>
References: <1576238781-5911-1-git-send-email-mirela.rabulea@nxp.com>
         <1576238781-5911-4-git-send-email-mirela.rabulea@nxp.com>
         <20191216175624.GA24066@bogus>
In-Reply-To: <20191216175624.GA24066@bogus>
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
x-ms-office365-filtering-correlation-id: 2cfa24f9-5750-4a35-937f-08d7830e22c9
x-ms-traffictypediagnostic: VI1PR0402MB3341:|VI1PR0402MB3341:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3341A8275BB978157137578F8F500@VI1PR0402MB3341.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02543CD7CD
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(39860400002)(346002)(376002)(136003)(366004)(199004)(189003)(478600001)(36756003)(6512007)(6506007)(6916009)(66476007)(2906002)(7416002)(44832011)(4744005)(2616005)(71200400001)(86362001)(103116003)(8936002)(5660300002)(66446008)(66556008)(64756008)(54906003)(186003)(316002)(91956017)(76116006)(4326008)(8676002)(6486002)(66946007)(81166006)(81156014)(4001150100001)(26005)(99106002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR0402MB3341;H:VI1PR0402MB3918.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rTuPZemR8jPgm0jG+gpYPnr8seZS2H/dTcVwDyKZPpCfmoFfC/Ohlkrk/8baNTOwrAHHjXnJ0/jt3046ak4qUPczzgOZM5PwAlH/sbaxdaCVBrZhWtT9dG7Wcysv7VQzSeSOr9dkrhc0RmscopcM/tGAwMc9wErum64zQkiXJiEIeSpldudR/Hvu3EyRBYj2hjJ2DGCjm6dDMZ0JR6PXCgXwVmRRkq0pfRG3bi3zRKSdOmMXiKyoHSKNjB5Z2zhq985l4VlW2n04O8uOtHHf+PuPfza0a2Djb1VrCLc6vVt2BYHCOrlrF1kWchmQato9uWPAMIDMxJBhGU0J2Drd1Bwh/EA207Vqrp4o8uTy5EggcjXJzIB7A6kWosa58nc/dUnSqnoXTWyc+bp7+jwbfgF4dZscB4rxH/xFo6gfZ6To5ayX4VXLJ08ljgiI3Q0doTnZOxP0RlNkd9MLV9CrSIJiIgetEIUozV+bJCWNS8JSSYrOPAwCwCBtfd5SM+07
Content-Type: text/plain; charset="utf-8"
Content-ID: <558F85FC2BC68F49B576321DC0B19CEF@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cfa24f9-5750-4a35-937f-08d7830e22c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Dec 2019 16:28:23.1421
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YCGO48Px5j4/fs3gywubLEVTcip0xMzelGRgUfCM0VBVFOxMORZuaD5JvJRJ0SAakGjW6NECpNzo+drB737RFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3341
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTHUsIDIwMTktMTItMTYgYXQgMTE6NTYgLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBQ
bGVhc2UgYWRkIEFja2VkLWJ5L1Jldmlld2VkLWJ5IHRhZ3Mgd2hlbiBwb3N0aW5nIG5ldyB2ZXJz
aW9ucy4NCj4gSG93ZXZlciwNCj4gdGhlcmUncyBubyBuZWVkIHRvIHJlcG9zdCBwYXRjaGVzICpv
bmx5KiB0byBhZGQgdGhlIHRhZ3MuIFRoZQ0KPiB1cHN0cmVhbQ0KPiBtYWludGFpbmVyIHdpbGwg
ZG8gdGhhdCBmb3IgYWNrcyByZWNlaXZlZCBvbiB0aGUgdmVyc2lvbiB0aGV5IGFwcGx5Lg0KPiAN
Cg0KT2ssIHNvcnJ5IGFib3V0IHRoYXQsIEknbGwga2VlcCBpdCBpbiBtaW5kIGZvciBuZXh0IHRp
bWUuDQoNCj4gSWYgYSB0YWcgd2FzIG5vdCBhZGRlZCBvbiBwdXJwb3NlLCBwbGVhc2Ugc3RhdGUg
d2h5IGFuZCB3aGF0IGNoYW5nZWQuDQoNClRoZSBzb2xlIHB1cnBvc2UgZm9yIHRoaXMgX3YzIHdh
cyB0byBhZGQgYSBuZXcgcGF0Y2ggdG8gdGhlIHBhdGNoc2V0LA0KYW5kIEkgbWlzc2VkIHRoZSBv
cHBvcnR1bml0eSB0byBhZGQgdGhlIHRhZ3MuDQoNClJlZ2FyZHMsDQpNaXJlbGE=
