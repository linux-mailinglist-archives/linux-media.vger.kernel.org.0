Return-Path: <linux-media+bounces-52039-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNitDW3GgGl3AgMAu9opvQ
	(envelope-from <linux-media+bounces-52039-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:44:45 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A275ACE650
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 16:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8D3D3019141
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 15:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF3E37BE8E;
	Mon,  2 Feb 2026 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZahW73Od"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D6237756E;
	Mon,  2 Feb 2026 15:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770047001; cv=fail; b=Soa+ZapNaSkRirKe3PqjRLMH/8gAtiuBgsp/NJ5mg8bXDYOmXx0C+gNLTbNA5uoCmUNhTXI+kb8ahCg0nfweMJ4+rPM6FE1yaDRfO1lWk1wSVdx5CbN3ysBZwdHngWigJRXYYTVqHj8uJwtvvxW8w/cufhLiGLkMCsMkJUZx+M4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770047001; c=relaxed/simple;
	bh=sLB6kSLVW2MKTJtEWZR7TLAnBk1ZeeQnuJmjTX7HH5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=SRgIMCTYvLMbkkBNyYy2IxcAyH2R0BOm1efMr3FDNoISmvr0d6d0Gr0A5B7HrLn4ZtmbEBEs7ZeWmQHTP+J0LkRkrR/aNlc6bpjggbgAGynCizUn9cN2DUBcMwp655hnXmahFnqGcH/Vw+ROBv2dkYXNsKGvJL47cfbWfmhatBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZahW73Od; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuNaZrd6DR/zelO0wefSQCKGTopite1zoqXBeiFXBwOPTjvOlLiJ7L7Lgsvvpy5Hwf7MGc1YuHAixTemQmvnUnF2h4VkFdJO8cp+h9mEDqs5p29ccUCmO1ieHcDvljd9M/G9ORNxYKQ2/BBhOFUkqYKs5dyCUHFzxfREGksYxUu2dnN9KbUKnpU6Lpoq0aQcgUH2pLM7KEJRcYz/uodb0WFuS9gX3P41YzNFSodZzAeIpB7fPq4W02zFqYO+ESnMhliBapFFwsUUx+5mn4Bk8Ipvcp9+woIwAqUHE4u+8PUHJVQ12IdqmH6f/xdIA2QSREjV+jKBbcaTGjy753entQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SqsQX8wYPsHwEKRjBxPhBthtuQwbsRyvt9UCyKYg3/c=;
 b=gx4QShDX9iRN1HPytmOhV8R6Rjh33N61kEkdQvd/BdCalY8JhihRPgUf6tjlxV3VJcGr1emX8g3g91PoSx5CosmDIjnf7NeyjqJrOiZBjgHRYu6HpBfXXlhWY2H9F/zJD3WoN3OZIimFfKw4xdBPP3PG5HYn27iDLDhUaGE6IGEWI/UNzIyo54H1axX5qOUaJHbKB8DP7SK6U8OUXFM8ZJUWz4Dteb328PImI9nPYXsoZtGLjc2dpbH5KdheyJGdjGtEKSsaKNXIP0n+G/Y3mHbqQm+sFVU+sGjA/57N9kDy1ijxeyX5FNHgeu67yl/pyT11RgjO5fhNMuf7oMD7Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SqsQX8wYPsHwEKRjBxPhBthtuQwbsRyvt9UCyKYg3/c=;
 b=ZahW73Odw8WEk3gvUv2uJq7HmG+7jgN9cA+vbdWk1l+vOeiIceHS/vUUHnQyMPFEu5ScUNusQh4G5kqbnxvQWFiDK+blMFr0Jv0E5zzVGQu9ASm6LROOjoE8AMnAdGVV+M9vU496LipU5OhK+iHaxWjTeUZCyGAFOxz4jggzWx0NH1HVWv/wg7aAFblv/HhdflUzXrU1lWsCyRRIEJggFs+V0XbDI2ske3ZL/46TBfrl8H3f3mZGi0aK1bd9RBZMRencTrf9t5AxwwGpqPKTW9HvKwBfz6XgPUA+evG08PtPy6eR017UAvf3KK5VBI2HKtIgVp8ua2DP7NgaqK1G2Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8835.eurprd04.prod.outlook.com (2603:10a6:20b:42e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 15:43:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 15:43:17 +0000
Date: Mon, 2 Feb 2026 10:43:08 -0500
From: Frank Li <Frank.li@nxp.com>
To: ming.qian@oss.nxp.com
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com, nicolas@ndufresne.ca,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, xiahong.bao@nxp.com, eagle.zhou@nxp.com,
	linux-imx@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] media: imx-jpeg: Simplify descriptor
 initialization with memset
Message-ID: <aYDGDJyM7TijvaHy@lizhi-Precision-Tower-5810>
References: <20260202095843.1030-1-ming.qian@oss.nxp.com>
 <20260202095843.1030-2-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260202095843.1030-2-ming.qian@oss.nxp.com>
X-ClientProxiedBy: PH7P220CA0177.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8835:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d549ceb-913d-4e39-f678-08de6271c8b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?htypR5ZbP2Anx1IFPEV2Muw631RVZkslta9Vu/nHun0jAZSWVQ1Ck6CsfoK/?=
 =?us-ascii?Q?MAMGjm++iIcK2Ra0AR1hxP8f26DvSPnxdXIwY6dhittrW1JXIPQE9TxAMU/H?=
 =?us-ascii?Q?uufq4Q71qfLf6g+7C2ZXZrY4TCeOhKGKwqRf3QIy2j24MzRes1pEHRXHPp/c?=
 =?us-ascii?Q?XRo4b8nVfovXEDN5/LZ8SrLFv/zqdywpqQa2ZYBCACPLUzEVCrGNqz3Pclj3?=
 =?us-ascii?Q?d0nTY1HHAbgO7Q3+ZVNlIhplImyCiWLaOp201aWLnrHJgSHxj/TuA5YE5fhc?=
 =?us-ascii?Q?Uz8nBBPsWsEDVVD+XNa7ELnToYUPOCOVPQ5BZVjIq/VzaAwf+/sAaKSQBoan?=
 =?us-ascii?Q?Dwm0zRD/UN3s5kS346xoOxLaI0u76DGNVlPyEb6QWU4Opsus8V2V8ueJ9rXS?=
 =?us-ascii?Q?fSxtKp9i58RvPYQ5N0D8QpzU1+JWsp749CILrZCTkLP0rD+EPcmHH8dShvXk?=
 =?us-ascii?Q?mIOktrakwMXOj4Zrm9NsnxzJwvnn1Lux7QRP9VZJ+EzE25cnJ7KEfu2qA68C?=
 =?us-ascii?Q?OCeTrDRZesOZrHRIfRmUQecfo/YHBPe7vst07fpIplYNRWnoiGHQrKIFCCH2?=
 =?us-ascii?Q?Z1fRk24C9SjL/uJSC1ZcgijYMZDbfNU8iPDtPvJb/YlmlROHHXgsv4nl05ou?=
 =?us-ascii?Q?EBbbx4XQbska49X9hEOgMmeMUU1anqAEeWkCGLjmfU/IRNAN3bJbGbli8Z8l?=
 =?us-ascii?Q?lANXg/MbzpeNCGbKH9vnRlAF59UoRqly25eOKzFPs8jK6TuUJfsIoy52aCBf?=
 =?us-ascii?Q?xMW5qeJweeEhNuvtF5ZRqi5g95HOJsl7KFbkw7LZ3R6cztVct/+6AbtTw+rP?=
 =?us-ascii?Q?p7VhpnGSikd6iBmlX2f/uUX4V0VB1QpG3voYCesu/5Gon0PrzK9qf1JkrT8g?=
 =?us-ascii?Q?TrQD/Eksru+Kap33sCY4AMkG67qGwj/fLMu5LulGjJq+Lw6LdJyV6Fl062k3?=
 =?us-ascii?Q?svcIciZ2mKVsO3Zk3f/XXkIpiGaebw0pE9jT6XbEUs2r7un1v73kpaE/ayVQ?=
 =?us-ascii?Q?3rIyM45bR9HIPXvPvd1eLpSINOsEmlmyjrRiiNzSHvyE1rmM+cOvvbRL6WXu?=
 =?us-ascii?Q?DUuNvO7xGmiZbjvFXyav3jonwN//gPH+7Gl0vmUj8Mwc5y54x6ceizUZyVn0?=
 =?us-ascii?Q?GK3YyCSqszRwRqLc0cAeLPffIYBog9TP7r9vmxFf9ynSNYDyXYA+8YeddKv8?=
 =?us-ascii?Q?WMB1yBPDhtpkY2TfMnqSsZG2FrPDiJA6hS0uBt1ZvzJ+OSsonpfK7V/noR/t?=
 =?us-ascii?Q?oKZRQRY9ZbWCA/Rx0pxDgqOjuYCCPJDqOTMOA8hJsxo84749zCObHOjCe/VA?=
 =?us-ascii?Q?Ue3uuCeL0mGyAm4P0B8eXrHdpmbrDR/p7yRPNYHlcGmHydQvlgHdJU8PZ3cs?=
 =?us-ascii?Q?D5q676pV1oSlpOhsUlM9nB+BBxbB+kCaU84XrOIJgMQy6ejy33wpyGyAaM06?=
 =?us-ascii?Q?f3VY9vFga4+iEj+ALVSYJDHiTFw1b+B/GEwF+Gtv01u82LqiX/8zfIBaHIro?=
 =?us-ascii?Q?M0Dxl+GrlDlxNUdxwWki6glGzUeMBd0a2yTpndlp49BqhMHjK4G7JKgsN3C3?=
 =?us-ascii?Q?+CBk4ILKWe26wkXtC02tE6Oq+huozT+m3uWLWxgyZa66YoZmIUDsYkDSFuC/?=
 =?us-ascii?Q?KIHVabifmm0R9cev0UeWQno=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zsv7GQ6TZye46/9w43Tw9MEtUcjZHxAmBR5bagDTnE1TJWRnmukijNwgbDMy?=
 =?us-ascii?Q?1iOLQM0wxr+MMDGhYuRuV2+pCJL5VoaXs1Gh3egnYLFZYTrg8A+djaNZobu5?=
 =?us-ascii?Q?nISHo9OeYVNKbp5LreyKHQqX+SjNrYSDqQQmC81VsJeCxTk/vduh7whUT+ql?=
 =?us-ascii?Q?RzjQiebAPTuCqYacwMSosa0OwuxK8ZwS5MUTUf73FOOK3FJABkrFF6kxDKdn?=
 =?us-ascii?Q?A2ZpF4dqWAKEB1O10Vekya6FfNObrVeZfPKfdbz8BX0jO+uIY6iB9erTKzlc?=
 =?us-ascii?Q?MTN/RghM111K4njFTT0AQZ9btbFzTGmq5j5b5YNUaHQjrBrk/Y8s/ObnbMiU?=
 =?us-ascii?Q?SvbGQUIXSOi81ycLXXbKOXHu6jWk1pIzArfxpjCnJQhFjvKiNao5ZYrHgqOI?=
 =?us-ascii?Q?1UFIYzyT8ecbPl6uiZYOi7uP70UA7YdwjUGh3Ii5F0UcLEGWJxxDtQDLIEeA?=
 =?us-ascii?Q?UsOIEvxLPamaMhq7uPWR0FO82CQFvSworyDlgEd8RvDk09efSFQkWnqG9pyP?=
 =?us-ascii?Q?cMVvX69srWsfOKx+ZfQWRE4jsjFZntIjT+OjRWAQzFa6gVysnVmkLsn6SrC4?=
 =?us-ascii?Q?4jSCQi/qkCL/z212jH+Otrue54xGkEg4VjfoSNt8Dk0NjFMFsLgtDTgPrHq6?=
 =?us-ascii?Q?pCHUJfTVR+X3iVTjtINLju6jxp0xZAKSXodGz3KSNrmgjuOvPC3VCVmAQANZ?=
 =?us-ascii?Q?xNe3jD/+wIXM0lvqA6jQxf1IiEQngYnNcc65pCPh717ufWuU7k3z99Cc5WdG?=
 =?us-ascii?Q?a2WJI0XhHvND/G2kq2RD9lQiuSnQr3sPZoV9YsMH0FlSrTkhYgKv1cvvT7iY?=
 =?us-ascii?Q?NuwQb1N1MZgXr84iPXQIlqnR4stUray4NwoQfoVKm0W3VhK4Q2x/EF2+eBqR?=
 =?us-ascii?Q?82ATu0SFFmM8GKAk9aZsse/1+l3K0d2FV9JoVp6diDqEnzCYTaO9nPFeHR7B?=
 =?us-ascii?Q?AczC2CukjyNOQlDWAA1fMbl/OUlV2Uqh+s0ukP48/x9M5Hkq9V9Nm1mYcyc1?=
 =?us-ascii?Q?RqgOiE2S7x0e7oGDpPQMGHHqNgDeztzIq8MGzE4B9fP25Ti+K9RkIASuoIHt?=
 =?us-ascii?Q?kjxe++/SVcvVW6CkVvB35TFxGrydrW6D5x56YLsWb9NxMFSli29AakQq0/CJ?=
 =?us-ascii?Q?bBOzntFW24Nj2BtpelvayTsr13QlMUB+FRtHBIT3i8cp2PEA1CmFG2xSLOhT?=
 =?us-ascii?Q?Lvp5yPDoZxMGGXb08Eye+mpDg7Qez4zZ0xg/EE64cvBz8elPdJEMBYw+w08A?=
 =?us-ascii?Q?PHuxPidO+Coa7xHuPCQ2LK3SxXQmJQrv4pGn2lcqKl50IkTozhPeRDeMjxQQ?=
 =?us-ascii?Q?Wl/DXYsJDMQWLLaFWPsqrut1+SKu+ltdTjy1nLt0bduNe6D+9UtSwXuaA3p/?=
 =?us-ascii?Q?nYgXz2Ci601DWT4oEmMAIsq0UHLhPSMFwr5/aL56tODtdY/PAtQ/uqrzNPrj?=
 =?us-ascii?Q?QS5Euhu27iVavqqKTcMF8QJa6MNF/yZU222W3WP8QV7EB5luAmZXOBsOoaqS?=
 =?us-ascii?Q?xmw3AJbKhDK/hmbuVzR0r8KbD6Wj5k72kat1BegQ7wsMmSHLBrOveTv86COD?=
 =?us-ascii?Q?dokHrirXWx8DGN4JGfDpOwJXf7OFzh3TXMCl+Vj0GZUbXwSLMxKfNURT7MkU?=
 =?us-ascii?Q?kjbTG66WgybSbg3/IDvKOH7UFy3AY9abB4klKoFG1kk+Vue12FoaqLSr+QVK?=
 =?us-ascii?Q?gLF5agyUoIa9Nvegc62jGSFOtKJoZi8RCSA7Ahq+8mfplGRl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d549ceb-913d-4e39-f678-08de6271c8b9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 15:43:17.2971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRwHIiHrF+HpK6JNdV6QbVLEoCxGBvGVOpIeUCM/erAPEAMdwcXyM0fMM5wscdfaCqX4q1jQpBMQ/jpSz7dp3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8835
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,oss.nxp.com,ndufresne.ca,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-52039-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[nxp.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A275ACE650
X-Rspamd-Action: no action

On Mon, Feb 02, 2026 at 05:58:34PM +0800, ming.qian@oss.nxp.com wrote:
> From: Ming Qian <ming.qian@oss.nxp.com>
>
> Use memset() to zero-initialize desc and cfg_desc structures instead of
> assigning individual fields to zero. This is cleaner and ensures all
> descriptor fields are properly initialized.
>
> No functional change.
>
> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index b558700d1d96..39022c1bf36d 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1338,6 +1338,8 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>
>  	q_data = mxc_jpeg_get_q_data(ctx, src_buf->vb2_queue->type);
>
> +	memset(desc, 0, sizeof(struct mxc_jpeg_desc));
> +	memset(cfg_desc, 0, sizeof(struct mxc_jpeg_desc));
>  	jpeg->slot_data.cfg_stream_size =
>  			mxc_jpeg_setup_cfg_stream(cfg_stream_vaddr,
>  						  q_data->fmt->fourcc,
> @@ -1348,11 +1350,6 @@ static void mxc_jpeg_config_enc_desc(struct vb2_buffer *out_buf,
>  	cfg_desc->next_descpt_ptr = desc_handle | MXC_NXT_DESCPT_EN;
>
>  	cfg_desc->buf_base0 = jpeg->slot_data.cfg_stream_handle;
> -	cfg_desc->buf_base1 = 0;
> -	cfg_desc->line_pitch = 0;
> -	cfg_desc->stm_bufbase = 0; /* no output expected */
> -	cfg_desc->stm_bufsize = 0x0;
> -	cfg_desc->imgsize = 0;
>  	cfg_desc->stm_ctrl = STM_CTRL_CONFIG_MOD(1);
>  	cfg_desc->stm_ctrl |= STM_CTRL_BITBUF_PTR_CLR(1);
>
> --
> 2.52.0
>

