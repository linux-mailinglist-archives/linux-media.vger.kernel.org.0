Return-Path: <linux-media+bounces-32387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0550AB559B
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 15:08:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A6FA7AD718
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 13:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E0FE28E586;
	Tue, 13 May 2025 13:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b="OYGVTINK"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2122.outbound.protection.outlook.com [40.107.105.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC9128DF3B;
	Tue, 13 May 2025 13:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141635; cv=fail; b=HEIwmCh7lNmYtHh9b7c4TtwlIgiIe1LcE25pQx3tYsVnpBdgsuVQUOf3emJJmYkPEXXVCqDRL40QjMphS2tNt7eiIAwp1z+HRDKYwsw4SV1paoWIlNaCIJc3H3pK1iCLMp26y+NE8AfFrYYpRdMl7vTkQw1R1/AKCPrTCcJ/oZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141635; c=relaxed/simple;
	bh=0WvQI917MdWl47Gnbg/XVVNmZr8BSxHsgICYk14dCgU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DSG911z4a1f8TVzXWzpLXcteCwSfNkt2dHX4ENRWklyk1ElPmEAeiWYjhocnYLme/uf78agkxH6RhAsuUl6Rrbj3bFrKRp9vJTsviPUSLCUtpPjzqVo/EwCthU+CmGSQx9aWZzR/S16cYpfvJG7LEcF9YMDHEFO7v8byGRgTPAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no; spf=fail smtp.mailfrom=neat.no; dkim=pass (2048-bit key) header.d=neat.no header.i=@neat.no header.b=OYGVTINK; arc=fail smtp.client-ip=40.107.105.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neat.no
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=neat.no
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qnL0IAhBFFqSp6b7uHJtekW1C9su6RU4a0qTBsRio2g9pwmslGNJEyxSBZBgFwwDbBimGjScVYmBCaVjPm5r2cXcKt7xuwtb8vHLQbXEZFAvcuxg0nNGpX890UuDJZxi8hMWqQYqoH9jniCzdt2BmZIWOkDhN/0/2ANC/cTh59vC2G7dTEefZtVyQPB0EG1RSEBGVbSlG5YL2/iAFVAwSxe3VZ2B/sBmZRc7yOBqpYKVpHqP5bd7oU+oTsOIu6rBoTtvxeMhjjlQ3tkBNfKyTQ3v8WkaSYwT38+l93zi5/5wU4Kd5GF65kFSSDtlnn4cvbiuf+aIpMFHh2X/uDN+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BtqdJ0/KZVRIGEpxWgYfUxciJ0Qy/UFKR/apBjpUHIY=;
 b=vQaab66/YTZYYzCx+IYSD5JB0cOg8wX0SCjxNEzD6WJVxtOvaMELF1UceElW4hsIMmuDFfbkDqWoL3bLnEj3jR48x4Q3dKoQPOXcrUak4lz4oXFA3Lv/F+W7s+xYKLPo7rRS6B0FewYn/0iPBv4Cna/EY078XjRdBXD+uBt4kfmLrErgXkEplVnM67H50YobVdS9nY5KXqLm7x67F2glHdoa02Ee4jpd0vl+/N9rLXOxhPvYe3nLvecihZhgg3USySt29OEBALEHQE8OQx9LmeYpqDLh30BZiqXpAXp1b1ZeeMIF50HL9WU3V8JYzwUOR8BzWekLZrwkx4serOCmnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=neat.no; dmarc=pass action=none header.from=neat.no; dkim=pass
 header.d=neat.no; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=neat.no; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtqdJ0/KZVRIGEpxWgYfUxciJ0Qy/UFKR/apBjpUHIY=;
 b=OYGVTINKK208efYvpU5MRzWIh3AjsCk5CnmOsuui2pCkyY15c+vfDMHxgfkcs8m9ONgQRZd45TEL9ICN+MWQ8BPtzgC8NBuxSZWC4VNnXYo10Y1zkC6iR1sKnrcJCxky/ya3Y7gWDEUSpqgkkOgIBLEmU1OravtPvQXsUg8FEf+6YAsd+x/GUDm+ICAE8spU4gWGDpjOSHapRGfIX7YeX3ElJRL4A8kG0RY96/JCkZ8oc2bOq2ekPiuW3Xhpc6uTFTl8/UimZG8XshrjFeOpBuITPESoGMN4OuTpmvo52DcW+/L7DadKpAVbl5YOBViwQIL0ZbOUlauHQ24r7YJm4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=neat.no;
Received: from AM9P251MB0223.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:3df::24)
 by AS1P251MB0406.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:4ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 13:07:09 +0000
Received: from AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
 ([fe80::f5d4:54a1:8303:1130]) by AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
 ([fe80::f5d4:54a1:8303:1130%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 13:07:09 +0000
Message-ID: <d2fec157-c1dd-414e-8d9b-e7054c48564b@neat.no>
Date: Tue, 13 May 2025 15:07:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] usb: gadget: uvc: parse configfs entries and
 implement v4l2 enum api calls
To: Michael Grzeschik <mgr@pengutronix.de>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Greg KH <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-usb@vger.kernel.org, linux-media@vger.kernel.org, balbi@kernel.org,
 paul.elder@ideasonboard.com, kernel@pengutronix.de,
 kieran.bingham@ideasonboard.com
References: <20220909221335.15033-1-m.grzeschik@pengutronix.de>
 <Y4u+9g/gIneGZrlZ@pendragon.ideasonboard.com> <Y4xaXHLoiPupWM6V@kroah.com>
 <b2e943a1-fc0e-4dd2-b38e-a1d77ed00109@neat.no>
 <2025051253-trimmer-displease-1dde@gregkh>
 <f07db888-8342-491b-86b1-43309a1d2456@neat.no>
 <696f471b-c2d9-4733-9795-0fc31a48e6f8@neat.no>
 <2025051317-deflation-discuss-1201@gregkh>
 <e5cd5e9d64123b319bae1a73c96cd33a3ad9e805.camel@ndufresne.ca>
 <2efb125c-d8ef-468a-a7ea-afcb5b5bee44@neat.no>
 <aCNBNbXceDz2xTCj@pengutronix.de>
Content-Language: en-US
From: Krzysztof Opasiak <krzysztof.opasiak@neat.no>
In-Reply-To: <aCNBNbXceDz2xTCj@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:3df::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P251MB0223:EE_|AS1P251MB0406:EE_
X-MS-Office365-Filtering-Correlation-Id: 292594ac-8384-4757-4d97-08dd921f1154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlA5a0w1Y29MUGdNR3JYUThLRU9pTWg3MmpzbWFveDF0Z2FCQlFwcGdOZEpW?=
 =?utf-8?B?ek9ad0JZTEMydlVlb2dsUVAyUUEvZmlmZXZSd1dtRWI5blA2akdmM2g5b2hx?=
 =?utf-8?B?N0FiejQwOVg3V0NJQXQ5TllHQ0hTa0d5Rm12cUZocUtPNSsvTlpxMFEzVUh3?=
 =?utf-8?B?SzdRZUxtblRsUTRPeVNkMG5nQmJQVHkrMEd1VGlXYy9FRUo2d2FZMTBiYnR1?=
 =?utf-8?B?MmFxazRmMFlCWjVGZ1RDTFBqdjN0QkZ2REpMTHJTT2xDR0tjZG9HQ21Jb3h2?=
 =?utf-8?B?Wlh6UFYrQWhyQi85N3hDc1VwREkxTDFrcVFYY0N2bVlyOFpwQnlJalRiVTVH?=
 =?utf-8?B?dU5ibDFla3hLcmdLdVhUeUpSM3JQUUFSaTRoczJJcHdqK0NLK0VxWm5nWVlG?=
 =?utf-8?B?MjY5VUFqNmh4ZWI3WXR6OFZpcGFINWNqK21lVU9xb0F6eVlka0V5RkxmOE9o?=
 =?utf-8?B?cW5EcTZuNGZiWXhSbVY2SEFabUxUd3VWYjdtYVN1SmpTODJ2K01Kd3NUU2tR?=
 =?utf-8?B?b0krKzZ1Q0llUld3eGFWQzhHUUpmOG5BaUtzZ2ZjTUFqcXYzQWVxdW8rQzBD?=
 =?utf-8?B?eVVSV29GdDR0aGNpUUhXZFpTdzJyRHdqcEZ1bXg4cXFreFY1VXhPcDZpalF3?=
 =?utf-8?B?THRWSExrWTltWThrd0RxY3lHWDRpZzExaXRZUVJsUmhqZk1oYjhiUGFLWUsr?=
 =?utf-8?B?LzRZeXRUbnlCMHJQSTRkZlV4Y1BoeDQxTm14RmY2NWhkU2VJNTU0YjArMzJs?=
 =?utf-8?B?VkhvYTNEcW52ZkpIN293SFdYTm1aeGZtRjVOMUllTTRxNzhlYjFRb2dUdkVS?=
 =?utf-8?B?TnVaaG1QdUMrMjVpWmhtQUhJQUwxQ2RmNXlzaFRwVHRuUlRBWE4yNldQREkz?=
 =?utf-8?B?VFNnVnloc3BGRVlCMmFvczZzbVFtTHM0NmF1ZzZsS0pXc3IvQnNpMWpTUVhr?=
 =?utf-8?B?NFNmMlU4a2p3dGZBcjJEcDBtcDZMYjhvVS9WSm5MR3hEdzVSdUJteXY1Mm9U?=
 =?utf-8?B?Z0VUbWpESVYyY0drZVVDNHUvck5WS1hDK0ZCbGVmajZ2WGY0UzlKMGhTRHZH?=
 =?utf-8?B?WUZHMitVOE1LN1laQ0c1b1hiS1BvTHEvTkVFQ0RVN28yY0Fxckx6aEZtUkZU?=
 =?utf-8?B?ZEhYdDQ3ZFo4eXNRTlY2NjV5TlB0aDhPdG1SQnRUVmtsVHhlWUxPUUp6Rzcx?=
 =?utf-8?B?alBJdmdPUm10TVJ0ek50enBmRnh0QzQ5SDM5QmtSVmNZcWkwYk5wbEZZazJM?=
 =?utf-8?B?a1YwTmpLYUlYUGRMOFA2NXpYZTlSRTluWmltYlZSQWR4NjlsVWh2UHdNVk1t?=
 =?utf-8?B?YkFkdjArN01ZU3BVR2I4QlJwcUxkd1A3eFBSd2RiYU9mbFRaenFvTE11T2sz?=
 =?utf-8?B?MEkvZXFJWWRDTGttY3RVejVTVG1YSlN1NklicGlkTDArMWRsV0kwUTU2NWVj?=
 =?utf-8?B?aW8wUTBRSmdQNmlBMWJmOGFKcUFHditNcjVtRlJsUW1senZLRFJFeDJuRkZ2?=
 =?utf-8?B?T29NS0ZkWlpRUlRpTW05WGxvdGI5NnBZaDBlZ1k5a2p2TkZQSFVhSFlBZ3JM?=
 =?utf-8?B?NmxaS1lDZ1A4ekJsQmpnSGpzRVFDYzhWUXZSMHJ6d1dvVitjcUpTNjhWSXJO?=
 =?utf-8?B?RStWYUc4NkI3ZGNsL25QNG9KYmw1OVhBRnV0Z1YvNWo5OGsyZXR4VlRKYXA4?=
 =?utf-8?B?aTAwZzRjVkRtaC85b0Z5NWZ5VlRWM3JjcjFmcGNISVN5cVVlT3BQMWdXbG1k?=
 =?utf-8?B?Qkt3SlVSQjVZaUZmM1pnT1p1YWNHdU80U2YxcHYyUjBMOEZrRHZ5UWJIaWRY?=
 =?utf-8?B?TmVmLzRVb1NzYUJCVDMvNVNpV3Y0K3lxcHljTThnbkJyV3pBM2sxNnEzUUpD?=
 =?utf-8?B?WWlQK0h2MnRHRjdUSWQ5YldNekdTRldDYXl1dVZRVG1nei9nQzVWdWNDSkdj?=
 =?utf-8?Q?DRB09/jghbc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P251MB0223.EURP251.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3B4MWFKWGxLS3JiWCthYko5OFFzSDIrYUR1V3JlNExhV3BHQzltb0xRTmFG?=
 =?utf-8?B?TTVVbVZTQzFsK0lSK1FETmhONyt4WGtOSzhsY3pmakhNT0hSNnY3TlR5ejA0?=
 =?utf-8?B?ODU5NFozRVVzQWc0am1yT24vemtobW00Q0FRZTErOEVqbUFNTWVvYjFsMUs2?=
 =?utf-8?B?ZW44bmdTTEFRQW9wb1EybmkvSDFVSGUrVE1FVG9qRkZIUWJWNi9BeGliMi8x?=
 =?utf-8?B?K1krMDY4Mkxkci8rTXhpNXNtYUxPeGt5U0VQMCtnblkvVkNMRzhyWGcwWXlx?=
 =?utf-8?B?d1I2b0gzSisxOHFwMmVWNHN0RHRhRitvdmhLYXErajg2d3VmWFZxTWZCaW1G?=
 =?utf-8?B?MXM0ZkFoTjg4MktKMUhJU1RwanZHZlVRMnhvZGQwYlQ1Ylhvbk13cmJFNXNF?=
 =?utf-8?B?Qy9ibjBxL25GYWY2TjV4cGZtSjFpbnowK0M0YndFTmFNRXZuWmZwT3ZBdEwx?=
 =?utf-8?B?azhiRUk4K1YzT0REZkVxWlloVGMycndHc2I3WVlZRHd1QXlRZXF2UTZodmc3?=
 =?utf-8?B?RHM3SkNHeDBGUTBldDV6dThjQ2hLajFzaUZCaEs4M2d3Skg0aFZtZElWY2gv?=
 =?utf-8?B?aGR3YjNNV250TEwxNWNuNlR6SExXTlhoSkJHbElDbVROU3dlbHRoU3FITkpi?=
 =?utf-8?B?MVo0RnRtWWt1eFUvSzNBQWx5aGpOYUpHeGJqZDVzOFJscmUyTXV3OTdacGVC?=
 =?utf-8?B?NFBKWnlIY0g3OVZ4d1gwbk9UQ1paTnpXTkFZOWxrY0tOU0t2eEQzMUMycXVp?=
 =?utf-8?B?S1NMb2Rhd09EUitMTWJHZ3IxSjV6S1YvOHVJRVp0bUJmN3FoZ0pNR3pDS3k1?=
 =?utf-8?B?M1FmczQwYTVxNUdjbDVEQjVCb3pJVWdqTlozZnJRRTBLeS9hRFJPUzk0d25K?=
 =?utf-8?B?d3FTOHQ3SEQxWXJ5UWFqTWExYWZwbTBiaUE1Mk5vaGNOeUlkUjA5V01rMC9S?=
 =?utf-8?B?Zlhtb01zN2RiZDZic1hMclpva2Fha3BtMlV4STJDY3ZQSkI2dXd3ZXB3Lzl0?=
 =?utf-8?B?ZWpWUGhhR1BDblkvRkZwMHEzTjFHcVpWcldUSGNVNFlPQWhPWUJjck9GTG1o?=
 =?utf-8?B?KytwQkd3Q1dVRUVveVgwa1c5T1RkOG1QdVdWTE56ZTNEZkJkYXRLSGpFdVNF?=
 =?utf-8?B?L1VNbmRSSXozTjRKNGx1WUFFN3dxQ2hIdlU4REdiZkFHK1ZOWWJESHZBOHNN?=
 =?utf-8?B?bDVFVkZEQ3VudWRDaGlMa08xdllZbTh6OUdJRm1kL2RLTVVicm9aZVpUdWpo?=
 =?utf-8?B?VmZNNkd2d1lHcFpwVEVjMTFnUXUzUkd2elBIWFg5aUdFMkVMclo1cU9kcGtY?=
 =?utf-8?B?NlJCUW1DK1piRkFZekVtTkxrcU5ZR2NFV1JyUzNLYU04M1cxZWtmYTY4Rkdq?=
 =?utf-8?B?VXBBbEkrRkhDOUU5eGlSbTk2WXdzc21ST2IwUXBEU3dleTlVUXVGQ1l0OC96?=
 =?utf-8?B?aE5tUk92WDlkMHN4bnFPOVNUNkhwbkR2Zkc2cG96aVZKcmc5dnI4SkxTc05Z?=
 =?utf-8?B?bjJCajdkeW05YXZqU1JaTXNIdmZmZGZSVzNiUFpQaVcrMjBweTBjQk5RRVZ5?=
 =?utf-8?B?MHBLZ0FYQlErd0RRaEhNVnh5bWxqNmpaSVZnSFQ5V29TczZWT1U1c2Zud2dz?=
 =?utf-8?B?ZGVnSG0zeTdBOVRUVFhhT1VJb2V3QjV2T05XeFV5RmRxN3U5eVg0eWVaVUhQ?=
 =?utf-8?B?SEhaeXFRRm56YjFqVkx4Wk9iUGgwWUNtR3BaQXRFUG5Cc2wvSTNHVjVBR0pZ?=
 =?utf-8?B?em9yNmNqNGpmUjZlYXkzdm5UMysrOXNDcVpKay81M2dyVkVnYU1kcWc0clk0?=
 =?utf-8?B?K3BkWmRZSy9iRS9KZ1BReG9vR2xYKytlN0dIY2dleTBoazVOU2ExNWlDZnd6?=
 =?utf-8?B?Y1AyQ2dSRWNmREMxeUxOVjBScmZpR3g4ZVQyMmFOam1hMnd4c2N2SWM2N1pX?=
 =?utf-8?B?TUMweHl4VmxzNG1CZXAvZ3lXRGg0eDhGOFJvVnpqTnFoOTdjenZwcVE4Z0hD?=
 =?utf-8?B?UDZLZVFxWkR1c0U4TlFHRnNmaW4wZ05Iam96QWhFTUlsczhpTUw0d3pyM1Fw?=
 =?utf-8?B?K3VqbmZHTGNPODJGUkxhQVRScW05dzd2UmwwMHE1SjRkNlJiZ0tRNDliTXVS?=
 =?utf-8?B?azFKR1NJTnFiZmpoYzQ5dHdqT3lYZmxWQVlqMnd2RTB2c21TcG8wTjBtTC9U?=
 =?utf-8?B?dkE9PQ==?=
X-OriginatorOrg: neat.no
X-MS-Exchange-CrossTenant-Network-Message-Id: 292594ac-8384-4757-4d97-08dd921f1154
X-MS-Exchange-CrossTenant-AuthSource: AM9P251MB0223.EURP251.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 13:07:09.0490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 029c40c7-2844-4bf3-9532-45d5eff8c8f6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6ZnQvXT6mxQbBMiDD+o6K3A0A6LvqypwxIydUeHu0FqQOLHpkNU3L++maA4/HWtZOyAEc03dq4N6VvsBNqf+my+mkTEuVRtwFiJQmRWGN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P251MB0406

On 13.05.2025 14:55, Michael Grzeschik wrote:
> Hi Greg, Krzysztof and Nicolas,
> 
> On Tue, May 13, 2025 at 12:31:49PM +0200, Krzysztof Opasiak wrote:
>> On 13.05.2025 12:04, Nicolas Dufresne wrote:
>>> Hi Greg, Krzysztof,
>>>
>>> Le mardi 13 mai 2025 à 07:04 +0200, Greg KH a écrit :
>>>> On Mon, May 12, 2025 at 11:03:41PM +0200, Krzysztof Opasiak wrote:
>>>>> On 12.05.2025 12:43, Krzysztof Opasiak wrote:
>>>>>> On 12.05.2025 12:38, Greg KH wrote:
>>>>>>> On Mon, May 12, 2025 at 12:19:07PM +0200, Krzysztof Opasiak wrote:
>>>>>>>> Hi Greg,
>>>>>>>>
>>>>>>>> On 4.12.2022 09:29, Greg KH wrote:
>>>>>>>>> On Sat, Dec 03, 2022 at 11:26:14PM +0200, Laurent Pinchart wrote:
>>>>>>>>>> Hi Michael,
>>>>>>>>>>
>>>>>>>>>> On Sat, Sep 10, 2022 at 12:13:31AM +0200, Michael Grzeschik 
>>>>>>>>>> wrote:
>>>>> [...]
>>>>>>>>
>>>>>>>> Given that I'd like to suggest that it seems to actually make 
>>>>>>>> sense to
>>>>>>>> revert this unless there are some ideas how to fix it.
>>>>>>>
>>>>>>> Sorry about this, can you submit a patch series that reverts the
>>>>>>> offending commits?  As it was years ago, I don't exactly know 
>>>>>>> what you
>>>>>>> are referring to anymore.
>>>>>>>
>>>>>>
>>>>>> Sure! Will do.
>>>>>>
>>>>>
>>>>> Would you prefer to have a set of actual reverts related to this:
>>>>>
>>>>> da692963df4e Revert "usb: gadget: uvc: add v4l2 enumeration api calls"
>>>>> bca75df69aaf Revert "usb: gadget: uvc: add v4l2 try_format api call"
>>>>> e56c767a6d3c Revert "usb: gadget: uvc: also use try_format in 
>>>>> set_format"
>>>>> 20f275b86960 Revert "usb: gadget: uvc: fix try format returns on
>>>>> uncompressed formats"
>>>>> 059d98f60c21 Revert "usb: gadget: uvc: Fix ERR_PTR dereference in
>>>>> uvc_v4l2.c"
>>>>> e6fd9b67414c Revert "usb: gadget: webcam: Make g_webcam loadable 
>>>>> again"
>>>>>
>>>>> but have a negative consequence that the series isn't really 
>>>>> bisectable from
>>>>> functional perspective. For example commit e6fd9b67414c breaks 
>>>>> g_uvc until
>>>>> we apply da692963df4e so the series would have to go in as a whole.
>>>>>
>>>>> Or you would prefer a single commit that technically isn't a revert 
>>>>> but it
>>>>> just "undoes" the negative consequences of "usb: gadget: uvc: add v4l2
>>>>> enumeration api calls" (kind of a squash of all commits above)?
>>>>
>>>> Ideally we can bisect at all places in the tree, so it's odd that
>>>> reverting patches would cause problems as when adding them all should
>>>> have been ok for every commit, right?
>>>>
>>>> But if there are merge issues, or other problems, then yes, maybe just
>>>> one big one is needed, your choice.
>>>
>>> Won't a plain revert break userspace like GStreamer that have 
>>> depended on
>>> that patch for years ? In such a delicate case, wouldn't it be less
>>> damageable to introduce workaround, like alias ? This is one personal
>>> script against numerous users of a generic framework implementation.
>>
>> Shouldn't GStreamer be robust enough to handle cases of old-kernel 
>> which haven't had this feature at all?
>>
>> The main reason why I reported this is not really the name limitation 
>> but the fact that this patch is just incorrect for cases where you 
>> would like to expose different formats at different speeds. This 
>> feature was there for years and we do have products that depend on it 
>> and this change along with the further commits that depend on it broke 
>> that support for us.
>>
>> You are absolutely right that those commits added a feature that now 
>> someone else may depend thus it would be perfect to fix it in a way 
>> that doesn't break anyone's userspace but the problem is that due to 
>> the way v4l2 API is designed I really don't see a way how we could 
>> make it "speed-aware" without breaking all the users. That's why we 
>> are kind of stuck between:
>>
>> 1. Leave those commits in and then you cannot different streaming 
>> headers for different speeds but users of those API will keep working.
>>
>> 2. Revert and bring back the feature of UVC ConfigFS interface that 
>> was there since its inception but break the users of "New API".
>>
>>>
>>> I believe due to the delay, you are facing an unusual ABI breakage, 
>>> which
>>> requires a more delicate handling.
>>
>> Agree. The situation isn't simple as whatever we do would break some 
>> userspace... I'm not an expert on v4l2, so if anyone with a better 
>> knowledge of v4l2 internals has a suggestion how we could make this 
>> work with the existing API I'd be more than happy to try to follow 
>> that path.
> 
> As a shortcomming compromise I would suggest to support both worlds by
> conditionally set uvc->header if the directory h was found. If the
> uvc->header was not set then we could print some info and disable the
> main part of the possible uvc callbacks that depend on this uvc->header
> objects.
> 
> The only downside with that would be that using directory h in the
> streaming header will implicitly create the limitations of not
> indipendent formats per speed that Krzysztof mentioned.
> 
> The alternative would be to put more effort into this and parse all
> directories in the streaming header subnode. However since the idea of
> using the v4l2-api is already talked dead by a long discussion history,
> I would rather focus on transition the remaining functionality of the
> gstreamer uvcgadget plugin to finally become independent of the v4l2api.
> 
> How about that transition path?
> 

If I understood you correctly, you are proposing that if the header 
directories are named in a different way than h we would not set the 
uvc->header pointer and make all the v4l2 callback that are using it 
just return -ENOTSUP in this case? It would also mean that the 
uvc_v4l2_set_format() would need to somehow be broad back to the 
previous version which does not use -uvc_v4l2_try_format().

Although seems kind of hacky to change kernel behavior based on the 
directory name I think if we add this to the doc this could be an 
acceptable compromise that would make both scenarios work. 
Alternatively, instead of basing that on the directory name maybe a 
proper, named ConfigFS attribute somewhere inside UVC directory 
"gstreamer_support" or something else would be more explicit for the user?


-- 
Krzysztof Opasiak | R&D Team
neat.

