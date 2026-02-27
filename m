Return-Path: <linux-media+bounces-53691-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJ9vO3t+oWkUtgQAu9opvQ
	(envelope-from <linux-media+bounces-53691-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:22:35 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CFE1B67B3
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 12:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8A92B3181B90
	for <lists+linux-media@lfdr.de>; Fri, 27 Feb 2026 11:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2600933A030;
	Fri, 27 Feb 2026 11:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="i+idv23/"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F433EDAD4;
	Fri, 27 Feb 2026 11:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191178; cv=fail; b=dhVlHCvWV3KIh8c1pOg/oBsEMeOzjEm+B0lbnUJCQ+7HPQX5ELLNSCXXOr1YnKuvp3NBiS7Uo8+SQa1uklRY+anIKqjA8iQPPwKMYjpozUryTW476uBamptgMidFkhFHo+zIhXgufBTpo8FQ2FqVRVk4/us0Rr/Ea5CqVHM/pHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191178; c=relaxed/simple;
	bh=yofNPOQ9WYsq6owUCu+pgz5x88KH3UBxOp5QCvmjRoE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=tQn78IUwLrKOglCN7kRDOhoTsVpkrCZv8JxLi0ghc9rIcXqruKjlxQ3lXIS4LSSgSeTDDwIVv3ENfAtLQDEMHIkrpZP5Dcp4+6T8RkqzdM5k5ZNPyXqAyrAtUlclO2jIFvEhtUvcVzqFXlJlqTIbRkseUgmYH9Xfe90fmy9ujMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=i+idv23/; arc=fail smtp.client-ip=52.101.69.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ixVAA+x+PjdTX7cOme04yZ59EWAsRDaWluICWWnDHtqngDu9uZCVli8tOlPuO55f7onH3jjjuJLdlj4YU6Z31hPrIDqIzPYZ+eMu0B/k6eXumJTEAI7FvpFnPM8RIFnP9oVeOd3u7pkub/Uh2meOSfUtGj1fv54oxz8EpGMRjDhWEHAjeW1lDtWV+iLqhUQVBlPGkgBmE+IMdNCU6zjxNeT7oe5w27vDihbhZPCV7RGEcvnEVphEURnm3A0joUVdXexk8q+06FtyIiGNhL87ApaW05EUD0vuPdU+J2UF16qjqSAxvwkC6e3sQtu3BSv/Rt0ixSyubILUsuFrkbmSsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oVBNEHSq1SyFdTRJ81U248DIa2mHvj8SDEroebuf+4=;
 b=UC1kf78CWiLQx6KDg7//8+SnR4LaIJtzkilWsWCUjCsfwFWauY/cjRNEk4SJsW+kumYMLtLQMH1KmQjTMlVYk6U9X0mF0oqw+PWTUwSPRag/e6wpvPJfBQEdlR9iyVWqpkFpReuICb4XBRBuO5mHGXWZe3MXSxRNzs8qlFoFI4Ec/rTHtr6Z9rfx+EFV/i+UCuhrrpUeImqCUrVVju02lzOF/7MjTWF8dzfG8CUgqRF6WbuWojxvVRpgcgCnzLhzDwHOahYDE++QwZkPhFwNIVOcIHRSnswiTVUIPeDoGzbOlkbNHa7whkJNz6SQiwxyDI38MOz85WgRVuHtLx/zdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oVBNEHSq1SyFdTRJ81U248DIa2mHvj8SDEroebuf+4=;
 b=i+idv23/menQnOinnKSHVcOOETDAPlHepVH6ani85g5Zadk7osN+Wt8pHT80Ni2qmvL5qrMwgBQJY/PuRUTzP1GDHxTTh758WEDvjmbEjUF3hbvhD6tBd8IiWtSaaJ9DW4tf8FL9kW/vGQqVl0xL3hxZ20LXoeg8AfoFo/e5Yn3H+48VxoApVfTDjSKk1eas8cUq4V7XlyoTMQIlpc4Pq2HtRDt0LCl06IqLMWhb36LX55jt8UapCZ3BKrsmbBqi4sSBPV1yeS4Wlz9ytSbZHlz5SK9Lwte3Vs1tYrr6FMWghrDY5Ed1wlcwB4hGmcAjP6zgXZbPTb4lPyFfzYegRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 11:19:31 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 11:19:31 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 27 Feb 2026 19:21:10 +0800
Subject: [PATCH v4 1/4] dt-bindings: media: ti,ds90ub953: Add new range for
 remote GPIO data
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-ds90ub953-v4-1-dea596205f9e@nxp.com>
References: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
In-Reply-To: <20260227-ds90ub953-v4-0-dea596205f9e@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772191287; l=1343;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=lczvwm5JkrRoK67LfWBD9eGBjFDy4kRH0rnYiA0+oGQ=;
 b=p7QWh5/H8sZW50n2w8GmbJoZCwFcNUyuz6E7d5eL5+JqI+YwC8nXUL83ldRvqXgLNHjzbdyfD
 U+MdlYr+mP0CzQPCc12evhHVj/pHnFq0lmucbRYBKKCWixzGdathIha
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: ee6bad28-4f3d-4f11-5a0f-08de75f2140c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	qHtCxgufqgQlRA4YzBRCYD06MBZeCb1xZaPNXX4ZqCVDCwsIoStbyNBhm1LEUc3eTRLnF/BAcjkCh/55dLio1wMhqlUyNqRyDls+aKLgk8BNJekwooOPVmPfwpyyOLrro3x6bR12PCeLTJobjBORzshMorerI9GJw2OO/I5FiY6vTmY9mRRsfPsI9Ottvqsa3UU2LXSR/l9bP0IK38X6eamLu4cN87ZuevMx6e12TllmwfjYsS3+lhm/NOLLQMCMq7nlYLTqHqOvxVcRh9DV5XQETgUirwJFJjKD48EPqfx+68RFPY9CE7h2DJTTTqJDhg3XiLmp7u+wqGk8P5fpcnGaps4n2ZhSWZMp/wa9hMR/qfoPK9/vJzEbEUJjIz8C1TZXGe+9QjJbvNYIecZcdexQ4TwSYIfMaT7c+OebLMepk7nq1/8X/FSD/LTDFeQcsn/t2E2XI9zse6RNpJQwpvWIySIma/F+EvHuANVt6aS2icR7MdUkuJtHqTYBOquGGTuDSxdCZ/CL2JJeQ22fuFXYGRoVOHoB4OJm/3BIMuVmmUnmCHHsel+b+nVXfPnqzMP0R6/Jgcb6DKQ34RA7s7g4v80Q2vi9RmLHpX0f9hhvt3ME8XaUHSabAXEM7hiZFRdheR0kcf8OQ02QG8mXCnYGey3fk0F2xwnrRD/ebBNQRvXwfnAzSKmOYt7s14XTnJS6yM6RwJaWtgdrEBlvOyTBXc0rzWUTxaShXbc1Eb2plqg1pS8u24csbSWVFTErdYytlPsNwVXwajM4rxVHrIQGlYiMbZq6WpTdHYusf3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUxnNTVVdGpkSmd0VlhTTXdPWTc1SzRUR3dmcFI5N3drZ0p1WWZ3RzBtaU9x?=
 =?utf-8?B?NGpQWE9LN1FtbTRuM29NV2dBWXlrSjh0SW51NnFWSUdwUEdqZUg3WFQvWDlN?=
 =?utf-8?B?NDRCWGxVdStxd1FOQzN2RXdua25zYVZEY2FwLzVGbENDL3dSWjA3enkrWjUw?=
 =?utf-8?B?eWQ2cW13ZzJidGY5Q1FzNXBKUWd1SllTMys3WVVqbVdkeDl6Um9zOFhTTXNJ?=
 =?utf-8?B?Qm5iSFVFdnpMYUtVdXhuWS94R1poUFYremx4OWZ1eHpOU0NVZk9KOFZHVzRs?=
 =?utf-8?B?VDFDU09aNXpycklqaGlwWW9GVFpoL2dtSGJic3VWOXY3TGE0dStsN0JTYXRq?=
 =?utf-8?B?WVJZVWFlemgxL3dDYTVzYlF1RHNoTGtKZFoxT2lKeFVjZ2VTSTk3ajBpMTFr?=
 =?utf-8?B?dGRodlRHbVpoeXdBOS9FQWpIYXQ3dmlERG1BUFdFelFCVCtwSVU1SnJ0ZjRT?=
 =?utf-8?B?c25pVVowNFZlbUJFUjdjN28vb1ZkcFNFQU5MSHZ6S1hXbUJmaWYvWm51NGlp?=
 =?utf-8?B?NHZqdmdVRHFsU2ZaTitmd0ZyYUpjZUVQZnZ0NlcxZjRsSUpkSC9CYmkyaFZi?=
 =?utf-8?B?Qk00cGZyRWJBRlJXeGNwOUdkNEFicThjWjlzeVpyM2gvUjJQZGU3cWw5NXpm?=
 =?utf-8?B?c3BLbWV6clcvZndLZVVqUGFSbHYwSFlQeFU3TTY5QWRpMjBQOUNoSFZvbEx4?=
 =?utf-8?B?SWVxUkp0WENxOVo3SE0rWVQwOU9iUURMR2gzSVovbmJjOE9iRGpmdENKYlJX?=
 =?utf-8?B?RjREK1VWYU1LSlNDVnozWlVTTmkrVllReXdjbWJFUVlZazlFRWFUNWlrVldI?=
 =?utf-8?B?ZStOcmoybk5CRjlhSGtuVXcwakwreHltaHJXcVloeElxclBqQWVDMHFvdERZ?=
 =?utf-8?B?N2l0eW5mSGVGU3dmelJrRDFRRnluaWhQWXdPc0wraUJFeWpMRHVXci9YU24v?=
 =?utf-8?B?VFI1SWpqRWptbDBVM3M3Qk9JRSt1L280RWJLLy84OXFob1RYR2tWRWJNcUU0?=
 =?utf-8?B?MHFDbE11VnVYcVhDeFhkNXFXakg2TDB5MTg2L05XOXpBUytWcWJwQlpwL3Br?=
 =?utf-8?B?a3lGUk8wYmt2dGp5RHdFMSthdVV5L3F6b3I1NmhQVmsvTEI5U1BiWlZTU3Rn?=
 =?utf-8?B?UGxpVWxkYTNIbXN3VnVDRVJHNytOM3dJZk1qK1N2R1FBWm1USW1iRytXcmt3?=
 =?utf-8?B?S3FhZGxkVmY5OE9Ma3kxL1EwY04wS0xiQkZCUDVxZklHRDBDNGg2MDlWdUJD?=
 =?utf-8?B?QVJRNkd6SjZzZ1Voa0NlTjU3SHFEcUFrTlZpLzRCMDR4cllvN1hJTnR0eTFm?=
 =?utf-8?B?eEJpQ2hzZHgrY3p6VUdKQkVHeHZNWExJR2NkRzloYzBmWkpwcEpEU1pzd09Z?=
 =?utf-8?B?VG53NXNybjI5MmV4d3BPY0dlQUN3UmhGVVdiN3luN1BVMjdrUU04TVBCSHZr?=
 =?utf-8?B?NkRiU0xlOU9FQ0xFL1JOcGkrMFh2eGd4ME9ZYlBMbEdBS01uQTNvd0pnbWw3?=
 =?utf-8?B?M3BGV2lrZ3lVZlN2cDZnd21OZFFSb24vejVCQjlSZ2ZmSXpwMkNuOTdLU0RF?=
 =?utf-8?B?T3BFZ0tWZDJkYlhqenBwM09vdDlPTGdqLzl5UTdMZTAvTmVJV2ErVWdZNmVT?=
 =?utf-8?B?TnlSOTFBaERBT3lOUVo2bjVmVXhacUtvSmVCd2JuclNEV1Q3aFFjRERHMW4r?=
 =?utf-8?B?UmNlNkhxNXozUzk2RERpdyt1aDBwK01HWGVFQ3hzWlovRnQydG9rTmRvQURh?=
 =?utf-8?B?aW5Qb1RYVzhKVnBDOUNFQ2UzeFlRVzZDME4vbWdVcFRMT2hLTEtCanpHVENG?=
 =?utf-8?B?RmlCZUJwc0JIOWxNTmxIU043SUZQODQ1VVJWQlEzMTVkSVc3UjFiWWJIdngr?=
 =?utf-8?B?TkZXb3BQYUUxb2FnNUN2akxRVEc1czRlRjNNaWlidFZmVHhYNWR0UktobkM4?=
 =?utf-8?B?T3lNcDFBYklhcnV3cUtZbEFmVEJvWTZRVlNsL3N6YzNmbm9rUU5ET0I4K2ht?=
 =?utf-8?B?UVZiZkZRY2JQK0NFOGJ2cS9vYmNKSHRhbHVaTlBWQkhXUWJmZUJFRUtaT2JM?=
 =?utf-8?B?akJ6STBLVGcxSEEvR1lDeDdGRHI1dDJPeGcydVlscnV1VXBzZkpRL0UxbVgx?=
 =?utf-8?B?ZVNFY2IvblVQZlh2TW1BbzMzYS84R2lFeGFkUVY2WUQyYVYzNUNlaVhNdEdq?=
 =?utf-8?B?YnZWcjFYeXpuQnA0cmcwcGUxQ24xU3gzQmJkcnFGSVRsUGdWdTd2b2RTeHk1?=
 =?utf-8?B?bTRQNUhIc0hrVHM0SDNiU1NYTkk5Rlk3RjZtOU1UcjA1bGVHZDBVMzgrOHBY?=
 =?utf-8?B?RUVoQjREcUFKNEt2dGdGRmljbWNrMWYyQnc4Ny8rNzBOR0pPVDFXQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6bad28-4f3d-4f11-5a0f-08de75f2140c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:19:31.3944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hCq39yGmyLWIFdrb2yT9r5xN5H6qSjchh1/QKyymkC/y+Z1PhQJo97x8QbWIB/mEPq0obDt6XH5yA7P7/qy1Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53691-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 60CFE1B67B3
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
output, it can be programed to output local data or remote data coming
from the remote compatible deserializer.

Make a different GPIO range for remote ones.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
index 2e129bf573b79e0ca8f25b4ec5fc6ea76c50abd7..0444f3739b775848d17adfebc4158e83b69adf9c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
@@ -20,9 +20,13 @@ properties:
 
   '#gpio-cells':
     const: 2
-    description:
+    description: >
       First cell is the GPIO pin number, second cell is the flags. The GPIO pin
-      number must be in range of [0, 3].
+      number must be in range of [0, 3] when enabled as an input.
+
+      If enabled as an output, the GPIO pin number must be in range of
+      [0, 7] and [0, 3] for local GPIO data, [4, 7] for GPIO data coming
+      from remote compatible deserializer.
 
   gpio-controller: true
 

-- 
2.34.1


