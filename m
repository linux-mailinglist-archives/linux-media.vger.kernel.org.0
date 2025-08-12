Return-Path: <linux-media+bounces-39569-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7E6B22403
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 12:05:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 025F4501FD1
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A59E2EACE8;
	Tue, 12 Aug 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kEilggSw"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2070.outbound.protection.outlook.com [40.107.237.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197C282D98;
	Tue, 12 Aug 2025 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754993097; cv=fail; b=gkC2v+z0thMwmXfoHUnxmm/syv1/0QWMyM3/Ttua9rV98zy5pauVswCIPux8+12du1sUezlAjWCeg6lk3yiuYcc13SGF5xjUMU0N1yJvDGZKUv//w4NpGzoyAPuvncL1sjH6khC5SH0gROs5mfIT2uHNuLkRf6aHQ+Gp2bZwGYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754993097; c=relaxed/simple;
	bh=HG0C3rhU84ChstpGkMWMJol5JFwy/J4OPeNa2aUgjQI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PyCsFAGEghcXje1fSD9mb/1tmyzlX9XTpmXFB2Vtr8Sor61uTYzrkyxoKJ+5KGv7UYEzt4XTA18fu9D8DTS28Z6C4XV6w8/ykEzllTYF5NTTCP5BcObJZUNCT2fkxp1kfX6M4/o+9+A5IonkhV3UG4wIenDkkdJIAiswqiMRLNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kEilggSw; arc=fail smtp.client-ip=40.107.237.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cowUnsLGq8SdP2pwhthX6UkKTGQUsZpHIPnK6XwpLcl/9ir8CXgD/4Zm/qgkNN4PmnxgS/JlpPGcgtt9JC2iw5t0XYKr2NA54te3yUKfa0Y1z/S/9Lar/+d1X5U0l+1Os+F8a67RcRjJbRyTswCskgNB1chl+hkZGixkRlV8+RtsjG41Tp3YkZoDzuCigB3qCA4HKCWIdbNN+dwRAh7XXLEKJgpxEeALILrDmwNDtUGlyms19TpwQ+whv7PMJC0b07/pFRV7r/hUkSUyP+0kWR5tuf6DQYvexiTNjb6FqC2RUQAA6AGHJpvIAkgzU/HKxQH93+H+8sVGEsSNH3b11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0wYjhMosTVKwenAMly2kpVrmOQFBDEHKQYO1nklSGs=;
 b=RNi4zB6es7SJNE6+eAOI6A6EBKfSnSViTu/A8BZmXuJt/HUAHUKGfd25PH1Nfqoe3wdhYsCfsroXhRrgMFM1lMUXd5flatRn8oIfNbNv1LEprB8CUSrG6Z4x/lS7w5522MYd5NeoUnhC9Sz3LCkcSRTXIOonOgcAUd00vpFXEMzLIqsgayHnWi4t6cMoARL2p/cnmPz2B++jKKSOxkQX+QV5PmS6NkMFq+6+yPeLzqMc3TntcnOl2r3ERLLHgomEsjm4eqA4lDSEvfz8nSrRS7dUh2zhCJkhUMECVaKqxDh6liwLBa0DuYCkML8wTzKNCF/5qed8L0rBxUEmG5WltA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0wYjhMosTVKwenAMly2kpVrmOQFBDEHKQYO1nklSGs=;
 b=kEilggSw1J4ZBFWh3tD+a6yAyi4ExbSOpAncJmIwPYWWn2XmeEZrIVrvHWhjHnPLsIK7Z94GzpB0/6i6hcMfQgYDjN9a3pX/e7ICT7IP0gqK1bo3Qs9tAHdQARsBkttcxfQdK+SkW7Bjlpbp6QAiwCn7fXk6v7/xLg/qi3szYIo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by CH3PR12MB8404.namprd12.prod.outlook.com (2603:10b6:610:12d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Tue, 12 Aug
 2025 10:04:52 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9009.016; Tue, 12 Aug 2025
 10:04:51 +0000
Message-ID: <b94236b7-3a56-45f8-a085-9ca661b0f43c@amd.com>
Date: Tue, 12 Aug 2025 18:04:41 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>, Richard.Gong@amd.com,
 anson.tsao@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-5-Bin.Du@amd.com>
 <aIclcwRep3F_z7PF@kekkonen.localdomain>
 <b033bf6c-c824-4f6d-8025-b6542ea8f35f@amd.com>
 <aJnYE2Z7F-PK1VHL@kekkonen.localdomain>
 <20250811123102.GC30760@pendragon.ideasonboard.com>
 <50f0958b-5234-4a89-a57e-5d330cca13af@amd.com>
 <20250812073432.GF30054@pendragon.ideasonboard.com>
 <aJr5RuD1lxnVBmed@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aJr5RuD1lxnVBmed@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0211.apcprd04.prod.outlook.com
 (2603:1096:4:187::19) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|CH3PR12MB8404:EE_
X-MS-Office365-Filtering-Correlation-Id: 182faeef-21b7-4338-9955-08ddd987ad5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHIzbVd2bXcydE02dTgwZU1PTHVqRDdHR1FhUXdxSVd1Z0NMS1lwWkl6amVk?=
 =?utf-8?B?Mmk5cC9XOEMzOXBJaUp4Q25seVJyQ2NMdjNXRnFiNkhMT1YzOXdoY0hzQ0lF?=
 =?utf-8?B?S3hFOGgyRm9wcjJ0d0hZY2dGNzM3QmhXN01Cb0p0bGhyOXlvcDY1dEdDM1F0?=
 =?utf-8?B?eVZiKzhOaDBUN0hrNFpnRlZCQy8wczRqS2NPN1pvem1ZdTl2KzkrOTRJVkd3?=
 =?utf-8?B?WkFqQnJCekRwdG93K2hocUFDNHFYNnlBWUlXbTNETkpmSGdWR2FUTVJWaDk4?=
 =?utf-8?B?RkFMelZrNmcvbno5S1FKQVFYd1Y0ZE9hSTA5Z2NPYXhRRjUyZExGN0JWeUpo?=
 =?utf-8?B?bjV2TkJiSEI1OUJUK3VHYW5scHMya0xSRkVkZTUxN2wvdlJ2cWpadGxCWjRw?=
 =?utf-8?B?b3J1R1R1OFBSUDBIVEU3NWlkRS9ZUERwa294Q3QwM01BYU4zVm42aW9jUEZw?=
 =?utf-8?B?cVY5cGF0UWNEcVNjZ2VMU0VJOHFWVWhvTWliS05zNzFQTjBzaG1VTzBqZW1p?=
 =?utf-8?B?ejBNY0UvOENpVEd2b1gwMk16RmdtZWlWamdCakdiVHl1NEwvSGoxejE0aTcx?=
 =?utf-8?B?c2k5Zm0zbGJOamJya3FFMk5Pb3NPb3ZROVIrWFRsTWFqeVV2Nm5veWx3VVhx?=
 =?utf-8?B?SWxHWmlRd2JRQzFJVUFCU3d0OHZ5d1l0LzlHS3VNaFJtWWtMVzRNTTYza1Yw?=
 =?utf-8?B?bVdDdGM1QXdDK1lCcURkc0dIbHAySUg3RCtoczRhU3M1dkJiRTVCQy8rUGd6?=
 =?utf-8?B?THNJUi9pRXlJNVkwVUx6a3AxemZkT1hQbXdlbkN6S2phem1BQmMwcVJiZERT?=
 =?utf-8?B?V0JjelMvUmI3SWFDeHM4cnhvV3RBSDM0R3FxZ3FJOTFlRmoxSXRRQzJDcHV4?=
 =?utf-8?B?YkwyS1U1Z0xYWWZ4NHozQktYd1k5QkcyOFhvaFF2QTFiWllVRkFxWmZmRUUy?=
 =?utf-8?B?cTNmcmx5MkNUZXloWjJYS01GZVltTHJBdlBPVVRnVVNZTTJYZG9USUNjclpN?=
 =?utf-8?B?ZzRqWWQyeXd0MDd6WE1SS2FzZWhGQmd2c0s5VjJ4bjRsa2hKZFZ0S3A0UTlE?=
 =?utf-8?B?dmtUR09PQzNGcG55c0VITjBhYnNMK29LRCtYc1NTR1Q1SVJLZzZkY2l0b3Rj?=
 =?utf-8?B?SVY0aVdPQktQY1pEOGFJejZJUVpwYnJUajRUVm5XUDUrdkh2eEM5QUVnQUcr?=
 =?utf-8?B?STczcWo0WjNSQWlyZkRVQ0xWTG1nM0JiekpnR0VILytQYzRKc3JvRnZ1Wlps?=
 =?utf-8?B?S2tLUXlFcFBZSDZDeXV6anJvbHlXazJxQjhYN1NCMlo3M3ZIWWdWd3FoaGFY?=
 =?utf-8?B?MlpwN2tMK3NRdjJaNFl3YWtCcVF5WVhjbXNQbjAyWFNUUjJnYWVSekFFaDlF?=
 =?utf-8?B?L0dNNXp0aU45L0hXTnJhUFhWSXZLcGE4OHVkUm5ldFpLdmRFcFczSklqdS9V?=
 =?utf-8?B?dGdnMWRPVTRLbTlRWHpQajJEczBPd2kwemV5byt6VUFacW44M2xaU0JaeXBE?=
 =?utf-8?B?dE5id2FPTWRSdnNSWkhTOHNrRjBSSE00Y0xTbEh0SEZnV1owS0dqRkRMaVg0?=
 =?utf-8?B?dWlZTjlIL3gzRitYcXM1Y3BLdlQrbnFRdmVFOGRqYVQ3dXp5dVkwTzdBL1E2?=
 =?utf-8?B?cTR4UTdzREFNSjBSaWFqclIyMmdHTUVUU1pJdCthWHd0RFdBRzRYcXRGNW1x?=
 =?utf-8?B?cVFsSHVCdlNNUWI0UUxWV3RjRzdmVFozbklmRlpXY1JlZXVIOGIyTk5CT1E5?=
 =?utf-8?B?NnB3ZC80aHh5ay9tTG1rOW01L2w3Z1BsN1RoRmZCdFR0cHdrdVorU2pqMDRE?=
 =?utf-8?B?bGtZSGpuVzBqRURhMGM0c1NXcVd2TTJTUzZEZ3B6Tk9XMXRPTy9zRTNSVjdq?=
 =?utf-8?B?RGRzRS9xeWpzeXVmaFBDa3JqOUgxbFArSWlCWDVJYk9EOHpqSUtDOVRWNmJ6?=
 =?utf-8?Q?cJhP2wDxhIo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmRuTWtIWXZ4NytIMy8yeE16RWIwUEd0VzdiWkRra0d1Uk5jUGw5blRtRVli?=
 =?utf-8?B?bzREL0pxRzBpRXRQcVZtV0g0dlhDRnppTlZlYjk0enp5MzE5MXZVR1pneEll?=
 =?utf-8?B?NXVhUDZIZVNJRFVheW01VnBEaGNSelZLZHIxTThpVmFrb04wanRKSGsweHpv?=
 =?utf-8?B?dTkrV0Rpa3N0UitqWFg5NnJMditVSHBROVp4V0JTSzMxRmxTaHpONjR1MlRP?=
 =?utf-8?B?emdtUUVGZ2R5SmVhR1pjUjNXUWlzdGhsYXBVL2NLd3BNMzlOWXBvbWdvNCtF?=
 =?utf-8?B?RzJuVHJIV1docXpmbEFYSTdVa2JET1FQWVpZQWxWSjE4OURhVk4vS2xRZTZH?=
 =?utf-8?B?d0RpVjlSTEVBVFFvdnhEQnUzSXM3MHYrUG1sYjU4cTZGUEN3YjkxcFRKVEVs?=
 =?utf-8?B?WjhqVEs3UFBod3BobVh5Q0w5WmJ4RFFwZ0FDQWFydys1YXlvcUoxOGNZUFdD?=
 =?utf-8?B?aEI5UXAvMmErUFpVK24xR1Avd3FkMHJjWWhpZWJnMUtSVmZWQ09qT1NrL0l0?=
 =?utf-8?B?dWJYMW0yK1hjeEtKN0RuYnc2RFdhZkhabXpvR0NnSjA0ZmxmNjFWRUpQNHFP?=
 =?utf-8?B?eWZzVFpMRDBoSmNZWHlScEdCSkw1eGNkeTNDYTJHR0N2R2lTMis3a0d4WGZN?=
 =?utf-8?B?VDE0RUQ4bC9ZdHlWWnBSNEJnSlJBVEhEcWxhaU1OWlJIUUQzR3h4Nml6MXlK?=
 =?utf-8?B?LzlSK3dFa282RlRIUllhalo3TWRVbFVHNWFLQXBvejdNT3loaUhTcVYyMmpV?=
 =?utf-8?B?QThtRGIzMVVnSk1taUlHNEZ1ZUFHcWRJeDRCSE9xTVRFVHBlK1IxbXp0d1RY?=
 =?utf-8?B?NEM4UVQ4ZThTaGdSMVBKb3hzbVZWZEFBNklINEtnRlVXN0cvbUROVjBweCtw?=
 =?utf-8?B?SG5tRkxta3Q4cTdsMExrdkNoVXFMWFNkTzRIMW9PQ3RpakdCZHF6eFhjLzkz?=
 =?utf-8?B?ellRbkwxTnU1TkprNGFxcnZ4cnJOOTZBVlA5Z2JsQnEyWWJsUFMzV1I2dWth?=
 =?utf-8?B?RVZzaCtXZVBnTXQxeldpdndIeWFBQm1oZnZNeFJmMk52Y3RzQmQ2bVNRL1F4?=
 =?utf-8?B?bjVqZ08xamgrRGgyTnkvRVhhck8wNTNWUzR2d0NaakkzTENVOWhnWFNCNmdJ?=
 =?utf-8?B?aDhpek9XczV6cGh2c3dDdXV3YnA0K1MvVlFjVjg2Z29xcmgxcGV1d1NWN3Zw?=
 =?utf-8?B?Y0tvRk84RTJPdHlyNW90QVRWaVN5R2NYaTZpTDRCaWtGNnJmVTdRNncyMHNz?=
 =?utf-8?B?NkVYTHoxYUZ6b0JEVWR0UHIxU1JHcUVCdVVzRy9sWWhNem4rRnJVM0sxRkVZ?=
 =?utf-8?B?RGFNOFBPUFhVaGEvamFHR3l5SnlKQk5IOVQvUncvREFqeDU2VGVkKzRkbVhQ?=
 =?utf-8?B?aTBwTGNCajBpbTRJWndqbVY2N0FUb3hLTEdSOTJSQVZvSWREN0t4M1J0UW5M?=
 =?utf-8?B?TTVxczRQQ0pxNGRSb3NwYUlZS2t1dnlsSCtrUHN5VGJRWnpSeE9Gazg2ZHZF?=
 =?utf-8?B?NWdvTUxDb2Y4cU16ZEdTVTlwUTA4YmVmMmkzZmw5Rzc4dFZ3YUtodzluL2tz?=
 =?utf-8?B?L0xoUmZUK0pURzV2c0h3dVVZYnRYVnJxQXF5MWRNRUtlUkFsS3Z1VHc2VUw1?=
 =?utf-8?B?Ry9BQ1YwRXNPVGg0dWYydEVlV080VlA1TW5wdjlJRmE5ZGxJK2loMEZBZWtM?=
 =?utf-8?B?NmRQV2duT0R2MmdYNUZ6TEpYd3JjSVpTcWs1T2JxblBGTU8wS21qS3pFRFlX?=
 =?utf-8?B?cHI3alhyMkdYbjY1NGUxUXBEbk5OS0ZmMnpVTmhmTlhrNUNZRG4zY2pCQ1Fj?=
 =?utf-8?B?N1JkRzVSZ3hXTDJNT0YwaDJKTks1WXA2MnhHWG4va0ZDcFFHQU5yb1FBdmVV?=
 =?utf-8?B?ek1CVUEvQ3pwQXAwZnhWRXZWU1F0S1JFdFZpSzZnZlZZTmtvd2U4YkxncjM1?=
 =?utf-8?B?MkxId1RpbnZEbkVTYUJkbkMycWhCVFZSMEM3Nk9HVE9hR3hpVExBbis3di9q?=
 =?utf-8?B?RXpnT1FaWmFhVHFndGM2T0tsQmErWEdPZkNmaFVXaE9GejBQMnFhOXZYb1RR?=
 =?utf-8?B?SG90bE96NTBlblViNUpTZElzUHJiQ3hSUlp4OUNYTHN2NUNCMHlPRWxlWmJQ?=
 =?utf-8?Q?1tFY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 182faeef-21b7-4338-9955-08ddd987ad5a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 10:04:51.2100
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkho8IkW9jwZ7kwSNFzYFi5W3ILdGkk5+oqOszdB0hGeKnlvB8Nd6XWRRHqBhIdu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8404

Hi Sakari Ailus,

On 8/12/2025 4:20 PM, Sakari Ailus wrote:
> Hi Laurent, Bin,
> 
> On Tue, Aug 12, 2025 at 10:34:32AM +0300, Laurent Pinchart wrote:
>> On Tue, Aug 12, 2025 at 11:36:23AM +0800, Du, Bin wrote:
>>> Many thanks Laurent Pinchart for the comments.
>>>
>>> On 8/11/2025 8:31 PM, Laurent Pinchart wrote:
>>>> On Mon, Aug 11, 2025 at 11:46:27AM +0000, Sakari Ailus wrote:
>>>>> On Tue, Jul 29, 2025 at 05:12:03PM +0800, Du, Bin wrote:
>>>>>> On 7/28/2025 3:23 PM, Sakari Ailus wrote:
>>>>>>> On Wed, Jun 18, 2025 at 05:19:55PM +0800, Bin Du wrote:
>>>>>>>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
>>>>>>>> called ccpu.
>>>>>>>> The communication between ISP FW and driver is using commands and
>>>>>>>> response messages sent through the ring buffer. Command buffers support
>>>>>>>> either global setting that is not specific to the steam and support stream
>>>>>>>> specific parameters. Response buffers contains ISP FW notification
>>>>>>>> information such as frame buffer done and command done. IRQ is used for
>>>>>>>> receiving response buffer from ISP firmware, which is handled in the main
>>>>>>>> isp4 media device. ISP ccpu is booted up through the firmware loading
>>>>>>>> helper function prior to stream start.
>>>>>>>> Memory used for command buffer and response buffer needs to be allocated
>>>>>>>> from amdgpu buffer manager because isp4 is a child device of amdgpu.
>>>>>>>
>>>>>>> Please rewrap this, some lines above are quite short.
>>>>>>>
>>>>>> Thanks, the line after the short line is supposed to be a new paragraph?
>>>>>> Should we put all the description in one paragraph?
>>>>>
>>>>> One or more paragraphs work fine, but a new paragraph is separated from the
>>>>> previous one by another newline.
>>>>>
>>>>> ...
>>>>
>>>> Paragraphs are defined as a block of text that convey one idea. They
>>>> should be visually separated by a space. As we can't have fractional
>>>> line spacing in plain text, paragraphs need to be separated by a blank
>>>> line. This is a typography rule that maximizes readability. There should
>>>> be no line break between sentences in a single paragraph.
>>>>
>>>> Whether you write commit messages, formal documentation or comments in
>>>> code, typography is important to give the best experience to readers.
>>>> After all, a block of text that wouldn't focus on the readers would have
>>>> no reason to exist.
>>>>
>>>>
>>>> Now compare the above with
>>>>
>>>>
>>>> Paragraphs are defined as a block of text that convey one idea. They
>>>> should be visually separated by a space.
>>>> As we can't have fractional line spacing in plain text, paragraphs need
>>>> to be separated by a blank line.
>>>> This is a typography rule that maximizes readability. There should be no
>>>> line break between sentences in a single paragraph. Whether you write
>>>> commit messages, formal documentation or comments in code, typography is
>>>> important to give the best experience to readers.
>>>> After all, a block of text that wouldn't focus on the readers would have
>>>> no reason to exist.
>>>
>>> Really appreciate the detailed guide, will follow it. May I summarize
>>> like this? 1 Separate paragraphs by a blank line. 2 Don't add line break
>>> between sentences in a single paragraph, an exception to this is commit
>>> message, because of the 75-character patch check limit, line break can
>>> be added, but it should at the 75-character limit boundary
>>
>> When I wrote "line break", I meant breaking the line after a sentence,
>> before the 75 columns limits. Text blocks should always be wrapped (at
>> 75 columns in commit messages, or 80 in kernel code). What you should
>> avoid is line breaks not related to the columns limit.
>>
>> This is fine:
>>
>> This paragraph has a long sentence that does not hold on a single line
>> of 72 characters and therefore needs to be wrapped. There is no line
>> break otherwise, for instance between the first and second sentence, or
>> within a sentence.
>>
>> This is not right:
>>
>> This paragraph has a long sentence that does not hold on a single line
>> of 72 characters and therefore needs to be wrapped.
>> There is a line break between the first and second sentence,
>> and also a line break in the second sentence, which are not fine.
> 
> I wonder if this should make it to kernel documentation. I've come across
> many new developers recently who would definitely benefit from this.
> 

Yes, totally agree, furthermore, if checkpatch script can be 
strengthened to add this kind of check, developers can even find and fix 
them before submit the patches

> Also, most editors can rewrap paragraphs of text (e.g. Emacs M-q or Joe C-k
> C-j).
> 

-- 
Regards,
Bin


