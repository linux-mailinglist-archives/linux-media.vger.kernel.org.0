Return-Path: <linux-media+bounces-35452-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FDBAE118E
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 05:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 825157AEED0
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 03:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AE1B1C861A;
	Fri, 20 Jun 2025 03:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="kJGEoGZG"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01AE12D758;
	Fri, 20 Jun 2025 03:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750388902; cv=fail; b=po0W5GUEDDjfGdmEeKHXqbesWubRgKcABJkO2c/RGBF/cZYDAETlamV1B9qBEqn753gXPcCktCgFCzF6NXLmZ6+qdGr7+2U5vOAyzZa2c4EJuGWXIKRN+4CKIya7cHL+TpeM489hJO6Owf7kbzY8m0deV/4cQp7rO26beSQaX+Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750388902; c=relaxed/simple;
	bh=/E6GRLpMpz45SyxmKERIn4JyGbuc+C/0S5WDxQ+wSvk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=j3WiNe9eSx5hAOCdVZCQbXDXAYv8xTLP5VJGNooNehSRVRFwlqz3EVLf11IdtGHAK9Em0mmrEIdVMJNFge9IbMl8J88wQFtYb9Ld7o1XPqb927y55W9GhwpbYV3m2sRfeUhpUvDlnaYXJfqUv0NiNrNRM2CobQQ9FOex7aK1qf8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=kJGEoGZG; arc=fail smtp.client-ip=40.107.223.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtGqOVXfaLsIErvFrUGN4SqtTJcXp3MVrtpbqv6IV8+Ca3ecGBovg+293IX9o66mU76DecvtkFjV/xCPdFMzflFgEvx9IBMkGi/eIeNQSPpcfQoNK4navgPRaHPpUvMb9DE8ddfnGAXBTklfLfG4WZ4gd1IxR/C9NlPcI7AOFWxo5+S+DDq0pPgIvEkFQaESRah+hqLi2+Br3w7zGymiQfl/jwVolwRdajV1eF5IuxDCDhsEwl+vENsyQMFkXTsMIDGxSDUc+B6SQgER+Kp0ZM6+l5hy88L9t6fsjN7CYZmpT/fu8HE1R5RNnYM2BP+i/yxVql3f/+4QpLInXBta0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MYIIupb+SuC3AXDWlj4mb5EqUF0YUUhebdSlAMhIhZk=;
 b=vC19vB59QqNkbvy38/uCeEGAyZwMBPuxEov8wyrR2LPtS3TboT7sVNFeaDAtrGlCOrOcq0eERrd6pxCYaOEPSf92srtsBJ/74bf91gF6NGPCfE1MyUg2bruHaZ+cvMDmNOx/Nwfpr/FX61S9hRXhSrqcCERcSfkn+TKokILgwrod72ttQTHLevjHziG9mNgQ3iQBB+Sy7Ic/N51rXTR2910h0I9wrSkcOhLTXm6ZBw9IKRF8wmXl58OU+8DXK464qqiI4iEioLqDpRTkz3LTnD9wXFHFUiwNmA416u7buyMpNOdazTyPovD4pI3J/IUrcb3cUSFpo5Vv8DcvUN2+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MYIIupb+SuC3AXDWlj4mb5EqUF0YUUhebdSlAMhIhZk=;
 b=kJGEoGZGF75CdBCXVmY5pyz7u55yvHq0rbwlQMVuWpzYVvfOX4DTz1Alzco7nCBbCAWARkLDzUCo8n4TPdG+SHGhdNcE8Iv9QEC7cwzSp6z7WRQofD0Mj2P2kBEk5hHMSETWLO0NSLOeLwbV0ID2stnaEsA+nEorHTWIezbaNP0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by LV8PR12MB9713.namprd12.prod.outlook.com (2603:10b6:408:2a1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Fri, 20 Jun
 2025 03:08:16 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Fri, 20 Jun 2025
 03:08:16 +0000
Message-ID: <76ed9d9e-67f2-4d60-854b-ef998b5abd16@amd.com>
Date: Fri, 20 Jun 2025 11:08:09 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: platform: amd: Introduce amd isp4 capture
 driver
To: Mario Limonciello <mario.limonciello@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-2-Bin.Du@amd.com>
 <0c4240bd-4918-48b3-aa8c-3860fa62db00@amd.com>
 <68f481ff-3b99-4c21-964d-edb81b34452e@amd.com>
 <067d67e1-9a7a-4a98-8fc5-771664055ef3@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <067d67e1-9a7a-4a98-8fc5-771664055ef3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:4:186::15) To MW5PR12MB5683.namprd12.prod.outlook.com
 (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|LV8PR12MB9713:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8b584a-7e94-4701-6c5a-08ddafa7b355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVFZVVJ2MUN0YURqWW4vWm93cHlOZExpWDFPVzJjWFo0S01TMU9Db29Vb0gw?=
 =?utf-8?B?bE9iRlFVVkhycndYU1ZDdjlhREJXU3pIMGYxbU5zbGJXS3JGZFdWQUVVWTRh?=
 =?utf-8?B?VDhlSU9DMGpSSTZPc0RyVzR4d0N5U1ZzODJHQWNvZnNhdy9uVUFtWlo2Qm1C?=
 =?utf-8?B?VXVJRHdpZ2JPRGFodGFsbk1OdE5oWVZoUjRpNXVQZmdlZFFwMUhUS1IzN2lv?=
 =?utf-8?B?QlJ6cUtzR21GaUZvdnRuT0luR0huZFNDNDBQMkNnQjBGNmVGVUc1K2pOQ0lE?=
 =?utf-8?B?Z2Y3VEFjK1EzL09uSkExcHg3UFl2TUppOFRSUmYwV1dFL2lCV0pEcmZpZU9n?=
 =?utf-8?B?dmdnTGdKVEtUZ1QxMS8vTUpTOVFGU3JiK0lRQ0VUb2JhQlpmQnpYQnNrRVJO?=
 =?utf-8?B?V3U3cFdQcVRqTlQ2NEl5eTBwdEw3Y01SbVBTdXhzYzRlNk8yZlhLWGlmWisy?=
 =?utf-8?B?aFFWQ1pPZnp4WGFralpybVlGOHJ4OHQvbmFtcUdCRTBpRFg3eks2eDREVy9h?=
 =?utf-8?B?Mmp0MlZ2ZHB5V2k1dkp2RVlIR1h2S016dVF4NjZiUkt3cnpQMkVaZ05BbUZJ?=
 =?utf-8?B?bXdmU2VpN2tYNFZ3NUlkZVJ4MUcrMnRxdWZpV1RPR2tqTFRGN2hBR0pJcHJz?=
 =?utf-8?B?UTVhVWxtd0ZwRWZrQSs1eVg5K2pCSWRWVk9NelpCSnZhcEhIazhMUmVkWEdK?=
 =?utf-8?B?bzdmMVdoMENScHptTEllc0lKUVBOU0JPbWVuS0IvQjF1OEdwL1NqZ3l4NU9k?=
 =?utf-8?B?WXJtLzBtVHowVStmR0VJMUM0dVV1Z1djcGViYWhML1FBRU5FVXZiQk5kYitP?=
 =?utf-8?B?djdDK3FaTk1jd29LKzcycnBpUkg2S2k4TE5NRThZYlFPSHZGS1loT3p5Wk5S?=
 =?utf-8?B?UjFaSzVqMGE3QmhhdDFzY1JzVTlGYXpkeEVScUUzSHRwMmJsUVBhenhoYldT?=
 =?utf-8?B?cEdsTVpHdzBPWmFTRnBUdDdqRXdHNzlHS3dXdlhRVFRCZ3MwYmwwV0M2NmJH?=
 =?utf-8?B?Mlo0dzd1ZDBsMlRvTENXa1dkcDZpMlZRWU1RL3ZPaWRTMVhrbFQ3NXZsbEUz?=
 =?utf-8?B?RnZIYlkwUndUOVNZU0Q4YnNXNThaTGs1aThSMzNud3V0WmxMUEpENWhxVStL?=
 =?utf-8?B?Tlo4VFlQcEVUTmUxL0J6aWNoN2VXVGZaUXhUY3NneC9WenJ3cnQ1cVVOZ1JO?=
 =?utf-8?B?dlhsbVdVV0Q5eC9Ja1JNZGpOQzBXSVVMRHdkejRLM2NBS2lKUkFjREVLWklY?=
 =?utf-8?B?YmEycHpwbjAyc29GOENVTTE0WDV0YUhpSWdnaGNwamNPQlhTUmM2QnVJTVc5?=
 =?utf-8?B?VDBaSjFkRjNDbEQrWDdURHpxS0w2Z1kzUTU5eTNDMlc1Zk1wM0p5SlZ3ZDJq?=
 =?utf-8?B?S0toajJBZFlWVkJzWTJ6SU8xNVRpYmNScWNGeXRQV3Q0QUlMbDdrbVJOZFpu?=
 =?utf-8?B?WHViQ01yOXQwaWZwS2RUT1VibnJIVElRbXkrUmdlR1NDOE1XRmNrSUVUamNu?=
 =?utf-8?B?cGE4b3RWdWpsbUpKdklWb1RaMTVzcXNnOWxnMlJQSWNjbFpBVURvVkJVS3VR?=
 =?utf-8?B?RE1YNHJoNm1OSkxaWitxMVhJZjhOdkRIcnU3a2ZzZHZRYXR6emJzZG1UaTZE?=
 =?utf-8?B?VU9mTmtpSW1CSUNnOWprbTMzbEZMVVBkZi8vRHpaa3RMc3gzMTRBclZiWXlR?=
 =?utf-8?B?cEVIRVpoSitCK2JHNW9LM2g5UEFxWDFVK3R4ZWN4WUdrNG84S0E1MDlndlhm?=
 =?utf-8?B?WFFCUlNNQXYwUklTWVF4azQra1hocm1EOXVsTEU1M2NuR1UvRW0xdUZ0VFRK?=
 =?utf-8?B?NEZSVXBLdWFLRCtoQ240R2dSaG5LdFhjWXJiRW9UL3phekMwNVZJOWtDODVD?=
 =?utf-8?B?L0lhVDZUUkxEcnNoNGJGVW05RDhUZXBsWnlSQ3dwaFpzRGJEcEZ6cG5jMGVl?=
 =?utf-8?Q?9z87nqFv0Lo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXRXczN4b3l0dG9OYkNuWk1TWlRvRnpaOEdzQXdsMVdoZnRZVjRyTDNDTTQx?=
 =?utf-8?B?Z2Y5eEdIWDIzcGRVS3NsaGl2d0FxeFdVcGJqWUVvOHlrSFFtL3lGL2VNeWhj?=
 =?utf-8?B?czNhL0tEdXorM3FmbWtyYXR2WjZPU0VDKzh0R3VqWE9iUEUyTW9Ed21pcFVY?=
 =?utf-8?B?elJCc1hpTmlHUXVaT2JwaDBZdWFaQkxva2h2YjBIOGdZZklRVm1UbDNGUDds?=
 =?utf-8?B?RW5IMVRhYVRUeUVqWEtrSkY4OFJmc2VHbnlHUS82SkZFRS9HTEFpRnYzV0Zh?=
 =?utf-8?B?UnVlVHNlbEhpYnJZSllSU1hrdmRYeWJiRUF6bVZhWWpIRG94dnEvL3hPNUJy?=
 =?utf-8?B?b2Y2UU5CeFAzTkRCUjgwZCtjdlp0UHdpVmEyODNjbHBoV2wvODRYQkRISWFl?=
 =?utf-8?B?Ui9YNGk4NUxmMCtud3Z5ZnVJcFZqYWFJN21TbU02dERxOFhMVm5oQlNvTVZ0?=
 =?utf-8?B?SFhHN015VEhsaUpNYncrL2p3WGxCZHNqRkE2RXo4YWdEckVSblY2R3p4SzY3?=
 =?utf-8?B?SjE1OWZFeS9xcEpwOGk4a2s3WDgyY0JsUHM1ZGFITEJXTDRXOFdERjVkUWl1?=
 =?utf-8?B?RnQzdGdxbzNsTE5FY1BoQ25hbkVXK1FYdU5JMlJadzBHQnZTUklDZ0hCMlox?=
 =?utf-8?B?REJENTNaSTcrNlFleUVNbitSUmlkazMveWVuMEJTMWNZRk56bmVDUlUwYUVw?=
 =?utf-8?B?RlhRVWx2eFJnZDhFNkJjRk5wZnhBZVZlLzJtM2JWOGZNNUdEVW1oUjViWVBX?=
 =?utf-8?B?N243ZFZUMU9GNDZFcTRQSCtHRnEyRmpwbFVuUEREbnEzdFZPUG9acnJYb2FV?=
 =?utf-8?B?V0gweEllTFdiMG1IRnVib0tCV2ZKWDBPTzllTjF0a2ZpQTc2Yi84OEVYU1gw?=
 =?utf-8?B?MlE2dE15cWhJYXNYbkw1Y1g3THZvUWpOb0xhK0kyZUFzNUJpRnZyNzZCSDls?=
 =?utf-8?B?aEt5VExJd3hWemJzQmxOeVdFYisxdFpqeVJKUTdJVzM5Y3FOZmh0WE9mVnpx?=
 =?utf-8?B?ZGJYRndZVmNCWlV2MmtYZkZiK0lBNGszTlI4M05sb2U2cXdxakllSEd0V3ho?=
 =?utf-8?B?QW9DU3NmS1MwTXlWUUJSUkxQNGNibkxLSFY3c2tEY3FuSU5HWkFNMThvVlNO?=
 =?utf-8?B?TnUvUWV2MG44elRxSGcrek1aQzM2a0ZiWlpTSWVlaWdoYUpTYktWOWFjTEda?=
 =?utf-8?B?Rm5wOURjNTluakxrTUJ6UUNLRmVENncxdXl5L1JYMUU3dGpxa0ZCVUJPaVFN?=
 =?utf-8?B?SEtGeFZQaUVRbUtaMTlTNFhvSkpuSHhZektrNDBjcTl6SGdBU2hONjJaOHh4?=
 =?utf-8?B?c1lUM1hWbUQ4SDRZZXVneWR2M25GYXNVcGdURlVnbFJVeksveXRsNWZIY0Nq?=
 =?utf-8?B?Y2VvNzFTeE4xTVA1ZVJMMXR1cGY4eUNWVEJHYzZHZTBxVGJ2d0lDQkM2czFO?=
 =?utf-8?B?ZjJBdGliK0JvdFhGNkFJdXB1djFORUpMcFZNVTRzMmVvcFMrNEZIelg0VVFn?=
 =?utf-8?B?RmU2MXVyOWFJUzlSa0ZCL1drc0dsRXd1ckt6MjZxSHVvUDUzNnFlMC9VNEVz?=
 =?utf-8?B?Z2RoM2xlcG9sa1JDR05tbHJXWGVQRnlhQlp1bXVWbEI4ZVMvVG9jdngxL2x6?=
 =?utf-8?B?SXpqeVd6ZFZ4SlpIZG5xNEg5K3BDb3FzYURZUGNjZTdreER4Wmt3aG12aGlV?=
 =?utf-8?B?YkdsUzZWRTB1dGN2Q0VmSGMvS2hWVzFLdW52UmwzRlRKL0VGMjE4ck5KaGYv?=
 =?utf-8?B?RGZndlg4MEwvTm5FRDhmclBHQVJqU3VhcVRtai9USDlDWlZKbTY0TFJRT3Bv?=
 =?utf-8?B?b1J3TXVJM25jUndsVzBjSVpHUlZKWnB5a0t6NVRIdGM0bFNySmd1Q3RPSkJi?=
 =?utf-8?B?U1hSb1RHOFpWdGNZQzh4VEhpZmRGVmg4UkZOcUMvaXhvd1REaTlrcEdRMmhp?=
 =?utf-8?B?dDYxK2tpOHFFMXh5aDR5RlNKOWsrUVY5TEoyb0gwQVNaNlNkbHp1NzdJY1BD?=
 =?utf-8?B?WVNyNll6OXJjY1A1b2JUUDdGelBKVU5BU0k0dHNMbXc3bjFpY2FDMzQxdXRR?=
 =?utf-8?B?WHhHZ1lDeWp6SVZVekJJMHR2ckxTd1g1VlVKQXBEeDlBbUF2UmdLYUQ4U3d2?=
 =?utf-8?Q?ZqZs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8b584a-7e94-4701-6c5a-08ddafa7b355
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 03:08:16.2931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/0rYuchcpKke1u4TiLIttujKrHu923kC7SwXXOXTIA18/I7OmrK54+YQeFvvoLc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9713

Thanks Mario, just add one more comment for the CONFIG_WERROR

On 6/19/2025 9:00 PM, Mario Limonciello wrote:
> On 6/19/2025 2:46 AM, Du, Bin wrote:
>> Many thx Mario for your comments, really helpful, will address all of 
>> them in the next patch.
>> Add inline for some of your comments, pls check
>>
>> On 6/18/2025 11:58 PM, Mario Limonciello wrote:
>>> On 6/18/2025 4:19 AM, Bin Du wrote:
>>>> Amd isp4 capture is a v4l2 media device which implements media 
>>>> controller
>>>
>>> AMD
>>>
>>>> interface.
>>>> It has one sub-device (amd ISP4 sub-device) endpoint which can be 
>>>> connected
>>>
>>> AMD
>>>
>>>> to a remote CSI2 TX endpoint. It supports only one physical 
>>>> interface for
>>>> now.
>>>> Also add ISP4 driver related entry info into the MAINAINERS file
>>>
>>> MAINTAINERS
>>>
>>>>
>>>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>>>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>>>
>>> Who actually developed?  If both are developers there should be a Co- 
>>> developed-by tag.
>>>
>>>> ---
>>>>   MAINTAINERS                              |  10 ++
>>>>   drivers/media/platform/Kconfig           |   1 +
>>>>   drivers/media/platform/Makefile          |   1 +
>>>>   drivers/media/platform/amd/Kconfig       |  17 +++
>>>>   drivers/media/platform/amd/Makefile      |   5 +
>>>>   drivers/media/platform/amd/isp4/Makefile |  21 ++++
>>>>   drivers/media/platform/amd/isp4/isp4.c   | 139 +++++++++++++++++++ 
>>>> ++++
>>>>   drivers/media/platform/amd/isp4/isp4.h   |  35 ++++++
>>>>   8 files changed, 229 insertions(+)
>>>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>>>   create mode 100644 drivers/media/platform/amd/Makefile
>>>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index 10893c91b1c1..15070afb14b5 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -1107,6 +1107,16 @@ T:    git git://git.kernel.org/pub/scm/linux/ 
>>>> kernel/git/iommu/linux.git
>>>>   F:    drivers/iommu/amd/
>>>>   F:    include/linux/amd-iommu.h
>>>> +AMD ISP4 DRIVER
>>>> +M:    Bin Du <bin.du@amd.com>
>>>> +M:    Nirujogi Pratap <pratap.nirujogi@amd.com>
>>>> +L:    linux-media@vger.kernel.org
>>>> +S:    Maintained
>>>> +T:    git git://linuxtv.org/media.git
>>>> +F:    drivers/media/platform/amd/Kconfig
>>>> +F:    drivers/media/platform/amd/Makefile
>>>> +F:    drivers/media/platform/amd/isp4/*
>>>> +
>>>>   AMD KFD
>>>>   M:    Felix Kuehling <Felix.Kuehling@amd.com>
>>>>   L:    amd-gfx@lists.freedesktop.org
>>>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/ 
>>>> platform/ Kconfig
>>>> index 85d2627776b6..d525c2262a7d 100644
>>>> --- a/drivers/media/platform/Kconfig
>>>> +++ b/drivers/media/platform/Kconfig
>>>> @@ -89,5 +89,6 @@ source "drivers/media/platform/ti/Kconfig"
>>>>   source "drivers/media/platform/verisilicon/Kconfig"
>>>>   source "drivers/media/platform/via/Kconfig"
>>>>   source "drivers/media/platform/xilinx/Kconfig"
>>>> +source "drivers/media/platform/amd/Kconfig"
>>>>   endif # MEDIA_PLATFORM_DRIVERS
>>>> diff --git a/drivers/media/platform/Makefile b/drivers/media/ 
>>>> platform/ Makefile
>>>> index ace4e34483dd..9f3d1693868d 100644
>>>> --- a/drivers/media/platform/Makefile
>>>> +++ b/drivers/media/platform/Makefile
>>>> @@ -32,6 +32,7 @@ obj-y += ti/
>>>>   obj-y += verisilicon/
>>>>   obj-y += via/
>>>>   obj-y += xilinx/
>>>> +obj-y += amd/
>>>
>>> Is this whole file alphabetical?  If so this is the wrong place.
>>>
>>>>   # Please place here only ancillary drivers that aren't SoC-specific
>>>>   # Please keep it alphabetically sorted by Kconfig name
>>>> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/ 
>>>> platform/amd/Kconfig
>>>> new file mode 100644
>>>> index 000000000000..3b1dba0400a0
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amd/Kconfig
>>>> @@ -0,0 +1,17 @@
>>>> +# SPDX-License-Identifier: MIT
>>>> +
>>>> +config AMD_ISP4
>>>> +    tristate "AMD ISP4 and camera driver"
>>>> +    default y
>>>
>>> I don't believe this should default 'y'.  Normally drivers need to be 
>>> opt in.
>>>
>>>> +    depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
>>>> +    select VIDEOBUF2_CORE
>>>> +    select VIDEOBUF2_V4L2
>>>> +    select VIDEOBUF2_MEMOPS
>>>> +    select VIDEOBUF2_VMALLOC
>>>> +    select VIDEOBUF2_DMA_CONTIG
>>>> +    select VIDEOBUF2_DMA_SG
>>>> +    help
>>>> +      This is support for AMD ISP4 and camera subsystem driver.
>>>> +      Say Y here to enable the ISP4 and camera device for video 
>>>> capture.
>>>> +      To compile this driver as a module, choose M here. The module 
>>>> will
>>>> +      be called amd_capture.
>>>> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/ 
>>>> platform/amd/Makefile
>>>> new file mode 100644
>>>> index 000000000000..76146efcd2bf
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amd/Makefile
>>>> @@ -0,0 +1,5 @@
>>>> +# Copyright 2024 Advanced Micro Devices, Inc.
>>>
>>> 2025
>>>
>>>> +# add isp block
>>>> +ifneq ($(CONFIG_AMD_ISP4),)
>>>> +obj-y += isp4/
>>>> +endif
>>>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/ 
>>>> media/ platform/amd/isp4/Makefile
>>>> new file mode 100644
>>>> index 000000000000..e9e84160517d
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amd/isp4/Makefile
>>>> @@ -0,0 +1,21 @@
>>>> +# SPDX-License-Identifier: GPL-2.0+
>>>> +#
>>>> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
>>>> +
>>>> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>>>
>>> As the directory is already conditional on CONFIG_AMD_ISP4 is this 
>>> obj- $() needed?  Or should it really be obj-y?
>>>
>> Yes, it is needed, because AMD_ISP4 is trisate in Kconfig, it can be y 
>> or m
> 
> Got it, thanks for clarification.
> 
>>
>>>> +amd_capture-objs := isp4.o
>>>> +
>>>> +ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>>>> +ccflags-y += -I$(srctree)/include
>>>> +
>>>> +ifneq ($(call cc-option, -mpreferred-stack-boundary=4),)
>>>> +    cc_stack_align := -mpreferred-stack-boundary=4
>>>> +endif
>>>> +
>>>> +ccflags-y += $(cc_stack_align)
>>>> +ccflags-y += -DCONFIG_COMPAT
>>>> +ccflags-y += -Wunused-but-set-variable
>>>> +ccflags-y += -Wmissing-include-dirs
>>>> +ccflags-y += -Wunused-const-variable
>>>> +ccflags-y += -Wmaybe-uninitialized
>>>> +ccflags-y += -Wunused-value
>>>
>>> Do you really need to enforce all these flags just for this driver?
>>>
>>> Was this just for development to avoid having to remember to call the 
>>> build with W=1 or CONFIG_WERROR?
>>>
>> We found after patch submission, Media CI robot test will be 
>> triggered, when it builds the patch it will set these flags, so adding 
>> these flags to align with Media CI robot test to discover potential 
>> issue before submission.
> 
> I believe you can just compile with CONFIG_WERROR and get same result, 
> no?  If I'm wrong, nonetheless this should be set in your external build 
> environment script not in the Makefile to be going upstream.
> 
IMO, CONFIG_WERROR just treats warning as error, won't add other extra 
flags.
Sure, will remove them from the makefile and only add them to the local 
build environment.

>>
>>>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/ 
>>>> platform/amd/isp4/isp4.c
>>>> new file mode 100644
>>>> index 000000000000..d0be90c5ec3b
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>>>> @@ -0,0 +1,139 @@
>>>> +// SPDX-License-Identifier: GPL-2.0+
>>>> +/*
>>>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#include <linux/pm_runtime.h>
>>>> +#include <linux/vmalloc.h>
>>>> +#include <media/v4l2-ioctl.h>
>>>> +
>>>> +#include "isp4.h"
>>>> +
>>>> +#define VIDEO_BUF_NUM 5
>>>> +
>>>> +#define ISP4_DRV_NAME "amd_isp_capture"
>>>> +
>>>> +/* interrupt num */
>>>> +static const u32 isp4_ringbuf_interrupt_num[] = {
>>>> +    0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>>>> +    1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
>>>> +    3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
>>>> +    4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>>>> +};
>>>> +
>>>> +#define to_isp4_device(dev) \
>>>> +    ((struct isp4_device *)container_of(dev, struct isp4_device, 
>>>> v4l2_dev))
>>>> +
>>>> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
>>>> +{
>>>> +    struct isp4_device *isp_dev = dev_get_drvdata((struct device 
>>>> *)arg);
>>>> +
>>>> +    if (!isp_dev)
>>>> +        goto error_drv_data;
>>>> +
>>>> +error_drv_data:
>>>> +    return IRQ_HANDLED;
>>>
>>> In patch 5 you change this function, including dropping the goto and 
>>> label.
>>>
>>> So I suggest that for patch 1 you KISS:
>>>
>>> static irqreturn_t isp4_irq_handler(int irq, void *arg)
>>> {
>>>      return IRQ_HANDLED;
>>> }
>>>
>>> Then in patch 5 add the extra conditional code and real handling.
>>>
>>>> +}
>>>> +
>>>> +/*
>>>> + * amd capture module
>>>> + */
>>>
>>> Pointless comment, no?
>>>
>>>> +static int isp4_capture_probe(struct platform_device *pdev)
>>>> +{
>>>> +    struct device *dev = &pdev->dev;
>>>> +    struct isp4_device *isp_dev;
>>>> +
>>>
>>> Why newline here?
>>>
>>>> +    int i, irq, ret;
>>>> +
>>>> +    isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
>>>> +    if (!isp_dev)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    isp_dev->pdev = pdev;
>>>> +    dev->init_name = ISP4_DRV_NAME;
>>>> +
>>>> +    for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>>>> +        irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>>>> +        if (irq < 0)
>>>> +            return dev_err_probe(dev, -ENODEV,
>>>> +                         "fail to get irq %d\n",
>>>> +                         isp4_ringbuf_interrupt_num[i]);
>>>> +        ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
>>>> +                       "ISP_IRQ", &pdev->dev);
>>>> +        if (ret)
>>>> +            return dev_err_probe(dev, ret, "fail to req irq %d\n",
>>>> +                         irq);
>>>> +    }
>>>> +
>>>> +    isp_dev->pltf_data = pdev->dev.platform_data;
>>>> +
>>>> +    dev_dbg(dev, "isp irq registration successful\n");
>>>
>>> As you have error handling in place with dev_err_probe() I think the 
>>> lack of an error implies this message.  I'd say drop it.
>>>
>>>> +
>>>> +    /* Link the media device within the v4l2_device */
>>>> +    isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>>>> +
>>>> +    /* Initialize media device */
>>>> +    strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
>>>> +        sizeof(isp_dev->mdev.model));
>>>> +    snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
>>>> +         "platform:%s", ISP4_DRV_NAME);
>>>> +    isp_dev->mdev.dev = &pdev->dev;
>>>> +    media_device_init(&isp_dev->mdev);
>>>> +
>>>> +    /* register v4l2 device */
>>>> +    snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>>>> +         "AMD-V4L2-ROOT");
>>>> +    ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
>>>> +    if (ret)
>>>> +        return dev_err_probe(dev, ret,
>>>> +                     "fail register v4l2 device\n");
>>>> +
>>>> +    dev_dbg(dev, "AMD ISP v4l2 device registered\n");
>>>
>>> As you have error handling in place with dev_err_probe() I think the 
>>> lack of an error implies this message.  I'd say drop it.
>>>
>>>> +
>>>> +    ret = media_device_register(&isp_dev->mdev);
>>>> +    if (ret) {
>>>> +        dev_err(dev, "fail to register media device %d\n", ret);
>>>> +        goto err_unreg_v4l2;
>>>> +    }
>>>> +
>>>> +    platform_set_drvdata(pdev, isp_dev);
>>>> +
>>>> +    pm_runtime_set_suspended(dev);
>>>> +    pm_runtime_enable(dev);
>>>> +
>>>> +    return 0;
>>>> +
>>>> +err_unreg_v4l2:
>>>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>>>> +
>>>> +    return dev_err_probe(dev, ret, "isp probe fail\n");
>>>> +}
>>>> +
>>>> +static void isp4_capture_remove(struct platform_device *pdev)
>>>> +{
>>>> +    struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>>>> +    struct device *dev = &pdev->dev;
>>>> +
>>>> +    media_device_unregister(&isp_dev->mdev);
>>>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>>>> +    dev_dbg(dev, "AMD ISP v4l2 device unregistered\n");
>>>
>>> Probably not needed message anymore, right?
>>>
>>>> +}
>>>> +
>>>> +static struct platform_driver isp4_capture_drv = {
>>>> +    .probe = isp4_capture_probe,
>>>> +    .remove = isp4_capture_remove,
>>>> +    .driver = {
>>>> +        .name = ISP4_DRV_NAME,
>>>> +        .owner = THIS_MODULE,
>>>> +    }
>>>> +};
>>>> +
>>>> +module_platform_driver(isp4_capture_drv);
>>>> +
>>>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>>>> +MODULE_IMPORT_NS("DMA_BUF");
>>>> +
>>>> +MODULE_DESCRIPTION("AMD ISP4 Driver");
>>>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>>>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>>>> +MODULE_LICENSE("GPL");
>>>> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/ 
>>>> platform/amd/isp4/isp4.h
>>>> new file mode 100644
>>>> index 000000000000..27a7362ce6f9
>>>> --- /dev/null
>>>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>>>> @@ -0,0 +1,35 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0+ */
>>>> +/*
>>>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>>>> + */
>>>> +
>>>> +#ifndef _ISP4_H_
>>>> +#define _ISP4_H_
>>>> +
>>>> +#include <linux/mutex.h>
>>>> +#include <media/v4l2-device.h>
>>>> +#include <media/videobuf2-memops.h>
>>>> +#include <media/videobuf2-vmalloc.h>
>>>> +
>>>> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>>>> +
>>>> +struct isp4_platform_data {
>>>> +    void *adev;
>>>> +    void *bo;
>>>> +    void *cpu_ptr;
>>>
>>> Will touch more on these in later patches, but I would say don't 
>>> introduce them until the patch they're needed.
>>>
>>>> +    u64 gpu_addr;
>>>> +    u32 size;
>>>> +    u32 asic_type;
>>>> +    resource_size_t base_rmmio_size;
>>>> +};
>>>> +
>>>> +struct isp4_device {
>>>> +    struct v4l2_device v4l2_dev;
>>>> +    struct media_device mdev;
>>>> +
>>>> +    struct isp4_platform_data *pltf_data;
>>>> +    struct platform_device *pdev;
>>>> +    struct notifier_block i2c_nb;
>>>> +};
>>>> +
>>>> +#endif /* isp4.h */
>>>
>>> /* ISP4_H */
>>>
>>
> 


