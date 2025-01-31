Return-Path: <linux-media+bounces-25501-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 771C2A244BB
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC3A07A120D
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5991F426B;
	Fri, 31 Jan 2025 21:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IxYxl7Jd"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD621F4730;
	Fri, 31 Jan 2025 21:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359262; cv=fail; b=KPlT54xTR4M+7CAb0BtcHAT+EspKQartebhpTxA1Yl0YXWihjdJ9OKCk2Ksfh31E0lPOJPRqu9birFM70jcfDgj9ZdXv9JHf7X9I33TlRx4Rc7f5mL3KKB5SX0sriCPeANWov6MU+9lVvl1sWbEc5quw3vf/DsehrUph+Mnpnis=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359262; c=relaxed/simple;
	bh=UvN8crUkbDBRRd8QGCoJg6J3AuuYE6nT2A4OmIbg0X0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=USPV7OWNFAIuB1pdOvH+b8EA5sKDX87RhoM5X/JRtC9K9Y975iTH8puLJt7c2TA1QUrWUAIEZ4oNdcMsNHEkX7jGhNJZmpH0zMlYx6OFTnctHsi3Vgz1/8C/LqRpv0aC6UJlitoYPi8ibZ2uSLEFcgOZwPIVvTmW/oZCfETgkP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IxYxl7Jd; arc=fail smtp.client-ip=52.101.66.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qpy5a4Up9cLjtFD86Y2z8OBRY3yLOdFf8+21dwIfjcFP1g0j2jbTLFPrfi61PYj/tHmqI/G1Czmr+ShSXb5TtGlccJmoSQvvjh+Fm/c8YpPVrpk0xC3Bkxju1VHCYZLmaKoyO2WmpNjKV4XLSCXUelCVUcx6WpBiq3A9Df7a7CDTs8h+8Ksm1CXrMzRRDgUU818Dg/bEIipY69jEBpRAWN+JZ7SNhkUZjlSqna5Nq6HUYYl2+zyeUNRJrrh5hZoDQRj2B8iMTtcehfTFQmW8k4/mUuEIc5/5ENVIXHutYu5Xq4kzEGo4YWSam7ect+HiDUnucywIs4bLljTZpVTxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3PWy3O3Nbf3Odcn2EuDbDP1pTd8eC18moleokeyf24=;
 b=TKw3gBM5u8gduREn+45WMDK0loflD0R951E9e0pQuoFoYRxxTL1w92C0nuWytEQYTtRuqFYjpYHR9dQ/91K7Jng3HQNceF9Z5qAgUK/dk/F/6tdElYjTrr9RCl96ELBKJyjaSBldGhSNz9gcvqxPvIS1ZbCteEbmbnS60WeaAUJ2zF8/CcHGus1ARSsMqCTgH89iC1F5x62JPHrqCjc9eJXucmCrleVf5/0I3PcPvBCltxjEen5rMbWsA+kfokfjZFAf7lQvu82/wHnMfr48q41AgLnlq9q41yvnH41L0os+uD4/Xg2fNFtK8lRgCzXM8THDUsfZqPuvZPtzScE62Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3PWy3O3Nbf3Odcn2EuDbDP1pTd8eC18moleokeyf24=;
 b=IxYxl7Jd4cXBluKc6QUiHloDK7947GHfmOQPZLNTfKqsVnkbrdM2KmDKCDXffpZPJd4M8n0so1HXP9wFCFM7NZV/Ozd0ku6XzmLtZ2kBbw7RD0xG8f1ihlpke2wRbrw0Z2AmkgsGq9HeYiV6Wsu1kIvTTkdly5TSO/Qte0L/j3pxw7okvHX7QSDCqZtHRSX76/IZADLcD/wF4mgnYk+LeV9S1IR3Ae8jM5k1y06LliqmnSnRDb9j2PjpE1rxtZzWQkOZfsda3nDwluXVx7nyZtSiCsXPSZAUYBSwHVST12t+FssYkdrSg4MZZ8GRJcOxiIDnYrwzx3FPg3JFaaEjsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:34:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:34:17 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:48 -0500
Subject: [PATCH 03/14] dt-bindings: reset: Add reset controller for i.MX8QM
 and i.MX8QXP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-3-319402ab606a@nxp.com>
References: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
In-Reply-To: <20250131-8qxp_camera-v1-0-319402ab606a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=1340;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=UvN8crUkbDBRRd8QGCoJg6J3AuuYE6nT2A4OmIbg0X0=;
 b=bOW+6oxNvYh6XdmgY/ON2sYqe0PwHV7emZ5CPOW5kOFIM8xiWJx0bERgONHMvXcANCkbLlS5B
 QRwgDjNOCYTDrsySiwQcqXikzAAqdb0o0/etJFVgGSXtnnOs6QIpEHk
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI2PR04MB10980:EE_
X-MS-Office365-Filtering-Correlation-Id: 0894dbc6-0823-4bcf-222d-08dd423f0432
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?UjNtemFSN3A3VEw5V1hqdW0reS9GcnNzNExSREpKbm1KdEJrZDVSRk1YTEV5?=
 =?utf-8?B?TG5YZTdFMVl3MDBLZW9uVVpnTnZRZU9PNTZ1UTYxV2MxUld3OGFGS2l5SGNJ?=
 =?utf-8?B?cUhWcTVmQjRPVVJmUi9OSG9LQmdXRlJoVDNsdEVjOHJBRGxFMFZhU2pTSEJj?=
 =?utf-8?B?UDlIeGc0NTBTWDl0Z0dQTGREUEN5bGRYbzYxQWVOMnlNTUJ1ZkZiWFUybk9i?=
 =?utf-8?B?U0ZUNjhJTHJ3Qmthc0ZIdXVJWkdRZUFUb2oxZ2Rmdy90K2ovQkh0ZnBoeXVw?=
 =?utf-8?B?ek93ZVE0OWdtMS9nVnd3aE9Lenlva2JJdHRYZEhRbnpCK0FFVjZuQVVwSXhH?=
 =?utf-8?B?SmY5NkJHYTdkdlEvTFJobFh2T1FiTHV5TnVPYitOc1I3Z1QxNmJwdmlLTGZv?=
 =?utf-8?B?SS9lc2RwdEE1UUt6dG9WM0FkaTYrdTZuVlZmNitkWTAzdmhkNkZJUVJ3bktw?=
 =?utf-8?B?bTZha0hhK1BvWXh5YnZGeGYvNEwrcFBLMlIvZW9jeHgrUDRHUW94SjgrbHg2?=
 =?utf-8?B?bGYxQUlvMmZ4QzljRElFOEswWmQ4L0cySTNkWXZQcUg3RjkrTmVUMFlVaWVy?=
 =?utf-8?B?aU5kSlJXT0VxS2MybU9LdWswVlc3eWRQd2M4RnpIaWFrY1EzMCszVzcvajFm?=
 =?utf-8?B?Q0orcTJuRlVvUjA0QTZlZkpsS2N1a3AzaDdwcmN6U2dtVmxyeW1GMXFDR1g4?=
 =?utf-8?B?U2RzbHhpQVlLdkg2bWhncFRjYjdLZ0pkTEZWdW9WaC9MbWI2L2VrT29YcGhp?=
 =?utf-8?B?ZjlZZkxmWkd1cmZRbW5Ndmw1aG9IdUFjVm1WZmJjK1JkU3JWOENKcmR0RWtv?=
 =?utf-8?B?c1FsY0QwTENEZnkzdG9XeDRJR3cvalNOMHpIV1hrYXdPQXYxcHRISmZwdFFO?=
 =?utf-8?B?bDdRd3pidStDYXl5WStxS3drb0RRZXFZbmw3OWN5U0lVQ2xzYXdrWnIwVDd1?=
 =?utf-8?B?Nm9RNHh0Y2Z6bVhheHhac1hISmhnRWVjT1ZTSHpyb0cvd1FNb2RQNWNvL1Zk?=
 =?utf-8?B?QUpWeEFMUk1UUlRGU1F3LzkrdGtYSnRIaTZMWkZhODZjM1B3NXlmcmtQRFBK?=
 =?utf-8?B?aFhMRVU2ZGN5RU1Yc203VHZyYjU5MkxJTlRGUUt6ZGc3bnAyRU1lSUxqOXVk?=
 =?utf-8?B?c2svMlpaZ1JwQlhxRXhsbEl6aXNIc3BLYWUwMTM2ZU9janFjSHdWVEhtNlRI?=
 =?utf-8?B?ci82czUzY0V2Zkx2dDJqOVNuU2ZDVzFubS80ZDdDQklSU3c4TUJHQUJXNm5k?=
 =?utf-8?B?Wm5lL1AwRTNkZ1RoYXA5NGxjck00SlNGZ1A4YWNVbTE0TnRUVFVLTHNINmYv?=
 =?utf-8?B?V1dVaXhCYW1XL3EyVHVVNVFQN0llRDRhMG8weUtCMW5WU3UraUFWOWIyWmtm?=
 =?utf-8?B?ZHVFM1JlbmlEOVZFNFlsUUdPLzFZVHFVbnZSSWQxdkZob2JGYW9LZUMrT0ZK?=
 =?utf-8?B?TnUzOEQrZk1uMTNRdHlkcEZ0Sm5nbWJRZW1wVFZzYy9vVk1ROG50UG90ZEVY?=
 =?utf-8?B?SkllNDhSYTM3Mk5SNTVKREM0T1I2S25lM01NUENXMnhKSFJNdGJsalRuNHJN?=
 =?utf-8?B?RTkwZm5INmd0S0w1UDJYNGRtb3Mwd0hmSjh4VzQ4ejVYY2NnN3NqdXNWWU5s?=
 =?utf-8?B?RDBJNjRvMVFkbnRWaG4zVzJTVnVKQ0VsN2JPdjdmV3ZVK2ZSK2ozcjQwTytv?=
 =?utf-8?B?QllSZzgwUmJtNnlWM0dsS1JnRGFSQjh2QXZzMEFUSFBRS3BuTm9DRGdhcW5r?=
 =?utf-8?B?OUtIY3lXWjJGNURTU1oyL0lrUzk3SlVRalFxSThuSjkvY2dlRlE5MmlGeG93?=
 =?utf-8?B?WGNNVzRnQ2tEYjA3ODQxeG01SzhDS1Nrb1VweGZiUnBCOUdiOGRsckR5cTk0?=
 =?utf-8?B?dVdoYWY3RU44aTZJcHkvTnkxK3V5L3JseFZja21aRVlrTmc9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?YUJUSUk2YmZDYkE2N0IxV2dNT0U0V3FRVHZJWWZJV1BTTmNVcFc0d2NIeUpV?=
 =?utf-8?B?THpkbGZ5QlZmRVhXTngwdDZVc0o2SXBpYlJ3SDdlTFhCeVRIa0p0enVPRS9V?=
 =?utf-8?B?dmdWVS9pclh3OVhGanF2WGYvV05pZEttY1pkMGgwdjBUMnl0SmhPVnp3OS84?=
 =?utf-8?B?UXpoVjJBbW94VGhrb0xrbzhvNDhmSXRvOXorZVYrRGdnOFBWdm9UZXpFbk9D?=
 =?utf-8?B?dmFlQXc1MTF5UjhiaFgwVGlHZURaRjRmT0U3SWVzamxTL2NDUVlrMUFkYWN6?=
 =?utf-8?B?d2JLVk9reFpnUUc0R2NBbkhUSFB2WGhoMUp3czJ0R1YzVUhuTlJwL3FYd0J6?=
 =?utf-8?B?dEk0TDhmK2d0V2tFN0ZVUE1ja21SSGFTTVppZ0hqQnZtcWFSaDdTbFh2SWdo?=
 =?utf-8?B?V1k4cXh4dzFKanRNcEtnS2p4ZnU4THZwTjdUN2FWZVZNbnVDMnZYL25va2RE?=
 =?utf-8?B?SkxFQVh4VU1YRk5XSWJOeDlqS2VTc20wSUFyTUJOZTRGemRVWjJqRXZWQ3JX?=
 =?utf-8?B?Y2U1VWlDdVc0VDNhRUhuR3F3Rk1RcmVtazdPMFhLbTVaUTJxRzBSc21WR2NV?=
 =?utf-8?B?MTJGOEM2a3VmeFBGc1RjWENOKzhkaUFGelkzVXN5UjVsZHJuc3NkR3hQM2Vq?=
 =?utf-8?B?V0ptK01zZUhjelNHd0UxTC8yYmptRVQyYXhESmFPMkVENnQ5eEc5ZjFCcyt6?=
 =?utf-8?B?YWtQVFZ1YS9YcUxQRERFQllCcmE2cVhBZk5ZSy8zWWphZzJZcHBTeW5XL080?=
 =?utf-8?B?Ui95ZFdyZGVXZTNBSGsrT3doZEJndVdLVXJuZmpNUVZjVDNNZ3RHeFRTRm5h?=
 =?utf-8?B?SDB6R3pKTlhBd2FhWnFxQjZQM1kwTzViSCtRM3F0QjhpdmZscURRZ2hUaUtF?=
 =?utf-8?B?RFFrUHR6NHh2NXJ1bGxGOTJ6TC9aN2VXMkRTc1ZyOHB2c3ZjRkJQbm5PaXVr?=
 =?utf-8?B?NnZxTWVQRmpGbDBoYmpqbFpXckg0U3NJM3ZLMjVyeVFWV2UrTjF3TlpndDZ5?=
 =?utf-8?B?d2RvQkZ2YUMzQ3FKeC9ONTFXZlBZcHkzV1cyb2pLdng2R3dmZUJCbjlMTnds?=
 =?utf-8?B?anY1bWNOUjJGTzM2Mk14cDVybVdoc1kzcWZnNEMyMzgvbVdxYytDaWhTMStE?=
 =?utf-8?B?eitHNjl3NDFvMUxHMlNXMmtITzNsdnhwM1VFR3BlVi9IRzhQb05RZVBZWldG?=
 =?utf-8?B?ZEVuM1RVcnlHTWlUeFFHOHQvQnFwQkVEbkk2c0lLQVNnTys5d2FuTlZKZkFC?=
 =?utf-8?B?NTdmdEVuMUVVS1lSYnJlbllEazRNTUtVVWc1NmVzUEk5d1JWc2tDVWg2cVVz?=
 =?utf-8?B?Ui9wU2tlTGVOaFBKakFsOXUzaVpXYThWMlBkY0d4UHhCZzVUdEVKVlVJUmlw?=
 =?utf-8?B?Y3dyamp4OUt1Y2hQcjBkY0lHYk9Rb3JucEtJRHFmYUZtNlc5SFlUMjhkYU1r?=
 =?utf-8?B?UFRweFNvZWN0OUtyK2hhS0k0bzFkR21zRStXam9jdHdEZ3JJUVhSbXNBLzJB?=
 =?utf-8?B?NXEyQ2dUdU5CRFl4TzBocXB0dlJNZE1hZGJmd0FzbXVENk5WbWkwVWR4VmdV?=
 =?utf-8?B?anlUTVVLSUZ1L0NKTXEyb01qKzNWZFFuY09sQTdOTUdtc09pM29yb1RQOFZF?=
 =?utf-8?B?UjFvbE0wZWNFNEYxY2xqWkdRcTduYUY5aU9wVUJaRGRjUUt1ZDRlTnNPblFj?=
 =?utf-8?B?bVVCemgvOEM2ajRqN1Y1QWZVSTZrVkpFYnUvTDlGUTNiMGYzdXNwejNzZDlM?=
 =?utf-8?B?YW9sak1SV0F4S3BUdmFJWWhUalg4TmU5TGl5akQxR3BQSm93K0NVN0docGZ3?=
 =?utf-8?B?ZkJvczQ3eG5mbFM0QXZCd1VOM3dUN3UvNGUwWERteWs5L1lKV1JmR09OYWtL?=
 =?utf-8?B?UzRacUxKZDJnSS9UWXA5U3dpK3BmSHp1WTFlWDc5TEdFUEVlLzhNU1ZZZUFk?=
 =?utf-8?B?TG56RFlWQmN3VnZDN3owUEVRZmY0cmtISUxNTlNSMFZySjhaRUVBVGtZQkp6?=
 =?utf-8?B?VzFSYVE2eElsNHRiWWNISW03blRsSlRSRmVTRGQvM2ZsQ042RFlhWkdBL1NT?=
 =?utf-8?B?QS8rY1ZyTWlRcHVYY2wyc21EcWM1UUlFeTBNY0NvRGdad3ZsMWovN3dQRi9L?=
 =?utf-8?Q?lFyA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0894dbc6-0823-4bcf-222d-08dd423f0432
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:34:17.8498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cmOxZb013XNFFoQCYIKfP/4Q4kB30jVRKX+qP8dF0ZwGDSMTNrRww2D+vQCmj9HOAAJDufwzuTe6lKLtd9scNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Add binding doc for reset controller of i.MX8QM and i.MX8QXP, which use
System Controller Firmware(SCU) reset some peripherals, such as CSI.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/reset/fsl,imx-scu.yaml     | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/reset/fsl,imx-scu.yaml b/Documentation/devicetree/bindings/reset/fsl,imx-scu.yaml
new file mode 100644
index 0000000000000..6046df8723262
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/fsl,imx-scu.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/fsl,imx-scu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8 SCU Reset
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  i.MX8QM and i.MX8QXP System Controller Firmware(SCU) provide reset for
+  some peripheral.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx-scu-reset
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller {
+        compatible = "fsl,imx-scu-reset";
+        #reset-cells = <1>;
+    };

-- 
2.34.1


