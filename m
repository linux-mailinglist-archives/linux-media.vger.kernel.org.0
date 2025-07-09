Return-Path: <linux-media+bounces-37188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16596AFE6DE
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 13:05:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86C83189CBD5
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 11:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE24028DF33;
	Wed,  9 Jul 2025 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X1gWigZU"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E9428DB7A;
	Wed,  9 Jul 2025 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059072; cv=fail; b=EHYAr4dou4Yrrj/duJB6waMmpTuDDsGvc4AIgC8AfHCtkBsdPqv6e/rCCsnpib14yuzYlGp7mXkqN7B//ccGgTSvOENqhXuEG1AEW++SDL1AfJQgV6w5h/lXomhfkchCz1jF+NOlNLXZ7HcoJzXxpT2yJTDXrEzO+EF/YYi0AsE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059072; c=relaxed/simple;
	bh=mYXGCdr+Nn6RnikqqT+sQYeDMqho+zjx7hdGataXWJo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q2rmt5wVRKqCqsdhtVCSJja377i3Pl0MS31IjZxqW7xc/eimukWGpy1bj0wdouo1wKxssSZm7OMudjInMo9BumdxAD5D9eo0VjfPo+Cq/msFT0DatUxWhTCGizJTE4D28jU6zBJLqMtb2K/V+HDCEWB7vCEY7NCUWFmouWIr/o8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X1gWigZU; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xZ9vmHilF7zt3jOOryvBlJqs+1C103NFU35c21bZ/5A+VAxcA+vmlaUeq1Jms9IGSVLpYxqCdonPXWQOSDzJTMZk1B6lF8m/gI+C4ueCDHmXxaePceqImpFJMY7hXSjoH6AQ8UzMfunnUBND6KO87+E7BfeoqUP362vR4gvHHSk03sDmNhvCJ/VxcO2CYBUhH4aMSTdyg7rmN3RgiPuGAHdJUCZHjaAUQ6LTXmAdHO18NilJvC7wewEhqfKSPZKjqDCTj9TlMNWhWWbhNYXzSCe7q3PvIc9+f1Cldm6qT1MG7S07w9cxedv6vq3tQIjGLVz6XfoN7s315Vp6j56prA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GtPWgBlnKAI5HVwrntSA3JiGz5CajyLOMSsPEIve6Bs=;
 b=H7fGeZXU0SN8I31662QP038/2n/ThrdgGw5IstowzEUHRMSTeQBzfRwdOtWkgd9EbsboNOdM2d1BgoLElWRVyx7EmlBBJNSo4N58n5mV/IzXmw4y7jdGJIm9csD1Nekf35ifmdr42+j9nlZuuTf5VzSSuGcj7FT2ggAJUlARLBkYQIPDkb7UJeMLXVF1N6rOs49FwLSsw0bPOHHdhoocqj5eLKPdat3ONPZnPBUtT6GtGM9gtFF1OUEoM3pxHb8ebcFKMNSSwsVD4u8Kt/Gl4FlR1iIRL06DqnZyES8aUvv/Dqtm/lEsjMnN1/BsbVFa16san+1yTaAmUGPZDff5Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GtPWgBlnKAI5HVwrntSA3JiGz5CajyLOMSsPEIve6Bs=;
 b=X1gWigZUq1e2h3PuxEAS1NVyTL/MT+koBchWNP9wDAx/Ykv/A7ewWQqrjKLRPQQ+EkdQcNBORkKNnF51pgS4yYaTTqMPZQMgjwDGam8qPwIvZbvdXBKiHMZBVIq/ePnELZ09tWHdbnEe7aBA0pMfKj5XHWtN/osVyR6ALZNn4QwpgNxbOB1jeKjnyQjbTeTRKb5OIQZkZu92xMAKgXdSViyEHjqClIBYsPrru3lrySpJcHo3C/GtDWy/XLnSFRu55pzQtqyg3qz9vTpguFXlrNA5HpjwSG3/XgL2Wzr9PhMb5CqE0jFqYw8TMq7+3h3sP44jBg4+QHNwaVhKSBEn6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DU0PR04MB9466.eurprd04.prod.outlook.com (2603:10a6:10:35a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Wed, 9 Jul
 2025 11:04:25 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 11:04:23 +0000
Message-ID: <50c84bb1-5761-47c4-8e32-dc873456cd5c@nxp.com>
Date: Wed, 9 Jul 2025 14:07:03 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH v4 2/4] media: ox05b1s: Add omnivision OX05B1S
 raw sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, robh@kernel.org,
 krzk+dt@kernel.org, bryan.odonoghue@linaro.org, laurentiu.palcu@nxp.com,
 robert.chiras@nxp.com, jai.luthra@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, LnxRevLi@nxp.com,
 kieran.bingham@ideasonboard.com, hdegoede@redhat.com,
 dave.stevenson@raspberrypi.com, mike.rudenko@gmail.com,
 alain.volmat@foss.st.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 alexander.stein@ew.tq-group.com, umang.jain@ideasonboard.com,
 zhi.mao@mediatek.com, festevam@denx.de, julien.vuillaumier@nxp.com
References: <20250305094359.299895-1-mirela.rabulea@nxp.com>
 <20250305094359.299895-3-mirela.rabulea@nxp.com>
 <7c4379dd-e004-4e0d-85db-139c3f671edc@linux.intel.com>
 <3df6d174-ce7d-40ff-a7e0-fb9e8a9ab435@nxp.com>
 <aG2tECZaT3IsOV0z@kekkonen.localdomain>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <aG2tECZaT3IsOV0z@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0431.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::19) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DU0PR04MB9466:EE_
X-MS-Office365-Filtering-Correlation-Id: 62dc6239-eeda-4f34-15fe-08ddbed85cae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHZpcWkrM3I1Smc2RzdKcCtiUm90MHJjcGo5RlhkaHpBM2F0cmEwaDZUNkdW?=
 =?utf-8?B?L252aDhXWmZuZnRjaGZCVmVCUXc5T0F1TWZBTFc4Vzl6NjlURjJ5QkQrb0hw?=
 =?utf-8?B?U3JneWwrZ3kzR2t0emV2MjlQS3ZDaFpkNExoamVCMDIzcG1vTi9BakVOS2lW?=
 =?utf-8?B?U0M4Q09WUjdTVmxsZjFtdENhWFhFa0h0U2liNmF1VGtlekFFM1NpUWZQT3pt?=
 =?utf-8?B?d0RnKzkyKzFvQ0VJU2UzSlNITCtsM3A1dUh5MFA0M2hxS1dyMGU0OVZGeklm?=
 =?utf-8?B?cDlWMDNZQ3BLRGZTeHYzUDhUZmdnTkN3S0tFeDZkd3Y0L25sWGtmZGVoSmhm?=
 =?utf-8?B?ZUxSUzZFL1VrYkluWEZHb2V5R01iUGpoeUUzMkE5NEFKUWhnTW5XZWNhVXgz?=
 =?utf-8?B?VHE2bGtOR0kwSlp4MVRBTVFXRVc5c3l3bEI3WmFwcE94NUloM0FhQnRzQTFU?=
 =?utf-8?B?Tmh1ZmJOM3hqallzODZ5bFd0WG4reTFXS1ZzZ0FySENZa0pmUm5QV2xnYklH?=
 =?utf-8?B?cWI5V3RBK3VDaGdUSTFaQ2FJWjRKZXh1ci9nSkQ1OU0xVm1qTGhDeVI2VGt6?=
 =?utf-8?B?Ky9yTkFscTRZMDlzNnF2NFBLckYrMENJR1ROT0NXcWFWOHVTNGxnTG5XUTNl?=
 =?utf-8?B?OVlnL2xOUHJZbERxSjZSdjM3M0c2RjM4OWxLUDVYOWpjem1qSDJndnlWMkF6?=
 =?utf-8?B?Qmsxc0NscEdMb205bkZmRWdjYTRTQmxjQ3BienJZOXcweHlmelU0eUVzV0pM?=
 =?utf-8?B?TmpkODNBWUFsODlyTExvckplY3haZmJBNHJDUmR1MTduU2k3ekt4NTR6enNE?=
 =?utf-8?B?clFwbm10S3puZHdFK2tjTFVHa241VXRDYmZtODZvMC9JcGRybU5kZkV0bVZ6?=
 =?utf-8?B?bWpRaDdJNHhKd1dqVVJhSGFyWDdlZEF2MzI5RmNvbXZieVRlTWl1ZXdkZ3E3?=
 =?utf-8?B?RENHZVB0ZmhkYWthamNUbE8wQ1VPSG9hYmxQNm5PVFRZNE5KSUpSMUREdHh2?=
 =?utf-8?B?UndOUDExN0ppcTcxSmlUV1UyMGRBRTNrVm5pQ3c4anlUMmh2M1VLaEFXZE5n?=
 =?utf-8?B?czdKc1liUmhBaU1ZVWFPVUxtTnRWeHgyaXZiWTNLUGo4NWs2MjJUREU0MmU2?=
 =?utf-8?B?SWhudVhoSno2cnJtdklJT0RaSzdtQmVLRlB6QTZ4Um9nelJBblZ5MkgwRW9j?=
 =?utf-8?B?SEZtQW5wOUZvcUR0YjgwNFU1elZCazFBQWQ2Q2pERlBkTm5EYnE3U0VHTTJr?=
 =?utf-8?B?V0FpM1h2ZSs1S2pvSUF6WUlWZ2N1VlQ3S2NNKzloWkhUc21iQnJTMGJLQkhZ?=
 =?utf-8?B?amREdVBxQmsrREhhMTM0SkptWFNMMEdkakdCd21KVGFmYVU0ZXBHU0Q2UHRw?=
 =?utf-8?B?Rm5ka1JXUEZMSjVZS2lkZVQ4VDJlZEE0bW5nMnJyRCtaMTZOWkIzUEFKM0dX?=
 =?utf-8?B?bVlkeWNITWRwUzdsdnQwbWtRQ0NSZXNZT2pVT2F5aDhPNExNVGNIcTFFdFk0?=
 =?utf-8?B?VVhNTzkydU9MOWVIV1M4QmU3V2k0NGFvK254TFVYdElaR3MxVG1seWgxQkZ0?=
 =?utf-8?B?eUd6aXVLS3c2NG1FSDBlb2E5VlFzNHhWVnFaT2NXRWZqb2xvcUlEVkVsanZS?=
 =?utf-8?B?TmZranVRV2dXM0hWR3YwZG4rOWtRSW9CYXFZc2dlc2FObXhwR29PaEttRG9i?=
 =?utf-8?B?VWZVa2o1RU1lbFFQb1o2cmZMVmRnL1ZzV090cDZLWFZ1VENpanNYVHhTSXlH?=
 =?utf-8?B?TlR1M1llckZTU1UzenFhclVxZXZJc05VVGZDc0Rjc05VQnpuL0NXTmx1KzJO?=
 =?utf-8?B?dmROTVNLTE5oaHVLaG1ZWWZBVGdKVFRyWS9sYXRyV2t3SXJaMVZhalE4cEFL?=
 =?utf-8?B?YXRpSUUrQWwwWElpNEJTOEU2amNCTFNOUFhmS3ZldEc1NlNYUURoWFN1TWRa?=
 =?utf-8?B?UlMzMm9oMWNqdkxnZmJLOU9FbTl4QjBqYnhNZjJDZEp6Y2lnNVlMWjhiSXdX?=
 =?utf-8?B?ckZscUVkYWtBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckxCRGlqY29Pak1iS1Q1MDNlT0pzSmZGUGxPY2FyR0RjRzBnUit5RXFyMzBh?=
 =?utf-8?B?cnpTcFQ0NjVKbXhQNkE5L3FDVGpnMW5GT3JMWWhhWGxpSnZkUXlDRDQ5SE1J?=
 =?utf-8?B?U1ZrUlNEREZWVnNMWmRpVFVESnlKMXIzWEdmZDJ0cXlTTSswSnpFei9HUVJr?=
 =?utf-8?B?aWpLR0VjMnpjWWR4S1ppekdtNWlJbEFYekdKQW05elB5aFZPM0Y3czdvM1VR?=
 =?utf-8?B?K1VzSGluNWhNYUgrbE1sRGJCRjl6aFBMT1VDSHVpTk0zYjlER2pjTXcwNXNh?=
 =?utf-8?B?Q1pTRS9kOWViUWx5Y3IvT242SjBOL2tMSTRmQ0NVZXhnTTdwelNXNnNMUmZ6?=
 =?utf-8?B?K3ZYZHR3VkpqVnZSTk81NE5hdXdKNTdvS3FQcjZPems5aUNWM0xwVkVWNWNp?=
 =?utf-8?B?Rnk0azBkWXpVRmhEV3VGVlhOVzc4N2R5NkNGYk5BZkpjcnExdkd5Zk5ON1Zy?=
 =?utf-8?B?U29qNlRZVVNQZ3phOU9JdFBrWW9wOXVWQVNqeVE5V2xqSGtYMktRTzBBellL?=
 =?utf-8?B?YXpUQ3B6N3BZYzVNOG1nSEw1NVRFUUR3V1dVTHA2b0M0Q0FDbzlVMURLMmlE?=
 =?utf-8?B?TUZCWjZvd2VjQzZSY0JIZmdlRmRwK1lvZ1dtMW50anJ5d0o5QkN1allLdlhp?=
 =?utf-8?B?MC9Yc2VVdlNvTUNCaFd3ZXpDdTZ6d0U5ODIxQzcySGFPR0M1djUvU1JwVTZE?=
 =?utf-8?B?b3BnNlZ5emV2YjNtVjByT2lLT1NIdEptMngwczhoRXdBS0xldnhUN25hT2pS?=
 =?utf-8?B?cUFpQ0JkY0Fob0E3YWJ6cnNFNHZFWGdhN1pINEZWalRiRUtDeUxkRS8zOVpD?=
 =?utf-8?B?R0d3Uklocm9KaWsyOForNUx5clpzd3g3aUh4MFFObFZkZVpLUzVUM1dVcVUy?=
 =?utf-8?B?Z1dMRVNwWFNQbzN6TTcreVhkVnVpMlZOdGxGanRwdS9uVm9zbXBCdS9qeGxL?=
 =?utf-8?B?Qys1ZFVVWkpRNS8wczlOR3RyT0ZYTjBkNExva25FZzZkcHB3RDlFTVkyR25V?=
 =?utf-8?B?TCs2UmlweDhiT3JNTnFFT3dDMjZEOGFZMEhNYVNvT3JPZUtwMnB0MVg1L21J?=
 =?utf-8?B?NnFkSW1LK2Z4NmoxY2RJWWxmb0xMRWpPZnZMb0FmTHBxeU5nUDBSc21QWHd0?=
 =?utf-8?B?VzJEYWQ4cHd6ZmU0cTNWNlRCSkphTlhTeGNsc3ljdUtHUEg0T1NFUTZjMmhh?=
 =?utf-8?B?bk4xMUc5dFlzQVhIa1JuektnSmtjQXVJWFVFdTRXNjBVYmc4akZxYWt0OEJs?=
 =?utf-8?B?TTBncFRLMzRjY08vT1pMZkhuYnpERXpTMzFiY2xjcEtCUVhsRjNMTjM3NlQv?=
 =?utf-8?B?YzVzL2lDRURJRUVMTE8rRHFqeVM3cU1CY0l5L1lkWFFtQndIN21KaTI3SWph?=
 =?utf-8?B?bXl6L1RpZFJ5NlNDc1ZrQ3RaZ0JOMlhFT2JLVWlBUVg5NVF0R2JNaDdEMXR2?=
 =?utf-8?B?YnRCdUNtTnZ4Y3paYlNTd3JZdXl1U2s2eXoyMWJzMGRtcGNzKy9mblJMczhO?=
 =?utf-8?B?VzRYc3Y4VTdNVUJDUmswQmFNaVc1V0ppMzhyU3VBazljMXJOb29oZ1pKM3c1?=
 =?utf-8?B?VUdPc1UyelJ6SHMwNGt2TnYvMzBKemE4bEFVcVBZS2VoWElEZEgxd1FZV0hz?=
 =?utf-8?B?bWtZM2orRmpDRkNrV2UxaW0vcklZWCttUkxJVDJOWXVheXFwNS9vSGtOR3R4?=
 =?utf-8?B?aUFGMmNBQjAvdlhxVXYzR3BxdnRGWTBXOEc1OXljNW8wRldMYUpkM2RHd1dY?=
 =?utf-8?B?ZS9DTEFuZVdGTFhFSWdqdkhoRjl5NHFScms1NElQQlNZcUloNGh3d1pmb3p6?=
 =?utf-8?B?cVNob1oxZUVuK1drOXE0MjBYWXJyRTZjZ2lKQmREZXVGK3g1MjhzeW5uM1Iz?=
 =?utf-8?B?eG9WdHZlOWZRdDhQdEY5dVcreU5tZEVsVUNLT0J1eVVWbE5iV1JVc3VqbTdP?=
 =?utf-8?B?Nk5SRTMydEhBMFZaT2V6N2x0czZkSGp0MDJ6UXZTV3F2OG9DNTVTY1NGOSta?=
 =?utf-8?B?NzZiSHd3ODRMekxaakxxSkllcTdZZzkveVQrR3J2VEs1TWZxRnNHcjZvOUtr?=
 =?utf-8?B?UCszRFgraWdza2o5YUR6VUNBRjNwQiszK1FUTDhTRUYrcUg5N2tqRTZPRXBZ?=
 =?utf-8?Q?g04vvRRUWLR6VXJ/KGb7/Z7F+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dc6239-eeda-4f34-15fe-08ddbed85cae
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 11:04:23.7619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzX5lw47wJgEZra+glOo+ycR45K8QEWOxZlHWINt7c3dOeWAf/G/DmrN4Z1hQks8dRLZfjx1XkE02Fdj8LEr6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9466

Hi Sakari,

On 7/9/25 02:43, Sakari Ailus wrote:
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
>
>
> Hi Mirela,
>
> On Tue, Jul 08, 2025 at 08:09:25PM +0300, Mirela Rabulea wrote:
>> Hi Sakari & all,
>>
>> On 6/29/25 11:30, Sakari Ailus wrote:
>>> Caution: This is an external email. Please take care when clicking links
>>> or opening attachments. When in doubt, report the message using the
>>> 'Report this email' button
>>>
>>>
>>> Hi Mirela,
>>>
>>> On 3/5/25 11:43, Mirela Rabulea wrote:
>>>> +struct ox05b1s_reg {
>>>> +     u32 addr;
>>>> +     u32 data;
>>>> +};
>>> Could you use struct reg_sequence instead, please?
>> Yes, sure, thanks for the hint.
>>
>> Any other suggestions, anyone, before I send the next version?
> Do you intend to align this with the common raw sensor model? It may still
> take a while until we get those patches merged though, but the upside would
> be there's on concern of backwards compatibility. We should discuss how to
> implement HDR with that actually (Laurent is cc'd).

Yes, I will align with the common raw sensor model. By that I mean I 
will use generic Y formats and the CFA pattern control (already switched 
to Y formats in this  v4, did not experiment yet the new control) and I 
can add streams and routes as soon as internal pads are merged, we 
already experimented with that both for os08a20 HDR and for ox05b1s 
context switching, both using multiple captures on 2 virtual channels. 
I'm also planning to send an RFC for standard controls as arrays for 
exposure and gains, as discussed during the media summit, that's 
currently under internal review.

I'm open for discussions.

For this driver, up until this version, the HDR support is minimal, it 
is just enabled/disabled and tied to the existing control 
V4L2_CID_HDR_SENSOR_MODE, and still only 1 VC is exposed. When we will 
have internal pads and streams and routes, we can toggle the HDR control 
depending on what routes are enabled, already experimented with that 
(the HDR control can in this case be optional).

I saw you sent v10 for generic line based metadata and internal pads, I 
started looking into it, large patch-set ;)

Regards,

Mirela

>
> --
> Regards,
>
> Sakari Ailus

