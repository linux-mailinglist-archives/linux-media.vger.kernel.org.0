Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 088BD430DD9
	for <lists+linux-media@lfdr.de>; Mon, 18 Oct 2021 04:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236155AbhJRCf4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 17 Oct 2021 22:35:56 -0400
Received: from mga07.intel.com ([134.134.136.100]:14272 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234406AbhJRCfz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 17 Oct 2021 22:35:55 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10140"; a="291629469"
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="291629469"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2021 19:33:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,381,1624345200"; 
   d="scan'208";a="593623088"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
  by orsmga004.jf.intel.com with ESMTP; 17 Oct 2021 19:33:44 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 17 Oct 2021 19:33:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 17 Oct 2021 19:33:44 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 17 Oct 2021 19:33:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qac3twy4mngN0ARS3fcYivFWbusqEH39cCnWUwz/cHtHE04wNh244p4HQFWUwmXezZ5jC5iVZPG/dVuMn1lQuPrhSIzFv+xpdiBBW9MHoHEr/5M4lhYE64/hDmQw23CPsUw2qtNjrO4hZduFTPtcVwaAoL26jQOi8ETCpJz7vOzvWamJ7jz/D6TyP+CG/oCyPyIP+NXX6macn9kkYxxuPIotLyLZB1iRNf5qFu7nsEaAiOSenHRoB0GUnnATBd9sUPb4H6RSFDwPGE7yzeeSgfQvXDpMpfZ7mEMV2rEaJv0IiHgRSfjiSFeZgtpQdvdLYKmUxm64kqFFnirrqXC8RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YwBOOVt2vVvKJKVhXxJ1/BdlnYkDDx+s+iL8blnlRY=;
 b=hu/fOMT6SUjQXp9eva7HwboioZfsfxyq84fk/KoAHDDCM9Xuzesb48rC/ge1MdpLRMm1UX2L7KrUgJJBViPtn5coPUlS8qFt/2gCQIRjsoHntuE4A/XoNehTf0iDWBXxDOr6nO1NQvbWC9Bk9HWqTZbu+IK7o+zo5SImyBfERy+041nfcpmvHaAANKGKR83NUllGeS5ZSIqDAH0CzZrkbi9Str0Gi8gqHF8zBxoypXKn9swQn2t8lk21CQlt5aNmJcDat/c+d4OMnUyyl1HwWgq5IC2Bc3/BXavmi2f0Kf0Joi33EiSZe64ngUGKNLOrLlJZf3haszifd5K4jykuiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YwBOOVt2vVvKJKVhXxJ1/BdlnYkDDx+s+iL8blnlRY=;
 b=BNPYDPipIlqJAK4kmqu1unNf2tybo3C7Nng55ZrFzT56cakVtm3zrfwiaYRxehlKqiwh2kUYwO924g8sy3YnFW1AQHuWl2SEtZblIr3QA3AthjjCgerkrett1Gx9nyyEpqBgGmXUOTIHygEy6QtngYvOAajYwdCgWcN0kPxcbBI=
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM4PR11MB5565.namprd11.prod.outlook.com (2603:10b6:5:39a::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Mon, 18 Oct 2021 02:33:43 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%8]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 02:33:43 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
CC:     "senozhatsky@chromium.org" <senozhatsky@chromium.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH v2] media: imx258: add vblank control to support more
 frame rate range
Thread-Topic: [PATCH v2] media: imx258: add vblank control to support more
 frame rate range
Thread-Index: AQHXwZObC4V6zB3xTE+R+Qtl4Q0WaqvUeGOAgAOUu1A=
Date:   Mon, 18 Oct 2021 02:33:43 +0000
Message-ID: <DM8PR11MB5653EE31FD4AD4E33140077099BC9@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <1634281530-2238-1-git-send-email-bingbu.cao@intel.com>
 <163432737155.316423.6847119575037122257@Monstersaurus>
In-Reply-To: <163432737155.316423.6847119575037122257@Monstersaurus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 932416b9-c1bb-4afd-d8e2-08d991dfb3f5
x-ms-traffictypediagnostic: DM4PR11MB5565:
x-microsoft-antispam-prvs: <DM4PR11MB5565B41BB0CA5319C849146599BC9@DM4PR11MB5565.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Y2kFXMQs0HwaWjC8qGOs0bMQxYJrRGYfjYtJnnRAHQraEGj3X9jPsvHkFQyqLSczKnUm8svwhLpxmigprUiabJ4RoSibMJgOkdVdtKVbcXdVLsux8w5CAg412TgVrB002MH+U7GJaRaiGqqKzbTX3Eo5eYAXdQL9vtzNnKRv0Oaxd/OOq+hxRCgvT738te0SEuqQgGP0ef0YBw5X+uNfLusUX1vyATlpfIO/rPQ1SZLeKXjODIMWbgwK0j78pYTpySLsXlhVwDhevz5jGVEKMdkTKn4emj55kHkUcAFufKPnQ8aLvB/SVt5/qbvhj1+PGzcCMi+V/Kdr7BWgRrRM0kwrJ31EmpcdnjGIGRaaoV1fgvEhHnOo8Sm1pCU9gDRuhjhkYpbFSW/w80+QVh3Lnuiq+5W36k2y2eGUFJ7d87vBkoPoz3u0vK94KXX72kLkREymG8ltvgNtCiyIntFAmvhBr/JdOrxlYmjqIwPdH66HEANn/fZ2G9LdgzPih7ZZ0DE4QEJaUyCxjr4TWzBUDjUjQbKfy+opWzvq6e9TvD6zu3wRROrHnBAiERmVOQvq+fZS1Ug4ulwgwmoPZ/OvuT3GiN4DWfL0SdYYB7kd/XYzmuChLwcebi6F0DaCVnSdT4frtMNDL9DHPs5vQ8f7R6wrYLS+NQBxKSHFp3+ZQ9iAQS2OQLhQIdhUBgwOrX8JvKwbhoyZsdOXSNJOTIYxHg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(82960400001)(8936002)(83380400001)(66446008)(53546011)(4001150100001)(66476007)(38100700002)(7696005)(110136005)(508600001)(52536014)(4326008)(71200400001)(5660300002)(186003)(55016002)(76116006)(54906003)(86362001)(66946007)(33656002)(64756008)(8676002)(122000001)(2906002)(9686003)(38070700005)(316002)(66556008)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUZ0VGFEYnVhczlnK3paeGoxNWJmNEFuL2hjZlViREgxak1BQnZ2d3JwcDVJ?=
 =?utf-8?B?YkFTWXIvTEsvbnZVdHFYOHpxV3ZUMnBISTdYSStpZ1RDaXZrTXhDbjJmL0ow?=
 =?utf-8?B?MldvQ1FwMkRGUDlVVnFhczdwOFRWaTNZZnN4bFV4WldOcUpucDBJcDhXY2lw?=
 =?utf-8?B?VzlSWFM2Q29Da0J5SFdhazI5b0JjdS9pWms3aDhnbmk1bFdWZk0wZHRPejlp?=
 =?utf-8?B?dWl1T2RDbm1pem15eXR0b3lVOVhndnl5YUthbnRCRkYwUm8yWHZJYzNvUmwx?=
 =?utf-8?B?RXRSSVJIcWR1NzBIbEY4ZGViSGhsRnAvcWRMbjhrM1NVUlBCUnNNZTYxSFVt?=
 =?utf-8?B?Y0pGTUJ4ZklhUjFiZkltY1NnY29WTDRGQlppRzJhMld0MkVUOEtPT1JnZ3hW?=
 =?utf-8?B?RUswbDFDbSs4RE5QTE9yWFJFZ292K3dSZ0kwMWNQTzB3eUJCOHZCTk5kd1FB?=
 =?utf-8?B?MU4rb0ZZSGpraUw1bkZkM1FCYzBwa2JrWE14c29kSDFnaE9haHBUZGJaaVFS?=
 =?utf-8?B?MCtQRHNxQjZ0RXJpRnZ5cE52WHp3cXc4Rm5SRW9vU3JGWmdzYS93cURTMXcz?=
 =?utf-8?B?VjRwT29DM1g5ZitoTVhKVVVmN2ErKzFnQ2lZaytPczE2VHR3SEFKb0cvaEQ4?=
 =?utf-8?B?TmF5cUE3TGJmSkc4QVF4WWVHbTZCa05YUDcrd2l3SnVLU0xZS0tEeTZ4NGZD?=
 =?utf-8?B?d0FPNFk2TXRyRGlBMUdIeDY3TFA3NVZadE9hMStKZ0x1TXc0TjJBVVBWdzdU?=
 =?utf-8?B?OHQ5TVJCR21nVTN5Vzd1UGdNai9UWC93MHhlcVhicE80OEQ5a04zdHh1MSt6?=
 =?utf-8?B?OExRRGhyWk5UQWxicG5RU0lYenRydVorTzhKVjJlM3p1VWFsTS8xRTlWMW9y?=
 =?utf-8?B?bHIzSytSaEM1emVEb2ZVSjZmNWpNb0FVSGJvWXRKNlcvSFpvNzJlUWo5SHlW?=
 =?utf-8?B?WlhtTFI1YjVzZmFhU0s3QXNpaUpoeVJ3R056S0tsemRZUktVMGRGMjMwK3lS?=
 =?utf-8?B?a05pdHJmbjYyOVJqRnJ5VW5oWVZRSi9ISVZGRFdMcHhUTWo3T3BweW9MNjUx?=
 =?utf-8?B?amk4ME8wK2FxMDNhL0FWSjlLMkNMcDYrVjRzRHB4dmNEVUxRc3NqZmVxcEtj?=
 =?utf-8?B?a2k3aURLMWF0cG1GeWpZWFJZc0RYYXZJRWVHaHlqeG9lZzZFTjBBZ2NFeHAx?=
 =?utf-8?B?ZU5mRmRVVW96OXVpNVFEZEM4c2lNdTFSWnV5SEJ0SGxpQlQ1bjdaMk05VkJl?=
 =?utf-8?B?ak8wQnVvT1ZJMlAvdnlpSkJuSUx5UnZ6RUFUTy84UGljTkVFWGttSEd3Qit4?=
 =?utf-8?B?Q2VHaTYyQVVWL1AzWUxRcnFXUkNSOGdoTG5vTHZFanhnNEdFSERsQkx2VjJL?=
 =?utf-8?B?TmN3UHhFQ256YXhTQkNTWk9UTGVUdlJVY0V6ZzRqRWZVSE1XeUxabmVuNnFB?=
 =?utf-8?B?bmc1VGQ4bXBuT2doRjh5dU1KZkNkY1phTEh3V0dRTEJSdUVGYWpHM25vaUFS?=
 =?utf-8?B?RWo0dW9sdllQYnJhVDVVN1FScnF5U25JTlFWbVlFaVBxdVVwM1RXVFcrT09p?=
 =?utf-8?B?OWx6VGw2Qm81aXRxQnJRYmtHblVMMmVMeGUxbk9vSXVGa2JSL3VjTXY2aWs3?=
 =?utf-8?B?OEpzUTZCelZTM2U1Y3Yrb2VXOVFqTG4xQ3hCUXZsYXRFY0VESm1zZ1Z2Mjdn?=
 =?utf-8?B?Mk5SbWwyL3pGZ1F0cHRpc2RFVlBzUzRPSHhkUGRZVEVHUmJyd2wrZEVxTlJZ?=
 =?utf-8?Q?q4nV4wUuqtD/zN5Ra2Z0Hgcz5RTnz0ukKT6X4gw?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 932416b9-c1bb-4afd-d8e2-08d991dfb3f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2021 02:33:43.1210
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5+vFpo5I5CkNewUiJn4DllcvxC5f0+JqCrdPq/OCGRrQqqQGjo2x6CkE/GBI08NvyX2Cz1QuxOJzuWau3TDhyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5565
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEJpbmdoYW0NCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KX19fX19fX19fX19fX19f
X19fX19fX19fDQpCUnMsICANCkJpbmdidSBDYW8gDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4gRnJvbTogS2llcmFuIEJpbmdoYW0gPGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2Fy
ZC5jb20+DQo+IFNlbnQ6IFNhdHVyZGF5LCBPY3RvYmVyIDE2LCAyMDIxIDM6NTAgQU0NCj4gVG86
IENhbywgQmluZ2J1IDxiaW5nYnUuY2FvQGludGVsLmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2Vy
bmVsLm9yZzsNCj4gc2FrYXJpLmFpbHVzQGxpbnV4LmludGVsLmNvbQ0KPiBDYzogc2Vub3poYXRz
a3lAY2hyb21pdW0ub3JnOyB0ZmlnYUBjaHJvbWl1bS5vcmc7IENhbywgQmluZ2J1DQo+IDxiaW5n
YnUuY2FvQGludGVsLmNvbT47IGJpbmdidS5jYW9AbGludXguaW50ZWwuY29tDQo+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjJdIG1lZGlhOiBpbXgyNTg6IGFkZCB2YmxhbmsgY29udHJvbCB0byBzdXBw
b3J0DQo+IG1vcmUgZnJhbWUgcmF0ZSByYW5nZQ0KPiANCj4gSGkgQmluZ2J1LA0KPiANCj4gUXVv
dGluZyBCaW5nYnUgQ2FvICgyMDIxLTEwLTE1IDA4OjA1OjMwKQ0KPiA+IEN1cnJlbnQgaW14MjU4
IGRyaXZlciBlbmFibGUgdGhlIGF1dG9tYXRpYyBmcmFtZSBsZW5ndGggdHJhY2tpbmcNCj4gPiBj
b250cm9sIGJ5IGRlZmF1bHQgYW5kIGRpZCBub3Qgc3VwcG9ydCBWQkxBTksgY2hhbmdlLCBpdCdz
IGFsd2F5cw0KPiB3b3JraW5nIGF0IDMwZnBzLg0KPiA+IEhvd2V2ZXIsIGluIHJlYWxpdHkgd2Ug
bmVlZCBhIHdpZGVyIGZyYW1lIHJhdGUgcmFuZ2UgZnJvbSAxNSB0byAzMC4NCj4gPiBUaGlzIHBh
dGNoIGRpc2FibGUgdGhlIGF1dG9tYXRpYyBmcmFtZSBsZW5ndGggdHJhY2tpbmcgY29udHJvbCBh
bmQNCj4gPiBlbmFibGUgdGhlIHY0bDIgVkJMQU5LIGNvbnRyb2wgdG8gYWxsb3cgdXNlciBjaGFu
Z2luZyBmcmFtZSByYXRlIHBlcg0KPiByZXF1aXJlbWVudC4NCj4gPg0KPiA+IFNpZ25lZC1vZmYt
Ynk6IEJpbmdidSBDYW8gPGJpbmdidS5jYW9AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2
ZXJzL21lZGlhL2kyYy9pbXgyNTguYyB8IDIzICsrKysrKysrKysrKysrKysrLS0tLS0tDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPiA+IC0t
LQ0KPiA+IHYxLT52MjogcmVtb3ZlIGEgd3JvbmcgJ2JyZWFrJw0KPiA+IC0tLQ0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgyNTguYyBiL2RyaXZlcnMvbWVkaWEvaTJjL2lt
eDI1OC5jDQo+ID4gaW5kZXggODFjZGYzNzIxNmNhLi4zZjQ2NzQ0YjFhMjYgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvaW14MjU4LmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlh
L2kyYy9pbXgyNTguYw0KPiA+IEBAIC0yOSw2ICsyOSw3IEBADQo+ID4gICNkZWZpbmUgSU1YMjU4
X1ZUU19NQVggICAgICAgICAgICAgICAgIDB4ZmZmZg0KPiA+DQo+ID4gIC8qRnJhbWUgTGVuZ3Ro
IExpbmUqLw0KPiA+ICsjZGVmaW5lIElNWDI1OF9SRUdfRkxMICAgICAgICAgICAgICAgICAweDAz
NDANCj4gPiAgI2RlZmluZSBJTVgyNThfRkxMX01JTiAgICAgICAgICAgICAgICAgMHgwOGE2DQo+
ID4gICNkZWZpbmUgSU1YMjU4X0ZMTF9NQVggICAgICAgICAgICAgICAgIDB4ZmZmZg0KPiA+ICAj
ZGVmaW5lIElNWDI1OF9GTExfU1RFUCAgICAgICAgICAgICAgICAgICAgICAgIDENCj4gPiBAQCAt
MjQxLDcgKzI0Miw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaW14MjU4X3JlZw0KPiBtb2RlXzQy
MDh4MzExOF9yZWdzW10gPSB7DQo+ID4gICAgICAgICB7IDB4MDM0RCwgMHg3MCB9LA0KPiA+ICAg
ICAgICAgeyAweDAzNEUsIDB4MEMgfSwNCj4gPiAgICAgICAgIHsgMHgwMzRGLCAweDMwIH0sDQo+
ID4gLSAgICAgICB7IDB4MDM1MCwgMHgwMSB9LA0KPiA+ICsgICAgICAgeyAweDAzNTAsIDB4MDAg
fSwNCj4gDQo+IFRoZSBjb21taXQgbWVzc2FnZSBpbXBsaWVzIHRoYXQgdGhlIHJlZ2lzdGVyIDB4
MDM1MCBjb250cm9scyB0aGUNCj4gImF1dG9tYXRpYyBmcmFtZSBsZW5ndGggdHJhY2tpbmciLg0K
PiANCj4gSXMgaXQgd29ydGggYWRkaW5nIHRoYXQgcmVnaXN0ZXIgZGVzY3JpcHRpb24gYXMgYSBj
b21tZW50IGF0IHRoZSBlbmQgb2YNCj4gdGhlIGxpbmUsIHRvIGhlbHAgZnV0dXJlIHJlYWRlcnM/
DQoNClllcywgd2lsbCBhZGQgbGF0ZXIuDQoNCj4gDQo+ID4gKyAgICAgICB7IDB4MDM1MCwgMHgw
MCB9LCAvKiBhdXRvbWF0aWMgZnJhbWUgbGVuZ3RoIHRyYWNraW5nICovDQo+IA0KPiBXaXRob3V0
IGRhdGFzaGVldHMsIHRoZXNlIGxvbmcgcmVnaXN0ZXIgbGlzdHMgYXJlIHZlcnkgdGVyc2UgLi4u
DQo+IA0KPiBJZiByZWdpc3RlciBuYW1lcyAvZnVuY3Rpb25zIGNhbiBhdCBsZWFzdCBiZSBpZGVu
dGlmaWVkIHRoZW4gSSBzdXNwZWN0DQo+IGl0IHdvdWxkIGhlbHAgd2l0aCBmdXR1cmUgbWFpbnRl
bmFuY2Ugb2YgdGhlIGNvZGU/DQo+IA0KPiBPciBpcyBpdCB0b28gZnV0aWxlIHRvIGltYWdpbmUg
dGhhdCB0aGVzZSByZWdpc3RlcnMgbWlnaHQgaW1wcm92ZSBpbg0KPiBkb2N1bWVudGF0aW9uIGFz
IHRpbWUgZ29lcyBvbi4uLg0KDQpZZXMsIGl0IGNvdWxkIGJlIGRvbmUgaW4gYSBzZXBhcmF0ZSBw
YXRjaCB0byBhZGQgcmVnaXN0ZXIgZGVzY3JpcHRpb25zLiDwn5iKDQoNCj4gDQo+IC0tDQo+IEtp
ZXJhbg0KPiANCj4gDQo+ID4gICAgICAgICB7IDB4MDIwMiwgMHgwQyB9LA0KPiA+ICAgICAgICAg
eyAweDAyMDMsIDB4NDYgfSwNCj4gPiAgICAgICAgIHsgMHgwMjA0LCAweDAwIH0sDQo+ID4gQEAg
LTM2MCw3ICszNjEsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlteDI1OF9yZWcNCj4gbW9kZV8y
MTA0XzE1NjBfcmVnc1tdID0gew0KPiA+ICAgICAgICAgeyAweDAzNEQsIDB4MzggfSwNCj4gPiAg
ICAgICAgIHsgMHgwMzRFLCAweDA2IH0sDQo+ID4gICAgICAgICB7IDB4MDM0RiwgMHgxOCB9LA0K
PiA+IC0gICAgICAgeyAweDAzNTAsIDB4MDEgfSwNCj4gPiArICAgICAgIHsgMHgwMzUwLCAweDAw
IH0sDQo+ID4gICAgICAgICB7IDB4MDIwMiwgMHgwNiB9LA0KPiA+ICAgICAgICAgeyAweDAyMDMs
IDB4MkUgfSwNCj4gPiAgICAgICAgIHsgMHgwMjA0LCAweDAwIH0sDQo+ID4gQEAgLTQ3OSw3ICs0
ODAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGlteDI1OF9yZWcgbW9kZV8xMDQ4Xzc4MF9yZWdz
W10NCj4gPSB7DQo+ID4gICAgICAgICB7IDB4MDM0RCwgMHgxOCB9LA0KPiA+ICAgICAgICAgeyAw
eDAzNEUsIDB4MDMgfSwNCj4gPiAgICAgICAgIHsgMHgwMzRGLCAweDBDIH0sDQo+ID4gLSAgICAg
ICB7IDB4MDM1MCwgMHgwMSB9LA0KPiA+ICsgICAgICAgeyAweDAzNTAsIDB4MDAgfSwNCj4gPiAg
ICAgICAgIHsgMHgwMjAyLCAweDAzIH0sDQo+ID4gICAgICAgICB7IDB4MDIwMywgMHg0MiB9LA0K
PiA+ICAgICAgICAgeyAweDAyMDQsIDB4MDAgfSwNCj4gPiBAQCAtNzUzLDggKzc1NCwxNyBAQCBz
dGF0aWMgaW50IGlteDI1OF9zZXRfY3RybChzdHJ1Y3QgdjRsMl9jdHJsICpjdHJsKQ0KPiA+ICAg
ICAgICAgc3RydWN0IGlteDI1OCAqaW14MjU4ID0NCj4gPiAgICAgICAgICAgICAgICAgY29udGFp
bmVyX29mKGN0cmwtPmhhbmRsZXIsIHN0cnVjdCBpbXgyNTgsDQo+IGN0cmxfaGFuZGxlcik7DQo+
ID4gICAgICAgICBzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50ID0gdjRsMl9nZXRfc3ViZGV2ZGF0
YSgmaW14MjU4LT5zZCk7DQo+ID4gKyAgICAgICBzNjQgbWF4Ow0KPiA+ICAgICAgICAgaW50IHJl
dCA9IDA7DQo+ID4NCj4gPiArICAgICAgIGlmIChjdHJsLT5pZCA9PSBWNEwyX0NJRF9WQkxBTksp
IHsNCj4gPiArICAgICAgICAgICAgICAgLyogVXBkYXRlIG1heCBleHBvc3VyZSB0byBtZWV0IGV4
cGVjdGVkIHZibGFua2luZyAqLw0KPiA+ICsgICAgICAgICAgICAgICBtYXggPSBpbXgyNTgtPmN1
cl9tb2RlLT5oZWlnaHQgKyBjdHJsLT52YWwgLSAxMDsNCj4gPiArICAgICAgICAgICAgICAgX192
NGwyX2N0cmxfbW9kaWZ5X3JhbmdlKGlteDI1OC0+ZXhwb3N1cmUsDQo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbXgyNTgtPmV4cG9zdXJlLT5taW5pbXVtLA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWF4LCBpbXgyNTgt
PmV4cG9zdXJlLT5zdGVwLA0KPiBtYXgpOw0KPiA+ICsgICAgICAgfQ0KPiA+ICsNCj4gPiAgICAg
ICAgIC8qDQo+ID4gICAgICAgICAgKiBBcHBseWluZyBWNEwyIGNvbnRyb2wgdmFsdWUgb25seSBo
YXBwZW5zDQo+ID4gICAgICAgICAgKiB3aGVuIHBvd2VyIGlzIHVwIGZvciBzdHJlYW1pbmcgQEAg
LTc3Myw2ICs3ODMsMTAgQEAgc3RhdGljDQo+ID4gaW50IGlteDI1OF9zZXRfY3RybChzdHJ1Y3Qg
djRsMl9jdHJsICpjdHJsKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU1Y
MjU4X1JFR19WQUxVRV8xNkJJVCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGN0cmwtPnZhbCk7DQo+ID4gICAgICAgICAgICAgICAgIGJyZWFrOw0KPiA+ICsgICAgICAgY2Fz
ZSBWNEwyX0NJRF9WQkxBTks6DQo+ID4gKyAgICAgICAgICAgICAgIHJldCA9IGlteDI1OF93cml0
ZV9yZWcoaW14MjU4LCBJTVgyNThfUkVHX0ZMTCwgMiwNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBpbXgyNTgtPmN1cl9tb2RlLT5oZWlnaHQgKw0KPiBjdHJsLT52
YWwpOw0KPiA+ICsgICAgICAgICAgICAgICBicmVhazsNCj4gPiAgICAgICAgIGNhc2UgVjRMMl9D
SURfRElHSVRBTF9HQUlOOg0KPiA+ICAgICAgICAgICAgICAgICByZXQgPSBpbXgyNThfdXBkYXRl
X2RpZ2l0YWxfZ2FpbihpbXgyNTgsDQo+IElNWDI1OF9SRUdfVkFMVUVfMTZCSVQsDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjdHJsLT52YWwpOyBAQCAtMTE4OSw5ICsxMjAz
LDYgQEANCj4gPiBzdGF0aWMgaW50IGlteDI1OF9pbml0X2NvbnRyb2xzKHN0cnVjdCBpbXgyNTgg
KmlteDI1OCkNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElNWDI1OF9WVFNf
TUFYIC0gaW14MjU4LT5jdXJfbW9kZS0NCj4gPmhlaWdodCwgMSwNCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHZibGFua19kZWYpOw0KPiA+DQo+ID4gLSAgICAgICBpZiAoaW14
MjU4LT52YmxhbmspDQo+ID4gLSAgICAgICAgICAgICAgIGlteDI1OC0+dmJsYW5rLT5mbGFncyB8
PSBWNEwyX0NUUkxfRkxBR19SRUFEX09OTFk7DQo+ID4gLQ0KPiA+ICAgICAgICAgaW14MjU4LT5o
YmxhbmsgPSB2NGwyX2N0cmxfbmV3X3N0ZCgNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGN0cmxfaGRsciwgJmlteDI1OF9jdHJsX29wcywNCj4gVjRMMl9DSURfSEJMQU5LLA0K
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSU1YMjU4X1BQTF9ERUZBVUxUIC0N
Cj4gPiBpbXgyNTgtPmN1cl9tb2RlLT53aWR0aCwNCj4gPiAtLQ0KPiA+IDIuNy40DQo+ID4NCg==
