Return-Path: <linux-media+bounces-23874-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530019F9248
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 13:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9940116AD68
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 12:36:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A0921519F;
	Fri, 20 Dec 2024 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="wZ9h450W"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2056.outbound.protection.outlook.com [40.107.247.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53C02594B2;
	Fri, 20 Dec 2024 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698167; cv=fail; b=SPxr8RYNLDeTiyaGp3OojwnVfo50z7YqSoV3O9k/E4mtzq4C14bN/iSXfdAiXZJqSt789SD7x4KUXOyszwdXHVR12qOOPTGzQAIfTX7NTRsv4SoI4HGK9U6j/LPq0+D0PcHnigIYK+IlK+6EUcKP671ChIouqlQVuFXklcKagIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698167; c=relaxed/simple;
	bh=AvGnJ0N5/kSD/TOUidJiBsIjmM2akYykMWC7IsD4LtQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=loeoadTZpH4BfHkmV/Q6lq2UBhZvXDZSHaq/h7KvvGXXlY35dxcFXDiBvBCW5rhSW5UfNMWNQMjCkQYSzxNT6b7IlPkKdhDpTLZ8lXkxxyJUT6juqNtxLs1MUP+5V2Lb/g02j6ktgsQBnkMhEPtkVwou0/x59B16P9hjvoqvWh0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=wZ9h450W; arc=fail smtp.client-ip=40.107.247.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPraxjqPgra0ijFb9rKJ38JhFCRjqBSnSjPEuODcWdVcl0s2i3hY7Ewc1GFzT3wuoWTVxKIiSA6oJa3lALy9NzLgVFU3Xa/2uGybiw6r5ma1tlxtL0ZVn62YeoPBuYPW7SOIIbJLW5qHvqOyV+QxSQU7jN39n0RoQhvkGxn2SLufBOkdpeAiMEGg6PX6LRFuleKsgjb3bh0SBlVE9ziRMqCpWzIWl7TO8WbQ3RlwhIr1rqTBAN6ff4Ek9BQk5OwJQsuftSr7A0zdc77Ifzl7dOzggUztDvtFLr6GePhaKwv3MnWgYkKAJ6kOAsO2HKWydApcfEcd/gPO3wHXWDx3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7cSB+B4KZSTNlLThf8oGP6QS0niocMJAtIzzpi0DJQ=;
 b=NozlGnNc7r+/FjK1mw6sF15nm6E9JH7qpuJzBYVHvOtwtJPooLVGw47xy7f4SY1ehvONJnxngxvGEx4XEfCI2Cmkg4aeQk9VNxrDPweD0jSre3jSeUQzhXLIt5AM4L04O5yJ97ggokxPZn60i6FDC8gAdOqlT9quwUebKVOBO69VthXka6gay1GGbi9a0r5MvkI8jtTUQLiYC3Xa7teHIIzyE7zE1fz3X8qn1LJoYdmUNo0IS0RVBikEknA+o+xCOYYOJpEGepblEjLLB6VyTg/9HLTfjdwh2D9xyhlSfHoRsZxVKQvIEQGbqSP852667F/x4auVA+cW2kMmpPm+8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7cSB+B4KZSTNlLThf8oGP6QS0niocMJAtIzzpi0DJQ=;
 b=wZ9h450Wld65MtcdI1qSuP3XBz+Q4obdfJv1qQl6dUxAICzq1AMZeyCHx3RAhvABUGJeDmR3t1AJEtuqlnPJPO8T5nbnvJ1CfGeqrnV5WH/00wP+Dj+1bLLLhGW/Bl+c/CPKEwvk84UI0jFdBFVJYR30eqcvG9iTej0JOwMtZEBXyy9rE8PimUknyjkODJbYfVN7q61q/bNWFdsXajX2bdsXMLWyw0qwGcKHsXI4j1E1aMEq6vF4S1VNqFU3A84cepsGL7yw8wq+hyGHuLA+DsBJ7HNdTscNFrgVDVx3MxeCf+LAoVO9Nl0Lysxr23CSboxTHOzg1RJO2oueDOeffw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by GVXPR04MB10047.eurprd04.prod.outlook.com (2603:10a6:150:117::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 12:36:01 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 12:36:01 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 0/3] staging: media: max96712: a few, mainly cosmetic, changes
Date: Fri, 20 Dec 2024 14:35:47 +0200
Message-Id: <20241220123551.696330-1-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0156.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::23) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|GVXPR04MB10047:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e2082f6-0704-4e01-1083-08dd20f2dcb1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjVnalAxYlk4RFVlK0dSK1lNTU5pMWs2cm5ncUYydkR3dnduZWZ0RWlJaDAr?=
 =?utf-8?B?U1pxS04xbFZYV1d0Z1MwS3V5c3J1WHhpQ0t3Y1haR0FHeEh4ZlZSb3JoMFh1?=
 =?utf-8?B?d3NKR3lRZmJqMmFMN3YxVmpiSnI4SUV5VzhoZmJ1YTN6emEwOHJjMFhsV09l?=
 =?utf-8?B?TnBwQXkyckhOKzNUYVEzcjFNekRGdElrS2tkREl5WmcwblEyWkhiczQwL2Nq?=
 =?utf-8?B?cHplYVY4bUx4bU5zZUNhUFE5UEtLS2dKd2cyTy9LenhlU1hQaXpvRDlqWDRH?=
 =?utf-8?B?MUlxL1V4MU9Cb0I4RjFsT2RMK2ZJM2lDeXhPaEx0MTVTVTRPWkZITTNNQmMx?=
 =?utf-8?B?S21uMy95ZlBRbjFCOEd6TUtXY29VZGhXaHhBL25IaFFoR2NwREVGbkdvT3Fh?=
 =?utf-8?B?emdIejh2dE1RTHdnZHM0M0ErUjV2UHZhSjZWci9qTEZJWjZqQVBHc2thT3pP?=
 =?utf-8?B?aTBmQ1NOeGRiLy9vRDlnMFk5SHdVS1cyMy9oaDBvZ0lUZmdIRDVNVWF3Z05W?=
 =?utf-8?B?OC9ZZjZCekM5YlBzWWdTS3JXSDJkdmdKWUhCZi83Zzc2QWY2a1d4WjREMUZq?=
 =?utf-8?B?dDFQb0ZBMTJoY09zbk12TklPMnBjZkZHL3A5TDlvcUh4OHFEVW1waUJPUzYz?=
 =?utf-8?B?ZmQvMDFrb1pDSzExM2NMaVNBYVB4SWY5YS93QUZNVCtHb2pKMTZBMXhSMkxH?=
 =?utf-8?B?NWlqNm9ERmNSbk9aaTR6NkpmMThlcEEwVWVyMmpFeStqME1JZHdhazN1d3Er?=
 =?utf-8?B?dFE1RUhEZGYwSDF6MnhqdFp6UnpTY2VyeVV3Ly9SRjl3dkJWY05JbDF4MHhm?=
 =?utf-8?B?NWYyT25qMjZORlRUYWNZcWR6dmVUcWh0OHlwUUhUQk5TTDBLZk1GT2lSUEx6?=
 =?utf-8?B?U0d0WDRPOFgxYmg5bExLbU9yOHc5bnZ5eVVBdGxzdW1OYm1PUUdzZmQ0L1hy?=
 =?utf-8?B?Ym0vUm1zc1lLUFo0c2ZnaHBsbm1lN09LcTVOTlB2eDEzVi9IYVBMdmhUbTVm?=
 =?utf-8?B?cnFJcEVvL2VBTjN5NE5TTG10NDdQcTRDVmhwT1VVS0tEK3NnblJhWUVUMVRi?=
 =?utf-8?B?TjBKWFFWMThLbFNncjRHdE1JZ0Z1UjZMSVV3LzVEZE5HWDM5eldKUE52RHdW?=
 =?utf-8?B?bFNDTHBwOHFkZkRHd3JlSFpodVBua1QvVklteTlUTGN3dzdGQzk0UEhVWHM1?=
 =?utf-8?B?Z2pvblYwc0taaUkydFZ6ZGoydHUxQzNUbEFQWkVSTnlSSXFuWExYVWhaaW41?=
 =?utf-8?B?Tk9jRW1rVnVKNC9JTmlsUXFwWGRVbTl3R21PVzRmcWc2YmZUK09IS2RHZk9F?=
 =?utf-8?B?cENSU0l5bjc0a0hNUGhPNkwvOEw3MHhNSFB3VlNFbDQ1bTk1OVB1SGE4dWZo?=
 =?utf-8?B?ejJVTlI3NElENnVtbHd5SGFZUWFNT01aWk81dFowR3RYWTE1NlF6U1BQWW1w?=
 =?utf-8?B?V1l3c1JDSVpRY3B0SklOVTBJb2c3dTJYUmFsTURTWStObHF6a3VuZytPZ3po?=
 =?utf-8?B?ZnN4eSt4Uy9aQ3RCTDdLLzI0d1lhZFdqNUR3T3VSRkY2UVBkaUozT2JYYVVy?=
 =?utf-8?B?TVVkVW9Wd3Babi9BSzNUY1BiMEtESWJ3ekJQbmdRRWpOVEY2aWJhVVYzamhl?=
 =?utf-8?B?a0N2anltK0lkTmRSWGlDdkpWMEY0c2UrNmVhNGdxVGNLWUlHMzRSc3Vmc05V?=
 =?utf-8?B?SU50TmRUK25RTXRWMEN5L3piM2FiN0xqSGFldklqNFhaRHJFaTRKMjN2YjZ6?=
 =?utf-8?B?VGJvMVVLY1hnSGJpQVFobmZXUHBmVVl2eElsNXdUYUF1Y3VlV1JWa0hWakNN?=
 =?utf-8?B?bjhubXdlQ2ZldGxrOVhBaGNoVnQyQklqdExzTzFpUlB2dFJRT0ZlS2lvL2s0?=
 =?utf-8?Q?4P4uF8SUnzRh2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTNEYXlBWXFVVHpRdXB4ajVLaE4yMXRXdnJ3bFBlMWh5L3pWQUlndCtwVzNu?=
 =?utf-8?B?VDJ0bnJxYW8wMDVZZHhLTnpkVVJDaUprSUUzRUJTRXFyaC8vUFpzS09XNXZv?=
 =?utf-8?B?M2JuYjcyQ2FVQ01QdVVnc2NXL1N4VVh5cXg1QzBSNGRlSEN0a0UzNTFIdXBU?=
 =?utf-8?B?aFdwTXlSUE1rTlJhSmtwTzRaNlZHR2NZdzY2WUtTVGZCVmhzS1Z3UHFsSkJu?=
 =?utf-8?B?K0V5USt1N2JWZEZjU3JoYTM0TTFXM291YVJqZitIa052RWNxQ21CV21Ock1x?=
 =?utf-8?B?TzlsaTM3RTNvWElBUFRhTU9Odzd4SU9zdzdONG1kMmNrTEE0L2Evd1AyMGgz?=
 =?utf-8?B?K2ZLakZWdVQ5R0xFOFRCKy9jc1BBcjBSTTAzQW1penhXQTRmb0o5TmtFVmdu?=
 =?utf-8?B?TUp1Z29Gd3R2UVpjaWxRaTI0b1JvQnlMTnJuL1hQRFYzdC96NmV2ZzF2Mmpi?=
 =?utf-8?B?Y25KQUFYZDM3Ni84anp0WGlMVXR4dkREcTB3RzdIWWFVMFFsaDZNOGd3ZUd5?=
 =?utf-8?B?aW82MktteCsrbXNkSjBmMHVrbmRMUVhCTG1IT21xdk5odDlTZ2pxckRDNWt4?=
 =?utf-8?B?cTkxcVYxaHRZa3p0dnM0YU5GbmRKUEVMWDBhS3lJa3BNMW55SEdpdllDRlZN?=
 =?utf-8?B?dEFCKy9HaVZOck9ET01ZSm9LNUhadmJFRlZxbnJ1ZVlFL0VVV1RkV0xYdlNJ?=
 =?utf-8?B?c1VpNDd5UisxWVgzSU9iS3doNUlTajFoMDRTRWhqNEQ2cVBrSmp1MFJFZStM?=
 =?utf-8?B?RjBUVGdLWVBRT0NIcmpEUDBPTVNDRnZ6VW9qUnNQSXBMUHRNbXQ3Y1dPUXVy?=
 =?utf-8?B?a3IvUG5qT0N0ME9mSWd6Sy8vWWh3cmtaeGd4eVk5ZDNWcFVyWWVjY3QyNUZ3?=
 =?utf-8?B?Kzh3bTl5Mkg5bkV5U3owNkNtYmJzdFN5eWJNemNnRnJPL3JqNGlaOU5jZGFS?=
 =?utf-8?B?SlJuRHBXVE1ISHRYcFhnL0xJUXpRMC9Od1ZvaHl5a2diVE8xK0pxK0t3OEpV?=
 =?utf-8?B?UmhiZnV1VGZTMEZHdVV1b3JLZFNCdndEb1pHY3pOY0ZYb2N5dlNkQ1hVckx4?=
 =?utf-8?B?OU5QdmtXT2VOVnM3STRmTCtNN2xBR2NvVHZIOUNuTXNtaVBXMzZqTncxT3JJ?=
 =?utf-8?B?anJVMlNWenBKVXFjRFh1Z3o1eEtXTDd5bU96dFBmb2xYWi8rL0c5dm1EVDdK?=
 =?utf-8?B?UTVKMTR6UkVHdEZ2ZGdoeGd1L0ZKQjZkMVJ0eXFtSm5oWWw5bzIrWTVjM1pZ?=
 =?utf-8?B?SDZiR1QzVGg5Qzk2UDBRQzladXBBWmlPVEJhdjVkWmtiWUZKYVowMzdmQlI5?=
 =?utf-8?B?ZzBneTc5WEE1VnlyblV5cCtTcVRkUGQ1cVZWQXQrb0s4Lzd5b2tvSXNrOXV6?=
 =?utf-8?B?YThqcDMzQ3FITUhHZGpqY2RCMCtJcHlrbHR5UFdrWGdqZis3MUdhTHpVM1hT?=
 =?utf-8?B?RXRBWS9PaXI2UjZEczJVT2EwbjVsMmJ4ZmFLdzFraHpDNVQ3NDBaQ0pHb0lC?=
 =?utf-8?B?V1FjbWRoNk5iUU5wUHVscHNCTWpVSGZReXN6UnVMekpsdzF1Si85aHd3YnYy?=
 =?utf-8?B?UlNzZVUrRVA1UUNjZHlEMmorcmppTy84cG9Qck1hdmFIeG9qWXZmQXBteSs3?=
 =?utf-8?B?SFRDOXdiUWZxL2dUdEJiN3YwRkwrc1pYdDdEYU5ESHQ4OVdPQmRFeTVVM2Fa?=
 =?utf-8?B?WEpxSjdyZncwVnJhTTV5aW1ud1Nrb3kyUnJMS1Zialp5WTVOVWhYUm52N3Zy?=
 =?utf-8?B?QitycU0xaCtuamRtTXllK0owR2x2TFdtMEwyTUxXOXR2VE9MZkR5V1E1MUtj?=
 =?utf-8?B?ZERtZWF1VWFsczJNUXRId3ZqanhkSmcxcmJqbStBckszVDNEcW45NFRhZ3B5?=
 =?utf-8?B?RXZ2d1RZMVdTT3ZJYlNnem5rODczVkgrUDNiY0NzRDVnRWhjN1JnKzJJdEVU?=
 =?utf-8?B?WThhQmgyZTNJUUYxNVB6cU0wWTRPL0FpU1FNYWRiNGs1KzA5ZjhEYUxPa0to?=
 =?utf-8?B?eDlqcEUyYzQxRUVpYW9mTFJVNFJjRHQ4NTN3S1pzS3ljMEh6T2pBLzJhL1JN?=
 =?utf-8?B?R0lDU1NPUEZ1eER0Z3d5ZGNyUi9VTTRTYWU2eVBPWkdIcXNDeU1KQXgvb0N2?=
 =?utf-8?B?SUtJMGdiM2hLUnFDRGU0c3g2Zy9oVnU4V2lIV0FZcE9QVkxJM3ZMMDlRekpQ?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2082f6-0704-4e01-1083-08dd20f2dcb1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:36:01.5436
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wifFElQxA9Usc3a+a3qFdCOz6E/byWRX1JMzDmi2glu4dpsVTAyTAzBihpt2VNjmu9chLjZSlUyJUkCSbFTHCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10047

This is just a resend after fixing my .gitconfig issue with the mail
Content-Type header. While at it, collect the r-b tag for 2/3.

Hi,

This is in preparation for bringing our downstream max96724 work into
the max96712 driver. The changes in this patch-set are mainly cosmetic
to increase readability, with one exception related to the PCLK debug
register which appears to exist in MAX96724 as well(see VPG section in
users guide [1]).

Unfortunately, I couldn't find any max96712 reference manual anywhere to
make sure the registers match between the 2 chips, nor I have a max96712
to test with.

However, since the max96724 compatible was added here, according to the
commit

6c872b782ae ("media: staging: max96712: Add support for MAX96724")

the chips are "almost identical". So, I used max96724 register and
field descriptions instead. Someone with a max96712 RM may want to
double-check though.

Thanks,
Laurentiu

[1] https://www.analog.com/media/en/technical-documentation/user-guides/max96724fr-user-guide.pdf

Laurentiu Palcu (3):
  staging: media: max96712: fix typo
  staging: media: max96712: remove extra debug register flag
  staging: media: max96712: add some register and field definitions

 drivers/staging/media/max96712/max96712.c | 213 +++++++++++++++++-----
 1 file changed, 164 insertions(+), 49 deletions(-)

-- 
2.34.1


