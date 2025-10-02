Return-Path: <linux-media+bounces-43533-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B31ABB2B86
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 09:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2BDB716477C
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 07:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C457E2D0275;
	Thu,  2 Oct 2025 07:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TAVeqK8y";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TAVeqK8y"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013002.outbound.protection.outlook.com [52.101.83.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E263224AF0;
	Thu,  2 Oct 2025 07:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.2
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759391029; cv=fail; b=CoG+E4JVXWRkZpClquj2zb0ZrdIScMn6WrIlwsZw28WauZAaF4FBwRTKkSknYsVCSnsZEMGOVj5Iujou/YM2oRl3TwHbjDxobB9NYNyDJxFLfRdIqiIJs+kGuqgrudhrIlD1D+3zhpM5OgG+8ml/PK7698uJyTv0s+GuTsOrlE4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759391029; c=relaxed/simple;
	bh=orNkJPr9h8o4oqQLEFtYtc5PrmWn/5pK2l76xBlDKkY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qK1lzpyr3OxWx0yJuJ+CybPM0Oi+jv+LJtdOm5NsP1505ju7uclN0rZSRQ3mOxBVdgq5FaHlRH7568mfu64oyLutDyliXmN/lCVEjJ2sXQuyo2MbqmFXWuwFcbj6jLPuHdcEqRohca71OGTbKU/HI/rYPXboH3DickRng1IMdns=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TAVeqK8y; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TAVeqK8y; arc=fail smtp.client-ip=52.101.83.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rvDQ5N5NJX4CGqTdzw8G4Rjgy5TMFzAtHdB0V2vI8/riOgo9RS4MYASDXlDMLQHKejAH7VhCq50lrcBEr8MnrTKnagGjkUb0gWYx8w83aGuLCvsLWRIjnCc7EwiUNu3x409u+gy9QZvE36GKah1dECKjA1syhlGRmrEHZ1WkW7hTtTZkXEtQkTZD+H7rXxuTQgxJRundsGZPc+/exwS1kDS2nZueHWqgpMV+Td2MEwqvJ/0KzLlaqOcnaeJ6cv09jFHO7drew4fitLNWQ10dDnwUPP4Pr45srjrFwCHCx7lw7tQdE4mV/CKanl9eST9nFIR9XB1dee3viQTP8fmO0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9JFYwOzYB8BHg08WGW4TJnsXOgherfl2i5B+mKduzc=;
 b=huM5QaaKCZSFyedsG5ig0lAVLiik0UTX91G/MMTwXuNDvAVjnlWStpjMBMbcpCraFzRZBkGpe+12gKvsvKt+DQgrUByFau9t7WHjDFqWqFNkUPNMTiB9iEWeAxMJ/yglGrgmArV2RLDAD+2Cbhna8U+CdVEgBZ2jJRFsvkNal2Ws7uviKLX5FeMFuSybU3ktBV4T90zuDhkyaULvK2vHhgN+69fkMCQb/TFaTcOaCbKNABqNmjuyB0/7rJXWetqL9oAIZQUQNYZKt1ZciVWsuhGM+wd6PaSEgswztEtejfzsd9na/5TtStBK3B0RouPqNZmWkzKhqNsvHC6BSGdSDw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9JFYwOzYB8BHg08WGW4TJnsXOgherfl2i5B+mKduzc=;
 b=TAVeqK8yDI8Twhs0ixOjfxVleRQMUbzSv7enErm3nFsJt7WnnDjFFp2fW/y0xVRYLUX4wk4tw1yMXkM1tmkXAxgJCOI4VbPz6PW/BLYEVWiFCGx07+/gcl5lRHBGqKszmwoNNtHaJ17tK+1p7xnZ+WrQZxMjMgqm+kBuleiLgOc=
Received: from CWLP123CA0220.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19d::11)
 by DU2PR08MB10188.eurprd08.prod.outlook.com (2603:10a6:10:46f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 07:43:36 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:400:19d:cafe::e2) by CWLP123CA0220.outlook.office365.com
 (2603:10a6:400:19d::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.14 via Frontend Transport; Thu,
 2 Oct 2025 07:43:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.15
 via Frontend Transport; Thu, 2 Oct 2025 07:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J3C1jtxJ/oAgZatOdwLYEOpKC9agj6JiE1AmKXj+ngnpYdZscTQ0ZmAXyfDs5ikWi3JuG4LtQ2egi2iaLHjtwycdp1aeQ3G/oOF3uOZm+AazRHR6710vFihzZdsyqXoKsEBLbvxQZd2Yjp84MsAyGBuYrDtp4Unn5NT6n+T9ttYfxS3qxzOrJ3ZrQn7EhP/1ieX72dDJRrSiCZ4SXd+gXyFmV3gsTd4Mn8CNrTsMEc5ZVNSp64Z52jihn4XCxXZi3djBggWxUzn4ya2/WHEaV7nd1oYyQ4UrXHlgSvTISMtak7g6izDPTcsi+f43hyGcpJvAtmyKzWroEb43R0fXKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r9JFYwOzYB8BHg08WGW4TJnsXOgherfl2i5B+mKduzc=;
 b=EJqFZvPEZdlAKEGAogD8+jGkyiSzZgOeN6wEZ4+V2crSwAolt5YmffssBBT2iXgMRWUi6NNSFmFrFdmh6Ozi0xc0CS1+MFq3eN5I1+ehFQrNF4HI6xIT9aRO+X5GejKzbXAvONfDGJIo0UgZNq6GMkBHCrpDiDvJQ1s2eY39r41/qyvbz2hIIM4mtpR51SvXUHKj+xhhD08IKqwso/lL3rNT+sFvdRzRXcGnSrG32RXqDpQqWu74MY4QM8ly3oCsaxNeVTVOrhAEtx9Y5UvFn8gfUbp5MngTOjc3WiW6IGsQ2bOj87Up25OjZFAHbbL98QsVp/ICHmJPC67SQId64w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r9JFYwOzYB8BHg08WGW4TJnsXOgherfl2i5B+mKduzc=;
 b=TAVeqK8yDI8Twhs0ixOjfxVleRQMUbzSv7enErm3nFsJt7WnnDjFFp2fW/y0xVRYLUX4wk4tw1yMXkM1tmkXAxgJCOI4VbPz6PW/BLYEVWiFCGx07+/gcl5lRHBGqKszmwoNNtHaJ17tK+1p7xnZ+WrQZxMjMgqm+kBuleiLgOc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB8836.eurprd08.prod.outlook.com (2603:10a6:10:47d::22)
 by DB9PR08MB7771.eurprd08.prod.outlook.com (2603:10a6:10:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 07:42:58 +0000
Received: from DU0PR08MB8836.eurprd08.prod.outlook.com
 ([fe80::9aba:aa1e:acfa:8165]) by DU0PR08MB8836.eurprd08.prod.outlook.com
 ([fe80::9aba:aa1e:acfa:8165%7]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 07:42:57 +0000
Message-ID: <413937a1-bf4c-4926-945f-7df39869f215@arm.com>
Date: Thu, 2 Oct 2025 08:42:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/27] media: v4l2-subdev: Introduce v4l2 subdev
 context
Content-Language: en-GB
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: "bcm-kernel-feedback-list@broadcom.com"
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
From: Anthony McGivern <anthony.mcgivern@arm.com>
In-Reply-To: <2efcfe19bafd1276e9fc71b72e251443f313d693.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0190.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::18) To DU0PR08MB8836.eurprd08.prod.outlook.com
 (2603:10a6:10:47d::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB8836:EE_|DB9PR08MB7771:EE_|AM4PEPF00027A5D:EE_|DU2PR08MB10188:EE_
X-MS-Office365-Filtering-Correlation-Id: 3849ed8b-49aa-49bf-5120-08de0187646b
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Qk1GTGVpcXJWZm40RjliQnFQd1VUNldzUjE0bDljSkdVR0g0TmwyT3c5NWpW?=
 =?utf-8?B?dWtRbm13MUpFeUpQVy92Ym4zbC9ETjlucmZyWGtXdDJpWmYrR0ZDblhlZzlL?=
 =?utf-8?B?a3lGLzdyaXZnR3Fqd2hrNmk0VkVPN090V2ZkTlpqMWFXY1EwU1N5N1FMV1dJ?=
 =?utf-8?B?dTBSNi9pTk9NakVNc3BwTGwvSWlsVzIwVnBVMUdYNCs3NmFyMEdmSVJpYUl5?=
 =?utf-8?B?V3lFWHBTcUI1eG0vSG9BbXJiSEFReFFaMFVLY2xYSkcrNDJ6V0RYNitYR0pZ?=
 =?utf-8?B?QjhJS3FXc3QyQ1FBY2YrTXExcXE1S1RrMStuRUw4RURLMVpnUlFrcUVndWR3?=
 =?utf-8?B?Mld2c01mVmlFVHN3VEVNNmVFV2c5Z3hYdW0zQTM0Rm4wRnpMcUl4SGhnd0V2?=
 =?utf-8?B?Wk9QMFREcytEUDhOdGV0UktwaHdXQUE0bWhBTGhmb0ZiMFBCOUthKzBJLzhL?=
 =?utf-8?B?L25JNnUraG90WjN3QjlKMWF5cTQ2amdSUEdIWUJGbWUrR2REbzhvWDhPbVNB?=
 =?utf-8?B?Z3MvN2QraWRja2pvTXhxOGVsT3UyK09Pcmt1TFROKzdRaGpncFhiNzQ0MVA1?=
 =?utf-8?B?aThDUVY5K0lVQTFpTy8zQkQvM1FMTm1XaXBaQS9lQkhNQmcwQ25RblNRdWZs?=
 =?utf-8?B?SWR2Q0xuUkpBMVNMU3B4WStuUnN4a2pNSmhEa2tTUmxiRVZXU0VUNWlxaUE5?=
 =?utf-8?B?T09ock1COFlxbFhyMldaZkFHb0NIeE1yWUJzUTRoM3NGR0NuSGxtVUNzSE5z?=
 =?utf-8?B?R1pkYm5UR2RiWHBnN1lVVXZaRklxc3lHc3hnNW0zTHJNc0NNUXduemZ4RVdW?=
 =?utf-8?B?TlA4clpPTHEvNTZCclArK3pGNFhhNG02QnpqUUhKSHcrcmVBSUVJRmNyU2Zh?=
 =?utf-8?B?Q25scWhnQUQ1NENyZnVGU2hlSDEwTE5FV0dkUTVHS3ZvSkMwVGIvSnAyd0Fx?=
 =?utf-8?B?cUt1RWNJZWtLaFZTM0VGVG01ellSRVBrVFdNQlZoeU1RclY5aEY1NTVXVFBm?=
 =?utf-8?B?aTI1L0ZRa0s1M250Y052WUtWczlBQ1FQRWpKZWxoTXVkdHJickU4WFIwZ1pR?=
 =?utf-8?B?alRyUmdvSyt3L0kraDZNZ1VLTWtmSGxEVUgySVVZNmZJcy81eFJJVCtDVWVh?=
 =?utf-8?B?UUZXcWJFZ2VmeGR6MW94ZXFpRElsTlpORGNnWitMSXZiTGlVRFJnNkY4N2RO?=
 =?utf-8?B?VHFCbi9qZ0VxNHhpNHZmWEQ3QU4rWTY0L2loZlhKSFd3KzdGVS9KTzNhQm1V?=
 =?utf-8?B?STZlZXIwMzdMSnUrZ2d1cCtxZ29uVlNmbWthZWpEVDFrN05rbVhsclJYTjBP?=
 =?utf-8?B?cWhSRVlaRlNyNllKcnJHbVB3VFQvSERjUVNZaEdzQzg4V21LVTFEdVIvSFUr?=
 =?utf-8?B?N3BjQVYxOFRZTmFoQjNwUVRleEdzU2IyTXU2ZnZDSEFESU9rSFEyL2dmMDZQ?=
 =?utf-8?B?NTg4Sys2ZkhjVHUrNy9xRzhYVWo3TXVaZW4wSzNLOWdFV1RIK0l3NmpQcE02?=
 =?utf-8?B?N1ZOdDRIUWFvYXFUYjlWbE9xenJIbE42UWlFVHQvL3paRndING1uMFFBcExN?=
 =?utf-8?B?M3BtTjBrVlNKem1RWUZUakEyQ2lvNDNCOWF5VUkzSTB2RUg3QnFJcjc4UjFo?=
 =?utf-8?B?WVpyVWZiRFNrSXlXS085NWFjSFFkSEY1UFVGSWVhb0NUM1dWZ3R1eWlINHVI?=
 =?utf-8?B?R0Z3MUlsM0hDZWh4OW9YekdQYk1VMCtDVFBkeWRNZjNKcEgzWmJOLzdOSDJG?=
 =?utf-8?B?ei9CajZDekpuNW0zTWFLVHhxd3gwT0hRaCtxVjVtWDdxRVZ2Yzc3OVdmYTV2?=
 =?utf-8?B?bmNuUGt5WThrTVl1NlE4aDc1RTI1UTZCeW9FUXl1Qzk4Yy8zdXMvaWRpWVpi?=
 =?utf-8?B?SWs3UVUxTXFIaHVuSzUzOTdTL1ZKUlYwVlFjVHdLS3UwOGd5ZmFnNVQ4YWVn?=
 =?utf-8?B?aStRR1pLaHRRZHoxc09vQm1vaDB6VzI5enVPR2VRaGdXMC8rTk1ZU1B4OEZk?=
 =?utf-8?B?WjFoMzZSRGx3PT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB8836.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7771
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	829aa0dd-6396-4381-9d7c-08de01874df6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|14060799003|35042699022|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVlHZUFsMFBWdjVBWGE4NVZKdDhFKy9YcG5SSk1ZUXpTd2F6a0pLMjRmdzJI?=
 =?utf-8?B?ei84RDZIUzhNUXJCNW1hTlFzVjJ5YkZEWkNEQUo2NExjRU1mVE5meTdSV08v?=
 =?utf-8?B?azhsLzl0NDl6cVRJZ29MV0NyY0RPQU1IMml0NlpmcnRYRWp0WHNxUUwwR3Yx?=
 =?utf-8?B?VkZlNWc3RmU5Um5xZWVENXRMK3JYQ1prNUFNaEExaWxBVnZRT0c2ODRCekMy?=
 =?utf-8?B?R2JmQnpZWmJHd21naHVQSWFoL05OTy9namFmVUpCcnJueWhYWDFzc3dxcFNo?=
 =?utf-8?B?VGx3REQranV5RC8vQWs4cjIyZHZNMzladmh6WUxWOXB1cWo4ZHhocURnSHh2?=
 =?utf-8?B?WFBwV0c1S1BJcVU1dDU3Q1lYL1NVc2Z6MlZxQ21jSUVlb0tRTXA2bWZyT3Z2?=
 =?utf-8?B?eldwZ3FOV0Z3Y2J6MmtWeVhYUndCcCtSamNZOTYwc093eCt1YjdZT0dpWkxK?=
 =?utf-8?B?cHEvOWt1aFdRU3Bjc0ZGbFRTYUwwbCs2T3hyY1IwQm9JczFiN0hjL3lCMnhh?=
 =?utf-8?B?dWtNR1VqOTd6WUNXLy8xaEZwNTFnZG1Bbmc2ZHlSdUNkRVgyRnA5SEYvdXJN?=
 =?utf-8?B?dWovbGJaTzlPdjAzUkdxRDdrZTJUSDNURU80THY5aW5WbjhiSU5WUklYQ2FB?=
 =?utf-8?B?S1BiNlhuYitpdVhKaTFBMEdybzBRM0hYSkJ3b0ZTTGVQQkRqU25BZUhINE9T?=
 =?utf-8?B?Zm1mMzRsNkZRSVNWak0zTjQrVDVYUS9KZXE2S0dwbmJsbGR1clFMVThWYmRG?=
 =?utf-8?B?b3diWEVqOHJ4aVFPbFRLbHdRYVhLRkIrRkJ3WksvcDhENzdVbmp4aSsza01Y?=
 =?utf-8?B?dFBrdUk0azYvdnpOTHpXV0R1d0F3eGZyanBHRU5nSGtSVXNGOXU0SVBnZWwx?=
 =?utf-8?B?SFU0elo0QWkwb09iK1NacU5sRTcveGJ4WWVpZjNsWC91OTQranYxdTl3Vzg5?=
 =?utf-8?B?QmgvZ0wzWFEweEZSVWlhSVFKQ2V5ZVZmVTBxTmVCdG0xWFZVdjZJRFhiVFVE?=
 =?utf-8?B?TGk2bXorRTRwa3VjWUVTdHREYWE5L2RqMUU4TTUxbk10Z2VMTlVYUXRXTXBl?=
 =?utf-8?B?Y2cxNWlyQ1hPODl4TDh4T0FSbUd3RUwwdCsvU204SFpyTW00NlZJbGpJT2s2?=
 =?utf-8?B?MFdMS05wT0xUcTkxOVFnV1lXUE43N3ZGSWdNZnlZS2pCQjhDT04yUjU2MjQ1?=
 =?utf-8?B?bWcvd3ZtbEpEZHJobjZRNVVnR3RtL1BOd3BpS2ZheGhmbXBXRGUrWDZzRi9S?=
 =?utf-8?B?eE5kWEZrdmZpVUZVMmwwd2Qyb3pvSFQ1QStvVkRXK2tlRXVHVm9SbWRmeTBN?=
 =?utf-8?B?QVQzbDIwYnFvZnBaV1VkNTA1N0JhaVBtSGtzcUVOUzYwcjQyc21SQmhlNXVv?=
 =?utf-8?B?SnpiMUNRVURwandpVUg3NU4zYm0vOTZxQnFJN2p0QjAzbUtNN3lpNkdkc2xy?=
 =?utf-8?B?SWkxdW1Xd1ZheGsyNDRacGtJVTJZMWVubU5jS0VTSEFQdmNqLzBONHdmTjFJ?=
 =?utf-8?B?aTFwS0M0ZFdLL1VvVlRVYkhPSW9qVndvSFNiVGE1Y3pHMEJKMzVVOUthV1h0?=
 =?utf-8?B?R29QVmdwemxZajRWMHJKbkNrZGlGQS9oU0o5NGJsK1pTUHVyOGRqdXVNdHhL?=
 =?utf-8?B?YjlIemdUc0EwcklWV3lGR01FOFRRL0lJaDFUeUNhWnRlMm9aU1NVbHRHb0FD?=
 =?utf-8?B?ajc2Zk5RK21Tcm5Xb0xZUnd3Zzl0U1hKMWFCd1NMNFFTTlJNKytnNEozT25n?=
 =?utf-8?B?V1VFbFhnL3pocVBRL3dpLzQwTmo5S3BZYlRkTVVMdHJLNEFGTVRwQ0dwN1c0?=
 =?utf-8?B?d01jZEtxQVhldDZHbUN2SVV3QVJQMHdlY01nb2M2cUo4L05qRlVRUVZkV1hT?=
 =?utf-8?B?OElwd0haTWh1Tkh1aXNWVnFRdkJ4aU43SmNPR2hzMytNSkdxYkVyaFNJY0I3?=
 =?utf-8?B?QkFLbkk3Vm5HM0lrN2NHZlcxb3Jvb3FFY3A4UlZoSXBaZ1JuV214ZkJZUHpZ?=
 =?utf-8?B?YTI5b3F3dXJ4YlZFRlZzUDdpdGFjWTBEOGlpSWRlcXhSR25GTnQ5TlBMU1A5?=
 =?utf-8?B?YnFrL1BHYlJPVkJxazZ1U0VhblduRkVvQUJHVEJ3dmdQbW12OWVKck9IUE8x?=
 =?utf-8?Q?9Qbc=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(14060799003)(35042699022)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 07:43:34.9189
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3849ed8b-49aa-49bf-5120-08de0187646b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10188


Hi all,

On 30/09/2025 13:58, Nicolas Dufresne wrote:
> Hi Laurent,
> 
> Le mardi 30 septembre 2025 à 13:16 +0300, Laurent Pinchart a écrit :
>> On Tue, Sep 30, 2025 at 11:53:39AM +0200, Jacopo Mondi wrote:
>>> On Thu, Sep 25, 2025 at 09:26:56AM +0000, Anthony McGivern wrote:
>>>> On Thu, Jul 24, 2025 at 16:10:19 +0200, Jacopo Mondi write:
>>>>> Introduce a new type in v4l2 subdev that represents a v4l2 subdevice
>>>>> contex. It extends 'struct media_entity_context' and is intended to be
>>>>> extended by drivers that can store driver-specific information
>>>>> in their derived types.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>>>
>>>> I am interested in how the sub-device context will handle the
>>>> Streams API? Looking at the commits the
>>>> v4l2_subdev_enable/disable_streams functions still appear to operate
>>>> on the main sub-device only. I take it we would have additional
>>>> context-aware functions here that can fetch the subdev state from
>>>> the sub-device context, though I imagine some fields will have to be
>>>> moved into the context such as s_stream_enabled, or even
>>>> enabled_pads for non stream-aware drivers?
>>>
>>> mmm good question, I admit I might have not considered that part yet.
>>>
>>> Streams API should go in a soon as Sakari's long awaited series hits
>>> mainline, and I will certainly need to rebase soon, so I'll probably
>>> get back to this.
>>>
>>> Have you any idea about how this should be designed ?

Hmm, while I haven't thought of a full implementation I did some testing
where I added a v4l2_subdev_context_enable_streams and it's respective
disable_streams. These would provide the v4l2_subdev_context so that
when the subdev state was fetched it would retrieve it from the context.
I think this would work with the streams API, however for drivers that don't
support this it will not since the fields such as enabled_pads are located
in the v4l2_subdev struct itself. Assuming these fields are only used in the
V4L2 core (haven't checked this fully) potentially they could be moved into
subdev state?

There were some other areas that I found when trying to implement this
in the driver we are working on, for example media_pad_remote_pad_unique()
only uses the media_pad struct, meaning multi-context would not work here,
atleast in the way I expected. Perhaps this is where we have some differing
thoughts on how it would be used. See some details below about the driver we
are working on.

>>
>> Multi-context is designed for memory to memory pipelines, as inline
>> pipelines can't be time-multiplexed (at least not without very specific
>> hardware designs that I haven't encountered in SoCs so far). In a
> 
> I probably don't understand what you mean here, since I know you are well aware
> of the ISP design on RK3588. It has two cores, which allow handling up to 2
> sensors inline, but once you need more stream, you should have a way to
> reconfigure the pipeline and use one or both cores in a m2m (multi-context)
> fashion to extend its capability (balancing the resolutions and rate as usual).
> 
> Perhaps you mean this specific case is already covered by the stream API
> combined with other floating proposal ? I think most of us our missing the big
> picture and just see organic proposals toward goals documented as un-related,
> but that actually looks related.
> 
> Nicolas
> 
>> memory-to-memory pipeline I expect the .enable/disable_streams()
>> operation to not do much, as the entities in the pipeline operate based
>> on buffers being queued on the input and output video devices. We may
>> still need to support this in the multi-context framework, depending on
>> the needs of drivers.
>>
>> Anthony, could you perhaps share some information about the pipeline
>> you're envisioning and the type of subdev that you think would cause
>> concerns ?

I am currently working on a driver for the Mali-C720 ISP. See the link
below for the developer page relating to this for some details:

https://developer.arm.com/Processors/Mali-C720AE

To summarize, it is capable of supporting up to 16 sensors, either through
streaming inputs or memory-to-memory modesn and uses a hardware context manager
to schedule each context to be processed. There are four video inputs, each
supporting four virtual channels. On the processing side, there are two parallel
processing pipelines, one optimized for human vision and the other for computer
vision. These feed into numerous output pipelines, including four crop+scaler
pipes who can each independently select whether to use the HV or CV pipe as
its input.

As such, our driver has a multi-layer topology to facilitate this configurability.
With some small changes to Libcamera I have all of the output pipelines implemented
and the media graph is correctly configured, but we would like to update the driver
to support multi-context.

My understanding intially was each context could have it's own topology configured
while using the same sub-devices. For example, context 0 may link our crop+scaler
pipes to human vision, whereas context 1 uses computer vision. Similarly, our input
sub-device uses internal routing to route from the desired sensor to it's context.
It would by my thoughts that the input sub-device here would be shared across every
context but could route the sensor data to the necessary contexts. With the current
implementation, we make large use of the streams API and have many links to configure
based on the usecase so in our case any multi-context integration would also need
to support this.

Anthony

