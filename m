Return-Path: <linux-media+bounces-40215-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E55B2B828
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 05:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16FB6560938
	for <lists+linux-media@lfdr.de>; Tue, 19 Aug 2025 03:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE4D29E115;
	Tue, 19 Aug 2025 03:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AW6ZCt+r"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010039.outbound.protection.outlook.com [52.101.69.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17ED20B80D;
	Tue, 19 Aug 2025 03:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755575944; cv=fail; b=QT5+f5aCVFK7X30ZxKqjk9p8vlxQOlGVgKdFsY8xHZ/UvB4Z2NhoRszcgfK7xkkXVbzWqYbcS1ecPIWAUdPVwDXuuntKF7TEhjGGorESnZSZxozngOfbw4SFqgn+RCEqVyuZA/E/SnUQN9snCmYWaiQie+vusP/9fGZnmT7E8Zc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755575944; c=relaxed/simple;
	bh=TtHBzljKg/MlflaZRHRDeWlcAkEWr70fM7jzUR5Vp/w=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Mt2sucXXP1XCPezUDk1a3tSXHMyeoi3yXu1T7YATUZF0cIq5dJ+sXM6MiY8QLKu996UD/qcWVuOp0/7ypGP3OiPDBLIRyidhY0gmUSQtUdrUx1IVr+HsqWa1lko1+LY7mtycMMmhsDZw9mHdnyll9/pLjPQg/bCbFSnFCRA5oME=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AW6ZCt+r; arc=fail smtp.client-ip=52.101.69.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NaUPxYHucQbouVvQjQFeTpSnh2c5iklMON4w/5wGTHM56PGA3RGZth8PofhR1TNTmVqlbjT2w2bJ4yVWL/YyTPgg/CuExt1zshNGXQUyW3+ZELAu7rEeTlPObyfzVrfnK9KcCuAB5RxO/h6ageUcCK32jhGtcNkR11sgdq9zvpJZ29P2rW4GYNajPQ6bBXfGDxCLRTUMs+zrTPB9flM3s4UEszdBR4GsakrXq4CtYKQta4JHHOA1Blf3Ghq/5QRZRjKraZMtpd41OOH6qij6fibsn+hTFLDPTjMvs/wW4kVRLk2r1g3doPw3CF4zfX7cBJl9iliVdZM1R90uaN1ksA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dTZ7/MA39l+fM7bfxTXjBtjlIqj00U2HEb5YmX48FM=;
 b=crQ4LmH1QMrkiuRQm++jyBtjn3QAOzO0Mq9Hid1J9rlPzKXjqDvToedYMOCU8eUKl87Y/v6GCnK9Mtn2y5UshKx0JK9zBGc+j10XIL557FplpKtKevbJZ9fZhpVdWB4R5ijoaP2fIuGCHi/gu2DfFglwzmmRPSXUeS+fV/gjmqe7BmneuojOCk9eBrGrQzEV9UcwCaz8UldhvhPb4PwInExg/7ZYob/SoB9OBVJhnvzAXSDIkA8HCV5fBpU4UzgtV5jmOUkGxTlbeQhfhlcgu1VsJrSyXPP//4/Ew+oJ3exNpaSlW0Nte30qjLNDtrgf7oZ7QrgpXd8qX0899zHIfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dTZ7/MA39l+fM7bfxTXjBtjlIqj00U2HEb5YmX48FM=;
 b=AW6ZCt+rK078lZNnFBjDTkcNFta7+opawsL5bmb2cAFdbHrLfRlfncPOfvoWobVDiEbEtZpag0cANxzULc91djGiY6kaypMPYN6en4ec0kjoI7w+0RuFOwWyoW0FcZBuNKrrkHSo87tz4Px8ssDjnaNW5KOnTeE9Rrz76eXRn4jOoY5JFEtkxjcg8bFA09m0UvKoiR3L2TM7Pzq5vTEej6L8xvtRxbqQcnqlHTptBCWfhpQ6R/lKQyu5sgEkUM0XD+xNbT9T2AX9LF0rKCZodnrsHXd+BfFQhUaFq56AQBInjloiNfg/dL/2avhix1+WC1fDjeczfp8yjuKgljNWPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM8PR04MB7475.eurprd04.prod.outlook.com (2603:10a6:20b:1d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Tue, 19 Aug
 2025 03:58:59 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9052.011; Tue, 19 Aug 2025
 03:58:59 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: [PATCH v4 0/4] media: imx8mq-mipi-csi2: Enhance the driver to meet
 more usage case
Date: Tue, 19 Aug 2025 11:57:59 +0800
Message-Id: <20250819-csi2_imx8mq-v4-0-c16b1d8f88a9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEf2o2gC/03OzWrDMBAE4FcJOldGfyuvcup7lFAkazfWwXZi2
 SU05N2rpqX0ODDzMXdRaS1UxfFwFyt9lFqWuQX3chDDGOczyZJbFkYZUKhRDrWY9zLdcLpKCM4
 7CAEBk2iLy0pcbk/t7dQyr8skt3Gl+N8wKmgE32llve6V1PK8L3PZu89x2V+XWrv5dumGZfolV
 7ru7df244pL3IaxvToeGpYMJPZKs8nKB9a+0XFwDo0jNkR2yA6ezt8Kk1OJs4vIsbfJtn4Giyo
 wYhMjxOxsz/p7lWIl2Z5MZWtDhkhWZR9yD84Skcq9UmhzZJcJmTRkQBCnx+MLQJF2UlgBAAA=
X-Change-ID: 20250818-csi2_imx8mq-59464599858b
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755575933; l=1824;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=TtHBzljKg/MlflaZRHRDeWlcAkEWr70fM7jzUR5Vp/w=;
 b=XB3CcSX5GyULOYjGowp+GO6eU9LVp4QMmrNltrJGugTSZagyLrlGGGH2OQucIqZD5jRUjnaqO
 gMBPQwpyj7nAnpcx1YN3DnWijEkwVy1GHDDpMlo3A82xxUAkDkvsEnM
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
X-MS-Office365-Filtering-Correlation-Id: face9d8b-0cdb-486b-2087-08ddded4ba07
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?eHEzQ0tHOUl0V2dOZzVoZkxRaE82WjRzTmNMcVRiS0dwc0tKNnFWYVNnZnJv?=
 =?utf-8?B?MnV6ZlZPSnA2K051MXgvMWJLSktPdndZSWhvejUxZHY3S1JBenNtdTRqMXRY?=
 =?utf-8?B?QWFNUFNZVHh4TTcreXBReW9sTitOQUlUTzVwdXlURHVUSGxtZ1FWLzNUT0h5?=
 =?utf-8?B?RXNmN21PaGx0bE9VdkIyVDJmRnVNYTUyanZDbVNGOHFsdEdYQ0lzeFJkcVh6?=
 =?utf-8?B?Z1FYMmFXRjZ4emplNEw5UlQzNzlJQXBxcFc5TTY0bW1XNlBDWWJSZmZmbEZy?=
 =?utf-8?B?SnNDL3ZENUZzb2loUU9XWDgwNFp1bHp6a3JndHdZektkRERnOEtZaEowQnZ1?=
 =?utf-8?B?Y2J0MnJHWkNqMTdoOWlpcFZOaWlnY2xGdFMvWFRZZnlTYm8vK2Q0cDZkTXRT?=
 =?utf-8?B?NHdYWkVBQ2V4d3BZNDJpY1ZxUkh4NlAwQlhqZnM4NkxHMFlUN1YrbmlNUUxF?=
 =?utf-8?B?Snl4ZCtFY2lUSWtCNnlyUjR5RDRPNUJPQ0dNWnFFQ1VnWXBhdWRrQjNuNHhr?=
 =?utf-8?B?MG9yUVZKQjBMN0I0bkVFZ2VHbWs5UVh5L1BDbUV4K3dLSGdLa2NVdlRWbHo5?=
 =?utf-8?B?ZzNXN0IvRUFkdFNDQnA5eUl1TkVuR3VpYzRkeXJHZTBnQ2Z0UVlqZHJtbHgx?=
 =?utf-8?B?RkpTQlRQR1lIMmFzVXlsQ3pib1NkdmRDQWIrN09XQ0M2ZGNWaWQxKzV6aGVS?=
 =?utf-8?B?enF4NXRUa3pzQm9EK1lGZ2ZIc2YzM1l4bzBsdVZlWkIzZ08wR290TWp1NHdM?=
 =?utf-8?B?cTFhTTRqNVlMOWE4b0o0SXY4eW9qUlI4RlpUamQyTlVxZERNTlh2YzBKWWNR?=
 =?utf-8?B?TElNTEpSaElhNGhBOGF2Q1VHTUIvQnQ4ajROU1A3bmVuK0tNOGVaSy91RlpI?=
 =?utf-8?B?djlsTGVOV3JrbTFHMm1IQU55QUpKVHpzeGtHQjA2RFhiVjdvcWZJazdsNGVm?=
 =?utf-8?B?a2RZT1hxcW54VWtHUE1QaFdFcjVtY3VQcTZmU3B6UUlmOHV4dzNVMHRveUFt?=
 =?utf-8?B?ZUVVV2VZYXhKVFNKdUp1VzYwOVB3UVFDRHlOMnpYRXFCUkZRUWY5UVh5cUtp?=
 =?utf-8?B?bzgrZXZlZS9GcGliNHNsZWlmMSttb1l0dGN5cmVnKy9NUEdkRllxbTRPS2lS?=
 =?utf-8?B?WU9yTHdGeUgyTTRFbHMxajJYaVR3VzFuMVgxNlFYNWlWRmZjcndjNUNJcDIy?=
 =?utf-8?B?Tkd6TGdXL1QzWGpOWStLKzdPUmZMS0kyMVlHbmU1L0hWaGU1clJ2ZkFGVXAr?=
 =?utf-8?B?aXMzOTZEb28zQU1ZT3ZGNnR6RjhDbFlJZjVrRjBsVjBwTUdYUWF1RXJNNUFH?=
 =?utf-8?B?TEx5ZzQ0c0NhZElpOTViWVhXZzE2RTNKM0xQTk96L204YnBJek1NeDlBbWw5?=
 =?utf-8?B?UHhUTmYyN2VGeUNDeHZzWXdWVW4rVHNwU3VpRXA2NFE1Vnd5M1I2VTc4MUNY?=
 =?utf-8?B?TnYxWFkwL2NBaFViS1kremZ3N2tHV09SVm9JSmxkS0RWN0FUb3c2aWdoeWlx?=
 =?utf-8?B?dG5zdTQvTkFwb0puaWw0Mmx0S2NyVVp0K3U5Tnl2L3lMY3N6SE12b29UMkd3?=
 =?utf-8?B?S28vTXZhc1VIK25Yc0UrTkdWYTFYZG5wWVMvaXZyejQ0cGUvVEpwQmN1UDRs?=
 =?utf-8?B?MXExd1pSLzlCWlYwTXFMR0d6a1BmR0FlNGtVRGpHQlJoNDNCWDFOWFptdER3?=
 =?utf-8?B?UnJKaFhweXJBYUVFdHlLQ2dxS0NxbDZ5MkY0MlEyRU9HSWtJK05OL1VlMUZw?=
 =?utf-8?B?K1lGUVgxL1JhL2R5YTlOOTFGTFpkQWdvSG9IUDc2WUF1aTdMQkxLdTdCTU1i?=
 =?utf-8?B?RWptVDIzOVF0YVZtREZvRDNRYnU3QXd6VWtzYUt0UkxlbWx2MVYzdHZFdDFo?=
 =?utf-8?B?MkYzcU51czN1ZWxoRWRQRWVsbW9LWk52cmxsTVlqNDNsNmt4V0x1a2N2c0cx?=
 =?utf-8?Q?xX88j+8kT6wIYbGoTpF17rCs6NklSuMF?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MWpxM0NyUTlabVFuUk93clk2ZnF4WHlqay82aC9pT2tZcWFrb1NVc1kyMmh3?=
 =?utf-8?B?WktXRXY3WHBsMW8vVlJibWgrU0loWFdYUTVvZ254RzFJWHBCUmE4RTBtTitH?=
 =?utf-8?B?VUh4MUVzMWdaOW5EOUlSVXY3WmlBc1pCMmV0VDVrOUVFT1l5dlZxTWJiNkNB?=
 =?utf-8?B?NkV3bytoc1VlTmIwWVdZd3VxWkJSUkpzbzZzS1pSdk1Wd3BqcHZXVENSNWRq?=
 =?utf-8?B?Nkp2bU1oak5zTG82V2hma3J4WGZyMTJOUWsvaG1JUHl4T005QzAyeGhEcXh4?=
 =?utf-8?B?dmwxMXU2WmsxeWN1L3g4WFluSnplby9xN0lUWXBpZnEzVFJhTm9oQ3dka29a?=
 =?utf-8?B?Mmw0RHlaeHNrNUhQR0liaGh2WTl3TlNpR1VZMkVaV3BIb3M4OElCN0ZGTmJR?=
 =?utf-8?B?ZGVrM2x3OGpTNGo3UkNqWmpFWGhkeHVWSDk2S0ZMaTI5bDFVZEVVc29BYXBt?=
 =?utf-8?B?U3VPYUc1cUh6UDl6ekZrWFFVeU5JSmlldTJsR05VbmZFbXBldjZrbEpQTnB6?=
 =?utf-8?B?OE9hNHZHa3ZFYU5HVzJHK3BhVzhwRVpERnNVRFNPK1NZMlJ6OEdSenAzNVNj?=
 =?utf-8?B?cmp2djA0UDdXelh4THE4RWtKVTBRb3ZXQVR1YTZrK0ZCWnQ2N1plcmR2QnVm?=
 =?utf-8?B?UzJuN3FiR0FFdis1Z2pBMjJoa2t5RE0vbW1GdVEyNmRaZEd3WjgydVFMam93?=
 =?utf-8?B?TjZGaEI5Q3dnMnhsOUpIV3llSWpyQUVwY1R2K084cXF5Zkt2Y3doRDZPTkRW?=
 =?utf-8?B?RFM2bFYrY09pWG4yc05FZlhzSHJ1bVlZUWpZeXU4dHRaci9SYk5ZeGR5Vi9q?=
 =?utf-8?B?SldCeGpnU3dEcDdTWEdCcSs0Zlp6T0d0Vmtrd3pMWGttdTJCRTI1QWhid00x?=
 =?utf-8?B?ZDRVVkRCU0lqZ3Fqc2pMUklPa2w1WlIxNGtRTlFNSW03UkhhN25lNU5VcDZT?=
 =?utf-8?B?YTBUZnBPZ0hkU1NYaStTbjlkR2s1Q3hvUGtVN1djUDZJZGFUcFlQb2VTRWhT?=
 =?utf-8?B?STVKd3ZHUGNTWXNsMFlvSkw3S1JZYnRSdWpiK0hyVG92U1pYY2QyYzFjQkFI?=
 =?utf-8?B?NVBEV0lVaUFjMmpEUDIyR1BpNWhFNVpNM2kxN3U0NzAvUmFsOGpKUGxRUmtw?=
 =?utf-8?B?dDh3bGRVcURENTRpc1pCbENhUjZPVTMweFNmeHdiRmhUVXBFTTdONVBaWU5z?=
 =?utf-8?B?dzRjV0M5enk5eWxhbm1CWHZtSU1IeGQrUVRBY2l4cnVMZ0FZb0xtb0k2QkpU?=
 =?utf-8?B?TkFzQkwxTVpwZVRaSDVTSDRBY04zaGg5ZnM5T0tzL3RGUWpnMU1tVWxicVBV?=
 =?utf-8?B?UGxKQ0ZReTY0cWFYOEdoV0Z1WjBkam5OYVpUeTlXR3dwcnoyc0Z4OFh4b1Yr?=
 =?utf-8?B?SCsvdzN2aDNlWDVuTVV5Q1BBeXFDOHFjYlhhWjJnWDBsbHp3N01yaWwrSUZJ?=
 =?utf-8?B?RGN0RlAyMUwxOTdlUDlWakI2WHRPc2hKV1ozenQ2UFhaMnBOazgwM205cktM?=
 =?utf-8?B?Mzl1OGR5MWZQWXd0UmUwSncvQkg0YzdkNFhEQnBxa1N0SWFaT3VVeE14bVll?=
 =?utf-8?B?RHJkY3RBMWJEby9JSzJqdFpFdHBER2FFOEtXT3YrTkVFWCs5bkFITmpxZHdO?=
 =?utf-8?B?bnZDR2MydmJ6bUM3aVlnck91cnJKM3RpOUYzMDJEbkwyb1dnRG9HWkFhZUtN?=
 =?utf-8?B?QU1TTjV5YTB5RVVsMEd3dmlwQVdHUUdyaDQ3dVNYWDJYcTdrdHRXM2NaTGRr?=
 =?utf-8?B?SW1hSDB2SHpHQTZ5OHhxNHlLVExMS2lRZHlhZnZ3ZUR5bEJxSU4xVzZnUytT?=
 =?utf-8?B?R2RMQ2xhbXlUdFk3bXMrUlNzdVQ0MjFYSlk0ejBCZGFzbTdoNEIvZU1ha05r?=
 =?utf-8?B?Yi9wc3IxTXlURTc5Z2lsbVI4SGZQL2xEbU9JbmVJU2pwOUlvdmtrY0NOZGhm?=
 =?utf-8?B?NldtQ0xYaUx6VUFqNlY2Uzk4cHpjS3AyVmpWelNiTG1zUlpOY211ZmF4Wm11?=
 =?utf-8?B?L0w5K0grZmQ3K1IyNnNaUzNzdlNZcW85dnBOSFpMWnFmNUtrak9TenVVbmV4?=
 =?utf-8?B?QTNySzRJZHc1SnhHZDF0cjYybGpSdExBQ0pub01SUTFCSHBSTEJyc3g0b1Bp?=
 =?utf-8?Q?zWE3//yRg5ZoQ+/YTazgBxs90?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: face9d8b-0cdb-486b-2087-08ddded4ba07
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 03:58:59.3388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JjyXuY3R9Jp1MYIJBTOSDWLMM77NxGTudnLIt2iPN8DONcUXnux7YuJYhj2lUVGzDzFuEaX6VeWPUfJbUL/aKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7475

The bellow miscellaneous patches enhance the driver to meet more
usage case, such as i.MX8ULP.

Changes in v4:
- Remove patch 1 in v3.
- Add two new patches(patch 1 and 2).
- Use helper function media_bus_fmt_to_csi2_bpp() in patch 1.
- Use helper function media_bus_fmt_to_csi2_dt() in patch 4.
- Link to v3: https://lore.kernel.org/all/20250812091856.1036170-1-guoniu.zhou@oss.nxp.com

Changes in v3:
- Modify cover letter file to include history info.
- Link to v2: https://lore.kernel.org/all/20250812090843.1035800-1-guoniu.zhou@oss.nxp.com

Changes in v2:
- Remove duplicated Signed-off-by tag.
- Link to v1: https://lore.kernel.org/all/20250717071359.1910515-1-guoniu.zhou@oss.nxp.com

Guoniu Zhou (4):
  media: imx8mq-mipi-csi2: Remove width field in csi2_pix_format
  media: imx8mq-mipi-csi2: Add output filed in csi2_pix_format
  media: imx8mq-mipi-csi2: Add RGB format support
  media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback

 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

--
2.34.1

---
Guoniu Zhou (4):
      media: imx8mq-mipi-csi2: Remove width field in csi2_pix_format
      media: imx8mq-mipi-csi2: Add output filed in csi2_pix_format
      media: imx8mq-mipi-csi2: Add RGB format support
      media: imx8mq-mipi-csi2: Implement .get_frame_desc subdev callback

 drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 94 ++++++++++++++++++++-------
 1 file changed, 70 insertions(+), 24 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250818-csi2_imx8mq-59464599858b
prerequisite-patch-id: 508b25bf601f2d069f16918ac44824ef2ee3cd45
prerequisite-patch-id: 8b40bfd4a8fa73b38acd53809f88508a5ad437f1

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@nxp.com>


