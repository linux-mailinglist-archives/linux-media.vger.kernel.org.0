Return-Path: <linux-media+bounces-38443-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 349EAB11A7C
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 11:05:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AAAB1891F4A
	for <lists+linux-media@lfdr.de>; Fri, 25 Jul 2025 09:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 289BE272800;
	Fri, 25 Jul 2025 09:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hg1qmCkR"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2059.outbound.protection.outlook.com [40.107.243.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE51FF7BC;
	Fri, 25 Jul 2025 09:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753434328; cv=fail; b=aJeT+KCMmHgIgA+wia7MRI6M+w7BvQFuoRMB5KOlOweuu0Cx43Q+dhFSc2TPFr1MmFftxAebdCcwRB9ovU46s8YQOXxCcPTr5vAF9LLFGMX69PNz5TLGSGNyQFQy4sQEL9O63CUqpokwIXPofB0rwnNk/GQUGXq15bzL6gxwZF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753434328; c=relaxed/simple;
	bh=RAa7PYhnIwph6G8zY14fexT+rZspIoOllM0/WyHs48k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G7VBqya0lNt7X5HQoLs85RTVgDsWn1e5a3QeFd4i4WylkE9oLf76dgV4ERA/Uk1hEpdyEcRYj6AaeOjf079AvTnEY5NQRmSB24sFwg47kIghsM+nV+vRyGV7Du038SgUp4BK7Mmr1OUalfxUndZIz8SCCOSygILJ4B9+OgRYbU4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hg1qmCkR; arc=fail smtp.client-ip=40.107.243.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y/OYnHMQy0vLh7pIikPGisdfgWJhdJjFKdE09ehFro027RY345Mo4cw/j8zgc3VlF+YsvQ0Gx022qeeXaxn9inoUj+IrZLwnEUZP1pd1uCw5IEi/wy14TLop1aafH1QCUY5z1VxzBIvz041bHlTrs6Sd03PjosZ6gWNAFqzxXUQncbuXLwCgmzDEF6ZrqiA0MbFrU+xZXo0hfUT+ot0MA+nhlUiLRZNQeRw39gN6bPZf7/v4B8j6U6G2HYIB9XjE6yal+kIdJ+k0REk5hOsuIqb59aiKzQ7gO4CKTYj68LOB+5w0IRbXD0JRSd/+71GO39mLT9necfniB14xd2h1bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW5MdC1qQZEHt9G2g2vcwnIVq6TdZN07GJ+DLSsSQqI=;
 b=joE73XkJizVl+DWWAn/Hg9qmy6jMzVy7gdzsXM3V77Ga22pvG8WVSzXscIBBWZ7pNkQdrdIPVh1CRkgDBWts/mO7URsh3exKgMgM+o7cZha2noCmg+lQc6GIK1l9o4rfPUKRMJO+l2oeCzazVjU6P08zhRpL/Q21z+baFaWJaPyV/iXim5f/Ap51yvKglQNg8N/QjLKLxmi/HsDX3BSdYACM8ZC60f0eu2T3yY/E9OFK6Y2dZfDTDm/U6B+DH6nFy4bSGHm88FJCWN0Dm4YOsh++JxmtIOhxm2u/jgOhiv7IkNWycnuK7x7xd3fZrEtfx2f3xk9UHqR2IQKYBrgxfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW5MdC1qQZEHt9G2g2vcwnIVq6TdZN07GJ+DLSsSQqI=;
 b=hg1qmCkRLaLe0UQK2r0ACGSP5qdrCIujGwfEvdABm3nfgoKGlbjH8kOgFg+TopmdEKh9i7+ngv9ZlcMKertWthBommr/5062JMlxSZlvjocPS3aFc0gx3flAFpP6aFFXOiSKsNqnuAZoc3uAfbmokDHv0n/JCXQLnaBrgaA3RC8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by BN7PPF683A477A9.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 09:05:18 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.021; Fri, 25 Jul 2025
 09:05:14 +0000
Message-ID: <6cbf96ec-67a2-44c1-84ec-57ca0582a0de@amd.com>
Date: Fri, 25 Jul 2025 17:05:06 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com> <aIEiJL83pOYO8lUJ@sultan-box>
 <aIHBO_2-hKWgb8Dq@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIHBO_2-hKWgb8Dq@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:194::18) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|BN7PPF683A477A9:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f8d0af-3a03-4f6e-d78a-08ddcb5a5e1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEoxZ0xoTXYxbWN3QzVUTHFXSFlqM25jUFgvTnRtNFB0Umk2YmJEbTlibERm?=
 =?utf-8?B?dVpuRGNhNVhqeE9ndmtQbThYREQ3TUZ6UVd6RTc2SjVMeGJVdjlFRnd3SGJP?=
 =?utf-8?B?Q1JtZHZQKzdGWCtiU0xhZlp4bm1CWHVIYmUyZ1dRY0NKQ1RodkJHMGxPZHdt?=
 =?utf-8?B?c0ptSkc2QnQxa0Y3RU9wV0ozMXFFYWZjaml2cjJjY1NwOTF5b0kzOFFPdW5T?=
 =?utf-8?B?OTM4VExwbDhnRlN1WGN6ampMM3puVUVjc1A5YUxnajR3MUttZXVCd2V2cy91?=
 =?utf-8?B?TnJRekM0RXRSeWlNZVpIMmNWNWVVQlJxUjk0UFh0ZzdPS3pRa0dzOEdlcU5S?=
 =?utf-8?B?SGUzUmVJQkQvRmh1MU1zWWUyWmRQZXorcFNhUjB2d1dLaGdJTDFlZnFwK1BZ?=
 =?utf-8?B?RnFvaXpUdXRlUnBoRmpQaGZvK1F3WWNvMG9WR0MwYmQyVDFHZDRoRzZ1WlR3?=
 =?utf-8?B?cUtMSU8zNzZRdWEvV0pkNDlrbXFQL3BwYm9xZG9qbzRBbHJ5azZKWXFpeXk2?=
 =?utf-8?B?WVQvZ2FCNGZ4MGNzVlBUODhuVkJrRUswcnZ5UW1VSDNpdWxrZmRGcG0xTzNj?=
 =?utf-8?B?aWtxU2VtcTM0UjhlVys0Q0tXRFk1OE9NblBvR3Y3K1hKd1ZpNlV1MXJHY2NE?=
 =?utf-8?B?a3ZORFpCekcyWlR2bm9DaDJEYXZ3ZjVFZzJYRDhDMko3OEwvQ0ZjekEvTWhj?=
 =?utf-8?B?a0dFZHBOc3dEWUNiS01iTWZzM25JQVN6SnJJOHpFcXFWRTNxbi9OUDdBTXdV?=
 =?utf-8?B?MHdMbVRoM2N6WFFXYjRVL1BmVUpPaXFhVTd0eFZicnNKK1V3cGZBb3I1SlBh?=
 =?utf-8?B?N29vMUJqOHhpYUNuS1gxUWQ1bHdZa0lHdFBlRlZmWGtZU09TaGhudUdYQ1NT?=
 =?utf-8?B?cW5xdExaWWd5cW52UEhwckIxbE1Xb28xa3hIbFdQTWNuL1hBbUpyZHpwMHAv?=
 =?utf-8?B?NEppSVpyZFdMTFl6UFBIMUVjTjNGMnkxMDdoem1CYmRIeHVuS1AwZGwreHBH?=
 =?utf-8?B?VHdEYkZaY2NLL3RYZWNuR0dMMmJCajArOFRkMUF2cUptVTFhZkVJcUFzUDQ2?=
 =?utf-8?B?czJEcHltdFlMRUsrWVJGbCtjVEtNU0R3bWNrdXZyYlNoMU9Xa2dERjJYM3hv?=
 =?utf-8?B?NkI4YzNEdklIckFBWmxlNk5qeXlnb2YrZkNOenQrQ3kwUW1qM0dzY1hvWlpE?=
 =?utf-8?B?VTVCYUF1YWxLazZoaDNJK1FDZU52eUpzemhLSWdseVpVMU0zTXpidG1KZmlU?=
 =?utf-8?B?OGsrTmZMMmZJZDZuUWlJeDlyc2JqMlM3VDBuTmhtd3MvL3BzWTZSQTIrajQx?=
 =?utf-8?B?K1hTUUVnb1pZdnFPQ2VoaGNwRFpOaVF0QXY1Tk9tUTRPU3p1bFVYSFExVmll?=
 =?utf-8?B?V29IQlZRdzBQNVNtOFpvKy8wRnF3c3padzNBQTRndkUrUzJ1d3hlY1lOMTlM?=
 =?utf-8?B?MDY3Zkt4akM0Qi9HVWhLYmxsb1BUd2ZoRjFrSmFwK294N0IzQTR6TnNvclJm?=
 =?utf-8?B?aWJTcUZhKzBvcDQzVVBHUGxuaUhGWklUdHErYU9PeEVja0lXUk1sNkVldjAx?=
 =?utf-8?B?ZWNyeHlLZWJ5MGVUbVRTMHExRW0yMHR2R1QxNU05cTJaZVdyRHBuUEMzVTc3?=
 =?utf-8?B?OWN4SDBQSFV0aHZtZlVTUEFVN3hVTS9iR1R0WlFWOUdxMEc1aENnYU5sWnpD?=
 =?utf-8?B?dFdISUNzbkl0VnBidElmcXFTRlpGeWEyZ3pxZUlKWmFlSy94anZkS3Uydlky?=
 =?utf-8?B?b1VNT2UyT0dZTU9JWVlyVlhFSC9UZklYREh5S08wTCt3c21GMnhMUUxsWmlD?=
 =?utf-8?B?Slc4QkoxdnVQekwrY2hLbERFMHAxZU1uY2FZNXpQbWxCR3Fmb28zWnZ6MHd5?=
 =?utf-8?B?bDZTRTVyenYzYzFBRGFKYVhmZE5ZVnJDS2xjR2pYbUx0WDg0aVhXV0NqbS9j?=
 =?utf-8?Q?R1WLb28WzLE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SittU0xpRlNFcUJtOTFleDcrWlV3emc2Q3FZZVZINExiRUR5OFpRbUNMMWZq?=
 =?utf-8?B?bmxWSERyNFJNZ1NuTWJ3ekZ1QmUySm5iK05Xbk5oVVVoWndQZTNaM2t0R1FH?=
 =?utf-8?B?aFg3WHZ1RU5QU09ZVUp5UmhGWlU4WU1oN0JaTFJlZy9XVmhHMWdXWjZ5blJD?=
 =?utf-8?B?c1hKYjFKMDhEeTR3RFFFelFHb3NhdXNLN0g5ViswcVBwOFF6NWJySDB4SVJT?=
 =?utf-8?B?WjZsb2NnOWk1blo4UWpjTjNBZ0xPRjdKb21kaHZEMWFvRS9JQjZoSk5RRWdH?=
 =?utf-8?B?SzhzUkN5TFVtcWZETWZHc0lJRmdCc1VMajhzeWgvZDZ2N002ZXN4MUJ0RXNY?=
 =?utf-8?B?dG5DWjRRcGp3SHl4YW5MZUw4bnZ6cU4zV2FBZ3ZIQnBVMWcwc3J6aU5EWVVV?=
 =?utf-8?B?SEJVYUV0aW14TGJpQzUwY1kvL2NwdzJOWUtRblgrcEMwY1hMNnBPRzgyREQr?=
 =?utf-8?B?Nk8zZXRpRWxMTW1pM3Z0a2psYnUxMlZ5eEttd0hBbVR1aEs0Um1KaUMvcGxO?=
 =?utf-8?B?RXRURDJ6WGcwd3d4SjJsYm1FYVdFS0hLS3p5R2NRRjVUVE1maUFOWWVFNXJC?=
 =?utf-8?B?TnkrR091WU1lb25pV0laMHBXNGpBSXlmMTUzVlU0bGFWckIxZ3MrenYrNDQr?=
 =?utf-8?B?Q2ZjV0lvUnE1dWpKcG80OHBYK2xjd1o1bFgvRndnK2hVaGVJcXJJQkhRRExj?=
 =?utf-8?B?UTM0aXc4bVBsZStEVUZtSU5NVGZuc3RWOXNPdm56VzBRQlVNVUZqbjEvello?=
 =?utf-8?B?Z2kxbG5YMVJFQURzOTY1dXdqUkFrNDByTXhhTGpicFVnbzN0MVZKQVJsMENJ?=
 =?utf-8?B?L0FvVHhDcmJTa045NHNwRUtzd2hmK2dmU0NrRzdmYjAyTHZuczZwYUdGV1Aw?=
 =?utf-8?B?d0RkdlNPR3pxN29QenZvcjI5Skk5U1I4MS9qVytKRjBaeHFOK0daQzQ5bkJS?=
 =?utf-8?B?eXZ3MUlzdkl2ZmxZYXlRSGdRL0pUSHVFZDJpZzk2QUVKVVNuZ3ZqelR1ekpK?=
 =?utf-8?B?NnZnUGhNcUpGTk02akpzbWpiL0J0WFI0T0ltMHE1N3N6bmgvaWdCcmZwRlhp?=
 =?utf-8?B?QitxalFSMjVxY1JjL0JDeGdNeEszZFM4Mmwxa1pWcm4waXQ0WE5Xc0w3WGFB?=
 =?utf-8?B?MWI3SVo3YkRMejh3UFlFb3pMWDBXZGdWTmFHWVl5bE10alhiR0hxWVZ1K1FD?=
 =?utf-8?B?eU52UTAzN0NRcTBkaGpvZFA2Y241VkVvbXpLUTZuazMyNkUrV0NjMkY5QWo5?=
 =?utf-8?B?TWdtVjhCTmRxTEhIVVMrbUZPYlg1V0k2SElCd3hjR2pJb2FOTDB4QllheFFR?=
 =?utf-8?B?T0tNUTFydGtXV2xQOS9BdkUrNWhmTmZDdVpQME56d0dOL2JXU3FCaTNnMVM1?=
 =?utf-8?B?RThNN1ZORkFOQ0Q1ZUZBbUEzT3RoZzBLeGYrZ1ZLUmlmR0tZMzJNODIxbDly?=
 =?utf-8?B?a3NkRlV6eVNBYjhRbm5aaEtObndQWkJzVURBWVhwN3hvQnBWcEVLRm1VeUZC?=
 =?utf-8?B?UkpmZVUxY3RLeFQ5VjBPN0tMR1FPRHNtZ3ozUnViRzZ2WHowb1FOWE1pbHBl?=
 =?utf-8?B?K1JHbWVhbXEzSUt2Q0JweXNkLzVxZ3BXbmZ6bEpmTExBbU5IdTJJYm1EZEJ6?=
 =?utf-8?B?QWNqT0x5YTRWQnVuMUJoUDdQY1AyS1lIbEZaMGZ6ZkUrSHZJNVFnQkxQVlEw?=
 =?utf-8?B?M243eE5rRnl3U1hxekx3NUNZRmtSL0NTNUpTYm5SWHM2dGdXdDFnVUhqMVJR?=
 =?utf-8?B?b21rRDM2RTRuNVJmeHR2TG5HMkZ1WUZnaFhQYjlTWHNYRFB6SXdYYnhBMlkw?=
 =?utf-8?B?dkpWQzZoeU5YaklnZUZnUlVROXJrZHNVRGVNaXpBTGsvckdSWS9tQ3lsUzcx?=
 =?utf-8?B?RUpzQ1VGcUNHR2RreXFCNWhJZ3JEbFVsTG4ya0hweTNCVTZVZEJKa2NOMlNi?=
 =?utf-8?B?NGl2cTZFaWovVG5UcVlySjNhV0g0Vnc3QzJJdFRqSnJ1Znhpemh0QW9WNG1s?=
 =?utf-8?B?SFhMR2YwSFVhdkF5S25mZ3JxaDJlaFBndHViWG5jU2Z1ME5RVnZaeEI1Qm1l?=
 =?utf-8?B?bTd5N3d6VTJZTk1DejBla2NYNzNkc3daMzY5MStoc1lpdnVDWjZUWnpsSlpK?=
 =?utf-8?Q?ztzY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f8d0af-3a03-4f6e-d78a-08ddcb5a5e1f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 09:05:14.5946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zXGZ0gJorfxC7l4sSc0I3cJ1n8/WE4fB6ejOA0cPBKNYPaasEP5mCsKoS26Rsv8Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF683A477A9

Thanks Sultan, never mind.

Regards,
Bin

On 7/24/2025 1:14 PM, Sultan Alsawaf wrote:
> On Wed, Jul 23, 2025 at 10:55:48AM -0700, Sultan Alsawaf wrote:
>> On Wed, Jun 18, 2025 at 05:19:57PM +0800, Bin Du wrote:
>>> +
>>> +	buf->bo = (void *)bo;
>>> +	buf->gpu_addr = gpu_addr;
>>> +
>>> +	refcount_set(&buf->refcount, 1);
>>
>> This discards the refcount inc triggered from amdgpu_bo_create_isp_user() when
>> it calls get_dma_buf(), leading to a use-after-free. Move this refcount_set()
>> up, preferably right after vmalloc_user() or right after `buf` is allocated so
>> there's no risk of this issue occurring again in the future.
> 
> Following up to correct myself: please disregard this one comment from my
> previous email since it's incorrect. Sorry for any confusion.
> 
> Sultan


