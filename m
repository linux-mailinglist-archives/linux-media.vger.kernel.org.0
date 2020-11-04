Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9D392A6C28
	for <lists+linux-media@lfdr.de>; Wed,  4 Nov 2020 18:49:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728607AbgKDRtL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Nov 2020 12:49:11 -0500
Received: from mail-eopbgr80055.outbound.protection.outlook.com ([40.107.8.55]:36069
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726152AbgKDRtL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 4 Nov 2020 12:49:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuS0s0W0Korj6Gw3hdlkRsoTva7x+EjKo5My6EdntQON+YL6+gQIrRSrkLpdhiHxJhcuJwp91C/rdd9GWa0rdFE7rLGdjBem8KpoHPyBnZe0m6/Q51dVLxBN1NTLCgh6Sthuf3plFPxWAzAU7ciyoiO5vluIE7YsT6l/ke2hfggabIbL8gmIMQSY/HU+KSmYMsaKt12QhDwcChZ9WWADnjwjU0838ssU45kPgv0DjSN3B244dqZIQyRL9DgtBQuQg/oweUw4Pp+/RznzuGDLFRiCxEh0HVAkH91XNjP2+tsDT/YWDnhZkCR/k1mDBFkVoG1cjWuoLG7qGbhSVUtVbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh7lNqeeBAYX6Qi30PcbLNL46/1H3U77UcRX3Sc1nC8=;
 b=hYfovq4beOE622daiyAJ0gA4RUxaKYQEzW3plGaZ/D6umyM0sAyIxxzECy0JmF/Q6mZH7nBiw3DduRzXx447HWs7hSC4IFFQYooqNPPC50zzAxua2Us3vTCKORo7o7gM/Qa57rQ4dmb9GohZ4JKsUxGTJsb+CpT2TFyjNzVqxQBc2KjiateOTblmCjNmkMqJEie0c3pNunBMcUFP2hLC057ICIxpnjmWOxeVKihiJQiNV/dTcysC4FY9e35pH3V5oEZGGu1pUCvkQpq6q8PWyzaI0ZwC6m+x6Rp3hQtpvmaBJxC6jqfVqF3veRcKw7lTl96ftqUhC0DGcUO46WEulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skidata.onmicrosoft.com; s=selector2-skidata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh7lNqeeBAYX6Qi30PcbLNL46/1H3U77UcRX3Sc1nC8=;
 b=yNv8LvlnKUqSdRp3d2QopradRoAT/0NaDCsmV5RmZYHcvjZRDZ+r84k/xHBsejuMmyaWD9IUQdsDhEo9jBOA72LIj4gU03bA0kjIBjM/4alpTj8LXNgsIn0aYUrDO6R0Q4iytRji3NQWfo/Ak1PwxL1cbGcLJIAZ92VuS84DBVQ=
Received: from AM6PR01MB5574.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:fc::33) by AM6PR01MB4278.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:23::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Wed, 4 Nov
 2020 17:49:05 +0000
Received: from AM6PR01MB5574.eurprd01.prod.exchangelabs.com
 ([fe80::50fd:53c1:f010:fdbe]) by AM6PR01MB5574.eurprd01.prod.exchangelabs.com
 ([fe80::50fd:53c1:f010:fdbe%4]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 17:49:05 +0000
From:   Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
CC:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Fabio Estevam <festevam@gmail.com>,
        Chris Healy <cphealy@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: RE: [PATCH v2 0/6] CODA timeout fix & assorted changes
Thread-Topic: [PATCH v2 0/6] CODA timeout fix & assorted changes
Thread-Index: AQHWnJWuBIOCBGuH2kWzbj1c5w4DpqmL/KmAgAAFtoCAB/VnAIAADwpwgCRYGgCAAACCIA==
Date:   Wed, 4 Nov 2020 17:49:04 +0000
Message-ID: <AM6PR01MB55745CB53F6BFA4ECF9B04C6E2EF0@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
References: <20201007103544.22807-1-ezequiel@collabora.com>
         <CAOMZO5DpGXoyXm0D63BL84qMAnPkNOiUcmYsmp9QdogePrLxZw@mail.gmail.com>
         <4521d217f456dbab1279cfba2d23b426435c6d9c.camel@collabora.com>
         <CAOMZO5B=3Y5C-5mStLFwdzmV+t7nqEgEOHoK6-6217UWdJWd3g@mail.gmail.com>
         <AM6PR01MB5574778C3ACD64DBC9DA4E86E2070@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
 <2144c41cd78ebed91989c4329dd4cd941be37f78.camel@collabora.com>
In-Reply-To: <2144c41cd78ebed91989c4329dd4cd941be37f78.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=skidata.com;
x-originating-ip: [77.116.122.186]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4db7d5b2-5b9e-45ab-0bd4-08d880e9ec1f
x-ms-traffictypediagnostic: AM6PR01MB4278:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR01MB42784C6042BC92A9EB275132E2EF0@AM6PR01MB4278.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mATTgLoMxJT8+qF/CIdVQFAHh1CyzEUBTbjFEabB74myL9FsUtcXJWrnNiWezd9vLoH/hDISfS1EMrBuUb1V4uvCcvJdRK78n7L454UslUxGZVAnxZBV7xw54WLwuMlvjG7XZ75sffT00GSZGXPFvze+1QrKVuIfyCBJysCSAIgFQTQqfSTUCoTS4Z37M4zh3Ujv061/+pIhHpUUK8lDSZy9U6uuAQBCCmhQSWI8BrnbDfic2g+JHaCQJHxaLariJI7hzke6z2pjIZe26+9nSLWhC9/InTjics5UNJKiM+q0v/ewQSkn4CEa51864nO4gCLT/WtrWwqNK/lCSGjGyvYTa1UGI6uZ+p5JezN6bNIP1AR7efaQr+kprQOdFLJ9OB7qGXDpK6iWqE8vb9HnPQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR01MB5574.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(39840400004)(396003)(54906003)(2906002)(316002)(8676002)(186003)(66946007)(8936002)(33656002)(6916009)(76116006)(6506007)(66556008)(7696005)(66446008)(64756008)(66476007)(966005)(5660300002)(26005)(86362001)(52536014)(83380400001)(9686003)(4326008)(71200400001)(55016002)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: uunuiubxUaQ40dV8tQtvSICeSRQAgNR9BZ6brQUTMRmx/hEqFDubgDVoldWcAeY4wHUWv4ANthGKXY7mxF6NDB406LOlX2CdLInQYfvQ9vGxXsbNfG+lMTrycDJMS3WJTh7B0EiQfD6nxlxrmcRBBzu3I8Fx7RCH/iRmDvoFmb+TDeZOQFAQd6Bf8hLVtv4G1SlgztLn+07ZlJUV9txwSzGxnLuH4iVoM0uLNEEJzP9LwHIKZRISEAQOIVcoQbH47LTdLWnMQHasuNahFwWQsU6RbIwQgtysEwyJ6CgsIqvSTbYrX6xyXfTY15AZN40sUFyhywrOUfF6DqkixiutT39e4lBN660QOkG15FnfOMtt11vLRk23phWCVO0bPknUxym5h/kO7XH+fV4ojuV3glo/NAhDJB67N3lwdwLfqBBls4rO/RRBJvQA/B6HBDxLVWDDx9GMxLm3BqYwLX4PelezCy3rCws8G3dGiGctMMQ+w8/NZqmNhBFHmAUEJUTLntg2ZX2fOHfxa5Cr58SIg/Iyw5ftKSuPx/97Z4OvzDOzPiPBEWl22SNRxfFbFI/SP7+K4Q5bL/DzOZLyN9LbycadMaOJr1uKe1+suDlG3QEIrva7Vv64QwudWspwmAkil3CT4IrWsBaiLoBO7fk/2w==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR01MB5574.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4db7d5b2-5b9e-45ab-0bd4-08d880e9ec1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 17:49:04.9258
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i6uJHzKxLKUZnyT9UbfZ188vPDI2ZePIlBg80cgNrhmV9C9TNmx2Gj2+pUpGzcvtW3NgS2esseeIjUHa9D1JLIm/gVj3SeUoVCHbYW8IJs4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR01MB4278
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBFemVxdWllbCBHYXJjaWEgPGV6
ZXF1aWVsQGNvbGxhYm9yYS5jb20+DQo+IFNlbnQ6IE1pdHR3b2NoLCA0LiBOb3ZlbWJlciAyMDIw
IDE4OjAxDQoNCkhpIGFnYWluIQ0KIA0KPiBNYW55IHRoYW5rcyBmb3IgeW91ciByZXBvcnQuIElu
ZGVlZCB5b3UgbWFuYWdlZCB0byBjcmVhdGUgYSB2aWRlbyB0aGF0IGlzIHF1aXRlDQo+IHByb2Js
ZW1hdGljIGZvciBDT0RBLg0KDQpUaGFua3MgZm9yIGxvb2tpbmcgYXQgaXQhDQoNCj4gSSBtdXN0
IGFkbWl0IEkgY2FuJ3QgZnVsbHkgd3JhcCBteSBoZWFkIGFyb3VuZCB5b3VyIHByZWZldGNoIGZp
eCwgYW5kIGhvdyB0aGUgbmV3DQo+IGNvbmRpdGlvbiB3b3VsZCBmaXggdGhpcyBpc3N1ZS4gQ291
bGQgeW91IGV4cGxhaW4gaXQgaW4gbW9yZSBkZXRhaWw/DQoNCkkgZG9uJ3QgaGF2ZSBhY2Nlc3Mg
dG8gdGhlIENPREE5NjAgZG9jdW1lbnRhdGlvbiwgc28gYWxsIG15IGZpbmRpbmdzIGFyZSBiYXNl
ZCBvbiB0ZXN0cw0Kb3IgY29kZSBkb2N1bWVudGF0aW9uLg0KDQpNeSBzdGFydGluZyBwb2ludCB3
YXMgdGhlIGlubGluZSBkb2N1bWVudGF0aW9uIFsxXToNCiJJZiB3ZSBtYW5hZ2VkIHRvIGZpbGwg
aW4gYXQgbGVhc3QgYSBmdWxsIHJlb3JkZXIgd2luZG93IG9mIGJ1ZmZlcnMgYW5kIHRoZSBiaXRz
dHJlYW0NCiBwcmVmZXRjaGVyIGhhcyBhdCBsZWFzdCAyIDI1NiBieXRlcyBwZXJpb2RzIGJleW9u
ZCB0aGUgZmlyc3QgYnVmZmVyIHRvIGZldGNoICguLi4pIi4NCg0KVGhlIGN1cnJlbnQgY29kZSBj
aGVja3MgaWYgdGhlcmUgYXJlIDUxMiBieXRlcyBhZnRlciB0aGUgY3VycmVudCBtZXRhLg0KV2hl
biBJIGNvbW1lbnQgb3V0IHRoZSBmb2xsb3dpbmcgYnJlYWssIG15IHRlc3QgdmlkZW9zIGFyZSB3
b3JraW5nLg0KU28gZm9yIG1lLCBzdGFydmF0aW9uIGlzIGNhdXNlZCBieSB0aGlzIHN0YXRlbWVu
dCwgYmVjYXVzZSBpdCBoaW5kZXJzIGZvbGxvdy11cCBtZXRhcw0KZm9yIHBlcmZvcm1hbmNlIHJl
YXNvbnMgKHRoZSBkZWNvZGVyIG1pZ2h0IGFsc28gc3RhcnQgaGljY3VwaW5nIHdpdGggdG9vIG11
Y2ggZGF0YSBlbnF1ZXVlZCwNCmJ1dCBub3Qgc3VyZSkuDQoNCkkgZGlkIHNvbWUgdGVzdHMsIGFu
ZCBiYXNpY2FsbHkgSSBmb3VuZCBvdXQgdGhhdCB0aGUgc3VtIGRvZXNuJ3QgbWF0dGVyLCBzbyBz
b21ldGhpbmcgbGlrZQ0KLSBNZXRhIDI6IDEwMjQNCi0gTWV0YSAzOiAxMDANCi0gTWV0YSA0OiAx
MDANCnN0YXJ2ZXMsIGV2ZW4gaWYgaXQgcGFzc2VzIHRoZSBjdXJyZW50IGNoZWNrLg0KDQpOZXh0
LCBJIHRob3VnaHQgYWJvdXQgIjJ4IDI1NiIgaXMgYWN0dWFsbHkgbm90IHRoZSBzYW1lIGFzICIx
eCA1MTIiLg0KV2l0aCAyeCAyNTYsIEkgY291bGQgYWN0dWFsbHkgZ290IGEgY291cGxlIG1vcmUg
dGVzdCB2aWRlb3MgcnVubmluZywgc29tZXRoaW5nIGxpa2U6DQotIE1ldGEgMjogNjUwDQotIE1l
dGEgMzogNTANCi0gTWV0YSA0OiA2NTANCg0KVGhlIGNyYWZ0aW5nIG9mIHN1Y2ggdmlkZW8gaXMg
cXVpdGUgZWFzeSBieSB2YXJ5aW5nIHRoZSBHcm91cC1vZi1QaWN0dXJlIGFuZCB0aGUgcmVzb2x1
dGlvbi4NCg0KSG93ZXZlciwgdGhlbiBJIHRyaWVkIHNvbWUgc21hbGxlciB2aWRlb3MgKHdpdGgg
bWV0YSAyICYgNDogMjU2IDwgbWV0YSA8IDUxMikgDQp3aGljaCBsZWFkIHRvIHN0YXJ2YXRpb24g
YWdhaW4uDQpJIGhhdmVuJ3QgZG9uZSBhZGRpdGlvbmFsIHRlc3RzLCBpbnN0ZWFkIEkgc2hhcmVk
IG15IGZpbmRpbmdzIGFuZCBhc2tlZCBmb3IgZnVydGhlciBkb2N1bWVudGF0aW9uDQpoaW50cyBh
Ym91dCB0aGUgYWN0dWFsIHN0YXJ2YXRpb24gY3JpdGVyaWEuDQoNClNvIG15IHNvbHV0aW9uIGlz
IGp1c3QgYSBQcm9vZi1vZi1Db25jZXB0LCBmb3VuZCBieSB0ZXN0aW5nIGFuZCBpcyBub3QgYmFj
a2VkIGJ5IGRvY3VtZW50YXRpb24gLSANCnRoZXJlZm9yZSBJIGFtIGFsc28gbm90IHN1cmUgaWYg
aXQgaXMgc3VmZmljaWVudCBvciBoYXMgYW55IHNpZGUgZWZmZWN0cy4NCg0KQmVzdCByZWdhcmRz
DQpCZW5qYW1pbiANCg0KWzFdIGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjEw
LXJjMi9zb3VyY2UvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL2NvZGEtYml0LmMjTDM1Mg0K
DQo=
