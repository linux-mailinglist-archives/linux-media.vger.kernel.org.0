Return-Path: <linux-media+bounces-14948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B2492F55E
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 08:10:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47B0E283E7C
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 06:10:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60DD313D509;
	Fri, 12 Jul 2024 06:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="P4NT5Xa0"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021117.outbound.protection.outlook.com [40.107.42.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA3B13D28A;
	Fri, 12 Jul 2024 06:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720764632; cv=fail; b=BBkbAjIr15TrPglKLD1I0yhwGSe7hs2ExeVERjtMYiM4IH734TvdjuSDg+Ik8yEkYjBJGjRN65JiOJNUytEQp5mc6tF4+3O9w6uRIfdiVRiafBuYwoa9Qe4SvkznRcWzSF2enuzkdspKrcuNud/vfkESaGbug/scDbBIt2yRboc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720764632; c=relaxed/simple;
	bh=J2YZyb+jRF2lybEcMSidF5jYOTyYxSvRshMqEgHvrFs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YGJjMtnlwRpoWGFs1Ts3EpWJX9i3n7S1WLmx2mgM4nfReyXFScJrMAG3dJQENEdYyDw+yr46bEPzR4ZCLIjpNwhuxfCVN+yRTfCN0KepxzfBYICTwCkekzXsjKs5cARtZIl/DvjUdsbWgG8C+tnglzKR7EKSJZNQCzxOLTXLSbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=P4NT5Xa0; arc=fail smtp.client-ip=40.107.42.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmCqSbrLuzhpOyhxDX4zX4pAnV/uQjcKuv0pL1dz9r8Jy+Q65RLIVJ8Hhr/ZeiSarPaL82UlyyZ2xkcz9oG59fix8NpCKYAOb5dKROB/q/AmcByG1tAoGK6FKR1yijOI3oG0W5cvMOUdqfzqgPkt8jMOLusryDz16U1Vt2PowGTp5nXDRMpDRc+gQlrezKetQWorpD0gYE7IET5h4G8wfBLNhorJTsjWveioI48XoidHSjYyf7DuEABeXFVFWShSs6Yud2jJnv1n+gidwkr6Jygf3gDeZIs8/zmtd0rlvlFA+gRlaEsJq0Oj4/919cczqb6G7Gnbk7HDvxEUtrknfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2YZyb+jRF2lybEcMSidF5jYOTyYxSvRshMqEgHvrFs=;
 b=x//sATyckL6B6myXBgn0h5Jyu/TA3eU6reZ5cbjgygMoFhsdW/I2YP56bbreCOBhbY4uKz1FjBUGsZXKJDH44uBMrc8xYbqCJd1b7TiOcTSEEJ5EcBgV9QsaJ8A9tF849AIxICQ6YoRyZOsu35p9IdenCLCU4lSdp/yx+UgWBRsBDjQF+FCHCskw8+la3oEFieb8RCmdkNy4zeAnVru2itwprcr36KAHtlNGuS84j7grYBgh3hcTyfJHsWKigoxFovMuscU0/JLHXQkw4PC8SqF/L1309+QFPtnqLovrDL6pS4CZoJUChia363VKkVwzb29HNSBOQf0w8GVDpN21jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2YZyb+jRF2lybEcMSidF5jYOTyYxSvRshMqEgHvrFs=;
 b=P4NT5Xa0uYPRvtG/9WBeDs14F74ZdKPOiblQvdqevUryjpxueMNhX1DJYqKTujPPZH9hHtyKMfbCv7D6RQOePipSDTZP6oZkcM/0Ntl4Okm8jdiAxSlNMSit+MBdGSuGnzKFUqeZ+4eapKMDGs6p2GSxXu9pnjKDwqfb6DkUpxA=
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SE1P216MB1400.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2b::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.23; Fri, 12 Jul 2024 06:10:26 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%7]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 06:10:26 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, Devarsh Thakkar
	<devarsht@ti.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"sebastian.fricke@collabora.com" <sebastian.fricke@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>, lafley.kim <lafley.kim@chipsnmedia.com>,
	"b-brnich@ti.com" <b-brnich@ti.com>, "Luthra, Jai" <j-luthra@ti.com>, Vibhore
	<vibhore@ti.com>, Dhruva Gole <d-gole@ti.com>, Aradhya <a-bhatia1@ti.com>,
	"Raghavendra, Vignesh" <vigneshr@ti.com>
Subject: RE: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Topic: [RESEND PATCH v6 2/4] media: chips-media: wave5: Support runtime
 suspend/resume
Thread-Index:
 AQHawKPhLOcR91s1hkK9DSaFUGSwxrHPD/CAgAC0SbCAAATQUIAAoAiAgABLagCAAAQsAIAANdIAgCHPqoA=
Date: Fri, 12 Jul 2024 06:10:25 +0000
Message-ID:
 <SE1P216MB130382E16D0CCD27341D535DEDA62@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
References: <20240617104818.221-1-jackson.lee@chipsnmedia.com>
	 <20240617104818.221-3-jackson.lee@chipsnmedia.com>
	 <6e6f767c-85e9-87f6-394f-440efcc0fd21@ti.com>
	 <SE1P216MB13037621438C8CE6142A69A8EDCF2@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <SE1P216MB130382374B76CD8BC9FFCFE5EDC82@SE1P216MB1303.KORP216.PROD.OUTLOOK.COM>
	 <881dcea1-a592-4506-083a-9d5f3c6a8781@ti.com>
	 <b2f7552d37075538e22640f7b42838d29d3f8b3e.camel@collabora.com>
	 <e901967f-59df-f4b0-de51-61e542c04161@ti.com>
 <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
In-Reply-To: <07d56a690d5fed16082e73c5565b67777e31494a.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SE1P216MB1303:EE_|SE1P216MB1400:EE_
x-ms-office365-filtering-correlation-id: c541186b-a439-4342-4e27-08dca2395274
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?cmZUK05LeDVsYWhSeXkxdThabDVwaUVnam1lVnRSRXNKKzB2QmhFT1JkZEMv?=
 =?utf-8?B?Zmw5aHpFTmI2Snl2N2VHVjFYRVVva3oxcG1QTG0yWk5GNnF6TEY1ZWkvZ2ZC?=
 =?utf-8?B?RmJJd0pRUmFRVnMxWDB2T0lzZ0VqSTl6aGgzVlJ3OTc3YjI3Z2ZnY1ZUcVVM?=
 =?utf-8?B?VFN0ZGlaNWdaVlU0U0oxM0dhWmZveHI3MVdkVjM3Y000aXJ4Q1hFaGc5Tngy?=
 =?utf-8?B?Q014TDJDcklTdjU3dU9Pc1F4WTNRZDR3Q3l3c3RtemJYS2p5RnlQOXo1ck50?=
 =?utf-8?B?QW9IaHdhUFRPLzJKWXY0cW5BZzByYS92cmNMY1hkdW1DbmdXc3VnYVNOTDBZ?=
 =?utf-8?B?ZkhvU1orSlBrc2Z1czlQVGtuamdUUmRoTzZQOHIzeVNQVWRQT3dYOHVPOUtI?=
 =?utf-8?B?YkdZM0tzSU03R2lraW5NVitsWTljYkdGc0xZTitTZEY4WjlSQ1ZmREVKc3h3?=
 =?utf-8?B?ODYvTFZXZW1TeGFPbUxxSHZMWFI3bEZjRUtoY3QyT1lhNzRTdjVOTitNRS9v?=
 =?utf-8?B?dit3QS9QampCUWViQWo1NHZ0Y0FSelpFTHFQYnFBT0xUMnlCWkhiY0hNRk85?=
 =?utf-8?B?NEZYZitKVzV0Q0VCQnpIMmlHNDFaYUhxZ0RBd3FyUzdSVS9ObnhucG1sVFZj?=
 =?utf-8?B?ZEpqK2hZUXBEcURrT2hlMm5xZk53cnFQdCtQMGwxdW9KdzhqRVNPVC9VcFJ6?=
 =?utf-8?B?TmdsczdvSHBmWW1lanhBSU1PMHltTDRaZnhPZjk5cUFPQ282ZDBtVU1tNjdE?=
 =?utf-8?B?VklDT2h6RHY0TnlWaW03b041ZWtCcXIvMUZIZzgyS2U5NnRGaGV6MjJ5TDBH?=
 =?utf-8?B?Q0FBcXhxWjE4UG5DWnFidGl4OENyNG1mWVB1S3hzRzA0QXhtWjRiVitBTTNE?=
 =?utf-8?B?aGNGL0YrWDZEZXBDcFFEQy9VU1c5NHdFTkVvYWlNRnBnekdkSEZtQXRsTjgz?=
 =?utf-8?B?V2JtUDJTVEFZVTVHMnpCamdzaFNmNXR5OGkzMWZ4OXlsK1NUWkZONHBzWnZ6?=
 =?utf-8?B?RlBCMUpMYzVHaDI4NCtiK1JydThpS1p5ajRVK1ZRNFlRL0RsR1ljL21lTkpn?=
 =?utf-8?B?eGc5NVNzVktJVVhxaWNkVXBEaGdiZnhia29YSFdPMkE4S2c0OHkwaDRrKzVz?=
 =?utf-8?B?bFpiaEgrMUJPTXg2aXkxZnhRSzd6RGtCb0ZPYTVjRWpkcHJyWFM3YkFhS3ZX?=
 =?utf-8?B?WG55eUI2U0lpRURHZytJS3JzOXlpYUU4MytLN0NOVUg2UmhMVkVIZHFBQkJy?=
 =?utf-8?B?U2M4M2hsSitLbG9rY2xaSnVjYmExM0ZIeUs0OUE1ZGkvUlFPQms5M1RlOHJD?=
 =?utf-8?B?MUlEZ1ZtSUh5TWpxK3MxM09pbWZtS0NjVmlNenRzMGZBL3RHNWJtWmJmekdI?=
 =?utf-8?B?RjFBRGNjOHp3QXQ3dmN3OTBUdDloRGxSVUFVOGM2ZTI3MitabG9IZEFZSWhq?=
 =?utf-8?B?aURZZTJ5UVVSUVV4TTlqUkNEazVlSG11TzcwT2VnWWkwOFZuTFJMQnhWb00z?=
 =?utf-8?B?ZmRydXc3YXYwY0t1dHBUL2l0UTd4VjNMWWg2Z1VjTDd3enhvaWJobVFqUzRQ?=
 =?utf-8?B?R2Njak1GNkJlaWY4STJOaHRZNk9pQmw1R0lNMzM1dkgyM2NjV2ozUGFxSEFh?=
 =?utf-8?B?SExkSSt5OVBGdDdqOUFDMkIwdG1kVkd3N2RMeFZNZmtJY0Zib1hIZUVXZ0xR?=
 =?utf-8?B?czVhR0xFYXlXVzRMeHZPQVZEN25yOVEydjhBZExmWXFaUmRGbkk4OHl1Vkla?=
 =?utf-8?B?OUUwMmZrNXVYZlBCNGs3RGh3WXNtNHdMQ2o1N0FRNHAyVTQydHREN2kycDUy?=
 =?utf-8?Q?bT0kQ9AHe+uaaBjDv/t8R/Ida1U9gVBxglTe0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UEdieWRLU0ZhbzFvRzFxeW4vemtHZWpRNEY5Rm5jM2pyY1hnbEZkemRpQktJ?=
 =?utf-8?B?bm1qRzVZNUl1ZWpRcUQvTWZ3MWx0WnJkNTlGNU5JT2NSN3lpN1FkVllHM25j?=
 =?utf-8?B?TEtDbWhGN2grUnNyV01QQUtwWEw2NFMzNDdBWlVmWlBNc1doRkQrcmJQSFBo?=
 =?utf-8?B?Q01MWmk3cUNNQWRXQUY4bG16OFlTdHVhclFtS1ZIVERQeThHcXJ1UkE4Y1lY?=
 =?utf-8?B?Yjdwbk5pYWRRSUt2R2VZUG1oSmJVbi9mTkg5TmgvRU5HKzNaWm5WcmUxd1Np?=
 =?utf-8?B?empLb00zOEdtZUdVRUFJVWV4MDRqRytENC92K0kyL3h4MnZmVk83SiszWGVN?=
 =?utf-8?B?UTZsZVp6c3RvVEJnZ0ZwN3cxSlJDVzB1M0xNUEhKRENaYkRGV09WY3RsaWMv?=
 =?utf-8?B?VldIenZRWllDTS9SWjFuNXNrYmJPVnR4R1kxY3o2Q2lpakJ2dXpnU3JjR0Jo?=
 =?utf-8?B?RCtrS085YVRwL0JuMWtxNU9oeGwwY0dLcVZ3SFZwTnhhVUt0cTRmNHNKdER2?=
 =?utf-8?B?L2FoeUZpTDZ6REM0WTgvQlZrcWdGcnl1WUFYWTd6VGgzNUNmbnJMMXZobzdT?=
 =?utf-8?B?Mm5sUFRSN0RGZjJHM2IxVGFZTnlhNXhEQWE4dmE3QU9URi9TWWJLd1plRlEz?=
 =?utf-8?B?QURjZGY4K3VFT0htRGx5VFl0d3ltYjBqdGYvTFh5QS9HcXZTTHhDWVZwdjB5?=
 =?utf-8?B?Nyt2bWRKSmFjRmdFODREVlRLYTlmSy9xU21xenBDT2hUSEJ4VUF2TGxLSFNE?=
 =?utf-8?B?aFBjeVM0UkJqSnNKck5JNWFPY0o5Rnh6UmFQQkF2STdadzlPUTdtOUxYMk1X?=
 =?utf-8?B?YjQzYjRBZEtOVDBnT1ptZzQ2WU14UFJvUk9yZktzUzVXZjZra3pwK2hLd3J3?=
 =?utf-8?B?bzZldG1Ic1VzakxrODJOejkrc0RudmZrRDNJODgvd1dMWGlHUU9rRmJqamFF?=
 =?utf-8?B?M1JxNmxsRnVWdzZ0WCtlcnhnU1hLWjl5TzkxekV2aEsvYXh5azN0TXJzVThn?=
 =?utf-8?B?OXNTSTVjYmtFN1U0Umh4eEtjLzYxM096OEZYcTRnV04yTzZ5RGhxd3FEU1oy?=
 =?utf-8?B?U1BqYXZmN29MVWlRMG9XZUl3aTIyRjhiZS9ZdWN3WmIrcWtybTVZZldqblRm?=
 =?utf-8?B?RE55WVJXTngxWEM5TTlBZllWdzBlVDFmMnVwRmEwblQ5anNBVE5YZUFlejM0?=
 =?utf-8?B?ZURhTVRud3ZIekQzV1Nia2hnRHp0bFlWMnQvb1pqY0hXajZteUNYbzlWWFRS?=
 =?utf-8?B?cWFLWWFYaStSUlZoZThXM2QzY3kySzY5V1o3YjloOXZJL3p4TGZJMDIvME9l?=
 =?utf-8?B?S1FmSExsTlNhdkxwZTcvZmxSVzhtRTFXQzJsVkNDSEJKbG4vVDRHQnRhQTNI?=
 =?utf-8?B?RDFFWjlzVWo1Tzg1VmJOd2RtMG1ZY3ZmQTQ3U3ZqMXVTbEM0b1NSUy9DOGxu?=
 =?utf-8?B?N0dMc0krL0d1cXJPTVcwNDllaC8yQy8yTjFZR0djOGc4RGZ2aUdVRmN6VzVG?=
 =?utf-8?B?Z0VNWDlQWGNTZnpiQlpsNXM5dEpwekFIRkFpL3FEU2ZVdlNiSFNsSStHK1JD?=
 =?utf-8?B?NUlyampyZWpCYWNEQ1dZMTJUT2xtZ2NMZlQrb0ZjdzhveVhvMVJBQTJwNm9F?=
 =?utf-8?B?Z0tHZGhJVnVCeEFrTW5EMFpuUFNGbFdjY1dydzB1TVBicUhEOXRIR0lkS05o?=
 =?utf-8?B?VXJoUFBsZWJOWnp6a2JaRFRaRHNRWStjUnVtMWlsbVVjQS9ia0dyUXlWTEdQ?=
 =?utf-8?B?LzB2N1Z0VThKS0dWcHFSaUhiTnpZWG1KMUw5NUNDYVYxVTVXM2tFamswNVpr?=
 =?utf-8?B?QVZvdHlta1RLcUVxV1hRQ1h1RkJMdmdPNThDenNla0o0QjNabFNKUTNWM0Jk?=
 =?utf-8?B?dGRJTnlMYXAyYksxWmNaQkVFMFBsblVhVm9EckoyM2NsWFpyMjVCUS9OYkVS?=
 =?utf-8?B?UGp4Q2xWREthRUw0Z3RXckJJNVJ2L25mVVVRQzRSVTEwYmQwQTVXc242Wi90?=
 =?utf-8?B?V0N3WnZtNXNkNDJFUTdHVW4zTSs5VmJpeDUreEQ1ZHllN2Vqdm4yeWpwenFp?=
 =?utf-8?B?QUc0L25OTFBrSy9qcm5zaUhkZU4xTVZoRGc0YzFCQ2hEK0JZMW9OeHd6Rktv?=
 =?utf-8?Q?UN5sy0ZnIeuTmZ2WYJZvRxnDu?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c541186b-a439-4342-4e27-08dca2395274
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 06:10:25.9433
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7KIvklO5rZ+VVK2+o0a1wkpCNz6HvTHFksC92xVBEuHfWfLT32aM2Mto2KsnZeHh3rO9TmWWV9+csfLIYdmX5SzAsQehS4OA9qof3wccMXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1400

SGkgTmljb2xhcw0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE5pY29s
YXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAY29sbGFib3JhLmNvbT4NCj4gU2VudDogRnJp
ZGF5LCBKdW5lIDIxLCAyMDI0IDI6MzMgQU0NCj4gVG86IERldmFyc2ggVGhha2thciA8ZGV2YXJz
aHRAdGkuY29tPjsgamFja3Nvbi5sZWUNCj4gPGphY2tzb24ubGVlQGNoaXBzbm1lZGlhLmNvbT47
IG1jaGVoYWJAa2VybmVsLm9yZzsNCj4gc2ViYXN0aWFuLmZyaWNrZUBjb2xsYWJvcmEuY29tDQo+
IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5l
bC5vcmc7DQo+IGh2ZXJrdWlsQHhzNGFsbC5ubDsgTmFzIENodW5nIDxuYXMuY2h1bmdAY2hpcHNu
bWVkaWEuY29tPjsgbGFmbGV5LmtpbQ0KPiA8bGFmbGV5LmtpbUBjaGlwc25tZWRpYS5jb20+OyBi
LWJybmljaEB0aS5jb207IEx1dGhyYSwgSmFpIDxqLWx1dGhyYUB0aS5jb20+Ow0KPiBWaWJob3Jl
IDx2aWJob3JlQHRpLmNvbT47IERocnV2YSBHb2xlIDxkLWdvbGVAdGkuY29tPjsgQXJhZGh5YSA8
YS0NCj4gYmhhdGlhMUB0aS5jb20+OyBSYWdoYXZlbmRyYSwgVmlnbmVzaCA8dmlnbmVzaHJAdGku
Y29tPg0KPiBTdWJqZWN0OiBSZTogW1JFU0VORCBQQVRDSCB2NiAyLzRdIG1lZGlhOiBjaGlwcy1t
ZWRpYTogd2F2ZTU6IFN1cHBvcnQgcnVudGltZQ0KPiBzdXNwZW5kL3Jlc3VtZQ0KPiANCj4gTGUg
amV1ZGkgMjAganVpbiAyMDI0IMOgIDE5OjUwICswNTMwLCBEZXZhcnNoIFRoYWtrYXIgYSDDqWNy
aXTCoDoNCj4gPiBIaSBOaWNvbGFzLA0KPiA+DQo+ID4gT24gMjAvMDYvMjQgMTk6MzUsIE5pY29s
YXMgRHVmcmVzbmUgd3JvdGU6DQo+ID4gPiBIaSBEZXZhcnNoLA0KPiA+ID4NCj4gPiA+IExlIGpl
dWRpIDIwIGp1aW4gMjAyNCDDoCAxNTowNSArMDUzMCwgRGV2YXJzaCBUaGFra2FyIGEgw6ljcml0
wqA6DQo+ID4gPiA+IEluIG15IHZpZXcgdGhlIGRlbGF5ZWQgc3VzcGVuZCBmdW5jdGlvbmFsaXR5
IGlzIGdlbmVyYWxseSBoZWxwZnVsDQo+ID4gPiA+IGZvciBkZXZpY2VzIHdoZXJlIHJlc3VtZSBs
YXRlbmNpZXMgYXJlIGhpZ2hlciBmb3IgZS5nLiB0aGlzIGxpZ2h0DQo+ID4gPiA+IHNlbnNvciBk
cml2ZXIgWzJdIHVzZXMgaXQgYmVjYXVzZSBpdCB0YWtlcyAyNTBtcyB0byBzdGFiaWxpemUNCj4g
PiA+ID4gYWZ0ZXIgcmVzdW1wdGlvbiBhbmQgSSBkb24ndCBzZWUgdGhpcyBiZWluZyB1c2VkIGlu
IGNvZGVjIGRyaXZlcnMNCj4gPiA+ID4gZ2VuZXJhbGx5IHNpbmNlIHRoZXJlIGlzIG5vIHN1Y2gg
bGFyZ2UgcmVzdW1lIGxhdGVuY3kuIFBsZWFzZSBsZXQNCj4gPiA+ID4gbWUga25vdyBpZiBJIGFt
IG1pc3Npbmcgc29tZXRoaW5nIG9yIHRoZXJlIGlzIGEgc3Ryb25nIHJlYXNvbiB0byBoYXZlDQo+
IGRlbGF5ZWQgc3VzcGVuZCBmb3Igd2F2ZTUuDQo+ID4gPg0KPiA+ID4gSXQgc291bmRzIGxpa2Ug
eW91IGRpZCBwcm9wZXIgc2NpZW50aWZpYyB0ZXN0aW5nIG9mIHRoZSBzdXNwZW5kDQo+ID4gPiBy
ZXN1bHRzIGNhbGxzLCBtaW5kIHNoYXJpbmcgdGhlIGFjdHVhbCBkYXRhID8NCj4gPg0KPiA+IE5v
cGVzLCBJIGRpZCBub3QgZG8gdGhhdCBidXQgeWVzIEkgYWdyZWUgaXQgaXMgZ29vZCB0byBwcm9m
aWxlIGFuZA0KPiA+IGV2YWx1YXRlIHRoZSB0cmFkZS1vZmYgYnV0IEkgYW0gbm90IGV4cGVjdGlu
ZyAyNTBtcyBraW5kIG9mIGxhdGVuY3kuIEkNCj4gPiB3b3VsZCBzdWdnZXN0IEphY2tzb24gdG8g
ZG8gdGhlIHByb2ZpbGluZyBmb3IgdGhlIHJlc3VtZSBsYXRlbmNpZXMuDQo+IA0KPiBJJ2QgY2xl
YXJseSBsaWtlIHRvIHNlZSBudW1iZXJzIGJlZm9yZSB3ZSBwcm9jZWVkLg0KPiANCg0KSSBtZWFz
dXJlZCBsYXRlbmN5IGZvciB0aGUgcmVzdW1lIGFuZCBzdXNwZW5kIG9mIG91ciBodyBibG9jay4N
Cg0KUmVzdW1lIDogMTI0IG1pY3Jvc2Vjb25kDQpTdXNwZW5kIDogMzU1IG1pY3Jvc2Vjb25kDQoN
CkkgdGhpbmsgaWYgdGhlIGRlbGF5IGlzIDEwMG1zLCBpdCBpcyBlbm91Z2guDQpIb3cgYWJvdXQg
dGhpcyA/DQoNCj4gPg0KPiA+IEJ1dCBwZXJoYXBzIGEgc2VwYXJhdGUgaXNzdWUsIEkgZGlkIG5v
dGljZSB0aGF0IGludGVudGlvbiBvZiB0aGUNCj4gPiBwYXRjaHNldCB3YXMgdG8gc3VzcGVuZCB3
aXRob3V0IHdhaXRpbmcgZm9yIHRoZSB0aW1lb3V0IGlmIHRoZXJlIGlzIG5vDQo+ID4gYXBwbGlj
YXRpb24gaGF2aW5nIGEgaGFuZGxlIHRvIHRoZSB3YXZlNSBkZXZpY2UgYnV0IGV2ZW4gaWYgSSBj
bG9zZQ0KPiA+IHRoZSBsYXN0IGluc3RhbmNlIEkgc3RpbGwgc2VlIHRoZSBJUCBzdGF5cyBvbiBm
b3IgNXNlY29uZHMgYXMgc2VlbiBpbg0KPiA+IHRoaXMgbG9ncyBbMV0gYW5kIHRoaXMgcGVyaGFw
cyBjb3VsZCBiZSBiZWNhdXNlIGV4dHJhIHBtIGNvdW50ZXIgcmVmZXJlbmNlcw0KPiBiZWluZyBo
b2xkLg0KPiANCj4gTm90IHN1cmUgd2hlcmUgdGhpcyBjb21lcyBmcm9tLCBJJ20gbm90IGF3YXJl
IG9mIGRyaXZlcnMgZG9pbmcgdGhhdCB3aXRoIE0yTQ0KPiBpbnN0YW5jZXMuIE9ubHkNCj4gDQo+
ID4NCj4gPiBbMjAyNC0wNi0yMCAxMjozMjo1MF0gRnJlZWluZyBwaXBlbGluZSAuLi4NCj4gPg0K
PiA+IGFuZCBhZnRlciA1IHNlY29uZHMuLg0KPiA+DQo+ID4gWzIwMjQtMDYtMjAgMTI6MzI6NTVd
IHwgICAyMDQgICAgIHwgQU02MkFYX0RFVl9DT0RFQzAgfCBERVZJQ0VfU1RBVEVfT04gfA0KPiA+
IFsyMDI0LTA2LTIwIDEyOjMyOjU2XSB8ICAgMjA0ICAgICB8IEFNNjJBWF9ERVZfQ09ERUMwIHwg
REVWSUNFX1NUQVRFX09GRg0KPiA+DQo+ID4gWzFdOiBodHRwczovL2dpc3QuZ2l0aHViLmNvbS9k
ZXZhcnNodC8wMDkwNzVkODcwNjAwMWY0NDc3MzNlZDg1OTE1MmQ5MA0KPiANCj4gQXBwYXJ0IGZy
b20gdGhlIDVzIGJlaW5nIHRvbyBsb25nLCB0aGF0IGlzIGV4cGVjdGVkLiBJZiBpdCBmYWlscyBh
ZnRlciB0aGF0LA0KPiB0aGlzIGlzIGEgYnVnLCB3ZSB3ZSBzaG91bGQgaG9sZCBvbiBtZXJnaW5n
IHRoaXMgdW50aWwgdGhlIHByb2JsZW0gaGFzIGJlZW4NCj4gcmVzb2x2ZWQuDQo+IA0KDQpBZnRl
ciA1c2VjLCB0aGUgaHcgZ29lcyB0byBzdXNwZW5kLiBTbyB0aGVyZSBpcyBubyBidWcgaW4gdGhl
IGN1cnJlbnQgcGF0Y2gtc2V0Lg0KDQoNClRoYW5rcw0KDQoNCj4gSW1hZ2luZSB0aGF0IHVzZXJz
cGFjZSBpcyBnb2luZyBnYXBsZXNzIHBsYXliYWNrLCBpZiB5b3UgaGF2ZSBhIGxldHMgc2F5IDMw
bXMNCj4gb24gZm9yY2VkIHN1c3BlbmQgY3ljbGUgZHVlIHRvIGNsb3NlL29wZW4gb2YgdGhlIGRl
Y29kZXIgaW5zdGFuY2UsIGl0IHdvbid0DQo+IGFjdHVhbGx5IGVuZHVwIGdhcGxlc3MuIFRoZSBk
ZWxheSB3aWxsIGVuc3VyZSB0aGF0IHdlIG9ubHkgc3VzcGVuZCB3aGVuDQo+IG5lZWRlZC4NCj4g
DQo+IFRoZXJlIGlzIG90aGVyIGNoYW5nZXMgSSBoYXZlIGFza2VkIGluIHRoaXMgc2VyaWVzLCBz
aW5jZSB3ZSBhbHdheXMgaGF2ZSB0aGUNCj4gY2FzZSB3aGVyZSB1c2Vyc3BhY2UganVzdCBwYXVz
ZSBvbiBzdHJlYW1pbmcsIGFuZCB3ZSB3YW50IHRoYXQgcHJvbG9uZ2VkDQo+IHBhdXNlZCBsZWFk
IHRvIHN1c3BlbmQuIEhvcGVmdWxseSB0aGlzIGhhcyBiZWVuIHN0cm9uZ2x5IHRlc3RlZCBhbmQg
aXMgbm90DQo+IGp1c3QgYWRkZWQgZm9yICJjb21wbGV0ZW5lc3MiLg0KPiANCj4gSXRzIGltcG9y
dGFudCB0byBub3RlIHRoYXQgaGFzIGEgcmV2aWV3ZXIgb25seSwgbXkgdGltZSBpcyBsaW1pdGVk
LCBhbmQgSQ0KPiBjb21wbGV0ZWx5IHJlbHkgb24gdGhlIGF1dGhvciBqdWRnbWVudCBvZiBkZWxh
eSB0dW5pbmcgYW5kIGFjdHVhbCB0ZXN0aW5nLg0KPiANCj4gTmljb2xhcw0KPiANCj4gPg0KPiA+
IFJlZ2FyZHMNCj4gPiBEZXZhcnNoDQoNCg==

