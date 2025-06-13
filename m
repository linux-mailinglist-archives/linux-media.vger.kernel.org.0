Return-Path: <linux-media+bounces-34693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A93AD811F
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 04:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 536307AD8D3
	for <lists+linux-media@lfdr.de>; Fri, 13 Jun 2025 02:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04E6241686;
	Fri, 13 Jun 2025 02:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pI29zgof"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D2223C4ED;
	Fri, 13 Jun 2025 02:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749782431; cv=fail; b=FoXwUAF6u+B/CeDrA8hC27V3O1q3ZqD21Z9nf7xnTZnOnNbwBKGmXAe/qm3mAdlx7vP7SNqsub2nOHNvAUgVqsR7CKNSkWqHJJ+54Cvj54rkiRniCm4+iqLlxxqOVmHbuT3L82Uc3KxdVHkQUns0zs5sRMBHVdOjxAlsfOdNzWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749782431; c=relaxed/simple;
	bh=j1yA9XOp5nalL9esoer0X7PzozFiRJB3tZTiZ6aCJoQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UYOJODCJw/M11NO/SGEepCvMSMCqF8CVnSvrpoUx7ey6J4gIMqkVU662iWPKgm/1+gYK9gcK6uNLcR5Br/gbtqIXR6wW/rPXo88hBoGBtkRxYdZ5EV7vYVQK8U8Cn9vINmMnoByywst2rdElkcXHaXkvB8VFIiOMjXVPZSPDgLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pI29zgof; arc=fail smtp.client-ip=40.107.237.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xG2tqOf600anzkhfAAaFd9MBftPI1C1LduJzaZs+MHjWbA3I8hOS0GMm72B6JxHl4NJlayNrEEtRRawFV0+qpO/oiUVzX5d+NaaPA63lj4IuCcFRSrkI90bZMvBTe/sPzhQs9+kZ2q6D4FzL0rAH/5o78Zwx/zdza0Z030+zTMJBy2KOfLlrxAQfzDk6HQuKujdkVv/PtTOdxO1hXCRtrLmALKnnGUS+CEYmDmhze7/MkTj1iqr6KuhBurzgalAckxBw233E7rI0+wE/NhgDnUFAQ1zh5bu96sDE5KMkrV9hDve+Or+oS+I6fL6xmUdUWM/5H+lqcYTccNYXD8yrzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYG8FZJ+2j61RixDPYsq5GILDGydly9f3DotOMnCsts=;
 b=oLm5exbulN2ONVzjwHaCKqt0W5FWFCcEb56cqb5L7E4B0q1F8JqqlkmG//IilohCKLy5FgmMUcUi6XTI2NRK9A6Gu+cl3k0E5moxRfB5EreekeyA2XabILjc1YoYdjBg+xezCVgiIUyNzF2TcnOZDMz40FCTa9mYN4XjAzJ55W8L9Qs4LJEeDdHKGRK/JKUKKE7gXES1305rAtaAw9kh253w3H/KRfquXoUY75JkrlowMuHCJ3MNh+0HUkGg11kV8WeG18gS8gzLPnT2zgLjAosF1H/QdzS3IFS+AbZkSTg37BdhMf+Q0MQSdLibuKqw4Z0zhjtO/XvzpnkZPm3uMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JYG8FZJ+2j61RixDPYsq5GILDGydly9f3DotOMnCsts=;
 b=pI29zgofX4juKQ03bHPFk5JgYRXKBH4ocT7yCn6kG9NQQ7X4uY1mItxVYUDpWP1cJ+O50ZymiDSP9ZlrbTsH2n2lBoLtHL9zFAiYW7KpfdBUwM+T9fP0ewvC3dQcJvC0KIyiw6kPBOyN3wmsdusSoYE7gyGfqee8EeRVNPm0HMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.36; Fri, 13 Jun
 2025 02:40:25 +0000
Received: from MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137]) by MW5PR12MB5683.namprd12.prod.outlook.com
 ([fe80::3366:15a2:2179:2137%7]) with mapi id 15.20.8792.040; Fri, 13 Jun 2025
 02:40:24 +0000
Message-ID: <b1a5772c-d745-4920-953c-be8b11440abc@amd.com>
Date: Fri, 13 Jun 2025 10:40:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/9] media: platform: amd: low level support for isp4
 firmware
To: mchehab@kernel.org, hverkuil@xs4all.nl,
 laurent.pinchart+renesas@ideasonboard.com, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: pratap.nirujogi@amd.com, benjamin.chan@amd.com, king.li@amd.com,
 gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com, Dominic.Antony@amd.com,
 Svetoslav.Stoilov@amd.com
References: <20250608144916.222835-1-Bin.Du@amd.com>
 <20250608144916.222835-3-Bin.Du@amd.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250608144916.222835-3-Bin.Du@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To MW5PR12MB5683.namprd12.prod.outlook.com (2603:10b6:303:1a0::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW5PR12MB5683:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: ec395f56-8e27-4d60-92eb-08ddaa23a61e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkhXNDZSdWs3MkJtQTJnNWJoK1hpNVJRckptS0xYdjBXZXljZ3JIK000RkZ4?=
 =?utf-8?B?QWE4R0NrYjNQU05HY0I1RkZXWDBaNFZ2TkQzcUlIbVYyM2wra3pCdEZMc051?=
 =?utf-8?B?VGt1T1dWZlp1MnZmUWZRVktyaWZEdk50VE1KVittU2l2dGhVMXV2c3VBcW1w?=
 =?utf-8?B?WmMxRGxkeUZmRUNqZVVJSVp1OHZhVXBkbHNzWWR2R2FMb2Yxd2VNL3k4dW5K?=
 =?utf-8?B?b1A3bHBwdkhRZ2ZvbFgzamJObGdPV20rWGdiU3I1MzI0ZHd2KytUdlBvY1Nm?=
 =?utf-8?B?Y0NMSU9tVDBmOFYyZ1hEN1ZPQjlPQW15N0lieER5Um93OFl3bUhZNjZDNjZY?=
 =?utf-8?B?V2NsN3pSb09ibXpqVGxwKzQ0NGx0ZDZ5OURTL0FjTi9JNi9KdmJrNWZjMHFT?=
 =?utf-8?B?V0lVemtSWjcvMmlpc0NNTXRsY3hSSnltdjZaY3ppRHBrSCtZWUM3ZWsvSWw3?=
 =?utf-8?B?TGtwWUhGNTBnNVNFS3RSQVhwRmx4SkRDK0NQbE9udElxM055cEZCZytyMDh0?=
 =?utf-8?B?U3M0ZVVCSWFMUml6cnpJbDNGQTdqTXZkb1pIa09MU0lVUGViclBVSUh6WElh?=
 =?utf-8?B?VndMZGFzb3pPckpoSmlia0ljNzlmNStRYXd6bk54ZUx2T09DcVlPaFBQYXR0?=
 =?utf-8?B?VnI2YWlnVGdaZ09YR003R3ZGUlJnekhZc1lkV0xTTWpOWHBzZHB5QkZvdFpP?=
 =?utf-8?B?Y3dRS2Y1VGlKSFowY05WQWdJVldqV2V1OXVpSzMzWER1THplNjIzRGRoTU9X?=
 =?utf-8?B?eFJLSXNISldLdHpyK1Z5QnNiMzFFNEFSeXVEM1REZ1kzTUd2UHZabTJROThV?=
 =?utf-8?B?NFFmNlFmend3cUVOd0NNcUlRUmY4SENId2pMUjFJRlREUUpFY29McDdzMS9L?=
 =?utf-8?B?VWJsS2J0R2N3WXlrRytjVU9hdFFGd3hGZ2gxZkhpbHBKMmptemxsZ2RQZ0Zz?=
 =?utf-8?B?Ylp2dmNTS0phd3Q2S2tZbHJrYmNzdjMvQ0JzN2g4bDBnaS9rVlhLT3NaTE9T?=
 =?utf-8?B?T2JIQkZHb2FZaVpaYmo4WHgzMmJCaTNZZUJpYjRlSzFOR3FsMlpyRlRYNm5r?=
 =?utf-8?B?NlVtN2d4YmpyZXBOeTZwQXJPbTZNZ0dRWVQ0TVpQWUZnWW00dkhtM25MdG0v?=
 =?utf-8?B?N0V1ejRRcHNhZDAwY0JScjNtVkdzTFB6QXZqOS9ETUNZekE2cXVwb3JGd0FF?=
 =?utf-8?B?ZERZd3RBNURrUllpamZoTyswU05XMXE2SmN5bTZFSUkyaXVGdHB3VGFuaW4y?=
 =?utf-8?B?ZS9rTWsrMU4zVStjankzTjhrK1QvVFNHVTRKeWVlcWozWDRpZndVdStXd2RZ?=
 =?utf-8?B?Unhad0NiTlFWY3RLRGR5dEZoaXhFQ0RUQ1FTQ0Z0Vmpob1lMVmtuL2VlTGFO?=
 =?utf-8?B?M3ZFbDdpYUZjRmJWYkw1cDhoMWI2N3ZxeXZRRHg0bWFyY0ZnbHovYXZ4QXNL?=
 =?utf-8?B?by84RllvT1hRdW02ZXZsajBqK0ZqdTJpMEdvbkVEU0xVRVBOZlFEZnRNOUdE?=
 =?utf-8?B?aHB5Q0xRbWRHRG5iRWJhQ09XVDRUVWRIb0t1Tk9OWC9RTS80Z0xacDFpZFVE?=
 =?utf-8?B?eWFKTEJSQWcrU2Mrb0dVRnBnakJtdkh6ZjVUMnk4RWJabkYwc2cxLzVSeloy?=
 =?utf-8?B?cG1jVlRXazNDMVNKTCtlTTNTVGp5QXhlcnkxcndoOXByNjFHUXNjSjNJbGxR?=
 =?utf-8?B?K1FkNVRzUm5OVUw1TmJCdkNOd3BEMEV2bWpKdEw3L0FPRWphREdvbElTeWpq?=
 =?utf-8?B?Y3pHaUVEcUdlRlM4YzZQZ2xnMzdjeUF2aFBISHY0c05RZCswSHV3ckI2V3pU?=
 =?utf-8?B?b3B5TUtrOFBUL2ErcDFubzQ4Tzk4ZG5CVmZXSlZvTTk0eUJ4SkVTMEljTE5w?=
 =?utf-8?B?c1A0bzNkQ1oxRCs1Q1JzczhBcHlSc3drM1VlQzJUV1dHZDBzSEJVeS90Ymxw?=
 =?utf-8?Q?dVqrfnCs5lg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR12MB5683.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmRMaVpyMlhiM09yNFFSTGU2R0pOZkhJVWZkWE83ZFRNQkM0OGNqdm4xR1hi?=
 =?utf-8?B?cmFDSk1WeTdQQWJIZEM5bHV4S3crNEt4UDR4K3Q1QlpwMk9RR3ZxemVCVlRS?=
 =?utf-8?B?S1Ywdm9nc0dqNmhXNzhmbXcvMTB6bkxIaHgwQ0R0YlZCSnZ1UGRQalhpWjQ5?=
 =?utf-8?B?RTdzMGtkbjJMeVhWSEFQOXV2Qmx0SHpIRzZnTmpRSkZjRGVySHp5QmF0ZGhT?=
 =?utf-8?B?WlJpNlVxeFE0Ni9rMm9WSGhPUjJvYmVuMkJVYXB1YkpiWHozU3k4Y0hHbXR2?=
 =?utf-8?B?ZWNsbjRSM2I4MS83TWc3Z2RjOFYyOEVQZ2pxcWpXY0sybG9UWldxbG1pUkZ1?=
 =?utf-8?B?ZUxVY2lLS0hzNEZncy9iSGNzSzFTQStJU2dkZ2l0bGEzYkZYVzdvdVVIQlZs?=
 =?utf-8?B?dFl2dEtJWitlZjBXNmtDR0hvS0pQUFB6UTFOR3ZqTkpNY05MY08vSzUxcHBK?=
 =?utf-8?B?K1hvckpNYUxISXJpM083WkZvNWlMZXU3WUcrVFJKNWdubEpnY1dZdzRxbWdv?=
 =?utf-8?B?VllPQU9UNVlFR0I2VHBVVnJOVDFyZGNoSTlNbzZGM3RIM1pwaDY3ZkRGKzdx?=
 =?utf-8?B?THZxb3dwRTFVOGNmalpvRHNPb2VYTHl2VHo2K2lkWEhzSnF4WUVlbGpsWERi?=
 =?utf-8?B?alU0UklFRFVwY2oxU3lza1FLNk83dmVVUjRtL3hDaURaN2MwZURMaXhycTV0?=
 =?utf-8?B?ZmdOU2tyeFhzV21XeHRJMlk0bFp5SDhBMzlYNWxSaXZaZ3Z6Rm12RWg3eE9H?=
 =?utf-8?B?SHNMbWwvMjFybHBycE9ndjZmNUxpYmNGZWgrbHJjb3FmR2tadlJoV093Qm1T?=
 =?utf-8?B?V0IvVTZOWGpMY2szblVPWk1PSk1JcUlpMFpxbHpKNk53aGNCUWJMb2Z3NUpQ?=
 =?utf-8?B?VEsrUG81Qm5ETjZHcjhFNWRmVEE0WVFTQjg0cXpiaUlxcTN6bXJXS2lNbjBD?=
 =?utf-8?B?MVdPelZzNkFrYmU5cFNlazRiVUk0MVI1ME14RXpVRUZHNXRTcDFPYk9MOWE3?=
 =?utf-8?B?aWxQdS9JUFBzTnYwUVE2cjh0SEMyWmZ1dmMvWEVwWldxZjhTWHZNaWY1aVla?=
 =?utf-8?B?QWRXL1hTUnQ4TkNXNHBPSm1OeDhMWDZ2Vkl3R1F3RVpFVjBGQW5xQTdCUks2?=
 =?utf-8?B?TVVwVWZMNlgyaS9SWnRnYVNPcERmVU03Qjd6ZkRvNHhRR28yc2ZxSjZiZUFy?=
 =?utf-8?B?aFFLMTIxZk5MWVJLekdydktXS2lkKzllNXpabi9WNVJjMUZ0MjlvU0k3OEVi?=
 =?utf-8?B?RkdYN3RyWFlQUUZNcGozK0k5b1RJUWVGS3BJTkYyb1JudzZnMEFFek02Rlhn?=
 =?utf-8?B?TkkxN1pNanlJU0hySG12UzUrdWZpWlR6RHRRWGFjZ0JaTkxCbDBXeVdZcHg4?=
 =?utf-8?B?Y2xmMkF1YUFSSHdZbmJOTkExaHkrVTk4cll5aTVqVGhDeDRIQkxyWUJ2SU0x?=
 =?utf-8?B?TEQ4cWQ0QkVoTDBBa1BHejdqOFN4b0d0M2Z4eEJBWWQ0dnpOUytMa0FzRlNH?=
 =?utf-8?B?cTNkQy8vajUyYUZhc1BEK2dPMWkzYlczTWtOSXo2UFMzcEI2ZmR2dnU2MGVW?=
 =?utf-8?B?VjJNZ1BlcDFJNncwQ2g4MUJ6VVR2b2NSRTFJaDBScVIyS2c5YU15MDFuOUxW?=
 =?utf-8?B?ZitFSmhVb3hINWNUWGk5SXVjWlhVNWtUamN0YmxoczBUTTlkd3IxRXJub055?=
 =?utf-8?B?eHJkUlFmT1hEekNFTy9PenFKRzU1RHg2RWJZZWh4US9wYkdqalZxQXh2U3Mv?=
 =?utf-8?B?RUZWanpESjd6UW1iK2grNzJnM0ZPRERlbUhyU25DbWVJMDlJMkl4TWdFV0po?=
 =?utf-8?B?b0RGaFF3b3phRXNJS01sNmNYbmhyWUJldVhCQ0d2d2Z4TGtObjRDM0xaamwy?=
 =?utf-8?B?Q2xqOWJzMkQwNm5zSDJwL2hDSkxaSmw0bURtSnNUNTY1RU1zUHp6NGRTcWF6?=
 =?utf-8?B?SXB3ZlllWVUxcGtrS05yemc3L2FETDc0ck5VQ1FJdlpRNmVoeXVJS2ZQY3Nj?=
 =?utf-8?B?cWdQekh3QkhQcFY5OTFiMGh5a1ZLS1NPbTNjTnMxcjVLR1k5Z2NmTEJPK2dH?=
 =?utf-8?B?MEplaXlVbmRDankxVUlFdXZ4SmM1MDAvL012cHluK0Yvc3lIMG5IOEdNN3JP?=
 =?utf-8?Q?3Cw0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec395f56-8e27-4d60-92eb-08ddaa23a61e
X-MS-Exchange-CrossTenant-AuthSource: MW5PR12MB5683.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 02:40:24.8837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgv92vHPRDJw5XKujgCkzJZb3dXRMa5+n7Y1GvFQDo6VnRzlFetCokKBI+nM1iXQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796

Change-Id should be removed and will be fixed in V2

On 6/8/2025 10:49 PM, Bin Du wrote:
> Low level functions for access the registers and mapping to their ranges.
> This change also includes register definitions for ring buffer used to
> communicate with ISP Firmware.
> Ring buffer is the communication interface between driver and ISP Firmware.
> Command and responses are exchanged through the ring buffer.
> 
> Signed-off-by: Bin Du <Bin.Du@amd.com>
> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
> Change-Id: Ic06d5387ade72c57f6efc6b699ceaa6aa91804ec
> ---
>   drivers/media/platform/amd/isp4/Makefile      |   3 +-
>   drivers/media/platform/amd/isp4/isp4_hw.c     |  46 +++++++
>   drivers/media/platform/amd/isp4/isp4_hw.h     |  14 +++
>   drivers/media/platform/amd/isp4/isp4_hw_reg.h | 116 ++++++++++++++++++
>   4 files changed, 178 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.c
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.h
>   create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
> 
> diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
> index f2ac9b2a95f0..4ef8be329d56 100644
> --- a/drivers/media/platform/amd/isp4/Makefile
> +++ b/drivers/media/platform/amd/isp4/Makefile
> @@ -3,7 +3,8 @@
>   # Copyright (C) 2025 Advanced Micro Devices, Inc.
>   
>   obj-$(CONFIG_AMD_ISP4) += amd_capture.o
> -amd_capture-objs := isp4.o
> +amd_capture-objs := isp4.o	\
> +			isp4_hw.o	\
>   
>   ccflags-y += -I$(srctree)/drivers/media/platform/amd/isp4
>   ccflags-y += -I$(srctree)/include
> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.c b/drivers/media/platform/amd/isp4/isp4_hw.c
> new file mode 100644
> index 000000000000..e5315330a514
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_hw.c
> @@ -0,0 +1,46 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/types.h>
> +
> +#include "isp4_hw.h"
> +#include "isp4_hw_reg.h"
> +
> +#define RMMIO_SIZE 524288
> +
> +u32 isp4hw_rreg(void __iomem *base, u32 reg)
> +{
> +	void __iomem *reg_addr;
> +
> +	if (reg >= RMMIO_SIZE)
> +		return RREG_FAILED_VAL;
> +
> +	if (reg < ISP_MIPI_PHY0_REG0)
> +		reg_addr = base + reg;
> +	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
> +		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
> +	else
> +		return RREG_FAILED_VAL;
> +
> +	return readl(reg_addr);
> +};
> +
> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val)
> +{
> +	void __iomem *reg_addr;
> +
> +	if (reg >= RMMIO_SIZE)
> +		return;
> +
> +	if (reg < ISP_MIPI_PHY0_REG0)
> +		reg_addr = base + reg;
> +	else if (reg <= ISP_MIPI_PHY0_REG0 + ISP_MIPI_PHY0_SIZE)
> +		reg_addr = base + (reg - ISP_MIPI_PHY0_REG0);
> +	else
> +		return;
> +
> +	writel(val, reg_addr);
> +};
> diff --git a/drivers/media/platform/amd/isp4/isp4_hw.h b/drivers/media/platform/amd/isp4/isp4_hw.h
> new file mode 100644
> index 000000000000..072d135b9e3a
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_hw.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_HW_H_
> +#define _ISP4_HW_H_
> +
> +#define RREG_FAILED_VAL 0xFFFFFFFF
> +
> +u32 isp4hw_rreg(void __iomem *base, u32 reg);
> +void isp4hw_wreg(void __iomem *base, u32 reg, u32 val);
> +
> +#endif
> diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
> new file mode 100644
> index 000000000000..b11f12ba6c56
> --- /dev/null
> +++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
> @@ -0,0 +1,116 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/*
> + * Copyright (C) 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#ifndef _ISP4_HW_REG_H_
> +#define _ISP4_HW_REG_H_
> +
> +#define ISP_SOFT_RESET		0x62000
> +#define ISP_SYS_INT0_EN		0x62010
> +#define ISP_SYS_INT0_STATUS	0x62014
> +#define ISP_SYS_INT0_ACK	0x62018
> +#define ISP_CCPU_CNTL		0x62054
> +#define ISP_STATUS		0x62058
> +#define ISP_LOG_RB_BASE_LO0	0x62148
> +#define ISP_LOG_RB_BASE_HI0	0x6214C
> +#define ISP_LOG_RB_SIZE0	0x62150
> +#define ISP_LOG_RB_RPTR0	0x62154
> +#define ISP_LOG_RB_WPTR0	0x62158
> +#define ISP_RB_BASE_LO1		0x62170
> +#define ISP_RB_BASE_HI1		0x62174
> +#define ISP_RB_SIZE1		0x62178
> +#define ISP_RB_RPTR1		0x6217C
> +#define ISP_RB_WPTR1		0x62180
> +#define ISP_RB_BASE_LO2		0x62184
> +#define ISP_RB_BASE_HI2		0x62188
> +#define ISP_RB_SIZE2		0x6218C
> +#define ISP_RB_RPTR2		0x62190
> +#define ISP_RB_WPTR2		0x62194
> +#define ISP_RB_BASE_LO3		0x62198
> +#define ISP_RB_BASE_HI3		0x6219C
> +#define ISP_RB_SIZE3		0x621A0
> +#define ISP_RB_RPTR3		0x621A4
> +#define ISP_RB_WPTR3		0x621A8
> +#define ISP_RB_BASE_LO4		0x621AC
> +#define ISP_RB_BASE_HI4		0x621B0
> +#define ISP_RB_SIZE4		0x621B4
> +#define ISP_RB_RPTR4		0x621B8
> +#define ISP_RB_WPTR4		0x621BC
> +#define ISP_RB_BASE_LO5		0x621C0
> +#define ISP_RB_BASE_HI5		0x621C4
> +#define ISP_RB_SIZE5		0x621C8
> +#define ISP_RB_RPTR5		0x621CC
> +#define ISP_RB_WPTR5		0x621D0
> +#define ISP_RB_BASE_LO6		0x621D4
> +#define ISP_RB_BASE_HI6		0x621D8
> +#define ISP_RB_SIZE6		0x621DC
> +#define ISP_RB_RPTR6		0x621E0
> +#define ISP_RB_WPTR6		0x621E4
> +#define ISP_RB_BASE_LO7		0x621E8
> +#define ISP_RB_BASE_HI7		0x621EC
> +#define ISP_RB_SIZE7		0x621F0
> +#define ISP_RB_RPTR7		0x621F4
> +#define ISP_RB_WPTR7		0x621F8
> +#define ISP_RB_BASE_LO8		0x621FC
> +#define ISP_RB_BASE_HI8		0x62200
> +#define ISP_RB_SIZE8		0x62204
> +#define ISP_RB_RPTR8		0x62208
> +#define ISP_RB_WPTR8		0x6220C
> +#define ISP_RB_BASE_LO9		0x62210
> +#define ISP_RB_BASE_HI9		0x62214
> +#define ISP_RB_SIZE9		0x62218
> +#define ISP_RB_RPTR9		0x6221C
> +#define ISP_RB_WPTR9		0x62220
> +#define ISP_RB_BASE_LO10	0x62224
> +#define ISP_RB_BASE_HI10	0x62228
> +#define ISP_RB_SIZE10		0x6222C
> +#define ISP_RB_RPTR10		0x62230
> +#define ISP_RB_WPTR10		0x62234
> +#define ISP_RB_BASE_LO11	0x62238
> +#define ISP_RB_BASE_HI11	0x6223C
> +#define ISP_RB_SIZE11		0x62240
> +#define ISP_RB_RPTR11		0x62244
> +#define ISP_RB_WPTR11		0x62248
> +#define ISP_RB_BASE_LO12	0x6224C
> +#define ISP_RB_BASE_HI12	0x62250
> +#define ISP_RB_SIZE12		0x62254
> +#define ISP_RB_RPTR12		0x62258
> +#define ISP_RB_WPTR12		0x6225C
> +
> +#define ISP_POWER_STATUS	0x60000
> +
> +#define ISP_MIPI_PHY0_REG0	0x66700
> +#define ISP_MIPI_PHY1_REG0	0x66780
> +#define ISP_MIPI_PHY2_REG0	0x67400
> +
> +#define ISP_MIPI_PHY0_SIZE	0xD30
> +
> +/* ISP_SOFT_RESET */
> +#define ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK			0x00000001UL
> +
> +/* ISP_CCPU_CNTL */
> +#define ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK			0x00040000UL
> +
> +/* ISP_STATUS */
> +#define ISP_STATUS__CCPU_REPORT_MASK				0x000000feUL
> +
> +/* ISP_SYS_INT0_STATUS */
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK	0x00010000UL
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK	0x00040000UL
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK	0x00100000UL
> +#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK	0x00400000UL
> +
> +/* ISP_SYS_INT0_EN */
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK	0x00010000UL
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK	0x00040000UL
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK	0x00100000UL
> +#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK	0x00400000UL
> +
> +/* ISP_SYS_INT0_ACK */
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK	0x00010000UL
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK	0x00040000UL
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK	0x00100000UL
> +#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK	0x00400000UL
> +
> +#endif


