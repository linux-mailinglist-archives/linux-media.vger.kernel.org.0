Return-Path: <linux-media+bounces-24310-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C18FBA03489
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 02:29:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DEC5E7A2404
	for <lists+linux-media@lfdr.de>; Tue,  7 Jan 2025 01:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 667BF70810;
	Tue,  7 Jan 2025 01:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LyWsTKhJ"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D13E2594A5;
	Tue,  7 Jan 2025 01:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736213383; cv=fail; b=bACp7LmynneSD6Pj/rgpkbH7XHaquvVdFxLugP/e+kxo3W0zNBImoo94qIbVwp2J4680R0SsKXWgmeh5mfORrEut7rVyaTHK4gegFr/hn6+Z3cKUvQa5MEfeMCwuXoMPczvG9jOHvl6qIBLmpzEftOCyDn1Q2OWG6QdPj5Y73kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736213383; c=relaxed/simple;
	bh=2sWQ1vJv8XE/mLHE/LcOo+/GIALmOp0KFDCtmJt8/CY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JSth3y/DlZNBGbfL3ooft5nL9vyAts6WllFTsXSgMJZ8ZMH2JszPm1eqYqEpkdKz+vBMDrmHLguFJcv090n0/GTL1eJKUwxZLMDoC/3jCGVA5jCL1TvuNTJLnGUvA2HOjV8DP+8aLwrWUOIQbhohe+QZmjdahO7VlqHQiL9Y0E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LyWsTKhJ; arc=fail smtp.client-ip=40.107.21.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fsv1TS/KP4OCRbzD74bFYItiSRPbxSbJPs4scay3F7FNX1hu3KYbnA2iUgCNYD7mDLKMm0aI5EJEc2/aeXETvK0SJlZBdqOOHgystBZIqhDYJlJt83EIBgo+mg8h34Z/TpovzWFw/dEv9XGZJk8X9n8zASC9CDOUDo6fNGnW3PqBpSJAVnPYV9JvOTbd3NRD9a1bbXTumvCP/wISdW+yINT4vj/aAoJsp67If1wbpY04tqNrag46+jbGhdoIz3apoOACSG3mTW+f+Ck3f2fv3E4dpMRt0XLbFGnoVZOI+zWt6aszXa6RAhhve8cuc/8xyq/Kt7QMcFHzUZHH80EsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8ecR6FvJ2bFPhQzuJn/vIQkLmd6xw39DUF/eixYLL0=;
 b=jOMtsZ00fueSb06dvDTCDEGbfPS4kL0i/nm2TWsoJoRzwWrqCYy2drkV73hhVhVwxdzJzJt73eKufSKS18+BEwH+u+awPsxZBuF2tiqJrshXBD67yU5HG27vaVjuYudUl5OwCP1fPVMcX51VJn4/xARpThmWCA6d/PUSYFfuaPw5RzcJmVUjZzQ3PkcKWtCAXsw6BqLCa8bL6qzdBVhecHV5LEbd4OZ8qu3V1pZLVjBfwFNAQM4Y58rq2p4v1fAnytpBtOxL7/uPa+iwD1C3ho9mCljjIGrXj9BKMz7PyeOt2Ra/wn1FAr34kr6elESubPKtMtIYijEYXgJdonszzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8ecR6FvJ2bFPhQzuJn/vIQkLmd6xw39DUF/eixYLL0=;
 b=LyWsTKhJiakNsrcm3QQCFoOA3cxR/IJKt6i6eJgSlynJw/azlAkNNr5x5n0ykwG+WwIGojLAs+pW5rAnhARgPI+Kx8g4dwQ0btiIr445LW6sL98r5MxMbbV3gaquIBrQUIUdN6g4RHWjSpEOZfEahzACmxxzfwGqQ2RXI11EeRuhY/2bx920B+Pt3L9OfG1iW7Mg8cmZIHrl9IbXcj11oAPjXvkZGNJWPxAkC8kIfq8F89zRrNoa6MyQPA9oMD5GCor63onKbCeGRUjxVeXe8/eXzqZYZSQ9jCehhq+WCyfh+pzOshHeix+Cw9jfYu/1hmpZDH5dZQA1Fk+YbNvyWQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAWPR04MB9744.eurprd04.prod.outlook.com (2603:10a6:102:383::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 01:29:32 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%6]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 01:29:32 +0000
Message-ID: <6fcdd612-0f1e-42bd-b171-6f1d70790ffd@oss.nxp.com>
Date: Tue, 7 Jan 2025 09:29:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: amphion: Support display delay for Hevc format
To: Nicolas Dufresne <nicolas@ndufresne.ca>, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl
Cc: shawnguo@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, eagle.zhou@nxp.com, tao.jiang_2@nxp.com,
 imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241219015146.706482-1-ming.qian@oss.nxp.com>
 <86d9eb915432c6b070f7c7f524973e9a363de76e.camel@ndufresne.ca>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <86d9eb915432c6b070f7c7f524973e9a363de76e.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAWPR04MB9744:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fc0296-4847-4748-a5ad-08dd2ebabcbb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TnZoenRNWEtobXV0WndCbTRLRTBaK2NycjVLdWVrT01TRW9EMzdiYTBXM0tk?=
 =?utf-8?B?VFk1Vzd1UkhtMFhWOTNUcWZyMVYzM3FHaG1sck9WOWdMZFNhUnd0cnF1anpa?=
 =?utf-8?B?MTJuYURxYUdpYzc2UU8xa09FMVhneHBlU2x5cEFubDlRaU95dG03L0pWeFpl?=
 =?utf-8?B?OUhLRGM5YUtkQWduSVZnSkxrS054VVBVLzdyOE5LOFJ3N0J0ZVhPVUpVREwv?=
 =?utf-8?B?TEFmelg3ZXpxS2x0bExNWjRLSTExdWxOZEFObkRrWG9qQTNaYzlmNjhwcmtq?=
 =?utf-8?B?RE9JOEZVY0dWSm8rVlZEeGxpdUF5cmRnNHQ2WHAwK1ZFVU1zd0NmeEllOWwv?=
 =?utf-8?B?Ym42N2ZRd3JXRHF5SjYxcFA3Zi9zS1VpT1IyOXJ1MFlGRFdmcm1pSjBZYVg4?=
 =?utf-8?B?OTBjTTFnR0lJdjBmWXByQnNlbENITTVleW8wNU9wMXZsNmxqcStKS3VyTWVt?=
 =?utf-8?B?YlN3QUZpcWQwdXVJYmJ2OXBWMHhWL2xuZk1RZXdNL2UwM3BaTS9FNWtVbVV5?=
 =?utf-8?B?MDB0OEJGa1Y4T0V3TGY5WmpCUU9RTFkzMGxZaTJ3M2Z2VXdENHZ6eUpiN0VB?=
 =?utf-8?B?b0VaaVJpRUpyMVBBTFB3elphbGlsOFdxNDVTNmhhQldJOVFoNFNNaGRKMmpT?=
 =?utf-8?B?MWllbVo5SEpiN1VVL2MvcnJDUmo3UEFvQmJabVJhSUFmYlVHSjVtdUxnNzZJ?=
 =?utf-8?B?VGgzdkx1bnd0aHJxSk5Sa0M5by9tT1R3c04wUDUwaktTUjlXdFdSbVE4RWdj?=
 =?utf-8?B?MzhZL0N2WUtqamsreDIwZk93Q0pUMXFnZzJ3UDNkOFlPYndWV2lLVjdMWThB?=
 =?utf-8?B?NWlvcGZPT3A1VlpJL3NPRzN6b2R3QnBOSUY0cEE2cThPOXNLb1ZPM3Q1dzNs?=
 =?utf-8?B?bVZGaDNCL05GSm00NElLekY2S1AwVU5vZTRnMk8wbVoySVdpMzFOVkw3Qysv?=
 =?utf-8?B?ZnFVQ2U3YkhhaE93cXZYNXA2dkFUblpEZXhiM3VRNDNtR084Q3F5a0plWVJO?=
 =?utf-8?B?cThkMzRUSDJkdzdhM3NIQytOazF2UFNGalE2YklNR2xSTFhNcjhyU2RwNzI5?=
 =?utf-8?B?MmYybXNEdlFBZXUxWUtNbmE3NVJLZ0htL3ZNaHU0UDRYaEhIczZPNzlhZlRv?=
 =?utf-8?B?cm9Wa2l1d1R4Q09RWFJGdGIvbzIzejdGZjVDNXBRa0Y1VkxJMDM0ZWtXZDBD?=
 =?utf-8?B?d2ZGOWljQXQ4Ui9obnJrT2JDcmh5eHA3QXpoWkE3ZFUrQkxNQnVOUFMwbzBk?=
 =?utf-8?B?S1ptcHpIaGhQZlpSRExyMUZ3OGhpUEtTZk9taVFkL1pHMVE5aGswY2RBeTYv?=
 =?utf-8?B?ZjhodHdsNFhKN2FKay9xaHg4bG5oK0xxWlJ2UENOK2kvVGlUWWhBQ0N0QWpa?=
 =?utf-8?B?azRteTVZSVNOQmp0UUd0andxOXE5UnpxYXJtekd0dlAramlCYUpHdkZDcXV0?=
 =?utf-8?B?cTFIaEJIVEREckpYR0Z4NkFBTmVMdnMrRVFFU2tMU3l2U28xNyt1cmhVVWRy?=
 =?utf-8?B?RUVZakRrbm1HcmNRNTNpdE1vUVAxdWI4NlhhVEltWHJZZjRHalBHTG1CbW1W?=
 =?utf-8?B?cDFqL0tRdHkvc0lqOVhuOVdHS1d6RTljMlR1NUVnZjRTRlFQOTI4OTJaYjR4?=
 =?utf-8?B?eWxDSk5DaVBqWUNHZkkvL3pFdmJpYWtkNm9TOVlqaGdlZGI2ZDFORjcrTVND?=
 =?utf-8?B?ZVFpS0tNOVQzN3o1WEE5UFhQbHc0S0F0Q3Z4cERHbnJlekZQdlVFeTVLZGN0?=
 =?utf-8?B?eVBIYmZ2bkxkcXZqT2l1UVF4aklIMWdtZzJTVGJ5c01FeHNPNk5GWjJpMmdS?=
 =?utf-8?B?N3I2MitoN09vSmh5QjQwa3BrUjNQTVk1OXZIZnpkQmtrd2k5cDJYazdtYzU3?=
 =?utf-8?Q?kgxUDfkEQ0qci?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmpJTU54Y3hwTVpUUXVra1BYakpqaDNBVHFFWGFNbnpNbk5GbmJuZHJjeWh2?=
 =?utf-8?B?bVRuMElTR3RyeTVVUGFycTB0MDI3NWlyTWZ1U2ZrYkk5bnArZmdWQXFGcVNW?=
 =?utf-8?B?a0w2RnNZSUVKMGxjdGNZbG11NFFJbmM1aEZXMktReGlBWVJCTWJvcE9JTzA5?=
 =?utf-8?B?UzlWc1krSm0rVm1wRHo0RkpDZllsQVE5NzFpL01SMzhhL1VMR09HYjY2NVhI?=
 =?utf-8?B?RGpkVGcwOC95VnI5N0EzTWxhTTFYMXA0OXFWMWlmK3VVbVNZYnBvL0VmOFEv?=
 =?utf-8?B?WXIra29vS014YzlnazF6RVlzdFBSSmdDQmsrNTRLS2FrUHhSNHJXczRKdFdY?=
 =?utf-8?B?NUpKbHd5Mk9qcnVyUHNaRFJoZ1ZQQnd2S01RZTBjN1dQU25pMUpDamp6THc4?=
 =?utf-8?B?WEFJTURuK1M2U1hyTEYzY0NFSXR0SW5mQ0Z1cUxiUkJ5alZrQ3BBR1hFdmdk?=
 =?utf-8?B?MUhGTVRkWkVDd1V2LytyZ1p4eGZPVWNmNUVXTW1VcEtselFmN1pVUTE5OG9J?=
 =?utf-8?B?UlQ0TVY0THZhREYzc25GUmVMbUR1Nit1eWF5UENqeEVMYVZtNTNLMXhMdFpi?=
 =?utf-8?B?RjZSNVJpMkdBWm9hUEl6VFB3Nk5xcldmTWxwdjJyZlQrVmlaeUgvNnZldlYy?=
 =?utf-8?B?NldkaTlFMGk0NzZSb1ZocTNyOUhYQnBFR2hKbExqYldJSWdua1RhQTdPRjRz?=
 =?utf-8?B?YVdjZW5zbEVzdVR3QUxMVmRiM2ZhQll3ZkRTZXEwUW1mZnd1K0JuY3IvYi9O?=
 =?utf-8?B?a2xSRWxyeTVuMjBTUGpDNDlIb3VPMmx6V091ckc3bEEwNlEzRUR5R2dNYk5W?=
 =?utf-8?B?SlNtcklrdGVNRW5lbHgyQlBialRZWVIwRXkvS2Mra09rWlYvYWdCZmwrYVZi?=
 =?utf-8?B?NTVxSWJraUdaaFY2cWpYT1A3YmI3UjhSa1grTXdvOVBVS0lxdWVJVmVIRUox?=
 =?utf-8?B?SGxueWprL0V6SVpFanhUT0ZlejlHLzdQV3BENmZFdkYxUXhYZjhITjRCbldT?=
 =?utf-8?B?eEV3NUhRVWpER2k5RzZkVXk0YmVUd3FzK2tjcEhPRnUvUjF5SlhheW8wWTVR?=
 =?utf-8?B?OWhGc3F1UysxTTdtUFRBZ1FxN09KcVVVbGN2U1ZsRnlpSnh6dnR2VDhCU0tn?=
 =?utf-8?B?MkJueWJ1Uzh3ditkeTVnaDhzSTlGTHptdnRGSVZadDNLL2xjR2FlMmNwMFB1?=
 =?utf-8?B?YUw2VnRXTHNLQ2pvbDkzSmFJb0lRaW5iNVVOWXoya0RyWjVqSm51WFd5a1VO?=
 =?utf-8?B?YVhLekVEa2lTRXV3QW9mUHo2UUZQK0dHb0tPbnh5R012Vmg1UTV3aWhaZEY4?=
 =?utf-8?B?RUp0blJ4N2JUL1AycmtQK20rSXF5NDgyRUJYaGFJdkpxdmNhNTdFZHdIK1FJ?=
 =?utf-8?B?VDRBbE44WEpOVXR2RUFHUmZjV2FxL0czSDUzNVRQMWNwaDVRU281Q1R6UkR1?=
 =?utf-8?B?eHV0V3FWYXAveDZFREczSUo4VHR6all3ckc5MkZpY2FGMjdqRndQckN3REFR?=
 =?utf-8?B?U0lheW9ycGRUREROQmlKZUlIdlNEa1c5ZEttQzFTOGt5YXEzNlp5cUJxaXJx?=
 =?utf-8?B?SzNLVXMyZFNYYXhZYW5FVU5qS1hHR0wrY3lXVm1ZaDR3eTBIZk9XMTI4NjJp?=
 =?utf-8?B?TFVpZUc4TzMwL01oMmkzbDZCbzN3SmVORHozOW9SWjhGaDBoRDBaankrdXEy?=
 =?utf-8?B?M1NwcnJPREZyUnpVRlEySVJZT3lYVFVyQmpackV3NDMwV0Z1NlZlSjRnY0M0?=
 =?utf-8?B?WXYrU1M3QXdCMXRXc24zTUdBY2FzY2NoeUVVVWRBRExEY2VqbnJsV09meTls?=
 =?utf-8?B?Tm1DeGRXK1N3cEk4N0hudS9nZFp1alJFMTJGT0JoSjM5YXl0RzYrb3ZicWl0?=
 =?utf-8?B?TnlqNVk4OW9UUm5ydlNQaW5mUmpYRGVBVkVqRytJcFpvL3JQS1p6eC9RUWs3?=
 =?utf-8?B?cXBoYUJWdGZ5eDRwbXprcHhsenhvS3NXSUN2ZFIyZ0ZTT0thZ0c4Tm1YODNz?=
 =?utf-8?B?MmFKY3RsdG9kMjYzNml1d05wQXpqZ2JxcFNNKzAxZXJVYWZ4Y3dPSkxqTHdu?=
 =?utf-8?B?dHlCOS9Tb1JHQWFxZ2EzOWVrV043TURrWjNaSHdiNE1xbk5tbWJuOWVsVjBX?=
 =?utf-8?Q?tT7Dqz89yhi59FR454w+RlsSK?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fc0296-4847-4748-a5ad-08dd2ebabcbb
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 01:29:32.5844
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuzGCuaPcLUQ4jnnCrkgrobAPcJgSz3jEN8NHZ9v8vE6VAZVX/vrcCkiJNQNTZ38K1NGN1P4n9gbalPATP5Low==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9744

Hi Nicolas,


On 2025/1/7 6:16, Nicolas Dufresne wrote:
> Hi,
> 
> nit: use capital HEVC in the subject
> 

I'll fix it in the v2 patch

> Le jeudi 19 décembre 2024 à 10:51 +0900, Ming Qian a écrit :
>> The amphion decoder firmware v1.9.0 supports display delay 0 for
>> hevc format, then driver can enable this feature.
> 
> nit: HEVC
> 
> I think this added "feature" hides a bug you haven't fixed in this patch.
> 
> 
>          v4l2_ctrl_new_std(&inst->ctrl_handler, &vdec_ctrl_ops,
>                            V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE,
>                            0, 1, 1, 0);
> 
> With the control registered this way, 0 is the default, and the range of 0-1.
> But from your commit message, this is only supported from firmware 1.9.0 and up.
> I think the patch should basically adjust the min and def values according to
> the detected firmware version.
> 
> This might actually be more complex, aka per CODEC, and for that you may want to
> use v4l2_ctrl_config structure.
> 
> Nicolas
> 

Thanks for the tip.
By the way, how to define different ctrl values for each CODEC format?
Is it reasonable to new a ctrl after set capture format?
Or can we change the min/max value after set capture format?

Thanks,
Ming

> 
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c b/drivers/media/platform/amphion/vpu_malone.c
>> index 5c6b2a841b6f..8f4aa48b2d65 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -332,6 +332,8 @@ struct vpu_dec_ctrl {
>>   	u32 buf_addr[VID_API_NUM_STREAMS];
>>   };
>>   
>> +static const struct malone_padding_scode *get_padding_scode(u32 type, u32 fmt);
>> +
>>   u32 vpu_malone_get_data_size(void)
>>   {
>>   	return sizeof(struct vpu_dec_ctrl);
>> @@ -654,8 +656,10 @@ static int vpu_malone_set_params(struct vpu_shared_addr *shared,
>>   		hc->jpg[instance].jpg_mjpeg_interlaced = 0;
>>   	}
>>   
>> -	hc->codec_param[instance].disp_imm = params->display_delay_enable ? 1 : 0;
>> -	if (malone_format != MALONE_FMT_AVC)
>> +	if (params->display_delay_enable &&
>> +	    get_padding_scode(SCODE_PADDING_BUFFLUSH, params->codec_format))
>> +		hc->codec_param[instance].disp_imm = 1;
>> +	else
>>   		hc->codec_param[instance].disp_imm = 0;
>>   	hc->codec_param[instance].dbglog_enable = 0;
>>   	iface->dbglog_desc.level = 0;
>> @@ -1024,6 +1028,7 @@ static const struct malone_padding_scode padding_scodes[] = {
>>   	{SCODE_PADDING_EOS,      V4L2_PIX_FMT_JPEG,        {0x0, 0x0}},
>>   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264,        {0x15010000, 0x0}},
>>   	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_H264_MVC,    {0x15010000, 0x0}},
>> +	{SCODE_PADDING_BUFFLUSH, V4L2_PIX_FMT_HEVC,        {0x3e010000, 0x20}},
>>   };
>>   
>>   static const struct malone_padding_scode padding_scode_dft = {0x0, 0x0};
>> @@ -1058,8 +1063,11 @@ static int vpu_malone_add_padding_scode(struct vpu_buffer *stream_buffer,
>>   	int ret;
>>   
>>   	ps = get_padding_scode(scode_type, pixelformat);
>> -	if (!ps)
>> +	if (!ps) {
>> +		if (scode_type == SCODE_PADDING_BUFFLUSH)
>> +			return 0;
>>   		return -EINVAL;
>> +	}
>>   
>>   	wptr = readl(&str_buf->wptr);
>>   	if (wptr < stream_buffer->phys || wptr > stream_buffer->phys + stream_buffer->length)
> 

