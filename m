Return-Path: <linux-media+bounces-51720-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMCuFevGeWl0zAEAu9opvQ
	(envelope-from <linux-media+bounces-51720-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 09:20:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E96D9E291
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 09:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9382E301F69F
	for <lists+linux-media@lfdr.de>; Wed, 28 Jan 2026 08:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339AB32A3FE;
	Wed, 28 Jan 2026 08:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gg9lRpMe"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013015.outbound.protection.outlook.com [40.107.162.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58412D060B;
	Wed, 28 Jan 2026 08:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588281; cv=fail; b=qEw6IlVAXd6TAqeBXjL3dkvgn1p2hvZk9PiiH7GKkxk6cugjpPsiFRJy6w/S+pnPMFUxCVYaJDIXK8o6qbxTqcJ5cwYd1dqgg2B+aqE+MZk5HeKmNW2I2ObdByuStFmsjftf/W6Jdq8POdDa8/soW4182SqBtrdsseFOkNsiUF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588281; c=relaxed/simple;
	bh=ys8LHI3Jm/tIHzZRXov+0ABVtRqFGNT8dobOt7s8ayQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZeDHiSDfF8Wd9zjd6FcHv2Ronv6KE7SKU645VapDwdMW6yoV0CI6NLELOvz6qiPYEqaOyedpdOt79yVRF3R8r99Q8oc7xcyQFEsc+yHkL4GplDUVEDIKr1aj+qwnIZpfSqFbWhtmrD+C/IbXYm/SEm5MG3sRwom0ZGB0mFPbyFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gg9lRpMe; arc=fail smtp.client-ip=40.107.162.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKA02yLac1KhkgZT12w8CDZ4vG0EvP98+5v+dOGdMW8R8iEH80rDSaMwGB/8wcG7NE4Jvtq0P6scbfr/R8L/HuswyjgEd4z61Qw2PQgyN1ucAy+ioRMc7TacA546FAm7anCLUjC7p3ULD/QNFy9I35uyF4AUc7T26kqDDDgjdDVCPkP0umSmArTnYSIcweSc8q/fsdOgtrEzHZoCwypuiBAWiGOgwSogo9+WkRbOrI1w2EyeNZOCdWK9vcyM5OgZrQcWt9dM/GdWw1/1tF/S1tw5TQvn09uzS/X1z+GSBgbN4xrchJIdZu4MeQrJH8X9+pYKsjo9dXHQC7tdQbVp4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OH4d2I7xBxJ2GcRhoUrtJK5IDeLU1wf9SLrAA3PohCs=;
 b=BgkIL7eqLYHhln/D2DY9hZ9kZevxXuE72zQlRDwJv25h4ogRUz0wbltMcr4QNslUPxQ7MNcN+frFat+lltVKagNAvvzp5atdbd9c7Sc1vIVBA6Z41mjaYclJa7f5/hj6HHUEPbyAl7k8VgMRfej4X8+LWN1cL8MbdgSFgEiMay1bNr9kFo4CESDUS51QvWwVATSVX/VRrCIWcwR5wplMERwzvnD2SdhIXH3Hky1xUpVK7wk4ux01qGzcUl4XJHzup4rgFAxJVEqBg70OFQUTTEvR6w15JvWVmua542RdyK97+NfGcr2CnNnuHrO5FbmJWCNgujFth6QiNs+wYM0cAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OH4d2I7xBxJ2GcRhoUrtJK5IDeLU1wf9SLrAA3PohCs=;
 b=gg9lRpMeCVUenvjg+bfPBqQ1h/7akhzcUDTBpYuEBFubccbyFdSrpt3AlITIHxVS8a5vOhYoiLU2mbNAVPyRG6UVmousgYeAGwBvHNPYbvVv+oZ8gDVpfSaKaObVWa+81IsxEmj1GZkq6rX9sfM6gsmj2mJKYON6BqQbSLyutfRX8hSw/iSFSUkQ3dC4tGZ2Yf/lVSeGmyNJLsscbft741irqWfieNgck6q5sCyZmHK8C6W8wXVlMHfPlEewbuVYsTGp6dwQ0WO5Ucm6RvWZ6nYKuE3x19Ev/higDE8S2JjE5YUA//wUGPGYWTkQmMuhumfKFUslW1MtQ2VZe/oDCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AM0PR04MB7153.eurprd04.prod.outlook.com
 (2603:10a6:208:1a0::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Wed, 28 Jan
 2026 08:17:55 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 08:17:54 +0000
Message-ID: <c8536c80-2f58-4eae-9336-436d772206df@nxp.com>
Date: Wed, 28 Jan 2026 09:17:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [RFC v1 00/11] Add iMX95 neoisp driver
To: Michael Riesch <michael.riesch@collabora.com>,
 julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com, daniel.baluta@nxp.com,
 peng.fan@nxp.com, frank.li@nxp.com, jacopo.mondi@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <544a98f3-d451-4ca1-b7d0-0b0a1238f66a@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0031.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::10) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AM0PR04MB7153:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd21b6b-85ce-476c-630d-08de5e45bc8d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?M0dkUWErSDNLRGlUenZCcVJ4MjF0QmNucXlJd1hnU3k5T1FsbmlDTlQ2SWhm?=
 =?utf-8?B?M1FCemxlMTBtWEdzNGdkNS9CVWhsY1llbDRybVFMWmVmL3A1VnFHUWQydS9v?=
 =?utf-8?B?WjgxQk1ERys5LzRqWkx3cHdqMEhLWGRsVHJqVFBQZ1VDdVk0SU1aOFg1Rm16?=
 =?utf-8?B?ejVhQ0d4WitHTU0xeTJqYW14V2U4QXFmd1lRRDBoWFNMZG9USm9NUUM3eVlo?=
 =?utf-8?B?U1R0c094YkprdGZOUGVqYm1DZlhrU3ZwdU5XL0xKVnBqTVA5RS8xdTU5aHgx?=
 =?utf-8?B?Q0xsMTE5b3pPaEt2TW1tKzUvdjZRTFlwb2xQckNNTE9UZnMwVFQvRUpNalJP?=
 =?utf-8?B?M0wvZ1B2dncwL2ZsZUc3K24xRTJsRGEvdmlOaTljbEJyUzZFR0hKNkJ2b2NC?=
 =?utf-8?B?UkZJUE9CZGgxdVU2YVdnWnRYZlgvalRlQWw1bWRhOUpadis3cGdGek1pbU9m?=
 =?utf-8?B?Yko4aVlReSs1Wm5UZFhESHA3K0xBV2VOMG5Zc1VxLzBiSXhpOEpmdzFRN3BG?=
 =?utf-8?B?L2V6VFRYOUtQUUlmRjB3d1gzY1pTaUZoVXpIcTJnMjJHRlAzTGg5YWo1NjBX?=
 =?utf-8?B?eHdwVVZGT3A0ZFF6UDlwRWdLeEt1Uk5FWGhOTFQ5QmkzMHhuZVpJYVdXVE5C?=
 =?utf-8?B?RXc5Z0Z0WG9WZ3V3aVZhSDY5NklKSytVLzNWS2VKcWEwS2VDem5idGg0bkND?=
 =?utf-8?B?SmQrbkRvWndLb3dXb2RuMGJwM1pveTVsSFcxMFFBb3h6QmFJT3laNS9SRGQ4?=
 =?utf-8?B?QXNpcUVxWEJ4VXlyb2pCWG5yTFg5YjZWZDg3TjhiYUo5K3NreW9MeFFoZUp1?=
 =?utf-8?B?dCs5VFhKWjUvTUNhWFFiRkVqWm45NjRhc2Z4c0V5YUN6QlM0V3Y4cG1qdGVW?=
 =?utf-8?B?VVNacTkwdjVIaDU0SW9qSDcxZUtid3NEMzZJQndKcXlXa1dkNG81T2RJN29u?=
 =?utf-8?B?dWxRcDYwM3YzT0pVQmVIWFNzOEpJdkFKTkJZMFFSei84MWpsanhQcmpmM002?=
 =?utf-8?B?elR0d1RYbzR1eG9sNnBkOVFlUWVvaWtaQzl1QjBzazRaQzdIWWtoOFJvYkk3?=
 =?utf-8?B?NTNjdm9WdktZaFVOM1ZudjkyRlNlVFBoSndYUmszL0cyVy9XNmozdWJKbCsv?=
 =?utf-8?B?eFd0d1JZZkJvTnpudmVKUnhqSkEwUVFHdE9VVmxjTklRUVVNczVIUmcwQmlt?=
 =?utf-8?B?S1BrK3F3dStYWTRKb2pNVGtjajdZcXJvcWhtMjlYYzNDM1NpY0VRdUVNeGQ3?=
 =?utf-8?B?OENiWU5WUitYanBiSGVqeE0wcmhma2lZTzdhRi9jRFgzbHVFRVE0TGRLTW5w?=
 =?utf-8?B?WGlqUGQ0dTE4TFE4emcyK3l1ZGp4bm9HRC90VU41aFVsR3d1S1BieHFwUjRB?=
 =?utf-8?B?YjUzT0NHYXNRMHpnb0hvWUhTMk00SGpCNXIvVzRpY2JXbU9MeXp2YWdGZkdX?=
 =?utf-8?B?aEIvdXNiWThRd0tqOXZrSTFyRE02KzhCSzcwdWViRVJKMS9RUStMcUQvTFhX?=
 =?utf-8?B?RTE1cWpSWW9zVWdQZlY4K1MwYTFDeFZENmp2MmdjVlRPMGljUkVBV1dwSUI5?=
 =?utf-8?B?NkFjbFFwemtnREVlS0NDNTJXcXNEdUo5L0twOTdUaHMvcmIxWnpvVncyVzh3?=
 =?utf-8?B?U1ppa29QUXRzNVdVaE9FcHVZWUdpYkhmMmdpZjdPd3pKY1plejFISmlqRlpr?=
 =?utf-8?B?RGNLZUY0WTYwN3VpSG5lVXFzSmtpMjBTb3pacXd0cGtSSWg2cU9wVmQ4T1JX?=
 =?utf-8?B?bG9Zc1J6ZWt0MGJYS2RIMlFyK3FHL3kvZi9pSGFRTVFOUVlmYlRKZFNGekRl?=
 =?utf-8?B?UW5mb3daa0V4dXFIWGE5WmU5cTg2VU11akVOMmtMajFwNER5NVJRM1I3UGsw?=
 =?utf-8?B?UytMTmFOb1psK3NyZXVxYUs3MjIyajB2azRjT2UzdVJ4dDNiS1ZsYndIZ2xx?=
 =?utf-8?B?N3loV1F2SFRHb2xnWVRrK3l1QzZUaHJmbm1KbHdTTE5ya3lXR3ZaUzgxSUNa?=
 =?utf-8?B?ajJrZ0ttR1pnWEtIWUVoZExkVUtYckZjRGhoSXNhYTdoK0lZdm1QTlBXdnJV?=
 =?utf-8?B?N1RWRFNvNXcwLzVhTllZSkR5aFkzZTRPZzRnSDhTa3dvTWIyWWNOSlo4cVRz?=
 =?utf-8?B?VW5yOS82RC9OUjJSa2JBVHFCc1F4VlAzeHJJU0FleEpiR1Q3aGY4V3RGTXBk?=
 =?utf-8?B?RXc9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OXhaN291cU9yS3JIR0JVQjJYRmowMzN4djc0Q09JYTN1blVLTzFDT0Q2eXh6?=
 =?utf-8?B?c3VpUTFQWlZjbUFjOXQyRURvbmllWmV1Z3pWQkJiQzVOL1JSb0tLVGlJSjFL?=
 =?utf-8?B?YWhiUzlvRWNCUHZaNjBhamgzV3RZUWZab0FaeWhMcnVlVjI3RXdJS3ZEUmZt?=
 =?utf-8?B?ZXFndkxWSHoyaVJIMVlneUtTODlDMUxlaTZNZHZ6QmF6d1FsbC82Y2VpMlNt?=
 =?utf-8?B?dXIyQVZPTXkyV0ZOY2MybW1GWjdKWlB6YVNSTVZaVGs5dDE4SGFVVmQwVHpO?=
 =?utf-8?B?K1cvQktjeGZRR0FjRDlZRy96NWNNemxaRzFJS2lMbEpON0FHYVVsQzRVTmZJ?=
 =?utf-8?B?cDZ0ZlEyTTgzek9VeDZlaXlselFKTEtQbXBwZUdFR0d2KzVYYUIzbWpBdlNs?=
 =?utf-8?B?ZzQ5YjZoYzlGaGplMXloZ04zekREWEZ0N2I3WjgyWStpR0t1MDV4WEIvdUgr?=
 =?utf-8?B?WkFMWHA0d0poWVp0VDlyci9LSjloY3haaWh6M04zR0dOSXAxOFdLRU9MejVp?=
 =?utf-8?B?T3BqdThsVmJtSER6b3IvUUlNZnJkUFhzS3hUQzZDa2pQRGZRc1ZtTnZkTFZV?=
 =?utf-8?B?YTNLaWwxbXZaTThHYWsxZFc5dS9GUS9Na3JoY3NrK2x6clJzVGlSVFBHbzhn?=
 =?utf-8?B?dDRCY1J1YkdFaWhRd2dDdjFvV1picUhnQmpEazlHUy9MMVB3TXh3TjRmcGxQ?=
 =?utf-8?B?Sk1LakltUzllNHJJRWsrWllIQ2ZqMjgwckQ5Mkk1MFA3YnAydytuWVF5ZFM4?=
 =?utf-8?B?Mm5ZeGF2YXVWaUNNS0EyOGQrMGtGOXZzRVRZWjFWbWdQMGdqdDNJc3lSMzFQ?=
 =?utf-8?B?TFZXMlcvcUZMQUdTellUalN5c1dqQUNNcDFITXlEWDZCR3RtWnNoTURHVnBD?=
 =?utf-8?B?ZDVBalA0c3VmcCtiR05Lb0pMVHh4N1pzTCtoR21iZ2FGYStvSmxFY0NyRDBG?=
 =?utf-8?B?KzZXelRuU0kvZlpaTExKVEdoejJ3eFRibVlZWE5ONk04ZEd5bFdSRUdnb0w5?=
 =?utf-8?B?R3RxMkV4a1piRnEwQVQzK0t0VmhVd2U0V2hrejFLZWFTaEQrbFVqZUJzMys5?=
 =?utf-8?B?d1dJdlZGbWJ6ekRFeWlrZ2JROFVuY3NmOW5zQnc3MENvQUZTa3E0c0EvMytI?=
 =?utf-8?B?ajdLdjVKVWo4THFYNWdKVmkwQTJjVGpZNGJRaTB3QnYrRWxmYThTSktwMFov?=
 =?utf-8?B?YVlRQVFxZnN0d1BkOTNlNVozS29ZWGhLbWlHVVMyZm43b1FZek9hU0tQK3FW?=
 =?utf-8?B?bzhyejkwTkNlRkVtL2VSV2NRYjlNQ1p0K3dQV1V3dFB3V0pNSElWZ0pPUTBj?=
 =?utf-8?B?VFlrOC9DWkIzbTB0blgvcExPVnkzUTg3NTFHR0ZOU1JueCtkRGxreFBuS1Zr?=
 =?utf-8?B?Rkg4RnRZKzg1ajQwZEwwaVBpYWU1RWZZMGpPbitKS3NLWHcySWk1WEw3eFNy?=
 =?utf-8?B?bHFTOFBORytPWlpxbjVEb1dsLzN6blhSY2l6cXpGM3JTSFlxakpUZzV2U01U?=
 =?utf-8?B?cFZaVnJ2V3pmTThkcXVISk5FbFhldy9MQjcrOFYrOUlEODgraVBrUkRVUDEx?=
 =?utf-8?B?UjZsMVhaOWIvZk1uRjVkMEY2cE9hT3p2RW94bmgzYlEwNWhrQnVmVnpndHpK?=
 =?utf-8?B?am02aXpVL3BCR0p5TllTam9RSWgvdlVHZS9oUk1GODFvS2Z3T1ljUEo0T2Ni?=
 =?utf-8?B?QlArK1UzMUZDdldVZGdXcVRLWTVLN1RCd1loMXlZUzg0RVR4MmVyakl5cC9i?=
 =?utf-8?B?NzdoMnBwb29LZnQyU0hTcGwyc1JwZ29YRGRYdVIyMlFwbXNGU3I4enI0OVFX?=
 =?utf-8?B?cVliUzEyYTBPbXAva0tnMUpmb2hjdXcvdHcvbVhyKzhKUm1DeWp0NHZ4VHhM?=
 =?utf-8?B?TjE4Mkl6WTBQa04yN1JlSXloamRrS1RtR3dmZ3JoS0dUTU9FcHg1cU1mTE1s?=
 =?utf-8?B?UTcrZVNhdk1CdlltSTQ4aUVlRzR3OUpYOFc3c2dpLzJxMkx6ZjFaZjdwTVVx?=
 =?utf-8?B?N3g2WmZmRUtZM3FkRnJmeE9OV2U2VXp0cm1ZRjByRVA4c055VnpNODNic3Vk?=
 =?utf-8?B?RzBHVlFqdVYyODZ0UGp5VzJaM0FPdWpxSis5UFpJdGh4M29oSDdjWVNOMFRi?=
 =?utf-8?B?UXYvZ0tYemhidEl2c0VsUjV4Qlc2ck5WaUF3UUFnOUQ5NUlvYk14QWd5UXJ3?=
 =?utf-8?B?Q1Z5UEFjNk9sNERqd0MwaHp2RzBoWWxwME1oSGZVejVienUzMnU1dkRZUFpM?=
 =?utf-8?B?REsxNERZOXQ1Tms2RlpONS9DTDIrTk9ndVo1S0FXK2xEQytrZTB1SDYwR3VI?=
 =?utf-8?B?N2tHdllGWk11cjE2L3BvL2JiWFFyOFVFbkV3OXRXdG5HdmlLZGp3dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd21b6b-85ce-476c-630d-08de5e45bc8d
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 08:17:54.6018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGAqnqH0Uu1bs91z80IkDDz1uWmLWn81kpBSf+QbJ6EziIA6XaSXm65eJtl2it17hkrXj86xntnJsaINa85q0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-51720-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[collabora.com,nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 4E96D9E291
X-Rspamd-Action: no action

Hi Michael

On 1/26/26 10:44 AM, Michael Riesch wrote:
> 
> 
> Hi Antoine,
> 
> On 1/23/26 09:09, Antoine Bouyer wrote:
>> Hi all,
>>
>> This RFC patch series introduces the NXP Neo Image Signal Processor (ISP)
>> driver, used in the NXP i.MX95 SoC and future devices in the i.MX9 family.
>> The series also includes updates to the generic v4l2-isp interface to
>> support extended statistics required by the Neo ISP.
>>
>> The Neo ISP processes one or more camera streams, converting RAW formats
>> into YUV or RGB outputs. Its architecture is largely influenced by the
>> PISP driver. The hardware supports up to eight contexts, with three sink
>> pads (main input, HDR input, and parameter buffers) and three source pads
>> (RGB output, IR output, and statistics metadata).
>>
>> At this stage, both legacy (fixed-size) and extensible (dynamic-size)
>> parameter/statistics buffers are supported through the generic v4l2-isp
>> framework, similar to rkisp1 and Mali-C55. The driver currently supports
>> M2M operation; direct CSI-to-ISP streaming is not yet implemented.
> 
> How do you envisage the direct CSI-to-ISP streaming shall be supported?

At this stage, this streaming mode still needs to be evaluated on 
neoisp. We should follow the integration model used by existing ISP 
drivers to avoid duplicating solutions.

Below are my initial thoughts on the specific points you raised:

>   - How shall the final media graph(s) look like?

The media entities would remain mostly identical, except for the absence 
of ISI. The topology would be a direct linkg from 
sensor->csi->formatter->neoisp.

>   - How many media devices are registered and which driver registers it
>     or them?

That will be part of the evaluation. My initial assumption is that 
neoisp would be the appropriate component to register the media device 
in this mode, since ISI is not involved, and ISI currently performs the 
registration in the M2M configuration.

>   - How can the user decide whether direct (csi2isp) or indirect
>     (mem2mem) streaming shall be used?

That will also be part of the evaluation. From dts would be my first 
option, but may prevent using both modes on same platform then.

> 
> While it is certainly OK to introduce this support only at a later
> stage, it makes sense to consider this right from the start to avoid
> some nasty changes e.g. in how this hardware is exposed to user space.
> 
> Also, we are facing a similiar challenge with recent Rockchip ISP
> hardware (RK3588, RK3576, ...) and it would be great to hear your
> thoughts about that.

Is there an existing discussion thread available on this topic? I would 
be very interested in following it.

Thanks
Antoine

> 
> Thanks in advance and best regards,
> Michael
> 
>>
>> This series is posted as RFC because extending the v4l2-isp interface may
>> overlap with ongoing work. If similar development already exists, I am
>> happy to rebase or adapt the series accordingly. If preferred, the series
>> can also be split into two parts: the v4l2-isp rework and the Neo ISP
>> driver introduction.
>>
>> A few checkpatch warnings in v4l2-ioctl.c remain intentionally to stay
>> consistent with the existing style in that file.
>>
>> Testing was performed on the i.MX95 EVK using the media/next kernel in
>> standalone M2M mode. End-to-end camera-to-ISP capture has been validated
>> using the downstream NXP kernel, as some hardware dependencies are not
>> yet upstreamed.
>>
>> Thanks,
>> Antoine
>>
>> ---
>> Here are v4l2-compliance test results:
>>
>> v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
>> v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15
>>
>> Compliance test for neoisp device /dev/media0:
>>
>> Media Driver Info:
>>        Driver name      : neoisp
>>        Model            : neoisp
>>        Serial           :
>>        Bus info         : platform:4ae00000.isp
>>        Media version    : 6.19.0
>>        Hardware revision: 0x00000002 (2)
>>        Driver version   : 6.19.0
>>
>> Required ioctls:
>>        test MEDIA_IOC_DEVICE_INFO: OK
>>        test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>        test second /dev/media0 open: OK
>>        test MEDIA_IOC_DEVICE_INFO: OK
>>        test for unlimited opens: OK
>>
>> Media Controller ioctls:
>>        test MEDIA_IOC_G_TOPOLOGY: OK
>>        Entities: 7 Interfaces: 7 Pads: 12 Links: 13
>>        test MEDIA_IOC_ENUM_ENTITIES/LINKS: OK
>>        test MEDIA_IOC_SETUP_LINK: OK
>>
>> Total for neoisp device /dev/media0: 8, Succeeded: 8, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for neoisp device /dev/video0:
>>
>> Driver Info:
>>        Driver name      : neoisp
>>        Card type        : neoisp
>>        Bus info         : platform:4ae00000.isp
>>        Driver version   : 6.19.0
>>        Capabilities     : 0x8ca03000
>>                Video Capture Multiplanar
>>                Video Output Multiplanar
>>                Metadata Capture
>>                Metadata Output
>>                Streaming
>>                Extended Pix Format
>>                Device Capabilities
>>        Device Caps      : 0x04202000
>>                Video Output Multiplanar
>>                Streaming
>>                Extended Pix Format
>> Media Driver Info:
>>        Driver name      : neoisp
>>        Model            : neoisp
>>        Serial           :
>>        Bus info         : platform:4ae00000.isp
>>        Media version    : 6.19.0
>>        Hardware revision: 0x00000002 (2)
>>        Driver version   : 6.19.0
>> Interface Info:
>>        ID               : 0x0300000a
>>        Type             : V4L Video
>> Entity Info:
>>        ID               : 0x00000008 (8)
>>        Name             : neoisp-input0
>>        Function         : V4L2 I/O
>>        Pad 0x01000009   : 0: Source
>>          Link 0x0200000c: to remote pad 0x1000002 of entity 'neoisp' (Image Signal Processor): Data, Enabled, Immutable
>>
>> Required ioctls:
>>        test MC information (see 'Media Driver Info' above): OK
>>        test VIDIOC_QUERYCAP: OK
>>        test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>        test second /dev/video0 open: OK
>>        test VIDIOC_QUERYCAP: OK
>>        test VIDIOC_G/S_PRIORITY: OK
>>        test for unlimited opens: OK
>>
>> Debug ioctls:
>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>        test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>        Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>        test VIDIOC_G/S_PARM: OK (Not Supported)
>>        test VIDIOC_G_FBUF: OK (Not Supported)
>>        test VIDIOC_G_FMT: OK
>>        test VIDIOC_TRY_FMT: OK
>>        test VIDIOC_S_FMT: OK
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>        test Cropping: OK
>>        test Composing: OK (Not Supported)
>>        test Scaling: OK
>>
>> Codec ioctls:
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>        test CREATE_BUFS maximum buffers: OK
>>        test VIDIOC_REMOVE_BUFS: OK
>>        test VIDIOC_EXPBUF: OK
>>        test Requests: OK (Not Supported)
>>
>> Total for neoisp device /dev/video0: 48, Succeeded: 48, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for neoisp device /dev/video1:
>>
>> Driver Info:
>>        Driver name      : neoisp
>>        Card type        : neoisp
>>        Bus info         : platform:4ae00000.isp
>>        Driver version   : 6.19.0
>>        Capabilities     : 0x8ca03000
>>                Video Capture Multiplanar
>>                Video Output Multiplanar
>>                Metadata Capture
>>                Metadata Output
>>                Streaming
>>                Extended Pix Format
>>                Device Capabilities
>>        Device Caps      : 0x04202000
>>                Video Output Multiplanar
>>                Streaming
>>                Extended Pix Format
>> Media Driver Info:
>>        Driver name      : neoisp
>>        Model            : neoisp
>>        Serial           :
>>        Bus info         : platform:4ae00000.isp
>>        Media version    : 6.19.0
>>        Hardware revision: 0x00000002 (2)
>>        Driver version   : 6.19.0
>> Interface Info:
>>        ID               : 0x03000010
>>        Type             : V4L Video
>> Entity Info:
>>        ID               : 0x0000000e (14)
>>        Name             : neoisp-input1
>>        Function         : V4L2 I/O
>>        Pad 0x0100000f   : 0: Source
>>          Link 0x02000012: to remote pad 0x1000003 of entity 'neoisp' (Image Signal Processor): Data
>>
>> Required ioctls:
>>        test MC information (see 'Media Driver Info' above): OK
>>        test VIDIOC_QUERYCAP: OK
>>        test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>        test second /dev/video1 open: OK
>>        test VIDIOC_QUERYCAP: OK
>>        test VIDIOC_G/S_PRIORITY: OK
>>        test for unlimited opens: OK
>>
>> Debug ioctls:
>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>        test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>        Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>        test VIDIOC_G/S_PARM: OK (Not Supported)
>>        test VIDIOC_G_FBUF: OK (Not Supported)
>>        test VIDIOC_G_FMT: OK
>>        test VIDIOC_TRY_FMT: OK
>>        test VIDIOC_S_FMT: OK
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>        test Cropping: OK
>>        test Composing: OK (Not Supported)
>>        test Scaling: OK
>>
>> Codec ioctls:
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>        test CREATE_BUFS maximum buffers: OK
>>        test VIDIOC_REMOVE_BUFS: OK
>>        test VIDIOC_EXPBUF: OK
>>        test Requests: OK (Not Supported)
>>
>> Total for neoisp device /dev/video1: 48, Succeeded: 48, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for neoisp device /dev/video2:
>>
>> Driver Info:
>>        Driver name      : neoisp
>>        Card type        : neoisp
>>        Bus info         : platform:4ae00000.isp
>>        Driver version   : 6.19.0
>>        Capabilities     : 0x8ca03000
>>                Video Capture Multiplanar
>>                Video Output Multiplanar
>>                Metadata Capture
>>                Metadata Output
>>                Streaming
>>                Extended Pix Format
>>                Device Capabilities
>>        Device Caps      : 0x0c200000
>>                Metadata Output
>>                Streaming
>>                Extended Pix Format
>> Media Driver Info:
>>        Driver name      : neoisp
>>        Model            : neoisp
>>        Serial           :
>>        Bus info         : platform:4ae00000.isp
>>        Media version    : 6.19.0
>>        Hardware revision: 0x00000002 (2)
>>        Driver version   : 6.19.0
>> Interface Info:
>>        ID               : 0x03000016
>>        Type             : V4L Video
>> Entity Info:
>>        ID               : 0x00000014 (20)
>>        Name             : neoisp-params
>>        Function         : V4L2 I/O
>>        Pad 0x01000015   : 0: Source
>>          Link 0x02000018: to remote pad 0x1000004 of entity 'neoisp' (Image Signal Processor): Data, Enabled
>>
>> Required ioctls:
>>        test MC information (see 'Media Driver Info' above): OK
>>        test VIDIOC_QUERYCAP: OK
>>        test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>        test second /dev/video2 open: OK
>>        test VIDIOC_QUERYCAP: OK
>>        test VIDIOC_G/S_PRIORITY: OK
>>        test for unlimited opens: OK
>>
>> Debug ioctls:
>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>        test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>        Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>        test VIDIOC_G/S_PARM: OK (Not Supported)
>>        test VIDIOC_G_FBUF: OK (Not Supported)
>>        test VIDIOC_G_FMT: OK
>>        test VIDIOC_TRY_FMT: OK
>>        test VIDIOC_S_FMT: OK
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>        test Cropping: OK (Not Supported)
>>        test Composing: OK (Not Supported)
>>        test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>        test CREATE_BUFS maximum buffers: OK
>>        test VIDIOC_REMOVE_BUFS: OK
>>        test VIDIOC_EXPBUF: OK
>>        test Requests: OK (Not Supported)
>>
>> Total for neoisp device /dev/video2: 48, Succeeded: 48, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for neoisp device /dev/video3:
>>
>> Driver Info:
>>        Driver name      : neoisp
>>        Card type        : neoisp
>>        Bus info         : platform:4ae00000.isp
>>        Driver version   : 6.19.0
>>        Capabilities     : 0x8ca03000
>>                Video Capture Multiplanar
>>                Video Output Multiplanar
>>                Metadata Capture
>>                Metadata Output
>>                Streaming
>>                Extended Pix Format
>>                Device Capabilities
>>        Device Caps      : 0x04201000
>>                Video Capture Multiplanar
>>                Streaming
>>                Extended Pix Format
>> Media Driver Info:
>>        Driver name      : neoisp
>>        Model            : neoisp
>>        Serial           :
>>        Bus info         : platform:4ae00000.isp
>>        Media version    : 6.19.0
>>        Hardware revision: 0x00000002 (2)
>>        Driver version   : 6.19.0
>> Interface Info:
>>        ID               : 0x0300001c
>>        Type             : V4L Video
>> Entity Info:
>>        ID               : 0x0000001a (26)
>>        Name             : neoisp-frame
>>        Function         : V4L2 I/O
>>        Pad 0x0100001b   : 0: Sink
>>          Link 0x0200001e: from remote pad 0x1000005 of entity 'neoisp' (Image Signal Processor): Data, Enabled
>>
>> Required ioctls:
>>        test MC information (see 'Media Driver Info' above): OK
>>        test VIDIOC_QUERYCAP: OK
>>        test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>        test second /dev/video3 open: OK
>>        test VIDIOC_QUERYCAP: OK
>>        test VIDIOC_G/S_PRIORITY: OK
>>        test for unlimited opens: OK
>>
>> Debug ioctls:
>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>        test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>        Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>        test VIDIOC_G/S_PARM: OK (Not Supported)
>>        test VIDIOC_G_FBUF: OK (Not Supported)
>>        test VIDIOC_G_FMT: OK
>>        test VIDIOC_TRY_FMT: OK
>>        test VIDIOC_S_FMT: OK
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>        test Cropping: OK (Not Supported)
>>        test Composing: OK (Not Supported)
>>        test Scaling: OK
>>
>> Codec ioctls:
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>        test CREATE_BUFS maximum buffers: OK
>>        test VIDIOC_REMOVE_BUFS: OK
>>        test VIDIOC_EXPBUF: OK
>>        test Requests: OK (Not Supported)
>>
>> Total for neoisp device /dev/video3: 48, Succeeded: 48, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for neoisp device /dev/video4:
>>
>> Driver Info:
>>        Driver name      : neoisp
>>        Card type        : neoisp
>>        Bus info         : platform:4ae00000.isp
>>        Driver version   : 6.19.0
>>        Capabilities     : 0x8ca03000
>>                Video Capture Multiplanar
>>                Video Output Multiplanar
>>                Metadata Capture
>>                Metadata Output
>>                Streaming
>>                Extended Pix Format
>>                Device Capabilities
>>        Device Caps      : 0x04201000
>>                Video Capture Multiplanar
>>                Streaming
>>                Extended Pix Format
>> Media Driver Info:
>>        Driver name      : neoisp
>>        Model            : neoisp
>>        Serial           :
>>        Bus info         : platform:4ae00000.isp
>>        Media version    : 6.19.0
>>        Hardware revision: 0x00000002 (2)
>>        Driver version   : 6.19.0
>> Interface Info:
>>        ID               : 0x03000022
>>        Type             : V4L Video
>> Entity Info:
>>        ID               : 0x00000020 (32)
>>        Name             : neoisp-ir
>>        Function         : V4L2 I/O
>>        Pad 0x01000021   : 0: Sink
>>          Link 0x02000024: from remote pad 0x1000006 of entity 'neoisp' (Image Signal Processor): Data
>>
>> Required ioctls:
>>        test MC information (see 'Media Driver Info' above): OK
>>        test VIDIOC_QUERYCAP: OK
>>        test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>        test second /dev/video4 open: OK
>>        test VIDIOC_QUERYCAP: OK
>>        test VIDIOC_G/S_PRIORITY: OK
>>        test for unlimited opens: OK
>>
>> Debug ioctls:
>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>        test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>        Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>        test VIDIOC_G/S_PARM: OK (Not Supported)
>>        test VIDIOC_G_FBUF: OK (Not Supported)
>>        test VIDIOC_G_FMT: OK
>>        test VIDIOC_TRY_FMT: OK
>>        test VIDIOC_S_FMT: OK
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>        test Cropping: OK (Not Supported)
>>        test Composing: OK (Not Supported)
>>        test Scaling: OK
>>
>> Codec ioctls:
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>        test CREATE_BUFS maximum buffers: OK
>>        test VIDIOC_REMOVE_BUFS: OK
>>        test VIDIOC_EXPBUF: OK
>>        test Requests: OK (Not Supported)
>>
>> Total for neoisp device /dev/video4: 48, Succeeded: 48, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for neoisp device /dev/video5:
>>
>> Driver Info:
>>        Driver name      : neoisp
>>        Card type        : neoisp
>>        Bus info         : platform:4ae00000.isp
>>        Driver version   : 6.19.0
>>        Capabilities     : 0x8ca03000
>>                Video Capture Multiplanar
>>                Video Output Multiplanar
>>                Metadata Capture
>>                Metadata Output
>>                Streaming
>>                Extended Pix Format
>>                Device Capabilities
>>        Device Caps      : 0x04a00000
>>                Metadata Capture
>>                Streaming
>>                Extended Pix Format
>> Media Driver Info:
>>        Driver name      : neoisp
>>        Model            : neoisp
>>        Serial           :
>>        Bus info         : platform:4ae00000.isp
>>        Media version    : 6.19.0
>>        Hardware revision: 0x00000002 (2)
>>        Driver version   : 6.19.0
>> Interface Info:
>>        ID               : 0x03000028
>>        Type             : V4L Video
>> Entity Info:
>>        ID               : 0x00000026 (38)
>>        Name             : neoisp-stats
>>        Function         : V4L2 I/O
>>        Pad 0x01000027   : 0: Sink
>>          Link 0x0200002a: from remote pad 0x1000007 of entity 'neoisp' (Image Signal Processor): Data, Enabled
>>
>> Required ioctls:
>>        test MC information (see 'Media Driver Info' above): OK
>>        test VIDIOC_QUERYCAP: OK
>>        test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>        test second /dev/video5 open: OK
>>        test VIDIOC_QUERYCAP: OK
>>        test VIDIOC_G/S_PRIORITY: OK
>>        test for unlimited opens: OK
>>
>> Debug ioctls:
>>        test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>        test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Control ioctls:
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>        test VIDIOC_QUERYCTRL: OK (Not Supported)
>>        test VIDIOC_G/S_CTRL: OK (Not Supported)
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>        Standard Controls: 0 Private Controls: 0
>>
>> Format ioctls:
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>        test VIDIOC_G/S_PARM: OK (Not Supported)
>>        test VIDIOC_G_FBUF: OK (Not Supported)
>>        test VIDIOC_G_FMT: OK
>>        test VIDIOC_TRY_FMT: OK
>>        test VIDIOC_S_FMT: OK
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>        test Cropping: OK (Not Supported)
>>        test Composing: OK (Not Supported)
>>        test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>        test CREATE_BUFS maximum buffers: OK
>>        test VIDIOC_REMOVE_BUFS: OK
>>        test VIDIOC_EXPBUF: OK
>>        test Requests: OK (Not Supported)
>>
>> Total for neoisp device /dev/video5: 48, Succeeded: 48, Failed: 0, Warnings: 0
>> --------------------------------------------------------------------------------
>> Compliance test for neoisp device /dev/v4l-subdev0:
>>
>> Driver Info:
>>        Driver version   : 6.19.0
>>        Capabilities     : 0x00000000
>>        Client Capabilities: 0x0000000000000002
>> interval-uses-which Media Driver Info:
>>        Driver name      : neoisp
>>        Model            : neoisp
>>        Serial           :
>>        Bus info         : platform:4ae00000.isp
>>        Media version    : 6.19.0
>>        Hardware revision: 0x00000002 (2)
>>        Driver version   : 6.19.0
>> Interface Info:
>>        ID               : 0x0300002c
>>        Type             : V4L Sub-Device
>> Entity Info:
>>        ID               : 0x00000001 (1)
>>        Name             : neoisp
>>        Function         : Image Signal Processor
>>        Pad 0x01000002   : 0: Sink
>>          Link 0x0200000c: from remote pad 0x1000009 of entity 'neoisp-input0' (V4L2 I/O): Data, Enabled, Immutable
>>        Pad 0x01000003   : 1: Sink
>>          Link 0x02000012: from remote pad 0x100000f of entity 'neoisp-input1' (V4L2 I/O): Data
>>        Pad 0x01000004   : 2: Sink
>>          Link 0x02000018: from remote pad 0x1000015 of entity 'neoisp-params' (V4L2 I/O): Data, Enabled
>>        Pad 0x01000005   : 3: Source
>>          Link 0x0200001e: to remote pad 0x100001b of entity 'neoisp-frame' (V4L2 I/O): Data, Enabled
>>        Pad 0x01000006   : 4: Source
>>          Link 0x02000024: to remote pad 0x1000021 of entity 'neoisp-ir' (V4L2 I/O): Data
>>        Pad 0x01000007   : 5: Source
>>          Link 0x0200002a: to remote pad 0x1000027 of entity 'neoisp-stats' (V4L2 I/O): Data, Enabled
>>
>> Required ioctls:
>>        test MC information (see 'Media Driver Info' above): OK
>>        test VIDIOC_SUDBEV_QUERYCAP: OK
>>        test invalid ioctls: OK
>>
>> Allow for multiple opens:
>>        test second /dev/v4l-subdev0 open: OK
>>        test VIDIOC_SUBDEV_QUERYCAP: OK
>>        test for unlimited opens: OK
>>
>> Debug ioctls:
>>        test VIDIOC_LOG_STATUS: OK (Not Supported)
>>
>> Input ioctls:
>>        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>        test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>        Inputs: 0 Audio Inputs: 0 Tuners: 0
>>
>> Output ioctls:
>>        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>        Outputs: 0 Audio Outputs: 0 Modulators: 0
>>
>> Input/Output configuration ioctls:
>>        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>        test VIDIOC_G/S_EDID: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 0):
>>        Try Stream 0
>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        Active Stream 0
>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 1):
>>        Try Stream 0
>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        Active Stream 0
>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Sink Pad 2):
>>        Try Stream 0
>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        Active Stream 0
>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 3):
>>        Try Stream 0
>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        Active Stream 0
>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 4):
>>        Try Stream 0
>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        Active Stream 0
>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Sub-Device ioctls (Source Pad 5):
>>        Try Stream 0
>>        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        Active Stream 0
>>        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FMT: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
>>        test Active VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)
>>
>> Control ioctls:
>>        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
>>        test VIDIOC_QUERYCTRL: OK
>>        test VIDIOC_G/S_CTRL: OK
>>        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
>>        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
>>        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>        Standard Controls: 1 Private Controls: 1
>>
>> Format ioctls:
>>        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
>>        test VIDIOC_G/S_PARM: OK (Not Supported)
>>        test VIDIOC_G_FBUF: OK (Not Supported)
>>        test VIDIOC_G_FMT: OK (Not Supported)
>>        test VIDIOC_TRY_FMT: OK (Not Supported)
>>        test VIDIOC_S_FMT: OK (Not Supported)
>>        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>        test Cropping: OK (Not Supported)
>>        test Composing: OK (Not Supported)
>>        test Scaling: OK (Not Supported)
>>
>> Codec ioctls:
>>        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>
>> Buffer ioctls:
>>        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
>>        test CREATE_BUFS maximum buffers: OK
>>        test VIDIOC_REMOVE_BUFS: OK
>>        test VIDIOC_EXPBUF: OK (Not Supported)
>>        test Requests: OK (Not Supported)
>>
>> Total for neoisp device /dev/v4l-subdev0: 88, Succeeded: 88, Failed: 0, Warnings: 0
>>
>> Grand Total for neoisp device /dev/media0: 384, Succeeded: 384, Failed: 0, Warnings: 0
>>
>> ---
>> Antoine Bouyer (11):
>>    media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions
>>    media: v4l2-isp: Add helper function to compute extended stats size
>>    media: Documentation: uapi: Update V4L2 ISP for extensible stats
>>    media: Documentation: Add NXP neoisp driver documentation
>>    dt-bindings: media: Add nxp neoisp support
>>    media: v4l2-ctrls: Add user control base for NXP neoisp controls
>>    media: Add meta formats supported by NXP neoisp driver
>>    media: uapi: Add NXP NEOISP user interface header file
>>    media: platform: Add NXP Neoisp Image Signal Processor
>>    media: platform: neoisp: Add debugfs support
>>    arm64: dts: freescale: imx95: Add NXP neoisp device tree node
>>
>>   .../admin-guide/media/nxp-neoisp-diagram.dot  |   22 +
>>   .../admin-guide/media/nxp-neoisp.dot          |   16 +
>>   .../admin-guide/media/nxp-neoisp.rst          |  189 ++
>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>>   .../devicetree/bindings/media/nxp,neoisp.yaml |   65 +
>>   .../userspace-api/media/v4l/meta-formats.rst  |    1 +
>>   .../media/v4l/metafmt-nxp-neoisp.rst          |  114 +
>>   .../userspace-api/media/v4l/v4l2-isp.rst      |   42 +-
>>   MAINTAINERS                                   |    9 +
>>   .../boot/dts/freescale/imx95-19x19-evk.dts    |    4 +
>>   arch/arm64/boot/dts/freescale/imx95.dtsi      |   11 +
>>   drivers/media/platform/nxp/Kconfig            |    1 +
>>   drivers/media/platform/nxp/Makefile           |    1 +
>>   drivers/media/platform/nxp/neoisp/Kconfig     |   15 +
>>   drivers/media/platform/nxp/neoisp/Makefile    |    8 +
>>   drivers/media/platform/nxp/neoisp/neoisp.h    |  270 ++
>>   .../media/platform/nxp/neoisp/neoisp_ctx.c    | 2798 +++++++++++++++++
>>   .../media/platform/nxp/neoisp/neoisp_ctx.h    |   85 +
>>   .../platform/nxp/neoisp/neoisp_debugfs.c      |  503 +++
>>   .../media/platform/nxp/neoisp/neoisp_fmt.h    |  509 +++
>>   drivers/media/platform/nxp/neoisp/neoisp_hw.h |  577 ++++
>>   .../media/platform/nxp/neoisp/neoisp_main.c   | 1999 ++++++++++++
>>   .../media/platform/nxp/neoisp/neoisp_nodes.h  |   60 +
>>   .../media/platform/nxp/neoisp/neoisp_regs.h   | 2501 +++++++++++++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |    4 +
>>   include/media/v4l2-isp.h                      |   13 +
>>   include/uapi/linux/media/nxp/nxp_neoisp.h     | 1968 ++++++++++++
>>   include/uapi/linux/media/v4l2-isp.h           |   85 +
>>   include/uapi/linux/v4l2-controls.h            |    6 +
>>   include/uapi/linux/videodev2.h                |    6 +
>>   30 files changed, 11880 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/admin-guide/media/nxp-neoisp-diagram.dot
>>   create mode 100644 Documentation/admin-guide/media/nxp-neoisp.dot
>>   create mode 100644 Documentation/admin-guide/media/nxp-neoisp.rst
>>   create mode 100644 Documentation/devicetree/bindings/media/nxp,neoisp.yaml
>>   create mode 100644 Documentation/userspace-api/media/v4l/metafmt-nxp-neoisp.rst
>>   create mode 100644 drivers/media/platform/nxp/neoisp/Kconfig
>>   create mode 100644 drivers/media/platform/nxp/neoisp/Makefile
>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp.h
>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.c
>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_ctx.h
>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_debugfs.c
>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_fmt.h
>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_hw.h
>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_main.c
>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_nodes.h
>>   create mode 100644 drivers/media/platform/nxp/neoisp/neoisp_regs.h
>>   create mode 100644 include/uapi/linux/media/nxp/nxp_neoisp.h
>>
> 


