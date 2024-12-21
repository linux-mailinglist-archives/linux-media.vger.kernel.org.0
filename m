Return-Path: <linux-media+bounces-23967-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 290AB9F9E0A
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 04:15:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E3061887661
	for <lists+linux-media@lfdr.de>; Sat, 21 Dec 2024 03:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EA486337;
	Sat, 21 Dec 2024 03:15:34 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CD4139CFA;
	Sat, 21 Dec 2024 03:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734750933; cv=fail; b=lWoa+J7fvw0ookOrA7pxF0hgz7GU1ILyQ6ajfpM68MVemd2fLZtw7PhWiIi0nyzdqh0FoZ9P15dTX465VZhstu0HUiOKJkDZN8ce+hbOriyVqVc5SV3CpsJ1XRdrifKzHf9lVYdyFujoEIQ7HVuxmgWVbiHvT79f2R5JKZAR6jE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734750933; c=relaxed/simple;
	bh=Y+89zZ9HwP7lZHfBriNDh0Bef/EehBKSULXN0CLmKlg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Pg7ZYEM6z9aulVfh45VtXUskG8LaY9+XoX9rxVrZIy6QG6lSz3DcncVy+OtMG9OuynyZVNtPjRGdNty4VSXQnFcyAWvVO6E9aTGgxComdtj6wmn39hGjHE6hWZZxOrFYzM9MksLnoaHQyVk59NRPCSX4zRw6YfeZBvhlMCY1X8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BL3E3Pd029932;
	Sat, 21 Dec 2024 03:15:11 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2049.outbound.protection.outlook.com [104.47.58.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0r311-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 21 Dec 2024 03:15:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UElMTSYUFHEWn+E1gtWl5dOe638uO2qhzJ84B/hOxv0w5spE8n7xlO7ccvgl8rVoiHIvns6N/N4+Mtq1P5Fgl25NvnjE6ybD6Aj5Ty8l2jo1e57FMEEhC1jndMh0uT+TEwLMUHGcKkzPLqxpxV+3HlVICeFq8/d2PWRBC7faOs2cqBYtpd3EZ8owfnoGRQ/TmMWVpu/guBMNcLeU/CTxHKtTaeiS+Ks7sYR3L0znZ8vgFKczQ07LIz8oUbIW4oJzUmQr1OvnDXtDRiwlS6O1n3A5WxGJSyqZvNraJl8L29bWwMsnH8inWbLIDmdnfeuJWUlMzTkzWxWK3uL75V1dbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eydXwXvd7ReZpo81LXz/VfoAzpk1OHLkDob1p2yZ5uw=;
 b=VXBoSdXWxKw4z4OMEcUohi7R375Z07jtO/X+scqeIcKbgdGbLtIgyccLrz6YZdIezHHAyd2ecVsy6UiYoYrR0wZVapryIFVLwh5HGB/NPa6vZ/0lbl7wccj65jtMxTkmsaZZ9hgpER9DL9GdmvIT8S5YmlNbXL1+ct9aLkKSL6W6v7CNCs4NnIh1OzrQ4k99EtmcWaS5NrF/aVrUPtDza5BDbxJPZNjw0e0gMB+pWKKfyJ8gyjkINURRcQB95cvDF9KxAsnMJQd3JaIifwjfJ/Rz3+LmUDLD9d5sj3wgPPN2gZZ32cbl6SdsBFbGZVVIxw3C4Y+frcrRC9IU2+ASfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8)
 by PH7PR11MB7606.namprd11.prod.outlook.com (2603:10b6:510:271::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Sat, 21 Dec
 2024 03:15:09 +0000
Received: from MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8]) by MW5PR11MB5764.namprd11.prod.outlook.com
 ([fe80::3c2c:a17f:2516:4dc8%7]) with mapi id 15.20.8272.005; Sat, 21 Dec 2024
 03:15:09 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: p.zabel@pengutronix.de, mchehab@kernel.org
Cc: xiaolei.wang@windriver.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: coda: Add system resume interface
Date: Sat, 21 Dec 2024 11:14:55 +0800
Message-Id: <20241221031455.1361778-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0336.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::7) To MW5PR11MB5764.namprd11.prod.outlook.com
 (2603:10b6:303:197::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR11MB5764:EE_|PH7PR11MB7606:EE_
X-MS-Office365-Filtering-Correlation-Id: dddad583-3c35-499c-934c-08dd216dace2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hQHcuRd7xE0LIp4ucIKEPd6d0vQg9mSFqNoNma14BkRTAtt/lE9qd9JAVooc?=
 =?us-ascii?Q?cPBI3QCJ680Lz5/h+Uh8rn+Z2wKx3cUmJt5EBG5/+zdcVgeh8lmvAFodjDPm?=
 =?us-ascii?Q?2TAMDbQF7tAcDTWbkBrlzGcLJW2CKHa8H+keFf5fs1e9L/csXwtWqExImxxk?=
 =?us-ascii?Q?8UMPILlq0H8dhDHfRsACYWL1b8LT32bDZn/dWWdx1cqMuWzcRjtJZy5LeaH+?=
 =?us-ascii?Q?P8Jwi6TTK9wE9gjHlbuQLLMKCUd5bq8RfYIKzI//UURIk/0RF6hJs9+zh1Wk?=
 =?us-ascii?Q?DUMgzYkPrrU/fs9sUZj3VKOZkWWDvBe4jkmQL42DvIMIqJxbOJzQ4e0gmKDB?=
 =?us-ascii?Q?kjVRDwyAXjf9v9ZZ0EDEB04ld/X2RAV12WE127UWeP9+K/+4H6THfmrrk2w8?=
 =?us-ascii?Q?2/mcK1zwO2d7T73XuG2ZoZPU3ro8hBSm8OwYTlknjXNRvPXI8DrznWzts7+V?=
 =?us-ascii?Q?BwxcXICf8tQ4ad7rwuQP7jXdMJojATzI4O45sdVai2Ij0CyC0HkQbzj3nx2h?=
 =?us-ascii?Q?A38k6vka3HjFn+CfN7d7Y3Vk6Lt/LiqMttU1YBk5VMs+YzAoyFs5ZIed2f/v?=
 =?us-ascii?Q?AnWmSEhIk7Mw7Sxp0r66v5GzP9psMH3xUMpDw3zdy534C9mZaCr521+NUhrV?=
 =?us-ascii?Q?Lq216V4AVrT2oh9bP2AcfkpJFGUGfIX+pTml7I9wN/MURRfojaKsUBux93OF?=
 =?us-ascii?Q?gZrUXGLw8aQFKnrRGHvkXG/zt0rR+iscRdb1hEyR1NtDr6K0GLTQuD21tK1k?=
 =?us-ascii?Q?baOnila+YKdiVd7XNL4EaHsWnIxLHI/bi+Y384vRJk5DvtQN/ijKQkkoAWkX?=
 =?us-ascii?Q?5OTiv5fkU7YrOCbps6ZoHocErS5i1jhziG5RdKc4FUF/1z+qTgwKN5OG6EG0?=
 =?us-ascii?Q?fa/GFzaBhO7N0h1/2o94KJgPPBVaZqZ92yHq2iWjnARQ3e7AMOQUa/tXLEID?=
 =?us-ascii?Q?NxekLSFNprcPpLX3smNfKVv+/l1jKeQrx4DnDWbpAE4Cj3VkeXMMg2z6GwGO?=
 =?us-ascii?Q?pC8DHoiUr6tiHn/jLYfKPRh3pJw8ddXZ1JZN7WOV7GehQILBCvyIIpcR2nbd?=
 =?us-ascii?Q?mYR3vqJ+m2WHzk9V8a4oTgNl+9uccIiwkiOVT/sD3QRNJ+vJ9eGXuwTcFDKe?=
 =?us-ascii?Q?mmhdLAgJgFQ7GBqJ4bda+B0cQ1FQUI19SREcPEy4b2wj0yF9kxmWaY0+p+uX?=
 =?us-ascii?Q?xOtkCN3g9EADQB5GgD7dxILRNirVzt7jXM6/d3T3kvjSy1YiyhilclI3Gtxf?=
 =?us-ascii?Q?v7Xa/n2eD5A22B7L6Hg7DnCtGpv42ossW+6uEiz/rO3HLIvIdPDpFM6ylcp7?=
 =?us-ascii?Q?pOXKh0z06q9sVL4AqgQHAIjG/aF0qXk54uHsh1nOItC5d2tGsxxFR3vqVl7E?=
 =?us-ascii?Q?J9iaNXZQuUC0U09tK9/XjFJir2goIC1/vkfTBQwuEpY4V5S05nX+3VgThsGQ?=
 =?us-ascii?Q?DwPKNHMpks2FS8YdVpZ4aPC/OCQwFtq0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR11MB5764.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pg50Cu0FHdT7QO8a7Hop6ANbYLRniw6dSGDby6yazYiHgZdqX40KXDeivafa?=
 =?us-ascii?Q?NViUMHlVZf1GNF0GVrT+15HPJFjv34f6ImbWN257CophXDJ8/h9pdnTodhbu?=
 =?us-ascii?Q?DA6UMCdR1Ca3wzoT9xpCOYePqErcjKnGXU2az+KfVe0fU9xADqdyo3oa6yN9?=
 =?us-ascii?Q?GBPYsScGj74hCTzOXpSuXE5jPH8WbZ/7kJDqCmEFUN7202+7XhFfE6TFm5v3?=
 =?us-ascii?Q?jEhKOJ74nXWlSWPA+4I8+PtKSNRnS/MNiDeZuPiv4qxISS/eLUrYH48MD3Y1?=
 =?us-ascii?Q?gZmfmdpmDYhBkjIsom+Cr6WOtGlNZujmQ6YxrNB0VPNsr9ygcKkYCzdymMPA?=
 =?us-ascii?Q?hypq5VVG04YJ3wTZ9WSsHRQutTT5oLAUcMD/duy6ijXiIMHGSpE0ZoWZXuhF?=
 =?us-ascii?Q?ZkAj3W6T6NzGtd3HnnFjCYdKcHmdfInKYXLa15zkVS7bMmPioJtRveEGBlYR?=
 =?us-ascii?Q?JRyBu7nDFZmY7ZCWKsPy90Y11mJ2YIU7QGCwuOnQXf+aLezrQ79tiUw0NlMm?=
 =?us-ascii?Q?Nq3LuUbc+7n3Om1E1h7ubEdudXIxxGIcfzlvo6Vdq7z9ZdnPgLyNWrSjnneM?=
 =?us-ascii?Q?UcLpwYK6TUcVTTQgKzMVHpu/cCZaRC9o3mj1n050EEBkiXFiDYo+AG9jNe3e?=
 =?us-ascii?Q?AvF4H59jyz8Mcu2Q/xjcT3c8OYWOSlFo9tNORbCQAFAqyBEwEQlTXHUvMnni?=
 =?us-ascii?Q?473yoI5xtABLImb/AS8wFWB2RzY0K3LD1Lb9BCR9gxdOwX+z0BghEGg9CJ7Z?=
 =?us-ascii?Q?D43HcaygXcjqw/XXvdywLTCqEFh/ogUWxoRLt9sk1oZUKx16uTS9YcZdGcWv?=
 =?us-ascii?Q?iXErsT59u9exg/0DFy2rpS3NnfzEXfzhc+CJOLANQs/aWuVyt/XkC/htYneV?=
 =?us-ascii?Q?rWDDH/yAzMPnOGOtzcFS5r8O/wLX8EpSwFxfOIyon31Xfg2HdXyHfy3Xq/lB?=
 =?us-ascii?Q?3PLCDhFhjF+dZRIZA6yQVV9IZLMMgqUDpVVYAHq/R7QFOjlqjx0QUmyM1tXn?=
 =?us-ascii?Q?B30D3AjPbgnjDCm4ai3azxx96bebRmQ5GVpt3cEsBLU8m2/S+W8OFNJleRaR?=
 =?us-ascii?Q?72rOex1l/emWlhhQh19dP7OlX6eVuSH13JYUHId6ZEaCXba8US05qhFNOh2L?=
 =?us-ascii?Q?Gq5VOH1LbS8zTUI6wma35aeyb8sVO4tBhJFOwm473FRKMZ6ccBXksrfcu1+E?=
 =?us-ascii?Q?Km3TBEqg9Neu9DB/wcJEXwzPnyuUu7j/d2NJzmidVJzP17UAMbamwgiey3iQ?=
 =?us-ascii?Q?BGikhI/zBRCIwPDrlJ8tcG5XCbyWlL/ZMc5gSfvms0S8uErItQ/N4iz428FR?=
 =?us-ascii?Q?UPQ9wJXfZu5V1qdIVxoDgaNuh4DcnJp3AAFgrR/jJmn2bNCkyFkZJkLcuzjL?=
 =?us-ascii?Q?uOb9fl1tO/8CUVJlbphmmC8d2Ix9vbJPTCCUM71W1wkx6/g0LroFz5m0pUAT?=
 =?us-ascii?Q?ecH3uUDLJQ9N/ACgmvZ5/vG7EGftAjv/U1M7ndS3mrHp89AFqO2boL2s/v91?=
 =?us-ascii?Q?O5zKJT6jFfcRdxuhvCPq9rATUXuqSg0XJRbQ1zZorWrLpjP0ptLlv0kxfnxs?=
 =?us-ascii?Q?96rgKaYXGsDSjVDEAktTaZe/Tied6vnF0hcTmaIOyeVlVg/T0eRklM0XNz2Q?=
 =?us-ascii?Q?bw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dddad583-3c35-499c-934c-08dd216dace2
X-MS-Exchange-CrossTenant-AuthSource: MW5PR11MB5764.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 03:15:09.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MP/qYbF5Oa7HIdSfN7YHRDgLiRuInrtY7M+Juzf2BjmfqDZVLH0J8hZxeqaop+T6S+wxiw6RM5vJK5S0SrSADzu3b0/uDkDeBjGsHMtdy+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7606
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=676632bf cx=c_pps a=SX8rmsjRxG1z7ITso5uGAQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=s7N2NoQUEgFzUVEu_bYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ciESYQ22tZWpups8eEEMoic4H3M7gBil
X-Proofpoint-GUID: ciESYQ22tZWpups8eEEMoic4H3M7gBil
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-21_01,2024-12-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412210025

When the system goes into sleep mode, the dependent
power will be turned off, so when the system resumes,
coda_hw_init() needs to be called, otherwise it will
get 'CODA PIC_RUN timeout' after resuming.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/platform/chips-media/coda/coda-common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/drivers/media/platform/chips-media/coda/coda-common.c
index 289a076c3bcc..e6e3f5ec24f6 100644
--- a/drivers/media/platform/chips-media/coda/coda-common.c
+++ b/drivers/media/platform/chips-media/coda/coda-common.c
@@ -3340,6 +3340,7 @@ static int coda_runtime_resume(struct device *dev)
 
 static const struct dev_pm_ops coda_pm_ops = {
 	SET_RUNTIME_PM_OPS(NULL, coda_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
 };
 
 static struct platform_driver coda_driver = {
-- 
2.25.1


