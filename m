Return-Path: <linux-media+bounces-42745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD8EB88415
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 09:50:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A5531893929
	for <lists+linux-media@lfdr.de>; Fri, 19 Sep 2025 07:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 636DA2E8E12;
	Fri, 19 Sep 2025 07:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="Jgw/3ok5"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021110.outbound.protection.outlook.com [52.101.65.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C251145B16;
	Fri, 19 Sep 2025 07:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758268194; cv=fail; b=FxwiVxfgIddcAxra57pZXwKeLHGNAXHWp8jvoxOeRitY3thmYN/ggZ9nlfh0OC6XDHXWELDUTTep+DWPtCyCoZewLNqvlMlgRktnRK7uPkQUXH3/xzhP4XCOw934TqtRzHxSiutcTsl/x87YgQiqDamrE5moMT1+Sr1684HVY7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758268194; c=relaxed/simple;
	bh=sMlxoX8Ij4j1m1q5BlMJ1MNToIX+uJ6IPTS2rPUQdIk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TdhrU9kZMKKIytJ4TWN20/xrOBl6d2xib2TT9gCnhwtodAN0jhozV+zH5R+IGR92zjtAF00k1eAIGfWoWvprOJEH3P0qD/wgaFaUfAu/IPtLpaJNxghRBeffY+7eu9/0sQINeEOHR0PXPh4ujbk7S9iDE6btXKJ+7Kn/RTjL83g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=Jgw/3ok5; arc=fail smtp.client-ip=52.101.65.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AdeBXlUpP9KyGMQjjKTskqkU00o1mBpccrX4j+un0LHXCzHBky7/0kAo/YqchXTsMC3EBTfPn0Pptmehgq+zsSDmqXwMoA1ZobTfnXQ/KhpSe6q8YIII3/XR4104s3F5+zOtXLWSUxcWnqteg5N0dLSnCm2hhsBFqDs+g+yvXC7sQQ3XocNeSr7Yx3hWHYRLMznGzoqTLoBGJ9pQH/VNkhkARLV23lYd8nszqLtsUp0CwA/fXOgmeb6/IZhEuLMRWNtvs9lDNhMOWYva0WWuOGieh96DptDmfun1uhZBLZnVXO5Y3Ml62js/4f1q2IN6nomF5DxAPZaApgAwSNStaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WC/wI2cF0mbw0NPTDvZU6y4ubm89hf4Ks52Xk6vxZY=;
 b=mQrw/0i90Lt6T9T570WLZoKprLw6uiX2N/oalrwQNgejOtBIGk0PesBFnjn54qtCYxOSGhifFLlpOpfd/HP4PKjh1oVIoYtWhsonSfIdO2FioSGgkjvfPNfYk43MXaAyFnTcjfz3KnsT71QZEH1E2Ewy0p6J2ihpezKbQyTT9JHrvL1T1ZYhV3OqulNjvn3cQO3evs0mGGz2blhcrqY8wxpPsiCKkP4FFnG5en8Gdxky9hA5dwTXHY+ZYPt1wYUmkMAEQVZbYtb06kaYgJH6xFZKmURs0zSz/MTNDAPieZE6suDG4DIw8HvO7FTIO4+alebPvjuw1TX17z7yqn68EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WC/wI2cF0mbw0NPTDvZU6y4ubm89hf4Ks52Xk6vxZY=;
 b=Jgw/3ok5TV4AdkZpMpm1pE1NZY/EpgIIpmvMYW6jdYXPtoCcXX4htYTuJivScO6nK7KTLIdzljVEa505/TXaMVwMP6/pwUVEmj6RKJsc9c/xRro8EIYm8A2u2M71oqSbE3FIC2lJ6+cUQtojxYBXxArVD6kF3nEAkIxjP3N3GXs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15)
 by GVXPR08MB10542.eurprd08.prod.outlook.com (2603:10a6:150:150::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 07:49:49 +0000
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726]) by AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726%4]) with mapi id 15.20.9115.018; Fri, 19 Sep 2025
 07:49:49 +0000
Message-ID: <55874d37-e4ef-4f2a-b76c-fba318043421@wolfvision.net>
Date: Fri, 19 Sep 2025 09:49:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 08/17] media: rockchip: rkcif: add abstraction for
 interface and crop blocks
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
 linux-rockchip@lists.infradead.org
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <20240220-rk3568-vicap-v11-8-af0eada54e5d@collabora.com>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <20240220-rk3568-vicap-v11-8-af0eada54e5d@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0072.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::25) To AS4PR08MB7735.eurprd08.prod.outlook.com
 (2603:10a6:20b:512::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7735:EE_|GVXPR08MB10542:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c6a0479-54cc-4f80-5179-08ddf7511c4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TU9YU3h6M2JvM1NEalFkakxPY0FhZUc4SkhYMTJZMXNEdzdGOXNLbG40WlRF?=
 =?utf-8?B?cWJkZ3NGRTJjR1VFNVJNVTY3cUVSTktoQkF0c2FWdVpHdjczc3hHcmR0ZHZ2?=
 =?utf-8?B?cjZSaDJqeDNOMlo1WjVZRUJoR0VhZlhleUY0aGtOcWRncFB0Z0pLRnVYa2F3?=
 =?utf-8?B?aGgxcldJWi9UbUpuemZsOXpIMURIVkh5TXZvSG1KcFI3V3BzUTQ2WElvV01n?=
 =?utf-8?B?clJLanl6Rk5VUldUYkhFWHpGNkNHeENldDVvcUtPMXl5TXZnVGhtUmViUWVy?=
 =?utf-8?B?WU1LcXdqc0ZuU1RBVk1MVUx6b2Y3ZWlkZ1l4LzZZUTZCcEQ4dUdlbWZaYnhx?=
 =?utf-8?B?dTBaTHR4ZHFKalhKMExmWTYwbHVkaDZxcE5LRXA4cVVQWmRWQ0RpRU1mdUhV?=
 =?utf-8?B?Wk1WYW9aYy9MaWNGV0pNQm5uL2ExR0VqNEZzeVc1SllKWGMvWGR6SDduVlRr?=
 =?utf-8?B?RkhFNXB1TldIKzlIUjVrVnBlbWRDb0pYUDV2N1lzQWlxSXN1UDhLT2tLYm1O?=
 =?utf-8?B?dEowZjZmRDdCNTl3RHUySlBITVk5ZFJvcjZGZDBoMndUeDNoZWZ6bEwva3VX?=
 =?utf-8?B?azZRQ3pSMlhlWkF6anVCREdjQ2V6d0RURW9KZ3RleDFZK0tsNEQ1b0d5NWpI?=
 =?utf-8?B?d0lSd3RsNTdrRXc0VWtENHpOampaLzk0L21BN29WakxieHBaRUVoZm4yZFlN?=
 =?utf-8?B?dUJZSmxEZG5GQkE4QXA5cWxZT0RqcG11M0RFdXUxTmtrd0xEYTdWV2FzY3A1?=
 =?utf-8?B?N21hRXloekZVWm5ESFdpK3Y4NzVpbkpuZG1OQTBiR3ExOFptZmNZU0oyZG9t?=
 =?utf-8?B?WFY5bDljdHA4bWFhUHU2V3UwTzhDWFpZVVA3a0t2REo4Q1loRTNiWm9sTW94?=
 =?utf-8?B?ZUs2cS9oQlM2VnlZenQ0V2RFVnhlbG9DQlJkRWpYUDYrdHlTVjNiZ2RWVFVt?=
 =?utf-8?B?NlJMNXJLeTVsWVlyRkdsdjcvS3ROTDhzQkNScERHV2VXaXVTMXM1a3NvMDVo?=
 =?utf-8?B?aW93SDAwNm9yd3VqaVRIVCs3YmNwQ1h5VXFraVNTdkU1dHkxY1NiK0RCMlRt?=
 =?utf-8?B?Y3ZHTVB2R3FSQW9WS0M0aitVcWpod1djWWtveFRlZ0dLa0w1a05XeHRPckxR?=
 =?utf-8?B?NVIvZWQ0SFI2QlFnZ3RQQlVubEZVL00xd1VBSkF0Um0vZzhZZG5UcU52MWpm?=
 =?utf-8?B?dlNQRlg3YkNiWElOaGRDSXg0RSt0VHNPRFE0OWFPazdPRi80UXh5dGUwazRJ?=
 =?utf-8?B?WDV5ZVliYlJiczdtOEdYa1hSUTFGaXNuVm5FTnAxRUJXRGNFQWc3SVFMbmlS?=
 =?utf-8?B?OWY3UUtDM1NoQ2o5bTlMYWh0cnI4MEhkNi9RUWxKUW5WbEdEWkd3MEtIZlhx?=
 =?utf-8?B?eVpxNDVoS3k4RGh1YXdUeG8yUjZ1M3l5aXQxNVljZUVNSUx5LytOck5lVXNm?=
 =?utf-8?B?d3VXZlJhVnI3SkZpZzJoRW9PZHNwQTJlbVNrZ25FS3ZMcjZ3ekp5Wks0L3k0?=
 =?utf-8?B?TjlXYUo0RnhHYWtGakY2eTNqTEdWaGR6S1F1UFZPb2N0RlloTjFjcExVbW1O?=
 =?utf-8?B?VzlWbHdQZGtYc2gxODY1cGdLd3ExRyt5eHB2NDNjVHgyQzRHQkhxL2hkNHZu?=
 =?utf-8?B?aWRRdjV6ZHhPOU5KdUdwNGdlWmdrS0dKMnhleHlESVhzOEQrWEMwWGNQK0dj?=
 =?utf-8?B?Y29oNXFBVDk5MmowMEZkMlQ3ZkR2OURQdWZtck5NNFkwZjZHaUkvbHg4L1E3?=
 =?utf-8?B?YURDbTlGcnQzT2JXbWNlV0ZUSEN0UDdJNEZhRHdIMnlFamdmaU4vMFZ4KytC?=
 =?utf-8?B?cG92OFJQQlNFR1lqMDhJQVJOUHpXb1M2MWdiSG1jdW85TlpDd095ZjhiRnk2?=
 =?utf-8?B?RDhqWEZhVnM4K2QxK1hjZ1lLOEhMbU9FbFZyZURQak1LUnFRL0NOSDUweE1o?=
 =?utf-8?B?TnVRTXFZaU9WZnNSYUp6SDJwZjhLWnVON0NobkVPOFJZMDUvSFIxT0hmOHpp?=
 =?utf-8?B?ajhxTXVrdXFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXRlOWtYTmR2UGYvVHc1MjRSbi94L0ZHdkVUTlN1dTVjdzQrUmxaMTlKYVV2?=
 =?utf-8?B?em5nenRua3kxZ0FrdlNNRVQ5MFVQaHc2S2FsZ0VXZUNrcjlkdzAyUW54cXRV?=
 =?utf-8?B?Y0hwUXNTaW5hck9KeGE0V29kNmczRlFmL3VCNTcxSStnbHdUakF4S2lnVTJj?=
 =?utf-8?B?ZkhzbjVvUTFDL2MyeVd1V2VQQkMvM2E1NmJSV096V01PZEtHMXRreUN2Wmda?=
 =?utf-8?B?SEwwNmFDTFpjbWlPSHZnVXBwTnB1endDUnJ0SlJkYkluc2IyTmFqV0IraVFz?=
 =?utf-8?B?bDY3VnRVdGU3OWxkNDhtdU5oVjNWczlYS21JZFh5dFU5ZWJVbVRHajJKejAz?=
 =?utf-8?B?WFZUUlhwR2ZVdStuVWtpaVU4Y3JCS0hGamlUbUNmcVdVaGFLaFlUUUlZcU5Y?=
 =?utf-8?B?eTlpZ0lwTy9LaW5lVEp4OHA2UnoxK05MbGtqT1hmK1ZuNkNnUlVyd3FTL0dV?=
 =?utf-8?B?dVl3QlZVbCtwdHR0Uko1R2ZyT1NnMjlKdk84cXRNa0hjODZieWpjQndsV3hi?=
 =?utf-8?B?d2dGa2xPdGdNUms0RVkzYlpMZ25HcDJVQ08rU3creG5GRldrbTJmbmFuMGFp?=
 =?utf-8?B?ZEMvMHkyNDBudUJ5SWdUUnFEME1xNDN5TmcxUFlCa3JGdEhxMndUU1hiRGRu?=
 =?utf-8?B?NGVheVVZL2FmOEtKcC9OcHhKWXdCUGZtQ1ZKalNjUEtTUnNNb2FuOExJeDY3?=
 =?utf-8?B?dkdXZnZsNnNLUUdqanU1bVZsSGRkejdNbGpOMXZSV3Q5MXcrTUxIU0s3ZnBM?=
 =?utf-8?B?US9vZzE2SXhTUDBFWlc4MGVjbTVjZDRmNTJGZEwyYlJqTWY2ODdkZ1RXRkZp?=
 =?utf-8?B?YVBQTFZ0VDNLYVdwaGcwaTdjUlVQQnVnbzNUVVR0TlB4dUZsaGU0WTM0Vjd4?=
 =?utf-8?B?RVRCdzBTY25UMXp6OTcxcmlCOU5ST1Vpa21qd1MxcjdsenNMcXU3SFNDYTJ0?=
 =?utf-8?B?R1d4Q0VZOU1JS3REZWxrOU04SHkxZWM0Z1BGamFLZGNTMm5SaVVVWUdKdFBV?=
 =?utf-8?B?UWZ1YnNLSXpjZmkzVkhrOS9vQ0hlcWlFd3lQMzhsNjdJRGROUkcyTXdCcmR3?=
 =?utf-8?B?UUFMS3Z4Q2dsMGZxMUR3SlZoNjQ3VlBuUnZWSnpTRHpXNjhocDlUeGplando?=
 =?utf-8?B?M0ZFUEUrK2tTSjV1OWlFV0xVcVgzY2x2ZzlHU1llbEQrVUJZRjRBeVRIN0tu?=
 =?utf-8?B?cnh0WGpDQmxsc2JCbW9tcHkreFVhdmhIczNTNGRvR0plQUUwYjY4OFNmZWJG?=
 =?utf-8?B?WDQzMVVuTEhyd2JuanZPSXRPUmxrOWZ0MlpoUGZ4bmJzY2NEeW81Zzd1cGww?=
 =?utf-8?B?VTRkTlV1SW02eXd6ZVRZTXFySndOd3ZnMlZ6c1BycmlqV29OTVRISE50SDNt?=
 =?utf-8?B?ampDbGluVnB4a0FHZlR2b25yb2VMZ3IvZHZRdktvc3FGclRwZ2FaYitwRFlK?=
 =?utf-8?B?OWZVS3JPMC9MS1hTdG45b2pxZ2Q2YkhUMzEvTWNLYW9sRWhPUWppUWFFSWgx?=
 =?utf-8?B?U1JOQmNJVEgrSjhQRnVwSHhacVlPVVhYcEtUZTA4Kzg2Qy9JMjJwSnNsWkJY?=
 =?utf-8?B?VjRlaTErOGc5dmRaT2lqUEJUZ08rRlRPTkpxTlJYeUVuaXhINkJzNHRjVE9O?=
 =?utf-8?B?Nk1ON2RTMzIvbWFleFJQSXJXSC9ScmdkbzBvakR5U2t4R0xLalNrT0hWcks3?=
 =?utf-8?B?eStCL00wQ01HdUpNZU1aSm94UFNWRGtRbkFkNWRuUTFzNkRRMVBPK3pNRTIv?=
 =?utf-8?B?ZkJFbkRqVE8vTHIzMWc0K2RyL2lkdmNqeUkwU1JzNHJhcHlpejNEQzBYN01G?=
 =?utf-8?B?L09IMWQ3bjE4a2VhNXR0ZDFFVzkvVUZpQXMvOTRYRjlWYjF4MnRrbUVtRnhN?=
 =?utf-8?B?RjNvdGpKYTdSOVllT1psaitzaW1JeEo5amNsMjVmVE0yclI1eEJ6bTFibkZu?=
 =?utf-8?B?K01mRTZkcTQrazI1c3N3L0Z4NldUMDFFMm0xSEV1SkV6dW1aZWMxa2M0VGJZ?=
 =?utf-8?B?ZE9XbVFyT3ZVMUpWWVFlZnA5bC9yWUhVNXhoZTM4ZzFCemsyQUIwVTljSGhD?=
 =?utf-8?B?QjFpU2lPTkZSWTV5TFhCTS9WeUFweHN1ZUxsVVpXRUlPejZUcXpFMFBGcXZx?=
 =?utf-8?B?Yzd6bDJLblBhR0ZsMHJGU2FCMVVoeWdheWE5WERDeDdIU1MyY3NVbXp6V0Zh?=
 =?utf-8?B?NlE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c6a0479-54cc-4f80-5179-08ddf7511c4f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 07:49:49.7346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: moXJbdF1XDewtITjADO7VDmlixfQiFrdATIGrqyMIlTnVv+ibVyHlaNPSXKtwa4N1sDNa2EvWH9sYf7RVZLRR/hHStmoBhY7TXI2SLZUUOY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10542

Hi Michael,

Am 17.09.2025 um 17:38 schrieb Michael Riesch via B4 Relay:
> From: Michael Riesch <michael.riesch@collabora.com>
> 
> Add an abstraction for the INTERFACE and CROP parts of the different
> Rockchip Camera Interface (CIF) variants. These parts are represented
> as V4L2 subdevice with one sink pad and one source pad. The sink pad
> is connected to a subdevice: either the subdevice provided by the
> driver of the companion chip connected to the DVP, or the subdevice
> provided by the MIPI CSI-2 receiver. The source pad is connected to
> V4l2 device(s) provided by one or many instance(s) of the DMA
> abstraction.
> 
> Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
> ---
>  drivers/media/platform/rockchip/rkcif/Makefile     |   1 +
>  .../media/platform/rockchip/rkcif/rkcif-common.h   |  71 ++++
>  drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |  13 +
>  .../platform/rockchip/rkcif/rkcif-interface.c      | 388 +++++++++++++++++++++
>  .../platform/rockchip/rkcif/rkcif-interface.h      |  30 ++
>  5 files changed, 503 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
> index c6837ed2f65c..9d535fc27e51 100644
> --- a/drivers/media/platform/rockchip/rkcif/Makefile
> +++ b/drivers/media/platform/rockchip/rkcif/Makefile
> @@ -2,3 +2,4 @@
>  obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-cif.o
>  
>  rockchip-cif-objs += rkcif-dev.o
> +rockchip-cif-objs += rkcif-interface.o
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> index 43a9390526d8..a3e052ad885a 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
> @@ -26,9 +26,78 @@
>  #define RKCIF_DRIVER_NAME "rockchip-cif"
>  #define RKCIF_CLK_MAX	  4
>  
> +enum rkcif_format_type {
> +	RKCIF_FMT_TYPE_INVALID,
> +	RKCIF_FMT_TYPE_YUV,
> +	RKCIF_FMT_TYPE_RAW,
> +};
> +
> +enum rkcif_interface_index {
> +	RKCIF_DVP,
> +	RKCIF_MIPI_BASE,
> +	RKCIF_MIPI1 = RKCIF_MIPI_BASE,
> +	RKCIF_MIPI2,
> +	RKCIF_MIPI3,
> +	RKCIF_MIPI4,
> +	RKCIF_MIPI5,
> +	RKCIF_MIPI6,
> +	RKCIF_MIPI_MAX,
> +	RKCIF_IF_MAX = RKCIF_MIPI_MAX
> +};
> +
> +enum rkcif_interface_pad_index {
> +	RKCIF_IF_PAD_SINK,
> +	RKCIF_IF_PAD_SRC,
> +	RKCIF_IF_PAD_MAX
> +};
> +
> +enum rkcif_interface_status {
> +	RKCIF_IF_INACTIVE,
> +	RKCIF_IF_ACTIVE,
> +};
> +
> +enum rkcif_interface_type {
> +	RKCIF_IF_INVALID,
> +	RKCIF_IF_DVP,
> +	RKCIF_IF_MIPI,
> +};
> +
> +struct rkcif_input_fmt {
> +	u32 mbus_code;
> +
> +	enum rkcif_format_type fmt_type;
> +	enum v4l2_field field;
> +};
> +
> +struct rkcif_interface;
> +
>  struct rkcif_remote {
>  	struct v4l2_async_connection async_conn;
>  	struct v4l2_subdev *sd;
> +
> +	struct rkcif_interface *interface;
> +};
> +
> +struct rkcif_dvp {
> +	u32 dvp_clk_delay;
> +};
> +
> +struct rkcif_interface {
> +	enum rkcif_interface_type type;
> +	enum rkcif_interface_status status;
> +	enum rkcif_interface_index index;
> +	struct rkcif_device *rkcif;
> +	struct rkcif_remote *remote;
> +	const struct rkcif_input_fmt *in_fmts;
> +	unsigned int in_fmts_num;
> +
> +	struct media_pad pads[RKCIF_IF_PAD_MAX];
> +	struct v4l2_fwnode_endpoint vep;
> +	struct v4l2_subdev sd;
> +
> +	union {
> +		struct rkcif_dvp dvp;
> +	};
>  };
>  
>  struct rkcif_match_data {
> @@ -46,6 +115,8 @@ struct rkcif_device {
>  	struct reset_control *reset;
>  	void __iomem *base_addr;
>  
> +	struct rkcif_interface interfaces[RKCIF_IF_MAX];
> +
>  	struct media_device media_dev;
>  	struct v4l2_device v4l2_dev;
>  	struct v4l2_async_notifier notifier;
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> index a8514e7d3249..331634e5e74b 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
> @@ -73,8 +73,21 @@ static int rkcif_notifier_bound(struct v4l2_async_notifier *notifier,
>  				struct v4l2_subdev *sd,
>  				struct v4l2_async_connection *asd)
>  {
> +	struct rkcif_device *rkcif =
> +		container_of(notifier, struct rkcif_device, notifier);
>  	struct rkcif_remote *remote =
>  		container_of(asd, struct rkcif_remote, async_conn);
> +	struct media_pad *sink_pad =
> +		&remote->interface->pads[RKCIF_IF_PAD_SINK];
> +	int ret;
> +
> +	ret = v4l2_create_fwnode_links_to_pad(sd, sink_pad,
> +					      MEDIA_LNK_FL_ENABLED);
> +	if (ret) {
> +		dev_err(rkcif->dev, "failed to link source pad of %s\n",
> +			sd->name);
> +		return ret;
> +	}
>  
>  	remote->sd = sd;
>  
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> new file mode 100644
> index 000000000000..06386144b70c
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
> @@ -0,0 +1,388 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#include <media/v4l2-common.h>
> +#include <media/v4l2-fwnode.h>
> +#include <media/v4l2-mc.h>
> +#include <media/v4l2-subdev.h>
> +
> +#include "rkcif-common.h"
> +#include "rkcif-interface.h"
> +
> +static inline struct rkcif_interface *to_rkcif_interface(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct rkcif_interface, sd);
> +}
> +
> +static const struct media_entity_operations rkcif_interface_media_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +	.has_pad_interdep = v4l2_subdev_has_pad_interdep,
> +};
> +
> +static int rkcif_interface_set_fmt(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_format *format)
> +{
> +	struct rkcif_interface *interface = to_rkcif_interface(sd);
> +	const struct rkcif_input_fmt *input;
> +	struct v4l2_mbus_framefmt *sink, *src;
> +
> +	/* the format on the source pad always matches the sink pad */
> +	if (format->pad == RKCIF_IF_PAD_SRC)
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	input = rkcif_interface_find_input_fmt(interface, true,
> +					       format->format.code);
> +	format->format.code = input->mbus_code;
> +
> +	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!sink)
> +		return -EINVAL;
> +
> +	*sink = format->format;
> +
> +	/* propagate the format to the source pad */
> +	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!src)
> +		return -EINVAL;
> +
> +	*src = *sink;
> +
> +	return 0;
> +}
> +
> +static int rkcif_interface_get_sel(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_selection *sel)
> +{
> +	struct v4l2_mbus_framefmt *sink;
> +	struct v4l2_rect *crop;
> +	int ret = 0;
> +
> +	if (sel->pad != RKCIF_IF_PAD_SRC)
> +		return -EINVAL;
> +
> +	sink = v4l2_subdev_state_get_opposite_stream_format(state, sel->pad,
> +							    sel->stream);
> +	if (!sink)
> +		return -EINVAL;
> +
> +	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
> +	if (!crop)
> +		return -EINVAL;
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:
> +		sel->r.left = 0;
> +		sel->r.top = 0;
> +		sel->r.width = sink->width;
> +		sel->r.height = sink->height;
> +		break;
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *crop;
> +		break;
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int rkcif_interface_set_sel(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state,
> +				   struct v4l2_subdev_selection *sel)
> +{
> +	struct v4l2_mbus_framefmt *sink, *src;
> +	struct v4l2_rect *crop;
> +
> +	if (sel->pad != RKCIF_IF_PAD_SRC || sel->target != V4L2_SEL_TGT_CROP)
> +		return -EINVAL;
> +
> +	sink = v4l2_subdev_state_get_opposite_stream_format(state, sel->pad,
> +							    sel->stream);
> +	if (!sink)
> +		return -EINVAL;
> +
> +	src = v4l2_subdev_state_get_format(state, sel->pad, sel->stream);
> +	if (!src)
> +		return -EINVAL;
> +
> +	crop = v4l2_subdev_state_get_crop(state, sel->pad, sel->stream);
> +	if (!crop)
> +		return -EINVAL;
> +
> +	/* only starting point of crop can be specified */
> +	sel->r.height = sink->height - sel->r.top;
> +	sel->r.width = sink->width - sel->r.left;
> +	*crop = sel->r;
> +
> +	src->height = sel->r.height;
> +	src->width = sel->r.width;
> +
> +	return 0;
> +}
> +
> +static int rkcif_interface_set_routing(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state,
> +				       enum v4l2_subdev_format_whence which,
> +				       struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
> +	if (ret)
> +		return ret;
> +
> +	ret = v4l2_subdev_set_routing(sd, state, routing);
> +
> +	return ret;
> +}
> +
> +static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
> +					  struct v4l2_subdev_state *state,
> +					  u32 pad, u64 streams_mask)
> +{
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *remote_pad;
> +	u64 mask;
> +
> +	remote_pad =
> +		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
> +					       RKCIF_IF_PAD_SRC, &streams_mask);
> +
> +	return v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
> +}
> +
> +static int rkcif_interface_disable_streams(struct v4l2_subdev *sd,
> +					   struct v4l2_subdev_state *state,
> +					   u32 pad, u64 streams_mask)
> +{
> +	struct v4l2_subdev *remote_sd;
> +	struct media_pad *remote_pad;
> +	u64 mask;
> +
> +	remote_pad =
> +		media_pad_remote_pad_first(&sd->entity.pads[RKCIF_IF_PAD_SINK]);
> +	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
> +
> +	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
> +					       RKCIF_IF_PAD_SRC, &streams_mask);
> +
> +	return v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
> +}
> +
> +static const struct v4l2_subdev_pad_ops rkcif_interface_pad_ops = {
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = rkcif_interface_set_fmt,
> +	.get_selection = rkcif_interface_get_sel,
> +	.set_selection = rkcif_interface_set_sel,
> +	.set_routing = rkcif_interface_set_routing,
> +	.enable_streams = rkcif_interface_enable_streams,
> +	.disable_streams = rkcif_interface_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops rkcif_interface_ops = {
> +	.pad = &rkcif_interface_pad_ops,
> +};
> +
> +static int rkcif_interface_init_state(struct v4l2_subdev *sd,
> +				      struct v4l2_subdev_state *state)
> +{
> +	struct rkcif_interface *interface = to_rkcif_interface(sd);
> +	struct v4l2_subdev_route routes[] = {
> +		{
> +			.sink_pad = RKCIF_IF_PAD_SINK,
> +			.sink_stream = 0,
> +			.source_pad = RKCIF_IF_PAD_SRC,
> +			.source_stream = 0,
> +			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +		},
> +	};
> +	struct v4l2_subdev_krouting routing = {
> +		.len_routes = ARRAY_SIZE(routes),
> +		.num_routes = ARRAY_SIZE(routes),
> +		.routes = routes,
> +	};
> +	const struct v4l2_mbus_framefmt dvp_default_format = {
> +		.width = 3840,
> +		.height = 2160,
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_REC709,
> +		.ycbcr_enc = V4L2_YCBCR_ENC_709,
> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +		.xfer_func = V4L2_XFER_FUNC_NONE,
> +	};
> +	const struct v4l2_mbus_framefmt mipi_default_format = {
> +		.width = 3840,
> +		.height = 2160,
> +		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_RAW,
> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +		.quantization = V4L2_QUANTIZATION_FULL_RANGE,
> +		.xfer_func = V4L2_XFER_FUNC_NONE,
> +	};
> +	const struct v4l2_mbus_framefmt *default_format;
> +	int ret;
> +
> +	default_format = (interface->type == RKCIF_IF_DVP) ?
> +				 &dvp_default_format :
> +				 &mipi_default_format;
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
> +					       default_format);
> +
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_internal_ops rkcif_interface_internal_ops = {
> +	.init_state = rkcif_interface_init_state,
> +};
> +
> +static int rkcif_interface_add(struct rkcif_interface *interface)
> +{
> +	struct rkcif_device *rkcif = interface->rkcif;
> +	struct rkcif_remote *remote;
> +	struct v4l2_async_notifier *ntf = &rkcif->notifier;
> +	struct v4l2_fwnode_endpoint *vep = &interface->vep;
> +	struct device *dev = rkcif->dev;
> +	struct fwnode_handle *ep;
> +	u32 dvp_clk_delay = 0;
> +	int ret;
> +
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), interface->index,
> +					     0, 0);
> +	if (!ep)
> +		return -ENODEV;
> +
> +	vep->bus_type = V4L2_MBUS_UNKNOWN;
> +	ret = v4l2_fwnode_endpoint_parse(ep, vep);
> +	if (ret)
> +		goto complete;
> +
> +	if (interface->type == RKCIF_IF_DVP) {
> +		if (vep->bus_type != V4L2_MBUS_BT656 &&
> +		    vep->bus_type != V4L2_MBUS_PARALLEL) {
> +			ret = dev_err_probe(dev, -EINVAL,
> +					    "unsupported bus type\n");
> +			goto complete;
> +		}
> +
> +		fwnode_property_read_u32(ep, "rockchip,dvp-clk-delay",
> +					 &dvp_clk_delay);
> +		interface->dvp.dvp_clk_delay = dvp_clk_delay;
> +	}
> +
> +	remote = v4l2_async_nf_add_fwnode_remote(ntf, ep, struct rkcif_remote);
> +	if (IS_ERR(remote)) {
> +		ret = PTR_ERR(remote);
> +		goto complete;
> +	}
> +
> +	remote->interface = interface;
> +	interface->remote = remote;
> +	interface->status = RKCIF_IF_ACTIVE;
> +	ret = 0;
> +
> +complete:
> +	fwnode_handle_put(ep);
> +
> +	return ret;
> +}
> +
> +int rkcif_interface_register(struct rkcif_device *rkcif,
> +			     struct rkcif_interface *interface)
> +{
> +	struct media_pad *pads = interface->pads;
> +	struct v4l2_subdev *sd = &interface->sd;
> +	int ret;
> +
> +	interface->rkcif = rkcif;
> +
> +	v4l2_subdev_init(sd, &rkcif_interface_ops);
> +	sd->dev = rkcif->dev;
> +	sd->entity.ops = &rkcif_interface_media_ops;
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> +	sd->internal_ops = &rkcif_interface_internal_ops;
> +	sd->owner = THIS_MODULE;
> +
> +	if (interface->type == RKCIF_IF_DVP)
> +		snprintf(sd->name, sizeof(sd->name), "rkcif-dvp0");
> +	else if (interface->type == RKCIF_IF_MIPI)
> +		snprintf(sd->name, sizeof(sd->name), "rkcif-mipi%d",
> +			 interface->index - RKCIF_MIPI_BASE);
> +
> +	pads[RKCIF_IF_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +	pads[RKCIF_IF_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
> +	ret = media_entity_pads_init(&sd->entity, RKCIF_IF_PAD_MAX, pads);
> +	if (ret)
> +		goto err;
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto err_entity_cleanup;
> +
> +	ret = v4l2_device_register_subdev(&rkcif->v4l2_dev, sd);
> +	if (ret) {
> +		dev_err(sd->dev, "failed to register subdev\n");
> +		goto err_subdev_cleanup;
> +	}
> +
> +	ret = rkcif_interface_add(interface);
> +	if (ret)
> +		goto err_subdev_unregister;
> +
> +	return 0;
> +
> +err_subdev_unregister:
> +	v4l2_device_unregister_subdev(sd);
> +err_subdev_cleanup:
> +	v4l2_subdev_cleanup(sd);
> +err_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
> +err:
> +	return ret;
> +}
> +
> +void rkcif_interface_unregister(struct rkcif_interface *interface)
> +{
> +	struct v4l2_subdev *sd = &interface->sd;
> +
> +	if (interface->status != RKCIF_IF_ACTIVE)
> +		return;
> +
> +	v4l2_device_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +}
> +
> +const struct rkcif_input_fmt *
> +rkcif_interface_find_input_fmt(struct rkcif_interface *interface, bool ret_def,
> +			       u32 mbus_code)
> +{
> +	const struct rkcif_input_fmt *fmt;
> +
> +	WARN_ON(interface->in_fmts_num == 0);
> +
> +	for (unsigned int i = 0; i < interface->in_fmts_num; i++) {
> +		fmt = &interface->in_fmts[i];
> +		if (fmt->mbus_code == mbus_code)
> +			return fmt;
> +	}
> +	if (ret_def)
> +		return &interface->in_fmts[0];
> +	else
> +		return NULL;
> +}
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.h b/drivers/media/platform/rockchip/rkcif/rkcif-interface.h
> new file mode 100644
> index 000000000000..817ef633b3fe
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.h
> @@ -0,0 +1,30 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip Camera Interface (CIF) Driver
> + *
> + * Abstraction for the INTERFACE and CROP parts of the different CIF variants.
> + * They shall be represented as V4L2 subdevice with one sink pad and one
> + * source pad. The sink pad is connected to a subdevice: either the subdevice
> + * provided by the driver of the companion chip connected to the DVP, or the
> + * subdevice provided by the MIPI CSI-2 receiver driver. The source pad is
> + * to V4l2 device(s) provided by one or many instance(s) of the DMA
> + * abstraction.
> + *
> + * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
> + */
> +
> +#ifndef _RKCIF_INTERFACE_H
> +#define _RKCIF_INTERFACE_H
> +
> +#include "rkcif-common.h"
> +
> +int rkcif_interface_register(struct rkcif_device *rkcif,
> +			     struct rkcif_interface *interface);
> +
> +void rkcif_interface_unregister(struct rkcif_interface *interface);
> +
> +const struct rkcif_input_fmt *
> +rkcif_interface_find_input_fmt(struct rkcif_interface *interface, bool ret_def,
> +			       u32 mbus_code);
> +
> +#endif
> 

Tested-by: Gerald Loacker <gerald.loacker@wolfvision.net>
Reviewed-by: Gerald Loacker <gerald.loacker@wolfvision.net>

Tested on Wolfvision PF5 (with Wolfvision PF5 IO Expander).

Regards,
Gerald

