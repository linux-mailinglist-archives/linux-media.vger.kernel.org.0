Return-Path: <linux-media+bounces-38635-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDB2B150E0
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 18:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 485B2161A8A
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 16:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47072989A7;
	Tue, 29 Jul 2025 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZKfPe0Cx"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C805298982;
	Tue, 29 Jul 2025 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753805243; cv=fail; b=UvZO48YdzxYKc+YfIY353jmJmakJmT5o3xE526ZMXO+tOfow8Cs1oxs943BNfL9JMALOKU0NI5X5FrJAvyrUDcnOBLQa2Fefaj0Z4NrMGF26I5r+4Jon/KziyVeJ81giITzJbiubIizsZnkRyS1tiiBfTlb/6beAun798GIJ9Aw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753805243; c=relaxed/simple;
	bh=rlLpVBi3tgP1LHh5jfFIDhCUdVv6pbVgB/rSwTDtXts=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=FHeKLFqHKrKVKQlUGt6Z4lT1ZuZYH3C8Vas2F0/g8PirCQ6I3GHbl9gDPzikKu2KOpEFI//EFP1QI70BLuwEU8HOd5oLUkKBF+g3rpTF288o4vMs9VwZsp8fqjhRcteN1AeIzdcnhA0+EbM6006KF7g09gHsXCSsje5GN89P88E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZKfPe0Cx; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BAUvFGK0QM9zctlXv5HlwlL9ztJ3OkObE9xuwFO9VzzXqCcLyRfLrkMvtG0Bb+Ldhnzg4tVsaK+C6hyRf6bOCHonyNAEHLv/7JgSaoeC7zx3sqvMJGcuLJVI6D2NOmd0/z4at+2scLchH4QKiskWN87sb4NdV0wCLmfJEKNqy3XJy2FzptYA1JaIqbk/2bxJNE5dSXG9Ztunt3/qtyhmg9eH6DZ6TG8IIAEM9RduY1HZMi92HvQRwpXNj4RYhJw31GHIJNNDZywnepuYxchPkfZpy0O9jzL6v3QXVj+CzW43K7ImpsqjuV0lLM3u2xf3ypHUHuFcG0DBDz1v7pqykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUGHvjvBaPTIhTgV0bDD1WGrR3UptUaMwXCJuTSbIaY=;
 b=vS11BrQlb79UY5bSoFp86MDN/HE3Z80AdShdVW3el2a2+zG3mpNRYzRf/Hc5A810vENaqFvKdyqKuHBx8CFR7LvfftQFHKB68ohAYazAdf4U2z82E/h+a8DqxgcjKzLecysS3zTYSXdG449g/VcCXfW0AmEXOdzGATsroltn7yHZSbiBifGWGYuLc9p+Z3fktF5BLVGVAlA6O+Omd+Nki3EKb3PQC7dMYKmI70nPXNOXd52nqF8oPMYQRPQ5jKn1dscSgfkw6SG5Rf7mKEkHz/0p2+z5brycQ/mVMnZpuzXjS5XzWMJVgke2iGnU5Z+YbHtWhMzKt6tvBE16xDR2CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUGHvjvBaPTIhTgV0bDD1WGrR3UptUaMwXCJuTSbIaY=;
 b=ZKfPe0CxmPF2OS9vSSE6vX5GZJ1+sKEOJVvW9uJ584R+pVlMlKINPsJIXHJG+/7YklLASaXuSlOfwri4LXETX+PBZY2UqEfQBay7wjse40lE7IWOUt45np5bG1Xod1kozzKzvS42Tt8td9UrhkFvjzUkPVnE1cRzf6DYmAukc9dCVdBV0DP2zgbXnKfigsEJgHp731bDFJ77IAq7d2p/ThR6oM33q3nqpdAx/j6P635DszPRzjpiiBvostw0npu/zPxL2joowYdpR6HBEE5OE73R9uHw1n0MyLH5UC8OzZrEKTnitt7KQ5AQBHYDifkBoXcinhCtysnV2vHPFKRwAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10551.eurprd04.prod.outlook.com (2603:10a6:10:588::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 16:07:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 16:07:18 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 29 Jul 2025 12:06:23 -0400
Subject: [PATCH v4 2/5] media: v4l2-common: Add helper function
 v4l_get_required_align_by_bpp()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-imx8qxp_pcam-v4-2-4dfca4ed2f87@nxp.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
In-Reply-To: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753805222; l=2099;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=rlLpVBi3tgP1LHh5jfFIDhCUdVv6pbVgB/rSwTDtXts=;
 b=DUKaLz8j9AmWcnqL1fFgt2rzz0X1HtCvKqrZmAlaF4G47XopjOBhqRZxev60ROJb58OAySJfi
 FYID3zL4vsSAXvN5sJkshpNjYK4pPXrHWmJF8j+iCD1TF2dsxmkPTrc
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10551:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fec3ae7-f96d-42fd-958d-08ddceb9fdbf
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bjdjVkh3Y2x1WDVFK3pFdURUeU5kakVXTThZeWJndnM1UGx2S2I4cXJ4UDR6?=
 =?utf-8?B?c0k5V2VuUm14UzZCcnhhalZtM0hCSkF1VVVZM2dRYmhNU3MvMGp6dkNFMlFs?=
 =?utf-8?B?bmU1bTFqU2FyRGFaS2hjWFpxQ1ZRWGpZOTdIUGN4MkREamhyL3hBTWtEVWEv?=
 =?utf-8?B?aVUzbUhEeE1BN1o3NXFnSUNaYVQycEc2T1cvek93Umxkd1ZvUURoeDNZRUl4?=
 =?utf-8?B?MHNzaVdCQ2xDWUdVajQ5Q1pJTm10b1FDUis3ZFNtckFTaGpZZG14REdkdlgv?=
 =?utf-8?B?Q1hwYlB2QWNZNFJObytaTVZNRUhiTTluL0p0d05acmxBRUZoM3N3ZXZTRnNl?=
 =?utf-8?B?UGNmOFR1QkxodFBTdUM5dDMwZC9JSkJ2aWdCdTk2dXIxS2tLQWRKMUJ5YUt1?=
 =?utf-8?B?Z1o4dlpzbXpSbW5hdnRSdkxWZ1hHa1hPWE9RKytpRG9ianVRL1FKbzBNblVq?=
 =?utf-8?B?Rm95ayt1U1RoK0Mvc1kvU0g1Y0FSb1VyMkJOSHVid3N3MEpDbDdQUTZIa290?=
 =?utf-8?B?YjIvS0ZZYWZobTFrWXFDOVlHMVI0SFd6RGg0TmxLMlBJUzFIeVhJd1c2Zity?=
 =?utf-8?B?dGtSMEUvYWQxb2gwUUF1WXRqVUJicjU4U29VV3E0SkRteXpxV3FCbnM2V0M5?=
 =?utf-8?B?TU1RQTQwdnhFcmVNK1lPTFZveWRUOGJpa0J6cjIwL1QyOXAvUzFmZVVCMllI?=
 =?utf-8?B?K3kweHkzeTdCbnBjbTNLYVFuRFhscS91ektiS1FJTVBvQi9ueGM3dGFoN0x0?=
 =?utf-8?B?QnRCN254UVRQOG84d3JnaktxUVl0Y1ZHdEpSeXRXU0VYMmxWV3h6d0NmQmVw?=
 =?utf-8?B?cUxMYlVEYllEQUs2NGpGZDkxckczemptWEY0c0dKTXJ4aFFMMWtHR2NJMitN?=
 =?utf-8?B?eXdobUhBU3hDOVhRMlJGMVdiVEZrVkFBWkg4NTZ2VDhiYzJHSlU0ZTFyejNE?=
 =?utf-8?B?c3E3RXJiQVVON0FmUXF4alNuSGtYTFJxdS9KN3ZkeUdRVEMySlZmRVdXSDZa?=
 =?utf-8?B?RGdtN01XTEh0d2J3UnA4M0NPSTJBcktKemZZMXNOWDlOdVdXNXVNcXlabG0v?=
 =?utf-8?B?Q3doVUhVcDhXdVV5MXpZcTJ6MWFuZVQxUHdJRlZ6SmM5R0lBMHJnM3I4UUE3?=
 =?utf-8?B?RGZ2TTBBUUF5TVlMcUFIYjRrMkhsSDgzc1JBTG9kakhkcTlXTnRNSXcrK0Jp?=
 =?utf-8?B?MEozN2NlUmo4aVNlM0FxdXFCMjFtYXV1RXQyRnBXOHRvTUszb3gremNFcnAv?=
 =?utf-8?B?MkJzYkRNWUNnM3BIUERld3U1RmhsWHVpS2V4QW96djdaeXBsS1lKSDZ5a2Fv?=
 =?utf-8?B?WEwwazd6UzZiTVVWT21JZnkrcjRRZDE2MkpwWFBoOHNsbzRrWkU3Zy9ST2lq?=
 =?utf-8?B?dlNlWXVhMWc3L2RWZzk0OEt1YndDYmlNbEhOT201QmF0ZjJXcXBTK0UvQldM?=
 =?utf-8?B?VkRNaW1uOE1ad1lmYjdrbEd5UmxPUmVBUkZiemJuRFVsQWo4Y1NpYjJUNkc2?=
 =?utf-8?B?UCt2RkZCQWV1Q2Z1d28xWStsRmhWUXBUV1h4QUFDQTFZWlFLekVlQVFlYkRi?=
 =?utf-8?B?QUkwSEk4dnZyb0JQN3pnNGdjcUxYY2o4c3FSaVNqV0hnZkI0dVNmaUlKZEJL?=
 =?utf-8?B?UkhESS9aYWZoSHQ4Y3M2RUFZWGttQ2J1RHhhYUROWGx6Z0FLNGRabVBzemRF?=
 =?utf-8?B?M1Z3RXhyR3lSSkxRN0FYSzdMdjh1OUY0QmNKSDAzdm13MSt2TVE0bWI1RVh2?=
 =?utf-8?B?SGdDNG9NNXFoeW9Eb1RWaTVtS3BlMmhYZ05xYmRreEFKOEJXVmwyNldNd3du?=
 =?utf-8?B?TEkrdEJGazM5WEE1eWxjUWxyYkk4T2RVVXo4NyszTStRNmJJMXNjVzJxSzA1?=
 =?utf-8?B?R01XdnlaVFZQc2t4a3BncWJMQjl0Zkx0clJiSXlrQzBuc0M0UHpkdjJWRFVz?=
 =?utf-8?B?YVAyMmgwSzdCU1JrRnkvMG5TWW8rTFVISVMwVUpkcE9KT2Q4b2t3WE4wSDFt?=
 =?utf-8?Q?8PI/J4kwbPbf5ow2KXtMEHA6KAwLiY=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?N1FpNm1qOFRNK05lQlFtazFwRmlMT0lyQ3RzMkFqbUFSL3NqV29tcTloRzVs?=
 =?utf-8?B?VFVRSlRMT0QzT1JCa0cxdkUzaWJqR0tpSVQ3WUxmSUZMcWpvZzlJaXdtTTZm?=
 =?utf-8?B?Z3RBN2Z2WWxEYlRKZVhJN1hoa2VnbkxsMDBkelFYV1gwdHltY3E4OVRXdHE5?=
 =?utf-8?B?UExmTktobG5DeS9qdnNielAyVmZvTW9hMW5QWXdqcS93ckNpT2FDRjhEUVI0?=
 =?utf-8?B?K3lOSUU0ODl1ODFOejZudmh2THpOWUlkTzJLZGo2QjNQdHhQblBRSDJNTG5m?=
 =?utf-8?B?Y3ZHb0s3b3RCSTYxSmtBamtMV1BTcjRLSXhzME85aDlsSUtEcmJtalAraG05?=
 =?utf-8?B?YkdCc2RZYUZQWGpzSFhVOEs5VmFBRnVtdXRhTk4wWS8rcUVwM21YUmpQVTln?=
 =?utf-8?B?WnMwYVEyU2x0djM1ZnRaOU4rWE1FRk9ocUx0SGkzWitjZUZIK3ZwMzlzZ2dy?=
 =?utf-8?B?WXZZT1FCM1R5S29mTGNrZlUxeUhnMjl5TzB1NHFWdFRJTHNvUlFtNkk3T0VC?=
 =?utf-8?B?ZU9adVRhUXZ5U0Yzb1ZiKzhjZEFDT0N3M1ljM0FOdHErZG1kc3VSelNJNjlJ?=
 =?utf-8?B?SENnTkhCQXBUa2JvM2I1UWVpZWFUc3VEbDk5Vlg3SG02bThVTHF0WTVYNjJJ?=
 =?utf-8?B?TmM1UnRwWGNqcER5c25uN3JTS2M1MjJFRnp6aElTRyt4VXlSUTBWMDIzalp6?=
 =?utf-8?B?Q0psV0xmNFpjMkoxVENxU0MrWE94S0NzeDl1OWdhcURMK3M5NDh1RFhYNHM4?=
 =?utf-8?B?WXJUbkZPNnU5TWFZZlZaTDd3OXR2UkVuM1JCelBCVlUvbkp1MDZYV3JWS2Ev?=
 =?utf-8?B?WFRINUpnTHJ5M2JjOTR1cXN3cGNoa1F5VmRUdmlQQVRxWjZFNGxqcmJON2p2?=
 =?utf-8?B?R29UY2llQ1dFMGMwc00vblhhNngweW9PVmRNbFJzTm8wN2kzbE5PRFdtT1BV?=
 =?utf-8?B?SXNQQjlYVjVHQ2IvMnJoQTR2aDRPbTR2bXlNZ1pPRkcwNHBZY0tySGY0OHF3?=
 =?utf-8?B?YzlJd3VvdjB5WXpMUEJZWjFqZjgrcm1MZnRMWHIxcFNsQXVlOXRqcGswT01E?=
 =?utf-8?B?WlQwVklkaXhLMXhmSXhNV1hHczl6TmtRQWpjN2JNeFF2dE1hVmdoNmZqNWVk?=
 =?utf-8?B?R2xicGRBWU1LTDZZN1BBUHovWFpvU3dTMng1SjYwWURGZDZNMk9ianpoWStB?=
 =?utf-8?B?aUw5MlpseWUwTSs5cy9wWUxGQnZDTUdWQzNvalRrMWQ0MjI5VFhqbkozRWJa?=
 =?utf-8?B?emdZYzFqakZiRktFNG1XMHh4SWU4RXVQVytEZm0xRHYwQmRidTBqMFVUVkxG?=
 =?utf-8?B?YWNhbHhGZms0aTdNQ0k1ZmZWaWh1VHZCR1ZMcSt5WHF1bFZhSkYwalQydTFx?=
 =?utf-8?B?WDhFVHM1aEd0SkdEcUVuQnVKNHdTVjBBYUc4L3RzQVlwbGtSNWExNHkzM0pq?=
 =?utf-8?B?Ri9ndTRzcVdhNDZkK2pLUlA5QUFvbktPbU54TVY5L2ROT1FZQkswd200N2RS?=
 =?utf-8?B?UDVza2QrOUd0MDgxTGo2VkNqNGlKZWlQVlRWakVJRXJCbnVXc2p1M1Rmby9S?=
 =?utf-8?B?a05QRVoxTzc2RzVwSGJrVUVEZzdJVXVmSmwveXFOZkVKZDMzcHJ0WFFBQW1S?=
 =?utf-8?B?OHlRK05FdGhKQjlQWVM3U2hxNDZuZk43N25JbytMT3VNdEUvRE1zYlczUE04?=
 =?utf-8?B?RkVxTm1kOWVVMnN6UW9YbENWWkdXajNMMFNHRktTeWQwbDlFU3ZxVlhtL1JO?=
 =?utf-8?B?SVNvM0pGYkhQTHdwcGthcTFLVnJZZWZQWHptUk5NUHJKSmdQRHcrb2E0Mk84?=
 =?utf-8?B?MHpmaGR5UlYwcWhwREwwQWdWZmFaSWVKMUtxL1Q3bWlZMCtoOXo1TXNRREls?=
 =?utf-8?B?RG5MbmcybjM2OG9CbjBqOU0wbWZKcDRKMFFNSnJ3ZXRqZlhOSG1DSmZvdHhS?=
 =?utf-8?B?V2NIOVRHZ3lwVSttUUVrdmhseWJWVnVlRUFBSHlTYXBheU5ZVFVNQTJ3YTFr?=
 =?utf-8?B?WTdEZlpSc2RXcmlrcC9MR0EzeGFmN3lmZ2lCUS81WE9xUW56eWw2cEQyb1VH?=
 =?utf-8?B?TC9DTmp6MUtYdThEQ2s1SFlBdlZNL1VhbmhmM0d4RFZRZ0RJV1pkMWtLbTFn?=
 =?utf-8?Q?gbubzoPM5TA/Vr8OTSNPWHnRN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fec3ae7-f96d-42fd-958d-08ddceb9fdbf
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 16:07:17.9651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JmKzLC8aM3fUprHzICk5Yks0T5No3x7t5g+VjSzL7JO0vfHF8jsUMiVA3k6apbdl3KNQbKiqCxSNz5FbziciPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10551

Add helper v4l_get_required_align_by_bpp() to help get width alignment
requirement. Basic replace below logic and enhance to any 2^[0..31] in
drivers/media/platform/nxp/imx-mipi-csis.c

mipi_csis_set_fmt(
{
        ...

        switch (csis_fmt->width % 8) {
        case 0:
                align = 0;
                break;
        case 4:
                align = 1;
                break;
        case 2:
        case 6:
                align = 2;
                break;
        default:
                /* 1, 3, 5, 7 */
                align = 3;
                break;
        }
	...
}

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v4
- new patch
---
 include/media/v4l2-common.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
index 0a43f56578bce1896cf63e29dd19f58ec0c46bed..a861d83bcd835dc854476b25919383415e5d434f 100644
--- a/include/media/v4l2-common.h
+++ b/include/media/v4l2-common.h
@@ -669,4 +669,34 @@ static inline bool v4l2_is_quant_valid(__u8 quantization)
 	       quantization == V4L2_QUANTIZATION_LIM_RANGE;
 }
 
+/**
+ * v4l_get_required_align_by_bpp - get align requirement for
+ *	v4l_bound_align_image(). (bpp * width) % (1 << align) have to be 0.
+ *	given number bpp, get width's alignment requirement. For example,
+ *	if align is 3, means require bpp * width must be multiples of 8.
+ *	    bpp     return  width's requirememnt
+ *	    0       0       none
+ *	    1       3       8 (need 3 zero bits)
+ *	    2       2       4
+ *	    3       3       8
+ *	    4       1       2
+ *	    5       3       8
+ *	    6       2       4
+ *	    7       3       8
+ * @bpp: input bpp
+ * @align: expected alignment, 2^(align).
+ *
+ * return: required alignment.
+ */
+static inline u32 v4l_get_required_align_by_bpp(u32 bpp, u32 align)
+{
+	int pos;
+
+	if (bpp == 0)
+		return 0;
+
+	pos = ffs(bpp) - 1;
+	return pos > align ? 0 : align - pos;
+}
+
 #endif /* V4L2_COMMON_H_ */

-- 
2.34.1


