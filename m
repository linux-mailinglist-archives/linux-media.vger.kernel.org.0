Return-Path: <linux-media+bounces-20468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB7F9B4058
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 03:21:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E568282E28
	for <lists+linux-media@lfdr.de>; Tue, 29 Oct 2024 02:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2765176FB0;
	Tue, 29 Oct 2024 02:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wIFwkg/6"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2054.outbound.protection.outlook.com [40.107.22.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5F12E3EB;
	Tue, 29 Oct 2024 02:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730168506; cv=fail; b=Uxsonk/XPSbq93cYJJxngf2+LYZCzXPp1wBhak0enxpNG1tg/MuY51xT5oH0ZA9YFUMWIxRdLlBK3CV2FB3KqAk4A5kN3TAKB/6t+1PzUVHOoFnM3SR6fYiZC3ljNoW2n4DatqBMr/dyjj3FrV01KaFKH1R5Tw+tp+x+Z5keDl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730168506; c=relaxed/simple;
	bh=f5vkKU2ZoCarODyWS+3HrKq/nsDhSvUMgfMUwsbDVGk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KdReLOQqp1kDsvPE6Zrd3MW5uhVy/kMXqIZW09wNiY2VSLkAJM34rhovcKqNmdO7wiNDBnkzETQtzpBR1SHrvTOXq3rZeaaFUCNgtP8aBSMqHakqld73slCgE4ltfPOgwI8ZllKAJAE349+wiP7nIW1zMGk7qFCEFXGTmej/1Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wIFwkg/6; arc=fail smtp.client-ip=40.107.22.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcW7YBPcdqbeTB5+pBP3dZ428MaxjwdwWcbXEDj2VoViJ0LNAAVQY/gzKJpKMFi94BjsU+ai3elDgUBINgP/pbvN64cWuSo6QqDXv/uaXGaCUef4+rzlHB85gH4D/SODfzRrgLEZUOlX0enRvZuiwBL458NCljwmF8mKL4D8mohpqYNs9V193aGCcoSZgQXfurjOiqb43GEgPR/ByS2TF6T2R4G+4rfr/13E9OZmkcDAPwG/vIAbEYnGkVb1T85zCU5kJOa8543Q2HFz1iLF0wbYyfCSK1HpkmaC7LhLjp23s3S+Bt0oveHhfjA+gVrARs26v8nhn4i4mZGtp0wa9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/PSa54xpnJ+mlsnNpC5C5t5SM4FmtLBbdWL7coCbHYE=;
 b=V/DO1rwBNtX5+k+SFj0kc4aiCf4K/aJwx7+z0Fc7OvbrNLi4HDg6mbkolGd3ALhLu+9jDw1hj84u3UsrlPRQlEnLNmjXVsMQK4qt/pgv6WdbLj1W11AtQ4Imt/Nwln1qtRS4lhyNJqCHK0E3Pa2lOPrWfDjEcrg6SJzXzU7XOLIOgRRdWd7aW/l+pb9mA4OMqhaRncqlHihhIGh5PuWKhrQ1xOSf1+427tcqXGfpTOc6BWWCEL71NXLceNSkyhCsbQE9ByNV+HtV81IlW0UjIO3YkxhBMCEXuoqhrlaWSn+cxCifdpMsYIIYOrRrqQzdyrQ6Dd/Y15kKLD69qdDqBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PSa54xpnJ+mlsnNpC5C5t5SM4FmtLBbdWL7coCbHYE=;
 b=wIFwkg/64XndegEIReX8CnKuFuqLxH/YislAsPj1hCXP7KoA+mHDc/1C4J+axE0lESHJAVH1Jj4NqArMkQn2EIz8yRvUb6HD3V7UPHsG29RyrwyDnM4zdB/0u8CzovmAaZczH5aGzlwjqdUgjRDTrEVFKaSeVbPoTcW3yzNq/ZYMXjFblT+nxMD2vre94qugAgi2cBTdo8A+Oo7lG7/eB0AvCf3wrxTrtvfM2fYHlvEsYzEmfyAQb6xI7sTEZFl5JD/+m6dzQPqQGHkkPvLo6F3S2F+tDcRg23e2d+n5I8EFDKqrAnMKAaOzwcoYXBT9xt/LikSwbJDp5MG9N7gDfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV1PR04MB10194.eurprd04.prod.outlook.com (2603:10a6:150:1ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 02:21:39 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.024; Tue, 29 Oct 2024
 02:21:39 +0000
Message-ID: <61ee3f1a-640f-45e6-8c38-197d2234d7cb@oss.nxp.com>
Date: Tue, 29 Oct 2024 10:21:28 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 0/4] Add video encoder ROI ctrls
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Ming Qian <ming.qian@nxp.com>,
 mchehab@kernel.org
Cc: yunkec@google.com, nicolas@ndufresne.ca, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241022084040.3390878-1-ming.qian@nxp.com>
 <6b8004e2-57df-4760-a59d-77a712e9ca4d@xs4all.nl>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <6b8004e2-57df-4760-a59d-77a712e9ca4d@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV1PR04MB10194:EE_
X-MS-Office365-Filtering-Correlation-Id: 24b05fca-fc82-4b38-a065-08dcf7c06bbc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SE5uZkZhUHBXSFdqc3o4RXpZOHB2Z1FVZUdJL1dSd3ZaWHhXaFl1cjd5dVV5?=
 =?utf-8?B?M2dPZ1I0R280QUN5NU13RFhwSHRzeEY4ZzFxd0M4bW9DLzRLemdENVpLUzQ0?=
 =?utf-8?B?R2pqZzQ0Uk1XdGJCcEJFdW85TkpNRjFIdXpPR3EzSkJMcGlBeUdxbUJ2ZUhK?=
 =?utf-8?B?ZFNhakZKL1ZpK3Z5bzBHNWxOK2NLck1WRFNuUGQreTBMS2ZNcXVJaTBrTUQ4?=
 =?utf-8?B?MElDSXdBdU05NWszRjhRbE9sUzNnUFdmNXg5aERtMHhNSjdpWEZZWjNGZHQ0?=
 =?utf-8?B?SEdKUHNaYkhjMytHK3FkSDZ3ZzhRZW9PdG9FRmJ6T1hBeGhOSmcrOEllSjF2?=
 =?utf-8?B?NThONXJiaStnY0lxQnp2U2d5NGd1Q3JZZGJ1QlNGZGhzV3lrbHNMVVptSEJM?=
 =?utf-8?B?clJRUEFld0FudjBXMTA4Wk5wWFV4aWtUL1N5ZGJ6VzBRT1NXZkVoMTBTQ2JM?=
 =?utf-8?B?R05QTmk3NEpIRXBJQjhLbVk2VDNzY2NEOXA3R3BtVTFsZWxWRFYzTVE4eTZ5?=
 =?utf-8?B?MXpobkt2TjZlL00yQ0lTYmRIM2Y1RXNiMG9qNjFZM3BoRGx0SFZvei9qTy8w?=
 =?utf-8?B?Y1JBRkxQcG1FdElnNmwzQ2VnQUE4ZFZ5elZnS0VCVXRvK0RUZ2I5ZU9ZdGxR?=
 =?utf-8?B?c1BySjU0UkZ0WGVlOXErWTl2ckQrMWsxa3ZHa2dVOXBpUnJSS0xsRk1qZWhY?=
 =?utf-8?B?RnpOVGxuZVpLOTN1QmFKbmFNck9LZzZZUGZWNjJtTXJnQXB2ZXhhcGRYamdk?=
 =?utf-8?B?dTY1Z2RnK0JIaHFCVTBtVSt6MmlUd1R5ZUt2S2lseEZBV2xPeEt2NnQycFVU?=
 =?utf-8?B?NUN0Rlo4aFJlRDMrUHc2N1Bybmd4U01JNzBVdEFHTXVkSVpQeldCNHV5RTFj?=
 =?utf-8?B?V2JMZGJCMVBaeEFkZ3d5dk5CaHJ0Ykk1REt6cW9jb1ljVW4zYmswTGp1ZklZ?=
 =?utf-8?B?b0s4WnVsbzBMK2xMbWVTck9UQTZ0aGFxWllwelpGcnNqMEpUL0JrcGp1Y2c5?=
 =?utf-8?B?UUYwTVNmZ3lGK1dPRTZ6bGJXSEF6TDA2NDNtN05rWXVrbGt0Uld6VDNwV09p?=
 =?utf-8?B?eTF3K0J6cldmL2Nua1pWNkJpT3lLcDF4UkFjNUF1WkpnUUNMSlEwaHdMcy9q?=
 =?utf-8?B?LzRJdVVESTJkbmlHNnNnOGVXWnBONnd3YXA1OGNnOGdaK1R5M2FkekwrRXpv?=
 =?utf-8?B?R2lIaXc1Y2JBb3JQOGs0YkY2WFhSOFpwRTZoaTcrVkdOODIrWmF2dmtzYTRH?=
 =?utf-8?B?aEh3TWZkUzRtbDJCNEdJSy9Ha2MwYktJeVhPaFdVQjI2a21Jc29qYXByU044?=
 =?utf-8?B?RVZUUjNpc3FraStFd0Z3VWlLcHpocCt2aGdZUlhrVUVZTlBya0xRdGp4alFP?=
 =?utf-8?B?azExMmhYOWkvUk9sc3hHdk81UkJySGJWYklKVHIzdXo5VnBQUkxIUlJZaSsx?=
 =?utf-8?B?SFlUL3lwWlhtcFFMQlhtYjk4eGl1MkpydXJSTG8rMWJ5OTAvSFpmdXlmSUh2?=
 =?utf-8?B?dlpuN0k4bXJWOHNZV1grUGFRZ2R0YjFxc09EWmc0ZTRaVXRrRnlXOWM4ekZy?=
 =?utf-8?B?WCtURHhDVkVhZ3ZzOU5uUnRFemFNS2NNY3o3cjJTM1Jna3FYWWgxUHN6eHVW?=
 =?utf-8?B?RktuZEdRSWNkdGdrcEZPbkJYR2pQNjhQVHhwcnBwenZXUGgybS93aURsTlJ6?=
 =?utf-8?B?VHRQNE9ISTNhSkFZeTBPN1ZobHVxMUdxSEE4NEc3TGZIMk1oaGZqVGtWak5S?=
 =?utf-8?Q?cVmzEQPvNiFZ5X20Wy9v+MW8SNalnw7Xyt7AyMU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c0YrRTVNUXFiUjFXK0l3aURmWTJwSjhBbThVUnFKdGZpUkJOK2E5Ly8vYTNG?=
 =?utf-8?B?T1ZSLzRQRFByQ1QrRms4T0dzUWRMMFIyczBiTzZhWU9zMnNVV1ViWEYySE5h?=
 =?utf-8?B?L0htRjdXZVZkdGtlOGtpVGVBd1I3emtKR3Z0QVBEQ2lkWWVvbW5RWlRaVVlu?=
 =?utf-8?B?aWVwVnd2MXR0OGhzZ3VlQVFKclQxaVVYWGZ2bW5jTlg3SXNpSmxUdHpEUk5R?=
 =?utf-8?B?a3BvZENiUkxVSExvZkFINWpJR1FZc2t4Q3FDYk1YQkxTU2hBdlRqYWFGa3Jy?=
 =?utf-8?B?clZwNmRBMllaWkY1RzU2YkJkU0NNSlJlZ1ZqVVFTRXlIVzgzL2d2dlVEMGZa?=
 =?utf-8?B?dEFvRGFSUTZZUFgvK3NjOWcwbVNKTmlhVEE5ZmJLZDgyeXpkYjB3d1FrMXJZ?=
 =?utf-8?B?TmJpWUFWWWpGcisyK0tubVBKaEFtYmFpQndiZll3dC8vcFNhLzFqQVlhcU9p?=
 =?utf-8?B?SFlvTndVdTQ3QXkzNXhoTVl2TGZpVG56VnZNMmYzSUdaejNLQ1NsUkQyUmVl?=
 =?utf-8?B?MjRGNmJvcnhCNHFXSWFxZ2hmN3NMR3RkNXgxY1ROTWd6LzVXQnhmYTJzcVZU?=
 =?utf-8?B?NUdUVjliRHRqNklYNUtCMzc3NjRtYk9HcmRRbDkrbjBsalYycHkrbGFTTVho?=
 =?utf-8?B?dWU5RERYWFg0d1dNSVV0NnRWeWZRV0dXQzdtYlBCYU5XT0h0SVIvZTZ4YUFo?=
 =?utf-8?B?TmM5Q1dDM1FoSG8xM2p5THo0NnBhK3MrQkxBSVQyWG5RUmhXcTc5cmc5bVBp?=
 =?utf-8?B?R0hWaUgzMGpublVMQjF5Tk1kUmVENHRtNGNCbDR4NmJHZ0tWSTJKRnF1bzNm?=
 =?utf-8?B?TXBxVDhnbld1aytRYzY4b2FJVGVjY3UyZFF2Z05xUThrVlZodHVGak5SV3J4?=
 =?utf-8?B?WmNEL3FibDZHdWtNZTJIV044bEdZUnhaSnN3K2tEU0lvNGFHL1ZsUjBKZW9o?=
 =?utf-8?B?d0pyak1DS1ZPWHlxbncxTHBRUGMrZXBkZ2VqNEhIcytBeUpNdjNDdytlc3la?=
 =?utf-8?B?bVBOQ0g1S2JTOW9OQzhRSjJncDVseHZocXJ2Mjg2SG11TjhiT3hVaGpZT3Vz?=
 =?utf-8?B?LzJQcWUvYzBzbHdrMWdKYXZMOUNqT3lYcFQwUTJ4MWZ0dU9wQ0t3QkxKejk0?=
 =?utf-8?B?a1diOHdkak1uaEU4R2JtZUNzcGUySFN3R3Q2bXlidGIwb3FZL0tmL3JCcGI5?=
 =?utf-8?B?V0JFOC9aUTQreXY5K3FNcTIwM3ZkVWNUNDQxWTUveUNFQXY1dEhnNVdqL25I?=
 =?utf-8?B?YmNZMlpDSzg4UEROTlFSb21qOEJ3aHNsVnJscFkvbGxGc2JBaDlNcm5BZmNr?=
 =?utf-8?B?cVBTZVhPMlZ4d0dIK2NybzRVNUdMVTFrY1JuM1VSOW5YNlJISTA2ZFdBRUNE?=
 =?utf-8?B?RGxWRlhVQVpCRG42NmFvbVdWY1NxNFdZTElKcW52SzVJTXdHQ0ZjYWpPTXZS?=
 =?utf-8?B?TDg0Z0E2dXBVdXJkWUZ4U3ZQWmRHWW01UTFIU2FwK1RRYUpNNHYybHBiL29R?=
 =?utf-8?B?akFVaUhvL3lncW9nZ3JWd1hKYWRJd0RUNGZzWnF5MU5uaTMwRzF5NGJjQzNU?=
 =?utf-8?B?TGxheG80NFg0Q05LVVJybWRUWjNQc2hLN2tFZGZrcWo3Y00rSXQzekwwa2pC?=
 =?utf-8?B?dHBLbkxGQnhQY2RmMkRtUTlJSnZhcDRrT3pQR0ljbWJ5b0RCNnc0aXlDd24z?=
 =?utf-8?B?dHNKQ1lZWVJUZzBkRzJYaUhkL0VEZmQ1RzdKMFFJZ3FER0FoK1dLN0kyQmVo?=
 =?utf-8?B?QlFqaXI0UkVLcFdvN1pmNU5SUDlCVjBVNzV4c21nUk5FN09rTzRkR2tDdlJO?=
 =?utf-8?B?SnpoQmZRUm1kR3ZoUUdVM01neUpmZkJpU1ZiS1lrVU4zRzAxY09KR200UVEz?=
 =?utf-8?B?eXJUT0d5M29zY0RKTWV6eFowdG9IUHdYUlR3RmJwbEowVUFGbDlGWnZpN0tG?=
 =?utf-8?B?b25XOEtNZW9ZSno0bFNudE02NkJOVE1vaEpTcVZRR2RSaW5Fa2tZSFZsZk5B?=
 =?utf-8?B?bnR1SnlBOU1UZXJIUG1aWlJtd2xXelhjTnZ1VnZyYkVRTzNCeGo1ZGVJMWdT?=
 =?utf-8?B?Z283V0xvd3RTTk9DUjEvaHNrMjVTN1pEVnZjNHVzZnlsd2YrYTQ1QnJqTzZ3?=
 =?utf-8?Q?t6atjHLLS9ixd6v4E0lyB7YJa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24b05fca-fc82-4b38-a065-08dcf7c06bbc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 02:21:39.7076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+vGeFILU79ZSTpwhU/N8hD0YnI8NsZ28GZ8ENrVgIwnYWz8riN5jNYTkL+oCJb+vlnAUJYrPXSu/i7GDWI3Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10194

Hi Hans,


On 2024/10/28 15:57, Hans Verkuil wrote:
> On 22/10/2024 10:40, Ming Qian wrote:
>> Hi,
>>
>> This patch set implements region of interest (ROI) ctrls for video
>> encoder.
>>
>> One video encoder IP may support the following two ROI configurations or
>> one of them:
>>      1. configure ROI as a rectangular region, and set a delta QP parameter.
>>      2. configure ROI as a rectangular region, and set a priority parameter.
>>      3. configure ROI as a QP map as an array. Each value represents the delta QP
>> of a block in raster scan order. The block size is determined by
>> the specific IP.
>>      4. configure ROI as a QP map as an array. Each value represents the absolute QP
>> of a block in raster scan order. The block size is determined by
>> the specific IP.
>>
>> To achieve this, I made the following change:
>>      1. I reuse the type V4L2_CTRL_TYPE_RECT that is defined in the UVC ROI patchset
>>      2. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_MODE to choose ROI configuration
>>      3. Define some ctrl to configure ROI
>>      4. Define a ctrl V4L2_CID_MPEG_VIDEO_ROI_BLOCK_SIZE to query block size
>>
>> I referred the patchset "Implement UVC v1.5 ROI" (https://lwn.net/Articles/953532/)
>> and pick some patches from it.
> 
> Please note that since this introduces the new TYPE_RECT and WHICH_MIN/MAX flags,
> you also need to update v4l-utils.
> 
> This was done last year:
> 
> https://lore.kernel.org/linux-media/20230817072537.2837504-1-yunkec@google.com/
> 
> Can you pick this up and post a v2 for these v4l-utils changes? Note that I had some
> comments at the time, so please fix those before posting v2.

I'll check the patch first, and pick it.

> 
> Regards,
> 
> 	Hans
> 
>>
>> changelog:
>>
>> v3
>> - Drop the type V4L2_CTRL_TYPE_REGION
>> - Split the compound control into 2 ctrls
>> - Define 4 ROI mode
>>
>> v2
>> - export symbol of v4l2_ctrl_type_op_minimum
>> - export symbol of v4l2_ctrl_type_op_maximum
>>
>> Hans Verkuil (1):
>>    media: v4l2-ctrls: add support for V4L2_CTRL_WHICH_MIN/MAX_VAL
>>
>> Ming Qian (1):
>>    media: v4l2-ctrls: Add video encoder ROI ctrls
>>
>> Yunke Cao (2):
>>    media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
>>    media: vivid: Add an rectangle control
>>
>>   .../media/v4l/ext-ctrls-codec.rst             |  95 ++++++++++
>>   .../media/v4l/vidioc-g-ext-ctrls.rst          |  26 ++-
>>   .../media/v4l/vidioc-queryctrl.rst            |  14 ++
>>   .../media/videodev2.h.rst.exceptions          |   4 +
>>   drivers/media/i2c/imx214.c                    |   4 +-
>>   .../media/platform/qcom/venus/venc_ctrls.c    |   9 +-
>>   .../media/test-drivers/vivid/vivid-ctrls.c    |  34 ++++
>>   drivers/media/v4l2-core/v4l2-ctrls-api.c      |  54 ++++--
>>   drivers/media/v4l2-core/v4l2-ctrls-core.c     | 169 +++++++++++++++---
>>   drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  46 +++++
>>   drivers/media/v4l2-core/v4l2-ioctl.c          |   4 +-
>>   include/media/v4l2-ctrls.h                    |  62 ++++++-
>>   include/uapi/linux/v4l2-controls.h            |  16 ++
>>   include/uapi/linux/videodev2.h                |   5 +
>>   14 files changed, 493 insertions(+), 49 deletions(-)
>>
> 

