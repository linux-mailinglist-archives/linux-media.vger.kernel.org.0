Return-Path: <linux-media+bounces-19978-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F9B9A5E6F
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 10:19:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E810B231E6
	for <lists+linux-media@lfdr.de>; Mon, 21 Oct 2024 08:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 287491E1C1D;
	Mon, 21 Oct 2024 08:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="g/0thSM/"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCAA1E0B8F;
	Mon, 21 Oct 2024 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729498779; cv=fail; b=KFrscntkudBu7TANElMsKyLRsHlJR2Iw+CeIpfi0hyBxsxd1WHk3+0QW0VxBiUBTLTQGMijnHuV2tqRi2gBih3/1hWBbFs4sLULn/eDufHVU2jaKfJHyu2nNZitcnhB6y6EI4EMzZi3xgOLIs8vALXR1zIks2YnGkNe1zRr5BGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729498779; c=relaxed/simple;
	bh=01iyie0cwFvY/ROnJO9NHTCRPyn/ZtsZ0DZD2sIAzzs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jBKahtyR/VW0vjIb7MVYviKLiaTfm+oMyIGxFL7UjAvEZ00gmDKMMzXnK9WB6ywjtXoSgC48UamX7d8uwzOzn040RSlrh2hQnU5rj+jmqvS5vQbHW+EvhkAGCzEfdH4jomHQPjoHHaBNXqF5gVSunUfKbKpxdrckxEnxQzvEFg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=g/0thSM/; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=waZfs8I/bsRjHxhbamIBPEPKHuCB1FJCOvF148aKaC4DCPNt0oyP/CYSDWYkvRlbfMEwwobSCXvlR/CVD7HJf+SSub4jpK9wf4hIGpCU5R87otDasmvNFERvRot4i6zmrR8CS8gJMVcsqsZblKLjpjZIojGq7UEyZ7ehO+F/RdOD70WoTgi465FVm3ycIuk2BmH3q1W4Zj3U7Dw3qXwdM0NVDhMo0Sbpz1LlSB30x3xdOG5CT2SMgdw6DbE4wKTsfTSTAwohZh+4xBiLEJSFzd13HLWaGyo1ZHBEZkmWfe8hmq+Wf/HIdzewALG/JgEInYqQAmxL13UXO0cc4gQPXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6OnNLxPBlLFvkEhr4S1ap4juZc70ZONYmKSLzZ6M80=;
 b=Q4XMltI5Vt8CnbSI32mr80YsdNlVxMHuQrWXSShwb3JmWKvqljKF9vSfVUPz/JRoowmPsMxZ9MFAhLKH+AAadB1EiBqfGva6wJ6pXYtKDGi0lMbJzBdIaWqJEGQjX/jaKeeODxu3ofY3tp61OfuSwstcEgKdcZxtsxyXsMAF4qzYk31T8Jo0BCLgTD8I2aISbORD6XJWDMna4i8g9hZ8YYhuNSOUxZnHYVZSuL5cestIO7qVyGZA7xf8uqJBAPr0GOwOnM7LsAe1v3mARq8/jN5UfVgGL3rZKQTSIZIazBSiU0Fb3UEplgm4QSE5OraW1Qq0vqh2gbGo1J8Od0D8kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c6OnNLxPBlLFvkEhr4S1ap4juZc70ZONYmKSLzZ6M80=;
 b=g/0thSM/QYLCfxIv7+mfyo0DSOZlbMb7VW5JAZav+F82d0wqWv280YUAhi7JvNoplRzwr1Oj1+9H0IujQ5/CYN2irizqyuQTaqvhDW9lP1VOu8wboHvbqkXgpzNFSusPOVet06mLNJHAxO4V5RRLOVSN+eFG39Jq9prsLRQ5NVduTHgJsHRVyZaHaDtPEhyqYPY1CbXcwbX2jLwT/X0vWktN/flKQzy0pY6QLW81NuPWMRkt3fjEB3nY2U9IifxoWuhdKe5W6ILe+52J6QwXtH8IWiFhEnmVR26Vga5RMYpCaNW5nzwbtsGAIK1QRkpOZEpIL2WVV/2pQ6z3tc3MKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7460.eurprd04.prod.outlook.com (2603:10a6:20b:1c5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 08:19:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 08:19:32 +0000
Message-ID: <8f63ae16-f484-401c-a3e7-6c12a2343cc3@nxp.com>
Date: Mon, 21 Oct 2024 16:19:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/15] dt-bindings: display: Document dual-link LVDS
 display common properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-9-victor.liu@nxp.com>
 <y6xpffdtpd4baczoatbotghhes3owh44tzdqvdgv3id4jj6jhj@nrqjn6d3wndx>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <y6xpffdtpd4baczoatbotghhes3owh44tzdqvdgv3id4jj6jhj@nrqjn6d3wndx>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18)
 To AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f9c7cd-57ca-4693-bfff-08dcf1a91725
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?dHNTeFJWKy9xSUdKSEROWXp3cUJlNU1qeFNiaElsRWt0RkxDVS8vTHdPT21B?=
 =?utf-8?B?TjVsOG01cFFOM0NycjJLdzJQSEYrMzkrMG5CTXUzdG9wczZrU0c2YTFtYWg0?=
 =?utf-8?B?d0dCbmQxWlF3VHRSazFocjZWclBXSHVaV1RvZFRPWkhzOVB4eXJ5WFpXQnZx?=
 =?utf-8?B?eEJaemcyMk9GTHR1OGpkeGJNbUpoU1N0SkdhbExzRTVIczhhc1UzNmpUaDlJ?=
 =?utf-8?B?cjhqem80a3RNbWZ6YjBVdjRlS2prYzBsUWxWMENZNm41WUYvZnhxbjRCajE4?=
 =?utf-8?B?TkNaTk03eGIwUFg2L0JiMVYvdlhRY1lIQXR6TGdObVlMUW8wZGQ0STFLZlRu?=
 =?utf-8?B?Rnp3d3RsR3dzUitnZlIwTzI4SExFTkw1WkxDNllZOU9seXhSRDdSYzRtYTdv?=
 =?utf-8?B?RWJud1BRaGdZd1o4TWVnME5DRVJVVlFvT0pidWVrWHNiSUxRcG9ldTcwajcy?=
 =?utf-8?B?LzhLalBYK21OYWl5RFJFb3htV0g4VzJoQmVoTmE3dnNLdVNtMGRVWDNWWXdh?=
 =?utf-8?B?N3JYQ2tETklkZkFqbTNYTVl0TlI4dzM4bGhpNURRcUhtbFRkQlpVVTdienpO?=
 =?utf-8?B?NDNaL2s2WFVWaktTZ0NsdVRMZUEwUWdhOGQvUEJHb0dKRERDbysvak53b0Nt?=
 =?utf-8?B?THdDUHRKR3VOOTFKUjk3OERXd1RjYTliMnI3d0o0OEkzYTJQc0V5aWtvQ1dl?=
 =?utf-8?B?amhFNzRtZHYvR3ZOQ0tud3hEeTNMUjZlT25pYzlSQzhIUUxNTlFZVnpEdEZl?=
 =?utf-8?B?R2hGUUhrY0l5V0l1TWxBMVlZeG1mVS8zTTNMZHJFcmFYSnBtS2x6L0E3M0Vh?=
 =?utf-8?B?ZmhBUGkrbEVicGdaUmxpNURTVmpBR3ZYelVROHZZRmNiMG1XdmZUTWIrY1lM?=
 =?utf-8?B?bGNVaDVDUXFTeURBcFBrVElDckFGMGltMWljMFA3WHhNY1NZbWZIdDFzMUhN?=
 =?utf-8?B?MTRJejBJaWlndWJjUXY1NGtHUkJvZFF2c1NqaVplbjNJZjZkUk9TV2poSUpO?=
 =?utf-8?B?RmxZYXB0Qk44Y0tpNmhleU83bmJMV21ybjJOWUJyZUZxaCs3TXNOanRzMk80?=
 =?utf-8?B?a0hyZWVrZVZNUG9lbXNkZzdIejVFWTF5d0NhQjNyM2djekRwSTR5bGhyS0Q5?=
 =?utf-8?B?K1VuQW1wcDlXZlJzQ1grYVYzNnd2Um9kTUFlMG5teDM3bjZXWG51WWY0MFkr?=
 =?utf-8?B?Rmx1NkkwMWRRekhmaGpUL0I4Nk9MYW9KaWQvdkFjNTEzaFg3YU1LcVkxVnE1?=
 =?utf-8?B?blp6NFlJczlBcDBiNkJqV20vNVBkTTFhT2tOSlAyZHl6N01xZkkxdWtrYkpK?=
 =?utf-8?B?L1FQSFpIeDVhUzhaUWdaZW15NUZPbEFyRWhIYVVGbkpaUnF5T0ZsZktScHNz?=
 =?utf-8?B?aHRaMjY0VjlRQnZsK2tOZnBYMXBINUpCU0xLWlVmUTNUdG5XYVFZdzFtVnNm?=
 =?utf-8?B?UUI1WjJleU9sSXlJNzZLZFBYUXZlVWkxM2lZWEtNQlpZTnlYUy81QmhlbTdx?=
 =?utf-8?B?MDUwVnNXZzhJM3AyNU9jbS9QTUtmdFBubFpydVRUS0JqYzhlWmIzYzhNbVVv?=
 =?utf-8?B?Y3MzRXBjaUxNWE9XSmZaNHdrNHJVUEpvNklHa2hsSHh3OWhFRzZqM1ZNYjdW?=
 =?utf-8?B?SjBZcnUzNmwrczZyMWhraFY2eWllYWZpR3BvbnM2R0dyRktiU0ZHZ2g5a1hs?=
 =?utf-8?Q?Uy+Yahf+81G8wos9D4Lf?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RFB0clRuZk5yZ004aXVRUGlLZXlMdWc4aXFCLytQMUtkMFZYY3FBVlhOWlBT?=
 =?utf-8?B?cFlVN3gwL0ZtVURRckNOblJGaGk3dkZjMFg1QzcrSlczQjgrcTJDM29YNXNJ?=
 =?utf-8?B?dzgyMmpCMElvL25vcVlsMVh6L1ZQdWM1TnljWWdDbytjK0RGdXM4bDhYMDFo?=
 =?utf-8?B?SU5RSUZBT2F0Ni9FQzBIanhWb3l6N2ZoQWFvNFJ3Y2N1Q2JUczdJS0ZUTlRv?=
 =?utf-8?B?NUdZRFVDQ3puVzZDOWhiWnhPTG9NckJqQzVPRHJKZlB5K3dBK1ZiOWVVL0hQ?=
 =?utf-8?B?MldnTGkrM3FtanVQNlhCWWJDdERWYitNQnNCNVJxWlROLzdhMVlGR1N3MnhI?=
 =?utf-8?B?SUpjUmV1enZDbnZhZ2l2UU5YVmZFUGZ3c2dFRlFkbDRJbFZxTno2MFFJWU5W?=
 =?utf-8?B?bnV0MXVGTGoyaVZMYloxOTNmZXhSdURHTUc3ZTFzL0R6YS9qUFpSSU9qTTZj?=
 =?utf-8?B?enFFQ1ptUVJLT2tYOG51R1BaQUV2clo4MXJRZjhTRUpjckxEREFmTDNnM1U3?=
 =?utf-8?B?Vk1seVdKUFpUc2JIMTRrSzg5YzM2WGROeDhGK3RnVGVIM0RJUVZqcHd0UkYw?=
 =?utf-8?B?Wmd4akdTejNvUHU0LzBwekNwdzBIT0ZPcCt0ZHRHRmExeTVhdHdMUVFsZUVZ?=
 =?utf-8?B?QkxkZGVyTGhobCs3SFkxdW4reGt4bEJJYmhlYU9HRjZRbW5HZm5TeDlHYWdC?=
 =?utf-8?B?b0lvRTFmcjBUWFFEOWRkemlXc1JZK3VLd2NiNFozMVBwSkFBWjB4TEFJODAr?=
 =?utf-8?B?NE40R01uZVlvdEZ0eWQwWGRiWFFZZXgwQUFUdEM5S0NrTTVDMmZCckNWbmRF?=
 =?utf-8?B?MzlPeFYxVjVmZk1od1hweHkyeGN5M09DNmVHYThMN1l1eWF0a2FvTndpUlRr?=
 =?utf-8?B?S0ZWdFBiTkEyUUMrMWNtY1ovL3lrQlNOSldoTXg2dGovL3VmVEVIRDFaL3Vo?=
 =?utf-8?B?RmJpWFpjVUNJdzNwVlM3WUFxcXZ3Wm1NM1pIUDhNMkN2a1dKZ25vVFZWSkQv?=
 =?utf-8?B?MEk1ZERPUFBQS1dvR3ZURjRhUHlFM29jRDBZNjNPL2lwQ2hMTnJnNHVNUVZv?=
 =?utf-8?B?eGEva0NWNUNWSVZyNjk2M1c1cVdPTWhaUXRMbkVVdVoxd3dhYm0rTE8vS3Z6?=
 =?utf-8?B?UHVVS24rRXZ0RTJWRUltTk9iOVJtQW9jOUtMV0cvSHhhMlNXalJodVVGMCs4?=
 =?utf-8?B?MlhBZC95ckJZWThRUHUxWEdUMjI2bXltdWNVWmtWZUFyR1BJd3I4VFpLQkpF?=
 =?utf-8?B?eEdMa05JeHplMHczOGtEVmtWRTF1ekdyV0RzZTl6RGF6VFhPazJsOFZhUFdm?=
 =?utf-8?B?WmFHTGI0R0JnL3NOSlRJa2taZXVFelZFVThYcGwrMjRCcWNCbDJLODdjaFlO?=
 =?utf-8?B?QnFSaytRTW5mTXcvcHArMVFoTGI5MDZ5UDVpaTNqcWp6UzBVcUZLeGR5OGo4?=
 =?utf-8?B?YkEwNFZ0SzRjekx1NlRNaG5GUlc3aEswTVllSWRqcVU0Vk9WVjNQaG5NTzk4?=
 =?utf-8?B?dmdiMzJqNU1RU1JSdFA0TDJxZGZWRmhZSnRwS2puWExUYW0xTU9mOHA4a1Ft?=
 =?utf-8?B?NURiYVhPbW9rMjV3REJiTGNMWWpQWkxBOGd4OUo2cm9QSHRIQXdPNi80dkNk?=
 =?utf-8?B?OEV4aWx6WFcrVk02NTJHNFpMdGNScFRyaDkvWXNZWUpUSTBzTGR6eERvV0FD?=
 =?utf-8?B?VEs1c01YaDZKSWtCS2QrUXphQXJUNEErUWxPaFhITGc2NVdXaFpYaXcrQWt0?=
 =?utf-8?B?Q2JKRnhyV3N1RjErMWRTanRMdHdRT2tWRy9xWUpGRjVxOFU5WUtjL0FOZ05j?=
 =?utf-8?B?QWNGSmxTci9JTGZpUFRFeVlJWWEyVUhTWW15M3Zyc3l6ZlVOYWV5SkhHSVFh?=
 =?utf-8?B?QWtndFk4dDJ6N1h1TW5hZHlMRHk0M0Z5M0lneFFXY2tFcDZWN2RybVA4M1ZR?=
 =?utf-8?B?bG8vaktlUHc0U2RaTFF3Ym9kQ2tmY0c1SG51VzJTenQ2QVMzbzNrTDJXSkE5?=
 =?utf-8?B?UnZCT3pPMXJqQi9MNmZqVWFqWWJzaENkenYwN0ROT21wTVd3enpJYjQ3c3h4?=
 =?utf-8?B?WVJVZVFiNThnR3V3VDNBVmdXVWF2NlBzMkdmS05sRWIvUWlWWk1menNoNEs2?=
 =?utf-8?Q?O3vso8RScHPkPd1LI2s24D0BI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f9c7cd-57ca-4693-bfff-08dcf1a91725
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 08:19:32.2843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j12BPV9M9nAkBX2pykRuBrQCOwK3Yi3jgwtXl2o4xhrTerwdgWtf5gjfUbG3DLlbJJ0oJL2Ws5LgC3ZBrL8cmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7460

On 10/21/2024, Krzysztof Kozlowski wrote:
> On Mon, Oct 21, 2024 at 02:44:39PM +0800, Liu Ying wrote:
>> Dual-link LVDS displays receive odd pixels and even pixels separately from
>> dual LVDS links.  One link receives odd pixels and the other receives even
>> pixels.  Some of those displays may also use only one LVDS link to receive
>> all pixels, being odd and even agnostic.  Document common properties for
>> those displays by extending LVDS display common properties defined in
>> lvds.yaml.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v3:
>> * New patch.  (Dmitry)
>>
>>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
>>  1 file changed, 76 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>> new file mode 100644
>> index 000000000000..0ac4c06d0a17
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>> @@ -0,0 +1,76 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Dual-link LVDS Display Common Properties
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +description: |
>> +  This binding documents common properties for LVDS displays with dual LVDS
> 
> s/This binding documents//

Ack.

> 
> But anyway there is a binding for common properties used in dual-link
> panels: panel-common-dual. How is it different? Why this is not suitable
> there? Why entirely different file name?

This one references lvds.yaml, which allows data-mapping and data-mirror.
They are not something common for dual-link panels.

Also, this one is supposed to cover all dual-link LVDS displays including
display panels and display bridges, while pane-common-dual.yaml is for
panels only.

> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Liu Ying


