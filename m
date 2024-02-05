Return-Path: <linux-media+bounces-4706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1205D849D0E
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 15:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3599B1C247F8
	for <lists+linux-media@lfdr.de>; Mon,  5 Feb 2024 14:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DACA28E09;
	Mon,  5 Feb 2024 14:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="WUnpm7+Z"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05olkn2020.outbound.protection.outlook.com [40.92.89.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07DF24B2A
	for <linux-media@vger.kernel.org>; Mon,  5 Feb 2024 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.89.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707143334; cv=fail; b=bU4Da0+DNxFG88GovmOTHb3atKKd9nRaiQorWCKYELPP6j2qiWgzpF+uNaLaCSOwT1XgquwX91l3GLUMO4tJK78M870U9jxDr460VrNVn7IybnQ/opKft56QiUb68gmzA8wO8aVyyCboaMaxCej3Ju5+Rclyx9pdsqq0okzD8IA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707143334; c=relaxed/simple;
	bh=Q9iQEbxIyVOTa9wdHdfKow/wWCr87L4v+rUhQChAddM=;
	h=Message-ID:Date:To:From:Subject:Content-Type:MIME-Version; b=Bo7vENlFHENNgOrlTTzks5dhlNSPhDmavsFMUXeMbg5FryIYnSN5imfB7OTjfiXPxBuW5zCJ5htExqWmFjcRWY30DGfeDvJa/ohTKqI+ekCFuuDds6mkWsSUqhKdhbYQAnXW+Yb8BO2rpjByUW5t3zuYBKxQNq1vtllWwVK/e8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=WUnpm7+Z; arc=fail smtp.client-ip=40.92.89.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CyCsrkJOLdJJXVWLiWy5M2UjtEjHh98uV/GeUJu2OARn7Pr0sWkp2XfXllXi90ks7K6WfY3WITRtEtLg6CEY62dFyfNOF0gaFwG0sNJvk1q3A58vQFlfGED+6E57vjb3VS+N7Cw/csxYz+qkf+dbetQvzUjJlZpuzTBOXyInocR+SZsIeozC72LRBwFiwPvXXwsOxEvq2DF/uL1MCEjVp+o+luQTZFnuusHIbfutGhkKwh8qe11SKCV+S3bcNCEEm7WvHtAqMpq2Bdfun09LiEKqAmB8pSvF35qtGGTVVEXILruqWfAoX//0NfBEbY5SmKnBxMkyZGNGjIbxFgN/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxWGQfytnJdf6Bz+BhkgC6cBp+BY8mPFB9CU+lqLT0w=;
 b=nX1lTNah6edCGt9QEsZre1T9lgX5NbcKs3asc60REBonGxruo6c991iymF8aIj1rlLstnQqQbpmlbZehY8d/qurWqnr95o/zy6lLYv2tYtatvpG30JM8ZbU/o2WcVsu1S6adwjtGBoI2Rk3oDv5mo7aMhX+Y2LgmeGX39xYf5x7THo4Fg7RkXpwFybJ7C7uuFe8uQrycVDXQWkqdy52iuXeMl0Gjo3zjsWIyhnXVWgee4iJBSmlcW40ex80QcXzRTpfrvjjpi82Zq+Gb0cHJ/g89rz0oa2WX0bz7f9igwkg9BTqWaRK5d01MtTVaNFoje97Ob2erR1ZraZ2S4keNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TxWGQfytnJdf6Bz+BhkgC6cBp+BY8mPFB9CU+lqLT0w=;
 b=WUnpm7+ZL9SjnhcfBE/wSycnigwYumRv0qVOiOx6mC1vBlswT4ygK11JXvxPr5F79voZMaIU3rl8Nx+m7Q+p5tClrASRFtvH5JPwimaOF2/Yhb76bQtm6J+2aOnRcRpcWQ3P9hy0rFFFxGuuD/ebTIV2E8AwRTwv4mxI4nFQp6Xa+vMOCwfk2Hk1RTKOADHTJJayDsVfCEU/GWxIZUmLXcebCNt7sZWnpbpMLLWLSHBt5a53y8cOzGiSJwWLmy83HOWsAMVddOGzogrx9oN7S+u6jGu78KD0w6/KMfv7E7gQGc0hZRJqFu3fn6NI+KCBXfxN/trs7SJEaagvSoCz5w==
Received: from HE1P193MB0218.EURP193.PROD.OUTLOOK.COM (2603:10a6:3:105::16) by
 DB8P193MB0741.EURP193.PROD.OUTLOOK.COM (2603:10a6:10:155::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.34; Mon, 5 Feb 2024 14:28:50 +0000
Received: from HE1P193MB0218.EURP193.PROD.OUTLOOK.COM
 ([fe80::f76:679e:40b6:18a1]) by HE1P193MB0218.EURP193.PROD.OUTLOOK.COM
 ([fe80::f76:679e:40b6:18a1%8]) with mapi id 15.20.7249.032; Mon, 5 Feb 2024
 14:28:50 +0000
Message-ID:
 <HE1P193MB0218F70D3264B133C664D79D89472@HE1P193MB0218.EURP193.PROD.OUTLOOK.COM>
Date: Mon, 5 Feb 2024 16:28:48 +0200
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-media@vger.kernel.org
From: Jani Ilola <jani-ilola@hotmail.com>
Subject: Anysee E30 combo plus dmesg error
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [vhc5qMjVIB4Mq5sV+DOWOpIzCe4WA672]
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To HE1P193MB0218.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:3:105::16)
X-Microsoft-Original-Message-ID:
 <6e1f280b-83f5-43de-9d40-b134777e9842@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1P193MB0218:EE_|DB8P193MB0741:EE_
X-MS-Office365-Filtering-Correlation-Id: cbb4f13b-42c7-447e-5fc2-08dc2656c545
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wqJky5+ChnIvgM6LeeCAfOSk20L1YNzH6iv+jXYMnuOpYR7SsA3ZoL9cRXBJEMLw6z+/TidR6QvgySyg+WpgipzQ9qNWC4HPGs53/aMRkASg1Ao8CtYGJmiBRxY/1OHENKk7w3c6YidwQbd9ATLqsFDIjNcDq7O3nHHf/AdnXtACEPXyJoh9PA0gjxMffYR7OICPy0sQVQBoB++At+nYz6+uA0k3fAXiX6Wv/usHMrocdcAjXeK3MFq3JroVGdSJ267PJdnI0ZIhrCKsQXQ0qCO8Ot7iT3yOAe7k5QEbP65byc2LBpLyOuIGBX1Dr4X97kSkB2aJNNOebpqVOJ15RTQ/1LNms5T069UREq9ZDRaidY8TVG4KlUCuY7s5yWyhYYJ/XgBOk6Rp6FcwA5rJtt0HVsjYGr/lPtAu9129LvF1fA2xWuXSSbJEB+5veJnWJnPbVW+Qwh2WLY3LNtqa2hwKUG5GCIvaQCKmd/+gUAI1gIA8Za/FbHjnjnlI+1n9TG3vWhkSd8nW1eHXKAapW7GAGffvjDc+ZtrX3tuCe4Wkg7+2QF0N2lCJN3UsL9k7
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWNpNUp1UVROcGNlbkRjeTQ0NCtsYzYxQXRDdTR1dVk4REdLcVpzUVdzQlc4?=
 =?utf-8?B?d3ppcXEva3lMTUJXSVJxYmhhZkxINjk4TlREWDFIS0QrZjJKUkp6TlIzcVFz?=
 =?utf-8?B?S3VmMy85ZU9EMDI1dkc0Y3BGTTdmdDlEVGt5Tk9KYVhoazd1bjJIZ2NyVTNF?=
 =?utf-8?B?anZ6RUZJdCsyYkRTc21RdHhSbHhuZXc2aVlJankyMEsxOTNMNDYvV2dPTjg0?=
 =?utf-8?B?aFJuQlNDb3hHMnNGS213T1RHSzQwMTFwaERvYnI2OHVXaU5EZC9RdmUrcjNM?=
 =?utf-8?B?TXhnMlVGdG44NjFWUG8zc0k4RDdIQmVqblZ2bU9FSkhUM25pNmwzLzh3UGlG?=
 =?utf-8?B?MCs4RG4wMGpyNWloVXpuUThCK1FSVlVMYVdGMGw5SFh3UHBsbEJicXpWc0tJ?=
 =?utf-8?B?NWN4SXBRb2NzVlFNcjNhMG5JTFhqV0Nqc204WVVLcFQ0RXl0R0Fqc04xQWc0?=
 =?utf-8?B?T2NONndHSU5VejVEQ09WNGYvSGt4bURVNDBSYWVqaXpRNU5ZaVpndncxRVBP?=
 =?utf-8?B?L2EvVWg3QmRYVE1NWFFrdGJTelJqT29NNGhTK3lMQi96OFY5d096WFNBck5G?=
 =?utf-8?B?L2FPdDNncUMyblNUMGpHUXNHbTBNVVhDTTIyRDl4ZjUxcCs4d1ZWTG5Ybzky?=
 =?utf-8?B?VWE0STE2Y01md1NJOEVwYnhlQWQzMk9mQ3FFTGNrSnBKM0MxUUVRY2gwR3Rh?=
 =?utf-8?B?NHZQaUFCSGlFTFY2b3l0ZTVHbGdRQVFNS25Na0xqaTRhQ1p2QzVQQXc0ZjV6?=
 =?utf-8?B?MlF2NzhMU3V3M2FyMjZYelRkUUYvKytxcEJwZndsZ09tRzR3bk15WVE2VWw5?=
 =?utf-8?B?NUo1bFIxZFdYVUpuUDE0VzdvL1VUVEZmR2RxKzZ5VFkyVXUrNUdiWGpHUUY4?=
 =?utf-8?B?bnpHYWczMTBGOUt3TDQ1WFB5MVgzNzVZR2FleDhMdXFXZWZPOVFSUXJsTy9U?=
 =?utf-8?B?aW9VZGZ5Y1k2b0RJekkvZENlQmNwaHhJdzF1QnhjVUFVQWJmeFErY2lYUGwz?=
 =?utf-8?B?Yy8wTmsrcno1Wkl3MWNVdFR0bGdqWmZuYkY1bGplNXV4QkNKN0FnaGZzVVI1?=
 =?utf-8?B?V2ZQMUtyZ1VhZUxNWjAyaXlwdGdqcWpLV0VQeUdNSE1hZS9GS2JDV2hiTXAv?=
 =?utf-8?B?a2pyS1piV282b0RDSld0S3Evb3N5YklWdTNzcVFESDIvekpFbXptUmRta0R6?=
 =?utf-8?B?VFNMMmF6RS9BV3FvYjVUS01DMms2MnFuMWYzSUx2UzFlelB6eWlhSEhhb2F5?=
 =?utf-8?B?c2ppYVBEa2wxc0psSU1MbHRmYm96M1J0L0hxWmQxbnVkV2pGOVowa0h1NDA2?=
 =?utf-8?B?Y1o4MVB5Q0ZFZ1lBVEpnVUVUdW5LV3Z2Tm1CRlFOc1pVeEVYZ3RreE11OWpF?=
 =?utf-8?B?cUZnU3Y3a0phYUtUZG93V3dVdzh0V1FMUkdtWS9BQnRnUVhZZ2kyM3dIZ0ZY?=
 =?utf-8?B?ZjQwZUhrL2NFeFRpZVBqTHMwVDN5NzZTaGZERUR0UTBJSG1peS80YlF4eW9j?=
 =?utf-8?B?YStZTTJYWkQycUZRMi9JV2cwa1hLOVZMbkJnQk5HL1FqTkxIdjFqanVUTWcy?=
 =?utf-8?B?SXpxOEY3SkNrUnJ6UTBGUWZtdUVlNUxkT3NTUFcxQXF6Z2lCd1l1WG91M0RI?=
 =?utf-8?B?bmRjTHhYRDVidWxMZTFzVjViSmxOR0E9PQ==?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-80ceb.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: cbb4f13b-42c7-447e-5fc2-08dc2656c545
X-MS-Exchange-CrossTenant-AuthSource: HE1P193MB0218.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2024 14:28:50.1504
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P193MB0741

Running Fedora 39 desktop with kernel 6.6.14-200 at the moment.

The Anysee E30 combo DVB-card is detected by lsusb and lsmod. However it 
is not working and dmesg gave me this information:


[    9.170547] usb 3-4: dvb_usb_anysee: firmware version 1.2 hardware id 15

[    9.170590] usb 3-4: dvb_usb_v2: will pass the complete MPEG2 
transport stream to the software demuxer
[    9.170599] dvbdev: DVB: registering new adapter (Anysee)
[    9.170601] usb 3-4: media controller created
[    9.170758] dvbdev: dvb_create_media_entity: media entity 'dvb-demux' 
registered.
[    9.188820] DVB: TDA10023(-1): tda10023_readreg: readreg error (reg 
== 0x1a, ret == -95)
[    9.188828] usb 3-4: dvb_usb_anysee: Unsupported Anysee version. 
Please report to <linux-media@vger.kernel.org>.
[    9.189229] usbcore: registered new interface driver dvb_usb_anysee


I found information online that this driver has been broken since kernel 
6.1.38-4 so I believe you already are aware about this issue,

but wanted to report this as the dmesg asks me to do, so that you know 
there's more than one person who would like to get this working again.

  Thank you!


