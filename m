Return-Path: <linux-media+bounces-23390-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1569F0C88
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 13:39:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8549E18812CA
	for <lists+linux-media@lfdr.de>; Fri, 13 Dec 2024 12:38:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFB91B4128;
	Fri, 13 Dec 2024 12:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eUeRG7AH"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534EF1DCB09;
	Fri, 13 Dec 2024 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734093471; cv=fail; b=Cr1Oh8KOBGs+gd01im0txAuOm6e+T+MUoz5S5TFA7c/oqmBqo/Qcr6oRW6RhVDZN0o49AHnqzXxSUxE8+T1qSwRqLxc0QcgnUP6Ylr/8jdCkKnK4lLahCXESZ93OwArAwlwElUhz8033Tmz0UY8qUJ11cdtffjixb9b56zkqzrk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734093471; c=relaxed/simple;
	bh=6ht0VEQy2sWKleelgv3Os1pwYcbtWuoTAXIIYQA3de0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YMhM3UW1ysG/csPX6k4XMuUsWT1MZRb/Lznq+HeNBFYJLi9g/02N9TogueD5MIVVMxEhlmjvq0hhvx7R96A5W5w8bjkj/KTENZ24biUjLF4L4WEVVrgibhQTTD1mZU13HBofnuPUAt3paZLmuFx7ZPMQY4JpnJ1yhGolzujEncw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eUeRG7AH; arc=fail smtp.client-ip=40.107.237.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HoHX6YnNx3+uyKIgDyOIx/mzm6BG593YQ3VkWFg8JyQDhu2gMNtFKaUTyObm7Ecc5x3867ZhMVOM+8OkkYH3cS8jt7wQNUiDueNeaKy7TGmurZeprrTb6Vq7d9HH3i/8/v4vZBnjTtEz6Q5xrUDeYrUJ+nR0Vsi58+visQH7xYj+J90NOcKt5Ujr4d0rQm8wyb9D7Y9kBq2Y8ioq8E4EXVvn5hsMxLdqd4gIXcC4CuuwPU4pTW3GuXiIFvPbdUCJpETGOrb1rkoPpD0DaeS1xirYvYiYO/Kp94SGprb229m8pFwkyi8QpTRfC+C5IrmwYUGIkTANoiqvLIvNbE4obg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bd7Oju1uEfShWBmxuSbIbBl0Rv8OG2koLjrb8fpuOTM=;
 b=fnYuXTi8h+G5yJDIDg2I/kv/BMxP+k7DRZQBQ9WibATWt7+/LvjyuSGs4pFXo1kGWjqP4j6YHajDZs+S7yeRQ2nz2DO306EMXG1XwET2xAXM+TL0xH9VuvQ/AZu7Ym+fWPzOxkJgNOi0JZze47BHzk1bbmte+Wz7/4CqaczYQlvpWwWtkXxl4KsINTmvpnT8GWqVxhyqCgpe6WBhuec34yv0nHjGBCU+sWiqLx7mP43r6fwGmyYjGnQ8XGSJ9T7JLz6Z8XiBHJCRYSqvgp+mW9bNT6BYHABb7I7/CqaXsfgjyCob+KAZEuoUn+RBb2OCkiNWSd0qPwuLlYZGnPZrPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bd7Oju1uEfShWBmxuSbIbBl0Rv8OG2koLjrb8fpuOTM=;
 b=eUeRG7AHfMNDkwi9AmKLV/BdN7bpnXJAjJ3QTJBoK1S1oPwl4USzUsZoEPbEgUGJ7ykVwkNFsSiSHIh1NxJDvtsV2t8LBrVBNq2tn5SgdI9nhkQZZyKZn7g9NubHOqOUCRNATGTy0zo5bpA49t84WVpiBAqSpIYCEh9i1iK5apk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8)
 by PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 12:37:46 +0000
Received: from SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30]) by SJ2PR12MB8109.namprd12.prod.outlook.com
 ([fe80::7f35:efe7:5e82:5e30%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 12:37:46 +0000
Message-ID: <9f0aa54c-cd6b-4b0e-95ba-f7138903ba2f@amd.com>
Date: Fri, 13 Dec 2024 13:37:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] media: ov5640: fix get_light_freq on auto
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-kernel@vger.kernel.org, monstr@monstr.eu, michal.simek@xilinx.com,
 git@xilinx.com, stable@kernel.org, Sam Bobrowicz <sam@elite-embedded.com>,
 Hans Verkuil <hans.verkuil@cisco.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 "open list:V4L2 CAMERA SENSOR DRIVERS" <linux-media@vger.kernel.org>
References: <2e79be9185cbb0dbe40e670eee996cf290bab0a6.1732264079.git.michal.simek@amd.com>
 <Z1v2VRzgUVpHZvXR@kekkonen.localdomain>
 <05ce02de-6eed-4f28-8052-56ca9cac4b64@amd.com>
 <2024121303-arrange-hydration-7cf4@gregkh>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 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
 3i3l5DA=
In-Reply-To: <2024121303-arrange-hydration-7cf4@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::18) To SJ2PR12MB8109.namprd12.prod.outlook.com
 (2603:10b6:a03:4f5::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8109:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: fce9b29d-3a40-4ea9-75f6-08dd1b72f238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T2NYNjJQbEs4eE5Ub3pUVENTWDN4YWVnQllxRysxdUNOWExvM0ppbFBNTGht?=
 =?utf-8?B?OVJZKy9hNmZsdFlOWUlmUFo2YjJCR1pHZERJdGh4dFF6VzNFWDVIRjdBTURm?=
 =?utf-8?B?Z1FENFZxemtQaElYTkRzM2dnaWVzL0RKcWVqZllBNjBPRzJNTzJHS3FJRndj?=
 =?utf-8?B?RjQ5SWpIV2ppcDRNZmovNEIxcnhrTElVd1o2bzJ4MWRYTEkvY05uN1N5cXBp?=
 =?utf-8?B?OGRmanU3d3hwaXRnK3oyUVIzTXYwdjR6UkRnRkUvL1BnVjdNSmNCOUlXK20z?=
 =?utf-8?B?aitWTVBYUk5wbCtpN2RLemY1L0p2QkZwRnFkck10QThpTlJKUDRjeGM1Y2R5?=
 =?utf-8?B?OHlQSVRYeWZQMmR1elREc054K1J3cVFkaWkzdXRWRVJXUEpqMW8vZnR6ZUh3?=
 =?utf-8?B?cG1kcUJ2U3h1OXVna3Q4dEZrWW5JWHdwdTEvZzdKQzFvVE5rR082aHZyVDZS?=
 =?utf-8?B?Wk9JT2lrdDA2MXhoNURENTBIYnBNcExMTzNVZXpHR2x3VzcxR2dnZkxJKy9C?=
 =?utf-8?B?VFlZa2l1cVNhbTJrK2tSeW94TG02T1JXdmxBSlFKQ2JKcjJDOVR2WkJ0OFNH?=
 =?utf-8?B?VWExTnpWaGlnZnlSWEJCQVVUZmkwVUlscUtLaXY3b1pYenJSZjJqNmhpNzlM?=
 =?utf-8?B?VzhTMUxKZzl0OXFHVERIYll0K28xYzFPL1lEaFNyemhMMFp1ZFhEc1dpSzM0?=
 =?utf-8?B?UXNBcjNESDBJRmk5SFUzSk11Z3pIS3J4U2oxKzZoanc0RnFOUUFsb21vOVVQ?=
 =?utf-8?B?SDdCeDNkREhFV2JoeUwxUmZxdWhzUUxZa2c1K1Avd3NTMW10cFd5bmJPcE1o?=
 =?utf-8?B?TXNOMnVZTmQ3MHRIWEVyT3A3ZlhSY1NsOWZUQXNQWStrZ1haRFp4Z0U1aDM4?=
 =?utf-8?B?d1RQV3pkcjNjWm1mdDdXaHdjSlpoZHMxSStyTDR2cVBKNTd6dnJaeXVVYUhX?=
 =?utf-8?B?UDdsZjNOTldXcXE0MDZkOVB2a1dDa1Z6RUtkdEgwSUJDam9KU1A4S1BLUUZ2?=
 =?utf-8?B?MTZEMkxCMFVhWmUyVXRxcmM2dE5HMmtDelFRWlF3ZS9OSGFZaWxNZHFvY1Vs?=
 =?utf-8?B?elVGUGxsTDlpcTZ2SHlKUTdoVk1PSmF3Qkk5TzdiNnhBQzFFR3dzYTIzeFBJ?=
 =?utf-8?B?bU9kTms4ZlBsYVdxMmI2OG1YWGFiRjBGVklEVDRKRU5RbU10dFQwb3AyQXJa?=
 =?utf-8?B?V0sxS3kzaGtiWUZESEdJYXIrKzZKUi9Pa2xHN2pxUE1CMEtiWm9meUhrN1FS?=
 =?utf-8?B?UjkyWHY5ank5eFQrRjJJQXJuSmFzZTNPM3dKaG90SkMzUDFhcXJVVDRoNi9Q?=
 =?utf-8?B?MU1hRnRqdnE0eUhVT2NuaEpJUEg1aFBHQlBsY2ZWNXBmeDhaYU1jVnNXTkF5?=
 =?utf-8?B?UTRQaEIySVBtcUowQVRVazBEcEpMQnplR2Q1bTNWZGdZYzlxRndCa0o0QmxT?=
 =?utf-8?B?bFMvaDJ4YnczMGVpUjVNeWF4bGptUEc5SEZ6MzVDMzJ6WWJSWmhoVFhNOHZG?=
 =?utf-8?B?M1R5Y0pOQVpYS3RlMUZCVm00SmxXM3JxeEMxTEFaL2ZSVkRQQk9JcWluMndu?=
 =?utf-8?B?c0hBUWRiZmhNRkx3TlRjMURMS2xoMlJMT0M3S2pkTTl4eVRhUWtsaU5DMTdM?=
 =?utf-8?B?cWRVcXVWSm8yaHNLTDBONWUvaFFKckRESG1CT2pMTUpRMzVXWlhmMGlHenZH?=
 =?utf-8?B?elZEK3Z3cTlYaTR2SytGS1ZoYkI1WHVEMkFYME82OStBMUI5SS9DUzJ1Y0RR?=
 =?utf-8?B?OXoyNjZtWmk4OFE2QXVLZ0Nsb1U1M3kwbkwwQUlmYlROOG8xK2dCQnlOQkgr?=
 =?utf-8?B?U0UrSzlLRDErNjQxN05HSFB0bnU2YkhSVVBXVDU2TE02Y3o1NytzQzU0R0Zn?=
 =?utf-8?Q?xBevbtFm0k1ax?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RDMzbEdyamxpQ0wwWk8zc3lMTWRPa1IrRkJNc3p0d1gwWitPTXdSSjhRTHp3?=
 =?utf-8?B?REEyWmFRSHFMWkRIMWtZSEpMU2NrT1NiWkx3RHF6K1JvbzViYXBjODRxTXFG?=
 =?utf-8?B?MVZhUDZSV0NSSGRxZGQveDRaWG5saWxXek1Gdk1jRm1PMExJeTBGNk9nM0M1?=
 =?utf-8?B?akd2TXV3cEVvOFdWRHJDU2Z0Z00zaEJUYWtNWVI3c1pDYVV4THZHNGh1bkhG?=
 =?utf-8?B?UXhCSjZ1RU1jYnFqczR5LzlLb0Z4Mk5SNlhZcFZWUUVLMHdnRlFnVVdvT2k0?=
 =?utf-8?B?M3B3U3RxdmtkVnNvVkxXN0FKK2FNbDdWYjM2bXlFc1R2Q3RKbGhuZ1dEdzhq?=
 =?utf-8?B?TzhLRndneFVCSzhLSktOL1JiYTJRaE5XNGJZV0hqanpvQWc0YVFQS3JmTzhu?=
 =?utf-8?B?SjdzdkRLaVlFaGY5RWtZano3bHk5UmZ0Q05zbi9HYksxTUlBWjJuakNaWEdu?=
 =?utf-8?B?TFo0OEhGSUFpVEJrZkU2M3ZIaldmbG0rMUhyNmRhdnBkYU9nTmJRbWNLVExP?=
 =?utf-8?B?b1FHRjljVlJlUjQyVk5QU3ZuNHVEYlE4a0pCZUNjQTg3UE9PZnZzTU4zQTdX?=
 =?utf-8?B?djhWQ01Pc2owNE5IMzVoQmlwRmcwTVMzOFNpc2tUaDJUZlZKYUFPNW5xV2Np?=
 =?utf-8?B?bXlRRk9jbldrY3ltaWhHUWhCbXM4RlpicGJ3RnlWTWxNbzdERjNVaTN6bUZR?=
 =?utf-8?B?MDN1SkhLTE9rTjNoV1J1R2w5YlowWWVRMFNKTUtmVjNUdzlWK09ENUswSHJL?=
 =?utf-8?B?dXNvWVFoV3NwL0psWUlIUjAvTGtIN3NVUFpxRVBDZnVZdFNTZ09qNmx0UFg5?=
 =?utf-8?B?VkYvaHRRY2kxOHVnVUVNcUhxWGZRdm13MFIzTG5WZmhQNE41VEVTakR2WWVy?=
 =?utf-8?B?WGdqL3JlTnVlYTNqS0Vqd3pEZW9sblJUUE9UeSsvODM0b05wQzJpYUxSRkxH?=
 =?utf-8?B?cS9zV0htSkJmdlpoLzBiYThEN1ZNN0JDbzB1Ly85a3RvQmE5VXlDUDVBZ0gw?=
 =?utf-8?B?aGlBanVEQWV3UUNwZkZoWlA5MnhmempQWmxWRkVRaVF0L2NVY2x5bUZhSjdY?=
 =?utf-8?B?VXc1T0hFODM1VTRMWUhiYXBqeDMrSTNqK2dIL3cySkNMZEFycXo3bDVmTklI?=
 =?utf-8?B?bThGNEI0a3B5NWw2NHF3a3VtbkhXdm1qN0xKelNldVVqa0swUytZNFR6OWVn?=
 =?utf-8?B?WFRmMUIwbVhYd0JCU2cvSzAxS05YMHgrbitIM0pIUGZybXMrUHc5UjZVWGwy?=
 =?utf-8?B?MnVweHgzeTdYeHdtd0dCMUVlVUlka3JLcEFaZThHTnR5MGlYU2U3U0hPRTBk?=
 =?utf-8?B?Uk82eDUvbVdPMXpGSUlDYlVmYzVWK3JnSy9XQysvV08rUE92dzNkRjVKSW41?=
 =?utf-8?B?eXlBNXVtWHVFQUE1Skh3cnVHWGF0RDdtRG5MMFFkcTdCZkdleWRDNHZoL3c0?=
 =?utf-8?B?enlnKzJrQTJJWUhmTVRLQWUvb1YxcXE4dkxRMXo4UFJidlVJVUNrWjdDTkZE?=
 =?utf-8?B?UEd0VzBFamZKWDVnRVNPaWVMY2tvRllzT3lqMlc0T0h5N1FsUUNscXl4MWQ2?=
 =?utf-8?B?cjlpQmIyc2xicVE1cnNpZ0N5OXViSmJUMTBkSHlrL0NzcWVvZFRTTXhWUWNY?=
 =?utf-8?B?cVM2QVdNY1Z2RURUb1lEMzAxMWdYSU5hL2hLbDRKSExnQXRBUjg1eFVBZDZa?=
 =?utf-8?B?SE1wNS9xc1Y3b1pyOENyWUI3WElzQ2Q5QkZLQUlzcDlHRVEvTnRKcVhBWEpP?=
 =?utf-8?B?R1h6WUxPNW5ka0duMldNcThhTTk4ZEdWc1o3MzQvQ2RvNlgxc1JEYlBodGN3?=
 =?utf-8?B?VUt3Y21iQ242ck1YWUlKZVNNZm1mb0hhNksrbUx3OE8yd3ZUQU5qd1luOFNk?=
 =?utf-8?B?RFRvRGxpMnpvUkZiNnFkZ2JuU2hQUEpBbUZ2UHFHSWlrU1hKWUJnWSs5Y211?=
 =?utf-8?B?OE9VSkNrZ0d6WjRZZEsrK2FCbjhaMVgwRWJOWTAyMjJOR0d3ZWhVL2x0SHA0?=
 =?utf-8?B?b3BLalpUS2MxL2NhWkRzZ0htNGxJUTZibWxmTW9IbVF2dUhaaWdrYlJSRXpX?=
 =?utf-8?B?RkJJSUhINk9Hc0NDM21OZTUvMVkyaktKWUxIRGhnWUFOa2VyL3lvSUkyektv?=
 =?utf-8?Q?DgFYHeu/BD4p7YfINsK7AtVPU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fce9b29d-3a40-4ea9-75f6-08dd1b72f238
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 12:37:46.2996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ExQn9xLK5vdZuTrha8dLuBYfUYQpYgA8a94YfV4y8EzSI1SEyE5EVJQRK/phT4G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634



On 12/13/24 12:12, Greg Kroah-Hartman wrote:
> On Fri, Dec 13, 2024 at 11:30:38AM +0100, Michal Simek wrote:
>> Hi Ailus, +Greg
>>
>> On 12/13/24 09:54, Sakari Ailus wrote:
>>> Hi Michal,
>>>
>>> Thanks for the patch.
>>>
>>> On Fri, Nov 22, 2024 at 09:28:01AM +0100, Michal Simek wrote:
>>>> From: Sam Bobrowicz <sam@elite-embedded.com>
>>>>
>>>> Light frequency was not properly returned when in auto
>>>> mode and the detected frequency was 60Hz.
>>>>
>>>> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
>>>> Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
>>>> Signed-off-by: Michal Simek <michal.simek@amd.com>
>>>> Cc: <stable@kernel.org>
> 
> That address is totally acceptable.
> 
>>> Cc: stable@vger.kernel.org
>>>
>>> And right after the Fixes: tag.
>>>
>>> I fixed it this time.
> 
> Neither is required at all.
> 
>> Thanks for this. I was trying to find out if this is described anywhere
>> because in stable tree both ways are used. Also Greg's script didn't report
>> any issue with it. Is it a rule for media tree or your rule or described
>> somewhere?
> 
> It's not a rule anywhere, and the use of stable@kernel.org is also
> documented (it routes to /dev/null and can be used just to tag stuff, no
> one is going to answer that email at all.)

Yep. I was checking that recently that stable@kernel.org can be used too.

> 
>> I have no problem with that rule but just want to understand where this
>> request is coming from.
> 
> No idea, I have no such rule, and in fact I use stable@kernel.org all
> the time for my subsystems.

It was more about that stable tag has to immediately follow fixed tag.

Thanks for confirmation.

Cheers,
Michal


