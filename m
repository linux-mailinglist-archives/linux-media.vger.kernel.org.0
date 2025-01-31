Return-Path: <linux-media+bounces-25512-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD84A244DD
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 22:38:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E7B71887BFD
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 21:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24A821F540B;
	Fri, 31 Jan 2025 21:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XhEhXQzT"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1249C1F5400;
	Fri, 31 Jan 2025 21:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738359327; cv=fail; b=NnKqJO5JEUOqPvHZKp8vfZ+HWd2HNeKVmz8GaH3B/Q13spWt14rCtex6exCYkJq+88p7qT4JJHulHjBgTpYPVucYvMQvkrUONqSKQCehgmxnPLox5OYuSlnytCWaPosYLBhhqZIeKx9CO+Ei12iSc0fM/9/FIU+4wjDnzE7h640=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738359327; c=relaxed/simple;
	bh=SjQCJQbPkFlQy1iPkQF4C3oVRZE7u2ps1eW2b/eoKfU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hb80gPS25yirEXEum2RgSotPgv5gn0MS/L9Wxq0CYRphurkzOvyBHJ9UzoZSOhQszfi/7qIpNeT5RBbCaHzV1hDFKYWkDoudESYg3CnjXwg1m6deg/LqfjirkTGf6aje7yJH7OKeWvQ8VF/UB5USdFwND+b+MxbNS0OV+vaKlXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XhEhXQzT; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fI6ojtDTtf0CZ5fGhaiuy8F4PJvgqfW+KumVIWkcP2mF4rPrC01qG941bv/IJeHDdCgXAx9e6MXatIRp39nTdOqxcIle+ETp9iBKMG37LHkRWfC9HLQK1DVPMuK6Cv48kLuQn+k2VSH4t/Q5Snk49agfZc9OrjVYZ0km4um/kVa/z23qybHEBsySIfduRdGHAtp/tNb2lVEBFpBdNvUYi3EQRHk7O8i493OY8zerPJlIoiwc1u73R+lH467EHBzp5Gda+p8dghudLMt2lvu4lBrsJa5QM6q5U/ZGVPdFRZUhyV4LKv7Gj2EhUmwk+81+0tH0xnoAjrzzghHC++vHMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUUrHKl8sp8ZAl0/FnUc0w5Ky5lXM4d9Tcv/Ccl7OEs=;
 b=LKa9QHNABe5YVod2Adi5xKiEZZ+XZsugzwVNBBUfxZH3d+e5sC7m6ROc1LtiBfHai1KL9KxHXZTjA7DMWwrM8jTj+v53XM7/7urJIkBig+KcOCI3ZxPxJ4WIS76ve7eAbmDdAw01WN9ASy2ybTDNfD/OGLeCmxAvQDbWM1i+WBb7u9sNvJ9FSa13tjJpOMh8alKu7S5a4RkQPe1n2fnYpC1mRIBtNQyoYKJ0kVqC8gbNgQuMd5JFB0BlpWDkkCy1NPwqhqtSIfyn5WTx0zdRkulr87qTjuHe5pRQgNIB8+tna+IJnizhSOSWdGYY3HZWNpjbZSXS2zx/XFEeX0hWnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUUrHKl8sp8ZAl0/FnUc0w5Ky5lXM4d9Tcv/Ccl7OEs=;
 b=XhEhXQzT7yhxnN9s1wdVU764uGsX98Bvme3nGtlHciqe5y5fxKplmCRnuG7jy2a0xoW7n34RcehRvSrOvyTiF2za3SycWPkTF/9dft1Nf80tKeTGFfmHPbeCwdTo5tsEIquyUjD8j+1ZAyxv3ZqT1qBwl9eK3bdq/YmAafKh48RbnxpZ4npIoDzehXxWfPsOgw8Rnod9zYeUk4um1/ww6Guq2pbw4M37a515NvI1UqlA0fXGxx93auNG393Lm0ZnCv4M32LjTcro/Qu0aCAwc7Vcm8FwO4TLY6Td1ojCJONuA2IOfIHWtBK1pJ1Sjq2e4YBa2T99KKnr/odzNGIPeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI2PR04MB10980.eurprd04.prod.outlook.com (2603:10a6:800:274::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Fri, 31 Jan
 2025 21:35:22 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8398.018; Fri, 31 Jan 2025
 21:35:22 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 31 Jan 2025 16:33:59 -0500
Subject: [PATCH 14/14] arm64: dts: imx8q: add camera ov5640 support for
 imx8qm-mek and imx8qxp-mek
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250131-8qxp_camera-v1-14-319402ab606a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738359234; l=12246;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=SjQCJQbPkFlQy1iPkQF4C3oVRZE7u2ps1eW2b/eoKfU=;
 b=Gm9mlV/4zUY59RFj4AcVudzGXx8aoNkZeR/DGomkLYg619CWXqt2+4tigVaXh5+R12ed7ZV1q
 gW/md7nIO9KDIz+eS+pn6bK6FyQUxbv6wkzT10kXZ43m70VbenaLTP9
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
X-MS-Office365-Filtering-Correlation-Id: 11db3385-a868-4c06-2f43-08dd423f2a78
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?V0hKeE9TMDhsbjY2VkhZaUxVR0xMMmhDalFzWS94ZmRWS3NxY1MvaENNbjA3?=
 =?utf-8?B?Y1g0bkxJUVNNTlBCc0dNdi9xNlhxckROQzNqYzJONzU4eUdHUWQ0N3c0Wm5m?=
 =?utf-8?B?TGxSanFycFd5TnVaODA3TmxXYmRYbUJINjR6dDFrSUhwYWIxRXRBQmdZYkJz?=
 =?utf-8?B?ZWFVcmtuQmN1ZHQyeGZReFlodWNzUGhNd0ZTRkVTTzRQeDFNcDhlK0NsdFl5?=
 =?utf-8?B?ek1FWGFmYmFaKytjUGNKTTRQUWJqenJVTWN6blV0ZmxWN1FqVmx2N3ZBNDU4?=
 =?utf-8?B?NmdGNFhLeTRPalZZZUZIREQ1YldKekxlNkFaSFBjdVd5QStZeHNTUDFSc0RO?=
 =?utf-8?B?NzJMVEhodzkzWUZXaDdwbkhwTjd5L0dQNE9VS0cvdFdWSGR3eDg1bldHcitY?=
 =?utf-8?B?NVJDa0I4eS9raWJ6S0ZQdXF6dGhrZTdMQ01jUUdzcVkzSTFYeGo2TkdXdXhn?=
 =?utf-8?B?ZFZMR1JhY3B2VDRvN2lYUkZkRjlERllLWWxpdjZ0bkVNNElQU0xrMExQVWht?=
 =?utf-8?B?bVc5MFZpZ21aK25vWXpuRDlIZkdsUE96UFpNbXFnWWM0azVtZmhKOXJjNWlu?=
 =?utf-8?B?L1FHYWZtZUZia1BHL3pCVW54cXRLOXBaUU1nZ2JzR25nanNNNGM0UkVWVmNw?=
 =?utf-8?B?OG1GRGMwRkhMOGlXdFBNeHFHMUJPdUpYTUVjRDFWdXpZRkdzMGgvSW9VN3ht?=
 =?utf-8?B?Q2JQSEhZbHVzQ2g1U011ZXJ6SDhXeXBUcnVyZTdYTmRuMk5ROWRYdDIwNDFB?=
 =?utf-8?B?NWlvU01odytHZUN0RlpVcnZzSmhBdlFBUDVVZTJ1dkNmaUx0cmpKeTY5akxr?=
 =?utf-8?B?Q0RaSXRzOXBMT1Q2ZURJSHZtaUxmc0NvSkM3SUdKTmEyMkRacElOY3BTZjZM?=
 =?utf-8?B?MU54Q2hVMUk3Vm1CWHhZS2lWbXRYa0gzK1RaN2VXV25FRlVZWHVqT0NLblpT?=
 =?utf-8?B?bStDeE5ndkhwblRpOUJTQmVrUkZERCtXL3laL2I3Si82UU9pS2VSY3Noc29p?=
 =?utf-8?B?ZXZ6aVAzelpYdDllakt5am5FMndmc1lUSzkxMTZramhOdTVsSEp0UzdlKzVQ?=
 =?utf-8?B?ZW1WNG96UmVBNFBnTXFJYTBYYitLTTUwZ2NXUkdGWGZGYllidGFNQWkzc285?=
 =?utf-8?B?Z3I5QmZTWHVNZVdxVGluNUhKMFhUM1RMRFNmMVpPNDFEUjYvNllhRmRUTmha?=
 =?utf-8?B?VmtCRmJBeTVoT0JaM1lPZmw3M3N0TFlkU2FSa1NQLzN6SkdYSGJBWU5mN0FO?=
 =?utf-8?B?Q3ZzMFBISWZHb3dDdkdrYXlCZkZLaDV6R3hzZ2VhTnVXRVpaL3ZMOUlyWmIr?=
 =?utf-8?B?U1NXUXVlUlJWRmR2UmFOa3gvZEVOeHlTR3VFVWk2YWdJM0NUNi80bUltSnNU?=
 =?utf-8?B?b0d6SitOTXNxQ0RLSnFMQUxKZHlCYnhXUkdhcWwzTHh6NTBQbnJpM0xUTTRR?=
 =?utf-8?B?S1FIVlM3WHpWaWdLUDAwU2wrbDN0TlNKUGIvVzR5QlVoMWR1TkZrK3BNQWdm?=
 =?utf-8?B?ZG1DY3FkTkRhZmN2R2o0Zk9YLzRCUGlSb3R5SllkZnlHbnpPeXljekNnMUYr?=
 =?utf-8?B?SEVwNWRZN28zMUpmSzdCV2d5cEZiZDRKSWVSSnQ1MkJ1d1pyeVNYMUNCZy81?=
 =?utf-8?B?dmhJU2hiTGJpTko1KzdmVzY2azBrNEdxRjQ2bU5tVWFOZVgxVEVBV3A4ZEp2?=
 =?utf-8?B?TzZJTGsvdVkzNjZCZ3k4SGV2L0U0NWtybVhOby9Dbk5FbXo3dC96N1F1VGFD?=
 =?utf-8?B?Sm9kcmN5d3AvR3kzdlBKL3pYVmt5WUhCVlJ5OHZsNVowR3htZG9icWtjQlBn?=
 =?utf-8?B?TUR6OTJSWXhwSnQ5c2tIbmtuNzhRdHdOTmcvZG53dTNtNWhHMUlPQXdzeTMv?=
 =?utf-8?B?YVJnRExFMmZlM01MR29zZk04dkt5bTlkTHpFdUd0cDEzbVV0SmVicHppbWx1?=
 =?utf-8?B?eTQ0OGNTWFNESFg0c3lockNpaGdBSzVEeEJCQTdyZi94N3RwUnhad3l2c0tU?=
 =?utf-8?B?L2wzcHJHUXFRPT0=?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TGNQM3B3cEREVUhNTTByVUlIbkFVL2Y3ZEdzTE5HK1JXWmpiQ3l0MTFvblc4?=
 =?utf-8?B?S1U3Z0dkNG5TQVdiMFE4Ri9iNVJORVp6NHJDNldZcmJDK2U0ZFhNd2JUcHp2?=
 =?utf-8?B?U0I4WDRWalQ1TVVSTDVCb3ZmQkhiMzFTSndhaC9MUEUxU25QNTFjamo5NDZI?=
 =?utf-8?B?UTJ6QWtrYURjRjdhaHZ6M2V3clVhTDY1THMwMUpxSE0wQXBXQWNWK3lROEhn?=
 =?utf-8?B?eDFaUUJGcUdaNGhvWTFoZ3l0S0tONW5CZHRWc1V6RU5zU0VmUVJRVTM4VHRF?=
 =?utf-8?B?ak1MdWxMbDdta0s0dWRNQitkbHYvTXphdDVDWHJIRnQ1QjRPR3d3WXB6Qzcx?=
 =?utf-8?B?ZWRBRlFwQWxMUmVnL252R3hmL2ZPMUJGWW1HUHRwTGRYMXNHUkQvVE0zSXh3?=
 =?utf-8?B?dGtaeFRmM3dnMG1zSlJ6SzRibEpVT1NxRnNOUnlqWE1ZeGxFZnRnTmd2NXJE?=
 =?utf-8?B?dkY0OWg1OEtEREhDZ3JMbkdzNXNZTmxlVmFXVkJnTGUxRVNwMTVucVMxRm5E?=
 =?utf-8?B?RjVXeTBIRWQ4ZzZOTWx1cENiSnR1RXhpY1UrdFljU3NvdlpJWU94dDh6RUVp?=
 =?utf-8?B?VDFwY01ScFhTNHh3TmV4TFF0NVVKOXR1b2k2SXNhUjg1UUdzUSsrc29laURX?=
 =?utf-8?B?WjRrTnlMQ3hVb3IwOENmMk0weTR4Z3Y0TlA0YkYvSjBUVDFHTHpnSkJPdjBv?=
 =?utf-8?B?bGhWcmtTbkE3bTFjVnV2Y3hzbG9lR1pVbGFndUEvMkQxcnJ5U2ZwMkxDTDhk?=
 =?utf-8?B?Nm9ZSmdWeE14bjNKaHJ3eWRlVGx4d3ZlcFZ2UDdsWlBTMTAyS2hSenR6NHB6?=
 =?utf-8?B?SDIvMzkySWttUVdxOWpkSERrUTk0emcvNEZJUURUdGhkbUJ3R01wSWVnSGNG?=
 =?utf-8?B?REFaM3I5ZVdSQk5QV3JnQ0JFT0VqODRVdTRwSUJVbjNuUDE4NzdjNGFIempX?=
 =?utf-8?B?UC9QL3I2Ny9vM2dNcENnRUlpMERMVHZBNWJBOU9HcEkxUmU1TEdrTU5zemJD?=
 =?utf-8?B?TmkyT3pBdFFMUS9za3NCZGdESzlvVitVZ3JJRGZvM3VJemZEUjdxOUFUU0hu?=
 =?utf-8?B?QmM2TmVmQmZmOUdEZmI2YUtXckZrL3RUd3dmcE9YbDYrL2psdEMwSGx0Zktz?=
 =?utf-8?B?dWJkQ2xCcEMwSmdvenlEelBFZVJoMVV5aDVFR25tQ3k3d0ltTnRhQnl1ZVlB?=
 =?utf-8?B?ZitsVUdUL04xYWN0ZjlUVmxIam1KS2NremFwWThyV0ZHWVVZbk84T0VFMWE2?=
 =?utf-8?B?U3BKMHRUa01LKzI2L3dqeUEvSitCS1p0QTRQRTQ3clIzTmg3MkJZL3VwUkda?=
 =?utf-8?B?aTRtOFZ5T2hPNWxqNGhUNVAzdFhwb3N0d1Y4b0N5NXk4ai9CaTdDYk1PRFJq?=
 =?utf-8?B?SkNVenRtS04wV1lDNDQ5K0VWTGFMdDJMY0hqMUI2U2RvYmhldDNXQnRURlEw?=
 =?utf-8?B?ZnJtM1NvVklMQ1BpYit5YU56dFVPaS9zVk1uaDJzS09ZVlNCKzdUc2ViUEUx?=
 =?utf-8?B?VWltMTh6N0lxY0EwYXdJMnZ1NGlwZ0dEckpQVU1nSEdDTmxrS3NwdlE3ZVF1?=
 =?utf-8?B?WGNpalFwbVpFdnhDN2VGYloyekF2UTZ0T2NQaDBhdEt6SnI4UHVwMytpSGI3?=
 =?utf-8?B?TlU0MTlMcjJ3NlBhd1l5SHgyM2VkSThpR2VpYy9RV3lNN3NMWHh5VmdSYUJP?=
 =?utf-8?B?aDdFcTlaWWJkYWNqSmoxNXJEM0pZNWZhQUx4c1BYcUlabnpWWEFOa0g1NDQ2?=
 =?utf-8?B?bTJtSWt5NGE0RnI5RFV3MlhEcDhPN2NSTGRVYWFJajE2ZUVSTXdyUjJlanJp?=
 =?utf-8?B?dnl0VHEyRlVqWDIrVmlnbUtqSnpZYm5zK2NQdlk5UW9jWTJ6bDFFaTdHZVV1?=
 =?utf-8?B?b2FFR01uVXUvUjY2RmFmdlAxOERoYmhmOStsWVN0OS9OTUFrRjFpZU1Gd3Mv?=
 =?utf-8?B?RnJsbU5IbEhMcjFzQnRkN0w2K0M5Y01US3ZmRW56VHpUNmczUk9NWVAwcnUr?=
 =?utf-8?B?VHZHYSthYTc5UkpEY0hiQXNCbmtnN1RKMGRhUFdYQmNJOG1JaVpPY3JTYXg5?=
 =?utf-8?B?YUp3VGFCQ2h6cWd4elBwanI1OTE4ODdRb3RYRnFYUTFma1piaFpnZkc5dXQy?=
 =?utf-8?Q?pVLs=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11db3385-a868-4c06-2f43-08dd423f2a78
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 21:35:22.0312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ax2m2wcSiJz6OWnTXhcR9qy6rgLdXJaC7/zZ8hYcxQFnutYI7axpbUx6KIpBa7DG2WARtvNNEALyIWDBihEmRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10980

Add ov5640 overlay file for imx8qm-mek and imx8qxp-mek board. Camera can
connect different CSI port. So use dts overlay file to handle these
difference connect options.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
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


