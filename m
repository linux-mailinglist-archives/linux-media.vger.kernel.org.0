Return-Path: <linux-media+bounces-44245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B64BD1BA0
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 09:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2194C1888C6B
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 07:01:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AAE62E7F29;
	Mon, 13 Oct 2025 07:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="qScjGgOc"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023139.outbound.protection.outlook.com [40.107.159.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7874E2F56;
	Mon, 13 Oct 2025 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760338872; cv=fail; b=ga8xFwuSru89LzLyun/oO2ej51n39TZJ2uxI5s2lAPwGMoPB8iieR+KhP9N3w6fEXBFZMpw96zEAIiDxkgtj/MfhV08XjWTFNZ+EIB99w5bDlNXYtqTf8rfA/rxLj/Pzpw/mBeOuz3l/OlUfJ9j6UF9L1DxPGa6LOnSRp7YOslI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760338872; c=relaxed/simple;
	bh=w18b3BAl8mT1CC7vu+M9Fm7s0SDWb6E/INlu2VHwhFY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dqe4fmc8tZk6CnpduieaANMBN9oYlWmVSx7ywKBQ70Xo60gETvMZOjjUKINKdnjZUcc10pfXroBQCvlWE1FM9Se6EGZ8nrVer8mGY2fpos6vJEJ9QooqKt90XslAiZCX+eIenHEjgo6cktT92RSWa+6ZdWwkk64Z75MtgD05ecw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=qScjGgOc; arc=fail smtp.client-ip=40.107.159.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pt2tROkES4PeyxJYrXvojY3xoFK8C0TCWqX302gmf3y6cxCD7MJYiQJi0fd9hHz/aqPm1PQ3ZMDSQ2sWYgEDvU6gKeDhC/ao8KU56t+XB+aVdzGgKDEvrhET2FTv4uzMwvDzC0cSSbWP3pq6mRcm+taE+5oVm5eEexKM3wuje97jHXRXg+77xCnMdZHJIHcf9RVmZqBeg4mAlgBGntnRCMub3wgROQTBYWba0k0rSpTvSSqisJIt5UXSawn9sNeFzUFVSIMheoGYEkNdJIMyVM+yfYoeTr32Z7ZMk225FdtGm5yVXG4mIbHl9v8yB9PdfFXp8dz3IjI0RSW/NZ42kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0fo586HePkUPVOupDvAIfsRQNM5VeU2X1bauMrLtL6g=;
 b=c2gFIapmWEy3NN5uKPZQ+/lztHOAZNwUECXNKo+lu+s7YFrIjJh0LoX7ZTv9OWiLAKyYQA2PEB5Dqaflulyq0aaYQM1MrWwUVT9+/+51oYsswZB1sfdh7JkKDwl0SUd6FnjllGxR6oSt5BZHZ7jGhn167Iy7ARo96Bg5ZSFb53460cQzjchB8HVlr+NVIj7smM7l5FQWTLlPljzyi60NQrkW8kjsow09nDLT9psBmKLo5PFDkkn7121Xjug1tsj5zmdco2rRkkqUESk01P8U4pMw8JIsovTy59t+Eovzo5yqmEXFXRIkQWR34xgpzF9uqnrAqYEcDY8EvwB46bSaiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0fo586HePkUPVOupDvAIfsRQNM5VeU2X1bauMrLtL6g=;
 b=qScjGgOcnL2CNSjWIvt2rHNh7mnHjfhsxd+3LGvU8rWSLiYRnVNSY/ilsH56cWmkng+aNucH2JCj4OZgipqTRSGTOmc/zVk29N5L0BEZ+/dR/gLzOpFKpWd/ZwBUpvRKmBMFwhMFZj3rylY1fSdzCTSUCvih5UCXYOx2vcSySzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com (2603:10a6:20b:512::15)
 by DB4PR08MB8149.eurprd08.prod.outlook.com (2603:10a6:10:383::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.11; Mon, 13 Oct
 2025 07:01:01 +0000
Received: from AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726]) by AS4PR08MB7735.eurprd08.prod.outlook.com
 ([fe80::dc8:5e03:5b06:8726%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 07:01:01 +0000
Message-ID: <b7cccc39-612d-4736-8689-890b4077e730@wolfvision.net>
Date: Mon, 13 Oct 2025 09:00:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/17] media: rockchip: add a driver for the rockchip
 camera interface
To: Michael Riesch <michael.riesch@collabora.com>,
 Bryan O'Donoghue <bod@kernel.org>, Mehdi Djait
 <mehdi.djait@linux.intel.com>,
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <HSTnNzc6MTLHGWih5qjlI2nvVECP8FVdcQVeBON4KlWYLtEaWIlNmEpKTU_vlqitbIIHMpabKnvnmpEQFqHYxQ==@protonmail.internalid>
 <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
 <88b1dcda-be2d-4c57-b042-c1809ef1dc97@kernel.org>
 <de1a1dce-f60e-48a1-9945-d2c91b328df5@collabora.com>
From: Gerald Loacker <gerald.loacker@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <de1a1dce-f60e-48a1-9945-d2c91b328df5@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0151.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::35) To AS4PR08MB7735.eurprd08.prod.outlook.com
 (2603:10a6:20b:512::15)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR08MB7735:EE_|DB4PR08MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c1a6835-47dd-4d1a-aff5-08de0a2644a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVRSWmNjM210QlNkdUxXWWpzdWt6VVhSQ3hWTkFINUNoY0xjNGZwQXpLVXli?=
 =?utf-8?B?azhlakx3RFBabVBrcFlwODNsL090V29YL1BTbFM0Vnd4RFFXUG9WWk1oQ29Y?=
 =?utf-8?B?RC93c1Vjc09tVnFiRVd3TmVPQ0s5L0N6ZGZjOTdtcmZjWjJpc2NEMUxwMDFq?=
 =?utf-8?B?d1dSaXozY2gwZEhISktoSTk4L3cvQXJvZG5KZ2MwTE50bkwvR0k0MzArbEVo?=
 =?utf-8?B?RUFTaW9YaWdKNE8rZUk1NWowNU9Hd0IrQkV0aHRVVERQY3JkR0tjZndXakhr?=
 =?utf-8?B?dWpMKzBlYzNMeUFwdmF5cWFCcXRML0krcmJlL3hDOFZNN2JDL1Z3YXRSbFVi?=
 =?utf-8?B?Z2hmU1IzQzFFS29WMzlsK3d1K2VWV1ZGVU4xZnl2WFFVUXZkM2ZWazRYM2Ur?=
 =?utf-8?B?amFhZkhTTWpSMzZFZVVTem4vREtGMjZBSXBqRlhRVjdoOTFMVDA0SGRDOEwy?=
 =?utf-8?B?S2VxOHhWemM1VU9iSkZJY2I2RXM0TVBGYVF1Z20zV3gvdWFvNHh6dXJuSkhX?=
 =?utf-8?B?YU5xOExUUWR4R1RtU1dQbzF4Ylpid3hsYUc1aVExWm1vYjhtQXlNSXJKeFlH?=
 =?utf-8?B?K1V1bCtxSm5SNG9CQ1lNTFdmRUNTdDRHdW55ZUZPNTYvUjB4RU0yZ0dkSFEw?=
 =?utf-8?B?cWxqZGp4TENmNjBPelRIcWpxZEp5QkIrNXB2eGZnZ3pPL3VIZ1FwVTV2UCtC?=
 =?utf-8?B?cUNrWjVoYnRWZVlRR0hIclNDcVd5dURQeXpvbFo2c0RxVEdSMGc1RnNDd01z?=
 =?utf-8?B?ei94RFNwODIrb3RMb0grUjFQc1E4aVpRS0hsemFoT09CM2ZjdlB4T0lxaktF?=
 =?utf-8?B?alJWUDlORU5XK3RFbWVjRlFVVVgwSHBHUlM4WG9RVXNyMEtWSy9yeDZHL1dl?=
 =?utf-8?B?c05acURUUEpkaVZTUUNvWUV4OXpobjBhRndEK2Z3cnBtNHZIOE5zYzVPSVNx?=
 =?utf-8?B?UWMzYmszQVV0akQ4YU8vc251VmtuQUNkV014MFNpSlV5WUplV1EzU3RNVjFu?=
 =?utf-8?B?NWxtT2hwcEt5YlRPVnBkSk1mc0NVODNXUGF3NDhNQ0FTckN6cmRkYnNpdkgy?=
 =?utf-8?B?ZWVIZ2cyK21Mbzd2bVFNd3U3bUs2WGJLUkJnQ0l5WGVXekdMVDJqeTVvc294?=
 =?utf-8?B?Wlo3MStNWlZmUFJTUnF0Y0J5ODZXek43UnJuMTJwdjBSZW9KQkJPNms5TUhh?=
 =?utf-8?B?ZDR6OWdxZEpTNWcxUWVKaUpvRS8xMFZSMm90emhVcmlXcjIrY3JHUHpCQUlM?=
 =?utf-8?B?azNuMHVrcVpiYXd1UHJEQVBmckJNSnVGWnM5K1grbE0rd1RaQ1lOR1JVWEJS?=
 =?utf-8?B?NENGdmJsYU96UWNSUmRZMVFxTmRCV1crdlJmaGNzQ3ZmWkRzTlZYT0xSZzhC?=
 =?utf-8?B?QzlvYnBNN2lMVCtvbmVBQzRXdTk1dE5BcXpRWnRmMFNSYkM5eFVSSFcrZ3d0?=
 =?utf-8?B?ZVRCQi9RUlA1N1ZDSWU4NTkxWmJrSlZqQTRRTXJEcDhZKzZQblkyaFpnNlVq?=
 =?utf-8?B?SE5aLzN0MkNsZUErcG54UTcySkJVczNFRThTZGQvL3M1NWlZMHlHd2haOTRR?=
 =?utf-8?B?R3l1TkREMWhaYllQNFVxUXlxTFE2VHpQZ1duQzhWbldJUjRPQVV0VnkxalJQ?=
 =?utf-8?B?TDQ1SmFPWHVwK0JydHpsTHVzVWtOUlFFS1pzR3JnS3JWcnlYZFg3RUgvV3ZS?=
 =?utf-8?B?U1FPUEIwOC9WQ3BEMHFnQ1pTelBzQkUrR2lKQk4wMTMwZ0FhMEVLSS9VdHo3?=
 =?utf-8?B?cGhtQXVLbDdkcVQ1YkoyUFc3clIwNmhpc3E3LzMwdFZWMVlZOCtKcnFlQjk1?=
 =?utf-8?B?cFRQOFVuRTIzWEtJYkJwbnFxZFVOMksvTzdydW1uZy9uOXNyeXgzYWJHYnVx?=
 =?utf-8?B?eWRJNFFkRGppRkFFVXl3NDM5cCs4aVZGTVJXZ05yajhZc2dTR1pnMG15cEJZ?=
 =?utf-8?B?Lyt2NXU0RWNOL3huR2dVMWhQdmllUVkwWEJoU2M2OTVNY09Tc3RNUENtY3B1?=
 =?utf-8?B?RVlmQnNzWnR6c1RnOGcxd3pDTXErMmVDU2FlMU9GeU1vYkp0L2ZUZm43U0NI?=
 =?utf-8?Q?RJEnbd?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7735.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEJiMk41NHVBdHdsVEpibXpWRnRWTUMyUE84aUxBQ05KcitFTUxJQVdhN1Ro?=
 =?utf-8?B?aXRDR3BPNVdzdWZ1MXFGcjBVTTVQTEsweUZiYVV5K1NzOE5SU1pBOWw2TXRS?=
 =?utf-8?B?UDdOaUdadnhXWG1rSlRiUzZ5anZ2WTZNZFNXTm8wNlVhaTJJOXREb1dGNTk2?=
 =?utf-8?B?L1lCS29pOWw5VlFEMTZHR0gzajhCbXI1aSsrV0VNZ1VPODNSbEhiMUtmcjBC?=
 =?utf-8?B?RTQzY1ZpTTBLd2JRT0ZtM0RNSzNrU0tORVZFVEI1MEd6anZMNFg3bWdTcEJQ?=
 =?utf-8?B?Sjc1cmowTDl5dFpibThDVzhURi9QWFUyRzkrcURzNDhkQnJKWVZGUm5NSExF?=
 =?utf-8?B?YXBacEZXbE45VEpTeVBYMjBKOFpQZzZ5UDB0K1I0RG5HSGtKOXNpT0NNd3lj?=
 =?utf-8?B?alZGbXR5aklPVHNvVlVTVjJIbjhZUnJkSzlVME1aQUZIa2pVclZTOXlVeVhC?=
 =?utf-8?B?WlcvalNIN2p5TlM0di9RS1d2R0VJSCtIQ3BySmNZZXVMWkNLVThQUm1zTjdX?=
 =?utf-8?B?eVg5cEg5WVg1bktPaG04ZCtqbjkwclRpc29MWWt6SDFka2NYMHdQMkN1UW5p?=
 =?utf-8?B?VGR2V2o5bjg3ZG0zNFQxMmpjai9abUd5eWlKRnhSZThLcElwVy9RWFh4cmxB?=
 =?utf-8?B?VFNpMXJqOXRFWE5tSDdWRGFLOVRFcHE5Y1c4NWQ5d2JrY3N4Mk9lZUEwTmIz?=
 =?utf-8?B?UGtsWFhHYWE5Qi93UnB1YlBWUXprUUhGSktrVnRsUWpEajdqdUg1TUZMWEhX?=
 =?utf-8?B?ejNwWm0zQ1pUZk4xcDhYMFl6NWpnY1ZCMzFZb2pjVVVaY3dYL2dWRVFRNk8v?=
 =?utf-8?B?cDdlcFVyREZreVZSMVFjMVdPcEtpSGdLUDk1VjU2OEFBS01qRTJSQVczY3FL?=
 =?utf-8?B?UWlVZW9pUktOSWZkNUM2cWo1MHUzNVVtMTA5NENxNVlaYXhOVnpCMmoyS3NO?=
 =?utf-8?B?c29hZm5URHZhYmp3U2FLRTZ6ZnNnREluU3pWNElkVDZERTNjdlk1UEp5ZllJ?=
 =?utf-8?B?Qmd4aEl6M2JGOUJHZ21NVHFYa05ScFFPSjBsUUdlWUkxTjFTZTRHdDIrM0Js?=
 =?utf-8?B?NzhNbFZleXN6ZitIdmlhcUI2K1RZRlpIWUdPay9PazVvTXBMSmpFbUJ2b3ZM?=
 =?utf-8?B?MW9hMlhMR1hNOFhYdjgyRzhycXV6VVV3UnkrMTFCd2lEdWg0WVZHRGV0NFYv?=
 =?utf-8?B?NS9HTTQ3aHFOTk51VjB4Q3VnSWV3S0VrTVBjZGJkNkZSRUw2dytSVlgzRjA5?=
 =?utf-8?B?MkFGczVrbXdvYll6N0hxSDBKN3dyM3RueUMwdXllQWZsaFhNbmRuVnV3K0h4?=
 =?utf-8?B?Z1BydzIxNGNRSUxJRkhZUnAweWtMN1lTdEYzOEI1ZllnN24vbDZaeW5NcEFC?=
 =?utf-8?B?eWlYeEZOaHorbUhjU1NJYlJIN041c1U1aU1hSFhYU2JWL1Ryb1Bnb2VGRTRL?=
 =?utf-8?B?TmJTU2d3QVVjdVRORkoraUhWMWVvRlE0QjZoWmJ3c1N0c3h5MUJBWTA3MkVl?=
 =?utf-8?B?aXZZL0tuQ1hCMWVudnYyTUlybWJmVmdKNUt5Q2s0SjQvRi9MdW5zaHhvQ2dT?=
 =?utf-8?B?bENheW9SK3BjZTVNOUFCQURVRlowT1RLeHVuZFhXbG0xMWlzQ2VtTDNYY2Iy?=
 =?utf-8?B?RjlibGZuWkRJN3YrS200OFVmelJJNzhBbnRFSGdBU0c2R3BxV1lCeEUvQXZI?=
 =?utf-8?B?T2l0cndZcmVacUZDU3JUNVJiWWRXUFMzMWg5b3VwcUpxTm5WMWVzZHJDWFlL?=
 =?utf-8?B?MERuVDY1Yk5mTG9ROHlWTEgrOEJzVjdvSEJjdC9COVRqeFVOejJSL2pwRzhX?=
 =?utf-8?B?a1laRHdoQk16c3kxZEszN1NYcWx3bW90S3czMTJDMGNLelpTMzhudE56ZCth?=
 =?utf-8?B?VHNhZkRpaGNudElvSkRMd3pmelRObmQrUmhFa3BTb0Rxa1Q1elhMbkFScnhW?=
 =?utf-8?B?Uk82N1RvdVVpVTZEN1JaVzB6TEEyMDcrNkZRUUhKLytFNkZ3d0RkRE45cS9P?=
 =?utf-8?B?dU56WUhGdHNkRUwyVGdrK0RQNVg4SHdaeVJoWXB0RkY5YVNacGVFelc1R1hu?=
 =?utf-8?B?OXRmOE5CK3B2VGFPb3ZWNkVBeE9GWnNtWkVkdGhteXZjRzMvOVMyeWZrWER2?=
 =?utf-8?B?b1krVHl2WDJ1Wm5raVJkdkVvNklJYk1JK3AxaEhNakQxM2hRTkpDbjhSK0Ew?=
 =?utf-8?B?NHc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c1a6835-47dd-4d1a-aff5-08de0a2644a4
X-MS-Exchange-CrossTenant-AuthSource: AS4PR08MB7735.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 07:01:01.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AdKQf9P7Jzv/EGM7sI+ebJfxY81K6QpNavo7UHeC707maOEAkZABw9jY3DRZR8N9Dlki9tCxG7i6hs7u+Foi1QiQ+kPr0WIccWSSLdhLobE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8149

Hi Michael, Bryan,

Am 10.10.2025 um 15:46 schrieb Michael Riesch:
> Hi Bryan,
> 
> On 10/10/25 14:15, Bryan O'Donoghue wrote:
>> On 17/09/2025 16:38, Michael Riesch via B4 Relay wrote:
>>> Habidere,
>>>
>>> This series introduces support for the Rockchip Camera Interface (CIF),
>>> which is featured in many Rockchip SoCs in different variations.
>>> For example, the PX30 Video Input Processor (VIP) is able to receive
>>> video data via the Digital Video Port (DVP, a parallel data interface)
>>> and transfer it into system memory using a double-buffering mechanism
>>> called ping-pong mode.
>>> The RK3568 Video Capture (VICAP) unit, on the other hand, features a
>>> DVP and a MIPI CSI-2 receiver that can receive video data independently
>>> (both using the ping-pong scheme).
>>> The different variants may have additional features, such as scaling
>>> and/or cropping.
>>> Finally, the RK3588 VICAP unit constitutes an essential piece of the
>>> camera interface with one DVP, six MIPI CSI-2 receivers, scale/crop
>>> units, and a data path multiplexer (to scaler units, to ISP, ...).
>>>
>>> The v11 of the series adds a media controller centric V4L2 device driver
>>> for the Rockchip CIF with
>>>   - support for the PX30 VIP (not tested, though, due to the lack of HW)
>>>   - support for the RK3568 VICAP, including
>>>      - capturing frames from the DVP
>>>      - capturing frames from the MIPI CSI-2 receiver
>>>   - abstraction for the ping-pong scheme to allow for future extensions
>>>   - abstraction for the INTERFACE and CROP parts to allow for future
>>>     extensions
>>>   - initial support for different virtual channels (not tested, though,
>>>     due to the lack of HW)
>>> and a V4L2 subdevice driver for the Rockchip MIPI CSI-2 Receiver.
>>>
>>> The driver can be readily extended to provide support for the RK3588
>>> VICAP variant. In order to keep things simple, however, this extension
>>> shall be submitted separately.
>>>
>>> Looking forward to your comments!
>>>
>>> To: Mehdi Djait<mehdi.djait@linux.intel.com>
>>> To: Maxime Chevallier<maxime.chevallier@bootlin.com>
>>> To: Théo Lebrun<theo.lebrun@bootlin.com>
>>> To: Thomas Petazzoni<thomas.petazzoni@bootlin.com>
>>> To: Gerald Loacker<gerald.loacker@wolfvision.net>
>>> To: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>>> To: Markus Elfring<Markus.Elfring@web.de>
>>> To: Sakari Ailus<sakari.ailus@iki.fi>
>>> To: Laurent Pinchart<laurent.pinchart@ideasonboard.com>
>>> To: Mauro Carvalho Chehab<mchehab@kernel.org>
>>> To: Rob Herring<robh+dt@kernel.org>
>>> To: Krzysztof Kozlowski<krzk+dt@kernel.org>
>>> To: Conor Dooley<conor+dt@kernel.org>
>>> To: Heiko Stuebner<heiko@sntech.de>
>>> To: Kever Yang<kever.yang@rock-chips.com>
>>> To: Nicolas Dufresne<nicolas.dufresne@collabora.com>
>>> To: Sebastian Reichel<sebastian.reichel@collabora.com>
>>> To: Collabora Kernel Team<kernel@collabora.com>
>>> To: Paul Kocialkowski<paulk@sys-base.io>
>>> To: Alexander Shiyan<eagle.alexander923@gmail.com>
>>> To: Val Packett<val@packett.cool>
>>> To: Rob Herring<robh@kernel.org>
>>> To: Philipp Zabel<p.zabel@pengutronix.de>
>>> Cc:linux-media@vger.kernel.org
>>> Cc:devicetree@vger.kernel.org
>>> Cc:linux-kernel@vger.kernel.org
>>> Cc:linux-arm-kernel@lists.infradead.org
>>> Cc:linux-rockchip@lists.infradead.org
>>> Signed-off-by: Michael Riesch<michael.riesch@wolfvision.net>
>>> Signed-off-by: Michael Riesch<michael.riesch@collabora.com>
>>>
>>> Changes in v11:
>>> - rkcif: split large driver patch (6/13 of v10) into smaller
>>>    patches (6-11/17 of v11) (Bryan)
>>> - rkcsi: replaced devm_reset_control_array_get_exclusive with
>>>    devm_reset_control_get_exclusive (Philipp)
>>> - Link to v10:https://lore.kernel.org/r/20240220-rk3568-vicap-
>>> v10-0-62d8a7b209b4@collabora.com
>>
>> I believe it is the case and please feel free to correct me if I'm wrong
>> that you've dropped a long list of sob/co-develop-by, I think we
>> discussed that too, because of the level of change, it seems reasonable
>> too.
> 
> Correct. The tag list used to be quite complicated [0] due to the
> complicated history of this driver. Maxime worked on the driver up to
> v5, Mehdi up to v14, I added RK3568 support on top of Mehdi's v14 (with
> some valuable contributions from Gerald) and submitted that as v1. v2 of
> my work incorporated Mehdi's v14, and here we are, after several rounds
> of feedback, at soon-to-be v12 (or, in fact, v25).
> 
>> On question on that, are these people aware of the change and cc'd on
>> the list of recipients/contactable/agreeable to the change ?
> 
> I announced this plan as a response to your comment to v10 [1] with
> Maxime, Mehdi and Gerald on Cc: and did not hear any objections.
> 
> Hope that this is still OK for everybody!
> 

I agree with that!

Regards,
Gerald

> Best regards,
> Michael
> 
> [0]
> https://lore.kernel.org/linux-media/20240220-rk3568-vicap-v10-6-62d8a7b209b4@collabora.com/
> [1]
> https://lore.kernel.org/linux-media/23ccc744-745d-4a31-a79c-2d64bf1ed43d@collabora.com/
> 


