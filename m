Return-Path: <linux-media+bounces-42651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 669A8B7F4D2
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 15:30:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 044D83A8FCC
	for <lists+linux-media@lfdr.de>; Wed, 17 Sep 2025 08:16:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F97309DAB;
	Wed, 17 Sep 2025 08:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DxMp7S+q"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90F73093AE;
	Wed, 17 Sep 2025 08:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758096951; cv=fail; b=u0EPiQSazQgPAJ5DXQzM5k9czeq01t2dr7o5YLzr28nDKqjQPqFI/lMwQA1eiMWqfz/ElcQwqXdHzefovpxdn+MOE+5/GkM/l5aYzCYb7vj+k3nwe9mh3QnQ2Fyd3xW/CyO9qYwSvOw/fkM9flgLmceZT69W+n7BkQYeGcuqpJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758096951; c=relaxed/simple;
	bh=CjBiz/zhGKKntbWFqQRieciCL7eIWeMWa6L+hEKNnMA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=D0dbY6wt/fvVGLAy5UuDntDigXwQO9XC7AlhcsZeUvVvsL8ramxAE+qvIgUpNHtQOt5vX0GjbC31VCGrwrA9dzLQ6u4uhfRb8/GuOTnNkI80l8KWCTEDChVuqHYbpc7Lg6ddbbg0nimKlbTeWqIdzRVtwG/YQbnm4KKVYhBPe4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DxMp7S+q; arc=fail smtp.client-ip=52.101.69.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eH2Oti7K5bwEmkHIjX+CaBIk33FsqkcpwAEEOnnN2pRhQXloCJglFmBa8jETwLABravnpaOX4MDRyoX4OB5IceqiEHiESTsmlqFVifF9LYgNWO8WLUKqDcxoux2OUpo+6FUbGfg+F6LdDzmzN+35jXipYYLHDMOGSJXoqfdtjH0w1sR5l0BgzumJKPavCkfRdmq8tcOO+15geb6ERrK6XcV5+73Z8CGW2WPnSy3j00/hXIcqq2Mpu/gnX8J8vEh3pRLZknewkouabM23D2l26qSSQuw4YpJIdqvzlO1G8xCRAObH0HqsWyBrS6Y1W4y5+uvX4Y+kKAxROvTAdoW44Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM4b3TZ450YnhI9AeyN3z8OkV5WFCe3oO+jDmpZcc1U=;
 b=B/UVnsZsNGIV/h5i7c3n3CcyZzAmlfEWKDys8ynpMlvpVrrbakFDswQsKcMg4TubmXSU95BKooLvXzvizVQNl6+dJ5c3DCmyr/Zm2Ds2eN7JulJk/51jXdBiDdIEteDKHJz0Ijf5pwcc1+lK9dr3gRoBPNITo5WhZpkQHVdvriHr6jyj5oUFXY8WyADeyuJgqYiK57D4KXEccPelm9XscnGlS35G0DsG3sC/acA65PVcd+ZPGAW9WV4rUw6KY1DeT2xKdq+JhgXr75/HCIUtw+urQ0vXjcR0NaR3QoioxpkCkbbEt8azJvYlSQBfbMh3+hDulMg73381jYOF+/CQyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM4b3TZ450YnhI9AeyN3z8OkV5WFCe3oO+jDmpZcc1U=;
 b=DxMp7S+qP85UOX+Y22Dt14jDvwWNF7AbcV3vDWHj4vVGendMdF8ffQWUSN7CXmHdBtUi/XjXN41P/cq1gdXuytwlmZZxNTanGW2qjE1Kjak3Ve32t+9jvQsnZUdnzWig3XGcU6mjS9cfH/DN6pMVQbLNhap337rdbIMGS4orKyTaRRp0jZYwW0SVKU95L/u7PK/h7axJLdq9gRJtGA8Ylhyrpm6zCMByuWtwxpKhe8HPotskU91ATPJYIb5GwCIaRWGODMgLYcTPzEACL5EoTB5RqMdKdBI0bR9KXSnvZnKdTd7rvHpdjMWE1W3RyWNJnJJiYbSXgowCHp3UQxvHsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU4PR04MB10958.eurprd04.prod.outlook.com (2603:10a6:10:581::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.12; Wed, 17 Sep
 2025 08:15:46 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%7]) with mapi id 15.20.9137.010; Wed, 17 Sep 2025
 08:15:46 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 17 Sep 2025 16:14:54 +0800
Subject: [PATCH v6 5/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-csi2_imx8ulp-v6-5-23a355982eff@nxp.com>
References: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
In-Reply-To: <20250917-csi2_imx8ulp-v6-0-23a355982eff@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758096930; l=3008;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=nA5cy/wcos0mCTMHP9Jtnsd7cdC81n6TAw63/g+dYUo=;
 b=7zQd4qpnnCfjLliBeQO2T91MU6fP5K6kxN2o9J5aNl0aH/MGGkt7nTbDLj6nRoqVEBm2nT1ku
 YbK6zUXbgRJAar95XrSs+C+mlAx433WirghFvyAd5LRQOFlBKHKm7MZ
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0022.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::8)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU4PR04MB10958:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f78b263-0bcf-4f24-b8f4-08ddf5c2674d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QVcvN20zaFB0bG9XbnczbjR3V0Mya1dHYW1vc1BsSklFRlRabG1yRFhuZjVO?=
 =?utf-8?B?TUZUckVNVkxBWVcvQlQ3N1Z1cGFKSUJBOFo1Z005VXFCRk85MloxbzFQdDhM?=
 =?utf-8?B?SUxCQ3haUjlUS3I1SG1ELzNacVlGd2cvWFZsVXR4TUk1dXlwWE5IQzJmd1NB?=
 =?utf-8?B?VkxIWWJVditGWFdHNGNEK1Z0dzN5bHhaN29QdXdldllKcWhtZUtueWd6VndY?=
 =?utf-8?B?ME1UdkNQR0lhNkxlUzYyQVhLTUZIRC9GaFRuOVFJUGl2NlJwRWRKRXBXb3dw?=
 =?utf-8?B?dzdiWWpNL0Z3N3JVQUN4MGRvOEdQSDdQbGoreURsV245d0N3a0VEOVpubE9W?=
 =?utf-8?B?KzhXLzU0OTNOblcrZlExZkJsclNVREV3bmVwYWxuNE9Sb1hIMTJMMkJJc2hZ?=
 =?utf-8?B?NThDR0NCaTBXUzlPZVZsQmYvVG9SY1dwazBVZjdtUGZ3dXRhTXBIczQ4NSsr?=
 =?utf-8?B?RDVnb2ZlUFhXR3QzdXZ6QTYyYUsrbzhXM0oyTFdNbGl5QVE1T1ZrUUMzTlZY?=
 =?utf-8?B?VWMyWUQ2UU1QYW1tSmpmMzZHc3lxemd1R2ZpMXd1M2VYMnhYT1cyY295dnp0?=
 =?utf-8?B?cEdBUnJoZHlRT2dPeTgwZ0NIRmdEdmJHS0FzbEJCTlBrSFZjcjBSbzRTRGps?=
 =?utf-8?B?VjNYNVIrbXBnbjN4VmE0YmltSEw3bThXM05hMllRejlzcGpjZkEvbHBTTmkw?=
 =?utf-8?B?bXFaOFlaZE9SY1Z5YTZ6cllpVElwVWlxdnkyWEg3S05MRE5lZS9MV0gwM01P?=
 =?utf-8?B?QlQ4dXB6T05jQjc4eSsrcDZyUXBkSzlkS3B6ZGw2NkxpdlVhVERSNnlwU1B0?=
 =?utf-8?B?eEprZDAreEpiVTNpSDB5NDl5bVhGWXJ2TjdVNmZwem9taGpBVWFZcG1HdXBq?=
 =?utf-8?B?VWNhakVONlZNNUlWVGNWclZHMWlxUGRrQmQ0ZkUrRHloUnpIbmFhWlAwOENO?=
 =?utf-8?B?QnQ5b1JNbTlXYjVqL2RFSWJHMjh3Z0o3TWJiMUI5K1ZsT3RWWVYzYzQ3QVQr?=
 =?utf-8?B?d0s1RmxNSjFWOStWdDd2bTg3NEhta3lIVUhzK1NVZytoaGZMaGEyakZjamo0?=
 =?utf-8?B?UzYyTCtNTTNldmRzUnRRRGcyNU40UTJDNWxlU0RWNTkrV1BYVDdxYjcvV01v?=
 =?utf-8?B?SXFrK3RkdWZmR0J5bEJFalZIUG8xNlM3aVU3ZWdBWWZXNEp2aEh4aVF4QlZU?=
 =?utf-8?B?TmtRY29pMDdQclJJL3BaTDlucXdNbnp2OGlHSklGZytQUlNmZG9Qc3Ywb3Bj?=
 =?utf-8?B?LzVFLzlBbS96eVF0QzdoU2wwM0haY2tNWUNRNUlSbW1PaHEyelRnSHd1SGlE?=
 =?utf-8?B?UENTcW9mMVpZUkFCYUJ4dWt4NTVFc080VmFpM2NlN0JTUmdTM2tvWXU3R09l?=
 =?utf-8?B?bHgwaTlIdTVUZ1FGWVNtRmpOWEF3ZUNkWmlSdjJSMTVGUWptUWFVUy80SEtl?=
 =?utf-8?B?QVB5eEZsRUIxZFZsSW5lN1dDYjh5b1dVd201d25waTR5WFhOUWwxOTY5cHdm?=
 =?utf-8?B?N0F2bmh1NXA5dW50WVZ2UnlsU1JzZmNrbU1pN2NwRmh3ZXM0Z2g5djFUZk5P?=
 =?utf-8?B?RlpzNjQ4M0IzYXdoR1BnaVpXK1AwaU0reDlyd2NNQVpHdWt3dWRYaTgwMFNl?=
 =?utf-8?B?Y0lMV0IreURBTWxkZXNGTFd4Rk1lM3VOclhrTnEyQno4b3lqNng4LytLWmh2?=
 =?utf-8?B?OGpYeERBZDhZZEtlQ3YxYmZtTE9uUnRMWkZNME5mYmhINHRYTlhLelEzQXRn?=
 =?utf-8?B?Ly9mYkpUKzVkYjk0V1BTSkZ6SXk5eGxKZHFhc1RsUWcxbWFUVy9sWmVMZmxq?=
 =?utf-8?B?SzhJVWIxME1HWmEwb0ZKcXZ2UlJQcmhZSHZZZUhhY2V1Z2xGV21CRW5lby9V?=
 =?utf-8?B?ZGh6REt1UmhQYmh1eWdjMFM3c3o1V0ZPbUlkYnlzbTIwVEVzcC9qK1dFSXcw?=
 =?utf-8?B?RU1VdUs2b0JnZ2w2T3RETERSWDZJNzVpK0RabktQN051a2tVZitjTnAxUVQv?=
 =?utf-8?Q?2XVU4aq/1dwPMs1rpLNdaW6+U3PYn8=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZUZ5NmVDbHdJL3ladVpydEVybElMdXVzSnJQbjB4V2RMcHBXTnZOQjlnS3ZR?=
 =?utf-8?B?YWQ3VHZnZnQ5MnZTSVR1d0VhSjJFRFJobVNhNU0waFlaMjRXT3psdEJYNzlj?=
 =?utf-8?B?WTVZRVlubnphVE1zT1BaY2pLdjltQ2h5b0gyTkFmSnp5TWdqRU5zS2VnNklO?=
 =?utf-8?B?L3d3MHJpWHRyTFFwcWZMYTgwUWdYNURFUDNjVWU1UWR5UGNueWpZdk8xM1Rj?=
 =?utf-8?B?NmM2TVBrMnhma2R2V0l0cDgweHF5N2wzcGdzUUJLMFRiOU1uVk1jQkJ0dUJt?=
 =?utf-8?B?VEt6ZmFUT1NhRWs5VFU5dWdNOUxxSVU4bTQ0YmgzVE9vaUdNaDcrRjhYbzFI?=
 =?utf-8?B?YVd6SnJwTWFCSExVTHFSSDU4QzkrU3FwODdRb3QvZ1FsdjBPUm1nRVlGUi9H?=
 =?utf-8?B?dWNGV0oxMjVRNWpTeEpvcmZIY0NTY2NnYmVZT3UwSDEyQm5nT0xXYlluRzAx?=
 =?utf-8?B?Tit3dnpBN2oycHdyeCtMVUlHTWh3M1MxS090clNkeFB5akpIc2thZWllUDUy?=
 =?utf-8?B?VmRYa3FwZGJhemkwYzR2RWUreDRlYzZ0dzA2ZWdWOXZadGpicVBPcDdNM1g3?=
 =?utf-8?B?aEZxNDVoOEFGdG1pc3htVWY0dklmc1ppRUlwT08yWEpjTmtmSVhhWnVpOGh0?=
 =?utf-8?B?VXhhYThXS2c1UUlJSS9PaVJvdTF4Wml1NE1EVU5SNmw3cHFZYTgzL3piMEZX?=
 =?utf-8?B?RnNqbjFjL0M5S2xaZU95RFJlTlBkbEMwa3RoV09MOUM1TzN4ZVhydUc0U2Jo?=
 =?utf-8?B?bEVMbjN6WE0yOFFkVEpydlhCWldYSFZyTGdueDhUckwvUk9lSHVDa0hhQW9W?=
 =?utf-8?B?TGVoN053eUFPQmtiTkJaM0ErQ1VwVzhuOFYxbFMvQ2xVbXZ1Q0p4bGd6U3dB?=
 =?utf-8?B?M0Z2azJTbnB4VTB0cVhNQ2RUdlc1ZUwvcWh1LytGNDNYbERHSDFhVXh6ZWxZ?=
 =?utf-8?B?YyszQ2E3UFROcTlBQ29UaGpoVjk2Qzc1ejFWaThUL0I1U3BMM2k3b2ttR2hU?=
 =?utf-8?B?THN5MlkyVm5GclA3NFBKNkMzRjBJNWJmZldVWVlMRlNpNmdwRjVhSVNTK3ZC?=
 =?utf-8?B?by80MWNMekthWlBtOUNmNXExRk93UzRtMnpiMXU2SCtmUmZ4TExUWGd3TWZ1?=
 =?utf-8?B?K2dRN21obFdMdlVyWmQzekd2ekhNODlTRWFUWVFLcVl3RDJua0ZuRmhWaDJG?=
 =?utf-8?B?Q05lQk1LY1dhVG0rZUxkYU1CdnFOK25FN2k5TE0ybExhbWw2UDJNWFJ6RWVl?=
 =?utf-8?B?NGdsWTJ3Y3pmVzdXcEY4WDNaVG9GeCtsNk9LbkFxT0hrU2Jsdk1jWVdnZEJS?=
 =?utf-8?B?Q2xPYTlLa0dwNGk5VnFnNVdJZGliaURzSkhzUFRoQWd0NElrRmlzQ3Jkbjdr?=
 =?utf-8?B?T1JKVEhuajlISlpVNTB3NDllNFRHVUM1UVFsQThBa29VTkt1YjNjdnJSSHlz?=
 =?utf-8?B?VDdUMUg5Yy9uVHdsK1FQUzB0UGdoRkdGSXo0Nm1PNk9sdjFLSjZ6aWxEUVFw?=
 =?utf-8?B?N2o5b0pLL2NlaTYvd2tiallDNS80cmFLQWhTb1VRMkFwcEMwMFFQZ1AxdXRX?=
 =?utf-8?B?TGF4MFBpMGZORlhyS3dFQnV5S3BPNitLZ1ltVjVCZDZiYXNtNXhCdG1xd2pW?=
 =?utf-8?B?L3VHTitZZ3pFSGlmSnd4VVk3eWlBQVprbHJTS0pLVHJxaXRVdEFTZGFGS3Qw?=
 =?utf-8?B?OXNEQm45QUk1dDZLaFY2VkFOajdQSnljQy9zMHBhcTM4UE1TSGNHRE5RQnFv?=
 =?utf-8?B?MGVad3I4NTkrRllVQ0ZhUVRMdWtzcWkxY0VVT2VzQ1FjUFpqNjFJa1BFcFJ6?=
 =?utf-8?B?ZUVNZk14cGFneUl3Z3ZadmVXUHdORmdHSFFJVW9QQlplaVlMYk0rcHFad3d1?=
 =?utf-8?B?NUhvcENXRW5mK2dzclMwMlpHODBjMExMUzJRR2ZZdzVaWlRlWEMxU2J3SGJU?=
 =?utf-8?B?ZGhsVkVZNHpxQUtrd3RuekFab3hzN2NRYWtRdEVnRC9LOVRIK25VSWdyTE5p?=
 =?utf-8?B?VTVFOVdxckE1STRRV1haek5Fd1lOVlk2cmpyOC9GcHVPYmZjeW1xUXlLMkxx?=
 =?utf-8?B?L2ZLcEJ2MGJidE9yOE13VXF5Rk9ZQ0MzVmlPRzE4a21kN1JBNDZvaDdOYjRZ?=
 =?utf-8?Q?GNRHuGmVGlYy4V+xv2PgUnH9t?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f78b263-0bcf-4f24-b8f4-08ddf5c2674d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 08:15:46.4154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIHsrVC+oBn3ZE8ESPZPM/p7Qedv88mWGSMM9Pkh7A41OOgbKdmUxA1J2gjIrcf4DKTMiCXDu3awmktm8Ba78w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10958

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 in the i.MX8ULP is almost identical to the version present
in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
nodes and mark them as disabled by default since capture is dependent
on an attached camera.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..99271d55dfb60ed2cbfe664d928be179eb257674 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/imx8ulp-power.h>
+#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 #include "imx8ulp-pinfunc.h"
@@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
 				dma-names = "rx", "tx";
 				status = "disabled";
 			};
+
+			isi: isi@2dac0000 {
+				compatible = "fsl,imx8ulp-isi";
+				reg = <0x2dac0000 0x10000>;
+				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
+					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
+				clock-names = "axi", "apb";
+				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						isi_in: endpoint {
+							remote-endpoint = <&mipi_csi_out>;
+						};
+					};
+				};
+			};
+
+			mipi_csi: csi@2daf0000 {
+				compatible = "fsl,imx8ulp-mipi-csi2";
+				reg = <0x2daf0000 0x10000>,
+				      <0x2dad0000 0x10000>;
+				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				clock-names = "core", "esc", "ui", "pclk";
+				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
+						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
+						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
+				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
+							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
+				assigned-clock-rates = <200000000>,
+						       <80000000>,
+						       <100000000>,
+						       <79200000>;
+				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
+				resets = <&pcc5 PCC5_CSI_SWRST>,
+					 <&pcc5 PCC5_CSI_REGS_SWRST>;
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mipi_csi_out: endpoint {
+							remote-endpoint = <&isi_in>;
+						};
+					};
+				};
+			};
 		};
 
 		gpiod: gpio@2e200000 {

-- 
2.34.1


