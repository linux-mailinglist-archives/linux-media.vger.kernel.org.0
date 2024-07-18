Return-Path: <linux-media+bounces-15126-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5316F9371E2
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 03:10:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0DF9928237A
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 01:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9391FA5;
	Fri, 19 Jul 2024 01:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b="bjJ5WBga"
X-Original-To: linux-media@vger.kernel.org
Received: from mo-csw-fb.securemx.jp (mo-csw-fb1800.securemx.jp [210.130.202.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232D228F1;
	Fri, 19 Jul 2024 01:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.159
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721351421; cv=fail; b=b+/2g+d8i6rrl/r5g/Rayn0KMDcWwBIj9wbNotS7gY2hhQKhWc2tcxR0VnrtqhWxLTUSOySowb6HOeyK4UBKXUV/j7wQNc01FbV3V/BoRGITkMxq6P1iBbzbgNEJTTT7j/I8HWaiLb2lHgE8BnSrePhvgvR1sQ3L96k7fk8vmIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721351421; c=relaxed/simple;
	bh=lBb3Sw1G+9TOk9LdfVjWE0W8HmLIQAhGyZAxTgyc4wo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C/if68QO1QKq1A6dC6ISFiiPNQgphsJ4nqUyPKfz+/U4+MYYXMke+HgZY8t7sWPSQQbXEULlhpIYz4nCFxo5K9EHtBiVgSuqMcNNq1X9GGugpbktheq4/7tENskmM/GaETM7Mo9ZoSZy7G3g7QOmsCSs2Iy1QeJeNSfCKNISf2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp; spf=pass smtp.mailfrom=toshiba.co.jp; dkim=pass (2048-bit key) header.d=toshiba.co.jp header.i=yuji2.ishikawa@toshiba.co.jp header.b=bjJ5WBga; arc=fail smtp.client-ip=210.130.202.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=toshiba.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toshiba.co.jp
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1800) id 46INqU791127458; Fri, 19 Jul 2024 08:52:30 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=toshiba.co.jp;h=From:To:CC
	:Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji2.ishikawa@toshiba.co.jp;s=
	key2.smx;t=1721346706;x=1722556306;bh=lBb3Sw1G+9TOk9LdfVjWE0W8HmLIQAhGyZAxTgy
	c4wo=;b=bjJ5WBgaqOS1xta2WYfQrAkZIU0mvCsT/RLcZbptDY5FGIH+2XTfigl2aWKvhR/IdUCfR
	2yVohQwe+XVfjpIvAl9CXxZsF7WX+rJlhsmz/Hz/2xlhTRki6gDpJRyp0ICJHOZMqd/paXxti1KUK
	5iRNT5/1+PcXIhiYRohyF9B+JD8CwqnfKpjFm/pHCS5is4hS0L2Tv6aFeZMAN3eQmxw3cSFyRqcOG
	9O4pjQ61b1nudyrS5CSaLah0k7akLFeNr7M0EBMm1OYtnDt2gKIfbAvsgXlE8FUJjw+Q1tdT3K+K6
	nGVcKpe62DOQq5MR0PLF6HKDiiLrp25uqWZbr3Y6Qw==;
Received: by mo-csw.securemx.jp (mx-mo-csw1801) id 46INpida2044626; Fri, 19 Jul 2024 08:51:44 +0900
X-Iguazu-Qid: 2yAbQ60VQlo4ml3GC1
X-Iguazu-QSIG: v=2; s=0; t=1721346704; q=2yAbQ60VQlo4ml3GC1; m=e7G4s+qc6Buc1LvEpq7xeBIkgO4kJbyMRi9DdsNgnas=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	by relay.securemx.jp (mx-mr1801) id 46INpgZl384296
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Jul 2024 08:51:42 +0900
X-SA-MID: 26982227
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdjeiXNaSP5XZA3w+v8N8VR875sNyIAZwSkGEznDuCq8isjQo24Wzmt1aUjOrLx99/ogPhu2ZLVBzV3rx/0pdXU0Z8hP3IK1L8eX3CIRipf9RN1XHGP2hr25P0hMcGpNJysfvzVZTi2+9IAYLVUms9w9Ojs+0M1gHcdXL69TR9FCck8t7kfYZhPctZbOxbw9rJfSDh7O0bchcDHM19Kdg1gTI/7Sw9g9ZVGrvFMz39cOU9sl6K/Vl0TngnGAYKjBPwwmIhfav6R3+6DKj4pOeBzQdIVtAeB01j7J1AR13r5EtXOFiNF6Kss6FMvp3mQiDIpZtH+km/fElNBPlkQjLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBb3Sw1G+9TOk9LdfVjWE0W8HmLIQAhGyZAxTgyc4wo=;
 b=QXZ1DIQIZogBSPXhdI1JUYN2oXgXOWKk9VxHtkW1YEFG0M/dv0+LdFdNsXnIjltifN4kb2YBcHxo2VfqStX8m5mJAWwE98d/VQeKrsf5kf2VVNvhwVqtRUVnhjWmAzFphlvdkGhCvsaWsT4JkWfKAGLO3uXEvfJqiNksQdjH8rXpONeQkNaipklSgOssejtdN8/oHrhfWh3BIP3m3pOCbiDZ2ngpEdC5wgKc9WPE6aDTYBDVQGvZxssvKGRqpicpIExbxeupjuUqLRueVwotcLRO7fsQuJ3Q4G0pFCB+25ciQ42j7FYq5CiAZxl+x65fMBoTbmABO98A4ts7UZUk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toshiba.co.jp; dmarc=pass action=none
 header.from=toshiba.co.jp; dkim=pass header.d=toshiba.co.jp; arc=none
From: <yuji2.ishikawa@toshiba.co.jp>
To: <Markus.Elfring@web.de>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <conor+dt@kernel.org>, <hverkuil@xs4all.nl>, <krzk+dt@kernel.org>,
        <laurent.pinchart@ideasonboard.com>, <broonie@kernel.org>,
        <mchehab@kernel.org>, <nobuhiro1.iwamatsu@toshiba.co.jp>,
        <robh@kernel.org>, <sakari.ailus@linux.intel.com>
CC: <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v11 3/6] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Thread-Topic: [PATCH v11 3/6] media: platform: visconti: Add Toshiba Visconti
 Video Input Interface driver
Thread-Index: AQHa0ZRGi0Xr/BFy4UaJRih1sgjTrLHuBViAgA8wZcA=
Date: Thu, 18 Jul 2024 23:46:36 +0000
X-TSB-HOP2: ON
Message-ID: 
 <OSZPR01MB94276B6A6E1F84D894D088D492AC2@OSZPR01MB9427.jpnprd01.prod.outlook.com>
References: <20240709000848.1108788-4-yuji2.ishikawa@toshiba.co.jp>
 <582f0e6e-7f8b-41db-b08e-5783943dddde@web.de>
In-Reply-To: <582f0e6e-7f8b-41db-b08e-5783943dddde@web.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toshiba.co.jp;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB9427:EE_|OSZPR01MB6766:EE_
x-ms-office365-filtering-correlation-id: dafb2ba9-d5a0-4226-aa49-08dca783dc78
x-ld-processed: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f,ExtAddr,ExtFwd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?d3J0Zk5PMURLMjBaQy9OZjhEM2diYlJTR201SVlLUzhmWUMxR0NHS0hhVXY4?=
 =?utf-8?B?djJseE1icFZCaWROaHMxalFhbE5pbHRXNmJoVHY5WWxMSEpHL3EvZ3JFbDVi?=
 =?utf-8?B?WkRpd2RDRmpSRnkwMXNENmVnZXVZU21FcVEwUldMcGZ6dktSNmVpOUY0cjBO?=
 =?utf-8?B?K1JKejBVenIvc3VKd0pMQnJrcHdOVXE0elo1YW5xSGhJZ0lvOTlZbTVRVUw5?=
 =?utf-8?B?M1l2TVRZNDU5SmVnNFlaNlFvMGxBWUFpQjFCZkM0Y0c2aUVlUUFuRHVPQUF0?=
 =?utf-8?B?TDNrRUxvNmpKR0RhbVBrbnhNd0IrZ3VnKzZEQVkwMUg2YXlEVk44Z0VqZ0hN?=
 =?utf-8?B?c2RjSzUranpLaWdYNjZsaDFDU0FPb1pNaXhjcVBVanhScUlvNFRCQUVaM2M3?=
 =?utf-8?B?OVU2SENDRGxKZmYzQ3FLY2FwSFVVWDNualZQRkd4Lzk2L1hOSVlJQksxTVhr?=
 =?utf-8?B?WUp5NXVKeG9VcjdkVzhGN2JqcmxnUkdBMVNENWJLYWg1d3kvQ0I0Z3JSM2Qw?=
 =?utf-8?B?dW1hWXB5WCtWY2lSRHB6eWxTZjBnMXJqbnVNT2xyY1RsejNMUlk2NkNhTVJt?=
 =?utf-8?B?U1RKSFg4cm5tWFc1NGJGWHkwM2lsUWc3a0M3SkNnVnl6L0gzUERLT3BxRjF6?=
 =?utf-8?B?MmtlaEtibHFCSjdGWU03YU1MWmhpd1BvSytNWUlyRFd4cGtrZ2pzMnNYTDJF?=
 =?utf-8?B?VjdUN1hMQlZoRGJ6UnI0U2txM2l3VGpLVDV0cWFlUzRqLzJybnU3dG9WNmhB?=
 =?utf-8?B?TXUrczNRdGNjT1kzQXJLaUdsc1gyV2ZxUGJFRCtVelV2TFZJZ3hTWVdiVjJq?=
 =?utf-8?B?M0ZLMVBaMUZBOG1lRmFnWXVaaW9LbFZQdmFwLzF0Z0F4VEhVNEdKRjZoVzN0?=
 =?utf-8?B?QkFCY1RsK2UxOWhZRGRsVUxOTDhjT2NlOFJuTFg2K1J1T3paK2RjSVVJSEhK?=
 =?utf-8?B?b2h5bjU5TFBoL0hRRlJQb3VYT0tuMFBERzZOVnpBcDJYcGFISGd2UG1GVUdX?=
 =?utf-8?B?NE5JV2d2TmFtQ1hyYnhweEZJeFZxR2syOXRkK0xHSjRycllVeGdCL3JtY3Fy?=
 =?utf-8?B?bUhlcFhlM2VpYnA3dEVMRk45ckp3UG1oakU5Yy9STEhtdjhYR1JjV2hoRDBC?=
 =?utf-8?B?USsvNjZicmQzUnVFYUhDL1VVa0xOem96Y2VrZEsxUlYrNlRSVDVZbWpKZlFS?=
 =?utf-8?B?Nm1SUk5qQ2t0MWU2eXltOFkyR1I3NU5HMzMyWDlmdUxjYlZEMkt2T25tSC9o?=
 =?utf-8?B?ZncwRlJHeVFudG1LbG11R01nRkxqbmVsZGpQWGRmYllWT2lEeXFEWnp0dkdV?=
 =?utf-8?B?VCs2SUVJZHhLUWxpNnN1eHFEOWFxNXloR0w2andjcjROanprMzJhS1czRUhS?=
 =?utf-8?B?VU5vNEVhNmRtWmErYy9vMmpZTE1XWEI5M0YxeitXWjd5TzY1bjBGa3htL2Jz?=
 =?utf-8?B?ZmNJZFp0eE9rWDcrZHlQbGlRb2NpSCtFVHhMQnFpOHZodmcwaGpOWFNpVkNC?=
 =?utf-8?B?UVhCYzROR202Zittc0l3OEpkWnhKQUF1TlM2V0lwNklsY0pBaTc1VkFIazZT?=
 =?utf-8?B?TmdIZWczaytSTXdOc2pEUFNnUTgyeGJwRlpncGF4MnUyNWJuNVBXQXdzQW9y?=
 =?utf-8?B?aXc5dDZFbkRCQU1wMEVKREFnQm5KQ0d2TEJzMDdnVGM3dE40VTdIdHlxUHFT?=
 =?utf-8?B?VFNEYUE2dFBpZzA2ZlJSY2lEdHE0UTBrZkFUWC9SRFB2cW1mc1d4U004dkpx?=
 =?utf-8?B?Y1V0c01oMWZCcXBGTmd0eEdqcXl6NExaSUxuRitzNzNBUWVNQWhUM2M2ZHlv?=
 =?utf-8?Q?HCkWWqXyvDTT/1tl/TlDdgLh1PGrTSdqBAgI0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB9427.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?UHVvL3ZESmcwOVNXQTlMMzBGUHltM0Y0N1NsdE1TVG5PemhFODc3SXMyeUFw?=
 =?utf-8?B?WCtIbDloaFE0ZmpGWVJjTGo2NkZidHlwWkRIMlIyKzJxUmovR0U3bldRdVZ5?=
 =?utf-8?B?cjVRK3kwQ1JscTdFeUxPS0pFNW5kMlNydlpNZjlIVTZmQkw2dWc1QVYxZzZs?=
 =?utf-8?B?UEhtRXl4R2VFc3VDQzY1eXZjbWo4R0liSTl1L3h5cnBvK0hMaWRva2pDckU5?=
 =?utf-8?B?MTAySEhTbFZuMjlRSGx0cktidFFqVXg4bWN2alhOaHpIZks0dXRZRS8vNjZI?=
 =?utf-8?B?MFkzMmduVnllY0pxNERodkRYTGQydE1DQVRCZEk3eDMyd3Z2MWlmdit0L0Yx?=
 =?utf-8?B?Yjcwbk5OYXhpczNEQ1ZuYWJnaEtzeHRlcVRqeUIwT1NxNnpKMFlmMmF5YmpE?=
 =?utf-8?B?dmNYR2Voa1duS3M2RlZibWVVR0VLd2JtdjBqZUU0TGwrbGs0VzNFV0VoRElH?=
 =?utf-8?B?N3g0MHVlKzBQNGtlaTExSUhRMndXZkFDWlJMU0t4WncyK2lHbkNMZzZMbmdG?=
 =?utf-8?B?d0tabmVkNnBNVi9OcFpwZENRcFJUZm1JNlpHTlgwR2dyQlIrTjhUSUxjbGFp?=
 =?utf-8?B?U2N3aHZSUUcxbWxYcm9FL1hMOWhGTkovZytuS25wbG5yMVN5VUR4R1NwcWRz?=
 =?utf-8?B?NlVLUGt2L0NMSzVVU2xtalhTa2ZXK25ub3UvT2FPRXNZQ2JVTDQwR08zblBZ?=
 =?utf-8?B?V05Nd1p3VGpDQ1lzTmRoQVZJS2JlWW53UUM1c2l4UFZOMUdwWGpvSUQ3NkRp?=
 =?utf-8?B?T2t1anJqNkwzN0ljcklIa3YreWpsYngvaXNZS0p5M01JbDdhSWRaeFFhakJD?=
 =?utf-8?B?VWU5Y1lDb2l4WlpTNEIyTU1MdHIvdDFTWkZzaTFhTCthRFBKa3V1VG1qTjh3?=
 =?utf-8?B?QnVQNEc5VTBBTlBSbWpTS0ZIR1dpem90dUdzU2tVelVCaDJFYjQvVC8zM2k2?=
 =?utf-8?B?UXZ3R0U1Ylp2YXpqczFNZWJrM0JzeWNwMGMvOWsrK2Q0UlA1OGxzcG9JWXZP?=
 =?utf-8?B?MW9YMG5WT3R5THRjS2RSNlpXdnAwVWxRUkhoaWsrRTUzYXBtSTU1T1ExanBn?=
 =?utf-8?B?Wm15ekx1WDFmVmFvck5ZUENlWWhFL0Y5MUZ4VDBTblNneisvQm5CVld5bk9D?=
 =?utf-8?B?ZWpyaTdLVEtuQ01DQ0p1L3kxVXJ2ampPMkVtQy9CNG1MZ1o0d0RlZTVvQyt0?=
 =?utf-8?B?d0FxdVBZSkI4Y0dkYndzQnlqMm5kcHpwZzJPY3dCT09sQU9nOFpMVHByYVJR?=
 =?utf-8?B?aDFsaW5tWlJTelRqUkJqcDZRdzdmWEwyZ2VsamVLMEN6Qk16aUhGRjBldU9n?=
 =?utf-8?B?Sm1wYURlRFQzVjY3RXIxYmtXbTRJeUc5Zjh4QnZXLytaaElKUUVEMlJVeW9R?=
 =?utf-8?B?K3ZpWHM5bDQvUlF5NmZZWThEWllQZEJTUWVQNHJTRFF0ZEs1d29LVXNwZzZI?=
 =?utf-8?B?bWh3SDIwSzR4UmV4cGwveS9sZHExR2RHdEhuMzlPVEd3UTUyaTA0VVc3U2Ru?=
 =?utf-8?B?QXh2NW1vaXRXSW5FZGQybWdoMTFBVjh5VU5WU2xFUTl5THJNekJ2QmErWitU?=
 =?utf-8?B?NU9FZFR1MExGUWNIQTVIWExuMndBL3lVUTlwRFRoUXFHOFNWMTd2d2Z3RzFW?=
 =?utf-8?B?QXk5QlJIQmNFRnNicDVCWWdGWWhuSytjS3dtYzFVTUcxQnZUZ3ozeHUvTEJq?=
 =?utf-8?B?ZGlLNGJQZXpEMzBnTUFZeWNyOHZGUlNqeXMvSHMvdmxyQ05VM3dvUE1YR2Ur?=
 =?utf-8?B?WktGdU1WYlNUdnI1cHRMak9SejN1SW1SQlBMRGJVOVJ2V3JPWUMyY09kMzRi?=
 =?utf-8?B?K1B5akRKL0Fnck1CYTdwYkx4OUpiRmtiMEFMZkxqcW1mM25acEhNK3RlUnFF?=
 =?utf-8?B?b3BLU0NlUHViaStCR1VTRUt2UmovZXZjYkJCSUJGZzd3Qjc4NkxrUWRSQVZ4?=
 =?utf-8?B?K0lpQmN4bnNNTG50M3NBZklyQnpUWEhHQmZZYnhLRXVoc3lzb3VwbU0yQkxJ?=
 =?utf-8?B?ZnpjaG5aelJxdEJ2NEc1ejVOZithckdISTMwcjBTU085Qjd4M0VQQ2xYbTZ4?=
 =?utf-8?B?bW1sWnJwWkl0S1FmUkthRVN2cTNycGMzbEN5STFBbVdvTWgzNGsxQ1NSNGxq?=
 =?utf-8?B?cEFSeCtoZ204eHNHY1RGbHVlbXVuV1BPOE04VCt0K2IwaDV3S3BobTh1Tmxx?=
 =?utf-8?B?YUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: toshiba.co.jp
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB9427.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dafb2ba9-d5a0-4226-aa49-08dca783dc78
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2024 23:46:36.0765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzROPO//IWKHttf4+KTx4KtLGZnb7VNGJNy+ErWxo7VMPacGveLOH/pCi7rEflposEdr2ftXSS8VyKRG+neC671GsEbOz3SnmpYpnZqAW9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6766

SGVsbG8gTWFya3VzLA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgcmV2aWV3Lg0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hcmt1cyBFbGZyaW5nIDxNYXJrdXMuRWxmcmlu
Z0B3ZWIuZGU+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgOSwgMjAyNCA0OjQ4IFBNDQo+IFRvOiBp
c2hpa2F3YSB5dWppKOefs+W3nSDmgqDlj7gg4peL77yy77yk77yj4pah77yh77yp77y077yj4peL
77yl77yh6ZaLKQ0KPiA8eXVqaTIuaXNoaWthd2FAdG9zaGliYS5jby5qcD47IGxpbnV4LW1lZGlh
QHZnZXIua2VybmVsLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWFy
bS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsgQ29ub3INCj4gRG9vbGV5IDxjb25vcitkdEBr
ZXJuZWwub3JnPjsgSGFucyBWZXJrdWlsIDxodmVya3VpbEB4czRhbGwubmw+OyBLcnp5c3p0b2YN
Cj4gS296bG93c2tpIDxrcnprK2R0QGtlcm5lbC5vcmc+OyBMYXVyZW50IFBpbmNoYXJ0DQo+IDxs
YXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBNYXJrIEJyb3duIDxicm9vbmllQGtl
cm5lbC5vcmc+Ow0KPiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz47
IGl3YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6ENCj4g5rSLIOKXi++8pO+8qe+8tO+8o+KWoe+8
pO+8qe+8tOKXi++8r++8s++8tCkgPG5vYnVoaXJvMS5pd2FtYXRzdUB0b3NoaWJhLmNvLmpwPjsg
Um9iDQo+IEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IFNha2FyaSBBaWx1cyA8c2FrYXJpLmFp
bHVzQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IExLTUwgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjExIDMvNl0gbWVkaWE6IHBsYXRmb3JtOiB2
aXNjb250aTogQWRkIFRvc2hpYmEgVmlzY29udGkNCj4gVmlkZW8gSW5wdXQgSW50ZXJmYWNlIGRy
aXZlcg0KPiANCj4g4oCmDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS90b3NoaWJh
L3Zpc2NvbnRpL3ZpaWZfY2FwdHVyZS5jDQo+ID4gQEAgLTAsMCArMSwxNDMxIEBADQo+IOKApg0K
PiA+ICtzdGF0aWMgaW50IHZpaWZfc2V0X2ltZyhzdHJ1Y3QgY2FwX2RldiAqY2FwX2Rldiwgc3Ry
dWN0IHZiMl9idWZmZXINCj4gPiArKnZiKSB7DQo+IOKApg0KPiA+ICsJaWYgKGNhcF9kZXYtPnBh
dGhpZCA9PSBDQVBUVVJFX1BBVEhfTUFJTl9QT1NUMCkgew0KPiA+ICsJCXNwaW5fbG9jaygmdmlp
Zl9kZXYtPnJlZ2J1Zl9sb2NrKTsNCj4gPiArCQlod2RfdmlpZl9pc3BfZ3VhcmRfc3RhcnQodmlp
Zl9kZXYpOw0KPiDigKYNCj4gPiArCQlod2RfdmlpZl9pc3BfZ3VhcmRfZW5kKHZpaWZfZGV2KTsN
Cj4gPiArCQlzcGluX3VubG9jaygmdmlpZl9kZXYtPnJlZ2J1Zl9sb2NrKTsNCj4g4oCmDQo+IA0K
PiBVbmRlciB3aGljaCBjaXJjdW1zdGFuY2VzIHdvdWxkIHlvdSBiZWNvbWUgaW50ZXJlc3RlZCB0
byBhcHBseSBhIHN0YXRlbWVudA0KPiBsaWtlIOKAnGd1YXJkKHNwaW5sb2NrKSgmdmlpZl9kZXYt
PnJlZ2J1Zl9sb2NrKTvigJ0/DQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjEwLXJjNy9zb3VyY2UvaW5jbHVkZS9saW51eC9zcGlubG9jay5oI0w1DQo+IDYxDQoNClRoYW5r
IHlvdSBmb3IgdGhlIGludGVyZXN0aW5nIGFkdmljZSBlbmNvdXJhZ2luZyBtZSB0byB1c2UgZ3Vh
cmQgbWFjcm9zLg0KDQpJIGludmVzdGlnYXRlZCB0aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIERF
RklORV9MT0NLX0dVQVJEXzEgbWFjcm8gYW5kIGd1YXJkIG1hY3JvLg0KQWxzbywgSSBjaGVja2Vk
IGEgd2ViIGFydGljbGUgb2YgX19jbGVhbnVwX18gYXR0cmlidXRlIGFuZCBpdHMgYXBwbGljYXRp
b25zIFsqMV0uDQpOb3cgSSB1bmRlcnN0YW5kIHRoYXQgdGhlIHVzZSBvZiBndWFyZCBtYWNyb3Mg
Y2FuIHByb3ZpZGUgdGhlIHNhbWUgZnVuY3Rpb25hbGl0eQ0KYXMgYSBjb21iaW5hdGlvbiBvZiBz
cGluX2xvY2soKSBhbmQgc3Bpbl91bmxvY2sgY29uY2lzZWx5Lg0KDQpJJ2xsIHRyeSB1c2UgZ3Vh
cmQgbWFjcm9zIGZvciB0aGUgbmV4dCBwYXRjaC4NCg0KKjE6IGh0dHBzOi8vamF2aWVyY2FycmFz
Y29jcnV6LmdpdGh1Yi5pby9rZXJuZWwtYXV0by1jbGVhbnVwLTENCg0KPiANCj4gUmVnYXJkcywN
Cj4gTWFya3VzDQoNClJlZ2FyZHMsDQpZdWppDQo=


