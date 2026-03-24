Return-Path: <linux-media+bounces-56780-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIHTH8HcwWnxXQQAu9opvQ
	(envelope-from <linux-media+bounces-56780-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:37:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB0F2FFC1A
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 01:37:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FF5F302E905
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 00:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 443143002D8;
	Tue, 24 Mar 2026 00:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="XsiKeZpW"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022075.outbound.protection.outlook.com [40.107.43.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2611E47CC;
	Tue, 24 Mar 2026 00:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312362; cv=fail; b=hGLc9xCsgIZvHT3OFcdZBtrmbxy/DdhNWnb7AUOocxubd1+QcGDXxONycx7kaI4irOPgHKkbDtFJ7GwSYBcJC0/PvAbhZIXcqz3snX/eGIezJmaFrkfyy898WIKfPkv3ftH/QEfn3nHmEGI3c0xAhQMy8eAmN3hZapa8QF0MXwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312362; c=relaxed/simple;
	bh=/7eMXbkcYbgTT+9jnKagMcVzr+rUiAUTIHHUzLvVVyA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GcYXjeC4blTPK3OnEVYC4zCdrx7nPcpd8ZBJF5vzuflqa4KJfHq3uNgYN8PMXeeNPiKmqhdoPNQNPcCshXZRSJ3+xgi6RMOU8UOm1V61kxljDVpMJa4uImm+ejgMXBskk3mda5sBhpRphL1y7kdA9xtU9lnQ/RKgAvU1GfScpE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=XsiKeZpW; arc=fail smtp.client-ip=40.107.43.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FHUNmuMvfSTXO1PM8Yy/bhcZGXryZ3ypRWRYFUOafw19zHJibyCnrFnE0Xi2Da0z2Y9tQvlHMhSSxngFTHLwGYcyrANVWGzYdJBek4H0FJFYR51OHEMMf7+w/nhGjzzm0rS5QdVkmG6PeI6N5tjLXEUfQy5EhDNQXKw6U249zEjsNZTBEP3+ZD3BVGX5qyf444WxffMzuccgCclD4yW2n37eccN5VaBiqH49oZWB9M6lCdztWwDBvVcTT45oVJ/iQHrqMTX7NGE28cZ3VCBsjqBoVRVmDU6rZLmt1ANxKcSGQiN81optQ84Kh8DbUE04n+j73vRyoXa7YwYv7BI+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/7eMXbkcYbgTT+9jnKagMcVzr+rUiAUTIHHUzLvVVyA=;
 b=W0iVg39L7MO/Z5GjF+dRYBD8cmY45Ztb3OForsJ5aHq75cfVpZqR6pdHdtxli6naWPfauce/FfDDPuwNQkg2R9wJ3gMXJTFIbC7ELLRt+3aRYh19UQKap8JOu3knJ/LzsC05lRgnUbnLrDlX4xWluGgqtlK6seyv9l4skOPWj5wbuoU44N/u/0U3vbUwbKOZpb7sod7lu6w8uXQ5zHw8yTBI4+cqRj1ho/cz9sh1JV7uySS8Z4CTGc8KlhaOxrq6Y+2Yckw5ysBva6xOq8/0Y+g0MOjonaaWIgowOIlRDwu598jzBY7RoFk/J8GkVu6ZvU/AMECbzWy63y4B40dgAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/7eMXbkcYbgTT+9jnKagMcVzr+rUiAUTIHHUzLvVVyA=;
 b=XsiKeZpWqFEVYD922upcmN5CHsG4gNze4pgb5zVXZ07tJY0OlhraBPVXpKr2pF4jtwH1n3LGTnCJOrnYPUj2gRKhiPyoV7bOOdQC+hG3MSRZ/EUUYcGKUkvi7Mk3EL/2JW8HJjLxkCogG/J9iNeizNVtd9FhAFT4xg5ZO/MlZOc=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 PU4P216MB2187.KORP216.PROD.OUTLOOK.COM (2603:1096:301:129::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Tue, 24 Mar 2026 00:32:36 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 00:32:36 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Brandon Brnich <b-brnich@ti.com>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas
 Chung <nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v0 2/3] media: chips-media: wave5: Support CBP profile
Thread-Topic: [PATCH v0 2/3] media: chips-media: wave5: Support CBP profile
Thread-Index: AQHct2HB8OoboXpSEUad+EELARE8Y7W1yj4AgADXAtCABb7RAIAAfElw
Date: Tue, 24 Mar 2026 00:32:36 +0000
Message-ID:
 <SLXP216MB1148C5987146C9D98B5BAA70ED48A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20260319053210.90-1-jackson.lee@chipsnmedia.com>
 <20260319053210.90-3-jackson.lee@chipsnmedia.com>
 <5d1cf57fcfa10d224b05f6f1fe5bb33979dce750.camel@collabora.com>
 <PU4P216MB11491F8F792A075D77749805ED4CA@PU4P216MB1149.KORP216.PROD.OUTLOOK.COM>
 <f1b92f5b-c21c-44c0-a711-251e49b69114@ti.com>
In-Reply-To: <f1b92f5b-c21c-44c0-a711-251e49b69114@ti.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|PU4P216MB2187:EE_
x-ms-office365-filtering-correlation-id: 05f02ada-0896-4989-2e4e-08de893cd8c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 Z3r2PS/f6V6G1/vmPw7kGtXPHSWicHQPviRuMYpbxhJo7rNQSqM9fuHv8zjwft/CTb/Yj/+6jLeTBJB2dKDxR/uTGrl18kN2WottE4xhOe82/LfihlQ0r427I2NVwvoHyKd98nvg1T9kzHocu58zM6penC12biK0YoNKHvnIHABqvz1XmR1F8mlysxDa41U7JScdgJ4Jk6dT8i7eZcEZKnxHiwMQ932M8+NPkMUKqkf6xQ43p3X4EtSqLlBULn/TbrImeGcR0n8aUFkvMImkK4i9lTjjIBfjtAoGOZIrceO2Wp10Qjrimlvul7dzc7nwG8iTyXCQhnKr5Y+CIkAvYijqV6Es80roEcXnImBqiKo9+KhCTsYBJwYgBdsPvEH1MJPGlP0sTFjkXOtuEgFGKfXqWSK5HZByLd+AiMbfqgh6j395n1RTeTNG6/7bxwj+U+j/a7D6JJHQLa5Ya0E1CCCAttIm4TMqVuSa5IwdhS/18Qxo4QMrJoMgRX+BNAWaHXMBdhk15eRFeFE7dyYNbq6SXxkPuwWzczDGM1BrkiblCevuMNYwMHXr1vMQZ0eLS3aXud2T3FSX0CWDViHJBwJmQHEI5MrVz9OaQTsCNOmvF7ghN76fvXuJr82IFGO0R1uGqxehQPz6/b1r7eU/ilbIA/C/M8xDCo7PI9XOGYAl6jFCEogY+e5USXKqHRIZQLNYL6eLk7/apFaa2BVwggZAewuLFGaAO+Jtj4BFf9unpp1uL/oGrifoJN+WSCgGqyJo6tHxRwwSqnMrTOxUUzk2TI1BaeQ0efyOLYOgMK8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ajZ0aDN6SXJqMmFQcmRTcGkzY0NCeEpLWlVWNTRQby9KRHhQbFdLU29KcW9h?=
 =?utf-8?B?cytEelFIeFY0UlhubVRPTG9ETjR0eTl3R2tXQzIyZXpuSGNVaU1HQ0tWdzdn?=
 =?utf-8?B?M1FJbDlJWU84MEpoV09mL29wa2NlTGlVTENNTGRoMHJNSFEwdDFkUGRMM2JC?=
 =?utf-8?B?MzJFREgwN1pweTNRTkhiRjJCRmRuWFpnOENWamVLMC94ZmFUQzduT04vSG9J?=
 =?utf-8?B?eDlDRmxkeGdMZ05MQWVReUFOdk5IaHF0MG1BRjFQekg4a1hzUFRtWjdNQU9L?=
 =?utf-8?B?c215VHhOUkZCUjFZMDBhcy9MYjd6WmlYS2wrZnczUEtjaEhpOHZWRUFVZk0z?=
 =?utf-8?B?VC90amg1SjgwQk14NG5pWmQzbXVzK3FBUUpDQm94RSsva2t6dlF5WEZscXY1?=
 =?utf-8?B?eVlXRXYzR0hXdUk2Mm5TK01LUnpiSVU4YnEwd3lsQ0JJU3VGNWFqY3FNMjNL?=
 =?utf-8?B?Wkl6T09CUFZSUUg0MmppNzZXK3dIY0J5QlJ4UllMOTJibUpiTzBQdHZKanNu?=
 =?utf-8?B?UVZ2QWk0ZVR2dVJaRVFoK2hqcVNKVFF6TDN4NW5ybzNLNkY1TzNUSjVyczVD?=
 =?utf-8?B?aDJCSEtUeWRmaC9tVitxR1R4WHF4ckt5N3RQYXJuMW41MXpGQ2lwenVJRmhH?=
 =?utf-8?B?SzlUcWZzc1Q1eno4UU13SzJTYlJEUFlWSVY0ZEFSTXRzdGwwcGdKV3JIM2kr?=
 =?utf-8?B?Y3F1OXNUNS9vRWJLRHd0b1dmak94S05ZSXFZZHpabjkxL0lvTmt4TlBXcHhs?=
 =?utf-8?B?QW9vVFlRYlBGdEhVRkxqZFRqZ0VyZXpwU1NWM3FIWlNjeTZxcmdCS2ZicWRS?=
 =?utf-8?B?MFlFSDJaeC9GYXl1Qm1uaktOY2VIemFtZ2VxVXUweURGWEZiZWdVZ3poL01L?=
 =?utf-8?B?eEcxWFMwUXFjUXUybS9IOUcwZjNkckFuKzNGRmg3YWZmUVo4c0VLK1RDS01w?=
 =?utf-8?B?Rkp2ZnFDL1o3OEdRbEFHSFhQWVA5aEpOUE8rNm02NlpNWHBySGcwenhXcWgz?=
 =?utf-8?B?SlNJWlVlMGw5WGpqZ1prRmtTem1DOUNsSTZzRjJycFpnM0JwZ1FVbEZnSlpK?=
 =?utf-8?B?NFlMSEtIZjNHdzlKUHJ2a1ZhRjJvRzNPNmZ5b3l3Q0huajdmVlprOWM5bEpw?=
 =?utf-8?B?MDVrMzdXeHN4RW4yR1hxZHNtbVltdXlBWHhSWWpzSlFNVWdFVW9RbXNKd1pO?=
 =?utf-8?B?RlJCakh0TExKNVg4NTltVGhsRmVQVzhXeWFoYUQySThsLzUxakNMaHk4eG1H?=
 =?utf-8?B?aTBuQmlJcTZaekN2Rm9MUWVNMDlLRUpzWVMrcEFoSitIRnlYUlZQazA5WW5t?=
 =?utf-8?B?NU5xcDB6ZnR2NnBOTnl1ZWxEYjhtVXgyb2p1WFl4UFh6YWlPRVNBdEtDVk1U?=
 =?utf-8?B?UDBYbUtNcHJtamxHWGpEeEw3RFdhQkRCUGJqWURuTE9naER0eWZYdW9lUU1X?=
 =?utf-8?B?MVo1VFVvOGl2Y0pqYUNXWFpocTVPNUVIc2hFaTdtakVFcGlqanVFSTVLcG1v?=
 =?utf-8?B?Vko1bmxSc2NzQXVzVUF2a0FZTUxQYXpNQVZvYjNuNSt3K1JGcnMxRGVWSlln?=
 =?utf-8?B?Q1hEZGJ1UmtJcENJOWozNDJENDJSYzVUN0VqU3YrOHUxN2hVbnBsYmhXZzE1?=
 =?utf-8?B?SHlacDJzQTR0a2w2RzE4clZUZjk5dHhKY28wZ2JMVHMxcHNWYVJCazUwNFZW?=
 =?utf-8?B?VjUrYnFMNmpIMEJ2MC9qa3JpaTVLSGhaYmh5QXllQkVweXQyUmh5SVJEem9z?=
 =?utf-8?B?dlpwY0Z4L2xzOWFzbUk1MFRIVlZjZzdSUVBtTmc5ODU5ZXhldXZRaDVMcGpG?=
 =?utf-8?B?OWxGWFkzeWxSeUtibERyeVk1KzJERjMwZCtCQ3NPcC9XNWxhbWdSMFFwdkpM?=
 =?utf-8?B?a3dHU0FDNUZXWG5YR2YrdFZFQlR3Zm9UVnFWRzF3VVMxRVlmUm1ZaGlKZWYz?=
 =?utf-8?B?SXc0VHpwUWtrMVI3SnRpbmNTN1FBdEdZU0tWcjhlNHBsUllRSjMwUXQ5azNN?=
 =?utf-8?B?bDdiNzh0Smw1SHJhY0dERWl6YStlUTcxRmJqYUlIU3BpUTJkaTZrWUl1SE12?=
 =?utf-8?B?S3dkdzQ4dnZXVG5pV2pzMDVDUkNZaTF4Y0wrUmcrUURYTisyb1d0R3ozOVU4?=
 =?utf-8?B?dlVZRUNicUxNc1VtYitTRG1MZW9sQzZBYUVqbVE0VTM0c0pYcGV0NnJXdDZE?=
 =?utf-8?B?QWxwS0dQb2hxOFR2UFpBZnFEdGdtNjZGOGdFTis5eHp3RHI3d3hMdkM4SlhQ?=
 =?utf-8?B?ZGJTckg0MzU5VUxKT0toVVVmTTNsMllHVkgzeDhPUUQ3bWszMEF3UE5DbEZp?=
 =?utf-8?B?djlIcnZmb1BIaTZoZnRFTEU4OERZWEhDc1pkazRoRG5kK3k3QWt5dz09?=
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
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f02ada-0896-4989-2e4e-08de893cd8c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 00:32:36.0840
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mFirMvigWu2uNDgSx/Yc+aV4RrClJRCYetUDU7GJHtL/1wbIbH/1ilsLfiehFjfhCZSAYSfePPfsrLuSxDcZ+nBNeN0j6XPsO/qxC7tRnCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2187
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56780-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[ti.com,collabora.com,kernel.org,xs4all.nl];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,xs4all.nl];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	NEURAL_HAM(-0.00)[-0.873];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chipsnmedia.com:dkim]
X-Rspamd-Queue-Id: 1DB0F2FFC1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQnJhbmRvbg0KDQo+IFRoZSBhYm92ZSBjb2RlIGJyZWFrcyBzZXR0aW5nIEdPUCBzaXplIGZv
ciB0aGUgQVZDIGNhc2UuIEFueSByZWFzb24gdGhpcw0KPiBzaG91bGRuJ3QgcmVtYWluIGp1c3Qg
YW4gaWYgZWxzZSB3aGVyZSB0aGUgZWxzZSBzZXRzIGJvdGggY29uc3RyYWludCBmbGFnDQo+IGFu
ZCBhdmMgcGVyaW9kPw0KPg0KPiBCZXN0LA0KPiBCcmFuZG9uDQo+DQoNCkdvb2QgY2F0Y2gsIEJy
YW5kb24uDQpZb3UncmUgcmlnaHQg4oCUIHRoZSBlbHNlLWlmIHN0cnVjdHVyZSBicmVha3MgYXZj
X2lkcl9wZXJpb2QgZm9yIEFWQy4NCkkndmUgY2hhbmdlZCBpdCB0byBhIHNpbmdsZSBlbHNlIGJs
b2NrIHRoYXQgc2V0cyBib3RoIGNvbnN0cmFpbnRfc2V0MV9mbGFnIGFuZCBhdmNfaWRyX3Blcmlv
ZC4NCmNvbnN0cmFpbnRfc2V0MV9mbGFnIGRlZmF1bHRzIHRvIDAgYW5kIGlzIG9ubHkgc2V0IHRv
IDEgaW4gc19jdHJsIHdoZW4gQ09OU1RSQUlORURfQkFTRUxJTkUgaXMgc2VsZWN0ZWQsIHNvIHRo
aXMgaXMgc2FmZSBmb3IgYWxsIEFWQyBwcm9maWxlcy4NCg0KVGhhbmtzDQpKYWNrc29uDQpbQyZN
XQ0KSU1QT1JUQU5UIE5PVElDRQ0KDQpUaGUgY29udGVudHMgb2YgdGhpcyBlbWFpbCBtZXNzYWdl
IGFuZCBhbnkgYXR0YWNobWVudHMgYXJlIGludGVuZGVkIHNvbGVseSBmb3IgdGhlIGFkZHJlc3Nl
ZShzKSBhbmQgbWF5IGNvbnRhaW4gY29uZmlkZW50aWFsIGFuZC9vciBwcml2aWxlZ2VkIGluZm9y
bWF0aW9uIGFuZCBtYXkgYmUgbGVnYWxseSBwcm90ZWN0ZWQgZnJvbSBkaXNjbG9zdXJlLiBJZiB5
b3UgYXJlIG5vdCB0aGUgaW50ZW5kZWQgcmVjaXBpZW50IG9mIHRoaXMgbWVzc2FnZSBvciB0aGVp
ciBhZ2VudCwgb3IgaWYgdGhpcyBtZXNzYWdlIGhhcyBiZWVuIGFkZHJlc3NlZCB0byB5b3UgaW4g
c29tZSB1bmV4cGVjdGVkIHNpdHVhdGlvbiwgcGxlYXNlIGltbWVkaWF0ZWx5IG5vdGlmeSB0aGUg
c2VuZGVyIGJ5IHJlcGx5aW5nIGVtYWlsIGFuZCB0aGVuIGRlbGV0ZSB0aGlzIG1lc3NhZ2UgYW5k
IGFueSBhdHRhY2htZW50cy4gSWYgeW91IGFyZSBub3QgdGhlIGludGVuZGVkIHJlY2lwaWVudCwg
eW91IGFyZSBoZXJlYnkgbm90aWZpZWQgdGhhdCBhbnkgdXNlLCBkaXN0cmlidXRpb24sIGNvcHlp
bmcsIG9yIHN0b3JhZ2Ugb2YgdGhpcyBtZXNzYWdlIG9yIGl0cyBhdHRhY2htZW50cyBpcyBzdHJp
Y3RseSBwcm9oaWJpdGVkLg0K

