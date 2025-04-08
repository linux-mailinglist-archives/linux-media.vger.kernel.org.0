Return-Path: <linux-media+bounces-29685-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7B3A817FA
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31F311B688B3
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:56:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FB4F2561A3;
	Tue,  8 Apr 2025 21:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Py8qYjN5"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2082.outbound.protection.outlook.com [40.107.241.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE98C256C91;
	Tue,  8 Apr 2025 21:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149267; cv=fail; b=csk2TOMsIV+E73riscUKmuWrzzUT8LKEDjOLsJBcPFbWxA03281KwiimajqEbD2tThrRdAUm5H4XN60ShDAWfAvCXRFGOpMge0fCp3m7R0YdDgMOh80JAsO8kuju9uy9PnH2W0Gye6lh/3tKBge7j2dbycuaEo1FDwEQYGdXDJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149267; c=relaxed/simple;
	bh=xLSSM0+e1a/SWzx8qruzJ6ZvT+trPm6wm5lJfqq+67E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BSWb39Nnk3i09KnPKTB/h61gqP7I/5mbRo8LMlKDxDKz/7djQba8A6gINJAVAzMutwyIjhDzlcf3msy5g99VZNZzgYWJkpnD4KZRuqTaGTBWXc6P6FyldQ/h7fqTpGRy82jFn9/z3DBq6/95RIMgGeCk42RfX7vnm+jmR7n9hIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Py8qYjN5; arc=fail smtp.client-ip=40.107.241.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLoqyBk0WF4txo/HHV2UorRCgQVyL9m0w7bhK8r4Eyie216f4RyPNEJimXzCP9pHyMAHgVTRcGF6IaLPz0LNbuae2GDR6O+GL/zKFIy1cAss3ZILrFffokSi8u67Mqm1fd6PUjlyc4sq90MEGWcfiHYK8rMHpocBG+jM+IA+cAj6EcauvnoadaiKZKbSbVLsP10sf5S/RsO7F6icxA/z5RuL6nudiz8kNjAlaUioo9DgD3QPbRfK1hNSD+Xnr3Jq34NOZhd7sB1FPpnj/apmY3xJUAlW5Ht5SjzpVhJGeAVPOzJZ3nTIQXNp2y+2Nx8mgr2RW3UIClYleB8QzbZ7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oSGvD+NWISf4JD/oUV5yDlkbwp11Zd3Ii8zd96+XVGs=;
 b=qJ2S6ebFcIkW32vJa7XQ9fei4tIse4rXS2hVa80V4lkoOmbQOmXYkObryYAmpaNpJKdnO6HqhzCTdZIksp65vWnvxUMvYTDExTQEkIrpzkSD1CzEy5tnDi03d/5gA/A5aPvrDbN9hNGncFSJKHQaX8XJT4mUEc9u4Tt68pXU1EtgJgwEWZwJJTmiwcmsCQ2dmB136PevjbJbg2xTBVaksJ0PPX4f1M10buCnIDAn/I1TBm/s8L0oX/Kn4DxrXFMECmGQo9gh2J0i52mOSEXNsUAQwprp3+V6ahy59HkE6eLqy6aDieESyFQmCt/r1kd9TCdMjLIleP7xnz7LgLHXBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oSGvD+NWISf4JD/oUV5yDlkbwp11Zd3Ii8zd96+XVGs=;
 b=Py8qYjN51XXwC6VdbApMKFzR3+LiOw2KVSdDHxr4QDzXPZKv9SoQikRkyTzo61jsS4wwE0RdrYQqh7fL782VrIRSgZ1VpMPzfR3abOp45FhJag8EX3sXm226oQcnr/z3NE0ccAxVeVutQm2CjvNuzyBkeuUEemEjyDfQkAoq/syKbDNIQBLtbYbWqiEURgI1W2yJ/dCEE1he0oCSmQhh4fAcAx+oR7ECAOFmPX7AVKzNB1L6m+Pu2zkRuaEhEAYcbmA1InzS/Dy62NSaT/0A4svyci+u1UrSJXgSByI/4cqB8y61+1dxOKGvlpWE0ZzOdu1eDPAH8oZlYrhZeGd9Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:05 -0400
Subject: [PATCH v4 07/13] media: imx8-isi: Add support for i.MX8QM and
 i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-7-ef695f1b47c4@nxp.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
In-Reply-To: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=4339;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=e9Hi9R86FlHE3X6mVjw42jHev4ZPMWLjqL0H2IxdjrA=;
 b=uvONEIxqnvI0V2LnhqcPsDg3MqyKzWUmY3ADxguuk8xo3ICfurLnJYE/ya+ZC75z6bw842iCR
 f4eqpX1DbtLAS9wslK8fIItJkB00sQs1I59sXxw+qP98JmtETk8r6UV
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:510:2da::8) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6993:EE_
X-MS-Office365-Filtering-Correlation-Id: 63b3d71b-a6e0-44a3-7077-08dd76e7ec46
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZndEMFBrTmlOVG5VeXNNT1hQM1VHbkVqWDRuNW5sdUpYREpJZnJHU3didTZp?=
 =?utf-8?B?UDE4SWNwZVVoSGVzN08yZFB3bFFkUFh1SlFWNDhscFlWOU1IbGdKUCtpdGYy?=
 =?utf-8?B?TFk1aXZObDNDSHpUTGJOaEdGVEFYL1NkOFhvMVMwUHV2SUJEMngxdTM2RU9P?=
 =?utf-8?B?UW0xUzZHVTJ3dWFCcVpOc3BQUlh4aEZpNFNjUWpianlmdWR6WDBiREM2WFBq?=
 =?utf-8?B?RktYV2ZqRHR4aGNPSlBpWEk0T2Z6cStSSG5lZSt6Q1BiVnlMd2NYVGNUaTI5?=
 =?utf-8?B?WHJ4ZDFndjZmS1o4WmZlY0h3MjFBL0lXdWF2OENjbXJENXRNWTBJVjc5c1dD?=
 =?utf-8?B?UEdWcnA1VDJpWHVQZ0kvaVVVWk9rT1BxOUx4NHY1bzM2U2lwMFN3T0svV1hI?=
 =?utf-8?B?Vml6TXRNa2VBNDdlb0hVdUhMQVNiOXdmYkNhNVdROW5mV0N0N21NMTNDYUYv?=
 =?utf-8?B?SWlBNjJaREZaa0dndm82M2JYQUR3RVBPd0VkcFZGK0JhMlJPbDFoUWN5YWtq?=
 =?utf-8?B?ZTVhL1lPVWdLU1BtVWd5VWlrMFZ0UGllVWp1Ym9sOVJMejVhSHIxRUlGYmtN?=
 =?utf-8?B?U1NraGIvdUhKUGdmMGtaSEx3VXgrWS9wTVpxeDBoNHhVQzI1d2o0OXEzUFdo?=
 =?utf-8?B?KzlrVWlZenhHNEFubnhjMzV5TFdqSlZHVTBGUzdBSDFGcUFQdDlBaUhtSHZ4?=
 =?utf-8?B?ODYva1RRTXRRZjJYc1c3WjgvS2RCa1dISzNpb1ZaTWFwUm00VGZVdk9Ed0dy?=
 =?utf-8?B?V2hqQ0RKaEZtT3E1eFRrMU9KZEJWUHU3S1djNzRqUjQvendtRndub0EySHU1?=
 =?utf-8?B?b1pTT0VMMkVPZjFCQTkweEFYRFJ0T3VtMVprS09JY2lFaG1zSWt6cUQ5VDJ0?=
 =?utf-8?B?RGUvdzJJMXFXdnhOM1M5M2FmZmVudE1CWWVhNVBxVTdlVS8xazdHTHF3cUZ2?=
 =?utf-8?B?QTdZbHdCcThLK05CS21RR2hvdlBtYjBVK21nTUMzUDRudncreEpnWlNUd0tR?=
 =?utf-8?B?QVNPeU96OTNqUzEyWmNteU42QnAxUUJNNmx6dFFFUDlvcTBYYXN0SDRxWGpu?=
 =?utf-8?B?UWFQb09QUzdUVUZhMHorRGRhMTZMUjZBUWVmTVVEbitlZGNHUzB0aVhwV09P?=
 =?utf-8?B?N0x2aEoxRGVPSGFCNnBhak04SGhBenJMM2JJbDZjUFRSeTMvOGFpKzl4ZEMx?=
 =?utf-8?B?NFFNa1hxem5FVEZsSnBON01WNFJBcC96RzJkb3Q0cUJvMldMMmh4VWNudzdY?=
 =?utf-8?B?OXZMRmQyZ2dXYmN6SWxxeWRDTS8zQW9TSDJBeXdUVjhQZllsbmxlQzBhSjc4?=
 =?utf-8?B?dXowSERvaVdXRDN1K3FaOFVFdVlseFp5Z0Q1K1NIWDdETFg3cHlmbmFaTmpV?=
 =?utf-8?B?RWxNdUhLZ0Mxb0NwcTZQWEVlVllhNE1Ham56cFhRdExwbWNnVlNxVjhkY2pv?=
 =?utf-8?B?SGxIQXhGMGI1eVpGWGQwcUlkZ2k2NkgweFhRYWhncitUbU4vdTFOdkMvbUcw?=
 =?utf-8?B?UkV3cnJ5UDhSeWNDZ3dad2lmQVJCZGxsdFdidmtQbzVwL3ZxcTcxdUNmbGww?=
 =?utf-8?B?SlV2YVFxV08yQURNZmxnN1VieThkbm5NZDBPNFYvT3hkSVdMZVRFQ3pLbmY4?=
 =?utf-8?B?c3Q1dlA4RkU2dUZYektDdGNFM1VvOXhYUTVLUGZ5SEpuZkpBWVhHRjhjNUE2?=
 =?utf-8?B?V3VCUnd3amtRR2JhTVNFZDlYN1ZtOThPaVBHcnl0NlFPOW9XdkwzRFBxRVE5?=
 =?utf-8?B?Sm9pQVMvUmFlK2gwTUg0Vko4a24vcnMwTncwVEN0MHc3VVpiTU1Xc2RHUHMz?=
 =?utf-8?B?RWY1eDJKckhrYzdRZm9sdDZGcUo5dVVjbERzQWlQT2Z1QzBROUR1ZG5EdkNk?=
 =?utf-8?B?QTYwWlVGWGdJS0E5d3ZFcTVHNXlCemtuNE5SQUkydFVuWEd4dUNzbk9WeUhN?=
 =?utf-8?B?VzEwOE1kZnZTT0VZaDBoYlROdXVSSFpTVmlKNHcvNzBxZ2hnT3hYZXNHSFMz?=
 =?utf-8?B?dm8vaE93cWl3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?SytZS3R5Z2ZFTnBtQmZ4VWhsbDV0K3hwYzV6aVRKemRLWjZiSzd1dDVvYXlU?=
 =?utf-8?B?N0d0a3BLTVBEcG1GWUQyNW9uc3lVdUtxNFFLUXBQd1JuTEpVanYzOXIyb3dV?=
 =?utf-8?B?TzFoVVBWVGN4dVJWWEJnVDNyUVpieTJDcGpHK29nVXZtSjNSQjBNVFFFUXdG?=
 =?utf-8?B?WW5vSzN3U1pBZmZ5V0NPbENJWlJOVitONW9Ed3ZTcldaSGRoOWdJSlRyL1g4?=
 =?utf-8?B?SGlkVmRsS2hFM1dQbFpZaG1kNU1mNVgyQk9GcDc0bVJnUW9tQTdWeXdjQjRo?=
 =?utf-8?B?cjVLUGFFenYrZTMxeS8zb0llTy9wLzJwQ0xHSEtmcUNOV2poc2NYT3Zlckp0?=
 =?utf-8?B?K3VLL3FwbUVtWiswQ2RSTk1tclpiYmdWM0JycmRJUG10UGtoOWNTSmNuUW85?=
 =?utf-8?B?YWpUbXQ2ZDJUZG9qaXdJNWwxWTJqeXY2VThXelI2cDdqQ1JVaTVnb3g5ckNz?=
 =?utf-8?B?QzF4anF4VHpKSUh2NFJQRjJHYk1nTTl4dUtldENLZ2F4SmI0KzVQa05xTUhX?=
 =?utf-8?B?b1EzbzNNNEQvQTFDTFh3QkZsand6NExmTS8vYWp3OVZVSktML3lkeTVzaFNN?=
 =?utf-8?B?RHdZMFJhR2pRNEplWGllWlpMMW9LSFBtSFhLamE3bGRTWXlWSWx3NncvODVV?=
 =?utf-8?B?SC9ERWNkS2pvelBMbVRLSklHTkxHUHFBMEpKOHBORWxGeHB5cFZaZEV0WjNM?=
 =?utf-8?B?WVd1MS96ZnN1WndKaElYd0lNbVJVV3ZNYnlkcjQwOXR3TFpHUjR2V21wS0Rp?=
 =?utf-8?B?NEdJV1hPVDVNeitrYXF1OHVkaFdVNWpFZlpsSC9SSHFtUnBhT2JwaGpjRFp3?=
 =?utf-8?B?bnhCUkJMNFdGQTRETHZlSGU5Tk43S00wTjNIRDdoaldLK0hId1pQeUVNWjZy?=
 =?utf-8?B?OWJzL3lmd01XOWhDU3BxL2l6UEJsTC9RcE4zR3Foclpxa2RjQVRNbEFPbXhS?=
 =?utf-8?B?QXhWbURNNjFob0xYNUdKUWUzUEloeHFiRCtoZ2VaUU4xck1ObVNOeFFFcFFt?=
 =?utf-8?B?S0lzODJrcjlBNG90c2hNT1BDK1MySjV3UTMvaWFMeFEzN3FyTElGSEFSeGt4?=
 =?utf-8?B?WFc0ZGNOL0NyNytTaXJITmZQdXBKTGFWOWt6Q3A0VklFQ0h3dTFGelU0MDlF?=
 =?utf-8?B?dmhMR1E1ZFRvb2l2OVB6ZXNJSmpPZTRjeG5VMVBRVkFWeG9WNU4xTFZSN2xU?=
 =?utf-8?B?M3dlZGtWNEI5bHpHZmowbUVsNnFuWUhFY0paR1U2RlVxd2NRWU1LbWVzd0hL?=
 =?utf-8?B?YUlBVVg0ZjU2VHNNTmcwRjh0bjdoaVR6ZHp5Q05BdW5McEYyY3had2JmQzkz?=
 =?utf-8?B?LzNleTZQNzVTNHM4S1duR2g3clIrZ3pJM0lBU0FSR3lCM0NaNmRhRnhjZ2Z1?=
 =?utf-8?B?VFVBaWhJeGhnWFZUdVRyQkVPV3dMMDVTSTFLczVINE1Ia0hzZkUxTHJ0YUsy?=
 =?utf-8?B?eXZmNy9oZnM0QVkyZjhueURDa1BWaUZVSCs0Q1ZrNHVCMVBwNkVaVW9iV05l?=
 =?utf-8?B?d2xaWDRzRS9rVHkxL3FROFhkYXFoWXpNWmpra2xRVS9GdSs0dXMraVpETjd4?=
 =?utf-8?B?ZnM4RFpiTXptOGgveXUwWU9sNDlSZzNORHc5cklLM1ZJcVpnQnBnazB1WW1X?=
 =?utf-8?B?L1k2TTZzM3RGTFFXK1hiOXMvLzVJdVBScnVNVGZMVzRDRlNEemRmTlQwUmZH?=
 =?utf-8?B?VStjak9sSVM3R0hRRUxIL2xkS0tFMzQxUURLTUd6Mk9NTGNpVkNQWi9vS0Zu?=
 =?utf-8?B?KzIvRkhWeTN1QTA4L0owVENTS3hOZ25ROCt1R01EcGNyVTBpSlR5WFNTUUNG?=
 =?utf-8?B?QVRqUnVnbndHWUNYb1E3UitQNUhNR2pxNjkzNDNXMnpNdGJYN1lubzlIQk9t?=
 =?utf-8?B?RXNxK2w1M2dHckZCU25mTnpZZURSUFNEL0NjWnp2bEJrYk9nZGxsTVVnbmNq?=
 =?utf-8?B?c3ZPRFo0cmFwQzE5SU5SSTQyeHFjdktxUXRXaE9xdU5EeVZqWGVRTEoxZStC?=
 =?utf-8?B?Wit6bUhiRE5KaFhkWGxkbDdFM2VpdVJBN25XdDlJTGM1b1Q2OXc0TnJQMGgx?=
 =?utf-8?B?bmFMTXRaYWNyRHp3OGYxZDdCMG1IandMZm5BR0w0K3c1ZXlKa2lMYXBHRjlh?=
 =?utf-8?Q?8noUYafBaXic+UetmNqLH7M8H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b3d71b-a6e0-44a3-7077-08dd76e7ec46
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:23.1742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8Kr81Obiw8UttDNjCrZ6Wj7mRR/n9s4EvsV1EhxBGR+sC/ddDwIEkHLAw9Jffgf+E052eYJa9Xhj1BB2T0bxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

From: Robert Chiras <robert.chiras@nxp.com>

Add compatibles and platform data for i.MX8QM and i.MX8QXP platforms.
i.MX8QM's IER register layout is difference with i.MX8QXP.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v3 to v4
- fix i.MX8QMP ier register layout
- Remove clk-names array
- Change 8QXP channel number to 6

change from v2 to v3
- none

change from v1 to v2
- remove intenal review tags
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 43 +++++++++++++++++++++-
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 398cc03443be3..568d7b24466aa 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -246,7 +246,7 @@ static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
 
 /* Panic will assert when the buffers are 50% full */
 
-/* For i.MX8QXP C0 and i.MX8MN ISI IER version */
+/* For i.MX8MN ISI IER version */
 static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
 	.oflw_y_buf_en = { .mask = BIT(19) },
 	.oflw_u_buf_en = { .mask = BIT(21) },
@@ -257,7 +257,7 @@ static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
 	.panic_v_buf_en = { .mask = BIT(24) },
 };
 
-/* For i.MX8MP ISI IER version */
+/* For i.MX8QXP C0 and i.MX8MP ISI IER version */
 static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
 	.oflw_y_buf_en = { .mask = BIT(18) },
 	.oflw_u_buf_en = { .mask = BIT(20) },
@@ -268,6 +268,21 @@ static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
 	.panic_v_buf_en = { .mask = BIT(23) },
 };
 
+/* For i.MX8QM ISI IER version */
+static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_qm = {
+	.oflw_y_buf_en = { .mask = BIT(16) },
+	.oflw_u_buf_en = { .mask = BIT(19) },
+	.oflw_v_buf_en = { .mask = BIT(22) },
+
+	.excs_oflw_y_buf_en = { .mask = BIT(17) },
+	.excs_oflw_u_buf_en = { .mask = BIT(20) },
+	.excs_oflw_v_buf_en = { .mask = BIT(23) },
+
+	.panic_y_buf_en = { .mask = BIT(18) },
+	.panic_u_buf_en = { .mask = BIT(21) },
+	.panic_v_buf_en = { .mask = BIT(24) },
+};
+
 /* Panic will assert when the buffers are 50% full */
 static const struct mxc_isi_set_thd mxc_imx8_isi_thd_v1 = {
 	.panic_set_thd_y = { .mask = 0x0000f, .offset = 0,  .threshold = 0x7 },
@@ -322,6 +337,28 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx8qm_data = {
+	.model			= MXC_ISI_IMX8QM,
+	.num_ports		= 5,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_qm,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
+static const struct mxc_isi_plat_data mxc_imx8qxp_data = {
+	.model			= MXC_ISI_IMX8QXP,
+	.num_ports		= 5,
+	.num_channels		= 6,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.has_36bit_dma		= false,
+};
+
 /* -----------------------------------------------------------------------------
  * Power management
  */
@@ -497,6 +534,8 @@ static void mxc_isi_remove(struct platform_device *pdev)
 static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8mn-isi", .data = &mxc_imx8mn_data },
 	{ .compatible = "fsl,imx8mp-isi", .data = &mxc_imx8mp_data },
+	{ .compatible = "fsl,imx8qm-isi", .data = &mxc_imx8qm_data },
+	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
 	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
 	{ /* sentinel */ },
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index bd3cfe5fbe063..206995bedca4a 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -157,6 +157,8 @@ struct mxc_gasket_ops {
 enum model {
 	MXC_ISI_IMX8MN,
 	MXC_ISI_IMX8MP,
+	MXC_ISI_IMX8QM,
+	MXC_ISI_IMX8QXP,
 	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
 };

-- 
2.34.1


