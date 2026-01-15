Return-Path: <linux-media+bounces-50740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC0BD221C6
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 03:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA9393031A05
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 02:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AC7425333F;
	Thu, 15 Jan 2026 02:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="PzJUytnc"
X-Original-To: linux-media@vger.kernel.org
Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013059.outbound.protection.outlook.com [40.107.201.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD701E868;
	Thu, 15 Jan 2026 02:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768443864; cv=fail; b=sz1zGy9X5EaR/9ddYlZVYe9b2NUI9rV8L1gOpDs5lcp+QbBXD9PH+JhsAVtgQqJwGutJWV8Ho8uEUXvI60Q3tXV3zDcHcRUJg7S2xJBYD6vvyRI/QnRfFx3IBj7nTsdkCJwtWuq9eSxv+lGR8ge9OoKFJKx3csjlrU18Zl2HWb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768443864; c=relaxed/simple;
	bh=EUWu2pJEyuIBAc1JNnPTVTIgkJ2AghHWK/kILt5hF08=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tDcgFtmAmEVgK2ru2n/+mDGIPF/0tVR1kogKC3HCD/dCUlikI0XCFKLrS/W1VkxbKHTUtSEd3UWNl0ON0i52pAdEFwlFAfLUSnQlLq83stcy/8siCKFZHqsRbp+kWr5EVb/L8V9pma066bXgMr0pHgV4kIWUe55fP6kLBioeBe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=PzJUytnc; arc=fail smtp.client-ip=40.107.201.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FUyzviRaRXMVqcdYkjV/yAOHdJbpy1aldncbLXJ2d+mm8vPM2WxP7T2hKMT5bM10A7NagdGahjxyJI4pC32x06TFyf/EMG/pY5lNbfKAGwpLX8FNnqmnxhAaxzUtN0qVP5zIO3KT+a5doh6DJQcC+9WZIGnbso9K7aasMD0kyO4c3/90So5KoHHy1c8sP79jimBj2mgq2aykYuUR3fSngK8ex8PNSE2w2FXWymLfziuzCQltZ4sSWQET3obBJqPjUl+mrOqXrX1505qk9txtBLdE9QMIwtbQ0uXEzWvzgSN/AJWdEQAeH6dZpZ9niR3MqYKhaTlTjwEurkD9SaE3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JagUQkxT/dWotbA6uUWHOLDSBwe4alg4HeXwBDxDItY=;
 b=bfpFutMRAaHwBA5YmQuB6myqZpa5xMqPb7IcPuORTFOc5o8Z55qLEpJ9bB34j9XXc1O8tLb+r5L7UNE5etAfZiCW3AAh72K30tgp1dur2apoFhzH0HM8NivrnTJwNoP/2Ul2n52XOXOMbbB94kGCSNoW+5/3fG0XJN5YJeabegreqjhEJU9TopZN3A6lQKnrObC3uJmUjsJcZcVTXQnF6tnoGYSYgo1s+phr1KrujxNNuDc2QXkpUI1fHIVlI9xd+nWKMFKn8/UB899O+zSOohQ3m9pO0p/rcxDGw6vzDIosSDUirT++a+9lRNf6hiLV1XYehkKJwYBuxAqMjYBLeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JagUQkxT/dWotbA6uUWHOLDSBwe4alg4HeXwBDxDItY=;
 b=PzJUytncVPYezRTaWrnjiyTXIRDPsabnMwZPLsRua6h+IjM12gxWK2qm1oerD+Ncv5bol18c7uzCWwjFahBQqXUr/+iwnPSbD3S4NPRIvSGXr4ENEA5bOpWV9PyFewfcbCpb3REEwtD7uu/W3Um9dTVjvLNE4PYYmIuidSEJ4+w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV9PR12MB9829.namprd12.prod.outlook.com (2603:10b6:408:2eb::9)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 02:24:20 +0000
Received: from LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32]) by LV9PR12MB9829.namprd12.prod.outlook.com
 ([fe80::2bc0:451f:661a:ac32%7]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 02:24:20 +0000
Message-ID: <cece70b5-3ff6-492d-af90-9622361db012@amd.com>
Date: Thu, 15 Jan 2026 10:24:09 +0800
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
 Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
 Alexey Zagorodnikov <xglooom@gmail.com>
References: <20251216091326.111977-1-Bin.Du@amd.com>
 <20251216091326.111977-4-Bin.Du@amd.com>
 <aUkRQEeAWDeQknP6@kekkonen.localdomain>
 <92ccb38a-5c62-4730-8a41-fa80d2f523a7@amd.com>
 <aWgCrG_39DV-j80G@kekkonen.localdomain>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <aWgCrG_39DV-j80G@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0069.apcprd02.prod.outlook.com
 (2603:1096:4:54::33) To LV9PR12MB9829.namprd12.prod.outlook.com
 (2603:10b6:408:2eb::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV9PR12MB9829:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c0ed71b-c630-493f-d31f-08de53dd307b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dVMrTHZDeW15UEY4SjZ4Wm9BRE1kTlZYZkI3bG9NWXhhS2VjWElyRmxDckpv?=
 =?utf-8?B?TnN4RlRIbVVLZ1JzS1RQYWloQnIwMHU2dnVyQ1NjeC9iZHRoWDVuWkhPcWxa?=
 =?utf-8?B?WFdSckcyczFJV1IyUmxmblU2NUZnWDhYemVnczNTb2NNU0VaUGM4QzNIZEVW?=
 =?utf-8?B?SlBSNy9VVlZMT2ZZUkVNeE9jNlJodUQ2bmo1Z3hvWUQrMUZNYnZpVEtnRkIr?=
 =?utf-8?B?b1drK215SnYrdGZJYmZtazVSNUpmL0ZCTm9LVUtQdmJGYjExbVZsanRvUi9u?=
 =?utf-8?B?ejViNldFb3craFkvSURhUHFVWjREdnRYYzlvYURuOTROanFZUDR6QmtXOXhW?=
 =?utf-8?B?VDlFTDhidDloNzZMNlQvUVdOSTcxWDdGTEE4MGdPUisvR2RHZUtpdGhWc3Nl?=
 =?utf-8?B?dm4yMDZzZzdWTEVXL0F3WERQY3J5OXF0Vng0N0VYejgwTVdPZG9CWlJyQlFV?=
 =?utf-8?B?SVU2WDZhM1VIWWNCakpzUUd5UlhpbDZUQ2J1NUllQVhzUzErQUNQSXFBbTZP?=
 =?utf-8?B?djVXaEdkSjNLbFd2WlNSVnRFanhXT1lxMVZKbFk2OTVTMWM5TE5VakdNRCs2?=
 =?utf-8?B?RXpnU2REMTZwNG1iaCtpYU5UbFBWa2JvUlRwaUtvTlF1MWFvL2lOeHVVYzk3?=
 =?utf-8?B?UnR2RjRLbDZQUllWMjJmUktjSXhuL1AyeTBVc0dnRHlTQVF2S3hSdHFLTzFw?=
 =?utf-8?B?clJ4aWlMMnVvUStHL2doZFlHYzZlRXVYVSs0UHl1ejZMcUpYU2VOdm5BWGhx?=
 =?utf-8?B?MUNOL1U5Z1J2WTVUVGYxVXZKUHNCcFN1WmpTSFM2NlYvbG4yeEg3ZzdRZTF2?=
 =?utf-8?B?VXRVaGNmTVVYdGZ6T2o4M3pKUkxJWVlqc1hVR1MremNuUWJ5NmF0YlNhL29W?=
 =?utf-8?B?QlNLSmgya3dQdGlFc1FpaGpaMmxGL054VlpsQmZNYkdKc3VRa05mMHlKM2R3?=
 =?utf-8?B?dnhnSDZMS0tjaDRBVE9kd1AySFJNYjlkSVgxeTZ2Y2NEK1RrbVpLbVRkK1Vi?=
 =?utf-8?B?OTFTSXVSR3IvOStDb1M5L2dET1dVaTNWVlhJODdNZEM1NDgxVlQzNGFiSHV5?=
 =?utf-8?B?ejJJd05Bc1RnckRwaDhmWEwvK1BsQ3Z3U3JNVXRoYXpIMEgyb3RHc3doTjZ6?=
 =?utf-8?B?WkNPeFV1UzhBMUJtclRLNWxGUElzRmRkRkUrTzhIN1dLSW1jaHd5Z3VEYUZw?=
 =?utf-8?B?eUhxSC9LOEdWdVVPSC9WVUpRVlF2OFRLQWY1NjlRNDUwZVZ5WWhERWVmTFpp?=
 =?utf-8?B?N0V5eWo4QlJteWZoUW81MTMxODU0dTY3R2c3UVhLN1ZRRWhwY2xoSndDS1pz?=
 =?utf-8?B?MGlSYmpXNEtQOXRWWFZBTWNiVVYwd25Oa005THdpSTNRNDdpNnpISDZYODc3?=
 =?utf-8?B?MkxjZFppMzZ0QXpsalZXZjk5UU1wQUpQRHhOMEx5S2dYUjg4b29FcWZoakZk?=
 =?utf-8?B?Y1JmRE0zaEc2WWMxRldtSFFnR1poRU5IUDFDVGM3N1ZlczhYVytCY2UzM3Rn?=
 =?utf-8?B?dnRkVEdtZGQwVFVXNFNBTFFBVlhOendMSzhGN0FSSmNCRHBVSkFvSkxEay9N?=
 =?utf-8?B?bTNLcnA5azBYRWxXdGJEcE1sRHJFaFBNWjVGODQyRzZ5WU84VzJLV1M2eFps?=
 =?utf-8?B?UHcybzEyZTdsK0RZeGpOVU8yVDVzckYyYXNjbVdxTVZ2U0tYKzBkMytNUVZn?=
 =?utf-8?B?enhXYnczWUwrRnNqNmk0bDYwRmlYU04ySGxsbStZMjY2RUFmNkVBcDI5Qi80?=
 =?utf-8?B?T0E5UUtyWS9VNnkvVG1wUUhjTzg0TjhyNmowY0NtUVFTOFpvSEhvZDFJQVpY?=
 =?utf-8?B?RzhZVFZheXpHbUpZNWVpYnhoZ2ZLOTJaK0NuWVR6SEI2T1lHUlJxMFBZNFFJ?=
 =?utf-8?B?TU9kbHgwdVlBbGdGazl5dEZYSHMxaFVrSWVsRU03ditNR1J3RUMrS0hFbzBF?=
 =?utf-8?B?RW9PY29FaWRYbVhzYWZXWGh2MmM4SWRIU3EyWEx1VktvSmE4M091cHg3aHpr?=
 =?utf-8?B?VjRuOEczZEh3UWEzT0ZRcWRETk5IS1RpSnZwbHlZd3hKV3J6aS9QQjQ0OEFk?=
 =?utf-8?B?aEdPZDhHQjlLTTdTV0p5b1hNSDl6OHprVkg3UGJxVnBQQ3ExeEFWd3dHM0Ru?=
 =?utf-8?Q?hZa8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV9PR12MB9829.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFFqTUNoK0kyTi9DS1FzUVlyK0JqelBOT0wweUJhbzFiYmJ2Q1hZV0dRaEJx?=
 =?utf-8?B?Z0JhM0VyalV3Rmw3ZGJZNGRlSkhEekNaT2JXdDZmU1pxeERRdlFmTmRBaHVz?=
 =?utf-8?B?N2FRZ2hNQmNhaGJLTUsvWUVWcjc4MTA4WmF6R2R2QUUrVHAzSmQrcXR6RC9I?=
 =?utf-8?B?SVlGUFpxaWQ2L0MySkI5U091Q2doOTJtMHcvOHJMTnRJMWI5bloycnNISlRs?=
 =?utf-8?B?dVRQVXplR1R5dnp6VXI1V2RBTGZoOTlnUiszM3lvRVIrbzM1b3pBdDFUd1Nk?=
 =?utf-8?B?V2pDT3FDblY5VG1MV0pDUXdsbmtFTzJVVFNsVkhzajl6K3JQMk9pSHBoR2JB?=
 =?utf-8?B?WjdLcEdheXFEOHdRcm4zRnd4SlM3RDdiRnhkRDhsUVNsaGJReUdYazg0aGJJ?=
 =?utf-8?B?NFNBaFd3RVdFK2JkRkpCaC9iNFNkWkdzdkpoOVVpdnh3eFJtRjVWc3NIT3hu?=
 =?utf-8?B?L2trUmY4MGRqTWZXdWZZSFJNaFpvcSttVHhMamxFQk5MelI2TlJ2emJNUFhT?=
 =?utf-8?B?bllzWng4US9rRjVLOTU4MU1wSUZFdkVTYm0rVUNVZXNaRnI4S2ozUHE5V0VY?=
 =?utf-8?B?S0ZJanpnMThEZWtKNXRtcXZpY1dIYTNqZlJhdHZzYlovaUE4S2g1THEybktR?=
 =?utf-8?B?dW9OYlFCWXI1d0JYMWgvWFRIQTBPZTA5SlZhL25GNjErelRjZDF5KzM5TCtS?=
 =?utf-8?B?d3NjaFJ6RGJrRDlBVDk1ZDhTQkhGdU5jaWRwNWp0bnM3cHpPamNBMkxoWW8w?=
 =?utf-8?B?WmhoVVJ2UmQyc0NTdWZERjIvUnVqcEE3SGt2Nm9RUWRVRnJ1OXNlNjJiQWc0?=
 =?utf-8?B?ZUVvemh5dldLbXlyUkdNQUJuMFovMU1EaWxTQVp2NituVWtKN1JSczBLaWJT?=
 =?utf-8?B?MnpGb0d3YTVBTXJJTU80SUp4TFBLRVdHdTNJWmNGeHFaZVNUYUtzVmFJdkdC?=
 =?utf-8?B?MFZ5R2dNMWVKZnkrZ0RTa0Y1OVE1aFIyUXlFY1BOTldUYU9laW9BQ3lxdXZ3?=
 =?utf-8?B?UGVqVHRGYU9DdzFhbXlIZ2Nsajd4cDQzcTFjVWt2c2VZNml6bnZNbUtjZEly?=
 =?utf-8?B?N0ZrV3JkdktXODRNSVgwSk45MjlFaU5HbTBBZlNiYXNtM1hhQTN0c3E4NEth?=
 =?utf-8?B?Ukp6aW1QWkZLRnZQbXlRdDNtM3lNdUkyaFEySnpQQ1l2VHEyRGdxdEZBSU1M?=
 =?utf-8?B?VEw3aGJ5aitFS3kvajlYaHpmUUJoVTdOeGNoQnp2TVRGckp2S1AzeTdlRWdu?=
 =?utf-8?B?RTR3OEV4WFVXUkFlNGZvZnNaRERKRFBNa2lvcFhIVnhkRUE1WUVmd01tbTRm?=
 =?utf-8?B?K1FKdUtsWWlhYjB0U2UyTzdnWXJyTXovT3gxRTR5ZVpsRE9xMVRqN29oTEw1?=
 =?utf-8?B?MjRwckhSRGVqWmRWVzdrb3NUcVVmVU52VDhnTFdvdDk3Y2YzOVNKZVpJdTBa?=
 =?utf-8?B?emJLQ0toanNhSXJKVzA1cFdEVkdqYVFtTDdwRzJLSWJZQzZrbmlGNmhkSkhN?=
 =?utf-8?B?bThIQURXRHZMSEJmUGhMYi9IRG16TWJVeFFadktOcXMrL25hdlc0TGU3WWIy?=
 =?utf-8?B?SHo3b05KeCs0L2Q1MnVLSGNjWjkyMndLTWQxTitNZVNGb0dVZlo0KzhIZzRG?=
 =?utf-8?B?ZUFBWHhjWGlqUUM5V0ZVS1FkcjJlbStGSFc1V3JEMXpDeDNMQm1LaFdTcUNS?=
 =?utf-8?B?NEZOVlgrOXJOeGRVR095cE5sVXhzaGN2NUU4UGFROVJGWVBLTit0eXFEdGV5?=
 =?utf-8?B?emRwN0FvbGlrY3FJanVUaGRKMmpkb1pUcytydTB0aUwzOWFQWG42bGdGZ3h6?=
 =?utf-8?B?Q1NoblRoLzEzcFFpSEw3V2YwZm44Y1hxYVY2dElPRHlISGVPSjQrOFVxaTJP?=
 =?utf-8?B?RXRuKzhjYi9hbVNxNDV0M0FzWnhzNDE0L0JXRkNCRS9DSkwxZzdIaEtWd05i?=
 =?utf-8?B?Vk9URUluVlVmT0d3VU44T1VwNVJmb1VSa29hWUJtNTJEalN6Y0RMYzRYcTd2?=
 =?utf-8?B?TFNYbnRLOFd4RERBYWQ4M1ZVdjBUdXJNc0pPQ2t0K0hrSlQrTkFvYTd4bjJm?=
 =?utf-8?B?QUt0ODY1NFNtS2FQQkdmK2hsTERYWDlmWjRoQzVsK0p5ZlhKZlhQOUVCeEN3?=
 =?utf-8?B?Q3h5bXl6Q1V2SHR3ZUpTdzU5dnFWVzA2RDU0b1ZHUTQxdVoweVlsTjA1NUlC?=
 =?utf-8?B?c2VsK3QzR1JaZkpObEJ3L2M0QS9pZlBPS2RiekRTUktmUXE5SWdpZzAxTWlT?=
 =?utf-8?B?WVRqVXBpcTc2ZUczVWp6YXZ6Zk9ZZjVsZExRaDFFcnJ5ZjgyZmIwMy9EVGNZ?=
 =?utf-8?Q?byTSR+fz9m3C8+Q5f0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c0ed71b-c630-493f-d31f-08de53dd307b
X-MS-Exchange-CrossTenant-AuthSource: LV9PR12MB9829.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 02:24:20.2836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rwHqAYyKVgz8y1EmKFgBTk4pWftDsow7VkWXcRaXwD1wldusapyZPbg6CaWYmoX2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264



On 1/15/2026 4:55 AM, Sakari Ailus wrote:
> Hi Bin,
> 
> On Wed, Jan 07, 2026 at 04:44:11PM +0800, Du, Bin wrote:
>>>> +int isp4if_init(struct isp4_interface *ispif, struct device *dev, void __iomem *isp_mmio);
>>>
>>> Could you run
>>>
>>> 	$ ./scripts/checkpatch.pl --strict --max-line-length=80
>>>
>>> on the set, please?
>>>
>>
>> Oh, I will change --max-line-length in our checkpatch.pl from 100 to 80 and
>> fix all the violations. I used to think that the requirement has been
>> relaxed to 100 columns based on
>> https://www.phoronix.com/news/Linux-Kernel-Deprecates-80-Col
> 
> The default checkpatch.pl warning has been changed but not the coding
> style. There are valid reasons why you might want to have longer lines,
> still checkpatch.pl not warning about those isn't one. :-)
> 

Thank you for the clarification. I will adhere to the 80-character limit 
as recommended by the kernel coding style.

-- 
Regards,
Bin


