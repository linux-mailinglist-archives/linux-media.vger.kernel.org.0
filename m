Return-Path: <linux-media+bounces-42245-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C60B52662
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 04:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE7071C24876
	for <lists+linux-media@lfdr.de>; Thu, 11 Sep 2025 02:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0198320F08C;
	Thu, 11 Sep 2025 02:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iVDuCkwD"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7501F63CD;
	Thu, 11 Sep 2025 02:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.96.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757557155; cv=fail; b=cMeaZxDqpcYWSm1Iia1x1z4Ux/VtZRgqmb8PDmoX2j/fzjOy61lHAg6Riw6pHyJ9h2xNYm2A4drgvU5GZwtd/mJkiZdBJnDt9K6FFmdhndvsleUvQmY5uJRbevdkkjhccCLBk3n9IeB/ST6XTsRI5ZAmLRxWGQWpe8OSSUidTF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757557155; c=relaxed/simple;
	bh=AuQUU9HbH+FBfpHrzx7JqEYhFsfSec1HEXrPqU1ZHjI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FjOGP/KcGJsyw010gjTC3q0Ab5loO23Yc1ZW/dX0fIY2yfzs4qusfI2TYuGlm3lfpd1zCPfSzZONpiocUGDmdHvgOfBFnURn5NmSDw7iAZiUgS8Y5yDTkwyzW5u+Em7et589bUCgO/zY+8+nynHTN2HLh3FPVtyii+Ru9qlC7DM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iVDuCkwD; arc=fail smtp.client-ip=40.107.96.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eVipAw24HNylorOBo1ze5oaqGpK6g91iZlatIaaZi6D3DlWPyYDuK+VjBA0RtGpjR00DmNA3R7Ph7QwdDMvwCkK8Atef0IEsRTfF0QZsu3fN1FvH9sUOxWEyZwztaDmiGR+IZeXz+SzvmX/2iuAJkyO+2Oq8XkaImdR8k/TUsF7xr//U7bhasTOL0081h3IqjnSmxq+KRdqBGVGYR9e3BA38XYl/GGxMVqGNTLnLWX0WAWMGdK2TaV797cPZX5q6QEAQvhS7y33vrndpfm7FVFI9bpAeDfw1Prwb3N2bF0wI/bHB32O+Z4k/LiDktE4uVxCwC+01FebRKLeTxQPuxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B56EdxAmJ27VS1SOVuk+jkRBsWvXOSDCJ9NKPE8Tt2Y=;
 b=RJ0O7eN20sFH5t0x7vFB/Zg4YcXBtVsnq816X9NjvgZ+o1MMmpxT6fP++qxRud+MQSG0EydZUJd35xQoIACyuTVry9Hu0ybhuI1vt/AnxB2zofwv7v1vQKx0Ex4oYOyMotzLfhb60ONeA2khe7jdmTbL+HQr9XVTU8iyzHLmC24VCJpvZU7rPlfvNhKX4W1CU1ocPaas1BoQVjEQ3zh5H0+jnzineDAMk8M1NoXbo9r1FHdD+FFUexZiBhMsdqW7Tdp4EngicBXC1hG6dzA/MQPKRUHu7c7ritzjYYvs5wRqGn4GQwns1/hkTWtpkuoxYqbOfhrXERsj1cCXJn4Ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B56EdxAmJ27VS1SOVuk+jkRBsWvXOSDCJ9NKPE8Tt2Y=;
 b=iVDuCkwDv79/XOgasHfGLoBMUK+MMfBMnnVrYGE/wPQQhTsTIK4FDUnFHdR3ZKtiezxHMk8P5dLAyqC2NOivGsgy8pLzDOa7aWY+6GlUaz+AHzH7a5VDmqG8bEwn00cP3++jQSVhVStzPqSv5spMd5MpfS6wRAj5pioHtqaPrfw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by PH7PR12MB6956.namprd12.prod.outlook.com (2603:10b6:510:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 02:19:09 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 02:19:09 +0000
Message-ID: <808aec0c-acf6-4f97-8450-274db23e11e5@amd.com>
Date: Thu, 11 Sep 2025 10:19:00 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Mario Limonciello <mario.limonciello@amd.com>, mchehab@kernel.org,
 hverkuil@xs4all.nl, laurent.pinchart+renesas@ideasonboard.com,
 bryan.odonoghue@linaro.org, sakari.ailus@linux.intel.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 richard.gong@amd.com, anson.tsao@amd.com,
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <9ad2ec92-847c-4a3f-b734-ec055ab0e699@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <9ad2ec92-847c-4a3f-b734-ec055ab0e699@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0171.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::27) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|PH7PR12MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c3c475-35b2-4852-7776-08ddf0d99758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SnNvR0xSOW4wRWhmc2F6V3YvMzVSWXlocHFkQnhydlE2N05MdW1HejY2ZDNi?=
 =?utf-8?B?dUhkV3VMdzRUQVNVNUZjTHZnT0l2S1NuK3lIMURzd1BZU3V2OUJvU3BMOU1z?=
 =?utf-8?B?eUgxTUtwcVc1SmxWaXFaZ1graEEvNXZIQzdDNU92dzJ1RnRvTm5oWFlhM2s2?=
 =?utf-8?B?WVlWekVweTFYd2JOQ2ZKb0tzL1lLd0N0V0xKVGpUMGNIbERkTnJJUlpZcGZl?=
 =?utf-8?B?dGpPVXk1SDMyT3diS2JmL0JDcDVoR3Jra3ZCWldxME55dzYxWm1XVzEwbGJW?=
 =?utf-8?B?ZGlXdXdhT0d2amdKTUIwKzBPRUVjRmdRajEyc3JkYUpQSHpoZjY5TVBoR28x?=
 =?utf-8?B?ZmpGUFdSeGtjN0VwVXR2dXRlYzliT3J4bVIwcGRLZmlsUkovMFVPdDhIYmFq?=
 =?utf-8?B?MnNoZkJ2VFFOZFp0MkYvVWp0bkZ3VU92aHYyMnhtdFdWTVhhaTYvbnR5MHd6?=
 =?utf-8?B?T3dQK1lxWEUveHVIY3kzWlZ5Y283c25sZW5iWFdrcExNcC9Vc2o4ckh4VzZj?=
 =?utf-8?B?S09FRFlSdXRQRHBrSzdwRGNON3F4aDI1UXJaTFlORTJMNnEvSEhIQkhCYXNr?=
 =?utf-8?B?U3Z1eCtkQU9VcVFQK1lIekhKbXVHWGhjenEwVW1LTG5yKzlyRC9zdTR6OXIv?=
 =?utf-8?B?cDYyWVdtTkxVdmt0bTlieW1oUVorbEVzS0x1MVU3ckM2K2ljUWRLandNYmYz?=
 =?utf-8?B?QVNnTTFqUmhqeUZmM1FrdFBCQUE5eFgxSVBzQ1l1WEtCUGRpT1NmaE5QSk9o?=
 =?utf-8?B?K252eE96S2tTOTFzMVQ4SHVPYjZnbXBuZTh0QkhBeU1WSUlPb3lYMXY5YUdw?=
 =?utf-8?B?RXpBUlF5ZFlmS3U1UWN1cEhYeHZySDRtZlRVNXNCdnkwdGZKRDgwTGQ4d0F2?=
 =?utf-8?B?R3FwNWRGSVhBTkNDMFdDKzB1bHVsc29SbUxaTzJhTWJUandGaHdBblpGcTF1?=
 =?utf-8?B?YjhFdlhLVlBJY0J4QWFCNEJRdHl4NGFEOG5iRHVqOUpGOStrUjgwdTh4eXFO?=
 =?utf-8?B?aGxmVTBvUGJzSW1lM1FmTW5ScnVBRDZSOVhPUWNjNDQ0bW83dVZ5bkRIZHFv?=
 =?utf-8?B?SWVUdDlyeERCa29pbHBhcE16WU1FTVhIQ1R5d0U2eDd1aUVYR3NpRnNsczV0?=
 =?utf-8?B?eEljaEZnYStKNFdWbDFxNitFYVgvWitzZnZHR3RZUk5rVzlwVzVNY0Q1UEpt?=
 =?utf-8?B?V2thMWhXelROVVZBWFNnb3VuTlNaRDBoQUZHYWdzRHVzZUdEUjRnS1kyWWtJ?=
 =?utf-8?B?TzVEcUMybGRsTVhzZ1pRL3ZFYjlBYURnd0Q5c3U2RzJkYXdZcUpMYmExYXRL?=
 =?utf-8?B?VzVqTDdrMWhzakJnVEludnkxRW5pTm16SzBvSk9hdjY0Y0RDeXZ3SGZ1Z045?=
 =?utf-8?B?YVNPd0ZGUHlaQ25uQUZuK1BmOTE0NTdpVC9RNFN0WU8yOEhuNCsvVjV0dzBG?=
 =?utf-8?B?Rnc5WVhOUkpYRXp1eTlnSnpWQjBvWDRQSjN6QzJ0OUp2ekpOQ1N6SWQvb09W?=
 =?utf-8?B?dmVickZsRHNYVnlnVmwraXV2RTdzQmg0TjVqQ1MwcHlkMTJ3L0c3cTFCQ3dF?=
 =?utf-8?B?bVFWa0pkVVIvMHFXU1NBc1RKRHQzYXBBbzdQUUJzbWVzV1pYamVrcGorekJW?=
 =?utf-8?B?SGh3SWFNUVIxenQ1UWp6eUtPcHgwVVJqVStvM3ZYbUFjdkdHWnRIK1FjaThM?=
 =?utf-8?B?Q1Zjd24wazQvUC9sVFBPZ2owcytuNTRXeVhlWkdjN090UitFeENBZDVuMXo2?=
 =?utf-8?B?VllPaHNnd0V2T28zRksyVmcyT0MvbDlsdEIrZHNHaW13ZkQxbkVFVlhsYjhQ?=
 =?utf-8?B?M3ErUUZqYnIwTjBHWnR5bXJTRElRMUx1UVlya0RUSlFYV0Zyc0RWRlYvT01U?=
 =?utf-8?B?N09qNTBjaXFsTmJkU2NNQmVVOVRQY08yUGpoUmZjZVNIV0IrSTN6SFpTM3lW?=
 =?utf-8?B?cG9Nak92NzV2ZXphbUpuRTJEY21oS0RmbUs0aGJha3Buai8xS2FaK2FFdXJE?=
 =?utf-8?B?OFd5ZVVOK2xnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y1MzcWJHc2hEUnZ4R1Y3RFpnb1ZVc3F5M3grckFPa0RUMUM2ekhDWExRc092?=
 =?utf-8?B?NURnM3pBTFo0ZTRwbms2ak9HMitoVWtBNlVLUmtyME9VbGU3SkxSc3NxWUtE?=
 =?utf-8?B?MkFqSWxqZGJYUzcyTUV3VzJ3WmhSQkJ6L2s3UGRpVCtCRHIzSFpzc3JXQkc4?=
 =?utf-8?B?NmliVkc5VDdwZkpTMEd3bkNjcWo3UjAwMno4NkZqL0dGL0xPL2xFWm13c2Vp?=
 =?utf-8?B?OFJnbi9paGI0a05La0dJbXBFdjZZL2pYcXJvL0lwSGNTS1hnbHhSK2JPMTA5?=
 =?utf-8?B?WlcrTEVyQTVGQWl0dE90aTgwR0JFODM5bk42Umw3Ujk4c0pMS0NDc1Jsd1RH?=
 =?utf-8?B?djVPVUZOWC9KNG1oK1hEeFpyRElXQk5XYmpReW03emdwZzZBbDdvVktjRmt3?=
 =?utf-8?B?dDM4K2g4WHJ0UDh4WmYvWE1yaklhVWRtUUVLcGtqRkNJWlRPeTVsbUdQRWVa?=
 =?utf-8?B?Tk9zSktQTy8vcmZPNHVoMmV2eldtQXhzZDlTdzlZR3p0OXlPb1ZqWEx1QmhF?=
 =?utf-8?B?aEgrTEppdGV4NFkzUGxQYzB6aENQdW80cGhjbDU4alVwbCt5YmUvQndCcWtH?=
 =?utf-8?B?K0NxSlVhOWIvbzVIT2dnT3lhaURUelNCdjIrOEtYMXpnRDFiS0NvQ0Rjck15?=
 =?utf-8?B?M2N6dWsrNDlvZEdkMXU4eHBYWWl5RlVMajc1R0pXaGgwTGovdlFWTC9KN3N4?=
 =?utf-8?B?R2Vna3AxZkVhcXNjSWJWdnpQQmdDN0ludVNMTDdFeGsxd3VqQUJEMEhwcFJp?=
 =?utf-8?B?bDVvL2V5a2dsa0VseElBaUJCb1pMQzZmMUVHekplOHBRQ1pRZHk2ZmxPcEhl?=
 =?utf-8?B?dlEyVklsaitaVEVUanQyUWZEWVhIMHAxR0h2ZjRnWXVVRTZCcnlQSUlTbG9j?=
 =?utf-8?B?dGpIWmFMSThoRTA3WjhraCtCMmVtN3JZSjI3WFEwOFFXSmJIUjdtNTFKTE9P?=
 =?utf-8?B?YTBmbGlmRng3OVRIMnRSL3h1aWtjeEZNOXB2bFBOcjhTSE1IZC9EL2FrWWR1?=
 =?utf-8?B?L0t2VXFTUXFLWjJBUzNVazBBYzRVbWdINGxtYmhuN3JMQmxubGxqNUZpcTlY?=
 =?utf-8?B?Vm5Oejk3YlExc0JTTHJhc1B6SlBzbnlWWkVrS0N5UURoY3N3TVdHcVgzL3A3?=
 =?utf-8?B?WDRwUm5Ob1hNMHJHSDdOVG40RjJ0cVR5MC9SbmsybnM5OHlPL2M2RE5MRG9U?=
 =?utf-8?B?Q3dSM2V4bXJ3Vy9yeFhVU2d0TE9SOVV3bGRJMFFHcGYyamNnTFVVSXU1RWJ5?=
 =?utf-8?B?NnNIMm1hdS9YMlJabnhUVnNkYW4yckhaMUQ2NHNHUkxDTTBVbnhJd0pSdURQ?=
 =?utf-8?B?WXRmbmJSbXJTZ0FKa2lmTUdYdkkzR2dEaSt2a0F4QVUwUHYycmhqRTRxZCtj?=
 =?utf-8?B?R3oxNXppRS9sbkNYMUdoZXE4R1NrUThmcTdIMVVscFpjZkdlNk5QVU41MlVB?=
 =?utf-8?B?RGcvSmU2bEJObEFWaDdJaFZ6UzFSeVZ3Mm5oQXRHQTZ0QkJ1NjAwVm5BSlI0?=
 =?utf-8?B?UGw0cDFJTHdzNGpleDZhTUR6RGZSTmtRMTVlU2d6TEx6bmpIbTFFc1VDYjJv?=
 =?utf-8?B?ZGxkejRncjkrZHgrMVFwbkg0SVhzUmJlWjRHbXdGM1Nnb21aUnhDNmRvUENU?=
 =?utf-8?B?Z1lPZTh4amFsb3pmR0MvQ0FMeW15MGJGdXZmUXBlOEUyYXgxSSs5Z2toMmt0?=
 =?utf-8?B?bFJTQUxqVUFlMHdxSmJxVWZWSndrOUdRdkxheUtUM3FKUUgwaFhPOHUzTXBw?=
 =?utf-8?B?OWJ6TFk4UTZsRVZWK0JZK2R5QmpDMkNXeXNJMUhhaTV6UXk1cjlnTDBjNHJx?=
 =?utf-8?B?a2FZR0czUi9RSDJITXppaWVTMllmc29STjlCVWx0NHNFb0tjVTR2ZFpCRHN0?=
 =?utf-8?B?UjhVYjZXTGZqRjJBNWtoOWIvK0hRNWpTZDZUQ0lKN0pjWFhnR25LVUNNV3Rn?=
 =?utf-8?B?Ky84eXVTYTRyUW9naEhDZ0hzY0FLaFNEVVlhZXdhSFBkcHRUS3ROYUFBaWdI?=
 =?utf-8?B?ZVppeGJDWnVJT0UxMFRydDdyVVFRSUhNcmtDUGxia01KaFNReElxRFE1UG5a?=
 =?utf-8?B?WElqUU5UU1htVGUvRUtURGVPMWMzZ1RrTUtuc05ORzVCRXU1U3IzTTVGaVJl?=
 =?utf-8?Q?ABDI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c3c475-35b2-4852-7776-08ddf0d99758
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 02:19:09.6328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lw90NdPNIfmoanhAn5gtjq3zdThMpumxaiKAJolNNUjw3y0dN4NVaSv4lUUBWCe5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6956

Thanks Mario

On 9/11/2025 1:17 AM, Mario Limonciello wrote:
> On 8/28/25 5:08 AM, Bin Du wrote:
>> AMD isp4 capture is a v4l2 media device which implements media controller
>> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
>> be connected to a remote CSI2 TX endpoint. It supports only one physical
>> interface for now. Also add ISP4 driver related entry info into the
>> MAINTAINERS file
>>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> ---
>>   MAINTAINERS                              |  13 +++
>>   drivers/media/platform/Kconfig           |   1 +
>>   drivers/media/platform/Makefile          |   1 +
>>   drivers/media/platform/amd/Kconfig       |   3 +
>>   drivers/media/platform/amd/Makefile      |   3 +
>>   drivers/media/platform/amd/isp4/Kconfig  |  13 +++
>>   drivers/media/platform/amd/isp4/Makefile |   6 ++
>>   drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4.h   |  24 +++++
>>   9 files changed, 185 insertions(+)
>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>   create mode 100644 drivers/media/platform/amd/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fe168477caa4..3ad845f1511b 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1133,6 +1133,19 @@ T:    git git://git.kernel.org/pub/scm/linux/ 
>> kernel/git/iommu/linux.git
>>   F:    drivers/iommu/amd/
>>   F:    include/linux/amd-iommu.h
>> +AMD ISP4 DRIVER
>> +M:    Bin Du <bin.du@amd.com>
>> +M:    Nirujogi Pratap <pratap.nirujogi@amd.com>
>> +L:    linux-media@vger.kernel.org
>> +S:    Maintained
>> +T:    git git://linuxtv.org/media.git
>> +F:    drivers/media/platform/amd/Kconfig
>> +F:    drivers/media/platform/amd/Makefile
>> +F:    drivers/media/platform/amd/isp4/Kconfig
>> +F:    drivers/media/platform/amd/isp4/Makefile
>> +F:    drivers/media/platform/amd/isp4/isp4.c
>> +F:    drivers/media/platform/amd/isp4/isp4.h
>> +
>>   AMD KFD
>>   M:    Felix Kuehling <Felix.Kuehling@amd.com>
>>   L:    amd-gfx@lists.freedesktop.org
>> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/ 
>> Kconfig
>> index 9287faafdce5..772c70665510 100644
>> --- a/drivers/media/platform/Kconfig
>> +++ b/drivers/media/platform/Kconfig
>> @@ -63,6 +63,7 @@ config VIDEO_MUX
>>   # Platform drivers - Please keep it alphabetically sorted
>>   source "drivers/media/platform/allegro-dvt/Kconfig"
>> +source "drivers/media/platform/amd/Kconfig"
>>   source "drivers/media/platform/amlogic/Kconfig"
>>   source "drivers/media/platform/amphion/Kconfig"
>>   source "drivers/media/platform/aspeed/Kconfig"
>> diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/ 
>> Makefile
>> index 6fd7db0541c7..b207bd8d8022 100644
>> --- a/drivers/media/platform/Makefile
>> +++ b/drivers/media/platform/Makefile
>> @@ -6,6 +6,7 @@
>>   # Place here, alphabetically sorted by directory
>>   # (e. g. LC_ALL=C sort Makefile)
>>   obj-y += allegro-dvt/
>> +obj-y += amd/
>>   obj-y += amlogic/
>>   obj-y += amphion/
>>   obj-y += aspeed/
>> diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/ 
>> platform/amd/Kconfig
>> new file mode 100644
>> index 000000000000..25af49f246b2
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Kconfig
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +source "drivers/media/platform/amd/isp4/Kconfig"
>> diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/ 
>> platform/amd/Makefile
>> new file mode 100644
>> index 000000000000..8bfc1955f22e
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/Makefile
>> @@ -0,0 +1,3 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +obj-y += isp4/
>> diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/ 
>> platform/amd/isp4/Kconfig
>> new file mode 100644
>> index 000000000000..0268060c2dae
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/Kconfig
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +
>> +config AMD_ISP4
>> +    tristate "AMD ISP4 and camera driver"
>> +    depends on VIDEO_DEV && VIDEO_V4L2_SUBDEV_API
> depends on DRM_AMD_ISP

Thanks, will add in the next version

>> +    select VIDEOBUF2_CORE>> +    select VIDEOBUF2_V4L2
>> +    select VIDEOBUF2_MEMOPS
>> +    help
>> +      This is support for AMD ISP4 and camera subsystem driver.
>> +      Say Y here to enable the ISP4 and camera device for video capture.
>> +      To compile this driver as a module, choose M here. The module will
>> +      be called amd_capture.
>> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/ 
>> platform/amd/isp4/Makefile
>> new file mode 100644
>> index 000000000000..de0092dad26f
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/Makefile
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0+
>> +#
>> +# Copyright (C) 2025 Advanced Micro Devices, Inc.
>> +
>> +obj-$(CONFIG_AMD_ISP4) += amd_capture.o
>> +amd_capture-objs := isp4.o
>> diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/ 
>> platform/amd/isp4/isp4.c
>> new file mode 100644
>> index 000000000000..6ff3ded4310a
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.c
>> @@ -0,0 +1,121 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <linux/pm_runtime.h>
>> +#include <linux/vmalloc.h>
>> +#include <media/v4l2-ioctl.h>
>> +
>> +#include "isp4.h"
>> +
>> +#define VIDEO_BUF_NUM 5
>> +
>> +#define ISP4_DRV_NAME "amd_isp_capture"
>> +
>> +/* interrupt num */
>> +static const u32 isp4_ringbuf_interrupt_num[] = {
>> +    0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
>> +    1, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT10 */
>> +    3, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT11 */
>> +    4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
>> +};
>> +
>> +#define to_isp4_device(dev) \
>> +    ((struct isp4_device *)container_of(dev, struct isp4_device, 
>> v4l2_dev))
>> +
>> +static irqreturn_t isp4_irq_handler(int irq, void *arg)
>> +{
>> +    return IRQ_HANDLED;
>> +}
>> +
>> +static int isp4_capture_probe(struct platform_device *pdev)
>> +{
>> +    struct device *dev = &pdev->dev;
>> +    struct isp4_device *isp_dev;
>> +    int i, irq, ret;
>> +
>> +    isp_dev = devm_kzalloc(&pdev->dev, sizeof(*isp_dev), GFP_KERNEL);
>> +    if (!isp_dev)
>> +        return -ENOMEM;
>> +
>> +    isp_dev->pdev = pdev;
>> +    dev->init_name = ISP4_DRV_NAME;
>> +
>> +    for (i = 0; i < ARRAY_SIZE(isp4_ringbuf_interrupt_num); i++) {
>> +        irq = platform_get_irq(pdev, isp4_ringbuf_interrupt_num[i]);
>> +        if (irq < 0)
>> +            return dev_err_probe(dev, -ENODEV,
>> +                         "fail to get irq %d\n",
>> +                         isp4_ringbuf_interrupt_num[i]);
>> +        ret = devm_request_irq(&pdev->dev, irq, isp4_irq_handler, 0,
>> +                       "ISP_IRQ", &pdev->dev);
>> +        if (ret)
>> +            return dev_err_probe(dev, ret, "fail to req irq %d\n",
>> +                         irq);
>> +    }
>> +
>> +    /* Link the media device within the v4l2_device */
>> +    isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
>> +
>> +    /* Initialize media device */
>> +    strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
>> +        sizeof(isp_dev->mdev.model));
>> +    snprintf(isp_dev->mdev.bus_info, sizeof(isp_dev->mdev.bus_info),
>> +         "platform:%s", ISP4_DRV_NAME);
>> +    isp_dev->mdev.dev = &pdev->dev;
>> +    media_device_init(&isp_dev->mdev);
>> +
>> +    /* register v4l2 device */
>> +    snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
>> +         "AMD-V4L2-ROOT");
>> +    ret = v4l2_device_register(&pdev->dev, &isp_dev->v4l2_dev);
>> +    if (ret)
>> +        return dev_err_probe(dev, ret,
>> +                     "fail register v4l2 device\n");
>> +
>> +    ret = media_device_register(&isp_dev->mdev);
>> +    if (ret) {
>> +        dev_err(dev, "fail to register media device %d\n", ret);
>> +        goto err_unreg_v4l2;
>> +    }
>> +
>> +    platform_set_drvdata(pdev, isp_dev);
>> +
>> +    pm_runtime_set_suspended(dev);
>> +    pm_runtime_enable(dev);
>> +
>> +    return 0;
>> +
>> +err_unreg_v4l2:
>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +
>> +    return dev_err_probe(dev, ret, "isp probe fail\n");
>> +}
>> +
>> +static void isp4_capture_remove(struct platform_device *pdev)
>> +{
>> +    struct isp4_device *isp_dev = platform_get_drvdata(pdev);
>> +
>> +    media_device_unregister(&isp_dev->mdev);
>> +    v4l2_device_unregister(&isp_dev->v4l2_dev);
>> +}
>> +
>> +static struct platform_driver isp4_capture_drv = {
>> +    .probe = isp4_capture_probe,
>> +    .remove = isp4_capture_remove,
>> +    .driver = {
>> +        .name = ISP4_DRV_NAME,
>> +        .owner = THIS_MODULE,
>> +    }
>> +};
>> +
>> +module_platform_driver(isp4_capture_drv);
>> +
>> +MODULE_ALIAS("platform:" ISP4_DRV_NAME);
>> +MODULE_IMPORT_NS("DMA_BUF");
>> +
>> +MODULE_DESCRIPTION("AMD ISP4 Driver");
>> +MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
>> +MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/ 
>> platform/amd/isp4/isp4.h
>> new file mode 100644
>> index 000000000000..8535f662ab49
>> --- /dev/null
>> +++ b/drivers/media/platform/amd/isp4/isp4.h
>> @@ -0,0 +1,24 @@
>> +/* SPDX-License-Identifier: GPL-2.0+ */
>> +/*
>> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
>> + */
>> +
>> +#ifndef _ISP4_H_
>> +#define _ISP4_H_
>> +
>> +#include <linux/mutex.h>
>> +#include <media/v4l2-device.h>
>> +#include <media/videobuf2-memops.h>
>> +#include <media/videobuf2-vmalloc.h>
>> +
>> +#define ISP4_GET_ISP_REG_BASE(isp4sd) (((isp4sd))->mmio)
>> +
>> +struct isp4_device {
>> +    struct v4l2_device v4l2_dev;
>> +    struct media_device mdev;
>> +
>> +    struct platform_device *pdev;
>> +    struct notifier_block i2c_nb;
>> +};
>> +
>> +#endif /* _ISP4_H_ */
> 

-- 
Regards,
Bin


