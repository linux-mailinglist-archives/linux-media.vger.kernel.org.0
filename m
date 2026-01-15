Return-Path: <linux-media+bounces-50745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3BAD22778
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 06:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87186302B117
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 05:56:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5CC929C321;
	Thu, 15 Jan 2026 05:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="e6huNh49"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D32367DF;
	Thu, 15 Jan 2026 05:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768456608; cv=fail; b=YJ+iyTWVRaKvPLdLqBmJJK4GVzKL5AD08ELgLHtdRCKjY2iL7/dO/dB/QALB5yVu4YerDKVB32UGjErumVXCDHLxoecRJKwq/tsUyNg+j0Yl8QammARY6FygPalc/vJIe4J3ZwkN9qfZeeiaNKeArTxly3nR3BrpUBfUNIjd9h4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768456608; c=relaxed/simple;
	bh=qRrcZFxoOIoe4midjqcfJMU+tZPUkVvIIPlD2FRmMAg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WqEBGNiUr7LP48oRGzwn5+2tKyMuBFb8VwXEBQVvyBoJZg5Xm3KmlkjFGOb3I6wJGkeF8WJpU12giqpbsnPOTwREotcYL5pz4SSOa+W+fRdwhKQZGYYwwAdyVepnzoJ5B0HR5kY19aPP023aWx8NJ/rASKQhYil6EVaddcoNIdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=e6huNh49; arc=fail smtp.client-ip=52.101.46.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tj/DUAg/gvy0t1oeMU4L3RDb0NnPCbXcR4gkLQ6oAPSFQfmi1mgtSjve8yW7Mqr0Mi3iKyN2SQ/TLksCs2n9Dmv3mFloaSebuK//eTtSCFif4kZ4hzntUImgSeCJKw59tP3MeozDJCL8crty0vIVAs0ydrfrXgtJ4oQKYP55pBJfVLU1qM0wTTjwU3RIjPgtDq0k8k4fEAxIpnLmJYp8qq7kRJIm2YrTMInrNp+D/CTdfX8bd+aDi5befh7WqOPOdWJYNpHgqLfTcEU+UKgyvnZ93gw7k4T22SS3LwIt24tsj0Q125ktbXdyBEuklMwU7yxolA4QmB7ZtmDOvtM9YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywn8XVjs8CDrRhjLr9IoP1yXdhifoYpG8Rt4iuRS+p8=;
 b=ECGv8f9mou8U8tGKnK4afjMe2scYfauMV8ceIQCpkmQgHTGmvnZmsMo4wZKh0xYzcStVECuE2+aI/tErg8buyrmmqEnhUlNQvkKq7HlpPnD9YPNy/uMYX0DcL8iK7C418FHIkwGYGslms8uDCyEa2l5KlGkx/ZBQ31UDINSKlmukYfmh/2p7Z6eBDghRryGSlQLt0X4UCnwUu/1Qp0R/b15yONwR7lcb5fasmRkpSiyWW6bfDAOMN0fmCk9GZy+KiF5mhzif2OzBxNOkmv5sue+upe+ugTzFAxf29KqvCPtRCukJbTbvsSPFwrSpLoi51B3gzJdtSOc+TvFpC2PJKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywn8XVjs8CDrRhjLr9IoP1yXdhifoYpG8Rt4iuRS+p8=;
 b=e6huNh49C1gqV9iI3RgcKF09Q5y2oLoRKd/2MwR7yUTxJ30dgBJdwuidkaavMPWAhhwHNuZbzXDskwMPXPQzgbCpViTzuRNgQJZ4XIGnHe35q5M6C2iTjIa4dnQHi+gQI448oP/neJoGM61421BUcD7krmiP99IotYPfdK5EvF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by SJ1PR12MB6268.namprd12.prod.outlook.com (2603:10b6:a03:455::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 05:56:44 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 05:56:44 +0000
Message-ID: <db6d11e2-0131-44a5-858f-e255923b9d5e@amd.com>
Date: Thu, 15 Jan 2026 13:56:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] media: platform: amd: isp4 subdev and firmware
 loading handling added
To: Mario Limonciello <mario.limonciello@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sultan Alsawaf <sultan@kerneltoast.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, pratap.nirujogi@amd.com,
 benjamin.chan@amd.com, king.li@amd.com, gjorgji.rosikopulos@amd.com,
 Phil.Jawich@amd.com, Dominic.Antony@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com, Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-5-Bin.Du@amd.com>
 <aUkZP8i90uWaFliY@kekkonen.localdomain> <aV4MYcgdOviulN3E@sultan-box>
 <aWgEtfp1MWioqKox@kekkonen.localdomain>
 <bc665c1d-f2a6-495a-bda8-012b2619f0c4@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <bc665c1d-f2a6-495a-bda8-012b2619f0c4@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|SJ1PR12MB6268:EE_
X-MS-Office365-Filtering-Correlation-Id: cfbbf25f-981f-4cd5-15f5-08de53fadc4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uy9aendqTlA0dHhLNS9ybDgwZFI1NzZKWVNBaEVjTGpEU2JHaDFRaFk4QlBX?=
 =?utf-8?B?RXFGVThlUk5mcldwVTllSUlXT2EyS0hDQ0dQQklPZU1QdUxVZ0ZFTTVDakRW?=
 =?utf-8?B?MVJWQjRXSGxsTkdDNjhhRUJWcVM5TTg0SGhwQko0bm93RnREaWxSbnBIWW9h?=
 =?utf-8?B?Sy9ZYmVsTWNqempkUDg0Q3ZzM252UVg2NFBtSFZwSmJ1SDQveWpoT295RFl3?=
 =?utf-8?B?UVVLaHErUDV1OUpLOHlVMCsyQ3pldXEwNXNZcTFzdnZGMXFKVUNOQVZydWIx?=
 =?utf-8?B?SHUyK3ZWd3dUUUg4N3d0cXRWUDJKVWxNSTJkYndCZjBGZmVaYVMrdzA5NkY3?=
 =?utf-8?B?MmtZcFVhODl6WTVaMmdud3FRc0NOVGRCU2htaElXc0E3bTRZYmk1Wm1kVHcr?=
 =?utf-8?B?cC9yMDZNOTFJZ1BKTnEvc1dyUEJMa216dzdyUkNiM2tacGpHNEJiMFFtUVNE?=
 =?utf-8?B?T3pZWEhMUVYzNzVPNCtENGNTSUtsc1V6U3Zna2J0MDcwVC91RGZRS1RGMFVN?=
 =?utf-8?B?cHZldzVxanQ3WDhFWTIrM2xZN01wYmRCL1pQa3d4RG1Md2kyN216S29va280?=
 =?utf-8?B?L0FRdzMzL3BDVVpWTGlVRXF2eHBIUHVQWWczeThzMzFuYm5JVklNTDZlYVdU?=
 =?utf-8?B?NUFDbmVxL3hvbHRVc1lrZHZYdGtSSURJU1FlcEdtakt0dC8xNE5ZNjJaZjZL?=
 =?utf-8?B?TG0yQWhyN1hHYkJIZDBrUDd2R3lvUHl5ZXpSRlovYzZ0TWhTcjl3cDhQUzBR?=
 =?utf-8?B?a3FwV2Z1bEJBM2RaSjVYWDlwN3BNTDBkakNnWmU4YWhhMSszSWJlWUVkazZk?=
 =?utf-8?B?VnZUSjZhcHY5TFRaNzgycUpxTG5EK2dxZVMzWk9nWksvZTlRYTM5d0o5ZzZS?=
 =?utf-8?B?Q043WFpWZEtONGpzQ1NHMW44TmIxQjc4dktNN2dvUmw2T29lMXpVVC80eCts?=
 =?utf-8?B?ZzRreXg2QTNCM1dyQ0NoVTREdDlJYzhjVHY3U2pPOUpyaHZlbTVuTG5mMTUw?=
 =?utf-8?B?N01RY2VhSjNkdE5ScXk2N1Q0b0laVWpZMit4bVNsV3NYbVY3UVVPaEVCaXV0?=
 =?utf-8?B?RXpzTWNhdnFZRDhkcjd1L251T21IOWpkNHJZa2M5K1R6dnRGREo1SHVBRzFF?=
 =?utf-8?B?QlJNeVBieGUvYzVEUU9URmRDaHlCWkYyeHIybGtCRnZyNUdPTWdvM2d6M1dJ?=
 =?utf-8?B?Z1hZdFB2Q2hCcjltZjArNVJObDhrclpQUmhCOGRyNmNHcTZhL21hTlljbVA3?=
 =?utf-8?B?am1iK0RaUUJtcjRwRkFCd1V4VFhDaGZIaUpDbVpqQlp0cDZJMTVOL0lkMG5a?=
 =?utf-8?B?dExLM2xaaWR1bitnaUZOeXRSSXZEQ3RZRUpvVzByVlcvQkQ5Ny93SHFITjV1?=
 =?utf-8?B?Q1pCMkRlZ2NIR29IbzRJdGQ0MEFzNVFFdTJlWFhSMVdJbnRTbldsWmZyWkJQ?=
 =?utf-8?B?bzNtUWhrTXV1WWlmK28vZzZndWR5amxXR3NERW52QUVtUnhPL2d0OGlJUmk2?=
 =?utf-8?B?M0FKUUNiZWo1bW50aGxWb0ZwclZ6SWQyUk5IYUlReDRMSlYvSUZhTDI2cmZ1?=
 =?utf-8?B?d0JJQUhSbk9jRXI5c3V1WkRNYjU4a3lhalNtZVJaSHVnK0lPRFhjN0NwckJx?=
 =?utf-8?B?WFJaZG13cUVPSU9mM3VYUTM4TEp5N3QyZ2RITjNlWmtWQXBCSkZqVGhpWkg5?=
 =?utf-8?B?blpubnpYczJyTWkvTTB4T0lXY2laRkVYTFlUUlJmQjJWMy9HS0dCOEw5eXFZ?=
 =?utf-8?B?WWhiQmNtbFFtM2ExclNiK3Iyc2laVm42SjZmdUw0Z2dsc1g4Vy9ndUJDQzZj?=
 =?utf-8?B?Z2g3amRKVk5FOElxb1RObVJUazFpbEt6Mm1rc1BuZXBlMm00MnFYb0ZMSnBP?=
 =?utf-8?B?cDBjZlhjNFFqMklNRGJyTWNIZHR3ODJ6MGZ1Z1JsK1F0MDJKK2tMVmgrNUNl?=
 =?utf-8?B?RDU3UU84RVgrb0VERHBLVEwwR25SSVVDcXpKaThlOXNnd0lseEtRUVFKYThn?=
 =?utf-8?B?bjkyZ2pxZnVHek9LU2hvT211TWJ5U2Vjcm92alA2enNCekFDRTZwZXBrbGY5?=
 =?utf-8?B?cTd0Y21LRlJQSFQ4UU4zM1lOTlB6dXh3YkhTMGFkeUVTZS8rcnhPOWdGdUlh?=
 =?utf-8?Q?Pd2I=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXhLOW5ZQkpzNFI5bUxNU2d6d1ZFWG9wbnRoYmxCOEEwK1lhQjd4aVZoZ2gx?=
 =?utf-8?B?RURlZGQ0amg5Z2VhbXpISG1FTGFuNTcvclprM29lS3N1VE1OK29vRS9BaG15?=
 =?utf-8?B?TkRBdHZVWGhia244ZkowWlBXUGVYSjVqL29OamdhUmEzcHROSlJNREdYTUdl?=
 =?utf-8?B?WXhiU0lhclErREFob3ZjSkR1ZnBBeEVSNktheW5EVXJwWEZpOElTVXo3MUx1?=
 =?utf-8?B?Y1FCL0hLTGlNbllHbGYzQTJhZ3hFUE5JajhwQzhXMjZudzd6UmNZeTdxbHlY?=
 =?utf-8?B?WDdZSmlrVmlWMjV1MnJkMDhTZnN0OVlOUTlUdGVtRytlcVA1ODAvUTBJSjcy?=
 =?utf-8?B?VVlGb0NURFlNd2xVZlB4TkI4azJaY01LQ1NkQnVGSjdIa2JVSmNua0JRaHhR?=
 =?utf-8?B?aGdodW02aVQyQ05Vb3lmcHNHV2tOdVJnUlBoRWM2ODhPbi9DMjhsM1U5Tk1P?=
 =?utf-8?B?bjN4OUlDU1pwWEhjUEhTdDUzbllaYWVGSWZleEVtaUk3YU1PVHdRamtsejc2?=
 =?utf-8?B?TGZicXFJVGI1TmtWU1dPRHlFSzRNKzQ5dmcxY0c3WTlZc3NPdTUrYUNmUmhD?=
 =?utf-8?B?M0JRSWZjSnAyMFBMUUxUUUgydFREbkZuTHhzZmhxVmk1bWVHMTRJaHp0WG9K?=
 =?utf-8?B?bGZ6VDRXTEUzWU9FNUJLbTVicERxdnU0SVFNdHRSR3RlUWpQV05OK2xZWktK?=
 =?utf-8?B?aElXU1J2Wm80THl2OFpHZ2d4YXhZaER3cUlLSW5VTytLM3NneDFWTHFsYndy?=
 =?utf-8?B?bWNxa1lLT3NGWFI4blFqRWJUeGk3azduUC9IbUlxODFocHRNaTNQZzltN1Fi?=
 =?utf-8?B?bGUzZ3MyeHczWE84QlNqTG5BM1dYQ3Z3dVhrTXRlcEtUZTkxVUJFVGRSdS82?=
 =?utf-8?B?cURwUnVEWmErejZ2a0dQdjBSZUlmZmpuV1JCUU9FSnZtWDVlNG5OdUVWNEds?=
 =?utf-8?B?aTJSWndrdkI5a3BtVFZYUEJkTSswYisvNHdjb0VpMXZhaDRKT2ErZ3J2dUkr?=
 =?utf-8?B?Q1JZWVNjU0RLVHhEWDRLbVMyYWN0RnpjQVJMZ1ZPcDdIT0dHUFNMWTJadEIy?=
 =?utf-8?B?SXVzUklNelQvbVJjVkszRjY4RldBelNRdU5aZkZ5RysreUtweXRLWCtzMmNY?=
 =?utf-8?B?SzN2bS9RMVRIc0FrTWcwbi9qbGVLYm5hM3RoMGdyK1pQMTlTdEo0K1FWQ3ha?=
 =?utf-8?B?dzNZbzNmSCtVYVp4OXBteHBCODZNVmVlTVZUWVFvVFFLUzZWRzh6R1NIQ0Yv?=
 =?utf-8?B?WWJVZGpkQzFMK3ZKMzlPVCtuMVVtMU93TlZ1bEZLaEJJcGsrTU83MWJibFIr?=
 =?utf-8?B?dFBPSWxWdlJSNmtZWjhIR0NUK0pXNENONE9nKzBOWWQ1c0VLZzlCUUkvUWlq?=
 =?utf-8?B?MU90V21OQzltM0VtQU5lbnNRQXlWcEYzUnQzeHJJNmtZZTRlQzZ3eHl0eXBE?=
 =?utf-8?B?ZnpBd1MrUmp4WUpzZkswa1VEZjhHUWpDaTFBSTFTaXJWMFBjU29vemdUVVFX?=
 =?utf-8?B?bHppK1pBWm51aVU2MHVLS3FjZ2dLa1VlWElGdE9NZFdaWEVMVnlacUJ0M2lV?=
 =?utf-8?B?MHJ3WFY2M1RjRkZVMjRnRXYvWUNzRkROL3RRMmk5VmhVSHZRUFdtbmpDbUlw?=
 =?utf-8?B?UHJYOHhJc0xtamxXczRHQ1FhaFVjTkFWeHRFclNWYy9ucXYrQ2NZT0R5VWk5?=
 =?utf-8?B?L1dsUHlRcWZac0RrODl2MzRkYVVXSjVJTlZrbkIwd20xYmxVZzIyQUFFRHgw?=
 =?utf-8?B?Q1ZGb0FyaENYNDVSb0Q1clRzd29jekVDNGFQMnM4QlE0OTVMQWlFcmduK3pC?=
 =?utf-8?B?QWxjdjZtVmcxanJqRVg5MjFLWFRmWUdreStqSnlPNm1pS3dUdlYwSEIwVlRy?=
 =?utf-8?B?cTdQOVI1c0RDMHFPWURzejU0d05WZDdnNm1qbGNZUkRaczU5SG5Kd0VBeDBo?=
 =?utf-8?B?UlZLUGJCQXJWWUFLczVOMEVjdTBQT25ISW4xbXE4b3U5aDBCaHU3S2xsUkkz?=
 =?utf-8?B?a2k5STE5dkZlbnNRYjR1SktnNnJkend3RHI2dTYxYjdoQktEbGhrWG9xNXZP?=
 =?utf-8?B?MUFzTXBnZjA4TVd1aFQvWlBZa042aFdMcEZDM3dGVHVnWmNsOXk4NjBURCtt?=
 =?utf-8?B?UjRoNCtwZTd2U0FJNEFNUHVBaWgvTndYcDZaa3A1Tzc3UENBdFhYYzE0UGY4?=
 =?utf-8?B?SFBsN1RFV05JR1Vrc2JaYnl6bDE1QUovTmc3SFZBNVI3MjhsMnBuNUF2bFJu?=
 =?utf-8?B?NCtKSHBlb1BqRm1LWCsrbUlrWW5xWC85RWhjNGhnRXJ6RmZqYmZKbTN4R3Va?=
 =?utf-8?Q?GOz4B5XTpNfTpmgpgA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfbbf25f-981f-4cd5-15f5-08de53fadc4b
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 05:56:43.9813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xI6Z8YoNPecpv+CKtcDWqFVoHXiFxJlVeWuGhUesrbvAcPNh7W6aqXax+LMww05N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6268



On 1/15/2026 5:08 AM, Mario Limonciello wrote:
>>>
>>> Unless the firmware API structs are all __packed in a future firmware 
>>> update, I
>>> think the memsets should remain.
>>
>> If you want to be certain of the size of the structs, use BUILD_BUG_ON().
>>
> 
> static_assert is another option here too.   I did something like that in 
> drivers/acpi/platform_profile.c to make sure that a structure got 
> updated from new members.

Thank you, Sakari and Mario, for your informative sharing.

-- 
Regards,
Bin


