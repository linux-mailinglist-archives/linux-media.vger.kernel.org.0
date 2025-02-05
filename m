Return-Path: <linux-media+bounces-25666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D345CA283DC
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 06:49:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1AB347A30D2
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 05:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6016E21E085;
	Wed,  5 Feb 2025 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="RQJcimB3"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2111.outbound.protection.outlook.com [40.107.117.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEE017BEBF;
	Wed,  5 Feb 2025 05:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738734555; cv=fail; b=V/D4KvR7gff+twbGZwjTdKaJjciZ5l4Pgaoai0CjueyiUbLO5HI3Amh6IzSARh7mX17VnWmKh4gf1nV9MlJN9sHtxiOjUfWm7NwGIgVpLPSQ5w/alyeMFTG61xrPuv7QEDkU6p0Xx65c3Q03DAzBqtiMUhCODnnGfSVwQV2KBaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738734555; c=relaxed/simple;
	bh=Vg6DCJCnb4npHrw7OI5nRTe2EanoIKy4TTnPp6H4anA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W+z79xR7wu9CgOGcJyA63gPUuvbsCoMv3VqyMfynKs24o1aR7llKiRcY+Z+v3Jv/+IixNe733FxpQvzUygC1Crh2TRROoGtVz9ZxwqYq/4IpXECBs6ilyhXGGTtX3k98LDabcT7J+aqf+8MagcHHzwLazZu1Ky00G6ihD6wRPwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=RQJcimB3; arc=fail smtp.client-ip=40.107.117.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTc/vi00ZuUc8II42ow8rEzmcdrlqx+o8zkL9+ZFURS5oBG9Ct9W2fWweoSqOPr6NbxhBOU+zJK5dI7yxqxwxp2trGKlxUOG+2VkrvjdZ+ysWhx8qRH/PWOwbNnzkSn9oeTLVA9GM2Bb5psmT7yoEvoIsoUe3uCKP00GjvjPdTzb2lq5XBXRM+2HryWbZ2HgZjvaz6ROr7BFHsSevlKBphiJlMwY6YHDiNjfxLnptH7+tW+93Npul8Rwl356jY3ueHQn6TTbqy5NaYUp/vloVAz2KFgNFbJe3NiDXJG5gUBsdSqURaf5M8bQaex//uJn5UsRTPEiR8+r0EjRVByiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckfekpxZV1adLpFSB01frwv3yov6uJ+oppNORdHPaGQ=;
 b=ZbTIxRGFxhJMoN5PhWrS08IfH9fWXlGHPNsPUyzaB08f0vgojj/PN2xzl4Ra6tUbexdLu7SeuDpRqlvpw1DiLzS+x7SM2UZ0L8HGUPClzaN1Pqujy8sM5w+M+ih1SLRJ5AvHuNhRslxNuhFbm8MmI4q/B8jlfJpmrwtO2GLfhDq3kpGQvhyQUupgJOr1adIsqGMveiWpr+VsTZyyTR74frcF8Dqa/RXIgO489lPPVwpckJLxsGurc7Z2QcMkOfndbeE0zf8qGLZJ51yt/xrJTAHI+YU2/wu0abjY6bBNeRemCAxobeU6S4HByECi2pZSQ/l2BK+58RMcpH3mbUQxlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckfekpxZV1adLpFSB01frwv3yov6uJ+oppNORdHPaGQ=;
 b=RQJcimB3wkfYX5t7If7RLF9LUii6c1ZxMVDa4NgN20KQns9B72XlVS0hb63mkfP2+KmcgrZKo4KkDT1DB0M+srKM/AHrcf4jV5OW5KaxoyNNQ60CCu7R/XZjg0FVMbtKWTJIaacOqVDXnRXS4Cg9IN4Mjli8rUzrMUzm8TjyltGAjg8aENfQLl/9L92kxCovc2d3nNCYzzd7fJiFBI9qIHVg8HWf+wOXSrSfrdrejLOnaJsbdC/Cz+73KyMZMyHizRt5h/Y2N1luO+WRL/Ej0E3VsCpfzheJznR9lYiZOzE3wcmzpPUCDmjrzn90eBi2zhGMMcFJJk1LCbLjXkfK0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB8296.apcprd03.prod.outlook.com (2603:1096:405:1d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 05:49:09 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%4]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 05:49:09 +0000
Message-ID: <48907992-9738-4c40-8b60-d52895bb0680@amlogic.com>
Date: Wed, 5 Feb 2025 13:49:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/10] media: platform: Add C3 MIPI CSI-2 driver
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-2-c7124e762ff6@amlogic.com>
 <3g6g4ql3vlqnmh4xmqz2kct5aedfwvoqk4juhj4pvqyd2pwcyj@bhljge6xyq6x>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <3g6g4ql3vlqnmh4xmqz2kct5aedfwvoqk4juhj4pvqyd2pwcyj@bhljge6xyq6x>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2P153CA0017.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::10) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB8296:EE_
X-MS-Office365-Filtering-Correlation-Id: fe6823ef-2484-4c5b-5156-08dd45a8cf21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RlQ0elVIRGJjMFVTTGxHMTQxNTB6WklNWm1ucE1QRGhrMnpNSDVubnJST0dK?=
 =?utf-8?B?L29yLzB1SXdDckpINXNZVFVISVBLMWNMa29NVzFJYnhmeVVwdHFrZG0zc1p4?=
 =?utf-8?B?RUVqaDkxZ3kwRTZmUVZpN3RBV3g1MFJJYzVSV2ZMeW1KWUlZUjlOc2MvOCt0?=
 =?utf-8?B?WGdSellBdFgrVXZXeTI3SSsxR2RoeFpnaTJ4NjgraXFEdnQ3djZwc2pPeDF3?=
 =?utf-8?B?VUgzaVR1NDRrYXNjMVpvQUJ4eXlkWDJYNHd0UGdKaXM2N1lZdkJXczJFSVR2?=
 =?utf-8?B?T2xpMkZsZm9ZSzlXYTFzSFR2bUZNWHRESzJhK0NtdGVFaER2cEY4L201czJL?=
 =?utf-8?B?OW53U3R0bE1YRzBYUVJGRHVWeDFKMUs1Z3FDb2tjNi90eEJlRGZZU0dvK0VU?=
 =?utf-8?B?THlGL2NNME8weGwzQjgxbm9tK0ltQngvZzJDOEdJZWxWczRLYmxFMFBXZzhP?=
 =?utf-8?B?d2hxOTdMbVZrRzBXYkw3NGlyaUVEQXRLbnVNRFdwZUZXbGd2NFZZZG9lMndB?=
 =?utf-8?B?VnYwQzZZL3JtcjI0b2tOVkdpenNVb2xKQzN1Q1hoc3JZSFROQmpkcnVnZU9M?=
 =?utf-8?B?ZVM4bEV3SWJKbGZ6RXBNcXpuVDdYTTU5anNXWTV5NUUwb3J1cUNOZG0vclRK?=
 =?utf-8?B?VzdEeFJwdC9JdVJZcDgxemNhSjFwTmJvbE1GS0ZQNjkzcFRLcE9KZkdXZVZ0?=
 =?utf-8?B?UWtPYlZMUXJOcy9XN0ZBQ2RYTHU0cVlFYk5CRlFuc3JLVWtyTmZOanRvTnZG?=
 =?utf-8?B?eVdOOTZvcFdDdVMyWVZNTFJjNytmUlRmZnMxd1pZaWY0ZmpsOFRVNVNJMGVP?=
 =?utf-8?B?eE9OYmVrUjcrUEdmTjhWKzAzZG9zbURmM0NTYkhHZ2ZEdFc4bEdZdmg1RXda?=
 =?utf-8?B?bzZNUEUxazVvZldOZUE3VzFrSlBScWtNNytkUlZaM0lza1Z0ekFVaDZwTnNM?=
 =?utf-8?B?ZUJ0dmRFQkZmdmttVzRaMHduZlJsZ2ZXbzdQR3ZnS2JMSHo2eFFtSHlObVor?=
 =?utf-8?B?eU9ScDFpVmhnQk5xa3dHOVlGbzhRM1h1d1RkWXo2OEFFNFdNMjk0K0gzUFcr?=
 =?utf-8?B?M2dHeUxhN1dOYjZ6ekpLOFA0RGlpb0FTTjVXZEhQY2ZPbUlaYnA1Ry9Tb3gx?=
 =?utf-8?B?bEh2THhoNm9RRXpHY2RTZzNLT1RSSkMzQlc2bXpvVzZhWXdGbCthZ1ZOLy9F?=
 =?utf-8?B?RTZFY1ZjemhrQkZFcXFXbytYWXREakxmV2JoRWxXdThEbEwxT0N0ZG5vRU9W?=
 =?utf-8?B?Y2VCNXNRbWdMV0NoT1FNblRXNzhlS3RsRzZYQTVqd0RDcmNObFdQblN5eVpl?=
 =?utf-8?B?cXYxT1BheU1kOHRTTmdPckhGWXN0VFF1aDNtV3gyR05GY3FiWllnKzBlekY4?=
 =?utf-8?B?bUUzWlZJN2xtWEZJYlR6aXVtdmgzbUZzOE9IVUFBaUZ0VXhmNmFYYWlJZVpp?=
 =?utf-8?B?V2kyYzJYaTd6clpVZEhmckl5cnB3T3B2d1lWV3M3UGJUbUdTWTg3cm93SUln?=
 =?utf-8?B?UmxkVDZ5U0JEcGZuQnlscnJBOE5KcmQ3NllyZUk3aXpYQmVZYVNjeGtvRjNR?=
 =?utf-8?B?Q3ppbmk3UUFSTnlHUlJ0eVRXbVlXaEwwYVZBbkdBdmcrQjRsbGRKSStkQjc1?=
 =?utf-8?B?Z2ZXU2srWXNiMkZDRnVGNTlMTWttaG1ZRkJ2T2JjZmU1UFFYVnFrUWo2VVhR?=
 =?utf-8?B?RWpOUUhwT1JLbjY0d0ZUSDBGanRNdDNtRlF2R09wOHJLNnNKcWcxWVdlbk9m?=
 =?utf-8?B?QWh1elNmNXNackw1RUxIU2FtQm9CWE4wZWNrRkNuZzNzRzJFZkViaEpyd2tW?=
 =?utf-8?B?UlZUOVkvdm5wY05rcDF2UzkwVlFEbUlxTXVRdzVjT1hwSFV5MldyWDlRWDFX?=
 =?utf-8?Q?/w5tNKxDkxRjM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TVBmRUdCWkJkMGxCVjYxd1M4MzhnYlBCM0NBWXpCNDdmQ01mMVRGV0Nidjk3?=
 =?utf-8?B?WmcwVnREL3BTMXB4NWpURENZbTJ3cWRxUThjclpCR09heFoyM2NGdG9EMHVm?=
 =?utf-8?B?UGdSb0xDakhCYmF4S1VCQnJtSWc1Y2lWNEx0cjFiTDNtNDJHZmdmRFF1aU9Q?=
 =?utf-8?B?V2pIMy9pQ05sNG9ZSFNiRE1CZnJvTDVndEIrUzd0MFVOQnBpdmxjNjVvamov?=
 =?utf-8?B?TGZYUXdrNDR2RzZDRFRGSzl3R20vdlVwNG43Q3lCem1XOUMxUWdESXpPSkRD?=
 =?utf-8?B?ZVFSVHFtVCtNK2xJUmRFdy9UUlJjcXZsYW1XV2ZPdFk2Y2FueWVZc3JCQVFE?=
 =?utf-8?B?SWhzdU5EYnZrYkVhdHhRODJiRFRYMHJ1UjArMlR4Rmk4d0lIaEJDVUo1YlJs?=
 =?utf-8?B?RU51eG5WWEo0M2NPVFhqbGJWejUyaTFobDhaUVRoUWZ1aXFNYkwxcGRXUXhE?=
 =?utf-8?B?S1k2cUJ2ZVBZNHhwNHhSNDRmYmM0SUxOTW9OTjJLbmZFOXBOU21yNEM5R1A5?=
 =?utf-8?B?Y29HZDZBS1pOQ0NXMjNucjAyNGZabXdBTHM4M1FtSWcwMFhMVmdLZlBIRFEy?=
 =?utf-8?B?R2pzYk9IVkRyTGhoOFlCRkFxU1lQaUtnY0JUSHNNNlFLTzF0MnhtTmhNSUtX?=
 =?utf-8?B?NXVrWnBmaWEvQ25Uckk3NmhQN1NRQVJFejFENjQyNkxzZVo4cHF6UkErWGJu?=
 =?utf-8?B?dHQ1VmlIQ2JYTGpjZlVlT3M1OFowMzIzNC95eis4VnVYL0UrZjJwWTBqdFI4?=
 =?utf-8?B?ZXZ3ZFJkejBVT0xCRWsyNVBBT2NSTnBpTkFUTUlkazNpZG8zenFOMGp5Wkps?=
 =?utf-8?B?YlJNMytQRmxBQnZlMGFuUngxRFo1TUJXU1Q4L24zbXl4WGNnWjUwRFl2Q1pF?=
 =?utf-8?B?YWwxUk1yYk1LWU9rMHBWT1hEQkZhR29IVFMxYlJnYW9WdlY2WnFKZWNDaThy?=
 =?utf-8?B?S3RWWjcrWWU4c21vY0xEaDdzRHVqNUp2NDlpNmhYbEJabEordDR6V2VZY08v?=
 =?utf-8?B?bkJULzNrakhtSk4rbE8vT0dTdkthYUs1N1lNR3BBM2NYYjdqL2VyL1UyRXlm?=
 =?utf-8?B?L2YxQkd4U3lmOWVCSzF6b1BCUGpQaW9JM2Z5eFQrWHJRZUtRMHVDa25NWlF5?=
 =?utf-8?B?bEhRUkRNYkhnaVFKNEh0Zm04SHp5NDlqUE4zTzF2bUJtemZIbjJwTlg5cTQw?=
 =?utf-8?B?dWgrWTY5L0pENFRxdEFKNTlGWmlyS2trNGhIQ1lUM2dwY09DdFlZRFFKRjFk?=
 =?utf-8?B?c0FrZjJqdG5rVjdyNnBYSmp1Y3BIQ1BTRDZIVWJSUjJPMnNoWWVWVFFmZ3Rn?=
 =?utf-8?B?N2d1WEtUa0FzbHV6SzFrUktidUttenZSWnpVNGxHZFhxRDJ5YzhCR054SUNM?=
 =?utf-8?B?ME9GK2lTWDF4NWRFYnFJS0tEZEVIb2Z3aGM1YTc5YWxJV09sM0J1QmxuUnZW?=
 =?utf-8?B?bDdQSWcxeVZHaC9FSk5pdTJsVnUrMUxGckVNbHduNUk0MXdjMjlGQTB6enB1?=
 =?utf-8?B?VTZMbkNtcmpUN3BlQ2R0VGxPMGZ1allZTndUNlAwd0R1VXhNSzJOSTNVVWth?=
 =?utf-8?B?OWg4UkN3a2N3bUE5UXlGWEhNTDFhVGhlQXFuUnRhQjNVTnFBTmZFekxIQ3Bh?=
 =?utf-8?B?TXlpR2pjOEpWUHVJNU1XY0l1MFVXTTVqTThCR3BTZ3VxT1ZlcTB4RElxRHFO?=
 =?utf-8?B?WEFwQURBRjNvY3ZJbDlIejZFSnFhNk9icnBOQXRUbVVVamV6K09MSml0ZmQ3?=
 =?utf-8?B?dSs3YTdhb0ZtSWMxSWh4dXJDUjVHUE51Y2V4dmh5cExGZGZ5aDlPdE5DNXFp?=
 =?utf-8?B?REx0WStKZTFrdmEweTVXT01RcWlMdTlkRG1kL1k2RGtlWktvVEQ5N1YrTGpq?=
 =?utf-8?B?cFdnZEFBVysxTXRjUjJlYlRHWDllK2F6UkQ5VllTandPQjJCL2VNWm5ROFM0?=
 =?utf-8?B?SDhQZjlYWUkreCtRdGkraGhBYkNvSkptUmFlRUxJa1NuY1BiRjdBZkdQMmNZ?=
 =?utf-8?B?dGRqL0JqU1FQbjdHYU1VYnlyWWFidTZCZTdVYXQ3a3dnazNFWmJTK0VhcWpo?=
 =?utf-8?B?VkN5U0Qxc0ZmSE9JMFlRUmNUOGpicXNOaEVvbjkrWmMvdVl1c21DaFJwSFVz?=
 =?utf-8?Q?QMc963274FGF+x7e6ZvOP4zcY?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe6823ef-2484-4c5b-5156-08dd45a8cf21
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 05:49:09.1043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mMm0rUTTO+HcViDA0LOiw7/DGCPfZ3aC5Ocf94Em03/AjhrrPhUnn4tf2X7gB0wWDIWKHsOT34iEolJWME5VVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8296

Hi Jacopo

Thanks very much for your review.

On 2025/1/22 22:03, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Fri, Dec 27, 2024 at 03:09:11PM +0800, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> Add a driver for the CSI-2 receiver uinit found on the Amlofic C3 SoC.
> s/Amlofic/Amlogic/ :)
>

OK, will use Amlogic.

>> Create a drivers/media/platform/amlogic/c3/ directory to host the driver
>> and the forthcoming support for the Amlogic C3 MIPI adapter and C3 ISP.
>>
>> This driver is used to receive the MIPI data from image sensor.
>>
>> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   MAINTAINERS                                        |   1 +
>>   drivers/media/platform/amlogic/Kconfig             |   1 +
>>   drivers/media/platform/amlogic/Makefile            |   2 +
>>   drivers/media/platform/amlogic/c3/Kconfig          |   3 +
>>   drivers/media/platform/amlogic/c3/Makefile         |   3 +
>>   .../media/platform/amlogic/c3/mipi-csi2/Kconfig    |  16 +
>>   .../media/platform/amlogic/c3/mipi-csi2/Makefile   |   3 +
>>   .../platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c   | 831 +++++++++++++++++++++
>>   8 files changed, 860 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 2b06962db506..1d1416b15570 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1248,6 +1248,7 @@ M:      Keke Li <keke.li@amlogic.com>
>>   L:   linux-media@vger.kernel.org
>>   S:   Maintained
>>   F:   Documentation/devicetree/bindings/media/amlogic,c3-mipi-csi2.yaml
>> +F:   drivers/media/platform/amlogic/c3/mipi-csi2/
>>
>>   AMLOGIC RTC DRIVER
>>   M:   Yiting Deng <yiting.deng@amlogic.com>
>> diff --git a/drivers/media/platform/amlogic/Kconfig b/drivers/media/platform/amlogic/Kconfig
>> index 5014957404e9..458acf3d5fa8 100644
>> --- a/drivers/media/platform/amlogic/Kconfig
>> +++ b/drivers/media/platform/amlogic/Kconfig
>> @@ -2,4 +2,5 @@
>>
>>   comment "Amlogic media platform drivers"
>>
>> +source "drivers/media/platform/amlogic/c3/Kconfig"
>>   source "drivers/media/platform/amlogic/meson-ge2d/Kconfig"
>> diff --git a/drivers/media/platform/amlogic/Makefile b/drivers/media/platform/amlogic/Makefile
>> index d3cdb8fa4ddb..c744afcd1b9e 100644
>> --- a/drivers/media/platform/amlogic/Makefile
>> +++ b/drivers/media/platform/amlogic/Makefile
>> @@ -1,2 +1,4 @@
>>   # SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-y += c3/
>>   obj-y += meson-ge2d/
>> diff --git a/drivers/media/platform/amlogic/c3/Kconfig b/drivers/media/platform/amlogic/c3/Kconfig
>> new file mode 100644
>> index 000000000000..098d458747b8
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/Kconfig
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +source "drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig"
>> diff --git a/drivers/media/platform/amlogic/c3/Makefile b/drivers/media/platform/amlogic/c3/Makefile
>> new file mode 100644
>> index 000000000000..a468fb782f94
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-y += mipi-csi2/
>> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig b/drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig
>> new file mode 100644
>> index 000000000000..0d7b2e203273
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/Kconfig
>> @@ -0,0 +1,16 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +config VIDEO_C3_MIPI_CSI2
>> +     tristate "Amlogic C3 MIPI CSI-2 receiver"
>> +     depends on ARCH_MESON || COMPILE_TEST
>> +     depends on VIDEO_DEV
>> +     depends on OF
>> +     select MEDIA_CONTROLLER
>> +     select V4L2_FWNODE
>> +     select VIDEO_V4L2_SUBDEV_API
>> +     help
>> +       Video4Linux2 driver for Amlogic C3 MIPI CSI-2 receiver.
>> +       C3 MIPI CSI-2 receiver is used to receive MIPI data from
>> +       image sensor.
>> +
>> +       To compile this driver as a module choose m here.
>> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/Makefile b/drivers/media/platform/amlogic/c3/mipi-csi2/Makefile
>> new file mode 100644
>> index 000000000000..cc08fc722bfd
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +
>> +obj-$(CONFIG_VIDEO_C3_MIPI_CSI2) += c3-mipi-csi2.o
>> diff --git a/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
>> new file mode 100644
>> index 000000000000..7343e7003d13
>> --- /dev/null
>> +++ b/drivers/media/platform/amlogic/c3/mipi-csi2/c3-mipi-csi2.c
>> @@ -0,0 +1,831 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#include <linux/clk.h>
>> +#include <linux/device.h>
>> +#include <linux/module.h>
>> +#include <linux/mutex.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/pm_runtime.h>
>> +
>> +#include <media/v4l2-async.h>
>> +#include <media/v4l2-common.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/v4l2-fwnode.h>
>> +#include <media/v4l2-mc.h>
>> +#include <media/v4l2-subdev.h>
>> +
>> +/* C3 CSI-2 submodule definition */
>> +enum {
>> +     SUBMD_APHY,
>> +     SUBMD_DPHY,
>> +     SUBMD_HOST,
>> +};
>> +
>> +#define CSI2_SUBMD_MASK              GENMASK(17, 16)
>> +#define CSI2_SUBMD_SHIFT     16
>> +#define CSI2_SUBMD(x)        (((x) & (CSI2_SUBMD_MASK)) >> (CSI2_SUBMD_SHIFT))
>> +#define CSI2_REG_ADDR_MASK   GENMASK(15, 0)
>> +#define CSI2_REG_ADDR(x)     ((x) & (CSI2_REG_ADDR_MASK))
>> +#define CSI2_REG_A(x)                ((SUBMD_APHY << CSI2_SUBMD_SHIFT) | (x))
>> +#define CSI2_REG_D(x)                ((SUBMD_DPHY << CSI2_SUBMD_SHIFT) | (x))
>> +#define CSI2_REG_H(x)                ((SUBMD_HOST << CSI2_SUBMD_SHIFT) | (x))
>> +
>> +#define MIPI_CSI2_CLOCK_NUM_MAX                      3
>> +#define MIPI_CSI2_SUBDEV_NAME                        "c3-mipi-csi2"
>> +
>> +/* C3 CSI-2 APHY register */
>> +#define CSI_PHY_CNTL0                                CSI2_REG_A(0x44)
>> +#define CSI_PHY_CNTL0_HS_LP_BIAS_EN          BIT(10)
>> +#define CSI_PHY_CNTL0_HS_RX_TRIM_11          (11 << 11)
>> +#define CSI_PHY_CNTL0_LP_LOW_VTH_2           (2 << 16)
>> +#define CSI_PHY_CNTL0_LP_HIGH_VTH_4          (4 << 20)
>> +#define CSI_PHY_CNTL0_DATA_LANE0_HS_DIG_EN   BIT(24)
>> +#define CSI_PHY_CNTL0_DATA_LANE1_HS_DIG_EN   BIT(25)
>> +#define CSI_PHY_CNTL0_CLK0_LANE_HS_DIG_EN    BIT(26)
>> +#define CSI_PHY_CNTL0_DATA_LANE2_HS_DIG_EN   BIT(27)
>> +#define CSI_PHY_CNTL0_DATA_LANE3_HS_DIG_EN   BIT(28)
>> +
>> +#define CSI_PHY_CNTL1                                CSI2_REG_A(0x48)
>> +#define CSI_PHY_CNTL1_HS_EQ_CAP_SMALL                (2 << 16)
>> +#define CSI_PHY_CNTL1_HS_EQ_CAP_BIG          (3 << 16)
>> +#define CSI_PHY_CNTL1_HS_EQ_RES_MIN          (3 << 18)
>> +#define CSI_PHY_CNTL1_HS_EQ_RES_MED          (2 << 18)
>> +#define CSI_PHY_CNTL1_HS_EQ_RES_MAX          BIT(18)
>> +#define CSI_PHY_CNTL1_CLK_CHN_EQ_MAX_GAIN    BIT(20)
>> +#define CSI_PHY_CNTL1_DATA_CHN_EQ_MAX_GAIN   BIT(21)
>> +#define CSI_PHY_CNTL1_COM_BG_EN                      BIT(24)
>> +#define CSI_PHY_CNTL1_HS_SYNC_EN             BIT(25)
>> +
>> +/* C3 CSI-2 DPHY register */
>> +#define MIPI_PHY_CTRL                                CSI2_REG_D(0x00)
>> +#define MIPI_PHY_CTRL_DATA_LANE0_EN          (0 << 0)
>> +#define MIPI_PHY_CTRL_DATA_LANE0_DIS         BIT(0)
>> +#define MIPI_PHY_CTRL_DATA_LANE1_EN          (0 << 1)
>> +#define MIPI_PHY_CTRL_DATA_LANE1_DIS         BIT(1)
>> +#define MIPI_PHY_CTRL_DATA_LANE2_EN          (0 << 2)
>> +#define MIPI_PHY_CTRL_DATA_LANE2_DIS         BIT(2)
>> +#define MIPI_PHY_CTRL_DATA_LANE3_EN          (0 << 3)
>> +#define MIPI_PHY_CTRL_DATA_LANE3_DIS         BIT(3)
>> +#define MIPI_PHY_CTRL_CLOCK_LANE_EN          (0 << 4)
>> +#define MIPI_PHY_CTRL_CLOCK_LANE_DIS         BIT(4)
>> +
>> +#define MIPI_PHY_CLK_LANE_CTRL                       CSI2_REG_D(0x04)
>> +#define MIPI_PHY_CLK_LANE_CTRL_FORCE_ULPS_ENTER      BIT(0)
>> +#define MIPI_PHY_CLK_LANE_CTRL_FORCE_ULPS_EXIT       BIT(1)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS  (0 << 3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_2        BIT(3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_4        (2 << 3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_8        (3 << 3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_16       (4 << 3)
>> +#define MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_EN  BIT(6)
>> +#define MIPI_PHY_CLK_LANE_CTRL_LPEN_DIS              BIT(7)
>> +#define MIPI_PHY_CLK_LANE_CTRL_END_EN                BIT(8)
>> +#define MIPI_PHY_CLK_LANE_CTRL_HS_RX_EN              BIT(9)
>> +
>> +#define MIPI_PHY_DATA_LANE_CTRL1             CSI2_REG_D(0x0c)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_INSERT_ERRESC       BIT(0)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_HS_SYNC_CHK_EN      BIT(1)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_MASK   GENMASK(6, 2)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_ALL_EN (0x1f << 2)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_DELAY_MASK     GENMASK(9, 7)
>> +#define MIPI_PHY_DATA_LANE_CTRL1_PIPE_DELAY_3        (3 << 7)
>> +
>> +#define MIPI_PHY_TCLK_MISS                   CSI2_REG_D(0x10)
>> +#define MIPI_PHY_TCLK_MISS_CYCLES_MASK               GENMASK(7, 0)
>> +#define MIPI_PHY_TCLK_MISS_CYCLES_9          (9 << 0)
>> +
>> +#define MIPI_PHY_TCLK_SETTLE                 CSI2_REG_D(0x14)
>> +#define MIPI_PHY_TCLK_SETTLE_CYCLES_MASK     GENMASK(7, 0)
>> +#define MIPI_PHY_TCLK_SETTLE_CYCLES_31               (31 << 0)
>> +
>> +#define MIPI_PHY_THS_EXIT                    CSI2_REG_D(0x18)
>> +#define MIPI_PHY_THS_EXIT_CYCLES_MASK                GENMASK(7, 0)
>> +#define MIPI_PHY_THS_EXIT_CYCLES_8           (8 << 0)
>> +
>> +#define MIPI_PHY_THS_SKIP                    CSI2_REG_D(0x1c)
>> +#define MIPI_PHY_THS_SKIP_CYCLES_MASK                GENMASK(7, 0)
>> +#define MIPI_PHY_THS_SKIP_CYCLES_10          (10 << 0)
>> +
>> +#define MIPI_PHY_THS_SETTLE                  CSI2_REG_D(0x20)
>> +#define MIPI_PHY_THS_SETTLE_CYCLES_MASK              GENMASK(7, 0)
>> +
>> +#define MIPI_PHY_TINIT                               CSI2_REG_D(0x24)
>> +#define MIPI_PHY_TINIT_CYCLES_MASK           GENMASK(31, 0)
>> +#define MIPI_PHY_TINIT_CYCLES_20000          (20000 << 0)
>> +
>> +#define MIPI_PHY_TULPS_C                     CSI2_REG_D(0x28)
>> +#define MIPI_PHY_TULPS_C_CYCLES_MASK         GENMASK(31, 0)
>> +#define MIPI_PHY_TULPS_C_CYCLES_4096         (4096 << 0)
>> +
>> +#define MIPI_PHY_TULPS_S                     CSI2_REG_D(0x2c)
>> +#define MIPI_PHY_TULPS_S_CYCLES_MASK         GENMASK(31, 0)
>> +#define MIPI_PHY_TULPS_S_CYCLES_256          (256 << 0)
>> +
>> +#define MIPI_PHY_TMBIAS                              CSI2_REG_D(0x30)
>> +#define MIPI_PHY_TMBIAS_CYCLES_MASK          GENMASK(31, 0)
>> +#define MIPI_PHY_TMBIAS_CYCLES_256           (256 << 0)
>> +
>> +#define MIPI_PHY_TLP_EN_W                    CSI2_REG_D(0x34)
>> +#define MIPI_PHY_TLP_EN_W_CYCLES_MASK                GENMASK(31, 0)
>> +#define MIPI_PHY_TLP_EN_W_CYCLES_12          (12 << 0)
>> +
>> +#define MIPI_PHY_TLPOK                               CSI2_REG_D(0x38)
>> +#define MIPI_PHY_TLPOK_CYCLES_MASK           GENMASK(31, 0)
>> +#define MIPI_PHY_TLPOK_CYCLES_256            (256 << 0)
>> +
>> +#define MIPI_PHY_TWD_INIT                    CSI2_REG_D(0x3c)
>> +#define MIPI_PHY_TWD_INIT_DOG_MASK           GENMASK(31, 0)
>> +#define MIPI_PHY_TWD_INIT_DOG_0X400000               (0x400000 << 0)
>> +
>> +#define MIPI_PHY_TWD_HS                              CSI2_REG_D(0x40)
>> +#define MIPI_PHY_TWD_HS_DOG_MASK             GENMASK(31, 0)
>> +#define MIPI_PHY_TWD_HS_DOG_0X400000         (0x400000 << 0)
>> +
>> +#define MIPI_PHY_MUX_CTRL0                   CSI2_REG_D(0x284)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_MASK    GENMASK(3, 0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE0   (0 << 0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE1   BIT(0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE2   (2 << 0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE3   (3 << 0)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_MASK    GENMASK(7, 4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE0   (0 << 4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE1   BIT(4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE2   (2 << 4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE3   (3 << 4)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_MASK    GENMASK(11, 8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE0   (0 << 8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE1   BIT(8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE2   (2 << 8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE3   (3 << 8)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_MASK    GENMASK(14, 12)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE0   (0 << 12)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE1   BIT(12)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE2   (2 << 12)
>> +#define MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE3   (3 << 12)
>> +
>> +#define MIPI_PHY_MUX_CTRL1                   CSI2_REG_D(0x288)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_MASK    GENMASK(3, 0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN0   (0 << 0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN1   BIT(0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN2   (2 << 0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN3   (3 << 0)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_MASK    GENMASK(7, 4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN0   (0 << 4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN1   BIT(4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN2   (2 << 4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN3   (3 << 4)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_MASK    GENMASK(11, 8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN0   (0 << 8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN1   BIT(8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN2   (2 << 8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN3   (3 << 8)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_MASK    GENMASK(14, 12)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN0   (0 << 12)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN1   BIT(12)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN2   (2 << 12)
>> +#define MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN3   (3 << 12)
>> +
>> +/* C3 CSI-2 HOST register */
>> +#define CSI2_HOST_N_LANES                    CSI2_REG_H(0x04)
>> +#define CSI2_HOST_N_LANES_MASK                       GENMASK(1, 0)
>> +#define CSI2_HOST_N_LANES_1                  (0 << 0)
>> +#define CSI2_HOST_N_LANES_2                  BIT(0)
>> +#define CSI2_HOST_N_LANES_3                  (2 << 0)
>> +#define CSI2_HOST_N_LANES_4                  (3 << 0)
>> +
>> +#define CSI2_HOST_CSI2_RESETN                        CSI2_REG_H(0x10)
>> +#define CSI2_HOST_CSI2_RESETN_MASK           BIT(0)
>> +#define CSI2_HOST_CSI2_RESETN_ACTIVE         (0 << 0)
>> +#define CSI2_HOST_CSI2_RESETN_EXIT           BIT(0)
>> +
>> +#define C3_MIPI_CSI2_MAX_WIDTH                       2888
>> +#define C3_MIPI_CSI2_MIN_WIDTH                       160
>> +#define C3_MIPI_CSI2_MAX_HEIGHT                      2240
>> +#define C3_MIPI_CSI2_MIN_HEIGHT                      120
>> +#define C3_MIPI_CSI2_DEFAULT_WIDTH           1920
>> +#define C3_MIPI_CSI2_DEFAULT_HEIGHT          1080
>> +#define C3_MIPI_CSI2_DEFAULT_FMT             MEDIA_BUS_FMT_SRGGB10_1X10
>> +
>> +/* C3 CSI-2 pad list */
>> +enum {
>> +     C3_MIPI_CSI2_PAD_SINK,
>> +     C3_MIPI_CSI2_PAD_SRC,
>> +     C3_MIPI_CSI2_PAD_MAX
>> +};
>> +
>> +/*
>> + * struct c3_csi_info - MIPI CSI2 information
>> + *
>> + * @clocks: array of MIPI CSI2 clock names
>> + * @clock_num: actual clock number
>> + */
>> +struct c3_csi_info {
>> +     char *clocks[MIPI_CSI2_CLOCK_NUM_MAX];
>> +     u32 clock_num;
>> +};
>> +
>> +/*
>> + * struct c3_csi_device - MIPI CSI2 platform device
>> + *
>> + * @dev: pointer to the struct device
>> + * @aphy: MIPI CSI2 aphy register address
>> + * @dphy: MIPI CSI2 dphy register address
>> + * @host: MIPI CSI2 host register address
>> + * @clks: array of MIPI CSI2 clocks
>> + * @sd: MIPI CSI2 sub-device
>> + * @pads: MIPI CSI2 sub-device pads
>> + * @notifier: notifier to register on the v4l2-async API
>> + * @src_pad: source sub-device pad
>> + * @bus: MIPI CSI2 bus information
>> + * @info: version-specific MIPI CSI2 information
>> + */
>> +struct c3_csi_device {
>> +     struct device *dev;
>> +     void __iomem *aphy;
>> +     void __iomem *dphy;
>> +     void __iomem *host;
>> +     struct clk_bulk_data clks[MIPI_CSI2_CLOCK_NUM_MAX];
>> +
>> +     struct v4l2_subdev sd;
>> +     struct media_pad pads[C3_MIPI_CSI2_PAD_MAX];
>> +     struct v4l2_async_notifier notifier;
>> +     struct media_pad *src_pad;
>> +     struct v4l2_mbus_config_mipi_csi2 bus;
>> +
>> +     const struct c3_csi_info *info;
>> +};
>> +
>> +static const u32 c3_mipi_csi_formats[] = {
>> +     MEDIA_BUS_FMT_SBGGR10_1X10,
>> +     MEDIA_BUS_FMT_SGBRG10_1X10,
>> +     MEDIA_BUS_FMT_SGRBG10_1X10,
>> +     MEDIA_BUS_FMT_SRGGB10_1X10,
>> +     MEDIA_BUS_FMT_SBGGR12_1X12,
>> +     MEDIA_BUS_FMT_SGBRG12_1X12,
>> +     MEDIA_BUS_FMT_SGRBG12_1X12,
>> +     MEDIA_BUS_FMT_SRGGB12_1X12,
>> +};
>> +
>> +/* Hardware configuration */
>> +
>> +static void c3_mipi_csi_write(struct c3_csi_device *csi, u32 reg, u32 val)
>> +{
>> +     void __iomem *addr;
>> +
>> +     switch (CSI2_SUBMD(reg)) {
>> +     case SUBMD_APHY:
>> +             addr = csi->aphy + CSI2_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_DPHY:
>> +             addr = csi->dphy + CSI2_REG_ADDR(reg);
>> +             break;
>> +     case SUBMD_HOST:
>> +             addr = csi->host + CSI2_REG_ADDR(reg);
>> +             break;
>> +     default:
>> +             dev_err(csi->dev, "Invalid sub-module: %lu\n", CSI2_SUBMD(reg));
>> +             return;
>> +     }
>> +
>> +     writel(val, addr);
>> +}
>> +
>> +static void c3_mipi_csi_cfg_aphy(struct c3_csi_device *csi)
>> +{
>> +     c3_mipi_csi_write(csi, CSI_PHY_CNTL0,
>> +                       CSI_PHY_CNTL0_HS_LP_BIAS_EN |
>> +                       CSI_PHY_CNTL0_HS_RX_TRIM_11 |
>> +                       CSI_PHY_CNTL0_LP_LOW_VTH_2 |
>> +                       CSI_PHY_CNTL0_LP_HIGH_VTH_4 |
>> +                       CSI_PHY_CNTL0_DATA_LANE0_HS_DIG_EN |
>> +                       CSI_PHY_CNTL0_DATA_LANE1_HS_DIG_EN |
>> +                       CSI_PHY_CNTL0_CLK0_LANE_HS_DIG_EN |
>> +                       CSI_PHY_CNTL0_DATA_LANE2_HS_DIG_EN |
>> +                       CSI_PHY_CNTL0_DATA_LANE3_HS_DIG_EN);
>> +
>> +     c3_mipi_csi_write(csi, CSI_PHY_CNTL1,
>> +                       CSI_PHY_CNTL1_HS_EQ_CAP_SMALL |
>> +                       CSI_PHY_CNTL1_HS_EQ_RES_MED |
>> +                       CSI_PHY_CNTL1_CLK_CHN_EQ_MAX_GAIN |
>> +                       CSI_PHY_CNTL1_DATA_CHN_EQ_MAX_GAIN |
>> +                       CSI_PHY_CNTL1_COM_BG_EN |
>> +                       CSI_PHY_CNTL1_HS_SYNC_EN);
>> +}
>> +
>> +static void c3_mipi_csi_cfg_dphy(struct c3_csi_device *csi, s64 rate)
>> +{
>> +     u32 val;
>> +     u32 settle;
>> +
>> +     /* Calculate the high speed settle */
>> +     val = DIV_ROUND_UP(1000000000, rate);
>> +     settle = (16 * val + 230) / 10;
>> +
>> +     c3_mipi_csi_write(csi, MIPI_PHY_CLK_LANE_CTRL,
>> +                       MIPI_PHY_CLK_LANE_CTRL_HS_RX_EN |
>> +                       MIPI_PHY_CLK_LANE_CTRL_END_EN |
>> +                       MIPI_PHY_CLK_LANE_CTRL_LPEN_DIS |
>> +                       MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_EN |
>> +                       MIPI_PHY_CLK_LANE_CTRL_TCLK_ZERO_HS_8);
>> +
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TCLK_MISS, MIPI_PHY_TCLK_MISS_CYCLES_9);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TCLK_SETTLE,
>> +                       MIPI_PHY_TCLK_SETTLE_CYCLES_31);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_EXIT, MIPI_PHY_THS_EXIT_CYCLES_8);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_SKIP, MIPI_PHY_THS_SKIP_CYCLES_10);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_THS_SETTLE, settle);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TINIT, MIPI_PHY_TINIT_CYCLES_20000);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TMBIAS, MIPI_PHY_TMBIAS_CYCLES_256);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TULPS_C, MIPI_PHY_TULPS_C_CYCLES_4096);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TULPS_S, MIPI_PHY_TULPS_S_CYCLES_256);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TLP_EN_W, MIPI_PHY_TLP_EN_W_CYCLES_12);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TLPOK, MIPI_PHY_TLPOK_CYCLES_256);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TWD_INIT,
>> +                       MIPI_PHY_TWD_INIT_DOG_0X400000);
>> +     c3_mipi_csi_write(csi, MIPI_PHY_TWD_HS, MIPI_PHY_TWD_HS_DOG_0X400000);
>> +
>> +     c3_mipi_csi_write(csi, MIPI_PHY_DATA_LANE_CTRL1,
>> +                       MIPI_PHY_DATA_LANE_CTRL1_INSERT_ERRESC |
>> +                       MIPI_PHY_DATA_LANE_CTRL1_HS_SYNC_CHK_EN |
>> +                       MIPI_PHY_DATA_LANE_CTRL1_PIPE_ALL_EN |
>> +                       MIPI_PHY_DATA_LANE_CTRL1_PIPE_DELAY_3);
>> +
>> +     /* Set the order of lanes */
>> +     c3_mipi_csi_write(csi, MIPI_PHY_MUX_CTRL0,
>> +                       MIPI_PHY_MUX_CTRL0_SFEN3_SRC_LANE3 |
>> +                       MIPI_PHY_MUX_CTRL0_SFEN2_SRC_LANE2 |
>> +                       MIPI_PHY_MUX_CTRL0_SFEN1_SRC_LANE1 |
>> +                       MIPI_PHY_MUX_CTRL0_SFEN0_SRC_LANE0);
>> +
>> +     c3_mipi_csi_write(csi, MIPI_PHY_MUX_CTRL1,
>> +                       MIPI_PHY_MUX_CTRL1_LANE3_SRC_SFEN3 |
>> +                       MIPI_PHY_MUX_CTRL1_LANE2_SRC_SFEN2 |
>> +                       MIPI_PHY_MUX_CTRL1_LANE1_SRC_SFEN1 |
>> +                       MIPI_PHY_MUX_CTRL1_LANE0_SRC_SFEN0);
>> +
>> +     /* Enable digital data and clock lanes */
>> +     c3_mipi_csi_write(csi, MIPI_PHY_CTRL,
>> +                       MIPI_PHY_CTRL_DATA_LANE0_EN |
>> +                       MIPI_PHY_CTRL_DATA_LANE1_EN |
>> +                       MIPI_PHY_CTRL_DATA_LANE2_EN |
>> +                       MIPI_PHY_CTRL_DATA_LANE3_EN |
>> +                       MIPI_PHY_CTRL_CLOCK_LANE_EN);
>> +}
>> +
>> +static void c3_mipi_csi_cfg_host(struct c3_csi_device *csi)
>> +{
>> +     /* Reset CSI-2 controller output */
>> +     c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN,
>> +                       CSI2_HOST_CSI2_RESETN_ACTIVE);
>> +     c3_mipi_csi_write(csi, CSI2_HOST_CSI2_RESETN,
>> +                       CSI2_HOST_CSI2_RESETN_EXIT);
>> +
>> +     /* Set data lane number */
>> +     c3_mipi_csi_write(csi, CSI2_HOST_N_LANES, csi->bus.num_data_lanes - 1);
>> +}
>> +
>> +static int c3_mipi_csi_start_stream(struct c3_csi_device *csi,
>> +                                 struct v4l2_subdev *src_sd)
>> +{
>> +     s64 link_freq;
>> +     s64 lane_rate;
>> +
>> +     link_freq = v4l2_get_link_freq(src_sd->ctrl_handler, 0, 0);
>> +     if (link_freq < 0) {
>> +             dev_err(csi->dev,
>> +                     "Unable to obtain link frequency: %lld\n", link_freq);
>> +             return link_freq;
>> +     }
>> +
>> +     lane_rate = link_freq * 2;
>> +     if (lane_rate > 1500000000) {
>> +             dev_err(csi->dev, "Invalid lane rate: %lld\n", lane_rate);
>> +             return -EINVAL;
>> +     }
>> +
>> +     c3_mipi_csi_cfg_aphy(csi);
>> +     c3_mipi_csi_cfg_dphy(csi, lane_rate);
>> +     c3_mipi_csi_cfg_host(csi);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_enable_streams(struct v4l2_subdev *sd,
>> +                                   struct v4l2_subdev_state *state,
>> +                                   u32 pad, u64 streams_mask)
>> +{
>> +     struct c3_csi_device *csi = v4l2_get_subdevdata(sd);
>> +     struct media_pad *sink_pad;
>> +     struct v4l2_subdev *src_sd;
>> +     int ret;
>> +
>> +     sink_pad = &csi->pads[C3_MIPI_CSI2_PAD_SINK];
>> +     csi->src_pad = media_pad_remote_pad_unique(sink_pad);
>> +     if (IS_ERR(csi->src_pad)) {
>> +             dev_dbg(csi->dev, "Failed to get source pad for MIPI CSI-2\n");
>> +             return -EPIPE;
>> +     }
>> +
>> +     src_sd = media_entity_to_v4l2_subdev(csi->src_pad->entity);
>> +
>> +     pm_runtime_resume_and_get(csi->dev);
>> +
>> +     c3_mipi_csi_start_stream(csi, src_sd);
>> +
>> +     ret = v4l2_subdev_enable_streams(src_sd, csi->src_pad->index, BIT(0));
>> +     if (ret) {
>> +             pm_runtime_put(csi->dev);
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_disable_streams(struct v4l2_subdev *sd,
>> +                                    struct v4l2_subdev_state *state,
>> +                                    u32 pad, u64 streams_mask)
>> +{
>> +     struct c3_csi_device *csi = v4l2_get_subdevdata(sd);
>> +     struct v4l2_subdev *src_sd;
>> +
>> +     if (csi->src_pad) {
>> +             src_sd = media_entity_to_v4l2_subdev(csi->src_pad->entity);
>> +             v4l2_subdev_disable_streams(src_sd, csi->src_pad->index,
>> +                                         BIT(0));
>> +     }
>> +     csi->src_pad = NULL;
>> +
>> +     pm_runtime_put(csi->dev);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_enum_mbus_code(struct v4l2_subdev *sd,
>> +                                   struct v4l2_subdev_state *state,
>> +                                   struct v4l2_subdev_mbus_code_enum *code)
>> +{
>> +     switch (code->pad) {
>> +     case C3_MIPI_CSI2_PAD_SINK:
>> +             if (code->index >= ARRAY_SIZE(c3_mipi_csi_formats))
>> +                     return -EINVAL;
>> +
>> +             code->code = c3_mipi_csi_formats[code->index];
>> +             break;
>> +     case C3_MIPI_CSI2_PAD_SRC:
>> +             struct v4l2_mbus_framefmt *fmt;
>> +
>> +             if (code->index)
>> +                     return -EINVAL;
>> +
>> +             fmt = v4l2_subdev_state_get_format(state, code->pad);
>> +             code->code = fmt->code;
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_set_fmt(struct v4l2_subdev *sd,
>> +                            struct v4l2_subdev_state *state,
>> +                            struct v4l2_subdev_format *format)
>> +{
>> +     struct v4l2_mbus_framefmt *fmt;
>> +     unsigned int i;
>> +
>> +     if (format->pad != C3_MIPI_CSI2_PAD_SINK)
>> +             return v4l2_subdev_get_fmt(sd, state, format);
>> +
>> +     fmt = v4l2_subdev_state_get_format(state, format->pad);
>> +
>> +     for (i = 0; i < ARRAY_SIZE(c3_mipi_csi_formats); i++) {
>> +             if (format->format.code == c3_mipi_csi_formats[i]) {
>> +                     fmt->code = c3_mipi_csi_formats[i];
>> +                     break;
>> +             }
>> +     }
>> +
>> +     if (i == ARRAY_SIZE(c3_mipi_csi_formats))
>> +             fmt->code = c3_mipi_csi_formats[0];
>> +
>> +     fmt->width = clamp_t(u32, format->format.width,
>> +                          C3_MIPI_CSI2_MIN_WIDTH, C3_MIPI_CSI2_MAX_WIDTH);
>> +     fmt->height = clamp_t(u32, format->format.height,
>> +                           C3_MIPI_CSI2_MIN_HEIGHT, C3_MIPI_CSI2_MAX_HEIGHT);
>> +     fmt->colorspace = V4L2_COLORSPACE_RAW;
>> +     fmt->xfer_func = V4L2_XFER_FUNC_NONE;
>> +     fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>> +     fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>> +
>> +     format->format = *fmt;
>> +
>> +     /* Synchronize the format to source pad */
>> +     fmt = v4l2_subdev_state_get_format(state, C3_MIPI_CSI2_PAD_SRC);
>> +     *fmt = format->format;
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_init_state(struct v4l2_subdev *sd,
>> +                               struct v4l2_subdev_state *state)
>> +{
>> +     struct v4l2_mbus_framefmt *sink_fmt;
>> +     struct v4l2_mbus_framefmt *src_fmt;
>> +
>> +     sink_fmt = v4l2_subdev_state_get_format(state, C3_MIPI_CSI2_PAD_SINK);
>> +     src_fmt = v4l2_subdev_state_get_format(state, C3_MIPI_CSI2_PAD_SRC);
>> +
>> +     sink_fmt->width = C3_MIPI_CSI2_DEFAULT_WIDTH;
>> +     sink_fmt->height = C3_MIPI_CSI2_DEFAULT_HEIGHT;
>> +     sink_fmt->field = V4L2_FIELD_NONE;
>> +     sink_fmt->code = C3_MIPI_CSI2_DEFAULT_FMT;
>> +     sink_fmt->colorspace = V4L2_COLORSPACE_RAW;
>> +     sink_fmt->xfer_func = V4L2_XFER_FUNC_NONE;
>> +     sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
>> +     sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
>> +
>> +     *src_fmt = *sink_fmt;
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct v4l2_subdev_pad_ops c3_mipi_csi_pad_ops = {
>> +     .enum_mbus_code = c3_mipi_csi_enum_mbus_code,
>> +     .get_fmt = v4l2_subdev_get_fmt,
>> +     .set_fmt = c3_mipi_csi_set_fmt,
>> +     .enable_streams = c3_mipi_csi_enable_streams,
>> +     .disable_streams = c3_mipi_csi_disable_streams,
>> +};
>> +
>> +static const struct v4l2_subdev_ops c3_mipi_csi_subdev_ops = {
>> +     .pad = &c3_mipi_csi_pad_ops,
>> +};
>> +
>> +static const struct v4l2_subdev_internal_ops c3_mipi_csi_internal_ops = {
>> +     .init_state = c3_mipi_csi_init_state,
>> +};
>> +
>> +/* Media entity operations */
>> +static const struct media_entity_operations c3_mipi_csi_entity_ops = {
>> +     .link_validate = v4l2_subdev_link_validate,
>> +};
>> +
>> +/* PM runtime */
>> +
>> +static int c3_mipi_csi_runtime_suspend(struct device *dev)
>> +{
>> +     struct c3_csi_device *csi = dev_get_drvdata(dev);
>> +
>> +     clk_bulk_disable_unprepare(csi->info->clock_num, csi->clks);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_runtime_resume(struct device *dev)
>> +{
>> +     struct c3_csi_device *csi = dev_get_drvdata(dev);
>> +
>> +     return clk_bulk_prepare_enable(csi->info->clock_num, csi->clks);
>> +}
>> +
>> +static const struct dev_pm_ops c3_mipi_csi_pm_ops = {
>> +     SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
>> +                         pm_runtime_force_resume)
>> +     RUNTIME_PM_OPS(c3_mipi_csi_runtime_suspend,
>> +                    c3_mipi_csi_runtime_resume, NULL)
>> +};
>> +
>> +/* Probe/remove & platform driver */
>> +
>> +static int c3_mipi_csi_subdev_init(struct c3_csi_device *csi)
>> +{
>> +     struct v4l2_subdev *sd = &csi->sd;
>> +     int ret;
>> +
>> +     v4l2_subdev_init(sd, &c3_mipi_csi_subdev_ops);
>> +     sd->owner = THIS_MODULE;
>> +     sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>> +     sd->internal_ops = &c3_mipi_csi_internal_ops;
>> +     snprintf(sd->name, sizeof(sd->name), "%s", MIPI_CSI2_SUBDEV_NAME);
>> +
>> +     sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
>> +     sd->entity.ops = &c3_mipi_csi_entity_ops;
>> +
>> +     sd->dev = csi->dev;
>> +     v4l2_set_subdevdata(sd, csi);
>> +
>> +     csi->pads[C3_MIPI_CSI2_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
>> +     csi->pads[C3_MIPI_CSI2_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
>> +     ret = media_entity_pads_init(&sd->entity, C3_MIPI_CSI2_PAD_MAX,
>> +                                  csi->pads);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = v4l2_subdev_init_finalize(sd);
>> +     if (ret) {
>> +             media_entity_cleanup(&sd->entity);
>> +             return ret;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static void c3_mipi_csi_subdev_deinit(struct c3_csi_device *csi)
>> +{
>> +     v4l2_subdev_cleanup(&csi->sd);
>> +     media_entity_cleanup(&csi->sd.entity);
>> +}
>> +
>> +/* Subdev notifier register */
>> +static int c3_mipi_csi_notify_bound(struct v4l2_async_notifier *notifier,
>> +                                 struct v4l2_subdev *sd,
>> +                                 struct v4l2_async_connection *asc)
>> +{
>> +     struct c3_csi_device *csi = v4l2_get_subdevdata(notifier->sd);
>> +     struct media_pad *sink = &csi->sd.entity.pads[C3_MIPI_CSI2_PAD_SINK];
>> +
>> +     return v4l2_create_fwnode_links_to_pad(sd, sink, MEDIA_LNK_FL_ENABLED |
>> +                                            MEDIA_LNK_FL_IMMUTABLE);
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations c3_mipi_csi_notify_ops = {
>> +     .bound = c3_mipi_csi_notify_bound,
>> +};
>> +
>> +static int c3_mipi_csi_async_register(struct c3_csi_device *csi)
>> +{
>> +     struct v4l2_fwnode_endpoint vep = {
>> +             .bus_type = V4L2_MBUS_CSI2_DPHY,
>> +     };
>> +     struct v4l2_async_connection *asc;
>> +     struct fwnode_handle *ep;
>> +     int ret;
>> +
>> +     v4l2_async_subdev_nf_init(&csi->notifier, &csi->sd);
>> +
>> +     ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(csi->dev), 0, 0,
>> +                                          FWNODE_GRAPH_ENDPOINT_NEXT);
>> +     if (!ep)
>> +             return -ENOTCONN;
>> +
>> +     ret = v4l2_fwnode_endpoint_parse(ep, &vep);
>> +     if (ret)
>> +             goto err_put_handle;
>> +
>> +     csi->bus = vep.bus.mipi_csi2;
>> +     if (csi->bus.num_data_lanes < 1 || csi->bus.num_data_lanes > 4) {
>> +             dev_err(csi->dev, "Unsupported data lanes number\n");
>> +             goto err_put_handle;
> not a big deal, but if you specify this in the bindings, there's no
> need to check in the driver, as the assumptions is that the dtb file
> is correct.


Will remove this check.

>
> The rest looks good to me:
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> Thanks
>    j
>

Thanks again

>> +     }
>> +
>> +     asc = v4l2_async_nf_add_fwnode_remote(&csi->notifier, ep,
>> +                                           struct v4l2_async_connection);
>> +     if (IS_ERR(asc)) {
>> +             ret = PTR_ERR(asc);
>> +             goto err_put_handle;
>> +     }
>> +
>> +     csi->notifier.ops = &c3_mipi_csi_notify_ops;
>> +     ret = v4l2_async_nf_register(&csi->notifier);
>> +     if (ret)
>> +             goto err_cleanup_nf;
>> +
>> +     ret = v4l2_async_register_subdev(&csi->sd);
>> +     if (ret)
>> +             goto err_unregister_nf;
>> +
>> +     fwnode_handle_put(ep);
>> +
>> +     return 0;
>> +
>> +err_unregister_nf:
>> +     v4l2_async_nf_unregister(&csi->notifier);
>> +err_cleanup_nf:
>> +     v4l2_async_nf_cleanup(&csi->notifier);
>> +err_put_handle:
>> +     fwnode_handle_put(ep);
>> +     return ret;
>> +}
>> +
>> +static void c3_mipi_csi_async_unregister(struct c3_csi_device *csi)
>> +{
>> +     v4l2_async_unregister_subdev(&csi->sd);
>> +     v4l2_async_nf_unregister(&csi->notifier);
>> +     v4l2_async_nf_cleanup(&csi->notifier);
>> +}
>> +
>> +static int c3_mipi_csi_ioremap_resource(struct c3_csi_device *csi)
>> +{
>> +     struct device *dev = csi->dev;
>> +     struct platform_device *pdev = to_platform_device(dev);
>> +
>> +     csi->aphy = devm_platform_ioremap_resource_byname(pdev, "aphy");
>> +     if (IS_ERR(csi->aphy))
>> +             return PTR_ERR(csi->aphy);
>> +
>> +     csi->dphy = devm_platform_ioremap_resource_byname(pdev, "dphy");
>> +     if (IS_ERR(csi->dphy))
>> +             return PTR_ERR(csi->dphy);
>> +
>> +     csi->host = devm_platform_ioremap_resource_byname(pdev, "host");
>> +     if (IS_ERR(csi->host))
>> +             return PTR_ERR(csi->host);
>> +
>> +     return 0;
>> +}
>> +
>> +static int c3_mipi_csi_get_clocks(struct c3_csi_device *csi)
>> +{
>> +     const struct c3_csi_info *info = csi->info;
>> +
>> +     for (unsigned int i = 0; i < info->clock_num; i++)
>> +             csi->clks[i].id = info->clocks[i];
>> +
>> +     return devm_clk_bulk_get(csi->dev, info->clock_num, csi->clks);
>> +}
>> +
>> +static int c3_mipi_csi_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct c3_csi_device *csi;
>> +     int ret;
>> +
>> +     csi = devm_kzalloc(dev, sizeof(*csi), GFP_KERNEL);
>> +     if (!csi)
>> +             return -ENOMEM;
>> +
>> +     csi->info = of_device_get_match_data(dev);
>> +     csi->dev = dev;
>> +
>> +     ret = c3_mipi_csi_ioremap_resource(csi);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "Failed to ioremap resource\n");
>> +
>> +     ret = c3_mipi_csi_get_clocks(csi);
>> +     if (ret)
>> +             return dev_err_probe(dev, ret, "Failed to get clocks\n");
>> +
>> +     platform_set_drvdata(pdev, csi);
>> +
>> +     pm_runtime_enable(dev);
>> +
>> +     ret = c3_mipi_csi_subdev_init(csi);
>> +     if (ret)
>> +             goto err_disable_runtime_pm;
>> +
>> +     ret = c3_mipi_csi_async_register(csi);
>> +     if (ret)
>> +             goto err_deinit_subdev;
>> +
>> +     return 0;
>> +
>> +err_deinit_subdev:
>> +     c3_mipi_csi_subdev_deinit(csi);
>> +err_disable_runtime_pm:
>> +     pm_runtime_disable(dev);
>> +     return ret;
>> +};
>> +
>> +static void c3_mipi_csi_remove(struct platform_device *pdev)
>> +{
>> +     struct c3_csi_device *csi = platform_get_drvdata(pdev);
>> +
>> +     c3_mipi_csi_async_unregister(csi);
>> +     c3_mipi_csi_subdev_deinit(csi);
>> +
>> +     pm_runtime_disable(&pdev->dev);
>> +};
>> +
>> +static const struct c3_csi_info c3_mipi_csi_info = {
>> +     .clocks = {"vapb", "phy0"},
>> +     .clock_num = 2
>> +};
>> +
>> +static const struct of_device_id c3_mipi_csi_of_match[] = {
>> +     {
>> +             .compatible = "amlogic,c3-mipi-csi2",
>> +             .data = &c3_mipi_csi_info,
>> +     },
>> +     { },
>> +};
>> +MODULE_DEVICE_TABLE(of, c3_mipi_csi_of_match);
>> +
>> +static struct platform_driver c3_mipi_csi_driver = {
>> +     .probe = c3_mipi_csi_probe,
>> +     .remove = c3_mipi_csi_remove,
>> +     .driver = {
>> +             .name = "c3-mipi-csi2",
>> +             .of_match_table = c3_mipi_csi_of_match,
>> +             .pm = pm_ptr(&c3_mipi_csi_pm_ops),
>> +     },
>> +};
>> +
>> +module_platform_driver(c3_mipi_csi_driver);
>> +
>> +MODULE_AUTHOR("Keke Li <keke.li@amlogic.com>");
>> +MODULE_DESCRIPTION("Amlogic C3 MIPI CSI-2 receiver");
>> +MODULE_LICENSE("GPL");
>>
>> --
>> 2.47.1
>>
>>
>>

