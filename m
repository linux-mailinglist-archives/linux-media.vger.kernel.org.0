Return-Path: <linux-media+bounces-60808-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HtlCsOV/Gn3RQAAu9opvQ
	(envelope-from <linux-media+bounces-60808-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:38:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD07C4E95DC
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 15:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB2A730058DD
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 13:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601A93F789E;
	Thu,  7 May 2026 13:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TjIthIa3"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674F123E342;
	Thu,  7 May 2026 13:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161087; cv=fail; b=BWwWWgR1W0xb3vg5IPZnNj6BdiF7tJud9NQrXay0mcpUatyqRKKrrdxkPMoPiDfNOZm0IkJfvLjLj53cZTzM7VXgvpOJkZAMltrXcwM5+tSwLFQlrEVyAWS2/Qu31By/XFm59rK5SwXtUSDAVF/wzgPDIdudCvVe4RQKeVEnU5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161087; c=relaxed/simple;
	bh=LIaMF1tQ239dPTujwtrizyIKJ9DWiUB9hvGz8X5PAyA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=L2H8eYsW9H8z04DK3xLoqYuS56zlEpSUX18ct0BSk3eZPNdOfYxH4NXlbkJoeHC9+DFqY9KHWgLQz48ZeCLKUCcsli2WzZtx08u0rCtLaLNrjxIcVFjADX7GsCQYbZ7gWfhNtInpltJS0NDvuMXMsPAD78YIkBjugRUKE31FqTw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TjIthIa3; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4CtiymNeJ3jb/MxqV6vNjACjSiUOT9ZWslbs0/BSMnVPl2bX4UAYZQ19LtzLralIMwzUET9czqWPiOoduSVgLcm4ubwiaBb3WdMNNXnmD0Hy/tSxnw4AAhmy5xvi3R6yLDoc0MfCXh/GZDxTZIKPftE/3mBn+Ok3kKONuogCBYNr2i399+elwGRp0u7Pn7AtOzGoZ5qh23F1sMBGQl7X6oJEbq5UbWz6CxrQTcNZD2X5RUDVg2ZsKejLKF9J6Npvj0CiGyTM0/LABR8rpVjWknyhSzTjb3WMq9bK2FTgZesOyI+SUPcEGztI4zLdAmqv2PyxxxHrMIAJ0Z/M/iMqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vaQ8Bb992nk7LjzcMbXwRR6teS2ew6VZ074FwzxV7/k=;
 b=JoVKinWpm+4Z7VGSk8tsB5VJi6fu7Q2ZmObnHR5WOI5wsaYmx43JJWMvt7bDi5m87koOsWpRP2W/0smEr5YQ4A92dO+VcCLfshkZjUME9FaHNvvcLPsJluUnkSveBxY1e27TZtprXuRAuRxD19LdmHecF71+uiq/hzuPxkV6UOlh2UisQIrHEhtRiY1+R5z+NJUaO5DReckdN2fWKxKEQPXqP2me63RW93VaqCw1dTEsc8ZBD1WZ4ekrm5QgO2Rv3gH2iQnG1chCZOwLKEjQfnLc90ktXNjrRjYIplcELkcjAE7DIL4yhHHHUpGEC9K360sSzwmvey6dZbUhFiX5Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vaQ8Bb992nk7LjzcMbXwRR6teS2ew6VZ074FwzxV7/k=;
 b=TjIthIa3CpO7GZXn9yKtL5SLxyBuzM4vWd+jPvyuSym1Z0f0kCCMpPzdd+W0PkEy+FUSwkCa3obEvVdhVtLvi1iYiZ4jw3qpVUibovnVZjR0k+e27vUYZaHWk7xrLXKnUcp8d5+pMLG8BaTt47PVWQ4PRSAnlAIpbGnTNyXGCi8bosoEd73mQL3bdBMuOZb6h0kMZbG601w/Uc/hIstvR5kK5+Jsz/wI64rby6p/c2uyRIqOMv18tLbMFKittv36rWNOvzidO5WMD4sVfMYP5AcJkDsGboSRRHVFgP2CS02+4eUH5S7zeo4M53i8KQZEBae8YCyeOxGX2UpPLcZ9nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by PA3PR04MB11252.eurprd04.prod.outlook.com
 (2603:10a6:102:4b0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 13:38:01 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9870.023; Thu, 7 May 2026
 13:38:01 +0000
Message-ID: <fac452bc-3bc0-4b50-86d9-abdfb83deb5b@nxp.com>
Date: Thu, 7 May 2026 15:37:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] media: Add iMX95 neoisp driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 jacopo.mondi@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, michael.riesch@collabora.com, anthony.mcgivern@arm.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev, ai.luthra@ideasonboard.com,
 paul.elder@ideasonboard.com
References: <20260413160331.2611829-1-antoine.bouyer@nxp.com>
 <20260416-olivine-cuttlefish-from-tartarus-ad3df2@quoll>
Content-Language: fr
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <20260416-olivine-cuttlefish-from-tartarus-ad3df2@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::14) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|PA3PR04MB11252:EE_
X-MS-Office365-Filtering-Correlation-Id: c77fecb7-8d0b-4a6d-b7ce-08deac3ddbc9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|19092799006|366016|22082099003|3023799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 G/4lw5NAzLBRQaOD2CzBQLxLJh09Zf34x4qrKn5wt9c2u9TEfHENVKfAN1nht+2mf31YyPTyJjpO+MdlS+BJXLAVyRyZtU0n3ddv4nyKsif5rw2FpelSUd+4JngE/sCDmqbT502bJ2waI8cnGQiocMICIVs9h6F4B8gr/2SM4xH3oxz/hhX+Tv7AUux6sy1vOUQd+K/FcZVKzfsjSCQgUnIQoymhyuF/rhw4F0+YAxC3r0+fQHy0wxmhDsga5fFDWPfobAUdavSrc+EFrChFahn8Atcj9zXSa5/db653bQT/HIb/zkBNysHu4WPxom2NtOR7cmmHiPFh/t4aAYUSQ2CS83iO/nKIbj5AQV95HmhldNrLSxG4ALa9qTRhmOn4Zazb5wkloFT6+apmHFTwRaNOzECGGLM1dDGMjF+0eUuh/hHVbOo4kwO1Lfhvhp2lG5Z1J6jlbq5HbNL8PRi/Lfihnr2xYFnKooIvTeaCJA3tF/aKTOhbmu2DUNwc9DrxDDP46HQ8EM5SWb/hFQz9FrF3aj20D7wT288IBuK4oYt6Kk6kLUQrujlmQ2iO34MjWlBWZDrdnI5GvLwhmArZb36NvA83nijh7/8V2paly3AtfbZm+rG4zCXQB/hm1TakMhXr8nsvn1tBdYGfM1wTcPoYSRpkUCDrCpOX7tY6/CKJx1GBRJ+g9jd0QOUzr6od
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(19092799006)(366016)(22082099003)(3023799003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?N0NESE9wekcwTlcrNnFtMmt2VG9yUSs1Y2x6RXZaaW5KZytpbHhHK3hJSDBO?=
 =?utf-8?B?dmViUXRwVXpIUldhNkZNVGRkZ0hKY1doOS82WTBZUGY3RlZ2TEQ3UDBhenJm?=
 =?utf-8?B?K0Y5SkQ2V1FNUVA4M1ZxTHduakFaRHUxTTM3TE1wdHIvOEIzWTBKRHRkY2Jx?=
 =?utf-8?B?TmJTemJRSHFWWGRuc3BYbitJUHdPTzErdGVyeWhPNzFyNEZ4VFlmU1NXSEpx?=
 =?utf-8?B?SEx1ZFNYRXROSkhEUzZkVVZ5MWRvN3lETnpoNHd0UnNqQVRIOUFWNHBnTHpw?=
 =?utf-8?B?cjBCajNLSmRoaTJJcmNGYXNVQjZIemg1am5ORm5mWnVCUnZMYXdCbUFIRDhB?=
 =?utf-8?B?dGtGQVdiU0ZnUHVkVXk2UkY3Ty9rQTczVzVoeXZHUnc2ZE5JWVBWbjI2ajIr?=
 =?utf-8?B?V1BZa2IwOFhTV0ZVMUpaZjFub2JwUFgwQWgxWjUyRmlSUmFFQ0NtSExZK3RM?=
 =?utf-8?B?SDQ0TGNOWlphSzFvT2o2U2kxYTJLbE1tRnR1LzVGSEtBZ254ZUlFSU5PMnFS?=
 =?utf-8?B?NzltZlpMUkJZYkhUY3diVk9QRnhtVlhKK2tJQ05tQWw4aVNxUWRlenM3MmE3?=
 =?utf-8?B?dTZKTDc5TkdjUVRnV1lDWGpxUDRNTnVaUzd4RUs3QkM0Q2dpVU9Xb3dQMEU1?=
 =?utf-8?B?Qmh6cDlYSnprZUR6VW1US0p6eUdiUi9MSVMraGlHN25HNjZEeDB0NW5uRmVI?=
 =?utf-8?B?ZXlza201Q3locUpXU3I5ME9NWkxSWU5lNHR6b3BPV0NXeExnOVJzT3ErWGtU?=
 =?utf-8?B?aWhnYy9EZjhVREJZalNkNEVYUjFhYUhDTjJkemZZRVRBU0xZYWZuQzlnMVZM?=
 =?utf-8?B?SDJVL1k3a29veXFWcExpQnQvRmI0YmJmQXMvWHdVcWpRR1RSU21VV0N0eEp3?=
 =?utf-8?B?MmdEQisyVDlsUWRWZXFPMUhySTM1Rlk1UEZDRHVWcFBjaHhXUGw0QVo1azRT?=
 =?utf-8?B?Qnc4T2M5L3hBa3g4cjhWcWpwQitGR0hOUmxxQjJaYmYyVERsTXlFbnI1N2VU?=
 =?utf-8?B?b1lVWDFVM0syRmJta3FmYTFpUmF1WEMxNi9mSXZkVkZYOVV0K1VXMWtVZTV5?=
 =?utf-8?B?OGdQMnBUYnNpLzAzTUxlM1A2eUpyU1FRVDB3NlEvM25rWWc2cmdTc3ZCY0Zk?=
 =?utf-8?B?aFJxTzB3OG5Zc2VPb1pKMFI4TFR1eW5WOWIrcUdLZmY5aWorV2FLcUFIc2Zm?=
 =?utf-8?B?T05HTGVVUEEyVnFnR2RkTGN3M1RUbmFSN3JDSlN0ZXZIWmV1MXptU1RSeTJI?=
 =?utf-8?B?ZzFrbU1SeUJ4bGpSejllUVl3LzJqczBnMFR1c3gyR1U1NlFxeFNmblZHdGxo?=
 =?utf-8?B?K21SLzVIVzFtd1czZnJiSDRDMDVZblF3ZE1sOXlnRmpDVTd3R0U4U0c1b1BI?=
 =?utf-8?B?cUorYUZpaERFelMxWUh6Wko4WnpmT25WR051OTFBZVBwNmN0UlplSmkyMHhK?=
 =?utf-8?B?MldFN1hrUFhvVFV0MkxTNy9JUTdFdUVsdCtKNWpUbUVqZzc3MklscmZ3V3M0?=
 =?utf-8?B?cCtKSHdoalVNeU1UdGFySUtjODQrb2tzVU9LNEVrRmhGbUx2a2dDNnpNdDFD?=
 =?utf-8?B?VlJsSHRkMG9ZbmJsTktORUxMYTBTSzAveEhRUklnVjdVMkNueWJkSXNuUFBG?=
 =?utf-8?B?SHdMM20xWDZGMVRmUTVKMXJFVm84L2ltdXhpQ0FTanc4VDZzMFVXN2hyRkxH?=
 =?utf-8?B?RzZnYkYyY014STh2cXhwU0xWdVVLUkx2TDlCU050TnVzZzMxWm02NWw4dUpu?=
 =?utf-8?B?YUQwdXROeHYrMlh6MkxndmJlSlI5U2RzTThrSG5kc1kwcTVvbTc1cjJGd3Nv?=
 =?utf-8?B?KzFxZy9IdkV1ZUVsT2FsOWROaUszRGNOTHdxaFY1TkZZbEYrUURNZnc5UXV0?=
 =?utf-8?B?OFNEVDJ0NnJRcnppdlNDUjF5MFZZVU43ZGdLdWMrRUsrdXhVQWp0bjVwQkpB?=
 =?utf-8?B?OUp2WE5YdnQrdEppM1hVLzVoUHc3NzQvQTRHTWswRUJtaDNONlZBNmljWWcx?=
 =?utf-8?B?dkJ0ZkJJNWZua1ZpR3VJVndsT0MydVRRQ3dVclhtelBXbkNQYVJ6SVZuUkY1?=
 =?utf-8?B?U2R5K1BBYXFoL3RGMVg2TlQydStwMytVY2x4RVEzckViY3lCYXRBbVpUazFr?=
 =?utf-8?B?MUY0ZVNYK0hWTGhyeU16SVZyNTlIbjJ6Sm9zL3FOaHNSMVRSSjQ2RXJDRGM0?=
 =?utf-8?B?c21VRVV2aGprTE1YQWRWRjRNbUJ1NlE4VzZZUG9TVEYzT1N6eHc1QXdVVEJT?=
 =?utf-8?B?b0J4Znc5blJQRSt5M2lNTEc1RWNWWExXbGNCbm5DZWlVTEVMOGNCbVJqQTA3?=
 =?utf-8?B?S3ZpYVZJaUZHVU4xc05ObHdJeC9sY3dSaTB0WGhVdk9CbUdoUWNsQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c77fecb7-8d0b-4a6d-b7ce-08deac3ddbc9
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 13:38:01.5096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cxDwngiznXcEgWFIVk3kXc2IubFDuY0WrDMH+3EYTVZ/sKESysBAmlDGXM5gRxb5cXWMXGrX6x4yCUst/4+j3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11252
X-Rspamd-Queue-Id: CD07C4E95DC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-60808-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:mid,nxp.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

Le 16/04/2026 à 11:20, Krzysztof Kozlowski a écrit :
> 
> 
> On Mon, Apr 13, 2026 at 06:03:20PM +0200, Antoine Bouyer wrote:
>> Hello
>>
>> This patch series introduces the NXP Neo Image Signal Processor (ISP)
>> driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.
>> The series also includes updates to the generic v4l2-isp interface to
>> support extended statistics required by the Neo ISP.
>>
>> The Neo ISP processes one or more camera streams, converting RAW formats
>> into YUV or RGB outputs. Its architecture is largely influenced by the
>> PISP driver. To limit the number of v4l2 devices, the driver supports only
>> one context, with three sink pads (main input, second input for HDR, and
>> parameter buffers) and three source pads (RGB output, IR output, and
>> statistics metadata).
>>
>> The driver supports the generic extensible v4l2-isp framework for
>> parameters, similar to rkisp1 and mali-c55, and applies the same approach
>> to statistics buffers. The generic v4l2-isp framework is modified to
>> factorize structure definitions and versioning, so that both parameters
>> and statistics buffers share the same mechanisms.
> 
> That's a v2, not v1.

Hi Krzysztof

Thanks for your review

Sorry, my mistake. My previous submission was an RFC, so I reset version 
counter to 1 by mistake when submitting this patch series.

> 
> Does this work:
> b4 diff 20260413160331.2611829-1-antoine.bouyer@nxp.com
> 
> ? No.
> 
> Should it work? Yes.

I hope v2 will do then ...

> 
> Also, implement previous feedback - I see no changelog, so I assume you
> just ignored everything. Judging by build process errors, it's even
> worse.

Oh no, don't worry, I did not ignore your comments: using maxItems for 
clocks, removing unused configs, and renaming filename to match the 
compatible used in imx95 SoC.

I tried to summarize these changes in this cover letter, but probably 
missing details.

They will be included in v2, along with the fix for the obvious error 
reported by the bot.

Best regards
Antoine

> 
> Best regards,
> Krzysztof
> 


