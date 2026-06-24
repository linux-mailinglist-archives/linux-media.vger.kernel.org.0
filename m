Return-Path: <linux-media+bounces-65590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o+/cMw1BPGrzlggAu9opvQ
	(envelope-from <linux-media+bounces-65590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:41:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E32C6C13BD
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 22:41:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=TQ2GGYXo;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65590-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65590-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82D8F30922B5
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2026 20:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DB837756F;
	Wed, 24 Jun 2026 20:39:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011026.outbound.protection.outlook.com [52.101.65.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2A3C9894;
	Wed, 24 Jun 2026 20:39:01 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782333545; cv=fail; b=rY42BtleSIBYQOgHvYiKOiCtMTPrISRVTb/K9i7aZSFxJZT3wkroSKOfHCuZUW6IFLLVYpM63ktP4M+7oTvPf+QF9z8L4BgdJ0lMdkU3zGcJ0hvxHILCLyKP4fvlDvGLy/U7qbyj9Q8CHx8K5xer9nUsS6CNSUwRu1pE0KzdTGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782333545; c=relaxed/simple;
	bh=iHHuFa4y2hJgtDMraMo44kVN2pJFYRs72e36j3BMs+o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=HwP4KtWkcTD7BsaGzuxpbGgAqgRoXrAPmjwSuaOCJo2leW8mc2r3dbH+VlIvW+psYkxCMa0NJhGN20VIJtO21qW5zq+bWwp8L94aS036VpP5/pRf2gZKlW+w0MKr7m3ZXPjleBsYdP45ePCXRKYtFWf+iUuj8zM657/2FGCFC+c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TQ2GGYXo; arc=fail smtp.client-ip=52.101.65.26
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9WpUIyaaboNcl2nMR0/N+G3zt173ElzzQt1aDKe0vLhd+7lfS4/S3MiqqwtaHwRlOeJowhfUFp2T+WTYXD0Ck1EJyQsKqPDyaEf1iTUZ9iMpmtur50lVwQKxlVGpOgZuif/ZHCF7YS5riJNwQYQNbL+ibV5Wx2842NNSbpCrxFYv9RkO2hQ+qQGEqh6kTblieEXPbZm1w8EtovuEVvaRB/crhLTqHI5Mr4ID6P+QkBhCMAYRokGlj9QdYWzO6vakCzNbSzDcQY6rbEt8RD8tOyQ9A253hnJYz4QQUrCEUX4Az8PCT/uc9nCKN/u8TBjlA3cvpDo75eDYrHRPMl/Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WL9I/wqVTolrxsv2eaVw6uRhjZxtLUwUu03svmULYd4=;
 b=rL4d9+etwNOULgdLKuJqmiAWZ1MhAacZ1Z/K7QDBmEOAA5hInVmeVdJc1tZrAKrAfQlCDrLzank52Nv+i7aJP+ke5cI+FlaF8CDKBtDEZoiWuUohDcfR8FHhRvtsUiOD9oXQEVti/MymTo/fCUIvTFU9faVkVpANseB5DFvpsZuN9JnxmnJGq2xUU5UpUbY3hq1s/LVi/PVuRbl/Lowd5If25QqNb0PZ1Z8MmJW1k7ptQ85MjC0VErW9zjKSUPBvaMLm6/9BQHtcvlikTAShUQw2BJmOlsoTQrAdPjNCiXOmf4mmjviWXj6xNWGeMm1lyslAuSwXhDRxKhjdMIa+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WL9I/wqVTolrxsv2eaVw6uRhjZxtLUwUu03svmULYd4=;
 b=TQ2GGYXoSdcrNoG3dVH5U+hPfizK9fAufyYNR02vpuUmZF0SUH2jP5PUgcYb9+1j4xgh35Tlst6d3zGC38r/y7g280/CI5GZ2PfADeRM78Iqf6fFZLASiGF3PmCVbLQpMAxe/+YIWOZBSA1rorzGdqwgQhC2yf1/46fvgJ0pgyPrtb9ZZI5YngEAalGXWBz7l4Dqk8CJ4Qx51nMnp5Txr5Dmb3A6+lSHtkLPH0Z8PO+nBYR+cDF5SKroarcp4DdCht/WkMbQb7XFf6GCPoDcaMgLHKTMXqF+ilnz5wo8FkF9LhP6tVxR0InKjZc48tHg7gzfGD8fPKopxLl80h80cg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB11335.eurprd04.prod.outlook.com (2603:10a6:102:4f6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.14; Wed, 24 Jun
 2026 20:38:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 20:38:58 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 24 Jun 2026 16:37:51 -0400
Subject: [PATCH v6 4/9] media: synopsys: Use
 v4l2_subdev_get_frame_desc_passthrough()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-imx8qxp_pcam-v6-4-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
In-Reply-To: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782333513; l=2021;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=6582X66NpiuLwIwNjcKe8HBrNobwmpNQcU7lq3wrkxw=;
 b=2oSB1SuwpsUNv2ahatWY7FAn+a5IAjTZDfphzHWA96eKs7Ki+/IktWaigboIrBm0PXTkJ2JK2
 WtIfSFl/0lkB4cTUJzUsF3L97SoUWfHAPLYPuQ1xdc+bm3FZFJzC8Iz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P220CA0058.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB11335:EE_
X-MS-Office365-Filtering-Correlation-Id: 31f11c61-98a9-4ab7-c9d8-08ded2309d7b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|376014|7416014|11063799006|56012099006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
 ir0zxtDn/lBHKADhC0VJDxqko2u/mG0oWaf+urENoo7BnCFk9ppf05FkYQH38SWFPFXcfMz5RBbKtft9o6+fu2zMdjCYXaerO7NhAmJPFo3K2GSeeV05osFRC1AqjyN/rW0vfm8nq072e57/YbsAd/jJZyZYLAl1YRvaUfNa+8wjIBi0OxfDabc38oZFYEyH0g9fdpGdkk/TgvFCW6VzYRectDcECwbp6H+DW/o06kFCXmDNS4Y/lVrhOR1zlZFZy9IeHJQnIQaT/ExWWGMI+VjUvA42kj066JSIlHOn2rQJ89RoRxm8dikw7JDT8Iy1DdAE/iUXE9F7aJvJ5SmkSno+v3dRGCbG5V2oAth+SCy3lFAVjlLmU/EmyzkAPvl6lyTx4nzghKFza0TaDNEVgBRWirnICagnn/n1/5dGkL94xFZ0Rv68RW2D6CBpNL8T7sEN2Bv6l32R9BbMDg3l7lsilzGQ62Eu6GsJa4LNdepJ8Aw3I0vYA8EyptIRcXF+W9oDshz6ECTBxYkWrSbu3x2W/S3KHuW/wD4lAJxOL8XwB8+RvK5B7SDsD0hnywFHo5FUKb0sV7JQGBWQF4p9GQz9UB6g8ELXfWWwEBMNetovKDBLmCHSfcJqMH7i2KdTd4fCtZJM+g5UD8b8XzAO4WDxE+qJt1Fq407px1hb7WJPWh8nTu+ncVQfCP6c0TV3zFgZchD7sAEkjxziD4UvMg==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(376014)(7416014)(11063799006)(56012099006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VDRsc3llMGNjVFFYTlZFS1JqUW1jQUxjQldETEVGbHk2bGRmSDNlSmVHTUhN?=
 =?utf-8?B?UTJJUmFWN3Nsa1VVNFkyTXB2YVZzSUxUL1JhamxLa0hOVHVweUp1NEpaK0Js?=
 =?utf-8?B?SXNRb0dWUTd3aktIT0JaUUpDajBnSHNmL3hOTVowWDhXdnZ1aWMvdENaMUxu?=
 =?utf-8?B?UnlvUk5SVE5MdUdHWXNrcE1VSEx5NTBFalJ4MSt0Tnd2dXJsWlBBVzJtZFVV?=
 =?utf-8?B?VnY5bzFXY2hiK0Fsc3o0SWJEa1RpUHo2Q0ZCbzhXemZIYllMcmVRd1FzN2NP?=
 =?utf-8?B?REpML3NibzdiZG1nb3oza3piWWh2a3U4WnVMYzQvcVhkQmd1cjU2RGZZTWJs?=
 =?utf-8?B?eWtVWFR4UmtXU3NlZStYWXB6TllsMjMramRjVnZETGpqZTlJLzRURjloN3dW?=
 =?utf-8?B?TXozcUx5Y00zbUJGUy92dk9HaFFNSzhjVVlzVnVYcG1jN1RPanBnQmpWL0NJ?=
 =?utf-8?B?ZThuT3cxZlJyRE52bHl4dXR6UFBZV2VON3NNN05MUnZNNm54ZzdJSGdnc0Js?=
 =?utf-8?B?YVV0V1hIWWJhbWdQTGlQMmN6dzZBcnpxU0RQWWMrWkxNMmpyT2h2d2k1SkZq?=
 =?utf-8?B?YXczY3VSU05QMzVTOVVwNVBOSGxOQ09RMGtKYTVKaURRejc2YlM3L0ZHL01G?=
 =?utf-8?B?ODVMbmhsSGl5ZHcrWlMyRzhVTWg0UlUrdkxTUVRPNW1GZTdpT2VxUFF5Zi9X?=
 =?utf-8?B?d3prem1jVzFsejlNV2R0TC91VnpwaTNDeUMwaXZkSDNWZWxHVGFlMHd3RDlM?=
 =?utf-8?B?L0x4N1lWMjlsSThKbGNONUpiNXFvNE1MRUFYOEpWV2hTZ1NQamd4VWU1NmJ3?=
 =?utf-8?B?cjZGeUx5V2FQbXcxMHM0ci9YbGtZZ0g0K05zZkVUYytXa1NpZnM3eTk4NzB4?=
 =?utf-8?B?WWxtT3BNb0kxZHRrVndXZjJMRElRSHNsVUx1cDNaY1U2Z1ltbCtjQzZUL1Ur?=
 =?utf-8?B?U2ZOUkNDY1BJblVoZDhlZmRjb1J0aGY3Z0hkTVNlL1hmbE8rWExpbXNVUHcv?=
 =?utf-8?B?UTIwTGNOV0doVGtHdDN2cmRUVkRGdG1yZzdiL3BHRWNMeVNsYlhsb0dWek9l?=
 =?utf-8?B?TGZSQUJ6NmV0dHN3Uk44WGk4WENYbE8yMFVpN1VlN1RGeTFhNXBUTjI5RFVp?=
 =?utf-8?B?dzJIT2o0amR4dVQ3eXZDWDlkSUJyRys2UExTZElIRndsREdybnIxRE1lNHRW?=
 =?utf-8?B?SC9IUDBjL1l1WlJYS0VxYUt6N0lZZ2Z4cE56NS9IM0hPTUZpQVFCUFdOTlZI?=
 =?utf-8?B?Z2Y4anRvN0FQVzNDbXhuNlVUYjY0YVJLaHYzQjQyS00rb2o4L0g4eFRJRkVW?=
 =?utf-8?B?RWJtWEc5U1ZUcHhUUXYrYzlRbU82MG95MWtTOERRbklRZk5NaGNJQ3Q1eldh?=
 =?utf-8?B?ZHQwNHg2Vm1wQjVZN2U1V0x3L0dPV0FKNEhYSTBkRGRZcDZZZUU4ait2dFFT?=
 =?utf-8?B?SGRHeTZ2VGFib2J2ejVib0dkVVEwNitiLzB2NW0vTkgyNkkvemdWaVBwcFVs?=
 =?utf-8?B?WHA3TG91U20wdHRONkZtUWdHVEFEWUxTRUlEYmFnT1pnYUQvK3FkS0tlVytS?=
 =?utf-8?B?V040elNaZVFTYlpzMlJwTVNVRnkvajFPTnJTUlQxSGUyZWF0NHhRK1I4OTVP?=
 =?utf-8?B?cHJzbEQyMUhsVG9aVCt4M1ZyVEZGUnBNM1BuazgrQ1N6ZTRhcXBpUThUSDdQ?=
 =?utf-8?B?MUJKYVQ4eDhEeFExd3doTHZQNmZweld3ejBJK01Ia2ZGZHlxMnB6SUtQVUt5?=
 =?utf-8?B?QW0xVjBIOFFYNXkwVnRuL243ZUJ5MVdQdmJ1YkF0aU5kWll6bDJSZTVMNUk2?=
 =?utf-8?B?UzNNalFjOWRCd2hxZUpOeWhDL2lVSnU5bmpsTTRyRGFxRXhRVWp1ZlVIdlZv?=
 =?utf-8?B?eHptZERLd25SaENHTm1GL0NiUG13eGhYN1Z2ZHdFZktKa2JaTnBxbi9Ga1NB?=
 =?utf-8?B?SFpiM3RQMFBJMWhmOGt6Q0p5SVl1V3A4eGFObTNEUVZ0bUs0aVR3MjZqbHBD?=
 =?utf-8?B?K0NZc3AxTVd3ODZwK1dZb3FlR2xhMHJRN3QxdzZ0cy9ha2VuMFV2cVV2ZUd5?=
 =?utf-8?B?OThKZG0vdndVbkRrSG56VXVkL0lyU0FISlJNT0g0b3pEQTUrT3RxL2x4Q1hN?=
 =?utf-8?B?NGpVTXdVUnVPeGc2QWhOcHdsYzRLRi92ckxiM01lbFZ0bCtRNlFEYWFpZjEv?=
 =?utf-8?B?WUQ5OC9KaFNzeGF0eEZMWnNsRGpQQUJnTkNVdEJrQVV0a3psczlmOHVHZEU3?=
 =?utf-8?B?VHFobWhKM2EzbEhKVnNqQ2ZIQlJOdktleFlVR2JaYVpGUGh2bFdEYjB2clJH?=
 =?utf-8?B?a3hiaVVvVVlGemtnbElVUGVZUkwzNEhIR00vMVNzazNXSHpiaHF2QmlBbGpU?=
 =?utf-8?Q?H5dusVIWmAsOo7eBUsERgcuaBIpNQZEo2Unh7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31f11c61-98a9-4ab7-c9d8-08ded2309d7b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 20:38:57.7035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5prqtBYhMqYo9dyrA0/gWdjXvtfseoFfCrPYRuREy6YqQB2SQPmVy15qsSLZd+eKm3G6CSSjK2TDwpqY3hZTvkFjU864ku6829SS8Hv0sRD/XmfMG+ReqJJg8nwOTMp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11335
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:mchehab@kernel.org,m:michael.riesch@collabora.com,m:laurent.pinchart@ideasonboard.com,m:Frank.Li@nxp.com,m:martink@posteo.de,m:rmfrfs@gmail.com,m:kernel@puri.sm,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imx@lists.linux.dev,m:guoniu.zhou@nxp.com,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-65590-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,collabora.com,ideasonboard.com,nxp.com,posteo.de,gmail.com,puri.sm,pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.nxp.com:from_mime,vger.kernel.org:from_smtp,NXP1.onmicrosoft.com:dkim,nxp.com:mid,nxp.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2E32C6C13BD

From: Frank Li <Frank.Li@nxp.com>

Replace the local frame descriptor callback implementation with
v4l2_subdev_get_frame_desc_passthrough().

This helper provides the same functionality while avoiding duplicate
code and simplifying the driver implementation.

Reviewed-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v6
- collect gouniu's review by

change in v5
- new patch
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 22 +---------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 41e48365167e5..f51367409ff46 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -630,31 +630,11 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 	return ret;
 }
 
-static int
-dw_mipi_csi2rx_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
-			      struct v4l2_mbus_frame_desc *fd)
-{
-	struct dw_mipi_csi2rx_device *csi2 = to_csi2(sd);
-	struct v4l2_subdev *remote_sd;
-	struct media_pad *remote_pad;
-
-	remote_pad = media_pad_remote_pad_unique(&csi2->pads[DW_MIPI_CSI2RX_PAD_SINK]);
-	if (IS_ERR(remote_pad)) {
-		dev_err(csi2->dev, "can't get remote source pad\n");
-		return PTR_ERR(remote_pad);
-	}
-
-	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
-
-	return v4l2_subdev_call(remote_sd, pad, get_frame_desc,
-				remote_pad->index, fd);
-}
-
 static const struct v4l2_subdev_pad_ops dw_mipi_csi2rx_pad_ops = {
 	.enum_mbus_code = dw_mipi_csi2rx_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
 	.set_fmt = dw_mipi_csi2rx_set_fmt,
-	.get_frame_desc = dw_mipi_csi2rx_get_frame_desc,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
 	.set_routing = dw_mipi_csi2rx_set_routing,
 	.enable_streams = dw_mipi_csi2rx_enable_streams,
 	.disable_streams = dw_mipi_csi2rx_disable_streams,

-- 
2.43.0


