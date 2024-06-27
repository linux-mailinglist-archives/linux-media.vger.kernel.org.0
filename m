Return-Path: <linux-media+bounces-14269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2375391ACDD
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 18:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5EA728B457
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2024 16:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82512199EB2;
	Thu, 27 Jun 2024 16:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b="FjAL9cF/"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2109.outbound.protection.outlook.com [40.107.243.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F6F199E9B
	for <linux-media@vger.kernel.org>; Thu, 27 Jun 2024 16:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719505874; cv=fail; b=pDs4RmvIBtJm4lQzy0hqZtklpJy2Z9/7YeejA9JQ0HC8+PztJ/w4zS85gU6mrEiZ19i5AOMQQOPf9V/WIK7fgtqDnWfqArkFzSMvaLPuueIwZdPaD4LZ49yJh2pAIsuxze6huLMNEPfK0FFg6URhmmNPoSxEzKE1mwa/41tdhvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719505874; c=relaxed/simple;
	bh=Lfh8p74G7RFKD2NcJbE1ityiIWvqBvme67zdJfZ2Zv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mSU79sDwivCuZQkXWiUWZVB/SRdRbcoO9Baa5MGmglHnQ/gFrWGMQBCUK0JFM+RMg71VtcoybCchlMgOxOLds3JGsJcJrSEHoFDM8JzlF4T4Q/TEcxqulrZhZ8yh5Koib1AkXPOzt12RY9D2DMzrzTBCuhtWvKGwBbRliI8XiCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com; spf=pass smtp.mailfrom=d3engineering.com; dkim=pass (1024-bit key) header.d=d3engineering.com header.i=@d3engineering.com header.b=FjAL9cF/; arc=fail smtp.client-ip=40.107.243.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=d3engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d3engineering.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EakL1GzFg6zGnoxeEv2mES5Pe4b8O47mLaeLu3mnqb/rQ3XU8h3miYZjVFI7Lg1HL8O0pOmrVNWDiGGYMNd6b7FKSb3GySZ/AvY4kq3Fx4VAaZFgxvm9T/BBy9JBrnSYJSWYK4d5OIx8ioo85ryipw8EvrBokWVS4Wr1jlML49Bc4LSSyaNuekVlIhc4W1vv8nC5GbO5eNuusbeDanHtim0cqz0/17wobLyiW0GMfZzQqeAXSI4CpnsrAHXcfhwx4tsshYZKk3GPOUqV3T0iCpJlmlkUjGr/bmADwEa1Y4xxRNvQ4UB+rsBTJbVrG5+xOf0JQkyqK7G+IHwifaCZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lfh8p74G7RFKD2NcJbE1ityiIWvqBvme67zdJfZ2Zv8=;
 b=RUQHbLM0JbIhK+Wsc8/hOMI9uG2dpQ5jy9VaEBJY/UfX6LLEMOICq2NQiwVe9jM2yQJ1FjykxUvfWwIvLQ1F58atKnpH8kM9ooAJdAJgOKn7/RVG4Enp0ZB2FCraiwIKSv/QfbxEiFblk4R5tMjCpbDBSxXP23gB2eUKLcU9rD2K615uqvtr3ROhK9/NYNvWVBlTRcSLMtMu/F1mBQBOvEidrnMHwpdvz2NliVUzsg1hY+RZtnljjBCs/MRq8R7rAWjjE1jNrlbml/ehuIL3w7sI4whaRr1sHeE1SHpM2cbKEZqetR9es5S3FnRn1gALF2QX5UQNhvfw5173T9XEGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=d3engineering.com; dmarc=pass action=none
 header.from=d3engineering.com; dkim=pass header.d=d3engineering.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d3engineering.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lfh8p74G7RFKD2NcJbE1ityiIWvqBvme67zdJfZ2Zv8=;
 b=FjAL9cF/HswSRCBJIbD1/zVijQDObhBy1/EON4fWF4d5uFJVNKEBx8AbZlMqzPUtPqIC/m1l4XIiyO+V6kX6faVfWpaXC0GWfc6Edf9kU499MN5PX9CRTgdgRGf5r5te116S7ozd+M9OCJUB3pg3DT3pht2qxUale0sWIMFxjl8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=d3engineering.com;
Received: from CO6PR14MB4385.namprd14.prod.outlook.com (2603:10b6:5:34c::9) by
 BY5PR14MB3940.namprd14.prod.outlook.com (2603:10b6:a03:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Thu, 27 Jun
 2024 16:31:09 +0000
Received: from CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864]) by CO6PR14MB4385.namprd14.prod.outlook.com
 ([fe80::14b7:fa74:423b:6864%4]) with mapi id 15.20.7719.014; Thu, 27 Jun 2024
 16:31:08 +0000
Date: Thu, 27 Jun 2024 12:30:59 -0400
From: Spencer Hill <shill@d3engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 2/2] media: dt-bindings: Add Sony IMX728
Message-ID: <Zn2Tw2Qf/Wf8MNLL@D3418SH-L.d3.local>
References: <20240626211529.2068473-1-shill@d3engineering.com>
 <20240626211529.2068473-3-shill@d3engineering.com>
 <881f8764-17ed-4fc4-9c65-02c7b3495bb2@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <881f8764-17ed-4fc4-9c65-02c7b3495bb2@kernel.org>
X-ClientProxiedBy: CH0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:610:e6::18) To CO6PR14MB4385.namprd14.prod.outlook.com
 (2603:10b6:5:34c::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR14MB4385:EE_|BY5PR14MB3940:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8dc1c8-7eb2-4667-859c-08dc96c68ca3
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uWEjFQH21RIpLiVsl7ajPI3RMOlCopJ0oHoiUMYqjxmGrMH8nBCcNAD4VKaJ?=
 =?us-ascii?Q?8fU1nBWoXRSmWkQc3rkPt+EzH1Hbep7tp4GKR7AM0mw1XGibZLIetged6Ogv?=
 =?us-ascii?Q?KYdN8jRhXoT7r4CXFyUMQDjginJlNu+9yd+2tQ9NQH9V+BGJObTRDOk3h9Mh?=
 =?us-ascii?Q?DbgjMkaghWDD3rL7ijeiIMf/WpLgLy6SPxbfhQc5vT8sffnpwtc94xp9ePH0?=
 =?us-ascii?Q?2SlxYAUeB/cuhOGTcGfGtIzsoHa4z0fcnFdN5kkzfccd4XShnNFgvhj67Du2?=
 =?us-ascii?Q?FyIoEcZG8AA+VZP9WWaCKl5e9xJenxz77vb/4CBnd7mJEf/77uTP+9NPpIzz?=
 =?us-ascii?Q?Inh1U/x6E90zaNZzFDBWKmSt0GKD2LmnXCygs22YbDsjtbjNo6PR3OfhQsiK?=
 =?us-ascii?Q?CH5Dc6qcE/eYCWztloBbsUWpHlTHakOntMH4mFIc4ETRos5sNfH58YtqYD+a?=
 =?us-ascii?Q?XgeGWOCGLzKuUMFVCaF6iOgzxfZzeyGPW9yltBiWl9scWO2PF8F3u6gPzCIm?=
 =?us-ascii?Q?+TgHg8Evt3sNO1lYmvTYt81AKGvOxld5uoUrq8U50vuw+k/qnwA8KY25J/R1?=
 =?us-ascii?Q?ppS5gHjDHtV000ca/74X815vbZmAHauU68nviC4zmjWlAu06sgTWYN/pbKc1?=
 =?us-ascii?Q?6AJFDL3rDrn7dkpA+GLDwQ3d6JNHDVuxuqgsRIoReBTno4qLNx+qJKJ2se/G?=
 =?us-ascii?Q?NTf343AAICUIUvkcYJQ2v+gidtYKurqZEpFxfoO5Gas5ixCQjciWwpOMPjH1?=
 =?us-ascii?Q?08YKiRP7JYg/QQe1mknqrP0yrSYqDHUm/RKGp6+2STlyBhK6zpqlrLdD4wpN?=
 =?us-ascii?Q?+MEvOBazQa+kLngtN5xZaOaUEeH0x1zPuk3Lg6YGz36xFgYDp/OrdnXkmp0W?=
 =?us-ascii?Q?6CW5NguVSDu1Q485UjYHY0bXAmONK81ymH1HkIu6KZRvgkgZOspolExABPhQ?=
 =?us-ascii?Q?mgwKAfOpb395VFTOsdXCSOVOm6ebfI+iEFcZarQD52FprEufxidOEDXYIffm?=
 =?us-ascii?Q?XsAHfxuIE3UHLzYgaiackj9R8WdxVizF3vOv/HKgbyeFLNZ8DYSmcUWbRU1r?=
 =?us-ascii?Q?uf8PA0DHc0lHzOo7uBIucaJSgpUzb1VFJ5EC3PYNll6wnp4zEximWrX+G87l?=
 =?us-ascii?Q?Mzy3ok9bbUML+rdWn7i4TPU9jZcmJNxBofSrjU9LS1SBOkpnWwFEkzZomYN6?=
 =?us-ascii?Q?rlZxZatAuOdqe6ctb7sH33WrGCddp7FyTHj9WbnBZ1vRfKm35yvQiaFoGgKE?=
 =?us-ascii?Q?VCzk7ziMHB3V53FNE3/us7biMYjYm2rc704JS7afBxjcg9oKTBgPRIO2IkrT?=
 =?us-ascii?Q?U3uGyLJVUBPgjEg3hzxYR8PVH8VSZN9VJSzubBtagpwMGQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR14MB4385.namprd14.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jGjIQvLHsgnqXJuIx7szt4IXQZp6heFrFk7UIjpe099NoXuiDzyTyaQrSJsO?=
 =?us-ascii?Q?qZfpb+otVyGj4ZBMOtCAzS0ryHFO+TAmaz1tSy+6FUnIIS0YZpKxiuqbNR7y?=
 =?us-ascii?Q?5NUURoRkYYFl/4Y9I9NMBvbY998Vit8yggqUzHUHRrJZVzF6bQuhX/mbt9i3?=
 =?us-ascii?Q?QR+wpaTqa7/jKaDZUk1mf9G9/nYeD2cn0XkgtqiCOm37cmlM347g9S9gcqXb?=
 =?us-ascii?Q?2d8wcoMAw2LUyu8yBhr/Y4fSP+ny5RNJNaFY6dPHEl0tLsjduZD/uVaTnJYh?=
 =?us-ascii?Q?KEs8zzO3KRma9xposV3610yhyGk8W6bE+YJXzsj1T0VzGa6oRtiURWeGvaKS?=
 =?us-ascii?Q?u0uv7mFlxeoXrIvyS6To3q6qLb00OdYd8kttjSlHwAz8Abgn+pDmvbOdB+s+?=
 =?us-ascii?Q?+FDr7e38evM3bq6D61xKgbK7l6O94wPO8uEdm1IUWo3wCPd1JWaDvRYTnBCa?=
 =?us-ascii?Q?lgJYkz4XRU/1txcK9QhrhuUKBQe8lcwJguRHqJsn1LbFiGBt8d0crPueWQGs?=
 =?us-ascii?Q?yMSMwPPaeb4rg9VRPpoweKTNhFqAh9ngjHAEb7ABiX17KJvRuCFpVP9HAxGj?=
 =?us-ascii?Q?dx7q3+HH7at6sktAYvoGz3Wd5Z5XCShJLXKT1OJIxQA0CDA+25I7LO7OFGoC?=
 =?us-ascii?Q?kWywcm/sogT286Kz+xn9yUlS4NSNgnMGmLTxImp9QzqO8fOSdF7PQ0mR06QN?=
 =?us-ascii?Q?a6K5um9zJjnlXJ7UOomTlra15Db1tK144zrRwkMH/WWDw2Eixg9lEHLR4vPV?=
 =?us-ascii?Q?Rro0nrb8c+0pPfo0zCp6rq//LdLGvJofzxyGOBObGn9tSOvAS6iedqtV38cD?=
 =?us-ascii?Q?Y0W9MS1yM4I59tZzp5TrQTmRM09gpj6xzPP0pu//2ckA3JhsaLdcgJkFzIwZ?=
 =?us-ascii?Q?7Fe/Ex30jahn6l+QaJY99i+SOnLNuoGk+8XXXYozoKM7eFE1zJ9muPCCZThb?=
 =?us-ascii?Q?0Qj7kdURj0e5Oi9gIPMpxwPvUkaFOjT2rm2iE4vo/o6Kb4tHyRlFB2dlRBmi?=
 =?us-ascii?Q?ej5ATTjckIh6SE9K9IPPHeqeTrQNGl3CnyMvtO9cLryvIwlbvCjzAZ+aTukB?=
 =?us-ascii?Q?VNQvHyikqwKJBs1OH3CQKXsPAkIY7fKvdsF7RogLL33CKvXVjhIOktC8wGzs?=
 =?us-ascii?Q?nVjAKlyfLrth4ghjbJItQDu38L5j3zJClYK1DZEIAAy7JkJDQHonyM7WGvLF?=
 =?us-ascii?Q?vX9UANTjQU/cTey1Uw5VpshBI7LlMFFEf9wb0jvyE4URAtX5u2z7t7PmbzxB?=
 =?us-ascii?Q?Sphgso5du9E/my0drSSu4WMLfzKNK45tfQWGUqthzSKi+xGsSYpffaBzhuuH?=
 =?us-ascii?Q?1DgOIHHbgRsJTq7sKHfgCxpmCGoJdA9FHUTCPNpdIUwPVQaOxmy00+JIbXRQ?=
 =?us-ascii?Q?sVy6pRes/jCoNJGNqzo1HPTbSJFbm1fftWGQdB42/qUJ9+/6NB3VKdzu54Pe?=
 =?us-ascii?Q?9ld6m/IbHo29QkmmOXLlAsketsiIxRxBTb8qI0S6UwSJcGldoHKVbRLbGnyM?=
 =?us-ascii?Q?MS9XEvzmPtDF1fEN7lKa8qlvqPCNWmqXrDo2Qos530BgEgOmMBKTh8eYeAxY?=
 =?us-ascii?Q?C1L+Bn46UszbqV+5M0hQcmlGqGdFeQRnf+FAei3oMn5kJe4rLpaE8Jkg2qPu?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: d3engineering.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8dc1c8-7eb2-4667-859c-08dc96c68ca3
X-MS-Exchange-CrossTenant-AuthSource: CO6PR14MB4385.namprd14.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 16:31:08.8634
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b7153db5-3376-478b-b601-92ce9bc0d3bc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8UAObCtUL9yuK6Bhju6y0hzFqTLhNv2MGX78HMx+8R8RaaaUbjCc7rwv8CWPrtRUpjsp5DvELTZrrWnaUrcGqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR14MB3940

On Thu, Jun 27, 2024 at 08:51:07AM +0200, Krzysztof Kozlowski wrote:
> On 26/06/2024 23:15, Spencer Hill wrote:
> > Add bindings for Sony IMX728.
> >
>
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline), work on fork of kernel
> (don't, instead use mainline) or you ignore some maintainers (really
> don't). Just use b4 and everything should be fine, although remember
> about `b4 prep --auto-to-cc` if you added new patches to the patchset.
>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time, thus I will skip this patch entirely till you follow
> the process allowing the patch to be tested.
>
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
>
> Best regards,
> Krzysztof
>

I will be sure to use b4 to send out the patch to the correct people
after I make the modifications based on the other feedback I've
received.

Thanks,
Spencer
Please be aware that this email includes email addresses outside of the org=
anization.

