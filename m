Return-Path: <linux-media+bounces-24577-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F114A08AAC
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27A9188C6A4
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 08:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E284209F2E;
	Fri, 10 Jan 2025 08:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="OuiE9xtl"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2136.outbound.protection.outlook.com [40.107.21.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC8D2066E1;
	Fri, 10 Jan 2025 08:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736498896; cv=fail; b=O1d7eYEW0u9XYaJ+l5YUMninLkWEOHc3F9yLl/5KNCIEvevVtJqsLTxZTmJfVDBvXjwIpDp3Cwym+1cV481HBDyKOO5ke8+n37QS4SFSIcfcPXBxPT9ej02JgfZfggqEJTR4bg6b/iBUNN2dcTk8CcuFH0lrIZcnn20eakO59YI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736498896; c=relaxed/simple;
	bh=mKhM/dhZhKlA4DUGQi+46jCquD5XPmVlTajTkOl406E=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fdyL1ajmwRefCTlJHh+JsCdeziojlFotOVOtf7m+O9miO8MwikAqm52fB+/6GNvzZpACt/aE/TxhQRujQ6cloaLCGnwpmfcqA6PfohCpsFYPhZp/NAY/fsTKuD4z0NzI7HyxNE8FnbJTFr8leRy4avhtrFshtRiwtrZjzEO0z/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=OuiE9xtl; arc=fail smtp.client-ip=40.107.21.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJkZfi82Soh5iEm2CYIG6+doUoq3NRCQaQahacOXo9LdRQpSxvlsCsBxPvDbu552B2GBIZBve82Cy3TyJ3PXJ666+JzBKmfVjnhJ2W8KhSyHJUzBZogPSw40cQep2QRbVXSRvAjotyfwxccqySXfeYjVqcKprdpSxQ73YCzj/XkgFnXJmZL7QsONkuqXtcc+1Iwo9K7DG6PVZ5l523B21KXvK8cVvhasbIgthvviodt6eyY780S9+X54saz9KBv+sS8rK5ws95gJ/xZ/EQbQImKzB3TJxur3e5FOQV5sEckt6iv0XMVC2s9e/jx7c2eiGZANbInU+b52HqmU/M2BIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qPYExo/39U0mPZHPmDD0N8bhpKWM44swmZSA+R9bQw=;
 b=XQrOhhS7o/p7q64EOg/op020WSMOmMG6TYFoJH4/apIzlKCgvF3CFiiDyLl60dliO61Wb1TUAoi6f5+PsBvkrnnCoK+SzK491AsBAjLS+h3MZ0QLZA7xIM5EOKj5oNdR+1jaQWUpYHle2N9DBStonMo7Gqy5x8aR/U6FxXB5CcgEjjC/ukWU2spoYomDl7A8+jbu16ph2febSEtNvBVE0EUMHxKQzNIW/MhdHdL6vi/DMCBocq2CBU72NatFh0KAOYHFHZiFFc/wOKJ5r/FTYrALB9fiWpvYtonaZvE95eE8up+gHJe7zZ40DhBUnMYQeIaKgx7nIlk+Q++jf8viWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qPYExo/39U0mPZHPmDD0N8bhpKWM44swmZSA+R9bQw=;
 b=OuiE9xtlo03BBQTOY6AkcTX4jQOvXF/Tf5muqHDbdkOz0amL0dCagIbzAfMEWO61wgUshSyoXpfturlcPuWNlF+gOrqwY3+T3VDhsPEVqyfmP1tKFjzt5uCetmQLliYv+sFOMt0YsjrpZCEVV+XxK7FUj6E59JKGas+WYgq1Vss=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB10370.eurprd08.prod.outlook.com (2603:10a6:150:a7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Fri, 10 Jan
 2025 08:48:08 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8335.012; Fri, 10 Jan 2025
 08:48:08 +0000
Message-ID: <6380144e-f0c4-4415-89d5-36ed3d5a4205@wolfvision.net>
Date: Fri, 10 Jan 2025 09:48:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>
References: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
 <20250109171232.GA17638@pendragon.ideasonboard.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20250109171232.GA17638@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR03CA0074.eurprd03.prod.outlook.com
 (2603:10a6:803:50::45) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB10370:EE_
X-MS-Office365-Filtering-Correlation-Id: b55e983b-9b2d-42b7-ac91-08dd3153815d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WExUVnhOVFpZM1RUeEZVVStYdFQwTm5pN09sUXRoUWhpdFhhcng4Z2toZFRl?=
 =?utf-8?B?MWlzTENyMHdJWUZMOEJHMFpmR282bms5Yy91UFpJYUl4U2VRL0x5K3BvM2du?=
 =?utf-8?B?MTB0U1F3QWNkTDloMnpyR3FPMTRSWTRuWEhuendIK0xLQmNPUjg5OGFqbDBH?=
 =?utf-8?B?bW0wM0Q5Vkx2c3RXZE5jT0wrN1VEYTlLcGtPWFUvcG03VXRsbk9LY01pcjVr?=
 =?utf-8?B?Z0YzbzNhdXhBUnJlOVZLN05CcXR4UE1QZDRJNGx4THJTQ3VTcS9SWjE3eEpG?=
 =?utf-8?B?QmZST2RwV3JueUg2T09TUDdoMGduY0s5TkpSQ3ZoQ1B4d3dRUWNXaDJkNWpH?=
 =?utf-8?B?QnNTTG10eU1JNUNpM000TmswOG9wb29RSHhZKzhjNDJVNGFDOFB2UUNQMkk3?=
 =?utf-8?B?TDl6NGpBNTRvbEpDcUhLNk9Hb1ZxbEZMVXFyWEVhWmdkUVZDUEVqWVRjWlgx?=
 =?utf-8?B?aHp5Yjl3ZE1pUG9hU0ZPUVQ3R3VnOWhybnBpa3BkdXlmTjdrS2dvSWlaM1Fa?=
 =?utf-8?B?YVdRenFMMVMwVTFuSkJEM2QreVE2QkVUZ2Q5QXkwQWM5VzlIa0xPNmhnankx?=
 =?utf-8?B?akIrQmRuT0dKZm5LYVQrNEtvWHgvdVpyWFNIVHBJVVNpbmI4VHliQ3J1YnBF?=
 =?utf-8?B?SXBnUzJYMDVGYnpKM2s2ZkZER0ZZUCtpUFA3RW5PWWNaaHJiNnVaVXU4ZTlD?=
 =?utf-8?B?eDB0bEVKcHFwL0E4N0Vtb0xjbnJTem11UmRkNFVNeTM0U1pmMGo1RDQ1RXNQ?=
 =?utf-8?B?ajVBZXFBam1LMWFmTFhPbHBtcTBlckJwbjI0dUY1aHd5bHpHVUdBeXM0a3Ba?=
 =?utf-8?B?NzRxSytyR2NMdXhlalg3c3E1MjA4L0JHU3R6ZUhnTkNrT3IvNXdpVVh2emJ3?=
 =?utf-8?B?MWo4bmZhdStBbDhvSzNjRFA1VDNLYmdUam95WXhwV3plS2RiblJkZXkxVThX?=
 =?utf-8?B?TmFsOW5hcFg2Q1RlZ0dLMEJBYXliZ1B0TXJVbDA3TC8xZ2Z5bnFpWkx4M1lp?=
 =?utf-8?B?cG5qK3JidUZtSEl4VVZSWnU2UHVVa0ZDcUQyS1RteFBzNHZxVmJGUk5jbVE2?=
 =?utf-8?B?bThzR2pqRnRKVjJlRzR5MFJHNUlFVTZTODIzcjhZbm10OUsxKzBlMFk4M1Ey?=
 =?utf-8?B?OWczNERXQjdSWGJyNmdncXMydGlhL1Yzd2RKL3hkQzU2ekc5K3QzVjdsSFE3?=
 =?utf-8?B?UCtOYjF4VHl4bFFKai9OU3RDKzFWNUVBSWhyYVc1MzdyZE9UK29SMTIwcUlC?=
 =?utf-8?B?SHBWR2NCeUxxY1RhYmJmYnc0UkY4Z0NmcDV3TnE1Y21rZ0JMc016ZDFhMHov?=
 =?utf-8?B?UTFUN2lLRkNZOUZ3U1VpdDRDdEtHbS82bjliNVFzS1hncmtVdndqbmpGTTVn?=
 =?utf-8?B?aHRRc2ZlSTV2YXNualpYTlFmaEN2akpOZUVqZi9hQllFT0NpaEY2cFFTY1NZ?=
 =?utf-8?B?ZW5TK2JhNHVlWHh3ZlhMTG01OUh6TmlaNXlZNEtPQVhPQ2hHV2JrcmFZVTNM?=
 =?utf-8?B?SUFFYUdhWUJtNFBaMVNjVHB1RGxZRmxqU2lzQW02N2w5V1pBNDRGWFJPTmNJ?=
 =?utf-8?B?TzJrUmpTcGJKMk5LVjQxMytTRjdZdGx1ZUNkUWVJUExDUjhQVE1yNHNIOVRp?=
 =?utf-8?B?cUwrSXdzQXlSL3hoeHRIc0t4R3Q0TXZBcmtiT0JXM2o4VkVkSkV3VGRuY1pK?=
 =?utf-8?B?aE9NVU41akNDcnp0SWxXdURKdzBPSTV1L3RtS2toYVlmSkRWQkFSQk1uek93?=
 =?utf-8?B?RFdXOCszU3I0V2J3cGJyL0wzMXEwS1Z6SHJFTzVSYUM3djhGN1dPVjZTTEZ4?=
 =?utf-8?B?b1ZmNmRkTVJ2anN4dzRhYzAreVpHNlRFbktmYWFEVlNtb2FNZlo4Vi93RmRP?=
 =?utf-8?Q?5reDUsuogXY0L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TytTTFo2Tk5MMktaREN6TVpOcTV3U1pkZ0w3SWdrNzdveHpzWTVEN3FUNmFD?=
 =?utf-8?B?OHU5QlRjR0FwaWU4ekJ4c3pleEtRK2k3ZjgrR2E2eDNIYTdOdlRLck51c1lI?=
 =?utf-8?B?TEFSYk85eEZvMEZKbjVIZkR1blg4UUF0VzBCS05qbXRmaTFpMlFZckVDS0Ni?=
 =?utf-8?B?cEgyNUNHVDNyMUxKdGRwbklFT0xVYXVJVyt2dDhiZGVxcU9XOE1mOVhDR1hK?=
 =?utf-8?B?VlNBVnZtMmN0MnMrb3B4UVFMUjlBQUdOQkZGWUNIcS9JK3l1MnB6WjhpcmJG?=
 =?utf-8?B?TWJad3MwZmEyN2FzbnZSYmpMRGN6K0NNZnpFNGFaRUdpUGFqQTZHUnVrVkQ4?=
 =?utf-8?B?Vm1reXR5QWlNeC8rdERkd1Z0eEZEL0V4QldPNlJOYW1zNXpQanJvZ0tTUXIv?=
 =?utf-8?B?eWh6dDlpaUg3bTBiejZ6NzdjNXNLTllvNmh5T01lY2FNNElqaXRXNjR1cjhH?=
 =?utf-8?B?cTdrMTN4Z0hPMkVZVTlCeFA0STdIazFnd1o2Qm5HQXM5QWdBY01teG9FZFJC?=
 =?utf-8?B?N1RSb1V4NXJ4SW95TW5HeWlvc2plYTR1VHdLMjhUVnIrVTVKT1ptV0tmSHRF?=
 =?utf-8?B?RU9RdFZTcUN2b2gvd2wvRktrV0FJelNDcVpoZk81azNEMnErSUNOL3BGWHFE?=
 =?utf-8?B?YWVyZG1mcExVR1RlNlZ2OGJqRmcvV1E5NGE5ckluQ2VWRGRERFRnNDlXS2pC?=
 =?utf-8?B?V3A1ZnI2NDdQSlR0UVF2dFZYb1RENk5Day90eUxRbDFvandVaG5BYlZMTkFW?=
 =?utf-8?B?blNRMVRrelNaVm9VcUpNKzcrTkN6R1YwRjJDaXNuc01NSHU5ZnpCdGgrVG9j?=
 =?utf-8?B?aDhZZGhEOGc0NmladWhkdzBZTkxGNkxSTGJyV21zbDZNcW1tYmZOR2UzSEJ4?=
 =?utf-8?B?RmhRQ0ptcjJXUHdWenlwSGw1cGNPbjN1U29OS1ovVU41OEcxZEJvVXRNTlZY?=
 =?utf-8?B?Sk9DclRBd0lKOU9laWZoUW1nWlUzd2I5Y05ZNzZnUkZRWFlIOW9ZQ2wvOTJ6?=
 =?utf-8?B?R2Y5NVljc2Z3Q1dUSjdEbW9VcFc0aDVYOG5FdHFDbzJ4WWQ3MTZIOG1OdUl5?=
 =?utf-8?B?YVFCYlVPY3BNOWFXaEtVUmpUdDk2NUxFbWJwS3l0NjgyY1BXU0JmOW5VM1d6?=
 =?utf-8?B?QjFjQ0ZmSVNmTDQ5WUZqVm0wMHhzVGNGSUJHNHZTVXhRYnZmcEdybkU2WTds?=
 =?utf-8?B?ek52b3RodzIxdzdKSnIrS1JGSXZNQzhiK21MWStGVFVsMUdOVjcvcDlhNjZn?=
 =?utf-8?B?VThFQ3F2SWlxOWRvUzZ4eDNJaWhRczNDdmU2YlpvNXNvS0lGWVI3WTRSdVBJ?=
 =?utf-8?B?YmJTbStSSkw1ZitOUHl5ZmlZQnRSUG02RWdpRDNWdGtVdVhBOUwyQ2VTdVVt?=
 =?utf-8?B?VWN5TDR3QkMxZ281dGU2a3FhOHhqdm9PcTltWTdCZDRhWEdxcjdCRXp3cFg4?=
 =?utf-8?B?TWM1SlBoQTRGdzBaaURkcm1ieVFXU1lhQWkybVlNeUZqZy91OTE3cmIwMDR3?=
 =?utf-8?B?bG1scXhrVEJHREtFQzdWUjBtQmx3RXJPOGZRelFwVVh1T1dTWXlpVng2Y1N1?=
 =?utf-8?B?STdnaFg5c3ZsV2lrNVlOdlNqVlE5OURWSHM5V2tkbGZVNnJicTJqVFU4RXUz?=
 =?utf-8?B?Yi9GWGMwblkrREMrWEtCMFNjOTM4MUQyOW5ucUxzU0xTS0x0Nkt3NGRvYVpD?=
 =?utf-8?B?MTRKQzFXSEhnRVdkbFNrVFRTSEZMSk9nOFp5MFZWV1pLZEtrcXloV3YwRThY?=
 =?utf-8?B?TjlEbFB2VVRocCtUV3M4U1MvSVMrZVVkQzZ5SCt5MEpkcUVwQUliQ3VDalpz?=
 =?utf-8?B?ZHNzckZPV0xGMk9RNkRjQlllTzZ6TThKb3JPZFFSUjI4RDJXV1A0UlA5b1N6?=
 =?utf-8?B?b3p3VnZXVFZMSmNTUXQ4eEpydkhJZUxhTUYvdWpiK0o1SE4xbzJubmJoRGVy?=
 =?utf-8?B?VnZsZ0s3U1pjSER5ZEdGU2ZUUk83dGZKelloWXlaUWFPT3NUZFlzMFBoVjk2?=
 =?utf-8?B?REZ0M1pCRGtPNHkvZ21JU1dwenhJRWFmeEloWU1FdVJKL0xpVUsyWVdvb1E5?=
 =?utf-8?B?Ti9hcE9WdTFtb0NZOFhqL09JUldjd1N6bURCc3VQMzZTNzlOSmptL2tmZjgr?=
 =?utf-8?B?R21ObzVyanY0ajFhWTA5ejJxNjZWVUdxVzBzK3VrQWxZWTJ5VlBtV0x5czdW?=
 =?utf-8?B?N0E9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b55e983b-9b2d-42b7-ac91-08dd3153815d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2025 08:48:08.0360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1CksP/g/S8hYA2DJ9ocKCkDUOhAofdJZyR1IlaukHfEnKrU5OvgExJYIoxzlDwUN8BmRC3cI127Jru+UJqcquAVTqRF22SOnduutd6JTcAo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10370

Hi Laurent,

On 1/9/25 18:12, Laurent Pinchart wrote:
> Hi Michael,
> 
> On Tue, Dec 17, 2024 at 04:55:12PM +0100, Michael Riesch wrote:
>> [...]
>> and refactor the whole thing. The resulting v2 of the series now adds a
>> basic media controller centric V4L2 driver for the Rockchip CIF with
>>  - support for the PX30 VIP (not tested, though, due to the lack of HW)
>>  - support for the RK3568 VICAP DVP
>>  - abstraction for the ping-pong scheme to allow for future extensions 
>>
>> However, several features are not yet addressed, such as
>>  - support for the RK3568 MIPI CSI-2 receiver
> 
> We've discussed this previously on IRC, but I don't think the issue has
> been raised on the list.
> 
> I'm puzzled by how this will work. As far as I understand, the RK3568
> has a CSI-2 receiver with 4 data lanes and 2 clock lanes. I assume this
> is used to support both 2x2 lanes and 1x4 lanes. Both the VICAP and ISP
> sections of the TRM list CSI2 RX registers, but it's not clear how the
> components are all connected. Does the ISP need to be part of the same
> media graph ?

Well you are not the only one to be puzzled by this HW :-) I started to
bring up the MIPI CSI-2 part and can describe the situation as I
understand it. No claim for correctness or completeness, though.

Indeed, the RK3568 MIPI CSI-2 PHY (TRM Chapter 28) has 4 data lanes and
2 clock lanes. And indeed it is possible to attach one device (1x4) or
two devices (2x2) to it. In the latter case the PHY is operated in split
mode (and 1x4 would be the default full mode, then). The mode can be set
in a GRF register.

The RK3568 features a MIPI CSI-2 host controller (TRM Chapter 27) that
(apparently) is connected to the RK3568 VICAP but has its registers in a
separate memory region. Right now I am trying to clean up the downstream
V4L2 subdevice driver for this host controller, which shall be linked to
the PHY using the "phys" DT property, and linked to the VICAP using DT
endpoints. In the end, the media graph could look like

  CC1 (V4L2 subdev) --> RK3568 VICAP DVP (V4L2 device)

  CC2 (V4L2 subdev) --> RK3568 MIPI CSI-2 HOST (V4L2 subdev) -->
  RK3568 VICAP MIPI (V4L2 device)

where CC denotes a companion chip, such as an image sensor or a video
decoder. Note that there are two disjoint subgraphs in this topology.

As you already pointed out, the RK3568 ISP features its integrated MIPI
CSI-2 host controller (as e.g. the RK3399 ISP does). This host
controller is represented by a V4L2 subdevice as well, and the
connection to the (same) MIPI PHY is established similarly. The
difference may be that this controller has its registers within the ISP
register block and is thus tightly coupled to the ISP (and the rkisp1
driver).

Now I guess that in split mode the ISP MIPI path works completely
independent and could be represented either by a separate media graph or
by another disjoint subgraph in the same media graph.
In split mode we need to define which host controller should handle
which set of lanes (there are two sets, clock 1 + data 1 + data 2 as
well as clock 2 + data 3 + data 4). Right now I am not sure how this
should be accomplished, but then the split mode can also wait a bit.

However, as you pointed out in our IRC discussion, it is mentioned in
TRM Chapter 12 that the RK3568 ISP can also process the DVP input. This
still needs some verification, the rest of the paragraph is pure
speculation. But maybe on simply needs to set the correct bits in
CTRL_0000_VI_DPCL. Now this would mean that there should be one large
media graph the includes the RK3568 VICAP as well as the RK3568 ISP,
i.e., something along the lines

  CC0 (V4L2 subdev) --> RK3568 ISP MIPI CSI-2 HOST (V4L2 subdev)
                            |
                            v
                     RK3568 ISP MUX (V4L2 subdev) --> RK3568 ISP...
                            ^
                            |
  CC1 (V4L2 subdev) --> MAGIC V4L2 subdev? -->
  RK3568 VICAP DVP (V4L2 device)

  CC2 (V4L2 subdev) --> RK3568 MIPI CSI-2 HOST (V4L2 subdev) -->
  RK3568 VICAP MIPI (V4L2 device)

where the MAGIC V4L2 subdev should be a fan out of some sort?!

Now to answer your question: I guess it is going to be one media graph
for RK3568 VICAP and RK3588 ISP. This shall be in perfect alignment with
the RK3588, where VICAP and ISPs are clearly connected.

Is this something we need to take into account right now, though? Or can
we complete the work on the VICAP first and then start adding the ISP?

Hope that helps!

Regards,
Michael

> 
>>  - support for the RK3588 variant
>>  - support for the scaling/cropping units that can be found in some
>>    variants
>>  - support for capturing different virtual channels (up to four IDs
>>    possible)
>> This needs to be in the scope of future work.
>>
>> Finally, please forgive me if I forgot to address reviewer comments from
>> the previous iterations. Between v1 and v13 they have seen significant
>> feedback including renaming the complete driver twice (from rkcif to vip
>> and back to cif) and I am pretty sure that I was not able to gather
>> everything.
>>
>> Looking forward to your comments!
>>
>> [0] https://lore.kernel.org/linux-media/20201229161724.511102-1-maxime.chevallier@bootlin.com/
>> [1] https://lore.kernel.org/linux-media/cover.1707677804.git.mehdi.djait.k@gmail.com/
>> [2] https://lore.kernel.org/all/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net/
>>
>> To: Mehdi Djait <mehdi.djait@linux.intel.com>
>> To: Maxime Chevallier <maxime.chevallier@bootlin.com>
>> To: Théo Lebrun <theo.lebrun@bootlin.com>
>> To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>> To: Sakari Ailus <sakari.ailus@iki.fi>
>> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> To: Mauro Carvalho Chehab <mchehab@kernel.org>
>> To: Rob Herring <robh+dt@kernel.org>
>> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
>> To: Conor Dooley <conor+dt@kernel.org>
>> To: Heiko Stuebner <heiko@sntech.de>
>> To: Kever Yang <kever.yang@rock-chips.com>
>> To: Nicolas Dufresne <nicolas@ndufresne.ca>
>> To: Sebastian Fricke <sebastian.fricke@collabora.com>
>> To: Alexander Shiyan <eagle.alexander923@gmail.com>
>> To: Val Packett <val@packett.cool>
>> To: Rob Herring <robh@kernel.org>
>> To: Philipp Zabel <p.zabel@pengutronix.de>
>> Cc: linux-media@vger.kernel.org
>> Cc: devicetree@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-rockchip@lists.infradead.org
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>>
>> Changes in v2:
>> - merged with Mehdi's v13
>> - refactored the complete driver towards a media controller centric driver
>> - abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
>> - switched to MPLANE API
>> - added support for notifications
>> - Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net
>>
>> ---
>> Mehdi Djait (2):
>>       media: dt-bindings: media: add bindings for rockchip px30 vip
>>       arm64: dts: rockchip: add the vip node to px30
>>
>> Michael Riesch (4):
>>       media: dt-bindings: media: video-interfaces: add defines for sampling modes
>>       media: dt-bindings: media: add bindings for rockchip rk3568 vicap
>>       media: rockchip: add a driver for the rockchip camera interface (cif)
>>       arm64: dts: rockchip: add vicap node to rk356x
>>
>>  .../bindings/media/rockchip,px30-vip.yaml          | 123 ++++
>>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++
>>  MAINTAINERS                                        |   9 +
>>  arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
>>  arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  44 ++
>>  drivers/media/platform/rockchip/Kconfig            |   1 +
>>  drivers/media/platform/rockchip/Makefile           |   1 +
>>  drivers/media/platform/rockchip/cif/Kconfig        |  15 +
>>  drivers/media/platform/rockchip/cif/Makefile       |   3 +
>>  .../media/platform/rockchip/cif/cif-capture-dvp.c  | 794 +++++++++++++++++++++
>>  .../media/platform/rockchip/cif/cif-capture-dvp.h  |  24 +
>>  drivers/media/platform/rockchip/cif/cif-common.h   | 163 +++++
>>  drivers/media/platform/rockchip/cif/cif-dev.c      | 405 +++++++++++
>>  drivers/media/platform/rockchip/cif/cif-regs.h     | 132 ++++
>>  drivers/media/platform/rockchip/cif/cif-stream.c   | 676 ++++++++++++++++++
>>  drivers/media/platform/rockchip/cif/cif-stream.h   |  24 +
>>  include/dt-bindings/media/video-interfaces.h       |   4 +
>>  17 files changed, 2598 insertions(+)
>> ---
>> base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
>> change-id: 20240220-v6-8-topic-rk3568-vicap-b9b3f9925f44
> 

