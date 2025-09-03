Return-Path: <linux-media+bounces-41661-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A00FEB41BF5
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 12:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2554118983BD
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 10:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E2E2EBDD9;
	Wed,  3 Sep 2025 10:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="SoYaIonv"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D361E5206;
	Wed,  3 Sep 2025 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756895686; cv=fail; b=X4t88Zt3trTGVrs0rCkQkecE8F/ps47/jzU8B5034mBUr9C4FIay1deTFFIgEQV9itm5+T3Wmry74+h71vE9ogZ0+cBNEOB4RqCa8hwWaFlF9NR18tUFdDj/F7jH4G2ZruNyTurE5PzKlgO+Qy5dKSmbLo8q1m1/l/iAkKReAbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756895686; c=relaxed/simple;
	bh=gQqwxMYfldMxFSFSnyLtpJIeM1Gk30STDDPr0D/iIMM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QfREi197GuaW88UZDi7xob/2gcJvxJsh6iEK2L+MKK6t1An/AqUoghgnL72i+hQdamqsd+GeP2qvR3hw/ux+WRQLrNS/I/MvVrwufJa7NFiEw6xS26taaoKauncHfMwzhys5h4FDVct8Y8dqBbw7UeOCRoPT004RFtsO6nkaDE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=SoYaIonv; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UeXcwojO3cSJCfsLasda0wOZepthdrAS1GiEaKPBu29Ysr2849f6SyMMwi7eGRM6eTcgOETAiKj008LnLfs0vE/3rDw+5BNZyvt5bPp+kcoHz/j5+CMG1RhbyZXJX0trPKbA9zmRlbqGPEAY2PpSCIQYxQZC34qrNTm3uYA3LvD51qiLi4Y5yupucvvHAEebvD83FEV0NbE/GkWOOU81foK/e/rDSbDdjLYyI7GonWZMBS5iKMsV5qI1bMbUHA5QTRrSK4VhRU+z6k4hUJJg3plSWKWs+CmCzk/baHzjijwewsdeTlf8Exxm9rTG7yLXb112gBqvQMCjPVQeAexqYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvD0x0jTh5FUeeTOWPSm9N9JzfzwLTUbmEYd/G29GXw=;
 b=tWrXZbsbv6rtK5T6fCLTtCcezVxIesKT1i5hPTv8D+xvEZIqdWKo4IacLtY+d8UQK3tH5XjAbvCDxETEsjw+yEMFoPzq7VNyuFV+rwKqfvvAS1PK77h3UZu/vrVLyd+59ZEMQAbAFr0wg6x0JAE/df4X31Q+SkPKyJFXimRnPhx+ONbriWE0jGAsXpsQwFzBxcFKSIlA1T2mwgo36hzPryCe4g6sj1SHXkNODGccN+YOlPBmD4FHriewy85lXVhfrdFVhdF0klUX42LdZM040RNkqy289FWihe8gbFs3ozCt6icKhsR6n7ygfq3SvBXLHwAn+eP9JYM2Dba+D0z+3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvD0x0jTh5FUeeTOWPSm9N9JzfzwLTUbmEYd/G29GXw=;
 b=SoYaIonvsskg+XSbUyRZzEC0+ljcKzSyR5OHJM9TXagDTqH1h3sv3uF/pIwdsf4gDlIHwCOngaoZiAsp4FunKJVLrNJZVPGu5mkoErIcYzb1Ykx93H/Zd9eKONxMrlvwuARa3mjtk0EbMFQDriS0a5m+Pnv6NoK0nqK8HlgxEHU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 3 Sep
 2025 10:34:42 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 10:34:41 +0000
Message-ID: <ffa33e53-3d65-49cc-8af6-bb3152dd1006@amd.com>
Date: Wed, 3 Sep 2025 18:34:32 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] Documentation: add documentation of AMD isp 4
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250828100811.95722-7-Bin.Du@amd.com>
 <20250903100424.GB13448@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250903100424.GB13448@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::31)
 To PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 48851191-b631-4991-ad56-08ddead57dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejVuSnovZG5FNkZDb1JoQ1U0VkFjTDNFeUNNa2ZOa0w5cFBvQ3p0SDdiMjFP?=
 =?utf-8?B?UG5oNEhnbXZkT1REenlxUzk1YnNZVUlCZmppd1NmL1ZJOXpQVnJuM1hQa0Rl?=
 =?utf-8?B?ZkdHc0NKMmkxNnFDSEthWEtaUFNRL3BQUzF5LytZb1h0Wk1PWktwMU95aXo4?=
 =?utf-8?B?SGNsRHpEeGxya2o3SzdhdTJCY000NzhONkwxUXUxS1crLytDV1lKYUhCM3dZ?=
 =?utf-8?B?L1N5b1NoelkvSTBxcWZpcXB3YzB5ZVJnSW1wTVNqSS82SDR2eWg3ekN3U29H?=
 =?utf-8?B?dVowRWxVaVNwNVIyNFpCcC9aTVFBelpydFpmQjFXNTc5Q0xJRThjbXJ1VXBY?=
 =?utf-8?B?UUE0UWNEMlpjcXltMEZYTEhmV1ZqR3VRZ3JRVitpd2JPSnVvVVhBNnU3dVpR?=
 =?utf-8?B?bXBUWGFRUWxmRUFvdEF4TFJiZW4wdzU4ZXlpNTV1TDB5eXgxTFF3U09CZUZ2?=
 =?utf-8?B?YURRWWJhVG9ZeHVJL2J3UGdvRjUyOXh0RmtIQ051bmhDUURtb2pnQUtCVEth?=
 =?utf-8?B?Qll0Y0F2Vk1LRHpKRlFxWTUrT2QwUDVSRGljelEwQzFGM09LQk55UTloTG1v?=
 =?utf-8?B?TWFwMVZpWDFnT3RCcXpLNU9zS2xGeDFHb2RNdXNncGI5Ull3UG1qK2hOR1hO?=
 =?utf-8?B?dGZYa0RrSjFGRDZvMmxZalIzTUNDanZsVmhabUxKWGJlRTE5QTNsOU5WbmtV?=
 =?utf-8?B?OTk4YytMdkZQRlYvdTZhQXUxL2Mrb01JaW1FMmFYbzloVHZlYXJMVnlBNjEv?=
 =?utf-8?B?eWFsNlhmcXdvNWFBYVBrQUk1L3d4VzB0SmJUNjVHd0J5QlYwbzVsL2dBMTNu?=
 =?utf-8?B?NDlaYkg4cktRSDNPYWtTTkd3bzFmbVVEZE1rOVU4V2dPR2xqanFDemQ1WTFR?=
 =?utf-8?B?VTExZGVaTFNZMVd5OE9pcHVYdnp5aEtjZEFlc2VBQ1lrTTExOVRjMW9DdW9Q?=
 =?utf-8?B?RUtQK0o0OVFkQlhMTmVVYlBXWS9PNFFNZnVZcmk1ZGR3TlQ4UURGYUNXb3hL?=
 =?utf-8?B?RHVUeDExRXF5OW9JMmJXeUcrNDJ2S3RmcmViTXIvSllDdVk1d3M3QXVqeUVN?=
 =?utf-8?B?c1ZXVFZVTWxCVDBITUtvYUI1aThMV0VmWUdob29sNllFd2pUNzRpNjlUL3VN?=
 =?utf-8?B?Y3ZPUE01MDFpUU9UL012enBaZ3FXVk80VDIxaUFKZTZKUDdaeStQQjhqcmFl?=
 =?utf-8?B?cEo0VjJlbVpiR3ljWE9keVRObjgwa3NVeS9rRnZKTU9uTW1xWVlibGFPQmhr?=
 =?utf-8?B?eXYxM3dzUnVHK2FFS0xhUk94enBLWFJUM2dDaXlJS3Q1eTQxTzU2YWtIdXB3?=
 =?utf-8?B?dktaendYUGVEb3VMVVpvNmNmUlFNcG85R1NUOWQwMEhTVndwUFJySFN5SFc4?=
 =?utf-8?B?Q2kwWG9JZCsxZTJBRUp0SVVPRmRUeWhxb3Z2MXc3VnB1V2FoVGdoSWdqOHpu?=
 =?utf-8?B?SHFPZHUrTm9Qc1JPTXRwdkpaL2JNMHNEYU13NFJaVWFZc21Cc2RrSGdXaXYz?=
 =?utf-8?B?c2kxQmJOdzhGc3VlNXdBOVgwYjl1VExTREw4M2htaFZiNmw2WWNHcXJEajdD?=
 =?utf-8?B?OFAzdFZCZGQ3SnpVWU1Kbk5UaTlidlpTL29iZEpPa25kQkVvYXgrWStQRFVF?=
 =?utf-8?B?Wmo1WDB4ZGpQZEZ3ZjhEVWQrQjc4cmZ1MXN2cTlzQWxxL2tqR05DTnpPRThk?=
 =?utf-8?B?ZVFydEZJaHVhd0ZDWWIxOGpOMjNjTkxWZ05QbHpUcmJ0bi9wVUU0Y3RQYXVz?=
 =?utf-8?B?UWJZaXZ0NTBFV2tqSDVuaWY1a2srdzMxdTVkZlVSV2JMUm10Z3hIS2ZOSXpZ?=
 =?utf-8?B?MDhRbTJhMGlnTjJRTVlXOVBTZDlWaG11ckh2eis5UVRqZnVjUll1UkEwTWVF?=
 =?utf-8?B?amQ5TjkyK0Q5eFZTWGUyeFV5STFtOXIzMm5XS01uMXpZZ2c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V0xjWUwrL2kvQUc0c0M2TEZ5YWlqdVpiSHpsdzQ3MDN5Kzd6T0cyYyt6TzUr?=
 =?utf-8?B?VTFDZ0ZFNExrV2VGVVBOd1JyS1lxTzc2NWJIQTlUU0tKeE4rNHRZOWtHei9k?=
 =?utf-8?B?VDNFU3dPbXN5WlYvYWNreVZkS1Q3a2Zud1JlR1dhMVB4cEcrcjg4bGZjWW1J?=
 =?utf-8?B?Y0NDQlFUL0xpN3NCTUlndmptNUppL1lhTWdYUEVUcUhzZFFjbGVvejJydEJ0?=
 =?utf-8?B?RHpvdmF0VFZhZDZ2ZXdhaXI5UWpGVy9uVUlrU0pXeUFrVThqMWgzR2VGeENi?=
 =?utf-8?B?KzdsTVhGeStBTi85TGhac3h5bTcrcEdIeTVZWXYxQ1htNm5aMlVZRGxlUThJ?=
 =?utf-8?B?dnVVN1NLV21HZWRqcnJEeHp5Z241VngzTExydlplVk0zVzdmblFIQitKTFFo?=
 =?utf-8?B?b1pXeFROQ2htb2JHM2hqNVNlZjUvdk5aN0Vrckw2cUtXdnE3Uy92cFpYbWxY?=
 =?utf-8?B?RC9GWVk2Rlgwd2lpOHhKdXBUMVJoRitsYWM2ckFlT0VpWGtXOEVSaCt1U2xW?=
 =?utf-8?B?YjVYWFdRdzUvVEZKY2Y4OUdOTWRibHhOWDBITk1aajlNaGtrM3dnNFZBU3Ey?=
 =?utf-8?B?ZkU4ZHVqZmE0VGRuc09wMUovMjlsTW1pdHRvTTBCNHVyWE1SVHJ6NXNSS3dT?=
 =?utf-8?B?OWFYOWlBMmlmWE9pa1Z5SlV5NmRiYmtSZHJhVkRrWXgyVkRoN2l0MWt6Sk10?=
 =?utf-8?B?MGJjb1Y1QllNaXhmVUd5MHhBQUVUOU9TTlJzWCtKWDZnV0FBSVdzamhXY3d2?=
 =?utf-8?B?RERGbmczUWFIUmFoay8vY2I5aUhWY2EzclVUSzZXc04rNDJ5d1NaV2RodDg1?=
 =?utf-8?B?T1hBUER6TldvdVZKWHlnSGF3Mk5KYjlkb2pxbXRYOUdYL1lTaFpkd2c1d01D?=
 =?utf-8?B?OFVnZUcxWTYycVByRVI2QlJTSDZ5SDRCZG1sMkNWbUtCRXFVV2FWVnFkaG9D?=
 =?utf-8?B?eFFFWmp3NHpxNFVWQkk4RDRLeFZLQXRTS1FmTDlGOUNINlJ3c01ndDhoNStS?=
 =?utf-8?B?eXJLUStOZEdHQmpkenFiQ2V3YTBaL2VmOGxBWW1HSkd2cGx0YVpEYnYyRVpP?=
 =?utf-8?B?cG10bW9SdVlqa3dnTElDSzVKbnpGYlR0cURnUWowYXZJNGxIWFBWTjh1Y0tp?=
 =?utf-8?B?ajlMdVpuT0lXT2JiazMwL0w4cGZrc1RxYUovQ1dFRmU3MVUzeG9wWmVmM2VS?=
 =?utf-8?B?ZlN5UVNVbFhDKzF0cmV0YzlHWFhqS01Cdm9Gc1lxei9sZ3p0NlFqai9LcVZz?=
 =?utf-8?B?ZDZSaVFkZWlIZnMyS0htaEY2cDhtUXRTNEEwWHBIeE5qSERVcEZvaTIzekZX?=
 =?utf-8?B?Tk5LS0FaSElaY2UwL3RHSzA2OWZTZitEcnJlL296RWN6S0thQ2w3bDlLUytP?=
 =?utf-8?B?eWd4ZGQyMldxOGg4OHpyQTFEUjY4RFVTeXBKUm14OVowaFRzdFBWcVhqUkNh?=
 =?utf-8?B?Yi9WRDZObmphR2FwL3B1Z0FJNENNenp0SEVzVW5nZnZocFVVVExZVVJqVzNi?=
 =?utf-8?B?azVlalA1Y1NtZ2FhREpnMlQzL2V5bDlTV3RReTJ6YW1aVHpwd3NkV25nV3Rm?=
 =?utf-8?B?SGdCZzRjdjRRdHpYZEJlaG5kbEhQOEFLTzR3TUdOSWZ5emRJNkpNWWIrMUdq?=
 =?utf-8?B?TUg0WHExZEFsQU40Sy9uSG1HVG5TbkljajJzaVJuVXo5ZWoySXFBMm01ckFh?=
 =?utf-8?B?M0Jxc2o1NEVuaHR2THB3SDRKdGdJYUhNZFBBOTJpWENzVDh0QitoOTZmcVg2?=
 =?utf-8?B?YktHOUJCNU1QaUtUVzk0WmVycjBicHZBU1lSNncrMzd1UkFheks1bFo1QmFy?=
 =?utf-8?B?dktKWE02Y0grOVM4M1pqOW16ZGNhYk9rYUpmbEE4SS91SEtvSThMSW5EM3Vl?=
 =?utf-8?B?K3FUbTlHZ1RESG52QnVYcHE2OGh5T2RlNmRFNnBlWFMyV1VEYyt2bThLNXNV?=
 =?utf-8?B?bnkzWk00T0lZemxrcUFaUnREUEI3TEV1SmlrVldNV3ZQRXFiMHp1VStOcGhV?=
 =?utf-8?B?RnZrTmtUSEtzVEpYSUZYUTA5b3NybDBGZk91VkxMM3pwdHRwb01hUTY5S1B3?=
 =?utf-8?B?THV2RmxkSEhqTExzd1JVQXp3RFg4T2EzRmJ6UXdHWmIwMEJuVUZBUEJ3TWlj?=
 =?utf-8?Q?Q4rs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48851191-b631-4991-ad56-08ddead57dcc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 10:34:41.8549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NtWZP7zxNa5nX1QEKp1ZcPFwHAY82Se0GNPdEZMEHVwKkY3nJSx62X6Oe7v8amHG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076

Thanks Laurent Pinchart for your careful review.

On 9/3/2025 6:04 PM, Laurent Pinchart wrote:
> Hi Bin,
> 
> Thank you for the patch.
> 
> On Thu, Aug 28, 2025 at 06:08:11PM +0800, Bin Du wrote:
>> Add documentation for AMD isp 4 and describe the main components
>>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> ---
>>   Documentation/admin-guide/media/amdisp4-1.rst | 66 +++++++++++++++++++
>>   Documentation/admin-guide/media/amdisp4.dot   |  8 +++
>>   .../admin-guide/media/v4l-drivers.rst         |  1 +
>>   MAINTAINERS                                   |  2 +
>>   4 files changed, 77 insertions(+)
>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>
>> diff --git a/Documentation/admin-guide/media/amdisp4-1.rst b/Documentation/admin-guide/media/amdisp4-1.rst
>> new file mode 100644
>> index 000000000000..a5ed78912d0f
>> --- /dev/null
>> +++ b/Documentation/admin-guide/media/amdisp4-1.rst
>> @@ -0,0 +1,66 @@
>> +.. SPDX-License-Identifier: GPL-2.0
>> +
>> +.. include:: <isonum.txt>
>> +
>> +====================================
>> +AMD Image Signal Processor (amdisp4)
>> +====================================
>> +
>> +Introduction
>> +============
>> +
>> +This file documents the driver for the AMD ISP4 that is part of
>> +AMD Ryzen AI Max 385 SoC.
>> +
>> +The driver is located under drivers/media/platform/amd/isp4 and uses
>> +the Media-Controller API.
>> +
>> +Topology
>> +========
>> +
>> +.. _amdisp4_topology_graph:
>> +
>> +.. kernel-figure:: amdisp4.dot
>> +     :alt:   Diagram of the media pipeline topology
>> +     :align: center
>> +
>> +
>> +
>> +The driver has 1 sub-device:
>> +
>> +- isp: used to resize and process bayer raw frames in to yuv.
>> +
>> +The driver has 1 video device:
>> +
>> +- capture video device: capture device for retrieving images.
>> +
>> +
>> +  - ISP4 Image Signal Processing Subdevice Node
>> +
>> +-----------------------------------------------
>> +
>> +The isp4 is represented as a single V4L2 subdev, the sub-device does not
>> +provide interface to the user space. The sub-device is connected to one video node
>> +(isp4_capture) with immutable active link. The isp entity is connected
>> +to sensor pad 0 and receives the frames using CSI-2 protocol. The sub-device is
>> +also responsible to configure CSI2-2 receiver.
>> +The sub-device processes bayer raw data from the connected sensor and output
>> +them to different YUV formats. The isp also has scaling capabilities.
>> +
>> +  - isp4_capture - Frames Capture Video Node
>> +
>> +--------------------------------------------
>> +
>> +Isp4_capture is a capture device to capture frames to memory.
>> +This entity is the DMA engine that write the frames to memory.
>> +The entity is connected to isp4 sub-device.
>> +
>> +Capturing Video Frames Example
>> +==============================
>> +
>> +.. code-block:: bash
>> +
>> +         # set the links
>> +
>> +         # start streaming:
>> +         v4l2-ctl "-d" "/dev/video0" "--set-fmt-video=width=1920,height=1080,pixelformat=NV12" "--stream-mmap" "--stream-count=10"
>> diff --git a/Documentation/admin-guide/media/amdisp4.dot b/Documentation/admin-guide/media/amdisp4.dot
>> new file mode 100644
>> index 000000000000..a4c2f0cceb30
>> --- /dev/null
>> +++ b/Documentation/admin-guide/media/amdisp4.dot
>> @@ -0,0 +1,8 @@
>> +digraph board {
>> +	rankdir=TB
>> +	n00000001 [label="{{<port0> 0} | amd isp4\n | {<port1> 1}}", shape=Mrecord, style=filled, fillcolor=green]
>> +	n00000001:port1 -> n00000004 [style=bold]
>> +	n00000004 [label="Preview\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
>> +	n0000000a [label="{{} | ov05c10 22-0010\n/dev/v4l-subdev0 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
> 
> Does the driver still have a subdev for the sensor, or is that a
> leftover ? Looking at the source code, I don't see where the sensor
> would be handled.
> 

Yes, you are definitely correct, no sensor subdev anymore. My fault, i 
forgot to sync the document to the latest one, will update in the next 
version, really sorry for that.

>> +	n0000000a:port0 -> n00000001:port0 [style=bold]
>> +}
>> diff --git a/Documentation/admin-guide/media/v4l-drivers.rst b/Documentation/admin-guide/media/v4l-drivers.rst
>> index 3bac5165b134..6027416e5373 100644
>> --- a/Documentation/admin-guide/media/v4l-drivers.rst
>> +++ b/Documentation/admin-guide/media/v4l-drivers.rst
>> @@ -9,6 +9,7 @@ Video4Linux (V4L) driver-specific documentation
>>   .. toctree::
>>   	:maxdepth: 2
>>   
>> +	amdisp4-1
>>   	bttv
>>   	c3-isp
>>   	cafe_ccic
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 7724620896e7..72ef7c77d881 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1139,6 +1139,8 @@ M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
>>   L:	linux-media@vger.kernel.org
>>   S:	Maintained
>>   T:	git git://linuxtv.org/media.git
>> +F:	Documentation/admin-guide/media/amdisp4-1.rst
>> +F:	Documentation/admin-guide/media/amdisp4.dot
>>   F:	drivers/media/platform/amd/Kconfig
>>   F:	drivers/media/platform/amd/Makefile
>>   F:	drivers/media/platform/amd/isp4/Kconfig
> 

-- 
Regards,
Bin


