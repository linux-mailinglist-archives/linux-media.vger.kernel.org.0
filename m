Return-Path: <linux-media+bounces-40679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FCAB305F8
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 22:40:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DB28172000
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95248369358;
	Thu, 21 Aug 2025 20:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aYLBDDe8"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011052.outbound.protection.outlook.com [40.107.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085A3369349;
	Thu, 21 Aug 2025 20:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755807510; cv=fail; b=kaZ7leWfknuYUKEVf+GdQMcxh1XRZwbMUtRSdxVE9tJ9MBWzUlQN2LKpJMW2ZwPneXFAdVIElcr7uovlTTJZhKLb734rmaXRc5jPiw1rbMhshW+IdoV6tGzrquVhv6+B6LsW4BC7AWdI8DLfjYIpxE3JIYmkOotzOfgpmZY7k10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755807510; c=relaxed/simple;
	bh=XKmU15gdj4tOY+sTYSb8OVLIZy1uUFbDeTevdWEZRzw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lqwHlAiGSArMiL7mzz0LZ/14TRzQMQjXByIiojzzervdJkxupY6L5tNgce5dTzm5r+HqGU5UmZ5uB3yYA6uutUr9K/Enqbwp8jZe/opXfFAjdTLlJP/qhiHA3HCy2f9QLi5+uoBBsguy9PeoIFhe7AshQ/fXZPq+zK1yeGody+U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aYLBDDe8; arc=fail smtp.client-ip=40.107.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tmiDmY/eytg9sq0zORHMhRAPmrJ8PyAKej8BU5Plcpt1Gfi3oG9gSXbrqiGz7InL91DjrM8+xSypaDIe6mX8QPpUVQaWX4iVbK+25pNlh647omxmg3WBy2E/drdSdX6AnNmXbRIJf7cs85r6uW8hHoyWI1yFrpztAdXJWyohQtvaHDzEaPkaKvkLOZ03fZvI/VJQ8OYeNAfEFP5S+MEtzfu1wYPAOztL9P8m1DFpw37InN96L3nyAp6w1ObUvy3fHxXvhZMdZVFx9mOdX8Cz8fE8sTn/AZPmnwfCZzHJx/mOHjNUqRARRDkegCEB+iCi9PhF/d1knOez05g7ccJrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvtDhUE9VY1QpJ2FXaolnlkHDC9EY4x7WcuuXaXnIYc=;
 b=Gyz47BDtNt0jYr1zAbXJivI4OqCez08zvAHBtGAYGzMmJ3/G+CoHZXUkeB2tY1V1GImQibYcHZETY1/k3jgsiqmr/H/k0JK+P0Hdifzz8hlZqXHBPZFPrH4NIeiHJ+BPPXSIF/9OqNypFZ+Fz+5NRJ3V/9f8elJ/nvKrIt294XsashJ9r9npH2cgBrJ39tgJQ+U3iwh1H6jv0PZKrf/tu+kEqhZQSwNSKgoofTTJ9lVXJgykE06wvThd2f7DbgVd+MK9mFnBF7fdcLTMpUnrYtuGURPbRLjhB7Q5n4XzU9i005OkTl4c7lej2oupfAK+8qhqJsKjzbNtCk0ShXRiUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NvtDhUE9VY1QpJ2FXaolnlkHDC9EY4x7WcuuXaXnIYc=;
 b=aYLBDDe8IidxXtsqLlYHpa+b4rNHQafJHit+8GpAZgrQTYcowag+gPDrCjNvSNBqhRr4FL42fycLwXGP8NqFmaF9CmBmwn/eEIM85WfTAjzNkT2Cd9tCLFct7Q8427xAmABdRaBQsh7wrSzZLsnr/qMjvQ/uaNTDr3JlM540G6HWAqgp0Cr1H8MLs7pkKYbK7FCr1Vq+ceWzZtjvxhnLhH71bBcDwgqW071iftzJzCDoXUkj4xUtpLRFO3wJbRjluMDIy+8tDY7SaKiMq1zO9FPuIh9RVewSF5uaWsKdOdq5gfpws2nIs1R4wE+V0hX+atL8IZLlwRrDITmvikZddA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8438.eurprd04.prod.outlook.com (2603:10a6:20b:411::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Thu, 21 Aug
 2025 20:18:26 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9052.012; Thu, 21 Aug 2025
 20:18:26 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 21 Aug 2025 16:15:57 -0400
Subject: [PATCH v3 22/31] media: synopsys: csi2: Handle alignment
 requirement for width
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-95_cam-v3-22-c9286fbb34b9@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755807362; l=1837;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=XKmU15gdj4tOY+sTYSb8OVLIZy1uUFbDeTevdWEZRzw=;
 b=4taJd53iydAd1S2bMcuOqv28nXZm5lBU6k6W90nttRDdIySgKBFTNHJLaFm6fomr5YEbZDQJ+
 4o0ZXKH3LSSA+q86ByAEDSI6E31GylHDdTeHbwafBrIM+qWlq6GYJVV
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
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: e00db669-0b40-4124-dbd7-08dde0efe2d7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|19092799006|52116014|7416014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SVhkZWw5MlRneGRweEVBVGt5YW1xRzVwSzJtNEcrejFNeldSOVpEeTdBL1dw?=
 =?utf-8?B?NU1kZkdPdlExNkF1Wnc4Mm5CMkx1TWJ4N1IxSEhEeUFlc3gzT1lRd084Si9x?=
 =?utf-8?B?bGc3dXNLNkNOL3lyQjJUaGprTTZJMXhpdXd0L1JoeTUvMndkcnd3UjB0bk40?=
 =?utf-8?B?YmV2Q0ovby9pYXlHM1NER3gzbWd4K0pidnNhK0d4UzNSVmFoZ3dJeXljTjBp?=
 =?utf-8?B?VDExU1FjUGFPQVMvK0ZzSW5ZNEVjSEVlOTU0N0lHQWdhT3gyS2Zpa0k3K2Nk?=
 =?utf-8?B?endRQVR3WGFPTElxR2Y3LzBuQnkzaS9Ua0tsZzB1MTNjVWhnclJhM042S1B3?=
 =?utf-8?B?TmIwTGphNVh0dVB5c2VXaGJmNVlqYStPS2xPb3RPVWFjby8vMHlQb2lOcnRH?=
 =?utf-8?B?Q21KcGIxZU9QOEwxZUZoS01DQzRtYmNLL1NJdERxOHBjOS9ia0RnWlZhOUFX?=
 =?utf-8?B?UmI3TkNmdmpBREo5T2xHeGFMZkpXd3RHOHkrdy9GT1BrdmJLZVVTVFphVFJ5?=
 =?utf-8?B?c08rdlpZcm5iRkVMUGV1MlRUNjZIVHZkM0J3NWlUSDVrQ2VLVzF0RFhBQkZR?=
 =?utf-8?B?b1hDNE5FVkdqcjQ4b0NGUng4M25KenBwdG41UHJYZCsrL1RFMHpUc2xEUndp?=
 =?utf-8?B?eDQzMHJwSUFEQ09SczE1VXVJcjBDdDR1MGVXanlpSEg0emQ1eWI3ai9PcXZX?=
 =?utf-8?B?Mkk2QVNVWTJNVU8wRGMxV2JJNGtCbkZEcythTlB4VDM3dGV5VFJyaVloQlhs?=
 =?utf-8?B?dHlvVW54ZllsUXN5ZEhHRVZ5Z3o5cXNITUhnenlTM2VMVHpCdm5JQmRySGY2?=
 =?utf-8?B?bTR0U3Nqb2xNdWZOWDl5eVMvNXNiaXNQMlFZOVl0REo1SWdTNkJrZGF2dGM5?=
 =?utf-8?B?YVpwRW9kMU1hVWhqN01xRnB1S2g4SktxenRmZ1VqTFhrYVpFM240NE9LRHFr?=
 =?utf-8?B?Mkc1SDNVT2JINGFhZnduK1djWGhOTHJNMldoQWk3bk9mYi95aWRCQVFSSnpi?=
 =?utf-8?B?eitQTEQwT3Q0NFRFMm50SWgxUUVISkczSmwzekdCQXQyTlB3QjYvZ3pGempz?=
 =?utf-8?B?a1duZDRyNmN3cWI2Q1VFRG11cVp0TzN6MURvK1NRVHlmNHRUL3NJV0NFY1Ry?=
 =?utf-8?B?RlBRU1k0UjBQVWY4RnpiaXBjUTYyZnI0NTduZlZPRFgvbmROR1BucEtyR2I1?=
 =?utf-8?B?SjduRGcwd0hRZ3dVWG9lY3FYVTZYWVUrb05kZmluYUUvbCtOREF1RVhMVTJ1?=
 =?utf-8?B?dEJwbzdCMjNtcXB1TWpSVng4SXV2cTkzRVp0NURtVWxMVktxNHRSYlo3RDlV?=
 =?utf-8?B?R2t4YW8rRW5FakUrUkszUDY4N0U1aHJNZmtmMW9vY3MyM1gwWmtSQlhlNEFh?=
 =?utf-8?B?TGVCNlRNSEFNUVA1REN3bVZSdldmTXFaTWlpSkZVdkN0R1FRa250VFkzUTBQ?=
 =?utf-8?B?dVQ0RCtyamRsaE13dHVhSWV2dmg1TUs2ejVIOTZ0ZWw1QlRVVmptQmkvYU1O?=
 =?utf-8?B?UzNsU2JSZWhWVTJHOU8yUlQ5QXVudG04U0hJcFdlbkRvcldpVUUxVWtxOVp2?=
 =?utf-8?B?ejVzZW0vWjFjd1VPNkI3bTVFc1pFSlQ0dDNTNUM3THJvcWdEblpLNXdaT3Fu?=
 =?utf-8?B?UFBLcTNlellRZlRKNlNvTkpWWXRYc0RYRzA1QnpoeThvL2l1empUVFNxK2xO?=
 =?utf-8?B?L1pLL1oyR0JyNit3eTZXQ2RQUktJNHluMm5FaXU3UktkZW5rWG9DaVhFWGNn?=
 =?utf-8?B?c2prYW9uRFlDM3ZtM2JINnMwS1pHV1JWRnBZb2ZNZDlXdWFTbzZiQ1dLeUFE?=
 =?utf-8?B?c25RUTdKSnpVWlRqVDdXQ05FRTBrWGFKOFBVZE1iZG1HL3dxQ0VycXp0QTZ5?=
 =?utf-8?B?SDEzOXlNTk01YjQ4M0RIU2tYZEd1VWMyb1V6cVdtVTJwclI0VkZzcUVZdkhP?=
 =?utf-8?B?NDFhTkxiT2EyVEVVbmk4WkZyWUdCVzY3UHN5c08vdkxGQXVmMTYwaU9tdTJq?=
 =?utf-8?Q?RDg+4XlzKhXSv+TYRM8RrpPQqCy1fE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(7416014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MzZEVzhHUUZmRWpWSWlZdXBmUWRaNlRuTmRndE9wcXlyemtOc1ovSVNDTWwz?=
 =?utf-8?B?VXVxaWNWcThDU1lXZkJtY0piQ2VITjBNRkNORzF2ZUUySDJKUTV5L3NiL3Fi?=
 =?utf-8?B?bU5VSjdDa2xyd2RHKzlVMzRKdWh1eW5SWHlNU2pLQnRGYVBPRVQ3SEdJR1o2?=
 =?utf-8?B?WUw4Zk0rdHRSVW45YUx2Mm9XbmY1SnhHbGkwL25NR1J2bmlYSERFaTE3Q0Rk?=
 =?utf-8?B?dmFxVXYxL0ZMNlNDRWdCN3FrYjBxME9BUHY0WUhjSG1sZUV4VStnMXhBMld1?=
 =?utf-8?B?UTlWTjExYjJlbkwrZ2E1elNBT1ZSdngxTWRWYmxaTnRrT1RsZk1VZWV1dEI4?=
 =?utf-8?B?Q1V0Uk1tRVFhNW1aVVh2Nkp3Zy9Jc2NHSlNWUXlySFVOU3M5cmNNY0d2bk84?=
 =?utf-8?B?OGpTMGliVEsrUEk1R3E0WXBxNmJNQW1LNDl5NjhTMTYvWlZEdTUyQy9iaWtE?=
 =?utf-8?B?dzNxZTNNb3U1WVhORXhLSmlBTzJLNEJtUEcxdkI1N3BwRFZwUzB0RnFZTi90?=
 =?utf-8?B?VkdWK2JDSlJiekYrMlRJK0EvRGlDNGFGZUIwOXN4VEpoZC96dUpRenNYeVV2?=
 =?utf-8?B?ejBTOGM1RVp1aHJYY2FRemR5T3RUVlZqUUYvYWZYT1NOMkkxVjNqakxqdGEv?=
 =?utf-8?B?d2VkVkFPS0dpYy9Uek1zQm9sb1ZDUlE5c3IyVU9CZXc1WERoY001VThrUUYr?=
 =?utf-8?B?THNyRTdQL2VPWUMzWVpDQ1hZSEdQdDhrTiszU0JiYkhSOWpYL1FGWmVzQjhx?=
 =?utf-8?B?Vm1mbG41VkRxSHZ2LzFwcjZxd3hRc0Q0VkFSU2hMTW56SnVZUUp0Zi9OWTFo?=
 =?utf-8?B?NnkwbDNhTHFoRG5pTk0yb29KWXdRNnVaUTY0eXNMNEYzS3BjNnhDcHZSUU53?=
 =?utf-8?B?bWs1VzBtZ1hiaUcwbnJMdEh0VDJxVjVrYVV1dkFEbEE0Yll6RVYzYjN1OENB?=
 =?utf-8?B?TVV1T1RiS05UeHJoTVdEbEh2cEllTVl6MEp6TEVYQTdROTlNLzlOOTlrbW1J?=
 =?utf-8?B?Zm5MdmFjVEtDbkdkL0JBYXpWVVJBTHJXWjA1YXRKV09JbUJsUjFyUmpYamEx?=
 =?utf-8?B?Snp4VFk2RG52S09zZWV5R2pIZFpSY0RzYXVYZ2dWTzZUUkRTVE9aL3RWUmtT?=
 =?utf-8?B?Y2FCN2xseGk5aGNyNGVCOFpOQjdRTm9YUnJ4OGlWc0l6MXF5VTBlSXNPZFh2?=
 =?utf-8?B?YVJJdEMyRjBNVy9pTEZxRUVYR2VsWVQ0QjErNUwwcU8ydzVXL2pUSVpPa0tU?=
 =?utf-8?B?M0x1R054SjgwWXlJMS93Y1NtaU8wanZ1NllxVGdnODlObzJGa1lJNFA1eVU3?=
 =?utf-8?B?eUNkcy9xUjBXWGwvWDRSY3NNM0t2RFNRczdXK0x0Ym5jSXJJQUF6dnEzMkQz?=
 =?utf-8?B?eVFvMGcvYUMvbE5TZG1aOVM5N0x2a2hFeGw1WHN2YWVYYlRhQVZCZ2ZkT1Mx?=
 =?utf-8?B?MVhicmF3cDFHcHQxbDlQeXFCL3RXL1h3VERrdVRxanhBRjBlekpiVDNqUWZu?=
 =?utf-8?B?ZGhQWm0vWXRFOGkvUWYydkxseUZYaDQ4ZEVGQWhQV1Z2bG5MdTI0Nll1MXNG?=
 =?utf-8?B?YW0yMlJYTDYzMmRRKzc4NDdxMUw3Qzl5ZlN1ZFFFWHMrTTN5MFBNN2hzejZS?=
 =?utf-8?B?S0cydThUTHAvQmwwcnVHRjk5QWpqOTJQK0VMcmlqMG9PQ1RYQVNuM3FEUDlT?=
 =?utf-8?B?RU40RjBxUjB3b2ZpSnlBYldsZmlxakc5OHV3dzNsL0M5bGRzcUs5dUs3WEdw?=
 =?utf-8?B?UmlqdGIzM005MGEyM0U5NFVhN0tuUlRDZG1paTdyNllHZit3SnkyUEZmeklH?=
 =?utf-8?B?VlRFUGpSa2F2QUtUaEFpOHpnSXVCTkFETVVpdUdqM1BWZEJ1RzgxUjJXSkt1?=
 =?utf-8?B?bm1LS09xU1dUYW10ekEyTmVKL2Njd2w4ZStzYWZrc1Vybk5qQndYZEllMnIw?=
 =?utf-8?B?azMvdWxNZ202TkMwRkxacGRPZyttUVNkV3lFalRGQnMvYTRCKzVLeDRnNEVm?=
 =?utf-8?B?cmgyem5pbkJhbFg4WCsyZnRxcHVrMFZyaEg4M0dhcmJzSExVaStoTmRaY0pQ?=
 =?utf-8?B?aEtMdkxmN3BRMEhBb0o5K0w5cXlQVFdOdlFBM3hJM20zaTd5eUFPVDVqRkJN?=
 =?utf-8?Q?ePWc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e00db669-0b40-4124-dbd7-08dde0efe2d7
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2025 20:18:26.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M5yKM+0R7gECjtMqJWL6ecxf7pHtqPlu4nSTxy3GSiSCKh0Wz4SRDF1iVIyVeRClJ20XS4vyJEfwggV4szrroQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8438

bpp * width must align to 8. Use media_bus_fmt_to_csi2_bpp() and
v4l_get_required_align_by_bpp() to get width's alignment requirement.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/mipi-csi2.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/media/platform/synopsys/mipi-csi2.c b/drivers/media/platform/synopsys/mipi-csi2.c
index e628cc67046b05bf0178c002a8bdf4bbcd64b30e..5435b58de55d21aa957fc635c950ba2ae25a8dcc 100644
--- a/drivers/media/platform/synopsys/mipi-csi2.c
+++ b/drivers/media/platform/synopsys/mipi-csi2.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
+#include <linux/limits.h>
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
@@ -664,15 +665,31 @@ static int csi2_set_fmt(struct v4l2_subdev *sd,
 {
 	struct dw_mipi_csi2_dev *csi2 = sd_to_dev(sd);
 	struct v4l2_mbus_framefmt *fmt;
+	u32 align;
+	u32 bpp;
 
 	if (sdformat->pad >= (csi2->num_src_pads + csi2->num_sink_pads))
 		return -EINVAL;
 
+	/*
+	 * The CSIS can't transcode in any way, the source format can't be
+	 * modified.
+	 */
+	if (sdformat->pad < csi2->num_src_pads)
+		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+
 	guard(mutex)(&csi2->lock);
 
 	if (csi2->stream_count > 0)
 		return -EBUSY;
 
+	bpp = media_bus_fmt_to_csi2_bpp(sdformat->format.code);
+
+	align = v4l_get_required_align_by_bpp(bpp, 3); /* need align to 2^3 */
+
+	v4l_bound_align_image(&sdformat->format.width, 1, U16_MAX, align,
+			      &sdformat->format.height, 1, U16_MAX, 0, 0);
+
 	/* Output pads mirror active input pad, no limits on input pads */
 	if (!(csi2->config->sink_pad_mask & BIT(sdformat->pad)))
 		sdformat->format = csi2->format_mbus;

-- 
2.34.1


