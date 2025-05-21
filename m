Return-Path: <linux-media+bounces-33049-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFBAABFC52
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 19:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 487F31BC3E31
	for <lists+linux-media@lfdr.de>; Wed, 21 May 2025 17:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF30289E19;
	Wed, 21 May 2025 17:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Okg49uD4"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2064.outbound.protection.outlook.com [40.107.21.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7911E3DED;
	Wed, 21 May 2025 17:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848890; cv=fail; b=DZstz8B2tpCDC0QGSJWsDYqRYn3l9JBtVxdq0PH4mQVfLB2lItBOL+gmtIrbi0iIoA7srThVdDK1xZq6ELwzdvgd5eqHePgx1F+21dvhp7IS2rcxLgA2eg6/H7bcDFYrPrbGsIybjn3snWJe1RNG8A5Pm35BRLh1QBhc+Z8mvbc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848890; c=relaxed/simple;
	bh=YkVjpUKwO1SmRSIm0398Lh2aC1T8GxauuIAIUb6vsaw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=cLpKMlbCwugX86T+GQCq81Nd9a8BzWjYWljc04KZ0xBzDAaSbOtJxusaIKa4nCOLc4V4prcJJ8UyT+Qe30cfHPbuL/0un3Hq13Mkhz5RtaVjKHLPnFQ/WQdTdjZG6sMlpP57xXLZs00vIUDHINecWVwDFXYzz0CjpFS0s48Gtls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Okg49uD4; arc=fail smtp.client-ip=40.107.21.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bcBUoDl3Ypb4CP7qBFRy+ISvEir3UJcUASvW584IXDY2/d78LWh0Q9YuYYRNUt97kF741tE26gETIlfNwRupKhan577TjDgxq/7Cj825k3DYo41kfT6f4FbPhNAx7bE/dMIPMq6gb9L6lnHgyCAhJGnOHmyTAHz71k4t+VoaVvjLZJiiB581bcDYobJCNVSPq8/dNCQQrYiMti6RyAHOYhQW9S+i+j1Yy64OuFnSAm4+klvDF+yzOeSoEu4Lfy/dk/eNfJh+M1NkwCfUkxXn8gvVRQcNLXl6zqRBrD+tSLzkACr2OPhIfP4WMCZdE1OZA6IkVdILbMYLUxwpPyNP8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhDXn0noAVkZOdZIr0Sb+ty0FyY15kmSIsHK3XgQ7wA=;
 b=RjmrqVQwQzgT5YR3wnMaFSwRhtLThwLEomdtbrBoopj3fYQ+UyxY2KU1er4Zo+vq23Q1IpheCRHBHBLsslLSigCGv7bc2EnjdhexcGczIYCboeQtRjLs5s6/TOgu66SIvhI2UrGDa46p5ooElQJVO5ZgHFMMOr6sfhtn4JLAtT7bveAnwSSHMjYDCHxjvdOMFMD1FZQTfQyxHdNRPszFcXfPqq7VhvDHIrRDOunEKr6UbZigMBxFSSTRwXhOtdFUDC+XwZYj+CHcZ/hxXac+YqFxzVhy82oxYKTfKhsxpopEBzgq4Zzr0/S2zqwbKDQAjTZiaHOLXWipGuB1f2YqFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhDXn0noAVkZOdZIr0Sb+ty0FyY15kmSIsHK3XgQ7wA=;
 b=Okg49uD4c5wj1mnVz03XiIZMoC/x7ltCi9ASoc2cXLQQWJ61Rz8J5EQUM9PacRcypHxppuxV/9CLD4DrdYiRoXJdhJ/WBeH+0tVRnXPCvbczckhanlExEguxQ0pzz323O5sgxw08V59i+m1YbfaAcAJe53f7ouKhQrXXYi8uNofIP4GHLo8ACot5aTbkeQGkR7AmCi9s5+2B++57v9CWZmbCm5sm0YpkjzSH/R3kKMZRsrkN/ZOCbSAUO9S4HsoL7xM3gwhuZmMrze4FY8nYou3uh16SWc8c2V1OUS3CJ+VkX8kjwroekk0UHFRdc0ka2n+cYRIWIiN4nCsaxlzbfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7389.eurprd04.prod.outlook.com (2603:10a6:800:1b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 17:34:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 17:34:44 +0000
From: Frank Li <Frank.Li@nxp.com>
To: mirela.rabulea@nxp.com,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ming.qian@nxp.com
Subject: [PATCH RESEND 0/2] media: nxp,imx8-jpeg: Add imx95 support
Date: Wed, 21 May 2025 13:34:02 -0400
Message-Id: <20250521-95_jpeg-v1-0-392de5d29672@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747847392; l=668; i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id; bh=YkVjpUKwO1SmRSIm0398Lh2aC1T8GxauuIAIUb6vsaw=; b=+LU+CoaU7xn04hkVY0qlQZfbAlSNwz9bAjHgKq1S38YgbOfFASRg3w+qhVXzuCCAfvnV6JnPI zRSRcPywPiQAoqRbEqOx9JPMEhXMPquRjgcl7bZEmZRJzdJ6n4hKACX
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519; pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 22854c9b-a1ca-4110-feeb-08dd988dc5f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGFzeUUzSWt2d2h6NmpWY01RU0J2K24zaFVBT3JTWDdTb28zcVhQcEx1NUlE?=
 =?utf-8?B?ZmpDY0dRVlByV1hvQ2U4M3lsSjJaenI2L1MrV2FuM0ZZQngzVURsemlzdUJi?=
 =?utf-8?B?MkZ1aEdWRUx3b1d5R2pyT3VYVTVkV1ExSjhlT0pMMjBLSGlvbnNzUkhlN1JN?=
 =?utf-8?B?NDVkUHdCcDFVRi9NV2tlNzR4YlNtR0RPWGJGZlZlZjI0M2xPYUhNQ1JjRm9i?=
 =?utf-8?B?QmFYN2pYWS9aekRTaHI4K1hLUGpjQy9td01zckNmUHBXZmNCa3VFN2QzTnEz?=
 =?utf-8?B?Q1N3ZEhqSE4xSzcrWjIzNzNXUWxYK2pINHBlSzZDR1h0clJyZUNzUWRzaUpP?=
 =?utf-8?B?WXltNHMvd1UxRFRtc0o2dGM3TG5tN3Rjd1RqVk1KSVJKZ2ttbkNZaVRidGV4?=
 =?utf-8?B?N1dyTnE0eC95MmV2OTcycmovSHdnV2IrMkYzZW1Nc0ZmemZqdVVhdGtuSFAz?=
 =?utf-8?B?bi9IaEtpREV2MjcrWGlKRy9YNXJXK0tqdWc4RHF3WVVHUFFqRHhoeG5SK1Bm?=
 =?utf-8?B?bnoveHdNV2VPT0E1OVZmUlk4WUY5TTFHRElleFBISjl4Yk9GZjBDV1NFUm8v?=
 =?utf-8?B?dEphK2RGMEpRMTFZMTFwdVNVem9sVy80b01QM3VNWHVtTmZHTWE3QWJGUHRp?=
 =?utf-8?B?ZmZUdEZXWGxlZXh5elNrdlkxVHhhQmZoRXI2WEZCRStZZ04wNFNJWDBVejNi?=
 =?utf-8?B?bVlHM2RRSnlxSUY0cERzZlJIeGV6bVV5YnVic2VDcVJkWDduUS9SZkdSNlNJ?=
 =?utf-8?B?Z2NmaTJSSFptcU4xcFJLZkk1L1pMV24zVzJZYVhMSVpWalk1bmJKWWwxTjVQ?=
 =?utf-8?B?NHlZalUwcDRXUmN1K0FqVUVCMUtGMDdPR2RoOU5PUHFXNjRGYkdjVjNiQ2Z2?=
 =?utf-8?B?elBFdVZYelRBbDBEWGxTb3BuY1ZFODZLck1paGg3VVZ0NjcycGtnR3pyTmoz?=
 =?utf-8?B?Um56bUFBem8vajE3ZWh3YjE5RmFqdVB4VFljOVd2dHBsSFhXK2tNT0ovSm9G?=
 =?utf-8?B?L3lUUkRjOEs1NkNwZEw3Rm45VU03Zk9aUVRIMHZ0aW4wSlJWaHRvSVErUVZF?=
 =?utf-8?B?K1A1YzRGRmkxeXVBMEJHRzI1Uk5YcSt6Znp0Sndqc2dlSUU3Tm15b0RsenRT?=
 =?utf-8?B?UWM0MWFRdExZZ2NlVWFwUHZQZ1p1a1diQmhma1QvSEU0S1JBZGRVOHNwQ1or?=
 =?utf-8?B?WCtPdVozTGcxY0xGSFU5K216blhaNG1EVkc3eVNuaFJkd3h5YmJCNkJBbnV3?=
 =?utf-8?B?V0JBak0vek1KeXhkYUVCWXFmTTMyL3Bkak9LVlJCKzRxMit0dFZQalc2dVBk?=
 =?utf-8?B?Ky9SeWFjR2tYR0tOVDNCeERsbTd1QTFRdWxFS0QzV1RvYzJaOEg3aGliQmdr?=
 =?utf-8?B?L1dvRkRETXRORzFTT2pWQjFsTGNHYXRnSmRld2NxUGVQZWF2Q1pGL2ZRU1Zs?=
 =?utf-8?B?QkxKaDBkZnAxRlNUZ3IxMUNnL1lBdkdzUGx4R216U3h6cHVRTkhDQ2hjWG5W?=
 =?utf-8?B?bU5xelFTRE5LbUwzNWt0S1NtTWU5Z3FTbHlmM1A3bVcyRS9xdlZacE4rd3pl?=
 =?utf-8?B?RjJ1aTVVcFc0QUlNN2QxWExZc3RCUkw0dzJxNng1NVNEUklIOWF3eW5ZSGJU?=
 =?utf-8?B?QlRibHZaVTBGS0VGVmp0NDV6ZFJYL1RsaURDQyt1N0JweE1hUGFSMUJxMERW?=
 =?utf-8?B?NmQrWGFUTkpaS3ZuK3JaVUlKN3FTcURUOGU2d2ZtbFZhU2hoalhVQkZESWtl?=
 =?utf-8?B?S2QyOWFUazlqMno1SStjWUtzelNxZkQvd0pVbks1ZGh5aFRHeUh4UU1YcGhL?=
 =?utf-8?B?WDRLcGU0M2xHMlFCd0ZQeU5pNTdleGNJQUhtYXM0UTdtZ2paYnRCdFVrWUFY?=
 =?utf-8?B?Ymw2ZFgwUzVnazg4TGU0aGZlMFN0SlNZVzFkKzJpdlREK2creEk1Mmw2QVlW?=
 =?utf-8?B?eXhTWnZicUlJeFJqN1oyWDlJVVY1SS9NeWJmMGxSVFgzNis5QlJVY254WjVW?=
 =?utf-8?B?L3RzbDFYVjBRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3pyU0Y5eWN5Y1lobG9hcGlJa095ZUdyMDVZQVVFK1QyMGxZVFUxRTBPTlpr?=
 =?utf-8?B?UnJyM0MzSmMvZ1N4TG16MmQ2bnkxNTNDOFgyWW91bkNhQ096YjhhcXBXZ3gx?=
 =?utf-8?B?MmNYbGdWNmFjcFFUQ1lidERHU2ttTzJFbENMUVVJWmtwQ2h1YkRnNmNqY2FV?=
 =?utf-8?B?ZmdLVTJIWVQ1cUhTY1JXbkJocmJ0OU9YRWRNZHRxdG1RdW9oWVQ2bGZ2SVh6?=
 =?utf-8?B?dHFzTWN2V05WZkgvZXdLZXZUZlZrV1htbGFlT1FOZXFKY0oxMGZZODhYUm8w?=
 =?utf-8?B?ZXlTRWlTUitHVmNzT2NhSlg4MjU3cnVqSjhaSTUvME82WlVOZU9tWjBJMWdt?=
 =?utf-8?B?QlNZZjAyVlAxclBDKzBERHpraGhpNjRWZTJJMjZURzZGdHhSYVNVRmpMajBs?=
 =?utf-8?B?SmlvdjVQSkM4VEx1djJQaEdqcmlhMmJUR1BaMXVReGsrRGlHMUl2TW1xcjJz?=
 =?utf-8?B?aWpUU3BtalRHWmJFcUYyNGVQVWozc1A3amdEZ1JuQmhTZmdid21ydzg1Tktk?=
 =?utf-8?B?eTdoMUFDbjJ4S2lVR05OOEU1bG5sQWFKTU9vT1ZHaVF6WDJySXE5WGpIU0Uw?=
 =?utf-8?B?U2cwc3AvRXZXaEJtWlZ4LzhQZmsxREVFUVJZZ1dDQlBMQlhiRjlzaGZXYThE?=
 =?utf-8?B?MktSdHRmZHNDTVM4eE5TZThFK0ZGOGZFaG1jU0w5YlhhTFB6VHBpcGtrbXM0?=
 =?utf-8?B?UnhHZVNWVjBYc2Z0bEFhUnNUc0FOVzFkSWYzaE9QUXdFVFBZbTYzMW1PQ0hj?=
 =?utf-8?B?aXIzamJSZFd5blVzZ3lXRmRFVWNSc3k4aG04eGozVjFkeTQzdm01U001Uytq?=
 =?utf-8?B?NXVNaDBMM08yVTFOZGRpOGhMVFFyZFJsWWcrU0NYSzl5T0FkTlltOXVmdDlx?=
 =?utf-8?B?L0hvekFHWVdBQjZDWitLaUpVbmhEOEpCeWxMWUpHdkhNOHBCTkc4QUZXaEZ4?=
 =?utf-8?B?S0FCUEhma2c3QnMvamk1dHdCMU9hL2dXZzBqNVRiRjBaUGkyRG16WXdpQ0N5?=
 =?utf-8?B?MUZjYVJGZGhkRGtTRFFOZXhGYy9TS0ZYZkxsUVYxZ2JBY05xYVl6TmNOZWVi?=
 =?utf-8?B?aDM5T1kzVlM4SmdJTlRZRXVpNGFMYjdVeUpUczlRcGY0ZnJCSDFyVVVGQ2l3?=
 =?utf-8?B?c0IwWTh6QUVlcWd3VUtVYlpLMnhGTFZhbWJtTXlnbGhHSVBwM1M2dEFycmJm?=
 =?utf-8?B?WlhiUkx4UFo3eHBPM1BBaXdnSUc0V3oxNk1HZVNtVy9zeEdkUHA0SGZwMUxN?=
 =?utf-8?B?NjZFT1d1NlczUUlaQkVZQjI1OE9OSElYRUxJRWxiZWdFTGpmUnVmdW1OS0x0?=
 =?utf-8?B?TGs2MnN2NkZpRm9XZlFZWHZsQU1QSzcyR0FReThoTU9YTmRtckc1N3ZrNWs5?=
 =?utf-8?B?T290aUxvQlRlbGFURjZKYzFBWlRFMXdYc3RlZHZLZXIzWWxqV01KSEdDS1Fn?=
 =?utf-8?B?UFpONit3MkhSZ0pwQTNpc0VONktsdi9XMnpQTkplSnprVU9kMi9hb0pLSmFH?=
 =?utf-8?B?VENtTHVRV0Nudlp5bFFhVGMrWUZiTWR4NC90N2NQWjJYQ1RsdlpBTlRENE45?=
 =?utf-8?B?dlB4NFJyTVRzMjFQRlFIVGJURmtudkFNNno4a0lPL1BNeVFTOVRlUzdJNW41?=
 =?utf-8?B?bUl4ZEMzdHZuVDhuOHZ1eURlaDFRQTFIU1lzMWU1UEVTa0dLL2JJU2dkdjlQ?=
 =?utf-8?B?OFJXaEFPVk81QzVjVDJTL3E0Tlp0SExyWUVHbEZtdVZpK29IL2lRQkRkUkpw?=
 =?utf-8?B?dS9EUHZHSTIzQkFZT1dxZDFBaEt6dHRhZWRqa3N0T0lzbnpQLzFPclo2dFJE?=
 =?utf-8?B?dTI2TFIvNHJDcmVhaFA4RllnK28xUzhFb0dwT3N2UG5nQUN3K2lFbjhEVW82?=
 =?utf-8?B?RDlXam42ckd2ODZsUUlaa2pBTUFTQXJNSjJhRlp0YTVCMXBXQ0RpYy95LzBk?=
 =?utf-8?B?UWZqS21ndXFXUWZPVXFZVEhNeGFCcUFtNUp3eGtCb29ZbjFjTk9kc2VIbnVH?=
 =?utf-8?B?ZmVNREdScVRhUVFDU3IyT1krcURxcis5VENKOVhoRmsyQmlTVFBseHNaaUJZ?=
 =?utf-8?B?NG5VemxOZUlpbGZsUC9kVEFERTlGZndXbnVXanZ3ZXR6Q21LMkhXaTc0MkpP?=
 =?utf-8?Q?6pSGcUU7j0bpRTvte/skHC4Tj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22854c9b-a1ca-4110-feeb-08dd988dc5f1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 17:34:43.9687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxJ7xOGnoZ7tc5606Cnqp1JtUYsmih68gCro1aWJ47ugAkqooN+wBKSpbqgIm4rLUBKRacEeNYOrwrMLHpxg/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7389

Update binding doc for imx95 support.
Update dts to support imx95

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (2):
      media: dt-bindings: nxp,imx8-jpeg: Add compatible strings for IMX95 JPEG
      arm64: dts: imx95: add jpeg encode and decode nodes

 .../devicetree/bindings/media/nxp,imx8-jpeg.yaml   | 28 ++++++++++++--
 arch/arm64/boot/dts/freescale/imx95.dtsi           | 44 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 3 deletions(-)
---
base-commit: f3df6ce76ecb8eb47f0d3198ab4b81df31217fa7
change-id: 20250221-95_jpeg-a4924523fff2

Best regards,
---
Frank Li <Frank.Li@nxp.com>
-- 
Frank Li <Frank.Li@nxp.com>


