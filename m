Return-Path: <linux-media+bounces-33425-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E914DAC4762
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 07:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70EEE18988B0
	for <lists+linux-media@lfdr.de>; Tue, 27 May 2025 05:06:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7F501EF09D;
	Tue, 27 May 2025 05:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="g5WrNiTS"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021116.outbound.protection.outlook.com [40.107.42.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FD41E521D;
	Tue, 27 May 2025 05:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748322322; cv=fail; b=T5YPQ1lYTHg1+UUavTMzqnk4PO7gfE9r35NUOSna61B8Yrj7dB05+fExfxVvYIHuXDapf2SdHHu7p6wS9e0OmDToHw1nzArLwU0OpnZhGptR1fNYdq1o0W5lsNRfC2v5bVFdBebNzS0tJyFf4aNhApIVHKzJ8G4l9JHHSoefmCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748322322; c=relaxed/simple;
	bh=VVRY4Xa03ydvmjZMDBViU/UAkB8vrzt/u5fDYzKDbWU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FAXWE1HP07djKq4RCPyAhC83JNBYdL3aCgG7iluSXsmPACclO6gWIa7HK71W2xV0qw7Ptj2UzjTMlVg2Ro5XR57bsclBd9FPReYnoUsRJDN7dOws/eLRDF0UedS1rfZ1CS9qDmyFmxg/+IQFu3KodIIZroIOO8jozL4CBxQHxeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=g5WrNiTS; arc=fail smtp.client-ip=40.107.42.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yftWhrqAMB4mpb2eaBrZBU66TlPmtqX2h+VuTXayz6LaLuwlN45BkmxXLFtiB6DiJLDK9OMsWQXkPAzgvS7yul33PHwaUiHmEiYSBBuboNH6xuUaTcKZz1Qn6ZhnpiXzlW1+AR13T7d+bU3JoV//03xEWLzsen9UHNaDjsT6gHmZ6FqIFviABxAUtihHaYGiZCtCT+312Ywv+FyrsZQTm9md6wElvi8caceuoCia1M3DZ9VM0b7tcwL1bSuTsm2blmCd2q46X6mBZDyqdq24EEd9X1ZyuTvBBKxnMuP24AUW/8LbSrsKrZZOjeYS+2BGNoTFkDQh/eF5njpXfKfDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VVRY4Xa03ydvmjZMDBViU/UAkB8vrzt/u5fDYzKDbWU=;
 b=h1dYiHlDPvqdNjSMDru0n29T2SwHHRxkAKm2II+YYWWPdISrBFZ2JRskiAb4eOx5xGtHuyK+7neVT/6wABAgdnV3inDAuIDayGjxBLlMloBm13uXdT08NMHso92EyIcDsaJ6HEnsFOF3LP1Dxb1y5i6M4/5j0xjve5BoJZnviTwYoy2XN4vBApqHtFIBv2buSDyYrKWtksH2niiJANFgux6gDVHVv6T4qSkfTD2o6Qst/NcbX9WBI2OkI++tefmxndL02KZp8z2jWw+mJtTICrz9G4FFveeYDsYYFRCwXi2vja/C3dnVtho48LgYUpUcacff9glRgm+AeLr90PsUdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVRY4Xa03ydvmjZMDBViU/UAkB8vrzt/u5fDYzKDbWU=;
 b=g5WrNiTSe6rzz38tfd74J906ZEpSTvBZ78F5O79cc74278nPjvDIEAst6zcYV2SmyPphGSsP6+RxR6a7xYrje0OK86Vu0KguPMdbPw7oYhZe0JIuKSUYcNNDkp4P0eMDx3zp4MuYgiSr8kzZGxiso7adTM4egoS/RazBOnuEW2E=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB1981.KORP216.PROD.OUTLOOK.COM (2603:1096:101:fd::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8769.27; Tue, 27 May 2025 05:05:17 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%5]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 05:05:17 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>,
	"dafna.hirschfeld@collabora.com" <dafna.hirschfeld@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v2 6/7] media: chips-media: wave5: Reduce high CPU load
Thread-Topic: [PATCH v2 6/7] media: chips-media: wave5: Reduce high CPU load
Thread-Index: AQHbyurPXJPEa5KxPEeKPiji05kpSLPgfoGAgAV1U8A=
Date: Tue, 27 May 2025 05:05:17 +0000
Message-ID:
 <SE1P216MB13038A70DBB710BE13294125ED64A@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20250522072606.51-1-jackson.lee@chipsnmedia.com>
	 <20250522072606.51-7-jackson.lee@chipsnmedia.com>
 <f94e84af0a6ea09fd111f5a1ec9b0fadc9f6d4de.camel@collabora.com>
In-Reply-To: <f94e84af0a6ea09fd111f5a1ec9b0fadc9f6d4de.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SL2P216MB1981:EE_
x-ms-office365-filtering-correlation-id: 405cbf79-f025-4e29-38e0-08dd9cdc1289
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?QjMvT3c2NXhnbWcxVVNpRXc0VlNMYldNMEhVWDBXWGdDVEU0TVlaRjV6bi81?=
 =?utf-8?B?V3NiRWp5QjRhaEsyOXV2c0R2aUEwVm5kQzYyck80d2Y4Mzh1VjN0N1JqaFB6?=
 =?utf-8?B?TXhFNVdNbmExYmNuTHZyZU9QRzZwN0xHNXNkOXFoM0p5M0ZjRWlxTDVzYm40?=
 =?utf-8?B?V2tOTHEwcHNUZXJaTmx0VCtTcnpsVXM1aWVnSkwxQzRsb0hrN2lhbmFjdjdi?=
 =?utf-8?B?Z0NkdkpmZ3lnQm1LZkh2SmZ2ZzRwOWVUcmlUR1dWdnh4bWhieG9vSmx2c3Vr?=
 =?utf-8?B?MisvVWpvN1A2Vi9jQ1N6T2ovdU5zbWo5V3F1dXIxNW9vN3dmTmhLcjluU25v?=
 =?utf-8?B?RnVsdW9JdE9mcmdJTko5aU1LUzdNcFlVQk5ndytpQ3BsS3R0dUFrVit0c0U5?=
 =?utf-8?B?SXJHQVZHdjZKOTliaVZQVnM2Q1dMcVNsdnpHblFyOFc0ckYzSXJQbEhyY21s?=
 =?utf-8?B?WCt4UXpOWjFPN2U4R2xjUGNBL29od0Q3K2Flajh1bklpMXBtZlVWZFdhNWo1?=
 =?utf-8?B?bzZnRDFJTTJNbmVUVExpSWZma1Y5Z3luakVQK0lwNWt1ZXpwK0E4bytmL3Rk?=
 =?utf-8?B?M29DTEFNUFJNdFlRdVI0ZFNZYTh6RDJGdVRyYnhkamJ0VHE4VVZ6R3Iyb2JK?=
 =?utf-8?B?Nkp6NGZkOWZJT1pLZFRkNVN5eFBXSC9DRVRNZDNMNG11OVFVaFlROVBCcXNt?=
 =?utf-8?B?WVpFVXcyWDlIL1IvRkVhZ2ZIOTZTL3laTmhrazhTTW9zNnY3WXREYUN4VG9D?=
 =?utf-8?B?clhFRkRZc2d1dGtSQ2hmS3hOZDVDNjlocmlHZFlScG5SSHR2TXIxdkpoODRB?=
 =?utf-8?B?YnlQMmtCWFc0SW92WCtYNDlxcUtHaFQyMzU1V09ld2xZRVF2UUV0Q1MrZFpZ?=
 =?utf-8?B?bUxGVXdZQUgxNm8rZEV4dm5scnJOWkZhZUR4TGl5TUlOUmYycGJKMzhpeHZK?=
 =?utf-8?B?ZnM5Qm41T296bWxZd051YnEzTklCbThUN1EzNVFUREdSQ1NrMlY0MEJhMDBR?=
 =?utf-8?B?UVhydm9zVmpTY3p1MC84dkp6ZDg5SFFGWW5VQlluSzhTNjZqaElCandvYStr?=
 =?utf-8?B?R1lOejlvTE1VdWZrZXpGcldIQTZWaXJaQ0JCY3V1SkZLaXl2YkNWOTljb1ht?=
 =?utf-8?B?NUpzQ0xkOWFyNWdnYmh3OFltcUpEVks3cnBGMGF1VUNaZll6bklFQTVJTjIv?=
 =?utf-8?B?QlFoenhjek5aOEYxWlVpcHA0bmtHRHlFYXZWb3BVTjFUY2pkK2RmdkFjRHpI?=
 =?utf-8?B?VUpFNE5BalJha3ZDUUVEQ0xtTjMxRnBDdHlJU3loMEZ5NUZpdlJCMnlxaDlS?=
 =?utf-8?B?NjF0dFF3MkNITzlsTjVWN2EvM2Y4ZS9HUVdwWWJDSngzbWlXMUs0YlN3bFY4?=
 =?utf-8?B?R0RhQTVHazZ5M2NlNTJ3ZlhhOWtIaTZ0amt2RXhmbXRWZTJrUlpmT3NNREw4?=
 =?utf-8?B?K1VUUS9pMkV2TmR1RStlQzFkamNOVUtJRGVGdHI2UjYzWVBTT2dkdEtiZTVG?=
 =?utf-8?B?eUFzNjFCS2dsQmtnNkdPMnRmWnVYSnI0MENLdTJ5bm9kenhDbmQ3K045UnB4?=
 =?utf-8?B?UGFUTHNyOUZqS2pXMnU2MHU5eFMweCsydFY0ZUhINVVMVUZkZFZySWVEY0xR?=
 =?utf-8?B?TlAxa0djdGNWQldTT1BFaEVXd1J1NjRhWktLWkpMNi9GN0FTNjg4Uzk2cWw3?=
 =?utf-8?B?bCtZN1FHUmI5emdmSWNDdk1wTnVRbE9TNW9LT0ozU3RaWkF6R1NoYXM3RE5D?=
 =?utf-8?B?N3JhVzVYT1ZTSUNyK284QXdyNVBvU3ZxOHlqOXJqb2RiaE9qRXpaUTRBaWUr?=
 =?utf-8?B?T1NWWVZjTjZoZ1VtcnFrMEhNRW96QUJ6MWV1V1k4eVI2UGtqejkwNDl1Q0ht?=
 =?utf-8?B?ZEZrMGx4elFPVW5kUnZmUS95N1l3bUFZaVZIUnQrcFVramg2MkVUWGtmTUkw?=
 =?utf-8?B?SDNlQmZWSFlVcUtXSlZGMzl2M3FJeVk3eUVHdjhCTXFBekxzU2VaRS9xWWkw?=
 =?utf-8?B?K2F3Qm95dC93PT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TW1Yb3E5bExSVnZvbTZCWVFQanUwYjJheU1rU3AvWXJIUHpHdlBsblN1eTVW?=
 =?utf-8?B?SndXY2pCczBGaFMwdzFnbm9Kb2psL3VqSzFnZWJQQWVQTzVpSjY3aStxTkFt?=
 =?utf-8?B?WmlwczdsMEZzdDVqU0NUNVJZMHlmV3FoaUJiSnhJVlQ1eUUrZ08zSjNjL0Vz?=
 =?utf-8?B?bU4zT0w2STJ5S2oxUmw5bytZd3c5TjNUOXZJTXlKUlBWOGsyTW94V2x5VDl6?=
 =?utf-8?B?THVzNGRQMXJpbDFKV0Vhak10aTlqOEtNMXBZcnpCbGpUWW5hOFYzMUhaV2xL?=
 =?utf-8?B?VUNodHAxOGlJYkNLSHpwbXk1SjV5b1pnQnh4NzdEVUVXNkk4cXA5WXRlYVk4?=
 =?utf-8?B?RGRreEwvL3BsazZXWlB6eGEwbnA0WUprQTBRSXRXb2l1OFRvTmxWQnRVNXNj?=
 =?utf-8?B?aFFPdHBiOVR3UzZ5emFaQURlNlhyRFNhRnRxOW02UEFIT2pzQWZFcU1XQ2ps?=
 =?utf-8?B?OGtqSjlpWnNzNXNTSHovTlU0QjlRNTZkTzNDd1BqcHFXai9SR1M2ejkrTjVR?=
 =?utf-8?B?Z3N1eXpqVmZQVmFRekRZalk3WjJ0aHY5SFF0UHB2VWJCUWo4WHArNUVEbDhY?=
 =?utf-8?B?SFlqL3J2Zk43VHdUU2czaEVXOGNhTmZpZ3ZhSlVpMXFqOFp6aW9QZWVPanVo?=
 =?utf-8?B?NUtvcHYrY2VWZk9KQXhjbUV5bTU2WGRMVHE3MGdRSWc3TG1VaFNhU21oajZW?=
 =?utf-8?B?bFZGTDBwSGZIRzBEZ0FWZzI1MlNtUWplbStaZ2wvcUZ2Q1QwZ1cwbG1naXB4?=
 =?utf-8?B?VVBBNE0yemxSZDNSeTFqeDhIK1AveUJLY3V4aEtaeHhyT0kvVkZ0cHVnaFRn?=
 =?utf-8?B?b3FQWThhWnlGN25FZnlnRDJsaW9uV296S0lYQlREaE1lYXVmYkhDempPeFBY?=
 =?utf-8?B?QVUwcmFLeHZ3ZTRsZ0hUVlJyV3ZuSmJpZFdUSm04VkFsK2dtUnQzRTdENDlC?=
 =?utf-8?B?OTdEWXVKT1E5NThJTFZ3VWdKcE81Zys2SXdyN0V0TklGU0hIL1ZaL2R4TDRK?=
 =?utf-8?B?MXVXMklRRW5UWkdqMW5tY3dZSDR6UTc1YVlUY2ljT1hGNTFXanVkTktyRjNk?=
 =?utf-8?B?dUkvQU9IRVR6YTRza0VrL05kT0VmK0pjVWpjdUpMaVUrWkpTRzIrU3Vtc1kw?=
 =?utf-8?B?ZDlhRlpqTHNhRjArYzNrdE0rT21mU3NhbkFuU0JpS053ZUJ3VHlKbDdjaTV0?=
 =?utf-8?B?enhaTUN4WXZieU1mbXR5eWRxaGpuSE8wdGt3K0lWN1ZZWTNGdmpvWG5zZDVC?=
 =?utf-8?B?cnBPWEt2MjZOelhzVlNiMm9BTjJWMDNiMVNsMWkxV1dlRlkvdVlGczFTVUQ1?=
 =?utf-8?B?eGJpbFMxNXhGTmorTU9lVXVDejNHbnpYUEM5bFRBWXk1bjRRZ0VGd0VRSEsv?=
 =?utf-8?B?VHBSSzcvVlIwNmdzbWNZZVYyWklOZkI0WE5vUWdpcEhOZkZoRlRYU3EreFVt?=
 =?utf-8?B?MldkbVpkZ2JFSGVKZ29hampXeEFGMGszdG15OFdQWFFEd0Z2cDZVbHp4U3Fj?=
 =?utf-8?B?WEhITGFKTGtXeURQYWx2UGVNTFJWdlIrNm5BL1oyWnlSUmJqSmdBV1h1cmZ3?=
 =?utf-8?B?NWZiZDNQejE5bG1JTWdOSkhxWVg0OU93M3QrdGpVbmFicG95b1dUYzc1RHp1?=
 =?utf-8?B?eWN4KzR5YWlzN3Raeis3NmxPcFc0Q3doRkpOZE5aNVFUcDhHMkt0M0xteE0x?=
 =?utf-8?B?L0VLYWlucEdGZkJtVU9tQm1LaDBhWlVOWkdyZUJRdnJ5akRySDNwSFRadXhX?=
 =?utf-8?B?Q2pJZ2JuV0NnbTY3TmpnbDNYNEJrdlhOQSswSEZFbUVWL3pMcWlWcXFrRFpG?=
 =?utf-8?B?cUk3RytCSWY1YXhVOTFyMHVQV3h2a2phWHpXOVQrc2x1bSttalMycUh5MFFy?=
 =?utf-8?B?Z21LeGhZaXhxNjl0VlYyZEZaenBlRUFQcHFwUzIxQnVHMVRyQzZKTUVZUHBa?=
 =?utf-8?B?M1VoWU5JbjNRRzljK2RUMXh1T3dGWTJVK2pkaUNrVXdVS2h1cmVLSE1iNDIw?=
 =?utf-8?B?aC9hVitmcWFreHJ1N2x1eVRNMEhmR1dpdHNMbG92bnR4UU5HRkxHbkNxRUxs?=
 =?utf-8?B?YXA0Mkx6QTVhYnBlSHlyWUpIT0pnMVB3S0dxUHZaUUtDMUFjK2ppdnhUSURz?=
 =?utf-8?B?WDdCYlUwank5N3l4Q3NzMTBoU2FWUzE5L1crZFZIR0F1SGxvQ0gwWTBGaWli?=
 =?utf-8?B?aEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 405cbf79-f025-4e29-38e0-08dd9cdc1289
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 05:05:17.4011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9QgZoeJS2R+xGmWHZJdEVPBIq+ZFJVy4SRsxHx41WU9DWFfYM1seb5zy2Xtklv6B1tp32jG24J9O12TavBQhIsTN4F4BRXV1/IzsA7kig4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB1981

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj4gU2VudDogU2F0
dXJkYXksIE1heSAyNCwgMjAyNSAyOjQzIEFNDQo+IFRvOiBqYWNrc29uLmxlZSA8amFja3Nvbi5s
ZWVAY2hpcHNubWVkaWEuY29tPjsgbWNoZWhhYkBrZXJuZWwub3JnOw0KPiBodmVya3VpbC1jaXNj
b0B4czRhbGwubmw7IHNlYmFzdGlhbi5mcmlja2VAY29sbGFib3JhLmNvbTsNCj4gYm9iLmJlY2tl
dHRAY29sbGFib3JhLmNvbTsgZGFmbmEuaGlyc2NoZmVsZEBjb2xsYWJvcmEuY29tDQo+IENjOiBs
aW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7
IGxhZmxleS5raW0NCj4gPGxhZmxleS5raW1AY2hpcHNubWVkaWEuY29tPjsgYi1icm5pY2hAdGku
Y29tOyBodmVya3VpbEB4czRhbGwubmw7IE5hcw0KPiBDaHVuZyA8bmFzLmNodW5nQGNoaXBzbm1l
ZGlhLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiA2LzddIG1lZGlhOiBjaGlwcy1tZWRp
YTogd2F2ZTU6IFJlZHVjZSBoaWdoIENQVQ0KPiBsb2FkDQo+IA0KPiBIaSwNCj4gDQo+IExlIGpl
dWRpIDIyIG1haSAyMDI1IMOgIDE2OjI2ICswOTAwLCBKYWNrc29uLmxlZSBhIMOpY3JpdMKgOg0K
PiA+IEZyb206IEphY2tzb24gTGVlIDxqYWNrc29uLmxlZUBjaGlwc25tZWRpYS5jb20+DQo+ID4N
Cj4gPiBTaW5jZSBhcHBseWluZyBjaGFuZ2VzIGZvciBwZXJmb3JtYW5jZSBpbXByb3ZlbWVudCBv
ZiBkZWNvZGVyLCB0aGVyZQ0KPiA+IHdhcyBhIHByb2JsZW0gcmVsYXRlZCB0byBoaWdoIENQVSBs
b2FkLg0KPiA+IENQVSBsb2FkIHdhcyBtb3JlIHRoYW4gNCB0aW1lcyB3aGVuIGNvbXBhcmluZyBD
UFUgbG9hZC4NCj4gPiBUaGUgcm9vdCBjYXVzZSB3YXMgdGhlIGRldmljZV9ydW4gd2FzIGNhbGxl
ZCBtYW55IHRpbWVzIGV2ZW4gaWYgdGhlcmUNCj4gPiB3YXMgbm8gYml0c3RyZWFtIHdoaWNoIHNo
b3VsZCBiZSBxdWV1ZWQuDQo+IA0KPiBZb3Ugc2hvdWxkIHNxdWFzaCB0aGlzLg0KPiANCj4gTmlj
b2xhcw0KPiANCg0KDQpJIHdpbGwgYWxzbyBzcXVhc2ggdGhpcyB0byB0aGUgcGVyZm9ybWFuY2Ug
cGF0Y2guDQoNClRoYW5rcw0KSmFja3Nvbg0KDQoNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEph
Y2tzb24gTGVlIDxqYWNrc29uLmxlZUBjaGlwc25tZWRpYS5jb20+DQo+ID4gU2lnbmVkLW9mZi1i
eTogTmFzIENodW5nIDxuYXMuY2h1bmdAY2hpcHNubWVkaWEuY29tPg0KPiA+IC0tLQ0KPiA+IMKg
Li4uL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1LXZwdS1kZWMuYyB8IDEy
DQo+ID4gKysrKysrKysrLS0tDQo+ID4gwqAuLi4vbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEv
d2F2ZTUvd2F2ZTUtdnB1YXBpLmjCoCB8wqAgMSArDQo+ID4gwqAyIGZpbGVzIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHUtZGVjLmMNCj4g
PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtIG1lZGlhL3dhdmU1L3dhdmU1LXZwdS1k
ZWMuYyBpbmRleA0KPiA+IDcxOWM1NTI3ZWI3Zi4uNDIxYTllMWE2ZjE1IDEwMDY0NA0KPiA+IC0t
LSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1LWRl
Yy5jDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93
YXZlNS12cHUtZGVjLmMNCj4gPiBAQCAtMTI4MCwxMCArMTI4MCwxMyBAQCBzdGF0aWMgdm9pZCB3
YXZlNV92cHVfZGVjX2J1Zl9xdWV1ZShzdHJ1Y3QNCj4gdmIyX2J1ZmZlciAqdmIpDQo+ID4gwqAJ
CV9fZnVuY19fLCB2Yi0+dHlwZSwgdmItPmluZGV4LCB2YjJfcGxhbmVfc2l6ZSgmdmJ1Zi0+dmIy
X2J1ZiwNCj4gMCksDQo+ID4gwqAJCXZiMl9wbGFuZV9zaXplKCZ2YnVmLT52YjJfYnVmLCAxKSwg
dmIyX3BsYW5lX3NpemUoJnZidWYtDQo+ID52YjJfYnVmLA0KPiA+IDIpKTsNCj4gPg0KPiA+IC0J
aWYgKHZiLT50eXBlID09IFY0TDJfQlVGX1RZUEVfVklERU9fT1VUUFVUX01QTEFORSkNCj4gPiAr
CWlmICh2Yi0+dHlwZSA9PSBWNEwyX0JVRl9UWVBFX1ZJREVPX09VVFBVVF9NUExBTkUpIHsNCj4g
PiArCQlpZiAoaW5zdC0+ZW1wdHlfcXVldWUpDQo+ID4gKwkJCWluc3QtPmVtcHR5X3F1ZXVlID0g
ZmFsc2U7DQo+ID4gwqAJCXdhdmU1X3ZwdV9kZWNfYnVmX3F1ZXVlX3NyYyh2Yik7DQo+ID4gLQll
bHNlIGlmICh2Yi0+dHlwZSA9PSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NBUFRVUkVfTVBMQU5FKQ0K
PiA+ICsJfSBlbHNlIGlmICh2Yi0+dHlwZSA9PSBWNEwyX0JVRl9UWVBFX1ZJREVPX0NBUFRVUkVf
TVBMQU5FKSB7DQo+ID4gwqAJCXdhdmU1X3ZwdV9kZWNfYnVmX3F1ZXVlX2RzdCh2Yik7DQo+ID4g
Kwl9DQo+ID4gwqB9DQo+ID4NCj4gPiDCoHN0YXRpYyBpbnQgd2F2ZTVfdnB1X2RlY19hbGxvY2F0
ZV9yaW5nX2J1ZmZlcihzdHJ1Y3QgdnB1X2luc3RhbmNlDQo+ID4gKmluc3QpIEBAIC0xNDc0LDYg
KzE0NzcsNyBAQCBzdGF0aWMgdm9pZA0KPiA+IHdhdmU1X3ZwdV9kZWNfc3RvcF9zdHJlYW1pbmco
c3RydWN0IHZiMl9xdWV1ZSAqcSkNCj4gPg0KPiA+IMKgCWRldl9kYmcoaW5zdC0+ZGV2LT5kZXYs
ICIlczogdHlwZTogJXVcbiIsIF9fZnVuY19fLCBxLT50eXBlKTsNCj4gPiDCoAlwbV9ydW50aW1l
X3Jlc3VtZV9hbmRfZ2V0KGluc3QtPmRldi0+ZGV2KTsNCj4gPiArCWluc3QtPmVtcHR5X3F1ZXVl
ID0gZmFsc2U7DQo+ID4NCj4gPiDCoAl3aGlsZSAoY2hlY2tfY21kKSB7DQo+ID4gwqAJCXN0cnVj
dCBxdWV1ZV9zdGF0dXNfaW5mbyBxX3N0YXR1czsNCj4gPiBAQCAtMTU5Miw2ICsxNTk2LDcgQEAg
c3RhdGljIHZvaWQgd2F2ZTVfdnB1X2RlY19kZXZpY2VfcnVuKHZvaWQgKnByaXYpDQo+ID4gwqAJ
CQkJaW5zdC0+cXVldWluZ19udW0gPT0gMCAmJg0KPiA+IMKgCQkJCWluc3QtPnN0YXRlID09IFZQ
VV9JTlNUX1NUQVRFX1BJQ19SVU4pIHsNCj4gPiDCoAkJCWRldl9kYmcoaW5zdC0+ZGV2LT5kZXYs
ICIlczogbm8gYml0c3RyZWFtIGZvciBmZWVkaW5nLA0KPiBzbyBza2lwICIsDQo+ID4gX19mdW5j
X18pOw0KPiA+ICsJCQlpbnN0LT5lbXB0eV9xdWV1ZSA9IHRydWU7DQo+ID4gwqAJCQlnb3RvIGZp
bmlzaF9qb2JfYW5kX3JldHVybjsNCj4gPiDCoAkJfQ0KPiA+IMKgCX0NCj4gPiBAQCAtMTczNyw3
ICsxNzQyLDggQEAgc3RhdGljIGludCB3YXZlNV92cHVfZGVjX2pvYl9yZWFkeSh2b2lkICpwcml2
KQ0KPiA+IMKgCQkJCSJObyBjYXB0dXJlIGJ1ZmZlciByZWFkeSB0byBkZWNvZGUhXG4iKTsNCj4g
PiDCoAkJCWJyZWFrOw0KPiA+IMKgCQl9IGVsc2UgaWYgKCF3YXZlNV9pc19kcmFpbmluZ19vcl9l
b3MoaW5zdCkgJiYNCj4gPiAtCQkJwqDCoCAhdjRsMl9tMm1fbnVtX3NyY19idWZzX3JlYWR5KG0y
bV9jdHgpKSB7DQo+ID4gKwkJCcKgwqAgKCF2NGwyX20ybV9udW1fc3JjX2J1ZnNfcmVhZHkobTJt
X2N0eCkgfHwNCj4gPiArCQkJwqDCoMKgIGluc3QtPmVtcHR5X3F1ZXVlKSkgew0KPiA+IMKgCQkJ
ZGV2X2RiZyhpbnN0LT5kZXYtPmRldiwNCj4gPiDCoAkJCQkiTm8gYml0c3RyZWFtIGRhdGEgdG8g
ZGVjb2RlIVxuIik7DQo+ID4gwqAJCQlicmVhazsNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS12cHVhcGkuaA0KPiA+IGIvZHJp
dmVycy9tZWRpYS9wbGF0Zm9ybS9jaGlwcy1tZWRpYS93YXZlNS93YXZlNS0NCj4gPiB2cHVhcGku
aA0KPiA+IGluZGV4IGZkMGFlZjBiYWM0ZS4uZjI1OTZhZjA4Y2RmIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY2hpcHMtbWVkaWEvd2F2ZTUvd2F2ZTUtdnB1YXBpLmgN
Cj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2NoaXBzLW1lZGlhL3dhdmU1L3dhdmU1
LXZwdWFwaS5oDQo+ID4gQEAgLTgyMSw2ICs4MjEsNyBAQCBzdHJ1Y3QgdnB1X2luc3RhbmNlIHsN
Cj4gPiDCoAlib29sIHJldHJ5OyAvKiByZXRyeSB0byBmZWVkIGJpdHN0cmVhbSBpZiBmYWlsdXJl
IHJlYXNvbiBpcw0KPiBXQVZFNV9TWVNFUlJfUVVFVUVJTkdfRkFJTCovDQo+ID4gwqAJaW50IHF1
ZXVpbmdfbnVtOyAvKiBjaGVjayBpZiB0aGVyZSBpcyBpbnB1dCBidWZmZXIgb3Igbm90ICovDQo+
ID4gwqAJc3RydWN0IG11dGV4IGZlZWRfbG9jazsgLyogbG9jayBmb3IgZmVlZGluZyBiaXRzdHJl
YW0gYnVmZmVycyAqLw0KPiA+ICsJYm9vbCBlbXB0eV9xdWV1ZTsNCj4gPiDCoAlzdHJ1Y3QgdnB1
X2J1ZiBiaXRzdHJlYW1fdmJ1ZjsNCj4gPiDCoAlkbWFfYWRkcl90IGxhc3RfcmRfcHRyOw0KPiA+
IMKgCXNpemVfdCByZW1haW5pbmdfY29uc3VtZWRfYnl0ZXM7DQo=

