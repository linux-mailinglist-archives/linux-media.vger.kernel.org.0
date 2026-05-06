Return-Path: <linux-media+bounces-60554-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PQwMfcD+2mbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60554-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:03:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6EC4D84AC
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:03:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A2CA30324DA
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC2B3ED121;
	Wed,  6 May 2026 08:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M5ywZMm6"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011030.outbound.protection.outlook.com [52.101.65.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27703ED12C;
	Wed,  6 May 2026 08:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057884; cv=fail; b=KU2tooFFP8mHXL3DDpQ/oIH+tbMeQfmJM8GLcEveu/xx6EB86ENfftJgHZH4Dnpl5HieLXLPZyLn+022H/NpSOHqDzmyLlaabMOl7ia7E9uUJF5+XtURk35T2MxRmki2KgZf/yTCZeVk37DavSgp9Ize8nF5VrJCGDco93kkqEQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057884; c=relaxed/simple;
	bh=5y3qgh99KExE8nc5CKqjC0tx3yhiLbwM1KwX9m39xf8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lu9SIeqRGUIRyKVHabUlvFYeV6r7WcbNcz5+dUQ0mxG4IGMkk1BRD1kIcLN1vpkmvEO4SrCY76wO3+eJByPSVm9DyV8KJVCv05qM9oZI0CQ5iIFsd985NDf2cHtA8KJe6HuU4c+L/W1QnSFZ1NpgMsJOvBsmRN17CnALPBHKCMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M5ywZMm6; arc=fail smtp.client-ip=52.101.65.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeYv7WaiZVN8pNeG4GFu6QiwpMKkQZ3cpx/jSWQLBRKYPFOM8yURaZdqETmf2nVP+jITnLkNk1mqMvHrHJku1YGDkaiz+YbUTAo5pVJyUN4XiCeJISMFu4yfkBiQAJSyokL7O0Z/KrcMowWuO6jXUN3tPjUYAeuCLtobK944HGy/6lPIKeLDFhglx+YcJbSUtMDfsVASSZ2JTCwVaq6vZd7Agu2ufDu+C2IrD1cTobHbnvUV8hI12MofzYcCg5fvIff9PP/xKlK0uoteec1Qt4Zk4aqzIAksNeMe462vgOK+NjAsCxFe5jNZbYjRjhwN2zXZeZDqLcbcYKstgPyqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfYFVV8S/DuSfMQgW8tlu8j9i8J+KrhqxqREfreY3hM=;
 b=rE+wn2831e8NM9PCpqmTx641EHPvd+8JHE6rRAJbSxfreEYga/cKAV+ULaGVi2pn65/wkic79cxCOwVBU4zQpHtN8Lqw7udBSDK0gbWAd6txki2xtKXPxCLzI+kkhiueQ4KLvDp2+NfJ7Dz2Ba3xNmZpauJ8gk/6ssuaCPKkR0vtkJ8n4aWfloP2GO0mbzW78+Bpb38HFJ1soQ0Jc8Ao9BcIhyTiruOd9qW9ws3Kxl403evVjBCT1RuwihTZ1GSNWWE+krzQmN9xgCuperOoGLrPG7pWaUntwsGkIFSdpV4zfiQdTnkIbg2T2D5mltMZGYAY7jJY8HC+/OCGchxK1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yfYFVV8S/DuSfMQgW8tlu8j9i8J+KrhqxqREfreY3hM=;
 b=M5ywZMm6nuECuU2aS9wujhDVrxUjRM89a5y/pZHSDalM5oZPfwZxJw/s3kvGj6MGWiXog7XfY8r3aZH2Kf2JBc0QIrlRcvyrSmqzum7xE6jPTxkP2WaFY6izTb1OlWg6nXVzclOI3GJESscl9Blyxlu/L8nOSLIXE+PAdpDmi/GC6nAd40cniMSTaRKm2johg8aShADxFWo20aAUVCKzAtD4+RgCRlTCbLuEYNykGgA0olPhZ6cZv2pHfo03KZDVfRgpzOaiYO73rvpxArM1UJy5rm5nI1XULHwNdEFr8+9gnJWj0UHw0doh57d48jgl2zpUxOIEy5PbsFOuz204FA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by AS8PR04MB8498.eurprd04.prod.outlook.com
 (2603:10a6:20b:341::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 08:57:52 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9870.023; Wed, 6 May 2026
 08:57:52 +0000
Message-ID: <9d61b8bf-392d-4781-b49d-7dbe4c617b7b@nxp.com>
Date: Wed, 6 May 2026 10:57:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] media: v4l2-isp: Rename v4l2_isp_params_buffer_size
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260505-extensible-stats-v1-0-e16f326b8dad@ideasonboard.com>
 <20260505-extensible-stats-v1-3-e16f326b8dad@ideasonboard.com>
 <b8c24929-449b-4394-afe3-d3517c64427e@nxp.com> <afr7sCGUTJqixAC-@zed>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <afr7sCGUTJqixAC-@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0005.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::15)
 To PA6PR04MB11910.eurprd04.prod.outlook.com (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|AS8PR04MB8498:EE_
X-MS-Office365-Filtering-Correlation-Id: d3dcd4d1-3826-4994-b4fc-08deab4d8e36
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|19092799006|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 Nzv7ARmf04VIDEi05Gzh7VZFA6vMM3WiTvCaCfxu/+K6qdHogeew/XCdCBtBwu698XMmBQmvXrKoztaCtjKwq+qXrdxxEWzCzNqZTIfTfkSDj4iUi86lKxFw62zAj06FauFcwisjIhpzbhsbsKfPDGxs1fhYJjLJbxh5la219LmsLw8DWdS2mPbJQ3zLSGKjpPdlQ/wUrWTGn/dhUEhWkvwXWQ6U6xDYeY8LFnhYxHgJgxK4YUNFb1GlW2S3D0ytv+gT4AuT22kXWGHZaeEA6AvOxi4CougkRf0iweiv6y7JiUpXP4flMR9LGT/hHZ4Y1s3+PotRf7UaAcW8OWrA6K+0QDe6PtqfpqLa/uQQAQwKB35DyejAsfTaUF9VtZ3zSgPXwpYJs6CQ0z5GnbbWQmhFYCzW0RxgPNIE9u9mFCTFgMXROImxTcv/jM0z7TYjQ9nnXou8n3uCuwQst1s8Yofao/zrOcQt8+TyWkCmOOjTVWt0F3q95QhSQRA2DdSvNUJzj+lV6kUDtqD4ZKUVHeAdZ2aQqClQxrL8Wu/7EEEgASkeoNKiO/uGzu2KBWyjSZdbVccQCwWQZL7VtLdNJM8W9imIbklXIDS4fIqOdkMv2gCcxH3UV0ynlz0cFDZHocC05LDy8Z0rLnexH88z8h8vluW1S+KiFzGJYaXWXO/buF/h8+KQXmno1QwMLKth
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(19092799006)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RGJDQ1EvVEN0UHo3a2Q5cEN0Z3ZQOTVRVnhPblNMdUFyUjN0RDY3bmlmaExD?=
 =?utf-8?B?TFNpZ3d2MDFJWkdqK0Y2aEtlTG0vekRtQ0thcDJ0aFFLdktLRkpybTJwOE05?=
 =?utf-8?B?MVU1a1hrc1QyNklqRnB1Zk1naFpjbzBQY2w3KzU1RzVwVUJJS1ZMQlNyOGsw?=
 =?utf-8?B?QlYxZ3VwdDA5VlJ0eXZPWm13c0wxNjk5ZGhlY3pPcUMyQkJnZHhvaFhiZk0y?=
 =?utf-8?B?dGozb1dMMjMyc1ByVWtvMHp0T2JTS0dzZUZ1dERSZFpJb25rbWpjK0VrU09n?=
 =?utf-8?B?cFd2cHRaKzNBblMvS3l5SGxFNmIxbDk1U1ZoMFZ2VDFyNlJUQTdLNVgyNDlQ?=
 =?utf-8?B?c3pZRjl3THlFM0p0U2xrY3hyOXZTT0JyS1BCVGlVRkRHejFNaEVSQjFuUU9P?=
 =?utf-8?B?ajc5UXBJOXVMOTl0Q3prUnM4YlZaRHlEUFZGUVgyL0cwZmhJbDk1M2srMi8x?=
 =?utf-8?B?azBMa2dFbDVnWDZUcjNCcE85ZUZHdy9sdm1KdElGQTdxS243RDdVcVVDdnVu?=
 =?utf-8?B?UTNMZTF5NEhxdzRuaVk2cVl1OVJoY1o2eForMlVoaVFDd1JUT1FsMVZaeWxi?=
 =?utf-8?B?cThaNmJqTE9uY3d5aWFIbmsvWnQyUUwrcE1BM3luZE5pSzFnZmswS3MrdVBk?=
 =?utf-8?B?dFpRWEE5Q1ZRa3JvZEwzRlBiblhwZjgybGgzcGltTkZOektjSGE3Q3dML3pn?=
 =?utf-8?B?ZTNOU2ord3czKzJ5Q0hyYUp4MllRcFBvdE04c1hRWnZRTkVZWXVjRUNTbUZa?=
 =?utf-8?B?bmg5aUFmVWRoTWF1VVJhdkh2L25jY21hZ3hWVWw0bStacW1RQVJUYVJGSFVz?=
 =?utf-8?B?MjRwN2t0SGNLRFF0MzFrYkJjWjVoZkNIRG9DK2lYOWo2cjBqYTFEeVV6Sk1B?=
 =?utf-8?B?bXJubjdFbHVuQWRFR056ZVZoU0ZhRHVRcmRuVVJ6TDFuNHJBeVpvY29uMmJG?=
 =?utf-8?B?b0k2M3dzS1ZtR3l2OVFkeC9QSFJGRWFZdGl1VWJrZisyblA1QU5VdkpQeHlW?=
 =?utf-8?B?cmc2Y3N5Nzl6RU5id0VnQmZ4dVRDWTR3NVV5bHZzYXhKZWtDMnN1YTlQVEFL?=
 =?utf-8?B?bFFLVVAxbU5VRGR6RFNRYXE5QWdaeWJzblRjU1hTWk80ODcyZHI1OGZ2ODRy?=
 =?utf-8?B?NzRxWU1Hbm85Sk9GcE8rK09EUjh6Qzc0UWZvbTNXTU5za0RzVWJsSjhpdm9s?=
 =?utf-8?B?a2Y4bGlHTnFIc25kMkp0Y3RsZjRLOWl5T3BCcURNajZCeXB5SGRHdERESXhP?=
 =?utf-8?B?TTc3dFhndmpHRG04SDFNdE1lcVVEWnZXZnZ2eW1nMFcvRDVQSDZhTEpncDVi?=
 =?utf-8?B?Z1NKN2xqSlJaS3dvTEErOUJJRzJYeCtQZlpiNmFqMjRXR2JqMEpxN01DRlV4?=
 =?utf-8?B?NEtxanU4dXFuV1FZalVZZHNlb1hwQ1FEbXNoeGlSZjRQNVdaWDJnRk5BeHB4?=
 =?utf-8?B?WjhKRUZyYVdjZXhOc3dCY3c5REJVK1JFUkhLcmxGd1N6Y0pIQllQQjJlR1Qz?=
 =?utf-8?B?SWlUK0xvZUQ3emdHeEhoTVhkUUNPRmN6dTZ3cWRFS25rcmlYYnZ2U20rU2Uz?=
 =?utf-8?B?N0J6M3BLNWtuc0JLRVVGbHU3cTBTTDQ3U2NkdnJTR0xDNDFUK3p4NitlR2xM?=
 =?utf-8?B?QTVpYXdCZTlvQjVmZzZ0VGVCYlFJemFRUFlManFVV1Z4dWVHeVE4QXl0YWxC?=
 =?utf-8?B?anJlQVlmbWdhZDE1TWlSYWc3ZXc3RGJScWhwYXZ4SG1JUlZBQzZtTlhiZmE5?=
 =?utf-8?B?ZXdsOFlKdUdNb3p2ZVhFejZuVG1ZenZENXNlbnpTa3lWdXYzRDl3MDJmYy8z?=
 =?utf-8?B?UWFRdUpvK29SZUNqY1U0UVFZNmdybWcwcGE3UHg1ZnZuckRneGtlNC9UeXRV?=
 =?utf-8?B?NDNvRThZMFJpc0dwZWtVc3VJSmd0OENIZ1dEM2FrTjFGMldpY0RWTzZBVkJI?=
 =?utf-8?B?TzVya0hEbDJKcHUzSm53dFBoNXdDb0NBbkgwYUF0M281ekNNN2gxdzV0YVB0?=
 =?utf-8?B?cWlMdWxhcDUxZ1pMcDR2NEVYZFhBMENUa0YxUnNTQmt3STVWUlNKZThHN01P?=
 =?utf-8?B?S0VCZlFidm5MVXRXYlY1TEFoMUdDbDYrTkNFQ2VnUUNRR0EvNCtVaWxiNlpC?=
 =?utf-8?B?QnBSSHdKT2N0MzlXU29jRUxFUkp5UEJHM2MwSEUyWVR4YVpoa1l3YUwyS1ph?=
 =?utf-8?B?TUpmdGpIdnlkRnAvQjBuVFZoVG8wZWNROG5iZ1J6UTc2MG1mVlpKL3BFQUpv?=
 =?utf-8?B?NmliS2ZZcUFmTElvRzNYaFdwSGM2WnhRSW9kK0JueHJZOXlKZ3I3UnY2Njh5?=
 =?utf-8?B?MXRjcDBGTFpMZ2x1a015OUlTcVpTWWVVdWNpUFZyYWVoQklMTVc2Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3dcd4d1-3826-4994-b4fc-08deab4d8e36
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:57:52.2742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lpWyGF4hFdtyh6q09rBKM1RVCCc9xDiBH9eCIj7MsJxzX6GXzhE4S9QMtMwP/yh22zmEJC1nJVlGSZ/9snGqTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8498
X-Rspamd-Queue-Id: DA6EC4D84AC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-60554-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:dkim,nxp.com:mid,ideasonboard.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

On 5/6/26 10:35 AM, Jacopo Mondi wrote:
>
> 
> Hello Antoine
> 
> On Wed, May 06, 2026 at 10:11:31AM +0200, Antoine Bouyer wrote:
>> On 5/5/26 4:12 PM, Jacopo Mondi wrote:
>>>
>>>
>>> Rename v4l2_isp_params_buffer_size() to v4l2_isp_buffer_size() to
>>> support statistics.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>>> ---
>>>    .../media/platform/arm/mali-c55/mali-c55-params.c  | 12 ++++++------
>>
>> Hi Jacopo
>>
>> Is it ok to meld driver and include changes and remove all occurrences of
>> v4l2_isp_params_buffer_size ? Of course it prevents build errors, but what
>> if pending changes are already using this macro ?
> 
> This is an internal header, we don't keep compatibility for internal
> kAPI symbols.
> 
> If you're referring to your in-review patches which use the now
> renamed 'v4l2_isp_params_buffer_size' symbol, I'm sorry but we'll
> have to synchronize here, there's no way around it.

That is fine, I already moved to common helper locally after your review.

> 
>>   >   include/media/v4l2-isp.h                           | 22
>> +++++++++++++---------
>>>    2 files changed, 19 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
>>> index de0e9d898db7..dc483f0322d6 100644
>>> --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
>>> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
>>> @@ -487,7 +487,7 @@ static int mali_c55_params_g_fmt_meta_out(struct file *file, void *fh,
>>>    {
>>>           static const struct v4l2_meta_format mfmt = {
>>>                   .dataformat = V4L2_META_FMT_MALI_C55_PARAMS,
>>> -               .buffersize = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
>>> +               .buffersize = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
>>>           };
>>>
>>>           f->fmt.meta = mfmt;
>>> @@ -540,13 +540,13 @@ mali_c55_params_queue_setup(struct vb2_queue *q, unsigned int *num_buffers,
>>>           if (*num_planes && *num_planes > 1)
>>>                   return -EINVAL;
>>>
>>> -       if (sizes[0] && sizes[0] < v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
>>> +       if (sizes[0] && sizes[0] < v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE))
>>>                   return -EINVAL;
>>>
>>>           *num_planes = 1;
>>>
>>>           if (!sizes[0])
>>> -               sizes[0] = v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
>>> +               sizes[0] = v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE);
>>>
>>>           return 0;
>>>    }
>>> @@ -556,7 +556,7 @@ static int mali_c55_params_buf_init(struct vb2_buffer *vb)
>>>           struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>>>           struct mali_c55_params_buf *buf = to_mali_c55_params_buf(vbuf);
>>>
>>> -       buf->config = kvmalloc(v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
>>> +       buf->config = kvmalloc(v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE),
>>>                                  GFP_KERNEL);
>>>           if (!buf->config)
>>>                   return -ENOMEM;
>>> @@ -583,7 +583,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
>>>           int ret;
>>>
>>>           ret = v4l2_isp_params_validate_buffer_size(mali_c55->dev, vb,
>>> -                       v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
>>> +                       v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
>>>           if (ret)
>>>                   return ret;
>>>
>>> @@ -593,7 +593,7 @@ static int mali_c55_params_buf_prepare(struct vb2_buffer *vb)
>>>            * changed to the buffer content whilst the driver processes it.
>>>            */
>>>
>>> -       memcpy(buf->config, config, v4l2_isp_params_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
>>> +       memcpy(buf->config, config, v4l2_isp_buffer_size(MALI_C55_PARAMS_MAX_SIZE));
>>>
>>>           return v4l2_isp_params_validate_buffer(mali_c55->dev, vb, buf->config,
>>>                                                  mali_c55_params_block_types_info,
>>> diff --git a/include/media/v4l2-isp.h b/include/media/v4l2-isp.h
>>> index f3a6d0edcb24..d70ed6b431e7 100644
>>> --- a/include/media/v4l2-isp.h
>>> +++ b/include/media/v4l2-isp.h
>>> @@ -15,17 +15,21 @@ struct device;
>>>    struct vb2_buffer;
>>>
>>>    /**
>>> - * v4l2_isp_params_buffer_size - Calculate size of v4l2_isp_params_buffer
>>> - * @max_params_size: The total size of the ISP configuration blocks
>>> + * v4l2_isp_buffer_size - Calculate size of v4l2_isp_buffer
>>> + * @max_size: The total size of the ISP configuration or statistics blocks
>>> + *
>>> + * Users of v4l2-isp will have differing sized data arrays for parameters and
>>> + * statistics, depending on their specific blocks. Drivers need to be able to
>>> + * calculate the appropriate size of the buffer to accommodate all ISP blocks
>>> + * supported by the platform. This macro provides a convenient tool for the
>>> + * calculation.
>>> + *
>>> + * The intended users of this function are drivers initializing the size
>>> + * of their metadata (parameters and statistics) buffers.
>>>     *
>>> - * Users of the v4l2 extensible parameters will have differing sized data arrays
>>> - * depending on their specific parameter buffers. Drivers and userspace will
>>> - * need to be able to calculate the appropriate size of the struct to
>>> - * accommodate all ISP configuration blocks provided by the platform.
>>> - * This macro provides a convenient tool for the calculation.
>>>     */
>>> -#define v4l2_isp_params_buffer_size(max_params_size) \
>>> -       (offsetof(struct v4l2_isp_params_buffer, data) + (max_params_size))
>>> +#define v4l2_isp_buffer_size(max_size)                 \
>>> +       (offsetof(struct v4l2_isp_buffer, data) + (max_size))
>>
>> Shouldn't we keep v4l2_isp_params_buffer_size for compatibility ?
> 
> I don't think so, no. This is internal stuff, not exposed to
> userspace. We should port all existing users to the new symbol, don't
> we ?

Ok, I'm fine with this too.

BR
Antoine

> 
>>
>> BR
>> Antoine
> 
> Thanks!
> 
>>
>>>
>>>    /**
>>>     * v4l2_isp_params_validate_buffer_size - Validate a V4L2 ISP buffer sizes
>>>
>>> --
>>> 2.53.0
>>>
>>
>>


