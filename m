Return-Path: <linux-media+bounces-49772-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC3ACEB26F
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 04:03:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA58E30608B8
	for <lists+linux-media@lfdr.de>; Wed, 31 Dec 2025 02:59:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2075C2E62A8;
	Wed, 31 Dec 2025 02:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="CPJYq/tB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40742E06D2;
	Wed, 31 Dec 2025 02:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767149971; cv=fail; b=JBRVgIYV2GrgRQUFbi/P7oAvo9YTTZLeEnKbRwMPDmZCrO7ofU9ltvBu7meoXS8A/zX8btDKMkvP69QFnvsOZ6YKexcmUoSFW0NRZpJmeRI990urr2ICf9tjTuzaS4rviSNksjR2xrN6Zp7ChMO8seYcqEtFZqQOBM7bNBxm0M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767149971; c=relaxed/simple;
	bh=yQFIGcoR+ooinyUCtcCyMp0zQ8xfkjXDkYcOlFj13f0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MeRFSLNDvDKfzZh9Wv/cwBQ1yMTm5OOiVw/MtVUpjUSjH0pCGXVFIasxAL9NRs1IsjDTw6oWkRHRxXx5gj0DGsDaS99yvGN3E5ujZrg1uKLpcSr7IOQ7kcbtUGZErrcQD7TDOLcvJfO5RVJLdCEheNXwwgL9wY+We6w1lwZ4mQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=CPJYq/tB; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV2u0Uo1145582;
	Tue, 30 Dec 2025 18:59:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=5rD1VXWmeYo/HjhRpzkU/evPIZj89wWOg7ZSrGp48fY=; b=
	CPJYq/tBmO6zXdLy0YhJwioNzFApfUU31Hozf8meZeY7OvwQYGTVShyuYypZNXYC
	U0iGwaWOZiYfYBxB5FXYXXqyBcIxxkwbm5SwUFaxgyEno22rc+QlRuTNTEdDuiHp
	vv+9qJYv4wnYDr/4a5vAxzlqES7T5PkkJk/V4eUGuaAdFYzpenBZBI7RkLG0aMs2
	n272ZHEE+fLnerQVCoKLhX02kFFJXcwSjEZ7DIQIWTk7d7T+gygJj+OfBp1UeC1Z
	3v3dKLtbOUq7N3fMXBSmhJThJDutr8sQpPgvzUgIwyf7b5u+O5lDbxGAcOCJD0Kj
	OPHPFm64VUJGBbCcQcEvWg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010013.outbound.protection.outlook.com [52.101.85.13])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4babm23c0e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 18:59:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccZmUsisqs3X2yyYcC+xxhHgOmWx0bAyntXe9+IK6jJhH009W8mFJkFszuGVK62TqtTAldf+Fxsn/2DihHWS4BBPJYm0eLTVN3DO+Z6x8bMeSlm2Iu+yRnic/Y41R2QoZcV+6dpF4M0RSFz3adSRY/Y43B0z71Kw5sCkRJJ9nxWKKK3TrBXeD9NI+VHV9oI3QtykeL5YJR3KiUYW97QX2mW/4P12ezfNeu+5XDN8e7OYp/UpBbvEU8QLhfmJ3EI7O5Zwn+PW/5UN4QGSajUOXEc43TL6OwV25ULJzVXij1xQVJUYSxixKcojRojmj47etqz3jcuPFePrOTBnKcwAqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rD1VXWmeYo/HjhRpzkU/evPIZj89wWOg7ZSrGp48fY=;
 b=Sy1zuF6+D65wAviB2IP3etHFoTj40wAEgVDjQpBo121obnlQ3KlXVrSwaesuB3O1VqEgLU+ASMRui2S8X2guEadB8g+mL63LiucpWyD2wrTUkUsz9JKzRUYSK8KymuX8Phkgk+n1evy6o4FZgx/d6p5O7kLo4KAhHxTZNL9T1dbTC9jRv1gO6DVTX3kvbNY3WzTuCljPhI6zcQnbKWdXkcwCBbmsiX4nfld0eme8cojQCHqEJra0QSYqERuF2VeXPRlO9jMhBOwPjUzDORULAQrljDkUIWFAQ2/2FprjEJd0Mbdj6jif5aCqFSvcPc1kJHXZGDw4DfoO9mmhHLkgnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by CH3PR11MB8468.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Wed, 31 Dec
 2025 02:58:59 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 02:58:58 +0000
Message-ID: <f3807d3e-cffe-4ccc-8e6d-dc306da362fe@windriver.com>
Date: Wed, 31 Dec 2025 10:58:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] media: i2c: ov5647: Switch to using the sub-device
 state lock
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
 <20251229023018.2933405-3-xiaolei.wang@windriver.com>
 <aVLOlkqSHn-N5Wi0@kekkonen.localdomain>
Content-Language: en-US
From: xiaolei wang <xiaolei.wang@windriver.com>
In-Reply-To: <aVLOlkqSHn-N5Wi0@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY4P286CA0039.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::7) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|CH3PR11MB8468:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f8ef40-49fc-49f0-c086-08de48188b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ai8ranJxTW85YTdpQ2ZIZjlmUFZwOGhYUExUenFwVVpwbXl2YW52Z1VwNUx0?=
 =?utf-8?B?YXlYSFA3WkZiSmlhaUdrRnVlMjFxUWJTSEZuRGtqZmVQck12RzMvSmg4UXpZ?=
 =?utf-8?B?czhwNEFIWVF4cDhOaThhUkNRUGJTekxmQ3BEZDNZSXpUR3ZCbHh6N21XY1JD?=
 =?utf-8?B?WlcwOVZxVktkUzFkYkFvMG1UUGJWc1p3bjFVdFN0M1V5Z2Q5a25zakxRMWw5?=
 =?utf-8?B?YVhtMU13YkxUdkdVd1czYmNDOUV2MmpzS1VROEt2RHV1SzIwT3VJYXZDa2RK?=
 =?utf-8?B?ejdWOUM0YWtvVjJWNUIwazlaa2g4Q0VZSXBERFNRYi8rNk0vaUlUR2ZiVWpR?=
 =?utf-8?B?RDg1MjZOUG5PQmJxRUQyNFZBVHpnVU1FSTBEK3o5cXduZXNXN3Q0QUQ2MkJ0?=
 =?utf-8?B?YnhEVEhncWs3NlBYNHl0NjhBZkQ1MDZaREwxN0ZOOTM4RmRoWWZqbFFvUmJz?=
 =?utf-8?B?eWh3NE11dUdQc3YvRXdLTlNsTmxNWVhxYnRrRGF6dU1ScHl2SytZU0V3R2FM?=
 =?utf-8?B?OWdHMHpkNk1QT2RRTFh1NUFkdG5ER1M4ODRZMjR3Z0NLYWIwb3Q5Q0R4ZkdE?=
 =?utf-8?B?Ulk2QTkzc2R1MHlOOVFVcW1neVRzWmN0TlF4U2lQZUF1ZlE1bHM4eWJyWUNN?=
 =?utf-8?B?OE5sai9QVHFEWXRSWmMzdG0vQU00RVQwNWE2Z0VOaEs2TGtLR1BvYzhPc1BF?=
 =?utf-8?B?aHhlQVpGNTdWTGtUUEtQdGV0QTdRMWJjcXE3OXVuRTl4anE5UVMvMmdaSmV5?=
 =?utf-8?B?WTg2bStiekd0ZTYrVWVQVys4UGtNRWhIL1JmQkd1M1lFMzhWV2NUMWtkbjcw?=
 =?utf-8?B?OGJCZ0c0Y3lXOVgwam9JVmJ6clhCMkZzYW1oeVJPRnBnVE1LdGRzQ2N1ZU1j?=
 =?utf-8?B?TmIxMGpLaXJTSTh5TXFJUmRqSnd2dXd6Tkd3dDgvU0hXVzROZWI4N1pxSEph?=
 =?utf-8?B?WCtWMUk1S2RJOTRyZ1hRcW1ZMWhPNTAxN2xWNUhYUm1rRFh6Ti9PYXB5QnRx?=
 =?utf-8?B?MCtjdGtVZHBua1ZkYW91YmVyU0lXVXNWOW9GMWoyMXNsZkFNUS9KQXN6WG1E?=
 =?utf-8?B?Z01nS1luKy9EKzBhVC9nTnRCdjhFZFROZ0dVb0FzQXZ4ejJIOTEycFMvc3Rx?=
 =?utf-8?B?WGRFQlNISHJueHo0SGFIZ3B6b1V3OUYyZ3JOdE5RYVYvVlc1T1RhRVNCM0hG?=
 =?utf-8?B?WUxhbnBxOWQvT2pCN1dDVkIvRTR6Sm85emcxWWdESnVTV3lyN1h3OHhkNUhy?=
 =?utf-8?B?d2g0d25pYmJXaDlMUnFoNldFNW1zQUxlL0g3ZWpFTUNabUlRQ1oyRkJHTVJQ?=
 =?utf-8?B?UG9RYkhSOXM5NjVZemtISmRGSzQ2OVNSTWI0dnhmajRXTDlVVUxOSnNwL0xh?=
 =?utf-8?B?cEFhRnJUUnN6eUUyTTFoZGVIUU1tL1JvVzdsVFdVYjFoWkFBVkUycjVyUUJz?=
 =?utf-8?B?NnFQQy9ZMTYxUnFrWXlYRE5FbjBKSGdYakprWFM2aVRQSEpVQjhQbHN3YlpB?=
 =?utf-8?B?VUcyTWV3OGY3QUZlVjJBdzdJaDJWWTd6eVF4NDFpQTdtb0xmK2F3ZGhvb0lk?=
 =?utf-8?B?SUcxb3RjRkRMc1MxODRuRExRVy9TaC9GLy85Q1BpWTY1eXlLU1d2NC80ZTNX?=
 =?utf-8?B?b3hVUzhIS0xlQWVxc3phanB3SEROcHg4STVnUkkrZDVIRlBjMDNFRjNFYXpu?=
 =?utf-8?B?K1QxQUpMbkVXM2FqY3hIU0pIN0NvbWlBcTdmVFdvSVdORG1vNnRZUWJlR1Aw?=
 =?utf-8?B?T0Y2ZURtbkZJY2ZHTlpwR1U0cFF0UzY3akZSdkdkSys1a2tEV0lIdkp3QjBS?=
 =?utf-8?B?V2o4UFhNdkNBZVNzc0NQK0xOYTI4TnNWYmRnbUlYZ1YxUHNzQUEvUEF6WFA0?=
 =?utf-8?B?eWtEZmtVRmN3amVac2NCejZnRk9BN0VnQUZQZGYyQzBLcHJxbEVrZ1JmbWhO?=
 =?utf-8?Q?xQrqs9DORW0M8nVLwExXBneP8TOCeaeC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejhNT3IxVlQ0WnJLeDRrdm5LdGFoWHFJbTlmK1UzcWNsT1ZjRVVuZEVjNzdG?=
 =?utf-8?B?RW8wSUtkdE51L0RmN2g0YnlwZkcxa1JvVCsrQ0hjNWxYTDEzL3c1NEJYZU5K?=
 =?utf-8?B?bnNDQnFYS2lhS0xDTjdnK1JZdDVvaUR1QzE2Y0FYRU44RHZJQTU4Yi9YSGRZ?=
 =?utf-8?B?bE8zajRFRXNTSkZGMVdmMWl0ZzVDaFowZG51eFBCWnk4QUtkcHF3RzVrS2Q1?=
 =?utf-8?B?WlNQOVNmaFdReGROUVRtRlFFYmJmNXZpOVptRS9QL3VBaUZQNzFjTXRXcG5F?=
 =?utf-8?B?cVU3SDVwelhGcUkwNTVPMWs1aUJKNUFiVXcraExKbnVWOXFJWS9lZWlTZG5B?=
 =?utf-8?B?bGxFV3p0dUprMEU5b3pWMUxQRW5pTTVscnh2VjV5R3BMa3ZpQlJWUG02M2sx?=
 =?utf-8?B?Szl0WlV5VDVMYjU3ZmRIRjJ4aHJNNXZJVWE0TzF1MWwwZHBTelVzR3Q4Vmo3?=
 =?utf-8?B?V0V1VDFxRWsrZDE3TlFxTXZTNzdQamllTWt2ZkZYR1FNTDkzaUR3QmFlWndo?=
 =?utf-8?B?dlBwRzg2L0YzUWI0eWUzUjJPNVRPU0l5QnJBK0t0ZUVtM3RIelNGRXRJL01l?=
 =?utf-8?B?ZEJ2MzQvcEFiREpZbzh0TzA5OEFrSCsvWWtMZFpybGx3YjR5YVpHU3ZVa2F6?=
 =?utf-8?B?WVVGVkp1NUc4VXJFK0V4QUl4c0l4dW0wSzE5MWZXQXBxaFkxRFVUZlk5c3Bz?=
 =?utf-8?B?aDNnSVBJRjFwU1laWWVldHUrNFl2Z0NSV0I1WDNHTSs4dHRqMnl5bVpYYzJQ?=
 =?utf-8?B?aWllRkFaUElNMnVzSzF6QU0wT3dpMVYzZE9uVkMxaGM3QU1vZ0F1QklHOHZ3?=
 =?utf-8?B?ak1rU0JCbk9CTnVyUUlWQjJ3L0hiMzBIdTZod2tYV3A1bXp1L2hIMXVJYmFX?=
 =?utf-8?B?UUhRdlNtS3l3U2hTWC80N2pYU2ZReDBGa2FNQ3cyNnlTeFFFeDI5NzN0akdY?=
 =?utf-8?B?TlA1dVcvQTF0WXZySG5wWnVTMFYwbERDMU5WOE5mdmlicDU1blFZazk3RldT?=
 =?utf-8?B?UElRdjZJMGFuUGRJY3ZRRHN5NCtJT2U1OE5Kb0I0RWUzLzVUWTU4eTAzSi8z?=
 =?utf-8?B?angrRkVyZEhZLytTdVBMRXhLcCsvWXdoUFY2UEJ6RGYvaUptbWhuWXRWTHNh?=
 =?utf-8?B?VkFUZ2VPZ04yVVFIZUhpSk5BNkcyams2Z1dvLzh3NUhKZStxcExXMlU3bTcw?=
 =?utf-8?B?TUZJbVhwS3pKMXNML0V2SHh2T3FnWDhZcEY0TXlTU29QY1pqRWR1TUFiV2Vq?=
 =?utf-8?B?eU1WS0J6QW0rcE9qOFowRFp3U1RZdklaZy9IQmQwMDdHcXhYS0xQU2NoSXVO?=
 =?utf-8?B?b3ExVlFlOFlQV3c2a1JTSFd4LzVnWHlFVnhNaC94RFArbkE3OHdITStlK21U?=
 =?utf-8?B?dmRyODJSdFF1bnpsWFFSUktiS0VFclV3SEJJeDlIN3hQN0owcDFsaUpQOU04?=
 =?utf-8?B?K2JONWk0VlpyZUNFVWtQOHNGMkpXak5heUtCWk1BZGdwYXl4dGRDZUZLNE9o?=
 =?utf-8?B?VVJ4bkJuR1ZrQXNuYmpoZUtEMlFsemgyc1FHZUpEKzZPUjRCbXkxdU5TcnV0?=
 =?utf-8?B?L09xZ3o2Tk5ZYUN4SVJSazFlTkh1UTJrUGNNQTZVanQ3dVdmY1ZPWkNUQjI5?=
 =?utf-8?B?QStGMWVyRW03V3pPK0oxbHB1K09SeWExekluYUV6NEVGdTZmZTAzQzFNK1lk?=
 =?utf-8?B?VGVGMXJSclJrT2ZuNzF0UUxFcUM2ZkRtSTJzNzA1VHg5T0JiaHJQMnU0Z05s?=
 =?utf-8?B?MFBHVkpFalZUanMyMjloM1hiZGhFUDJieUIzdDlZWWJmR25aa3V2ZDkyYlQz?=
 =?utf-8?B?QzJ4Mi9sZnBZcG5YSTdyUjFSN3pOL1RjK3R6NXpibFY5UWZ3R0xwVmZNQStV?=
 =?utf-8?B?UGZnWXZxWXNyNlFGVFM3WURyUnBBQS9oYkFNd2NrNkNsMVA5ZmdScUlzb1VC?=
 =?utf-8?B?Vzd6T01uZExjN1F1dUIxTjBZZytVSDFuUEJzdmlPelNwZGZuWExqNHhaTVlt?=
 =?utf-8?B?UmtUMmxWUHBZcWFvbUUzSXBkdUVFL0lKanhNbllOWHlnRTYvUnFIeTdicm54?=
 =?utf-8?B?WTFDTlFhQlZHWHJnVEx5MFp6bkxJK0RXdTRCSlpLbTVpSnVXbnhUY3FTRDFo?=
 =?utf-8?B?MFVVYUIraHJqVkRoaW9vTzlZOHY3bkxmS2lJOC8rZWpENk9BbHJyZ3Q5RmFJ?=
 =?utf-8?B?TjFOVXpXTS8xLyt5ZlpoQlYwQTR3WkhBVTFFcHB0QU1oM25Pd1ZVWjNaMmN3?=
 =?utf-8?B?VGE2YkZINW91TDRBYmRlNUZMbUs0NEE2Q2JZMlUxZ0xzUUFxZFNDbkt2TXA4?=
 =?utf-8?B?RjlHVzRzVkQ4Y0FsdFFHaDV3WTd2Tlp1T2t5bnJ3bzc1b1BuUlE2ZTl0bEV5?=
 =?utf-8?Q?XpC5WqfPBR+/Ttm+8Qgpemx+nzK/Qx03OfASGDYgE0yq3?=
X-MS-Exchange-AntiSpam-MessageData-1: Tcz5S36WthZ1xpV9NHRGj84/daLgWIc4CEE=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f8ef40-49fc-49f0-c086-08de48188b3e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 02:58:58.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+ILoJ9N7k6f/wVAXEisHLaAVnsqLz87/GVVGAo9a7LYpLs/cofPAK2d5s9i7PkyTIGPrfHWUfOQ7U6to9MAukHajdgMmIxpizgH1NaphO8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8468
X-Proofpoint-ORIG-GUID: b-852V6HnT7smKSu3dcSmAL51E5xkArZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDAyNCBTYWx0ZWRfX1d5mERoxSTsn
 fuH5irSr57WoANUfXEhwoRKwa/TfBIL7jQn9nZJklnJRLhYyj5BTv9Tq0koNYu2BEnTu7iRwbBb
 IAanLTDiAdpHkGKusTQH3WErx3oWz/YFBZZ86FiRUYSzjMUFfU48I7KsvmOoIr1BPBBmegoCA6s
 jZvhlbaZKARmqiLxv6lIh/ZXW39yTGKaVx0wt1Y44HNb6EFPUhHYy0o4uCf3Sz75xN4Nedt7Av6
 u8p9kIVUjWJJX61UsiqhJ9Pp8fkbuCC+PJCbb0Bk4DBvYDoUUrcgnetd7ZaS8GehDDLoJzC7qwN
 Qb/dz/s5/vmkHVpACG3LKxt73GlCNNRxlUVsju73jmTYwvb+E2W0nSFhxWra+RAGIyPn9IZKVxR
 8hnmMvInjf/aIsn8IO+C/ysIMWK520HIjDm0g/8thCxh2Uhfcf9m8ql3O2zO6Yvu8jFmlVmNIsS
 EGT+BUeNQBC7AhNe2KQ==
X-Proofpoint-GUID: b-852V6HnT7smKSu3dcSmAL51E5xkArZ
X-Authority-Analysis: v=2.4 cv=bN0b4f+Z c=1 sm=1 tr=0 ts=69549174 cx=c_pps
 a=s0vAXdo1X8BWGfCUIwR35w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8 a=MxqcCnS_kybLuVMGrGIA:9
 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310024


On 12/30/25 02:55, Sakari Ailus wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> Hi Xiaolei,
>
> On Mon, Dec 29, 2025 at 10:30:17AM +0800, Xiaolei Wang wrote:
>> Switch to using the sub-device state lock and properly call
>> v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
>> remove().
>>
>> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
>> ---
>>   drivers/media/i2c/ov5647.c | 40 +++++++++++++-------------------------
>>   1 file changed, 14 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
>> index fd69f1616794..f0ca8cc14794 100644
>> --- a/drivers/media/i2c/ov5647.c
>> +++ b/drivers/media/i2c/ov5647.c
>> @@ -91,7 +91,6 @@ struct ov5647 {
>>        struct v4l2_subdev              sd;
>>        struct regmap                   *regmap;
>>        struct media_pad                pad;
>> -     struct mutex                    lock;
>>        struct clk                      *xclk;
>>        struct gpio_desc                *pwdn;
>>        bool                            clock_ncont;
>> @@ -652,7 +651,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
>>        }
>>
>>        /* Apply customized values from user when stream starts. */
>> -     ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
>> +     ret =  v4l2_ctrl_handler_setup(sd->ctrl_handler);
>>        if (ret)
>>                return ret;
>>
>> @@ -807,15 +806,12 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
>>   static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>>   {
>>        struct i2c_client *client = v4l2_get_subdevdata(sd);
>> -     struct ov5647 *sensor = to_sensor(sd);
>>        int ret;
>>
>> -     mutex_lock(&sensor->lock);
> Note that you shouldn't remove mutex_lock() here quite yet -- s_stream()
> callback won't involve sub-device state and thus the caller won't take the
> state lock either. In other words, the end result is fine after the third
> patch so you should explicitly lock the active state and remove that in the
> third patch (see e.g. v4l2_subdev_lock_and_get_active_state() in
> drivers/media/i2c/imx290.c).
Hi Hans,

Thank you for the detailed review and suggestions.

You're absolutely right about the approach. Using regmap_multi_reg_write()
with struct reg_sequence would indeed be cleaner and result in a much
smaller, more reviewable diff.

I'll revise the patch to:
- Use struct reg_sequence instead of struct cci_reg_sequence
- Call regmap_multi_reg_write() instead of cci_multi_reg_write()
- Keep the existing array initializer values unchanged

This will maintain the same functionality while making the conversion
more straightforward and consistent with other driver conversions.

I'll send v3 shortly.
>
>> -
>>        if (enable) {
>>                ret = pm_runtime_resume_and_get(&client->dev);
>>                if (ret < 0)
>> -                     goto error_unlock;
>> +                     return ret;
>>
>>                ret = ov5647_stream_on(sd);
>>                if (ret < 0) {
>> @@ -831,14 +827,10 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
>>                pm_runtime_put(&client->dev);
>>        }
>>
>> -     mutex_unlock(&sensor->lock);
>> -
>>        return 0;
>>
>>   error_pm:
>>        pm_runtime_put(&client->dev);
>> -error_unlock:
>> -     mutex_unlock(&sensor->lock);
>>
>>        return ret;
>>   }
> --
> Kind regards,
>
> Sakari Ailus

