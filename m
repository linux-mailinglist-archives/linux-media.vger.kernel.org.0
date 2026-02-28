Return-Path: <linux-media+bounces-53809-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEjLMYCIomkd3wQAu9opvQ
	(envelope-from <linux-media+bounces-53809-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:17:36 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A93D81C083C
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 07:17:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 35066300C304
	for <lists+linux-media@lfdr.de>; Sat, 28 Feb 2026 06:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8DA33ADB3;
	Sat, 28 Feb 2026 06:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KfElRT3g"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76F933DED6;
	Sat, 28 Feb 2026 06:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772259422; cv=fail; b=D6jk4hkyMyR38OxR+sEaspLwXJ/OWmMDlTIjWz4BYNyjF4MukL6gxctSQ6YNCJog5fQjnI3RVuzc4WqifsjAfnn2f2m44evSD/xOwTwHSp6+ZG3KjcEw0MW6S9ug12lL+TAw76nbsvFd9+49C6YAcnQVF3JhRWqI7/7kpm6Z4z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772259422; c=relaxed/simple;
	bh=o3WEJQuvBSglI3gOb6xhO0qM6yjqfrXmqB0glmBDPWM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XhVTeOzSNVKZkASavyWdZMVVm+Rp10LyRdDec8jaFGw/6XLW7jnMBaYQPnXTpUFeSsWu9IZyFwMJA+gx/UsIIPOcHDyDuoPvRC6Y+h36yMrLQEHi1f1D4eDiaExUlYjPpvJsdIng0A9MMiEZVxONEyvWNXxaa82HqPtjL9kEVMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KfElRT3g; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIEb+cuQIVV1+nYEEohT4BWB1avniA0c7Mu0tkeEJSuqjjEvmZsWGEnZuXG+M4gf3jhoty6sZnlP1x3NQSnGy5uVYbU88YB5mdCNilYybBw9t9emi5ewakZGj7N6OO5qm5ms3VZtqjYX2QEflLG52eHQeNv46kIADdFpohMV0eGLfKb2L+ygl01UPieC9lFzmmG4+N7xV3WpffgqZRjy1aBvYeWYeEbt47v3b/ZoG+HoHyqN6uWZ/JdPnahBIqLhU69dvyusfQgQcsKBJWEs3eaKKWFzsLgXP1+TTQVXE9QqACRXVDuCmif0Vql4Nilvr4VU/WYa7/qC/jSPeqo4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lgw5A27Fq/Xmmk6axnGp5p4AdQD2aNs3UIv4EPtH1BU=;
 b=V+PNbjc5MX2oIgmlaiqpl6JJVZR+JqxGn5lhTIkYj/oxpPP/PWa3aseD9hxJJ52Zsof43RKgkCX9o/ewc17iMOREQhOXvynqgEN7vY1Hh0id4BQtnafOW/5Z8I+zIES69ueiSzymFo5WCFAbgDR8NdR+ZNuTAJUdxJ0/jW6bHIQmG4G8F94pZGSKPpwtB4YmKWqvePQWwDOldiFtS7DEEZgUdnE/d2GgHVuh428N0MFYlaHeX1DPuIJccwPlg1DckY0AT5RX62XjrxYoCRamGEZDmhIo9dY7RDnVV0t3DuC9u+41uVNgjz4SXccY8EpxYmZcRJvUPOGWVXaGvWqC3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lgw5A27Fq/Xmmk6axnGp5p4AdQD2aNs3UIv4EPtH1BU=;
 b=KfElRT3glr3rvzvCjP0/PNfMwEdhzQITHJzbNHwQZl/6hvqKs67abBnDIwS82e0SvuIIk1D9J93eiPDXMX7pF5DRJZ1Bw1ocf1BsAHXO7mT/fdUOZ0rDgBO+DtR/zsoe0pKhXt4UGYvsdOdgDciBGwxKD5gB4Z34ue9cqvgRTNbR0VxKdaHWB3m5aib9mjKQGhD5VVcLVjZ3qjUwIXE2Meb3aW9/DDf0jReqL4fkFOAX75h6i06bPjfCJRyt6xW3SlM2saQXAeRouVT0M5BURRtAHRJk4Mjs0oDUOsV89TGOfSQvyJXQEvu3jH3w7lj8RC93CXvPr4lF29VxR1Eh+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM8PR04MB7460.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Sat, 28 Feb
 2026 06:16:57 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%4]) with mapi id 15.20.9654.015; Sat, 28 Feb 2026
 06:16:57 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Sat, 28 Feb 2026 14:18:22 +0800
Subject: [PATCH v5 4/4] media: i2c: ds90ub953: use guard() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260228-ds90ub953-v5-4-056cf07cc8f1@nxp.com>
References: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
In-Reply-To: <20260228-ds90ub953-v5-0-056cf07cc8f1@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772259522; l=3324;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=r/v6tcNvULydFHfDTrfblx8lKA6B3paTS1RqF7h0x1o=;
 b=TJZUm9tYulnNw6ORW1jdwiVBRxwQhtOaZdtv53pzOVEF1vj5Aa5Aneh2uaQoB/W4MtN2bMQYc
 wOES8E2itzyDrgaKtEKzaLPphiKJstueIToduSded1YcvD+w3KRz3k8
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0026.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::16) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM8PR04MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b169fa-e5e5-4f8d-a9c8-08de7690f99f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	J/4vSGVEi98Kfn1ZgDNSYBTgbrWzQ0Vhra0rTEoGffjF8S4hg79kcC/2XengNjwLyEvfRdR0tVS++br/vMa4Xjv3fRYiEtAWx3C0HQvzVMC6sHNPF3WItgMrm0qbnMpN7CP/0Vba1Jn+bdu+sLrUgd3YHpGfOpb5wuB/tf0HMsieXmGRc/DgApUC2v6eyJVFJzHpyU7T3pshjx/vHZHkGwDUQ01jR9WbcKGyNamIVn//g4XA5jvSKQCZW+CDl+tR/+XkhUX8KwQUpBazKuV7yfrb0Nr4n1oWH+XzR9wbuyAJzTYF0vod/Digv8YVUnpLBuBz7BiJHRgE62DzzwCsQU9Jkcw34iZSRAd7adVtoLJ5l2pEPiYIFWT6VI0lligUzdK/E676dxS2k57Nn65CQjcIuCQ3k8yIem0CW+eHSmIhsDkxqFHh++4vU/jnimLlB2QO4HGPrl6pvnBaWVmWxlBdGIoNPE6bPs3sD+ZbNIynK+eSeK6zUH5eTvMN48Lxz8SiCCN2CkXWhAEeW04H6RLsCdUJrz1IUv6pvu+CYfLFObOr25N0AXud51gxLx85Bk1gomejYBJWxZzhww3iCqkuT1w1ID4NjWrLvlLKnsqjn7LHMkUxlRLDQYeuZV+1OmAE8WEa5p63bJzqkrg/u/ucT2W+HO3pwtqn2t9CiPy6tdDNB75uoJwY9OfLHQJ0+Ji5L/yJkhuw6KJjv8BhSpwejws9vuOLadhPj2CCziuPWV0s4XHPy25ozKHC9w9urowge+9bA1aHdwjrLlWKoiNv/5pGgSlbXXJRnc3inMQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VFl5M1k3MlZjeXJXd1ExOTltL2YxZDhiaHQrdEJuck1NMElyS2krZDFZQmRI?=
 =?utf-8?B?UE4xd2x0cUowd3pqdUNkVGREVktoT3ZIMi9lSkZoMDRHc01QNUVHaTJHdEpa?=
 =?utf-8?B?aU1NOWMyYzNZVjRPUDErQW03Qmc1RWorb3E4dUoxN0xIMGVEYWxQVnMvaTdj?=
 =?utf-8?B?T2ZwaTBCTEdTSmpLYjExUDg2c1MwK0ZTMmMzWlNUYm5SUkw3VnpMcmxLaEdE?=
 =?utf-8?B?QWRTbDBENWNhZkE1Mm9FSVlPa3ozbWRENGw3Y2t3MHF5TmFLTXdvZzhWZXgz?=
 =?utf-8?B?SnNQRlpuWXBmSFFVUS9TdFN6cXpGQ1FFbFBmaFRwNFBxV3ExSzkraTZhUzI2?=
 =?utf-8?B?ZkU3MEluODFMNzB0YUg3bEVqZGh3WUhBNnZJejJNN0I3NjNpL2F0UDk1clA1?=
 =?utf-8?B?eWZsNFVmMmdVZWZBSk0yVFczUVAreDRYcEZ0elFzSkVhYXV6VnRZYXJBM2dn?=
 =?utf-8?B?RGJEaElDV1JXUnRBSkQwYmdVa0dhckNNcTZRRkVLaGlLVUpJN3MxU0pFNDZX?=
 =?utf-8?B?TjlWbU5FZ01rMGl0RGdBcVlyWXJOQ0xSYXpBTEJYS0VSK2VSZDlHWTc4UFVY?=
 =?utf-8?B?TVE5QjN1c2JEKzhNYlFZOW80cWhtWXlEOWV5SjV5emdTZm9GVHloVmg5ZVBB?=
 =?utf-8?B?Qy8zSDBHMXBoQ01zaHFYVE9sR2o5eVRDL0xpMmw1ck12SEVtWEFmV1hTQ3gr?=
 =?utf-8?B?TnNZSmdQS2ZYdjR1eUhBOENuakVwbGVpeXhiTFkwc2E5SXU4U2JWTFZUNGE1?=
 =?utf-8?B?WWVNb3A0MFI5RThOcVRTWE1BMmUxUVNxV0dJZXdrUVZvT0RRYVpFcVBRek0z?=
 =?utf-8?B?QjZOSU40b2hjcDJ3Wnh4WlZpTGlId3ZlMDdKUG45alh3WURnZGtWc09YUUhv?=
 =?utf-8?B?SzJZRGZyZzBBTXhrMEZLMG1wcGZWYVFzQkp3VE9xbHJEWnNEWDBablNKcGw5?=
 =?utf-8?B?akVYTGZISGJjY3RmaUtwMGhjZTBZQjFNbjhPV2pGL0NTZGpMcmRLWU9jMUli?=
 =?utf-8?B?S1RUMngzUG9UaTkxYmJhSlc2L2lrR0U3a2Ixd1k4NHNVclJDcjUvRE1mZFYy?=
 =?utf-8?B?bVpEV3BQWFdyMlpHcXNxQUpjM28zOEJiaWpuNitnNDhDTDNHcUs4SEl3KzFS?=
 =?utf-8?B?UGtsWE1LNFJzaHNibDBjRlFRTDQ4eEhKYVBJWUM3djA1Z0hiaC9ETXhNNlB2?=
 =?utf-8?B?a3lBK29HVkF1NndOajFKV0FVOFJSTW1uYnI4eHgzNlJOai9yNkJXYXBQemJw?=
 =?utf-8?B?bFRwS1ZlL2NBak02Z3FHQVpjY05IRDhwT1dLdE0raWhTZmg3QnQzMTRNOXEy?=
 =?utf-8?B?RnQ4OEcxbTJsaGhIbDFUR1ZIeXJ3a2syMmFuV3RBcG1qbFlVejAxOW9Pc3V5?=
 =?utf-8?B?RVZlRUd4ejFDK2dlMmRZbk9OTWIxMjdsZ0d1Kzc0a1ZPS3ExOFU0VHlURzky?=
 =?utf-8?B?OEVkSHNObmVVVEhGOXU3Y1F2UXc3LytaMmt3UGdGeUFKNWtjTkRtU0pBZE9H?=
 =?utf-8?B?TGpQNzNrR3ZuY0xzTDZVUFZ0UkxreitNeVNYWDlIcWxWV1lEbE80Y1hOUlM5?=
 =?utf-8?B?REtjUk0vL0V2SkJTR3Ywa2FvY0t5QVVSb0cxZ3ltKzRQajRUQ1Nrd2NYQzB0?=
 =?utf-8?B?a1BTc21IdkY2bUhDNzJxTW4xTzc4dmpvNGxNZGpaTUhaS2o2WHFobDRKWk9I?=
 =?utf-8?B?dE5oTUVBditKOEJRUlpxY3ZEZi9ONXozWmszKzBlTmVkdEp5cjIvdzFlK1Rv?=
 =?utf-8?B?UTJMM01kTUtLOWtUVTJOQkxUbFN4b1BkdmJqQzhNS2xxRkM1ZnROdmFpVnlC?=
 =?utf-8?B?YTlrSlRVSSthbWE1YzU0d2FDZ2Z3dTh3bGlkbzlqMTBnRkV2TXFnbkJCeUF0?=
 =?utf-8?B?NVp3MlNXNWZDZldBYXVNazVVUGNTMnZ5Ymh5TkJkeHJFR1lLWWUwSUNERFlZ?=
 =?utf-8?B?Rk5RNEw2UktOcGsxSURyVVN4c3lVZEZteFhpaUtKY3MwUTFGRTJDcUVUemZa?=
 =?utf-8?B?MU9ISGYxUlludHMzZVFXSGxGZElBc1A3cTNwazhrc3kzMmREQk1iQTdGbCtS?=
 =?utf-8?B?MzlSTmhjNVQ0MEJsNTBNdEFVN0dHYWc2WWxkQlpTWXBweFJMZGw0cDJZYUh6?=
 =?utf-8?B?UnNHTnBwN3ZsQUQ1aC9CeUt5R3hoREpObzNjVGNiNXlDT3YrNngzeWJLOTho?=
 =?utf-8?B?VGFqUFViV1VqUU5xbzh1N1JPb3ZjMWJjcEdaRm5xa3pDejQwR0o5VUVRdTlF?=
 =?utf-8?B?ODAwU3djcUNkQUR3dG9kYk81MDZBdkgrMkJtcGdjSThkMklNWXovem9XT3hO?=
 =?utf-8?B?WkVPRU1yOUt5eXpBN1NaVjFIZWxTTUVrbzlkMlVYeHcrdmhRcjhrdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b169fa-e5e5-4f8d-a9c8-08de7690f99f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2026 06:16:56.9677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51SFvRgYN2yWxi3JUE8EAbEvrDpMa7tj+WJ2/lMDHUpOZzgs3F55vGdIr198f7NlNSKJL3c/LsGsro986UEYbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7460
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53809-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: A93D81C083C
X-Rspamd-Action: no action

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Use guard() to simplify mutex locking. No functional change.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 34 +++++++++++++---------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index a85c6a9b64070491db161ca1586179dba9c69cb0..3a459687aefce05ac025a517c8d4cc6d76cd7293 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -113,20 +113,18 @@ static int ub953_read(struct ub953_data *priv, u8 reg, u8 *val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_read(priv->regmap, reg, &v);
 	if (ret) {
 		dev_err(&priv->client->dev, "Cannot read register 0x%02x: %d\n",
 			reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -140,15 +138,13 @@ static int ub953_write(struct ub953_data *priv, u8 reg, u8 val, int *err)
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = regmap_write(priv->regmap, reg, val);
 	if (ret)
 		dev_err(&priv->client->dev,
 			"Cannot write register 0x%02x: %d\n", reg, ret);
 
-	mutex_unlock(&priv->reg_lock);
-
 	if (ret && err)
 		*err = ret;
 
@@ -185,18 +181,18 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
@@ -204,14 +200,12 @@ static int ub953_read_ind(struct ub953_data *priv, u8 block, u8 reg, u8 *val,
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_DATA failed when reading %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	*val = v;
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 
@@ -227,18 +221,18 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 	if (err && *err)
 		return *err;
 
-	mutex_lock(&priv->reg_lock);
+	guard(mutex)(&priv->reg_lock);
 
 	ret = ub953_select_ind_reg_block(priv, block);
 	if (ret)
-		goto out_unlock;
+		goto err;
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
 	if (ret) {
 		dev_err(&priv->client->dev,
 			"Write to IND_ACC_ADDR failed when writing %u:0x%02x: %d\n",
 			block, reg, ret);
-		goto out_unlock;
+		goto err;
 	}
 
 	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_DATA, val);
@@ -248,9 +242,7 @@ static int ub953_write_ind(struct ub953_data *priv, u8 block, u8 reg, u8 val,
 			block, reg, ret);
 	}
 
-out_unlock:
-	mutex_unlock(&priv->reg_lock);
-
+err:
 	if (ret && err)
 		*err = ret;
 

-- 
2.34.1


