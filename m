Return-Path: <linux-media+bounces-51803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNivDSEvfGkOLQIAu9opvQ
	(envelope-from <linux-media+bounces-51803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 05:10:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A2553B7010
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 05:10:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3722D301300B
	for <lists+linux-media@lfdr.de>; Fri, 30 Jan 2026 04:10:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB58366809;
	Fri, 30 Jan 2026 04:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L0RD9XEp"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012042.outbound.protection.outlook.com [40.93.195.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D4E1C32FF;
	Fri, 30 Jan 2026 04:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769746205; cv=fail; b=ZefX99LeeA1VIGPhyQnwgaNxU5jsqUFz0LcZW1Uv5xv+nJtPLKlnGu4KC1iTj2iLovuxaB2yLOQvayq52vf28Tm17fukoYicllnU6/znApGEZJbh//eT56f75wuDA8rWKWbaNRj8URjnYiPabwzUq6t94lwdu5le3cQa5Xjycss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769746205; c=relaxed/simple;
	bh=c551doWmZi/qAQvq/1lTuOYZcNiuLrpFNc/FzWzdsKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=nZ/uUJtvGSLTuRGRF6jj4Kkzlad7PDB55t+43Om8b2fgjac2EMuopJD/XLWXhfcMsRmLMFYt3T/Sl62dzbLiWr3+XdapjPWEoHfcyoAppQX0K7vRf2rPmkP2wAyq+j+t6t3Nu511PVo7WwCBIk2X5D5eJBXRjMyg6pSBByf3gLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L0RD9XEp; arc=fail smtp.client-ip=40.93.195.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqxQ4PMlyxHnvLACFzi3/v/vsLsoufBcRSORSE2N3GOSFZT8lZGPQkVBQfhGLtI0ZE0pxv9j7PgeEWKWvUnupkK5+Y99iPUIFufcb72KuO2Ix+nAdLSp2PXz+t/K621sCINwcaonoymsZrpl6SPeQtBIGkVX7sCq5XU21BMSeWekebhteQVXFeQuRtgbhBkf84Gy1WFbzDb8aiNubWXCIGDb65VT03SmMHf+LdZmcenikNnwH3SnmDf4De+4V/DFjn1gCKs6meSGdjKEyZkMXlpUixJ2DeO6ltHMBROqfL/G5akKJr3eXIg/6Z/SiivwvKr66Zpkp58QLQ6yZoQvhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LI3GsTdGMOvxzI58PiUEGe+W5Ge9PySItd2EcQbRAN0=;
 b=xx5h9GL13kLgBInp3fUv8MuhAYp78tn4V42Vf88xtXGE2gMBFPRFHk16HBsCjOvuw98O5wd46miVv3SL1JieR3wwjrIUV88Z6Pg+JFAuytlkYhflp+J/RJns+S7tS7RMsjhQnbEtpbRlKpyiuSteL9/llj7N2LxKvyShij1Q0Vt0Hf0TsUrSZEvu6j08xT/lfLkVyEDbp2WcdadyX/Tp8MuqOkw7Kl50CC2FfQ7qqXWxcxAT+tTl2i6fj0k9A6CSdaq+YdmBfVh9xhbsTXv0fjlmd/HJtg58/9+6V7Rf47Bpuhoulx5Z8x0OE/IRfJ5AY2bxYKrWt5Bdwl7vVn9zkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LI3GsTdGMOvxzI58PiUEGe+W5Ge9PySItd2EcQbRAN0=;
 b=L0RD9XEpAE8m5kIchKgfBzycGSwXm6iKbVxICUwKdyFSKxZdSHrzP1uw0FSeLC2ftarW4iM/+jvWu9GBsEnOe3L41dxJd2U1ufvcg5PWndkltOh3i6TxjuoGI4CMe+UFtPcq1LJ52QtiXGYXKfO5AQNI0QfBUf426SffCcEGccM=
Received: from PH7PR17CA0071.namprd17.prod.outlook.com (2603:10b6:510:325::28)
 by CH3PR10MB7808.namprd10.prod.outlook.com (2603:10b6:610:1ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 04:10:00 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:510:325:cafe::75) by PH7PR17CA0071.outlook.office365.com
 (2603:10b6:510:325::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 04:09:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 04:09:57 +0000
Received: from DFLE209.ent.ti.com (10.64.6.67) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 22:09:57 -0600
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 29 Jan
 2026 22:09:57 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 29 Jan 2026 22:09:57 -0600
Received: from [172.24.233.149] (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60U49oaf1080271;
	Thu, 29 Jan 2026 22:09:51 -0600
Message-ID: <816bfa6a-c4ed-4389-b94f-2a5e5c2c0267@ti.com>
Date: Fri, 30 Jan 2026 09:39:50 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/18] media: ti: j721e-csi2rx: add multistream
 support
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, <jai.luthra@linux.dev>,
	<laurent.pinchart@ideasonboard.com>, <mripard@kernel.org>
CC: <y-abhilashchandra@ti.com>, <devarsht@ti.com>, <s-jain1@ti.com>,
	<vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<jai.luthra@ideasonboard.com>, <changhuang.liang@starfivetech.com>,
	<jack.zhu@starfivetech.com>, <sjoerd@collabora.com>,
	<dan.carpenter@linaro.org>, <hverkuil+cisco@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>
References: <20260121135424.1185710-1-r-donadkar@ti.com>
 <20260121135424.1185710-14-r-donadkar@ti.com>
 <ec8be3fb-b2c0-46bc-a2d7-aaeadb0bba37@ideasonboard.com>
Content-Language: en-US
From: Rishikesh Donadkar <r-donadkar@ti.com>
In-Reply-To: <ec8be3fb-b2c0-46bc-a2d7-aaeadb0bba37@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|CH3PR10MB7808:EE_
X-MS-Office365-Filtering-Correlation-Id: 28734622-7e79-46e0-e2d6-08de5fb56e6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnI5aEtOT0VJS2NSdzJLOXJ5YU5VeXZGa0NFSVc3QzFhSFBBdlNxSDBnekVt?=
 =?utf-8?B?RERuSERRVzRHeUk2WE1kOHE1R2JLSXdGUkFMdjRHUlVEMm1jbWVWMWVNUy9P?=
 =?utf-8?B?NEREQjhGQUZWeHdwWjdzVDRiZVRGT0ZJTkdxdUV6U2VwTGhVNlA2WTRRSWZo?=
 =?utf-8?B?TXV0UTl3cGJFbElHc1gxVTBvMG8wR1g2TzNmMGI4WEYrMmxNUUJkUDZsekEz?=
 =?utf-8?B?ZlZMWlBPVDArczBzUUdwTmdyUmxZU1ZOTThlLytEeE84MStJMXp1WmdEbnBK?=
 =?utf-8?B?Qm5wZTB3YVFiZUR4dUszQ2VhVnp3RHllUFVWMXdWbk03L0lvSHVoWStJMzBL?=
 =?utf-8?B?RENUeE5MaElQeS9xU3l2eFVNSU4rYlUvQWJhUFEydW9ibUQ0WHpKSXV6N2xo?=
 =?utf-8?B?K2lpQm5oMWI5TFZzaUI5c0FiZi9LUkZOSlBFMEIxOW5yb2d6TmFvWFV5Nytl?=
 =?utf-8?B?ZnVuWHV3RWlYYkdPbFZXYzg5TWg2V2ZqZ09MNGhncDFiWWRqSGhNK2p1Zm0y?=
 =?utf-8?B?Y2YrZmUvY0tzeDN6UWoreWRWMGVkdTlVS0tSaytOOGdCNzhMQ0cwKy9vM0l4?=
 =?utf-8?B?NzJ5V2pnMEtFejhRNGRCMlkwdm1tTC8xMlRSTE1oUVJXZVlEb3F5U2o0QUJo?=
 =?utf-8?B?bzQxRHBRMWZ0VjNWK29IS3JJRjRSQnlacGtwbGFWUU5FOG0rNkl2QU5KTkdw?=
 =?utf-8?B?TWh6bVBkWkVOTklNd3VKUGsyQWZoRmtacWMrSFcrc09YRXlQM1Y5aEdIWGdr?=
 =?utf-8?B?RERDT1hyZEZvbkdBeXR5V3pVRllleXdCcWFRbTFjRlpWWHdiTHMrTmh5eEk1?=
 =?utf-8?B?Y09rN0ROK1pTcDNFWjdMTXJFQzI5cmVIVmN1d1pIemU4UWRqWWgxWTUveTZM?=
 =?utf-8?B?OXhzOUxxQTVBcjN4WGo1cTJMTEQwOUtTMDJ2dHR4ZEhnWmZpc2xqQkFQQit6?=
 =?utf-8?B?Z2ZaS3pWb0FFNXc5MUZwd1B0MGxxZzZMRllIRlp0OTdLMFc2OHQyS3diKzho?=
 =?utf-8?B?N1M3SGQvcm5hR040TWx2NnV1OEJNaG52Q3l3ZXgxZWNJUnZya01rN2I0Zm1T?=
 =?utf-8?B?M25PVlJ4RWNGYjNTQTVMejdRTzl3TWV2QWkzTG5CTEdtSWJEbVlYQi9GTGpz?=
 =?utf-8?B?bkI4eW5sS3VCOEM5MVVkUnpPdWdBNnV6RHZJbEFzaGZQZ2R3WFQwdXJDSXFR?=
 =?utf-8?B?MkFFRWhUbjFyU2NDaDRFblpoeXBLQVJPNzhvV2xjMXoya0d5Y0xHak1nOUtm?=
 =?utf-8?B?YU03SWM3QTRQQnJZSmRJZEMxUWx6WThLb0xKRUdMMXpzMnNnMlNHTkl6ZnRD?=
 =?utf-8?B?MGtoN0pIMGRtWU1Edi9lTTBGSW9rU1BwRlJ0dXlBd3pFT1VzZFpmdmd4eGR6?=
 =?utf-8?B?alRSTDU4bU9pdlhwT3dHWE5QNm9vWmF1UUdQS1ZNamd3MVpjTElTUGtITnJE?=
 =?utf-8?B?MEZPNVk4R2Qvcy9UMzJScHVJV3dDNzcvNXJzZ1d5aGhmVjZBQkdQTlhYU3J3?=
 =?utf-8?B?M1gzNnNrWjNHMW1qUXFXL09NOVRIaTZtZWxRN1lwdnZoWDZrSVEyc0g1L254?=
 =?utf-8?B?c3RFYmZ6Qkwvb08yZU9uOWxpWElTbmpRODEyV3U2YWRmOElaSUhaOWlvS3gy?=
 =?utf-8?B?RjM1eGZ0RWt6YWxRNHpPVDQ2OGFKVjFDZUtEcXVQeFJJRTAzYVQySTNSb28y?=
 =?utf-8?B?ZUNkN0NZNjF6ZjhlKytjQmpkbXpCMWpRNXFZZnhSWVAwVnNHUHRnOVBJS1Bs?=
 =?utf-8?B?ZGdVMWVCT0R4NncxaVFVQmxoZzNWd3pTNFphcFl4V3lyTlV3UzhhM3pLakZI?=
 =?utf-8?B?bGJkWEdJVkxXSngyek5NV0V1WUltdGlNL1NFN2VYdjcwZVZVdkFwTytNc3Fm?=
 =?utf-8?B?aHROaGxHdnFEMDlQblpUQ0FwK2s1dDZ0V0UvNjRraGdMUHowWmh4TUxpV1ht?=
 =?utf-8?B?ajZ2Q2tkNVhrRjQ4M082VUd2SDdwcjh0enlSOVJJM3VKY09WbjUzbXRETUZE?=
 =?utf-8?B?bDA4dmJpY21LeTBaeFN6QU5aaUxFcDduMTFmMnBQNkJZTmlBaVp3Qy9aNnlJ?=
 =?utf-8?B?TzNreElkSTNGd25yWW5wWlphdXBJdTFuS3lDN3ZkWnVGMnJMMkMzR3YvblA3?=
 =?utf-8?B?bzFyNUZFYURGUHFVVkF1aGM0Ukl5ZjVCdytWQXpHNndOdFBYdU5ySzVKcFc2?=
 =?utf-8?B?dmlIaWJZbjliYlFNT04rZ2kzZTBmTGlSWGF6KzlqM09COHhzTnhJKy9SY1pl?=
 =?utf-8?B?NTB6S2hhMEpSZU5HYkJXT3RzRGpnPT0=?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BDGm5FOt+pEjpeX1VLkzeIKyqTiVbR6q5/5Drqoh1nDaNIUo+UmTYe6cJ1l00qtznKWnwMACXHaskVkZDLgCqlheR8uoVjuNH3sCZ0I2YBmpExDGcTv9JpPFds/y9G86KonUWzh95bJII6C/6WT7kMHJXIbM+DbBarZH7KoTmCsauIxCT2x1J9pi2px8e5JAK3NAqh59idrLZPM5+LXKiN/CDl4cGKUNfMOAb3LTVOTEd91qgFpKSfPmXtN9XLF7yPh0+G6VBacHZ+K2GS+NCKnOVNfyMkhCXS7pHu0CPG8OrAuQQz1VLrl6Vjgz+L2fhmvWNEi61ErQgGNZZojamaz8vly4IUudB3V/+EecL9xnkLtb/UbMOqaWLvRcJGtFo8RORG+6v3IkofJCi2qgfGH2mvg6NxgmmR0YzFTGhk6L4RZObdFnNRsu1UOWj+x+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 04:09:57.8789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28734622-7e79-46e0-e2d6-08de5fb56e6e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7808
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51803-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,ti.com:dkim,ti.com:mid,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A2553B7010
X-Rspamd-Action: no action


On 23/01/26 14:56, Tomi Valkeinen wrote:
> Hi,
Hi Tomi,
>
> On 21/01/2026 15:54, Rishikesh Donadkar wrote:
>> From: Jai Luthra <j-luthra@ti.com>
>>
>> Each CSI2 stream can be multiplexed into 32 independent streams, each
>> identified by its virtual channel number and data type. The incoming
>> data from these streams can be filtered on the basis of either the
>> virtual channel or the data type.
>>
>> To capture this multiplexed stream, the application needs to tell
>> the driver how it wants to route the data. It needs to specify
>> which context should process which stream. This is done via the
>> new routing APIs.
>>
>> Add ioctls to accept routing information from the application and save
>> that in the driver. This can be used when starting streaming on a
>> context to determine which route and consequently which virtual channel
>> it should process.
>>
>> De-assert the pixel interface reset on first start_streaming() and assert
>> it on the last stop_streaming().
>>
>> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
>> Signed-off-by: Jai Luthra <j-luthra@ti.com>
>> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
>> ---
>>   .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 271 ++++++++++++------
>>   1 file changed, 191 insertions(+), 80 deletions(-)
>>
>> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> index 81c86e2cc4a50..4dabb99792d44 100644
>> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
>> @@ -143,17 +143,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
>>   	return container_of(sd, struct ti_csi2rx_dev, subdev);
>>   }
>>   
>> -static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
>> -	.width = 640,
>> -	.height = 480,
>> -	.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> -	.field = V4L2_FIELD_NONE,
>> -	.colorspace = V4L2_COLORSPACE_SRGB,
>> -	.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> -	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> -	.xfer_func = V4L2_XFER_FUNC_SRGB,
>> -};
>> -
>>   static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>>   	{
>>   		.fourcc			= V4L2_PIX_FMT_YUYV,
>> @@ -565,10 +554,6 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>>   
>>   	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>>   
>> -	/* De-assert the pixel interface reset. */
>> -	reg = SHIM_CNTL_PIX_RST;
>> -	writel(reg, csi->shim + SHIM_CNTL);
>> -
>>   	/* Negotiate pixel count from the source */
>>   	ti_csi2rx_request_max_ppc(csi);
>>   
>> @@ -888,34 +873,75 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>>   	}
>>   }
>>   
>> +static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
>> +{
>> +	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct media_pad *pad;
>> +	struct v4l2_subdev_state *state;
>> +	struct v4l2_subdev_route *r;
>> +
>> +	/* Get the source pad connected to this ctx */
>> +	pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
>> +	if (!pad) {
>> +		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
>> +		return -ENODEV;
>> +	}
>> +
>> +	state = v4l2_subdev_get_locked_active_state(&csi->subdev);
>> +
>> +	for_each_active_route(&state->routing, r) {
>> +		if (r->source_pad == pad->index) {
>> +			ctx->stream = r->sink_stream;
>> +			return 0;
>> +		}
>> +	}
>> +
>> +	/* No route found for this ctx */
>> +	return -ENODEV;
>> +}
>> +
>>   static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>>   {
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>> +	struct ti_csi2rx_ctx *curr_ctx;
>>   	struct v4l2_mbus_frame_desc fd;
>> -	struct media_pad *pad;
>> -	int ret, i;
>> +	struct media_pad *source_pad;
>> +	int ret;
>> +	unsigned int i, j;
>>   
>> -	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> -	if (!pad)
>> +	/* Get the frame desc form source */
> "from".


Will correct

>
>> +	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
>> +	if (!source_pad)
>>   		return -ENODEV;
>>   
>> -	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
>> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
>>   	if (ret)
>>   		return ret;
>>   
>>   	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>>   		return -EINVAL;
>>   
>> -	for (i = 0; i < fd.num_entries; i++) {
>> -		if (ctx->stream == fd.entry[i].stream) {
>> -			ctx->vc = fd.entry[i].bus.csi2.vc;
>> -			ctx->dt = fd.entry[i].bus.csi2.dt;
>> -			break;
>> -		}
>> +	for (i = 0; i < csi->num_ctx; i++) {
>> +		curr_ctx = &csi->ctx[i];
>>   
>> -		/* Return error if no matching stream found */
>> -		if (i == fd.num_entries)
>> -			return -EINVAL;
>> +		/* Capture VC 0 by default */
>> +		curr_ctx->vc = 0;
>> +
>> +		ret = ti_csi2rx_get_stream(curr_ctx);
>> +		if (ret)
>> +			continue;
>> +
>> +		for (j = 0; j < fd.num_entries; j++) {
>> +			if (curr_ctx->stream == fd.entry[j].stream) {
>> +				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
>> +				curr_ctx->dt = fd.entry[j].bus.csi2.dt;
>> +				break;
>> +			}
>> +
>> +			/* Return error if no matching stream found */
>> +			if (j == fd.num_entries)
>> +				return -EINVAL;
>> +		}
>>   	}
>>   
>>   	return 0;
>> @@ -926,8 +952,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>>   	struct ti_csi2rx_dev *csi = ctx->csi;
>>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>> -	struct ti_csi2rx_buffer *buf;
>> -	const struct ti_csi2rx_fmt *fmt;
>>   	unsigned long flags;
>>   	int ret = 0;
>>   
>> @@ -942,35 +966,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   	if (ret)
>>   		goto err;
>>   
>> -	ret = ti_csi2rx_get_vc_and_dt(ctx);
>> -	if (ret == -ENOIOCTLCMD) {
>> -		ctx->vc = 0;
>> -		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>> -		ctx->dt = fmt->csi_dt;
>> -	} else if (ret < 0) {
>> -		goto err;
>> -	}
>> -
>> -	ti_csi2rx_setup_shim(ctx);
>> -
>> -	ctx->sequence = 0;
>> -
>> -	spin_lock_irqsave(&dma->lock, flags);
>> -	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
>> -
>> -	ret = ti_csi2rx_start_dma(ctx, buf);
>> -	if (ret) {
>> -		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
>> -		spin_unlock_irqrestore(&dma->lock, flags);
>> -		goto err_pipeline;
>> -	}
>> -
>> -	list_move_tail(&buf->list, &dma->submitted);
>> -	dma->state = TI_CSI2RX_DMA_ACTIVE;
>> -	spin_unlock_irqrestore(&dma->lock, flags);
>> -
>> +	/* Start stream 0, we don't allow multiple streams on the source pad */
>>   	ret = v4l2_subdev_enable_streams(&csi->subdev,
>> -					 TI_CSI2RX_PAD_FIRST_SOURCE,
>> +					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>>   					 BIT_U64(0));
>>   	if (ret)
>>   		goto err_dma;
>> @@ -979,7 +977,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>>   
>>   err_dma:
>>   	ti_csi2rx_stop_dma(ctx);
>> -err_pipeline:
>>   	video_device_pipeline_stop(&ctx->vdev);
>>   	writel(0, csi->shim + SHIM_CNTL);
>>   	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>> @@ -996,11 +993,8 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>>   
>>   	video_device_pipeline_stop(&ctx->vdev);
>>   
>> -	writel(0, csi->shim + SHIM_CNTL);
>> -	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>> -
>>   	ret = v4l2_subdev_disable_streams(&csi->subdev,
>> -					  TI_CSI2RX_PAD_FIRST_SOURCE,
>> +					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>>   					  BIT_U64(0));
>>   	if (ret)
>>   		dev_err(csi->dev, "Failed to stop subdev stream\n");
>> @@ -1047,25 +1041,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
>>   	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>>   	*fmt = format->format;
>>   
>> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
>> -					   format->stream);
>> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
>> +							   format->stream);
>> +	if (!fmt)
>> +		return -EINVAL;
>> +
>>   	*fmt = format->format;
>>   
>>   	return 0;
>>   }
>>   
>> -static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
>> -				   struct v4l2_subdev_state *state)
>> +static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
>> +				     struct v4l2_subdev_state *state,
>> +				     struct v4l2_subdev_krouting *routing)
>>   {
>> -	struct v4l2_mbus_framefmt *fmt;
>> +	int ret;
>>   
>> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
>> -	*fmt = ti_csi2rx_default_fmt;
>> +	static const struct v4l2_mbus_framefmt format = {
>> +		.width = 640,
>> +		.height = 480,
>> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
>> +		.field = V4L2_FIELD_NONE,
>> +		.colorspace = V4L2_COLORSPACE_SRGB,
>> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
>> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
>> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
>> +	};
>>   
>> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
>> -	*fmt = ti_csi2rx_default_fmt;
>> +	ret = v4l2_subdev_routing_validate(sd, routing,
>> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
>> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
>>   
>> -	return 0;
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Only stream ID 0 allowed on source pads */
>> +	for (unsigned int i = 0; i < routing->num_routes; ++i) {
>> +		const struct v4l2_subdev_route *route = &routing->routes[i];
>> +
>> +		if (route->source_stream != 0)
>> +			return -EINVAL;
>> +	}
>> +
>> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
>> +
>> +	return ret;
>> +}
>> +
>> +static int ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
>> +				    struct v4l2_subdev_state *state,
>> +				    enum v4l2_subdev_format_whence which,
>> +				    struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>> +
>> +	if (csi->enable_count > 0)
>> +		return -EBUSY;
>> +
>> +	return _ti_csi2rx_sd_set_routing(sd, state, routing);
>> +}
>> +
>> +static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
>> +				   struct v4l2_subdev_state *state)
>> +{
>> +	struct v4l2_subdev_route routes[] = { {
>> +		.sink_pad = 0,
>> +		.sink_stream = 0,
>> +		.source_pad = TI_CSI2RX_PAD_FIRST_SOURCE,
>> +		.source_stream = 0,
>> +		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
>> +	} };
>> +
>> +	struct v4l2_subdev_krouting routing = {
>> +		.num_routes = 1,
>> +		.routes = routes,
>> +	};
>> +
>> +	/* Initialize routing to single route to the fist source pad */
>> +	return _ti_csi2rx_sd_set_routing(sd, state, &routing);
>>   }
>>   
>>   static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
>> @@ -1073,15 +1126,62 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
>>   				       u32 pad, u64 streams_mask)
>>   {
>>   	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>> +	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
>> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>>   	struct media_pad *remote_pad;
>> +	struct ti_csi2rx_buffer *buf;
>> +	const struct ti_csi2rx_fmt *fmt;
>> +	unsigned long flags;
>> +	u64 sink_streams;
>>   	int ret = 0;
>> +	unsigned int reg;
>> +
>> +	ret = ti_csi2rx_get_stream(ctx);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Get the VC and DT for all enabled ctx on first stream start */
>> +	if (!csi->enable_count) {
>> +		ret = ti_csi2rx_get_vc_and_dt(ctx);
>> +		if (ret == -ENOIOCTLCMD) {
>> +			ctx->vc = 0;
>> +			fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>> +			ctx->dt = fmt->csi_dt;
> I think the above lines would well fit into the
> ti_csi2rx_get_vc_and_dt() function.


Okay, will do that.

Rishikesh

>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>
>   Tomi
>
>> +		} else if (ret < 0) {
>> +			return ret;
>> +		}
>> +
>> +		/* De-assert the pixel interface reset. */
>> +		reg = SHIM_CNTL_PIX_RST;
>> +		writel(reg, csi->shim + SHIM_CNTL);
>> +	}
>> +
>> +	ti_csi2rx_setup_shim(ctx);
>> +	ctx->sequence = 0;
>> +
>> +	spin_lock_irqsave(&dma->lock, flags);
>> +	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
>> +
>> +	ret = ti_csi2rx_start_dma(ctx, buf);
>> +	if (ret) {
>> +		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
>> +		spin_unlock_irqrestore(&dma->lock, flags);
>> +		return ret;
>> +	}
>> +
>> +	list_move_tail(&buf->list, &dma->submitted);
>> +	dma->state = TI_CSI2RX_DMA_ACTIVE;
>> +	spin_unlock_irqrestore(&dma->lock, flags);
>>   
>>   	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>>   	if (!remote_pad)
>>   		return -ENODEV;
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       TI_CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>>   
>>   	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
>> -					 BIT_U64(0));
>> +					 sink_streams);
>>   	if (ret)
>>   		return ret;
>>   
>> @@ -1095,18 +1195,28 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>>   					u32 pad, u64 streams_mask)
>>   {
>>   	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>> +	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
>>   	struct media_pad *remote_pad;
>> +	u64 sink_streams;
>>   	int ret = 0;
>>   
>> +	WARN_ON(csi->enable_count == 0);
>> +
>> +	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>> +
>> +	/* assert pixel reset to prevent stale data */
>> +	if (csi->enable_count == 1)
>> +		writel(0, csi->shim + SHIM_CNTL);
>> +
>>   	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>>   	if (!remote_pad)
>>   		return -ENODEV;
>> -
>> -	if (csi->enable_count == 0)
>> -		return -EINVAL;
>> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
>> +						       TI_CSI2RX_PAD_SINK,
>> +						       &streams_mask);
>>   
>>   	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
>> -					  BIT_U64(0));
>> +					  sink_streams);
>>   	if (!ret)
>>   		--csi->enable_count;
>>   
>> @@ -1115,6 +1225,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>>   
>>   static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
>>   	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
>> +	.set_routing = ti_csi2rx_sd_set_routing,
>>   	.get_fmt = v4l2_subdev_get_fmt,
>>   	.set_fmt = ti_csi2rx_sd_set_fmt,
>>   	.enable_streams = ti_csi2rx_sd_enable_streams,
>> @@ -1293,7 +1404,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>>   	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
>>   	sd->internal_ops = &ti_csi2rx_internal_ops;
>>   	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> -	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>>   	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
>>   	sd->dev = csi->dev;
>>   	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
>

