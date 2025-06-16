Return-Path: <linux-media+bounces-35010-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13564ADBCE6
	for <lists+linux-media@lfdr.de>; Tue, 17 Jun 2025 00:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78CC1891AA9
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 22:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD7A21882B;
	Mon, 16 Jun 2025 22:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4XhVTPbr"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C34A0C;
	Mon, 16 Jun 2025 22:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750113238; cv=fail; b=kGnEmJYyyUR21Nk931ZvjEhFI1zJ9+KCsJ6ih6hrmBwc/VW7vBhCOupJvtZ8oI5idKHtpqBnC7GXaIscAgBr6kZUgmGPf0kfEkZCmxp4Q4Sej0ojsQVyQb6f0u+j1l5lzAWYufiuI/aZY+3PBvrkGKHVw61TGqBnHdbG94XCuDc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750113238; c=relaxed/simple;
	bh=nrdshXfg8aPbsM80nRXlOwzvNaZkHV7Av0ePJuIBhAM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=NX2/5yHX6hUuL0QjpFg3oCQiTufdSxDB/t8bkFGDSggPS9b+/Ld1yFC0hhkp1+NMpXi+hhawW0gKoMZN9YWDbLUuCKFSqBYmJxOs9nKSpIpN9iHZ9fI+j8UM7ge3K1lXdZ7vQknQKIiDkwzNjgTUwB5yuAex2zXinCMNx099eKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4XhVTPbr; arc=fail smtp.client-ip=40.107.223.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKs3P0hbamBYBj0ITxMG1PuR/zuI6iQH/oSazE+prXlFMcBXWKP5YUus9ONwzRsutSotUTGRNmMjF3cKqwZbVLg0n8AlJTbzeOkqHcEQ1ZA08mcRPQxOEqoD2vvQc+NgCiQ4zPf2u4W0m85cxG+6AF+d3vQZhjmCN4vsBflNn0r6NScTkhII3MB7JVdMAk8HzuTkFYyCmde5QQhZQYoimY/hQGTS4KYiXabCXsyQl2JI+BiznSYQyB6j72MFO98ixMtKPeWFb5L6ZUUG+fT96ljVEuEzm0F2OGw8RcB6gPOBcQyZfx6M9n++1UWpKvB8IZEDMm47VnO4og/QSsrfug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8LSAkgbfT3F+DB4iMtfRLgGN9Kvq7HUl9ZApCe8Hpc=;
 b=lH20ehGBjPW/X2a41Llmn7nCsXzUgEqfWLQjNuAmpplsoNTe18QvnZune5msxMI5fqOwz+Y/CqJmWkFwrM72w1XYVYyXcP6PO36jRiL6KG8e6BcnrSKobLQPx9Mfibr2GJcC9fNtk7RWsIAGWLHy14OSOF7PEfhPbEtQmRmX1hj5W4VvygS9cmbjh7Ih0fHyEVEJZGMco/3Lh2ibpDrqIJLdtdGqxPHdCPWba2W8kAoKsXgW2FECHdrxdVpcICm9RTJnp7LObQIanQ+qB4KUxmb1H90ik1u9Tckv7IJwLQF5kBHpqqdSZHZtSCn6FRp6Qb2+vgHemWRhFvekJTgDXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8LSAkgbfT3F+DB4iMtfRLgGN9Kvq7HUl9ZApCe8Hpc=;
 b=4XhVTPbr7eEMo9xBADZXF63790an3brrvjLa9YQNe1Iq/gUkO2ZnYaKTclxeKB6VIkkvqxyXZ2kW3VCtgz/XYBxKOvHwGxTjKpXAn1eG/Jl/NzJypB+hnhnRh88edl0wellmBMbBn/4Gjap4uHjXmzjChC9CWqv0TeYxSXpTEao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by PH0PR12MB5646.namprd12.prod.outlook.com (2603:10b6:510:143::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 22:33:51 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 22:33:51 +0000
Message-ID: <f6d1d8f7-d953-4f86-a196-f713726bd5f8@amd.com>
Date: Mon, 16 Jun 2025 18:33:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
 mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 krzk@kernel.org, dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
 jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com, king.li@amd.com,
 dantony@amd.com, vengutta@amd.com, dongcheng.yan@intel.com,
 jason.z.chen@intel.com, jimmy.su@intel.com
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250614225257.GO10542@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:610:74::14) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|PH0PR12MB5646:EE_
X-MS-Office365-Filtering-Correlation-Id: de263f23-b220-487b-7378-08ddad25de61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVIzQWJEMzk0MzVQU0xBbzYwWkxrQ1VJMGJZVVloeVUydng2SUVRTW9mTHJB?=
 =?utf-8?B?bTlmUjhIY2M2Rk9xbVBHRm5YMmFUZVJoeUNNSlp6S2lXOHpPN3BSazFSbWdC?=
 =?utf-8?B?TmFwYTR4a0ovdDNIT2h0M0ljRi9mbEJHQVJmMkt4ZEpVS01jL2N4aXVkR29j?=
 =?utf-8?B?dkcvc0l6OVdUUnJjY1ZtTzdnbWl2THhKcWFyKzIwTlpPbzNuZkk4bEtJNEtT?=
 =?utf-8?B?WWRoY3hsVFFMY2poREdWVlVpc0NqSm5uNzFhdXNSNWRhOE8yMXVydW1kMlJU?=
 =?utf-8?B?Z25RNXE4aFZDcnhSWW1jYkFzbFZmbFJ4ak1JZVNqMkpFNkpnc2tMcmhJV2dj?=
 =?utf-8?B?VFZnd2RUanhQNHNTM0lOVDlMYkUyTUM4ZDFiZ2RiSXJMN0N3VjlKRmdxTDVh?=
 =?utf-8?B?cmJGSEJkNFhkU2Q4U2w1TGZwdFg2Y0M3S1YrRjhwOCszY0R5YTdpazNSTjlo?=
 =?utf-8?B?T2MzUnhCSTA4NGhsMjR6KzBDRVkzblBLMCs5emErcld6WG5IbW5pckg1NjJK?=
 =?utf-8?B?eFpRQlh5UE1Sc21NdTIvSk9OazFLS2hjZUNjWExMWTJqcWxYOXVsd21kY1Vl?=
 =?utf-8?B?bmtWZjRSbWsrRS9PVDZSQk1TZG5YbU5WMEF6MDRCd210cWM1VEdpcnhTeFpw?=
 =?utf-8?B?VEtrUStTc1RxZzNya0ovVitlZE1oRE5GYmFBLzltMXRiN2JNQ0YwQ2xRbDFU?=
 =?utf-8?B?VDBUakZZK1RLb0VXYTB0QlByQ01WV2FaQytYU2k3YUJSUHkyZXA1V285dkhK?=
 =?utf-8?B?SC9RVThIdnkxVTJhaitPVjB4QlhjZHpOdHBmQm00cU0yelV3bUFYbVRhdUpS?=
 =?utf-8?B?UUkwaXU2T0huLzlGQ0pyMUxxcW5sZWErRE5pNkxYY0ZCWTNNekQ5RS9ORm5J?=
 =?utf-8?B?UEdTUWMwdnNZaDJOc1hYWlNvU2tqRElFZDZCaXpGMHU3b2dlV1lkUVg2akdz?=
 =?utf-8?B?ZGxodGcwK0VnQWxoNXhjTldTTTFycXJxSWlQS3o4L2lZTWc1elQvRkdFcEN6?=
 =?utf-8?B?RUFkQ2dzTGJ4M1NlV0tobk5HaGdsWXI3R0sxcXZudy9hazFzem02NFhtdEMw?=
 =?utf-8?B?RHhpUlRqSEFpNmh2ZW01aFFEWTBxY3FGTWtHOHlXR3M1dUovVWF1ZFcxMC84?=
 =?utf-8?B?cncwSDVrZE1xTDl3S2duMktiOWVMYXpGeGkvYWRRSG9wK2I1bStPMlVLRnZo?=
 =?utf-8?B?ZDNXTXh3SUU5WTB0RHF0WWttc2ZWaGlLL2NRRk9UMkROQmI0SE92VE1HdVRi?=
 =?utf-8?B?K3ZuZ2NzR0hMYTd2OFVLQlZtZVhBQy9VVzZxWkh5eVNNU0VMa0RraDRWS1pV?=
 =?utf-8?B?aEZjL1lIY0M0Q1lEVm0wZlpJcHBqRURXMzZLeERRTTkwcTV2M01EWThOOTJv?=
 =?utf-8?B?ODNFYVBTRFIwdzhTTGhsMysvTXFWRWxOejRzUlB3blFEOWJNZ1pMY2N6dUxP?=
 =?utf-8?B?UlpWUUs3emNlREFhVlFTbjAxa3djZ3BvdUsvQjFLbFliNStHU3pPbWoxTDdk?=
 =?utf-8?B?R0ZBTUM2bEJ1SVZJTHRtQi9MYkF6TUlaRHJTUlVGVERrblFyZVdPcUY5M1Zs?=
 =?utf-8?B?eG1Cc09MM3poeFAvRlFYYlo4TDI0bnZrR1RlbUljQ1drdHU1Y29UL1c3bXFr?=
 =?utf-8?B?UUtjWDJKN21ETWpIdFBVdk5rSjErYXEwNnVTeEp4UVBBOU8xbzVQOUFlSWQ0?=
 =?utf-8?B?N1lPR1NWMit5SzA5UFJ6dEY1Yklac2FES3NwcHdXRGY2S1pSTnlKZ0twWmJH?=
 =?utf-8?B?SWJEemFEL1ZiQUROVUxWSmlzaGlSU0crRmdzc1F6aDUxZ0d6VmxiVmNEWGt0?=
 =?utf-8?B?MFJsMkNCRElmM0hIZjVvNVVHc0NNMEZ2M3ZvcnFuY2hJd2JveWJUZjhhU3E1?=
 =?utf-8?B?ejczajBDQXo1NGRYQ2szMDdpWjNxMmVnVW8rMWd6c1llVXc2SlNTdWphQXBT?=
 =?utf-8?Q?omw+iPDC4JM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3M5bTNTdHJWbDUvTW1NaE96WGpxa2U2TTlnQkFLK2FrMmNjanhsVG5qbFgw?=
 =?utf-8?B?RkIzREsvbTBScWk1c0t0OWtCVllEMk9ORDhRakppK3JZZ2EzbGFXMEw3d3Ni?=
 =?utf-8?B?UUFVOS9Ec20zUmVMVXY2aVRkYUtXN1BTMzZXRmZ5bjR1YTl4bzlIU1l4U0VJ?=
 =?utf-8?B?VDFVdU5EeEpvVnNkc29FVVZ4VEpiZWdPUTAxUmZKWTdVblBSNTBjNjFzYjAv?=
 =?utf-8?B?eGdjMDBJRUczcnJFSHlIVjV0TlJCNFRTbXc2T2thak1NYnluSlNKK3JzMms1?=
 =?utf-8?B?Tk8wYkloaXZLVVBDQjhRZEdaQVFDVHdUazB6MGlubmlCS1I4eHZuY2twNlMv?=
 =?utf-8?B?U2xqMFZGb2ZzT3M4UW0rV1dzZnNTOEtTN29mZ3N1dVBncm5XY0NnWEZBQ25k?=
 =?utf-8?B?S0RWZ0N1MHhzZHBhLzNLeU5pcmJpc1YxS2ZVRzhadm9jeUg5OUZrNEZMU3o5?=
 =?utf-8?B?NXhiVWNsaFNzcnJBRmMwYzNTSWZwRGw2UGxoZFpTU0hqdTFTU1c3bzRDL3ZN?=
 =?utf-8?B?WUZSSm1UT3F6SlFYUEoweCtJOGRTU3lOZHQ0QlFVQzh1NHo1b1JRSDhCdmQ4?=
 =?utf-8?B?SGRtYVU0VXVvZmp4UGN2UjJVMDJFSWdIbkdITXp1QkdjRTArVXltU3VSdXBR?=
 =?utf-8?B?VyttYUtOMmN1OE1oMytWU0w4NUpLYlk0eXNCQVRTeDFIOFk2QjlqMndVdjN0?=
 =?utf-8?B?cnpqRGZjbXNBSGIxMXd5MitoVVBBZXVaenFwWU1FOGJHSkpHdnBCNysrZHFU?=
 =?utf-8?B?SU5mekovc2E0MVg2eEN2K0s0UUUzdXBJWDdaYmxRcUowbHVPSDRmUXJVQTVQ?=
 =?utf-8?B?UjFONEtCUGgvTGlwRmpQNEhYckhQdzlPQjExL2JVTjV5L0ZDbVBJTE1MQ1RZ?=
 =?utf-8?B?dkpORTAzTXV2NUJzOGVFbVNUeDdHdlFKM3hlc2VWdDFsVzNLVlh3MFNlVUNQ?=
 =?utf-8?B?YTdSTG9Scjg3ZG5nSDhzcXkrTm5QdDRpZDdpRW4vOFVMOEIyc2JsZzdTNjh1?=
 =?utf-8?B?UWRpWG10NmlMY2pSSnNxamo3Ujdqc0N3djZ5N0lmLzd3ekJ2SjM5REEvSkl3?=
 =?utf-8?B?RVhMOEJBQ2ViSkV3SXRFMldaZDNxdWVYK2dDVHZrdUpxcEQ2YmlySkl3WElG?=
 =?utf-8?B?cXJNVlYzTUVKdFBFZzRtOXd5RzBNYXc4OG9sR3pLbERpZ0l4alRqWC95eGJj?=
 =?utf-8?B?ZVk0NEFTRUF2dUZiVW5UUGduVFNpZnFtWmlUdWNNbHRnWUQ2QmZXRVRPNGlL?=
 =?utf-8?B?VGFWOGlXS0l3ajhDeGx3ZTZUNlFPb0llNVl3dXV6R01vSDBINHB6NHdOejlX?=
 =?utf-8?B?eWJZOHVZSERkZmJpYitVL08zTVl0VFoxelN4bU54UmdOUUZEaVo2R05ROFlz?=
 =?utf-8?B?WC85S2twQXVmOE00NTRBNnhkMXg2SHhhejVOdjlCSEc2azVtcG83Q1lyZmtm?=
 =?utf-8?B?UFBGWWRwSERIbTlIWnBLZTRONnRIZ0hvcVdmYVRQUTkxUU1vU09xYXVjeDQr?=
 =?utf-8?B?c0xPbkd1NWNURnpsWWVsUFh4SG4vSlA4Q3Y0dlVYMnVzb3V6VXdpVFVPbEsy?=
 =?utf-8?B?QmtkdVVIRmFWNHBuTFVQZ1pQWDZxL1lKRGt0a2MyeXJDNzBqM3VSUWtlQ3BL?=
 =?utf-8?B?YTZUbHFqVVVNcE9jMFVmVmVvRFVaOHp4R2RrU1pwZHc4N1BKeEtsWkozM09X?=
 =?utf-8?B?VFZVM2lsK2xLVFNPdk1BZ0w3dm9vTkRGWThFLysybXBneU5PcUc1UXUrVkpS?=
 =?utf-8?B?RlRtcHpPL0RiQmdhM0t6bC9lYXRVeXVTSy9NK3NzdlRxOU9sRkhiSGpaL0RM?=
 =?utf-8?B?UTVFNlhHMTNoYWVlOFhVYkszaytRM1M4Y0ZTK3IzU3NLNldWRHlHWXFka3JN?=
 =?utf-8?B?dlRwaUJFWGVqSlE0VjBEMEhxRThIMkxnVHdwWTBhVndTZVhTU2pvZjJpR3g3?=
 =?utf-8?B?MVhrM3ZFRmFIQlVGaEt1dHV1U2FJSmYvaGZQb3k1VUxGclk0byt3akNJNDlp?=
 =?utf-8?B?d09CZ21yQ0xrR0t3dXJPdllsbGNydGZ4L1JObGVpTTk0QldqNVpaVUwvTHFN?=
 =?utf-8?B?WEZWT1lIdWo5bnVHNnlSSWt1YlRycTZ5UXYrN00xNE55aWdxV2k3a09ITkJy?=
 =?utf-8?Q?eBQBdgJ06YfxwxqNuYONnWSPY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de263f23-b220-487b-7378-08ddad25de61
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 22:33:51.5127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BrdZ0kBm5DdfKH84hfW9wHM4N8SOzS/GZEFFzzP3EGEbnAtRNdAGJe+ZMah8e9aKDxKdqYsGQnTolb868HOKNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5646

Hi Laurent,

Thank you for reviewing and sharing your feedback.

On 6/14/2025 6:52 PM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> On Fri, Jun 13, 2025 at 10:02:49PM +0000, Sakari Ailus wrote:
>> On Fri, Jun 13, 2025 at 12:55:46PM +0800, Hao Yao wrote:
>>> Hi Pratap,
>>>
>>> Thanks for your patch.
>>>
>>> This patch is written for your camera sensor module, which seems very
>>> different from those already applied on Dell laptops (some of "Dell Pro"
>>> series). Looking into the driver, I think this version will break the
>>> devices using ov05c10 sensor.
>>
>> There never was such a driver in upstream so nothing breaks. However, in
>> order to support these, could you check what would it take to support them
>> using this driver and post patches, please?
> 
> I'll repeat Kieran's comment here, there's a "first come, first serve"
> policiy in the kernel in general. That's one more reason to handle
> upstreaming early, if you want your driver to be merged :-)
> 
>>> I think this patch is better to be validated on existing devices, but please
>>> do some fixes before we can do validation. Please check my comments inline.
>>>
>>> On 2025/6/10 03:42, Pratap Nirujogi wrote:
>>>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
>>>> supports only the full size normal 2888x1808@30fps 2-lane
>>>> sensor profile.
>>>>
>>>> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>>>> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
>>>> Co-developed-by: Bin Du <bin.du@amd.com>
>>>> Signed-off-by: Bin Du <bin.du@amd.com>
>>>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
>>>> ---
>>>> Changes v2 -> v3:
>>>>
>>>> * Update "refclk" property variable as "clock-frequency".
>>>> * Update sensor GPIO connector id name.
>>>> * Fix sensor v4l2 compliance issue.
>>>> * Fix license info.
>>>> * Address review comments.
>>>>
>>>>    MAINTAINERS                 |    8 +
>>>>    drivers/media/i2c/Kconfig   |   10 +
>>>>    drivers/media/i2c/Makefile  |    1 +
>>>>    drivers/media/i2c/ov05c10.c | 1061 +++++++++++++++++++++++++++++++++++
>>>>    4 files changed, 1080 insertions(+)
>>>>    create mode 100644 drivers/media/i2c/ov05c10.c
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index a92290fffa16..caca25d00bf2 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -18303,6 +18303,14 @@ T:       git git://linuxtv.org/media.git
>>>>    F:      Documentation/devicetree/bindings/media/i2c/ovti,ov02e10.yaml
>>>>    F:      drivers/media/i2c/ov02e10.c
>>>> +OMNIVISION OV05C10 SENSOR DRIVER
>>>> +M:       Nirujogi Pratap <pratap.nirujogi@amd.com>
>>>> +M:       Bin Du <bin.du@amd.com>
>>>> +L:       linux-media@vger.kernel.org
>>>> +S:       Maintained
>>>> +T:       git git://linuxtv.org/media.git
>>>> +F:       drivers/media/i2c/ov05c10.c
>>>> +
>>>>    OMNIVISION OV08D10 SENSOR DRIVER
>>>>    M:      Jimmy Su <jimmy.su@intel.com>
>>>>    L:      linux-media@vger.kernel.org
>>>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>>>> index e68202954a8f..1662fb29d75c 100644
>>>> --- a/drivers/media/i2c/Kconfig
>>>> +++ b/drivers/media/i2c/Kconfig
>>>> @@ -377,6 +377,16 @@ config VIDEO_OV02C10
>>>>              To compile this driver as a module, choose M here: the
>>>>              module will be called ov02c10.
>>>> +config VIDEO_OV05C10
>>>> + tristate "OmniVision OV05C10 sensor support"
>>>> + select V4L2_CCI_I2C
>>>> + help
>>>> +   This is a Video4Linux2 sensor driver for the OmniVision
>>>> +   OV05C10 camera.
>>>> +
>>>> +   To compile this driver as a module, choose M here: the
>>>> +   module will be called OV05C10.
>>>> +
>>>>    config VIDEO_OV08D10
>>>>            tristate "OmniVision OV08D10 sensor support"
>>>>            help
>>>> diff --git a/drivers/media/i2c/Makefile b/drivers/media/i2c/Makefile
>>>> index 5873d29433ee..b4a1d721a7f2 100644
>>>> --- a/drivers/media/i2c/Makefile
>>>> +++ b/drivers/media/i2c/Makefile
>>>> @@ -85,6 +85,7 @@ obj-$(CONFIG_VIDEO_OV01A10) += ov01a10.o
>>>>    obj-$(CONFIG_VIDEO_OV02A10) += ov02a10.o
>>>>    obj-$(CONFIG_VIDEO_OV02C10) += ov02c10.o
>>>>    obj-$(CONFIG_VIDEO_OV02E10) += ov02e10.o
>>>> +obj-$(CONFIG_VIDEO_OV05C10) += ov05c10.o
>>>>    obj-$(CONFIG_VIDEO_OV08D10) += ov08d10.o
>>>>    obj-$(CONFIG_VIDEO_OV08X40) += ov08x40.o
>>>>    obj-$(CONFIG_VIDEO_OV13858) += ov13858.o
>>>> diff --git a/drivers/media/i2c/ov05c10.c b/drivers/media/i2c/ov05c10.c
>>>> new file mode 100644
>>>> index 000000000000..9a1e493c4073
>>>> --- /dev/null
>>>> +++ b/drivers/media/i2c/ov05c10.c
>>>> @@ -0,0 +1,1061 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +// Copyright (C) 2025 Advanced Micro Devices, Inc.
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/gpio.h>
>>>> +#include <linux/i2c.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <linux/units.h>
>>>> +#include <media/v4l2-cci.h>
>>>> +#include <media/v4l2-ctrls.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/v4l2-fwnode.h>
>>>> +
>>>> +#define DRV_NAME                 "ov05c10"
>>>> +#define OV05C10_REF_CLK                  (24 * HZ_PER_MHZ)
>>>
>>> Seems your module use 24 MHz clock input. The Dell's modules always use
>>> 19.2MHz, which means your the PLL settings will not work on Dell's.
>>
>> This is ok as further work. Please send a patch. :-)
> 
> The patch should calculate PLL configuration dynamically, perhaps using
> the ccs-pll calculator if applicable.
> 
We have a dependency on the sensor vendor to address this suggestion. At 
present, we are getting the PLL configuration from the vendor as part of 
the sensor mode settings. We are thinking the PLL specific registers 
should be isolated first from the complete set of control registers to 
add a new method for dynamically configuring the PLL. But unfortunatly 
we dont have any information of the PLL of this sensor...:/, we need to 
work with the sensor vendor to get these details.

>>>> +
>>>> +#define MODE_WIDTH  2888
>>>> +#define MODE_HEIGHT 1808
>>>> +
>>>> +#define PAGE_NUM_MASK                    0xff000000
>>>> +#define PAGE_NUM_SHIFT                   24
>>>> +#define REG_ADDR_MASK                    0x00ffffff
>>>> +
>>>> +#define OV05C10_SYSCTL_PAGE              (0 << PAGE_NUM_SHIFT)
>>>> +#define OV05C10_CISCTL_PAGE              (1 << PAGE_NUM_SHIFT)
>>>> +#define OV05C10_ISPCTL_PAGE              (4 << PAGE_NUM_SHIFT)
>>>> +
>>>> +/* Chip ID */
>>>> +#define OV05C10_REG_CHIP_ID              (CCI_REG24(0x00) | OV05C10_SYSCTL_PAGE)
>>>> +#define OV05C10_CHIP_ID                  0x43055610
>>>> +
>>>> +/* Control registers */
>>>> +#define OV05C10_REG_TRIGGER              (CCI_REG8(0x01) | OV05C10_CISCTL_PAGE)
>>>> +#define OV05C_REG_TRIGGER_START          BIT(0)
>>>> +
>>>> +/* Exposure control */
>>>> +#define OV05C10_REG_EXPOSURE             (CCI_REG24(0x02) | OV05C10_CISCTL_PAGE)
>>>> +#define OV05C10_EXPOSURE_MAX_MARGIN      33
>>>> +#define OV05C10_EXPOSURE_MIN             4
>>>> +#define OV05C10_EXPOSURE_STEP            1
>>>> +#define OV05C10_EXPOSURE_DEFAULT 0x40
>>>> +
>>>> +/* V_TIMING internal */
>>>> +#define OV05C10_REG_VTS                  (CCI_REG16(0x05) | OV05C10_CISCTL_PAGE)
>>>> +#define OV05C10_VTS_30FPS                1860
>>>> +#define OV05C10_VTS_MAX                  0x7fff
>>>> +
>>>> +/* Test Pattern Control */
>>>> +#define OV05C10_REG_TEST_PATTERN (CCI_REG8(0x12) | OV05C10_ISPCTL_PAGE)
>>>> +#define OV05C10_TEST_PATTERN_ENABLE      BIT(0)
>>>> +#define OV05C10_REG_TEST_PATTERN_CTL     (CCI_REG8(0xf3) | OV05C10_ISPCTL_PAGE)
>>>> +#define OV05C10_REG_TEST_PATTERN_XXX     BIT(0)
>>>> +
>>>> +/* Digital gain control */
>>>> +#define OV05C10_REG_DGTL_GAIN_H          (CCI_REG8(0x21) | OV05C10_CISCTL_PAGE)
>>>> +#define OV05C10_REG_DGTL_GAIN_L          (CCI_REG8(0x22) | OV05C10_CISCTL_PAGE)
>>>> +
>>>> +#define OV05C10_DGTL_GAIN_MIN            0x40
>>>> +#define OV05C10_DGTL_GAIN_MAX            0xff
>>>> +#define OV05C10_DGTL_GAIN_DEFAULT        0x40
>>>> +#define OV05C10_DGTL_GAIN_STEP           1
>>>> +
>>>> +#define OV05C10_DGTL_GAIN_L_MASK 0xff
>>>> +#define OV05C10_DGTL_GAIN_H_SHIFT        8
>>>> +#define OV05C10_DGTL_GAIN_H_MASK 0xff00
>>>> +
>>>> +/* Analog gain control */
>>>> +#define OV05C10_REG_ANALOG_GAIN          (CCI_REG8(0x24) | OV05C10_CISCTL_PAGE)
>>>> +#define OV05C10_ANA_GAIN_MIN             0x80
>>>> +#define OV05C10_ANA_GAIN_MAX             0x07c0
>>>> +#define OV05C10_ANA_GAIN_STEP            1
>>>> +#define OV05C10_ANA_GAIN_DEFAULT 0x80
>>>> +
>>>> +/* H TIMING internal */
>>>> +#define OV05C10_REG_HTS                  (CCI_REG16(0x37) | OV05C10_CISCTL_PAGE)
>>>> +#define OV05C10_HTS_30FPS                0x0280
>>>> +
>>>> +/* Page selection */
>>>> +#define OV05C10_REG_PAGE_CTL             CCI_REG8(0xfd)
>>>> +
>>>> +#define NUM_OF_PADS 1
>>>> +
>>>> +#define OV05C10_GET_PAGE_NUM(reg)        (((reg) & PAGE_NUM_MASK) >>\
>>>> +                                  PAGE_NUM_SHIFT)
>>>> +#define OV05C10_GET_REG_ADDR(reg)        ((reg) & REG_ADDR_MASK)
>>>> +
>>>> +enum {
>>>> + OV05C10_LINK_FREQ_900MHZ_INDEX,
>>>> +};
>>>> +
>>>> +struct ov05c10_reg_list {
>>>> + u32 num_of_regs;
>>>> + const struct cci_reg_sequence *regs;
>>>> +};
>>>> +
>>>> +/* Mode : resolution and related config&values */
>>>> +struct ov05c10_mode {
>>>> + /* Frame width */
>>>> + u32 width;
>>>> + /* Frame height */
>>>> + u32 height;
>>>> + /* number of lanes */
>>>> + u32 lanes;
>>>> +
>>>> + /* V-timing */
>>>> + u32 vts_def;
>>>> + u32 vts_min;
>>>> +
>>>> + /* HTS */
>>>> + u32 hts;
>>>> +
>>>> + /* Index of Link frequency config to be used */
>>>> + u32 link_freq_index;
>>>> +
>>>> + /* Default register values */
>>>> + struct ov05c10_reg_list reg_list;
>>>> +};
>>>> +
>>>> +static const s64 ov05c10_link_frequencies[] = {
>>>> + 925 * HZ_PER_MHZ,
>>>> +};
>>>
>>> Is it 900 MHz, or 925 MHz?
>>>
>>>> +
>>>> +/* 2888x1808 30fps, 1800mbps, 2lane, 24mhz */
>>>
>>> Currently Dell's devices with ov05c10 use a CV chip to passthrough MIPI CSI
>>> signals, but it supports max 750 MHz link frequency. That's why this
>>> version:
>>> https://github.com/intel/ipu6-drivers/blob/master/drivers/media/i2c/ov05c10.c
>>> uses 480 MHz link frequency and a different resolution setting (2800x1576).
>>> At least the setting in out-of-tree Github driver should be merged into this
>>> version.
>>
>> Ditto.
>>
>>>> +static const struct cci_reg_sequence ov05c10_2888x1808_regs[] = {
>>>> + { CCI_REG8(0xfd),  0x00 },
>>>> + { CCI_REG8(0x20),  0x00 },
>>>> + { CCI_REG8(0xfd),  0x00 },
>>>> + { CCI_REG8(0x20),  0x0b },
>>>> + { CCI_REG8(0xc1),  0x09 },
>>>> + { CCI_REG8(0x21),  0x06 },
>>>> + { CCI_REG8(0x14),  0x78 },
>>>> + { CCI_REG8(0xe7),  0x03 },
>>>> + { CCI_REG8(0xe7),  0x00 },
>>>> + { CCI_REG8(0x21),  0x00 },
>>>> + { CCI_REG8(0xfd),  0x01 },
>>>> + { CCI_REG8(0x03),  0x00 },
>>>> + { CCI_REG8(0x04),  0x06 },
>>>> + { CCI_REG8(0x05),  0x07 },
>>>> + { CCI_REG8(0x06),  0x44 },
>>>> + { CCI_REG8(0x07),  0x08 },
>>>> + { CCI_REG8(0x1b),  0x01 },
>>>> + { CCI_REG8(0x24),  0xff },
>>>> + { CCI_REG8(0x32),  0x03 },
>>>> + { CCI_REG8(0x42),  0x5d },
>>>> + { CCI_REG8(0x43),  0x08 },
>>>> + { CCI_REG8(0x44),  0x81 },
>>>> + { CCI_REG8(0x46),  0x5f },
>>>> + { CCI_REG8(0x48),  0x18 },
>>>> + { CCI_REG8(0x49),  0x04 },
>>>> + { CCI_REG8(0x5c),  0x18 },
>>>> + { CCI_REG8(0x5e),  0x13 },
>>>> + { CCI_REG8(0x70),  0x15 },
>>>> + { CCI_REG8(0x77),  0x35 },
>>>> + { CCI_REG8(0x79),  0x00 },
>>>> + { CCI_REG8(0x7b),  0x08 },
>>>> + { CCI_REG8(0x7d),  0x08 },
>>>> + { CCI_REG8(0x7e),  0x08 },
>>>> + { CCI_REG8(0x7f),  0x08 },
>>>> + { CCI_REG8(0x90),  0x37 },
>>>> + { CCI_REG8(0x91),  0x05 },
>>>> + { CCI_REG8(0x92),  0x18 },
>>>> + { CCI_REG8(0x93),  0x27 },
>>>> + { CCI_REG8(0x94),  0x05 },
>>>> + { CCI_REG8(0x95),  0x38 },
>>>> + { CCI_REG8(0x9b),  0x00 },
>>>> + { CCI_REG8(0x9c),  0x06 },
>>>> + { CCI_REG8(0x9d),  0x28 },
>>>> + { CCI_REG8(0x9e),  0x06 },
>>>> + { CCI_REG8(0xb2),  0x0f },
>>>> + { CCI_REG8(0xb3),  0x29 },
>>>> + { CCI_REG8(0xbf),  0x3c },
>>>> + { CCI_REG8(0xc2),  0x04 },
>>>> + { CCI_REG8(0xc4),  0x00 },
>>>> + { CCI_REG8(0xca),  0x20 },
>>>> + { CCI_REG8(0xcb),  0x20 },
>>>> + { CCI_REG8(0xcc),  0x28 },
>>>> + { CCI_REG8(0xcd),  0x28 },
>>>> + { CCI_REG8(0xce),  0x20 },
>>>> + { CCI_REG8(0xcf),  0x20 },
>>>> + { CCI_REG8(0xd0),  0x2a },
>>>> + { CCI_REG8(0xd1),  0x2a },
>>>> + { CCI_REG8(0xfd),  0x0f },
>>>> + { CCI_REG8(0x00),  0x00 },
>>>> + { CCI_REG8(0x01),  0xa0 },
>>>> + { CCI_REG8(0x02),  0x48 },
>>>> + { CCI_REG8(0x07),  0x8f },
>>>> + { CCI_REG8(0x08),  0x70 },
>>>> + { CCI_REG8(0x09),  0x01 },
>>>> + { CCI_REG8(0x0b),  0x40 },
>>>> + { CCI_REG8(0x0d),  0x07 },
>>>> + { CCI_REG8(0x11),  0x33 },
>>>> + { CCI_REG8(0x12),  0x77 },
>>>> + { CCI_REG8(0x13),  0x66 },
>>>> + { CCI_REG8(0x14),  0x65 },
>>>> + { CCI_REG8(0x15),  0x37 },
>>>> + { CCI_REG8(0x16),  0xbf },
>>>> + { CCI_REG8(0x17),  0xff },
>>>> + { CCI_REG8(0x18),  0xff },
>>>> + { CCI_REG8(0x19),  0x12 },
>>>> + { CCI_REG8(0x1a),  0x10 },
>>>> + { CCI_REG8(0x1c),  0x77 },
>>>> + { CCI_REG8(0x1d),  0x77 },
>>>> + { CCI_REG8(0x20),  0x0f },
>>>> + { CCI_REG8(0x21),  0x0f },
>>>> + { CCI_REG8(0x22),  0x0f },
>>>> + { CCI_REG8(0x23),  0x0f },
>>>> + { CCI_REG8(0x2b),  0x20 },
>>>> + { CCI_REG8(0x2c),  0x20 },
>>>> + { CCI_REG8(0x2d),  0x04 },
>>>> + { CCI_REG8(0xfd),  0x03 },
>>>> + { CCI_REG8(0x9d),  0x0f },
>>>> + { CCI_REG8(0x9f),  0x40 },
>>>> + { CCI_REG8(0xfd),  0x00 },
>>>> + { CCI_REG8(0x20),  0x1b },
>>>> + { CCI_REG8(0xfd),  0x04 },
>>>> + { CCI_REG8(0x19),  0x60 },
>>>> + { CCI_REG8(0xfd),  0x02 },
>>>> + { CCI_REG8(0x75),  0x05 },
>>>> + { CCI_REG8(0x7f),  0x06 },
>>>> + { CCI_REG8(0x9a),  0x03 },
>>>> + { CCI_REG8(0xa2),  0x07 },
>>>> + { CCI_REG8(0xa3),  0x10 },
>>>> + { CCI_REG8(0xa5),  0x02 },
>>>> + { CCI_REG8(0xa6),  0x0b },
>>>> + { CCI_REG8(0xa7),  0x48 },
>>>> + { CCI_REG8(0xfd),  0x07 },
>>>> + { CCI_REG8(0x42),  0x00 },
>>>> + { CCI_REG8(0x43),  0x80 },
>>>> + { CCI_REG8(0x44),  0x00 },
>>>> + { CCI_REG8(0x45),  0x80 },
>>>> + { CCI_REG8(0x46),  0x00 },
>>>> + { CCI_REG8(0x47),  0x80 },
>>>> + { CCI_REG8(0x48),  0x00 },
>>>> + { CCI_REG8(0x49),  0x80 },
>>>> + { CCI_REG8(0x00),  0xf7 },
>>>> + { CCI_REG8(0xfd),  0x00 },
>>>> + { CCI_REG8(0xe7),  0x03 },
>>>> + { CCI_REG8(0xe7),  0x00 },
>>>> + { CCI_REG8(0xfd),  0x00 },
>>>> + { CCI_REG8(0x93),  0x18 },
>>>> + { CCI_REG8(0x94),  0xff },
>>>> + { CCI_REG8(0x95),  0xbd },
>>>> + { CCI_REG8(0x96),  0x1a },
>>>> + { CCI_REG8(0x98),  0x04 },
>>>> + { CCI_REG8(0x99),  0x08 },
>>>> + { CCI_REG8(0x9b),  0x10 },
>>>> + { CCI_REG8(0x9c),  0x3f },
>>>> + { CCI_REG8(0xa1),  0x05 },
>>>> + { CCI_REG8(0xa4),  0x2f },
>>>> + { CCI_REG8(0xc0),  0x0c },
>>>> + { CCI_REG8(0xc1),  0x08 },
>>>> + { CCI_REG8(0xc2),  0x00 },
>>>> + { CCI_REG8(0xb6),  0x20 },
>>>> + { CCI_REG8(0xbb),  0x80 },
>>>> + { CCI_REG8(0xfd),  0x00 },
>>>> + { CCI_REG8(0xa0),  0x01 },
>>>> + { CCI_REG8(0xfd),  0x01 },
> 
> Please replace these with names macros where possible. I'm sure quite a
> few of the registers configured here are documented in the datasheet.
> The registers that configure the mode (analog crop, digital crop,
> binning, skipping, ...) should be computed dynamically from the subdev
> pad format and selection rectangles, not hardcoded.
> 
I agree, but we get the sensor settings based on our requirements from 
the vendor, i will check if we can get some more info regarding the 
crop, binning, skipping etc...

Thanks,
Pratap

>>>> +};
>>>> +
>>>> +static const struct cci_reg_sequence mode_OV05C10_stream_on_regs[] = {
>>>> + { CCI_REG8(0xfd), 0x01 },
>>>> + { CCI_REG8(0x33), 0x03 },
>>>> + { CCI_REG8(0x01), 0x02 },
>>>> + { CCI_REG8(0xfd), 0x00 },
>>>> + { CCI_REG8(0x20), 0x1f },
>>>> + { CCI_REG8(0xfd), 0x01 },
>>>> +};
>>>> +
>>>> +static const struct cci_reg_sequence mode_OV05C10_stream_off_regs[] = {
>>>> + { CCI_REG8(0xfd), 0x00 },
>>>> + { CCI_REG8(0x20), 0x5b },
>>>> + { CCI_REG8(0xfd), 0x01 },
>>>> + { CCI_REG8(0x33), 0x02 },
>>>> + { CCI_REG8(0x01), 0x02 },
>>>> +};
>>>> +
>>>> +static const char * const ov05c10_test_pattern_menu[] = {
>>>> + "Disabled",
>>>> + "Vertical Color Bar Type 1",
>>>> + "Vertical Color Bar Type 2",
>>>> + "Vertical Color Bar Type 3",
>>>> + "Vertical Color Bar Type 4"
>>>> +};
>>>> +
>>>> +/* Configurations for supported link frequencies */
>>>> +#define OV05C10_LINK_FREQ_900MHZ (900 * HZ_PER_MHZ)
>>>> +
>>>> +/* Number of lanes supported */
>>>> +#define OV05C10_DATA_LANES               2
>>>> +
>>>> +/* Bits per sample of sensor output */
>>>> +#define OV05C10_BITS_PER_SAMPLE          10
>>>> +
>>>> +/*
>>>> + * pixel_rate = link_freq * data-rate * nr_of_lanes / bits_per_sample
>>>> + * data rate => double data rate; number of lanes => 2; bits per pixel => 10
>>>> + */
>>>> +static u64 link_freq_to_pixel_rate(u64 f, u32 lane_nr)
>>>> +{
>>>> + f *= 2 * lane_nr;
>>>> + do_div(f, OV05C10_BITS_PER_SAMPLE);
>>>> +
>>>> + return f;
>>>> +}
>>>> +
>>>> +/* Menu items for LINK_FREQ V4L2 control */
>>>> +static const s64 ov05c10_link_freq_menu_items[] = {
>>>> + OV05C10_LINK_FREQ_900MHZ,
>>>> +};
>>>> +
>>>> +/* Mode configs, currently, only support 1 mode */
>>>> +static const struct ov05c10_mode supported_mode = {
>>>> + .width = MODE_WIDTH,
>>>> + .height = MODE_HEIGHT,
>>>> + .vts_def = OV05C10_VTS_30FPS,
>>>> + .vts_min = OV05C10_VTS_30FPS,
>>>> + .hts = 640,
>>>> + .lanes = 2,
>>>> + .reg_list = {
>>>> +         .num_of_regs = ARRAY_SIZE(ov05c10_2888x1808_regs),
>>>> +         .regs = ov05c10_2888x1808_regs,
>>>> + },
>>>> + .link_freq_index = OV05C10_LINK_FREQ_900MHZ_INDEX,
>>>> +};
>>>> +
>>>> +struct ov05c10 {
>>>> + struct v4l2_subdev sd;
>>>> + struct media_pad pad;
>>>> +
>>>> + /* V4L2 control handler */
>>>> + struct v4l2_ctrl_handler ctrl_handler;
>>>> +
>>>> + /* V4L2 Controls */
>>>> + struct v4l2_ctrl *link_freq;
>>>> + struct v4l2_ctrl *pixel_rate;
>>>> + struct v4l2_ctrl *vblank;
>>>> + struct v4l2_ctrl *hblank;
>>>> + struct v4l2_ctrl *exposure;
>>>> +
>>>> + struct regmap *regmap;
>>>> +
>>>> + /* gpio descriptor */
>>>> + struct gpio_desc *enable_gpio;
>>>> +
>>>> + /* Current page for sensor register control */
>>>> + int cur_page;
>>>> +};
>>>> +
>>>> +#define to_ov05c10(_sd)  container_of(_sd, struct ov05c10, sd)
>>>> +
>>>> +static int ov05c10_init_state(struct v4l2_subdev *sd,
>>>> +                       struct v4l2_subdev_state *sd_state)
>>>> +{
>>>> + struct v4l2_mbus_framefmt *frame_fmt;
>>>> + struct v4l2_subdev_format fmt = {
>>>> +         .which = V4L2_SUBDEV_FORMAT_TRY,
>>>> +         .format = {
>>>> +                 .width = MODE_WIDTH,
>>>> +                 .height = MODE_HEIGHT,
>>>> +                 .code = MEDIA_BUS_FMT_SGRBG10_1X10,
>>>> +                 .field = V4L2_FIELD_NONE,
>>>> +         }
>>>> + };
>>>> +
>>>> + frame_fmt = v4l2_subdev_state_get_format(sd_state, 0);
>>>> + *frame_fmt = fmt.format;
>>>> + return 0;
>>>> +}
>>>> +
>>>> +static int ov05c10_switch_page(struct ov05c10 *ov05c10, u32 page, int *err)
>>>
>>> Seems nobody cares the return value of ov05c10_switch_page() or
>>> ov05c10_reg_write(), etc.. It should be better to use void return, or use
>>> return value instead of int *err.
>>
>> As this is a function that has two users, I'd use a more common pattern of
>> returning a value.
>>
>>>> +{
>>>> + int ret = 0;
>>>> +
>>>> + if (err && *err)
>>>> +         return *err;
>>>> +
>>>> + if (page != ov05c10->cur_page) {
>>>> +         cci_write(ov05c10->regmap, OV05C10_REG_PAGE_CTL, page, &ret);
>>>> +         if (!ret)
>>>> +                 ov05c10->cur_page = page;
>>>> + }
>>>> +
>>>> + if (err)
>>>> +         *err = ret;
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +/* refer to the implementation of cci_read */
>>>> +static int ov05c10_reg_read(struct ov05c10 *ov05c10, u32 reg,
>>>> +                     u64 *val, int *err)
>>>> +{
>>>> + u32 page;
>>>> + u32 addr;
>>>> + int ret = 0;
>>>> +
>>>> + if (err && *err)
>>>> +         return *err;
>>>> +
>>>> + page = OV05C10_GET_PAGE_NUM(reg);
>>>> + addr = OV05C10_GET_REG_ADDR(reg);
>>>> + ov05c10_switch_page(ov05c10, page, &ret);
>>>> + cci_read(ov05c10->regmap, addr, val, &ret);
>>>> + if (err)
>>>> +         *err = ret;
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +/* refer to the implementation of cci_write */
>>>> +static int ov05c10_reg_write(struct ov05c10 *ov05c10, u32 reg,
>>>> +                      u64 val, int *err)
>>>> +{
>>>> + u32 page;
>>>> + u32 addr;
>>>> + int ret = 0;
>>>> +
>>>> + if (err && *err)
>>>> +         return *err;
>>>> +
>>>> + page = OV05C10_GET_PAGE_NUM(reg);
>>>> + addr = OV05C10_GET_REG_ADDR(reg);
>>>> + ov05c10_switch_page(ov05c10, page, &ret);
>>>> + cci_write(ov05c10->regmap, addr, val, &ret);
>>>> + if (err)
>>>> +         *err = ret;
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static int ov05c10_update_vblank(struct ov05c10 *ov05c10, u32 vblank)
>>>> +{
>>>> + const struct ov05c10_mode *mode = &supported_mode;
>>>> + u64 val;
>>>> + int ret = 0;
>>>> +
>>>> + val = mode->height + vblank;
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_VTS, val, &ret);
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>>> +                   OV05C_REG_TRIGGER_START, &ret);
>>>> +
>>>> + return ret;
>>>> +}
>>>
>>> I remembered that the ov05c10 VTS control (P1:0x05~0x06) is a bit weird.
>>> This register seems take the increment of VTS value, so direct write of VTS
>>> value will not set it properly. Does this version make AE working on your
>>> platform?
>>>
>>>> +
>>>> +static int ov05c10_update_exposure(struct ov05c10 *ov05c10, u32 exposure)
>>>> +{
>>>> + int ret = 0;
>>>> +
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_EXPOSURE, exposure, &ret);
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>>> +                   OV05C_REG_TRIGGER_START, &ret);
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static int ov05c10_update_analog_gain(struct ov05c10 *ov05c10, u32 a_gain)
>>>> +{
>>>> + int ret = 0;
>>>> +
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_ANALOG_GAIN, a_gain, &ret);
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>>> +                   OV05C_REG_TRIGGER_START, &ret);
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static int ov05c10_update_digital_gain(struct ov05c10 *ov05c10, u32 d_gain)
>>>> +{
>>>> + u64 val;
>>>> + int ret = 0;
>>>> +
>>>> + val = d_gain & OV05C10_DGTL_GAIN_L_MASK;
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_DGTL_GAIN_L, val, &ret);
>>>> +
>>>> + val = (d_gain & OV05C10_DGTL_GAIN_H_MASK) >> OV05C10_DGTL_GAIN_H_SHIFT;
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_DGTL_GAIN_H, val, &ret);
>>>> +
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>>> +                   OV05C_REG_TRIGGER_START, &ret);
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static int ov05c10_enable_test_pattern(struct ov05c10 *ov05c10, u32 pattern)
>>>> +{
>>>> + u64 val;
>>>> + int ret = 0;
>>>> +
>>>> + if (pattern) {
>>>> +         ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN_CTL,
>>>> +                          &val, &ret);
>>>> +         ov05c10_reg_write(ov05c10, OV05C10_REG_TEST_PATTERN_CTL,
>>>> +                           val | OV05C10_REG_TEST_PATTERN_XXX, &ret);
>>>> +         ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN, &val, &ret);
>>>> +         val |= OV05C10_TEST_PATTERN_ENABLE;
>>>> + } else {
>>>> +         ov05c10_reg_read(ov05c10, OV05C10_REG_TEST_PATTERN, &val, &ret);
>>>> +         val &= ~OV05C10_TEST_PATTERN_ENABLE;
>>>> + }
>>>> +
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_TEST_PATTERN, val, &ret);
>>>> + ov05c10_reg_write(ov05c10, OV05C10_REG_TRIGGER,
>>>> +                   OV05C_REG_TRIGGER_START, &ret);
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static int ov05c10_set_ctrl(struct v4l2_ctrl *ctrl)
>>>> +{
>>>> + struct ov05c10 *ov05c10 = container_of(ctrl->handler,
>>>> +                                        struct ov05c10, ctrl_handler);
>>>> + struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
>>>> + const struct ov05c10_mode *mode = &supported_mode;
>>>> + s64 max;
>>>> + int ret = 0;
>>>> +
>>>> + /* Propagate change of current control to all related controls */
>>>> + if (ctrl->id == V4L2_CID_VBLANK) {
>>>> +         s64 cur_exp = ov05c10->exposure->cur.val;
>>>> +
>>>> +         /* Update max exposure while meeting expected vblanking */
>>>> +         max = mode->height + ctrl->val - OV05C10_EXPOSURE_MAX_MARGIN;
>>>> +         cur_exp = clamp(cur_exp, ov05c10->exposure->minimum, max);
>>>> +         ret = __v4l2_ctrl_modify_range(ov05c10->exposure,
>>>> +                                        ov05c10->exposure->minimum,
>>>> +                                        max, ov05c10->exposure->step,
>>>> +                                        cur_exp);
>>>> +         if (!ret)
>>>> +                 return ret;
>>>> + }
>>>> +
>>>> + /*
>>>> +  * Applying V4L2 control value only happens
>>>> +  * when power is up for streaming
>>>> +  */
>>>> + if (!pm_runtime_get_if_in_use(&client->dev))
>>>> +         return 0;
>>>> +
>>>> + switch (ctrl->id) {
>>>> + case V4L2_CID_ANALOGUE_GAIN:
>>>> +         ret = ov05c10_update_analog_gain(ov05c10, ctrl->val);
>>>> +         break;
>>>> + case V4L2_CID_DIGITAL_GAIN:
>>>> +         ret = ov05c10_update_digital_gain(ov05c10, ctrl->val);
>>>> +         break;
>>>> + case V4L2_CID_EXPOSURE:
>>>> +         ret = ov05c10_update_exposure(ov05c10, ctrl->val);
>>>> +         break;
>>>> + case V4L2_CID_VBLANK:
>>>> +         ret = ov05c10_update_vblank(ov05c10, ctrl->val);
>>>> +         break;
>>>> + case V4L2_CID_TEST_PATTERN:
>>>> +         ret = ov05c10_enable_test_pattern(ov05c10, ctrl->val);
>>>> +         break;
>>>> + default:
>>>> +         ret = -ENOTTY;
>>>> +         dev_err(&client->dev,
>>>> +                 "ctrl(id:0x%x,val:0x%x) is not handled\n",
>>>> +                 ctrl->id, ctrl->val);
>>>> +         break;
>>>> + }
>>>> +
>>>> + pm_runtime_put(&client->dev);
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static const struct v4l2_ctrl_ops ov05c10_ctrl_ops = {
>>>> + .s_ctrl = ov05c10_set_ctrl,
>>>> +};
>>>> +
>>>> +static int ov05c10_enum_mbus_code(struct v4l2_subdev *sd,
>>>> +                           struct v4l2_subdev_state *sd_state,
>>>> +                           struct v4l2_subdev_mbus_code_enum *code)
>>>> +{
>>>> + /* Only one bayer order(GRBG) is supported */
>>>> + if (code->index > 0)
>>>> +         return -EINVAL;
>>>> +
>>>> + code->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>>> +
>>>> + return 0;
>>>> +}
>>>> +
>>>> +static int ov05c10_enum_frame_size(struct v4l2_subdev *sd,
>>>> +                            struct v4l2_subdev_state *sd_state,
>>>> +                            struct v4l2_subdev_frame_size_enum *fse)
>>>> +{
>>>> + /* ov05c10 driver currently only supports 1 mode*/
>>>> + if (fse->index != 0)
>>>> +         return -EINVAL;
>>>> +
>>>> + if (fse->code != MEDIA_BUS_FMT_SGRBG10_1X10)
>>>> +         return -EINVAL;
>>>> +
>>>> + fse->min_width = supported_mode.width;
>>>> + fse->max_width = fse->min_width;
>>>> + fse->min_height = supported_mode.height;
>>>> + fse->max_height = fse->min_height;
>>>> +
>>>> + return 0;
>>>> +}
>>>> +
>>>> +static void ov05c10_update_pad_format(const struct ov05c10_mode *mode,
>>>> +                               struct v4l2_subdev_format *fmt)
>>>> +{
>>>> + fmt->format.width = mode->width;
>>>> + fmt->format.height = mode->height;
>>>> + fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>>> + fmt->format.field = V4L2_FIELD_NONE;
>>>> +}
>>>> +
>>>> +static int ov05c10_set_pad_format(struct v4l2_subdev *sd,
>>>> +                           struct v4l2_subdev_state *sd_state,
>>>> +                           struct v4l2_subdev_format *fmt)
>>>> +{
>>>> + struct v4l2_mbus_framefmt *framefmt;
>>>> + struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>>> + const struct ov05c10_mode *mode;
>>>> + s32 vblank_def;
>>>> + s32 vblank_min;
>>>> + s64 pixel_rate;
>>>> + s64 link_freq;
>>>> + s64 h_blank;
>>>> +
>>>> + /* Only one raw bayer(GRBG) order is supported */
>>>> + if (fmt->format.code != MEDIA_BUS_FMT_SGRBG10_1X10)
>>>> +         fmt->format.code = MEDIA_BUS_FMT_SGRBG10_1X10;
>>>> +
>>>> + mode = &supported_mode;
>>>> + ov05c10_update_pad_format(mode, fmt);
>>>> + if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
>>>> +         framefmt = v4l2_subdev_state_get_format(sd_state, fmt->pad);
>>>> +         *framefmt = fmt->format;
>>>> + } else {
>>>> +         __v4l2_ctrl_s_ctrl(ov05c10->link_freq, mode->link_freq_index);
>>>> +         link_freq = ov05c10_link_freq_menu_items[mode->link_freq_index];
>>>> +         pixel_rate = link_freq_to_pixel_rate(link_freq,
>>>> +                                              mode->lanes);
>>>> +         __v4l2_ctrl_s_ctrl_int64(ov05c10->pixel_rate, pixel_rate);
>>>> +
>>>> +         /* Update limits and set FPS to default */
>>>> +         vblank_def = mode->vts_def - mode->height;
>>>> +         vblank_min = mode->vts_min - mode->height;
>>>> +         __v4l2_ctrl_modify_range(ov05c10->vblank, vblank_min,
>>>> +                                  OV05C10_VTS_MAX - mode->height,
>>>> +                                  1, vblank_def);
>>>> +         __v4l2_ctrl_s_ctrl(ov05c10->vblank, vblank_def);
>>>> +         h_blank = mode->hts;
>>>> +         __v4l2_ctrl_modify_range(ov05c10->hblank, h_blank,
>>>> +                                  h_blank, 1, h_blank);
>>>> + }
>>>> +
>>>> + return 0;
>>>> +}
>>>> +
>>>> +static int ov05c10_start_streaming(struct ov05c10 *ov05c10)
>>>> +{
>>>> + struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
>>>> + const struct ov05c10_mode *mode = &supported_mode;
>>>> + const struct ov05c10_reg_list *reg_list;
>>>> + int ret = 0;
>>>> +
>>>> + /* Apply default values of current mode */
>>>> + reg_list = &mode->reg_list;
>>>> + cci_multi_reg_write(ov05c10->regmap, reg_list->regs,
>>>> +                     reg_list->num_of_regs, &ret);
>>>> + if (ret) {
>>>> +         dev_err(&client->dev, "fail to set mode, ret: %d\n", ret);
>>>> +         return ret;
>>>> + }
>>>> +
>>>> + /* Apply customized values from user */
>>>> + ret =  __v4l2_ctrl_handler_setup(ov05c10->sd.ctrl_handler);
>>>> + if (ret) {
>>>> +         dev_err(&client->dev, "failed to setup v4l2 handler %d\n", ret);
>>>> +         return ret;
>>>> + }
>>>> +
>>>> + cci_multi_reg_write(ov05c10->regmap, mode_OV05C10_stream_on_regs,
>>>> +                     ARRAY_SIZE(mode_OV05C10_stream_on_regs), &ret);
>>>> + if (ret)
>>>> +         dev_err(&client->dev, "fail to start the streaming\n");
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static int ov05c10_stop_streaming(struct ov05c10 *ov05c10)
>>>> +{
>>>> + struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
>>>> + int ret = 0;
>>>> +
>>>> + cci_multi_reg_write(ov05c10->regmap, mode_OV05C10_stream_off_regs,
>>>> +                     ARRAY_SIZE(mode_OV05C10_stream_off_regs), &ret);
>>>> + if (ret)
>>>> +         dev_err(&client->dev, "fail to stop the streaming\n");
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static void ov05c10_sensor_power_set(struct ov05c10 *ov05c10, bool on)
>>>> +{
>>>> + if (on) {
>>>> +         gpiod_set_value(ov05c10->enable_gpio, 0);
>>>> +         usleep_range(10, 20);
>>>> +
>>>> +         gpiod_set_value(ov05c10->enable_gpio, 1);
>>>> +         usleep_range(1000, 2000);
>>>
>>> According to the datasheet, ov05c10 needs at least 8 ms to work after its
>>> XSHUTDN pin pulled to high. 1 ms maybe too quick, did you tested it? Or the
>>> enable_gpio is actually not the XSHUTDN pin?
>>>
>>> On Intel platforms, if the sensor driver controls the module power, ususally
>>> it requires GPIO "reset", regulator "avdd" and clk "img_clk" assigned by
>>> kernel driver intel_skl_int3472_discrete. I'm not sure whether any devices
>>> on market using this power control solution, but if any, missing those
>>> resources will stop them from powering-up cameras.
>>
>> Please post a patch.
>>
>>>> + } else {
>>>> +         gpiod_set_value(ov05c10->enable_gpio, 0);
>>>> +         usleep_range(10, 20);
>>>> + }
>>>> +}
>>>> +
>>>> +static int ov05c10_enable_streams(struct v4l2_subdev *sd,
>>>> +                           struct v4l2_subdev_state *state, u32 pad,
>>>> +                           u64 streams_mask)
>>>> +{
>>>> + struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>> + struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>>> + int ret = 0;
>>>> +
>>>> + ret = pm_runtime_resume_and_get(&client->dev);
>>>> + if (ret < 0)
>>>> +         return ret;
>>>> +
>>>> + ov05c10->cur_page = -1;
>>>> +
>>>> + ret = ov05c10_start_streaming(ov05c10);
>>>> + if (ret)
>>>> +         goto err_rpm_put;
>>>> +
>>>> + return 0;
>>>> +
>>>> +err_rpm_put:
>>>> + pm_runtime_put(&client->dev);
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static int ov05c10_disable_streams(struct v4l2_subdev *sd,
>>>> +                            struct v4l2_subdev_state *state, u32 pad,
>>>> +                            u64 streams_mask)
>>>> +{
>>>> + struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>> + struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>>> +
>>>> + ov05c10_stop_streaming(ov05c10);
>>>> + pm_runtime_put(&client->dev);
>>>> +
>>>> + return 0;
>>>> +}
>>>> +
>>>> +static const struct v4l2_subdev_video_ops ov05c10_video_ops = {
>>>> + .s_stream = v4l2_subdev_s_stream_helper,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_pad_ops ov05c10_pad_ops = {
>>>> + .enum_mbus_code = ov05c10_enum_mbus_code,
>>>> + .get_fmt = v4l2_subdev_get_fmt,
>>>> + .set_fmt = ov05c10_set_pad_format,
>>>> + .enum_frame_size = ov05c10_enum_frame_size,
>>>> + .enable_streams = ov05c10_enable_streams,
>>>> + .disable_streams = ov05c10_disable_streams,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_ops ov05c10_subdev_ops = {
>>>> + .video = &ov05c10_video_ops,
>>>> + .pad = &ov05c10_pad_ops,
>>>> +};
>>>> +
>>>> +static const struct media_entity_operations ov05c10_subdev_entity_ops = {
>>>> + .link_validate = v4l2_subdev_link_validate,
>>>> +};
>>>> +
>>>> +static const struct v4l2_subdev_internal_ops ov05c10_internal_ops = {
>>>> + .init_state = ov05c10_init_state,
>>>> +};
>>>> +
>>>> +static int ov05c10_init_controls(struct ov05c10 *ov05c10)
>>>> +{
>>>> + struct i2c_client *client = v4l2_get_subdevdata(&ov05c10->sd);
>>>> + const struct ov05c10_mode *mode = &supported_mode;
>>>> + struct v4l2_fwnode_device_properties props;
>>>> + struct v4l2_ctrl_handler *ctrl_hdlr;
>>>> + s64 pixel_rate_max;
>>>> + s64 exposure_max;
>>>> + s64 vblank_def;
>>>> + s64 vblank_min;
>>>> + u32 max_items;
>>>> + s64 hblank;
>>>> + int ret;
>>>> +
>>>> + ret = v4l2_ctrl_handler_init(&ov05c10->ctrl_handler, 10);
>>>> + if (ret)
>>>> +         return ret;
>>>> +
>>>> + ctrl_hdlr = &ov05c10->ctrl_handler;
>>>> +
>>>> + max_items = ARRAY_SIZE(ov05c10_link_freq_menu_items) - 1;
>>>> + ov05c10->link_freq =
>>>> +         v4l2_ctrl_new_int_menu(ctrl_hdlr,
>>>> +                                NULL,
>>>> +                                V4L2_CID_LINK_FREQ,
>>>> +                                max_items,
>>>> +                                0,
>>>> +                                ov05c10_link_freq_menu_items);
>>>> + if (ov05c10->link_freq)
>>>> +         ov05c10->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>> +
>>>> + pixel_rate_max =
>>>> +         link_freq_to_pixel_rate(ov05c10_link_freq_menu_items[0],
>>>> +                                 supported_mode.lanes);
>>>> + ov05c10->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
>>>> +                                         V4L2_CID_PIXEL_RATE,
>>>> +                                         0, pixel_rate_max,
>>>> +                                         1, pixel_rate_max);
>>>> +
>>>> + vblank_def = mode->vts_def - mode->height;
>>>> + vblank_min = mode->vts_min - mode->height;
>>>> + ov05c10->vblank = v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops,
>>>> +                                     V4L2_CID_VBLANK,
>>>> +                                     vblank_min,
>>>> +                                     OV05C10_VTS_MAX - mode->height,
>>>> +                                     1, vblank_def);
>>>> +
>>>> + hblank = (mode->hts > mode->width) ? (mode->hts - mode->width) : 0;
>>>
>>> Here your hts uses 640 but width is 2888, which means hblank is set to 0
>>> here. This is wrong, please fix your configuration.
>>>
>>>> + ov05c10->hblank = v4l2_ctrl_new_std(ctrl_hdlr, NULL,
>>>> +                                     V4L2_CID_HBLANK,
>>>> +                                     hblank, hblank, 1, hblank);
>>>> + if (ov05c10->hblank)
>>>> +         ov05c10->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
>>>> +
>>>> + exposure_max = mode->vts_def - OV05C10_EXPOSURE_MAX_MARGIN;
>>>> + ov05c10->exposure = v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops,
>>>> +                                       V4L2_CID_EXPOSURE,
>>>> +                                       OV05C10_EXPOSURE_MIN,
>>>> +                                       exposure_max,
>>>> +                                       OV05C10_EXPOSURE_STEP,
>>>> +                                       exposure_max);
>>>> +
>>>> + v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_ANALOGUE_GAIN,
>>>> +                   OV05C10_ANA_GAIN_MIN, OV05C10_ANA_GAIN_MAX,
>>>> +                   OV05C10_ANA_GAIN_STEP, OV05C10_ANA_GAIN_DEFAULT);
>>>> +
>>>> + v4l2_ctrl_new_std(ctrl_hdlr, &ov05c10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
>>>> +                   OV05C10_DGTL_GAIN_MIN, OV05C10_DGTL_GAIN_MAX,
>>>> +                   OV05C10_DGTL_GAIN_STEP, OV05C10_DGTL_GAIN_DEFAULT);
>>>> +
>>>> + v4l2_ctrl_new_std_menu_items(ctrl_hdlr, &ov05c10_ctrl_ops,
>>>> +                              V4L2_CID_TEST_PATTERN,
>>>> +                              ARRAY_SIZE(ov05c10_test_pattern_menu) - 1,
>>>> +                              0, 0, ov05c10_test_pattern_menu);
>>>> +
>>>> + if (ctrl_hdlr->error) {
>>>> +         ret = ctrl_hdlr->error;
>>>> +         dev_err(&client->dev, "V4L2 control init failed (%d)\n", ret);
>>>> +         goto err_hdl_free;
>>>> + }
>>>> +
>>>> + ret = v4l2_fwnode_device_parse(&client->dev, &props);
>>>> + if (ret)
>>>> +         goto err_hdl_free;
>>>> +
>>>> + ret = v4l2_ctrl_new_fwnode_properties(ctrl_hdlr, &ov05c10_ctrl_ops,
>>>> +                                       &props);
>>>> + if (ret)
>>>> +         goto err_hdl_free;
>>>> +
>>>> + ov05c10->sd.ctrl_handler = ctrl_hdlr;
>>>> +
>>>> + return 0;
>>>> +
>>>> +err_hdl_free:
>>>> + v4l2_ctrl_handler_free(ctrl_hdlr);
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static int ov05c10_parse_endpoint(struct device *dev,
>>>> +                           struct fwnode_handle *fwnode)
>>>> +{
>>>> + struct v4l2_fwnode_endpoint bus_cfg = {
>>>> +         .bus_type = V4L2_MBUS_CSI2_DPHY
>>>> + };
>>>> + struct fwnode_handle *ep;
>>>> + unsigned long bitmap;
>>>> + int ret;
>>>> +
>>>> + ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
>>>> + if (!ep) {
>>>> +         dev_err(dev, "Failed to get next endpoint\n");
>>>> +         return -ENXIO;
>>>> + }
>>>> +
>>>> + ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>>>> + fwnode_handle_put(ep);
>>>> + if (ret)
>>>> +         return ret;
>>>> +
>>>> + if (bus_cfg.bus.mipi_csi2.num_data_lanes != supported_mode.lanes) {
>>>> +         dev_err(dev,
>>>> +                 "number of CSI2 data lanes %d is not supported\n",
>>>> +                 bus_cfg.bus.mipi_csi2.num_data_lanes);
>>>> +         ret = -EINVAL;
>>>> +         goto err_endpoint_free;
>>>> + }
>>>> +
>>>> + ret = v4l2_link_freq_to_bitmap(dev, bus_cfg.link_frequencies,
>>>> +                                bus_cfg.nr_of_link_frequencies,
>>>> +                                ov05c10_link_frequencies,
>>>> +                                ARRAY_SIZE(ov05c10_link_frequencies),
>>>> +                                &bitmap);
>>>> + if (ret)
>>>> +         dev_err(dev, "v4l2_link_freq_to_bitmap fail with %d\n", ret);
>>>> +err_endpoint_free:
>>>> + v4l2_fwnode_endpoint_free(&bus_cfg);
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static int ov05c10_probe(struct i2c_client *client)
>>>> +{
>>>> + struct ov05c10 *ov05c10;
>>>> + u32 clkfreq;
>>>> + int ret;
>>>> +
>>>> + ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10), GFP_KERNEL);
>>>> + if (!ov05c10)
>>>> +         return -ENOMEM;
>>>> +
>>>> + struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>>>> +
>>>> + ret = fwnode_property_read_u32(fwnode, "clock-frequency", &clkfreq);
>>>
>>> Maybe it's better to separate this part fwnode and GPIO code into a
>>> standalone function?
>>
>> I don't mind, the probe() function isn't very long anyway.
>>
>>>> + if (ret)
>>>> +         return  dev_err_probe(&client->dev, -EINVAL,
>>>> +                               "fail to get clock freq\n");
>>>> + if (clkfreq != OV05C10_REF_CLK)
>>>> +         return dev_err_probe(&client->dev, -EINVAL,
>>>> +                              "fail invalid clock freq %u, %lu expected\n",
>>>> +                              clkfreq, OV05C10_REF_CLK);
>>>> +
>>>> + ret = ov05c10_parse_endpoint(&client->dev, fwnode);
>>>> + if (ret)
>>>> +         return dev_err_probe(&client->dev, -EINVAL,
>>>> +                              "fail to parse endpoint\n");
>>>> +
>>>> + ov05c10->enable_gpio = devm_gpiod_get(&client->dev, "enable",
>>>> +                                       GPIOD_OUT_LOW);
>>>> + if (IS_ERR(ov05c10->enable_gpio))
>>>> +         return dev_err_probe(&client->dev,
>>>> +                              PTR_ERR(ov05c10->enable_gpio),
>>>> +                              "fail to get enable gpio\n");
>>>> +
>>>> + v4l2_i2c_subdev_init(&ov05c10->sd, client, &ov05c10_subdev_ops);
>>>> +
>>>> + ov05c10->regmap = devm_cci_regmap_init_i2c(client, 8);
>>>> + if (IS_ERR(ov05c10->regmap))
>>>> +         return dev_err_probe(&client->dev, PTR_ERR(ov05c10->regmap),
>>>> +                              "fail to init cci\n");
>>>> +
>>>> + ov05c10->cur_page = -1;
>>>> +
>>>> + ret = ov05c10_init_controls(ov05c10);
>>>> + if (ret)
>>>> +         return dev_err_probe(&client->dev, ret, "fail to init ctl\n");
>>>> +
>>>> + ov05c10->sd.internal_ops = &ov05c10_internal_ops;
>>>> + ov05c10->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
>>>> + ov05c10->sd.entity.ops = &ov05c10_subdev_entity_ops;
>>>> + ov05c10->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>>>> +
>>>> + ov05c10->pad.flags = MEDIA_PAD_FL_SOURCE;
>>>> +
>>>> + ret = media_entity_pads_init(&ov05c10->sd.entity, NUM_OF_PADS,
>>>> +                              &ov05c10->pad);
>>>> + if (ret)
>>>> +         goto err_hdl_free;
>>>> +
>>>> + ret = v4l2_subdev_init_finalize(&ov05c10->sd);
>>>> + if (ret < 0)
>>>> +         goto err_media_entity_cleanup;
>>>> +
>>>> + ret = v4l2_async_register_subdev_sensor(&ov05c10->sd);
>>>> + if (ret)
>>>> +         goto err_media_entity_cleanup;
>>>> +
>>>> + pm_runtime_set_active(&client->dev);
>>>> + pm_runtime_enable(&client->dev);
>>>> + pm_runtime_idle(&client->dev);
>>>> + pm_runtime_set_autosuspend_delay(&client->dev, 1000);
>>>> + pm_runtime_use_autosuspend(&client->dev);
>>>> + return 0;
>>>> +
>>>> +err_media_entity_cleanup:
>>>> + media_entity_cleanup(&ov05c10->sd.entity);
>>>> +
>>>> +err_hdl_free:
>>>> + v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
>>>> +
>>>> + return ret;
>>>> +}
>>>> +
>>>> +static void ov05c10_remove(struct i2c_client *client)
>>>> +{
>>>> + struct v4l2_subdev *sd = i2c_get_clientdata(client);
>>>> + struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>>> +
>>>> + v4l2_async_unregister_subdev(sd);
>>>> + media_entity_cleanup(&sd->entity);
>>>> + v4l2_ctrl_handler_free(ov05c10->sd.ctrl_handler);
>>>> +
>>>> + pm_runtime_disable(&client->dev);
>>>> + pm_runtime_set_suspended(&client->dev);
>>>> +}
>>>> +
>>>> +static int ov05c10_runtime_resume(struct device *dev)
>>>> +{
>>>> + struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>>> + struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>>> +
>>>> + ov05c10_sensor_power_set(ov05c10, true);
>>>> + return 0;
>>>> +}
>>>> +
>>>> +static int ov05c10_runtime_suspend(struct device *dev)
>>>> +{
>>>> + struct v4l2_subdev *sd = dev_get_drvdata(dev);
>>>> + struct ov05c10 *ov05c10 = to_ov05c10(sd);
>>>> +
>>>> + ov05c10_sensor_power_set(ov05c10, false);
>>>> + return 0;
>>>> +}
>>>> +
>>>> +static DEFINE_RUNTIME_DEV_PM_OPS(ov05c10_pm_ops, ov05c10_runtime_suspend,
>>>> +                          ov05c10_runtime_resume, NULL);
>>>> +
>>>> +static const struct i2c_device_id ov05c10_i2c_ids[] = {
>>>> + {"ov05c10", 0 },
>>>> + { }
>>>> +};
>>>> +MODULE_DEVICE_TABLE(i2c, ov05c10_i2c_ids);
>>>> +
>>>> +static struct i2c_driver ov05c10_i2c_driver = {
>>>> + .driver = {
>>>> +         .name = DRV_NAME,
>>>> +         .pm = pm_ptr(&ov05c10_pm_ops),
>>>> + },
>>>> + .id_table = ov05c10_i2c_ids,
>>>> + .probe = ov05c10_probe,
>>>> + .remove = ov05c10_remove,
>>>> +};
>>>> +
>>>> +module_i2c_driver(ov05c10_i2c_driver);
>>>> +
>>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>>> +MODULE_AUTHOR("Venkata Narendra Kumar Gutta <vengutta@amd.com>");
>>>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>>>> +MODULE_DESCRIPTION("OmniVision OV05C1010 sensor driver");
>>>
>>> OV05C10
>>>
>>>> +MODULE_LICENSE("GPL");
>>>
>>> Hi Sakari,
>>>
>>> Seems there are already several camera sensors using page-based registers.
>>> Is it a good idea to add page support in CCI interface?
>>
>> Sounds like a good idea as such but I'm not sure how common this really is,
>> I think I've seen a few Omnivision sensors doing this. If implemented, I
>> think it would be nice if the page could be encoded in the register address
>> which V4L2 CCI would store and switch page if needed only. This would
>> require serialising accesses, too. There's some room in CCI register raw
>> value space so this could be done without even changing that, say, with
>> 8-bit page and 8-bit register address.
> 
> Ack. I've worked on a driver for the AP1302 external ISP, which also
> uses pages registers. The full address space spans 32 bits though, but
> fortunately the driver doesn't need to access anything above 0x00ffffff.
> 
> --
> Regards,
> 
> Laurent Pinchart


