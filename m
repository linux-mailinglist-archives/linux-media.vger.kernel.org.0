Return-Path: <linux-media+bounces-43716-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F58BB6AA2
	for <lists+linux-media@lfdr.de>; Fri, 03 Oct 2025 14:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8CF214EC1AB
	for <lists+linux-media@lfdr.de>; Fri,  3 Oct 2025 12:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C6D52F60C2;
	Fri,  3 Oct 2025 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GRV2klVE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GRV2klVE"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011058.outbound.protection.outlook.com [52.101.65.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB452139CE;
	Fri,  3 Oct 2025 12:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.58
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759494114; cv=fail; b=KolgzMwmzcfyVJSSoWUMwi5nhNLXauD2Q7AWcFdVtntYX9/rWDCTE76GvZO7bxRar0zHYECgye+R7gr8etXcvysA6BKuxtpBaYi8hJJ6WLtP1X9VKyCoh6y7+JVbb8mnaiHLvgVbJUGK+SJ1wd6YMboBzMvcbd8RJwxrqGiX80Q=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759494114; c=relaxed/simple;
	bh=5+PMwbTfXtLpXDLl10biDPLBJBU+36PGZnA+2kDCTV8=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W56wNQbnqrQYj4lEDLs2WvjPkKj8elgz+JcS5GqQDKKVyu5oXuo2wKgo+nJ1upjhrfpvc8tq6+9UhfSrEeANvhDvopfY666oV6a0iJ7OpB3pNKDHk0WLGVtJ5kbHdiVJuQWyrvoSlUJPyyVpymPHSEpMxi2+rkyiRCu6zTuXSks=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GRV2klVE; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=GRV2klVE; arc=fail smtp.client-ip=52.101.65.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FSheIMywaYq02Lfsijnp9E/+id0okScB40WTPnydI9UAsgSVUOVClqUsekYEIBgxjPFZlztSSp4+XSCCt90pvuO0xhhqIMRmu+577np6OVQ5cgwXVY7Ke1aCy5KIAU5f5Eyz20e1F61Ig0rzOlyJmspHAO7u4OZ9btJK0/20GMpAF0b8aASbxvCvwSZC1OpoGNdS9znLj3SBjN68VNhSJ5jd6X0RXrE7suASEn7Bo/7ftZhS1td54n7KXC0PfJIUcsGrl6YgMOtKMu51i+Nd3uN+u4sgfS0JVh6WoDCe8dJSnLooXXee12jyqm4ZOd7g8CMblaDmWgWRgkpdyoWN9Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lo3V2grURbBRR0jKMmzh7ONXyuMrTjfrjPvf03+Mngs=;
 b=FOEKwnQCRQ6t6efVN0qp2PM1Wpu7eC2PJBGNkbRqJ7f9ohT8B5Nf4+rry516P5r/kUFAV/WDJqPMwyFpxA5kelE0JrKMw/FQqE8lstoTSzfYnxeh4bSqPnJdUKd14g7iAUqgSVAIM1+zWFGsYyLmE98xXBPauen1AaPHPmcdrHf/oz4ABIKDN46/nVKLw2vPmt69lOv49wrmsc1b8Jl15W6Nuzrd3u7Tv7Du/5n4ZApvikccqjhDOIH/SI3SqbdGHMgxjSwjdTUciEVQngGA4c0yI8q8KKm2pbiwizRPXaWnaFeYVkk+up+GQUQGh75itbqc0HlI4JI26mKCsW0UkA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lo3V2grURbBRR0jKMmzh7ONXyuMrTjfrjPvf03+Mngs=;
 b=GRV2klVESsPXsRfT9Mv6K+GJxTnNV78Ob/UWiwQUTDTgKnvDHtjlBu/0N618Y8NkUTRm4H+VQtZpQh5H4tAtyXuS6SZ3ivttwdMucya58JkBX4ebqzGahO5ePsBKt9h79WSoMJAvas/56ziNApAzB0YG/VxsmbsD9rU/u5y7wOI=
Received: from DB9PR01CA0001.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::6) by AS8PR08MB7767.eurprd08.prod.outlook.com
 (2603:10a6:20b:527::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 12:21:43 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::f5) by DB9PR01CA0001.outlook.office365.com
 (2603:10a6:10:1d8::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15 via Frontend Transport; Fri,
 3 Oct 2025 12:21:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15
 via Frontend Transport; Fri, 3 Oct 2025 12:21:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kE5G2LsAJRrTCac+6/DTQP5GVtgvNMHYopb1eimSKclP0Mhj6wZbtxt5Un8tm/5S8fJDstYiN7jjqmG5TFDD8mxYkVGyI3bPCQHVvzo2Ha+IAOI60Mm0zqZqykkZXaMrImXyHvYJm5BPdhN/hPMIXEgh4LF4ujxn9S/JailK6lJIr5B39QGos+yBcyoadasZ8GsrikKXdMnWK4dXcP2fEaPq0UtKGGBK4mqP7dNBPPS0SRhHJU4u8L78Ig8pDl1uFAeKEFKtGFRGvnLHqScLpcgmnZAbBSSS1feQKVZ0jHk3WH3x3pH3PsTimHnBPPsQ1xoREBHKWBTEWs1Wo25NkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lo3V2grURbBRR0jKMmzh7ONXyuMrTjfrjPvf03+Mngs=;
 b=mD38c/dQQQ6R7iJ/7AqqbOkipQn72cRtxp/Za5pJzau6BtjuapfGHp0W1LN75Ztal3uJspl6AtEvPcdAUzkPUnsIo5eKbP91U2O/X1D4pi+9W8Z8zofRyi3eNt1vLUjV1MKYgH6h0LGUuSViO0YQ/rnZQvdItrvUxAvAt2V+sT81vT5QmlyJk6shDpx1Nr7EeOToT8+yrbko/fqn5p9vvDLmSxLXpeCJ0VvC+zb9Y3pNPIchyboJFgG99QW+AnUbR92nX3E3tZ9wFNZhV6FNXsdrqGx6UnTD+12Om4eF753caAwtvQjT5NOS2YGG6P5TCXIf56XaNss5W4nFRGqgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lo3V2grURbBRR0jKMmzh7ONXyuMrTjfrjPvf03+Mngs=;
 b=GRV2klVESsPXsRfT9Mv6K+GJxTnNV78Ob/UWiwQUTDTgKnvDHtjlBu/0N618Y8NkUTRm4H+VQtZpQh5H4tAtyXuS6SZ3ivttwdMucya58JkBX4ebqzGahO5ePsBKt9h79WSoMJAvas/56ziNApAzB0YG/VxsmbsD9rU/u5y7wOI=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8836.eurprd08.prod.outlook.com (2603:10a6:10:47d::22)
 by GVXPR08MB7725.eurprd08.prod.outlook.com (2603:10a6:150:6d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Fri, 3 Oct
 2025 12:21:03 +0000
Received: from DU0PR08MB8836.eurprd08.prod.outlook.com
 ([fe80::9aba:aa1e:acfa:8165]) by DU0PR08MB8836.eurprd08.prod.outlook.com
 ([fe80::9aba:aa1e:acfa:8165%7]) with mapi id 15.20.9182.015; Fri, 3 Oct 2025
 12:21:03 +0000
Message-ID: <96ebbfe7-a332-4ee9-b3c2-9efd68bc3132@arm.com>
Date: Fri, 3 Oct 2025 13:21:02 +0100
User-Agent: Mozilla Thunderbird
From: Anthony McGivern <anthony.mcgivern@arm.com>
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev
 context
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>,
 "florian.fainelli@broadcom.com" <florian.fainelli@broadcom.com>,
 "hverkuil@kernel.org" <hverkuil@kernel.org>,
 "kernel-list@raspberrypi.com" <kernel-list@raspberrypi.com>,
 "Kieran Bingham (kieran.bingham@ideasonboard.com)"
 <kieran.bingham@ideasonboard.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-rpi-kernel@lists.infradead.org"
 <linux-rpi-kernel@lists.infradead.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>
References: <DU0PR08MB8836559555E586FCD5AE1CBA811FA@DU0PR08MB8836.eurprd08.prod.outlook.com>
 <pdxsi4fskze6mvgro5foa3jvmrvl3ihmksnzukonoihkb5xum5@kph26jtiayda>
 <20250930101626.GE25784@pendragon.ideasonboard.com>
 <2efcfe19bafd1276e9fc71b72e251443f313d693.camel@collabora.com>
 <413937a1-bf4c-4926-945f-7df39869f215@arm.com>
 <ybsoposvudskkmzua5u33cq2jcstm7pzoklzutwazn2bvqobvo@pwsdlwtohcw3>
Content-Language: en-GB
In-Reply-To: <ybsoposvudskkmzua5u33cq2jcstm7pzoklzutwazn2bvqobvo@pwsdlwtohcw3>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0669.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:316::19) To DU0PR08MB8836.eurprd08.prod.outlook.com
 (2603:10a6:10:47d::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB8836:EE_|GVXPR08MB7725:EE_|DB5PEPF00014B94:EE_|AS8PR08MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: 051a1cb9-89a2-419e-7d5b-08de02776a1a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?WXpPdTNxYklnQVMramk3dVBPenJnVDlCRTdNQ1dlMFZIUTJCMllteGpRTHJo?=
 =?utf-8?B?NzlMZzZQQkR0VUF2VFY3WWZKVTQ1Q0tTUTI1WUxUTWxjRWV4MlJUNU55Skxn?=
 =?utf-8?B?d0NaSjFBNjFCcGJ0QVJ3RGNXazdYV3ZDcUs4RFE1T2tYUTgxUjBNcjc2ZHZQ?=
 =?utf-8?B?TlpMajByeFJBNWJxSUwvK3BweE1yZGx4R2Q0L0RpRmFnWTZBN05SbVFCRHRL?=
 =?utf-8?B?Q1B1OTNSTzZjVzRvcjV0RUllQU9XNUpjczJ3aERxQk5FMWRoVld4UG9zelFL?=
 =?utf-8?B?UU5OeGk3K1J5S25xNFpiQjhLUmVDU2N6RnErU3JBdlY1RTNiKzhpdkhUR2pX?=
 =?utf-8?B?VURCQ2pyT0FIZXFXUUxBay8xQ0ZFVG1VK3AzcWRQVzdPWmhRbnBGSXBlRml3?=
 =?utf-8?B?T3VLeDdqaCszUVdpREtOOW8vcklpaEkxeGI3NU5ZY1c4VW8vYzY4bXM5YkU3?=
 =?utf-8?B?U3VXN24yd1FiS0taQTAyT2lIY0dLb0tuYU53YVNBcEVGbkRmaDE4eDNqNmtN?=
 =?utf-8?B?UzEzQTBmWmpnNUR4WGNMRktYb2s2bU9BU0drYzdwQWlUaUlEek85ZTI3eW9o?=
 =?utf-8?B?T0FscHB5MGVDQTFxWURkRkdCT3RETHpxZFpIZDYyUUxaT2c5WHVBcUhkMkc5?=
 =?utf-8?B?aGx0KzA2K3RFTW1pSW1aNmNQczlIK1J3TmNRVWNHaXEwQ2d3dCtYRG5STEZY?=
 =?utf-8?B?YkNhV0tkaGt1OGxYMFlQdUlJMXgyN3h0WTVzQm1vdlNFRDFqVy9ueC9HbXd0?=
 =?utf-8?B?bC8rMzJnY0c2dUhRVDI3ekt1NGNDbG1hK1BqcndiSE1SZDNIWmhPMnFHLzZn?=
 =?utf-8?B?czZxWnJubWpJRG9nTHI3ZnZyWDBuT3JsOXFkeUlHWlZKK0VNL0xQVUROdDlh?=
 =?utf-8?B?d2tGeXRnajBkQ1dVOVI5c0dqc2lwUmVMakVaZ1llTzM1WmQyWUU1MjlkYU5n?=
 =?utf-8?B?NmZLdEd3M1ZGeHZOckRjR3F3VmhEUUxsVkJmRURxVkR2VjFrUnNsd3Zlci9G?=
 =?utf-8?B?OTZkbVBGNFlPamxjczh4OU5DVVgzZDcydzlUa2VSZXdFeDZZMUd1TTZJcXBv?=
 =?utf-8?B?TXRKT2pqUm1xeFIzdy80c29NeFZERTl6SlU0ZUFMc1QxV2I2MUxkWi8vZ0JN?=
 =?utf-8?B?M0J1NHY2MVlqMzZUL3NaNlVxbG45L1hyUGpDU09XbjA1S2RSK1ZIM0hUdGRK?=
 =?utf-8?B?aGdmNHBOREVZL2RQZ3NTZC9ReU9WOUk4ZERLWkE4Tk9ranhuYjVqVTZSZE1p?=
 =?utf-8?B?NEVkaFg3U1FRcVllOHI4ZDNXQ2xjTlZmT0NKNnBPSStBRkgvcWRqNlBudGh5?=
 =?utf-8?B?cHJzOUo3NXVteGdGSHhqb2QxQ0VxYklnNUErT1RmTEtEdjBTZVRSR1BZK0h4?=
 =?utf-8?B?ZktqV0hKZVlMYnZ1VU13R0dLZXNQUUwxNUxyN0tWbk12QWlIeW9WaU5FdVU5?=
 =?utf-8?B?dnMzdXpSOUFvdjMrRWJFOW9wZWkvb2JJRUZObEF0c05McFVsZ3dOMlVLdmhS?=
 =?utf-8?B?MUxpaWVFcytYbXJBZ1hqR3BHZTJjYVdxTjRqVDUzRFBmcmx3NU02V0ViREIz?=
 =?utf-8?B?azdQTmtxOER5UTJXZFE1VGUxNEtzRllQSDVTRzFWY2lhR2FvVFFjUFM4Tm11?=
 =?utf-8?B?Z2doaVVOeVVTQ3NOVlljOGE0R0NLS2VtMUR5ejBmeTM5bVJ4UE1KUXV0WnRF?=
 =?utf-8?B?S2NDR3pBSndNdWV0dTM4bkgvblhHMFpGbmdLTUtEQ1FZYTN6RDRjRUZmTEIw?=
 =?utf-8?B?MVFRK1NJS292aFdhdm42WVlNaUZhMDJ0ck01S0ZaSE9NQ2xXeldNWEtRLzlz?=
 =?utf-8?B?QjNONHU2S2JPOERMTFFUUDdCZVVGcjVVR2FqUnN6czFRZDBsd0J1OTd6RFU2?=
 =?utf-8?B?TXVDemJYZ1NjcWx6akdZbUd4UW44U2h3dmFBb0x3VDZhYUNSNnBIK0tZZGND?=
 =?utf-8?B?OXM2Q25yMmhHUjB0SjYwWVBodVM5M0Z5eWNFeEF3dGdCa2VQMjhqODZFNEx4?=
 =?utf-8?B?ZEdkd0pvM2FRPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8836.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7725
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fa1de483-5f02-4f6f-93b4-08de02775205
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|14060799003|35042699022|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZWErZGZWdkcweHJsa3h0QjNnNHVYMEs3VDNJUUJMdDkrMjNhVjRsMkorVnBM?=
 =?utf-8?B?YkR1K1dIY1RoT25wSnd4UWphQzIyTWRydGIyQUo0UDB0cERCczkvOStOVTNk?=
 =?utf-8?B?U0drbHFDaWRKdUFvOGN5djFLbnI5ZCtPU01ZcEZ4eW1wQVhMdFlZbTczeDl3?=
 =?utf-8?B?WEJWMHJyZW9jNmJneXlzcUZ0RnA4TXFPTDBwdTBqNUtOMnQzcEwrVE5mK1J6?=
 =?utf-8?B?Q2hpNzI4dHFaQmp3aGFkZWFFcjVFOFpmOGRpcWNtK3dGWTJKZ3dBV2NzamMz?=
 =?utf-8?B?MmJvR01iNHF2S3pXcnRwdDBEWHNlQ2ZXc1VQOVdoeE9sbDRPd0NYWTZOS09B?=
 =?utf-8?B?ZlBvandaMUFwTXZpTk1HM1BWU0pic1ZpeURncDZKSVcyZkg0VUl5YUdIaHEx?=
 =?utf-8?B?OERub3dJWXRNWndGWmhRY0ZqY2NLa0hUbDJkeHlGbDhMVmJKNVVHTm5XNnFJ?=
 =?utf-8?B?bUhLaWNMOXNvNVRnemcwa2Q1cHdpU1FBQWRHTExMeGxUN0RYbXk1UVdTYWEx?=
 =?utf-8?B?dFJESU5XZkNSTHlDbXdGUm9FQldSQmZvQy85amVKYTVOcU5RM1lQM29kRWF2?=
 =?utf-8?B?Tk5YUVE4ZitPQVQ0dmlxeUV2R2JSeEV1anRDelczSW8zVG9acHBneHRmTmJr?=
 =?utf-8?B?ZVh3Wm1VRGxDa1JUZVZQTjI0MmYrNmxXWVhoa1BtclpHTWFVTTVQWGtFU2x1?=
 =?utf-8?B?VXhxN25NMHJMVVdyYld4Q1hRZnBjUCtpZm8wMzVFVTQ0RXI5OFJqNGVCK1Uw?=
 =?utf-8?B?eUJKcEFwaDdRamtVNVd5Vm9LOVhXamxBdUZyMmgxdzdVakxxNzlZcUVDM3NW?=
 =?utf-8?B?YlFUcU5VNXpvZ1U0VmRRYXFNdnBqVmlEZDhjQ1ZOeVpOUmtST0xNUWE3aks1?=
 =?utf-8?B?N09XckVjTnNKeUtjQlVLZHdFVUtxT3RJVlJSSWlJN1dGN0YxZDZrcXdTVzhO?=
 =?utf-8?B?QXdwcmF5SUpjUXJKbnpWM2pWR1NUSXVTVGlVWEttYXZFKzNDMDJ1WDZ5TjZt?=
 =?utf-8?B?Ym1SbHRSdXd0QjFJOG1BZXBLUHNkWjNsWkFsMTdGai9Cd3AvL0lBOFpEK2tU?=
 =?utf-8?B?WHQwSG9hYitiS1ZSeFJQNVFONzZsalFoczF4ekZmbWtibStZaUtnRTA5UWxQ?=
 =?utf-8?B?ODZaMG9TMVN2SzlGckJzVEVqaStIcjZTaCs5ei9jNmUyM0dKUUkxUm5rdjlY?=
 =?utf-8?B?VWlHS2U3aS9ZUzE2RkJKaDVUMWRrOHBQWDZzakgza0pLYjg3ZEkvTjI0MUE3?=
 =?utf-8?B?WFVYTWRKTW9nTVMyaXlOaEhEdm9tMk0wbE05cVA5KzhOUHdZb2ZiYld5RXRS?=
 =?utf-8?B?WW9qNHh3UW5MMG15VDdteTJVWXZWQ3hseW1kV01DdHhvcmxFRDNhMDd0RXkx?=
 =?utf-8?B?TmRxNk9TUTUzbjIyNXV3cDdxMi92WGl2TEViSVV0bjBuM1liN0FrQnZQNXRq?=
 =?utf-8?B?VjhmUE9BSjk1Q1BRUGFmcVphR21pY05pNjFVcWppVDFJc28rTVdhV05nOUkr?=
 =?utf-8?B?NE9iTWFwKzQybnZhL2xvY1hGSHBuQXRVTzRzSHhqTkYwQVR5L3JpL1FHR1Zx?=
 =?utf-8?B?czhQZUxNYzV0d2FiZURWOFd4N1JoUmQ4aWh6Rk1LRDUzL0RvZk44K2I0cklp?=
 =?utf-8?B?RGh6Q0JXelRwcTlIWGZ3UUthVHU3eWxqYXBRQ2lDSEFiLzh2ZjdvRFE1UW5o?=
 =?utf-8?B?RlFVRmRLeXM5Nkp0UXQ5QTZQblRielFZdndNZ2FGWFJKbnFCNURvVHdtcE5Q?=
 =?utf-8?B?S25xWktKbkw1a0Fib3N3SzJnZU1CZVExdHNLQnF6UHVhV2tLNGdIVnBPOERM?=
 =?utf-8?B?eUhuNExCRzBvYmgrUXpzb2pON3p0MnB2N0N6ckhmZDlNMFg1akdLSHZ4QkMr?=
 =?utf-8?B?emh5RUlYa0xVUUFYZzZQRDNSQjBUdWE3dWZjdlJZcnh1cUdUZjRaRDFZbm1i?=
 =?utf-8?B?dkd0aEhuNEhmdTVKVjg5Z1pvZzVwY2plQkZTOHhPTjNzeXhicE5xM1dzVWRo?=
 =?utf-8?B?eWYzSStoUXU4dzNCZmVGRzdyaVpFOUh6TVRLNUtBSHNLUHlJUDlNdFdKTzZu?=
 =?utf-8?B?cFEwaGdiWStkVnJpS2l4OG9FbG9pRW9TM1U2bmtsYmRabWZpdXV0S3Z6ZWps?=
 =?utf-8?Q?p+O8=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(14060799003)(35042699022)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 12:21:43.6595
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 051a1cb9-89a2-419e-7d5b-08de02776a1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7767


Hi Jacopo,

On 02/10/2025 14:28, Jacopo Mondi wrote:
> Hi Anthony
>    thanks for the details
> 
> On Thu, Oct 02, 2025 at 08:42:56AM +0100, Anthony McGivern wrote:
>>
>> Hi all,
>>
>> On 30/09/2025 13:58, Nicolas Dufresne wrote:
>>> Hi Laurent,
>>>
>>> Le mardi 30 septembre 2025 à 13:16 +0300, Laurent Pinchart a écrit :
>>>> On Tue, Sep 30, 2025 at 11:53:39AM +0200, Jacopo Mondi wrote:
>>>>> On Thu, Sep 25, 2025 at 09:26:56AM +0000, Anthony McGivern wrote:
>>>>>> On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
>>>>>>> Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
>>>>>>> contex. It extends 'struct media_entity_context' and is intended to be
>>>>>>> extended by drivers that can store driver-specific information
>>>>>>> in their derived types.
>>>>>>>
>>>>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>>>
>>>>>> I am interested in how the sub-device context will handle the
>>>>>> Streams API? Looking at the commits the
>>>>>> v4l2_subdev_enable/disable_streams functions still appear to operate
>>>>>> on the main sub-device only. I take it we would have additional
>>>>>> context-aware functions here that can fetch the subdev state from
>>>>>> the sub-device context, though I imagine some fields will have to be
>>>>>> moved into the context such as s_stream_enabled, or even
>>>>>> enabled_pads for non stream-aware drivers?
>>>>>
>>>>> mmm good question, I admit I might have not considered that part yet.
>>>>>
>>>>> Streams API should go in a soon as Sakari's long awaited series hits
>>>>> mainline, and I will certainly need to rebase soon, so I'll probably
>>>>> get back to this.
>>>>>
>>>>> Have you any idea about how this should be designed ?
>>
>> Hmm, while I haven't thought of a full implementation I did some testing
>> where I added a v4l2_subdev_context_enable_streams and it's respective
>> disable_streams. These would provide the v4l2_subdev_context so that
>> when the subdev state was fetched it would retrieve it from the context.
>> I think this would work with the streams API, however for drivers that don't
>> support this it will not since the fields such as enabled_pads are located
>> in the v4l2_subdev struct itself. Assuming these fields are only used in the
>> V4L2 core (haven't checked this fully) potentially they could be moved into
>> subdev state?
>>
>> There were some other areas that I found when trying to implement this
>> in the driver we are working on, for example media_pad_remote_pad_unique()
>> only uses the media_pad struct, meaning multi-context would not work here,
>> atleast in the way I expected. Perhaps this is where we have some differing
>> thoughts on how it would be used. See some details below about the driver we
>> are working on.
>>
>>>>
>>>> Multi-context is designed for memory to memory pipelines, as inline
>>>> pipelines can't be time-multiplexed (at least not without very specific
>>>> hardware designs that I haven't encountered in SoCs so far). In a
>>>
>>> I probably don't understand what you mean here, since I know you are well aware
>>> of the ISP design on RK3588. It has two cores, which allow handling up to 2
>>> sensors inline, but once you need more stream, you should have a way to
>>> reconfigure the pipeline and use one or both cores in a m2m (multi-context)
>>> fashion to extend its capability (balancing the resolutions and rate as usual).
>>>
>>> Perhaps you mean this specific case is already covered by the stream API
>>> combined with other floating proposal ? I think most of us our missing the big
>>> picture and just see organic proposals toward goals documented as un-related,
>>> but that actually looks related.
>>>
>>> Nicolas
>>>
>>>> memory-to-memory pipeline I expect the .enable/disable_streams()
>>>> operation to not do much, as the entities in the pipeline operate based
>>>> on buffers being queued on the input and output video devices. We may
>>>> still need to support this in the multi-context framework, depending on
>>>> the needs of drivers.
>>>>
>>>> Anthony, could you perhaps share some information about the pipeline
>>>> you're envisioning and the type of subdev that you think would cause
>>>> concerns ?
>>
>> I am currently working on a driver for the Mali-C720 ISP. See the link
>> below for the developer page relating to this for some details:
>>
>> https://developer.arm.com/Processors/Mali-C720AE
>>
>> To summarize, it is capable of supporting up to 16 sensors, either through
>> streaming inputs or memory-to-memory modesn and uses a hardware context manager
> 
> Could you help me better grasp this part ? Can the device work in m2m and inline
> mode at the same time ? IOW can you assign some of the input ports to
> the streaming part and reserve other input ports for m2m ? I'm
> interested in understanding which parts of the system is capable of
> reading from memory and which part is instead fed from the CSI-2
> receiver pipeline

Each context can run in either inline mode as you'd call it, or in m2m mode.
It would be perfectly valid to have one context connected to a sensor while
another simply takes frames from buffers.

The hardware has numerous raw/out buffer descriptors that we can reserve for
our contexts. The driver handles reserving descriptors to each context, at
which point we must configure them with fields such as data format,
resolution, etc. We also assign their addresses, which may come from buffers
allocated internally by the driver for inline sensors, or our vb2 queue from
our memory input v4l2 output device.

A context must be assigned an input, which in inline mode is our desired video
input id, or a raw buffer descriptor id in m2m mode.

For inline mode, we configure our video input with the appropriate data format
and resolution, and assign it a raw buffer descriptor (the one we reserved for
our context). The hardware will then write frames that arrive on this input to
those buffers, at which point the hardware will know this context is ready to
be scheduled.

For m2m, the driver writes the VB2 buffer address to the raw buffer descriptor,
then triggers the context to be ready for scheduling.

The hardware is then responsible for actually scheduling these contexts.
If desired a user can configure specific scheduling modes, though by default
we are using a first come, first serve approach.

Once scheduled, the hardware automatically reads from the context's assigned
raw buffer and injects it into the pipeline. At which point, each output
writes to their assigned output buffer descriptor, whose addresses are provided
by each capture device's vb2 queue.

> 
>> to schedule each context to be processed. There are four video inputs, each
>> supporting four virtual channels. On the processing side, there are two parallel
> 
> Similar in spirit to the previous question: "each input supports 4 virtual
> channels": does the 4 streams get demuxed to memory ? Or do they get
> demuxed to internal bus connected to the processing pipes ?
> 

Yes, the hardware treats every stream as a virtual input, so 16
virtual inputs in total. Each is configured with their own raw buffer descriptor
and thus images are written to separate buffers.

>> processing pipelines, one optimized for human vision and the other for computer
>> vision. These feed into numerous output pipelines, including four crop+scaler
>> pipes who can each independently select whether to use the HV or CV pipe as
>> its input.
>>
>> As such, our driver has a multi-layer topology to facilitate this configurability.
> 
> What do you mean by multi-layer ? :)

Perhaps my terminology is wrong here xD But the general idea is this:

      Input
       pipe
        /\
       /  \
      HV  CV
       \  /
      Outputs

The input pipe (not to be confused with the video inputs) is the first stage
of the processing pipeline. From here, the image can flow to both HV and CV in parallel.
At which point, the output pipelines can choose whether to use the image from the
human vision or computer vision pipe (mutually exclusive), and each output pipe can
choose independently (i.e. output 0 uses HV, while output 1 chooses CV). So I guess
I meant to say there are multiple layers in the media graph where links can be configured.

> 
>> With some small changes to Libcamera I have all of the output pipelines implemented
>> and the media graph is correctly configured, but we would like to update the driver
>> to support multi-context.
> 
> Care to share a .dot representation of the media graph ?
> 

Sure, I can attach what we have in the current state. Ofcourse this doesn't show the
internal routes, one point being in the input sub-device which can route streams
from the 4 sink pads to the 16 possible source pads. An example here might be two
sensors sharing the same sink pad on different VCs, routing one to context 0 and
the other to context 1.

We do also make use of streams within the isp sub-device to handle some hardware
muxes that control the flow of data through the input pipeline.
Perhaps this is not the best approach, I elected to use this over controls as different
routes actually affect the format of the image data. All the routes on the isp sub-device
are immutable with downstream sub-devices selecting which of these mutually exclusive
routes they wish to use.

Just to point out the isp sub-device represents the input pipeline. I called it this
to try avoid confusion with the video inputs, and also as it acts as the main point
of controlling the context (i.e. stopping/starting the HW). Data will always flow
through this pipeline, whereas HV and CV may not always be in use.

digraph board {
    rankdir=TB

    n00000001 [
        label="{{} | mali-c720 tpg 0\n/dev/v4l-subdev0 | {<port0> 0}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n00000001:port0 -> n00000009:port0 [style=dashed]
    n00000001:port0 -> n00000009:port1 [style=dashed]
    n00000001:port0 -> n00000009:port2 [style=dashed]
    n00000001:port0 -> n00000009:port3 [style=dashed]

    n00000003 [
        label="{{} | mali-c720 tpg 1\n/dev/v4l-subdev1 | {<port0> 0}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n00000003:port0 -> n00000009:port0 [style=dashed]
    n00000003:port0 -> n00000009:port1 [style=dashed]
    n00000003:port0 -> n00000009:port2 [style=dashed]
    n00000003:port0 -> n00000009:port3 [style=dashed]

    n00000005 [
        label="mali-c720 mem-input\n/dev/video1",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n00000005 -> n0000001e:port0 [style=dashed]

    n00000009 [
        label="{{<port0> 0 | <port1> 1 | <port2> 2 | <port3> 3} |
               mali-c720 input\n/dev/v4l-subdev2 |
               {<port4> 4 | <port5> 5 | <port6> 6 | <port7> 7 |
                <port8> 8 | <port9> 9 | <port10> 10 | <port11> 11 |
                <port12> 12 | <port13> 13 | <port14> 14 | <port15> 15 |
                <port16> 16 | <port17> 17 | <port18> 18 | <port19> 19}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n00000009:port4 -> n0000001e:port0 [style=dashed]
    n00000009:port5 -> n0000001e:port0 [style=dashed]
    n00000009:port6 -> n0000001e:port0 [style=dashed]
    n00000009:port7 -> n0000001e:port0 [style=dashed]
    n00000009:port8 -> n0000001e:port0 [style=dashed]
    n00000009:port9 -> n0000001e:port0 [style=dashed]
    n00000009:port10 -> n0000001e:port0 [style=dashed]
    n00000009:port11 -> n0000001e:port0 [style=dashed]
    n00000009:port12 -> n0000001e:port0 [style=dashed]
    n00000009:port13 -> n0000001e:port0 [style=dashed]
    n00000009:port14 -> n0000001e:port0 [style=dashed]
    n00000009:port15 -> n0000001e:port0 [style=dashed]
    n00000009:port16 -> n0000001e:port0 [style=dashed]
    n00000009:port17 -> n0000001e:port0 [style=dashed]
    n00000009:port18 -> n0000001e:port0 [style=dashed]
    n00000009:port19 -> n0000001e:port0 [style=dashed]

    n0000001e [
        label="{{<port0> 0 | <port1> 1} |
               mali-c720 isp\n/dev/v4l-subdev3 |
               {<port2> 2 | <port3> 3 | <port4> 4 |
                <port5> 5 | <port6> 6}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n0000001e:port3 -> n00000026:port0
    n0000001e:port4 -> n0000002a:port0
    n0000001e:port5 -> n0000003e:port0
    n0000001e:port6 -> n0000003e:port0 [style=dashed]
    n0000001e:port6 -> n00000047:port0 [style=dashed]
    n0000001e:port2 -> n0000007e

    n00000026 [
        label="{{<port0> 0} |
               mali-c720 hv pipe\n/dev/v4l-subdev4 |
               {<port1> 1 | <port2> 2}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n00000026:port1 -> n0000002e:port0
    n00000026:port1 -> n00000032:port0
    n00000026:port1 -> n00000036:port0
    n00000026:port1 -> n0000003a:port0
    n00000026:port2 -> n0000003e:port0 [style=dashed]
    n00000026:port1 -> n00000047:port0

    n0000002a [
        label="{{<port0> 0} |
               mali-c720 cv pipe\n/dev/v4l-subdev5 |
               {<port1> 1 | <port2> 2}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n0000002a:port1 -> n0000002e:port0 [style=dashed]
    n0000002a:port1 -> n00000032:port0 [style=dashed]
    n0000002a:port1 -> n00000036:port0 [style=dashed]
    n0000002a:port1 -> n0000003a:port0 [style=dashed]
    n0000002a:port2 -> n0000003e:port0 [style=dashed]
    n0000002a:port1 -> n00000047:port0 [style=dashed]

    n0000002e [
        label="{{<port0> 0} |
               mali-c720 fr 0 pipe\n/dev/v4l-subdev6 |
               {<port1> 1 | <port2> 2}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n0000002e:port1 -> n0000004a
    n0000002e:port2 -> n0000004e
    n0000002e:port1 -> n00000042:port0 [style=dashed]
    n0000002e:port2 -> n00000042:port0 [style=dashed]

    n00000032 [
        label="{{<port0> 0} |
               mali-c720 fr 1 pipe\n/dev/v4l-subdev7 |
               {<port1> 1 | <port2> 2}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n00000032:port1 -> n00000052
    n00000032:port2 -> n00000056
    n00000032:port1 -> n00000042:port0 [style=dashed]
    n00000032:port2 -> n00000042:port0 [style=dashed]

    n00000036 [
        label="{{<port0> 0} |
               mali-c720 fr 2 pipe\n/dev/v4l-subdev8 |
               {<port1> 1 | <port2> 2}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n00000036:port1 -> n0000005a
    n00000036:port2 -> n0000005e
    n00000036:port1 -> n00000042:port0 [style=dashed]
    n00000036:port2 -> n00000042:port0 [style=dashed]

    n0000003a [
        label="{{<port0> 0} |
               mali-c720 fr 3 pipe\n/dev/v4l-subdev9 |
               {<port1> 1 | <port2> 2}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n0000003a:port1 -> n00000062
    n0000003a:port2 -> n00000066
    n0000003a:port1 -> n00000042:port0 [style=dashed]
    n0000003a:port2 -> n00000042:port0 [style=dashed]

    n0000003e [
        label="{{<port0> 0} |
               mali-c720 raw pipe\n/dev/v4l-subdev10 |
               {<port1> 1 | <port2> 2}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n0000003e:port1 -> n00000076
    n0000003e:port2 -> n00000042:port0 [style=dashed]

    n00000042 [
        label="{{<port0> 0} |
               mali-c720 foveated pipe\n/dev/v4l-subdev11 |
               {<port1> 1 | <port2> 2 | <port3> 3}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n00000042:port1 -> n0000006a
    n00000042:port2 -> n0000006e
    n00000042:port3 -> n00000072

    n00000047 [
        label="{{<port0> 0} |
               mali-c720 pyramid pipe\n/dev/v4l-subdev12 |
               {<port1> 1}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n00000047:port1 -> n0000007a

    n0000004a [
        label="mali-c720 fr0-rgb\n/dev/video2",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n0000004e [
        label="mali-c720 fr0-yuv\n/dev/video3",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n00000052 [
        label="mali-c720 fr1-rgb\n/dev/video4",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n00000056 [
        label="mali-c720 fr1-yuv\n/dev/video5",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n0000005a [
        label="mali-c720 fr2-rgb\n/dev/video6",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n0000005e [
        label="mali-c720 fr2-yuv\n/dev/video7",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n00000062 [
        label="mali-c720 fr3-rgb\n/dev/video8",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n00000066 [
        label="mali-c720 fr3-yuv\n/dev/video9",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n0000006a [
        label="mali-c720 fov-0\n/dev/video10",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n0000006e [
        label="mali-c720 fov-1\n/dev/video11",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n00000072 [
        label="mali-c720 fov-2\n/dev/video12",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n00000076 [
        label="mali-c720 raw\n/dev/video13",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n0000007a [
        label="mali-c720 pyramid\n/dev/video14",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n0000007e [
        label="mali-c720 3a stats\n/dev/video15",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n00000082 [
        label="mali-c720 3a params\n/dev/video16",
        shape=box,
        style=filled,
        fillcolor=yellow
    ]
    n00000082 -> n0000001e:port1

    n0000010a [
        label="{{<port0> 0} |
               lte-csi2-rx\n/dev/v4l-subdev13 |
               {<port1> 1}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n0000010a:port1 -> n00000009:port0

    n0000010f [
        label="{{} | ar0231 0-0010\n/dev/v4l-subdev14 | {<port0> 0}}",
        shape=Mrecord,
        style=filled,
        fillcolor=green
    ]
    n0000010f:port0 -> n0000010a:port0 [style=bold]
}

>>
>> My understanding intially was each context could have it's own topology configured
>> while using the same sub-devices. For example, context 0 may link our crop+scaler
>> pipes to human vision, whereas context 1 uses computer vision. Similarly, our input
>> sub-device uses internal routing to route from the desired sensor to it's context.
>> It would by my thoughts that the input sub-device here would be shared across every
>> context but could route the sensor data to the necessary contexts. With the current
>> implementation, we make large use of the streams API and have many links to configure
>> based on the usecase so in our case any multi-context integration would also need
>> to support this.
>>
> 
> Media link state and routing I think make sense in the perspective of
> contexts. I still feel like for ISP pipelines we could do with just
> media links, but routing can be used as well (and in facts we already
> do in the C55 iirc). At this time there is no support in this series
> for this simply because it's not a feature I need.
> 
> As Laurent said, the stream API are mostly designed to represent data
> streams multiplexed on the same physical bus, with CSI-2 being the
> main use case for now, and I admit I'm still not sure if and how they
> have to be considered when operated with contexts.
> 

Technically the streams could only be used for our driver on the video inputs,
handling routing sensor inputs to the appropriate contexts. Though I haven't
thought of a better way to deal with the internal routing within the pipeline
for the hardware muxes, especially since they affect the data format and in some
cases the resolution.

> My general rule of thumb to decide if a point in the pipeline should
> be context aware or not is: "can its configuration change on a
> per-frame bases ?". If yes, then it means it is designed to be
> time-multiplex between different contexts. If not, maybe I'm
> oversimplifying here, then there is no need to alternate its usage on
> a per-context base and a properly designed link/routing setup should
> do.
> 

In our case we can completely change the configuration of the ISP on
every frame including internal muxes, which outputs are in use, etc.
But of course it makes sense that not every ISP may support this
functionality.

Thanks,
Anthony

> I've discussed yesterday with Micheal if contexts could also be used
> for partitioning a graph (making sure two non-overlapping partitions
> of the pipeline can be used at the same time by two different
> applications). I guess you could, but that's not the primary target,
> as if the pipeline is properly designed you should be able to properly
> partition it using media links and routing.
> 
> Happy to discuss your use case in more detail though to make sure
> that, even not all the required features are there in this first
> version, we're not designing something that makes it impossible to
> support them in future.
> 
>> Anthony


