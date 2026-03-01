Return-Path: <linux-media+bounces-54003-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIb4GqsZpGm2XAUAu9opvQ
	(envelope-from <linux-media+bounces-54003-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 11:49:15 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAC41CF364
	for <lists+linux-media@lfdr.de>; Sun, 01 Mar 2026 11:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EEE43019F12
	for <lists+linux-media@lfdr.de>; Sun,  1 Mar 2026 10:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45BB12E2286;
	Sun,  1 Mar 2026 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="sfd8qXDQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90270271443;
	Sun,  1 Mar 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772362142; cv=fail; b=nkrJsB7YULAj1f4x+AbzuuERubjTE4bOa6hRuIL3qBLtQ7lVQdoLlDcnxyrqSuti1EiHIEdXHZ0ohh8dWnU0vwW8Ln3cz9wkTslq+MGxV6AruNxfUdkbJm8AfwoU57q/b5CCaHVuBu+1xfKZI+73yF+DJuLyyJ+evGCNv5snQWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772362142; c=relaxed/simple;
	bh=hPCGcizMHVGzB9CuOV+6lauqSPWrh4ifYykjRfkbmCY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=g3CbnEh2JFNfOgpJqfbT5ijSOuK+Ut2zQZM5E0XEaSPcEaG6NK/GOt+hWx/HdmvmGsZj1y9YqmYf4/H4FNoJpdgRmjb6SQ89w2GwJbmBaJM4VMCF99Y3PvwjLWDTZT/9ooiazEDuxWvSoQ0cKjF9w55LSLc6B+83YZXloKZ72vc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=sfd8qXDQ; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 621AfdUi1443969;
	Sun, 1 Mar 2026 10:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=J2TUCdCUk
	Q9CKZi0+2zPx9G5HavskyCEsEzZveRf5pM=; b=sfd8qXDQzx9is4e3fIN7wO7Gk
	nFzyojWJ40DvXgaHTVSnIFr2oqcb4ljO08Vg0hQUx75w/8L4JKEmDGugCgVo3boz
	9UXMsUrOvPBueSsISa6NL5hXOwWz7JkzQU49XIq+VHKQb2pScIvLG+dGLewLA9Cr
	xc3vV6uZOkjcUstf0/8/JClNt0rnhtKbzNF2qMHAJWZR1yUpMJjGo+pT9KwCMVhL
	McBNtH81/ILA79I3ISNmY4VwC/JOF/w4yGqp2yZU9SZVPurZ+b3H0mOt/SkIpzfw
	nC4G7FxSyfWgTg32Xo6p4uiB6xTWtbiXHnVN/4psPza0X5/iu1ipjKqT5IsrQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013071.outbound.protection.outlook.com [40.93.201.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4hbm6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 01 Mar 2026 10:48:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHGH+QAWM6AH+aIJ5sc1HDRoQAC3IsjZXoT0AC0kN3DSBw4aJ4VCVCSHU+/fe2BMZbSZXTj5slvFFZnk7A690UCDLQjcwGFnkPAfWh8nACkYnYHeQ/GfYFQM52w9TapOlOT5D3Xw/IJUhJPFRCnbiQ8RWvIFz19e/cI7yrwLPhWb3hxt7y8dJj/xMAzBxpoT52fLxvboQpHCiYkze/6F7ZTZfOtl97LaTCzd7SS9qk9md8KfB6DJlzmylp7DiNj8z3txPcCfZm2czTJA8SKH5G1lO+IuBz/aChGdDAhnjcYn+s+k7tPpe6kALgvU5YbMpIUMRRFxtnRvBjQqrWYFCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2TUCdCUkQ9CKZi0+2zPx9G5HavskyCEsEzZveRf5pM=;
 b=Xp5Xb3torVt25pKXOFaZPkl1wG643KOd6TftNcFDpM1R7d+i5/Fi6EPalTlY+Kd3HGRRtYTbb9+X8ma/B7HNVON08hUYgOix3rEk9E7wt6qRrXwl9e5RjC8CJaeZ3sKmNvxtHerpE3wjF4uj9U+wqfjCzCNRcNdVwnPRC+Jg0vtzNT35mcXnHJ8VbaCmTN+xoABRKPsjuUCY9OenewVsYYmrJcVa6TGj4C7EDFfMlTZrLeKYnGJ3WAEuDd2+LxVAHzwvfOOq0XTOkinbgRqbMSrE8GmbgvJUTmU7DbBk5kS5e/VuXdHduJPXxm46i6cd3Q0EBpmhTxxuLepiRCmZng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW6PR11MB8311.namprd11.prod.outlook.com
 (2603:10b6:303:241::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Sun, 1 Mar
 2026 10:48:26 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.014; Sun, 1 Mar 2026
 10:48:26 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: i2c: ov9282: Modernize driver with CCI and streams API
Date: Sun,  1 Mar 2026 18:48:06 +0800
Message-ID: <20260301104809.3505257-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
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
X-MS-Office365-Filtering-Correlation-Id: 4a052f9b-54f3-4470-e6e3-08de7780110f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	AoEOAfhb056NUj7wxbGvdZrSSmMDg6mCNqe0bTtfhodaeXJKusFwGb+CWL0f9FidLc6ca8hOHjFryamlDnf6vIRJxaMx1Bck8pg1bu6mMmKUJg34m5vrFT1RenqrpeD1I1oh5I/zmQLmr5vIcuZeCNrZRefOm2KuvpQVIHQVDNGncG8QVIu+AqKfWIf7gM4SJdySCuVSgmWnsC+NIf0sOPRtTagQYXmsbmQWTiWCeiRUZyUe2I8o4zd8G9m3HVxK41jlxGULvsR0rwlsnmak6LrRUAkwmeXADuAF7hsV7cEPVocp8L3O6M6zxb6RvYaFMmAeuK5cA0cPtloWfZM6jXyOtHe0rFwjKTgXAZ7Z9GP1/zT3QcPt/X1kyYjhxfiGiL0rusi6kDGJu6FbQcAPVGzBNPo38Tyg0K98XNhe48z5Rg6APVply9uc65jHv5uF/G8TkkVt43vFTsyYLByYpKIJt4InaOo2SS60wWFjUVepXIku0SeMJOrnhF/wkeioMghl1t6P9Pc1CQLLK7bQ4h3rDSx/H78NV71hC51+A8xu0CHe4OYmGB/1a992mToOwYUr0FhHGW8jsjcH20RyuXmASI//zWrRlusgKVcy/HVR2zmAKd1YaUOTl5b8zvtevWMaRxca493sLeWFq+LE8w9jXstDDUCvaGrCjk/9F65SOth+wMxfQKeSFZnSBMIfzdkPKx5GfEPfFdblsv8cW79FxsoVi0TBg6/oFvcSJopwDlnoxcGhofzewUxsFLG3
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lxWyzL1cSi5crWxwbYapI3mA26kSDdSbXLB2pZcgklm1XOMNGq8/lMED7qAR?=
 =?us-ascii?Q?yyTsP6oPK9AuVrq/2Cd0q/7/ZPNguHQHJCh/G9ot9HBXjt+cU3CnqgHPhxzP?=
 =?us-ascii?Q?ffIEyZWs3Jdk3DmO8q/VaJ3QgzgYzUySPj2j4oCGFvV8oBZzZr0r/aApTGMV?=
 =?us-ascii?Q?X8cnuA+CBiqpNHAoeYbHJgWome+K9CuCTyZ0AxwGHK4yqOgQ4VqDWDXggS3A?=
 =?us-ascii?Q?+4Cvs1MozkJOatA2SqjgEJIEixNlvgn33EDzRSTXV+4EUhGJ2h9YpjqI5r7s?=
 =?us-ascii?Q?0jJxWd6bopLikLtBTKcWv4PZwZZ2Mq6i9MbG4WmnWhdFB1miZjSP4TVyzQkS?=
 =?us-ascii?Q?CbkbjCeufy9i87I4X4viqQt5Bag64Kt4MSifjjL5abST69FQ51q3FAk3y5mc?=
 =?us-ascii?Q?bJ4kiiVTnfSTvfDtrPIC3iukt6cwjn4zH3ky5ocL69QN26Zt/0hL6WzFSCgi?=
 =?us-ascii?Q?0uAdxanr74zEatJtibxUT+n37AKMvEnE75Y/LrTPYF8uHnStMfkKlrLm7sP2?=
 =?us-ascii?Q?JUki39s+lWokB+9yzEEYs0vHMimzHx4Axba3ZZFTiGrQiK5o3oWiGzcX+3pp?=
 =?us-ascii?Q?hGjUu56QFHB5ezVQXIUr+I5zRK5LYirhjZMWj6+d2WleixWvYlTvN5Phb+5/?=
 =?us-ascii?Q?Ydt82wOs5kAgImhjm91/sMzvIt996yAytDE1UlGHdtRoWvIQkq+zUSEj2zjm?=
 =?us-ascii?Q?R8iM/31dXWunoAf+gczf4iiwNH95QIVWcHeDRK6+xFC79667AGOf9i4HYBPT?=
 =?us-ascii?Q?fp22G9N1RhsbsFtmOqb011E9N/M5P0g95Ygval0FFwPWC6KJS8k307GELlj2?=
 =?us-ascii?Q?PGqM9CXW1iWp6xGRWeWJiQ+OTIchVgXUu6x7V7pNwfz7a/3t9M+EPWJ9cifL?=
 =?us-ascii?Q?5eLdFgeLoz+uci58/eCLE0YiVNdBvGiBzYQg0QavPtFx6GplLRuYSOYvIkP4?=
 =?us-ascii?Q?IioP8w0iyWcW2Q3jRcJ06RoaHDJ3elXTtFH8830kgLwezXJZHNeLjnaoC3RI?=
 =?us-ascii?Q?CGWNMLAPOHW6KpiVy/HQ8cggdbYr9XthpTzCVH9wvrkCs8607wQgWwdadG87?=
 =?us-ascii?Q?MM+6ZXlftyiymGZusmmDPEEfHue/6nhR9znXDSFqW5/Iis0E6LrZxupgD/yH?=
 =?us-ascii?Q?LcL/3VuCipF4gid54w/eerLWhQpfKIF1lhcI9ja+YPxK1IT9mMR1RQtDIfh2?=
 =?us-ascii?Q?Yv/ikHwJDnlOLNKfFVq4sv74Qzo9zwXKIZamlww1QnRSd1cx6luJrMyDWGuM?=
 =?us-ascii?Q?Q0HdFTA6kxtHJ6preiu9yO0YzemMvQ0wrPKX256yFID8K7VwwF3ncB5KchNx?=
 =?us-ascii?Q?cIqTT2h3fthDjjvqaSZjvosaOvea+G8lLWus84KqLteybB9vnV8zVZMFdNlx?=
 =?us-ascii?Q?1g76pkatOHZ6Rnko+1IzNK3vRthPT+lsBDI83SjXMtWhNZPZ/0DuObk4BhLB?=
 =?us-ascii?Q?O68IaOZ2vXPTByNj2aWfSDmuLCcDYB5/4mCNQIvOVRnBE5FozAbewXQER6WL?=
 =?us-ascii?Q?L9P+XmsygUcAqiFP59NNiX3RP2pvWxT6+vt5eXD84qdYRrZvHaRry/yJ8F+o?=
 =?us-ascii?Q?ODTn4bHNGMOvNHSVTmQ/E3PzPwPVEHeL/qM+AOn6urJh745FpgxGtF4isPYD?=
 =?us-ascii?Q?OmLrk3N/HA+5FaZdxet91m6xfmB+d6D18QInOrdkjXt5cdYq38EWL8fDLVSK?=
 =?us-ascii?Q?aIib4dceP+oUC5oIwbe2gIXVY8cQ7i5/JS1zJrQBhxG8or2fr3VVhTMyjdVl?=
 =?us-ascii?Q?d60j5qVpaE5rtcEnwGYB9UI+5QkHi84=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a052f9b-54f3-4470-e6e3-08de7780110f
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 10:48:26.1441
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDPMIU6b/joe5VfSG3O7yU3wXaXktmsEFeJlL/ZTZg7yES6ug+APvv8j3JtWk1gJIG1OkczErdw1mXnNJ4AMNejV9g9IKIGBl3Q1LaOvrXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a4197c cx=c_pps
 a=J0RhwYao4za//xiv/28V8w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=xq3W2uTSAAAA:8
 a=t7CeM3EgAAAA:8 a=ekXEql0GMc9u5THJ3pMA:9 a=P5L7wpMTXyg1GfFA3Gwx:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: LeM2JxDG14RspmcFa4r0RsToAWUSmS0M
X-Proofpoint-ORIG-GUID: LeM2JxDG14RspmcFa4r0RsToAWUSmS0M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5NyBTYWx0ZWRfX8uFRn5gNHfkD
 /OP6hJZHUrX6pwKhNdDeWDMpCO4ywZlIs4OtObxoN1r0+ctZIQ8IZLgsGnTtjd7w8aRYpvgJKiB
 55bVvyLrCffZBHSUYqD02lkPo8n81tKBrv9TE6qkDYoBFz3EsXa2PIv2yMfqiT3UwFp5QmqStCo
 41l98XS4RB0bfbBlIpInY7mkqnCCwettO10Pky7Jn5xklPBSGf1drHrVv3lmvt1D4WlKJryG6pl
 WQtkCN1TKzECUkBt4rtIxVGaiXehJkppLTJjElTO2R4dewvuP93e3EG9Q9r5PzwKupNi0Oio7Bh
 nUJ1KQurPtx2SrD5MeUDq8//8ugh8wGdxtxp2B62kEyzXe8XgsDgdG8P0c33hoR83KeQ0TMN62i
 3xAyYFtyEdqNdY5BMDLpGsiUpj4jD1rBUi8wrrZDzJbZCa9Mj/M6dYpuPoojNlcUpjHMm+tGi8z
 7HU0Wq2DrFQfQpvAawQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54003-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.951];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,windriver.com:mid,windriver.com:dkim,linuxtv.org:url];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AAAC41CF364
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

Changes in V2:
  - Patch 1: Fixed group hold release error handling in
    ov9282_update_exp_gain()
  - Patch 2: Fixed runtime PM cleanup in probe error path
  - Patch 3: Improved error handling with clearer err_pm_put: label

Link to V1:
  https://patchwork.linuxtv.org/project/linux-media/cover/20260228083401.1007434-1-xiaolei.wang@windriver.com/

Xiaolei Wang (3):
  media: i2c: ov9282: Convert to CCI register access helpers
  media: i2c: ov9282: Switch to using the sub-device state lock
  media: i2c: ov9282: switch to {enable,disable}_streams

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov9282.c | 408 +++++++++----------------------------
 2 files changed, 101 insertions(+), 308 deletions(-)

-- 
2.43.0


