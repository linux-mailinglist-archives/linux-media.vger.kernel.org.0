Return-Path: <linux-media+bounces-60475-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HPmHPU++mngLAMAu9opvQ
	(envelope-from <linux-media+bounces-60475-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 21:03:17 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AF14D301B
	for <lists+linux-media@lfdr.de>; Tue, 05 May 2026 21:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 230D1301F2AB
	for <lists+linux-media@lfdr.de>; Tue,  5 May 2026 19:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98CF4B8DF6;
	Tue,  5 May 2026 19:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CsQFaBWa"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013063.outbound.protection.outlook.com [40.107.162.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF7D4BC019;
	Tue,  5 May 2026 19:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778007743; cv=fail; b=GeY0e1xdop6JekOKXvE+vbO8CQS4WHgbAUJvNZznD4SbNDHWN+v32CYYpNe6IQpHxULZdqo6JLQPjfI/rHqjSbGcCeDJV+XPw0/usORUiqgKgigfNXpG1QLa5205DXaahEUfF63Sym+EyqEB3IYE8K2EuacoPDUjOasrlpRtqXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778007743; c=relaxed/simple;
	bh=v4M3bQtRf+cRNXhpFq8ixUM0dDaA8x8oRn+9NxFIK0A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=cLt9zaHfSTa088nz0zy/D1L2BhgFnjNHLfRcCjnVSkmPvendxyzeSWoGZ3NpMZl/edCMkJdhAXxU+d/XPwkIYcpKJMnDsjjVMakSS8Weaxy7iyz5XQwjMxl7rs04Iuyk0GAwG2g3r3bb45FZzbgiETcYoRXg++AGn8e8kpGQUrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CsQFaBWa; arc=fail smtp.client-ip=40.107.162.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAD0wTxjB0RZduy61UUe4efQl4+DSoHQVWLqlbt2EmeEAlSxGmoEd5FdclPPtbvI/7FCVG7sfYpqbkU1wO5EU/s1LayPlkI/vZuHW6qwPfiVrPO/Wzr2KCZfZJKOgqO7Wjk73FzrloMGV7ZYwZXX3FOzu11DGveH9H3MIK5291FuoViRvmr6tPjG1oBc+v0fW+4JFFYcTD4lbNpY8M7C6gVjL5pUMsoaOU3VIByg4wheYZFccLrdpr2PE+5i8knRyabOxKa3QvGEzXJjB2uC7/Eb8RCQEk15mD+mmGqdV3tnGRMBFfbVKlto7I59O8HCpCiNDOO0k58lBwlMWeQP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOUWfjlkOsaNQYoUBg0TDJwJFchZ2pp2aMyYP/ZANyo=;
 b=vTmMFq4MOMORW7ghoym//p3apwWtsCYJonTv3/h00dvF+g74GPiAr+Ik0cxMj6Ofg0u/zcJRLjpNRgJr4okTDTAIC/ZU/9m8mssQ5r5OhQUhWarXKsJGcxWPPwDI4UXSiAI/Z+CqK6fK7nJB68nxQF2R4Sum4INO2aZxKQpvxwzlyBWUMhYl3/cYHvi3mkehhiVTj2hoCqdw85zwB9d27KdnNuyLn8cDPrZCLxQ15Hbc52TLxa3p1XHsl7iVTDtCycPNPxTxp+WmjdFXrv+9hfeTvdgFwQh9eDgCUPTpD9paS+F9YzbCtdtPYvmHt+pFDGn1vGbOObIzPa5mvWdL3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOUWfjlkOsaNQYoUBg0TDJwJFchZ2pp2aMyYP/ZANyo=;
 b=CsQFaBWa5TJYxe6g+4UWvIIJYVg94FLD6vnCqBM5KzN9heKuHoR4tfsSc7jHaAvNKPcjbwzrvNrmaKHLoIvjeSH1GNMCAxauXp3VVc5WpOtZa+D461RHNwtTSRqdDHGRRi2WTSziopPSxDo2u75W5Hs8oGa9khtB33bekQpdHhq/NWMKTq4GTM84+rJYJGabIjV2MuXjrAm/VUmekgt6iuXerttar2Gl+4ZTGMf+BJS+CAvE5avzqvN1TIeAns7e80vJec/N7XNxD+LRkkrxYhAJ27M8jUzLzXbNkusGbSDdd7Sz2XUcq9sF4Sl7tTpWtXK77ZMT/SWuY6bgWerjtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB10793.eurprd04.prod.outlook.com (2603:10a6:102:485::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 19:02:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 19:02:16 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 guoniu.zhou@oss.nxp.com
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260327071105.4110282-1-guoniu.zhou@oss.nxp.com>
References: <20260327071105.4110282-1-guoniu.zhou@oss.nxp.com>
Subject: Re: [PATCH v11] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Message-Id: <177800773265.1882445.831215531012139487.b4-ty@nxp.com>
Date: Tue, 05 May 2026 15:02:12 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: PH8PR21CA0002.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::16) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB10793:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbc7175-64f6-4269-d25f-08deaad8d318
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|56012099003|921020|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 hMOuFMKvektT2rEWIDhUCAx/VGxXw29twhPYcGdrFt7Bh4zaQ/UCje92Lv2mmdOCv7j0O/ZQmhyVHyqH3X85fIvuqiuobZ1wwPfawmajlYKYufxkL8/DOxp1TpqH9aN6Cf7CsSUup6JwFdWKYc2YD6yYO2NBgoFvjrYlPt5ev0B7GqkRN1ShIJqVTr3Q4j4z0lTSWAz7EWivKDSfqIigJedVpLmUrTEs0C38CU7LdnJlq4cDuNgs0/uaFd92h+GHnCeKG13a62e8jhISe2wIZWTwkj/I7iUibSDtZU0WcfD863DJ7TFM0fR9QpicUv/xTRriz8jTVvlWWIGa/XKK65IvyQsizse5ZjuMHYgHxUmV1mL4454TlXq9TsE+6iqem0//aqE+nDcV2Km7CVutRCXTkEAm2TwlBHX9+uKhsSDRQZzXIsy6pkQtLd0k4Z3RSijIwd+toONK6nHiJ9Tg292JdyT+xezkEnbJvH0l7ThntNl4g7y/mleIUeZtQToKi+eDcBMQpST2TvX7qNexovk7pycXkBT7bRWTqgEW0yWCu3tmg6XNxDY/5Ric9cwLf+Pumxg8WioAUSmWaBbMa61EAsBdJ4DQtf1YcJCGwoTru14zrfHeouCqjgVMABV4vBIlHTNyF1SvaKH0Hhe0vs88BeA7rrXLHbFQyH6nt4K6m63ulMim6UQl5MLGi7SfInmflLv0wAZ2JFS/L5EHoxfCakn94oqsBT9UbXhf/R51+qrr5JgnGapY9TD2ehrWZaV1d+uO+BvLZ8+bzZuYGg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(56012099003)(921020)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MFZ4LzZqZzF1aldEOHlrWnpZc0E5bWh1bzUveFMrZFRsanQ4OTRxZGZHS3FP?=
 =?utf-8?B?ZlhsNUhQdnJXTmprc1lXcEFOd3dmNVRlSXptZFh6ajdMSFBRcGpGUTdGRzJi?=
 =?utf-8?B?TGl4cFNoWFltdmtpZmRpV0xUZmhCdS9LTmdHRGUvcUNjS3dlQ1BSOUVLTjZ5?=
 =?utf-8?B?TjgxZkdHRGQ1Sk5JNDJDTTl4SjU3L1JpaWx6RjA2TmMvK04zMVdXM0ZGV0lO?=
 =?utf-8?B?NDFtZUlmZE1raTFteURycU9wazNvUWR1N3k1ZW1uYzBVMWZ3RjN1N3FMbGZC?=
 =?utf-8?B?aEM4aEJiTUdmNEgrOHhKeXFqV3V5TC92QVpjamhZbzIyZU5tM0U0RUFlSHo1?=
 =?utf-8?B?RTBWR1MzbUFOdnVWTkxuYXR4UUhxT0xicDhiUjc5L1pFR1JsUUZNYVFHUWhJ?=
 =?utf-8?B?QitXZkZSMEZrTG1aTklPSS9oa0xDMGJvakdINTVPVVlTU1Nia1V0N1I3bkhL?=
 =?utf-8?B?UWE3QmtlN0dFVnI1RnlHWDRGZ1JqcGNTZ3A3dmsxTGxzM2RIbFJaZnNwZmZq?=
 =?utf-8?B?SVVLWjdyeEN4Mk1sdEI3N0c5dldFQklPa2hhUzFtYUNkOWI1Y2liby9jb3Jo?=
 =?utf-8?B?UmVLL0JMVUFmK2NZdEtvTkp2bUNtYi9mMGhINjJHbDQ3NmRoaWNpeWM5VDAx?=
 =?utf-8?B?QldSU09IWkQwT3Bhb0VJU2VIMkYvUUMrZExNNll3VnFzZlVxMzBvNEVhdXcr?=
 =?utf-8?B?dHBrVE50bkpsc1lITlB3RXVzQmdsakV1ZkNUaGlXMFBvbkNUNnRZV2E4RDBa?=
 =?utf-8?B?eUNMMTQyVTBxalJsVTRnazh1TjEwS2FXR1BxT3FNUXIxWXhjY2oycUFScWx2?=
 =?utf-8?B?RWtWdGV3YVdPdFJiK3RxU01Yay9mS3JnQUJ0bnpsQnUrVEJZMW9kNzNSZ3BL?=
 =?utf-8?B?S2JxUmgzTk0yQ25PUnBWS1d4K2RjbW9sKzEyTSt0WXgvaWlscThHTGJFWnBx?=
 =?utf-8?B?eU51azB4WmFjWGRkOXVkRDdjNFpaRW10QjNkV2RSTTRmVG1YLzVqZlMyMmdH?=
 =?utf-8?B?N0VUMjhxeXBKT2xiWWY4dzduK1pka21IKzQ1M2daWGVFZWpHRktrNkswM3pF?=
 =?utf-8?B?WXpUb29iN1ZjMExRT1pLRVNuQjMwbE1UNzhBaTBWN2dEUC91Z1JvVThQK25l?=
 =?utf-8?B?eUFNSGI1Q0lRMWRGQmNxNEZQVDExdjl4R0ZmeENDb21wMWpCRnhsU0tmWHBZ?=
 =?utf-8?B?OWxqQkU0cExFdlordVIrb3F5c3Q5eFlRTXVtb3l3Ymo5Z1V3aHB0Z2h3VHFl?=
 =?utf-8?B?N0RYUk5aWlhKV0pzRnhxMDJCampFN3pQMklYditIYkdqNmdES1FiUUtnRlVJ?=
 =?utf-8?B?QS9oMm5FT3pmV3hRaHlZQkhTaDVxanQ1Q0crcVpRUUNNTS9peGtNRjZBLzQ2?=
 =?utf-8?B?bE5KK2NuRG9lOVpPYUJrSi96U2QxaXdKYW9sMHFYcUVScm10cS85c3JiN2FW?=
 =?utf-8?B?ZVpobi9vNWdvVTUzQ0VwL1RtOU5sV0ZNb09rYWcraUE4WVE4UXF2YTJDeHNO?=
 =?utf-8?B?bXJSZEJDSm1ISFI2ZWRzR0Z4d3BmK3V0Q25uRWxPVTZCaFR2TEd1K3Rib09L?=
 =?utf-8?B?V2hCYndDWVhrTDRDMGZIdlNRdnBFNVFhNHdNVDNLVEphTXZvNFVPcHM5NU5B?=
 =?utf-8?B?b29qYUJRZGtlRW9LeDZsSExIVTVqVGFWQmxJb0pvaHQwSG50cy81dXNqR1hO?=
 =?utf-8?B?UXRiQzJYU1JMU3N2QnVDam1UeUkxL1VVbWVxS2ZaeGNYdGF6ajlZQmc0aDNX?=
 =?utf-8?B?cDVXWUQvTVBIYnVIKzlHN0RuenY0RUlOQjVBYllXOVNMMnViL1hHdFU2ZVAw?=
 =?utf-8?B?Zm1kWXJnNkpXYzFTSjcyc0lQVFpsUkFva1ZKZVVKSmFnUlNEYmFuYmRFcXZS?=
 =?utf-8?B?dWxjLzlpdjhwbjZqQVMxUmE3aXBFV1pIZlJrYkJ2TGlQY0VJcU5iSzZzVnR5?=
 =?utf-8?B?MjM2a3ozS3picDBTN3U4UWtmK0RoM3piMUh0VVFKL2pNa2o2VjJyZEI4NXRE?=
 =?utf-8?B?OWNnZG5kOVF1emZBWEdORzBMd3plaDJZMlNJb1Y3TURFMzFhbXZQK3JnWGFz?=
 =?utf-8?B?VHgreGJqeVRJR0xtQWtWdnYxL2tRZm5pR3VLcEFQbmFmRFN1eHdJb2tjaFVp?=
 =?utf-8?B?cTNSZ29OaEFlQ1lsd1JXemsvY0NYcHpqaFdRU2JiazJNS2ZXbjFkVExvWFQr?=
 =?utf-8?B?SHBYMnZHbnYvUjZ5QWZmSFBrTDkxOXh6VkprcWdsVEN5ajI2VDRwN0FNRzda?=
 =?utf-8?B?VWVZNXRzdzFLcUJndE1hZzAxM0dYTUx1eWN4Qm1LNDZYaGJJOGpXaEE3a2NL?=
 =?utf-8?Q?zakg7kLilD98gvgjex?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbc7175-64f6-4269-d25f-08deaad8d318
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 19:02:16.6835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6sgQq0yFplludfylzGEmwix4vzoZjdtCfqmFsCN3MKUZEMq/bGRBOha8SXIIRIfhtqOXJp2VZQtElJ4eBs6t+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10793
X-Rspamd-Queue-Id: 73AF14D301B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60475-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com,posteo.de,puri.sm,kernel.org,pengutronix.de,oss.nxp.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[]


On Fri, 27 Mar 2026 15:11:05 +0800, guoniu.zhou@oss.nxp.com wrote:
> The CSI-2 in the i.MX8ULP is almost identical to the version present
> in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
> nodes and mark them as disabled by default since capture is dependent
> on an attached camera.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx8ulp: Add CSI and ISI Nodes
      commit: dad7f95a1529f7a2b563d3e052968a0fc174b8e1

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>


