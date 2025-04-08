Return-Path: <linux-media+bounces-29691-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B8761A8180D
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:58:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A38481BA7825
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9755259CAA;
	Tue,  8 Apr 2025 21:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K1Y61WHS"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2083.outbound.protection.outlook.com [40.107.247.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9CE3259C87;
	Tue,  8 Apr 2025 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149293; cv=fail; b=snjqbIptb2Cqu0cF0jpIjASeOXjPiXZC1bU4NrLUy6VbYZlHQPmyRLF9y0XFMlt4APQ8jMmJ70KkjAyl54dT/6NiMoAR1UKcQneV5EjVod6MIamNwyMHGtrr7Rbmx4BLskjH3Shdbihj6UnQIQRdpfW+/SQPAQNW9C8P+ocl510=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149293; c=relaxed/simple;
	bh=+nDGwia3/owe7pv+QZPq07IJEos+Cd/hT3WNI74TaMk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AsCHdNXYG2GL9Au+mHrccPX+vDlnBDD2QhfpstMoQTrT/rWPzNyhch4dCP57E6kG9mCpRSZ38muw7cCmcS42qUQu1Aly+W3Mb9h1nKsRZFa5u4bVrOio6eBHBUCbMLpg1lM+pmKvS9GpaBo3wiLxv3sw6OSwZ9aY7etczkPl6jY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K1Y61WHS; arc=fail smtp.client-ip=40.107.247.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C1WJDZT/qLNW57qWG2NN/XZ5i8OkS5HTaPeXIHCKWglp5M8e7I0lz1n2bInofiMQbnv38oyPxXFcZHPn46N0GPf7FV/Q6/ev3hvEa+T+Qo9BjzmogVfUtjpCeFmYnk+3x0GFRqrA/myutVGZoxCwxo9FAN02u60VOGxI5pEGhsxyVn7YYA86jtefL7AmjkKx1clsfIOQFsy5pr8dTCXPWMh4uKygMgEwqcA3YkxQutvkEsUoWnrISKiieG39GOtvZXJvDTtoaCHrGfBBdeeNmyKhGNdeDFsULXScfxuTpwkXJOLI4ksU0lMQxKF29rWrNO0d6SbeZD6HT7FRqFTF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KttHrRtzn1U19NH6GsJwXSoXWlO1SKYYwMmHuWE8chQ=;
 b=HMxAbzINl88he2iP2CSGDkFf/jHnB4llwnkLG1uOu5/T6QHrxEK1rahjXRUUiRuksf0OG8JeLzzIQ+XZelZuodK8gIqgpIbuKct1vnEgG7Om9IOPLQyJ/xQAZkqIrOGkamsgplcmULPfatKWT6lu2/Nx2sqxk15448UQ33aKe/k7odylGsbsQXl1CELy4mSXkefqj3KbWwlFLsEXTa9Il9sre1ST8k+f/Nkj960g0DbrnQ0KJxU1CHe2ULCo50YzrQuNYYm+kxzCZuXV0Wepfq0q/cKKyU0mZo0D6qL26CZDW1LJTgyourQWtwKrDBJW8jjs+Z9Mlbr6ajmLUimDMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KttHrRtzn1U19NH6GsJwXSoXWlO1SKYYwMmHuWE8chQ=;
 b=K1Y61WHSpqaQ0oa8w9SND/t5efSTqDDMtSCh/2rkzjlcarUa8VR+fiv9Lgsu/M1NrLe633o7n5TLJw5vRnllyxMeXeA2QeMH8VpKHuWJYaIwu1CT7j7pHTflNO3h6bsY9mqQ4ZGtsiythvF7rVCtUI3S7nlmyhnyUMoo2dQhAe+FHI5Hs2LBCWf7PueXm2YpbjFVg0jjxNF1hR7bnDuEtWsfL9DGnxewjb6BAGsJ3q16F0NTpHd9JCUoxQgWdG2ka6IUdT9Eh2tpMPQ1WGafqx91X5R9pfgSKLlpSLLCuH0fE7ZAxNWfzUiV3Tezgh8qVRGUDhOPXXnMf2D5/URvSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:54:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:54:48 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:53:11 -0400
Subject: [PATCH v4 13/13] arm64: dts: imx8q: add camera ov5640 support for
 imx8qm-mek and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-13-ef695f1b47c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=11400;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=+nDGwia3/owe7pv+QZPq07IJEos+Cd/hT3WNI74TaMk=;
 b=i2EyRjc1aHRNqIiLkIX6ZmEkrru7FOytIrJP/4yJun2zSyDrri9B0hU3DPRXPbOv95wQ/NhQg
 1dorGgMmvbHD7X4WLpWluIo5+oc1l6P1qIrRzQbBUD6pf+G2ZqeMOhh
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
X-MS-Office365-Filtering-Correlation-Id: 2e8f1ca2-63df-40f2-743d-08dd76e7fb49
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WnlXWEQrVGQyTzVpVXVHTHROTEVJekk0OEhmZ2hoM2Z0YTFpcmJ6b2JuK015?=
 =?utf-8?B?aDJ4aVZVR1IwY1lkRXVxZDdrd2d6ZmxZZWFabERISTBHRzhjb0tFSStFTzBL?=
 =?utf-8?B?WXZWZzQxcklmcnBucTFhQ3MxS2tER0RPNW1oUVpjZWNTK0xaZGRlWDhrdkJR?=
 =?utf-8?B?bEVDRzdhM3NIZ3g0V1I1STlsRGJVejBKVEJSREtsa0hjWTAxVGxBUG1WWUl3?=
 =?utf-8?B?NVVnZjgwVFFyMnBUK0VtQnM0SDRpTjVJYzRrS2F5eXo1cGREWkxac0Q3UXBn?=
 =?utf-8?B?TUtBQ2J3TTA2Nmk5SUxYNnZERVcrWXNQbkFZdEd6VjYvdjh5UzlucTk4YTF4?=
 =?utf-8?B?RkFWbkxuT2lmWGVVem5NenFENUk0RWtMZEUxRUdYbFFEbjlmc1JNbDlsRnFV?=
 =?utf-8?B?MDdjRXhKVU9aUmVVMFdOZnliUXFuaDhNSVN3d3pGU0xCc21hek9Ba2RPblhj?=
 =?utf-8?B?RDJ4RVlhR2hiSTFkUXVxSlBZWU9sZU1NbEJTbjBVZ2RneE9GZUVEVUd2V1c1?=
 =?utf-8?B?d1pJc05ETmtyb3JCdS9hektZdzlyWWpCYzJoRmVrbHhpMVhTeURUM1RlV09p?=
 =?utf-8?B?R1Y0OUtOMCtZUVRxMmYzc3p0dE16UEdIazhZaDNGQXh5QlZDY3BtdHZoQWdK?=
 =?utf-8?B?RzVvSHZVbzBzVm1KcFFzUmE5cVg0RDVweUNERUpzY2h0d2QxNFVvQSs5UXo3?=
 =?utf-8?B?WklablZ2K1RrTEl6STBlTTJZVDBvcVZmOUNiUDFGZWp6SExZRmcrOVNGUU9s?=
 =?utf-8?B?OUhPMXFGWjVWaXVXYmxSY093YXVpS3IvUEhuUjkzWU9XcE0veVlTYmxBcFBR?=
 =?utf-8?B?Ri84RkY5RGQvT0h3cGM1bmlKRDRXRXdMbXBqQmdXWVZ4enhYNmxEUC9UN2lV?=
 =?utf-8?B?ZUJ6R21KYlZnUjNpd2JITXF0SURBaHhMSlBHY2NLOTVVU3FsOW5jN2p5UTBn?=
 =?utf-8?B?OVJjU0piaWIrRWNOdXcxSlFValdsSXI4RlR5R1VncGtRTGVNaUxhVG9CWXp1?=
 =?utf-8?B?WFRBYU5peEpDZXdZaHhTZ0ljelZlL3ZQRVRNT3l3MkdmeEVHT2xxRTduWnRS?=
 =?utf-8?B?Y1B4MXFYTjE1cVd4ZFArRURadjRNeDBIcDdTSTZ1OXAvRDk3c21HeVBGS2RJ?=
 =?utf-8?B?cGRuZnVLVUN2UjcrZ2cwcGl4K0hyN0R6V0dKQ1psMkxmU2I0Q0VlU3Bxa1BG?=
 =?utf-8?B?Y0ZyUElOU2xueHBMdFRQTEdLdlpBanZnL3BhYlg1WEc1RVNyRENBaHYyZUtx?=
 =?utf-8?B?dVNPN3BWSjRodnZKTlNKaTRkaEIvZnJ1em1oZUpxeW5ibVJaUFJabXY3MGRK?=
 =?utf-8?B?TnErdWFwZlEyUzFlTTk0d1V5RWNSWXNicXdzdmZMR0duZ1JmQ1RWNE5vbjl1?=
 =?utf-8?B?U1A3RldTdThRRVpSbmRUekZXU25yT3V5VUtjSmZVU2xsOHE3MWVock03VER1?=
 =?utf-8?B?dFhHRDFQeDk4THFMMnRnVit6TUtweGtGYVE3UUJDaGswNmFxbXBYVEdQSGZh?=
 =?utf-8?B?d0h6L3hTSGhMT1BXVDlha3Q2RU1RQk9vVmZLUHJ6OHlYUUUwY1VjUDFjNG1B?=
 =?utf-8?B?c0xuTktONVdkNEU0OTRWQlN3VjZMU2Nvb1o5QlYrdS9YNzRzT0F3S3FFdXpi?=
 =?utf-8?B?Qzk1TXdLTHZWSS84YXU5bXgzQ01kQWJQdDlzclR3aVZwdG9VMDRndlBwUzFr?=
 =?utf-8?B?QmxzRnRmeDVORzVHdHRLRGtzZFp3UEJhVnVLNHFDL25aZi85N0hiYTVwRk1I?=
 =?utf-8?B?ZVdNTUZOTjRDZlFmbnRkVHZSTEx6UndMR0wvN1FtWnJPUEtQSzBISjNrZzNy?=
 =?utf-8?B?cWdHK0dYdkZzNzVWREVscEZ0aHppQkUwOHJKbUEwR2FwYXlMbjJ6SVltS3Z2?=
 =?utf-8?B?RTRLTFBNeTkvV0tCTFNoUElvaE1INm9nNFc4REJ5SVFVTU1VTmJua2pDS2Nz?=
 =?utf-8?B?bXVYRjJna3BxbnlGdGlKWnlpQmFja1ltQzEyQkNYWFkrUWwyTks3bmJiODhX?=
 =?utf-8?B?VDNlZWVKZ0pnPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eTFENXBnenUrM2h6ZkUzZ1JOWmdjQUR5L1NXZ000VDBERnV2MUwxMVp5MUtO?=
 =?utf-8?B?T3cvZjN6SlM2RmNKR21kc0pTZDEvblJXOVNjSVRKcngwTXcydXNHSHVjU0Fs?=
 =?utf-8?B?M3FYVkIxS0hDK2wrUTMrTXB6Z0l1aEJPcmg3MVIxSzdzWDNkbWVXWVRKL3BQ?=
 =?utf-8?B?aFhRN0s2b3hnNHJ3Q3BkR2N5WEtobkZrSWtkM0hPVjFWdFZpVFFzazRQeUMv?=
 =?utf-8?B?bFE0OTBnUlo2OXZoQXJKSURRWlBRdGR0bDdXYVRHaEZ5NmRLNE1ZRkhzUVA5?=
 =?utf-8?B?TzBtSWJlMmFDZ1VLcDB6ZUtmZFpHd2MyVmpzWEZOMUNMajAyR0RYNmFqTWhu?=
 =?utf-8?B?NTlFOTdyME9KRFVoeXFSY3BqTWhFbDVuUXl6WUNIazJwV0t3R2g1TW03bDdu?=
 =?utf-8?B?SDNYYnFoK2tiSnpoWEZwNDV4NEhMSXA0K05CdXJKUE50b3RNY09JOVFzTEZC?=
 =?utf-8?B?UTNVNy9lTlBhZ21NWnhFTmVReGt3bGcvRGVPaWVEM0swZmZyUHlaYW0xM29C?=
 =?utf-8?B?VlVsRmE4RS9VSzVyNlhlVjJXUVZ5bFVzdEdZQ1dKWVk5czk5cS92ajNMLzh2?=
 =?utf-8?B?eS9oRnNrNWxRS0cvZ1htWXZOM2ZXa0JtVlVmUjFJWksxQWRKNzVRYUVSdUti?=
 =?utf-8?B?RW94Vm1SYjFTd0ljZmQ4QXB1MXlmRDRJL0l6R0FWTm5TTXFCSUU5YlJFVXJ6?=
 =?utf-8?B?dXFRcTdTMFlvcHdVMGwwMVhwZVgrQ3hVcGtqbURHekVzT0lzRk1TVk9iS3k0?=
 =?utf-8?B?TW1aQlg5dVliL09NK080RWtyNnJ6bXlNM2RFQ0h3YXdXN1ZVcDZ2cjZudmZr?=
 =?utf-8?B?YVVud2RkK0syeTBqbW9WTnZBSG5XbHZmNjJFM1RlcDBoaTAzcU5KK3A0TjBy?=
 =?utf-8?B?Q014SzhaUVlFZ09SVDBaK0tCemMzQUZMWk42cGlLKzZYK3RKYUFrQXF2OGVK?=
 =?utf-8?B?TW1DZm96S0ZIVzlOOVdkemlYSnpMdFFyZzZDNTdHdXlpOFFick9GNnBXaFZk?=
 =?utf-8?B?SENIZkdEc3VtUjNBSHpvTUlocWUxank5ODYybVJXYjY3czdteU9ZSkVGTE9k?=
 =?utf-8?B?VElWT1NHMnJzQ0ZsYlNYd0FYSGJwU09zeVpWcHpnUW9IL0hYM2NoVEhiZEsz?=
 =?utf-8?B?cWkveWY0ellTNXNJd2IrR0dienVJVUNvV3R4VmJMczEveFlYbUE2eTVKd29v?=
 =?utf-8?B?TFRpQlc5T3ZEMGQ5TlJQTWJWbzFPYzFCb05peFJOdW5SODlzNDBHN2lBckJt?=
 =?utf-8?B?TzMwVE9QdVVoRndKUFN6T0dQdUNFbHduQWJzaUsrOE1XTzU5YWREQ0dYNDE1?=
 =?utf-8?B?VDMyVTlaSnFJZGlOQUVBZS80M0hJT0FEWENObjFHekE0MlFPc2ZMaVJTY1d4?=
 =?utf-8?B?K1dJeFpYNEJ5R0V0RTNySDVLSWFpMzIwZVVzN285aXBkS3RTd3ZNM2JnZ2ZS?=
 =?utf-8?B?ek1wLzQ3aDFBQkZEdEJXY3hWNkRxZk8rV1Yzdjc2L2IxZW94Q3JBZzVWOXM0?=
 =?utf-8?B?aWV3dnJCR2UvZkJRTy9ydGwzdTgwZXVmYWJCeTJhRFR2Ty9KZ0N1OHBwNjg0?=
 =?utf-8?B?a3p4NjJUcVUvWVlUYWhKSFFGUmY0MGJJWkFiemJQRlAxVDZ2LzI2QzUwbnFN?=
 =?utf-8?B?NitEelBKRkNrcmZQZThBZkF3SFhLcVkrdHBGQk1WWkxvZFhmNllJSk1kRVl6?=
 =?utf-8?B?UWtRV3RmZGw4L2gzeStkSHRLVXdoSUU1Q3FXemN4N1Z5MTVuSmF5VjBmUDBk?=
 =?utf-8?B?czA5dndTdHp2R2hWZkxMZG4yTytOMlo0STdva1NWOHU0QUw0WDdwc2VWbEJI?=
 =?utf-8?B?SnFhTTRzLzZ4eTJpR2ZxbitscXQ0SDAxYno1emZkeEpTT01MV0pyY1hOdmRX?=
 =?utf-8?B?dVU3ZTFMbWx5OHlINmR5R0dVMHdPaFVrY0FMNzQ0MnpZcmUzMmtQcG1XY2NF?=
 =?utf-8?B?UlNtQ3ZjaFVXcHFBaDBGS0l3NVRPOGYrMHlMTGxWdERva3dqbVc0UThZRXJ3?=
 =?utf-8?B?bUhJWk1uUEluWkFQZGpweTJtcjVhNkVEVGorcTlsaCs3ZUMrOXVEbnZ0VVgr?=
 =?utf-8?B?NGZFZXZXRlJFT2tjbUs5V2tNWVNmREpjeTNMa3hrWllNZUEzckVzbDR1Wkw1?=
 =?utf-8?Q?3NJA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e8f1ca2-63df-40f2-743d-08dd76e7fb49
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:54:48.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mODXtObTYQ8Ca8gSC31tC+v3oASG3+ITKPRALLwzvEq/8Cw7ZAj5rvwEx0UdlMRYSgmWyiRxjngQcQq7Lgi59w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Add ov5640 overlay file for imx8qm-mek and imx8qxp-mek board. Camera can
connect different CSI port. So use dts overlay file to handle these
difference connect options.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v3 to v4
- add board level xtal24m
- remove reduntant ports information at dtso because chip leave already add
it.

change from v2 to v3
- remove phy nodes

change from v1 to v2
- none
---
 arch/arm64/boot/dts/freescale/Makefile             | 11 ++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso | 60 ++++++++++++++++++++++
 .../boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso | 60 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       | 58 +++++++++++++++++++++
 .../boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso | 59 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      | 36 +++++++++++++
 6 files changed, 284 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b6d3fe26d6212..4101ef6ed520d 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -277,6 +277,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qm-apalis-v1.1-eval-v1.2.dtb
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
@@ -287,6 +295,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek.dtb
 imx8qxp-mek-pcie-ep-dtbs += imx8qxp-mek.dtb imx8qxp-mek-pcie-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-mek-pcie-ep.dtb
 
+imx8qxp-mek-ov5640-csi-dtbs := imx8qxp-mek.dtb imx8qxp-mek-ov5640-csi.dtbo
+dtb-${CONFIG_ARCH_MXC} += imx8qxp-mek-ov5640-csi.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8qxp-tqma8xqp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8ulp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
new file mode 100644
index 0000000000000..ba8ceee41db6f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi0.dtso
@@ -0,0 +1,60 @@
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
+};
+
+&mipi_csi_0 {
+	status = "okay";
+};
+
+&mipi_csi0_in {
+	data-lanes = <1 2>;
+	remote-endpoint = <&ov5640_mipi_0_ep>;
+};
+
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
new file mode 100644
index 0000000000000..549633f37db53
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek-ov5640-csi1.dtso
@@ -0,0 +1,60 @@
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
+};
+
+&mipi_csi_1 {
+	status = "okay";
+};
+
+&mipi_csi1_in {
+	data-lanes = <1 2>;
+	remote-endpoint = <&ov5640_mipi_1_ep>;
+};
+
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 68442c8575f3f..503e0acd7963d 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -32,6 +32,13 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0 0x40000000>;
 	};
 
+	xtal24m: clock-xtal24m {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+		clock-output-names = "xtal_24MHz";
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -155,6 +162,27 @@ usb3_data_ss: endpoint {
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
@@ -824,6 +852,20 @@ IMX8QM_QSPI1A_DATA1_LSIO_GPIO4_IO25			0x0600004c
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
@@ -1017,6 +1059,22 @@ IMX8QM_LVDS1_I2C1_SDA_LVDS1_I2C1_SDA	0xc600004c
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
index 0000000000000..5500c4846f031
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek-ov5640-csi.dtso
@@ -0,0 +1,59 @@
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
+};
+
+&mipi_csi_0 {
+	status = "okay";
+};
+
+&mipi_csi0_in {
+	data-lanes = <1 2>;
+	remote-endpoint = <&ov5640_mipi_ep>;
+};
+
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index a378f462a283b..d7ab042e0e72b 100644
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
@@ -781,6 +802,13 @@ IMX8QXP_FLEXCAN1_RX_ADMA_FLEXCAN1_RX			0x21
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
@@ -821,6 +849,14 @@ IMX8QXP_FLEXCAN2_RX_ADMA_UART3_RX       0x06000020
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


