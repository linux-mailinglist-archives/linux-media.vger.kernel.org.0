Return-Path: <linux-media+bounces-41181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9009B38298
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:40:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B6317E1F8
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 12:40:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D619A35207A;
	Wed, 27 Aug 2025 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="YLOLptXb"
X-Original-To: linux-media@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012042.outbound.protection.outlook.com [40.107.75.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FFB350D60;
	Wed, 27 Aug 2025 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298393; cv=fail; b=oD+kSPF2nUxyLXsEzKD28e9zBYz2GjrbhfUoPIJSS4Rn31Tow/XDG/sUt41gMiPAAHk71YBXm+86qHKODXqlubdYEW+0Ii8bwNOn1tXnLEvur3FvOw/aMrZzxCC5tw7uQ3hrRea2AWO2pHEgwhBNCutwREzjmrGFuEkRJmD4HUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298393; c=relaxed/simple;
	bh=CjKzQSz8711fNqK5805WnCU2VwIyQYB5cdar1AnXsPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=etbLpP6vEL1fVZZGwj3ogK3jqdjMOOAK54sz+qKGhV8gN9NLsT9s/2I5LM1HaNLau34Y15eNNUBAyIzbQz0ga3XpttOSpSu1swQ2VEwCA3jdPhnYOXozk1A/KsSQw2nVXD2tTW+ptwxNiQmqwHXqpRJCA/VPZ4ZGfVwnOyurwCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=YLOLptXb; arc=fail smtp.client-ip=40.107.75.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZNY+H5NKw9WErU0KaWMRakk5KyOkTH1DXKPFUUEYNphjc+okLa6SWvn+AW77YLMn0QRlifND7wyfVl2766wagvcSktYnwr7/9VqW8ENfb3D8yfrGtS62+kAf3fYwpCM6csQIsoZzblWL7zRJb1jSlu/rO0Z+oBYy6NrBec1dXNDnoVZxPyDM7t07Xl6LwoIOTamrCnljZb0HdIounw1CiIdkXpXBG4qJ6ZyloGaCve0n8ziWt1kY/GXeQZx3yKeUgPEPfSQaRuEZ++z+ZPiqqpXDJdKGOVOKl+e3M06MxBZQ1GJyGTTyX9DJU4UBZu+7b+DwR091CgoVZ9k4mcgjUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=whso1J2BaMBiQxxKxN08xWN3/B0cVCWKBccNBJihp7w=;
 b=Huh/oH8F7lbsYVXSNDU5J9dQoFoIbpRPZ0m69n2nP/Ko3TkysBkfJAxFIf+Rzd4wNvlIlKShtcrXsY2RJiqoSRO7Ua9CQmY0kr4107JLY87WFq/+8ioxnJeh3OnhasbsPCXqEi+SqLBSSmHiw/L08lEBr7CxKoLQ2ckfQReuE9y/qriYTmK1nslLYFmbSr6Tgzmg1xWJhP4zAP7V1bk8m/4zyPSNFst3YHcas//QP8v4932zQ2bSx0G866OlkI9KrRXmS+spm1D44erXpOtviTYTEPQVEdl25lmmJq7jmICxzXcV+xl99/b3CzqbP99w2/MIYpD8rETg9OsMnYsvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=whso1J2BaMBiQxxKxN08xWN3/B0cVCWKBccNBJihp7w=;
 b=YLOLptXbqsVbYsGTf+s8xrnIY5Hz05XxoFeBBcg+OdDXcUyD7N4fjgvoeqISyW/5jfjlnmhkuauOf/OQQA+iLaZR8YLf3J+QPGR8ZTacY9J2TeQls8mlqElaQNLpaeMgsYntu3/Z10gM+MvTx55A+Z7yGdcV8Lfr1Ns70U4C3wRWfdXZrlJoAZ+IZfHIW9CbcrQ1PK/aVwGQTheScFYGrX+Q7Ls2TnbJzYyLJJVVyja5/uL0Di2KI+zWJmzU85X8Di7blsFs+U2t76J5fFOHjIz6xeRsZ2Q1AoRs3jwoZuh28Vfh+Luwn36ud1K45W3z7r/5R5EbJ5bEzZEQiHZLpg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 KL1PR06MB7285.apcprd06.prod.outlook.com (2603:1096:820:145::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Wed, 27 Aug
 2025 12:39:44 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 12:39:44 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-media@vger.kernel.org (open list:MEDIA DRIVERS FOR STM32 - DCMI / DCMIPP),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 4/5] media: stm32-dcmi: use int type to store negative error codes
Date: Wed, 27 Aug 2025 20:39:12 +0800
Message-Id: <20250827123916.504189-5-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827123916.504189-1-rongqianfeng@vivo.com>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|KL1PR06MB7285:EE_
X-MS-Office365-Filtering-Correlation-Id: d33811b3-63e7-4cc8-6317-08dde566ccc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tDF8v98OEx2q76tFjCZQIuEACokeUBye7QfFNgrVIfrHKu2AxBI9FfW0goPb?=
 =?us-ascii?Q?l/+/njPC7q05EfAILgCT1k7ikAZjgrO6mB5LpLWbxRI9356a2VFP/7svPlyZ?=
 =?us-ascii?Q?pqvyHE2ElTHRJeKJuAU5hw+QU0j0EmPDl4RgtLwpXnZw+mLc5RPWYXwRzR59?=
 =?us-ascii?Q?56RUtD1lyNASrJ++5wcfeOoWBBPsSVg4GRJ3FaKlV78mpQVe8s42Dd5Y1xyT?=
 =?us-ascii?Q?8lXR6rzzFtf8VrpXlvkwFNrK/62eRLZ4lVeZH5VCaSzUCKNqpR+EOHHjAHeg?=
 =?us-ascii?Q?R8K7ay4hg5iREF5TVUDhyYa2oZR7qCGzc3XikFEcWXwWF7DTzeZ+SgP2ZN0W?=
 =?us-ascii?Q?/eeaWGhL9kDqoRsVc/GCZ7kR6ltTUv2peC5oiV9G3LzG4XuILK6pQ+kHMi0e?=
 =?us-ascii?Q?4L0QMTkdkzKakByYzqPns+QF3ESS7lwLDSL0RDuwB8QBr/usjt9uUTjw/P5y?=
 =?us-ascii?Q?U4mo3rAt/WbU9xWtXmGQPlkyW2c1TzAUZTnMFB/gmATPG1E7gAl0+V1BRjyT?=
 =?us-ascii?Q?yuOxSL21zlOwQYvTgA1STx2PKuzPjKr+ju8e79PcBJgoqqMsfsHdob+1nvsM?=
 =?us-ascii?Q?zFZiUu2et+ADtD+fBZnnAWX3IYzekoTD0eDTOXlh3d10vn7DCdBYJNkmUaxZ?=
 =?us-ascii?Q?C7sdIGCtqVdtlXvCn0X2bbr1XWWNmJI43/EKfNtmSZEXvjrKkYdC/PjX9w1l?=
 =?us-ascii?Q?jkJPc2sv0BtjdtUtpgLqycdHLOldXd1TxEhkd7eQu6xmBcqbQiqvNSWxPm9F?=
 =?us-ascii?Q?euPA5BLHkZrqegwQBSDpIAH5qPPpZjoMFGQpZZfXVGl1sPASxIVpPUmN9Y75?=
 =?us-ascii?Q?rQid1S3M97fja3OIin8EFKvc9/Kl5tXdhGNBNno7wOS1B9QAZi+UpMtx6siu?=
 =?us-ascii?Q?bQX3v/EyuVPntIn+Uy6oHOWF2zpUkfwbUyBQDOh6TUNK7DGKFOq8gbbQtsLe?=
 =?us-ascii?Q?gLWfy4gWbbxXOubcohsG6RIr/83SIIiOsmksj+e28m/lei0LEMMGiZ+fsbvW?=
 =?us-ascii?Q?oq+VbIgGLrEy2JvmduB1yfsDb/XR0rFxim8vKQ/xqJtyNnyntKF873AhotcE?=
 =?us-ascii?Q?MNKp0EkiHQPeCNlWhazuZTKr2qi0KPNEHHxfnLT5y+EQ1mVPJ9ioO+Ub4xi4?=
 =?us-ascii?Q?aAwK3PMphobi/lqVqH6xaA9lXvzmUX9O2dHiVgttwK5/IvAnyE7N/k53lHH1?=
 =?us-ascii?Q?VgGJMcjEP4lFvOh/I8ock2O+fZC5Vuntg9gXSeU5Tf/xPH5C8YoV+/XwTj/4?=
 =?us-ascii?Q?IH3GYIUPw4nRrVFRhZgCcUrHtAhP8TRYbuEEkK2PKSMaY/n1ePi0t0zXcHB8?=
 =?us-ascii?Q?wGufasYbwZZkBvT0hDg9E1CFxh3Ba6aPWY7dwfYK9t/9nnezP82nH0jdRtd6?=
 =?us-ascii?Q?Jd3zPu9v5sHwa6AvTAKUmxXrrOsJwj0+w+dea3sx4V/B7NlYdaMIpADkwTp+?=
 =?us-ascii?Q?HwN0p9FibBWGdTgde6Bx0zn/JlSBBwO3a5qNgMJJiRM8KsurF5VerQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zjLu3+q6xvXA9onWykDi6HTV9tG39v/EDsowKjrUs/3OzE2toh8FBCir8uuC?=
 =?us-ascii?Q?mXW1UJe5wtcnOorbjgfgVId7b9YLonwLjPTplj0x5hDr2zT3cvbeF/ft7yYd?=
 =?us-ascii?Q?w7Z26vYTPmJ3QR4IGvK0IID2DsqsyGlvYHtf/g+giU5h3v+Zz+jiU9VqkWjP?=
 =?us-ascii?Q?11XnK8pWFtZ36J1tz/NlaH1MOanqndiRTUr1LKwqp1EoyK+/scXVhQveDNn5?=
 =?us-ascii?Q?GP/1KDSBGUHxX7ty7RWK0qtRqcv8VWrH0A5JWS1RdsKKHGhQ04xrHQ9w3fd4?=
 =?us-ascii?Q?sVnxVqyhb+ZDg3YiMLak4QAQYqRHX71GBOhpn7V9gnL6t7uJfKvZDvSGiLrf?=
 =?us-ascii?Q?StWoiOdkjZxqwWSJxocRkIDhQSolmImJApWbGgSNUWNPE6EQ79rY0+NOVLr2?=
 =?us-ascii?Q?b55h4bHisAELRsRtcXCxuFNW9QkBOmxVJZCFavxsvyOlmiJk21UMXaGq6o1z?=
 =?us-ascii?Q?qOrhOd68t5Ii4QudkeU6mfqnBVFhFWOnPSQYei3T4O+SPU/hrtELqsypRXsZ?=
 =?us-ascii?Q?tB3DnOKadzKNz6eSTcvVIQy2UTdi6d1kw4JGOI0lTm9WFFlksbB17F+bTgiF?=
 =?us-ascii?Q?wzv3lzN+L9cOZd1rqVrNNPOYChUG+/LGuQt+WAroKWUXuRciEpysdc23WZ4U?=
 =?us-ascii?Q?fcvFwj4hPzwFngDVj9LJa1V1neV2AoyfpNCVxhX5LAbtICWPoZ9Jj8rYvvKv?=
 =?us-ascii?Q?7COotd9nzTGJlogZEKpXeAVySXBQH6vHGtiiTCNqHz/6u6vtgps6XV/tVJ6d?=
 =?us-ascii?Q?OZ35ycE7RGJT3vQPNAPtRBd5mXimVY/KdYvRGfCHCDrmzbPBMznbepG4cDw0?=
 =?us-ascii?Q?WDkjyS6xJad1lp9IXAu90hsJxKF9OgMp+u/HzFPUm9FYux9MBZZ5GBOk8gUS?=
 =?us-ascii?Q?NqNKDW/aap+rPBpErYQuSj/OsrAEMH0xKohMA3SsqDQVkyMYXLhvTPZ8pW70?=
 =?us-ascii?Q?OZtzLKpNODnmL6WE7qHvDY/SFNdiB5Xkn+cYUbV/zFOzTNfEN4OuzbWDTZKc?=
 =?us-ascii?Q?JmMydSfwvSZmQpe5GTs/07SfBZQPq1k4zfW3f8BrUw3jkWDw5kKfOya/pu8j?=
 =?us-ascii?Q?Ooc6HWE1Wsp3GSiyeR9qhFw7gdmTqKGar475kivj888ukwYOs1KbrH7XOQe9?=
 =?us-ascii?Q?DxGNEftTGZqVFu7mo0TxeoxGIxmiyHDZie6pGv7xuBHf7UJHzp0EVGYZnyaj?=
 =?us-ascii?Q?z5knhydM+gIzyMX5yLgLqqOF6AQZq1T4Of59gU1HhBupD7Uc4k2Fr0Z2vZRI?=
 =?us-ascii?Q?RVGxQPlqHjP/NlHJkZ9tOPvwdpcpzgEciGEYmQ7uiwVObOPVokwKvJg3mNPZ?=
 =?us-ascii?Q?puWMS1Fgl7+h7d8bVhw+c5gDpEXy7PSMSRT5yc3gjVeixxrtvWeUwIEiLeH3?=
 =?us-ascii?Q?kGarKHkrDQ8inYrr9Q8KeKk4aktJbj1KFg9r70rj1cZirLm3a7fPQ4WBvm7q?=
 =?us-ascii?Q?kFNKEsqi0C/BMgtXU3LpCnEU1jWhFc83zITBmkhof5OhIOW906QiZonlDsYl?=
 =?us-ascii?Q?V4r1+CCT8S9ltLHY3iR2gL/2JXi78qJpPFi4l8qQeazGH4aug/GyE20TJ+77?=
 =?us-ascii?Q?pg9/LFjULKaK5O7iWOpSVzSKpyda9+0yAomNFW5Q?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33811b3-63e7-4cc8-6317-08dde566ccc0
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 12:39:44.2717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYh8czlyEeO/f9DLjZ6mHyxLV0AHsJ+c+QOvPoSjSpevAYM1fXONxePOKJX3cpfgKg3Dnouf8s1Y97UEmckPPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB7285

Change "ret" from unsigned int to int type in dcmi_framesizes_init()
and dcmi_graph_notify_bound() to store negative error codes or zero
returned by v4l2_subdev_call() and media_create_pad_link() - this
better aligns with the coding standards and maintains code consistency.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index d94c61b8569d..13762861b769 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -1701,8 +1701,8 @@ static int dcmi_framesizes_init(struct stm32_dcmi *dcmi)
 		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
 		.code = dcmi->sd_format->mbus_code,
 	};
-	unsigned int ret;
 	unsigned int i;
+	int ret;
 
 	/* Allocate discrete framesizes array */
 	while (!v4l2_subdev_call(subdev, pad, enum_frame_size,
@@ -1808,8 +1808,8 @@ static int dcmi_graph_notify_bound(struct v4l2_async_notifier *notifier,
 				   struct v4l2_async_connection *asd)
 {
 	struct stm32_dcmi *dcmi = notifier_to_dcmi(notifier);
-	unsigned int ret;
 	int src_pad;
+	int ret;
 
 	dev_dbg(dcmi->dev, "Subdev \"%s\" bound\n", subdev->name);
 
-- 
2.34.1


