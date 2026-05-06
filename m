Return-Path: <linux-media+bounces-60626-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIkgNoNa+2kuZwMAu9opvQ
	(envelope-from <linux-media+bounces-60626-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:13:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DE4DCF69
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 17:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 969F530E30B3
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 14:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21BB947F2D4;
	Wed,  6 May 2026 14:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="mTn7E55w"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F011147F2FD;
	Wed,  6 May 2026 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778077494; cv=fail; b=I0bpbC6mFD8gjDosnkTC7KIhfbNz+liGKMai31at5S+siJ7QFZSSXn7rVsvJIVDwe/o9ibwMgtvrtoe6OGqRQziol7xOfn8oUU3xo114QC8nCRDr1y1fOfxYdSMl0/trUXbvr3A/12hGhaQj3ATy++3DPXvAqppAhQl8ZOAemGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778077494; c=relaxed/simple;
	bh=JteRYK/v9dW+zyQNpgyQXyCMW5Cw4nugzfgxD8G1j/4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BuhV6rQ2xgfc5jSCJ6XGNK0+f+bprt0IvNB80Hr+FURBeVSyyz1NAnxjAVkCzmXPUfj45BR9hmDTlL2fFgfvsLASz7xEXrIm7bTjixiTrEub9own1tCekXJn0w5iZi+OSsIaAhAkAB40Try9/Zx8EneJVSnlkEuXyeaEsCfhL3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=mTn7E55w; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 646A8e811427617;
	Wed, 6 May 2026 07:24:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=psc/e2qYiOVjyzcCzujXt+jvxMJcOPQ0DacvtW8sLWc=; b=
	mTn7E55w2pPQHWMwumsne03ijKuoCr4AAEeetlVDux1ZmXBSW9nU17+1YjF+tcV/
	6tT4l82Ghv4jFH5XqHIbgvxyz/tfiFgGkLDOIdamZLCJABtUP69kvoCJ8QyBX6Va
	KXGw+bZEzi8X3mj3UHm+e5EDIgFcq9wCfpNFobJxOOG9cRhOlve84FRq0t+8yH+T
	S14SWZ7AykN36rg+EHKhB9rvxzWo7SBHvYPkwaIXPmGZ49i7RFc53NEmbjFjDEEE
	2IciUKtbCBIQrJ9uarBBVqwvY7+rqMQX+DVFtNRHBss1TgNGsE/X4rTyw5Dm5RUm
	qWUqvAcQ5lqesM69QJ5NAQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012035.outbound.protection.outlook.com [40.93.195.35])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsdcsx6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 07:24:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=evJwz0J5bD98UKiWEH46nDoUOy7NCyptI5ImWamHsZIfFzZoNFko/skqgWYiQVoTeyFun4U/HLbmAsXZ6Bd57RjKNwW2JT4hpD//cfqfJmYWUykfCZu9VnJfeJLQqji94Q4jYDr/AkUoVE2CPMYcpuKjBVH1uS3d5dV5NruoRK8ckfmUK2frsQbSHrOkwHGaa0fHFa0eIceVrhJGmczAXSfo77c1BwaSJwB1UvOEwGKt17jIgUdbEF2KCicbaaRTL2DL6TX77Sx9KaN0JhGWTfhaWEYfgRCBgpLM+67gOfCkoFiXFtGxs40vHnHZzqeaobstgiSckUeKIiZA04XVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=psc/e2qYiOVjyzcCzujXt+jvxMJcOPQ0DacvtW8sLWc=;
 b=YVOHbXsis1FOTKfzM6DGrdqOd0JjohcQdBwuYaRJYjztosyLMkmSAZvblbTcqF8mpgWJqwDtuPl7ynlnnbDxsDbDN/u0ucQn+iLG5bZdJh7FlEIDENMxChrOX6ebQCTorte1Bh6phiXlBQl+yjx4TC+vfBXglC/CxwK6ZEnenTgF7zHC+EvTu4UMY9m4AuEUxsaa0IVteL8Oy4zJ2r9GJDc6J1gB8aBYb3uqtq4V2cPfeeukUe71JctIkUCh+OcJRHUAIxYKjlNJGDsL6g4thMyy6vQsL7gtu+2fMdJxX2RQetMLlfwcVTPPHwnJidu1mOSx62FfWTlYiPcqz0+M/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by PH0PR11MB4837.namprd11.prod.outlook.com (2603:10b6:510:41::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 14:24:09 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 14:24:09 +0000
Message-ID: <b4545022-0f5e-4a42-84a6-cf0f7a0a0cdd@windriver.com>
Date: Wed, 6 May 2026 22:23:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] media: imx8-isi: add missing v4l2_subdev_cleanup()
 in crossbar and pipe
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, Frank.li@nxp.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
        jacopo@jmondi.org, guoniu.zhou@nxp.com, s.riedmueller@phytec.de,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
 <20260506031210.2769998-3-xiaolei.wang@windriver.com>
 <20260506123541.GO1598374@killaraus.ideasonboard.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <20260506123541.GO1598374@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0149.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::29) To SN7PR11MB7017.namprd11.prod.outlook.com
 (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|PH0PR11MB4837:EE_
X-MS-Office365-Filtering-Correlation-Id: eaac417d-ee4b-4019-71f7-08deab7b2328
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|376014|7416014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Lo2qF6EJYPnKCIZ87ZmgWuFvr+wh/C07ZLdJX0lZQco729QNrLZPDAcG8F0BNpAGx/iJd2YJDsG4SaCgPmxqjFCSlTZXSqovrDbKyLiB+b9aU6tkpqbjV05tCKdmxcbSoId1YEkgkSozn4tiWKqv6tvVW/imxvSyOzISxOedCN1cG1eWlVX+azFKPq8Q+jFX3QIIwA9UEfanS1J7aeL4CymWxizUvC9UuZI3swRW68zDpjC+cTo5NdTpJAi5yrwESEANSgg3172Ymk/Dbq91RqY1tNfnS0vHy8CZBdMvxGEBxb8DR/ksoR65YZj+gnZkKEjzfFHc0XUKlINf1Wv/CJkaHHi2L28G8dDEwV3ywM0Hv09GpM0mI0Xe/hSaXCtCaLaXUG/RtszFb0/Q4FgTk5kK5hiJ06kXJjq8zCE0STIrpzWJD7ZwBJULGuzms2oIhkMppvKV51fMjr7cJBd4+NutnFwBy1+KtWnhCzqlZifGouRZ5migIB2ypQMJ9pfLk3ECBuAEEPqzimi3jTqFZqHY0AdzzqNzGhspkWCBIGvKxzNs01r8VgNBj0T8lLzVKHgZ+23CJu0YXImBl51UbssAhIw1g2Ye+KJ8jb+ILhcNGx7Zk3kW9ZdK/ERPUsFCoF8jm2s0vWNbwqEfJyDeTKn+wKzNDHmwwzi4bT5qQQX6N/5+ui6Z+IJOi5fEMH1M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2Fqc204UFJ4cWJ6OFIxbnBHZUhXOGd2SVRPdVl6WTlIZlRpeG5ONE5IRmdM?=
 =?utf-8?B?TmwvQVZwUlRYdFZzVDcyeG9tMHlJVE5YOXduWFN4cXZ4bEdva05uT1gvRlpR?=
 =?utf-8?B?NFI1MGxSUXBPNmcxMysvd3o2RFJyOXlJbUQ4bk1JbENYeUVDaFFZMFprZVVO?=
 =?utf-8?B?T2RZdUYzam8zWS9zSW41Y1F3d1pMRUdOd0hWVGh1bzR0dUJZL3hTdDZxYjcy?=
 =?utf-8?B?WVVJSUIyU1hIVW1ZdFJlVnloUUg3Y3JUR1pOWVdXb0RrbjF6NnNDRDd5ZWtq?=
 =?utf-8?B?d2ZWYjNjKzBqd0lHTG8rZ2dZVTdWNm5LU3VselJtam01ZjJrTXRlZnI5KzhJ?=
 =?utf-8?B?MzlseUd5SHBlczZkc2lDZnRQU2JMVjRxaXJ6SnVqSk1ZbkZPdHd5cjgxc0FP?=
 =?utf-8?B?TWloOTJ1bzdsUmdPOE1DV2xmS3p5T1VzMVdRSUYycmNmbDllVHBtS09YQUlJ?=
 =?utf-8?B?ZEhDczRnSGpNdWdkMFJtbjYwVkNnUkZZL0JrQjJDYWhnZ1RoYUkrV0ozRXF0?=
 =?utf-8?B?amdCUzUyc0hZeGJHWDQvRFZXczk2OHVNYkJ5MHZVSjdOR1hadXNCTzVOVXN4?=
 =?utf-8?B?Qys5bzNydU5qS29MZmhtN3dvaXpTeDlzRlFTellQZXBDb0FobGFaaDJvRkZa?=
 =?utf-8?B?cmxTUk5PYVpzem1VNE1zWGM4bXh3bHd2MUtBNVdDNVB2cGxTQzBkMTUxdTRM?=
 =?utf-8?B?Y3NMYlRoMUZwYlNqb3F3ZUZ6Ly9MZ21WZDQ2TGorYkMxNUhqZUdpWjhvNmpF?=
 =?utf-8?B?Z3JCMi9LZUFKQTFKOE83bTZxVXdoLzdNMXpEQWZQWVlXYUhaOTFpWGU0NE9W?=
 =?utf-8?B?QVZ4dEpQbnhQaE1BVFVwd25UbGtTUC9Xd2Jka2dIL1pQb29Ed21tQ1lBdVI4?=
 =?utf-8?B?UUVBNUI1amU2aWRibnUycU9FVjhPT2Njajk2Mktac2s0QVhsOHBHNDNROHE5?=
 =?utf-8?B?a1pXWU84VzZPMnJZZW5SQW5ST3pjUiticndYRWVvSnZkZytTd0RZa3ZzUkJm?=
 =?utf-8?B?ZC9TY2gxZE85OHU2RzVnMkRTSkszRHdjQmpNMWc1SzRpZHFPSHMxN0VJSGVx?=
 =?utf-8?B?T1N1eTlQYUxrWkhqWmdvbzBDTnNjQ2xIRzQ1alM2cHVqSlh0QW5pRytSMmZy?=
 =?utf-8?B?T0tFRm5VSlpFWENsaXNKN1lRYVVlbDcyaHZ1T0RKR216em4zSmMvcVFyN0x1?=
 =?utf-8?B?R2tVendwV3lQS1N2QVlmeUZZUmlrSDlhMnV3ZG9WOEc0R3dVYmcxN24wd3k5?=
 =?utf-8?B?UnpJZGlsVUFVOVpia3ZUYmdDU00vOGY3akg1VjZocEtkbWxzL2tOMWZXRXNi?=
 =?utf-8?B?bzR3WEd1UGluQjg4MmVyd2N3Q2NCSmxuZGkwSUk5UTEwdm9xcUZiSXQ2dURF?=
 =?utf-8?B?dFdjUnZVSmczLy9qT3NiSERISUF3NjllblJzZURBUjcxbFNTRGFscThDT3Nn?=
 =?utf-8?B?cmMzSU03L1hLMlFjQjQ4ZUdCUndpdTgzUi9qZ2VwN1kzRHplajNYanUwekVK?=
 =?utf-8?B?dkRvZDJFZlBnaWJlK2todHdXRFdaZnJaZExSVnpKVnlUVW80alhYUm1ncGZw?=
 =?utf-8?B?MXU0SEpxc1lFUFlvcjJQSk9IVHZ5Y1R6TFY2a1lxZm92ZEdyZXhIQmQxUzhD?=
 =?utf-8?B?UnFqUjBDWitlcU9mQ1dETjhta3ZtakVia3dBSHArWmY2RDV6ZFVMVG9IdVhG?=
 =?utf-8?B?cjBHdUwvYjN5MzFlUzNScG9HN0Qxd01lc2xhNTdBbWV6QUR2UGh4bm8rczFB?=
 =?utf-8?B?OTgrUi9WbGJvRDdUbHlZc28xbGF2ZHFQWkV4UzI3bUxMQXFLbWZkNUV0TnpB?=
 =?utf-8?B?ekVzMTZqa1ptMjQ2ajBZZ05YTnNrZVhPaE5sWmlBSE8rTkhSWVNLV0lFYWlO?=
 =?utf-8?B?aWNrWTdBQ0swRWZuVmhGeVIrRkdFWWprRDhhM09pUGF1bS9lanlacWMzM0lN?=
 =?utf-8?B?UE9EK3QzNWhoQzdReksvNW1zaEU5aGJDc2pxWmMzK2tuUGo0VURUV0I0QzBk?=
 =?utf-8?B?WEhnR0hKeTFxTmtDR2dPNGM0UDVZRFdoMlRkNHNwamtyQTR6NFF1RXE3bTFa?=
 =?utf-8?B?QXM3QkdUM0Jmdk1iSnVKcU1RR2tsUzdvajRsOUxqK1RrOTNQdnJIcFBFYzlk?=
 =?utf-8?B?QkZCaS9pN0tMSDd1bnY2S3BIbllicWZrZmpkUzRxdFNkRGxhUDBnSk1ROXl0?=
 =?utf-8?B?aFpkUlNyYXpUaGo4aHl3S1Rrek9RbGpzclRyWkMyMXRQNlB6RkZUNDltMnN5?=
 =?utf-8?B?aGJkaGZmdm9UTHdObGJiYjAyQ1Nyc1hRTDN3RlBFUzVlVGZGcENycmkzeWJM?=
 =?utf-8?B?QkNhZjhadjIxT1pxQzdCcHNpZXNCTTdKTE95SFQxeUdTckFrM3ZhSm45dVJt?=
 =?utf-8?Q?1E6mvxl/WJgMlS2ecd9iy+ChDR3SpymAhn7asXb81DtET?=
X-MS-Exchange-AntiSpam-MessageData-1: vWzW8aXRUJ7S8Cemr7a6u7D7pC/YfGiPTkY=
X-Exchange-RoutingPolicyChecked:
	WqlYvgzig2xjaXPlNzMSOhaGTHbe/mXvZd1meFqlPkeBxhhbEBK0z+fky1bCZrDBcHAkitxV10d79515GdvXNsQre2tWBrAEfM9jYTLMV9P+lO/pMprZG+zIPwyzi1njX+W5Am/HsA2ZvrtvhnU2aQ2/345SgnW8j+Zkqf9+e1TeUOnMWDK2k1bMsW6G4f6cJ6KtiLbNzJS6gp97q+ojZzBY6jFX9CvPqF+Dg9CnBt4oPf5fu6yqtXJ62WYXzdbqXoe9K5gkBRy3AaUExdk3r6+rlaydGcQAm+FR7PVzshCramy0ri7ORvtwpVxjhz+F73C2epRno5z9UZUBVR9dFA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaac417d-ee4b-4019-71f7-08deab7b2328
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 14:24:09.4533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fyiOgTHMXUSDPuqpRN8KPho5+7Lsn0m0qocoXb9YzUblui9LrYNtqV6bIiViAQD/OUy8TtcbRODL8ZJeFLLfYzJTvEhyO0voIqTllHCa9SI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4837
X-Proofpoint-GUID: o08IzlciaOmGrFMy1gF2pPYPlu_VcYl6
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fb4f0e cx=c_pps
 a=SAua1AGvvEPKktuR1BOyGQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=t7CeM3EgAAAA:8 a=8AirrxEcAAAA:8 a=P1BnusSwAAAA:8 a=y5baFGukj5zg2jqKtiYA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=ST-jHhOKWsTCqRlWije3:22
 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-ORIG-GUID: o08IzlciaOmGrFMy1gF2pPYPlu_VcYl6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDE0MSBTYWx0ZWRfX/hYFFR9yZ8tP
 amLmjY5mvPBF1D34Kk0z5W69t+wvnFuD65K4y/gCGOAnSHIWsBtkeKWic6VOUbbAs982+gGplEf
 x9tkAH9cH10UMDKxkhBugD64g9UG4ES5bt85i+bYXayqLtLdXv3hGNU8k6o8ISF1ifs8XknP4RC
 D6IBtUQ96b4Y6omJSfabr3O3FidiqGkKUmM8xaQq8G8rDAsxjcPjPWWIekFuxnfMSZxkuxtUFBZ
 HMUA/CxqVpLdg2V9ZLH6OuI5RdUcDq2mMQZ+7ksP+6WdY2LncEEj6iNmjZVXM9JjCdwbVnK5HF0
 oSEU3bgAXMRbkHakD5ktTVnx/r1nbCViOGvpykAeHepZS+7+Kg/MvgrPe9LR5IktR6V6kqn6jij
 RkIExLsHDk5LY7B5lA5yvUAwLyy8YVhxnC/mWP1uylJay2N6G02HnB6TevXWRtKM1Bjp0muEI9c
 P/jasX3bzWdlxliBi2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060141
X-Rspamd-Queue-Id: 507DE4DCF69
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-60626-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,nxp.com:email,windriver.com:email,windriver.com:dkim,windriver.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Hi Laurent,

Thank you for the review.

On 5/6/26 20:35, Laurent Pinchart wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hello Xiaolei,
>
> Thank you for the patch.
>
> On Wed, May 06, 2026 at 11:12:08AM +0800, Xiaolei Wang wrote:
>> Both mxc_isi_crossbar_init() and mxc_isi_pipe_init() call
>> v4l2_subdev_init_finalize() which allocates the subdev active state,
>> but neither mxc_isi_crossbar_cleanup() nor mxc_isi_pipe_cleanup()
>> calls v4l2_subdev_cleanup() to free it.
>>
>> This causes a memory leak on every rmmod, reported by kmemleak:
>>
>>    unreferenced object 0xffff0000d06fc800 (size 192):
>>      comm "(udev-worker)", pid 254, jiffies 4294913455
>>      backtrace (crc 36eeae58):
>>        kmemleak_alloc+0x34/0x40
>>        __kvmalloc_node_noprof+0x5f8/0x7d8
>>        __v4l2_subdev_state_alloc+0x1fc/0x30c
>>        __v4l2_subdev_init_finalize+0x178/0x368
>>
>> Add the missing v4l2_subdev_cleanup() calls before media_entity_cleanup()
>> in both crossbar and pipe cleanup paths.
>>
>> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>> ---
>>   drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 1 +
>>   drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c     | 1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> index 605a45124103..c580c831972e 100644
>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
>> @@ -491,6 +491,7 @@ int mxc_isi_crossbar_init(struct mxc_isi_dev *isi)
>>
>>   void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar)
>>   {
>> +     v4l2_subdev_cleanup(&xbar->sd);
>>        media_entity_cleanup(&xbar->sd.entity);
>>        kfree(xbar->pads);
>>        kfree(xbar->inputs);
>> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
>> index a41c51dd9ce0..cb50af2270f6 100644
>> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
>> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
>> @@ -819,6 +819,7 @@ void mxc_isi_pipe_cleanup(struct mxc_isi_pipe *pipe)
>>   {
>>        struct v4l2_subdev *sd = &pipe->sd;
>>
>> +     v4l2_subdev_cleanup(sd);
> v4l2_subdev_cleanup() should also be called in some of the error paths
> of mxc_isi_pipe_init(). This can be done in a separate patch, so
Yes, I'll send a follow-up patch to add v4l2_subdev_cleanup() in the
error paths of mxc_isi_pipe_init() after v4l2_subdev_init_finalize()

succeeds.

thanks

xiaolei

>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
>>        media_entity_cleanup(&sd->entity);
>>        mutex_destroy(&pipe->lock);
>>   }
> --
> Regards,
>
> Laurent Pinchart

