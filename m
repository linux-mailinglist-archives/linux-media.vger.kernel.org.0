Return-Path: <linux-media+bounces-49819-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6FECECF28
	for <lists+linux-media@lfdr.de>; Thu, 01 Jan 2026 11:31:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0F1D030080F1
	for <lists+linux-media@lfdr.de>; Thu,  1 Jan 2026 10:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09134298CC4;
	Thu,  1 Jan 2026 10:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="KtJYPdeR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4B914A8E;
	Thu,  1 Jan 2026 10:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767263476; cv=fail; b=X9MsXXWMYlK2Ca08v9fk4kTKMLShHJseNXV4urvruq9C+qMHZJ58b68Wq6NtNqOE63bkxbsOqiKsuUz4a3yXvolSAK8KkRquvepF7jCASk2cEREcI+jmRRNO1C8AYBmu48sdVq/89ZP6sbE2JkbVYPhNZDBXS9Ssc2PPfyllsRo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767263476; c=relaxed/simple;
	bh=l4sXmP3tb6lvgdPrjBExbGkDmFTOcCWKRG2KYAaiMTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fU0fP10pDw0c3lFE4IeQ6uEPn/vHalzqPyARIyNkUBeTE+73XRUglu9BCssnWODbSmjEqO1nDDs+5KImzUfh5hwuZam6lHA5CVMeYgTRPmw5nGeR2lAeIG6RELZVRsQUtL385Kyyn/x08jIb7FUJ58tUA4pyyk6YfxXj/7owzgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=KtJYPdeR; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601AKtAM4117147;
	Thu, 1 Jan 2026 02:30:41 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=4H3lZ1gYkZGLL5nUCCy9E1Ak8i6Uf0wpO6PD0h+vBOk=; b=
	KtJYPdeRXU0JgHx6mgyPxP9YZ96f62nEMDqLfI99WRZgYfqZx6lAYJe0O56YSsPt
	9EpjSda8ycO7OGn6Sc91UIo+xQNvyLCa2GLO/3LI6FB/c4E+iioItKilzdiyp+d/
	GNyZI+ZfcDj71d4OzED/fD0zpe8hAZBrRLN5xtANZP8amWXrPuRwRXnSjeTRuPSA
	PHOsTnTSrjbI0yOJklclVyvGOaQBV+VFCJODDb6VikYTla/oN95ECWr/CK4WTVCj
	EMrSco9fQGISHHWJwuL+gSkyZARWCM7cZ0wQ4sy4eqUwT8VXFJ50ztT5rCtzSOVe
	HyvTcOTvjiff6MoQ6trnxw==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafukc9ev-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 02:30:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GpFDhqqfg1ouTvq5o/cImI7zpXSMe+dDKN6dsmpAWs0rmD0ZfQ5juecMc/THWxdQlK3boed0cNSXQROjl2IOAbr8SyAQGS8y3nsyTVfKT6pQ6xvI1g/nQOYU7ajvwPDNEV53lBhT0QVbEN5RL82Rj0jAQch6C3kHaBHGrghbwTLy0tjP9MawBFkVk6YMOfTc/h+PY4XxRHvQSOXTbJ0J1DyvZtQHt3Bmj+hWFfyqCkLZUMt9JYzvBVrTMuM0MUhnzRtwIdG4+9HW86GxfId9R51W0KwIHN3QIjie2GECVF+mVXB67cutPO2R9wm7hjfOePAmjPCWXjTyggAZzwnYkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4H3lZ1gYkZGLL5nUCCy9E1Ak8i6Uf0wpO6PD0h+vBOk=;
 b=joxwai/pM810SzejXwqQd4YdrMr7qxnrOH2otNm3QVy1+R54f5qn6NOWK//xqSNqWQh0dcNQK9ri+eZfp34hFp+sKAr4zkTkSFcMKQ2IMizXuf1qOoXP6BaUo8it2SHCpAaQJJmbtDAJGDAgjjwr74tkzWuVG5BRsJO69Ld2pXRCxnDzz4ewlQYWSaXjmOBBAIUj5sJSyfKwvjLORIUSQg1mEjRkBL6sIXNByfkhsBfV2eOBjEkW2Qps5Y32SAe23y/ffbpsoWA8Gz42Rl4tlI/WZutPE/mOo3z4pkLQ7bIS4Hz4tbrYAWGwOKWzuqMC2NAS27PXolQVzd1z9XldHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CY8PR11MB7876.namprd11.prod.outlook.com
 (2603:10b6:930:7d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 10:30:38 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Thu, 1 Jan 2026
 10:30:38 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: tarang.raval@siliconsignals.io, laurent.pinchart@ideasonboard.com,
        sakari.ailus@linux.intel.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] media: i2c: ov5647: Switch to using the sub-device state lock
Date: Thu,  1 Jan 2026 18:30:00 +0800
Message-ID: <20260101103001.207194-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260101103001.207194-1-xiaolei.wang@windriver.com>
References: <20260101103001.207194-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CY8PR11MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f924a13-f186-4bfb-3a3f-08de4920ce7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|7053199007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EEoJYdKFURYYLPMmNP282AtJWD2guHAxg8TltkC2Ev+SlM6m1gAmFBl2dBWh?=
 =?us-ascii?Q?xKop5XuM+MDixCGV6e8zpj0hIqqTGvo6bJxEB7Hc+dfLpDhDlDl83r6lsQZ4?=
 =?us-ascii?Q?YIjhSulWaf+zaoNNw3aPALI7LnkahnbMy66HAFddeoYMCFHiWo6ocbxMnV0s?=
 =?us-ascii?Q?vjik7p38IqAh+Ifsy1IBcERNZ/DvkiFDtoMlztgiV4PLy25Ht7VRTPMJsWW8?=
 =?us-ascii?Q?CBAE69ngmZUVVorK0th0xrkQcqRdMSKrf3jhQVSynsMQ44taMm89K26wYv2H?=
 =?us-ascii?Q?NxKSzepsFhl01rmwk3sOdRerGYu+4SIq5yWXizZ80mYdZY3OSnGM5PdRYv2G?=
 =?us-ascii?Q?XbKBed1WqJR0LHiDeIxT47Gg7O5BFYgvsk/Romyb3X76mmOk5q1QlvuadswE?=
 =?us-ascii?Q?eeEdBirJ1TKVwNzU0l2w1csK4a0qgfFInCn8zaKE4hFJU3FCrtpMiZD7kbzm?=
 =?us-ascii?Q?3gUJNK94zirQ5bt/wgr4W9As7Tggz/hlhBMrHWE3Qp2mRNB7ywXV3A9HST6D?=
 =?us-ascii?Q?5EDr3XlI4+I19J3G82aB7FRqekI5t6QS9IOcJnUV2mf1Hw+/Rv3OshTeBNDV?=
 =?us-ascii?Q?G/wZOzdMxggP3rCSI/FGJsNnjy/tC7bBMKIRBBOefOennbcMzLoOmrFqPXEb?=
 =?us-ascii?Q?3kKoJZr9JFCQsxqUoL6XO3LQFodoSNciCk4EAjPpgKAlnhUUDBFQB8te8bhc?=
 =?us-ascii?Q?EaghN4Cg0EllWGQaoOi5Yow+LpT9Gx2yWdysd1Ewhpd4qaBNhIsp22jSf+qi?=
 =?us-ascii?Q?fVgu3Z7qrYn9OD+pr+eOqnn/RPLe+bV1InFXlqYcSyu1xXRLEayaRKVWr96F?=
 =?us-ascii?Q?0+15swnA5A5q5ddMB4zb8rsTr9lt+zDEMnmhKguzZDV5kitkahM4KKnXWIe5?=
 =?us-ascii?Q?frlX3TyvdiXsjE33IJGf6ItkpMof2LJcA3Bu3gHiVxSzOzvycKNl/kivo6F0?=
 =?us-ascii?Q?kQ5BqNSt/j13Ugq6FKJ9fsYbd5VG7mMDBPU86EGU7uI/+z6Qf6DZP0ktY/8W?=
 =?us-ascii?Q?UxGFfGep+Cx9A+RTWMVZzb19QFvrkHvK0xeMkLUkZB3LltCcWGspdN9gsoAn?=
 =?us-ascii?Q?tHOujoSpJT33lrnlFiiFOYYoToykH7fD/Md5T/eVobGAwe4Dj7F92mUp5wji?=
 =?us-ascii?Q?i9F/zTcM6OkycfkKvHU5KJz5z5f9ThPGHsuu4sVHF1qjKYc6ulvuWj5YuXc8?=
 =?us-ascii?Q?tR0MI82UMSQSU/iJWDTuCm+toGkUf25uALxBElf7ZS5CYGRsb96i08h0NnRW?=
 =?us-ascii?Q?E8tH5y3SE5aRE1xI12/MWgHk6N6SuG8s+zdAoCiuYEsgTOdqhCVf7aC2Xl2R?=
 =?us-ascii?Q?ntuBas9dx3WLTy6rXvPyGSzNHqom6+JQi6xqIwoLgTnj+EMJwWISptFYAxuv?=
 =?us-ascii?Q?p9abw317hYkU6fkyHes4J+VeO5VqAGmpNAVOvZkCQEOqGr3cU3tXbi/GYHR5?=
 =?us-ascii?Q?9oLjnN8QDsdWnt+w0Ez06g/STTp3ZdsqTK+iTZ8SJK57hDG5pdd5gkhbtcGh?=
 =?us-ascii?Q?kErDsDUQMShTKg5+rWIAGm9/jf48pSkrIqlXh+PyvUgwe9ZCzr9nkI8yLg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(7053199007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?E8xtSsb47DOgLjlzCLKlUHz5O1WUS7nuDh+zlIFX0c9Hl+FTxpdKlT3ojUqb?=
 =?us-ascii?Q?LVm4vB1Jls2x5htXj9bgX9sxyQBihvJ6a6/rsvGsYBkVVHCB4XSkzx8wD9YY?=
 =?us-ascii?Q?dTCk0QZ0NNbVDbH82ay23Ycj4wGdWUzMVvaAmkWtQZduWHto2qGA0komOrgl?=
 =?us-ascii?Q?Vu/XwiINI6L7ENK/o/0yXTaV3KX+QxRjhk2UwcBBBw5AfPqUmotwfLjYO3j+?=
 =?us-ascii?Q?/CDDBOF7X0YODAU88Nml/Ll8LT6UHPTKXKZwp+e5ZvApn0hYntlSTcehcgrP?=
 =?us-ascii?Q?66fI840qvIXr+cwayKtTF3z0m+RsqqmKWoMkZvBd0ibrA06W/ygz5ghWA/PR?=
 =?us-ascii?Q?J0vAoIhTY7urPu2D0x7Vnvzyg9+HgspbUSultmCMiY+PLVw3P4LBxtUPd5Y3?=
 =?us-ascii?Q?NqrfVCrxdt1Q1akOS3tyzqTtEpIUrqX3Q624P/YL48RRAESeO7laDAvv6eo2?=
 =?us-ascii?Q?ETo7qsWB73VBssswyzjEqCK5bU+0Av6gClcnzhVEbvyjrgLSLZAC0O0+iENB?=
 =?us-ascii?Q?26BLM0IFgo9lARibLKezbmL8xYTz5pchFTII4oglzz9/codG1LIUM5N0x9IU?=
 =?us-ascii?Q?ut5wdc8DGWPShYGmbQJOxgrk2pGe3Au6PuO0qFUNtQIpXhKHwe5lID/QquRK?=
 =?us-ascii?Q?4ShNtO4beXNG9eed9ruYYiaQQRzL7UDg3+C1zfVe31LR8C7ah+R6pSsRdwxb?=
 =?us-ascii?Q?0I3Z0c2AAvameq3h8pbcV/ju5w5Nxz8p11nFXE4u18eQyU/vJqL5ziMPNqz+?=
 =?us-ascii?Q?4Vo7dc+aMNE4ZiM5//Ak+AmJy6lvX0/eNTFlfxE6cVGiWBZ85t5ZSo0/A5lA?=
 =?us-ascii?Q?JopatLipFO005Por1pBBxijBmQe6O637smW+wsJw6cJnHRPkQDiRRwhi8LOB?=
 =?us-ascii?Q?V/2TtJVoRGP9Dp68Lz0N5JfPM1PKDfVfFczj3lul8CjGhtyqNarRX1T2PzJi?=
 =?us-ascii?Q?fTnHdbd9hp/EbwE7GOjJCmXHiksvypoEvfvnRBjHWp04jOfbLyI+dcfWPPS5?=
 =?us-ascii?Q?qe1X42B8H0VXJtuCnNNNUH3+633FruFumkpYroiDQOJZkt7P5DufORBHwv3v?=
 =?us-ascii?Q?TzFprBaXzCZvwCstfglYiMWBq82JJ+2dqbLKr9mMvlmy0jQwSGNk7Msl3a0t?=
 =?us-ascii?Q?yxqOpiZHGP57ZUZVPusoAiD+609hO0/FOa8NgqPF+aETYfXBoCT3S6wMdAJt?=
 =?us-ascii?Q?xw3o4MYjnjSBxgnAJ7/PpXotzKmd0VX2cMVYRXGHbrZwkXxTahh/bRlGpzNY?=
 =?us-ascii?Q?ErbwEY4duJM/SXkXCW33F3QlSjK0/D+GOBy7+JK6pvpdPy+p/SE/bnewFbHg?=
 =?us-ascii?Q?BD+n/sh92HpHlIVEf8QFlNmVs5T2+kojhTK1qxGGyKIu7FPxKOLIyqG6PAm3?=
 =?us-ascii?Q?ohttfpdrLIuqfpoAP1L9yq3XBJfKXw2GVUAHtc2Yie3r2NT8isT7rTdGcXxb?=
 =?us-ascii?Q?QnIUQRqG3zn9ZbqH7QcCBs4bN4yh9PpyS2vgL60ntaSJ8/2ZNM52L6E8x+iu?=
 =?us-ascii?Q?IgtwO3CmDKEhv/D9tZSYOxAloorVWPSGFF922SNhJzc30P85i8fyAa5cO0oc?=
 =?us-ascii?Q?M4TR8+yCv1LJDtHmEQ2P2QbrXd+YyztNa7QXFk+Xrn6g2PO9wrEXm0qTK/AO?=
 =?us-ascii?Q?7UzQl4l33IBZkTn3q22+moaBo9W52uw2ysVT2MI6EdW8N7lJBB9GgL4ET3/4?=
 =?us-ascii?Q?y288GmVnv2dAu7XJJb8WKSHo8PjefcyJAOAP5VKpszNOQuI/2b/4ZZ4NdWyF?=
 =?us-ascii?Q?Z/HaSO2BXSgiNhnrglTYDjkvIQ9g/J0=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f924a13-f186-4bfb-3a3f-08de4920ce7c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 10:30:38.7325
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQURL4DPSGusp9tLgEOhFTOu3OwMElHXv5ADhS/zg4JNMayq6V4Yoaf7+pPwKnPKGNhaqu09nLYwNp3JBlsP8UuaeX09gOsvEXy8v9ehKH0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=69564cd0 cx=c_pps
 a=55pr0gqEmxT9FJl44qZDsQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Lc8NSlXapXXr_nlJwJIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: -09jbkVVv4KJIqx4pTX4Ar9y7ifP-ThY
X-Proofpoint-ORIG-GUID: -09jbkVVv4KJIqx4pTX4Ar9y7ifP-ThY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDA5MiBTYWx0ZWRfX/EmQlfr37hf+
 8n9wPpyQdjsGF11iemT2QPD24X3Belg2+/LwfZcOhPdcLWEUUCxTvmm4JkxzMSw2+j8B/PSor1I
 3YsU5M9k3Xhc6udRpodVDs1tvBERENTWoJIzn3NUcymOhZkKhoe6PTaCIMWnfCQjUp4yrBpomtF
 rEnIzFIjmFeGy3b1TLKGo2NR132QF+ZKn+TQ9vi/Qxn1vqykXLPvVIUunt8jgvS8ZedO3C9895Z
 LCGzAsMQZujjZnpYLwJ0CHabc2/FrPJsDvVOKuvL5MZovTJJBilBRvFNEIQcm3E47kzkPJ9X/2I
 gLd5AFKe1NvguvDek/maG0R/sHz5iqNwETShLd9jldOadeOQKJqAPcdSyyBVj08bIZ8OF3eBqW1
 JT/F75HVxONyWLtLAnENtZmroZTPPUQJV67SEwslTK40GUnqfXXKJXBjXi50m8aOpd3xTFcYUUg
 agpICceWuG+IoNyBNQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_04,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601010092

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov5647.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 24a160bbb079..822804633d0f 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -95,7 +95,6 @@ struct ov5647 {
 	struct v4l2_subdev		sd;
 	struct regmap			*regmap;
 	struct media_pad		pad;
-	struct mutex			lock;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
 	bool				clock_ncont;
@@ -799,10 +798,10 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
 static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov5647 *sensor = to_sensor(sd);
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	mutex_lock(&sensor->lock);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
@@ -823,14 +822,14 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	mutex_unlock(&sensor->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return 0;
 
 error_pm:
 	pm_runtime_put(&client->dev);
 error_unlock:
-	mutex_unlock(&sensor->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -878,7 +877,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	const struct v4l2_mbus_framefmt *sensor_format;
 	struct ov5647 *sensor = to_sensor(sd);
 
-	mutex_lock(&sensor->lock);
 	switch (format->which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
 		sensor_format = v4l2_subdev_state_get_format(sd_state,
@@ -890,7 +888,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	}
 
 	*fmt = *sensor_format;
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -908,7 +905,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 				      fmt->width, fmt->height);
 
 	/* Update the sensor mode and apply at it at streamon time. */
-	mutex_lock(&sensor->lock);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_state_get_format(sd_state, format->pad) = mode->format;
 	} else {
@@ -937,7 +933,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 exposure_def);
 	}
 	*fmt = mode->format;
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -950,10 +945,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP: {
 		struct ov5647 *sensor = to_sensor(sd);
 
-		mutex_lock(&sensor->lock);
 		sel->r = *__ov5647_get_pad_crop(sensor, sd_state, sel->pad,
 						sel->which);
-		mutex_unlock(&sensor->lock);
 
 		return 0;
 	}
@@ -1046,9 +1039,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-
-	/* v4l2_ctrl_lock() locks our own mutex */
-
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
 
@@ -1263,13 +1253,11 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	mutex_init(&sensor->lock);
-
 	sensor->mode = OV5647_DEFAULT_MODE;
 
 	ret = ov5647_init_controls(sensor);
 	if (ret)
-		goto mutex_destroy;
+		return ret;
 
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
@@ -1297,9 +1285,16 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto power_off;
 
+	sd->state_lock = sensor->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "failed to init subdev\n");
+		goto power_off;
+	}
+
 	ret = v4l2_async_register_subdev(sd);
 	if (ret < 0)
-		goto power_off;
+		goto v4l2_subdev_cleanup;
 
 	/* Enable runtime PM and turn off the device */
 	pm_runtime_set_active(dev);
@@ -1310,14 +1305,14 @@ static int ov5647_probe(struct i2c_client *client)
 
 	return 0;
 
+v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
 power_off:
 	ov5647_power_off(dev);
 entity_cleanup:
 	media_entity_cleanup(&sd->entity);
 ctrl_handler_free:
 	v4l2_ctrl_handler_free(&sensor->ctrls);
-mutex_destroy:
-	mutex_destroy(&sensor->lock);
 
 	return ret;
 }
@@ -1328,11 +1323,11 @@ static void ov5647_remove(struct i2c_client *client)
 	struct ov5647 *sensor = to_sensor(sd);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	pm_runtime_disable(&client->dev);
-	mutex_destroy(&sensor->lock);
 }
 
 static const struct dev_pm_ops ov5647_pm_ops = {
-- 
2.43.0


