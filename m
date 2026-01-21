Return-Path: <linux-media+bounces-51301-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPP6Fhk+cWnKfQAAu9opvQ
	(envelope-from <linux-media+bounces-51301-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 21:59:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E885DB7B
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 21:59:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2818FAC7601
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 20:42:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2F8840F8E6;
	Wed, 21 Jan 2026 20:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Yu9PwRSJ"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011056.outbound.protection.outlook.com [52.101.70.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA1E3F076C;
	Wed, 21 Jan 2026 20:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769028146; cv=fail; b=pJd8P+Qgc6P6+G4bTDGvmJs5p3Gs5mO9ztK1zMTYylm/wegnpT7TO/S4Cy36Wu7jegZmHrzEO9AZrqHxt4wL4BP7UBMfwLwDWPEwzIklhZvz1rd/3LKDWO88Zc20E0RHsWttbMa2p+/anfO87214GE2pezGmhfAVanAtZvG4/N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769028146; c=relaxed/simple;
	bh=k1ePXVAoOLtoRMP6UjWBJ75AS9BONWBXe+iXD5bwyhs=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=DioJ6d2EQtoN2ED+nLt/45qkR0ZDBU2AaBN+vc264IFQn46yHhXosYdlGqAfrjDXPrBVVI8J0YjcaVF9rLkowBhU/o8e0MNRz6FC7g+1458RqpvDsa7zMQ/X+kROB4j0fNdHpNAXiUPdyH0po3PirVZSygUR/Hqz3bDBrdwm2rM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Yu9PwRSJ; arc=fail smtp.client-ip=52.101.70.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OLyWfMUty28Mds/3ccMmNXI/08iXuq9lmzmEWWdARD0HlDZho29HQKFL2tq8wQdu21fwk8scxTvBcI+6zh0WgxDtzK6pHrzImKzor+yG1qd5cU9pmWBUfDsD5zASQc61jYk6IVZVnt7+ayvTQgXk1MP1HGe7ECcaNTjcuo+k5FoudBDn/5PzpMARBlOc9JJGSxoT13XZQ1Fek0SN8cAhotYEPLoifGlWAdwMH3JIASwkIUKawtaXm9/d9UhtgNv+E8DzDidGz2O03VHDqtS4kCiTjBKzinFYjeLu7waWhm+hOlxQUwwCjLrJk90jkF3RozVATSQvgOH7dxxNWkjlDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUCNlEc3ooRdyLn+WMbFW3KpnQdEwzZlf8NoFNgbKAI=;
 b=LjeZ9ZVEWmfHi5fLoBQQv5HqkByaL5gqHHHmNkMPdy4Kg4+1AzuAuvyeVzUuIbWjQ6syq2SQC+U7/kBCHscN/bqiKEZcKsTfBaxL+mMpNynuWNgx/DG+F82A8rs+teXVD1up2veVYIroMq2Qz8VbfSIEgPEGAYB57W3bdNb9aXmVq5exbtZycYqoNTAH0Wm3gzpGHfGC8ar/WnWRWMv8TwTV+YBAZGerDgxoEfqODg+T64tyYYnw411PilQ8VthWzysDyECtSP2zB3JM927KcmqGQF/PFN0xIhnWPXYY5Am5E/ahf6SeuTfH4ToNzig5DoJTdMI9onsGJ0FlohSxMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUCNlEc3ooRdyLn+WMbFW3KpnQdEwzZlf8NoFNgbKAI=;
 b=Yu9PwRSJytbjNms5boeW9oXrwUmWoc7mLLuhNBY9GkyNfVwVHrPULNi/COUvY0Npy5SmL9nOldqHEykKFK1QMOYqyAJhCiJMYg+mlk33cirXRAzI8FsC0HEwiUKql+ndmsRxWAgoexejCCCt2Oj1qLJWp1lk39KI/4XS1QgpmbO8qCX2sm+/XvhDiOA4xGC5bhPCeeTSaVgXrGsX0j0a+tzGYAXYp6+zeTA+Y06hKRpc2ZLrwZbpKTmjE6n4t52aShh5j7kPeqRf3Vra8sjZHQbIpVvnUw8GrDcQ0lQMuWz7rf9F/ZRHFIc1mvRj5BbHtR4gv9nqnCw7S3wL76l/Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM0PR04MB7010.eurprd04.prod.outlook.com (2603:10a6:208:199::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 20:42:20 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 20:42:20 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 21 Jan 2026 15:42:03 -0500
Subject: [PATCH v5] media: nxp: Add dev_err_probe() to all error paths in
 *async_register() helpers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-cam_cleanup-v5-1-01d1ab38db9d@nxp.com>
X-B4-Tracking: v=1; b=H4sIABo6cWkC/1XMQWrDMBCF4asEraswM5JlKavcI5Qij6RG0NjGT
 kxK8N2rGEKq5Xvw/Q8xxynHWRx2DzHFJc956MtoPnaCz77/jjKHsgUBNWChlewvX/wTfX8bZWe
 Cg8674FmJIsYppnzfaqfPss95vg7T7xZf8PluHUSsOwtKkIaDJttS6Fp37O/jnoeLeFYW+i9dL
 anIkFpFzFalhLVUb0nY1FIV6Q0614CxSdla6pc0gGhqqYskxxHQaNBaveW6rn9mbyhXUgEAAA=
 =
X-Change-ID: 20250807-cam_cleanup-b6d90ba9dac3
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769028137; l=6202;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=k1ePXVAoOLtoRMP6UjWBJ75AS9BONWBXe+iXD5bwyhs=;
 b=t0JgR2UEqTm6xJINrTRQXVS5tnNQ4ge6w33RRDM7HXNGVvnP8lxSKSaxID518N2658s7QGj7U
 /8+ydhFr4z9A8IhfN8ZhJTVKcRPQaAInqT3sr3+cI7Haiehhw0aO/+f
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0068.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::24) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM0PR04MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 75d30fd8-e956-4cf1-a714-08de592d92fd
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|19092799006|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?R0M1TzlDUGtzWVNOeWIvTm4wRTBOcE9NTW1oUGZNaUhvNFpOeGxwR0pnSnc5?=
 =?utf-8?B?N1plUG8vYW1LSFFrbDdMMFkvajc3eHc4N29zeVg2dERMRWFPbzJBallaelAv?=
 =?utf-8?B?WDIwUTQwQjBLSVdMbFVIZG5ma0k2QWFsa3JPNzluSXl0MUNHTEZhSmRGTUpu?=
 =?utf-8?B?dytPT0RpK0M1am4ydlM2VkdESTZhNnpKZjIvZnR5cEl1ajM4Vnc4YlFEUnpP?=
 =?utf-8?B?YitTRXdQNHc2UnRTTlZGaSswVE5CaFdCU1p4RGRBUnBpSko5REwxVmhodUhW?=
 =?utf-8?B?d0NyYUNsUlVsdnA1QnZ5NnB5Q3JPcytqTE1LOXhZQ0tyendPaCthTXJmU3lR?=
 =?utf-8?B?ODRwWjU2dmR6QlJ3TUNjT0d3WDVWcUp3NHl0OWN2OGhYRjlMbkx6Wll2ZG1h?=
 =?utf-8?B?RVZpOEdla0lCOGhqODlvcVNNSWFCdU4xZlU5SXVOZjFtbENzZDd4NnEwMm9u?=
 =?utf-8?B?enF3R3RVLzZXVEVqS1FhK3IyOEVUcW5yTUdkakpMWklDYWwrZmt4WVUxK3hU?=
 =?utf-8?B?cjdiYlIyWTZFTUk2U0IwVHVJZS9DK0Nzb1A5Z0FuUldzdUc2T2pTYU5pRGs3?=
 =?utf-8?B?UVVmTkVHM2JLZWdvVlhuY2FxdmNZcllOK1FMYnlkb3JRZ2dyUWluU3ZaVytQ?=
 =?utf-8?B?a1ZUWWlVWHRCUU5LTmdzR3RFWjJ5T3RtOGtQeTlPd2Y2TThpOG9ENU9MZzRC?=
 =?utf-8?B?L0NRZ3hIRU82VDVYc2hORndwNDRhT2tFN2dDYmNvMTdoYkJLNWViVWowcVRN?=
 =?utf-8?B?RWN6UXRabVVRY3FHU0xJM2JtM01UeGtBYXpCZ2tnQ2w5ZmlnZHZpZStKRXFy?=
 =?utf-8?B?TGV0bTJydFo3cGVsWFBGZHFPRzA2TmZYbHkvVVlxeFlTOEdVSnFQMlgzcTZw?=
 =?utf-8?B?K1BaN0N0NktlTytObHBTbzdwRm1KaURtbFFXVUw5aUR4MU1QOVJsSlR2cUVz?=
 =?utf-8?B?b3kyMmFkdUtFWnJvSlFvY3RrZHlQMGdmZ3pkZnFJbC9VQ3ViSEpmZE1ZTVh2?=
 =?utf-8?B?eGlnZC95ZzVDNXhTMmdLeUt5WUhxU0xBUGxkNXFhNUFMQnpRbVl5Q1VIYzQy?=
 =?utf-8?B?Vm55b3gwQ1dXaW95N09CYWZVK3c4TmNpRzVBR2FrRzMwdEtmQ3hlb0RPTlRm?=
 =?utf-8?B?dDNJVWlKdjRmeFgweFgvVUFGQVVsUFlSWHlUSGUzU3RnSFA2OXI3OUs2NGl2?=
 =?utf-8?B?cFNpZlVTZEZxZVVLTERVSkZOQ3p1d01NUmlUSjVCa0gxTFhLOFBDSDB2YXMy?=
 =?utf-8?B?SEVKZjRCYXZZd3p1NEVyY25maEN3M0dzNjliRE5oWGMvdzNJTlFiS1IrcGRN?=
 =?utf-8?B?L2lrb2svcDRZTVhReVdudklFdGNyMWZsdlAwcjVZeVlNcmVGZ1hMRnZkN2Q4?=
 =?utf-8?B?akFGQ1YzZmp1eUs2TWlpTjVYaEV5cldCSjl3TmdIcFN3NVZURW9FeDVrdGF5?=
 =?utf-8?B?MzhjUnNnT2ttQ1c0L01CSjM1K056RERDcytMU1pZL2xjS2ZhSmhzZ3RzM01r?=
 =?utf-8?B?MGZvSDd2VTFzR2x3K2xWL1ZTMjNPNEludmhONlJsQnVrOVZoK2xZdlVwOUo3?=
 =?utf-8?B?citDS0hLR1JGYkJiNkdGQTJVeHRZdkYybVVNNGVVbmVTWWluRitFN1NLczly?=
 =?utf-8?B?Ymh2QUNhVjRZNWREa1ZjVnNNbzhLNGVFeHRlajBUYnJkYzltYnY1WDZTWlhw?=
 =?utf-8?B?YzdvdzFpQW9LU2FKcFNBMmNxYWVrMFM5YkNjdnZaenY0eTliNmRuY0xLKzJO?=
 =?utf-8?B?WlZXbGJXSVJ4UmI0WkM5UXFZRWZVbmd4SnRxMUtuN1F3RzJzZjhWV2R6YlVq?=
 =?utf-8?B?UXVoV3Q1ZmY4MTNpeFdmbzljd0xJZ25mMU15TGVYdXdKNjBSem5PU1F1YVhB?=
 =?utf-8?B?azl3K1UvcWhMSjhZWWdIZStRRWpVUklWOWNuS3dmWkNFTlVIZXpYYkFNRysy?=
 =?utf-8?B?djJLbXJyREZXOXdJVjUxUitwWTJYQjBCdVdwR3hYc0JBQ3p5N3NsRmFJM3lC?=
 =?utf-8?B?SzFtQjJubVdza1VUcm5pbHVvN3h6WkpDaG1vMEtGbG9aaUprVm1VdkdWcS95?=
 =?utf-8?B?VnJTeC9Qci9QSW1Na25EczJoV1hGdUxXekM5U0FrZEZEL0hmNjNjeGFDYkZK?=
 =?utf-8?Q?W6cZbY2rpB3Cfb2yhkAG2FfKF?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(19092799006)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eE1zUm54S2xjMEo1RkdMbEdZd2NmL3M1REJPYVFyZ1hZOXBXdlJscUpFeUZN?=
 =?utf-8?B?MHFXZTdwZnNSbGJzWHZBTzdyeE96aFMvaFBRWjJXRm51VUl3OEpOWjdDNlNr?=
 =?utf-8?B?S0NpN3lRK2pNZW9HSXh5WDZzV0tGdU1Ob3dwSDlVS1hjOXhTQWxTMWhOTEV3?=
 =?utf-8?B?MFpyeUhQQ1hBY3pZZThZWE80dFlrRTlmK1pvb0hPLyt1ZVFBOU9DTlVxSDl3?=
 =?utf-8?B?V1RJOEd6ZUlBSHpwWVBFTDlaSlBidGZrSzF5aXUrK0NJZ2VIZm44RnFlNWla?=
 =?utf-8?B?endoaXNoNVdiN1RSUjN1bEpWemxyaDdIUWtSSmxnbUZNYXVwTHhwQXQvVmI1?=
 =?utf-8?B?bFRPbURzWG5QSXYxRDdndmF3ckY1TlRvUGhkTytzeVZyb2VRRFBpMFBMWmxr?=
 =?utf-8?B?UVlKbGFpcEIwTE93eTZFQWx4dU82MWR6cVBsNURCSUROMy83Vm9RcnpXVzFE?=
 =?utf-8?B?N0pnOXFNRlNGcVF4YVZNMjZHRTFHeUR0K3hsbW5jakJrN0NsWlZtV1JaY3Fv?=
 =?utf-8?B?dnloZVlWTkJYWldUVmZLVzdpYXNZbGQ3eWVSbzVSdTBzMlRZY3RVV1JEMWFB?=
 =?utf-8?B?R3dwdjZYR1p3d0x6anBwcUt2S1Qva2NGbTZqRU1FVk1hcm5NeVdBcHJyQ1VS?=
 =?utf-8?B?ZzlLcktRbTRHQjYvN0FmdjFBM1VPSWpjOGpXdGluM3lzazJNUnNHRGNwU09Y?=
 =?utf-8?B?OUtTbTBjaHZHZ2Q1TmxQdVlSQ0VFRVkzMllycktpLzlBVWR2V0s3NTZnWXVy?=
 =?utf-8?B?Y0xUSEFuQ3YrNnVPTVZwMEg3Z3pRdGpFMHByVWdSeUdaQmJUZm1PeElPd0tk?=
 =?utf-8?B?elB4V3EzTmxRNzBzMUl2N0ZPY1RKMk9WRGNnZC82V0RyZWRMSFJUbDhzWldK?=
 =?utf-8?B?TjdzamRpbDFaaEpCZkJSOVlNRmEzSXZsK09VL3U2bkFMR3R2R1Y2VTBEUWkz?=
 =?utf-8?B?VGF3RTdHQUE1bXN5VzRRV2xubUJQZ2dPQnFxd3drUkNpaytYNnFqUmorcTRX?=
 =?utf-8?B?cXZCblZhN3diamEza2szSThWU0h4NVhrTGNGSGlyNHQzUm5IajgyaU9tckxI?=
 =?utf-8?B?TDI2Z050RmVhbUQ0TTc0RFFxYUJYRjRCWnVwYk1wR2V1WE9LRnl1MFdiYzI4?=
 =?utf-8?B?cXlVQmt3WGIxeGxReG5XZXdBQ3V3Vk9saCs4b2FGOXJaaUVuWFYxd29GaVdV?=
 =?utf-8?B?TDZ6TWNUZkN1a2VOWW5KSkZFU1c3OWw4NFBWeklDbDA5cktyWG50UzRXaVkx?=
 =?utf-8?B?Sm9vY2x1YUJMaHV0ZWtOZ0lLNlhaTS9ITWRyaHdKSDducG12U0RlelY5bWRj?=
 =?utf-8?B?K25kNG9JTFZ0OXFtWkFTSURzcTFKbnAwbUFNZkh1VDhHVGthc1BaaUtxQ3o4?=
 =?utf-8?B?eWNqMzRDNEtrdkRhQmFGRDgxZXozc0tvNWxlRE8xeDkyME93c3dNMFZaK0hv?=
 =?utf-8?B?Z0FEK3NxMEV4WnNXM2dEVE9IbDZLc2l2NFdxYWo3a3NvM0dRMTZ5cUYzeVc1?=
 =?utf-8?B?NjNhOWtqSHY4YzNabWJnNHN2QmpvdDIvTnZ4NkpZeWI0YkJVUHBRTGdHeUFs?=
 =?utf-8?B?WHZ1STJPNmF5QjJQcDl1T1RCREhsTm0zTFdhZXpzZXM1bFhpWTBSL2Z2LzQx?=
 =?utf-8?B?N3JtbEwwdEx1d1JUMzljaXZlMzcxaXFVaVFpallGdmVFa0swQ2ZyVE5JdGVj?=
 =?utf-8?B?cy9GZlgxanlVZjFVa3ZGejY0Njd6eW95Wm9BRzh4aWkvcVE2NGdvdzk1bHE4?=
 =?utf-8?B?dXpmeEdSWnZaejBjOXZXTFdOUUZONUFFVDRwWXlDZzRWd2JsRXZaa1FsYmI0?=
 =?utf-8?B?K0R1OXQyT2FTa3l4Z1lJcmFrT2s4REZMWXdBVmZnKzhjMXBQN21YemNveVlZ?=
 =?utf-8?B?eFZ4VU05bjRtUTNLWC9jMS9IUkJkanJBQXIxRWRoaHRudGdxc1Q4T0Zsc0Vo?=
 =?utf-8?B?WjlLeEFqQWlZd2lqNFNHT0NiNFhWSlNRZUViVU1vRER4dGpzcElwQjQxdUx4?=
 =?utf-8?B?eVJONjdaTnNDL1QveHo2TFkzdnFMeWVrT1VxeXBPRGpLOTlPSW5PdHR4c29p?=
 =?utf-8?B?RHc0ckxWRkpFNE9rRTNEUjFLQ1BNMkpQM0czVUJnUHRVRUJINWFKamdMc3VC?=
 =?utf-8?B?VXdLeGlNcU5WR3hvS2cwK0FSQXBJaVNsWXM3QWl6L3BnVjBJYWoxOE9ubjZG?=
 =?utf-8?B?WW80Y0R6OUlyaEh2U0FGR0RrSFZ3VGFIcm0vQmlaMFpWYmxqeTNIeXNuQVhk?=
 =?utf-8?B?aGM1Q0h0Y2VXL0F1ZTZBK0NSSnZtSHdGTUFCZGM4aTYwNEZOYVRjakJkbGhD?=
 =?utf-8?Q?vA1lpCXOojObxVYaX7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75d30fd8-e956-4cf1-a714-08de592d92fd
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:42:20.9016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyLFB9nl54bvJTt5/pTsKu2VvoJr5dhQhxzJdqTEYCP3s5kMIGUl8dWMGVlFhuhuntCSN2kHY/WMDJXlXQhtmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7010
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51301-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,ideasonboard.com,posteo.de,puri.sm];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[nxp.com,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,nxp.com:email,nxp.com:dkim,nxp.com:mid]
X-Rspamd-Queue-Id: C8E885DB7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add dev_err_probe() to all error branches in the *async_register() helpers
to provide clearer diagnostic information when device registration fails.

Drop the explicit error message after returning from
mipi_csis_async_register(), as the error is already reported by this
helper.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Some trivial patch to reduce goto at probe functions.
---
Changes in v5:
- rebase to https://gitlab.freedesktop.org/linux-media/users/pinchartl.git tags/next-media-nxp-20260120
- Link to v4: https://lore.kernel.org/r/20260116-cam_cleanup-v4-0-29ce01640443@nxp.com

Changes in v4:
- collect alex's review tag
- fix grammer in error message
- Link to v3: https://lore.kernel.org/r/20251215-cam_cleanup-v3-0-a61995068f38@nxp.com

Changes in v3:
- rebase to v6.19-rc1
- avoid use __free() == NULL according to cleanup.h
- Link to v2: https://lore.kernel.org/r/20251119-cam_cleanup-v2-0-df732cc83ff1@nxp.com

Changes in v2:
- add new patch media: nxp: Add dev_err_probe() to all error paths in *async_register() helpers
- detail change see each patch's change log.
- Link to v1: https://lore.kernel.org/r/20251117-cam_cleanup-v1-0-6cd42872db79@nxp.com
---
Change in v5
- remove "no functional change" in commit message
- fix error message.

change in v2
- new patch
---
 drivers/media/platform/nxp/imx-mipi-csis.c    | 31 ++++++++++++++++-----------
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 27 ++++++++++++++---------
 2 files changed, 35 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 9a43fd1eb0bcee7ac0c47f28ad89012de45a70d9..06ea96b8eaf61058d6979b7be747496480c4bc69 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1359,18 +1359,18 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 		fwnode_graph_get_endpoint_by_id(dev_fwnode(csis->dev), 0, 0,
 						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
-		return -ENOTCONN;
+		return dev_err_probe(csis->dev, -ENOTCONN,
+				     "failed to get local endpoint\n");
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		return ret;
+		return dev_err_probe(csis->dev, ret,
+				     "failed to parse endpoint\n");
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(csis->dev,
-				"data lanes reordering is not supported");
-			return -EINVAL;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(csis->dev, -EINVAL,
+					     "data lanes reordering is not supported\n");
 	}
 
 	csis->bus = vep.bus.mipi_csi2;
@@ -1382,15 +1382,22 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
 	asd = v4l2_async_nf_add_fwnode_remote(&csis->notifier, ep,
 					      struct v4l2_async_connection);
 	if (IS_ERR(asd))
-		return PTR_ERR(asd);
+		return dev_err_probe(csis->dev, PTR_ERR(asd),
+				     "failed to add remote fnnode to notifier\n");
 
 	csis->notifier.ops = &mipi_csis_notify_ops;
 
 	ret = v4l2_async_nf_register(&csis->notifier);
 	if (ret)
-		return ret;
+		return dev_err_probe(csis->dev, ret,
+				     "failed to register notifier\n");
 
-	return v4l2_async_register_subdev(&csis->sd);
+	ret = v4l2_async_register_subdev(&csis->sd);
+	if (ret)
+		return dev_err_probe(csis->dev, ret,
+				     "failed to register subdev\n");
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------
@@ -1549,10 +1556,8 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, &csis->sd);
 
 	ret = mipi_csis_async_register(csis);
-	if (ret < 0) {
-		dev_err(dev, "async register failed: %d\n", ret);
+	if (ret < 0)
 		goto err_cleanup;
-	}
 
 	/* Initialize debugfs. */
 	mipi_csis_debugfs_init(csis);
diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 9d946b68cf59d9f4fb3413fc90219efd380d9d95..8304b3d3a338394d6325929d28aa69d865ac8a92 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -727,18 +727,18 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 		fwnode_graph_get_endpoint_by_id(dev_fwnode(state->dev), 0, 0,
 						FWNODE_GRAPH_ENDPOINT_NEXT);
 	if (!ep)
-		return -ENOTCONN;
+		return dev_err_probe(state->dev, -ENOTCONN,
+				     "failed to get remote endpoint fwnode\n");
 
 	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
 	if (ret)
-		return ret;
+		return dev_err_probe(state->dev, ret,
+				     "failed to parse endpoint fwnode\n");
 
 	for (i = 0; i < vep.bus.mipi_csi2.num_data_lanes; ++i) {
-		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1) {
-			dev_err(state->dev,
-				"data lanes reordering is not supported");
-			return -EINVAL;
-		}
+		if (vep.bus.mipi_csi2.data_lanes[i] != i + 1)
+			return dev_err_probe(state->dev, -EINVAL,
+					     "data lanes reordering is not supported");
 	}
 
 	state->bus = vep.bus.mipi_csi2;
@@ -750,15 +750,22 @@ static int imx8mq_mipi_csi_async_register(struct csi_state *state)
 	asd = v4l2_async_nf_add_fwnode_remote(&state->notifier, ep,
 					      struct v4l2_async_connection);
 	if (IS_ERR(asd))
-		return PTR_ERR(asd);
+		return dev_err_probe(state->dev, PTR_ERR(asd),
+				     "failed to add fwnode to notifier\n");
 
 	state->notifier.ops = &imx8mq_mipi_csi_notify_ops;
 
 	ret = v4l2_async_nf_register(&state->notifier);
 	if (ret)
-		return ret;
+		return dev_err_probe(state->dev, ret,
+				     "failed to register notifier\n");
 
-	return v4l2_async_register_subdev(&state->sd);
+	ret = v4l2_async_register_subdev(&state->sd);
+	if (ret)
+		return dev_err_probe(state->dev, ret,
+				     "failed to register subdev\n");
+
+	return 0;
 }
 
 /* -----------------------------------------------------------------------------

---
base-commit: b7af7c950e1076a9e3d855045571be2de4ce9f2c
change-id: 20250807-cam_cleanup-b6d90ba9dac3

Best regards,
--
Frank Li <Frank.Li@nxp.com>


