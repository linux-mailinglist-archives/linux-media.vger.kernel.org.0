Return-Path: <linux-media+bounces-36942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE798AFABCC
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 08:22:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1A533B70C5
	for <lists+linux-media@lfdr.de>; Mon,  7 Jul 2025 06:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD85214A8B;
	Mon,  7 Jul 2025 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="k51RDhxQ"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960AF21C19E;
	Mon,  7 Jul 2025 06:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869334; cv=fail; b=BzzX5qKTVuHhsTrtwrvfxUxElVRQ1tbzmJxt1elPDKHfG3aavklTWzY+ijezFvxiWKCFQisCYY+bV9YqroItL5jpBRcMi898H636hmoxsjWIF2v+fAyqI/JlFRrI3tqEA5RDMEhenxvwwB8GzSApupe3wPTpmCIWKZJ6kI1V1ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869334; c=relaxed/simple;
	bh=KgG3k2sB5xcereQv7JH5hITg+dnp4f2EvDBiKAyfOmo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DgFVtE8Nrk4QcvsZdv4aFVJj/xqqzGKiYQuMlERkPhye8nR/TKUyd15GBFnGrUPhiPl3axZl8YuWDl9VTabhmNsmw2gqrLiQPvYHpAj6q7/U8gclrcZJDBOoJCD/0e8AZE+DihIQumECwqyP9m/BFyPV4NV6omSVVB+vGu+N+to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=k51RDhxQ; arc=fail smtp.client-ip=40.107.236.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HYQA2fFc9q4kob4TqLMROX5Vx8H/Kp0ThFhryauyjPS8u7GzvFlPGnFmMUOFgrH5QhKkNryJUyKVdqY0T9/rEQAnm3Qrhv/YGTF0fyX3Ot4q8ZIORmAIrIa4sCUdST+dMVnWA27QFS837J4JrIySSl145cmQLk80ujhn+571X1hgkUCr9mM5pEgcql7OOhQ5RH/7iBrafJ+XQd0wZxhDAZS+qVq6WpTrFPGjMM2JCQrmbVPZkO+sRddYgWRgEuKMEQP4+YiGgozUf2fATSeP9YmORiDjHI08zZxITzcpwklIWLhdT37d43AyuIwPZVMhnX/iL7DDknuPyCXeL1d+lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajaO0942wYrhATVCismB9SPrSZyJMQ3cp9TqYq+Uolk=;
 b=Rxck7l5V62LZi8Wtiz/xMpimM5mwS0Vgmv4cbxPXbOV0OOER5AbTbuQvQg3k5ijmSvXyD2e5Y9Y9skpDpBLHSdK/7c4Vi1X6F5HVk25bEbzaRgLnuOS8NcmQBMMQvOi28TaAhrWw4HYqXw3bLRdAWNDIcKZkq+tbtWniXtsx37nfSp3msguOlY7w9vgA00Mb671wpgV3rBsiH2T3vXYwaIHS1ywjn4Ju6vc9D7DjWWx8ogMhsC3sDGNdAFw6rgEj1m+lCfYh2TTgAoIjIpbyUKTquGlbKfjAa+GG+fTgWUdDhpGQ32mTv1PwgsrdT8pS5XH6r9rHB6CuLfXIXitDkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajaO0942wYrhATVCismB9SPrSZyJMQ3cp9TqYq+Uolk=;
 b=k51RDhxQQ0p/Pbl71y17cfo38f8k10aR0zXriKecZUVZQtA6I8HWpmTtUT1UTjWf+kjsfna8+uc1Krzd16cJ0RF49swCUM9nPo3ljVJGWW4t9LIi61Itf2J4ZFFU7vaxQZzVP+aiEHNpuFXkptS8Ng4iOvJDMIoLdYeNSYragnU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by BY5PR12MB4162.namprd12.prod.outlook.com (2603:10b6:a03:201::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.34; Mon, 7 Jul
 2025 06:22:08 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8901.018; Mon, 7 Jul 2025
 06:22:08 +0000
Message-ID: <43361240-dac2-4d53-9596-6d69d95200f6@amd.com>
Date: Mon, 7 Jul 2025 14:22:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Mario Limonciello <mario.limonciello@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-6-Bin.Du@amd.com>
 <6825c4cd-611b-4efe-a988-3ca7dd1f876d@amd.com>
 <c6fa17fe-a334-4296-bce5-d0b8851b69fc@amd.com>
 <c5d3ff66-85c2-4de4-9f5e-668e39b2d78b@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <c5d3ff66-85c2-4de4-9f5e-668e39b2d78b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0101.apcprd02.prod.outlook.com
 (2603:1096:4:92::17) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|BY5PR12MB4162:EE_
X-MS-Office365-Filtering-Correlation-Id: d3af1dcb-76d9-45c8-3a3e-08ddbd1e9994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFJ3TFR3RXdjQUZRdVhKN2hIK0NSUDFvcS9tVjhrMFNnK2szbzIvRk9rZWE2?=
 =?utf-8?B?NFAzK09FY2UrY2U2Zm1lVytvZkdEdnlzUnFyZnY3YkxvQlZPNTB2MDhuTURE?=
 =?utf-8?B?QTVEcWY5U3hHWEZlYmVOWDhoNUI5YmphRjVCZ21vbURmRTE1UldEdlcvTmxv?=
 =?utf-8?B?OVF2UWk0cjQxYThvMDRSWUVJTTdzQUtlSUQ0QUpTRUEyQWxxK2ZENVNRMVhF?=
 =?utf-8?B?a01oUlRnUlJEK28vbWdUdm80U2RQSWoyR0JsMFNaN0M1ODJRVjB6Y1RQTGl4?=
 =?utf-8?B?OHd0c1F0a3BUempZQ2NVNlZSNU9LYk1KSnpKVnljTEVhN2dNdWlzS3VqQnIz?=
 =?utf-8?B?YWdBUXNld3hDT0czTzN4L253d2UyS1d4K1gwTE9VZEZXRXhJeHo0bzF4QVBS?=
 =?utf-8?B?czlRdHk1RmFNemtBbWYwZUtueUdadVJRRWExbWtmODlyT0lyNUpPUkFMa2FI?=
 =?utf-8?B?MUJROTNNRUV2TCtQdmY5UGJnMFI2TXRtM3VQbnF5TkgwYVhkRWQwUC83dEhS?=
 =?utf-8?B?Q25ZblAvRURZWmFpaUYveWtEMkZJMzJDZDVsWVdhYlNaTlU5ejgvbmlsbzJa?=
 =?utf-8?B?ZUlQc1oxbGR3QXJpL3lvcTNFYklQeU5FK0E2UzRBZnJqMFd2cW03MkhpOGUy?=
 =?utf-8?B?dmpnTHR3UDBDd2lxZzBCaW5jTkduRHBqZ0dPekZQdzlzRGM3VVpsNm9MS0FR?=
 =?utf-8?B?SXVESFltNm00Z3RBdXBYRFFqMHVxSkJlOVNVOU44U2NNOVYxblpwOFlwL3pZ?=
 =?utf-8?B?Yjdhd2l3R0VpRm9ndlRWSW8yakxMRWIyT2d6QTkzanFnNk4vNjVnU3M5RGpt?=
 =?utf-8?B?dWV6aC9naXJ2TDVOUVpyaTdDU3E1T2pWcG9UUUhhNkZ0SzdOSG9NNm1yZE82?=
 =?utf-8?B?VFRXd1FyckczU00vTyt0YlNxc0E1a0lVK1I1ZjArem00TW9HdjFjN01QMG12?=
 =?utf-8?B?RW1qVHpYNDNLN0I5LzNqRzJIQTZXNFhaT3g4bllVRnpydklEemdVRlpyazhX?=
 =?utf-8?B?cHpJWVljNVlnMXhoMnNpM21URVU4UUVaYTVZZzcyaWM0ckd1aHhNR20zeHVB?=
 =?utf-8?B?L202K0R4cXRqNVBwZWQyeFY2alBFRG1ucTRoT1lHbEdmMUxxOUxGM0Yzcmlu?=
 =?utf-8?B?N0Y4aTVOc2NqT3dqTzdNckdKYUhoSlVOSGdJQ3BVZlVkQVFqdXlSMmRaSm5P?=
 =?utf-8?B?cWMrVkFDTW9DV3BoWTQ3Q25ZNERLa1IwMW1na1lJTDBCeFZHZk5IRkJJVlhU?=
 =?utf-8?B?QWZrVGY1Rkh3dTJaNnFoU2FWVytFMDJKQ052dWhONmtPN0lKSHE2SFgzUUdi?=
 =?utf-8?B?cjZhdVI1OXhjbDQ2Ym1CUTJRY0pXYkIxWGFXUWhtQlNEOWJWT2VoZHBPekQ3?=
 =?utf-8?B?YXQrZnp6RS9KK2pnekp4Tys1cWYxUlFOWncvM2NjOXJOd1ZWZHlxNWVlNGw5?=
 =?utf-8?B?c2hyb3cxMElBWXZiTzQyK2lsMGc2V09pL2hYaXJRRmF5R2JyRjVtTmdpRHcz?=
 =?utf-8?B?ZVlXU0YvYTc2YklhYTR4UHJFL0EvVlorN0lUdkZoVW1JMnJuamNuWWliTGsx?=
 =?utf-8?B?NFZLTnB1eEQ3LytPV0tZQUxHc3FJRENRdUFQQjlyYnNvZFM3eHNKbHlvQkxZ?=
 =?utf-8?B?aHNaeXhNQjdsUC96bFdVS3MzcTdpeUM3K0pUaDNqVWpLSGFSNnA3QzBadFVR?=
 =?utf-8?B?TVUvUE00RTJ1NzcvdnlyZDlreDJpK1U1MlM0bFNkVlV6RmtqUWVwY3RaTDdB?=
 =?utf-8?B?c2dHSzNjM1BsOExZRTh1NkVscGp2U0JwMDh0c3lUcUpMRndlMHRkU1FFMms0?=
 =?utf-8?B?cng5RGVZQm13SUNCR0xId0dJNFRTZjNCcWlzRjR6MXllVlFPdE5iVDZ2Q3gr?=
 =?utf-8?B?dmYzZXJ1cHQyQ0JkekZIWnlOY01XcG9WYk1jM0Qza3ZYZmx0SEZ2d1Bjc0ZR?=
 =?utf-8?Q?26Ys8IpDDLg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEtod3cxbnRGVkovZnBRUWxJelN4Z1dNYTF2bGJTbDRGekFUL251cnltY043?=
 =?utf-8?B?VmNNNzcxTUgzaE45cU9nbkNORU9WTnNmYUx4Vm5TSjRJZ29YNWxFTDVKVmJT?=
 =?utf-8?B?MnJKWUV6aHRVdElhRkRDdGpTTUtocDRFYTNNN0owSjFGNjdVUk9tYWxVWEMr?=
 =?utf-8?B?dTNsTVh5U3YwdWJwTUJvMmNkZTJ5RXhuQUFlTHBEUnlpT2JnNWc2VFJ5K1Nw?=
 =?utf-8?B?RityY1dBcmhPbWtXdjdCeDcxdXZFRXI4NEZab1VLZTZIRXRBZzF6ZElXTlNB?=
 =?utf-8?B?am5oUzBLTGNJMW1mb3J1K2RhTUt4akhpWW1sNHVqZUZValRkbXRQRWM5S0pS?=
 =?utf-8?B?NWNBci9zYlhIOVpQczFvZ3BQa1hQOTQ3V3NQdUxCMnZ6M05jK1BlQ1RRdTJo?=
 =?utf-8?B?R3VPYjZIa0crYno2enFoMVVBTUcyTkJGaDdRQlREY0RQQS8ySFRxK0FHcHFu?=
 =?utf-8?B?QXhVWXpXZ2E5MlloVFJJNHZkMXR6Q014d3FMTlVoU3Bnb2ZHSnJDbndBb2pk?=
 =?utf-8?B?dm93ZHRtZ1pqRzBaZDR6MUNtRjUrWm9Ub3NSNXBuRkoyOVBIdHMzb2dFay9H?=
 =?utf-8?B?VEIvRG5BUEVYQVZrWWxvY1hiQVJodEtGMXRaNlRVZlo0bVVJWGM5SUlZRnhL?=
 =?utf-8?B?Nm1JWjRGbGxVc3lpcTZSSXJjaUZ3Umpva0doUFV3OG9XSEJpbFBxdWU3aXQ4?=
 =?utf-8?B?WldnZDZyaDFVbjdHTnRzcEJQK01PUHlBa1NLb2FVOEk3T3lvUEhLTHZGTngr?=
 =?utf-8?B?UDVnV2RuWGhIY0d2d2VPQUt5Y1gvT21oWXRkdS9FOHI5L1h5QjRjMlJDWEVp?=
 =?utf-8?B?bSt3Rjh5S2ZCckhYOXVVYksxR2lyRjNKLzRkb3VRYlZhWUY3VmdlZHhNY3BS?=
 =?utf-8?B?WXo3SklzRHp5TEovd1IvRVJEbmVYallWa3h3VFBwYko2SDZXa1cxV2pWY3JB?=
 =?utf-8?B?VmJjcG5NdTJON2VvS0orNVRabDV5RmY1QktMQVJWMjI3TWVueHc2NXI4R0Za?=
 =?utf-8?B?Rkh6bDR6K2U2SXRDdXJtMFZ5Y1BlR0ZEQVlRS29IR3pwcHQvNDU5YkZvbTJM?=
 =?utf-8?B?N1Fid3laM1QreThFTGZHMVpVYklrb0U5TXROaFlDKzB5dGg4dmdHY1hocGNQ?=
 =?utf-8?B?VVMzRUNueW52RzhoUnJmQytMaVFNNWNlcFV1MUUyYWVFL0ZEOWtzdFdhSVlo?=
 =?utf-8?B?cGEyQU9xRXlCblg4aTlmVENEOTczRko0d2h5WUc4WkhveXdXYStWL3ljL0RP?=
 =?utf-8?B?TFFsUnVrU0Z1aFdlTmtycmZKa2xidGl6ck1mR085THBmSE9xQ2c2VW1TaGl2?=
 =?utf-8?B?bHFLMHNWemo1K1pqcTZoYTZOV2NzY1h5TzZaSzh6dG83ZUVOTjdiY2wvL3Nl?=
 =?utf-8?B?NTlpcktYTWJKMmxtSkltNmh1aDZ4UDN1L0o4T1p0Yy9uaTliV2RrZGZzWkdi?=
 =?utf-8?B?R1B2Tjh5QlhxeTFDNlZ4dWh0UmdZY054dlBXbnYyVTA3NXoyUG1XVmxrUWZx?=
 =?utf-8?B?ZWdNUmRYZ0Z6ZkpEWG8rbldORm9LUkRsT3NsQjFHVU1SNVZHd1hmL1Z5OFdj?=
 =?utf-8?B?U2RCdERndDV1bkZsbk9VSEx0bEhxOHg4ZXVqbmVoRkJRdHNsU1IyNTZnWkZC?=
 =?utf-8?B?M3U4MW14cjdBRExIRVIzTEJDN2NwdE0vODhwSitkWVh5U2RrVnY3dXJlNG8v?=
 =?utf-8?B?cG5DaU5UTC82a0JzcGVrS0crZDY4Vk9FSVJncDBKYStwL0dvdHZDZVNxRmNW?=
 =?utf-8?B?YWxrdmpyRDNVNEF5UG9qUmw1NnN5aGtnUkVDWnEwY05Ta2s3Z21sQ2hXOWN0?=
 =?utf-8?B?Si9YbEcvY0d3NEtVMzRuNFV1TytDZ0doVFZQYUVta01pUG8vd3l3c2tITVQv?=
 =?utf-8?B?cDdlckVEb3NxZ0krOGJzZkJqT3dadTNnS0kzWVAzTGpubDJWeWhlKzlKb0xw?=
 =?utf-8?B?OGF3TFZtRkEzZy9hcHFaWWxMYlN0WUE4dkhmVVEwamJHSDh6RGlWWTlyS0pm?=
 =?utf-8?B?dGZ5U0xNeVYwdmhaVDFYT0FBc2l1UkZ6NG5XOWlibmRlOUNUdFE1K0hDN3JL?=
 =?utf-8?B?N3M1c2U1NTllY0tsR2RsV0hyampqM1NNZURrU25DM09IZG56NnRJR0t4WW05?=
 =?utf-8?Q?xyn8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3af1dcb-76d9-45c8-3a3e-08ddbd1e9994
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 06:22:08.4632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vgTCMewmaQ75L0NChCYCnUctrvOGSzb5V5RUDP7BzOKQBJie13ojTS9rqBzFLKX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4162



On 7/7/2025 4:55 AM, Mario Limonciello wrote:
> On 6/20/2025 5:31 AM, Du, Bin wrote:
>> Thanks Mario, add some comments
>>
>> On 6/19/2025 12:35 AM, Mario Limonciello wrote:
>>> On 6/18/2025 4:19 AM, Bin Du wrote:
>>>> Isp4 sub-device is implementing v4l2 sub-device interface. It has one
>>>> capture video node, and supports only preview stream. It manages
>>>> firmware states, stream configuration and mipi phy configuration.
>>>> This change also adds interrupt handling and notification for isp
>>>> firmware to isp-subdevice.
>>>>
>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>> ---
>>>>   drivers/media/platform/amd/isp4/Makefile      |    3 +-
>>>>   drivers/media/platform/amd/isp4/isp4.c        |  267 +++-
>>>>   drivers/media/platform/amd/isp4/isp4.h        |    4 +-
>>>>   drivers/media/platform/amd/isp4/isp4_subdev.c | 1192 +++++++++++++ 
>>>> ++++
>>>>   drivers/media/platform/amd/isp4/isp4_subdev.h |  145 ++
>>>>   5 files changed, 1601 insertions(+), 10 deletions(-)
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
>>>>
>>>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/ 
>>>> media/ platform/amd/isp4/Makefile
>>>> index c0166f954516..52defc06189e 100644
>>>> --- a/drivers/media/platform/amd/isp4/Makefile
>>>> +++ b/drivers/media/platform/amd/isp4/Makefile
>>>> @@ -3,9 +3,10 @@
>>>>   # Copyright (C) 2025 Advanced Micro Devices, Inc.
>>>>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>>>> -amd_capture-objs := isp4.o    \
>>>> +amd_capture-objs := isp4_subdev.o \
>>>>               isp4_phy.o \
>>>>               isp4_interface.o \
>>>> +            isp4.o    \
>>>>               isp4_hw.o    \
>>>>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>>>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/ 
>>>> platform/amd/isp4/isp4.c
>>>> index d0be90c5ec3b..c1aca2bd35e3 100644
>>>> --- a/drivers/media/platform/amd/isp4/isp4.c
>>>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>>>> @@ -5,13 +5,20 @@
>>>>   #include <linux/pm_runtime.h>
>>>>   #include <linux/vmalloc.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>>   #include <media/v4l2-ioctl.h>
>>>> -#include "isp4.h"
>>>> +#include "amdgpu_object.h"
>>>> -#define VIDEO_BUF_NUM 5
>>>> +#include "isp4.h"
>>>> +#include "isp4_hw.h"
>>>>   #define ISP4_DRV_NAME "amd_isp_capture"
>>>> +#define ISP4_FW_RESP_RB_IRQ_STATUS_MASK \
>>>> +    (ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK  | \
>>>> +     ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK | \
>>>> +     ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK | \
>>>> +     ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK)
>>>>   /* interrupt num */
>>>>   static const u32 isp4_ringbuf_interrupt_num[] = {
>>>> @@ -24,23 +31,233 @@ static const u32 isp4_ringbuf_interrupt_num[] = {
>>>>   #define to_isp4_device(dev) \
>>>>       ((struct isp4_device *)container_of(dev, struct isp4_device, 
>>>> v4l2_dev))
>>>>>>>> [snip]
>>>> >>>> +static int isp4_register_subdev_and_create_links(struct isp4_device
>>>> *isp_dev,
>>>> +                         struct v4l2_subdev *sdev)
>>>> +{
>>>> +    struct device *dev = &isp_dev->pdev->dev;
>>>> +    int ret;
>>>> +
>>>> +    ret = isp4_create_links(isp_dev, sdev);
>>>> +    if (ret)
>>>> +        dev_err(dev, "fail create isp link:%d\n", ret);
>>>
>>> You're discarding ret here.  Shouldn't you return ret in the failure 
>>> path?
>> Even if it fails, some Apps which doesn't depend on the media link can 
>> still work, so just print error message and ignore it so at least 
>> these Apps can still work, do you think it acceptible?>
> 
> I think it should be a warn or an info if it's an acceptable situation 
> along with a comment to help us years later understand why the error 
> handling is that way.
> 
Sure, will make it warn and add comment>>>> +
>>>> +    ret = v4l2_device_register_subdev_nodes(&isp_dev->v4l2_dev);
>>>> +    if (ret != 0) {
>>>> +        dev_warn(dev, "register subdev as nodes fail:%d\n", ret);
>>>> +        ret = 0;
>>>
>>> This isn't fatal?
>>>
>> This call is just expose subdev node to user space, even if it fails, 
>> some Apps can still work, so just print error message and ignore it so 
>> at least these Apps can still work, do you think it acceptible?>> +    }
> 
> I guess same comment as above.
> 
Same as above>>>> +
>>>> +    return ret;
>>>> +}
>>>>
>>>> [snip]>>>>

