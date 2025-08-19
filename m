Return-Path: <linux-media+bounces-40242-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E83EDB2BD55
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 11:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8339217B916
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 09:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D190731A05B;
	Tue, 19 Aug 2025 09:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="UMP+Qol0"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013040.outbound.protection.outlook.com [52.101.127.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E8A1F76A8;
	Tue, 19 Aug 2025 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595429; cv=fail; b=JZx442+kNXlw9x2udT0++vECGcmTyAZaLhM7INHifTL3jiER5boa/6tw+9VIOrft8pSnDsS/dlzfjS7c8h2xAisY8yxdE7oy+TUgPv98ma/f2E8wUnhYt6mcE6vHHV126kntUuntvrVJTyygHcEXw+OH4Ca7t8Y5faPEi+G+r/k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595429; c=relaxed/simple;
	bh=t+0f4+xYO6F/PIjpe15T4yVQSgIOHLkpEnXG+Tf9lyU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pASJV3W9GzHXRmiFRec/uslT8yBv6ixdTNZ0FLgUv7ywc2+sWCuzjub0BVZDMFUUKUV+BHPu+hmL7uYKjwmsbPzeaq6q1LR/ADtZ+1A+/f0ibDvKBkAZMBWzsmFQIWZwVps0fvDR/r8MyWI+TrH9dKYBnMYfQJJblOnb2e7n0Xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=UMP+Qol0; arc=fail smtp.client-ip=52.101.127.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y3+Y9dXzqPpH0BahfmD8bsV1NRXX4nTx87A14MZbxtxYDLxQN/ZmSDaMNwH6CnVPZBYeGYSkwc1JHrEus5RkJCjeEX/iV1309cqZ2P2K4drSdpnpEI1YCKE7pFDCcp5tPlYq1nSz0jUwDXqn8oz93RHUlNnZJxN9JCz9PbojMrSejuJ0SFGS/FeBRLpgqhhURwN7fkr4IhgFuh9Vt+GwbahIsUuajZpThNndlTrk6M6ATtGfunHT3vtbKHKv5Tm5FoYos4DNaf6vlCmKOkhA+bGKBbLGWT7Kc6S+396e906YnkygURk/vcIC904ETf1LmZvXGysDYrB37osXFQHxWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZynIp0/f7YAPXZAxaJGTQWg/doVNQDa9zBNjMuX3Hnw=;
 b=T9dmSrod132l8RDiH+I92VvLb3KDsJADTYWCDeO3+XFbP85VgMy8whij9vUrUWkG2tqNvqpIuZwqDBmI7NhzOnKFhvK+sg0rdNHwzg5KKhU3MXeRqw7qZrFuD2s5JXASYeIsf3aJgweQ9n0VFjelnpKXTd3ZCXdPfLTV0bB4fOgGtPPT8+l+OH3MUS5WFBacaCXdSkRJM7QFozTyPxc+MGnKCph+i1je8MpomzsVvo/edvq9qfHJqo7uX+IhoIYtgBOt+nKXcCnbcUB294ZmKBvbgXoMOnK0TFZ3P5kDR/e81k7mJWbmhyur09EI8KX+ikODAAsDu/UmNbKNG0CdMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZynIp0/f7YAPXZAxaJGTQWg/doVNQDa9zBNjMuX3Hnw=;
 b=UMP+Qol0qqFeKwie2X7HFcZVMiAxKniJu6eh+VaDD/pBc8HMh7AYVAV1/ZiylNOVeDKvFMcpb8AFUVSp3LuRPqu5AcJMwVJbT+Wcz6HwJSQKeaaA+zLGIpNFhobvJe4SEZXkncdtEU+gBlsYx0vLxXKY9ehlN1/i2E9zkUCdaqSA+AJ1JsGQsm/7ArKm321gZjIj+zYeLr9q+PCvFEgzXB31zB83/icFMIteOxXooVtSN0jUhzwBN+wr1eTjG1qFOHY8ybH6je18LoJjrnFm/0SsPIQETjN1tJLGgrZQB0d010Y5wa5oDcirvqeE9xqi+APB6FiN8V2S3GBk50ATEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com (2603:1096:820:d8::5)
 by SG2PR06MB5264.apcprd06.prod.outlook.com (2603:1096:4:1dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 09:23:44 +0000
Received: from KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb]) by KL1PR06MB6020.apcprd06.prod.outlook.com
 ([fe80::4ec9:a94d:c986:2ceb%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 09:23:44 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] staging: media: tegra-video: Remove the use of dev_err_probe()
Date: Tue, 19 Aug 2025 17:23:30 +0800
Message-Id: <20250819092330.550046-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0100.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::16) To KL1PR06MB6020.apcprd06.prod.outlook.com
 (2603:1096:820:d8::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6020:EE_|SG2PR06MB5264:EE_
X-MS-Office365-Filtering-Correlation-Id: de3a56f4-98fa-4609-92bb-08dddf0217bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qHWRL2tbUAgo8Cox+G3Far7jTU+QmZ7D7/SVS4GOFKZEkbp7pYgmgDjOwaZ6?=
 =?us-ascii?Q?eUC04ZyUWUkMYmJ0gqipQEJIVAAjS++iz1x+hhy2gnwPjDw9mxVgJaieIuLb?=
 =?us-ascii?Q?842QPNA1EXc4x9QeXf593UnJnymzXAAJRCTfAOZiEbO6DhqrWGZuP1iKe+5S?=
 =?us-ascii?Q?xO1iuTYG7WWxFloi/2qJeklAkjGOgDgEao/EbzzBBOZ7xiMTdmbl/DJB8DW5?=
 =?us-ascii?Q?Lt4v3NZjux25GVHHlav1fHPuww3WD3r8Zy1dgnAJ+xUsn46oORs9pMAqyqUV?=
 =?us-ascii?Q?trh2U5NTiVbxh7ai3pK9WJWYT/sEHI+PcK17A3MIjwJaTJfJwvGh4GQhmC5d?=
 =?us-ascii?Q?pQNwC0/BrbGR+DWjoAagCdjq+1dEKZKK5P19bqgQI6BX27QYidHHkllw8YML?=
 =?us-ascii?Q?URQ2xP0v9Cb97/b2OBaDO1GZykRo5vtF7H4XMPf4uH4NY14D06prWfLg+2D2?=
 =?us-ascii?Q?/ND4i/L9QoWKF6uMl8fnSTghWCMLsnBKSTFkbJ/qPIKIIJKz/jTfSosWVrr0?=
 =?us-ascii?Q?VHDFyuC40lcxy36L78pZyiHUFZIH1PkKysVrUE14Q7kuo4ddZIT85uPqOsKl?=
 =?us-ascii?Q?iuI+lqVcMzu2TzlseaQwEdlLY7Qs0mftHvVcNCm+lulTePh1q/ecwlnM3ARa?=
 =?us-ascii?Q?wnnIPx+UsxH8C0jcQ0Vz8GcKEqONKxwc65ytCPleToZklYhiggACZ2iXH+Y/?=
 =?us-ascii?Q?YPWHkGhhUCwVeNIfvKW1kTlD7nz7jykIBFsGEt3GtbuF4HVjyVdbDUjR4q8T?=
 =?us-ascii?Q?0RgxNQa7bk07CneWOaz9kH1ik/vamDLmvZHyVdzxUBPRH7ojNCdCRXE0IqFX?=
 =?us-ascii?Q?BRQC3BA3RiKXPKbbr1pPb3zr8bgDV8P4EAEAHjqKC/WJRgcty3r+nFwfvwOQ?=
 =?us-ascii?Q?Gqceo0A2vl/EFVGvyTd6/7i+TqFnlVnuVwn3UcWCbnXsKHMbt9zD7p1RZeL0?=
 =?us-ascii?Q?wBJP4lcuCSA3+bMuLGdohU1a+noOpLDMP1TjLVr5XDPvC1UxYC5rXxFZNXIP?=
 =?us-ascii?Q?7AMSxiVBt0w6SFyE/7I6W8ESc+wMyf13PfE4WHbd60cFIEwRM1veV3Z0NDOo?=
 =?us-ascii?Q?U6d0/5V0L87QI729Zx/nfA9jJiXeg5DRahqDTKBvdXVJ2UdHE08eVE3bmHT/?=
 =?us-ascii?Q?UmYg+0eTwZJncYmxUWXXcwKBd8iPCnrlzc8MBEqaOPAKfjdruu1is8Pg+dyG?=
 =?us-ascii?Q?+ez3WfCEFkeXvmnEfvSAiRtYra4o5G0q9QivzA6mwDWIYoqoVAmf0R7uE/yV?=
 =?us-ascii?Q?CGDQsMOSHWmaaQK6wR4TIrecp1UQtdPGhzjb1LO0+hAMC1EnGZEFgfRLJYzH?=
 =?us-ascii?Q?1mILxqPdLx3Z3fd1kHvDSJP06YaULEx45vB2X2l1b4UkFgl7QEeo+WxdGgMy?=
 =?us-ascii?Q?8/QZ81ZpuStmL4h6NwjJQiRKLiFEvWhjULF8QDHMAYSWy8F5QYvg1PK+MwZo?=
 =?us-ascii?Q?mqdk9xAjIPnnyzd+JLVZRDx2PEUInMPKEngipSl82W3VN1zpkVHR3w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6020.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bsQ0NmOQXYcexoaDg8tLRKj0VNv9cvXtC4bmfLzfED2FVoQg6/so/wbmaXYY?=
 =?us-ascii?Q?NF+7DzR/fuoYD9tyNA3/MocfsX8J3W0tH+jzj36UdJJYpX7AQ/CM3tiYZI/7?=
 =?us-ascii?Q?5nNprncOIUCk/Cob6aNAHT2vqrTkhqwDw+8HKVj8QrJBqdP45VvoLz6MKXLQ?=
 =?us-ascii?Q?1CmbcEMuh5+qP8vwSDkhY5vG1XA/ysL3STuAZ/cCll1VtK7A/kG5KJuwL17J?=
 =?us-ascii?Q?NL9qFm+x/ETMqxQBi4BkMlA6mCRcrAh7SNHWFXeOrH5A0owUcoZyFVH+sFqa?=
 =?us-ascii?Q?uaZRDQfeV0sAG6HWiUjWc7KmndxqtCNdkXIsOw80ptYoIZPLiJs/xnwoMudi?=
 =?us-ascii?Q?vXe7BacI7xUjaSPke43CoJtuDkbqAZUB263Bcw13LfjFiPub9SiGAizRfZ5r?=
 =?us-ascii?Q?xfyLIFtGUG5Vtg5z1TcuvO8+bzpqgq3nlLcZWjX7kPig8QGzVHvZTDxSckOS?=
 =?us-ascii?Q?nYAQ406PxE9qSTmq559aCgFlypZJJpeqku9V3EH7FQWmLvPFNnPf4KH+4Nhi?=
 =?us-ascii?Q?XuW6s0h3P09ULWjmyYcGmmJDxMsZARxkgraexzUjx/O9cKbN/BH8l0//wkKo?=
 =?us-ascii?Q?V34ejH1DRxe7Abf5x5RGPsOfmXhBbxSd3KwsUEvcQ7yIQwuhpXOT2pR9oOg5?=
 =?us-ascii?Q?nPqrh7TKKYe81/e0nDIy+JUziy6cG+T0/zFjUy1s3RPorx3fWG5BwJkh35IL?=
 =?us-ascii?Q?fTHywJCtEK1AYW/TES98sRRBRCIDR1YXfUX72ligATMTsa9X7GrIjwRxq7GT?=
 =?us-ascii?Q?tXDqAClLWUtn1ETwX+WQVp9rx3AEkNI8gg528/PbISAIHt2lc2BcC1tC4OlN?=
 =?us-ascii?Q?J5TCuA76SSQEmau/An+T2abOVFq0s3uxtvfWnVs+bbQFb/07uzdM43oBBYaQ?=
 =?us-ascii?Q?yUwoj9D3os4zsuSdU6bd01otNW8r9D08imtbVLTNhJCWDzFZCMBa2BwkwxKH?=
 =?us-ascii?Q?RDp1JwTBMnZXiVXnWSLsyG+GeZaiWrStSSVvpDOYqhtvnvHiUv3bsMc2JdQh?=
 =?us-ascii?Q?Hgg3jzKA4qmFv8Q7Itl4Plrx4f5GBkjjusdYcx6K03ZRHd6E+7xNeQuUvmlP?=
 =?us-ascii?Q?ren4rjjJtWzOXQ5Po/Q7S66YJqz+/12KUUBUDFQE6LMcayQV/FsfugWegw7K?=
 =?us-ascii?Q?uF4kQN+O4MxlZSRHAbbss6CVw2p/Cj0SXrmzZjLOwVM9D5K+h23LE8XJz6qQ?=
 =?us-ascii?Q?fFZ8eCd0fYhfGlXjaGJrdKaCC9RebHPxdvz2tsJsVTcT/MdZ1XoRSiIQ4hnn?=
 =?us-ascii?Q?5AKAXloTiiqHnLg1hmMtY5AvwoqDPIsouRfUD4NQd7dsd87AbMqJxb9xFZg3?=
 =?us-ascii?Q?N2n3Sdn/9oy/74JSaSRPwOQSxclhMe/MlyyJePiDSFuZycfLYOgEnPTenTum?=
 =?us-ascii?Q?TjVw2jYUp4pvls1yB8OW5hnWWvM0IOQfGzZ5EpvRgBde0BN6Kus5yAFinWHh?=
 =?us-ascii?Q?Y2Q37pK8mc17SU891OwUmABZX8wPYf00UTLSY33QIZ43rxMWx+BlOewDbAzo?=
 =?us-ascii?Q?dmpfKGdWdEiyMLIVUiG0pN6U7ZVMGhHoT15zhf9vPYEcwP4CcDB7VEODEGjV?=
 =?us-ascii?Q?fW1tp3MLfflwZXivwMLVR4NEzjshmKMMZMeyVVqO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3a56f4-98fa-4609-92bb-08dddf0217bf
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6020.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:23:44.0698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qvg+owIWg95q6zutpnE1ao6dGB53pJ6sVKOcb107zcdeUfv/gERe6rbauMTW1XhL+lqmUM+w1CV/yBUGtStiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5264

The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
remove the useless call to dev_err_probe(), and just return the value instead.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/staging/media/tegra-video/tegra20.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index 7b8f8f810b35..ee65e89c119c 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -255,7 +255,7 @@ static int tegra20_channel_host1x_syncpt_init(struct tegra_vi_channel *chan)
 
 	out_sp = host1x_syncpt_request(&vi->client, HOST1X_SYNCPT_CLIENT_MANAGED);
 	if (!out_sp)
-		return dev_err_probe(vi->dev, -ENOMEM, "failed to request syncpoint\n");
+		return -ENOMEM;
 
 	chan->mw_ack_sp[0] = out_sp;
 
-- 
2.34.1


