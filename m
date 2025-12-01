Return-Path: <linux-media+bounces-47916-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE4C95E88
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 07:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E799F4E0F06
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 06:47:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED1A32877E8;
	Mon,  1 Dec 2025 06:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fZjdPh1F"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010062.outbound.protection.outlook.com [52.101.193.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875D810F1;
	Mon,  1 Dec 2025 06:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764571630; cv=fail; b=bG5xL2128kdsQW5ur9Pzgb4WO7u7DAJ2tkY/i/RKM17L4/b5+xrybqKJBk9rj8/BLWxpnkGDRJRQNbSip510o93OVeBQ4SAebNdoW0JGH8DbRrlfA077A0DhIQ65vB4DZzgtSS4/0PkM0bW8hO2jAZJETnpwJKSqoM1BpNEY/4g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764571630; c=relaxed/simple;
	bh=0cozOsnc7PYXMDIji6tkGckFDGC6aNeJDFTwfPw0abA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KOJH6Kf00L7Ag7+5L4VwnvONm7/G2SU1vbIK6s5o80t2lldjJ1NF/WewcULpdcMFopFmCCVdEvNWEXDF/0Dt0MZyVBlgHXc6ZAkqVDdcpJ85cbuAc3uo7mLgezSFBUITzHyfCGAqMucs1GgrsqIAAwoAX7wJbTUksaNmJHvT11g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fZjdPh1F; arc=fail smtp.client-ip=52.101.193.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dk9htYd2mzFACGVI9xBkX8hzLT5HMTKyjANlOTm9pGTFGr1IbtljIADNh4gH5PlPTpFR6vyxCTRACOUqt+DZ5KDyVbYZ+rwA+S0DnhIoQMq6tqgZHgl5+NE3NoULW/SWuYgaIrMrimNqjW6R8C3WvS8VTyTi7KMLnx2kPQM6YWY6uo9gijE6+FTJ2Xz7vG0441tthip6iuX8X2l6p3Y6D+ahJZSTunj0+zQs8CLxaSQZVLczzVrVa73tj4QipZxvro61wu8vlc9fea5G1BwvlCFbxjSxhC4tKMChnSUi4fyvfgkrugayRpOxjI/480neTu09Tze5sq+NAdqKsujMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhpKabEQfFLDbT1mFjS3Hd1BZ9BqrwU41gPd9gQkhAY=;
 b=RGjD9/ffa6hsGsvlvrQx/IOFFZ1chCqP2R/WBtF5PDX18Gto01/RZuvnvrmpi4LT/2ed7BN3DNQBv0ESG5PfRCeLlixTWn9Z53wRXKfp/4805wSn6DIByZHp88/NrGoq7/336ox8Z2n7f2th6I/lopigZz2lw2ihnjwnAtD+pXx1r+B+scfU7CqCNwJxpf3ntXx/qtgU5p/mbtugrEX2QQkzlHM2FNzM1sKs9trYkKwkrVXEmrD/V2DYWKTrv23ZlaHlbU8cWecGn8VZUPeu3Hhpv21qAe6RB+BtgrRrSUfvIEse2cZvaskBL/UJxL/vBqvZZJRUhnuxqeDa202Uaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhpKabEQfFLDbT1mFjS3Hd1BZ9BqrwU41gPd9gQkhAY=;
 b=fZjdPh1FQaRyaH5ORiEvTxlYhgcK1UCMVakz2JmneyuNMGY59PIc0B4ExeiEgVgk6AQs7kINM/8QGry2vRyHubj3rIfgJOrHtBqAIcMf28Uk2jErrAR7MtaTYkDFWqfySeDUfvQ4eq0GZ6+KjiaLc8zzRpONGVULbe+28dbl29M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by DM4PR12MB6639.namprd12.prod.outlook.com (2603:10b6:8:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 06:47:06 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::c47f:251d:7b84:e6b4%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:47:05 +0000
Message-ID: <17db5acd-2bb7-45cf-b8e4-b796c49e3baf@amd.com>
Date: Mon, 1 Dec 2025 14:46:54 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] Add AMD ISP4 driver
To: Mario Limonciello <superm1@kernel.org>,
 Sashank Karri <sashank.karri@gmail.com>
Cc: Dominic.Antony@amd.com, Phil.Jawich@amd.com, anson.tsao@amd.com,
 benjamin.chan@amd.com, bryan.odonoghue@linaro.org,
 gjorgji.rosikopulos@amd.com, hverkuil@xs4all.nl, king.li@amd.com,
 laurent.pinchart+renesas@ideasonboard.com, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, mario.limonciello@amd.com, mchehab@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, pratap.nirujogi@amd.com,
 richard.gong@amd.com, sakari.ailus@linux.intel.com, sultan@kerneltoast.com,
 "Adam J. Sypniewski" <ajsyp@syptech.net>
References: <CAL3XFnZ3XatQkR2HXpyfT6BK7bCjjGcaS5LjtK0DxPfHX0Q-dg@mail.gmail.com>
 <3a671359-b05a-4d58-84ca-f29385088e5c@kernel.org>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <3a671359-b05a-4d58-84ca-f29385088e5c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: KL1P15301CA0057.APCP153.PROD.OUTLOOK.COM
 (2603:1096:820:3d::19) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|DM4PR12MB6639:EE_
X-MS-Office365-Filtering-Correlation-Id: 4949dbda-d9bc-496d-da79-08de30a570f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Mk9KUnZoVjVWQXZuU29HbHg5MjhKN1FJcmZuMnJjK0pOUEI3UEtibkYvd09M?=
 =?utf-8?B?MUN2WjdBUUhpa3Brc3F6QVFDbzRXZkFJRFJkYTBNRXNHU3c5a1FrenUySTFG?=
 =?utf-8?B?TnByNG5ReDFoRWFkc2VOeXd5TEZmb3dvU0VGN0tQTG9xa1lCZUpDaW1FeWx4?=
 =?utf-8?B?SDJZOG1WemZpZytPeGdvOWdQcFJwOTRoQW9mbk9MTytBb2dmQVI0UmdJUXhQ?=
 =?utf-8?B?ZVNrNHk3RmpzOEo2U3QxTkcyeFNPVWswWEphMmgzWm1YdUxhcG00ZmJLZG5W?=
 =?utf-8?B?TkdXblVVTll1VnZKK3lIaXVVQ09vZC9Ta0syVlZHby9uaFJZb1BmRklqYTNQ?=
 =?utf-8?B?RElHQTdaT3JsV2Uwd0pDTnN2Ui96RzJBNjBPdlIwUVlvT1g3dlpya1p6SUZw?=
 =?utf-8?B?eXBEWmpHV1dxNjJCenVkMU4wbG1LMFgrbTNFdW55Nm1UR1hlY2VXVzVrZFU2?=
 =?utf-8?B?SFhMR2owQnE3ZmZ1eGhlREtEc3AwaTNOZ3FHVmpkRU9JQTRvM1JJVHQvZUpk?=
 =?utf-8?B?Nm1LY2RMVmU3N1NFekJWRVd6WDV1RTlQYk9BU2lKTEhBbUIrUCtlZlpiZEla?=
 =?utf-8?B?NUpmWXl1cmZteUdDb1JhajdpMytaM2h0Wk4wcXVTRXpkeUU5c3hpMHpXSUZ5?=
 =?utf-8?B?YklUZG85ZW5XSVBubzF2UVMrL25mZkpVSmJnN3VGWTJwUmhXenFSZXM4OUpw?=
 =?utf-8?B?OUIvS1NLbWRLTUZ5NGIxRVdXazdSS1kxa3Zkb1BjS3BaQm1FNzZCVGlsYnF6?=
 =?utf-8?B?WVg1ZVFKdlZNRkZqbFcrRkJPM2dsL0kyTlAzVkNRd3RmMm5nRHZoM05mN1F6?=
 =?utf-8?B?cDNWczNSc0hZQklxWkxLSmJJZm5MNUhDc2FQSVRjZ24vZ3ZBZTl4K2NkOUl2?=
 =?utf-8?B?QmlZamVFOXdyRGNlNWFua3VtaUJrZWtCaUQ0UzFGZmlxbTVwOWhRTjhqTGZ2?=
 =?utf-8?B?M3dIbDNwa3NDU0p4cTlJcmtUL0hoMzhOZmRkTnBPVExnVkpPZ0NnK0tySFlG?=
 =?utf-8?B?M0dHNnloUXFoc1h0RDR0akZlNHVVVUk5eCtSWW9FQlY1QTlvRW1ZV3N0VklM?=
 =?utf-8?B?cTBkMEs2QVdXWTY2MXpUZXgwNkNSS1BpZGhPOHFPbElNN21Zc29yaFc1Vm0y?=
 =?utf-8?B?VmxRK2k3QmVnUnhheW1iOCswU0UyQzZvQXh3YTc3b0J1Vk10Y1AxQU1BZVNr?=
 =?utf-8?B?K0JjSCtPcGJobDR5dlBSUU9ncDlTWUhJeU43dStxdUIzOXM0QThiOTlIZ0Jh?=
 =?utf-8?B?SUdCM2RhTXdnZ2pYc3NBdC9GVzM0TkgranpWS3JqVjMyOTc0VVZMczlQVUdI?=
 =?utf-8?B?RzFjelRlRXdQNGxNSkZDOWx4bWVCaVpmTGRpa3gvbkEzbm1sNVphYjVTOHkv?=
 =?utf-8?B?QkFWVWZ3OVIyZ0g0NVpaKzU5MUhmRTc5dmt5Wm5pSExVemdFblFYajVvUVNC?=
 =?utf-8?B?WEJPdTZIek8rVk9qQlRoemkwZm9PSnQ1VnhwLzd0ZG8ycnZ1Z3lxWjlTSXR3?=
 =?utf-8?B?MmI1dlpZN3VQdVNxMmZOSkJsMVVjUlNEaENCZ2NENWFoYmhFT2t6QlFKQksw?=
 =?utf-8?B?VkFtUTdFMWVxclc2bmdtclh3RjJKUDZRZ2tVT0xQQXh2NDZsbjA3NVRSVkY4?=
 =?utf-8?B?ZTA0d0JSc3dwcHJzcTJJQk1jQytkeVhTZThpN3ZvSEZsVyt1QnZnL1Z4ck5a?=
 =?utf-8?B?UnVXY2RkYjBpQmJ0VExhbStvT3BxZ3RKNC9GUDVnWXdZb1JEL1kweGtBNzc2?=
 =?utf-8?B?Z2lmb0NRTDdRYzNnVStnSU8yTlhvNVppZEY2NW00cWZwdEo4aTJERWNiRTdm?=
 =?utf-8?B?cjN4V1dKcTVMU1k5SjIvRGw5K0E0RnJnKzB4cTczZVVtQmJvbFE0TWtIL28v?=
 =?utf-8?B?OUhaa2poOFFnZEpDTmppS3QyL2FqRnNCNWRIRy82eUlUUUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bUQ5OUhzUTQrYnZ1QUVmUVcvMGdteFlvcVJvUzJ3enJPckxQenp6eHdDc0Ey?=
 =?utf-8?B?SDRVbFJMem1CbjFvL3h3WWg1dTNMdm55dGtJUWFpd29VOTJhMUswOC9vQVBq?=
 =?utf-8?B?dEpkTFYwSDlmbDVNWkxFZG5vRE85T1I5UW1sOTlYOWxIajAweFZQNEQ5elRx?=
 =?utf-8?B?QitOYnBzUlE4VlN4d2FkVmszRkRUMUZKTFFSWlViUGRZQlowVUh6RmUwbHBp?=
 =?utf-8?B?TUoyeUFsODBZTGl4VE5GVy9aQ3c2aHg2cDM1bTJwWEhHT1BFRTl3RmxmeU1o?=
 =?utf-8?B?a2ZtMmkya3lhekdubEhjQ0RFK1lMNzZOeCtUclZhUUxQeXhwMmxaN2FvcW9s?=
 =?utf-8?B?SkN0MENHTnkvNkNuWkx0Q3hRQ3Q0TEF2TVg0NXJLY3lDR21qN1BGZHorQVlM?=
 =?utf-8?B?bkh2YitwM1dQWGJQV1hSYUlCcWUwTmVsZGt4L3NhaFRRdFpVTEJUeG55NlNL?=
 =?utf-8?B?MGtocHpSVEdyT3hLc1RwME15YVJDNXVGZ3lieWlWd2lMaXRxczZQM3BCU3Jq?=
 =?utf-8?B?WmJFdjRFeUEvNWE4STUyT3hvbnN0NjdLcnZ6aGdCVlZrK2EwdCs2YmkzdTYv?=
 =?utf-8?B?d00rajkwWll5ZVRSTGtRaXd6YnpiZkx0TzBXOEJOdnhzOU1EU1VTN3hFdFdN?=
 =?utf-8?B?WXZHbnJ2Vlc2ODB1akZ3dzRxYXdTV21OdWx5ZzVnY3c2S0xmcW5SYnZXcjBw?=
 =?utf-8?B?RGUwOU5zT0xzeWJxVE55c1pVOHlTWHJGYXNsMXNUZHoxbFlDS2FDR3hPdlJR?=
 =?utf-8?B?VmN1QXJhQlFXMTlOcFEyWUVRTmxWcHdXWXdCbUxSZlRjTXBEUUJkVVJhcWFx?=
 =?utf-8?B?MVBuekw2NFNaQUhjZ3dDVDRpbmx4bktsVm1PYUZJMlVIQ0RNU1VTdE9XVDNJ?=
 =?utf-8?B?TzlvZGVmOUprbktUeEdvNVhEWmFjM2pFZE9qb0dtUit4cE8zNlRQZGtXYUpU?=
 =?utf-8?B?UWh5U1VPZ3pNbnZ0OE93ODJPOGViUnYyL1dBcDB5YmZBd2RZKzk4Q016RHhk?=
 =?utf-8?B?QVBTWTdIeXFkY3dRMVlUbzNTMTRqK1N1WmdYWFN1UWJKdG81eEZNQllWSG9R?=
 =?utf-8?B?bk50b21VZXJqZ1JwRXdKZU5LMFNmMzA2ZVZPbFNXQWw2Y1JQNTRkQTI3VjRE?=
 =?utf-8?B?MStwMTh1bTlnUERSSjJHSnBvMzJMbzhFV1BEekF2bmN3RVA1Vkd5WElxS01u?=
 =?utf-8?B?RDBocDIxUmZqSENzM056OXVhNGtQRFdsMkdOMFpJMHk0VWRUZ2V2c2N2aTJj?=
 =?utf-8?B?YTl0WDJPaFBFZDJLZ1l5WERsdmxzb21KNzY0TnV2bTVIU2Z5V1g4RnFlT05W?=
 =?utf-8?B?Z2Q5Zm1ITWtSeG81aVY4K0wyVVF4QUJkOWhHL3VXY0syNGZ0Uld1Q1ZwUXE3?=
 =?utf-8?B?RGhUWlc2RHFRTTBQaDNnNUlvdnRpMnozWlZrMkRqSExoN1BnWHg3QVFkMHA2?=
 =?utf-8?B?enJUZ2tja1pMWktZUmlUbUN4U0RFQzJTMGVZbDdVU3ZvTXFYNndWZ1RhOVR2?=
 =?utf-8?B?Z3p3N1A1UmhJSDdOTXZ2Wm9CcW5ldmdZOG9TNHJ6QkJOTUpRVTFZemlVTGYw?=
 =?utf-8?B?STRmaWZPNG9NbFh2byt2VFNQeW5kWkUwNC9MZlo0RHNaV0pWZkpsV01KZWVN?=
 =?utf-8?B?RWR2NUVkZGZkQXB0cjhJWERwb3A2c0ZVbXpOUnhvUTBPaVQrUXdwZ1kzRnNM?=
 =?utf-8?B?Z1QreUdxSUxDUGNvNFVNL1hBUHBWU1ZmZFJjVHB3NXRNRzFFWnc3c3NoSFN1?=
 =?utf-8?B?ZzhINlBFNUhJTlNTTkN3VUFEc3lQMWQwM3VaSTd6Y3dHWVZKamJBenhOejlM?=
 =?utf-8?B?T1dIZ1BJb3FyY0Y4MlU3aE9CK1lTZmIrSkZLc01icXJaeG80Mk9TWEZaYmNX?=
 =?utf-8?B?WThIUUp5Zk9Rb0l2eTBPVDJCbHpUV3BMK05DOEV0YTkvTGxvcnJickpNUGhM?=
 =?utf-8?B?VFhHZWIzN0tQUG4xUGhFWHM2dkFDWENiOG5ERDczSUhKcE9mdnhYaWdncGhD?=
 =?utf-8?B?REVIWDNIbWxFenptQytXMXBEVkhwSUJ6WTIyaWlnYk45b1F6OXM4RDhIRHBX?=
 =?utf-8?B?M0FGbldKQ056elhBQUdSVWhGdVVMck5LeXBvbjdYV0h6UGZLLzYrTUFuQWtx?=
 =?utf-8?Q?b7m0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4949dbda-d9bc-496d-da79-08de30a570f0
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:47:05.9007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i7uK6bmr6cA00S2lnZcA34CnY4WaFrXL72aWeiTCOtCXMlf/KJjJqs33hjaN4Xh9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6639



On 12/1/2025 10:43 AM, Mario Limonciello wrote:
> + "Adam J. Sypniewski" <ajsyp@syptech.net>
> 
> On 11/28/25 9:12 PM, Sashank Karri wrote:
>> Dear Bin,
>>
>> I apologize if this is the wrong place to ask this question and
>> suggest this very slight edit if I understand how ISP4 on the Ryzen AI
>> Max+ 300 series SoCs works.  So the ASUS Rog Flow Z13 2025 also uses
>> the same Strix Halo chips, albeit using the non-PRO series.  On the
>> Windows side, the 13MP sensor, also from Omnivision, requires an AMD
>> Camera Driver, something speciifcally also required by the  5.2 MP
>> camera on the HP ZBook Ultra G1a.  So if both MIPI-capable cameras use
>> the ISP4 technology on the Strix Halo SoC (do they?), this Linux ISP4
>> driver should apply to both cameras, right? If so, shouldn't the ACPI
>> ID for the 13MP sensor also be hardcoded into this code
>>
>>> drm/amd/amdgpu: Declare isp firmware binary file (https:// 
>>> gitlab.freedesktop.org/agd5f/linux/-/ 
>>> commit/35345917bc9f7c86152b270d9d93c220230b667f)
>>
>> Adam J. Sypniewski suggested hardcoding the ACPI ID into the I2C
>> driver here to have the 13MP camera to work (the ASUS specific ACPI ID
>> for the sensor can be found here):
>> https://lore.kernel.org/lkml/aPeqy11m-TxwbzJV@garrus/
> 
> Two things:
> 
> 1) Does this work?  I wouldn't expect it's enough to make everything 
> work 100%.
> 
> 2) AFAICT the Flow Z13 has a USB camera for the front camera, but the 
> rear camera is the one that uses the ISP4.
> 
> So I'm confused by the commit message saying that the front facing 
> camera needs it.  Is that a mistake?
> 
>>
>> I'm entirely new to the Linux kernel mailing list and very unfamiliar
>> with webcam interfaces and how ASUS has chosen to interface the 13 MP
>> sensor with the system, but I can confirm that it does not work yet in
>> the Linux desktop, so I was wondering if the work on this new driver
>> is necessary to get it to work.
>>
>> Sashank
>>
> 
> I think it's going to be a bit more than just an ACPI ID the ISP4 driver 
> though to enable it however.  amdgpu has a list of sensors that it 
> supports (you can see isp_v4_1_1.c for details).  This currently only 
> will recognize and configure the GPIOs for ACPI _HID OMNI5C10.
> 
> For ACPI _HID OMNI13B1 a new entry would be needed there along with the 
> correct GPIO tables that match.  This will wire up the pinctrl-amdisp 
> driver to have the right GPIOs.
> 
> Bin and Pratap can comment more on the feasibility.  But for now I think 
> we should treat this as TODO for after the initial series lands with 
> support for the sensor in the HP ZBook Ultra G1a.

Thanks, Mario. Some more comments, Windows and Linux have different 
architectures. Windows uses ISP and dedicated sensor drivers, while 
Linux places all sensor initialization and control in the ISP firmware, 
functioning like a webcam. Adding new sensors requires updates to both 
the ISP firmware and kernel drivers. For now, only Ov05c10 is supported 
on HP ZBook Ultra G1a.

-- 
Regards,
Bin


