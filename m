Return-Path: <linux-media+bounces-47184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C8BBC620F3
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 03:07:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D10584E59BC
	for <lists+linux-media@lfdr.de>; Mon, 17 Nov 2025 02:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195FC23D7CF;
	Mon, 17 Nov 2025 02:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="NNooOmXF"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021087.outbound.protection.outlook.com [40.107.42.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADCA748F;
	Mon, 17 Nov 2025 02:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763345243; cv=fail; b=jk0tdunyeksjkQdBiv7HPeK5hA2+jjyVoHCnFSeiKqPoXvbnVba7OyHzUjKgwKc4zqAl1mL4OtJ6xFSDppc3B/KHHhEzbiTfs5FZ73Ed2gG8bNRNC2iQvx6EEuduo65SU7i3wyrZUdQoVm9i57h2hMv00qZH32cTr+bptSfjPos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763345243; c=relaxed/simple;
	bh=9SHCfePPPds1eKIbXegsYHodDzGPEy36WPj9vPGHJ/w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uQeOz1Gl8DLIGLZMojr38dWGnBxPVN/qV/JxjjriI0z2ybgdeltNMn3Gg0iYkB6JQ3VeB776ATkOmBvm6J3ZZvLbjufF7WJC8DYHSbNE04cyfh3UZ8TZA5ECvJye8fsUJTjJUKFQPJuXttsRPwingV61USNO6zJOxtnKgqjq/XU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=NNooOmXF; arc=fail smtp.client-ip=40.107.42.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqDlwNs/LQU+3v3bzk5oUsARpJPeMY04L2ZuiXHEkacGW32Ohb3xBOPno72DlIEOAPA6YAGTH++GSfX3c6VbbeG5EQAnrH3nBea6nXYkVJ5N8OVdyMdHj+ZQaZRJ084kJbVNO8+gzaoRJ+7Xwd9B1Z6/qEiXmzMKQkUOkbNNUM/OsRDmKC/HJ1/xmthnr2d6DBXzY7VcftktqISzZsAqBkp2/NoLmDy8G7DAHJ+gGJNwjfFiBjdf3hiadFB3Dc3cjNjC0Jx88ybXUDiZMPHTDR5dfsgNeI/069tjru2A8knl7j0az2P2TWxyHi8/HwZAB3mtEaPmJwAyqUHrBrTR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9SHCfePPPds1eKIbXegsYHodDzGPEy36WPj9vPGHJ/w=;
 b=hGUSjwxDqQHAFymAGMFPQKfanLQ7UB1Z8yvLmVOcGCbs6r1P1GjjP9R5CD8QGwgGT9SF1J+s35LZrXQqy+HsmpYI8G4HhdrJVsWVpzbWL9NJFSE9hl2kkbwjTD3VCp/SSNllhvVRiIcLKmyZh2gIVG7MJTn44By2Qbv7Zp0EdVBkk6sYdA0vIuJZuk4y8H5xMCr/NQZ3ZcAh6mdQUkFH/VIL3g4JOODF0FC4MhTv7nXiO6KYe6Th2liTnaW2ixdxuMYhgUrAiUgg+y4ybFYFsEYgPKZ4CGYRoP2w0wwCMQL3beACkfmmoPHI5bK5sl2gTD6Ph37B2dg3S3tjp6taQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9SHCfePPPds1eKIbXegsYHodDzGPEy36WPj9vPGHJ/w=;
 b=NNooOmXFAGet5EqJSY6X6Ls4iD+K2OHvfGOXGXJRAoTwJr8Orjyws7eGFO7zU2T4cfeMeQbHIZqL0QQqlIHQGGnjBDdjV2UKHOnxM2R+9USkWxQ23alF9U0/ra6/5j9kkw3J94GsZAJzBg8bOn/e/iNoI3KSgN0Z9bVepzEfl8s=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB2105.KORP216.PROD.OUTLOOK.COM (2603:1096:101:161::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.21; Mon, 17 Nov 2025 02:07:15 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 02:07:14 +0000
From: jackson.lee <jackson.lee@chipsnmedia.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, "mchehab@kernel.org"
	<mchehab@kernel.org>, "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
	"bob.beckett@collabora.com" <bob.beckett@collabora.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lafley.kim
	<lafley.kim@chipsnmedia.com>, "b-brnich@ti.com" <b-brnich@ti.com>,
	"hverkuil@xs4all.nl" <hverkuil@xs4all.nl>, Nas Chung
	<nas.chung@chipsnmedia.com>
Subject: RE: [PATCH v6 4/4] media: chips-media: wave5: Improve performance of
 decoder
Thread-Topic: [PATCH v6 4/4] media: chips-media: wave5: Improve performance of
 decoder
Thread-Index: AQHcVQUMfMLkP2/nE0iQ3EPWN8ouBLTxhlcAgASZ2sA=
Date: Mon, 17 Nov 2025 02:07:14 +0000
Message-ID:
 <SLXP216MB1148F3ED4920B12EECF84C03EDC9A@SLXP216MB1148.KORP216.PROD.OUTLOOK.COM>
References: <20251114012130.59-1-jackson.lee@chipsnmedia.com>
	 <20251114012130.59-5-jackson.lee@chipsnmedia.com>
 <6196c9fbbd0e45276baa192a510230a2a510626e.camel@collabora.com>
In-Reply-To: <6196c9fbbd0e45276baa192a510230a2a510626e.camel@collabora.com>
Accept-Language: ko-KR, en-US
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SLXP216MB1148:EE_|SE1P216MB2105:EE_
x-ms-office365-filtering-correlation-id: 404836e2-3c53-4c4c-b908-08de257e06f7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?VCtWaG9iYXFaTlpYbG1VT2tjVUsyUUc3b3NubUg2Zjl3YWdJK09GbmtubFRq?=
 =?utf-8?B?RTNITXpVVWJNcnlWZmxnUzJmaWZJLzU2V2FjejZWZEdYUHBHM3lTL2g0ekkz?=
 =?utf-8?B?L1U1Vy9NaVk1MFdmdmFvakMzZUltNENsQ1I0ZXgrWU9WaVNYb1FFNGRPVzRx?=
 =?utf-8?B?dnV6Q00rekcyc3hmYmZ0N3p2WFpIMUJ0VlFGb0xKYUdNNU1qLzJyaTErbVJZ?=
 =?utf-8?B?TnJDbGlqczhWb0YzdW5lRlFVZGIwY2I3VExIOWl0bFZJZDVBQUxvUkd3Y2ph?=
 =?utf-8?B?blZjank1SE1NOHQyWnJlWjk0NThxRi9tc0NGSHIzMGtHcjV2QjF6K2pEM2p0?=
 =?utf-8?B?TlloR2JmUnlNdUlubk9ONDdUOG4xQnhvZEI0SlFsS3ptRGloRUM5OTMyWGpz?=
 =?utf-8?B?NzJEcGM5SlMrOFZ2eFpLRlZkWk80SXJDemd5YWJkdUdJZjFpSkRZdEhmd0FP?=
 =?utf-8?B?akRpWGZWdkszd2Jxc283WUxRM1M3N2FRbzFDTng3MmlTTmltVUI0OHp5Wm1S?=
 =?utf-8?B?WjZwQisvdkxJcFZ0bkRmSXBVTS9PVGJ6Z2dCTDNhNWtlUk4ydDlYTzBjVHJV?=
 =?utf-8?B?TG5Fc2tGTi84THdjUTVaQmhBY3dUc1BIWDhOOEx2MzBVRW9CNGFiRTBoWng4?=
 =?utf-8?B?TzBVdmxLQ3RhSWt3dnplMmU3UGh2TlJsWVFxVWlaelM5SGVWNW0wNk5HN0hl?=
 =?utf-8?B?TXVjMG9UR3FRckNsNWtrNEJrOEJtMWxxYTcwWElPUFFTRkJubTdUOWpzWS9l?=
 =?utf-8?B?VlVtV2JLMmtHL2pxRldjblk1OXNCdXdjNlY4dXNZZW5TMGQyOXkrZkFWQThP?=
 =?utf-8?B?Y1lRL2RKekI2SWR3ajU5K2xXOGxJUjh0cVRsa1ZxSUhxaFMxMDRsQUJ5UExC?=
 =?utf-8?B?Si9Vb0hSL1RXc3JxTGRFblVubGVaV0wxQjNHMUJybTdFKzdnSGZrYkZxYkJY?=
 =?utf-8?B?aE5DeFozdzVpNWdYRmtPVjhQbFMxUjNvN1RmRWdaV3owWkUybGJMeGhaQkxM?=
 =?utf-8?B?OUdpZHJOV2pXc0Y4ZkVOMUtTVnRzMkx6bXUvWjFTUTVtWEtWNVorNEhvS2tU?=
 =?utf-8?B?dmIwbjhqSzJDU3l4L24wRHk5N0FJQmRvVEtyQU52SENINmRyZnB5Z3l6Z3py?=
 =?utf-8?B?eitDaFNPOUswaEFQY1FNKzlOUnhSSnk5ai9tdTduT2oxa3JJelRPbnkyNSth?=
 =?utf-8?B?VWU5K3lhNytpTzVEbCtuR2FISFpreVpYR0VhdGE3RTRNTFJQb0VVM09PeHhO?=
 =?utf-8?B?clk1V3J0eFZSU3RkcGVhMFJGVHhVancvNXYzSURlRzJ4aS9Ka29DcVdmVUtu?=
 =?utf-8?B?cjY0R1lQQ1JrVWlzdnBtTFJERkpIaFRHeVdGdmNZOGNEZlRFQldxYkxLM0VG?=
 =?utf-8?B?Wi9ocTJKTSt1WmJUQWpFZVhnY2VoMXlPVFJZa3Vtb2hSdnNiNEVlRm1ROXd1?=
 =?utf-8?B?em8yMWhiMFpJbm92dG9hS2VybFlQY2l1dzYvTUg2MFIzeTloUmtRT2tTanBK?=
 =?utf-8?B?OXRhVFU5MldqSkRHWi9Fam9zRlJiRGtwd2RtTDF2YXVTK1NSeE02UFAzUTR5?=
 =?utf-8?B?eEUyL1g5dlowYjFYSy9IYUFueFRLb1RmK0ZYblA3MGhnd1BZMjJBaWxJdEJw?=
 =?utf-8?B?UW41SklwYnhjU3NRWmtFUnF2SUgvRVJxWDdvQ0xZT3dMVjBvTHgzZS9sZkVG?=
 =?utf-8?B?OWlUL01BT2VxTnhybkxQL21pamVuYWc0bXhBdmliSnVMSTVEc2F6RHJLNHFP?=
 =?utf-8?B?aG5rY0xBejFCQmZDN0hOVkJaeUVtV2FyZnBaY3NaYlJmaDJjak95aFh1SG5y?=
 =?utf-8?B?OEhvd0xGUWp2S1EwUWNmNk4yMFJLRm5qd09ZOUZFTHJOOVNlMEM2UUx4NFRw?=
 =?utf-8?B?a3VqeTNmMFpmalNONTd3TDdDbytxRndpS0JOMS90QlAyU09vYUpheUlEalI1?=
 =?utf-8?B?MUZHaTNPbS81Z3MveVk0NXdvSXdEeERWeG12OVpCL1Rsa1dZVEtoZ0t0dDlk?=
 =?utf-8?B?NWNiSEgvbHlnVHc0a3ZzUWZtdkVYRDJaS1lQUzNjUEU2a21WRzFzaktyM21o?=
 =?utf-8?Q?BxOCT1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:ko;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTFBQ1ltMmFqZXRPbm9Fa0ZyekYzWnBzL2FJTlAxRGdHeHVFWGhRaHhzak8x?=
 =?utf-8?B?Mm8zNEUrNDFwZ3Nwdlh2RUV2cHFLT0g3UGtMTTJmQTZDNnJObGlvZlU1eE9P?=
 =?utf-8?B?ajBnWkZOeUVIWlRCSGpBMW55WjZpM0tKRlFPTDFJYXM2eHFnZk1pckc3bHFX?=
 =?utf-8?B?VjBkRkMvY3AzSmh5b1lURHRiODlBMEFTZTdsZmVJYmR4NktYby9Pek05enRm?=
 =?utf-8?B?cWF0ekptU3ZJQVJKYzg5UFp0ZGJuZ3FZYXI2ZXc2U1pndU42YUF2QUxid2FD?=
 =?utf-8?B?MElOeWZjQTc2NkxGc0lxT3I1MjdCNEpORFNPeWs1dllzMHhFU3h5aHc3ZE1l?=
 =?utf-8?B?TlRiZCtZOGRJM2Q2SW5CUjNUcTVMYUhwNlVzZUZ6UDBqUGxFNTcraXVkeTMr?=
 =?utf-8?B?cDlTbnhocEtNa2FMVTkrZXQwMHMwZWUvZWpNUGpFZEkrZUhmT0xNdEh4TjFC?=
 =?utf-8?B?Y0J6eXU4dDVUR0djMklHZmtmQ1g2bis4M2NQajd6ZXJRQk55NDNjbEduL3VC?=
 =?utf-8?B?Q0pybGZYT1N4SmFFREp1akVLVTVjMk4zVTlsT0hhc0YxVFRiSUxZVUhXb1I3?=
 =?utf-8?B?RmpPOU45enY3RlBCUDdpMzRTaHNjdzV4OXpWNncyUXl5NEhqWGdDTmliazJP?=
 =?utf-8?B?TFo5c0ZKRHlmNldIQ051V2FtaWRzaVdEdmRwMnh6dW1aSnc2NkZtbUhzWGxH?=
 =?utf-8?B?VUpZVTFXOVdreXZNLy9UK21IYmxDOVdOQ2tNZUN5N0hFVVFPUXFZZjhSNjV2?=
 =?utf-8?B?b3JWYmVRbUUxNUlPdUM0Y2pVUEMzdWIzaTF3VFVaK0xZRFNtWGtTNmNTcENj?=
 =?utf-8?B?aTNHbVZ1T3g5dUFsbjloOHk1WEhHRjYrQUxtUGdLZEVWMVR1NTdRcXhmdElP?=
 =?utf-8?B?TUxNaWNzRzQ0QmFvMmVXZXR0UkFEZG8vV1JYbXhidHhUUXpDYlhSRXdIY0FI?=
 =?utf-8?B?bnUwWmVtOFI5bSt1ZUNobjlVUVBxbE5jSHdNekR4Um5GVjVKUGJIMmpnRDFx?=
 =?utf-8?B?a0ppa2czQytJbFZxQmFPM0l4ZUxhcWM4Yks0eVVSVEhtVmNSWWFaS1BvNEp2?=
 =?utf-8?B?bXQrcjhyRVdHOWVJeXhjUXB2WmFQZnJRNUl0WnROakNLVXZvRHlISFkxM1pj?=
 =?utf-8?B?Z0ZkRUJuek5pQklzdGtZMkt3WU9EbE9OYWhoM0hvYXBVaHpNZUJFV0gzNE5M?=
 =?utf-8?B?VDhNd2ZqRDlPRWdaZklmNHlDV0J4cDJ1RkI0cHNKME5GbHE0N3lWNkpNQktx?=
 =?utf-8?B?dmwybC8zOGlldTNyS1dOOFFGZ05PaGR6VlM1NENWblUrVXU4bEc4VXZTK1BT?=
 =?utf-8?B?TUkxUk5oVEpXVmlKWEcyeWtvV09kcm91bUtQZjlPRVhXZklQdDFjQjViMzNQ?=
 =?utf-8?B?bmNhWHVSTjRKUDlQNEhuQWJYd2VWQW1mVDdwVERFcHNzMG10SjZMT0Z5Z1hO?=
 =?utf-8?B?QW5raTFoQnZjMm9iL1UxdEZNT2FaNmlRYk9lS0J3Z1pEWE5tNGNsS3J5dXR1?=
 =?utf-8?B?bEhjb01nZDRpVXFpSktGMTcyV3huU3gycFpWVHFqdlo1WFVFSDZCS1I5dEF0?=
 =?utf-8?B?anZWdStlVlBMS2FTNVY1cjQvMXd0MnQ4YzRtM1QvR2hjOHVZVlFyKzBlU3pV?=
 =?utf-8?B?alBvM0pLTmZWVnVjTGNXNmRtT2wwSlBhZ0I4QjVuWkErOVpwQ3lNUnBmcjFv?=
 =?utf-8?B?UnBSaTBlTTd6VERQUklDUnJxT3JOeG9URDB6Kzc1MktHcDVrcCtHWEZ1TFRB?=
 =?utf-8?B?Mmg5UG9iNDIzYnpMWGZiVmJxSU1TcXZQbUIyZkJVMTlrWXVucGhyb2Q2Rm5C?=
 =?utf-8?B?TWIzTnVMUEhzNlFJZnV1VUNnU0NsZHRaZTdaeUtsdjMrcnpJQUs1OEZmOE9J?=
 =?utf-8?B?ZDd6a1VNcFQ5T1VmbG9nMVZmMjQ3YnJ4dGJ6VFc5NVZlbUxYM3QzTVZBWlBF?=
 =?utf-8?B?WUVZckNnUlNKSTRQczdWS0JXU0gybjFpNkdTTEcvNE1BL0tLTk1ZdTdNczIv?=
 =?utf-8?B?T2VvZjZxeEg0MXFXUUl2c3czTmtMdDVBYjBBVHVyZXNZdFFNcmRHeC9zcDhC?=
 =?utf-8?B?b1NmZFkxTmQ3UmJtUDdBd0pnUkdmTUYrVjJrOGMxWFduRUNIZXhNNkJMcnlh?=
 =?utf-8?B?bmlCN0ZJZkV3b2htL044dGE2VGNuL3hLcXAvUGJFbm9tRFU2Q3JzNGhsMy9K?=
 =?utf-8?B?K3c9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 404836e2-3c53-4c4c-b908-08de257e06f7
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2025 02:07:14.5689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AOmyC4JaFIuiEKq2X6WSuaHynEHfxZzwlFRgGvITpi/5/C+UWNFpSJEGkwq4B3YC/T1jegIbJnTIIOlvQkOioxEka3rPJzMf3gf6UAwpgaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB2105

SGkgTmljb2FzDQoNCj4gPiDCoH0NCj4gPg0KPiA+IMKgc3RhdGljIGludCB3YXZlNV92cHVfZGVj
X3F1ZXJ5Y2FwKHN0cnVjdCBmaWxlICpmaWxlLCB2b2lkICpmaCwgc3RydWN0DQo+ID4gdjRsMl9j
YXBhYmlsaXR5ICpjYXApIEBAIC0xMTQyLDExICsxMTQxLDMxIEBAIHN0YXRpYyBpbnQNCj4gd3Jp
dGVfdG9fcmluZ2J1ZmZlcihzdHJ1Y3QgdnB1X2luc3RhbmNlICppbnN0LCB2b2lkICpidWZmZXIs
IHNpemVfdCBiDQo+ID4gwqAJcmV0dXJuIDA7DQo+ID4gwqB9DQo+ID4NCj4gPiArc3RhdGljIHN0
cnVjdCB2cHVfc3JjX2J1ZmZlciAqaW5zdF9zcmNfYnVmX3JlbW92ZShzdHJ1Y3QgdnB1X2luc3Rh
bmNlDQo+ID4gKyppbnN0KSB7DQo+ID4gKwlzdHJ1Y3QgdnB1X3NyY19idWZmZXIgKmI7DQo+ID4g
Kw0KPiA+ICsJaWYgKGxpc3RfZW1wdHkoJmluc3QtPmF2YWlsX3NyY19idWZzKSkNCj4gPiArCQly
ZXR1cm4gTlVMTDsNCj4gPiArCWluc3QtPnF1ZXVlZF9jb3VudC0tOw0KPiANCj4gVGhlIG9ubHkg
dXNlIG9mIHRoaXMgY291bnRlciBjYW4gYmUgcmVwbGFjZWQgd2l0aCBsaXN0X2VtcHR5KCkuDQo+
IA0KPiA+ICsJYiA9IGxpc3RfZmlyc3RfZW50cnkoJmluc3QtPmF2YWlsX3NyY19idWZzLCBzdHJ1
Y3QgdnB1X3NyY19idWZmZXIsDQo+IGxpc3QpOw0KPiA+ICsJbGlzdF9kZWwoJmItPmxpc3QpOw0K
PiA+ICsJYi0+bGlzdC5wcmV2ID0gTlVMTDsNCj4gPiArCWItPmxpc3QubmV4dCA9IE5VTEw7DQo+
ID4gKwlJTklUX0xJU1RfSEVBRCgmYi0+bGlzdCk7DQo+IA0KPiBUaGVzZSAzIGxpbmVzIGFib3Zl
IGFyZSBzaW1wbHk6DQo+IA0KPiAJbGlzdF9kZWxfaW5pdCgmYi0+bGlzdCk7DQo+IA0KPiA+ICsJ
aWYgKGluc3QtPnF1ZXVlZF9jb3VudCA9PSAwKSB7DQo+ID4gKwkJaW5zdC0+YXZhaWxfc3JjX2J1
ZnMucHJldiA9IE5VTEw7DQo+ID4gKwkJaW5zdC0+YXZhaWxfc3JjX2J1ZnMubmV4dCA9IE5VTEw7
DQo+ID4gKwkJSU5JVF9MSVNUX0hFQUQoJmluc3QtPmF2YWlsX3NyY19idWZzKTsNCj4gPiArCX0N
Cj4gDQo+IEkgZG9uJ3QgdGhpbmsgdGhpcyBpcyBuZWVkZWQsIG9uY2UgZW1wdHkgdGhhdCBsaXN0
X2VtcHR5KCkgY29uZGl0aW9uDQo+IHNob3VsZCBiZSBtZXQgYWdhaW4uDQoNCg0KDQpJIHdpbGwg
ZG8NCg0KPiANCj4gPiArCXJldHVybiBiOw0KPiA+ICt9DQo+ID4gKw0KPiA+IMKgc3RhdGljIGlu
dCBmaWxsX3JpbmdidWZmZXIoc3RydWN0IHZwdV9pbnN0YW5jZSAqaW5zdCkNCj4gPiDCoHsNCj4g
PiDCoAlzdHJ1Y3QgdjRsMl9tMm1fY3R4ICptMm1fY3R4ID0gaW5zdC0+djRsMl9maC5tMm1fY3R4
Ow0KPiA+IC0Jc3RydWN0IHY0bDJfbTJtX2J1ZmZlciAqYnVmLCAqbjsNCj4gPiAtCWludCByZXQ7
DQo+ID4gKwlzdHJ1Y3QgdnB1X3NyY19idWZmZXIgKnZwdV9idWY7DQo+ID4gKwlpbnQgcmV0ID0g
MDsNCj4gPg0KPiA+IMKgCWlmIChtMm1fY3R4LT5sYXN0X3NyY19idWYpwqAgew0KPiA+IMKgCQlz
dHJ1Y3QgdnB1X3NyY19idWZmZXIgKnZwdV9idWYgPQ0KPiA+IHdhdmU1X3RvX3ZwdV9zcmNfYnVm
KG0ybV9jdHgtPmxhc3Rfc3JjX2J1Zik7DQo+ID4gQEAgLTExNTcsOSArMTE3Niw4IEBAIHN0YXRp
YyBpbnQgZmlsbF9yaW5nYnVmZmVyKHN0cnVjdCB2cHVfaW5zdGFuY2UNCj4gKmluc3QpDQo+ID4g
wqAJCX0NCj4gPiDCoAl9DQo+ID4NCj4gPiAtCXY0bDJfbTJtX2Zvcl9lYWNoX3NyY19idWZfc2Fm
ZShtMm1fY3R4LCBidWYsIG4pIHsNCj4gPiAtCQlzdHJ1Y3QgdmIyX3Y0bDJfYnVmZmVyICp2YnVm
ID0gJmJ1Zi0+dmI7DQo+ID4gLQkJc3RydWN0IHZwdV9zcmNfYnVmZmVyICp2cHVfYnVmID0gd2F2
ZTVfdG9fdnB1X3NyY19idWYodmJ1Zik7DQo+ID4gKwl3aGlsZSAoKHZwdV9idWYgPSBpbnN0X3Ny
Y19idWZfcmVtb3ZlKGluc3QpKSAhPSBOVUxMKSB7DQo+ID4gKwkJc3RydWN0IHZiMl92NGwyX2J1
ZmZlciAqdmJ1ZiA9ICZ2cHVfYnVmLT52NGwyX20ybV9idWYudmI7DQo+ID4gwqAJCXN0cnVjdCB2
cHVfYnVmICpyaW5nX2J1ZmZlciA9ICZpbnN0LT5iaXRzdHJlYW1fdmJ1ZjsNCj4gPiDCoAkJc2l6
ZV90IHNyY19zaXplID0gdmIyX2dldF9wbGFuZV9wYXlsb2FkKCZ2YnVmLT52YjJfYnVmLCAwKTsN
Cj4gPiDCoAkJdm9pZCAqc3JjX2J1ZiA9IHZiMl9wbGFuZV92YWRkcigmdmJ1Zi0+dmIyX2J1Ziwg
MCk7IEBAIC0NCj4gMTIxOSw5DQo+ID4gKzEyMzcsMTIgQEAgc3RhdGljIGludCBmaWxsX3Jpbmdi
dWZmZXIoc3RydWN0IHZwdV9pbnN0YW5jZSAqaW5zdCkNCj4gPiDCoAkJCWRldl9kYmcoaW5zdC0+
ZGV2LT5kZXYsICJsYXN0IHNyYyBidWZmZXIgd3JpdHRlbiB0bw0KPiB0aGUgcmluZyBidWZmZXJc
biIpOw0KPiA+IMKgCQkJYnJlYWs7DQo+ID4gwqAJCX0NCj4gPiArDQo+ID4gKwkJaW5zdC0+cXVl
dWluZ19udW0rKzsNCj4gPiArCQlicmVhazsNCj4gPiDCoAl9DQo+ID4NCj4gPiAtCXJldHVybiAw
Ow0KPiA+ICsJcmV0dXJuIHJldDsNCj4gPiDCoH0NCj4gPg0KPiA+IMKgc3RhdGljIHZvaWQgd2F2
ZTVfdnB1X2RlY19idWZfcXVldWVfc3JjKHN0cnVjdCB2YjJfYnVmZmVyICp2YikgQEANCj4gPiAt
MTIzMyw3ICsxMjU0LDggQEAgc3RhdGljIHZvaWQgd2F2ZTVfdnB1X2RlY19idWZfcXVldWVfc3Jj
KHN0cnVjdA0KPiA+IHZiMl9idWZmZXIgKnZiKQ0KPiA+DQo+ID4gwqAJdnB1X2J1Zi0+Y29uc3Vt
ZWQgPSBmYWxzZTsNCj4gPiDCoAl2YnVmLT5zZXF1ZW5jZSA9IGluc3QtPnF1ZXVlZF9zcmNfYnVm
X251bSsrOw0KPiA+IC0NCj4gPiArCWxpc3RfYWRkX3RhaWwoJnZwdV9idWYtPmxpc3QsICZpbnN0
LT5hdmFpbF9zcmNfYnVmcyk7DQo+ID4gKwlpbnN0LT5xdWV1ZWRfY291bnQrKzsNCj4gPiDCoAl2
NGwyX20ybV9idWZfcXVldWUobTJtX2N0eCwgdmJ1Zik7DQo+ID4gwqB9DQo+ID4NCj4gPiBAQCAt
MTI4OCwxMCArMTMxMCwxNiBAQCBzdGF0aWMgdm9pZCB3YXZlNV92cHVfZGVjX2J1Zl9xdWV1ZShz
dHJ1Y3QNCj4gdmIyX2J1ZmZlciAqdmIpDQo+ID4gwqAJCV9fZnVuY19fLCB2Yi0+dHlwZSwgdmIt
PmluZGV4LCB2YjJfcGxhbmVfc2l6ZSgmdmJ1Zi0+dmIyX2J1ZiwNCj4gMCksDQo+ID4gwqAJCXZi
Ml9wbGFuZV9zaXplKCZ2YnVmLT52YjJfYnVmLCAxKSwgdmIyX3BsYW5lX3NpemUoJnZidWYtDQo+
ID52YjJfYnVmLA0KPiA+IDIpKTsNCj4gPg0KPiA+IC0JaWYgKHZiLT50eXBlID09IFY0TDJfQlVG
X1RZUEVfVklERU9fT1VUUFVUX01QTEFORSkNCj4gPiArCWlmICh2Yi0+dHlwZSA9PSBWNEwyX0JV
Rl9UWVBFX1ZJREVPX09VVFBVVF9NUExBTkUpIHsNCj4gPiArCQltdXRleF9sb2NrKCZpbnN0LT5m
ZWVkX2xvY2spOw0KPiA+IMKgCQl3YXZlNV92cHVfZGVjX2J1Zl9xdWV1ZV9zcmModmIpOw0KPiA+
IC0JZWxzZSBpZiAodmItPnR5cGUgPT0gVjRMMl9CVUZfVFlQRV9WSURFT19DQVBUVVJFX01QTEFO
RSkNCj4gPiArDQo+ID4gKwkJaWYgKGluc3QtPmVtcHR5X3F1ZXVlKQ0KPiA+ICsJCQlpbnN0LT5l
bXB0eV9xdWV1ZSA9IGZhbHNlOw0KPiA+ICsJCW11dGV4X3VubG9jaygmaW5zdC0+ZmVlZF9sb2Nr
KTsNCj4gPiArCX0gZWxzZSBpZiAodmItPnR5cGUgPT0gVjRMMl9CVUZfVFlQRV9WSURFT19DQVBU
VVJFX01QTEFORSkgew0KPiA+IMKgCQl3YXZlNV92cHVfZGVjX2J1Zl9xdWV1ZV9kc3QodmIpOw0K
PiA+ICsJfQ0KPiA+IMKgfQ0KPiA+DQo+ID4gwqBzdGF0aWMgaW50IHdhdmU1X3ZwdV9kZWNfYWxs
b2NhdGVfcmluZ19idWZmZXIoc3RydWN0IHZwdV9pbnN0YW5jZQ0KPiA+ICppbnN0KSBAQCAtMTM4
NSw2ICsxNDEzLDE3IEBAIHN0YXRpYyBpbnQgc3RyZWFtb2ZmX291dHB1dChzdHJ1Y3QNCj4gdmIy
X3F1ZXVlICpxKQ0KPiA+IMKgCWRtYV9hZGRyX3QgbmV3X3JkX3B0cjsNCj4gPiDCoAlzdHJ1Y3Qg
ZGVjX291dHB1dF9pbmZvIGRlY19pbmZvOw0KPiA+IMKgCXVuc2lnbmVkIGludCBpOw0KPiA+ICsJ
c3RydWN0IHZwdV9zcmNfYnVmZmVyICp2cHVfYnVmLCAqdG1wOw0KPiA+ICsNCj4gPiArCWluc3Qt
PnJldHJ5ID0gZmFsc2U7DQo+ID4gKwlpbnN0LT5xdWV1aW5nX251bSA9IDA7DQo+ID4gKwlpbnN0
LT5xdWV1ZWRfY291bnQgPSAwOw0KPiA+ICsJbXV0ZXhfbG9jaygmaW5zdC0+ZmVlZF9sb2NrKTsN
Cj4gPiArCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZSh2cHVfYnVmLCB0bXAsICZpbnN0LT5hdmFp
bF9zcmNfYnVmcywgbGlzdCkNCj4gew0KPiA+ICsJCXZwdV9idWYtPmNvbnN1bWVkID0gZmFsc2U7
DQo+ID4gKwkJbGlzdF9kZWwoJnZwdV9idWYtPmxpc3QpOw0KPiA+ICsJfQ0KPiA+ICsJbXV0ZXhf
dW5sb2NrKCZpbnN0LT5mZWVkX2xvY2spOw0KPiA+DQo+ID4gwqAJZm9yIChpID0gMDsgaSA8IHY0
bDJfbTJtX251bV9kc3RfYnVmc19yZWFkeShtMm1fY3R4KTsgaSsrKSB7DQo+ID4gwqAJCXJldCA9
IHdhdmU1X3ZwdV9kZWNfc2V0X2Rpc3BfZmxhZyhpbnN0LCBpKTsgQEAgLTE0NzAsNg0KPiArMTUw
OSw3IEBADQo+ID4gc3RhdGljIHZvaWQgd2F2ZTVfdnB1X2RlY19zdG9wX3N0cmVhbWluZyhzdHJ1
Y3QgdmIyX3F1ZXVlICpxKQ0KPiA+IMKgew0KPiA+IMKgCXN0cnVjdCB2cHVfaW5zdGFuY2UgKmlu
c3QgPSB2YjJfZ2V0X2Rydl9wcml2KHEpOw0KPiA+IMKgCXN0cnVjdCB2NGwyX20ybV9jdHggKm0y
bV9jdHggPSBpbnN0LT52NGwyX2ZoLm0ybV9jdHg7DQo+ID4gKw0KPiA+IMKgCWJvb2wgY2hlY2tf
Y21kID0gVFJVRTsNCj4gPg0KPiA+IMKgCWRldl9kYmcoaW5zdC0+ZGV2LT5kZXYsICIlczogdHlw
ZTogJXVcbiIsIF9fZnVuY19fLCBxLT50eXBlKTsgQEANCj4gPiAtMTQ4MCwxMSArMTUyMCwxMCBA
QCBzdGF0aWMgdm9pZCB3YXZlNV92cHVfZGVjX3N0b3Bfc3RyZWFtaW5nKHN0cnVjdA0KPiB2YjJf
cXVldWUgKnEpDQo+ID4gwqAJCXN0cnVjdCBkZWNfb3V0cHV0X2luZm8gZGVjX291dHB1dF9pbmZv
Ow0KPiA+DQo+ID4gwqAJCXdhdmU1X3ZwdV9kZWNfZ2l2ZV9jb21tYW5kKGluc3QsIERFQ19HRVRf
UVVFVUVfU1RBVFVTLA0KPiAmcV9zdGF0dXMpOw0KPiA+IC0NCj4gPiAtCQlpZiAocV9zdGF0dXMu
cmVwb3J0X3F1ZXVlX2NvdW50ID09IDApDQo+ID4gLQkJCWJyZWFrOw0KPiA+IC0NCj4gPiAtCQlp
ZiAod2F2ZTVfdnB1X3dhaXRfaW50ZXJydXB0KGluc3QsIFZQVV9ERUNfVElNRU9VVCkgPCAwKQ0K
PiA+ICsJCWlmICgoaW5zdC0+c3RhdGUgPT0gVlBVX0lOU1RfU1RBVEVfU1RPUCB8fA0KPiA+ICsJ
CcKgwqDCoMKgIGluc3QtPnN0YXRlID09IFZQVV9JTlNUX1NUQVRFX0lOSVRfU0VRIHx8DQo+ID4g
KwkJwqDCoMKgwqAgcV9zdGF0dXMuaW5zdGFuY2VfcXVldWVfY291bnQgPT0gMCkgJiYNCj4gPiAr
CQkJcV9zdGF0dXMucmVwb3J0X3F1ZXVlX2NvdW50ID09IDApDQo+ID4gwqAJCQlicmVhazsNCj4g
Pg0KPiA+IMKgCQlpZiAod2F2ZTVfdnB1X2RlY19nZXRfb3V0cHV0X2luZm8oaW5zdCwgJmRlY19v
dXRwdXRfaW5mbykpDQo+IEBADQo+ID4gLTE0OTgsNiArMTUzNyw4IEBAIHN0YXRpYyB2b2lkIHdh
dmU1X3ZwdV9kZWNfc3RvcF9zdHJlYW1pbmcoc3RydWN0DQo+IHZiMl9xdWV1ZSAqcSkNCj4gPiDC
oAllbHNlDQo+ID4gwqAJCXN0cmVhbW9mZl9jYXB0dXJlKHEpOw0KPiA+DQo+ID4gKwlpbnN0LT5l
bXB0eV9xdWV1ZSA9IGZhbHNlOw0KPiA+ICsJaW5zdC0+c2VudF9lb3MgPSBmYWxzZTsNCj4gPiDC
oAlwbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZChpbnN0LT5kZXYtPmRldik7DQo+ID4gwqB9DQo+
ID4NCj4gPiBAQCAtMTU3NiwxMyArMTYxNywyNCBAQCBzdGF0aWMgdm9pZCB3YXZlNV92cHVfZGVj
X2RldmljZV9ydW4odm9pZCAqcHJpdikNCj4gPiDCoAlzdHJ1Y3QgcXVldWVfc3RhdHVzX2luZm8g
cV9zdGF0dXM7DQo+ID4gwqAJdTMyIGZhaWxfcmVzID0gMDsNCj4gPiDCoAlpbnQgcmV0ID0gMDsN
Cj4gPiArCXVuc2lnbmVkIGxvbmcgZmxhZ3M7DQo+ID4NCj4gPiDCoAlkZXZfZGJnKGluc3QtPmRl
di0+ZGV2LCAiJXM6IEZpbGwgdGhlIHJpbmcgYnVmZmVyIHdpdGggbmV3DQo+IGJpdHN0cmVhbSBk
YXRhIiwgX19mdW5jX18pOw0KPiA+IMKgCXBtX3J1bnRpbWVfcmVzdW1lX2FuZF9nZXQoaW5zdC0+
ZGV2LT5kZXYpOw0KPiA+IC0JcmV0ID0gZmlsbF9yaW5nYnVmZmVyKGluc3QpOw0KPiA+IC0JaWYg
KHJldCkgew0KPiA+IC0JCWRldl93YXJuKGluc3QtPmRldi0+ZGV2LCAiRmlsbGluZyByaW5nIGJ1
ZmZlciBmYWlsZWRcbiIpOw0KPiA+IC0JCWdvdG8gZmluaXNoX2pvYl9hbmRfcmV0dXJuOw0KPiA+
ICsJaWYgKCFpbnN0LT5yZXRyeSkgew0KPiA+ICsJCW11dGV4X2xvY2soJmluc3QtPmZlZWRfbG9j
ayk7DQo+ID4gKwkJcmV0ID0gZmlsbF9yaW5nYnVmZmVyKGluc3QpOw0KPiA+ICsJCW11dGV4X3Vu
bG9jaygmaW5zdC0+ZmVlZF9sb2NrKTsNCj4gPiArCQlpZiAocmV0IDwgMCkgew0KPiA+ICsJCQlk
ZXZfd2FybihpbnN0LT5kZXYtPmRldiwgIkZpbGxpbmcgcmluZyBidWZmZXINCj4gZmFpbGVkXG4i
KTsNCj4gPiArCQkJZ290byBmaW5pc2hfam9iX2FuZF9yZXR1cm47DQo+ID4gKwkJfSBlbHNlIGlm
ICghaW5zdC0+ZW9zICYmDQo+ID4gKwkJCQlpbnN0LT5xdWV1aW5nX251bSA9PSAwICYmDQo+ID4g
KwkJCQlpbnN0LT5zdGF0ZSA9PSBWUFVfSU5TVF9TVEFURV9QSUNfUlVOKSB7DQo+ID4gKwkJCWRl
dl9kYmcoaW5zdC0+ZGV2LT5kZXYsICIlczogbm8gYml0c3RyZWFtIGZvciBmZWVkaW5nLA0KPiBz
byBza2lwICIsIF9fZnVuY19fKTsNCj4gPiArCQkJaW5zdC0+ZW1wdHlfcXVldWUgPSB0cnVlOw0K
PiA+ICsJCQlnb3RvIGZpbmlzaF9qb2JfYW5kX3JldHVybjsNCj4gPiArCQl9DQo+ID4gwqAJfQ0K
PiA+DQo+ID4gwqAJc3dpdGNoIChpbnN0LT5zdGF0ZSkgew0KPiA+IEBAIC0xNjA3LDcgKzE2NTks
OSBAQCBzdGF0aWMgdm9pZCB3YXZlNV92cHVfZGVjX2RldmljZV9ydW4odm9pZCAqcHJpdikNCj4g
PiDCoAkJCX0NCj4gPiDCoAkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmluc3QtPnN0YXRlX3Nw
aW5sb2NrLCBmbGFncyk7DQo+ID4gwqAJCX0gZWxzZSB7DQo+ID4gKwkJCXNwaW5fbG9ja19pcnFz
YXZlKCZpbnN0LT5zdGF0ZV9zcGlubG9jaywgZmxhZ3MpOw0KPiANCj4gTW92ZSB0aGUgbG9ja2lu
ZyBpbnNpZGUgdGhlIHNldF9zdGF0ZSBmdW5jdGlvbi4NCj4gDQo+IGNoZWVycywNCj4gTmljb2xh
cw0KDQpJIHRoaW5rIHRoZSBsb2NraW5nIHNob3VsZCBub3QgYmUgbW92ZSBpbnRvIHRoZSBzZXRf
c3RhdGUgZnVuY3Rpb24oc3dpdGNoX3N0YXRlKS4NCkJlY2F1c2UgdGhlIHNlbmRfZW9zX2V2ZW50
LCBoYW5kbGVfZHluYW1pY19yZXNvbHV0aW9uX2NoYW5nZSBhbmQgZmxhZ19sYXN0X2J1ZmZlcl9k
b25lIGFscmVhZHkgaGF2ZSB0aGUgbG9ja2RlcF9hc3NlcnRfaGVsZCgmaW5zdC0+c3RhdGVfc3Bp
bmxvY2spOyBpbnNpZGUgdGhvc2UgZnVuY3Rpb24sDQpTbyB0byBjb25jaXNpZnkgdGhlIGFib3Zl
IGNvZGUsIGV2ZW4gaWYgdGhlIGxvY2tpbmcgaXMgbW92ZWQgaW50byBzd2l0Y2hfc3RhdHVlLCB0
aGUgbG9ja2luZyBzaG91bGQgYmUgY2FsbGVkIGFnYWluIG91dHNpZGUuDQoNCg0KVGhhbmtzDQpK
YWNrc29uDQoNCg0K

