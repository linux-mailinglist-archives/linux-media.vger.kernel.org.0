Return-Path: <linux-media+bounces-11398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10668C3E71
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 11:56:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45482B214C3
	for <lists+linux-media@lfdr.de>; Mon, 13 May 2024 09:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42A24148FE5;
	Mon, 13 May 2024 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b="1o6AwOkP"
X-Original-To: linux-media@vger.kernel.org
Received: from repost01.tmes.trendmicro.eu (repost01.tmes.trendmicro.eu [18.185.115.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5011148853
	for <linux-media@vger.kernel.org>; Mon, 13 May 2024 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=18.185.115.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715594190; cv=fail; b=GjEGIroz8f5ErN4g0IrrlABcRT387UA2GXjpgaTtMTnxJSuMaLBYHqjKSLzKQhWNr/9CrV1l6OddM6N4OPzVCZ+jWi5XvpptVvXpWYANQwOyue1H9BoKWicpZpXqs5YfrfVY5eBYjNLAroCMGklS09tteTezpYbIyq5iVgvZv4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715594190; c=relaxed/simple;
	bh=zJVm0YHlWEIQGzmqwi79mu5/8rHGiEiwaYE1q4TGNT4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=TTHjLADfPVoNtpfmIez9YAvAnS1vpFTBioGOUZrqY4qFeAUDkf4ZyPXbk0L4lX1dl+aEyrhH0GVL2GouGi0yYp+lzAVfcqXc1y9lE6XGuDCXRSQiKSA4v7B0EW+zMSnURGBcDEW2Bzl15+9xItE5zDmfLrxTnsQ2jp61YxUNFRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com; spf=pass smtp.mailfrom=opensynergy.com; dkim=pass (2048-bit key) header.d=opensynergy.com header.i=@opensynergy.com header.b=1o6AwOkP; arc=fail smtp.client-ip=18.185.115.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensynergy.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensynergy.com
Received: from 104.47.7.169_.trendmicro.com (unknown [172.21.192.213])
	by repost01.tmes.trendmicro.eu (Postfix) with SMTP id A21AA1000094C;
	Mon, 13 May 2024 09:56:25 +0000 (UTC)
X-TM-MAIL-RECEIVED-TIME: 1715594179.967000
X-TM-MAIL-UUID: 0c3732b3-13e1-4ad7-b5ae-db3f27e1f70c
Received: from DEU01-BE0-obe.outbound.protection.outlook.com (unknown [104.47.7.169])
	by repre01.tmes.trendmicro.eu (Trend Micro Email Security) with ESMTPS id EC52210000405;
	Mon, 13 May 2024 09:56:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNo/hAvDT0zx+VVlS3skU645NNaJdpguQ7b9QBBKLiUdLQGQKl1FcV2OpbvHQZ3aWfbZthxWn3wBHHSyt6N42Q5LSTVT42Nc0heH3jYaJoJJVM+EZqlcD7I8I6D+RIskkGpXP8e7LU3IY1Wa/yZpdCxMO621jnEqGz7ptyD2r9e7GgAvM43QZvAZfxSx8QrvZ3aXsRZVkBBnm2Yda7Sp3a36njoNdxhiY7DiyMZfXpK2c1uAb/hqfTs4jBxzE8V2jGv6aivyr8Pk5jG/pp0acp92/k9d/5gEib7rpMVzMWe2w2qHyrm1hFX4SGi+YXMYqJ6DYTEzqR9bbh2LFdceFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRPq5NdssmSNLS8jVcWGQN7ndSiltfvzw49yo1WHOVA=;
 b=jmkwYQrkFK0BodARwSW+9fiiTwiHooMr9WiERhvdWHWFA5PQaqS3dXsy9xMio2WwRqa3FIuFVpNeOEOzRE4sBk4NbNddkXUXRjcPBlkM2mft4rewdrPTlvsP69hD+/yGJVkh+ptHolGM8ZTad2u9AoOZdGUefMDQpNW48CYtaZL8Imro5fUw7w1dAGrfErtK6s034dPsIrnVK3sVN4lSkLnxHQbwNarkDB407i2WgY8bW2KOrRSmVoy3RO2VKA8J5x22cLE0q0YVgkfaER9SyuCZuQdGHmPs42MyQds/dpYSnFYlkpFVtqgnwby9clXzVpdG9MlRZ8Di8MpnRcMPKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <8cfa0b14-7415-4fc9-be0b-dac36467eed6@opensynergy.com>
Date: Mon, 13 May 2024 11:56:15 +0200
Subject: Re: [PATCH 0/1] virtio-media: Add device specification
To: Albert Esteve <aesteve@redhat.com>, virtio-dev@lists.oasis-open.org
Cc: cohuck@redhat.com, alex.bennee@linaro.org, changyeon@google.com,
 daniel.almeida@collabora.com, mst@redhat.com,
 virtio-comment@lists.oasis-open.org, linux-media@vger.kernel.org,
 eballetb@redhat.com, gurchetansingh@google.com,
 nicolas.dufresne@collabora.com, acourbot@chromium.org,
 =?UTF-8?Q?Matti_M=C3=B6ll?= <Matti.Moell@opensynergy.com>
References: <20240510134317.3201746-1-aesteve@redhat.com>
Content-Language: en-US
From: Alexander Gordeev <alexander.gordeev@opensynergy.com>
In-Reply-To: <20240510134317.3201746-1-aesteve@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEXP281MB0183:EE_|FR4P281MB4478:EE_
X-MS-Office365-Filtering-Correlation-Id: 966fcdee-b8b6-45c8-e035-08dc7332ef76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005|7416005;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFF4Skl3VTVUb0VOU0ltSkE0RCs2SXhwd3poZ2o2Sm1QdDk4dlRNeUk5eFVm?=
 =?utf-8?B?aHJKb0JJd2tpd3RJbmhhYVJ2NHEraXd5Q3AzdTJaNXl3VlJXNG5QcFVPemVN?=
 =?utf-8?B?SVU4aUdQVnZWR0ZiNFpaSzVMVTdRTkZOYlFXbVk4UVhXQm9zWDlGeVVnWm84?=
 =?utf-8?B?MkNWcGg4eHc4Q3dlaGZWNVJ5RUtLUHJmUVloSm9QeVNub0ZzV3V2Wjk0VkFU?=
 =?utf-8?B?bmRpc3hERmVXTlZ5aSt2bWszMjdvL0I2Q2NvQ3UzQUZNL3lxbTgwQ2pkelpq?=
 =?utf-8?B?Mjhpd0pyNXZqSm5GN3J0OXpEWitBV1o2OXZmbm9mTkh0YXR0clBpc3d1Q1Bn?=
 =?utf-8?B?eE0zUjhyTCsyajhWZHBUNTN5SWVZQng0OGVpWHFWNmtsRHg5Q3paNmpxSm5I?=
 =?utf-8?B?VEIzeUZReFBXN2pwOG4vUUJ4bmJDc0lMZ0N5RjNMTnRiR01hNEJScEFCc3J4?=
 =?utf-8?B?eC95L05nMUprNlo5REUvNFdqcVhwTEdrVHNiL3BLcFVycmY2bWhXM1hwWm1p?=
 =?utf-8?B?S3hCbmNSWjhpSGc2eklTdURHYXU0Q1pITS80U05mU2VHeSsxTHdnVmlHQzFk?=
 =?utf-8?B?bi9rT1VZamJHRExoQ1dDTW5aUmxFSmJXWnBDUEhoN1Z1MWtFTWxJdjU0cnFm?=
 =?utf-8?B?ZmdVUEhzZURINVFLN1JaVWtmR3ROTHQyaEV3WDd3WE9pNE1vSndySi8vcTNx?=
 =?utf-8?B?d1JCMXpKTEM1OWJqdzZyR3l4SExDUVZmVU04MkFQMkZEUXRxS0VJeW1oRjFv?=
 =?utf-8?B?SHZadld4T1g3Nm1JZUlzSzgrOU45UkxJc2Rpcmt1ZmpGNW1vWjkraVp5RmZ4?=
 =?utf-8?B?MERDUzJPdGJzRUUvUnREaUpVY3ZaS0ZMcjJiZWxtT2wzMUhMb0p4ZWRidHZJ?=
 =?utf-8?B?U3pBdThENG82ZXZFWmxYemZ0Y09yV2YyR0hqSXRWbTJ2SHZkd0ljSmVpSHo4?=
 =?utf-8?B?QTFEYjkrLzZYdytwYkVZaFJmTTYzSG4zRG5WTFpEa1NHQlJGNTdnL2xOMGNO?=
 =?utf-8?B?dTAxcFpqVjBDc3owKzVBcTAyS1VaeFQ4RE5vWGQyUUYvWEFrUlNrMC9NVXJh?=
 =?utf-8?B?R3d1R3EwUUlKR3BLMjBxMCtJWE5WSlBqOHNIRDBvU3NkZmphMXFPNnZQOEo4?=
 =?utf-8?B?eGM5bHdTQ1F6Q0FRNHhOaWJXeThvOVBEQjdEUWZhZ1YrdDF3L1NXeEtwVnRn?=
 =?utf-8?B?MDdDTW1aNGFPcm1aVjRDM241VFQxL25OZ29uay9MNWYvVHo3VVY2VldoSjNm?=
 =?utf-8?B?UGVpd1lFYVlueXpnWkprbGU4L2NGRGwxNWNhZ2VvM0hOM0pydm84a2pvRGFH?=
 =?utf-8?B?WXpzb094enN3MG1zNHNZN3BOTnNuTk1PMTBwT1pDOWhSMWdrSFJySkdKMWJU?=
 =?utf-8?B?aW1rUjNTQnNZMC9jdDJPOFl4aCtqaEozcmxIVEpHQWVtSEtzWmxEWGY4YkFp?=
 =?utf-8?B?ZEpOalV2ZEhUNWJQV2NsRGhVOWlsM2R3TE5sdlowNVdXKzZpVCtNcTNIK3Ew?=
 =?utf-8?B?c05KZ1kraWtZTXB6WXNxdncySlQvUWoyVVF6ak9TeEZBT3VyWHhqdWdHcUVv?=
 =?utf-8?B?Nkd6TjdkMHJsUE93Tnk1cVFab1RlUEEySFJEN1E1ZGVNWGgzVm83SU5EVlVo?=
 =?utf-8?Q?Z0vsVSyOacw9ddh08fnJun6F7Lj1t547o4j2yZN4pr14=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(7416005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RERpeWZlS2RTejNOeSs3bDRYOGo5NDRPL24rb3ZBSk5hcFJldzJKWkZHQVRs?=
 =?utf-8?B?bFVnRi9SM29ubHgxV1lTeEFlQzhBOVJWeWgxcmt1NENSYXNWZUc1YUNnaHdJ?=
 =?utf-8?B?UXQreDIrZk9NamJyc3I2MUxPZWl1anlpNTg5T1RsdUtsQUZGOE9wNUU3SnV1?=
 =?utf-8?B?eno4K00rTVRtYW90TWtpZEdHcFRiNG5IWisyeVIwbStUdE1SWVkxaVYyZWdI?=
 =?utf-8?B?bk5zRkwzdEFxb1BiQ1ZtUW9kQ2NWMTFsTEhOQTlRdTVQWmRXTVU2aFowVnVW?=
 =?utf-8?B?Wk5JbWxNUi9FaFlyNEN2bzZNcVRSbHRkY2QwSEJWTGM3ZzVGKzB0Tm15TGFq?=
 =?utf-8?B?NHJ1bkdiUno3eUJINmNYZDQwS0xZQ3NaMzFTTlFNRjlvOHBLSVlVM1R3d2o4?=
 =?utf-8?B?VWxlVVlGWTFCZGY4bzg5WUw3NzltZEFzNzNqRGFaQTFVQkVUcE5OTGJra0s3?=
 =?utf-8?B?bytXbFJXY21UbFNGY2dRQnFiTEVTc1pYTDVHMUNQdXNxV3hDc0YzSUVaRUJZ?=
 =?utf-8?B?RmVYQUxkMTJGam4wMUNhY2dBU2VTeHJyRDBWaStmRERjUHI4eVdzMm1BS25T?=
 =?utf-8?B?VjN2NDkrUEQvZFpzcitmZXRsNmM4a2dFejZEcERWZ0UyMWx6USt0V3c0Smha?=
 =?utf-8?B?MVExcE5oTVhIWlV5SEV5NURTUldYTWV1Vktnam11cHM1akQ5OHJ3VzJZcFE3?=
 =?utf-8?B?ZlBNbnZzL2F5ZE4wWHBoejN1cGcwMTRrZEdzaHBoVzFGMW5oR2VJSXk4VG5J?=
 =?utf-8?B?Mi9MZk1FZXJvbGdLMXVKUStReUtlbFdsK1h6YVZ4UDM4Z2NPeGRISlE1ajVS?=
 =?utf-8?B?ZXJpODQ3aTMyYVVrZEprenJQdkRtakg3ZHBIMHRIaHJPYVNmeFlaaGNBdVdq?=
 =?utf-8?B?R3RHVU82MXRzVGErQk1KN25JRFlmZ0RIWHQ1ZEhxaG9Hb1h1cFZWWjNvcG53?=
 =?utf-8?B?L2dZTElJbmExVzFEckxGWENJYlp1Y2I0cTR5UkllUFoxR1p3Vzd1a09KMExI?=
 =?utf-8?B?NWtSWXFwV3NCcE5UbTMxVU1wNjhNN3hqbzNjTVhrdXR0dkY5M09zc1BvdHl2?=
 =?utf-8?B?YklaWlZaT1B0NWJ4ZE5heUIvcjdBK0didUd2MmY0MDRweXNQSHQwQVZYMmF3?=
 =?utf-8?B?NkxuaVV2bmR6dUZHUzdIMGFKMjJIK1VHRlFyUElhOVRBUmZ0bm9xQnNtNzlH?=
 =?utf-8?B?OWNibDdWZnVTWCsvbkhsMnNCUStsdU9vSUZIejU5L2cwcmxPNjYxY2VjYWND?=
 =?utf-8?B?Znl6T3JNclZoK2FpR3JPSjN2aDhYWVpCSkgwWXBIcFJWeThVRzBtbUpVRkE5?=
 =?utf-8?B?QlIwdlhOVEZEb1NZQVhnYWx1ejdYclZpTTlpMVRQVFh0MU0xWlkyQVFCK1ZY?=
 =?utf-8?B?SHFOVjJOSTg0cDNVd1FHVG5YenF4V09vR00xZ3ZhTDc2NytWNTk2a25xekh3?=
 =?utf-8?B?TTQ5M1o5aExIc0dzNmczK0FYaU4zamtINExOc1UxTmJLSGhwcWFwYitHK1ht?=
 =?utf-8?B?UWZkdk5OMkN1TUQzaThvMEhzdk55Ky82Sk1iTEhnL29NZnRLR1pVN3YzT21M?=
 =?utf-8?B?TnRWZUExRmozODkwekczU0dHNDhSeTBvd05xbk9WRlhTUWJJNU9iMkVVZ21r?=
 =?utf-8?B?cGtRUzREdm1HMGpNSm9LQ1hiUlZSKzNkK21GQUFoMWpReEt4Y3Vxc3IvdGxR?=
 =?utf-8?B?bk9JdkFBb2FaeHRnYklGQU1HM2wxcXptY2xmMjdSVTFFbUJ4TGRmVEFxQkFX?=
 =?utf-8?B?dkdETFdoMi9uSGs2ckYyV2RiU2o0ODFtWXpnbU1VSENuOUFXUVBHU2I3aVNN?=
 =?utf-8?B?cXUyNGJiL1JUcEdOd3Zrek1UZjg5bHlFZjY2ZXFFeHVLZi9lK1M0ZjZPTDlN?=
 =?utf-8?B?K1Y3dUdMeHgwcmc0Qmc1QU9pellQRzdNNzVTM210K05YWEg2Ui82WldzNFdi?=
 =?utf-8?B?NGpieEg3MytsaENGVHdOTGgrVmluUFNNTXpGOG9DbkROVUN1S2lYWUMwdmh4?=
 =?utf-8?B?aGpVOHppSk5HY2pqSDh3Yko1UW9HOXFaYzRPcldiUWlMdjJ0Q2VzOERKVDN0?=
 =?utf-8?B?MVkzc3FNbUs0WXVoT01kN2FVWDNGTUF4VWxNOTl1Zlk2WkxYMnRRZktOUmlz?=
 =?utf-8?Q?DD0Vv8ocBpWKYk5GcneMusJMm?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 966fcdee-b8b6-45c8-e035-08dc7332ef76
X-MS-Exchange-CrossTenant-AuthSource: BEXP281MB0183.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 09:56:18.6502
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m/1hamDeUmh5UVIkjWqZupqK1oVzate6IjUnuQyks5AC0ePYvE9Sg56xhwEV3sIJXKdLYvmYIsFP8d7Zc+zLsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR4P281MB4478
X-TM-AS-ERS: 104.47.7.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1023-28382.007
X-TMASE-Result: 10--23.387500-4.000000
X-TMASE-MatchedRID: H0/uSqZo4D75ETspAEX/non73EnA6dC3lR7tN56aWVWOymJujT8rWJtY
	XV8Pkii+laHQ59CB/kYEe0tIYIqXPLkeKW6KfnZEE6hK10iFnk5E64d0xcPXxZdigZi17dHqAWi
	5CYmIyyseq6eDJSt71ynMSSXF3FvCSfihM3YB4U8zqYp6VRKRETb+zdxoKT1DgotzKR+rmj6w0Z
	t5JvNYuXPE9VmsHawdnXS4fEyE7IuQ6l9zTnkxdFY9XYa1m8xAhQpD4YtsXs0Yiu1iAYQFrbFVT
	WPbvmThoAsBV5GWDfoCFmeJGpIR68JmMmMAritageyhdXGBPr+6nwouULRjT2jovzHXgmdWlgHF
	9yNyFxxhbKuwJkPkeEldVGVepP0LjBn0FJooaeQQ9JMcGBx+/qLdzn889XW4tkizkICRyc5akQO
	Y/KXvPdHfMFcqTykCYGLJvz7su2q1MsxF+lLocU6RFkVKmWDbeEdU9DhebXi9i+/f9tLGG+v6z0
	cEnHUdDJGx4fIYRwCx6frpJFf/MAhrUAC85MbtugsKg3hgnMzFP5vIBOb2T63/rEOakn8sSPpeu
	b08beK6miiB19Ur4l3jHUhSUqcUaIn7kYcazIMk+VN5SeE/CgMog+J2Le8SS4l7fJjcctMmkrgX
	3CciJpBlLa6MK1y4
X-TMASE-XGENCLOUD: 45c93c6a-6665-4d87-9a26-f868bf23a25b-0-0-200-0
X-TM-Deliver-Signature: AF7BFA5416C2AAFD4248AC0247059E70
X-TM-Addin-Auth: KhVKAsAV7FT/GG5QmzvDrDoHg5jz0cpKJ7CEUcduYM1yq3U0xViG8IvMjaS
	f6+qMrVCDdIwO5zY3MqlBRI9zZwJR79Vy0o/ZrealJElWaiHty7cCQXYoFGjpL45B4DX9m+H5gC
	CE4m2puV98zyC6gUUXjR/63JP2bwhuF+KvqvPR7qEN4hqzoFn5dfPgw/83t/kuAVkv93ozkbJpN
	7GbW6LPZcs9ZyqNN8fZAbcYDsNCbaJp6jSuuJIEORPAXK5KUsCtN3kQ4suL8HohLBSsjdJqeJFv
	pECJ6xhzRnZkVWk=.HVRUyNy8CCfVHaj+saKyQx2H5NIDjICMQAYU+M4WY5pjgm9tsW5yatotz5
	XtdZw+zEXY3b4y/lK9xMh55FCrxL88qJT1wbO3TbiJpM2Sc09gwsISEwNqfiX67rtrsOsIzuWch
	PoewzHYqnhVdwoGFjlz7kVVK9ES2XuJ5V45Kn7aqnsBd7O0DkRU3NBPHs2RPZFBw3nUOEF5E8jw
	Fs0ZGx6lhqGo7rzSAmVD2USf5yK8BPaP/787JKMNYHAwfXIIbpj4wfpoWloKyd+82ck6LIUaQX/
	JPDA2/q7tNmdSJp3c18YYMJDXqTRe+DiWdvQHxOmqdfLzTX9c1HWgDmLhuA==
X-TM-Addin-ProductCode: EMS
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=opensynergy.com;
	s=TM-DKIM-20210503141657; t=1715594185;
	bh=zJVm0YHlWEIQGzmqwi79mu5/8rHGiEiwaYE1q4TGNT4=; l=3830;
	h=Date:To:From;
	b=1o6AwOkPGlsJIHZmTfQMspYKTxkIV1g7rIOqSXlJ9dhAmWVsD7pvdf8l0sXfyf8Ag
	 36NMXJ2NiPk8RMFZSU+tMtaPuMWaugM+q4fuUC/ounH0CfUgfsZmoKake+6/Ldet2n
	 VyQt64RhLZDyPz5i3z8Dn6Lt4TY+Mhdejw7cTqyfa1uvKLJ8ZLiy4NdHiuPn7qsOyN
	 AK1g/WEd10iLZjSKofdw9YEeeqCMfu7wlshA4IdSr3IysDcwa1NnfBoAZbYLIgpn5h
	 Az3ZbvgCbSV5j2R90QQS5PPjUBiL7VUapU2uvlVxJF766+pKOEQrnUA8qjerrmBdUT
	 WLiRgKpmWikFw==

+CC Matti

Hi Albert,

On 10.05.24 15:43, Albert Esteve wrote:
> Hi,
> 
> This a formal attempt of including virtio-media
> device specification.
> 
> Virtio-media came from a discussion on virtio-dev
> mailing list, which lead to presenting virtio-v4l2[1]
> specification as an alternative to virtio-video.
> 
> Later, virtio-v4l2 was renamed to virtio-media[2]
> and published through:
> 
> https://github.com/chromeos/virtio-media
> 
> The repository above includes a guest V4L2 driver able
> to pass v4l2-compliance when proxying the vivid/vicodec
> virtual devices or an actual UVC camera using the
> crosvm V4L2 proxy device. Steps to reproduce are
> also detailed[3].
> 
> There is some overlap with virtio-video in regards
> to which devices it can handle. However,
> as virtio-media will likely be the virtualization
> solution for ChromeOS (already landed into the chromeos
> organization) and possibly other Google projects for
> media devices, it would be desirable to include the
> specification in the next virtio release despite
> the aforementioned overlap.

Well, last year Cornelia made it clear, that this kind of overlap is not 
desirable in the specification. After long email discussion we had a 
video call with some selected experts on June 1st discussing the 
proposed approaches. The conclusion was that virtio-video development 
should be continued, that the virtio-v4l2 use-case is valid, but the 
proposed approach is not desirable in the specification, it should be 
instead implemented with multiple device types. It was also concluded, 
that a new device ID should not be reserved. It is a pity, that there 
were no public announcement after that, so now it looks like we're going 
to have the same debate again. But I'll be happy to discuss all of this 
with Albert and the new joiners in the discussion. I believe my 
arguments are still valid.

I suggest, that at least both of us (and hopefully others) start with 
familiarizing ourselves with both virtio-video and virtio-media. I'd be 
happy to present the current state of the virtio-video spec in details 
and answer questions in a video call. I think, I'll need two weeks to 
prepare. Maybe we can even resolve the issue ourselves. I think that 
would be a good start. WDYT?

> The device ID in this document differs from
> the ID in the virtio-media project repository.
> And it will probably need some discussion on which
> would be the correct definitive ID.
> 
> Full PDF: https://drive.google.com/file/d/1PG1YxzbSvQHPphFhbUKyKKdvuwO6shyi/view?usp=sharing
> PDF with the media section only: https://drive.google.com/file/d/1Y7kAGzlUfl30VIUx9wQtz5sFTkWnBiyA/view?usp=sharing
> 
> [1] https://mail.google.com/mail/u/0?ui=2&ik=73ebd65ebd&attid=0.1&permmsgid=msg-f:1767388565327924962&th=1887068940754ee2&view=att&disp=inline&realattid=f_libalimc0
> [2] https://www.mail-archive.com/virtio-dev@lists.oasis-open.org/msg12665.html
> [3] https://github.com/chromeos/virtio-media/blob/main/TRY_IT_OUT.md
> 
> Albert Esteve (1):
>    virtio-media: Add virtio media device specification
> 
>   conformance.tex                           |  13 +-
>   content.tex                               |   1 +
>   device-types/media/description.tex        | 574 ++++++++++++++++++++++
>   device-types/media/device-conformance.tex |  11 +
>   device-types/media/driver-conformance.tex |   9 +
>   5 files changed, 604 insertions(+), 4 deletions(-)
>   create mode 100644 device-types/media/description.tex
>   create mode 100644 device-types/media/device-conformance.tex
>   create mode 100644 device-types/media/driver-conformance.tex
> 

Kind regards

-- 
Alexander Gordeev
Senior Software Engineer

OpenSynergy GmbH
Rotherstr. 20, 10245 Berlin
www.opensynergy.com

