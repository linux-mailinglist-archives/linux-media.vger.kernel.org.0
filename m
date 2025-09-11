Return-Path: <linux-media+bounces-42271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B92B52C15
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 10:45:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55658169444
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 08:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C7C12E7BAB;
	Thu, 11 Sep 2025 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Rqrtcfq/"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D9C2E62A2;
	Thu, 11 Sep 2025 08:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757580317; cv=fail; b=mRMbufFDqwLdWnrcyLSPlOOd+cbzYg9da2PpcfLE4PlGOR6iGSDI/HLFRDRLfivKuhAWw3phfyx+gVqb9pMyrqimMkk67xfgtxcg7wL21nnQyiaTJ4UgOQiSx8gV69ApPvbshmgunTOCNi2Saismd01WT2BB6Dh2teELrePnZOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757580317; c=relaxed/simple;
	bh=w2c8Y7FuxRigBktjcQpe6gkFVu1Xme2NhLcIrOO4bnU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LhDh7eGmPsNqDxmPKk2tLZOka35giSsYKJeu1M5lqT2Q3u/x6y2H3MFX2d4Lbv7aDNKUPaMniBWOW+24MnrEEbI+x2WJg+18KLXnevMbDMyVnlfOLupeJtufu64bLtB0pBVzWS2d4f5yr5m02zfgOL//7YTTjiVSVJd/bcSREj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Rqrtcfq/; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECEnMrJ5QCQgITuS62pIefnUuLCiYuo1XeCTpEdrpvAL2tx+A1wswbJpMagb5jGqVhLkQh9xDPPqq2Uyr5xrlcCg0BH/iqWoOEwRkVe3a7/ccm59WU+04P/NPSS+dklBwD2aVWHq9jRe2mB+m/e/h4JBwOWjSZdveD5lCbtTzjS8VQgCrZr0u7oqZ//TWUk2lRlj8Q4lhXjTBZaHvXDpR5ux2OY5DRiFTCVya5CvgYp2ne2DkQCzXLb4IlFzWBK4K7Hz/7/m5Z97nYV7nnOAZltB2a1vYTCdGxKLkXn90H0uPeSr5IKyBp5EpT3HeWZMae4goqAYZkN7L87ngBulxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDszbDrizhEfgYsvRbDSVnIiheerjOyeqd4WFktKZ5Q=;
 b=eO4nB2OzsRMITQkKKqnLLFIgVfe71iR+IIDFo5/Ox+CILV01ZyNQvWzSjjVUq1P/MGm95utPhCN20M99QTX54Yio9SQ4mwE1IMtPjHHH2Z7JjoRxr9DHtidvUFJXTQFhY8lEKl1+kmiXJxcd1VxayiY/MhT5lPHxeVVPihZJ2ZKfe2tUiDzHi0vrc9hTw/MKBp8tpUV6hUtMKbrVjov8CqfdI0DRqur1dQHLOKBzuZzbyrRHJH6i3z9od+a82BKNmm0pLkb2ye3S8QiUH4ePBUbhZqCjm+jFKTWYBvBud1tsG08IBhsO5cQfaOT4HzeyaUoRajWvp3NAXcPn+9dYAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GDszbDrizhEfgYsvRbDSVnIiheerjOyeqd4WFktKZ5Q=;
 b=Rqrtcfq/PlUeWQJIinvao9oPHtaeqW9KogBntTFS3BUZGL2h8bZ5WQCSkkMWm9A0smu1C+cxX+kO3+FbFRy3lVK2EF7PLDSq7l7ACnUvvHBJ+iTdTKhxWfVSK1G6iph4S7Sk2OqV3sGFMR7BABN4VJONKLPaSlWjZGqVRSmNVbiaQ2D7mfpUAIPc71lliaFAcF0vov6Y3TIliEJ20UJUSRSvqW5psHa7qU58i0yCKCPdGveG82vjyQWrxRaDfhnsXXJsHlQxyzAdIzb08Wac3dQYtl9yyvfKQDhpOTvtK6qB5vV4NETHWU95es4n/pyb99gmedBm625IZBE0ZCvkLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.15; Thu, 11 Sep
 2025 08:45:08 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Thu, 11 Sep 2025
 08:45:08 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Thu, 11 Sep 2025 16:44:24 +0800
Subject: [PATCH v2 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-ds90ub953-v2-3-03ee76eb6b59@nxp.com>
References: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
In-Reply-To: <20250911-ds90ub953-v2-0-03ee76eb6b59@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Vladimir Zapolskiy <vz@mleia.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757580308; l=2586;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=w2c8Y7FuxRigBktjcQpe6gkFVu1Xme2NhLcIrOO4bnU=;
 b=adA5IdXu4LI8WCIanuWJC0d4tmzA8bs/bgGFowcDsf3+jVal4/l/S7UldkTQAABhR211iwTQ1
 JPxAKyG479FBUy/eWf0Sl989wXQSMNZTqGNEe64wWPQaguHPiMBrCJo
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::11) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: db0bde3e-b5b8-4aea-cba4-08ddf10f833e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MG1sYUt2aXF5cUFIQm96ZTNISE1GZUt4eEFpb3pKR3pvYXBCK0lCYmlyOHhX?=
 =?utf-8?B?YXhYOUhFYmdJVFUrem1UTkNEQkxiZWVrUkdnS05PSU1jN1VvZkpkQ2hYazVZ?=
 =?utf-8?B?c0VWWmhHc2xpNU1DTFFTQmJ6UmRuNU1sKzlERHRIZUYrK3c1MkVBMlFqamhr?=
 =?utf-8?B?Z1BWZDIyV3R4WnY2WERUTDcrWlZBdk55ZGFZMWJkUVljaFBQSHdUQTdPZ0th?=
 =?utf-8?B?QVdIWUtQcjNWVGwyR21GSzg0dksraE16TGZpOG4wN2Z1LzVUdXZwWmh2Qi9a?=
 =?utf-8?B?emFiUytyMjdkY3Q2VGE0alhWUm9UaVc1TDdjY2daQ242d3ZWR09vaGdhY3gr?=
 =?utf-8?B?R016VHV5R3FsOFZhNTk1b21mU3kxNHhyYkhTbzFrZ2hpekEySnRBQ005b3RB?=
 =?utf-8?B?MEdFVURza2JNcUs5YlRhQlBvUnJtdkNwd3FES1pWYXdKY2toV3JKV1ZyZndF?=
 =?utf-8?B?Q0Y0djJTNWQ5S2lqeTF1cU9iNkVKdDM3ZWxYOGtIU3B4aDZZdld6UUNNS3RM?=
 =?utf-8?B?Q3RtdEVHdGtLVzlPTHE0UDNDdElsMGZkMXU4bVNmZC9qZFpXVWEwV0NSNHAz?=
 =?utf-8?B?eW1YUytpQ2k2ZWZKQy80SUFHMFVidjBTb3BDVmxrMVI4SnhnVzNNUjRrZlVa?=
 =?utf-8?B?V0s5cmFYOGZDSGVSeEdWOE02Q2x4ZW5jMUNrYmF2OWs0bGQyOFZQbW5BUjlm?=
 =?utf-8?B?SUp0NUtjR3FYOU9HVmJMc2NRWGx0QVBwWG5wcVdyTFYrRmtINC9uSG5OcXVW?=
 =?utf-8?B?ai9NNnc2MEF5MDBpVEphRTBKa1FKd2VtRnErMkFqME5TY1dtZUJxZWMwWnQy?=
 =?utf-8?B?eUo1MGRHK2dXVnB6WVNkV3o2WVdpc0ZYdFpQRnlkekRZZitoNjhiTjg3eHJS?=
 =?utf-8?B?UitGRWVzakdPM3J3WlZ4R2RqeVYySnN1WWJYaE44TW5DbHEyVEMyQ2lTZlo3?=
 =?utf-8?B?Uk5nVVZ4cVdiOG4yZDdiUElzTTNjTXpsUlNjSnNjT29ER2d4d3JlT0FyVjR4?=
 =?utf-8?B?aTVhMkJLd1lnSHVtOXlJVXBEcWRjb2ExKzJiczZsMmZELzRtVXRGU2ZwNjNx?=
 =?utf-8?B?dDlZenlSejlOMzR4b0Zsbjc5Z29qTUdvRWdNRzd5amVRaTdqQWNvbXowSlVD?=
 =?utf-8?B?SU1QZWQ2TDJYTisxQzgyMFhlc2NidWZldmFCbzFMNFVaUkhYRUhGM3VVTVRh?=
 =?utf-8?B?VVg0U2FkMHU0NWxLV2g0ZnNQVExQOFJKVU5HY1N1N2E2bGZmNUMyR1ZVTEox?=
 =?utf-8?B?SDMwMXB5MU1HVGJmMGFJL0FWUm00UkRwOHRKVXVraEVrMTgxSWphSDY1ZlQr?=
 =?utf-8?B?VVQ2eXVERW5wcURIbXFJQjY2L0VwVnlOcFRPemVnSUtGbnh5MWhnTTBmUmd5?=
 =?utf-8?B?aTE0RjBOcmlYdG4zNXE3WmQwMDNBa2FLOFdlTzZTSGhRVmt0UlluclZhTG9n?=
 =?utf-8?B?OU82djZCR0F1cFd1UU5SYm1ZN1IwNmcxcGxhaEpOY2RIZjNRaEhYdEt1UVFL?=
 =?utf-8?B?VUp1R05abG9mQmhpNEpiaWVWRDFmekVBS0syRkxGdmMzN0dJL3JNckxGbnBs?=
 =?utf-8?B?SFhsT0NaemZzR1VZazVmWllhTnVyUjdFZWd3TEtmRXpQbTh6ZG5XcFRxZWZX?=
 =?utf-8?B?ZW5UVVdnQ0RheTFKdjRDQXFJd2JHYVRMeHc0WThiVVRuYkUwc2U1b0VqUHlN?=
 =?utf-8?B?TDhRNWxyWjlMNTgySGFhQUt4dkpKV3RIUXArOFluQkNXbVdwOGx1M1g5R2hO?=
 =?utf-8?B?M3oxNGJ4QXZ0eXNiWmV5K3p0ODhia3RTeThaMTBCUldDTUU2Z1g1MHJnZTVZ?=
 =?utf-8?B?WkYxMVVQeU4wMFN3d3JNcmoyVUFOd2k3TFNXbThhMXFXbmdaQzZhVEszRnN3?=
 =?utf-8?B?UllSQVNWQ0M4RHZCaW83UVBBK3E5RjREdTBabzRBcWZ6NkxWQUhDL1ZpZE54?=
 =?utf-8?B?Zi9ZOWlMU293TjhXSEl5NGxtR3hXamdBeFVYdUJ6U1ljY2dIaDFzS055Q2lr?=
 =?utf-8?Q?gI1VSm8gbDuPbcyEd89KsUKUpxhBCQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RkdNaC9wc3QvV0VQVE5WL3VabkJFZ3lJaE92eUt4TDB4eEJFYm03U2UrUlpl?=
 =?utf-8?B?NWltaWR5aURvbXNIUVNqRTIybjU5S1JPWVNOUUVuNkJaTUw1emxOYzMyVWpj?=
 =?utf-8?B?dTB1SHJqZTU1WUI1WXFDWE5XNnpkMlJFb0Yrc0YzNzdmMTdtd0UrVUhHc1JF?=
 =?utf-8?B?TWJwVG9EMmtLSUxKSno4dEQrcHBFaElTcUpNUHhYS05qd242dGk0aGpqN3ZQ?=
 =?utf-8?B?N2ZTQ0MxVHcxTEdVSDZvaHlTZElnbTEzOU8yZzYxZlNPNmE1eDFDMVJMVUk3?=
 =?utf-8?B?aTVFRGFwalRKcXRVcThBc3VoS3lxOFcvcnR5KzYrem9LV2crOUk3cFFyT3Qr?=
 =?utf-8?B?ak1oRlEyOS94b2JMd0Q2SjVCS0dsS3pvekFNWWhnU2xBR3hXNGR3dkJoUnl6?=
 =?utf-8?B?QmhLZFlFU0xraS9EbG0xQTBBQWcwYi9HQWl4TzFCVklPUW45dktLTDVkS1By?=
 =?utf-8?B?a1FDWldxMDFyYnp6NWtBRXdxVUtxd09lQ0orOXc4ZmRJNks1d09vNHFJM2tI?=
 =?utf-8?B?d1JKaFhlTC9lRlVvK3Z4dXFkOEI2QTd3cVZ3emZ4QzJaWWp6S3Ficjg1YlBj?=
 =?utf-8?B?QVRRM2hyN2NMOUU5Qk0yS3JJa2pCU2dSZEdJSXFBd2tXc2xPV01GTkFybTRM?=
 =?utf-8?B?Z3NtK0htM2cyTHF6K29QcU1iajQrVEh4dkRleDd3eUhjNU0yYkFHMVJsN3lu?=
 =?utf-8?B?dm5HZEVyREluZ1liS08rVTc1WmtUbW9ZMFgvUnV1YmduaGsza2dJZGNEMFRS?=
 =?utf-8?B?bjU4ZkREUWxBN3NJaW9sN01sL2tCUDlXRlo0dVVub0IxMlIzczY5OGVoZVNm?=
 =?utf-8?B?aThwdVhDUVhITzVMenBDYWNBeHgyUnk5TjZJT1EzbWsrMlpvWDJzRk5OSlRL?=
 =?utf-8?B?ZURqaTBvYjBwbTZ0OU5MTU92V1VyUmF4azdJTVQ1UFk2MS9FeTBJV2M3cnlm?=
 =?utf-8?B?S0pHYm0wYlJmdlYzdjJUYTFKcytQelNka1hTeTUvZUUxQnVJR2dhbVcrTmM2?=
 =?utf-8?B?WEVFTFhMMXBweTlidUtIazk3SDdMaityNnR6cUJBaVA1eHFhYVl6bTgxckVT?=
 =?utf-8?B?anRIMTBGdWtNcnJTRVI5SWlFWDVrdFFveXV5RGZTNkxZMFBXSTN3YmlsQnNX?=
 =?utf-8?B?dHU2SWtCL3JrU1llTUtReVF5dzZIUjF0OXVORWZHd3V6UWFQcWU2STBtOVdY?=
 =?utf-8?B?YTRvdk9OakZQRFlOaC9WanNDOUhVU2FFZ0xlK3cwdS9jbWovMzNFZG9IUmk5?=
 =?utf-8?B?Tng0OWM2QzllSHRGVnhpcnBCZWlUOHhzdzlKY3dEWGQrQU5LSkwrRCs4bVZx?=
 =?utf-8?B?Tmw5dXdEeU1yT0h1VFp3NzJaUXA4K1dSNTVoTk5zL3lTWEV6SFJUVHROZ2ZL?=
 =?utf-8?B?S0ZiYURWMHlJT0pFTlExRDJINUFCUGFzYmhQYm1yWVBBckluOEhSR3pIUkJF?=
 =?utf-8?B?OTVYaXRBKzB4VDB0L3RPa2RyMUtseE96WHgrUXdHVCtFN1Y0YVc0RjVaZk41?=
 =?utf-8?B?Sll5WlBQL3ZwZXRmWXJ0NHNJbW5nM3JQV0VxazNnbmpKeWI3bHlsZVNIYVQ4?=
 =?utf-8?B?cXlBZk5qVCtlRUd6OGNScThvV2p0ZGs1eDlUV204VTkvbGR6YkxrbWJHTWtz?=
 =?utf-8?B?MEtKbzFEd2h5TUVtSlExSVo4SVpZWTJNWVBQejdCOHZiUWFsYTM1QU4rRmsw?=
 =?utf-8?B?RDBoOFR1cWJpZFJ6U2RwcjNjMVhKamNMdzVjOGRBOGJOUDJNRXpBUFhhcDVB?=
 =?utf-8?B?aXZrcUcvOUNyUERYYUdjNkk3YkJJSC9PcFl0Mnd3ZzZvWjNOdGk3YjUyV1Jh?=
 =?utf-8?B?MHExUlY4SFEzK2VVY2hkNVBvSTJncFoxRHB4NlZCYUdyK0Q3N2MyL0NZSjlz?=
 =?utf-8?B?ZHNZSXppRk9RRjZRUHViR2N5RS9wVjBLdUZjUktrZUVZdWpyc29aanEwMXR1?=
 =?utf-8?B?Z283Rm8xREY4MVVaMGxmdUlPQ1VaV29tSjR2bFN5OXF2a3JXMXp4aHJOdGI0?=
 =?utf-8?B?cWhJR3JvRGJ3cEJQN0E3V3l6TUtXcWNkREEwa280Wi90WVBZWXZIVHV5MjVD?=
 =?utf-8?B?cHVlV01DNlF2dXVBRHlKdDNhenVjTkxEUmIzdDV6TnY2VFVEbmV4WDBYdVJv?=
 =?utf-8?Q?YL+1AEIRMuSQMqd0nHDv5AsnG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db0bde3e-b5b8-4aea-cba4-08ddf10f833e
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 08:45:08.6891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwyBtHL7+7txxy0ga8bbtOCJTScyQnLM7tBHQnWuVtUJSMrNjtrOljxnmTfA5mwEjF3IfHc2QcKQUCLGdrlj9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8364

Use devm_mutex_init() to simplify the code. No functional change.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 274972cd21f9f0facd5098b724c0d6c661ce95c2..0e3b9796dc1aeae58e626e06e7068b20b40dd213 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1337,7 +1337,9 @@ static int ub953_probe(struct i2c_client *client)
 	if (!priv->plat_data)
 		return dev_err_probe(dev, -ENODEV, "Platform data missing\n");
 
-	mutex_init(&priv->reg_lock);
+	ret = devm_mutex_init(dev, &priv->reg_lock);
+	if (ret)
+		return ret;
 
 	/*
 	 * Initialize to invalid values so that the first reg writes will
@@ -1346,32 +1348,26 @@ static int ub953_probe(struct i2c_client *client)
 	priv->current_indirect_target = 0xff;
 
 	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
-	if (IS_ERR(priv->regmap)) {
-		ret = PTR_ERR(priv->regmap);
-		dev_err_probe(dev, ret, "Failed to init regmap\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "Failed to init regmap\n");
 
 	priv->clkin = devm_clk_get_optional(dev, "clkin");
-	if (IS_ERR(priv->clkin)) {
-		ret = PTR_ERR(priv->clkin);
-		dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
-		goto err_mutex_destroy;
-	}
+	if (IS_ERR(priv->clkin))
+		return dev_err_probe(dev, PTR_ERR(priv->clkin),
+				     "Failed to parse 'clkin'\n");
 
 	ret = ub953_parse_dt(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_hw_init(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_gpiochip_probe(priv);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to init gpiochip\n");
-		goto err_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init gpiochip\n");
 
 	ret = ub953_register_clkout(priv);
 	if (ret) {
@@ -1395,8 +1391,6 @@ static int ub953_probe(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 err_gpiochip_remove:
 	ub953_gpiochip_remove(priv);
-err_mutex_destroy:
-	mutex_destroy(&priv->reg_lock);
 
 	return ret;
 }
@@ -1411,7 +1405,6 @@ static void ub953_remove(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 
 	ub953_gpiochip_remove(priv);
-	mutex_destroy(&priv->reg_lock);
 }
 
 static const struct ub953_hw_data ds90ub953_hw = {

-- 
2.34.1


