Return-Path: <linux-media+bounces-40665-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A28B305C3
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:36:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9D2E188EB3E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:31:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CEF03568FC;
	Thu, 21 Aug 2025 20:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="c0LcRqEd"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012024.outbound.protection.outlook.com [52.101.66.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B2035209D;
	Thu, 21 Aug 2025 20:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807424; cv=fail; b=HlFsA7RhKT4i2PlJPWYG61wROcm4UH3aLzVCtlaYHK+Zhy6fjUG3wS4NTJR2GStxv518CqZYFirqXisW2q1okmJGkzsvp+NuWRdagZ17ZDatm4P5FIlzs6z75sCQ74X5mPMkHeFxWBu1yTynZ9SgCz610C8SJ41H5gyCpejtPjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807424; c=relaxed/simple;
	bh=eGD2tk77cR8fVglEDQuFj1Sy+TcvFsZNM0lIOm4qL3I=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TlsL22Bj5IgPewdNTHdTsbVyylI3f0uCJlpBTq5N/eJZHDExlQv+JLL9K1eZWRHOUJrNmYwPsGu39vyM6VrtVD5J8SQMAPG9x7pMnhZDhHVjgwIF0CCjyJ2X2MFliTS6ylgWjmrv89ofgf4YEnohpbT/P1+QLCCVzyxwSa8zvS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=c0LcRqEd; arc=fail smtp.client-ip=52.101.66.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1aDUMFb18KsVlFaU0OEGk9GNXIAhDQRFKO7KenbcsU5FhEgSDCgrvMq6xaeguJ/Qx1s1wOCRnnhW8pY9CgCMOr/9elLa3+ZOtRwTQq7j2vYMxekSd6pFghMMpV5vRbhrXdPjE1fz6PMo+qQI9xjNOkeP/q+cZ0Mfs1GpKR//WTgouxzZzxgymJKaP4+v5N3PySNVmVNnqPhR2EPk2HED8Kuh7dFpXH5XAKGg3AjKEy7F28C5VYFuohZL5wdNVfMBmcndJ6xWnGFk1Tgp0HeSK62yG0BINOpS5K80nZV4UuIXAkyFKw0P3uCntrIKRL1DEJqfVzk/K1mSsQw6HGZrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j61iBTfAvtUUioPVvhteYZChR7xRl7RJTbqqqSt/s/s=;
 b=dwHwV0zMAOfEpAPPZGOzEa8DuVOaTKrn0Jf/bmDaM/dBuk/dOflYxOkYxj86OA+U6rzt5lgwcQTq/qHYXXuDSK1saIzYBsOE8TEz7VXArIsI202MHd17xXlpfnluDxTo/71mnXL6ja/25zKMcuYg+PzjffTAIS/jJW/tKJbMnPTIHBS8ljtLyGDsiW2q+49zYjZyZo6L8dmxE0JyQ+Gmmj/AusqQ4wDekuQPtkfVYp3aMqWXXT/cJHtXLXj/xBK0tCyAgu2Wi3gVRBrf++5S4ZIuSkAuPrMI+WoYOLovyoBjLsNzttk38txATxsP65ngQNXZoifAobm7R0p06a6Cow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j61iBTfAvtUUioPVvhteYZChR7xRl7RJTbqqqSt/s/s=;
 b=c0LcRqEd0TzpW+lrOoKZgGqGCPbr24b8qSPfzdGwliOer0UNsE7VQ7zo1v82RIIL3wzszejpJyO9MsAtuZvcQKjl0Zjk7Z8eBO1VbawlFzZ0cmiCQ35pf+dVWstk347n5+KSZhwcPAhyGRIebh0u4NxyciRTpanjZRK68nS8LfME5pPbQA4gDPg7+In4vNMQEPDK3d34ybd/vYsKoQSRVm7i08eo4h0JNhTVLvRLHLRZuG1nYXiSNRkU+Ts6wMXP0gKsHriit2mAH6ypdh4VIf3Bx083GgFcrbESCj9xYq66BG+eZ4JwSiW7+iTHR4TWay6LhNv4LWLznYEz+GISxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB7181.eurprd04.prod.outlook.com (2603:10a6:800:12a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Thu, 21 Aug
 2025 20:16:58 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:16:58 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:43 -0400
Subject: [PATCH v3 08/31] media: staging: media: imx6-mipi-csi2: use
 guard() to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-8-c9286fbb34b9@nxp.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
In-Reply-To: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Eugen Hristev <eugen.hristev@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Steve Longerbeam <slongerbeam@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-staging@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807361; l=3565;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=eGD2tk77cR8fVglEDQuFj1Sy+TcvFsZNM0lIOm4qL3I=;
 b=S0mI1WGyQ/0JM7u5jVN2TUSQ8Fvb8Cxvsx+lc7WemR5WcvQ6e9AFs543FDqvGYRgks8AE8nu8
 /NIul0VsziNBWpSeHdXIUdMQrl+sDX47ucc6A6CnRkEdf+yRdpcG8lU
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::13) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB7181:EE_
X-MS-Office365-Filtering-Correlation-Id: b14a6ed9-36ae-41eb-73ab-08dde0efae86
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MkpLV0NwMzVuNVR0U2N6Mkw4RjVnUm5vdEFrNFRYM2FyWEViMjFXTEJDdFZv?=
 =?utf-8?B?QzBOdEoyWFJDTmU4N2ZaSHRHMFBOdXBGcVpPV1pnTU5kMGlJVDRVL0hpSjF1?=
 =?utf-8?B?bHg4M0NmckpMZUN1eGFsblZTT3ppMk5vaXZSREFLOVFnZ0QyaW1ZaVE0T0M2?=
 =?utf-8?B?b0pOd0FnR0lxMjRTaWhZRGZSbCtXVkxpeHRJdGkwT09yRGtvdzBuV2pzcEhS?=
 =?utf-8?B?RkE0YzFqSjV5cFdwcUtuT3BFaUc0OVRWT2o5Q1FEdWtlbTByeEUrcVd4OEZL?=
 =?utf-8?B?TlNvYXZRcm9LeEVKTC9OdU1vZkYxeXNXU29ZUys2T3BMdjNsblRUbUI0SFI3?=
 =?utf-8?B?NjBXa2Z0dzVORTlCRjE1TnUwOU5RNUR0ekZraGNWelVLVjhaUlptdDRaWW81?=
 =?utf-8?B?R1pQNW5IVERreDNjUnZ5U0NUcUhUaW1OdkxzNXBQUm1KcFBibUFrdkVXNEVl?=
 =?utf-8?B?T3ZZTUozaUNUOEh5aDFIdXo3M0FKQ083d1FJVnVzRjlLVWZOQzdqSy81cmIz?=
 =?utf-8?B?aWFmOTFsZGNQbjRONStmaWlrUkgvQVJDNjlBak96L1E2QmFPaElFR1MxNjRY?=
 =?utf-8?B?dDNqQjRWaExGS3NDVGsvbjdGL2hBRVFsSWNqcEVQVUxnM0xWQTBsTVlPU2pM?=
 =?utf-8?B?Qnhlem1jbGk5dHI5QkdiK0M2cEM0MzVNbjRndEQ3MTR2ci9XM2I4YUFqWWVy?=
 =?utf-8?B?d3hzVU1FNk1GT1hORjFPTlVjWGFrbERWMW9BcVVocHNrcjErdGVPVWs3bnov?=
 =?utf-8?B?MXNQTWQ2dWZtZjhyZ2tJMTZ3REhZTDJHVlorNFhnTzJSRzllVHN1c1NQK1B2?=
 =?utf-8?B?NU9YTHNsMHRoa2FlTmo1LytVbFhvc1FTaG9ZZjFRZlIxR1V1S1ZRcXlsTXdt?=
 =?utf-8?B?aFRvYzlaVkUrUkZEcGpqcWMzR1paTG9ITWN2WXR3OTdWL1hRUjQ0dWV4cHlS?=
 =?utf-8?B?L1N5bnNIWExzVEhhdEJYTFNGSVRDR3JJanFUZEdHb2I2aXBaN0E4RnYrMUw5?=
 =?utf-8?B?cTBEb0FON0lvdWdxcUJmQlZyVHpPdFYxVG9WZ3pYSXg1RWlrRXErVU1LejAr?=
 =?utf-8?B?VE04QkRBSGQyRFBueis3NTYwWm5BbHZSM1BucTZuUzdwb2NiZnFFZjJFYmti?=
 =?utf-8?B?QkQzNG5PTFR6WGdHMVdicDN4ZjZFVndib05HQXdRdy94WFFFaGZEdXhkZ3RI?=
 =?utf-8?B?MGh4ZjVBejVHemR2OWt1WXBSY1dyQmFGWkwxQ3h2OXdIL2xQR21jL3FzT2hk?=
 =?utf-8?B?bkl1UlBxb3Q2RXY5dnRBcGhIU3Ayb1gyaFl6OXRFU2FSY1BiQWo4VXAxNWJR?=
 =?utf-8?B?T0VNWEhGcFFsa0VYWkswaTdTNnNKNlF4ajBxYkR1dFkyMzI0S0NDOGlEQkFN?=
 =?utf-8?B?aGNYbGlRaXVwWm85OVZTS3I3ZWVYdEJYRlJRWkwreEpoTmE1dmVsZGpMc2RP?=
 =?utf-8?B?NEdreG53R0RJNVpwNEZXVmxYcGhLTDJuODhsN3NCdW01cU13Rm5MNElCZ3BH?=
 =?utf-8?B?MzlNN01UdDZsV0VLeTFpZ1UyNGllLy9DRXRoYkN1WE5rVmgyY09UMEJoYjhp?=
 =?utf-8?B?Mzc1OGw5QlpHR3BFSnVrV3drV0REa2dBeCs4SFRrUXZuRi9McXd1VkhKZXhJ?=
 =?utf-8?B?ZkNpTk93N1hYeXNXWU9FZ1pMcmNOL2tZMytwMWo2dnhMdFBjdkp4VWc0UEdV?=
 =?utf-8?B?M3I2Y2I3MFRCMWswTjlwR1pYRlJmZnNETHNnL3BTRVViRXJGQXpLRWY1Sldo?=
 =?utf-8?B?cjFZOXNHQUtqdXNqQUhlVEVtNGJBaU10ZldQY1VjYTlyRG5LRnRwZnBGK0Uy?=
 =?utf-8?B?aFRWTDl6TDVIK242SUovV2U5V0R0Nk12alF4RnR6Tkh4U2xvRGZTR09TRzRH?=
 =?utf-8?B?M21VNHZ3MVRGM2RPcHZGcjgwU0ZwQkRBQ20zRWs3R0ZGOFh4aVllY3hYcCtm?=
 =?utf-8?B?aFpHL09aTmZHOUJIOFdIUnZGdnRHQ1JDMXBlSFpHOEZWYklXVUJEUjh3QlhM?=
 =?utf-8?Q?orY+ssWb15lzhqUgF43eD0sAXJAquM=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UU5HbVdpWjhJWVdtMzVEb3pMN2dTZU5KNFpqVWQySWFFMHV0TkowSmFCN1pO?=
 =?utf-8?B?WXF6c2w0STdTMi9VUDVycVp1MDV0NEJOa0pua2M1dTNGRWl1bTRMa2VPMWxt?=
 =?utf-8?B?ays2aVdHenBjb2ZXWU1jdEo3UldFSnltT1JGN3QzWTlNTVpEQzV3OVBnUXpM?=
 =?utf-8?B?a2hhMHpKZ3FQWlBVbVNiQzhPNTJNMVBTdDd0S3MxeDNZVlhRY0RlczlrbG00?=
 =?utf-8?B?c1VxTi82NU5BTGNZNkc0aXhWTEl1YjJBVkgwZS9xTm53ZjhCdVUrQ2MwNUhh?=
 =?utf-8?B?eXhQcFUzTkF1YzUxVHAzVmczOWUyc1paelNjdmRvQ0tLSzFhNENYRnZiZ0Er?=
 =?utf-8?B?ME85b1pXZGprdEZFMVJUMGdBWElRY1ZSMmRKOE1ZVjJlM2RualA0eXlrU0U2?=
 =?utf-8?B?OSsrSGVpU1liNUtvUU8rNmw0WkRxZldKSWh0MUdxa1ZEcWdBOTV6dFhRQUow?=
 =?utf-8?B?TUdFQW55K24rVzcwTStOWkxiYmlqMU9XQWZwc2lGeUlNcVFUb29qMGU4ZUFa?=
 =?utf-8?B?VzBvYlBZTlJxQ2RMc2NHejUvZmhVOGxvQU52VThoYVdEUlhNaEU1dXAxL2p4?=
 =?utf-8?B?NGxSYjRhUWxkc3BCQzJZd3ZTSWsraFhCZ0RwRmpjaXRTNmhXNVAvWTZyYjNO?=
 =?utf-8?B?QkpmZEtVbjNsSVRYUk1ETm5IT2FRUFBmT0t6UkNuN25NU3Q5OUNpbnNPRzJy?=
 =?utf-8?B?cm5ka0JoUWtPeEdCbUVnMHdEaG43OGtXTmpTdTRrYjF6L3BESmQ3SGJ5MFY4?=
 =?utf-8?B?NTVVV3ZlSDNqc1pqbWNJNWR6T2pVSHNkekNaKzV1WTErSVJlTVdrczZmL0lE?=
 =?utf-8?B?dS9lZ1lGN1VvUVlNcEI5YzdidkRPOUJ6OEZuOWRWT3JJcmJ6bDQ0clRaOTBK?=
 =?utf-8?B?VTUvSmRQWnErczZuSVFjTzNlbU9GcjFibnhvWXNYalZlcEtDZGdQRlh5ME5r?=
 =?utf-8?B?U0s0Q2RYY2ZSQzE0c29MMC9IMFRlakQrQm01TlNObHdMbm9pbko5T25JWEEz?=
 =?utf-8?B?L3c2ajdNbEpKdXFnWE1welZDWVhoOE8ra1Y1R05pVy9aTko0S0NQaFNubyth?=
 =?utf-8?B?Y3FxYTNNa21RSEJuQ1EzZjhSR1lhV1F3Q2NwSWZ0bzluNWVSOUpZVmlnS0Z5?=
 =?utf-8?B?MkdIN0V1TWRoZUxKSUtVNCtQMTVwb0NwWlRNdEtHbW1VUFR1V2FmaHpRUmJk?=
 =?utf-8?B?TUxVUHdZZS9LUXY0a3lpOFhiOHNnbW5XdUZ0OUtHemExVHAwY1BvSXhaUllq?=
 =?utf-8?B?Z1JtM1hrK0tNVXRQRE9sQTNOWHpmWXNYVGtiRTU1VnpsT0Q1dm1KL3NUek5V?=
 =?utf-8?B?N2h2TkJMYWI4QkNFL3FuRjdQNkxKbGhHcUhwdXM3L255WGdjL3ZaOFBlSUtM?=
 =?utf-8?B?cUdEUG4rVjhTZUttNUQ5U29VUkVPTG9xVWNpSVFIeGFkUjgzZ3VHQm9zWHZK?=
 =?utf-8?B?U0N0Vjg1UzdMR2FudE8rV1NoR2ZURUVOYUtvdGhKN0hwa1JML1dKa3AwbE1k?=
 =?utf-8?B?cFdsZU9sM3BQRTgrcm5QNjZRaEswa1Q5QUYyWWE0RFhyVkdSM1JIdWZVVWZ0?=
 =?utf-8?B?VVBxMC9tSU8wOGtIV1gyT01BTW1GQVVnSkVWeTRmTFdNQzFNWGovTGJkcHR2?=
 =?utf-8?B?bUd1bnprem1GRFBuNnYrQnBKSW1oRzN0SDlTRW1zak4vbENuenJsQzk4Rzd6?=
 =?utf-8?B?NVBzcmpwSXdPOWQ1UjZPMlA3ejNzYjJpcWRjU05HSVFFUXRLYWVQZFVraE5N?=
 =?utf-8?B?YVh5L1BYdys5Z2ZwdnBUclpWQUNvOUhvSFRGSXJ5aDJCSklQaXRJbEdYQ3p5?=
 =?utf-8?B?UU8yZUpueGZjeWJvNjhLSCt0N0hmK3VzYTZYL295b01jRmI5eWtydHpFSXdW?=
 =?utf-8?B?OFhWZzZIN2tiU2ZPQ3lWN2dSRGxoblJhZDVQdjFCVkdwQ1MzOVFGOVd0T1dU?=
 =?utf-8?B?ditGZWpxREdrV2pndW5vK1F1cmVCVXViT1hRS3lCeHFEU0w1SzhNY2dDY0ZB?=
 =?utf-8?B?UENJR1ZjSnd2WkY4MXJDN1o5dnl5ei9XRTVuUUZwVHdpRUpWSXpUVlVzaEVD?=
 =?utf-8?B?enRUNzhNTnRFVWpLakZGZEVjcjIyNDI3aXFWQW5GVDZFNTFQenZvUXptUjl1?=
 =?utf-8?Q?Wx+I=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14a6ed9-36ae-41eb-73ab-08dde0efae86
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:16:58.7727
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RQ8dW7VIg5VoCDyIkHRYi68vy9KEzNHza/gWFnU9rAlSCiUJt80E03EglHX651xSFyhKscZ7i3ztrGHaVRa6LQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7181

Use guard() to simplify mutex locking. No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 54 +++++++++++-------------------
 1 file changed, 19 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index f8d0b3b8b250774af51f2aba731e639131aceff9..54e9491d3428686288a5bc9bb58a5a0a25aca696 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -413,21 +413,17 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 	int i, ret = 0;
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
-	if (!csi2->src_sd) {
-		ret = -EPIPE;
-		goto out;
-	}
+	if (!csi2->src_sd)
+		return -EPIPE;
 
 	for (i = 0; i < CSI2_NUM_SRC_PADS; i++) {
 		if (csi2->sink_linked[i])
 			break;
 	}
-	if (i >= CSI2_NUM_SRC_PADS) {
-		ret = -EPIPE;
-		goto out;
-	}
+	if (i >= CSI2_NUM_SRC_PADS)
+		return -EPIPE;
 
 	/*
 	 * enable/disable streaming only if stream_count is
@@ -442,14 +438,12 @@ static int csi2_s_stream(struct v4l2_subdev *sd, int enable)
 	else
 		csi2_stop(csi2);
 	if (ret)
-		goto out;
+		return ret;
 
 update_count:
 	csi2->stream_count += enable ? 1 : -1;
 	if (csi2->stream_count < 0)
 		csi2->stream_count = 0;
-out:
-	mutex_unlock(&csi2->lock);
 	return ret;
 }
 
@@ -467,32 +461,28 @@ static int csi2_link_setup(struct media_entity *entity,
 
 	remote_sd = media_entity_to_v4l2_subdev(remote->entity);
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
 		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi2->sink_linked[local->index - 1]) {
-				ret = -EBUSY;
-				goto out;
-			}
+			if (csi2->sink_linked[local->index - 1])
+				return -EBUSY;
+
 			csi2->sink_linked[local->index - 1] = true;
 		} else {
 			csi2->sink_linked[local->index - 1] = false;
 		}
 	} else {
 		if (flags & MEDIA_LNK_FL_ENABLED) {
-			if (csi2->src_sd) {
-				ret = -EBUSY;
-				goto out;
-			}
+			if (csi2->src_sd)
+				return -EBUSY;
+
 			csi2->src_sd = remote_sd;
 		} else {
 			csi2->src_sd = NULL;
 		}
 	}
 
-out:
-	mutex_unlock(&csi2->lock);
 	return ret;
 }
 
@@ -513,14 +503,12 @@ static int csi2_get_fmt(struct v4l2_subdev *sd,
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
 	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
 
 	sdformat->format = *fmt;
 
-	mutex_unlock(&csi2->lock);
-
 	return 0;
 }
 
@@ -530,17 +518,14 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 {
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
-	int ret = 0;
 
 	if (sdformat->pad >= CSI2_NUM_PADS)
 		return -EINVAL;
 
-	mutex_lock(&csi2->lock);
+	guard(mutex)(&csi2->lock);
 
-	if (csi2->stream_count > 0) {
-		ret = -EBUSY;
-		goto out;
-	}
+	if (csi2->stream_count > 0)
+		return -EBUSY;
 
 	/* Output pads mirror active input pad, no limits on input pads */
 	if (sdformat->pad != CSI2_SINK_PAD)
@@ -549,9 +534,8 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 	fmt = __csi2_get_fmt(csi2, sd_state, sdformat->pad, sdformat->which);
 
 	*fmt = sdformat->format;
-out:
-	mutex_unlock(&csi2->lock);
-	return ret;
+
+	return 0;
 }
 
 static int csi2_registered(struct v4l2_subdev *sd)

-- 
2.34.1


