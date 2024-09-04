Return-Path: <linux-media+bounces-17541-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B8196B59B
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 10:56:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC438B2AABE
	for <lists+linux-media@lfdr.de>; Wed,  4 Sep 2024 08:54:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BB719B3F6;
	Wed,  4 Sep 2024 08:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="GxR12vim"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2122.outbound.protection.outlook.com [40.107.255.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A361917DF;
	Wed,  4 Sep 2024 08:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440045; cv=fail; b=Z1DWbJjPr/Q1CtrqF4gLOUBWTu/++yAjBGxe+/aiUus2VtyGjVFvHSZxYeMzhWEV5DRJlGvq2sTk1o9F/bAjKp6KizVqcSasYDiqjOmrmCalkE+NRSwtnbVYrYTjWhyRuKLSVkcKa+E423fkV9qjyoPSyDuRx68/GgdpZHHCzPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440045; c=relaxed/simple;
	bh=tf8eI5RxCFp/1wzHGm4RsD9YwBwQLzIJzAduTi3za7A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WDirzLxYxuhWgK7xDOukDHf9Kx52xhCW8J62Tn9eRqnCG6v/Y4fhaA6kclz4Bt9URnhT4prM2xqkX9CTKGsDAfHVbFNJdcmNILQKqQ/VLuAlPmk3Q6A7B7gV3cNf9jdnc3A/MqjKYYr7dT5TqdnjJiIug3oSZgpnkrH9uj6pPJY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=GxR12vim; arc=fail smtp.client-ip=40.107.255.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l2zrJtXteqozHZ+39V2yYogGB8uf7vDGJAMw5bWFM2cpsOlRAbNOAkaCvtfFaJ3ZJaEY1DiuUqoePMppsrpRp8z5aCbTuF8L9k5l7718djDEluOKbTK9NJBACQGc+yaCTHyTcVGwsp/Ac3zBBa76EYUndfkrT36pXRD55K6LVYWlX5CWiw421sPvKeh93HqbsWTr8gRm+HNdD0b3Rlbcn1sWgY86IsbO9GhwqbkTzJhUpw02CduvzjPBu+6ta7/Cme+6Yf36aZcx23TYmP6Dr1hAmg7uPAsrvNkUSfpJ8AeuEF20GNQOUa6CprsjP6diIrmK8JPG76EjWjo55AwXPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSRA4rfsJep23VGARYukRcv5YVEnd+aJXyX9l5aJcE4=;
 b=eRw9SMxGbg4ZbFV4ML/iyIgw7Q/2O7aV9qd2agiLD2JHvwkO4zzZ/xFJElSTOU8gruecZlvI2ntyjAGeLyvyZdOHQT+fbkhWAU+i9OPDPXN2v1CDbCaMVk5Lg3zYdP2WhFEXVvZG5w2RejgdNWdOGYX8Di98Q8RELorA7mPeBaUnZMGzR0BVT9Z8SzGvuQKfwyoadNPVsxXcPOCujb10XV8ci6pqVJAnWj7u5/esQZYvDSDrnLIUcA1PqYGkjQgvqL0j7675tNTUcFxAa4xdrQuOWOBiYtulitOftYyUa2CCVzyPIKixStRZx2so5bZz0c5M1HiHxhWX2DedgyHQYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSRA4rfsJep23VGARYukRcv5YVEnd+aJXyX9l5aJcE4=;
 b=GxR12vim+WfCOPlVLbvF+4jyo4fDegt97G94IsKJa1EqKmxc65yU0QSjtsJvTt3P2adFTS7sGu0TuZdQDDHBWYWDm76RbeS/Yob+nc7GSqitb4tuoGWG2sL9SdW7jcG6AAUl7FV+IxdmycKyWlgSRC4ZwqanmbK53VuaZTKXxiqLKhHUj0tLFDWCNgc/NE3OTyoz2okSu9VttdEMIM1+/6tiWVsVmAn2kbPRbNCt2RGnFw7zIF2NXdKwPB16oqmfmqpwG/i7uYJnNwuzyKYLpdMxATkpkX17Q+Sar5lJnlnfTAWpWXnCWWM5Bjw/5YNaFI5Mp335C9pP+iDuHCjS1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by SEYPR03MB7413.apcprd03.prod.outlook.com (2603:1096:101:140::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 08:54:01 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 08:54:01 +0000
Message-ID: <54441e84-b683-4e6c-a169-d8b0e685fb55@amlogic.com>
Date: Wed, 4 Sep 2024 16:53:56 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/9] media: platform: Add c3 mipi csi2 driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kieran.bingham@ideasonboard.com,
 laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com
References: <20240903-c3isp-v1-0-8af0edcc13c8@amlogic.com>
 <20240903-c3isp-v1-2-8af0edcc13c8@amlogic.com>
 <1f226ba2-2324-4c0c-91df-54f42938d9fb@kernel.org>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <1f226ba2-2324-4c0c-91df-54f42938d9fb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|SEYPR03MB7413:EE_
X-MS-Office365-Filtering-Correlation-Id: a8d6c9dd-4da4-4e51-029c-08dcccbf1ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TGVPTWg2bFlHYmRUMWRCdFFlcFhtOWxDbEI5V2Q4SVR2Nk4yZGVOR1hYb3Ft?=
 =?utf-8?B?Q0ExRXpjS0c3ZjRjR1Nwalp4K2czZXh2WWcvZU44NHRSZW9scTN1YVNPYzFr?=
 =?utf-8?B?NkZXUWJTMm95STA1cU5BM2h3WXBWc0U2K3pkZ1RJYnlPbk9BMXV5ajlpc1A3?=
 =?utf-8?B?aVlmYjNSd0xtdG00SDdsYUM4QzVYNk9jQ040UXBIV1k3NEZlOVFsSWQvc2Q5?=
 =?utf-8?B?N0RhaWdPTXVBRm5ZOUptVDNUYUcrYnpDRkRFdjdrUzM0MkFhWU1HYlhtcEZa?=
 =?utf-8?B?b0x2WWIrUVcwclIxU2dxV2kwOWZKbm1mdENzUEozN2hIc1NnM090SE8yQldZ?=
 =?utf-8?B?RzhNYWo3d3R1NzFLN0NwelVndkpPVE9qd054TGRIQTNVMmMyR09DU0tLdnBM?=
 =?utf-8?B?VUZoSE9iMVQ1ZW1VZ2RsSWNsK0p6NDNyTnJZQkZ6Qk85RFErSStBMXdtcncw?=
 =?utf-8?B?a3VUM3VoMHFmRzIzeE5BK2xWVEVCNWg1RU1Nd0pKTWdvODlSYXBTY1NwU0N6?=
 =?utf-8?B?R1N4N2VtSk9Dd2o4T2RMbW90RVN4Q0lmeVY1SUJiWUN2UytGblI5WDc3Z2l1?=
 =?utf-8?B?U2VZRllXbDRHOEQwSUo1QlNYeVBqQkRVWGVNN3hScDJHeFIyQzBzR01zOVli?=
 =?utf-8?B?RWw3amJQWEZIWHBMUzlsbmhKMzQwU3E5a0pYNFNPY29PM1cxR3h5OWdUV01j?=
 =?utf-8?B?RG5CY0ZSdWFrczR3UDVydHZHeVdxNG1UUWJ4a0xXZGlsdnNFR09mM1pUUWdn?=
 =?utf-8?B?d0F5c1dTY2IwMDZqV3AvYUxaRGZhdndESkR2RjhvdUV2VVI3WTRGcWZuWGpO?=
 =?utf-8?B?YXM3cmNmMDFqKzczK3lXaGc5N1NveXErYmZxRGNiTEdGRythTXJYYTRpOUw0?=
 =?utf-8?B?V3ZVOW50ajVrTmVQTGVmNUdMY0Q3UWZHTmFHWUlteTh5bXZvS3ZZcFlGRkVq?=
 =?utf-8?B?TFVtdTBsbExIQm45UGpkaENqNlBlajU4RldRbkg3d0x5UXhxYzkxbUdrSHpz?=
 =?utf-8?B?M3o5UUFReno1WTNsYjJvb01tSlpLc0MzWlpUMjhKQzc0UW02QlkvdGdUamNG?=
 =?utf-8?B?Nm8zVFdsbEkxdVNYNG9oNldEa1RJb1QzWUVYZVc1QjhDVjhSMXZGRVVwRDkz?=
 =?utf-8?B?MWlhV2x0Zm5NQVcySGUzNWFhdTFXck5PL3B6cVhYaVdCVTQyaDQ2a2FJMUpl?=
 =?utf-8?B?SSsvOUVBVVM3dnR0aWVwTGZUeTNER0dTaGVOdytad085NXFMK3lZaW8rZU9i?=
 =?utf-8?B?bDJrUmtheGVsekEweGxrRkV1ckFuby9oTE0rb2VSRUk3VVpCYVdrbTh4cEJm?=
 =?utf-8?B?K2doRUIzUlV4MUZpZ2N6eDhTVGcrL1cyalo0TitYWUJFcUFuM0hTdWxnOXM0?=
 =?utf-8?B?VEdIaEppcWpnSVkvVVlITXEwWitCaFlEb2V3Z3AvRkRjNnFpUW1DbW5TR1B6?=
 =?utf-8?B?bDFJTlpsMU5zVU5aaWR2MmxScjlBREhXb3J3R0Yzc2Q1d0ZvTUh4Ryt0ZlBi?=
 =?utf-8?B?VFl3TGtpYzdqRGJrOEVLN2VLVytRSzZkblJrRUFEM2ZPemZ6UlNyVDBzL2FR?=
 =?utf-8?B?OVgvVmdWQS93bVdtOFBzMGlMbFI0NzlvWDhCRlhCWGIrbHkzK1hlSzBMOHRS?=
 =?utf-8?B?SFhBeU90QzdVSFBkYXA5Vlo2YnpobE94ZHdZdS9KM1hwdWdWYjluMmpPVWlS?=
 =?utf-8?B?aHd5YjhMdlFqOUlESHE5alM1bXFDd3lOa2tiaTUvNVlCVXZlbVFzam5LcEFu?=
 =?utf-8?B?dEszN3VrajJTRDZQeFhGbFdHQkNQZmpSZ2tFTDc5bGlyWUFiM1QyVFBVYVVC?=
 =?utf-8?B?VXllUXBoajA5b0tqNk1DUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTQ2S3RXckJuNWk0REVvZVMvWUZXTTFwaWNpUEpVQ1VSRjRucFE0WDFZSGxM?=
 =?utf-8?B?YnpJNmhKVzhRdExQSzNicGZ5bWpqNERsWTlKYmtmQTgyNnVVaVZSTEdIYWFm?=
 =?utf-8?B?YWFraXAwc1Jqc243ZUxJeHp4UGVsdFU0V05SSEZKY2YrRUcvZlRiWGNOWllU?=
 =?utf-8?B?Q0tkc0tBV2hLTXV4UWh2UVY4MzEybzdjWTU5clJWR2kycDFRNi9qM21oTkth?=
 =?utf-8?B?YzRtNkF4VlF5TVVDTVpKK0g5NVdSbmVDdk03YkVBTnlwNjVNampNbGpUdTM5?=
 =?utf-8?B?RWVuYnVvcm41cVVzaE5ld1p6TVNDNG1VMlNOOVdmSHBwQ0taeEc5YlIwc1Fr?=
 =?utf-8?B?S3p6WjVOeHFPV1NTeXVVb0hETCtnMFpqV1pvdFgvSDlHaklTcFVPd0Yxd2xC?=
 =?utf-8?B?MWxhb3JWTFdKL2FFMEpzLzFjY3JIcXV6dDk1QTVrTnBSa0ZhVStCRFFkN0c0?=
 =?utf-8?B?RXExeDRlVnJwUVlKdmV3RmJyU2JIeUVLY3UzdjdWUDU1WkhHSVF3MWROb3FY?=
 =?utf-8?B?bEdBVmkyQzB5bDk4bGF1eGFEZmhJTUtYenVPNHVWVTZGdEk5TDZ2cjRTVHlH?=
 =?utf-8?B?WkQrTlFMaGtPNW1wM3FkeUlPdHphREpKWXdzQVYxS0xteDJWeXFnYzJIcVpm?=
 =?utf-8?B?U1pvUFR4SkFXbkJMK3h6bytkYlFPZ1BoYS8yUjlZcEQ5UE1ielhKVGJuSVhn?=
 =?utf-8?B?NXkyZTVzdVRhWGhuYTlRN0lBZHBlVWNrQURVWjU0R0Z5bDBEZzNydUhkVm9z?=
 =?utf-8?B?dVpRWUdxdjEwWStZQ0xmWHhreE55TzMrRlk4M3luSUZDMUExV2phTmhEalNC?=
 =?utf-8?B?Zm9QRlQwU0xpSlc5RFMrNGRuTjFESzdJOTd2Q0dPTnNkMmNwRWtBWmhMVU9j?=
 =?utf-8?B?UDFFK2NXN2NNTkU0Z2MydmxqVTQ5YXNaTU5MT2FqaXVZbFFPZEFrVnZyQjUy?=
 =?utf-8?B?S0tReFNsNElCQkEzcTdDcE1jdDNEZlhmKzJPVUxHSFFDMUJhVThzYWw0SW80?=
 =?utf-8?B?SEg0TkxnNis0V0p6eFBLVEdIZ2ZKOU10T2FNRXVOd0NlR0E1VG5mU0ZkQUs1?=
 =?utf-8?B?RUZRenBuT1N1TVZSWldHRVArTDB6UlVYTHdOWjRPSDE4UGZQSnFxcGtoMmtX?=
 =?utf-8?B?NUkxSDlFUVJZNUE1ZFRReW5vWjFZUUJsMWc5RUpmV2ZVRUNqNjZrTkVGeXRX?=
 =?utf-8?B?d2VOdTk2R3grMTJxYklTZWc4LytNdUZNbG5WaEwvU2tkWVhLck9ITUhIWjFD?=
 =?utf-8?B?c3FlWCtqVWtsTDZ3aHF4cXpscUxKTWZXMW1FQ3ltWFE4OHRzWnRVWE5VYkt2?=
 =?utf-8?B?cXRXa28wcE5wWHRHYlM5Rmd5M0FhOE1HWGY0ZkR0THQzblh4aStGRWpIa3kz?=
 =?utf-8?B?anFZTzZMQVo5WTU1OGIyOG1FaGo2dk02NFRnMFgyUGJoN01ZZ2RxUmdqeEND?=
 =?utf-8?B?MnZNU2pydWRrUmVDaVpISnlHUXRyeHJMODRvbHhBTmJwNjdJb256QXRsdG9N?=
 =?utf-8?B?WEJ3em9RY1FNTW1pYlhzUE5HMDVRczJqK1N5aDdBWW4wT0thTDJ6VHp0K2xK?=
 =?utf-8?B?ZVBlZnB3QnFKVUlndHBlWFFIRmNMWkJjQmJVSEY4dTVyQlc0SlZuK1pWVTBV?=
 =?utf-8?B?K04rc0QrcHlTTkdBVVhwTFJrTC81bUFVUElqWG00cktpUEZHTzlLVm1BeDd6?=
 =?utf-8?B?bVRvcit2d1dpR0xmNTM2YjFEbE94M2ZDazVuRk85SmdjNkZVVERYUVI2Z1Vz?=
 =?utf-8?B?bmh0OU12cHJBeVY4QnBNNFhpclJEdHFEWFJES0VIQ21HYXVMbW1nVVFibnhw?=
 =?utf-8?B?Yzh5OWhoTDh0QzRnQXJMZkppZkZPSDNhM3hmWUk4a0VoOFFZdEZ4Qi8yT0l0?=
 =?utf-8?B?RW9RS3BEUTk3eWNXeUpwSHB2b2Q4QlBPUEhBeVUzM2RVdDFYOElmbm9KU1lw?=
 =?utf-8?B?R3NST0h2MjIzVVVaUVlUMW9uL3NHQmJ1YVgvMDhaZHpZT09SS0dRQWwvS2o5?=
 =?utf-8?B?S3dteVJkaSszelFUTDNYTkR5YU9uT2FCSVBSTEFTdnJocEFXdGxUTm93clUr?=
 =?utf-8?B?RXVka2krSjlycFZZMmVIMk5VWU55dTFsTkQ3MWNucjNZY3BTVFJxM0tSa0hp?=
 =?utf-8?Q?6kfdt9B8/J4T2B45/CRdKTK+5?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8d6c9dd-4da4-4e51-029c-08dcccbf1ef8
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 08:54:01.1272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/owd5P+dSxtk4wzI7Qusbn9CDrnrd9MFvJGUoqzzCgYfZbP4RiPWQkLlhhBzNpLipdQwS/EZ3CdKoWrVelYQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7413

Hi Krzysztof,

        Thanks for your reply.

On 2024/9/3 22:10, Krzysztof Kozlowski wrote:
> [You don't often get email from krzk@kernel.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> On 03/09/2024 08:57, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> This driver is used to receive mipi data from image sensor.
>>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>
> ...
>
>> +static int c3_mipi_csi_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct csi_device *csi;
>> +     int ret;
>> +
>> +     csi = devm_kzalloc(dev, sizeof(*csi), GFP_KERNEL);
>> +     if (!csi)
>> +             return -ENOMEM;
>> +
>> +     csi->info = of_device_get_match_data(dev);
>> +     csi->dev = dev;
>> +
>> +     ret = c3_mipi_csi_ioremap_resource(csi);
>> +     if (ret) {
>> +             dev_err(dev, "Failed to ioremap resource: %d\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     ret = c3_mipi_csi_configure_clocks(csi);
>> +     if (ret) {
>> +             dev_err(dev, "Failed to configure clocks: %d\n", ret);
>> +             return ret;
> Syntax is return dev_err_probe. This was repeated multiple times, so
> please organize some inside-Amlogic sessions so you will learn from
> somebody's mistakes/reviews. That's way other developers do not repeat
> the same issue.

Will use dev_err_probe.

I will report this issue to my manager and learn from experiences of others.

>
> Best regards,
> Krzysztof
>

