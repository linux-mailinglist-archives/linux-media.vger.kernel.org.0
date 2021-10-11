Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6B49428597
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 05:30:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhJKDcG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Oct 2021 23:32:06 -0400
Received: from mga12.intel.com ([192.55.52.136]:50865 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233264AbhJKDcF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Oct 2021 23:32:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="206905601"
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; 
   d="scan'208";a="206905601"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2021 20:30:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; 
   d="scan'208";a="440628579"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga006.jf.intel.com with ESMTP; 10 Oct 2021 20:30:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 10 Oct 2021 20:30:03 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 10 Oct 2021 20:30:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 10 Oct 2021 20:30:02 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 10 Oct 2021 20:30:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QuOS5xt/NK+y2hyow3oLYBkME53P1ioYY7syTCMQBZ+POwZg3rgXxh4b417hf/9bxeElq1sm7CoZyywzvLfj9ezC7M/ZWkkw+WwIYnUwPvZT5QzmS/yel/UaZW6NYukMrd084hzMEDj7OXlIcgrsvF7NSKE/6Ns2IZ1UQo4ey8Q8xywD9eeGnOxQ238ewUAb9S/Sr2HH9bezgF+j3oLeVJyU4yfuhXDga+OU0blpmpRubHt7yb2EK2R82p4Wov4ugwLiMl6HgEzQGsMSj8SuiYn+Z6AsPc7dihBXyku74SgCaP87rTS+BzRqO3Ee1sKIva8/w5oh6HwOL9NxKNgEIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PIIxEX60/Vp4hv2sXl40ALJRlzchnmWcxyHONGzu2QQ=;
 b=aV4ZqMmSUeX1dAr1lwIyoer3ASSH1UTQQVDTaM2EBl2GhkUNwcofHzBRYykl0LNKX6NcH8Va+oLwt+xVlmXFzHxrREwEblZNNohG9zfzhQ8P7jKimI9Ds3mt1U8fASXs+UNLGPfEUzyZwvA72Zmc3BmtRt+S3X8GBOW5kQwqTkD94Liz7d+5sl0nwyX0+YrWa5cW6NF/DKqX0n2D6kj8UNxXBcG07VMaT8d1cIc3P4HZK/RTJUmxbAttXceoZxM86fQ1VlksweId+gD1NM+NPWHFOjGwviKsDwSJzyTvvjKzuZWn/Cz0tVi6bUa2XTsYV/UZAuUz0gRsexR7m+h0cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PIIxEX60/Vp4hv2sXl40ALJRlzchnmWcxyHONGzu2QQ=;
 b=d0IZwY8uxw/xFRqx0eqNm99sx7QTIYCo4xNGycN1F0bYw/4ye0lNBQePGKKRlZ0I3rH87RvT/o0zrKsoIAFvrTgJQAaKW6xbUL/gDC0iLeHUYFIss0CKxtFC3tG2/lbOyc1v65zZPvEkISe8dHm0bsOsVxUPBhseomDeBGBnbw8=
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5655.namprd11.prod.outlook.com (2603:10b6:8:28::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20; Mon, 11 Oct 2021 03:30:01 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 03:30:01 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "tfiga@google.com" <tfiga@google.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH v2] media: staging: ipu3-imgu: add the AWB memory layout
Thread-Topic: [PATCH v2] media: staging: ipu3-imgu: add the AWB memory layout
Thread-Index: AQHXuiZ89NJ52Tg8XEK3zXqgAweaeavE4diAgAg/ClA=
Date:   Mon, 11 Oct 2021 03:30:01 +0000
Message-ID: <DM8PR11MB5653A4E1236537665228B14299B59@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20211005202019.253353-1-jeanmichel.hautbois@ideasonboard.com>
 <YVy7U7rzUU/+PMaa@pendragon.ideasonboard.com>
In-Reply-To: <YVy7U7rzUU/+PMaa@pendragon.ideasonboard.com>
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
x-ms-office365-filtering-correlation-id: 1fdd9489-9055-48e7-3de8-08d98c6768e0
x-ms-traffictypediagnostic: DM8PR11MB5655:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR11MB565551351BCF220CEDB73FC599B59@DM8PR11MB5655.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 38z5eAzmBB4WK2j068q/5XCuAiYXZbRCTUa4JhlSVzBe2xUrJ48OiLzApRWm1UNcnAUJZH88f1BLtAtTcVX/CbrMtHVakf39V6rz7H1cCk7FCXMotFSq1rdRg7chqKjOMgPxORfUkvBy1itIjECEaf45gsNVr14owznSJ5FpQRaWNiOyNYcmgO16BJdIna4Zjp2OK7KQrnR4X/dr+yRwO5ip1rjHNXYgptHJf14jJHD6JSbaHi739Y3QaTFlxWGySq8tRnV09M24Q50dzoqIv2NNMVjoYQSwSaLouUYIohBYUsSM16H1vtMp8wGwtjBOm9/SULc8FVdsWqW+LFL/Xv9P2pfoht3h9PcS3867tSteOOJGqn1v0wyXUanahsL+UBSBBiP7mVmPPpKi/35EU6/PNLCVoZIY5qcnEmPCkD8aY5WJyrnvgTvzFq0oT1puJ+wmfx65FtzrfbIY4R8soIZ3T/48+UEU2kDa3UdU8phpA2Wylbzmdsf195muvhUbXNCC6jQK/iqst0fVowoziCsGU8ceSbu4rvqxzqsguyzPdWij7TUbRN4ZBmLZEgvxH9t3oUgOqTkuOy8OQRo+k3Pxu0P9zZstIWfjimXtxgC2ngjjyfZeV9V77h5Dn2bC4yPVMtY6pMRcxNhND1DdgrhDAOg0kzIV49yPIvOXdV15ucOtAry+UXtP/1YNE9nxOV0qhTdobu6NdvriyUgrkQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(6506007)(53546011)(8676002)(33656002)(7696005)(8936002)(71200400001)(83380400001)(26005)(122000001)(38100700002)(86362001)(66556008)(66476007)(38070700005)(76116006)(64756008)(66446008)(5660300002)(52536014)(66946007)(316002)(110136005)(9686003)(54906003)(55016002)(4326008)(508600001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cFRXRUY1dXJPUnRDcC9TMVZiaUI4eWlVL1ZBbE5KT0wwMWJhUFRRNmZZUVE4?=
 =?utf-8?B?OVdsMElsbzgxcHU4NzZ2WFVMY1hiL3I3Sm1rUmlITE1DanREcTI2eE1xSWJp?=
 =?utf-8?B?K01CQmo1OTAwMHQyVzFXcEk1dXVqOE9jU3ROOEhnUTVweWU3eE9FeDVqem5s?=
 =?utf-8?B?QUtzdFhmRUFBTkQzYjN5T3d3cDZMMFp1QUR6L2VkWm5JdGxOY1JFbHFmYXN5?=
 =?utf-8?B?b1NRRjJjTnBJVHdmZG9BWFprYXRkRUpNUkpETkdxeE5FQ1NLdXZlbm5raFN1?=
 =?utf-8?B?TFI5WU5BSjdCN2NZWnNldUFYRW9ON0NYL2xTV3MzcVpoV05FTU4wajd5THVK?=
 =?utf-8?B?YzJzUks3a3hrL0dIT1psK2ZzZytLcHU5b3l4M1VVT2creEZjMk5kTUxZcjky?=
 =?utf-8?B?RkkveG1wdjRLTXZaMDZ1ejBNUmZTL24vdnk1dzFZVkhwMmhxbGlIenJDYisy?=
 =?utf-8?B?WlMyZHQzcHh2Wm04NjlrZ3pxY3QrMlJPa0UxVUo1Q0RqVVg4K0pHdmtVajFh?=
 =?utf-8?B?bENoZEkvNUt5SWFJSVBiYlNTNDRSaGl5VHJUekQwdEhlcnRBMnFGbEcrMkpJ?=
 =?utf-8?B?TXJHalNwMlJISFROU2Mzd2dRNUxuOXVRbW0wd09FRnpRa3A4SW56OGJmUFVH?=
 =?utf-8?B?SHJTbUxYdnBDR2pVVHIwaXpnNUlmRlJLOVcwQ1d4OXFCbWtrWVBHVnkzSnZm?=
 =?utf-8?B?R1hoQUM1MUNXNDk2bE5ObkJrbi9PSFpRMXRvUkZ5ZEsvSGVoSzBINTBCWmhX?=
 =?utf-8?B?ajRqS0FuSkt5M0NvSnNyYzJPVzlzWlMyVm91S0prR1RyQmU0S0NCWVlEUXVD?=
 =?utf-8?B?ODM5TW1VQWpWaFp1RkdrYkNVVGhtM00wblJtM3dlOWR2R0Q2Q215MXdwVEd0?=
 =?utf-8?B?eURkbjVEY0FKbS81Q3Z3RGdjOVJJN3ZXS3ZiVDVUTDdPT1JOTjhxbEY0THZZ?=
 =?utf-8?B?WXVjeEVqWFlpVGtLQ0VKR0RDUmh0ZEt2Q1BGeVJ3UVFyU1ZuSHU1MkhkNDdR?=
 =?utf-8?B?U2pvUlhvVVNReUtPWTJmN2JhQmdjVjFkZE9mdHp2c20ySGVSM1ZiZjNXUUJl?=
 =?utf-8?B?U0NteHhBR0VVdU1nNE5IK0VtVjFSb0pKbUxab2I1TUMrMzYyenlkc2ZMZ0U2?=
 =?utf-8?B?VGJoc0ZJWnYrOE15aEdtZ1pDU0kyNTNjRENBOVhaSFVPOFJ5ZXF2UXRyUitS?=
 =?utf-8?B?ZTNicWVZUDBMVFRTemV5Q0tOeUkyWU8rbm4yQWQxN3NGQXZxdEhTRnU2VFlq?=
 =?utf-8?B?YUJ5cjdGaWFuVXl1NmIvdDRkNHlYVlhWanB4elFKSU1DcGRRYXBJZnREV2JG?=
 =?utf-8?B?QkRWQzdMNit3YzRSKyszdThla3JsTjlGR1p2bDdtQkNaekFISWx0NmQ3RlNs?=
 =?utf-8?B?ZHVueHM3dzNObUJLenRlZFltZnFpWXJya05SS21samtuWEhLYVRrSXVJbGY3?=
 =?utf-8?B?UUtkV1VnUHBvc1RpZ3VCeEJ1M1pFL1FCWGxrclZ4ZzJCTjFWWnNBWGFLeHZM?=
 =?utf-8?B?RlpSWjR5R3lsSC9ZZHFrLzBHb1BJMkpoWEZlS1NpdUlVbWRNUmxRemZiZ0Y5?=
 =?utf-8?B?dmlhd1J4MXc0ZnJUdnBlZXZIZnh5SEdtTkJYNDRFaENtKzVsa2gzQkxIbmhh?=
 =?utf-8?B?NTNBaUFZbHYybnVYZUhmMUFyY0kzV3R1UXprK0tPdlpsVU83ekRZTndsTTVF?=
 =?utf-8?B?U25SYmRFamZjYXFaMUhjTjJ2Q2pFbW5WdzhWK1liSmZ4cHZTai8wQWt0SkZ1?=
 =?utf-8?Q?6+HHHziSQYkYnTzJU92MrGcown+t1L0K05lz/mq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fdd9489-9055-48e7-3de8-08d98c6768e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 03:30:01.7915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XY2okxLZG4kYEy4uHZHGNgkNYoAJwshLNW4VnceClvJbEMOs+Lq4JjS6QRtxfPP5VOaOvUyIhfTB9qtX5gNRVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5655
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

QWxsLA0KDQpfX19fX19fX19fX19fX19fX19fX19fX18NCkJScywgIA0KQmluZ2J1IENhbyANCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgT2N0
b2JlciA2LCAyMDIxIDQ6NTQgQU0NCj4gVG86IEplYW4tTWljaGVsIEhhdXRib2lzIDxqZWFubWlj
aGVsLmhhdXRib2lzQGlkZWFzb25ib2FyZC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtl
cm5lbC5vcmc7IHNha2FyaS5haWx1c0BsaW51eC5pbnRlbC5jb207IENhbywNCj4gQmluZ2J1IDxi
aW5nYnUuY2FvQGludGVsLmNvbT47IHRmaWdhQGdvb2dsZS5jb207IFFpdSwgVGlhbiBTaHUNCj4g
PHRpYW4uc2h1LnFpdUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIG1lZGlh
OiBzdGFnaW5nOiBpcHUzLWltZ3U6IGFkZCB0aGUgQVdCIG1lbW9yeQ0KPiBsYXlvdXQNCj4gDQo+
IEhpIEplYW4tTWljaGVsLA0KPiANCj4gVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBP
biBUdWUsIE9jdCAwNSwgMjAyMSBhdCAxMDoyMDoxOVBNICswMjAwLCBKZWFuLU1pY2hlbCBIYXV0
Ym9pcyB3cm90ZToNCj4gPiBXaGlsZSBwYXJzaW5nIHRoZSBSQVcgQVdCIG1ldGFkYXRhLCB0aGUg
QVdCIGxheW91dCB3YXMgbWlzc2luZyB0bw0KPiA+IGZ1bGx5IHVuZGVyc3RhbmQgd2hpY2ggYnl0
ZSBjb3JyZXNwb25kcyB0byB3aGljaCBmZWF0dXJlLiBNYWtlIHRoZQ0KPiA+IGZpZWxkIG5hbWVz
IGFuZCB1c2FnZSBleHBsaWNpdCwgYXMgaXQgaXMgdXNlZCBieSB0aGUgdXNlcnNwYWNlDQo+IGFw
cGxpY2F0aW9ucy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEplYW4tTWljaGVsIEhhdXRib2lz
DQo+ID4gPGplYW5taWNoZWwuaGF1dGJvaXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gPiAtLS0NCj4g
PiAgLi4uL21lZGlhL2lwdTMvaW5jbHVkZS91YXBpL2ludGVsLWlwdTMuaCAgICAgIHwgMzIgKysr
KysrKysrKysrKysrKy0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvbWVk
aWEvaXB1My9pbmNsdWRlL3VhcGkvaW50ZWwtaXB1My5oDQo+ID4gYi9kcml2ZXJzL3N0YWdpbmcv
bWVkaWEvaXB1My9pbmNsdWRlL3VhcGkvaW50ZWwtaXB1My5oDQo+ID4gaW5kZXggNTg1ZjU1OTgx
Yzg2Li5hZDExNmE5MTJlNDQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlh
L2lwdTMvaW5jbHVkZS91YXBpL2ludGVsLWlwdTMuaA0KPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9tZWRpYS9pcHUzL2luY2x1ZGUvdWFwaS9pbnRlbC1pcHUzLmgNCj4gPiBAQCAtNjEsMTcgKzYx
LDM5IEBAIHN0cnVjdCBpcHUzX3VhcGlfZ3JpZF9jb25maWcgew0KPiA+ICAJX191MTYgeV9lbmQ7
DQo+ID4gIH0gX19wYWNrZWQ7DQo+ID4NCj4gPiArLyoqDQo+ID4gKyAqIHN0cnVjdCBpcHUzX3Vh
cGlfYXdiX3NldF9pdGVtIC0gTWVtb3J5IGxheW91dCBmb3IgZWFjaCBjZWxsIGluIEFXQg0KPiA+
ICsgKg0KPiA+ICsgKiBAR3JfYXZnOglHcmVlbiBhdmVyYWdlIGZvciByZWQgbGluZXMgaW4gdGhl
IGNlbGwuDQo+ID4gKyAqIEBSX2F2ZzoJUmVkIGF2ZXJhZ2UgaW4gdGhlIGNlbGwuDQo+ID4gKyAq
IEBCX2F2ZzoJQmx1ZSBhdmVyYWdlIGluIHRoZSBjZWxsLg0KPiA+ICsgKiBAR2JfYXZnOglHcmVl
biBhdmVyYWdlIGZvciBibHVlIGxpbmVzIGluIHRoZSBjZWxsLg0KPiA+ICsgKiBAc2F0X3JhdGlv
OiAgUGVyY2VudGFnZSBvZiBwaXhlbHMgb3ZlciBhIGdpdmVuIHRocmVzaG9sZCBzZXQgaW4NCj4g
DQo+IHMvb3ZlciBhIGdpdmVuIHRocmVzaG9sZCBzZXQgaW4vb3ZlciB0aGUgdGhyZXNob2xkcyBz
cGVjaWZpZWQgaW4vDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVu
dC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gSSB3b3VsZCBzdGlsbCBsaWtlIGEg
cmV2aWV3IGZyb20gc29tZW9uZSBrbm93bGVkZ2VhYmxlIHdpdGggdGhlIGhhcmR3YXJlDQo+IGFu
ZCBmaXJtd2FyZSwgYXMgd2UncmUgcGFydGx5IGd1ZXNzaW5nIGhlcmUuDQoNClJldmlld2VkLWJ5
OiBCaW5nYnUgQ2FvIDxiaW5nYnUuY2FvQGludGVsLmNvbT4NCg0KSSBoYXZlIG5vIGNvbmNlcm4g
b24gdGhpcyBwYXRjaCwgSSB0aGluayBpdCBoYXMgbWlub3IgaW1wYWN0IG9uIHVzZXItc3BhY2UN
CmltcGxlbWVudGF0aW9uIGZyb20gdGhpcyBjaGFuZ2UuIFRvbWFzeiwgZG8geW91IGhhdmUgYW55
IGNvbW1lbnQgb24gdGhpcz8NCg0KDQo+IA0KPiA+ICsgKiAJCWlwdTNfdWFwaV9hd2JfY29uZmln
X3MsIGNvZGVkIGZyb20gMCB0byAyNTUuDQo+ID4gKyAqIEBwYWRkaW5nMDogICBVbnVzZWQgYnl0
ZSBmb3IgcGFkZGluZy4NCj4gPiArICogQHBhZGRpbmcxOiAgIFVudXNlZCBieXRlIGZvciBwYWRk
aW5nLg0KPiA+ICsgKiBAcGFkZGluZzI6ICAgVW51c2VkIGJ5dGUgZm9yIHBhZGRpbmcuDQo+ID4g
KyAqLw0KPiA+ICtzdHJ1Y3QgaXB1M191YXBpX2F3Yl9zZXRfaXRlbSB7DQo+ID4gKwlfX3U4IEdy
X2F2ZzsNCj4gPiArCV9fdTggUl9hdmc7DQo+ID4gKwlfX3U4IEJfYXZnOw0KPiA+ICsJX191OCBH
Yl9hdmc7DQo+ID4gKwlfX3U4IHNhdF9yYXRpbzsNCj4gPiArCV9fdTggcGFkZGluZzA7DQo+ID4g
KwlfX3U4IHBhZGRpbmcxOw0KPiA+ICsJX191OCBwYWRkaW5nMjsNCj4gPiArfSBfX2F0dHJpYnV0
ZV9fKChwYWNrZWQpKTsNCj4gPiArDQo+ID4gIC8qDQo+ID4gICAqIFRoZSBncmlkIGJhc2VkIGRh
dGEgaXMgZGl2aWRlZCBpbnRvICJzbGljZXMiIGNhbGxlZCBzZXQsIGVhY2ggc2xpY2UNCj4gb2Yg
c2V0WA0KPiA+ICAgKiByZWZlcnMgdG8gaXB1M191YXBpX2dyaWRfY29uZmlnIHdpZHRoICogaGVp
Z2h0X3Blcl9zbGljZS4NCj4gPiAgICovDQo+ID4gICNkZWZpbmUgSVBVM19VQVBJX0FXQl9NQVhf
U0VUUwkJCQk2MA0KPiA+ICAvKiBCYXNlZCBvbiBncmlkIHNpemUgODAgKiA2MCBhbmQgY2VsbCBz
aXplIDE2IHggMTYgKi8NCj4gPiAtI2RlZmluZSBJUFUzX1VBUElfQVdCX1NFVF9TSVpFCQkJCTEy
ODANCj4gPiAtI2RlZmluZSBJUFUzX1VBUElfQVdCX01EX0lURU1fU0laRQkJCTgNCj4gPiArI2Rl
ZmluZSBJUFUzX1VBUElfQVdCX1NFVF9TSVpFCQkJCTE2MA0KPiA+ICAjZGVmaW5lIElQVTNfVUFQ
SV9BV0JfU1BBUkVfRk9SX0JVQkJMRVMgXA0KPiA+IC0JKElQVTNfVUFQSV9NQVhfQlVCQkxFX1NJ
WkUgKiBJUFUzX1VBUElfTUFYX1NUUklQRVMgKiBcDQo+ID4gLQkgSVBVM19VQVBJX0FXQl9NRF9J
VEVNX1NJWkUpDQo+ID4gKwkoSVBVM19VQVBJX01BWF9CVUJCTEVfU0laRSAqIElQVTNfVUFQSV9N
QVhfU1RSSVBFUykNCj4gPiAgI2RlZmluZSBJUFUzX1VBUElfQVdCX01BWF9CVUZGRVJfU0laRSBc
DQo+ID4gIAkoSVBVM19VQVBJX0FXQl9NQVhfU0VUUyAqIFwNCj4gPiAgCSAoSVBVM19VQVBJX0FX
Ql9TRVRfU0laRSArIElQVTNfVUFQSV9BV0JfU1BBUkVfRk9SX0JVQkJMRVMpKSBAQA0KPiA+IC04
Myw3ICsxMDUsNyBAQCBzdHJ1Y3QgaXB1M191YXBpX2dyaWRfY29uZmlnIHsNCj4gPiAgICoJCXRo
ZSBhdmVyYWdlIHZhbHVlcyBmb3IgZWFjaCBjb2xvciBjaGFubmVsLg0KPiA+ICAgKi8NCj4gPiAg
c3RydWN0IGlwdTNfdWFwaV9hd2JfcmF3X2J1ZmZlciB7DQo+ID4gLQlfX3U4IG1ldGFfZGF0YVtJ
UFUzX1VBUElfQVdCX01BWF9CVUZGRVJfU0laRV0NCj4gPiArCXN0cnVjdCBpcHUzX3VhcGlfYXdi
X3NldF9pdGVtDQo+ID4gK21ldGFfZGF0YVtJUFUzX1VBUElfQVdCX01BWF9CVUZGRVJfU0laRV0N
Cj4gPiAgCQlfX2F0dHJpYnV0ZV9fKChhbGlnbmVkKDMyKSkpOw0KPiA+ICB9IF9fcGFja2VkOw0K
PiA+DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
