Return-Path: <linux-media+bounces-36358-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E0CAEEA3D
	for <lists+linux-media@lfdr.de>; Tue,  1 Jul 2025 00:29:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 237EB1888345
	for <lists+linux-media@lfdr.de>; Mon, 30 Jun 2025 22:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C692E9EBC;
	Mon, 30 Jun 2025 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ix8vXVOs"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012032.outbound.protection.outlook.com [52.101.66.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B532E92B0;
	Mon, 30 Jun 2025 22:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751322522; cv=fail; b=XAXGgSgjServcuyjBt6FFkxNLsiycN5MvKV0GeheKFHc+VLD8DcAwkwxYTrgp6I+M4W5nnYW5O3XBGZWGL4+Fl7OD7jNvOPKv/LN1kfNi/82QNxys7Bpd/ySnHtcY72DIlXOoak5iIf5EY5xoZgEw5dAxUN5FiHHvOG4sv4WbD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751322522; c=relaxed/simple;
	bh=/YY4fwMQ6Eq/MPEV5VptvAOFeXEDNjliaEkZiON0K1E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=sPPr2O4zGxJiTs78RuJmtfmG9gU6ccorUanBPz8WrvxuQ1/DlWz4r5zx0sa0RlUUMK86jl8HOdtFFhHMpuZ2XvH3MFiHHrJp6QMh1gbSDp0/Sth0q5JVYfgq8GlMTWve/jX2fQxnCRLP8SI9uvZqBKKiErvbVdAoUwHTpHAoiAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ix8vXVOs; arc=fail smtp.client-ip=52.101.66.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J5I5L0e6AUn6nKmaKDhMLA9osFBHG/K1UBeiGFHbr/SYn/WS/bHw6Bi+Fx3rL1hVs53BXJ3LyCFXH/lHSyE6El9oGxO4XxbBExvBbaKcdXy8CR/8Moi23J4OnxXeZ2ItWtDWyWVAE1fuzeXXMjR9XTSPjUP401/7df3+tjyGYQKvsNIrDQhiZfzn7NrmWlN/7QkLhX1m36qqzqvLT69faP3Q2KgO7M8bAz3JGElh5lgFZmPvdowPyX+JY5pXB2QDkuj4iNUO0QvUOLFhjPxD2Q65GIuKKvHHNehw+fDVcQZLEnicZQO8D3Q8PRb2L9n03xlAtlliO6ZWqanwzTVA5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0HhsXxwnIsObeDSTpGsow7fV0eiKiZNZuHircRvZZEw=;
 b=vLGVx31SdfQ4ul2n7Q6aAaYg3QFc55p/5H7TTDGXJj1zt4ukTLWH77+1BjfDWt1vHwtizxiXJEf5GbxQO4yLRzalfD1iRF4X+ISyClImfEDw0XxY6yZfe8lCUeIe0q5bSk7X3lIay77euDf0CXSpZ+7FjrA3muTwjqeM7SBMW0OKfDFOgVmyk83MaTbMvQ7SNMFqRW+IjOZe/8siXfmWGODSDG9FI4IkRAdGH7if5fLr/bgcUjmRSwCJ4+g3YX7F4nYdpYrlCao85d/BMw4BYM3vf0r7JJec0tFIm732K9+Kz30gZyOtZ2MZ3NP6D3KTxs9HvrLuvwwHJG7rhwU8mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0HhsXxwnIsObeDSTpGsow7fV0eiKiZNZuHircRvZZEw=;
 b=ix8vXVOsgZFwbpKV/BMHceTq/DtZpzBuI9L2b2ic6hLWsDNHApLAs3nHURvwvnzcbRFHZ87Qy++tftrOm52A6JY/XZg6yDcrd2aEgeQOU+RzVD5iMaJ0PsphYvsIemPRPgxjlolM01kP/CaUY5pZBGP30m6cdSmRTNIcATN8TVnjvC7Kmxj4/FRss5++Er3v5YcyKvMX83ty3qLE/LxLFXdepw5nA63LBEL7osN/36kQG3CdnFBgHVVDupI29Da7AMmKr+s0jOY7+Bkmw0N+Z2fTTDgcF3Qgcr2qyG3b9wS/E2meLZpyCpqkea6lw9lkxDxEAFm5BlRzc1VLri5phA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PR3PR04MB7451.eurprd04.prod.outlook.com (2603:10a6:102:93::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 22:28:36 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Mon, 30 Jun 2025
 22:28:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 30 Jun 2025 18:28:20 -0400
Subject: [PATCH 4/5] arm64: dts: imx8: add parallel CSI node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250630-imx8qxp_pcam-v1-4-eccd38d99201@nxp.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
In-Reply-To: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751322499; l=2055;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=/YY4fwMQ6Eq/MPEV5VptvAOFeXEDNjliaEkZiON0K1E=;
 b=EQDrsEHI+2euY5jXk5T2t6sdy02Wt1Hov2gNx30GVitiuIbEP9Ciuku9kjZTYcNK2vnCDp5D2
 eibxJ4a2LIUBAyYwMpGl/2Xln3WGnkWAwWGUGEocn0QxqE4O6V6SV0a
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: AM8P251CA0025.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PR3PR04MB7451:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eaec5c8-6b89-4d5b-4fd2-08ddb8257488
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|366016|19092799006|52116014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?NFV4YXVrRm91NVg1bVVmdFpOYVJLUGU1TnMvQjhWRSs2VEVteWluTGpvdGJB?=
 =?utf-8?B?dGxncS9RclQwcXNiVW4zY1lpZ3U2ZFFjTzF6cDJma2pVQ1RlSUdIKzlZblVS?=
 =?utf-8?B?dDNJdkV4SmlBTFQrQkN2YWFsWFk5amlHRDVYcTUzemFwN01QSEpjUmFLcmNh?=
 =?utf-8?B?aW1BMFBlZXdhbjMwa3hweWtnbzRsdEdVWFd4OGJjVlcyTXZYSEZCdi9GWldZ?=
 =?utf-8?B?QW02U1BESW8yb3ZEUlZQWkp1cVZMUkdIZ0trMlBqUjZjbkdyRkFNY3g3RW9G?=
 =?utf-8?B?R2pPaTgwOUkydDZJSjBML1puNmNvYmVaZ1hFS1ZsVnNvVGVtdWNxbXJKWXdS?=
 =?utf-8?B?dmJlaDZzcTFaS2IxM0htSmN5TXREV1E5d2ZwSGVNSDVTamVMUWZmN0djUmIr?=
 =?utf-8?B?Y3B4OW5RTFZzbjVMd1E3L2pMUTBWSFNxWjVEMERIemRJdWpHL1lZb3FycVBS?=
 =?utf-8?B?UVkvUnY5NjFtblE1RHpVT291WGM2S013dWdDZWU3alBRQ3ozVkVjNzc0azNz?=
 =?utf-8?B?bkovbEFMcHlDbkdNUHBKVlFkL0YzeTJBOC9yRVRCbTBmb2xiUEVLdEdYOXI5?=
 =?utf-8?B?OHF6d00xNVYwMFJPY2c0c1c1UjZXcFlnVXF2ZnkwV2dGNExJZTY3WjgrcWF4?=
 =?utf-8?B?SFd2VmNIRERRUFRCdzVNY3l2azk5Q1hDSnpROGFjWDhoNWUxQUJYUzdOUFIy?=
 =?utf-8?B?bXFyMURHVDhVZkt5Z2huYUN2WVlQNHR6UGtobEd4bWhUTWZQRWlXODZ1bFE0?=
 =?utf-8?B?MDhUSlh1K0VDcXh2NVMvZGNieEZyZ08zb1pibDlmOXlvcWxNaW80SHJ3Nkps?=
 =?utf-8?B?NUdaMlZsMUdqS3VmLzRmWm42WHJQdXRhZ1VDVGlIajVkRENWcnZ6VEZjR3FJ?=
 =?utf-8?B?eUdta2FaT29EcVZ4akt0WlhNWHBzcDFYaTVrSzNRZ1R3dFhqZVp0YlVJZ2Ja?=
 =?utf-8?B?eWwydExYSWZRN0tYTk5oMWZINDRpRXl2WStPeG5kZTJ2Mm9TWGxJN0tXYlJH?=
 =?utf-8?B?eFY0NFNQTGtWWVBjTTNVRHFSUzhMV1RReXl0OTlZbnZTSkNtMmpNT3FKN2VR?=
 =?utf-8?B?WnBEb2FldEw5U29RWkN5NVArK1RuZkV2MHJzNWxMSm9CWnB2WmRGOTZEVCtQ?=
 =?utf-8?B?T0ZuMm1SOXlWdzJ0dFRaek1ZbTY4T09XdnNuNnEyZ3MzNDNSeCtUUVZXWGNa?=
 =?utf-8?B?L2NwbkZtb050ZlNmUmFjTjVjRENFdU5yKytWM0gweDB1LzYwL1dUdzNIcnlR?=
 =?utf-8?B?endXclU5cWZpRkxSSDAzUTBTbXA0WVhnaGVXcjlhSTliQjBneHpIelZqa0RK?=
 =?utf-8?B?VW1YU0ZHTGhUUk8xSkNQengxcktLODNQclE0QVdpYU5SLzlwV2tIendtWGhy?=
 =?utf-8?B?ZmtlK1pueUw4TTY2cFJzU1hhZTdDSk1SdUw0eWZPN0VURHhKWmhNU1hrNlRx?=
 =?utf-8?B?NzMxOTczSEdNNlQ3eUpDWTRyOHIweEVaQkh0YUNZdjN6SFdnZVA1YllMQjJX?=
 =?utf-8?B?aTdhalhmQnB2bFJuWjkwUSsvZm8vQ0NTS2ZVWEJmOHM5YkgxZk5yMFFUbUs2?=
 =?utf-8?B?VHQrNE1BU2grWE1QOXlZUGpENzUyNXlSUUJzdDZFbndCc3F4NmdWZ2VHMXEv?=
 =?utf-8?B?YkZYYjExcUpHNDJjZ3A3b1hhL3BYemFjMVp0eXdQRFFTY1JWR1J1aVNNVEtW?=
 =?utf-8?B?QUNlTit3OHNHaEQrcmlBQnltaGhpNGpNamg5MXJBcW1IQ3h3Vk5GOTdLdVRw?=
 =?utf-8?B?YUdGQ1BBTzFXUHJDTG1GN2k4cmVhSlRVc1poRXU1dGx1bTZtTHhxenIvNytU?=
 =?utf-8?B?NjRzdEQ3ZmZpV3JxY2RVejdXMDEvK1pGelN6Z0J2MHkzb2dFWGJXczI3VFJK?=
 =?utf-8?B?U2pHS0U4Zy9CQktJTk5YU0t2UHI3SWhpMVY4dEV5bFlPN1FiVDRKUzdGM0dy?=
 =?utf-8?B?M095YzcrRThzVXFXY0piZUtyZDRpMWxGcWJkVSttbkIyeW9CeTJFQ2tlVHdW?=
 =?utf-8?Q?KLdrHPBIPe02hdY+5WHKHIr5Dk/zzg=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(19092799006)(52116014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TTJXRW1sNXVacTY1akdYNHhZakNPaHFQRVVNbml2ZWhiZ3pZd0VzYXlsNlJX?=
 =?utf-8?B?Yk8yWER3eDRPdnpwclF0cHFubHpjN2pVMm85d1hnTmN3VWNFeVl2QWphak1s?=
 =?utf-8?B?dnJ5MkZLQUw1azcvQTlPbzRONVJNVk8waERvRXdlcnF5Q291azQ1QkRmd3N5?=
 =?utf-8?B?WkhpM3FvTmJpZmFOODZIdVpCWjV0L0s3WmJhdVBKdmhQME5RZWROZndxV1lx?=
 =?utf-8?B?aWMyMEJPdmtwdlNVTGhuZS96a3c4bnNnTS9yeHdPNXdlN0dFWmdQMTVWTXN5?=
 =?utf-8?B?WTlqeGxpN1Ywd1lhRENaNGxxYjI0WTBtV2ZpOFVHOUZOVlJITk92bWhPMjJi?=
 =?utf-8?B?U1JWL2lHRit3RDB1V2EycWY0VWU1Y0x4ak1EN0ZUdlJZZnhWYWc5L0hXcDhE?=
 =?utf-8?B?Y01aOTBtdkdSMm83dzJsVDlOdE93dVZ5SmhoL1lhY29HUk9hQ2Y2Tlk1NUd1?=
 =?utf-8?B?R1hjVDFGNWc1ZVhCQTVVcVY1amxHaDlLMC9DTXZ6dkFSTnFsNmZEZmRzSk1t?=
 =?utf-8?B?Lys5VTlOZm0yR21jbFdHS2sweGZRajVsUEQ2cmFyOVJBRGw3S3EwOFZYT05k?=
 =?utf-8?B?ZEpQT3hWMDUrVmVQVHdrWXZGRlFjUXZyU0Vra3haZlZjUTZveFB6UDFISFdD?=
 =?utf-8?B?QXF5UlZYcWxySzFyRDdxZVBvM0U0cTFLOG0yZnd0WWNVK0tWcjBBZndoejNy?=
 =?utf-8?B?M3MzVkFRMy9ESm96YjI0Tm9RSVlITWxwcGpodWFsUGdoa2Vqb09EWGJwYi9R?=
 =?utf-8?B?UElxQ0dqT2hwTUprS1FQVlh3aFg5eVl1UVNJTXdEakZwMjlUdkE0TUpOMGd2?=
 =?utf-8?B?UXhnSFdPYlVmZ1RGYlVDdUxXbTF6WEFUVDZOd1dNSm1QL3NCbDFXTjJFeUtO?=
 =?utf-8?B?Z2JHRWQ2bG80UEVtSUFiU2ROU2hsa0xhcUo4VHFtRVlCUnFmWjBaN0NGK1ZG?=
 =?utf-8?B?cWhGSGU5YVNmcjhxb1dDaFBvMi9CMENkL1A3NEVHQ2VrYXdRb0JLWFFMV3pz?=
 =?utf-8?B?V3pLMFA5QWNPMHdPSVlXcmFjWFk1VEhrT2tscEVBb3FVQkVEZGRIeGRiclpu?=
 =?utf-8?B?N0VCSFdCS3Jtdy81V2g5NDE3R2dmMTU3eFltMVoybVdBL0J3Skp2UENUYkFK?=
 =?utf-8?B?Qmt5VHV2elNkRFkvcDRFTTJZakVrd3g4cWZ4MkVzejFJbGl3SGp4OGpZMTJ4?=
 =?utf-8?B?cjdadG5iNDFyTkQ0ZGgwcWJqY29ZdUNCZ1pOM1dLdGt2TTVOVU9mdEhpTXV0?=
 =?utf-8?B?SlQwcWFiSFk2bTRnWDlkMXNIeWJBbERaQjdBWGs2MjNBNjNUNUg3b3c5d3FN?=
 =?utf-8?B?dGtva1dqS1MxL2RHUjBrRzZkUUN5UDRlTkZzby9PVndZZzNHcVRhKzgxczV0?=
 =?utf-8?B?MXVKZDMyaVF3ZEJyMndRRXVVVFA2b3RtaVZObGpWQVFpRXVmMTJ1RUFhYnZ4?=
 =?utf-8?B?SnV6MkpOSEJJK0grQmVBek10UGFmRFhyeHVEbTY0Q2hKVnJqSmNhNTNPSmdI?=
 =?utf-8?B?S29iQU5pc3NtWC8rNVBzbEFlejAvdkJQcFZ2YnJkeEhybUxXWUdqTUpveC93?=
 =?utf-8?B?TENkRGhZMzl6emlZU0pNdUZNNUZ6ZTNEdlpTdWFQQVpWOUhiZksyTXl1REty?=
 =?utf-8?B?ZUFlUFFpOGdhUWZmaCtGMktKWWE4SHN5bzV5bzU4eGVEUkxQQ21BMDBIOHla?=
 =?utf-8?B?TlV6MnhKYmU0L0huMUlZeEdRSm0zSjkvYXcwWU5DWnhSR1ZxQy9HUGZlRnll?=
 =?utf-8?B?S2NXNTl3UGx1R2lETjZTOTNYMGtQY05iNkZKeThtYnhSSUszWElKeTg4NFdX?=
 =?utf-8?B?WWRob2EzemY5UDVNU3p0ckYyVmdpTTRJRkxHRjdibVd1SDlFQ055bnY1cFd1?=
 =?utf-8?B?ZnhBTFhTc0F6RWJKS05pL3U4UmlWV1ZmY01TWlExTWVsM1czaEJiMWl3dEtR?=
 =?utf-8?B?S1Q3U01CY21nbkZmOFBQT1JGeWQrWFpLcW5DcThWSHhDWU1Bd1ZjbDFRaEZK?=
 =?utf-8?B?blRlR0EycXFUdmtUOWxiSmd3aUphcEdvekswYk5IcUpZaGxjZlkzTGVOWXZ6?=
 =?utf-8?B?MHBrV1RmckllenJoc2txaTFzNXhKM3dKUytDbkFHVjJkN3lmMmlHUEhxbmpQ?=
 =?utf-8?Q?RZH4=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eaec5c8-6b89-4d5b-4fd2-08ddb8257488
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:28:36.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSNuiQtEDUxh1PIfp2WzlA0JMiGckyccrfXcNs89Yo13fw+SstGB0Nd30OwiDNuJvcRDdK41P6gZDtA98lsJzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7451

Add parallel CSI nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 13 +++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi | 27 +++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index 2cf0f7208350a..9654975cfd142 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -224,6 +224,19 @@ irqsteer_parallel: irqsteer@58260000 {
 		status = "disabled";
 	};
 
+	parallel_csi: csi@58261000 {
+		compatible = "fsl,imx8qxp-parallel-csi";
+		reg = <0x58261000 0x1000>;
+		clocks = <&pi0_pxl_lpcg IMX_LPCG_CLK_0>,
+			 <&pi0_ipg_lpcg IMX_LPCG_CLK_4>;
+		clock-names = "pixel", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-parents = <&clk IMX_SC_R_PI_0_PLL IMX_SC_PM_CLK_PLL>;
+		assigned-clock-rates = <160000000>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		status = "disabled";
+	};
+
 	pi0_ipg_lpcg: clock-controller@58263004 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x58263004 0x4>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 50015f8dd4e43..60aa43c45d15c 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -62,6 +62,14 @@ isi_in_2: endpoint {
 				remote-endpoint = <&mipi_csi0_out>;
 			};
 		};
+
+		port@4 {
+			reg = <4>;
+
+			isi_in_4: endpoint {
+				remote-endpoint = <&parallel_csi_out>;
+			};
+		};
 	};
 };
 
@@ -94,3 +102,22 @@ &jpegenc {
 &mipi_csi_1 {
 	status = "disabled";
 };
+
+&parallel_csi {
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+		};
+
+		port@1 {
+			reg = <1>;
+
+			parallel_csi_out: endpoint {
+				remote-endpoint = <&isi_in_4>;
+			};
+		};
+	};
+};

-- 
2.34.1


