Return-Path: <linux-media+bounces-42172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 951A3B5130B
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 11:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BD0644E21E3
	for <lists+linux-media@lfdr.de>; Wed, 10 Sep 2025 09:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BCE25DB06;
	Wed, 10 Sep 2025 09:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BZ/+InqD"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013038.outbound.protection.outlook.com [40.107.162.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152F3164C7;
	Wed, 10 Sep 2025 09:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497514; cv=fail; b=lZuNJz2Qrqi9jyzs1lL6MMggY2QhmBU6LJjfxzxeG7UZ+/3c8lDXIEhYtVYm2yK2SH8OiqJkN59NPXOj1sbEphI4fhZ466Wu7GWckLwzFOLJBj1AAKjZj+ZxSUmlzcQEApzRzAOmr+B061YgmbxQb+IIau/PnPyyx1IDTXrMMPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497514; c=relaxed/simple;
	bh=gtCk1hvJL9/iqKtEBIenOrwmKvlDEjsKgF0zn07vSk8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MphTTY0hQ3HAng1FrDttDe/7Vqpfngyxigs04LR3uirKr67NvSq3zcchYBBltVsBT3+VGdZqvGNEt8FU5IEWOXtwUn0mW2eXQmhbhGrKhfKfM1oIMLTvulU1dqmvsJeq8w0QFXollsbAQMUV/htvFyOl0rL0HiEzHFtGZOwJocI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BZ/+InqD; arc=fail smtp.client-ip=40.107.162.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdmlMFaJ03b9Wui8fDfnYUv/odOfVWUga05FJd7fQBK6OVAhW15w0xPM7RGn0E37FMtV4i4gV8rPdFGhElBguA8xAX45xKcrtbHqF+l3JXRGBh0RCbSEOkVXs/6igsvh0zv/4ucJBLrULNPzQpDUcbLx5rIdNMyr7WF3aHwORVKYDBC5RdBURcW7wydQsZ8hDY1R+uO6ipJTSn/P0pucqpcdvfLqqcdYPDX6Kh4XBg9jPGo9JzjDGlfzA15pzyrHIAXyaSDkbzRGyufqHIsEa1wFH/E0DGvG3SLTKgAvWPsrT5/cGafub4uoLwKUr++kKdmSVC10YqaSoHVxeqsE5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkV0kVVrI1RoKJeasUbegnFznuNEZiMyo9d+O++2eZI=;
 b=kUEftzXuuRxTXJ/U9OC+tZAW97LxJeoijr0Hu4SeAzAgahFsI7R4Eg+mdVlJfToI12Z+Y9N4fwr/XhzuyogykM+IPwnHDK4euOeUCT2lOguojYppLWoekyKjZmT6n73x6fk8Ph9v6IpfuHrPDw6QxGGZKt5k3kQXEnxf/kSewNkw93xKL3AUhR8w7wMhd3m5TvriE3CeAe3mixIGqVo/1OcxglN736jGAuHYXdjNuQ8eoBEkb51aSo0fXeQA//A8fW22Nznfq2YdDe6shYindDKvI34P1gUMzZ0XAmTEPQ2V+sj8Ywq7t8fk6k1ll/niMF+9kEU57r4DGwIc9mOytg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkV0kVVrI1RoKJeasUbegnFznuNEZiMyo9d+O++2eZI=;
 b=BZ/+InqDa8GQSEMQ35faUtkwS9zRjzmm9eZYWirQ3uY0D3K4tDE7Fvg0RXUwZPDe9pqA6Z4iFXp2XaKHzhvJL27tq77xwByHlToFpqY9eS8oadnD0q3A+EAaMZu+2ra/w2JgY75Iiiv3ps9OM4IGei9IDM7Pj0awURQbf6EwQwVuPWmEIf2YGV6kLdTJuHG5UJ0yS1efnugTVAwx449BQiNo3PXvZWZOPIJWcd8sdKQnT8W/UtDBQ50jdn/nyd6SzHcrxBj5S6zwah4IoztTsDDWmKqBXX87c6izJ9nKTYET3KbHX9YHJmYpmutm/RvbmlWnNI3vZ5L1H22OuA6Zow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV2PR04MB11834.eurprd04.prod.outlook.com (2603:10a6:150:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Wed, 10 Sep
 2025 09:45:10 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 09:45:10 +0000
From: Guoniu Zhou <guoniu.zhou@nxp.com>
Date: Wed, 10 Sep 2025 17:44:40 +0800
Subject: [PATCH 3/4] media: i2c: ds90ub953: use devm_mutex_init() to
 simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-ds90ub953-v1-3-a7813ffbdf11@nxp.com>
References: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
In-Reply-To: <20250910-ds90ub953-v1-0-a7813ffbdf11@nxp.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757497507; l=2417;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=gtCk1hvJL9/iqKtEBIenOrwmKvlDEjsKgF0zn07vSk8=;
 b=nRXdT7Qon5oYd0Z+dT6pNFoLj+P7o1RORlROvBBZpB+rhhHv6QzJitgJTDmnFV1v3NtchpyG0
 BL9De6mBeuUAYcLNyaBej19ZaPUJbebYmP765GTmELrm6oSvn87X/5g
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MAXPR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::30) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV2PR04MB11834:EE_
X-MS-Office365-Filtering-Correlation-Id: 749fb203-52ab-47ed-2f38-08ddf04ebb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|19092799006|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cVhGcE93WXRsb0JSdDYwc3l1MDVJeUZHYzc5bXk1d1laU09xWk84K2V2eGNr?=
 =?utf-8?B?Y1dvK3hXckNzRVUzd0VsanJOYnZ5YTJPNHpxeGFkTnlVd2R4UXFNV2dlZ0pL?=
 =?utf-8?B?Smd2MTYzSWE5MjJHTlhlMUJhMnl6R05SQitqRi8vM2JnNWU2Nmg1bkQrbHpZ?=
 =?utf-8?B?bzJ6WHVrd0MyZy9CZUk4RS8wUDM0MXZ1ODIyVWVFd3ZzbEZtbFdHNk16S3A1?=
 =?utf-8?B?NGFSb0pZVmJlRmxpK1VVN253S2R6R0phM2dQTmJpOTYrc3p5enY4RWRLbDRu?=
 =?utf-8?B?T0lBa3NjRVVIcHp6Q0loZWhyKytOVTl5YldPR2J2VkNHWGF2SG1aYjEvU3R2?=
 =?utf-8?B?Wno1ajhnR1poWmxteWZWTkNpUmNtaUhYVmVKcko5b2RRL043b0IwUXArd21M?=
 =?utf-8?B?ZUF1b0gvcnRqM0FJUEpzOVFtZUxrTUVtNFJOeWtJRWpaRE1aQlQvb215ZVJq?=
 =?utf-8?B?UFNSd2p6M05ldHpoNGZJYWxXdC8wM3VhSWYvL0NSRGtyaG1aUHgzdTM4amEy?=
 =?utf-8?B?Q3JoRFh3MitGaE4zVWo1SW9VRE85aWNsdlFheHFjT1hZUkJVREZuaFg5OXZw?=
 =?utf-8?B?ZVBVWi9nQzM5blhFVlZIaThQZmFGeHdpMkNzRVhKb1FlMjE1MUlHYnNWaE5p?=
 =?utf-8?B?cEhURWRTajBGVGNpbjNlMkxXZzdlcy9acU9QL3I2d29LZURaTzNmQ2ZVdVRK?=
 =?utf-8?B?dkRiTG5NS0dKeUU4Vnp5eFBkclVReTd6Zkc1a1l4QUJ0Wmx4MHVOVmMxMG1w?=
 =?utf-8?B?UUIwWG9WRit5Q01oeHdhMTZBVGNkdS9XNDliaWpVUnRBblAzSStSQUhHek12?=
 =?utf-8?B?U1hyaTh2Mld5Q1d4OW1OV1ZlMWhsTUlsY3dhSUQ5emxGNSsraWxOdnhUMEdT?=
 =?utf-8?B?enE5dnJsdy95TmdDbWVnZWVlejcrNUV4a1NOSTFYSUdraDJLelhMTDdocEJB?=
 =?utf-8?B?MHplTHdJcklGMTIrUnk3SHl5Q3dCNzA1cUR6K284a2VFWk9qK3lxZkgzdjRx?=
 =?utf-8?B?YzNZWGxrcFBzY2g2N3dLWGpMd2gwUllEdjhyLy83dVBKbkhMdVlwNVJKcmNH?=
 =?utf-8?B?dERlNTUwMkIxSGp0WmRMc1dwY29mdHovdk82Q3NLNitFME9oaXV3WWZyZ1Zy?=
 =?utf-8?B?S2l0eVdZZWwySGRiNm5TNXFUYWlsN0hTWEIwZ0VMcFRyUENZQkVEdnUzb2hF?=
 =?utf-8?B?Zjg1NEI0SGVYckpWc244VlpBRDhueTRvTnhZMW0vdDY0V2EwY3dSZ05qSGZP?=
 =?utf-8?B?MXBZcmk5MGQ0aHZqak92TFc0QnFpVVl6eENRSW9kOFRDcTFWbHBCb2dUNitO?=
 =?utf-8?B?RktPNDBZWHNYUjRXR0ZFSnJ4YUZHNjBzTmw5ZzlLNWV5RE9jRENjQVJPejBt?=
 =?utf-8?B?cXYzemVvWm92STErUGhBQWtpQko3ZEJZSmZZQXMvK3EzRTlBVE1WaVpqN1VJ?=
 =?utf-8?B?eHk2VXluZlFjVWFmNXB2ZGprU3JBMEJaR1VpTkxyNGNPbEhYSUxNOHpzWkFo?=
 =?utf-8?B?MlpzK25xOU12a05EcmJESWFucDE3OUVEdTVvM0FkRGprcDFrNExZcmFRZGVJ?=
 =?utf-8?B?ZzFTS0tJZ29vQTBBT212dkEvMjVXUSt4QTlOQldLSGd4NnpJemRJWjZ6ekZK?=
 =?utf-8?B?dkNiVjFFTm4vUjhLSm1mY3JvNUlUUkJmWVZJKzQ4ODRscEh3cG1mU2IyaFc2?=
 =?utf-8?B?TlNBQzAvZk1MWDE0dm1HRks0MExBZGJBV0lxem5RbjhnNzVENzJEa0VFQThE?=
 =?utf-8?B?Y1dWYVlBLzNPcGNHWHdtRzRzY1dja3J6Y0lnMDAraDczblBZcmhUSXowZC9B?=
 =?utf-8?B?aWtzTW1meGFvWEorWENyTVB2VERnbzFjSFREMUxLZWw1OHo5V3ZmM1JVL2th?=
 =?utf-8?B?K3NqNThSSEJFYWk0SllTQjBONHpmdFZOZ2cwKzJSZ1pqR0pJOHMyaHVLOVZQ?=
 =?utf-8?B?UGNEa1lDcjFFNlZxMUVhRW96V2g1azZNR0p1ZFBKdVBTVGR2MUpMdnJSMHNI?=
 =?utf-8?Q?JSdt1NzRRMsRul71qCuI4RVhnGM7ek=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(19092799006)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WU4zYzZEcWF3RkNPMzJmdm9MTDhpZko5cWVzZ3djUnVHUDFwSE5mUE5FTWl0?=
 =?utf-8?B?aW41endPQ3hhdjdHK3NycFJVNzdQeUNCVFRGbW9KbmVlcHZLL3M2K2NXZTRO?=
 =?utf-8?B?N21LNzFPa3BNT0dySzFBWGtndjYrN1pWNjlHa0dwNDFnNXp6NDV0UW15STJZ?=
 =?utf-8?B?QVJxbENkNHNBd3RldUxlWlZ1Q0RYei8rTXRNRC8xU3QrWndRUXp2QVJQcUpJ?=
 =?utf-8?B?V3IrclFXMVF5ZHYzb0RXZTJNc01Sdmg1ZkNUaGlLMktsbXVMemJDUmZhUVps?=
 =?utf-8?B?eGZSaWRlTnMvZEVRcXZleU8wcUtWd0ViR1BPMCtuQ29lYXlHV0NlTk5MR1Fn?=
 =?utf-8?B?c3lsdEY2eHEzWStjSkJ4R1YySzBVc2xXKzFxdUtpekduNGZKdmlRMllZN3M5?=
 =?utf-8?B?UWxMdVp5czBDSVRjQTZMZ3Vwd01kVkhJbXVBYU94dEJzbnBDQUVqWGFtdCtM?=
 =?utf-8?B?bGhWV05xZ2FKRDhORkFnVThOOXJ4ZHdUMkxNcmx1ZEFDeStIWWtBMWxZRFk0?=
 =?utf-8?B?Wk5YRk5panBkeXlydFREcElGSysva1A3Nkd0YW5maEVFWEgrYXlQZUllY2Jy?=
 =?utf-8?B?SmQ5M1hrU0tyUDdsL2IvakoweVR3WVhKVXJuazFUYjJFdEQ1dEF6U0FhSld2?=
 =?utf-8?B?K1ZFd1RoVWg2dWk2MStVTEpucjZDbWkxdzhhTlhXREVULzQvU0ZtOW9jUThP?=
 =?utf-8?B?SFlEdUlOdVhyemdoOTkwNVRFWUxMamhxUU1obTdhSi9JR1NhUzljNytBNXJa?=
 =?utf-8?B?MkwyQ2R1Smk0NVNTbzJjT1VsOWN1ZFdFS0cxWFJLbkhZT05KcXMvRHg1dGts?=
 =?utf-8?B?ZDlyYkxGaGxNR3lrVzkreC9sdUx5ZnA3bXQ4ay9tTkxyeDRUUENHQ1lENjA0?=
 =?utf-8?B?MWVlVno1eDVkaGlSRW44VHhuZGNwWnExL1k4aVlGdjM0dFI0akQyWTlpM0lt?=
 =?utf-8?B?UjhqSVYxaUFiTGxySWVVRzA5UHFqYkhiTVlKYWM3SCsxYjR1N2g3VWFGNVpS?=
 =?utf-8?B?NWNTNWNHWFZyYmUybzMxcXpCVldCd01GN0V1SUo0cjRyUmphYS9FOFQxS2o5?=
 =?utf-8?B?UzljeUltakdPNG4xNlptZ1ViSTQzcEJGV3IyV3hLTUxUM0hIUmw2K0VYZGJp?=
 =?utf-8?B?WWVVUGdudEEvR0ZyeCtBR0xQRiszQVJTaWNhYmU5ZzV0Qnd6QkpZclowT1g5?=
 =?utf-8?B?Nk5HUGU4Z2VWWm45TUV3ZFFaQ1RRc21FYzUwQit4YkNwNDVuODIzWE01b2FE?=
 =?utf-8?B?cjVzeDdxYnN4aFFYMTIyTzJNQUdsb09hN3FwVjFDa2RObDNzVjV2aUFnaUZq?=
 =?utf-8?B?TVQ2OTAwNVpSSXk3ZUZmU2JEN2RDQWd4YWlSY0diL2RzcnBMb05kM1pGZVBK?=
 =?utf-8?B?bGNmQ2RXOGpCOCtnZFJET2g1ZkJsV2wvWEUxQVJaelRFZW5GZytnS0puVXky?=
 =?utf-8?B?VTM1dEJiY0FYTG9mejAzanVwWVlyWU5YNVUzM0hKRGNDYXVIQi85eXVDVFgr?=
 =?utf-8?B?T2pVM1pEM2w0TURXZ09qRW5BdFpZSDdBekwrVFBEQUU0blpFemJxWW1neFc4?=
 =?utf-8?B?cjNXU3VTQXhBUWprUXZWL2loVys5SGI1SW51dDZCZEVJYnNUbmE3NVZ5YThu?=
 =?utf-8?B?anhQbC9udm1PR2tNWHZFWkZ2UytjTFNUWVJBNU5ETGxjcndUcHpneVdSdkdq?=
 =?utf-8?B?cGpwakZFek5UZHVnQ3MxL3gvSEx2MDdFM2t4Rk1GZHRsZkx3aEdVQXhUUGtt?=
 =?utf-8?B?ZlNzVTdQdVZab29YdkNYbWdyL3RWQUpYenFDR2l6TlBKa1I4MGlYMGlBT0lq?=
 =?utf-8?B?d2lBQUVVdmNVc3NvcUlzWW5mV2cwN01wZkkvUFpMb1NFSmVCMDl1dzdWSlRT?=
 =?utf-8?B?cHNrelNCWmU3NlFXcFdWR21saW9lYVBGWVNBbTVOb09zNHU5ZXlZVkd0ckYw?=
 =?utf-8?B?YTZQMGViQ0pqTjBtNTlvKzMweUUvUTN3djJRWnM5Y2lKbEYyOXhaSkJKRVJQ?=
 =?utf-8?B?cjExb2NocWUxbWIrN0ZaUmNtOFIvVnc5NWVwVWNmbXFRVG5hWlJ0VmpRZWhm?=
 =?utf-8?B?cVdHZENBZkV4dXhmcHpmZGMyMmpRZzQ2MjB0cnQwT3g4dlMyU1h6bWZENmZa?=
 =?utf-8?Q?Mj8i++kX6tqcvkL7Orlitrnst?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 749fb203-52ab-47ed-2f38-08ddf04ebb6c
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 09:45:10.0478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q25G9ROdefWo+tjZkceS2pYepDGYE9bhPY3+oMamAOhzuTSxfjgMFZdhso0iTwwNZFyt9OzWV26pS5MW6srT0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11834

Use devm_mutex_init() to simplify the code. No functional change.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ds90ub953.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 98d6b6fab810a8f65a01a6049238cbf700eb8cd6..6f09322553640384b1f43af0dbdf4f54b4ba004a 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -1339,7 +1339,9 @@ static int ub953_probe(struct i2c_client *client)
 	if (!priv->plat_data)
 		return dev_err_probe(dev, -ENODEV, "Platform data missing\n");
 
-	mutex_init(&priv->reg_lock);
+	ret = devm_mutex_init(dev, &priv->reg_lock);
+	if (ret)
+		return ret;
 
 	/*
 	 * Initialize to invalid values so that the first reg writes will
@@ -1350,30 +1352,26 @@ static int ub953_probe(struct i2c_client *client)
 	priv->regmap = devm_regmap_init_i2c(client, &ub953_regmap_config);
 	if (IS_ERR(priv->regmap)) {
 		ret = PTR_ERR(priv->regmap);
-		dev_err_probe(dev, ret, "Failed to init regmap\n");
-		goto err_mutex_destroy;
+		return dev_err_probe(dev, ret, "Failed to init regmap\n");
 	}
 
 	priv->clkin = devm_clk_get_optional(dev, "clkin");
 	if (IS_ERR(priv->clkin)) {
 		ret = PTR_ERR(priv->clkin);
-		dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
-		goto err_mutex_destroy;
+		return dev_err_probe(dev, ret, "failed to parse 'clkin'\n");
 	}
 
 	ret = ub953_parse_dt(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_hw_init(priv);
 	if (ret)
-		goto err_mutex_destroy;
+		return ret;
 
 	ret = ub953_gpiochip_probe(priv);
-	if (ret) {
-		dev_err_probe(dev, ret, "Failed to init gpiochip\n");
-		goto err_mutex_destroy;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to init gpiochip\n");
 
 	ret = ub953_register_clkout(priv);
 	if (ret) {
@@ -1397,8 +1395,6 @@ static int ub953_probe(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 err_gpiochip_remove:
 	ub953_gpiochip_remove(priv);
-err_mutex_destroy:
-	mutex_destroy(&priv->reg_lock);
 
 	return ret;
 }
@@ -1413,7 +1409,6 @@ static void ub953_remove(struct i2c_client *client)
 	ub953_subdev_uninit(priv);
 
 	ub953_gpiochip_remove(priv);
-	mutex_destroy(&priv->reg_lock);
 }
 
 static const struct ub953_hw_data ds90ub953_hw = {

-- 
2.34.1


