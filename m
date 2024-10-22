Return-Path: <linux-media+bounces-20025-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBFB9A9B52
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 09:41:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D7D71C206A2
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 07:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D490015382E;
	Tue, 22 Oct 2024 07:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J0NNUdij"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2061.outbound.protection.outlook.com [40.107.103.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDDA13E8AE;
	Tue, 22 Oct 2024 07:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729582907; cv=fail; b=gvCGIICC+8nkkGZjFjnCg0VF/AUu+iMm933wy8CaPB45EWFEWUbVvjI/EAw2vd8Xi6D2JY5JF44hhMIw56mdE8FHA2XgdO65G2iNEZ11Hr21GGDXlNLNkf+37w7NP34/dicBCBoKcP7x0u6mo3R5L+gC3xrKq+jMi3DN2DKmSok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729582907; c=relaxed/simple;
	bh=F+xZgo6sTomk12jQtrtuYwVvjHUbtWQEKNIgNVZcYrU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ceAjlE9OvG5JJSIj/xYrUp+jnUhxCS6zIFUg4hhoLmiaJ8Py0rl/k4r+6GcKI2i7Kk7v83p9eHC7pqJ/oN2C0g/Bvp7i4KZBDYmDUVEUu/ITOs3eQuRfnUVKqHkVaF8Z5pgv70xliYcUya8DV+DaUt0ksNvMU2TEqCaOfzHjXoY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J0NNUdij; arc=fail smtp.client-ip=40.107.103.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qt3gw3ZZ7U8Al4DFNoXZiFE9j10Y7Iam2Xm4NPGG2n9/cB2pXBGDA8y8qHkmb65c/khpMHy6OkLazflboX5UJQlWs376ysf93STqB50Py/EDKLzYoy6C7TPMK8adn0N+61gTOrtwNB2tY/BakHvuBdZ0YdfNC+jGExLnzixJxjQEFb9JRrNjGmSusIISvUC/axXTalisovw7VuNX7xxTXzplbYBVifriRDJOdNurDIXMtmVI9UN+0K1l/1h+bSVCkEXrbLr8UWYby7XvrHDJJJYcY0Mymq8lzoaCNvNhWxIKMuWa6mZPhNEV/LCMOwi7PFSi71jJidm8p9zKwXLYAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oe1pjV1Z0SRgdvTdVs8Y7Kv9fCm3/dOc0yS0cBrou18=;
 b=WL6aNkUko2KfXuPzr/z6PLbk4WqxcetB5139Qo0Ivu+0f2JTuhwYwkWgp4GfkUU8VpNs1XDOUr5hPdalIsGpHcCO/DR1OYbJsz9f9eBiPESYYZf3b+pgSyI7KNoAE16EJYntQyWZEqYUxMDh3KObYrwn9WAqEO75kLmYmxIWV3i8zTVdhIy5rLqeXtNN4w9MSWlaJNVCF6g80fV5ylexhiIkIZJmRhMwQe2s4v3bEYoGZvHSMFdas/OqvyjVJxy4/dLHbWasERAUV4jDC0eeoAKp7G42E8CuO4EAjCD0yHukgg1ZXgTrKC3tHhs4Jdg2LiH71Qzczl7pmRL/VuQxuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oe1pjV1Z0SRgdvTdVs8Y7Kv9fCm3/dOc0yS0cBrou18=;
 b=J0NNUdijzPku18cYHAiTYNoSk5qgRB6/aJOXcE6y2lcUS6yqNFzkxaQ/FxSSKJse7JXjyDq5a36teGOX8WEFsj1VHLmvb9WcXqHH+vNxQIwpTVaxsmj2dP5Q4BScPJ/zK1rHrYJEr1AzW4c3YBiYy3Bv8fsYBQ1iclqyBon2FRnD4Dv9s94+0up0OOcjlMjUQubig5pDj5unGiMZg3H1u5sGYdVzOBZIiY0QdH5qmH9mSi3+0ImqQkA+P3n9pXtcZkChjx4vqa4u4OLgJTVQScxEWHk60DE7DgrKK0RyLyJjfu0RBRsBF9xX6TjEdNtarYpd0q1SMTwTBIHvxU3P/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9071.eurprd04.prod.outlook.com (2603:10a6:150:22::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.20; Tue, 22 Oct
 2024 07:41:41 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 07:41:41 +0000
Message-ID: <74ead950-5ab9-4a2b-8520-5af7a4931f45@nxp.com>
Date: Tue, 22 Oct 2024 15:42:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] dt-bindings: display:
 panel-simple-lvds-dual-ports: Reference lvds-dual-ports.yaml
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com,
 mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com,
 will@kernel.org, sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 tomi.valkeinen@ideasonboard.com, quic_bjorande@quicinc.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org, arnd@arndb.de,
 nfraprado@collabora.com, thierry.reding@gmail.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, marex@denx.de,
 biju.das.jz@bp.renesas.com
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-10-victor.liu@nxp.com>
 <20241021194020.GA1011261-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241021194020.GA1011261-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR0401CA0034.apcprd04.prod.outlook.com
 (2603:1096:820:e::21) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9071:EE_
X-MS-Office365-Filtering-Correlation-Id: 34af82c4-a5d0-4910-066b-08dcf26cf7e8
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SDVDR0IxZUhOa2FHSXR0Zm9GL3NMOEZnMVJtUjhZTGRNQk1ERXV0RkxqR0Nn?=
 =?utf-8?B?QWxFd1hiNi9HMnJnaXhkaDluN3I0SUV2ZGZZQ090RURTMWkxbXJLRE1lb3lT?=
 =?utf-8?B?SnVveWJwQUpWbDZmenNWS056RmtuNld4S0doOEZ5RDZxTE05dy81L05Tcldh?=
 =?utf-8?B?RGpKQjdWbGZldStYMmxUT052ZHpLaW1wTnQxZThIVDRsQUtjT0JCa3ZuSEl4?=
 =?utf-8?B?WlFLQlBhS3dtZHRLRVJvMnVwNlU0NDRiZ3BxNkl6bzIzam40QnE4VDhtdjA0?=
 =?utf-8?B?RnJxNkFOOWpLM2JCMW1lVGdaVlpER1dwVDBnQ05pYk5XTklGQ1ZWZWJzWXdB?=
 =?utf-8?B?cTRpbXFPdkFGcU5scXZsUWRxWjl2cWdrejlvWW5vQVk5UmlPd2JZMW8xLzYw?=
 =?utf-8?B?Zmt1V0haWm02NitSRDNXVXZ6TmhZZklhSzY4TnpYQktkcGhScjMxazRhWEds?=
 =?utf-8?B?d3BydEFsTkZmUmRyYWZjUnRvekdEcTR4TkkrN3JhOS9vRnZGaCtSelZSaGs5?=
 =?utf-8?B?ZjczWUFBOEhjc3lMelR1M3hYMHNrcHA0ei93UTVxSnZ5SDZSZ1N4cWlUYitv?=
 =?utf-8?B?K21oc3YrTnY1V2c2Q2R3SU1IbUNlclNBNW9xOWd5a2tYeEl1Z1QzMnlJbld5?=
 =?utf-8?B?UFRweHRvbkJ1MWZ1cVI4TlRnekVXMVByc0QvdjljZGFRL2ZqaktCdHNTZGhI?=
 =?utf-8?B?THJtcWVnbjhzUGpiaEtyWDZsRHQvUFZrQTJ1a2l2SEljWnVKOXU2YXV6ellz?=
 =?utf-8?B?WFdFT25WdVVIK1ZKUFZMaHh2M0xJRW0yeWVqRWIvUHN1Z0Z1Ly85VFpNQkpS?=
 =?utf-8?B?WkZieVBUNTZPVEY2b24zdFMrby9ienFxSG1OVmJ5bGRjcEdBM2ZRdWZVcXlY?=
 =?utf-8?B?UzUwL0hNRTRQUGg5L3o0a3ZOUUtSbmlXQlNRcXY3dWJMcG4zQlorT1hrVGdD?=
 =?utf-8?B?OTdUbzJQWEU1QmxnTFpkSWM0b2F5dFJueEdLZERqVkxyU01GMjJQc1h3cEdZ?=
 =?utf-8?B?TFZwNGEweGgwcTVEbEQ5Zms0enlxOTFJQ2djWll0Yi82RWoxRzBVcjBWT1FD?=
 =?utf-8?B?a3FFSFhXNTlMamY1RkdXQTMxVjJRMXVLK29iN05PM0VLVXRDc2p0dVc5cXFx?=
 =?utf-8?B?SlJ4czE2U09zSjhUUlBWT2NMNXAzNXdFb1k2TkoxVFdPQm5MTlgyOCtlZnN1?=
 =?utf-8?B?NDgvNXMyRzBZejRnK2c4TXVkZFNVMlBVckZoMWp3cEdhOXFvRWZ6Rld2ZHhJ?=
 =?utf-8?B?cXloL0RQNkRaQTBvSXRyZWR6N0xBSU1yWGJJTmYxSEwvRGVidVJyc1ZqK3BD?=
 =?utf-8?B?UFlzK3hRdkJYbTg5SUxFY3E0Uzh4Kzg0d3NHcVI0R0RiYjJ5VGlDckU1SWxX?=
 =?utf-8?B?M2ZWcGxhT2NhaDhjUEdFQWVMWERhc3ZRQTJFejR5b3U2RVZXL0xDU2J3SFJW?=
 =?utf-8?B?KzY3SHdZYmlrQXpxZjBoNGJud1ZIK1hsWTJLUmRNVFR2MHRuakp4QTJlVnlG?=
 =?utf-8?B?bGl1U2JYamM3WXpsdm1oWm5CcTg4WGsvVlpvZE01U0IwTzk5eHREYTd1N095?=
 =?utf-8?B?Q2Q4TnpRNHVVdmlOZXdzV1p4anVISnJZbVJYblErK014alIzN2lrM1V3OXZO?=
 =?utf-8?B?NGtnQVlyWERvSGZVcnBMV1plcGp1b0dRNkxtR0J0bXVqMTJnR1I1UTRXS2Vp?=
 =?utf-8?B?VWNlR3hNWE00KzlWdnduTithQStDaW1OVlBQQ3pHeWhJcXZrRzBsN1lHTjhL?=
 =?utf-8?Q?NmlNUM9m86EY0JwLIDSmh/LA0lZpherhDfLIPtG?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Q0ZTMWZKdlJnRDZPOWQ4blpJNDhLT1pxMUE0RlJKRzBZZFhUOWFCWHZwY0Jv?=
 =?utf-8?B?S0s0OEtsNlZkcTA4b2dOQTNlMGthWGJyZjlKamRObmhVcmo0VnNndC8yWVl4?=
 =?utf-8?B?OWZIOU9oYlNJT01oSEdUVjRLdEZyVG9UdVZqVVMvRE9Pdkw1WW9PZEZBbzk1?=
 =?utf-8?B?dTFMWk5kOU5VcUVoUUZwamx4MTdVNWVtcEhIRG04WHQvUUJlZTNYQjEzLy9x?=
 =?utf-8?B?cFNkNGhuangxWUVFc0s2TVlya1FMYUptdmxKSktQbEEzbU5yVlhSZkdkSi9H?=
 =?utf-8?B?ajdwNFpScVU4Z2R5ZzRjM011a3RwMURlU1hKcEZMNTQ2Q0lrTzg2cWFKSXQ4?=
 =?utf-8?B?cTF3R2xKMTFtbDkvRTFZOWRmOXo5Y2w3YWlBVFp3SGYrZEVST2pRL3M0YVFZ?=
 =?utf-8?B?QXB2UDl5WURxeHRLbW1Mc01yTDlDMHQxNStIOTdid0hzSFkzVUdKT3Q2NGxr?=
 =?utf-8?B?WHhwRktwOW8zM1poS1VGVGg2aXFtTXUrbVVJZU52VCtxYjJQVmwxQnhSQlZv?=
 =?utf-8?B?eC84aXRWNXhtSDhYMlZkSWZqaXQ1SE5NQmFuUVRWYW5sQldqTUNJTGhka1gv?=
 =?utf-8?B?S2M2bVZMQVFSZlpLRjh6dmZFYUxQL1RhYjhteWU1c1RQcEFoSGwyU2dVcjJ3?=
 =?utf-8?B?V2dtVmM5a01XT2thL1QvS2psSE5OOFpvaFlnMEsvVXVqMW03ZS81UlJyS3hH?=
 =?utf-8?B?SkFyRUVxSnB4K000WldBeE4xUkR2cTV2Qk5GWnZEQXBKM2ppUGNWNTA3eTQz?=
 =?utf-8?B?TlZEcFRBNkhpRzV5ODhXZys3WjYvVlJIVTdXODhSOUVDNzBMTUZDVU83OFk5?=
 =?utf-8?B?aEdxU2F3aVNnREdxNzROekVuRk4wdlVSSXZLQW9ZZVdsQ0FwTEI3WDdKTVpV?=
 =?utf-8?B?cDYxYWlNek9KUjgwendUNGgrdmF0cFd2RGtLaVMrK3c4ZU94UzZXaU9TU3dj?=
 =?utf-8?B?TkNJZm1xTG1KaDlXcjJoaHR5cWM5bTEwaGxDc2dscGhEbWVTeXlvbzcveElX?=
 =?utf-8?B?T2lkOXRMd2FNdXNUcVB3QlFEd2RDSmgxT1JsTDgyQksxMHpramhVMkJyVHVO?=
 =?utf-8?B?Vll6TThXM3dMUU1nMUdjUXhTZkZwVDBwd3dqNjZsZW9tQU05ZVNIcjA4RGpq?=
 =?utf-8?B?ME9aVFp0VGtpS3NXYkMzMXYxZE9PT3Nua3N1SXlRUWZIOFJVMit3WUdBbEtn?=
 =?utf-8?B?QmtFcXVzTzJyd3VXcFJ0ejZaOU9tVEREMFYwS2QrbDFDYlUyS1BqV3VpMXBj?=
 =?utf-8?B?YTlFZU5ReWU1d3VaS0tFV1dnZjRBZnhTd04zZnIzbitmSGg5dFdnZDk2S1cz?=
 =?utf-8?B?YUlPM0U3eVQvZzMyT0w2SVdidiszWFYwYk5vNjF0TC9TOEpoU2p5Vk83WEdo?=
 =?utf-8?B?NlhQVHAreFNtQ0Q0bVJ0aXhQNlNjanlBc1ArZ1hBVzlmeER1dVM2dkRlSGh2?=
 =?utf-8?B?STI2WHZKaGlkOHZiVTUxTW0veDJRR0lNZXZYTkk3SDFIQnAwTEVXZE4zbm9q?=
 =?utf-8?B?TThhNWNWRGx1alpWRThkL3RHaDhYL1RKam1FZU5MNjg1MTUycW9SNlhrR3ZT?=
 =?utf-8?B?Q0Q2U2E4QmJOd1lrNzFRWStBcnQwZThzSmVIWmdLb1pWUVZkSlhNbzViTFhM?=
 =?utf-8?B?UlIxR3VGUUNUeFZBSXJiU3dJOVJWL1hIZjJIMTZ2bEM4TGtFNTdxNnBCMHZW?=
 =?utf-8?B?Zmp0OGlNY0VIcnlZcWpXenNCV1NuOXNQYnBXT05ZdWhCb2I0QUxaRUpKa1hm?=
 =?utf-8?B?WmlTWm9vRUJEaXVOeG1XOWMxZjRMMnNKQUxYQjJCenU4ZVBzZzk4RFdNL2hL?=
 =?utf-8?B?aG9wVDByOGhBUDUveUlaWENja1AyZ2h0U1gydkRHVS81SXhCZU1RRGt4dlZL?=
 =?utf-8?B?UEtXRXpHOWZxOURlSkJvRUFQenloT1Bnd1M2TUtCamdJWks2R29LMjNDcTNZ?=
 =?utf-8?B?UHpXWDA1ZU13U1ZISDJPNDF4U0ZpTGZ5T0V3Wjd3dDRSM2hwdGdtVXBXQmhQ?=
 =?utf-8?B?aHhLWmp1OEhhSVVSV21saFc2ZDJlMGRNWUJrN0pEQmJiK2lVandjbUlJYUNy?=
 =?utf-8?B?cnNNNFY0MnhHeVI4RjBtNFc5blhiOEVta2g5VzBqQTRDVkdCRldyWk1nTzRH?=
 =?utf-8?Q?eq7/anvTjy78yP+X5pZK/6Wmo?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34af82c4-a5d0-4910-066b-08dcf26cf7e8
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 07:41:41.2295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJ42Uqsg01Jso1iYlAkQ9wT4VjiyArgL3iaXXnBvuM1JoO3gphV30X7RwHyuvD8kHQPFtHaJfErQ5WCkO6KVgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9071

On 10/22/2024, Rob Herring wrote:
> On Mon, Oct 21, 2024 at 02:44:40PM +0800, Liu Ying wrote:
>> This schema documents LVDS panels with dual links.  lvds-dual-ports.yaml
>> documents dual-link LVDS display common properties.  Reference the ports
>> property defined in lvds-dual-ports.yaml to save lines.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v3:
>> * New patch.  (Dmitry)
>>
>>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +------------------
>>  1 file changed, 1 insertion(+), 19 deletions(-)
> 
> Squash this with patch 8 then it doesn't look like you are duplicating 
> things.

Will squash this and patch 10 with patch 8.  Thanks.

> 
> Rob

-- 
Regards,
Liu Ying


