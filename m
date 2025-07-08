Return-Path: <linux-media+bounces-37133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7CDAFCF4B
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 17:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D5E43A451E
	for <lists+linux-media@lfdr.de>; Tue,  8 Jul 2025 15:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92CC6269CE1;
	Tue,  8 Jul 2025 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QUFhFI8Q"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2063.outbound.protection.outlook.com [40.107.236.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417021B908;
	Tue,  8 Jul 2025 15:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751988701; cv=fail; b=c1nRSoUHxvL2ZZLzEgYdaL8zyvcgugAL7XDc+hiBKe7ic3k4Ae0bAz2klf20W+IIX7JdU7kx+m11aKDfUrKPI5mOWp7kS9CWTaYiaxjPleoPiHRoqX6vuOq2gd5Zebc/Tboo1QLHlCk72M0PpBeuC7SpWU3PRQy4JhHK2xAWdpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751988701; c=relaxed/simple;
	bh=/31gWu2ZMI9fJJrIyf6TwYK088gYetRu/yV8O9mKNS4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Fa7C8R2JjkWzmdOjcCiLUg+uVvtGWJAZZymhfVh8egNUaThjnpcjOY+Dmy52iEVsBMHxjzyNijflpQKo3iieWPBvn/Apc5qHU1UGIXV97MeCRr8uXmpePGFbnrGkqhQbrDJBBfgs0h+1rC7BAdBBX5xOHbKkkj48jhTpUJ1qKSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QUFhFI8Q; arc=fail smtp.client-ip=40.107.236.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjSr8C4h+3Zdv1L8u7SAQMz3M1hjIrwUIFVMnVCPEiGlpn99/IBDdBJYEuz7YdGvtTkA4XH4VFQpU8eJjQQbJilWR4svCqwbci9Q4gOJ+Ugu95Ox5WEBPAhZZcFheDrdmMJRT9caAWy0SBK8BlucrBe1V3DXOge0WJwo5VngK1e1e8ITWv/T5DQDWQOuOy1sMY1cekQXOV225wuEKsGoYkQWd0NrolHW6ZH3Of6XNIzwy2f+8YuyWp5RMQ2vnbB5LH4SajaEWzppd12it0WNPKp8ECFz2iU5kFZP8LizR4hgatbUahg5TdG0oUQ794wab4YLo1Y5g/esXzKONhLXhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBVNirctPxRihHynhU4do1VtiphSIO2eNneqMGmvzQE=;
 b=u9tRPQby0DiNmL5z3m7ofAhBUvjex6DKuBmOMec0ekV8fAuQgRp6Ax0Cjeahjy+bBae1YtHlykd5K7WgvLrLt7YHUoHE1/p34ge/9ouzbSbW1/Vtymjg0iGOeJInnzpNSrlPiTrELqhZXowB9H7D6CaS2m94GyRdSY96Ge395UK2Ndj/NqADyzMtH0HZXPKF39xwUvor8RA4neSsZwlANYGY7v5x5AN7vDxeie1vwOJNxKBBSv7JcosvTQBzVa9URcDVmq/98zY62s+DqVwI0OhUlB5bOd7Di/tFzTXMIeViXA+tI5MdB0hy8a6REr/XDXXcroo0P2edkaBIEcvwtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBVNirctPxRihHynhU4do1VtiphSIO2eNneqMGmvzQE=;
 b=QUFhFI8QNAmZEP5ZfwcPy0vtZJS0tT+yk8AJiWR/eyyPmrlcvjKM7peMZsfIGG1DrLN6jIGdAWlFTRnXJwHCQs3roUC3WFQ7UqFrI7pd4D0MkZWVkzbMOo7LwmZEzbXdqqRmB2OaGMN1mgMaXZlPxRO8xtVIWjsLAPk3DW8RnyI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by IA1PR12MB7592.namprd12.prod.outlook.com (2603:10b6:208:428::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 15:31:36 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 15:31:36 +0000
Message-ID: <402179e6-2195-4750-a731-d620c86818fd@amd.com>
Date: Tue, 8 Jul 2025 11:31:33 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Yan, Dongcheng" <dongcheng.yan@linux.intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hao Yao <hao.yao@intel.com>, Pratap Nirujogi <pratap.nirujogi@amd.com>,
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
 <f6d1d8f7-d953-4f86-a196-f713726bd5f8@amd.com>
 <ec790d0e-4bdb-49b9-80ad-f44e1b700a5e@linux.intel.com>
 <702594a4-ebc3-471e-8551-d94f0dee2982@amd.com>
 <0d45fca3-5b6f-42e5-acec-bca2dda25f15@linux.intel.com>
 <aGTN5PbfyHTw529O@svinhufvud> <91985c5e-fc69-4d12-b5b0-3dff0ba1b078@amd.com>
 <aGo9sDWSiZGvOhR4@kekkonen.localdomain>
Content-Language: en-GB
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <aGo9sDWSiZGvOhR4@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0484.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::7) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|IA1PR12MB7592:EE_
X-MS-Office365-Filtering-Correlation-Id: 53fbc0f4-3ad6-4141-fac3-08ddbe348678
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZlZKWEtQUm42WVBPWVpyQzVuQ0FZYWEzS2hXZEZ0eUl4QzE3bTIrbVAyemVy?=
 =?utf-8?B?MWNQR09EZngwOUE0OUEwQmZVUEU1N3NNWFg3YkRRL1JKcXorM0RNZ3RoU3VJ?=
 =?utf-8?B?SEs1aTdDMWRac1c0QVUwSXdCdFZESld0NmpwNVhaSk15VnYxQTVXcm4yUWcy?=
 =?utf-8?B?R01zWTJaMDZCUTRZWmpmbXhWaHpsNW04S29lelp3bzJWRFdtMXF6MGt0Z0dF?=
 =?utf-8?B?Nm9qd2g3VHVuMmZWVTY1Q3NRWjNKc2t3RlUxSUE3ZFp6OGJHNGs4S3c4bDZS?=
 =?utf-8?B?Y0Z2MUNNRExaV3RPbzJmRW8yQVZUZGpVcnEvQzJBMEJpNjZQYVVFaUpLQUFh?=
 =?utf-8?B?d3UxVGQ4SDJuVFVPczV5bGFicC96QkNLMXhmZW9iWkliUlQyTndlaklnb1pw?=
 =?utf-8?B?RHhQOStVZS9ZMkVVZTJOZFMvVTdMd3A0SVVtV2E3dGpBdlBsSU52MHNsYkZI?=
 =?utf-8?B?NjZTNnBNTm9tQ3c2cUZHZEFHSFJyOHBJSmc1OXA4K0xUZUZNN0hhM1hna1hx?=
 =?utf-8?B?NTRMdVYxZmlXdS9USDZkVmhpUWkxeFFEQzY2NlJOOGQveGlrNzlES3F2NkhZ?=
 =?utf-8?B?L0RaT0NFNEhIUDlQdmFJRjJsUFZHeEFyWmF0RXY5bmxVaGhxMjJOV2VUUzdz?=
 =?utf-8?B?WEh5ZEtmdnpvZUtNYkRSL0ZRekFiUHJiTGkxQURRMERrOWJwc0tVK0M0VTI5?=
 =?utf-8?B?Umd0ZXpFaHI3SnJvcFpjVkIzYmZIalZGZGRKS0hRdW1COWxwVnVWZ1JDaG9L?=
 =?utf-8?B?VGEzdTBPMEllVm5aV0VwK0lUcEtLa0dJTW5lTXd2Nk8rZ1dyQnlrdmxRSzF0?=
 =?utf-8?B?N05UWEszd2tHdFFlUG51d2ZJNTcrSnUrWis1ZlBOM0g3YXVQZDhqNkswMnFH?=
 =?utf-8?B?eSs2d25ySzg3UUE0ZnVJMkpKblVURWxKUXNzMmlKUEVtaFhtMG9vaFQxMmZo?=
 =?utf-8?B?aEpnRkdZR2FpV1kvNHo4aU5yMmFxM24zVmZQQ3hiek1tOFlhSldwS0VoZmY4?=
 =?utf-8?B?bzhROW12L3FneHlEN2E4a2RNSEE4RFpHY0ZmYXYzS1p6UlN0RzVNa1dnK3hQ?=
 =?utf-8?B?WHE2bnlRbkNWeG01MnljOXRRZUhZRmJuUWlNZGR1ZmgzUjdBVVIzMkpoZTNU?=
 =?utf-8?B?SmxmSEYzZW5sSzdYa0Z1ZzNuelJMa1VvSCt0MUZWaDZGbjNURkU2NWF3OEpD?=
 =?utf-8?B?NnI2QmhKbm9BTy81a0NDbnBWekExWDdiUC9ab0xnOVpiTlJOeGlCQUlFMnBu?=
 =?utf-8?B?bGU5ZDJJQXpLYzh4Nk1PRWE5ZnY0UFR5cWJ3WFB3SC9UMXplWURRV0gyMFZF?=
 =?utf-8?B?WVpqdW85SURDTDIyUXNjUlBzNlA0MFRGRDVOWDRwclhRK0VOajZRdFAzU2lo?=
 =?utf-8?B?VXVNRy9LQ0t4eUQxTnQ1SDB4cnYvR1FaeDB1eldoajc0Q3EvMHMwKzFCeFlV?=
 =?utf-8?B?WTFkMUltcGF0OU1UR0dwd2F0STIyMjNkd2JBRmdYdXNnbVBmVzlJclVzWmlv?=
 =?utf-8?B?NWFpeVFhb0xsRUFiZDJHWFhaVkFSUCtoWGQwKzVGTWlDaUZxa1VMRENLODM2?=
 =?utf-8?B?bkU3eWkxbVlJejU0V1l4bzlzdkJkdzZsaWVKWW01MGNqTnJ2UFo2cEpjZG82?=
 =?utf-8?B?Y1pTTDdsMi9nN3owNU5BUUxIZXVlenlTL0NOQ3ZvM1JwZ0VqeHVuVEFrUldT?=
 =?utf-8?B?UGFNcWJOZW1mT3VSd1g4dWozemlpdUZyUjdWUUxSU1UzY3VaSGlENGFRbUdJ?=
 =?utf-8?B?WWh6WFVMcHZrZVM3eWhpaUlXb2daWHRGWVZnNlJIbWxXc2llOXFyd2Z6YnpQ?=
 =?utf-8?B?TWVsRFd5b3ptSTA4MmZxRDJqc3JPdCtDZzNxeGpCRk1BUUtlWGJIYTRGczBX?=
 =?utf-8?B?TFRadUYxSXdyUmFGbWt6ZjBHRzcyRWcrZTZySi9lSjhyK0c3Q1hOMStRZ09N?=
 =?utf-8?Q?auH7vqa0DZw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SXVMN2pSSDV2RC9pVmJmRXpRa3VJd1E0LzBkaGpEMDdaaU5BNVQvdGttbUdD?=
 =?utf-8?B?aVp3aHFncWR1Zlllb3M3SExWRlBOckk1R1JaYk4wbmZMKzNwTTlFbzlyeUlN?=
 =?utf-8?B?b1A4MGUvK1ZEZ1FsdWpMY1I0VCtFM0R3VTd0WHVhVFVjNFozZ1hBUnV5TVJG?=
 =?utf-8?B?YjdPQS95NnpacmZMaUhLejU1eWhPdXk5RU41b2g1eXB5UGQzREVFWVdzbkZw?=
 =?utf-8?B?MnpEaU1sdG5CRm5QbEpLQjRoQXMwMFZaQUt4RlVjWGJodFBmK3oyQ0lYd1Ew?=
 =?utf-8?B?cTkvSmNGdUFpdThIWDVSRGErZzhLcEtoQk9lWGhRTlZ1Z2lNcGdGUHgzSURQ?=
 =?utf-8?B?ZjU0VlJTTVY4TXdPUllyOGlBNFFJa2VXdUlic3gvWWt0VjNXczlSNTFzWG96?=
 =?utf-8?B?OG51NUY1RGpYMTk0VzRBZ05aMkN4RGkwcW9KUUd2Y0pZM0hQdTJWRFpIaUU1?=
 =?utf-8?B?MW4yYmFLUEU1U1NCU3Rqa0x1Rnp4M094YkdPRkRMVHdKcWgwMHAzc0tUMC9a?=
 =?utf-8?B?ZEJMSUJYN0ZRTnZnZDNjUThRQ1Q2enhraXlRQWhGTnhERnRNMFdwaEVUSUlO?=
 =?utf-8?B?U3oramp5VGQ4VUtjRDN2TjFVZjJFZk9vVFlKRlpEM1NFak9hNklva3FaaVRI?=
 =?utf-8?B?VHZHcnVSRjR3UGhkSUVPcW4rS3hNaXAzTWRITVNiK1plZkNLcnZERWZqZllt?=
 =?utf-8?B?SXhQMTBZSTBhdnIxL1NsOVcvMlZWK0F0WU95N0dZLzE0YldkLzlNV2JxU1Yz?=
 =?utf-8?B?eS9WQlVUaVcwQVlLU3pqUHFhcmhSV2U1OXIxdFZ5dWVTV0l2WDg0RFhrZzJL?=
 =?utf-8?B?ak9HaGdjYWhyNmxCYUlPZzlmci80Nko4L2gwU2pKV2hwMHdRWWNITFI0SHVn?=
 =?utf-8?B?d0ZNUnQ0OXBqVXg5SEVTWk9LSHJkdGY4d1lPb2dKNk56TDg4Rmt0aGYzUFF6?=
 =?utf-8?B?RzdJY0xjRVpJcFJyU3pJR0VraFQ0VmZkL2VIbER0TVc4Y2tFU2hBR3Rua2xK?=
 =?utf-8?B?RWhXR0p4WFRJWXpPNkQxWjRDdWwxZ3o4WThJWHFlYjZKU0FhMzc3ZW5yOTl6?=
 =?utf-8?B?THpIaDAyNVpwbW9aVWhiRUpkUWdBNHMvL0RyUk5IRnF6cG5kdysxdnMzY0lQ?=
 =?utf-8?B?QVdJSFdOTllDK2hFR0ZkaldMSVdJMlFaVHR1WDBQdzMvYldqdTZsdUhCSUk4?=
 =?utf-8?B?dnV0UVdXMlVmNXZlZ01vd1ROc2tyWWhaY3hzOUZ1U3llYlF2T2NBVFFGY3Ji?=
 =?utf-8?B?bkdjdERIcHM1cE1DWThPK2RuaHBYWU9HUGhNeVhCSVpBVTc2M2pWOTBtdWYv?=
 =?utf-8?B?YXRBdW0xVkJ2RklHSVZBTzNJRkxwVzBpNWNQWnYvRFNOaHZRZ1I5bjhIVVly?=
 =?utf-8?B?U3ZRaVkwcG1NZm1acUVkZkZDYjBtdmVoSlNIWHlLMndzeWhibDd3ZTB1Mi9P?=
 =?utf-8?B?SFRDeXhyUlBTN2ZuQ3JmYTRqUlR1Q0dYVHBVMENDdUhGRjlBVnh4VjhmZzZ4?=
 =?utf-8?B?Q3oxYUlFdU5pc2x5UjI0M1NNRGlFNTlPNUE3ZUk3bkdCTFZPRVJQTWZleFVF?=
 =?utf-8?B?WEQ2VzUwTkt6ZFU0Vm5YNmtEbEdHTWo2QmRXL3IwVGVKNXZCcGpHZ2hqQ2kw?=
 =?utf-8?B?YzNCaS9BQlYrbTBiaXZiSjlRcFFNR0w5bVcwSnlZamlaMUF5Qkdyb0NoajNX?=
 =?utf-8?B?aFFpQStzdkpoNjJ0c0V2SlJObXZaU3F4cDRDZW4vemJLdVluKy85RTJrWDU4?=
 =?utf-8?B?RXNvSG85RTdNMGdwYkVIS0J0V3JDZEdWZ3hyTlR6LzlLV0ZGQjRSS0g1RUIv?=
 =?utf-8?B?TUNwMWdVNU1pbmRibmgvKzJCWFkzTlVMaWpYZzBOUEFNQ0oxbTI3eWFnbTdy?=
 =?utf-8?B?SWJUQ0RTNlJYRmRwcGdZSW10MTU2QmwxeVpmNGh5R1JpeUJvNUVxeFFYZTZ3?=
 =?utf-8?B?OEhmb0xRYlppSHRBektFRG1zc2dJd2NDbWdiY0ZOdkZaa3oxRk1MMS9zS3Ra?=
 =?utf-8?B?T00rQVpSSjZEYUd5R1BUZitLcDlkYmM3S09pMU9WTzJSZmVDY0k5VzV6Vmt3?=
 =?utf-8?B?L1BCRU9XWEQ2ZTNWWHVYTGpDclRPMjJiQnhPbFcxaHFIMlJZM3Z1c3d4Qys5?=
 =?utf-8?Q?bV9bPCxFyWkeKMaY++tSYe2Ei?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53fbc0f4-3ad6-4141-fac3-08ddbe348678
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 15:31:36.2247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JRutSaf2PI+c3C4/S35FG7hCgzRaFOvj7DcQwM+swK4gqsnDBehpBzKTlHgBVyHqJD8TnwOrij64KhQkI9XpuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7592

Hi Sakari,

On 7/6/2025 5:11 AM, Sakari Ailus wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> Hi Pratap,
> 
> On Wed, Jul 02, 2025 at 12:47:40PM -0400, Nirujogi, Pratap wrote:
>>>> If you have a spec of OV05C10 (I assume you do, as the developer of this
>>>> driver), it is not a issue.
>>>> Take P0:0x14 as an example, it's named as DPLL_NC_SEL in spec and set to
>>>> 0x78 in your reglist ov05c10_2888x1808_regs. If define all named
>>>> registers rather than the confusing magic hardcode, the driver code will
>>>> be more readable and easy to review.
>>>> I think this is what Sakari thought.
>>>
>>> Yes. And even if it happens that a register write slips to a wrong list,
>>> we can fix it later.
>>>
>> I agree with the suggestion on proper naming of register offsets, but
>> unfortunately we lack access to the spec. We are completely relying on the
>> sensor vendor for these sequences, which they are not willing to share the
>> details.
> 
> I find it difficult to believe a company such as AMD would use a camera
> sensor without having documentation on it. It is essentially required for
> hardware design, too.
> 
> Have you asked around?
> 
Yes, I checked internally too and sorry to say that we don't have 
register programming guide (aka the register list definition). All 
programming sequence are a result of FAE engineer from OV providing to 
AMD based on the usecase requirements.

Thanks,
Pratap

> --
> Kind regards,
> 
> Sakari Ailus


