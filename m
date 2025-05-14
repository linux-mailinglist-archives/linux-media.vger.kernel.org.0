Return-Path: <linux-media+bounces-32463-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4BFAB69B6
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 13:21:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2ACCD189F748
	for <lists+linux-media@lfdr.de>; Wed, 14 May 2025 11:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFBAB270ECB;
	Wed, 14 May 2025 11:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="rhdcKB5b"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020096.outbound.protection.outlook.com [52.101.167.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486C1225401;
	Wed, 14 May 2025 11:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747221682; cv=fail; b=bvYs2wXNsjI0jGJr1HpyjSDzzu9R3oooaQ/FZH7xLBTL/QmhZYc5aPLaisq8+hB2KhTzRaYYBeoZuCFzgcPeiovSc81ZtQVKRSr7nYJUduk2FLoApVzAAm2joAOz8a6aWSD8VnjNDhg5Q3zyauuQ7yXbTtC8n00A61ej3U47s54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747221682; c=relaxed/simple;
	bh=jtE8k7/Olsf9MA1knjlUL8c9cLJXywrO539dFfLFCtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YnLf3lh0MX7QaT/KXs9ulrVQ8gUuGeyeNmVA9Mr+YTPPN1DbqQg2t5RyZ28ilm9ytq9r6AW9FK7UWIIxp/UQLiFQbGADG95QKxb/j7SY+WJa7uo6M1xPtnGlThuF0QhSvBR81IDaoUUWwBjDa1cqfdtlYvQEk/1tiXXsrOAIieY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=rhdcKB5b; arc=fail smtp.client-ip=52.101.167.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJ8lPQE0nnbqLxKC/jSam2CJCvQ3Czg8A3Vwpc7lJxIc17QbFdSkRywA06duLKlzbTWoea9Xezvw8ca+U1JGs2EGivaSNUt00i5vkip4Kp6fHLwGThTjTUw9Ih3g2s3f03w6b3iguDGap1SVARkn/FJVbfn5yjI4yT3Ho842RyS1cAsBBPCvHNDz/VwvOsFDf0NEp0qnPzC7yAWQdRoUcshM+365FrnLSOV+t8rFWRzYjCInam8D286WcFdJmLuVzukv0hXqoOt8lJbpzcWqcn+Vi7XJTIDAx2FWhlALckH5QQIgfxOYWFBnE7lxa1OdGPUXOJIgT+Q+CXR1ZSWn9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az7tom4m+ddqvzVm0oJSqTlTLWwqR6nip+dT99gnTFk=;
 b=HlFA4Y5Ji1Q6wzKRlH3nq9VMkZ5sdpCCf8lxj/NRqlR+DYeUtIydmtTEWiol8/PMOS4JDBPcYMEPzSNullanHLKHQbmVxz62HHauDYbV2rKQgJDJ9Tvf2PeryRB4sEq5MySdhCiGjeirEh9MjxGlkLXYzz1or1fwUDOtSIWWbGj8mITlm1qE7LkWQ1Tc8lfgPH6avPKWnBeBU4HnDY7gB9zmw4T1qN9x3TqyyVy43p2BHbx55SlgCftqxnVYIW3YRaYP4dsXVnhQvL6OkRgp5BZVi+W/RD7mWCvAL214iyLf8/uATcy1cjlEckDkO5ovpyGhDIHzATuX/CiLICPdKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Az7tom4m+ddqvzVm0oJSqTlTLWwqR6nip+dT99gnTFk=;
 b=rhdcKB5bHKoHRCZIXa6lHCvVH5l0c2byNRf40q8tyIM1A1aKftjwFtjb+9d7X0nRCtNmFJ+NL8KqGNUqIpZAaDP8Jr0ztdyWovOjoh6gmRA++/z6eq9Tm9q0XpQX+Ue/EiY/g77HsIWzNALCvu3BQKJkX78/deBDsob8nepSY+Qkj+UkdPm4aSLlF8wUb6a92hbsh9ZZCfww8E7o+dQ824WCbV8hVkJ4M1aEZxvqQ1HgXk/C39DJvg0fnU9kV/4+YECNcseSGM3AwFm4iGmKaZF+QAkH8TeVtWj8p5VCb0JE6hFcjnzQOe6rg4HQQctvqqZPvsXALj9LZwtYAkISLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from PAZP264MB3150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f5::16)
 by PARP264MB5517.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:3eb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Wed, 14 May
 2025 11:21:12 +0000
Received: from PAZP264MB3150.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b788:2428:7413:232]) by PAZP264MB3150.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b788:2428:7413:232%4]) with mapi id 15.20.8722.024; Wed, 14 May 2025
 11:21:12 +0000
Date: Wed, 14 May 2025 11:21:11 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Tretter <m.tretter@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Rafa?? Mi??ecki <rafal@milecki.pl>, Aradhya Bhatia <a-bhatia1@ti.com>, 
	Junhao Xie <bigfoot@classfun.cn>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Kever Yang <kever.yang@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Uwe Kleine-K??nig <u.kleine-koenig@baylibre.com>, 
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
	Ricardo Ribalda <ribalda@chromium.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH 4/5] MAINTAINERS: Add entry for allegrodvt Gen 3
 drivers
Message-ID: <fhbmpfvz3p2c7pcdboopy3fm3s333jddy3b2cbodtfmsibxqps@mk2f3l43ryem>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
 <20250513083609.328422-5-yassine.ouaissa@allegrodvt.com>
 <78dd8b8c-6762-4dc5-8984-52e19c4453bd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <78dd8b8c-6762-4dc5-8984-52e19c4453bd@kernel.org>
X-ClientProxiedBy: PA7P264CA0173.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:36f::9) To PAZP264MB3150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1f5::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAZP264MB3150:EE_|PARP264MB5517:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d86254-f1bb-4e2d-5b4d-08dd92d96f09
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?OWoxTjNqTmlrQ0F5aERJVXNBS1A3ZW94YittY1dlYjNTUzhvWHljMnZodU9B?=
 =?utf-8?B?cUtWYVZoMG1TSk1UY0lCalNib0hkUk45YVU0SlhzTEpiVlFEdmR0alNLeDdo?=
 =?utf-8?B?bUh5UmdzaE1USDlLYXJTSFI0VTV0dThWelZ2a25QRzhkUGhOc2Ywa2JQUjVX?=
 =?utf-8?B?TE5HaXZJcXpBOU8vbEJqbEVJeXNSSlMyYURiR1RUMTdpbTRxOWFYdkZOeXU2?=
 =?utf-8?B?MmFYT0E1OUpaWWpYUjZJMDhLNWdudzRRQzZsVXM3eGYyVVp0bHFUVER1Ukty?=
 =?utf-8?B?WFoxYUlEYjgwL0VZczhUT2dlOUJEVThNaEJVdHBzSUhYTzZGeGtwZWF3aTBQ?=
 =?utf-8?B?eXhkREpwWVN6WmIzcTR1OXptMTFlMTdDOE4rckxCb0ZnQ2Qzd1cvTkdJK1Vo?=
 =?utf-8?B?SmNmMGNwTTZZbnZyeWNqYWJGQWhmc3o2OTYxb2EzT1g2WHM2TDVXTkVKWGhE?=
 =?utf-8?B?QnZUTEVBZSt2MkZOd1lPaW0rTlZpQVZuckFkN21FZW96S3U0M3E4NlRoSmJP?=
 =?utf-8?B?U0s1SU9vQU5aWFNTVjVxK2taVHU1RUJuUUxxUTZOWSttbXEvOWFQN1N1MXBJ?=
 =?utf-8?B?RWI0QWJHUUpER2hsZWE2bGZaRVhaYUdPK2FBV1k0WmFrMDE0TkVNejM5NVg1?=
 =?utf-8?B?ZnErNUVWN0lhRy92eDZwMXVIajZUR3l0SnQ1aXBOVWNFdjVoTW9GenB0MG1N?=
 =?utf-8?B?cTJHUk5XdUg2WE90ZFhLV0xLV3FleHNCKzNwWnVBUHdCQVFBSWlERjVXOWhE?=
 =?utf-8?B?L1VqK1lCY1JxVU1uR01GQ2VNSW1uYmRwT09iMDNRS0xRN0Jpd3Rqd2RQRkFs?=
 =?utf-8?B?dkxQcXMxM0FRdzkxQWhDN2NQS2YwSUV0R1p4YjJ0NWNhSWlvUTJsNVNkT1FR?=
 =?utf-8?B?Y3BkWG9JVkVHQmhxemJMWWxTSnd6MEQ2dkcwc3lWU2hIVndPSG1mU0JUVC90?=
 =?utf-8?B?dEpmbGpJbE4zbm5oRGtLNGlEaHdZL3VYS2ZYMlNiOW1hQXFNSDBDWktRZDhz?=
 =?utf-8?B?b3NrUnhHNk5qQjA1VEh3ZlErS3FIb29DcFd6Nm9OeW0xMnlBM0h1cTFDck9t?=
 =?utf-8?B?QmQ0VGJISUdSeUhwSHlyMWhyV1R0cHl6a1p5UUJKSnNFalY1S250b2l0aHkx?=
 =?utf-8?B?Umx5OUVzWFYrVU5VeVpXNUhrVU9zZ0FBdERTTExrSTFuZ0lFT2tyK3BvcjY1?=
 =?utf-8?B?Mm9QRDhyZkprT0s2Tm9pWU81MkZFc3Zza1dOdUhXUmtza1Q3RmpzalJWK29Y?=
 =?utf-8?B?YTh2aGFUNTIvRk1kbG00d2JuRm85NHVnb2ROVERpQmpYaGp2RVRQbjZQQ3Fq?=
 =?utf-8?B?RmZVd1hKYVFqY2lrNURnNTlmeU1Ic2Zick1MZFdZYU1KYjRrakFZZ1NSMTlj?=
 =?utf-8?B?UlVwR3pqc3dPUm5xL0YwYUtqeFN1T1JwQ3hmNEtidXg1ZklmUVlLWFdrSXZk?=
 =?utf-8?B?bWFVY2dLZ01QWHBSS1VjWTZZQlUzeG56MDcyWVk1WWRRODVKMFFZanh4OUt1?=
 =?utf-8?B?cXhDUDgzZnFkemkrbkVaUGFlWlQrdFFUbzNiME5kYTI4MzZVNmxib1dERUFs?=
 =?utf-8?B?TmhWemZ5cVJnK0tFekxpSnN0NzRCZ1N1d1VoTUJvTE41Z2lFRXZhZUp1bE5h?=
 =?utf-8?B?NXJEMEVLOExDQzVNZ3hiV0ZqalBsZzdtVzhWakZHNE9XQk8rSTJDeDJmUzRU?=
 =?utf-8?B?NXliQWVqamlENjFpU1BhZWtzODlPQTRLOEVJRjlZVDZJcWJRaHY1RmZMckxV?=
 =?utf-8?B?SGNodWdFUitiL2NDNXI2bmFUS01TQnJxMXJvbHA3YTVPa2Qzb051U0NPV3Vo?=
 =?utf-8?B?T3hESDVaRHdYZjAvZVY1MFhCVllBbGcxYnJYOStzVlM4K3pHcHBnZG80NEpL?=
 =?utf-8?B?QitBbWpTUkFXdm5YUW5OdVVUbDZyNUswUEFhUGFYMGNMNjdQeGxrcWtndllh?=
 =?utf-8?Q?3alrFSP67ho=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAZP264MB3150.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?ZUpyY1B1OGFIUmNEVjNsZFNBdnNmTVFBK3FMK0V6VXJxb2ZKSEJhTzdvbmVn?=
 =?utf-8?B?QXdJZC9qaE5SZGtSODcrWEI4RUlzNWRtOFB2cmwvL1hENUtrZHRlQ3JkK01O?=
 =?utf-8?B?WFcyeDgyZlZQN2s3a2JNUXNqT0d3VGdOSjlHeGhCL2ZrVXJxT0lCQ1E5YVBw?=
 =?utf-8?B?NzF3UGNTbnpYdDU4bXNWZGtTdytIRk1qS3hDU3hkRytPaFN2SWFHS3Vkd2dK?=
 =?utf-8?B?Sm9MMThJV1EydUZRVEVwUGloOHBNQ21tS0FGeDJleVFOMUpVR3hET043bVo2?=
 =?utf-8?B?V3l6UHljbytWbFZpWHEvQkVUbnc5UjV0K0tMTjdiOU9ZWC9meGx3Vm14YUU3?=
 =?utf-8?B?dndBeFdDYldhd29kd1FaWEpWeU8vQlBzaFp4S1dEQXVDVDFGWGZ3VTBnT1Vt?=
 =?utf-8?B?Zk9KNXBLcE1qeXJ5ekxjTVZzOTNuZkJwZFdndW9FY213VnFZNGhObTZoczJ2?=
 =?utf-8?B?UWZXWWNpblEyWHhicndHNkdyZHc2MmJNNFQ4ekdPZnViZ0pJTExlYUtjQ0tO?=
 =?utf-8?B?dlhtZUNpTDFEVVZrSmt5b2R5STVPaHVsNE8vWUpPL3d1T3NhMkpqWitHQ2hu?=
 =?utf-8?B?V2czaE1GbjRUUCtveTVSS3IvUjBtVUduTjh5ODVoeTc0akRTd3dZQVF3RXpN?=
 =?utf-8?B?L09nODRvTFNXbmk2TGIxOTR3dTRIZ09xZG5udmJrSnM0NUxDZnlSZmNLbkRS?=
 =?utf-8?B?VUJUU0pEWGFqSFpOb01QYWgvVGV4djVVKzFiWTJEUDM2YnhMK3pZMVNncFVM?=
 =?utf-8?B?RXZBTHJWeEVwSjNOV0dmMGJUb2MvQUFISmN4OUEvL3ZMSDlrL0lOYmhHdlZE?=
 =?utf-8?B?cXl4Tjh0eFpJU0pXZWVYUmZMZTlvWXNZcE4wV2F0Slk0TUEwMG55QXBvV0ZW?=
 =?utf-8?B?Q3lFZ2lUb0JPempBYVZVeEluS1hoZDJOemplUE1wdWZ3K0VDc2E0SkhXejBJ?=
 =?utf-8?B?SXdWRW1VZ0JqMXhXSDd2RG5nZ2tKYTlIZmJaTWcrZ3UvSmd3UFZHUXc0eTJU?=
 =?utf-8?B?K1hZVUJwNlBXMnBhREZNUVhiKytaUVdXUCtVV045TERrdG9OdUFLdEI1YXFj?=
 =?utf-8?B?Uko4WGdJTEZHamR6UGJjZW0zMWdGMmhwNzRrcG9oSTY1NzhCN1ZDVzF1eEpr?=
 =?utf-8?B?bUgrYkZoL3pNTGVWOU1GM1pMdGVURWFlZ0cyZGVwaWdZVVBJaE0yanp1Yk9F?=
 =?utf-8?B?YitjekJOdEJIWmxSMVlMRTNXQTdmWGhMTlRpend2ckNyOURMaExTOHlMQmhn?=
 =?utf-8?B?SWFjeWEwZWFMd0ZBd1VWMXoxUGJsNHQwWjlnbC9qVjJsT1Y2K3BKYjNQR1Mv?=
 =?utf-8?B?Q3g1RXFHK2FJSnJVaDQ4S3h0VVRRSHdwZkk1U0ZlTjJBVklDenFZbkR6UU1S?=
 =?utf-8?B?K2hvVllBbVE5R3pQWFJ5SXF6QXRSL2xWcG9oMncrOXNLRVRGL2pPQXFXTFVX?=
 =?utf-8?B?cHlsTzZST0RXVncvYll4cEg4OXlDKzdteU1CNFRwNkVvSG1OdXRISVp3OWg3?=
 =?utf-8?B?a3J2Nm5aK0k5WnB0ODdaTVk3NFFoQ1BoR1YyUTg1TGNhOVl4ZGgvbXkza003?=
 =?utf-8?B?L2xFSFlFYStnZUVtL2kwamRHNTd3a3laR080QmRZNmw2TDU2Y0VkUjlkZThy?=
 =?utf-8?B?a3FId255VENFekNHakJzUkpsdG96WDVDY2l1cWp3WkFIczhzRFJpZTZSTkJ5?=
 =?utf-8?B?Q3N3YTBMQWcwUnA5NGZ2cXVXZmJuVUppaGJlUFBHOG8xRWFValkwd21uT0dF?=
 =?utf-8?B?eFdnTjVia1BZY245SjdRMXFlaEd3T0tiSXgvRUlBZkw3OHpsTlVTTHZyTVdq?=
 =?utf-8?B?bGlYSDZkQkd5TVNsYVJnRkFWMXNYL0plS3NyNCtiaHhtd05ZK09tcUc1MXlp?=
 =?utf-8?B?TzhOUmNRZUNBZGYybS9PdWRKdlprMmRvZXdYMzRXdG41UFc2UEZXN1F4bElV?=
 =?utf-8?B?Sk5QSjQwNUdLeXJ0cnloRTl6NmhkenE2Ry9rK0tNc0MrN0Z4NUJ3Y2ZBRUJE?=
 =?utf-8?B?VU5weHl5L1FlSy8rQlhOMHRuclZXL0pWMWVIQ1Z3UDdzazNUY0F2cEJYdXJ3?=
 =?utf-8?B?azd2Yk5NK21xUEE2S2swSGMycVBSVmo4ZkRYQUdWM1N6QkU4WHc3L2owMWFj?=
 =?utf-8?B?cDFYbDJJN3VUdWI1YkpkWDl2cXNmN21VTUtNclFGRzBENlBzRUhBMG9aR25P?=
 =?utf-8?B?bEE9PQ==?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d86254-f1bb-4e2d-5b4d-08dd92d96f09
X-MS-Exchange-CrossTenant-AuthSource: PAZP264MB3150.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 11:21:12.7125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 71aUbXq2hjVc37xheRlxGVIcKEI2L5UagqRJrQLcPOx2XU9y+qLdxB1NU/2PnAxgAKrpDmuHGrHkJQIeoPmysXZDkAtltVHpvrA1mU0j0EI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PARP264MB5517

On 14.05.2025 10:03, Krzysztof Kozlowski wrote:
>On 13/05/2025 10:35, Yassine Ouaissa wrote:
>> Add my self as maintainer of the allegrodvt Gen drivers
>>
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  MAINTAINERS | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index d81d2756cb2e..8912fabab6ed 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -802,10 +802,13 @@ F:	drivers/platform/x86/dell/alienware-wmi*
>>
>>  ALLEGRO DVT VIDEO IP CORE DRIVER
>>  M:	Michael Tretter <m.tretter@pengutronix.de>
>> +M:	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
>>  R:	Pengutronix Kernel Team <kernel@pengutronix.de>
>>  L:	linux-media@vger.kernel.org
>>  S:	Maintained
>>  F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
>> +F:	Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
Hi Kozlowski
>
>Before adding yourself as a maintainer, can you please read the
>submitting patches and other kernel process documents? You just bypassed
>previous discussion by sending the same which is not acceptable for me.
>It duplicates review work and hides previous talk.
>
I was not ignoring your review, i just made some mistakes ( creating
patches and some error reported by the ci-media).

>Best regards,
>Krzysztof

Best regards,
Yassine OUAISSA

