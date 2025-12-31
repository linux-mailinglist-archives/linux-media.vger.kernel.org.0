Return-Path: <linux-media+bounces-49791-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E902CEB8F5
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 09:41:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EF32A30299F8
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 08:40:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9F43148BB;
	Wed, 31 Dec 2025 08:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="NohljuRG"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC36C313E21;
	Wed, 31 Dec 2025 08:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767170448; cv=fail; b=PJg/s8mPNlvxQR55+RUBgAA/OnGhtdk6puzMJqTxKtg8/UK62j418HTCw32FedeYU8CZ5KYzLJYdjzSyhI5U5237U9cPUbVo1tU/vw3ZXhPm4Q3NwModiVXzyI4PQvVfwYrTuo3yCnJLjqe679waobZhgpiork5+3Ibfqh9f3Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767170448; c=relaxed/simple;
	bh=3nZ7JO0P2sAWcRN+p1vN0TW0eAoK4k8zYkshOVfZOTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gLdlNoctzisE7SXsfMJ9Tu0p3WDF7HNWR8bN6LH+lIrmRWBs45byqxMEQsni4uob5McG1C30oWCRWnUkeepCuwXVS+v1iChQBfiUPLVYyk7fIpMIPLiBZ85+dYT+ZIqLHABwJrWOxsUFbmyWeYbnEFWex+oAB3OpZPfwxfl//n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=NohljuRG; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV6rDdb1524844;
	Wed, 31 Dec 2025 00:40:23 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=TNVdZFFuH3CJyhSddAi6HDaBx/fUJ4zoLewcgV/kQi8=; b=
	NohljuRGnriiZXOSL60wEmgXY22KES7vKdtomnLF2i6Wkf9ZRrZG/Rv5pTEdHO7K
	gtD0FfDKXeUVLp/9YnqDG3+2/Dnz3v5+aCL+zArMJshAsKnRHzhjKRCH+Mq8TJj7
	7e34s7GjJbXkIDPubZwx2U0FC9vnSSkMlNSTOdHlD9Fx2Sd/zd5NN3qcl8+AK161
	kM23efTY0sSsw9E/IDe+zqkgdp6fSgJnedLv2NXE11imkHkf+z0J8xu3jg4RkcAU
	hlANE4Ps3SWRwR7HQ0dJNs7Uy5brMX9QBgRrdpgUVGrT87lQTTUxM3SrppAT8eut
	FW4uFPcPWEPQuLe6FQAE6g==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013052.outbound.protection.outlook.com [40.107.201.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm23kf4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 31 Dec 2025 00:40:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ygV6V2lehHrnyVDmNclrVEOWOrkmAzc/zzSRIir/15HM5+cxQ+fX36IRVIrxw1UmDZehsdleZetKmFDbi6t0x32UdDDsM0jGW+is9O+N+/mzENMuavVA/jowQVOBCuaTee7ukhHXJJ5KE/vKe9zLqOnz6l//kS1MlUp/r/LrQnORfSJUAufFagcKG49TfPEn2b9nCGPfRXXpOfj4N2FYTpF3yeilGckHYKZ4wbvpSOCm8ptoNs0itmdpABahifZaBsj5qsO9azjys1XmvZUMoTtu9XSYoBOgbXnYV2OOd8XWceYcANogPNplwDcr7Ebc9AkMx0QDm6EnAapEwdbOFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TNVdZFFuH3CJyhSddAi6HDaBx/fUJ4zoLewcgV/kQi8=;
 b=Ymw8jcRC+hbGWE3H+QYmIodWf2WvzLeEz6YP4/NynElovP68mDpqqxglHb/ZsbyUJPjff7NMqTNmHFcE4mDdCAgOTtVtV16BBgZWC/yFPa5ICHFZZg8Vae4xreeQ9KLpDCmQi5bTiZbYndWhq7jFmxJomBGmBBaM5+eH45o2EUv6+9J6KGiwzQmTayHsW+LEOWxeiBr4ztGWynlmB6rQgz/GkObxET3P1iuDDAmse7ynZRmsppxUWj3D6d23QwEXA/WpYtrfb5yWTm1RroN/sa+Eatv/2n9vhcBjoD2SBWZYx94M8spT64xVMfgAgrxDwQTD858SpG8njIv4XHh+8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by BL4PR11MB8845.namprd11.prod.outlook.com
 (2603:10b6:208:5aa::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 08:40:21 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 08:40:21 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] media: i2c: ov5647: switch to {enable,disable}_streams
Date: Wed, 31 Dec 2025 16:39:24 +0800
Message-ID: <20251231083924.2657165-4-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
References: <20251231083924.2657165-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:196::21) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|BL4PR11MB8845:EE_
X-MS-Office365-Filtering-Correlation-Id: ccdc6504-6f0a-4a1c-1476-08de48483bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sR1nfrxyAaiXw6m7CPTOSZHfaWjErEp+XTPhEfv+60bNuXf6L0/P92S4yXRV?=
 =?us-ascii?Q?2d3sbZf9FT9pQNqqzQ741ydy6a6Z+fwJjvFjRGVsp0W1pObHMCvGz6vIHO9N?=
 =?us-ascii?Q?HPVALJHevNz2S6XAg1s+LihjEPjdK7sVCco93COCyJeX6nzEgU1O2WatE6sl?=
 =?us-ascii?Q?a9LCZuJAbko7OvcsRHIDxr7rQZe7t9dIC+oFt5wbib5pOMMsnz8UHJOsLii1?=
 =?us-ascii?Q?zaCx9rxYi7u+TZTfPuoH4orExqHDruv6E/3YGPmynWFGTTq49tkx6fUs2dlL?=
 =?us-ascii?Q?AE4TQC6lXLXxH2RVvHqJDLGgpmPMGAwSrBvkop25m7Nfc2Nrs3EbQl9gxToM?=
 =?us-ascii?Q?DrmPXVEv2b+bvxpmIuCb6g5z/o4HfK8K5r684tNnczFkGtXHdBb27nLdVBW7?=
 =?us-ascii?Q?1zIMqNXKP6dgbtYSsr56fdevyDhsuNMnp4sNFdbgZVmgtlTmAFAGY2h9NNVl?=
 =?us-ascii?Q?VpYzLzQBJoZTJKKuJNDA4mV4kih5d6otfH4OxdKNM7XHItNrh7rCpokGEN4p?=
 =?us-ascii?Q?4L9O4bPDeHw0T2CEAQX4WzXVdvjM+g6gWQ932T0Q5jKMfARaFZS3l6K925cG?=
 =?us-ascii?Q?0M7cdEGVUS/NuNA8aj9lUEm9UXiVSVOOkT4tCrL7qxkl1yw8fiCYhUfGoWs8?=
 =?us-ascii?Q?7G7xilxzV8blhqLftTfUrzYbVsYM5igsT9k1CrMX32iPlg+2mXbbd2JMTkkt?=
 =?us-ascii?Q?ueA4usI/eXMhszKC9+bYQo7uH/By7zAWdHbOi2BJ7L4FX6o8GNgy9oEGkaYD?=
 =?us-ascii?Q?0gfNDesdBE6sLQu5d+jknL9APxpfnkqEDY0ykN3vNjs9nAfeX+KRFJeZ07JJ?=
 =?us-ascii?Q?+ofy6Yr/MtjiAQwihUKRiV5g24vAXa59RkflulxXAj78SBndQfcNqYSci4by?=
 =?us-ascii?Q?RaD0EgKER3DoHdOf4of1TFgIzG/9uWJ0DnDBfQ9fgztGsV9Mv2ehIlfsM2dc?=
 =?us-ascii?Q?fGhjMcQkPNCiJzRYCkxaxgBK3l5Y0y6Wqdka/0LErbR8gJg21ApGyYwsngLm?=
 =?us-ascii?Q?XIRduajWqZQhEQStix31+c5NWTQJsL/IQjVSxMTL5RjyqOOZ95u4736e3QZN?=
 =?us-ascii?Q?T2rzYqrrq4El6dskMmpOK56kRF+gIiN4Uk+y1Tf9g70BG2moNB2Oayh2isfJ?=
 =?us-ascii?Q?pK+BVb/SXX3w6hmx+jGcbNYZm4bS35co5oWrec6WRiXBl/ARvaQP+kiajtFq?=
 =?us-ascii?Q?J6sxP9kQCd8Erxhkkbery8qf77g4GiJ9zlpm9Xc/8jNn+80PeU0rwwVMmQqy?=
 =?us-ascii?Q?QTGhNFLpBxns69mhJXEsphYlE+M821Lr8C2e9BtuqAyIR8wxFu1wTFFzugP2?=
 =?us-ascii?Q?SDpVPdfMhjQGgdqqo9PBCpL3tRRmBCMzv0wApBmCv8jl6nkscBIibHe9LjfH?=
 =?us-ascii?Q?sQCvPvvI/ljYEqoWi/abPUC/+7UFG00UhMkgtD6m/xjvgMZPJ2z0bW/gWBmE?=
 =?us-ascii?Q?0J7WhVluAJmID+/NljQO7h8l43BTVY1VVhH4UVJrJd6+mXPHv/De5HXiw+Oj?=
 =?us-ascii?Q?Pn5fS5WIUn6MTCQPZEACKMj52qdLO9FNnGaKdu9pA4osjV6MCZ5uj6SFLw?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ciIs1UNqZIX8RmpVOy06XoPhJanMX7nz//W8WZtJBD3EfN0usJ4u5VrobJgr?=
 =?us-ascii?Q?+LXE8HhRaLtbBmP4BtdZ6swMi7hlUvjxUcZmif6Uukx3MJM5dS6jFAgxk2CO?=
 =?us-ascii?Q?f3zgFn3eOEp+u/HbDGScKZO3ACXSOBNxV7WyJYXd/2DZITY0giA0yOaFrfgc?=
 =?us-ascii?Q?460BFP/0WMZ7O3zruWORRNn7DshWZQeq2h0XyzhkNM+H8VsNrC0RnZDNDpX7?=
 =?us-ascii?Q?BGcplLhkrAjqfi1GmgvLBtff0dzT8W8H5evtISB4gINENq0U8MM0Jyx3LAYP?=
 =?us-ascii?Q?E+/aQ8xKkbJK7ElmQAJ6IrZ8d3UVpMYrMwcQ8fzM5XU5MH1KpCQVV5MDoJf8?=
 =?us-ascii?Q?H1p7Wyc4Oxv9ElIMhA8qdDYtEQhi4U0dUyLfmivm/JTaDq4czA3GQsJX13c/?=
 =?us-ascii?Q?wTr6cMTGBj4DJRw+XbBb3JJ33c2wt6QOykPL9ZX20YSwlu7uxY1yUWvm9XLr?=
 =?us-ascii?Q?YCufCBDd+9kRMAYhwW6Nufzm5SM769iv25XKL07SnKyvb6x6KPTlxIig4wBv?=
 =?us-ascii?Q?7UwsKQxGBSApvGLgor+ajBC/1oQBHXnriRXC+86MIjz7qwK4HkyTMpcbavs6?=
 =?us-ascii?Q?lfyOaybWAT8q+ude6A1cT4k9aZjr7KKh6LwOA9gYvcHV5FINkbwxKeqx22tr?=
 =?us-ascii?Q?RQDFfm7AeG3EtdmRSkCHkYK9H4mXQCM18aDRpyIzup+t4evqmzix8f9uqMXd?=
 =?us-ascii?Q?MqizzE3+bu9ck/Yq12eYjXGFHcX6DJfOkHv5/MOPE67b5Os+ToDcsNXU2KbX?=
 =?us-ascii?Q?s80+SbxalHy4e0HSpcp9Ze0DZLHHOtYFOaO520vA+KeL+V04xtIT430mIx8c?=
 =?us-ascii?Q?6SnMeN022DIBVADFxaVmyas1P6sKisjEFDnpE1jxMMihWEcopfbeyMrPYqqG?=
 =?us-ascii?Q?pqJ1IB/4yfOEU5lm6IAH7Ml2QCce08gV6iyXbVQwDnGd4HIBKrey+UZdqg6N?=
 =?us-ascii?Q?le97MFjasIzNp8mlqn97f4tW3b2KltRNn74LliR3N7XwzEAvv4m+C4epaEsd?=
 =?us-ascii?Q?i5bRFpVRgBLGYZoB8ZAkIY25UTmBiIyY0KG8gdsMChS/3g448AXqlkfhlFNq?=
 =?us-ascii?Q?pS7WHUFy2CPp/cpapTbojaEVhYEeAtOOcnMsLE+L1NvMrR2MLjGu/JQDwZHA?=
 =?us-ascii?Q?mpBzp133FQBke1b5fEulyVSZHX4xVHsAiFRQ8gcdEywapXEhUJXurnSuaSS7?=
 =?us-ascii?Q?rjCOq/pt6B1j2Z9ZmOQyMs2C6PtivIbXeCAZY4VhTB2oDGEouJ5IhAhOEjIb?=
 =?us-ascii?Q?exodI1ukLZJv9pxTdcWIWK7qu6hX/lwLrlduMRX9exMDIBuUbLCu/sDMwjmt?=
 =?us-ascii?Q?2YtrsQgi69dEiWGE8AryFu0s33+HmM/1v31gx8nV3jzQKd+nnJANWUaeFP4a?=
 =?us-ascii?Q?DZB1z/FtimUrya1OqGRubpHe3YeVtMcHNhRkXV/GX8ZOJ2C/E8GbHOaSVBoD?=
 =?us-ascii?Q?Gff+KOTeqaKOuKq6xF/iG2EzxQiHlHkA11HAD1CvUXLF5+BY8CbvthVW5Hve?=
 =?us-ascii?Q?ZqD+ObJWsKTKtSjfNCSs6k+XLaB2Ut1RECr8BbDC1CZSCC1My1sXLH9yaLfb?=
 =?us-ascii?Q?RYa8xuHhF4WiCQ0jWfdyfbsf5pDBP36XfzxEhdx6ewsEsraCsNPRKs+16Za6?=
 =?us-ascii?Q?LnEnAhwugwYF+dAVioFsOGLoxATj5QlaH6jTp2/zTRyyVWyr7NmvI6JhQTqg?=
 =?us-ascii?Q?sK7xGH/4X5Df85sXUvLglPaq2sE9S5EVaP+m+PY4OSx4OxfndKAq1FsLzOIr?=
 =?us-ascii?Q?y+U8X1JtERWUYAMh0dnDj6NPK2XSArs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccdc6504-6f0a-4a1c-1476-08de48483bd4
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 08:40:21.4251
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFZUPlhZyKvj5CFdGnFYAQgRTwfodgeSLje6zQL1wAWcr70NQFrvZDsA7chDZUnZ5IKX5QTWMggQIpyQwaGmmJdFhFy3QAn2rugUrDsftCg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8845
X-Proofpoint-ORIG-GUID: wEuhJVkqdI9f1s3SSHDKkS8qx6QDaaN9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA3NCBTYWx0ZWRfX7X7EvhrHK6Pg
 LYwXnZxJCB6k2JMqBEBW+quNiCO+C5o14bEW9d/Y5KmUeHG3Zkb7/QNQiU/ipaqtK9YJHSxcY45
 x7+voonwL8OSVh0s/oUxRTFXMqEmYV8j8Q3d6vISY7/EfMgACTSM/YLV1o8aoTS6ZkVavwKlDpL
 yqv16mN/CWQh3zZGmOQULgCb9Amt1CxaNnKkF8nhjxHd7MRrX/QvHqa2MUeqml6mqH2CtcDsJ9d
 kAOFY/vKF1Iuuc2C4bW8gOKEB3k28SzLsbJmlZsjywZCjVFUc2FhROAXP1j23ANKAX2hZWIfLUv
 no8SRKnb7yiWIqrCnufzFuvCAtXs6Y2Li1YWHYCO7bliie9YfEePq9dqUdeGeB+JGRnOMel5V+z
 m8YeZzoH93Y/FWZmWHvLCvVbbgrdFvyHSAiNTekLyiC6XJlaex8so8fTRq18Sn4CzM2q5b4BXYZ
 qseG13x0nVkLnJ+3J7A==
X-Proofpoint-GUID: wEuhJVkqdI9f1s3SSHDKkS8qx6QDaaN9
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=6954e177 cx=c_pps
 a=VtjYC05bhoYYzE9JtrBllg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=P1BnusSwAAAA:8 a=pG3TpReAhpfUgZjo6d8A:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310074

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/ov5647.c | 89 ++++++++++++++++----------------------
 1 file changed, 38 insertions(+), 51 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index bc81f378436a..7091081a0828 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -637,23 +637,42 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	return 0;
 }
 
-static int ov5647_stream_on(struct v4l2_subdev *sd)
+static int ov5647_stream_stop(struct ov5647 *sensor)
+{
+	int ret = 0;
+
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
+		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
+		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
+
+	return ret;
+}
+
+static int ov5647_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
 	u8 val = MIPI_CTRL00_BUS_IDLE;
 	int ret = 0;
 
+	ret = pm_runtime_resume_and_get(&client->dev);
+	if (ret < 0)
+		return ret;
+
 	ret = ov5647_set_mode(sd);
 	if (ret) {
 		dev_err(&client->dev, "Failed to program sensor mode: %d\n", ret);
-		return ret;
+		goto done;
 	}
 
 	/* Apply customized values from user when stream starts. */
 	ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
 	if (ret)
-		return ret;
+		goto done;
 
 	if (sensor->clock_ncont)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
@@ -663,19 +682,24 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
 	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
 
+done:
+	if (ret)
+		pm_runtime_put(&client->dev);
+
 	return ret;
 }
 
-static int ov5647_stream_off(struct v4l2_subdev *sd)
+static int ov5647_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
+	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
-	int ret = 0;
+	int ret;
 
-	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
-		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
-		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
-	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
-	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
+	ret = ov5647_stream_stop(sensor);
+
+	pm_runtime_put(&client->dev);
 
 	return ret;
 }
@@ -706,7 +730,7 @@ static int ov5647_power_on(struct device *dev)
 	}
 
 	/* Stream off to coax lanes into LP-11 state. */
-	ret = ov5647_stream_off(&sensor->sd);
+	ret = ov5647_stream_stop(sensor);
 	if (ret < 0) {
 		dev_err(dev, "camera not available, check power\n");
 		goto error_clk_disable;
@@ -803,47 +827,8 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
 	return NULL;
 }
 
-static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct v4l2_subdev_state *state;
-	int ret;
-
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(&client->dev);
-		if (ret < 0)
-			goto error_unlock;
-
-		ret = ov5647_stream_on(sd);
-		if (ret < 0) {
-			dev_err(&client->dev, "stream start failed: %d\n", ret);
-			goto error_pm;
-		}
-	} else {
-		ret = ov5647_stream_off(sd);
-		if (ret < 0) {
-			dev_err(&client->dev, "stream stop failed: %d\n", ret);
-			goto error_pm;
-		}
-		pm_runtime_put(&client->dev);
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return 0;
-
-error_pm:
-	pm_runtime_put(&client->dev);
-error_unlock:
-	v4l2_subdev_unlock_state(state);
-
-	return ret;
-}
-
 static const struct v4l2_subdev_video_ops ov5647_subdev_video_ops = {
-	.s_stream =		ov5647_s_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static int ov5647_enum_mbus_code(struct v4l2_subdev *sd,
@@ -986,6 +971,8 @@ static const struct v4l2_subdev_pad_ops ov5647_subdev_pad_ops = {
 	.set_fmt		= ov5647_set_pad_fmt,
 	.get_fmt		= ov5647_get_pad_fmt,
 	.get_selection		= ov5647_get_selection,
+	.enable_streams		= ov5647_enable_streams,
+	.disable_streams	= ov5647_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov5647_subdev_ops = {
-- 
2.43.0


