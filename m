Return-Path: <linux-media+bounces-34710-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9021AD855F
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 10:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E3DB1E03A5
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 08:22:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3067A2727E6;
	Fri, 13 Jun 2025 08:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="DLjqUKM9"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013034.outbound.protection.outlook.com [52.101.127.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002C726B764;
	Fri, 13 Jun 2025 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749802934; cv=fail; b=ERjSlNSVeiHo4otK39vqP/RCMgaQ8lJwLMePJhIxrVJCA3s67NYsHVHQv1lUOHCqqrWo7j2m0YOGaqhP8/DnISkrkDQYlALUgISttlF1654ybUBaAVbIJIdEo650drTnDfAUHHQp/zDMYAGIE9pEc673LALbJryvLU/jn17QbWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749802934; c=relaxed/simple;
	bh=TWXMEm/6v6LUteeOXvziRdCCsvbzmO2tXSeEvA9MSFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mFvQcmkFv+b5YouDT7JWpwEuNNT6ogAVYT700LLuXA30fBQ7S5cnldHDulDl+fagRyNcIAeAV/j83uAVw619jAsNRqItsNs4vjZlRbl59Di+Vm1EWMOWrk7t1Hqa/EHDkfhGsUUDakN9V3X1hqm3hrRmNBvQhzhdRCs8327VUWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=DLjqUKM9; arc=fail smtp.client-ip=52.101.127.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUJxuj58VboVyAyoBBurvnZl88PYYl3ZIiLPdVKRfTTWEVF+dvNHPYPNPGmE4k8bvO+A7XSYRD/RwDpMB+aVvyVf198pysqarRwbExsP6HivOk4bPF2CAFGu3GRXDayHDlpDCmZ+e2TfFP7UpC2+9vdtai3qG0HD/6uRGbQd+29SIUp9zhiTIPsGsDLQ32kfpdff/exoj90TSDVI8kFGQ0V+wdTABcDZTueYXN14bEoFzDPK2JWNeedbn7+2LNkSOoi66mvR1fVPQMZVKvaNVKhT1ZUfdjjxgYnKgZUMH6rQQbx5X164RwyYeUFBrzt/rJuT5cwu6jUym9YlSEvZOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=deWKvz3ufJZt2kyr4TxntqnS3gIRSq3dVqTPcsk3bHg=;
 b=fnJP4l08f1N2vL+wYBCnG4hQF5rQQp0cYht0Q23vYT+KqTTl5Q50tJRjiz0yk8pndvSLVXLY39KtPeOeQc1C+lqyNkjvwFLPR8rf27yN5tYd4yJ8obqnOx/Mi+6uRhpz+1d+0S12l/WX4xKurCDk3Kr1AO8Ns1c4jgCXJ2dVopAypU8J13DNqjtE/i9I3NV8jupTcnLR/JdJKTQ++YtAx0NCBZcrnzLh25CYup7qq20xf7T3VY6Ny0bFqHGIk+sMVJ/xvQ4DansmmAZiFUKKskNwffOQu5TW4aPhrQhGRHAX90rOZeANs7zV6548P9LQHG9AgdYisJ3nmez0obadtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=deWKvz3ufJZt2kyr4TxntqnS3gIRSq3dVqTPcsk3bHg=;
 b=DLjqUKM9CZOm3Ql4I/gOybUVa9d6JUWbM05p95uASwJdgBCrl4AYMY1brdfqips/tD3icfJziiK2Cs1medNvqpLc8aLqtUtEXmiiD6pB7G0uAmElrpJJaXMMABWsna59PwRexl7FwLII9qlFHCIbLij0JJ0s+7G0xGZMMI9JJ7GF3WWFf5dh1SdSA2gFL9Cq6nRwUsUegSs4kPFupLZ/5odDIvcKykKB/CF2ApbeP+iXmBUPgFOzAlYCJbGeKECH7SNglmt+8oiAXENgXJ2XUVH7xM8m501d0MPq59uePjEKHixvSihAlh5I/QrvU+u3Nhow5ENQvhxGbX7YgdmYgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com (2603:1096:604:2ac::8)
 by KL1PR0601MB5535.apcprd06.prod.outlook.com (2603:1096:820:b5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Fri, 13 Jun
 2025 08:22:09 +0000
Received: from OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49]) by OS8PR06MB7663.apcprd06.prod.outlook.com
 ([fe80::46a5:9b06:416e:1e49%4]) with mapi id 15.20.8813.024; Fri, 13 Jun 2025
 08:22:09 +0000
From: Pan Chuang <panchuang@vivo.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pan Chuang <panchuang@vivo.com>
Subject: [PATCH 1/3] pci: cx23885: altera-ci: Use str_read_write() helper
Date: Fri, 13 Jun 2025 16:21:55 +0800
Message-Id: <20250613082157.50040-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20250613082157.50040-1-panchuang@vivo.com>
References: <20250613082157.50040-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:4:54::31) To OS8PR06MB7663.apcprd06.prod.outlook.com
 (2603:1096:604:2ac::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS8PR06MB7663:EE_|KL1PR0601MB5535:EE_
X-MS-Office365-Filtering-Correlation-Id: cd5ad2e8-8a35-451e-615f-08ddaa536403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?AzdmErS3slJepKUAVy6hHAaosdttwpQhm8URd+03Mo4Q20HorY+YhKKaepOK?=
 =?us-ascii?Q?sUOt8n6rvdUIAfAP+TWD4QwbL8VL+PULH7+13YTG7Cuo9D4MEsJyXQMcUK+Y?=
 =?us-ascii?Q?3oJmN/Kqq0/eH2281BFIXRBO3G8tVUgmngB2SImO/SKmbQXaAuafLS7i/9vU?=
 =?us-ascii?Q?qiOSTM4QCR/+zxY12EzsodP9GYnUGgEajaw83qr7qfAmFVaMsm3/aDw8+5Oi?=
 =?us-ascii?Q?M4BTagchPD2aN0nirStx+h6Qq4A1+sJcr3MWtcCEh7WBbomjjr7DrCi1d2qV?=
 =?us-ascii?Q?hkPy/cikar5emVzPzey3kjNUJVN7G0VD+c3q9Kq3MUkJQYPWDxWlICjFn2jv?=
 =?us-ascii?Q?C8xFKE5e6ytK0/a+9oJYCmxo44FFZHG4lF83pIyF3gRj0Iydt3dvwcD2+xXS?=
 =?us-ascii?Q?wQHKRJZJOlYD6Ei8PWUXApfNPd8C5yxSbGkOPzQ1dnWHrHGB7wuib+qkpftL?=
 =?us-ascii?Q?eUFtT6tGQEvCHLzxeU+9dO3TQbL0Om37OAj4i2nyClvaeoxbo58iTSM3Gvr+?=
 =?us-ascii?Q?MlFAOiIbCsBOcTkU9emSnKE1ficsjYosVvuqKsGhzZeJdGTIXsJdHA5VdRfD?=
 =?us-ascii?Q?c99rc27tR7CCVl5aLaXs8zOMbqFZqkRexxK8O41QpXrQKf0fO+UHvH5tTtwu?=
 =?us-ascii?Q?A6OY8dzBSzpIPhBdMXQ5xnQeUn5do7rLEMjPXZQkrMl/X5Pe8YvZN1FKt2jC?=
 =?us-ascii?Q?ccex2u25nA2FM/d6Siig9elbG1qcpVUpAqwRTKaiAfL57z59yH+o5J6g/qOQ?=
 =?us-ascii?Q?BhEFDLu2h69VQ0aCwq5QYqqT7ol03690H98s3oZFXFMwIfdlo0kDXlGYoDCI?=
 =?us-ascii?Q?pLJ6duMsFsQ+Kf/TNrezh+gVUCawBjpwAsE7UbvIJ7srGtitoRi4RrbCYrxM?=
 =?us-ascii?Q?Pq5DRJKX/xA7VFEmG1/R7gJJwXHqYqcE/9IVzWk1lV2S5kHk7gAwIylSITNj?=
 =?us-ascii?Q?CGpG5tgIdc6LtB2CaiFn1Iigdd8C/JYYpvCACHe7zMp+ukQoH0k6XT+QtxTZ?=
 =?us-ascii?Q?yN0PmkZOWkbUgYjBcWgInhDIsSQ3yaR7J6xw1gdt4oxP2ItVRl7HtPrElKLv?=
 =?us-ascii?Q?CJjBcSPgcJRkQ62eKgTY+RtIPzX0e6S81lT1R7NlUXAkzMptCS2v2LDYo9+H?=
 =?us-ascii?Q?k6RAECuBxQXkwNXd3woDh5lNSJf+u74tN8YAnSF76DwtQ4LRneAWC6UZgv+h?=
 =?us-ascii?Q?DM5PfejbXklPbB3YEbejhxU4ysSZuh7zRrpRvoz2mJEkPRFSEi/usRA5v20c?=
 =?us-ascii?Q?lNgN5y9wz7IXZnzZmIeVh/Dcy1gTgrBxjXvnNByW0aLsyKn7ZZD5OXlxBunM?=
 =?us-ascii?Q?wIzFB5J7xWvUyiNUJm+m4DKDf2AX8ojn0hO2a2MkwqvjWGGDAfkOFf/eT7IL?=
 =?us-ascii?Q?XWYTOBUdsJsQ8bf7bBzn7dqgADFc4vl2cVpTDV0KZe/KdH8YWZTtxA4KSaeE?=
 =?us-ascii?Q?8jtj4pzUYWMt5LJjlkcU5mBxhrDAMMrKWC+jRIx1Q87JEcQL1lsMUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS8PR06MB7663.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Cd3PFS1m78ozqDxJSPIcFgqr+6Ajvx3Lbbo9SzM99DfstzkeXwc8xYnyHtHL?=
 =?us-ascii?Q?iiH42NDoUl5anhdnN4itqzkDf7zsTetkkJ09yt+QQyvNDXQdswnYyeXhZwR9?=
 =?us-ascii?Q?tjHVnlgqb1oXG9C4w9st0RI2f2qvSJLyXhqcXMZW5Ml3X9XibqpA/9SkqdFc?=
 =?us-ascii?Q?TKh6CKnltX2Pkg5G/udUn5DK+mLLAua0q0j1Izlwe5wq4TCFVLf1XdXbaKyk?=
 =?us-ascii?Q?lREeI9gWG+OF3se28lqHtT8fBr7m21xorVdK9M5AGVB1zarh7yyKjoxKXttD?=
 =?us-ascii?Q?6cQROGjYzkGPG+fW0vafaDEDej7kJ9/17qjSb989TKByvTsGlUc4bI6AWVMI?=
 =?us-ascii?Q?LRANmKpNkq7lPQdeYseVCJR7aJJR/9n4KWD8i10lUupmHXehQ9WoMlVbjoj9?=
 =?us-ascii?Q?fMpzm9uKS6yEiHErOKHw48CAZaS58yhwAUCZ8qHzMApLPyfeAmwJBesD/UYW?=
 =?us-ascii?Q?WRBNoBrSMJCny3ZQnKAlqmy4wH3998uKziVh2XIROcBojXEwDLAv0hETB8ia?=
 =?us-ascii?Q?Gf2tgXDFJHfEFJUSXona1PLMt2HA2Zx7oQITEwEcIJcb7UacKcw8bzyDo7zT?=
 =?us-ascii?Q?AJqQ8gaAo1ODw0lVFtpIsmJHm0Bnmkakpn3rq718zZLt1O2/PDD84g7GxZRu?=
 =?us-ascii?Q?JbrdYIVCJUmt4HmDly/b9b1cJ5/+mKf2h7mOU0kWPJ4NiMb78y8dOJ+53CQp?=
 =?us-ascii?Q?gHn17FJlYx9Wavy3RK9+rn/rYBnfKdqdQFiI5M0CvjlkTFAJlSGRooqemLni?=
 =?us-ascii?Q?Vj/QLhJIBwqMOdIwDUPkn5dPVELZz99oY20U1S5c/xiU1I2Fsb68wYcl2raj?=
 =?us-ascii?Q?SW8u4i0cLq6xjn+b0MempzwGA7ZQ00Jn0O/7p5wconrEGuiqOFXY++cR9aD4?=
 =?us-ascii?Q?w4Nvk78emRqb0p9Va34lqnTK0J12l06SVEMjrxJh+Tk95vDjS/uAJK7Wv2vj?=
 =?us-ascii?Q?HDH+y4HKRQRx86MdrOzDcPBlCT72zR1uMiI1vecHvIb6zkSmOhrsorrKkw2t?=
 =?us-ascii?Q?8N+thEX3cKfD16BwqKT5TWd8U1rvQqaxdKVbYVlLB/LEqKi3HLK5u8YDTn9K?=
 =?us-ascii?Q?7h5s70UCdu0lwFcCn1eBIrkzWudV9sHYtnL3qlwSJiJUBWN+h9t8UrAztSE1?=
 =?us-ascii?Q?PUbDy+eGHQOK/6Dkc5raKexEGDwrgEb8d8bx7U/QGx/Gtz78uE3TPhdyHh8l?=
 =?us-ascii?Q?ORRUrRWYpVERLiEaBlXKKffpYt5QKmUigqZ9IL+5zTYbXxdZ4s47h2BgA3Ri?=
 =?us-ascii?Q?zKVUJN01vIhpptSI4huUxYnpOLXrwpC40+zad/ib04Dcwa/+WYSerHj97fFV?=
 =?us-ascii?Q?wXJH000ujfmxgJy1iQ0tqQS5i2reqNvQtOurnUVhhUkhzdbBOfvFTAa7AMD3?=
 =?us-ascii?Q?mWUquwYXPA2PgOLkQA1uRjgkX0hHv7vqXQdkUgyGJnc8lcvedU1KAykbZ1oz?=
 =?us-ascii?Q?phQI+D1xxiHd0wkXwf1bJBi/EKJu+h9ChVzvLchT45TzImDdadizEXI6TmFG?=
 =?us-ascii?Q?0wyC/IOSGAybkO5PzVrW9UYO12kfVA6jjoLmpXQB0RHmuTGjx7B6jp4AOXL2?=
 =?us-ascii?Q?XCTUgThWP1YHEpSKUR8DsLzLEz0dXD/Lmf9cHhCW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5ad2e8-8a35-451e-615f-08ddaa536403
X-MS-Exchange-CrossTenant-AuthSource: OS8PR06MB7663.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 08:22:09.5605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYSJQwgeo1DyvT7anIX24WkShE1J3b4tMea9gfUXYMe4j6Cn+Z6Q9ACyQnqJCj6kNLGHNmuXYA/NxSGkDDbmBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5535

Remove hard-coded strings by using the str_read_write() helper.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/media/pci/cx23885/altera-ci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx23885/altera-ci.c b/drivers/media/pci/cx23885/altera-ci.c
index 0dc348215b72..e154a39d86ef 100644
--- a/drivers/media/pci/cx23885/altera-ci.c
+++ b/drivers/media/pci/cx23885/altera-ci.c
@@ -282,7 +282,7 @@ static int altera_ci_op_cam(struct dvb_ca_en50221 *en50221, int slot,
 	mutex_unlock(&inter->fpga_mutex);
 
 	ci_dbg_print("%s: %s: addr=[0x%02x], %s=%x\n", __func__,
-			(read) ? "read" : "write", addr,
+			str_read_write(read), addr,
 			(flag == NETUP_CI_FLG_CTL) ? "ctl" : "mem",
 			(read) ? mem : val);
 
-- 
2.39.0


