Return-Path: <linux-media+bounces-38634-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7946FB150DF
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 18:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5DB887B032D
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 16:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D026E298999;
	Tue, 29 Jul 2025 16:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L5Wv8IwG"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B3C29826D;
	Tue, 29 Jul 2025 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753805240; cv=fail; b=F1HkoNkirFs5E+ERJ+YpSpGp8Ebi8OzLcVO02oLjr91JrGBejuPES3WVWStxuhw2W0ubrDFbmDIFhEZ5NWO2zL32sjOZp0rlTfKUdYFnI0sTQw7gi+ClqsGehLi50b4jlnbpYc+1Hh/Uzjvo2dy4znnpABdOqlzPhKcdKqcxTAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753805240; c=relaxed/simple;
	bh=sri1kHiyPVPeyxO74jqsiPIn3eCs4ge2zo7N5/3X10M=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Sg91ly/UONYAR9WK3E5sJHzJ7mDGwSEHaWCKav2w7x4ZCMBT4TdfT/quuFU9aD/lA+aqS3X3857L3swVcXG2CXCXThmd1DK6DLSqfTwR2UOyZq+OFdZ7Zn2zO7FpigQ/R1f0gvx9jvS/NntD3vmMxjDOZ/uFEYoQ3JcmTXlCZrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L5Wv8IwG; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mft3kFHlVeadIxy3Ek3+jx2hAeqmMKMX2esD6TW4vER85Z59XdU9pNiOuVE3JxVHJ8f3tiOVxJAq1HFYPTkj7KEAsj2FYf+RT58IQPTe+d/JOZ+GPGF3rxs2YZb+rP0ixZpGWEd27xZ1TmdZxARTHR+q5ba4PXBvxwHXdUzYXtHR3JV/EJMhTPjv2H5fzU+5v0Mw4Ppbc0HkqWdn4ekXfAhkcewlX0d+2F1rEoNJV9A6vwxeIEsCyhNoio3oqXYc8pSTbGG9uLDB9EY4qDAbqN5EUVnJTjNukmrgrSa8AHYrTcvZI6PXD/stgVJ+giZ7NyX8N9wB+ZfnoA65Byx4zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sknn1cb5m/oDO7TKDikYDeGPp+/53sPuM6qnDApVIlE=;
 b=MH49NPPvj1QIB5l/v8egXPhyRWY9YsqwlECf5gEWzeI4LeXsIkOOf7Yw11HZ3Av7dsQ7XJFoUZMk9qW994N2f9XbpKNwDBV2iV1+58vX60irtjCSElOMXMU++w/kCYZOIwKCoXUGDMskcsO+LrfA2JyP4mDDwB3Aotljvke4si4UM9hlDL1aZITxBGKJhjnc9Uua+Ivhqsyi/F/T8ku/IQAgg65wplWsJTbdDmf8DBugloxebjWsmmxls6KmzoWeUlJWZgEhlC6KmQ/M+pzG0bV4a9cdvtqzLkrhTiuka+AODH1iLdcluVZWyjjBpxkLcQbrYzEXidMfSBP0ralPqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sknn1cb5m/oDO7TKDikYDeGPp+/53sPuM6qnDApVIlE=;
 b=L5Wv8IwGyk0K56McALjDdKImQAg0bYsmwoGqWjKLmuXDguA+mbmoEiJCLM884wQb94ftSs/PpMXjYEVMVFvtnzeDsRWp7vQraUdUf3A7g3VFzvPl1mgp+8KtFaMNLKcmjb6VQ/VpWGoxktDLX+ZrIdTDxSFm2ofYqDMHLyK7/EhL5MWLUfKoASouOH3RH9RoIs0+Pp9aatPMxmZ9TUBAJ1NhznqLiyn6Y+Ljw+D7sPEmnwFUJbq1yI6QjQBKZm2L0pNK0JVubLR9WvpyUgy4jOgSKS4Jm9KSvGhAeA8gPIxT8xetwzZn884t8pk5ID5/540J4ieGIhK91GPEanF/bQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU4PR04MB10551.eurprd04.prod.outlook.com (2603:10a6:10:588::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Tue, 29 Jul
 2025 16:07:13 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8964.025; Tue, 29 Jul 2025
 16:07:13 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 29 Jul 2025 12:06:22 -0400
Subject: [PATCH v4 1/5] dt-bindings: media: add i.MX parallel CPI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250729-imx8qxp_pcam-v4-1-4dfca4ed2f87@nxp.com>
References: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
In-Reply-To: <20250729-imx8qxp_pcam-v4-0-4dfca4ed2f87@nxp.com>
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
 devicetree@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
 Alice Yuan <alice.yuan@nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753805222; l=5211;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=syiCvbhru1dP75h0vu3xJghJklrkmd56bEA1TVlCZCA=;
 b=xdv6G+70VoN699n9iWKyJxC5gAL2SHAGedKgb8Ylc0ub/qm5+hQPDcK4TYPdYALojU1rVyFh4
 k/iNj/PUI3MCaDdmoqAmGRatwgvHYTkq/v0SG+zEm71RhpZ8dFTWaH8
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU4PR04MB10551:EE_
X-MS-Office365-Filtering-Correlation-Id: c6dd84e9-b3a5-49ac-30fc-08ddceb9fb04
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?MXh6RTI3ZTQycktLNnR6d3hlSVMxQWZrb00xd2owempMWTFJY0pTcFFjcitv?=
 =?utf-8?B?LzI2aHlTd1JGbGZTaUZmbngwaDFYNFhsQ0pjZkdoeDR4ZE9xeHBnRS8rNlp2?=
 =?utf-8?B?aCtGWmcrU0hDZ3F6MENyL0xvQXVRbTBpM0pOM2tZemF2djBIWm9NT0M4c1Rp?=
 =?utf-8?B?MnNlSUIzYnZvMGdKZTBOME00NDcyREVqbDFEc0xjN3NJUDIxbkxWNEF5d0xU?=
 =?utf-8?B?Q2loM00wajBWS3hFVmwyb0tzQTdwYmNVeTcyVWJPZkRvenVraUtKVENEM1JX?=
 =?utf-8?B?OEFGNEpsVzNaU1c4YnFVUEg5UVg0Wk5wVWI0azlLVlJGNjlDQnMrVlY0SUNr?=
 =?utf-8?B?Zm9PNUQ2c1lLSlNNKzczUFVGUExuWE81ajd3SW82OVFPdHU0TnpEQVlSMEZG?=
 =?utf-8?B?c3RRbU9mcjJwWGhxVzMycWtzMCtPSzJkS2RaN2VXc05aQTBuUUU2RHBEcjVw?=
 =?utf-8?B?QTNtS2M0YnhsK0dCR3B5cXp1eVMvSWpENGJnajhVUi83VmhyLytqZ3pJNDVT?=
 =?utf-8?B?WG1NZzd4eVg0YnprVStXTEFLWTBuTkErWFozZndxRlJpQmdvanB1ekZSdjZl?=
 =?utf-8?B?eXNXVjdneGdNSzNVVWVPQVpmODF1cERBZ0pISk5XNDVxVk1IUDZDL0ZVdHVL?=
 =?utf-8?B?bEhaQXgyS2NWaDRHTzNvemlPNEZtTGJ2VEdIcVE4RDlEOG1nbWlVUVZId2Ro?=
 =?utf-8?B?TjhqbzZ2Y3F3RXRtL1R3SmhRM2lCYUhZNGxYTnRXRit2RHhTZEViQWJvL3NU?=
 =?utf-8?B?N1NCN0Z6KzFzS0FsQVRQeDVFQnBjWmIzRmsxVUxmWlMyN0FsbmROVlJSU3JC?=
 =?utf-8?B?R1gxeitqYTMybi9hemU1cG4zZGd5TnhoMkhHSmFrZ2h5Y2JBVGRNWjhzYTQv?=
 =?utf-8?B?dHYyWVQvNCtFT01vSGk2M0lvZ3NjdTlrWFJaRFpFQWg1ZktIMWhmdXQ0N1J6?=
 =?utf-8?B?Vm5MZmVBNHNMM1JibWF6ekJGcCtpR0RQYitGWEVTMExpaHgvb1VhS1R3ZWlk?=
 =?utf-8?B?ekoyaExndkp6clhXcG1pSktCQlNTSVk4bzRJYndZMko3SlBSbkllY1d3Y09r?=
 =?utf-8?B?U29pczllRkJNVjZGUUlMN0pja1laTjdXZkc5R3JhMFArOGNEL2FFNzVtTEE0?=
 =?utf-8?B?TnA5VE40Mm8wQzhPOTVjSXNpTkdLdjFQdEo3a0owanQxamFNSHVBUzN1VzBv?=
 =?utf-8?B?U1Z0aFRQaUFjWU9Rb08ySEJPNGFMZVlVdVg3TXZ5TkgzelJqSThuM2N0dXh3?=
 =?utf-8?B?aHJuOVdEL0ErWVFDTXdTZGowNmE3eTIwajl3aGhEbU14TTdWdGFyU291QnBD?=
 =?utf-8?B?VHl5YUF0cHZkSlVKUVRBMHFTd2lUdnRzVXo5YnJNWjR3ZHRtYVZIbHBDK3hR?=
 =?utf-8?B?N25zTFcwdEEzMlh4OG5GMXc4bmYzNXBmbTlacXFoV2d3eHBNN1AxdzkxUUUy?=
 =?utf-8?B?NVNWeWNJQ0t2YzNKTDZtTWovR1R3bHhVWktKZTRVeU9leUhucTZCM0VzUXo0?=
 =?utf-8?B?dUR4ek9TR2lwVzF4UnRleFhHNFk4aUYyeHNzb2ZsT1c4TnRqQmtDWXBLbUpQ?=
 =?utf-8?B?NFBmTG5xQ1JIVk9yV2V2WTZKVFplbkRMSlpMSkQ4Q2UrQngzbGNhZUtHNUo5?=
 =?utf-8?B?RGhWZmJYZmpkWWdvdWtJNVJkdkMrcFY3NWtKSDBCdWw0cWNPNUQ2bWxmcERY?=
 =?utf-8?B?TnhSWXpZQlc5RWd4d3ZwSnlpTExWSlJ0KzN1aGF0SXV1Y0l4cTM0bUlBa2dt?=
 =?utf-8?B?MjdxUXFITjFSOHBiRnp3TjNQUFRWbTVpRXNReXVIQUJKejNGLzJTWXlSNmZu?=
 =?utf-8?B?UEwrLzJrN0NNTDlLZmpOdHZvQUxYTEJkMnJQZ1pQdjdFSnBPbDVuL1FoQXp2?=
 =?utf-8?B?dW1nN2toUm9maHIwcFgzd3Z0WVV1NDFacGNuZFJzVWR3ZURZQkhCS21KREV4?=
 =?utf-8?B?OFNUY0pxRk9ybG1wSm92RXV0WEwzdG5SY0JDc1ZWcEFycElLdkNVMlhvdUpH?=
 =?utf-8?B?S0RpOGI0b1dBPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?a1oxVkRFU01IU09ETUk2bTZ2SmRQME5LakJWTi9mSWRrWUhyWVdrMnVLQmpn?=
 =?utf-8?B?ejlQRVJPeTBsaVFWMFVFZzArRzIvZEVLOXZjSzRIdWRucVJEWEVVL2s4bkVF?=
 =?utf-8?B?Mk9BRnQrWHcwWHNtT2pXN0hPRkVWdU5DT3RsN1lNZXIwajc4VTJVWStIemM4?=
 =?utf-8?B?MlFXNUVvQlVVR0YwOUUxZ2NTaTBvUnZSc3M0cWVmVThHQUVWdmdVMFQ2ejFn?=
 =?utf-8?B?TjRmV1FQUzdGM2Q2NTJhYUZBdjNKL0xhc2VWNHc1b2lkUm1rTkgwa3VDb1d0?=
 =?utf-8?B?YUNqTmh3NU5QYlZaT1pac0pCWnFhRWpKSXh6dks2Z1V4d3pTYUliV2dBMGxI?=
 =?utf-8?B?UnhwQjFBNUZpc080ZCtyd1lOL2ZkTUVGcEZ0OHRvU0haeTUrVDdsbEtwZ0JE?=
 =?utf-8?B?d25mN29LWTlLb3U0bFVaSW1aTnlWRGt4ZG11N013bVNIUjZYblRLdFBaV1Mr?=
 =?utf-8?B?QXVWakFrdUQzS2wvOTU4U3J0YXkxQk5vdGVqV1NuSXlMNi84Z01jYk04T25R?=
 =?utf-8?B?TjVxTy9ycU5tZVhZUzFGMHZSNWlqQVpwYm94dTVUdThrN3NqbVZEYlRCS0VG?=
 =?utf-8?B?UVc4Y1cvdVBpSk42VkZJencwbGt1bS9wcm52aWJyWGF0ME5lcm5xTHUzQVdZ?=
 =?utf-8?B?ZWhCRmIyN3BoS3FxZ0wrTFV5clF0YUp6SXFhVm5ia2IzNVNUZDcwZFNqOGh4?=
 =?utf-8?B?VmVTV1pYNHRIYk9DQ0lqUzdHZk9XOVI2dmZ2eGlFclRLMHlVVTcwN29Za00z?=
 =?utf-8?B?OHRId2Jrb01hVE0xdGxqMHBJcE5McVFuRk9udnB4VWhra0JvUXhXeFoxd2pi?=
 =?utf-8?B?MzJJWklMeFJPalVyS09JSmI0cTB5Vmo3eTN1S3VLc2d4UFd6Qk5UdkxRNVEw?=
 =?utf-8?B?S1NXV3FoODZSUnFPRWxOSHlsVEZ0d2o2Z01qRXV6bGxTclI0MmMrM1BLdUhq?=
 =?utf-8?B?dndSMnRITE5aN0tQTHRUNG1vNVBiRHhSb0t3TEJzTkMwMTRxTDIwZFR2MlNP?=
 =?utf-8?B?NVZaWGVlSk5TQ2R6NDZvM3dIMXFQZGZrQjA3NERsdFlGR3RRRm1TT0hPWDFz?=
 =?utf-8?B?WDFRT28zUFJCa3ZJVTNDWDcxM1VOZE8ySUJiN0V0R0FLdmdVcEtqWXdubDZY?=
 =?utf-8?B?UXlLYmZmMmt5ZUNuQ2FwcDNrWGlnZ2I5U0svVGQ4Q0EvZW5HcUUyc3NkOUdq?=
 =?utf-8?B?THNSUEp2TkxXOElhb2NVOFE0V1FlY1d3L2hZbjdENzZCeFRhQ0VNNnRQeTRq?=
 =?utf-8?B?bW5TWUxNYWRHY0ltdjdLbHptRmZ6YXdqVmtnL2pzdmlTdXdlaDgvN3p5UFg1?=
 =?utf-8?B?ZnlJVXhrSzJrVGE5Z3M3TVc2MTRMVi9BODVJbzJvcjdodTljUndpdlV3ZjNM?=
 =?utf-8?B?K28zR2dBRkxvZmtwTlgwZ0hYbEc2SHpjdkQyekJPK1EyU2xCS0VhWmhkUzlm?=
 =?utf-8?B?NURlNjFOdnhhbEEzRHo3RUhaWmJmQXFUb0RIU29BcnYxelEzYjJ3RDdhck9p?=
 =?utf-8?B?SVFaMFc0R0Z3M2NBZ0pPOWFkMWdES1k1cEswNTJXOS9OS0RVSUlsM3d5MTFs?=
 =?utf-8?B?Y09RN1VBOEFWbUQzL1R4d01YMG9RYTFkTWkvbVJOVHhWd0NYNmlwVzVKWlZq?=
 =?utf-8?B?YXVNNWozTTRtQ3VFdE1taU1qTXBINlh2dURJU2hKeHFlUWFIdHpHZDlteXZ2?=
 =?utf-8?B?S0tESlFkdTdKaFFJajAvb0twd3JxRFNGNlFrTm9KMzJYMHZXQnoyN0JHR09F?=
 =?utf-8?B?R3BTRGVQejFXTW8xNkN5YVRaSjlPeFR2VmE3eUd3a1NJMmZheFkzSTUyU1Ni?=
 =?utf-8?B?WWJzSDQ2NnFydjJnbWEzZjBlSURSTU1OMUg3VFovZUxVb01nK3B3WHcyeVo0?=
 =?utf-8?B?YzVMSUE3UE1JRVcwejNrY0Q0R2t2VnRmNGxoWEZiTmx2MVpsUGtFQkhlMVFr?=
 =?utf-8?B?VVE1MDBYWUZ1MWNtanNYT1p6bkdid0Z2eFRSVldZVU5GZjJKOGd5L0Y0anpv?=
 =?utf-8?B?Y0wybUVCb2Q4SjAxaVBkVnFjdU1hQ2lRc3hDV3EvYWNtMENqbmNvRFcxZEdF?=
 =?utf-8?B?SDNTVENZOHNrQ25FeXp5YnAweHF3SGJDaVZNb0FMZ2ZGWWQ0UU5OeFg5NjYv?=
 =?utf-8?Q?XK12DW7Tiq3O7B6S2bEItyInT?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6dd84e9-b3a5-49ac-30fc-08ddceb9fb04
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 16:07:13.3372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qeu5aXPrBHcZ0V5vSRb96ABTfPFKYkh1/+LATFQ8x5Pg1srsz8M6CCC5ej+2hRBmg1JiTdo4xp2m0HASMpNomQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10551

From: Alice Yuan <alice.yuan@nxp.com>

Document the binding for parallel CPI controller found in i.MX8QXP, i.MX93
and i.MX91 SoCs.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Chagnes in v4
- add Laurent Pinchart's review by tag
- fix $ref: /schemas/graph.yaml#/$defs/port-base, original is
$ref: /schemas/graph.yaml#/properties/port-base

Change in v3:
- use enum at compatible string
- add ref to video-interfaces.yaml#
- use cpi as node name in examples.
- replace csi (Camera Serial Interface) with CPI (Camera Parallel Interface)
in commit message.

Change in v2:
- use pcif surfix as Laurent Pinchart's suggest.
- put power-domains into required list
---
 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..9dd0331f6ef7503f343eb576fe6878e32d91c182
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx93-pcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8/9 Parallel Camera Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  This is device node for the Parallel Camera Interface which enables the
+  chip to connect directly to external Parallel CMOS image sensors.
+  Supports up to 80MHz input clock from sensor.
+  Supports the following input data formats
+    - 8-bit/10-bit Camera Sensor Interface (CSI)
+    - 8-bit data port for RGB, YCbCr, and YUV data input
+    - 8-bit/10-bit data ports for Bayer data input
+  Parallel Camera Interface is hooked to the Imaging subsystem via the
+  Pixel Link.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx8qxp-pcif
+          - fsl,imx93-pcif
+      - items:
+          - enum:
+              - fsl,imx91-pcif
+          - const: fsl,imx93-pcif
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: ipg
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port node.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                const: 5
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Output port node.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                const: 5
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx93-clock.h>
+    #include <dt-bindings/power/fsl,imx93-power.h>
+
+    cpi@4ac10070 {
+        compatible = "fsl,imx93-pcif";
+        reg = <0x4ac10070 0x10>;
+        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
+                 <&clk IMX93_CLK_MEDIA_APB>;
+        clock-names = "pixel", "ipg";
+        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
+        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
+        assigned-clock-rates = <140000000>;
+        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mt9m114_ep>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&isi_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4df15c09cca08924b503753646487a116bc6be98..4eb0d0de16299a3bcd5c2f6f6445e416c8fa0a48 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15235,6 +15235,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/imx7.rst
+F:	Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

-- 
2.34.1


