Return-Path: <linux-media+bounces-29679-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF6A817E9
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:54:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37BA242528C
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 21:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA2D255E30;
	Tue,  8 Apr 2025 21:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jwDasu3G"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2075.outbound.protection.outlook.com [40.107.247.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA402550AD;
	Tue,  8 Apr 2025 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149241; cv=fail; b=BbznRZxrB/ZT58xCFUVmOnqpKz1fnChi48O4D4raahr5jDThonkkLnpnHa8pjku+YSMmvc5GptstEC/IOOYbbXnO3zCQwc+eVHAo1h5VUgKpn5v28hbgw4I5mEj1BYrinebcMaGNwpmHitSyiuZtoMx42//UQw5a0JxUcPgDJZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149241; c=relaxed/simple;
	bh=z3gQbG0/BrJcget2ANEIY6eVCVMxZEBt3sBKmejs3RA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fqBN+Ai3a/XssSjXxJMwwlNmypPV+xx0v+qX0NHIryxdNanPfJWe46bCBj97wyP8dif8bjRkPFyjp7R/ax7n6oxouaEXMWD9BM3a5+xkutakFRq+K2dAS2572BNSOL3/8BtcVXv4soitpgYTkXASmIlUEXEIe0Of+FZysdd9ROA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jwDasu3G; arc=fail smtp.client-ip=40.107.247.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ma2ErLqaHgieM24mxAn95OBjZ2X6YubyNyFPo7OI18Qq2cHB/Z88M4i0eAqE1ZbM49LecCOUGo0LIsI/RJ/L7dwYLHMogVy0s1v4bDWj9vRjvgM1M+Kt4NfILvJeld6v0UEmqKJ9E49lOMlAWHRez0ByqSQ/pT5qk4nVONes9EK6pWp6bvD/Jv3GVgHxhSTiimYxt0izirji3PErjuLvds+h2QNmz/Ri2B8eCOAYuNBTHtuvCI18RenMfBGA7w8JiOyRR32HF/3h9ejtGRWf7Nw4u94EzJE+zmUDcAIxGnUkP99mf957t5fKtzD4IFdOEaSlJr1iM01KTnj9KPOsJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Yhkdp20aOZOX3AoEgvuSdI/148ioIfxDQbW/0DtkqA=;
 b=TYRAIr6VP28V49yyPSV90R1i5ezgbGW02tuvDWyYpCaQ/4d35mMcqCreyI/+j3ooWKQSV1x3j5zbSaSt9D//YPGG0/S+69asgCff7uLxiXkUAb9wZL/fPLv2h+kP9XP58N9vy8T42kNrIRcftAriH64Arf9oXkr4iMkt/giACXGjJGgOZkw4d0s+5fLVf/aZafmw5wmxyBDBNWnW+uTA3DrgDhoUHliiAWi9C0GabWZo4qQmjHvSyMXNB/0/f9RRl4t386EnMzgIa+Q98ljy+GevxniHN+C7XuvLjs9YYPCqdN7O6TQuzzamoPt84QZmItJNRHVoQ32vrcaC3ED+sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Yhkdp20aOZOX3AoEgvuSdI/148ioIfxDQbW/0DtkqA=;
 b=jwDasu3GqGnOxH8tLusK4OBaOaeId15BX3MkDqGiPaqN7EtRGJC34zUY4IciKlwAMYx8PubEHpvieczq6BJBM/NabW7Ir5K4OQOcZ5y2kuCYIL1ikiyNgDmwcAR94/zibDT4XDMP4WLl/fwgv+X/JYh/UZ4a0ZC//8RQ9ZYVeI5DfGhOyzGf2vCzgDYONfKdnB+82OC03SS15wE0JzjgTfwKksnWeEaR0vuFlg6qVazm2AXLwqVFYEC99KziRd9gOiNk9B4H5yK3MjjbHV74SM/mlE/6Yd86xDCURRo0IMLm1g9ErfYXZ2AVbwGQakWx90BZy2abE3uxSdlVqH6j8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6993.eurprd04.prod.outlook.com (2603:10a6:208:17d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 21:53:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 21:53:57 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Apr 2025 17:52:59 -0400
Subject: [PATCH v4 01/13] media: dt-bindings: Add binding doc for i.MX8QXP
 and i.MX8QM ISI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-8qxp_camera-v4-1-ef695f1b47c4@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744149229; l=8826;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=z3gQbG0/BrJcget2ANEIY6eVCVMxZEBt3sBKmejs3RA=;
 b=dhBx4Ui8FWTWLWDsAP8pxl3XOdt8fGbZhYsUekrcUSMO1dZoKreMrMwkyYkS1J/6J/4xP3pqd
 KoJtsHfhDhMDp9pHtLBRCsHec6kJYQ+yQXOxEJc8TXcYgnDh5WHpSK2
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
X-MS-Office365-Filtering-Correlation-Id: 1b4c211c-8258-4779-5d6a-08dd76e7dd25
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|366016|1800799024|921020|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?V0hCUlA1SnAxQW5qdG9NVE9pVGVnN3BYY0tUOXRpOHJleXhFTmhsQy9JdGdn?=
 =?utf-8?B?ckY3K3BDTkhxeTB4WG5rMjRTWGtSNDJLeFdCZnZEWUUxek82cDJoZkRGa25H?=
 =?utf-8?B?RHJWWCt5a1dOeTdKT0wzcDIrbkJBMDh0QlBaK1RyV1BqZC9yV2VPdUJWS01o?=
 =?utf-8?B?b1ArY292VGRiVlhYYUdhWnhzUWVaOGZYYXFuZUVjMnhaenZjeUFkTW00RktV?=
 =?utf-8?B?VmtDcTAxU0V2RFgrNGFtdmRYUnd4clFOL24xT0xTWHFxZ21FZ1dKbml1cjYw?=
 =?utf-8?B?RFVEa2FiRnVpNnh5V3h1NmE2dkJ6N25BajZXSzdjQ3RnR0JCWVNVZG1qM0Ix?=
 =?utf-8?B?TEtzbk9wb0lTMHFJOURVSUFpYzNiSUhxWnJzZ2w5N3RJajVPRThFdm9ma3NH?=
 =?utf-8?B?ZmxIQ0VuemQ0M212R3hMcFJ2a20xenR4VjcvYmJrZElhRWpIUnkveUhVUW13?=
 =?utf-8?B?Q3lrZldGUjJqc1ZqeC9Gb0dQQlBzWThTQklwQ0Q1ZW1iNmY5WDhTRTR3SFdC?=
 =?utf-8?B?WHlJQndWMk1oY2RyL2Z6ajcyU3d3bHRKMVREVlJzVnAzY0ZERGhOcXNVbWlx?=
 =?utf-8?B?UmMyclRBV004R2pOcnZZR2s4bXVwZUlHS3o0ZlVySTROQ3hLWGNzVEtlTVJH?=
 =?utf-8?B?N2RoYTBwL2V2a1h4ajBYNzdTOVExRklpSWY5dEMyajhMK2wxYnlxcEU4SXQ5?=
 =?utf-8?B?emRhbi8xTUdVcEh2MmNpdXEvbk1PZWZzKzFwK1d6N2JGbE5WL2xYRXptMURm?=
 =?utf-8?B?a3FTVk5BOG9XdHFsNEtSQlNRN3hYTEpsNm51dXpmMEM0ZFdFUDlXRXVodXh0?=
 =?utf-8?B?TlNBL2FkenU1L2tibVhSWnVIUXVHYVRDazM3SmhMbTZQSzlhUWZIbW9xMDFh?=
 =?utf-8?B?VG1qNmFqdFk2eW4rMkpDVWlkSjFYUC9QZXdSdjJLb0hXM3duSEI4UUxpRlFy?=
 =?utf-8?B?cFVRQm1ESXdYTGh0UG1zWXlJTXZLbGRZc0V1d1dTZlZxYjNEVm4wbGR1bHA0?=
 =?utf-8?B?amJZTzh6R3BVYUhrWGNYZ3ZZMXdjakRnajRiMm53WE1xMm9SQXJnYng5bzRF?=
 =?utf-8?B?ODY1YVR2K0UwNGNscnk2eG1HaG80a3J2RkxpalBIZjVJQ1VpR3MvcEZwa01k?=
 =?utf-8?B?WkZoLzhlUUZ2QWFTcWJ4WVY2Vjg0NEk2U0R3V0xxYS9JZ1pDRmY2cmZLK2dX?=
 =?utf-8?B?V3ZZMGVDRXpjNG9yRmtZVGJwV2pHUWpydHlYcCthZi9GNmZVd0lMU0RCNnJ5?=
 =?utf-8?B?UmcxeE9CdThlcnFSejVYbVdDYjVSb3pTYjJSYjhTUzA0QUFBdDhGeDkzYTFI?=
 =?utf-8?B?bVlzZ1F1Mm9uWEsrM0pyWm9TRTZJUkYybUQxaC9iSFZHdXNvRWczcVBxVDly?=
 =?utf-8?B?UUFRQkRSSnQ4OE91eUp2QlBvdE42eHpxZlY1YXdCWGlaS2FtenpZYTExalBk?=
 =?utf-8?B?ei9NcWpzUWlCeGRxalNBb0Y4L1I4anVCUVNGTFIvcS9vcjJtVXpLTi8vWHI3?=
 =?utf-8?B?ckthRFBnQUZ3T1VSV0pWUktXK0lQalRDZSs4by9uM1lzcUxxM1VXbVUvS3Nx?=
 =?utf-8?B?azY5dzhoNGh1OFdjVnYxQXZmL2loRVhjcC9MVVUwNkNRRG1nNG03RHp5Kys2?=
 =?utf-8?B?MnZ3WXRpUm5VUytwWnkyWCt4RXpna3puRFNwVXhMbExaSUkvb09DVzl2cWM3?=
 =?utf-8?B?eXJlV25SdTVJdExrMTkxUTVTRG8rd0FZYy8xNnpFNzRXQldwVkkvVkVJb2hB?=
 =?utf-8?B?MU96Wmd4MGdJVnl1ZUVkMkhHTHlzT09Tc1V0eHdidnJaWGtRaHBablQ2M1U2?=
 =?utf-8?B?SXRvWGEyNkhTNFN0WWx5bXRCcmVZNWFlaEUzbitzcWZXMklieVVqYU80MEtD?=
 =?utf-8?B?alFwS1JmUzRLTWtBWFh6OTNZWGREVDM1a3h6aDdySDA5blE9PQ==?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(921020)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TElXMHFHOXlVeCtoODdQTWhoSzJlLzdEZlFBaVp1VmthZ21pd1BXdkhQTDM3?=
 =?utf-8?B?R3l0UldWL0lLdkNUN3hKTFJCai9TU3lWdUY4YzZCSk1xckFhdFh1dXQwWjdy?=
 =?utf-8?B?bk1ueUR2Z2pQQmxFSTQ5WUtEejZabGtxem0xZjgrNlhBMjU4ZDQvUk9kTGpx?=
 =?utf-8?B?RnFxbXVodndiaDlOaFhBUnJ3d2twMUlNdkc1RGZrU25NU3laa29sNG1CUS8y?=
 =?utf-8?B?RkFhcVVPcFhFek5YWjM0OVh1ZWUzYVVyOHVqVW9TQ21pemhVMTJCaXV4aUxN?=
 =?utf-8?B?R2tISzgvd0tkLzFVWHhUV2ZaSGJJeGtqT1gyaGV5bmdrYUdHeUlpWFF4ZVRY?=
 =?utf-8?B?M09INWhWR0MvTC9mcnVLbTVQNGttZ1hPV0MwV2NlTHNpWDhQZjNDYUpGNlp0?=
 =?utf-8?B?N1JiRHVpVEFMVENCTE1taVNKazM5SWpJeHZoNWVWRm8waER6Rk00WEpjQjRx?=
 =?utf-8?B?dXRlZGNUYlNPVE5hNGJ6RzEyN3ZmRlNzY3JXRlNVWjhjSDhaTXY1aGxta2t5?=
 =?utf-8?B?RjdqZVc1WENYai81Uk1KTzRrK1FrdElvUXRjY29NNU1aRHFObi83dldReXdV?=
 =?utf-8?B?ZExSSEp5QWd5aU82NXhhTEExQjcrTFVMbWdPR1UwcVVhR0paUEFrdE9wNTdq?=
 =?utf-8?B?VG9XSklDYmlQZHc1MUdWVTlrL2JPQ3hVRXF3RUw3NVNjQkhrUmFGQ3BaOG80?=
 =?utf-8?B?MFpLWWRtaE1IZmVqNER1WGtVOWpyaldkeWJxekN2SGx4REc0VmhUVXQwcWZJ?=
 =?utf-8?B?dDl1d1pyMWdVVHlNWTg0cVZqKzIwbHRlOW5DZVNrOUlkUE05K1JmbndmSnZF?=
 =?utf-8?B?ZjZkUVoyeExNNEJ2bzI5a3hnQ1hrdmlkNUMxSVVld1VlcWFZRFVqdkRnTmtn?=
 =?utf-8?B?VmZQNnhFanV6amh3bHJPNWpKQ1ZBRkxWdEY2c3hodE1ZdjEvMVByUElDY0JI?=
 =?utf-8?B?bzZSaEc5dCt2cGRZdjMyMWwxUWIzREsvVHFldmUzNlBNeDArSjNxQ0RYVndt?=
 =?utf-8?B?NXloeitvWGpCZTRYU0VCRElJTkh0cDdTTGJ2K2Q3cEVmdjFBbmk5QWxkemlM?=
 =?utf-8?B?K0FwOGFCaGtKVnlCRkQ2OC82U1JnQjdlRkorcDJHWUExNjYyZjVQNEFqV2xD?=
 =?utf-8?B?dm5PbVl1QmdPL1RaaGRtSFgwMW5TdnhlNkxnMzVtOUdyckRFU3d6QmUybUpI?=
 =?utf-8?B?WmF2cWI2WG9nYXk0ajU1OFZ5cmErSWhyeGErS1MwV29EUHRjUUVEc1VFMVZh?=
 =?utf-8?B?bW5WZ3Q3NUpoRWhWRWFYN1ZwbGFVQUtWZXdsZzQyb0IvNUh5T1dPaVBjZEJq?=
 =?utf-8?B?aXlUSjBNcnNabGRhdjQzQ1UwOE5Xc2JJRDZKMHZCem5IU1lDeUNvN2t0VXpU?=
 =?utf-8?B?NFJwQUpVWkxLaEEyVDBsZkRCaGk1UzgycmgrLzhWNjlFb3RwVDQyYmVCUWdn?=
 =?utf-8?B?bXEvVXY3MktDWjQrVWFydEV2T0RuOVlCZU9JSlpFckYzUVdWMGlobUlQeFdG?=
 =?utf-8?B?NmJMV2prenMyMHp5TElpekI4M3FndjUzRkRaUzh5QjgyVjZBQmZUUXNqRW0v?=
 =?utf-8?B?UlRXeDNVWjlzSWN6OFNZWW43UXF1QmRUYlpVVTVMbERsL3BBMVR2RDUweUVN?=
 =?utf-8?B?eWd5REhrelhablFMS29GVDEzT2JIQmZyL2dvMHpLOVNkUDMyTTV2VG1ILy94?=
 =?utf-8?B?WHZlNWJMSkg3cEZJaWZYbElUeXQ5UUlWS0plaFNlYUFaT3ozWGZGQlhnU3hk?=
 =?utf-8?B?elF0NjlYRSs4cld3UG9sbXpCRnBmemdlQlQ4cVQyZTNJNlByNkJNamp2SEN5?=
 =?utf-8?B?Z3p3VjdGczFqQ2RmclczU2hXOEk3TW5iUHJVT05QYW1VR28rbCtFU0U1QWxR?=
 =?utf-8?B?Wm0xK2FaNEJqN1pKc0hmR01nQ1ZQbUg4L1dmdmY5dDA4Z0NaNlZlY3R0UG5y?=
 =?utf-8?B?Q056Ym5SdmJpNFkvWXo5ZmIwbFBwektZQWo1UncrNDVHNFduK3RoRFZiQmp6?=
 =?utf-8?B?QllmcFNUcHp4d2VkOXdEUlRxeUhPVFo2OXgrUGp5VjNlWU85ZGFBV1cxcFQr?=
 =?utf-8?B?dWg4Y1ZqOUNaK0tvNDlpZHdBRkF4N3AzQ0wxb2RxaUIrSlpwY1FPTkJobnE3?=
 =?utf-8?Q?mAu8=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4c211c-8258-4779-5d6a-08dd76e7dd25
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 21:53:57.8496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XaxOfFAf/IjtRcwlx3wG6uk+keqh+sIO3TFDyGI+LT9f/2TJuF+B0Z+xhZHqKVujlkJLuNAwPIWc921YI2VqbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6993

Add binding documentation for i.MX8QXP and i.MX8QM ISI. The clock-names,
power-domains, and ports differ significantly from the existing
nxp,imx8-isi.yaml. Create a new file to avoid complex if-else branches.

Add new file to MAINTAINERS.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change from v3 to v4
- Add Rob's R-o-b
- change qxp clock/irq/power-domain to 6. (QXP C0 change 0, previous chip
have not production).
- fix register size to 0x80000 for qm, 0x60000 for qxp.
- fix qxp's irq number and clock

change from v2 to v3
- none
change from v1 to v2
- create new file for 8qm and 8qxp accroding rob's suggestion.
---
 .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++++++++++++++++
 .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 106 +++++++++++++++++++
 MAINTAINERS                                        |   1 +
 3 files changed, 224 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
new file mode 100644
index 0000000000000..93f527e223aff
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
@@ -0,0 +1,117 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx8qm-isi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QM Image Sensing Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Image Sensing Interface (ISI) combines image processing pipelines with
+  DMA engines to process and capture frames originating from a variety of
+  sources. The inputs to the ISI go through Pixel Link interfaces, and their
+  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
+  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qm-isi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 8
+
+  clock-names:
+    items:
+      - const: per0
+      - const: per1
+      - const: per2
+      - const: per3
+      - const: per4
+      - const: per5
+      - const: per6
+      - const: per7
+
+  interrupts:
+    maxItems: 8
+
+  power-domains:
+    maxItems: 8
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 0
+      port@3:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 1
+      port@4:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: HDMI RX
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    image-controller@58100000 {
+        compatible = "fsl,imx8qm-isi";
+        reg = <0x58100000 0x80000>;
+        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "per0", "per1", "per2", "per3",
+                      "per4", "per5", "per6", "per7";
+        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH1>,
+                        <&pd IMX_SC_R_ISI_CH2>, <&pd IMX_SC_R_ISI_CH3>,
+                        <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
+                        <&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&mipi_csi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
new file mode 100644
index 0000000000000..bb41996bd2e36
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
@@ -0,0 +1,106 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx8qxp-isi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8QXP Image Sensing Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Image Sensing Interface (ISI) combines image processing pipelines with
+  DMA engines to process and capture frames originating from a variety of
+  sources. The inputs to the ISI go through Pixel Link interfaces, and their
+  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
+  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8qxp-isi
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 6
+
+  clock-names:
+    items:
+      - const: per0
+      - const: per1
+      - const: per2
+      - const: per3
+      - const: per4
+      - const: per5
+
+  interrupts:
+    maxItems: 6
+
+  power-domains:
+    maxItems: 6
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: MIPI CSI-2 RX 0
+      port@6:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: CSI-2 Parallel RX
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/imx8-clock.h>
+    #include <dt-bindings/clock/imx8-lpcg.h>
+    #include <dt-bindings/firmware/imx/rsrc.h>
+
+    image-controller@58100000 {
+        compatible = "fsl,imx8qxp-isi";
+        reg = <0x58100000 0x60000>;
+        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma1_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma2_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma3_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
+                 <&pdma5_lpcg IMX_LPCG_CLK_0>;
+        clock-names = "per0", "per1", "per2", "per3", "per4", "per5";
+        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH1>,
+                        <&pd IMX_SC_R_ISI_CH2>, <&pd IMX_SC_R_ISI_CH3>,
+                        <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@2 {
+                reg = <2>;
+                endpoint {
+                    remote-endpoint = <&mipi_csi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 78467ad7a8fef..977f338bec04c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17428,6 +17428,7 @@ NXP i.MX 8M ISI DRIVER
 M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
+F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
 F:	drivers/media/platform/nxp/imx8-isi/
 

-- 
2.34.1


