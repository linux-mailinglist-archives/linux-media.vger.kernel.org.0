Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2B7F3F2E0B
	for <lists+linux-media@lfdr.de>; Fri, 20 Aug 2021 16:25:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240871AbhHTO0T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 20 Aug 2021 10:26:19 -0400
Received: from mga02.intel.com ([134.134.136.20]:59244 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240758AbhHTO0S (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 20 Aug 2021 10:26:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10081"; a="203977713"
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="203977713"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2021 07:25:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,337,1620716400"; 
   d="scan'208";a="472320166"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 20 Aug 2021 07:25:40 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 20 Aug 2021 07:25:39 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 20 Aug 2021 07:25:39 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Fri, 20 Aug 2021 07:25:39 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Fri, 20 Aug 2021 07:24:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IQ6RFvEPCt4TE/e6LzaegcjjFtmNt23rfOkP5hhu5Wgi3rx/lMF38rCgmNfXRznk6EZyxvE+7iSRSYnKb1ZjYSDmpcE1DEAqY3UKwx0qX2tWjX2rsPIyGGhSkd4nmFmJTHtk3blviDXgV9kJX+u5kuqBGtRTUGfDjTkH1/csa0HYT6C6EKf4Fql1X7h8y+C6knCurFs+LV1f2xIrBRRg4X9krF9CVbDI8BKXXbBfSTxE7HJ6DGCM5yeh7LaLaGFD2Km6xRJ3Tm4vVjSF7PZJLqnWaGnLZfnrU3j4oL0gGPftDv84PsxRkkzLX7heXw4aWW0Yo+VAzSKLRr+MH10qoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UorPkUOoNPA4DPVFojHeDCw6WD8hnhCeo34KBgUEws=;
 b=VFZJS8QU737o0MOPT2UmCe6UU5sn7+K3d6MCDTgrs1T05DYu36pOKGEJHi+p3Aeof8A1WUnYefsj/EKNuhwqxRNdE3uGI1VUKSBF3XoqzEUb657fzJSrNIXeq0TMnbj4yRBNL//yOGgxafZ2EBX+MYbZ3dvpAW7OWNZzQPoSALZio1RvumB4SJ2wH/XSHYL3Qe3CwKoBDh6UjypMUV+igNahi2UGR0MD6K6TgTwIz836pAmuLBc0066S1lvC+ySedUIXbsQ9psXsXZ4TA92Yb588rz0c0p+jsBIpwkXLl5lmkDgFxGGLP2SpGRMJB8xOpoMqrgF7Xx9728aMhW1O2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2UorPkUOoNPA4DPVFojHeDCw6WD8hnhCeo34KBgUEws=;
 b=r+QmlgxddCX8wyxaPGtJGMuBLALJ266eceJ3PgKfnyNPhBc1uazN3zSOAaBOI/uLY0Xma17uc0jVCxyJOR+RYmEEsgl816OSW1BuYhuWeVtsVig83sBQRcUfUvZXpEmMbt866njsh1SBhMvcsd2pILcFPVXSFRVZXALRZ3nwkFU=
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by SA2PR11MB5131.namprd11.prod.outlook.com (2603:10b6:806:116::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Fri, 20 Aug
 2021 14:24:50 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::19ad:2d88:e93a:d66a]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::19ad:2d88:e93a:d66a%7]) with mapi id 15.20.4415.024; Fri, 20 Aug 2021
 14:24:49 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "robh@kernel.org" <robh@kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>
Subject: Re: [PATCH] dt-bindings: media: Fix more graph
 'unevaluatedProperties' related warnings
Thread-Topic: [PATCH] dt-bindings: media: Fix more graph
 'unevaluatedProperties' related warnings
Thread-Index: AQHXlVhvm9l8ofm7/UStjO3Q0W9By6t8c5EA
Date:   Fri, 20 Aug 2021 14:24:49 +0000
Message-ID: <15afae5cd1722b6d64f40ef9cd72aac29aef6720.camel@intel.com>
References: <20210820001457.1705142-1-robh@kernel.org>
In-Reply-To: <20210820001457.1705142-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4 (3.40.4-1.fc34) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1a42b234-472c-4ef4-4960-08d963e644e5
x-ms-traffictypediagnostic: SA2PR11MB5131:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR11MB51314C608E2BFDC473A45CACF2C19@SA2PR11MB5131.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z5cgWaCurgfJcptrxDTBnd2j6c80AGGLTcWP05zXQ8faS3ha2BSliLXZBfBNVh11ZL0mv4F/4BDiaOBq24740K0AJ4VPe5cSSM3tUhiYrzZa4M6q4wz49HK6lzEftzJE/+cXnEc/6cKRf4IDdi3fVAQ2fTHPMP/YSqt3OqOjCoAbTSzEbVvIE5AWE19mXLt5uoyVGv8W3vi3/WRbrInu5bvPmQBD7u579Ne010rG+oIo+7uUNp9hnR5G39tVm59H6GgJMnItnXRsPwOuJvbpVdhgj+WBn/X6mG1Gv/4UihVOj5vHv7RTys1DtIaCR90NBPkIU1/HIU/EukyLQW2zSBmHu1nNpI3X0DghSVI0qDHqh44uf5zzs7Jw17kBHuOWd5aO8MSBMoTvzCj47t+LTEzYCFM6vXTRCVa3At21tCijE8KElCYnpnOUBP2IYUlojufVBIf+7rbgitFw9sAEHUG09G8FmDzIC23M6KsAQthpN0F98rAeBe+S3HctOpPO0LBId9QLhHI7sh7/u4Q89RDyKnQ8nX39qy6EjyzTrmO6xId5N2abXB0owm0WWqyNZ4czgGuj3MrbQqWrpBOINYiNSJDH/augBy+Ym87w/aekCW3+z6xfDtwdHC8uUIrACgK3sht8t26pwBA72xpABDD/CKUzh2et6PiHwVwR2lRS1XXys/yW/pf/UZsL0aUkiRIJgfO92On4VhJqkP6jzQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2616005)(6512007)(6506007)(6486002)(71200400001)(76116006)(316002)(8676002)(36756003)(83380400001)(54906003)(91956017)(110136005)(8936002)(26005)(186003)(4326008)(2906002)(66946007)(66446008)(508600001)(66556008)(66476007)(64756008)(122000001)(107886003)(86362001)(38100700002)(38070700005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REFaSW5uOUZIQ3A4ZjNWTzhSZWpOMlp4Wkpnd1FjbmtSN2E0TXQyM3VaWERv?=
 =?utf-8?B?eVkxWHVmQlhVU3paZnpHSHlpR1N3aktQdjUvR1BwNHJoSDBHOUJtTTd4WGts?=
 =?utf-8?B?VjVuVXIwdStwMVljVi90aGs3TUY3UlZRRS9RNjlNcHJMSE1vUHY2LzJxcVV5?=
 =?utf-8?B?b2p3UFF4Rk1QMS92VDVuV2JROGF5Qm1YQ2NEQUtzekM0bjhHejY0MXRHM1pP?=
 =?utf-8?B?eFBFR2lNOUpRTWtxdXFTc1dHZFZNYUZadmNwVDdvTGFJVENiNnlVUFNiZDhX?=
 =?utf-8?B?aE5OalBlYTk4SnNBWWJuYVZZYUgxbGFDY2g3b3BoRkw0Y0NYQ2xLZy9TRHBh?=
 =?utf-8?B?RjZTVDh6SXhZZ1FUbVV0eXd5eWV1VHA4eXZ1UHQ2empHdnVpOWFPaGNKcUpO?=
 =?utf-8?B?U3libmYrWFN3RVZlVUtUaTZpZTFtSTgxUmxHRWVnU2JWU3ljTEZaendwd1h5?=
 =?utf-8?B?Zng0Y3BodDRseGxIZHVabHg5K2J4ZjVVbDZJOVlBY1lEUS9hY2ZIZzBHdUpp?=
 =?utf-8?B?dGxqUSsrbU0zQjB0UmVET0o1clVkRlNjckI2ejZnSkRRVW02RThnR1lvbG1h?=
 =?utf-8?B?NXhhM1hJaDZZa0oxQy9ReGdjVWkvdmRweER1cWZvU3hUMjA1eWZzcHBvNDdx?=
 =?utf-8?B?blVUNC9RMS9rbHdUTEJQaW9xTThudVdrVzgwbDFmeUVtVkdHelJrNWw1U1Vw?=
 =?utf-8?B?a2VIeDRZb3grZ0hSRDVmR0JXdUsrbWxFNVRLL2haSmtzR2lsdlFEWURyMTRq?=
 =?utf-8?B?bmxLbkx4d1o0Tk8wUU1UMlFHZWx4RjlCdjZBVExaRXNBdUZDZlg2b0JaNElm?=
 =?utf-8?B?QXE5SjBIVkxsQXZpeFJ6N3EwY1M3bi9DUGVpcGlkeHlCWWV4UklJV21sTVBz?=
 =?utf-8?B?UDVOUmNMd0w4eFJoR3NjYjRDdHVFczBJYnQ2OC84UXVoR0RycHdRQzdzbVZ3?=
 =?utf-8?B?UmNnaGU5U1VOVXlkTVRDS1U1QXRHcStPTFBnSUV4WDZFenRnWlZCRytLRGxO?=
 =?utf-8?B?SkJ5NUFiN1NkMmVlRWFLZWo5aXpRS0o1aGRYNXg5MWtmQndsMFA1MEJxbUl1?=
 =?utf-8?B?bzlOMXNIK3h3TVYyM0YzakdhYVN6eHRKcTg3dUVCUS9nNEVCSkdJSnNoK0l3?=
 =?utf-8?B?V0xnWmxXMytqN20vZmN4eFpNcVAxK3hRajhYMStkbHRFMHdmUnNCSXdTNjhm?=
 =?utf-8?B?SWxET0JseWJyeXZ2QVFsb0wzYlFXbE9lbC9qRzlXVXZLT2hhYXJIUXhGbkxO?=
 =?utf-8?B?SHlwNHVEellUU3BrVldpalJXaEFmb1JlcHE0dnpjeXVkOXhmZHZjK0F6cjJ1?=
 =?utf-8?B?c1c1RWFrU1B5Q1M1U1VWc1U3WGtzdlQ3ZXhUUlU0QkZ1ek5EcHdQbmpkSHd2?=
 =?utf-8?B?N1dsSkY2NkczaXl5TDRjczk3NnJSYmMyNjBwVDFESXNjOEV0N05GdUNnSGlU?=
 =?utf-8?B?V3UvRUVCaEFIR0RSWDVEcnpjS0FuUHYwS3pDeWtVN1hZb0NJWVFWYjI0SStr?=
 =?utf-8?B?QzI2MjhhQUJucmxyV3NJU2g5RGdFRS9zVE9IZHZWRUhNZW16b2p4eHJtOHlw?=
 =?utf-8?B?NTI3Y2dKQjZ2QXkwTHRzUWhoMzVndzBSK0JCeFRxRmliTURTTlJMWWxURDVx?=
 =?utf-8?B?WklDdUtiSDZSU1BrQmY1ZkUvVnhnM0RXNFFXaXBFU3pNeUlxbDhFOVk5c2tJ?=
 =?utf-8?B?UW1KUElqV3l3d1o2NStMZkhheEs4TzNXSWVYVHNRenFKVlhwdmlJaWFHNTVQ?=
 =?utf-8?Q?hDCP/++XnuyHE9tHFyHMPJsMdpyPtH/QUEYTKWp?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3BBF7811F556E348928C52A0E6B1141C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a42b234-472c-4ef4-4960-08d963e644e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2021 14:24:49.8331
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6FFaNWRAiR0vUu3VOtAzn/LXY7YdlES/AYUNQiYZRbneGiWh1ONouMbzV3Y8OViGfy7m5+nEsyZFK8ZbzOqBmTB0JqV4lezyk8DFY/Myvfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5131
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgUm9iLA0KDQpUaGFua3MgZm9yIGZpeC4NCg0KT24gVGh1LCAyMDIxLTA4LTE5IGF0IDE5OjE0
IC0wNTAwLCBSb2IgSGVycmluZyB3cm90ZToNCj4gVGhlIGdyYXBoIHNjaGVtYSBkb2Vzbid0IGFs
bG93IGN1c3RvbSBwcm9wZXJ0aWVzIG9uIGVuZHBvaW50IG5vZGVzIGZvcg0KPiAnIy9wcm9wZXJ0
aWVzL3BvcnQnIGFuZCAnIy8kZGVmcy9wb3J0LWJhc2UnIHNob3VsZCBiZSB1c2VkIGluc3RlYWQu
IFRoaXMNCj4gZG9lc24ndCBtYXR0ZXIgdW50aWwgJ3VuZXZhbHVhdGVkUHJvcGVydGllcycgc3Vw
cG9ydCBpcyBpbXBsZW1lbnRlZC4NCj4gDQo+IENjOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2
ZW5zb25AcmFzcGJlcnJ5cGkuY29tPg0KPiBDYzogSmFjb3BvIE1vbmRpIDxqYWNvcG9Aam1vbmRp
Lm9yZz4NCj4gQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPg0K
PiBDYzogIlBhdWwgSi4gTXVycGh5IiA8cGF1bC5qLm11cnBoeUBpbnRlbC5jb20+DQo+IENjOiBE
YW5pZWxlIEFsZXNzYW5kcmVsbGkgPGRhbmllbGUuYWxlc3NhbmRyZWxsaUBpbnRlbC5jb20+DQo+
IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4gU2lnbmVkLW9mZi1ieTogUm9iIEhl
cnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IERhbmllbGUgQWxlc3NhbmRy
ZWxsaSA8ZGFuaWVsZS5hbGVzc2FuZHJlbGxpQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gwqBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL292dGksb3Y1NjQ3LnlhbWwg
fCAyICstDQo+IMKgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9v
dnRpLG92OTI4Mi55YW1sIHwgMiArLQ0KPiDCoERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9pMmMvc29ueSxpbXgzMzUueWFtbCB8IDIgKy0NCj4gwqBEb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL3NvbnksaW14NDEyLnlhbWwgfCAyICstDQo+
IMKgNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2ky
Yy9vdnRpLG92NTY0Ny55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21l
ZGlhL2kyYy9vdnRpLG92NTY0Ny55YW1sDQo+IGluZGV4IDNlNWQ4MmRmOTBhMi4uYTJhYmVkMDZh
MDk5IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVk
aWEvaTJjL292dGksb3Y1NjQ3LnlhbWwNCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2kyYy9vdnRpLG92NTY0Ny55YW1sDQo+IEBAIC0zMSw3ICszMSw3IEBA
IHByb3BlcnRpZXM6DQo+IMKgwqDCoMKgIG1heEl0ZW1zOiAxDQo+IMKgDQo+IMKgwqAgcG9ydDoN
Cj4gLcKgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4g
K8KgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy8kZGVmcy9wb3J0LWJhc2UNCj4gwqDC
oMKgwqAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+IMKgDQo+IMKgwqDCoMKgIHByb3Bl
cnRpZXM6DQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bWVkaWEvaTJjL292dGksb3Y5MjgyLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvbWVkaWEvaTJjL292dGksb3Y5MjgyLnlhbWwNCj4gaW5kZXggYWQ0Mjk5MmM2ZGEzLi5i
ZjExNWFiOWQ5MjYgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9tZWRpYS9pMmMvb3Z0aSxvdjkyODIueWFtbA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL292dGksb3Y5MjgyLnlhbWwNCj4gQEAgLTM4LDcg
KzM4LDcgQEAgcHJvcGVydGllczoNCj4gwqANCj4gwqDCoCBwb3J0Og0KPiDCoMKgwqDCoCBhZGRp
dGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4gLcKgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55
YW1sIy9wcm9wZXJ0aWVzL3BvcnQNCj4gK8KgwqDCoCAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1s
Iy8kZGVmcy9wb3J0LWJhc2UNCj4gwqANCj4gwqDCoMKgwqAgcHJvcGVydGllczoNCj4gwqDCoMKg
wqDCoMKgIGVuZHBvaW50Og0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL2kyYy9zb255LGlteDMzNS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9zb255LGlteDMzNS55YW1sDQo+IGluZGV4IDg4MWY3
OTUzMjUwMS4uY2YyY2EyNzAyY2M5IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvaTJjL3NvbnksaW14MzM1LnlhbWwNCj4gKysrIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9zb255LGlteDMzNS55YW1sDQo+
IEBAIC0zOCw3ICszOCw3IEBAIHByb3BlcnRpZXM6DQo+IMKgDQo+IMKgwqAgcG9ydDoNCj4gwqDC
oMKgwqAgYWRkaXRpb25hbFByb3BlcnRpZXM6IGZhbHNlDQo+IC3CoMKgwqAgJHJlZjogL3NjaGVt
YXMvZ3JhcGgueWFtbCMvcHJvcGVydGllcy9wb3J0DQo+ICvCoMKgwqAgJHJlZjogL3NjaGVtYXMv
Z3JhcGgueWFtbCMvJGRlZnMvcG9ydC1iYXNlDQo+IMKgDQo+IMKgwqDCoMKgIHByb3BlcnRpZXM6
DQo+IMKgwqDCoMKgwqDCoCBlbmRwb2ludDoNCj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvc29ueSxpbXg0MTIueWFtbCBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvc29ueSxpbXg0MTIueWFtbA0KPiBp
bmRleCAxZWRlYWJmMzllNmEuLmFmY2Y3MDk0N2Y3ZSAxMDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL2kyYy9zb255LGlteDQxMi55YW1sDQo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMvc29ueSxpbXg0
MTIueWFtbA0KPiBAQCAtMzgsNyArMzgsNyBAQCBwcm9wZXJ0aWVzOg0KPiDCoA0KPiDCoMKgIHBv
cnQ6DQo+IMKgwqDCoMKgIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQ0KPiAtwqDCoMKgICRy
ZWY6IC9zY2hlbWFzL2dyYXBoLnlhbWwjL3Byb3BlcnRpZXMvcG9ydA0KPiArwqDCoMKgICRyZWY6
IC9zY2hlbWFzL2dyYXBoLnlhbWwjLyRkZWZzL3BvcnQtYmFzZQ0KPiDCoA0KPiDCoMKgwqDCoCBw
cm9wZXJ0aWVzOg0KPiDCoMKgwqDCoMKgwqAgZW5kcG9pbnQ6DQoNCg==
