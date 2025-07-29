Return-Path: <linux-media+bounces-38624-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B9019B14BFF
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 12:14:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79E6F7A4CA4
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 10:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57ED8288C3A;
	Tue, 29 Jul 2025 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oDFyHHo3"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9EE286897;
	Tue, 29 Jul 2025 10:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753784043; cv=fail; b=jf8LTtRxYi6nRIN8x8DigPOy6hCviJ003fxeUluSXUuVljVvMz/x6WmHSxU1QDyN0CLzZ0ljEtBQYBXOkmXDjo7NqGc/jDhuJiyFgV+1gVanxrF2+BY2DiFM855bbe9WYlAoaCmJbbvVBBkhA82e6y4thSd58x/BlLEYApW4Has=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753784043; c=relaxed/simple;
	bh=L5kYnlTpeW+vU/JUxf8VbQpbRFvSYq65gbgTaNK66vI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UdJH/gudLOqoDZpksNqUql1UPTjpI2xDLu8C0Ejbz6roiPacUBnBVhS59rbXYZeJnjDQJ0rRnp/Ep36R0fsxxBI0bV5dO7tU2tM/Uj9AOtwzecm76dIKhnvX2Bv4vrrRqOSkr4xh2c5scEP11dZY5qoUnK8YywAew8JvLbVWaLQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oDFyHHo3; arc=fail smtp.client-ip=40.107.92.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAl2wLPfIwZx3oLzrSZi9XiDOdLeCmHjhxWq4hodms3NYQafA613Fl/KyuXAma3zfZKYItWxQNUM0ZDk2CyvKPk0auv+gqZ5nMs3I2RxVbJg9Mj0IvcG2nGDZb5w2Wg2bnxDGxMFvTG9/HT/fA9zSluTI/3RT6IZRgPpdr832lQvNteQAdSsL1S7mqC47Pwq1s1n+i/ifhtQVWxbNkA8uf+PQ35ut90vHDqZdgAD1yZ6HZfH9ke+2DNm74ZRnr7U5czSVNMSK75fNZIX5O8rWajClc0aNZae3uZgFtSNSsbpXzhZCbwIrqxbacbh/STkB+xZHbfR6n5TH06tcO3yxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RmWSMoeap8MCNnrmUNRQSaMtafmy0BgtkThne1lkUSE=;
 b=Hv++EWP1JmHHBYToJKGqnuQYzfeVv9dPYxOjnwV2+IK3S6tzzKbTYGrLOnKz7oUvFIKcvhpK4SwH1YJufJbSBpBCC1icU1gTDFv20b27GqglFzm7E1AjtqSRJQ6/fL1SWmI8eVOZSWsRw76RKCLloWIf4XC/6KEX00ZUzWcmtBYxCWmJdeYnDHpwCreZhqFUtTkXt7uCuttjl5NejwyEHjb+ccmTBuqwp1pgM4Zp1l+XgsEJ6rGTT2uf98OX4F36LGcz6rYctDO/uXx/y+PRug4kgjie098/a3QOX6L3muppKFuO8bFswhjOpu56Qo8lrj+BZxpjKtoNt0w8y0afGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RmWSMoeap8MCNnrmUNRQSaMtafmy0BgtkThne1lkUSE=;
 b=oDFyHHo3zOtT6Lnkp8YWZtcTvHS5iokeWrMLMMCULz8+JZa7dZEAG28qLhcL10GosghEEM+2wf38zyzaKLlyu3N5J8ji/5LLeX7/rSaxX9aQoH99cNdOODx7RZgFInsBM4QiQaXjJRGI3bZ/FYuVP0wjnUL2R3r/xLykAWppjEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB7795.namprd12.prod.outlook.com (2603:10b6:510:278::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Tue, 29 Jul
 2025 10:13:59 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 10:13:58 +0000
Message-ID: <751e9265-889f-4fbf-acf8-7374311a6b6f@amd.com>
Date: Tue, 29 Jul 2025 18:13:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Add AMD ISP4 driver
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <aIEmJXNpNN0QF233@sultan-box> <12fb4d09-6b94-4f54-86b8-8a3ac0949151@amd.com>
 <aIVXVpg_9XxRXUAH@sultan-box> <b02d0749-6ecb-4e69-818a-6268f894464d@amd.com>
 <aIh7WB0TGNU15Zm1@sultan-box> <aIh8JPTv9Z5lphRQ@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIh8JPTv9Z5lphRQ@sultan-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0032.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::18) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: a31c59a8-e3ee-40f9-e79c-08ddce88a21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S1h2NUtLaWZYNm5Qdml1NFNLTm5yZm9kTEZaN0d3YWp4NCtUcHowMFV4Q3hP?=
 =?utf-8?B?OEkyTHcxTWZ5ZG9NMTdtRWhwdUVCV0tIclEwWmY1TWVVUkk2b3hGNGZqNm5P?=
 =?utf-8?B?cGtjeWV6VjZLUTZLMStEeHJpaU9QOFRkUThPQ0NjVmIvSDY0ekI5K3N1K0tx?=
 =?utf-8?B?WnozQnVFaFdjTTJqZENlelpRclZjMnpJSkZWU3BLMHR4L2ZOUWNyTnFRV3FL?=
 =?utf-8?B?S2E0OWhYU1dsL2oxcDVZdjRwVkpsUVNnOStoRExPLzBGMkY1aTA4akY1Q2lM?=
 =?utf-8?B?R2d3QTFHQ04wZ3FsUkVlZHFnZk50ZVE0N1dHazRsdE9LbEZudHJ3SStwenBF?=
 =?utf-8?B?M1BYVXBhZUltVnd2NXNhYUpuTUdmV0lkUUJPdCtDbjBGWnNRc3ZiUFkyOUVu?=
 =?utf-8?B?bTJIUVBzdzV4SzhpU1RUSVpOdHpWc05vejVGbU1sYlRRN2JXNEhyN2RsK3pY?=
 =?utf-8?B?UkpyTUljTWc3STAzU1puWXpKb3ZPTHhYS3AxSm5BemJ4eEZuMnY5ZXhqZGtE?=
 =?utf-8?B?K1ppNEVkWUV0MmNRZ3drd1psMDAyem85T2N1QWE5emNydnBmbWdQdUhZRlph?=
 =?utf-8?B?SWx4aVdJUnlTcTRnUGNJYnd3bWZRSHo2YWV0N1UyRzF1eXJyekEraWJGbUlp?=
 =?utf-8?B?U3drQVAva09LN1dlblkxNTVoQWpTNDdjckNheXF0cWdYcnNxWUo0b09sTjYx?=
 =?utf-8?B?R3QwbC90cjBIb0IzdzJTVEVMNCtoUjNUYmhaMmk2QXFLcDF3Y0R4eC84L1cz?=
 =?utf-8?B?aisvRThlTXN0dmtwYjZWemprZjdhWVlCQTVUOW4yT3luMXFjVHo4U0NaUzBv?=
 =?utf-8?B?MlU2bHdxQUNLdDlWZlk5V1l4ck9tVDdjMWZwc20zMjJrd3pCcEhOeHE0NnU3?=
 =?utf-8?B?dDFhTk92akJiZjlPcU54T0FXb2pZM3YrZWlWTElQUFVROWpoWHEzTW5QS2Rt?=
 =?utf-8?B?SHRRNHh5NFlHaStCdTJYRWZQcFoxdVdOM2NqbThWTHA2QUU3N2wxOEtWeVJE?=
 =?utf-8?B?Z1pzaWVBV3NSbktucWdZSzVZbm1SSEZ4NXpGZG9YY1pKcTBmVllDWVVNOWRa?=
 =?utf-8?B?VUJtNUNPZmRDYUljQmExRTk5UW9PRDNvN1kxVVR1RzRFZndQOURCVmtlYlk5?=
 =?utf-8?B?U0RTeTJzS21BNXpZZVdEL3YwMFhpRitibCtMZFg3RDlTYWNCWHJBMDQzdlBI?=
 =?utf-8?B?bmtXYXI1RTZVSHBFQmpxWm5LZ2N0N25vU2FudzlOeHQ2cVZoSjJDMkhsSHJy?=
 =?utf-8?B?U0twUEhjR0pLV0hkMW1yMkNTWHA3SWZleVF1R2g1MGRnWWlieWRrSUlFZndB?=
 =?utf-8?B?ekJ3M1B6UUxPM2xwRk82WTlSUXNtZFZkdndRUkVENjZla3NMZ0N0TnhjNEdv?=
 =?utf-8?B?eE95cEdQS0RTNEgwQTc3TDRmek9Od0F3Vzh5RmVyaDhKRG12N0tBclNTZTJ2?=
 =?utf-8?B?eVZjRUI1ZUJPa1VrWWdjL2FDaG9McGZMUE4rUjU4Z0hIUjc0aEFxQ1N3RURk?=
 =?utf-8?B?WlBRcU5aWkdaeVRBTnlqektScldsNGUxNmFXN1FMQVM0NWpQeVVXVk53TXVj?=
 =?utf-8?B?dGZhaXlVc281cVNUWGFWSk93Slk0LzRjRWtZeEhKMk5iMjlOQUg1cU51L2I3?=
 =?utf-8?B?QUhnRnhKTGpmL2U0MkIvQ2tzRnhOZ0JSYTRjR1djMldFOXArdnJranVuSlRk?=
 =?utf-8?B?d0FIZ2YvMjlKVnZZNWU1emNpU09JL1gxc2lIS2tJYUVqL0RZUnY4NDJqS0FD?=
 =?utf-8?B?NWtrZ1NpT0t5T1JxVW41TzlLRWZzRTVxT2h4RWxQcFlpeFBOYVlCM0NlY01q?=
 =?utf-8?B?SUFhVkhlaEFldHpIZWtqbWovUXZMQ0M3dnFhV2xPbEZFUlNKOXJpSFkvamFl?=
 =?utf-8?B?b2pjVEpTWWI5dFYwdnE4Wnlja0hBQmt5cEs0Sk8zS3c3ZVpkZkxlRGVuYmY1?=
 =?utf-8?Q?sV6sZbrWF0c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWFuNVBCeHZIT1drWXIwbkJzSURNT2JrTHJsYmRIdEVEQ2pDZWRxM1pEYVBC?=
 =?utf-8?B?RHkrMU1yQzlESEowL1EyaUYvN29BbDlzZ1p1OW1acXB2RlpqbTMwcjJYd3Y3?=
 =?utf-8?B?M2oya0UyQ3Jod3FGYk9vQjBmZ2trejVacTVucE5lczlaMDhJajZ0UzI3MDBa?=
 =?utf-8?B?Q0ZkbGpIbDlYRS8wcDUwckpWb1ZTYy9nT2xuSGE4cjd5RjZnakkrZUh0UHBh?=
 =?utf-8?B?VlNpUzFWL3pGc2hkY1ZaeHNWSVRVYTNtRXFvZ1dnVWQ2aS9paVFRVjlpMzlV?=
 =?utf-8?B?VldzbkZIZ3p1RXVreHp5MGZhOUV0RFRNd2VpYlpma0dhVm03VXB0QTBFUkFa?=
 =?utf-8?B?cnJXc0dlSjlaSFlTd3VLV1NhQVBKOFNkTXllTUptak1VVUFVdjdYL2svWWNS?=
 =?utf-8?B?M2JaMG5lc1NlWlRpZElTMk5LSkxqWm1zQVBmQ01RaVhPK0lRR3VpdDhsWHJV?=
 =?utf-8?B?eUNZZ29Bckd5MFpseEtVQWpYUWNBb2lnY3FOdmE4UWhNZzVpSHJVbE9GUFpp?=
 =?utf-8?B?YlovSndiRjZFRm5HdUN0Tzh2QWxHeWxKS1kwWU9FeEQ3b3d5Y2NtU1Jua1ZB?=
 =?utf-8?B?QVhhMld5a2M0T0huMWN0RTVvc01Wd2RxdVhsaEhmc0g3YnFCeDJLZ1JPd2FL?=
 =?utf-8?B?VXZlUUMzSGZycXRvTlFqbVJuTGpzWFhKK3pzZVdMVlhmZUJveU9lalJLTUt2?=
 =?utf-8?B?K2hRMHRYUXBsZ21RU3lOa0tCY21lUUNDRks0M3R5RWlyMmdwL1g0czMxcnNC?=
 =?utf-8?B?djd4aUdMcTFqTkZHQ3ZSbjc2OENuZ0RyWWxuL2twTzZkUTVIZU93Nk56RUMx?=
 =?utf-8?B?bDNMR3BIck1YenMxUlkvNnVVUCt3djFBMTJIc3FmaVJ0MjFOMVZEM1p1WkNz?=
 =?utf-8?B?Q0E3U05CQzRhekk0YkhVQUNNUjd1WksxZ0c3MHpaOUMzanhDLzl0WUlzSTZ2?=
 =?utf-8?B?S3NpQ3d1SXVYV1ExVStNRDhzUUhxM0ZMZ3hhOE4zeUhNTnFHak5QajFFbHBL?=
 =?utf-8?B?djJ5MnV6TEN4bHJiTUNZWm02UWNLSW5maGNJTm5RdE5pemdodVZUdFpKa2hJ?=
 =?utf-8?B?WVF5K3FJc25hRGQ1bUdMRlpJU0dIY1lMdDVJM2F5YnN0M0h5ZTJUY3RkQzBF?=
 =?utf-8?B?b2ZBYnNWSHFYOUM2OHFlZlJ0alR3UDgxV2hIT2JvYjRiNjdJSHNVUDZTcXRP?=
 =?utf-8?B?MWJ6VUN6cUFEb0Nnc1BmWWlhSHRoZSt5amV6RzJQd253OTI1aXpvWXd3ck8v?=
 =?utf-8?B?ZmNvbG5sS0JxWWJwdmpIczJ4M2xWR1lFamJocmF3bGNmUFN3VkVnV29lQkg3?=
 =?utf-8?B?VmZNYitlWUN0Ly8ybXlVOE40M3RVVzNtWGRVN2lxQ2Uyc0Vsa05pZ3RDUEJO?=
 =?utf-8?B?cS9wRm9iTFFMZU1Semk3NUNwTHNQbHJNVGFEckM4bHUxVDNubGdZcHdWUkxx?=
 =?utf-8?B?ekNxYzZvMUsyNzBPTVRMQmVodDdoZ0VRVDlEai9vWkpPMFZoZ0tnRmNQR3lU?=
 =?utf-8?B?OFpUUVYwQTFMVXEzS3IwOGQ0SWFpVmhXSjRHVTdFaVFPanYyOEtWN2tYbnhW?=
 =?utf-8?B?c1VDYklXdXZzc2V2bVNETm1ZYlg5U0FDdVp1R2Zub0dnN0pnMWJ2OUVnem1z?=
 =?utf-8?B?WUxkTDhMQm9IQ1lVZGZsK21LV1NZODhQUWJnbDBMcXpmMXRnMk1SckRMeG5R?=
 =?utf-8?B?ZnMvQ0FIRW5KK3RlcUNZcXZRVnZZT0d1RmdObUdsRkg2dDlvbVBtZXM3SjlW?=
 =?utf-8?B?TzNoaEpnbG1nT05rSEhjdk1JMmtaKzZaQ3g0NnlJYlUzZTJTb0s5RjlRVURy?=
 =?utf-8?B?WTVYOTlvc01xemtiZHJDRWw3bFQzODZiNkl0bkZLelhTeGNrdnoxaGJPdTBx?=
 =?utf-8?B?REpZdHZWTjhuZW52QzJuRzFPQzdJejRsV3BFTjR2ZE5nOExkWXlBUWpRQTlS?=
 =?utf-8?B?SXNpMGp5b2J1UW1EaitTOTNrSzBpak1vSm9iVllPQVM0ZHMxSUFmUFFUZnRF?=
 =?utf-8?B?bTUrak45ZndNR1RxSnZBa3cvTFdCWkJqcllSYXBOMmZaYlFXSmhIWFJ5bHhB?=
 =?utf-8?B?WXlDeld5aWpIdEJRSk0yaC80Y200OU1LNzdWV2VXWHZJb2lKcFZ0NE13cVdi?=
 =?utf-8?Q?Nr+4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a31c59a8-e3ee-40f9-e79c-08ddce88a21b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 10:13:58.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FV5LZtbQifRV/PLa7LTDn0KjkUX1t/Evz8ziRXZ7c8y5ey3dBLLjLOQOkvF4Geny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7795

Thanks Sultan, yes, seems much close to the final success. Will have 
some internal discussion.

On 7/29/2025 3:45 PM, Sultan Alsawaf wrote:
> On Tue, Jul 29, 2025 at 12:42:16AM -0700, Sultan Alsawaf wrote:
>> On Tue, Jul 29, 2025 at 11:32:23AM +0800, Du, Bin wrote:
>>> Thanks Sultan, please see my comments
>>>
>>> On 7/27/2025 6:31 AM, Sultan Alsawaf wrote:
>>>> On Fri, Jul 25, 2025 at 06:22:03PM +0800, Du, Bin wrote:
>>>>>> I have the Ryzen AI MAX+ 395 SKU of the HP ZBook Ultra G1a 14.
>>>>>>
>>>>>> I cannot for the life of me get the webcam working under Linux. The webcam works
>>>>>> under Windows so it's not a hardware issue.
>>>>>>
>>>>>> With this patchset and all of the patches you link here applied to 6.15, I get
>>>>>> the following errors:
>>>>>>      [   11.970038] amd_isp_i2c_designware amd_isp_i2c_designware: Unknown Synopsys component type: 0xffffffff
>>>>>>      [   11.973162] amd_isp_i2c_designware amd_isp_i2c_designware: error -19: i2c_dw_probe failed
>>>>>>
>>>>>> With the old ispkernel code from February [1] applied on 6.15, the webcam
>>>>>> indicator LED lights up but there's no image. I see these messages at boot:
>>>>>>      [    9.449005] amd_isp_capture amd_isp_capture.1.auto: amdgpu: AMD ISP v4l2 device registered
>>>>>>      [    9.489005] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: The OV05 sensor device is added to the ISP I2C bus
>>>>>>      [    9.529012] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>>>>>>      [    9.554046] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>>>>      [    9.554174] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout while trying to abort current transfer
>>>>>>      [    9.580022] amd_isp_i2c_designware amd_isp_i2c_designware.2.auto: timeout in disabling adapter
>>>>>>
>>>>>> And then the kernel crashes due to the same use-after-free issues I pointed out
>>>>>> in my other email [2].
>>>>>>
>>>>>> Any idea what's going on?
>>>>>>
>>>>>> [1] https://github.com/amd/Linux_ISP_Kernel/commit/c6d42584fbd0aa42cc91ecf16dc5c4f3dfea0bb4
>>>>>> [2] https://lore.kernel.org/r/aIEiJL83pOYO8lUJ@sultan-box
>>>>> Hi Sultan,
>>>>>
>>>>> [1] is for kernel 6.8, believe it can't be applied to 6.15. We didn't verify
>>>>> on 6.15 but we are really glad to help, would you please provide some info,
>>>>> 1. Suppose you are using Ubuntu, right? What's the version?
>>>>> 2. 6.15, do you mean https://github.com/torvalds/linux/tree/v6.15 ?
>>>>>
>>>>> After your confirmation, we'll see what we can do to enable your camera
>>>>> quickly and easily
>>>>>
>>>>> Regards,
>>>>> Bin
>>>>
>>>> Thank you, Bin!
>>>>
>>>> 1. I'm using Arch Linux with the ISP4-patched libcamera [1].
>>>> 2. Yes, here is my kernel source [2].
>>>>
>>>> I have some more findings:
>>>>
>>>> Currently, the first blocking issue is that the I2C adapter fails to initialize.
>>>> This is because the ISP tile isn't powered on.
>>>>
>>>> I noticed that in the old version of amd_isp_i2c_designware [3], there were
>>>> calls to isp_power_set(), which is available in the old ISP4 sources [4].
>>>> Without isp_power_set(), the I2C adapter always fails to initialize for me.
>>>>
>>>> How is the ISP tile supposed to get powered on in the current ISP4 code?
>>>>
>>> You are correct, yes, i believe the I2C adapter failure is caused by ISP not
>>> being powered up. Currently in latest code, isp_power_set is no longer
>>> available, instead, we implemented genPD for ISP in amdgpu
>>> https://lore.kernel.org/all/20250618221923.3944751-1-pratap.nirujogi@amd.com/
>>> Both amd_isp_i2c and amd_isp_capture are in the power domain and use the
>>> standard runtime PM API to do the power control
>>
>> Thanks for that link, I found it along with another patch on the list to make
>> the fwnode work ("drm/amd/amdgpu: Initialize swnode for ISP MFD device").
>>
>>>> Also, I noticed that the driver init ordering matters between all of the drivers
>>>> needed for the ISP4 camera. In particular, amd_isp_i2c_designware and amd_isp4
>>>> must be initialized before amd_capture, otherwise amd_capture will fail to find
>>>> the fwnode properties for the OV05C10 device attached to the I2C bus.
>>>>
>>>> But there is no driver init ordering enforced, which also caused some issues for
>>>> me until I figured it out. Maybe probe deferral (-EPROBE_DEFER) should be used
>>>> to ensure each driver waits for its dependencies to init first?
>>>>
>>> amd_isp_capture only has dependency on amd_isp4 which is the ACPI platform
>>> driver, it is init before amd_isp_catpure.
>>> Do you see in your side the amd_capture probe failure caused by failing to
>>> read fwnode properties? If that's the case please help to check if amd_isp4
>>> is loaded successfully
>>
>> I got much further now: there aren't any driver initialization errors, but when
>> I open the camera, there's no image. The camera LED turns on so it's active.
>>
>> And then shortly afterwards, amdgpu dies and the entire system freezes.
>>
>> I've attached my full dmesg, please let me know what you think. Thanks!
> 
> I almost forgot, here is my current kernel tree:
> https://github.com/kerneltoast/kernel_x86_laptop/tree/v6.16-sultan-isp4
> 
> Sultan


