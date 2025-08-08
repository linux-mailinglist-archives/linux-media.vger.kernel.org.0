Return-Path: <linux-media+bounces-39159-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E688B1F0CE
	for <lists+linux-media@lfdr.de>; Sat,  9 Aug 2025 00:42:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4485B5A4BBA
	for <lists+linux-media@lfdr.de>; Fri,  8 Aug 2025 22:42:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 785A828AAFF;
	Fri,  8 Aug 2025 22:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="huLQEVsv"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D522E28DB5D;
	Fri,  8 Aug 2025 22:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692842; cv=fail; b=sftgqw0ATQIGB4y+nVyEWWcGMz9vFR3815+PbSJCi99K4DT2/fXWYFyVav50XRRL/c+f3wgckbcxPE3EQm/xrXhRMWm8bQmCRSLnl8dTIKHJbXM0WzchkqGt7EcSqo2UZZVN2ktahI361Q6gonjgJOajAAiFq0o18q7YwmMC0z4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692842; c=relaxed/simple;
	bh=ZPa6mjkgxqtQVjDUUTFy5knCNwpffsk/7qHAD9es29U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XTm5RxmVqZyS0sMS2ydunb7mwkYGhqBEk/0sr9564ezdgTOXuOKZVO8v8Bs2nNdJ7T6ZbQVKaGHJXi1Glah2YhsUPM0GKKrY+LDKeQKTS2wMJ6mw4cptIuwM6pQot355KEd//ajPe2Kn+yEaqvBCuXEmk0F/HaAwcSNIuShnBZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=huLQEVsv; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1Z/5Q2dJzXIfPkqWHgaRICKshF/n5I8Uj8nDgK7aH+QZ16bKzDkIkYe66L1ote7agotdl/4qHwbB888mhTTNac9LKB+yAI9R9M5GcCa/IUpqrEKoWc+MZqDEItAxy0jjoXDbgda0IwQn/y/GLqIYXqRMBjff1Yhvn3J8nwDCB1YX0D0fNy6LusdrEq60w8OnCL+x6MMkXKikJg0Zi5hF7gseMz3uL8yi+JAiQI6Cz6cYyYgCKi3RewbcBCghQFieGkOKUEHlz3G/5xA+aK7iHzj3FepQN02bWges9NWfgQHphA4GTyTLSilBZnCtzXDS1ZzZUJWbo79owuGLZpIYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRqelGO03ujk0kGPxK0ruEl8D+gjJr44LC7/09+yWy4=;
 b=KDSVs5g1fx7rM/tK0UWl6k5INw0otnq/hAuGcDiMdVA1Wpz499TOyDjkXVca8kegSybdU2e79EyMT+fmD8UpV+9WEaxSsyC/r7hHKsjWwFePEfV7/2M4s/zgy1ejO7jYETC4PNWTu0Aw6zzp669crLt5r4rS0ah3cexnoAKBUKzuSWiuSEERL2nOPiHWuS5t03kMoxTDmBM6dKk6djalnUSey3/9fWlkers89sAdtnZNyeJXulP9ghJDAePn6pdYHZYH3Ot11Klk0jH+vq1O1NWQvoMXy12kfN60DFGCUtxZJvbTRTfRISRjgW3IiLnhqMtiV7i7ZmUJIOYBv5zZfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRqelGO03ujk0kGPxK0ruEl8D+gjJr44LC7/09+yWy4=;
 b=huLQEVsvBP9C6Tu5ZfFBsnzGmyXcA64+0BNs9vnShVtbjdQpuw4GjKQSaR9zzVuutxNfOt545V8JPdbDuwuiMtBozJa3aJSzGsX+nXzXlQk7sj74Vov4/KGs96a3IKhD6rkXT1MK+itt5MwqJ84zQAMWgQy76kH5tq9eDkduWPMncDyIXluEqbe0yMThamWbA+Drn1rL152WY6bHTLFoeonbrqOdxWmA3UlrI5N3pUWIQb1LrZanFM6hfklbSHxw8Kt55/uPdBi6ayXhmMpLo3HfjXYJZ1gFP0niqIire4KzGNWKtpOf6wyEmXEIyYTKsmgJrK8J07WaYPwwYm3Isw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA1PR04MB10528.eurprd04.prod.outlook.com (2603:10a6:102:445::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 22:40:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.9031.008; Fri, 8 Aug 2025
 22:40:39 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 08 Aug 2025 18:39:10 -0400
Subject: [PATCH v2 07/32] media: staging: media: imx6-mipi-csi2: use
 devm_clk_bulk_get_all() to fetch clocks
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-95_cam-v2-7-4b29fa6919a7@nxp.com>
References: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
In-Reply-To: <20250808-95_cam-v2-0-4b29fa6919a7@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754692792; l=4005;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZPa6mjkgxqtQVjDUUTFy5knCNwpffsk/7qHAD9es29U=;
 b=Mz5T8gcNy+cuvaJ6aR8igrllkYNLfANm8LVqNmn+m7cyR/5VgB3zwIhoDgEnQajox/a7zCGcl
 6kbG12xhFUgDvNmOGJQXjeyxEwIO2ddwCRVCYcmU8ulofKtV8ai0jGY
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:510:339::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA1PR04MB10528:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b5537d-7652-4b56-8d3b-08ddd6cc997b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?QzUxZTdkV0RLWXZlMUhDYlcrSjdHSFdMbDF1OEV1dE95QnkzWkNjejQxb2p4?=
 =?utf-8?B?NEJLQ1VpeDhVQ1lPN2U2cmlVZWZwVXBCazhQajhReHJkUlNLbk5UNXlJdzBT?=
 =?utf-8?B?N0hpZUxGK0NLbnRTWi9yWGFNK3pYd3BvNTMvQUJ4QytyUHhhVWtVcFZWanFj?=
 =?utf-8?B?R3ZHbkhoa0ExakFuaG85T09vSTRSRmROVk9naCtoWXV6ZSt4dmZFK3k3QmVK?=
 =?utf-8?B?WjR0ODdtQ1BwaDRtbjlPdkZVU3doNkEwWEd5Nll4dVJ0SW5oUGxrd2N2alo2?=
 =?utf-8?B?VEtBd2JJVmdFdGV6aitZK1R0TVEyYURBTnozUldFOTNVS28wTkFQZmRTUndj?=
 =?utf-8?B?Q0N0dThicm1ZcGFyT0RTcGJ6c3dweFM2UHVKcnc1ZmlKNE0wbGRrajY0U3pF?=
 =?utf-8?B?UkdiOEJLK2xFRWtIajBBZHpwbWRMMjIrWEVvZ2NUMFIyMTByNXBmTmdPaEt3?=
 =?utf-8?B?bmJYQWFYa2JiSkZLMnl4cU9NVVJCWnF2c093MjVkcEhrZ21Qb3o1bkhpMzAr?=
 =?utf-8?B?a0s5MG1ETVZDSVd0YVBzdXFGMjVHK1BqY1hFUFhkV21NTVVIVHNPN3hmb2Ev?=
 =?utf-8?B?NlRwQVh4NHBKYXBvTjFpek10eEVzOWRScmJST2FlYy9saGN0anluMVJLVmRT?=
 =?utf-8?B?NjlucGtoYmZlMTBtU3g2dWQ0U0RZeUVxOGRXWUl3eGpPZ1NLN3JJakx5dUFS?=
 =?utf-8?B?bmRNUGJaS3c4N0YwbnF2WTBsY3V0QlUwSnA4ZVQ4TjVJU1JTSjVEdi9kamFI?=
 =?utf-8?B?TzAwQlJCUGRZRHBtWDdjRXoyTjk0QXBqQ1AzVkFOMktNdEFFZG00NGwrbENR?=
 =?utf-8?B?M1ZpT3R6THZ4RUZ4SzF4eFFVU1hmVDJFcFNIQkdCRW9FZUl3Q1kvUzBEMW9u?=
 =?utf-8?B?SjNRM3pVdFlXV3dRY1ZzS1BiclZ5VE1iRVhzV2VBdk14TWRYTlM0dDRteXMw?=
 =?utf-8?B?aFdzZEdWTEhvelRrQlFTdGVwdTR5MkU1Mlh0Q21kUjQvc25yTU12VS9Lbm9P?=
 =?utf-8?B?WS9UaVFzc3BDMU5XM1p3YlVsbWFLUnN6bzk5eTFVZ3VhZGxOd2xFWC9EOVdH?=
 =?utf-8?B?cmRTUkdFbGp3dFlQd3pPeFJadGJ1VjdpcjYyam01VVJrNWhiNEFVckxIZHhO?=
 =?utf-8?B?eWpScjhxbjFVbGFVaGRNRXVjWTJnam0venNIMmcwMzJrMnBLV0NUbFR2WU5n?=
 =?utf-8?B?NS9EczhnUnJlaE5PYnZubEdFSGd3N1BOa0xwWUx4Nk52cmtXM1dSaXNFSENU?=
 =?utf-8?B?aWRTZ3BuSDVXazlETDRNOGF5elFSZFhDMW84cXhJVW45Tis4bzNxUXJRQm9r?=
 =?utf-8?B?bzFlYm9Hc2plOXM2MVlSL3IySlU5SjA5bmVWV1V6bzJBUDlqbkREa21rdUZ1?=
 =?utf-8?B?U0hJcXlOUC9WRVdkaktzN0dTcGVFQlVFZWdCRklCL3JiaGYxZUREL2gwWHYw?=
 =?utf-8?B?SCtGVGtoeU1ZaG8vSUVIUVdlN0ZaMHUvcXJ1VmJkelRyTmhLRS9wVXB1cTcx?=
 =?utf-8?B?Y040RzFFaFJrRnlTUUNONXVVQUhMZkROVzROSC9jS3BOZXdSaWZCOTU4OWxx?=
 =?utf-8?B?d3Mvb3BBSUJsb1VtOFNFK0xaK2RmemFEbVF4SFlBVFh0cU5jNnpidS9Eak4v?=
 =?utf-8?B?WUhsamdTRE4ydEpoZlVKZGxnT0FlYjZnWFZ3cm9IOUxPL240S212WHBSaGdV?=
 =?utf-8?B?Y1Q3OFNJd1FKOEpZRVVJRnk4NTF1UEdCVEx4b0V2cFJXWUQ0Qjd3SWQ0VE91?=
 =?utf-8?B?dHFnQW9udU9XYmNIcy9hU1FnSVp4NmtRc1VnaHdPZ3VTb0g5WGVMTjRRbXRR?=
 =?utf-8?B?VnhwUlNxOUpsMURoejVwSGtRZ1dURnpKa0ZEZXVtOXpsRTAySlNwc1o0SEh0?=
 =?utf-8?B?S1ZKdlFtV2Ria0wzb1plRTE4VXZORE5TNW9KbGxpSDd5U1BVUlB5WjkyZmZT?=
 =?utf-8?B?c0QrTHNiSlpsOCtlSmFiVW53eVdmNDlFLzh5OHFkUzcxVTZMN0hVUmljUEY1?=
 =?utf-8?Q?r1AYTHluGOc9FHPppnjxThfVCD5I5w=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?L2QzNXk4THBIVitXaTBiRElBNEUxaXZxSFBBdEFHN0cxQUFhbUFpeWJaMEEy?=
 =?utf-8?B?SlpsbUp4Sm4xenBYcUdoUW1DTGx6OHdnTVNiUjlPQkhwcmtsWHdPYVVmNTRW?=
 =?utf-8?B?Vk9DOU5qUmozaDRIU1BzV1YyeDExTWNwSDlON3A1RHhPTlpkbUFqU0c3d3pT?=
 =?utf-8?B?Z2NFVU5sSXhicGtwTTJhenl6L1ZXY0V5THpzc3JvdWRneXNnR3EvdGZOM1k4?=
 =?utf-8?B?a3ZTQkJLWTNLMWU3S01HZHdZS21PamxuQWk5a1FLc2p4YjVMR2dHbWlmRVda?=
 =?utf-8?B?a0NkbkhKcG5BcDArSkdpYnFKQ2F2MnJlT1JkMzhweVdaUTVFOHR2dzY4cHEx?=
 =?utf-8?B?UWVjeGVHaGFUQ0dmUjNWd3BTRENkS0FwOXZSVWN3QkdDMUE2Z2QyK010cGNk?=
 =?utf-8?B?OWR5TzdhSUN4dVpQSHFsZ3ZQbmJjSm5HZ3B3aEg2NzB6UG5xSkRwdGxaRHlO?=
 =?utf-8?B?NFE1L0ZHTDdseEdJblJVNnlUQmk2Vkl1WE9QRUNDMHhrRGFRbmRsVEk3a0U3?=
 =?utf-8?B?ODdjNS8vYmpKaWNVbDBjaU5WM0lUSjJndUlhUUtKeUdvb2dGN09CZ2JJTGh0?=
 =?utf-8?B?TUNxU05mUGpRQThNZnB0ODBESXkzV2orZ3RidDRnb2JBWkRwYzRBOWtlSWoy?=
 =?utf-8?B?WkxDYkpWbU55dkcrKzBRbXl0VjQ2d2p3V1pWbUpuaDBFdDRqYlBIQVNhYW1u?=
 =?utf-8?B?NUtXU3VkVTRNM3JFeGJ1MmtoK1oyZGF5UUpHZTY4L3RFTG5HeFRweTA2cnpq?=
 =?utf-8?B?bXVvdFJVdm5ueFZGaFJrclJyVG96aXJGL0lubW9rOGFTcER0WGkrY0tYeFhw?=
 =?utf-8?B?ak93T3cvSXQvQWc2K1QxQ21mMkJneWtrZERQbGtoU2pHQkFLTTVOOC9KWjJ6?=
 =?utf-8?B?NGVqeEVIY1FGMUNmYVkra0M5eUdoKzc4dFZIeHZ6QWczdGhxNWpORjlBRnFs?=
 =?utf-8?B?RWlFbWZXdjhCWFFkSWVPRUdhZ3I0NW10ZlM1VVlNVzZZOXE0YVRUNSt6aWNx?=
 =?utf-8?B?b1hyMUc0YlgvWWRpaWdQOFBtOHY1ZVpiK2V0NHcyT0pDSVZkOWErVEptV1lw?=
 =?utf-8?B?eGtUWkxwN2dpVC9FZHg4Q0t1OE1ENHhZcDNBR2ZHdGNyUmRMU0xHUFhIbXY0?=
 =?utf-8?B?ZENtWFBuWEY4djNzTWVUVEsrSzM1U1hmVDFvTFc0TzdyT0FsNkxUcTNqeFRU?=
 =?utf-8?B?aVlYQXVGc0hYcGQ3MG43cS80U3U1QnBlWkh3RE9MdDVKOVpUdDNveHFQVitT?=
 =?utf-8?B?eU5peS8yeWtlSEJoUUttczFkTmNaSlNPcE9tSHNFOVNxVVhoZmNidWdaWndH?=
 =?utf-8?B?V1d5aUlTT1doOUorWXNOTkQ3R21wNlc1aXBOSWUwQjdNRW5kL0pWcDFDcU1p?=
 =?utf-8?B?SlZvMGUybnpYUTlkOGlLQjd6UUUwTHVLMi9URU1aVW91UmdaWjk0aTNTNGFV?=
 =?utf-8?B?d0dtWXVzd2tRUzROUzl2bmt2YjZrU1hPRHBkc2k1bVNXMmRLQmFOcTg0bnpz?=
 =?utf-8?B?Vm15REkrUkc4UHdzVFNZbjBoNkNYYVpybm9QT3Q0TGhWWlVhTmpWVjlmbFJi?=
 =?utf-8?B?dE5SUHhIVUd6NmtLZDg5blY1STU2Z01ORk9tWUNsSmNqNjBkaHZva2JxK1VO?=
 =?utf-8?B?Szd5cnFyTDVoNFV4L3dQaHNDaTdwemZvNzVZL1JocGppcFR2VlM3VFB5UGxp?=
 =?utf-8?B?eHNRdzdTT1IzZUlXTExsWFc0a2k1a0JNa05XTXRJTVBpWTVjOTdPVXpSa0NR?=
 =?utf-8?B?OG9Hazh1VUlRWExpdHRhNFpIUWxyemFodlA1OUo5dGVRZ0hvaTV3Vk5qamJh?=
 =?utf-8?B?VUQzOW5oTGhteVdCejY4bHkvVEMyRGM2UFVwTjRzTEM1OVljcDA3RmJJWE12?=
 =?utf-8?B?czMzT0ZrMGVtR1FNTWxzd1N0b0xtakF3MWdsWjNIK1U5S0xkNGFEN0wyb2Fa?=
 =?utf-8?B?MDh6MWNtb3dhbVkzd2g5Y1dLc3hWbEdEbTVxalhYbUM2OHZlSnBnSUVBUjkz?=
 =?utf-8?B?dnNzVCtaUHZMN1lKaVlmblMzQSszLzFaUkZicVJhRGNLU3h5dDlpWmsvY3VI?=
 =?utf-8?B?TEdzVklsdXI4VkIzT0Z3YUlqanFkRVZsby85RGNlMDBjNFBXKzFKbVd0ZHkr?=
 =?utf-8?Q?iCk+/DBMaBZkyyDWpAr6aECSZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b5537d-7652-4b56-8d3b-08ddd6cc997b
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 22:40:39.4875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaVQzEoHp6qS5fXMTQUfQAEjutJFVav5PGh7f4hxS1FK0Rh9Qb1Qs20vT8fk2MadxIzZkb4s8D6d3Q9nteQlrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10528

Use devm_clk_bulk_get_all_enabled() helper to simplify clock handling.

Defer all clock prepare and enable to csi2_start(), which previous only
enable pix clock here.

We can safely do that because there are not register access before
csi2_start().

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/staging/media/imx/imx6-mipi-csi2.c | 52 ++++++------------------------
 1 file changed, 9 insertions(+), 43 deletions(-)

diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
index eba9a650030f5e380aa900b94728ad375171c6a5..32ddcef7ec8535a44e121754bb621c0d2e226369 100644
--- a/drivers/staging/media/imx/imx6-mipi-csi2.c
+++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
@@ -39,11 +39,11 @@ struct csi2_dev {
 	struct v4l2_subdev		sd;
 	struct v4l2_async_notifier	notifier;
 	struct media_pad		pad[CSI2_NUM_PADS];
-	struct clk			*dphy_clk;
-	struct clk			*pllref_clk;
-	struct clk			*pix_clk; /* what is this? */
 	void __iomem			*base;
 
+	struct clk_bulk_data		*clks;
+	int				num_clks;
+
 	struct v4l2_subdev		*remote;
 	unsigned int			remote_pad;
 	unsigned short			data_lanes;
@@ -343,7 +343,7 @@ static int csi2_start(struct csi2_dev *csi2)
 	unsigned int lanes;
 	int ret;
 
-	ret = clk_prepare_enable(csi2->pix_clk);
+	ret = clk_bulk_prepare_enable(csi2->num_clks, csi2->clks);
 	if (ret)
 		return ret;
 
@@ -390,7 +390,7 @@ static int csi2_start(struct csi2_dev *csi2)
 err_assert_reset:
 	csi2_enable(csi2, false);
 err_disable_clk:
-	clk_disable_unprepare(csi2->pix_clk);
+	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
 	return ret;
 }
 
@@ -401,7 +401,7 @@ static void csi2_stop(struct csi2_dev *csi2)
 	v4l2_subdev_call(csi2->src_sd, video, post_streamoff);
 
 	csi2_enable(csi2, false);
-	clk_disable_unprepare(csi2->pix_clk);
+	clk_bulk_disable_unprepare(csi2->num_clks, csi2->clks);
 }
 
 /*
@@ -761,24 +761,6 @@ static int csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	csi2->pllref_clk = devm_clk_get(&pdev->dev, "ref");
-	if (IS_ERR(csi2->pllref_clk)) {
-		v4l2_err(&csi2->sd, "failed to get pll reference clock\n");
-		return PTR_ERR(csi2->pllref_clk);
-	}
-
-	csi2->dphy_clk = devm_clk_get(&pdev->dev, "dphy");
-	if (IS_ERR(csi2->dphy_clk)) {
-		v4l2_err(&csi2->sd, "failed to get dphy clock\n");
-		return PTR_ERR(csi2->dphy_clk);
-	}
-
-	csi2->pix_clk = devm_clk_get(&pdev->dev, "pix");
-	if (IS_ERR(csi2->pix_clk)) {
-		v4l2_err(&csi2->sd, "failed to get pixel clock\n");
-		return PTR_ERR(csi2->pix_clk);
-	}
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
 		v4l2_err(&csi2->sd, "failed to get platform resources\n");
@@ -791,19 +773,9 @@ static int csi2_probe(struct platform_device *pdev)
 
 	mutex_init(&csi2->lock);
 
-	ret = clk_prepare_enable(csi2->pllref_clk);
-	if (ret) {
-		v4l2_err(&csi2->sd, "failed to enable pllref_clk\n");
-		goto rmmutex;
-	}
-
-	ret = clk_prepare_enable(csi2->dphy_clk);
-	if (ret) {
-		v4l2_err(&csi2->sd, "failed to enable dphy_clk\n");
-		goto pllref_off;
-	}
-
-	platform_set_drvdata(pdev, &csi2->sd);
+	csi2->num_clks = devm_clk_bulk_get_all(&pdev->dev, &csi2->clks);
+	if (csi2->num_clks < 0)
+		return dev_err_probe(&pdev->dev, csi2->num_clks, "Failed to get clocks\n");
 
 	ret = csi2_async_register(csi2);
 	if (ret)
@@ -812,10 +784,6 @@ static int csi2_probe(struct platform_device *pdev)
 	return 0;
 
 clean_notifier:
-	clk_disable_unprepare(csi2->dphy_clk);
-pllref_off:
-	clk_disable_unprepare(csi2->pllref_clk);
-rmmutex:
 	mutex_destroy(&csi2->lock);
 	return ret;
 }
@@ -826,8 +794,6 @@ static void csi2_remove(struct platform_device *pdev)
 	struct csi2_dev *csi2 = sd_to_dev(sd);
 
 	v4l2_async_unregister_subdev(sd);
-	clk_disable_unprepare(csi2->dphy_clk);
-	clk_disable_unprepare(csi2->pllref_clk);
 	mutex_destroy(&csi2->lock);
 	media_entity_cleanup(&sd->entity);
 }

-- 
2.34.1


