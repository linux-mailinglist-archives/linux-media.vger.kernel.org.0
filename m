Return-Path: <linux-media+bounces-54562-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JFHMUoIqWlW0QAAu9opvQ
	(envelope-from <linux-media+bounces-54562-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:36:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 279D020AD86
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 05:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31A9C30790BB
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 04:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99293238166;
	Thu,  5 Mar 2026 04:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="KB1Eyzua"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87318212548;
	Thu,  5 Mar 2026 04:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772685325; cv=fail; b=FcsmSSglpCbB3eREv4NZ+2JPltQpCrA52wvCkI4rVlYTXESsE+DjnobLUspdaEgTyxjMRYphUJhkaYIUyAFOCPAOvviUN3HUiQiUSgzc2zYn2q6gQ4cVxTrE1zC6R/p2bCvminiO+ktKDeqoUPTqLd2vFUn8yuBlkm3Qsgv3hFQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772685325; c=relaxed/simple;
	bh=+WQwFj9fZUKWYCMwAa28qcvJ2BWft0Un3E1SJP2Z5yA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=SBZhmOGaeFlQqxuOk5E5/U3hajH3KUp3mabgF5QaD/tU44SZf0nPXNWs/ctZe8HA4oZrzVHRpy6A8uvTVF48uXKrYQPh7G024ABwFvlmFk3RWfewFBQHhCSDRGWhzTYtivOJJ9KocGzulDQXeDcVorkAtayFFrn5yya9wdKPyBY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=KB1Eyzua; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6251G5kA018028;
	Wed, 4 Mar 2026 20:34:16 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=3li/OT7QB
	X0R9z3mFEQuF+kZHXOKC4jZrK2dBpVhs00=; b=KB1EyzuaZRxgdkoWLms/JF5j+
	zqeK5cFMYNCgk+otPYGaJaZk6BMyYq9+OQ/A50YoAWdQLAh/ljl4hYg4U+49mt3D
	SwZ9AWX30EGodiPgfUEKXuaWaL139QCgnlEue973cwyMqB3X6uxSn2f1MxPJpZmm
	SrmZexLu6OOLU41IV4kkr5+FnmDhICFWqgwZ4juDtYUe0NNco7bue/mmCtCBEibm
	k24eGoWcxJRZxxeAnYTTkdGUDCE5595t6LhYcHY3hIFq8Nw5yJBZwlKniavjdsd8
	7eJrHUsekRXAL90ryG+XNFaNgVWpu02KJ1siXxaIv6QoGlxbKoUOyzgwZaDXQ==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010015.outbound.protection.outlook.com [52.101.85.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckvh45nf5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Mar 2026 20:34:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dvUk7PiaI/zqWQGJR2hwtOuy7J450iJxJoTJonDXRZexKebuLPWZzY8LzM5PuZRgNJZrf1bKc7CexHJa192ir9bfOmpE3yR+PaY/hWvJXVc+wwWaekoD4xTNGujzsaStTKo3AlQKqVfQALk6Jzj/vhIlHSftGz5dkd+S95KDBuVsOIbjaqmcmg5BdEcpVgSlgb5PoHwHOpNCOPfBTh1op4uQqoFtl5w18sTi4smzL5VLm24Yyb6exCCHy3Q+eOlLob3wGvPXR5ULulcX2e52P80IPxY8EGmqNUzwBrO0EiyT6k+GCL7iDFW4fsUEpAJrOvkiJuSMMM1dm6kwzpjzuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3li/OT7QBX0R9z3mFEQuF+kZHXOKC4jZrK2dBpVhs00=;
 b=jXrPp12PBK2KLaMg3RLBkJPvxZE0B/Vv9bv3+8usbSGXTF1WaQvwzXsmatl3U0yZgyOutJI1lAAASPXs5Ariv+b51QBb9ZLpdWLFg1oI3jwA6RvMczOQURD/bVxoy2Wiw/jXpRVpDqzODPlGxglxC4nOnaxrd0PkKyUSifcQYn87Xkl2IjmyxXt91Mdh4FdnAT4FlPSCcLl1xvUA/4rZtMuXwWhLjcnv4wmMuCXJhkc3CE9K6vavYATBXXo9jIShXrJthowpJGVWCon7NnZ6NF57VmLT5BfgEUe+OqC2oW78TGOjp0iFHG5D/tyZzCP3GBKNsiewsACHLc9bM0hYlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by SJ2PR11MB8347.namprd11.prod.outlook.com
 (2603:10b6:a03:544::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 04:34:12 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Thu, 5 Mar 2026
 04:34:12 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, dave.stevenson@raspberrypi.com,
        Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] media: i2c: ov9282: Modernize driver with CCI and streams API
Date: Thu,  5 Mar 2026 12:33:47 +0800
Message-ID: <20260305043350.2151936-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:3:18::20) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|SJ2PR11MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b038c0-7569-4645-4357-08de7a707355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	JaqEtqlGqnBVbCi0Fo4eCof164T4tbUFs/Cdhd1FScwOJkw5IQP7sjSrg0zSDEiv9uRHaqZsEnvUVqqZWk28VaJz6W+8zoQytlJe2jCwBxXKeP34+zaxz9gmECY3B///9OERMbdvPIH0ViJ/n7tCabvvd2LD7+1LGaVet/wOwBX0Qb1diN/KD47h2tRK/I1zlL8gnU7N+Kmghk/qf8wTUC4OZ+dtr5rCkCB220N6RUUBddQDU569WJTLnreaTSiFMj+v8AEilmP9AvDhGkmiZcYCKPRlqs8UupCoZaF93IU0palKqhDkY1MYxok0kzB2gafQ26MLpAQkmV0iWgoqYmD7xUDlxoDtozwa0tu+txAmneBuvVW4ZzdvHQzK3jnij2vmaolZJyIErsJydrpUvpN1hbyrDl6peMa4zmP+AJiA9oc8R4//aPBmpvNnyTTPTS3hAwVSv3Lo7j7Y6AOD2Xh+owStOEJnT2s2yRu85xJlEKFOgw9pUshy8RbExF1uOZVCqI+aFqCEFy6QuFWrrYMWnZqIGdRH3OCaCHwyiZ1HeNZ06Km3BSXt2sD1VBdxGs9aCxlGBxYaHf58kPpki8sawYQSuUWPXwWettJhL4ganYvOTLPERN3IoL7pQQq3gZUAd1KksrfK6fUiGJrtMwDEy35hIOs3YAWpk1HqhfLXjcewnVfDsjBsCg2ckkZGmwnpHsa3IAUfQ8H2lEeexJ+VCTwPvpTtR9xUJFG0XGViQSTodn174Ao9xtAqSETe
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SchT22bbGPYhjMFO6KkPNb39VQ01k2T13gtYrVF04DM5m5h1pZSAmErnJp7l?=
 =?us-ascii?Q?Nrdku4qbblWYorEiCEacsd3XF3/qNS/DEI2IV4kDymEIv5VEner7EB93tq2e?=
 =?us-ascii?Q?aohQSahmX509nqLu/OU6wAN2/Au2TGN3e/aStCrHcmdi6CKermR/3rp7l45N?=
 =?us-ascii?Q?qwjgdoULfqTDnWIXHAoD3FVsuP9ZLDNz0nqeUxbhsqMoLiQvn1rwfamMv797?=
 =?us-ascii?Q?Ajn4KUNK8hK8Mlfh2ghW6sA0Fn95Y+5nOjQyngqns+JJXN2U4H3JPEBavEkM?=
 =?us-ascii?Q?iPyoBTC5Wbn26oZmSIjUdpNiw3CDiY2fflSMK72JyT8AALJeCGE2YbdXGy+y?=
 =?us-ascii?Q?lWi+P1POf2IhnmFEG/7c1fdfQ/VGMZKbN50H8RsYs+5qXOOMLdRPVe+3Bvk/?=
 =?us-ascii?Q?6k9+Rmt/6kSSR4DWH0ABRsLxKH7XelNfIowK1vTRQ6v4aNGO3geEfDcBQwtV?=
 =?us-ascii?Q?L3Hiq8BSzMRgmy2/3twFn0QuF2pi04igFEX7BHva/JZYyFPSC/ifUw7uHoDu?=
 =?us-ascii?Q?C4q2lDLPTI7T8CX9Rqh3IlznKX3ImYawZOElorpuJF3jWOEoJNioq4kpZKlQ?=
 =?us-ascii?Q?3YIYSGzohOdfUNEzdokM+fJSIjoAP438BM/GSXnD12nsx3mf5+ABwyGLXxRi?=
 =?us-ascii?Q?dll7zJDJyHQy6eBbmJ/ZZ9R07Rgjz+eXdLtx99A3wpP9GGrKakPSsfynfAnZ?=
 =?us-ascii?Q?4m8U3zmLNilTIUS37lrx4cwc/zf4SvmyFHyg5WkXDHU0o7pURElCxZYnqJ8F?=
 =?us-ascii?Q?h6BLKu2eMwnHuTAnzDQE0iTR5jmWDSzNnWvA305yMehRV28ekLvQUwFZziqf?=
 =?us-ascii?Q?rFX24kPWPeHISaQz5qm4qhYekyh9F1r3IymgBG70yk+ccjbh5UXE/wqlnPQv?=
 =?us-ascii?Q?pF57XWuWSYvPUCZUF5Zr5l938WXzC0Tp75yB8EI3iR4+UcqGNvMl/SResVCL?=
 =?us-ascii?Q?9mpVdj3VE+MiZin2Pz1ImlNN1fdYmyU/CChFTGXG7gXWuRnwYuak0TBdriuU?=
 =?us-ascii?Q?hZARolATtT/V+9U9IRyjWKrdU5JDdvGvOCXQ2/DYBjD1HaxvvIahRUc3znXO?=
 =?us-ascii?Q?m0U8wVHioDtWUYbKkCXgGmMFJk3G6y3pSJP2ADHzA7wpSyJGOcOiY/v4L5nf?=
 =?us-ascii?Q?4ATFecp4wGkm/QIPRqlxeh9TDmEOmrY9NVeYDEPIr/kDvmp1qlOF3JZPG9Gn?=
 =?us-ascii?Q?5okXmbNoF+yNR2CvA43o+BREwXsE3vUkmKngrTm3GKDhl/V8emIxXQFhLjl3?=
 =?us-ascii?Q?RL4jDM9mMZrufcNnPJzReeweqdCuxbzz2d80GUVpP84eBC5U3dl9ZrxryoR7?=
 =?us-ascii?Q?EakqIt+xM8q6qg1niREm6jQQCf3Q+toH9F5QwXi9vlbEVDvxxe/HS4cJbAQA?=
 =?us-ascii?Q?lKDNVPxyv20eXprvR9U8EwfmzzVpOU/KLgFm5F+UHxubnNRm+cdJHZjtNm/i?=
 =?us-ascii?Q?KV7d+Trwj4O9qPWL78m5RLPX5yutYDEvzg0WmFf16VvpooiL45sgMkAK65Hg?=
 =?us-ascii?Q?PFlkcx7bfUlzl1bsdvG8pC8vHZdC00uPv44w9qhekESmJ/AZSwNgpJBII7PL?=
 =?us-ascii?Q?WGWo8QYYtVD/Qzi9sFDjCPgzJHVhSHkfwkT/6cjH37EQ/NnyPNk0/NmtwMcE?=
 =?us-ascii?Q?NSGhmNZjMnydTVau0lnzwE5YHM5yjdRvJ091wfb0gEjdRG73DPyWwDjitSh9?=
 =?us-ascii?Q?29pDjVRJDzMqClvII14cgMYIl1e2GJyrppJ/i+fFAYMLt+tsUdUPDsd2cdWK?=
 =?us-ascii?Q?ns90YlJcVesKqctW6M07cJTPlKpdhvo=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b038c0-7569-4645-4357-08de7a707355
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 04:34:12.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMWVYOLZZ4guSAx9JytRnADlx4p+Y7dR9/aC+ge2nCJ9S8tfg0a7s0gseKeNNNOp1Ux3/jPzUn7JF+aAVUyucKxcuhW8SdPq6yuzX7bOlPI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8347
X-Proofpoint-ORIG-GUID: UayyoQ4BGajTnzA0zryddRfCVg6KzUxn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDAzMiBTYWx0ZWRfX4Yh4Nd2/JKX+
 jnd1Fte06UD7VPa07mQ1Nwcd27roJ4YYBuzb5VZStpeyZK/8lXKvm0eaC5zmBFyKamHD02R6FIK
 yUDh4mqKdp2qUJ/iP5iUSvDJlH6iv0mEaHnPoGKqALZ9pVKrw/3LoH56aYFyKnmxMSm4fFsGUlb
 qhpIuINhuRBG1wIfHlnZCgNvhDC23TZW4Ns4ed3yLFTWlprTIylFrPxOk8pY5AqhwFiBT5NSGOM
 /RJwOjnD5HiJFGmAddIz+4ZOELcsV2UOgBYo+QQ5wnKVZIXuhZ89Pkiw8adw7LXcJIJUDEXpGfu
 g0x0aMwHNiF4r8H/MFNpFiAjnBycSZx7Va2ATKsAiWwITKNyDqAxJ3AATEPeHHqmdws4qGdTPhg
 c23KLmnBa/o37LnosWEW0x/d2IJdUkfSxckg01DdgU8Wa+E9BU097wX5bhIDmxpr6o6LnBt7kVE
 6+0rGctlYPz/mJ19Tbw==
X-Proofpoint-GUID: UayyoQ4BGajTnzA0zryddRfCVg6KzUxn
X-Authority-Analysis: v=2.4 cv=Z/3h3XRA c=1 sm=1 tr=0 ts=69a907c7 cx=c_pps
 a=7JMGdgN8pDCDbqlksaqmUg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=xq3W2uTSAAAA:8
 a=t7CeM3EgAAAA:8 a=ekXEql0GMc9u5THJ3pMA:9 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050032
X-Rspamd-Queue-Id: 279D020AD86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,raspberrypi.com,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54562-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,windriver.com:dkim,windriver.com:mid];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

This series modernizes the ov9282 driver by:

1. Converting to the common CCI (Camera Control Interface) register
   access helpers, which simplifies the code by removing custom I2C
   register access functions.

2. Switching to use the V4L2 sub-device state lock instead of a
   private mutex, improving integration with the V4L2 framework.

3. Migrating from the legacy s_stream callback to the modern
   enable_streams/disable_streams callbacks, providing better support
   for multiplexed streams.

These changes reduce code complexity, improve maintainability, and
align the driver with current V4L2 best practices.

I verified each patch on the Raspberry Pi 5 platform.

Changes in V4:
  - patch 1: use cci_multi_reg_write() instead of regmap_multi_reg_write()
  - Link to v3: https://patchwork.linuxtv.org/project/linux-media/cover/20260303104942.3111366-1-xiaolei.wang@windriver.com/

Changes in V3:
  - Patch 2:
    * Remove unnecessary ret assignment in v4l2_subdev_init_finalize() error path
    * Move pm_runtime_idle() call after v4l2_async_register_subdev_sensor() to avoid
      potential double power-off in error handling path
  - Link to v2: https://patchwork.linuxtv.org/project/linux-media/cover/20260301104809.3505257-1-xiaolei.wang@windriver.com/

Changes in V2:
  - Patch 1: Fixed group hold release error handling in
    ov9282_update_exp_gain()
  - Patch 2: Fixed runtime PM cleanup in probe error path
  - Patch 3: Improved error handling with clearer err_pm_put: label
  - Link to V1: https://patchwork.linuxtv.org/project/linux-media/cover/20260228083401.1007434-1-xiaolei.wang@windriver.com/


Xiaolei Wang (3):
  media: i2c: ov9282: Convert to CCI register access helpers
  media: i2c: ov9282: Switch to using the sub-device state lock
  media: i2c: ov9282: switch to {enable,disable}_streams

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov9282.c | 677 +++++++++++++------------------------
 2 files changed, 236 insertions(+), 442 deletions(-)

-- 
2.43.0


