Return-Path: <linux-media+bounces-48216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B07ECA30F3
	for <lists+linux-media@lfdr.de>; Thu, 04 Dec 2025 10:44:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CBBA30BEA7E
	for <lists+linux-media@lfdr.de>; Thu,  4 Dec 2025 09:42:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468DD334C39;
	Thu,  4 Dec 2025 09:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="AMGoywiZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00BB335556;
	Thu,  4 Dec 2025 09:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764841356; cv=fail; b=KiCe7qBk6eXzVt6na2ZSJ6w6vE8GVrD55SoyBGLDWHjH7zbRBTx/pltrI7AFQakbKz/c1DQ9hjQup1AepKVr1Df5FfqFL4VE7a4ZZGRP1MyJBe1BdgbUD37nnrhMT0vnzuUbR2UAK0/uU9Ccy0bVpfyPv3sUwW1nC63nCjaZp2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764841356; c=relaxed/simple;
	bh=vL1wORwbNGe5iQEFziFN9tO75d40K+xZELBRPTUph/k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PIqp+t5cBSSc3sym+ZbXWcaSyS9VZQ76Q5nWw1tEUFtuv7ENSamMmMpTPgsJHq2kn8VY9ZhQOQBbqIP/35P/OVOAQF+bN0RO806vsZqAIjzjO2m/qzHlB3A7dUE0hftKpX7Vp+5NejV0qaO61EGO3vl8u91DidmiTwdk9cRlfxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=AMGoywiZ; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4763x6911639;
	Thu, 4 Dec 2025 09:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=tPeZudnBXTTYkF93sbqE6hxqeY/nW4J40y4iHo58/FY=; b=
	AMGoywiZvV5/05ki83Tx/X4ssf+6X1JG1ZweLHrmyAs2YjR8FdpnozDiNFG7ia7R
	RGlfAv98jqzla+CPoK9lrjm9qApn2IOGLXj48ix6BN8ZrBtBVS9BbDLMIcfILFqu
	U4Y2J2Gy6hY9YuXChgCtCUZTV8DDI1TS36CUDXddtzlxSdcQ8GvPuk07o5ree98D
	8ifL6uwORCWWHpiT9Ur6gSsb9+W9RdA40oFTJx5R6HFgjYk/5ClH3Onz+MMt0c1A
	/aUJwqDvwDQjfkLJ2Hw4hfItZiAnO2BuJUntrZmD4G1XQHBZatD5O0EkAdybczjP
	zyFlhuVLuD29lUyJJ/TtYg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010021.outbound.protection.outlook.com [52.101.56.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqqt6e6n9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 09:42:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsTcuuKrS+PmX2uAyMal8k8nGYIMDkabKZpOJoRb7lfgF56tzhpILvCeftqr5nc113RekYD5kI6CmT+w8o9Z8xOFD2rTPJS+ev0+l39BlL0ZyNoFVjXPXSswwVtZzT3Om+O55UoPnm2CR9HCuDr2SW7tYqyvJnTFvdcYVfhFTec2ljorc3bUjGTP8yLrsGuTDFr2bNC1bMzz4v1rXVcUTbIKVPMTWaypko/pHzROlKfmHxqSMmrIf9TAlnPtXBCe61EF1Lqig6ySVTPmNwTZbbEG/S8jIbA2tm01upgupTJLvQT8wZqB+lES4z8o65fN7+ZykCCCiUyLSEHlVSoJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tPeZudnBXTTYkF93sbqE6hxqeY/nW4J40y4iHo58/FY=;
 b=QY4sP4qgfjnqIdd3NrCpFj92cyqqto7PApDy4I5GN3kLH8uxihp8X9M0Rc+blLpb0oNOpGgCrqD54xmk7elXIUrlj3ODeCOlP8elKRDxhx/IeXUV/HQORV3xC2lLO/JE1f8ZizkhVgV7GgcCjto8Hi39h1pugT5YuqPSyTGdZ9lEsmQNvD7d+QSk2+SQm5s+YDHERvC8vPf7PKSoTh91qx31OVRSS5vWEKxpgzsrzl/xvs1slSaJPblxYOf7s/8tpx9uz/yrGLojMsLivcNgdgid9+A8GP5tmjr6FkwSuxELzMngAY0OJNx5iouQyJ1P/R5sfOCesbHieSrBP1mymA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB6550.namprd11.prod.outlook.com (2603:10b6:8:b4::15) by
 BL3PR11MB6532.namprd11.prod.outlook.com (2603:10b6:208:38f::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 09:42:18 +0000
Received: from DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e]) by DM4PR11MB6550.namprd11.prod.outlook.com
 ([fe80::9185:ad7f:4c65:a41e%3]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 09:42:18 +0000
From: Xulin Sun <xulin.sun@windriver.com>
To: nas.chung@chipsnmedia.com, jackson.lee@chipsnmedia.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        nicolas.dufresne@collabora.com, hverkuil@kernel.org,
        dafna.hirschfeld@collabora.com, xulin.sun@windriver.com
Subject: [PATCH v2 3/3] media: wave5: Fix device cleanup order to prevent kernel panic
Date: Thu,  4 Dec 2025 17:41:53 +0800
Message-Id: <20251204094153.1530331-4-xulin.sun@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251204094153.1530331-1-xulin.sun@windriver.com>
References: <20251204094153.1530331-1-xulin.sun@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: KUZPR01CA0014.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:34::15) To DM4PR11MB6550.namprd11.prod.outlook.com
 (2603:10b6:8:b4::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6550:EE_|BL3PR11MB6532:EE_
X-MS-Office365-Filtering-Correlation-Id: 3921b3e7-68c2-4ac6-7180-08de33196a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U7K5PqpO3M2xyepfgD/any4oWx5pi/7z7KktcgpmsnUqGRa3bEE98LE6fhm3?=
 =?us-ascii?Q?HhxVMH1TW7yFpqCsTJtyP+fuavQXBmlutcqQaiydEJVDAtw1XdAA9guhqvKa?=
 =?us-ascii?Q?+e+YDdiY9CqgYK9HQM21id72NvsLTiJRJ9RnaQEwmkQtpKGF3U4Kld58J3+s?=
 =?us-ascii?Q?lWm/HQtvBshrInwFeQOcAc3uGK+BKdH4wy+2nSEanRM0+WojHe/p+6MN1FZH?=
 =?us-ascii?Q?XE9EiqjsSPd88PQU4ECZzS6UhDUB0ESb714OpuojyhALWM0y7uuun/fyzZLa?=
 =?us-ascii?Q?FNW5Y5HE7+vkqZjtbnd6bG3IHEoAiR4onee5x9KO/k2zKYGr9QB6O1lweRhU?=
 =?us-ascii?Q?4O/Rs15GAKqwnTixhaCF7qkyCo4DXE/Ds2qYe15GO7pvJ//YyFf8ibXDa5yt?=
 =?us-ascii?Q?kKbRagZyfXUChcqZIrBG2vWYLFMkR9eahYORFyNsKRhK7ifE2p8DHl7UB9Za?=
 =?us-ascii?Q?K+7vW21eJDj4aJuxZ8MYpWe6JhLHIwNVtAQZsAzhErbUm0bjfcfTOhLkjpv6?=
 =?us-ascii?Q?Gdfle4h6iVNGwTfO4fDaI5WWZORxGFkvHp3QU70c/ZCLp3KtSIhjod+9Kkhm?=
 =?us-ascii?Q?fyJg0sC5T+8TrEnoCdXdVGQ9098O0Q6/myfwwtDEeJ5k8giRohkZr4sRJU0D?=
 =?us-ascii?Q?tFmMjQ+qYB9Rw2pRHXvnGVVuUj/wv+fUGGb95KZLzLl7edXIp7MwV2PXrszz?=
 =?us-ascii?Q?0RNJlJqtbWpWCzrrYa+LMS5hxbFinNKsn9xNaMrlNQGKMIjKw6jWcyLChFgG?=
 =?us-ascii?Q?Ka8gO8XgMZIUkxdalZDhweCMz3mKNwI9MeZS5ydTGkBolt49XQ+qi06fXVcg?=
 =?us-ascii?Q?5aIVvjrif1rLdXfrDV3/qVktCCKRb/ZOenEDPBD2jKMGVngbe24deZegApMD?=
 =?us-ascii?Q?vicTOjxWBvl3FrukjnHA7qgCqDKpBHo9ucGmvCxp8Cefw/NdJayGwGCtFcyA?=
 =?us-ascii?Q?SResE3bbp17YtkDmtC9vRcLgah6W+G9d61WvzzeIAR/quM0jNz99VSXMDZXb?=
 =?us-ascii?Q?cNrZ3BkTcYcRYPU88lDzopWTHsZHJwRf8eYAB9rNQmC2WY3+AzxHdgedsRES?=
 =?us-ascii?Q?VVvnG7YU9rfe66I1j3cDKwaOstW1vlqCBI54WXEuKYZqbOOd7hJO7JuNM7lR?=
 =?us-ascii?Q?nDL8c53XWzywPVUd3lGuziC3gDk4dUQtxyFiHyz507hmY4Oj32snNS2W8GSO?=
 =?us-ascii?Q?kePUriLTjD/xj+htM59VxYeZysPDsJPASOsgTzzAq8CjyrV+mFMOvXdLbgoH?=
 =?us-ascii?Q?bnl0+IXM68sH3kycTgD5FVvB8nZaco4HJ08AHf+UxSWTkDV8xafhe37FIKfh?=
 =?us-ascii?Q?kbbE1NNnu5k4UMCGOGaUEMMDYieALaE45WAtunMM9FCmVs2DbAZhgH329ijd?=
 =?us-ascii?Q?GsNT4zFbSD5mIoHwu4lKtwmsPp4qBnuj1X83JSlEhiN0GwQVpav6zM5DA+e9?=
 =?us-ascii?Q?H9etzjjK/vrOD210a5b3vAzexi3hv0cR+BNGER2AbeE/4QGYYFlYvaAdq6fP?=
 =?us-ascii?Q?mz7RJSOO43PMvgDF2Wb64oAGUL1O9+Vs4Z13?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6550.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SDxWeoKxePzEYwupAefCW9T31QoAwgP8Wqnt/6tvlsHApkCCd4dWUff/QNia?=
 =?us-ascii?Q?PVPfxHeYZVkSu2BCzmbExvxkwAotdqpLaKXagNILyR9jjXUOPGg6SQUCNYDM?=
 =?us-ascii?Q?UcBExOEcYJXti+oY+/wu5rhv5Ys+v7pmJ2hjvJtUIKsZVm274pxIVDKpWq+/?=
 =?us-ascii?Q?Uo/5nz66UWYU/3fUOwcjjnEwXLj8XBLq30ZDyiHLjHYXom0iY8XbC5zLv3Iq?=
 =?us-ascii?Q?5NtB7qE0iLPcYpMLyWQJPwUOAzr22tLvInxi89DGz0m69ThlqxMRabs2r6vU?=
 =?us-ascii?Q?jXc8D9Q5HzBG8QMbTkNZnokPAweVeweFLqyvZF68gYDJWnhtqFsj9PPHAERF?=
 =?us-ascii?Q?wGGiJabO0Q84oINIh+0T8BT0tEMklZziA5cAaoDHskZg088Q0QRlzzyQJRum?=
 =?us-ascii?Q?6tklRBt3t2jFWB4oZJheuI4j5LU19U5EFpW/XEiGQm9X4uWgYY7aYpmYy0Eb?=
 =?us-ascii?Q?EWcmGo2LDzR8lcvg/rVxORP1wazl6/Vojn2vSuXkUbXhuu2ImGsbQZvpCuwV?=
 =?us-ascii?Q?zub33YJJUbX4AlgGf9ky58AsmRC0W4ADq8vMAWEBe7FLgiVy6QSDhVK7+UNa?=
 =?us-ascii?Q?oCrSXXqVl0DNlGsw244f5yXyXiNXhB4+EUekRsfL6U9cUCYrDLMzCxuFpMHl?=
 =?us-ascii?Q?L/XqMFt5yRkK3ycOsF7mfhb1DKyJE3LK8+X5P+mgNgC8rSsaLakaz8fZR9fT?=
 =?us-ascii?Q?UcL+x69/DZ9DTilXO+EndaNw/G+bCPzTioMcsrb3OA8FAF3pIOAaxyMuKgMa?=
 =?us-ascii?Q?1U2IYGcsFasZLZZhOo28JdGP9/+t134Y0lqpGe5rcgicBqk8wv1lnvCkgUZU?=
 =?us-ascii?Q?GwN8S3/XB3UoO5Lpub1vMWHapja5lK2Af13sib9GT2NjE+Vk3WlHhU1xLqz3?=
 =?us-ascii?Q?B8d8C1WQZl9xT2DaP12yf+pHPeZUUCMlV8bEDKEUiRbg5c36iq+OSM0J8V/i?=
 =?us-ascii?Q?xddPfscfnTJq6mhFz1I9DprtqLBtWGyLhB2mQjw7sEC23ggSef6A/aYUirs6?=
 =?us-ascii?Q?1buK2S6IYAxPwmJw4jWc4XEp0rb19tde/Pc0BTz4Q4G7dDPCr2SyscocbfGd?=
 =?us-ascii?Q?9j/1Lw1Y2+u6Cr8nEAitl9CKlFF1jK3Immb83F6ataoIyYMbYmsfZHvZzV0D?=
 =?us-ascii?Q?xIZY1Z0Q+7jTMMBj8pG8WgFe61xA9g+QLmPehaGJt0UiSucVgfTZUyQJ2lrJ?=
 =?us-ascii?Q?AG1lX4VPMhSn+y++riwOFDwq2BuCi3ZtvUCJ2dh1et+miMAYFzr32zbvQwDm?=
 =?us-ascii?Q?wN4ZZ+AQYJS7ENawRdxLbL3MGL3G8opyFcw/Cu+rudHxN9hrIkmwkl8cvgiR?=
 =?us-ascii?Q?t5A9esKyI5giJlHADwNA/Txb9ggQUNM2cihderEGLthVsx3at1gb7ltagM4c?=
 =?us-ascii?Q?yZLvoHyAaZ5tTpr65i99E7lIc/gmlme2dMdq8A1Vf51OFa2AprwEij5jagnY?=
 =?us-ascii?Q?NIC8tXP0VxbUqJkqwAyrjxrhc2Jt910K8jMDxFG7jYlLXbe186yKVK34eOdh?=
 =?us-ascii?Q?P2d3CCjfEpZevZdbYqq5wNMLfPuMHhgksAaLWkfe40N22jH8yl9BHrhQL5em?=
 =?us-ascii?Q?izDMl0xD+Ybgchlvmr65fyhv/WSCi7Gkw/GklRpoa3XONoze8A1jgu6NgneG?=
 =?us-ascii?Q?9A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3921b3e7-68c2-4ac6-7180-08de33196a3f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6550.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 09:42:18.4565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkhXOswbBURUlpFKmomVP8j5/cygKCsHkxJMGYWF7gI8XkZGw5Tm28H23XUExFTjDAyOuJ2mp1mY8TAZB0vI/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6532
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA3OCBTYWx0ZWRfX30f/9fntGP1G
 BZ/WFQfa4mEe+HyFwMemTMGC6x54bWqnzMmtBpBJ2cOEFh1W68BhFtxRmwClfkfy7bTcDUdV2lR
 1Q+2MaiwdcAH3LlPfWJhx3N4lgKp33drWQ8f1NAUnqWd+iAKVQ7ZBfCxlZKIZeBtFBXWS0UGP/x
 vJ7yNCoaqZHmYUrbeGEb93bUOoaLkrlEhKpi9HNyPT8RxRNBW6uxvb6KeSpUFLlp9ARTT4bJEgV
 c3WWpLrBzw69ITZc1Z9/zz9q8VZqTHmiL/FqAtL2be1Tk4N8OlQyb+6uZT5UUwuyt95rToNVIfx
 2O1GiWCyBJDKE3GnJKSIwVRvg5G93l6gKBP7Li75NXUmAnLWQ7I+kd+kSLVvw7Gg74YyCVx4MzH
 HEDPD1IXEHN8M1JZ4YYkeOU5TwLsFg==
X-Authority-Analysis: v=2.4 cv=Adq83nXG c=1 sm=1 tr=0 ts=6931577c cx=c_pps
 a=KMYGTuEAqwcz7NPofZ4ZnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=QX4gbG5DAAAA:8 a=sSg5oxgHRQSn7EJo2AsA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: Sf4fXOpciFzksudMoH6KZtgWH-_kBpcu
X-Proofpoint-GUID: Sf4fXOpciFzksudMoH6KZtgWH-_kBpcu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040078

Move video device unregistration to the beginning of the remove function
to ensure all video operations are stopped before cleaning up the worker
thread and disabling PM runtime. This prevents hardware register access
after the device has been powered down.

In polling mode, the hrtimer periodically triggers
wave5_vpu_timer_callback() which queues work to the kthread worker.
The worker executes wave5_vpu_irq_work_fn() which reads hardware
registers via wave5_vdi_read_register().

The original cleanup order disabled PM runtime and powered down hardware
before unregistering video devices. When autosuspend triggers and powers
off the hardware, the video devices are still registered and the worker
thread can still be triggered by the hrtimer, causing it to attempt
reading registers from powered-off hardware. This results in a bus error
(synchronous external abort) and kernel panic.

This causes random kernel panics during encoding operations:

  Internal error: synchronous external abort: 0000000096000010
    [#1] PREEMPT SMP
  Modules linked in: wave5 rpmsg_ctrl rpmsg_char ...
  CPU: 0 UID: 0 PID: 1520 Comm: vpu_irq_thread
    Tainted: G   M    W
  pc : wave5_vdi_read_register+0x10/0x38 [wave5]
  lr : wave5_vpu_irq_work_fn+0x28/0x60 [wave5]
  Call trace:
   wave5_vdi_read_register+0x10/0x38 [wave5]
   kthread_worker_fn+0xd8/0x238
   kthread+0x104/0x120
   ret_from_fork+0x10/0x20
  Code: aa1e03e9 d503201f f9416800 8b214000 (b9400000)
  ---[ end trace 0000000000000000 ]---
  Kernel panic - not syncing: synchronous external abort:
    Fatal exception

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Xulin Sun <xulin.sun@windriver.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
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

