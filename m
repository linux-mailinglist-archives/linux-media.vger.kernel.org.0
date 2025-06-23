Return-Path: <linux-media+bounces-35712-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F872AE5804
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 01:29:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAF8C1C2614B
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 23:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5039822B8AB;
	Mon, 23 Jun 2025 23:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="M3u9PQfe"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2079.outbound.protection.outlook.com [40.107.100.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201FB4C83;
	Mon, 23 Jun 2025 23:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721335; cv=fail; b=PNEkbNjF8jnqjhG5d+JAtixQYvwioeGsYcVO7reLNYGwqLhFXnEMv4n8/vB+a29r/KSbkpf6Jv27RDZEeR7Q8uG2wg+K4/pJ1q7gw38RVfd9im3FMBIVWGF9SxxoFMwpjcAmevwsz19u/fLxlYjQRZqtF7iFBJ03DN53tmMJ7f4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721335; c=relaxed/simple;
	bh=1jrXv54celdCnCwOOtMPs2RMDoJ97BC9PKFHQ/lSRhQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=idv8PSti6jC8+jsuGtZldFlTwEXc5Ufx6hQJVIrVpNDvH16lThSLiCptyuoU/CJ7uhaSHY4rPLiOp/5znk5nQHTf95cJOWFkDNOJ3EBXW4MS/aH6rsNT90gTdUjEUKgrrIFa3iL9ArpfyAqmFE+X4TIV1J6juBUPnuKy4Zs5ynY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=M3u9PQfe; arc=fail smtp.client-ip=40.107.100.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZySebbR2bgyHDLvlakx9KlI6JQ6CftQH2BQqTmLvjNzhG7siUpMnfL3gcwHedFpMDyUR+0d3kT8MSJmjvkj14IBL1bDFfWiZiKvF4uUqZmA4Fqt/kPQ0qGwaN47J0EilvPUu/5q8pcanxYKQl67TJPDhMLF5NUe3cGonJi8+/lupgE/X8/gfQgAuWZmsH7SHdxrpW1kjMlpZnueljlZIarxAdLOdmHv1ly3Co4DJ+1+sdVJqH6cExU3PNAL27zWb0NZ/08WxhKboH75ArxJteeixb/m6vAR8lLFQ4WNmLeLtF1cj8urii3S7J3+RbvZ+idQZAbE1Yfm0LiMgTSGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=84DooqlxIArSPFRLAC8U+h9NgMUESTawFfK0jHIkZ08=;
 b=aVB3FAGTyBCioaleROQpLMUlLhZIwQQ+AsYBbAeZ0qQbwXItWEtU179ZLLXsHPsCCHzM9N5pbLkSwp30mGTgchqzeHxVXHG7zTGYmseNgxzsvo+ZMIT3OU4xWzagGy7VfE16YZhxurjXGl1yZLD2j/AAWyophKMddOGJUnJLoQOUJmLe5FZY8e9MRLjSq5/ORpKdiW1/1T+prErSPgs5OeiydFfGydOrJE9yVX2vzJ8ehTdU5L7e4kAyOfIXoghkVwkl8wUzL6u4kGDp/c+u/nvMjPjwHq8Qhrf96qcAqVqmyXKOBHxCAXJHsTflrS7cWuQraIoieJdgq38NmsLz8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=84DooqlxIArSPFRLAC8U+h9NgMUESTawFfK0jHIkZ08=;
 b=M3u9PQfeUPaRoNPsx3tLP6ASWYWAHZCB3VW7mfWd7rClIeEQECsDQu8hR8FcF/s4weXD1iC2aEZ5KEXrG2YvBYsQ76EoZdLNGEc6Pgvu3PwnWIgEgWvt5HKRmbUv154r9sulw0SwX3IwSO1B0jBfdpIL0l3u/rU2LgI4BH9BLGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CY5PR12MB6429.namprd12.prod.outlook.com (2603:10b6:930:3b::16)
 by SA1PR12MB9001.namprd12.prod.outlook.com (2603:10b6:806:387::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.23; Mon, 23 Jun
 2025 23:28:50 +0000
Received: from CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0]) by CY5PR12MB6429.namprd12.prod.outlook.com
 ([fe80::1b40:2f7f:a826:3fa0%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 23:28:50 +0000
Message-ID: <163655af-2a3d-4489-ac7a-4ee31d3980e2@amd.com>
Date: Mon, 23 Jun 2025 19:28:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Content-Language: en-GB
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
 sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
 bryan.odonoghue@linaro.org, krzk@kernel.org, dave.stevenson@raspberrypi.com,
 hdegoede@redhat.com, jai.luthra@ideasonboard.com,
 tomi.valkeinen@ideasonboard.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
 grosikop@amd.com, king.li@amd.com, dantony@amd.com, vengutta@amd.com,
 Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com,
 Mehdi Djait <mehdi.djait@linux.intel.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <20250615000915.GQ10542@pendragon.ideasonboard.com>
 <53674c5f-6b68-49e7-bbb0-fd06fff344c3@amd.com>
 <8b16675a-c6ac-4619-aabe-ad2a4be6c964@amd.com>
 <20250623220503.GA15951@pendragon.ideasonboard.com>
From: "Nirujogi, Pratap" <pnirujog@amd.com>
In-Reply-To: <20250623220503.GA15951@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0033.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::46) To CY5PR12MB6429.namprd12.prod.outlook.com
 (2603:10b6:930:3b::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6429:EE_|SA1PR12MB9001:EE_
X-MS-Office365-Filtering-Correlation-Id: b7797851-6628-4bf9-ace7-08ddb2adb597
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a2FUVXdtcjhxTXJHY1ErUTZCWHQyMk1OOHM3dXdyY1ozTExwaGNzTVBqN1lG?=
 =?utf-8?B?SDBRL3d6Q05BVDM3UWJqN2RXY2YwQm95WDFna2dxWjMzaDhPcHcvNGdZTUZV?=
 =?utf-8?B?NlMyT3BrMitLTGx6NDZ2Qjk5Y1A4T0VZRjF5VVhXTUlibWZhakFxNGo2bHp4?=
 =?utf-8?B?dEFVNzNoYTZlTHdtZFNDc2dKY0dVMmxodUV5VTVkSi95ZGo1cnVISHJRcTBr?=
 =?utf-8?B?OVlheVRMVERzQjZWV2JWMlg2NUltekpBc2NkaGppRHpEbFdzUERXUTZGaGxS?=
 =?utf-8?B?Mk9NREsxNEdUSVUzZG1yOE9FenFxNEdpcHZXZG9XUmYvRVhPUXc0N2Ywd1kv?=
 =?utf-8?B?Qk1QMDk1V2dxRkF6ZFVhWDIrbWlMM3dKZStuc3FUZXBjY081RlJGRVViclA5?=
 =?utf-8?B?NzF2ZjhzeVlqbW1uVUNDR2V4L3lGOHBLMFdyTXFDUXZZSkR2b1JKdFBoS0s2?=
 =?utf-8?B?VmMyYWhDaUFnWXdkem9uWFYzZnhJT3lncS9VQ1VDVm4zNjQ3eldUYVNIcGtF?=
 =?utf-8?B?UktwenVraHVYUCtES0JZKzdaOHhuZ2JYYkZJL2xhL3Bhdm9TWldsOUIvMzcz?=
 =?utf-8?B?dkFLMkFXeXMxeWJiQXU0RlN0WlJmTlR0bHZUbkNQQkVuVzZrUjRTdTVvc09Z?=
 =?utf-8?B?aUVSZ1E0VnRCbmZ6OS9DZXZjNjlwYmlFQjNWVkE0ZFNHMkdlOWU5ZUZYOUxo?=
 =?utf-8?B?ekpvODhwcWliZ25LYmQ0dis4ckRSdHNMU0RtYkpPSk1pcVRlSGx0dVA4VlpR?=
 =?utf-8?B?VE5oSy82TElZV3FjeSsxUTRtTXNESjR4SGMrZkZ6aThiREI3OFV0ZHRVdDlY?=
 =?utf-8?B?QmJnbDByN2U3RGxBYnltVUhaRXRJWExjYkYxV3kxWWErbUVQWWVqcVJxSmdS?=
 =?utf-8?B?SE1DL0oxWWc3QTRreUZtUy91aTI1L3krOVJmMVdQM1poNVJpemwzVzZ3Q01n?=
 =?utf-8?B?MWFhUVJ3TnNsZlU3b2U2MlBPaHc3MUVGM0FvenJtM2Q2YmVmaWxxQVpDdWxL?=
 =?utf-8?B?L3I3dUpwMzZDZFc0TjYzMVhIcGxZanVUcVYzVWFXRk5PVFpSanpwSmlmMzdS?=
 =?utf-8?B?UDNSTFBvb2tLMHdFUDdadnRObHZFc3dzRzBWbTA2dG10ZWhIdEF0K01iUWJV?=
 =?utf-8?B?RTFPOGVaQS9TTWFJS3NqN0oydFRTVFB1eDFQbVFxSlRIS1VBRlBVbXN2enIz?=
 =?utf-8?B?aDVxbXN3a0xacFErK1FoclRSRFFRZWlyY0RFOGpaNC8zQWhDUVpqa2ZmcWRz?=
 =?utf-8?B?QXRDZEt3eGl6bWNyc1p2a2JaUTJsNmNRSVNQdW92WHlmNUVpcHNRbmJuK0I4?=
 =?utf-8?B?MDk2eVFVSjFHa29BK1FkdjJST0gwaGdja2xUL25VMzhEdDNSL1BOS0dISlMr?=
 =?utf-8?B?MURxM3NVbGxzVUJpUm92YnVSZHJUNlJqS3pWdENXb3J2Q200ZGFHMXlOWEdT?=
 =?utf-8?B?MVVvcUlmYkZFTG94RzliSXdQeFhLeWhFN1VaTjlPbm1PbzljcTJJR2Z6RmRz?=
 =?utf-8?B?Vlk2T2lzQjZmZ1FBNVFFalA4OXlMbFkzZFRNcjQ4bnYvYWd6V293UVNONCtU?=
 =?utf-8?B?K0JsbkdkeVNQR0tQV3J4RlRROUVTVXNHcFpnK2VxcFM5QkNBemlyR09CN005?=
 =?utf-8?B?SllnVGJaTWxScHlpZ05IUG4zWGM4MEg4QXhnS2JoQm9tYnB5ZzBsS01xSDRm?=
 =?utf-8?B?aEYxMHlrcENocmk4RlpHbzk3aFpPc3BkTXFwcGlyT0RaMDBHR3ZZRVJIWDdG?=
 =?utf-8?B?ZWZYekQ4MG5tZnltUVdQZDdhdDY0QjV0UDlIVzNYbzNOS2NJZFZSeFBJcS94?=
 =?utf-8?B?MTM0UkNtVUJCQy9mdkRXSmlMb1FxYnZCOHZJTTBSVGFVWTRVNkozZ3I0bXFB?=
 =?utf-8?Q?9VrNFSQWCz6CP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR12MB6429.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1BxSkg5SFdvVjJndXNYZzJsdVN3S1BReVo4eHBMMzBNVGN4WG9sb1hZaFhi?=
 =?utf-8?B?WkNuZDA5TkppaVRyanRETVZZY3NPZWFvWnZJWXBIY0I2c0JKM2JjMUdqazNF?=
 =?utf-8?B?SHVrYkxZVEphYjFCRXp6WUV5M0RhazlMbitpWUR4ZHVHYm94cHg0RnQ3ZHZ1?=
 =?utf-8?B?L0hieHNTVFFVcmdOb2FVUW9NWGxURnV1VmQ1RVlMelBna3FGeFlUM2NjUE1R?=
 =?utf-8?B?QlF0eHpJY2pGRENnUjhpQ1NYelhjRi9QaUJYeEVwM1ZrK1Y1c2hGNDdwelVp?=
 =?utf-8?B?aFh5eXFYckxsUURmV3ZTd1NXOU9NNytMeklmNkF5eVJBLzJQNklnY1Y2N3Ay?=
 =?utf-8?B?WEtqUXU5RzRaWGErVndVaFJVbjdscFFEeHo3TUo2RGxIbitUQkNLRkFhV1VZ?=
 =?utf-8?B?ZE41NjBtZ2ZjdHlGWXM1NXNxK0hPZEVnK0YzSm16cjFsa010dWZ4dnRBYzM1?=
 =?utf-8?B?RHVsMCtNN2ZNYVlUVUJJUk1ZSFNHQlJDeHBBVzVuSFI5WlBFZnNyRURGMU1G?=
 =?utf-8?B?RW9EdkpIQnJ4MEZxM3FNTEVSd3dMcDkveVloWVF5ZzVGWUNTOFY0NGtWdFpE?=
 =?utf-8?B?VTB6c21MSkQyRDlGN0R6cmZITU91OUhacnEvbkp2RklOanNGRkZ3cjI0em1r?=
 =?utf-8?B?OGo3UlJUMHhTSStaSERkcld6bzlZcnBhQ2hRUUpWdnFXRklLNGYyUFFBNXVF?=
 =?utf-8?B?dnByUXdPS3FmbHYrYVptcUowQWh4U3lkTHBycGhhRXdEdFlMTGJWd1NIN2x3?=
 =?utf-8?B?UDFFT1hmb2xOR1BCUENPZVk0L2M1NlFTUk9LS2J6cmhZZDVhUXFjWDY3Mitj?=
 =?utf-8?B?eFdlT244N3MzK0xEaWpRb0l2NTlTYmVYUlcvL0lKSUZmZ2szbEpESWJhZUdY?=
 =?utf-8?B?TjlNZHl1bFJHcXU0dVEvckJtZnpOVjU0dEVWU3RPbDd3b2ZWdlVyN3VHNXNG?=
 =?utf-8?B?bnpKSWhRc0hQamEra1VrQ3NwNEtXRkxCMDZSZ2ZDYmxUeVdWQVp6VHkxRU1z?=
 =?utf-8?B?MCtJUmdCNGZaWHJXUW9BTkNjS3NvZUVmcHoxTXdzMSsrT0FPMEhuWXJkK0Y3?=
 =?utf-8?B?R3dBMWFXdjR2My81SlJZZEVWa1p3c0taVzFTdEFQOFdYRGJjM1J2Y3E4aUNp?=
 =?utf-8?B?MWFYOHZKTy9pZm9mNXRxR1dTT0dMNVg5V29BSEQrcTdBUXVHUHM0amg0TU1B?=
 =?utf-8?B?L1lnbGg1SGtxOE1uSWRLMDdMVGU0cGdwc0NLZW93SDNacHZnRU5VMHVERUp6?=
 =?utf-8?B?Y1RxQlFCei9DL1U1MDljNmNaS0RmRzBNbDlUand5TGhHd2dMcDB6VlJhZXh2?=
 =?utf-8?B?bzl4MzlRdkZwRnZ2WHpXZS96aWtFZW5vVnhnQlJLQ2xJRW5wNUs1Q3RGQ2gw?=
 =?utf-8?B?NWs0ckJMdjRhQ24zL2Z6bXlQc3FwNkxJRUtZc20xR25aNy8rOFU0Rm9mM014?=
 =?utf-8?B?aldpWkZJSW1XNU5LM1Z3OENEMUh1MXVTUUNWQk1KU2dQRGJXSEk1SnBZOUxM?=
 =?utf-8?B?eTgrTmdiWmZyOEJmYjVWU0ppNVR1d3J5WHpyejhIL2dXZmdGT0JwVUY1Y2Zh?=
 =?utf-8?B?WDFSV0NBc2RkdDI2ODNQQkFvc3diR1ROTzhra2dCSXhnbjV1QlljZ1BIM3lp?=
 =?utf-8?B?SkNpSmoxOTNTakdQdnFxcGNCNGFZbVA4THovdWNFYWZVRVdYSmJNZERtcWdR?=
 =?utf-8?B?cmhBWTZLdDF1cUpyQ3pEKzJqY0hGbEpTVFBjNWp6MnZqbUxlQm9hZkxVOS9L?=
 =?utf-8?B?OU9QanNWbmhVcCtXalNjbXMvZ1lWTU0xMnhTNGtaWit4WEtsUFVzN0U0ZnRR?=
 =?utf-8?B?cmJodTNXRkFDZWdBa01jSStRL0pzYWU5MGRIUUtiY09QMTNCMDcwL0JEZHl6?=
 =?utf-8?B?OVhpWnBDVVBLbitvNkdyb01za1lmdmlwd09oTWVKODE2d2pVdE55cnVTZzVv?=
 =?utf-8?B?NkZNcCtnNjJMaERKU1dBLzJhcGJUOERmWFJTT0x4UEF2OENpT0lGRmZ2V004?=
 =?utf-8?B?YVM3dFI5QjU4QitpUjBSempyWmtRNHJZQzN1ajRwcHpEdW9JSWdLUmZxZDRl?=
 =?utf-8?B?bytlby9ORkh2VFdBNVpBR21iVWdLTStOMVE3R2xTdWUzaEJ5SnZMWnloajNB?=
 =?utf-8?Q?KA+d61DfQ5BxAUKzO5YHXQK+O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7797851-6628-4bf9-ace7-08ddb2adb597
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6429.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 23:28:50.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UvPJ/8bumYDiJDud5Cj2dINSFGgNvJP6D/IGBSPPIqbjjKnL9g8Jg/OWz+vW4dXV/GLoWHgRG/HHtcBTEXEZQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9001

Hi Laurent,

On 6/23/2025 6:05 PM, Laurent Pinchart wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> (CC'ing Mehdi)
> 
> On Mon, Jun 23, 2025 at 05:51:48PM -0400, Nirujogi, Pratap wrote:
>> On 6/16/2025 6:49 PM, Nirujogi, Pratap wrote:
>>>>> +static int ov05c10_probe(struct i2c_client *client)
>>>>> +{
>>>>> +     struct ov05c10 *ov05c10;
>>>>> +     u32 clkfreq;
>>>>> +     int ret;
>>>>> +
>>>>> +     ov05c10 = devm_kzalloc(&client->dev, sizeof(*ov05c10),
>>>>> GFP_KERNEL);
>>>>> +     if (!ov05c10)
>>>>> +             return -ENOMEM;
>>>>> +
>>>>> +     struct fwnode_handle *fwnode = dev_fwnode(&client->dev);
>>>>> +
>>>>> +     ret = fwnode_property_read_u32(fwnode, "clock-frequency",
>>>>> &clkfreq);
>>>>> +     if (ret)
>>>>> +             return  dev_err_probe(&client->dev, -EINVAL,
>>>>> +                                   "fail to get clock freq\n");
>>>>
>>>> Let's try to land
>>>> https://lore.kernel.org/linux-media/20250521104115.176950-1-
>>>> mehdi.djait@linux.intel.com/
>>>> and replace the code above with devm_v4l2_sensor_clk_get().
>>>>
>>> Ok, we will verify on our side.
>>
>> We tried using devm_v4l2_sensor_clk_get() and found its required to add
>> support for software_node to make it work with this driver.
> 
> Why is that ?
> 
Its because the i2c_client device is initialized with swnode in the 
x86/platform driver.

https://github.com/torvalds/linux/blob/master/drivers/platform/x86/amd/amd_isp4.c#L235

Thanks,
Pratap


>> Please refer
>> the changes below and let us know if these should be submitted as a
>> separate patch.
> 
> Mehdi, do you have any comment ?
> 
>> ---
>> @@ -645,16 +645,16 @@ struct clk *devm_v4l2_sensor_clk_get(struct device
>> *dev, const char *id)
>>           const char *clk_id __free(kfree) = NULL;
>>           struct clk_hw *clk_hw;
>>           struct clk *clk;
>> -       bool acpi_node;
>> +       bool is_node;
>>           u32 rate;
>>           int ret;
>>
>>           clk = devm_clk_get_optional(dev, id);
>>           ret = device_property_read_u32(dev, "clock-frequency", &rate);
>> -       acpi_node = is_acpi_node(dev_fwnode(dev));
>> +       is_node = is_acpi_node(dev_fwnode(dev)) ||
>> is_software_node(dev_fwnode(dev));
>>
>>           if (clk) {
>> -               if (!ret && acpi_node) {
>> +               if (!ret && is_node) {
>>                           ret = clk_set_rate(clk, rate);
>>                           if (ret) {
>>                                   dev_err(dev, "Failed to set clock rate:
>> %u\n",
>> @@ -668,7 +668,7 @@ struct clk *devm_v4l2_sensor_clk_get(struct device
>> *dev, const char *id)
>>           if (ret)
>>                   return ERR_PTR(ret);
>>
>> -       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !acpi_node)
>> +       if (!IS_ENABLED(CONFIG_COMMON_CLK) || !is_node)
>>                   return ERR_PTR(-ENOENT);
>>
>>           if (!id) {
>> ----
> 
> --
> Regards,
> 
> Laurent Pinchart


