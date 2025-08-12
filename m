Return-Path: <linux-media+bounces-39536-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66254B2209C
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:22:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92D921AA5082
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 602602E1C65;
	Tue, 12 Aug 2025 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aaOta7dL"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD6A2E11A6;
	Tue, 12 Aug 2025 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986867; cv=fail; b=ZLLtteKVHfKj9E2vjoeyDJinMy3RQbvw1tiSVBXzUlXrLU1sRwr8mxv1a6ZkTuYHyZVoqr6qYDtOTKHc6IOhuyF3dCX7xQCIZ3udaUl5wxF6ztolZIy/gOFWOMKlPDi7pyOCi9o0bjr9SEiEE21mzukrzJ8zNu6C/nbylnnsiNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986867; c=relaxed/simple;
	bh=TNKgjBU7XRPEAVExGEP51LMSw95UtoC4icZpQeNQshw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I8a3VpyLbTZW+QPkPLtNhC/8GNd1C4W57ZmNFcjBdysvI9yx847P7wLZ7ARlTbXakoDwEPviF4dJrVv7JzHzqXO2y7sICSp2esjm68bwNsPQRvcoHbXt4zuNO89/4udmICTusMh+8Xdo8Ks3YG68IgfTIoybj8IkUsRMvdKzBt4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aaOta7dL; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2iCOVl3reMRwomTiSxYG76mFU7ASUSXGxEyYRoZ2Ot6GfQZa9VbEfZMyNYZPXv2JOH5lLQz6BY0hHj2VUMxtv4aj7cB9Jg5s0WllrxBwz79VLLDke1vLUhHFyk3Y6GhxRxiQGvGEqY0p26aHBGOxZzWf7ELxYHCLEYx84/TqHvoH/NEM782vQ85BE58JH6c/NybJyAKV4Eukiht5DZZ7goNnlaIjUt/Bmr9sBAHUOqY+DQ0155eMKw8Pzv82Geqg9YLxmP1jcef70P2W/O7DrdcKO24RmjvRQd1Zk8KTnVfqBA7Pcd76zZHLOw/yaaQQbwxNoUi8ftasP5jXC18UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zP83thi5xOa/oYNvudvBfrRRaXa0T01ewRMVeS/8/kM=;
 b=UQr7jwiJJkYXUje2Z5vFhq4AS10tNSRDkSAjQekJ/OFqlQ7gB9loqqEibavfgufAf5r2umeBvzORk25XpK8XwmCrCNit9OicW69e0A+Ag5IsQB4hn1JYWcukkEXJhL4o93+87Ea6DVxHCaZXd1aDC8d9LhzouKOc+bLxVcwTy+o32LxbTGGVpOs60vnhvEJamDoluPJnSDq/Pky+9H4RIKWKrDlJaXzcZDow92VWrSllNdQeUUPaTJKPk2fPGv/K9xSbyDluLAa95u80suBn8EPDtE4nDfjBWiXUyoQIbMiqOFHw8Sdtj5DoSfpxRMhTkFsiNFHTcomAD06QyyoPuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zP83thi5xOa/oYNvudvBfrRRaXa0T01ewRMVeS/8/kM=;
 b=aaOta7dLGk0L/+cuIPFqBPZ7jLnzbvLyc/DZX4BExK9A0jLQN4lS/pEJ6VFn4tXd8B62Qw7U16UVRbSQK7RAr77Xmrcm6K/BSdz4BuWaz79hff2swgVMwdPfl/mHyJulMLkbo4NMQJR9cHf291O52Mc/QssBk92/mRA1EmZj+ScpTEZHfdnwSEtFLVmmb2oOKziitoLnyzLbuavK2P916iG7sGP6/xJ8RpDGEHO5wQro0rhWvsPAdfk1dk6NmAl65lkzTUaLB8cUmEDgHDGgPsKpLfQTOEbVjSolrHtfgAGisMEHSqvZcaxXoMm8ABe7jZu6F6EWqxEf/hrQXjZDUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI1PR04MB10001.eurprd04.prod.outlook.com (2603:10a6:800:1d9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.12; Tue, 12 Aug
 2025 08:21:01 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 08:21:01 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	frank.li@nxp.com
Subject: [PATCH 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8ULP compatible string
Date: Tue, 12 Aug 2025 16:19:21 +0800
Message-Id: <20250812081923.1019345-2-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
References: <20250812081923.1019345-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|VI1PR04MB10001:EE_
X-MS-Office365-Filtering-Correlation-Id: d3fd5867-25c5-4bcd-b5ff-08ddd9792c4c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Y3NmbjR2ZmE4NzJEVUZnbThUeEhZNUQ1WGR3dUJSNm55K0lVbEFHUW9YUmo4?=
 =?utf-8?B?UHd5V2xQU3pORytWbkY3ejljUnNPVGRacGlhRm1NMjJRMVc4YTVvZDRFVTVr?=
 =?utf-8?B?dk1tSmF6SnhvRm5vVjJpbnJVcmdMRHdZa0ZMQlZ6MSswaDFOcXQwdnE2R3RL?=
 =?utf-8?B?Sy9IK1ZBSUdISHNDcVVvQU1kWENMT3FIcGVVazZld1BndkVQQVhyQlg1UVJ6?=
 =?utf-8?B?eUY1OFR6bW13cHhQQ0hTbnk4Y2Q5VG9pdE5kK0RhVE1mMDBkR055MVdhWWxR?=
 =?utf-8?B?SU1NS0dOaDlUeGZaZmhJcWZUNkRkSmNEcS9CQ0cxS0htMURLdktvVnQ5K0RI?=
 =?utf-8?B?ODNVYzhhOWZsSCtNM1JnaHFyTzBhYWRaVXlEeXZNTnUwQlhoRHBJWittd3k3?=
 =?utf-8?B?WUJ3T05RVklBT3kwUEVLQm5RT3VrdklWckU1VzlZRGM2TTF6M0dNb2s4NUlX?=
 =?utf-8?B?MXV5UCtPSDNya1RkZkFRL3JrMEt3U0NhTGdVdTBGZnVzZ1ordVBYK0E4Q3p3?=
 =?utf-8?B?enJFTXd3bFlEQzUyMG84TmhuL3NNSW5SK3J4akpIYm4yMk4walBXelFYZFlN?=
 =?utf-8?B?anVVWmxvYjNjSDhxQlRGa3NWdGFzaEJiVTB5UWh0b0xVcVlaRmJsQXNWcGJ6?=
 =?utf-8?B?OEU4WXhiUG1vQ013ZmVQZFVCZ213MkpMSmxpYkdTRlJocEYxOTVlOFRSTkRV?=
 =?utf-8?B?ZUl4aFFoTGdON0R0a2xkR1NleWFvaXN2UkdYM21NeEZ6ZFk4Q3BZSXVrVExV?=
 =?utf-8?B?YkJvMHpaU3R1YmY5WUxrOWhRa2tEV1N6ZjF6bDFTVDAwZE5NbVdxQ05nNERW?=
 =?utf-8?B?Q0xDTk5KMFZBTUpwQmRnejVIYnlNeHNVVjRRcWN2a1hBOXl4SUR6N1d0WXJ4?=
 =?utf-8?B?SmdDRHcrd0FScEpvbUFoN0JFT3l4OGpieVpXbUF3Q1ZsbWJtQ2hpTTczQi9i?=
 =?utf-8?B?Vk1RdnVOOEMzcERkNkxWTGI1WjQyRmlaUlFVVEFJelgwQ1BMUjR2c04ycHFt?=
 =?utf-8?B?azlTcWNpTU43VmRoU2ZRUXdYLzg2eTY3T1lTVVV6eUMvR2kxN0tqOEhsRWxM?=
 =?utf-8?B?SXBYQ0dzditlbkgzeUt0UDF1RU5EbG00Ri9nY29DTVh5cVY1YW9rME1GTzhC?=
 =?utf-8?B?S1JqOUxyUVhCMUUybGtYTkNyZ0ZBTFJ4bkJnQzBTUkNxR0xDRWJBZ2o1VnNU?=
 =?utf-8?B?dER0TklLNkpiWk40THdMTlpwU040Yk54L3pFZk4xaXpIL3htNHlVK0VIdUEy?=
 =?utf-8?B?cyt6UXdkeFI3TWI4MDJVVTI3UlpNL0F5NXU4M0NwdXZSSWg2NXg0dTR1MW9m?=
 =?utf-8?B?RTF2N2F1WDRkK0wzZm5zTU5sMDlLZlhndS9YTi9tUHNuakQzMjNuc3hVSnho?=
 =?utf-8?B?UjhIcHJpVHRrVlZDVjVWYmpjTjBoUHJQbTNpYVBTRlZRVGFvMGxxaWNUR2Yr?=
 =?utf-8?B?cUNVcFEvcjljcVhNWWFMMlpLMGNvd1pjRnp4ZGlWUFZkdC8ybUh4V0dBT3pv?=
 =?utf-8?B?TEZLTmlGRmdoSCtJZWdZdlFVdDZ1Z2I4K05FSUhsalpkbEFQaEJHMjd4dTNQ?=
 =?utf-8?B?a0F1bFByQ05jb2x1OGZST3RBMDFiYmFMeUlQcmJqMkFMZW9qU1ozKzhLSkRh?=
 =?utf-8?B?WEx4QVZCRkRjZDlxaW5mTGFWZk5oYXI4SmdBazRObFQ4cllOUnNxMFBLeEIw?=
 =?utf-8?B?SEVsRVhTZzhmaUJDVVlKamVvZHp1T2NDNFVaTmo2cFE4YWgrVnVya0RFRFhs?=
 =?utf-8?B?WW1zZDA0RklpRERCbDdrNzZvbkxBVHVBRW1SeDhId2Q2V0w2NzhmQ2o3ZGdT?=
 =?utf-8?B?bDNGZklDVlcwZmJCUUFYaSt4Z3dFbEZocUhkcnlibm95YXYzTURqRzJJTFlL?=
 =?utf-8?B?RHE1QzBJQUt5bFpHZ0JuUmxCRHRIM2EwdlFLVFo4aHJ1eHBhaHRpdEVVSCto?=
 =?utf-8?B?bDZXb21iTjJKS2d5dGwzY2x0bzVzOU5DS09WWVFPOWIvR1pWYmhUaDRDWm45?=
 =?utf-8?B?TmEvRXNLZTFBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QmVoY3MwL1NwdDR6TTJTaitabUFjTmlRbkpDdjJiUFU2TUJJdDQyeE9ROHZK?=
 =?utf-8?B?d2RaTWFCdlNGbFhOMjBBTUR1eE56UFhRcVoxUkh1T3N0RHlJSXpmVnBzaC9i?=
 =?utf-8?B?eXNlRzZiNzZBSW9Ca1ZQNURXNG00OG5oRVRINDRNdklxVzhtdTU5eFVpYVZR?=
 =?utf-8?B?WUZVb01RRnEwdXFIbVpvdUVjWHdpZEJtMzhpbXgxV0ZYVloraEpXaTJwUHds?=
 =?utf-8?B?WGlEZXQ0TVkySVJSU3M5UG13TzVEN2xqbkRKMHJ4aHl6SHRJb04xZTNsVGVY?=
 =?utf-8?B?R1RIUGhnL0oxQzBreHlzUm9HaFVQb0ZuWU5LSGxRQUpXT2ZFdFRjTmJJMWhl?=
 =?utf-8?B?blJJZy9xVnBuZ2d4cTFiZytNblVpQ1RJSWtZNTBaSTRiYU5rdTZkeHY5TUhP?=
 =?utf-8?B?UmtUWWdnMWh2SXAvcDhBbG9UTkVFNDlIVmpzSTN2SVBycnhDeWNZaS9Oakxq?=
 =?utf-8?B?WWRyOG9ESmFadzBwbnFPemM1eGs5aC9hTFZhVlVhQVpJcjlIckMyVjRoR3Jm?=
 =?utf-8?B?REV4aE5CS0FRZ2c3aC9ZdnU0U3pQNFh3WkZYV2ZWVW1nUGNMY0o0NGluK05N?=
 =?utf-8?B?RzRMNXQ3YjYzT2hRZFptUmhVMDdYdXhqczBNYVM0Vkk1NlozWHFtWnNUd3Z0?=
 =?utf-8?B?d0thUFFLRGZnQnFsZEhaZ3pWOHpacTNEZHdWU01rZlRMZFFVNk5OWE16dkhG?=
 =?utf-8?B?MTZDNWNvQ3RNTDkzYWFWMGJ5MTZ4cmtPNVZqWERUOHkwOEIzWnZ1Y2hkMnNv?=
 =?utf-8?B?R29Ibmh5UDNlNEhOQm42L3FlYTRqS0xSc1RYUVo2UkZJU2dpRnhQZHNvSlNi?=
 =?utf-8?B?SWNJRHNFQmMvbDIrU1BPdE90aVBCUlpLRld1RDRhUUNjdmhyZmdSSVo4Q2dP?=
 =?utf-8?B?RG4yY0pnOGdhckVxamJ0R1U0dm5MNEVWZy9wZGVDUUVwYjU4WkRVamM5Z1V4?=
 =?utf-8?B?Vkl4cE9MT2tZOEw0L3V0eWdsQ2VTaE01eHorMUJmUnBjUUZKb1VyZWVET2Ix?=
 =?utf-8?B?cHcydEpsSHErRjJyS0x6Y1MyN3VuQkxtU05XOHB3SFovSlM3eTZmLzBVMFZv?=
 =?utf-8?B?V1lZeitQV21QaXlGNm45Sm5lVDFQeDczcjRtRzdyemZmbEtuNmlvZTZkMFpY?=
 =?utf-8?B?UnFNWkhzenNBOU82UHJub1dPdGE4M05aYlRGc2JwcUZGbU5HQVUxWHR5Q2E5?=
 =?utf-8?B?a3hkNzh5U2xjdW1oejdLUmUwancyT3dySDlQMnY3dzcvdHFleTZwbnE1cUlm?=
 =?utf-8?B?ZTZDRTlLOXQzdEpiY2JMSmFUU01vMUJQaXZaSVh3c0VCR0xYSkdNeUlITmtH?=
 =?utf-8?B?WXAwc1FDWExjZGdTMDRkY2ltT25yS1kyM21rVGtQdVI0KzZDM2FjSmUyUUlO?=
 =?utf-8?B?MkM0SjBROE5nN3FRb21pTi9ya0JrODIzMVBzaEtBakhtVW5xOGdjQjhUREI2?=
 =?utf-8?B?V3BFb0xYL05vOUhMM0MwelNRRjJqVnBDcGx0SUFGSDRvZzFSMGZJbWpaSThn?=
 =?utf-8?B?MUo5WWVTYmpnUGtidXBwWlgxSy8vcWtYc3QvMW5qUmMxd1NIaXdBT1BTcVdU?=
 =?utf-8?B?dzBUSjNGcHI3NitKTy9GMUlRektKbmIzdDdRU2x3Tk9rTkdSWlBSdEhBRWoy?=
 =?utf-8?B?MlBpS0NiSkNqWldRMG5xNGRRL3U5aVF3dUgxK0dDRmh4MDJjamovd0ttaDBT?=
 =?utf-8?B?Z0YyY2NqQjJxaEZFdk53WHNlcTh1bkpnZ0drcXQycVFqN2YxTjlJUUROSUZ5?=
 =?utf-8?B?OU5IVUtNZzFFV080Sk1ETGlqOGRZR1VTN2RvWXhKNXdWMTloRGFsTUp1ZXNP?=
 =?utf-8?B?YVlRNlpBUmc5TE5hYlk2UFFoOGhVZE9NekpxMHNuWVEvZnJJVVovRjQ3dCtW?=
 =?utf-8?B?dUVHVERxV1RyRURpNnp1TERmM050VDlMMFo5VFVtUFpHQ21udjdiVUE1UUJv?=
 =?utf-8?B?WEVvckJuazYwV3QvOVpXdzJ6bk1DY0MzUUpLdnRCclh4cm1jZkljK1laVEYv?=
 =?utf-8?B?ZUdYNktkZ3FDR3VMOUpPNXdKUVZDa3ZjY0pCUnFGK1BnZVNYOVNsMjZlaXli?=
 =?utf-8?B?blRWRnVhTlFBUXY3ZFBSeTI3bzJmRVVlb29ocit6MHlETXVjU29XOGNESU95?=
 =?utf-8?Q?nU/iYgDHYb0rJ7DIlx7VxGj+F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3fd5867-25c5-4bcd-b5ff-08ddd9792c4c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:21:01.7334
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/bHoVcjf/vGW33Hg9TFj1+dM/WakTG4nxeQ+R27nsapuuuG44ckAxRheQ+H+cvlPmTYmyuvqlUmW9eLHYJvOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10001

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The CSI-2 receiver in the i.MX8ULP is almost identical to the
version present in the i.MX8QXP/QM. But have different reset
and clock design, so add a device-specific compatible string
for i.MX8ULP to handle the difference.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
index 3389bab266a9..83fdda2252e5 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - fsl,imx8mq-mipi-csi2
           - fsl,imx8qxp-mipi-csi2
+          - fsl,imx8ulp-mipi-csi2
       - items:
           - const: fsl,imx8qm-mipi-csi2
           - const: fsl,imx8qxp-mipi-csi2
@@ -39,12 +40,17 @@ properties:
                      clock that the RX DPHY receives.
       - description: ui is the pixel clock (phy_ref up to 333Mhz).
                      See the reference manual for details.
+      - description: pclk is the lpav bus clock of i.MX8ULP.
+                     See the reference manual for details.
+    minItems: 3
 
   clock-names:
     items:
       - const: core
       - const: esc
       - const: ui
+      - const: pclk
+    minItems: 3
 
   power-domains:
     maxItems: 1
@@ -137,6 +143,23 @@ allOf:
           minItems: 2
         resets:
           maxItems: 1
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-mipi-csi2
+    then:
+      properties:
+        reg:
+          minItems: 2
+        resets:
+          maxItems: 2
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
     else:
       properties:
         reg:
-- 
2.34.1


