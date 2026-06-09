Return-Path: <linux-media+bounces-64272-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9z8BOKLQJ2oL2wIAu9opvQ
	(envelope-from <linux-media+bounces-64272-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:36:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 467F665DD8C
	for <lists+linux-media@lfdr.de>; Tue, 09 Jun 2026 10:36:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=symple.nz header.s=selector1 header.b=hI7nfUrK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64272-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64272-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=symple.nz;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9221B309601B
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2026 08:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6D2C3E715E;
	Tue,  9 Jun 2026 08:33:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SY5PR01CU010.outbound.protection.outlook.com (mail-australiaeastazon11022074.outbound.protection.outlook.com [40.107.40.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B995C282F1C
	for <linux-media@vger.kernel.org>; Tue,  9 Jun 2026 08:33:47 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780994029; cv=fail; b=dkRQRhcRglf+vHup7giL0Iu4HwKWJUsZh4EPJkRykr0N2xU3o8TKHnSDyjmHOGjk5siS2gCm6CO9jfXXWdtGOGDuumZjxOXz/MUvdnVPEQy20SIIbGf54jzMj1JauTwhZy9UAHgJbL9t5PiSwvL+DsKA4pct9sd2OYNF9zfBw9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780994029; c=relaxed/simple;
	bh=GH0hPdLzsBAX9wohDBWOR8B6YXqx6nygtj9j0NjOnv8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j723ekreKG16zVDzbtnrwKLasuzATFwp0PUm5pmMs/QUtRsMIE8M9zjk6KTBK8eJnhYZRL+geGI8pGpuznYYOyZvSKDpgIKXm0kqgRnt7T20nlJzafwqV6Ml4w+siDSUh0XKGJhAMWD0hpQ5wVjaj6w/T8i/LcbYnmjG9MXqWCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=symple.nz; spf=pass smtp.mailfrom=symple.nz; dkim=pass (2048-bit key) header.d=symple.nz header.i=@symple.nz header.b=hI7nfUrK; arc=fail smtp.client-ip=40.107.40.74
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qyx4WbUPmGXhZk1w/Cnuiu7ffq9vZAm2gT5aVtsB1INluBtJanPa0RCnKzixUlQrpd6BuO+jQBgAuxtN1ucemX9+Qq1P0rPZjwthNPsWbXxPTB5T9qzFg5iaWC43KOH5cOnjhKNdnJnABArG1XP4cdPNs+wLzhnepSQnfgxR91nnDRDoPp7Nwb9vwI1117rZxgZezE5cg6sWyb9h2q0bHya7jAElPrXsAa8+s/na/QXCer3lX4NUtzwmEQ+LR0f972zonv9P+suud9dm2Ao41YRZSda4fOpm9XIAAgVwHdLoGQJTKRk3F/qm8lDDJuaDLfmCkgQrdXaaLZkVDKm4Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWIcBbAtEnImY36Vh6K3LrmsJxpWgfVcaiqLeW7fT1I=;
 b=ocZDP0J994mgpOJsUfnZCzrMGdBzjeZb+w+ulhg/zO78Mi5S1EatskYwV3gdALSo67lOLstzp9gTRcTl9tv9bt4mZccLdmKzJWqOXZbHDgX1ulreFIFI+/iYG1Weva+DeFNhBgM14pSgoj2HYnkYogy2hEgl9TcBalDE9cdDGGT286Qv9n6jEetKw83MA+tQp05QRINqV3cxFR0UW0RdjG649WYdXXgjxqkTybmPMZa6Z+UO6dUIXWs752iQ+ExcIFDbYDOeni9bOCnbbHs6/zVmNxwM0IazrFTAK103yOX5QJkBeJ/cTJ7QvWwzA00MVqu+VkXm6F2SWG3xHv1qlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=symple.nz; dmarc=pass action=none header.from=symple.nz;
 dkim=pass header.d=symple.nz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=symple.nz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWIcBbAtEnImY36Vh6K3LrmsJxpWgfVcaiqLeW7fT1I=;
 b=hI7nfUrK8yjK5ohYHsI9zH6B3VP7BNF4nPJXAEvxWXp3KoWZ5YalzOYoInY2B+8eZlX/SvTiumqPDu0J6d0wKqaAz1ETf4DFUrql3xwNiCB/AZSEhf5CG97c+M1wm246+NjPvKV1rSHcYmthiZZc778N/c5xaYhmlVwVw4NgdnZ+2JSJ5vwFLKic9dHN7DXpfENbgUWQLynu9V98dlvDujaXU+l1WeBgiwVTeNNdbnmZCbG3KMyV3uNyW9y/BXqcmWD++nppNcxoLaKYkaRSEWY3EqrEI6eYOBmFwa2qv8O+LJCte125/rF+JyK5buS3J1v34LbCPUPixKWczGcfmg==
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:b2::11)
 by SY7P282MB5502.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:2ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 08:33:42 +0000
Received: from ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834]) by ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 ([fe80::4619:bdb0:3293:3834%5]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 08:33:41 +0000
Message-ID: <34662f2d-cdf9-4ce8-a618-12a0f64cd03a@symple.nz>
Date: Tue, 9 Jun 2026 20:33:38 +1200
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] rkvdec-vdpu383-h264: wrong pixels at horizontal de-blocking
 edges y=4 and y=12
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Detlev Casanova <detlev.casanova@collabora.com>, linux-media@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
References: <52a01f1f-5b36-429b-96cf-f1a0a1c8f5e4@symple.nz>
 <5797ac61-dc61-4182-ac60-cc377564ff90@collabora.com>
 <2565c949-a558-415f-8c79-e47812db8341@symple.nz>
 <e3b93bda-fed8-4f21-b3d8-cdf28bfaba1c@collabora.com>
 <4358f22d-247c-43d3-89d4-27b57bbe90aa@symple.nz>
 <66768711-6943-43f5-95fa-3d97dc638844@symple.nz>
 <25a232dca0236788c75231c43ee8a01741148c37.camel@ndufresne.ca>
Content-Language: en-NZ
From: Simon Wright <simon@symple.nz>
In-Reply-To: <25a232dca0236788c75231c43ee8a01741148c37.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AK0P299CA0003.NZLP299.PROD.OUTLOOK.COM
 (2603:10c6:108:15::10) To ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:b2::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ME3P282MB2196:EE_|SY7P282MB5502:EE_
X-MS-Office365-Filtering-Correlation-Id: 3144c199-e610-4a2e-aa95-08dec601cf38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|6133799003|3023799007|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	NS/MoK78JuLNucxOzvmznU26qvSURju876LAZcWuDPV6UaMj1ePb4+9/iZ7l+BJlN3cOh1MU2WjxgXUcPVdjOj9oG4s4hs8VVF0O/8L4QMC3iR1ygr94fjhdz32G66NIiOyiLpYOeVyY+kEr4ZBx+7Bui0qokh+778n0cukyT6/sDZQyzmVjTtwmffsMxeybMUTLcZjqL/AfJLoXtnoh8VFgG12nSXuJaY/bAvZX4XxoX7d70Nv1pRq7effp8VAx+i5TXAJ9NPRJsFtA4dIYI17kbyq0t0lzavzsDpZzninn8p3Rio5BiqycMPf/PSA9nJqftN+sczk2u4CDx8ylkmMixRECfmC6T7X0mlk/TmZP5C+Ozur/suCmp+NtMskggEWPv6sc6kd4TadFwtBvPzSTDsZWV53yPZA4+JH3GuQmULGYQs3IBy/A1ZD3wE6JH1Kv2jNeCcDZiiuHc+87xyY+KA8vR/wk3uQvMKrl7cmV7atNCAZj8nyeRDjvFg9/9z7L+hguMBzcOP1cnPUwTW7WASsFvx1Exn2eMBHQJE+jqfoMWLpnWQl5MoqL5YCyyKwP2/11f0WzjpwiJJtbGVz/TpxlI7xHywxorc4tkPnPN4tkZ5AdXDiB+kVLiYi+rFscnJnXbAM3NY4E5jZK1HmJD2kI9JRypEcAcn61I4dBiCVSHDw8Xcdp+FOaChwN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(6133799003)(3023799007)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1lkSGtvbzlzZnRPNk9FWEFWeUlMK2Z1c0dkb2ZGTzFEYUxaTDhtL01oU1p3?=
 =?utf-8?B?SkxZamFrWjYxdDZZdXpNTGxyaCtwcDFRZzF5RXVtazcwT3YzRk43YStEVWZK?=
 =?utf-8?B?emZWcGNsMHZQMUhIZm8wZlNjVElkVFQvYVlUcWx3R1FYcG1RSWNFWVMxa0hI?=
 =?utf-8?B?MkdZSmduY3doamdzbU1HRUZxbkZTSC90SXdWK3lTVk9nVHJhUUxpbTYzZnRj?=
 =?utf-8?B?SEJ0N0sxTkhaa1NPOUlUSzcxZWpIb2hsYlZCZVd5VUQ1ZXk5WVJHRTZGK1hX?=
 =?utf-8?B?Z3UybVlQVzBTcElFTlB5ZUhVTXNiVTBDU0dRVnR0bzJ4UXFuY3RNZnVieHY4?=
 =?utf-8?B?Z255YjB2SGpXNXNxV3d1NG1GY3BZMENNZm5rek91ZWJ6eFNzdHI5TjUvbytp?=
 =?utf-8?B?Q1VXSmNyMXZSNEEwVHNMaWRrWC9hRjBoanE0Q2FuRlRqQWsvQm4vZEVTMXQy?=
 =?utf-8?B?ZThZbHR4WUllTnR4ZmJ0cWFuR0gySElqamg3L3crWXJxS2JXVUVGV2k5bFpQ?=
 =?utf-8?B?cndCSWdZTFFETFArZk8yOTd4U1JtMHhhbVVFT0RobUVBandWQSthdmkvWEF0?=
 =?utf-8?B?eE1aOXVocDJnaFJjaVhOeXNOa3ZycGUramtuSkdWK3RHYXI1aEdlYXpHMHQv?=
 =?utf-8?B?a0JLZFg4TSs0enFRNnc1dEJvRzFXbEh2N3Bsa253WHVvWjgydmRKWVcvam8v?=
 =?utf-8?B?empKQVlOVG91YTZBelp1YnpSRUFqc2hEYTU0M1RwMlVjVUIxRTR4czFNWVlE?=
 =?utf-8?B?ZFgxOFd4VEp4SlpaQUU4ZkNQQ0tjVVpBSXBsZEJOQnd0QjFmQTlvNW16SmRK?=
 =?utf-8?B?M2o5Qzl6K1lWRmhLU0V2bk5iTXZqY1QyR3lmVTYxSlhTWFdPR0ZieWxlUkFU?=
 =?utf-8?B?YkE5TVVGME5Fa0IrckdVcit3a0taZ3VnY0p3cDBPeFp2TSt5aE1kTVR6bTc3?=
 =?utf-8?B?TTc1RkZKSXhkZkJOUTFVajhvK3VJMjFBSjhpcEttUXN0S3dkbEFCZEU1L2gz?=
 =?utf-8?B?c0RNczVMVWFSUHdBYkdGc2ZCOGwvREE4bnliNGRQWThWa1ZVditJTFQ3VGpK?=
 =?utf-8?B?TEp3QVBaNklvenpiSDBpUjFQYVZXYzgrRVZCRUYzdkJ6WE90K081bnE4b1Zm?=
 =?utf-8?B?ZEhFQjRyTmg3NW5neUwvVDBqdCtJWHY2d0U0VFB2VGJRUkJnNW11L2N5VVJj?=
 =?utf-8?B?TDhtV0pIY1h1eEdGbmRSNVlUS3N3cVZIaDJWVEdaOHRUOTBCdmhkNllCZ3g5?=
 =?utf-8?B?eUpMWmJnaVVCSi96VmhIbDFSRmpwZW5ickxDQkNvMCs1UFgxSTlGRkg3Rm9n?=
 =?utf-8?B?Q2g0azh1OHU2VkE3TTRNNVZLOTZJREt0R3Z5eFFRVkY0VjVNbUNhS25Gd2RC?=
 =?utf-8?B?M1ZRVmFnWEZGcXl2aWU2R3g2OTNWOFVqM1BTQzZ0Rzc2MklyNno2Nk1MVDhP?=
 =?utf-8?B?eldZcGxjRVJjVS9yZC9nUmxHN2Q3aXZCcWovaDVlU1NJS3ZpNkp5VkVKdit2?=
 =?utf-8?B?aktXWHNFWkkrRUpyc0UzSHludzFobzA4MFJRV1VtU0xOVVpmZG16UGc4T1ZQ?=
 =?utf-8?B?Szl2SHFPOHdpeUJBTGFDdlNUcTVvU0xPUXJtcjkrL0kyMlVydmV2UldMSHA2?=
 =?utf-8?B?cksxUURRUXhKMzVBVmNhYndOd2VPdWk4aW1HUGxTc0VERDdRTm1TcEhaaGhN?=
 =?utf-8?B?RHlVL3hmSlllRFdTaEhwTDR5dnhoMkxCTmcrTUFBeWtGamQvQUM3WWdsVFRn?=
 =?utf-8?B?ejVjb1VMUjRKdjdxNFZJaXRyUUlVLy8wME5nODJiZVRZNzdtL2tDTzNlOEhj?=
 =?utf-8?B?TDJHTlc0OFVCNXpKZEdncmpZcHBwU3FuMTQrZ1dKS3hYMVhBZjRZc2lXekdL?=
 =?utf-8?B?eDBiWkdBV2JYQUhmS1ByclU4ZVpRSjZodW1xcTc4aVJHaTFOMmlYV0ZDeDd6?=
 =?utf-8?B?czZTZ0pHd1Npbk1uL05LSnM5ZjNrUENONW4xWFZCcnBQVW5aMUdyc25kT2tE?=
 =?utf-8?B?bVlMc201RytadXVDRFdEdHRKUXlGb2xQUUgvREVjazZWNVE4ZGxsUThNZ09q?=
 =?utf-8?B?SVFUSUFtT1A3enJSTkl3ZnRBUmVYN1BsRTVWby92TFRQWUFBQmJmSWZHRUJs?=
 =?utf-8?B?UmRRdUpoZXhVMGZQTHdPTTVlUnNuSW04bmhCUTlldkxpRUpUKzUyQy82aWdH?=
 =?utf-8?B?VTZGNVRJa1RQMXE1MVdRZVlTSTdlakMyM21iNWovYnFjV1V4amV0emxaaGlU?=
 =?utf-8?B?M3VQVHNQSnZDMExGc1FsL2krVWJLY0oyQk9nZDVvdEZvRE5KVjNVQzFuSlg0?=
 =?utf-8?Q?vkCMLjFNpEHjEmWW6M?=
X-OriginatorOrg: symple.nz
X-MS-Exchange-CrossTenant-Network-Message-Id: 3144c199-e610-4a2e-aa95-08dec601cf38
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB2196.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 08:33:40.9759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 9531f271-068a-4210-b471-bd8da91491c5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqblbUPQIkYNahWXGH7Trz5fRKxqcGaVSMlPYsiEF9m+df0bgsqwkuHijgVqkese
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY7P282MB5502
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[symple.nz,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[symple.nz:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-64272-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[symple.nz:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[simon@symple.nz,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nicolas@ndufresne.ca,m:detlev.casanova@collabora.com,m:linux-media@vger.kernel.org,m:linux-rockchip@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[simon@symple.nz,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 467F665DD8C

Hi Nicolas,

(Replying to both your notes.)

On the cleaner implementation:

> on the first frame after resume, we'd prepend the workaround decode
> operation to the TBL [...] cleared on the workaround decode IRQ

That's nicer than what I have. For reference, the warmup here already runs as a
minimal link/CCU submit (its own descriptor + register set on the link bank,
separate from the single-shot decode path), which I currently poll. I tried just
arming the link IRQ on that standalone submit, and it never fires - the warmup
only raises the status register, no interrupt - so it does look like it needs to
ride a real link-table task, as you suggest, to be reaped by IRQ. Happy to test
any version on the RK3576 boards here.

On whether it's really a HW bug:

> we know from past mpp workaround that they don't always imply a HW bug

Fair. I did try to rule out the most likely "masking a simpler issue"
candidate - the filterd RCB (slot 6) data state, per your other note - and it's
content-independent:

- Dumping slot 6 after each decode: its content - including the meaningful
  deblock-context head, not just an uninitialised tail - is non-deterministic
  run to run even across byte-identical good decodes. So there's no stable
  "working" RCB state to compare a bad run against; good and bad runs both span
  unrelated contents with no shared signature.
- Zero-initialising slot 6 before every decode doesn't change the failure rate
  (the allocator already zalloc-zeroes it); a 0xAA sentinel is overwritten by
  the HW rather than read into the output.

So it points to the HW racing on its own deblock-context handling rather than
reading stale buffer data. I couldn't reduce it to a register / RCB / clock /
gating difference vs MPP either, which is what pushed me to the power-up priming. 
I can't claim it isn't masking something deeper, but it isn't the RCB-data case.

Regards,
Simon

