Return-Path: <linux-media+bounces-48954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0E4CC6300
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 07:12:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2080D3093FBE
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 06:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C8CC2D77E5;
	Wed, 17 Dec 2025 06:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vd7XPqCt"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029F52D592D;
	Wed, 17 Dec 2025 06:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765951838; cv=fail; b=rS/J9Jotph6HMvUOGZwj0zjznHHeRh8K+f4xPqvkMhW5/PoBydTM9HFxQSGj4ucz+KIrpjcwOorR+UkJ+32VKZMjXdhR012yYeHmoVg/mjEaJPiKnLXd27f/70WNMyptDPaKWLSMhV6DSCK+teuSbTVzx6LzJUy9lvuXK4KBp1Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765951838; c=relaxed/simple;
	bh=jbMvb6LMJAvjufUMO43i/V/ePVBUZS3d+Jh4+/XYyZ8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=kFlMbtEmuXKOCTemqbLW5fbAKFzHlTJAUGaYc+d2+Vff33O3YsGBevgLjTutd/aP5t4Kn6EgS3+drRQQY1xMIMxndAyLuWdNWHE3W1OmtWqtMKsr7Q6GXH3jI3/QcVLsN2OKGaXGHFg6b8HdFoKkt/Vns3j2RUMeDvDlCpU/jlM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vd7XPqCt; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9aBwS2cqsGl0kRjk5O8pWXUBT0cZwfKw5HVrCeSKyUCyVORA1F45l+AhpH9yLwEVTbavPHFtXGowSFRBgnodCtX88yQJJdFfWR9ESS8lLStMqp+7l20lc1ODmKNv+kp81402hUDv51FnGosO//ocPaBirRgo1LXV0ylGq8kcXK4q9r5fYokSQjIzoo+LrkU7IkSWmqIIxyv+Is+V2wHxsop84sEuY9Pgq19+wINda2O5toAjhe4eGGEhiSUazExbxnbOI7bBTEXV5Oge7Z4mhpyhmtlB1jIBTcD1CVUlXzY5IBN1XoNjJrQAc/iffR1f/BlOD3kpKRSX4eVpFfDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2NFNtYvwEFbMinJaFniB17O04ki9i1klFf/qacU+cY=;
 b=EIHQ2QoZ+jCJE+QBVZvTUM+BmWhfs598krVoAEOFVIPcFqkZw6zXVNHTWhJcjZbES5sWoywKTqWCDicMuex/Nc87nle/iwKsFClCPRrat4zXXGiRhVScfjI7PxPObyfuItvvgYUitcXlQAzYVmLSL0LUC/9weLKVeq31KVBo4XqYhn9OzEP/ZyfcytoQq/ukY4PlaQXW+FpKGeTaAJikoAfDteN93k0yej8g4b34AmuxfqsnAY7v/ZeiqHiIgi+FoqLSkR5zSFCc10cIvga6AbT41wmcPrkgKCRaGJgVEVY8piD38uJGa2WjWqDzl6oZM6vbUCHfN+2ZXObkBOcW6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2NFNtYvwEFbMinJaFniB17O04ki9i1klFf/qacU+cY=;
 b=vd7XPqCtzFfv5pDcZhW5ounFMjrK2UGAXcfTLI1rICxjFpQ7rafM40faAhZTNu/apua0dMuG1qYh3jcBOLcKoN256Mo0xrccCi28ebx9FHszieu2lCRh8meZ5wGTfQNw3mw6CPqz8rqVLgsH9GQOGzhFwhxw/XHnyuOInFJenDecPG3AF9fZa7km7f7ubZmjDYCro+Jr4c4tEVCbmFIaQhOBjOWf8eQ/7Oripr4davued3+egot5SOe2keki0n0+jWC0EPqS8ESa2sELp3M6MTGetaK+gurnAfyKP9iyVbytXCQqJ1xcqkeJyKmjMSB8X5IpIeNJTQCbPjgS5fF6eA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB10252.eurprd04.prod.outlook.com (2603:10a6:150:1ae::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Wed, 17 Dec
 2025 06:10:31 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 06:10:31 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v2 0/2] media: nxp: Add CSI Pixel Formatter support
Date: Wed, 17 Dec 2025 14:11:24 +0800
Message-Id: <20251217-csi_formatter-v2-0-62168af80210@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIxJQmkC/13MQQqDMBCF4avIrJuSiZpiV96jSNFkrLPQSBKCR
 bx7U7vr8n/wvh0CeaYA92IHT4kDuyWHuhRgpn55kWCbG5RUNaKqhQn8HJ2f+xjJC9JWNSVqa0h
 D/qyeRt5O79HlnjhE598nn/C7/iQlyz8poZCChoYQq9tQNdQu23o1bobuOI4POVW3IKgAAAA=
X-Change-ID: 20251125-csi_formatter-e6d29316dce6
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765951909; l=5200;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=jbMvb6LMJAvjufUMO43i/V/ePVBUZS3d+Jh4+/XYyZ8=;
 b=y8K8gj9gGoTnKek2jmgdHjZh2KTaqA7PJvYhV1kebjee3Iv8+Gbr83Hkj7GKx7/b4b48qeYMb
 Cabo7/RnE0iAXBlP+OLvKMKwTFlAokiaolYgRPaEwZIxmkUM8/rL4lw
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR04CA0012.apcprd04.prod.outlook.com
 (2603:1096:4:197::14) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV1PR04MB10252:EE_
X-MS-Office365-Filtering-Correlation-Id: b111bda9-2895-4cc4-e288-08de3d32fb47
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Z3hVL2w5M1kzdXh5V1BoTU1tb3Erc3lIYkdWajA0UDduTWlmNHF1d1NVQ0pM?=
 =?utf-8?B?S1ZNQ2V2Z2lSSy9rSGVTTTNYcU42dnBlYmdSem1ydGNQZjFCTTJobDZzQUxH?=
 =?utf-8?B?WHJwbE5BTmtSSjRVSnhqc0dmQ0htNUpOeE1IOGNGaEluWWY0ZkNLTzdSRnJv?=
 =?utf-8?B?YVBNODJpYXFHVHplSkNHSzgxQWNCMUxhcm5KUEhobDBVeXlsZktCQ2N3S3pi?=
 =?utf-8?B?RjJQUktXbHNTaVZ2SmVrZ01iSjJ1VkMvMmQvb0YwZGxuZ0tqWm1yOGpmSnpZ?=
 =?utf-8?B?cWFuT1FSKytJVXY4VTFHWFNiN3NSZm1YMFg4YUVoWFZiQzBwTzFUaDlGR3pN?=
 =?utf-8?B?Tm9KVW1UUWY5c3dUaDJqazc0b3NHNFdFckE1REc2eG1XVUJwNy9rMTBRcmlY?=
 =?utf-8?B?SGV4UkFoSkY4ZGprNGpaUW42cTNuZVFxNGJ2SVdEY3ltOGVSU2d4VGZSZWd0?=
 =?utf-8?B?c002Sk9vdVNldHc4emx5NUZIVCtsd2liRmdPZHJpeFpGL2hpVGdCaFF0Qmdp?=
 =?utf-8?B?VW5qVkt6MGVaL3pheE0vWWl3RXNIYmp4Wkh0cGEwQVN2bkhzK2VYQnNlRmRV?=
 =?utf-8?B?ZVlGS21GU0xOVEdzNkIrcklxazRCazhaMjNtZTFWMXh4bkNwem5oT1NTOE1X?=
 =?utf-8?B?YWtKUWJ3TWkwTU9WRGpDU2xGdWhKY0Z5eFRWNis0UHJZVEkvTjlVcDA2aEph?=
 =?utf-8?B?L0lIOW8wQ1Y3VlFOTk5EM2Z4MFl6TmttMW84NWFQMi9seFVkMW9tdTZtdUtm?=
 =?utf-8?B?TUxsc3JLQWxvTDJCUkJXVklPTHp0eStDYUxIQUsxa2puYlYwRytDOEw3NHBY?=
 =?utf-8?B?L1Y0cEd6NnVscnFkZ3FmRlk3eFBoUS9EdjcydGNNdGxGUWxlUmZST3VJT0Zt?=
 =?utf-8?B?V1FpUlJVMXgwSGN0bGkrQTJpOGxNZHc4V1FRZG0xM2tzTVZESk4xSEpkVGpo?=
 =?utf-8?B?MStEd3V4UDQxcVdvNEZsN042S1ZWb1dpdFc5b2JOdjh1UnNlTlk0VmxHWG5Z?=
 =?utf-8?B?LzkyTjg0TjBraFhCRzRGTXFZM2xqaXptZG9YZ0pJby9VbHVTb2dvRFhuS2tK?=
 =?utf-8?B?MmlXUkVaVTRWUVpGQUxTTFBFN211RDJacTdCM0phY0l1dmVSNFQ3ZUVoNFU3?=
 =?utf-8?B?Ti9lalh2bUdFN09VTTBqem5xQkovVkc4V3lsR1ZkRkhYZjhlYlM4MVByWjVk?=
 =?utf-8?B?QWNkdHhEZWJFbHhQT0ZmMDVMbXlZMzA5QTA3dFRoVnQ4c0ZmS1EwZ3FQTXR4?=
 =?utf-8?B?b1dwUUVUVHpBZjN6dkNQTnp2MHNpQXF5dVRDNDFSeDNrQzhHNUVwdHVPRXJr?=
 =?utf-8?B?UW9ZN0J6dnVsYjFMQzhiZjMrQkZiVHlqOVlsK2Z2TFE0NU1zRWZKWXZkS0VY?=
 =?utf-8?B?bEUxeTV0U0x0Y29GVmgwbWxoTllEU0J0djBvbFA0L3dLaUVYSWdmVURSQlFa?=
 =?utf-8?B?UUZwaU8xNTlnOE5mNEdNWFJ1cVpiU1BHUGlhUVNXYWtydytxckdzbmVUZXY4?=
 =?utf-8?B?ZU14aWhJU1IvNDFMbzBJVWRHcU5jWGhlQmlsdkNBcWZIdnNua2pVSStrVEdU?=
 =?utf-8?B?ZEJtT09OT1FWT0VWWFBhU2VPbHYzOXB1c1BNajdsRjZEMkJYckJrc2JRcUdj?=
 =?utf-8?B?Rlk1aU1tVEpLMFFaUjI0cE1lYkRGQ3RGcFE1YmVhajljbUF4UUFYQk42a2No?=
 =?utf-8?B?NTAzVU9ESVM4ODl6SUtVS1RZZmdxaGp3MzhtNVJvckZ1SDEwRWIyQnlKZXdl?=
 =?utf-8?B?TmM5SmF5a1JTRWRpbW9UdmdCeVI1aStGdDNsWVBNTmFsbEg5bUN6dSt4N1ZB?=
 =?utf-8?B?SkI4UmRwaDZUN3Z6VzZUNkMyR2FvTVJjTXljYmZKNUo0NmVkYWR2UnAwRUJF?=
 =?utf-8?B?WkI1aW5IZElGNXpQdjRjTzBGUEVEVXVRQUlEQzBkOGRoMXAvN2x0bkNUOVlL?=
 =?utf-8?B?dGN6eVVJemNKcVpNdEJLTEpBV3o2ZmNZV0p4N3dBUmV0SlYyOThaMjB3a3U1?=
 =?utf-8?B?bnhHdFU1V2lKSlBBV3FsK1NzZWNrbEw2T2tzclZiVFkxbFJCL3RLeWpPaFh5?=
 =?utf-8?B?eXdmekk0ZndZYUJ4VmFkZVNOeHVCZ1hkZlVpUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aGxGRnZWVE91dUNwbXJPazZWSFBaNWpEdENUU0taK0tWS3dxa1QzVVBhMEND?=
 =?utf-8?B?a1o3VHg0bnQ2cVQ5bjdYc3NocEVONGp0UUNVd2RBdnJKMDZ2Si8wZWdZOXdC?=
 =?utf-8?B?QVRtT24wemxtaTlPUjhBK2NjVFhtemVuVlBuVi9RVWdiM2dOVWFSc1BHbGJK?=
 =?utf-8?B?NDlLaU41WmY1bXhFTmpVNDM4N2Vma0JTaXYrOVdNcnF5SkdERkFjbDlBdXl1?=
 =?utf-8?B?Ymc5c1lLRllXSjJRTk9Hd0FSVzRqQ2VaWGppVHU1K3Q2YlkvdTdIazNQYWdK?=
 =?utf-8?B?UGdkNDF0cFlrc1JKY2JoUWRVWitsa044WGp6QTgzRkt6NzJxZHEwVHNUMDVK?=
 =?utf-8?B?aWM4TUEyT3JNdFFwNjJYM0VWZ212cjZoL29wajNvUUE2cWRLT2gvSnNQU2wy?=
 =?utf-8?B?OXJpazQ5RFR5K0JmazRXcXp0ZGVESGtkMGxZVld5bWV5V09NaVBESy9uUGFr?=
 =?utf-8?B?NkdwR3FjbThKNHBNTXB3OGsrTlZCZUhjVDhMaHcvZ0pmK3ZmVnVrOGRLNnRU?=
 =?utf-8?B?cHdIUnorcFh1UVZUaFBjck5OWDExWHhXbjR0c0MyeC9zZ0FOdEF2VkRzQUd0?=
 =?utf-8?B?NThGS3hYNzZXelFtTForNk9nREFIUUpUNklpS3JlTTZaci9HWjEzeldUUVNP?=
 =?utf-8?B?dFRTMTh4RzJma3hqdmxnRVdYMFZjWFRJMFhmMmVKOEk2WWw4ODBlblZKa1dq?=
 =?utf-8?B?QVE2L05jTFgrQUVSZStmUnpEWjg4Z0Nlc2hBd1VkY2c5a1BiRlVGNmJWanA4?=
 =?utf-8?B?LzRVaGdEelRtazMzZTFTcGc1NWFPZVNhTVAzZ05HOTF4bVlGSXZ2bGhLd09n?=
 =?utf-8?B?Wk4vZTVmNXhLM08xMDhZRzVzcDlRdkZUTVN5ZVZreTlTbnJYNSs2UHpHNklV?=
 =?utf-8?B?SFNjTC9Lam5WQk9GZm9RRmk3S2dHK0xURDZVQVdPdHJpS3lNT2dnc1dNOTJJ?=
 =?utf-8?B?akhVRGlBNmtnMWZaTEpEMEZiYWovV0tpWHpMUzVZekM0Y2Z3bWU4eTVzMTBN?=
 =?utf-8?B?dHQ3bkI1WDV3dXNiRFJpT2FDY0dzVVhTTmdzN203T0VnWUhvYktJdXBORW5T?=
 =?utf-8?B?QzJmWURUZDRUZnE4K2dmaTlJOTg0VjFkaTU5dUszRXp6bWhuWlhheU4xY0p4?=
 =?utf-8?B?bmllYWltOXRlNmlDUzJTcmM2OXc3TEdVVEs1U21xWjRadjJGNXlITENreXVo?=
 =?utf-8?B?dS92cVFzbGEyYVF6dHBQTloyZ09vVWV2ajdnaFhlVGJxUDdaQjlxMTVJZjFB?=
 =?utf-8?B?UkJiNFNOSFFEUFRrMjlQWm9maXF4eVJsSTQxWXJFbEhsRjZOK2NzRXZUdnR2?=
 =?utf-8?B?Y0JzWm1zQitOMUcrU3NOeVhSVlRDVVkrdXhqMnVCVXhoWHBrSmo3YWFtUkc2?=
 =?utf-8?B?MVRYak1PN204RGU5SzJGMDdMNVowcVBJcXJMeC9MQ2tseXpaYVFKN0l5TTdR?=
 =?utf-8?B?TVpJdVVSMnRNREkxRXE5MUJMaUNra3dKcCtvelJIcTJ1Vk53V21Xd1lrMitQ?=
 =?utf-8?B?UzdNdXVIbFdya291ZllBdXRaV0dpMXZyaGwraWxJMHpkYVA3eFFNQ2JMcytU?=
 =?utf-8?B?WS93c0dCVjhEbUQ4YVd4NENBQ20yTFdkWTY2SnZTUTgyK05icVJPOXpyMVpQ?=
 =?utf-8?B?WHNiY1V0cjlHNFAySG5TTmZNRTlnR3RXZ2dWQVN4TzZ5eW5RcFV3Ym9wWWVt?=
 =?utf-8?B?UEwxVDZaY0ZjMlBMb3drRHdkT1ZGTHZYcThOMzZ6bWVsRVpWc0ZSMFA2WFpE?=
 =?utf-8?B?SnJRZG0va0pVTEJkL3RsK0dWZmVieVF3cmRnbHJFdFkwd2dzOG9qVnROSGho?=
 =?utf-8?B?Q0xVSjdJb0pvcjJudHd2ZlNDSUpmWGZENjJVR01KbEVIS2J6TG5ycVNZbldJ?=
 =?utf-8?B?NHRtK1NsUkd2cjFVMHJiY2RXY3B2enp2NVF6UW9JUVcvUE03bXBFemd0ZGNZ?=
 =?utf-8?B?ckhtQVVMYThvSXYxOWV0MUZqUUdmdDFqZGsweGloRStEU3AxS25UK3VPNHRD?=
 =?utf-8?B?djhUWkFnN1dxbTNjOWdQbkh6TjVmUEVCV01MY1V3NXNUZTdBbVdVRjhNUzBI?=
 =?utf-8?B?WnJFU3JkaUVubUg2RXBqVlc2N3dHRTJJN2dRR3A2R25kaHozeFR3eFVmeFkr?=
 =?utf-8?Q?NIILMf6hwaWnCRlR6va6m49o+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b111bda9-2895-4cc4-e288-08de3d32fb47
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 06:10:31.0812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqEws96DU1deEJaVHsWnCIuFUrjcFa9/XCCKnbxqpUZyysLfj+Ivm4rS0KRiG37hp5G7LAU/wBRwjwD/Tn6cIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10252

CSI Pixel Formatter is a module found on i.MX95. It could unpack the
pixels received by the formatter and reformat them to meet the pixel
link format requirement.

This patch series adds a new v4l2 driver for CSI Pixel Formatter.

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t
v4l2-compliance SHA: fc15e229d9d3 2024-07-23 19:22:15

Compliance test for device /dev/v4l-subdev9:

Driver Info:
	Driver version   : 6.18.0
	Capabilities     : 0x00000002
		Streams Support
	Client Capabilities: 0x0000000000000003
streams interval-uses-which
Required ioctls:
	test VIDIOC_SUDBEV_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/v4l-subdev9 open: OK
	test VIDIOC_SUBDEV_QUERYCAP: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device routing ioctls:
	test Try VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK
	test Active VIDIOC_SUBDEV_G_ROUTING/VIDIOC_SUBDEV_S_ROUTING: OK

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
	test VIDIOC_QUERYCTRL: OK (Not Supported)
	test VIDIOC_G/S_CTRL: OK (Not Supported)
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 0 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK (Not Supported)
	test VIDIOC_TRY_FMT: OK (Not Supported)
	test VIDIOC_S_FMT: OK (Not Supported)
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK (Not Supported)
	test Composing: OK (Not Supported)
	test Scaling: OK (Not Supported)

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
	test CREATE_BUFS maximum buffers: OK
	test VIDIOC_REMOVE_BUFS: OK
	test VIDIOC_EXPBUF: OK (Not Supported)
	test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev9: 47, Succeeded: 47, Failed: 0, Warnings: 0

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Delete "|" for description key. 
- Add empty line between child node and property.
- Delete labels for endpoint of child nodes.
  [PATCH 1/2] media: dt-bindings: Add CSI Pixel Formatter DT bindings

- Update commit message.
- Use the value defined by bellow macros directly since they are used only once.
  #define CSI_FORMATTER_DEF_MBUS_CODE	MEDIA_BUS_FMT_UYVY8_1X16
  #define CSI_FORMATTER_DEF_PIX_WIDTH	1920U
  #define CSI_FORMATTER_DEF_PIX_HEIGHT	1080U
  #define CSI_FORMATTER_MAX_PIX_WIDTH	0xffff
  #define CSI_FORMATTER_MAX_PIX_HEIGHT	0xffff
- Use macro pm_ptr() to fix build warning when CONFIG_PM is disabled. 
- Finish route loop by break statement, instead of goto.
- Return dev_err_probe() when meet errors in probe() function instead of dev_err().
- Remove MODULE_ALIAS().
- Refine .enable(.dsable)_stream callback implementation, include bellow changes:
  Add stream checking.
  Fix potential pm runtime count unbalance issue.
  Add stop stream error handling when enabling remote subdev stream.
- Use __free(fwnode_handle) to drop reference to a device node automatically.
  [PATCH 2/2] media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

- Link to v1: https://lore.kernel.org/r/20251203-csi_formatter-v1-0-eb9e1147b49e@nxp.com

---
Guoniu Zhou (2):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      media: nxp: Add i.MX9 CSI pixel formatter v4l2 driver

 .../bindings/media/nxp,imx9-csi-formatter.yaml     |  98 +++
 MAINTAINERS                                        |   8 +
 drivers/media/platform/nxp/Kconfig                 |  14 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx9-csi-formatter.c    | 881 +++++++++++++++++++++
 5 files changed, 1002 insertions(+)
---
base-commit: 1f2353f5a1af995efbf7bea44341aa0d03460b28
change-id: 20251125-csi_formatter-e6d29316dce6

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


