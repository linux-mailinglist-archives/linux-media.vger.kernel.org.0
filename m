Return-Path: <linux-media+bounces-67304-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I84nFFz4UGru9AIAu9opvQ
	(envelope-from <linux-media+bounces-67304-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:49:16 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A686A73B6A0
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:49:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=pNy7IhGB;
	dmarc=pass (policy=none) header.from=renesas.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67304-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67304-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 701C03056CAB
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 13:46:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F97D22579E;
	Fri, 10 Jul 2026 13:46:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011056.outbound.protection.outlook.com [52.101.125.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A24223DE7;
	Fri, 10 Jul 2026 13:46:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691181; cv=fail; b=GCR04Gky8kfq8Ze+2y9hS/pmprdFrjwUBvmg3XzV+re8nK2wELMZwIbPzezqtUFcdSA1db3hmwE/S3sjYR2EF+ttmCJNGEuM1vLTpiBjl4/rHrmZR/MDOkxKsscl3scerCH4TIRMBTeowEC1ZdPh9ZLWZOpUMrCUOyIVUjntTzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691181; c=relaxed/simple;
	bh=a7O2Oaobb3iNrEIERr80QfkQ3qJjdPb0kaSv26Vc2kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZS5SW4A5Iz6OsNPFpTZw/dD6DM6HOTKlPMuQbGvszLJ8ggih1kMhfX6+fPnZP3CLqNXuI4PltLJYvho4FGnjvokirUmzERGZLuhlh+Igd6j7T0yYJEmDVFJXenw7fG7VAeQ+El5gVpai94tH9u8I4e3hWqC9bhFeWH4VVtGKP34=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=pNy7IhGB; arc=fail smtp.client-ip=52.101.125.56
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bx3MZVRHu4ILpd1mB+X2K1RiWqLDlL10kbQ1A6rfHrNcJ+ED1oY8rqtLVO6rxSL0czm0PC4p0DkNzDPeKq+Z2KB7ZfYPe86CRP1qeDOqsuAh1ziby5SsExopWpHczyBzk8jVF6d0XTDPUWMPCFgLk44dbqQYsMJXm0sZMK/N7VlIilDun4YOCJmy5cnA36ckjEyC0xydtqqu1b7Ltdgi1fP8EOLpdrPgsrVurarO92mi6HQ5S5OTt+2mKlFEpyVeYrdbyyNKBSyVZ72TcMG7TmnU6B7qriupn+Pe4L62/B2x/nxMH8TblfPrjL49M2r/Twz+XVFQqCGK7H8vXHz2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpNys2DfdjBRFfrkjRHiGcphxW/SqY7o6wnFe+LKSHE=;
 b=vJ/WE77sw7mIrJzOA0W4x4LYcATkh0AGUY1cTIcMbevgroF8ajve28WR6rK/kHFhQGWKj7eRcFcHDtcof/gVwMp7upHTrAhAmxGfV/RbSDZqa/M3NEpQy1SSc8nEsrXc+I5wHoz7EVCrdJkLHeTW3giOMORfY/PICFmDM20J/oT6Bdv+Zu9HoD6ZsU41lpGFL7YWgBP3btHX3FefAjn4ldy1zy1oPOPfvh1NVCiDQ9Ak/julVKaIXPZSiJ/zroCYOMePeSUz98KwH3nrhR4MKPCOpB38P4ALjZ5QWNYHmv9WVfPX5ddidH2Sl3S16pc7xqI7u1+Adg+5RoNG5+wVGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpNys2DfdjBRFfrkjRHiGcphxW/SqY7o6wnFe+LKSHE=;
 b=pNy7IhGBoZlkcHlXwlYo71vyXaxoMIWXG6fhFTRhY79+qzS6nFSCiy7esAmkLczTGHQquPcL8F9RfTxI+l9LtC3j9GL4a59Z9ps7bArk37TFJvbw/2eLCHtWBGFpj8sg7M5a0/nHby+0oHyFTgkqQSvpYt3Wlpuh+kqKOmcIQNg=
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com (2603:1096:405:18d::7)
 by TY7PR01MB13606.jpnprd01.prod.outlook.com (2603:1096:405:1ec::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 13:46:16 +0000
Received: from TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828]) by TYRPR01MB13588.jpnprd01.prod.outlook.com
 ([fe80::2f5b:8560:48ed:3828%4]) with mapi id 15.21.0181.016; Fri, 10 Jul 2026
 13:46:16 +0000
Date: Fri, 10 Jul 2026 15:45:56 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Sven =?iso-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, tomm.merciai@gmail.com,
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] media: v4l2-common: Add
 v4l2_fill_pixfmt_aligned() helper
Message-ID: <alD3lCxdoKkYDCsa@tom-desktop>
References: <20260708161406.396183-1-tommaso.merciai.xr@bp.renesas.com>
 <20260708161406.396183-3-tommaso.merciai.xr@bp.renesas.com>
 <ak9pPzjABetdgUiq@zed>
 <210aa2ee-8931-4dd2-a51f-eeb0c205d647@pengutronix.de>
 <alC6DDFZ23q5h33W@zed>
 <00b18307-f982-44bc-bbab-4a640753d8fc@pengutronix.de>
 <alDgNTv9M2_aVV7U@zed>
 <fc504e89-11cb-47f8-ba25-19577b0811c5@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc504e89-11cb-47f8-ba25-19577b0811c5@pengutronix.de>
X-ClientProxiedBy: FR4P281CA0278.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::15) To TYRPR01MB13588.jpnprd01.prod.outlook.com
 (2603:1096:405:18d::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYRPR01MB13588:EE_|TY7PR01MB13606:EE_
X-MS-Office365-Filtering-Correlation-Id: 72875710-99ef-4346-4edb-08dede899d01
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|23010399003|18002099003|22082099003|11063799006|4143699003|6133799003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
 Olt89p7qJhip4zN0UguYcWFVn4UxazeBIOW1C18qFFQ3cQh9Rttuy6qr23UsfwNVDIkwmh8ul5XFul1iEsUfARVPAyc19/oYjEl1cf0RM/LW2bfoLU64FXbUdOTNvKTa9rK4csYw+sv/rDGVPtkYkeylkDXyANGgig/ExaemAkOTr7S9BwDNrE0wGuQnF1FWqRIBfU3cQOcko7V4MoP3ccf8sxaX8AN6w3KbOsMWtLJoyAkQW/oARLK1ctc43P1Gg4Kv8yZbVs4zUv4udjtpmxnz3mRYr0Ep9kl12xVTPEotF4FCioJ5XfnbbPiYeLvMei8icwZ9RPETb5cIE9TWYxNVYUAdzscFC7IJlnxW4Zh7XlsQn3g2qbGp/7DkAdO4fu0b41tIsSnHlcSQHm5u8FnBlfyZeZ5Qdna7uEXKmeKuKbqrFS/k4HDZzpuxUqCRMNJfAHxk+HMPwrxIUQrZSkZnhXnob5FYc/GHFishMW03nV7R+a0IHNbp1DXlj7dNwIGcI0nwF98Xurt2VLW7zh6CPJVkUzbqFRzUgB4uaLZSjhgzkNOd5vHH2RyVCEdJCdn4u9HqrRcPQ3TssSgfXr8X6BpxlYlZAQ6ddVcd/ir1UcaVHwP3nJgN1uY0Yog0+aVBz97w9YI2hCw5xGQdYkkGNvrr5ZsyqtQEH64UcFCEKYqwgNR5U/KkjPUhX6l4i9x2trwGGaLbyo8D59s8riA0+hTBUiS7FGBCNl6qZ9c=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB13588.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(6133799003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?aHdlNXpxOFBxQmhYb0RySTNzRmxaUnJzMkRiejE2RUppQTUxRDZZNkhMZkJL?=
 =?utf-8?B?cml1THRHRHlPd1NHWmpSVnBMT2lrelAreHIxZWduVWM3MERBR3FvbzZ5L2d2?=
 =?utf-8?B?aWl4Y3JXMThBM0tnMEtmbTJDQXhTR2dpeGQvRnd5ME94OUFZQjZGdmJySUtm?=
 =?utf-8?B?SFNwNFJnUU5USlhTVlVvcFpRRkhLNmxMcmhlSUJDWUtmME1ZaWlhSEZUY2t5?=
 =?utf-8?B?M2RaWmpMRWhTcVZkWm9OcnlJVnV2RG14elA2WDltTlZxU1lvUjBkU3ZwNkhj?=
 =?utf-8?B?eFNLeDdpL0kyeWU4TW5GY0ZYTEVrdW51cmdKMTQvNnljUW95OUFhYmVRUDdx?=
 =?utf-8?B?SGRRb2E5RE5ud1hQL3BUM2UyclNLUU83SXl0VGh6QkdhL25ZZmxabVNIS2ls?=
 =?utf-8?B?b28rQ0RhZHBpdS9VWjdpNzZja24vaXRQU2hBN0oxTlk0NGZHSWE0KzZteFVZ?=
 =?utf-8?B?WWhoUzBUSWE3THYzRlhseU12MWNVbnc1SGsvYlVEdStjVUlnS0RPVThMelc5?=
 =?utf-8?B?TFlhaUJKUU9xOFdTUUxDOTJ1NXRUL21iZi9BZ2hPVUFsbWdrcUdNRkRMOENs?=
 =?utf-8?B?b0RWY3FDeVhEcmcxVTd1Rnh6RmZaSkdPZEdQMTZJOWx6b2NHajZmcnlYNzZG?=
 =?utf-8?B?ZjFWVFFjdkU4cXFSbzdjUVN1RDNzZkgrNTZPUGx1VDlTZ1FUM3MyYy9PbWxJ?=
 =?utf-8?B?Y0hDNnVqSUVxTUs3QnFTNmxCWEdrMVl6andxSjMzanM5UFZhWGswdU1PQzA4?=
 =?utf-8?B?UkNSa0RHRkIxQ0JqRDRIZVVCaFljYnNEOWZsSmxSSEFHRGp4bTFtcmIxZGoz?=
 =?utf-8?B?Vlh6dWQ0eTRvZ3JWMzV6d1ZxWG1iWGtUWkJFdTM4ZW9EOGVSV2JUL2YzTUpN?=
 =?utf-8?B?emVvOXU0RkVJTDEzREhPbDhUSVE2K1BwUkUxVmprYjNnbVkxdWhqa2I1M0xq?=
 =?utf-8?B?OHJib2M0WWNySHN0bUw5S0NNUFN6K1BIKzB1bXAwSTV6dTVvQUtrQnVHWjEv?=
 =?utf-8?B?ZUZkYzVra1kzTzYvc2diV3RLMkVNd0Z3TXFlRlZDK2JkR21aQ2hrQXRTRjdk?=
 =?utf-8?B?NVJVdDdZd1hjSjd5Uk9KYTZlOEFKdkhwdC9hdFBsNTBjeGVXaThWL0tVUXZE?=
 =?utf-8?B?Yzk4TDg5NWRtajY0YWZ1eVlwMWpaMFhDdlBQVWh5YXpzRjBtQTlNcEhFdEVM?=
 =?utf-8?B?WXE2ck9nb1V5dFV2NnUxbklSdFFrL3JoT3YydmlXeUFqSnROeEdBS3hDTG9o?=
 =?utf-8?B?cVI5M0x3bFpiQUNoYURlNHBTU0hZamhKY3Y4L2R4Z2c2UDNpWlgwRzBtRkNt?=
 =?utf-8?B?aUcraWQ0bVNtVVpITHU2Y0pWUmxEVkNGVktTeE5RZmdLMGxwQnZsR2xwSFRU?=
 =?utf-8?B?RjJYbEFSWVdJZzB6MExKbkphaWVRNVZzcjNxS3luNHNsdFB3NHZ2UUFFWmdj?=
 =?utf-8?B?djhFMHpOR2daS2tvMVJlY3lZUEV0L1I4T3BPeEJNYTFJMHYyUTFGMi9IZU1q?=
 =?utf-8?B?cy93VHRhMzlXMDFOR0p2YWFLd0J2REN3c1Y1ai9ZQmlWUXZCeVNoYnRjQVpC?=
 =?utf-8?B?RTJYWUtEbmJMNXhTdFRoN2JvdzltcEhFWGZqK0NISVVIUCs1bHdpVlJEMlRG?=
 =?utf-8?B?bDRpM0llWTlDYVBtUUtDaDNxcDdtYkc0MW80RmxlR09SdnJwL2dhcjhOU1Y2?=
 =?utf-8?B?Z0pQaHNZeE9xaFRIUUlhUGplTWRxRlpBWHdpR09qUlhCUGQxSjVBT0h5VWlL?=
 =?utf-8?B?UVZLL3hyQ3pYSlBkaXBJV3A1V2d4dkIrbkpaNUZPa3VBZCthS0FQZ1NFQjRC?=
 =?utf-8?B?T1RGUVRFRFE0WXkwbUFWclIrRStndWw2S0xZd0VSVURYTFpONTE1UUhQZ3VL?=
 =?utf-8?B?bnNZMzNIcUxXQVRGME1Lc1QvYjZhejNRa1o4N2xEREw0K1VKMFovemZNVUdG?=
 =?utf-8?B?MkpOaWJscFgrVVhGbEFwWE1HTG15WjhGc0h4KzF4bml1Q0tzUXhQR3dMbnRs?=
 =?utf-8?B?eDN5YW43NE5sQlJpUjFTdWdhNHBtMEJCUjF5UTZTdU9DaU1GMFVRZ1lzcWo3?=
 =?utf-8?B?WWM5WlFROTFMRHFhdTFpdVJwdlV4VnRyWldZWnVHbzVFRFIrUXpWL2VXVnBn?=
 =?utf-8?B?S3BzeVFoOGE4cVZGZGlISkxNS0w0Q0tNTVk4QjlaNXRxUVRNdzFaN3U4MVFi?=
 =?utf-8?B?VEwwTVNXbHUwNzB5aDNkY05obWVQd3Nua3Z3R2NKZ0ZNNU9rRHJOUGI5WUJT?=
 =?utf-8?B?TUpzamNhQVRmWnpqQ0NVTk5nNWdyaU5IUXd3L0pPU3RLbVNOZ092Qjh2Ykhn?=
 =?utf-8?B?MS8wZzM1MVc5Z0djSU0wSW8wWGQ4R21EbWd3ZHcvZ25zWTJFNE9RTGNSRCs1?=
 =?utf-8?Q?2eBVv6eMfx13PSYJ6QHnzkT2XAMxEzjfaaK+f?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72875710-99ef-4346-4edb-08dede899d01
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB13588.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 13:46:16.2625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ReojtT1Xqh5tzfdCu0v8Mh6KJ1FroN77CnZqZ7A44+KQHmayqCLNujzwPJ2hKhx7ggmGUmrCnun637bsR+ceXfLBHJUwOgz6D/FEr0bvs9BsgWEzEjcfUUf8Ms0vcfHI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB13606
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-67304-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:s.pueschel@pengutronix.de,m:jacopo.mondi@ideasonboard.com,m:tomm.merciai@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:hverkuil+cisco@kernel.org,m:nicolas.dufresne@collabora.com,m:sakari.ailus@linux.intel.com,m:laurent.pinchart@ideasonboard.com,m:mehdi.djait@linux.intel.com,m:m.szyprowski@samsung.com,m:isaac.scott@ideasonboard.com,m:paul@crapouillou.net,m:dan.scally+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tommmerciai@gmail.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[ideasonboard.com,gmail.com,vger.kernel.org,bp.renesas.com,kernel.org,collabora.com,linux.intel.com,samsung.com,crapouillou.net];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tom-desktop:mid,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A686A73B6A0


Hi Jacopo, Sven,
Thanks for your comments:

On Fri, Jul 10, 2026 at 02:26:23PM +0200, Sven Püschel wrote:
> Hi Jacopo,
> 
> On 7/10/26 2:15 PM, Jacopo Mondi wrote:
> > Hi Sven
> > 
> > On Fri, Jul 10, 2026 at 01:54:06PM +0200, Sven Püschel wrote:
> > > Hi Jacopo,
> > > 
> > > On 7/10/26 11:38 AM, Jacopo Mondi wrote:
> > > > > This is due to the fact, that while we have a hdiv of 2 we also interleave
> > > > > the cb and cr parts in a single plane, which results in the stride being the
> > > > > same number of bytes as for the y plane (and vdiv isn't relevant for the
> > > > > stride).
> > > > > 
> > > > > Therefore the stride scaling also respects the bits per plane (bpp) value to
> > > > > determine the scaling.
> > > > > 
> > > > > @Tommaso : While the sentence looks ok, the NV12 example is misguided. The
> > > > I guess the usage of NV12 was as example of a "formats that store
> > > > multiple component planes in a single memory"
> > > > 
> > > > NV24/42 works the same, but being 444 it needs the chroma plane stride to
> > > > be a multiple of the fist plane stride and might prove as a better
> > > > example ?
> > > > 
> > > My potential concern is that NV as an example misguides the reader into one
> > > of the following:
> > > 
> > > - It's only for formats which interleave cb/cr into one plane (whereas
> > > YUV420 also gets scaled)
> > > - NV24 in the example being though of including the NV24M variant (whereas
> > > latter won't be affected)
> > M variants are not supported by the single-planar APIs
> > https://docs.kernel.org/userspace-api/media/v4l/pixfmt-yuv-planar.html
> > 
> > Some planar formats allow planes to be placed in independent memory
> > locations. They are identified by an ‘M’ suffix in their name (such as
> > in V4L2_PIX_FMT_NV12M). Those formats are intended to be used only in
> > drivers and applications that support the multi-planar API,
> > 
> > And here we're dealing with single-planar API only if I'm not mistaken
> 
> Oh, sorry. Assumed that the added description of both functions would be
> similar/identical, which isn't the case.
> 
> Given this, I'm fine with the wording and agree to just change the example
> to smth. else than NV12.

So if I'm not wrong we can then use YUV420 instead of NV12.
NV12 is an unlucky example where the alignment scaling factor is 1,
whereas YUV420 has a scaling factor of 2:

# NV12
(Y - luma)      bpp[0] = 1
(CbCr - chroma) bpp[1] = 2
                hdiv = 2

# YUV420
(Y - luma)    bpp[0] = 1
(Cb - chroma) bpp[1] = 1
              hdiv = 2

For plane = 0 (single memory-plane formats):

factor = DIV_ROUND_UP(hdiv * bpp[0], bpp[1])

	NV12:    factor = DIV_ROUND_UP(2 * 1, 2) = 1
	YUV420:  factor = DIV_ROUND_UP(2 * 1, 1) = 2

Then I will leave the wording as is and changing only parenthesis part
like Sven suggested:

	(e.g NV12) --> (e.g. YUV420)

Please correct me if I'm wrong.
If for you is ok I will fix this in v4.

Kind Regards,
Tommaso


> 
> Sincerely
>     Sven
> 
> 

