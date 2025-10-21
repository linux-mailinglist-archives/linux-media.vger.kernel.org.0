Return-Path: <linux-media+bounces-45100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD43BF4587
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 04:05:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E0CE18C5E73
	for <lists+linux-media@lfdr.de>; Tue, 21 Oct 2025 02:06:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62CF42741CD;
	Tue, 21 Oct 2025 02:05:48 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021092.outbound.protection.outlook.com [52.101.100.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90721F91F6;
	Tue, 21 Oct 2025 02:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761012348; cv=fail; b=Z6wn3FutvAk0W1dHjU+SB8cKscQCwOAlGfiC4Nthgsf6OAZBFvzp6dTLaWBOCaRqEeTnmcX966g+xXH9sMFBL8NSf3OLW34NNd1tTVL3JuAudXweeNkzH7Ogp7COjIwJO/qMCSM7+GUecmA5ji9Lv9jSLIjs3UlatG99ajhz8lM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761012348; c=relaxed/simple;
	bh=aE0w2Hu3tT/vhJjX+v9XIEEPrmQUEtgcrWxVJzkZF/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ot063iNPjemStyfl/GiBSvbZob17DfonhEySgxCsKYsAen2fk6r8ANGskl5lxOjYM2dpz1wVyuhSNPKfqudUmCocKs7vqmmNHrZ9P8A/AQq7tRo8e6BKlM2SBkkzfH+tEVzmlBXaaw6nPHccbIOJoPQrHRIi+9L7hMDxsx3FyvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com; spf=pass smtp.mailfrom=atomlin.com; arc=fail smtp.client-ip=52.101.100.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atomlin.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rSe5IrHGETcy+OuotL4in3taiiGjfb3BxOvFlU1sP/C6S2Oppd2vk5SaK/0T7cLokOfFrov//0vvVFg5n+zdZrN25smA6r3BpMiSkhBJm+5wS2ZHg/o+tU8kAsXfYiweg4kGbDfYmjfkYn6VAXEEZYs1kwPG9Oj1MjQABFTDapDdruV4escZ5cAJSIMwck9Xnwjr9PbGAtOyJdu2kWO3yAsCsHcSXdiMmQyNhk+c3eoYkGFfyRimA/Xj/d00F3zIWEqvl6n8Ma6gJ4a2CeQ8FWMQynHaCo+qYEFgAInLR2sYvPzZ/XAe8qGiQP3LhVcsN3V9enpz9oH2neohV5+1eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4DxmXDxRia25ZtYO1vGHIBb7Cg3ZwF/1E4k+N/ZePQ=;
 b=Y6NpfqgrQsK19Y1PN0Db+Bsa8WQTHk7KBz1PWYMYWZNBaRi9IiR/tAuRhU6Yr7ciahtQ6GubeByrTfQTL9zzGOeS4MWC9ZNhaD7fgOXNpzliY36BPRJmPCYp/d1c1RCHw2E32QgkMaN+vtwn5DQVX0jdnoGOUgVgLGnM0d9DzBA3CQ5O1tJ8QPa9OGLsUycxlwjE8E6Z8ZRxnuF6VZL1htVueZWVTJGFyLaShjMnXMRcFoMY5ZMoWj5wBKHYb3+nGfUa8JM4HR62s09VCTEf/NmCiV5tWGVO9VTVzK4fo9QINv6n+V2kHHpAUFIcDjcllx2vyjvGB64Ur+PHENywZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=atomlin.com; dmarc=pass action=none header.from=atomlin.com;
 dkim=pass header.d=atomlin.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=atomlin.com;
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:70::10)
 by CWXP123MB6208.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:1aa::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 21 Oct
 2025 02:05:42 +0000
Received: from CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf]) by CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 ([fe80::de8e:2e4f:6c6:f3bf%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 02:05:40 +0000
Date: Mon, 20 Oct 2025 22:05:36 -0400
From: Aaron Tomlin <atomlin@atomlin.com>
To: Kees Cook <kees@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, 
	Rusty Russell <rusty@rustcorp.com.au>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	linux-modules@vger.kernel.org, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Malcolm Priestley <tvboxspy@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil@kernel.org>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v2 3/3] module: Add compile-time check for embedded NUL
 characters
Message-ID: <n5mctxqun4vsohpgy4o63cktohc6okj56qnzjakeqfdwzokndi@trpzynr7smwc>
References: <20251010030348.it.784-kees@kernel.org>
 <20251010030610.3032147-3-kees@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251010030610.3032147-3-kees@kernel.org>
X-ClientProxiedBy: BN9PR03CA0863.namprd03.prod.outlook.com
 (2603:10b6:408:13d::28) To CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:400:70::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP123MB3523:EE_|CWXP123MB6208:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c2ab1d2-317c-400c-d856-08de10465593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SUN5b2gvV1dnZ2llTWNQRXZvRWZYamVyR0ZDUUxxVmxRMTlWcVgyZDlNRFlZ?=
 =?utf-8?B?RkVkS1RuMVVmMzJDUXV3NlVCRVdqK2p2Q2tYVDZrMGVXRlRtRFpBaG5sMEtp?=
 =?utf-8?B?Z01UdEtTaWRtbW5uQU9lSFBqZ3lFVlNiMkhVemtUWTBQTWg1VVRkTWxaMXRm?=
 =?utf-8?B?ejJ5VDc5eWpING56a2FYUTB1elgyS01yZW40OVM0V2Z4ckwvY09KVEFsaEx2?=
 =?utf-8?B?a28xVmJqSnNLRmhXajR6c0VNV3lYQXJ2a01lOGpXZFdzSCt2aktCK2xtMlh4?=
 =?utf-8?B?dFNVZkFtekE0WkZPZDNwVXZoZ2YvUXRYdVRxb25LTjUyL3BUT1NqN3J1My9N?=
 =?utf-8?B?SU00dS9Qd3hhTzBGVW9wOUZRS1phWkZnRlJWWndwdHNmR0NFZGJTSW01aDFp?=
 =?utf-8?B?QjZFTlRVUzhPbVZoWEJQNjZGRTdPQ25uZ1YyY1REZDByam5xNmJjdUVOT1Yy?=
 =?utf-8?B?T3dzMDJJazBFRlBjdTdWVVN0RjBpSlhmd1AxRnBrZ2R2c29wK1NialBLN21Q?=
 =?utf-8?B?NXFzMmJwdFpya2FJZm5wcXMySHRyRFl6QjdRa0w1dk5rOEIyNlhtTHVUd3NX?=
 =?utf-8?B?R0l1VWtaVkJzR3pRcGp6UWxrdVNXd2tOTVRXaVMvc2Z4aFp5Mmc4VGpGZzl3?=
 =?utf-8?B?WUFWdms5eEQ1KzB0RGFzYUxMWUU1WHd4a2trN242Z3NvUkJBSWF6SWRIL0tC?=
 =?utf-8?B?aG0vWGtsaW1FRDh6MCt0VnFJWDFjK1IrMjNicU9iRmMxZEZKQ0RzemdYMWxu?=
 =?utf-8?B?VVV5VGJ6dVdSVVUrWmp4S3BoZzVFOFdSdEIrZUpGdWF2L08wWG9EQUQ2MnZv?=
 =?utf-8?B?bWt3K0VEa2NpSXhROVVhd2VGVE14eDM3V2ZYMktGSUI1MDdsM25lQjBFaHRy?=
 =?utf-8?B?d3lzaUx2bnNKL2tjUFFYY0tpQ21mVU5iZFdGZnhYVXpCa0h5RlpWeEhYWm5K?=
 =?utf-8?B?bVU1S1h0dktKOWxJaWxna1hSNE5QL3NQaHhmZjlXSFlLckNRZGVmQU12d3k3?=
 =?utf-8?B?ejhVNUJXeVRxWGFHWnJ3WGExRXRWak1uTjhSU1NvczN0aVFWb1NpVk96MjBp?=
 =?utf-8?B?K3VGKzFLWjBnUUhnZWVBZmI0bVBGb0JxRm01dy91M01oQzB2dmp0cTRHai8v?=
 =?utf-8?B?NUdGUGpOWjkvVnVJVDNxWEdabFdkZlQrcERZNml0NzBKK0RhK29HRU1FUWQ3?=
 =?utf-8?B?RU5KWEJwbHh0b1RXMWZid1ExdmxSOTlxa2dNdUorV0liR0dUUGNVWHRNdzRD?=
 =?utf-8?B?L0dtOS93MGZuQ3RJZDl4aThvMGhhTmN0eG55V203QVZ5OS9XaEVpSDJGOUFH?=
 =?utf-8?B?YnZTZ2RYbXh5SUtGeXpyWWFCUFd2cEExMnhDcUVDM1YydjJyOTVnSVdkYjhs?=
 =?utf-8?B?eGtibUNMVHFPSTFtVkxjZWVQdzVLZEI1UDZHU2tNeXhpeFFXNmJ6NEtVdU11?=
 =?utf-8?B?eVpoWUJWWUFFQkdJK3lHOVZWUGkvbU5EaU1qZkZ2UVduM0x4QUZiWmorMzk1?=
 =?utf-8?B?dzhsUGtrejc2M3ovS0ZleWl4UkN2ZDRkNDF1bDl5ZnVZM1AyVyt3TTlzRjNr?=
 =?utf-8?B?YnAzMUVCTkxEZlRiUEJYdmd4dUVTeFJIVU1NdmhUYlZWcExlaWF3MHZZTlA3?=
 =?utf-8?B?K01EZnVIS0FLV01MYlhwVjAzQTUxV2JnUjZvR05jZFNESzBXZEJMZHZzTWpk?=
 =?utf-8?B?SWFMdHh2b25BNFpFMlNGV3JjRE5xTkROTmpoN0NIQnRrWjBqN0hSaE9oWDUv?=
 =?utf-8?B?WXhSSGN3NTBHRy83SHBvUG5HUENnL1RWMDltMXpHL041ZERBMWUyK0hNSDVw?=
 =?utf-8?B?L05jOHB1cElnNXc2YTBIa2daV1RLMmRoS0wrM3QwWXV2RWNNQTVNVitFWDA0?=
 =?utf-8?B?a0tjTUFYaWZFS2lpTUltbmtpTmduMlQ5OEZ6QithRHorZ3c1dHdpRloyaFVy?=
 =?utf-8?Q?0MkXUTYeZAP3QdDcmW0dMpNGbLkgyclB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L2pJdml6VWtCUmRKVGo2c3lXRG13c3BPd2Rsc0N3V0t5WWN6Z2tVRjlpcUJm?=
 =?utf-8?B?WkxBbkk5ajVSa1FyQnFVa0FucVV2YTVuTGxMbWhQZ0R6RzduRTBJYVU0Um4x?=
 =?utf-8?B?c2JlTHJKenNMZzhmRnB6UDBYSnBSOCtBWE1tcGtqL3U1bi9lWEdYam9nRnJo?=
 =?utf-8?B?L3hhTEdlRXd0eHc1U25KaTVNYUlEN1lYQ1BxN1JsdXJzWW1ObXI4cFk0QkZX?=
 =?utf-8?B?cW1UbWxyNXkybnUzMW8vQlJWd2oxTC9wTXZ3Q3RWU0U2SVY0UStTOWc4bG1x?=
 =?utf-8?B?SkxTMFU5amd1TDYwaU1oWVNMMG1YeC8rWnlzN0dWRE5qbWNpQ2tpNE5wNjRv?=
 =?utf-8?B?Z3BvR0p0WlNhV1BBMG5lSktUQXlvOVdFbk95VGk4Y2d5dHpKK2ExYm1Cbkxs?=
 =?utf-8?B?Y1ViNFFnazgvdzVTYTdVRyt4TnlrN2lGb2ZJSjZRMWdCb200S1BIcVFQd25q?=
 =?utf-8?B?ZE5SQ1JZRGswVWYxRUVXTk93U21iemNiZ0g5NFg0NVpMQ21INGFSTEVQVVN3?=
 =?utf-8?B?R0d2cHYxRTkvRmlQbDhRc3UxMGEwd0FaWVlmSi9JcE9saDRFMFV5WmxBSEZl?=
 =?utf-8?B?aXJYanRLS2RwdlZqZ3RJdWlJS2FSOUhUQ1AvNUJiOFlaRStVUzBVbXdXbVpv?=
 =?utf-8?B?M0tndzJTcHorc3ljeVZhcmFDZjhhSkVVSkJocGZJZTNrVXdGSUF1QmhHVDdp?=
 =?utf-8?B?MGdrR0U1NkRSSCsvNWE3ZGJPaVVDYU1WVzlScEllVEFqeGJZTkxVTHNKWHhC?=
 =?utf-8?B?OXcrZU81dzZQelp2ZFV6ZlBCNmZpdlRlT2dEQWp2NUdFMGJ1R3dpNkdlSElz?=
 =?utf-8?B?OFdRbzg0djNIZ3piL2NleFZoNkphNTNNN3pDalpxT0xGNndib2dtdmdVWUNK?=
 =?utf-8?B?WUdEUmJucVFRa0ZIZEQ0WWJhemRydk5qbkplU3gzWlVpYVR6UWp0QjhCMncv?=
 =?utf-8?B?aG92Um9pOUpOUXh0OHg5OWwvbkhVVkZmSGJiS09haFVoN1YyV1ZLTlc5ZnF5?=
 =?utf-8?B?WFdLdGJqQzhhK3dGcTE0eVBLb1hYUDFXaE9qeXZ1UjkyVTBMamhrTU5pdWtV?=
 =?utf-8?B?RlIyOHhOOTB1NEFzeElra2VMSDRiNFVHWGcxNGU1VVpMYVpJSjNmcHh6VVdp?=
 =?utf-8?B?QVk4RjZPVndsRjRLMVpVU2lwRDZVZUU5bnJJSGU5SHQ0WlFBR3MxMHRneEI5?=
 =?utf-8?B?S2EzQjE3Z1ZhaEVQMDU2WFk5dDU5czZHZzkwbmZNUWlYRmRPdGQ5bzZqRW1Q?=
 =?utf-8?B?THkwZ2ZwVzFOTEM5azRsbXJYMG5kc1dEZjc1czFVQlBMUEpWbzJvWjh4akZO?=
 =?utf-8?B?T0Q5dGorbmFhQUY3cGIyUUsydmRuYy8ybStKNkFuQlk3MTZ3NlczbGo5Um5s?=
 =?utf-8?B?VDNQTm54RHZWUVJzdldEbFE4NUlhSWpoWVlpcUNBRERwLzhZWS9uWXc5aHpF?=
 =?utf-8?B?U0laZlllOVJmUFV1Zkh5am42YjlrdEcvY01tZGp2KzFzQS9pV2NLZFh5RWpz?=
 =?utf-8?B?dnkyZVBEc2EyVjN5KzU2L25rbnBXMy9VZm8wUm8zL1lnKytTWmpVQ3ZvSHZi?=
 =?utf-8?B?L2dOc3BrWlZXT3ZzR0RicERRbjB2Slc3bUdWVHF4Ky9EQXRsY1JvdXJXTlRs?=
 =?utf-8?B?Q3h2ZXB0TCtaUzd2UkNiSEFsUG1xZUZIV2dmdmdLYkpVdDB1cElVV21Yc3V4?=
 =?utf-8?B?ZzA3N1kwdm0vNTBKV3JZZVNuOVhFRmVha0dxMi9GYjQ2dW5FeXhRV1RaSnV3?=
 =?utf-8?B?RFpLdk1FVnpzWHJVa3d3Q1BpOXJYSDZ1NTEwLy9tRWZuOW9UVHhCUW1Va1lK?=
 =?utf-8?B?Z1Yxb1RMa2x4aFFRUjlmMHFIWDBHWjhOMUtIcW9JekI1eTJTK1FKell2NXVy?=
 =?utf-8?B?S053c1RjU2I3V3pxZmdkUTEzK2tUK2FrTXVzNis0K0toMGRYdEJxMDlzQkxZ?=
 =?utf-8?B?TmZCZjFmc2U3NzZUdHJSVkZGalNnNHBFaFIzdnJmM2x1aENoclpaMUl6ZFlJ?=
 =?utf-8?B?N3J2YTkyMGtGS3p4YUNHYVF3TFNCK3RGYkpVWnQzeUEwYTVwZHZyMm0xMHZ5?=
 =?utf-8?B?bFI2WXNJSkJ4REJFcm9Ick5lc1dJNnNpNGlDdit1NldnMi9RYVlPU3Q3cm1z?=
 =?utf-8?Q?VFiA+SCVdb6qfB5nhWL2lHAXX?=
X-OriginatorOrg: atomlin.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c2ab1d2-317c-400c-d856-08de10465593
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB3523.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 02:05:40.5684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e6a32402-7d7b-4830-9a2b-76945bbbcb57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: //uN8s59+EJkt/m+0WvcjXdeI8Y9S8QtNkIEgAE6svMXCECnEGY0kEUVHu6Rkx6Qdj6decVXa1lrn/O+Ie1HQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB6208

On Thu, Oct 09, 2025 at 08:06:09PM -0700, Kees Cook wrote:
> Long ago, the kernel module license checks were bypassed by embedding a
> NUL character in the MODULE_LICENSE() string[1]. By using a string like
> "GPL\0proprietary text", the kernel would only read "GPL" due to C string
> termination at the NUL byte, allowing proprietary modules to avoid kernel
> tainting and access GPL-only symbols.
> 
> The MODULE_INFO() macro stores these strings in the .modinfo ELF
> section, and get_next_modinfo() uses strcmp()-family functions
> which stop at the first NUL. This split the embedded string into two
> separate .modinfo entries, with only the first part being processed by
> license_is_gpl_compatible().
> 
> Add a compile-time check using static_assert that compares the full
> string length (sizeof - 1) against __builtin_strlen(), which stops at
> the first NUL. If they differ, compilation fails with a clear error
> message.
> 
> While this check can still be circumvented by modifying the ELF binary
> post-compilation, it prevents accidental embedded NULs and forces
> intentional abuse to require deliberate binary manipulation rather than
> simple source-level tricks.
> 
> Build tested with test modules containing both valid and invalid license
> strings. The check correctly rejects:
> 
>     MODULE_LICENSE("GPL\0proprietary")
> 
> while accepting normal declarations:
> 
>     MODULE_LICENSE("GPL")
> 
> Link: https://lwn.net/Articles/82305/ [1]
> Suggested-by: Rusty Russell <rusty@rustcorp.com.au>
> Signed-off-by: Kees Cook <kees@kernel.org>
> ---
> Cc: Luis Chamberlain <mcgrof@kernel.org>
> Cc: Petr Pavlu <petr.pavlu@suse.com>
> Cc: Daniel Gomez <da.gomez@kernel.org>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: <linux-modules@vger.kernel.org>
> ---
>  include/linux/moduleparam.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
> index 6907aedc4f74..915f32f7d888 100644
> --- a/include/linux/moduleparam.h
> +++ b/include/linux/moduleparam.h
> @@ -26,6 +26,9 @@
>  
>  /* Generic info of form tag = "info" */
>  #define MODULE_INFO(tag, info)					  \
> +	static_assert(						  \
> +		sizeof(info) - 1 == __builtin_strlen(info),	  \
> +		"MODULE_INFO(" #tag ", ...) contains embedded NUL byte"); \
>  	static const char __UNIQUE_ID(modinfo)[]			  \
>  		__used __section(".modinfo") __aligned(1)		  \
>  		= __MODULE_INFO_PREFIX __stringify(tag) "=" info
> -- 
> 2.34.1
> 
> 

Nice!

Reviewed-by: Aaron Tomlin <atomlin@atomlin.com>

-- 
Aaron Tomlin

