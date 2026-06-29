Return-Path: <linux-media+bounces-65887-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Vn8TFaBCQmq+2wkAu9opvQ
	(envelope-from <linux-media+bounces-65887-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:02:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3776D8943
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 12:02:07 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=cherry.de header.s=selector1 header.b=PNWwCWd3;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65887-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65887-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=cherry.de;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AED2301A52E
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8AE33B71A9;
	Mon, 29 Jun 2026 09:56:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD733A8732;
	Mon, 29 Jun 2026 09:56:40 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782727003; cv=fail; b=GkOlyzPSepsjlqCa519ccAqM1eOgt8WXlcP4pBe6Xn971aA2W+/39Zxj5+Nz2wLUA6oGZIIEa691oc40RPWu781hYtNLjD2g7VxdRZBXBMSue1dQ9WLD2lYP0afZ6n9bNWNqcmo8QgLuzpS19v+4Fbwx4e1XlBDqPeiwUdTGet8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782727003; c=relaxed/simple;
	bh=CLKG3nVPfIr97CnfZt67P/R/ofRP449yGqKVHEcOOE0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oxiGXaoxGwlfMeNQO5A1FuJzGyQCPjOxW7lqT12CqVYWgpJC4KGHpnliCg1EcH6d6dA3YqDwKDeRTAeMcmut6B5yERieQTWfQtByQkkY0QdHxGkmO7z4pm8vE6gv7pL8uubJ8wKfKBGVoHimv4wpbavFvy9oYFoVsxtKLZnjuKI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=PNWwCWd3; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqjmoHlMDmVchff9oKCdV/dgNKzXJeZbB73bznLQ62pVIUsvSgKz1a4iD5u2CRqXMa/Ov/1aR0hS4wwOIx2dlQyebYu0Pejvx/eFf/4vhzVCCsPMwjl54glE2xyrh1gRMjFCxyoS1x5+rqPD+xcqFGVP5Y4Q+w92ubwUAtxR8HYDASsrkQeGLY6E8F3dxeI+SksPkl1v29M51divJQvpdBBidll2Fw937tBV08ulxT8sSNEq6k3eWfzRdRsLyEjL62Y920ZbF57qrrlS4xK5PHkgSajrvyOob1B+JrSczASkur3Cgb3mBjVXFUOiPUA+hhTfcqMqZtVatxR9SGv0gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GOEskry5zO3Leb/QLAcXdrL+EY88IeGXrTPgGclWq0=;
 b=qDSwD8qhjWjQpYlWkGWQ31kl3tW2/Lw92tZfyrFnvxaSwQVLqdY9bMUKkgvxndW8Jlsn4O5/gt9IK54yv0BngfnPqCRNY9NmA/JJiqofGIx/xcZxn0CchYKbVyA1O7L1FTBwxpfAG0dA7HJabTZFYGry2TuXxlv9/6Mj5zf1Sq80dpWNs5rEDeQODTfOrkCx6SftOYwScvXsAzBE5Ai0YwqfmwXnNPvD2NYzMcrlBEsu8Vor9Sz31OEHx6EbdFAS5dN77TzVc8dNcoYmGuXqH/GtcK65Nxk44259TEcW301IV0qJk7DkzP6sZ9XIj1dIatqIxyKpZEa7924sz8b/Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+GOEskry5zO3Leb/QLAcXdrL+EY88IeGXrTPgGclWq0=;
 b=PNWwCWd3Umz6OjLyyK+ck6K0KYbDRi7sThhbVEudnSwM1uQKyeVkf9tg7T+RObIBQTGRwM+3OoMu/81Rv5elPU9xYoyrNfX49V339aHLn9Xu4MBMds6rD5ciWhSHsVXWjfyhFRRL5oW+OLcspm47un16q2xToDJ63rAFSvT/oY8=
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by AM9PR04MB8825.eurprd04.prod.outlook.com (2603:10a6:20b:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 09:56:37 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 09:56:37 +0000
Message-ID: <9741588e-daea-4e49-8b32-9f9cc88b6bb5@cherry.de>
Date: Mon, 29 Jun 2026 11:56:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm64: dts: rockchip: Convert to new media
 orientation definitions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
 <20260628-kbingham-orientation-v3-7-4ed92968aff8@ideasonboard.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260628-kbingham-orientation-v3-7-4ed92968aff8@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0202.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::6) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|AM9PR04MB8825:EE_
X-MS-Office365-Filtering-Correlation-Id: 06bf2a3f-2e15-4a01-f015-08ded5c4b5a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|1800799024|921020|22082099003|18002099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	m2N1hmJBjIKUujla/i/5Oq5LLrAi72s8FbNv9DPa9/GsjZnTlOa7S/Q4aF3fYf+O6ykI3NDMedOH0KRh6/0/scXlp6dBUdod9XDQuDEC2XffhXGvzoJHoCtiN23f8t9BNu8CSIOuT3680FAdc2G4yar18t/c/k6Ygs6fGef75ecbwNJp23pDcqZf1ApdUsjg6iq11TjeRMjc+Ym1ogiCXbwMtCq0eFlhpz+QVVRp+uYDalUf6hz4h2TmBeJnPNc8vbvtWsUcuROdd5TRfdnGbW15KHwq7zfLNusbKhdrbUD/PjOKrOO3FrOv/AEWnHgCb2JlrBh9nht19jrriIxEd27oNSKvam/cYNgykaEW/HcogvkIa+t1AcoFeQvWlO+QaNTwbsZYJ0XSi9IbN3idUJZ4ie5+5dWYZH5hw7vqZNFF5poSs4KvWanUZkpH+PgR6JAji4Pb39s1cjAWJ4gnW16Q7rh6rZpf/y+03j3xuG9rrbHpto8NouOnWdHLnoZlqqWBP/JlaOWxv7f4yOPtMS6O5B6uMwzvTcaJVI7fyhBE1aUpsilGvhAtt8EEF9iHjElyG6qn+NoAcRb4n9kZRhvvIYXRPfr0NwLY7SFx3Cu0ZFvsvBns1VUN079HBicBlgq9tcErRVG/6icYvwwval1eLZ+Y2Ac6Xvh60uGUx8wyC3OghY6+eecHHRDklU1H1f22KJ6k25TBxwkytBiAFw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(1800799024)(921020)(22082099003)(18002099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Yzlzb3ViNFdMdzNBRlVKSEtqamtpamlESFlmRGdJcTQxNmgvUmxMZzJNbzhi?=
 =?utf-8?B?ZFhrK3VKbjhwRWxxTWNqOGVkdVJPNjVHVFVRdDF3UGZSUUNZSWpNTnZpbXNu?=
 =?utf-8?B?U3lyR3FkNXREdURoY21XMU9zb3hkQmNiLzNoL2IxMFBvbFFhS3E4enVhZXBU?=
 =?utf-8?B?MXpuSzgxWmpVK2VpQXhCeE1jQ1R3cGkvQk5ETEpmT3R4MkxpdWgyMnFyZzY5?=
 =?utf-8?B?a2RmaDgxZDBvYStrbnNqT2t4b0F5WkpWd2RTYnpjNVlLc1Z1ZDhWYkdEY2JK?=
 =?utf-8?B?RW1KQTdEMzY1RTVEZXpCS3pxWjYwQUlIZjZEWGNPRzM3SmxVcUlLdkFnekZO?=
 =?utf-8?B?VXp3ZFVIS2RrVjFoL1ZqOXpnVWNSbGZDNWR5YXNlU0lFajZQTWFWUURPcThU?=
 =?utf-8?B?SWt6WnZiYk5BbzU5S0dmOGNVV2QrU2F1WWZTWENEMnJnUWh6eUtQWUsxK0Fl?=
 =?utf-8?B?bHo1bTVGbERZSWlqQW9mcUpkY3Z1UklyT09SZG5HUjVFdEhFeE5oWFgvU25F?=
 =?utf-8?B?VkJydVVYUVhhdlBSejVOVnZhTUJBUVJhWWp1V2hzeURmdU1JVXovYVBvTmc2?=
 =?utf-8?B?V0RSUXovSzB0YzFsUkJ4WkIxT1NGVEJwZlBOMzdNL2dkc09CNndVUWRuNkRY?=
 =?utf-8?B?Ylg1NTF1dFY4K2hWVXV0REkvbHNkUldJQjAvbzN0N1NmSEZjbC80U1hUaVF3?=
 =?utf-8?B?dGhHZklnUExsa1dpWlVSSzRhc0wwUURzSXM5dHpKRDRuaWk1S2w1U2JkeUFO?=
 =?utf-8?B?eHdIOVNrSENHUVRlQW9qbk9VL1dYRW16TjkyWjdlbDdmRTdzeWo3bFhIRU5D?=
 =?utf-8?B?T0FweWFQakFRYUI1YVRmMUp0Z1ZxNEY0L216b3drOFd5bVc0Q09JNlR1TmRu?=
 =?utf-8?B?Z1diRnY0WFNkMUcrcTVRRmJhd2s0bFNKNTU0b1o4OUlPdkQxdVYwQWdwUEE1?=
 =?utf-8?B?aWwxb1E3OUVXb3lvbTVzVGlkZ2xlZ01XY3EzUXpBSnY5Mzc3STNQekZsUFZO?=
 =?utf-8?B?VEhzTXJUSkp3cVlFQjMwQlI5eFVLQkhUVHJjam80ZHo0L2REb1k1WGlrR0dD?=
 =?utf-8?B?NFB1L2JXcFZHTnVkUjI3cXA0RFV4ZllJOUlqclFTZ3JtOEZJS3EwU2JCTGp3?=
 =?utf-8?B?Wi80REdjek8rMi9FZFhLeGtoc0FlU0xpV2w0M3plZ015cE80K0x4M3drclNh?=
 =?utf-8?B?ZWVRODM2cTd4QWNxSXdCZFB2L0IxZWM5eFN0TWNWTGFLYllraHpQakViT3p3?=
 =?utf-8?B?K0M3UitXZFZ0eXAvN2cySEFtZlg2a1haNy82emRTYmVxV01GTTVveDd2K2FS?=
 =?utf-8?B?Rmd3cWE1bFhKNzgrS0xySUpZcEFPTklJOVhPSDV2cVZ6V2FSbzc5NHNENlVE?=
 =?utf-8?B?ZmJnWnBobHlSemZpc0phVWQwMVZiMEtlczRBNzc0SXQyYVdQSXFmTjdySisv?=
 =?utf-8?B?c0lmY1g3OVNUU29TdTJiMDRUcCsraTlWcG9SN2FrZ2R3SENNMW1jek1MSk1N?=
 =?utf-8?B?RkQ0TTd1TG5NYWY3d1JNZDAxS1NDM0JBeGhJZW1wWjR1OTl3dFpidTZpT1pF?=
 =?utf-8?B?YjVkaEM1dnNRa0lEUXBtQlpmeitRVlQ2Vk9VRUZjYnExRGtYS3oxYWFEd2Q0?=
 =?utf-8?B?MFRyZm9WUVJOdm1HOGc4eGRZV2pJZnhqZUtOMndJclk0Z1FKWWtkZWJHcVRq?=
 =?utf-8?B?WVQrcDVBREVGbDRQcldrcVEvVEUxK1ZBNklVdmFySXNHRjhPS3dvNHRyNm8z?=
 =?utf-8?B?cHkvNjlqNFVra29kdHprcU1MZ1prdkpqVVRqbm4zN3dDTTJMWGRoTFlXNGIv?=
 =?utf-8?B?ckhqOU1TWU5IQWpaSE5URmJkaHRFQ0Fia1d0OW1nbFRrVFhuRy9EUkE3TjNH?=
 =?utf-8?B?dElZVWF0OENBWEo4VG56NFVGWTM0Y3E5dUw3Z3NsQThMRXAxdUJJUWhWWkc3?=
 =?utf-8?B?ZCtHQTBqdUt6TTdPaVFlbVYxWGluRHAzQUhvcEp1MVZKQlJnMGlwQ1VDVW1O?=
 =?utf-8?B?R1lzeDR5eDlQaVBCYXM2SGtRNXBIZmpQbDZuR21IVkRFeVc4MHEzOXdwaDBQ?=
 =?utf-8?B?MDl3blhLRGxuQUNZSVZueUtSUmJ2a3ZySkVjdFZLZzUrQkVEdkhndmp3Tm9B?=
 =?utf-8?B?bVZLNURzSjNpRXhGQjFRemNQQTQ2bnZZTG0wcFhHUkJnQ0VMZnhSNmNPMVFX?=
 =?utf-8?B?bTF2SEN5Umd6eUloVjQvanNkTUtDUkJNNFZvYzNpUUcwdnduSFYrQUFOM3Nn?=
 =?utf-8?B?RS84MkF4bFVWK1pOcjcwcW1nTlg4cGZIWmtQWnZocjNKb3l2TjRKK0lWNmlp?=
 =?utf-8?B?SVNOUit2UStkRTVNS2Jpb1A3U3JhYVpZSjNSZk04ajBhaDlnd3Vidz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 06bf2a3f-2e15-4a01-f015-08ded5c4b5a7
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 09:56:37.2706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y5K5bi2aSru+CrF70Tk1gPjX7gz+NUdaPQ6Q4lyZ0LuEqeu4yl31msorRmlM1JrEiC0GFvHGtMpaW8EY2tFSRSZq/4s2OhJ+ty3NTN8M85A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8825
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cherry.de,quarantine];
	R_DKIM_ALLOW(-0.20)[cherry.de:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[43];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65887-lists,linux-media=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,jmondi.org,linux.intel.com,intel.com,emfend.at,gmail.com,collabora.com,foss.st.com,puri.sm,theobroma-systems.com,nvidia.com,nxp.com,pengutronix.de,glider.be,sntech.de];
	FORGED_RECIPIENTS(0.00)[m:kieran.bingham@ideasonboard.com,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jacopo@jmondi.org,m:sakari.ailus@linux.intel.com,m:jimmy.su@intel.com,m:matthias.fend@emfend.at,m:mike.rudenko@gmail.com,m:dan.scally@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:michael.riesch@collabora.com,m:benjamin.mugnier@foss.st.com,m:sylvain.petinot@foss.st.com,m:laurent.pinchart@ideasonboard.com,m:paul.elder@ideasonboard.com,m:martin.kepplinger@puri.sm,m:quentin.schulz@theobroma-systems.com,m:tomm.merciai@gmail.com,m:clamor95@gmail.com,m:mailingradian@gmail.com,m:thierry.reding@kernel.org,m:jonathanh@nvidia.com,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:heiko@sntech.de,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org
 ,m:linux@ew.tq-group.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,m:mikerudenko@gmail.com,m:tommmerciai@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[quentin.schulz@cherry.de,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[cherry.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quentin.schulz@cherry.de,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,cherry.de:dkim,cherry.de:email,cherry.de:mid,cherry.de:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA3776D8943

Hi Kieran,

On 6/28/26 12:22 PM, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the users throughout the rockchip device trees to use the new
> definitions.
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de> # PP-1516 and 
Ringneck

Thanks!
Quentin

