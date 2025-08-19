Return-Path: <linux-media+bounces-40216-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4AFB2B82A
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 05:59:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE8735623C9
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 03:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1F9307AF0;
	Tue, 19 Aug 2025 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Wb18x9jU"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012054.outbound.protection.outlook.com [52.101.66.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFFF2FDC3F;
	Tue, 19 Aug 2025 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755575948; cv=fail; b=fzqz4Z7EklNbfH3+h1NJc3JSrfAbO27l1Lgfqnq+Mdj6lRBQFiXlV3ehZohhOdzEwyyfPrhPbwdnMUhrr9dgCMbXim6t1hQiM+YJtnSMLejGLlV8Xfn+utEqEc3SEuLCHq3fXKqG2tI6yqN2gAp+Mogi4OV5+liZeSuUJUbCAi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755575948; c=relaxed/simple;
	bh=kFcDmDTMRPCGGO54pIN/anqLoIdM8z8EX/op6AM1lHY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZAso1fu/mfuuFxS1lke6fszJ69qHs0P8RP9BnPl0m7HyjsGUaC5jWL9p3mYgqYH0zPWwxaHpWwHctD+QvbN7bTuwqVEqAf4Pqbq9YnsT96Yf7H1lXcUgmAitlLG/uOu9jOdFPcQCUTu1kXsYs7eqxpxKIzd7w/GX4Mw+9k15jo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Wb18x9jU; arc=fail smtp.client-ip=52.101.66.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvbEzVzuQkdxehl/Tui/ca3AJVpqRs0a60m3Kq9LV6DJUxuyPdP2MeXt+syYb54MIB2A0U/BFd4vebwDl/HLXHYEPlc9/zkDS62P2WlxvFBEVRnmBtXD7y3SZI87c7lGqO9vcu7xKkyGpj4+UyyZKsGe5qFBhagBuDPAkFBWNrDhILopCRFeX4kkkm+Q+01y78OMf9J1z5t5wuy9x2Cwt/nR7S0EQuhCzNKNr78avln/PVzwTMZzjVfJxNUUnemBCOs7bPSZoFej2bhHF/RCvF0kqwFLVkTpR9naJE1GR7pjY+Pawxh1Toqb/aAhycS26sGaUZ5d25BVCV4oWEEpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9Wj4GufVd/XT4Z468gws8KxACBoydlcrc6EGd2BvnA=;
 b=j4r9sRFCxo5guXoj3rRB+q2VIAIfrXjoh8jrJjiRZOAst27PJBkReit8tIye64LO2jhCtkCMwdFlONTGK1zgTnkyEz5/b6mWOTxlGTH5Rj/4s+9tLYWCC8ZAvAasGgbkh5CY0U8ZaWItaYR3GOKOe8zKE01oj8x5lqL8Tndi1IO4RR0XTK7z5mWUM7/tPEVHkSBvWWxWyzSUTLeifCnwpX8uDufM2h7arL7L9DwUB25E0Glnd+AeWHd9oeOpCK/p5PSeHLNkvmDsxK0bmOiHCzpgNBDX2I88N4ma9hq1kQPDFxvzMkmb8YduZmOhXyP/DS4P6zJ69NWTByXwhJUJaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9Wj4GufVd/XT4Z468gws8KxACBoydlcrc6EGd2BvnA=;
 b=Wb18x9jU8p/emb8Gk0jCcQC+CZD9XVlhHoX3AZeEc/ZEDbn17+mJgz1KNB0eheHCs6jTIHOkDacGHrNMTaDl8TcFTQ97hmgtX4Yb6CTVJeaWBmEBzlYJ9sbC1PyWVcGgYhELEu7mmG//zdQaC4LRQaXQjF/Rvd45IXcZFRWB9G36/yW7LrUO6ZD1osy43F5EpUs+QgZuOrCgyKPSdAHi294lqoOEyhxyNg7wdWFTp0CH8tb3TuqJrVQZM0zH0RB+uZCdNSn+VLN+lF3SxdkzXuPo+HW0Qt1lwPKaapeS9rEG2jkCUEVwYjwg/39tDnlTqLI7OuSF8CmW+txR1uJuwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 03:59:03 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 03:59:03 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Tue, 19 Aug 2025 11:58:00 +0800
Subject: [PATCH v4 1/4] media: imx8mq-mipi-csi2: Remove width field in
 csi2_pix_format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-csi2_imx8mq-v4-1-c16b1d8f88a9@nxp.com>
References: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
In-Reply-To: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755575933; l=3480;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=kFcDmDTMRPCGGO54pIN/anqLoIdM8z8EX/op6AM1lHY=;
 b=qeUjXQ79PGGCRa6ZrKPOfpyVwcS6LBP6llyuxccLKyNlTzmlufvcirb5dXj1W/mwgYqNarQx3
 m2gyDoEJsXtDxUIsej07mPA8LmMNKoAViQ33NoXjDPCDVs3bYJYI1oC
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AM8PR04MB7475:EE_
X-MS-Office365-Filtering-Correlation-Id: f7f596d2-0f4e-48d6-2184-08ddded4bca9
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?V3VabllHT2NjdDBucloxRVFWaFV3dGFDTjlSOGUyNkhwczUrWW5ORnJDUWdr?=
 =?utf-8?B?T1IwMEs0SnREZW1pWW5PbEZVZzlPcG44SkxuU0dGOUZYRUlkb2wycU5pZzdL?=
 =?utf-8?B?TzhwcFFEbVNFa2gyMG9TL01lZWFXVUluaSt0RFk3TmdnNVk0SWZPN3RzNTJQ?=
 =?utf-8?B?RW9vN3lPM2JlbXdoOHE5MDhYdDBXeGN6azBNWHVQenZLQ3F3eWw4UklVblkr?=
 =?utf-8?B?M1VwYk5LUWVYZjN4YU5FM2tqTk8rbWNVL3VSaDdjdlV3Zm1DQXJWS0VRZEJ4?=
 =?utf-8?B?VXNNbXZvaGtCbU1ySXV3a3B3VVFZT0FoRUhhaHVRVVlPQStHQ1JIeTZyQVcy?=
 =?utf-8?B?Y1pBdGNtRkx0NTFOd2E1RkxjaTVLL040RE55SFoySkNtRVRadXk5YW9FRFpi?=
 =?utf-8?B?M3lQa1BjdGx1Qzk3WDBvTzhqQjUxRWt5QTJ2QllML21yaUxwdW1tdUxoMWp0?=
 =?utf-8?B?ZWluSFlHSW51T21zSXlYcklnV091M1N5ZndmRzJ6Y1hwWnM1c2wxWEtRVGpE?=
 =?utf-8?B?b0JoQnM0M3l5V05MWkx1QU9YUlJqdUZ6dHdLNGE1WjNPQy9sdVdPNkRocUNF?=
 =?utf-8?B?ZVhiT29jWVJyd3VDbGxJS0JKUE1TRXNwVVROaDhRQTFSNllUdHVLY1V5eFBZ?=
 =?utf-8?B?ZVhNSlBXbVdaYVNkTHljdXdmZEJZdEJwTE5HcXdLbUt3YjMwcllHa2Q4QjZR?=
 =?utf-8?B?Q2hzWDNUT002YlZqalhuMmg2eTJ4cGVsVXdRNEFtOU1rajRtMWdwOGtEeEpk?=
 =?utf-8?B?SVZMRm8yUERxTE1xRzBWRWZpbENGVjEwbjNiQWxNSnpZY093MDZpK0tqM2ox?=
 =?utf-8?B?dWZYUWRJNURQMUx1RmowUmZKZDRkQXdFNDRCZDZCNkxwZFJlU1g2dDJMYUc1?=
 =?utf-8?B?Zk5KN2ZIeW5JWFIzUlJHZ1BtNEprdm5sZFMyVmsyVEd6Vy9jYVd3SW9lT1ls?=
 =?utf-8?B?OFd2NWNacHpZbU1YNHl4ZVEzYk05eElWVDV4N3d5TkFPNkI0NmdpWmRxRDZo?=
 =?utf-8?B?K01OV09WQ2twQkY0RHFqaG1IckZLcGZVVDZVSktUVVFrSUtTbDB2KzdWOS9D?=
 =?utf-8?B?cmUzN0kvMXRZeHl0eE1id3VZNUtHU2VHZisySmRST2pVVUppd3pGbFVYNkR5?=
 =?utf-8?B?enVkakpSeUkyRjR4L0t1bXdub2lnMXBhZzlTa2dySEYwRnN0UjRQNFljYTI0?=
 =?utf-8?B?UXB0bU1HbUZheDVaRlA1ZXA4ZjZTNE9aNU4ySHd4MzlCRklPU241bGJ0dWVF?=
 =?utf-8?B?clVXZWpYeDMwZHF0Ui9jS2dRQkk0bVFrclZYTUtwZFJ6VnNjV0NZQUdKbFI4?=
 =?utf-8?B?a3RnTGs2WCtSeUh1YmlCeDNGa05LOVhUSXNpQUtTUlVjK3N0QUFJRXNrUWhC?=
 =?utf-8?B?ZS9VOUZ4T1BXYnBkd1V6NEZ1Tkdpb1M1YW43cisrS3diUFhFa21EMllhZEYv?=
 =?utf-8?B?cFJWRkxJTXdoUlZacWxMd21oWnoyTVAyNjFMMGNwUGtmcGgwclIyR2Y2RlFr?=
 =?utf-8?B?aTY0YmxKVkxCZG5vVG9oTjlWWnlpY2dvT0dmVS95T2lQbHVZL2dsM1djdUlu?=
 =?utf-8?B?SXNjSG9ONVpNazVwRm15VTNpQjNOS2VDbHloN25yVmUyeEs1emY1d0ZNQS9V?=
 =?utf-8?B?aHZBSkgweFBOYStpclR2cTN5M0xybjhQQ2xnNENueVUvRWFoS2dPWnpPUW16?=
 =?utf-8?B?ZHY1VUlNQjZRcXYwVTZLdjhyeHdaZEJ2VkVaRCthTkJzQ002SU1DSHJ3SVE0?=
 =?utf-8?B?UGtTT3NqQWhEdlZXTDVUdmV6Z0IwYTZRZ1B3YzhZZ2xtOFNLdlNVbE1obzB0?=
 =?utf-8?B?bU44Z1dEUGFsNldDekhlMGE4WkFuUWZBWi9McEl1ZzJTWjczRlRDcjlzSkNl?=
 =?utf-8?B?TlR5LzZZOHZHZFFnamJDc3AzaU93SzhKSzFwVHovUllEZGwzUGZVTTVNQ2xt?=
 =?utf-8?B?M0RQUW5RNGhja2dPc1FibG12aURHNlNJN3hxd3JEQmZzSEFiNHBPMFVYMnhq?=
 =?utf-8?B?UU00VjhBUjhRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ck9lbloydDAxSTRYam51SVM5d2lGU0g1ZDBhN1ZGMUg5MEJtbnI4M0tkR0Nz?=
 =?utf-8?B?RnJnVTlzSDhobS9wRzJVakRhT2tDck1Jb2s4WW5hbk5rSzRXTGprb1VLNlY0?=
 =?utf-8?B?YSt0RnIrZDJRNXJzTXY0dlZwd1hDdFBIWng5Q1BFdlJoWDc4MmpQenpZRlVs?=
 =?utf-8?B?WFMxcEZYN1NEeVJ3SzR3OGdtdm1XRnJUOG5kYzhhdHRSOElyL0xBbkc4S3Jh?=
 =?utf-8?B?cEdOem9rbndSMzUvc3RWNktzdVBuYW5SQWFOUmlKblNTNGtaRmMyeFAvcWFU?=
 =?utf-8?B?Njl3ZEpwTTFKRENieDM0TmMyQ3g0UzgwUEJvczFwSTNnRHRqZ1h4VHN6ZlBL?=
 =?utf-8?B?TWZrRXhHUk5QN0tBejlibnhxQkRJYlM1eVJxTWovVXdNbTREQVFxdDByNDBw?=
 =?utf-8?B?WVBHSVR1L1VvV1AvWldTcXR4LzA1SjJnY1FyOWVSQXl3dVdCZmVSNzhLWXEw?=
 =?utf-8?B?WDJlb0VUcEdSdXhNSjJLQjV4cE1peFFtUFBhM0IrbE5FekNJM2lmckFCN0pG?=
 =?utf-8?B?d2J2MFFNWGExN0Y4bDVYSmhMVWZhRm9EdHJlNkNCanBjNHFvSmRsK0kvOFBN?=
 =?utf-8?B?YzlGdWNGWjFMU0tLa2ZNempQdGdwTmtDdHd5d0FLZ3NUU1lBNGdoamdZZlVM?=
 =?utf-8?B?OVJwOS8rVE13K1BkYndzQWg5MklMZG4xb2dCUUVZOXkyUnpiam5jeEdCQ1Zu?=
 =?utf-8?B?SWIzb2NoVStNbW80WFFwQ3p3REJBOUpwWUJTSTQ0cm1vWmowL2J3SldMVXJa?=
 =?utf-8?B?UHUwWmg1Yk9tYjR3dmhSeVFGem44VERkRjdWLy9kMUIzY3lLMzNUamJqblNk?=
 =?utf-8?B?c3lhL3NpWDg1amZCWjdCdVJvaWJaRUdQbE9vS1hjaXZXcGFDWG01eXdOTnEx?=
 =?utf-8?B?cG0yRWF3c1l1RmY0Qk1BVnJXOTVEeGRrR0V2MjgrZWx4aGVkaVJtUUc0Qm5V?=
 =?utf-8?B?RzQreVpwdDRvWmZ1Q25BSDRpRGZBTklpaE1kb0s3Tm1ybmNGdFRWV1lreDlT?=
 =?utf-8?B?L3Ruc1ByNElGelZaUW1XQWhqM3dMUHVKSi9Yc3doNmpyRXk0RmlPaXhoZVk0?=
 =?utf-8?B?Ym04ZzRaUEM1bXVBQ28vUWRhR2VFTFU2dmx5VmRGdlZaT1NmZjNuNUNFZ3Jx?=
 =?utf-8?B?OXEwMEhxYURpL04wNytjUlNqbk0rQVEvVERza1hJNERrR2FvamhGK2VCQm9j?=
 =?utf-8?B?Yi9rSDlHbkVZdnpGV3JISW50NzNndlNhajBkTkhKbUphYzNrRStpQThLWGJG?=
 =?utf-8?B?bUVEOGF5bFIwbTcwRnp3ODlONk5TVmlPUlpRdC95c1M1TG51OWdrT1MyVTUv?=
 =?utf-8?B?MnVpZEJ0SkltTGpWSnBMVDV3STRoeTNCQUsyL3JsMGg5SjVXVVhsYVRUeVZO?=
 =?utf-8?B?aTdnUTNOZVUrYkFSU013UmFmY2xDdVVNazI1M212YXVaVm05NVNNUWhuVDFh?=
 =?utf-8?B?Y0dKZzFYUDZ6azhFOERxcUVFSDlxSi8xdmVNbThNTUcvMjU4emJDY2xBTVJq?=
 =?utf-8?B?UitPelFodFp3azQrRGdITEtNVGl5LzRHelpGejBGVkV1WjJYdFowQytpVDNJ?=
 =?utf-8?B?R1dzR1BQZkxvbkU1TGVJS2ExNENYZWtXTnNGeCtOOVdJU2NOc0NUU1EyRVpT?=
 =?utf-8?B?RktVNkRRc3R5djh1ZGZwWjVRUWhrZERQdENCOHJuMmRJNXZQOTZiNXFJdW5h?=
 =?utf-8?B?aExDb3hwaDFyZGpIb1BPbG91SmVIRExEQVVsWFg5a1FNK3J4OEQ1SG4zdElz?=
 =?utf-8?B?eFA2S2lST1pkaEJQb2wvWWR2Q2FBL2pNbWNEdVhYdVBIL0NkYmJqNG5Ed3RG?=
 =?utf-8?B?amN5aUVpSEdWT255RXVJV3VVRDFtOUc1T2dyTEVFVjdvU1JUL0Q4VEMrL3I1?=
 =?utf-8?B?UWt3QWdYOC83UGFyYkM4UGRzdFF2aUNnTk1PRHJ3SGIzV0I0a3Qyc0VBTzEx?=
 =?utf-8?B?RU9OL1luVWRZSW4zTk5xUnRNRmxhSFJidVY1RmdUNjVuWkdaR2hCbEpQL0JK?=
 =?utf-8?B?anRKSjN0bVpHaG5YU0JGUmNoVEo5aTFJc1R3MWJMdU9KaTAvdzVpSmdKUThq?=
 =?utf-8?B?VVgwcDZ3T1E5Y1ZUd0tkNVVvYXhpM1hhTHhrcW9ibGdWZjJ5djBEemRsK1pp?=
 =?utf-8?Q?IVIgzFLoGchtq1Dk3HHemQM02?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7f596d2-0f4e-48d6-2184-08ddded4bca9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:59:03.7903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4NoFHQM/5JhXoaea+Z5LEXm9PVvdMAzTk2KVdr0KWh8Ml5TLR0uoi7C0dqtrUmEWqoPrkHMgjjN+qUr8z3zA/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475

Simplify the code by using helper function media_bus_fmt_to_csi2_bpp()
to get width for supported format.

No functions changed.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 29 +++++----------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
index 3a4645f59a44028fdca82a4d8393e1a0a6ba88f0..85700655ecad334c61e9b5f9f073e10b6db2618f 100644
--- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
+++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
@@ -25,6 +25,7 @@
 #include <linux/reset.h>
 #include <linux/spinlock.h>
 
+#include <media/mipi-csi2.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-fwnode.h>
@@ -138,7 +139,6 @@ struct csi_state {
 
 struct csi2_pix_format {
 	u32 code;
-	u8 width;
 };
 
 /* -----------------------------------------------------------------------------
@@ -262,70 +262,49 @@ static const struct csi2_pix_format imx8mq_mipi_csi_formats[] = {
 	/* RAW (Bayer and greyscale) formats. */
 	{
 		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_Y8_1X8,
-		.width = 8,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_Y10_1X10,
-		.width = 10,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_Y12_1X12,
-		.width = 12,
 	}, {
 		.code = MEDIA_BUS_FMT_SBGGR14_1X14,
-		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGBRG14_1X14,
-		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SGRBG14_1X14,
-		.width = 14,
 	}, {
 		.code = MEDIA_BUS_FMT_SRGGB14_1X14,
-		.width = 14,
 	},
 	/* YUV formats */
 	{
 		.code = MEDIA_BUS_FMT_YUYV8_1X16,
-		.width = 16,
 	}, {
 		.code = MEDIA_BUS_FMT_UYVY8_1X16,
-		.width = 16,
-	}
+	},
 };
 
 static const struct csi2_pix_format *find_csi2_format(u32 code)
@@ -415,6 +394,7 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 	u32 min_ths_settle, max_ths_settle, ths_settle_ns, esc_clk_period_ns;
 	const struct v4l2_mbus_framefmt *fmt;
 	const struct csi2_pix_format *csi2_fmt;
+	u32 bpp;
 
 	src_pad = media_entity_remote_source_pad_unique(&sd_state->sd->entity);
 	if (IS_ERR(src_pad)) {
@@ -427,8 +407,9 @@ static int imx8mq_mipi_csi_calc_hs_settle(struct csi_state *state,
 
 	fmt = v4l2_subdev_state_get_format(sd_state, MIPI_CSI2_PAD_SINK);
 	csi2_fmt = find_csi2_format(fmt->code);
+	bpp = media_bus_fmt_to_csi2_bpp(csi2_fmt->code);
 
-	link_freq = v4l2_get_link_freq(src_pad, csi2_fmt->width,
+	link_freq = v4l2_get_link_freq(src_pad, bpp,
 				       state->bus.num_data_lanes * 2);
 	if (link_freq < 0) {
 		dev_err(state->dev, "Unable to obtain link frequency: %d\n",

-- 
2.34.1


