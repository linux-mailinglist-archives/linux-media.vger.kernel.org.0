Return-Path: <linux-media+bounces-39532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B35ECB22067
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:12:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A74353BB9F3
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:08:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF6932DFA46;
	Tue, 12 Aug 2025 08:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4o8v1b+J"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2070.outbound.protection.outlook.com [40.107.220.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449F5182B4;
	Tue, 12 Aug 2025 08:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754986108; cv=fail; b=ZFcoNdTBmzoMhWAVhpS9fJthM2MVoO2lr8TuLsZcaj83565rZlPrIh8ub5OSmxHyKfF08kAFPUnu/RbUhRfYTyPbNHM6IDtAuLvustx+xRgHVefREwE1i6podIs8Zd1HcG0oRma397erK9LN5PwgN+W1xM4OFFaWTqV4X5WgYP0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754986108; c=relaxed/simple;
	bh=6fzcg5bkIDOqU4/5q/T8ua9qn0BaU1yCJhRsRidjvGM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eA7U0yTMSpOxY+U4p7yp6P3DEZ7HIbOeXvjvbNGcCpn7HSWjrCZEFNO8fCZQ3/VZ3OaqNB0MaC6pYGEgwsCNg0eb+i84WouCaNIeleoN3oG+uGxobpQTU1ULklOiZREzlaEIIPsYy3fAR83sBhUs22QZ/OiasT5lqWVQeDeB9L4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4o8v1b+J; arc=fail smtp.client-ip=40.107.220.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4gLXqP+go6AgmcpXdiussjlQhtFmsr1Y73wx+j/O9SvaXd/nikJSSMvuWE5tRIR6g3qdoaXFKzjjewM7ZfS62GX7m8+xYETPxGG8wXr1MeiZN8CVXW3e1FCXjaei25a8bclPBb6HJDq1gosbDHpLhdR3NfvPwgX3WRkXte2xPNIbdNFEbTXG1sk4vu2jjDoeuaHdi5KZSMAG96bMrrVaPyjzb9g7B+V3x+9uojnn+Os7OwHbBU3xTrK8QmFPjKimH7/nxfUU0BLb0JVe4XXhXqEXzoCkfQMz2dx0cmqiko2VgtkQPBeANWSnJPxf0tw7SReK5to7wu4s7RuKW4mpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRHggZErhZ2Br5CSo3mTdGgL07e6XoRVR80mm60eb9Y=;
 b=joIZ5MU4H/inB0sg1G2uDrYNPoB85DQrMEB6TRgQY/xPt22F8JSwUButRWIi5fUTPZmR5InwIjkFuYXDcbyVJfCc1YpQv4zmmQH/8dRCYZzXYt87V5NJmKo/ScxMipYK3HAdnOh+ZZVgjQOuw/mZIsdQs72GF684pT0Xdv6T/utaydy52PiOJxSXIkzUdiHVV1f+lFbaMkzzgAuZ90J0QLWGEnQehtIHL0LtELy7RAWpDGBghdvNEw7vxAh9FI72tO/knS4TMkvDkNmQfDxfJ52k1mOGng/SUlufq16LZljegwcxeqy3Njg/fqhUPz12ieP5v2g8VI5MsFfHZ1Ph4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRHggZErhZ2Br5CSo3mTdGgL07e6XoRVR80mm60eb9Y=;
 b=4o8v1b+JrQG1bxKsCFrkI4e51Wji9pVTp42zfEGq48rAXosgt4WIMkXLPw2eJT6X9AiXI3NnveZly4/QW8dg8WHAGY26mRnMDfi+VLHSuDVaDbWPZHeXRA21O5ri4+Q3XGb/0MoPz5dr1rhwYz60wZGHDYx4ylKJpVC/6zxQ9vo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by SN7PR12MB7323.namprd12.prod.outlook.com (2603:10b6:806:29a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Tue, 12 Aug
 2025 08:08:22 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9009.016; Tue, 12 Aug 2025
 08:08:22 +0000
Message-ID: <d113f2bd-7771-47d3-90c7-116f21f6facc@amd.com>
Date: Tue, 12 Aug 2025 16:08:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] media: platform: amd: Add isp4 fw and hw interface
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
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
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250812073432.GF30054@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::21) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|SN7PR12MB7323:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b414ada-361c-463a-2005-08ddd977678b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SHRlaGZjVmRRUXh3eVZPQXEzdUpObVl0UnhpWWg3TlYwb0xkNnkxUmZFemtW?=
 =?utf-8?B?anNoNUt6YStwNjdGdHhneDFrQU5NRkJXbXlZNGU0cnNJMVVGYjJETTdkUHU2?=
 =?utf-8?B?b3RpVUNhaGZqM2lta0NUbCtSL1ZjTE5ML2ViVjEwY0d5TSsrU1lGQnFRc3Ra?=
 =?utf-8?B?NUdXeGdvZWZzaURpT1hpaEEyWUhqMmxzckVxOXB2TGgxM1JNMTRURkdRUGNY?=
 =?utf-8?B?L1ZZU1ZtaTNWenRDbXB1c0gxQlA2U1ZoNnJyRGVqRmZYWGZjdmhwaldvOWFL?=
 =?utf-8?B?b3JWTVlqY0FPVi95YzdKYjUvVlhMUk1RVzFPU051bkFRaWthZEZOTWc3NU94?=
 =?utf-8?B?RUNRdnpCbUh0WDQzZmwzV0hWL0tpanVDOVJFdzVnWlZncEV4VThBcXdFWFhO?=
 =?utf-8?B?THJubTQva05wb3UzWHdnYXh4ZWhFK012Y2p3YnhOSUJNTTl6SEMvTlhCbzZT?=
 =?utf-8?B?clZrZVExMnJRVE5ERWNMU3hnUXNyQ1YyeHFvOHd3Rm1IOXEyZ0EyZVlPYUFq?=
 =?utf-8?B?WTdtWXNaS2Yza0h2OW9CajFjYmhJZjNKdkJJSVR3bnhEQm9iU2I0MTYzZlRv?=
 =?utf-8?B?Z2hZckhLNEdVejBLVUEzbkQ0QXA3TmdLYWYzemkxZFlDOTJFNVBIZ3E3WS81?=
 =?utf-8?B?SXo2dTdJeWRFM2FLeFRMbnRMRVN1Vk14SGx3UTVISmhURmdwd3ZkYlZLNHJC?=
 =?utf-8?B?clpqMWNweTlaUDI2WGxoZ3YybG9ZOTQ4Zy9vNmw3dUQ3VWJudC9waWwraWxJ?=
 =?utf-8?B?YnRXc3dHVWFkemZiKzYxOWthOThCUVhtZmoyTTd5VGV3QjBzME9VSEZwWjBt?=
 =?utf-8?B?ck9IejgwcjhsekwwTjgrVk9GelFvemxhZERYa0doUWt4MGIwTjdnTnZvZnc2?=
 =?utf-8?B?WnZxMFdCdDZpTmZHUDlVWUVCbVllRHo2cjQyRUt5LzVDU0ZYT1pEVnVISDQr?=
 =?utf-8?B?eWFzZnVUQ3pRZm1HSnJFNUNacTZ0ZlhBcmhiKytWWVFhbGl6d2dUOFlCV3VN?=
 =?utf-8?B?ckE3eUROSGc2OHVSR1ZPSFJOUmUrQ1E4YlhCN29QZEtrcytaMFRScmFhZzN2?=
 =?utf-8?B?bDI4UEkxbHRXTDRqWlllNE5NRU9sRXQyeFhYQythVGZ6NmoyaWlOUjcrVTRC?=
 =?utf-8?B?ZFZhMWhrWmtLNnpiNVlNQTgweUJZV0pVTWgwUlFnZ0hBUzE4SWtEU2JrWEZ0?=
 =?utf-8?B?ZGU2MXRjdmNnWStBQ1pyeTQzdENvYVNkTzJIUE5yZm9sbVFWamROV01zMlE1?=
 =?utf-8?B?SERSYXp5bytDS2dsdmdWOGlWWE41c3JWMUFmbVV6QmZyYTB2bUkrZXVnR1NX?=
 =?utf-8?B?eTN1Wnh4VWFPeTdzN20weG1OdWRrZFJuSVQ2ZTRDVGlUT0RqNDFqZDNqVXU5?=
 =?utf-8?B?ZGZTYkRYYVhaWFNYOEpZWDJaRUsxaGRQNmt2TjFicmtZcEwwR3J0K3ZKaWJB?=
 =?utf-8?B?UEQ1LzN3M0VCek5CaHBMWC9GaDBZajlKL1ZmUCtOMVFxK3o4OTM1MG1DNjV6?=
 =?utf-8?B?ZUcxdVFmWkFMYXE2SWxNMDEwNE1MdVljV1FDVjlVdHAwZlVpTitFdXRPV250?=
 =?utf-8?B?QUFBTGFTaHdkQlF6VHpJUm51V1JOdThPcFRZb2krQ25ndVp2VEd4K3hFa04w?=
 =?utf-8?B?MFVGdVZnNUVvOXIrQmQzbzZLQ0xzT0hJb2VNOUlMckVlNmlDNml0V294OUNJ?=
 =?utf-8?B?UzIvV1pjaVhHc1hGeC9sVTZUZVVGeldDRGt6dUp1TzBYMWwxVVBMMG9TN3lw?=
 =?utf-8?B?b210czQ1NlQ3RmpIckpVK0wvZ3JLSUpTaVBkOTJhUlJydU9udTBrNytjSCtk?=
 =?utf-8?B?SmFkTGdWMHFVTGpobWVCZkpJNHNhdS9RNWk4NkFSaitNSi9uRlpsM0VLMDgv?=
 =?utf-8?B?bHNGUmZRYXRjelZjOUlZcU03WDBNMTBmTEoxVDY2K24xSHQxTHFibTlPWGxM?=
 =?utf-8?Q?wPA5/07svTg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Wmd1a0NSMTZGRFVqU1FFNE9iajhPK050R0J1aXQwZERCM1ZsN1V4SG12VTJu?=
 =?utf-8?B?bEdrR3RXL3MvWHdZcTFIaHJobTQ5TnROZzdnTWVOdVFXeXZiTFJvZzJheXFK?=
 =?utf-8?B?azhweDEwS09IV1BOOXVOZ3lobzVLdm42Qk5mQzJLK0piMXdidXZzU0hNYThB?=
 =?utf-8?B?ckgvQzd3ZWhsNlE4TWxNQkEwY0dhTUtRc0JtbmV3alQxOTZER055MVBUZEtR?=
 =?utf-8?B?Sm5JYlorVW9MeGVkSHpuQmw2ZlZ2VElYUVRnUXpPbHNZSHkzaHpBc2NudGF6?=
 =?utf-8?B?cFRxTTlzeGNOcE00Lzd3TVFEUXVBNENCRUtwVW05Rm1rbGYwZnEzL2FTdVU2?=
 =?utf-8?B?T3cxR2Nvd1JReXBxMDlYek96T3VISERVS29DWGszdWptN3JPQnJmY2JlM2NI?=
 =?utf-8?B?SWlNelYvOWZlelorR2tqVzF3Ulk5NndLTFhFMGVPSDZsR01Zd29pNmlqTGJR?=
 =?utf-8?B?MDZnbDRsTEhaaVBjaVBpak9qM3RPMXZIZ0RIU2JMMTlzWEYyd2I2L3pIdVJQ?=
 =?utf-8?B?ZkQzMDB3ZWNPc0lwQ2hGdzF4eDdPbFpTeWQycnFjQ3JsYW84eVB3TG1BaDFG?=
 =?utf-8?B?ekx3ZTNBanhhb3BNYzFWSDJmOG5IYUVpcUFEd2FmT3g5MzM0K0pmcTJ2VEJH?=
 =?utf-8?B?TVYxUWwySTRrT29JSVF1L2U5TXdwbU9zK0dSM2wyNzUvb1IrZ0dwdHppWmlX?=
 =?utf-8?B?aDhoSCthNDNRUUNLV1g5cnkvWGZFZ2lrWS9PRVM2MVREQ2lIOVFDdmJFR3Jx?=
 =?utf-8?B?alZOY21SZG03OU4xdUhNeU5mMXMwVGxlN3poMktGb0R6NnNPaXpVTkNVWUlJ?=
 =?utf-8?B?aTV3dE1QRjdteVdkNG5ZLzU0SEJrZ1NVd1RwWTVjT1hNcnZqOXNocHRHb25h?=
 =?utf-8?B?ZW1EN21ya01HSTRCc1VHajBFT3BrM2ZzZFMwYUozNGMxZkxGSFhhd1VCbVJL?=
 =?utf-8?B?YUZKdHZaQ0RsaEtSU2YyTm5YQUtDQVZuSkt2YUhmNHRqT1RCYlBydElzRWlL?=
 =?utf-8?B?RUpYM0pzbmZiVU9ENDJlSCtTRWlYVCtiWDhJWFhOQXdVRVpHZFVyU1hoU2Fk?=
 =?utf-8?B?WGs4aFQrWkVITm1DZm1mcCtVOXJ2NHE5cFJZRjFKL1d1bzcvYTlGeG9ONzdh?=
 =?utf-8?B?N21ybG5kVEdMbEx4K0tUNkIyeG9JRnc1b0trZW9NRE1pUGxPMmJwbVBvVWl4?=
 =?utf-8?B?Sktrb1hZYUx1TGx5dFBvVDVxcHdiZHhJOWxkM3NvZ0pOZVJoVk41a0pVKy96?=
 =?utf-8?B?c2RmMm9GaVh4eVllL3JCbDcybEprTm1FelYyVC8yUEZRMHF1WGN4YmNtZnFJ?=
 =?utf-8?B?dWxxZXN3eWhtMDcxL2FEaHpaQ0pFU29rb3VQYk1wbVhTaDRiWnRCdkdmWDJn?=
 =?utf-8?B?MFUwVjNmK3g1NTlLTEFXL2QyWFhiTVhtUnFGakZ4aXNPU0NOZUQ4ZHl5QVp4?=
 =?utf-8?B?c21DbjlmbmdDcXJTNXhmZnhwK2xXVUhRakpqMG4vdTVVVWhpU01QdWlhTmtD?=
 =?utf-8?B?ZHQxMnd4UU5XWS9rMmJDNUhXdDNKQWNvS2dvWTJtOFVRekVsRkNCSzk4YU52?=
 =?utf-8?B?UHlpT0pBRmVjaFkvUHpsbk5EZU5YcVk5MlQrakFSNFloVjN4bC9tVkllYVQ2?=
 =?utf-8?B?MFlILzlEYjl0WEh1dERzenVvT2dvWU1URWVqTjBpeUtEbkI2UVBMSmdFMlVx?=
 =?utf-8?B?NWxTYS9TOUF1MDNMU2tUamJFdGRVSmtJdHI1aEExR1lXdVlPQnl1Uk9wM3hQ?=
 =?utf-8?B?WWFRZGN6eXBpek5IcTFjeTgycmR1NFpuNGx1aVhEbzVaMksxR0ZqVkJWdEZ2?=
 =?utf-8?B?SzROMVhzVXZzQTltMDA2WGpBd1RhZXNxZVZ0OTA5QWM3eXh0czVIRmYzRjE3?=
 =?utf-8?B?NHA5dDVNWnpMS29YRWROSnRDNFpVY2IrU2srRFlxT2UzM1R6a1lRVHRrZXpv?=
 =?utf-8?B?TERzNTA0c3U1VUFmNGp6bjNUMjE5a1hTcDFaMWZMV0FWc1IzdnpBYmhYY1Zl?=
 =?utf-8?B?Mk1FaGJCcTE1WWltZEJzNm4zVjhnVmgxTEo2TnlpMjhhaE9ad0lkKytCVDk3?=
 =?utf-8?B?QnQ1Q2I1NjJISFN1ME5HRzJMMi9zelVwTWpKS2VlSkMrRWtXelBoamxPOVdr?=
 =?utf-8?Q?jjsg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b414ada-361c-463a-2005-08ddd977678b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 08:08:22.1368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sQG7IriWofSnmvjtABVhGLeqTGU9hHu8g334TKedOvq99ZUW9ayhu3dCTQUfoGwX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7323

Many thanks Laurent Pinchart

On 8/12/2025 3:34 PM, Laurent Pinchart wrote:
> On Tue, Aug 12, 2025 at 11:36:23AM +0800, Du, Bin wrote:
>> Many thanks Laurent Pinchart for the comments.
>>
>> On 8/11/2025 8:31 PM, Laurent Pinchart wrote:
>>> On Mon, Aug 11, 2025 at 11:46:27AM +0000, Sakari Ailus wrote:
>>>> On Tue, Jul 29, 2025 at 05:12:03PM +0800, Du, Bin wrote:
>>>>> On 7/28/2025 3:23 PM, Sakari Ailus wrote:
>>>>>> On Wed, Jun 18, 2025 at 05:19:55PM +0800, Bin Du wrote:
>>>>>>> ISP firmware controls ISP HW pipeline using dedicated embedded processor
>>>>>>> called ccpu.
>>>>>>> The communication between ISP FW and driver is using commands and
>>>>>>> response messages sent through the ring buffer. Command buffers support
>>>>>>> either global setting that is not specific to the steam and support stream
>>>>>>> specific parameters. Response buffers contains ISP FW notification
>>>>>>> information such as frame buffer done and command done. IRQ is used for
>>>>>>> receiving response buffer from ISP firmware, which is handled in the main
>>>>>>> isp4 media device. ISP ccpu is booted up through the firmware loading
>>>>>>> helper function prior to stream start.
>>>>>>> Memory used for command buffer and response buffer needs to be allocated
>>>>>>> from amdgpu buffer manager because isp4 is a child device of amdgpu.
>>>>>>
>>>>>> Please rewrap this, some lines above are quite short.
>>>>>>
>>>>> Thanks, the line after the short line is supposed to be a new paragraph?
>>>>> Should we put all the description in one paragraph?
>>>>
>>>> One or more paragraphs work fine, but a new paragraph is separated from the
>>>> previous one by another newline.
>>>>
>>>> ...
>>>
>>> Paragraphs are defined as a block of text that convey one idea. They
>>> should be visually separated by a space. As we can't have fractional
>>> line spacing in plain text, paragraphs need to be separated by a blank
>>> line. This is a typography rule that maximizes readability. There should
>>> be no line break between sentences in a single paragraph.
>>>
>>> Whether you write commit messages, formal documentation or comments in
>>> code, typography is important to give the best experience to readers.
>>> After all, a block of text that wouldn't focus on the readers would have
>>> no reason to exist.
>>>
>>>
>>> Now compare the above with
>>>
>>>
>>> Paragraphs are defined as a block of text that convey one idea. They
>>> should be visually separated by a space.
>>> As we can't have fractional line spacing in plain text, paragraphs need
>>> to be separated by a blank line.
>>> This is a typography rule that maximizes readability. There should be no
>>> line break between sentences in a single paragraph. Whether you write
>>> commit messages, formal documentation or comments in code, typography is
>>> important to give the best experience to readers.
>>> After all, a block of text that wouldn't focus on the readers would have
>>> no reason to exist.
>>
>> Really appreciate the detailed guide, will follow it. May I summarize
>> like this? 1 Separate paragraphs by a blank line. 2 Don't add line break
>> between sentences in a single paragraph, an exception to this is commit
>> message, because of the 75-character patch check limit, line break can
>> be added, but it should at the 75-character limit boundary
> 
> When I wrote "line break", I meant breaking the line after a sentence,
> before the 75 columns limits. Text blocks should always be wrapped (at
> 75 columns in commit messages, or 80 in kernel code). What you should
> avoid is line breaks not related to the columns limit.
> 
> This is fine:
> 
> This paragraph has a long sentence that does not hold on a single line
> of 72 characters and therefore needs to be wrapped. There is no line
> break otherwise, for instance between the first and second sentence, or
> within a sentence.
> 
> This is not right:
> 
> This paragraph has a long sentence that does not hold on a single line
> of 72 characters and therefore needs to be wrapped.
> There is a line break between the first and second sentence,
> and also a line break in the second sentence, which are not fine.
> 

Really appreciate for your patient explanation and wonderful example, 
it's totally clear now.

>>>>>>> +	void *cpu_ptr;
>>>>>>> +	u64 gpu_addr;
>>>>>>> +	u32 ret;
>>>>>>> +
>>>>>>> +	dev = ispif->dev;
>>>>>>> +
>>>>>>> +	if (!mem_size)
>>>>>>> +		return NULL;
>>>>>>> +
>>>>>>> +	mem_info = kzalloc(sizeof(*mem_info), GFP_KERNEL);
>>>>>>> +	if (!mem_info)
>>>>>>> +		return NULL;
>>>>>>> +
>>>>>>> +	adev = (struct amdgpu_device *)ispif->adev;
>>>>>>
>>>>>> Why the cast?
>>>>>>
>>>>>> adev isn't a great name here as it's usually used for struct acpi_devices.
>>>>>>
>>>>> In the next patch, will use new helper function for this and will no longer
>>>>> use amdgpu_device
>>>>
>>>> Use correct types when you can; either way this doesn't seem to be changed
>>>> by the further patches in the set.
>>>>
>>>> ...
>>>>
>>>>>>> +static int isp4if_gpu_mem_free(struct isp4_interface *ispif,
>>>>>>> +			       struct isp4if_gpu_mem_info *mem_info)
>>>>>>> +{
>>>>>>> +	struct device *dev = ispif->dev;
>>>>>>> +	struct amdgpu_bo *bo;
>>>>>>> +
>>>>>>> +	if (!mem_info) {
>>>>>>> +		dev_err(dev, "invalid mem_info\n");
>>>>>>> +		return -EINVAL;
>>>>>>> +	}
>>>>>>> +
>>>>>>> +	bo = (struct amdgpu_bo *)mem_info->mem_handle;
>>>>>>
>>>>>> Why do you need to cast here?
>>>>>>
>>>>> In the next patch, will use new helper function for this and will no longer
>>>>> use amdgpu_bo
>>>>
>>>> Not quite, on top of this patch number 6 adds more of the same.
>>>>
>>>> ...
>>>>
>>>>>>> +static struct isp4if_cmd_element *
>>>>>>> +isp4if_append_cmd_2_cmdq(struct isp4_interface *ispif,
>>>>>>> +			 struct isp4if_cmd_element *cmd_ele)
>>>>>>> +{
>>>>>>> +	struct isp4if_cmd_element *copy_command = NULL;
>>>>>>> +
>>>>>>> +	copy_command = kmalloc(sizeof(*copy_command), GFP_KERNEL);
>>>>>>> +	if (!copy_command)
>>>>>>> +		return NULL;
>>>>>>> +
>>>>>>> +	memcpy(copy_command, cmd_ele, sizeof(*copy_command));
>>>>>>
>>>>>> kmemdup()?
>>>>>>
>>>>> Kmemdup is to allocate memory and copy, can't be used here.
>>>>
>>>> Isn't that what you're doing above?
>>>>
>>>>>>> +
>>>>>>> +	guard(mutex)(&ispif->cmdq_mutex);
>>>>>>> +
>>>>>>> +	list_add_tail(&copy_command->list, &ispif->cmdq);
>>>>>>> +
>>>>>>> +	return copy_command;
>>>>>>> +}
> 

-- 
Regards,
Bin


