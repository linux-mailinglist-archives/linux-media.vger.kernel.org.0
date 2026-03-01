Return-Path: <linux-media+bounces-54004-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOBgM7YZpGm2XAUAu9opvQ
	(envelope-from <linux-media+bounces-54004-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 11:49:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED821CF372
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 11:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CA91301CF8A
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 10:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DCF2E92B3;
	Sun,  1 Mar 2026 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="hoJA4VDU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B345038;
	Sun,  1 Mar 2026 10:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772362143; cv=fail; b=SRuZSIyrYH8u0/qwIj6mOxS4PG6SFphEe9DhzztcuCUPWO8VwJ8uLdaq3WXrlfe7UGo9SbVoxp1IhJLEkRNSbBjrZjXf2l/oIBvauLTqt+67pUJNgjAjquqJnOyn3AkkVKRbGkzUn57hnVujdwc0pTrWD5wh02rmCIN1w/4TKCA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772362143; c=relaxed/simple;
	bh=V5PqaMi/A/zkReEZYmsiui5xTmvOlENN2Uohhsw//U0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T+HbIO5YWTDybmC8QLTdarXGBI2DylF2XhknL+vGSSG4uDPCk+1dW6cdZuUW7XydU4avpkN3bwJI0CD/GVLNW3MIusoPcilJgGr07lKqNfBlfDAsZ4qqfz3JRdVia0kaMFIHx2DddXq05sDLKr42PtomVSqMCC4bcwvXJCisoUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=hoJA4VDU; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621Ae2oU3617745;
	Sun, 1 Mar 2026 10:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2JHu37lJsE9EfEYYHfia9R7J3IwNIwitwNHyS3zu1iA=; b=
	hoJA4VDU/i4ZX3G8OiYzpyePT9jkC3GjCpflOnYEPEqI8do0wRyx9ttG4NKTi9J8
	Wl+QC1yZ5wxlYYC4mPsJf1LO2crLkYaEFqp+MfBbk4cAUdF1fRC9V2UX/vvKuaje
	DpcemMND1qw1KmKn9amGgA82Jt1IZyMSzmCQ+33DqIwSuwWAspavaYX7yTcoyDSq
	cYSj27kcKeCE3WvGfNFBswDwbvZKgbqRmg3ihymrJ7y9xbavHlAk9VplqqHm8EHX
	xtWgnqDkEOYkyim0PU74+ZGVvJnxWfNZwYAQlb7BWR2FOUvWfkAvMBVXgq5WOvnM
	sNEPHRaLjOtgfnSJoIh1zg==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013067.outbound.protection.outlook.com [40.93.201.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cknjvhe4f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Mar 2026 10:48:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nB34ojD4givDYzTv3ck/XIbb1BbCmPO87itlKJ5drUIko5EpwUldTKx9+ebE/OfYcLFhFYfiQiHz8Oi6NCzofTTY2W8N4035wYOUbs1EJojfMq13XHuQMzZpcLaG36W8potnidDUx97D1FXHFaMvfevVKg2j3AtqCiQ57qBtjAfr5JSV7UQ1Glv5u9QlTEy1zvgvttpBnL1rhQvgS/J3Sccna3AmQHKcVZOZX6GX0Qd7uWu5GDodLykjPz9tERb52wmLQUQe+ORRtUX8pWXprsix9lvA9rMrRgk6CiHmyjvyTbcq/EBfO98lLmIRDe7MHjBj5a5gn10WzlTVsqh+AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JHu37lJsE9EfEYYHfia9R7J3IwNIwitwNHyS3zu1iA=;
 b=WyKZD/NT9uEEQH/bqZ4exRJGfH04xvrcslyZJ5vfuVmgUWpWMXHjuwuFnzW/c0OSP5XZeVRs6JY+zDzw3JVzNcRlAvjMGpKKrqVtAnNgBQCRKTKfkQCcF5+U/Smb4Ba7V1QIngu00pAJOKhxWMe6iPUDaCaX25WPGoP/RNDeLwdSTOC6CkmBh0BV9a4N3ZZZ0vinUfsylEOtCKZVBx36ELSuyB0h0Inw5m1cwC+CxlnAT7Twkr6o/oUD8A1OhkQIYiAzXoS6lFhwLTJ56eZp9ewN2g0lOrHaPhU3rR4MKPVH1YSZpFjZxyuyp1K3oVGsLrU1ZNJ7Rad8ydNDov2jKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW6PR11MB8311.namprd11.prod.outlook.com
 (2603:10b6:303:241::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Sun, 1 Mar
 2026 10:48:30 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 10:48:30 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] media: i2c: ov9282: Convert to CCI register access helpers
Date: Sun,  1 Mar 2026 18:48:07 +0800
Message-ID: <20260301104809.3505257-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301104809.3505257-1-xiaolei.wang@windriver.com>
References: <20260301104809.3505257-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0119.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::9) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b04f93b-cd9d-4f83-166c-08de778013b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	xunFYlggSF6KQenP6CwpObBULN6UUB+TtKgdFI0JAn3jF5YsbLIDOrdz1uFliah9CJyIiBI9gBCtGuQ+fIaeR01KFkjKk18Bk2zc/UlqJRKapTkGtn9S1vrLeULR7x8xSjO+AOEP1K5JUbkIzogxzlkD8UzsSgL2qr/qvKa9PE99Y0ACeQ/zuN8QPO4RPp+DomHLRmBpthy+8KIvc8MuV26IksLeUPdcWxr5+f1Ok6PnmUDUoUfo1V+9TsLTPeaHLBQH9sVTKGWU3NqMy5Cy4UqCWg4plCWnuBnnzTr8loLjAoqjBKODftCQceohNMTo30bdgWEVFgJcdjLP1foy0ZXIk5kieAXJ1O69fcRVfZhnfe5R7Bcgk5gmrXQITJSwfyGRK/q2UKvRS0cqsKAhn+L7GicZnZwKUDM2dg0vtHB4ZEX9LNBeJ2qfrH7uXP6spA5v/ZGFTjjDEgx5zfyRdrfxhu9pV5TROwUG//u52e4/PFZ3fmNowviEfI5nooLj8JOMTNJOdqGWcOosdKMtu3u+16Cc/DDL3QDte7XnU3X+Odl4cGchmDebKoARJPcPZeuroxwavjt17nyvPyjP72q5+YZ60LCKDvRBFyjK4DjYnqX7aZtFn2p4akER06S2wVXPuataSEVADTkMMnZrrjHXN6gsRsqzUscdTYJZi1Z3UpfqCOk/M1zfE4VhOfctuFumV8lb2DM4G8ZY0OXZwR5pT4ycdQBX78SCdEgXrRD300YZN2TjXjEUkFdy2NuFBdUxg5VksATZ7hd0/oetKzPJxlPi3JqJtRIIYmYRPKoxKEkqvdtOMscGc03wIFYa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M16FykB3rGIoHHxDZukr8o1h+VjyeyFjEkJzSglv5TmxKUYgdczvaUY2A7nH?=
 =?us-ascii?Q?6khfuNfdPo2eRCshpEhgNTBl3s9ORI0ubQ1Mc5ZtSoVqnGGpwOxiWdZfeFm3?=
 =?us-ascii?Q?YoIVFIf/aWoXfgoqj+FuB+mQZ64MKqSbWG3SvATCBeTOvUi94M8uyef9oVR8?=
 =?us-ascii?Q?Cp7sOJtqwzzdMk5ZtMlOk6FpoMKf5N8O0Ts/nKcQKGp+2kBSb6KdMJceU7Ao?=
 =?us-ascii?Q?MeOE627roddIVMcDGLEwGTnWf6OJyEPJmqnEN90HYR/d1x4kgIayXprd4gLs?=
 =?us-ascii?Q?zjljrVAZa2eQ0YXFoVsBs/LQrnA9nGEWRtHUNfz4T9Y3zk0geuQzLNgfuQjB?=
 =?us-ascii?Q?Q4P3A8xx6fDigZnU5u1mqdjFiockn9UN4mFHBNVgJMLIMjeRmBXd0xEqse7J?=
 =?us-ascii?Q?rLBLVFOO0Ey9kpy0i0ECPNoLfzIkmYtLZ20Q3RV6ADShAk6RRNcYiPezEclu?=
 =?us-ascii?Q?tCCt4UHgpfGskkUaNifCpLTm1K6XJ+zds/EbxtjgbTxKNVUI4iMX8zRilsdt?=
 =?us-ascii?Q?CGLCPZOwmyrD1K919TWIO+AtX68MMeNarFfIIHvvAt9hHK51Q1nXtzz1V9Wh?=
 =?us-ascii?Q?e9Q7NoFmC5mqrDGTo29ESnZjrAgpcC8xRmiREUOTui+8oQsXWEfgEn+/0LIn?=
 =?us-ascii?Q?+tPzrZkZkgql7yCClmpnu7ivJHibvowip37uqKsikJsBcbn/tCF922WuuHyR?=
 =?us-ascii?Q?HxZCZ/UPN1MiD/5fk4cUi8bRc8tmxL45LUD0aviOxQ7OTM/KxvRP+baGz4PO?=
 =?us-ascii?Q?7PH1Eje2jmW/b6z16YO3ept0jy3GA98K0LiuPPNUpja9tCbO/jDg2fMGW10V?=
 =?us-ascii?Q?S9AUZDB2VpY/RJdSlFvKkVZemZy8i0GKjzd4vPHfVYUx8af+4tnSaXNTjYKA?=
 =?us-ascii?Q?q1EX3+4Kj86Ogw+gMLGvOzFzvnVtMDaImZCFFx9i4xHM+KVNs0QCchKyizwM?=
 =?us-ascii?Q?mGraLl6HC5GBWHGTvxt/RVc2MRGplx90XKGHVQJHJMZUs+Ek3Jn+TyDZbYQQ?=
 =?us-ascii?Q?spPE9dxsMmgUmOfrpcMplY1lwg9HUGmh4y9pBo4P1P8BMV9nJYKkX4G11fHT?=
 =?us-ascii?Q?y/JYQtJpcRQRerOQWNX9z4MJFGxHPU6/s+wNkTDaarGVAI8BkYwGTCjfQ36m?=
 =?us-ascii?Q?q/+XbVRhqiV2579FjgbbTdfh+At0Bi8tM2Ef4Mia5pbdO7mLjQceZF7NskJI?=
 =?us-ascii?Q?Ucy5zo4ubdd3bGVNFuSQ/lDMaAB0PCtTgrTRg46fMC2vwiyLuGMKAbHOvOnF?=
 =?us-ascii?Q?gv8NkUEsLmC3sc0dMTAtDplHvFlZOVUCFDghFT0i721tponAt63iHCZaoYcb?=
 =?us-ascii?Q?go7wY2VdTf2uEV0VDXM03CTo0oJjjHhz4rTcJvMB9XKPjGqJw6Wo/fA0pc9k?=
 =?us-ascii?Q?mYbb2rHn9a21d+L7yf6bKQ6Fi15F4JLIcA/QDgKNj3wAFoJm30wx7MwpNAOy?=
 =?us-ascii?Q?SZcBTDm6OhnL799XGq59+nn0QuHH7vdSSWvS6uFbNKdS8RY7lg0YVverB3m5?=
 =?us-ascii?Q?oiprcYEtdLVYTt1JDRx2OjTGumHbAU79dWt7p6Rf7ClGFQMPLAeEZkJjwyXc?=
 =?us-ascii?Q?51D0RliOT8MbN2wR5Ba6ZJNr+SuXaxsCnfD7aKrv8k1rJH4vD65ixe1pGIzd?=
 =?us-ascii?Q?RCIXJNnDTDY/WaS5HGrukBm2MhhQvg+hf9hab62SeH1hv4Ct6/x9y6ZUjyeU?=
 =?us-ascii?Q?Tbzv6NIQY1g5SFqx7cspzx+CCw94x4vhZmxtEed8GJKPFCeygZGFucibmA6z?=
 =?us-ascii?Q?XE64TupAs6JXT3ZwI+8MGGco3qxVblc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b04f93b-cd9d-4f83-166c-08de778013b4
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 10:48:30.6711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06bJYYOg6cRzug2NyiKWBFiwlonvVGpCzSnbwKoHoCLS0TETwX4cuNCMwEaqzpkFDlGWynAPYMkaITnq5NoLy8e/doFbQ9vMmmqFqc6WN0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
X-Proofpoint-GUID: fx7b2yj4g9Y3gJGfKwEIZJrDfBBmG7h_
X-Proofpoint-ORIG-GUID: fx7b2yj4g9Y3gJGfKwEIZJrDfBBmG7h_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5NyBTYWx0ZWRfXzYigpa0bHYml
 6j1PSwCgMxjWHnJNj8jLRFFpzYR8dOiAwuExdtqymq6Q58ElF/VCv0VDdo+16puQoTN6Aq2fHJ0
 9L/jMmZxC6UdQSc60FPxrzLA3t4hYWvNDD68322x/ssAgt1gBFupYRDqnxNPq26cHQeU2Z0MVic
 QIPh2ov5Z2di8r1r967BqTu9crjx3t0z96tBYd+WZyiXrtjRly009dNp25r5h1ovGbexfApxpPm
 MXnlKHz4nC7NXxlt1pDbu5H8Dw6oK1zgMu/dPZMAlQZzNrt8DpSQ4SL+vrkwefv2erY3Ed7Q/xe
 hhb3S3c4XO5mdA7huwF53CtxXsKQD5WsL5YnkLFRXXdzSRtuapHVuPffIBOtG3sRk6R3yy+siRi
 8jCEMZcjxVNDiXcE2rFNif+vPjQFIh3nai0ome4VaiPXjQkx0Jz/FZY+Ane4COPevTrTxBMDaei
 R7xmd4njRqWVg3rF4DQ==
X-Authority-Analysis: v=2.4 cv=P/g3RyAu c=1 sm=1 tr=0 ts=69a41980 cx=c_pps
 a=R3Nq4yRH+PcKhTCrdXTq7w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=F-GWxTvL4KY9s68XaQkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010097
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
	FREEMAIL_TO(0.00)[linux.intel.com,siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54004-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:mid,windriver.com:dkim,windriver.com:email,siliconsignals.io:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4ED821CF372
X-Rspamd-Action: no action

Use the new common CCI register access helpers to replace the private
register access helpers in the ov9282 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov9282.c | 293 ++++++++-----------------------------
 2 files changed, 64 insertions(+), 230 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 5eb1e0e0a87a..3027e71fd8fb 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -690,6 +690,7 @@ config VIDEO_OV8865
 config VIDEO_OV9282
 	tristate "OmniVision OV9282 sensor support"
 	depends on OF_GPIO
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV9282 camera sensor.
diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index ded9b2044ff8..8bfaa3ae4be5 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -12,38 +12,40 @@
 #include <linux/math.h>
 #include <linux/module.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>
 
 /* Streaming Mode */
-#define OV9282_REG_MODE_SELECT	0x0100
+#define OV9282_REG_MODE_SELECT	CCI_REG8(0x0100)
 #define OV9282_MODE_STANDBY	0x00
 #define OV9282_MODE_STREAMING	0x01
 
-#define OV9282_REG_PLL_CTRL_0D	0x030d
+#define OV9282_REG_PLL_CTRL_0D	CCI_REG8(0x030d)
 #define OV9282_PLL_CTRL_0D_RAW8		0x60
 #define OV9282_PLL_CTRL_0D_RAW10	0x50
 
-#define OV9282_REG_TIMING_HTS	0x380c
+#define OV9282_REG_TIMING_HTS	CCI_REG16(0x380c)
 #define OV9282_TIMING_HTS_MAX	0x7fff
 
 /* Lines per frame */
-#define OV9282_REG_LPFR		0x380e
+#define OV9282_REG_LPFR		CCI_REG16(0x380e)
 
 /* Chip ID */
-#define OV9282_REG_ID		0x300a
+#define OV9282_REG_ID		CCI_REG16(0x300a)
 #define OV9282_ID		0x9281
 
 /* Output enable registers */
-#define OV9282_REG_OUTPUT_ENABLE4	0x3004
+#define OV9282_REG_OUTPUT_ENABLE4	CCI_REG8(0x3004)
 #define OV9282_OUTPUT_ENABLE4_GPIO2	BIT(1)
 #define OV9282_OUTPUT_ENABLE4_D9	BIT(0)
 
-#define OV9282_REG_OUTPUT_ENABLE5	0x3005
+#define OV9282_REG_OUTPUT_ENABLE5	CCI_REG8(0x3005)
 #define OV9282_OUTPUT_ENABLE5_D8	BIT(7)
 #define OV9282_OUTPUT_ENABLE5_D7	BIT(6)
 #define OV9282_OUTPUT_ENABLE5_D6	BIT(5)
@@ -53,7 +55,7 @@
 #define OV9282_OUTPUT_ENABLE5_D2	BIT(1)
 #define OV9282_OUTPUT_ENABLE5_D1	BIT(0)
 
-#define OV9282_REG_OUTPUT_ENABLE6	0x3006
+#define OV9282_REG_OUTPUT_ENABLE6	CCI_REG8(0x3006)
 #define OV9282_OUTPUT_ENABLE6_D0	BIT(7)
 #define OV9282_OUTPUT_ENABLE6_PCLK	BIT(6)
 #define OV9282_OUTPUT_ENABLE6_HREF	BIT(5)
@@ -62,14 +64,14 @@
 #define OV9282_OUTPUT_ENABLE6_VSYNC	BIT(1)
 
 /* Exposure control */
-#define OV9282_REG_EXPOSURE	0x3500
+#define OV9282_REG_EXPOSURE	CCI_REG24(0x3500)
 #define OV9282_EXPOSURE_MIN	1
 #define OV9282_EXPOSURE_OFFSET	25
 #define OV9282_EXPOSURE_STEP	1
 #define OV9282_EXPOSURE_DEFAULT	0x0282
 
 /* AEC/AGC manual */
-#define OV9282_REG_AEC_MANUAL		0x3503
+#define OV9282_REG_AEC_MANUAL		CCI_REG8(0x3503)
 #define OV9282_DIGFRAC_GAIN_DELAY	BIT(6)
 #define OV9282_GAIN_CHANGE_DELAY	BIT(5)
 #define OV9282_GAIN_DELAY		BIT(4)
@@ -78,28 +80,28 @@
 #define OV9282_AEC_MANUAL_DEFAULT	0x00
 
 /* Analog gain control */
-#define OV9282_REG_AGAIN	0x3509
+#define OV9282_REG_AGAIN	CCI_REG8(0x3509)
 #define OV9282_AGAIN_MIN	0x10
 #define OV9282_AGAIN_MAX	0xff
 #define OV9282_AGAIN_STEP	1
 #define OV9282_AGAIN_DEFAULT	0x10
 
 /* Group hold register */
-#define OV9282_REG_HOLD		0x3308
+#define OV9282_REG_HOLD		CCI_REG8(0x3308)
 
-#define OV9282_REG_ANA_CORE_2	0x3662
+#define OV9282_REG_ANA_CORE_2	CCI_REG8(0x3662)
 #define OV9282_ANA_CORE2_RAW8	0x07
 #define OV9282_ANA_CORE2_RAW10	0x05
 
-#define OV9282_REG_TIMING_FORMAT_1	0x3820
-#define OV9282_REG_TIMING_FORMAT_2	0x3821
+#define OV9282_REG_TIMING_FORMAT_1	CCI_REG8(0x3820)
+#define OV9282_REG_TIMING_FORMAT_2	CCI_REG8(0x3821)
 #define OV9282_FLIP_BIT			BIT(2)
 
-#define OV9282_REG_MIPI_CTRL00	0x4800
+#define OV9282_REG_MIPI_CTRL00	CCI_REG8(0x4800)
 #define OV9282_GATED_CLOCK	BIT(5)
 
 /* Flash/Strobe control registers */
-#define OV9282_REG_STROBE_FRAME_SPAN		0x3925
+#define OV9282_REG_STROBE_FRAME_SPAN		CCI_REG32(0x3925)
 #define OV9282_STROBE_FRAME_SPAN_DEFAULT	0x0000001a
 
 /* Input clock rate */
@@ -139,16 +141,6 @@ static const char * const ov9282_supply_names[] = {
 
 #define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
 
-/**
- * struct ov9282_reg - ov9282 sensor register
- * @address: Register address
- * @val: Register value
- */
-struct ov9282_reg {
-	u16 address;
-	u8 val;
-};
-
 /**
  * struct ov9282_reg_list - ov9282 sensor register list
  * @num_of_regs: Number of registers in the list
@@ -156,7 +148,7 @@ struct ov9282_reg {
  */
 struct ov9282_reg_list {
 	u32 num_of_regs;
-	const struct ov9282_reg *regs;
+	const struct reg_sequence *regs;
 };
 
 /**
@@ -188,6 +180,7 @@ struct ov9282_mode {
  * struct ov9282 - ov9282 sensor device structure
  * @dev: Pointer to generic device
  * @sd: V4L2 sub-device
+ * @regmap: Regmap for sensor register access
  * @pad: Media pad. Only one pad supported
  * @reset_gpio: Sensor reset gpio
  * @inclk: Sensor input clock
@@ -209,6 +202,7 @@ struct ov9282_mode {
 struct ov9282 {
 	struct device *dev;
 	struct v4l2_subdev sd;
+	struct regmap *regmap;
 	struct media_pad pad;
 	struct gpio_desc *reset_gpio;
 	struct clk *inclk;
@@ -241,7 +235,7 @@ static const s64 link_freq[] = {
  * register arrays as some settings are written as part of ov9282_power_on,
  * and the reset will clear them.
  */
-static const struct ov9282_reg common_regs[] = {
+static const struct reg_sequence common_regs[] = {
 	{0x0302, 0x32},
 	{0x030e, 0x02},
 	{0x3001, 0x00},
@@ -305,11 +299,6 @@ static const struct ov9282_reg common_regs[] = {
 	{0x5a08, 0x84},
 };
 
-static struct ov9282_reg_list common_regs_list = {
-	.num_of_regs = ARRAY_SIZE(common_regs),
-	.regs = common_regs,
-};
-
 #define MODE_1280_800		0
 #define MODE_1280_720		1
 #define MODE_640_400		2
@@ -317,7 +306,7 @@ static struct ov9282_reg_list common_regs_list = {
 #define DEFAULT_MODE		MODE_1280_720
 
 /* Sensor mode registers */
-static const struct ov9282_reg mode_1280x800_regs[] = {
+static const struct reg_sequence mode_1280x800_regs[] = {
 	{0x3778, 0x00},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
@@ -348,7 +337,7 @@ static const struct ov9282_reg mode_1280x800_regs[] = {
 	{0x4509, 0x00},
 };
 
-static const struct ov9282_reg mode_1280x720_regs[] = {
+static const struct reg_sequence mode_1280x720_regs[] = {
 	{0x3778, 0x00},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
@@ -379,7 +368,7 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
 	{0x4509, 0x80},
 };
 
-static const struct ov9282_reg mode_640x400_regs[] = {
+static const struct reg_sequence mode_640x400_regs[] = {
 	{0x3778, 0x10},
 	{0x3800, 0x00},
 	{0x3801, 0x00},
@@ -485,97 +474,6 @@ static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct ov9282, sd);
 }
 
-/**
- * ov9282_read_reg() - Read registers.
- * @ov9282: pointer to ov9282 device
- * @reg: register address
- * @len: length of bytes to read. Max supported bytes is 4
- * @val: pointer to register value to be filled.
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
-	struct i2c_msg msgs[2] = {0};
-	u8 addr_buf[2] = {0};
-	u8 data_buf[4] = {0};
-	int ret;
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-
-	/* Write register address */
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	/* Read data from register */
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-/**
- * ov9282_write_reg() - Write register
- * @ov9282: pointer to ov9282 device
- * @reg: register address
- * @len: length of bytes. Max supported bytes is 4
- * @val: register value
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_write_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
-	u8 buf[6] = {0};
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
-
-	return 0;
-}
-
-/**
- * ov9282_write_regs() - Write a list of registers
- * @ov9282: pointer to ov9282 device
- * @regs: list of registers to be written
- * @len: length of registers array
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_write_regs(struct ov9282 *ov9282,
-			     const struct ov9282_reg *regs, u32 len)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < len; i++) {
-		ret = ov9282_write_reg(ov9282, regs[i].address, 1, regs[i].val);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 /**
  * ov9282_update_controls() - Update control ranges based on streaming mode
  * @ov9282: pointer to ov9282 device
@@ -639,15 +537,15 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 	dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
 		exposure, exposure_us, gain);
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
+	ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
 	if (ret)
 		return ret;
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
+	ret = cci_write(ov9282->regmap, OV9282_REG_EXPOSURE, exposure << 4, NULL);
 	if (ret)
 		goto error_release_group_hold;
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
+	ret = cci_write(ov9282->regmap, OV9282_REG_AGAIN, gain, NULL);
 	if (ret)
 		goto error_release_group_hold;
 
@@ -656,60 +554,9 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
 				       OV9282_STROBE_FRAME_SPAN_DEFAULT);
 
 error_release_group_hold:
-	ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
-
-	return ret;
-}
-
-static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
-{
-	u32 current_val;
-	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
-				  &current_val);
-	if (ret)
-		return ret;
+	int ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
 
-	if (value)
-		current_val |= OV9282_FLIP_BIT;
-	else
-		current_val &= ~OV9282_FLIP_BIT;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
-				current_val);
-}
-
-static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
-{
-	u32 current_val;
-	int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
-				  &current_val);
-	if (ret)
-		return ret;
-
-	if (value)
-		current_val |= OV9282_FLIP_BIT;
-	else
-		current_val &= ~OV9282_FLIP_BIT;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
-				current_val);
-}
-
-static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
-{
-	u32 current_val;
-	int ret;
-
-	ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, &current_val);
-	if (ret)
-		return ret;
-
-	if (enable)
-		current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
-	else
-		current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
+	return ret ? ret : ret_hold;
 }
 
 static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
@@ -740,30 +587,6 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
 	return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
 }
 
-static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
-{
-	u32 val = ov9282_us_to_flash_duration(ov9282, value);
-	int ret;
-
-	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
-			       (val >> 24) & 0xff);
-	if (ret)
-		return ret;
-
-	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 1, 1,
-			       (val >> 16) & 0xff);
-	if (ret)
-		return ret;
-
-	ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 2, 1,
-			       (val >> 8) & 0xff);
-	if (ret)
-		return ret;
-
-	return ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 3, 1,
-				val & 0xff);
-}
-
 /**
  * ov9282_set_ctrl() - Set subdevice control
  * @ctrl: pointer to v4l2_ctrl structure
@@ -818,23 +641,27 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_VBLANK:
 		lpfr = ov9282->vblank + ov9282->cur_mode->height;
-		ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
+		ret = cci_write(ov9282->regmap, OV9282_REG_LPFR, lpfr, NULL);
 		break;
 	case V4L2_CID_HFLIP:
-		ret = ov9282_set_ctrl_hflip(ov9282, ctrl->val);
+		ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_2,
+				      OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
 		break;
 	case V4L2_CID_VFLIP:
-		ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
+		ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_1,
+				      OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
 		break;
 	case V4L2_CID_HBLANK:
-		ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
-				       (ctrl->val + ov9282->cur_mode->width) >> 1);
+		ret = cci_write(ov9282->regmap, OV9282_REG_TIMING_HTS,
+				(ctrl->val + ov9282->cur_mode->width) >> 1, NULL);
 		break;
 	case V4L2_CID_FLASH_STROBE_OE:
-		ret = ov9282_set_ctrl_flash_strobe_oe(ov9282, ctrl->val);
+		ret = cci_update_bits(ov9282->regmap, OV9282_REG_OUTPUT_ENABLE6,
+				      OV9282_OUTPUT_ENABLE6_STROBE,
+				      ctrl->val ? OV9282_OUTPUT_ENABLE6_STROBE : 0, NULL);
 		break;
 	case V4L2_CID_FLASH_DURATION:
-		ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
+		ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
 		break;
 	default:
 		dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
@@ -1114,7 +941,7 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
  */
 static int ov9282_start_streaming(struct ov9282 *ov9282)
 {
-	const struct ov9282_reg bitdepth_regs[2][2] = {
+	const struct reg_sequence bitdepth_regs[2][2] = {
 		{
 			{OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW10},
 			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW10},
@@ -1128,15 +955,16 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 	int ret;
 
 	/* Write common registers */
-	ret = ov9282_write_regs(ov9282, common_regs_list.regs,
-				common_regs_list.num_of_regs);
+	ret = regmap_multi_reg_write(ov9282->regmap, common_regs,
+				     ARRAY_SIZE(common_regs));
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write common registers");
 		return ret;
 	}
 
 	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
-	ret = ov9282_write_regs(ov9282, bitdepth_regs[bitdepth_index], 2);
+	ret = regmap_multi_reg_write(ov9282->regmap,
+				     bitdepth_regs[bitdepth_index], 2);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write bitdepth regs");
 		return ret;
@@ -1144,7 +972,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 
 	/* Write sensor mode registers */
 	reg_list = &ov9282->cur_mode->reg_list;
-	ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
+	ret = regmap_multi_reg_write(ov9282->regmap, reg_list->regs,
+				     reg_list->num_of_regs);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write initial registers");
 		return ret;
@@ -1158,8 +987,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 	}
 
 	/* Start streaming */
-	ret = ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
-			       1, OV9282_MODE_STREAMING);
+	ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			OV9282_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to start streaming");
 		return ret;
@@ -1176,8 +1005,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
  */
 static int ov9282_stop_streaming(struct ov9282 *ov9282)
 {
-	return ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
-				1, OV9282_MODE_STANDBY);
+	return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			 OV9282_MODE_STANDBY, NULL);
 }
 
 /**
@@ -1228,14 +1057,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
 static int ov9282_detect(struct ov9282 *ov9282)
 {
 	int ret;
-	u32 val;
+	u64 val;
 
-	ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
+	ret = cci_read(ov9282->regmap, OV9282_REG_ID, &val, NULL);
 	if (ret)
 		return ret;
 
 	if (val != OV9282_ID) {
-		dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
+		dev_err(ov9282->dev, "chip id mismatch: %x!=%llx",
 			OV9282_ID, val);
 		return -ENXIO;
 	}
@@ -1397,9 +1226,8 @@ static int ov9282_power_on(struct device *dev)
 
 	usleep_range(400, 600);
 
-	ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
-			       ov9282->noncontinuous_clock ?
-					OV9282_GATED_CLOCK : 0);
+	ret = cci_write(ov9282->regmap, OV9282_REG_MIPI_CTRL00,
+			ov9282->noncontinuous_clock ? OV9282_GATED_CLOCK : 0, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
 		goto error_clk;
@@ -1576,6 +1404,11 @@ static int ov9282_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(ov9282->regmap))
+		return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
+				     "Failed to init CCI\n");
+
 	mutex_init(&ov9282->mutex);
 
 	ret = ov9282_power_on(ov9282->dev);
-- 
2.43.0


