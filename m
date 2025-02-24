Return-Path: <linux-media+bounces-26794-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A191A41ABC
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 11:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DA24F1889EEF
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:22:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0392B24CED2;
	Mon, 24 Feb 2025 10:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="HpMf6Ewh"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2090.outbound.protection.outlook.com [40.107.20.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326FE207A20;
	Mon, 24 Feb 2025 10:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740392508; cv=fail; b=BgLfJUWdYPmXiR+ikNEgjXF9hbuAkFpw3JrN+fa4D4cuK1MdvD5SnA88LLHHfQws0SrEP1xPueqtAcKjEOXOYUl4e3pnfWG2/hCOsVUxbJNp44m+Mxk8QYdqAqpNhpLIOgi7oGXbefQ0jEWbHUvG4/giG2geyMagC5mCIxRoaWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740392508; c=relaxed/simple;
	bh=rU2sZV/8zR+8UnM+l0vQ1j6hvCDFuYHJLhooRpNsHHo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hdHPlML+Nf0+IdzUrjudcNlPQaZd6FJw1VNqcgTtKiWTEAI1JU9WpPxyCtL8sP5b13dtzoJGyKKrkM1Z+yAYbWbfsAcIV3vYm8oiJSwSaiUdZGe1qTHj3U2607xZPdQnzpXnHJCsDs6yWg2PZfj0UrU39oX9Nl/D6010SP7R9jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=HpMf6Ewh; arc=fail smtp.client-ip=40.107.20.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndzqCKm98JwXsafTz96b/bAkrURh8p8ThKVSUel/+Y8zg9/3dTedvlUekIpvBEdsmcW8fo4h2j4YefI5uqgrIrYxjU9Nq9cbm1xzT4NAIbCvf+Vld1G/Oke+gUPZrvTQUsYdlW78Qp34mrdv2/MywfSdwtW0oHJDmGT63UrMrsXuguC3B3yraAIdnoJRHPapjNbvvwcuWAaYc/OTATntDr4+QnbMlzpaPUdgfaY0nyFP4ca0EobBCr6hIN5vuofSDBqSeToaWCuE701MhZP6P1eoky0UzmAP9QZaLedApDt9pzW+w/b9pVxcC2+r8JGqsQu/9gn4l8/pRza2inUVLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87Tx/ugPTlFWCzWBSrRXM/HmzoUeuXExYUVuxeSQ6+Y=;
 b=yMWtgtP8hxlXT9tVX1KZ6PO+BY8Rwd0fdMURaAZ0Ae8yEpOwVi+ZKqtOzktr0sTmFIbrZenWas4/pZPbrK+frpH6dJbrfld6NeCuHgleQw9JKm//rkst1+7aPPAepdVKfxah3jS8pQGKUgE7GfcP48mQiEiCGpHqotWXZG2pY1eEhoyr7Fh+s3sZnhf6r/SAMxnzEl2dTnLnveoz9KWXI/wmZKA40f57TmTFTR4nJBuS6ac11GoBcCUgD2+wh40bwZqtrJSgcABqWs6b4Fkk3VvVzt+5Yp9ybzZt5qFPFqc5cqseJDnnV/e4ff6n/sg7PiEGuF0vGUObfzb68oyl6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87Tx/ugPTlFWCzWBSrRXM/HmzoUeuXExYUVuxeSQ6+Y=;
 b=HpMf6EwhKf1RaDObj0YqNQz1cu0KuDK7PF3qoXfKJewRhkgUZrs258/blWALC7m6fCK0zE3rl7pvuO0eJBRBAWctd0z3Ijs1qrLASMHZaaRwSiJuvpa5wlLzHqgiq/omHkWIxdbaNCkQG8KJ6RTXIb6PZ0seu3YiGiHq/v/Sq3w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by GV1PR08MB8741.eurprd08.prod.outlook.com (2603:10a6:150:85::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Mon, 24 Feb
 2025 10:21:41 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 10:21:41 +0000
Message-ID: <0b19c544-f773-435e-9829-aaaa1c6daf7a@wolfvision.net>
Date: Mon, 24 Feb 2025 11:21:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/11] media: dt-bindings: media: add bindings for
 rockchip rk3568 vicap
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mehdi Djait <mehdi.djait@linux.intel.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Kever Yang <kever.yang@rock-chips.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Paul Kocialkowski <paulk@sys-base.io>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
 <20250219-v6-8-topic-rk3568-vicap-v4-3-e906600ae3b0@wolfvision.net>
 <Z7iJV1rOaqMmcjY7@kekkonen.localdomain>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
Organization: WolfVision GmbH
In-Reply-To: <Z7iJV1rOaqMmcjY7@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0175.eurprd09.prod.outlook.com
 (2603:10a6:800:120::29) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|GV1PR08MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: a3531915-076c-4e21-138f-08dd54bd07d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXpKNUtFdG1wcFhsWTF6RlF5ckVoYjRmaHo0VEp3ZWx0WFYzZ2QrZnBhQXVT?=
 =?utf-8?B?K3dwSllBMTl4Z2xBR3E1R2lyZmI1bi90RXh3MGRqUlpQVzhJdnlIWmhiRFZ2?=
 =?utf-8?B?Q2Y3MlJnMnNBWVpTVmtleDlDZWNlU1I4V0RFRWlKRzlKZjczZkE0K1RDbHlm?=
 =?utf-8?B?ZXBSNFFqcTlXdTEzQ3NObEJMa3hUZmZPUUk3cWwxa0FpbkN0dklRSVZhUkZl?=
 =?utf-8?B?WTM2eVRoc3lhY3B1dExpNnJGSVlxcS92V2paSUtYVFRORUQzd0V6RFFtN3Jy?=
 =?utf-8?B?TXVOM1RtWWROa0NKNkFjbWV1SU9Kc0V6ZWFyekdtWFdub0s1cWE1K2pNYXRl?=
 =?utf-8?B?dXptTWk3bkRsYjhNUkEvZ0NVU0Zzbit4UmozMGZhU0ZEcWtjY3VpRjBpSGVY?=
 =?utf-8?B?VkN0TTUxSEtOUDNBeURSVXZNeUNkVHRhb3JwUlpVdzZoVTRzMEM4bkJWeHpG?=
 =?utf-8?B?SlRTcmNqbTlPN1JFdlZwWVdneGttRkpGYmp6Mnc5ZUFSV1lhZ0gvT3cyZnBo?=
 =?utf-8?B?YjZrV1dyZjNPQ0QyL3lZSk5HZS9ZV0FLSWdJT0d6MFFBN3FhaHh1R3BmOHE2?=
 =?utf-8?B?RDBsRnNoU00xYS9QaFM0WWdHTnBMTittamlpSnFVTG1aUlN6azluY2U3V0t2?=
 =?utf-8?B?cjUvbzF6NWZwV2tqT1FiVVRVckZFTUEweVd0bHVUK0lCcytOSDkrMVdJY253?=
 =?utf-8?B?OU1hcTJ3WEtFMmp0Nmw1OUhwQmZSc2FJaFV3NFRPMXgxdTNhK1pGeG5DS0M2?=
 =?utf-8?B?a0V3Q0IrZitIWHJPNHROQVh3R2R4SmNkUG1IUm4zMnVjVlNiSWI5NXJvekl3?=
 =?utf-8?B?c2xlMW9PeEtWMUtPdW5qZW5MQlo5OXpNYk4xWXBZbkhINWpaT0hoYTlUdVBI?=
 =?utf-8?B?MzIxNURPMEJEMWhjMWxUUmkzd3FPVStTOGpmNXl3Y0krOHZmSjZieldPUzB6?=
 =?utf-8?B?RXp5b0tpUFR3dUJ3a3pyaEpUdHRma2pCVXpXc3VYNERibTZaOWtSZlhpYmlx?=
 =?utf-8?B?K0JUWmhtaVk5YmYvelV1T05OOFp2aW5FUCtUY0ZVdHRXTzQ5dEsycWtyWUl0?=
 =?utf-8?B?VFNSaWZtdjM1eE51cFJ3ZmlvNE1RMnZmbDBNbEd2YmhEODBKNUFwbE5XVXcv?=
 =?utf-8?B?OG1WOThUbEc2WE56UzdyMUk3a3VmY1FVeThWc3E0eHVKQU8vdklZYmIxZGZG?=
 =?utf-8?B?ZWNrY1c2TCtOaDVrWHJUbkwzcnlWajdvSTNmZ05zL3NHUU5QZUl4NWNlRytt?=
 =?utf-8?B?cUdRNWNmbmFZV2VGb0VVaWdXLzF5Z2s5d1NTVnFkT0ZsMW9sWkFzWXozd2Jj?=
 =?utf-8?B?UVVGVndIY01iZW1NZGNzd3cvTS81TU5wUWFobU95UWNTZjQ5NkZNN1V1ZHN4?=
 =?utf-8?B?RXBnSGljeXdhSGl4QTA1Y1VIdldLZXhEMlVWVHVEQUNaaGJHU2s5NDdMQTAx?=
 =?utf-8?B?SjZ6TXZZemoyWTR3ajQyaUdGMjdkRkdlYXFUMVJXNGdpNm5RbmZpVTliK04r?=
 =?utf-8?B?T2RSRndTV1QveGZGaUVWVFBCZWNmaWw3R2JMeXFuNlZndTdIeGhQZHl5ZGRi?=
 =?utf-8?B?U1dJVFc2QUdLa1pQQS9BR3lWcEROQmJKTjhOUXpzamVadFlNOFB4bVV4WVE2?=
 =?utf-8?B?TWg1NGx2c0c4cVUrRDVyQlFmN24rTWNoRnNNR0l6SHQ1VmRQSDY4cjFta1da?=
 =?utf-8?B?YzJUNlZKY0oxR295MmhxM1llMUhOQm5Id3JoVXhnU0RqSkY5dmNYNWVEdDV0?=
 =?utf-8?B?WUlhMXlNT2lrcGFoVkVHVm5qK0Z1MTF3ZG11SzNsek9mZWFlalVzcjRCVzRo?=
 =?utf-8?B?Z05mQjV2a3l2QmtxYVJydz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bXFiMkg4dUk5L3BPYW1MQWtOR2dvQ0I4R3N6S01JbEJVckpsRGhBU2pGNDUv?=
 =?utf-8?B?WXRPalg1TGoxUGZuMTBGQmFrQUcyMmdoK2JVQmFHaDVJVUkxZlJRRzBtWXpI?=
 =?utf-8?B?LzNWbEJRQ1FOU3FzaSs0eUNFQnRkZWo5MC9OR2dPMm9aUEhzTmhVYXBzRktk?=
 =?utf-8?B?cUg0SnlPUGRJZzkwV2tYeDh3cVhBSkF1bGFmSDJ0SDNKc1Z1a3ZUQ3VrdGJi?=
 =?utf-8?B?c09QeDlVTTgxMnkvS1FROXJJeEozeTRoaXRyZ2hlQTdzV2VxbWJiNmVXS0lh?=
 =?utf-8?B?enlNVlEyanhTQjd4bGpBbkZsTFF1Rk8xVXYyQjhsWlozTzdyNFFVZE9sN0Jo?=
 =?utf-8?B?YVhCdDB5cGN5aVcwZnd1UnF5Nm5Pd0lRbFdIYUIxL2hWOW5UeHR6QTMvSW1t?=
 =?utf-8?B?NWZoYURqcWkzcGVvSDFVL09nc09Xc2FVZmdGT0RQdnptUy9lUE8rNXJKc0Vu?=
 =?utf-8?B?ZTlab1NlcW5LdVNzUVhWbkxGbWZ6TXBPWk1ROENjTzdwZVdQek9NbHBpdFkv?=
 =?utf-8?B?T2k1czRnSWVIZGZkN09oYkU5ZjlqUUlvU2s1VXgzMk5mcFF5VHFlREgxS0ZU?=
 =?utf-8?B?cHh1UUx1OUx3VSswY0NwaXVmOUtaaHNGcnZydEhFRzFCaDFtamxxaWZrTkRp?=
 =?utf-8?B?UEVORTdLSzhqK1A4VDBFZldiR2szczg3VHJFeWY0SzhaL0duN3BHTEp1K2lR?=
 =?utf-8?B?cWxVbGNZYS9vQmZlSDdOajA5bTRzNVc4NDhDZWs5SHNFQUtrdlhla2lEKzFZ?=
 =?utf-8?B?bm9HSHZKQjdITzhIUmkyQTBoT2lVajBBbHorcWVBTEUxdDJNcWRibm5kTFYw?=
 =?utf-8?B?TnFKMFpibTBoVDRWY1lDR0JUMFBzM0JXWGRhaXJIcjBub1k0MW1PSUdpanpj?=
 =?utf-8?B?KysxTGxtWjJ0WFZEUm4rZ1FQdzVGdGVrZmpvRUNmR3NBUmZ4SFlRdWlQeWhQ?=
 =?utf-8?B?OVVvcm05cXdmUXEwTVk1aFpyQi9xd21MU3RjTHN5eFAwZ21rT0docmx4S2lp?=
 =?utf-8?B?R2FRa0p1eEpZZnNKRnhKNTgyWjJwWXMrdmYwU3RDa1hOZDkzNlhnUW9uUkNZ?=
 =?utf-8?B?eGV2NVAwcGVuKzh5eFdzSC9VUmJSV3U5dWxmczlUZ3NXV3NtcGNFM3k1TUty?=
 =?utf-8?B?M3p5VzRxZlVvM1NrdFFUWm1CbUlhNXlMQXZrLy9xaGFZcFZYd2tySkg2ZEYr?=
 =?utf-8?B?WTk5UGFMcDZTdUI5TW1GcUJoRzIyNjZTblV1Y2tSN3Fqb1dpbE1naGVQUjlk?=
 =?utf-8?B?cXVVRkRONEpQSCtEczExd2N1TWRhY0hNektSV21aRHphWVJwTEpDeENJSlRv?=
 =?utf-8?B?N2VDUE1DYUxBL2s2a2VaTEZPUENnazR2SzRTTlRGVmhUQWFhTWc2YTZ3cGhu?=
 =?utf-8?B?UnRsSDl6a3VOR3FxV0RLUktjRFZHMEY2L1VwTnAwVjhnQzhnV2lMT1VRRkRJ?=
 =?utf-8?B?WGkrRHVoc01jaW5zSWNjYktickdGK0ROenFYNlVSc3dJZWNHREtHc1p3Wksw?=
 =?utf-8?B?T2UwVE1nQ3ZzQWdGOHNpOTdCWGNqQVFTSHU3b2svZ0hLSUJtVURKVTQ0RTV1?=
 =?utf-8?B?YU1TUFVtVG11MDdUd3VJUlNoaVNkTWxIZjBMcFRZU0NCWWlvMDBvanhsRGpv?=
 =?utf-8?B?M29YNEhabkE5QUt2ZzVNVFFCSmpNNGZPS0VSWUJncUc4TFhvb09xQXVYbGw5?=
 =?utf-8?B?dGF4WHZOZjJta3dxclRLUUZ3SmVoYVVwNGIxY3FDeCtBT0VmOFI3MmE3Y0lt?=
 =?utf-8?B?ZXVpWjMyTGVacThjekxHdGFaam1pVWRqMzBIb2g5WVczQ3pJeE8yMU95YzVs?=
 =?utf-8?B?akUzd2ZPdytnZU1FYWdGVEtsUFhDTlN6V1QzdE15dWtzTmF5LzRaTDBxOStv?=
 =?utf-8?B?MStUQ0k4a0tEUUhJanZtenBQZXBJUlpQYkxwWEl6VXpLWS9DLzBxZ2p3czgr?=
 =?utf-8?B?Tzd2YW5PbE91YzdsSm5EeFhDU2t2WlBIY0FmcUxrOVhtb1VrVVJnV2luT0la?=
 =?utf-8?B?c00yVkIyQ1Z6TS84NWlVdDdqUzNWMFJwUm9EZUlnRDFTbU1DNjk3UmgrOGFH?=
 =?utf-8?B?ZXcvczQ0dFlMUzdlaU4rQ0h1VGlMbENBbS9QL1NrSyttUFoveCswa1BoNEdJ?=
 =?utf-8?B?eDRCRWZyNnhSVmRiWmZHaVpVTlg4SXpZeXJYZjBNaEpFb3d3ck56TXljTy96?=
 =?utf-8?B?akE9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a3531915-076c-4e21-138f-08dd54bd07d4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 10:21:41.5215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIbDcUWTZy1hu7Fsz/1ArflSzp6bWWUp8DcKJdxvIeAqFNNu8hMLZqwn6nAK9HUvA2JENF0QyXIjh14RC3KxsOSVlrwHs1ChzbdJQuHlwHU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8741

Hi Sakari,

Thanks for the review.

On 2/21/25 15:10, Sakari Ailus wrote:
> Hi Michael,
> 
> Thanks for the update.
> 
> On Wed, Feb 19, 2025 at 11:16:34AM +0100, Michael Riesch wrote:
>> Add documentation for the Rockchip RK3568 Video Capture (VICAP) unit.
>>
>> Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
>> ---
>>  .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++++++++++++++++++
>>  MAINTAINERS                                        |   1 +
>>  2 files changed, 169 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
>> new file mode 100644
>> index 000000000000..3dc15efeb32e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
>> @@ -0,0 +1,168 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/media/rockchip,rk3568-vicap.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Rockchip RK3568 Video Capture (VICAP)
>> +
>> +maintainers:
>> +  - Michael Riesch <michael.riesch@wolfvision.net>
>> +
>> +description:
>> +  The Rockchip RK3568 Video Capture (VICAP) block features a digital video
>> +  port (DVP, a parallel video interface) and a MIPI CSI-2 port. It receives
>> +  the data from camera sensors, video decoders, or other companion ICs and
>> +  transfers it into system main memory by AXI bus.
>> +
>> +properties:
>> +  compatible:
>> +    const: rockchip,rk3568-vicap
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: ACLK
>> +      - description: HCLK
>> +      - description: DCLK
>> +      - description: ICLK
>> +
>> +  clock-names:
>> +    items:
>> +      - const: aclk
>> +      - const: hclk
>> +      - const: dclk
>> +      - const: iclk
>> +
>> +  rockchip,cif-clk-delaynum:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 127
>> +    description:
>> +      Delay the DVP path clock input to align the sampling phase, only valid
>> +      in dual edge sampling mode.
> 
> I suppose there's further documentation on this somewhere else? A reference
> would be nice.

I like your optimism :-) No, I am afraid this single sentence is all the
the RK3568 TRM has to say about it. I can add a reference to the TRM
page, but everyone who actually follows this reference will be
disappointed...

>> +
>> +  iommus:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    items:
>> +      - description: ARST
>> +      - description: HRST
>> +      - description: DRST
>> +      - description: PRST
>> +      - description: IRST
>> +
>> +  reset-names:
>> +    items:
>> +      - const: arst
>> +      - const: hrst
>> +      - const: drst
>> +      - const: prst
>> +      - const: irst
>> +
>> +  rockchip,grf:
>> +    $ref: /schemas/types.yaml#/definitions/phandle
>> +    description:
>> +      Phandle to general register file used for video input block control.
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@0:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description:
>> +          The digital video port (DVP, a parallel video interface).
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
>> +
>> +            properties:
>> +              bus-type:
>> +                enum: [5, 6]
>> +
>> +            required:
>> +              - bus-type
>> +
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>> +        unevaluatedProperties: false
>> +        description: The MIPI CSI-2 port.
>> +
>> +        properties:
>> +          endpoint:
>> +            $ref: video-interfaces.yaml#
>> +            unevaluatedProperties: false
> 
> Don't you need things like data-lanes here? Or is this a single lane
> receiver?

This may be a bit confusing, and I probably should extend the
description a bit. This port/endpoint faces the MIPI CSI Host, which has
its own driver provided in patch 6. The connection in between is a link
with some internal format. Hence, no properties required.

This is the same issue as the one discussed in the other thread, since
the other end of this connection is discussed there. I'll fix the issue
on both ends using Rob's suggestion.

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +  - ports
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/rk3568-cru.h>
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    #include <dt-bindings/power/rk3568-power.h>
>> +    #include <dt-bindings/media/video-interfaces.h>
>> +
>> +    parent {
>> +        #address-cells = <2>;
>> +        #size-cells = <2>;
>> +
>> +        vicap: video-capture@fdfe0000 {
>> +            compatible = "rockchip,rk3568-vicap";
>> +            reg = <0x0 0xfdfe0000 0x0 0x200>;
>> +            interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>> +            assigned-clocks = <&cru DCLK_VICAP>;
>> +            assigned-clock-rates = <300000000>;
>> +            clocks = <&cru ACLK_VICAP>, <&cru HCLK_VICAP>,
>> +                     <&cru DCLK_VICAP>, <&cru ICLK_VICAP_G>;
>> +            clock-names = "aclk", "hclk", "dclk", "iclk";
>> +            iommus = <&vicap_mmu>;
>> +            power-domains = <&power RK3568_PD_VI>;
>> +            resets = <&cru SRST_A_VICAP>, <&cru SRST_H_VICAP>,
>> +                     <&cru SRST_D_VICAP>, <&cru SRST_P_VICAP>,
>> +                     <&cru SRST_I_VICAP>;
>> +            reset-names = "arst", "hrst", "drst", "prst", "irst";
>> +            rockchip,grf = <&grf>;
>> +
>> +            ports {
>> +                #address-cells = <1>;
>> +                #size-cells = <0>;
>> +
>> +                vicap_dvp: port@0 {
>> +                    reg = <0>;
>> +
>> +                    vicap_dvp_input: endpoint {
>> +                        bus-type = <MEDIA_BUS_TYPE_BT656>;
>> +                        bus-width = <16>;
>> +                        pclk-sample = <MEDIA_PCLK_SAMPLE_DUAL_EDGE>;
>> +                        remote-endpoint = <&it6801_output>;
>> +                    };
>> +                };
>> +
>> +                vicap_mipi: port@1 {
>> +                    reg = <1>;
> 
> Where is the endpoint?

I'll add the endpoint in the example.

Regards,
Michael

> 
>> +                };
>> +            };
>> +        };
>> +    };
>> +...
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bbfaf35d50c6..cd8fa1afe5eb 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20407,6 +20407,7 @@ M:	Michael Riesch <michael.riesch@wolfvision.net>
>>  L:	linux-media@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/media/rockchip,px30-vip.yaml
>> +F:	Documentation/devicetree/bindings/media/rockchip,rk3568-vicap.yaml
>>  
>>  ROCKCHIP CRYPTO DRIVERS
>>  M:	Corentin Labbe <clabbe@baylibre.com>
>>
> 


