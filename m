Return-Path: <linux-media+bounces-60320-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0KGHJIbq+Gmi3AIAu9opvQ
	(envelope-from <linux-media+bounces-60320-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 20:50:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E20D4C2C08
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 20:50:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A11513009380
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 18:50:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88023E6DCB;
	Mon,  4 May 2026 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fURn4a0R"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011016.outbound.protection.outlook.com [52.101.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC30E1C861D
	for <linux-media@vger.kernel.org>; Mon,  4 May 2026 18:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920638; cv=fail; b=NypcGBZV6LjxxmJKhT0DSBEpU5pMJER/PV+kJjyq5MutJIwBvLPCuHZsrlYp9HrMtpqG48jrnEXXQy/xMM0qLtzvoIkcih0J4VqSFprvGGYkkECCZmi2x8OfSRRZU9Kgf/xTpTff8mCh6mrxU+fZYWUgZBBTF7fH/fE5VYHk5Io=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920638; c=relaxed/simple;
	bh=3U9xPBo0qYFB34GRun+db5KGj6vLO5Ln2L22ZS+QoQU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZWpauY0C/JW0A/Gf/+vbyVRCeFaVJlRrZZHSxDqCQX45el+Q+cvIV3whpk7qyuprgyJ1iI2J1HjL81g1mhesMtBgNv57Tl1bq+rnqze5lsejKMCN8fnBaTbDHLFtXgikS0/flgG8RTMvN3jE5RXxTRauanQsySEHDEriQN1Q2Us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fURn4a0R; arc=fail smtp.client-ip=52.101.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APjPGqLMVZFgpahWglUwpUKbf1te8lP4FUgsnjb8zSJWlkOe0SZVCBVyo7BPqyUnw+zqIn7zBzef3ljjKDaIsldWOqBLWHLderr9eGFNwHz3ZDztKQQTA6M9zPWGDTrIxE1uO9l1aKxiGNbrPmG5/GGPuqed5oZ+bTPBbHA3WQ64iMHvUu0zKefBUQaCGK32EOM7dtTpbuhplIzbdqAUbUlP5mCLLcQaLKFnMme0rxxHuUXy8TT5DvES2Yo3P/pvixhRCkmzQ4nGFX+kJLFU7nQtlyVYLZuziTXJBwo4Ag8RMtWOmVGxgzfCpAXjW6yO1ojveypmd7rO1cA+MRdQYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U9xPBo0qYFB34GRun+db5KGj6vLO5Ln2L22ZS+QoQU=;
 b=uWwidqK/WpYALqWX0RPLqnMRYcRJ4npd/cNxqZoDSbIpAa/cGrbRV/31MPQbxE2MAFh84p+2hNBPnKGLiixZdCcc0fGkEXugESQoucMGO8o0Kkgs8vHz6opBi4MuoMhkz1lH1OxSdg3c1HEIfY2BYUllRy3cw4mOMRFJIEJshnZPKVqjVWsDH3Qvax0r6CXDsHLUZP+L8F+/yIynDbHGLmsOwf+Z8wSnO8oJDtRUt9fkrQdknYtVMt2PwO+7P72Us/IpjX+gPBlNAsa5sVI0hB+QsY8Tb8jzqsqDvc3WYXESdaNmSmY423HBkqcADZycokMjGr+3syqBDAQSkzVlvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3U9xPBo0qYFB34GRun+db5KGj6vLO5Ln2L22ZS+QoQU=;
 b=fURn4a0RtAPOOjB1gLcaRN8s7TPZL+dTxaScRPn6r/82lbIh8JCOASY+IgOC5sjYA0cZXpUx+ksjVFn2m1qGcrXtc0mI1p4eyIIg5HNczAqFl1eHXK762kKj2owDC8LKdRcjz55lRaZUGu55sEJFkD+SpMe0GBAYB1B4kNpMjs7icx0lOUrWaDLcYe1uQ/0csNj8Vf5X2niV7X/J8PCb3NylLjV5yaOeib0mhHuczkerThUZQD+swFK3A93UAqvwNpPDJ2GJ3fSh8BqH8R0yWaI8nZeVbWQLnb+m+SeQ6b3hAhdAPVkacMIFIfr9IJteojpxl6ktz7eSVJWyzvvNmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMBPR04MB11809.eurprd04.prod.outlook.com (2603:10a6:20b:6ee::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 18:50:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Mon, 4 May 2026
 18:50:33 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 0/3] media: imx-csi: cleanup media pipeline start
Date: Mon,  4 May 2026 14:50:12 -0400
Message-ID: <177792029135.2047204.17700922842848412643.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
References: <20251218-media-imx-cleanup-v2-0-9e3e3c269f7f@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0045.namprd11.prod.outlook.com
 (2603:10b6:806:d0::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMBPR04MB11809:EE_
X-MS-Office365-Filtering-Correlation-Id: fe585d92-c624-4185-6103-08deaa0e0554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|22082099003|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	Kp6v2cYN0VIgdvDQ/zGK5Dlx6o7sEhW3FxtvfG4bNY662UR/m2y2xCmexCtG4usFE+FEBSdgrqeJ7AHsyxL8q8kcj45YkqIWz6NBVEEqfE2mYrersXzDK6rAWp0IhrdoKGTeGDyg5V+MTEDCAx9jdqkMMPa4VI7R7s5hpGQoWDljaq178EHfthGazqUKSyQtLBmRUOli+FUUYJ0Vxrflrpe87DNjWTxxX8jxLDsXV8D0c2Cq1yIJvjQ2epvv80QeHcCFHurZTsphbVj33ZNTHibagXpwsded+0Spv/29l0pQRi629p6zfWP7+V7G1vIg6CyrWlPmp0X2ffY95oQf6OvdGfMDBvZUx+BWJFHNnXGGbuIIKR/c7/TA4KtFepYbeijHv//UAkH5oKaRizYXBZC1AldVK7nXA0IUqsw6BDX6Ek1L/I3JfSy/ZyENUVfOCIq4vRbGTJ5hwtyfaOEC6e5jVR2kMJuhgMlQwvasMJMLr02uywRF+fMVeOnoRSMQ2BOm2fFFzbte1A1gvk2XJ4PRmks0KOPtq3vGZ0Z37yllbaqjWipJAHvliz/l5F3rV/hOAd0IdpO33fMsyAzIBMrQOKFLpFd6cVMy7eymPJkIXeRi0KCHKt01kYmZMsvEjKKz5b0yUT2p9kUTsECrFi6FDSVWNyD2I1VL3+gTncz/0SZkqX9/8V3vjd9rAnPG6JFAslZJWFpGuh2isM97xsU70bz4l6mlB+XGWhUybIFS0CQcGkgW/kC9gNfs9MYI
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(22082099003)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkEweHh0Zm1kUGUrWWZ0ekhpRERKVlJWK3p6UWNjVGlIS1Y2QWlnby9QVUZr?=
 =?utf-8?B?SXFwdXBDUWIvK252SXBnZDg1ZDdmMjZVWnJqRmFYOWpyUXB5aTRIMmhxY0Vq?=
 =?utf-8?B?Y1NFUzNuUnBNYVdpWFVta1Y3Sk9LMW9pbjZkd1pjU2o5YjlxYTRYSEpocEJT?=
 =?utf-8?B?VUo2T25CRkpDSU1MWS9ZSjBTREsyand4R0hGLzZNaUxZeklFZnJlTDV5L2l5?=
 =?utf-8?B?Q0NVWmJ3QkthQk1UQzBtZkFaRWl4OUFEbDhPZVVycm1BYW9FaFdTL2NUaVZU?=
 =?utf-8?B?ZlVvUmx4SDg3aVJvV3ZHaGFDQkh6MWVXSXl1cW5nRlpRNEt6OHgrcWxUa3NT?=
 =?utf-8?B?YXhUS1BHMHhmbG5oSUd3NkhiK0J5d25vbjV2bThmR2ZNNzFtVUFQbnpVeldL?=
 =?utf-8?B?YlNZaEpUak5rWHlVUTFrQUNxaE82T0pQMmdra3dsc0ZwTjZKbEt0YTY4djRY?=
 =?utf-8?B?cm5XWUx0ajYvWXVpQ1cxKzFic2xhSFlXVkZDMGhMTVliWkVsbklrajNJc1px?=
 =?utf-8?B?TWs0OFdoMWROYURxNHBXQjYwYWdRdGxnZ3dxaUl6emhsR2JRYjlKSy85NDVJ?=
 =?utf-8?B?NmJiMUxJT0swK1l6ZXI3S0YyY051VTlZZDBvV2tiS0dXOUFIbVpIN2xEdVlT?=
 =?utf-8?B?YndIdkp1N1JLMU9aVnhhTXcxc282K1BkWUR5VnIzV2tYajdnN3B1aWV6NjBy?=
 =?utf-8?B?ajUrTVZTS0NXOUxPOEhqb2ZXN2tZWDY2ZXJUdGJ4a0pGOEdULzlSczBRbG1R?=
 =?utf-8?B?OWFuTHNYbjdxN2ZXQysrajN0b1VaV1l3VnVpVytDLytUbXpvSGZZdFFYa29m?=
 =?utf-8?B?ajNJblhmYTd0NzhqOE1uKzJoajZpYVpkb2VTcjNleDIrd3lOc0pLeUlPME5C?=
 =?utf-8?B?YUQ5eXQwYXVzVGdSNi83NjJIOEhBVnFOWW9oZkZpUkpCTnFWbnFrU01MUjFt?=
 =?utf-8?B?OEhvNEQ1dDE4dnFzUFgyNnJycWVnK0UydmVOdHFDV0ZRSFJqNFplc2xMZWpP?=
 =?utf-8?B?OWpyNTJ2dXgzaENiV1RQNGpQbHkzTi82bCtZMDg0clNBbG8yUkdWUnJTSFlN?=
 =?utf-8?B?Y1Q4TUxEcXZpRVNGbWZ2NWNVdW93VXdJejlNSy9OTG54aXBvZFk4eEx3VVRw?=
 =?utf-8?B?TTBoYVJDMVI2RE5oL2RqTlZhM2tIbEd1Z2lYc3JMSUJTVytBTXE2YlpvbXNy?=
 =?utf-8?B?d2pZUHJ4TDFnRFBnSklmYk9QYmRlUUxwbE9DZUVjbFVzZ2VtaUJzdG84bmJD?=
 =?utf-8?B?VktucmVlUkx4czFxQXJqRDZ1Z3d2bWRNbTA1Q3pwcHVZQTBqVEZEUVk0cmI2?=
 =?utf-8?B?amR2SkJpbktVbEtUTE9sa0xVelNXai91NDBxbVUwcHhEZG1sU0FMZVQwQ0hF?=
 =?utf-8?B?b1RVZUhITXYxdGRKeEY5eVJQQzY0cGY4N09BbzJxRUpVM243VWl1Y2QydjFu?=
 =?utf-8?B?NFM4dTJIT2RhU3RnclZwbXpqbkZDZkpTQ0djSG90SjdxWmJDa1g1K29icGpS?=
 =?utf-8?B?ZlNteWNMYWJHRnZXSEREM0dVVVd2bUtJazZQN2Z1Q2QzcXorNFJ0eENkc3VZ?=
 =?utf-8?B?dUV5MzZ5R1M1OVl3QzJNMm1rdFltdmxJTUVPbFN2dVlCdFE2VEo3MmZFaGNV?=
 =?utf-8?B?TmI3K3BXNjJiQ0pMeU1oa1ovdXVJcXQreGVtNTJ2SDMyanZTSmRlRmFGZnpP?=
 =?utf-8?B?OURVS1hTWWpRbVJnb1EwWXdDVk16dGRsemh1ODZrZk1SUzZqTkJTTWVMRkNO?=
 =?utf-8?B?Mk1TZURVOUtrMTE1REdHZjlXWFZ0ZEZHQTZCQ1p4NFU4YzZuVHFOK09YOXQy?=
 =?utf-8?B?dTZPMCs1anpWeWkvbkZKdUFnQkVvT1JVelNzaGlKVlBEWjB5VjdaQ203UU0x?=
 =?utf-8?B?Y3FESURRb2JYSWppREVwRG52bXIzT1d2bVZ0YzJSTXROSVNxU3ZWSUpIak9U?=
 =?utf-8?B?Q1hvaEJ4V01LMTZ4U2NKMks2Sk5OVjRKWFluc09LSFU0V3IwYjJSbFpsREhC?=
 =?utf-8?B?VHgrY2R4YUhkdG5LeG5uRjVXSVFQQ1JBWjlXUHl1TUc5YzJYMTNEdi9WNG5t?=
 =?utf-8?B?bW5ZOC9udlN0d1Z4clF4R0xUUzVzTmUrcVpWczY4VTgrWUNOUERqUGpFMW5F?=
 =?utf-8?B?MFFucUpnZDRtbkVxbE8vZk5GSWRwZjBWUnhqWWt6MWlQaU1rNG9WVGpFVi92?=
 =?utf-8?B?ZHRhQllvTGNERVJOeTRhUE54QnM4ZGdBWDFxQS94QzNrOXhYQm0xMmN2NC9O?=
 =?utf-8?B?a3dKdk1raUhJdmlNMWc2S1VZbFRHdDd0OXVMS2x0ekFrZk82TFBnYzRIYjNB?=
 =?utf-8?Q?sYgtPP3wVeTI2CEnI4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe585d92-c624-4185-6103-08deaa0e0554
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 18:50:33.2005
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTLOYSA4qBJ+Ic6iTFjNPLYQ/PyTWG/tQ1D7iW3xhaFQuvI93Qil0rp4mlDhYDm0CWZpozlHq0Qs4LX9KW5MSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11809
X-Rspamd-Queue-Id: 8E20D4C2C08
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-60320-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,pengutronix.de,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]


On Thu, 18 Dec 2025 10:23:48 +0100, Michael Tretter wrote:
> The imx media device currently assumes that there is only a single media
> pipeline. However, the media graph has multiple imx capture devices.
> These may be started separately on media pipelines if they don't cause
> conflicts in the media graph.
>
> Move the media pipeline from the media device to the capture devices to
> properly track and handle multiple media pipelines for the imx-csi.
> Refactor the code to start the media pipeline from the driver to help
> the reader.
>
> [...]

Applied, thanks! Update subject by adding "staging" tags.

[1/3] media: imx-csi: move media_pipeline to video device
[2/3] media: imx-csi: explicitly start media pipeline on pad 0
[3/3] media: imx-csi: use media_pad_is_streaming helper

Best regards,
--
Frank Li <Frank.Li@nxp.com>

