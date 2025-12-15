Return-Path: <linux-media+bounces-48829-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4315FCC0216
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 23:50:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E809301A711
	for <lists+linux-media@lfdr.de>; Mon, 15 Dec 2025 22:50:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA5C31AF25;
	Mon, 15 Dec 2025 22:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Q6SiTCzs"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E81327207;
	Mon, 15 Dec 2025 22:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765839027; cv=fail; b=r6pCnisRV6CE48IAUqIc2pz2RSn5O5+P0bMn4lrfbMaINJ50M/S5yjFuQPrSMwPtGdysHMcvW+poOvE/US/jjlMrKAijZGVMAhYgPEnW/8tdmcoosnQJi1+aEO+siw1C5WQtD9aVI/qtuIuobJ8VsSEhHrwtG0UMSDSujGB2M38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765839027; c=relaxed/simple;
	bh=yPwnUBOev/x/308wqg/c0rNtCFlwwv3fG4kMS/h4VvQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ij7XkaQ2exUfBHWyB1xlWSHlSOit8O2kKhejhWNSAIZsE+N1GnCzBsl0x9FoYMVnLEXWmmFpwfoIlRpHY5mLqrKLJfJkio3cpkpfooZqWr++J24O89vjAFAk7+8GY1w+r9hSBMiEBpMKqX1JJ2KMT+55bbxUYI8BxNBU/T0i7cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Q6SiTCzs; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juOrX+rvi84BOIYkofAI5/ptuHGo5+3u07DucBwjhYivxLw2Da3teVwJMMklUdhwgirmwgtEb2MEshtbXqp/xneunh3fGnldArVKB7ReCvQVjVFZ8S94Gliq19WxeTaBf40jGCrzeWnF8TVYOFeoZxcARr+iJwWn+CQXMqVESBQ3ugn5NM3Mq+afenGtyq1OB4GlEXSI95gS611BPQjSsHtHBkx9gKvXHb5w4xwhXqpTzNsAWa+KQZmLfh6srUXOKm+K55NcfjNd4rCwhfNhMAKMzA73RV7RwFuGmIm2IVFPr2INaN47tqHNZH3Cv9pGUwmPi/I+jUFqNSw4mtsaNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzPs5H92nXDeok0MjXa/DcPz5kXR2XdL8jcuKSirt3E=;
 b=AbL/zZsQ4yGf9f7MV+wAh3WmIIfdv8PVmWfjad5s34jnQMwSc7ojQinIo/aiZ4MsrqYJhBbeJOTx4YGmTxAgo6+t+r3LaugLW36ual1Q2aWTTEqwyg2hboGKblB09sBKxghFLt96EW/mOAHpqdNWBCFiYqgEJcdxkaeyTpkyU1C8G0HiOBcYwA1dxkm7rW+xsLHPmv2PWjsItMp/9ZxYzFkmOCWmgZ5DBlAOaOuuMlcXLkQYdZniURTd0A1Bwu5SVJzkyza9He89G2E6+nl+0jBqn09y6gbD98ufl+ewzJRluJ5wM382Hi4upa/pLULkJK1o4yXOvDynlc9tbpIbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzPs5H92nXDeok0MjXa/DcPz5kXR2XdL8jcuKSirt3E=;
 b=Q6SiTCzschE2nlpQ7e/Tier3YZRG09GSSI6Ga79IXYufL/8td+fIo5fU4GXtv9HWDdT0PcurJtcPwugf4Y+r2LMqLwomJ/Lk3HgYLFvNnht9uKGEMo/CqT96esiL4zWwTEflHuLKkmSsHZbI9ITkkIO649hEt+XnB+5iTxC7dibhRXnlPCntxS5JqifrLVhIIThQk5gGWnDEuVd/j4F+A3JeH5TEx8bE+u4XqOceW8SdU+HrOawG8BR3Dk60NxPLPQSFZZ4eyq9m5/fRsYu5/mxlsX+Ai0cUwy7JwnNsXJ2YytVypXS+DMDVRQsEFR+MeLX3A6TFV1HFNNsUxhFAOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA1PR04MB10794.eurprd04.prod.outlook.com (2603:10a6:102:482::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 22:50:22 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 22:50:22 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 15 Dec 2025 17:49:54 -0500
Subject: [PATCH v3 3/5] media: nxp: imx8-isi: use devm_pm_runtime_enable()
 to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-cam_cleanup-v3-3-a61995068f38@nxp.com>
References: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
In-Reply-To: <20251215-cam_cleanup-v3-0-a61995068f38@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Purism Kernel Team <kernel@puri.sm>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765839009; l=1806;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=yPwnUBOev/x/308wqg/c0rNtCFlwwv3fG4kMS/h4VvQ=;
 b=Tgd+U6JGS18KsxvCWCId9Oz8TGU0v0paDnSW3Yzas8uywhIj2gPwFrPk2xh/T4Mr4I++ocgnW
 6NPENyx2+ywBhXfEb873TCJ7BifWyJ0zH/7fCApiY/RVSMhJsxJpw7r
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:510:23c::8) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA1PR04MB10794:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd12951-152f-4dfa-dfe0-08de3c2c542f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|7416014|366016|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?KzJVelJWcjBWd2pzK0xNNzdTMDJkejNBNUc5R3dDcDVpK0JjTUxQeUNhRXRM?=
 =?utf-8?B?SXF0cmpRL1l6NXdFYW54WFJpTFVKRjZVVDl2a0hoZkxIRkZTalJsNnZiVSto?=
 =?utf-8?B?ZWJhWW5JdkFCbzY2RGFhUlFVWjlZd2I0NXhaQVdidnpuOWVYb2RvZDJSd3pN?=
 =?utf-8?B?M0JQZnNva0E5aUgzUDBXU1lCVlVvWkh4UitiVVZOZDQ4VnJqWlBLbWFCRytF?=
 =?utf-8?B?WDB0UTR4TWRRQXVXT3hPOVhpbit6d1MvUlhPbGFIOUNnZHgwaGppM3ZFWmsx?=
 =?utf-8?B?TDZVVS9EOVduU3BubVNRUGFxOU1kd1ZENUFRbHdQemdVbURTU2F3UEMvOWs3?=
 =?utf-8?B?bDFhT0d2R296M0Y3ZDhsOXdUU29RaFBGNlo3N1hoZ1JMWXBDTktmRnIrS2Vy?=
 =?utf-8?B?dm80SGNNNm53d3lSK1F6akQ3dkx2aEhFUXVlTnNaWXN3ak9hV1pwclVHWVVx?=
 =?utf-8?B?Y1UzL1kzLytZaHRHeHdCNzllYkdHVHFiYXhVUG5xZDVtNEFjbUxEU2NiSmdC?=
 =?utf-8?B?RVRKQnZBK3pYUW5xWnl1MnQ3eExvQ1I4dWdBaVlvMXBteXc4U0dPTHVKUjhq?=
 =?utf-8?B?OWlyUll4QndObnU0VDAxTXJJdzBkNmp4UmZXUld4MFd5SS92UzFWWWlzS1A0?=
 =?utf-8?B?V296UjhqQzlQZkxid255dzZYU1MralVnQTNnL2MxT29UNkRUdXhyYXIwQTgv?=
 =?utf-8?B?TEVaU3NTRWMzNzVsQ2dIVWlXL2VBM0ZMcXNRQmN6WUlBOFJsNDRjUjBockx5?=
 =?utf-8?B?RjBUS0p1WWQxRDBtK3p1MmlYSXU0dzRGYnJzUjAwQTBLN0ErbmJhNFlEMVYv?=
 =?utf-8?B?Qm1wOWMyYVMvYkRSWURWNjBpQ3Vod2FYb3lJUXdwMCtoMHdpMVBCYmlMSjJN?=
 =?utf-8?B?cUFrYlFPWldkdzJ3YklWWmR6bGIrbm1YTk5BM1Vzd09DUlNuNURidlpWV1ZQ?=
 =?utf-8?B?VUg5dklKVWZ6QkdQWm82ellhb1hHTVJRcWF0aXVmSmJRZUNMbjQybFhHN1kz?=
 =?utf-8?B?TnpjbXRkY1FPamVZaUtKTEJNTDcxOExONUhaOVZoS0hrVGRLbG1ON2pMTkJC?=
 =?utf-8?B?eVZFRi8zdGpNWnhUUVFTODNibzBhMmtjYVF3Sk10TU9iRlN4OUNBV09BcTg3?=
 =?utf-8?B?ZTZ3eTViS09XdVEyNmZLRXBXWlY4MWxXcjF2b3RFbW1DcmlBYkxIOUJXdTRJ?=
 =?utf-8?B?VjlYZmh2a01SdGlWZFdiZC9oc0kzdzg1K2FWSk1EckQvYzNJNmFma0h5eVNm?=
 =?utf-8?B?cTFranlSYjVqTElabXpHRzlvRzVCMXhMUUJ3OVE2cWtJTzNWbUEybVZ1TS9Q?=
 =?utf-8?B?RFZRc1VCUk9KeDYyNy9YdS9mQVR2dk5wSVZ3Um02OGNjSmI4cE52cE9McUN6?=
 =?utf-8?B?aTRqYWNqSHIwUlZsRTY0eklONkMwb2h6Z0U1M210NElEanFFSnpYSEpweSsz?=
 =?utf-8?B?OXlQajdLZWc5KzdIQmV3djRuU01SK2dYNEJxcjU4WVk3MVBrS1p3TnpOdEdE?=
 =?utf-8?B?TkNjUElTS0ZXd2RYTUpjTmM3aGhrMEROMWt2QmFIZ3NGb29GWUlpV0QvZnRZ?=
 =?utf-8?B?SlFRWExmS1BSWXFZTHZoRlI4NkRiRnpIOFJ5YXlSL3p6K3daWEtGeGJKaS9B?=
 =?utf-8?B?enhuUmNGa2xPYlZhVG5jUWRkMVM4NzhLcHlnRUJjemdCM0ZBYjBQbjhtcjVQ?=
 =?utf-8?B?WVRWM29VZVViN2pPc2hHd0tqUXhDNEFUaFlFN1c3U0p3ZWFLR08xSkN2NGFN?=
 =?utf-8?B?OUpTK0wyQlRGS1l0bEQyWXBFRDNvb3BCOU5hWnBuWmNSR1NvSjkvSlFVY2dX?=
 =?utf-8?B?blNUUlNrTENhaEJGcTZVdDFXLytCSDl2dVdQYTh6L2lEZW9POWpHR0lwWTNO?=
 =?utf-8?B?Mm81MzJJMFVpQUJtdWxwamt3bStkRG04VU03TWxtcW8xclZsNmhpS1RFbEJl?=
 =?utf-8?B?QUozVUxEQ1E4Si9HanUwYzZLOUlyUGtrUnJqamIvZGV3bzM5VTNkN1UvTk9C?=
 =?utf-8?B?SCtGZ3lSODdUNDN5ZVpUQzI2RWFBZlBvcjY4R1g2YnVjTlFLT1RPRkJRWFR0?=
 =?utf-8?B?eEpmZ1B2SGduYzBTODJXZlh0c091QVRCNXVXZz09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(7416014)(366016)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?N2VFMkJqWFFkU3BJQmxseW4zRlBLSXZVZVpWbW1zYUdUN3NGSXM1QXh1YVN6?=
 =?utf-8?B?NmlCaDJBbmJ5UzU0VnhSWS9YZ1VGaVIvOHFyOVFFRWE4UW1CbndPNzlleFky?=
 =?utf-8?B?SWxMWDhlc2hGLzYxNWU4YTdueTNLYUV3aXFJTTg3elEyMUI1eWdlNUpCSmpl?=
 =?utf-8?B?WTFkWHlXU0FiRWFXUStoL3ZrUG82UjFvMjh1WHluMEdYakJHWlh2dW9XZjRH?=
 =?utf-8?B?aTJldHN5Q0gzWUZ6ck9DN1N3RkpWd1YwU0hTWjMycTVobHpnZXpJQjZYd1A1?=
 =?utf-8?B?anNzWi80cVhMMkJuU1dEalVWSFpZZ0I0Si93UFh3NThvcFI4Ym9SQkh6Zks3?=
 =?utf-8?B?Y0NxQmR1dEFxOW5CMEhxWG50N2Nhc29QaVlyYnk3Wms0dmxDaU50STNnNEEw?=
 =?utf-8?B?a2dyK3R6b09yRVB2ajd3S0MxZmREejFBeUZudUlRVUhud09HMllPalJLdWpu?=
 =?utf-8?B?NW9zdHJLR3NxUjBkbjVFeWhKK2w2T0ZGZVVnRVl3RGMzSm05QU1wNGc5dVk2?=
 =?utf-8?B?WG9EL1N5eTdDUVZwdDVnL1BId0ZHWGZlb242OGtBZ0lEQmhocmduOXg3VXU5?=
 =?utf-8?B?Q2paVDJjRXBoNE1NQVdsTXJJSTJNSXgwTEFLcER5cU4rbGlzaEdDM2FIck1i?=
 =?utf-8?B?WFRhZUw1RzI0TmNTL0NxY25lNUpJbG1UZlE3K2RPVVk0b3daVDBIdDZxTkZm?=
 =?utf-8?B?bzFRbWRPM0RzeGNxOHVjYzg3L25lWThERlRtbmRYSERGNERZU1BzSzI0UlNQ?=
 =?utf-8?B?MzJPTFplQkF3b0hsblNqV1FBZ1pqTmxTUUN5NFhzSTFUUGVYQ25LZjlqOWRp?=
 =?utf-8?B?NjdlOHJLSVVaMUVQZ3hkY3o5M2dlN1UyWnN3NlZ5MkRhZHRRQVU3b0VZYVl4?=
 =?utf-8?B?QlNjOHp5V2ZsQVZ4VFdqbG1HL2VwS1FWYkpiNXZ5K3JEMDY3OGdNRCt3Wkgy?=
 =?utf-8?B?UitJTDh4aWkzcWNQUmNlSWd5clJQZWtlZ05WaEQ3UC9oUE12M21hN1ZpZkph?=
 =?utf-8?B?KzM3c08ySVpCemxUQUtQU3pSaC8vVzMzMUhzMlhVTWVOVW5wbnM2V042cHM4?=
 =?utf-8?B?UWcxNmRCUVBMTXRmRGswdlV3aU44djQ5WEVjR1FnV0xtZ1BwbVZMRVNGK0RK?=
 =?utf-8?B?b3k3ZlVYdUFxeUVKd1NtOWNmdkxxd2lRTExwZ2hXdGN5aXRoaUNLTFVlRGE3?=
 =?utf-8?B?akRGMGtIWVZQUTVoM1FKZW5CMlRqQ0VKVXB6RkZzRW01SThiejVKNU5PTjNy?=
 =?utf-8?B?aDJMbVd4Tk14OC9ZMURDcHlmNGtLNlZPZFdweUlyMDRnZm52eThQQXBRdEo2?=
 =?utf-8?B?Q0pVRE9RbVNaL1g5UnoreWRhanRoc2ZKaElSNndyOGIvcDFVbUc1ZjFCYVEw?=
 =?utf-8?B?N3l6Y2x1eVdIQWFQbEQ1WVpYSkhzVlNDbjc4V2F4dVZvUHZrYWV3UWVBZGta?=
 =?utf-8?B?STNIUkpRU2l6K05NNVROQ08zUzVYRVl0TVlhc3owdnZzSmlIMmRaRmQxUzE1?=
 =?utf-8?B?KzhWWFBxcWlMQ1h0ZlhYZW9VZUs5bUF3YVRWQ1IwNVRlZ2xwVFpUNEhtZDBn?=
 =?utf-8?B?cFNmaG9wUUNiRXJIVi94ZWl3a0FPeDV6QkVLOUhSRmErdGRuWFFQZVVsdjBL?=
 =?utf-8?B?UlRrM3dDS0k3SjE5OVJ3NVJHMG5nYTN4SGhpRVd0cmJqaHQ1V0JPYmVpYlha?=
 =?utf-8?B?YU02QUNTQVJ4RVZSUm9KRVcyKzQydEYxT2pLMzFseUtTWmRjeklWaHFyVlEz?=
 =?utf-8?B?V09ZcGZWUnZmbTNOYmxCME1vTTg4RVpZUlZDakVJRmQ3TlV1Vmd5WW4vQ0lr?=
 =?utf-8?B?U2JGNTBRY0UwaWpEUVpualJ2T2QzZUc4U245eDN5RlZ4c3ovN2hJYTdzdmJW?=
 =?utf-8?B?b0ZLZXBmK3ZRd0hkZFJ6WWlYYVhRVEIzS3I4N0puS3V4ODlIMHZJZjhER0lB?=
 =?utf-8?B?cW1rYVc2cFpZU3lDSjdjb0ZXanpTNWlkUFNDY2poRjVxSDByalRWRElVZzBy?=
 =?utf-8?B?RVcvaDFKVm5kUy83VDlHV3pOYUh1ZlM3NUxockhNZ3Z4WnZjL1BTVXZyejdL?=
 =?utf-8?B?RmRzOVBJYlNPSlRIdzFkZ29lQXNjZmR5eFd1T0VMMCswNS8wYUltUEZZZUJP?=
 =?utf-8?Q?yIg3jYNxSWWkjd1PQKud67kmP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd12951-152f-4dfa-dfe0-08de3c2c542f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 22:50:22.2904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXv4k2w7ZdUzxf4XBGMJDVN8EI8RZXlLI9AySmzz8j6t5oHQvpm2Nm9rY2dR+BOXR+sQuD3dr0r4FfKBc0Zu9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10794

Use devm_pm_runtime_enable() to simplify code. Change to use
dev_err_probe() because previous goto change to return.

No functional change.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- remove error code print at dev_err_probe.
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index c3d411ddf492eb27b372763ce5d344a90c6ec524..486092511d1f9381c250ddcf844fc74c61a789b7 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -499,13 +499,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
 	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = mxc_isi_crossbar_init(isi);
-	if (ret) {
-		dev_err(dev, "Failed to initialize crossbar: %d\n", ret);
-		goto err_pm;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to initialize crossbar\n");
 
 	for (i = 0; i < isi->pdata->num_channels; ++i) {
 		ret = mxc_isi_pipe_init(isi, i);
@@ -528,8 +529,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
 
 err_xbar:
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
-err_pm:
-	pm_runtime_disable(isi->dev);
+
 	return ret;
 }
 
@@ -548,8 +548,6 @@ static void mxc_isi_remove(struct platform_device *pdev)
 
 	mxc_isi_crossbar_cleanup(&isi->crossbar);
 	mxc_isi_v4l2_cleanup(isi);
-
-	pm_runtime_disable(isi->dev);
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {

-- 
2.34.1


