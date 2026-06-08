Return-Path: <linux-media+bounces-64234-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yrPZCWoHJ2rUqQIAu9opvQ
	(envelope-from <linux-media+bounces-64234-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:18:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43CA9659A03
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 20:18:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=qpOhnER9;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64234-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-64234-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4DA330221AF
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 18:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D2B3D9DA5;
	Mon,  8 Jun 2026 18:16:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D65382F26;
	Mon,  8 Jun 2026 18:16:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780942578; cv=fail; b=qp4OP3aGpbrllu2VGgYFd8bUFSVpOw5rR8sNr7GFGG9z0q8Njo+4CGTPO7sAsE5FcTp7R4eRl9D/iVk7kS114KsSxaVNXgL7vThFk6kwOzeWUNsu/LZk/Q5eRcMYZ5f3ZZ0ZUsUa9kR0mYzDyB6aU5U/RJKzXwEjkSqgVYuqRpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780942578; c=relaxed/simple;
	bh=Re63xzrpE2zYbSNo3n8kWka8C3+7gl/cmGbXQyND3kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RENrOpStcBvJAw8zSOGg/veFRtEoqp6BAH9E/0BFXHm3cieY8WdlSgmqEGpTNHG15QK7UWGwC+fhdSPADRI84DMc5UpqiKzrNJ/ML43asXFBXjr+lOy2nsx7z6cqhLeWz/Z38h+QNI7o25BVNpl5i6QNcpATcgLLDk7I1SKpzpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qpOhnER9; arc=fail smtp.client-ip=52.101.72.20
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xmAJ4TAorFy5UJTqpMu1y8mFG9dcmJEeIe/3HoZL8MTJZM9yGrBxEMFTca41/4OXaZ5vOW5rZ54o0atK0C8/Ypu9BgkrnYgQ0D25PtbhHbCeIkX3xaA59RZdP2ViCt2sBCC/DJuXaNLrkaRVcPSgYSsyjDPVwUdD0YqJ7qhF3vKGOdAti4EFeNrB2opReAB1XS66yTOe+nJmXCZAuaygyhjCDFlRpPr1lQ/VM1eHm3hRhBooGev9xaW4suFZE6ZKaYRxmVmZ4Kcl0VQdOYF/FWx04S81E7VfNixmYDJGtQAGanT7zjx/S5NZgMSKRNR7XIZL/9IgDj9mbvJJe+gxjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GD7j8q55WTq6X6hbQPlYQoQNxgr4xEYMfKeQiDy83to=;
 b=X/i6njoClhTSar+2/FOh/1pQdIJ59SZOsTJAURHeVIPNLkv66zwuX9Z+jG9sVuvSjFkEHlLcyAuPPR6sECiRaCbTOgE5KlZ0vQolQCBGb1Df8yCnru5qiHUWx5qnqP6hbsQ715Cf1f6NOdGkBk165UnQt75bCcPWkzFeoyVIVkrjrfCWne0jdJa0FdApEBMJF4fO/hbOUN0ea3kbT8fBt6D4FxfJ0s+kF2nt27+p8Tc7uqAV85shEiwFL1iYk61yJ93Of5t3JKbmNoWbdo9fYPPougCd+tNhfenrhgKb5amIlZ+cm6P1RNaQ1aSmwT6cTTk+ujhB8lDxftzzqZL4Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GD7j8q55WTq6X6hbQPlYQoQNxgr4xEYMfKeQiDy83to=;
 b=qpOhnER9MqXP9b+olcP03oCURxwjhhFc325q3MaA/jy1XQ1Qde7DtFQqBshgQWaNOlEsqcq8zHUMBoLPQwyUpLEryjQKkcf2rBSJRs0DbASU93ZcwPfemgyaI/Ej6loDpAPoOis8hqDNuylO6Dyh0SVnwgk2bZ2e7B3Hh0xX2tPjM8mFcax7HOFl6OZyokhbLIR9SecBcusZDaOIy3pKAaulsAmF0Ar/Ii1tfbxVLPEUyyNTsScEaR9iTM7wglJa1PtDR9yZ2bY4ctsDShJkoURFpbiwwJUWRJ4K6HE9RHfkS1Z2fSGERMB4Zy6ZrlX8ITLgKqjj+wK/13Xeqb3C8g==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11637.eurprd04.prod.outlook.com (2603:10a6:150:2ca::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 18:16:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 18:16:11 +0000
Date: Mon, 8 Jun 2026 14:16:06 -0400
From: Frank Li <Frank.Li@oss.nxp.com>
To: David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
	Cory Keitz <ckeitz@amazon.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
Message-ID: <aicG5nsTy7rIuWTc@lizhi-Precision-Tower-5810>
References: <20260605-qcom-cphy-v7-0-426c37e9008f@ixit.cz>
 <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605-qcom-cphy-v7-2-426c37e9008f@ixit.cz>
X-ClientProxiedBy: PH8P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11637:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b386390-835e-4419-340c-08dec58a0515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|11063799006|4143699003|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Nu5ZyjBXN1YBX612cj/KD+pCm5gYQVjCON+BhvZOKqCzJMtJVyFWuj6quopG49YRWKiTstu72WEUNKVBtubAD4+1Z2TOLggsXpB5Iq8muxUa+Nv89pOugtF5WxEhF0xdv8i2bRH5dwN9cFIcPL3UE1iygnmLbQ3X8j0BQKZMFbvTm5zQwg12L/bHvsh/9kEDynQH0nLw52IxU5YzNCIO5m+30uL6TqeOoIaq7/MHgwJTAhyh4t8gc0dDE1MSqn3QEc73/cUtcdIx+m8ZShGRL2aTd0m7AhW2LpKLu5mYxkj7DUr0GzXV2IEyqr+Owp0aeroUQgj9cQgLckbPqQI9UXNsS9G3re1fX9zruKsQjqyI/i6qURNmhzaSny1O6mrKdZDYwkkmuTVJiS0Pj7H2R/fX2eFI45hcItysnzzn0c9r4oef2n45o3MU+TwtseRbGr0Wx4sEU0CnFDmOkYcu+JXk3jWt5FgBFgLgeXbDvMm0TVuHMQjbUQpeE6DS8J9YqXjPKw7n3JQj6dSCoWPRCqjjPJ4ea91mnzaewG4nGzSLwgsIcW4AhUn3xI7C2TJo5ZUiBR1fsMtjuJIeC6qV9ybI+VUTfnTlmF1fO60SatQYmGUm0GUAvQ3ywWgYNiTst/1sSuFrsHWCau61nmdHqvXj27R+OO55yUsGWoCtyaKQLrkEtK/MSJsba1aojtCZ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(11063799006)(4143699003)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?AI2wJ73fb6fLHWlkHdqAGAGESh0XH2hdXf06fwpsPa+PRge0w6DiPV51I2Lz?=
 =?us-ascii?Q?8sa1dKh7pCxMARcmkQaasCpywr1we/QApuXMygiOya2hxVoa0FmL/ZLBGXHk?=
 =?us-ascii?Q?xPdcIAbMOc8T8VDfV5J/o6ZZKDAGcajfJtL76oitOs2yYuxmjDKm1oZlJbdm?=
 =?us-ascii?Q?dxvpqgcPrh/7AXVAh37AF92p6OHS+upUxcueNbm1MP56s+feMlzYzgkjFNRP?=
 =?us-ascii?Q?5QCidk0c9xEmQ6P8+dn7bTG6WKr8m771gCa0N8kUkZYpEc6eHTpJHO/OR7Z2?=
 =?us-ascii?Q?d5G3eO4iG0mQzH6RECqBRl3kEZmWY8taFsO3GTl0SiCBwPWUXK477SPIbwII?=
 =?us-ascii?Q?wkhlKo7V2Ztr253nc2pkyiyM51l65owRJAxIVAxjxNfFCeH9OmzcbcJPICAZ?=
 =?us-ascii?Q?drgUKi2zlLrttY0JhzPpMjvcMCUAPmJn5hD31QUEdxawKm+Yld/T/Kok1wms?=
 =?us-ascii?Q?KV6X13onAMhaqRrab4rdPFAkZMLg6WKyzlLnyzDgPFw4TtwuK4xqwOsK6mld?=
 =?us-ascii?Q?FQfqrKsSgqGO3ahEfuircdVdIj6wvbP4ZpIWb8PqPsW0/9dZQQSL2xZRKa7B?=
 =?us-ascii?Q?R4Zcs7kLP3ELHrVZLnFPwVBETh+UG09TGrNGhGh7Z9am2z3aadCfTZzlenzk?=
 =?us-ascii?Q?xTidBXjea6yc6nbVXK5/76YU7I4tmFf/83xDIv/zVoE4/YTpo9dOVee/lyF+?=
 =?us-ascii?Q?vVFnmuJFbR2mK5KxNtiiDnanADObT1vTS3nbRBJU8XZnsHwZPNnkN/wfy+RM?=
 =?us-ascii?Q?0PMYTcuJq5QNtwa7bZbMI3CfJmzuIexkVhDEDPBocM8Q9V75hgcBCk5y7xFA?=
 =?us-ascii?Q?ms1AzqIqxnEPr44k/9yEuZ4LypTawkfbJeO3RdUOwxeKQnJc52nJnnWOET6Z?=
 =?us-ascii?Q?7lnrJEpfqlMfhxdbWUG7XVwsENQLGTr5Q9ryiO9z4QndC1vDtHM6Zb1LUEIe?=
 =?us-ascii?Q?PPRU9wkPTVJEFoozDpuK2eKHXKfzZu65Z3R/aoBYC/8TsSamYESpPYVuZv/y?=
 =?us-ascii?Q?GBmNJV0zK52ckfkdFZfEEhjAKXUQrz9O0JtQWzndm4u7CY4wTG1BH/XqOZfJ?=
 =?us-ascii?Q?TJZJhUEZGQ0AIscmK5swO2u8Pvo9IvdyZDL5ZDO/JNJaSOYttwz/o0aDDuBI?=
 =?us-ascii?Q?oFyft/Wxd5iXLEtDL2CS+w+D5nBjKBaAvnPfi/6Ow5/uIAzCayNa3O96tILX?=
 =?us-ascii?Q?IPq979jxYP8FFGEHQb0jnKn/ZyHJRmyWoKaPjDODaQ8VGMVvCni0TXSYZeZp?=
 =?us-ascii?Q?oTtbNNXGAt+o1ekXZg/G3U5kmFDr526gnqiuYdTeO4GaPnC69MOq6vfhVXgx?=
 =?us-ascii?Q?kbTtqIsD1DS4JhxayR8vUjuZPhiMgbwq3tFh24Y+NO9mwy/PfLjgcf/yWUzM?=
 =?us-ascii?Q?4tpSCV0TbkKi7Ra5HehYF0SdJhljmcXIPgicyTGJV4GsEJ5tg/1BZhontgrQ?=
 =?us-ascii?Q?QgZms3HVEGnHYE1e9NUcFZchxat7KeAGzrAPvy3n1Gl5fgVtTr9249UI6igr?=
 =?us-ascii?Q?KoNA4Vsxzf+fUpjT/vY098bwdEEGIoX2NFf6bDfuoKQSMdoAyHoToXVPYA3O?=
 =?us-ascii?Q?luT0dKJ7Kzz+aP5v9PZ16PNJf+NNOkaeof4gv7YrBwfmY1DSG7Zb2hG6W7cb?=
 =?us-ascii?Q?VUc2YYww8L8twQulP3espHOSgm/Z+Qief+/lExUE60lC8Q2rZ4LjxA2kVIAd?=
 =?us-ascii?Q?C0ComY/rF/16KvXbPOSa0EZjfLSnOYzHZVWEirQ6R7mxCuEUuVes8RFgX8HZ?=
 =?us-ascii?Q?5BitA7W1RxtP/K9iyTOT4xjGwpg5ZrBvZDWVX0rN5Z1ugc3YBJwH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b386390-835e-4419-340c-08dec58a0515
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 18:16:11.6836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omY4DUjNy8YQtprsfKVfyWlgzClXQn1Bz1RohhUsjnW0eCWjidOzf6YqKS+Ap49YA3wPC4rJcPsu8Mj2zDU95hHSp3rZTh3XbyzEt0OQRLmcHaprNBUCaJFSzeK53Wq4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11637
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64234-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:vladimir.zapolskiy@linaro.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com,nxp.com,linux.intel.com,vger.kernel.org];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,lizhi-Precision-Tower-5810:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,ixit.cz:email,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 43CA9659A03

On Fri, Jun 05, 2026 at 03:14:40PM +0200, David Heidelberg wrote:
> So far, only D-PHY mode was supported, which uses even bits when enabling
> or masking lanes. For C-PHY configuration, the hardware instead requires
> using the odd bits.
>
> Since there can be unrecognized configuration allow returning failure.
>
> Acked-by: Cory Keitz <ckeitz@amazon.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     | 39 +++++++++++++++++-----
>  1 file changed, 31 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..fa24fc9706748 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -9,16 +9,17 @@
>   */
>
>  #include "camss.h"
>  #include "camss-csiphy.h"
>
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/media-bus-format.h>
>
>  #define CSIPHY_3PH_LNn_CFG1(n)			(0x000 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG1_SWI_REC_DLY_PRG	(BIT(7) | BIT(6))
>  #define CSIPHY_3PH_LNn_CFG2(n)			(0x004 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG2_LP_REC_EN_INT	BIT(3)
>  #define CSIPHY_3PH_LNn_CFG3(n)			(0x008 + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4(n)			(0x00c + 0x100 * (n))
>  #define CSIPHY_3PH_LNn_CFG4_T_HS_CLK_MISS	0xa4
> @@ -1108,23 +1109,32 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>  		writel_relaxed(val, csiphy->base + r->reg_addr);
>  		if (r->delay_us)
>  			udelay(r->delay_us);
>  	}
>  }
>
>  static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>  {
> -	u8 lane_mask;
> -	int i;
> +	u8 lane_mask = 0;
> +	u8 offset = 0;
>
> -	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +	switch (lane_cfg->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		offset = 1;
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +		break;
> +	default:
> +		break;
> +	}
>
> -	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +	for (int i = 0; i < lane_cfg->num_data; i++)
> +		lane_mask |= BIT(lane_cfg->data[i].pos + offset);
>
>  	return lane_mask;
>  }
>
>  static bool csiphy_is_gen2(u32 version)
>  {
>  	bool ret = false;
>
> @@ -1155,19 +1165,32 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
>  	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
>  	struct csiphy_device_regs *regs = csiphy->regs;
>  	u8 settle_cnt;
>  	u8 val;
>  	int i;
>
>  	settle_cnt = csiphy_settle_cnt_calc(link_freq, csiphy->timer_clk_rate);
>
> -	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> -	for (i = 0; i < c->num_data; i++)
> -		val |= BIT(c->data[i].pos * 2);
> +	val = 0;
> +
> +	switch (c->phy_cfg) {
> +	case V4L2_MBUS_CSI2_CPHY:
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT((c->data[i].pos * 2) + 1);
> +		break;
> +	case V4L2_MBUS_CSI2_DPHY:
> +		val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
> +
> +		for (i = 0; i < c->num_data; i++)
> +			val |= BIT(c->data[i].pos * 2);
> +		break;
> +	default:
> +		WARN_ONCE(1, "Unsupported bus type %d!\n", c->phy_cfg);
> +	}

can you use similar method as csiphy_get_lane_mask()

Frank
>
>  	writel_relaxed(val, csiphy->base +
>  		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 5));
>
>  	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
>  	writel_relaxed(val, csiphy->base +
>  		       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->offset, 6));
>
>
> --
> 2.53.0
>

