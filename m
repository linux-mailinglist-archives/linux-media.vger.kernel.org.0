Return-Path: <linux-media+bounces-48114-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299DC9DB8F
	for <lists+linux-media@lfdr.de>; Wed, 03 Dec 2025 05:10:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A41994E4828
	for <lists+linux-media@lfdr.de>; Wed,  3 Dec 2025 04:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89E5C27466A;
	Wed,  3 Dec 2025 04:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="dcL10zra"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E430D26F28F;
	Wed,  3 Dec 2025 04:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764735013; cv=fail; b=ePnHyCKbJkmXRLLb2Gu6tVkhM0NDv33njAlVdEzuXPzdsD1RLsxFVU7qs7gcIES2NVclxduYWOPM7XRd328MKxqQhSuBplOVHsognQLiD+3L26C+FYO/DBahsklplqbGde4s9xTIkynO52V7EjddEecDLeiXX0aPSyaH/P6TiMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764735013; c=relaxed/simple;
	bh=HifQmzK1Jj8tb9Y59ZbfXSgaQNbOovgt/BTBJmAGQTU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jmMKYaXRdl0+RBJIN0L6YQaYDUyEy7QBwZ7Q6OYF7igdopuxrq0K4qWWqOk3ifihsEAPRKyfXFLmlxwL7N2gXwcptB4JkO4T9kMIjimT4HE2hp2S8BOMzbfrqab3SGF34xU97/5yJPerGtU2+OaGbCZd6LEhGOJGwDtTA2D1PQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=dcL10zra; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B33nvDK3744631;
	Wed, 3 Dec 2025 04:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=ZWZO49Gk0vQsVAC+52JGynTdtwU4EC8zVbs1afRQoBo=; b=
	dcL10zraG1DmIC8tCghEPL4eEmoTG31XTqBRAYx6GJA+/QDinp9cm2My02md8rgd
	yN33g1OG/mlgS4qVulo6xQ6xK9NOLYGlTI4mYx5LENK21sof3gWSkJjIfd0kZ57e
	NXr16s2CPZRy2ha/Bn1LJpVBGQiO8lzdsSWhSS9qU6ok/0jY+8PusWO6Pt5bJtJ7
	3nYKqo+xm0Fb6GIq3Hk22Lk1oapd1p0IXprLZh7riPjhEayH+OndiAsWjT2wYWrR
	WG+HjQ5L6PsjEtpNSaS/wmjJjNYARW7bETWzZn44+qmzyo6cIu9TEUcwInzn2QdM
	8T3ZJS796LeCvVQPe67FoA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21vbp8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 03 Dec 2025 04:09:55 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUBannTl4SLvNRnwsYIpVoACphwrnYs4aitD5jyxT0uzvniXKC4mj8oZFBuHbgwOTUCTd75V+8VYNTASeQNlhnMttN6kYGPTlN/MYKG1T921Qjo5/CTz7pXq5oSBoJ/PB7D56xQhBh3hidRYi6QlgnlZtP6IxOZBwPWH3Gv6ykP3we2bpaUwGPmOyX+9nk6Ubrkl1D29kWTFjai2ykKY0/LuN5U0T1ROMQLxc041Ab2I/YWF9xgqP6I8SY4USP1uIxZBSw6cYx6fTGcB+9qsLlu1meaDhwXvfxH2jJsdpnEg5y60K8PPUbEs/dWikgMqOAvzd+2tJhDL/BONH2PxzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWZO49Gk0vQsVAC+52JGynTdtwU4EC8zVbs1afRQoBo=;
 b=fUQ5ygAI2CEmHM+Dt3WY6M++7mWq2c/AC6vgd1kuLVTKHK0bL0Fu017wu9xJNvVjlhukR3nZe6tljq3u2UUrBhIyj881UVkpzn/GMaQ9lLZRGowX92za4nOvQ7U9LKnLt5tJrpXIFA63rsupTcgIPCPAV3J9ZdP40/Xccf+RV1Byt0a79CotIf6Y49MbjY38dfM/DSC1gzIHCqVXrB226uxUQizDzJYf2SXjTsLkLI8Pr8VVWI8OhSnNWaRfAPl9P1Y3S2ijapYOAbTTtprT4klVdskz3sGVS2fB6mVM1p8Lx9/5E2VfZIArys0oz8W41i/XkIoG54OuUySJq7n8Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) by
 IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 04:09:54 +0000
Received: from DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e]) by DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e%3]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 04:09:54 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: nas.chung@chipsnmedia.com, jackson.lee@chipsnmedia.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        xulin.sun@windriver.com
Subject: [PATCH 3/3] media: wave5: Fix device cleanup order to prevent kernel panic
Date: Wed,  3 Dec 2025 12:09:35 +0800
Message-ID: <20251203040935.2685490-4-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20251203040935.2685490-1-xulin.sun@windriver.com>
References: <20251203040935.2685490-1-xulin.sun@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0167.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::7) To DM4PR11MB6550.namprd11.prod.outlook.com
 (2603:10b6:8:b4::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6550:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: 02945c02-c063-47c4-1ce1-08de3221cfdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PYDZwnq0hO1RNGYNje4qg4v37baP4Y5Cdtk50oS5IMZdsPtjdHl2jRco0iJM?=
 =?us-ascii?Q?WjHL3AScvrP8Cu1Sm6L5YyblQ7TdFZyXpYyZAooL7TO1nvnL68FMblM37r+6?=
 =?us-ascii?Q?fC3V2RgJXHzpnFHHAj0S7cccYuGecfL8ymAQlrbbt2V0491CmFaqQ0QSxte7?=
 =?us-ascii?Q?Ez3Yp3vaYeHC87fTAUtQvnhAWVnrtfzSWU8hkhG0UWYLX6LI8/GyPlr6OWjp?=
 =?us-ascii?Q?mOfSepJprJBAkWtfajzk7FNnsY1rU50ddcBnS9SGPx5xV3GxC9CTdkvUhvrK?=
 =?us-ascii?Q?qtoP1AXZP6hwSalsSTEv5OEBKRkKyH64O3578VXevpAlL26nj+MZxAONeOom?=
 =?us-ascii?Q?BFjMPUOPbOC7U1hIPvYcaV4o2PV/mMn5OVqGSj6yWfuBNYieRrWGq+aGswA+?=
 =?us-ascii?Q?DTdV+nIvCWagCUH/JTOwNtBac770b/YR+QBJxE2vsL7q5tjtfeJqb8ZfY25r?=
 =?us-ascii?Q?rGkB4gnb52cxcLmcU2H7F1xnwmNO1fDlfvdVD/AZV7K7vvgD57hypLcWRSHY?=
 =?us-ascii?Q?FGRpNJIbn9JssEWBt6ma3mbi8XecDEISKUPOsGmrrFOdZ/D1Z/QTu+D4bZ3W?=
 =?us-ascii?Q?3PcPR9v0voCmwwzMNav5wwTqWAICCH/yxvtqdbIXIteA1qHMvR6kl9GnKMub?=
 =?us-ascii?Q?7x/n03v4sWqJ7yHWyXR4cbYvrSUgk/Plb2Fl+jy/6TwoUnhIpvockCl6PPpP?=
 =?us-ascii?Q?i2dp3SunEJGxvxojeE7izuVK8wZTqPNu6cfwfS3jkCXM5+GM7hbP5eZlHmvO?=
 =?us-ascii?Q?VieHK9IgRZkrk1XnYF/aNe9cCODqLWCAHX6nvzkMbsnXh9BZFITd0R8IDmXq?=
 =?us-ascii?Q?5oI3raI+25N5e0UgLYjZS/8epbcfO1h1f7Vg15fPp1NQlso5oFkwfNW/hPXd?=
 =?us-ascii?Q?BUXWha/BfnQ9Sl+zjEvC6edlgM02W892W1mebL8F1B2Q3xGr55xadivLGKJM?=
 =?us-ascii?Q?cRgRIxWzFkVc11riPbsVemSUcDFxLTRighm5ujDgCkOwdr0n55tW9CrjHunq?=
 =?us-ascii?Q?KSr7f4BdHFA+/d1D1Jz9xZuYrtBTjhljOg/nA+v22ifKE0oFJZQJHSmagCUk?=
 =?us-ascii?Q?55DwryASfDxR+3ftqYgQHaXx0zNvQuDUDiL+qNGy7I8DP2bp0RrlRJYEidsI?=
 =?us-ascii?Q?iNHir0xq7rZnySmoT4tAXkJtDCL2wKk2ZpXm8iUGDaKg5l9rp17aGQnT62B6?=
 =?us-ascii?Q?dzi25+YCEpnfOh1FPE5acNZAw69YNs2NQFVAQFaroQ+f43MtyW1D4U/BKpqP?=
 =?us-ascii?Q?LhXJI9fwbNHpFeqA2Jd5vSSaWbwvsXg7XF2PNFcckotMvcLt35G7qMeLmU4S?=
 =?us-ascii?Q?HlIqDrOCMVRlhkNMfyPFSnqnuu53QSs15XsU/EF9ctsxIV4qRs+Tq12ryqSu?=
 =?us-ascii?Q?nTsk+AHFHh9Uj02yRODHLAUk2WTuPhqFh65OqqBcdm9ERLLIp+cF/aeuVLsD?=
 =?us-ascii?Q?myg6dCOkHK/Xja7G17XpzVZ35jQjuBcOnVgvVTVkiZzybwDCuIVaLNByyL7+?=
 =?us-ascii?Q?URk78Cix/DLL4ROkevKeLd+814jjnrNsqD76?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nK83JFv0DGgBiRg92EKX4V5ZZcCl8DbUwnQm56BOOAs436C8b+SZ7Vhij99A?=
 =?us-ascii?Q?kbgIUGlh9AZ08j6rHWSMr0IV4kDgO5k4NYZt1szZStuftLvgISOimmQ0EV2f?=
 =?us-ascii?Q?ZWs+zlnB591TSZWCce5JsJzeOIkRJ6XphvnopBg9O52wJdlpM2JgnfvbM4Ey?=
 =?us-ascii?Q?kwo+sX8sAY0eGYB+M2MtgXwpgJcvv0oFclIZon4X0/kWCZSrsZUXdfffPZia?=
 =?us-ascii?Q?zIW0I1vkiKCNdqHCi5Vpk0L5W7KwcWyFBwbqDYCAAamBvaoWYVcKS3hHuVcH?=
 =?us-ascii?Q?/n2WM8HDgk2UUnKO5aTEB1MIXoxxMP3QXEMmidBMaNiB8N9RIgpXEFXj4SYZ?=
 =?us-ascii?Q?Yk3We5Wely0dOORMjQ214HthOJqMPvvzlLzSpLR7M8P+KgLsZ0M455K1i6Vy?=
 =?us-ascii?Q?gQD/+d7LY8dFNe67wO3H6u9s69JxQXfJ5iDoQbAwW0XlWd049WdrM0sDFUKM?=
 =?us-ascii?Q?KRJwC37YpuEWBbsNPE0vWzRLI/Bd/xhyb6fFOFQK96bSVHlpXWl0B5CkUKIt?=
 =?us-ascii?Q?0Zp3pXUW4mlU080e3mdTHJ6/EUYw2wUetZgVF4AuXkdlMn5A1mqKF9WQQq2/?=
 =?us-ascii?Q?c6g/DPq+TslT419DDnfj/pF4ISz8av8zQOni98cn+XnyJClSpvRGiycBNJme?=
 =?us-ascii?Q?Gx424oN0NrAbhsQeMyp3GGKXKgUXydEsO/2yNJRbBHVcKiZ/ZmQ7977SscZ3?=
 =?us-ascii?Q?i9Ycms6pEZlbeckcaID6EB8a0/5h8t8eR3mAIPe0mpBIaqulweMUeSR8hO92?=
 =?us-ascii?Q?cjMXaCr9/ba/iPSwe1YgPS4PFXnQEPyyNu/fAkKdZg8kcC9KiTzB4mm5opQT?=
 =?us-ascii?Q?YVp3WjwS+MCsMg3r6qEYAh2UwRERUIocsq043IQMfq4G9iJ9lOGkkKfKhU8c?=
 =?us-ascii?Q?9t0G+iEq6elCaakvfmza1pBHl/Y78o+QKpfvEVmq6AB8VKz61YXLKuD9ITRm?=
 =?us-ascii?Q?/gE5t7TKgzRz5AEVuwMa0mjBd4oKNt1c8NLP02uZ1wTqoQSy/wsG3f/taX/B?=
 =?us-ascii?Q?1sF3FF72mMGY+dy7TklJkbv+WF/Uc54MtTu3+udtEJR/wWbqiPac3NvEl4WS?=
 =?us-ascii?Q?RBtmw/0VveZ4IoWHaqEzQi/UsvrBP1EjuWwNtBpMYTf0doMggGb8PrRwdGFk?=
 =?us-ascii?Q?CnLCqRT89po5oobvQeJ5kMFp8EA71Dfrwj3DhnxCBgO7Q6gy4gHQF03m6YUq?=
 =?us-ascii?Q?l8Dn+n2HTXR/PJzcXr9fGvKU7pTSgHAtJBDRhnm9wjhZD1KzcQMlUMf176vz?=
 =?us-ascii?Q?7UbAdU8HGQCEYysR28btgm1JMOqTcXsi8i1kpa5gH0mLkeGtm6ZmbH9DWgGf?=
 =?us-ascii?Q?Bg42fmQ/VNQxbdKt+CI+9Skg3to21dVtj9jnmLg7igkGn7KmcLjj9nWuETm1?=
 =?us-ascii?Q?TjgAxPP5PPKlNxNZQYBJBAR+y0E2+9wMFEdS23d5h3SYieFiSLw7PebG4Zn4?=
 =?us-ascii?Q?H96SThvo7IV0LSkjVXI+aYbC84jNIYiUvOjXiYaPxjmGjDzVPYJfadZwN7iV?=
 =?us-ascii?Q?c4i8pPwsBGHvt5Wrs8PjSUONM+uxnptiXcaQ2Cq5XfMTtoPt1pTeFQywWGLo?=
 =?us-ascii?Q?keZZqv/RfG0BDtGiLKhK0j1fLXq7HwG7lJC4tZrLFSD1+Z3rMsMF8r3Os4Qt?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02945c02-c063-47c4-1ce1-08de3221cfdc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 04:09:54.0119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a1AZXtMOTTkZu6NM1yBs6d2gU9+6QHvuLAhv8jgXuLe09c7rbmDDGFelM/hWlRDd5Os1xT/tPaAApA2nQpk8cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-Proofpoint-GUID: radb18LqCLc3Wh1vpNYdKEIIUMxXO36H
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692fb813 cx=c_pps
 a=IFr6uxAXmWssV7p2N+XdEg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=sSg5oxgHRQSn7EJo2AsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAzMCBTYWx0ZWRfX62BGnwZTwehV
 aQu4Gh+pxbCfU6IsbDhNsykb2P1AdW+Yat201WyM6LW+zEPeb+9ctrfB4mOfx2nqQYerocEiGCF
 0jdZiTFg3VDKz72cHNU25dLVnCUeunn/yioHIS1VQCxE9oAAYiXEQpUz85EWhN5QnUUqTba+WDZ
 bZYR4M1Dxnn2O78bJ5uo4meagvW1rHvs1joQAtHSw5Ks5xT8uP6Aj+fu9lBeTkSD2IKLHAh1Yq2
 hH21FMz6xZxJgLZZBjOjGCaQq5dTCM7//h9/crdPIBH3OP60XmDkCH4PLE7A5yUSxoBCvhk9XAV
 JSrg/xfkAiBEBF9RUv/o/V1J8etAWlfcg64oMOtoelT/6y2cO1FTvUXr/JVJpHwfUAbKUVVFHmd
 VN0QgHdmjGBvvfE1cSFohgL3I0/pSw==
X-Proofpoint-ORIG-GUID: radb18LqCLc3Wh1vpNYdKEIIUMxXO36H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030030

Symptom:
  Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
  Modules linked in: wave5 rpmsg_ctrl rpmsg_char ...
  CPU: 0 UID: 0 PID: 1520 Comm: vpu_irq_thread Tainted: G   M    W
  pc : wave5_vdi_read_register+0x10/0x38 [wave5]
  lr : wave5_vpu_irq_work_fn+0x28/0x60 [wave5]

  Call trace:
   wave5_vdi_read_register+0x10/0x38 [wave5]
   kthread_worker_fn+0xd8/0x238
   kthread+0x104/0x120
   ret_from_fork+0x10/0x20
  Code: aa1e03e9 d503201f f9416800 8b214000 (b9400000)
  ---[ end trace 0000000000000000 ]---
  Kernel panic - not syncing: synchronous external abort: Fatal exception

Root cause:
  In polling mode, the hrtimer periodically triggers wave5_vpu_timer_callback()
  which queues work to the kthread worker. The worker executes
  wave5_vpu_irq_work_fn() which reads hardware registers via
  wave5_vdi_read_register().

  The original cleanup order was:
  1) Disable PM runtime and power down hardware
  2) Unregister video devices

  When autosuspend triggers and powers off the hardware, the video
  devices are still registered and the worker thread can still be
  triggered by the hrtimer, causing it to attempt reading registers
  from powered-off hardware. This results in a bus error (synchronous
  external abort) and kernel panic.

Fix:
  Move video device unregistration (wave5_vpu_enc_unregister_device,
  wave5_vpu_dec_unregister_device, v4l2_device_unregister) to the beginning
  of wave5_vpu_remove(), before worker cleanup and PM runtime disable.

  This ensures video operations stop before any hardware access mechanisms
  are cleaned up, following the pattern used by other V4L2 drivers (pisp_be, rga).

Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index 0bcd48df49d0..77d6c934d0b9 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -351,6 +351,10 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 {
 	struct vpu_device *dev = dev_get_drvdata(&pdev->dev);
 
+	wave5_vpu_enc_unregister_device(dev);
+	wave5_vpu_dec_unregister_device(dev);
+	v4l2_device_unregister(&dev->v4l2_dev);
+
 	if (dev->irq < 0) {
 		hrtimer_cancel(&dev->hrtimer);
 		kthread_cancel_work_sync(&dev->work);
@@ -364,9 +368,6 @@ static void wave5_vpu_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->hw_lock);
 	reset_control_assert(dev->resets);
 	clk_bulk_disable_unprepare(dev->num_clks, dev->clks);
-	wave5_vpu_enc_unregister_device(dev);
-	wave5_vpu_dec_unregister_device(dev);
-	v4l2_device_unregister(&dev->v4l2_dev);
 	wave5_vdi_release(&pdev->dev);
 	ida_destroy(&dev->inst_ida);
 }
-- 
2.49.1


