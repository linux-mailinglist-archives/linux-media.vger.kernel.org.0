Return-Path: <linux-media+bounces-26593-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B722A3F9FA
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:04:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A99A7AE00C
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 15:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD74214210;
	Fri, 21 Feb 2025 15:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="hWjkRZAP"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821032116F5;
	Fri, 21 Feb 2025 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153371; cv=fail; b=e+LHTjxdgfgqYwBLLDFomRmOOrmEW69DO9iJ3VNaxRraewN7iDD8ZxN/SOyxn8O8mDCXh1jPwbe01dDPU0scA0iMBpwSrS3fz06S/1HOyBjS5SmJ/3EqNm9nLAIv3NCIldW7hi8k/vtdjnjgUZ4qatyX0+YBdkPAUp5azZJJnsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153371; c=relaxed/simple;
	bh=TLs9se6yW8nwupIO5Te1GdORviq7+aKgTPZWY53m8u4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=oSqUNcfCabu64zZEnAqw9MzPcvIfCW6IT+nEIGBMcyVcQ8SX7+SSa2AMhq4cUPS7FCxCJoe2yfCoMYbnwcdAn77WDM+U3S+97xK1QS/UbrQVHt7CnxxYAA59BpX1DsjzqXnH5C0LcdwD31FEjhOhP8DT3HzWqSKQSzorB5TWFko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=hWjkRZAP; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWXGz6qbIWb3FMEwAQMDOBlZUDcbnS8WCj/Sxoh5mJW/kyg7pU2wl7stzNfYX0eBN3+M6xOHgtRh1SAQCN5XtIq3GcMa/a64Ze7mO2fSbxcMljHrJHjKLb+w6mqd9MmjSdC+PXudU8vWSZ1gyAiHNBFa9I453by1EiQ6FlgorcDtMYMAt2DdbT706VNSlcRlsnGv06uN6ZAzxZcpYlPCw4X34AtdDnryLx+z3HP3qZh7q+KVhSYWOkPPBFx7f9xLldJ6mLqGv1oC1BNmchNw85sglt3Q2FPr8FcELyLeb92b6MJ94X9t3DndabpngQeUg0CjCg2kwhSSqlO1ADKYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDdJlfR2KgDZ1TgNRwSXg0Gmn1WSjVYbK7kIbSYlzks=;
 b=Dp4VU17m9aGmm4ywww9XGiW+2BUB8pqPlFlsiDCjkZ9vCw2O0/ufS2WEPYY3mZC6hOsnprLx4yQG1RUyTvrlpq4wgmdMW2/s0hvQaANp+GuoTavLb3HGh95LtrscXGL/BMGEeWb6t4zKhmiUCCsGbkrYuej6ykMtDMQsWue5UgI9EuipGLeWu3RA8Q4VhJvESNfN/GHriRkL4JexxEtMXm34IXUVzNF1L8II1TGMddc39iU8T+EAJTfrIsGKSTKHIAmCJX8BjX/5aXMnvlwRIEnFchm6QgILGTwsB1DZXetD8dMfL/El0ZCmok734gRAUrECDtKXD5jVYNGd2i2RyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDdJlfR2KgDZ1TgNRwSXg0Gmn1WSjVYbK7kIbSYlzks=;
 b=hWjkRZAPXKNQ82otxZ1+tLTiVpmVNYVtdX3Pf9P0G+GWRz7tqb5Q/JfY3VUJb8A9voQtaSbLFsDe8+PXlTXnmBomWR3Yxg7gKuQSfqTaH0dKWql6jeUL9BEk1Vg3WwmaIbAJLCdpiOf1xsTWVy1Ba6U8Se/ayeDkAfYMBALWb70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:56:04 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:56:03 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/18] media: rzg2l-cru: Add support for RZ/G3E (CSI2, CRU)
Date: Fri, 21 Feb 2025 16:55:14 +0100
Message-Id: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: deb34d21-002c-4279-03d2-08dd52903e8c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Qwlc7WhOZk3BEG36H/bjsyCl0dIs5wDKyYRV+JmQIuWgyjAjJsmiQCVvSNTM?=
 =?us-ascii?Q?Pt7yuc+QxUxNY5zlTfleoBdZo50UeNPCI38+5Q0IhjG+zcHtQmvOsOlYTZ0Z?=
 =?us-ascii?Q?VKn7hHETLgN82Du/17C4H0eFVDz5UVWZdomz4KpQK2NLBOFYD/rwkI5F0YNv?=
 =?us-ascii?Q?8f6CwfmXR0FHdLhjy6mJrcbaSpm1PND1dyUzPy9VT6g99cw/mabtHIt5v5e9?=
 =?us-ascii?Q?CZ87xFmVbWjFObnWOCtvOE3i68hf8smcrNo4RI64DI8ilye6MuUCpARytwbZ?=
 =?us-ascii?Q?My4eLtu1QWN4MPw86ymNC30Akzv7i2tYmoTLjdjjFeSYbZ4JHHM4UvjWFEE/?=
 =?us-ascii?Q?hbrafIhrG3UxhJTn8jBlU/dB8EU2gJID78Z7moJNeBz9cAMZQ0Q+Srv8ZqUm?=
 =?us-ascii?Q?IglqdZus1gpP4ZP98p9Nr8ywXlJwTduxZGKY5IxEMpC2bBEL4U8uS1kD+LzI?=
 =?us-ascii?Q?TQaq3HxIGpfn2PMOa0r8W8aHomHfT6EL2FnwljYtAww+onFqJMpWX0A7nekV?=
 =?us-ascii?Q?+U+92aiay0b4V7pDuiPTGcGpyRLlNNyJMa+gjvNO01rO/aRhAExWpZTdl1id?=
 =?us-ascii?Q?9rW83grbTUADl0SOEv6EsuIP671FruIITqB3C9f5CJjcdJJ33Vtn+B1JvYPa?=
 =?us-ascii?Q?2HV9kpehmJaJaP1QevTKMD6J45OP9Og5qvPzwdI9H6+VuVZ09UFz6PyJuTIi?=
 =?us-ascii?Q?Ca0d8WkpqWaBG7ugJHQHAC1S+YCu5UGkdV5rKrvUGiQxkA/ToIFyceaoK1w3?=
 =?us-ascii?Q?to1skSYn6wxsxgTpjq3dObUYbaqmxjdOf4oj8SzrtLWY3vLASx56ABcMLDNz?=
 =?us-ascii?Q?k183542t4Fw+sScf3YvhwzsL4/pcIEUH84BfXZOqPW3XEdHyQkuM/XeQmqPJ?=
 =?us-ascii?Q?MerveJXfuc7zIOCt1SM1sMXvJPPAY2CY4H+vOw8ytreb+/21pqvaTTh8Rxss?=
 =?us-ascii?Q?vlFzvMkZ1dtU22fggzcdzlncMomuKZYQmKcduzpYam1Ss+5+0otJLStVJJPi?=
 =?us-ascii?Q?FHnPUkhtXFB3VRxrtAgZLf5D4DDzy8zBBDH8NebejXJ9zbLKMLaVOLweZFMp?=
 =?us-ascii?Q?09Sgh1Oc6HvgtcS0ZKJbDjb2sihMf+FV46pQ8BjmipyeeoBDxjoqCYuNFVAG?=
 =?us-ascii?Q?3d6yAhzI7g0H9Ysu6HrQa/KlW1blqXRNDPJkuCcr57vcwis8piOHBMmiUTd3?=
 =?us-ascii?Q?eLj04vhg7wcPorlcrIK2+DEPSFho3cYUW/GHRAXQt4kESY4CMLPEmIM8vjJD?=
 =?us-ascii?Q?uKiXImCdXbWJ9kJISCNgNZYeKDyFVtfnbABA2s0+L9f/wdT3oVmv49pGqabC?=
 =?us-ascii?Q?Nc0Gds2h/dzqbb9mO+a9Eoks3eJaGSrxpnA/sUY0fhJoGE4M5D6iDD1QXo0V?=
 =?us-ascii?Q?sXf6G+ljZvJaHV3Q4ABD3BXKejRNcqZ1fTHieq/rtiNSY06315ud/evn5vTw?=
 =?us-ascii?Q?Zd045Uchs37rK4TurFGfUXGvCs++eNFL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ngu2C1TPzBDUDkDiivzpNwR/OC4LzXJVPgNlACKPlo8t466NKy0VTNANT+4L?=
 =?us-ascii?Q?hXk0dD1iYerI5hPNj4JTjKB+gOmRiBG3hKiE+qpg9UcdgKfC1VpFPRsFfeew?=
 =?us-ascii?Q?HUXNCDd4O0cxopC+2xmu9/oFTokmQC9gC38c4SmFo1j/WPloEekkwAwZm9Kq?=
 =?us-ascii?Q?1qKL5O2BJLhvSzAs8nl3WIjqJIRMdEayMOzGy4uTID/dSOtNg6I39QpO0aFO?=
 =?us-ascii?Q?AfIUGUHnUper/m/ftv+oRyComVeznQWasC01Ka6htOKgLjWfPIE81xDSIHtA?=
 =?us-ascii?Q?yyav6dQec6/TaEhGLDcym8K2srwpOdv1IQhcSNhvg+JNNghf37qeqGvp4dvO?=
 =?us-ascii?Q?Cq2FNpup6erJCzz1ydfbTpVKeq/WgWqpTlLQWoOYS5tc85V/QjMYAIEd3Yag?=
 =?us-ascii?Q?PvO8NAF7q75Uy47W5vWi09H7Y4wWeu9D+ziTw4bsTz7cfUGl+QEn6yKVtUgt?=
 =?us-ascii?Q?PZJKTRGthGBqPJdI+PJyNzpBD4t8WEZ9EF6k7YgODoPrhEBxNFjsHXBK7nK+?=
 =?us-ascii?Q?58Le/fjkNBhfIbmrWkwe5SF5LXkZpeNn1lFTVWUolUIS0ynMwlNuBTqOAOIO?=
 =?us-ascii?Q?nah4nxPvBola9N5hiSkHQlNVg/Kud71qe/7nnQywva4XyQtL3OI2sjNZw03t?=
 =?us-ascii?Q?dS/w+bv+QriY/Tv2xgn8wTnkEkLMWgEfxX9RMuAaQKYtKT4ssf6S1ii8vFiz?=
 =?us-ascii?Q?921/6LdeAWJa4qiMstcm8BhX9/r1RD6hPzN6GPiN+OXBeyLg2NTtPaDnSkC3?=
 =?us-ascii?Q?hVt9VdJ8zfcR8D5fGjYFZRG3fmor4UaOAnAHB8BCceyhsjW2cZp6blV0R0RR?=
 =?us-ascii?Q?zKNKtzi1u5VUbo6NBS0aNaW5Cc7davACt3BPxZ7ItKBzluEhkXoK7H7TpOt1?=
 =?us-ascii?Q?ORgR48cb2AOrZCsZ2y3gn576RwmpeZuSYnEGeXGH5tdcdg4wfEfvNUPNs47z?=
 =?us-ascii?Q?daVm+ggaih3PfmGD7G8knJrny3V2DPUD5ISubgME6HLiUfoUAUpsX58GG63f?=
 =?us-ascii?Q?WjPpqUgVW9pxyhzW+Q2Uehk6yD6/AtLaDrF7y/rfVlA/ztW15GoGjeDaYsx4?=
 =?us-ascii?Q?vUMnDAkeQVe7P6H/JO5fgtcaGWrtcqrdDWzowMb+YLkISR3XIH5rXmcQNa2Z?=
 =?us-ascii?Q?6infvMe5Uzs2jAS5AILbv2XEQH+3pMyk/J0TAMOgMXrW3PtnuOc6F/O/Da2O?=
 =?us-ascii?Q?bzdXU8KYO26UyT+uBE4nbBxWdncDolVNKe762/0/0SnQnJL9jaxHwytZ6wBV?=
 =?us-ascii?Q?va8jGSagkaLuzgehHYwlUk+mvhdZSVGlyggLOdEYzKtVpCORVI/bzm0BFVZe?=
 =?us-ascii?Q?AywsWEVKgcwX2Hh/a7Gsnuy39DIbtS4yLEKdqavtDiVBG+yCMcY9WROsKpgV?=
 =?us-ascii?Q?DWcd4UVCvnscmAD77p4w0vYllV0w4NdyD+onPS1KXEiqEwOal6zLlxb8jRPw?=
 =?us-ascii?Q?S1HiCEqqnfkjITnZh3zOtHdE32sjwowiYSyczy7opADTTH0VxTqTExSjC4zg?=
 =?us-ascii?Q?sl7ZZwQCYfbDNld1hEUqKiW20VPvFxhZUVn+bY4lZm4ZVidW/njuiK1qb7ZD?=
 =?us-ascii?Q?VXwDWBjTHKin5qbcKcFxpLyV7oSekusTjPhzon5htsHjRrWHLll68pCPnI+6?=
 =?us-ascii?Q?b83ti9l6t/pEDIGNU+8j9n4=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: deb34d21-002c-4279-03d2-08dd52903e8c
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:56:03.6369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cTY5s6gNZBtPAq9XyCa/v1nS+1L9QF6Tf5d7pdEPZ7TDMAieB+OhYEr2coHfV0qkytcWinaYf+8bJeNnRlHDfCtxJpygv/sp71SnGBUL7HUMlaSg72R2XEvOuC2uwieQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

Dear All,

In preparation of supporting the CRU/CSI2 IPs found into the Renesas RZ/G3E
SoC, this series adds driver/dt-bindings support.
This adds also some minor fixes into rzg2l-csi2 and rzg2l-core drivers.

The series was tested in an out of tree branch with the following hw pipeline:

ov5645 image sensor (Coral Camera) -> rzg3e CSI2 -> rzg3e CRU
imx219 image sensor (Pi PiNoir Camera Module V2.1) -> rzg3e CSI2 -> rzg3e CRU

base commit: d4b0fd87ff0d (tag: next-20250221, linux-next/master)

------
Some logs:

root@smarc-rzg3e:~# media-ctl -p
Media controller API version 6.14.0

Media device information
------------------------
driver          rzg2l_cru
model           renesas,r9a09g047-cru
serial
bus info        platform:16000000.video
hw revision     0x0
driver version  6.14.0

Device topology
- entity 1: csi-16000400.csi2 (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev0
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                <- "ov5645 0-003c":0 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                -> "cru-ip-16000000.video":0 [ENABLED,IMMUTABLE]

- entity 4: ov5645 0-003c (1 pad, 1 link, 0 routes)
            type V4L2 subdev subtype Sensor flags 0
            device node name /dev/v4l-subdev1
        pad0: Source
                [stream:0 fmt:UYVY8_1X16/1920x1080 field:none colorspace:srgb
                 crop:(0,0)/1920x1080]
                -> "csi-16000400.csi2":0 [ENABLED,IMMUTABLE]

- entity 8: cru-ip-16000000.video (2 pads, 2 links, 0 routes)
            type V4L2 subdev subtype Unknown flags 0
            device node name /dev/v4l-subdev2
        pad0: Sink
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                <- "csi-16000400.csi2":1 [ENABLED,IMMUTABLE]
        pad1: Source
                [stream:0 fmt:UYVY8_1X16/320x240 field:none colorspace:srgb]
                -> "CRU output":0 [ENABLED,IMMUTABLE]

- entity 17: CRU output (1 pad, 1 link)
             type Node subtype V4L flags 0
             device node name /dev/video0
        pad0: Sink
                <- "cru-ip-16000000.video":1 [ENABLED,IMMUTABLE]

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev0
v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev0:

Driver Info:
        Driver version   : 6.14.0
        Capabil[  101.574758] csi-16000400.csi2: =================  START STATUS  =================
ities     : 0x00[  101.583166] csi-16000400.csi2: ==================  END STATUS  ==================
000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev0 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev0: 44, Succeeded: 44, Failed: 0, Warnings: 0

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev1
v4l2-compliance 1.26.1-5142, 64 [  125.542264] ov5645 0-003c: =================  START STATUS  =================
bits, 64-bit tim[  125.550585] ov5645 0-003c: ==================  END STATUS  ==================
e_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev1:

Driver Info:
        Driver version   : 6.14.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev1 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev1: 44, Succeeded: 44, Failed: 0, Warnings: 0

root@smarc-rzg3e:~# v4l2-compliance -d /dev/v4l-subdev2
v4l2-compliance 1.26.1-5142, 64 [  139.054132] cru-ip-16000000.video: =================  START STATUS  =================
bits, 64-bit tim[  139.062922] cru-ip-16000000.video: ==================  END STATUS  ==================
e_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for rzg2l_cru device /dev/v4l-subdev2:

Driver Info:
        Driver version   : 6.14.0
        Capabilities     : 0x00000000
Media Driver Info:
        Driver name      : rzg2l_cru
        Model            : renesas,r9a09g047-cru
        Serial           :
        Bus info         : platform:16000000.video
        Media version    : 6.14.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.14.0
Interface Info:
        ID               : 0x0300000f
        Type             : V4L Sub-Device
Entity Info:
        ID               : 0x00000008 (8)
        Name             : cru-ip-16000000.video
        Function         : Video Pixel Formatter
        Pad 0x01000009   : 0: Sink, Must Connect
          Link 0x02000015: from remote pad 0x1000003 of entity 'csi-16000400.csi2' (Video Interface Bridge): Data, Enabled, Immutable
        Pad 0x0100000a   : 1: Source, Must Connect
          Link 0x02000017: to remote pad 0x1000012 of entity 'CRU output' (V4L2 I/O): Data, Enabled, Immutable

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev2 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Sub-Device ioctls (Sink Pad 0):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Sub-Device ioctls (Source Pad 1):
        Try Stream 0
        test Try VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Try VIDIOC_SUBDEV_G/S_FMT: OK
        test Try VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        Active Stream 0
        test Active VIDIOC_SUBDEV_ENUM_MBUS_CODE/FRAME_SIZE/FRAME_INTERVAL: OK
        test Active VIDIOC_SUBDEV_G/S_FMT: OK
        test Active VIDIOC_SUBDEV_G/S_SELECTION/CROP: OK (Not Supported)
        test VIDIOC_SUBDEV_G/S_FRAME_INTERVAL: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for rzg2l_cru device /dev/v4l-subdev2: 59, Succeeded: 59, Failed: 0, Warnings: 0

Thanks & Regards,
Tommaso

Lad Prabhakar (14):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
  media: rzg2l-cru: csi2: Use local variable for struct device in
    rzg2l_csi2_probe()
  media: rzg2l-cru: rzg2l-core: Use local variable for struct device in
    rzg2l_cru_probe()
  media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
  media: rzg2l-cru: csi2: Make system clock optional for RZ/V2H(P) SoC
  media: rzg2l-cru: csi2: Add support for RZ/V2H(P) SoC
  media: rzg2l-cru: Add register mapping support
  media: rzg2l-cru: Pass resolution limits via OF data
  media: rzg2l-cru: Add image_conv offset to OF data
  media: rzg2l-cru: Add IRQ handler to OF data
  media: rzg2l-cru: Add function pointers to enable and disable
    interrupts
  media: rzg2l-cru: Add function pointer to check if FIFO is empty
  media: rzg2l-cru: Add function pointer to configure CSI
  media: rzg2l-cru: Add support for RZ/G3E SoC

Tommaso Merciai (4):
  media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/G3E CSI-2
    block
  media: dt-bindings: renesas,rzg2l-cru: Document Renesas RZ/G3E SoC
  media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
  media: rzg2l-cru: rzg2l-core: Use devm_pm_runtime_enable()

 .../bindings/media/renesas,rzg2l-cru.yaml     |  65 ++++-
 .../bindings/media/renesas,rzg2l-csi2.yaml    |  62 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 149 ++++++++--
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  90 ++++--
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  44 ++-
 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 156 +++++++++--
 .../platform/renesas/rzg2l-cru/rzg2l-ip.c     |  13 +-
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 259 ++++++++++++++++--
 8 files changed, 707 insertions(+), 131 deletions(-)

-- 
2.34.1


