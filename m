Return-Path: <linux-media+bounces-38119-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 040F6B0B7D2
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 20:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 48C857A6331
	for <lists+linux-media@lfdr.de>; Sun, 20 Jul 2025 18:54:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2111722156F;
	Sun, 20 Jul 2025 18:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="meXP/3FV"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013024.outbound.protection.outlook.com [40.107.162.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A235042AAF;
	Sun, 20 Jul 2025 18:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753037774; cv=fail; b=hOdK3Wt0zGg68qw9KsEStFGoGzYbAJlOZXbRjYjuCkrOsn/fCDwZ0SYdREn7OMNX8jhbc9j5YtrVOX4LmiizFYIwQYMjhjR9TUZ4+NCcVnkgURqc5tklBVNRa8pF7dKEOzdXwRKwKWBEmxY3UucpMyFh0/QrmPb075RquzpD+jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753037774; c=relaxed/simple;
	bh=zPILJZDKPg9InpQTvn5qjC4MkFsJJWxhKl4O9mEoOUQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ddWJ+f5BJNjIGKUjyJ76v92ryaI281uYwrynWYEt4poU759BsB3FMt0sxh+5parBYL3ZSkbjMi0QSCcOtJiRXjS3NvP1sIOyV1yf3wU21u1G/YZrFZ/JmhePK1mk2he41DTriUzb0iJa8KIPSA0wdp+U0oPCniAXjuDL5zjCAks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=meXP/3FV; arc=fail smtp.client-ip=40.107.162.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wT2o1g2GjBpaZLrxDT4aVN0+oCD/WB/qy7w6FJt3dZyWlYJj4xbyw6+24cD9a9eAsb2wD+zmN/TCigPmbLTI56sXhJi4i1oDKUL6bRfrRYU9etQ+NdlONB9CfOpyg7Thbv4KVJm3S3L0oa6E/5QALFgHKqzHeQ8n3VmU0c+M7O9V8HE2G44RZxCS6sGAWAMyHPrKvm1ckLbpzdKy4tS5nJUVO0qYByJv/YGtSiIM4Y8Vjdo69BPkzo1zv8ERrooHG70Lj47NTRx3DZzBI8tzY5dDl0mi6PHtEMnflROklPHak1ZT/F+7JA2utiTmo1s5iCA6eJdYJ9zjnwFS398itQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzKI/m33xpwVgoMzWZQIM/nRTO5FHy7dzWrSPN6R50s=;
 b=EsCkIpbrPquSPiYPp4cKCKSlvEg0KOQoHIZr+EKKdP7cXc65Ldq4qjuTb7KZzycHHM99e+03gSAeQYfwU8p9+dBbqWefOiYVmtmFqYYKteFp6ZwRoWFj5+pmZGaBgkJ/cjiQ2WTB1NzLpoRonxVhLbw+1Hgawzvcqhu0OmeeLwVCjxLwkL+2WRWoz5SILMQP0P16+nz1KkZvDhQ1rwQXMxaIXwhmnSCMBXf16zskWWhU6MVQyVtxtpEiYJ9ZCm+cCzZ7XJfUzOOdoyVN09ZVPhdYVZZUo5l6PRhBeqcn/m34g5xZn66LncJbz/aA5DmBbfou25dELznbKmgFau/c4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzKI/m33xpwVgoMzWZQIM/nRTO5FHy7dzWrSPN6R50s=;
 b=meXP/3FVKfE+gsTV1PnEvFJOKI3h2Tx/LLeFCBWPcoY8ySbDeVicaBwf2UowlbEsxy9iIE4RSO8t0x76RgBHLPVsecqByPLpEOQnUVmpCtAPY1raCsUtkXWEo1Fjs4R2i1LsIQWDEhq5ha+gyTuTxRPP6WCu4z5+vHSICSqdEmoVsfE1rqNCZeEruR1Ra/HbbWbJ4FjYt1O+HAvLvLEWqulwgJX9OuLaAjL2XcpMaMq+T02VP6hAUgRlDndnbX+QL+QpEPjP4IVl5E0eUMf4p6PgMpW7P4zcgr+52iBGLNeBBH2kKhwX4Wn9i6tmsEX63+9NcNntZtOA8GKEZQsH+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AM7PR04MB7064.eurprd04.prod.outlook.com (2603:10a6:20b:118::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Sun, 20 Jul
 2025 18:56:08 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8943.029; Sun, 20 Jul 2025
 18:56:08 +0000
Message-ID: <38e022d0-cc8f-4df2-8a81-69513c854035@nxp.com>
Date: Sun, 20 Jul 2025 21:56:04 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: Re: [RFC 0/2] Add standard exposure and gain controls for
 multiple captures
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, ribalda@chromium.org, jai.luthra@ideasonboard.com,
 laurentiu.palcu@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, LnxRevLi@nxp.com, julien.vuillaumier@nxp.com,
 celine.laurencin@nxp.com
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
 <20250715235952.GE19299@pendragon.ideasonboard.com>
 <20250716001205.GG19299@pendragon.ideasonboard.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250716001205.GG19299@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR0202CA0020.eurprd02.prod.outlook.com
 (2603:10a6:803:14::33) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AM7PR04MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 0de7f230-361f-48b3-a9cf-08ddc7bf1635
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bDZSU3I1bnNXelh3cVEvL1FkRXUzRmFHV0x1ZkJIQ0Q3ZWs5UkR3RW8wdUFH?=
 =?utf-8?B?bnRrVFlXUnVNOTBxS1pDQnlibE8yWFpwa2dBd08xVzdNd2M2NUtGeTRiSjFD?=
 =?utf-8?B?TU51VmkxNjQvZko5UjFOQWFUQnJZRlBRUjRlcDdHL29GckVNQ3JtaVpVQnhz?=
 =?utf-8?B?YlF6eGROUEQyVjYzUmczeWthWFhNM1NUUW5yYisrZTRVSnFUZy93Uy9aUEZ6?=
 =?utf-8?B?QVBQM3A4c1QxdW5MYUtudVBJdVF2cmlUS2FCcGg5V0ZVZVZidXl5WTZwbVd1?=
 =?utf-8?B?YXk4U01PWDIxZEdWbGhJRTFLR0Zma3ovN3lQR0tCdld4V09jWjNkSEViRUdD?=
 =?utf-8?B?VHE5T1JvQi9oNmN4Rk44LzRwdm5CRlV1cHlhZktHZkx0cEF0UlMrcStZengw?=
 =?utf-8?B?a3BteVJUNVRPMGRWYzlhaGkrQjBNTnhYTEhYTjIvMnRnVzNCLzJYbHF6RFk0?=
 =?utf-8?B?OUtmTkI5WGtXZ3dkNnFJeUQ5NHJydjBlYjZqb2VoMVFpSE01YzIxTnpKcmpM?=
 =?utf-8?B?ODFuNlRIa0ZQeEQxTnVWN3ltZXZzNER3S1VpL1MyZFByYllVelJXa1hEVkFF?=
 =?utf-8?B?TGk4SWJ1aFlRd1YySS9Zdk9tWEUxanV5aG9OTXl5clk1bVdPRlFCY1VINklR?=
 =?utf-8?B?STdkLzEvMzVlUGw2TElITHo0TkxGMHl6UUNONTA5T3ZlWlcxbkV4b21pUDF4?=
 =?utf-8?B?cSszYTR3Z2hiNU40eWxVTEpTenVMSEUzN20wWnJkck56d2V0QVREUlgzWW12?=
 =?utf-8?B?ZWJBcVJpQ1NzODNLY1JYb29tZXVSQkNramFQeUhUUTI0WGR5ZFhCcVNiZ1RO?=
 =?utf-8?B?NXVZTE1sSFREUGZiNEp1c0VTaExuSUMwUU5nREtydnJrTk0zZzlNUW1INlBq?=
 =?utf-8?B?R0ZYV0VmN1RaZkhsSGtFS2l0YnREdXJzcVZpLzROS1UwTmJzRGcxek41WFpB?=
 =?utf-8?B?Szk2eDg3K09DdktMd3luSVZtazZqa1gwb1FTYlRiV2lEV3J1MXc2YzhWNDNi?=
 =?utf-8?B?WHJXTCtGVkNYOVE0SG1DeEVGRWt2VkJpQUpqODB2WmVPcmwwM0xmSmJWeXBG?=
 =?utf-8?B?Njl2YXhEeXBpdXZIRXdsbnc1eGxiQVN0bGtrRnl4OXFiUUw1bXlIQXhmVU1B?=
 =?utf-8?B?SGFJemZoc1lPZE9LaWFsMWNFUkUzWndNZWRuS0MxaytOKzByeUxmeCsycm02?=
 =?utf-8?B?VzUrSXZ3UlA5VU5vRys0ODA4UDFnR0NPVmtxcXVqcXNycUhFWXhoSDJqT0c5?=
 =?utf-8?B?UFMwZ3FrUjBTV3MvSW5sVURLUHRrMnJ2a1BXOVNpTjZ1b2pvSWNDdWd6V0c2?=
 =?utf-8?B?TjRhckwxaFF6S0NXcjQxRGdQMGhWcDJ1Nmw4aGJ3akxITU42WTY1Rk9rMU1C?=
 =?utf-8?B?cGJLTnJ4dWIvZTV4MThwQUFLMUFtaHpGZS9raU5GaDd3T0RDamtBSXNjUWlv?=
 =?utf-8?B?SHpOVGRhbGVDNHZXSmlrcDhQbmpNTHFFS0UrejZhWVdlanNRb3M0NVVYVkFM?=
 =?utf-8?B?NEFTM2dlejRBU3V1VUdqTExha1VDSFQ0WWwybFNTRUoydS9obVkveU02d01X?=
 =?utf-8?B?SGxqQU8wR1BOYjhvZ0ZrQ3VWMzBDMFY1Ym9WaG0weFJZbUNmTGx3WE5hZTFl?=
 =?utf-8?B?OWlDVlVtQkVJWU9rQkdsbFF0dEMrV09qNlI3bitvVXJGZDRUV0pTY3hwVE0w?=
 =?utf-8?B?blk5L05FK1FBTEh4bUxVbHhLZXUrWTZhaHZrVWE4Y28zWVZpdWZ2RXpQbXh3?=
 =?utf-8?B?ODIvQXdqMEFlUFE2RFRLQldDaWtjVnRBSzFVb0QvOTdHL3MrLzhLUFI0RXFp?=
 =?utf-8?B?dThmTlQ1UGtaNG1TOVkvWVNmQklmcjFzaTdLSUdZUkh4VENWNVJLN2d0L0hp?=
 =?utf-8?B?SEEyN2w0bm43RnF1bFpGVkFhOEJscEQwOHkwNWF5QzhaVC9XTDJpMXJBKzhZ?=
 =?utf-8?B?OHRMdjdwSVdhUnJOR3VuTkp4S2owamovbU9nckFSMG1PRHFTYzMzU2ZmUWlF?=
 =?utf-8?B?MmtPSk1Md0VnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?M0l5M3hxVnJKQzh1d21oUDIwMVpNOGZVNkJaTUo5enpQWFRqK0c3ZU5UUjcr?=
 =?utf-8?B?TmVacXlOL0JJQ0VLT2FBRCs0eU91a0JQdmQ1UWhvRkxFUnIxVFRHeWdrRDEx?=
 =?utf-8?B?N1BBRndNd1krenlmS1ZjaENveW4vbkZMYVdXOE1oZGhuWG14WkFOVGc5bTVS?=
 =?utf-8?B?VVhuUnpmUXRHcENpT3FZZk5zWXp5YTVaRkZISFU3cDh4TjdQd2JZaitvdWxG?=
 =?utf-8?B?NlJwemdjOWp0M1dUcU9yb3R2RFFUSWNNckpmQi9CK25EYW94dlBwVDZMdlkr?=
 =?utf-8?B?ZVZoYk04d01iQVNQL0pSeC9PR2VSTktMVXJHN1lFc3FzUDdpZzlzdUFpRWFi?=
 =?utf-8?B?UEU1YzVmbmk3cUFtSFd5bW51UmRCNllGeXZkU20xb1VyeUhuNVp1L1pTUmZv?=
 =?utf-8?B?U25DODZ5aFR3NUJoSU5zY3RjUXIvKzlrY20xek14dm5EZFJVME01bTNIUklu?=
 =?utf-8?B?U2RzUHgzSmZqRlRYVU9GUmVMZWVHdkVQc0pnUUtrYTdtNlJDdS81MzZmNzU0?=
 =?utf-8?B?R3d4QTR3SlJ1Y2pOdW5BRVNnblpON21SZUc3RFpyWjdjR2RGWldFTFlKaWRk?=
 =?utf-8?B?SGE2Q0pJSXF5UlpGNFVGU2xTR2IwRWlhNzVXS0pWUGtFYmVQRjRZZFp3TVlk?=
 =?utf-8?B?OExFVDgyUTR6V0kyODBnY0kxSFZmTW52VW1IajEzemFjUGkzYzJyNTNSSkNY?=
 =?utf-8?B?aXJHalRJVTV4TU1OYi9XWlBqZ1FSYjBPZTdWMXV6OEZEbkhuL0djL21zK2JE?=
 =?utf-8?B?RnBuSVVBOGYwT3lMQ2pLT3YzbU5IbzdVZ25LTXdjVEJYaUoyYUNsamh4SXJy?=
 =?utf-8?B?NHFjYmlPQXBqRFl5WDdjdWM4U0szM3ZmcjVlRysxZHpyaGF1YTR1dEV3dGdk?=
 =?utf-8?B?L3hRZUVqMjZ5Z2tJN0hyWGI3N1M2aXlqRlUvR1BaaWZ3WlRwT3JrVDFSSGtY?=
 =?utf-8?B?RDlEbm5oaWRwMmUyZExxWTE0bUVqS1NJVXM5Nkt0SzBseEoyNUhvbjRwNHRo?=
 =?utf-8?B?MGlVRHV1MDE1OWVnb0piRDNoWXVBSzUwd3NCWTUvWGxjQUxSY0xCbVpJWTJl?=
 =?utf-8?B?TXJiaCs0VUZCUERYZWpOamRENzJWYXZjejkvVU4wT2JST1JvMy9kdkh5MXo1?=
 =?utf-8?B?dFQ2eGlOK3QzZXNUaEpGWWFKNnZkVTQ3dVVDdUR5cVM2bjNzem5JY0ZQNmZB?=
 =?utf-8?B?elRzSnJGMW43RWNoVGlwS1VGcWRQUS9IU3k1eFpIMGVvbHNIMmkrdUtuVlhn?=
 =?utf-8?B?SmV1YThLSjRSMXBETFA5ZkRsV1VMMlFmb1hRY2JQaXZ4b3NSR1ByNTVjM2Vn?=
 =?utf-8?B?eDJZdXNiWDhzRXNUY1c1RlFzS2VvSlF2SU1uMTBaTkpGQ0MzRGpCZSs4Uis2?=
 =?utf-8?B?Q0htS252cDc2WVFZZmpJSkZ6ekZNT1BFakQxaDQ2NmNJelR1NUZnd0FIQWd4?=
 =?utf-8?B?S2tlOCtyYTRxQThNVjR1a01xL0JwOGZWOENYenVnQzVQWkFCdUI3VjZ2ajRs?=
 =?utf-8?B?cVNSakJORFNBNkxJWWtUK2tvUE9UcDgrMUx6bUN2QzJvQUVxS3pKMWZLWVg1?=
 =?utf-8?B?ZmUzMnhTTjQycysxZkV5REpPQUpwQ1JEYlRiSER0a0VtTVdTN2VRMVhzeE0z?=
 =?utf-8?B?TXVnNFAweDdwSG5KaFNXMm11UVhmcXZWMlpjQ0NTbkxPZzd2N1NqUExwdU9C?=
 =?utf-8?B?a2U3YXU4VHBPbG51RlhPMTVodjNiRVJRa3dvQkhSOXdnVm1QMVVncWtYZVNL?=
 =?utf-8?B?cENjcjdlZ1ZuWU9Hd0dvS1YvWmpzbU1USHV0T0VvUHpZdVlva2RmQlUvcWIz?=
 =?utf-8?B?L21yT0MvVVNuTjlNTkp6WTdSOVFnbW53R2V1RExYV1JDOEwrb1lFSXJnTGZz?=
 =?utf-8?B?TGRnU3A2dFN2VW9EUzhsR29iWnFFN0JUa09jSTUvRk1aSGNmNTV6aUh3cG5D?=
 =?utf-8?B?NlFhZUVpbVQwdjFXVXNRWVYrT2JOcjJ6Q0kvYlBuMEs4a1MzZzA2YXY0ZElP?=
 =?utf-8?B?VGJMS21oWDh6K1NNa3NKbkNBWnhocXBBUUJnbXduT2d2Slh1eVVQdndxR0Vr?=
 =?utf-8?B?OXdnbmtSMXEzZE80dC92WTQ5STJKV0RVclFNWjNwNDNOQ1dFcDhObTFLdGNQ?=
 =?utf-8?Q?FXKIfg5rHhHVzDewdk5pAdOtQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0de7f230-361f-48b3-a9cf-08ddc7bf1635
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2025 18:56:08.3148
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQrR4Nn/HMXlQ5YWZR6386Wj0KfrN6HtAjPDPS2ryj9OG3t5YTLHfwOTpy+HnrlES26CqPzMr37cfl40mNUFhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7064

Hi Laurent,

On 7/16/25 03:12, Laurent Pinchart wrote:
> 
> 
> On Wed, Jul 16, 2025 at 02:59:54AM +0300, Laurent Pinchart wrote:
>> On Fri, Jul 11, 2025 at 01:05:42AM +0300, Mirela Rabulea wrote:
>>> Add new standard controls as U32 arrays, for sensors with multiple
>>> captures: V4L2_CID_EXPOSURE_MULTI, V4L2_CID_AGAIN_MULTI and
>>> V4L2_CID_DGAIN_MULTI. These will be particularly useful for sensors
>>> that have multiple captures, but the HDR merge is done inside the sensor,
>>> in the end exposing a single stream, but still requiring AEC control
>>> for all captures.
>>
>> It's also useful for sensors supporting DOL or DCG with HDR merge being
>> performed outside of the sensor.
> 
> Regarless of where HDR merge is implemented, we will also need controls
> to select the HDR mode. We have V4L2_CID_HDR_SENSOR_MODE, which doesn't
> standardize the values, and that's not good enough. At least for DOL and
> DCG with HDR merge implemented outside of the sensor, we need to
> standardize the modes.
> 
> Can you tell which sensor(s) you're working with ?

We are working mostly with these 3:
Omnivision's os08a20 (2 exposures staggered hdr, each exposure on a 
separate virtual channel, there are also other hdr modes which we do not 
use)
Omnivision ox05b1s (RGB-Ir with context switching based on group holds, 
1 context optimized for RGB, the other context optimized for Ir, each 
context on a different virtual channel)
Omnivision ox03c10 (4 exposures, hdr merge in sensor).

> 
>>> All controls are in the same class, so they could all be set
>>> atomically via VIDIOC_S_EXT_CTRLS, this could turn out to be
>>> useful in case of sensors with context switching.
>>
>> Agreed, we should be able to set them all. Are we still unable to set
>> controls from multiple classes atomatically ? I thought that limitation
>> has been lifted.


Maybe I need some background check on this, but looking at kernel tag 
next-20250718, this comment still lies in the documentation:
"These ioctls allow the caller to get or set multiple controls
atomically. Control IDs are grouped into control classes (see
:ref:`ctrl-class`) and all controls in the control array must belong
to the same control class."

Maybe it needs to be updated, or not...since there is also this check in 
check_ext_ctrls():
	/* Check that all controls are from the same control class. */
	for (i = 0; i < c->count; i++) {
		if (V4L2_CTRL_ID2WHICH(c->controls[i].id) != c->which) {
			c->error_idx = ioctl == VIDIOC_TRY_EXT_CTRLS ? i :
								      c->count;
			return false;
		}
	}

There is also another inconvenient, the VIDIOC_S_EXT_CTRLS does not 
reach the v4l2 subdevice driver, what we get in the sensor driver is a 
set of .s_ctrl calls. I don't know about other sensors, but for the 
Omivision sensors which I am familiar with, the group holds feature 
could be used to get multiple registers to be applied atomically in the 
same frame, but the sensor driver would need to know when to start and 
when to end filling the group hold with the desired registers. If there 
is some similar feature in other sensors, I think the VIDIOC_S_EXT_CTRLS 
should have a corresponding v4l2-subdev operation, so that it can be 
implemented in the sensor subdevice driver. This would probably require 
some changes in the v4l2 core, as currently the subdev_do_ioctl() 
function does not let the VIDIOC_S_EXT_CTRLS go to the subdevice.

Laurent, Hans, any thoughts on this?


>>
>>> Each element of the array will hold an u32 value (exposure or gain)
>>> for one capture. The size of the array is up to the sensor driver which
>>> will implement the controls and initialize them via v4l2_ctrl_new_custom().
>>> With this approach, the user-space will have to set valid values
>>> for all the captures represented in the array.
>>
>> I'll comment on the controls themselves in patch 2/2.
>>
>>> The v4l2-core only supports one scalar min/max/step value for the
>>> entire array, and each element is validated and adjusted to be within
>>> these bounds in v4l2_ctrl_type_op_validate(). The significance for the
>>> maximum value for the exposure control could be "the max value for the
>>> long exposure" or "the max value for the sum of all exposures". If none
>>> of these is ok, the sensor driver can adjust the values as supported and
>>> the user space can use the TRY operation to query the sensor for the
>>> minimum or maximum values.
>>
>> Hmmmm... I wonder if we would need the ability to report different
>> limits for different array elements. There may be over-engineering
>> though, my experience with libcamera is that userspace really needs
>> detailed information about those controls, and attempting to convey the
>> precise information through the kernel-userspace API is bound to fail.
>> That's why we implement a sensor database in libcamera, with information
>> about how to convert control values to real gain and exposure time.
>> Exposing (close to) raw register values and letting userspace handle the
>> rest may be better.

Julien, any thoughts on this?

If we don't need to report different limits for different array 
elements, we are fine, just we need to document better what those limits 
stand for in case of arrays.

>>
>>> Mirela Rabulea (2):
>>>    LF-15161-6: media: Add exposure and gain controls for multiple
>>>      captures
>>>    LF-15161-7: Documentation: media: Describe exposure and gain controls
>>>      for multiple captures
>>
>> Did you forget to remove the LF-* identifiers ? :-)

Yes, at least in the cover-letter, my bad :(

Thanks for feedback.

Regards,
Mirela
>>
>>>
>>>   .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
>>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c            |  8 ++++++++
>>>   include/uapi/linux/v4l2-controls.h                   |  3 +++
>>>   3 files changed, 23 insertions(+)
> 
> --
> Regards,
> 
> Laurent Pinchart


