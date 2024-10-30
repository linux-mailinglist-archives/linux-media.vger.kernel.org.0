Return-Path: <linux-media+bounces-20568-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0E79B5EBE
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 10:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFE2E1F22593
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 09:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA81E200F;
	Wed, 30 Oct 2024 09:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tGwf7ylh"
X-Original-To: linux-media@vger.Kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2072.outbound.protection.outlook.com [40.107.241.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570A9192D79
	for <linux-media@vger.Kernel.org>; Wed, 30 Oct 2024 09:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730280097; cv=fail; b=E1DBHSYLfnM+rFbKKllCrjmnlhkWBKEK41x6rlToDjWUtdbRV1e3JZHsAahpKU1mAdG+/4MRHMlMF9QPKFrGRzEBCBqLx4ObBNq3IdqzTht0mHMrdneZynBoJGePoGI5pHYBCGIiUHB6fdjn+2aD+APy9XVk1pr6cqU6XfDCxyM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730280097; c=relaxed/simple;
	bh=RwLVjMrWFMipP30ja/PRoZhVEDkdF4ZXfijdPI5x7sE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ojJ6SpzopBLdRrRjFjTUTGoBECqY43qiYxP5J2DLRVLf3avLK3Yi7Ojy6sOcmZEbfjNVpXveqPFfdnt7lIs80Wgv/a8Br5RGlX/254WsEYdRCjP5+MLDCoGrndefWBTbOYlUQubDssZIkXYBysuGLT4SpRXOZx2Sku3SnNV9Kn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tGwf7ylh; arc=fail smtp.client-ip=40.107.241.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=viQ+Dxn7XaBLNQLajs46pQ7EHG1gakhr+BWwYj0DF7e8kLp7WxfC+ZmtOVB8N0wQ8oeebc8avP7vR0kKSRyW/ipIlfG5vmRTBdwjplWr+ax5p0HRPnE4tq0hAS2PH2HCcM/UQvlHgmPrbItQ00hL5VIji18HGrI7ijmcoAFHXvP7dLaB3b1mu/Z4zFZLFxXbeQABVKkzt8gYRRI+ACsv6UewGlM8VbNdRz3GY/CAMSqgDt/aU/7tpHfuH0AHrm/qjTEjqwsperZtlid4FkdMPHlHHNEOucC1CCZh/sKTjCPtJhL7Xg5fAcYkHyzw7geQDKSHao5b5aJh+s2We0ADrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K1/J19pXNda/F4Y+pVUre3Af1sBMZ87ojfkWc73gptc=;
 b=GiRYEu4gbWNQB8oDvzah5HGNwjGFCLy9gu6bRNlrzZ0wRiLkYE2mUyxzvChZnxohVKjNCT1hhlI497MYjQ3aRb6kFZP+YlqpuZHShWu3YIpGcSvlBCao7b65T6IZEFr75dXbb5vg8AFmZv1KjCLU3lVwx5xokqDfQZp64KlHVLJPH+6b3udeSTneZgQDwn5DMyLPVxOp7W2w0jZcws9T+PdH93u9F4EsQkFOVQii8Mn11AWA7Va+G9Cx5WjfpYypeHM6Tsw/BovB4sM3rvCiPtRn9swfqG2tm3d3FAdxU4sAfkJtoNnob7Sp+7NXy9br8cpaYfVVWG6czBEquOBsDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K1/J19pXNda/F4Y+pVUre3Af1sBMZ87ojfkWc73gptc=;
 b=tGwf7ylhze7DY5/xia/N6JWgIhMWnU4YWzWsXIPhzs/loQW4C+5AtboDY+Luv0wVn8WBzTIfO2PSEc/7nZ/yutX/w5Pg6Cz1s76RKOXmMxfvHGtBKyIO4ac21AW2z6mzW7nFsIVG//3Cq/ZDNRx5tO930VEQxkZMRkY7AgQDkdP7mgYE1BWw6yH+YzirZm2r8pwu9nOQKX9Hb3a0xHIKYTNufvHM++0df969v+hR52fmOrtlGf13F7QAYZm2MUmI8lYBjkmp8w2gkKmyqucic6OlL+embd8jf4HchQB7NmRQBYsUpJMdVUfB+Bs0urmEXfCSfb3bSRP9Jr/gsKEqoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB8205.eurprd04.prod.outlook.com (2603:10a6:102:1c2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 09:21:31 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 09:21:31 +0000
Message-ID: <e107bc8e-c5e6-4013-9374-d74165de71c9@oss.nxp.com>
Date: Wed, 30 Oct 2024 17:21:22 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.Kernel.org, hverkuil-cisco@xs4all.nl,
 tfiga@chromium.org, ribalda@chromium.org, yunkec@google.com,
 xiahong.bao@nxp.com, ming.zhou@nxp.com, eagle.zhou@nxp.com,
 tao.jiang_2@nxp.com, ming.qian@nxp.com
References: <20241030024307.1114787-1-ming.qian@oss.nxp.com>
 <20241030024307.1114787-3-ming.qian@oss.nxp.com>
 <20241030090330.GS22600@pendragon.ideasonboard.com>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20241030090330.GS22600@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b42dfdc-fe3e-4a5e-3026-08dcf8c43dab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VWF1MVVnOXhSMUg0aWxRYXhQMVY0ZVVyMWd3QVM2MjQ2THBFT1hMTDd0UGpn?=
 =?utf-8?B?QmhkYnQ3d1ZOT2RnUUlwZWhtcGRXL1puYzNlRGhtVzEvblYxdGpsUjBNeVQr?=
 =?utf-8?B?bVYwbzFwSlkwOG1rcnBBUzJkcm81dEprVmJCMlpUR1Eyek8xS2ZjQmI0Zmxk?=
 =?utf-8?B?NFVndjZuWGZDWjAyZU1SeDV6dFNNQ0tNeGs4Um5RRDFuRlF3VWx0N3IrVkpL?=
 =?utf-8?B?aDh0Nmx0M0x2L2xwdWphaEpvYVJJVUwwNVk2K2pjYk5BUmhpRThnKzNOcEds?=
 =?utf-8?B?bXp0U1lmTjVSNjhnYjVmeFpHWXNEZVNLRmhSamtGVkhTT0o0enFESm1JRVhM?=
 =?utf-8?B?dncxQjA0MjNxZHlXdnA5RmFKMm5LTWh2ZkVBd0ZETnJsTWhWdThoM0ZqV2RQ?=
 =?utf-8?B?RGFiNDQwSEs2VnRFNmFCVlFxTHM3N0VRdkdNcEN5bUVydlprUzZTVDJQd2lq?=
 =?utf-8?B?aEk4OU4yRGVGVldGL1lmY1NqamhiODNiUFp0NjV1bDNHWkM2VjJHaFdSK25m?=
 =?utf-8?B?ckU1eWlNdmp1YTFJV2Jza3ZVVVJLajBDeTJNelg2OStDWVAvS1ErRWxpdUd4?=
 =?utf-8?B?WnUyZjBteE1xL3ZRTmxOTXJjRTYvV2FHbHdaMWVMRnAxK090dGJBK1hQdjRZ?=
 =?utf-8?B?N2h2dGdnZ3NvT0JHcC9vQlBRTDZtRHdRankrMkZYUm53TDhMTWI2dHpNV2ZM?=
 =?utf-8?B?dm1RSHNySWo4b0lhbWFsTHdibE84KzJlZGRYSlR4T0tic0RWZGlJUTFCdWtY?=
 =?utf-8?B?OUM2dEFvakk2bVE5Qmg0UG5uWFRZWjUzUkpTTGlaQzE0ek16UWxRWnRGbEZw?=
 =?utf-8?B?d3psckF6ZWhaUFRzM0xPV3c1UWxhK0I3U1FEMnBaN1B0WHd3SXBQNXlodVU2?=
 =?utf-8?B?WWFnRHY2OXF3UzdqTWhtYk9IUUVDK3JKK3d4Z0dKQmhBb2tZeENNZm1aT3Jv?=
 =?utf-8?B?YmpldlI4YW1hcUxwR1NkNWxHUXpZbGFKNE12TmdMTUJqQnMxNXBHRFhNL3Fo?=
 =?utf-8?B?Q1Q3TitBc1ZUbmViTjI1RVlJYVIyRVd4Qjk2TStYQk5RYWJZN1RxSXNpM01J?=
 =?utf-8?B?T2dMbzl2c0RvNjRONlpBQnladkNDNlh0eHhOcHp6bWw2OVZGVGRzallZb0hz?=
 =?utf-8?B?bkFSTkU3WlZLbjRITVdQSGdJa0J4QTc3MERtbzRlcHhJWVh5c0g4dXlnTHhz?=
 =?utf-8?B?cndmTXhicmQ2NVVoOFFERHdUVXAzWExzMkxZallDYnZycVlDTTh0L1VjNjFY?=
 =?utf-8?B?eGo1MW5PN2ZUY2YrcUtxVExQVHpvYktQUTFmUjJ5cHpKaUtNQWphN3Y2RFZW?=
 =?utf-8?B?L1drR3Q4L3Vvelg2cVlIK2JNeTV1VkhiY2VUTk5CY05tMDV0cDU2ckNna09h?=
 =?utf-8?B?OCtaY1pqMHF6SGRMWEs1Yjg2OEV3c1FqU2ZLRFF5UlRKUXdINFJ0bXFjZnJF?=
 =?utf-8?B?K1B2TkZ2UWdvbER1NTdKa2VXOVY4TlU4ZlU4ZmVlZGxtRXdNUWRUbDVWVDVl?=
 =?utf-8?B?NUtFcnBiUU10MVpIeFVIb3NvQ2I3eWptUUdhSjF5V0dpWElWcEdoMnVaeW1L?=
 =?utf-8?B?dEZoNEk3anZmTlZNNUF3dGxWR2Q1UkU0OEtwakVVYTVTMjNxbmU1VmZTOUNl?=
 =?utf-8?B?NGtiY0ZoOGs1Ukt0aE40WmJNOTZyK0YyWE1Od2xiYWdJSzdGQno2UndIeXpT?=
 =?utf-8?B?TGxJVlEvbkxrYVQyOGtCdTQ1a215K29WVW5lQTUxS2pVWVFZZGlNM1A4eWsv?=
 =?utf-8?Q?ilgMfTY8HzxpZthniOUR+WgQ7oNF3YbEfI+STxA?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RloxakNvdjJRU2FVd2NPaVhhTktUSDFOb1dGV00zd1NVd0VEaFNhTktMcURh?=
 =?utf-8?B?c0dPNWdGdTJIYng0UjdSVjZLbEtTQUc1WkdBV2VYMFNnV3RBc0JGcmEzYzQy?=
 =?utf-8?B?c2tjajlzSGxzYkJZc3NwNCtnRXZNS0xnVm5HNHZpOE5Ga0svUkVSUmxybyt0?=
 =?utf-8?B?di9MM0YzMWtXQmNZVkRKZ0xmeFB6Q0R0UHZVZndsR2RPWnZGMU5VbEJGMFVZ?=
 =?utf-8?B?ekNPbUxmTzAyNmd6a3VWeDlhajZPbVhhTEY4WGtIcWlDU2ZrQ085TnVGcGs1?=
 =?utf-8?B?MnZmK0xlTjhWYkdObnVWNEpTT0UvZHhSVFlDQm92dWxOY0M4WTU4ZFYwd1Vk?=
 =?utf-8?B?eHJPZDQ0Mlc2MTMxeTdSMnp0d0l0T2UySHdIN21zNmF1M0xubzdDTWdvM0Nt?=
 =?utf-8?B?UWMyd1FyY2xzeExPMWNqTWN3QzBPa2ZJUDlQTDRiOVNTL29HMFcwakJRNWYz?=
 =?utf-8?B?Q284R1g1bU1OYzRweVFYRTVxdHhkUjFpWFdoZE02a3k0cUoxS21nOCtXS3Ny?=
 =?utf-8?B?NittMHh0T2M2ZU41WXh3RjkrTW5XOVd6UkZLNXZTZzhGQk5IS2FCR0VpbjdL?=
 =?utf-8?B?d09TU3JScHlHdys1ZFBmQjdvckU5N2ZQRS9icXpvVzJJVXh5blpldGhDVURx?=
 =?utf-8?B?MUdnZTB6eFNIMzBxLzBTR0pMRFd2STZ3Zmwwb2ZWSDkzb2cyNE9oeWVBSS9G?=
 =?utf-8?B?L09MaTBVWm9BQWltOTFNNXVQYThlaTl2TGdDZzVnUG1nZXdtQ1lEN3pHMVVj?=
 =?utf-8?B?SXRYN3E0Nmg5MkdYMXprM2YyZEtiNkVIeGFUSk9RTk1YWTVjVndQQVptdGg0?=
 =?utf-8?B?OUFxM3pZUWJsZ1ptL2YwSURkU29Sc2F4cVZSU2dJelBjSUJPY2ZIMnJCZ0ZS?=
 =?utf-8?B?TTZBTjRDUWQrMHNnSnREd1p5KzQwZVI3ZjJBWjhHMDdwVzNQM2xvaDh0UVlj?=
 =?utf-8?B?NG90MjV4RHp6UytIdTRyUVZiR2dGZEszUXNjYUVaUEdOWU9nTzFPMU5DbVZu?=
 =?utf-8?B?dHVvTnQ2b0dLYjlGMENXMjUvN05XL1loM3RVZk5oRThLREpWcExFdHlZWklv?=
 =?utf-8?B?SkhzY2h0T0tobjZaUGxzSHBMcll4ckw5VUlTRXZnZVFpVVlPNElhOEM5QlN4?=
 =?utf-8?B?Vjd1emRZZWhHZGxabmFSampHQ2xYTlp2ck8vYUIraEp2WUhpWHhtTEZBOHdn?=
 =?utf-8?B?ekd0UmlLRjk4ZzFPS0kzOFpOeWdQWEY2bHZ1UW51a1YrV3hmeG9maU8wM3Zm?=
 =?utf-8?B?cEM2dS9SMTFFcDR5UXp0dzBGY21nK29nZjdPcXBNcnpkeVgvaUVTRHgvUGlI?=
 =?utf-8?B?bzRZQk1tTWE2SFFEUHUyWHNFQ0phQWt3Z1BMcGh6eUNzTzVJeWc5VEJxaWta?=
 =?utf-8?B?ZHhtdTZaV0pKZ3dPYktEdGhiNjgyWkRGb0MvZ2YvcmViaGNMRlVxTnp0a1lV?=
 =?utf-8?B?NnVMTURkdSszU2d4enJZNmZJeUw3TXpueU56QVpGbklCcWtSQ0RiMGhjYno4?=
 =?utf-8?B?N3NtVGZPVDY1dXJ2dVVYUXFZV2pCZkZ2eXZPbmN6VVV3NGVNVGxTbGtEUG1P?=
 =?utf-8?B?U2QybVlMTHNIUFFpZFhQRkc4UWlWc2hmaXkybW0zZW9lMjVtRUJPNUFNT3ln?=
 =?utf-8?B?SUwya3k5MnZMc2lKR29TYzV2U0ZFUmNrRmRLd3BYUHMyK0g3SVRkdjJwcUUr?=
 =?utf-8?B?QWdTUHJtNzhWUjlSaTBQM1E1NWtTUWNOaTZ6OGNjMUppN1htT2g3WEZ0QTJF?=
 =?utf-8?B?NCtnNXUyZEsvMko4bmV4Sk1lQmdDM3VUY2xuWjJQeEpjTDlQTDI0RjlzR2tk?=
 =?utf-8?B?S29GTDkwWnRwckhwcXNMZHVZSThvWVRzZk9sTHdjREE1ck1YOGJLQUMyUmU5?=
 =?utf-8?B?VlRibkFDVGd0TGRqSmpvajJQdDhYcTkwY01SNHdjTzl5VVd2MzIwbDBLM21z?=
 =?utf-8?B?YllzbHFlMUdtQzBqcUxXSzNCTWJuc2lWalNoRjU3L1llNW1NUk1EZFE3dHRm?=
 =?utf-8?B?bnZIb2VUektxQS9xdWhQcjFFUXlJUGpYV0NNMXFGbzVQU0llQXZ4OTlvR0Vv?=
 =?utf-8?B?cTk5aEU1TDFJZGx0MDE4Tk5pRFkvUENIeWZxUzJFeUlpRXBvd1VBbGE3cDlI?=
 =?utf-8?Q?HrHvXkJof6ASPFmjWXiDES+F0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b42dfdc-fe3e-4a5e-3026-08dcf8c43dab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 09:21:31.6030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r2f2LVTKrh11FIWxGyaph+g+Gk+ss+MonSc0OWto93rc5yo49iht92QfBv8adCawf+uOKSdh71MUK03908NjbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8205

Hi Laurent,

On 2024/10/30 17:03, Laurent Pinchart wrote:
> On Wed, Oct 30, 2024 at 11:43:06AM +0900, ming.qian@oss.nxp.com wrote:
>> From: Yunke Cao <yunkec@google.com>
>>
>> Tested with VIVID
>>
>>   ./v4l2-ctl -C rect -d 0
>> rect: 300x400@200x100
>>
>>   ./v4l2-ctl -c rect=1000x2000@0x0
>>   ./v4l2-ctl -C rect -d 0
>> rect: 1000x2000@0x0
>>
>> Signed-off-by: Yunke Cao <yunkec@google.com>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>>   utils/v4l2-ctl/v4l2-ctl-common.cpp | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/utils/v4l2-ctl/v4l2-ctl-common.cpp b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> index 40667575fcc7..538e1951cf81 100644
>> --- a/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> +++ b/utils/v4l2-ctl/v4l2-ctl-common.cpp
>> @@ -614,6 +614,10 @@ static void print_value(int fd, const v4l2_query_ext_ctrl &qc, const v4l2_ext_co
>>   		case V4L2_CTRL_TYPE_AREA:
>>   			printf("%dx%d", ctrl.p_area->width, ctrl.p_area->height);
>>   			break;
>> +		case V4L2_CTRL_TYPE_RECT:
>> +			printf("%ux%u@%dx%d", ctrl.p_rect->width, ctrl.p_rect->height,
> 
> I find this notation ambiguous, it's not immediately clear when reading
> 10x10@20x20 if we're looking at a 10x10 rectangle positioned at (20,20)
> or the other way around. media-ctl use (20,20)/10x10 which I think would
> be a better notation.
> 

Thanks for the suggestions, I'll go ahead with this approach.

>> +			       ctrl.p_rect->left, ctrl.p_rect->top);
>> +			break;
>>   		default:
>>   			printf("unsupported payload type");
>>   			break;
>> @@ -702,6 +706,9 @@ static void print_qctrl(int fd, const v4l2_query_ext_ctrl &qc,
>>   	case V4L2_CTRL_TYPE_AREA:
>>   		printf("%31s %#8.8x (area)   :", s.c_str(), qc.id);
>>   		break;
>> +	case V4L2_CTRL_TYPE_RECT:
>> +		printf("%31s %#8.8x (rect)   :", s.c_str(), qc.id);
>> +		break;
>>   	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
>>   		printf("%31s %#8.8x (hdr10-cll-info):", s.c_str(), qc.id);
>>   		break;
>> @@ -1279,6 +1286,11 @@ void common_set(cv4l_fd &_fd)
>>   					sscanf(set_ctrl.second.c_str(), "%ux%u",
>>   					       &ctrl.p_area->width, &ctrl.p_area->height);
>>   					break;
>> +				case V4L2_CTRL_TYPE_RECT:
>> +					sscanf(set_ctrl.second.c_str(), "%ux%u@%dx%d",
>> +					       &ctrl.p_rect->width, &ctrl.p_rect->height,
>> +					       &ctrl.p_rect->left, &ctrl.p_rect->top);
>> +					break;
>>   				default:
>>   					fprintf(stderr, "%s: unsupported payload type\n",
>>   							qc.name);
> 

