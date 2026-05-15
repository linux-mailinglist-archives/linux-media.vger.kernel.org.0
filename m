Return-Path: <linux-media+bounces-61726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMbGDm0rB2ppsQIAu9opvQ
	(envelope-from <linux-media+bounces-61726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 16:19:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73D551412
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 16:19:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9728E305B600
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2026 14:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C52338F95A;
	Fri, 15 May 2026 14:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jQltW++i"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62932481654;
	Fri, 15 May 2026 14:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778853838; cv=fail; b=P9mDbdhXASy4EUHyx26+FJhV3sMTaizcwtVGr79cAo8T5Pbm+bmPkZgg24p5er9nYGV3KHoqk/+WfU4MiyhGC5QYUG37FkqJtR5JBZ7vhB7SLpoxN63cIPXGyi5fyhb1maZbFHm2z2Z0ePbMRYIra7uR5pbwxKVK/Q5IzBwjnMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778853838; c=relaxed/simple;
	bh=L8uc6eTCKMuBXbG4IHZiV4208UXLLyMCmbveesvaKEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IJTneQqNRYhyrPiv+xZvPAwqLKdOmqWmrkbs8sAMXw5GZXh1WUnst4Z9LoH9q/vBQN9WWs6qyen98ScSJFdEqmooiHymTVTh4e5YN2mzKkCefcK0CHyxy/ve04H/1ZpHpC41ZdzPTO0o+P6uog69lDx71GQOL6GXHdbxA8qcMVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jQltW++i; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nLyfyQNI97gTAiaiuQ7zNxYghYQBIPjZDuN8rH6/w0PnxBHVFRoDDJE9R0tVWwaUNG7hbRvd9uULndOJWSsskClulgg18LDnSUqt/AmtRpbzRxzSlZrpzAqoE+ftVQu343pRlgtxffkqmgehvrT0xfy7XbtJ5YN54ppMOeh8JOmCzkg3QN4iye5XHeEsPKkb/gtjWzl4BYQvPZYSZnnYMWk2ncNIPepzVyCL+wkM1XQ/dE5s7pI2BLY5Nk0NtczLqVEzKcbwfGW3O7I0nnGhMOn1krC3Y5oMYpsCl0pMPNld/mpQ2WSh5hh6uJ6tFvVOPNBsIAgh4J3AHGgSMN5/2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVeeudMi8BMTNbbOOSSCacW9qH2Lk6W6EeVsJkCdgXg=;
 b=Lvd3ADWGEKDACyETVHBa0zzq4H3nfyYlSU0k147NjUf6sNmzEzARJQkf2QraskP/PjLxx/tOLWB7jlpvNmD+5I5C7URkg/kcTGyuCTX+OvXX/4W3CLXf5tfJNO5q0KrQ0XeyirdopGOMdLX+JMreBcp4cAracjA0A9qMO28lUcbW936FCH/nBM9PpfvqmsOe91ZkdBry0vkXhEFBmbOAAE5D2PuB4FBU1Y7o1ilTuyqOm/gihe2iWSKR6ToucA2Z3a3Es2muEvIHcJx7nMmN6LBfuRo9hCgRQspWAGnw0brE6eHEZV74s+bLxyiG212EhE0w2K7P4KFND7znL9DVDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVeeudMi8BMTNbbOOSSCacW9qH2Lk6W6EeVsJkCdgXg=;
 b=jQltW++iUAJzHp/gViWMN2/3GJMnQMEDTKq6oCLkCE/v+gvHS3G4RdhXbIbj84ha2rDP9Rwa1hgqtL+mz9ebkV0JVutS2IJEApvmYhg4Oct6Oz6eTZNVMBrkY7/ugM7AXEFMoD4Y7aSAwnQ2y4ocym5MP0awZd3DanXqdN50g0/YiSSZl7tx2uVnVYIERj04d18P854NR2amlOFcwDt7oIDFvQXQv/g5u03mze9BXEw3cI6yv8rFV7+XPPu62g8Io6U2e6UQ/WQo2AaPRZK0CNWbqwU+RsDjnpKnnUYYnPvgpFBb5EvaMOCZrB96szgXbgDdQ3+JhoJEeoYiYsHXtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10945.eurprd04.prod.outlook.com (2603:10a6:150:21e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 14:03:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 14:03:50 +0000
Date: Fri, 15 May 2026 10:03:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	"open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)" <linux-media@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/1] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Message-ID: <agcnwPv2n8sWdGvC@lizhi-Precision-Tower-5810>
References: <20260514183357.3088564-1-Frank.Li@nxp.com>
 <agbqLmzZ5p33N18o@kekkonen.localdomain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agbqLmzZ5p33N18o@kekkonen.localdomain>
X-ClientProxiedBy: SA1P222CA0080.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:35e::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10945:EE_
X-MS-Office365-Filtering-Correlation-Id: f2567dcb-7929-4f2b-a7a7-08deb28aca7b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|19092799006|52116014|1800799024|376014|38350700014|4143699003|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 qoIAvBW2Hw5Q9Z86R/7LYNzmxf1FRUiM1Kic2xmh4YPuNM28pNwA+7eVem6tAmB3D+g8oIEyzShqFKdKu0iC+1ImEuQpQ2z2XNNJzAL90/MQMuYUQ5IP6Mhyzf5i3gEcdxGjLdaNfMzYbdkce2s5rr52dskicHnppkxI9IFLzODITit0wICe4LzCCY8Pb8rWaLRboIuBerczqz5xfr11QGVZDMBJ6EkynjY4Gd/iPOoYO5ZIob/0oZuTxspFLOoTXCNS7E+WppKs8oqA4o945ZvGSC1fichCM7yuC8+IA5bEcsO1mjMxbrs9BTkBjvtg8dNM/kafmO/nKdjqNm1U8fSLbjeDosUbI3tOkstB/6UWWY/jbKdJxvJ7fziJ6V7kWCN8lLettXgJzRAtgn8i5nVkMThhluOG9jit+wWPBk4Mq+Xwf7zfoxQZVHcKnbfnGzvEvJfssC2OP8PVITDAK4tXv5zF/lv3dNPXnRO0p1VA+pBi7nykzLvQxbPMj+7/jd63IpghkLAUGSU7fT0OQ8oWLELGPbpKYYkY835ULGSplVcL50WbBjGb/8AhDbmG8Ti1JzPk6+XAqOxOJoIvIJ+lhngB0AVvfoNapICEoQCmhrsMrfn2jepf27uZujAzJBIs1X5MSIG7xeVpM1IA1/dRuRHWcIBJDeaLlphXCsu5q1Iv5JrmWNOA8X3sXR7nHwYrj8AvHFuNv1DOV27LwyMFqZ4ZY84Q0yQZrRkMmjwNdimJ+GvL9fhmfeXcgBWs
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(19092799006)(52116014)(1800799024)(376014)(38350700014)(4143699003)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?Y5SvByqqSd9AIFjMd9LovkNwF2rt0ZWHDBktHZiOjQ8n4MxA2wX1SZajZH+S?=
 =?us-ascii?Q?mWCvCqKhzlPbx58tfu8ZMJED2OFrK5fDOHe2Wob2WIbOdlf4/u/fOMvSfpwx?=
 =?us-ascii?Q?aaANe8K7Mdbk5YINiSAmv3RPe2vDxdFAZo5WpkXV0yQt4tm+mWGE/9+kPEPv?=
 =?us-ascii?Q?D0DY0tD3SbkdGFni2nSgJYGyu/KjXnm+UMr/WsaQyejD/0Scamo2kYw5/0Cu?=
 =?us-ascii?Q?Z58fzxV+9VPeKSanQWd/q2NdI2VUmD4talBwJn1rK5DLb7NduHYwrG1KWog0?=
 =?us-ascii?Q?DjbU4RNUwQHMDgq9OP8b/VTbbHWP3rvcVcJ0+qwsubA0DON1LyYLVX4Oge1u?=
 =?us-ascii?Q?DQyPO1Mgs/76H03uubuzsf3NNtRf/3rPa6/7XbcsAwv1k1a6Mjd/z+BqjM15?=
 =?us-ascii?Q?SnTg2xVa+CdRk2HjwnAKrpknFjQk8E6wdBJ8lWVsi3tWO1spPeuusu4Unf8/?=
 =?us-ascii?Q?7dLGwUR9KpTM7rD851JPAEN+VHLyzTtZs7dQJsKmD7mlE7dUjfTaVeuqzv7t?=
 =?us-ascii?Q?7P3RUDuvYeZr3hgXKaJHKRM8AX6TX06x8vSrI68841trqEdNG16wg4c5YWw5?=
 =?us-ascii?Q?dJa1HGwi2G4OrtMCH5hTZG55GYb90zXLypyXgPZut2e5lC3y2gtHXXfKAcXY?=
 =?us-ascii?Q?tm1F6EeqNtIz+cJ84KyM7EJYSjI4BWZ4cHQQQJYK1JOkm33xoMbrDmVFtdqS?=
 =?us-ascii?Q?j+xqu9PvnmjO2kipqqcUlv+Sion3AtO9pEVuQEno5kOfdrmllbl3WdJpvHV7?=
 =?us-ascii?Q?/8X0fXBVJUMA7xQg3zKr5XQAs154Gnmn6PghKpuDR8wMn3hWGF4fD+hRTxBT?=
 =?us-ascii?Q?j+SVRYQZfYkpS6yhQsgespVp87T2z585WPkmeX14BPQCTNdcEKp/vpqZTe0Z?=
 =?us-ascii?Q?Ul2b6INKgRUN62Kp02ftK8vdeTbEWxk+9fzAp5SbQ+AVdbA7Qa5io5vgknzk?=
 =?us-ascii?Q?eIzmEcfDPo0hxVXG4fhvSDzbqoTuzPm25Uc5Luqyu9Hfg5IWlniqEPKV44Rg?=
 =?us-ascii?Q?BfueDaVUNuNy6JyOMzYdsLft5zv84CND0X8isvj1YwRTavqP6O9/S2ulA6wP?=
 =?us-ascii?Q?oEcG1GLLo9BpuvJZv+gJjpOa4Mhc6gh/6JQ8N/siC8gHqjQq/VUb7wwG4UMY?=
 =?us-ascii?Q?78DhNB64LrebXiRKnZqYmXJYaHu4qG8XsoPCyGyCOP5938qbPvx5o5xYzNxL?=
 =?us-ascii?Q?qi7n9MSJp2PMF0yti0oa/kL5DApjF81WOrfTsgxnzbGLU7jzE6L1A8A92Ycg?=
 =?us-ascii?Q?NBHCJazkw7xQyckTC0DpWbOWQHW6DIYIvq1vfIBczuR0wrtEdL8/jFtL4mlj?=
 =?us-ascii?Q?LaKeENtE8QV65aw+4zEZHLcPliK2IZMTLKJEB2VrIo8BdnXdetSccdaFBMig?=
 =?us-ascii?Q?oglBKMWd4M3ATxvwcZR5yJpVgjORUNfnWD/zAb5RW+Z7ruZ18e75KJrPV4eH?=
 =?us-ascii?Q?UrXugFZkWjzHgOZv/u9wXjqwNCy/dxMmIReXlxVhFkyPaqZn/OOTj8iOzxSZ?=
 =?us-ascii?Q?H90DEmIWp/4EFqfSOjhRpStmN5Q+UNzLAPeL2ubTmqLdwzItDuSBEJQtpJiM?=
 =?us-ascii?Q?hIfGXMfFz1PnkS6jZz8idE7UfAEeSl3p2s/EdqmRZuiFCyKsCxX6AddWyH6y?=
 =?us-ascii?Q?XvIAn8fT8115Cfer137LOv1bmCLAQqjNZdCCtgxwJKldtzBUrYUmTOd49QrR?=
 =?us-ascii?Q?hSgBjGWdNlin3AuU/JrC8m4JsygtfXPRBcJOb728XnCODy3Wkc+F/SqLzp1M?=
 =?us-ascii?Q?NEioML6NWQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2567dcb-7929-4f2b-a7a7-08deb28aca7b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 14:03:50.6625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IVFNU55FNdKZyd3jwZqWsRK6DUqUHQiZjtTg/rbxFCnZBPTuQU4Tr19p1Jo4mieeEPVZn3viub0x7hD4xlBWwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10945
X-Rspamd-Queue-Id: 3C73D551412
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-61726-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 12:41:02PM +0300, Sakari Ailus wrote:
> Hi Frank,
>
> Thanks for the update!
>
> On Thu, May 14, 2026 at 02:33:53PM -0400, Frank Li wrote:
> > +static const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_fmt)
> > +{
> > +	for (unsigned int i = 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {
> > +		if (media_bus_fmt_info[i].code == bus_fmt)
> > +			return &media_bus_fmt_info[i];
> > +	}
> > +
> > +	return NULL;
> > +}
> > +
> > +u32 media_bus_fmt_to_csi2_dt(u32 bus_fmt)
>
> I meant to use int and a negative return value here, too.
>
> I'll pick this into my set and change this as well.

Yes, make sense. so needn't MIPI_CSI2_DT_INVALID.

Frank
>
> > +{
> > +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> > +
> > +	if (!info)
> > +		return MIPI_CSI2_DT_INVALID;
> > +
> > +	/* Check bpp because 0 (MIPI_CSI2_DT_FS) is a valid data type code */
> > +	return info->bpp ? info->dt : MIPI_CSI2_DT_INVALID;
> > +}
> > +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
> > +
> > +int media_bus_fmt_to_csi2_bpp(u32 bus_fmt)
> > +{
> > +	const struct media_bus_fmt_info *info = media_bus_fmt_info_get(bus_fmt);
> > +
> > +	if (!info)
> > +		return -EINVAL;
> > +
> > +	return info->bpp ? info->bpp : -EINVAL;
> > +}
> > +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);
>
> --
> Kind regards,
>
> Sakari Ailus

