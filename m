Return-Path: <linux-media+bounces-60324-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gG6RJbsJ+Wlt4gIAu9opvQ
	(envelope-from <linux-media+bounces-60324-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 23:03:55 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8744C3DA2
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 23:03:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1760C301EB50
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 21:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143F333E373;
	Mon,  4 May 2026 21:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dw2VNZ7j"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA4633DED9;
	Mon,  4 May 2026 21:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777928625; cv=fail; b=NphSkfGWGeC5V4ebmqnxJHLsOq1BlwB4nfh/GQIMPIT6NeSGycpa8gGIXH8w2L62LXWGQvwqfXbN/K4MW5aHUBYHMmuh4Y0KL7a9pwOcdqpuGTFMbdVmDAhbjPWfKXbOy3cA5V5mrVW6rDg4HEsPLiImh/Oneei7bG90WdoRtEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777928625; c=relaxed/simple;
	bh=srG4wZXJGyagE6wuYHmKoZ9PP/QTh93FynE6wLg6NiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yk+QH1GU6XUtySiMoLLYyTvXecaizamuFvfblgBfkfV3ZI5KkgTVDZ6CznZ1X86yJAFCtHHsjzzzidK98KJnVjCtDz0n5+nEvkWUgmXnwZ8oZN3dkA6f+LyxcGJEl3SR6nYmsNeYvDeZkHWfDEh3C55ru6cZJtBC3jyPm0YprqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dw2VNZ7j; arc=fail smtp.client-ip=52.101.84.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tgRPONZU2mrgAMfJz8LbLksMnJa5VgMX40kv+8CPrTMTyabtTIgvKF2B4g7t2Yuh+JkuSNO+JQBhtrbCnuxLf4daL7wCwZk1xbsYoDiQqa7rMDBqp2xlVdETzXbjCX5g+P29HFlVQBI4f/m9pYOGVRpJE4/y4NFkPUPBdzWDBcJauX5Ij0VKWiaFNLqcIrJAbx+XsNRI+MTsudjtX9CHXU0+XEUWTVj/Ho5r6SdH/sLRPGbYObnb+6UmTaUwjjdQX8YaD0VuCJTs54b7JVtq0z0e2HBeMMz0xrsJyLC0ST6/mampA6S9xmkUOG8Xwbc5d4WBk7itZberB5ri8UBHIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R6Q2xrEXfs3bm9OmQZ+QUXVGsU3eNQatyDeCgAzBfgM=;
 b=SFd7WPsHmwl/S4hp67aPgf1SjD2sv+KVv0TvPQD9548I5nUtYgk+35jvphYz0+KhDkLhrSaqonBQIJXyrAGhKZtOqsBmTXA1ceeRqcwDxlA/tt5IgfYwL0PtuwSTKMHzvAbpPYtk51NbuWkLfCPfjLwXjMv0Z2fusPZa7Eapl3/NsuoPENC48p6B5XKbSQ/aXsQYi5n8KJEzQ4WmfBFsxhF/2x/GxAtApa9xAr74Ox1Q3VcfIHhsOyKLJ4zmdpUN/68LrUj6EKnPO/ojAaatM6EyC24bj5ak14EIFLvULK8bZp687EHRrf15ketTGeTSzXieNLGXdWt3JDHy4GWNWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R6Q2xrEXfs3bm9OmQZ+QUXVGsU3eNQatyDeCgAzBfgM=;
 b=dw2VNZ7jlFgjW9/Qx0AbNDwyCvKsBloafBA0CA5tqe9Nhkid22JdYt8BIIZjNgItkAiLxXavz0eL7to4zrdcMs4pTYkpXg2LFagSfbOOHAznvh4YglJ9nQFEmygAvEDo51gDu2wAgd9TtfktKN7+1+LJoxBwIThMn4fNj2CSah1K2fTHKYJwbCx1E6Jnk8v0yhsdHubZUBymDMF0dqKwNKETlh1jLyF97muPTEUmbclP3rSmFFXlXIScfSljyz1y049CcBW9b7WXXRaSL9MeH7QkQyqBkzsMG4kmdBAxUqhTBtZJRlzdxqhg4OVfJt8T4aYZtVkCQJ1C/Mx/OaXVUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7693.eurprd04.prod.outlook.com (2603:10a6:102:e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 21:03:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 21:03:41 +0000
From: Frank Li <Frank.Li@nxp.com>
To: linux-staging@lists.linux.dev,
	Mark Adamenko <marusik.adamenko@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: imx: fix parenthesis ending checks
Date: Mon,  4 May 2026 17:03:16 -0400
Message-ID: <177792858724.2483158.13315501032694493892.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260310002643.27465-1-marusik.adamenko@gmail.com>
References: <20260310002643.27465-1-marusik.adamenko@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0034.namprd07.prod.outlook.com
 (2603:10b6:510:2cf::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: 65c771bb-43e2-4058-778a-08deaa209e65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	m+R1XBIcEyIFq1b1IuW/J1/9Vc+4EBOtzt/tSk2UhSB8RjwH2s+uVU94qt6wBQlFOAh4nJglMW+o9G5Gv/XZmv+S56MNki5Q/WCOAEwBjdRr8KSy9iaKqCm48hp/xWTGZQjwsAlpHOZGohOfvbYQrdO3BCPD1cF5JNdbYRGnPPf7H+a1alF8LPs3hNrIKhzblVhzygoNUCA07jNsQPPSLgNvYwNx57x7gRy5wNxp3TsWUhkSVdkkdtg7EjY+W2ZUE5VvFhaGJJtgAZycMNcY7xpKBVToh1SYv/3zpKCsv5/TwG/LBB1CpPh2VkPq08AfqSQpjq1V6r2Fyk6qLaGGgj1RzfgFDqzNv8csPg9BfVBYmKtl9VB7Orv2YTlcA/HShD9SoK0m22hpdCWHea4iod+MgpLqIYFPTEmlZozUiqdQVrnyx1CrZvEHW0gzGtOXcEXfKVDOTh4FQnOtWMcezuoYX1Jl1TosErW8TS5xZHgdHzrsID8G5D0Xv58q05cImY3kpJyc2gpLnxoLh+IhFahqpmXDGBd99Jt126/KexTpt84ZOk2hoaOwtAxdmg5GWQhIG5eqClHHZzrxe7gsbSpMKmG/WaaozWQtGiUwpMdE3M36qLFMHYTwgoauRbM7vVLDMxEAq0g3+h7SeGJaUadKK13tNNut2MEdJkooe/PqXCrNzzlNU27Xpxp/j1nmeypLUQ5x+yXjQKKks2VFMXA2CowXfOTdFeK4t6IRrdlVW8CbgjML8ulsdlKdnKaP
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dk84ZHA4UFpOeUJDMXJLS2dHaDRXRmFpeUdOcFkzVExLZ1hLWnk0dk03cFU5?=
 =?utf-8?B?eDRuMVJiYUdheXUzdGcxajJxbTdPS3BBR2pHWmZqOUZhN3gvQXQ3aHpNQmlW?=
 =?utf-8?B?YTNGQUNjUGpuT3hWRk5pL3NDOVpyR1RHdjlSN0xsaGlVZzBWaEdNYWJFekgr?=
 =?utf-8?B?MVI3cmdPcTg1TzMwOWhNL0pTN2JSS21GRGVjaG01Mm5DTGFyZHZvTWtnODdw?=
 =?utf-8?B?bEUzOFVlQXpWUk9zVFlMOWd3a1ZkNFF0d3p2NDFjbjhHQ2YyZXJVSm9EYXpH?=
 =?utf-8?B?QktUZzJyMjVFQ1d2MzdZTWpqMGVLWlJQZ3FRbU9ueHNuZW5lYzhTeUN0TXJL?=
 =?utf-8?B?OU9USC9heWprTzA0WVJQZWtsRlRuT3BHNC9tWnlsLzNKRUx2bjIzNmRDWFQ5?=
 =?utf-8?B?dmdhNGhNKzJveEEyNnBjREhFd3JVRkJHWWJ4aHJTcmxoSjVxR09YOHZndElW?=
 =?utf-8?B?dkVRSTBXbVhGZGpuSWd3VVJaOW5CM0FjcUtPWXYwdTJENmVFcGNuUVhWY0pM?=
 =?utf-8?B?VFpIVlJXMWljKzF0alNZQnYwdHl4ME1YVnJEczhHZ3QwTTNPWUNHWWxUai9M?=
 =?utf-8?B?MEZMYThHVDg2L2FkZ0FZcCtxanhUSUtFQTByNlo2MUdEWTR5cnoxSHM1Z0VR?=
 =?utf-8?B?ZzRaRHdPZWV5b2kzZHZEa0JmQlpNUm5rUTdhd3JmS2lLRGZHQjM0S0VsOExl?=
 =?utf-8?B?YnpHWFpXNWdxWG1RdXhLdG82WGUxRm8rZGV6Uyswc092TWJyRzJ1VWRJOWtX?=
 =?utf-8?B?UDRYUXZuQmQ0VUdwcVFpSzBWR0lLSUZ6UE1qNThBL29QNXRoRkFlbWc1RVZB?=
 =?utf-8?B?Q0RpVjVzR0ZpdGFneTF2OXV1U2tOVjlRSGdXYU1xLytMa1VhUHhNcnJrZHNR?=
 =?utf-8?B?VE1JbHlhdXVjamoxOHc0dFdTbFIzZ1BzcXVNd1FkVXVtbUhYdUQyTyszRzgr?=
 =?utf-8?B?K1ZXZ0JYRXJjR1c4Yk8vMWV3K01xUEhSZXZjbW9Ua2Jnb1BTMFBwL2RVUUJ1?=
 =?utf-8?B?S1NPVkdBZnlOMzUwdXNpeTQ2b3hia28zU3hLQ3Y4d1ZNdUFUVjh6a3pPWU55?=
 =?utf-8?B?VkwrS2lUZk9HV0crODV6MS8rbHFZSkhVeEJXTjdYZkYxbW5JcVNZNW5SOEF4?=
 =?utf-8?B?a0lxNWNVNml2Y3JKVkJDWkNoV2hGZlVvWnhGd1hISmJVT2p3WUJDVjB1SlBX?=
 =?utf-8?B?Q3EyR3pSMjF4Y2ZlQXh2d08xOTFBVi9wMVNlQlNGVnlrc1lxNVNwZ0tsQjJX?=
 =?utf-8?B?ZklLblNyZHNCcGJxZnhBSld4RmFIS3RBOVBtZys0Z3locnk0NXVsbUlQVWNV?=
 =?utf-8?B?azNKdUdzZjJrUFdXbFZGOEkwL2JpeWV2M011eU1XdzhxTU0xMDVlVU9tRE5F?=
 =?utf-8?B?YlZycVVoUU9hT2swZzNtSmJGQnp6VjV6K2pKQVBMK3hTeU1uY0paSVBxaThv?=
 =?utf-8?B?Uy8vc3h3QkRYM1ZQYU5FQVNRbXFCKzFnb21sMTQ1Z0pTSzVyMG1LR2VtMm9p?=
 =?utf-8?B?VE9OZC8zek9QUG1CbkYyaFAyUkhnSUN2SlFWc2tzOStzdDhMTjdvT0FlUVFE?=
 =?utf-8?B?eHhtOGdqK2pUb2FCcHpDTHY2UTg1L0tMWG1MUXQybEN5ZDQvRDRpYnZSZDly?=
 =?utf-8?B?TEV3NWY1Q29BMEJoekh6MnNiWjArWUtVNWkxZTd6QjV2WDJnQVF3MjNkWW5E?=
 =?utf-8?B?ZGJPMHpnSk0rKy9XMmszd01MRzhESUZ2cXlpUnBWdkZ4ZDBOQXJydGVvNWxu?=
 =?utf-8?B?NmkyRW1Rd0NHY05pdnRnY0Vmc3NpVVY4QTY4QlpjOU5DQTNPRWh5QzZFMndj?=
 =?utf-8?B?eDl6ek1LSnJYU2RnUFdmYkJ6ZmdtVlJLQjZ0Y3A3SWt6RHZXQVZwYnNrbHZR?=
 =?utf-8?B?L2VYQ2R1Mkc2L1hDTHZiTkZzakJMNHV1VEh2L0ZQR2tjTjZkcVpwa0U1TFpG?=
 =?utf-8?B?cDQ1dTE3OHpHNURReldVSHVJeWFJaVJMVFZ2NXJDNXNQTjBHOUNiMEphN0dz?=
 =?utf-8?B?aSt5aTlWd0FWcWd1eUhTMVFuZTVsSWE3Vk5wUnJNc296Ynkzc2xvSFQ5eGxF?=
 =?utf-8?B?VE9TaXBBZDVsYy9veWRiOE1LME4zWllxOG5RWi8xR0RvZm93cVl1YXZadzRh?=
 =?utf-8?B?S2F6WldRTTZ1R3pLRms4S1J6YkhxVVJHVzBkcVVKeGgvTUpxQTI4UWhLczVN?=
 =?utf-8?B?TlV1Z1hvb1lPdng0WGtKbEFJQ1hqQ2lKSm5MZUp4KzJZdGd1MlNnYjBZQzBZ?=
 =?utf-8?B?MUpYdTRmTEtzVmh1WmVIdGFnRUdMOXo3b3dQMzNjQytSc2pHTW8yOGlBNjZ2?=
 =?utf-8?B?Qm1GU1gybFJ6WXM0a3NpR2ZJUWVwZTFPWDY4akVBY1RBMXN3Ui9KUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c771bb-43e2-4058-778a-08deaa209e65
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 21:03:40.9443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CezafCV31BKQH8NYe0vIHDZ39H6HP3WTIG7NEVzVGASbEuE1lADpMFenD6moMFE3dYgncjtWR5hhgUVXj7GEgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7693
X-Rspamd-Queue-Id: 0E8744C3DA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[lists.linux.dev,gmail.com];
	TAGGED_FROM(0.00)[bounces-60324-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,gmail.com,pengutronix.de,linuxfoundation.org,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,nxp.com:email,nxp.com:dkim,nxp.com:mid]


On Mon, 09 Mar 2026 17:26:43 -0700, Mark Adamenko wrote:
> Remove 4 checks for ending with a parenthesis by removing unnecessary
> line breaks, and forward declare a variable for a function call that
> would otherwise remain over 80 columns.
> 
> 

Applied, thanks!

[1/1] staging: media: imx: fix parenthesis ending checks
      commit: 616d687e7d419cd7f6464f37b8d1906fd351fd53

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

