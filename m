Return-Path: <linux-media+bounces-33182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 068F2AC12D2
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 19:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8EE01C018A4
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 17:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C8919DF4A;
	Thu, 22 May 2025 17:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YX3C4BfX"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2081.outbound.protection.outlook.com [40.107.22.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18D829A30F;
	Thu, 22 May 2025 17:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747936645; cv=fail; b=q3yWSBDuTpO97cVPcEdhbuvFRmuMF5xTwQxfx05Iqst1Y18zVwj/SGeUul1R9wbw4ADC2XcyZ2HXxS2aSgZvaAhJh2RHj/IVcmQf8pPWZa16x5FxuLQ3CmUqLPid8Bugm7r2yTR5ZSl3M/f+/kGdAmih6RsSJzUywgKgTejPiso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747936645; c=relaxed/simple;
	bh=M5XM/YHCs7hQ+Ff6rR8b1y1zx8a6MAOiBT19ob+jZsU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=rJ8dY48Bm0dS0CdsIznW4ZcbmoktdIhMROVlOhwtYGDgwUO/KO94FxSwBtDr+bnB3rbnHvv3PLCzg2Za5JdzdDKu9frRXI4NgSf/aAyy679M4pRNHP22hfyKkFjNutg/YPNLw6GtT1d6sQyrl1RfARC9B42ipxqnOsxgg1alxJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YX3C4BfX; arc=fail smtp.client-ip=40.107.22.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HP6lf9VlQKThKqqjWTruX8Sbt3TG/1M+w8bGaA7uGshTFcOJxUpH0bzlzrwkORk63Nnq2ahdZeVbRJ4c4cP0ZpqV37+vDuDNRnqFYtd5d/cU6vRmYCF+etrzDIykHa4YCjDClAr+3twN45h/7QIeah7HVuTStjal1QexULTofwNPxN5rJtKonD/LhhMnr6DHb51LSF266KUa97WrtLdukHCnQaqDB92HZlX16fvwyi616ZxM7TYQEjc7s4W6gr5ev+6j7z9d/N3gMo+G7sb8mrkwcy7ZWUyYK9uRs0ctmBCjHKPiXDrkkHq94XZEGXIq5V93wVYsXJJkexRGhM6jnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tteai056XbV3OzPy+Rkggw645QzOE1nRe+uiqFWXFXs=;
 b=wUhq1uqTDh5fswCZqa7bgQpWHALsdKbWpMarqG65Tn6A+dymzHeMkcDLp4PK+KIxUKM5EZ/dDnkeO1TIb1TrI63boCU0n2BsPCOcP2No1rIJ7A9w2wBY54ooMV0tP5/H/IoIIRSDRJsJVrp28FO/hMEc2B5D072Lrulo3tTDsySESz5eqxnr0iDr3UKJ7eS1zVtT04MjtdGAflmCbokBWvSGGTY9ZIWjJ8C8d3wIHszHMV3MdQis6GuWhHmHacevA4zaxA0zT4SY6BNoynYvii2alRhvYSMM4t1rY1ROZuK7Q+fZajiGsK4Mt/Y0UPURAY5H8JL9zrVKeNkPqrOD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tteai056XbV3OzPy+Rkggw645QzOE1nRe+uiqFWXFXs=;
 b=YX3C4BfXmimpTJ84XLtlZVVfugqp7Ba+MbRBvdxWG6AfGvaglbiwe5fVUkvLgLpzCA0PSioH9XrO+o3O5I1EVPkjgaqGsfb99FMEA0y2TiDRq0Zi/ZOW0+12c+4piEmX4m31oZzYK31uUVCZD8tvdvG+8M94++sQa1U55M5xL7uSQOR2LmQ7r+O8vYLDI64b1t54GnViv+rxZB0SlIIrRwiz/VD+bxACaz3Y4RRAKTAfdkpXINOtyutKzqysrnqQ8LEs8keVYczJ09pOd+EK0cxGQV21+OGLeP7APeRA72DvY/q//2Itq79Kj0axmgss/MSqVxbHq34f/3BOISMHnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by FRWPR04MB11272.eurprd04.prod.outlook.com (2603:10a6:d10:19c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 17:57:21 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 17:57:21 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 22 May 2025 13:56:43 -0400
Subject: [PATCH v5 05/13] media: nxp: imx8-isi: Remove redundant check for
 dma_set_mask_and_coherent()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-8qxp_camera-v5-5-d4be869fdb7e@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747936611; l=1180;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=M5XM/YHCs7hQ+Ff6rR8b1y1zx8a6MAOiBT19ob+jZsU=;
 b=eOSlXelkWJ7Rl2WkawOeB4KGNgp8cIzuGbElATqCfdC7Upp3Qn5E11z+AsqNiNDTR6JS++CY1
 UOkk4q0sTz0DoIIysRGd/zMiFWXmERjFyE0t7WoLRYJfj4vqInk3Byh
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|FRWPR04MB11272:EE_
X-MS-Office365-Filtering-Correlation-Id: 176b9144-9d36-4af8-0c2e-08dd995a1982
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?U04ydU1HY1JNdjlFM1I2VlpGVldFaDlzM3dxNkNEYWRBd1RzZ2loNXI4eG1H?=
 =?utf-8?B?UXZqZ3VEdDRIT0N6bzVySURUTUx5eWI3TWR2ZHl1RE5IUWZKalZWb2I2SEF4?=
 =?utf-8?B?dmIya21KbVpncThQdVBvclVNM3JzVUticWlLUWcwZmpXdDkrQTE3TmVzL0Ev?=
 =?utf-8?B?OGdwMHNJMW43R2ZjNDIybzdjY2NqOVVsVklUN1BJN3RobEFid1pxcDc1NDU2?=
 =?utf-8?B?czBLU1RRTENlQUErb1JGbnFsY3ZuYytBb0FBUVJFTlVHMExDVWdOUit5YVA3?=
 =?utf-8?B?aUxaeTgvQlRKOTV0N0tVSExHUXhNL25UNWJQcXZKdE5ZTDhDUjVVYXE1elA3?=
 =?utf-8?B?NFpvMlZUSU53dlZsTVlzS1VLQTJid045ZXNhNWlmVnk2RVZxWVBZaHlETlUw?=
 =?utf-8?B?SUxzamRSbXlBNGZtZncvZVB4My94SjhKeitSbVU1M1R1amdiWHprTzY3MnpC?=
 =?utf-8?B?L1k2dVlzZm9hL2V1SXJNTXd6S21RY1k3VS8zWnpOSXp1OEp3UERtalJVdWZG?=
 =?utf-8?B?bUZ1NlJVRWFBTHRMNzZIK1pib0o5Zk42ZE1XdkVWS0VOaGk1TXUvNGd5dGw5?=
 =?utf-8?B?TU9ZUWh6d3p4THJwMkI3UDE4bUJwWnMzZndJZlJEbFRaajRhUmdKamg2eUJN?=
 =?utf-8?B?NThXRnU1ZDFRTXlUVkYrR1NweXo4TVZvQlpva1VIblRNRStqMHUxdkxGV1Vy?=
 =?utf-8?B?dVBWd2RHVjVRanpCRytzMURtaStDUmYvSSs0eGR1SG10REl6Wjh4VDdvR2sw?=
 =?utf-8?B?elpiMDJYdGVuc0NvNC83QVpaMmh3b0ZkYzZ5OVEwZllRN21DVUF4ZVpxV1Fn?=
 =?utf-8?B?aFA3WnZ5NlFQYVloQTk5RXBReTdERFlhdnZBdjBxQkFwT0QxMnZQTWRpU1FL?=
 =?utf-8?B?SWQzTEJWQ3pPTWoyNWYyNVAwTEZiY3ZVdXB2WG5wRGszWHlpNVFnOVdsWUl1?=
 =?utf-8?B?M0hqMk80aDZ4b3BuS2t5T3NTSk0vQ0tEaDZSak1rb3MvS2JoSnpWQStDRU9H?=
 =?utf-8?B?OVdqRWZ3N2VCYVpHck9wY0pkVXMrY2s0L0VHWEZNRm56UWtwSU5vV2xyN3Iw?=
 =?utf-8?B?V05Fdmc3cERNZi85SU8vL21obkpsaDN6VFpWZGJjQW9IdDBqd21uNWtHcUlX?=
 =?utf-8?B?TFJFV0xKeExmeXRBMFA1czZVUFFRRGxORk5menBXZ1RnR0FsY2RkZzUya2xU?=
 =?utf-8?B?cS9TbTZoNzNvQlpYbCtEZ3ZsQlZXd0h4NVppSldYUHM4dWc3V2VYV0dSU1Vx?=
 =?utf-8?B?SUpQcXZ0R08vK09EdkNkUkpaVWF0aFE4czFOenVzaFBIN2hHTkl0ODdTbUVX?=
 =?utf-8?B?RXhTTUhXNEtXSDNoY3o0K3c5bVByTG01NUdyZCs4ZDN2cWU3TTltaWxNVzFx?=
 =?utf-8?B?QkVCT3J3Y2Z2Y01SVEY5T0tYRWh6NFNTQ2x4UEx1NC93eHZ5VWEreVVTeGFt?=
 =?utf-8?B?dUhwbFRUUWNWSG0rR25pc2RwNms2NjlLVy9Fd0I2VUwweUNJQ0lxaFBKMDNt?=
 =?utf-8?B?YzRra2xRQURSYTVPM3plR1JaRUJKVlVydzJnazdGUVJEcC95dHVhK1IrTUFM?=
 =?utf-8?B?b28wak53cjJsamp3VFQ5Y3lZdWNOU0RqK2R4TWJheXRlMTB3V1VkNW5IUVZJ?=
 =?utf-8?B?SzIybkYzSHBjeWVTYUF4MDJ1VXBzejBEOGJldjlOWEp4N2kvYVRoWnBibUNx?=
 =?utf-8?B?RGVCZzFORUFsb1RHeUxoeHh4VW1zZTc1MU5TRENVUmZCT2owYlBUOEJPQ29j?=
 =?utf-8?B?c3BkRkd6YXB5cGQvdWJmNVhCRytNd1hQM1RLS1lSbnJ3V1Y2R2hPVUwyek1Q?=
 =?utf-8?B?Tm1wRUNpWVpjeGRPQ1gvcGpyY0FQWDE4bGhVeXJUWWpEK3JyYlprTjNwQm85?=
 =?utf-8?B?YWpDUFFsS2htZkpvK2VtQ3VzeG9odXhyM3IrRzlrK0J0VUZyZ2FFUDFUVWY1?=
 =?utf-8?B?cjlRRXQvSEQ2akg0b2pIRVVjU3p3V1hWczErbStqblFLRHBJUE1LZXFoMldu?=
 =?utf-8?Q?Fs6oUEV2aDmgOuKjdst5kEgD6gzCtI=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?elVPYnppMGlKTklqN0RwKzdnQ3VXN3c4eDlzZXFBVFBwM3FQSmhuR25kdTZN?=
 =?utf-8?B?K0g4K1Iyb0NiTFhvK3RjVXlyVEE2UzVlNGRvNmNsZ1JUalovYXJXa216Vkwx?=
 =?utf-8?B?OEMwVW8xbmpvRDRIQ0FZNk10TnJRN1psNlhJMmFzcTJGYTBXUmsvSDdzcmox?=
 =?utf-8?B?enU1bUV3ME50dHdIclZQU1plUkluNUhpQm8zOXJENWFrVWpIY1lTSFFYajI3?=
 =?utf-8?B?bHhvRDJBUXoyWi8ydVpNZkgyR1BVeEhDYzk2aEpLQUNiUnBoY2t5cW1QYXJn?=
 =?utf-8?B?WCtUKzlGSWdHd3FkYk92VDB4ZVFyTmVtTHNMUThWMlJpZFA4TkVHRk92cmdO?=
 =?utf-8?B?U2U1L1FrZVNUdlBFeERXRkpDV0EzRGc1NGdycnNIMmsxSk1FRTdXaFpOUkFy?=
 =?utf-8?B?QzYxREhBZGl5N2s0ZWVZdWhtSG1QMTNTTWpjbUtBOEhPVFQ1dFVTSTRDQnRZ?=
 =?utf-8?B?U3hOamwvcFErY2tCUWgzMkJhcTJZUWdweElaZGhBUG9zSGJHTmZRN2NtVlQ1?=
 =?utf-8?B?QitDbEhCMHd1emFRUUFPNFc0UDlCN0xsSHk0RUZiK3U3NWtkZ2hjcmplZlBZ?=
 =?utf-8?B?ajR1ZkREa1NFSkZKRVowNVo0MFZXN044cEtYSCt5NzgrSkEvTnhkemoxT0c1?=
 =?utf-8?B?RGt3N3hmbTgrQlhDSENLZ3hmNkVuMENkRW95V3F1ZTNkRExzUE13VXNWZUxl?=
 =?utf-8?B?dkRpZWlvQm04SWJmcVd6WFhRM2l6SDhkZXYwQVc2UlZic2RRcHZ5NWczVE5l?=
 =?utf-8?B?NVJobGhtS0VJQ3prODNqb2pnYUZFZ0dqS21PcEFwSU8yV0hXaWxIWmFIL2Vi?=
 =?utf-8?B?cVdOdUZORCttN1VHMjErRXUvbDBWc2ZHTm5jQWNkRVBteVR5YTU2dGFCTFRr?=
 =?utf-8?B?aWJFdTJkODc4V2w0bCtOMlJmRXZxUVE2bGVFZnloMHY3WTNZdmFYWDliNFBm?=
 =?utf-8?B?NlpxZHhoL1Y2ZUJOVjZ2cGRBbVJQNEk4YVZtbDIzVEVBSUlqa29FZ3k0VUVM?=
 =?utf-8?B?S0hJV1p6ei9DVis1Q3k1UDRURW85WUp0MGFqcUVvbnZjR1NaSktGY1YrRlJE?=
 =?utf-8?B?SzZpS3NoY2hpOUgzVzV2ZHJETFkzZDBNK2JVYUdjRHhTaFo3ZDJNZnQ2MHFr?=
 =?utf-8?B?Yms4RGVIY2pZcjROb29OWFpod1FEeW52NkkrVTJOZ1JLQmVVdllBYkNCbG91?=
 =?utf-8?B?UzVkeTdTMVJFeGN6WG5iM1ZoQU9Cd3ZiYkJTWTNsNU1iL213bk5BOWhpZmw1?=
 =?utf-8?B?OExpbHNNbmpEaFhWbTFQT2xnUHAzTFExMnZOM2J0ZEhsMndtTWJ1NmlTTm1U?=
 =?utf-8?B?NHFLSWxRYzlQZVlVTHRZSXBvUHNXYlQwelZlL29EMEh3OWNYUS8wVHlvbXdQ?=
 =?utf-8?B?WDJwNzFqYi9IWGk4ZURldDgxMUcwYnM2K05kd0txUUFYRXNUamllNk1JZGxx?=
 =?utf-8?B?T3JjMlMraU9RRm1CREU2TTR3SXFzV0ZFSU5yVW9wa09uMTE2bFBTM1EwdDR3?=
 =?utf-8?B?Yi9ONHFaakJiT0h0eG5yV1MzLzZ5S3hkWUJpd1Z1MGFSU014d0sycGNVN1hN?=
 =?utf-8?B?MCtOYllHWHBzNU9Ec2xLL2xNN0JHazd3Mld6U3p3UXJuK2pRczBtc0tYdnFQ?=
 =?utf-8?B?aHgzcHFQeXRjbWJzYUl5UXpKTGRJU1lOY3BvNTgrVTU3NXdwMzZXT3JBWDdr?=
 =?utf-8?B?Tk5YUmJLNnNaV1c2S3hyNndrcW1wOGw2N0I4V1ZJUVpNSDlzSE45MFBCdjBs?=
 =?utf-8?B?Y3krMGdveDFvc3d1TUFySnA0aUJYcnZmQUtLL1kyZTNmRWtidVNhUUJBR3J2?=
 =?utf-8?B?MnZza2Q3aWtsQ2s1RDdna2Z3M01YdlR3UmYyMDdpZ2t1dUpKcmVtdGRxVXE1?=
 =?utf-8?B?Y1lBQzZNSW9TY21TM1JTS09jdXlwSzNqQWRtaVA4OU00VEQxMEI5RzBPUnNm?=
 =?utf-8?B?T2I4Y081SmpUd2owekpEblBMdmxGSFUrQlZ2ajI1ckZMT096czh6RnM4dDhL?=
 =?utf-8?B?WlZKd1pCamJXRVduRHh0ODlxMlRmdnFDbjY3d2xPSmF2WUFwaWcwWStIYmln?=
 =?utf-8?B?TGZYZUt2bi9hSnFmK0NaaXMySWtMbkZ5VzU5ajF6dm4yKys1QnlOL0dqVFVP?=
 =?utf-8?Q?o9ff4I5VuTzE78dqtzB3szLjj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176b9144-9d36-4af8-0c2e-08dd995a1982
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 17:57:21.2108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9qyncHeffX142k+TpADpJDkduR+GNiFLaYuSaslTtFfPsRVc+GNghI1Tieev2BzC9DijB/N/+7OoMiCjIZGpDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11272

dma_set_mask_and_coherent() never return failure when mask bigger than
32bit.

See commit f7ae20f2fc4e ("docs: dma: correct dma_set_mask() sample code")

So remove return value check for dma_set_mask_and_coherent().

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v5
- add Laurent Pinchart review tag
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 015350c6f2784..073ea5912de3b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -444,11 +444,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	}
 
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
-	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
-	if (ret) {
-		dev_err(dev, "failed to set DMA mask\n");
-		return ret;
-	}
+	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
 	pm_runtime_enable(dev);
 

-- 
2.34.1


