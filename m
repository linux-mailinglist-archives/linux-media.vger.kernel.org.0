Return-Path: <linux-media+bounces-42743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B510B88472
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CE211B6515E
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 07:47:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C855D2E8DEF;
	Fri, 19 Sep 2025 07:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="RVbevNvC"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021084.outbound.protection.outlook.com [52.101.65.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FF62D23B1;
	Fri, 19 Sep 2025 07:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268139; cv=fail; b=cdoSeFbzPHpuglOZtQfGVW2xAOkOOjImEfLh0twcAxoj59Dl+tnUblq0LB/bwZHCp/5wp2j1PO2Dj3fVR5/uRGod0VOoWLs6aPizs9U2RMdO4i/KPbFtQy1p/qqv6vyiRdBNrOZLZQH/MqG6aar2bSDOzqni/9xbSo55pQvDw1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268139; c=relaxed/simple;
	bh=zP5HDcsmTwrGEwyB5DsJpwkYxcbYf5zCkb4zBV56nvw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gSLfv1o3qfkf9kEAYY+0tob22NO+drDM5t528GQsJZDTMktxpG71JxcVJOKNA6rJkYS8bSLGI/i3a2EEwyK2EzBh6SR6bnaUaCwfAgBRxXgtEA/OYwmJXkOFN0SybNZaLvcDuER0JG8UW8WgYByLnSEJM9b/WbBrBoW8w0joCaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=RVbevNvC; arc=fail smtp.client-ip=52.101.65.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jz0E+htXOcjApSCD8jKkzWfy3dHYYTPNNR1p/UDFbI/ANQkbTp0MglDTEOdiwGdkF4DZwC2ruiY+PIdVEnLH0D6iAdfgy8Q44nKgYu44VAAz+qm4YW6WG6m+4F0ujBn2pJMIt+bw2k6Ya2HAcAIIQlFMCKcAB4tredDf1yZViWyV1Qp9cojR1DwX6xE0o3Sxtk51XugPwCabAjLT566rr+CH6GaTK+U1EsnAKd/MwyRiiasu7XQ28EQ4XPmTwSv6NtvRUw7sREFGWic02N5ZIPM70oCe/wK5f4Rpfo8pCvHmXa21K7pyPA7pa8o9NwGQjTwefkV7K6LQ2T+/JH4ODQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bowgxVZC3+vus6I98qKdZrftjqPwn6pX3egunThKYFQ=;
 b=OSKeNloPgzLbC18oZy1tNbEGGBp65Ov5/68Dp54U9b3jRPR0FufyclzHfYHGX70ayHrKeNVy0NfxpchXGDvkJcmcuEE6pow2TSu7pFrqnJi2K5HOqHZVtA1lZ8CgFTvEkVSOLfnr+n4zCAUHpHOreCbu6uq1u2iuPgUMomMlA3BlNuGsInNo9LPMdLIDG5Lx0dO/mjwx8KFDXWJpOeL33Bv/M2av2fDurGJvPAEiBfeWtmH1gLus6VeaJgox5Rdy/IgkIubHCQAsca5eEo3xwx1aCjN+Y88ShatR6T1iu7xfUhHi2fmqHlZ7j5Pcq9aJbItz2h1MSHcQyynz/GritA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bowgxVZC3+vus6I98qKdZrftjqPwn6pX3egunThKYFQ=;
 b=RVbevNvCDuhegerFf6nVJTaIlgjOPdDnYmCaY/RDizIVbm4qcUMcJaqBtQuOgbGXGQFP2j2F/lZMKKfKgIOyjWYLg6Y++4He5j8tiQrN2aqlhUm12CT3Ce13pKlRuKgsJ+oKCE9xsbLJI5NrmHQu8JwFEiGl7teqsStmezGuzVk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15)
 by GVXPR08MB10542.eurprd08.prod.outlook.com (2603:10a6:150:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 07:48:50 +0000
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726]) by AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726%4]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 07:48:49 +0000
Message-ID: <964d6e09-aa25-47ff-8b71-e9aceee1f626@wolfvision.net>
Date: Fri, 19 Sep 2025 09:48:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/17] media: rockchip: add a driver for the rockchip
 camera interface
To: michael.riesch@collabora.com, Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Markus Elfring <Markus.Elfring@web.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Collabora Kernel Team <kernel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Mehdi Djait <mehdi.djait@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P190CA0004.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::17) To AS4PR08MB7735.eurprd08.prod.outlook.com
 (2603:10a6:20b:512::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7735:EE_|GVXPR08MB10542:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ef24b57-f80c-4a9d-fcfc-08ddf750f890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Q09NMWg5c1lZcGUxRzVRTTg1RXhZY3dCc3lUZ3RqdmNnNVlWMWtLcVF2OE9Y?=
 =?utf-8?B?ZnE3SGlPa1BEZVVSemZ4K01jeDdVNXJOajNja21JUWxWZ1VhNHRQQkF4NW4w?=
 =?utf-8?B?UXdJSENIZE9lZGlmVk1CS0Q0dExtS0R0ZVE5elJMeHhQd2hFcjhBNkdVbkFZ?=
 =?utf-8?B?WnZFdlFTekYwenU1cWNybUtQSmtVMG8xWlNEWTR5UVpOSjFHZ1VGTisxdncw?=
 =?utf-8?B?YUVRSWVGNFIzZFFrRkhPVTA4eHpQMDNkTFN0WG42N1hqd3FqREJ1R1dqaEIz?=
 =?utf-8?B?RFVhNWxYYUtYTmZlTjBjWjRuQ1JRcVV4cUdIcXIrcGM5Zys5K3F3U3lHQ21O?=
 =?utf-8?B?cWZhM3cyTnluNnU4NkwyZjhrZFBUOUN6T3VRTkk3ZUc0dWduZ0l0WTE1UC90?=
 =?utf-8?B?WWo1aU5tbVk3YTJ0T3ROMFZ5OUlpREZqanRJbFZ4NDhtdXdWVU5kVjRtVU5x?=
 =?utf-8?B?eFBGa0N0KzV2c0NSVlJGVjZVMjdibHpCd2JZWFpsZWEwYUZLZmdtN2Z5R2tJ?=
 =?utf-8?B?MnoxMHpyQkczMno3SmU2WEpDem5nZVc2WE5waEdrYjJxNzVjaVVEeWFlNTZP?=
 =?utf-8?B?RzM3L2xPcm5SZEZGMTBIZlpiMmxaUFI3MlVwVU9zaWlXdlo1UHRsazltVHhr?=
 =?utf-8?B?TU5Ob2JVLzhkT3p5TTkzTDVjZGUrT2hqVlNPbitoUmlGZnpmNUlFWHBCK3Z2?=
 =?utf-8?B?RkRQYko0Y1gwVWNUOFA1Ty94TWFZSjZ6UHNqYW1RU3h2MDIvVVJENExhamJQ?=
 =?utf-8?B?YzdEMnlBYzc0SDNyMGlpUTVxdDFoN21QeEpPWGNuS1pFNXpqOWpoeVJUK1R6?=
 =?utf-8?B?b3dLY1J3cGhlVnZ6R1BSaGRaOW1RTDAyYzJyR3Zna1FnVGZVTDB6VUJsQUdG?=
 =?utf-8?B?dVBTSHpBQ2hlakJQZkQ3c0h2Vld1blBwRENZOEFMelp3RG80Q3FwYm82cWR2?=
 =?utf-8?B?dkNLL2lQYnR5akYrRkRXem9Xalkwa2RuNzJkVkFMYTczRmxJcHU4RFVLUk9t?=
 =?utf-8?B?MXlEbEhuOGVDd0diL3JrSk8rbXg1QWxNYmpnUTZVdEhkVncrVHdLazRBazZv?=
 =?utf-8?B?ZEdEeWMrWndKb1hlS2sydG51SFE4V1JZb2k4MlgwZ3FzTTVFVUp6UlU3b05z?=
 =?utf-8?B?VjZ3eW5ZOWFyOTl2Szh3M2R0L3ZtSW1taDlib2srUytaV2RRZ0d0Y3lyR1VG?=
 =?utf-8?B?cWJHTEtmZk9JcmJOajc2WEVyWnUvdDBSL2plMjltRmVPbWNpa3pCZks1WmFs?=
 =?utf-8?B?NmRMc2NMK2plM3gyODc2RUFJSGhwRDBHY0xTWDVSSS9TdExQYXhEVzFOT1J0?=
 =?utf-8?B?UnRHWDBNcTR3bTZjZnRKRFBKSHc2amNtS1h5cjVDZzR2UythUkFwN3lIZW5n?=
 =?utf-8?B?dFJNMy9pQlVNZVlnRTQzYVNZOEEzVVJFcE9qR2ZmbUo0dTJLUlRWWmxmUTRV?=
 =?utf-8?B?cmF0Y0p5VUl1ZlpvVklJTUR1eCtSM0w4eWlsMkJTb2orL0RiVk12TDc0MG4v?=
 =?utf-8?B?ei9kNXVBQ0NVUERvbkVnVzZZU0o0bHhoTjNBekZwSlR3azNaamx1UlZoNy9y?=
 =?utf-8?B?bjhDZlpaWlZEeGRaWkRZaVZDNnhlQm9YV3QyaUZoeG9iSWFHbENGUDlUVjJt?=
 =?utf-8?B?ZTdWd25RNTdvdklMdzB3bEQwaHFCSHdUUU03K2QvbXZrVzQ0T1NVM1U4Sm9j?=
 =?utf-8?B?M0JxWElVTmwxdEtSdmoxcG5ldDNzYjNad2lOQlBSTDg3bStRQ3d1SGhpNFQ0?=
 =?utf-8?B?QXpwSVNXdTBGNVJlMFM2MjBKdEZJek5JYzFldExUVUoyNFp4bUVndmVua3Bm?=
 =?utf-8?B?UElCblJLRjZIQUg5dXIxUXNDMVErNEREMmZWQjZjTERLRTVoTkxmbW1CZzdp?=
 =?utf-8?B?d3FkQU1xOWkyRTE0cGQ3ak13YVhyck4yTDZ1ZkFncVk1Ri9YNmRDeXRVdGt5?=
 =?utf-8?B?NXYxcXNLUXU1UW5FZWlwZzVJM3NCYVFTaFk1R0t2YkZXNDUrQTJreklXV25Q?=
 =?utf-8?B?aE01dlR6RTRnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3JKaEdlVGtvb0JIdHdGMkpuR1d0VXk3VmlOa0l5YzZhYW13VEQ2WVFUbFZ6?=
 =?utf-8?B?ZHM3Nk52ZHFJQndwa0JoSW8yOUh3akMrL2lsMW5vWnJNbDg1eERFMVpyRE5N?=
 =?utf-8?B?bzEvYjUra0NQeFluT2NvbWdSYUFwcWRZL3dyejNQSy93SmRiUHoxaHhVd28w?=
 =?utf-8?B?MUhudVEzYUQzLzR1N3RwMFN0dUhPUG1CVGVLb2JaL2NBVUdKbFJUbENDVEVS?=
 =?utf-8?B?dW1WOTNzeE1PeHBnVzZMTVlYWkpUYWh3NndlWUg1SHZQT1NIeTJBMTIwT3d5?=
 =?utf-8?B?QXE2SVJ4MlkwRTA2ZkFxcGRPWUd1WkpxWTUwVGZscExNWWFPMUhmUlBybnY2?=
 =?utf-8?B?NFYxUmFtelVubFJoekdFWWU3aGFpTmttRzVBSTVoMCtQR1BXOGZxSmhtVmxi?=
 =?utf-8?B?WVFrSStYSUZscGhidHk0cjJBVUZEcWRNOURZdFV4VjlscW9rSDhqcVVhU3JE?=
 =?utf-8?B?SlNja1RZMWZvVGgwcE13YzkzWndyY1ByMkY5UkptK0ZKajFiWkorOE5HdGUv?=
 =?utf-8?B?WEYwOXZxbkFJbEw4SVJFMzlHbFRtaVV2OFJKWnFpVy9pa1B6cWxxYzJzVGdi?=
 =?utf-8?B?b01vcDI1dmhJKzBlVEhrMlZaZi9kT0xkZUxxRUdvbnk5d0QzMUptbXljUVR6?=
 =?utf-8?B?TnNlZzNVTW9JL0Ruc3Z0RVVzZGYwNEpNNHVNN0oxNDBiWkpKdVdtZUhTd0VU?=
 =?utf-8?B?emhkMTZtaUlhR2VRY2lkRGpobFBURlpkRWFRaUZidEEyd1o3UXJjSWlMSndJ?=
 =?utf-8?B?NjBTZmRjRnBMdlJvK04xVkgrdVNodzlaelJkSjVYU0RNS1ZvOTNHVzZQYm9z?=
 =?utf-8?B?RElqaHZJRW16VnB2WklwUklVeHdlZW1qMUhXelZrNzByc2dMZTV5MnFIcFpu?=
 =?utf-8?B?T0VuM0k1WDZaZi9TaVg4bE9Dam82bW5sQWhDdmRyQWZOUHEwQW5HZXYwUkdu?=
 =?utf-8?B?MTdSTGsyS1E1QVUxYjlaeXBTaGlCRC9GZ1VCNjFHRlZFanhFS3NTL2graTky?=
 =?utf-8?B?RGV3M1Zhb1FvWnN0NVAzL3o2QzhpV1JyU1luYm5nQkJOV2R1SUx4MVgwa09n?=
 =?utf-8?B?V1BOSndWQlY5U2JWZXRCWjYxQ1ByNWViK3FaRDQwai9WcWNkSk05cGNnVzRV?=
 =?utf-8?B?WnZtYkpUS0lmSWh6YlUzbWN1bGhVb0NXR0JwUzlTS3VWdHFvaStsanNQbU5n?=
 =?utf-8?B?NjJwMUlod0JWNC9SRDg0eGI2TG1rSkxaZ0FKSTNoWjNVOFRSOXkydXBvSmky?=
 =?utf-8?B?VWJ1aU16aklmVEFwZEhhU3BtRjM2QzVMYlI2anNtOGJyUFo0NUpnMHpsdFg4?=
 =?utf-8?B?QnRKWkx0MHVzeWsvS01FRDBJNitTMDVTakhqakdpNjdFK3hzU2FzM20vT0ZR?=
 =?utf-8?B?cGxzOTFnaVE5UFpUUmNxTytVdXVNQWY4Y0grTmwyK0R3SGEyUkUvcFdUK1ha?=
 =?utf-8?B?TjMwVFBaZittYnl2VjBOT3lRY3hmSzdKMEdJRFBJU2hOT09GY2lrbEVtNENn?=
 =?utf-8?B?Mi9jYWFUZEp3K001aEg0NXozY01IdWpQSWNNSU1aeit3amRaZHJWMzhjUWRK?=
 =?utf-8?B?M1V0V1JyaUJ6M0N1VWxaeWFVbHlqYjkvanc5cFM5SnBHdzM2Nk5SWTl3VmdF?=
 =?utf-8?B?QkQ0Tm9MYVowbTJuWUFNVzIwNVE4V2dIaDQ3OWhmSnViUjdUbmI4NU9BRnNm?=
 =?utf-8?B?eGdqRnByRFlmeFN6SC9ZTVlCdHc3NTJKUWZaNlZPTFY4L3FKWHV0S25ERHNr?=
 =?utf-8?B?dnFtaGlveUpRMC92anhqWUhFM3V3SDYzZlZPUGlWcXpuSjRhbWRvY0RNWXdC?=
 =?utf-8?B?dERMM3YvNFdmbjNQTy9rdkl5ZmZONEd1SGVOVm5HeGJzeWxKd1g3c0JzZmZs?=
 =?utf-8?B?MEdRYmdoZDFvQys5WHZOWGhKSjA3dHJaWTNTSThMSnR0aHJnSXAvdjFoL1Zn?=
 =?utf-8?B?Z0xSWE1ha21rZnFnRkNvK3ZGUkJmditlTnVJTmtNNjA3OWtpaHRzdnJMaUo3?=
 =?utf-8?B?c1ZvbFh0dDZENW9FRnk1UUNaUzY0bjcyVEdKVUxDdkNwVU5wcmRvcXZ6bkt4?=
 =?utf-8?B?M0YzSHFCVElQWjFZbkZaaERzNWIreVRkZ3NHZjcwSlRsMncxbzB0QUF2S2Z1?=
 =?utf-8?B?akxQdHdGOWMzQkxSMlorQ055UFRWeEpwRjc1alBNQkpxa0RFZUR2cGlXUGNx?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ef24b57-f80c-4a9d-fcfc-08ddf750f890
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 07:48:49.7716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf4v7x9eGjcu8ykxyRyEPdKw+5LwEepZbZQXkz9IQYaNK5G4fUagUbjMPO3AxtDAVE6oWXYSY8hzJjVPkDPMhjXn91PLiaHmCehX3Q6+NsM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10542

Hi Michael,

Am 17.09.2025 um 17:38 schrieb Michael Riesch via B4 Relay:
> Habidere,
> 
> This series introduces support for the Rockchip Camera Interface (CIF),
> which is featured in many Rockchip SoCs in different variations.
> For example, the PX30 Video Input Processor (VIP) is able to receive
> video data via the Digital Video Port (DVP, a parallel data interface)
> and transfer it into system memory using a double-buffering mechanism
> called ping-pong mode.
> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
> DVP and a MIPI CSI-2 receiver that can receive video data independently
> (both using the ping-pong scheme).
> The different variants may have additional features, such as scaling
> and/or cropping.
> Finally, the RK3588 VICAP unit constitutes an essential piece of the
> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
> units, and a data path multiplexer (to scaler units, to ISP, ...).
> 
> The v11 of the series adds a media controller centric V4L2 device driver
> for the Rockchip CIF with
>  - support for the PX30 VIP (not tested, though, due to the lack of HW)
>  - support for the RK3568 VICAP, including
>     - capturing frames from the DVP
>     - capturing frames from the MIPI CSI-2 receiver
>  - abstraction for the ping-pong scheme to allow for future extensions
>  - abstraction for the INTERFACE and CROP parts to allow for future
>    extensions
>  - initial support for different virtual channels (not tested, though,
>    due to the lack of HW)
> and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.

The entire patch series was applied and verified on Wolfvision PF5
hardware (with the Wolfvision PF5 IO Expander). In this configuration
the DVP port is exercised via the IO expander, confirming that patches
07–11 function correctly on the target platform; no regressions were
observed. The v10→v11 driver split preserves existing functionality
while improving code readability and maintainability. Excellent work by
the author.

Regards,
Gerald

> 
> The driver can be readily extended to provide support for the RK3588
> VICAP variant. In order to keep things simple, however, this extension
> shall be submitted separately.
> 
> Looking forward to your comments!
> 
> To: Mehdi Djait <mehdi.djait@linux.intel.com>
> To: Maxime Chevallier <maxime.chevallier@bootlin.com>
> To: Théo Lebrun <theo.lebrun@bootlin.com>
> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> To: Gerald Loacker <gerald.loacker@wolfvision.net>
> To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> To: Markus Elfring <Markus.Elfring@web.de>
> To: Sakari Ailus <sakari.ailus@iki.fi>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Rob Herring <robh+dt@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Heiko Stuebner <heiko@sntech.de>
> To: Kever Yang <kever.yang@rock-chips.com>
> To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> To: Sebastian Reichel <sebastian.reichel@collabora.com>
> To: Collabora Kernel Team <kernel@collabora.com>
> To: Paul Kocialkowski <paulk@sys-base.io>
> To: Alexander Shiyan <eagle.alexander923@gmail.com>
> To: Val Packett <val@packett.cool>
> To: Rob Herring <robh@kernel.org>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: linux-media@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-rockchip@lists.infradead.org
> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> 
> Changes in v11:
> - rkcif: split large driver patch (6/13 of v10) into smaller
>   patches (6-11/17 of v11) (Bryan)
> - rkcsi: replaced devm_reset_control_array_get_exclusive with 
>   devm_reset_control_get_exclusive (Philipp)
> - Link to v10: https://lore.kernel.org/r/20240220-rk3568-vicap-v10-0-62d8a7b209b4@collabora.com
> 
> Changes in v10:
> - rkcsi: fixed error handling in rkcsi_start (Bryan)
> - rkcsi: fixed interrupt references in device tree and bindings
>   (Rob's bot)
> - added missing call to rkcif_mipi_stop_streaming from rkcif_mipi_isr
>   (Mehdi)
> - renamed remaining instances "cif_" -> "rkcif_" in functions
> - Link to v9: https://lore.kernel.org/r/20240220-rk3568-vicap-v9-0-ace1e5cc4a82@collabora.com
> 
> Changes in v9:
> - added compatible for RK3588 MIPI CSI-2 receiver, thus dropped
>   Krzysztof's R-b
> - added interrupts to rkcsi DT binding and RK356x DT
> - added variant specific callback to rkcif-capture-mipi that puts
>   together the CTRL0 register content (which varies between RK3568
>   and RK3588)
> - fixed v4l2_fill_pixfmt_mp() return value handling (Mehdi)
> - Link to v8: https://lore.kernel.org/r/20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com
> 
> Changes in v8:
> - rebased onto v6.16-rc1
> - fixed RKCIF_MIPI_MAX value in rkcif-common.h
> - fixed rkcsi Kconfig (kernel test robot)
> - sorted rkcsi DT bindings document properly, completed example
>   (Krzysztof)
> - squashed the defconfig patches (Krzysztof), dropped Bryan's R-b
> - Link to v7: https://lore.kernel.org/r/20240220-rk3568-vicap-v7-0-7581fd96a33a@collabora.com
> 
> Changes in v7:
> - moved MIPI CSI-2 receiver driver into separate directory (Laurent)
> - rkcsi: fixed return values (Bryan)
> - rkcsi: fixed v4l2_get_link_freq to use pad instead of control
>   handler (Sakari)
> - rkcsi: added data-lanes property (Mehdi)
> - rkcif: fixed formatting (Bryan)
> - fixed "int" -> "unsigned int" in all for loops (Sakari)
> - rkcif-stream: fixed minimum number of required buffers (Mehdi)
> - rkcif-stream: used guards for the spinlock (Markus and Mehdi)
> - rkcif-stream: made driver less noisy with dev_dbg (Mehdi)
> - rkcif-stream: fixed issues detected by v4l2-compliance (Mehdi)
> - rkcif-dvp-capture: fixed return value propagation in _register()
>   (Mehdi)
> - removed stray "phy-names" from required properties (Rob's bot)
> - Link to v6: https://lore.kernel.org/r/20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com
> 
> Changes in v6:
> - rebased onto v6.15-rc1
> - renamed "MIPI CSI HOST" -> "MIPI CSI RECEIVER" (Laurent)
> - s/@wolfvision.net/@collabora.com where appropriate
> - renamed DVP delay property and moved it to the endpoint (Sakari)
> - implemented DT review comments (Krzysztof and Sakari)
> - implemented driver review comments (Sakari)
> - fixed issues raised by media-ci (yet again)
> - added documentation including a RK3568 topology (new patch 1)
>   (Sakari)
> - added patch that enables rkcif in the defconfig (new patch 9)
> - Link to v5: https://lore.kernel.org/r/20250306-v6-8-topic-rk3568-vicap-v5-0-f02152534f3c@wolfvision.net
> 
> Changes in v5:
> - fixed issues raised by media-ci
> - fixed dt bindings (comments by Rob and Sakari)
> - fixed probe on systems with no DVP in DT (comment by Alexander)
> - fixed error path in register offset calculation
> - split off MIPI CSI host driver into separate module (comment
>   by Mehdi)
> - added MODULE_DEVICE_TABLE() for both drivers (comment by Mehdi)
> - Link to v4: https://lore.kernel.org/r/20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net
> 
> Changes in v4:
> - added support for the MIPI CSI-2 receiver (new patches 4, 6, 7, 10)
> - fixed asserts on stream stop
> - fixed register address lookup
> - fixed link validiation callback
> - fixed issues raised by Rob's bot, kernel test robot, and media-ci
> - Link to v3: https://lore.kernel.org/r/20250206-v6-8-topic-rk3568-vicap-v3-0-69d1f19e5c40@wolfvision.net
> 
> Changes in v3:
> - renamed the driver "cif" -> "rkcif"
> - rebased onto v6.14-rc1
> - abstracted the generic INTERFACE+CROP part
> - addressed comments by Rob and Sakari
> - added V4L2 MPLANE formats to DVP
> - added patch that enables the RK3568 VICAP DVP on PF5 IO Expander
> - fixed formatting issues raised by media-ci bot
> - Link to v2: https://lore.kernel.org/r/20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net
> 
> Changes in v2:
> - merged with Mehdi's v13
> - refactored the complete driver towards a media controller centric driver
> - abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
> - switched to MPLANE API
> - added support for notifications
> - Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net
> 
> ---
> Mehdi Djait (2):
>       media: dt-bindings: add rockchip px30 vip
>       arm64: dts: rockchip: add the vip node to px30
> 
> Michael Riesch (15):
>       Documentation: admin-guide: media: add rockchip camera interface
>       media: dt-bindings: video-interfaces: add defines for sampling modes
>       media: dt-bindings: add rockchip rk3568 vicap
>       media: dt-bindings: add rockchip rk3568 mipi csi-2 receiver
>       media: rockchip: add driver for the rockchip mipi csi-2 receiver
>       media: rockchip: add driver for the rockchip camera interface
>       media: rockchip: rkcif: add abstraction for interface and crop blocks
>       media: rockchip: rkcif: add abstraction for dma blocks
>       media: rockchip: rkcif: add support for px30 vip dvp capture
>       media: rockchip: rkcif: add support for rk3568 vicap dvp capture
>       media: rockchip: rkcif: add support for rk3568 vicap mipi capture
>       arm64: defconfig: enable rockchip camera interface and mipi csi-2 receiver
>       arm64: dts: rockchip: add vicap node to rk356x
>       arm64: dts: rockchip: add mipi csi-2 receiver node to rk356x
>       arm64: dts: rockchip: enable vicap dvp on wolfvision pf5 io expander
> 
>  .../admin-guide/media/rkcif-rk3568-vicap.dot       |  21 +
>  Documentation/admin-guide/media/rkcif.rst          |  83 ++
>  Documentation/admin-guide/media/v4l-drivers.rst    |   1 +
>  .../bindings/media/rockchip,px30-vip.yaml          | 122 +++
>  .../bindings/media/rockchip,rk3568-mipi-csi.yaml   | 144 ++++
>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 170 ++++
>  MAINTAINERS                                        |  17 +
>  arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
>  .../rk3568-wolfvision-pf5-io-expander.dtso         |  20 +
>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  78 ++
>  arch/arm64/configs/defconfig                       |   2 +
>  drivers/media/platform/rockchip/Kconfig            |   2 +
>  drivers/media/platform/rockchip/Makefile           |   2 +
>  drivers/media/platform/rockchip/rkcif/Kconfig      |  18 +
>  drivers/media/platform/rockchip/rkcif/Makefile     |   8 +
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 864 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |  24 +
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 777 ++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |  22 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   | 249 ++++++
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  | 301 +++++++
>  .../platform/rockchip/rkcif/rkcif-interface.c      | 425 ++++++++++
>  .../platform/rockchip/rkcif/rkcif-interface.h      |  30 +
>  drivers/media/platform/rockchip/rkcif/rkcif-regs.h | 153 ++++
>  .../media/platform/rockchip/rkcif/rkcif-stream.c   | 637 +++++++++++++++
>  .../media/platform/rockchip/rkcif/rkcif-stream.h   |  31 +
>  drivers/media/platform/rockchip/rkcsi/Kconfig      |  16 +
>  drivers/media/platform/rockchip/rkcsi/Makefile     |   3 +
>  drivers/media/platform/rockchip/rkcsi/rkcsi.c      | 741 ++++++++++++++++++
>  include/dt-bindings/media/video-interfaces.h       |   4 +
>  30 files changed, 4977 insertions(+)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20240220-rk3568-vicap-b9b3f9925f44
> 
> Best regards,


