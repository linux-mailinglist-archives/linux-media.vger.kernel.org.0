Return-Path: <linux-media+bounces-58467-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UANHOD9m2Gm1cwgAu9opvQ
	(envelope-from <linux-media+bounces-58467-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 04:53:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9A43D1952
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 04:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 114923019C9D
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2026 02:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54E3B3002BB;
	Fri, 10 Apr 2026 02:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qioQbAPr"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0161C3C1F;
	Fri, 10 Apr 2026 02:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775789628; cv=fail; b=Gw42UDmJHhiapx/OXRfL1JsKdsySPze0qrvNmW7RDUUb3lIWsZ2k9C5/BqrpgzNG2KdsqB55RP63khg6eBU8Os81WCTM4DyebagIlbiC4ZtsFNTzGFwcJe/JT/s59IoX1QklR3u6GuGH6Cm7onIquBF7zytS4vAzwan/lOFVSsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775789628; c=relaxed/simple;
	bh=zkQlmZXpKKrkCBJjVZRf3twawzPnouXOiAGRn9Ck9is=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nY5bFYO9St6eQEDcf976OySmfuWJT23o4+FVfw+G9M3aaChLkEtvY4HhN6ZyuJTngn9Y4+OHoqnuHvfn8dt/d4DOGz8ojO0+ERqytEJmYo2H43FFmGs7nMRecbQgSYOGHt9eo2Oqo5ypxqGXodhB27ve7IV21pFhzzYkEnBgYKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qioQbAPr; arc=fail smtp.client-ip=52.101.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYfsstaizkIlN7UXsiwnaae5H3eIKzbaMLUXmM2Bk9x1Gupk0es8sIBrlksNCrb2VxtG+Sc4BdXFSwpMdCofDWdah+c2IIFbpmXGSPR1iEoMgl9oz2gXyIQi3QeWtyhPOImWdRKADXaOC7RsQ5BSTSw/Vb5esIIahWurNr+J+OrEU8+GVanugnze6tl+vq8D5H5/mFVjRQWIXr7GaIdxRZ3yH1WWJWVc60wq7IBe89YzIgTHfyeyuZwmQ8EAzuRs0ahSReeoy74fe16RyeRfKJBb2zctK4FXY0eiSE5+lvJn5dhZ/qjSHJWbi48Qo+S56J8Au03tHmZ9QMzMirjbeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XVEiPZxUKKwgW4QInLP2OgWFBDC3B942s2KPO5Nj4w=;
 b=iZsNyx9/WR7hKwN720cRuBtqLlJMFqeX+N7f3hVBYZY7yr660NR7PoAlozaYYqYdDCHHGw4xtZpd6G/T8Y/HFQTfBQ1FWjc3Dd0BeSjKhQ9S5w6XLmXIWnvpLMoomlkYZDZz5uvlrihlmHSIATVx6cC0u/0rxx3mnZOlSQ4hEmZWOT+PhikqQhNHmkvAznToAHVuvEAUAiZXWcxx3zPKPeD3Zdc4+98ruKhaSWAPWPwMy/FKPdS8WfbgLiWPtCzDMAcW5HWL2LBKrKmsyqh3J4O4uTUaZZV6mtsGXYxM3y5pCZqlvXhuPFnTD/pebcSo5lqofMfkr2ofV/9DHoEboQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XVEiPZxUKKwgW4QInLP2OgWFBDC3B942s2KPO5Nj4w=;
 b=qioQbAPr8+RVq5qmSGwSH1lyk3iAFbLX+4i6BixoHW2NQyxDZzcnhuipkT8c6i9dJz1fZAxEUqkdLsM06SJhIOqQXBBIaRKW/u8lQPjByWvoqkIX/k+2OlM2gs5nRxHfZh6nWmReYVr3b/REZkl87cb9iO6CLQCoLA/V/IvGUKz74EY/pkIoq29pm+EVTd7p0sveAHFhkFIogvVjVGenLMGAmImGWjDht+i1J59JFc3N4fzM7j55RNgDYsxRuMHEKG/vK80SfZeFa/GsnsLzJE2NtX7Dd/uTj92t8z0cJatdWXzbkfxnWZBor5f0EfXVsTPqdXuwPxQTSloFHeODRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by AS8PR04MB7990.eurprd04.prod.outlook.com (2603:10a6:20b:2a5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.42; Fri, 10 Apr
 2026 02:53:43 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9745.035; Fri, 10 Apr 2026
 02:53:43 +0000
Message-ID: <ea729302-6dca-443b-80fd-c1f5d9a41613@oss.nxp.com>
Date: Fri, 10 Apr 2026 10:53:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/7] media: v4l2-ctrls: Add V4L2_CID_MEMORY_USAGE
 control
To: Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, Frank Li <Frank.li@nxp.com>
Cc: linux-media@vger.kernel.org, mchehab@kernel.org,
 hverkuil-cisco@xs4all.nl, sebastian.fricke@collabora.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
 <20260331072347.253-2-ming.qian@oss.nxp.com>
 <acvbOo17tU-s20BS@lizhi-Precision-Tower-5810>
 <079b1630abe5dd22e032797fc12925c9c79ea305.camel@ndufresne.ca>
 <d8c12ba1-5004-4a51-8a2b-3d500184778b@oss.nxp.com>
 <5c24fe3f-a1c7-4fd6-b5e6-c920bc3e7fcb@oss.nxp.com>
 <8911674f2f86a4b75e1f44d6e9b66a28f6e74e56.camel@ndufresne.ca>
 <9fdca013-32f7-4ce1-a296-f2f36ef31b50@collabora.com>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <9fdca013-32f7-4ce1-a296-f2f36ef31b50@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0189.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b6::11) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|AS8PR04MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a414202-bfe5-464e-dc1e-08de96ac603a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6N9ftameJJziSAkh+kiNRWuPdJ5oMt0dif1vO1LyLsyRaSziWHL2pGde840EOoWSWtvwzFjYw/q6DdVWTMfZUWGdreN87XEPhSjDwWUbXzivrZR0/W2bKzcg+ExIpnuT5n9oJSOljYXSVZSRY8OmGKIk4mazAxlE/ZsL651GphjesjvCqpYvdS+lXn+kpZN5cfAZ/anExx6hHtscrKlIHhMDyEjJwt0HCgOX3XWjOY6Hr/cbcwERHJKyUWjyxcV7YjdGMHa+Oc4GjhBEM5RLVfR/G7TeFDH3v0q4ddcD6BZmT0E/Biq3eXHHKTr9vJp9kPdGJ7EO0aYLtsULh8w5I0oXoSDGfkAT3pUyZ849HVn5V2QA+L50Imq9M660rjXgh7trMxzh8xYU1cQ+jbTrRlRaVrJFuXkn8hqQlTLTLroQA10h3a9ao++CYkvIPbxQ65P9uli+uicZIX1T5bhlK6Tandqy2Y6WHJ0btYVl09c1/Dg0H3b4MlFpO31YPB/bG1vBOdkZBYIUOUvuGZXJvzwDM5sLyj2TGKr51z+4nctC05cOdViQYmAj9pO0GEFi2oRiEaYkTI2NFDJH+py8G3on6ZVZQ+1AjjOX1t3ZGTSRW78jurLpo2p58bcNlHSfn2yxJwRSHC1zb9K6I/4m4D8bt5OfNYiM4NwqPbOo2GSYwTaLabaokoKfMBHIcrHH9AtCmfOlm5KNN6ehETtKvBv+RiV4zBEnl7xWU2LQCc1bMji9Ra0SRAtcSDozzzhW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cld6SjA1VzVyUDVyQmljR1JXSGVoa2lSc3pCT1JETTZVVkNOS1BDTDQ1US9P?=
 =?utf-8?B?aXJPbGR5dEJCZmlENEluR1RWMUJXd2hBZW82dnFDSDhuRnRWV0Z3bTZqanpR?=
 =?utf-8?B?Z1RyT1hCOUU3ejF4MHNMMm4zMkw5aFIySmszL0I2L3d1aERacGY4ZkprdXB5?=
 =?utf-8?B?dlBUWW5QeDlMM3YwRUpVUUdvMUFMVHYwdENxVHF4S2cya2lFYW5YWkJnSDAx?=
 =?utf-8?B?QiswK08xQUJMd2dlSW85V3N3a1RWQUdtdFgzdTNUOFZTWWdORWdsV1hiSnBQ?=
 =?utf-8?B?aXk1ekg0eVR1cklXVVByejFxamdvSFpyLzcvTUxGOG5idGk0bGNrRitsRzNW?=
 =?utf-8?B?alVwRHJrTCtLWlBld1Nvbm54ZGNjQTNVRHF4V2hLU1ovK3EzNUpiWU9VQWRZ?=
 =?utf-8?B?Vkx6dHhGNS9wQUJpOFRtSERRK0hxWnZhSi8wU0dhVWZKUHpqRzMzTjhnM0dJ?=
 =?utf-8?B?d3JJS2VIcmJYYlU4SGdYU3h2aU14VzAxcGFta05mRVpHNnRyVHpBUEFZV3lp?=
 =?utf-8?B?N1k5ZXRjaHVDWExwZXFzMDhZUU1YWWNNVVg0S3VLZHpIbG5WUDlUZk9uMkU1?=
 =?utf-8?B?NzVpRExpa1phbWZtWE1JQmJSQkZLaGNNYXUxNE1nSjBMZHVJUnNoU1dsRDVV?=
 =?utf-8?B?a0d2L0cwS0VOYjZDZHFNMUxmOEw2MW1rL0NoNE40VTl6dTJCWjZYdXkxUmpJ?=
 =?utf-8?B?ZUdsWnVvOEI5eGE1dk1raVlLT2xHMW03ZWxhK0VWSXdDNW5nekxSWTFFdW1M?=
 =?utf-8?B?T3ZLaytqL1lZMytMQW5QU0RiUVFJYTlHZU94bVhhNXNsWlBHanZjWnhtbExo?=
 =?utf-8?B?bDcyYnVkNkQveGxYdTVOa0V2ekdvcUFqNTh5SkM0YkVaVVAwckRONlpoc1Ro?=
 =?utf-8?B?NmFSeWZ5b2ZRTjFUMDlMUGdZZzBDWWNwSEhIZXNzY3NGNTlZWnBycFplYlJV?=
 =?utf-8?B?Wm9JZ3oyOGxVK1d3dUJmeDl2YlpUZnhRYyt0YkF0MHNqYTg1UEVrV3Z3UW9v?=
 =?utf-8?B?TWxlVU9qeWRJME42OXJIVVl4dCt0aVdIa081dytpbk4xOEJoQS9ib3N5R056?=
 =?utf-8?B?OWRkanVhOTl0cFFKa3ZKdm9jd1pKM1gwdkExNHJ5QmpjYTNsdzRnMjBQa090?=
 =?utf-8?B?VlVVSFo3MVVqRWJGbHltcjlJamxpU3Y3QW1iOEZYLzU5bWFIa0d6cmEvdUVK?=
 =?utf-8?B?Zm1vc1BHb2pNYWhOL2VKQWpOZGRhNG52UXlTNWxoblhTS2x6L3Z0MGUvUHgw?=
 =?utf-8?B?elkzM0J5N0pacGROR0RXbytoM3pvQWJlek9kRWFMMHNFOUc4ZWNtWU1wM0Jy?=
 =?utf-8?B?WFVBU0FnZEEwRk9VaWFoRkRQaE5icGp3b1AwQ05Tc3JNVFQyNktvN2JsRkEx?=
 =?utf-8?B?c0h5SkpKL0kxVVg5WGJPRzc4QjhsM0ZCV0E0N0hJcnRlejBuQjZXbnRQWkhw?=
 =?utf-8?B?Sis0ZmlWVlV0RkxQYmFHc09UNXZMdXExSzY3NWZoQk5KbFc4c2JYNzVpU0p5?=
 =?utf-8?B?cUU0WGc2SkNDRVZ2dGlpSllFUURLSnZNVDArczlkWGZMUVdMWSs3ZHlocDAz?=
 =?utf-8?B?NmEwZTNMOFYxTnlOYmwwSW14d3BBNEVIMTZOUGlpK1VJUEZpK0drczVwaWY5?=
 =?utf-8?B?NUVadmJadG01SG5WNWtUMEtEMzRrMmlTeHJxWnJFT1hwbGs5VjNaK243ZVRq?=
 =?utf-8?B?c0ZxNFlwdEFKT3VvUXY1blIxTnlOWjV6MFArQ1V2Q1pFTWMvakxCZVJnZ2wr?=
 =?utf-8?B?WVRtQUxqV0Y1WEFvVGZQNUhmeTljMzNTeUJLUWttOVZFRForMGVKeldCM2Uv?=
 =?utf-8?B?Z0QxSnlBcmZNeDAreEYxZDBscXlkZGVHSlRlRzhXNTFWS3lMSlpNcFZkRlZI?=
 =?utf-8?B?ZkNCWU9OWjN4eWNSREh3VGNZUkUzbFpSMGdzSER5Nlo0UzVncnovZUhtTGdn?=
 =?utf-8?B?NzlLVUU1L2VvMGNLU2RadEdoOEp5UFhqV0xUK2tjUi9YWjBEVjZPWXRCaDkr?=
 =?utf-8?B?YUlZZGQrU3MwRTB2M3h6VWhLRXd3dXc1amw5VEhiNG5qSS9kcjJJYUtzNWVl?=
 =?utf-8?B?c2grK2l5LzQ4ZlVCQksxM0pocFdmM1JkRXloUExrYk91YXJYaGkvZS9SaVp6?=
 =?utf-8?B?WDVTZzZKRnZLcTBNZno3T0o5KzFUS2pyNkh6Qk5NOVlacTVwQ2o1Ny85d1Mv?=
 =?utf-8?B?SnNTa0xmK0MrYUJRZWlDRFhNUEhKT3Q4NGJ1ejdvd3VCZkxPQ2VtS1RkUitY?=
 =?utf-8?B?VGtpak41MGw1cXJZNmhyT0lRQjk1RGN3MWZNSGx5MmR0cWNjenZkem0yeWRQ?=
 =?utf-8?B?RmNZMGxWdGpnNlRxVVFXbHpNanhXSmJDbExTb3NtN1IzS1A0S3hZZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a414202-bfe5-464e-dc1e-08de96ac603a
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2026 02:53:42.9435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qu/5E3vaOFlJL/MVlfTuCL/6c6yG9pN1Anl3yPm5YFRPEW4LAop+Bi0M83/car2cC1t5EQkjMPmDy4jcaR0E4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7990
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58467-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,xs4all.nl,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: 4C9A43D1952
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Detlev,

On 4/9/2026 10:29 PM, Detlev Casanova wrote:
> 
> 
> On 4/8/26 17:11, Nicolas Dufresne wrote:
>> Le jeudi 02 avril 2026 à 11:14 +0800, Ming Qian(OSS) a écrit :
>>> Hi Nicolas,
>>>
>>> On 4/1/2026 10:23 AM, Ming Qian(OSS) wrote:
>>>> Hi Nicolas,
>>>>
>>>> On 3/31/2026 10:54 PM, Nicolas Dufresne wrote:
>>>>> Le mardi 31 mars 2026 à 10:33 -0400, Frank Li a écrit :
>>>>>> On Tue, Mar 31, 2026 at 03:23:11PM +0800, 
>>>>>> ming.qian@oss.nxp.com wrote:
>>>>>>> From: Ming Qian <ming.qian@oss.nxp.com>
>>>>>>>
>>>>>>> Add a new read-only control V4L2_CID_MEMORY_USAGE that allows
>>>>>>> applications to query the total amount of memory currently used
>>>>>>> by a device instance.
>>>>>>>
>>>>>>> This control reports the memory consumption in bytes, including
>>>>>>> internal buffers, intermediate processing data, and other
>>>>>>> driver-managed allocations. Applications can use this information
>>>>>>> for debugging, resource monitoring, or making informed decisions
>>>>>>> about buffer allocation strategies.
>>>>>>>
>>>>>>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>>>>>>> ---
>>>>>> Not sure why not export these information by debugfs, or any 
>>>>>> benefit vs
>>>>>> debugfs?
>>>>> There is also a on-going proposal that uses fdinfo.
>>>>>
>>>>> Nicolas
>>>>>
>>>> Thanks for the reminder about the ongoing fdinfo proposal.
>>>>
>>>> Just to confirm, you are referring to Detlev’s ongoing fdinfo proposal,
>>>> specifically this series:
>>>> https://lore.kernel.org/lkml/20260212162328.192217-1-
>>>> detlev.casanova@collabora.com/
>>>>
>>>> I will align my work with it and switch to using fdinfo.
>>>> Once the show_fdinfo support from that series is merged, I will prepare
>>>> the next revision of my patch accordingly.
>>>>
>>>> Regards,
>>>> Ming
>>>>
>>> Regarding the discussion about using fdinfo instead of a V4L2 control, I
>>> have two questions:
>>>
>>>     1. Key consistency in fdinfo
>>>     fdinfo uses key–value pairs, which is flexible, but if multiple
>>>     drivers want to expose the same “memory usage” information,
>>>     they need to agree on a common key name and meaning. Otherwise
>>>     user‑space must handle each driver differently. A V4L2 control
>>>     naturally provides a unified interface without this coordination
>>>     effort.
>>>
>>>
>>>     2. Lack of notification in fdinfo
>>>     With a control, user‑space can subscribe to control events and
>>>     receive notifications when the memory usage changes. fdinfo does
>>>     not have a built‑in event mechanism, so users must either poll
>>>     or rely on additional eventfd‑like or custom event mechanisms.
>>>
>>> Do you have any suggestions or existing practices to address these two
>>> issues when using fdinfo?
>>>
>>> Thanks again for your time and comments.
>> Added Detlev in CC. You can also refer to his work through:
>>
>> https://lore.kernel.org/all/20260212162328.192217-1- 
>> detlev.casanova@collabora.com/
>>
>> Nicolas
> Hi Ming !
> 
> One of the reasons for using fdinfo is that it's already being used in 
> the drm subsystem and it is working well.
> Of course, in DRM, drivers don't allocate a lot of memory themselves, 
> userspace drivers (in mesa) go through the DRM uAPI to allocate buffers, 
> making the DRM subsystem aware of all allocated memory.
> That lets DRM show memory stats in a standard way for all drm drivers. 
> In v4l2, memory allocation is shared between userspace and the driver.
> We could have drivers report memory usage through a callback and v4l2- 
> core can add the standard field based on that.
> 
> For notifications, I don't really see a need for that, most tracing 
> tools will use polling (I'm thinking perfetto, but also top-like tools).
> We could have a max-mem-usage field if we'd want to make sure we don't 
> miss the maximum memory usage between 2 polls.
> 
> Finally, I think v4l2 controls should only be used to control, configure 
> and exchange data with video devices, not get stat information on what 
> the driver is doing.
> 
> Detlev.

Thank you for your detailed explanation and suggestions.
Your points make sense, especially regarding fdinfo for standardized
stats reporting, polling being sufficient for tracing tools, and keeping
V4L2 controls focused on device control rather than driver statistics.

I'll revisit the design accordingly.

Regards,
Ming

>>
>>> Regards,
>>> Ming
>>>
>>>>>> Generanlly document should be first patch, then driver change.
>>>>>>
>>>>>> Frank
>>>>>>
>>>>>>>    drivers/media/v4l2-core/v4l2-ctrls-defs.c | 8 ++++++++
>>>>>>>    include/uapi/linux/v4l2-controls.h        | 4 +++-
>>>>>>>    2 files changed, 11 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/
>>>>>>> media/v4l2-core/v4l2-ctrls-defs.c
>>>>>>> index 551426c4cd01..053db78ff661 100644
>>>>>>> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
>>>>>>> @@ -831,6 +831,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>>>>>>>        case V4L2_CID_ALPHA_COMPONENT:        return "Alpha 
>>>>>>> Component";
>>>>>>>        case V4L2_CID_COLORFX_CBCR:        return "Color Effects, 
>>>>>>> CbCr";
>>>>>>>        case V4L2_CID_COLORFX_RGB:              return "Color 
>>>>>>> Effects,
>>>>>>> RGB";
>>>>>>> +    case V4L2_CID_MEMORY_USAGE:        return "Memory Usage";
>>>>>>>
>>>>>>>        /*
>>>>>>>         * Codec controls
>>>>>>> @@ -1476,6 +1477,13 @@ void v4l2_ctrl_fill(u32 id, const char
>>>>>>> **name, enum v4l2_ctrl_type *type,
>>>>>>>            *min = 0;
>>>>>>>            *max = 0xffff;
>>>>>>>            break;
>>>>>>> +    case V4L2_CID_MEMORY_USAGE:
>>>>>>> +        *type = V4L2_CTRL_TYPE_INTEGER64;
>>>>>>> +        *flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>>>>> +        *min = 0;
>>>>>>> +        *max = S64_MAX;
>>>>>>> +        *step = 1;
>>>>>>> +        break;
>>>>>>>        case V4L2_CID_FLASH_FAULT:
>>>>>>>        case V4L2_CID_JPEG_ACTIVE_MARKER:
>>>>>>>        case V4L2_CID_3A_LOCK:
>>>>>>> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/
>>>>>>> linux/v4l2-controls.h
>>>>>>> index 68dd0c4e47b2..02c6f960d38e 100644
>>>>>>> --- a/include/uapi/linux/v4l2-controls.h
>>>>>>> +++ b/include/uapi/linux/v4l2-controls.h
>>>>>>> @@ -110,8 +110,10 @@ enum v4l2_colorfx {
>>>>>>>    #define V4L2_CID_COLORFX_CBCR            (V4L2_CID_BASE+42)
>>>>>>>    #define V4L2_CID_COLORFX_RGB            (V4L2_CID_BASE+43)
>>>>>>>
>>>>>>> +#define V4L2_CID_MEMORY_USAGE            (V4L2_CID_BASE+44)
>>>>>>> +
>>>>>>>    /* last CID + 1 */
>>>>>>> -#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
>>>>>>> +#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+45)
>>>>>>>
>>>>>>>    /* USER-class private control IDs */
>>>>>>>
>>>>>>> -- 
>>>>>>> 2.53.0
>>>>>>>
> 

