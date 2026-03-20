Return-Path: <linux-media+bounces-56473-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yId8JETsvGkL4gIAu9opvQ
	(envelope-from <linux-media+bounces-56473-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:42:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F992D64FB
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 07:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4BB9930D7C7A
	for <lists+linux-media@lfdr.de>; Fri, 20 Mar 2026 06:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A280B329C7F;
	Fri, 20 Mar 2026 06:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jhfsUa+T"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013034.outbound.protection.outlook.com [52.101.83.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6A7326D44;
	Fri, 20 Mar 2026 06:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773988849; cv=fail; b=aYwvmKbvgsVHz+IVH1mWdwE4A+l97LpO5jPh7nBULdeSnIMKnYbGz2zFwseQf7AaXzfwkOJ+K3rTsEFfvAIFtrWKj1spGo02goRR36PiII3cHUnby43oyhE6hiHpgb7M77i6d/dd0GqLo3kqogKy9zxCIbvm0r8f8LBrObL0OgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773988849; c=relaxed/simple;
	bh=ZmV/Ats/swMNWHwGTWT/AeFqR4opJ2/dvliygOgvVVE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fGpwmv6YS6D8FgN8jWd9EPR/ku6m4ySzigygykdGMOt27ahca8kjbPCMxTgjhd1PzO7XhXYlenO8VMf59f8HUi7Pm6YfCZ+fiLfFyiW44ZLEq73MY4ODk6joIJE2qjq6Sj1kCvWuYEwaHHRCCZOhI/Xzkuxp0vb0euVQ739zKCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jhfsUa+T; arc=fail smtp.client-ip=52.101.83.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XqMA/vO/eh37jQc6XdVAjVUXZxizLSoY+UBNQCR2a8ikO5eYkc1YtVu3NP579on6hiur1qVTEqRawWsgFq7nEpkcA/+Ir0/smxqJSoym2UYb32jbRVe48of6XRijslZlvIBPSH66l4EAshOSDD1JcO56EZIrNrAhaSIGQtyJw0Tn7e7JebWdljFcFBOjZz9pj718n0ZYXeedEoXyBI4J/aVdHYxqJPdJE5Y2WU+e17eeB3VjmHjLYOeiVCQVl3cSmtxZXL+Ktj7jCAMh5atqHj0AfrM8HMKbh3Z77LifnAHxjIojOx/cfQZaYTEp2pDdWkYh0WW9IYHWrl6o+hFd2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJ9UZNbsFleYPF8KHSEmsVwWium17u2ebLnNwWUMs5g=;
 b=EKlGw9WTvqsJd8KtF6q9x46ojlrKEpZnQAMDzqnImDTLjC1bXz5gmaPnF1UW1XxAQEyJkYGt0Vo/YyqX4ASthg7WmRYHH44Pz9CD7kfvShuYBPKF+JHRmdsYThTxsKDyCfKxU7WQBHBw1lzaNBkmBEwm2dD3KDya2t6OQcWhNdmJhkf3FsYpoX5h6dQHxDaStYCdcAPao+ZOOmLPre2XEU6OGd3pUanLQede/DptSX1+9jzx1rb2v+qBLCF+KkbdnX0jnnSLrI5DM5fYWT0ucxlSRhCzm9L0OlZsfpVfK+MBsyTAEcrvzTvHot3MGIK0OiJDHetbUjppun/CqZG3zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJ9UZNbsFleYPF8KHSEmsVwWium17u2ebLnNwWUMs5g=;
 b=jhfsUa+TOFT43KljME+9RX/B6RYWSTJQHZdB1mkxp3+WomVH4EZJ0uuLYq3hF4bsb6rmT8voPCmYJZseCYZxYKr9tZHDH2QSN+0Wail2sO1w3Fywnhln7UNWJuiBHp8An0gHw6LcneWEl7dAc3ByqIJ1CUboIyT0o935cVtZZ+Th8QcKddVrqAHlepVn3Haa7rGq4oJ7x8gNYmZRCBSiAB4wsezT6FfFYSbHshTcUJFPjrOBrara3eykQqqa9GLSEg7ZOoVbDa8PahSPi5sFGZMT0Glns4cHC9NLlT3fCTLpTQOREUMd/QjyCkd4xF5ZPwFuoGE/whnl4RU00K8TyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVUPR04MB12196.eurprd04.prod.outlook.com (2603:10a6:150:33b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 06:40:35 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 06:40:43 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 20 Mar 2026 14:42:02 +0800
Subject: [PATCH v3 2/2] media: nxp: imx8-isi: Prioritize pending buffers
 over discard buffers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-isi_min_buffers-v3-2-66e0fabccca3@oss.nxp.com>
References: <20260320-isi_min_buffers-v3-0-66e0fabccca3@oss.nxp.com>
In-Reply-To: <20260320-isi_min_buffers-v3-0-66e0fabccca3@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, Christian Hemp <c.hemp@phytec.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexi Birlinger <alexi.birlinger@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773988967; l=2569;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=B/3N0ziSABdGKP+asmczHUn2xDi/g2MG42Xv8i8MLlQ=;
 b=9YP+QK4aDnLQgOcat3mjyJu3jUqPGfi7eH2TEYFw6BWmTZ6m10yiZt6QS4mIpkTSOP6oLecFP
 NvU1vnEo4nEDsJGzK92WrA5bvKdQ71I+9mtUbjTtDxs1DJjOCGy2SSo
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::14) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GVUPR04MB12196:EE_
X-MS-Office365-Filtering-Correlation-Id: e29e184f-d5e6-40bc-1df4-08de864b9bf7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 g93Ah+1ok9tuxYfEgSnCPlWOYbcwxXNpyW/2ODGkrVT9RLcI1R7TuOyCt7slLi89NidN13BCYdUBmuUNqKjMzpZ5UM9fJclysiK8RJyzmcwPKkVOionJe+v4FcWbWxn3uz5CXzFw0e7KNLawZYrcZ+NmxPEpjN9g0Qkt7WZ1qcoAfqJXNkjxhT4DLg7OswwRdHJnphO3Bl401+kWYSQJbds1VTgUKfDqgC++ZygdCZgjeDGKdxTUjA/Umizuf0ZkXnN147hrQco9Pep2SQyRCFJrzyAFtWvdA09EgoHHWfxcw9VGPt/71ETVs6JQjrxZKohVwivA9nKho6lwecuaWXwBs5xoliQ8qYAgo8aI1L0PBHTJ8TIn8w/XUE5EayHpvHi0yETjaqooUFLYonh+Rxq1vwAOeUMapiWB+AAlUFLbSA9DdAaVBNIMdca+BzCIpdVBrI1s2qImiPWWpzGWY5+EqBZx9YM4Yd5VIzFpXHefHS5XmF7+4BySOecnUj+uytluj710wK796fKmU9TjV3fHDIgaI+e4JXgaPY/ipRioF9ap74wF0O+ZdqSZyEwYa2NwIxJUof9yHBXMmRajhrifa185iiOy9WKXRcYk8PsCOZKjV42gZluPp+Wlz3AsLKahzb8hSt5T3Mxx+/jCUOBS6OONvB4T05Bh2h9bGBfTKtVAsI7piKJDesVmXclKS97k6clZocSOFRwzA3IrZuqJfJBGSt8pyBt10XpsEV440ChjR++pKFt2aFS8+qre
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WFVpRmsyN01NeVN2SkFvNWFpOXhUVUhUV3Q5bzdRcjBmbnNxem5Rb3BPRzdF?=
 =?utf-8?B?ODdqNXdCL1JnMDhZTWE0bWhpTk9qL3Q5Z2c3Nis5RitYUUVsNTQ2TGZGOUZT?=
 =?utf-8?B?UllKLyt1dFlhVG5JVmRjNVZHMGRWcnlMZGplR3Y5YllRZkwwMDFFWUcwZTla?=
 =?utf-8?B?NnViODVaOGJtdzEySk1SZi9MVXdOTGtGaWtORjlSQTVQRzhQR09RUlpFVGZk?=
 =?utf-8?B?M3Vya09HRXo0Vm00RkViUGtCL3ozc0RrRUtZQkt6djNaVTlKeG96OTJ4S1gr?=
 =?utf-8?B?NHI0TmZmKzI2SU54OVR0RnRMOGE3MmtJUlVGMStPcWgzT0J5SnNucjRHb29Q?=
 =?utf-8?B?cnFHbXZydkxNMEVEZVZvc0lRUXJpSWlFUlBqVXNSQnZqR2xSR0p5TVhOSlpT?=
 =?utf-8?B?N0sxVmpSWmJzK212c1U2L1I4QmUrNVlWQVB5QlhNTXZVdFVESGU5WDVJMTJX?=
 =?utf-8?B?dy9aSEdZc2thQVFzSHVVUXU3N1dyRXRTQlU0ZlQxZEJMRWRhODcydWF4SzZz?=
 =?utf-8?B?b1d2OHJWVlEyL3JuR2RqeUwwWDhpME9TVHkwVmdrL3Q5U1hBMjF0dXU5Q0E4?=
 =?utf-8?B?RmRnVkFac01kYWtRRjhGc3ZMRlBoRkNJU2lFWGJ5SzFsV1RRRFlnZHU0S0pt?=
 =?utf-8?B?SjZyR3VkcGRhRmJkLzJQQ21GTjQ2bFhvU28xR2pCUm1WNExDRnplVkVNMUVB?=
 =?utf-8?B?d3A3TnRDWmN2bGJhajZyazRHSlJVTVNEeEovTkcyMzdVT0NQRHJqMVRwMUR2?=
 =?utf-8?B?WmJDNTljRmtxdTYxTStZTnllWXMreXNTaVRlQjNtVFNObnRiWmpqRVBIWWJO?=
 =?utf-8?B?bC9mY1U0Y1loL3N3TU5lYlU2OU40T0dTRHFuVjdKT2lGblI4OFZMVk1pcnZT?=
 =?utf-8?B?bHU2ZEJMZUFEck44YkRGZEl4aTlQMzlkZWpycGl0Y0hKVVVkaUNLZ1QxS0hu?=
 =?utf-8?B?Z1ZSQ2RpZnd2MFBvOWlFcEFIRDBsT2NBa083MlAyVXIyTkljdHZFcm9MNlgv?=
 =?utf-8?B?VEFmaDNlZ2FaY1AyNFlUSkpUR3VZRFh2bjBMbUhsK0NOMFp6ajZYSWwwc2dS?=
 =?utf-8?B?RzZRcG42cktaZmYrYXFIbWxLa3hvWFZpNW5TQkRKaDdJaExnT2o2cEJsVnJy?=
 =?utf-8?B?NUNUMzBYd3l6UGNKV3YwR0ZXbENkeHJwTVM2TGgxYmlrQk8xZEFyVzdMTTJK?=
 =?utf-8?B?YnhZZkpGbWp3MFU1eXpBaVVwOUpTRFduRjlnTDB4Qys2Qisza1BhVGtEbzUz?=
 =?utf-8?B?dXN6Y2E0TmgxTXl0WDdkbG03QjBkTll6WWdpcDdudWwrRys1M0xwcU5tT0hS?=
 =?utf-8?B?TnhSUlRSYTBrRGE0ek41UVBGQkgrYTc3dEZ5RWtYOElUR2wvVUNYbWVYaC9h?=
 =?utf-8?B?RTZhWk5WT1EvMEhVUmxvZW5rZlVYYUFzYVMvU1BVQ3dIREpleGFnbU0vemor?=
 =?utf-8?B?aUJhZGFBQWhYR1oxWExQdVNiWFJZYW11SnV4VDlxRnBPVVBGZ0tXdEp0a0h5?=
 =?utf-8?B?UHBnUVdFLy8rRDFCQzlTNFdwREpDM0N6NkI2MVBXaUdJM05Id0c5N0xlNE1p?=
 =?utf-8?B?Wm9KTGFnQ3VFZzFwOHpwY1kvemNDbkRTWGpNWEJNdHBVUlBDSnRlN2NBd0Ux?=
 =?utf-8?B?MHF3NHF5MWVWRTlQNGxOTFpNQ1FiclRIS1VKRnJHL1hzNFpSelBUTlBjMmlr?=
 =?utf-8?B?UnBHQjBQZGlUeW5iUXFVSEQ2YWdBTDk2QXhvTVZHUFo3cDBVZmY4RklheUMz?=
 =?utf-8?B?eCtLa3RVTDJOYWllbURZS0g3VlU0TEdWY3NRRnFHMlExNTJWdW1BMWJPbUZs?=
 =?utf-8?B?a1B4eFJIYVRLNi9TVmt3Y282dTNjTW9ucWhpZzdEcXl0TSsvTTZYV2w3SDky?=
 =?utf-8?B?WTNVQWdJSFNQaGlFWkRHb0R6UUFMd2phaXpPRnJhSG43SHNkeG44MUduS3Rt?=
 =?utf-8?B?Ny9qZkFZWHVGa29MZXpOU1VrblI5c1o1UExFankxVmkxeDE3b3g1eDVrVW9C?=
 =?utf-8?B?NWloZitGOG9oWXRTVjE4TTMxSmpMSjdsZC9YZXp5YnVUaTZMOURvTUFMaGZW?=
 =?utf-8?B?WkUvWmVPK05EdWZrU2Y2VXZoTUxBNExhMzZKNzRNUnVoWUNGWlBFdFJUL0or?=
 =?utf-8?B?YXdPdWNjWDdiWW1keGtvamRKMUw5YUtTT3E5N2pvOW1MR05PUWNTa0VQVXRo?=
 =?utf-8?B?bEJZYTNkSWxrbGI4cEgzbGd3VHpRNDFUQmhoRkVvcmhWc01vbnRVRDBmUHFp?=
 =?utf-8?B?NnRkbHpLUWUwei9uK0luTzBucUZFaFFNRWNpZXdtendSdGJiL3VKMTU2OXhT?=
 =?utf-8?B?YUxHRmpJMlJyeHR6cUhVSFdkRUk3eXIyMXFZWE1URndYQ2wrZTdJdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29e184f-d5e6-40bc-1df4-08de864b9bf7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 06:40:43.1831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6PoKS+D3Sfc0im6BaWQEdxV8mfv+rXX1ffQsw4xP5DGIv/bt10M29Yv+dvRn5d3UrVSj+dFAYUrG8EWN/Addmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR04MB12196
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,phytec.de,jmondi.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-56473-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: F0F992D64FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The number of times to use the discard buffer is determined by the
out_pending list size:

  discard = list_empty(&video->out_pending) ? 2
            : list_is_singular(&video->out_pending) ? 1
	    : 0;

In the current buffer selection logic, when both discard and pending
buffers are available, the driver fills hardware slots with discard
buffers first which results in an unnecessary frame drop even though
a user buffer was queued and ready.

Change the buffer selection logic to use pending buffers first (up to
the number available), and only use discard buffers to fill remaining
slots when insufficient pending buffers are queued.

This improves behavior by:
- Reducing discarded frames at stream start when user buffers are ready
- Decreasing latency in delivering captured frames to user-space
- Ensuring user buffers are utilized as soon as they are queued
- Improving overall buffer utilization efficiency

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v3:
- Expanded commit message to explain the problem in current driver and the
  benefits gained from this change
- No code changes

Changes in v2:
- Replace "This ensures" with "ensure"
- Put example from commit message to comment in driver suggested by Frank
  https://lore.kernel.org/linux-media/20260311-isi_min_buffers-v1-0-c9299d6e8ae6@nxp.com/T/#m2774912ed31553ef1fdcc840bd6eae53a03ecccd
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 1be3a728f32f..77ebff03323a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -792,7 +792,14 @@ static void mxc_isi_video_queue_first_buffers(struct mxc_isi_video *video)
 		struct mxc_isi_buffer *buf;
 		struct list_head *list;
 
-		list = i < discard ? &video->out_discard : &video->out_pending;
+		/*
+		 * Queue buffers: prioritize pending buffers, then discard buffers
+		 * For example:
+		 * - 2 pending buffers: both slots use pending buffers
+		 * - 1 pending buffer: first slot uses pending, second uses discard
+		 * - 0 pending buffers: both slots use discard buffers
+		 */
+		list = (i < 2 - discard) ? &video->out_pending : &video->out_discard;
 		buf = list_first_entry(list, struct mxc_isi_buffer, list);
 
 		mxc_isi_channel_set_outbuf(video->pipe, buf->dma_addrs, buf_id);

-- 
2.34.1


