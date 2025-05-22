Return-Path: <linux-media+bounces-33178-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6530CAC12C0
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:57:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA4E3177179
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0183719D88B;
	Thu, 22 May 2025 17:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FMUADXRp"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2077.outbound.protection.outlook.com [40.107.20.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28AA1A0731;
	Thu, 22 May 2025 17:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936627; cv=fail; b=L2nlQhnSNcgqTO/g1MKIezrA8sxzsdcvxA3PBkk9048hSzrXkaeMe1uNw5/hh8IGvAQRcCWi30aJslevnGsxlwdBXDSt2KpI58fXeEfLPdGKPTYuU5wFyeoq20S6tlNk05BTK4ouOhiaQRbD/lrOppSvqUbUyrcYNXYIf1bwEJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936627; c=relaxed/simple;
	bh=dBUlSJpzjbUmBTpr+2m1JOI/ns+3EB1YWtPIw2okfZQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=a/+g6/GbnHPWltnevz03TD4HrS/KsaAfzdLDo3y0vZnMYuvStlU19/S6qb/ICa6QcrobiDDE/8GnFbOWCQX30DnQEjfQzRaTpweNU5mrbZxX6R7J759vFIeryeQGgGIyKs2/vRi68m9uB+gptdokI9WYZqFMKJmHEByexuFC7jo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FMUADXRp; arc=fail smtp.client-ip=40.107.20.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wK8f3knRaup1h4mLMJIO0PsAT49ZpwuXXXdjb/V+zVhQfeGvAn5S7Cvgg0X3STG3miWL0CQxOCIUbW1/+zt9cjf5Ho/od2ZuaguNlt1mYP4NUnbteHagykufefBY2ElnCGR6+kXzJorpLrs/XKgojLozNhzYQs+mYOW6RT6M2PsjBtKygn5ZpQ6WekwNJ+sX7n6iVXtdumLq+8YEiFW4nLOsWLyAmyuY9g76FimVUllnjf1qekW5yltGiy1I83nzMs5UimKkxJX7yFVydS/wS+Wk5kpDZmpUM9ZI1g0OOfyu7aPaCpTLdiUTjuyKp3o66x+5WpuOQMDE70D2vGV/Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pqApBI42obYB3O3fG3EaQwfZiquOi9lcp1MJsN6Ortc=;
 b=OaUuHOCJJpHS42o+a678/iFnggS97UuIdhRo/JSuWm4HftZh5UdvBJebGdUFl+wgluOuGW1hcuOGZGg70AA9X30VDe3NX6hanAwRjzGG+81p/YVQxO/Eqj3DE81aj3aa800QVGEPJHIp2mrppuSAVSLQp2PiZkjBkjq72yzDm7Lqx69Fb7oZ+srj2oakDaCvXZIY3uTJKitErLPSNkcEPKg7uwAHie3cPSy5uEm1LpsxiYFKfktXfN6zztovxbj/15VkrQRWczbBLrlNRvN1Ens88Mv/S4UKalIR4VE9lD4OHWq+WIOEsZ5imcbMHL0y/4YyT65XrSjWnPvO6J/lKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqApBI42obYB3O3fG3EaQwfZiquOi9lcp1MJsN6Ortc=;
 b=FMUADXRpZV6QbT5iX9oAawiMLrfLjgS3nMqcdI+OsAM/bvSGE8l2NKIeqhOh7m3d8WLp+ysCfRxqG0IY2+b70zff7mE2454uePpg6B3EOcmzS6zNX/Wq74MsZ6WqeR9Mx+wFrgldQ+RajG2Dy9UJDOfmI/c+Yx5vJjEh1vKxGy7BiOUrdgcA5hiiX6FF38H9NX7H/WL4yTV3vzt/wk5+/T45AQXR/sU/Xd5W34jAJ71ZZ/PJjCkNihG87INkreNCnOBXRkskHJAXQA6GXLl4iEsYSFzLCtViVj5i+3PEe4wa7DLVJEsaCpVxcc8yDcj6FSGkJa7sk85XTkBSWxiKbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8779.eurprd04.prod.outlook.com (2603:10a6:20b:40a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.19; Thu, 22 May
 2025 17:57:01 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:01 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:39 -0400
Subject: [PATCH v5 01/13] media: dt-bindings: Add binding doc for i.MX8QXP
 and i.MX8QM ISI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-1-d4be869fdb7e@nxp.com>
References: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
In-Reply-To: <20250522-8qxp_camera-v5-0-d4be869fdb7e@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=8858;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=dBUlSJpzjbUmBTpr+2m1JOI/ns+3EB1YWtPIw2okfZQ=;
 b=Cs0TRZ5Or2Rl8IyxdSpev50bss5fxnKrWZYXPPaX0HHZc3UQylIJ8avK4DG0b+jqwdgxHCupp
 OoGvEPS7LoxDtN9n/cS5ej3ObP/4F0FCmiqdoDLDNn0Piu2WAOQGW+I
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0006.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8779:EE_
X-MS-Office365-Filtering-Correlation-Id: a2ceba71-5664-478e-60eb-08dd995a0dac
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|921020|38350700014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?aXdtNjU2MVFLZWJQbUVZN1VZbXlLK29iMjRoRmppN2cwbnZoUVZyYkNtR3pq?=
 =?utf-8?B?Uzl3VWEyeE9xUnB6UHN0VGljcUNNeExMNVdEWG5pL1FDOS9MN2lZRFNHWWtB?=
 =?utf-8?B?bVB5K2F0Z081OTYvVnFOaWFiU2o3ampOSjA0WUtVeEs1RHRkR1BpeUVhTXJU?=
 =?utf-8?B?Qm1wRmsvcitCWURsQ1ZHclBsNDlTY2pxQS9XYm13UFVmd2p1ZTVzem4wM1k3?=
 =?utf-8?B?aHhWVm5QdURidU1QWnZsWDhiMWcyeTRrNTYyK3YzZnVscCtWNHgwRlI1WnNF?=
 =?utf-8?B?TFNaK0k4cmprMjh2WU1taG1MOWVaUEdzOUdlWC9qUnZmUGRVa2xBYjczZFhn?=
 =?utf-8?B?cVJ3V3ByTWhJVGV0ZkVpVGRrRVFRSUF6UjA3WnhYRVVPNkJaMjJvdSs1REx1?=
 =?utf-8?B?VXZBenlORnZqaGxRRzZDeXJwM2tudUZvUnFzYmxXZmJDaHlCWHpuV1d6VG5n?=
 =?utf-8?B?aW9ZdjFqa3NPZk8zYisyV2t4Wm1RT1N3QytlWllQWUlpY200aW9VZDQzSXBR?=
 =?utf-8?B?azFBdWczdUpjbnQ2a0lTbmsxdHI2RkRIVjhvSzNZQmsyN0kyMy93TU55T1l2?=
 =?utf-8?B?UE0vd0Fzdnk4UjdoMUhPbGg2Y2JpdlVpc2o1YURZVzFWZHBwQkVuWm1UczIx?=
 =?utf-8?B?K1VaRldtb2J6OUpGVytUSGk1SWJvWTc1Z2V5RlU0SXBtQzZ0V1lNQjluTkVO?=
 =?utf-8?B?YkRrQkNkdUJzS3o3cU5WcEtIWHk0NDB4QlUrOWN3L2VzUW5Xcm5sV2tjS05P?=
 =?utf-8?B?dU5jREgrd3ZxRlp5N05mcU1rV3lhY256c0crLzlxaUV2ck8zeWtBSUpJdUls?=
 =?utf-8?B?R21JdnBONjdOQkVWZ1hpeEVpaVViakoySGl5N1FXMTRIWmpTWUd3RnZUYzBD?=
 =?utf-8?B?R3VHSjVzSERDcHFEMmZkTWFPdEtqbFlSbHNwSjRqRzFSMWhRN1pXZnFBeXl1?=
 =?utf-8?B?VXM5NjBrUkxKQXNCSG9HQTdDZzNqMHBMbDNxaTRENjdiL3BobWFIcllzM2NC?=
 =?utf-8?B?SWVaZzZxQ2twZ3UzZjNFdFZHMkFQTU9lcHhGaC9wV0lEYm5ITjdvUnVNVWs5?=
 =?utf-8?B?Z2xsVzczNDRoRXBBcnpQTHhFbjliYkNEMlQzb3lnQUkyR2ZEVXVVT2xWdHMw?=
 =?utf-8?B?YVRvK2FDOWhpZ2FFQUZGaXc3blNiaVFKWGpzK0YxZytNdVNSWFMvbFBQOFN6?=
 =?utf-8?B?VHZVREY2MnFia05VL0JFOURxQ2U5S29naDhzWm9IcWZ3QUtnZ1U5bW04TmxX?=
 =?utf-8?B?WE41UCtDRGxLMTlEZTFSYXlOU3p4clZEV2RkdHAycEJPbzk3dTNEWWk5V3pt?=
 =?utf-8?B?blVValhVNEJITG94YVNiQ2xrMVRDL3lMWUdqdWdXZWkwczh3bTZJcE5GZTNR?=
 =?utf-8?B?U2lyekljMSt0WUE1NDl2eVZVQ2g4eDJLWlBFSjJib3ZRbWRCOWNRQVhudzYz?=
 =?utf-8?B?UlpIMTJ4WjM1aUFGZGxOMHpQWCs5S3Qzd0NOWGppcnZoQmZKRnB6R1VXMHY0?=
 =?utf-8?B?UHFaRkFCVEFMRlB4V3cwUHo1ZldCWWc3Z0NVOHVPTkl6QXRmWmpIQnF4dDZu?=
 =?utf-8?B?RUZvUndtSWNqOEtHOGppWXFpdENFaTdjTVhLK2hYcFlVNCs2UldwNGp3cjh0?=
 =?utf-8?B?enhGVk1iTVE1NVdEa0JNQ3lPSnRwWVd2YXMrc1JEdnMvbVR4NGdoOXh0UUZp?=
 =?utf-8?B?eFpqaGdFK1h0T200dVRNSlNDNWpXenhGdTJEZ3J5KzVRZkZ1VngraDhrYWVQ?=
 =?utf-8?B?WXMwVEFCOG8vR3pSKzZydzU1ckVjdDFueEJJOVFlUXpjRlNtVXhjL3VxMmor?=
 =?utf-8?B?T2JrRzdhNzVPelQ1dy9XTHJYME5aTWM4Z3VTNHJLQU9xYzZNV2tOOWJiVTlD?=
 =?utf-8?B?cFY1cnBjcGExeXNuRGd0dTlGSkhZOFpvMUJnWUpHcXF3TFZFWmwvd3gvcXc4?=
 =?utf-8?Q?uSyn2D5PsFRk/pr8t9QqWZiJQ9kAcbCy?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(921020)(38350700014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VkpCZVBTaE82dy9JeFE0bUJBVWpHUnI3Q0paNFZyQ2wzSmcrR3ZaU2VXOGly?=
 =?utf-8?B?NS9DaVhqMk1nTHlGNGdUUlZ6MzhrNHFnYWFTZHBpblp6UGxLOXBJZHo5NFlS?=
 =?utf-8?B?dmFNVHB5cUNpcjZEUHAyMHBSUDJvc0dEcXk1VDFreFMvMk1Vb3J1WHEwMTQ4?=
 =?utf-8?B?aTlSWXZ5TGxJUStaaXBTZFJ5dnlscVpzYUhBWFVuUG40MVdrbUlQNzJhb0I2?=
 =?utf-8?B?RGhGV3dIRmpGRHZHVnp2WGxrTWlVVmc3YUN6dk42YUhrZVhGZUNVbGtwMUli?=
 =?utf-8?B?Q2VZYThIYW5ZSUtDMGNSL0dVeUZwSDdjNklMdytjZ3FhTStxdVk2TFFHN3Nw?=
 =?utf-8?B?cXBldkNEcHZWaTJIekhEeTdXUUxScXVOYnNxMWdPeUZncTVwZ2JIMTN4UjB2?=
 =?utf-8?B?T0ZyYlVRNnQvVWxEU1hVZDJwK1RQQUFDVW5HWjdadUw0TzI3NUp2VktEdXRC?=
 =?utf-8?B?RGsvMkN6d1pyTWhzb2JtbTA1bm4vRFdZUE5rU0xvTElJZVpPV0psY1RiS2lp?=
 =?utf-8?B?Z3Z0SDliR3BaSHI5N2xzZ1FsYzhzZk5iQnYzOEp3T1F5bVRlNFN6TmFheVhv?=
 =?utf-8?B?dUs5aVFZT3F0eStYWGpSK2crUktud0N2L0UvSisvbFJ0K2MrTUV4Y0xtK1Nl?=
 =?utf-8?B?WVc0cW05NGNSU3BYSFhBdnpRUDR2T0QrbGVVb2IxMUNTM093cDJhLytyUjlC?=
 =?utf-8?B?c0U5STc3VW1xZFp2dWhHV0dIY0t5aHBVY0o5Wm4wOEo1bTZhUjZXMUpmWG5U?=
 =?utf-8?B?TkNBRzN3ZmFjRkQ3Mjl1VHpwdGhXVFhqdDBtWEtUVzJaSU9oUVhOc0tjU3lS?=
 =?utf-8?B?VnU5R2pBeFVuMkRQWHNsSHFZQzU2LzhFLzMvREtCbVZRc0lpRE9JamFYaHdX?=
 =?utf-8?B?NFJ2MTdXNjhROHJDbStNTXNVTk9qWUFaeWE5L1NCdDYzdWZNTksxOTdqTnQ5?=
 =?utf-8?B?K3V2SXdIN1VKT014emREdmovZXA0Y0hNYzJGTDNWNWIyQzZ1Q1hudmsvWnBq?=
 =?utf-8?B?Y1ZSUzl5SFE4ZWNaNzM3WC9KQXZxVDY2VzFJbUpxR1cxV2tzRUVuRkhFVVZ2?=
 =?utf-8?B?aFg3VHM4dmo5SjNZSTJPMURPNDM4dDdlL3VZVlRQajBaWHRjR2ZRVEp1QU1E?=
 =?utf-8?B?bkdHVkFWRUhRbFJ6QlFvWXU5cWxYcEFMTW1CNXp3TFcwbWxZYXBKaXNlQW1F?=
 =?utf-8?B?WHMvWnVqMU5lb3RXSGRTcTAxd0piMmxMNFhIMHl2U3pwQ2k3RHVDT0Z0dTJE?=
 =?utf-8?B?cFB5OXI1R2pERzJ6czFkY2o1TXRZNVJwSnlXSy9kRjUzS3dJdzlFalpJd2FQ?=
 =?utf-8?B?bjNtRkVjRXJPaUlOMkhlRHpZNzAvRW9zaDVheWJQaVpZb0s4bU45Mk50ejhp?=
 =?utf-8?B?dzBsekVwUCtlKzU1MWFITWpiMFNnd1cySUsvVzBRbTJXM1NNbmxsaDlwM1pS?=
 =?utf-8?B?dFpidWFqNWVXY0V4NjE4aGFmRGM5dnNwVUtCeTRQNzhTaTIvZzNRU3VqV0xU?=
 =?utf-8?B?a2t6YnlGd0lGQjRzVUMxSllob1VxVEJ6NG1VcHNicmVkMUpJd20wZDhVamJj?=
 =?utf-8?B?R3VFNU5wUWVTQ1puQTJyUmtvUlNrOFVuWjdLOEFFWVBRek9SS1prVFdPY0hH?=
 =?utf-8?B?OXdsV0NIVmhnZitXV2xRRTFjVmVwMUF0ckNiTDNyZFd6MStQK21weVY2Q2JH?=
 =?utf-8?B?YkIzcUZOeVJ1ZUZXRXVZVjFLdzJqOXFhOVZkY3FFcjlRbi9KcXR4UWR5YVV1?=
 =?utf-8?B?ay96dWJQOXlodk96bDRLV2pyc3VJL0JIZmU2cFQ4TGVQcUI0OHAxNG5mL0ls?=
 =?utf-8?B?U0IzRklVNlZ6MGJ6MEE2MnpreFRPT3AwRkYwMzI2eDdxMU1iYUFLRzdxbVZu?=
 =?utf-8?B?ZGpYYUdxQWE5M1pCUzRSWWFwdTJqbmpHMmx2N21idTJFYlZVZnBqYkdJN2pu?=
 =?utf-8?B?NjZKRXRwc1dsRHVWOHYra1hNMy9uQ3lxY3hWakZwL1JVVXlzZjVPZmdrRGt1?=
 =?utf-8?B?cVhzUnc3OTZOVjNKek5nTzBXNmV5NjI3SGdyNHBTdWlVejZRV0FEU2lSN2N1?=
 =?utf-8?B?MWtrVmh1NFdCWSt6a3hFS080UmlaWC9DeXB6Z1JOb1Rpb1VzNWhxVmRweW5j?=
 =?utf-8?Q?HvSininHhAnNP22Ryh2OXuZwy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ceba71-5664-478e-60eb-08dd995a0dac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:01.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A11vMwcS/gu1/RJw/A9208zlFWgqq+w7kUQXsuhz601QKMq+gwvt6AmRCvOihxxEJt8Ouv2auYs5C9iipGbSbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8779

Add binding documentation for i.MX8QXP and i.MX8QM ISI. The clock-names,
power-domains, and ports differ significantly from the existing
nxp,imx8-isi.yaml. Create a new file to avoid complex if-else branches.

Add new file to MAINTAINERS.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v4 to v5
- none

change from v3 to v4
- Add Rob's R-o-b
- change qxp clock/irq/power-domain to 6. (QXP C0 change 0, previous chip
have not production).
- fix register size to 0x80000 for qm, 0x60000 for qxp.
- fix qxp's irq number and clock

change from v2 to v3
- none
change from v1 to v2
- create new file for 8qm and 8qxp accroding rob's suggestion.
---
 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++++++++++++++++
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 106 +++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 224 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
new file mode 100644
index 0000000000000..93f527e223aff
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx8qm-isi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QM Image Sensing Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Image Sensing Interface (ISI) combines image processing pipelines with
+  DMA engines to process and capture frames originating from a variety of
+  sources. The inputs to the ISI go through Pixel Link interfaces, and their
+  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
+  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-isi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: per0
+      - const: per1
+      - const: per2
+      - const: per3
+      - const: per4
+      - const: per5
+      - const: per6
+      - const: per7
+
+  interrupts:
+    maxItems: 8
+
+  power-domains:
+    maxItems: 8
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 0
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 1
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: HDMI RX
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    image-controller@58100000 {
+        compatible = "fsl,imx8qm-isi";
+        reg = <0x58100000 0x80000>;
+        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "per0", "per1", "per2", "per3",
+                      "per4", "per5", "per6", "per7";
+        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH1>,
+                        <&pd IMX_SC_R_ISI_CH2>, <&pd IMX_SC_R_ISI_CH3>,
+                        <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
+                        <&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&mipi_csi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
new file mode 100644
index 0000000000000..bb41996bd2e36
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx8qxp-isi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QXP Image Sensing Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Image Sensing Interface (ISI) combines image processing pipelines with
+  DMA engines to process and capture frames originating from a variety of
+  sources. The inputs to the ISI go through Pixel Link interfaces, and their
+  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
+  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-isi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: per0
+      - const: per1
+      - const: per2
+      - const: per3
+      - const: per4
+      - const: per5
+
+  interrupts:
+    maxItems: 6
+
+  power-domains:
+    maxItems: 6
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 0
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: CSI-2 Parallel RX
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    image-controller@58100000 {
+        compatible = "fsl,imx8qxp-isi";
+        reg = <0x58100000 0x60000>;
+        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma5_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "per0", "per1", "per2", "per3", "per4", "per5";
+        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH1>,
+                        <&pd IMX_SC_R_ISI_CH2>, <&pd IMX_SC_R_ISI_CH3>,
+                        <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&mipi_csi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 0cb9e55021cb8..c4e0b88f58309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17853,6 +17853,7 @@ NXP i.MX 8M ISI DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
 F:	drivers/media/platform/nxp/imx8-isi/
 

-- 
2.34.1


