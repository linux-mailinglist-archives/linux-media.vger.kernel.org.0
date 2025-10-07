Return-Path: <linux-media+bounces-43826-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B7BC0E8E
	for <lists+linux-media@lfdr.de>; Tue, 07 Oct 2025 11:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D13264E27E8
	for <lists+linux-media@lfdr.de>; Tue,  7 Oct 2025 09:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF722D8777;
	Tue,  7 Oct 2025 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="MsyrDAwQ"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010064.outbound.protection.outlook.com [52.101.84.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83961E633C
	for <linux-media@vger.kernel.org>; Tue,  7 Oct 2025 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759830466; cv=fail; b=UN1egtlxpts008XWQriBlm5tBm060+rtcKoKbSrukKGMMXgZKrYhewPuIJnVb7CMancrODowAJ2pXmOpLLHx0eUmwY82Rc3yTSFFs6KEVYWivanIk41iGM3Ev0zcxF/HKPN/tyV6bwlQranTPNfNhmtS6YLNf6rPxAeD75gQNqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759830466; c=relaxed/simple;
	bh=Gd7Kb+p6G4cAecHBxajoq5dVCBYkn35KHfByj+qQqN0=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tU93U28bEpRJZ7w31fhBDR8EJQSc3AnVpIYKNc7xyetLZQg5LAeP/+xeUJL4yndHeGYThyHCf3gSX6sEChIiqqpfonwSmkQQ9D0QLdsF/yDBv3AV6Bl5A+kYWdiyet7+zwxde4DB4ah82JAhA8y2Cyi6efIKs3+vntwQkIbsYIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=MsyrDAwQ; arc=fail smtp.client-ip=52.101.84.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZoKJMocL3IqTESIcV4iiRzv9vnRUjQ6hTkhLSLRd0KLY+drh2H7TsKzdQ2B+0O6yrUMBiCOx2pdyoIj6hi+bHE0iPYw+HWK+Av0kYLBMKxT/nNcjv3slQHJjfVAx6SXnbceW0h958XvM5qcYyNf2ny28gybQksJm/Z92mYZtGGbiuRyOXgGz05BUzCaj+gEmEsoa0vQvHnsxuB3PWxufSami48uDsjH7Wg7ao7eSGRxJTDfjw99zWjPB2TI8upTrx+BnLbIIOQEHnwFctj/vtspyMw9q5Qc+Qfz0G6K7ROGJWYlYSKu8mlmolty0vpTqexqBP7j6osoFzzpYAMN0Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kk6jNXQXyoDvZvVwnGJ3sw2UBPDYD63rAeaM3RX/T7E=;
 b=BXWo7sa2lS24aAF2G9qdO8BSubTGW1p8f1nO6mP/9zKJlPHVoyKs5//ldgGwyQcakJzR4XqEAO5vIoLRiMKrYgrlcOD/gyzZLp6TO2hc7iMriOkHjDeUSqeturD8DHE8kps6jMk4+pfcwPDZZuz/rHisQ26pz1iU1YsEhzVWXOXgYz8TysZEzRYOCwMA8KEsL0/52vvDb1K4fOUi6+dq6dAaSjlWedaJgrIAF7AmIpjU6LR450FMOu2O9OxbUwj69KrCw4IrJjQzyiOCYYnVSYARbpQCw3QS16sAbt0RfOV+BKDdLrSn8b6bY/lV9bjh35k/MjBmBThOaY7Nm5rWFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kk6jNXQXyoDvZvVwnGJ3sw2UBPDYD63rAeaM3RX/T7E=;
 b=MsyrDAwQS490u/DTCpW8ffsEZDh6MXy3EE2ZNTU78g7D4tUFtKFprrGsNWl4ug5IXEoW9e4bQfme8ylLH0n4rOnUqbqMmClM/tmYOXXxr7RYISceGrdRYjVf7vMjPbpNExEL9Nr5Y8BIdJdhDiRL38Nbl1R+3EF+FVnUknlh1zk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9280.eurprd04.prod.outlook.com (2603:10a6:102:2b6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 09:47:39 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 09:47:38 +0000
Message-ID: <31bc0002-06d0-4097-a36f-93389e67af75@cherry.de>
Date: Tue, 7 Oct 2025 11:47:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] v4l2-ctl/rds-ctl: support optional ioctl and migrate
 some code to it
To: Hans Verkuil <hverkuil+cisco@kernel.org>,
 Quentin Schulz <foss+kernel@0leil.net>, linux-media@vger.kernel.org
References: <20250905-opt-ioctl-v1-0-4b3ae770fc4b@cherry.de>
 <f5a942fd-478c-4a5d-bf68-d53191d543f5@kernel.org>
 <5734ec94-ec46-47b6-993b-5a1ac1e41767@cherry.de>
 <7f204b8d-c2bd-4d81-b8de-b1fa50c6f091@kernel.org>
 <369af1f2-1772-4718-aa63-f3d09bdfd78f@cherry.de>
 <55696996-dee6-4433-aa24-08601ee8e62f@kernel.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <55696996-dee6-4433-aa24-08601ee8e62f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9280:EE_
X-MS-Office365-Filtering-Correlation-Id: 53854e80-2885-43b2-adce-08de05868cf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGlDS25lem1kL2Y3OTdhWU4rT3lWaE5pVFJEZUxrS0RXL3JUSlhVL2JGNmxK?=
 =?utf-8?B?RmxERnZtcTZ3KzZIMXo3MkdZbUpIaVRUQ0lFTmNIMHBXNXQrbDRZZ3RGb1Rs?=
 =?utf-8?B?RFN5ZERoZEw0cmR0L3pQYjNJak4wR1A0ckIwSkFSMklQVlIxU2lFUHQrMmxT?=
 =?utf-8?B?dTg1eDZNSDlhblZDdVVnN1dodnlsVURiMXBaNDhTNENjdDYzM1dRR255bEdL?=
 =?utf-8?B?SzJiZ3lZZlR4bXljS0RQR2xlTHVQdXkzYU9VMFhodGVmdFdGY3ZXUFJqN3VJ?=
 =?utf-8?B?UzlXYTZCbmJuOFNjNnBQVm13a09OMTZTMHhhQWp1ZDBxSmZ0Y3hNRHlseEJJ?=
 =?utf-8?B?NTBudEhkU2dmQzNsZHpZRVRVMGtmbk1mNzNLYVIzV28wSXBJWGo1aUdWdXZp?=
 =?utf-8?B?cUtBdG5Jb0U2amFabnhwWG1KTiszQXFrQm9yamx2U1ZhSGJqU2ZWeS9oMWJY?=
 =?utf-8?B?WUtqd2JNdTVraG9vcnpXaXVHc2JPM2l1STV4c09uN0tJc0VZbjk3dzQ1bkdq?=
 =?utf-8?B?QVdjNzA4WGpFNFdXUlRMSFlMTWd3Y1ZlUi9TenFaU256Ulp1RDdCNGxCWWg2?=
 =?utf-8?B?cDhhOVovUjloVVpMR3pEVHNjWElhZTRqdlRBdCtkbVpES1M5YU9CSmJZVy9R?=
 =?utf-8?B?MWJwSS9relQ1S25XMjd6SmUyVGx3eWZXOVFCczVkTGdwMExjQi93anRhZS9k?=
 =?utf-8?B?eDBtWEVUd0xCdFM5T0dNYU1lU21YZ0pvZDkzMnpnc1J0RjlJNmRyaG94OUVB?=
 =?utf-8?B?bGsyVEpEQ0h0dzZ6bGFXdWhqRG5xcW9hSlVFMmU1VVlSRDZLNWJYM0JmaTNk?=
 =?utf-8?B?SkxsWG5JU2JlM3hxRENUN2JmTHV5RFRsNFh3QnZXSVo1MTh5UnRqbDVmQkVO?=
 =?utf-8?B?WFJVNXJXeGZ5N1cvMDlndjExVXR5aWd0bzZuaWVaN1doVVgydVh5TW9KWng0?=
 =?utf-8?B?QmJ5WVdXeFVlSGRWbnNONncvaUlnMUV2ZU5DY01vbjluc3RJMUhCSUdJWlVU?=
 =?utf-8?B?L3U0OEpkVUZPR1kzazk2SlROdHhxdlJNTHhrcXNPektLS25BMDR3WDhFVnhQ?=
 =?utf-8?B?ckNJZ0g1SUpBdGdHQTVuZGtuQkIycjNCa2FDTzRtUE01Wk9YVzBVNE5DdjhC?=
 =?utf-8?B?Rmx3ZXl6NlMwR0FRSVVaeEJTYk1mbEVUa0VGRlVIYkFoZUNqL0NPTEkvWkdZ?=
 =?utf-8?B?S2x3SUUxczJuN3VVNzVTUG5qanZ6Z1RNb014d1BnUjBiY0gvVkJBN1E1MkJw?=
 =?utf-8?B?MitydmIrZnBhTy9ueVNveDd4Nk5VNkdWNElPdnZUa2dxckIwcWVFcUVjODht?=
 =?utf-8?B?akNxamd3djQ4VWsrMmZRREJtcTBKdlpOdTJ1WDZZYzV2Zm9tTUlaWkc3S3pK?=
 =?utf-8?B?a1VuNWhHNWZ2b25ZWVU3RGNtdHB1M0wrdlJYWkpiZzFPWGpDN081L1BjcFRW?=
 =?utf-8?B?dmo1eWJQTzFheGZGYXJlQUl5aVBYOXlaM3B3YlJuSC9MOUY1eDRpcjd4QTJK?=
 =?utf-8?B?d2J1TFNQV3pwYlZoVWVuVjF4akgxNldRUDJqRjVmQ3hlTkJ3cnRoWHVMZ2Z4?=
 =?utf-8?B?UHYxcTBiMEhSNmIvUHhBci93dk5YU01qQWlYM1RFY24rNnR0VFkzbTVURCtE?=
 =?utf-8?B?QVh1L2xnZkE4UUxmdGoxakZHS3pucFYwOGZ3RTdDQ2poS0hJRG5ubGtyREZK?=
 =?utf-8?B?dHN3bkI1V2xONXdQMG1keVdQVHpmenVGVklpWXozYjkyV2xkbFIzWm0xSFh0?=
 =?utf-8?B?UXJNNzFKeEpSMVJBK2YwcmtyUWU5RExVdFhQbXRESFo5Q2N5Wm1zREliUHEy?=
 =?utf-8?B?ODVwMVEzZ1pMQjJMRzVvUEJkTWg5eFZtWXE0WitxbGdwYTZhUFVqRkZ2TEFn?=
 =?utf-8?B?cXdaSXNSaTJNTnFYUlJhSHZaQXA4NGJGejd6NlVQY0c2YXc9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHAzeUZQOE9HR3JHblVaTjljUks4SnhGNlhvZUh5UjlxalcyYVpLUm5RYkFs?=
 =?utf-8?B?bE1ldk56K0tJZlR2OXpPN0c5aHZmcmR1My9uNlNDTVhsQkVDUUZmM2ZHRkEz?=
 =?utf-8?B?NkowVHVUV1ZiN0dxamF3aUJrU2lpNFdoZU44RzBiOWlDbjBBUnczZFE1N3Zm?=
 =?utf-8?B?ZTJ6ODh1NmVLRG9kMU9qTFVVOTJ3K1hLVDVjOWRiaFNUQmJmZUhBZEdoZXJI?=
 =?utf-8?B?eURReVArZStSOEE0LzBBNzMybzIzb1FpMTQ0a2YwNnFadFFKdWZEQVN3am1v?=
 =?utf-8?B?OXhNRWRTODZCTXQ3WTRRTVoycUxNc21GN3lWd0ZxWDc2d0hwUlMvbGtJc0tO?=
 =?utf-8?B?Yy9mcGxYV0xIWGc2RFZFcmdnbWpDSHpMZ0toOVp1bnhkMy9FNWxFVzVOVWJz?=
 =?utf-8?B?T3h1RTFkc1RVWlIwRm5lamphM3VLYkpBOGxlTDJtLytkRVZnQ0pZbzA4VEdr?=
 =?utf-8?B?blFjYTRicVRrT0NYNEM2bnBUckZSUnVhM2dmazdXTzZmL2RQVFZKS3NwdWVQ?=
 =?utf-8?B?OUFQUTdiOHJyUHNhVXdFOW5UejRTOEttZ1ZlY09oR3VmY1VRWS9Na0VPZmxn?=
 =?utf-8?B?L0hqeWpUd2J0TmlrN25EN2U1TDN1OWhWVjhDWktBaDMzR2NZU0ZKZTBJVmhq?=
 =?utf-8?B?V0dRVjBUYmUxWHE5SGI5UmUxT1JqekRIelBKckorcUxUWTNVY2xmSnRtdHQ1?=
 =?utf-8?B?N1BQeWppclpWK0dkOVVBaVJLK1Q2QTNSTHArSUVzRU4ydDBnVzQ4V2hZM2hk?=
 =?utf-8?B?ZmhWcm91RXM1dEhSS3B1WHhsdW9xa2xDUzZQd0p0TCs1clZDdDJCVHNMMldR?=
 =?utf-8?B?MkJ0VzU1aDBJVDdhUzRvemhhamdCMUJid0FSTWZkR0dTTFFvRWJaaGNLQ0xQ?=
 =?utf-8?B?UnhPUkZrWmRRR0IxZnVoa2xIZHo3dmV0dlZnNDNZL3JiVlczV0d2aWlFVld3?=
 =?utf-8?B?SFhhMkNadW1ML05yZ09TeU1tR0dsdDR6R2pBUUYvMVVBaHlRMHB6MkNnZFUz?=
 =?utf-8?B?ajh3MVVuTDMrZ1hqd3dHUmJVeXJ2TmQzNE5UbHRZQy9Sem9icjVpanFhRGsz?=
 =?utf-8?B?bllCYkhFRm1LdTBZeHBXaDc2eGVhZTIxNjNZYkN5RzRLbTNCa3NXVEVtdGtq?=
 =?utf-8?B?UDJSd0liQjdwOXdwMnhaQkFCSWI5aTdjbGhZNEtCRWFxak90SWRnZnNnVFZ3?=
 =?utf-8?B?SGRxVUdneFRkQjludU5kNnRYUjFxQjdPVmQ0WlNkaGZxZjlWZkZ0UW13ZzY5?=
 =?utf-8?B?QXZJK3FmMUVPNjNQMnpkbGxTaEVZOWtQeTVXMlFOWlR3Q1NlMnpLcEJ6Ny9X?=
 =?utf-8?B?bUY2akpaeXhrWkhsa3R3YVpQbGlUZmc0ZjZhOHgyb01UV1ZpTC9CLy81eExr?=
 =?utf-8?B?Tm5lQTFqbE1xQ0JrYWVXZmFGYTBqTU9VWWF3Y0FjNHlNNVNRNjNLZE5PV2lJ?=
 =?utf-8?B?RGluQ3greVNSYUtuU20wM28ybTNhaGpBZ3dqNGw2MFBPRGJhVXVicnJqWk9S?=
 =?utf-8?B?U2VOdnVtalMzVzN6TUwyYzRSSnRnbE1JUmtDOEFrVVBuak5BUHVYNk9WbGI4?=
 =?utf-8?B?VjlUckg2ajhGTlBtUW1Gdnkrd1RHZzBqSWtyalFoQUlQV0VOZG9yMGRLWDgz?=
 =?utf-8?B?bis2TjBDVjNCOWhOWmRPK3UyR0xjWkVaNmJMNk1xR25MY1p3UENBUWFWcnp2?=
 =?utf-8?B?b0V1L3B2VjdoSWkwTGt3cVM5QXV6dmxkcjhvU1VUdC8zdGRVbHQ1WFd3a0J1?=
 =?utf-8?B?ZG9ESlQxYndrK25XZWE2OXlLazBYbTNhM2JxS29MbTA2bjArc096a3I4TGh2?=
 =?utf-8?B?SzhMS1I1aHdBWXlhcmYrK3duUzArSEdLR2tYUlVWOU9QUnk1L3g1TklDS1Bv?=
 =?utf-8?B?d2tubndpeVBhc3BZcEcxVUR1amVJS0p4NDg0T3FhTXZzZ3RXd1hubHlGejV6?=
 =?utf-8?B?WG1CakxRcW9jTlVGYWhIUFNCbGtDWWFKTzNTc0puN3lxaUJQNTVHZGlKZFJv?=
 =?utf-8?B?QnE5TWc1dk1FVi9CamlESzB1K2Jad0ZmQWlHaXBhVUpUckdJeGc5b2tKSkhq?=
 =?utf-8?B?b1FobjAwaVBLWlRSK3p3SHp5Tml0bGEwMmgybytIa253dVRkYlJmVzhRdVFi?=
 =?utf-8?B?aHFBZ3JJbVpaR3F4cnNyZ3NaaVlMWG92VWpBa0U3R3g1UTZQaTc3ZGJkdExJ?=
 =?utf-8?B?M1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 53854e80-2885-43b2-adce-08de05868cf5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 09:47:38.3264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOehea3vBeqiDj/vVxwK5Jz9PgPqHhUB8NljzQ9+ectg7Dju2C/XrF+W79miooqxhEC8E8uPelYKVfIEHsofilyBWxaUfTYnnw/wwpR4W7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9280

On 10/7/25 9:27 AM, Hans Verkuil wrote:
> On 06/10/2025 14:57, Quentin Schulz wrote:
>> Hi Hans,
>>
>> On 10/6/25 2:19 PM, Hans Verkuil wrote:
>>> [You don't often get email from hverkuil+cisco@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> On 06/10/2025 13:37, Quentin Schulz wrote:
>>>> Hi Hans,
>>>>
>>>> On 10/1/25 11:17 AM, Hans Verkuil wrote:
>>>>> [You don't often get email from hverkuil+cisco@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> On 05/09/2025 14:19, Quentin Schulz wrote:
>>>>>> Some ioctls are optional and the logic around it handle it nicely,
>>>>>> except that doioctl (via doioctl_name) sets app_result static variable
>>>>>> to -1 if the ioctl fails.
>>>>>>
>>>>>> However, both rds-ctl and v4l2-ctl exit code is from app_result. So it
>>>>>> is possible to have those tools perform the expected task (albeit
>>>>>> failing to use an optional ioctl) and still report to the user that it
>>>>>> failed to do so.
>>>>>>
>>>>>> Let's add a new function doioctl_opt which allows to NOT set the
>>>>>> app_result variable when the ioctl fails.
>>>>>>
>>>>>> This migrates two ioctl VIDIOC_SUBDEV_S_CLIENT_CAP and
>>>>>> VIDIOC_SUBDEV_QUERYCAP to be optional ioctls.
>>>>>
>>>>> Actually, those ioctls must be present, unless you run an old kernel, but
>>>>> they've been around since kernel 6.4.
>>>>>
>>>>
>>>> Yes, I am using a 6.1 kernel, which is supported until Dec. 2027, c.f.
>>>> https://www.kernel.org/releases.html
>>>>
>>>> 5.10 is also supported until Dec. 2026.
>>>>
>>>>> I'm dropping this series as this isn't quite the way to do this.
>>>>>
>>>>
>>>> Could you explain what is the issue with those patches so I can suggest
>>>> something else?
>>>>
>>>>> Perhaps you should explain the problem you encounter first (and mention
>>>>> the kernel version you are using)?
>>>>>
>>>>
>>>> Run v4l-utils on an older kernel (6.1 for example) and it'll try to use
>>>> the ioctl that isn't supported. Since it's optional (the return code
>>>> isn't checked directly) it'll happily actually do what's expected from
>>>> it but the program will end with a non-zero exit code, thus failing my
>>>> CI tests while still actually performing what it is requested to do.
>>>> This is due to the failing ioctl setting app_result global variable but
>>>> the failing calls not actually being checked right after in the calling
>>>> function so the program continues as if everything went well but the
>>>> last line of the main function (std::exit(options[OptAll] ? 0 :
>>>> app_result);) actually returns the exit code matching app_result value,
>>>> which is set when the (deemed optional) ioctl fails.
>>>>
>>>> I use v4l2-ctl to set a test pattern on a camera and now my CI simply
>>>> doesn't pass anymore on Trixie because of that. For now, I ignore the
>>>> exit code of v4l2-ctl -c test_pattern=1 and validate it actually was run
>>>> by running v4l2-ctl -C test_pattern afterwards (but still not checking
>>>> the exit code of this command as it's still returning that it failed).
>>>>
>>>> Kernel is 6.1.
>>>
>>> Isn't debian trixie on 6.12? Why are you on 6.1?
>>>
>>
>> Typical embedded ARM devices setup (sadly). 6.1 is the vendor kernel
>> with support for cameras while upstream catches up (no camera stack on
>> RK3588 yet). So we essentially only have the userspace stack of Trixie.
>> I mentioned Trixie but it doesn't really matter to be honest, I could be
>> compiling v4l-utils on Yocto with that kernel if I wanted to and the
>> issue would be the same. It just happens that our CI is running Debian
>> at the moment.
>>
>>> Honest question, I just want to better understand why you are on that old kernel.
>>>
>>> Anyway, the application result is of limited use: it is never tested by me and
>>> failing on non-existing ioctls is probably not a good idea anyway. v4l2-ctl calls
>>> lots of ioctls: if present, then do A, if not, then do B (or nothing). And each
>>> time an ioctl fails fails with ENOTTY app_result would be set.
>>>
>>> Going through the v4l2-ctl code and checking all places where an ioctl can be
>>> optional would be a substantial amount of work and is probably hard to get right.
>>>
>>
>> Fair.
>>
>>> It might be better to only set app_result if the ioctl result is < 0 && errno != ENOTTY.
>>> I.e. missing ioctls are just ignored as being 'normal' behavior. I think that's
>>> reasonable.
>>>
>>
>> Do we want to silently ignore ENOTTY even for the return code of the
>> doioctl function? This would make it impossible to know if the ioctl was
>> run or doesn't exist, which I assume may be desired?
> 
> No, the idea was to just ignore ENOTTY when it comes to setting app_result. But I don't think
> that's the right approach.
> 
> I looked a bit more closely at the code, and I think the right thing to do is to use
> test_ioctl() instead of doioctl for those cases where an ioctl might fail.
> 

This means we won't have logging of the failing (deemed optional) ioctl 
that doioctl_name does for example. Which is one of the reasons why I 
went for a new doioctl_opt in the first place. Another reason is that if 
the ioctl fails with something else than ENOTTY, each caller of the 
test_ioctl would be responsible for ignoring ENOTTY but handle the rest 
of the error code (and possibly printing logs). Which I felt was 
something we could avoid.

> That's already the case for ENUM ioctls (since they return EINVAL when the index
> reaches the end of the enumeration), and so this can also be used for VIDIOC_SUBDEV_QUERYCAP
> and VIDIOC_SUBDEV_S_CLIENT_CAP.
> 
> So make a patch for that and mention in a comment that VIDIOC_SUBDEV_S_CLIENT_CAP was
> introduced in v6.4.
> 
> No need to create a doioctl_opt, since basically that's what test_ioctl already does.
> 

but keeps printing logs on failing ioctls.

Up to you, just wanted to give all my arguments for a new wrapper around 
test_ioctl before replacing doioctl() with test_ioctl().

Cheers,
Quentin

