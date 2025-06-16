Return-Path: <linux-media+bounces-34870-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 57662ADAB06
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 10:46:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 236243AFC5B
	for <lists+linux-media@lfdr.de>; Mon, 16 Jun 2025 08:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0270A2609E1;
	Mon, 16 Jun 2025 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="GsgcUbOO"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022093.outbound.protection.outlook.com [40.107.161.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD5F188734;
	Mon, 16 Jun 2025 08:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063582; cv=fail; b=qwVbfZjwuv/3cLjbAT997SZDrKLTLYkLIzC7g3X3U8LNKqWPS1im5+ypsCNWz5lpgraqLWC6RDCi0ENzTKOGJ7+Musc4TZiA+yWRsQbyqihTbrDx9VdVi+6CdW2NoPapfNurmWCW67Ck+NRonZ3VR5k2ojKml4O+VcQ2N0c071M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063582; c=relaxed/simple;
	bh=OtxyUGi5yS6MM2VfoLyvFpFCj1Yq0PjC1aXtrW+j0Bs=;
	h=Date:From:To:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Gg/lqYQBYZungH1tuQ9HMmZwiwJNOsGfUYGvBYPOy7i/ZDEZSqtouvbTET93tKXzI4vpd5nSOPeEc56fM1e/qyVX6FbaszGdpQyEyTQIr7/h/6h1XQcy1QDj76gsf4qdEcrCGFhUcdDNMQ/cCYImEWUWgf/6HLHilK0O+jvV8Ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=GsgcUbOO; arc=fail smtp.client-ip=40.107.161.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uONR+tuCql0Z8Rclt9XCMfIAngM8J5U4sITLtL5ygVcWBqLzj3x5w02TSY0swi7xXhPDXkbUKwAtHb6hJUBs5/4zTci8GjClLNOG5ExOai1GiRvreHoo/cUQyFSKjUH0gY1ILN+F4ZEM8kiDrN0595nQqU6CvHgQxX9cp2ZkH4eZi7Kx/8ZaKNhXEYsmYQQsZEWFlqabXRBw2CdeSd5H+brbAzYRISgJOC21RaEiwqEyYpNG/dNZEW/R9LCnmlnQ+CMqgO6txQ47WSwGp+a2b2viZQkmku0K3CQrQ4F2cCLpuNQ80/DQ3X0fgQa4dv/rY2OciV04ZgStKp06Dlo+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLdPB3DnLAdHvvLXnmM/UD9FKYMWBAsf7A4HSsOstJk=;
 b=imq/v6/u9G2ZcMqBfcvbdyZKLT6H9v4mkHtrat39uMh1igJF3GxPd0w7xwbhUrzO4gcEREWf/V9+gYg8jk5J5rKcgb2Mu/d6ifNOazOfN2Plpwsy8nafox0s3wgROK38Dtg4lfgkLIrU+vyXCLiy/LNJ3IBpAo4xnh09/LciDOkjy45uZxxqTl0hqn0+vUPQWDUeqfJzOmVmrVCtYB0NUyv1sqwF37mCQRz82z/yIqpMCxsc5zqjSQ0hKdGPsY2QjDqp04e05GuZiT1GXEAeDdADrZf5yS8UBQZRLs/lwldWDYRVhcpfYPQnDLT26JwT/X34qdVWY/pqNsrQhXs7RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLdPB3DnLAdHvvLXnmM/UD9FKYMWBAsf7A4HSsOstJk=;
 b=GsgcUbOOy28NNzLRlQEF5RWf/VPhayh+GEiuNUrKQYZC/XJ69HPZ+dHcQ0P0U+hIabxBb3Ua0C06oSkIo8rye31AoKxVKztiHjnazSEWLTUka5qHmyD3xRwggGvuRHnq/Vfd2DGmMLvN8ifcr9LRE3b1irDQy7WM9ShyniJNC53a/7WZjS7t2MGSE2EPWR9ky5Bv3oLJiOLLjbp7f9wX5wsI2lc6/4NayldGJBtV3IvIkdWg+/T4WpfP3EmfyqMf9Zft/x5ug5LQFbUE8vNRsYjy65exM4Amc8ri06DxuTiZlZd9rQTP07044huAquOP8mjwed09nHVL9S/C2Sfxlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PASP264MB4883.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Mon, 16 Jun
 2025 08:46:12 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 08:46:12 +0000
Date: Mon, 16 Jun 2025 08:46:10 +0000
From: Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Dufresne <nicolas@ndufresne.ca>, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] media: allegro-dvt: Add Gen 3 IP stateful decoder
 driver
Message-ID: <rhpefved37qtz2w4yafuxrjvn2uazroqo74whiyntmt2vdadsj@tr2jszzivwpr>
References: <20250605-allegro_dvt_al300_dec_driver-v2-0-1ef4839f5f06@allegrodvt.com>
 <20250605-allegro_dvt_al300_dec_driver-v2-4-1ef4839f5f06@allegrodvt.com>
 <aErWeK9qQSrCcNnp@pengutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <aErWeK9qQSrCcNnp@pengutronix.de>
X-ClientProxiedBy: MR1P264CA0026.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2f::13) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PASP264MB4883:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d4ef5f-d0c9-4505-e056-08ddacb23f2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejJOYjZ4QkFadW51am15YTNwQzM2ckhsdHBjUWhMTUN6ZkxmaWRJZzZicGVW?=
 =?utf-8?B?dzVUYmV0dEU0RmpLbURKbksvdkt3SWNRWFNEVzR3Vm5Zc1crcVkwc2xxeTZW?=
 =?utf-8?B?MHBTTWNzY3R4eG9CRjJGVmx5UWF6ZWJJVDdVRWJTMTF4UUlYbG04S0ZZSVg4?=
 =?utf-8?B?cENFdUNjWHBYT1l3MGRXL0FxQnZJUS9sKzNkT1pqRmhjNkJ0V1VCUU11SVR2?=
 =?utf-8?B?Zy9mWG84bmJMQUg2dVY3RlVkay8wQUVxaTlXRDJXMGwySUJiMG5Ebkw0MWIr?=
 =?utf-8?B?dEMvRm9tOTVlNDhkWVhyc1dBNFozVzM0cS96Vk9MOUxWTWRvUkZxWFZaNWw3?=
 =?utf-8?B?YzIwMyttZHVVWUlzRzhONHFCOHV1MzNtRXV5V0pGZHdXSVZLbEh2MjFodG5F?=
 =?utf-8?B?UlJ0d3BFM0J0N2RQM2lqWGlsUStTd1R2MFBNSlpURmY2Vk51dnk5cHNxU1ZC?=
 =?utf-8?B?MW51MS9XZE9GaTNIUkQ4MHdLWE9xMWk2YzJ3VzJJc0h6Ti9rREUwa2I2QWFa?=
 =?utf-8?B?MnBRYVdSb2RHVWt6RU5naDZCVU9DSCt2Nk9HTjN4OGJJQjJTaGw1TFFrUU92?=
 =?utf-8?B?WUZhL3h3OHJwUkJyWjhRUGtnR0M0TzduSENrMkFHLzA4VlI0VHhscWlpK0pQ?=
 =?utf-8?B?N1dBLzRQbDVQenJoZmRRZTZ4ZHlPTnlZOFlXY28xZlFuOHlYMnNEaXBsM3Q0?=
 =?utf-8?B?SEdrTDMvcm4wNkFBaXA0MjF4QnlHbEpnUVYyWUZHcDNLNEYxK3RuajRuYUpV?=
 =?utf-8?B?STVaS0lZenVydExHamxtUVIzbVh2QjRuWStjdEdDWTlBUFYrK1JqS1B6SEds?=
 =?utf-8?B?bmc3OFFlM3FtTXgrZkMvZkRwcEQ1QUgrM0tKa01VTTROS0tJUlFBcDI1MjNC?=
 =?utf-8?B?S1BXT1dDSmVuM0dNSkR0UnVob0EzWDB5WTd5Sm9kdjdtVnh6aUdzWG1DYkNX?=
 =?utf-8?B?eWNJQ3k5VU1jSWo3VzRwZ3k1VVdIbkFVMU5tZlRqK0xEbGZ5Wm5ZVmZacFBZ?=
 =?utf-8?B?aHM3UndyU0QxNjVNbTR1aE9zWEhvSzhUMEhoNm92d1JtYkp4Y05OMWlUMXFL?=
 =?utf-8?B?dkpVV3hMR0tHK1VjMlZKVEIxQm0vVjBFRXhidkJjVG5mVWVsZDhpZFg4K0dp?=
 =?utf-8?B?bWZPcG9Od2hTL1NMcDRmL0Z3SC9qRzAyNWdyU0IyVHFZSFJ5UFVUTTY4elJn?=
 =?utf-8?B?UzJFdlhueHhOWkZhd202ZWdUajdmU1pGTlllYzQzVjFxdG9qRHZSQlI3WEtR?=
 =?utf-8?B?by8vbklacXVRYktRQ0JvWjEwMU9BSjc1VzgvM2Nxd2x3blN0dGZNVzlUcWxl?=
 =?utf-8?B?Z2tSYlZNc0tvSDlUeVdQMG0wYUwrSkZPZkkvVGE1enhpYnJwaGdLY0FLc0gv?=
 =?utf-8?B?YU5XbTRPckl5MUcxUW4rOFE3c21SaDVQbW1sUW9PbG1ONmh5LzJjaDI4SG8x?=
 =?utf-8?B?T3hhT0d0SHhKWjNSMnhCcklHc3pYMXpsazBGVi9paVA3OGtGQmJxakt3QzlP?=
 =?utf-8?B?TGFkN0RYVmhYOUpSbkJCMVlYQ1N6cklvOUZqUHdUT0FDVnR2eVkxSlhISjNN?=
 =?utf-8?B?MXpydEFrQkp2TWhBbU93bEpCVUJGRENrVmRVMDFrUGlTcXJnOTVVaG1namFk?=
 =?utf-8?B?dExUU2JORCtWVk9jbmJNYytRNzJJTUoxV1lyNmdCc29MTld2RWZyVnlGNUFm?=
 =?utf-8?B?ZlJ1ajhESHREY2FzS2dZTDFMTzhjK1pVSGppaFR1KzJ2Z0NYSXNHdXdhenJp?=
 =?utf-8?B?R0ZjZWh3bnB0c3h1UDY0YVRZZHFzYjRUb0MzeEZqRDRVMWp5SWtaVFgyYXBr?=
 =?utf-8?B?YnhINStrMUVGQ0gyREM2VWZ0QnpMM3FHWjVSMjlSbFRpVVF3cmkrRFVpaHlN?=
 =?utf-8?B?UFZ5anYydEpscEtYVFpOUUhLcnFEMWtBemRFa29KSXVJbFpKWnhrc3V2dGs4?=
 =?utf-8?B?YTdMMk01TFdwQlI2K1d2bitDN2UwN3hLNlpvNXE0NVNGMW5CNTZMQWx2R3hh?=
 =?utf-8?B?QkxNOUJocnB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUJVQjZoaFpMemVSVUMvejNWems3MGczU1VZKy81RFBEYUZtL0xWS0VDaW44?=
 =?utf-8?B?MzhWYkZlZm9FVXROb1FRM2tMTHZVLy9aRHkvN25uMmtZOWV2MkFTWUViZTMv?=
 =?utf-8?B?OWsvMEZqZnJxMlA2a0xvWjl2SUdMbi9MeVFLMlZ5SGU1a2NpdXczYnVmNkZr?=
 =?utf-8?B?TVFRa0Fnb2RoMURlRWpKMS8wSk4vUGFveVVhWGFPSjZYVG5TdmdrNmtFaDVh?=
 =?utf-8?B?NVpJbU1Pb0VKV3BTVXRSSjNXWUhUZEUrT2ZkVkpqZ0x3bk5nK1I3QndaNWRZ?=
 =?utf-8?B?am1YUk9pVkxDRFVhNzF3Y0tPVzhLUDlrZ1B6Yk9XMjZaQUVtbTA3NXpRdkp2?=
 =?utf-8?B?Rmg5YVkxS29FOHFCOUllM1RxWU5odkd6T2RpVmNyeHpJQlhLNWt6KzRYT0RS?=
 =?utf-8?B?RzVtaVRqZ3VLdFpkN0tkUEU3SnZnWnhKQTF5SDhVUTQzaDNLVG1PVUljNmlo?=
 =?utf-8?B?K25ZcERKZTk1amMxWHdhT256RUd0SFRvdzY3SUVQRkM5RzNybEZsSmJDbjJs?=
 =?utf-8?B?OW1KN01tMmQ4TDJGcFFkektBVmlYY2QzVm5FbzJ0a1FuRnQ0eG4xMHZDMVEz?=
 =?utf-8?B?REE0eW12akkva2FwOHdTNkZqczc5VitzOHB0MGxDZ1B6VG1kcE93RFFiSTFF?=
 =?utf-8?B?OUJaS2ROYWNCUTUyeFprV0hMMXQ1RHNFZm0zd1dGb0x0ZDNySjllWm1ENTA3?=
 =?utf-8?B?Um9CUGNodUg4NVJheEMybER5NGpzZUQwWUpFZnlpbDZFc0FkNEdJdTRiY21F?=
 =?utf-8?B?SlFsVU50bzI0UGhYVXIxM1djN2k3RUlXNCsyaWI0VWpUOVNhOEtwU01XMysz?=
 =?utf-8?B?SWJNdXE2KzZHRVRlK1Vmekk4R3lOVGdnK2praDFBeDNoTE0wQW1vMDJXUGNJ?=
 =?utf-8?B?MDdZaHVjL3pGQVhCSjI3dTJtSWRhNzR5RzNKVm5VcEI4RnNEa1Y0eXZlci84?=
 =?utf-8?B?ZjNqbFVrQ2hCbE1OSWlUdk1BQWtHRFBFUW5kbXQzRVVTVmM5d1hHODcrK0I2?=
 =?utf-8?B?WTR5WlcxUGVGdFJjUFFZeTZWN01xVEdZMlNpQmxGdnJocXZPTmlKUlNBNW5k?=
 =?utf-8?B?WURWR0VkdG5yNE8zbENyKzJpRlZjVzEwTTVXTUdmeVBjM3ZTb3NCcmRIMXg1?=
 =?utf-8?B?RXdnSmdrSWZHK0tTRll2cVhzRWx0UEZvdXhCWUZuYWdic0xmaEJlUDV4Tmdv?=
 =?utf-8?B?bGJmb1drb3V2em84cDIyT2JzN0hpek1POHFQTmozZ2pkOE81Vms1TFVNSFMy?=
 =?utf-8?B?eVZlKzBIOTdObENsTWhOcldMelJaVmxZK25IR0t6aTlVOU85MktYT0UyVmhk?=
 =?utf-8?B?WG0rY3plMmtJN1FEakRsejdNd0d2UTZzcUZ5TTIxOXV0TU5IQnc1bSsvbUts?=
 =?utf-8?B?Sm9nZ1JKZnUxN0NUZVdJVlVvRGdrZDVFdTZvaHdONEc1NFMxTFUyc05tNndD?=
 =?utf-8?B?N21JZDRLVUpBUUZaZHEvd1M0SkNTOXZEQWczUUp3YTl6a1NYaWphUGVOdzZQ?=
 =?utf-8?B?cGR3SDJIR2RMakhTZzZFOGxJTmY2c0ZzSUxkei84NDhnNUNqWm9DMmtjcDJS?=
 =?utf-8?B?UW5oZVl6QlVFUXV5ZFJkeWdWQnVFdk5admhkV1FwTktsQXNZWHh4d0RLbjl5?=
 =?utf-8?B?UVg4ZHlWSVZCakM0T1ptN29RRFRGYUtsUEptMkZyaEZvNTNZR2FNSEJLMTVo?=
 =?utf-8?B?RUJnWWhVNE9wT1BjdzdqVHpoU2t5aUVyTk1BcUFOclM0V2JMcU5lOE1FemV0?=
 =?utf-8?B?Wld3aGdRZmgwU0JmKy9VUmhBQnRqQURtVGpnMnRmY2JhakYxVnZKU0xQcG1T?=
 =?utf-8?B?cVJkU3VKSytwazJxU1UzZGlsWFdEMEN5WU9uN2szZ1ErcDg0SittaW80eFpI?=
 =?utf-8?B?ZHc1WTBJVHUyRGtObDd2U05TTlZDYkdWRXdyd2RIM0RqUlR2TjA0cE9wL3VS?=
 =?utf-8?B?RGxSTk1jeGdPSFNlNytQb1BMY1BQQmV4MnVxS0xwUXg1VnFKUmhhTWlrZEs1?=
 =?utf-8?B?akxVbFRSeEVlLzVrTGtjOE5GVCthRFk3NlhUaDQwWUlaRzUrZUlBd1lwVTI3?=
 =?utf-8?B?WHliRUNxZUpqR2pGTjAzVzlqNTE5cVVDR0plTTN1NjE5Vm5mWlhXQVZBcFoy?=
 =?utf-8?B?N1NDUWpTWW5BNDc0UGNLbEtTNU00TnRkemsrK013SkczcnNvVHk5N0E4TEgw?=
 =?utf-8?B?ZkcxMGtMbnFHVHp0c2JjQWNPbU9ZU2VteExrQ2o0SzZDc2N6ejg4OExabkln?=
 =?utf-8?B?TDRGblBORm1PdXZUYlN4UzlnTThBPT0=?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d4ef5f-d0c9-4505-e056-08ddacb23f2a
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:46:12.3389
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4+xt2zV+WjDHDjuQF5vhcXM7gM1fzBHx1UmGc0nrWK07ygL4kFRJTXKglqdMto/4Vm3Rd4npxyOdGEsV2A/e5Ckxen/KJAg0g5s5YkF5dXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB4883

On 12.06.2025 15:30, Michael Tretter wrote:
Hi Michael,

Thank you for your review.
>Hi Yassine,
>
>Thanks for the patch.
>
>The overall architecture looks a lot like the video encoder for the
>ZynqMP, but with some significant differences in the details. I didn't
>manage to look more closely at the driver, yet, but I have a few high
>level questions.
>
There are a many difference between the ZynqMP, and the al300 drivers,
espicially on the mcu control. ( the al300 mcu is a 64bit ).

>On Thu, 05 Jun 2025 12:26:59 +0000, Yassine Ouaissa via B4 Relay wrote:
>> From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>>
>> This commit introduces a new allegro-dvt V4L2 stateful decoder driverfor
>> the Gen 3 IP with support for:
>> - AVC (H.264), HEVC (H.265), and JPEG decoding
>> - Output formats: NV12, NV16, I420, and P010 for capture
>>
>> v2:
>> - Replace the mutex_(lock/unlock) with the guard(mutex), that manage
>>   mutexes more efficiently.
>> - Set DMA_BIT_MASK to 39, and drop the paddr check when allocating
>>   dma_memory.
>> - Use dma_coerce_mask_and_coherent to set the DMA_MASK.
>> - Use static initializer for some structs.
>> - use #ifdef instead of #if defined
>> - Optimize some function.
>> - Use the declaration in the loop.
>> - Use codec for al_codec_dev instead of dev, to not get confused with
>>   the device struct.
>> - Remove the codec member of the al_codec_dev, use the fmt->pixelformat
>>   when request creating decoder instance.
>>
>> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
>> ---
>>  drivers/media/platform/allegro-dvt/Kconfig         |    1 +
>>  drivers/media/platform/allegro-dvt/Makefile        |    1 +
>>  drivers/media/platform/allegro-dvt/al300/Kconfig   |   23 +
>>  drivers/media/platform/allegro-dvt/al300/Makefile  |    6 +
>>  .../platform/allegro-dvt/al300/al_codec_common.c   |  733 ++++++++++
>>  .../platform/allegro-dvt/al300/al_codec_common.h   |  248 ++++
>>  .../platform/allegro-dvt/al300/al_codec_util.c     |  174 +++
>>  .../platform/allegro-dvt/al300/al_codec_util.h     |  186 +++
>>  .../media/platform/allegro-dvt/al300/al_vdec_drv.c | 1518 ++++++++++++++++++++
>>  .../media/platform/allegro-dvt/al300/al_vdec_drv.h |   93 ++
>>  10 files changed, 2983 insertions(+)
>>
>[...]
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.c b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..716d0004482702537ea89ec4abecd6af26654b32
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
>[...]
>> +static void handle_alloc_memory_req(struct al_codec_dev *codec,
>> +				    struct msg_itf_header *hdr)
>> +{
>> +	struct device *dev = &codec->pdev->dev;
>> +	struct msg_itf_alloc_mem_req req;
>> +	struct msg_itf_alloc_mem_reply_full reply = {
>> +		.reply.phyAddr = 0,
>> +		.hdr.type = MSG_ITF_TYPE_ALLOC_MEM_REPLY,
>> +		.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl,
>> +		.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl,
>> +		.hdr.payload_len = sizeof(struct msg_itf_alloc_mem_reply),
>> +	};
>> +	struct codec_dma_buf *buf;
>> +	int ret;
>> +
>> +	ret = al_common_get_data(codec, (char *)&req, hdr->payload_len);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to get cma req %d", ret);
>> +		return;
>> +	}
>> +
>> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
>> +	if (!buf)
>> +		goto send_reply;
>> +
>> +	buf->size = req.uSize;
>> +	buf->vaddr =
>> +		dma_alloc_coherent(dev, buf->size, &buf->paddr, GFP_KERNEL);
>> +	if (!buf->vaddr) {
>> +		dev_warn(dev, "Failed to allocate DMA buffer\n");
>> +		goto send_reply;
>> +	}
>> +
>> +	reply.reply.phyAddr = (u64)buf->paddr;
>> +	al_common_dma_buf_insert(codec, buf);
>
>The buffers allocated by the firmware are tracked by device. Thus, there
>is only one list for all buffers used by the firmware.
>
>I guess that the buffers are be allocated per context. If that's the
>case, maybe tracking them per context in the driver would be a better
>option.
>
The mcu can ask for buffers at the startup, and also it can reuse some
buffers, with different contexts.

>> +
>> +send_reply:
>> +	ret = al_common_send(codec, &reply.hdr);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to reply to cma alloc");
>> +		al_common_dma_buf_remove(codec, buf);
>> +	}
>> +}
>> +
>> +static void handle_free_memory_req(struct al_codec_dev *codec,
>> +				   struct msg_itf_header *hdr)
>> +{
>> +	struct msg_itf_free_mem_req req;
>> +	struct msg_itf_free_mem_reply_full reply = {
>> +		.hdr.type = MSG_ITF_TYPE_FREE_MEM_REPLY,
>> +		.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl,
>> +		.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl,
>> +		.hdr.payload_len = sizeof(struct msg_itf_free_mem_reply),
>> +		.reply.ret = -1,
>> +	};
>> +	struct codec_dma_buf *buf;
>> +	int ret;
>> +
>> +	ret = al_common_get_data(codec, (char *)&req, hdr->payload_len);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to put cma req");
>> +		return;
>> +	}
>> +
>> +	buf = al_common_dma_buf_lookup(codec, req.phyAddr);
>> +	if (!buf) {
>> +		al_codec_err(codec, "Unable to get dma handle for %p",
>> +			     (void *)(long)req.phyAddr);
>> +		reply.reply.ret = -EINVAL;
>> +		goto send_reply;
>> +	}
>> +
>> +	al_codec_dbg(codec, "Free memory %p, size %d",
>> +		     (void *)(long)req.phyAddr, buf->size);
>> +
>> +	al_common_dma_buf_remove(codec, buf);
>> +	reply.reply.ret = 0;
>> +
>> +send_reply:
>> +	ret = al_common_send(codec, &reply.hdr);
>> +	if (ret)
>> +		al_codec_err(codec, "Unable to reply to cma free");
>> +}
>> +
>> +static void handle_mcu_console_print(struct al_codec_dev *codec,
>> +				     struct msg_itf_header *hdr)
>> +{
>> +#ifdef DEBUG
>
>What's the reason for making this a compile time option? Maybe a
>module parameter to enable MCU logging at runtime would be more
>friendly for debugging.
>

This will change to add debugfs. thanks
>> +	struct msg_itf_write_req *req;
>> +	int ret;
>> +
>> +	/* one more byte to be sure to have a zero terminated string */
>> +	req = kzalloc(hdr->payload_len + 1, GFP_KERNEL);
>> +	if (!req) {
>> +		al_common_skip_data(codec, hdr->payload_len);
>> +		al_codec_err(codec, "Unable to alloc memory");
>> +		return;
>> +	}
>> +
>> +	ret = al_codec_msg_get_data(&codec->mb_m2h, (char *)req,
>> +				    hdr->payload_len);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to get request");
>> +		kfree(req);
>> +		return;
>> +	}
>> +
>> +	/* Print the mcu logs */
>> +	dev_dbg(&codec->pdev->dev, "[ALG_MCU] %s(),%d: %s\n", __func__,
>> +		__LINE__, (char *)(req + 1));
>> +	kfree(req);
>> +#else
>> +	al_common_skip_data(codec, hdr->payload_len);
>> +#endif
>> +}
>> +
>[...]
>> +static int al_common_load_firmware_start(struct al_codec_dev *codec,
>> +					 const char *name)
>> +{
>> +	struct device *dev = &codec->pdev->dev;
>> +	dma_addr_t phys;
>> +	size_t size;
>> +	void *virt;
>> +	int err;
>> +
>> +	if (codec->firmware.virt)
>> +		return 0;
>> +
>> +	err = al_common_read_firmware(codec, name);
>> +	if (err)
>> +		return err;
>> +
>> +	size = codec->firmware.size;
>> +
>> +	virt = dma_alloc_coherent(dev, size, &phys, GFP_KERNEL);
>> +	err = dma_mapping_error(dev, phys);
>> +	if (err < 0)
>> +		return err;
>> +
>> +	codec->firmware.virt = virt;
>> +	codec->firmware.phys = phys;
>> +
>> +	al_common_copy_firmware_image(codec);
>> +	err = al_common_parse_firmware_image(codec);
>> +	if (err) {
>> +		al_codec_err(codec, "failed to parse firmware image");
>> +		goto cleanup;
>> +	}
>> +
>> +	err = al_common_setup_hw_regs(codec);
>> +	if (err) {
>> +		al_codec_err(codec, "Unable to setup hw registers");
>> +		goto cleanup;
>> +	}
>> +
>> +	al_codec_mb_init(&codec->mb_h2m, virt + codec->firmware.mb_h2m.offset,
>> +			 codec->firmware.mb_h2m.size, MB_IFT_MAGIC_H2M);
>> +
>> +	al_codec_mb_init(&codec->mb_m2h, virt + codec->firmware.mb_m2h.offset,
>> +			 codec->firmware.mb_m2h.size, MB_IFT_MAGIC_M2H);
>> +
>> +	err = al_common_start_fw(codec);
>> +	if (err) {
>> +		al_codec_err(codec, "fw start has failed");
>> +		goto cleanup;
>> +	}
>
>If I understand correctly, the difference to the ZynqMP firmware is that
>the firmware can be configured for different addresses. Thus, the
>firmware and mailbox addresses on ZynqMP are determined by the bitstream
>synthesis, which this driver is free to allocate memory for the firmware
>and mailboxes wherever it wants. Correct?
>

There are some similarities between mailbox of the mcus ( zynqMP and
al300 ), but i'm actually working on the remoteproc and rpmsg for the mcu
control and IPC and messaging between host and the mcu.

the feature should be enabled with the encoder patches.
this should make the v4l2 easy with less files.
>> +
>> +	al_codec_dbg(codec, "mcu has boot successfully !");
>> +	codec->fw_ready_cb(codec->cb_arg);
>> +
>> +	release_firmware(codec->firmware.firmware);
>> +	codec->firmware.firmware = NULL;
>> +
>> +	return 0;
>> +
>> +cleanup:
>> +	dma_free_coherent(dev, size, virt, phys);
>> +
>> +	return err;
>> +}
>> +
>> +static u64 al_common_get_periph_addr(struct al_codec_dev *codec)
>> +{
>> +	struct resource *res;
>> +
>> +	res = platform_get_resource_byname(codec->pdev, IORESOURCE_MEM, "apb");
>> +	if (!res) {
>> +		al_codec_err(codec, "Unable to find APB start address");
>> +		return 0;
>> +	}
>> +
>> +	if (res->start & AL_CODEC_APB_MASK) {
>> +		al_codec_err(codec, "APB start address is invalid");
>> +		return 0;
>> +	}
>> +
>> +	return res->start;
>> +}
>> +
>> +int al_common_probe(struct al_codec_dev *codec, const char *name)
>> +{
>> +	struct platform_device *pdev = codec->pdev;
>> +	int irq;
>> +	int ret;
>> +
>> +	mutex_init(&codec->buf_lock);
>> +	INIT_LIST_HEAD(&codec->alloc_buffers);
>> +	init_completion(&codec->completion);
>> +
>> +	/* setup dma memory */
>> +	ret = al_common_setup_dma(codec);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Hw registers */
>> +	codec->regs_info =
>> +		platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
>> +	if (!codec->regs_info) {
>> +		al_codec_err(codec, "regs resource missing from device tree");
>> +		return -EINVAL;
>> +	}
>> +
>> +	codec->regs = devm_ioremap_resource(&pdev->dev, codec->regs_info);
>> +	if (!codec->regs) {
>> +		al_codec_err(codec, "failed to map registers");
>> +		return -ENOMEM;
>> +	}
>> +
>> +	codec->apb = al_common_get_periph_addr(codec);
>> +	if (!codec->apb)
>> +		return -EINVAL;
>> +
>> +	/* The MCU has already default clock value */
>> +	codec->clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(codec->clk)) {
>> +		al_codec_err(codec, "failed to get MCU core clock");
>> +		return PTR_ERR(codec->clk);
>> +	}
>> +
>> +	ret = clk_prepare_enable(codec->clk);
>> +	if (ret) {
>> +		al_codec_err(codec, "Cannot enable MCU clock: %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	irq = platform_get_irq(pdev, 0);
>> +	if (irq < 0) {
>> +		al_codec_err(codec, "Failed to get IRQ");
>> +		ret = -EINVAL;
>> +		goto disable_clk;
>> +	}
>> +
>> +	ret = devm_request_threaded_irq(&pdev->dev, irq,
>> +					al_common_hardirq_handler,
>> +					al_common_irq_handler, IRQF_SHARED,
>> +					dev_name(&pdev->dev), codec);
>> +	if (ret) {
>> +		al_codec_err(codec, "Unable to register irq handler");
>> +		goto disable_clk;
>> +	}
>> +
>> +	/* ok so request the fw */
>> +	ret = al_common_load_firmware_start(codec, name);
>> +	if (ret) {
>> +		al_codec_err(codec, "failed to load firmware : %s", name);
>> +		goto disable_clk;
>> +	}
>> +
>> +	return 0;
>> +
>> +disable_clk:
>> +	clk_disable_unprepare(codec->clk);
>> +
>> +	return ret;
>> +}
>> +
>[...]
>> diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.h b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5f893db4a1a3f2b9e6e9109b81a956bcaa71851c
>> --- /dev/null
>> +++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
>> @@ -0,0 +1,186 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright (c) 2025 Allegro DVT.
>> + * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
>> + */
>> +
>> +#ifndef __AL_CODEC_UTIL__
>> +#define __AL_CODEC_UTIL__
>> +
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +#include <linux/v4l2-common.h>
>> +
>> +#include <media/v4l2-mem2mem.h>
>> +#include <media/videobuf2-v4l2.h>
>> +
>> +#define MB_IFT_MAGIC_H2M 0xabcd1230
>> +#define MB_IFT_MAGIC_M2H 0xabcd1231
>> +#define MB_IFT_VERSION 0x00010000
>> +
>> +#define MAJOR_SHIFT 20
>> +#define MAJOR_MASK 0xfff
>> +#define MINOR_SHIFT 8
>> +#define MINOR_MASK 0xfff
>> +#define PATCH_SHIFT 0
>> +#define PATCH_MASK 0xff
>> +
>> +/*
>> + * AL_BOOT_VERSION() - Version format 32-bit, 12 bits for the major,
>> + * the same for minor, 8bits for the patch
>> + */
>> +#define AL_BOOT_VERSION(major, minor, patch) \
>> +	((((major) & MAJOR_MASK) << MAJOR_SHIFT) | \
>> +	 (((minor) & MINOR_MASK) << MINOR_SHIFT) | \
>> +	 (((patch) & PATCH_MASK) << PATCH_SHIFT))
>> +
>> +#define al_phys_to_virt(x) ((void *)(uintptr_t)x)
>> +#define al_virt_to_phys(x) ((phys_addr_t)(uintptr_t)x)
>> +
>> +#define DECLARE_FULL_REQ(s)    \
>> +	struct s##_full {            \
>> +		struct msg_itf_header hdr; \
>> +		struct s req;              \
>> +	} __packed
>> +
>> +#define DECLARE_FULL_REPLY(s)  \
>> +	struct s##_full {            \
>> +		struct msg_itf_header hdr; \
>> +		struct s reply;            \
>> +	} __packed
>> +
>> +#define DECLARE_FULL_EVENT(s)  \
>> +	struct s##_full {            \
>> +		struct msg_itf_header hdr; \
>> +		struct s event;            \
>> +	} __packed
>> +
>> +struct al_mb_itf {
>> +	u32 magic;
>> +	u32 version;
>> +	u32 head;
>> +	u32 tail;
>> +} __packed;
>> +
>> +struct al_codec_mb {
>> +	struct al_mb_itf *hdr;
>> +	struct mutex lock;
>> +	char *data;
>> +	int size;
>> +};
>
>On a first glance, this looks a lot like the allegro_mbox in the ZynqMP
>encoder driver. Even though the message format is different, would it be
>possible to generalize the general mailbox handling and use it for both
>drivers?
>
>Michael
>
>> +
>> +struct al_codec_cmd {
>> +	struct kref refcount;
>> +	struct list_head list;
>> +	struct completion done;
>> +	int reply_size;
>> +	void *reply;
>> +};
>> +
>> +#define al_codec_err(codec, fmt, args...)                               \
>> +	dev_err(&(codec)->pdev->dev, "[ALG_CODEC][ERROR] %s():%d: " fmt "\n", \
>> +		__func__, __LINE__, ##args)
>> +
>> +#define al_v4l2_err(codec, fmt, args...)                               \
>> +	dev_err(&(codec)->pdev->dev, "[ALG_V4L2][ERROR] %s():%d: " fmt "\n", \
>> +		__func__, __LINE__, ##args)
>> +
>> +#if defined(DEBUG)
>> +
>> +extern int debug;
>> +
>> +/* V4L2 logs */
>> +#define al_v4l2_dbg(codec, level, fmt, args...)   \
>> +	do {                                            \
>> +		if (debug >= level)                           \
>> +			dev_dbg(&(codec)->pdev->dev,                \
>> +				"[ALG_V4L2] level=%d %s(),%d: " fmt "\n", \
>> +				level, __func__, __LINE__, ##args);       \
>> +	} while (0)
>> +
>> +/* Codec logs */
>> +#define al_codec_dbg(codec, fmt, args...)           \
>> +	do {                                              \
>> +		if (debug)                                      \
>> +			dev_dbg(&(codec)->pdev->dev,                  \
>> +				"[ALG_CODEC] %s(),%d: " fmt "\n", __func__, \
>> +				__LINE__, ##args);                          \
>> +	} while (0)
>> +
>> +#else
>> +
>> +#define al_v4l2_dbg(codec, level, fmt, args...)             \
>> +	do {                                                      \
>> +		(void)level;                                            \
>> +		dev_dbg(&(codec)->pdev->dev, "[ALG_V4L2]: " fmt "\n",   \
>> +			##args);                                              \
>> +	} while (0)
>> +
>> +#define al_codec_dbg(codec, fmt, args...)                         \
>> +	dev_dbg(&(codec)->pdev->dev, "[ALG_CODEC]: " fmt "\n", ##args)
>> +
>> +#endif
>> +
>> +#define MSG_ITF_TYPE_LIMIT BIT(10)
>> +
>> +/* Message types host <-> mcu */
>> +enum {
>> +	MSG_ITF_TYPE_MCU_ALIVE = 0,
>> +	MSG_ITF_TYPE_WRITE_REQ = 2,
>> +	MSG_ITF_TYPE_FIRST_REQ = 1024,
>> +	MSG_ITF_TYPE_NEXT_REQ,
>> +	MSG_ITF_TYPE_FIRST_REPLY = 2048,
>> +	MSG_ITF_TYPE_NEXT_REPLY,
>> +	MSG_ITF_TYPE_ALLOC_MEM_REQ = 3072,
>> +	MSG_ITF_TYPE_FREE_MEM_REQ,
>> +	MSG_ITF_TYPE_ALLOC_MEM_REPLY = 4096,
>> +	MSG_ITF_TYPE_FREE_MEM_REPLY,
>> +	MSG_ITF_TYPE_FIRST_EVT = 5120,
>> +	MSG_ITF_TYPE_NEXT_EVT = MSG_ITF_TYPE_FIRST_EVT
>> +};
>> +
>> +struct msg_itf_header {
>> +	u64 drv_ctx_hdl;
>> +	u64 drv_cmd_hdl;
>> +	u16 type;
>> +	u16 payload_len;
>> +	u16 padding[2];
>> +} __packed;
>> +
>> +void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 magic);
>> +int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_header *hdr);
>> +int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len);
>> +int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr,
>> +		      void (*trigger)(void *), void *trigger_arg);
>> +
>> +static inline bool is_type_reply(uint16_t type)
>> +{
>> +	return type >= MSG_ITF_TYPE_FIRST_REPLY &&
>> +	       type < MSG_ITF_TYPE_FIRST_REPLY + MSG_ITF_TYPE_LIMIT;
>> +}
>> +
>> +static inline bool is_type_event(uint16_t type)
>> +{
>> +	return type >= MSG_ITF_TYPE_FIRST_EVT &&
>> +	       type < MSG_ITF_TYPE_FIRST_EVT + MSG_ITF_TYPE_LIMIT;
>> +}
>> +
>> +void al_codec_cmd_put(struct al_codec_cmd *cmd);
>> +
>> +struct al_codec_cmd *al_codec_cmd_create(int reply_size);
>> +
>> +static inline struct al_codec_cmd *al_codec_cmd_get(struct list_head *cmd_list,
>> +						    uint64_t hdl)
>> +{
>> +	struct al_codec_cmd *cmd = NULL;
>> +
>> +	list_for_each_entry(cmd, cmd_list, list) {
>> +		if (likely(cmd == al_phys_to_virt(hdl))) {
>> +			kref_get(&cmd->refcount);
>> +			break;
>> +		}
>> +	}
>> +	return list_entry_is_head(cmd, cmd_list, list) ? NULL : cmd;
>> +}
>> +
>> +#endif /* __AL_CODEC_UTIL__ */

