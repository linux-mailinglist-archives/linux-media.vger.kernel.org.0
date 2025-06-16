Return-Path: <linux-media+bounces-35014-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF132ADBDCD
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 01:46:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E2E5189168E
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 23:46:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9804C2264CA;
	Mon, 16 Jun 2025 23:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bMRFt7g/"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C63220F58;
	Mon, 16 Jun 2025 23:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750117592; cv=fail; b=kA78NJUPP0qhTTqWlKROuiFBrECMoQs0A1gwgvoa0DyuXJZjbgrWD+o6BdZc0bueedlAXSOrUTqwB4QOAlQR7Td4FCpd3l4NXFS6/ayzFs2hl92pzVFr1/XMyWaSInr7J7HaKx3DR8HPE7JqTEPT4Q5jm8ao41NPj+eJdwAVPbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750117592; c=relaxed/simple;
	bh=xDeP0s9rASE1MUmVqyMz/46r2fZeGu3Y03FkfB3R90M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LpZ8wRcCcS5GZ/KTDBM4teELjCTcABBrczTNOZkeK6LqO8c5NfTyQhd9NeqkDlD3occ5ufsXOvSQKWcQrn0vrGbACr3/aD29SD/JLBykBLz3gsTCgtRakmo8shWAKj6lgt/KT8m6RPaOa6MYPYx8tpLRJ1faEYDBVlQjarQV5HM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bMRFt7g/; arc=fail smtp.client-ip=40.107.243.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLzyrr47xGgFDMmFZNGGQbOoC/zOaBZ56/JA2iSpG1w9k92Nd8aoFJWZYVXE5pyesEG6zJ+HVW/kP5taT+Sh2IlgpdhKpHcVILbVgIoS0fD8UbB1jPS+d40OJIAJkTq/qVPotjhzpyGsi8uUNg3SCIBGdMb/fEKYIQ8lw34Es+zIGLuDCp6fLqSK/a5v9nVtTlhppWZ9/5nh3KT4C8poXbD1Irrbb2IRCNrPc3mbunxFDFk2hqwsseSp1ZdJWbqWpAoW7OQfSkb2jH2in2LOT4oD01WKxyX5MX/G/Biis4EGClc+ZJ5LIRzggpzZon16D3S1q8oXLBWA4QLCbPZVMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m+Mu8m+l6ngwKTbiKv/rXKaX9GQMSrVeEhApXOyHA5o=;
 b=OCvrqvjJIzTSFvzM7UrkE+UIrNXesi8ScjjEWhh2qZwC/LbIQjollMitoJHRZI1cnVd68k8QAIPJjm47B8qgCbCVwlx6+MNePUZyV1Ncx08iasbbMD0d8idxKoLUHn9sc+hiAQnVCTTPRA4l8aknWS0B3ZWorpSpB75DPKibzfcV2tbCx4GXkgyVVR3OUBbRes1m5AsPf5lXziuSVFfC6FmT19/yKmfyCAZCp5b3o92Q9UwU9+TK+O//hNOgC6LurKSRqWGIVFsKe2v/n9mbETinuPLdPXpHrN3LtjNW2g3Wa698pWuQWTzRGJwWUaQxDorWTzmeVGd1lYseODN0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+Mu8m+l6ngwKTbiKv/rXKaX9GQMSrVeEhApXOyHA5o=;
 b=bMRFt7g/akzhg1NUOtnzNAglAR0igkwkJGRRbBp92TntchpDShiIDoHF9tR+maeL4ZdupUsU9clwdE/TrESTblOkzBN1GTWHADioi0dMxaRKlJUCQT7UyOm719vkaL3Jx/1JSrtYkdKb5GYSueNodbHfRty0XFysnNmnIqm5OpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 23:46:27 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 23:46:27 +0000
Message-ID: <152051eb-7faa-4ff7-8e4f-14a12ff7c8cb@amd.com>
Date: Mon, 16 Jun 2025 19:46:25 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 sakari.ailus@linux.intel.com
Cc: mchehab@kernel.org, laurent.pinchart@ideasonboard.com,
 hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
 dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <174981257597.425770.15369432320575770694@ping.linuxembedded.co.uk>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <174981257597.425770.15369432320575770694@ping.linuxembedded.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8P220CA0040.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:47::10) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d34aa1-0cec-4db0-7e95-08ddad3002ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?emIyUnBtcytjTkZlQW44ajBmRFRhMnZ4aTlBc0cxQkcwZEw4ZUg5Z254QXlC?=
 =?utf-8?B?VWhQVzJaa3pweEhYTU4wcnpWaW8xeDgyckVNZnpnVFRlTWt1NitMc3U5NTcw?=
 =?utf-8?B?TGNkTnZKMTluRHJHWCtZdmVaM3IvQ3pyQTFUZVczMko4aDNXWjhCKzMzQ09U?=
 =?utf-8?B?RzNBWGVoeEtERHBPdnFWenQ1N3B1YXJzaTQ0SDQ3ZkhnZXlranZuaDY2aUhn?=
 =?utf-8?B?a0RGbHVsRk4xb1RPZmVvYUhQSUhzU0Z4YWpqWVdQTDdPNEkrcldKdzJxenl4?=
 =?utf-8?B?Rno2S1RHb0Nzem1jcEEyOUZvRGlNWmNaanF0YWtQeXRzTjU3cUl1amFPNGNX?=
 =?utf-8?B?NWF5WjJkbThmcUwzMXRablRXOXJFTTk5aUdhMnpQSEpFZXZEV09zNHdRV1NU?=
 =?utf-8?B?aUJmTmVxTHhzc3BCa2NIZEs0N0Znek9ZN3Q1c1F2cXl6aU5CT2t2RU1HaGJK?=
 =?utf-8?B?Wkh3c0dPcUxmby9OaWdOaTFMcGkvb3A4anJZOTVNYXVRODB4cURmdzN4R3Bp?=
 =?utf-8?B?QnJsRURZRTRINzREcGo2a0x5emxnbyt3RHluTEJnMXkrOCswaXZFUUhySDEy?=
 =?utf-8?B?dnE4dGVvK1FvTTIrcU1XQmRGMkJGZ0JxWk5XL1hoTmJHb1ErNFNBMDhvMzVQ?=
 =?utf-8?B?Q2NINm1DT3hXczg4TlJDWW5TbXJQQ3Jpc3hMQkp2Y0ZjRG1iRFJvZzZMUE1F?=
 =?utf-8?B?NGF6ejdhZU4xUmtUTFpBVW1hRXNaVDFYMUxlNlZOQ1pmUDdTMVNBM1FjVTJY?=
 =?utf-8?B?ZzNkNEZvWXhtRDhJbUlpbW1vQzhTMTA3QWtRLzM4RXo2VHFwSFgzTHdJcFQv?=
 =?utf-8?B?V29xa3pWQmpsZ2o4SGlZM2pHMWFjWmRKNHRVMUVlVWZNNGI3aXhqSGM2a3cz?=
 =?utf-8?B?ckVDQ3diL09xeDF4NjIrSEdMV1lDdWFHeElPc2ROWnJ3ZlIzbWp6NHRLa1FF?=
 =?utf-8?B?U0tsMGh3R3NsOWxqV25qV0pGL1BlNk1BRS8rQlRNbFlGQ3krREJ1NHJMOEVO?=
 =?utf-8?B?VmR1eWlNejk4aHZzcU9LcGNjc3pZTEdMUEdob1FoTmoyaU1wemlBNTBocitH?=
 =?utf-8?B?ZCtEMTdpN0Q3SjNscU5aTjAwWElnQWF3ZjdiM3cvMUluUmhzSlc1cGxabGVt?=
 =?utf-8?B?YmVEaDZNRERoQUd5Uzhlb1luOVBUNFQ1bGx5ZC9XMTV2M2dodzdUOHFyVU9Z?=
 =?utf-8?B?TU02MjNadzlMbXh3aEJZWWREUWNLc0pEZHk2SGUvQXM4Q05mUFpxRk9qekVk?=
 =?utf-8?B?NTVtdjg3ZmdHQm9ZVSt5Ky9lTFppRFBWSThqeC9GOW15NjR4VzdjQjV2dkRq?=
 =?utf-8?B?V1BWdXdvYUNXWnhKWFZ1SDg2bHdGM0t1UHVlTHY4ajkrTzcyQWRnbzljbCt2?=
 =?utf-8?B?SnJxbXVjK1ZLRGRNSDFrb21OYTI3K3o1bVprMXQ2Q3hWWDMrbmZidGs1TGg4?=
 =?utf-8?B?aUllV2c5bjY1Y1ZNelI2aXhQaEFvSklCaDZ6MCtQdkdUZlYzWGw5dFRDUEtV?=
 =?utf-8?B?RiszOWlOSXRPVkZNRkpvcEJWSnBEVUt0aWFWSWJnQllaNGcveitpV1NHTGNl?=
 =?utf-8?B?SlREeGo3UDI2YmMydUk4V3dCalJtMGluY09FQmtsdDBMQlNMMXY2NjBsMXg0?=
 =?utf-8?B?Ti8yUStaZTdQWjJ6MjFITGhEZU9jWGtBNlBMNHU0YVVoSEtLR3BzOERtMEl0?=
 =?utf-8?B?UzI1Mlh1QUNrZVI0VitCSlQzTCt6UEpvdndtaGVNRHdJSndYY0ZLODRTU2VC?=
 =?utf-8?B?T3RrSXlRb3ZOZ0Nqd2dtdi9kcFFIUWU1WVh5OHhZNzNjZDlDeHFyUmJzSWVq?=
 =?utf-8?B?NDkwdTBUQmUwU0thSVlzR3JGd3JWSWk0bU5HeklpYXdRK1lycXRpQ2VtbGZ6?=
 =?utf-8?Q?g9YrF5FLvO8X7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUVyL3ZWOWtUOVZ4ZkFjSXk3WWJhRW5PVFlYckkwTkJ6RnpHKzdNVU04bFdR?=
 =?utf-8?B?aUhPS2dkdngzODJ6dnZWb3pJNm1KbFZrNTlQWVljK1R3RElxMDE1MldIajlr?=
 =?utf-8?B?RGJ6a1B5VzZJK3E3ZkUrS2xUZzNlbDFGRDRKNFJibk5zMUw2Y2l2T2FzSDBI?=
 =?utf-8?B?a3EzcC8xeFg2eHlSZk1lSGJsU3Q0M1ZYMTRzeXpGaTI0dlFDMkdUN09OaEM0?=
 =?utf-8?B?WHIrK2ZRdGoxZSs3WWpWa2tuWTMzVnlpT3pTZmRNeHpQZ0ZQQ253YVdjWGdu?=
 =?utf-8?B?VHlaVy9ZRzVqQzZKODYxdjAwOE1yeW9STzVhTm95VXhVV2s5aStGMlJtaGYz?=
 =?utf-8?B?V2x5WG9ya0w1Y1pVVTBwTEVSSWQ0MzhUbEZzWWVKQklpK2JRNnNkeDl2U2RR?=
 =?utf-8?B?OGIxVURWRGcrWVdsOGRhY2lZQWtUSG5Ka2UrdnZvZ2xnRGZxZ3FseXcrUDBK?=
 =?utf-8?B?UVBERldKNU5vbm9OSjZvMmdRUitkNit2SFRXbU9lTVMzTVlWMGkzb1oxMHZ2?=
 =?utf-8?B?RzB0dnR5b2ZzZWlSc1pkUVlHbHNSUWc1Z29TNlM1bHd6Z0JRWnNuc0REdTZ6?=
 =?utf-8?B?eC81aDlGOEJXbFN1elkwcC81dTVrcUNxeTQza2draUgva1ZJdWFRNGp5K29B?=
 =?utf-8?B?cnBudVl4ZEFJV3g0aytVVGkrbnFIVlBBaEFkZFJTQlI3TU11UTA3czVGUVJu?=
 =?utf-8?B?MUR2VEh3VHBIRlN2MU5XUFIvVFdpNDBLUG1zQllUZjkyblJNSEE0WG92VFRN?=
 =?utf-8?B?b3ZPSVZBUWlpSlVHOUg5NGcxcXdTRTNhVGVnemtDUGdUTmpBVzNXVlQ1NkJU?=
 =?utf-8?B?Zjc0T0h6TjkwOVhVVU0rakZNOFo3Wkk5WWpBTkFCTStTd1B1ZU9RYmJ6cFEw?=
 =?utf-8?B?TTY4SlZUSks3Q2RIZDBYaU9Tb2ZBYXdKTVpjd1lGTC9sdlBZUkt5UVQzajV5?=
 =?utf-8?B?RnZtZjhwb1MzWEk4UkhkTDZWd2FPV2xIYnlXNENkTjZ1ZlMrVU1OOHpNd3Nz?=
 =?utf-8?B?UnZZaERsU05jd1VKeUpuMjJTQVltZ2xaNk42dEVvMS80U3k0RWtON241dDhl?=
 =?utf-8?B?dllHMHNsYnZwSDdMVUdhT3ZMbkpxamsvdzE1UGJLOHpGMWlyVGd6RlR4dUxs?=
 =?utf-8?B?ays2eUVNa2xveUlZeUFxVi9hV2pkMmZKUm5mRmc4RE41QzVkYTU0VlF6Qm16?=
 =?utf-8?B?c01YK1M4K2xoWWwvemxWQTQyZHRuRnQyUFJRMjB4c2RPVW9uRkwrUkhIMlk1?=
 =?utf-8?B?NkV4a2Z4MndQYm00MmZEVnB3QUdwSkZZcjJlMkkvaXJ2bjBNSHVXVHJ5dGRV?=
 =?utf-8?B?bGZWQlBpcU13Y0w1QmhqM3B5cDNwTFFCNlhkS1kxdWc5czFtTHRwbkJoYUcz?=
 =?utf-8?B?ZGZ6aENpZms0UVV3d2t6Mmc0bkNrMXpycktpd2ROME5Mb1BFNDdtVnI4OHNK?=
 =?utf-8?B?a2JocVk1WmtRN2UraDRmdjF6a0tYWGdCNFNVc3lBOFNvd2JDVjU3TC96ZVRV?=
 =?utf-8?B?MC9uMVdhVHpHSVRTT2hvOGtoZHhGTE9xNk4wWXltZ05JTnJoOHNTVVBxYnZi?=
 =?utf-8?B?RGo3K25MeG55R2xwY2hqbDI2YnhZMTNFdlozaDYyUTlJQlBuL2xWQWkxYVpD?=
 =?utf-8?B?aG1ZMVlNRWxjVHFNbC9LclFUdWNhcWZVaUYvTzV2dCsvZ252d1BLaWNVZVRl?=
 =?utf-8?B?T05vb3R6TzY3dWV3ZkJpZDlHVXlpQVlGbDEyQlN6eHo5amFzemZnWVBNMm8v?=
 =?utf-8?B?dDY1c3lmRTZTc2hTaXZxQVJRMkNhK0M1Mks2T0ZDL0hhOHlJRmFjMTBPeTlN?=
 =?utf-8?B?ZGVGWEhGMC9Yc1JWMm1Qbi9VdkJUZ1FUdUh3UEs0SnZGZmFGMFE4WkdvSUwy?=
 =?utf-8?B?L3FvS1QwOC9DWHlKdjNVSXpOMTRSdnFSUkdCUlVCRUQ5MGlLMWZzMG4vMmgy?=
 =?utf-8?B?RjJpdTI5dTYvb2FoL2VyRWlBVFdxTFEwUUFTZllTWlhickpWTHEzbW1vV0c2?=
 =?utf-8?B?MlA0Z24zbEN4bFNuMitFZkJiTlZrMndUbm96cFh5K2NrRDVhNHErNitTRUcr?=
 =?utf-8?B?bmtRdjVhbDc5RFlPUFRVUnM3TWhSR3BrZ0FmMU9WcEc4Wi9jQlBOY2xtc015?=
 =?utf-8?Q?cUek61332PIv1b9cpOdb1HGAt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d34aa1-0cec-4db0-7e95-08ddad3002ae
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 23:46:27.3341
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlFEXK4xtEiV01107N6gEgc4Znpkb7OW4DAyKjT2UupNwdKqACXYLcQDRx0PA7bTSdCs53KC5CBDzegWXilNSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

Hi Kieran,

Thank you for reviewing and sharing your feedback.

On 6/13/2025 7:02 AM, Kieran Bingham wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Quoting Hao Yao (2025-06-13 05:55:46)
>> Hi Pratap,
>>
>> Thanks for your patch.
>>
>> This patch is written for your camera sensor module, which seems very
>> different from those already applied on Dell laptops (some of "Dell Pro"
>> series). Looking into the driver, I think this version will break the
> 
> Have there been existing efforts from Intel to upstream support for that
> device?
> 
> Or is this simply the case that Intel have lost the race by not working
> towards upstream?
> 
> I see plenty of references to OV05C10 in the intel/ipu6 repositories on
> github - but that doesn't count as upstream here ...
> 
> Perhaps could Intel work to support the additional requirements on top
> of AMD's driver ?
> 
> 
> But having multiple devices use the same sensor driver is a good thing
> here.
> 
> I think it will highlight that werever possible - the code below should
> be factored out to support the different configuration requirements.
> Cleaning up the large tables of register addresses and making those
> configurable functions for example configuring the link rate
> independently would be really beneficial!
> 
> That's precisely why we continually push for reducing the large
> "undocumented register" tables in sensor drivers...
> 
Yes, I agree, it is best to have documented settings and make 
calculation for sensor modes instead of array of undocumented settings. 
However the usual practice is that we send requirements to sensor vendor 
and they provide us the settings array to be applied. May be we can try 
to move PLL settings to different array but it is not always just the 
PLL, there are a lot of undocumented settings which are in sync with PLL 
and sometimes changing the PLL may result in misbehaviour of the sensor...

We will try to move PLL settings to separate array but cannot guarantee 
changing these settings alone will make the sensor functional.

> 
> 
>> devices using ov05c10 sensor.
>>
>> I think this patch is better to be validated on existing devices, but
>> please do some fixes before we can do validation. Please check my
>> comments inline.
>>
>>
>> On 2025/6/10 03:42, Pratap Nirujogi wrote:
>>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
>>> supports only the full size normal 2888x1808@30fps 2-lane
>>> sensor profile.
>>>
>>> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>>> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>>> Co-developed-by: Bin Du <bin.du@amd.com>
>>> Signed-off-by: Bin Du <bin.du@amd.com>
>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>> ---
>>> Changes v2 -> v3:
>>>
>>> * Update "refclk" property variable as "clock-frequency".
>>> * Update sensor GPIO connector id name.
>>> * Fix sensor v4l2 compliance issue.
>>> * Fix license info.
>>> * Address review comments.
>>>
>>>    MAINTAINERS                 |    8 +
>>>    drivers/media/i2c/Kconfig   |   10 +
>>>    drivers/media/i2c/Makefile  |    1 +
>>>    drivers/media/i2c/ov05c10.c | 1061 +++++++++++++++++++++++++++++++++++
>>>    4 files changed, 1080 insertions(+)
>>>    create mode 100644 drivers/media/i2c/ov05c10.c
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index a92290fffa16..caca25d00bf2 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -18303,6 +18303,14 @@ T:   git git://linuxtv.org/media.git
>>>    F:  Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
>>>    F:  drivers/media/i2c/ov02e10.c
>>>
>>> +OMNIVISION OV05C10 SENSOR DRIVER
>>> +M:   Nirujogi Pratap <pratap.nirujogi@amd.com>
>>> +M:   Bin Du <bin.du@amd.com>
>>> +L:   linux-media@vger.kernel.org
>>> +S:   Maintained
>>> +T:   git git://linuxtv.org/media.git
>>> +F:   drivers/media/i2c/ov05c10.c
>>> +
>>>    OMNIVISION OV08D10 SENSOR DRIVER
>>>    M:  Jimmy Su <jimmy.su@intel.com>
>>>    L:  linux-media@vger.kernel.org
>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>> index e68202954a8f..1662fb29d75c 100644
>>> --- a/drivers/media/i2c/Kconfig
>>> +++ b/drivers/media/i2c/Kconfig
>>> @@ -377,6 +377,16 @@ config VIDEO_OV02C10
>>>          To compile this driver as a module, choose M here: the
>>>          module will be called ov02c10.
>>>
>>> +config VIDEO_OV05C10
>>> +     tristate "OmniVision OV05C10 sensor support"
>>> +     select V4L2_CCI_I2C
>>> +     help
>>> +       This is a Video4Linux2 sensor driver for the OmniVision
>>> +       OV05C10 camera.
>>> +
>>> +       To compile this driver as a module, choose M here: the
>>> +       module will be called OV05C10.
>>> +
>>>    config VIDEO_OV08D10
>>>            tristate "OmniVision OV08D10 sensor support"
>>>            help
>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>> index 5873d29433ee..b4a1d721a7f2 100644
>>> --- a/drivers/media/i2c/Makefile
>>> +++ b/drivers/media/i2c/Makefile
>>> @@ -85,6 +85,7 @@ obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>>    obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>>>    obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
>>>    obj-$(CONFIG_VIDEO_OV02E10) += ov02e10.o
>>> +obj-$(CONFIG_VIDEO_OV05C10) += ov05c10.o
>>>    obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
>>>    obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
>>>    obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
>>> diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
>>> new file mode 100644
>>> index 000000000000..9a1e493c4073
>>> --- /dev/null
>>> +++ b/drivers/media/i2c/ov05c10.c
>>> @@ -0,0 +1,1061 @@
>>> +// SPDX-License-Identifier: GPL-2.0+
>>> +// Copyright (C) 2025 Advanced Micro Devices, Inc.
>>> +
>>> +#include <linux/clk.h>
>>> +#include <linux/delay.h>
>>> +#include <linux/gpio.h>
>>> +#include <linux/i2c.h>
>>> +#include <linux/module.h>
>>> +#include <linux/pm_runtime.h>
>>> +#include <linux/units.h>
>>> +#include <media/v4l2-cci.h>
>>> +#include <media/v4l2-ctrls.h>
>>> +#include <media/v4l2-device.h>
>>> +#include <media/v4l2-fwnode.h>
>>> +
>>> +#define DRV_NAME                     "ov05c10"
>>> +#define OV05C10_REF_CLK                      (24 * HZ_PER_MHZ)
>>
>> Seems your module use 24 MHz clock input. The Dell's modules always use
>> 19.2MHz, which means your the PLL settings will not work on Dell's.
> 
> That sounds like a feature that Dell and Intel could work towards
> supporting ?
> 
> For instance, we made the Sony IMX283 support multiple input frequencies:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/i2c/imx283.c#n263
> 
> Of course it would be even better if we could always dynamically
> calculate the PLLs correctly based on the input clocks.
> 
> And if we can make the drivers more freely configurable instead of
> mode-based - then they would be more adaptable to the different platform
> configurations possible in different environments.
> 
Yes, I agree, we will work with the sensor vendor to get more details 
about PLL registers and configurations that can be dynamically 
calculated and configured based on the input clocks. We will experiment 
based on the feedback received from sensor vendor and will update if we 
can make progress.

>>
>>> +
>>> +#define MODE_WIDTH  2888
>>> +#define MODE_HEIGHT 1808
>>> +
>>> +#define PAGE_NUM_MASK                        0xff000000
>>> +#define PAGE_NUM_SHIFT                       24
>>> +#define REG_ADDR_MASK                        0x00ffffff
>>> +
>>> +#define OV05C10_SYSCTL_PAGE          (0 << PAGE_NUM_SHIFT)
>>> +#define OV05C10_CISCTL_PAGE          (1 << PAGE_NUM_SHIFT)
>>> +#define OV05C10_ISPCTL_PAGE          (4 << PAGE_NUM_SHIFT)
>>> +
>>> +/* Chip ID */
>>> +#define OV05C10_REG_CHIP_ID          (CCI_REG24(0x00) | OV05C10_SYSCTL_PAGE)
>>> +#define OV05C10_CHIP_ID                      0x43055610
>>> +
>>> +/* Control registers */
>>> +#define OV05C10_REG_TRIGGER          (CCI_REG8(0x01) | OV05C10_CISCTL_PAGE)
>>> +#define OV05C_REG_TRIGGER_START              BIT(0)
>>> +
>>> +/* Exposure control */
>>> +#define OV05C10_REG_EXPOSURE         (CCI_REG24(0x02) | OV05C10_CISCTL_PAGE)
>>> +#define OV05C10_EXPOSURE_MAX_MARGIN  33
>>> +#define OV05C10_EXPOSURE_MIN         4
>>> +#define OV05C10_EXPOSURE_STEP                1
>>> +#define OV05C10_EXPOSURE_DEFAULT     0x40
>>> +
>>> +/* V_TIMING internal */
>>> +#define OV05C10_REG_VTS                      (CCI_REG16(0x05) | OV05C10_CISCTL_PAGE)
>>> +#define OV05C10_VTS_30FPS            1860
>>> +#define OV05C10_VTS_MAX                      0x7fff
>>> +
>>> +/* Test Pattern Control */
>>> +#define OV05C10_REG_TEST_PATTERN     (CCI_REG8(0x12) | OV05C10_ISPCTL_PAGE)
>>> +#define OV05C10_TEST_PATTERN_ENABLE  BIT(0)
>>> +#define OV05C10_REG_TEST_PATTERN_CTL (CCI_REG8(0xf3) | OV05C10_ISPCTL_PAGE)
>>> +#define OV05C10_REG_TEST_PATTERN_XXX BIT(0)
>>> +
>>> +/* Digital gain control */
>>> +#define OV05C10_REG_DGTL_GAIN_H              (CCI_REG8(0x21) | OV05C10_CISCTL_PAGE)
>>> +#define OV05C10_REG_DGTL_GAIN_L              (CCI_REG8(0x22) | OV05C10_CISCTL_PAGE)
>>> +
>>> +#define OV05C10_DGTL_GAIN_MIN                0x40
>>> +#define OV05C10_DGTL_GAIN_MAX                0xff
>>> +#define OV05C10_DGTL_GAIN_DEFAULT    0x40
>>> +#define OV05C10_DGTL_GAIN_STEP               1
>>> +
>>> +#define OV05C10_DGTL_GAIN_L_MASK     0xff
>>> +#define OV05C10_DGTL_GAIN_H_SHIFT    8
>>> +#define OV05C10_DGTL_GAIN_H_MASK     0xff00
>>> +
>>> +/* Analog gain control */
>>> +#define OV05C10_REG_ANALOG_GAIN              (CCI_REG8(0x24) | OV05C10_CISCTL_PAGE)
>>> +#define OV05C10_ANA_GAIN_MIN         0x80
>>> +#define OV05C10_ANA_GAIN_MAX         0x07c0
>>> +#define OV05C10_ANA_GAIN_STEP                1
>>> +#define OV05C10_ANA_GAIN_DEFAULT     0x80
>>> +
>>> +/* H TIMING internal */
>>> +#define OV05C10_REG_HTS                      (CCI_REG16(0x37) | OV05C10_CISCTL_PAGE)
>>> +#define OV05C10_HTS_30FPS            0x0280
>>> +
>>> +/* Page selection */
>>> +#define OV05C10_REG_PAGE_CTL         CCI_REG8(0xfd)
>>> +
>>> +#define NUM_OF_PADS 1
>>> +
>>> +#define OV05C10_GET_PAGE_NUM(reg)    (((reg) & PAGE_NUM_MASK) >>\
>>> +                                      PAGE_NUM_SHIFT)
>>> +#define OV05C10_GET_REG_ADDR(reg)    ((reg) & REG_ADDR_MASK)
>>> +
>>> +enum {
>>> +     OV05C10_LINK_FREQ_900MHZ_INDEX,
>>> +};
>>> +
>>> +struct ov05c10_reg_list {
>>> +     u32 num_of_regs;
>>> +     const struct cci_reg_sequence *regs;
>>> +};
>>> +
>>> +/* Mode : resolution and related config&values */
>>> +struct ov05c10_mode {
>>> +     /* Frame width */
>>> +     u32 width;
>>> +     /* Frame height */
>>> +     u32 height;
>>> +     /* number of lanes */
>>> +     u32 lanes;
>>> +
>>> +     /* V-timing */
>>> +     u32 vts_def;
>>> +     u32 vts_min;
>>> +
>>> +     /* HTS */
>>> +     u32 hts;
>>> +
>>> +     /* Index of Link frequency config to be used */
>>> +     u32 link_freq_index;
>>> +
>>> +     /* Default register values */
>>> +     struct ov05c10_reg_list reg_list;
>>> +};
>>> +
>>> +static const s64 ov05c10_link_frequencies[] = {
>>> +     925 * HZ_PER_MHZ,
>>> +};
>>
>> Is it 900 MHz, or 925 MHz?
>>
>>> +
>>> +/* 2888x1808 30fps, 1800mbps, 2lane, 24mhz */
>>
>> Currently Dell's devices with ov05c10 use a CV chip to passthrough MIPI
>> CSI signals, but it supports max 750 MHz link frequency. That's why this
>> version:
>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov05c10.c
>> uses 480 MHz link frequency and a different resolution setting
>> (2800x1576). At least the setting in out-of-tree Github driver should be
>> merged into this version.
> 
> If Pratap doesn't have that device, can you work towards adding the
> support and testing?
> 
> 
> 
>>
>>> +static const struct cci_reg_sequence ov05c10_2888x1808_regs[] = {
>>> +     { CCI_REG8(0xfd),  0x00 },
>>> +     { CCI_REG8(0x20),  0x00 },
>>> +     { CCI_REG8(0xfd),  0x00 },
>>> +     { CCI_REG8(0x20),  0x0b },
>>> +     { CCI_REG8(0xc1),  0x09 },
>>> +     { CCI_REG8(0x21),  0x06 },
>>> +     { CCI_REG8(0x14),  0x78 },
>>> +     { CCI_REG8(0xe7),  0x03 },
>>> +     { CCI_REG8(0xe7),  0x00 },
>>> +     { CCI_REG8(0x21),  0x00 },
>>> +     { CCI_REG8(0xfd),  0x01 },
>>> +     { CCI_REG8(0x03),  0x00 },
>>> +     { CCI_REG8(0x04),  0x06 },
>>> +     { CCI_REG8(0x05),  0x07 },
>>> +     { CCI_REG8(0x06),  0x44 },
>>> +     { CCI_REG8(0x07),  0x08 },
>>> +     { CCI_REG8(0x1b),  0x01 },
>>> +     { CCI_REG8(0x24),  0xff },
>>> +     { CCI_REG8(0x32),  0x03 },
>>> +     { CCI_REG8(0x42),  0x5d },
>>> +     { CCI_REG8(0x43),  0x08 },
>>> +     { CCI_REG8(0x44),  0x81 },
>>> +     { CCI_REG8(0x46),  0x5f },
>>> +     { CCI_REG8(0x48),  0x18 },
>>> +     { CCI_REG8(0x49),  0x04 },
>>> +     { CCI_REG8(0x5c),  0x18 },
>>> +     { CCI_REG8(0x5e),  0x13 },
>>> +     { CCI_REG8(0x70),  0x15 },
>>> +     { CCI_REG8(0x77),  0x35 },
>>> +     { CCI_REG8(0x79),  0x00 },
>>> +     { CCI_REG8(0x7b),  0x08 },
>>> +     { CCI_REG8(0x7d),  0x08 },
>>> +     { CCI_REG8(0x7e),  0x08 },
>>> +     { CCI_REG8(0x7f),  0x08 },
>>> +     { CCI_REG8(0x90),  0x37 },
>>> +     { CCI_REG8(0x91),  0x05 },
>>> +     { CCI_REG8(0x92),  0x18 },
>>> +     { CCI_REG8(0x93),  0x27 },
>>> +     { CCI_REG8(0x94),  0x05 },
>>> +     { CCI_REG8(0x95),  0x38 },
>>> +     { CCI_REG8(0x9b),  0x00 },
>>> +     { CCI_REG8(0x9c),  0x06 },
>>> +     { CCI_REG8(0x9d),  0x28 },
>>> +     { CCI_REG8(0x9e),  0x06 },
>>> +     { CCI_REG8(0xb2),  0x0f },
>>> +     { CCI_REG8(0xb3),  0x29 },
>>> +     { CCI_REG8(0xbf),  0x3c },
>>> +     { CCI_REG8(0xc2),  0x04 },
>>> +     { CCI_REG8(0xc4),  0x00 },
>>> +     { CCI_REG8(0xca),  0x20 },
>>> +     { CCI_REG8(0xcb),  0x20 },
>>> +     { CCI_REG8(0xcc),  0x28 },
>>> +     { CCI_REG8(0xcd),  0x28 },
>>> +     { CCI_REG8(0xce),  0x20 },
>>> +     { CCI_REG8(0xcf),  0x20 },
>>> +     { CCI_REG8(0xd0),  0x2a },
>>> +     { CCI_REG8(0xd1),  0x2a },
>>> +     { CCI_REG8(0xfd),  0x0f },
>>> +     { CCI_REG8(0x00),  0x00 },
>>> +     { CCI_REG8(0x01),  0xa0 },
>>> +     { CCI_REG8(0x02),  0x48 },
>>> +     { CCI_REG8(0x07),  0x8f },
>>> +     { CCI_REG8(0x08),  0x70 },
>>> +     { CCI_REG8(0x09),  0x01 },
>>> +     { CCI_REG8(0x0b),  0x40 },
>>> +     { CCI_REG8(0x0d),  0x07 },
>>> +     { CCI_REG8(0x11),  0x33 },
>>> +     { CCI_REG8(0x12),  0x77 },
>>> +     { CCI_REG8(0x13),  0x66 },
>>> +     { CCI_REG8(0x14),  0x65 },
>>> +     { CCI_REG8(0x15),  0x37 },
>>> +     { CCI_REG8(0x16),  0xbf },
>>> +     { CCI_REG8(0x17),  0xff },
>>> +     { CCI_REG8(0x18),  0xff },
>>> +     { CCI_REG8(0x19),  0x12 },
>>> +     { CCI_REG8(0x1a),  0x10 },
>>> +     { CCI_REG8(0x1c),  0x77 },
>>> +     { CCI_REG8(0x1d),  0x77 },
>>> +     { CCI_REG8(0x20),  0x0f },
>>> +     { CCI_REG8(0x21),  0x0f },
>>> +     { CCI_REG8(0x22),  0x0f },
>>> +     { CCI_REG8(0x23),  0x0f },
>>> +     { CCI_REG8(0x2b),  0x20 },
>>> +     { CCI_REG8(0x2c),  0x20 },
>>> +     { CCI_REG8(0x2d),  0x04 },
>>> +     { CCI_REG8(0xfd),  0x03 },
>>> +     { CCI_REG8(0x9d),  0x0f },
>>> +     { CCI_REG8(0x9f),  0x40 },
>>> +     { CCI_REG8(0xfd),  0x00 },
>>> +     { CCI_REG8(0x20),  0x1b },
>>> +     { CCI_REG8(0xfd),  0x04 },
>>> +     { CCI_REG8(0x19),  0x60 },
>>> +     { CCI_REG8(0xfd),  0x02 },
>>> +     { CCI_REG8(0x75),  0x05 },
>>> +     { CCI_REG8(0x7f),  0x06 },
>>> +     { CCI_REG8(0x9a),  0x03 },
>>> +     { CCI_REG8(0xa2),  0x07 },
>>> +     { CCI_REG8(0xa3),  0x10 },
>>> +     { CCI_REG8(0xa5),  0x02 },
>>> +     { CCI_REG8(0xa6),  0x0b },
>>> +     { CCI_REG8(0xa7),  0x48 },
>>> +     { CCI_REG8(0xfd),  0x07 },
>>> +     { CCI_REG8(0x42),  0x00 },
>>> +     { CCI_REG8(0x43),  0x80 },
>>> +     { CCI_REG8(0x44),  0x00 },
>>> +     { CCI_REG8(0x45),  0x80 },
>>> +     { CCI_REG8(0x46),  0x00 },
>>> +     { CCI_REG8(0x47),  0x80 },
>>> +     { CCI_REG8(0x48),  0x00 },
>>> +     { CCI_REG8(0x49),  0x80 },
>>> +     { CCI_REG8(0x00),  0xf7 },
>>> +     { CCI_REG8(0xfd),  0x00 },
>>> +     { CCI_REG8(0xe7),  0x03 },
>>> +     { CCI_REG8(0xe7),  0x00 },
>>> +     { CCI_REG8(0xfd),  0x00 },
>>> +     { CCI_REG8(0x93),  0x18 },
>>> +     { CCI_REG8(0x94),  0xff },
>>> +     { CCI_REG8(0x95),  0xbd },
>>> +     { CCI_REG8(0x96),  0x1a },
>>> +     { CCI_REG8(0x98),  0x04 },
>>> +     { CCI_REG8(0x99),  0x08 },
>>> +     { CCI_REG8(0x9b),  0x10 },
>>> +     { CCI_REG8(0x9c),  0x3f },
>>> +     { CCI_REG8(0xa1),  0x05 },
>>> +     { CCI_REG8(0xa4),  0x2f },
>>> +     { CCI_REG8(0xc0),  0x0c },
>>> +     { CCI_REG8(0xc1),  0x08 },
>>> +     { CCI_REG8(0xc2),  0x00 },
>>> +     { CCI_REG8(0xb6),  0x20 },
>>> +     { CCI_REG8(0xbb),  0x80 },
>>> +     { CCI_REG8(0xfd),  0x00 },
>>> +     { CCI_REG8(0xa0),  0x01 },
>>> +     { CCI_REG8(0xfd),  0x01 },
>>> +};
>>> +
>>> +static const struct cci_reg_sequence mode_OV05C10_stream_on_regs[] = {
> 
> Why is the word 'mode_ in here ?
> 
We agree that the mode_ prefix isn't necessary, this was arbitrarily 
chosen, and we'll remove it in the next patch.

>>> +     { CCI_REG8(0xfd), 0x01 },
>>> +     { CCI_REG8(0x33), 0x03 },
>>> +     { CCI_REG8(0x01), 0x02 },
>>> +     { CCI_REG8(0xfd), 0x00 },
>>> +     { CCI_REG8(0x20), 0x1f },
>>> +     { CCI_REG8(0xfd), 0x01 },
>>> +};
>>> +
>>> +static const struct cci_reg_sequence mode_OV05C10_stream_off_regs[] = {
> 
> And why are these two register tables now OV05C10 rather than ov05c10
> (capital case, while everything else is lower case)
> 
I agree OV05C10 need not be in upper case, will change it to lower case 
in next patch.

> 
>>> +     { CCI_REG8(0xfd), 0x00 },
>>> +     { CCI_REG8(0x20), 0x5b },
>>> +     { CCI_REG8(0xfd), 0x01 },
>>> +     { CCI_REG8(0x33), 0x02 },
>>> +     { CCI_REG8(0x01), 0x02 },
> 
> Are there any registers in any of the tables we can name to make the
> driver more maintainable? Or extract to a directly coded function to
> make it more explicit perhaps?
> 
> In both those tables 0xfd gets written in a curious manner - is that
> another of the page selection type accesses ?
> 
> In fact, I can see that it is the page control register indeed - so
> perhaps it would make more sense to code this through the page
> accessors!
> 
To be honest this is the sequence received from sensor vendor and we are 
using it as-is. We need to check with them for the descriptions of the 
registers, will reachout to them and hoping they will answer..

> 
> 
>>> +};
>>> +
>>> +static const char * const ov05c10_test_pattern_menu[] = {
>>> +     "Disabled",
>>> +     "Vertical Color Bar Type 1",
>>> +     "Vertical Color Bar Type 2",
>>> +     "Vertical Color Bar Type 3",
>>> +     "Vertical Color Bar Type 4"
>>> +};
>>> +
>>> +/* Configurations for supported link frequencies */
>>> +#define OV05C10_LINK_FREQ_900MHZ     (900 * HZ_PER_MHZ)
>>> +
>>> +/* Number of lanes supported */
>>> +#define OV05C10_DATA_LANES           2
>>> +
>>> +/* Bits per sample of sensor output */
>>> +#define OV05C10_BITS_PER_SAMPLE              10
>>> +
>>> +/*
>>> + * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
>>> + * data rate => double data rate; number of lanes => 2; bits per pixel => 10
>>> + */
>>> +static u64 link_freq_to_pixel_rate(u64 f, u32 lane_nr)
>>> +{
>>> +     f *= 2 * lane_nr;
>>> +     do_div(f, OV05C10_BITS_PER_SAMPLE);
>>> +
>>> +     return f;
>>> +}
>>> +
>>> +/* Menu items for LINK_FREQ V4L2 control */
>>> +static const s64 ov05c10_link_freq_menu_items[] = {
>>> +     OV05C10_LINK_FREQ_900MHZ,
>>> +};
>>> +
>>> +/* Mode configs, currently, only support 1 mode */
>>> +static const struct ov05c10_mode supported_mode = {
>>> +     .width = MODE_WIDTH,
>>> +     .height = MODE_HEIGHT,
>>> +     .vts_def = OV05C10_VTS_30FPS,
>>> +     .vts_min = OV05C10_VTS_30FPS,
>>> +     .hts = 640,
>>> +     .lanes = 2,
>>> +     .reg_list = {
>>> +             .num_of_regs = ARRAY_SIZE(ov05c10_2888x1808_regs),
>>> +             .regs = ov05c10_2888x1808_regs,
>>> +     },
>>> +     .link_freq_index = OV05C10_LINK_FREQ_900MHZ_INDEX,
>>> +};
>>> +
>>> +struct ov05c10 {
>>> +     struct v4l2_subdev sd;
>>> +     struct media_pad pad;
>>> +
>>> +     /* V4L2 control handler */
>>> +     struct v4l2_ctrl_handler ctrl_handler;
>>> +
>>> +     /* V4L2 Controls */
>>> +     struct v4l2_ctrl *link_freq;
>>> +     struct v4l2_ctrl *pixel_rate;
>>> +     struct v4l2_ctrl *vblank;
>>> +     struct v4l2_ctrl *hblank;
>>> +     struct v4l2_ctrl *exposure;
>>> +
>>> +     struct regmap *regmap;
>>> +
>>> +     /* gpio descriptor */
>>> +     struct gpio_desc *enable_gpio;
>>> +
>>> +     /* Current page for sensor register control */
>>> +     int cur_page;
>>> +};
>>> +
>>> +#define to_ov05c10(_sd)      container_of(_sd, struct ov05c10, sd)
>>> +
>>> +static int ov05c10_init_state(struct v4l2_subdev *sd,
>>> +                           struct v4l2_subdev_state *sd_state)
>>> +{
>>> +     struct v4l2_mbus_framefmt *frame_fmt;
>>> +     struct v4l2_subdev_format fmt = {
>>> +             .which = V4L2_SUBDEV_FORMAT_TRY,
>>> +             .format = {
>>> +                     .width = MODE_WIDTH,
>>> +                     .height = MODE_HEIGHT,
>>> +                     .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>>> +                     .field = V4L2_FIELD_NONE,
>>> +             }
>>> +     };
>>> +
>>> +     frame_fmt = v4l2_subdev_state_get_format(sd_state, 0);
>>> +     *frame_fmt = fmt.format;
>>> +     return 0;
>>> +}
>>> +
>>> +static int ov05c10_switch_page(struct ov05c10 *ov05c10, u32 page, int *err)
>>
>> Seems nobody cares the return value of ov05c10_switch_page() or
>> ov05c10_reg_write(), etc.. It should be better to use void return, or
>> use return value instead of int *err.
> 
> This style probably comes from the way that the CCI helpers were
> written, to allow consectuive writes to avoid having to duplicate error
> checks when writing lots of registers.
> 
> Depending on how the generic page switching could be implemented, there
> may still be benefit to tracking the *err and I would still keep the
> return ret type - as there are times where it can still make sense to
> write:
> 
>          ret = ov05c10_switch_page(..)
> etc...
> 
We will update this method as Laurent suggested. This will be fixed in 
the next version.
> 
>>
>>> +{
>>> +     int ret = 0;
>>> +
>>> +     if (err && *err)
>>> +             return *err;
>>> +
>>> +     if (page != ov05c10->cur_page) {
>>> +             cci_write(ov05c10->regmap, OV05C10_REG_PAGE_CTL, page, &ret);
>>> +             if (!ret)
>>> +                     ov05c10->cur_page = page;
>>> +     }
>>> +
>>> +     if (err)
>>> +             *err = ret;
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +/* refer to the implementation of cci_read */
>>> +static int ov05c10_reg_read(struct ov05c10 *ov05c10, u32 reg,
>>> +                         u64 *val, int *err)
>>> +{
>>> +     u32 page;
>>> +     u32 addr;
>>> +     int ret = 0;
>>> +
>>> +     if (err && *err)
>>> +             return *err;
>>> +
>>> +     page = OV05C10_GET_PAGE_NUM(reg);
>>> +     addr = OV05C10_GET_REG_ADDR(reg);
>>> +     ov05c10_switch_page(ov05c10, page, &ret);
>>> +     cci_read(ov05c10->regmap, addr, val, &ret);
>>> +     if (err)
>>> +             *err = ret;
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +/* refer to the implementation of cci_write */
>>> +static int ov05c10_reg_write(struct ov05c10 *ov05c10, u32 reg,
>>> +                          u64 val, int *err)
>>> +{
>>> +     u32 page;
>>> +     u32 addr;
>>> +     int ret = 0;
>>> +
>>> +     if (err && *err)
>>> +             return *err;
>>> +
>>> +     page = OV05C10_GET_PAGE_NUM(reg);
>>> +     addr = OV05C10_GET_REG_ADDR(reg);
>>> +     ov05c10_switch_page(ov05c10, page, &ret);
>>> +     cci_write(ov05c10->regmap, addr, val, &ret);
>>> +     if (err)
>>> +             *err = ret;
>>> +
>>> +     return ret;
>>> +}
> 
> One of the main goals of CCI helpers was to avoid all of the custom
> device accessors being duplicated in each driver, so I think extending
> the CCI helpers to support page based accesses in some common way would
> be beneficial.
> 
Yes, I agree. We can take on this enhancement either now or in the 
future, depending on the direction. We'll wait for Sakari's feedback to 
determine the best way to proceed.

Thanks,
Pratap

> 
>>> +
>>> +static int ov05c10_update_vblank(struct ov05c10 *ov05c10, u32 vblank)
>>> +{
>>> +     const struct ov05c10_mode *mode = &supported_mode;
>>> +     u64 val;
>>> +     int ret = 0;
>>> +
>>> +     val = mode->height + vblank;
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_VTS, val, &ret);
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>> +                       OV05C_REG_TRIGGER_START, &ret);
>>> +
>>> +     return ret;
>>> +}
>>
>> I remembered that the ov05c10 VTS control (P1:0x05~0x06) is a bit weird.
>> This register seems take the increment of VTS value, so direct write of
>> VTS value will not set it properly. Does this version make AE working on
>> your platform?
>>
>>> +
>>> +static int ov05c10_update_exposure(struct ov05c10 *ov05c10, u32 exposure)
>>> +{
>>> +     int ret = 0;
>>> +
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_EXPOSURE, exposure, &ret);
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>> +                       OV05C_REG_TRIGGER_START, &ret);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int ov05c10_update_analog_gain(struct ov05c10 *ov05c10, u32 a_gain)
>>> +{
>>> +     int ret = 0;
>>> +
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_ANALOG_GAIN, a_gain, &ret);
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>> +                       OV05C_REG_TRIGGER_START, &ret);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int ov05c10_update_digital_gain(struct ov05c10 *ov05c10, u32 d_gain)
>>> +{
>>> +     u64 val;
>>> +     int ret = 0;
>>> +
>>> +     val = d_gain & OV05C10_DGTL_GAIN_L_MASK;
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_DGTL_GAIN_L, val, &ret);
>>> +
>>> +     val = (d_gain & OV05C10_DGTL_GAIN_H_MASK) >> OV05C10_DGTL_GAIN_H_SHIFT;
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_DGTL_GAIN_H, val, &ret);
>>> +
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>> +                       OV05C_REG_TRIGGER_START, &ret);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int ov05c10_enable_test_pattern(struct ov05c10 *ov05c10, u32 pattern)
>>> +{
>>> +     u64 val;
>>> +     int ret = 0;
>>> +
>>> +     if (pattern) {
>>> +             ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN_CTL,
>>> +                              &val, &ret);
>>> +             ov05c10_reg_write(ov05c10, OV05C10_REG_TEST_PATTERN_CTL,
>>> +                               val | OV05C10_REG_TEST_PATTERN_XXX, &ret);
>>> +             ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN, &val, &ret);
>>> +             val |= OV05C10_TEST_PATTERN_ENABLE;
>>> +     } else {
>>> +             ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN, &val, &ret);
>>> +             val &= ~OV05C10_TEST_PATTERN_ENABLE;
>>> +     }
>>> +
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_TEST_PATTERN, val, &ret);
>>> +     ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>> +                       OV05C_REG_TRIGGER_START, &ret);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int ov05c10_set_ctrl(struct v4l2_ctrl *ctrl)
>>> +{
>>> +     struct ov05c10 *ov05c10 = container_of(ctrl->handler,
>>> +                                            struct ov05c10, ctrl_handler);
>>> +     struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
>>> +     const struct ov05c10_mode *mode = &supported_mode;
>>> +     s64 max;
>>> +     int ret = 0;
>>> +
>>> +     /* Propagate change of current control to all related controls */
>>> +     if (ctrl->id == V4L2_CID_VBLANK) {
>>> +             s64 cur_exp = ov05c10->exposure->cur.val;
>>> +
>>> +             /* Update max exposure while meeting expected vblanking */
>>> +             max = mode->height + ctrl->val - OV05C10_EXPOSURE_MAX_MARGIN;
>>> +             cur_exp = clamp(cur_exp, ov05c10->exposure->minimum, max);
>>> +             ret = __v4l2_ctrl_modify_range(ov05c10->exposure,
>>> +                                            ov05c10->exposure->minimum,
>>> +                                            max, ov05c10->exposure->step,
>>> +                                            cur_exp);
>>> +             if (!ret)
>>> +                     return ret;
>>> +     }
>>> +
>>> +     /*
>>> +      * Applying V4L2 control value only happens
>>> +      * when power is up for streaming
>>> +      */
>>> +     if (!pm_runtime_get_if_in_use(&client->dev))
>>> +             return 0;
>>> +
>>> +     switch (ctrl->id) {
>>> +     case V4L2_CID_ANALOGUE_GAIN:
>>> +             ret = ov05c10_update_analog_gain(ov05c10, ctrl->val);
>>> +             break;
>>> +     case V4L2_CID_DIGITAL_GAIN:
>>> +             ret = ov05c10_update_digital_gain(ov05c10, ctrl->val);
>>> +             break;
>>> +     case V4L2_CID_EXPOSURE:
>>> +             ret = ov05c10_update_exposure(ov05c10, ctrl->val);
>>> +             break;
>>> +     case V4L2_CID_VBLANK:
>>> +             ret = ov05c10_update_vblank(ov05c10, ctrl->val);
>>> +             break;
>>> +     case V4L2_CID_TEST_PATTERN:
>>> +             ret = ov05c10_enable_test_pattern(ov05c10, ctrl->val);
>>> +             break;
>>> +     default:
>>> +             ret = -ENOTTY;
>>> +             dev_err(&client->dev,
>>> +                     "ctrl(id:0x%x,val:0x%x) is not handled\n",
>>> +                     ctrl->id, ctrl->val);
>>> +             break;
>>> +     }
>>> +
>>> +     pm_runtime_put(&client->dev);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static const struct v4l2_ctrl_ops ov05c10_ctrl_ops = {
>>> +     .s_ctrl = ov05c10_set_ctrl,
>>> +};
>>> +
>>> +static int ov05c10_enum_mbus_code(struct v4l2_subdev *sd,
>>> +                               struct v4l2_subdev_state *sd_state,
>>> +                               struct v4l2_subdev_mbus_code_enum *code)
>>> +{
>>> +     /* Only one bayer order(GRBG) is supported */
>>> +     if (code->index > 0)
>>> +             return -EINVAL;
>>> +
>>> +     code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int ov05c10_enum_frame_size(struct v4l2_subdev *sd,
>>> +                                struct v4l2_subdev_state *sd_state,
>>> +                                struct v4l2_subdev_frame_size_enum *fse)
>>> +{
>>> +     /* ov05c10 driver currently only supports 1 mode*/
>>> +     if (fse->index != 0)
>>> +             return -EINVAL;
>>> +
>>> +     if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
>>> +             return -EINVAL;
>>> +
>>> +     fse->min_width = supported_mode.width;
>>> +     fse->max_width = fse->min_width;
>>> +     fse->min_height = supported_mode.height;
>>> +     fse->max_height = fse->min_height;
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static void ov05c10_update_pad_format(const struct ov05c10_mode *mode,
>>> +                                   struct v4l2_subdev_format *fmt)
>>> +{
>>> +     fmt->format.width = mode->width;
>>> +     fmt->format.height = mode->height;
>>> +     fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>> +     fmt->format.field = V4L2_FIELD_NONE;
>>> +}
>>> +
>>> +static int ov05c10_set_pad_format(struct v4l2_subdev *sd,
>>> +                               struct v4l2_subdev_state *sd_state,
>>> +                               struct v4l2_subdev_format *fmt)
>>> +{
>>> +     struct v4l2_mbus_framefmt *framefmt;
>>> +     struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>> +     const struct ov05c10_mode *mode;
>>> +     s32 vblank_def;
>>> +     s32 vblank_min;
>>> +     s64 pixel_rate;
>>> +     s64 link_freq;
>>> +     s64 h_blank;
>>> +
>>> +     /* Only one raw bayer(GRBG) order is supported */
>>> +     if (fmt->format.code != MEDIA_BUS_FMT_SGRBG10_1X10)
>>> +             fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>> +
>>> +     mode = &supported_mode;
>>> +     ov05c10_update_pad_format(mode, fmt);
>>> +     if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>>> +             framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>>> +             *framefmt = fmt->format;
>>> +     } else {
>>> +             __v4l2_ctrl_s_ctrl(ov05c10->link_freq, mode->link_freq_index);
>>> +             link_freq = ov05c10_link_freq_menu_items[mode->link_freq_index];
>>> +             pixel_rate = link_freq_to_pixel_rate(link_freq,
>>> +                                                  mode->lanes);
>>> +             __v4l2_ctrl_s_ctrl_int64(ov05c10->pixel_rate, pixel_rate);
>>> +
>>> +             /* Update limits and set FPS to default */
>>> +             vblank_def = mode->vts_def - mode->height;
>>> +             vblank_min = mode->vts_min - mode->height;
>>> +             __v4l2_ctrl_modify_range(ov05c10->vblank, vblank_min,
>>> +                                      OV05C10_VTS_MAX - mode->height,
>>> +                                      1, vblank_def);
>>> +             __v4l2_ctrl_s_ctrl(ov05c10->vblank, vblank_def);
>>> +             h_blank = mode->hts;
>>> +             __v4l2_ctrl_modify_range(ov05c10->hblank, h_blank,
>>> +                                      h_blank, 1, h_blank);
>>> +     }
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static int ov05c10_start_streaming(struct ov05c10 *ov05c10)
>>> +{
>>> +     struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
>>> +     const struct ov05c10_mode *mode = &supported_mode;
>>> +     const struct ov05c10_reg_list *reg_list;
>>> +     int ret = 0;
>>> +
>>> +     /* Apply default values of current mode */
>>> +     reg_list = &mode->reg_list;
>>> +     cci_multi_reg_write(ov05c10->regmap, reg_list->regs,
>>> +                         reg_list->num_of_regs, &ret);
>>> +     if (ret) {
>>> +             dev_err(&client->dev, "fail to set mode, ret: %d\n", ret);
>>> +             return ret;
>>> +     }
>>> +
>>> +     /* Apply customized values from user */
>>> +     ret =  __v4l2_ctrl_handler_setup(ov05c10->sd.ctrl_handler);
>>> +     if (ret) {
>>> +             dev_err(&client->dev, "failed to setup v4l2 handler %d\n", ret);
>>> +             return ret;
>>> +     }
>>> +
>>> +     cci_multi_reg_write(ov05c10->regmap, mode_OV05C10_stream_on_regs,
>>> +                         ARRAY_SIZE(mode_OV05C10_stream_on_regs), &ret);
>>> +     if (ret)
>>> +             dev_err(&client->dev, "fail to start the streaming\n");
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int ov05c10_stop_streaming(struct ov05c10 *ov05c10)
>>> +{
>>> +     struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
>>> +     int ret = 0;
>>> +
>>> +     cci_multi_reg_write(ov05c10->regmap, mode_OV05C10_stream_off_regs,
>>> +                         ARRAY_SIZE(mode_OV05C10_stream_off_regs), &ret);
>>> +     if (ret)
>>> +             dev_err(&client->dev, "fail to stop the streaming\n");
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static void ov05c10_sensor_power_set(struct ov05c10 *ov05c10, bool on)
>>> +{
>>> +     if (on) {
>>> +             gpiod_set_value(ov05c10->enable_gpio, 0);
>>> +             usleep_range(10, 20);
>>> +
>>> +             gpiod_set_value(ov05c10->enable_gpio, 1);
>>> +             usleep_range(1000, 2000);
>>
>> According to the datasheet, ov05c10 needs at least 8 ms to work after
>> its XSHUTDN pin pulled to high. 1 ms maybe too quick, did you tested it?
>> Or the enable_gpio is actually not the XSHUTDN pin?
>>
>> On Intel platforms, if the sensor driver controls the module power,
>> ususally it requires GPIO "reset", regulator "avdd" and clk "img_clk"
>> assigned by kernel driver intel_skl_int3472_discrete. I'm not sure
>> whether any devices on market using this power control solution, but if
>> any, missing those resources will stop them from powering-up cameras.
>>
>>> +     } else {
>>> +             gpiod_set_value(ov05c10->enable_gpio, 0);
>>> +             usleep_range(10, 20);
>>> +     }
>>> +}
>>> +
>>> +static int ov05c10_enable_streams(struct v4l2_subdev *sd,
>>> +                               struct v4l2_subdev_state *state, u32 pad,
>>> +                               u64 streams_mask)
>>> +{
>>> +     struct i2c_client *client = v4l2_get_subdevdata(sd);
>>> +     struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>> +     int ret = 0;
>>> +
>>> +     ret = pm_runtime_resume_and_get(&client->dev);
>>> +     if (ret < 0)
>>> +             return ret;
>>> +
>>> +     ov05c10->cur_page = -1;
>>> +
>>> +     ret = ov05c10_start_streaming(ov05c10);
>>> +     if (ret)
>>> +             goto err_rpm_put;
>>> +
>>> +     return 0;
>>> +
>>> +err_rpm_put:
>>> +     pm_runtime_put(&client->dev);
>>> +     return ret;
>>> +}
>>> +
>>> +static int ov05c10_disable_streams(struct v4l2_subdev *sd,
>>> +                                struct v4l2_subdev_state *state, u32 pad,
>>> +                                u64 streams_mask)
>>> +{
>>> +     struct i2c_client *client = v4l2_get_subdevdata(sd);
>>> +     struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>> +
>>> +     ov05c10_stop_streaming(ov05c10);
>>> +     pm_runtime_put(&client->dev);
>>> +
>>> +     return 0;
>>> +}
>>> +
>>> +static const struct v4l2_subdev_video_ops ov05c10_video_ops = {
>>> +     .s_stream = v4l2_subdev_s_stream_helper,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_pad_ops ov05c10_pad_ops = {
>>> +     .enum_mbus_code = ov05c10_enum_mbus_code,
>>> +     .get_fmt = v4l2_subdev_get_fmt,
>>> +     .set_fmt = ov05c10_set_pad_format,
>>> +     .enum_frame_size = ov05c10_enum_frame_size,
>>> +     .enable_streams = ov05c10_enable_streams,
>>> +     .disable_streams = ov05c10_disable_streams,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_ops ov05c10_subdev_ops = {
>>> +     .video = &ov05c10_video_ops,
>>> +     .pad = &ov05c10_pad_ops,
>>> +};
>>> +
>>> +static const struct media_entity_operations ov05c10_subdev_entity_ops = {
>>> +     .link_validate = v4l2_subdev_link_validate,
>>> +};
>>> +
>>> +static const struct v4l2_subdev_internal_ops ov05c10_internal_ops = {
>>> +     .init_state = ov05c10_init_state,
>>> +};
>>> +
>>> +static int ov05c10_init_controls(struct ov05c10 *ov05c10)
>>> +{
>>> +     struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
>>> +     const struct ov05c10_mode *mode = &supported_mode;
>>> +     struct v4l2_fwnode_device_properties props;
>>> +     struct v4l2_ctrl_handler *ctrl_hdlr;
>>> +     s64 pixel_rate_max;
>>> +     s64 exposure_max;
>>> +     s64 vblank_def;
>>> +     s64 vblank_min;
>>> +     u32 max_items;
>>> +     s64 hblank;
>>> +     int ret;
>>> +
>>> +     ret = v4l2_ctrl_handler_init(&ov05c10->ctrl_handler, 10);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     ctrl_hdlr = &ov05c10->ctrl_handler;
>>> +
>>> +     max_items = ARRAY_SIZE(ov05c10_link_freq_menu_items) - 1;
>>> +     ov05c10->link_freq =
>>> +             v4l2_ctrl_new_int_menu(ctrl_hdlr,
>>> +                                    NULL,
>>> +                                    V4L2_CID_LINK_FREQ,
>>> +                                    max_items,
>>> +                                    0,
>>> +                                    ov05c10_link_freq_menu_items);
>>> +     if (ov05c10->link_freq)
>>> +             ov05c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +
>>> +     pixel_rate_max =
>>> +             link_freq_to_pixel_rate(ov05c10_link_freq_menu_items[0],
>>> +                                     supported_mode.lanes);
>>> +     ov05c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
>>> +                                             V4L2_CID_PIXEL_RATE,
>>> +                                             0, pixel_rate_max,
>>> +                                             1, pixel_rate_max);
>>> +
>>> +     vblank_def = mode->vts_def - mode->height;
>>> +     vblank_min = mode->vts_min - mode->height;
>>> +     ov05c10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops,
>>> +                                         V4L2_CID_VBLANK,
>>> +                                         vblank_min,
>>> +                                         OV05C10_VTS_MAX - mode->height,
>>> +                                         1, vblank_def);
>>> +
>>> +     hblank = (mode->hts > mode->width) ? (mode->hts - mode->width) : 0;
>>
>> Here your hts uses 640 but width is 2888, which means hblank is set to 0
>> here. This is wrong, please fix your configuration.
>>
>>> +     ov05c10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
>>> +                                         V4L2_CID_HBLANK,
>>> +                                         hblank, hblank, 1, hblank);
>>> +     if (ov05c10->hblank)
>>> +             ov05c10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>> +
>>> +     exposure_max = mode->vts_def - OV05C10_EXPOSURE_MAX_MARGIN;
>>> +     ov05c10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops,
>>> +                                           V4L2_CID_EXPOSURE,
>>> +                                           OV05C10_EXPOSURE_MIN,
>>> +                                           exposure_max,
>>> +                                           OV05C10_EXPOSURE_STEP,
>>> +                                           exposure_max);
>>> +
>>> +     v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
>>> +                       OV05C10_ANA_GAIN_MIN, OV05C10_ANA_GAIN_MAX,
>>> +                       OV05C10_ANA_GAIN_STEP, OV05C10_ANA_GAIN_DEFAULT);
>>> +
>>> +     v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
>>> +                       OV05C10_DGTL_GAIN_MIN, OV05C10_DGTL_GAIN_MAX,
>>> +                       OV05C10_DGTL_GAIN_STEP, OV05C10_DGTL_GAIN_DEFAULT);
>>> +
>>> +     v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov05c10_ctrl_ops,
>>> +                                  V4L2_CID_TEST_PATTERN,
>>> +                                  ARRAY_SIZE(ov05c10_test_pattern_menu) - 1,
>>> +                                  0, 0, ov05c10_test_pattern_menu);
>>> +
>>> +     if (ctrl_hdlr->error) {
>>> +             ret = ctrl_hdlr->error;
>>> +             dev_err(&client->dev, "V4L2 control init failed (%d)\n", ret);
>>> +             goto err_hdl_free;
>>> +     }
>>> +
>>> +     ret = v4l2_fwnode_device_parse(&client->dev, &props);
>>> +     if (ret)
>>> +             goto err_hdl_free;
>>> +
>>> +     ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov05c10_ctrl_ops,
>>> +                                           &props);
>>> +     if (ret)
>>> +             goto err_hdl_free;
>>> +
>>> +     ov05c10->sd.ctrl_handler = ctrl_hdlr;
>>> +
>>> +     return 0;
>>> +
>>> +err_hdl_free:
>>> +     v4l2_ctrl_handler_free(ctrl_hdlr);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int ov05c10_parse_endpoint(struct device *dev,
>>> +                               struct fwnode_handle *fwnode)
>>> +{
>>> +     struct v4l2_fwnode_endpoint bus_cfg = {
>>> +             .bus_type = V4L2_MBUS_CSI2_DPHY
>>> +     };
>>> +     struct fwnode_handle *ep;
>>> +     unsigned long bitmap;
>>> +     int ret;
>>> +
>>> +     ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>>> +     if (!ep) {
>>> +             dev_err(dev, "Failed to get next endpoint\n");
>>> +             return -ENXIO;
>>> +     }
>>> +
>>> +     ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>>> +     fwnode_handle_put(ep);
>>> +     if (ret)
>>> +             return ret;
>>> +
>>> +     if (bus_cfg.bus.mipi_csi2.num_data_lanes != supported_mode.lanes) {
>>> +             dev_err(dev,
>>> +                     "number of CSI2 data lanes %d is not supported\n",
>>> +                     bus_cfg.bus.mipi_csi2.num_data_lanes);
>>> +             ret = -EINVAL;
>>> +             goto err_endpoint_free;
>>> +     }
>>> +
>>> +     ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
>>> +                                    bus_cfg.nr_of_link_frequencies,
>>> +                                    ov05c10_link_frequencies,
>>> +                                    ARRAY_SIZE(ov05c10_link_frequencies),
>>> +                                    &bitmap);
>>> +     if (ret)
>>> +             dev_err(dev, "v4l2_link_freq_to_bitmap fail with %d\n", ret);
>>> +err_endpoint_free:
>>> +     v4l2_fwnode_endpoint_free(&bus_cfg);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static int ov05c10_probe(struct i2c_client *client)
>>> +{
>>> +     struct ov05c10 *ov05c10;
>>> +     u32 clkfreq;
>>> +     int ret;
>>> +
>>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), GFP_KERNEL);
>>> +     if (!ov05c10)
>>> +             return -ENOMEM;
>>> +
>>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>>> +
>>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency", &clkfreq);
>>
>> Maybe it's better to separate this part fwnode and GPIO code into a
>> standalone function?
>>
>>> +     if (ret)
>>> +             return  dev_err_probe(&client->dev, -EINVAL,
>>> +                                   "fail to get clock freq\n");
>>> +     if (clkfreq != OV05C10_REF_CLK)
>>> +             return dev_err_probe(&client->dev, -EINVAL,
>>> +                                  "fail invalid clock freq %u, %lu expected\n",
>>> +                                  clkfreq, OV05C10_REF_CLK);
>>> +
>>> +     ret = ov05c10_parse_endpoint(&client->dev, fwnode);
>>> +     if (ret)
>>> +             return dev_err_probe(&client->dev, -EINVAL,
>>> +                                  "fail to parse endpoint\n");
>>> +
>>> +     ov05c10->enable_gpio = devm_gpiod_get(&client->dev, "enable",
>>> +                                           GPIOD_OUT_LOW);
>>> +     if (IS_ERR(ov05c10->enable_gpio))
>>> +             return dev_err_probe(&client->dev,
>>> +                                  PTR_ERR(ov05c10->enable_gpio),
>>> +                                  "fail to get enable gpio\n");
>>> +
>>> +     v4l2_i2c_subdev_init(&ov05c10->sd, client, &ov05c10_subdev_ops);
>>> +
>>> +     ov05c10->regmap = devm_cci_regmap_init_i2c(client, 8);
>>> +     if (IS_ERR(ov05c10->regmap))
>>> +             return dev_err_probe(&client->dev, PTR_ERR(ov05c10->regmap),
>>> +                                  "fail to init cci\n");
>>> +
>>> +     ov05c10->cur_page = -1;
>>> +
>>> +     ret = ov05c10_init_controls(ov05c10);
>>> +     if (ret)
>>> +             return dev_err_probe(&client->dev, ret, "fail to init ctl\n");
>>> +
>>> +     ov05c10->sd.internal_ops = &ov05c10_internal_ops;
>>> +     ov05c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>> +     ov05c10->sd.entity.ops = &ov05c10_subdev_entity_ops;
>>> +     ov05c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>>> +
>>> +     ov05c10->pad.flags = MEDIA_PAD_FL_SOURCE;
>>> +
>>> +     ret = media_entity_pads_init(&ov05c10->sd.entity, NUM_OF_PADS,
>>> +                                  &ov05c10->pad);
>>> +     if (ret)
>>> +             goto err_hdl_free;
>>> +
>>> +     ret = v4l2_subdev_init_finalize(&ov05c10->sd);
>>> +     if (ret < 0)
>>> +             goto err_media_entity_cleanup;
>>> +
>>> +     ret = v4l2_async_register_subdev_sensor(&ov05c10->sd);
>>> +     if (ret)
>>> +             goto err_media_entity_cleanup;
>>> +
>>> +     pm_runtime_set_active(&client->dev);
>>> +     pm_runtime_enable(&client->dev);
>>> +     pm_runtime_idle(&client->dev);
>>> +     pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>>> +     pm_runtime_use_autosuspend(&client->dev);
>>> +     return 0;
>>> +
>>> +err_media_entity_cleanup:
>>> +     media_entity_cleanup(&ov05c10->sd.entity);
>>> +
>>> +err_hdl_free:
>>> +     v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
>>> +
>>> +     return ret;
>>> +}
>>> +
>>> +static void ov05c10_remove(struct i2c_client *client)
>>> +{
>>> +     struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>> +     struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>> +
>>> +     v4l2_async_unregister_subdev(sd);
>>> +     media_entity_cleanup(&sd->entity);
>>> +     v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
>>> +
>>> +     pm_runtime_disable(&client->dev);
>>> +     pm_runtime_set_suspended(&client->dev);
>>> +}
>>> +
>>> +static int ov05c10_runtime_resume(struct device *dev)
>>> +{
>>> +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>> +     struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>> +
>>> +     ov05c10_sensor_power_set(ov05c10, true);
>>> +     return 0;
>>> +}
>>> +
>>> +static int ov05c10_runtime_suspend(struct device *dev)
>>> +{
>>> +     struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>> +     struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>> +
>>> +     ov05c10_sensor_power_set(ov05c10, false);
>>> +     return 0;
>>> +}
>>> +
>>> +static DEFINE_RUNTIME_DEV_PM_OPS(ov05c10_pm_ops, ov05c10_runtime_suspend,
>>> +                              ov05c10_runtime_resume, NULL);
>>> +
>>> +static const struct i2c_device_id ov05c10_i2c_ids[] = {
>>> +     {"ov05c10", 0 },
>>> +     { }
>>> +};
>>> +MODULE_DEVICE_TABLE(i2c, ov05c10_i2c_ids);
>>> +
>>> +static struct i2c_driver ov05c10_i2c_driver = {
>>> +     .driver = {
>>> +             .name = DRV_NAME,
>>> +             .pm = pm_ptr(&ov05c10_pm_ops),
>>> +     },
>>> +     .id_table = ov05c10_i2c_ids,
>>> +     .probe = ov05c10_probe,
>>> +     .remove = ov05c10_remove,
>>> +};
>>> +
>>> +module_i2c_driver(ov05c10_i2c_driver);
>>> +
>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>>> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
>>
>> OV05C10
>>
>>> +MODULE_LICENSE("GPL");
>>
>>
>> Hi Sakari,
>>
>> Seems there are already several camera sensors using page-based
>> registers. Is it a good idea to add page support in CCI interface?
> 
> I think that's a good idea!
> 
> Some how maintaining the generality to keep it easy to access registers
> would be nice. Perhaps the page could be embedded in the CCI_REG()
> macros too to support changing the active page when a write accesses a
> different one?
> 
> --
> Kieran
> 
> 
>>
>>
>> Best Regards,
>> Hao Yao
>>


