Return-Path: <linux-media+bounces-54398-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDltBMBep2lWhAAAu9opvQ
	(envelope-from <linux-media+bounces-54398-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:20:48 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A81F7EBC
	for <lists+linux-media@lfdr.de>; Tue, 03 Mar 2026 23:20:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62CD230F57E0
	for <lists+linux-media@lfdr.de>; Tue,  3 Mar 2026 22:20:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA7A73932C5;
	Tue,  3 Mar 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="NLs99u1A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE9347FCC;
	Tue,  3 Mar 2026 22:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772576402; cv=fail; b=WzbXgVEeCxjVriEkh7Jo37Vo5JdTIab2Jn3H8/6uDcHS0PwYhYIc2a06m9thvH3ITYx9I/1WoqrrIJbS/g4q70nv82Y/qt8Nof3RZb4pK3La/E52VKLedI1G2UJHEGN6RmkcU/KBQ6+7PfWTdM2B/fYhb0F0dxaj0EOAchJz2Mc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772576402; c=relaxed/simple;
	bh=ohrzSh8D/CiSi/wOWSSZwelW2RFe/O2kFbkRMSRUVd0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qbucc4rdx4GkK59gXsCVbaT8Q9U8G/Rgo9K8FKHFc74cucX9cdto5wkZUVDbmY/4hQ8Yj7i6LZ6M9Gx39i7DDY8MBQVzJMbQ1N7MxeHLJJ/CxLgOJYCMHxdi3Cm31tpMMBTqEZ0hUO+3L0BWGSwflX9uIROluL2c+8+EH1Odc3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=NLs99u1A; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623LTsTA3239214;
	Tue, 3 Mar 2026 22:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=5jC3xwg/l+/QqJLznxkekBTeKOHiOnhmP/zGc+j8dQs=; b=
	NLs99u1AEz2hWikAqgwGgHd/Cv7PEsUz/u+HplRyProcBiIOR3PgStNpQHMK+y69
	m2qZysYaBw8zP/E4Im48iAOZiIU71g9taIsWspp0eUU3uCPGZEm+bIAAazyDufmz
	u1lI7lq8osqm2hF7TEWdmJj1kZm/K51sQyhaczxuwTjBerrIblY9ToSa8xxjhAhI
	2ncT3+IlbymqGgPi7WcuL71HmOpPi/x3RqvqqWyh2/9CS+I8BwSHyJATkhq6EwmY
	8jp4xah88s2z74ZVmx9rRN9WgKPCYjZ0QXK5mFlYdw4efOUZaW1tNyiD7WJ3ytXp
	7H0fZXYEDKzNwS3iWWBQxg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011034.outbound.protection.outlook.com [40.93.194.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ckqb4mawt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 22:19:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hQ6vQ7g0+t9byL1HHmXgfTL5Oax8GksSqiJeJYtALj5zmDnxr1qKrJ8V5bblx1vuxXpu5UvsCrv+OocMhkXxwhihk5hPngJA2gvDoCRprwqALaUP+aD8uctoi2xdham1bsg3Nj4utFTCNf26G6NaobhP0hKstWnBBluS6kwhljpsJ5hDInTLCic7hqROcWlLZB71KbHk5Rl8b24Yk+eImehK0gPjBIbKyWn8t5jVo8BZ8m06oYLknoyrnjzoge5M8EjsrtcdnpdlaIjxNe4sxcKtS1OGhzyD1nXIPfAF+Mu2rbSwqso1TzYhMdPXCz8tJWz5P2pJiuYpKs56g6NlaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jC3xwg/l+/QqJLznxkekBTeKOHiOnhmP/zGc+j8dQs=;
 b=ENUeh6OkXqhXQ6yR2UoFEXPzOxtV5EdAj+GLhOsKoI1ttEVXjijVRAWuYV0ROhFXc92D/inOc+03HQfvEiNlo8BmBetTC4xyQNksn3YoYvY4GvJuWE7mFjoIg4/nTh51LOeh0ULLIZj4FY2ANIHZwPO+JBKJdc3CWu4OH7hGMca0o141jdgYyKM9UzLiI6U4qOom1sXUvp3rqHHXogR1BGxWUKjZ2DRB2jahog5vLcpOHgzUN/vPkmP9hWxvUjKQsVpvAcDI8XCIzRt8NTfro3EgXYocbZM16pu5rj1Gwo4ZWgp7aeiuJAcZQDvYI/NadGZgmdI4BoN0W+YqZIl+Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by LV8PR11MB8677.namprd11.prod.outlook.com
 (2603:10b6:408:1fa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 22:19:28 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::5f46:caa4:60d4:f669%2]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 22:19:28 +0000
Message-ID: <f3699168-d53d-4a83-aaf0-1695ef91e9f4@windriver.com>
Date: Wed, 4 Mar 2026 06:19:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] media: i2c: ov9282: Convert to CCI register access
 helpers
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        tarang.raval@siliconsignals.io, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260303104942.3111366-1-xiaolei.wang@windriver.com>
 <20260303104942.3111366-2-xiaolei.wang@windriver.com>
 <CAPY8ntBPAC9mpN4UEqDJNcu=_mhaet=ShewinPC0ctTpMdSx0w@mail.gmail.com>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <CAPY8ntBPAC9mpN4UEqDJNcu=_mhaet=ShewinPC0ctTpMdSx0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P301CA0085.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::15) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|LV8PR11MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: 598aad16-5699-461f-1a1f-08de7972ef49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	aIa2Zbfg/rZqBZdErkmkqPex5RR0sShQ69iCKGaGc3Cto5e6DxDu9duNdZWnHp8FaQynudazafg/6GsR3fRLXY/lM1g5KLUJeyAdHWTDz+uVP61eWeuuZjpatg7j94SIZFh5b5qPLHCAdLlM9brktbdf5YyMw5zOgi3uD1aUUfrfSKTo6Q9dgdLhASlqj1Yx5zwlYEJPe0mH7tq8cIwhjpAZZOMe+XBv8ZsnB6aT1dnQimzUPaM5WrEFJZ7uMFyZ5J0VKsMcF69Sll/lD+DL+cKVFJNx5EXNYc5IAcCJ+a9l2syJ0UBgQVYr1aBq9JZ5hfkkCBTZcajGpuPRwpera5j9+JCGP4ylr/riP++CgBoMcm+X1RLL/l7QhnULeVOsUwdfL6KdzeTf21s4nZmK3YQm1w0TEA8on+ErP64Lf2j3gdIQ6QAymog0TUNkbPu3hML+yiCpMzSzhorFmzfOscvZbeAgnOyrVof4IAAm8LOaxqxBOo4HsnAdxcjWeyCNAXEmMUGVjqcFs89eT4C+1op7wfgE9yEMz3IL7wdB6KxpAJc1KilxOjF3xjVxQQwAiP4gLRNtjHaTDWOWkjChDRbzymExxXvWNcf2pyn2V3QLUsM24m0YamtkofI5Gq1l693qbfIVhnLNkoHnaQ0Z7XpsxFAfvK1VLIvN2L97fxJoIc5xrOBmo7v5zKjgVPDpdQfdy0i8bOpfNutgq4U5arkXhQ6K/ChfPLEqhCASVKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck5vNERiL25SMTN6dXJrcEVJd2xGcVA4Y0dmMUdNVStEaGEwelRHSXd3enl5?=
 =?utf-8?B?UGVSWEZjVFhRM1pUY1h5VEJHbzZ2VFFTM3NIdFNKKzQ4bHVybTFKRk5pMFhF?=
 =?utf-8?B?T3ZHbElPb1pGV1BMc1F0VHQ2bDY5RXlXOU44cFY5ckZQbEV2TzRuVkw2L1pE?=
 =?utf-8?B?eUZ3ZGovZlNJeGozakV2dVcyakdyclpZSGtrMDMvdmpDOGJ6djg5NjNXVE5X?=
 =?utf-8?B?Q1RERGJlL3Z4dUIxS0pmL016QzdNS3dTTTNiL0lad3AyZmpXSVRrTFZ0cnFP?=
 =?utf-8?B?T2E5L0o2bHJnTVlqM3oyY0dPSjdCM0JGVzZTdWYwRnVxNlJTMzQvZnd3YlRx?=
 =?utf-8?B?Q2t5bkVkZmVzZlM2Z3dyNGZPQkF4aXlDNkw4VUR3NkJQcXgxYktnWjhDbWFL?=
 =?utf-8?B?U0lMck5VSEhRbzVGaUEzaWVwUWtjcUl6S0Jyck1TZHdmNkNZblBsVnlzaE9U?=
 =?utf-8?B?OWU4azBCWFozdWxjc1hlc1BGYjc5Z2k4ZkZ0M1NGYUV1U1dxQnNDQU5ROC9m?=
 =?utf-8?B?dkRXMkVIL1JxQUZKbUhBRjRJTGkrdFh4Q1o1SWZ5cXZHRm1USUN6UW1sTUtx?=
 =?utf-8?B?WlJDWFhuZVl2cEc1dE1uY2lCd3ppakdhaEk4NkUwcDVaYllCS3RQQ0pLb0xR?=
 =?utf-8?B?U2doTG14elhObTdsNWptNG96dW9NZDdYWktXdHNHaUNTOCtYR3VoWmFWMGtT?=
 =?utf-8?B?WVpQM2VJa1ZHMUNITThLUnVEMEtZWDliRlhYU0pneldyYzVjZnd5d1BSZmZO?=
 =?utf-8?B?SVZGS3hPcEEranBxYVg0R0JwYVZWQ1RCMmc0RDNEZlJaL3AvQzYvUC9sTy80?=
 =?utf-8?B?aWg0aWlUeTdRZ0R1WVlPWktqeTQyT1RsRGJHbjNaZWxlRHF6dWNzcVhKczk5?=
 =?utf-8?B?cFdYWVVweEQ0bm41dGkxL0JFZVg4KzhLOTduUjBHc21zcEF1U0lpb1d6QmN1?=
 =?utf-8?B?WVlLZHNSVjZoZGd4VkloRmNBUmtZT0YvcGlCWmxxenVBMlM4S1VZQnRoUk1n?=
 =?utf-8?B?RTQwNGMrb1ZhMERlRVFCd1JNMXA2R0FXNzVNbVg4VXRNbGdPZzQ1NXc5OXdm?=
 =?utf-8?B?b1ArcFpiRERzRG9HZU00bktlWDUxU2JNNXc1V1ExNUdwTldVeGczYmMxUGRH?=
 =?utf-8?B?VnE3YndEekNWc2ZVbjVBNE5XQktaUzNSanFpeTdCbFo1YW5RNWdnMVJpaGp3?=
 =?utf-8?B?K1FqVmhkemJTcTQ5V0ExQkdOM0JyYkhhYS9qQmxOWmVsSU1xem91NC9CQmdI?=
 =?utf-8?B?QWcxMk1kTS8yUTZ3S2F0YmhMdEtSTWswT0NWTExpTnJDVTlwdjBqMTh6STlX?=
 =?utf-8?B?RHdCcVN5b2hhaFIyZk5SU2hSdHppcjlkM0lXbVpBVi9YM2tNNjRmNVFrQzZC?=
 =?utf-8?B?Qk1KczArRHZUSk9nNlNKSVRpMW5YSVAzVE5CSXF0S0VTNjI3QTdzbTU2N3Ex?=
 =?utf-8?B?djE2N3FheEwzQjBrdnFGNWxjakMxUWRreUp3OXhKcFplOXRFSGVtVDV1aEla?=
 =?utf-8?B?RlVnOVJFak5qaVJKZGZGQk5JVGN2VFhKK2VwcVpTRk90NHZHU3MwMm1IaFI2?=
 =?utf-8?B?TW1sQlRPWndkT3lLd1M5aEVPM1djRTJrdVlhazJsZmo0YVhTQTNGSnAvVXQ4?=
 =?utf-8?B?aHZ5MDAyU3FYWTE0TFlhSGJoNm1FampjYlE0a0w3NXJ3cHJ6Z0R5T25MZWd3?=
 =?utf-8?B?bFRUcTA0S29DZVNWSktEZkkveFFSbHhjU0IwOTM2dmJhaGluWHBCM3RnTEhW?=
 =?utf-8?B?MTBJNzFuditJUUg5SWJVNDlVaGlJR2I3V3h4YjlwQTJWdFJmU2M5VXFkdkdV?=
 =?utf-8?B?Zkwvby90MUhHR2lzTWNiVGtJUGV1akpJdStYL09kWTAzVmplUGFOeVpGWjhE?=
 =?utf-8?B?MEJPOHRtaW43L3ZUOFF2N1Evb040eHhzWExXZFlCUDlyTk9zQTF4UG9ha3VX?=
 =?utf-8?B?RzRKVkwrdXpRQ21leEU2SGFEQVVzM08rZkpwWGd2MXh3OVVnZy9IZGI2VW9P?=
 =?utf-8?B?UHV2Y001cUcwODhqMFI5dWNXMWJSa0szNU15V1R5aDZvbXRUanl5SWdxdTgz?=
 =?utf-8?B?NVd2dHNwd0cxdkd6a1YwQnFDVG5xVVNocmoybU10VGQvMXNublY0cFVleGhh?=
 =?utf-8?B?VlVRSWNjeGI1dkRGVkJLejBOVUNYNUdhSTBVMmovcFdFRFN4bllUY2xXQ2Nz?=
 =?utf-8?B?YmxoOTJhWHNOSmFvY25LRkpxeDl3bndBMFpYa005ZFgvWXJXaHE2aHlkUGZC?=
 =?utf-8?B?RGl5aEd2SjVjS0lLbDBjSHU2TE1LWkFucVBTKzFBNTFGKzVlazhLUFZhczRN?=
 =?utf-8?B?aFFBczNnZ1Rxa3h3akcyUzVoY0RYWGxGVCsyNTZ6UTNlR0U1WnloYWN2OWQ1?=
 =?utf-8?Q?g5jKejq4CBx6dsoO3ag04IApxgL2Ug8id6JYLWS2k9T46?=
X-MS-Exchange-AntiSpam-MessageData-1: t6lU759rS5hscDzcMNXrt5w28iAQOxyf2Nk=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 598aad16-5699-461f-1a1f-08de7972ef49
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 22:19:28.3775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htymsR84OApcuWH3lrIIcwPQ/Rl4HTysJAjwAF4QR9X1cQ2z6CYzOv8ySldfBg5niyyMs6NMJ0C1xLPcQgQwJQQlGvx2CM3fuS/a/KZ+sQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8677
X-Authority-Analysis: v=2.4 cv=LqWfC3dc c=1 sm=1 tr=0 ts=69a75e73 cx=c_pps
 a=Ja8eqYkQVLI9FgEzOga41Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=t7CeM3EgAAAA:8 a=cKVIoxwil7kXS4WKsh4A:9 a=QEXdDO2ut3YA:10
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: isBSah2I5VXCOkb4E8kW0N7PH-iVwZAl
X-Proofpoint-ORIG-GUID: isBSah2I5VXCOkb4E8kW0N7PH-iVwZAl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE4MyBTYWx0ZWRfX+/hKXlqI/TIt
 ubsUxeLekeG0Pau0Bw+AsA/SFtIjU+1J82QNX4HGDN1BdpxY3KWtJb4nCk8XBQYKut7aTqGvKBF
 tykbaWdhLo9n88l8kqowjn6hRg0lfExgYroTi062PsXndYP7Um9YbzeUrY6pfEcPE6fz6fRHkYS
 xEAuWa+HPzu/4rGeEWP1X+gs0FCHRtoyosbB66ZbT80Yh0+Yv5ZnQvshG+SZrh6knijzshFI1Qm
 iMAop53SHFJiN+9a4dyG3XUks6uTtPgUA+9mqn5mQXBxiLjSEEPfjjrtaI/QWaZ7ZV5OgBCc3aF
 pOASbSMoPw1+vfxxTCHfBBmpcX7cbRvuLC7Lj3DFjoprcQN95JPr5wGS4YaFAx1vfSHKYvqA+AO
 zAtac1Rc3HyvX89mATgdl6yW9V1vFiQrfdgnMBjUeMnpjYUcDsB8PjnlzfZrnX3vMAIJxXgLdcU
 rg97dTjtTT/pEZjBX4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030183
X-Rspamd-Queue-Id: 805A81F7EBC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54398-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[linux.intel.com,ideasonboard.com,siliconsignals.io,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,siliconsignals.io:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Hi Dave,

Thanks for the review

On 3/3/26 20:51, Dave Stevenson wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei
>
> Thanks for the patch
>
> On Tue, 3 Mar 2026 at 10:50, Xiaolei Wang <xiaolei.wang@windriver.com> wrote:
>> Use the new common CCI register access helpers to replace the private
>> register access helpers in the ov9282 driver. This simplifies the driver
>> by reducing the amount of code.
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
>> ---
>>   drivers/media/i2c/Kconfig  |   1 +
>>   drivers/media/i2c/ov9282.c | 293 ++++++++-----------------------------
>>   2 files changed, 64 insertions(+), 230 deletions(-)
>>
>> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
>> index 5eb1e0e0a87a..3027e71fd8fb 100644
>> --- a/drivers/media/i2c/Kconfig
>> +++ b/drivers/media/i2c/Kconfig
>> @@ -690,6 +690,7 @@ config VIDEO_OV8865
>>   config VIDEO_OV9282
>>          tristate "OmniVision OV9282 sensor support"
>>          depends on OF_GPIO
>> +       select V4L2_CCI_I2C
>>          help
>>            This is a Video4Linux2 sensor driver for the OmniVision
>>            OV9282 camera sensor.
>> diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
>> index ded9b2044ff8..8bfaa3ae4be5 100644
>> --- a/drivers/media/i2c/ov9282.c
>> +++ b/drivers/media/i2c/ov9282.c
>> @@ -12,38 +12,40 @@
>>   #include <linux/math.h>
>>   #include <linux/module.h>
>>   #include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>>   #include <linux/regulator/consumer.h>
>>
>> +#include <media/v4l2-cci.h>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-event.h>
>>   #include <media/v4l2-fwnode.h>
>>   #include <media/v4l2-subdev.h>
>>
>>   /* Streaming Mode */
>> -#define OV9282_REG_MODE_SELECT 0x0100
>> +#define OV9282_REG_MODE_SELECT CCI_REG8(0x0100)
>>   #define OV9282_MODE_STANDBY    0x00
>>   #define OV9282_MODE_STREAMING  0x01
>>
>> -#define OV9282_REG_PLL_CTRL_0D 0x030d
>> +#define OV9282_REG_PLL_CTRL_0D CCI_REG8(0x030d)
>>   #define OV9282_PLL_CTRL_0D_RAW8                0x60
>>   #define OV9282_PLL_CTRL_0D_RAW10       0x50
>>
>> -#define OV9282_REG_TIMING_HTS  0x380c
>> +#define OV9282_REG_TIMING_HTS  CCI_REG16(0x380c)
>>   #define OV9282_TIMING_HTS_MAX  0x7fff
>>
>>   /* Lines per frame */
>> -#define OV9282_REG_LPFR                0x380e
>> +#define OV9282_REG_LPFR                CCI_REG16(0x380e)
>>
>>   /* Chip ID */
>> -#define OV9282_REG_ID          0x300a
>> +#define OV9282_REG_ID          CCI_REG16(0x300a)
>>   #define OV9282_ID              0x9281
>>
>>   /* Output enable registers */
>> -#define OV9282_REG_OUTPUT_ENABLE4      0x3004
>> +#define OV9282_REG_OUTPUT_ENABLE4      CCI_REG8(0x3004)
>>   #define OV9282_OUTPUT_ENABLE4_GPIO2    BIT(1)
>>   #define OV9282_OUTPUT_ENABLE4_D9       BIT(0)
>>
>> -#define OV9282_REG_OUTPUT_ENABLE5      0x3005
>> +#define OV9282_REG_OUTPUT_ENABLE5      CCI_REG8(0x3005)
>>   #define OV9282_OUTPUT_ENABLE5_D8       BIT(7)
>>   #define OV9282_OUTPUT_ENABLE5_D7       BIT(6)
>>   #define OV9282_OUTPUT_ENABLE5_D6       BIT(5)
>> @@ -53,7 +55,7 @@
>>   #define OV9282_OUTPUT_ENABLE5_D2       BIT(1)
>>   #define OV9282_OUTPUT_ENABLE5_D1       BIT(0)
>>
>> -#define OV9282_REG_OUTPUT_ENABLE6      0x3006
>> +#define OV9282_REG_OUTPUT_ENABLE6      CCI_REG8(0x3006)
>>   #define OV9282_OUTPUT_ENABLE6_D0       BIT(7)
>>   #define OV9282_OUTPUT_ENABLE6_PCLK     BIT(6)
>>   #define OV9282_OUTPUT_ENABLE6_HREF     BIT(5)
>> @@ -62,14 +64,14 @@
>>   #define OV9282_OUTPUT_ENABLE6_VSYNC    BIT(1)
>>
>>   /* Exposure control */
>> -#define OV9282_REG_EXPOSURE    0x3500
>> +#define OV9282_REG_EXPOSURE    CCI_REG24(0x3500)
>>   #define OV9282_EXPOSURE_MIN    1
>>   #define OV9282_EXPOSURE_OFFSET 25
>>   #define OV9282_EXPOSURE_STEP   1
>>   #define OV9282_EXPOSURE_DEFAULT        0x0282
>>
>>   /* AEC/AGC manual */
>> -#define OV9282_REG_AEC_MANUAL          0x3503
>> +#define OV9282_REG_AEC_MANUAL          CCI_REG8(0x3503)
>>   #define OV9282_DIGFRAC_GAIN_DELAY      BIT(6)
>>   #define OV9282_GAIN_CHANGE_DELAY       BIT(5)
>>   #define OV9282_GAIN_DELAY              BIT(4)
>> @@ -78,28 +80,28 @@
>>   #define OV9282_AEC_MANUAL_DEFAULT      0x00
>>
>>   /* Analog gain control */
>> -#define OV9282_REG_AGAIN       0x3509
>> +#define OV9282_REG_AGAIN       CCI_REG8(0x3509)
>>   #define OV9282_AGAIN_MIN       0x10
>>   #define OV9282_AGAIN_MAX       0xff
>>   #define OV9282_AGAIN_STEP      1
>>   #define OV9282_AGAIN_DEFAULT   0x10
>>
>>   /* Group hold register */
>> -#define OV9282_REG_HOLD                0x3308
>> +#define OV9282_REG_HOLD                CCI_REG8(0x3308)
>>
>> -#define OV9282_REG_ANA_CORE_2  0x3662
>> +#define OV9282_REG_ANA_CORE_2  CCI_REG8(0x3662)
>>   #define OV9282_ANA_CORE2_RAW8  0x07
>>   #define OV9282_ANA_CORE2_RAW10 0x05
>>
>> -#define OV9282_REG_TIMING_FORMAT_1     0x3820
>> -#define OV9282_REG_TIMING_FORMAT_2     0x3821
>> +#define OV9282_REG_TIMING_FORMAT_1     CCI_REG8(0x3820)
>> +#define OV9282_REG_TIMING_FORMAT_2     CCI_REG8(0x3821)
>>   #define OV9282_FLIP_BIT                        BIT(2)
>>
>> -#define OV9282_REG_MIPI_CTRL00 0x4800
>> +#define OV9282_REG_MIPI_CTRL00 CCI_REG8(0x4800)
>>   #define OV9282_GATED_CLOCK     BIT(5)
>>
>>   /* Flash/Strobe control registers */
>> -#define OV9282_REG_STROBE_FRAME_SPAN           0x3925
>> +#define OV9282_REG_STROBE_FRAME_SPAN           CCI_REG32(0x3925)
>>   #define OV9282_STROBE_FRAME_SPAN_DEFAULT       0x0000001a
>>
>>   /* Input clock rate */
>> @@ -139,16 +141,6 @@ static const char * const ov9282_supply_names[] = {
>>
>>   #define OV9282_NUM_SUPPLIES ARRAY_SIZE(ov9282_supply_names)
>>
>> -/**
>> - * struct ov9282_reg - ov9282 sensor register
>> - * @address: Register address
>> - * @val: Register value
>> - */
>> -struct ov9282_reg {
>> -       u16 address;
>> -       u8 val;
>> -};
>> -
>>   /**
>>    * struct ov9282_reg_list - ov9282 sensor register list
>>    * @num_of_regs: Number of registers in the list
>> @@ -156,7 +148,7 @@ struct ov9282_reg {
>>    */
>>   struct ov9282_reg_list {
>>          u32 num_of_regs;
>> -       const struct ov9282_reg *regs;
>> +       const struct reg_sequence *regs;
>>   };
>>
>>   /**
>> @@ -188,6 +180,7 @@ struct ov9282_mode {
>>    * struct ov9282 - ov9282 sensor device structure
>>    * @dev: Pointer to generic device
>>    * @sd: V4L2 sub-device
>> + * @regmap: Regmap for sensor register access
>>    * @pad: Media pad. Only one pad supported
>>    * @reset_gpio: Sensor reset gpio
>>    * @inclk: Sensor input clock
>> @@ -209,6 +202,7 @@ struct ov9282_mode {
>>   struct ov9282 {
>>          struct device *dev;
>>          struct v4l2_subdev sd;
>> +       struct regmap *regmap;
>>          struct media_pad pad;
>>          struct gpio_desc *reset_gpio;
>>          struct clk *inclk;
>> @@ -241,7 +235,7 @@ static const s64 link_freq[] = {
>>    * register arrays as some settings are written as part of ov9282_power_on,
>>    * and the reset will clear them.
>>    */
>> -static const struct ov9282_reg common_regs[] = {
>> +static const struct reg_sequence common_regs[] = {
>>          {0x0302, 0x32},
>>          {0x030e, 0x02},
>>          {0x3001, 0x00},
>> @@ -305,11 +299,6 @@ static const struct ov9282_reg common_regs[] = {
>>          {0x5a08, 0x84},
>>   };
>>
>> -static struct ov9282_reg_list common_regs_list = {
>> -       .num_of_regs = ARRAY_SIZE(common_regs),
>> -       .regs = common_regs,
>> -};
>> -
>>   #define MODE_1280_800          0
>>   #define MODE_1280_720          1
>>   #define MODE_640_400           2
>> @@ -317,7 +306,7 @@ static struct ov9282_reg_list common_regs_list = {
>>   #define DEFAULT_MODE           MODE_1280_720
>>
>>   /* Sensor mode registers */
>> -static const struct ov9282_reg mode_1280x800_regs[] = {
>> +static const struct reg_sequence mode_1280x800_regs[] = {
>>          {0x3778, 0x00},
>>          {0x3800, 0x00},
>>          {0x3801, 0x00},
> You changed OV9282_REG_TIMING_FORMAT_[12] above to
> CCI_REG8(0x382[01]). However it is used in this array of type
> reg_sequence, but all the other values are still using non-CCI_REGx
> register writes here.
>
> If converting to CCI_REGx then you at least need to be consistent.
> Personally I'd say do it everywhere and use cci_multi_reg_write
> instead of regmap_multi_reg_write.
Thanks for pointing it out, it is indeed a bit confusing, I overlooked 
that.
>
>> @@ -348,7 +337,7 @@ static const struct ov9282_reg mode_1280x800_regs[] = {
>>          {0x4509, 0x00},
>>   };
>>
>> -static const struct ov9282_reg mode_1280x720_regs[] = {
>> +static const struct reg_sequence mode_1280x720_regs[] = {
>>          {0x3778, 0x00},
>>          {0x3800, 0x00},
>>          {0x3801, 0x00},
>> @@ -379,7 +368,7 @@ static const struct ov9282_reg mode_1280x720_regs[] = {
>>          {0x4509, 0x80},
>>   };
>>
>> -static const struct ov9282_reg mode_640x400_regs[] = {
>> +static const struct reg_sequence mode_640x400_regs[] = {
>>          {0x3778, 0x10},
>>          {0x3800, 0x00},
>>          {0x3801, 0x00},
>> @@ -485,97 +474,6 @@ static inline struct ov9282 *to_ov9282(struct v4l2_subdev *subdev)
>>          return container_of(subdev, struct ov9282, sd);
>>   }
>>
>> -/**
>> - * ov9282_read_reg() - Read registers.
>> - * @ov9282: pointer to ov9282 device
>> - * @reg: register address
>> - * @len: length of bytes to read. Max supported bytes is 4
>> - * @val: pointer to register value to be filled.
>> - *
>> - * Return: 0 if successful, error code otherwise.
>> - */
>> -static int ov9282_read_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 *val)
>> -{
>> -       struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
>> -       struct i2c_msg msgs[2] = {0};
>> -       u8 addr_buf[2] = {0};
>> -       u8 data_buf[4] = {0};
>> -       int ret;
>> -
>> -       if (WARN_ON(len > 4))
>> -               return -EINVAL;
>> -
>> -       put_unaligned_be16(reg, addr_buf);
>> -
>> -       /* Write register address */
>> -       msgs[0].addr = client->addr;
>> -       msgs[0].flags = 0;
>> -       msgs[0].len = ARRAY_SIZE(addr_buf);
>> -       msgs[0].buf = addr_buf;
>> -
>> -       /* Read data from register */
>> -       msgs[1].addr = client->addr;
>> -       msgs[1].flags = I2C_M_RD;
>> -       msgs[1].len = len;
>> -       msgs[1].buf = &data_buf[4 - len];
>> -
>> -       ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>> -       if (ret != ARRAY_SIZE(msgs))
>> -               return -EIO;
>> -
>> -       *val = get_unaligned_be32(data_buf);
>> -
>> -       return 0;
>> -}
>> -
>> -/**
>> - * ov9282_write_reg() - Write register
>> - * @ov9282: pointer to ov9282 device
>> - * @reg: register address
>> - * @len: length of bytes. Max supported bytes is 4
>> - * @val: register value
>> - *
>> - * Return: 0 if successful, error code otherwise.
>> - */
>> -static int ov9282_write_reg(struct ov9282 *ov9282, u16 reg, u32 len, u32 val)
>> -{
>> -       struct i2c_client *client = v4l2_get_subdevdata(&ov9282->sd);
>> -       u8 buf[6] = {0};
>> -
>> -       if (WARN_ON(len > 4))
>> -               return -EINVAL;
>> -
>> -       put_unaligned_be16(reg, buf);
>> -       put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
>> -       if (i2c_master_send(client, buf, len + 2) != len + 2)
>> -               return -EIO;
>> -
>> -       return 0;
>> -}
>> -
>> -/**
>> - * ov9282_write_regs() - Write a list of registers
>> - * @ov9282: pointer to ov9282 device
>> - * @regs: list of registers to be written
>> - * @len: length of registers array
>> - *
>> - * Return: 0 if successful, error code otherwise.
>> - */
>> -static int ov9282_write_regs(struct ov9282 *ov9282,
>> -                            const struct ov9282_reg *regs, u32 len)
>> -{
>> -       unsigned int i;
>> -       int ret;
>> -
>> -       for (i = 0; i < len; i++) {
>> -               ret = ov9282_write_reg(ov9282, regs[i].address, 1, regs[i].val);
>> -               if (ret)
>> -                       return ret;
>> -       }
>> -
>> -       return 0;
>> -}
>> -
>>   /**
>>    * ov9282_update_controls() - Update control ranges based on streaming mode
>>    * @ov9282: pointer to ov9282 device
>> @@ -639,15 +537,15 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>>          dev_dbg(ov9282->dev, "Set exp %u (~%u us), analog gain %u",
>>                  exposure, exposure_us, gain);
>>
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 1);
>> +       ret = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0x01, NULL);
>>          if (ret)
>>                  return ret;
>>
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_EXPOSURE, 3, exposure << 4);
>> +       ret = cci_write(ov9282->regmap, OV9282_REG_EXPOSURE, exposure << 4, NULL);
>>          if (ret)
>>                  goto error_release_group_hold;
>>
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
>> +       ret = cci_write(ov9282->regmap, OV9282_REG_AGAIN, gain, NULL);
>>          if (ret)
>>                  goto error_release_group_hold;
>>
>> @@ -656,60 +554,9 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
>>                                         OV9282_STROBE_FRAME_SPAN_DEFAULT);
>>
>>   error_release_group_hold:
>> -       ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
>> -
>> -       return ret;
>> -}
>> -
>> -static int ov9282_set_ctrl_hflip(struct ov9282 *ov9282, int value)
>> -{
>> -       u32 current_val;
>> -       int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
>> -                                 &current_val);
>> -       if (ret)
>> -               return ret;
>> +       int ret_hold = cci_write(ov9282->regmap, OV9282_REG_HOLD, 0, NULL);
>>
>> -       if (value)
>> -               current_val |= OV9282_FLIP_BIT;
>> -       else
>> -               current_val &= ~OV9282_FLIP_BIT;
>> -
>> -       return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_2, 1,
>> -                               current_val);
>> -}
>> -
>> -static int ov9282_set_ctrl_vflip(struct ov9282 *ov9282, int value)
>> -{
>> -       u32 current_val;
>> -       int ret = ov9282_read_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
>> -                                 &current_val);
>> -       if (ret)
>> -               return ret;
>> -
>> -       if (value)
>> -               current_val |= OV9282_FLIP_BIT;
>> -       else
>> -               current_val &= ~OV9282_FLIP_BIT;
>> -
>> -       return ov9282_write_reg(ov9282, OV9282_REG_TIMING_FORMAT_1, 1,
>> -                               current_val);
>> -}
>> -
>> -static int ov9282_set_ctrl_flash_strobe_oe(struct ov9282 *ov9282, bool enable)
>> -{
>> -       u32 current_val;
>> -       int ret;
>> -
>> -       ret = ov9282_read_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, &current_val);
>> -       if (ret)
>> -               return ret;
>> -
>> -       if (enable)
>> -               current_val |= OV9282_OUTPUT_ENABLE6_STROBE;
>> -       else
>> -               current_val &= ~OV9282_OUTPUT_ENABLE6_STROBE;
>> -
>> -       return ov9282_write_reg(ov9282, OV9282_REG_OUTPUT_ENABLE6, 1, current_val);
>> +       return ret ? ret : ret_hold;
>>   }
>>
>>   static u32 ov9282_us_to_flash_duration(struct ov9282 *ov9282, u32 value)
>> @@ -740,30 +587,6 @@ static u32 ov9282_flash_duration_to_us(struct ov9282 *ov9282, u32 value)
>>          return DIV_ROUND_UP(value * frame_width, OV9282_STROBE_SPAN_FACTOR);
>>   }
>>
>> -static int ov9282_set_ctrl_flash_duration(struct ov9282 *ov9282, u32 value)
>> -{
>> -       u32 val = ov9282_us_to_flash_duration(ov9282, value);
>> -       int ret;
>> -
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN, 1,
>> -                              (val >> 24) & 0xff);
>> -       if (ret)
>> -               return ret;
>> -
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 1, 1,
>> -                              (val >> 16) & 0xff);
>> -       if (ret)
>> -               return ret;
>> -
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 2, 1,
>> -                              (val >> 8) & 0xff);
>> -       if (ret)
>> -               return ret;
>> -
>> -       return ov9282_write_reg(ov9282, OV9282_REG_STROBE_FRAME_SPAN + 3, 1,
>> -                               val & 0xff);
>> -}
>> -
>>   /**
>>    * ov9282_set_ctrl() - Set subdevice control
>>    * @ctrl: pointer to v4l2_ctrl structure
>> @@ -818,23 +641,27 @@ static int ov9282_set_ctrl(struct v4l2_ctrl *ctrl)
>>                  break;
>>          case V4L2_CID_VBLANK:
>>                  lpfr = ov9282->vblank + ov9282->cur_mode->height;
>> -               ret = ov9282_write_reg(ov9282, OV9282_REG_LPFR, 2, lpfr);
>> +               ret = cci_write(ov9282->regmap, OV9282_REG_LPFR, lpfr, NULL);
>>                  break;
>>          case V4L2_CID_HFLIP:
>> -               ret = ov9282_set_ctrl_hflip(ov9282, ctrl->val);
>> +               ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_2,
>> +                                     OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
>>                  break;
>>          case V4L2_CID_VFLIP:
>> -               ret = ov9282_set_ctrl_vflip(ov9282, ctrl->val);
>> +               ret = cci_update_bits(ov9282->regmap, OV9282_REG_TIMING_FORMAT_1,
>> +                                     OV9282_FLIP_BIT, ctrl->val ? OV9282_FLIP_BIT : 0, NULL);
>>                  break;
>>          case V4L2_CID_HBLANK:
>> -               ret = ov9282_write_reg(ov9282, OV9282_REG_TIMING_HTS, 2,
>> -                                      (ctrl->val + ov9282->cur_mode->width) >> 1);
>> +               ret = cci_write(ov9282->regmap, OV9282_REG_TIMING_HTS,
>> +                               (ctrl->val + ov9282->cur_mode->width) >> 1, NULL);
>>                  break;
>>          case V4L2_CID_FLASH_STROBE_OE:
>> -               ret = ov9282_set_ctrl_flash_strobe_oe(ov9282, ctrl->val);
>> +               ret = cci_update_bits(ov9282->regmap, OV9282_REG_OUTPUT_ENABLE6,
>> +                                     OV9282_OUTPUT_ENABLE6_STROBE,
>> +                                     ctrl->val ? OV9282_OUTPUT_ENABLE6_STROBE : 0, NULL);
>>                  break;
>>          case V4L2_CID_FLASH_DURATION:
>> -               ret = ov9282_set_ctrl_flash_duration(ov9282, ctrl->val);
>> +               ret = cci_write(ov9282->regmap, OV9282_REG_STROBE_FRAME_SPAN, ctrl->val, NULL);
>>                  break;
>>          default:
>>                  dev_err(ov9282->dev, "Invalid control %d", ctrl->id);
>> @@ -1114,7 +941,7 @@ static int ov9282_get_selection(struct v4l2_subdev *sd,
>>    */
>>   static int ov9282_start_streaming(struct ov9282 *ov9282)
>>   {
>> -       const struct ov9282_reg bitdepth_regs[2][2] = {
>> +       const struct reg_sequence bitdepth_regs[2][2] = {
>>                  {
>>                          {OV9282_REG_PLL_CTRL_0D, OV9282_PLL_CTRL_0D_RAW10},
>>                          {OV9282_REG_ANA_CORE_2, OV9282_ANA_CORE2_RAW10},
> Here is a more obvious example. You have CCI_REGx() register defines
> being stored into a reg_sequence.
> That's an obvious one for the array to be struct cci_reg_sequence and
> use cci_multi_reg_write().
>
> Otherwise the patch looks reasonable.

I will use cci_multi_reg_write() instead of regmap_multi_reg_write() in

the next version.

thanks

xiaolei

>
>    Dave
>
>> @@ -1128,15 +955,16 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>>          int ret;
>>
>>          /* Write common registers */
>> -       ret = ov9282_write_regs(ov9282, common_regs_list.regs,
>> -                               common_regs_list.num_of_regs);
>> +       ret = regmap_multi_reg_write(ov9282->regmap, common_regs,
>> +                                    ARRAY_SIZE(common_regs));
>>          if (ret) {
>>                  dev_err(ov9282->dev, "fail to write common registers");
>>                  return ret;
>>          }
>>
>>          bitdepth_index = ov9282->code == MEDIA_BUS_FMT_Y10_1X10 ? 0 : 1;
>> -       ret = ov9282_write_regs(ov9282, bitdepth_regs[bitdepth_index], 2);
>> +       ret = regmap_multi_reg_write(ov9282->regmap,
>> +                                    bitdepth_regs[bitdepth_index], 2);
>>          if (ret) {
>>                  dev_err(ov9282->dev, "fail to write bitdepth regs");
>>                  return ret;
>> @@ -1144,7 +972,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>>
>>          /* Write sensor mode registers */
>>          reg_list = &ov9282->cur_mode->reg_list;
>> -       ret = ov9282_write_regs(ov9282, reg_list->regs, reg_list->num_of_regs);
>> +       ret = regmap_multi_reg_write(ov9282->regmap, reg_list->regs,
>> +                                    reg_list->num_of_regs);
>>          if (ret) {
>>                  dev_err(ov9282->dev, "fail to write initial registers");
>>                  return ret;
>> @@ -1158,8 +987,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>>          }
>>
>>          /* Start streaming */
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
>> -                              1, OV9282_MODE_STREAMING);
>> +       ret = cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
>> +                       OV9282_MODE_STREAMING, NULL);
>>          if (ret) {
>>                  dev_err(ov9282->dev, "fail to start streaming");
>>                  return ret;
>> @@ -1176,8 +1005,8 @@ static int ov9282_start_streaming(struct ov9282 *ov9282)
>>    */
>>   static int ov9282_stop_streaming(struct ov9282 *ov9282)
>>   {
>> -       return ov9282_write_reg(ov9282, OV9282_REG_MODE_SELECT,
>> -                               1, OV9282_MODE_STANDBY);
>> +       return cci_write(ov9282->regmap, OV9282_REG_MODE_SELECT,
>> +                        OV9282_MODE_STANDBY, NULL);
>>   }
>>
>>   /**
>> @@ -1228,14 +1057,14 @@ static int ov9282_set_stream(struct v4l2_subdev *sd, int enable)
>>   static int ov9282_detect(struct ov9282 *ov9282)
>>   {
>>          int ret;
>> -       u32 val;
>> +       u64 val;
>>
>> -       ret = ov9282_read_reg(ov9282, OV9282_REG_ID, 2, &val);
>> +       ret = cci_read(ov9282->regmap, OV9282_REG_ID, &val, NULL);
>>          if (ret)
>>                  return ret;
>>
>>          if (val != OV9282_ID) {
>> -               dev_err(ov9282->dev, "chip id mismatch: %x!=%x",
>> +               dev_err(ov9282->dev, "chip id mismatch: %x!=%llx",
>>                          OV9282_ID, val);
>>                  return -ENXIO;
>>          }
>> @@ -1397,9 +1226,8 @@ static int ov9282_power_on(struct device *dev)
>>
>>          usleep_range(400, 600);
>>
>> -       ret = ov9282_write_reg(ov9282, OV9282_REG_MIPI_CTRL00, 1,
>> -                              ov9282->noncontinuous_clock ?
>> -                                       OV9282_GATED_CLOCK : 0);
>> +       ret = cci_write(ov9282->regmap, OV9282_REG_MIPI_CTRL00,
>> +                       ov9282->noncontinuous_clock ? OV9282_GATED_CLOCK : 0, NULL);
>>          if (ret) {
>>                  dev_err(ov9282->dev, "fail to write MIPI_CTRL00");
>>                  goto error_clk;
>> @@ -1576,6 +1404,11 @@ static int ov9282_probe(struct i2c_client *client)
>>                  return ret;
>>          }
>>
>> +       ov9282->regmap = devm_cci_regmap_init_i2c(client, 16);
>> +       if (IS_ERR(ov9282->regmap))
>> +               return dev_err_probe(ov9282->dev, PTR_ERR(ov9282->regmap),
>> +                                    "Failed to init CCI\n");
>> +
>>          mutex_init(&ov9282->mutex);
>>
>>          ret = ov9282_power_on(ov9282->dev);
>> --
>> 2.43.0
>>

