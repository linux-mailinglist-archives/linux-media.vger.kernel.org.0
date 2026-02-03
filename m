Return-Path: <linux-media+bounces-52076-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMOGKqaXgWl/HAMAu9opvQ
	(envelope-from <linux-media+bounces-52076-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 07:37:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 174EDD555B
	for <lists+linux-media@lfdr.de>; Tue, 03 Feb 2026 07:37:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23656303CD20
	for <lists+linux-media@lfdr.de>; Tue,  3 Feb 2026 06:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6448737C0F9;
	Tue,  3 Feb 2026 06:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="RDi07870"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010056.outbound.protection.outlook.com [52.101.193.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC37280309;
	Tue,  3 Feb 2026 06:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770100636; cv=fail; b=afOI3MC6L9Kp50Jv86Sh1Z/jD0GokKGBqUmuHyDtiH6YtHLlUhJF5hnBGPIl8FTX+gBFbpztmZ833X94Co9lRZvJLx8+yMoZBYNpYhqjQVLlUBM5FJLS3ZjL8xkSCFqZpJAaaNgFiRlO9oo9eq9umTe3+J6Hi5lsGnVXx8NYHnE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770100636; c=relaxed/simple;
	bh=VXEUkWVqGdDl+nH1yxRSvObDfYsCiq2uRchnZ582vKc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iWlPRUL8cF7lapNJTrH+25VP8R+JeY3pFiJyRzRoyY34UQXW5ZYKfN9WTcmBLRKhfDFspTF7fTVR0i1lM7Li3QByPVVHAgnnmlk2Jatrh8Qea2R+etpvNgPRfJhqqwmQrSR/SHFlDfSlciKnG6yMbIkJAP5qmPHnEsAyXZfe5ks=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=RDi07870; arc=fail smtp.client-ip=52.101.193.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rmg+54laeF//Ud/80+LIL0Na6adzPtlOJvLFaJXE5QP0aw5KdIvfxusomjc5Em6/x8ZiuviLYGtfmhMXhfTs5lP3rQhv0pxcqWCBpC/r9arbdjxOZ1WTwr4nNsMc0kX4BYiiQvgxuhYeYd9LdijED+Jn/OdSx/uMeoWUv9Eq1PKs/efAshmCPt94kJcMAELIJShUIjqOl1ZrXv3R8Hxjl8+fGU5lfCM5Wgnu13Ax6EqJQ2w3IOZRsQQqxfNYGqvTUgxg1OiHXDgO/KGbkmPztMsPxMNbq9iQRPwxrf5mRlZgnbEwFUkn7eS5Ps7bDtZMZ8VRpzxTo3BEHkqLIqXCrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxJFL3gfmpZYhK5YMuajz7i8Yls5fJjmXiVhJOtyheU=;
 b=KBZNKytySzpSswdef7s4Wq3WRE1ETyDyNlRmClR3sFZnGXkiZXiHXkgv2ZVx8qovXbo+GAAHQiHtdSveGF/9Gp8fxa0R2H+/4FHb3W90BV+Zmfkf4RiHaLllhtq2qTRAF43n3p2jmcU3kl0PYnwMlvTL1yUDQPGuFrD2+zlmNTXygLoY6mgi3VrJnV2slFyaBcE9AQS307JznmQookfYjSGjwDphSkh9HAcqU9OIgW+VsJRXqaCDuCBAUPafmKm0TQm5FBIpZp+7p47JAh7DY1WBnzGYodbpxl6XQCm9Ifdf3HMF3664BbsJ9aB3VJCY1G36XLSwwSaJ6rY5rYpUpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jxJFL3gfmpZYhK5YMuajz7i8Yls5fJjmXiVhJOtyheU=;
 b=RDi07870dnqEYo9CBUFeX2lnJIc4StCNXabdSg9x3yCX0eGoeLoyG45pU6oi1cpXDasJyq5r7wgC1EyKhl2g8rwY/uRguVyc3zQAVUmSX5Mx0dkiNUTX3/6bK0B04MVlkzNyzrwSHQsb85beT4D10PadIq1fFL8x7qPlgHyjf6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by IA1PR12MB7568.namprd12.prod.outlook.com (2603:10b6:208:42c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 06:37:11 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 06:37:11 +0000
Message-ID: <fa7a7f95-95f8-4ab9-a076-7207138c36fe@amd.com>
Date: Tue, 3 Feb 2026 14:37:01 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] media: platform: amd: Add isp4 fw and hw interface
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, sultan@kerneltoast.com,
 pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 mario.limonciello@amd.com, richard.gong@amd.com, anson.tsao@amd.com,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-4-Bin.Du@amd.com>
 <aUkRQEeAWDeQknP6@kekkonen.localdomain>
 <92ccb38a-5c62-4730-8a41-fa80d2f523a7@amd.com>
 <b95118d9-7186-4ec8-8760-ecf6345ce875@amd.com>
 <aYBqDp1mqj7bnfLy@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aYBqDp1mqj7bnfLy@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:194::11) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|IA1PR12MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 50afd03c-bc13-480c-7af6-08de62eea8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UGUxNlQ2MFU2NmV6U3c5MC9JKzl4cmkxSzRhTzNVQS9ZbzdaOWI5K0dhMTND?=
 =?utf-8?B?MkFuWCtULzh3N3R6c0RIZmxBQkdjbFhDdzRpUElJOFI3d3h3eDF2eEppaDV3?=
 =?utf-8?B?Zk11cDNITGJURzlqRHlsUVhxZTAxVjd2Vm45SFg2eDBZLy9PN1NBNkw3c2ow?=
 =?utf-8?B?djFzTHZ1Um1GSnM1anpzL054bGsrajZ5UFF1WURaWjVtRkhka1Btdm5Nc0Vm?=
 =?utf-8?B?cVNKNEhpZHBEUlVvZzcxYzlETThUUndGTFNXa09jR3loeGF1UnlxTWZnZnY1?=
 =?utf-8?B?QndqdXVwM1NaTUUvN2Vtb1V3VHhPcnlWK1hWZ2cxandVSytRSzNraU15S0V0?=
 =?utf-8?B?MjFYdDZUQWFHSkovUVJUVllhWTBkVEo2RDVRT2ZvYk5DR0pnYW9UaFhZOU9z?=
 =?utf-8?B?NWd5cE4xZTJkSkxPaWRtbUV1emc4cUxnNUhOMlE3d0x3dXpSWjB4dFhYWkVF?=
 =?utf-8?B?SFdpdzRYSnQ5QlQvVnFoU2tTMHl0YTFKWEpBUXFaeGhPN253L0prQTRMRmNv?=
 =?utf-8?B?WmhPbkJGcHltaXppbnlCVDdGSTBDOThxMHEzdU9KdC9GL3dhUFlUanlwaWVQ?=
 =?utf-8?B?UWJVRENTaEpiZk9iZEdVUHpjaDBxSW56TDRHK2gyK0piL1NIbVBBRWhmVHhv?=
 =?utf-8?B?RFJPckVBV0h3QTRHNm00di9MRlJ1NXVUSW5HMHQwZXJET0o1YjZzRkFpNkRI?=
 =?utf-8?B?d3VaQUJxeWw2VGNlSnVkWmNxc1JlRVBMaXRtK1ZYaThUNit1YTJEM3BtNlI1?=
 =?utf-8?B?NDRnVzRIVjlGbVQzUmZpQlU3aG9nc2FGLytuZG9LM3V6d3gxSlhkeUs5SzhG?=
 =?utf-8?B?RGtLbDg2eWhLVUVCajV1cENQNHBiWlhVMmhBdW1udXdaT2c1SldMZmFleFYy?=
 =?utf-8?B?K3VXaDJUWDJVQ3Y3NmFmejZiYzR4a1Y1UWJyNlJSdHpxOW1ydFA2SFJodlNx?=
 =?utf-8?B?LzJzOHdmeThaTHhHM0xodlZYeFpWKzI0VE9GbWNJWlk3TVhtWVk1alpHemdj?=
 =?utf-8?B?MW54SUxwTWs0MHdNcDhtN2tJVS9sTUdFODk2QngyY3dhK0wrQ3pOSWJ3aTdv?=
 =?utf-8?B?WnhiODl3ZEh0U284RlpFaFBmTFYrNnV6d2Yxczh1b20yRm1JL29ldGtnSG1G?=
 =?utf-8?B?cGUvOFhXV1pTeG9nRG1Lek1CSnU3M1MzdS9xWFd2aUdUNyt4ak9JcHdxMDJC?=
 =?utf-8?B?b1Zvd2xUV3JvS1dFM01tOWRwaTZrSlE4MHJBcWRlK0UrN29kYUpBUHNrNk4x?=
 =?utf-8?B?U1FrWitOS1hMMHJUcFIwNVZYT1Y4UGdTYXU2TlNnTEkrd2hQcnNnZUtpa2NR?=
 =?utf-8?B?d0pOVjhmd1ZISU4vYStvOHdkRGEwT0JhL2psQmFHaGgzTmRhZC9YUmQ0YXBR?=
 =?utf-8?B?amVjOWlrRTE4VnBvUnlJUjI5ajM4eThCaHE4WFFBVFZuYnlJNC9DUWJGR2Zx?=
 =?utf-8?B?Mk1ZM3N3MUxIOFZ0ZU5kbExSdUdTVmFtWCtZc0FEZTJybHBaSlNGZmt1dE5D?=
 =?utf-8?B?dEZZSDJRUm92aUxtQTNrVko0cVNvM095TmZvWkZuVEFmSUpqVk1qOUZiQ1Ay?=
 =?utf-8?B?MWwzaHVNbDJLeWVEdVJ4V1NRSS9kSUN1K0FYL3o0aVlmblU0MWdkK1VsWU41?=
 =?utf-8?B?a1hQdEV6bU9UMGFYT2o4NDZKYis0WHFPZVlueFZwZ3VTUHpING5rcHdWbmRG?=
 =?utf-8?B?bGFxbEdxTmNrdHdjSFZjYVA3TTFIN0VybkZhTk15NitHUk1OL044MWsxeTVR?=
 =?utf-8?B?QXNEOHNIVUNxUkZLSU8vSGplMjZ2TVI4TVh2eVQyTGRmMUdqNC85RGszVTZN?=
 =?utf-8?B?NDF5dC9ieXlrTXNUL1lNalBaWkZlNGdZdWVZRjk3ZFcvU0hZblZ4bWpCeUVu?=
 =?utf-8?B?TW9XUmdlakJ2cVM3ckNnbkNVc3NMc2FBaTJlaFY2a2RxdHBNMTJzOVZBRTZp?=
 =?utf-8?B?YXVrQk1HTWUyc2FwUm1VQlBhR0wvdkFhcUsrUGVZeDc2RUVvTlAvdUcxWm42?=
 =?utf-8?B?eGRMU0FMVnJ1VVh2L3ZxUHE3ZEhSVnEvZ0Y0MHBUb08rVGtTUm5xRjRZMjRI?=
 =?utf-8?B?TFJCZ0VrU0VFam45SEhGM0I0ZU1jNDc1Ti9tQjdzYVpwcGlIRTYwdkw1WHRV?=
 =?utf-8?Q?tSCw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXdEbi81Zk9QYWpObDJTc05qRGJWWTRMTm1XcHdIcGU5eVA5NnpHNWx5enVQ?=
 =?utf-8?B?YWNmQXY0TDg4aFJXWnpOTEN1MkhHdEZZbkRJeEIrbTJtMVVDR0Q3R1NJdEY4?=
 =?utf-8?B?QWJxVmdaeEFEN3czaHdFRC9TbUdDNTFKM1Urc1ZoU1JiRGFuL05NUE9SV2Fw?=
 =?utf-8?B?TG1iT1lFTkNOeERpOGdHY0ZYdm02QmZDaHdROHRRNlNTbWt3NU9zdHhaY0VX?=
 =?utf-8?B?aVFMR0M2Z09UMmJvVFlnN1BXMHMwZnRVa05tcGVyYldjR3ZkUU15MTBkaTVM?=
 =?utf-8?B?VExaZXFKTUs3eDhESXRydnRHTEZTQUJZRXZKaVBLWkZLcytaNHdMbVpoZDVR?=
 =?utf-8?B?ZDRQWVRhWWpMZU0zdmtZWTlrcGN4UVVLSHhnS1dMZVBGRGxrZkFyL1FsTUlv?=
 =?utf-8?B?YS84UFYvVVZwaXltdzdsaEozWUl4Sk4zS1pZaEROc3VVd0dTbS82SUFTYU85?=
 =?utf-8?B?VWs5dkc0WFQ1SDdPaVV0eTIvTWVqOHFzaVVxenJVVU5xYWJZZU5NbVM1WDBz?=
 =?utf-8?B?cE1zYjNCbHFia0Y5UHgyWDlnN0ZtOEJmcVNnSmgrYWRLOUZCcmRsVy8zTWJH?=
 =?utf-8?B?aElZT3ZyWnBZYllJbXJMVjNYNTQ0QVJmTjlvZS93N0hydHZ5SjRXVGhGWWQv?=
 =?utf-8?B?Yk1hb0pReVFKR0hrYklVaE9VNjFZM2w5QzI1anNUMTh5VklhcjNVMDE0TmJm?=
 =?utf-8?B?Sk5Bcm1WRTRWMVVpdlBIVXI2MC9OQk9zdVVvdlZEQXBZMER4aHdVdnJTTnVM?=
 =?utf-8?B?bVBNQkxhUjI1NGNBNWMvY3FqM091anI3OFNGb3dXbmwzSXVxeDNiYUJSdll2?=
 =?utf-8?B?Tkk1MGNZRUFPQlRIdDNxWThFdUkxbnlLTVZkcUxwdXhtR1o3VVl3VkJ0STVR?=
 =?utf-8?B?R01xdjg3VnQ4Qnh5VGZ4TW15TWtMcFYzeTl6cjJJY3pqSmpOZ0tiU0pzTDZF?=
 =?utf-8?B?eE9TZnBUVDVsb0tFR3lZYmRCdU5zM0hOVmYxck5YRmlhNFJLcnNuZnAyb2Vi?=
 =?utf-8?B?UzJwdGF3eG96UW84cjlTRk0yektTZUE0ZWdVRVY1L2tHcjVzYkVBM3REWHFB?=
 =?utf-8?B?WW8vRWtGN3NLL2JlWnRzejg0NURyNU1kNGk3SFFpOHN2WHlYUDA2WU1WWFh4?=
 =?utf-8?B?YTVzSFJudGhnUlFDQ3RPTEZrN2N0SGk1dXBDUmdyd0RqM2Nvb1MwU3A4aWdE?=
 =?utf-8?B?ZENGdlppUEU2NzdlQVZYZGNhSHVZNnhYeUdTWkVyQXJwem80QjR1L3c4YU51?=
 =?utf-8?B?elRMblJlbVhiVlREMUd2VjhqZjFlclh1Yy9WSTdUcHZEY3d0OWtvRzl5TjRl?=
 =?utf-8?B?S3dJOGVYUkVyaElPOW5CWFJaWm9zU1M0c2NUMVN5R2dYclZvcGlLWHZwWHI4?=
 =?utf-8?B?cFJmYytuUVhtaGxaNDlXT2hLRkt3dWhtUitQaDRMTldpdWY3czBoYnQrUWZo?=
 =?utf-8?B?VkdFdUwvTC9CU1NGRzZrMms1L2s3RFhvb0VYcTZZcFFRd0RUV01jQ3NRLzhJ?=
 =?utf-8?B?ZTZWSGxVdzdpNGx6a2FYZVRnRkpmMnJpcDJKVytJaE5wZUs3NHJ1U2ExcHBn?=
 =?utf-8?B?ZkpNSHJIMlVIUytXVFRVRVE4YzMzem43VWFmL2VLb1NzamlsR1RxYnMxaWor?=
 =?utf-8?B?TGRyMGUxa00vQldTbVQ0TlFCR2V5Zk1FNWtBTm1ZYkllbUFuUDhQb0F4S2VE?=
 =?utf-8?B?NXlrMi9aRXI4bkxSTmNMSUExbWpXd0dhdDl1WWdXUzBhNHFFTkl2ZjNEaFJx?=
 =?utf-8?B?MnhQcVF6eXZ0ZE9ZeGp6NnBSVUE2Q29lNGduSUYvTUpxdmxqZUJMUGFVWGRL?=
 =?utf-8?B?TmhrUVhCM3JyOTZGOEFrenlzdmc2TGRUUUwxTU55bnZPRzMzcTF3WEdpdnI3?=
 =?utf-8?B?UHE0NXFIZmtJaVdMcy96MlJnUmxaUjU5eE1tYndIVENvMGdrRCtuT29yeWZ2?=
 =?utf-8?B?WGVWQXF0c0I2VmRzbzdPaDVvU0N2Q3REK3NoMUczOEI3V0lSWFpOMW5wTE1F?=
 =?utf-8?B?QWR2QVh1ZUFLOXZTK0EvWDc1RmRaVEpWQ3RRUUFHUmVwUmlmaE1lek1ndnhY?=
 =?utf-8?B?Qk1Ld2RYWlNhT2xPb1BET2hKZTNTK1lsampLdVloWHFjNnpmMEdubUZ5c25T?=
 =?utf-8?B?bjhUSVFrZ0lVK0lrQlltaU1PU3ZuMmlWVmdHVDFRVktFOEsreWVITUxJUWtW?=
 =?utf-8?B?N1U3dDViekpXTjY2dCtPUitEdkNUb3hVYWhvdHo2YjBhdmdjY1Z4WUxEcGRX?=
 =?utf-8?B?cUFDdTBpMUcvK2pqTlN5QVJJbmFGaVRaS2pEa3pabVBhTXUvMXlEUVV3SUFn?=
 =?utf-8?Q?O/hF+dA8BV/vBMK3dx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50afd03c-bc13-480c-7af6-08de62eea8dd
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 06:37:11.1256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: whX4KMpX1cqPk36EJO/RgrqiG83/jvIfM4zyflHiGHirtrHks68rewI7S6zg6uKK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7568
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52076-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,bp.renesas.com,vger.kernel.org,kerneltoast.com,amd.com,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bin.du@amd.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 174EDD555B
X-Rspamd-Action: no action

Hi Sakari,

On 2/2/2026 5:10 PM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Tue, Jan 20, 2026 at 05:22:41PM +0800, Du, Bin wrote:
>> Hi Sakari, there's still one left. Could you please help check it?
>>
>> On 1/7/2026 4:44 PM, Du, Bin wrote:
>>> Thank you, Sakari for the feedback.
>>>
>>> On 12/22/2025 5:37 PM, Sakari Ailus wrote:
>>>> Hi Bin,
>>>>
>>>> On Tue, Dec 16, 2025 at 05:13:22PM +0800, Bin Du wrote:
>>
>> [snip]
>>
>>>>> +enum isp4fw_buffer_source {
>>>>> +    /* The buffer is from the stream buffer queue */
>>>>> +    BUFFER_SOURCE_STREAM,
>>>>> +};
>>>>
>>>> Could you also use the ISP4 (or ISP4IF) prefix for these, please?
>>>> Many look
>>>> rather generic.
>>>>
>>>
>>> Thank you for highlighting this matter, since these definitions are
>>> located in isp4_fw_cmd_resp.h, ISP4_FW may be a more appropriate prefix.
>>> Just to confirm: are you suggesting that we should add this prefix to
>>> all macros and enums? For example, changing CMD_ID_SET_STREAM_CONFIG to
>>> ISP4_FW_CMD_ID_SET_STREAM_CONFIG, and BUFFER_SOURCE_STREAM to ISP4_FW
>>> _BUFFER_SOURCE_STREAM? Our initial thought was that these would only be
>>> used within ISP and shouldn't lead to any confusion.
>>>
>>
>> Hi Sakari, would you please help to confirm so we can decide if further
>> modification is needed.
> 
> I'd prefer to use a specific prefix, indeed. See e.g.
> drivers/media/platform/ti/omap3isp/isp.h . This was the first supported ISP
> driver so some prefixes are just "isp_". The shorter names you have, the
> larger is the probability of clashing with something generic. It also makes
> it obvious to the reader this is specific to the driver.
> 

Very good consideration and reference, will add prefix ISP4FW_ to make 
them specific.

-- 
Regards,
Bin


