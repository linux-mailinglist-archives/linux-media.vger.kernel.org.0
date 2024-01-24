Return-Path: <linux-media+bounces-4149-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27483AB4C
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 15:01:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C9EB28FF0F
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 14:01:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC877A702;
	Wed, 24 Jan 2024 14:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="UEC+LcEa"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2138.outbound.protection.outlook.com [40.107.114.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8495D22084;
	Wed, 24 Jan 2024 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706104898; cv=fail; b=DMs9IM8mx0TFRpdWDDph/2TG0dhK3zwoePw28P4HURGIwwpQpVQNa2yB5hvYtX+kYQI9L+UsxU61tCKIwOcra0sKbJhA76M8gbFJbCSbUFBDrxt7u8Q5FUaDZ6o4oIYlrbc196wcBtdheZNtmfyNfuyyn4jTBvgx/Z+8qgdsfKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706104898; c=relaxed/simple;
	bh=/MTJc+5OMG9ir3gemmJy+4iofeNjdXL4yvP7x1XDs4s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zln0DKzNUE29JxjHBODqKfa06KUuZaNOvPMKFDAo6BusfiNM0GpAvWr+N51CuskQnsDFD/L5z7gaMBjGnM6/LmbPcSnTr9MOPYHUoyVA/2k1/QSZ8vS9BYpzIQEuYVq3RE2RtSbs2vGZCOxek9MUXviYMEyXZR3YeBbBSdsZLag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=UEC+LcEa; arc=fail smtp.client-ip=40.107.114.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZxcyNOO9FUwm2YJu5TuXLVjBF2yUBHOaE8ZtThQCITB9K/PxQMPF0DlR8IciaNBTL+6/C6tYFS0WOFEVjKoEd81UtFx13Q9ucWqmbZqyhgG9eFKbqTnUiGuJzXjXMmM4JMffUbdvCmrJRORvTFNxbfC0wuGL+jWlAYvq5BfxvXGg/icIMxJEyGjbdXQlShGKhvyAF4q8Zjexp3k9xN9LpsFsfT38hzRf/Qv8G5SBHyWs1YdLPM1NHNBmFEIlqhaw63W+TBwVJkNlIWWqnaAxHLHU36MAuUZe7JA6WWWyLkwVq8MgxOdwfZnNdPs7Wtu/Nva9KupsKd/UUaAwPLcB1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MTJc+5OMG9ir3gemmJy+4iofeNjdXL4yvP7x1XDs4s=;
 b=EQjA4cB+TAMDhfeZZDcvyTzNYTmDMvEz8BmzcBozLai0Iux0NUvbNhpxW9VdDgwQGP82Fc+FuvNjPn8DO1Dql0gdZHwSMAcQO9Jr7V7fyX6/9bDjBrZ4l3305E/CygpATdt01IINw8DA1J/rliYeDXuAb5TB/CkYvhqLNfiTglNZLJdXhZ69cbG+J6i4bo/mkYawGJInmMsLpTnhujjZhkdiYrohgJxmGg6uPiVqLi6mHRn6ri78ngosX+ZmzjLIMnEdf3/2C7dM+I/1vok+eKjAWdf6C7pU70ij5AT0vDR6UUF/OOz3r/AeijZKOFIAzU+ABp79p7fG7ooL9PLnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MTJc+5OMG9ir3gemmJy+4iofeNjdXL4yvP7x1XDs4s=;
 b=UEC+LcEa6FltdvaN6zYXw2Qo+e17sVsf7QIcl9Em+hPqiQZXmNMjo5wdjyfnv2OgX0rQL+ASJcMfXdLoGawSEMLSVnTwePUiLtkUVwhcPMOyg7RngWH3CO7F9yciioly+kiajPYXVfxK39hsMytCkrrDcCjk+ioOs6n/qFkyQXg=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYAPR01MB5979.jpnprd01.prod.outlook.com
 (2603:1096:402:37::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 14:01:31 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7228.023; Wed, 24 Jan 2024
 14:01:30 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Stephen Boyd
	<sboyd@kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	=?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	biju.das.au <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>
Subject: RE: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Thread-Topic: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Thread-Index: AQHaTfOGse1EYgJsOEas+jUOFEStH7DnUReAgAA2sQCAADNH8IAAOueAgAEHmBA=
Date: Wed, 24 Jan 2024 14:01:30 +0000
Message-ID:
 <TYCPR01MB1126908A3DCEE35723E102993867B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-5-biju.das.jz@bp.renesas.com>
 <Za-u9VO2OuY6vhT8@kekkonen.localdomain>
 <20240123153550.GT10679@pendragon.ideasonboard.com>
 <TYCPR01MB112691B281C74CAD8EB14433E86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <20240123221011.GA16581@pendragon.ideasonboard.com>
In-Reply-To: <20240123221011.GA16581@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYAPR01MB5979:EE_
x-ms-office365-filtering-correlation-id: f79303fa-712d-432f-2ade-08dc1ce4f725
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 rBxP8LJDTR2Ta/TuyO6ksvj9ob6pOdknzCg+vuxNajjV2ihp9Q+DNB8UONkeSCFPSku2tNeJzGDV/P+7DL9x3tNzBSUNiBBfgNsAJkky3cfBChKqnmH6fvLI9r21pMaga/az+R1OoCpfg0uZqW28qH1QH3KFOsJLSSXTwIPM5RviU955xIxhcD/KQfQ8Vv6fW3fTH/JIyRjBJFvP2VZ2VhDOKbOukSVtVoqpLa0VmysnL7ePzxzS3reWrGdxp4Ov8KYZRc0VsQuJEHWoAqKVb5/it5GmkfzMPfGXGQt66e9xQnR28Fv+pbz347OPT9Wk/FYzAcJ1Y/IsQ25g6ZWNZ/0xzxXCIZXbVgcDx/J67yd3O6L3U1u2wi6Ep7VzLbWmdeOLyjpNNL8Muo+yfKK2ttu/E0qhIKt8zxcC7d13s0ueiBPPQJKGvAKO1Hs3qVz8r2cuxb2xE7pgp1fPetmhlmFoYu1V+/G37b1KcHX7wgPVdP3K8xQZ88/auATE4Ea9hPronH0e1zfAF6AqMjTLFzRVNxeO9jqvQYnxlEMw07IImaXoN1ZsrJ25UbE9r3kHU3ukeVPvzovTgoC13fTmWyEo1NblUUXUDzVY85EJBBBOLq+k/HjY8Jq5lEpOC+DZ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(366004)(39860400002)(376002)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(38100700002)(5660300002)(2906002)(7416002)(4326008)(38070700009)(86362001)(8676002)(478600001)(6506007)(53546011)(9686003)(7696005)(83380400001)(54906003)(26005)(33656002)(8936002)(52536014)(66476007)(316002)(66446008)(71200400001)(64756008)(66556008)(76116006)(122000001)(41300700001)(110136005)(55016003)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?QWNRNXQ4dWpoemVEbHFnSzg3UzBueTRZMGNUK3F2OGdrN1B2RVUvMFVmL3hO?=
 =?utf-8?B?b2p1ZFI0ekFZL2VLbkU4WElsNnY1UjVzY0wrV3Jpb3J1WXdEaEJUL1M1NElV?=
 =?utf-8?B?dlNZcTlLbmd2VlQxaXlvNm5ybEt1c0dwU1Azb3dWeE4vVm1IT0ZUK29Jc3k3?=
 =?utf-8?B?U2wzVTVGa29OUzRMM2kxV3d1S09aWnVlNnBlSGhUZ3hxcXg2YkVPN3N5bnVK?=
 =?utf-8?B?YTFiOGNYVVVNSTl1MC9WL0tDcHJhazBDaW1rNWM5bVkwQ3dIUll5YzlOSzgv?=
 =?utf-8?B?SjlKTWg5VVBkbUIrRG9XN2ZXWHJYd1dkWlRYYWJLTDY4cFFqZURqcXBjdUVP?=
 =?utf-8?B?R2poMnY3Mk04bU84Ullhdlk5MWI2Nmc2Yy93TW9ETlNYUFdZSTdZUnBzOXpU?=
 =?utf-8?B?UTNwTWhxUmdCdm8yUGJJRWEzdmsxUHRQR0xreXA4aU04bW93Mklmcnk5ODFK?=
 =?utf-8?B?YmZMbWptVVkwVjdNS2tHSVR0SlF2VEJWUVB1NUE4MHB0YThlcnFIUHh6Q1Qw?=
 =?utf-8?B?aW03ZXVvcnNaNkhIU0lRRDBvQ01DYVNFYnUrak5LbGtqRTliS2Z1MTIvRHM2?=
 =?utf-8?B?SGhROWFKYmJDNU1nOEczUjV0NlpYMVdQcEh2cjhuRDFOeXFZTUV5Z2FjdVAv?=
 =?utf-8?B?ZFZCWjBuTVhFRTNhY3VCc0QxTmZoZWxJV05Za3l1VFhNRzVNNkt2NGNySGFq?=
 =?utf-8?B?bU5sSFUrZmx0WkxsUytVNzYxWm10NkFmckZIdHQyM1gxcllBNUtKaGtiLzBp?=
 =?utf-8?B?TXo1MnRDdWswc0ZKaExjU2VpbWpuWlcrRXZCRDVNV1hqNHpTTnpEdXFjWjhI?=
 =?utf-8?B?M3U3Z09UbVk2SjF0ZC9JMmdrajJRbC9VWXFYVjZxMVBKdjA1bldnQy91ZG85?=
 =?utf-8?B?eFF1VXFvQU80eXp4VUs0end5aWl5NldlVW9GNHFHL3BiYkpleHYwNE9xZkhq?=
 =?utf-8?B?Lzk4Yk1pSHB4RWw2aGdEK3FwQlZEY29rV25BVThuYTI2RDhkSXVvUWQzMDZU?=
 =?utf-8?B?RTBCS0JoemhOU1hDWHRaM0Y3WFpZR2tTM2tNQ0Y5emppcHF3VzhYNW9ha2dr?=
 =?utf-8?B?dDh3RC9PS205WXRkSUpuNmNOTWJLR3ZMYXJmck9qNHBrRWtnNVVnVXMvQWpB?=
 =?utf-8?B?RGtWM1FnNlE3c09ycnVLMit2V3JoeXVzU0lyQXhQRjkyc05Hd1k4cUxUWTd2?=
 =?utf-8?B?MWdjbHhwcVMwNFNhWS9WYjE5OXJaemt2NTlFNFlObWQ4dXdsdWtGT0pHT1RU?=
 =?utf-8?B?NVVVY0FlUkZKNVhhTUNINVBEUGMxSDBaRi9aUUdFNjBhNms2TSs3UUZQL2Yv?=
 =?utf-8?B?aUF2ZFo4YzgwVFNBNmVQbE5oR0E1aW5pYTBFRG9CbVFaNE1uVUZaOWdHNUNP?=
 =?utf-8?B?UUQzcnJHZ3JIck8yajIzN0d4V2xHai9jczArL1hRR1ZXbk5FSDN3ZTI1eTdq?=
 =?utf-8?B?OHpXYlZDVFdydGJEUnFqMkpxN1YvUFFTTElGK3Z2YkNNRk91NG8zVmZNU2x6?=
 =?utf-8?B?VkRxa01CUnl5bjRpM1VKaTA3VUZzSFhzRUZYSUFaVVFnaCs1L1BFdXFtSGQy?=
 =?utf-8?B?NloxdGxHNkpxdHgyNzJFZklCQnNOT3lZeThLeFZ3Z1JuUUJuTXR1NGt0Zy9E?=
 =?utf-8?B?ZXRCV0RqNXVnVXIvTEJzNmNKTWx3QkFqdFdIWUhrWHVlaGxnUjJldUlGVVpp?=
 =?utf-8?B?QXREL2E1bEZJaDJncE1BQitGT204dW1sSHNOeU4yLzZlb0lUQlJTZW95RC9L?=
 =?utf-8?B?ZXRFeXdscEszcUNCTlh4UUZmamhTODhLN2xDTDR6cEFqMlNHL0MyWGpCRlBh?=
 =?utf-8?B?eGxyM2NaVmR3UjlCVnBEamhCK2ZNMmRhQUhtSm9EbHlzSnZ1Rm81N3A5TDVT?=
 =?utf-8?B?bTh3VU1WaEcyR0RJY05ZeFAveDdraE9CWVptditaVHE3Y0FjMEx1bjFBeDE1?=
 =?utf-8?B?ejUvNXMvakVEOXQ5OW8yTjN4NzVXNHJiS1dQZ3IvNk5XbW42SkJwSGVCUEVr?=
 =?utf-8?B?L1B1OU9GTlFYRDJGMnFZQU9BU0ZCRzc4TFUwbG9kUnVXZXZDWTdEWDZObzNm?=
 =?utf-8?B?bU1kL29tQndCWTQrZHBPeWJ5V2FuVVVXV3JJLzRQU0NQZ3M2T1ZZaGlzUnN4?=
 =?utf-8?B?Y1ZkRTRweTFOdDJDcitISnQ1S1g5ZDJBeEthRFFUQ3FiU1BacUdzVG9sYzAr?=
 =?utf-8?B?NUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f79303fa-712d-432f-2ade-08dc1ce4f725
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 14:01:30.4117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JxF8js1Cyz3xXNh8u4H5X7rpmPr14N/uiuThb1/9eK9yndgN94LK8+nKBILfwSQoYMI52219J2NGIe6UWpoFi9yF319CYDEI1jZfYZyuMX8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5979

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIz
LCAyMDI0IDEwOjEwIFBNDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggNC80XSBtZWRpYTogcGxhdGZv
cm06IHJ6ZzJsLWNydTogcnpnMmwtdmlkZW86DQo+IFJlc3RydWN0dXJlIGNsayBoYW5kbGluZw0K
PiANCj4gT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMDY6NDI6MTlQTSArMDAwMCwgQmlqdSBEYXMg
d3JvdGU6DQo+ID4gPiBPbiBUdWUsIEphbiAyMywgMjAyNCBhdCAxMjoyMDowNVBNICswMDAwLCBT
YWthcmkgQWlsdXMgd3JvdGU6DQo+ID4gPiA+IE9uIFR1ZSwgSmFuIDIzLCAyMDI0IGF0IDExOjU4
OjIxQU0gKzAwMDAsIEJpanUgRGFzIHdyb3RlOg0KPiA+ID4gPiA+IEFzIHBlciBzZWN0aW9uIDM1
LjMuMSBTdGFydGluZyBSZWNlcHRpb24gZm9yIHRoZSBNSVBJIENTSS0yDQo+ID4gPiA+ID4gSW5w
dXQgb24gdGhlIGxhdGVzdCBoYXJkd2FyZSBtYW51YWwoUjAxVUgwOTE0RUowMTQwIFJldi4xLjQw
KSBpdA0KPiA+ID4gPiA+IGlzIG1lbnRpb25lZCB0aGF0IHdlIG5lZWQgdG8gc3VwcGx5IGFsbCBD
UlUgY2xrcyBhbmQgwqB3ZSBuZWVkIHRvDQo+ID4gPiA+ID4gZGlzYWJsZSB0aGUgdmNsayBiZWZv
cmUgZW5hYmxpbmcgdGhlIExJTksgcmVjZXB0aW9uIGFuZCBlbmFibGUNCj4gPiA+ID4gPiB0aGUg
dmNsayBhZnRlciBlbmFibGluZyB0aGUgbGluayBSZWNlcHRpb24uIFNvIHJlc3RydWN0dXJlIGNs
aw0KPiA+ID4gPiA+IGhhbmRsaW5nIGFzIHBlciB0aGUgSFcNCj4gPiA+IG1hbnVhbC4NCj4gPiA+
ID4gPg0KPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5y
ZW5lc2FzLmNvbT4NCj4gPiA+ID4gPiAtLS0NCj4gPiA+ID4gPiAgLi4uL3BsYXRmb3JtL3JlbmVz
YXMvcnpnMmwtY3J1L3J6ZzJsLWNydS5oICAgIHwgIDMgLQ0KPiA+ID4gPiA+ICAuLi4vcGxhdGZv
cm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY3NpMi5jICAgfCA1NSArKysrKysrKysrKystLQ0K
PiAtDQo+ID4gPiA+ID4gIC4uLi9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1pcC5j
ICAgICB8IDE1ICstLS0NCj4gPiA+ID4gPiAgLi4uL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1
L3J6ZzJsLXZpZGVvLmMgIHwgNjkNCj4gPiA+ID4gPiArKysrKysrKy0tLS0tLS0tLS0tDQo+ID4g
PiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgNjggZGVsZXRpb25zKC0p
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+ID4gYS9kcml2ZXJzL21l
ZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNydS5oDQo+ID4gPiA+ID4gYi9k
cml2ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNydS5oDQo+ID4g
PiA+ID4gaW5kZXggODExNjAzZjE4YWYwLi5hNWE5OWIwMDQzMjIgMTAwNjQ0DQo+ID4gPiA+ID4g
LS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jcnUu
aA0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1j
cnUvcnpnMmwtY3J1LmgNCj4gPiA+ID4gPiBAQCAtMTMzLDkgKzEzMyw2IEBAIHN0cnVjdCByemcy
bF9jcnVfZGV2IHsNCj4gPiA+ID4gPiAgCXN0cnVjdCB2NGwyX3BpeF9mb3JtYXQgZm9ybWF0OyAg
fTsNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IC12b2lkIHJ6ZzJsX2NydV92Y2xrX3VucHJlcGFyZShz
dHJ1Y3QgcnpnMmxfY3J1X2RldiAqY3J1KTsgLWludA0KPiA+ID4gPiA+IHJ6ZzJsX2NydV92Y2xr
X3ByZXBhcmUoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSk7DQo+ID4gPiA+ID4gLQ0KPiA+ID4g
PiA+ICBpbnQgcnpnMmxfY3J1X3N0YXJ0X2ltYWdlX3Byb2Nlc3Npbmcoc3RydWN0IHJ6ZzJsX2Ny
dV9kZXYNCj4gPiA+ID4gPiAqY3J1KTsgdm9pZCByemcybF9jcnVfc3RvcF9pbWFnZV9wcm9jZXNz
aW5nKHN0cnVjdCByemcybF9jcnVfZGV2DQo+ID4gPiA+ID4gKmNydSk7DQo+ID4gPiA+ID4NCj4g
PiA+ID4gPiBkaWZmIC0tZ2l0DQo+ID4gPiA+ID4gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Jl
bmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNzaTIuYw0KPiA+ID4gPiA+IGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jc2kyLmMNCj4gPiA+ID4gPiBpbmRleCBj
NDYwOWRhOWJmMWEuLmY0YzVjYmIzMGJjOSAxMDA2NDQNCj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNzaTIuYw0KPiA+ID4gPiA+
ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY3Np
Mi5jDQo+ID4gPiA+ID4gQEAgLTYsNiArNiw3IEBADQo+ID4gPiA+ID4gICAqLw0KPiA+ID4gPiA+
DQo+ID4gPiA+ID4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gPiA+ID4gPiArI2luY2x1ZGUg
PGxpbnV4L2Nsay1wcm92aWRlci5oPg0KPiA+ID4gPiA+ICAjaW5jbHVkZSA8bGludXgvZGVsYXku
aD4NCj4gPiA+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiA+ID4gPiA+ICAj
aW5jbHVkZSA8bGludXgvaW8uaD4NCj4gPiA+ID4gPiBAQCAtMTA4LDYgKzEwOSw3IEBAIHN0cnVj
dCByemcybF9jc2kyIHsNCj4gPiA+ID4gPiAgCXN0cnVjdCByZXNldF9jb250cm9sICpwcmVzZXRu
Ow0KPiA+ID4gPiA+ICAJc3RydWN0IHJlc2V0X2NvbnRyb2wgKmNtbl9yc3RiOw0KPiA+ID4gPiA+
ICAJc3RydWN0IGNsayAqc3lzY2xrOw0KPiA+ID4gPiA+ICsJc3RydWN0IGNsayAqdmNsazsNCj4g
PiA+ID4gPiAgCXVuc2lnbmVkIGxvbmcgdmNsa19yYXRlOw0KPiA+ID4gPiA+DQo+ID4gPiA+ID4g
IAlzdHJ1Y3QgdjRsMl9zdWJkZXYgc3ViZGV2Ow0KPiA+ID4gPiA+IEBAIC0zNjEsMTAgKzM2Mywx
MSBAQCBzdGF0aWMgaW50IHJ6ZzJsX2NzaTJfZHBoeV9zZXR0aW5nKHN0cnVjdA0KPiA+ID4gdjRs
Ml9zdWJkZXYgKnNkLCBib29sIG9uKQ0KPiA+ID4gPiA+ICAJcmV0dXJuIHJ6ZzJsX2NzaTJfZHBo
eV9kaXNhYmxlKGNzaTIpOyAgfQ0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gLXN0YXRpYyB2b2lkIHJ6
ZzJsX2NzaTJfbWlwaV9saW5rX2VuYWJsZShzdHJ1Y3QgcnpnMmxfY3NpMg0KPiA+ID4gPiA+ICpj
c2kyKQ0KPiA+ID4gPiA+ICtzdGF0aWMgaW50IHJ6ZzJsX2NzaTJfbWlwaV9saW5rX2VuYWJsZShz
dHJ1Y3QgcnpnMmxfY3NpMiAqY3NpMikNCj4gPiA+ID4gPiAgew0KPiA+ID4gPiA+ICAJdW5zaWdu
ZWQgbG9uZyB2Y2xrX3JhdGUgPSBjc2kyLT52Y2xrX3JhdGUgLyBIWl9QRVJfTUhaOw0KPiA+ID4g
PiA+ICAJdTMyIGZycnNrdywgZnJyY2xrLCBmcnJza3dfY29lZmYsIGZycmNsa19jb2VmZjsNCj4g
PiA+ID4gPiArCWludCByZXQsIGNvdW50Ow0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gIAkvKiBTZWxl
Y3QgZGF0YSBsYW5lcyAqLw0KPiA+ID4gPiA+ICAJcnpnMmxfY3NpMl93cml0ZShjc2kyLCBDU0ky
bk1DVDAsDQo+ID4gPiA+ID4gQ1NJMm5NQ1QwX1ZETE4oY3NpMi0+bGFuZXMpKTsgQEANCj4gPiA+
ID4gPiAtMzg2LDExICszODksNDAgQEAgc3RhdGljIHZvaWQNCj4gPiA+ID4gPiByemcybF9jc2ky
X21pcGlfbGlua19lbmFibGUoc3RydWN0DQo+ID4gPiByemcybF9jc2kyICpjc2kyKQ0KPiA+ID4g
PiA+ICAJcnpnMmxfY3NpMl93cml0ZShjc2kyLCBDU0kybkRURUwsIDB4Zjc3OGZmMGYpOw0KPiA+
ID4gPiA+ICAJcnpnMmxfY3NpMl93cml0ZShjc2kyLCBDU0kybkRURUgsIDB4MDBmZmZmMWYpOw0K
PiA+ID4gPiA+DQo+ID4gPiA+ID4gKwljbGtfZGlzYWJsZV91bnByZXBhcmUoY3NpMi0+dmNsayk7
DQo+ID4gPiA+ID4gKwlmb3IgKGNvdW50ID0gMDsgY291bnQgPCA1OyBjb3VudCsrKSB7DQo+ID4g
PiA+ID4gKwkJaWYgKCEoX19jbGtfaXNfZW5hYmxlZChjc2kyLT52Y2xrKSkpDQo+ID4gPiA+ID4g
KwkJCWJyZWFrOw0KPiA+ID4gPiA+ICsJCXVzbGVlcF9yYW5nZSgxMCwgMjApOw0KPiA+ID4gPiA+
ICsJfQ0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiArCWlmIChjb3VudCA9PSA1KSB7DQo+ID4gPiA+
ID4gKwkJZGV2X2Vycihjc2kyLT5kZXYsICJUaW1lb3V0LCBub3QgYWJsZSB0byB0dXJuIE9GRg0K
PiB2Y2xrXG4iKTsNCj4gPiA+ID4gPiArCQlyZXR1cm4gLUVUSU1FRE9VVDsNCj4gPiA+ID4gPiAr
CX0NCj4gPiA+ID4NCj4gPiA+ID4gSXQnZCBiZSBuaWNlIHRvIGhhdmUgYSBDQ0YgZnVuY3Rpb24g
dG8gZG8gdGhpcy4gRWl0aGVyIHdheSwgeW91DQo+ID4gPiA+IGNhbiB1c2UgcmVhZF9wb2xsX3Rp
bWVvdXQoKS4NCj4gPiA+DQo+ID4gPiBJIHdvdWxkIGhhdmUgc3dvcm4gdGhhdCBjbGtfZGlzYWJs
ZV91bnByZXBhcmUoKSBpcyBzeW5jaHJvbm91cywgYW5kDQo+ID4gPiB3b3VsZCBoYXZlIHN3b3Ju
IGV2ZW4gc3Ryb25nZXIgZm9yIGNsa19wcmVwYXJlX2VuYWJsZSgpLiBXaGF0J3MNCj4gPiA+IGdv
aW5nIG9uIGhlcmUsIGlzIHRoZXJlIHJlYWxseSBhIGRlbGF5ID8gSXQgc291bmRzIGxpa2UgYSBi
dWcgaW4gdGhlDQo+IGNsb2NrIGRyaXZlci4NCj4gPg0KPiA+IEF0IHRoZSBtb21lbnQgd2UgYXJl
IG5vdCBjaGVja2luZyBjbG9jayBzdGF0dXMgd2hlbiB3ZSB0dXJuIG9mZiBhDQo+ID4gY2xvY2sg
SG93ZXZlciwgZm9yIGNsb2NrIE9OIHdlIGFyZSBjaGVja2luZyB0aGUgc3RhdHVzIHdoaWxlIHR1
cm5pbmcgaXQNCj4gT04uDQo+ID4gV2UgbmVlZCB0byBmaXggdGhlIGRyaXZlciBmb3IgY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKCkuDQo+IA0KPiBEb2VzIHRoYXQgbWVhbiB0aGF0IHRoZSBjaGVjayBi
ZWxvdyBjbGtfcHJlcGFyZV9lbmFibGUoKSBjb3VsZCBiZSByZW1vdmVkDQo+IGFscmVhZHkgPw0K
DQpZZXMsIHRoYXQgaXMgY29ycmVjdCBJIHdpbGwgcmVtb3ZlIGluIHRoZSBuZXh0IHZlcnNpb24g
YXMgY2xrX3ByZXBhcmVfZW5hYmxlKCkgaXMNCnN5bmNocm9ub3VzIGFzIGl0IGNoZWNrcyB0aGUg
c3RhdHVzIHRvIG1ha2Ugc3VyZSBpdCBpcyB0dXJuZWQgT04uDQoNCj4gDQo+IFJlZ2FyZGluZyBj
bG9jayBkaXNhYmxlLCBpdCBpc24ndCBjbGVhciBpZiB0aGUgQVBJIGd1YXJhbnRlZXMgc3luY2hy
b25vdXMNCj4gY2FsbHMuIEknZCByZWNvbW1lbmQgYXNraW5nIHRoZSBjbG9jayBtYWludGFpbmVy
cy4gSWYgaXQgZG9lc24ndCwgdGhlbiB0aGUNCj4gY2xvY2sgZHJpdmVyIGlzbid0IHdyb25nIChh
bmQgbWF5IGxlYWQgdG8gZmFzdGVyIG9wZXJhdGlvbiBpbiBtb3N0IGNhc2VzKSwNCj4gYnV0IEkg
dGhpbmsgc3luY2hyb25pemluZyB0aGUgY2xvY2sgZGlzYWJsZSBieSB3YWl0aW5nIGZvciB0aGUg
Y2xvY2sgdG8gYmUNCj4gYWN0dWFsbHkgZGlzYWJsZWQgc2hvdWxkIGJlIGltcGxlbWVudGVkIGFz
IGEgaGVscGVyIGluIENDRi4NCg0KK2Nsay4NCg0KSGkgU3RlcGhlbiBhbmQgYWxsLA0KDQpDYW4g
eW91IHBsZWFzZSBzaGVkIHNvbWUgbGlnaHQgb24gdGhpcz8NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+
IA0KPiA+ID4gPiA+ICsNCj4gPiA+ID4gPiAgCS8qIEVuYWJsZSBMSU5LIHJlY2VwdGlvbiAqLw0K
PiA+ID4gPiA+ICAJcnpnMmxfY3NpMl93cml0ZShjc2kyLCBDU0kybk1DVDMsIENTSTJuTUNUM19S
WEVOKTsNCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUo
Y3NpMi0+dmNsayk7DQo+ID4gPiA+ID4gKwlpZiAocmV0KQ0KPiA+ID4gPiA+ICsJCXJldHVybiBy
ZXQ7DQo+ID4gPiA+ID4gKw0KPiA+ID4gPiA+ICsJZm9yIChjb3VudCA9IDA7IGNvdW50IDwgNTsg
Y291bnQrKykgew0KPiA+ID4gPiA+ICsJCWlmIChfX2Nsa19pc19lbmFibGVkKGNzaTItPnZjbGsp
KQ0KPiA+ID4gPiA+ICsJCQlicmVhazsNCj4gPiA+ID4gPiArCQl1c2xlZXBfcmFuZ2UoMTAsIDIw
KTsNCj4gPiA+ID4gPiArCX0NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwlpZiAoY291bnQgPT0g
NSkgew0KPiA+ID4gPiA+ICsJCWRldl9lcnIoY3NpMi0+ZGV2LCAiVGltZW91dCwgbm90IGFibGUg
dG8gdHVybiBPTg0KPiB2Y2xrXG4iKTsNCj4gPiA+ID4gPiArCQlyZXR1cm4gLUVUSU1FRE9VVDsN
Cj4gPiA+ID4gPiArCX0NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gKwlyZXR1cm4gMDsNCj4gPiA+
ID4gPiAgfQ0KPiA+ID4gPiA+DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQ
aW5jaGFydA0K

