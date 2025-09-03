Return-Path: <linux-media+bounces-41626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CB5B412EE
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 05:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 04BF0544259
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 03:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9482C237F;
	Wed,  3 Sep 2025 03:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="DQaCo7bw"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7631E833D;
	Wed,  3 Sep 2025 03:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756870180; cv=fail; b=uUOSXpc8/TQ5kDFUfqkPNXh4cmuOtQk+XtJvn9p9fTLmsmA+iw5L+zA5h3mM6XmoHfAE1Y5ErMfmV62JTfNm3grba8kqc4bRpkGjDj9P998ZhpAJwwYIUh6ijpk40IAYwEYW4HgqsO9jrh3zeuPH7EznMHaqlyVjPo0GtlLM6oY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756870180; c=relaxed/simple;
	bh=TjvmfuQpnVfZeq9oK6jut7T7QH/NWzFk4019xzclFzE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sQDPab1FP5C7I37Fig5EnITvM+gL+aByih+MuY2n+qjgMh+vKjbiRoJ7l5YirajLvODL3se5QmtRcWCd5m5XoyafWLIwD5Pz5Vuzgqme4o98pLPGeqRLysm1FJkKTPbzINnkMd/AcTNQguZF20FiJnhLkQEtwdSULC/XihULjpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=DQaCo7bw; arc=fail smtp.client-ip=40.107.92.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pdckiB1Kt9UV4kQTlr18+0X4XZDOq6L7IxKpT4L8kjs3evoATUfIPGQ5vauBki39qttVQwDkCMInCNA38kqRm7treffACalOPnuiqqTp3TyUzUsf8noxGp+XNjle+eSr2YbYULoJUmLdXY4h3ZzbYjGUyfYiUSlyfN7xXI910AiYihW80dwj+MjAw6lYS+2g4CrH/BA95/BaR06H+//09Iv3L1hu4gOdNR2m9+AF1zGbbUJu7smjO0eiPPQRQzXrVgqCE6MbNNzf65vIccYvcNZK2ouUXdqdneJB/xqLO/pI8TGhBez9AORq7/u/Gb31AbbX3ijH0ZTeKYJzGVy1iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zWZqxOy5D6/4BxJJ15FaM8SDloVSwa1RYcW5jwQzkdg=;
 b=PqczOlSBMCZ68FX77IkM5PKTBFsQV+orcSuo6JWcr2/ha+ohmIAROnHVvVOBZo69ajd0OpPJDHvrtLDlVTg9U107wzU06vrtXmTWLdXXH3R/qXB437JPpsP3u/PM8UYgAzuwxT/XrpkgdOa3yBVmG941yHtj2hXpcKTavmJ5gnx7m/mlsftMMkqiLKQ/RkmQBPplBm+6kt0lusU6BV8QGJqAcMP2euBZSRzBgwM/EbCQw0Rgh2xf+D+Hi69TNv2uRAhmB2BLTd6Jy8s9yhqYnbKFDqYZjFrEujqI+B4hrHEiyOJQHjf70RYxdfnbYoOEf+kmWudnTLzSSRKOzf/h2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zWZqxOy5D6/4BxJJ15FaM8SDloVSwa1RYcW5jwQzkdg=;
 b=DQaCo7bwLtNUqYWU3xZ/JMeVAvJxFHT5mDvYYHtiz+V61tp3ICfYrENnlZayKjVQz5w76jR0VDgDsjxlBIkiI++rpslEwOEHVEOg7VL5+8rrj+pkyESCBJZsLlkCQuzRiS2XacqOTbwasLhKtbWjU4GngVO6m6xCBIjwRAe+t1Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Wed, 3 Sep
 2025 03:29:35 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 03:29:35 +0000
Message-ID: <b4b7a2dc-573a-4872-8e45-614e5ccb5455@amd.com>
Date: Wed, 3 Sep 2025 11:29:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/7] Add AMD ISP4 driver
To: Mario Limonciello <superm1@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, richard.gong@amd.com, anson.tsao@amd.com
References: <20250828084507.94552-1-Bin.Du@amd.com>
 <20250828165605.GA9916@pendragon.ideasonboard.com>
 <20250828165850.GA14246@pendragon.ideasonboard.com>
 <0a10bae2-600c-4ca2-8437-411e9c236d5c@amd.com>
 <b2175a9a-f110-4103-ac2d-24971ee41fc9@kernel.org>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <b2175a9a-f110-4103-ac2d-24971ee41fc9@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TY4P286CA0045.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::12) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: c50aa3bf-246b-408e-64fa-08ddea9a1ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0M0bTZZQ2VKM1hydVFxdkNycFJsc1ZTOVBnTTFDc3FNT2VnK3dBckx5S1Zw?=
 =?utf-8?B?d3NwNlplb1JmUnU1aFNEeGg0Rk9Pc0IxOUltM2tpUFBFRmZFMHMwR0MxYnYx?=
 =?utf-8?B?WG5kVDRJSkJLc0MxendSUHQ4NzJudTFpeURQUWVIU2F5TVo3NU02VHpmTytY?=
 =?utf-8?B?UFdFTVY3TzdpNGZVL2F1cTF4aEF2bVd6SU1NVlJnVTNiNHAwZnRyVWh0YlFU?=
 =?utf-8?B?cUUzekNCa0tORWo4bTRaZHFld0FScllobnZpb1k1M1JGL3hhMWZqbUN5cS9p?=
 =?utf-8?B?YVdkTzE1cDZPN0ZpcHNkOWdNRm4wdGVwSGVZbEFNV2ZVR1ZOYWFKU0JabUZh?=
 =?utf-8?B?bkgzV0JGZlNpRDkzQ0VmeTExYVd6WnNmM2kyMWJDVDNQN3Q2OHNLU09Cd3Yr?=
 =?utf-8?B?K0Q3dXdBbjBSZlloamM3ekUza205NjBJTmVKL2Y4Mnh0cDU2M0VlaVJheEla?=
 =?utf-8?B?YkxOSjEzM1ZkbEtIRjNxNE1MZGVPcDB0ZGxmT1dsYXdiMHB0Z2Z3ajFNbjc1?=
 =?utf-8?B?WmVTYnN5QytDVytYdjZPYjNmS2lvRGZveXFiMEJzZGxudy9jNUJGQXN4QWpr?=
 =?utf-8?B?Njc0dTFzdDNlUzBudDdueUROYWNUZDhXaVRodmU0V21mSE1acUFoMGJkWkU2?=
 =?utf-8?B?TEZ5V1RyZXlnL2Q1YjZoSnJILzB3OGEzaVlzV2lrWXpHQmZoeDI4QVZLTHNB?=
 =?utf-8?B?N3l6OXdoWjZORStwbDdoa1l2ZzU3Tk5hVEh2Ujh3cnczU08vSnNzbVNlWXQ2?=
 =?utf-8?B?NWRFbStxUW1HNndGcm9ZakxOS2hWb1drdjB5R3c5MmtvL0FZeHhwWkhiUHFV?=
 =?utf-8?B?WmR2cTJQeEYwQ2RYQndPcmcxVFkwVjJ6cWdqZGFMcmlDcHNqYmlwYk9qbkNY?=
 =?utf-8?B?OTVOK01CYlFCWnozRWgrLzB1VlVjZEhjTjFlMlU5T1lBVGRUS0NPSFpuTlVO?=
 =?utf-8?B?Z2tneW9udUlZRkJ4MFp5L24zYlh5L0lGRWpoUi9NU3Vnek4zOS9FNU5MUnBp?=
 =?utf-8?B?bUlORGF1SnVXWHF6Qzl3ME55MElPN2VYUnV0V0crN0ppSms5ZlkrbDAwZm5R?=
 =?utf-8?B?aisvM0Vqd2o4cXUzZnBiZHVZdWcwL2ZLdERYdGFPdTl6bHp1SGpqU2NzTWcy?=
 =?utf-8?B?M2M4L2l3WXdDZEtLYmVXbkxLRXpuc2xha04xaWljcnBMMHo4OU50YVUzalQ1?=
 =?utf-8?B?aTROdUgreklpNXhkVGNwbTF3VFY0aGV5STQwZjJmMlMyZkpsbVhNKzkxS0tt?=
 =?utf-8?B?c1JmWWlCV21wYmJHcTd1QlZFWWtENU1iOE5PRXVvWW5PZ09yODRya1V6UTY5?=
 =?utf-8?B?MHhVd3VYNThTRDVpSndLVjlXeFVOV3laVGJ6WGh5Rm9FRVRUekpBMXgxUUYv?=
 =?utf-8?B?SG1yL1VNTExkSW1weDE3ZEN0ZDBaMU5tekpvVy9DTDdncnF6aGppYzMxcS9h?=
 =?utf-8?B?cnhYZTJRcmVJaE1xWHVQWnduSFhzditaanozanR5Z0RMK1B2ajhlcFF2bmxX?=
 =?utf-8?B?NWN3UWppOXJ1QkpYT3pJaEpnWWZOdkVQQm1NRmxrNWliRkZtY0w1cHltU1hm?=
 =?utf-8?B?c1IwalZ6THd6b3dib3hQN0EyU25HR0pNTnN6dWh3cmtWUkl6Qk9XemNqQUdw?=
 =?utf-8?B?bGJ6TDNVVXNiNTNnRlBKdEJLQVROWVovRFJTbGg4U3FrOWc4elVaS2ZJSGxJ?=
 =?utf-8?B?dThmemRXSU1ZUGd1dUNwNjBHTXV1aFN5OWVWWXNGOHIwZUNPS2l4UHFneFEw?=
 =?utf-8?B?S1NZUWpvZDlxeFo3c0lpSWRJWmhEMGF1emMyM2dnUlFzZGRhemZQcXZLTWw2?=
 =?utf-8?B?SGRIR0tmSUtQeFE2YytobVM2NG1rcVNXa1RUYmhrNGhLS2dqczQxNlNobjBt?=
 =?utf-8?Q?azcXX9qEOzq2j?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVdTNGIzbTRkK3U2MjZPNEJNSTQyQUVPRFd3bXo0SVdNMXVtdTVjSnliS0dF?=
 =?utf-8?B?OE9Jb0RJQXRhWFNMNUR0UGdCdWFxdzNKVG83c1VHWW4vUC9NSjV0WHBHd2R0?=
 =?utf-8?B?TVZKRVVQNitnejhZZEU4WEZnNDkzeVhld2ZxM3RLM3lNWC8wSEF1dkNkOXV1?=
 =?utf-8?B?QmwwRlprQkdkcnRPNmdmbHdad0RYNmpZV3hiNXJUcURpbS9QaGdyYXZZeThQ?=
 =?utf-8?B?RGZjNmhkM2pScmc4Y3U0SE5tQ2hZeVhtZmozOHpnNVRpZEV3dEMvazRuUi9T?=
 =?utf-8?B?VExrMW1FRVpBQyt1QnFoUkRDUGZ0QnVoL25GSFhGdUtJUTBSN3phQ2lpbmhF?=
 =?utf-8?B?L0l2akNWczI5bDh4U0kzMk1KNHVaVytscUQzbnRIYlcrU3JRY3RPSzN2OENm?=
 =?utf-8?B?dUlEQ2lwWVUxOVA1dk5YWFArbjNYYzhGZnl2aytKOGp0cEE5cDJtbDVMb0l2?=
 =?utf-8?B?N0QweElUZVlCM1hBSyt5bzhzNlVQSUZRWmdsUnoySzZySHVLS2NzWGxGY0Fp?=
 =?utf-8?B?eXkrNWlnV3NZVVhUVWJvNTJ3R0RqRWttNW9uUU9qVnBpY3JURzVKeTNQaHR0?=
 =?utf-8?B?b0tIVmlKMlpqa0xXMGNoSTdLSE94UWNKalZpaDFwR0YxOWRCejErRFJPdDRj?=
 =?utf-8?B?SDAxZmRrOGVwMkdJMTYyemhEOHd4b3lyMGdBdjBCb1MxQmtEUHdHdEFvYmM3?=
 =?utf-8?B?RldvL0pDMEpNTUZlRUNsbThBRHRCUVZPb3BKNEZkeXZUZzM0cWxTSjRLRXVx?=
 =?utf-8?B?cmFFbDZQdGpubkFIWk1LTFZocitkQ2pQSmVPSkI2enpwZFF4R0YraExsSit3?=
 =?utf-8?B?KzFZeEowQ3V4M1hTT0ZJNlM0dVlBb1BaR0EvbjlpcW15bXA5WTVBdHVabFVT?=
 =?utf-8?B?Q20zaEpxZWlWRC9HSnViTmlpVnl4bFBpbk1HTk4vU2hkOThSUHpTcS8wQWdm?=
 =?utf-8?B?cDVDSlRkb3YzN3RGaTMzSGdBYTVzMUZmMnA4M0k4Z2tTeStZZnU0bFB5YlI3?=
 =?utf-8?B?M05Wb1lOOGxnc0FuZjlTMWR0Q3RsUnh2WHJYbHNpYU9LbXpWZmpqbHk3WG1p?=
 =?utf-8?B?NmF6Wm1ZZkk2SVVqZHV0YUFXRXZiT1o5d0lwZDY4alByeHVHRDJCNUpvOHMr?=
 =?utf-8?B?MDVNUTRla1EyVnV2TTFIRkhzRVpXeDMwd3IzcWZRTjQrdnFESU5lWGlFdXJU?=
 =?utf-8?B?VjJNNXl1VHJZNWxCT2F4Y1Fwb3Q3Y2hJMW5TdElDT3pKUElSR0VYRy9VQnpT?=
 =?utf-8?B?ekVmTFhEZURBbHRpTFFHZDZBQXB1bFBmaUVJNDdHZnRaRm1xeHowNDBOM2Fo?=
 =?utf-8?B?aGh3ZXppaVZBaExueFE4VkNXdHpybzJjaVZ1bThzc2tjRm54ZGlmQ0RJc0VL?=
 =?utf-8?B?VHBDV0Fwc1RXekI0Q1VCREw5ajFRMWJDMmRHU3dOZUlKNXUvdTZwN2dMMkdm?=
 =?utf-8?B?d2I0OG4zNnpoTVk1TXNoaUpmNHV5VkpoUml1WmhVZ1BsYi9jN1p6Z2hnVy9r?=
 =?utf-8?B?OExHZVZDWHZQVHFkbnRLMWJCZnFLQ1RoYUhWeDlGQ1NjY2l0Q0pleTMyNTZE?=
 =?utf-8?B?NlY4TWdhNE9xQzkwVmZmc0NhWFU4V2NaZjMwSFJ0S21kKzF3eHVYU050U3Zx?=
 =?utf-8?B?ZlFSSFFabjRlTU1IdzZuZjRDcUNPQVo2SWdWb3lqY3ArVTJuaFNiR2pSbllv?=
 =?utf-8?B?V2tXdS8yS2pxRXIwOUM3SWZEMy9zUmMrY3EwTFJHNUQ5NFgxaVEzUFdpQ2lZ?=
 =?utf-8?B?K0VtckZIVy9URm5rTVdNMi9wWlp2aDBJQmkyTGEzVzVWc1F2UVVxQzhSRHZv?=
 =?utf-8?B?R1huZHpxc25RSWdRL1F4enRZUHpseVNFZXZzSXRYbVFzUGtweTEyMkxWTU9u?=
 =?utf-8?B?ZUs1akdEdU5uVU16UUxhVDU1QUF3bWZvTkhOS3BGSEtoNlBKbmhvUGpNVDF0?=
 =?utf-8?B?c3hmc3JWUFBrR2FyZUlER2VtMmM0akQ1ejNHNHpKdTRXODlxK21qeVZWUlMx?=
 =?utf-8?B?MlFkWUxTZTdVclgyMjNQRURKVmFFRW9XVFBlUE9WWEpNbHV0QlJ4SEFPeEIr?=
 =?utf-8?B?Zm95R1J5Z1BERnJYeENPRUZyNW91ZUxwYWg2NXpkZGh3czVwSXBqa3RLRC9t?=
 =?utf-8?Q?MhOQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c50aa3bf-246b-408e-64fa-08ddea9a1ac2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 03:29:35.4233
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hCdKaWaz8ciLjg5AFtK46hSABu91IPgjbZolsIUBTDvEvMpSfACXWElBQsjdGgU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337

Thanks Mario

On 9/2/2025 11:53 PM, Mario Limonciello wrote:
> 
> On 9/1/2025 10:39 PM, Du, Bin wrote:
>> Hi Laurent Pinchart, sorry for the confusion.
>>
>> On 8/29/2025 12:58 AM, Laurent Pinchart wrote:
>>> On Thu, Aug 28, 2025 at 06:56:06PM +0200, Laurent Pinchart wrote:
>>>> Hi Bin Bu,
>>>>
>>>> Have you sent out the cover letter only ? I haven't received the 
>>>> rest of
>>>> the series, and it's not found on lore.kernel.org either.
>>>
>>> I've just noticed you sent the rest later and separately, as
>>> https://lore.kernel.org/all/20250828100811.95722-1-Bin.Du@amd.com/.
>>>
>>
>> Before sending the formal ones, i did some internal test, after the 
>> cover letter, when i tried to send the rest, i encountered this error, 
>> 4.4.2 Message submission rate for this client has exceeded the 
>> configured limit. So i had to wait for some time so i could send again.
> 
> FYI - this was an AMD I/T SMTP server problem with git send-email.
> 
> I understand some other teams were hitting it too and worked with I/T 
> and it should be fixed now.  If you have problems the next go around 
> raise it I/T again.
> 

Good to know, sure, will raise ticket and complain to I/T if run into 
the same issue next time. :)

>>
>>>> On Thu, Aug 28, 2025 at 04:45:00PM +0800, Bin Du wrote:
>>>>> Hello,
>>>>>
>>>>> AMD ISP4 is the AMD image processing gen 4 which can be found in HP 
>>>>> ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
>>>>> (https://ubuntu.com/certified/202411-36043)
>>>>> This patch series introduces the initial driver support for the AMD 
>>>>> ISP4.
>>>>>
>>>>> Patch summary:
>>>>> - Powers up/off and initializes ISP HW
>>>>> - Configures and kicks off ISP FW
>>>>> - Interacts with APP using standard V4l2 interface by video node
>>>>> - Controls ISP HW and interacts with ISP FW to do image processing
>>>>> - Support enum/set output image format and resolution
>>>>> - Support queueing buffer from app and dequeueing ISP filled buffer 
>>>>> to App
>>>>> - It supports libcamera ver0.2 SimplePipeline
>>>>> - It is verified on qv4l2, cheese and qcam
>>>>> - It is verified together with following patches
>>>>>     platform/x86: Add AMD ISP platform config (https:// 
>>>>> lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
>>>>>     pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https:// 
>>>>> github.com/torvalds/linux/commit/ 
>>>>> e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
>>>>>     drm/amd/amdgpu: Add GPIO resources required for amdisp 
>>>>> (https:// gitlab.freedesktop.org/agd5f/linux/-/commit/ 
>>>>> ad0f5966ed8297aa47b3184192b00b7379ae0758)
>>>>>
>>>>> AMD ISP4 Key features:
>>>>> - Processes bayer raw data from the connected sensor and output 
>>>>> them to different YUV formats
>>>>> - Downscale input image to different output image resolution
>>>>> - Pipeline to do image processing on the input image including 
>>>>> demosaic, denoise, 3A, etc
>>>>>
>>>>> ----------
>>>>>
>>>>> Changes v2 -> v3:
>>>>>
>>>>> - All the dependent patches in other modules (drm/amd/amdgpu, 
>>>>> platform/x86, pinctrl/amd) merged on upstream mainline kernel 
>>>>> (https://github.com/torvalds/linux) v6.17.
>>>>> - Removed usage of amdgpu structs in ISP driver. Added helper 
>>>>> functions in amdgpu accepting opaque params from ISP driver to 
>>>>> allocate and release ISP GART buffers.
>>>>> - Moved sensor and MIPI phy control entirely into ISP FW instead of 
>>>>> the previous hybrid approach controlling sensor from both FW and 
>>>>> x86 (sensor driver).
>>>>> - Removed phy configuration and sensor binding as x86 (sensor 
>>>>> driver) had relinquished the sensor control for ISP FW. With this 
>>>>> approach the driver will be exposed as web camera like interface.
>>>>> - New FW with built-in sensor driver is submitted on upstream 
>>>>> linux- firmware repo (https://gitlab.com/kernel-firmware/linux- 
>>>>> firmware/).
>>>>> - Please note the new FW submitted is not directly compatible with 
>>>>> OEM Kernel ISP4.0 (https://github.com/amd/Linux_ISP_Kernel/ 
>>>>> tree/4.0) and the previous ISP V2 patch series.
>>>>> - If intend to use the new FW, please rebuild OEM ISP4.0 Kernel 
>>>>> with CONFIG_VIDEO_OV05C10=N and CONFIG_PINCTRL_AMDISP=Y.
>>>>> - Included critical fixes from Sultan Alsawaf branch (https:// 
>>>>> github.com/kerneltoast/kernel_x86_laptop.git) related to managing 
>>>>> lifetime of isp buffers.
>>>>>        media: amd: isp4: Add missing refcount tracking to mmap memop
>>>>>        media: amd: isp4: Don't put or unmap the dmabuf when detaching
>>>>>        media: amd: isp4: Don't increment refcount when dmabuf 
>>>>> export fails
>>>>>        media: amd: isp4: Fix possible use-after-free in 
>>>>> isp4vid_vb2_put()
>>>>>        media: amd: isp4: Always export a new dmabuf from get_dmabuf 
>>>>> memop
>>>>>        media: amd: isp4: Fix implicit dmabuf lifetime tracking
>>>>>        media: amd: isp4: Fix possible use-after-free when putting 
>>>>> implicit dmabuf
>>>>>        media: amd: isp4: Simplify isp4vid_get_dmabuf() arguments
>>>>>        media: amd: isp4: Move up buf->vaddr check in 
>>>>> isp4vid_get_dmabuf()
>>>>>        media: amd: isp4: Remove unused userptr memops
>>>>>        media: amd: isp4: Add missing cleanup on error in 
>>>>> isp4vid_vb2_alloc()
>>>>>        media: amd: isp4: Release queued buffers on error in 
>>>>> start_streaming
>>>>> - Addressed all code related upstream comments
>>>>> - Fix typo errors and other cosmetic issue.
>>>>>
>>>>>
>>>>> Changes v1 -> v2:
>>>>>
>>>>> - Fix media CI test errors and valid warnings
>>>>> - Reduce patch number in the series from 9 to 8 by merging 
>>>>> MAINTAINERS adding patch to the first patch
>>>>> - In patch 5
>>>>>     - do modification to use remote endpoint instead of local endpoint
>>>>>     - use link frequency and port number as start phy parameter 
>>>>> instead of extra added phy-id and phy-bit-rate property of endpoint
>>>>>
>>>>> ----------
>>>>>
>>>>> It passes v4l2 compliance test, the test reports for:
>>>>>
>>>>> (a) amd_isp_capture device /dev/video0
>>>>>
>>>>> Compliance test for amd_isp_capture device /dev/video0:
>>>>> -------------------------------------------------------
>>>>>
>>>>> atg@atg-HP-PV:~/bin$ ./v4l2-compliance -d /dev/video0
>>>>> v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t
>>>>> v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17
>>>>>
>>>>> Compliance test for amd_isp_capture device /dev/video0:
>>>>>
>>>>> Driver Info:
>>>>>          Driver name      : amd_isp_capture
>>>>>          Card type        : amd_isp_capture
>>>>>          Bus info         : platform:amd_isp_capture
>>>>>          Driver version   : 6.14.0
>>>>>          Capabilities     : 0xa4200001
>>>>>                  Video Capture
>>>>>                  I/O MC
>>>>>                  Streaming
>>>>>                  Extended Pix Format
>>>>>                  Device Capabilities
>>>>>          Device Caps      : 0x24200001
>>>>>                  Video Capture
>>>>>                  I/O MC
>>>>>                  Streaming
>>>>>                  Extended Pix Format
>>>>> Media Driver Info:
>>>>>          Driver name      : amd_isp_capture
>>>>>          Model            : amd_isp41_mdev
>>>>>          Serial           :
>>>>>          Bus info         : platform:amd_isp_capture
>>>>>          Media version    : 6.14.0
>>>>>          Hardware revision: 0x00000000 (0)
>>>>>          Driver version   : 6.14.0
>>>>> Interface Info:
>>>>>          ID               : 0x03000005
>>>>>          Type             : V4L Video
>>>>> Entity Info:
>>>>>          ID               : 0x00000003 (3)
>>>>>          Name             : Preview
>>>>>          Function         : V4L2 I/O
>>>>>          Pad 0x01000004   : 0: Sink
>>>>>            Link 0x02000007: from remote pad 0x1000002 of entity 
>>>>> 'amd isp4' (Image Signal Processor): Data, Enabled, Immutable
>>>>>
>>>>> Required ioctls:
>>>>>          test MC information (see 'Media Driver Info' above): OK
>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>          test invalid ioctls: OK
>>>>>
>>>>> Allow for multiple opens:
>>>>>          test second /dev/video0 open: OK
>>>>>          test VIDIOC_QUERYCAP: OK
>>>>>          test VIDIOC_G/S_PRIORITY: OK
>>>>>          test for unlimited opens: OK
>>>>>
>>>>> Debug ioctls:
>>>>>          test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
>>>>>          test VIDIOC_LOG_STATUS: OK (Not Supported)
>>>>>
>>>>> Input ioctls:
>>>>>          test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>          test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
>>>>>          test VIDIOC_ENUMAUDIO: OK (Not Supported)
>>>>>          test VIDIOC_G/S/ENUMINPUT: OK
>>>>>          test VIDIOC_G/S_AUDIO: OK (Not Supported)
>>>>>          Inputs: 1 Audio Inputs: 0 Tuners: 0
>>>>>
>>>>> Output ioctls:
>>>>>          test VIDIOC_G/S_MODULATOR: OK (Not Supported)
>>>>>          test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
>>>>>          test VIDIOC_ENUMAUDOUT: OK (Not Supported)
>>>>>          test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
>>>>>          test VIDIOC_G/S_AUDOUT: OK (Not Supported)
>>>>>          Outputs: 0 Audio Outputs: 0 Modulators: 0
>>>>>
>>>>> Input/Output configuration ioctls:
>>>>>          test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
>>>>>          test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
>>>>>          test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
>>>>>          test VIDIOC_G/S_EDID: OK (Not Supported)
>>>>>
>>>>> Control ioctls (Input 0):
>>>>>          test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
>>>>>          test VIDIOC_QUERYCTRL: OK (Not Supported)
>>>>>          test VIDIOC_G/S_CTRL: OK (Not Supported)
>>>>>          test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
>>>>>          test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
>>>>>          test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
>>>>>          Standard Controls: 0 Private Controls: 0
>>>>>
>>>>> Format ioctls (Input 0):
>>>>>          test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
>>>>>          test VIDIOC_G/S_PARM: OK
>>>>>          test VIDIOC_G_FBUF: OK (Not Supported)
>>>>>          test VIDIOC_G_FMT: OK
>>>>>          test VIDIOC_TRY_FMT: OK
>>>>>          test VIDIOC_S_FMT: OK
>>>>>          test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
>>>>>          test Cropping: OK (Not Supported)
>>>>>          test Composing: OK (Not Supported)
>>>>>          test Scaling: OK (Not Supported)
>>>>>
>>>>> Codec ioctls (Input 0):
>>>>>          test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
>>>>>          test VIDIOC_G_ENC_INDEX: OK (Not Supported)
>>>>>          test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)
>>>>>
>>>>> Buffer ioctls (Input 0):
>>>>>          test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
>>>>>          test CREATE_BUFS maximum buffers: OK
>>>>>          test VIDIOC_REMOVE_BUFS: OK
>>>>>          test VIDIOC_EXPBUF: OK
>>>>>          test Requests: OK (Not Supported)
>>>>>          test blocking wait: OK
>>>>>
>>>>> Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, 
>>>>> Failed: 0, Warnings: 0
>>>>>
>>>>> Please review and provide feedback.
>>>>>
>>>>> Many thanks,
>>>>>
>>>>> Bin Du (7):
>>>>>    media: platform: amd: Introduce amd isp4 capture driver
>>>>>    media: platform: amd: low level support for isp4 firmware
>>>>>    media: platform: amd: Add isp4 fw and hw interface
>>>>>    media: platform: amd: isp4 subdev and firmware loading handling 
>>>>> added
>>>>>    media: platform: amd: isp4 video node and buffers handling added
>>>>>    media: platform: amd: isp4 debug fs logging and  more descriptive
>>>>>      errors
>>>>>    Documentation: add documentation of AMD isp 4 driver
>>>>>
>>>>>   Documentation/admin-guide/media/amdisp4-1.rst |   66 +
>>>>>   Documentation/admin-guide/media/amdisp4.dot   |    8 +
>>>>>   .../admin-guide/media/v4l-drivers.rst         |    1 +
>>>>>   MAINTAINERS                                   |   25 +
>>>>>   drivers/media/platform/Kconfig                |    1 +
>>>>>   drivers/media/platform/Makefile               |    1 +
>>>>>   drivers/media/platform/amd/Kconfig            |    3 +
>>>>>   drivers/media/platform/amd/Makefile           |    3 +
>>>>>   drivers/media/platform/amd/isp4/Kconfig       |   13 +
>>>>>   drivers/media/platform/amd/isp4/Makefile      |   10 +
>>>>>   drivers/media/platform/amd/isp4/isp4.c        |  237 ++++
>>>>>   drivers/media/platform/amd/isp4/isp4.h        |   26 +
>>>>>   drivers/media/platform/amd/isp4/isp4_debug.c  |  272 ++++
>>>>>   drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
>>>>>   .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  314 +++++
>>>>>   drivers/media/platform/amd/isp4/isp4_hw_reg.h |  125 ++
>>>>>   .../media/platform/amd/isp4/isp4_interface.c  |  972 +++++++++++++
>>>>>   .../media/platform/amd/isp4/isp4_interface.h  |  149 ++
>>>>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1198 ++++++++++++ 
>>>>> ++++
>>>>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  133 ++
>>>>>   drivers/media/platform/amd/isp4/isp4_video.c  | 1213 ++++++++++++ 
>>>>> + ++++
>>>>>   drivers/media/platform/amd/isp4/isp4_video.h  |   87 ++
>>>>>   22 files changed, 4898 insertions(+)
>>>>>   create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
>>>>>   create mode 100644 Documentation/admin-guide/media/amdisp4.dot
>>>>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>>>>   create mode 100644 drivers/media/platform/amd/Makefile
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/ 
>>>>> isp4_fw_cmd_resp.h
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
>>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h
>>>
>>
> 

-- 
Regards,
Bin


