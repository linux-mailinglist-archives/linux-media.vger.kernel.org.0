Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF0F942846D
	for <lists+linux-media@lfdr.de>; Mon, 11 Oct 2021 03:05:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbhJKBHG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 10 Oct 2021 21:07:06 -0400
Received: from mga18.intel.com ([134.134.136.126]:55376 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232586AbhJKBHF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 10 Oct 2021 21:07:05 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10133"; a="213724772"
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; 
   d="scan'208";a="213724772"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2021 18:05:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,363,1624345200"; 
   d="scan'208";a="658455581"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga005.jf.intel.com with ESMTP; 10 Oct 2021 18:05:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 10 Oct 2021 18:05:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Sun, 10 Oct 2021 18:05:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Sun, 10 Oct 2021 18:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+cK7Z+RF9gqgo75Sr0woTw6cUkHM7wmIxzsrgEzmrc9ErW8aMG3q8nINgssSu3miKhL0Dc+XZMsBILmyGYL5AFEtYAdeQNBgSOKNSuRuirRo1WwiyfL05HUtu9Z2QA6A0Fb/W1Wr9O5nffGqUPY3ZFvRk3noD1x087ZMwcjNpbxukBS7XnhwlCGtcbW5QKsuR9WFLSZIVvmsPbc2RhdPrg2sjsomL81YwU78FwKAKIo4nD1w+CEex5cR9iGDQ3sO0qpkEfU02QTCiYJBoO8gCf7yDzvyJywfiuQLETNtftt7e0p6n1NKxyUAQLOVPYcRa5BoA+30Jyr1Wuw6jzriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqd3j4M3886uCXGze6VBA00whCMofhPSNILMMw/oxT0=;
 b=CuBADdG06p+lJBrCimb18ZK5U29+HeHtBqa3/qO2d8HmlBXgjjB91ls0Sar+UXCwtay/hVOSHzAP1eE/1uc6LJgH5dD2dPdL9+fW4iaBpqdUWaDY9oEvNHFbOtyJU6SOHwqxoD0OU1ppVzG39sMUlUIuEjb0vO4A3e7JFNhI7FieDp3Hqy/2Z0tuEt0WljU3SooxFWngEI4RlRroMN/In0erPHnswRn/hDlju3t8S57Y6huasFfk2hRzRO9xVVQwAc9PNTh7jN/KVMRg381UpP8jJMScKncfFay1J6/RZIkaWPiCDUMiaSfvLCjvmOxr1UJPHqvEK4X33QjI1T0T0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aqd3j4M3886uCXGze6VBA00whCMofhPSNILMMw/oxT0=;
 b=UCd3OXRjcC52RLgNR3/+lQrG9t7MIQNVKj4xVDyU1OgqjlqIN35ilsCyBxKaR7Z0nLmj3KR+IC1ai+B7gkYQWsutR6y9dqVYfmCyvbDjdxSiv9GWgI2e//Ih1KyHgNo4G5DgPrOxcrR+l/X4YqejioSxnBNjc5jh0aSfP0mKERU=
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM8PR11MB5591.namprd11.prod.outlook.com (2603:10b6:8:38::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.19; Mon, 11 Oct 2021 01:05:04 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::f40d:164c:f22:5ad6%7]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 01:05:04 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "tfiga@google.com" <tfiga@google.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice in
 the stripes
Thread-Topic: [PATCH] media: staging: ipu3-imgu: Initialise height_per_slice
 in the stripes
Thread-Index: AQHXqx/Y72VMy1pUFEiS45AyrkgVKauuW1+AgAAg14CAABjrAIAA3LCQgAAkcoCAAccnAIAAC/aAgAAChACAAA8qAIAAEt8AgAcbfeCAAFctgIAKoLQAgAl/SoA=
Date:   Mon, 11 Oct 2021 01:05:04 +0000
Message-ID: <DM8PR11MB5653BB63B3AA421BB16608C399B59@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <YUntTJQwZJ7U3m/E@pendragon.ideasonboard.com>
 <DM8PR11MB5653D63F3F76CA1D9E80E01199A29@DM8PR11MB5653.namprd11.prod.outlook.com>
 <a8a0ee6f-e83c-7f99-6967-f017c549ff05@ideasonboard.com>
 <DM8PR11MB5653CFD59F01C2AB66508F8A99A39@DM8PR11MB5653.namprd11.prod.outlook.com>
 <YUxM18uOp0eamBPH@pendragon.ideasonboard.com>
 <SJ0PR11MB5664666D6D4C573D2D4A406D99A39@SJ0PR11MB5664.namprd11.prod.outlook.com>
 <YUxbrFDvdI68Te8q@pendragon.ideasonboard.com>
 <2a5c6c53-4cbd-de8c-994a-2e963f4e41e5@ideasonboard.com>
 <DM8PR11MB56535F8879FEF48071466D5A99A89@DM8PR11MB5653.namprd11.prod.outlook.com>
 <9e3881b5-e35b-a54c-662e-1eb4f6eb30d9@ideasonboard.com>
 <YVuVOE7Gn/X9UTcH@pendragon.ideasonboard.com>
In-Reply-To: <YVuVOE7Gn/X9UTcH@pendragon.ideasonboard.com>
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
x-ms-office365-filtering-correlation-id: 225dda29-cac3-4cfd-a168-08d98c5328b0
x-ms-traffictypediagnostic: DM8PR11MB5591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR11MB5591FCB869CF2E1FC121D37599B59@DM8PR11MB5591.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: DCBLd4sNAtx07IDv35qSlTa48FTAb3WPhTB1ChCkkGJoBHIlUxf5PMMhwF0erBIWCJ7K1pg7XfrBdXDqRmE5EBs/plqK4uLABVBvbMbyfc+kQ+QL48hGQGuzTck4WF+XHadJqjWz+BBH+Huh2ylS4vwB2jldZ1YGHArf97w23T/BO91YkddscNBiSHKIUG5k848eiIhmNpeCN44ErAmAc7TV/+4Fxi4NlRcEFnCduLxyF4wlTGMA8HjWerzfpO//R+jkPf3op1rxiEOKQWQuAqbg1akH7/l/f21YZMB4H3gvyTqP1sTFtfaw/x12kKIt0GkohE8OTG7Wqy/F9Sssq2gzBpGRHGrFLOu9BJ4aPfoxpmgqUiSzO64ZC/ErH+Fenk3NqiWF8onO3aM+pwTixp1pnQLb/KlqnVMSpYTPybF9Surqbykye063W2EOVBWD7r9fbaU/qADEfzNPQ9lZFGbrspPHFqPuhSLdyzNxTHJTF10c6+CIlIpkU4kHmKrK8ftNPyn2ttmD7YjYLVMbmKnno9O/zTogAZ5pjXjezdAQsxaRVc9ZrpY2fGQGXQU/nDSTT7UAwI9M7GGYMJEHKvUciCEU1kQDml93dJcixGvdVCZ4xiTHTAuqFOmly/E3dylClYcK6+UhfSAAFa1UhMvYi8X9b//HjKWTLQkxM092O7TFWpxxzCCQ6kvVODKiWpyaVpsaFBIAfUzLlnlR5/booHtF8CR150RtpgZRUJQGwptkd9gb60WUTcqr2cRVRosAgvNKvWq0MheaCJDrog==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8676002)(5660300002)(54906003)(508600001)(110136005)(38070700005)(71200400001)(6506007)(53546011)(7696005)(4326008)(26005)(8936002)(186003)(966005)(76116006)(2906002)(316002)(55016002)(66476007)(66946007)(66446008)(66556008)(38100700002)(83380400001)(52536014)(64756008)(9686003)(122000001)(30864003)(86362001)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bFBUcnZEaTBHY0N2SklsR2R3b2xTbHBhdnJHSE5Kek5OK252SXJiRHBsTllT?=
 =?utf-8?B?bnBpeHNiaEwzbVhIa0NPYTAxeDgzeDBaYjZNMDEvMTg1U0lMUmVmdXJuR0wz?=
 =?utf-8?B?dHoyNm1rL204aGtHWi9VU0dYb2xRTWRIK3M5cUxzdkRKT3JoUVRSK2x4Mzh3?=
 =?utf-8?B?cUc2Z0JjNDFHTDNXTm1Fak9lNHNiRlMybWc4V0wwT0ZOQTZqeWVrbHB4QW5H?=
 =?utf-8?B?S1YxQi9QTTJDNGl3aGJidVlPS0FoT1NvUDh6NTRmZnRlUHBybUd6UlhHb2tF?=
 =?utf-8?B?N2x3M3pDYUxQWHBLRWJzS25URmRiRlJpTUFuSU0xOWk0dHFxWkhNS2ZncHpP?=
 =?utf-8?B?bmFyMGdQWGxkbEVNSjFodDkzdVI4YTE3bTByL2VJKzErS2N3RlRBS0hZWDRy?=
 =?utf-8?B?MERqaTBUYzU3cTN4c0dpSm1wOVNUSGdjS2VSN1NuaDA5bll5SzBjUDlyNGtI?=
 =?utf-8?B?alBKTmw0TVAxQlZMMEM1MCt6VXlSSkhoQkd0cVpTR1M5bDhqVk5IUytpeTNu?=
 =?utf-8?B?cWt1b0pIT0J4a0N1aTkyYjRhOG9NRlRxaDIvczl5WWQzdlFQWFVLS0k3a2t4?=
 =?utf-8?B?SmlLYUplL043SUhDcDFqdkM4NEV1VjNVQWdyOFgyVlFnRlZhemg3ZDlvKzM0?=
 =?utf-8?B?VjFDdXNmQlRwblAyUUpLSWMzemF3ZUJCelg2SGhwY2lUNHZNT0p6Z2sycUNH?=
 =?utf-8?B?WDR1a2hsWmkvcUcvYUxzcHdnWXdnNDM0YW9HYU5vQUlFYzY5bEY5Rk11bUxZ?=
 =?utf-8?B?MFRHM3RicjRpN3FwOU13MEFUeGRFa3pQQzBVMjBJNFJZQXBCYUliZjI3ck5p?=
 =?utf-8?B?djMveDJoVExzQVZOaTJBN2Zxd2paWk9UR1FJbDlpNmFQUGN6dEN0NHdIelli?=
 =?utf-8?B?V1F1bG9MTjF0azRJRFV0Zlc0UVNvUGI2cStOU3dNamgxNGRkM1Ftb0dXNlJR?=
 =?utf-8?B?dVNRY1h6ekw5eXQzdmkxWkZsdGlEZ1luMkhySmVKK0lmN28zU1U1bGFPZlNh?=
 =?utf-8?B?dzF0UjdHVnpCd3ZlMUNZVllHcGpyaFhIakVxaHNuZWlCQkZtZktjVXFZRlg4?=
 =?utf-8?B?VWZ3THFyT3NUV0FQZy84cGMrVE5UaERXOEVTcXpRZ08yRmpUV0lCSUdsczVw?=
 =?utf-8?B?bFdQMm1nT2VxSGVjeGpYQTBUYlJpSERRWTYycWo1aGNnbGJJeWhBWlo3U3R0?=
 =?utf-8?B?QzF2cllwSXcwUldVWVhCOFh0TmJTN1lRT0lOd1V2WWY1MjA4c09pVnk3NENi?=
 =?utf-8?B?clBWRXhJZzhtSXVxeXlYbXNMU3dwVVJsT2xnOUlPeWphTVZBUDl2Mlh5NHoz?=
 =?utf-8?B?VnMvYXJoYXFVQ2JEWE5mRFptVEtqeU02Mk9mUmVrUXZoR0R5bFh4cldGY2h4?=
 =?utf-8?B?K1NMaHIyNlVldjhNSGZXTnZ4Unh5SnZYeTM2UVhoMDBVNmNLQklLSnM1eG5U?=
 =?utf-8?B?cGJNdkpFUFM2SkdTcFU1aTJkVUw3RFZ2UnNjU1VYU1ZSRnlUZkxFZVgxZGVK?=
 =?utf-8?B?djE3NTluUnh3Y0VyK0RCS0hzT3NESnJsYUdQZGtBeGJvMDQzMlJxT2NDMXM5?=
 =?utf-8?B?RWdadiswTVVCOUwxbzRENVJNTit5OGIrRWJJdUdPVkZ6NlhveTBnSzljbnk4?=
 =?utf-8?B?T2pIUVdnbXk4cTNadkp2RFNhTGtQdVc0WlBDNUorUE1jR3RSSUpNazB1My8y?=
 =?utf-8?B?eitwTG5Rc0dKdW4wWG9jWE9JL3pLU3ZPYTFZUVV2YjNNYTF2ZDlWbjNOdTdE?=
 =?utf-8?Q?Bcizu8zoDRzASkkOy0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 225dda29-cac3-4cfd-a168-08d98c5328b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2021 01:05:04.1608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+nZWl35uWS5XKF+DRoMZ//gPZcJpzzRYXC4ioFZL7xqaqzftIsXiOSjC/7/Cxir66riADY9+xY6uFvRWwqb1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5591
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

TGF1cmVudCwNCg0KX19fX19fX19fX19fX19fX19fX19fX19fDQpCUnMsICANCkJpbmdidSBDYW8g
DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTGF1cmVudCBQaW5jaGFy
dCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBP
Y3RvYmVyIDUsIDIwMjEgNzo1OSBBTQ0KPiBUbzogSmVhbi1NaWNoZWwgSGF1dGJvaXMgPGplYW5t
aWNoZWwuaGF1dGJvaXNAaWRlYXNvbmJvYXJkLmNvbT4NCj4gQ2M6IENhbywgQmluZ2J1IDxiaW5n
YnUuY2FvQGludGVsLmNvbT47IFNha2FyaSBBaWx1cw0KPiA8c2FrYXJpLmFpbHVzQGxpbnV4Lmlu
dGVsLmNvbT47IHRmaWdhQGdvb2dsZS5jb207IGxpbnV4LQ0KPiBtZWRpYUB2Z2VyLmtlcm5lbC5v
cmc7IFFpdSwgVGlhbiBTaHUgPHRpYW4uc2h1LnFpdUBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJl
OiBbUEFUQ0hdIG1lZGlhOiBzdGFnaW5nOiBpcHUzLWltZ3U6IEluaXRpYWxpc2UNCj4gaGVpZ2h0
X3Blcl9zbGljZSBpbiB0aGUgc3RyaXBlcw0KPiANCj4gT24gVHVlLCBTZXAgMjgsIDIwMjEgYXQg
MDc6NDE6MDFBTSArMDIwMCwgSmVhbi1NaWNoZWwgSGF1dGJvaXMgd3JvdGU6DQo+ID4gT24gMjgv
MDkvMjAyMSAwMzoyMSwgQ2FvLCBCaW5nYnUgd3JvdGU6DQo+ID4gPiBPbiBUaHVyc2RheSwgU2Vw
dGVtYmVyIDIzLCAyMDIxIDc6NTcgUE0sIEplYW4tTWljaGVsIEhhdXRib2lzIHdyb3RlOg0KPiA+
ID4+IE9uIDIzLzA5LzIwMjEgMTI6NDksIExhdXJlbnQgUGluY2hhcnQgd3JvdGU6DQo+ID4gPj4+
IE9uIFRodSwgU2VwIDIzLCAyMDIxIGF0IDEwOjI5OjMzQU0gKzAwMDAsIENhbywgQmluZ2J1IHdy
b3RlOg0KPiA+ID4+Pj4gT24gVGh1cnNkYXksIFNlcHRlbWJlciAyMywgMjAyMSA1OjQ2IFBNLCBM
YXVyZW50IFBpbmNoYXJ0IHdyb3RlOg0KPiA+ID4+Pj4+IE9uIFRodSwgU2VwIDIzLCAyMDIxIGF0
IDA5OjA2OjMyQU0gKzAwMDAsIENhbywgQmluZ2J1IHdyb3RlOg0KPiA+ID4+Pj4+PiBKZWFuLU1p
Y2hlbCwNCj4gPiA+Pj4+Pj4NCj4gPiA+Pj4+Pj4gRmlyc3RseSwgdGhlIC5oZWlnaHRfcGVyX3Ns
aWNlIGNvdWxkIGJlIDAgaWYgeW91ciAuZ3JpZC53aWR0aA0KPiA+ID4+Pj4+PiBsYXJnZXIgdGhh
biAzMi4NCj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+IFdoaWNoIC5oZWlnaHRfcGVyX3NsaWNlIGFyZSB5
b3UgdGFsa2luZyBhYm91dCA/IEEgZmllbGQgb2YgdGhhdA0KPiA+ID4+Pj4+IG5hbWUgZXhpc3Rz
IGluIGJvdGggaXB1M191YXBpX2FjY19wYXJhbS5hd2IuY29uZmlnLmdyaWQgYW5kDQo+ID4gPj4+
Pj4gc3RydWN0IGlwdTNfdWFwaV9ncmlkX2NvbmZpZyBhbmQgaW1ndV9hYmlfYXdiX2NvbmZpZy5z
dHJpcGVzLmdyaWQuDQo+ID4gPj4+Pj4NCj4gPiA+Pj4+PiBUaGV5IGFyZSBib3RoIGNvbXB1dGVk
IGJ5IHRoZSBkcml2ZXIsIGluIGltZ3VfY3NzX2NmZ19hY2MoKS4gVGhlDQo+ID4gPj4+Pj4gZm9y
bWVyIGlzIHNldCB0bw0KPiA+ID4+Pj4+DQo+ID4gPj4+Pj4gCWFjYy0+YXdiLmNvbmZpZy5ncmlk
LmhlaWdodF9wZXJfc2xpY2UgPQ0KPiA+ID4+Pj4+IAkJSU1HVV9BQklfQVdCX01BWF9DRUxMU19Q
RVJfU0VUIC8gYWNjLQ0KPiA+YXdiLmNvbmZpZy5ncmlkLndpZHRoLA0KPiA+ID4+Pj4+DQo+ID4g
Pj4+Pj4gSU1HVV9BQklfQVdCX01BWF9DRUxMU19QRVJfU0VUIGlzIGVxdWFsIHRvIDE2MCwgc28g
aXQgY2FuIG9ubHkNCj4gPiA+Pj4+PiBiZSAwIGlmIGdyaWQud2lkdGggPiAxNjAsIHdoaWNoIGlz
IGludmFsaWQuDQo+ID4gPj4+Pg0KPiA+ID4+Pj4gRm9yIGF3Yl9mciBhbmQgYWYsIGl0IGNvdWxk
IGJlIDAgaWYgdGhlIC5jb25maWcuZ3JpZF9jZmcud2lkdGggPg0KPiAzMi4NCj4gPiA+Pj4NCj4g
PiA+Pj4gSW5kZWVkLCBteSBiYWQuIEkgd2FzIGZvY3Vzc2luZyBvbiB0aGUgQVdCIHN0YXRpc3Rp
Y3MuDQo+ID4gPj4+DQo+ID4gPj4+IFdoYXQgYXJlIHRoZSBpbXBsaWNhdGlvbnMgb2YgYSBoZWln
aHRfcGVyX3NsaWNlIHZhbHVlIG9mIDAgPw0KPiA+ID4+Pg0KPiA+ID4+PiBXaGlsZSB3ZSBhcmUg
b24gdGhpcyB0b3BpYywgd2hhdCBpcyBhICJzbGljZSIgPyBEb2VzIGl0IG1hdHRlciBmb3INCj4g
PiA+Pj4gdGhlIHVzZXIsIGFzIGluIGRvZXMgaXQgaGF2ZSBhbiBpbXBhY3Qgb24gdGhlIHN0YXRp
c3RpY3MgdmFsdWVzLA0KPiA+ID4+PiBvciBvbiBob3cgdGhleSdyZSBhcnJhbmdlZCBpbiBtZW1v
cnksIG9yIGlzIGl0IGFuIGltcGxlbWVudGF0aW9uDQo+ID4gPj4+IGRldGFpbCBvZiB0aGUgZmly
bXdhcmUgdGhhdCBoYXMgbm8gY29uc2VxdWVuY2Ugb24gd2hhdCBjYW4gYmUgc2Vlbg0KPiBieSB0
aGUgdXNlciA/DQo+ID4gPj4+IChUaGUgInVzZXIiIGhlcmUgaXMgdGhlIGNvZGUgdGhhdCByZWFk
cyB0aGUgc3RhdGlzdGljcyBpbg0KPiB1c2Vyc3BhY2UpLg0KPiA+ID4+Pg0KPiA+ID4+Pj4+PiBG
cm9tIHlvdXIgY29uZmlndXJhdGlvbiwgbG9va3MgbGlrZSBzb21ldGhpbmcgd3JvbmcgaW4gdGhl
DQo+ID4gPj4+Pj4+IHN0cmlwZSBjb25maWd1cmF0aW9uIGNhdXNlIG5vdCBlbnRlcmluZyB0aGUg
MiBzdHJpcGVzIGJyYW5jaC4NCj4gPiA+Pj4+Pg0KPiA+ID4+Pj4+IFdoeSBpcyB0aGF0ID8gSXNu
J3QgaXQgdmFsaWQgZm9yIGEgZ3JpZCBjb25maWd1cmF0aW9uIHRvIHVzZSBhDQo+ID4gPj4+Pj4g
c2luZ2xlIHN0cmlwZSwgaWYgdGhlIGltYWdlIGlzIHNtYWxsIGVub3VnaCwgb3IgaWYgdGhlIGdy
aWQgb25seQ0KPiA+ID4+Pj4+IGNvdmVycyB0aGUgbGVmdCBwYXJ0IG9mIHRoZSBpbWFnZSA/DQo+
ID4gPj4+Pj4NCj4gPiA+Pj4+Pj4gT24gV2VkbmVzZGF5LCBTZXB0ZW1iZXIgMjIsIDIwMjEgMTo1
NCBQTSwgSmVhbi1NaWNoZWwgSGF1dGJvaXMNCj4gd3JvdGU6DQo+ID4gPj4+Pj4+PiBPbiAyMi8w
OS8yMDIxIDA2OjMzLCBDYW8sIEJpbmdidSB3cm90ZToNCj4gPiA+Pj4+Pj4+PiBKZWFuLU1pY2hl
bCwNCj4gPiA+Pj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4+IFRoYW5rcyBmb3IgeW91IHBhdGNoLg0KPiA+
ID4+Pj4+Pj4+IFdoYXQgaXMgdGhlIHZhbHVlIG9mIC5jb25maWcuZ3JpZF9jZmcud2lkdGggZm9y
IHlvdXIgbG93DQo+IHJlc29sdXRpb25zPw0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+IEkgZG9u
J3Qga25vdyBpZiBhIDE5MjB4MTI4MCBvdXRwdXQgaXMgYSBsb3cgcmVzb2x1dGlvbiwgYnV0DQo+
ID4gPj4+Pj4+PiB0aGUgZ3JpZCBpcyBjb25maWd1cmVkIGFzOg0KPiA+ID4+Pj4+Pj4gLSBncmlk
X2NmZy53aWR0aCA9IDc5DQo+ID4gPj4+Pj4+PiAtIGdyaWRfY2ZnLmhlaWdodCA9IDI0DQo+ID4g
Pj4+Pj4+PiAtIGdyaWRfY2ZnLmJsb2NrX3dpZHRoX2xvZzIgPSA0DQo+ID4gPj4+Pj4+PiAtIGdy
aWRfY2ZnLmJsb2NrX2hlaWdodF9sb2cyID0gNg0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+IEhl
cmUgaXMgYSBmdWxsIGRlYnVnIG91dHB1dCBvZiB0aGUgQVdCIHBhcnQgaW4NCj4gaW1ndV9jc3Nf
Y2ZnX2FjYygpOg0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+IGFjYy0+c3RyaXBlLmRvd25fc2Nh
bGVkX3N0cmlwZXNbMF0ud2lkdGg6IDEyODANCj4gPiA+Pj4+Pj4+IGFjYy0+c3RyaXBlLmRvd25f
c2NhbGVkX3N0cmlwZXNbMF0uaGVpZ2h0OiAxNTM2DQo+ID4gPj4+Pj4+PiBhY2MtPnN0cmlwZS5k
b3duX3NjYWxlZF9zdHJpcGVzWzBdLm9mZnNldDogMA0KPiA+ID4+Pj4+Pj4gYWNjLT5zdHJpcGUu
YmRzX291dF9zdHJpcGVzWzBdLndpZHRoOiAxMjgwDQo+ID4gPj4+Pj4+PiBhY2MtPnN0cmlwZS5i
ZHNfb3V0X3N0cmlwZXNbMF0uaGVpZ2h0OiAxNTM2DQo+ID4gPj4+Pj4+PiBhY2MtPnN0cmlwZS5i
ZHNfb3V0X3N0cmlwZXNbMF0ub2Zmc2V0OiAwDQo+ID4gPj4+Pj4+PiBhY2MtPmFjYy0+YXdiLnN0
cmlwZXNbMF0uZ3JpZC53aWR0aDogNzkNCj4gPiA+Pj4+Pj4+IGFjYy0+YXdiLnN0cmlwZXNbMF0u
Z3JpZC5ibG9ja193aWR0aF9sb2cyOiA0DQo+ID4gPj4+Pj4+PiBhY2MtPmFjYy0+YXdiLnN0cmlw
ZXNbMF0uZ3JpZC5oZWlnaHQ6IDI0DQo+ID4gPj4+Pj4+PiBhY2MtPmF3Yi5zdHJpcGVzWzBdLmdy
aWQuYmxvY2tfaGVpZ2h0X2xvZzI6IDYNCj4gPiA+Pj4+Pj4+IGFjYy0+YXdiLnN0cmlwZXNbMF0u
Z3JpZC54X3N0YXJ0OiAwDQo+ID4gPj4+Pj4+PiBhY2MtPmF3Yi5zdHJpcGVzWzBdLmdyaWQueF9l
bmQ6IDEyNjMNCj4gPiA+Pj4+Pj4+IGFjYy0+YXdiLnN0cmlwZXNbMF0uZ3JpZC55X3N0YXJ0OiAw
DQo+ID4gPj4+Pj4+PiBhY2MtPmF3Yi5zdHJpcGVzWzBdLmdyaWQueV9lbmQ6IDE1MzUNCj4gPiA+
Pj4+Pj4+IGFjYy0+c3RyaXBlLmRvd25fc2NhbGVkX3N0cmlwZXNbMV0ud2lkdGg6IDEyODANCj4g
PiA+Pj4+Pj4+IGFjYy0+c3RyaXBlLmRvd25fc2NhbGVkX3N0cmlwZXNbMV0uaGVpZ2h0OiAxNTM2
DQo+ID4gPj4+Pj4+PiBhY2MtPnN0cmlwZS5kb3duX3NjYWxlZF9zdHJpcGVzWzFdLm9mZnNldDog
MTAyNA0KPiA+ID4+Pj4+Pj4gYWNjLT5zdHJpcGUuYmRzX291dF9zdHJpcGVzWzFdLndpZHRoOiAx
MjgwDQo+ID4gPj4+Pj4+PiBhY2MtPnN0cmlwZS5iZHNfb3V0X3N0cmlwZXNbMV0uaGVpZ2h0OiAx
NTM2DQo+ID4gPj4+Pj4+PiBhY2MtPnN0cmlwZS5iZHNfb3V0X3N0cmlwZXNbMV0ub2Zmc2V0OiAx
MDI0DQo+ID4gPj4+Pj4+PiBhY2MtPmFjYy0+YXdiLnN0cmlwZXNbMV0uZ3JpZC53aWR0aDogNzkN
Cj4gPiA+Pj4+Pj4+IGFjYy0+YXdiLnN0cmlwZXNbMV0uZ3JpZC5ibG9ja193aWR0aF9sb2cyOiA0
DQo+ID4gPj4+Pj4+PiBhY2MtPmFjYy0+YXdiLnN0cmlwZXNbMV0uZ3JpZC5oZWlnaHQ6IDI0DQo+
ID4gPj4+Pj4+PiBhY2MtPmF3Yi5zdHJpcGVzWzFdLmdyaWQuYmxvY2tfaGVpZ2h0X2xvZzI6IDYN
Cj4gPiA+Pj4+Pj4+IGFjYy0+YXdiLnN0cmlwZXNbMV0uZ3JpZC54X3N0YXJ0OiAwDQo+ID4gPj4+
Pj4+PiBhY2MtPmF3Yi5zdHJpcGVzWzFdLmdyaWQueF9lbmQ6IDEyNjMNCj4gPiA+Pj4+Pj4+IGFj
Yy0+YXdiLnN0cmlwZXNbMV0uZ3JpZC55X3N0YXJ0OiAwDQo+ID4gPj4+Pj4+PiBhY2MtPmF3Yi5z
dHJpcGVzWzFdLmdyaWQueV9lbmQ6IDE1MzUNCj4gPiA+Pj4+DQo+ID4gPj4+PiBBcmUgdGhlc2Ug
ZHVtcHMgZnJvbSAxOTIweDEyODAgb3V0cHV0Pw0KPiA+ID4+Pg0KPiA+ID4+PiBKZWFuLU1pY2hl
bCwgY291bGQgeW91IGNvbW1lbnQgb24gdGhpcyA/DQo+ID4gPj4+DQo+ID4gPj4+IE5vdGUgdGhh
dCB0aGUgZ3JpZCBpcyBjb25maWd1cmVkIHdpdGggNzkgY2VsbHMgb2YgMTYgcGl4ZWxzLA0KPiA+
ID4+PiBjb3ZlcmluZw0KPiA+ID4+PiAxMjY0IHBpeGVscyBob3Jpem9udGFsbHkuIFRoYXQncyBu
b3QgdGhlIGZ1bGwgaW1hZ2UgZm9yIGEgMTkyMA0KPiA+ID4+PiBwaXhlbHMgb3V0cHV0LCBhbmQg
d2lsbCBwcm9iYWJseSBub3QgYmUgZG9uZSBpbiBwcmFjdGljZSwgYnV0DQo+ID4gPj4+IHRoZXJl
J3Mgbm90aGluZyBwcmV2ZW50aW5nIHRoZSBncmlkIGZyb20gY292ZXJpbmcgcGFydCBvZiB0aGUg
aW1hZ2UNCj4gb25seS4NCj4gPiA+Pg0KPiA+ID4+IEl0IGlzIGEgZHVtcCBmb3IgYSAxOTIweDEy
ODAgb3V0cHV0Lg0KPiA+ID4+IElmIGl0IGNhbiBoZWxwLCB0aGUgY29uZmlndXJhdGlvbiBzZXQg
aW4gSW1nVSBpczoNCj4gPiA+PiAgIElGOiAyNTkyeDE3MjgNCj4gPiA+PiAgIEJEUzogMjMwNHgx
NTM2DQo+ID4gPj4gICBHREM6IDE5MjB4MTI4MA0KPiA+ID4NCj4gPiA+IEplYW4tTWljaGVsLA0K
PiA+ID4NCj4gPiA+IEl0IGxvb2tzIHlvdSBhcmUgdHJ5aW5nIHRvIHVzZSAyIHN0cmlwZXMgYW5k
IHRoZSBncmlkIHNpemUgaXMNCj4gPiA+IDI1Mjh4MTUzNiwgYW5kIHRoZSBhd2IuY29uZmlnLmdy
aWQueF9lbmQgc2hvdWxkIGJlIGxhcmdlciB0aGFuIHRoZQ0KPiA+ID4gYmRzX291dF9zdHJpcGVz
WzBdLndpZHRoIC0gMTAsIGl0IHdvdWxkIG5vdCBoaXQgYW55IDEgc3RyaXBlDQo+IGNvbmRpdGlv
bi4NCj4gPiA+DQo+ID4gPiBjb3VsZCB5b3UgYWxzbyBzaGFyZSB5b3VyIGF3Yi5jb25maWcuZ3Jp
ZD8NCj4gPg0KPiA+IEkgYWxyZWFkeSBzaGFyZWQgaXQ6DQo+ID4gLSBncmlkX2NmZy53aWR0aCA9
IDc5DQo+ID4gLSBncmlkX2NmZy5oZWlnaHQgPSAyNA0KPiA+IC0gZ3JpZF9jZmcuYmxvY2tfd2lk
dGhfbG9nMiA9IDQNCj4gPiAtIGdyaWRfY2ZnLmJsb2NrX2hlaWdodF9sb2cyID0gNg0KPiA+IHN0
YXJ0X3ggYW5kIHN0YXJ0X3kgYXJlIHNldCB0byAwLg0KPiANCj4gQXMgYW4gYWRkaXRpb25hbCBu
b3RlLCB3ZSBrbm93IHRoaXMgaXMgYW4gdW51c3VhbCBncmlkIGNvbmZpZ3VyYXRpb24gaW4NCj4g
dGhlIHNlbnNlIHRoYXQgaXQgc3BhbnMgNzkqMTYgPSAxMjY0IHBpeGVscywgbXVjaCBsZXNzIHRo
YW4gdGhlIEJEUw0KPiBvdXRwdXQgd2lkdGgsIGJ1dCBJIGRvbid0IHNlZSB3aHkgdGhhdCB3b3Vs
ZCBiZSBpbnZhbGlkLg0KDQpNeSBwb2ludCBpcyBub3QgdGhhdCB0aGUgZ3JpZCBjb25maWcsIEkg
bWVhbiB0aGUgYXdiL2FmX3N0cmlwZV9jb25maWcgc2hvdWxkIGJlDQpjb3JyZWN0LCBmcm9tIHRo
ZSBjb25maWd1cmUgZHVtcCwgaXQgd2FzIHVzaW5nIDIgc3RyaXBlcyBmb3IgYXdiLCByaWdodD8N
Cg0KDQo+IA0KPiA+ID4+Pj4+Pj4gVGhpcyBoYXMgYmVlbiBvdXRwdXR0ZWQgd2l0aDoNCj4gPiA+
Pj4+Pj4+IGh0dHBzOi8vcGFzdGUuZGViaWFuLm5ldC8xMjEyNzkxLw0KPiA+ID4+Pj4+Pj4NCj4g
PiA+Pj4+Pj4+IFRoZSBleGFtcGxlcyBJIGdhdmUgYmVmb3JlIHdlcmUgMTI4MHg3MjAgb3V0cHV0
IGFuZCBub3QNCj4gPiA+Pj4+Pj4+IDE5MjB4MTA4MCwgaGVyZSBhcmUgdGhleToNCj4gPiA+Pj4+
Pj4+IC0gd2l0aG91dCB0aGUgcGF0Y2g6IGh0dHBzOi8vcGFzdGVib2FyZC5jby9oSG80UWtWVVNr
OGUucG5nDQo+ID4gPj4+Pj4+PiAtIHdpdGggdGhlIHBhdGNoOiBodHRwczovL3Bhc3RlYm9hcmQu
Y28vWVVHVXZTNXREMGJvLnBuZw0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+IEFzIHlvdSBjYW4g
c2VlIHdlIGhhdmUgdGhlIHNhbWUgYmVoYXZpb3VyLg0KPiA+ID4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+
PiBPbiBUdWVzZGF5LCBTZXB0ZW1iZXIgMjEsIDIwMjEgMTA6MzQgUE0sIExhdXJlbnQgUGluY2hh
cnQNCj4gd3JvdGU6DQo+ID4gPj4+Pj4+Pj4+IE9uIFR1ZSwgU2VwIDIxLCAyMDIxIGF0IDAzOjA0
OjM3UE0gKzAyMDAsIEplYW4tTWljaGVsDQo+IEhhdXRib2lzIHdyb3RlOg0KPiA+ID4+Pj4+Pj4+
Pj4gT24gMjEvMDkvMjAyMSAxMzowNywgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiA+ID4+Pj4+Pj4+
Pj4+IE9uIFRodSwgU2VwIDE2LCAyMDIxIGF0IDA3OjI1OjA0UE0gKzAyMDAsIEplYW4tTWljaGVs
DQo+IEhhdXRib2lzIHdyb3RlOg0KPiA+ID4+Pj4+Pj4+Pj4+PiBXaGlsZSBwbGF5aW5nIHdpdGgg
bG93IHJlc29sdXRpb25zIGZvciB0aGUgZ3JpZCwgaXQNCj4gPiA+Pj4+Pj4+Pj4+Pj4gYXBwZWFy
ZWQgdGhhdCBoZWlnaHRfcGVyX3NsaWNlIGlzIG5vdCBpbml0aWFsaXNlZCBpZiB3ZQ0KPiA+ID4+
Pj4+Pj4+Pj4+PiBhcmUgbm90IHVzaW5nIGJvdGggc3RyaXBlcyBmb3IgdGhlIGNhbGN1bGF0aW9u
cy4gVGhpcw0KPiBwYXR0ZXJuIG9jY3VycyB0aHJlZSB0aW1lczoNCj4gPiA+Pj4+Pj4+Pj4+Pj4g
LSBmb3IgdGhlIGF3Yl9mciBwcm9jZXNzaW5nIGJsb2NrDQo+ID4gPj4+Pj4+Pj4+Pj4+IC0gZm9y
IHRoZSBhZiBwcm9jZXNzaW5nIGJsb2NrDQo+ID4gPj4+Pj4+Pj4+Pj4+IC0gZm9yIHRoZSBhd2Ig
cHJvY2Vzc2luZyBibG9jaw0KPiA+ID4+Pj4+Pj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4+Pj4+PiBUaGUg
aWRlYSBvZiB0aGlzIHNtYWxsIHBvcnRpb24gb2YgY29kZSBpcyB0byByZWR1Y2UNCj4gPiA+Pj4+
Pj4+Pj4+Pj4gY29tcGxleGl0eSBpbiBsb2FkaW5nIHRoZSBzdGF0aXN0aWNzLCBpdCBjb3VsZCBi
ZSBkb25lDQo+ID4gPj4+Pj4+Pj4+Pj4+IGFsc28gd2hlbiBvbmx5IG9uZSBzdHJpcGUgaXMgdXNl
ZC4gRml4IGl0IGJ5IGdldHRpbmcgdGhpcw0KPiA+ID4+Pj4+Pj4+Pj4+PiBpbml0aWFsaXNhdGlv
biBjb2RlIG91dHNpZGUgb2YgdGhlDQo+ID4gPj4+Pj4+Pj4+Pj4+IGVsc2UoKSB0ZXN0IGNhc2Uu
DQo+ID4gPj4+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEplYW4t
TWljaGVsIEhhdXRib2lzDQo+ID4gPj4+Pj4+Pj4+Pj4+IDxqZWFubWljaGVsLmhhdXRib2lzQGlk
ZWFzb25ib2FyZC5jb20+DQo+ID4gPj4+Pj4+Pj4+Pj4+IC0tLQ0KPiA+ID4+Pj4+Pj4+Pj4+PiAg
ZHJpdmVycy9zdGFnaW5nL21lZGlhL2lwdTMvaXB1My1jc3MtcGFyYW1zLmMgfCA0NCA+Pj4+Pg0K
PiA+ID4+Pj4+Pj4+Pj4+PiArKysrKysrKysrLS0tLS0tLS0tLQ0KPiA+ID4+Pj4+Pj4+Pj4+PiAg
MSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDIyIGRlbGV0aW9ucygtKQ0KPiA+ID4+
Pj4+Pj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5n
L21lZGlhL2lwdTMvaXB1My1jc3MtcGFyYW1zLmMNCj4gPiA+Pj4+Pj4+Pj4+Pj4gYi9kcml2ZXJz
L3N0YWdpbmcvbWVkaWEvaXB1My9pcHUzLWNzcy1wYXJhbXMuYw0KPiA+ID4+Pj4+Pj4+Pj4+PiBp
bmRleCBlOWQ2YmQ5ZTkzMzIuLjA1ZGE3ZGJkY2E3OCAxMDA2NDQNCj4gPiA+Pj4+Pj4+Pj4+Pj4g
LS0tIGEvZHJpdmVycy9zdGFnaW5nL21lZGlhL2lwdTMvaXB1My1jc3MtcGFyYW1zLmMNCj4gPiA+
Pj4+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL21lZGlhL2lwdTMvaXB1My1jc3MtcGFy
YW1zLmMNCj4gPiA+Pj4+Pj4+Pj4+Pj4gQEAgLTI0MjgsMTYgKzI0MjgsMTYgQEAgaW50IGltZ3Vf
Y3NzX2NmZ19hY2Moc3RydWN0DQo+IGltZ3VfY3NzICpjc3MsIHVuc2lnbmVkIGludCBwaXBlLA0K
PiA+ID4+Pj4+Pj4+Pj4+PiAgCQkJCQlhY2MtDQo+ID5hd2JfZnIuc3RyaXBlc1sxXS5ncmlkX2Nm
Zy53aWR0aCwNCj4gPiA+Pj4+Pj4+Pj4+Pj4gIAkJCQkJYl93X2xvZzIpOw0KPiA+ID4+Pj4+Pj4+
Pj4+PiAgCQlhY2MtPmF3Yl9mci5zdHJpcGVzWzFdLmdyaWRfY2ZnLnhfZW5kID0gZW5kOw0KPiA+
ID4+Pj4+Pj4+Pj4+PiAtDQo+ID4gPj4+Pj4+Pj4+Pj4+IC0JCS8qDQo+ID4gPj4+Pj4+Pj4+Pj4+
IC0JCSAqIFRvIHJlZHVjZSBjb21wbGV4aXR5IG9mIGRlYnViYmxpbmcgYW5kDQo+IGxvYWRpbmcN
Cj4gPiA+Pj4+Pj4+Pj4+Pj4gLQkJICogc3RhdGlzdGljcyBmaXggZ3JpZF9oZWlnaHRfcGVyX3Ns
aWNlIHRvIDENCj4gZm9yIGJvdGgNCj4gPiA+Pj4+Pj4+Pj4+Pj4gLQkJICogc3RyaXBlcy4NCj4g
PiA+Pj4+Pj4+Pj4+Pj4gLQkJICovDQo+ID4gPj4+Pj4+Pj4+Pj4+IC0JCWZvciAoaSA9IDA7IGkg
PCBzdHJpcGVzOyBpKyspDQo+ID4gPj4+Pj4+Pj4+Pj4+IC0JCQlhY2MtDQo+ID5hd2JfZnIuc3Ry
aXBlc1tpXS5ncmlkX2NmZy5oZWlnaHRfcGVyX3NsaWNlID0gMTsNCj4gPiA+Pj4+Pj4+Pj4+Pj4g
IAl9DQo+ID4gPj4+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+Pj4+ICsJLyoNCj4gPiA+Pj4+Pj4+
Pj4+Pj4gKwkgKiBUbyByZWR1Y2UgY29tcGxleGl0eSBvZiBkZWJ1YmJsaW5nIGFuZCBsb2FkaW5n
DQo+ID4gPj4+Pj4+Pj4+Pj4+ICsJICogc3RhdGlzdGljcyBmaXggZ3JpZF9oZWlnaHRfcGVyX3Ns
aWNlIHRvIDEgZm9yIGJvdGgNCj4gPiA+Pj4+Pj4+Pj4+Pj4gKwkgKiBzdHJpcGVzLg0KPiA+ID4+
Pj4+Pj4+Pj4+PiArCSAqLw0KPiA+ID4+Pj4+Pj4+Pj4+PiArCWZvciAoaSA9IDA7IGkgPCBzdHJp
cGVzOyBpKyspDQo+ID4gPj4+Pj4+Pj4+Pj4+ICsJCWFjYy0NCj4gPmF3Yl9mci5zdHJpcGVzW2ld
LmdyaWRfY2ZnLmhlaWdodF9wZXJfc2xpY2UgPSAxOw0KPiA+ID4+Pj4+Pj4+Pj4+PiArDQo+ID4g
Pj4+Pj4+Pj4+Pj4+ICAJaWYgKGltZ3VfY3NzX2F3Yl9mcl9vcHNfY2FsYyhjc3MsIHBpcGUsICZh
Y2MtPmF3Yl9mcikpDQo+ID4gPj4+Pj4+Pj4+Pj4+ICAJCXJldHVybiAtRUlOVkFMOw0KPiA+ID4+
Pj4+Pj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4+Pj4+PiBAQCAtMjU5MSwxNSArMjU5MSwxNSBAQCBpbnQg
aW1ndV9jc3NfY2ZnX2FjYyhzdHJ1Y3QNCj4gaW1ndV9jc3MgKmNzcywgdW5zaWduZWQgaW50IHBp
cGUsDQo+ID4gPj4+Pj4+Pj4+Pj4+ICAJCQlpbWd1X2Nzc19ncmlkX2VuZChhY2MtDQo+ID5hZi5z
dHJpcGVzWzFdLmdyaWRfY2ZnLnhfc3RhcnQsDQo+ID4gPj4+Pj4+Pj4+Pj4+ICAJCQkJCSAgYWNj
LQ0KPiA+YWYuc3RyaXBlc1sxXS5ncmlkX2NmZy53aWR0aCwNCj4gPiA+Pj4+Pj4+Pj4+Pj4gIAkJ
CQkJICBiX3dfbG9nMik7DQo+ID4gPj4+Pj4+Pj4+Pj4+IC0NCj4gPiA+Pj4+Pj4+Pj4+Pj4gLQkJ
LyoNCj4gPiA+Pj4+Pj4+Pj4+Pj4gLQkJICogVG8gcmVkdWNlIGNvbXBsZXhpdHkgb2YgZGVidWJi
bGluZyBhbmQNCj4gbG9hZGluZyBzdGF0aXN0aWNzDQo+ID4gPj4+Pj4+Pj4+Pj4+IC0JCSAqIGZp
eCBncmlkX2hlaWdodF9wZXJfc2xpY2UgdG8gMSBmb3IgYm90aA0KPiBzdHJpcGVzDQo+ID4gPj4+
Pj4+Pj4+Pj4+IC0JCSAqLw0KPiA+ID4+Pj4+Pj4+Pj4+PiAtCQlmb3IgKGkgPSAwOyBpIDwgc3Ry
aXBlczsgaSsrKQ0KPiA+ID4+Pj4+Pj4+Pj4+PiAtCQkJYWNjLQ0KPiA+YWYuc3RyaXBlc1tpXS5n
cmlkX2NmZy5oZWlnaHRfcGVyX3NsaWNlID0gMTsNCj4gPiA+Pj4+Pj4+Pj4+Pj4gIAl9DQo+ID4g
Pj4+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+Pj4+ICsJLyoNCj4gPiA+Pj4+Pj4+Pj4+Pj4gKwkg
KiBUbyByZWR1Y2UgY29tcGxleGl0eSBvZiBkZWJ1YmJsaW5nIGFuZCBsb2FkaW5nDQo+IHN0YXRp
c3RpY3MNCj4gPiA+Pj4+Pj4+Pj4+Pj4gKwkgKiBmaXggZ3JpZF9oZWlnaHRfcGVyX3NsaWNlIHRv
IDEgZm9yIGJvdGggc3RyaXBlcw0KPiA+ID4+Pj4+Pj4+Pj4+PiArCSAqLw0KPiA+ID4+Pj4+Pj4+
Pj4+PiArCWZvciAoaSA9IDA7IGkgPCBzdHJpcGVzOyBpKyspDQo+ID4gPj4+Pj4+Pj4+Pj4+ICsJ
CWFjYy0+YWYuc3RyaXBlc1tpXS5ncmlkX2NmZy5oZWlnaHRfcGVyX3NsaWNlID0NCj4gMTsNCj4g
PiA+Pj4+Pj4+Pj4+Pj4gKw0KPiA+ID4+Pj4+Pj4+Pj4+PiAgCWlmIChpbWd1X2Nzc19hZl9vcHNf
Y2FsYyhjc3MsIHBpcGUsICZhY2MtPmFmKSkNCj4gPiA+Pj4+Pj4+Pj4+Pj4gIAkJcmV0dXJuIC1F
SU5WQUw7DQo+ID4gPj4+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+Pj4+IEBAIC0yNjYwLDE1ICsy
NjYwLDE1IEBAIGludCBpbWd1X2Nzc19jZmdfYWNjKHN0cnVjdA0KPiBpbWd1X2NzcyAqY3NzLCB1
bnNpZ25lZCBpbnQgcGlwZSwNCj4gPiA+Pj4+Pj4+Pj4+Pj4gIAkJCWltZ3VfY3NzX2dyaWRfZW5k
KGFjYy0NCj4gPmF3Yi5zdHJpcGVzWzFdLmdyaWQueF9zdGFydCwNCj4gPiA+Pj4+Pj4+Pj4+Pj4g
IAkJCQkJICBhY2MtDQo+ID5hd2Iuc3RyaXBlc1sxXS5ncmlkLndpZHRoLA0KPiA+ID4+Pj4+Pj4+
Pj4+PiAgCQkJCQkgIGJfd19sb2cyKTsNCj4gPiA+Pj4+Pj4+Pj4+Pj4gLQ0KPiA+ID4+Pj4+Pj4+
Pj4+PiAtCQkvKg0KPiA+ID4+Pj4+Pj4+Pj4+PiAtCQkgKiBUbyByZWR1Y2UgY29tcGxleGl0eSBv
ZiBkZWJ1YmJsaW5nIGFuZA0KPiBsb2FkaW5nIHN0YXRpc3RpY3MNCj4gPiA+Pj4+Pj4+Pj4+Pj4g
LQkJICogZml4IGdyaWRfaGVpZ2h0X3Blcl9zbGljZSB0byAxIGZvciBib3RoDQo+IHN0cmlwZXMN
Cj4gPiA+Pj4+Pj4+Pj4+Pj4gLQkJICovDQo+ID4gPj4+Pj4+Pj4+Pj4+IC0JCWZvciAoaSA9IDA7
IGkgPCBzdHJpcGVzOyBpKyspDQo+ID4gPj4+Pj4+Pj4+Pj4+IC0JCQlhY2MtDQo+ID5hd2Iuc3Ry
aXBlc1tpXS5ncmlkLmhlaWdodF9wZXJfc2xpY2UgPSAxOw0KPiA+ID4+Pj4+Pj4+Pj4+PiAgCX0N
Cj4gPiA+Pj4+Pj4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+Pj4+Pj4gKwkvKg0KPiA+ID4+Pj4+Pj4+Pj4+
PiArCSAqIFRvIHJlZHVjZSBjb21wbGV4aXR5IG9mIGRlYnViYmxpbmcgYW5kIGxvYWRpbmcNCj4g
c3RhdGlzdGljcw0KPiA+ID4+Pj4+Pj4+Pj4+PiArCSAqIGZpeCBncmlkX2hlaWdodF9wZXJfc2xp
Y2UgdG8gMSBmb3IgYm90aCBzdHJpcGVzDQo+ID4gPj4+Pj4+Pj4+Pj4+ICsJICovDQo+ID4gPj4+
Pj4+Pj4+Pj4+ICsJZm9yIChpID0gMDsgaSA8IHN0cmlwZXM7IGkrKykNCj4gPiA+Pj4+Pj4+Pj4+
Pj4gKwkJYWNjLT5hd2Iuc3RyaXBlc1tpXS5ncmlkLmhlaWdodF9wZXJfc2xpY2UgPSAxOw0KPiA+
ID4+Pj4+Pj4+Pj4+PiArDQo+ID4gPj4+Pj4+Pj4+Pj4+ICAJaWYgKGltZ3VfY3NzX2F3Yl9vcHNf
Y2FsYyhjc3MsIHBpcGUsICZhY2MtPmF3YikpDQo+ID4gPj4+Pj4+Pj4+Pj4+ICAJCXJldHVybiAt
RUlOVkFMOw0KPiA+ID4+Pj4+Pj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+
Pj4gV2hpbGUgaXQgc2VlbXMgbGlrZSBhIHNlbnNpYmxlIGlkZWEgdG8gaW5pdGlhbGlzZQ0KPiA+
ID4+Pj4+Pj4+Pj4+IGFyZ3VtZW50cyB0byBmaXJtd2FyZSwgZG9lcyB0aGlzIGhhdmUgYW4gZWZm
ZWN0IG9uIHRoZQ0KPiBzdGF0aXN0aWNzIGZvcm1hdD8NCj4gPiA+Pj4+Pj4+Pj4+PiBJZiBzbywg
Y2FuIHRoZSBleGlzdGluZyB1c2VyIHNwYWNlIGNvcGUgd2l0aCB0aGF0Pw0KPiA+ID4+Pj4+Pj4+
Pj4NCj4gPiA+Pj4+Pj4+Pj4+IFRvIHRyeSBhbmQgZmlndXJlIHRoYXQgb3V0LCB3ZSBoYXZlIHRl
c3RlZCBzZXZlcmFsIGdyaWQNCj4gPiA+Pj4+Pj4+Pj4+IGNvbmZpZ3VyYXRpb25zIGFuZCBpbnNw
ZWN0ZWQgdGhlIGNhcHR1cmVkIHN0YXRpc3RpY3MuIFdlDQo+ID4gPj4+Pj4+Pj4+PiBoYXZlIGNv
bnZlcnRlZCB0aGUgc3RhdGlzdGljcyBpbiBhbiBpbWFnZSwgcmVuZGVyaW5nIGVhY2gNCj4gPiA+
Pj4+Pj4+Pj4+IGNlbGwgYXMgYSBwaXhlbCB3aG9zZSByZWQsIGdyZWVuIGFuZCBibHVlIGNvbXBv
bmVudHMgYXJlIHRoZQ0KPiBjZWxsJ3MgcmVkLCBncmVlbiBhbmQgYmx1ZSBhdmVyYWdlcy4NCj4g
PiA+Pj4+Pj4+Pj4+IFRoaXMgdHVybmVkIG91dCB0byBiZSBhIHZlcnkgZWZmZWN0aWNlIHRvb2wg
dG8gcXVpY2tseQ0KPiA+ID4+Pj4+Pj4+Pj4gdmlzdWFsaXplIEFXQiBzdGF0aXN0aWNzLg0KPiA+
ID4+Pj4+Pj4+Pj4gV2UgaGF2ZSBtYWRlIGEgbG90IG9mIHRlc3RzIHdpdGggZGlmZmVyZW50IG91
dHB1dA0KPiA+ID4+Pj4+Pj4+Pj4gcmVzb2x1dGlvbnMsIGZyb20gYSBzbWFsbCBvbmUgdXAgdG8g
dGhlIGZ1bGwtc2NhbGUgb25lLg0KPiA+ID4+Pj4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+Pj4+IEhlcmUg
aXMgb25lIGV4YW1wbGUgb2YgYSBzdGF0aXN0aWNzIG91dHB1dCB3aXRoIGENCj4gPiA+Pj4+Pj4+
Pj4+IFZpZXdGaW5kZXIgY29uZmlndXJlZCBhcyAxOTIweDEyODAsIHdpdGggYSBCRFMgb3V0cHV0
DQo+ID4gPj4+Pj4+Pj4+PiBjb25maWd1cmF0aW9uIHNldCB0bw0KPiA+ID4+Pj4+Pj4+Pj4gMjMw
NHgxNTM2IChzZW5zb3IgaXMgMjU5MngxOTQ0KS4NCj4gPiA+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+
Pj4+PiBXaXRob3V0IHRoZSBwYXRjaCwgY29uZmlndXJpbmcgYSA3OXg0NSBncmlkIG9mIDE2eDE2
IGNlbGxzDQo+ID4gPj4+Pj4+Pj4+PiB3ZSBvYnRhaW4gdGhlDQo+ID4gPj4+Pj4+Pj4+PiBpbWFn
ZTogaHR0cHM6Ly9wYXN0ZWJvYXJkLmNvL2c0bkM0ZkhqYlZFUi5wbmcuDQo+ID4gPj4+Pj4+Pj4+
PiBXZSBjYW4gbm90aWNlIGEgd2VpcmQgcGFkZGluZyBldmVyeSB0d28gbGluZXMgYW5kIGl0IHNl
ZW1zDQo+ID4gPj4+Pj4+Pj4+PiB0byBiZSBtaXNzaW5nIGhhbGYgb2YgdGhlIGZyYW1lLg0KPiA+
ID4+Pj4+Pj4+Pj4NCj4gPiA+Pj4+Pj4+Pj4+IFdpdGggdGhlIHBhdGNoIGFwcGxpZWQsIHRoZSBz
YW1lIGNvbmZpZ3VyYXRpb24gZ2l2ZXMgdXMgdGhlDQo+IGltYWdlOg0KPiA+ID4+Pj4+Pj4+Pj4g
aHR0cHM6Ly9wYXN0ZWJvYXJkLmNvL3J6YXA2YXhJdlZkdS5wbmcNCj4gPiA+Pj4+Pj4+Pj4+DQo+
ID4gPj4+Pj4+Pj4+PiBXZSBjYW4gY2xlYXJseSBzZWUgdGhlIG9uZSBwYWRkaW5nIHBpeGVsIG9u
IHRoZSByaWdodCwgYW5kDQo+ID4gPj4+Pj4+Pj4+PiB0aGUgZnJhbWUgaXMgYWxsIHRoZXJlLCBh
cyBleHBlY3RlZC4NCj4gPiA+Pj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+PiBUb21hc3o6IFdlJ3Jl
IGNvbmNlcm5lZCB0aGF0IHRoaXMgcGF0Y2ggbWF5IGhhdmUgYW4gaW1wYWN0DQo+ID4gPj4+Pj4+
Pj4+PiBvbiB0aGUgQ2hyb21lT1MgSW50ZWwgQ2FtZXJhIEhBTCB3aXRoIHRoZSBJUFUzLiBJcyBp
dA0KPiA+ID4+Pj4+Pj4+Pj4gcG9zc2libGUgZm9yIHNvbWVvbmUgdG8gcmV2aWV3IGFuZCB0ZXN0
IHRoaXMgcGxlYXNlPw0KPiA+ID4+Pj4+Pj4+Pg0KPiA+ID4+Pj4+Pj4+PiBBcyBzaG93biBieSB0
aGUgaW1hZ2VzIGFib3ZlLCB0aGlzIGlzIGEgcmVhbCBmaXguIEl0IG9ubHkNCj4gPiA+Pj4+Pj4+
Pj4gYWZmZWN0cyBncmlkIGNvbmZpZ3VyYXRpb25zIHRoYXQgdXNlIGEgc2luZ2xlIHN0cmlwZSAo
bGVmdA0KPiA+ID4+Pj4+Pj4+PiBvciByaWdodCksIHNvIGVpdGhlciAic21hbGwiIHJlc29sdXRp
b25zIChsZXNzIHRoYW4gMTI4MA0KPiA+ID4+Pj4+Pj4+PiBwaXhlbHMgYXQgdGhlIEJEUyBvdXRw
dXQgaWYgSSByZWNhbGwgY29ycmVjdGx5KSwgb3IgZ3JpZA0KPiA+ID4+Pj4+Pj4+PiBjb25maWd1
cmF0aW9ucyB0aGF0IHNwYW4gdGhlIGxlZnQgcGFydCBvZiB0aGUgaW1hZ2Ugd2l0aA0KPiBoaWdo
ZXIgcmVzb2x1dGlvbnMuDQo+ID4gPj4+Pj4+Pj4+IFRoZSBsYXR0ZXIgaXMgcHJvYmFibHkgdW5s
aWtlbHkuIEZvciB0aGUgZm9ybWVyLCBpdCBtYXkNCj4gPiA+Pj4+Pj4+Pj4gYWZmZWN0IHRoZSBi
aW5hcnkgbGlicmFyeSwgZXNwZWNpYWxseSBpZiBpdCBpbmNsdWRlcyBhDQo+IHdvcmthcm91bmQg
Zm9yIHRoZSBidWcuDQo+ID4gPj4+Pj4+Pj4+DQo+ID4gPj4+Pj4+Pj4+IFN0aWxsLCB0aGlzIGNo
YW5nZSBpcyBnb29kIEkgYmVsaWV2ZSwgc28gaXQgc2hvdWxkIGJlDQo+IHVwc3RyZWFtZWQuDQo+
IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
