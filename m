Return-Path: <linux-media+bounces-52782-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKl/KCmJj2nURQEAu9opvQ
	(envelope-from <linux-media+bounces-52782-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:27:21 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1316C139667
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 21:27:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A6874314081A
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 20:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24B39286897;
	Fri, 13 Feb 2026 20:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TqnWhn6q"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24485276041;
	Fri, 13 Feb 2026 20:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771014355; cv=fail; b=j5qh+plKaznrJ0bRomzReE66wObjJuFs+q9uaNeQa3wnKYl1YYs7dc5TmzLMeZVckyo0MoJD3f4nvNFgMwi1vSK+CzjkB5uwrVsFydnf74iTb2wZE0LOTegOlqYt0KBZZRXD+IAgdJx1R6CWS0CrBSrtGChA1Jnfc1e+qVP1PF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771014355; c=relaxed/simple;
	bh=GnM3pjdWniWMQ0FQGkWWFxupFXQ9z2LdXXy8whOOuRk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t92+hb+sJfjdVs6NUL5J1MCX3pmVRFvnDvBfJWMZMgwgamgJgzuVFRtshGZRwHFYX0XFjboNvlcYqPOPWmkzkbY/IPuDw3+DXesDnFjj2tw+XEOtYnndqvfJUVQkKBIHeuM124EIktPW8Uvg1vsCzTj0Fn2LUnlkKP9ZD2T2DLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TqnWhn6q; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EPKS0E2V5wG/ZWLkLM8Ha5pLpfGBvOkgSGzW5PuNXox/4RDb22oO7GaH/G6h9lY0sRV8XBD13Yq2CvYquo8qX2b0AN0ncX5OwnmVhVtDbW95tNueRE0hnD5my2aQghBkZ5SIFA0fcLeCL6q5GpjOy2RGVRhjVT7b3VNhCG3dNBDDRnra2OIQmwa/ZPuWofZjp1XScAtEaMZ/Tn7+ixkHUeZJ0Rja6VAf6rQom+fwLXHp827yqG4H71LCnzFwHfsI+/WP4byIF9ZJl+iYhSEobbdRTlO4OQPrfroa7c66ScwaLICklOmclE53R62mwnFzt68fseI0wYiFXFuoAOs3Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtGRoZrww3JjMwrhoLaheqZhfcL8YfMw3wPu31vcNGg=;
 b=XbxKb73+s+GJvqRDb6A6Df6RmVBi13DSSYEazXTBtQ80U0p4dmf6dQlTWJtnH1n0venA8d89rQGMg0q0sFZHdU7foKsP6HVXoByRduGyqlr0LaaqgaIE4Ww/vj5D8nq/LAvvFqokejP+shpSF38/yExB9uCNtcbh0/M8VUpKX+T8Z2elUsL8iLF5kTkoltSj17ccMTKVfqk3/IQsqxv2SsjxKS+Me6QCpXhvDq3z+3BkbeoC87gJLWwPsghzTI0HgMwKEyzXMLYlaG1URPUQ2ykxP7DWWMrmHeo6v/nBDrrdElmqfdXDZ2VOS/neOLmNyFmm4/+YpDKTkJS3j+3nEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RtGRoZrww3JjMwrhoLaheqZhfcL8YfMw3wPu31vcNGg=;
 b=TqnWhn6qN65O+3QImWRNi64IX3Ewsw5U7Z9VySwwk2Z5VGU2ieSmnm6xszTBH5GwFMY3clvw7bKXaeWJn7KMNQC+66corUev6ZkGqMwPTdljyrm/TQrSz8mJgc32enLfnX3VHV7d2tQaalUzoyNkKaXTOuLZpFAS9mcIp6qhYD+N5Oq73y3b9yJ+DoK/7pCjjmm3yoiQ4IkMwXmbzzJXGFVFs9xKlaTm7aOvp98gAYwNZMYmUosCvXc0q8CKPI4l6LpBRJwEcH/td0AbM+v7yN9j+jj53PWxJBRyG44KGdv4aJkH0jLoDy3MFx9uHnf/z5SBFrorsWOZUYilQHjjLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9433.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 20:25:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9611.008; Fri, 13 Feb 2026
 20:25:48 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Fri, 13 Feb 2026 15:25:11 -0500
Subject: [PATCH v2 2/6] media: synopsys: csi2rx: only check errors from
 devm_clk_bulk_get_all()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-imx93-dw-csi2-v2-2-8be6039f44c6@nxp.com>
References: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
In-Reply-To: <20260213-imx93-dw-csi2-v2-0-8be6039f44c6@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771014335; l=1420;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=GnM3pjdWniWMQ0FQGkWWFxupFXQ9z2LdXXy8whOOuRk=;
 b=jaPomzadFkqD+sM5YQ9YHjRi+MTQNo1usEm9CecGxdj5XvzoRisQFkN080fSKSLCvmVdYIDkW
 o6vKaVGKg/dCttidkybgLFI9xha6vh1Ge0wFJYJzb/l/OZc7M1/6UF3
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0001.namprd07.prod.outlook.com
 (2603:10b6:a03:505::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b71b29-fce0-4de7-6db4-08de6b3e12af
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?TzlSSWtjRHNDcjhHZFc5dGRnaGM2VzFvZm1ycjUvNjhwbXQ0RFJUWUZUS0Fu?=
 =?utf-8?B?Z2FhL2lFTHkxVlBXWlptVzk2VzVoMlI1ZXNnUlY5OUhLelZ2YWMvc2hscG9W?=
 =?utf-8?B?VmlFU0FYSC84a093TkxnS3llcDAxenNGd1JTK1pnaTRPczQvbHA0Y1I5bGNK?=
 =?utf-8?B?aUFUY2lYcDNrNFdpSGp0a0tBamZobnphajdNeWg1bWt4L0Rzc21YNDNuMHVx?=
 =?utf-8?B?d3B5dURSYmRNWVZIME42dFlrYlhkakFWQTcrQlE1dUplZ25iOHZ3Q1pjZ2dk?=
 =?utf-8?B?YlJ0L2RoanJmSDhzQmM2NmZLWXVFNGFYemxDVFd3R01NeEpCcXZlZWp0S0FX?=
 =?utf-8?B?K3o0UmZjZnhDOXZEV3V2ZUlnRzYrak9BYXcrN1VRWURrdFRTd3QxNlQ5c3c2?=
 =?utf-8?B?ZmpxY2VpNEVZdHJBbUQ4czkydGZYZU8zS0FFUStPemZ0c05OUEpqU0N2VFRq?=
 =?utf-8?B?b21zMVVPUEVQQVZRcmZBdm5WOFJPSmJON1lROFlXa1NtNEJwVktIR0h2enov?=
 =?utf-8?B?VUc5WTJyaVorUFR1U28zcGZaNHRTRk5VQVYyd1dXaThNMTl1aUJETk90VmVw?=
 =?utf-8?B?VWxvK2I0T3dwdlMzQ21JY3Bya3ZvejJzRTRRak5ZZVp1cERYQndwTTVDRHd6?=
 =?utf-8?B?REVsWW04UzBkbmNrM29iS3p3dWVFLy9JbkQvRGlJUS81OVN3dUJYemlFdXlV?=
 =?utf-8?B?NUVweXhjQzM4MG1zd3hRU2hzdWc1VlEvbGNCYXZwamp4UUxTMXkrUDZrbUww?=
 =?utf-8?B?Uk54ODVBVU90dlhrcVk2RzM5VE40SVEvdm9OOGNBc1FkM2JqRGZqUXYwWEJD?=
 =?utf-8?B?eUplMXB3eFpVcjl3TmpKQm5HSDVBL28zUlhoMUlMY3A4MXd4TGJLSUZFNFRY?=
 =?utf-8?B?SWNKM0xTWWJSRTdLbDBLQ0ZmUitBSC81SGJRWkRzamtleUxtY1RNblRqNFlU?=
 =?utf-8?B?Y3AxcExjblF6dnJTeFFGRjZlUmNpU2NFdzdnY004SW93dUlaQnhTRktxSTNl?=
 =?utf-8?B?SDdjR1JNcHZEL2gyVHUvUjRSY1hUdDdJenQ3ajk0VjNVVUVMNUY4djNOcXM2?=
 =?utf-8?B?a2h2NDZmaHVwWnNIMS8wdUJ6NTNacHRGOG5RZGJPd0xEc29uQmlTWDNqcWJ2?=
 =?utf-8?B?UlEwc3FCcVg4K2tmQko0MFZueDE0Rlhub3RtOWZsVjNUbG96SDBNR2ttUkFV?=
 =?utf-8?B?UDFLSlowTlMyeXVOR1lWNVdFZGJpRXRyTTJCcVJpQ0NXVndjZDV0ZSt2RlFW?=
 =?utf-8?B?cHpGNC9BMXRWenduVWhPOEVpaFByWk5Gc1I1dzdicHFYQnkybnN6QlhBcU1z?=
 =?utf-8?B?aFZKY0tDUzQ0YWNoa05XdDlEbkoweFJkZWlXNk5xWS9GbC9OMWZqa1RmZUlQ?=
 =?utf-8?B?QXNOWnRTajZjeUl1T29Yc2p3a1QzdzhCUVhyMGM4OG5RZmdqOXgxMlhZSnNt?=
 =?utf-8?B?aXcwRDFKczA4eW5xNzJjbG9nSkgydnE4RURYMTZNTUVBam9uQXpyM2RwSHRy?=
 =?utf-8?B?NFhscytBelhoN0tnSHhIR3NVMUd5RlRMUUE1dE9FWEZud2tRZER0eGhPU0h5?=
 =?utf-8?B?dGhiR0NYeVg2UkVTU2RCa29WZmNZTG1YY3h5UFpGQlFOS1loZWNVMU1XKzk5?=
 =?utf-8?B?MjJKMWZGNGN1dytEbjdPU3Q5ODBLamQ2YWJkTTJlVFRvc3pnQUtJQXRkS3Zt?=
 =?utf-8?B?YWpFZHZGcTFrQ2I4ZEVpcGJQMXFST2JkckdXemcrTVg0RHRqSEFSeVg5K0Yy?=
 =?utf-8?B?N1JtaklqdHM2NDhWU3h1UDB4eS9aKzc3cmFxV0FLMVVXOGxycVRrTU9SZmov?=
 =?utf-8?B?aHlPOC9vYTlETVJPRERYZFo2dWYzMkVaUlgxOEhrM25HUU8yOW0yM2QrODht?=
 =?utf-8?B?QVBpUUs4cE1yV2tvenFNN3dydkxKQlBONXc1dUI5dTh3dVBtdkxGckdHR2sr?=
 =?utf-8?B?eXVoY1ZOU1ExQklRcVp6eTh1TEg2dE15M3ZFc2hLcVllQnJHWFUrTHhkS3pr?=
 =?utf-8?B?UVdmOFUwMkJiYVB3c0VZUnlRZk9aSzhUMllIdS9RN2pNdmQ1VDhkMDJpSkh1?=
 =?utf-8?B?UDlhUHhrcVVmYXZjUmJIZWNPb0oxS0NlaVhDSEtYckROQzlUbUVydGZxQVJJ?=
 =?utf-8?B?MnROZGl0Y2I2WDdyOTNtWXMxNVp3TmJiVm5yWkZTc2t0dGs5SjhYR3gxVTFD?=
 =?utf-8?Q?en8tGtT3usc/eMcv4MYZnzk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QnExK0pRSktxVWZidlB4RGE1TzN3UXh0SmtXMXpOaU1FaEQybjRBZ0s3NU9o?=
 =?utf-8?B?aW9MSER1bzVXazFQRnZzT2hoL3BKcXVxRjd3ZC8zZ045TVVzdjh1UTdpUitJ?=
 =?utf-8?B?dzJ1RmdCQ3M5Y0lZN0J6dXVBcTk5L3pMeVFhSE9VYTRvV3NvV3RjcnJnejZq?=
 =?utf-8?B?THI4VmlUbmFUUXA2Vi9LYkdUaDVyWTFvL2k2akJwMEhqYWJ5T1FFMFZ1N2lX?=
 =?utf-8?B?VUttbjY3SHZxaDR5dEVQTjhpNkYxenJuclhyYTJJcVpIdDBVVTNuTWZmSlpP?=
 =?utf-8?B?cGxBaDNvQXJQTTNGQ0lzTWpYRzBadm5kWGNZeFJOVXhGeVk0WnJMNjZCSmFh?=
 =?utf-8?B?b3NKZ3RMaHNzRk9oZEhMZkFIbEIrWm4rSGJFMENKcG1YcGc0OGhRTEtkeDc0?=
 =?utf-8?B?U2llMGtJUTdXRlpXMGZQWjM5MHNLMkZ0dU9DR0trNXNYK2ZMS2lQZkk0ZGJP?=
 =?utf-8?B?SlI5YkNPYnE4RGpUUWMyRDlsbU9ITUg2ejJZWjBQWlAyajZtZzFaaHkwYkk1?=
 =?utf-8?B?dHFodk9nVGl3OVNEaE9SaWpMSEYzcHdYZ2c1Sy9HaFNBdHJVTGZ0L3hWZUh0?=
 =?utf-8?B?MEtvN0QxQllWNExwU1kycUdRc3AxQUFHSDgrVG5PeS9VNko3ckk5eEp0T0Rh?=
 =?utf-8?B?TTlRWm9BSGs1MDJtcElrdmFsdWJhVXErMzNKSWVtcVJVSCtOQlVCaENLL2pF?=
 =?utf-8?B?aGR0aWdtS3FXZ2VQY1JVcjZaOW5td2plSGQvcFhVcjlhUHdoQzl6REpPdTRX?=
 =?utf-8?B?azc0aWxNeld3bUFCM2V2WDBWTXd5NUQ4VVJMcE1uRytXZ2dpc1pIclpoWEJP?=
 =?utf-8?B?WUpJQnNyMWNYSDhJMS9mdWlZYmlpR2VCSFVBdUoyUWwwcU9DSzcyTzQrNmhJ?=
 =?utf-8?B?YzdQOFlZZU1TMDZ0d1Z4QzN3elZUOFpyTEdtNGxnYm40Z0wrRmQwa1lDS3Aw?=
 =?utf-8?B?Sjg4ZU0wSmhjTXhNdFl5eDFudGd1d00xR3hFU0lRUGhGdzg0TGZkQUpKQ3E2?=
 =?utf-8?B?V3c0NkpVWDJzVnFPUkFveWh1c3QxdUYyTUlLVmVaL1NOcldiN0N1b1h5cWRF?=
 =?utf-8?B?cVJMSW14Y0NQQlJFb280NmYzbk1KaTkvS0xzVUMxS0F6QkgrUFluSkFOMmc0?=
 =?utf-8?B?U2g3QUxZaDcvMmxUbWNqWmJCeUZVU092Y3pFQU53N0U3aDdRQ1k3MjdxWGE5?=
 =?utf-8?B?T2Q4NzFWZ1g4N2Z6N1NCLzBLN3JZY2QzWVhoOGoveko1OXp5M3ZLZHVBRCtS?=
 =?utf-8?B?Y1hoamxVNVU1ckpZTy83em5jcTFyQ3crd0VnTW9QMzUxaHp2S3dBUXdSbkhW?=
 =?utf-8?B?bURrL0p2alg5YkZYWUZFajlualZUN3ZOWUJQaDZlT2d1bmJIbzZMNDN6cHc2?=
 =?utf-8?B?TjZBb0RqTjJDMm9SSFhzZW5KdFVVdXRleGZMR1M5Ukc5aXI1citQZ2YzUW1T?=
 =?utf-8?B?TWFLcFdwOEVQMGdRQWZQb1JzZ29BWTBMMVhVUzVRb2MweG9KdzFLRWNPY1lI?=
 =?utf-8?B?WmJRYklMd3Ivckt1SzAvZWovOWhGeWlpODRtcng1dGU1YktmMVlRZ0pYTVBH?=
 =?utf-8?B?eHFMVmlrd0NSUU05cFZGdTQvQXdPOWRYMzBxMWdoZ1pLNXlmN2QwU1lWZkxI?=
 =?utf-8?B?WWw4K2szTXIxM1cyK3ZXZXU3VlRyamZjdDc0VkRNVFlOZURzazNxbWZhemFJ?=
 =?utf-8?B?ZWRXNWtZV3pIUENGSzA0QVN0eS90V1NWNExsTjdXRTlVK3g1SzAyQkZ0Vm41?=
 =?utf-8?B?bFJTa1FjUW9HOFNybVYwN0I2QjV1akxXK1RPeXQ3YlFva2J4d25PbVQ2R0Zn?=
 =?utf-8?B?aXlVTkRWa3A1clpxalhxLy9rNlUzY09yNnhDaStyMlJjRUxXdDIyTUF1VGNX?=
 =?utf-8?B?RDBpYXNkSkJOaFBraFA3RHM2eG12VHZYVWJZODdiZjU1QzVEVUJMc1hwaW9Z?=
 =?utf-8?B?b1FkZm9oOGtRR1BOdWVsOXFZUkFKVFlKSDc3SXdQNUh4b3M0dXJEQ04zVmhC?=
 =?utf-8?B?Vk41aHdUUHhsS0xXVG5zY0YxNTdOSmZhbXhkTU1rUUIyMFJETmhOZTh6VlZ2?=
 =?utf-8?B?TEVjSlY3VGlqSllNdGVYbjRHbXFsUnRZdW11bXRLdG8rWlZwcGpmZ0Fwalhs?=
 =?utf-8?B?cUFpUUtTT3MrNnpqaTJVc3NheXFOYWZCLzh6NEQ1bU9maDAyNENBbDFzTFVV?=
 =?utf-8?B?eEJsdHc0aE54VGtGVzA5QWZzdzc0aXpOUGIrSWplVVdYVTkwTk85MVBQSUY1?=
 =?utf-8?B?UmJ4MHdGRGRQWTM4MVFmcFFSOWkxNUZ5TnZRUWVGcStlNHNpZHpwakUwZEha?=
 =?utf-8?Q?OlvfZ9ILn+vmVd3NAJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b71b29-fce0-4de7-6db4-08de6b3e12af
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 20:25:48.0670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KgrbinAIuX0eRkWSCVjUVlBxJG9UcLYf684d86HZYkq0FL2AGN3aUNWefoCTfi3UEFDp0CV72aprr9FU9tcMFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9433
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52782-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:mid,nxp.com:dkim,nxp.com:email,collabora.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1316C139667
X-Rspamd-Action: no action

devm_clk_bulk_get_all() returns all clocks described in the DT, which are
already validated by the binding. Do not need enforce an expected clock
count.

Only check for error returns (< 0) to support more SoCs.

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2:
- remove DW_MIPI_CSI2RX_CLKS_MAX
- add Michael Riesch reviewed-by tag
- add csi2rx in subject
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 0cc892f4a1b3c6ce575a5d4fca7acf7057f7b7f7..f03fe01280013bf9a832433c6b06dab691bf8f4c 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -40,8 +40,6 @@
 #define SW_DATATYPE_LS(x)	((x) << 20)
 #define SW_DATATYPE_LE(x)	((x) << 26)
 
-#define DW_MIPI_CSI2RX_CLKS_MAX	1
-
 enum {
 	DW_MIPI_CSI2RX_PAD_SINK,
 	DW_MIPI_CSI2RX_PAD_SRC,
@@ -630,7 +628,7 @@ static int dw_mipi_csi2rx_probe(struct platform_device *pdev)
 		return PTR_ERR(csi2->base_addr);
 
 	ret = devm_clk_bulk_get_all(dev, &csi2->clks);
-	if (ret != DW_MIPI_CSI2RX_CLKS_MAX)
+	if (ret < 0)
 		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
 	csi2->clks_num = ret;
 

-- 
2.43.0


