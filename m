Return-Path: <linux-media+bounces-27607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 887D5A4FDD8
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 12:39:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B16433AA13B
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 11:38:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9D0923ED69;
	Wed,  5 Mar 2025 11:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="jBDVu8qM"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013064.outbound.protection.outlook.com [52.101.67.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C6D1C5F27;
	Wed,  5 Mar 2025 11:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741174714; cv=fail; b=SQVVI4wVKemQKddKdAMT43WOoeayu4DBDR6MZEBmUw66Ye6K8NPeh3MWg6irR2ZuB3XlvAL8UztglWl0Hmev7/WEQXrfHbNn5dD7LkWxFqSqwXZTOSP2MnaTmdCRazV19UKtvpJTk6xeRCZnm4UVA7dmA6XyAILQrM43BRBPgx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741174714; c=relaxed/simple;
	bh=pFZh38+XhZJK2HDwwVG+2mRh1/C2c8mweNN02i5SEcI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=efn0XMC39qdAOy6XjEQBCRTUcHKH5So1H3DN59Q8aA37LTAQeluYTfV55t5iEOGi8yF01frrNlNDXOuZTiH5XxDflWFN38EkQoxidunBtt5hsKVktYlvocgLznuot/EHiC1ec7mIicx2gV832OB+BZ8phE2+IIbcUE45vse1hyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=pass smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=jBDVu8qM; arc=fail smtp.client-ip=52.101.67.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/ys0Pz01y1amu/keKZRMpD5wYVFcO55ccRxpQPu5t97hmE9mdgQOr1Mutdkh24jROfiOL7Qzql0FPFOW4SVNXHuxoC/21e57JFbw+Hi4PgiVY+QHfxTxfy/UGBgq5lLW7D8euwAnh7AuXVIbc7tXCSAEa4uzq5m8ZQ4Kv7fXmi6eXUXfPAdhVBimkDJs5M3SDdn71EzRgVFY2xJt35Qtl9k44Ho9jpjkzaQZAvTGAL557wZpa/0Wgw6Jt4NQBJpgRtwJwChVoexfT89w4nrKilJZVoe4GmN5eFVkWEAwchgTCOap/qFVpCe8LXCHv777lkUeNDQIb6xduympSaqjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+zEW/TZqeQ0mhAnFxXfH0l0Bi2RuEv8CE05Oz+M3huY=;
 b=Qw1+TkwgZ9bLVacTTnGQMb6DwKwmVwTS6jXtSgchszIlnjzf/ogYX3kgzw4zz20kRBQEWP/zK5sWO7TCzLVwxm4JepjVRoqwYb47KgeGtvfT8Ti8VAaImBa1JVwc/fO5GIKQqZd7KZ0/62pSnN0AiaPWcVyBGmWJLVm9rbh8grweiBv+pqcuhcSX6flyAdleG10xtHtF9OkyjfTZpe6Ud+HcizR+mEn0inyKQGaSi4ZUD427cafk1pbuPkeE+gg+wOniGnkINEeuCoWuPOtDFTxViz/tGxNtQA9A76539ebbH96ULTKS6Yygu6Kq9KV5+kXlIP/gO9MwcefeCNkM4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+zEW/TZqeQ0mhAnFxXfH0l0Bi2RuEv8CE05Oz+M3huY=;
 b=jBDVu8qMM9VPHcT2fXSLHRazCwW2i3OQrPu5lgigPMEyxKNgeTe2IE+M0GCWlW+dPJO6hnvIMfqRtAqU6ePoK5T89sIm4i3w+rWsqxxo3qHa7vIux77u2FiDeV7fRvJuHr4pNrrvW2dBncWYGJscT0w8XLeZsvlEOHiMKFJOb7kvpUpyCrWkl+GpDfyEQS4ISehdTNQuj5LgwWJPy/EbmtjbfYN5HKx7rzNLDDNUGswhBLtpU4FrNaEzuGOShzig+ohhFCgd025SPh0HKysYyALHjWPwj/LQm1UIe8Rycb60ayLUeeq6PE/pCSyY3RUTyyAAxOo81/Q8iro9WohFYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by VI1PR03MB6574.eurprd03.prod.outlook.com (2603:10a6:800:17f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 11:38:25 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%7]) with mapi id 15.20.8511.015; Wed, 5 Mar 2025
 11:38:25 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v1 0/1] media: imx: csi: Parse link configuration from fw_node
Date: Wed,  5 Mar 2025 12:38:01 +0100
Message-Id: <20250305113802.897087-1-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0012.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::15) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|VI1PR03MB6574:EE_
X-MS-Office365-Filtering-Correlation-Id: f04ac9a5-e0ba-4fa2-5d89-08dd5bda3dab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BPLFp41jWdMFkNrBgOui3NKB5lSgojR5c0iuEDkLGk/Wupw28cPR7YOwWqIl?=
 =?us-ascii?Q?UoKP+iHdeYb1+wmQS/1+oO870XYpXcDbDDK8DyXsD85/z0/CBSxSjP+D7g16?=
 =?us-ascii?Q?C//UdhKTkqD1BIcz7SyymwelvBVQN/DY7KYPievsSSY6lnJbuE+4qHA5kw+j?=
 =?us-ascii?Q?WB4sDX3EqaBXT2oVqIglFdrflRfsUHAuxAZlxxwtBLHLK4JPKbqCfJd+3h+x?=
 =?us-ascii?Q?WTkFu20Cns4Zum7xZpOz+h+jjEVDe8tqRBfNO9sEt1rvO3cQbYVUCHNniwBL?=
 =?us-ascii?Q?NwNbgp13iM+9n5TAS3TLEkCBBlul7Am+3jFH/Bl+3kKhhThCuyJ7xASlb1WU?=
 =?us-ascii?Q?eJBMjTAy9RoXXf2fRw4I4tzSkZj6sBlqhXCPTi5qIt1375VE0NRSJ35s1BzA?=
 =?us-ascii?Q?M1tT+nkmEqNOkfocrFCJ9juYb7ewrwr5Zw15oumrBjm1BrKSgkut4QHrLTNf?=
 =?us-ascii?Q?PxboaVgtoRi9wwwp6rIu/4pDCrNXBk+FwGbC2l4s3QsBwSDZHFEdNQ7m1aLY?=
 =?us-ascii?Q?twPg1eAHvAhZdA9LNWXhK9N/3mv46DR3yl82c/9Uo8lsjxGEHvYYbq1DVOmb?=
 =?us-ascii?Q?UUUPVZm2h4cZLjQm/8RxGy1NS+Ro91Ax5HR3foSNLxvXDdaJgudOMcUWfgiY?=
 =?us-ascii?Q?AxgSLPcW9HnGB9vgREkwhAEbZYHxT3o2xWzdHpH6QHGfEObbtHzWgqr9S7Rk?=
 =?us-ascii?Q?dFr5ZJ0lneJRJy+bpRXig3DSQcZCYmMEOyzcXAB1QXO5suSVKF+wCW6PFSaf?=
 =?us-ascii?Q?VEsJi5YMRLcSV8pc8BOob5kWiJ6/F4raxOsuBgwuX9WMVYiSNtiJIdjYl1Xj?=
 =?us-ascii?Q?4Pn7Fn1vtojKjpOg8MRoOf0KwjQSM0jaTmjy1tXG6cGwCARm6NSdYzUP98Mb?=
 =?us-ascii?Q?Am67UEtqG8hF55pEc60WQH5eTuI7cyLCHCxEiORqs5JtGPWJNmkIglMFvnyx?=
 =?us-ascii?Q?K3tzo567Np+1PQGYIMH+/bA5O7MUTub43Cs/ObluNULlLqWJCw6QpoD6d1Ef?=
 =?us-ascii?Q?4GHLew2GStu4pPeeHFwdNmPRFvVYShUbwgFTNYRK1uLCS31VV8bZkNL2Mt5G?=
 =?us-ascii?Q?33Noyb4/0oGvdl2u02iW1++ykpH9h9YYr4l/WqXMjbFTRsi5XVl5vwTNZRjG?=
 =?us-ascii?Q?Nuv4ufxfY8cJJLF2jA/CABmhszJSCp/fKD9hvSTbjnh+yrMcTIRvBvZYDi+b?=
 =?us-ascii?Q?yB8ew/5mYjlnc532T92GhZ9pRx+U6wzqR019yCZbcXvmVMKKi/o1ph6k319G?=
 =?us-ascii?Q?wdSmmrt5HshjLEHwTk49BoJQM7WDpUNl4SSBiUzwCd2Y/ujLqdcrvFS6tr0V?=
 =?us-ascii?Q?Sxb+NASXdf5Xom2aGzfkw4AwdsV8HFWpgpvOu7Zu8RUeEHz/Au2NDDFLupn1?=
 =?us-ascii?Q?qafY+VS/nvw85nqHFIz6rN4Sd5ves6Z7QOn7QBd7HmODDTnbwAzctxX+YA/b?=
 =?us-ascii?Q?9oDuMAdbXCyDARraTOgL9hv9DpDRh472?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IBgxwfD+0B9zeNTSJ4nRoeSYMUrcLgp5CtBQyaFJ/cp+992eNCenZZoBM3lD?=
 =?us-ascii?Q?W5iEZ1VI7w0fUg0IE+0RWXU8aPkX1ZmIi828BXAA/IrlBoD7v1ezkVOBaCwA?=
 =?us-ascii?Q?jGWgn5juJuqY/xP7payl6QtaJ+5+TUOGLgqsqGudlWfRv5wpC/+vKW3iMTwN?=
 =?us-ascii?Q?EZdAZIKhuwAue9Wohi2kvhkycsB79vn0jR3tYHgyucsEWiGzRuTnzPOB8E7h?=
 =?us-ascii?Q?+gz8TzhrL7yfLLWw9zOYUDbzL9LuPbZUvnx9VJaU9CcwtlfC1LBWcH7EuQxS?=
 =?us-ascii?Q?gjNYZLMWujEVIs03+rB3kyr6NRfdJCVYQJiurn93o7HNFlMgJcr5rwl7nRES?=
 =?us-ascii?Q?tZsAMk4rtSKp5kW2FH5PVSgmvj+P8vu5xDZyI2PQ6Um+euXiMWlpO7i1OJC0?=
 =?us-ascii?Q?ToWRwQwH2WSpnkkOWMkSRCGfCUHOinOFDnhZs0NsfaYdec4fbjtbT/0CP1Tw?=
 =?us-ascii?Q?3ZWpVtWqbCO1+GBtU8ZD3GQ8G3uxTRBfFIDKJhxcDZz5VwgyxVFOwxD1819U?=
 =?us-ascii?Q?bfOc/ielLbu1n926q2tXtC/IZ5s/Mar7Vinf5XUvjuO59jsPZx7grRc3qWKi?=
 =?us-ascii?Q?vCrtwluQwrf1XUCrPJ7jYCzt52rVzi6zy6LTJyy4b3JJ6vV/3ib3hS1VF3vS?=
 =?us-ascii?Q?iRv1LJvai/sI/prvVgDaCBuRtjXC2Fu3ljVKiRkg1BQs0yd1xgUiPPl1acKS?=
 =?us-ascii?Q?vkupoSwNmVc1Q5O3OZJYzcojezIBMHP4SMxhC0C2GTupZZFRq3q9TW0uu32Y?=
 =?us-ascii?Q?4lto3yUjzpY7zwzqObC7A1Gqj8JtBv8zo1rI1uNgj99KrinZrCgmRsW/CWLu?=
 =?us-ascii?Q?YL10FiYcBpKKQ4BFGSwJm1bvZdKln7Qe1GH+gLmLFh6BkgxtobiK8a/7HRZT?=
 =?us-ascii?Q?L9/w+kvWVeBy8AOcLFgmQ+o/WOhzUnxfrMnB9bcPS0OYy6F1y0YmdhkyCuMI?=
 =?us-ascii?Q?Sdiq5D30QXKDe5OHhPGRR9BDWzs9QE+AVi62RSJkZqeiIgsUL7+Tlijeah8q?=
 =?us-ascii?Q?b6S0Iuupf6hKYVmz7tWswpDGTyzMda1Od9UnvirxNjzvpZk21PEx3RlEFzwM?=
 =?us-ascii?Q?syV74ZC55BFlGPKNhypLDA1V/2/GU320QQp7MgWQpUR5adpv46KsDB5EAs/z?=
 =?us-ascii?Q?NTV/wiYBpnvOVJsrM8K2Cw9puG6qmAHXRhARuAUR59Cymo34VPXASfC/0Q3f?=
 =?us-ascii?Q?KJ0QuhN6xeHRemLiHXYYDPW3uAcjNiUWgwiSKOrSZ8w14CvfES4SgJoG4a8m?=
 =?us-ascii?Q?lMqEf1ij4/oO+rl7PZlqG2tlDdAPVCxSE0JzoRAgNo59JhL43lk0FpAiM7M5?=
 =?us-ascii?Q?03bGQp9tXHWaY996RPWuwdaCTSs3ca3dexKevGMUZP/20IeIZtE5TYJ9oflY?=
 =?us-ascii?Q?19ZbfRHW274X/HawrNQTrzRqhkk3Si+rblV5S1Vu4rU3/CEpasje/nI43jJ4?=
 =?us-ascii?Q?1BRy/R5YIGU50GANCr5DKaWhVV4st5LTu88fsp/pj3zaYhT5ZXNY4c3I78bI?=
 =?us-ascii?Q?vZ5sLRIDX51d60/9Py3nUfNxtCwCDAQ0a+5obf1jKN9k4uO7IWnmp5oTchRS?=
 =?us-ascii?Q?ilSkaLSa2ZGK2wr0nm8KiiSspMT+RzGRabK1yIO/?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f04ac9a5-e0ba-4fa2-5d89-08dd5bda3dab
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 11:38:25.3713
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTRQo8gSyCRA1q/NgUqR3rYjbVzq8F6d9jqyhJJv6YEpMMaF4iotZno4gQTvbaneCJJtXTX1y50Z+FnUNzbt/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB6574

Hi,

this patch fixes the imx-media-csi driver to work with camera drivers that
do not implement the subdev-pad-operation "get_mbus_format".

It's the follow up of this discussion:
https://lore.kernel.org/linux-media/Z8AoA6WjbXQufqR6@kekkonen.localdomain/

I tested the changes successfully on an i.MX6DL with an MT9M114 and an 
MT9V032 camera. They both use the parallel camera interface.
Sadly, I don't have the hardware to test with a MIPI CSI-2 camera.

Best regards,
Mathis Foerst


Mathis Foerst (1):
  media: imx: csi: Parse link configuration from fw_node

 drivers/staging/media/imx/imx-media-csi.c | 36 ++++++++++++++++++++---
 1 file changed, 32 insertions(+), 4 deletions(-)


base-commit: ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7
-- 
2.34.1


