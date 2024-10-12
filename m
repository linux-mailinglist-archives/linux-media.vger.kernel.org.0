Return-Path: <linux-media+bounces-19491-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D9499B237
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 10:47:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75D5D1F22828
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 08:47:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33553149DFF;
	Sat, 12 Oct 2024 08:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SNdTdlyv"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2050.outbound.protection.outlook.com [40.107.105.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71E2145A05;
	Sat, 12 Oct 2024 08:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728722849; cv=fail; b=udVNfKB0t5yk5HOjH7U7nYL2gOvONZjlWp5USsRAg8m3YlfKA7OKIHY9OjOXuDTU/DU86tjJEXw6faa+s8pyNaigKGmTafcTIr1o/QgonHB4DJgiVap6lROfobVo9hXnbWPkv11ZP581XDbRakmOl7qdtSHmB+C3czRY2hcc4VQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728722849; c=relaxed/simple;
	bh=qfZ75ITeE8q0Ygq1GJnAPuOrSlYpGmj7W5O1cu5hpVE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ec29Kcb4mvdIQjru5Gx9d5wEX9RcZlUt8y73Hxj52QvNcxVDwVXdraXMR0310Hb3pnLjo9fdbGPS4NxiBTbx/xNAoqJA6itBCT22QCvApp53CD9uzyNifm4xATn1S90e6f2hRDAiygJK7uu8gHN6GD/ObkCLnUKCe7obehWuXyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SNdTdlyv; arc=fail smtp.client-ip=40.107.105.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kLFCkGmUv1IXzku+oI1ryKFAkBIGRZrxbtYflZAg4AWKBuvYLF3RrMOxGB3us7DFN0tCB7HgYMgdwMhB+3r37D5NjKR3Mof1aIpSJLlEA9XRO7RGsUVWrd3ag1zXF7JqzTbI2nZD0hpixzjn/3I7bvgmQ/B/sRnlrJsjrHMHvvD9gySJze5ChxMHaOlAZxP5r61ZgglD5GXoIb+mnOcalaDgBPP52APFJiTflvdbgR3ciSAyJPMuHiyCMq/xKUrDmVw/5elaMvQpx9PRfi0hn6sX3DfowQZ5flRMUlT64l99y4y5mhQuF/fIy/gf7YIdTmsk/H1YGeiapC0Zv8HS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mw4mUMW9T53GCniS9zvIlP8T6Wh3I3XQnkcvvObvl4=;
 b=OT6wz3Lq9k+m+xz+s1H6QlszqGa7mLCpBbJjHTs12DpYzSczg2h0LSZPLUJgq+T9z8Fq844ufkpD9Zc4tNYgu/yOe7/s7Vmhktj0PVNo7aPkYcr4m5t1YjcCTIGhv/UW1TphyR4Hn6tRGNWKjHdVA1Fw8odEwiEnjps1+5yNdRCRxybVN/UtXzvxiGyYLs1fTnxgMDMyU7Zp0SigwB3ZEXm3JweQyrMzsEbL60GcMY+EusZQWesgBQ2yfvTBF0yhwOwzD3qz2wTKVh5KcbRtCX8pYb6fUSmqwspxNtcV9elJkkZ5NgXVd5fFMkB6dW71Krl3MhNAFkPDnAPhGCsT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mw4mUMW9T53GCniS9zvIlP8T6Wh3I3XQnkcvvObvl4=;
 b=SNdTdlyv3QjUIDgnrHcLaBYFUYTfeZYWKS+3NL4j/YKhZI57EZq1qV+LymBW3R5FN78cddz45GECBH7TJZmjaRL6zDLxVzxY7yShT178CSiXRpDXtWdAIS0SFwnxmRgG5BG4pRNOgTySuIGrwOlZmfUfC71G7LB0MA1elUL+pnpcTZaWPmPD+AU333Oc5Sd9fbdLvTDodbTJcCXYFz0FFqfydhTNBcL1XOnyvN0mHBToGjFLFxaHzh/O3X7U02WzhS3h9PTXdDN0Qj/UICJWC6HxtFuELaQi5OI0vttktW5YLQT1gphv1U8MOutNB1S00pXQ7wI1KabSAj1dWaiCTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7562.eurprd04.prod.outlook.com (2603:10a6:10:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 08:47:24 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 08:47:24 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.d,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: nxp: imx8-isi: Add i.MX8ULP support
Date: Sat, 12 Oct 2024 16:47:33 +0800
Message-Id: <20241012084732.1036652-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
References: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: e92f7342-540d-4a72-7b1d-08dcea9a7e73
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?L0lTRnQ1ay8zNFBtSlFuc281ai9DbUFZcXp2RXJGaEkwRTN5V3hlaGs0Um54?=
 =?utf-8?B?dmhEL0xxVGV6R0d4Nk9SZ0loOHpZeVExK1AyUFl2djQ5MFg5ZzcwREp4Z1pM?=
 =?utf-8?B?cUtiejRTd3pkbTVjSGlhVVdpV3F0Znh3MkRJazRUeTM2RC94QXY5Q2pYY3Zx?=
 =?utf-8?B?d0Nlc2VqYmp2dHlWOWRUN0F2YnAveWdTak5hNG1lTU9kVmhTTjd0eldpaTcw?=
 =?utf-8?B?Zy92MUQ1dC9BckN4ckd3Z1lKb2ZFQVpuY2pOV1VzanoyWGhROHl2cEt4SERF?=
 =?utf-8?B?Z1lBQ2lON0Z6SHdQQUpSVjFjcW1sc3IvRkNpVXh3VFFmNk14clNmRVBZSWxj?=
 =?utf-8?B?a1M2SjVNRlgydnpEN0pQbFdQNHV2Q2FnSHVRbmYyUDMzUzJaS3JUSDRaNFJu?=
 =?utf-8?B?VHhTcUc3VWFxQVBTSFhMNHVOZ2M5Zko1bGVZOUFYRVpZUWdrSDNqblVYZVVK?=
 =?utf-8?B?aGRoU0FzT0RwNUt1ZUtGa21UR1pmMVdxeTFBS0kvVjI4T3o3SmY2YmUwa3d0?=
 =?utf-8?B?czh1bGZvbUxEUXNkR25wMGV5Q0lXcUI1QlMwdWUrMUVzeldwOHBtSm1nWXhr?=
 =?utf-8?B?WUpQOXk5U2V4SDA2VnEwOG5FeUZLMVd1REZUNWRmQUlvSXVlbVczQW0rek9n?=
 =?utf-8?B?SW9wbkp4UGkvTzJCTXZEdHgwN3lPamU0ZmV5QnNzcWUxQmRWNE1oY0k1T1pW?=
 =?utf-8?B?UGlmU2FzUG5DT01XZW5zTGpSd2l4L0tabEtDMGVXZ0dTSmRHYVZaWFk2aWU4?=
 =?utf-8?B?Ni9jVGxPeHRNME1aWU5Cd1Q4ZlBqRVVaWHJIOGFGTloxTHhYMDJYeVIzSEhV?=
 =?utf-8?B?b2xQWnZYdEgrRGh4dW5IczJ3SVpKZUQzd25KcUlrMVQyTnQxZ2dxdW1PeTN2?=
 =?utf-8?B?bHpFanZJY29DeU14MVNrNlVBbkI4eHFXUzBjMGxjcnR5OFkzOG1BUjhaTTRW?=
 =?utf-8?B?bmxXcDljTjluWjhUc2ErS01kdFdTUm1taHJucjMxNTlsYWpwUTJ5dExsQllv?=
 =?utf-8?B?RHJMK0Z2QTlmdmJQRmkvTm90WlU5aGhGeGpTUXNBVS9WTGlPR1VLRHNMeGlZ?=
 =?utf-8?B?eUR0MURidEJQU3l3VXluQmVodGs2SXlQdVNDTTEwR3B4bjVURHU3L1o4V3VX?=
 =?utf-8?B?S0kzemdhZkhpTzdHdU8yZVZ4WUF6Zm5QQVoydFhhaWh4VHc0cUZaRmthdEQ3?=
 =?utf-8?B?WUNTaDIvSFZHZHZiUTFFdFhXN0RHTjlReW41V0xpLzI0S2tyTGFENzhwOEVI?=
 =?utf-8?B?Mk0rOTJOMXlobUUzUitaaGczTFUrbHIzTE1KZlE0NHloK1o1aEhmQXdveFR0?=
 =?utf-8?B?cUxIUlFwais4bjFKVGhEZEpjQ3hYZ25qMVJkZStEWkhEdzdKc0FGTzl3UHNq?=
 =?utf-8?B?ZXRSTFpGcUJZaDY5ekhSTThxVGQwRzU5QjUyS1dGaWJsakloLzk4ZC9KMHV5?=
 =?utf-8?B?ZE41MVZzeUZlQ2ROT3VuSEllSFFsRmkxSUl5MER1RXh4OGZqRnEyVXFGdUgz?=
 =?utf-8?B?UHZQcHcwc0gvSUdMbUdCWEVYTlVjNm1HcStnQ2ZFMmI2ZEsrUHhJcjZOZktT?=
 =?utf-8?B?bUNZOGIxa1E4bzlGclZ0ZHVuQWFjWGxZNE8rU1VOVGhwOFZBV1BVWTB5R2xp?=
 =?utf-8?B?NGtoNkNOYWdNK1lsOHRPRVFzRUtEeTdmemhKblQ4ZHJLNkRoUkV1ZFpWZjEv?=
 =?utf-8?B?bkdjR1lLMWZacHBJOFpkbFVxOTNTS0xGNUliNlhDWUZ0UWVCUXY1RTBNVm9q?=
 =?utf-8?B?ZW9TSm1CdTJHQmNHbkladFZSSjdvdjgvNlMxU0xNcHVXeUJETjlvTmhhWW1U?=
 =?utf-8?B?cExEbXF4dWhrYlU5M01iQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dkRycGRqS2xib0RDRllVYkxsamc3b1lxbkg4VkJKMDVTUlQrdk9iNkxLWS93?=
 =?utf-8?B?TTVlZXYyVFdJSHZvL3ZGRjdmN0RvbzlvbzY3U20xbWJxT1pOSlVock5wQjlw?=
 =?utf-8?B?aXQ2QlZDdncvMzlQWTNSeW4xbUl3SHJMd28ralNqZzczcEdtaEFGOGE5UEdo?=
 =?utf-8?B?bmxrVS9GNm1hYVRxQldZaW1nUEFvbmxYYzQ2aWEyOCtxbU82TkI5SXJuZ1F2?=
 =?utf-8?B?N2dIcmovaDF3NVc4YkUzL0dJOEpKWjVOaGxBMWtTUzZqRGNibmhXRmp0d29E?=
 =?utf-8?B?Wm8vbHNCeDZON2FScEVhc1gySExlYzdwdTNKQU5EdWtVYk1wNmJGZ3QwSVZm?=
 =?utf-8?B?YUFBMlRSTE5vbURwR0FuWEVKSWo2TnRqazdZWlI5UEtkSmZjTkdnK3BhN2pv?=
 =?utf-8?B?d2s1NUtNSStDaEFtaEQ1R0lNcFh2cjNJZWlPREVGVlRjWnNrcU5GWXd1Qyt0?=
 =?utf-8?B?aFA5WmtWRFJCKzMvV0Ivd2Fob2lRajBpaUFEVzVGU1EzbDNmbkhnZHp1Mm50?=
 =?utf-8?B?ZzU5ZzcwcXg3amVNUUxhRXlnNDJ5RE5ER0FpMnV6VXltZXl4SGY0dmZvSDNM?=
 =?utf-8?B?aUtZR3Juekc5TjM0anprdGRCZ2NpcFBRSG9FNVNFRC9nYjI3aUZMVDN1QlVa?=
 =?utf-8?B?WW45L1NFdHlML1B5VTNxL2t4cHg0OU1wSENJOHA5Q3J5VDRIRnl2N05Ob0lF?=
 =?utf-8?B?dmxjQy9SemlrdG5YaEFBZzc0VEtSU3NjSEFQb1lKSUU1dTRlN3ZGNE14UE1w?=
 =?utf-8?B?U2ErVDhnRlVKeUFRM0tSZUs5Rk85aytDZWcwYUFhVkpCLzJqNVY5WG9XdWNh?=
 =?utf-8?B?ZWY0bElWa0NRMVhrWVBCa2FDOHBEckhvM3BLNGxiZkpsY3NtYzkvY3lGUkZz?=
 =?utf-8?B?dGNaeDBxMTJIblFSOUptNGNGN25Vd2tvaVI5dnUxZlNJYWg2ZGhPWFdPZWdo?=
 =?utf-8?B?NHpoWjRBZGp0aXB2NlhqRW53OUJNcHlMYjZiak5GRHhaSVFiYjc5UWViMlJr?=
 =?utf-8?B?V01ucWFWQTNZbWJQRmlwNDhyV2hxRE9EaFEwZlF3Z3NSOHBvT0o5Y1ozejVp?=
 =?utf-8?B?UFZuQjRsZ2k2TDNkOWs3V1FmUjZwS0tDSDFnR3VDQzRRVDNEMlNvK0hidjJQ?=
 =?utf-8?B?RGZoK0ExV0dscVpIVmdaR29qYWUyWmRIOXE3OHh4LzlxcDlNaHIyYmhpZ2lB?=
 =?utf-8?B?Z2w3Q1hZY0xNTkxhd1lRMHRoMFR0emFXa0htU25NT0d3OHliV3ZIRytyZzFM?=
 =?utf-8?B?L04yRnp0elk5a1RYcFdiS2gyZ0FoRVR3S3paMlpPL0xyT0diSm1XdnZteUVI?=
 =?utf-8?B?Y0ZaVkhSbGE2ZWVZelpxNjhiOGg1TmhUMUVWQjFPRG5TMGs2eDhTczVPWjlv?=
 =?utf-8?B?YjFJdFUyVkp6eG1TZlJrQWxFV0RIcnBaT2J1ajRBVHhBVEdZd0Mwb1lWRFhL?=
 =?utf-8?B?UW8wNEh4RHh4UFlGc2RseW8rc25jRklrc3FQcW5JYXNTWkR0QXFHeWVxZUN4?=
 =?utf-8?B?S0VBQWxXTHhOK0R4dFBjVVlRUk5ibnU3SktJRWNMN0tHVjcwR2ZTRWhEb0dE?=
 =?utf-8?B?dWZlRlBBa1Z4OWpydlRWTGpQekxyQmdveTVsTlo5Y1kyUVhGMVVRcjFSZXAr?=
 =?utf-8?B?M3M2ZWFjWTNBd3l1OTdaSzErNXZMd2x6OU9zTll4NzlmNnp3azlPNzVKOVk5?=
 =?utf-8?B?T28vUHRwRFd5U0RCLzd0dENKc0QzVnJEaGY5bTRzNHo5S2p3RVNjcmdSZkhH?=
 =?utf-8?B?QTR4endOWXZSd3MvNnVLWFlmdGRqdlNYdncvWlpMWHNYNWtnd2gwMmtPQThI?=
 =?utf-8?B?WG9vNjJQSWxHUXRBaXdXK25aS1NWTEVYV2R3N0lkZ2RabTlJOFZvYWs0QmQy?=
 =?utf-8?B?cThGZGJoWjFTSVFiWkpxd3hTODhyS3RJMkpCai9hZ0hmaytnNXR3ZHo0dmN3?=
 =?utf-8?B?K2YvUFpHOUsrdnRWYWx1MDZoSzlmWU9Tei9WdmFrN1NyMjNvTkN1SjJjLzY3?=
 =?utf-8?B?SGd2cnp6WEFGZXJaci9zdnlZS1Z6d2lENzhlK3pjTkNmKzlqTVZDcUhwZzA2?=
 =?utf-8?B?UWg4MmF0R2VDbnBFb3FXS0VSeXRvbGg3Rm1tcEcrVnBSNll0S1MwMEhjdVRU?=
 =?utf-8?Q?q5XN2C/FCNaBKFWsMxLakaSqG?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92f7342-540d-4a72-7b1d-08dcea9a7e73
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 08:47:24.8785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fvNQOz6+BG7p6Tnj8qWpp8Ixzl2Ol1GWSI0xDVY5aBaMWQyXnxfZ0cDEDWkP5Pmx8t18KoPMAym4EJTipNzOfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7562

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add ISI support for i.MX8ULP.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 14 ++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c2013995049c..528e723114d5 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -307,6 +307,19 @@ static const struct mxc_isi_plat_data mxc_imx8mp_data = {
 	.has_36bit_dma		= true,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8ulp_data = {
+	.model			= MXC_ISI_IMX8ULP,
+	.num_ports		= 1,
+	.num_channels		= 1,
+	.reg_offset		= 0x0,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.clks			= mxc_imx8mn_clks,
+	.num_clks		= ARRAY_SIZE(mxc_imx8mn_clks),
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.model			= MXC_ISI_IMX93,
 	.num_ports		= 1,
@@ -528,6 +541,7 @@ static void mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
 };
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 2810ebe9b5f7..9c7fe9e5f941 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -158,6 +158,7 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
 };
 
-- 
2.34.1


