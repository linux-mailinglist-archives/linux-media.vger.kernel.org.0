Return-Path: <linux-media+bounces-54006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cP1bIvEZpGm2XAUAu9opvQ
	(envelope-from <linux-media+bounces-54006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 11:50:25 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A4D1CF38A
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 11:50:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 64D763029264
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 10:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1117330BB85;
	Sun,  1 Mar 2026 10:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="N2BD/AaF"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF25C283FE6;
	Sun,  1 Mar 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772362145; cv=fail; b=cvf3VDnvLRR8jF9twe70Tolw+I3cuPOVa1klSBg4nVZgAJI5D1Mvhs+dh9HJHVvmpnLynajXEjHEbX+2+s6iJa8Yvd+ZSWKSet3kI8KVQDriLNBcbo0iU5dF+q2k06TGhUY0dkgi9bQt0NlEPGwZRBQp3ilR5jK0+jHbiH4YBuM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772362145; c=relaxed/simple;
	bh=G11c+8qHFwIjST53P9zKD6wbCZbw9HcWzjRmO1duqMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T47ZOqowEaiEYvDhvWc1ccjSmMM2PmuCueDSMGAUXMoG7UpvMkUxAv76Ws7ARbHAJpkgBntcBJiGbnqMsDOcXhrM2JK/PBRRkNVSizTSpJoBowUTU0aCro9vcqhPWQUn55UcAsXacRFANNbM18tojg4RtngzAMuQQ8ypWQ13cD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=N2BD/AaF; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621ADg0K1397059;
	Sun, 1 Mar 2026 10:48:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=e/Lag4euRqchwce7HA81lZGbJxdfFftmfWbUSN2oo60=; b=
	N2BD/AaFVnyCXuGwPe4hMczY6Y/ohzPKDqeHr9mXMQCuLaTXlCKPSRliw+8Kf6Bf
	S5kob+/qs9hV4+7SvX5alM6CMJ4wyRPYsm+JI7p7LrlZk+tMNxn6k9zXdtkhZePq
	kNLE1TjDvs0pR9FjNF1puJTaoFyLtDf/REqWtbWlBBsZKrUKVjS3L4Q0zDUs2XaI
	eGfgoKg1puoaZKlnHeTPcBcODX5AyZJYypE/13sxjJKYnBeLpjXdLh4VisiHxooZ
	n2TANQn79lO3e25BM6haXgso1TfolP9FhU+o/pg6gYoF8XWX97hrKCNmVxxPVoyE
	PsK2wjy+Fr59zL3HYxF07g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013050.outbound.protection.outlook.com [40.93.201.50])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4hbm9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Mar 2026 10:48:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0gFrfixzkGqjAs5hlfh4vhnOpqfg7xM+obJbAyPgL+OO+I1RKixH4+ev+U5sALbi9O06RgKUv72F+/jHzTCjKalAmRTt8RxK/OVTq9CVMzI1UtgalDFLOzrwUSy/ez6VLIAzL9fPx8QjwG5QSMN0gcJL2uiiLwLS7xAbwcJolM9fM77YxmhnqtU20cbuLUGZz3E97qcfNKWWgSo0eJI0P6Hdi9BAzVzFELUpXHFsLNvmgHyWxyWu03QiB6L6CHoLZZFFquqKiw2cxSiBEn2/G6OH6htSLjJBSmKdwVQ9FOcfTuUeccQRhtn0Um8FoXWjNB/stQ57Wty6RqCIGf4kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/Lag4euRqchwce7HA81lZGbJxdfFftmfWbUSN2oo60=;
 b=sXc071jyF8PUU76JrjkpN29wid/PtSApIb/vchGUnZmYSBYqUFNxGXb2/z+b4wnJtmIvmrlgaaZaAs2AZeI1NEU0pb8irH6xl04QhIy00hjCGGhQlVrkU2IdsRoaV2ijx048EZ00Ofyx6LTDr8G+3KQ1GZThm+Xd3GA/QFJmudJl9bfCFC+uVXbUDLDaWFEclAiDd6NtNdwuqD/zqVkrjkY5APB2HLPsZwGjWZTtvXM0dZNA2LmS/wVBXY9jV8kPPO2EDeEamfb4ZnrfvATZ2PbkLf/PZlq/Oz1UW39MYYkVF5lBzGkMqvCvuAxwQMCB7MFgvCDctpGOEpUwlxacfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW6PR11MB8311.namprd11.prod.outlook.com
 (2603:10b6:303:241::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Sun, 1 Mar
 2026 10:48:39 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 10:48:39 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: i2c: ov9282: switch to {enable,disable}_streams
Date: Sun,  1 Mar 2026 18:48:09 +0800
Message-ID: <20260301104809.3505257-4-xiaolei.wang@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 32669bb2-a440-47d2-7852-08de778018fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	EnWLTLlHmLHUCi4HBLmVbyWvG5lYz7yNqhr/oAAGLRE9Vn8e7pH61HehHqepMx1dUkbJuuxgMFtCLFj1kniWLuu9W995hw9ks7jueD0cSrlCzB8RIGsG+9Teh0uB/DeHNyKvYy4hFxHzQsseO5peCOY3RPsd/c0ywvUkP39jOGHgwRt6LQtZPKYQrqAuCN289I/GQNTKtMEOsmx4+3k/NlZC5s8lt6wa5vz7Iu7oE13iY+uAwTlz8B/evRzMuRplIs31XZiSqaIcL0ktQ+2T0xHVeNQuEZIST0JXdX3xN81nOWD6M8WqrlgzDPLxr4Vsfq3lsSovm08W5+C7I/muvdTFBTiP9gv9juM9RTRVDbwuWxkpfZn39/RuhqWYSw/4XR68yI6WObcHbyP+JAiuRX8OykDZw4kvu1bJ94fa73JWHHpagDmD0VLPFMq8R8oN+zoOV7hEXBe+Wgw3U0VickM7XWQWWuvbq1EGr6UfKeK+zA44eWgqQL9+Z06FtzxCA+p2Au5Ic+H4ur+L5QT/1W1HbISUTJTUZrysVepaTMAypLgZPFF6G4Ejmz1NToIxhOy7MWIu+Kh+OMEwDgc2Q6CzS2Td2RpJUEPeIEsEhK/0RZ4XmaGibSz52y0ghMmCRUbjXW+gNeXm56avgnlp8mVr9r6VllHaOfRsKlxSyW+348rqMFiURm7eyhLp8xAq3NCE47F7cEz7i4vnjYAmHAncgd4SVDGWbzSinPUd5TwYsSmE8fmsVr+/MuO7sCVPiI4CIT2J/8GyyhbtJPbH560G1ZEg3ImTyxg2df11gW/L2BlO+gLTkXHcAgdIH2hE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fd9BocZlhP0ECIaPdy0Pkv3M8AUNkZS96JBsnkcSJy1K4Mh1YmgGZM3a8gJi?=
 =?us-ascii?Q?m/745WUdFy4sqY/u00laQ4pQYiwYTV5wxrsn2WkkRTLCIwtY419yxGQea9Ha?=
 =?us-ascii?Q?DyQ3CedyxE4BqGu6V9sF2ZdF5jdMECGKl1IRnWuQmmDFeG/LUtIPZ0EUhxri?=
 =?us-ascii?Q?esIZX1G2A7ioIWKXzUviDGxmcIAU/8abn3M+bK1u6tYR2MgiTEHAVWwnZEqz?=
 =?us-ascii?Q?nXZwYXLRqfV3/UB9lpWAyrT4Cb5CeieQ5C9L3/PZ3TSX4FM/TGjm8uR8QJu0?=
 =?us-ascii?Q?DaqieyEJJSpHCPTnoMG0RDdW0br44mHo36GTiJpWYPtAYqrvxTCKLXCasHyf?=
 =?us-ascii?Q?+SQYkVBn34snIGUBZdfGKJ6obZQA+lOIEvPx2VPFPHKFGP6yb1T0lZc6rESF?=
 =?us-ascii?Q?AQR1QNko8gi3E9939oBNvvOJlRWtZj8sBeHGS35hYSsDFeu5cRy+2b+6GPBh?=
 =?us-ascii?Q?I6EloVp0dIYQ2F38hZY25hEIuT/1SPFArRVoD8iCRYll7bj9Oz6d5IMi10d4?=
 =?us-ascii?Q?yEw14ZGfUOqk19Yg0lnUt79uNYuRL2hfV8oXgXxQZrAdkj8zWaWFJnhfp2IV?=
 =?us-ascii?Q?NjK5JmYG4SinyDWEs58CB2ZpbjgO/aW1BcaTegLZEEi5fhV1Z591anHUkSDn?=
 =?us-ascii?Q?TW9+flZAVvncHsV6gJEaBzoliE6+sBNwz0UTqGTn49sTkp6QQQwFAiFupGyg?=
 =?us-ascii?Q?iJ8CdzPLDmGJRJvUhAjYpeXk38kdchMIbhqCHxRoFdip2NyquRE8EVLrwKCx?=
 =?us-ascii?Q?72kXjYfQ9zNoTwYH5BRno1VyMF3LX6etkNCZwNXLyQS+pB6TWO+B56chKGEc?=
 =?us-ascii?Q?WL6iVJCJrokdkqzYFgAsyErvXofHsIoGAXkdCBd9UHRwPuwTVADfZFl5vpLl?=
 =?us-ascii?Q?bSDo8xu3fLBxArEpWLFJRjZq8QRIjELLbG/UmZumVXUM8Qwk09MBGcDy8Adt?=
 =?us-ascii?Q?9Ke9XCmeVmVZhrm4FdVIiANlEBDP9yT4cVqoU6d+5IUsLOjTdbIynl61UFeR?=
 =?us-ascii?Q?j1lU68glG8zudGMEbvMKo36D23cEztK3wr04DOtbIEpNF61hutUrUOf38Ggb?=
 =?us-ascii?Q?uFsQ6RGalz1N6Mr6kuTLuRgYD+jfJqaWGF3eJtwlyKo/G74zgu42buHBOIqy?=
 =?us-ascii?Q?ZMVjiuqr2kibJy6/DB94mtnMOLMmI719xJ+7vIgfsUlRHt+mYFCM8cUekkXv?=
 =?us-ascii?Q?e0iJSqNAfIsbQHdOZz14lX+ZfcQCj1dYLMtq4PAv9XodA5HNF458MHwNUggG?=
 =?us-ascii?Q?MSg2CrAU7l9V4t0eYXwDTJKY9mVDvoaxydKZCaZX+0Uxpdrlo5PgaOTvfO2B?=
 =?us-ascii?Q?atmaSvqXU1Px+bJFLtIDj/aFKaVMQBfiEKEyK6dlpyq5gJUmlhkxuHnu65Jf?=
 =?us-ascii?Q?ryVz+3jeGQWL1xYNeiZoU4W2IJaNo2tuXduSAw7SrF17GqM5xFK2ITiH6tU6?=
 =?us-ascii?Q?yPtLxuwdxjSua2x6uRTkeAj9GXLXPbdWhrtcaUoaWxuRBi0YeEZn6de0JKe2?=
 =?us-ascii?Q?xt576HM//5XS9GnlsdmtgbUa1u6XZYMT/ZBDNckg5+mFJCOy0c2ockURpKCK?=
 =?us-ascii?Q?GSpTYoE1OeYsUo0YD6XO1XcLuBVTTrpAbaj/1vFThXtImNp0IBw0Lv+ay5M2?=
 =?us-ascii?Q?ZS3SHovMCYU4MZsmoIVLX7GsBhNnr1It9Okv9IAG/SzHe1pXoFe2w98VVl6y?=
 =?us-ascii?Q?PUTHu0tgGDTBWCEpcjdtzxx7/D0CHiLhSp8/gl628VXAdVurbBytb2uuS0vu?=
 =?us-ascii?Q?hLNsD1I548VsSRzhtYrIEumQCi1VBVs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32669bb2-a440-47d2-7852-08de778018fc
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 10:48:39.4365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Z2pTUiB34CLv4Ik08xB6AkXVHps5ofJzxY3wyslvzpvuQ+Mi/vc2UqpK9dEBvZA6j2IQe2bBRoomJlY2jMG8IyYtWvsInzzW7Mhd8DtA8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a41989 cx=c_pps
 a=IN6nX5sQGDwae/9PVKyrlQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=-DGD1vg1X50fszjQOB8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: n-LGJci243QmAOGCSLNJMX7Sc6KO9ZO5
X-Proofpoint-ORIG-GUID: n-LGJci243QmAOGCSLNJMX7Sc6KO9ZO5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5NyBTYWx0ZWRfX/1/bDJDQUwRK
 OgXlsQTE0HVuq2vuHccOH+uY4y3EZdLR/+awt7bXBWpr8r7/Q43i4mrr3Lp8EPrHhjvn3SnHCYo
 NNnIInUfwnOLD+zqvfH2WrPQyXwjINmxRY1ZPqdaKJEdxjoGNQVmOTQcM7t71wCiBt3CuAnYc0o
 hzkYMcbYCfTPYMRIKkd7xWeGUO5j9/YpDg6ETScsFXIMFM/E6ADR8DdAwT9AjUT05T6MpsJ+dyP
 XYFJEIoi81aMDdnrvgz4WMHWzwZflrFbgVpb9NYrx1USXOJu4EG8bDSD15yxaWbl5Eq0+9boXdN
 AzTX+rW8QcVrL/BlY4CHJCtbvwE/w0cQFoGgbRRVM4RH2SUdsInLde6WWviL6q94TQHhkAjMQL6
 pa0WO6TDkbYDZb5qbH0jl60V3agTXXTxy/pgm/0gdRDyu43mthQbduN5VZvFzqGX6ZaRm+2+ORL
 8CKo6vlLF8qlMb79Rhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010097
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54006-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.993];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:mid,windriver.com:dkim,windriver.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D4A4D1CF38A
X-Rspamd-Action: no action

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov9282.c | 79 ++++++++++++--------------------------
 1 file changed, 25 insertions(+), 54 deletions(-)

diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
index 8acbd43838d5..ffce3da04c00 100644
--- a/drivers/media/i2c/ov9282.c
+++ b/drivers/media/i2c/ov9282.c
@@ -922,13 +922,9 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
 	return -EINVAL;
 }
 
-/**
- * ov9282_start_streaming() - Start sensor stream
- * @ov9282: pointer to ov9282 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_start_streaming(struct ov9282 *ov9282)
+static int ov9282_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state, u32 pad,
+				 u64 streams_mask)
 {
 	const struct reg_sequence bitdepth_regs[2][2] = {
 		{
@@ -939,16 +935,21 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 			{OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW8},
 		}
 	};
+	struct ov9282 *ov9282 = to_ov9282(sd);
 	const struct ov9282_reg_list *reg_list;
 	int bitdepth_index;
 	int ret;
 
+	ret = pm_runtime_resume_and_get(ov9282->dev);
+	if (ret)
+		return ret;
+
 	/* Write common registers */
 	ret = regmap_multi_reg_write(ov9282->regmap, common_regs,
 				     ARRAY_SIZE(common_regs));
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write common registers");
-		return ret;
+		goto err_pm_put;
 	}
 
 	bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
@@ -956,7 +957,7 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 				     bitdepth_regs[bitdepth_index], 2);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write bitdepth regs");
-		return ret;
+		goto err_pm_put;
 	}
 
 	/* Write sensor mode registers */
@@ -965,14 +966,14 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 				     reg_list->num_of_regs);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to write initial registers");
-		return ret;
+		goto err_pm_put;
 	}
 
 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(ov9282->sd.ctrl_handler);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to setup handler");
-		return ret;
+		goto err_pm_put;
 	}
 
 	/* Start streaming */
@@ -980,60 +981,28 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
 			OV9282_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(ov9282->dev, "fail to start streaming");
-		return ret;
+		goto err_pm_put;
 	}
 
 	return 0;
-}
 
-/**
- * ov9282_stop_streaming() - Stop sensor stream
- * @ov9282: pointer to ov9282 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_stop_streaming(struct ov9282 *ov9282)
-{
-	return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
-			 OV9282_MODE_STANDBY, NULL);
+err_pm_put:
+	pm_runtime_put(ov9282->dev);
+
+	return ret;
 }
 
-/**
- * ov9282_set_stream() - Enable sensor streaming
- * @sd: pointer to ov9282 subdevice
- * @enable: set to enable sensor streaming
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
+static int ov9282_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state, u32 pad,
+				  u64 streams_mask)
 {
 	struct ov9282 *ov9282 = to_ov9282(sd);
-	struct v4l2_subdev_state *state;
 	int ret;
 
-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(ov9282->dev);
-		if (ret)
-			goto error_unlock;
-
-		ret = ov9282_start_streaming(ov9282);
-		if (ret)
-			goto error_power_off;
-	} else {
-		ov9282_stop_streaming(ov9282);
-		pm_runtime_put(ov9282->dev);
-	}
-
-	v4l2_subdev_unlock_state(state);
-
-	return 0;
+	ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
+			OV9282_MODE_STANDBY, NULL);
 
-error_power_off:
 	pm_runtime_put(ov9282->dev);
-error_unlock:
-	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -1165,7 +1134,7 @@ static const struct v4l2_subdev_core_ops ov9282_core_ops = {
 };
 
 static const struct v4l2_subdev_video_ops ov9282_video_ops = {
-	.s_stream = ov9282_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };
 
 static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
@@ -1174,6 +1143,8 @@ static const struct v4l2_subdev_pad_ops ov9282_pad_ops = {
 	.get_fmt = ov9282_get_pad_format,
 	.set_fmt = ov9282_set_pad_format,
 	.get_selection = ov9282_get_selection,
+	.enable_streams = ov9282_enable_streams,
+	.disable_streams = ov9282_disable_streams,
 };
 
 static const struct v4l2_subdev_ops ov9282_subdev_ops = {
-- 
2.43.0


