Return-Path: <linux-media+bounces-8980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E871589EF02
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 11:37:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71F6C1F21D2F
	for <lists+linux-media@lfdr.de>; Wed, 10 Apr 2024 09:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 351461553BF;
	Wed, 10 Apr 2024 09:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bertin.group header.i=@bertin.group header.b="BS9KLTe7"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020003.outbound.protection.outlook.com [52.101.167.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0F8F4E
	for <linux-media@vger.kernel.org>; Wed, 10 Apr 2024 09:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712741813; cv=fail; b=eKNd+OdonM/2W7PoWQOgaj+2FHVevu/7yXEPfzb/ObklKYj50pQHlxKypHQzm1a/OA7naLJKXcr/Idg4PmaJeQYsXUeSiUsFARrheSFtOgisgNKd27H+gbj4WUwQUuqL8c8p5jKL8cx38XZVwMOjR28FaGaG1CJ6f5RDpy0h91M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712741813; c=relaxed/simple;
	bh=JmZY39MmVzpFJmbXgBjLEwAaVLf4XbhCeLJLZtDWJVM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=q1xgbUC7wZV2tfoSS6+Vg3LIt2fUyjVPDsch48ULqfSSLranOFyUIuqOI4xdD1wd83mAKU99csmy8AqQtDXolJtlmBUqWg5WBpJyJzPmn5X4OQ5JGy+4VOxFilh/KC75KxovnVBN41s8z8AUVOTdglykLIXckFh7GKqqMJUYdkM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bertin.group; spf=pass smtp.mailfrom=bertin.group; dkim=pass (2048-bit key) header.d=bertin.group header.i=@bertin.group header.b=BS9KLTe7; arc=fail smtp.client-ip=52.101.167.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bertin.group
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bertin.group
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUIgG1KJfNhkxJUlAdDtoAE/9T+RSBW3ikjVGi26COiwZb+K201h3qdGxbj4OL2Zq7A6TIOJMViI8gZ83aItNIpuyjJuI3u8NoFkN9U2GBklbheRK4khBbfuF1MwVjeCMpJkCiDo4j3raYOTMeXV0H+07ubROMNrGoBQgHxKz2vPDKWANB3Xmfx0UjMIgW1eJ+MouqN62JwJG++NXhBediG3xoaIIinHj60IkuwDnwIQTDcDxFlXJnfoh6atxuNkLU3JCpJTr1PhLWKsf86jEf1x+5VLhwUTKPgivDLp/v2oUjRq22SuNpa/e54bJvdjy1sinPQ1anGD1krhtguiuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmZY39MmVzpFJmbXgBjLEwAaVLf4XbhCeLJLZtDWJVM=;
 b=UUkNWWRkHQub6KGjDHcQ5hLsyqYMUP7qZgLJNVFlRFIiv5ne/TwcR8EusJY2md2RULLvRNbmOh+D9BhyZQwm8xIG/i7bMafNLJi2X/I6gN3Q9X1ONTSvp0drkewfItDLBnNLBr/GedjlEv9ysk8II9uMmrzgoDw87rFvXBYCmCMrv8vQ68tw1ApzEmtA7vhfbrc2jMqX1CBtOlgAj2sjKvkG5Rms1bZ4uabi0YwRemyMcm/nbLML3WqqmnTZVAGJcE9Ovj766SzpRWxlSnbvkr2wroSZtMSDl/KieaXHOzQyuuq8LxVJrWzhBlIPza+BP/X5ix/lMPiHxAMoNL0ksA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bertin.group; dmarc=pass action=none header.from=bertin.group;
 dkim=pass header.d=bertin.group; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bertin.group;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmZY39MmVzpFJmbXgBjLEwAaVLf4XbhCeLJLZtDWJVM=;
 b=BS9KLTe7sP/i/Q8wHFEM0FGlbLaOB8y3yeBc5394DH5/SQfPHoCpZTsqu+UlNkyl+arEx6+jCw9wSqGxA1nUfAqjuOblnXErkHKHJ9n9XmKTukm0fF6W/1Finrawjpib7v1Toz7C6UKTCAkJBWhxgftlaKBJWxf1qTjiSm40Cjk4zLgVd460vXAH0HAnlFik05oWeAlOgrw6TSCivmmbFgd+oPI60gZhKq+ooW1EIs5/rVN5/teguH9RlfBFePxBY42wO9pYvTuEvB3MI2P/mpBMJCSmZg0cKIGmuCCwtrwyweENq8ZaNB+0EtxQhjLXDN8a6rEsDv/9YkIKEqY/6Q==
Received: from MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1b::10)
 by PATP264MB4833.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:429::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 10 Apr
 2024 09:36:47 +0000
Received: from MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e592:5e33:1353:ade0]) by MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM
 ([fe80::e592:5e33:1353:ade0%7]) with mapi id 15.20.7409.053; Wed, 10 Apr 2024
 09:36:47 +0000
From: "BRES, Guillaume" <guillaume.bres@bertin.group>
To: Michael Tretter <m.tretter@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "ORIOT DE LA
 CHAPELLE, DAVID" <david.oriot@bertin.group>, "DUMAS, Victor"
	<victor.dumas@bertin.group>
Subject: RE: Allegro/VCU on Zynq-MP 2023+
Thread-Topic: Allegro/VCU on Zynq-MP 2023+
Thread-Index:
 AdqJx+pXEF+OqYn4QN6lJcQjUT92AAAjRjGAAACT/lAACnm9gAAkAgpgAAIfaoAABBybEA==
Date: Wed, 10 Apr 2024 09:36:46 +0000
Message-ID:
 <MRZP264MB3098A9AAA2BF1AC85B7E6992E2062@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
References:
 <MRZP264MB3098B2F903EC080C7EF37066E2072@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
 <ZhT3VVvzBCi2QkEo@pengutronix.de>
 <MRZP264MB3098098B02FB23660850D43EE2072@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
 <ZhVBgzksyirY-YGy@pengutronix.de>
 <MRZP264MB30982C0933D0AC0DDC8165B3E2062@MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM>
 <ZhZBZ7aqU5VDMHXe@pengutronix.de>
In-Reply-To: <ZhZBZ7aqU5VDMHXe@pengutronix.de>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB3098:EE_|PATP264MB4833:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 YDS6M6syiC4+aYz/WsDmRtnnxGUXHznQ2l9DmjSL2tQU/HsB6+HRD9M/jW8OxRKaLp/c5HMNshJvaIxITIjZf0AT2foCYH0BN4t4iM9tw+5nWY7++9UxzqoNTH9FIF6mwHgzqVrLc6SQ01FJ06VE2UpOSRGB716UTqFMjPbGNpu1jX4tzjAbSposErMxsX1K4bf8dXQXiEpLfRupiRU8YGRH7HgNRrwYsJLxNn4DOt46Trs9j1yUL8fMJ5URxdbUk/HUlW4kXa6L7AzG6j9eRWNjjOusK04gMeyFRL2J2JYIUezjl3e/pDpO9SadtqxWESHjt86Gf0YQ+5cc8fCTbnXINdbdAIVgh7TJsouwulrWzCptz2IZcHAI+vGRlj3Ge/Q7utEb0M9lj28gKE4H3BCRrsT7BPdM9NVfdQBgM4UW15e1tocctHWNQhxDbfsUt5T/Oyv0XxqCh+4+Aq/3gSQNP6hF8BZTvblK8ewmwGjtC0+lZ+haopC1aTPrqBTHkoVn+cqhrLt2ZwAhTNAZhcUyn5Ex7EuWIdx+6qjYWCB7+21Qd/bMfaV2r7zQBiG9yuxBmUm6vN2ssHcVQH0Fr1bsrBX86hr+P+PAssvPvvxQD/oP1PD/w3q0P4zq/bEgRqAXLIn7GB7hpyZ7ap5Zqmhb68QZCJCw5g0fE5vkxbI=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MCtsVFBIKytYbXhNTWlOQ0ZyWlRnbnZOV1YrMm1MNTFvYTA3SHRJcGVMRHl4?=
 =?utf-8?B?UkdkUmduemxHQ1JJMy93cXlLb09XQjgxSlE2Y0JJZldYM2RSM1VTTVUyY2hr?=
 =?utf-8?B?VE16YkxDdmlyVnF2dVA1aDRqdFhjSE8wdzdjTDhpUVdyZzNRNWlLa2dmUEp1?=
 =?utf-8?B?aDI5RGRCVWorOStqZ3pkaWhGMTJVZDZQM1JBN0tFRlRPRE03UFQ1UVd4VGlw?=
 =?utf-8?B?U3lvaENkSzZkZ0p5RXROZHM2akRYL3k4WmdqN1p0Q29EWXdWbUxLcXJDb2Yy?=
 =?utf-8?B?NDhDcERZeDhjS25aME9kYVRxdWpaRU1xYzVUc0p3Y0ovRWhRdTR4TDBEdXdJ?=
 =?utf-8?B?empCT0tTcGxxN1hTT0pLd09idC9iV0Y0L3R2NVNnaGUvc1RhWTgvMlRyQS9i?=
 =?utf-8?B?MmFFVmFvUnRNejZENDdxQlAxL0lXZzZRUlhZU1I4Zm1wUk9TREJvNERkcGR6?=
 =?utf-8?B?VnhBQnJZTkZOeWZOUm5RVDUyTGNWMVNiMFZ1OTk1MVRNOVUrejdsZlRvazF2?=
 =?utf-8?B?SWlVMWExQThUbktVYjE1RnVydS9PcCtVNWpVNC8wc0QxdnVYZlZoRytBWFI1?=
 =?utf-8?B?QWNYNHFGeEc0NWIvOFhUZ3lnNmpVdlpFaEJHRkNTdzVYRjRKT0R6N3pHSWdw?=
 =?utf-8?B?c3REOFhxWTVscUZFdTNwblVTVXdkNk9JSlRBZEdaTzZRbmtxL3h0TE9pRUFj?=
 =?utf-8?B?S1N1cXRGeHo0SXhFZUxvT1Z6Q1BGM3hLUVkzTDVuZEh6RHZCK2lTckxmcUlH?=
 =?utf-8?B?TDMyTlZaMlAxOHp4U01xN2VlM3NSSmY3K3MvQ2RVSWVPSGVjSUZLeWR2UFN3?=
 =?utf-8?B?Z0JBMXN4dC9idFVkWnhxWUpwdlBCQTN1aEhWTUtZWXhGdThIMHNYaTR1SlRU?=
 =?utf-8?B?dHU2MEhkcXhQMEpwSmpmV3NZSURJZVdSRjYxNFJhN3A0MW9FVE1wSlZjZUdz?=
 =?utf-8?B?Q0JrMjJKSlpja1NiZGNrY0pObXV5dSszUVRoZlg2WVFnaEtKb3ZhaVlYN1Nh?=
 =?utf-8?B?TjRjL2dhZWwyaDNsYTVuOVp2aDNpeWNNQ2lRUk9zTWo4NnF6NzgxL0E5MHQy?=
 =?utf-8?B?UlM4L3VwaU9xUjdQcU0rWVJKUmpwNnlvN29HZFRaMDJqaG5jczhMWEE1dmRB?=
 =?utf-8?B?UWNyVG9xb3JjK0xycDRxYm5zSHFHRzRBQUxMbkZRVjlGMmJ0TEVoOEdUVWFY?=
 =?utf-8?B?Vjk3cTQyQ1ZvNmpHVFZ1SUR3TEtqbjFrcFRQZHQ5UDgyNUNQT1Bha0dweWp6?=
 =?utf-8?B?TmVEeDJDZjZmQ2FTcVV4L3YyYjFPR21wS3ZyckZwbVBZcEs3dEVLWDM1ZkxG?=
 =?utf-8?B?TjZZK1lEdUZyUVkvUG02aFlXU0JIZFluYmhnRTJXVGFZVVU5YzFzYkYrOVlS?=
 =?utf-8?B?ZUJ3WXA3ZUpjL1ZGNSs4SVh5S1ZQMUh5S1djcWkzQXUxaEE3OG9NQVZac1Ix?=
 =?utf-8?B?akpXdnRqRXRUNTN3eW5lZGpCc1N0VjZzK2Vzckh2Nm51ZDM4K0ZpMzJFMmxj?=
 =?utf-8?B?Nk8xQXNaL0xsN25xNDBxK3NhcFBkeWc0MGhXdy90RzJnNzhRVmwyVmc2ZGIv?=
 =?utf-8?B?cEI4L1RZenZMVDBpeUZ3d3B2VTN1S0FKMVlFaVdzTmVXSUh6ZFgyT2lsc1FU?=
 =?utf-8?B?Q0VVeGRHMjMzdlgzZVFGSzJLRmt5Sm11Z0dwc2tMVmQ0SG51K2pBaWp1NHpz?=
 =?utf-8?B?dDNvSmxoYUluRVZlK2ZTZXN3MU8vSHpyN0JGMEF0SDFqRmhyVmhQMVFHb2pX?=
 =?utf-8?B?UFNNMnd5V0tjcHlhWWg2bkpMSmZOUXloZ2E5Yzk4TzdHcklmQkN5d2EvVFJp?=
 =?utf-8?B?WEtyeGU4Mnc5VGFKN3dpajdFcVhiNmlzRmg5MHhKak5VYmxXUStEUDNlSHlt?=
 =?utf-8?B?Yk5Cb1o0MFkvQmdpaHBBVjlXN0I5dkxMSnBXV1lJa3dBR2N3aUlrRzRZUlh3?=
 =?utf-8?B?VHp2dU9XUUFXOUJiT1lNRHNSWkl3NUVQTngyUGF1VHFmakozMnFUT2p2Wmgv?=
 =?utf-8?B?eWlqZEtTOC9DY3d6bGlCanB5ck1jOVkxUEJicXBSeE15V0Z1d1A2S2x5aUJ4?=
 =?utf-8?B?SWtVQlJSSExBcjErZGRDL2lxcEwrZDluRU9Sb3A3QTE5bWpGMyt3VHppS2VT?=
 =?utf-8?B?aWliQW9JZmc0dlhZYmNLWm1YdlBnMUtHZ2tkVklVTnFhNEd4NGxYWWcwdnE2?=
 =?utf-8?B?NGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bertin.group
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB3098.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dfdb009-19e8-46ff-1bdc-08dc5941bdb5
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Apr 2024 09:36:46.9803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1e10334f-2f1e-4a9a-88e4-9bf591d1ddb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ol4iHVgQ5F0bYMIFdSfMtT7TzZ9Bck1ChiBsPjeQffZgkWCEFJ5X36QcSolj2LdASqsQ/Mz0BcTR+bvoojdncZYkyaR9meIMCBTZVDkhuTU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB4833

TWljaGFlbCwNCg0KPiBUaGVyZWZvcmUsIHlvdSBjYW4ndCB1c2UgdGhlIFZDVSBjb250cm9sIHNv
ZnR3YXJlIG9yIGFueSBvZiB0aGUgcmVsYXRlZCBHU3RyZWFtZXIgZWxlbWVudHMsIGJ1dCB5b3Ug
c2hvdWxkIHVzZSBhIHVzZXIgc3BhY2UgdGhhdCBoYW5kbGVzIFY0TDIgbWVtMm1lbSBkZXZpY2Vz
LiBGb3IgZXhhbXBsZSwgeW91IG1heSA+IHVzZSB0aGUgdjRsMnZpZGVvZW5jIGVsZW1lbnRzICh0
aGV5IHNob3cgdXAgYXMgdjRsMmgyNjRlbmMvdjRsMmgyNjVlbmMgaW4gdGhlIHJ1bm5pbmcgc3lz
dGVtKSwgd2hpY2ggYXJlIHBhcnQgb2YgZ3N0LXBsdWdpbnMtZ29vZC4NCg0KSXQgYWxsIG1ha2Vz
IHNlbnNlLCBhbmQgd2Ugbm93IGdldCB0aGUgd2hvbGUgcGljdHVyZS5UaGlzIGlzIHZlcnkgdmVy
eSBjb29sLCB3ZSB3aWxsIGdldCByaWQgb2YgWGlsaW54J3MgZ3N0cmVhbSBmb3JrIGFuZCByZWx5
IG9uIHRoZSBvZmZpY2lhbCB2NGwyaDI2NGVuYy4NCg0KSSBjb25maXJtIHdlIGhhdmUgYSBuZXcg
dmlkZW8gZW50cnkgdGhhdCBJIGRpZCBub3Qgc3BvdCwgd2hpY2ggaXMgdGhlIEFsbGVncm8gRFZU
LiANCg0KTm93IHdlIG5lZWQgdG8gbGVhcm4gaG93IHRvIG9wZXJhdGUgdGhlIG5ldyBwbHVnZ2lu
LiBVbmZvcnR1bmF0ZWx5LCBpdCB0dXJucyBvdXQgdG8gYmUgb25lIG9mIHRoZSBmZXcgbm90IGRv
Y3VtZW50ZWQgaW4gZ3N0cmVhbWVyLi4NCg0KVGhhbmtzIHNvIG11Y2ggZm9yIHlvdXIgaGVscC4g
SSB3aWxsIGtlZXAgeW91IHVwZGF0ZWQgd2l0aCBvdXIgcmVzdWx0cy4NCldlIHdpbGwgdGhlbiBn
ZXQgbW9yZSBmYW1pbGlhciB3aXRoIGFsbGVncm8gZHZ0IGFuZCBtYXkgc3VibWl0IHBhdGNoZXMg
aW4gdGhlIGZ1dHVyZSwgaWYgc29tZSBvZiBvdXIgcmVxdWlyZW1lbnRzIGFyZSBub3QgZnVsZmls
bGVkLiANCkFueXdheXMsIHRoZXNlIGEgZ3JlYXQgc3RlcHMgdGFrZW4gdG93YXJkcyBtb3JlIHNv
ZnR3YXJlIHN0YWJpbGl0eQ0KDQotLS0tLU1lc3NhZ2UgZCdvcmlnaW5lLS0tLS0NCkRlwqA6IE1p
Y2hhZWwgVHJldHRlciA8bS50cmV0dGVyQHBlbmd1dHJvbml4LmRlPiANCkVudm95w6nCoDogbWVy
Y3JlZGkgMTAgYXZyaWwgMjAyNCAwOTozNg0Kw4DCoDogQlJFUywgR3VpbGxhdW1lIDxndWlsbGF1
bWUuYnJlc0BiZXJ0aW4uZ3JvdXA+DQpDY8KgOiBrZXJuZWxAcGVuZ3V0cm9uaXguZGU7IGxpbnV4
LW1lZGlhQHZnZXIua2VybmVsLm9yZzsgT1JJT1QgREUgTEEgQ0hBUEVMTEUsIERBVklEIDxkYXZp
ZC5vcmlvdEBiZXJ0aW4uZ3JvdXA+OyBEVU1BUywgVmljdG9yIDx2aWN0b3IuZHVtYXNAYmVydGlu
Lmdyb3VwPg0KT2JqZXTCoDogUmU6IEFsbGVncm8vVkNVIG9uIFp5bnEtTVAgMjAyMysNCg0KW1dB
Uk5JTkddIFRoaXMgbWVzc2FnZSBjb21lcyBmcm9tIGFuIGV4dGVybmFsIG9yZ2FuaXphdGlvbi4g
QmUgY2FyZWZ1bCBvZiBlbWJlZGRlZCBsaW5rcyBhbmQgYXR0YWNoZWQgZmlsZXMuDQoNCk9uIFdl
ZCwgMTAgQXByIDIwMjQgMDY6NDY6MDkgKzAwMDAsIEJSRVMsIEd1aWxsYXVtZSB3cm90ZTogWy4u
Ll0NCj4gSSBjYW4gY29uZmlybSB0aGF0IHlvdXIgZHJpdmVyIGlzIHByb2JlZCBzdWNjZXNzZnVs
bHksIGFuZCBzbyBpcyANCj4geGxueC12Y3UuICBVbmZvcnR1bmF0ZWx5IHRoZSAvZGV2L2FsbGVn
cm9JUCBlbnRyeSBwb2ludCBpcyBub3QgDQo+IGNyZWF0ZWQsIHRoZXJlZm9yZSBnc3RyZWFtZXIg
aGFzIG5vIG1lYW5zIHRvIG9wZXJhdGUgdGhpcyBwYXJ0Lg0KPg0KPiBJcyB5b3VyIGRyaXZlciBz
dXBwb3NlZCB0byBjcmVhdGUgYSAvZGV2L2FsbGVncm9JUCBlbnRyeSBwb2ludCBsaWtlIA0KPiB0
aGUgcHJldmlvdXMgb3V0LW9mLXRyZWUgc29sdXRpb24/ICBXb3VsZCB5b3UgaGF2ZSBpZGVhcyB3
aGF0IHdlIG1pZ2h0IA0KPiBiZSBtaXNzaW5nIChwcm9iYWJseSB2NGwgcmVsYXRlZCkgdGhhdCB3
b3VsZCBjYXVzZSB0aGUgL2RldiBlbnRyeSBub3QgDQo+IHRvIGFwcGVhciwgd2hpbGUgZXZlcnl0
aGluZyBzZWVtcyBzYW5lIGF0IHRoZSBrZXJuZWwgbGV2ZWwgPw0KDQovZGV2L2FsbGVncm9JUCBp
cyBub3QgYSBzdGFuZGFyZCBMaW51eCBBUEkuIFRoZSB1cHN0cmVhbSBkcml2ZXIgY3JlYXRlcyBh
IFY0TDIgZGV2aWNlIG5vZGUgYXMgL2Rldi92aWRlb1guDQoNClRoZXJlZm9yZSwgeW91IGNhbid0
IHVzZSB0aGUgVkNVIGNvbnRyb2wgc29mdHdhcmUgb3IgYW55IG9mIHRoZSByZWxhdGVkIEdTdHJl
YW1lciBlbGVtZW50cywgYnV0IHlvdSBzaG91bGQgdXNlIGEgdXNlciBzcGFjZSB0aGF0IGhhbmRs
ZXMgVjRMMiBtZW0ybWVtIGRldmljZXMuIEZvciBleGFtcGxlLCB5b3UgbWF5IHVzZSB0aGUgdjRs
MnZpZGVvZW5jIGVsZW1lbnRzICh0aGV5IHNob3cgdXAgYXMgdjRsMmgyNjRlbmMvdjRsMmgyNjVl
bmMgaW4gdGhlIHJ1bm5pbmcgc3lzdGVtKSwgd2hpY2ggYXJlIHBhcnQgb2YgZ3N0LXBsdWdpbnMt
Z29vZC4NCg0KPg0KPiA+IFRoaXMgbm9kZSBkb2Vzbid0IGZvbGxvdyB0aGUgZG9jdW1lbnRlZCBi
aW5kaW5nLiBUaGVyZSBzaG91bGQgYmUgDQo+ID4gb25seSB0d28gY2xvY2tzIGFuZCBubyBpbnRl
cnJ1cHQuDQo+DQo+IElzIGl0IGNsay94bG54LXZjdSB0aGF0IHdlIGFyZSB0YWxraW5nIGFib3V0
IGhlcmU/DQoNClllcywgdGhhdCdzIHRoZSByZWxhdGVkIGRyaXZlci4NCg0KTWljaGFlbA0KDQo+
ID4gVGhlIGRyaXZlciBpcyBhYmxlIHRvIGRvIGguMjY0IGFuZCBoLjI2NSBlbmNvZGluZyB3aXRo
IGEgZmV3IG9wdGlvbnMgDQo+ID4gZm9yIHF1YWxpdHkgYW5kIHJhdGUgY29udHJvbC4gSW4gY29u
dHJhc3QgdG8gdGhlIGRvd25zdHJlYW0gZHJpdmVyLCANCj4gPiBpdCBleHBvc2VzIGEgc3RhbmRh
cmQgVjRMMiB2aWRlbyBlbmNvZGVyIGludGVyZmFjZSB0byB1c2Vyc3BhY2UuDQo+ID4gV2hpY2gg
ZmVhdHVyZXMgZG8geW91IG5lZWQ/IEknbSB2ZXJ5IG9wZW4gdG8gcmV2aWV3IGFuZCB0ZXN0IHBh
dGNoZXMgDQo+ID4gdGhhdCBhZGQgbW9yZSBmZWF0dXJlcyB0byBpbXByb3ZlIGFuZCBleHRlbmQg
dGhlIHVwc3RyZWFtIGRyaXZlci4NCj4NCj4gSSdtIG5vdCBhZHZhbmNlZCBlbm91Z2ggdG8gY29y
cmVjdGx5IGFuc3dlciB0aGF0IHF1ZXN0aW9uIGF0IHRoZSANCj4gbW9tZW50LiAgQWxsIEkgY2Fu
IHNheSwgaXMgb3VyIGZpcnN0IGdvYWwgaXMgdG8gY29tcHJlc3MgU0RJLUhEL1NESTNHIA0KPiBz
dGFuZGFyZCBmb3JtYXRzLCBhbmQgb3VyIHVsdGltYXRlIGdvYWwsIG9uY2Ugd2UgbWFzdGVyIHRo
ZSBWQ1UsIHdvdWxkIA0KPiBiZSB0byBjb21wcmVzcyBzbGlnaHRseSBvZmYgc3RhbmRhcmQgZm9y
bWF0cywgTGlrZSBhIGNvdXBsZSBvZiBsaW5lcyANCj4gb3IgY29sdW1ucyB0cnVuY2F0ZWQuIElN
TyB0aGlzIGlzIGZlYXNpYmxlIGNvbnNpZGVyaW5nIHRoZSBWQ1UgaXMgc2FpZCANCj4gdG8gd29y
ayBvbiBtdWx0aXBsZSBvZiA0IHBpeGVscywgaXQgaXMgbm90IHBhcnRpY3VsYXJseSBsaW1pdGVk
IHRvIA0KPiBzdGFuZGFyZCBmb3JtYXRzLiAgSSBwcmVzdW1lIHdlIHdpbGwgdHdlYWsgZ3N0cmVh
bWVyIHRvIGRvIHRoYXQuIFlldCANCj4gd2UncmUgbm90IGFibGUgdG8gYWNoaWV2ZSBzdGVwIDEg
YW5kIEkgcGVyc29uYWxseSBoYXZlIG5vIGNsdWUgaG93IGZhciANCj4gd2UgYXJlIGZyb20gdGhh
dA0KPg0K

