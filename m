Return-Path: <linux-media+bounces-25966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F669A2FB48
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:02:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 710991887024
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:02:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D95C2512CE;
	Mon, 10 Feb 2025 21:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ivpfbfTd"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013017.outbound.protection.outlook.com [52.101.67.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147122512C1;
	Mon, 10 Feb 2025 21:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221239; cv=fail; b=ZB93lJ7+S1GAeuG1xlbE5p5AhtRu7TlVP/2FPfYppNx8k/NXcXiHNnjZH8Cyg0J7RNq7brmXzulBihXAilxIqkyxz42kaM51IyHj6PEvdGyNzpldPbvBlyfZQmtH6lGg1/MAOCXw30uKSkjaFJREDhpmuvKbCPpoeTSRio6DzXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221239; c=relaxed/simple;
	bh=wQzXhLPvi7Bzt76hHHKFfUBzvQbIlA3YqnnkYvKmseA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=aRoTbqKIFV/a4xfF0pliIDsxkzCayO1W5lo0ccQ1HP2D5rneGKyOaCuxCH+Sza8qtqjc6mmRtN5zaG5nSSNUfWKNHSYZsV3qwEz4zdhK9VEighDVnZX5BB/zt1GbDYWv7S8In1tClomexdErXVry1hvt6RiJ92n41OV2yWt9TjA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ivpfbfTd; arc=fail smtp.client-ip=52.101.67.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGVCJKesWspDych2cZM5Mmd0RM1dGvIv0EFOW8ZHcs1ZjeJoAQBCBckUy2vjEfmao6PF/EJ0DvLH8YsbEeTv+qOdNbqqDU+FJelJ/ONzPtYN0fAVU0Wn7QhPX1Atrhf7xFieqVMnbN4JCYPcNAkkkPowN3Zoh0+8sIYHb+IxHxr5lVCOF4NZzBSKiEariSLQWTuVoMFt7N+qLycbGt0K8MKxV1J93C5fNiO7LXV4Vr2lTAn1pngtfUj+F5AkCmYFrhA61N+3zufqk+RaFgdzNo++80ZGDD91ZMKwE92WdLihuKuSGfsJleprhuudHwaGS0/vzM26QbCJCeiDqyT/2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ye12ZZS0p4z2EX3aq7ZpnJCmb7hM7/Igr55qiOhK9Xk=;
 b=iJrj5CUigP6kYxDCatlfesr9KJ1WMrflD30ICYjU5ByGGUS9CO33ZXOsrbadZdVKq0AZ5IWgmQpIKvZnHJYrYcGz30NCW+x3dv6LJ147k524GKtBlq9heDnegwKROy6VTVB3re9OZJXkrmag4u/SUmiICXisuD/0o1nmtCvbi6f4GuqIjcA4By2XFCyjGgIUVhbCUqOPGkzbSulP8a6VSNQHHRfy1zFXVnFbAEVOykN9XJz5JON2pSKt97y8iCLp83z3NqVrr5gx8ErijvZRbvr04FF+eqtErBzftHWsPrFMDBccmvzRIIfg5iO/IUPPD7gJledhpP9Cmgl6PUqB1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ye12ZZS0p4z2EX3aq7ZpnJCmb7hM7/Igr55qiOhK9Xk=;
 b=ivpfbfTdfJjqm5wYPnFOaYBmfBxpfSaet5IuIJ/VlFc/k4/qHoTRvUI9eP/YiaUa+xoP8WMY5O+WvIReXuUySEdvS43ejMeII6vuDoExXxaeWEqYdQOGtHrLh+pzbkwuUlOEom/Gc4qWlPGElztGWl/2XcKVGL0OsWv9XScvKt4U7YD3zpy+7FhFDmzlxuvpm9y4FVvtCGfg1eg6qQwgUDiA3mRLf9W4ZHwg7Sfg6rRJfQwNyNsv+cRHdmbICMSy3p1jJnU2ahz+G2VfLHeQLqnc6Kmpf+jjimlRx8lZdOobXMMtCddliLl21uAydzOR1bjHml7pmOMXu5B5rI7EYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA2PR04MB10238.eurprd04.prod.outlook.com (2603:10a6:102:404::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 21:00:34 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 21:00:34 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 10 Feb 2025 15:59:28 -0500
Subject: [PATCH v3 09/12] arm64: dts: imx8: add capture controller for
 i.MX8's img subsystem
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-8qxp_camera-v3-9-324f5105accc@nxp.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
In-Reply-To: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-media@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=17249;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=wQzXhLPvi7Bzt76hHHKFfUBzvQbIlA3YqnnkYvKmseA=;
 b=XN1J9RcjgrfWRW7x4YalYFhBLNciGU25fBzA8evf3QsjEGtW1Friv8LRxib6cptVZ3PCFSgAa
 a6u4Y8QiivYBPxyqcEbxCrDlGusxM0eHbCt0pjMK/KZIPK7qBVaiZt1
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA2PR04MB10238:EE_
X-MS-Office365-Filtering-Correlation-Id: e777927b-2796-444c-e58d-08dd4a15f650
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?Z0YxUHcxR2YyYzYyUVVzSlBaL1FzUlhKa1BXSjRhTExyZlFmWFhacjBqNzhv?=
 =?utf-8?B?Tk9NcGZRZmJ6WVgwdXpZRFQ5VTN1VG02cityOVU4NTlSMnRxSTUwajRNOVI4?=
 =?utf-8?B?R2ZFK0plbFYzR3JqMXRqci90M1dFNmRJa0Q2RGtrSnJuY1k5VXhua1plZ2sw?=
 =?utf-8?B?VzJCMjY2V0RwY1UwNXlHR3RKYmFwZ3Jza1VFdGFacXA2UVVwTE1NNmxzMnlx?=
 =?utf-8?B?Y0Z2UXpGbnQ4WFlSSmlSVC9NQWRMVkRqTTRTVTdTZmluS2JBajJ1THFRektp?=
 =?utf-8?B?c1dRWVRsa1JDOUV6cjN5NmxvR3VDeldkWm9NZDBoNHhjUmlqV1I2Z0NSVGwv?=
 =?utf-8?B?Sjg3WmtNZFhZa2JwYWtUb2JvOG1PSkRmUkE1ajE4UFdSQmh6blJkNjcvUVl0?=
 =?utf-8?B?NlZHcWFlN1NTYkFLMC9oRFJJN0hYV21Gc1U4ajhVQWNiS3JLckRqMEpPaG5h?=
 =?utf-8?B?eTBWRExuWWNzUDRRN09yV3BLbWRBaWlNS0NQdVFKNDkwN3dtb2xSSmFidHg4?=
 =?utf-8?B?d3FnN2E1cGpDU04zWHgyQlRBY2k4bkdETVZWUVVMdkU5K0FFU0NHRElKaVJY?=
 =?utf-8?B?WTd2a2FLUlBnTlAyeWtmUUppeTdHZGxIcGpQTnJEcG9TZklXMzBkQ3NsT2tQ?=
 =?utf-8?B?U2J6ZmhtMnRHK21hSHNyV3QwMG9zYVNSbzhrSkJINDhsc1JMMXdCNERNUWJL?=
 =?utf-8?B?cVJGYmRJRFFrOFNJQ2k2QlhaNldhRXNlcmZsRDRWTnJTQWdQdnE3UjRWYUdD?=
 =?utf-8?B?MExJR0xXbWxFN0hkWlZEWVBiRWZOQ291cEkwWUZTTFdtZ1k2T2tBT3RqRnZM?=
 =?utf-8?B?V3Y4TzNqSk9jd0NQTitDd2pCN2FMQ29tSU9FVGFjM0lyckN0bXpWSWxoeXNi?=
 =?utf-8?B?WWNMY1R3OFB1cDY5T1F2ZXFwSFl6K0hJeDUrMDdjSlNZOStPczhqcHVXNWNV?=
 =?utf-8?B?UnhYV3Fsd0JlVWQyMzhHWlZKamkvSkVmNHI2VXJGZm1yQzk1RkNZQzhwejdu?=
 =?utf-8?B?UGZEUFNNeFpqeitPemg4eklLeE5FdmJYcjNzVzc1OGg0VW50RUpvZ09FNjVq?=
 =?utf-8?B?bHZ1aDQ0NGJsaFQ2VmJMYkt6M1FDSzhkckdneHhpdWJ4NEYvVGw3aUx1ck5G?=
 =?utf-8?B?Uno5YURlNk52eTQ5MFV2WmNHZ2lUSGVFa0dPTkl2SHdwL1Boa1NGYnF4LzRZ?=
 =?utf-8?B?QzZ1RjFEL1prb3Z5ZEE2ZTc4UHl3SUliYlhZcFdPTE8yUkRsN1pyMWZYVlM1?=
 =?utf-8?B?VzJYM2IvK3A4dzU5dGpUU2FrSFArVGtETHVmWmMvSnNBbm4yLy82QnNETXc0?=
 =?utf-8?B?eHJkbVJUczlBUUZ3QjZRWjA3U0JORmttWTBuMW81T005cWxubWwvQUNON0h1?=
 =?utf-8?B?VHhEOTJ3UVdUUDh4YzBXYmR1SGNDUU9OVnByYnVERXJvWHZ0VW80Y2J3RmlD?=
 =?utf-8?B?aFZXQm5iRFM0S21BVWU1Z3E5UUNNeGtCTmRFQ3JXcTk5emtYTzYyL2M4bEU4?=
 =?utf-8?B?VDVKRDFYQWpEQ3E2WVVTVmFabmE4Nm5iRjhZT1ZMclpaVzdzdDBpTzlyVVhx?=
 =?utf-8?B?V3BHNVA1Z2lMcUxwaUpXYkJHT3hzVVFoS1prSEdYKy9Ud004WlFyZTFWTkNh?=
 =?utf-8?B?YTNEaHl5S0ducE5nekpLTm9PeldmdU44emVuVVVLL1Y4cWYwQ2RUUXJQS3ZM?=
 =?utf-8?B?V1UxQndtcjZOWm1WRUNCZlR1aHZiNGZRVk1tOFRmYkx5SE1BRzJWdGFLeEN6?=
 =?utf-8?B?QTdKQVZmT3FIY3BnY2laMEplQ3hCcERtSW1LUFJ4UFA3OEJIdVlvbWxjc0NC?=
 =?utf-8?B?alRzWU9mWXNRazQrTVgwU3J0WEtBQ0FXK09iSWdNYVN4eTE2SnpHYUFGWXcw?=
 =?utf-8?B?SngvKytFN0F3T2swdkYrRWJOSCtXSklrRkFQRVNYRHFUZ3djSks3QVNXencx?=
 =?utf-8?B?RTNuMVM2b0pycEROUEVFbFVJRWFJWUVmdE9pVEV5UjA0aDhPbjdxUHg4MWhB?=
 =?utf-8?B?aklQSFZJR0l3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MjJQVGVWd0IyMFJHWUsrWnNWZzRueVdzdHprRzZhbmdBMk0vMFNqOGR4TVZm?=
 =?utf-8?B?TW11a3ZYblBDcGRmdGM1NDFzVVdvbHhrdmVBdWd1MWZVZk8rS0NnVHR2RjB1?=
 =?utf-8?B?MHBpZXRnVXVvMStCZlVETWFJbjdXazZaeHZORnpyaFQzRWZ2VDNoT2pGZWhq?=
 =?utf-8?B?ckk0eHRvamF6SVExQ1EyS29mY1o0MEx3NWVvT0hQOGtUcXZ5cFZtYklXWWRB?=
 =?utf-8?B?ZG9jS09IYW8vUmpTRW9RRXdFejE4K3l4aWxYamkvUDZXYkliNG9kZXd2Nmlt?=
 =?utf-8?B?ZUtaU3Nadk9nUEs4MjV1L09hd1ZYYk95aXNDRkoyUGJLVGU5RXJKUzJ4bG9s?=
 =?utf-8?B?SDBFaExUR2tweUZBajFOcmU1Q25XUXp3WWs4b1lWNEk2eXRSVTltTVBjM0tI?=
 =?utf-8?B?dzlCVHJsZzBmaUMxQjUxNGdUT0tpYnJ2T3FrdjZGSytxSzEzLzBKTXJ0aXpJ?=
 =?utf-8?B?WFI4ek14TmxTSk5ncy9mcmhGR0NhVUpOT21tbkd0TllJL01hY2dVMVFYdnF0?=
 =?utf-8?B?TE1EM2VPcEN2a2VtYXpmL2poNU5od3pzZk8ra2gyZHdRSndoeVVUNHRhMmtk?=
 =?utf-8?B?ekZLOHQ3dVpJUFlRKzdGSEZEQkJ2VjhXT0ViZzZNa0lJUmV3blF1K1QzWkRt?=
 =?utf-8?B?Q2hETzg1MWNBb1ZTRDV0OXlkOTNQWEtONUNkaHVYRTMvWm12Y0NJd3FBbVI2?=
 =?utf-8?B?RTd5Z2tXVFJwTUU5TWxJanFzamdGamUvRWQzUEY0Ty9wc0ZmNnAyWkhxcUVS?=
 =?utf-8?B?Ykxlc0ZRZnljV3VYSEptUXdPWGlrVUkyTHUxSTlTcmJ3UGk0cjBXcWhQaHlw?=
 =?utf-8?B?YlZBVkdabm1uZ29rQ2dOdDdMNi9SWHdwTGVKN2RVUHFlWW1kSTVod1dsb3Y3?=
 =?utf-8?B?aENvK09VOW56ZGVSR05jTXpBbTErVXpjNzdJTGJ3S2kwa0N2Tk14TWk2YUp4?=
 =?utf-8?B?YU03Mjd6T1BMSGRyRUJDV2VTMzc3U3QweEZmVkxjdGgyT1VFWndCMTBWOVh6?=
 =?utf-8?B?SWtPWkxqQjJuU3pPelZnSlg3N1FkZmgrekZjRFRVZ1JHR3hvVlhnNTFsVGFa?=
 =?utf-8?B?K09qWS9qRVRTY0w5c1h0SjFIbUwySGRjQzllYXVheUtla1ZhU0hxT2hobnJE?=
 =?utf-8?B?NUc4dEZKdit0cGJWMDZ3a3MwVkJLZmNyVVNLM29peEJMTTVVSXVJejYzVUR6?=
 =?utf-8?B?N3pnUDBRV3ExN1VDUTVKSHlUS1hPQzh4SGh0cXl1TlFCbkVTaC9LdzJWdk9s?=
 =?utf-8?B?enFJT0EwSGY1amUwZ0xzMGpMNXd0R0lxdlM1Z3NING5BQ29OeEYweldQT2pZ?=
 =?utf-8?B?Qkt2WWdvMHczLzU1OWJFOWQ2RDlkNzh5MDJ2OXhkSkN0OHFSRFl0KzM3R3Fv?=
 =?utf-8?B?cmpxK01ZNHd1Rk0zTm9kZDZrNWQ2TlowUGhtVURLcnlOKzhDcWhhNzF1Undl?=
 =?utf-8?B?Q2lhdGRhOEJTeWYxTytUb1psRjRTN1ZwR1dta0xOUFNlc05IU0FpZ3NJS3Vy?=
 =?utf-8?B?YlZoNHdTbk5ZR0xUN2ViNEFzcWltZ3RVZ3c0MDVscDFBYzY0THJOUFF3ZGQ2?=
 =?utf-8?B?cHNnN2FEL3RZYkxFNmVsODN1R0czNjdpWnE5TEJVSm5GM0FuckpwSDFidjdK?=
 =?utf-8?B?RnpObE5mNFNNM0JBTVY5eWV3N2hKa24zYUxJd0UzZS80U3liZUVXMjBRejh6?=
 =?utf-8?B?SUp2MnF2TnlSd3VNcEMxTG5hRElFUC84YWNRTllsRWJRYy9DR0QyLy9pRTZ0?=
 =?utf-8?B?Q2lBVFNTZWNRVVZrdGZGcWRsV0RjNUE0WkNTV2Rhb29Ca0ZuendtRkRDS2lD?=
 =?utf-8?B?OUdPN0YzTHpGN1FsMUF3SlN1c2NtRHE0VzllRktDTHQ2U1R3UThQSmJuSzMw?=
 =?utf-8?B?U3IvMXJFQTJUMklVWmNGaTdvTGovd042VnRVTTQvUjBaYStCWmd2amtlM01j?=
 =?utf-8?B?TlRzdWFVVzRyQjNpUkhoZjhZUUdwRS91dVJUWTFTR1ZCZkJhYWdhN3A0UTdp?=
 =?utf-8?B?NXpaN203U2tORmUvbWQ2a29JYkNVOEMyU0w5TkFta1dqWUkrc0R3ci8vVUty?=
 =?utf-8?B?RDU0ZWRZaVBmMUU1OUNzMlY4NnJCQjZ3clZZL1ZIN0Z3VnVIUUN6YUdXcFl1?=
 =?utf-8?Q?Jag0=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e777927b-2796-444c-e58d-08dd4a15f650
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:00:34.5012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSSUTYHRKDwajzSkMFvoaWih7LNvvfnkSkfrkD5rihRKl/HCS9QyOCPo4pRejpxQd1rJQMleonMFg/CB23CZMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10238

Add CSI related nodes (i2c, irqsteer, csi, lpcg) for i.MX8 img subsystem.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change from v2 to v3
- remove phy and put csr register space under mipi csi2

change from v1 to v2
- move scu reset under scu node
- add 8qm comaptible string for mipi csi2 and mipi csi phys.
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi    | 376 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi  |  45 +++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi         |   5 +
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi |  60 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi        |   5 +
 5 files changed, 491 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index d39242c1b9f79..eb41a6fcaf5b8 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -3,6 +3,14 @@
  * Copyright 2019-2021 NXP
  * Zhou Guoniu <guoniu.zhou@nxp.com>
  */
+
+img_axi_clk: clock-img-axi {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <400000000>;
+	clock-output-names = "img_axi_clk";
+};
+
 img_ipg_clk: clock-img-ipg {
 	compatible = "fixed-clock";
 	#clock-cells = <0>;
@@ -10,12 +18,270 @@ img_ipg_clk: clock-img-ipg {
 	clock-output-names = "img_ipg_clk";
 };
 
+img_pxl_clk: clock-img-pxl {
+	compatible = "fixed-clock";
+	#clock-cells = <0>;
+	clock-frequency = <600000000>;
+	clock-output-names = "img_pxl_clk";
+};
+
 img_subsys: bus@58000000 {
 	compatible = "simple-bus";
 	#address-cells = <1>;
 	#size-cells = <1>;
 	ranges = <0x58000000 0x0 0x58000000 0x1000000>;
 
+	isi: isi@58100000 {
+		reg = <0x58100000 0x90000>;
+		interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+			 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "per0",
+			      "per1",
+			      "per2",
+			      "per3",
+			      "per4",
+			      "per5",
+			      "per6",
+			      "per7";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>,
+				<&pd IMX_SC_R_ISI_CH1>,
+				<&pd IMX_SC_R_ISI_CH2>,
+				<&pd IMX_SC_R_ISI_CH3>,
+				<&pd IMX_SC_R_ISI_CH4>,
+				<&pd IMX_SC_R_ISI_CH5>,
+				<&pd IMX_SC_R_ISI_CH6>,
+				<&pd IMX_SC_R_ISI_CH7>;
+		status = "disabled";
+	};
+
+	irqsteer_csi0: irqsteer@58220000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58220000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	gpio0_mipi_csi0: gpio@58222000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58222000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi0_core_lpcg: clock-controller@58223018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58223018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi0_esc_lpcg: clock-controller@5822301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5822301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_0 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi0_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi0: i2c@58226000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58226000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi0>;
+		power-domains = <&pd IMX_SC_R_CSI_0_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_0: csi@58227000 {
+		compatible = "fsl,imx8qxp-mipi-csi2";
+		reg = <0x58227000 0x1000>,
+		      <0x58221000 0x1000>;
+		clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi0_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi0_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi0_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_0>;
+		status = "disabled";
+	};
+
+	irqsteer_csi1: irqsteer@58240000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58240000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&img_ipg_clk>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	gpio0_mipi_csi1: gpio@58242000 {
+		compatible = "fsl,imx8qm-gpio", "fsl,imx35-gpio";
+		reg = <0x58242000 0x1000>;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts = <0>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	csi1_core_lpcg: clock-controller@58243018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58243018 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_core_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	csi1_esc_lpcg: clock-controller@5824301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5824301c 0x4>;
+		clocks = <&clk IMX_SC_R_CSI_1 IMX_SC_PM_CLK_MISC>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "csi1_lpcg_esc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c_mipi_csi1: i2c@58246000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58246000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_CSI_1_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_csi1>;
+		power-domains = <&pd IMX_SC_R_CSI_1_I2C_0>;
+		status = "disabled";
+	};
+
+	mipi_csi_1: csi@58247000 {
+		compatible = "fsl,imx8qxp-mipi-csi2";
+		reg = <0x58247000 0x1000>,
+		      <0x58241000 0x1000>;
+		clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_esc_lpcg IMX_LPCG_CLK_4>,
+			 <&csi1_pxl_lpcg IMX_LPCG_CLK_0>;
+		clock-names = "core", "esc", "ui";
+		assigned-clocks = <&csi1_core_lpcg IMX_LPCG_CLK_4>,
+				  <&csi1_esc_lpcg IMX_LPCG_CLK_4>;
+		assigned-clock-rates = <360000000>, <72000000>;
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+		resets = <&scu_reset IMX_SC_R_CSI_1>;
+		status = "disabled";
+	};
+
+	irqsteer_parallel: irqsteer@58260000 {
+		compatible = "fsl,imx8qm-irqsteer", "fsl,imx-irqsteer";
+		reg = <0x58260000 0x1000>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		interrupts = <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&clk_dummy>;
+		clock-names = "ipg";
+		interrupt-parent = <&gic>;
+		power-domains = <&pd IMX_SC_R_PI_0>;
+		fsl,channel = <0>;
+		fsl,num-irqs = <32>;
+		status = "disabled";
+	};
+
+	pi0_ipg_lpcg: clock-controller@58263004 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263004 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_4>;
+		clock-output-names = "pi0_lpcg_ipg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_pxl_lpcg: clock-controller@58263018 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58263018 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_PER>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pi0_misc_lpcg: clock-controller@5826301c {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x5826301c 0x4>;
+		clocks = <&clk IMX_SC_R_PI_0 IMX_SC_PM_CLK_MISC0>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pi0_lpcg_misc_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	i2c0_parallel: i2c@58266000 {
+		compatible = "fsl,imx8qxp-lpi2c", "fsl,imx7ulp-lpi2c";
+		reg = <0x58266000 0x1000>;
+		interrupts = <8>;
+		clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>,
+			 <&img_ipg_clk>;
+		clock-names = "per", "ipg";
+		assigned-clocks = <&clk IMX_SC_R_PI_0_I2C_0 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <24000000>;
+		interrupt-parent = <&irqsteer_parallel>;
+		power-domains = <&pd IMX_SC_R_PI_0_I2C_0>;
+		status = "disabled";
+	};
+
 	jpegdec: jpegdec@58400000 {
 		reg = <0x58400000 0x00050000>;
 		interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>;
@@ -40,6 +306,116 @@ jpegenc: jpegenc@58450000 {
 				<&pd IMX_SC_R_MJPEG_ENC_S0>;
 	};
 
+	pdma0_lpcg: clock-controller@58500000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58500000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma0_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH0>;
+	};
+
+	pdma1_lpcg: clock-controller@58510000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58510000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma1_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH1>;
+	};
+
+	pdma2_lpcg: clock-controller@58520000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58520000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma2_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH2>;
+	};
+
+	pdma3_lpcg: clock-controller@58530000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58530000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma3_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH3>;
+	};
+
+	pdma4_lpcg: clock-controller@58540000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58540000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma4_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH4>;
+	};
+
+	pdma5_lpcg: clock-controller@58550000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58550000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma5_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH5>;
+	};
+
+	pdma6_lpcg: clock-controller@58560000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58560000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma6_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH6>;
+	};
+
+	pdma7_lpcg: clock-controller@58570000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58570000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "pdma7_lpcg_clk";
+		power-domains = <&pd IMX_SC_R_ISI_CH7>;
+	};
+
+	csi0_pxl_lpcg: clock-controller@58580000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58580000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi0_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_0>;
+	};
+
+	csi1_pxl_lpcg: clock-controller@58590000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x58590000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "csi1_lpcg_pxl_clk";
+		power-domains = <&pd IMX_SC_R_CSI_1>;
+	};
+
+	hdmi_rx_pxl_link_lpcg: clock-controller@585a0000 {
+		compatible = "fsl,imx8qxp-lpcg";
+		reg = <0x585a0000 0x10000>;
+		clocks = <&img_pxl_clk>;
+		#clock-cells = <1>;
+		clock-indices = <IMX_LPCG_CLK_0>;
+		clock-output-names = "hdmi_rx_lpcg_pxl_link_clk";
+		power-domains = <&pd IMX_SC_R_HDMI_RX>;
+	};
+
 	img_jpeg_dec_lpcg: clock-controller@585d0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x585d0000 0x10000>;
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
index 2bbdacb1313f9..efca0baec4b47 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi
@@ -3,6 +3,31 @@
  * Copyright 2021 NXP
  */
 
+&isi {
+	compatible = "fsl,imx8qm-isi";
+
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
+		};
+
+		port@2 {
+			reg = <2>;
+		};
+
+		port@3 {
+			reg = <3>;
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qm-jpgdec", "nxp,imx8qxp-jpgdec";
 };
@@ -10,3 +35,23 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qm-jpgenc", "nxp,imx8qxp-jpgenc";
 };
+
+&mipi_csi_0 {
+	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+};
+
+&mipi_csi_1 {
+	compatible = "fsl,imx8qm-mipi-csi2", "fsl,imx8qxp-mipi-csi2";
+};
+
+&pi0_ipg_lpcg {
+	status = "disabled";
+};
+
+&pi0_misc_lpcg {
+	status = "disabled";
+};
+
+&pi0_pxl_lpcg {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 6fa31bc9ece8f..c6a17a0d739c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -333,6 +333,11 @@ iomuxc: pinctrl {
 			compatible = "fsl,imx8qm-iomuxc";
 		};
 
+		scu_reset: reset-controller {
+			compatible = "fsl,imx-scu-reset";
+			#reset-cells = <1>;
+		};
+
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
index 3a087317591d8..4c15e4569a51a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi
@@ -4,6 +4,62 @@
  *	Dong Aisheng <aisheng.dong@nxp.com>
  */
 
+&csi1_pxl_lpcg {
+	status = "disabled";
+};
+
+&csi1_core_lpcg {
+	status = "disabled";
+};
+
+&csi1_esc_lpcg {
+	status = "disabled";
+};
+
+&gpio0_mipi_csi1 {
+	status = "disabled";
+};
+
+&i2c_mipi_csi1 {
+	status = "disabled";
+};
+
+&irqsteer_csi1 {
+	status = "disabled";
+};
+
+&isi {
+	compatible = "fsl,imx8qxp-isi";
+	interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+	clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>, <&pdma4_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma5_lpcg IMX_LPCG_CLK_0>, <&pdma6_lpcg IMX_LPCG_CLK_0>,
+		 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+	clock-names = "per0", "per4", "per5", "per6", "per7";
+	power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
+			<&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
+
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
+		};
+
+		port@2 {
+			reg = <2>;
+		};
+	};
+};
+
 &jpegdec {
 	compatible = "nxp,imx8qxp-jpgdec";
 };
@@ -11,3 +67,7 @@ &jpegdec {
 &jpegenc {
 	compatible = "nxp,imx8qxp-jpgenc";
 };
+
+&mipi_csi_1 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a57..c078d92f76c0e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -241,6 +241,11 @@ scu_key: keys {
 			status = "disabled";
 		};
 
+		scu_reset: reset-controller {
+			compatible = "fsl,imx-scu-reset";
+			#reset-cells = <1>;
+		};
+
 		rtc: rtc {
 			compatible = "fsl,imx8qxp-sc-rtc";
 		};

-- 
2.34.1


