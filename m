Return-Path: <linux-media+bounces-4150-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180083AC6B
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 15:50:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 117BF299D81
	for <lists+linux-media@lfdr.de>; Wed, 24 Jan 2024 14:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CBFF7C09A;
	Wed, 24 Jan 2024 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FV+X4iVs"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009D7A73E
	for <linux-media@vger.kernel.org>; Wed, 24 Jan 2024 14:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706106973; cv=fail; b=bUXki128imy8c7hJIJSGdrIlvw2KtLeh/8/G8TTJOPsDxonXzMiTiU/QZrPuo2tOEMXt7oCK7OyrvDeI5+Y/KU/4ZUPDYQdPvCJgmvJwl/EBjy8mddWTpB8Ld7icy00WoF4YvNg40msMjZAK6hBCBkySUNcR84rXRPX7FuItsyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706106973; c=relaxed/simple;
	bh=iNm422k1ablrvaj0e0ixhEQlsfXEso5XSn9T45n+gsc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GidaBPyU0DbQDxSA4hQcakmw/y8XcOT3s8oBg6bLVEE12HZpiH5ZkEqxGnLxuUE+97Nj7zpmjL/a8eV7Yz0UKyIgDK7/VGPcFqxMaefJLG3k0ceFYW2leO7rNHyXdnuroW3264oDu6UcAOXP1BSIhtCFRFKXFJ7sMws/WGi28NY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FV+X4iVs; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706106972; x=1737642972;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iNm422k1ablrvaj0e0ixhEQlsfXEso5XSn9T45n+gsc=;
  b=FV+X4iVsWuvb2U8gtoJLJB+WZKeM4zxp11q+6fc/g64A8Cn4OV5y2D2p
   mP92+nqw4bpgFRfnZ+iw6353O2Ztn/uVgo5FO4TI5HjJdooEw5QqHUZLQ
   RQT03kN5v5cl9cg5e8HBsk8qdwqIoyRpAEVXaxy81wuFP3icKcoFkFCav
   VmVwz4Jj0Lm4G5VGoSgB114hJivS1Ysv49i5EvUxrIWKs6icEdmEAf4ll
   TUOWP8zg+6NM86plnfH90ehK8uyfH8SeiZEwMa2jjFbMwJa2ysP3BLu5M
   UDo2uj0YJMYZhQXR1X2b84YId8h94Ar73xgoNrruBlbk8I7qcWjS8+ob8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="8619819"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="8619819"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2024 06:36:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856711835"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="856711835"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Jan 2024 06:36:09 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 06:36:09 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 06:36:09 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 06:36:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+iD1Y6wQnXjQLoocVDVNpbvB9umdK9/2QzBC8dX2/V0WVR5SEmHzB4mfiLpYQd39OyBcOIAsZSAISA7a7vthAGqLIT4xtC1zQ4fNm9FksqvrYwecrAv44mWjkUh9nZPDDoAwKBWhzPkBZF0RiCTiTZc1eBmSLePaumSvbUL9E8mRoYNSEKeJ3MmOKIinDWvbP0r76tP8cw7WInJ1BfhovBAuHbAqy7ceM3RNCni+aKV0IV9U7gWACygubmV/7e+KqAcoaVKCO95np38FpxdjwMm018kr9zi1LpEVZAQ9CnTApu9zh7xysKra2KKmg6OI/NINrNtMeoJRY8Mr03oQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNm422k1ablrvaj0e0ixhEQlsfXEso5XSn9T45n+gsc=;
 b=TOXeuaC+bb6eTQ4O22tj6LmgDTYT6Ft7WJIg4w/OW4Lycuh8oBbxHDPq/jn7Qdr40J08Lux7hZnPoaf8bPGEZAiLhNKqVOEJOdu/Zi9jy4oQ+t2NntN5OTR1w1Dk5rq3CbvKT0uNMzj55RRSpNhtbPtBIwk6lma+y0CNYqXsLL2Xo0YzP+siMb4MPZGDXqsvHrDruSpS1ZCOUH9LPegaqQVYcCJHxvju3fM0f3D+jvQMp6YMV4viiehrSsgyHZoGi72rYdSp55GgLnN5erQenfugNwlaXrUWNQyQNPD/gUN9tn9exd3wqcPDZ7fdlIv48pprUIpgLgMAWr8hbjnBTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22)
 by IA1PR11MB6289.namprd11.prod.outlook.com (2603:10b6:208:3e7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Wed, 24 Jan
 2024 14:36:07 +0000
Received: from DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::43f3:ea84:dd5f:d8d9]) by DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::43f3:ea84:dd5f:d8d9%4]) with mapi id 15.20.7202.034; Wed, 24 Jan 2024
 14:36:06 +0000
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Tomasz Figa
	<tfiga@chromium.org>
CC: Sergey Senozhatsky <senozhatsky@chromium.org>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Yeh, Andy"
	<andy.yeh@intel.com>, "Zhang, Qingwu" <qingwu.zhang@intel.com>
Subject: RE: [PATCH v5] media: ov08x40: Reduce start streaming time
Thread-Topic: [PATCH v5] media: ov08x40: Reduce start streaming time
Thread-Index: AQHaTnYHqJE40Fa6v0S37yoBpygnvbDojiyAgAAClICAAD4cgIAAOKeg
Date: Wed, 24 Jan 2024 14:36:06 +0000
Message-ID: <DS0PR11MB7459C34D6F6C0FA852376810CC7B2@DS0PR11MB7459.namprd11.prod.outlook.com>
References: <20240124033154.834344-1-jason.z.chen@intel.com>
 <20240124071837.GA3976836@google.com>
 <CAAFQd5BjBgTWNW4M5NPseLxm0aFzjhrF-q=jLth2eXM+5RM09g@mail.gmail.com>
 <ZbDwEVkkaINibMoT@kekkonen.localdomain>
In-Reply-To: <ZbDwEVkkaINibMoT@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7459:EE_|IA1PR11MB6289:EE_
x-ms-office365-filtering-correlation-id: 4b36428a-f3d6-40a5-5679-08dc1ce9ccd9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xRrDYjjpjIgN+HQUEbwREN4SiUGXM3U5Xhip7W7XSwfi594o9NvPuCXDy9/43HkBMqFC0M9BNVuAkzm0ypQJqTrrxAUvdNDLbsFc0dlzxq8xGBq9AfaJXmai6f9V0qtRZhmkIO6ctVEiEhSeqAGRGrPDK74eP3sB3u4b3ifFHo2AUm/SENV1djRaua+DCfKlR1XCKtRlxuqkQfyVqCx3LhAA6WOGyOClznnYUUzz0aVlAO8vztm4R4Ue10sgwZkcyqR9c+REoPgPYx6uCqjh0DXj5bwXtlBRiyTY+sHzvp0U7SI7LpJveCLptxu5SeiQgVc0ictJUXIOC6+IjGGVVqHcmdd0tZUZWo0HZkh2DTrKwxydszsAcOutVUc3H1vhKaB0VeIeH07GT9P183cs4rIKlarYOCGyWkH3Eq9A41Eow/TPTsXcqR2jftXb32iO00l3fPPCrCCyEqgEsBeRbHl1qFzHq1EDZ3SyUlRlOQQ0CbrKKJZC6ukyyZX8pneLqIyWDj5Xt1RAB7JPSQ1m9HNjR5VOFy3+SZrYD8MKypnHcIRfHbafl0qFI86PpM0p4ug16cZ1BAwd4guMM687hTFfy5T7u3t5xyoF6OWYp9cWsgkTUalRItULahgvok64
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7459.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(396003)(346002)(39860400002)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(2906002)(5660300002)(38100700002)(33656002)(82960400001)(86362001)(478600001)(38070700009)(53546011)(83380400001)(41300700001)(6506007)(7696005)(316002)(26005)(9686003)(122000001)(71200400001)(66446008)(66476007)(52536014)(66946007)(4326008)(54906003)(66556008)(64756008)(8676002)(8936002)(76116006)(55016003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VEZXdUttbzNCazJVaTEvSHFqMUdVNU92NlpuNVBpNW80RG0vQWh3VFQxVXV5?=
 =?utf-8?B?MFZiZjA3TUFGNEowVXV6TVJ1MW80cE1LZDJYb0tmUUZramc3dGJEL3Fkd1Iz?=
 =?utf-8?B?QkJGR25QcjBlRi9yTk53VDVEbkxLWXZUVkFlVGU5QzM2KzhoS21RaTRCb3NE?=
 =?utf-8?B?dmRCQi9NMHI1Z2VrYmgvQlJwbjhWcXlQb3hHQVBISzdSdU5KeXRtTUhjSjV1?=
 =?utf-8?B?Z3VPRDVRUzBEVjhxd2NPb1RpdnZIZG1FMExTSVNEMS82TGt2MHdDSm5HclNJ?=
 =?utf-8?B?TW5CdEpES0V3cHJyYWlhTVBYR2pLVDN2NzNiMnk4TEdKMkJ3SElFcy9YdHhE?=
 =?utf-8?B?UThrT2N1amtlcTJpV25RdW9DY2NtWnZSSTBWckh0RE5UdG1Kd3Z1NVR5V3Bp?=
 =?utf-8?B?Rk0wWFp3VjV6Q3B2YXlZcDk4d2o3MGZPaW45bGRkL2JXUXpTS1dWR3hQNzJx?=
 =?utf-8?B?VHg0TUg1bU1xRjVCa1oyKzM3KytZd3J3UWZDZ1NIUjNxTUFpbnZnRGNTWjZI?=
 =?utf-8?B?UnNIb1hVTGhqT1dtYkdoejVxc2x3UzNPODlGNXA2WXA2eFo4L05Lb3l4T2M5?=
 =?utf-8?B?RGZLYkR0L0NsUTlLSVR3OHJ2dklhbFhJUnZ0c2w3MCtaMWRSWVd0LzBZUUZD?=
 =?utf-8?B?SCtLSzZwRXFHeERsbk9mekdBS0hTSVBtV3VtSE5mQ2JSOGJVenEwcElaTzRO?=
 =?utf-8?B?MFhJeHRVWGorN285eXBUajVDZmg0dmVNempEeGVCY0RaSXoxeEIxRjgrbFpM?=
 =?utf-8?B?aUwyNDYyd0kwWUcyVlBRWlZTQldiVitWZUtraGJGSllzYk11ZzZxZXlVN2tO?=
 =?utf-8?B?R3kxcDdGRFVCZU1uYUVjTkx1bzU5T28zMEdIZUR4YzdUNnRUY1p2d2ZYcmxM?=
 =?utf-8?B?d0NLMnRzTkZOWWFRMjlYUElDZmFlUzRQWWhFVnNFcE9KR2J3bXQyakhTSDdy?=
 =?utf-8?B?WmsyekJRK2ZLTERkL0xUOUNEd043UWxJbkMrcTkxYmVwcE1taE45dU5RdDNm?=
 =?utf-8?B?TXVRMElPbE5maUFOZ2pvUDRpQ0NXbGlyejQ5OVFZclJzeDJ4T0hoK1RIOGJv?=
 =?utf-8?B?YUdkOXhZakZEVHFVUUNrRWtzcUFycUgyQnB5UHd3VXNQYlAwL3drajU3R3hX?=
 =?utf-8?B?RW42VzFSMU52NzlZOUJuTHpBTWk1bTlDTU1hVWI4cXhueTBjb2lDc2c5RXdR?=
 =?utf-8?B?Y3BKT1ZFSGtRazhEVE53dWwrZStaR2x1Zyt0MUZQa1dWamF4TTZ4aks5elBk?=
 =?utf-8?B?VnVzOFExRzV4UEtDRU40QUJBalZPQUw4cDNHaHN4ZzE4bjN2NmQ5N3lBL0dQ?=
 =?utf-8?B?SUJPU004azRTKzBIZU1FazdUOStsMFhPMTNqazVrU25zZENHWmFzK2g4WlZ3?=
 =?utf-8?B?T09JMmdSaVI1MW9NTThYd3daYjYwQjBnOTd1TTcvc1FIaWRteVFpekpKbTZX?=
 =?utf-8?B?aUlyY3gzZ0xNT3Rka2dGcG84cUpXOW1IVktGQmwydHFCUGd6U1JmRFhMV25M?=
 =?utf-8?B?WTkvUGtqRXJEaU1pd08yTVUyem9Ddko4Uko1VEpvaGxvbXlQZ2xuWitkbDFC?=
 =?utf-8?B?QTRvMUV1bFZLM1ZOOWlmQWx5aW5jN2haZytFRkdpZ1NQeUp6amdwWDh0SVI4?=
 =?utf-8?B?NFN2YTYxL1V2VnJhYVhFSlNQTGprVUxNejJlVkNKTkdzaU9rL0dOUmZ5QzB3?=
 =?utf-8?B?QnZzVlJVOVZKelZ6UE11T29ObTFtcjlnU21Yai9UTENXT2JFMVRvcDEwdVQz?=
 =?utf-8?B?UTB3N0xvdXVlaXo2TVVRVnVaYlJScmRKQXJhYUtoam10bUk4UmxXTlNHUVRB?=
 =?utf-8?B?RUdMS2t1czI3TFJoV25pSjJjNFJFVWFIeVAzd1JicTVGb2pFS2JCNld4R3l1?=
 =?utf-8?B?eExIZmtTVVM0bnFoQXlHdDc2SkFENis1eGhvOWlKT0VrZk9Pb2UwZ1pyb2hv?=
 =?utf-8?B?S0JCblBhaGF0ZkNiWFV1ZGF6d1Nyb3dSTFB3NmI2U0tDYmxod3RzbE9yQWE4?=
 =?utf-8?B?cW5oTCtxd1FienIyT1JiQ3NNS0gyd2I2OWxrQjN1N2pPSllMK0pEMFVTblRj?=
 =?utf-8?B?YUlhWXZ1aVc4bVRIUThSQUZYaU1UaTgrMndlbllZNm5iNXhrdUNaUXdiRDd3?=
 =?utf-8?Q?GYSlWWR98/KXkD1qPGJ+d4d40?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7459.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b36428a-f3d6-40a5-5679-08dc1ce9ccd9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 14:36:06.9325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rfyQOn3T3vtSRw0rP/BPX0L3dgWYbs5A/eQuTNuiHfKgFuPn+HCbxomYlXzaCjLx50vVs1hJSNdoynomjfj7zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6289
X-OriginatorOrg: intel.com

DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTYWthcmkgQWlsdXMgPHNha2Fy
aS5haWx1c0BsaW51eC5pbnRlbC5jb20+IA0KU2VudDogV2VkbmVzZGF5LCBKYW51YXJ5IDI0LCAy
MDI0IDc6MTAgUE0NClRvOiBUb21hc3ogRmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPg0KQ2M6IFNl
cmdleSBTZW5vemhhdHNreSA8c2Vub3poYXRza3lAY2hyb21pdW0ub3JnPjsgQ2hlbiwgSmFzb24g
WiA8amFzb24uei5jaGVuQGludGVsLmNvbT47IGJpbmdidS5jYW9AbGludXguaW50ZWwuY29tOyBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IFllaCwgQW5keSA8YW5keS55ZWhAaW50ZWwuY29t
PjsgWmhhbmcsIFFpbmd3dSA8cWluZ3d1LnpoYW5nQGludGVsLmNvbT4NClN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjVdIG1lZGlhOiBvdjA4eDQwOiBSZWR1Y2Ugc3RhcnQgc3RyZWFtaW5nIHRpbWUNCg0K
T24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgMDQ6Mjc6NTFQTSArMDkwMCwgVG9tYXN6IEZpZ2Egd3Jv
dGU6DQo+IE9uIFdlZCwgSmFuIDI0LCAyMDI0IGF0IDQ6MTjigK9QTSBTZXJnZXkgU2Vub3poYXRz
a3kgDQo+IDxzZW5vemhhdHNreUBjaHJvbWl1bS5vcmc+IHdyb3RlOg0KPiA+DQo+ID4gT24gKDI0
LzAxLzI0IDExOjMxKSwgQ2hlbiwgSmFzb24gWiB3cm90ZToNCj4gPiBbLi5dDQo+ID4gPiAgLyog
V3JpdGUgcmVnaXN0ZXJzIHVwIHRvIDQgYXQgYSB0aW1lICovICBzdGF0aWMgaW50IA0KPiA+ID4g
b3YwOHg0MF93cml0ZV9yZWcoc3RydWN0IG92MDh4NDAgKm92MDh4LA0KPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdTE2IHJlZywgdTMyIGxlbiwgdTMyIF9fdmFsKSBAQCAtMjkzNiw2
IA0KPiA+ID4gKzE4MjcsMTkgQEAgc3RhdGljIGludCBvdjA4eDQwX3N0YXJ0X3N0cmVhbWluZyhz
dHJ1Y3Qgb3YwOHg0MCAqb3YwOHgpDQo+ID4gPiAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+
ID4gPiAgICAgICB9DQo+ID4gPg0KPiA+ID4gKyAgICAgLyogVXNlIGkyYyBidXJzdCB0byB3cml0
ZSByZWdpc3RlciBvbiBmdWxsIHNpemUgcmVnaXN0ZXJzICovDQo+ID4gPiArICAgICBpZiAob3Yw
OHgtPmN1cl9tb2RlLT5leHBvc3VyZV9zaGlmdCA9PSAxKSB7DQo+ID4gPiArICAgICAgICAgICAg
IHJldCA9IG92MDh4NDBfYnVyc3RfZmlsbF9yZWdzKG92MDh4LCBPVjA4WDQwX1JFR19YVEFMS19G
SVJTVF9BLA0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBPVjA4WDQwX1JFR19YVEFMS19MQVNUX0EsIDB4NzUpOw0KPiA+ID4gKyAgICAgICAgICAgICBy
ZXQgPSBvdjA4eDQwX2J1cnN0X2ZpbGxfcmVncyhvdjA4eCwgT1YwOFg0MF9SRUdfWFRBTEtfRklS
U1RfQiwNCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
DQo+ID4gPiArIE9WMDhYNDBfUkVHX1hUQUxLX0xBU1RfQiwgMHg3NSk7DQo+ID4NCj4gPiBJZiB3
ZSBoYXZlIHRvIGJlIHBlZGFudGljIHRoZW4gc2Vjb25kIG92MDh4NDBfYnVyc3RfZmlsbF9yZWdz
KCkgDQo+ID4gb3ZlcndyaXRlcyB3aGF0ZXZlciBmaXJzdCBvdjA4eDQwX2J1cnN0X2ZpbGxfcmVn
cygpIHJldHVybnMuDQo+ID4NCj4gPiBCdXQgaXQncyB1bmxpa2VseSB0byBiZSBhIHJlYWwgcHJv
YmxlbS4NCj4gDQo+IEhtbSwgZ29vZCBwb2ludC4gSSBndWVzcyBpbiB0aGVvcnkgd2UgY291bGQg
aGF2ZSBhIHNpdHVhdGlvbiB3aGVuIHRoZSANCj4gZmlyc3Qgd3JpdGUgZmFpbHMgYW5kIHRoZSBz
ZWNvbmQgc3VjY2VlZHMgYW5kIG5vIGVycm9yIGlzIHJldHVybmVkIA0KPiB1bHRpbWF0ZWx5Li4u
IEkgZ3Vlc3MgSSdsbCBsZWF2ZSB0aGUgZmluYWwgY2FsbCBvbiB0aGlzIG9uZSB0byBTYWthcmks
IA0KPiBhcyB0aGUgbWFpbnRhaW5lci4gOikNCg0KPkl0J3MgYSBidWcsIGlzbid0IGl0Pw0KDQpZ
ZWFoLCB0aGFua3MgZm9yIHBvaW50aW5nIHRoYXQgb3V0LCBTZXJnZXkuDQpMZXQgbWUgcHJvdmlk
ZSBhbiB1cGRhdGUuDQoNCi0tDQpTYWthcmkgQWlsdXMNCg==

