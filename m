Return-Path: <linux-media+bounces-38610-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F55FB1480B
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 08:13:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88DEB16C35A
	for <lists+linux-media@lfdr.de>; Tue, 29 Jul 2025 06:13:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893DE257444;
	Tue, 29 Jul 2025 06:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QggZqcpY"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2047.outbound.protection.outlook.com [40.107.101.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2B216F8E5;
	Tue, 29 Jul 2025 06:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753769593; cv=fail; b=PEgi7lr86JihnIG3x7q/cKChvy//Soa8+dxWqJgQYt7X03w9LBtZayy/jdnpCgBiffk49RXL48/3sOjdsJ++ojLl4e5J+Q+kZBhctExbsMNXKvCmEAdDwyImLBqpQkmRHYZaGNtQBVmMk+QPvEFMfwbyy6LP5GP0GO8SqihkM/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753769593; c=relaxed/simple;
	bh=l/IuuIDGwoCaqW79gWysX/SEMuHLBxPFeDJPg2lh6NI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E8viW0wMBHbF82PFjQSi0SOVnCGa5r1shcKBfXznt0ztlDEQ4eUzPNBp4VCXdmg0rh6gw6b9VwZG/j5RlUCikew+sGaEU0flM++WR3QRc0XlwHNF0BN8yNn24VSWNOtuqoVOb/tt8jijSjB7tYye9cSniYI+6j6jyJWANRtS8+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QggZqcpY; arc=fail smtp.client-ip=40.107.101.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iS8t5Ymw8g/7MY5gVpFjspLk7ThKdQBpij8ckETQWaEN5JFgzvT1vmpFdfuLgyUbMNRKXEZD8PahLJLA36K+9f7FYs5msdtT7m04vPniZoHj8reA7EWCKSVvuzHEbARe2k7JuUWxZFlV0Gcmb7S9xeuJDPEg6kQA+Xdufb8oUwRCcRSPdBvRayxxWmX4ErmiyRIym6LMInaZGRPaqdPdeBUjJ+/uFEiUaJrVh+n+tFIU9g/LuT71XDx3y6O9HiMNY2xHvVjBXKaMQLem0lmnRzGugQpcNsUEop0HrG5r6BMdOSf3hxms0HQy9IUskYqL0MhJqPjxHQaQxO1LYuG+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF+3E1lZhDoBdmV70sGEea8LkMSiHmyAJeMzKuc2cvg=;
 b=m1izrXfcRAZ6BH448oG2v3oVKHfLhM1Rb/CBc0wqiwdPS4mez9BWNzXlZc6Z3zbKF3FHYCQjhGOtswG+f8wMPQuTIakLdu2PHebMqrUGEU5zwVy/9TSZXuDmVDo4IFMihB7+rCKSjS1zGT/VLeF+d+5s6umaq1gqSn8HHQ06WF5uUVeTfB99GEuMcojXlmeF/JX8MG2ySgtnoqpIXEYVTDzQ50eikkg4RWmpKBb7bRd/0rHiBEy/YjuUBMiDKX8Hh6QGw6a2db3qwFBRD2JDsna3PMGcr5CgBJOSx55iRfSYKky/T9VPFqBBXwidDc7YH3g8hG5VBQ9I7ayIXjMf8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF+3E1lZhDoBdmV70sGEea8LkMSiHmyAJeMzKuc2cvg=;
 b=QggZqcpYd4TBUws9SlZj4pYZmvxG69s0iIdyI+0BYl6C03zFZJgG71Oo/VSvKZ1qhzYzomTPg/0BrQJ/1w8le0/pfIpMZyu5zW69V9IHcAchM+3sepPOq5IKUCQZoNrEXMCaUpsHPoxlGbEzS+3NSXdm/+HntgYid7+vzi4xDjk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 06:13:08 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%3]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 06:13:08 +0000
Message-ID: <13296d80-082c-4e36-9c4a-b23528928186@amd.com>
Date: Tue, 29 Jul 2025 14:12:58 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] media: platform: amd: isp4 video node and buffers
 handling added
To: Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 bin.du@amd.com
References: <20250618091959.68293-1-Bin.Du@amd.com>
 <20250618091959.68293-7-Bin.Du@amd.com> <aIEiJL83pOYO8lUJ@sultan-box>
 <ff2f17c6-c5e4-4b7b-b897-8abb4cb79c35@amd.com> <aIVLlZvTQFoBL70r@sultan-box>
 <aIVNj1DLab18eArC@sultan-box>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aIVNj1DLab18eArC@sultan-box>
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
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d3c831f-c870-44ff-a375-08ddce66fc9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEhsOXE3cDBzYWo5TkRxa1NVZVJPaEcxZFBodEZjZ3lSd2ZRUHdkQ1lWM1NX?=
 =?utf-8?B?RDZpUWY4UFFQa2dTMlMyem41eHNkbTc0b3pWYTdYWWFzdVZUREZZTXRhNmMx?=
 =?utf-8?B?cjRBaWUvUFdUVlNFaFFxTnFBRVFIcHp3SU9mUW5LTHZ6a0ZkclBVaVg4amZZ?=
 =?utf-8?B?ZmxqT1NpZjgwM0poMUo5VklkMFJZRlpreU1HWko1bTRtRkxOVDlmYUtxV2ZZ?=
 =?utf-8?B?b041WHlKNFFqVElUelFsVDN1RDg1dU1UbVBBTmNxOS83ZUFKa0tLNFMwakZ6?=
 =?utf-8?B?SGtOUXNYWHFTUGxFdVdrbGRKdWNpcHJEN1RMWkpGaHVYbDRXeDg4NW52K1dX?=
 =?utf-8?B?OHF2Z1puTVBtOFVvVXNMWVV3dXRJdEhrYWsyS1pwb2dMbVdkOFV1MytKN3pi?=
 =?utf-8?B?WTJmV1R5TmJ5OXJjYVhSeGM0VUJyZnNQZVlBN2dTbVNPWUpBcGZMWEFQUy9X?=
 =?utf-8?B?cXc2TDd3a05SaEJUY1M4dEVFMkVNSktzSHNheEMvb2RneWgrL2FWeVFrSXlE?=
 =?utf-8?B?S3VtVUtkcUYvYmhJRXJ1bzJMRWZYQ0FXZG81d0dyaVh2d1FsT2h4eXhOUVk1?=
 =?utf-8?B?aVJxL0RPT2djdzRTb25MV2ZDR3ZuL1BOaVlycTFPYkIzbVVYUDJ4a3dGc2hn?=
 =?utf-8?B?ejZ0aVNrSStic05VVUFhSVh5Tlo2NGhSRk1YbHo1N1FlOTEzQWRINFRIdVZC?=
 =?utf-8?B?VnhaakNpTks2ejV4Wmt1YnFLaG5EV1psUDdkZG5FTGE2Ui9DbWVHUmJZMkJS?=
 =?utf-8?B?UXJoN0xvNEZBSG9mVzliTURYcTBtY2QyaU1zYXZXUk5nUFpPS29vQ1pCN0lQ?=
 =?utf-8?B?VmtrVFg1WUZ5YXpSaXhHbUFNSTQ1VEl0ZWdMSmpyUGludlNvd3BLTUJOQW9V?=
 =?utf-8?B?T3VXU1V4dGN6NW9DRVZPbjNYcDlCVXlsaTUxVDAwVlBMdzN1b1Z4dytKWWt2?=
 =?utf-8?B?eEhic2c1T2VKL05kbGQySnIrYS9xbWViakJKTUxEQkswNkVjNGlpaVh2c2c0?=
 =?utf-8?B?dTFzM0lGSGx5QkFvTXhKT0pCS3gway83YXlKUWR0V0NuM01yMDVYMmNOSzBp?=
 =?utf-8?B?ZHEvbVRlc01MYkFMTFh2cHRyU2hOMUt2UStJWGROMFZGUFdoYUtOZnFycmlU?=
 =?utf-8?B?bFNtM2pEdEEwck5leUV4dWZscmNoVHMzd3J6Y1RLS3pBQU92RUI5NkEydHBW?=
 =?utf-8?B?SWdKNVY5cFRPNWtwNWNYQm1IMWxkcHZpY1B2dEk2SFNuTlc1RTNPVzlhMHRl?=
 =?utf-8?B?WDZGOFY2aVRpMWR4RUhNWHp5VENBdHpqeUpSa2tteHB4RHpCTTlWK0pxWDFY?=
 =?utf-8?B?OGplUTRqYlNJczd4VW1LYTJyMzFrUFFyZTNibHJBSStWdFpiTnNzeXFraG5Q?=
 =?utf-8?B?UjhtZTdJbS9jUmpLckpzRkZZWVdrTHRoV1FDVFI2T1AzaU03a243OTQ5VEV6?=
 =?utf-8?B?MXY3TFBDcVdkQXFGVzlKaTFTSHJSWHFwRmxZekI2REx4QmtGRjRmcmFGbkZ0?=
 =?utf-8?B?UG85L0Qrd1EyZXVXaTJid3hCVHQvZGo2cWY0dDkyS1h2UGMwRjBsdS9Nb3BH?=
 =?utf-8?B?aC84a0RJc2x3S3RSaE0wajhla0xqSXlUd2VKeXRBaXJ2MUZFemd6VTNsRjBy?=
 =?utf-8?B?S0kwek5Wak9iNnA4U0lybFlwbWQ1dGV2UytDdmZvYmFKSVVhMnZidnRRTXRU?=
 =?utf-8?B?RUlKQnd5L2E5Y01Vd2QyTzhRTno4Qk96SXdLcmpIdmdsZW9vc0Q1eWxTcTBy?=
 =?utf-8?B?YmFqMDBiNHE5R3FIbWw0NklndFVZMHVUYmt5alFFZmNWMG9oV0FGMTlGRTd5?=
 =?utf-8?B?TFVid2FDSVVGaU9zamszUXY0emdiTGZhOXRJTS9Kd1RSNjVlTC9NZmtMNGMx?=
 =?utf-8?B?SXlpR2dPRHZud0J2TG1tYVUvb1J0WFBCdXA1eVdFMmd2ZVdTVnJmR1VyZ0U3?=
 =?utf-8?Q?+J4jwLHg/ZM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MEVEVTJyZ3hkaDRhM1hFODMvSGhocmxWc2ozYVV4RWgvTSt2ZUVseWlWNHQv?=
 =?utf-8?B?QjhucGNudXNNOHFJNmZZWFBMZS9ZTjRMSVZoMXZJaC8wY05zeHNUaE5Nc2po?=
 =?utf-8?B?NXZNTTJXVkRwZVZ2VlJqb0ZLaEIvUkZNUmZsUDdRMnlwMnBXVm53c0RZUmN2?=
 =?utf-8?B?U1J4VzdYQ3JhbUpjbGMrQ2ZWUjRNMFZpc25GTjBobWRqVldrWE5PZXBVRGpq?=
 =?utf-8?B?UFNHeDVOVUVvY0pVbkVESUJocTJVOVAvUkdFOGNxNGs1UVZyZk1xUGFjaFFB?=
 =?utf-8?B?Kzk2Q3pyMkxhWUIrYSthRm1WdEk0RHEzLzFSUHlwblJOR25GVmMrOHBXb3pa?=
 =?utf-8?B?VWZ3RXdnYVBtSGlxM1NZcXFLYjU2K0FXeTFrUENUVTRSNHhoQkkvSkVXdDVo?=
 =?utf-8?B?SXlMeDFrMnFxU2Y5QjJrUktpSzJHbG10STBsTEtwTCtoQlFlWi9TL0lVRm9u?=
 =?utf-8?B?b3BMK3ZQMlU4QW5wMFdtaHNZOW1BRWM0UUE3QVo4eDI2aGY4NDBLOXVrK3pj?=
 =?utf-8?B?QVBydkRzWXl3aFRMNzRnWXp3T0FmS3pGUFdRMndiMTBpYXdJMERhTjBmU2hz?=
 =?utf-8?B?S2hYblplY3JmMzFlRzVFaDJ1MnRKajhJYTJ0OEZmNUZUTXA0RGdlWGNHRzBm?=
 =?utf-8?B?R2c3Rko0SVR5WHdTd1FlR09LYk41RkFMK2N1blFjSGc3OVJrMFlvY1o0S0ds?=
 =?utf-8?B?UkFzeEY3cWJNNWN3SlNRMHRHOU1KN0p2QXVWRFphajBWVVRYOWtWRWo1QmZi?=
 =?utf-8?B?VTNNNlBPblNYelZ5UU1BQkdqclJBSHJRVHJLV2dWTEp0a2dnL0hLQ0Z3bWNV?=
 =?utf-8?B?MGY4RVZ3WDEvMnF2MXk2ZGFmMmErMEpieDlCRkFPWmVxMnZTejJTMnBvcHJl?=
 =?utf-8?B?MEp0cklFQ2tubExnKzFiUzVQT09hY0dzalNsSlQySWhpeXdEalVPNE1XMThM?=
 =?utf-8?B?b282cEVnUGZzWkE2WHdNS1RqWWZrbyt3cTdBdEVhem8rSHI4S3RJRWlaU0Zo?=
 =?utf-8?B?NEkxVGlZNURVZXl6NU0yN01EVnpXNHl2RzcvOE92MXZiK2Fuak01SDYyT2t6?=
 =?utf-8?B?QVBpL0RsdzVVdE5KWXd6S21CNEZ4RUpQYUJDQm9NSk1CMmlwMC90R1d3KzA2?=
 =?utf-8?B?cFJVQnZiaGN4SmJkajBQMnBMeklPVDl5TnQvSFRQVnZyU1YzbTV2ZFNkZlIy?=
 =?utf-8?B?em0zRkN5eU1HZi90WDhmeFVZbVFRV1V6NkREQ29tYWdGRnlnTTVDRVkwaUsz?=
 =?utf-8?B?d1FqT1BORDJpZ3E2SFRRMW5WbG5LOHFRTnV1OE13ekRBSkVLQkdwb3lSVDJh?=
 =?utf-8?B?MG5FbGlhcmJhT2h5Z2h0aUlKcmhpY0duZk55OUpEL0VudnZKRzg2WkZmZkNK?=
 =?utf-8?B?UlJ6WUtuTk9mMkFkaGJnblV1K3RVdHk2UE9HWUZZR2N5OEFySTZVRmZvUmhW?=
 =?utf-8?B?QzQ0NmhxMUwvM2xZTnZWR1hVb2k5ZUVKbTYwOU1YN2FXbUxWaFh0cU93OFU2?=
 =?utf-8?B?azRyYVQzbDR1a2JSQVIzdU1JTi9PclU0SFZ0WXRCUTZmSlJpNVV0d1pKN2py?=
 =?utf-8?B?SlQxMGlsS1BCeC8zRHlzYzNQQ2ovZC8rd1VMMnZieDlPVFd1ZW5PVWRNek5u?=
 =?utf-8?B?Vm5UNmo4c0FxZEt1RTVGYVMrL2VKTDhYcjI4QWxUeUEvOElvUWNMSjdHQ082?=
 =?utf-8?B?ekhGNzRnakc2Q3FaZjFHcWRxTkVXcThaRlA2aGQ4OXlBZkYxdEhzeVpuWCtG?=
 =?utf-8?B?TEhlWGVSWWlRSzg0RFV0VlVYbmJzK2syQWExWUNDbzVOS1hEYnRPbDJnYURv?=
 =?utf-8?B?L0gyREtqTTBwcEJ0cjA5UEpSRkhySU1xL2h1K2QwVDdiMDNaKzh4NHNXUVQy?=
 =?utf-8?B?T3Vjb1cxRFpkS1lOcEJpMENZWkVNR2tWSEdzeEJwS0gwQzNMKzF3Wi85N1E1?=
 =?utf-8?B?TmtKa0ZIREcrRVJiSXlmM09LV2dtUmVNZnI1VEZZYTJ5WVhQaGc0M09oUU9X?=
 =?utf-8?B?M3VxVG5NYVdLbmpqRnZDbGt0cWJHOUVqUm9JbWw5cTA5bWpqL2ZKZXRRWGpP?=
 =?utf-8?B?L1ZjRkhoc3NTalpmQmpUeVM0WlNXdUpsS25JUElkZUp6WHJKL2VxSjcyVTBz?=
 =?utf-8?Q?ucAk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3c831f-c870-44ff-a375-08ddce66fc9b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 06:13:08.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uHYKsed9ll1sY+tNM2OUmA+5iv/XzVgQuE922g/gFz6zgbqEhHnIFchkEu/ShPzA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189

Many thanks Sultan, will try your changes in this and other mails 
together and let you know the result

On 7/27/2025 5:50 AM, Sultan Alsawaf wrote:
> On Sat, Jul 26, 2025 at 02:41:41PM -0700, Sultan Alsawaf wrote:
>> On Fri, Jul 25, 2025 at 05:22:41PM +0800, Du, Bin wrote:
>>>>> +		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0",
>>>>> +			 refcount_read(&buf->refcount));
>>>>
>>>> This refcount_read() is a possible use-after-free because `buf` is accessed
>>>> after isp4vid_vb2_put() puts its reference to `buf`. So something else could put
>>>> the last reference to `buf` and free it after this refcount dec but before the
>>>> refcount_read(). Maybe just remove this dev_warn() entirely?
>>>>
>>> The warning is important to debug mem related issue, plan to keep it but
>>> without accessing buf or buf->refcount here. Do you think it acceptible?
>>
>> Yes, that sounds good. So something like this:
>> `dev_warn(buf->dev, "ignore buffer free, refcount > 0");`
> 
> Sorry, to fix the dev_warn() we need to make a copy of buf->dev first:
> 
> --- a/drivers/media/platform/amd/isp4/isp4_video.c
> +++ b/drivers/media/platform/amd/isp4/isp4_video.c
> @@ -584,8 +584,9 @@ static void isp4vid_vb2_put(void *buf_priv)
>   {
>   	struct isp4vid_vb2_buf *buf = (struct isp4vid_vb2_buf *)buf_priv;
>   	struct amdgpu_bo *bo = (struct amdgpu_bo *)buf->bo;
> +	struct device *dev = buf->dev;
>   
> -	dev_dbg(buf->dev,
> +	dev_dbg(dev,
>   		"release isp user bo 0x%llx size %ld refcount %d is_expbuf %d",
>   		buf->gpu_addr, buf->size,
>   		buf->refcount.refs.counter, buf->is_expbuf);
> @@ -601,8 +602,7 @@ static void isp4vid_vb2_put(void *buf_priv)
>   		kfree(buf);
>   		buf = NULL;
>   	} else {
> -		dev_warn(buf->dev, "ignore buffer free, refcount %u > 0",
> -			 refcount_read(&buf->refcount));
> +		dev_warn(dev, "ignore buffer free, refcount > 0\n");
>   	}
>   }
>   
> --
> 
> Sultan


