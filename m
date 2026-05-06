Return-Path: <linux-media+bounces-60504-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IfsHzGy+mltRwMAu9opvQ
	(envelope-from <linux-media+bounces-60504-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:14:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F37174D5D49
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 05:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B774E304C97A
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 03:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BB1F2E1F02;
	Wed,  6 May 2026 03:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="VtsF2Jjq"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3471E511;
	Wed,  6 May 2026 03:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778037226; cv=fail; b=sKKbWYozYh76t7rPj92vKknhJrgkX1FoPCIqKbOh+CFSGrWO+5lQs5ER3VeMuHhR7wt3wE2d3CUXkFS9QFW03hEDpTM10VnQZMj3nsnhmjo7v7CJf/l1jZ3LigOY28vZFnblPHA4rb9GxI5/OTd8hQdihoni0BW5vROR+EYZbjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778037226; c=relaxed/simple;
	bh=HBTxdgeLpFq1F6CRJuffQ40M8ohErR1bOr2+ENQUBBk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rmjLhcFy3Xo8wBrXOyxpadj1WKvRXqYXfTg7igmOMOX4t6tqJHICroDlkf+3MhAsgmj5UWu3HMfjXtps4d5NDHRMWZanlzBCLEOJ4jTKJp4MMURSAlMdicAttpxGAjonDrpmSgdJAJ3TctdX4GwR4Z6u3zhaqcQKdpcDe0XYM+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=VtsF2Jjq; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6461DQBY080652;
	Wed, 6 May 2026 03:12:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=CjLD3tsgDKRh1HvbrsGaCVSa1xH/obqpDWKPPuh+DNo=; b=
	VtsF2JjqD6TRbtRGVqnBhCnkrHagvNMoYlk0FcL4PNTj5slSQfcFrZfHzqsO6ihm
	qXVrzO+vAm4DSUz+6oyk93OhqmsZA+v1MXco0IOqZMokhVosvghq5NZSKQFC3M3l
	xnecMI9w09AlSj3qwXC5X6zOBou8HvDEQHmHFAYlw0f2hVN+4fAnQexpW/M0n7SB
	9SZmninX2o6g2OPl0BIt/JP/V4iLFlFkNbx5BYy38z9iRGnDolcoXVAhp7GpPJtn
	Ab0Urr4LKvMiNdxOdh8DM70GfYYOJt5uqdVjG/l7V4UK9dUTEAEEl+AJtixmMTec
	NEbf+l8lIv38BhtpNtq1vQ==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dw8pu4dc0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 03:12:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4+bHSs1Pjq19OfWv8AZMnQ15tv5nCxeS68vK4WGSKE5Jg844iXL34QO6c9ZLZhx991XeUjeSceKmnmQXg/3isHHwN6teuvZZZIvEK+cYFYuiZag96Pi8OLp/DeS7oK1/+ljPylUZm/0fG6GZxxLAc9Y8JzTqMBhzo5FHinNJU6PiNKsph4P56ngLCJz+74W0ZfwHttxntZ6TRBsh2fQoKDh7S6ozzOClb+RmlXnNU2kJN5OQ273W3aI3/bdon9F2FIGj32H2dFwQ9lTEXxkP3kNpOhereAvYpDdT0Yg/q9qCy9i+7M8vSxZbhBQ2pwM+kye90gRFMTKMcX86+mTtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CjLD3tsgDKRh1HvbrsGaCVSa1xH/obqpDWKPPuh+DNo=;
 b=PuJOJ/CKv2GHJ8///mNidaAAT6KuIQaerhwd+nYg/jc9bsbHlKs+6kIBwg4mak18VwR8620HKjEcgT4Gx/F0j67jr/0cZPEe7Gj8XYZjqWsN1AwkF4E58NAwTcHQtQVKCXH++18voHbB66WUUtFJ8TvkNMq5jrEzk0dtbQdlTaRDS7rJN2aQdbK/lzzM/jgZkrvFy/LKTBWer6ZNhuYy0Us42ffAocjP+UPi0CG5ApFgpcVSuYjzycCipFe3/Zm4RZRoaKUj1eq63eQPsIYZ0kQPIPk0nL8SSS0kpDWfzu1i7tWU4Gm+8+RUWdJN6VrjRceR4wP2UQ7G5LMYk6jFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by BL3PR11MB6388.namprd11.prod.outlook.com (2603:10b6:208:3b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 03:12:54 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 03:12:54 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v2 1/4] media: imx8-isi: fix use-after-free on remove
Date: Wed,  6 May 2026 11:12:07 +0800
Message-ID: <20260506031210.2769998-2-xiaolei.wang@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6216b239-493d-4318-3a7a-08deab1d5d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MOTtmg5jcOtVlafEfdE3fmlwPJ65x4Rz/KUYofnp9mbTGvshBEsTF7hPb/BBLsOJmNzI4/yyiDktddtazq2KfR6e4JjrJcl2B30OE7iGQmfT3hKYhOMb+APLTZSJ0PvjUvcUYL+X7jz1yh/+VXharHpNOrGpCcbjRTOLQqkAS+f4hA+RSpuaKvpZG1RQAwfLESONYm3fmlr1Q/78XyQ4LEk75/LuW4WGGjRQt1F03tPcHjGsdtrHKfLVdy9bnGnpg5C6gzxZt1MJ+7Qepvb8G1zsGYIyZfyBZTk/Hi+/DNT+lqkiKx0i5K7KulBZnrh+GiDbU2Wp/H/ORGsacyyK/9BiS9NC6hM+2aXkjqNA+ir9cj0KFqKauWWM9tcdyALeanK3MStjLKZAz9r9ozXUpo/0nyYL/pGtcowSRePvJOH63lbV51dI4YGZn9Lk9EADJuYC/i1221VZIsfu86KzuIF43Z4bAWgJJhCjNcYsGb4l3kpuEWu3A+Y2vYnmy1vBouswijL88EKOIM7/OdFNySAbBCT20oG/n8gdm+92iMf7+TKKSjhkd0N9jO1kiZV1KE6XKe0rcx9vfbcMIZic2PnQP1w4UOlcP0w5cgMJHndoYn+cKMtKeY4pX2MSTotDcwaHgZvAN4yUpb9gSv1clP636nTfPT+CtClGYztLbhLvhp3O3vnaKpKYVv6Ot4vjh54Iyu3lcbGz8Uj3Ym12RVIgZjmxLAfrZmCx34ZnN+GsLpEvsVLH7/ed2WKJqX2ia7mN4MdrikJmKseY9VJbxg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WrM2WApH5lZvMTWC6kh60kiFmGED7wSkSXux4tDVxbIFiSiJF6rM0rrXl3zz?=
 =?us-ascii?Q?Ewc339bprV6TWPW5j4CO1pNCFc6eVX2AxmIeDVqERVqj4Tt67WAyQ+LYSv46?=
 =?us-ascii?Q?f9h0FmKyexk3DhFUE5i1+P86XK7wrwEFq5pHWp5CqCwMQFhQth+HwYodnz13?=
 =?us-ascii?Q?NI4U/EfzCakYkT7ZhERM9IYbufhMoBXDwlcvA22DR3McK/u493vOeyG9DT+8?=
 =?us-ascii?Q?UAR6yAfB/XOoTAw4LvFVMD67UFNiROuM1lvcuWX50zAbDFpdGGWxDlVmpcgn?=
 =?us-ascii?Q?hrYs/br1gSHTWJzqNxG+FzsTz4xp4Pf3eaZndEoQ9twzli6puzHykRKajIRp?=
 =?us-ascii?Q?Xs41LybdmGEvzmwAvd80HPZfhY71GuM1n4sk4xprbhsTpG7FfDitzRA1ixw+?=
 =?us-ascii?Q?C6PVE1cGx1N2tUWEuISurvIlxcHsoB4vVyQdjgQi5e7rBzS2ckkeLGsHEcfi?=
 =?us-ascii?Q?VldD4UFh5DL2Bvzn5MDOTL27s3X47+y1FNTSJ/OFK4TpD3qCmDOg3JOsXSnD?=
 =?us-ascii?Q?rHp+Jz9JUD17kDgXoRwoqcW0MsLKRtaVtlelVE62MmNFN997rlGNG/G3uqze?=
 =?us-ascii?Q?gQFY07janwLG0j69Zzk6VNxcgcP9XixMDFOkV75haUOR1F5a+Lxe9w75SqPJ?=
 =?us-ascii?Q?xr8mqjz85rZ0XhHBT/unzqIa1dTaWxZ8UrwGfxlf7cnLUY7K0zZxWCr6g6Ui?=
 =?us-ascii?Q?RePD/QWE+JxWAr8/FWlIsA2M0HviIXW7yrqC0P+YDIRHmnqPNWTNdZY+gz1a?=
 =?us-ascii?Q?P8CykHNYe7Ogg570rwaBiSixNXK5EGXNWeCbFrMJzJ4IeY3P1mxNpm3GBdox?=
 =?us-ascii?Q?mV7PIxa9mK+pPyNHSIgxehdiYqxHCg/GHklAtf/3kz2wjIrRIR1QsY76ZUDG?=
 =?us-ascii?Q?KusxKgoh95u18WCd0m8i4qu5eiZp5FEXMEPhggym0855AhT+OHOIXdMKMpkK?=
 =?us-ascii?Q?jmxB+wAYFvFxaF69VPDy9TrGkyvM6t58WASQ31WMWW4nGxuAKg4cUztdMNps?=
 =?us-ascii?Q?WwpfTF4QvY6qMnprjjw+VMCc1q3iJTXjMGXNJkJRu/f0gOAq9CZVLzZfLmjg?=
 =?us-ascii?Q?IXiOl/T48+/PBqeki0FGUMBIZhFILYzltt69V0ElEP4E3iLsIOary0fzz/JX?=
 =?us-ascii?Q?lE3LgCWC2vjuwwQSWt9QKq5+fu2euWJwrtugVhnFkBJWuOpumz/3a3qciF/h?=
 =?us-ascii?Q?MqGBvUlrG4uPiicHnNmlCTYBDHOm8euYOzV9xxsYbtMvDmL1TrvZuwgAOVJo?=
 =?us-ascii?Q?84+duadZsImtGeL0N1ZJYMURvV+IZBfZ9Phf+aAj3F3DOgv0WGxBGdxm7+n8?=
 =?us-ascii?Q?Ke+iXRyhKOsH+5KCTaAkVqbW3NTBlPGAljMbQsdUoWUkNvHqW3I+sns2+15D?=
 =?us-ascii?Q?bpiZqOijIA9QcpGdySxDILehjkMgKMFD+g4RcYpmILgtjaQd7zBMJ5R9z8Ol?=
 =?us-ascii?Q?CQBZsQave/Mo7Irv2Pggpt0Omui3kx4Lv+/6LSS0+/qigUePpiQfHk4LMIlk?=
 =?us-ascii?Q?tuOQ8VV+zhGj/+Z868R5poBdGu2SIPBb1V85s0HiL5ZfHsCrbCI3JxH3pDT2?=
 =?us-ascii?Q?1oOVgioGQzFJwZpS8LjTM4w6/IFL/3uQHfFXgoRN0tsQxw/m7g6pKDfb/nkS?=
 =?us-ascii?Q?dhN3cNo2mVpthKOYBkFVMlQYM0VfRIdJ1otMi4+WsgLjyYEXEEUqROy69p3a?=
 =?us-ascii?Q?+iR0n5sgFm/EQn4kMAR4vwfJu8N3nE9Z7Rp/Ca7kcpGqHqVsY6X14Yti2swc?=
 =?us-ascii?Q?Qej8ThDprd59HtxAGQuhLAocs9Rmcsw=3D?=
X-Exchange-RoutingPolicyChecked:
	hY6uLdOvhnsQ5ijwCvQ+BxYYkNja8oPOn5D6mwXE4EO8Lp/mCZ2fIhJSXZhvzDVzAMS+WmlkV3gUTGs4tQ+CPG1zipdMdO8HPQ+nASPXpzlQMXjwceezcNbfrTrwM9dZqLe/7LxguWwRCQ0rTtGy2EbeXQsv3ZV33Z8MGXCpQG6zhPL7uFFMq04n3cMfXurAmH4VSQ8G/6JU0Kcxq46rnMywUNpHOXGxwX3eSeW1aHvxG+PBmmeFvgkCgllUWrJp7GMi9YfsT3Kma2eEfDZiJn4t9pYFJy1y3mZp4YCVytKYEgATEX58gFqyuDpC+9PhiJsUja4lcixENQ46CPUPqA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6216b239-493d-4318-3a7a-08deab1d5d57
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 03:12:54.4147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e8yLHeEkRkiuI8XUndHoWqcO6EXPCeF/wYOCprQOoMlTb1qY5IjN9hGpCLcaT3Rmyu0/oJ3zsNL5J1+oHjqTI9EuHHIoAZIWTI2gHYgqiD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6388
X-Authority-Analysis: v=2.4 cv=AdaB2XXG c=1 sm=1 tr=0 ts=69fab1b8 cx=c_pps
 a=pRydOQwFKDU45SaoCSWz9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=8AirrxEcAAAA:8 a=UgOjM9SW4ZuDxLeMq3wA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDAyOSBTYWx0ZWRfX+lDI8EXfaPbR
 S5DdM0hQgp5CgJKRfrlltbwjGkdz2vScJgygC91R24jWyEK/CwGejIEcVAscYlZuf96kiYd3Uvq
 xZjmshqAnsnjAmmkBFCII5Cq7zn9QBxHcCU/LjEdR9ybTPrryXGFq9MJqUmICs+Wjsl0ZvV7jO4
 ZosWxCHnbmRpFBqqOJ6chRC0FA0Uls+9d1SKWxuUlALtpMpiPHNzZyycaeWCazqhlvRqtyqb9aG
 T0/w564g9XWRsGF4jjMDECIeaIYiFFn4ubigC4BnpvtzSovNE3Szr/7ElLIb7BHJtEd4X6WzjiY
 SKdQoBhcLAVDVOuD1L/N32bWol+OJBAyzxq+ne9nwCnRHUCi4+BIQhmfniGKbfj0C6K5hvW+9Kb
 7QpzCgTQWxvVQzOu1AXHhV78/igkvyZaFp5nsk5BpMyftrcIi7hevgmmRgYHj2UGlTULIawF83D
 a3QVThGd+HDvjf1XShA==
X-Proofpoint-ORIG-GUID: RtpLbFkcua2zOrwKuG-BhPSfjWlV3kpC
X-Proofpoint-GUID: RtpLbFkcua2zOrwKuG-BhPSfjWlV3kpC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060029
X-Rspamd-Queue-Id: F37174D5D49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60504-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	DKIM_TRACE(0.00)[windriver.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,windriver.com:email,windriver.com:dkim,windriver.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-media];
	RCVD_COUNT_SEVEN(0.00)[7]

KASAN reports a slab-use-after-free in __media_entity_remove_link()
during rmmod of imx8_isi:

  BUG: KASAN: slab-use-after-free in __media_entity_remove_link+0x608/0x650
  Read of size 2 at addr ffff0000d47cb02a by task rmmod/724

  Call trace:
   __media_entity_remove_link+0x608/0x650
   __media_entity_remove_links+0x78/0x144
   __media_device_unregister_entity+0x150/0x280
   media_device_unregister_entity+0x48/0x68
   v4l2_device_unregister_subdev+0x158/0x300
   v4l2_async_unbind_subdev_one+0x22c/0x358
   v4l2_async_nf_unbind_all_subdevs+0xfc/0x1c0
   v4l2_async_nf_unregister+0x5c/0x14c
   mxc_isi_remove+0x124/0x2a0 [imx8_isi]

  Allocated by task 249:
   __kmalloc_noprof+0x27c/0x690
   mxc_isi_crossbar_init+0x22c/0x560 [imx8_isi]

  Freed by task 724:
   kfree+0x1e4/0x5b0
   mxc_isi_crossbar_cleanup+0x34/0x80 [imx8_isi]
   mxc_isi_remove+0x11c/0x2a0 [imx8_isi]

The problem is that mxc_isi_remove() calls mxc_isi_crossbar_cleanup()
before mxc_isi_v4l2_cleanup(). The crossbar cleanup frees the media
entity pads, but the subsequent v4l2 cleanup still tries to remove
media links that reference those pads.

Fix this by calling mxc_isi_v4l2_cleanup() before
mxc_isi_crossbar_cleanup() to ensure all media entities are properly
unregistered while the pads are still valid.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 4bf8570e1b9e..2d639b789910 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -556,8 +556,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
 		mxc_isi_pipe_cleanup(pipe);
 	}
 
-	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
+	mxc_isi_crossbar_cleanup(&isi->crossbar);
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {
-- 
2.43.0


