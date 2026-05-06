Return-Path: <linux-media+bounces-60506-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qElQHYyy+mltRwMAu9opvQ
	(envelope-from <linux-media+bounces-60506-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:16:28 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5544D5D6F
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:16:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FA3F307F96E
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 03:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526DA2D9792;
	Wed,  6 May 2026 03:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="bCr9UNUJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE982877DE;
	Wed,  6 May 2026 03:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037239; cv=fail; b=u9zbdnH6vzUVc+gt8PYMX4B/mGYK4E0qWRE/nY0Dxlpi8TkuelQ0ijBmhvUgfsoMll4JhXVCAkqacwG9FGoCc4yn7Yys2EfwLsraGZojiMk5MRTcUHDS1QLy0+7HZk/Ml56oeZ5z/M0v8GPI9mW5kwKPWcq7dq+HnUYcYqSJdVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037239; c=relaxed/simple;
	bh=TYRvBmQSd/M2RV5WFh+HD6ZhStDCFPab1TfXyvLuMjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C2BTvKM7Fwria/lf9tZSK1XHJcmP9GPDb2gQdE8l2h1IKYjtKXZ/CD2IwPgv0QKwKaEe/s132u3TBswG4/Kh4m+Rc8XC+OnUhFLx5aXQQBke8LnLdM1P6iCuXFvIsrcXnNnu079r8BI4yNQzZldTXqvyB9+w3opy7dyA9F+g++k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=bCr9UNUJ; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6462WDF2640276;
	Tue, 5 May 2026 20:13:14 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=8x1RxKxHSrb98/v733xyyxw6/DGEzSCZm2WqQ7/aEy8=; b=
	bCr9UNUJjR1k9VJQMvddyaWqNtj1KNBxvCMQDiJ3cBJea4GF3L4R/HVsxfq9HDPZ
	hmnrbmykdq3iW34fDAq/FiT7efl3S8glo6G3ddOK6oZRErwexbcX0d7abYXmNt5b
	u9qPEWx/1RP2Cihp88UZZz/zc4lXPlzj4wi2J9L00cCYNlfUJwGmJzAGfdSEtQRo
	3SZUWs2JZpHRx526XTrxZNAAPFSJQY2KR5aXba7dlMt/UF3LHi364pkZm04zQpqi
	Cbd1y4Bp52sDhvzP2ohIoNZT+F6uuZTMi3/3CSlz+yKG4Z6TjiQlgezLGKnlF5Ni
	/J4A09KEXSmtlBi//wHCIg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013068.outbound.protection.outlook.com [40.107.201.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwgsdc45r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 05 May 2026 20:13:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U7PHEN3lNuZfipu9Jce0SD++eAX31+c24rIaIQWtYiF3Oy9pCQUo2AV6zsC2knSrx8oO/abyA0sRW9bpVaF8+Lmu4b89KaZddxUXozcvgVIP3QcQtERcRViFAoQqiNpIXcAfmBjF+wxnKZ7twilmyXbtESxoHBbh/JcTqYyVqJ8pURIVlDR5qb/LErX5sT3jxX4cQssgDzNRcR+gRgNb4yPZv1M6mXbhToKwJWj3mwIq5Uhqy0Hl1oxcKbrIUhsCpe3dqO40l2uCYYdEpCPALslKu8Am/frgOTqvHckRL5z/uYcX3S11B7LMY4Ka5cHx4B/6tCcX51GDYc5P3Ryd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8x1RxKxHSrb98/v733xyyxw6/DGEzSCZm2WqQ7/aEy8=;
 b=A9wMkThmyCVIIxdGbKkW7bbH6AJ5GzNybaGHiop18bp2crR5DlaNlxoV04icHFGERxrVMxBhgQMQFc5t2yE+DFPtJ5qrXwHjSpSeZU50GpVJS4Do4ukhe2gcrUUEHggkIdvrUlglg96SllaeJ/v2NyPKWiiEeNTixIHJ6yPJBORzGwaStk5Pb8YSGqxWIFe/kWX1rHdBojCzpCBz+8Idgs9VNHYwBktVlN0fC6k3E//BwvbNUJNdQ5rc1EZGzkzN/9o9H7Eyoj7MVWPeDZNiqihmZxWibUaWqun+DxWa5wGn+h7sniXn0IIYb4wkwqSFjx09hVndf3BVbeoNlEtbFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 03:13:11 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 03:13:11 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 4/4] media: imx8-isi: clean up already-initialized pipes on probe failure
Date: Wed,  6 May 2026 11:12:10 +0800
Message-ID: <20260506031210.2769998-5-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
References: <20260506031210.2769998-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0050.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::19)
 To SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|BL3PR11MB6388:EE_
X-MS-Office365-Filtering-Correlation-Id: c5e52518-b2aa-4c6a-00d2-08deab1d6766
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	wgoqdxRND+j4qT5i31vM/96m7+w2jZhfJdJ1GWSrek8GWJKDc8OF7qTxU7nTnRT7lbL/UWXnddCrgUi51SPuIYhgmCFYVRMen34GRWXSG5rLSNMPkvDrCXu4rV0SMOkJ1oLQN4BBhlFRdtumY1FfgJEO/lNb9u4GlSkeM5fP3rYX0Mo4Zly9IDe+Zbpc+EhV5MplO3U32JEKzWD0UGC6cnoo58IRhkH0QkurmM06973jOX8vC675XlCberAzEjjEWMn9VvNlGi4/oX4s4HN+SX9Rn0VfHKCeX5dzyKKoR8v/dY1625HzO7dmNyea+CUeQ7p5HTWhB/fVdzWetbVaRHODwCF/+pkPdTUysWsBRs8r1MclrjeN9qtkrd5mdbLFmocqVtyf44Vo7PCuU6rw24zKPWrSaQzDo+DFMtpcBsrSg084L5tGkEhGHb6rWXYSHf12xmvipbozZhorJAqOZYGQFyV9bsVRufkqDkPcw618W4DjsSWFYGyl8mAMEBF9U+F/wcjmRBZRKAvHCfYGt0Bemb8zCIHBh/wPbfCsqCj8hiccAR3tl5H4KBDJridSpsVDei0OL75TqqTBSqvZ9N+fRG8S824B62n5XUeICk0+6k0msrf5SfjbjsTnfJzXx2uItWB0bgHELfSWH6n6MYO2aXv0LoRH6YRXrMekkdkv6NV8AwHzeEwP9PJEsL4CMnjYKDTQX9rqFenrNOK4DE15KTBjHpZIB+BBij+Q0bPCtgvs92fuoyg6TFpQNWc1bXA6NG8Vumb1h0SJO3K6QQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UZTR3A7M1Mqa1+GetwPzpWB75ypl8SRc7RaH9CxvqtrxA+ZJ/VTcMleSP8rI?=
 =?us-ascii?Q?o06PDlRq8H8WNM80Db1JKg2VYOfEkaIPeBLGX/S1VvCUkWwWBDPNJccH0QTv?=
 =?us-ascii?Q?dcbFPeAhJy+Pl7lu92I/WXHvM9Qhuyusl1mLsIH/fv0n7a0cJD9WaQf6ixqv?=
 =?us-ascii?Q?zVSBVIH8vcPQSU9nc1EqtteStc4ZC7pBFGlLh1eHrtbP+ZqTrCEHou6iYr0C?=
 =?us-ascii?Q?pCMhXmoN0G6F52kKVUDBu6N70WCJylU4HnsnTd0TyAYbeD0jFBGVRuPCjJ7m?=
 =?us-ascii?Q?1jqSW1aiP8JaTch50QVYvcTQjLnIbf3ME2s63QG9nguCx+hDEsOw8RQ+3BEJ?=
 =?us-ascii?Q?JfnSy7pBeCG6eFeYaV8NhTeSHxyim6BHgIOOJUnM7Y0hO77gQXh9lCYNDya/?=
 =?us-ascii?Q?j6C4fWscURBN4I9ovb31iKZMb4rTRxYd7Lh8B0Kj0h8zFroWd3LvgGAu58Fs?=
 =?us-ascii?Q?UJFHHOR43EMBzRA3zMSt70fWMolG/gMRtyr8p/OkJTG+7RY1Ii1CnbPxlAJ0?=
 =?us-ascii?Q?gE8iPAKh0vNoXUxDVeo8T254XDZvMAL6/r9c6CKA7pbnfOSQP/jqFI9nsC1b?=
 =?us-ascii?Q?sSviDz6tgT7NSG6vMfySbyi8S4SxaO56qXOry4t/B7P3TiqPdAuZFzmGb2zN?=
 =?us-ascii?Q?S/8ZEAzRr8M8kibPyfogUkigR2Rx7DF7/teSYEtdytLMa+uX6cU5A9pChdd+?=
 =?us-ascii?Q?iHOoy/dxjV5F9wsLfHQ6OO4v+UOiCafCkyK7T2DHLP6WLPJiOXza/rDTEYJb?=
 =?us-ascii?Q?F6h4oHPIuSmZ1UMWW6FJF2cngMjtybKFq7fIz8dPNbQyCb2cSHPUdpIHEz5D?=
 =?us-ascii?Q?3lpvrfxsmCw8epkk/co2utHomYhdcy+srCawq3+vkah/0Eges2wp8FALPrRT?=
 =?us-ascii?Q?VHXK2H0+XPSRhWhlsRupFPoHQ9ELt7q+F74E/cMRM19pABlRyJDdODCjR6/+?=
 =?us-ascii?Q?n63kvrFB9+5JEM0vR6PsIb95VkpwMgeEktXMvzw+htGgBYtNNPAIMQ+xrREF?=
 =?us-ascii?Q?ygkFy4B0in/h6DWheLJw4/b0YFmlMRrgKV+y7rDoWIt6h7xAaWFgkhchwQMx?=
 =?us-ascii?Q?ZaGFxqshU2cFaspxM7GUecPQMsqitpNKeKGChDE9U0gxYF+Xq5C8UPMHoJIo?=
 =?us-ascii?Q?Klh3iTTrp9m/yj0Z4YpzOHDb6IoVmzcctO0++RnC/nggHIDIne/QAO7PYnZd?=
 =?us-ascii?Q?EadeFB0ByC76/LMjzBYAieXwHzXczczQCG9dEzjcmb8/CPT1GGGqdSN9uYe4?=
 =?us-ascii?Q?A6wJlyliUVWwELB4KhBY4KdEeWFNb4nxb7dXXccbxMMjvWdbP1mKlSrFr11b?=
 =?us-ascii?Q?2a7LE2HeeW2g2lrKgTvceT8Mak96W89rEvBsQijkdmbvgwbkul8+MeBO5W7l?=
 =?us-ascii?Q?Xm1ZpO3RzUSA2699qG7h3bSsjMCtdykNDLVKC5MQwx8XElK5TTzlDiu+raH8?=
 =?us-ascii?Q?PT2U3m0gN2D6wb0nmJxglsLyuFRwDouzdtZJ733baE+m6ONPiENslpMhAYyz?=
 =?us-ascii?Q?gsZ1uiY/qyNVjKyNozq5KeKFOKRRbpenEklV6uIz1iGEze680dgwh1vWEK58?=
 =?us-ascii?Q?vPzkDC5YtNWlHSNEayCZBvpq9XDNUvALX38rPuT7dvtsVgs8VA5N6TGY/XfI?=
 =?us-ascii?Q?LF9VCHGIs7DnCUZMkkYhbEPuyb/4Cbs6X+83h1Gw7lFfVgRuNDJg/r78ILeN?=
 =?us-ascii?Q?9M83fVSHLqSbJsxw1A0kBUOeMSztTJSG2OdHeZuD/4gca1Sl9ZScWaItXywR?=
 =?us-ascii?Q?dyO3o4HAmxy2BWY28D7bo0d95clzuEw=3D?=
X-Exchange-RoutingPolicyChecked:
	poh7Po+EQPuCl/qLEVPVkUUJS/EL7OyKY6SuHasJeUQMtsdgiVtiKel9NDf7+S8pl/+Q3ZxgCEf8cm064BYTRXPHg+dibUbUcPWok6xPvmcXd6FzTxE9YGvv09ys33UuWMbYQVHJGV/ruzOwWWghMuHJfIHSowAm6srUp3otzgwGk4NohIG+fj6u7TzGX2bFWcvhUHcaskShm7DBQt3Z6P+1mbXnKCYFuhiUSzA/6uMWqK5wduCRvrI4ft5ZUbESfcl6JgObjaoG/DbylgEVK78XcfGtJX4OppQt90QHWodmNL5HpQbmzSNdHca8FuuFCYf0WJH+kgzx4+jsVzRLUQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e52518-b2aa-4c6a-00d2-08deab1d6766
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:13:11.3860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ldkrlf4a+x9NLMdwM0tM/YYP0IGhDnJnIUlKwAYpUDJ9jsCe5Qzk31X52+MSlaaJfDDxFFtIe7y9Kozx0e9Ju3+SsRm4sld0CS9HXyfN07Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
X-Proofpoint-GUID: BmTnVkkC1E1f9aOVbZzIFy3KqeP00i-c
X-Authority-Analysis: v=2.4 cv=JeGMa0KV c=1 sm=1 tr=0 ts=69fab1ca cx=c_pps
 a=QwCZ9Ep3279coiJ7nb8JBQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=WOJHyMjl73R29Gv1xn4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: BmTnVkkC1E1f9aOVbZzIFy3KqeP00i-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDAyOSBTYWx0ZWRfXy7+sSyrUUCNY
 gRoZftm8zcLmda8EKqJI5ZR6MTjpCk9ZqGuQ+S9tWZohai9/4jxiJNIohzwUnVCgB8pV7HIXQ76
 Vn4DdH9czMO7PwhI0TVdUKjQsYQBdfPtZEfLqBVqmENl1mr8nqBjlUnPafFwxHt9ynz2FOEPG9g
 I1n9c1bO7pHtzLtOmwZBKL1ph+ziAKu3w8NEH96ehvMTAdtsr2090tca/ETmflPIWkqXJsLcRZ9
 a0n1thoifUFfH5JSErj+3qHN6KzsLEWCwE25Q+DeFqFeUAj3rxUjdMsG4wKMhL2y1+x5Ykxx0HE
 NQvprXQ2KzvSFYtwviLPx5GOUVtYpdhocbjO6TdydirKBbPGx3lMSjakqy6yrOMSexUQBsAQ6Qe
 +KqFJ2zivhZ9qY6sptKWlT6+YrtgNDo9ZLvrF8pD/DRZpBfSA12SerQRI1XJhoHKLbvhv9H/ZL+
 ugZv0qMIapRN0PM/81Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060029
X-Rspamd-Queue-Id: DD5544D5D6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60506-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:email,windriver.com:dkim,windriver.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]

When mxc_isi_pipe_init() fails partway through the channel loop or
when mxc_isi_v4l2_init() fails, the already initialized pipes are
not cleaned up.

Fix this by calling mxc_isi_pipe_cleanup() for each already-initialized
pipe in the err_xbar error path.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 2b76fb9c18f6..8533a979d60a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -539,6 +539,8 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	return 0;
 
 err_xbar:
+	while (i--)
+		mxc_isi_pipe_cleanup(&isi->pipes[i]);
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 
 	return ret;
-- 
2.43.0


