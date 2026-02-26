Return-Path: <linux-media+bounces-53643-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kH63B5jPoGmTmwQAu9opvQ
	(envelope-from <linux-media+bounces-53643-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:56:24 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 897031B0A2C
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 23:56:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 757103079675
	for <lists+linux-media@lfdr.de>; Thu, 26 Feb 2026 22:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6885A44DB98;
	Thu, 26 Feb 2026 22:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gZm/hdfj"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C1744CAE2;
	Thu, 26 Feb 2026 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772146552; cv=fail; b=IUDeH8R4ctHk/aua1S7LOfJtlfaeDpXxkEowhMUriNeAO+3+unbmHKsFDQNYUCPeGY8+fDXTMNR4aYOGJKMKKjkp40QIW5CNLiQKqxN4KocHY/DKU0fWqF/sez8wCBW0JzZ7+tH6jt8Hiwcy0+wYFmfVibB/C3up1XbJMgGNPJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772146552; c=relaxed/simple;
	bh=ZGuytRSyyq4ul0jCoxdureoutCnpUF3UgiBuIbLcc/U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CtnqYmKJtYwTX6gf+g+n0wylYQR16ldA2Dfl4Vhe+yw14Er+fVL1O/Anfv+Vm7pvwMXC81atYWm+ZW1Gd2fX9RbvRupgyjKgOCaqPL4aa7TrKiL8pa4/jpyV+nk0jPHvyF3Mpm7uEhxnA69lW5xp29dmdkLfty/VlTn1B4cS1ng=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gZm/hdfj; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1/ingeMKZBsLs1sELgQp2uqCY2NJKU6reflR4HcdU/Ylh+jEWL2zzOOXrkpOJr6+0sC2Ac0F5kfYdeTCr8SwfLWiSmJoi0rXMgRU5P7N6q93thPRXW6GqTMeXkFes25EY0RwpN3DK0F29ySaaqe6735N+fcCGAk/ZH1PmIg7DWxqFykgl0OqN/bQI/WPep2hr2fGR0ivPZ3qAmuRrM35M43mEamO9M55tteEqZdcBPWuuvj8yzrATZg0CbLfibaOxjCK8boWb1GlUQmaqCTsOSFc0puEUZEjGBT2irMb7L9NIL9Zzwzwy4e3e7dEZ0pIDK3Ivp5GC/n3qa6K+uYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFIU0S+trRoIodKkaKGTgf5iA5UhdM7yee1DyPEphZI=;
 b=Aivsun+ds/fqsKtnnIw/WU14JzpLXWfSuyGmQjvIydyBJE1YcJmROAXE0lBrjSPcKQVaprvLs6OVUnxjmsgMCAxTbSHemjyUOF6yjF6gyWuVG5sfTveA0dDA78ksGpq1ldl2i3tELD3QF396fXUiRE7j6nmDToKV9doMZsfAbWCnbdmdqxlPwRySr5XHVvRtDqoxfrkumrz0iQDtq+jJBgZ8xOBEB1Bnvz2DMNpb/Vd7/wALBEt5eCxLXbXD9YDLZuy8h9mz+qBFvCy8mohazdI5VLe6MgvUuMVi1vdAHYpaucdQntasGj560A+ecRGhkA1oLtRp6e9BPHHHZkmFow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFIU0S+trRoIodKkaKGTgf5iA5UhdM7yee1DyPEphZI=;
 b=gZm/hdfjNg5lJbiqVEAmMjVfvK+Q85SlAYzXs+0fCG9qIEkb4HlpR8gvqe6EsBxciDdXdqMeNJUysGF5OZJDubvrcF/+eocQyANJEhOiraTgMoZPh/j+mVShi7xosVbdegDqIcVKdSCLkQN20kD7n8ZfGC2xvYM8rHswEjsRzqKwSxvGtCkx0WgGYpQSlRJ+pGqg/y/gVzSjT6NE5CndlFv7ckfuf+GRlgYxCrpVYo3TKKG4DxKECcyu6B1FTLLH1ERsTcjtytxnbQN1wWLWleVYXI//63uxBT0xpyumNVMULpO85eKrrH0wNvIbx/2ODC7gDyBiRDFAbamZETqBAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB12143.eurprd04.prod.outlook.com (2603:10a6:20b:744::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 22:55:49 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 22:55:49 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 26 Feb 2026 17:55:26 -0500
Subject: [PATCH v2 1/3] media: v4l: async: add helper API
 media_async_register_subdev()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-v4l2_init_register-v2-1-902d7140f9fa@nxp.com>
References: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
In-Reply-To: <20260226-v4l2_init_register-v2-0-902d7140f9fa@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772146544; l=3298;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZGuytRSyyq4ul0jCoxdureoutCnpUF3UgiBuIbLcc/U=;
 b=Ggh+yMn1PgxrEA/HvDYJCkBipfFiWMamZpKBneA7WDd/JJLn0Wg7rs46LKjhgZBUesAZv1KA2
 WyTpqkAMLnRCqWfdRRK7Xr01AyPXIAivGtBifSWkhIdgsfM9oKIdl2S
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BYAPR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::38) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB12143:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d89cb5-57db-4bcd-4a08-08de758a2f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	orRcmdUKb1T2Pn+Bw4l8Y6GpVoflMi+smkPgt1cTCzplFkq9B6awfd9W1IIs87QtRbmnEeEwrZkwK/96KMTa1dVfIsrxj1gHM499rCypsFdGxNODBjrrMvpxTeCnA8gIY6KEnju4ky+Gfhw+GX/WTVpgySbriS61upgkasUc+FN17fqoT5Z17Je0M8ftatxdeiLvXdQmk9OBM4hhdMCE0UoJwFV5GWvo0kFSwPcg+DehleTvQFoaqFqiR8490/eQY0dAhkedKAVxonSb/PhcwaqsdkcD19w+fhJxxnzSXND5MegevUc2OFK1qMNcz3UoFcC64Ch/aemK3Is8HLeIdAY6zg/yXBDN3EojnIrbzOfnXVQE/0P5hM2O4hsgmcQZXm4QdOEAL6V2VS4Zdhp9MpWUJx2sAJpNt0e96nfCCUJE2FIS1S+bih7+QWiNBPQMdqq/yjxPPPYNnI14usyftCbjDEqwXyp1L6ZO1yDmkIrGTp3cjM2WAleB1nPfq1JfRyvUC1zRpqpPTUQPumDkH8RZzs2cipbMrACMtju+96UI7KUExZ2RyzqcaOMNMNFOYmi8RZVpzCNNqOWWgKVsjF7i/Yj9dcesxqw188GY7yezwv3o5PwNiC9FvoHD/Zcdq8G7zOKrwX7Q5hn4nx6ck93HELlyM9B4r5lNnF9pGGvwBFZc/zSUsaznV1oxhmTpHuUNUAKCB6UwO9+v6Z8WJD0J/Q98g7TzdOk182Tmq3zceZzf980eZVHkwYjxKX0oFuTipi3StbROinKFLbXoUEIiEb/g057jhmP8Kc8bhWk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkZyaVIycnd3TzdPMDNJbnB3RmxqN3Jremw4bGd0Zk9BK0hCSGRaWHRuSGFW?=
 =?utf-8?B?eWRCRG43NHkwZERhWFhQcUtRblVHL2QyVEdycGRuRWc5aU1kMkNMaXdNY2Iz?=
 =?utf-8?B?SllqNGM3S0loWGZ5WHRzS0NldUVMSEhtdUxBd0ZPSmFnVExTWUs1bnJNdlRE?=
 =?utf-8?B?d1JhaXpBYXNQU1RPK1FISjR5bVpNK0xRS3BXQzg5WjBwRTZOZlg2VmRVWjlN?=
 =?utf-8?B?WlczNTRBZWt4VkNnSS8zUnB3cDBkNDQza1FyL2srMGgwd1BsYlk0SmxrT3hT?=
 =?utf-8?B?NEVNcjhVcmxlMndZRXptalEycVZRQytLTlM1RC9CbGpCbDBURFAwYzN3b016?=
 =?utf-8?B?bFlGdEZ5MU84WTNBempYR0hYZDlqVVZOYWN0SzhxaVJIQ1NGdmNNVzEwU3V4?=
 =?utf-8?B?dG1BNkNJSm91YXkzQ1Z1UnBEa0g4Y2dFaWg4aFJFNTZUWVRiemdHYUloRVNS?=
 =?utf-8?B?OTNmd295NTNOVFBmclRua3NEVitaZlhtd0NTUFdlUEhaV2tKdTQzNW94SDF5?=
 =?utf-8?B?c1NhQzFFeGRCaUZVRy9mS2toM0JBTDFBT1RGYzUzUHpLRHJwb1I2a3NpK1Nu?=
 =?utf-8?B?T3hUdVh2MEx1UUljbkY5ZGdKSE1mcVRKZS81UTlFTGxSVjd1czNmSzRJdW5v?=
 =?utf-8?B?eHpUb0tVb2RKU0FiSml6eVJIY3g4V1N2QU9ZeTlBWklJa2xwWHhDRzlxN3p2?=
 =?utf-8?B?cXIrYUhtYSs5RmdJc0dQWTBkT2pGVmlNbGN2N2RWUWdxSmYwRUx4UWRZOGVW?=
 =?utf-8?B?dGJrbWxER3pzNlpoelhDTWREUCswQVNjemtLMFBuZE83M25TNmdZUjQ0OFFo?=
 =?utf-8?B?K051Qm5nR2lHWm5VMnR2Q21oenZxMXBFYWpBeExmRDI0OEtvVVQ2MUNSMXF6?=
 =?utf-8?B?QVF6VUFFQ0JPdlJwSWEwZ3NSL2ZtSFVXN0hSTEdELzlneWJ4a2hjRXkxRm1R?=
 =?utf-8?B?RFJUOTRtNStYeWxaK3c1c3l0KzAxMHpESUpiNXdIUHV3WXl5TWNWdUN3cGth?=
 =?utf-8?B?RTlOVHVIcmxDa2p2N3dQa3U5Nzk2a0VTbjJhMlZxRWV6Z2pVeEUrVEJ4aHJx?=
 =?utf-8?B?dG0yNWZDNGsrb0FDNGJZK0Fnd2JnYVdqN1A1cjQ2Qk9lQ0orR0pwajI1WHpS?=
 =?utf-8?B?Y0ZESElKcjExMnM1Y2ZHQmtrdTNHSCs1SFZ5aE1LaGtjYUt0bHcwYW13QjdI?=
 =?utf-8?B?T0ErMXRGQ0pEdWpodzk1cSt4UGRZV20vNjNBdEF1N2JCUXJyUHlWeERrY1Ay?=
 =?utf-8?B?Q3ZEams5SWlSS3JoQlRoTGhoNEF5K2M2eEU1WkpsK1NOODhBWHpZS0NPN2NL?=
 =?utf-8?B?K2ZLQk1LZU9iOU9yU3VhSHZYWjErMWd1bGNvaFhUU3dsdFRhOUFRcTIwRmhj?=
 =?utf-8?B?R3I2MFpwRjJaSmVLMzdNdG1mTERZdnV1TGdYNnQ4c2Q3OTNTb1pFNDhESHpz?=
 =?utf-8?B?a1FBMkJXQU9EUFFyNkVwUUcxckxyYjBnUi9RME04REtWZEdKdDZiT1o5NXJj?=
 =?utf-8?B?RVJ6bkJLT0FTZkpESms3bnh0aFZYa3o2dHVyM0ttdlh2Y2xaRmJWK0RRakwr?=
 =?utf-8?B?R2gvRE5kazlXMk5neWEyM2M2M3k3M2pyUlBkOWdZOWdIRklBY2pGSDRZSTV0?=
 =?utf-8?B?cmtyRmt2eUtFOTVEM20wc2hYSnEvOGM0YnRjT3dEaWdiMllGQk9jM1B5T2oy?=
 =?utf-8?B?ZHNwb0piV2ZpeHlzc2ZTblVkOWp3T3R5T29MTFBWYU5wM3lxNC95S1hrSzVN?=
 =?utf-8?B?UGwxWXptRTlERFNmYlllWVRleEFrZkxEMmlTYWtsbEIrMFFleGREZjR0dGcv?=
 =?utf-8?B?YmJzd0p3Y1VhVG5MREFKSEhxdkxiTGVVaG5QTklvVEZ5cVBMSWx3SGVTSlVJ?=
 =?utf-8?B?N3QybWxGb3R6MWI5RHVUUlZETXB4OU5xMm1oM0RnVU00L0RuRW03NGxwZnlB?=
 =?utf-8?B?R0U1Zzd5Y29BRitHMnc3cnZSRWgxYnZRdDI1WWRHREJESWhKUmg2WGdJbUtP?=
 =?utf-8?B?c3M0VjlnT1NGRGRvQmc1VXBEZW83THJrcXZySFBmSHlJdjhpeDZTVmhYR0lv?=
 =?utf-8?B?ZkN5aW1JMzhDdmtQdzhUT24zSWVsdXFuQytJOUI5TExWWmhZdHVXT3Z2YlVw?=
 =?utf-8?B?QVFwOTdlTlEyRlhkTWFsa2w5dG5pa2MyNzBic3BnSXpFeDlxL3FaZVF0WStJ?=
 =?utf-8?B?STlxSDR1QUZKTG5tSDJ1b0s5Ukttc1lWcXAwemszWmM4dDNjbkhkYmczWEJu?=
 =?utf-8?B?YzFnUCtReU8xY0g0eGUvTjVrL1cwb3N2Z3hnWHVESTkrTEJhcE5mUm50RzUx?=
 =?utf-8?B?UU9OK1lhUjBYUHJDRDJUTjRNcTFRL0FBNEVGM2hYT2hnWE1BTk5Jdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d89cb5-57db-4bcd-4a08-08de758a2f1d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 22:55:49.1500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9JPlhKj0wOWzs3uwpM5xdcEenc+iXYaxP3c1Z+L5H0RiQhklaLLeNl+RUDlmqxEJpUM9zGyyvdiAth1x4+6HYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12143
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-53643-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:mid,nxp.com:dkim,nxp.com:email]
X-Rspamd-Queue-Id: 897031B0A2C
X-Rspamd-Action: no action

Add the helper API media_async_register_subdev(), which
combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
v4l2_async_register_subdev() into a single call.

Reduce code duplication and simplify error handling in drivers.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/v4l2-core/v4l2-async.c | 33 +++++++++++++++++++++++++++++++++
 include/media/v4l2-async.h           | 22 ++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-async.c b/drivers/media/v4l2-core/v4l2-async.c
index 1c08bba9ecb91f46b7479da613d6c1688d4b0b5c..e07173f566fbd8fa332b5e58be288e806b4c0482 100644
--- a/drivers/media/v4l2-core/v4l2-async.c
+++ b/drivers/media/v4l2-core/v4l2-async.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#include <media/media-entity.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -881,6 +882,38 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module)
 }
 EXPORT_SYMBOL(__v4l2_async_register_subdev);
 
+int __media_pad_init_and_register_subdev(struct v4l2_subdev *sd, u16 num_pads,
+	struct media_pad *pads,
+	int (*register_subdev)(struct v4l2_subdev *sd, struct module *module),
+	struct module *module)
+{
+	int ret;
+
+	if (!register_subdev)
+		return -EINVAL;
+
+	ret = media_entity_pads_init(&sd->entity, num_pads, pads);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = register_subdev(sd, module);
+	if (ret)
+		goto err_subdev_cleanup;
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+	return ret;
+}
+EXPORT_SYMBOL(__media_pad_init_and_register_subdev);
+
 void v4l2_async_unregister_subdev(struct v4l2_subdev *sd)
 {
 	struct v4l2_async_connection *asc, *asc_tmp;
diff --git a/include/media/v4l2-async.h b/include/media/v4l2-async.h
index f26c323e9c963065fd7c19d6d9835df1194bc069..220a302a626732e15452f3efb19b03bdc51e64d5 100644
--- a/include/media/v4l2-async.h
+++ b/include/media/v4l2-async.h
@@ -336,6 +336,28 @@ int __v4l2_async_register_subdev(struct v4l2_subdev *sd, struct module *module);
 int __must_check
 v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd);
 
+struct media_pad;
+
+int __must_check
+__media_pad_init_and_register_subdev(struct v4l2_subdev *sd, u16 num_pads,
+	struct media_pad *pads,
+	int (*register_subdev)(struct v4l2_subdev *sd, struct module *module),
+	struct module *module);
+
+/**
+ * media_async_register_subdev - Initialize the entity pads and
+ *				 registers a sub-device to the
+ *				 asynchronous subdevice framework
+ * @sd: pointer to &struct v4l2_subdev
+ * @num_pads: total number of sink and source pads
+ * @pads: Array of @num_pads pads.
+ *
+ * Returns an error on failure, 0 on success.
+ */
+#define media_async_register_subdev(sd, num_pads, pads)			\
+	__media_pad_init_and_register_subdev(sd, num_pads, pads,	\
+					     __v4l2_async_register_subdev, \
+					     THIS_MODULE)
 /**
  * v4l2_async_unregister_subdev - unregisters a sub-device to the asynchronous
  *	subdevice framework

-- 
2.43.0


