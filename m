Return-Path: <linux-media+bounces-52219-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB7gD1b2g2kwwQMAu9opvQ
	(envelope-from <linux-media+bounces-52219-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 02:45:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A972FEDC25
	for <lists+linux-media@lfdr.de>; Thu, 05 Feb 2026 02:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 98F5730157E7
	for <lists+linux-media@lfdr.de>; Thu,  5 Feb 2026 01:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6407420E6E2;
	Thu,  5 Feb 2026 01:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Fel3xI+U"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D97F156677;
	Thu,  5 Feb 2026 01:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770255954; cv=fail; b=l8EsZZWlQ/REJ+HtjnDQPleBn5zih++yC0DhCJ81n5Ehu/c7172IFC5cC9y7Lzq3SdeqjjTpgoHwpOn+EL3/n2MyegRNiTDleMLiejHv4LkCseWROl/5eImss7KSFh0qHD/JadWmaK7TesfhkZYKVsZHOmo1cQ7Bn+JJQv3C0Bk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770255954; c=relaxed/simple;
	bh=xIatBQvFYthOm9RnaQXM/hNo9b8kSz4zZapAEZL5kkI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZtASD0/pcbGgx53YaumCvIOxQzAdnI2bBX1NWBmILwPb4hB2JRsDBhPncqImseZH677/qGNw/F5hMqAsHjjZ0Yd6fa93AWbGLrrElaW4gToOAmGxsN34cH8iCpajCd3JPVOQNuD7aETrwrpclwHiMQy6P0HizFwKRML6OwC6KHA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Fel3xI+U; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WwCHgIn+Ec/Am3hk+tWV93O9Tc0OVSDKiAVLqQKh2mbugdgbigLF3fRIS1xQBXHw6m/Ilfff5P5rR1F8uEcP8vTuZxIQFdYo068tgGiWFB6I0mIRhi8tMaMYQ4p9NgI/DELEC3vprZER6rgAQ4kyPkBMpHLEpp69Q1+4hY56kOEHb48ia8kA9IIlIKJY7J/t/GoXYOPk6uBWtbD4wnUs+Qb2QGK3paa0HrRXKKJPC/7y88l5R3o/6Ew7q2x4ejoEe4dBkeOfTzZUI6OBN5bXacTT7wu+acCKDJ6F1LAnhiNZjEEC0BNPQ8OXX2T9EojBbh5kNEcmsxEGEGmAD2VeYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PPe2spkxIIKKXLNmjhdpUOc1VilVoI4P8TYSHODhbRU=;
 b=nvhRzOQyauGTokjX/nhlqgUmxOYBN6HrSWCQgMvukOpcjtI8Lcbq1FihXfJ0nGd/965ltZ/xocJgDloCFMVsrjfxXdCP9vvpL/4YJ2Ys5MjcG+7qdmBb8qqEJ9LURL8YPpYkL1n3r6nRBjlM5+TB7m/2XtjcfJy/OKguOSd53zpfxDHbDXZCFphi3tqeNcS3Wep/3+NF350FPGS50v4UJ0PP7GCXwqGjM9Y+2pO3c+l/EJ7thM209viprdnNJPNN47CNxp2RvPK1mC+lePRDl9p26GVBhhvN0MqjqC0a2dpQwhub/Dgevzi8SOkGMOoLyesF2Nx2VsLrC1aYYxUM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PPe2spkxIIKKXLNmjhdpUOc1VilVoI4P8TYSHODhbRU=;
 b=Fel3xI+U/S1U0mJzzTg9tbHpAy2EjvXpsXyEDwz5EdS28lZXPS1r+wl/udvIoITBpPSlLNM5fgPS9Al28k2u5ZtWHzp4RAF/HzT4Kk/dFPDcCt7ODSznYLSIf1KPvK7V4tHf3Hl9pDAPhxC9WOH4+SC/Yce21aQRqhHYsAFsCvfZOIhE5Jj6dZn40slA/kSRtIvmoKd74qZxvwukREsIwCctmfz0+AfyV8wptnjBN8dAydSTfCUBrD3lwjmdE0QP6HW+u02545Kj5jOBjBpirN6A9cyPC7SQ40j4OmA/jlng8NAR7pZUwHH09ab+JXiHAYeWza9dbrGydHRoeellww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB8441.eurprd04.prod.outlook.com (2603:10a6:102:1d8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 01:45:50 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::20db:4017:28ea:911b%4]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 01:45:50 +0000
Message-ID: <e8ada353-3e65-4014-9b94-622be6180c5b@oss.nxp.com>
Date: Thu, 5 Feb 2026 09:45:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] media: imx-jpeg: Use devm_pm_runtime_enable()
 helper
To: Frank Li <Frank.li@nxp.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, mirela.rabulea@oss.nxp.com,
 nicolas@ndufresne.ca, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, linux-imx@nxp.com, imx@lists.linux.dev,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260203082349.1082-1-ming.qian@oss.nxp.com>
 <20260203082349.1082-3-ming.qian@oss.nxp.com>
 <aYIopWM4U9YQB2SF@lizhi-Precision-Tower-5810>
 <0f2cc5d0-9abe-47c6-abdc-42ebe5fb5b35@oss.nxp.com>
 <aYNo_XjfrXA6tKX-@lizhi-Precision-Tower-5810>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <aYNo_XjfrXA6tKX-@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:3:18::14) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 7662b773-8182-427e-0321-08de64584a56
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mkp2Umx2eDRFNXY5eVpjSlR3RnRwV3lhQ1k3ZmtRYldMc1l2QlhQMnNadXVn?=
 =?utf-8?B?ZDBjaG56YTQyeGVLeVVsOEh4UllBZGVoTVRKczlqQ212Tm5qZjNTeVA1RVYz?=
 =?utf-8?B?aTNnOWllYUlUbWpyamRHemZEWUd6MmV1YjNkRXc4dXVCYzU1RUVNREx1UlB4?=
 =?utf-8?B?ajMxQ3J3YXhaMHJJbUJoMk44WjNwMGN6MGJvQ3VDS0dMVWVGNGU5SHlFanZ6?=
 =?utf-8?B?dkcxUHhCSStSS05nZ3dKRWFsNnp3RDdjaWdOeHJnWU1yVlUrQjFtdm1hWWpG?=
 =?utf-8?B?cjNKK21FMklVWTAzZFBhc0NLc1FzdlZLQzdSd1U1bHBhcXdUV3JuZ2hEeEFM?=
 =?utf-8?B?elFNSzFnWHh3RnE0eWhsaEo0QzY2bHh2YlBIb00rN01IeHdmS3hrbHlzc3d3?=
 =?utf-8?B?SVJTeWVRRkp2L2xFelNnTE1FNExpRmxOZDl1aDlRWHpHdlg4WGE1ZUdnYWxI?=
 =?utf-8?B?L3FYZlYzb1N1TmlYdndIV1pQcnNkY3lUTDFTSytRQU5NVWs5bUh6WWJ5dGdh?=
 =?utf-8?B?emRtREFPQjdrQmJSWk5RTjNaLzRJcG9jUEpDbTkwR1BnVmdXZ3hlVlNRYWFp?=
 =?utf-8?B?d2Zad2liOWlFKzVYL3RBajErV2E2Vm1rU2VkUWlhUTRCY1p1c3dncDl3aDNs?=
 =?utf-8?B?cnVpeU4zZTFFTW5TOTZVR01mQkRqam5INFJGQ1dPckk5YjdmdExJUFZyd012?=
 =?utf-8?B?SVlaQjU1Nkd1Q1craDNjMEpXV1hVQldHa2hUazdoM2Rma08zb0ZyRzRWZysx?=
 =?utf-8?B?OVFYTEpxUjEyMjhqaDBSdnRlQmhVSUgrWHpLc25yOEYra2JuY2Zrd2sxUFZw?=
 =?utf-8?B?SlIxZnF1Nmt1dnllWjdreXJSbFdvalMzY3phZ1JQZ1BVbHZpSFNoOXFMUjEv?=
 =?utf-8?B?WnlCQ29uUlBFVU5wLzFML3RKWTFwOTM3VDFzYXkzZHlIZXZrdmNSTkNpTUZM?=
 =?utf-8?B?K0dqckc1VEhDL2t5Y0M2U2VndG9MTzcrNnRTSXlOL0VNK0M5SDA1bDN4ekdD?=
 =?utf-8?B?NVZDZGdJZU5sb2I3TUFoUm5WOFhGUDB5MlJ6dEpZS3ZkTlFaeGhBL1pjamdL?=
 =?utf-8?B?d0s2RytFR1ZET1BFbUhCY3R3SkJSaFptNUpJaVVERmkwdEdzN0MwUFNJVGJD?=
 =?utf-8?B?Y1ZUaEdwcnlKVTRxRERJdmQ2cWN5REkzVGltKzZ5dnhHRkVCMThRd1UzNjlR?=
 =?utf-8?B?NnFIZ2RMZDJvTGhCQzdNVnQ1czBQUzN6OWwzL1dvaEpRTmRKeDF1cjZtTGZy?=
 =?utf-8?B?Z3Nra2w4L1ZhTmRxZHdNMkdrS0tuNkFmbEl6OWU1djhiZTRhK2J4Nk5oOW5M?=
 =?utf-8?B?R0psWGFkOUJzZFB0ZENCWUFvU1dBTDYwb0R6K2xLemFkYjYxMlZ6ay92TVo2?=
 =?utf-8?B?Z25KajFYVk5Pb1JnaTgzWFNEQVVKRVRWa1pEUm1MRlphcVdBWTZybFVmSzdl?=
 =?utf-8?B?Y0VuTXYwQ05WN3k5bTVpNCtHZHN0UVBKcVRWREt4a0NBL1VJU05XcTVZTHVQ?=
 =?utf-8?B?aUthSWwrZ3VrVm5MZ3F3U3ZCMEI5VThKWXFjUkxwRkFrMXNlQThaOWs2SXFh?=
 =?utf-8?B?aFIwTEtSeHhCakkxY2pGWnlkejM4d21na1o4enU4S3lSQzl6TTg3TU5ZUDF2?=
 =?utf-8?B?dHJiZXl0Z2VNMEhEWXpIaDdHTmVkcThpRHU4OUxiRHhmMUcxZzh2UXFoZmtk?=
 =?utf-8?B?L01TVXA2K29wTWhhRytEOS9zUjFVdVdSOGQyTG9GNkhSallWZmtRRDh6eWp6?=
 =?utf-8?B?V1Uwa05JNmM3MUJLUXYyV1Y0S0lOdzdoMjZJMWp1QmlKSGxkMHlITW85anVn?=
 =?utf-8?B?Qm9iMWgxdnh2QTl3a3h3NzM2c2gwR01BVmdDaU1yMmJodUJyNnBKdklGS3V4?=
 =?utf-8?B?cUdZQ3JNR0pNZHRxZVZmUE1QSm1iYWZXbnltMjlWU3ZnTUxZbzc3N0JwK3cz?=
 =?utf-8?B?TXNWZlU0S0xFYlRZeXRpS0gveE1WM3NXU0xEd0ZOZjZybjl1V2E1TkdyK2c1?=
 =?utf-8?B?Rm9sTStYVFM5NzlvM1lpSW5vRzNBV3FzWTdZWHdtM09Bc0piMEM1ajlXOVlx?=
 =?utf-8?B?RXZuQUIrajVRVzFHQnMyeEhCMEQ1OWVtVjZYR3owend2VUhad1lCUkpMelJa?=
 =?utf-8?Q?J+9o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SWxLRDhJbDdMTk1LMVNTZ0E0M3ZiTzBxMDhFT21LbHNXWnZBdVdNc2NYSy9a?=
 =?utf-8?B?QjlTeHZ6ZFJxbEJNeXp6dTZDdnIrUW8wYU5DSXFIYUZrZjgrSGxib2pXdGIv?=
 =?utf-8?B?eEpNTVlFSlhicEliYWZObDNta0w2THlaejJkOUt6YmtaS0lYU2R5NTBVM2N5?=
 =?utf-8?B?ZERYL2p0U0RlR1JXOTZUSG0xVWZUbGlxZDg1L0Z4ZlNmSmV4T1BFK016enVX?=
 =?utf-8?B?UTh0T2hTK2RtVjRHUmJqdFVuN0dvRzZjR3orcVlzZENPSjhmRWcvV0crcUVT?=
 =?utf-8?B?NHBrQVNKcmFXWUhqZjJQckNUeldhSmFyR21aYzM3eSt2WmlJa3dJOEFNUk1M?=
 =?utf-8?B?M1FveXp1THpCNitRRGhoNDk2YjVZM2dFY0JYMExCeUE2S25QbU5sbXhLODZh?=
 =?utf-8?B?OFRYMjRvWDNQbEVzYUdkSEtEbmVxS3gwQ0xPNFFraURmN2paUmhaYlJsYzk4?=
 =?utf-8?B?S0M2eDNBVGt4b0cxcDUzM0JLVmVQUTFOUm9KMmdLck9jUXVod0hFa3RDRXRI?=
 =?utf-8?B?Tzdzd2RyMUhsNCtkMC80ZmI2ZUNKcHdXTTVPUUU3STlyT25JOHNWb3JQNGpu?=
 =?utf-8?B?dXFSd3dEUFAvZTBKaU9kb3JlZkdFZ1VmdlN0Tk42MkMvaGhaMDNBSW5qaXFD?=
 =?utf-8?B?cGF6OU52Kyt5WVhuZHBOOW1KdXhiZzNNSUlBMzlWR0NJOGtBUkZVTWNVdFBJ?=
 =?utf-8?B?UnZ2ek81ZzlSZ05mWDhDbkZOUmg1VXE0T0NVVDlOSGlnVzU2aDJvL1IyNEJR?=
 =?utf-8?B?eFJXekt3S0Y1VXFqYkJsSmFaOGZFUkJvZHJkRHZZdGtPMk4rYXEvRk9jMlJO?=
 =?utf-8?B?aWxVbHpqWUlmUk9LYWk5azEyYnFnREQyQVhHWFZVZWNLUzJMVUx3KzJvMnJF?=
 =?utf-8?B?ajFSSVZwTHNrUXp0WEI0NkNZcEY5Y2pnN1EyTjdwcjVUZmlRSUtTR001ZkVh?=
 =?utf-8?B?ZWdXYUNCSjdBTWhlNlRTQzNjVTJmckJ1RTQ2bHRmdE1TVmZITkNoS3pWV2Ro?=
 =?utf-8?B?OHEwL2k1THFRSC9JOHFqcFkwN2dyQ0Z1cjBxditjeDMzQm45U2tLcGlPcXJ3?=
 =?utf-8?B?bVJsdHVWWjdHd09kc0VVUTgzMk8xbnZrUlM5UWJ5WnFDTVlsdy9RSGlqY0Js?=
 =?utf-8?B?YWV2VWtZbDBvb3daVms2cHZPbTVYOVJYMmhwbGxKbzZOTG5JVzBTRWs4TVhK?=
 =?utf-8?B?S09ka21WRHRKbG1OanRSczJEeFkzTEJkTFVWMzBRZGZGNzdKVXZiUmozaGdR?=
 =?utf-8?B?KzhjVFpiRFcvQmxnRGxkdHlYM052RzY3UWZkWmxPNDRaejkrazE4eDkrYzM3?=
 =?utf-8?B?RFJTajRWRzR1Ri9zcW41b0ZkRHdWZStYNEwvbVFrUEZvTXl1dUgvMEc0SEtH?=
 =?utf-8?B?aVdUekdaVjRFajJuVStVMENBL2ZBWlVaamIzckhpWUVTUE14eC9IeWh3MDRt?=
 =?utf-8?B?UENZN0duVUdqbGZ0VXVqaUZUUjNUWUcxa043cDZwOHUrVDRzdDlSSEpDcFNO?=
 =?utf-8?B?c1dZYnlkUE1hTExqUmJoemk5UmVvQXdCb2VoL3dVQkplOVNPVzF4Mkp0VFRJ?=
 =?utf-8?B?Yll3Rk1NU3ZER0dRajVPR0tMNVlCRGZEOVk0dmk3LzNpVE5NcTluWlFuQVJI?=
 =?utf-8?B?R0FNM3Naa2RDZWZHUTh5cmVOdG5ZU0JKcGVuaWhUWEtvMlVkTHNxUFVpSGc1?=
 =?utf-8?B?bnBxYXJ1QzdXZWVRdFlSV3puRCtWeFFQQzhiZ2Z4ei9NRHNtc3hTZVhzMzc3?=
 =?utf-8?B?d3pML0RvOWdBWktGV0NJdXVUc3dTbWZtODd3N1dMckVuUGxUVXFrTHhORHYy?=
 =?utf-8?B?aEpNbmtIcThVQWkyT3NGMVNKdEEzZFFQbFU0T0oydWRrOHdNN0xBWjBYRnMr?=
 =?utf-8?B?SUk4WDQ5bzhsMEpuTDZVTU94Z3pHVUhjbDJVQUk1OWVORmFCalBTdTVHTFU0?=
 =?utf-8?B?cVRTMEZaQjJLNVZxd2QvNUVCcEVlUmlDK3hHNXo5cVpqcFgzc1I5WjZjRnBP?=
 =?utf-8?B?dnNvbEhsSHd3OVo5SWpqKzR0eFVGMXZWRUs5cTVETFVGNjhpWFJnQ0o3eDl1?=
 =?utf-8?B?Nit2ZGRSaTFIdTNhRjdBeTF3bWRwSXc3Qk5Ob0JFWEtqRHFmNHlWbUVKTkFj?=
 =?utf-8?B?ZFRtdkdaZjVEdHJlT0llb0dDK0dmcFAzelczZnlQeUVjaWdzVzVPOG8vL21G?=
 =?utf-8?B?NUxXV0JyS1dsT3UybzFUbldBMUU0cmF0a05tZWJ4c2psTThENkpYaDlXMGJl?=
 =?utf-8?B?ajU4VWRkWk0wS1pRYkFzQ29GQnJ6Y1J6TzNyVkJuSURoY1hEbjlFSDVvMU9m?=
 =?utf-8?B?MmI2TmtwSDZiSjlBSUxXYW5GSG12TWlCUzF1NnZJdEpBVWlUNld2Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7662b773-8182-427e-0321-08de64584a56
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 01:45:50.5696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Njw3XIXAAfof47tvjCe2lBS1i+qoK3Cf0qJ3lgc9Bsa+3hQQpEeFPVMqB75ZjGKI8RCyE6xO2HgXF7jiBY7iWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8441
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52219-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: A972FEDC25
X-Rspamd-Action: no action

Hi Frank,

On 2/4/2026 11:42 PM, Frank Li wrote:
> On Wed, Feb 04, 2026 at 09:36:06AM +0800, Ming Qian(OSS) wrote:
>> Hi Frank,
>>
>> On 2/4/2026 12:56 AM, Frank Li wrote:
>>> On Tue, Feb 03, 2026 at 04:23:39PM +0800, ming.qian@oss.nxp.com wrote:
>>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>>
>>>> Use devm_pm_runtime_enable() to simplify probe and exit paths.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>> ---
>>>>    drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 15 ++++++++++++---
>>>>    1 file changed, 12 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>> index 39022c1bf36d..877e6c4f7406 100644
>>>> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
>>>> @@ -2971,12 +2971,22 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>>>>    			  jpeg->dec_vdev->minor);
>>>>
>>>>    	platform_set_drvdata(pdev, jpeg);
>>>> -	pm_runtime_enable(dev);
>>>> +	ret = devm_pm_runtime_enable(dev);
>>>> +	if (ret) {
>>>> +		dev_err(dev, "Failed to enable runtime PM: %d\n", ret);
>>>> +		goto err_pm;
>>>> +	}
>>>>
>>>>    	return 0;
>>>>
>>>> +err_pm:
>>>> +	video_unregister_device(jpeg->dec_vdev);
>>>> +	/* set NULL to prevent double-free */
>>>> +	jpeg->dec_vdev = NULL;
>>>
>>> code have not simplied, you add addtional goto label. You can use
>>> devm_add_action_or_reset().
>>>
>>> Frank
>>>
>>
>> I don't quite understand the difference compared to directly using
>> devm_pm_runtime_enable.
>>
>> int devm_pm_runtime_enable(struct device *dev)
>> {
>> 	pm_runtime_enable(dev);
>>
>> 	return devm_add_action_or_reset(dev, pm_runtime_disable_action, dev);
>> }
>>
>> We still need to check the return value of devm_add_action_or_reset and
>> perform the corresponding error handling.
>> We may still add the goto label.
> 
> Sorry, my means put video_device_release() to devm_add_action_or_reset() to
> avoid goto.
> 
> If it is complex, you can keep original one.
> 
> Frank

OK, I get your point, and I prefer to keep it.

Regards,
Ming

>>
>> Regards,
>> Ming
>>
>>>>    err_vdev_register:
>>>> -	video_device_release(jpeg->dec_vdev);
>>>> +	/* Only release if allocation succeeded but registration failed */
>>>> +	if (jpeg->dec_vdev)
>>>> +		video_device_release(jpeg->dec_vdev);
>>>>
>>>>    err_vdev_alloc:
>>>>    	v4l2_m2m_release(jpeg->m2m_dev);
>>>> @@ -3047,7 +3057,6 @@ static void mxc_jpeg_remove(struct platform_device *pdev)
>>>>
>>>>    	mxc_jpeg_free_slot_data(jpeg);
>>>>
>>>> -	pm_runtime_disable(&pdev->dev);
>>>>    	video_unregister_device(jpeg->dec_vdev);
>>>>    	v4l2_m2m_release(jpeg->m2m_dev);
>>>>    	v4l2_device_unregister(&jpeg->v4l2_dev);
>>>> --
>>>> 2.52.0
>>>>


