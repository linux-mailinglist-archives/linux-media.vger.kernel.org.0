Return-Path: <linux-media+bounces-19492-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B399B23A
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 10:47:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 799CB1C217BD
	for <lists+linux-media@lfdr.de>; Sat, 12 Oct 2024 08:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A5E114D2A7;
	Sat, 12 Oct 2024 08:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="o1GL3+v9"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2083.outbound.protection.outlook.com [40.107.249.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411A7130E57;
	Sat, 12 Oct 2024 08:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728722858; cv=fail; b=DEvB5c73K7F9E9FOLz5cOAZDvFaw6IIJviikdkq0cFoWptFndOSjxVqNyoGmkZ21UM+5dYmqeOXgczKuKMVjafaJIL360OGrB1QT6UAEbeZgLTX73WoWUZtdmkhcQ6X2nQPWwLUfMyisTv9Dy1PIVdNPPH59ONx5ckzQBxX7aKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728722858; c=relaxed/simple;
	bh=igaiaCdettWdD0mWb//rjiqLdRxHtDOsW99FZDtNaNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YTSPXjDM/NDMNhFBf2zxHUWKLxvPR+qqCytzRa3sDalEAVn9JSDhVMFFBI/K1Ed4PdPz6IE2c2QAfsveI4+/jzr6EG24Ixusl87o4R0lAQtyFpwBQrFLfC832bHSGmgJkqNIO237rwW5HERW+bc3dJWZnlaNqnOikyD+i3aidFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=o1GL3+v9; arc=fail smtp.client-ip=40.107.249.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bac6P7n0pNr2nTCVlbPgOu8x0JuEsK1gR332IesYHjA6QVltqKn8NJvj8FHmJsysJY8M3m10e2w1C+gK5JwZqn1A072zVCj9Dh7AxWNYxH4GYyHgkm9iPvBxyxfk3qgKLN756n9uSiba2n1Uobpj50tnVZhTrc36ygPslP1qGYngNjgqA6449Pm2jt2izkZN/58CDknm95Vdn8QVDmty7apeyPq8zWkN79jjzt5KdwSCqpbiVoWhk3g6QHC4ruBEduK4eVvX/WWOys+CpbGJx6SyvB95CUn5jWHQRnURtfzqsojjQUAEbuy1mNGQA2tBQzfnKRaDvpicyk3NembOjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrToZeAd7gxE7v8SyH4+68ofrASs/O2PjVYiI/J58cs=;
 b=OzVeizEaHw6Hl4q96whgFKdPVojLLuOGfh1x4tuD1n/2YzY1tRO070/9PTOPueE3If6vEHtLEufKBl19TN3LYXCfmEFbe0kpk1dppGMXWp7Pui+SXTmnOVi14e5Ai5ParmLsFCbwkityqamznmjotWL3jd8GhXMdLfEJ6Ck1x9oN9j+x5fPkh3XRv+MudANlP8e5/+vMUqq1Ipj6kyRfWsVxQidk2tvKEmAn7jRocnMsYk/cnwa1086dNFRzlPi8BECqDf3vlyGb00cUY6l/WiX8kZszFHf8NL70JE1AquXHrZw+1Sx67IjWIXm1xaUPqQSMxJY7oXqW2B+8HcX+vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrToZeAd7gxE7v8SyH4+68ofrASs/O2PjVYiI/J58cs=;
 b=o1GL3+v9r7ta2Zph0cz4HqWHgEl15XgDOh6uXt+fRvloSFWf3dBKzoNOjSLWM/sH3W+VBDe6Tny0QZBwRNdnnQsJ9LfQazWLX08WhhIqZPiD93FgG/2Axkp4mBKnbLINbnvCpPs2HHCdnR8CTaJY/p9unLAlEHURtNzrMQjgyfBvKqInRClGJ2mIpnOzZc0hDygAJKx9hZW4nX/Sqi9te42jgUGL/Nrn1RE1u5xCnCKBAfM0eH1ojbBaJt4B8TK9Zrtbb/OW3GBpShSzc4ByP6CMouLF28Bb5N/URmaEvkzBM2RdQDcGXMdpxDdR2+0oyKPUv0Mk5xh1yERLyFMBjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DBBPR04MB7562.eurprd04.prod.outlook.com (2603:10a6:10:1f6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 08:47:33 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.020; Sat, 12 Oct 2024
 08:47:33 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.d,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string
Date: Sat, 12 Oct 2024 16:47:35 +0800
Message-Id: <20241012084732.1036652-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
References: <20241012084732.1036652-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0002.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::14)
 To AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DBBPR04MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 0191a2fc-4535-40ae-7db0-08dcea9a838d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ay9LSkVVQ0J4SCt2Wi9RdUZCcXJEcmFLZk1laG1VYWsxTkZCTVZYL3JZcDdZ?=
 =?utf-8?B?QWJOZEhveUhReGNzVjVYK0c1TEdlVWNKTk9FdmkzOEphS3A2NHExMkRpYnFI?=
 =?utf-8?B?TWpoTUVKbHIzdzdIdzhnUGJWTkxFRnd2L1VpRkFJdkhZbGhDcjQvdHZWSldK?=
 =?utf-8?B?QWRXWmdkemJZb0IvTzRCMTkzUWF5KzlaRjdtK3Nmb3dPN2VTUmJ0alpHb2lQ?=
 =?utf-8?B?L2tVdkVPSTYrRVNORzg2bW1OTTV1dnloVSswSDQxQjF3NlRIYjd1NWdjUFJQ?=
 =?utf-8?B?REFsVUEzSU5EM3dkTjUvZXBqV1ZkdUsvWXZtYU9makJ4aVRNUXZiRmlDQXo2?=
 =?utf-8?B?S3hrNnFJZHFDaXZRWDV4NzIzUWJYUklLMFZLU1FpMGhwell1Uk5GMVRidnhG?=
 =?utf-8?B?ZUlGZlE1MXNJZldXNmp0R0lJeHN2R3o4eTI0MXM3d2NrNGtNb0VWamZ3NHRq?=
 =?utf-8?B?andSTEJBeDJZMFZTMzNBTVVObGViUTRjS09QQ1BNM3ZRQTB2SER1Z3BqdGl5?=
 =?utf-8?B?b2dXNXBscVg4UTB6OW9OWWlSU3l0RE9JdHE5RXIrVEptL2dkU01mZjRTMjMw?=
 =?utf-8?B?RXl3SHZhNTJ1dHBXMm9ZUTRYNUxBT3hpTTF1ZXZnSmpJZGhleGVOcUtUdHJN?=
 =?utf-8?B?MjhITDhNMFBSWWhPRnowZTd2TU1Rc3dqNFh3ZW15YTJNT2Y2T1YwL3puNWVr?=
 =?utf-8?B?aTd1N01WWUlCZWZxeGRVWXFwTWphYzY1dlFNbHEyTzV1QjRQc1NiaU9ZMHVG?=
 =?utf-8?B?NGdYMXVPaWdQK0ZNRzN5cUpYSmVaMFNyaE9VZ0hGWm5KSmtOcDBvSEdMVXZo?=
 =?utf-8?B?UWZmVjdXQ0hxNlBuUFFOMmluL1VKMHNGaGQxK0hCRC9NN0FMQ3ZQV0RhN2ZM?=
 =?utf-8?B?Tml5VTZZZlBtSEVKSmZJNDVTTWpub1BZS1p4RFBkMWQ3Ym83ZXJJSTE3V1Ru?=
 =?utf-8?B?MEF1KzBmclhiTEZRbWY3c2s4NVRoaFNsdVlab3F6Rld3OTFaK1lycnFwNlNX?=
 =?utf-8?B?bFlWOVQ1cytBbDlpM1RyQWNXMHBxNWhVT1NwYm9La0VmRWxaWkZyaTZpdVgx?=
 =?utf-8?B?V2dQOXZsTTRuMkF0Um5rZVU4VjNnZ1ZsVDM3aE10Q1FxYnZ1c3l1SndiVFFq?=
 =?utf-8?B?VWdFQ1lRUlBWbXhMOUJlRmZxNE5nWlNVc2h6SFBSYS9nZzYxTnpPQ21DRkg2?=
 =?utf-8?B?ZVVqK3d0ZmF5SHQ2SHpwY0NoWVllU2gxVGZwL2J0NlZ6RE9aZWVzNi9YbG42?=
 =?utf-8?B?NTljR0l0OHFzYlBhZlVuay9CNEhicjNCTnFiZzdmd0ZOSUpYdVg5U2MxazZC?=
 =?utf-8?B?bnB3K3lTUkFqZ0FnVDJaTW4wZGFRMEVENVZoUnVHWFdhUjRYQmFRbFRDM1VS?=
 =?utf-8?B?VXJzZVN5aXlNaUtHWE85OGRkNXhHck92eGRIcXF6VGtpdmRLOGQxNmYxa3VG?=
 =?utf-8?B?QTBCQkdJYnpNbHVXYmR6MnhOSmFyRHR3bHpoK1lUZzdVbjhWT2RqYVQwYjRp?=
 =?utf-8?B?LzN6TnJoNFVDMUlkSnhxT0syNmhkdzlQZW4xWXN6WHQ3ZzVSZkVVQXZLdVFt?=
 =?utf-8?B?RkhhVk95SUNrcGFjbDZYRWY3cjJPOVNjZldjVU51S2t0WDhEcHdJd2lzYkQ3?=
 =?utf-8?B?QXU2ZjNwOHZZeVlrOW5UcHRkM055L2pKSEgwclNNK0V0MlZxMzNaUXVpSnI3?=
 =?utf-8?B?VVY2Vmp5Z05NcEZJY3A4eVh4eGw1ZXR4cU9ON25wNmdIQVFlR0VHOGkrcHJX?=
 =?utf-8?B?a0Nqd0FNRW56RUQyS1ZSUjk4bGRVWHlaVDBsWERncnFzTFVlbmU1SHdyU0M4?=
 =?utf-8?B?M0RoWTJvYXNhenl6bDZTUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?dkc3Y0laTksvRG9GUmJIcnVqRjBScEw1YmNYZVhhRWs4VjJ2clRkMDJnb3B0?=
 =?utf-8?B?aHVPeVVJUHBWZE96QThXamwrVFNzVTVocVMvYWJvSGU5V1hzRWIvcEVXWjZn?=
 =?utf-8?B?cGZ0eFBBczdrM3JxWFlLMEpIdis0cXBjZ1VyVTFPMk9LcGxLcFU0cEk5WkNl?=
 =?utf-8?B?bDRyanA2cXZicWU5R2VjMXRRaXlDa0s0ejJkUE9sOTBIQnc2N1BvRDJ3aHVy?=
 =?utf-8?B?TjhoWHJRdTc2aGk2cGlBcFpoWks5cEh0MUEwNGgraTJqSm51SU9LYnpheS9v?=
 =?utf-8?B?cHRwakc0RkpWc1FhRy9VSXFYb2Y4b1M0cVFYY2ptUG91a01WSUZZQmk0VmNU?=
 =?utf-8?B?SUJEYzZrYzVhYkRQZDhnQWE2dCtZRHVneEFzbitaRmJwUE5qZWlGZG9Qbkhv?=
 =?utf-8?B?anAvT2pBVTI2VGR0ME9GcU5JY0JBTi96WFFBcjFoMGl5bS82T2VLTHVkRnUw?=
 =?utf-8?B?U3RjdGs3Z1BuYStPMktjYVRyYmhKK3Y2dnNkRXhtNlBRVDlLTU1WcnBLSGFT?=
 =?utf-8?B?ZG93U00vUVBaUVpkQy85N2F6WVBrZ1FNRUQ5Vm9YbG1WN1Vya3ExZXhnV3My?=
 =?utf-8?B?Zk5sL1RrcHEvekVBNGFMS2dEQ255K3JpRVJZOEtoZ2hpZEQrYXhzejJybCtX?=
 =?utf-8?B?R3NtOHRscUtzQXcweU0ydTQ4YmxUM0tJRmx4UEVxWkFxSjFRQnNLeVNJSjlV?=
 =?utf-8?B?UmxDeTV2Ry9NRXo5ZWsrVXExb3V5NGhIdldQU1ZEYTZIbm8zcjUzR0E0b3k3?=
 =?utf-8?B?YXJ4OW90SWkwM0ZicVNlalQzdnh2UDFwOENLQ2tycDRxUy96OU1qNll1UVBG?=
 =?utf-8?B?R2dQZTBRUFA2R0pVTkp5anFyc05wY3BHelRmWVk1ZHJzbElQbGdOUXU4RlBV?=
 =?utf-8?B?UCtyaUJhWG00OFRDVFFBS2tLelpPZ3NxUnE3Yndxc0lHN3dacXZCRDFobElF?=
 =?utf-8?B?WGVOSVIrblFPZWdmYWx3ZStSQTYzZFdwbWhNQVVtRmd4dEtkTWxrVzRlck5o?=
 =?utf-8?B?RUl3U2FYalU5dnpwSHVmTXZOTnZ1MXd3bTVUY3lPRTh0Q3IyMU83VlZSU0ND?=
 =?utf-8?B?dWZZN212QWYvUytlSitHY3VZWjBsU2wvQ0lJczA5Z0xydE15a3JBT3ZqckxT?=
 =?utf-8?B?Q2VzWEdnZmJBWUZRenZOSkJPcyt5NUpzYWxmNHNDZ3MzVlNSSzdYY2dkaVRQ?=
 =?utf-8?B?d1E2RnlhSmphWXpSZlA5ZGtONHUwR25haU5WV0VHbXJMT21MMERUc0dmbklt?=
 =?utf-8?B?QVZTS3V5WXF5SnVqTFJmck9wV25udWVVWlRUU3FDTjVJa2NjYWVVK0FmQTFE?=
 =?utf-8?B?WDBBZEVqelUxSkZZNjdCVGJ1VVRDSkRFR1IvK1NTN0ZIeVJGeFEvYnllRjBz?=
 =?utf-8?B?SnNMUHVGdW92Z29sRVVRZENTckZKVVVZWE5qWE5BQnlXeW9jV01NekpIbHdo?=
 =?utf-8?B?cnFVTytQWjNBN3hzOWR4amMwMnhqVHN1WUNueE1lamRzWWRhcmxkazJjbi9X?=
 =?utf-8?B?dVBBQW9nakQ2SlVwR2RESmNGSGZOOWcwOXNBNDIzRWFUUFdQUVBnaXVRUDBw?=
 =?utf-8?B?UUVPY0xIRDV6VklpSkRNcEsvTWJ5dVVPWVk0T3Jvd0ZSbWN0OElzWEZmdmhD?=
 =?utf-8?B?UW9TWkh5T2JDY1QyZXcyTUFUcDMzZklaT3FGd0xSWllDMU1NUUhjd2F3YVdm?=
 =?utf-8?B?aGthTGV6NEltK2tWSnh3Q21TSnpZVkUyb2R6TlVXVHZlVmt2V1N2c3EwZkJl?=
 =?utf-8?B?WW1wRVgzcGRRWDVsZmwxbHhhN0JvNTNOUWQxNmNxRENMendHVldvYWxSeUh2?=
 =?utf-8?B?Vmh0NElsTitGdW1DZytrNTBDZ1ZEMDlaOE1QU2dsT1pDMnFOS25qeVcxb2Jn?=
 =?utf-8?B?TUJNZms2UHB6ODk2VnFpWkh6MjJZSWtpYytoK0tDbllyb2tMNGZ3Z2hNRExu?=
 =?utf-8?B?RURrQjBFQVJ0d2dGYUhjWkFBTHFZQk5PZHZKVStTWlBlVkdSMnk2RktSN0FL?=
 =?utf-8?B?OERvZk41UVlNUzAxWjh0TFY0NG8rMVR3ZUR6TERpK202OWZVYm81VDFON3c4?=
 =?utf-8?B?Y1NTVC93K3NmKzdEenpJakdSeHBaZ25ZcTFrZmRJUlczd3VidUhCMzk1TUlo?=
 =?utf-8?Q?+KQ1QLXuGT/39xP28tGAN3nZv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0191a2fc-4535-40ae-7db0-08dcea9a838d
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 08:47:33.5487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRWecdgPlkXsBVlmBUOi6KDWs5HyJlfMcu2uSwYsE5Wrt+TOqK/o5Lm96UQ2NRtnxCqAM1ptOcMlg5ZYGXDYlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7562

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Add the compatible string support for i.MX8ULP ISI.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index 4d5348d456a1..f43b91984f01 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - fsl,imx8mn-isi
       - fsl,imx8mp-isi
+      - fsl,imx8ulp-isi
       - fsl,imx93-isi
 
   reg:
@@ -75,6 +76,7 @@ allOf:
           contains:
             enum:
               - fsl,imx8mn-isi
+              - fsl,imx8ulp-isi
               - fsl,imx93-isi
     then:
       properties:
-- 
2.34.1


