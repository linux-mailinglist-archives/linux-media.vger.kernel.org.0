Return-Path: <linux-media+bounces-25699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C644A2974A
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 18:23:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FF797A3CAA
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 17:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1042213E7E;
	Wed,  5 Feb 2025 17:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Gfz3Jf0u"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5062135C5;
	Wed,  5 Feb 2025 17:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738776014; cv=fail; b=YJ1DdJ4Y1Q3w+zIciV81iXDtUoFKqN5PjNROlfEYaUf0Z2Og6KhJn8//RAntRDEOfpV+O5xMVcjOXFy9/uu3t5p1bc1XaQrkIWNSNYml6D6tCtnuUQWYmouolkRtZusu40ggVlIhvHVnz4pljj6r3eJ4SEQdZ8BL/aNaRzFkdFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738776014; c=relaxed/simple;
	bh=ugygyO+yHnlfz+15NCVfVP0KrBW32DLhfdZDLvGYONw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=DNJL/seZYdjS2vFPCc1YyuaO8FtRH/30lOveEaEcHcgtj5wepv2uokeLlAMxKFnPD7ArHInhNBWNqQ3A1of0FN+rJpou1SO1jcrKhDHuyRjFgKnIh0oe+ZS4Rt6BqvvCeydMB9ieibg7baEbpXQ+UfAB0gICpmd8OVQ4SgHO2i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Gfz3Jf0u; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtGBhgDfBc9RAFT+O1gTpRx3SX3G4V+tUApezm7x6sd9HJooS1YYPPgugWALopmI9WCVG3967u45TLsUSEkmqhyVnJeNbzFQs8nuMuImnny+DJ0hNaORhz0qdxufLG5dIqvA+Vya4ZrA9pZvWAO7orPVi/dVLkHV2s/asrVRuCjKOS+XYB3tSBBtRGgdHsCVWRrwkF6r/VXYR5miDPFRaiUde0qmiT872wNTbA4SxYMoH0PLPlyL/UvXGAcxcPi2wYKFTQDOire9Y12m7sNRqUGbt2L0YHz+AHnT0PormkL7NoG9/vmr48+wI3Mw0y43VYlZnahfuBMTMzL/dpmViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cA4BaFPtGEObRac4g2FRPODf1jSnHQAkLe8NkZwPS8Q=;
 b=WX/MBAkVC7euIAt42P9Fa6tNloEKLHmzTLxKzYBR7cGw28EL6kHNlf/7ZVuhuCKadXKETU1qJ0A0a7Cse+Qz+U8ALMjzQH5G5f9qIYAHP11g49FkIWSo9F7NuLTEC18F9GkFmAfYBbJbCxD8aNowvgEBerMcKt4Ub2HRkSUBPqe8mFmgpxJUMQbNKaEt0w/jvp/NvcPBdfJzJrJP5KPFsANVx+Fqb55xykFyIlwK/J5j9PsaytC/vhf19frI8rb1WDv3zrdJ/XZsoNaLTAV7B8StauvnnBTJ3Xd9h1tx5heDl8CJFwzrZBeHSRZ1qOopSuDFp3p4bqMVVGOvGYpwyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cA4BaFPtGEObRac4g2FRPODf1jSnHQAkLe8NkZwPS8Q=;
 b=Gfz3Jf0uR+gHRVmc3qOJWaxkDkvrjHHU4gYq8s/IikO5NbfF/tcXiV2N+QQjIp6+hSdzhPorTJZAC/f8oBsG0NycSL/p7WCMkT+uD1CD+dR1eYZEFinlQEYeO7yQmbLEv2v6j4GHSL644HxMMIj2z2817tgsVbrx7kMYbof682q5JHG1RF5ik2Q1uDepo4WBgNJWbhAxpVmi7I3uVdmbJ7A6J+VjK41NKkiJMVjZFvm1tm/UehX6SrqcifFeMWLZpRtTYPb2ljbEvdfmgUHhq7CnQ8Lr7jDAVDgMaxQlShwAjZo0lTrGau+sE2Rz5JakxTbHOp2CpWoE3Q9KTRD9+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB8348.eurprd04.prod.outlook.com (2603:10a6:10:25c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 17:20:09 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 17:20:09 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 05 Feb 2025 12:18:23 -0500
Subject: [PATCH v2 14/14] arm64: dts: imx8q: add camera ov5640 support for
 imx8qm-mek and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-8qxp_camera-v2-14-731a3edf2744@nxp.com>
References: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
In-Reply-To: <20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 "Guoniu.zhou" <guoniu.zhou@nxp.com>, Robby Cai <robby.cai@nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738775920; l=12281;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ugygyO+yHnlfz+15NCVfVP0KrBW32DLhfdZDLvGYONw=;
 b=xrUkliBjVZDYCRKRMfUBVRRWFwvsB0HkyIv7jfoB8wRYQsss/sRlZ+P0ZiPJsnZu8Wxyo2gey
 qEvsxohUtlODrodhiGbHfm/fS0V0PY2TWj2mU1VSa6oCNeKEjckJLfo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR13CA0001.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::6) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 02954a83-4779-4b5f-cc8f-08dd4609574f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TjZQazh4U1ZQbUF1Ry9oSGt0OGUyOHlQbmFvUUlVZnBDZ3RQTnJ1Tk85c2tp?=
 =?utf-8?B?OGJucHNIME1xT1VrVTk0Rm0xZ1VEZUpRT3d5K2k1clNwSFhNMXpUUXF5MzRz?=
 =?utf-8?B?dWhQajVxRlM0ZmVaNTY3eGFVc3o4QTA1THFLZmxBMmxRc2hUMkdiNDZuUHpE?=
 =?utf-8?B?U2dXU3NRdlp0NkE0d2YwWXFQU0pKVm1IK1F0UGdlYkNqdlRwME1YbnVJMmpU?=
 =?utf-8?B?akhTYm0zUjhqc3JsZEJhb216OWVyaVMzUnBOQytCUnN2N0ZFUWZSODJsVnpJ?=
 =?utf-8?B?aGNUVEdnanRKcWtGUkJtbWpQek5uOXhzb1g4eHhSbEhyS05zMXJSYm50Q0FI?=
 =?utf-8?B?R1FOY1V4Rk9sYktDMXlFTGNOUGtkSzVPdXVPN0tWUkU0QWpMRGxQR3Vvbmh1?=
 =?utf-8?B?RmFyTXdWYS8xdWQ2OC8wOXR1ZVRteW9yemlpUHRONUZtTHJIYVZTTUszMjdp?=
 =?utf-8?B?MTJGVW1SVVBRNGxJTFJyQ08vNlZ5Q3JZUGo5TVhIajR4SytBNkdjQ2pRVnQz?=
 =?utf-8?B?cU8xZkdiajRyNWg3eGt4bCtNR1Z4UHlJcUJENVV3bVlSMWFHQ2lUb2kvclhn?=
 =?utf-8?B?OEk0U0dHY2IwbnkwRVhya0ZVMmtlNDRhLzBsRS91eDVyQ24zWThvU1BTZHhU?=
 =?utf-8?B?b3RmbzBWRmZOWFRrbUhaV21uTEx1NmRoNWRha3Y2Zmh0WGtSOGtYeDhCSkFa?=
 =?utf-8?B?cUt4OGI4M1lndU9Ja2NyM2dOeWpGb3hMTmNJT3YvZyt0U1RDeGNLTlEyM01y?=
 =?utf-8?B?OGZsWnp4TjY3WFlUM2lsWmk1VjZaY2ZId1lDaEFzRW9oejVER0xLM1oySE02?=
 =?utf-8?B?RXRhWEtDRlVaenMyTThSYmlaOS8yRnZqVHdieVFKZi9mZm9VeFRWZmZVa3dP?=
 =?utf-8?B?ZXdHT2VnMkpZRllpVW5qMjlsckdxdzN0THpIZTdvd3AyOUh3RDJlV011OVAy?=
 =?utf-8?B?Q2tSVHpaMHpxS2pnNWliaGVjT0F4cGY2NUJTTFdONXU5bFFuc3Qxdm83TDNN?=
 =?utf-8?B?VkUvWkRnR2lnTWYrY3cyV2RJTi9JTHljdXk5U3dPa2xDaEJxOGl6RS8xMlNj?=
 =?utf-8?B?WlY2amUxVW1uRkZqeUNvWHRKZE5XY1dVbkx1aG1SdVpLcGhON0FRZloybDV2?=
 =?utf-8?B?NU5QYUtxK1Q3cU9PSHh2cHF0V1ZqZmFqWEJVbVF2Qk0rOUd5SFpMaHJsTStP?=
 =?utf-8?B?U29iTmxaNmdoaXdwaGRXZ3QyV2ErdjVzMStyZXNwTXM4RWtnbWF3RStJM0pS?=
 =?utf-8?B?STRPYUROeDRFQnNTVjZLa2k5VFJJdTVUanlySlc0aitkcEdTenp0VlJmWHBi?=
 =?utf-8?B?MjcrYWRnRDh1blp1L0tiQ1ZKa1Y1aGg2eDkzTmR3VHdCRGpTWTIzNU8zVy9L?=
 =?utf-8?B?b3VQeThmTTVQVCtlV3JER0Zid1NEaDNham4zWTRlaEkwRkQwWFlyOFpOVGhq?=
 =?utf-8?B?dnQyMytwaVpxWVlDcHdidlBDZFpXdCt3SzdNWm5QcDlRUWFzNnN6U213NHFq?=
 =?utf-8?B?a21vRFN0SFRQLzd1Z2ZMM1BVREhZR2VJYUw3Sm43UklSeC9iNXBDYWlLbVA2?=
 =?utf-8?B?ckdDT2RaR0JFWUVFMjZBMzVvSFJXcUcwY285QzZXU25BOGhkMnpTN2ZCeDlR?=
 =?utf-8?B?Q29iSnNnazA1bExhdVFsaDJVZVp3b0F3d0VlM0daeDlMK3RkT2VRTHZzNUJY?=
 =?utf-8?B?YUhsT3lpdjk0aGwzVkF2cFFzQ0w3dkRFbkdXY3Zvc1IwYkNjNE9zektRMEhz?=
 =?utf-8?B?NndiOE1mSk9CWEZoYnZmbldJN2F1cVh1eUJSRCtjYmdiWmtqM1pDQVNia1Jr?=
 =?utf-8?B?QjJtTlA3REFQaW9hMnBKVVNxT3dIOURDOFh6WU9SYkZFeGlxRk12c2IrWDhs?=
 =?utf-8?B?Uk5FRitodFZxSU9PVUxVR2xwdjVLTVhEcmZoQmZOQ0ZjOEhpdy9ZUy93WmZC?=
 =?utf-8?B?NnBrSm00UElDcTdocGRYbW1YVHhwSDFEaitTUTRkSm1NbU42TEhvRDVzZHFQ?=
 =?utf-8?B?eWhxSyszQy9RPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q1lnYkRiR2t4VCtPSnhWbnBzWFFkMkg5TXpVeU9rYTZtVUlpSUVnN2g5TUhL?=
 =?utf-8?B?UUV3S2grWUxpTERMMVNRTFk1RzN0NTF3S3VKZUsvd2JicWZUbmpRc0hTVGow?=
 =?utf-8?B?cWM1ZGczRlB5d3M2TEIvVXM3MEthaDZsdS9Fd3B6Yk9hUkRlNTI3ck44TGVL?=
 =?utf-8?B?ZTRNMUR6NU5Db0xoSUdBTzJjd0t5WU5TaU5TcFRWc0hIOEtxNUJEajQ1MVBL?=
 =?utf-8?B?aXpJTXd3RStOLzRiRml5bTFjbjhCV3llVEdJUEFxRDVlcU0zOVNYN2QxYlpH?=
 =?utf-8?B?U3NNbWVVQmhhQUxDa2hmWjRyWlVJamc2TFhzQi9HeFhrc3VUa01TMjJETXhB?=
 =?utf-8?B?QmtDVEpta0JrbW9MU3MrZGM4WlBITGNCTWU2cnJYK2hCWnI2d0x0emZnN2Fo?=
 =?utf-8?B?bDlwYnpaelN3dkVmd1RQN1dhaDlJcDY4K0QzZW1mdmN6TC9zTzYzbitxQ29r?=
 =?utf-8?B?VVVRZ3F5TjRHaXIyZG93NnRPSm5EVm4yQXk5Q29aN2xzenRuaStxa0J4SFlh?=
 =?utf-8?B?UHFQNHNFdTRDbnRaZDdmWHNCdjV3NzVPREZGc0tlUzlyb0dnZC9yM0doZy9z?=
 =?utf-8?B?NWJmYkc2UmdGYjY4U0JzNEZmUDZFUEFSemx4WHk0MC80Q0x1YWtNTEpyMEFX?=
 =?utf-8?B?WmZpVW5GV1RTb0g0eEQ0d3c5RUdzZWlzdWpySDRaTmE1MlY2NXRJYXJ5cjV6?=
 =?utf-8?B?SU9ObHFXOVdnZEgvQ0dsZ292MmovTmRIRms4VnEyczV0QzFSOWNkZ1Z3M2pl?=
 =?utf-8?B?cDVoRTBJMStYeUk3Zk9RVmFkNjNwM2xJOFpFZ0t6NzRvVTJNRUgyTGhkM09K?=
 =?utf-8?B?eUJJVUJqdXpTclBobmZFUkY0SnlsNTlhRGV4Y2pLTjBlbThDYWx2SEN4ancy?=
 =?utf-8?B?U1o0MmxRR2liT2Z6cUdKSUEycjgyVFpiTWFPYXJYVHJ3cHNMQ1dQdlZaS1Nx?=
 =?utf-8?B?R3oxRWdJb1ZYaGdOSUNDNWd3WUFua1JFdC9HUkJHdG9UNnVYMjlWN1FxTjJu?=
 =?utf-8?B?QVdnRkhkYlJpbWRxbmFJNG1KTmh2ZW5HUWQrTWVNQk0rOHQ5YUZrWExWQ0g0?=
 =?utf-8?B?bDRGRnl5NjRsQ0xQMDc4c2VtcTNZWi9ybEw3VVVEVUFZbzVDN05JcGl4ZHNN?=
 =?utf-8?B?QS96L2QzbDZtanhQaENDR2ZOeGdxbXdkMUR4YnNSU1hBYUkvZElGQXVsN2FN?=
 =?utf-8?B?dlpDcGNqL0hIOHdYbWhuejdCZ1RlN1ErcmY0Q2k2cjhkWndOV0h0TGNWVEJ6?=
 =?utf-8?B?SldJTG9mMWZGUHozTTk3eDZ3c2s0cmM1dEdBSm9ZUExQSEpIbkhMK0VPaXRO?=
 =?utf-8?B?MUZZRFV6SER6a1VSREs4bEo1bVdxRFVnd3VwS3BwZnY5SnAwclJiUXlxbVV5?=
 =?utf-8?B?cjJ5QWFoa0YyMEtpVnBIRXJUdmtra0dsRjFhY1d6bVMrS2d5TXZ4QkJCUWtk?=
 =?utf-8?B?RmlvOURzTWR3cU9jdnVxUzVYYWFid3B5ZzRmR2YvU0pRY0hOcE9nYjQzZWJi?=
 =?utf-8?B?Q2pVV1hTMGhWNytjWHd2QU1pQjVRL2xoaFhiaFVieksrM1d5ZmxxVTRzOWIz?=
 =?utf-8?B?dXFoMFUrNFNoNklOTXVlNFM2d2JRNWovQlpXY1FCVFY5NkQvTU9sZ0VOQWVR?=
 =?utf-8?B?Mm5aY0doYnJkR2pBeXhlRDdTZ1ZJQy9RZCtQY3FMR0RhemU3SGwxOThIYjRz?=
 =?utf-8?B?c21XdWhRelZTUGY2S1Uxa2ZDY0VwWjJhSVR0cUlRMitTdStQRjVnRkovQzNZ?=
 =?utf-8?B?a3Bqc3ByTHh2MFdCeGFKbUdTSHBaYUdRUDZoM2hPc3VuSEc1Z09mQU9JSG56?=
 =?utf-8?B?ZXFDQXk2elJEaHNBZEQ2d0luZmhTRlhFbGRmNCtISmtteFFlOUh6eklrOS8w?=
 =?utf-8?B?WGZxUVhHQXVrd29LNytISG1KZW0wbmdveFFBVTR1RFphZGtpelI5eXdxSWZk?=
 =?utf-8?B?OTRsVkoxeW5OcUI0K0NIdytJNXorbUg1RkxTYlY2bE4zMC8wbHY2YW1pOEdw?=
 =?utf-8?B?dlUvWFBZaEJHR25ENlhza09TOGJjVjQ0bkQzOUhlWUVTQ2p2d1A1eU90OHdW?=
 =?utf-8?B?K3VzckIyeFRkWFhveGRCdTR3Q2tXZ09pREY3WUk0anhRMTlWZG1kRzB2SC94?=
 =?utf-8?Q?xMa1Eq7/hsBlh5MRDs5moKtnP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02954a83-4779-4b5f-cc8f-08dd4609574f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 17:20:09.1337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 764+WI1/vpJnSbKj358Lu151ziMZtsNmK6Q4s/uBibSQ2R7wA5lXOzX0O8brxp0jEsm8ut4n1dLIpmNOskinng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8348

Add ov5640 overlay file for imx8qm-mek and imx8qxp-mek board. Camera can
connect different CSI port. So use dts overlay file to handle these
difference connect options.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v1 to v2
- none
---
 arch/arm64/boot/dts/freescale/Makefile             | 12 +++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso | 93 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso | 93 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 51 ++++++++++++
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso | 92 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 36 +++++++++
 6 files changed, 377 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 839432153cc7a..d1cbc08eb3f4d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -261,12 +261,24 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-ixora-v1.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qm-mek.dtb
+
+imx8qm-mek-ov5640-csi0-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi0.dtb
+imx8qm-mek-ov5640-csi1-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi1.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-csi1.dtb
+imx8qm-mek-ov5640-dual-dtbs := imx8qm-mek.dtb imx8qm-mek-ov5640-csi0.dtbo imx8qm-mek-ov5640-csi1.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qm-mek-ov5640-dual.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-ai_ml.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-aster.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-eval-v3.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-colibri-iris-v2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
+
+imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
new file mode 100644
index 0000000000000..c2bc5b839e3f7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&i2c_mipi_csi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ov5640_mipi_0: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&xtal24m>;
+		clock-names = "xclk";
+		pinctrl-0 = <&pinctrl_mipi_csi0>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio1 28 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio1 27 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "okay";
+
+		port {
+			ov5640_mipi_0_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi0_in>;
+			};
+		};
+	};
+};
+
+&irqsteer_csi0 {
+	status = "okay";
+};
+
+&isi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			isi_in_2: endpoint {
+				remote-endpoint = <&mipi_csi0_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi0_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mipi_0_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi0_out: endpoint {
+				remote-endpoint = <&isi_in_2>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0_phy {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
new file mode 100644
index 0000000000000..78cc0575fb005
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&i2c_mipi_csi1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c_mipi_csi1>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ov5640_mipi_1: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&xtal24m>;
+		clock-names = "xclk";
+		pinctrl-0 = <&pinctrl_mipi_csi1>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio1 31 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio1 30 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "okay";
+
+		port {
+			ov5640_mipi_1_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi1_in>;
+			};
+		};
+	};
+};
+
+&irqsteer_csi1 {
+	status = "okay";
+};
+
+&isi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@3 {
+			reg = <3>;
+
+			isi_in_3: endpoint {
+				remote-endpoint = <&mipi_csi1_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_1 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi1_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mipi_1_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi1_out: endpoint {
+				remote-endpoint = <&isi_in_3>;
+			};
+		};
+	};
+};
+
+&mipi_csi_1_phy {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 61ef00f4259e1..3a6e25e08c26a 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -155,6 +155,27 @@ usb3_data_ss: endpoint {
 		};
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -727,6 +748,20 @@ IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x0600004c
 		>;
 	};
 
+	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
+			IMX8QM_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
+		>;
+	};
+
+	pinctrl_i2c_mipi_csi1: i2c-mipi-csi1grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI1_I2C0_SCL_MIPI_CSI1_I2C0_SCL		0xc2000020
+			IMX8QM_MIPI_CSI1_I2C0_SDA_MIPI_CSI1_I2C0_SDA		0xc2000020
+		>;
+	};
+
 	pinctrl_i2c0: i2c0grp {
 		fsl,pins = <
 			IMX8QM_HDMI_TX0_TS_SCL_DMA_I2C0_SCL			0x06000021
@@ -905,6 +940,22 @@ IMX8QM_LVDS1_I2C1_SDA_LVDS1_I2C1_SDA	0xc600004c
 		>;
 	};
 
+	pinctrl_mipi_csi0: mipi-csi0grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI0_GPIO0_00_LSIO_GPIO1_IO27		0xC0000041
+			IMX8QM_MIPI_CSI0_GPIO0_01_LSIO_GPIO1_IO28		0xC0000041
+			IMX8QM_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
+		>;
+	};
+
+	pinctrl_mipi_csi1: mipi-csi1grp {
+		fsl,pins = <
+			IMX8QM_MIPI_CSI1_GPIO0_00_LSIO_GPIO1_IO30		0xC0000041
+			IMX8QM_MIPI_CSI1_GPIO0_01_LSIO_GPIO1_IO31		0xC0000041
+			IMX8QM_MIPI_CSI1_MCLK_OUT_MIPI_CSI1_ACM_MCLK_OUT	0xC0000041
+		>;
+	};
+
 	pinctrl_pciea: pcieagrp {
 		fsl,pins = <
 			IMX8QM_PCIE_CTRL0_WAKE_B_LSIO_GPIO4_IO28		0x04000021
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
new file mode 100644
index 0000000000000..6d86b1f549d93
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 NXP
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/media/video-interfaces.h>
+
+&i2c_mipi_csi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+	pinctrl-0 = <&pinctrl_i2c_mipi_csi0>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ov5640_mipi: camera@3c {
+		compatible = "ovti,ov5640";
+		reg = <0x3c>;
+		clocks = <&xtal24m>;
+		clock-names = "xclk";
+		pinctrl-0 = <&pinctrl_mipi_csi0>;
+		pinctrl-names = "default";
+		powerdown-gpios = <&lsio_gpio3 7 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&lsio_gpio3 8 GPIO_ACTIVE_LOW>;
+		AVDD-supply = <&reg_2v8>;
+		DVDD-supply = <&reg_1v5>;
+		DOVDD-supply = <&reg_1v8>;
+		status = "okay";
+
+		port {
+			ov5640_mipi_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&mipi_csi0_in>;
+			};
+		};
+	};
+};
+
+&irqsteer_csi0 {
+	status = "okay";
+};
+
+&isi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@2 {
+			reg = <2>;
+
+			isi_in_2: endpoint {
+				remote-endpoint = <&mipi_csi0_out>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			mipi_csi0_in: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov5640_mipi_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			mipi_csi0_out: endpoint {
+				remote-endpoint = <&isi_in_2>;
+			};
+		};
+	};
+};
+
+&mipi_csi_0_phy {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 89c6516c5ba90..a356c491375cb 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -90,6 +90,27 @@ usb3_data_ss: endpoint {
 		};
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_2v8: regulator-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "2v8";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	reg_pcieb: regulator-pcie {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -749,6 +770,13 @@ IMX8QXP_FLEXCAN1_RX_ADMA_FLEXCAN1_RX			0x21
 		>;
 	};
 
+	pinctrl_i2c_mipi_csi0: i2c-mipi-csi0grp {
+		fsl,pins = <
+			IMX8QXP_MIPI_CSI0_I2C0_SCL_MIPI_CSI0_I2C0_SCL		0xc2000020
+			IMX8QXP_MIPI_CSI0_I2C0_SDA_MIPI_CSI0_I2C0_SDA		0xc2000020
+		>;
+	};
+
 	pinctrl_ioexp_rst: ioexprstgrp {
 		fsl,pins = <
 			IMX8QXP_SPI2_SDO_LSIO_GPIO1_IO01			0x06000021
@@ -789,6 +817,14 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
 		>;
 	};
 
+	pinctrl_mipi_csi0: mipi-csi0grp {
+		fsl,pins = <
+			IMX8QXP_MIPI_CSI0_GPIO0_01_LSIO_GPIO3_IO07		0xC0000041
+			IMX8QXP_MIPI_CSI0_GPIO0_00_LSIO_GPIO3_IO08		0xC0000041
+			IMX8QXP_MIPI_CSI0_MCLK_OUT_MIPI_CSI0_ACM_MCLK_OUT	0xC0000041
+		>;
+	};
+
 	pinctrl_pcieb: pcieagrp {
 		fsl,pins = <
 			IMX8QXP_PCIE_CTRL0_PERST_B_LSIO_GPIO4_IO00		0x06000021

-- 
2.34.1


