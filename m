Return-Path: <linux-media+bounces-25957-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C89BEA2FB2C
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 22:00:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 653791655E5
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 21:00:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFE322331E;
	Mon, 10 Feb 2025 20:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HA1s93rW"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2063.outbound.protection.outlook.com [40.107.20.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03C1BDA89;
	Mon, 10 Feb 2025 20:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739221193; cv=fail; b=KsR14nvE2ewFIYkfb/kTh4zpsbKx+VTme9tJXtslVeCTq8aK99lpBU9xD+prYhn/QsaxFnMkSC9PKstv+0yT20mbdJsTDfgKWVSsHGSKMBeA/31/wr6sTiu0Vzt+aoSxhi07A/aReoJD4nEuQHyFZDNgyupYhtqlQoly/0ck+0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739221193; c=relaxed/simple;
	bh=CONQa124VmskpdCa2A4REE9scW3t5oyP7zDtr6jO7O8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=bz2WDgMo37iopqrY9gtFz6s5WaYk8mUKmw1JD+V59foh8vCkCSTlK1t3qPePFtcrm7sgTlJYfrYeMrDyModx/wU1CzR2ccGdskzrMgYHDkm5/cWL6GofXeKF5Sdwbdn7Mc7VkUJBvxJ25YpoKt1YfAm35BuRRIlvust2XDEtf3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HA1s93rW; arc=fail smtp.client-ip=40.107.20.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v7c4r+5UcEk3YKQ1CETjpFp8nT2NLs4bf/ArfsbNyzpF0dFbB5xu2AnDRb/aYnaXICgmYgYDQUHuCGVlIsxP6pV56SPrGCQLzEXw3o+JV28R0aqquwIQ7xkiCh0dZ3hHVFM/5fdC7f/5B6ETWWnRCnec3hwoNogL7vJ3QZFVtqHnjdnOIXiMW4MP6w/sPGwf4rYvH5UoFJu8x85rj9jmcRvwO0XLskMtupZIQpesfqoJnP7cAwXtWGc3mvq7d5sEU5Ju3JJYS/xOqBPyEdZL5O9fyBpCFrxFeJjXfOsa+vBkgfxDmHapZqiQ3OnDHDhj/4JdEcpQGQHWs/xrAcJ1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbO77N+c51B/E1M3CewNGUvGCki0Wz9YboStrv8pIA8=;
 b=O+DsOCeykusGuanAxTODMyKlbBbuCbmlDAyaWFT4xXkGk/r/qbCwkb0l5pIsI+c4/pMFBpP1SMalkrS6U1eQ7qIeS1ZqHcTdZq/ljJQivcbM/2K+MYjlzFo7OvvUcX7FJ31Svc//d7Byt0r+bldAoJ8ygFhWX5IKgxTdEPBb8VpIBql4rjgv/MY717dvvrGe/sD99lx73F54T5eFM0aWDhf4Ow9POjS1fnAnE/d5y/lj3n6M+nU9XgYabDwlCqqYuRuxZKGqyrMFHvPgubtSOuNWGB5MNwHDgJFLvQ/NK6wa4P+bTNxM1ht5nfSI5qFycVhYr51iYsS+OWy0vmXqcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbO77N+c51B/E1M3CewNGUvGCki0Wz9YboStrv8pIA8=;
 b=HA1s93rWaNoezeuoq64cHxUoYP6nqiKvs1vgLMXi5IczCn5gv3mSb86pxajPxNshTvxPqXqIoIxTjYOMkl61dweDtB15p/A38cml7MRdYr0epWHhgvb8Tgm1fHmRx/lAOVwvoKDAJtcesZS77R8c2H1QhmO/8epRygcjwXv53vDyMIqjvoJ35Z4IFgEqmB+1ZFwvCILN1O3UHRUKFW/IPrbJCHC622V3bil5GAY2v4Am3we3mr37EvYvET/FnBaZKz1YwOGSKeNg1oJQLHPlsZA2dOHrbBSKE20/60pDypZlYzBzMowIbmCS9rZOENTjuY/cz+8Bs5NsPq09zVdb2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBAPR04MB7462.eurprd04.prod.outlook.com (2603:10a6:10:1a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 20:59:46 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 20:59:46 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 00/12] media: imx8: add camera support
Date: Mon, 10 Feb 2025 15:59:19 -0500
Message-Id: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKdoqmcC/1XMywrCMBCF4VeRWRuZmaStdeV7iEhMU5tFLyYSK
 qXvblqE0uU58H8TBOudDXA5TOBtdMH1XRryeADT6O5lhavSBkbOkEiJ83scHka31mthSNdZocp
 KooJUDN7Wbly12z3txoVP778rHml5/46knRNJoJBUKmT9zDHX124cTqZvYVEibyVjti85lYUkL
 W1Vc6HUVs7z/AMC7hEs3gAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739221181; l=4188;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=CONQa124VmskpdCa2A4REE9scW3t5oyP7zDtr6jO7O8=;
 b=rDo1dkAzaQC9AFSnoRLwIj/WXHw2zPmjxnRlm48E85XyToaK6u3jm/QzioXNaaIWi30AHCle4
 motCWZI/BnfBya+PmjrbLOJ/5MrGfD/T4Iqik1gNJjJsPsBx/yUNoOa
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBAPR04MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 39f383dd-a1c1-4c8c-86b2-08dd4a15d9ea
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|7053199007|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?L1Y3bFIwRDJ0VTlrblBYM2tqVGh2bXlaK2ExejdHd3JNRDdNQ3duczRTcUhE?=
 =?utf-8?B?NndDY1I0ODZNTEZUZG54aGRMaUs2N0lGblY0VFNOZlAyeHRsWVZBZUs5TGpM?=
 =?utf-8?B?UFpVWHBoaWJvSzJrazNNOVBwUGFyeDArWGtIc1lwZE90NC8rNDlOYnR2YVlm?=
 =?utf-8?B?L291dkRkeDZxZVA1K0RoejZ0ZTdIWjR0T2E1cnJvcFdNMW9ITWJPUjlSVDU4?=
 =?utf-8?B?U3pNVCtGTkZPQmVyNFhGTVdwZy9XUktpVUZucHpMSE1JVTZ0M3ppSUxHSTNV?=
 =?utf-8?B?YmUxMlUxRy96UklSMXZZbVJZTUo1SEpJNGZ2WmoxVVhIRTd6eWI2dHJXUlRK?=
 =?utf-8?B?QjA2WEVtc2lTUHRCbDlGNHFIRU1HamJBdTVxSkhya2dqU2ZHdFhKbnRLMTBj?=
 =?utf-8?B?bEl1K09pUHBmVGNyeG9GT2ZWVzRPWi93ekpPa2gvZGVoVEpBNkdzOEJVMXBQ?=
 =?utf-8?B?TkhvcXBIc1FDVGM1dVhjbzNUSDJ2SlBONStkbFNxNzJSelZDM1NGcGRDSW1U?=
 =?utf-8?B?VlFtZ1R5MHlMNU1zbVVaak5SZjV1aUF0TW1sQXJwUXMzYUlZbzJ4QVJka1cz?=
 =?utf-8?B?MEo5Mk1MbXlxWHo4djR3MzhENmV4a3V0RnlVSWNsTnY2MGYxT1gxUmNmK2R3?=
 =?utf-8?B?UlpJUmlJak5aUTZmQS9oYkZaeFY3STh3Z0ZObUpDRjV1dm5PanlJcHN0RzQr?=
 =?utf-8?B?RWVIQnh6YXRZbnlJdzhFMVF6Y2lna1ZSYVVud2prb1FISkMzdkgwbkYvN3pi?=
 =?utf-8?B?WUNNN2JLSEwwN0dFN3A5U0kwcnZRRENEd0k2VmNRcUZPZVZHNlZqWW0vTjly?=
 =?utf-8?B?dkViNHMrRXR0L1RGSVRkaW9hUWhCL0g4RUNhdVltVTdyV0Z6OXZhME1aWFhQ?=
 =?utf-8?B?UGpvcGFaNFJpSGQyaFhYZGVCNFVTd3pHVTZycDRFcWxnK1JucEZqS0R3NVYv?=
 =?utf-8?B?cFNtTXRkYXNsSzFlc3Z3MGJEYVVRL3lWNi9NVDJPdTl4VFFSZTQxamNicTdZ?=
 =?utf-8?B?c2U3SW1wMHF5SEx5Q0hmUHlIOXNJeXN0RzJMT0owTndYbVQvcitQQlRyVFhW?=
 =?utf-8?B?SFhpMCttMFpJeFdOTUwrR1R3My9qSlVoMjZwNUZzWGduZTQxUk5jeHAwSEU0?=
 =?utf-8?B?TmtnTVIzWUpEdFc5dk40dndpWlRLcnFUOXBEKzZGaDBkdEJjVjlub3d3MktC?=
 =?utf-8?B?V0JqQVFsdGFMbWVNTGxWVzJsdGJkUmh6SGpDQjE3dmt1MlJnWjQ1TWJmVnlH?=
 =?utf-8?B?YWFDZlhjcnM2SU1mOWEzOGplVExGa3hMSG93T1h4Zkx6bHErWXkrU3N0M3pS?=
 =?utf-8?B?eUQ0WUx3bXpYWmMvU0ZlL0JYcVJGUE1IbUNmOXNPdEx2WXVMVkNnVmUzbmpj?=
 =?utf-8?B?Zm5kZ2FJK0YzQU9SL0t3WTRuY0VTdXorOHZmM3IvSkZtMkxnWlk1MTV1dUs4?=
 =?utf-8?B?NUQ4bTQwZTlldHoxZlRRdWI1RWk4THREdmxCdlFXYW9oSktVbDZTMmdEOUUv?=
 =?utf-8?B?SVBIQkhCLzhkb1Zxa0dTeS8vaTljbnNtR0JSdTl4aGJYTTV0ZExGVmVOcHdV?=
 =?utf-8?B?bHBUY1Z2ME03WEJoWEIwQkZCRWZXazhJUzF4U0JJakg1L3N6R2ppTzVtdWY4?=
 =?utf-8?B?ZFFLajNFeTh0MlBGVGlobDE3OWRRV0dEaGx2L1JMekZxdGd2MXRjSXJtcGhj?=
 =?utf-8?B?aVN6VE4yT2IxdUovTjVoRk5ub2EyYnZaOGJ2eDNnSWJNS21SYkIyaVJ6VW9Z?=
 =?utf-8?B?em5NOWt6OGk4VnhubXI0aDU3aVlqbGlJT0pEWHc2aTRtYkg5ZGFEY05mNGJW?=
 =?utf-8?B?U3o4c3hCSTRleGo0SVhlb01oUTRUNVpLUElrYU13ektvVk1uVDl2dmEwOCtW?=
 =?utf-8?B?Z0NTRlZWOTlwYlhOTHJYaCtpcWFXS3c1ZHR1UFVEdVZNTTl3U0RhWDk5bFk1?=
 =?utf-8?B?Skk3RHpFRVN4a2hYZlQvREFMN2lZeThMSElZdGtEdThCaldGWFVFeXN3VlUz?=
 =?utf-8?B?U0Myc2x6c2p3PT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(7053199007)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UTJKYVpLU3l5ZUJObllLYUE2TExFK1JsZ1gxV2gxVXQ5TFVuNHpRRjIzbnU3?=
 =?utf-8?B?MldTVVIwQWo3NjdOd3pCdHhkbGwwcXJ3dGxMSXNOeWdSYTlSN0RIR0VsdG94?=
 =?utf-8?B?dm5md2EvbkpTd1MwZnhWTlRiYUNjQ0g3TFZqeHJvVEUzOG5qSzZ3dHdIc2Zq?=
 =?utf-8?B?ZzJ4ajQ4SUE1ZWJjdVlzQ3RNT2NQNFV0aWlJdHMxc1NUYkZsbmo2NjJhYVRZ?=
 =?utf-8?B?K0EvRXFRM2luSFB1ekNRVVF6N0RyMnBpM2htRHNLbWpuM3pqZWZjSUV4ejBn?=
 =?utf-8?B?ZW1XQWhKT3JENHd3MFU1S0JSY0hSdDFQQ0pqMnZSUFJVeTZZQUVGYWdTSXdi?=
 =?utf-8?B?dW41NjdYVjNLQWdNZU1wTnJ0U3kwSnRrNHN2aThBY1cxQVRCclk4NFlJOUls?=
 =?utf-8?B?ZmxlSENiNlRFZ1RLNG9YRmc4SmpWcUR4Z2dldjg2TmxXNVVRWVp2empqNlpB?=
 =?utf-8?B?TlIycHJRZG1SVlFROVVJTEZ0RFVFM3gxZTBNYlpIQ2FEUzlxQUV5aU5EUzNF?=
 =?utf-8?B?aDZ4enljanFQbi8zZnZPYjdxQnpRTExYZkhETExoQVN2Mzkva0k4TWdudUhu?=
 =?utf-8?B?K1FIcUFiS2t1L1lYYkx3WXBkdk92VEtTWXB5Y3ljRUdLaERBUlVVUUwwSjFB?=
 =?utf-8?B?NmlOdCtQMkRGaFBZQ0hPQjZnSnhKR2llSzFwM25CTzZ0WitBR2Z5WEladmho?=
 =?utf-8?B?VUJjczhLelJFUm5oZEcycG5aUG9Bd3dGVnFXYUlSb0plbU8rK0hubUdGbUEv?=
 =?utf-8?B?U0plYTVpVXZMbnBhMDV3MEN0aDFlRE92VVBTbWdMZ25vWDczTXlUTEpGR3pS?=
 =?utf-8?B?TTkyRHlGT3g4d3JKOE83MlNxQ1B5TFB4ejRoMGxkZ0VycDZBcG5vVkdWc2NB?=
 =?utf-8?B?aHVtbDlmZkxhZDJPS2dEbTlTbkVUMHMvVmhFUmNrQklCVFZKbTVNa01IR0wy?=
 =?utf-8?B?UkozQWt1N3EvQUx5bk5HVGI5N01PcmxmWWQ3U2gwOHJJZWYyem9kb3hUSnR4?=
 =?utf-8?B?Uy85Yy9OUUVsa0pBVXhXckFOemdkaEhhNEtNK291M0xmblYzcUcyYy9ab3Q4?=
 =?utf-8?B?OWlWMmtLS015SVdVUDhNZkk5MFNZSFdMWXdQNmRZK1NlbXZFVFJuazhxRTVM?=
 =?utf-8?B?c2F5Ykd6TWlYd0ZFc0JoUlJocFEwWW53ZUV1STUrTi92N0l6bXErUlNBUjA5?=
 =?utf-8?B?UW8rT1NtL2hrKytFU0tkWFAyNWF2a0F5OEVQRDFHclNQVVdIam95eW95WDl5?=
 =?utf-8?B?NDAwQXRSRXV2bWQ2U3VKSEFFdkJsUkdUb2t0azhRV2ZxbDBTYVVERDRrcnFa?=
 =?utf-8?B?Z1dVS2swdXFpbDZhV1A5ektWa3JjdlRiY3FOMm1Ia2pYRTF5WXk0K1FWWklZ?=
 =?utf-8?B?SHJseDBLc0Zkd1F1cWg5NStzRlRqUzdmLzFxbmFkcllRcEJ4YU9Xbm9wNzMy?=
 =?utf-8?B?T2lwczlQUEQ2d0FiVVNscUErK0o1Y2RSand0UGcrc2pwZSs5dTFodkt1N2d1?=
 =?utf-8?B?Q0V2VkRDWktMWitWVWtrVElGaHpwS0h0MXo1Z25xWU4rK2VGNndFRENrSExH?=
 =?utf-8?B?UTZoaEltYUZqQXNNMitPc2dkSmRsdzdBSlRUQUx0cGhpU1ZCRFdYeHkyN3pQ?=
 =?utf-8?B?UUpxeDFtVUtjdjBYMVVKV1diaTJEdktKYUd0RmVNeEZvSVFyRjZkMURCcEdW?=
 =?utf-8?B?SHNRZ2l6UHRmVTFZa2l4YU1QWnZFY2l4bUtJMzZhMkN5RGtYZHJ5QXRzU3Jw?=
 =?utf-8?B?MDRsRndVMHNXYUxYV0lXYnRISXhsdGU4M2dHWnVtNFpOTWtjekVPbW5GdUtm?=
 =?utf-8?B?WGZ5ZGx5NHRGRzI2R0lKWWs0QVdUZlBOdmtFVCtGd1U5U1hwOWZ0aTgwNnlB?=
 =?utf-8?B?VjJSd2poSSt5SWtZeUJwWXFFUWlqelpseHhEUThSbkRBeFJRWkhrR0U4MHd1?=
 =?utf-8?B?SkJtV1dDWjJ5K2c2YVRhUUpZNGNLaFZ2LzlndDVVbldWWFpib3BSLythbWZh?=
 =?utf-8?B?Y1ZsanU2WEN0cmtlOWJ6R0J0dEdOT1FZbUdpbFFUOEE4V2xIQjFPU2V6Z0Fj?=
 =?utf-8?B?VHMvTVZLVFdwZ0VzRFQycmZSQ1FtU1RjZ004UkV1aCtYRVA5a1JJVGFrdUlu?=
 =?utf-8?Q?3XkI=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39f383dd-a1c1-4c8c-86b2-08dd4a15d9ea
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 20:59:46.8775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UnZ4LPi2Y89ywJMJj67siqFKpqOR+es1/EGMewpWwJZoBA21zK63F5TzANowk9gDaSVwWEnsMmu7/z4sUp+kUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7462

Add SCU reset driver for i.MX8QM/i.MX8QXP.
Update binding doc.
Update driver for imx8qxp and imx8qm.
Add dts files for it.

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
To: Martin Kepplinger <martink@posteo.de>
To: Purism Kernel Team <kernel@puri.sm>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-media@vger.kernel.org
Cc: Robert Chiras <robert.chiras@nxp.com>
Cc: "Guoniu.zhou" <guoniu.zhou@nxp.com>

Signed-off-by: Frank Li <Frank.Li@nxp.com>

Changes in v3:
- Remove phy driver parts.
- csr is dedicate for mipi csi2, so add it as second register space. csr is
mixed with PHY and link control with csi2.
- Link to v2: https://lore.kernel.org/r/20250205-8qxp_camera-v2-0-731a3edf2744@nxp.com

Changes in v2:
- move scu reset binding doc to top scu doc.
- isi use seperate binding doc for imx8qxp and imx8qm.
- phy and csi2, compatible string 8qm fallback to qxp
- remove internal review tags
- Link to v1: https://lore.kernel.org/r/20250131-8qxp_camera-v1-0-319402ab606a@nxp.com

---
Frank Li (9):
      dt-bindings: firmware: imx: add property reset-controller
      reset: imx: Add SCU reset driver for i.MX8QXP and i.MX8QM
      media: dt-bindings: Add binding doc for i.MX8QXP and i.MX8QM ISI
      media: nxp: imx8-isi: Allow num_sources to be greater than num_sink
      media: imx8mq-mipi-csi2: Add support for i.MX8QXP
      arm64: dts: imx8: add capture controller for i.MX8's img subsystem
      arm64: dts: imx8qm: add 24MHz clock-xtal24m
      arm64: dts: imx8q: add linux,cma node for imx8qm-mek and imx8qxp-mek
      arm64: dts: imx8q: add camera ov5640 support for imx8qm-mek and imx8qxp-mek

Guoniu.zhou (1):
      media: imx8mq-mipi-csi2: Add imx8mq_plat_data for different compatible strings

Robert Chiras (2):
      media: imx8-isi: Add support for i.MX8QM and i.MX8QXP
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Add i.MX8QM(QXP) compatible strings

 .../devicetree/bindings/firmware/fsl,scu.yaml      |  12 +
 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |  38 ++-
 MAINTAINERS                                        |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |  12 +
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi     | 376 +++++++++++++++++++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso |  90 +++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso |  90 +++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  60 ++++
 arch/arm64/boot/dts/freescale/imx8qm-ss-img.dtsi   |  45 +++
 arch/arm64/boot/dts/freescale/imx8qm.dtsi          |  12 +
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso |  89 +++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |  44 +++
 arch/arm64/boot/dts/freescale/imx8qxp-ss-img.dtsi  |  60 ++++
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi         |   5 +
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    |  47 +++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |   2 +
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      |   8 +-
 drivers/media/platform/nxp/imx8mq-mipi-csi2.c      | 179 +++++++++-
 drivers/reset/Kconfig                              |   7 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-imx-scu.c                      | 101 ++++++
 23 files changed, 1477 insertions(+), 22 deletions(-)
---
base-commit: ce37eebeae8fa9e6c53f7f1ccd182ad5f27d66cd
change-id: 20250114-8qxp_camera-c1af5749d304

Best regards,
---
Frank Li <Frank.Li@nxp.com>


