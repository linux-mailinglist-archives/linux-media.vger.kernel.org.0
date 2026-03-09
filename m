Return-Path: <linux-media+bounces-54927-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONGNBHuNrmnlFwIAu9opvQ
	(envelope-from <linux-media+bounces-54927-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 10:06:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E70235DFE
	for <lists+linux-media@lfdr.de>; Mon, 09 Mar 2026 10:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F26FB300F52A
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2026 09:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7070374752;
	Mon,  9 Mar 2026 09:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GcSBWqZH"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010019.outbound.protection.outlook.com [52.101.84.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1654B374184;
	Mon,  9 Mar 2026 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773047062; cv=fail; b=pCByZVXB0b7Tj24E8SE/OAdpfMZib0RdxpxpETyNVaK8zqAuS+qqIXssRMzSVphpo+vE6N3gicHNzjmUxhK4J2OAD/RXFdERphrHfmOsqtrf5hq2aXxSTEdsJ2VAMsWy0R68QAEAxrElJRc3gH5Dws5Kg4t2Yr1CKOhLMfNGRvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773047062; c=relaxed/simple;
	bh=VOi8GwlE6wEJkuiwjxWgMTm81yzcOsTKLWuJtoQ2Kl4=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=hf3V2JLvCsgb+DZkY0HHBO3+RgggJunnJ0B/t7T6Phl/vghoPAF8AXesi1qTyeSHTAyJGhMQI0PkOEGvQwlIqPcdHRmMeSGgSFQNONSxWEV0TJxkTTqtKClLWhL6SIL3neT7neXiWNI3rD4tTpgQz0SYNyeYUHTzyR/XgtTb9DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GcSBWqZH; arc=fail smtp.client-ip=52.101.84.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FsV2br7Z3RKUiEZmqfWQMaOwGHMPmFD0k6T9Xwov6/nw5nMQ8T7IpZXSHtR9KkET0vJsVchYgpt2qSBl3iikPE3ngp8zKuOeuTGq5iMEqpzhT6+pxSF8OBgnyDNpt6xXm5nlrigP44dmst0L6HBhrB9TyWQKq7jQ61lj4E02/RdJpG9YjqkpSaDi5dc45rMNaCHx0lA6Kn11k32AIq1OUL64NA1rKL4vhTzblvbkjBQ4bX19jySiLZh59GNPFtqC1NlNTKQyMLgg+97vPykrRhoCUGMhiIKoLFzEC2RHSdovvbWhoBy7rNNCWNl3KTyjxFU66VW1BjRPVNiAAUWvmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z8qGmzUBHOvAl26UuX2PJhjLULW44NQujMQRepQv6q4=;
 b=L7VRIjKmD09xMmPILIIklrdSzU3OGd0lEZJwqEfkx2Irll/+wgmyPzLYDMglAHF/AiQN0d3iOC2DbZOVMyaadtF93qE34vxAZHYcRxdePG5JZJ25h0qtHFcUpgBLTdFCRHLSg0S8iK6JLt7H83wnqbZ71tRTmVFF11ciRnxZk16zCoR5Sf00FYaGBM/NUbSaftmLtMuZPwDYfrIsHt7PZB9cvUW3HW5HUePfv7ckjB5PqvW5pFp9S33z0gOd1I9asPPHy4M2Btp53P1ohr3SYblnjYr+EdKa1J1zwPLtUFkC1yLuoA5Y558vW4FI99DAh/frj8LTdKUfxWofHBVTng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z8qGmzUBHOvAl26UuX2PJhjLULW44NQujMQRepQv6q4=;
 b=GcSBWqZHB2fYfgjq2V9uBwQSjbCWhO+SJjoSSdfE7H17z7PawmdfyD74OiOREP8g2a0/MCpBDALAxbHWwc8kkD7q19Jt3Brw6dZIqY5Li5BURXg4g7IrmfjXhrXY/apMi5vmuuFhNNyDXmg2yk2FdIFgmtKoiLm2ouzIFlde6ASQPrPgrAPXsE7wI8FOhcms7EeFJIqFGdAxMIgEx8CM+nF4wTsCFMdMk6NzcBjmBxB0e/9d6NArixfVXdc+zUxUocXM29rhico0N2M1zCvW/RixtqXlz5mBCi1+QN86mgutTLXQqhp44ZqAiIe3DKn0ZwZWK/ZNaQop1NwnR3l3AQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 09:04:13 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9678.016; Mon, 9 Mar 2026
 09:04:13 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Mon, 09 Mar 2026 17:05:57 +0800
Subject: [PATCH] media: nxp: imx8-isi: Add virtual channel support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-isi_vc-v1-1-fd0b8035d1cd@nxp.com>
X-B4-Tracking: v=1; b=H4sIAHSNrmkC/yWMywqDMBBFf0WyrpCHY6K/UqRMkpmahY+qlYL47
 03r8lzOPYdYaUm0irY4xEJ7WtM0ZlC3QoQexyeVKWYWWupaGtmU2XjsodQOODoFqpIksjwvxOn
 zD927ixd6vbO9XaOYcQt9rrVFzco0qCJUjIZkbXT0jXdoTY2krTQ2AFeAv67HlcowDUPa8jGSN
 uwUAknnybFnIBctNUw+WI3ggbVl0Z3nF3daxzTaAAAA
X-Change-ID: 20260309-isi_vc-285fd815140e
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773047181; l=4946;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=ReyhulE5ApaTAOc+1sZHikSsVp944CVccrPKon5jy08=;
 b=04oxx40m3MUVytO1wzWoZPQ36wDH5x6niQYog/u2vbVWJMNIMXLiXWlkvlfovLRM7W7+4dFoP
 Z0kibwG6GWhCYucd5efVAJNJustnV/3eECV3wemKdpvolayeKzJcyn/
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5PR01CA0193.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::17) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: faab4a1a-54dd-45ff-e150-08de7dbad5b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 iSv3BkyZKzDeNHt71bW669KzVkuOuQJ2QXs+glqSEFSg2C4yZhZNIW18ExCUKyg4feV8dqcBvEHRJ2P1PCNo0mg+Z6TiGQbdS92jHgKHmKteo+nld15pIvdf857QqHRhO3CH/zSqJFRc14v493UkKMt/bRq5pKvmJEoTjs/xYSGCHBjCdHNm0t8LsvwvUFMgRK3iqZGGjsAojsXSVxtwa4bdgNy1Ueg9/VPuPwu+ZSI5rzKhxlkmOVlRQ0c2Oo8swn1VUzROBkz6gFIR+3mvd/g2XNqK0mkHLlN/z1d29079dRuJoTq6o9ZTNzLWmXcbyPxF3lssQC3D3g4KL6cvL9VqAAfLyppSv7kNyhHDHbg4NYc1ahGK5R2o2PzZ8N+4ObNXj8iY0B+K2vLoQu7yf8waWKVSKZIjGxuaiX/6iY9s8ATpCCvB/wWD5INjm0yCbibWZzRFufPMOsZhcAD6MFqKHz6JjIDhldUVY6r9qNlDrhDDJqmqwdgVd8Xg8IxSQmw67dO6HQ/fLSdUg0swVJ8g6x7VfNP+6MEtvYSyFXnSgtsx5Sv1RJfpGPL6khJnA2FebvYyf9oott6GTBvMXVlxIbm0j1G0Q6oRYgWlfm+tZjUOW3E1srFUcQGuB+07BavV43ainuwqNkCc5FCg2zyufcFH5xy6zTJOO214gUimm4nupdv0puErlh+3vs294mjPcsu1Tl5ZkbEa90Xp02aEWIttmOkGXPrsNCyYXoc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eitPOTdXSEV2VnJQY2dzVVY0VlFRU1VVVnZLQ25pMS9DNUl3Q0hRNjcwRFoz?=
 =?utf-8?B?S2xvWVRWS1Y1SGN2b2kxMkhsaWdTb0hWL0phM0k5TWRKSlZFRDhweU9RMFZ5?=
 =?utf-8?B?N1N4ZE9ZVExDS0ZQYUZFRnppUFA2Qk5VTTBZeUlJY2gwTHczOWFRbTBFTHlH?=
 =?utf-8?B?TFNEdm0vWTBzNUdmbWpsQzFGT0xzLzJ1ZEtKbWVrTjRCTVQzcnp0czhYaFFY?=
 =?utf-8?B?YlhtZFlkakp3aWx3cER1UTNkb0lyT3NvVUk3ZkdNYitwNk9UVjRyNlJKRWlE?=
 =?utf-8?B?TlFvTDQ4OVRxcjNlc1hXOGJqeGh1Wkw1dlh4YnJmUXdnYjROZXFwM1AraEJn?=
 =?utf-8?B?WlZXU3pjU3JoMnE5aHZQZGFIL25oVjRXaEowZllYWUZUMyszR0lXc01xS1Ba?=
 =?utf-8?B?dXJEWG5KT28xaURNVUFjL05yd28ydGwrWHBod3VFVldyck16VmF1cnl4VnpR?=
 =?utf-8?B?TkU4R0hFL1p1bXZrQWNJcldib2dMOUJ1QVZZNFd4aGhIRXlWc2EzWENHdUxY?=
 =?utf-8?B?ZlZNWHRnTkdzdVpiVkl1ZE9YNitZTXhkM2dLTWFOK0t3L0l4UnZUY0Z1eC9p?=
 =?utf-8?B?WHJ4L2g3MFB5Z0pmbm82TGc0YndrZVVQUVU0TlF6TWxpQTN5WmN2YjY2djdC?=
 =?utf-8?B?Mkp1cVBpVEkvODU4YTBiU2VkbFZmcDRoNUg5RnRKcVV3VE9tMGxUQzBwVDJw?=
 =?utf-8?B?ZHo3SGhlTkt2RndGOTNsQi9XUkRCYU9CUW1iWFBLdkNEQmw2blo0MDdaVE50?=
 =?utf-8?B?UlY3TW1xZGhDZ3p5LzZ2NUJESzN1VzBKTlZTUlFKV0JSMk5ZOHBUazM5U1Qw?=
 =?utf-8?B?ZDdFK0NSZ0Y0QUo5VzI4OEp2MUZiR3M1V0s5K0t3RnNVTE4rUFJ1ZEYrajdI?=
 =?utf-8?B?SnZ1YXpuSXp1UVczK29rMVZyeVFBRi9yVFFrQmJIWUo5dWE5OFVhcTU1QVZC?=
 =?utf-8?B?MVd4NVZrdUdVYzZMTEZEeTdjMXVLNktwSkRabWZGaVM3dUFFQ1BZYVJKY01j?=
 =?utf-8?B?STAzSTRoYmtpNGVRMEZFMU9RVFAwRWo5amQ3Tjg1SjRRRENPM3F3WXZpSWdz?=
 =?utf-8?B?M0ptcEVVV1B6UDR2Wm1NNFBlSlVVOWtXdmt4bkFQeVM4ODNTTU9zR2hSTm4v?=
 =?utf-8?B?WE5uWTVxdGFIRElJRklOSDVZc0U5aXVBSEh5TVIvbElzOVFDNkNmdHhpSmM5?=
 =?utf-8?B?QUNDY0ZwN0lZZkFHZkdpRXp1b29rQW9tZ0dITHFHcmI0ZDRwU2R2dFVmVVZ5?=
 =?utf-8?B?WmxoUGMzcERaVm9lVkhTQmlxTWNnWERDVmF5Zjd4Zis0Y3gxQmcrdjdJU2RZ?=
 =?utf-8?B?cXJzdExPWXduUzdvMVBoM1RMOXNDZ2FaUVV2S3pXWlc2UzJSNU1XZG9qN3RJ?=
 =?utf-8?B?VklVTVFSampxb3hLVHlZZmdoNzNSaHVJQUpuYklmb2xRQXdTenAvVTVzcWR0?=
 =?utf-8?B?ZlNtaUo4TENtZElWbGtNRkJwNWQ4akdjQWR2UWZacVNEclFQYTAxZEJIYTF5?=
 =?utf-8?B?bStwbFVnZ3dFUGZNNlN2TTc3S3dkckcyMnJ6UEVLbkd3cldlVDBRVzY5VW8z?=
 =?utf-8?B?eTNqMzBaaXc2YUdIWUpvQmRxUTY1OUlmNGJDTCs4anB2U1p3YzZSeExJcm95?=
 =?utf-8?B?ZFRlLzlQOHpIZkpMUnp1S1QwajJibGlvNGZJd3FBRnF6dVR6c0l5TGZGL3do?=
 =?utf-8?B?RzhqM2E5ZGdFODREWFpZNkczSWF5eG1Ddm5BNnZUNGJ5M0EvTHVMTWtYUUY4?=
 =?utf-8?B?UnZCWFhGY1NZSStTWmJxeURLY2QyRmJTM0FnMHRmUEZwS01sLzhTQVZFdm5E?=
 =?utf-8?B?UU94V0NYV0k3NDdwT1cvdGhiRWFUWXM3aUkyMnM2VjV2ZEt6SmtQMFc0RWFH?=
 =?utf-8?B?UWhtVEZRTUhGSlorSC8xNjNKK3hzeFhxQ2pqQlNzcHRXTkZhSmJHdmJTcTVH?=
 =?utf-8?B?aGhIRVZnV0xsdmlPMUZuQ3ZTdzJrWnBPS1Z1TThNTFNJaWI0N0ZtbVR6QVRV?=
 =?utf-8?B?TThvSXlmRzF3SEV1UlYvZmJHazZUTGZaU2d5K1M0UG16djNjTnVaa1J5Yk1x?=
 =?utf-8?B?aVRzOGZBZlVXNFd4dXo3azVBYmt6dGs0cGUyWFBnOHNOWlRiMGh5azFWK0Qv?=
 =?utf-8?B?WFd5WG1iNFZhaUJoSkdJRGdNUU5JWDV4N0h6dGtGNGJKMW4yVHZZeUNPTkUv?=
 =?utf-8?B?WDgwRGN1SnpyUFdBdlZBSFc2YWxjcDJ4MGczKzF1TlBlOFIvUGppZWNoaXNN?=
 =?utf-8?B?a2IzT1EzZ0xPVmlsR0tUVWJtVUp1b1IrdGlLNzNBZkhNNURTOWY1R25mZHJa?=
 =?utf-8?B?ak05cTUxTDBOREExTXF6SDVrVjNOWEJKTXJPdk40OWp1eW1NK1poUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faab4a1a-54dd-45ff-e150-08de7dbad5b7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 09:04:13.7902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gzi11IwZm8guS6SVNEb6b6UncdXBQUmiGntiw9EZEFETRmiukIc1Ml89ndlXUm+9R0WxBaCv8UNtBEx6yEw7BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548
X-Rspamd-Queue-Id: 66E70235DFE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.44 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54927-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.945];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add virtual channel support for ISI.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v1:
- Depends on https://lore.kernel.org/linux-media/20251105-isi_imx95-v3-2-3987533cca1c@nxp.com/
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  3 ++
 drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c  |  4 +-
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 43 ++++++++++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-regs.h    |  5 +--
 4 files changed, 51 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 3cbd35305af0f8026c4f76b5eb5d0864f8e36dc3..11a5e395792f11752c44d73818c825f2f175aa1d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -256,6 +256,9 @@ struct mxc_isi_pipe {
 	u8				acquired_res;
 	u8				chained_res;
 	bool				chained;
+
+	/* Virtual channel ID for the ISI channel */
+	u8				vc;
 };
 
 struct mxc_isi_m2m {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
index 0187d4ab97e8e28fca9013f6864a094e08f2c570..4d830fc1f913a825a29232739813f7e6d38018b7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
@@ -338,7 +338,9 @@ static void mxc_isi_channel_set_control(struct mxc_isi_pipe *pipe,
 	} else {
 		val |= CHNL_CTRL_SRC_TYPE(CHNL_CTRL_SRC_TYPE_DEVICE);
 		val |= CHNL_CTRL_SRC_INPUT(input);
-		val |= CHNL_CTRL_MIPI_VC_ID(0); /* FIXME: For CSI-2 only */
+		val |= CHNL_CTRL_MIPI_VC_ID(pipe->vc);
+		/* Platform like i.MX95, ISI support 8 virtual channels */
+		val |= CHNL_CTRL_VC_ID_1(pipe->vc >> 2);
 	}
 
 	mxc_isi_write(pipe, CHNL_CTRL, val);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index a41c51dd9ce0f2eeb779e9aa2461593b0d635f41..cc4348ea6006ee19243aae3abceb235d00beea4d 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -232,6 +232,45 @@ static inline struct mxc_isi_pipe *to_isi_pipe(struct v4l2_subdev *sd)
 	return container_of(sd, struct mxc_isi_pipe, sd);
 }
 
+static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
+{
+	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
+	struct device *dev = pipe->isi->dev;
+	struct v4l2_mbus_frame_desc source_fd;
+	struct v4l2_mbus_frame_desc_entry *entry = NULL;
+	unsigned int i;
+	int ret;
+
+	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
+			       xbar->num_sinks + pipe->id, &source_fd);
+	if (ret < 0) {
+		dev_err(dev, "Failed to get source frame desc from pad %u\n",
+			xbar->num_sinks + pipe->id);
+		return ret;
+	}
+
+	for (i = 0; i < source_fd.num_entries; i++) {
+		if (source_fd.entry[i].stream == 0) {
+			entry = &source_fd.entry[i];
+			break;
+		}
+	}
+
+	if (!entry) {
+		dev_err(dev, "Failed to find stream from source frame desc\n");
+		return -EPIPE;
+	}
+
+	if (entry->bus.csi2.vc >= pipe->isi->pdata->num_channels) {
+		dev_err(dev, "Virtual channel(%d) out of range\n",
+			entry->bus.csi2.vc);
+		return -EINVAL;
+	}
+
+	pipe->vc = entry->bus.csi2.vc;
+	return 0;
+}
+
 int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 {
 	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
@@ -280,6 +319,10 @@ int mxc_isi_pipe_enable(struct mxc_isi_pipe *pipe)
 
 	v4l2_subdev_unlock_state(state);
 
+	ret = mxc_isi_get_vc(pipe);
+	if (ret)
+		return ret;
+
 	/* Configure the ISI channel. */
 	mxc_isi_channel_config(pipe, input, &in_size, &scale, &crop,
 			       sink_info->encoding, src_info->encoding);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
index 1b65eccdf0da4bbc3a77c91e06fccc35d6c7e022..b2bcebc254b223b1085fe5bc2cc252eb7e272e1b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-regs.h
@@ -19,9 +19,8 @@
 #define CHNL_CTRL_CHAIN_BUF_NO_CHAIN				0
 #define CHNL_CTRL_CHAIN_BUF_2_CHAIN				1
 #define CHNL_CTRL_SW_RST					BIT(24)
-#define CHNL_CTRL_BLANK_PXL(n)					((n) << 16)
-#define CHNL_CTRL_BLANK_PXL_MASK				GENMASK(23, 16)
-#define CHNL_CTRL_MIPI_VC_ID(n)					((n) << 6)
+#define CHNL_CTRL_VC_ID_1(n)					FIELD_PREP(BIT(16), (n))
+#define CHNL_CTRL_MIPI_VC_ID(n)					FIELD_PREP(GENMASK(7, 6), (n))
 #define CHNL_CTRL_MIPI_VC_ID_MASK				GENMASK(7, 6)
 #define CHNL_CTRL_SRC_TYPE(n)					((n) << 4)
 #define CHNL_CTRL_SRC_TYPE_MASK					BIT(4)

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260309-isi_vc-285fd815140e
prerequisite-patch-id: 6f139a1d54fa3e0632db9b8a736ae27037c5f45a

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


