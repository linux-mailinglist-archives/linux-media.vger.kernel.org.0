Return-Path: <linux-media+bounces-41796-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAE0B44E5B
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 08:56:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E83623B2207
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 06:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0F32D3732;
	Fri,  5 Sep 2025 06:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mfAw6lQS"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E1B2D2388;
	Fri,  5 Sep 2025 06:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757055384; cv=fail; b=YuSDV70OhNA+u+m+vZBUzwY4HAdSBvE5HfivPJ0bsJ4f9cV66mIYSxwFjVXd4baC1ttIEB/ruZk6GCgT+QAXYwj4g2+cldP+EuojPHC8ME2we76k5TIVEaE0UqW4FUkI6ClXJF/VmauPhA9xhwknsltnYcYoli7fRJe1176FAUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757055384; c=relaxed/simple;
	bh=mzDD0rPYQmc7wKWkK0i8dF2+tAzO2BP4yn2QczJev70=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=RgcieAPEtTxbtMSBTwzD4F1k0CjskK2T89Xyoqux07K/dCN8LRB6vJInewIowAjvUTTdiYnRG+PlxDLA7Zs1hjHJ0CkY0rXPZrekgA3yDpaPaWVyPEC3KS4lZGuvPZQVXADaBl9Rx03Shj4chb2xYIiGEO2ytowIak1xfVfEMho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mfAw6lQS; arc=fail smtp.client-ip=52.101.84.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I5fZMaPTBTNpVtVt3a7OPI27FtdiWye2fZto0QixuDNxsCF6ptjs/k7wfgUhC1qozC5vlmYAU5Gkn3sMxZg9t99ibSbbdQ4KEfGqsQCduNHN8MI1Rn9V847thSpEkZen5OWA1SV5fWmsRn9IpXrXGcrcNiffl6YwdngCOUXkqqYlKtzDAHX4F2vUv6OwTHsizB94xobFhuO8jHyngb4pcDB4XQtIRz8FCPNHgjIZI8rqSTfNtTbUoNv88orIlMWq40cpWO6tNilc9ZEtLRZxQ7+b/PVrHFTUCaA3whbNTGIn3WfDbA39zTVatBG0poS3PVhAJ0kL2NsrqKSStBD9Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCYMGGPdnXMTfF4mtJRivx8f3oOKAHP2hu4JJJrQxd0=;
 b=f/vgAQbTMZP/xMpFTufM6q18NEMDU0tgZxsNJOc/ZKklcAIgKT8d4kC6p4JP+FFIVGSxIUBAFOO7NlLi/jKaKefZPcBw5WOYTcLi20fSb2wE+UV+gJjzzXJlKAep1c6iMYRS21Sas9CPV9QB3PFaGyOQnDRu25tZmqDooDVeMJIiQ9/cFlndDopE64QIeHAmiWtG7gOxM3CcUeZI/K5bqvyprG0MGLy6rHjRHD+CNTyjIpfX9888b73mooc0MFf/A8VB8HQ64Xva+eNbyC93/yJn3fYm51lOfkIfP+QdAhtEKVFL06tkJrN3SdYwb3nl+F4iVPRsLj/1jCToaFlvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCYMGGPdnXMTfF4mtJRivx8f3oOKAHP2hu4JJJrQxd0=;
 b=mfAw6lQSkX4POM9ZjoXVBO/0eYzO4iLT1JxkYTx/zAslGO/UcFVD5PY+y9oiaeug3qX3rrxyt2T0e0NXhaXZZGxF7uGC/qIraAnPkEl8yDhgaOlWsyJr1/CSLPxiehmF5kuIK5kazQHMkNFmHHHUPpOOkM/Zlsk6Y80i4x/y0RPLdOaQ5LVxAN03EOTygK/MMAps2sIHrXdlmS0P79uS1aJ7ItIFfCy/FdlkI2W13AEwDlQZGpMkKPqwL3KwKzXS9FRGnFn1Nl1p9nTGMChHu9nEXYpAriJbLsn1nzlSeZMI1yGJikhXtIETnqXBrLbhUJFc3c6eXYC9JpH9uLv5pg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM9PR04MB8889.eurprd04.prod.outlook.com (2603:10a6:20b:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Fri, 5 Sep
 2025 06:56:18 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9094.017; Fri, 5 Sep 2025
 06:56:18 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH v2 0/5] media: imx91: Add ISI support
Date: Fri, 05 Sep 2025 14:55:57 +0800
Message-Id: <20250905-isi_imx93-v2-0-37db5f768c57@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH2JumgC/03M0QqDIBTG8VeJcz2HqTXrau8xYqSdrXNRhg5xh
 O8+Fwx2+f/4+O0Q0BMG6KsdPEYK5NYS4lSBncf1iYym0iC4aLgWLSuPOy2pk0yNTSe0NlKigvL
 fPD4oHdZtKD1TeDn/PuhYf9efcvlTYs040xJbo0zDrZqua9rO1i0w5Jw/CZCFTaAAAAA=
X-Change-ID: 20250826-isi_imx93-4a59288b33e4
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757055383; l=1745;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=mzDD0rPYQmc7wKWkK0i8dF2+tAzO2BP4yn2QczJev70=;
 b=4xYGegsWopjmbxQ2X6yiwqtqTmZeNK2yUHHyVoIBqgXwZ6/iHpU1TvHlqWul4McyAABj68vJs
 lbKEPrq8/03AOcu6VEy5fuQCCuDzLZmV4fHcNtbm2CUE0z1trfDJwR7
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:54::13) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM9PR04MB8889:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1d64b5-f7f0-4d2b-3484-08ddec495040
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NDRTcVc3d2pQNFkwQ041SWVUbEdPNE9TVmJGazV0eGhOOSsvSEYrdDcwZS9q?=
 =?utf-8?B?b2FkVHByWWQ4VkZydUJRdVV1WmJvSCtqQWVlMnN6cG0wN0w1U1p3VlprYmJE?=
 =?utf-8?B?NmhYd3VWbGNPY2MxYTNYWlRxSUZtMkZLVnpEaFVHRm9PSmhBeDVpR1JjOFhs?=
 =?utf-8?B?cXN5Z3k1aDV2MlgrZGh6SDJ4RHZDWU93dXFzUUYzeGhMMktwOVRwOUJwUnhO?=
 =?utf-8?B?WGRFVklrbkMwNmdqTytQd3pSMWplU0xMS21ZVlY3alZCVWMremlqU3l2SW83?=
 =?utf-8?B?b3Nqb3hJdVdJc05HdlB2OXlZNHJFRGY1cmdDc1hPWEM3cE96azJQWTM4bzU2?=
 =?utf-8?B?bVpzTWFCaE1EelZnTm1xelMzVEFZK3hTZlpTRHVwNWRLMU45VjA1dWlWV3NZ?=
 =?utf-8?B?MnlkclRvMzlOQjFyZ1hEM3BzSTFLb0pkRnkybjA3bnRTenVsS29pYWJZTmRQ?=
 =?utf-8?B?TjZBZWdPb3kzcDYvRGF6V2pqRXJPaFJFM0IyZEJCUjVvS2hiYTB4R2VycWpm?=
 =?utf-8?B?TW5ZUkNlbmFoWng3K3UyYm5IbkRwWVltQkh0ckNiZXFzTVp2VTFJTkdndkNW?=
 =?utf-8?B?RWZaeVcyR0pOdWphVHdLNldLZzhZUHJGU1JVQzlsOEpUa0dRSENrZS9mS0Vu?=
 =?utf-8?B?eWVLeUNoMzRkNXN1cDUrSnN3dzhnMGR0cHpKVlhkczd1cXJLSXg1WTVoT3Ra?=
 =?utf-8?B?V1dPTG95OXZWaUdnU240clI3N0JyL0N2MEpUTFo0S0RCQWw4MXR5S3FDVFpx?=
 =?utf-8?B?cWJXNTEvbHVobTBpTFBpRW5LS28wK09rWE1EeGw1eERVVyttOXh6aXUrVld4?=
 =?utf-8?B?dFB6eTZzeEgydENrQlZFblpXL2J3alBmSXJJT0ZhL0dlY2NuVDNJZVJEUHE2?=
 =?utf-8?B?WFVUWVlrQ2NnbHM2eERmQytZSFlETjFlVzF0OGF6WmNvUDJrbGU1L0wwNmpN?=
 =?utf-8?B?alp1bEh6OEVzY2lIVmZ1R2hoS1QreldDQ0hrdHE3T1hQdkpOTndRMXB4Q2Jj?=
 =?utf-8?B?Mk1ZYmN4QUl3d2JCUWUyRU12RklObjdtMkRKYmlOaWVJRER5TS9CVTBxVE5i?=
 =?utf-8?B?RXg3aGVqUS9SZHJVYkdRT3dFV3pPdFArMkJkYjA5V3p2eHVsdnBkbExPdUlz?=
 =?utf-8?B?L1M1eDVtMHlKOXJkOE8rTDAzMzBDWTFpaWlQRkV5MXVtR2x5Tlk0dHVqS1p3?=
 =?utf-8?B?b2htOEYvc1ZId2hTNlpzaklDZVBGWVh0bHhXcnRYbXZYSFlOU0NBQTgvUlU4?=
 =?utf-8?B?bk1HU0hMSUZtSEFiTGdOMFcvWVA1TDVnd1FTekNpQVduR3Y0V2RYelZWSWxQ?=
 =?utf-8?B?ZXlXOGt4TjFjK1hlSnNoQnpsZnhpNFdjR1ZZSWMzTk9DQzZlUGxpMXcvMWhG?=
 =?utf-8?B?dGlpZElLczRIZXhSTWhmVnRoY0VZU0l3M3VHYUZHSGE1YkU5M3p1R1QxVXho?=
 =?utf-8?B?bzVHeWhZU1dqc3Ywd0swZ3FKRDZ1NXQ4WUZEQ2NVRTc0bjJkRU1QRXlwZVNi?=
 =?utf-8?B?ZkVOZUtVTkUwYUlZN1FWcTkxV3pNSmV6ZnhLcWFUd1VYeElRSWl2SkR5ZjYw?=
 =?utf-8?B?R040TGhTb3YzSHk3TXN1bnR3aDhMUWdRMElnUW1aQnN3ajVSaTlVcjJHUy9y?=
 =?utf-8?B?aFJObnYwdVVHdEIvVnhYNHc2ZnNqR0E4TE9Wd0V3ZS9BYUw2cDQvZjJKcUU3?=
 =?utf-8?B?STErNXE2akU0azlUM0txZkRJOGs5alZHTzdEUm51R3lKN2VPeWRnYXl4V3Q4?=
 =?utf-8?B?YWRMZ3R6Qm9RYW53U3ZZaDB4RmtqRzhHZkRzenNicXNBZmZkVTM4VE8wZGQy?=
 =?utf-8?B?RGhLa2EzN3puMUdoZEF5dFdtdkEyRVdISUswWEhodUNrN1JqVURNU2diYVlR?=
 =?utf-8?B?Rjk0OXpTM3Vsc0gvNUwwckhobzVFUUc0eE82K2NOcW01K2tOL3loS25kejFC?=
 =?utf-8?Q?tyLMOG3vMzoIPugyX5bUWi70ojJQEcYc?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bW1BT3NGRVlsbzg2eWptZ3NnRWZLWWhMWDJWUW5qNDF5SWNHK0ZQalM1RjZv?=
 =?utf-8?B?N09FYWNRYWxtMGZYbDF0ekh0YU1wMURyYUNBM2hEdjhnc3BLdEozenVwY2Nh?=
 =?utf-8?B?ZmNsZ2Q4OUhmWEZTODVjQ01ZOThtekVxODQ3cWpVRHkxYUovRG1vbU05aTJX?=
 =?utf-8?B?MFd5eGdVSk4wLzJUc05YTEFZS1kwNFJNS3RwRkJ5cEdkOU5VNjFlL0tpTElM?=
 =?utf-8?B?ZnNsMjkvV2g5OVczSzJhOEdGQW1ETGRCWDlsTmJVb2VucTdpMFF6MVN4SUZM?=
 =?utf-8?B?bUdESmpUMnZXM2piV3lIL2NnN1JyQnBlZHVwMVRrU3ZiN0tleG1nWW8xdWRO?=
 =?utf-8?B?a2hhVlR6UHhjTW1YcE1oNjdpa1liS0JYMFV2Mm41NUpIQWFIN0NiT1Zvb1BY?=
 =?utf-8?B?V21xOU5FL25qZ1JudGZPaEJkUUJBV2NxRDlsUXZ0UDg1S1JldXFNcGZpSytE?=
 =?utf-8?B?b2hLVmNqYTRIOGFrL0Qrb0gyT1Bhb3N6V2Y4N0JwclQ2bWQxWHF4c0ozMlFz?=
 =?utf-8?B?Q2h0aTFFdlBMQlJhTjVGM2tHdWd3em0wTzhySHVGZXpRbmQ3MGVLVmNJZ1R5?=
 =?utf-8?B?R1QxeTFraVl5OVlPQTcySU5KWHZQMXYwM0Qwd2FkcTJEOUJVNmtUTEtTNHQz?=
 =?utf-8?B?Qm1LdC92RmNxWXJYcER5dnlyZDFtWnIyZE1xTVB1ZjZOcHhqMWkxRGtqYk1z?=
 =?utf-8?B?SXkxa0grUVpGWGdEWCsxK05hWGdDME83d21ZR3NqQXNDV2lMYVpPMUVkQSs5?=
 =?utf-8?B?akpraWhsOWpRU0E0QzB0RTdodkhXZ0JpN3dZVGlTN0U5OWpsQjBzWlNOcFhy?=
 =?utf-8?B?dXdLbkc3Sm9tRnh4WFpDbVk3T3dHMjBLZ1BBY09sZ0hRUzJmN2NnVTI2dGNJ?=
 =?utf-8?B?bFNidnU2cUF0Z254R28rZ3ZRVWVoWXFIVmVlaVVpSzN2WDlYUmZ5SHlla2JM?=
 =?utf-8?B?TFV6eGgrS3M1eWxocTVTcU4vV2t0d1ZwY2tBYzZKRlJqR3cvb3NPM0tMR3Iy?=
 =?utf-8?B?cURWY2V5TS9LU2xsdFNsOXJ0TUdRWmo5YitJaG5zdGRTV3J5QnlwVVlaY2J4?=
 =?utf-8?B?aGl4R1hRM3RWc3FoSkhIYkh2VENielJXVkRxNmtXWCtmZjl0eXNhSXBocldX?=
 =?utf-8?B?SWE2VUpCMUZGY1hSeDJwdHYzaG1seFY1OHdUNUxrQTZUd1UyZkhPWXdmVWpm?=
 =?utf-8?B?aGorM0pkL1RSV3RmczlCaVR2eVZPRDNaTiswc0c2em9xOVZXU09SRDcrb3F6?=
 =?utf-8?B?a1czalQra0YzQU9zZTY2LzFvSWp2UWtuYXh0ZzAzR0hzZjJSbEVhQUw2dlBr?=
 =?utf-8?B?K2hhUFgxdmx0aXFBcmNSYSt5QXllRFdaYlgzYW5zc1E1KzNNVWhhazg4OFZW?=
 =?utf-8?B?NlkyREZxZEpVUFk2c1c5ZVZTTC9QVmJaOWU0UUt4dThJTFc1eWh3TkdPQ1lU?=
 =?utf-8?B?QkVOeDRKTXR4R1hjVWtMTFlpanBDYUoyM3FURVhxcW5yb0ZINXZIVyt6bTlR?=
 =?utf-8?B?Qll2MmxvUklxcFJLaTNZazQxNjhMMDRqNko1RVlCV2lYUHJOc1ZPazVBd3E2?=
 =?utf-8?B?cElGRGlpdFVPSXl5UFZCWVpaS2V5VnZxcUhsUVVwSnVCRUxONjB5WlExVkxX?=
 =?utf-8?B?MWNsRVJmeENEU2phQW9pWFBOVWpYUGNrQXFhazZTaEhLczd1MUFlTFJWcTk1?=
 =?utf-8?B?dUJhTWQ1bUVSRHZBQU1YUkc4K0VkMEd3dFdhMGJoQmVTRVhnaG5sMVNGYjJF?=
 =?utf-8?B?R21nNU51eVhkVXVtL01XWXpJVUwvVHBsbTJwV0N5a29jc0JwRXZYUW02KzlW?=
 =?utf-8?B?cE44TWhzcVZ5UEF3cXF0TjdFaHlpaXZwVlNzM2ZUTUlOelg2c3VzN2w0cE5w?=
 =?utf-8?B?TU5JR2tMN1BEQ1U3dytIVGFnYnBhMGtzNlRTSWE0eUt4WFdBR3AycWNyRGFV?=
 =?utf-8?B?MEJYSWdUb1dHTWZXSkh1Vm9KVzI3WHVWZjNOczlTeC9pcmU2eWtaYkpSQTFk?=
 =?utf-8?B?MHlCTjIvREwzZ25zVWIvYUxmUG8zdWwvQThaaVpMaEZrOFdlN3hBRHlJZGsw?=
 =?utf-8?B?RldoMzdYamVEc1ZUaVpaODZPQ24rUnZqQ0h4cW5sM0NMUDVOcUFxS3pzajV1?=
 =?utf-8?Q?yT2lmlaH+NSrZ/UZOMRxJsoN8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1d64b5-f7f0-4d2b-3484-08ddec495040
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2025 06:56:18.1308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VjlY3bQaM23bROIeQBw7zahIW8imxebWR7dbfdRJzcs2AbvYn0mXdvnHGqCbSJWLJQ+yiESn3bfg5PurOuQQtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8889

Add ISI support for i.MX91 chip.

The bellow patch refine code, no functions changed.
   media: nxp: imx8-isi: Simplify code by using helper macro
   media: nxp: imx8-isi: Reorder the platform data

The bindings and driver patch for i.MX91 ISI.
   media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
   media: nxp: imx8-isi: Add ISI support for i.MX91

Add parallel camera input for i.MX93 ISI.
   media: nxp: imx8-isi: Add parallel camera input support

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
Changes in v2:
- Update commit log in patch 5 to better describe why introduce it.
- Include two header files in patch 2 since kernel test robot report build
  issue when arch is riscv and compiler is clang-22.
  #include <linux/bitfield.h>
  #include <linux/bits.h>
- Link to v1: https://lore.kernel.org/all/20250827-isi_imx93-v1-0-83e6b4b50c4d@nxp.com

---
Alice Yuan (2):
      media: dt-bindings: nxp,imx8-isi: Add i.MX91 ISI compatible string
      media: nxp: imx8-isi: Add parallel camera input support

Guoniu Zhou (3):
      media: nxp: imx8-isi: Simplify code by using helper macro
      media: nxp: imx8-isi: Reorder the platform data
      media: nxp: imx8-isi: Add ISI support for i.MX91

 .../devicetree/bindings/media/nxp,imx8-isi.yaml    | 13 +++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 50 ++++++++++++++--------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 +
 .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 18 ++++++--
 4 files changed, 59 insertions(+), 23 deletions(-)
---
base-commit: 603957ae903e81fb80d3788297c0f58a68802dfc
change-id: 20250826-isi_imx93-4a59288b33e4

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


