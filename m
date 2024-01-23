Return-Path: <linux-media+bounces-4105-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639FE839807
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 19:42:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8727F1C2736E
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 18:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF7E5823AC;
	Tue, 23 Jan 2024 18:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PXUdhM6s"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2105.outbound.protection.outlook.com [40.107.114.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD3281AC8;
	Tue, 23 Jan 2024 18:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706035344; cv=fail; b=l5AOMNib09mu224QkZ1Dm+OmAIslxvbsxp2cJ0jVQE20HSn3qbmEcBmpZSApQIEkHpC2BJZjJ+QZDHybmX2vuW5DgEYhhYmkHNl9OuT9nwjH+4UJK7L3/lSjfVA9sRGOPcJKHALDp1l2b0bGu6LqhQ6gdxyR4vEJdcNbVyh/dqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706035344; c=relaxed/simple;
	bh=nnXMY+L4HA69atbFAiDMNsoCqNE5fPL5VwjwRMeG3XQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cGKotRnihiPIFtcxmYnd5hY8fTUYrB8FhT+P5hZxvlaExSXyBQWtMvsx7PUZA1Vy4Pk2Tt/6FEWS/Uj/QPHeBnhUfqQVpifxZ6hXtcB0tZ+Xtp00mXrcvqqk7HmRMbJQ3cGWMRTA4A1nARR46Xm5Ghj9fi/GKHpWu/IA+TbiMyA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=PXUdhM6s; arc=fail smtp.client-ip=40.107.114.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QWMaO5sMtEnEaZS4lGYEfsEPrDP6FLzwmIkTj1XPJw6OnKAeOeYBlFSxWvcSSxKKGL6s4Cb1r+/fCl27CM7fpewA6oLWQaYuUG6VGuNLkJyHFDa10LIDaaN7n/misI5T239+8oTHGwKDIDhg/w08qsfFtFGcByelIwt43q5KFgyQDFAozm79iQTxxytPRdDtpvhIBPadvpiyhrDvUXMzVZ7uIE79SCsrUqSvkOQOtFDBQJupPxWXUUmufAK6MxjY6MI6OxkkhExaEsUfpMcg1zlgPCedN3NQDsAtMuSIc/SmM4ikfEcLLZMCj5ZLIdgGWJd0yM98SOoQnyMb3cYQVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nnXMY+L4HA69atbFAiDMNsoCqNE5fPL5VwjwRMeG3XQ=;
 b=HBNa6QZF8rj0RsllSZgPH+h66Naa1gxIFh1FvS3mnLMaTSUfRJCXlIVVmHZJuJIsNp74EW7Y1dD/nU0DV0ExiqMm7Co1Jq61yMutt4KUT4v83eyIj8zjd44VnJAtk/sQQ61za+syeNzJP7Ulmw2p5Wt9ZEhiFF9EG608vH/RJDPCfWQaAZ1+Dts0URLKTXMbgxeYZpS7ON08zpW+GpNjW0MY+pdI69XutKuaqHm0K2LKfoyX4CAm6Qbgq/0GbfRQGJJbvYnq6bucPDfsM4LubuXUDMAPienVRUt8aqy3VLN6jiJ7r6dgj0ZMwHiv0Opl+m3ILCmYHHBHI0pTXFWEXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nnXMY+L4HA69atbFAiDMNsoCqNE5fPL5VwjwRMeG3XQ=;
 b=PXUdhM6s+k2MUPlmQuPUD/wPy3WM80DkmdgGweSvVTm28SiIQhL1s2suwDT6S6AJ96N4QWrIbsCFd+AW5qMvcUTAMP5h2lOQ7g1E96yDMFEhH/8O08S2QbSflTvzTTGB/8ZwbDTfv9aCVLFKfzvkNecWAZxEKCNL9A6tqKo7e4c=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSRPR01MB11632.jpnprd01.prod.outlook.com
 (2603:1096:604:22f::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Tue, 23 Jan
 2024 18:42:19 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7228.022; Tue, 23 Jan 2024
 18:42:19 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sakari Ailus
	<sakari.ailus@linux.intel.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
	<hverkuil-cisco@xs4all.nl>, =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?=
	<u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Thread-Topic: [PATCH 4/4] media: platform: rzg2l-cru: rzg2l-video: Restructure
 clk handling
Thread-Index: AQHaTfOGse1EYgJsOEas+jUOFEStH7DnUReAgAA2sQCAADNH8A==
Date: Tue, 23 Jan 2024 18:42:19 +0000
Message-ID:
 <TYCPR01MB112691B281C74CAD8EB14433E86742@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-5-biju.das.jz@bp.renesas.com>
 <Za-u9VO2OuY6vhT8@kekkonen.localdomain>
 <20240123153550.GT10679@pendragon.ideasonboard.com>
In-Reply-To: <20240123153550.GT10679@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSRPR01MB11632:EE_
x-ms-office365-filtering-correlation-id: 1ae7391e-9dd8-484b-4462-08dc1c43075a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YK+0LKPLRELwL25Nj160uC3oFUBnLDq3A3g9V734DS+LBtsy0ljWGH0+3nU+NF2905SxBQkSXWxCmmpzr/+w6S2CRqH01dmDLjXX7l9LMOrT0ECKIZ1NTRcs/E5gZKZjbSTSUZjh0UE5Y9MNDqr/xHeh8dK5AptXmSqCFWinipyuGYt3C46dddVYwRYeiTkjSxGYbc3+v7J4nqB6ihd4L9wO4xCKQn3VOTPWPl+NZprqnH6hBHiO66MpH4mZnjJml5B5PUXJo2EKfpH0t0Se+d9HLiZalmnMW+/zHgG84XX1RVIcHwvYFlnTA/TW6VdNksBAi57rvSfge0dY94gkJuAxQXtFcGm359KS3GLpLGYuLP/jac1nqYFdhubzo7NCqY8pEN/bGOfF9TQzneZHZQz2bTirY84Nfak/xEp06W5IvLjzWdv7j93fnMGpTX04Mh4XsMTZu39U9AaBcJ9cCKcg5h3y8g1gVAcXbd3QNdLBD5a3IFBkZ67eKCrMm9D4GkqM/HVcuf+E+C79wEiLPUcM42l6FVi3bSj6R0YGZqMaz2X7Ne2v76HiUH8RQ596ds7FNVnfj03Q5+5c3wM5c7CPSAL1vtldkyWmYRUVfsz0PvgNkaOUqvIDeYIBDCIM
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(110136005)(316002)(64756008)(66446008)(66476007)(54906003)(9686003)(122000001)(76116006)(66946007)(66556008)(478600001)(38100700002)(71200400001)(7696005)(6506007)(53546011)(55016003)(8676002)(8936002)(4326008)(7416002)(52536014)(5660300002)(83380400001)(26005)(2906002)(86362001)(33656002)(41300700001)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bEVFZS9ubTlsdTYyT3FwOVBSUTBUYVJuZHVCRjNBMndkem9jRFl1RFpVa0JU?=
 =?utf-8?B?L2lLMHdjR1RkMTFjOE91VW5YbHk4SWZIL281elMxZUlrUE8wd2pXc1Y3UWVh?=
 =?utf-8?B?RzJ3OTAzM0NHUzF0YWcrZEFrcW5mbStoQTRoeHlNem9HemcvQ1B1L1JjVVBJ?=
 =?utf-8?B?QmN4KzU4STBXbXgrWkxyUUVvcFEwRU43VDliNU1PTHcwcVR1OVh1VXoxcXhB?=
 =?utf-8?B?Y0lwZTRJNVBlc0ROc0J1NWM0N2VmSTFEbHp0aUE1TFJzTEY4RWFHWDltZ1cx?=
 =?utf-8?B?cFlIb3lYY2VwemZURVZLUkR5bUQ3enlNbzZYKzJnalZvQnNkdUZ4dVFuSndj?=
 =?utf-8?B?NjBTSllFaEdzMG9heExiMlRENGtRMUNvTUVncUx1bk9CK0dqWVhzRjMwWEd5?=
 =?utf-8?B?M0pEVFR2dlRpM1UyVmNaYyt2NUFPZzlUeHMwQ1p1MEFqT1crQzduNE43anRx?=
 =?utf-8?B?K0pzMk9oTDQ5N3FWN0tmSy9mV1NQTGtnVVZpYUM1ZDNFNU15ZGZsbzJDUnBT?=
 =?utf-8?B?V1FIMjVsMEZBamtyTU1yZVRFTEdtaGFiMlVlcEZWVFVZMGYyMExTWE9TNFJ3?=
 =?utf-8?B?NkRjNFFVUTR5eTA3amlYd0xOaGtiNWJqV0ZZclBQV3V6cTRDaVd1dmZSNFRa?=
 =?utf-8?B?OEY1a2tRdXBxU3FiK0MyQ1NsUVh4LzduWkZyWDVrTnM5eGxjZVhkd3I0OGlP?=
 =?utf-8?B?eUZrNEFJRnZrRkMwNVZTTm95blJqRkNYL3lGUWtTdlNpTW5uZ1hhVVZpVTVk?=
 =?utf-8?B?cGxGd1JTNTVjUlBtbTBiY2pvMmRZQWxrQURGank3VUcwa3JjMDkwc3NBbGVt?=
 =?utf-8?B?SGhTdERSenI1WXJ0bFBhcGFrdkJQa3JuSXNRbVlxd1V6MG82YkpNeXJKYzdp?=
 =?utf-8?B?TVNrOEZsVldlMlBpUHgzN3ZrUWVHK0ZpS1RSRG9XbVVMaHVrV2Ficis1UEc4?=
 =?utf-8?B?M0VmYm0yL3g2aU9TcjYwaDdEWnR2VGRvMFR2aGF3TXRPU0gvWXdyaVVxazdz?=
 =?utf-8?B?L1l1RXNkYm1FVGNrTHpRTU9wdEhWWXhmdEZzMDlwdlJmQU5ydEtjK01MUlEx?=
 =?utf-8?B?Z1dKVk1SUTFMcWs2eGxmenZFTVhVbURVQXc0d1BkVlVhSmJRRnVSNG5nSkVi?=
 =?utf-8?B?Qmx5dVhncFRlVWE1VEo2TzQwelpDSDBRenlnRk9VVVBFU3FyZHdaM0trQjZn?=
 =?utf-8?B?UXZKTUZEaXdDekdHSDFEemRkWnhTekwwZlRUa3g4d3lzZi9vN09pU25OTmVX?=
 =?utf-8?B?UzBiUXZNZzhJc1pFZXFHS05WRjluY2hDeDNSMDBrVU1UNG9kaHFPeG5rRUVB?=
 =?utf-8?B?amxKYXZqdTJOMnlYT2R2WWQ4RFE2bzRnUGNvUjV2dG8xSDBmNk9GcGM0S0s5?=
 =?utf-8?B?anBqNXQvMzZndzBPQXRkVVphVGdBN1gyWkxuK1BTNHJLR0xsZlkwK2tiaVFv?=
 =?utf-8?B?eXdmME9SYVQydGcrbGM5Y1I1eUk2ajhZNEJhZ3FibVkxSkV5bWtOeUxrQnl1?=
 =?utf-8?B?N21haXpTR0t6NGgwSWY1Rkt6aG5mRnp5bVBVdzVWd1lTK0htbGczeDhpZE55?=
 =?utf-8?B?SmdDWFgrWmhtTW0ybTJtTWk2ajVsM05RenBOdlNuMit5L2wzMTRSU3ptWEZz?=
 =?utf-8?B?ODhoRURxYk0rQmdnZjd1aytYVVk0ZGVSWlVTYzdyV3lyRlZ1RS83bTlmQ1Fn?=
 =?utf-8?B?dFVHVW00REttaXZhU3lSVHJhb2dpQVpNd0xxUzQrek85cjRYRHUyLytKNHJ0?=
 =?utf-8?B?TllYOUphNTNhNzBycUo0dks5a1ZtZ281aEhHY21ISkdjVTQ5MmxuekdpeGI5?=
 =?utf-8?B?RjJpMkxsMDVWekJWczVXV0JCcDExNUQxcUM4VE9mYS9FZHdaT2RlemFnc2l6?=
 =?utf-8?B?dnFrQ3g3NDlPamhLY2Z2WWxJa0ZDdnRzWFlHZ3ArNFZKUVdLT1F3ejg2ZnR5?=
 =?utf-8?B?UHpPb25UbXRxV3pLVjRCZHNvLzlaL0pBNmRPenhtKzVaYjExQVkxMzYxRGNL?=
 =?utf-8?B?cjlZZWtoYU1DK283VDNOWVRYcG5xSGVkZEo3S01aRXlhKzQxRVJRbkhUWlN6?=
 =?utf-8?B?aUhuMlNmOUNPL015SW1ubGI5b3ZRVlM4ZmNUK2o1eGNHOEJvaWxhYWp1Nkhu?=
 =?utf-8?B?MzNza1hyVFBpU2p3dWN4QnhlYlkwV3liWFdzYVdhampWUW51Mms3NFlhTEVm?=
 =?utf-8?B?QXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ae7391e-9dd8-484b-4462-08dc1c43075a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 18:42:19.1437
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: revB9IZBZSnwoYuyvKA5gBRcTWt8Isjt6AzWeAOXc0CflV97bM9fw0nzxqTL9I+3XJw1NprJK7BLmnnswLwRepdgjNOACGFtt2WHaivle4E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11632

SGkgTGF1cmVudCBQaW5jaGFydCwNCg0KdGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBKYW51YXJ5IDIz
LCAyMDI0IDM6MzYgUE0NCj4gU3ViamVjdDogUmU6IFtQQVRDSCA0LzRdIG1lZGlhOiBwbGF0Zm9y
bTogcnpnMmwtY3J1OiByemcybC12aWRlbzoNCj4gUmVzdHJ1Y3R1cmUgY2xrIGhhbmRsaW5nDQo+
IA0KPiBPbiBUdWUsIEphbiAyMywgMjAyNCBhdCAxMjoyMDowNVBNICswMDAwLCBTYWthcmkgQWls
dXMgd3JvdGU6DQo+ID4gSGkgQmlqdSwNCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLg0K
PiA+DQo+ID4gT24gVHVlLCBKYW4gMjMsIDIwMjQgYXQgMTE6NTg6MjFBTSArMDAwMCwgQmlqdSBE
YXMgd3JvdGU6DQo+ID4gPiBBcyBwZXIgc2VjdGlvbiAzNS4zLjEgU3RhcnRpbmcgUmVjZXB0aW9u
IGZvciB0aGUgTUlQSSBDU0ktMiBJbnB1dCBvbg0KPiA+ID4gdGhlIGxhdGVzdCBoYXJkd2FyZSBt
YW51YWwoUjAxVUgwOTE0RUowMTQwIFJldi4xLjQwKSBpdCBpcyBtZW50aW9uZWQNCj4gPiA+IHRo
YXQgd2UgbmVlZCB0byBzdXBwbHkgYWxsIENSVSBjbGtzIGFuZCDCoHdlIG5lZWQgdG8gZGlzYWJs
ZSB0aGUgdmNsaw0KPiA+ID4gYmVmb3JlIGVuYWJsaW5nIHRoZSBMSU5LIHJlY2VwdGlvbiBhbmQg
ZW5hYmxlIHRoZSB2Y2xrIGFmdGVyDQo+ID4gPiBlbmFibGluZyB0aGUgbGluayBSZWNlcHRpb24u
IFNvIHJlc3RydWN0dXJlIGNsayBoYW5kbGluZyBhcyBwZXIgdGhlIEhXDQo+IG1hbnVhbC4NCj4g
PiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNh
cy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICAuLi4vcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUv
cnpnMmwtY3J1LmggICAgfCAgMyAtDQo+ID4gPiAgLi4uL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwt
Y3J1L3J6ZzJsLWNzaTIuYyAgIHwgNTUgKysrKysrKysrKysrLS0tDQo+ID4gPiAgLi4uL3BsYXRm
b3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWlwLmMgICAgIHwgMTUgKy0tLQ0KPiA+ID4gIC4u
Li9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC12aWRlby5jICB8IDY5DQo+ID4gPiAr
KysrKysrKy0tLS0tLS0tLS0tDQo+ID4gPiAgNCBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25z
KCspLCA2OCBkZWxldGlvbnMoLSkNCj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9yZW5lc2FzL3J6ZzJsLWNydS9yemcybC1jcnUuaA0KPiA+ID4gYi9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNydS5oDQo+ID4gPiBp
bmRleCA4MTE2MDNmMThhZjAuLmE1YTk5YjAwNDMyMiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY3J1LmgNCj4gPiA+ICsr
KyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1jcnUvcnpnMmwtY3J1LmgN
Cj4gPiA+IEBAIC0xMzMsOSArMTMzLDYgQEAgc3RydWN0IHJ6ZzJsX2NydV9kZXYgew0KPiA+ID4g
IAlzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0IGZvcm1hdDsNCj4gPiA+ICB9Ow0KPiA+ID4NCj4gPiA+
IC12b2lkIHJ6ZzJsX2NydV92Y2xrX3VucHJlcGFyZShzdHJ1Y3QgcnpnMmxfY3J1X2RldiAqY3J1
KTsgLWludA0KPiA+ID4gcnpnMmxfY3J1X3ZjbGtfcHJlcGFyZShzdHJ1Y3QgcnpnMmxfY3J1X2Rl
diAqY3J1KTsNCj4gPiA+IC0NCj4gPiA+ICBpbnQgcnpnMmxfY3J1X3N0YXJ0X2ltYWdlX3Byb2Nl
c3Npbmcoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSk7DQo+ID4gPiB2b2lkIHJ6ZzJsX2NydV9z
dG9wX2ltYWdlX3Byb2Nlc3Npbmcoc3RydWN0IHJ6ZzJsX2NydV9kZXYgKmNydSk7DQo+ID4gPg0K
PiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9yemcybC1j
cnUvcnpnMmwtY3NpMi5jDQo+ID4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9y
emcybC1jcnUvcnpnMmwtY3NpMi5jDQo+ID4gPiBpbmRleCBjNDYwOWRhOWJmMWEuLmY0YzVjYmIz
MGJjOSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcmVuZXNhcy9y
emcybC1jcnUvcnpnMmwtY3NpMi5jDQo+ID4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3Jt
L3JlbmVzYXMvcnpnMmwtY3J1L3J6ZzJsLWNzaTIuYw0KPiA+ID4gQEAgLTYsNiArNiw3IEBADQo+
ID4gPiAgICovDQo+ID4gPg0KPiA+ID4gICNpbmNsdWRlIDxsaW51eC9jbGsuaD4NCj4gPiA+ICsj
aW5jbHVkZSA8bGludXgvY2xrLXByb3ZpZGVyLmg+DQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2Rl
bGF5Lmg+DQo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L2ludGVycnVwdC5oPg0KPiA+ID4gICNpbmNs
dWRlIDxsaW51eC9pby5oPg0KPiA+ID4gQEAgLTEwOCw2ICsxMDksNyBAQCBzdHJ1Y3QgcnpnMmxf
Y3NpMiB7DQo+ID4gPiAgCXN0cnVjdCByZXNldF9jb250cm9sICpwcmVzZXRuOw0KPiA+ID4gIAlz
dHJ1Y3QgcmVzZXRfY29udHJvbCAqY21uX3JzdGI7DQo+ID4gPiAgCXN0cnVjdCBjbGsgKnN5c2Ns
azsNCj4gPiA+ICsJc3RydWN0IGNsayAqdmNsazsNCj4gPiA+ICAJdW5zaWduZWQgbG9uZyB2Y2xr
X3JhdGU7DQo+ID4gPg0KPiA+ID4gIAlzdHJ1Y3QgdjRsMl9zdWJkZXYgc3ViZGV2Ow0KPiA+ID4g
QEAgLTM2MSwxMCArMzYzLDExIEBAIHN0YXRpYyBpbnQgcnpnMmxfY3NpMl9kcGh5X3NldHRpbmco
c3RydWN0DQo+IHY0bDJfc3ViZGV2ICpzZCwgYm9vbCBvbikNCj4gPiA+ICAJcmV0dXJuIHJ6ZzJs
X2NzaTJfZHBoeV9kaXNhYmxlKGNzaTIpOyAgfQ0KPiA+ID4NCj4gPiA+IC1zdGF0aWMgdm9pZCBy
emcybF9jc2kyX21pcGlfbGlua19lbmFibGUoc3RydWN0IHJ6ZzJsX2NzaTIgKmNzaTIpDQo+ID4g
PiArc3RhdGljIGludCByemcybF9jc2kyX21pcGlfbGlua19lbmFibGUoc3RydWN0IHJ6ZzJsX2Nz
aTIgKmNzaTIpDQo+ID4gPiAgew0KPiA+ID4gIAl1bnNpZ25lZCBsb25nIHZjbGtfcmF0ZSA9IGNz
aTItPnZjbGtfcmF0ZSAvIEhaX1BFUl9NSFo7DQo+ID4gPiAgCXUzMiBmcnJza3csIGZycmNsaywg
ZnJyc2t3X2NvZWZmLCBmcnJjbGtfY29lZmY7DQo+ID4gPiArCWludCByZXQsIGNvdW50Ow0KPiA+
ID4NCj4gPiA+ICAJLyogU2VsZWN0IGRhdGEgbGFuZXMgKi8NCj4gPiA+ICAJcnpnMmxfY3NpMl93
cml0ZShjc2kyLCBDU0kybk1DVDAsIENTSTJuTUNUMF9WRExOKGNzaTItPmxhbmVzKSk7IEBADQo+
ID4gPiAtMzg2LDExICszODksNDAgQEAgc3RhdGljIHZvaWQgcnpnMmxfY3NpMl9taXBpX2xpbmtf
ZW5hYmxlKHN0cnVjdA0KPiByemcybF9jc2kyICpjc2kyKQ0KPiA+ID4gIAlyemcybF9jc2kyX3dy
aXRlKGNzaTIsIENTSTJuRFRFTCwgMHhmNzc4ZmYwZik7DQo+ID4gPiAgCXJ6ZzJsX2NzaTJfd3Jp
dGUoY3NpMiwgQ1NJMm5EVEVILCAweDAwZmZmZjFmKTsNCj4gPiA+DQo+ID4gPiArCWNsa19kaXNh
YmxlX3VucHJlcGFyZShjc2kyLT52Y2xrKTsNCj4gPiA+ICsJZm9yIChjb3VudCA9IDA7IGNvdW50
IDwgNTsgY291bnQrKykgew0KPiA+ID4gKwkJaWYgKCEoX19jbGtfaXNfZW5hYmxlZChjc2kyLT52
Y2xrKSkpDQo+ID4gPiArCQkJYnJlYWs7DQo+ID4gPiArCQl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsN
Cj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwlpZiAoY291bnQgPT0gNSkgew0KPiA+ID4gKwkJ
ZGV2X2Vycihjc2kyLT5kZXYsICJUaW1lb3V0LCBub3QgYWJsZSB0byB0dXJuIE9GRiB2Y2xrXG4i
KTsNCj4gPiA+ICsJCXJldHVybiAtRVRJTUVET1VUOw0KPiA+ID4gKwl9DQo+ID4NCj4gPiBJdCdk
IGJlIG5pY2UgdG8gaGF2ZSBhIENDRiBmdW5jdGlvbiB0byBkbyB0aGlzLiBFaXRoZXIgd2F5LCB5
b3UgY2FuDQo+ID4gdXNlIHJlYWRfcG9sbF90aW1lb3V0KCkuDQo+IA0KPiBJIHdvdWxkIGhhdmUg
c3dvcm4gdGhhdCBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSBpcyBzeW5jaHJvbm91cywgYW5kIHdv
dWxkDQo+IGhhdmUgc3dvcm4gZXZlbiBzdHJvbmdlciBmb3IgY2xrX3ByZXBhcmVfZW5hYmxlKCku
IFdoYXQncyBnb2luZyBvbiBoZXJlLA0KPiBpcyB0aGVyZSByZWFsbHkgYSBkZWxheSA/IEl0IHNv
dW5kcyBsaWtlIGEgYnVnIGluIHRoZSBjbG9jayBkcml2ZXIuDQoNCkF0IHRoZSBtb21lbnQgd2Ug
YXJlIG5vdCBjaGVja2luZyBjbG9jayBzdGF0dXMgd2hlbiB3ZSB0dXJuIG9mZiBhIGNsb2NrDQpI
b3dldmVyLCBmb3IgY2xvY2sgT04gd2UgYXJlIGNoZWNraW5nIHRoZSBzdGF0dXMgd2hpbGUgdHVy
bmluZyBpdCBPTi4gDQpXZSBuZWVkIHRvIGZpeCB0aGUgZHJpdmVyIGZvciBjbGtfZGlzYWJsZV91
bnByZXBhcmUoKS4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ID4gKw0KPiA+ID4gIAkvKiBF
bmFibGUgTElOSyByZWNlcHRpb24gKi8NCj4gPiA+ICAJcnpnMmxfY3NpMl93cml0ZShjc2kyLCBD
U0kybk1DVDMsIENTSTJuTUNUM19SWEVOKTsNCj4gPiA+ICsNCj4gPiA+ICsJcmV0ID0gY2xrX3By
ZXBhcmVfZW5hYmxlKGNzaTItPnZjbGspOw0KPiA+ID4gKwlpZiAocmV0KQ0KPiA+ID4gKwkJcmV0
dXJuIHJldDsNCj4gPiA+ICsNCj4gPiA+ICsJZm9yIChjb3VudCA9IDA7IGNvdW50IDwgNTsgY291
bnQrKykgew0KPiA+ID4gKwkJaWYgKF9fY2xrX2lzX2VuYWJsZWQoY3NpMi0+dmNsaykpDQo+ID4g
PiArCQkJYnJlYWs7DQo+ID4gPiArCQl1c2xlZXBfcmFuZ2UoMTAsIDIwKTsNCj4gPiA+ICsJfQ0K
PiA+ID4gKw0KPiA+ID4gKwlpZiAoY291bnQgPT0gNSkgew0KPiA+ID4gKwkJZGV2X2Vycihjc2ky
LT5kZXYsICJUaW1lb3V0LCBub3QgYWJsZSB0byB0dXJuIE9OIHZjbGtcbiIpOw0KPiA+ID4gKwkJ
cmV0dXJuIC1FVElNRURPVVQ7DQo+ID4gPiArCX0NCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIDA7
DQo+ID4gPiAgfQ0KPiA+ID4NCj4gDQo+IC0tDQo+IFJlZ2FyZHMsDQo+IA0KPiBMYXVyZW50IFBp
bmNoYXJ0DQo=

