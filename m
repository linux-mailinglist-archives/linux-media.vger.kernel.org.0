Return-Path: <linux-media+bounces-25849-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A92DA2DF4E
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 18:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5F9B164B95
	for <lists+linux-media@lfdr.de>; Sun,  9 Feb 2025 17:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 197CE1DFD98;
	Sun,  9 Feb 2025 17:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nHodloai"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB27F1DED7B
	for <linux-media@vger.kernel.org>; Sun,  9 Feb 2025 17:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739121288; cv=fail; b=f6Az5QgcHxBwLI73sVhooA1QYDVpXxFQg5nQfL2dDYfdW272exjw0ZJStNesklgyiDVZvU07zleaVUOYai5MSAEKY7wsUBmBQqNwtw1RnFX5pFGDICdq3abpSgnb7kGxOlJ6uNOjbbrI2O/OxtE4XN+ijfrSB3igqUxbGfNwmaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739121288; c=relaxed/simple;
	bh=yZeXrFXKX7ZK3m23a/KjnCFdowNosjleZ2eyYsDkqeM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GE2jLaEQyWCaqkHBp3c5yB7aYhoDKWgMoczu9BCMy3GQa96mUA741R53TblyuEWWs8lhYxNJ1UjD6Ovzd02LiK9JCMFcuUrsuWKwwP1FkG9vFjR4Jz6GmpbjAXb2Oqk0hABsuJnUcNwMi8P/D9IK93neALX8i/OWcfPiZWMJHgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nHodloai; arc=fail smtp.client-ip=40.107.20.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2lqnuDvHnKSZalet3yfPEdqr8VQIPW4N4QIuMX3jX189bEIN0eiGdc4Ox5d0A8u+bKqGX0dB942OZ5C07n0K1GA89HmBG82zLzbkhgLgViGu9VTPFJad9I9QZUAIYtjJC0T4/aRL0dV0tJ2YY78TgheVEYXRsdzmU4+ADgyCCCZeF1qTE+XJwXZdQt+wbUOcCZTQkEMQS3aU8zU1k63gamT+NPNMtHzbol2syg+9ffLj7QoAycSAMR/jvBJK7YYXsLsRA8Rei2RnPg/qMIrKoKWpFkUzUq3/mQyZRJbDBlxelguk40hrvlS+5r1OP0qKMfcs32+szUhWUp6rUdjqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNjKecz/rQvo1Vub5dxhhU0Pq/grnqTH1LVC2Y8F3r0=;
 b=qp+pGsiM7XYn8fCaz3+f7WKqzkhTZm5SoKa3wPFQcxCRKCTUXGQcmGJiNbdcswEusaPuQ2K/Rg147ulWOeIPqBa6jszjuxTN5Ao10JF32c3v7wKn31PdHFBdZ6zYQ5SbJ2EyCqhOThI8Da9ufZiYcUZX07zPY2kwknWL7BKxZmqkrhtzNngsaaJc1iD/FzOL09HQhtu2IQeeU0DseU8LyXV3TUXrHvessRc5rJCbPuVumJgWSJ/FyQhuF8Wz04sIeH49IEV5AVCMrAzpf5O2iltDkKwcv9uy/QUI1qC2XPD7D/Z/LhUxpTu3vc+XJT64uJmkNGqCFIRkdFOi43nslQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNjKecz/rQvo1Vub5dxhhU0Pq/grnqTH1LVC2Y8F3r0=;
 b=nHodloaiqQ2P0yH7UqZcyZj+niT2CAa/GUIjaIzVoNpLAGRGW8i5yJfjZa6/Fgd8Nf+E7Mat2VymHzkNNC4d5hVUPc40TgGCjUwDXbeiNxJfevIY2a8CWQgrFgtEoUh0I6vOw9L/1gdBoL/NcYWCkkMuCKzE4OmoWg43cby7Z76lAMRSxZOgzcRt7jf6LVy9pSOk5e1FBqRGg3SyE0I+7mfRYcoh8Bn2BbJZza20srooMF2qiQ6cwnZUMiGAtUHH0slfzM9kBPqVaXRG5/IYt4bQkPrwnOHvy8pMvbYGlTqU4T7meT+ABzYbHzD46vsEfdhN8MmfjoaBSCjlXTrjtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PA2PR04MB10280.eurprd04.prod.outlook.com (2603:10a6:102:403::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Sun, 9 Feb
 2025 17:14:42 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%3]) with mapi id 15.20.8422.012; Sun, 9 Feb 2025
 17:14:40 +0000
Message-ID: <d8ab166b-c0c1-4a29-81e3-91e02882f177@nxp.com>
Date: Sun, 9 Feb 2025 19:14:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 07/15] media: uapi: Add V4L2_CID_COLOUR_PATTERN for
 describing colour patterns
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com,
 Prabhakar <prabhakar.csengg@gmail.com>, Kate Hsuan <hpa@redhat.com>,
 Alexander Shiyan <eagle.alexander923@gmail.com>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Julien Massot <julien.massot@collabora.com>,
 Naushir Patuck <naush@raspberrypi.com>,
 "Yan, Dongcheng" <dongcheng.yan@intel.com>,
 "Cao, Bingbu" <bingbu.cao@intel.com>, "Qiu, Tian Shu"
 <tian.shu.qiu@intel.com>, "Wang, Hongju" <hongju.wang@intel.com>,
 Stefan Klug <stefan.klug@ideasonboard.com>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>,
 Ricardo Ribalda Delgado <ribalda@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20250203085853.1361401-1-sakari.ailus@linux.intel.com>
 <20250203085853.1361401-8-sakari.ailus@linux.intel.com>
Content-Language: en-US
From: Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20250203085853.1361401-8-sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0142.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::9) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PA2PR04MB10280:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a405ed3-9a2c-4264-6763-08dd492d3d1c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?bm56amcyVDI3WlhUTU9Bdk1taGljdDBTQnF3RVRJakh3dmVMYmdJS3laTkMw?=
 =?utf-8?B?Rjg5UFQ4ekM0VEp3UHV5OUpPbWFZQTBWQmJ1MFl1RjlwTkMycHUvajErblhP?=
 =?utf-8?B?L3FHaHBvMUV6U0RoR0d6WnAvR3U5R0Z5RGhRWVNRQ21KTXlxZCtFN0oxMVhz?=
 =?utf-8?B?MXRLTC84VlNEWUNydE5aWStUU05KRHVOWnAyeHY4Zkl3M2VobHg0clo5YUFP?=
 =?utf-8?B?cE9ZVU9CYTNmNVVUd2RKWkMrSlhaS2JVWUV5b3pGbTNSdWZwamUxVHpoUkZt?=
 =?utf-8?B?Z1kyNnFhcGNHbFRmVDFPNFRPNEIvWDdMVEVJM3V4eHV3TG43SzMxLzU0SlJO?=
 =?utf-8?B?allMUmlkQlRwUWljTXJuWkRoSnhnYW9ORUNsZ2M1Z1poQUpxREErc2ZxNWhO?=
 =?utf-8?B?cEgvS01rUzM5THlscmNtQ3lkdjNxS1h6bE91OUZxdFlDUHNGWWJnaHJDc3Rw?=
 =?utf-8?B?QkZYUkFUR0RTMnVFL0NUSzVUQnREMjRINlZoei9aU25GSG1RbENLQVYxeFpR?=
 =?utf-8?B?Yi9QVkJiUXc4TVRVeUpPVU1icjJKNXV1UWVKQUlyb3JHdWh1cStWUFZuSDRM?=
 =?utf-8?B?V0pvRnMrbStUbWFTNzJCS3NwYmw0NExGWjhKeXZCZnRnUlFVVTZ4TFp3VEZv?=
 =?utf-8?B?WlF2U2s5RlRIcEpyeVJYSE9PVWdVekRidTJmZzdESTJqekNrN3BEdHllcFBW?=
 =?utf-8?B?enBMRnpERjZjeGlhRHROd1M1eGI3OXZwMzFJK1hwMEcyd3FtSVdqbWo5czNE?=
 =?utf-8?B?aWtVUTVjdVh6eGhPZUxXcmdrNFVHNjZpd0dnc0hFMERGWHI5OVdIb1ROSUVB?=
 =?utf-8?B?Z05NSTI3MjIrYlBQb05sQ2dhYnNwNHhyaDIwN3liMkNMZUFnL1NmMDU2ZEFt?=
 =?utf-8?B?MGhVVjdnU0xmWnJoVmM1RmJxTVFLeTNQTFhwYkw2WHBHV1FlTmg2K1F3SUNS?=
 =?utf-8?B?SDJxcWxHNkRhbVVUd0V1VkIwbWhYSndIbXJISkQ1L01pa2tIU3N3bnVhQUh1?=
 =?utf-8?B?cjlwaXhWRzM2YU1SUmRpOTMrRWJnS3FMalFpbC94NnY5cjJmZkN1Rk5wUDc4?=
 =?utf-8?B?bWNVSFZvREF4UDJXNFdmcUtrRnp0VHdsTHFxSDZFNmxSYVNwOWNldi9FMC9v?=
 =?utf-8?B?RUJZK3VRemdXZUxiSDYrRnRYdlhhVVhOVUtJRTVYSlo2MWN2TXlGbk0xSWNE?=
 =?utf-8?B?VFhKVzNBQzRpLzhSblUwK3dUTXVYdlJHeEFXdzA4S2FWSy9Qei9WcjhxT0xC?=
 =?utf-8?B?QWR3bWlZVmxKamxyblVvL2paU2VlSllIa2dRUzd0ZysrRlZTcVU2R003NkNB?=
 =?utf-8?B?K2hEcU02M3VjNFYybEFaQm1FYWp5clUrNlQraXA1NUQrbHd3RnIwY2MrZmlu?=
 =?utf-8?B?MlA3ZVBnTmp6RVAxYWRhaTZMK0ZhMk5qTjBHc0s4UWNrSVU4MFN2SjEyTUVS?=
 =?utf-8?B?Rmk4cktFczhWeC9nNWtQK2RzTTFXeWFWc2o4ZmJtY09QckFGRTNuNEdWbVNa?=
 =?utf-8?B?L2RGRGVSTkN0NVRGVzlyaWxuaUF3NFl4RHhOdk5jZHNyMjdDZWtvakpTSVBq?=
 =?utf-8?B?YWMzdzFMeWVaYzVSazhCVVJNRnpSbXk1TmRXeWV1c1lMNDJScTJlaGd0LzFl?=
 =?utf-8?B?QXYwelJKazE2ZjAvYnN6cW9VbHFRMHFHeGNNTEs3eEtXcVpzVXpmd01YV0lM?=
 =?utf-8?B?OUxIQlJlWFdiL1o5VmlRKzJhcFFZV1ZoQmFpVVg1Y3NnVXczc2hRWTZNMFRr?=
 =?utf-8?B?dFVOSW01K092VXo5YnhhcURicmxoYTlrc0l2N1BjTWhoeGlRdk8zb3FoY3Y1?=
 =?utf-8?B?bDRTc3pmQkZpazJGU25weW02Y05UUkcyTm5vT0hQZlVEbDJIQmZLb3VwN2VW?=
 =?utf-8?Q?n6zv5oUOiWOTn?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?OU4wV2dIZGpJcjZrMjlPcC9YMVVoekVhUHllb1JLR3k4d1hIYjg1MmRxNnI1?=
 =?utf-8?B?dlV3Z1JXcmFnd0xxZUd2SDc4L21QVGdoMXhscDNGb2M5NC9wMmwrZFdFak5G?=
 =?utf-8?B?L0dUWGpoMFNSV1pzcVMvU1QyQjJWdVY4a3dFUnE0Z3VMT3JiV1pjamtUbVg5?=
 =?utf-8?B?UVI5dkkzdGs4VzE1U3cxY1F4S2c4VWNZMU1YKzZDNTZPSlJ2UkJZK1QvL09T?=
 =?utf-8?B?S250MlM4OEdaa0ZTMmRVUkhsVStuMjVIU2F5QlhHUzNobGdZVWljam54V05q?=
 =?utf-8?B?YjZSRkNvQVR3Y3NmcEYxKzQ5WC9sWVZSSmg4YmJabjBxWWxqSjNkakJwaC9L?=
 =?utf-8?B?V2JPYjJ2MHR5QmpaLzQxSzV4dVNuZkp3OFpmcG1nMFREcjJFeENXSHdnTisy?=
 =?utf-8?B?UUFnNzBVZFY5V3RPZm5uV0FScjJFZUxWSTM4MVpraERsSytha0lyVkxmQ0Rk?=
 =?utf-8?B?OXlibnRnV2ZFNERYQjY2V24wK3VCNzl3UlBjaXVKdjhNUUc1TGx4UitWSTVO?=
 =?utf-8?B?VFkzUDJ2dE83eWVmS0FkT0tXQ2FBSW94bGpYSVBnb0ZVUXNQSnduZmNFT25S?=
 =?utf-8?B?Wm5la25ZQzYydkwzR2xFY0tKSUh0SlZCRndOUXhXNFBHcHh0T3BrSWFOR29x?=
 =?utf-8?B?dkdtY2xPZUtUV1lqRWlWWFhtTUZqQjkzZ3VTTGdrdkhJdm5LSy9uNXNGeVd2?=
 =?utf-8?B?cTYwc0FtaGVMZEVrUmowTlUxVTU2UTJTT3ZtcThkS3I4dG8yVkJhY3VOWnA5?=
 =?utf-8?B?WE92U3AwQ0h4YW10VndkZExJTklXN3pJenZIekpWYUdsc05MRGtGcVpEVmpi?=
 =?utf-8?B?OWQzdEVtYkl5MDVXZXJDTDdpOFQ5Ym9VR3pMcnByaitEUGU3eFExbDJwR3Z3?=
 =?utf-8?B?OGQ5WThCYUlUWmlGR05zU2w3QVJQNWg4dFZQdzdvemNIcTRBblJubU9uaTRh?=
 =?utf-8?B?Tll2RUdjT2VQNm0xR3VYcTNaNUNKd1FYVjFwaVd3VnJVVWpyTWxYcDZ5dStS?=
 =?utf-8?B?QnViYTUzeFhrb05MMnhaMm5oblBBZkt6ak1LRFFma0RrMmR2NFVUUURSOWd0?=
 =?utf-8?B?UmcwaWYvN1NUUGZaWW53NzNxd040TzZLYzJLeUJuNmQ5SFNFcVhOWE4zdUtX?=
 =?utf-8?B?bDFnaFdERzhNOWdHb0dJT1RjSjdsbDNNbmsxKzJPeGZSRTFYcVVkbjdoVHF4?=
 =?utf-8?B?TGJlRkRobSt2NkxRVEVRSk91REpxL1NnT0hLYURwNmw5a1JGU1RLZk5STndw?=
 =?utf-8?B?NExwMk51WVJqckVjV05CVzlRTEFsTisrYXdQT2FhTEdWQ2hoSWx6dDJzTmt0?=
 =?utf-8?B?c1A2dkF5eUN3YncyYmp2OUFScEcxUUsyL2wyOHM3RnNGalk1QzFiWE5ueDZZ?=
 =?utf-8?B?a2NUR0h0UzFLcTQ5dlorUCtFSGFiWjRqRWtURzFQNGtSQzh4bThON2lkSVF2?=
 =?utf-8?B?NkMvd3drSGFLTGY2TmtKVUs3Rm80WVB4TkFIR1pIdFRwVFFQeXJtT3k2Mjhi?=
 =?utf-8?B?SkxvN29QbTVOZm4wWTVXajc1T05KUnl3UDcxWExqdVZia1h2Zm9wNlhhWGpK?=
 =?utf-8?B?Y3B6TVhzbUVpZURIZllxSWJ1L1RPaVRCdC9iMFhMdXZhWERrSndvVTVWSFRG?=
 =?utf-8?B?a3YxdS9kc3BTVU1Rbm1JQ2xreVZUQnVoUGlmQTJmRVhSWml2TzJkRkVZbDhW?=
 =?utf-8?B?cVVYUUpvaW83eGpocWkvUEE2aVdYQ1Voc0NKQ3ZiZVh4Zm82aFdoM2JPeVI0?=
 =?utf-8?B?RWc3KzRSRFRTVVp4TFAzc3VOdVl4bGVOOUN5dzFwZXM0aklsbSsyM205Y2pC?=
 =?utf-8?B?ejFpNmFaK1o0aTBvVGxEMFpMMHdNc0pyZUFYWGF1M2VvTk1QdVVzZ0UxQ2ND?=
 =?utf-8?B?bmEyd1ZNWTg3VS92emtzS0xSOG5PNlJJSXlsMnhZRXo3K2NBYndjSGkxRmhw?=
 =?utf-8?B?RktnVVJtY1FSdndrakYwQ2wxaUFUU2F4ZHRvNG13MitkaHdZYlhKelZlcUhI?=
 =?utf-8?B?TGFyU0phcncrRXBIN1l6Ti9IVHhPa0dabzcxOHZLTVY5Qnh6VnhKTWZCN082?=
 =?utf-8?B?RkN4YUQ2cUw2eFRpclFZdjdiVzdBSndLaXJidmxsZ3BQdjhLMWxFRDJGa1kx?=
 =?utf-8?Q?ACFGlefXAAp+0ckgH+fVbQ61t?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a405ed3-9a2c-4264-6763-08dd492d3d1c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2025 17:14:40.5335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q1R6xQTIbAuVWr9ZS5JVCbX0rinob5YafDGJn42yEebovc9DSQEahXUMKus5jwTBcYCddUeczse3W0qjTCpHRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10280

Hi Sakari,

sorry for my late response.

So, this control and the luma-only mbus code is expected to be used for 
all raw sensors? Or can raw sensors still use BGGR mbus codes without 
the color pattern control?

I noted this is now read-only, is the intention that the user space will 
only query the current CFA pattern? In case the user space will want to 
change the CFA, is it expected to achieve it via V4L2_CID_HFLIP or/and 
V4L2_CID_VFLIP and/or crop?

What exactly is the V4L2_CID_COLOUR_PATTERN expected to report? Is it 
the sensor's native CFA pattern, or the current CFA pattern with the 
current flip & crop setting?

One more suggestion below.

On 03.02.2025 10:58, Sakari Ailus wrote:
> Add V4L2_CID_COLOUR_PATTERN to tell the camera sensor's native colour
> pattern.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>   .../userspace-api/media/v4l/ext-ctrls-image-source.rst | 10 ++++++++++
>   drivers/media/v4l2-core/v4l2-ctrls-defs.c              |  1 +
>   include/uapi/linux/v4l2-controls.h                     |  6 ++++++
>   3 files changed, 17 insertions(+)
>
> diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> index 71f23f131f97..fca729512b6f 100644
> --- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> +++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
> @@ -92,3 +92,13 @@ Image Source Control IDs
>       representing a gain of exactly 1.0. For example, if this default value
>       is reported as being (say) 128, then a value of 192 would represent
>       a gain of exactly 1.5.
> +
> +``V4L2_CID_COLOUR_PATTERN (integer)``
> +    This control determines the colour components and pixel order in the
> +    sensor's CFA (Colour Filter Array) when used in conjunction with
> +    :ref:`luma-only mbus codes MEDIA_BUS_FMT_Yx_1Xx (where 'x' is the bit depth)
> +    <v4l2-mbus-pixelcode-yuv8>` pixelformats.
> +
> +    This control may only be used on a V4L2 sub-device.
> +
> +    This is a read-only control.
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index 24c9c25e20d1..5b6a4a94f18f 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1155,6 +1155,7 @@ const char *v4l2_ctrl_get_name(u32 id)
>          case V4L2_CID_TEST_PATTERN_BLUE:        return "Blue Pixel Value";
>          case V4L2_CID_TEST_PATTERN_GREENB:      return "Green (Blue) Pixel Value";
>          case V4L2_CID_NOTIFY_GAINS:             return "Notify Gains";
> +       case V4L2_CID_COLOUR_PATTERN:           return "Colour Pattern";
>
>          /* Image processing controls */
>          /* Keep the order of the 'case's the same as in v4l2-controls.h! */
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 731add75d9ee..8e761c38b995 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1214,6 +1214,12 @@ enum v4l2_jpeg_chroma_subsampling {
>   #define V4L2_CID_UNIT_CELL_SIZE                        (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 8)
>   #define V4L2_CID_NOTIFY_GAINS                  (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 9)
>
> +#define V4L2_CID_COLOUR_PATTERN                        (V4L2_CID_IMAGE_SOURCE_CLASS_BASE + 10)
> +#define V4L2_COLOUR_PATTERN_GRBG               0
> +#define V4L2_COLOUR_PATTERN_RGGB               1
> +#define V4L2_COLOUR_PATTERN_BGGR               2
> +#define V4L2_COLOUR_PATTERN_GBRG               3
> +

I see no pattern for RGB-Ir sensors.

For Omnivision ox05b1s RGB-Ir sensor for example, it has a 4x4 pattern, 
we would need something like:

B G R G...

G Ir G Ir...

R G B G...

G Ir G Ir...

V4L2_COLOUR_PATTERN_BGRGGIGIRGBGGIGI

And also 3 other combinations from mirror and flip:

V4L2_COLOUR_PATTERN_GRGBIGIGGBGRIGIG

V4L2_COLOUR_PATTERN_GIGIRGBGGIGIBGRG

V4L2_COLOUR_PATTERN_IGIGGBGRIGIGGRGB


At which point we could have these patterns? Is it possible from the 
beginning, or should we add them at the time when there is at least a 
driver that needs them?

Also, another question, on which tree does this patch set apply?

Thanks,

Mirela

>
>   /* Image processing controls */
>
> --
> 2.39.5
>

