Return-Path: <linux-media+bounces-18173-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB139759B8
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:52:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9014EB221FA
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 774EC1B5808;
	Wed, 11 Sep 2024 17:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n278pmWG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ApPsDtvj"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2A1AED29;
	Wed, 11 Sep 2024 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726077108; cv=fail; b=M0KDIzBPRi3NVIQ16dRDx5ApgyxY39N5nx/faRPCE+4W/Gfd/65CqfmF8X1DWGtQy8X01MS99Dk1uxp5XB+r+H64kdSoIKtfL8zaBqyhlAQpbKy3k1fJZXKEGSJtKCrADGp2lwtYpbAMT/DqBpKD4G7kjXigO5eOQGQVDORCF/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726077108; c=relaxed/simple;
	bh=29KWFZaQOwN3rf2FsFUXBoNo86NefuGZ15PSwnTgIrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=suFq5Ry3YTc5GTt5L63Zk0kUKs8KTaYDrfa2DVV9RceMA2y93szXb8gJArvIplHMocpdXTztEhP+l6u7UOgGQ1CwlINPG7yDChhfVcmeWiFeEwHlqgaAZ6hI+Glc6kkExXLQqYcCcYsNNdW+f0tLCBbahEtGHvH/p+9bBiiwYPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n278pmWG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ApPsDtvj; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BHfV7j006777;
	Wed, 11 Sep 2024 17:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=93HQgkg02Cx4Cf
	PdlOAb5u4sxYxyzuBo4e/Aj4rowOM=; b=n278pmWGfuXsLJiZ5KtxLqJusO4M7X
	/EofzypCtZZXO0fw7bLBAcetUGeOda5KuNwpNERqvhXqk/LoRY8Dcj/N4YZl/guA
	mgGhCyn2Uw1b60feEegJV0xXkYvFPbCX/IJ0pKVE25Kw2LFcZSGdCbQMPYyI0L1O
	gmRxbNHXUUbLRA2nRiOIxf88Mjj48xA+aO7C+ciiCATBgyK0Mozgif/u0SRYdjz0
	8G1GRbq9AoUP7ekrusJcXyTUML7ZB3Z88WwvfTK5ILN7UVlWunK0Q+LGmLK1lSEj
	w+dgLd5uCWLXvMYTfHchedFFpnnaNRYbaKF+lIQeVZMcDRugnWHq40Xw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gjburndm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:51:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48BGPHtE032374;
	Wed, 11 Sep 2024 17:51:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9gjwxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:51:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tV5CzutUnacr59Su07q5VBmWyGrcvNhwUU3touPmVFzROnveHGcQ2POaqT9p2yuvDY7Bw0vr/1DDZ8MeF7cMdAKlod9YEpleaYWqDUV+NyYO5G+MLTaJaZ+8pbbPJDNJXKXESW7s5psHpaU5m6RJNkuPVN7Li5W27817cHlfO7nSROEipsezaZmqeX+OYVPss1oXpMwFbI/+cZjiQQTl3qQO+zCq1L4suclku/JbDrEDMNwjAToxxNnGhkrODmfyRxpiQN2jJ0L+OoZAZ/ZVqy2g/4pSFk/OERpZQp73+n3Z2QL9/zVrQynhhMVvtKIJGIIFkBxww0m7r+spsqP5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=93HQgkg02Cx4CfPdlOAb5u4sxYxyzuBo4e/Aj4rowOM=;
 b=ZnkuZVzG463YqPIr1mpAHJwXKz/jUtODr2k1BZ0YgmC21mNncMvpt5tckPomz1cHJXYgf4wQ9yjD4hv9lNPdtqzyyDBWM2rsjwTgcRojVaM7tpZf9d5qUL4MMLsuLyM0INxOvYN1+oSHor6xmttTkwVws0rc4/2lVKUXSYzLOxaXqMYXLyfuD7ZBhhM4wWq5/1G9QxD+0GuOZTEZcr9dLmGcL/U9+0CPqzL3k5bRX16IW1R9WvQink0iD5bYyJmjnSyZ07VuDSDLU5YEP20LFrwpmD457lMOi7YvnKhvNnF25Y+unTFWn26EreGyIw81/+HKrk5Q/eeUZyTwT2mkkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=93HQgkg02Cx4CfPdlOAb5u4sxYxyzuBo4e/Aj4rowOM=;
 b=ApPsDtvjikMemca4L4iw+vqvvK6blLCSoI+Ve0y8r/8ZiA6ESEVJryRf32jLL2Nma21IxzJJEdeYKw8LjVXtU8r9lvJxKkuopZIKL4w9lt2ARFM2p7agDjaOC/g5rPfnNgYelE0odmIUCtPP9J66dtxsLE2jAxqfQ8ggDzr2+/Q=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by SJ0PR10MB5720.namprd10.prod.outlook.com (2603:10b6:a03:3ef::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 17:51:16 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 17:51:16 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Narron <richard@aaazen.com>, Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcin Wojtas <marcin.s.wojtas@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-mm@kvack.org,
        Andrew Lunn <andrew@lunn.ch>, Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH hotfix 6.11 v2 0/3] minmax: reduce egregious min/max macro expansion
Date: Wed, 11 Sep 2024 18:51:08 +0100
Message-ID: <cover.1726074904.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0053.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::18) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|SJ0PR10MB5720:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f240c64-d061-4569-7e2c-08dcd28a557c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tb4AtAWSALph986XU8pRVU+VM2F2oo8APqYyJHaEtgjDbYH8Y+jAR6aQBuzE?=
 =?us-ascii?Q?xyDukQJxCBuCBiaaBaBsrd7xccjKJqRLxLwklyMTy1JTSy33bl0rSvi1ZVTQ?=
 =?us-ascii?Q?E4G+gQ2irSO+H2uC/oIb6vg5thZ3A2qdHIW4q4xoMEFRT3jTMOvNIwZHUDj7?=
 =?us-ascii?Q?SOIG10CvQeppXWJmmAPBdr71CVHst682YQMDBfgF0s5pSx2NZicyzc0BRwV5?=
 =?us-ascii?Q?8nmpBE44RCsEvLMtXoUaHtF8DOeehOTboYoNZ5asMc6TQv+wjlz0yBtO+o6i?=
 =?us-ascii?Q?7IXMhQJiETOHcH5HDXcAYEMwwzxR830WlogQu7oOufcHR6Pe949LnS72rs7F?=
 =?us-ascii?Q?gsGvYsUUWfUfc/uh9oMAHyaHcYcy+PAcvOL+Sp+ZazVIEtNEo9bys6wYdTMA?=
 =?us-ascii?Q?WU37N/YNH52H7Ptsl8OUkqS7HTa3ZbV0uAd1mLtppFNaRaV2ruC3Chw5bGCo?=
 =?us-ascii?Q?EojNEq72PgzeF4pLxUxQbd/ZQIAD6hacb/zrYrYoGLJ4Ae9ZTkwdmJ87S9xq?=
 =?us-ascii?Q?pWYCwTSL4EplKIYQvUQQzj3e7Jvp+XlWGIdqRC/PGlJRKdSeaT8zQdpcAsVO?=
 =?us-ascii?Q?38I8PeFa5ADdn09IVUJt0KzolH0U3VS6p5NGXQdr7iwPqIQLaCbGvdkeOiQv?=
 =?us-ascii?Q?uLryTxUtNf7+WC0Godtr5kSJ21p0n2wHqxz8ung6UwOWu5QJAspQBmsYdLAg?=
 =?us-ascii?Q?mBKV4qUjzfqsvVtmKzVjvVeorzvwFtSObGrWPHEL88ZWCk45B7luun6jCID0?=
 =?us-ascii?Q?IV2tg0rbgaX35vVaifMUhwerozHoqgt15KX0DU0ZhpOC6yT846JNI0g4eFOG?=
 =?us-ascii?Q?fXeNAiNr6DfLHPDwaOo/+02rDJIIeOpAbc13tGWPEbJe9AMYxCG64WsErRkr?=
 =?us-ascii?Q?5GstwhZ6uiMz2B3P3Ct4mUPoJSDoJJ5bI2l4CvpkE2pvEToChxLke+AQdpXx?=
 =?us-ascii?Q?RXGtndsXcxUDYTyIoMyKLpr/pa/MHIcNuH5Vlm+51yU0ohyOgWmcCocwIABU?=
 =?us-ascii?Q?OVzh+5ec7U+zMBcoRnkSE5c+QJINbKe7AV0XudCciv5shgqq516XQ78YlRhA?=
 =?us-ascii?Q?HSXtALPNStOprVv9NZ1n8c5jC+3D1fwOn6/zgHVs57o/zYn06dIpJAvssErw?=
 =?us-ascii?Q?VHGogW7zvbirzt+7bbyMiTTtIJ4nvaVddKIiVn3Yul4mgAVdyi7x42s+CQYV?=
 =?us-ascii?Q?3GeAqIAigkGHEzvdhp8TBkhrqaNR6XZtPqtvECzt0MxCnRTK9ETNzqc3WW/W?=
 =?us-ascii?Q?BkGam1l03s/2631ZbZmxAAK86g0/kTmgRbIZz+20rpCdETGElOHsmudDrgTC?=
 =?us-ascii?Q?B046K2epkvE1HEH3FI/X8T861sq3/0j6b7e8yy2Bqng+j9Xbry0PTzPkISqr?=
 =?us-ascii?Q?5HxiiEA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?luYprnCWZeF7144iv9o6VcLtVxhwGchZbQY1PGrCfeFz3dcq/2TqigG+PSF7?=
 =?us-ascii?Q?T2riAmiEFhfkrVt6i4Uwqo5ZOH76ay/OXCPakwVSDUwdCrWjicRssNuav3Ue?=
 =?us-ascii?Q?AX4ZfRE7t1Xr65e36JWlNaqZ1TYQVc27pv3tgEM5VodDw3dbImiRxJ0OxeUq?=
 =?us-ascii?Q?39BQbxupmlIXFFGvGuHZvVIF+AW1X1oFAnkV/85Pdo1mODZ0yQPWqpqIoSc/?=
 =?us-ascii?Q?TV6WUuODTj57qB2awesnX4ixKQkcTs7+OECR18E5Jcj1CETu8IPbkruYbIl/?=
 =?us-ascii?Q?nNPOWt6x/0k0wBdXlZWxiEUWXego0eLAu1R6O5HDZoFDL1ugiCxul8n/6xWT?=
 =?us-ascii?Q?1Og4Duvut0kqjlvvlkAtV27yilIOT6biTjAO7paNdf8SQKyDdsIb2AvuHSi6?=
 =?us-ascii?Q?hrbMnP4taEL81/0wKMWDoT026QrfgiaywIzRwR8AVCk3aNYLeDb97Um9j/T8?=
 =?us-ascii?Q?Vpb1HmkuOaX5wJObtg1rc8vLQNHd/P/HRfQVCDrQ0LWMNUWYE7Hvgkv6rz4s?=
 =?us-ascii?Q?ml1vNSRVmAUXhtLyQ0J+xiVWM6kJNSH3YepE+g16+9hybZrDEshnAazYbsro?=
 =?us-ascii?Q?NOmRxc5sBY5dAGKNpqjrhe5oJYKDwHujEjgyw1JIH7VcClZQV1d9A8ehClx9?=
 =?us-ascii?Q?Dfn1qmNG0UZ0k7cfNepEF+x6NlRdzIbi9FXBf/q13kTOXG4jJWf+VBGKXtps?=
 =?us-ascii?Q?tfFHBInz99LhXoEsThUo6WhYHdJWHNzWKR4SKYUFgPNYxyLPrq9UoM04f0TH?=
 =?us-ascii?Q?GIN2tQm86RwNs1HdgzeWGPU1y0Ae0Z9g1AP9YYryDPKHMTGRK2B9dX7QKTSf?=
 =?us-ascii?Q?TSUrnBe2gbCxWjcgvE4GiK7aQCnmTimsEuoZ0YtICvdry/Na4ZRR3STo+jGD?=
 =?us-ascii?Q?rWVv3AtwklsbfR27UDEXCy4rp7UpaCg3Qiv9v1R++osLSlP65c3HA9XIICu1?=
 =?us-ascii?Q?MYsOs5U9o6DrEI4Orqxe4AcmDobyNelG2d9Bz+qRjgWUKmYk6sywcea/7na7?=
 =?us-ascii?Q?W7ov6F5L8tqPdTJAWTU4UwW4ftwf59MFcSA3+tYX9nub2pCL/2G++5qdbca8?=
 =?us-ascii?Q?Ys1n6rZU9XSQTZKF/uFn3A4xP3JYNNPJsH2UolG//SuPyyPVfgNehHkBnmwl?=
 =?us-ascii?Q?EMPKI3FvhIL2XXc9uK4uDX8lyrsxaczeFtHJeg0G3I9fHOzj1tHPj1wjMAkt?=
 =?us-ascii?Q?w2ghH53yxp+VzcFINJg69V/ISmb9tm8ix17gT09amyewkUIVZjCUsuviyfSD?=
 =?us-ascii?Q?WJXLb0yq/GStytgfa3NLaK45Eri/To/cRHW9AcBAbPWNDi/cRKSf2dBa2mc0?=
 =?us-ascii?Q?OGJYTbUYZd3/NS/AX2Crw+CPlkvTWMDUc5g3DjgqcIMCj3X5TqPo5EVyHNUZ?=
 =?us-ascii?Q?yyHHpDzwZU37cVHBOpNGeNBDYYyPbTsqeOUdlb0csd1jADt7bBFkbg3oRZBC?=
 =?us-ascii?Q?kS5U0PddXFI8sgKUoyhswYADhTRFKqR5HevVCLe6EttYWx6F7rQsYxzDF1hf?=
 =?us-ascii?Q?A4TEjD1TPlxIxSd+NxvSXF6NeqakHGuPYcL0StKgL0y7YgNZo2XhI5oEkgix?=
 =?us-ascii?Q?9TH9cVpcHt/4LQfhRTGUSqe94XG8Spm91pSxQgY2jQie8NmdWgJWSH15QSWY?=
 =?us-ascii?Q?tg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zLGiHZ/tht0IOrSX8VMxQ5lJREarA55T9zjWMnI4fYcV+LleSCeLhdtVYVuCzYLkR+/Ad5mPEOlDNrTqv3eyJqjGJLg2tr8xn8cyKJJjmokaQhIQ2t1H2LPYTnIbdSgR9VWzxvpsv1zdvDkPM2Hxlga02IUJkRlsKkhG3qJ089TSuacKic2z8nkkOZxYDusqUgX33JzCpeeUdMA9cC/yJLdT/h0G6XcAYfeySgyQ5DkHqlvNpXd8h1H3YDGskL12490WnWKv9rkq2vUzEmiywd2Fo8EZPOb9l7TEE5LmT955eecnjOlGQzBC81uiNFSWCn/nCIOAjAQFK6mfCk0hMNHMNPWg7rmhQopmcJ4eSXjstNa/p3CsAaYANNI9zTlSyLa1OcYnM8F1z/VokRvah3Xs0ZnW6qar5tJAdZNb1o82SxR2OoXgI4Q7uKwynH8xI325AuakHG4qRvfxwTdtLsQwMvRAuVXurX9ZmsyT+lFcxPoN+Zb4AObB/wNBr4sv/o9IbfALUBYtAnRxInv6uB6BTj26EixbqcDm/wRXSGZpcHHmxBXhqJ92LN1Q2Bj4se7OBE0nd5D8QMns1EiZAUZojOpkok/3odO0KSEPM94=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f240c64-d061-4569-7e2c-08dcd28a557c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 17:51:16.2402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cC+XA6/OhevowWZHJ2bHj+q3mzt5x8QgZYtUPeJ5Ym5vw2dEXqIKs7jce0x5kYJmO7gkw8VsVAy+GHoYdzLWKJZDStJjloZenReJZNhpDIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5720
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409110136
X-Proofpoint-GUID: UOIXarUhBDYuaIVnS4TYXWhhvSosigPS
X-Proofpoint-ORIG-GUID: UOIXarUhBDYuaIVnS4TYXWhhvSosigPS

Avoid nested min()/max() which results in egregious macro expansion.

This issue was introduced by commit 867046cc7027 ("minmax: relax check to
allow comparison between unsigned arguments and signed constants") [0].

Work has been done to address the issue of egregious min()/max() macro
expansion in commit 22f546873149 ("minmax: improve macro expansion and type
checking") and related, however it appears that some issues remain on more
tightly constrained systems.

Adjust a few known-bad cases of deeply nested macros to avoid doing so to
mitigate this. Porting the patch first proposed in [1] to Linus's tree.

Note that we use clamp_t() rather than clamp() when we otherwise could use
the latter because it isn't certain than the clamp() won't expand into a
more egregiously huge form, certainly prior to the recent fixes.

Running an allmodconfig build using the methodology described in [2] we
observe a 35 MiB reduction in generated code.

The difference is much more significant prior to recent minmax fixes which
were not backported. As per [1] prior these the reduction is more like 200
MiB.

This resolves an issue with slackware 15.0 32-bit compilation as reported
by Richard Narron.

Presumably the min/max fixups would be difficult to backport, this series
should be easier and fix's Richard's problem in 5.15.

[0]:https://lore.kernel.org/all/b97faef60ad24922b530241c5d7c933c@AcuMS.aculab.com/
[1]:https://lore.kernel.org/lkml/5882b96e-1287-4390-8174-3316d39038ef@lucifer.local/
[2]:https://lore.kernel.org/linux-mm/36aa2cad-1db1-4abf-8dd2-fb20484aabc3@lucifer.local/

v2:
* Split into separate patches to make backporting easier.
* Corrected type in sDIGIT_FITTING() argument.
* Added reviewed-by tags.

v1:
https://lore.kernel.org/all/20240911153457.1005227-1-lorenzo.stoakes@oracle.com/

Lorenzo Stoakes (3):
  minmax: reduce min/max macro expansion in mvpp2 driver
  minmax: reduce min/max macro expansion in skbuff
  minmax: reduce min/max macro expansion in atomisp driver

 drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  2 +-
 .../staging/media/atomisp/pci/sh_css_frac.h   | 26 ++++++++++++++-----
 include/linux/skbuff.h                        |  6 ++++-
 3 files changed, 25 insertions(+), 9 deletions(-)

--
2.46.0

