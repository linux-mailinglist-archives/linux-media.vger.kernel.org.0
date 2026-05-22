Return-Path: <linux-media+bounces-62622-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KALYEcBtEGqgXAYAu9opvQ
	(envelope-from <linux-media+bounces-62622-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:52:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 950235B6812
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:52:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 00BC6307FD72
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 14:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7848343CECD;
	Fri, 22 May 2026 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cJ3YkWf/"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E973C2E0B5C;
	Fri, 22 May 2026 14:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779460276; cv=fail; b=PvEtgTMdZaBfy9d4CK4s0L2krmyVBUSHG9A/LiAnjMNy1PraIqtWd6MmH7Lgzrklf248EGoV+dzTH17NM74FEqCpvCMRK0cRyo2Om9r4EZsUX97+25DcT99f/i36TokgF1tSuamx1CT2AokbzB+zxht8wOzrtqME467kwKxIgOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779460276; c=relaxed/simple;
	bh=JB8WP8633ne3HFKWxOjCyYGU38SrP0MtTHX6fG6VZhk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FWZW1hbHt821km9FlOb3o0p+Eqdb3CImI2mj84oYH2WQzmrd45zMD/lqV7djz2n80aDRYkhtd9EZ+H5HiUXWY+yiiSEhtYZ8bsDxjP8rnqeewRLXDcXySacg4xXOziYwczm1BjaGVaYDcQm+rsxWnY9n6wGJ9PbHrPJQ7iXuVT4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cJ3YkWf/; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jc4rqqyZ4YmsmEiE/zadDA69MxtM+q3L07mI/CJVio5wvf9J4HW6gp6z+OaaQR6zKxLn80S1xEgCioRR/BpNl1WCtmrPEA0+8uSz4P2BWFCVc2Ea6JXThbaZbn10NtiEk2Zpy46KzLJ1zHnCITY9yYVJIihlaZHsAD7JoVPMg4aSPyEj9hZUAOdfTkL5FxLXxpGiERHSoiVfhC3xZGAkH6fkghwZH6EsxaEQMcZW7NPylXbkboznp8rK2LC1/fe4+ADY6S2hfpGjXIhgrGGpaKxXqCa/zcR2Jt1xFF7mS+cnWKbL9S+8lNkBCYyGa3rsWOp2r6X0SXyXltHt0F3vUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M7XNHWSOP0TujWgjSkvcwWntBxgFp4ohL9xTTglDZ3M=;
 b=lH5s43yEsK8dfJ8rAgArhlVEzqktQWKMY4UkjTasmCw/+vKtYhDfi+DBBe+xkqnJ/51327OuiBwWPhkFjwziyyLsL6W0hUeJUNBhywH7tn9u2Wf0Fmgr9WuHBlx4QCW2YO9q47aviuhVgYYbOk2SBIRG+IMm5U5/EQaUZYY7fyumUaO36jv3CGvtnNfqr4nkBiufW2VM+50VT84qR8scS+iyGI8YM5B73Wh/do/E3hW9WAHubd92JKZFCw0+tltoBNvmFMhP9sIopTDVH+f5fNSBCCZ11/4b6reTq8hTBg42ThYnYdXJGUKhlmU5pnPDCFlXFj8hGHZPifxbN2DREw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M7XNHWSOP0TujWgjSkvcwWntBxgFp4ohL9xTTglDZ3M=;
 b=cJ3YkWf/nZU3oqB/Ksg2p/dAj3Zhl+EnFvLdWRt1hhy/zU1HvA+PDX+HG+Vm2MCmBQ6VJPAeCaauDLnJzemHsb0Fw7uydp7l2wWBCh+MPF/FX9nh8XG8ZbZyVB+TzMMwuBlT1EWsUoqKZ+ZfPhmf7gTnl92L3XnlqtzPYehCJ3Ov+QaY3WLvp12fT6t3lehjWu0LeWPk0jU+7HLGt1vTVMfIV8d/mRrtV63ityX9BP7DnatYoC5tXlMbATKuvZ45/MGCU9ANcu/K+JFECJfnpNEBJRhAC069zB9LFW8bHGYVG2YjFyqIxolENgFyd+jlVS7lay0F5tFrSOfizj5Btw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by VI0PR04MB11724.eurprd04.prod.outlook.com (2603:10a6:800:2eb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Fri, 22 May
 2026 14:31:02 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::adaf:805c:51c5:9538%4]) with mapi id 15.21.0048.016; Fri, 22 May 2026
 14:31:01 +0000
Message-ID: <162ce21f-bff3-441f-bc97-b1d20d947458@nxp.com>
Date: Fri, 22 May 2026 17:30:58 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: v4l2-fwnode: Fix subdev owner overwritten in
 v4l2_async_register_subdev_sensor()
To: Frank Li <Frank.li@nxp.com>
Cc: sakari.ailus@linux.intel.com, mchehab@kernel.org,
 laurentiu.palcu@nxp.com, robert.chiras@nxp.com, guoniu.zhou@nxp.com,
 robby.cai@nxp.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev
References: <20260521122646.600179-1-mirela.rabulea@nxp.com>
 <ag9S0pUw66MDUxRA@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <ag9S0pUw66MDUxRA@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::6) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|VI0PR04MB11724:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f440867-0ae2-48e8-e37a-08deb80ebfa4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|19092799006|11063799006|56012099003|22082099003|18002099003|4143699003|38350700014;
X-Microsoft-Antispam-Message-Info:
	z+iL/vBqZ62ERTUKruhTnp9cDVo8g7vTLb0O43bg0iu05bsXaUlhtYq0+ONNRvA5QmncTNapP6ogxN1j//kOGtVkRP5lteaC9hnQgRRrV10rYRsIWwMLX2zsXoXm7gYqFkbx+uyFbXlNBe5cUG8qL7d1cTL/5lZ+F9W48MftQ1vhMrO3eJ5azPjAsOtLpcWeCFtbGGjqRn3wOmwBjbx2/KjakSiwVoAJb5AHhqmAU/duLWfzwlOUxvd0vhEZ8uNKC7Ydf4RUeBXuJglFfdS4rU7gbJl/D3DE3NsCCWkTdezidte5mWJPmfObU/qaHOnZDMLJafr74qwhWNWHhgAOUp8kb+62ullR+aw39+hX33gXVuF7gQx7vgqTL/bamopoBuVU+IcD2txPM7eFDzy85+yeKsqqRzlTmNxgHkLZoxXWkn5J7j8JjbCviBPF3K2Zrkpcx5oaKiF+qZKS3oYxf9XwnioupvFlxLVbgKNxzrkgLrmBocRis10O1XM10S3HtGbJr7HfBuW6BbFuctXYEzq3lMpOD7MWb0d5nRfhfNvs5BWpVUQCVPQKYnuGp0B6/7kPmkldxLwCFaodAwPxfV2Za9ANmWsFmRqpmlu9RcWV7RaVx53Vu71yEZhd7/UXyeSiEbZfZmgfEUpI2pN9evwsqSh/DH3vhsPM/f4ku/SxpUKH2oRa/nn0DCU0vjha73tOmJT4vTR67mJi1U27OJzrSwpyVH7jf3jV2SD4IQ3WDtH+NwqTvXXbwUe8zLrZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(19092799006)(11063799006)(56012099003)(22082099003)(18002099003)(4143699003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Smt1enVNbEdtZWZQeDdjZTdFSDVRUzd6em5kVGticUdkbzJvenllK1JHRmsw?=
 =?utf-8?B?azYzT0J2em1IVmZ1eGRja3ZWcXIrbExLRDMwMzBKWDgwVGt0OW85L0hSTy9h?=
 =?utf-8?B?QlZoUTl6ZUp5Q28ySGRyQmpTc2p2UEt6Z1VXTWRpNXJWNmFMd3c3Z0tpZG1E?=
 =?utf-8?B?TW8zemhXdjFic2RxeXF2WXA3MlpqZG13V0licHNubmhnbm1qei9ZY2gzQmhS?=
 =?utf-8?B?dDM3RVJUVlpyc09pK1EvVVQ1MzRhZ2RnL1I2ODJQMWlFbTJxVjc2WFZWdG5S?=
 =?utf-8?B?NW9HWTZwb2JZSHdyUVl0UnJjL3NmZVp5QVRmZEhjamlHZGxYSk5FZ2NDYUJ6?=
 =?utf-8?B?c1lVbUxnb1NGaHZIczg1Y1QySHBJK0VvTi9FYVF2RlNWWkhpL2JVditHb2Rl?=
 =?utf-8?B?cVp6bHFrMjBJWnNnWjdBM1J2bnV6RC9XZWNHVkhQRzFtMWhNZFY2ZllGY1Br?=
 =?utf-8?B?YUJKdWIrMTI0REU3VkM1cUFSdnRQUXdCcUVkWU9NQWVpc01icXZBWG4vZFMv?=
 =?utf-8?B?R0s0L2JFdlpiQ1ovRGVaSzJTeTVnZkREMTBBYUY2RDlkOE1KbHRMbDlXaHNv?=
 =?utf-8?B?amdEbnlGRFA2NW5QTUN3a3FWQnExRmlaUGwyU3NGZWkxZmh1Y3VtVzQ3SE1K?=
 =?utf-8?B?RWlRV2VhTmlKbDREU0NMdHcyT1pPdEJ4K014c0tHaUIvcHRoa2JsalMxWTll?=
 =?utf-8?B?c0xRV1M3NDR4NmdrMXpIN01mTzBkQVdET1ZyZnVqV1BKUFFxcXJYSWtuS0pB?=
 =?utf-8?B?bGtOTm1SQ2wyZnFueWQwSEtQYUp1UnE4WURIVU52QjU2QmFNNHF6WklHTnVy?=
 =?utf-8?B?dWs1UWJYMENJRDRjNmorSm9zYjMvd0F3bjh5QTlKU3VIVEZNSVFUZFZtK1FR?=
 =?utf-8?B?d3gxb25XdWZRQS92TTd0MnBJYXdRNHJDRFZIKy9Cc3dxTDhvNEtkT3BXOTF2?=
 =?utf-8?B?QkhCb2xRV0RCby9DZG5rZUd0dDBaVFJEcisxbE5xYkhod3ZaVVBiRW4rTXUr?=
 =?utf-8?B?dmFpd05xS0d6S2dkT2ZhVzJxTEVRQjkzdk1FMVE0dmxUaWNnUGYvV3daR3J5?=
 =?utf-8?B?NHZGS0VlNHliWWhhT3Vrc0tIaW5sR24rcHFaUHVFVS9LSTVOMG5EWjYxczUv?=
 =?utf-8?B?K2xuNmE1ZFdPOVJHeXFISUlLU1BQNG9VRmJNWnBMYXVDNVRSdnZMbnpKeWxM?=
 =?utf-8?B?U2MvT2oxQVhMemJneTZETFM3Lzg5UzFMVldXUUIrbk9iNWJ1REFPbHZCNWdj?=
 =?utf-8?B?NnJHTWpMUmlpOTY2RURiQnc5dDBmY0ttR2UvSjJZcVJuV3ZENCtELzFHZFRn?=
 =?utf-8?B?TDRLQ2hZUTR5LzNZbEVTUWJmV2JwdTNIdlVQdnU5TzZpZzVpZE1XenJPbkZU?=
 =?utf-8?B?L2NXa1hyNDk4ZVRjb3lzdW9mdG5YdWtEbk45UnJndmdpUFl1VEpQK2lsU05U?=
 =?utf-8?B?SWtrYlYvaWY4SlBvV0FyVkdnNEFLc2JBR2lYc0dpQkRlZUxGZlN2OEZFQTkw?=
 =?utf-8?B?dGpaLzJ4TENZZ0hJZzE1QnRJTE90dTZGdzBvOWxHNzltWHpuSS90MnBwbXhC?=
 =?utf-8?B?MmoveEhERlJXQVJOM3NYUE9zWndjZ1Brbno5TzhvM2lzbExwUnFuYVRpUGsv?=
 =?utf-8?B?V0NyZTcxOFhaL0lXL240amtWVDd5T1d0alZmWVNYUk45YmNxaGt6TXhqUXI4?=
 =?utf-8?B?TDRoRTVLVzFXOXN1MHgyUStTMUNBblk1cHZ0aEJCTjFqTS83RVVFZWpuVFRw?=
 =?utf-8?B?UlNaZUV4QjlPT3ZLRG9OVVUrTE5SbGRNZHJvcTJPQzk3dW1oZFErUE1TQVJQ?=
 =?utf-8?B?YTYxald1bGF4SlJaVnRuenZOQUhQZFJtTldFZ1dzeHdRZUVuR2RqbEt4ZTY0?=
 =?utf-8?B?WnFFcC9ndzNic3pRSkx4VWhuNTJoZ285TG1yS0ZRYzdMTDM5bHk1N1M1Z29M?=
 =?utf-8?B?amtvSWY5K0l1a1RWR0JMbWsveFpGeDlOZzIxN2pheXlVNmp4T2gyRCtEU3Bz?=
 =?utf-8?B?WHVBUGY1K1Y2cXQrdENoUXB2bkVPRkUxOE5WWURYYWxzc1Y5d1J4aHZVQyty?=
 =?utf-8?B?d3Z0SGNnd3JGU3NtQm1ueVpkRXN6VzNsNTI3VHdsK3dUQkRCRm1CTjlaejNK?=
 =?utf-8?B?ekR1QlpFdXJZNVI2aUFPTW10dkZPTnEwRXZwMHAvT0xmc2wrOG1YNkV3TzZ0?=
 =?utf-8?B?dDljOUtZR2oyb24weGNURit5V1A4NzJwaGdLVFV2WmxyeGZCNUxHUHFtbjhG?=
 =?utf-8?B?V2JPT2Z6RGU5NXE0SmxneUM2dTdReSticnFnMWc1SWwzZjc2V3RtTGJTQXdM?=
 =?utf-8?B?M0RNRTA0eWEwTVlIRk9Ia2FuOWIrZUxrQmxlSG1Ea1VsbXVwdWh1dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f440867-0ae2-48e8-e37a-08deb80ebfa4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2026 14:31:01.9040
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nvbkz6Sq6bbEDfYbL/amWDXqFh+AKVogcd0thAQiXx8HLnaSwFKlsmKdVtWotUYnkVJpgSo97Iqcx52wtajg2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11724
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
	TAGGED_FROM(0.00)[bounces-62622-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mirela.rabulea@nxp.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:email,nxp.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: 950235B6812
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Frank,

On 5/21/26 21:45, Frank Li wrote:
> On Thu, May 21, 2026 at 03:26:45PM +0300, Mirela Rabulea wrote:
>> The v4l2 helper v4l2_async_register_subdev_sensor() calls
>> v4l2_async_register_subdev(), which is a macro that expands to
>> __v4l2_async_register_subdev(sd,THIS_MODULE). Since the macro is expanded
>> inside v4l2-fwnode.c, THIS_MODULE resolves to the v4l2-fwnode module
>> rather than the sensor driver module that originally set sd->owner. When
>> v4l2-fwnode is built-in, THIS_MODULE evaluates to NULL, which then
>> overwrites the sensor driver's owner with NULL.
> This is problem. but this patch can't resolve problem 100% because
> many sensor driver have not init sd->owner before call
> v4l2_async_register_subdev_sensor()
Thanks for the suggestion. From what I see, all sensor drivers that use 
v4l2_async_register_subdev_sensor() also use v4l2_i2c_subdev_init(), which

sets sd->owner. However, since your proposal looks more robust and there 
is already a similar solution accepted for v4l2_async_register_subdev(), 
I will send a v2 with that approach.

Thanks,

Mirela

>
> suggest solution like what v4l2_async_register_subdev() did
>
> rename v4l2_async_register_subdev_sensor() to
> __v4l2_async_register_subdev_sensor(truct v4l2_subdev *sd, module *this)
>
> #define v4l2_async_register_subdev_sensor(sd)
> 	__v4l2_async_register_subdev_sensor(sd, THIS_MODULE)
>
> Frank
>
>> This causes the problem that the sensor module's reference count is never
>> incremented during async registration, so the module can be removed while
>> the subdevice is still in use by a notifier (e.g., a CSI-2 receiver
>> bridge driver).
>>
>> Fix this by calling __v4l2_async_register_subdev() directly with
>> sd->owner, which preserves the module owner that the sensor driver set
>> during probe via v4l2_i2c_subdev_init() or direct assignment.
>>
>> Fixes: aef69d54755d ("media: v4l: fwnode: Add a convenience function for registering sensors")
>>
>> Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-fwnode.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
>> index 77f3298821b5..57284b7adddf 100644
>> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
>> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
>> @@ -1282,7 +1282,7 @@ int v4l2_async_register_subdev_sensor(struct v4l2_subdev *sd)
>>   	if (ret < 0)
>>   		goto out_cleanup;
>>
>> -	ret = v4l2_async_register_subdev(sd);
>> +	ret = __v4l2_async_register_subdev(sd, sd->owner);
>>   	if (ret < 0)
>>   		goto out_unregister;
>>
>> --
>> 2.43.0
>>

