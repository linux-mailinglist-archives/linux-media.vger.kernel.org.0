Return-Path: <linux-media+bounces-25668-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6752DA28429
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 07:14:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA38016520F
	for <lists+linux-media@lfdr.de>; Wed,  5 Feb 2025 06:14:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCAB228394;
	Wed,  5 Feb 2025 06:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="YxdOHi9/"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2114.outbound.protection.outlook.com [40.107.215.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705CF227BA2;
	Wed,  5 Feb 2025 06:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738736065; cv=fail; b=XOk8AzBGdjw+0tMElBhm86KYGL2Q6X9AGDbpIJXYWqGjvIZFP8nBFjjzcDIyzDVzzMwSwSiUHjFhMiq0899rYaoWd1umZuuPErE5kA1SjvZc7Rz3uJX22rOZnyT21eLi5FwGJIy8rzw3WwKvJo+NI84JZyTOJEYiBkHps3V4cc0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738736065; c=relaxed/simple;
	bh=xAFfKCfaH3/AA1/RLf51M20n5bEfLuNGOzJcnNDtqVY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GgTZC0HXAYgy+Fd3FkXH/Y2gaJwMshzXdrxWi0D6+CX7YtHnRAruc7lOsDnWzZ8N5N1KAX0T6fqdMPRQk/G2E6P07fxT7ksyEgs0+EWaQfet4bF3yJfdPXhdCTSoQ63CSxb/E6eDMmNqmXAyJL8ZVFzcUBRxHWfPdyrf7tYLMA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=YxdOHi9/; arc=fail smtp.client-ip=40.107.215.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9tLeTIeAdWI7DnsVfghAUcuEI28K/ECqaYAyMAhkEXEjY7FZAPVCvqIlV82t098m9jM7SyZuIIaCf+2gtmj39JQ/GRWoe5V47297lqGofk8xEuDraOohx4KKh5t0fBMZxXj6xUUtb3LDuZaovbIMLq4MnV/DEbrjhPO1ntruNlryJNfwPvANxbn47FjYLi+hfCCVvIxs3wKbSibA2m7Ii5kqgLJTfZA9SrnJzyaLJOkV46LXP0W4K+oVSTcpjoW2VAI6C5ECUnmfM0yjb63c5YpTamsWoJYijWPNea2RTE87tFuQCur4RGD6Dg/UkHjy93+NdmXYjQ0Y0XkM5TyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4pMHOvjl0/b8M2wHud3NaGvI7skVMQuHKo4kvGvR9aA=;
 b=hoMUEeUe0uQ/Dpo1sE8t9O+xwAaDaYqGBsufqMAlM8wJ0R+410dIkUDqMGE0GKD/ErNQCKnOCR9p367ssWnm/tYWBzZcCf/SVObzWQsBB6/gXzOA57UCcjcoRF4BMV3j3ikgvbTK5DQ9Szv/y05oTTyJgjyBC4xusSMgCgtKEHjJDDN03iUteFWIhDTNzfMiUWJfQPssxVbPddfCy71ONa54M2WCqUV7nhfZ/2LOsf7uFFwHMN4Sa/W92E+0aZim+VFdeqFPEkGldNxPfVCi5OD077zcT7roKd6BZ2UCQqEGbZacqIbBGMbeKWjZtMQRpzndo23IFmGKLSPs2FuBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4pMHOvjl0/b8M2wHud3NaGvI7skVMQuHKo4kvGvR9aA=;
 b=YxdOHi9/PynD1Y2uKdQsAmmvbOb5NLzHWlH06VVqKDDLSDyFX52gQ7m3JUpdgpYzD+uLLoaMIrQXPNMiKdTLLqtixbohrnzD9ssC0afnAzLTCL37AdGTkG4d8XmEX8Y8IrgUUu+ctOKf3D2MB0Pzn9aJS24Pr1SpIXF2rR7KWTb4XIlEektZpwxskWQrRrzWS/ot+bv2gMK0OO8ow09ho9eFOjTzt1A7DhcG9I1NSGMzC6lRd28h0I1oXoiznL5iD6S2A1Rm0N3wqVF3C5u6Mxn8lSbUWL0Q03LJjwq/xINJGREsD3Mvglm2zsjy/W5EeSscZ4bePj0Wmccnp+V9qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com (2603:1096:405:8a::9)
 by TYZPR03MB7721.apcprd03.prod.outlook.com (2603:1096:400:41f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Wed, 5 Feb
 2025 06:14:17 +0000
Received: from TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f]) by TYSPR03MB8627.apcprd03.prod.outlook.com
 ([fe80::cf16:aa54:9bd5:26f%4]) with mapi id 15.20.8398.021; Wed, 5 Feb 2025
 06:14:17 +0000
Message-ID: <2e3ca902-96d6-4055-b336-ef68e0dd6c75@amlogic.com>
Date: Wed, 5 Feb 2025 14:14:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] media: uapi: Add stats info and parameters
 buffer for c3 ISP
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 dan.scally@ideasonboard.com
References: <20241227-c3isp-v5-0-c7124e762ff6@amlogic.com>
 <20241227-c3isp-v5-7-c7124e762ff6@amlogic.com>
 <ggib75alvqgdhdoe5qgkxxtsyz2uljhydsl2itd7lygijqvk2v@zikpjwqox6eq>
Content-Language: en-US
From: Keke Li <keke.li@amlogic.com>
In-Reply-To: <ggib75alvqgdhdoe5qgkxxtsyz2uljhydsl2itd7lygijqvk2v@zikpjwqox6eq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To TYSPR03MB8627.apcprd03.prod.outlook.com
 (2603:1096:405:8a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR03MB8627:EE_|TYZPR03MB7721:EE_
X-MS-Office365-Filtering-Correlation-Id: 0894da5b-7077-4fbc-5767-08dd45ac522b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGliVUsvOGdjMVZHNkl1QnBRYTJ2Q0F3N3dSK3hzdG9NSU1XL3BNRXoya2ZV?=
 =?utf-8?B?YXdublVTcHp2eEpoWEVFb2ZwdzRQUUp0bWQ5bGtET1psUjNpYllZZy81MDU5?=
 =?utf-8?B?OHRoNHNJYlZUUENEV2tHdHVoZEhxbjVRQWVub2Mzei9yT0krQTJTK0F4L0Jt?=
 =?utf-8?B?V05kejBQdnNDSkszZFNtclZkbkc2U0tRU0QxbDZyVnlPcnpVMmc3UDk3Z1M3?=
 =?utf-8?B?RUozSkFMRkpDUXI2S3hKVHdncjl0eUs5VjBCeUt5SDVpWGZ0N3NuNGxZNEVm?=
 =?utf-8?B?aWh5N0VTZVMzR1IzRVR3ODJ0Yll3TDJSK2x2aDdVdnBubExibUV0bXVUQ3lE?=
 =?utf-8?B?U1RMbkgzUWxkamY3RGNNMExDOVdiUEFiTkFoNnhONGY0ZWNVaE5qTklDeVFs?=
 =?utf-8?B?Rzd6ak5kMStYaU1hRFNsS0N5Y05sNmJFMW15bU5pR2RqdGpmbEJZbElBb3Z1?=
 =?utf-8?B?UTAvZGFmQUxLOXlvTDBSem1SdTc0N3A3YjBjTlgzOFAvSnBxWU1ORFJpb0hV?=
 =?utf-8?B?TDdvakJuZ1I2blFyUWJHQWtiRFVTUERqd3RxMlRORDd6SjFFc2JyTmlSVHJz?=
 =?utf-8?B?VWtYYVVVbU9xUEVpWnk1dzh2R0gzMUs0T0pPYmh5cHRwRWtSZTBoMnFRRDRS?=
 =?utf-8?B?Rk9GTHZ2dmFtOHIwQkRSU3hVQ2hVQTVIMWdYams3M0RzMEtsRlRmaW4xenpy?=
 =?utf-8?B?SmZueHVheDFSRTJxcmkwcUpDc3g0WmFqTVpkcWdyaEN5b3RQOGtLMGFZSjZl?=
 =?utf-8?B?bU9VQlJxZmUwUHBFelpzVk9XcGx2YTI4NVN5NjM5dUN4S29MN1IzZzY2MkpB?=
 =?utf-8?B?WFo2c1I3UXEzMG5tMUNrVkZRSlNmV0F5aklXdzF6UTBzQU1YSEwyVC9YNmtr?=
 =?utf-8?B?NWUwSm5vRTdncGpDOE96OUNFZTNvWWwvbWp5NjRwSlRIeTBQL1ZNTVYwVzJl?=
 =?utf-8?B?TjNuN2ptV3c1TkltN2hORHVFRldscHZtd1l4K3hJaU1pbFpNZm1vZDhjdzhv?=
 =?utf-8?B?MEZ0QXl6anpURFlZK1B4QWJlWjlKdHNiNVRFNm95Y3ltNGcyaS9uSlZwUjlo?=
 =?utf-8?B?VmJMZTdJdXB3aktyeFdyaU4rTUZGYmxHK3NLMnh2cnF3Q3Bobko3Tm5tbGxP?=
 =?utf-8?B?OVNvYmtIK0RDbXF1NXVhUEcwWllIK1lDdEM5SHVES2FIRW5PUnBqZHJFTlN1?=
 =?utf-8?B?Q09CTDJSN2Ribmc3Tk1kU2tOUDNESGJ4S2d2QkFONFFJaEkvOTcyOXVzK1pY?=
 =?utf-8?B?TUFuZ2NQNHNjaU5kYW8yK3JpS2VnYmFBYk11L1ZaS21ZRHpNR0kvUXM5RE5Q?=
 =?utf-8?B?ODBVMUM3VnFlNXlISlJJSCtvRlpkSlp4NHpTTGsxYlMyVHVWRWdBYzhnTnFC?=
 =?utf-8?B?Zi9LSTUzdW1PY1lwWjRSc0ZnTnFiRko5UUF2QjgyUEFRb2hPL2Z0cklPNTVK?=
 =?utf-8?B?WjI0TDkvQWVRU1k1aWw5NE9GeHNLOUxUaFRJbXRSZHFlRlBsYWhuUGh6SlUv?=
 =?utf-8?B?TUsyelhnMW9YMmV6c1phVjRvSXN6RXJvRGtvYWt2TktKcnZ6ZTJqdWdvcTVm?=
 =?utf-8?B?S3dxK2U2Tm9VbE5nL3VxYmpTbkVpeThvb200YzJ3NlRLK050TUZMd2dPdVF4?=
 =?utf-8?B?RHoyWGp6bnBLOFMrUC9DbXZDUVg0dUZaOS9SeGx0bmhBZjhXalg3dVp0blkz?=
 =?utf-8?B?aTNHd29RTTl6UEdYTmtPRHlycWp3MkMxMkhmYUNNQ1Q0Q1ROcHRYc2VzODdy?=
 =?utf-8?B?R2NiWldRaE94Sklua2lMV010NmEzcWVLKzRnSTFRWWc4WGdyN25nSS85MUp1?=
 =?utf-8?B?V1hzbnd5UmhpeUJFcFJGdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR03MB8627.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmVpMkU0eGF2diszUFNwVkt3bXBId3krNGhEbTh6WXh6N1JSdDU1SEVmbndV?=
 =?utf-8?B?YXlRN3p6UTBQVS9XQ3c3cjlNTUVTZWgwbmJmNExwNnNlRWNEMUlWM3l0MmIv?=
 =?utf-8?B?WEQ0UmtneVZhTlFKQXk3ZEJWd0laa09VV2hHbFFsWnp4L1ZTYW1mcjY0amcr?=
 =?utf-8?B?RTRsajdvUVFiNEdGOGJITHZPK2lXS2NmNzR2Vi80Sk1DN2pvdjZoK2lzbk5x?=
 =?utf-8?B?dmhNY240OG16cGtpY2dUQVAybjN5SjlrNkNFTHhXQ0V4NW52a2E5RDkwc0Jm?=
 =?utf-8?B?c2VVeC9sSG5aM2JlN3pObWthbXZKZmgwSXVxZGRUa2tlazY3cXgycnRFeTNj?=
 =?utf-8?B?S0oyem54SGVUMUJNcld0Unk5THNzTklLSXVsQlByZVlQTW1kM2VBczAzMjJU?=
 =?utf-8?B?NWNUWE9JYkQ0a0tpaTdsZkUzWTdMQjFNSHFrK1NaaXVhZHpDYWtaNzZHYlB3?=
 =?utf-8?B?Q0JIWng3UlFvUDJiWUFJYk9CejNDWGhmNEppL1YrK1N3ai9UTjJ3bW1Md04z?=
 =?utf-8?B?Zm0wbzQxOGd6RGtKakYra084YUc3b2RJSFpiWXoxTDVYcDVLdG5ta0ZKVDhi?=
 =?utf-8?B?OUlGZEtJSFhMSFdpS20xd0dGaGNScVFrd1RoSWlnQzQ4RzhKcW5nS0pkeHZQ?=
 =?utf-8?B?NjNiTmRQa1hscFNpNS9iUFBvL1JyNWxncHhxMGY2N0N6VFVWMXUrTG4wemlN?=
 =?utf-8?B?TXJ2R0RZbm55eStGQUJ0eTNicXJxdUYvMmFROFB2NnlXdW1OZUZsZ3B6UW5H?=
 =?utf-8?B?TStIQW1XaUwvbVprMVZIVjloMGtNS3JoMmt6S3dxZGpKVFUzd0dWa0JXK2Z4?=
 =?utf-8?B?eEVHcm51TDR4aWJxSEcwUWpONFNqMzAwK1NRa21WQmxjeDJJR1FaZ1RNY3RV?=
 =?utf-8?B?OXVJN25SVTRJcHF2RkdDMnlEeVhOZERpdVYzeSsyOW1zT1Bqa0ZuQjEzaVRS?=
 =?utf-8?B?N01adFFuMUtjdGt0THdkUGxJZVFGZXgyNHZtVFZ3akt5UVNLa1pxMnZuVkc0?=
 =?utf-8?B?dHIwdk1DUGhFR1ZNS3lCeHVJOVY1T3FBdTFvWURJRkUxQXNyZ1JVZ0hjZzkx?=
 =?utf-8?B?SFlBMEx1MllsZXNaa24wZkpldnR5T2d6a1EvUStaMnduRWJSaHFqQUJIQmpY?=
 =?utf-8?B?T0N5bHV4UDNJbHB5T3d6bnpYRXFwRFFSSUl0VXRQMEFiV3VOR3loVUxTYS9u?=
 =?utf-8?B?WktXNjFoTVppTFNiLy8vSzMwZWtkdU1oUXBYLzhkRXBuQy9Uakd2NjM5c0Ry?=
 =?utf-8?B?MzU3K0hDNkVCZkpmM1F1d3FGMCtzbFZma2toRmUwd2ZnWGp3Ujc3a0pGSWov?=
 =?utf-8?B?UkRtTjY5QVJSWk1NV3lOaGkrU0ZBNWVUSysyVHhUcUxZV1JLTE9MTjZRTEJE?=
 =?utf-8?B?ckxBNGNuVXlPZXFXS1hLbzdaSEhlLy9XUWlSSkE5MlRKM3RVV2dsYTJuQk43?=
 =?utf-8?B?UzJaQzI4WWZIZWIxdFF6bFRINjBZNXptTHdQSWIxVzJ6MUNHSmxHbndHbnQx?=
 =?utf-8?B?VGgxdE9yLytmdURPUElBcDl1SEdleUREbUw2U3liQzhvdTI1K3E1YWo0RDYx?=
 =?utf-8?B?Z2VPK3IwTVJFUE1XQ0c0bnJ6d2hPVGNPM3JlN1ZLUlk0dHNGd1hXVXY4M1Yr?=
 =?utf-8?B?eUZhVmlwclZmRHErOGltVzA4U1pPVHZYRWZoeGplV09GUCt2YURvQkVqcXZ6?=
 =?utf-8?B?aHpyeVdpSncwNVV6cjNPZG9VWDVHSWpHVXBkWkZFSVFKRWpUTjRuM01hUUtV?=
 =?utf-8?B?WC9TRnpLMVhlbkxhQWxDeDcxOFVaSCt6Z2FQTjYxYzRmRy9DQkFZREl2K2Mz?=
 =?utf-8?B?SitzN3diZE5VejhLVzAwNTY0RzlKK3NVTHR6SXZkSjlXbUxVSTlxY2VieEFV?=
 =?utf-8?B?cjBETDF3YXo1N01mZHUwamF4cC9JWitlbzQwb0N4K2xqK0tSTHI5MGR4Wmdy?=
 =?utf-8?B?Z3JOb09FWHZZOSs1bTZLaC8xbWZXZHdTc3lrZEdwUXVTY0haZTRJMXdGdDJk?=
 =?utf-8?B?UUpteWxpZnl0aG9aVVRyUTh5VzRad1N2UlVFTFFxWThxUVdwN1FxN3N5Nk54?=
 =?utf-8?B?Z0ZsdE1yZ3ZEYTcweWZPSURuSGc5YWVVTURUL2RaMEdTdWdwR21EOWJxdmI2?=
 =?utf-8?Q?sxauORkFxrwpbyKAwFnV9831L?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0894da5b-7077-4fbc-5767-08dd45ac522b
X-MS-Exchange-CrossTenant-AuthSource: TYSPR03MB8627.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 06:14:17.3884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: POfzd2xtMpfJ27TU5iVpnTaEuj93nKkr2Qe+QGIBcUnZPC4HphFeEJZ9pG58oPKjuQ3cTZdotoeMr34fQzTLig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7721

Hi Jacopo

Thanks very much for your reply.

On 2025/1/23 17:57, Jacopo Mondi wrote:
> [ EXTERNAL EMAIL ]
>
> Hi Keke
>
> On Fri, Dec 27, 2024 at 03:09:16PM +0800, Keke Li via B4 Relay wrote:
>> From: Keke Li <keke.li@amlogic.com>
>>
>> Add a header that describes the 3A statistics buffer and the
>> parameters buffer for c3 ISP
> pahole is now happy and doesn't report holes or padding bytes.
> There are a few issues with documentation which are reported here
> https://gitlab.freedesktop.org/linux-media/users/jmondi/-/jobs/69823163/raw
>
> ./include/uapi/linux/media/amlogic/c3-isp-config.h:272: warning: expecting prototype for enum c3_isp_params_awb_tap_points. Prototype was for enum c3_isp_params_awb_tap_point instead
> ./include/uapi/linux/media/amlogic/c3-isp-config.h:328: warning: expecting prototype for enum c3_isp_params_ae_tap_points. Prototype was for enum c3_isp_params_ae_tap_point instead
> ./include/uapi/linux/media/amlogic/c3-isp-config.h:367: warning: expecting prototype for enum c3_isp_params_af_tap_points. Prototype was for enum c3_isp_params_af_tap_point instead
>
> and possibily more.


Will check this issue.

> With the above fixed (you should be able to check them by yourself by
> building the documentation)
OK, will check them.
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
>
> Thanks
>    j
>
>> Signed-off-by: Keke Li <keke.li@amlogic.com>
>> ---
>>   MAINTAINERS                                      |   1 +
>>   include/uapi/linux/media/amlogic/c3-isp-config.h | 564 +++++++++++++++++++++++
>>   2 files changed, 565 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index bdf8b24c773f..274f72c31d9a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1248,6 +1248,7 @@ M:      Keke Li <keke.li@amlogic.com>
>>   L:   linux-media@vger.kernel.org
>>   S:   Maintained
>>   F:   Documentation/devicetree/bindings/media/amlogic,c3-isp.yaml
>> +F:   include/uapi/linux/media/amlogic/
>>
>>   AMLOGIC MIPI ADAPTER DRIVER
>>   M:   Keke Li <keke.li@amlogic.com>
>> diff --git a/include/uapi/linux/media/amlogic/c3-isp-config.h b/include/uapi/linux/media/amlogic/c3-isp-config.h
>> new file mode 100644
>> index 000000000000..ee673ed022c0
>> --- /dev/null
>> +++ b/include/uapi/linux/media/amlogic/c3-isp-config.h
>> @@ -0,0 +1,564 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>> +/*
>> + * Copyright (C) 2024 Amlogic, Inc. All rights reserved
>> + */
>> +
>> +#ifndef _UAPI_C3_ISP_CONFIG_H_
>> +#define _UAPI_C3_ISP_CONFIG_H_
>> +
>> +#include <linux/types.h>
>> +
>> +/*
>> + * Frames are split into zones of almost equal width and height - a zone is a
>> + * rectangular tile of a frame. The metering blocks within the ISP collect
>> + * aggregated statistics per zone.
>> + */
>> +#define C3_ISP_AE_MAX_ZONES (17 * 15)
>> +#define C3_ISP_AF_MAX_ZONES (17 * 15)
>> +#define C3_ISP_AWB_MAX_ZONES (32 * 24)
>> +
>> +/* The maximum number of point on the diagonal of the frame for statistics */
>> +#define C3_ISP_AE_MAX_PT_NUM 18
>> +#define C3_ISP_AF_MAX_PT_NUM 18
>> +#define C3_ISP_AWB_MAX_PT_NUM 33
>> +
>> +/**
>> + * struct c3_isp_awb_zone_stats - AWB statistics of a zone
>> + *
>> + * AWB zone stats is aligned with 8 bytes
>> + *
>> + * @rg: the ratio of R / G in a zone
>> + * @bg: the ratio of B / G in a zone
>> + * @pixel_sum: the total number of pixels used in a zone
>> + */
>> +struct c3_isp_awb_zone_stats {
>> +     __u16 rg;
>> +     __u16 bg;
>> +     __u32 pixel_sum;
>> +};
>> +
>> +/**
>> + * struct c3_isp_awb_stats - Auto white balance statistics information.
>> + *
>> + * AWB statistical information of all zones.
>> + *
>> + * @stats: array of auto white balance statistics
>> + */
>> +struct c3_isp_awb_stats {
>> +     struct c3_isp_awb_zone_stats stats[C3_ISP_AWB_MAX_ZONES];
>> +} __attribute__((aligned(16)));
>> +
>> +/**
>> + * struct c3_isp_ae_zone_stats - AE statistics of a zone
>> + *
>> + * AE zone stats is aligned with 8 bytes.
>> + * This is a 5-bin histogram and the total sum is normalized to 0xffff.
>> + * So hist2 = 0xffff - (hist0 + hist1 + hist3 + hist4)
>> + *
>> + * @hist0: the global normalized pixel count for bin 0
>> + * @hist1: the global normalized pixel count for bin 1
>> + * @hist3: the global normalized pixel count for bin 3
>> + * @hist4: the global normalized pixel count for bin 4
>> + */
>> +struct c3_isp_ae_zone_stats {
>> +     __u16 hist0;
>> +     __u16 hist1;
>> +     __u16 hist3;
>> +     __u16 hist4;
>> +};
>> +
>> +/**
>> + * struct c3_isp_ae_stats - Exposure statistics information
>> + *
>> + * AE statistical information consists of all blocks information and a 1024-bin
>> + * histogram.
>> + *
>> + * @stats: array of auto exposure block statistics
>> + * @reserved: undefined buffer space
>> + * @hist: a 1024-bin histogram for the entire image
>> + */
>> +struct c3_isp_ae_stats {
>> +     struct c3_isp_ae_zone_stats stats[C3_ISP_AE_MAX_ZONES];
>> +     __u32 reserved[2];
>> +     __u32 hist[1024];
>> +} __attribute__((aligned(16)));
>> +
>> +/**
>> + * struct c3_isp_af_zone_stats - AF statistics of a zone
>> + *
>> + * AF zone stats is aligned with 8 bytes.
>> + * The zonal accumulated contrast metrics are stored in floating point format
>> + * with 16 bits mantissa and 5 or 6 bits exponent. Apart from contrast metrics
>> + * we accumulate squared image and quartic image data over the zone.
>> + *
>> + * @i2_mat: the mantissa of zonal squared image pixel sum
>> + * @i4_mat: the mantissa of zonal quartic image pixel sum
>> + * @e4_mat: the mantissa of zonal multi-directional quartic edge sum
>> + * @e4_exp: the exponent of zonal multi-directional quartic edge sum
>> + * @i2_exp: the exponent of zonal squared image pixel sum
>> + * @i4_exp: the exponent of zonal quartic image pixel sum
>> + */
>> +struct c3_isp_af_zone_stats {
>> +     __u16 i2_mat;
>> +     __u16 i4_mat;
>> +     __u16 e4_mat;
>> +     __u16 e4_exp : 5;
>> +     __u16 i2_exp : 5;
>> +     __u16 i4_exp : 6;
>> +};
>> +
>> +/**
>> + * struct c3_isp_af_stats - Auto Focus statistics information
>> + *
>> + * AF statistical information of each zone
>> + *
>> + * @stats: array of auto focus block statistics
>> + * @reserved: undefined buffer space
>> + */
>> +struct c3_isp_af_stats {
>> +     struct c3_isp_af_zone_stats stats[C3_ISP_AF_MAX_ZONES];
>> +     __u32 reserved[2];
>> +} __attribute__((aligned(16)));
>> +
>> +/**
>> + * struct c3_isp_stats_info - V4L2_META_FMT_C3ISP_STATS
>> + *
>> + * Contains ISP statistics
>> + *
>> + * @awb: auto white balance stats
>> + * @ae: auto exposure stats
>> + * @af: auto focus stats
>> + */
>> +struct c3_isp_stats_info {
>> +     struct c3_isp_awb_stats awb;
>> +     struct c3_isp_ae_stats ae;
>> +     struct c3_isp_af_stats af;
>> +};
>> +
>> +/**
>> + * enum c3_isp_params_buffer_version -  C3 ISP parameters block versioning
>> + *
>> + * @C3_ISP_PARAMS_BUFFER_V0: First version of C3 ISP parameters block
>> + */
>> +enum c3_isp_params_buffer_version {
>> +     C3_ISP_PARAMS_BUFFER_V0,
>> +};
>> +
>> +/**
>> + * enum c3_isp_params_block_type - Enumeration of C3 ISP parameter blocks
>> + *
>> + * Each block configures a specific processing block of the C3 ISP.
>> + * The block type allows the driver to correctly interpret the parameters block
>> + * data.
>> + *
>> + * @C3_ISP_PARAMS_BLOCK_AWB_GAINS: White balance gains
>> + * @C3_ISP_PARAMS_BLOCK_AWB_CONFIG: AWB statistic format configuration for all
>> + *                                  blocks that control how stats are generated
>> + * @C3_ISP_PARAMS_BLOCK_AE_CONFIG: AE statistic format configuration for all
>> + *                                 blocks that control how stats are generated
>> + * @C3_ISP_PARAMS_BLOCK_AF_CONFIG: AF statistic format configuration for all
>> + *                                 blocks that control how stats are generated
>> + * @C3_ISP_PARAMS_BLOCK_PST_GAMMA: post gamma parameters
>> + * @C3_ISP_PARAMS_BLOCK_CCM: Color correction matrix parameters
>> + * @C3_ISP_PARAMS_BLOCK_CSC: Color space conversion parameters
>> + * @C3_ISP_PARAMS_BLOCK_BLC: Black level correction parameters
>> + * @C3_ISP_PARAMS_BLOCK_SENTINEL: First non-valid block index
>> + */
>> +enum c3_isp_params_block_type {
>> +     C3_ISP_PARAMS_BLOCK_AWB_GAINS,
>> +     C3_ISP_PARAMS_BLOCK_AWB_CONFIG,
>> +     C3_ISP_PARAMS_BLOCK_AE_CONFIG,
>> +     C3_ISP_PARAMS_BLOCK_AF_CONFIG,
>> +     C3_ISP_PARAMS_BLOCK_PST_GAMMA,
>> +     C3_ISP_PARAMS_BLOCK_CCM,
>> +     C3_ISP_PARAMS_BLOCK_CSC,
>> +     C3_ISP_PARAMS_BLOCK_BLC,
>> +     C3_ISP_PARAMS_BLOCK_SENTINEL
>> +};
>> +
>> +#define C3_ISP_PARAMS_BLOCK_FL_DISABLE (1U << 0)
>> +#define C3_ISP_PARAMS_BLOCK_FL_ENABLE (1U << 1)
>> +
>> +/**
>> + * struct c3_isp_params_block_header - C3 ISP parameter block header
>> + *
>> + * This structure represents the common part of all the ISP configuration
>> + * blocks. Each parameters block shall embed an instance of this structure type
>> + * as its first member, followed by the block-specific configuration data. The
>> + * driver inspects this common header to discern the block type and its size and
>> + * properly handle the block content by casting it to the correct block-specific
>> + * type.
>> + *
>> + * The @type field is one of the values enumerated by
>> + * :c:type:`c3_isp_params_block_type` and specifies how the data should be
>> + * interpreted by the driver. The @size field specifies the size of the
>> + * parameters block and is used by the driver for validation purposes. The
>> + * @flags field is a bitmask of per-block flags C3_ISP_PARAMS_FL*.
>> + *
>> + * When userspace wants to disable an ISP block the
>> + * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit should be set in the @flags field. In
>> + * this case userspace may optionally omit the remainder of the configuration
>> + * block, which will be ignored by the driver.
>> + *
>> + * When a new configuration of an ISP block needs to be applied userspace
>> + * shall fully populate the ISP block and omit setting the
>> + * C3_ISP_PARAMS_BLOCK_FL_DISABLED bit in the @flags field.
>> + *
>> + * Userspace is responsible for correctly populating the parameters block header
>> + * fields (@type, @flags and @size) and the block-specific parameters.
>> + *
>> + * For example:
>> + *
>> + * .. code-block:: c
>> + *
>> + *   void populate_pst_gamma(struct c3_isp_params_block_header *block) {
>> + *           struct c3_isp_params_pst_gamma *gamma =
>> + *                   (struct c3_isp_params_pst_gamma *)block;
>> + *
>> + *           gamma->header.type = C3_ISP_PARAMS_BLOCK_PST_GAMMA;
>> + *           gamma->header.flags = C3_ISP_PARAMS_BLOCK_FL_ENABLE;
>> + *           gamma->header.size = sizeof(*gamma);
>> + *
>> + *           for (unsigned int i = 0; i < 129; i++)
>> + *                   gamma->pst_gamma_lut[i] = i;
>> + *   }
>> + *
>> + * @type: The parameters block type from :c:type:`c3_isp_params_block_type`
>> + * @flags: A bitmask of block flags
>> + * @size: Size (in bytes) of the parameters block, including this header
>> + */
>> +struct c3_isp_params_block_header {
>> +     __u16 type;
>> +     __u16 flags;
>> +     __u32 size;
>> +};
>> +
>> +/**
>> + * struct c3_isp_params_awb_gains - Gains for auto-white balance
>> + *
>> + * This struct allows users to configure the gains for white balance.
>> + * There are four gain settings corresponding to each colour channel in
>> + * the bayer domain. All of the gains are stored in Q4.8 format.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AWB_GAINS
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: The C3 ISP parameters block header
>> + * @gr_gain: Multiplier for Gr channel (Q4.8 format)
>> + * @r_gain: Multiplier for R channel (Q4.8 format)
>> + * @b_gain: Multiplier for B channel (Q4.8 format)
>> + * @gb_gain: Multiplier for Gb channel (Q4.8 format)
>> + */
>> +struct c3_isp_params_awb_gains {
>> +     struct c3_isp_params_block_header header;
>> +     __u16 gr_gain;
>> +     __u16 r_gain;
>> +     __u16 b_gain;
>> +     __u16 gb_gain;
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * enum c3_isp_params_awb_tap_points - Tap points for the AWB statistics
>> + * @C3_ISP_AWB_STATS_TAP_FE: immediately after the optical frontend block
>> + * @C3_ISP_AWB_STATS_TAP_GE: immediately after the green equal block
>> + * @C3_ISP_AWB_STATS_TAP_BEFORE_WB: immediately before the white balance block
>> + * @C3_ISP_AWB_STATS_TAP_AFTER_WB: immediately after the white balance block
>> + */
>> +enum c3_isp_params_awb_tap_point {
>> +     C3_ISP_AWB_STATS_TAP_OFE = 0,
>> +     C3_ISP_AWB_STATS_TAP_GE,
>> +     C3_ISP_AWB_STATS_TAP_BEFORE_WB,
>> +     C3_ISP_AWB_STATS_TAP_AFTER_WB,
>> +};
>> +
>> +/**
>> + * struct c3_isp_params_awb_config - Stats settings for auto-white balance
>> + *
>> + * This struct allows the configuration of the statistics generated for auto
>> + * white balance.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AWB_CONFIG
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @tap_point: the tap point from enum c3_isp_params_awb_tap_point
>> + * @satur_vald: AWB statistic over saturation control
>> + *           value: 0: disable, 1: enable
>> + * @horiz_zones_num: active number of hotizontal zones [0..32]
>> + * @vert_zones_num: active number of vertical zones [0..24]
>> + * @rg_min: minimum R/G ratio (Q4.8 format)
>> + * @rg_max: maximum R/G ratio (Q4.8 format)
>> + * @bg_min: minimum B/G ratio (Q4.8 format)
>> + * @bg_max: maximum B/G ratio (Q4.8 format)
>> + * @rg_low: R/G ratio trim low (Q4.8 format)
>> + * @rg_high: R/G ratio trim hight (Q4.8 format)
>> + * @bg_low: B/G ratio trim low (Q4.8 format)
>> + * @bg_high: B/G ratio trim high (Q4.8 format)
>> + * @zone_weight: array of weights for AWB statistics zones [0..15]
>> + * @horiz_cood: the horizontal coordinate of points on the diagonal [0..2888]
>> + * @vert_cood: the vertical coordinate of points on the diagonal [0..2240]
>> + */
>> +struct c3_isp_params_awb_config {
>> +     struct c3_isp_params_block_header header;
>> +     __u8 tap_point;
>> +     __u8 satur_vald;
>> +     __u8 horiz_zones_num;
>> +     __u8 vert_zones_num;
>> +     __u16 rg_min;
>> +     __u16 rg_max;
>> +     __u16 bg_min;
>> +     __u16 bg_max;
>> +     __u16 rg_low;
>> +     __u16 rg_high;
>> +     __u16 bg_low;
>> +     __u16 bg_high;
>> +     __u8 zone_weight[C3_ISP_AWB_MAX_ZONES];
>> +     __u16 horiz_cood[C3_ISP_AWB_MAX_PT_NUM];
>> +     __u16 vert_cood[C3_ISP_AWB_MAX_PT_NUM];
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * enum c3_isp_params_ae_tap_points - Tap points for the AE statistics
>> + * @C3_ISP_AE_STATS_TAP_GE: immediately after the green equal block
>> + * @C3_ISP_AE_STATS_TAP_MLS: immediately after the mesh lens shading block
>> + */
>> +enum c3_isp_params_ae_tap_point {
>> +     C3_ISP_AE_STATS_TAP_GE = 0,
>> +     C3_ISP_AE_STATS_TAP_MLS,
>> +};
>> +
>> +/**
>> + * struct c3_isp_params_ae_config - Stats settings for auto-exposure
>> + *
>> + * This struct allows the configuration of the statistics generated for
>> + * auto exposure.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AE_CONFIG
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @horiz_zones_num: active number of horizontal zones [0..17]
>> + * @vert_zones_num: active number of vertical zones [0..15]
>> + * @tap_point: the tap point from enum c3_isp_params_ae_tap_point
>> + * @zone_weight: array of weights for AE statistics zones [0..15]
>> + * @horiz_cood: the horizontal coordinate of points on the diagonal [0..2888]
>> + * @vert_cood: the vertical coordinate of points on the diagonal [0..2240]
>> + * @reserved: applications must zero this array
>> + */
>> +struct c3_isp_params_ae_config {
>> +     struct c3_isp_params_block_header header;
>> +     __u8 tap_point;
>> +     __u8 horiz_zones_num;
>> +     __u8 vert_zones_num;
>> +     __u8 zone_weight[C3_ISP_AE_MAX_ZONES];
>> +     __u16 horiz_cood[C3_ISP_AE_MAX_PT_NUM];
>> +     __u16 vert_cood[C3_ISP_AE_MAX_PT_NUM];
>> +     __u16 reserved[3];
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * enum c3_isp_params_af_tap_points - Tap points for the AF statistics
>> + * @C3_ISP_AF_STATS_TAP_SNR: immediately after the spatial noise reduce block
>> + * @C3_ISP_AF_STATS_TAP_DMS: immediately after the demosaic block
>> + */
>> +enum c3_isp_params_af_tap_point {
>> +     C3_ISP_AF_STATS_TAP_SNR = 0,
>> +     C3_ISP_AF_STATS_TAP_DMS,
>> +};
>> +
>> +/**
>> + * struct c3_isp_params_af_config - Stats settings for auto-focus
>> + *
>> + * This struct allows the configuration of the statistics generated for
>> + * auto focus.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_AF_CONFIG
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @tap_point: the tap point from enum c3_isp_params_af_tap_point
>> + * @horiz_zones_num: active number of hotizontal zones [0..17]
>> + * @vert_zones_num: active number of vertical zones [0..15]
>> + * @reserved: applications must zero this array
>> + * @horiz_cood: the horizontal coordinate of points on the diagonal [0..2888]
>> + * @vert_cood: the vertical coordinate of points on the diagonal [0..2240]
>> + */
>> +struct c3_isp_params_af_config {
>> +     struct c3_isp_params_block_header header;
>> +     __u8 tap_point;
>> +     __u8 horiz_zones_num;
>> +     __u8 vert_zones_num;
>> +     __u8 reserved[5];
>> +     __u16 horiz_cood[C3_ISP_AF_MAX_PT_NUM];
>> +     __u16 vert_cood[C3_ISP_AF_MAX_PT_NUM];
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * struct c3_isp_params_pst_gamma - Post gamma configuration
>> + *
>> + * This struct allows the configuration of the look up table for
>> + * post gamma. The gamma curve consists of 129 points, so need to
>> + * set lut[129].
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_PST_GAMMA
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @lut: lookup table for P-Stitch gamma [0..1023]
>> + * @reserved: applications must zero this array
>> + */
>> +struct c3_isp_params_pst_gamma {
>> +     struct c3_isp_params_block_header header;
>> +     __u16 lut[129];
>> +     __u16 reserved[3];
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * struct c3_isp_params_ccm - ISP CCM configuration
>> + *
>> + * This struct allows the configuration of the matrix for
>> + * color correction. The matrix consists of 3 x 3 points,
>> + * so need to set matrix[3][3].
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_CCM
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @matrix: a 3 x 3 matrix used for color correction,
>> + *          the value of matrix[x][y] is orig_value x 256. [-4096..4095]
>> + * @reserved: applications must zero this array
>> + */
>> +struct c3_isp_params_ccm {
>> +     struct c3_isp_params_block_header header;
>> +     __s16 matrix[3][3];
>> +     __u16 reserved[3];
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * struct c3_isp_params_csc - ISP Color Space Conversion configuration
>> + *
>> + * This struct allows the configuration of the matrix for color space
>> + * conversion. The matrix consists of 3 x 3 points, so need to set matrix[3][3].
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_CSC
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @matrix: a 3x3 matrix used for the color space conversion,
>> + *          the value of matrix[x][y] is orig_value x 256. [-4096..4095]
>> + * @reserved: applications must zero this array
>> + */
>> +struct c3_isp_params_csc {
>> +     struct c3_isp_params_block_header header;
>> +     __s16 matrix[3][3];
>> +     __u16 reserved[3];
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * struct c3_isp_params_blc - ISP Black Level Correction configuration
>> + *
>> + * This struct allows the configuration of the block level offset for each
>> + * color channel.
>> + *
>> + * header.type should be set to C3_ISP_PARAMS_BLOCK_BLC
>> + * from :c:type:`c3_isp_params_block_type`
>> + *
>> + * @header: the C3 ISP parameters block header
>> + * @gr_ofst: Gr blc offset (Q4.8 format)
>> + * @r_ofst: R blc offset (Q4.8 format)
>> + * @b_ofst: B blc offset (Q4.8 format)
>> + * @gb_ofst: Gb blc offset(Q4.8 format)
>> + */
>> +struct c3_isp_params_blc {
>> +     struct c3_isp_params_block_header header;
>> +     __u16 gr_ofst;
>> +     __u16 r_ofst;
>> +     __u16 b_ofst;
>> +     __u16 gb_ofst;
>> +};
>> +
>> +/**
>> + * define C3_ISP_PARAMS_MAX_SIZE - Maximum size of all C3 ISP Parameters
>> + *
>> + * Though the parameters for the C3 ISP are passed as optional blocks, the
>> + * driver still needs to know the absolute maximum size so that it can allocate
>> + * a buffer sized appropriately to accommodate userspace attempting to set all
>> + * possible parameters in a single frame.
>> + */
>> +#define C3_ISP_PARAMS_MAX_SIZE                     \
>> +     (sizeof(struct c3_isp_params_awb_gains) +  \
>> +      sizeof(struct c3_isp_params_awb_config) + \
>> +      sizeof(struct c3_isp_params_ae_config) +  \
>> +      sizeof(struct c3_isp_params_af_config) +  \
>> +      sizeof(struct c3_isp_params_pst_gamma) +  \
>> +      sizeof(struct c3_isp_params_ccm) +        \
>> +      sizeof(struct c3_isp_params_csc) +        \
>> +      sizeof(struct c3_isp_params_blc))
>> +
>> +/**
>> + * struct c3_isp_params_cfg - C3 ISP configuration parameters
>> + *
>> + * This struct contains the configuration parameters of the C3 ISP
>> + * algorithms, serialized by userspace into an opaque data buffer. Each
>> + * configuration parameter block is represented by a block-specific structure
>> + * which contains a :c:type:`c3_isp_param_block_header` entry as first
>> + * member. Userspace populates the @data buffer with configuration parameters
>> + * for the blocks that it intends to configure. As a consequence, the data
>> + * buffer effective size changes according to the number of ISP blocks that
>> + * userspace intends to configure.
>> + *
>> + * The parameters buffer is versioned by the @version field to allow modifying
>> + * and extending its definition. Userspace should populate the @version field to
>> + * inform the driver about the version it intends to use. The driver will parse
>> + * and handle the @data buffer according to the data layout specific to the
>> + * indicated revision and return an error if the desired revision is not
>> + * supported.
>> + *
>> + * For each ISP block that userspace wants to configure, a block-specific
>> + * structure is appended to the @data buffer, one after the other without gaps
>> + * in between nor overlaps. Userspace shall populate the @total_size field with
>> + * the effective size, in bytes, of the @data buffer.
>> + *
>> + * The expected memory layout of the parameters buffer is::
>> + *
>> + *   +-------------------- struct c3_isp_params_cfg ---- ------------------+
>> + *   | version = C3_ISP_PARAM_BUFFER_V0;                                   |
>> + *   | data_size = sizeof(struct c3_isp_params_awb_gains) +                |
>> + *   |              sizeof(struct c3_isp_params_awb_config);       |
>> + *   | +------------------------- data  ---------------------------------+ |
>> + *   | | +------------ struct c3_isp_params_awb_gains) ------------------+ |
>> + *   | | | +---------  struct c3_isp_params_block_header header -----+ | | |
>> + *   | | | | type = C3_ISP_PARAMS_BLOCK_AWB_GAINS;                   | | | |
>> + *   | | | | flags = C3_ISP_PARAMS_BLOCK_FL_NONE;                    | | | |
>> + *   | | | | size = sizeof(struct c3_isp_params_awb_gains);          | | | |
>> + *   | | | +---------------------------------------------------------+ | | |
>> + *   | | | gr_gain = ...;                                              | | |
>> + *   | | | r_gain = ...;                                               | | |
>> + *   | | | b_gain = ...;                                               | | |
>> + *   | | | gb_gain = ...;                                              | | |
>> + *   | | +------------------ struct c3_isp_params_awb_config ----------+ | |
>> + *   | | | +---------- struct c3_isp_param_block_header header ------+ | | |
>> + *   | | | | type = C3_ISP_PARAMS_BLOCK_AWB_CONFIG;                  | | | |
>> + *   | | | | flags = C3_ISP_PARAMS_BLOCK_FL_NONE;                    | | | |
>> + *   | | | | size = sizeof(struct c3_isp_params_awb_config)          | | | |
>> + *   | | | +---------------------------------------------------------+ | | |
>> + *   | | | tap_point = ...;                                            | | |
>> + *   | | | satur_vald = ...;                                           | | |
>> + *   | | | horiz_zones_num = ...;                                      | | |
>> + *   | | | vert_zones_num = ...;                                       | | |
>> + *   | | +-------------------------------------------------------------+ | |
>> + *   | +-----------------------------------------------------------------+ |
>> + *   +---------------------------------------------------------------------+
>> + *
>> + * @version: The C3 ISP parameters buffer version
>> + * @data_size: The C3 ISP configuration data effective size, excluding this
>> + *             header
>> + * @data: The C3 ISP configuration blocks data
>> + */
>> +struct c3_isp_params_cfg {
>> +     __u32 version;
>> +     __u32 data_size;
>> +     __u8 data[C3_ISP_PARAMS_MAX_SIZE];
>> +};
>> +
>> +#endif
>>
>> --
>> 2.47.1
>>
>>
>>

