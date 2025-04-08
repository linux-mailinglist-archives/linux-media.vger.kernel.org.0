Return-Path: <linux-media+bounces-29681-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D25B7A817EE
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01E931B68656
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C632255244;
	Tue,  8 Apr 2025 21:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FjaG4ngC"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2087.outbound.protection.outlook.com [40.107.241.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9132566D2;
	Tue,  8 Apr 2025 21:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149251; cv=fail; b=peKieS33kMuBXNo3bZWGN87PO+/DkPoyxPYb/pinlt81xDad41RgxQgkvTEke5sAs1D4dVZASsNLJi17GPS2p/1aR6U7mVzgJ+KPiquq2+JyD/yTzJc2SeziGBFgJEa2FIwXwzmDAJhm57abFFjppYEoAmH2XyCnsGLrtkI4R+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149251; c=relaxed/simple;
	bh=noXMKVQBMelK/ehK/17x/ZiLJCzT079DHPxDBWD1mPk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pRHurzhF557F/ptdVEtJUuptVR4zCIhAUKXjQsqA3JnlP6Gtgbr7K5ZHbM+dkZppcQzDJpXSBexSVItW6R+5y+O4St7A/uoi7ArA1va2R0c7Xb3hfOwzaf0AwKWwrFUnfO+QHLZYskk57f/ovaNm/bcqYEcPFszv+cjWslXmLcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FjaG4ngC; arc=fail smtp.client-ip=40.107.241.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oB24SjYArDcFrfPdfwXI9etj4gBp6+EDTz67zSV3CIQ509l7PIIdCmYOIiYIzCTyH68a6xPkCaZqrRHnZyH4QeHXZYA7wG98Af7fMEwquu6jmUHBGp7tPYOyrixRu11B4YGSZnhoKuFkNFf5kN2nsVj5F6zfOXPjorDka6z2ORHezldZurWiP7fg3VgVACnPej2T8UjEJ7dhm3VRd5k2oD+QEqDrS+ytCzx41Z/zKepnJ8Q0be/S8MM32XnfBaBf0fUYumBLYBrbyocz/i6iHZxdrG6nMus9l1TiG3jTwDbzHZqZm3Y2igXcjg5Qtf/uF7uYbIaHD+xBySAoQE7JJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ydh2r1iRTTmID8c6vddANSkJyJZKA1k2Bb8KWqAxXs=;
 b=WNuIg8JVStUxVLEY6E8Ry1Qp/Fu32u7HouiUjpboqMM/6O63nL8zQ/Nh978RIiQ1Bv/+nToLKJr+DQAaF2O2oGeyqptFwn0iQmjdYDIZuJ0aQ+FR4Hhq8CVbizls1TXpgyCSKJZXzZLQZN6V7D/JPdx5vu4myWWvuwn14tjHFemzV76PlWILLrd3C9uTQKyzhxGC67IEM/+wipaPafPswnypGK+fQmuzJRpJkDBJgFuRi0IF1GFmcyjMB4GSUiiFDdfuXod2Yif/M7Ygc5WkOWFxAD/O68tZ9kSZyJWuGIcMg4dBXWjS/m8vvjndWbuiY0iDrjwDgNMH8zStY4FFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ydh2r1iRTTmID8c6vddANSkJyJZKA1k2Bb8KWqAxXs=;
 b=FjaG4ngCl/u45ifSGZqTD+bDUHFfvmbQi7QGyBtuR3gmtGAoIT9IVgp3Senl5sGHshNNk94qR64GsF7E80bCR87GWSyyaCueqTvxZ5DPY5ntp4cXFeUhfgGzCzlnaTyxfQbJbpWzHSo2JKmkNihjpcRlN5zbfCCp1EXEzX9KpFaetTfNNg0EUgXl56qbBjFlKbTgaHQGqvzBE5PP3eWqzkXIhRfAF2W38O+QoWkDHr0mkwO2B5UgOU27fIKvvzq/tlVLbQuwaAL2irNJcFriwj9pBKH3O7r+4MDuF3KVGdozBXkpjUTkaIRtPR55FmV9WqMAPoyKsA6SPRA2eK+NnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:01 -0400
Subject: [PATCH v4 03/13] media: nxp: imx8-isi: Remove unused offset in
 mxc_isi_reg and use BIT() macro for mask
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-3-ef695f1b47c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=2902;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=noXMKVQBMelK/ehK/17x/ZiLJCzT079DHPxDBWD1mPk=;
 b=hxb2IYvh6f6/SswqYyMi62Zbf1dc5KaQJizcMsuXz/FD8R/DRB1bxW1ahI0sm9p+njbSavfI2
 FVrbcra73DcCC73WVQBX9PXPDpiFeRHxoxEH7zu0YtF5jyMZOrLa4mY
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
X-MS-Office365-Filtering-Correlation-Id: f5f3a77f-f459-4879-231c-08dd76e7e229
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?ZUxJTjhVbkR4L3VrMmhFRElwOFBuenUvTDZWSmd4dCtseXRXaTBqNG5YcG9t?=
 =?utf-8?B?QnppazQvSWgzZzlXa3EvQVpRdW4rcjVOWDJOL1N6T1A2OXhZMXJWQktEMnJY?=
 =?utf-8?B?RTJBOTRYRE9PTmlVRGZuUUszamYwQWRwdVg3WlNoRTAySmR5a2NGS1NHTGJo?=
 =?utf-8?B?b0RCeksxQnQ2RUU0azVqSkt4YSsvRk9FTXBWSjY3YlcyOVc5TkJ0OFlhNFNJ?=
 =?utf-8?B?TTY3ZDd0MlJwaGpDOTRkQkVXYncxVGhrWnlLY0ZOUGFwZVFPZ2U2WHNTSVBI?=
 =?utf-8?B?a2lONkJ4aFArN2VmaVh0ajFyRzVSMUdaSUNBSUQwbWhaS000U2c5c0pwVkxi?=
 =?utf-8?B?NzFyTnRmdXk0ajFLREx4VGswUUhzeU1yUFh0dXhwb1lPVjB4S0czVVN3Y2hu?=
 =?utf-8?B?VU8xMXduU09oZ3dSUGdMYWREWTJyZEozTGRPcis3VGI0SmZkdm9wNDFZZUdZ?=
 =?utf-8?B?eWhTanM3SFR2Z3dXUkE0Nzl1WVhZY284NDZQbWdzMWJmZDZaT01SUS9MZm1W?=
 =?utf-8?B?WXlUTDZoRzhmZE5XS1dCcUt2Y212RGxoSjZZUlp6VGgyeld1QWQ0QnRyaXhD?=
 =?utf-8?B?T3k0a1FmeDBESU1EUmVQYjRLY1NpY2dYT0lleS9QSUtGSGRCWGtxL0t2M09T?=
 =?utf-8?B?YzZmMUNlNUVaYnQ1WUhpZko4WHk1R2o3OU8rYWVkY2FFUG96ZExwSmlvOTNM?=
 =?utf-8?B?YTlkSXVvSFJ4R2lJSDhyU1BsRTZMcUhvc0U2b2R6clJUU29vbFVjencvdWt1?=
 =?utf-8?B?UjJhaXNQaVlMSEtoWnZZRzN5NEMzUkJZWGE2bjh1TTRDNnpTc2p0QjJkQVFQ?=
 =?utf-8?B?WEYxbnByV1ZkSGxxS3p5WGRmQmpsUERjUmRBeTV4RjdXeWRZR25RQytZb09B?=
 =?utf-8?B?dkIvMktnd094S2l6QnRhR2JEMUdnWkhpbjQvRGVxM2RabnkvSVNUZkNNdW1y?=
 =?utf-8?B?RjA5bEROVHFWak1HT0gzazU1aExDTDF0azZoRUdEZDFjRkRjTVV2dVdNd3p3?=
 =?utf-8?B?RHdOa0hxKzBnc0xDU0pKTlpZNnFFTVF2VnJwc1VRa0t4UVNUNzJneTlxd1Bh?=
 =?utf-8?B?cDgwZ3p5R1NsWFBkc1NhUjY0M1pUc2hOOFNKbU9FUUhVdGZqRWQxTnpJR1ox?=
 =?utf-8?B?WWdEUDhYMzlVZEdUTWpMUTFOQk5jQWdVbnhKYjFsWUJTQStIalMyTFRaS3Av?=
 =?utf-8?B?dW15NjJ0c0s3L2tmUnNGOVZ4eG9NRGRDbk41dFkzY25Td2kvK3dmd3hNck9h?=
 =?utf-8?B?SytXVzNhcjlLb3d4UzVBT1owR0liZkt2TUwrelRZL0M1OEtYVkZsMEJoZ3N0?=
 =?utf-8?B?QkxIRE1ubnhrYmNkbzVEWUh0UGJYVWgxR3NBbGMwcitPSndIRHYwbW9UUnZj?=
 =?utf-8?B?d1ZDNXJ6WUk3QmVmRmU1S010Zk4wZ3A3TWVhZWdXTG9SRjlwQ2p5U0FsSTla?=
 =?utf-8?B?VFluVzE1eE1pU1gyekVLNVhRdlh5Q2JKNW9BZ1dadzRtSnBjaW1tdU9zaEUv?=
 =?utf-8?B?VFpIOUh2VzQ1WTJDYzV1K3VnMmlCd1Z6ajgyQ1c4am1OTmZya293UDNQRTRp?=
 =?utf-8?B?KzlObDFXOG1BcEh5S3FDSzEzakN2bk9DQk1wVVBRQ3g0VlphSGZRTDV4OXZy?=
 =?utf-8?B?R3pRWDZYUzJpWkRicFA4cytHT3psV0FJTHFjY2NDMXV0YnFCRlhaMkJGUzhI?=
 =?utf-8?B?U1pKYmx6ck9ycFpHNmFHV0E3YitYdG0weEZLR3daU09WZ3krRm5nWiswQkhs?=
 =?utf-8?B?NnpvdHVpaGZTV1J4RVVxRjAwM1VQMjVmVnpyclJQN0RjS2Q2ZzJ0cFVVYjAr?=
 =?utf-8?B?V2J1NEdkcXVjWWpRSENndzlBblQyK2hiUzl2REtvYTJjcGo3b2taYXBCaUVY?=
 =?utf-8?B?U3ZPRlFUYkF5b1FLbjg3bHp3a2dMaGdpVjZJaGFNZjhRMkJMSjBPUTBTU3By?=
 =?utf-8?B?blJuU09LUk5mMFNiQzdSemVocWo2Nzk0L2hPZmpONmo4TEJjOTZBZFhCUFQ1?=
 =?utf-8?B?TWJxZVE4ZEh3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?VU0xTGNCcDczZkRWZ2M2VExVVjJoTmEzNTl6bFBrMFNHT3Q2VCswM3UvclZu?=
 =?utf-8?B?Z1dCWndsQXpQZGZIcjBSVThDVlBSVDhHck5LbXMvcktzUFRCV2NFaWx1Qi8r?=
 =?utf-8?B?UHAzTys2VlRBVndaTkx0WkhxcFJXdXIyQ0RacS9YR3A4WjgrMVNESUFvemRR?=
 =?utf-8?B?L3pWcEZVYXloZ0Y5Y1pFUmFiZ1hyb0NiamM2T0VlYzVGVDZVSWNsVVgvTWo4?=
 =?utf-8?B?MmRxZ2J4MXBFU0xCUE5IeHlsRHF6enBnT0Q1SnV4YlExeTZkSkNoaWE3ZHh5?=
 =?utf-8?B?WVNtZ2c5L3B0VlRWY3lrZ2JZM1hTeGw0bzRheDlFbkxURGRNTW1hdUFCeEJs?=
 =?utf-8?B?Rzd5NEFBbmxKYlRqQnBoUWsvZGJEekZmR2xVK1JIVG5sTVd5ZE5QQWdEQis3?=
 =?utf-8?B?aGZUZ2tlUjlYb0NvTjhtSC9Wc2hObVRkZ05BMlpFVVljbXk5QUZ6a0tubHdS?=
 =?utf-8?B?L3ZVMHpoWEpYWUZUdldoZVBGanZVOUdnRFRpZkJ2Y2NmMG5Fd2tROWMzOUsz?=
 =?utf-8?B?UHQrZzRnUm10cGw4M1BRNWxDU3I0SjhJMTVFNHBhZVRHWGVsZmlkRnRJTmw0?=
 =?utf-8?B?T1ZOMHVmbVZURjZPMVJNZHRhNHUrSXJXU0wzd0NOV3hMVkVRczFqczBESEJj?=
 =?utf-8?B?Q1JtRnpkdUF1YzZ1RVFSZjRIdks3V1BzNkxkMUlCb1JlN3Jra0k5ZlFIYS9Q?=
 =?utf-8?B?YU5KRW40UTA5dGY1bWRIOStmVzljdXRUaHp6L0hwVldndlgySFRqbjhQbUg4?=
 =?utf-8?B?b1lDTmVwbkovSDd2VTRIdDZWekZsSm82U3NHUmhCd1JLWHYyU1lVS2Nvc1k1?=
 =?utf-8?B?MkliUStmTzNNeVc2bHRYT2Fvckw0aEVjK1ZJT0t2NTY2dzc2TTlsem1rMElo?=
 =?utf-8?B?dkwzV2xFSFdRdFJaQ3A0SjhWcFZPN3hBcEF2eGMrQXpGRkZ6UUduUFh4cHh4?=
 =?utf-8?B?QS9CRjRtcFhUUllWcWlpSjFTa0JMNHhzSE0wRGVTMndwTXJjMStGaFVNL2Z1?=
 =?utf-8?B?UlNBWUwrcnpxR010bjVwbjFidStqNVlRL2I1Y2NJNkpkbjMyWnZTSnV4ZWxP?=
 =?utf-8?B?Y1NLOVBZV2JSUWtkVUFaYWxnVGRDR2lzbWppZmpmWk0xQ2xWRHpmNEY3WDh1?=
 =?utf-8?B?OHpEWTNhcEVHRUhBdndtV2NzZkh3NTRMSEF6c0ZYRkswM083a3J3Q1h2SGlN?=
 =?utf-8?B?S0hMODd3Tzgvakl1ZUR3VmpwdVY2S3N4c2dCUC9WbHNDY21MalM0eWF5M0N1?=
 =?utf-8?B?aTF0WjIxNDBEYkNNUTA3eGZSUGNNazlqMmljWDZMNTVVTWl5YTEvVGNnb0RN?=
 =?utf-8?B?N1lvMzZCRWJlR0s4MFlqY0FXY3J4eFVGZEFMTkxOY09TK3o2UFRNaHZDQ0dn?=
 =?utf-8?B?YUU0elRkdFIrVXdaeWloS24xMVFyU3hKQUxBV21KREtrajM0bjB3aWpSbDV2?=
 =?utf-8?B?NU1uKzh4d0NZWStwQlRiM1RuUUg2dkxxRnpoRDZqQ01tQ1dVWHVxNlFWSmU1?=
 =?utf-8?B?M3lFS1RFdkZxM2dsUWJtU1hMTFJBam1tODMyREloSEluV2VRNUtPKzU2ZDdX?=
 =?utf-8?B?WUNDSU1GWlJHMEtEZnlKSUErOGpGNzI2MFRYSTdrSktHSUJtdXI0OXZIZXVX?=
 =?utf-8?B?WWJBVDRiVThvOFhSSlNYazRxRzIyeXc5M1lsWUJCbVFGdHMwYTBYRmdRTGFi?=
 =?utf-8?B?MWFmZXhzVDAwVzF6UCtPL1U5Q2Y1QzFpcHZXZ0JQME44UGRpUmZnaXV3elZj?=
 =?utf-8?B?d2oxQm5YbzB0NytxNi8zbU8rZ3F2Sy82OEJhd1p6bmVlWm53M3d0cTNGQ3NY?=
 =?utf-8?B?UUVMYWM2dVNvRm9JemkyK2RMR1Y0dzFib2ZJK3dzWmk5R1FaWUZiZWVqQTN4?=
 =?utf-8?B?U3A1VFpEaWFDd0lldFlQZXBCSmZhYURpcmFoWmpDRnFjb0RGODJHbTkrZEhV?=
 =?utf-8?B?OFl5VllGaktCdGs4bE4rOGx2aGNabzZPQjl5T1NrOFdoVHhDc1JxZlN1Y2pM?=
 =?utf-8?B?dFc0YkxPZXc1QTMzOXZ6S1ZSdXI4aGxoa2N1ZG94N2QzdzZaMHllMmlsaFZW?=
 =?utf-8?B?K0hMYnlCTzBTeW1CNUF0aExIZVhvWk9ScTZrK1VVZjcvWGNyZjJqQWhLSnFU?=
 =?utf-8?Q?+2GU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f3a77f-f459-4879-231c-08dd76e7e229
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:06.2193
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r1GisRr/EmJb/s+XpbEy0vMm7WHdp8TseKdDKOTNxMPJ0uP+6uEhgWIi+iwOWIQHpw/vbSzQksiKku6MNDyjGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Preserve clarity by removing the unused 'offset' field in struct mxc_isi_reg,
as it duplicates information already indicated by the mask and remains unused.

Improve readability by replacing hex value masks with the BIT() macro.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 25 +++++++++++-----------
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  1 -
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 1e79b1211b603..ecfc95882f903 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -3,6 +3,7 @@
  * Copyright 2019-2020 NXP
  */
 
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/errno.h>
@@ -247,24 +248,24 @@ static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
 
 /* For i.MX8QXP C0 and i.MX8MN ISI IER version */
 static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v1 = {
-	.oflw_y_buf_en = { .offset = 19, .mask = 0x80000  },
-	.oflw_u_buf_en = { .offset = 21, .mask = 0x200000 },
-	.oflw_v_buf_en = { .offset = 23, .mask = 0x800000 },
+	.oflw_y_buf_en = { .mask = BIT(19) },
+	.oflw_u_buf_en = { .mask = BIT(21) },
+	.oflw_v_buf_en = { .mask = BIT(23) },
 
-	.panic_y_buf_en = {.offset = 20, .mask = 0x100000  },
-	.panic_u_buf_en = {.offset = 22, .mask = 0x400000  },
-	.panic_v_buf_en = {.offset = 24, .mask = 0x1000000 },
+	.panic_y_buf_en = { .mask = BIT(20) },
+	.panic_u_buf_en = { .mask = BIT(22) },
+	.panic_v_buf_en = { .mask = BIT(24) },
 };
 
 /* For i.MX8MP ISI IER version */
 static const struct mxc_isi_ier_reg mxc_imx8_isi_ier_v2 = {
-	.oflw_y_buf_en = { .offset = 18, .mask = 0x40000  },
-	.oflw_u_buf_en = { .offset = 20, .mask = 0x100000 },
-	.oflw_v_buf_en = { .offset = 22, .mask = 0x400000 },
+	.oflw_y_buf_en = { .mask = BIT(18) },
+	.oflw_u_buf_en = { .mask = BIT(20) },
+	.oflw_v_buf_en = { .mask = BIT(22) },
 
-	.panic_y_buf_en = {.offset = 19, .mask = 0x80000  },
-	.panic_u_buf_en = {.offset = 21, .mask = 0x200000 },
-	.panic_v_buf_en = {.offset = 23, .mask = 0x800000 },
+	.panic_y_buf_en = { .mask = BIT(19) },
+	.panic_u_buf_en = { .mask = BIT(21) },
+	.panic_v_buf_en = { .mask = BIT(23) },
 };
 
 /* Panic will assert when the buffers are 50% full */
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 9c7fe9e5f941f..e7534a80af7b4 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -114,7 +114,6 @@ struct mxc_isi_buffer {
 };
 
 struct mxc_isi_reg {
-	u32 offset;
 	u32 mask;
 };
 

-- 
2.34.1


