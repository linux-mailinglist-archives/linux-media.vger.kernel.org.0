Return-Path: <linux-media+bounces-28821-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AD8A72B14
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 09:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B95C173DA6
	for <lists+linux-media@lfdr.de>; Thu, 27 Mar 2025 08:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8E8C1FFC6E;
	Thu, 27 Mar 2025 08:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="J6Lb9Ysu"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2071.outbound.protection.outlook.com [40.107.21.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005EE1C861A;
	Thu, 27 Mar 2025 08:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062865; cv=fail; b=lulN4zw9derNe7dQ+HrhXLci+rfScIf7C7M2lMUIqzbN/ct+u3Y5mft1NwqFSebxwn9VcB/cRz3w42GDwjuhgFtu6VZyydBkowT1Mo26FzOloUGLObL75m7vUEnbrM5mx9gK6Jj5ubpfpwYeYu8frIslUTHqwmKJvJYZbAJFrtE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062865; c=relaxed/simple;
	bh=jAE7uC/pnWwyf805Gri5A8nz4ivfmn7LvcPUmGz65AA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mBDY9eAFvFVUfE7he3Q6Ml1fpw+ogHUv8U4fOaqBVHW05ziGrX6vgbmRKIyeWYbgBj/Dtu2EyItrfZXZk0hrQc0wlEHpCLo2nqFkI0CFNotCVU5uQFXvshzA1l+7PdJlNBfh3i+/HndAOf7lok+z/KTbrgLZ08phvqEcsiNqniM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=J6Lb9Ysu; arc=fail smtp.client-ip=40.107.21.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itcUyTZ5cqwD0otW7BZpxYyjk3pqAo2JpNQTqE7mIJEx6i5YbomvbOKiw6DQxiFGgZ5ONK5tLJC6ff3MMnN90F+N79k57OtN+uvq4b+UfvqvsPTAOhmZQ+uf5Ar1D1GBz4pETgIzCmx8HCaHnoVfGdcLAO9mSNtX2kKFjnn47fWdZKWroY1hNcInxch6Ws8zPNeUW8819ObeC4ZQgH4GdC/HgXJH22nDlOOd92/VP/XJN/y37vVTKzfWWkdVKDVcV3L17gXh8f84GBMVda+q4dTZob43tOT5xyN3FvVPD0dwMdhZ3/Opk6O64m4+kd4t8IQ/xmD1rYv2YLhRdya7HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t/Uj5+juRoX4L038jRwRPtD4nxwpUotptwitT5LJ8x8=;
 b=d7z7n4c+tlF9JQkr/FpI+VZ6OvdXwJKH3OZzoQVnfG4qFZL1RHhKAErLY8YBOYmd+VTSa2+P0dVNx1dby2t3sUKixifHUPriIYIJfKRPiA906TicuuAh5CG0NR7NOrXq//pZy2dEBW8Jb2jlSyC6x3bLNaCX1QYkLiYqeFvPqkI7xhr3C0qbYrWeCwR9Q4uimngED73YlI4xzKNgH4uDrkD/LgPkVuOsMPKGhIshPx79qN162lfLCf8x23Ryvt1tPMY991/BvpKSRcbHDhuglZ0PbANs2myC7AagcY6XEKrlOhk0Me9Yxpgh9z5jb/c74speGbsVXdM0kEghdGtF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/Uj5+juRoX4L038jRwRPtD4nxwpUotptwitT5LJ8x8=;
 b=J6Lb9Ysujy5DsriDU3K5jbLSg4GaBzTx6vM1323uIoOmkZ/BiJxDzKWvxo2xWBcAWwMI4cbZ5cxA8JWv/dpMUe7aQkXRrwWmwD0YqgKJyw1/XtgM9nHmG2JrgW25ktCJ6dcnynCzR1v8SfWsGXinlaiJz5899EjPeYe1Wb3dyjI7EHkCVwO5x2rLUA8AKrv9hAkh7WFc1E9ALjGy9S2OuyH6rvczjgYnZfc+YyewYFxnnh7RPPIts8Fw5HjNXzBxIIRk0wpV70ozSWj+h7CdXyeQCx97gumkWpMqk7+MZgnQAVU31RF/kciqKs/pCofTvYjIX+JE266bn3NHwuJlJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by PAXPR04MB8654.eurprd04.prod.outlook.com (2603:10a6:102:21d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 08:07:37 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 08:07:37 +0000
Message-ID: <b02c4af0-d42e-43fd-acdc-b0674eed0a92@oss.nxp.com>
Date: Thu, 27 Mar 2025 16:07:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] media: amphion: Add a frame flush mode for decoder
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, xiahong.bao@nxp.com,
 eagle.zhou@nxp.com, imx@lists.linux.dev, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250305062630.2329032-1-ming.qian@oss.nxp.com>
 <20250305062630.2329032-2-ming.qian@oss.nxp.com>
 <20250327074835.r47kaabtwu5jqvxf@basti-XPS-13-9310>
From: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>
In-Reply-To: <20250327074835.r47kaabtwu5jqvxf@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|PAXPR04MB8654:EE_
X-MS-Office365-Filtering-Correlation-Id: 09174c91-2698-4b1f-9a48-08dd6d066fc4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEwvbjBBdkdNaGJXOVhkZWJ5UTByRWRFRmtmcU45UWVraXZXa2EyOEp4eFdn?=
 =?utf-8?B?YUphSFAxTlRBbG5iYmN2V2kxM3Vxdy9mMDlRK08wVWNHZ2dtZ2Q2aWhLKzFk?=
 =?utf-8?B?NW0xWThiNlFQVVlDWFBjLzlidjZEdHdhZk9oRmg3QjVPSTdZV2JRTnRwcVJW?=
 =?utf-8?B?Z0VadFVmM2NUUnlkdmQ1c0JzSGdmMSt3aVdoU1FLTmh3R2NScWlobG4rdzVj?=
 =?utf-8?B?L2JJT3ZhSS9hdVlic3pEQmszMXgwTDlEeXh1ajVHTzk1OW5aZGZkNFZSMzR4?=
 =?utf-8?B?SEpoNW9YZmJUaG9VTEp2NDhZN1AvR1FZVTZubjZlYi96SXF0WnVvOXFDckMx?=
 =?utf-8?B?SjlPd2hIVVdNNHYydExOeW54NkE1K09wa2hjT3BMY2VSQXQrZGVJYmlZS1Jz?=
 =?utf-8?B?VTFCenlQdWp5OEdtaXNTT0hSWmcrVWdFR0t2bmQ3Z09Yd1hpZXE5V0syTUhh?=
 =?utf-8?B?TkdXUHU1VVVDNy9kcHlDRDd4Q1U4Rk0yd3BKOW1jWmYrV3VVY0p3cmRzOFZr?=
 =?utf-8?B?WXg1bGRXbC9YS1dER1plbzBrbXB1ZnRrNzRGNXJsWElZTnhLRHo3YVM0TXBC?=
 =?utf-8?B?cmlrMExJaytIblBHc0RuRExQd2gzTDN3T2x4SWhpaUpiV2VtWExrU2lmTzY4?=
 =?utf-8?B?d3JDVDJmMjU1M25XUnNTU3UzRlp5WEJ0QWtDeDFCTmU5QlBuQlVkakZGY1Q0?=
 =?utf-8?B?OVBTNjRvcDl0VGhmcnJDUFY2b0NVNkluWmFES1U2RVF6YjFZbUtaMFY2MGpy?=
 =?utf-8?B?dytRZzFHS201TDdjY2V4Q0taamRKWkJDNEhTM3RWSTlZTk9MSWpOaDR1R1Az?=
 =?utf-8?B?ZjJqdEZNM0YraEVBYXlpR0twZktud2ZlYkdrMlZoMXVFS2gzVldRUHhldDJl?=
 =?utf-8?B?ektNc2I5ODNQZzJVU292RjhPclJOUndIVlY4dnpxZGZEZUovS3Y5Nm11Q2p4?=
 =?utf-8?B?UmJ6dEpRNDhwcWVjY2lwK2lMNy9rM1hNSTUrM3lMM2l6MGVCMzR1eDd3bG1C?=
 =?utf-8?B?TmJNQ29uY1BIU3JHSlFTTWE1b0RFcXRZTFpWSENFUWdSbFpBOHhqMk1DUU9M?=
 =?utf-8?B?R2VWUHhaNDRtUEJpaERNVXVaVFhMajQ0TDFTQWpjbUhvWHFpZDZRN2FnWUhM?=
 =?utf-8?B?d3FrMEpPSWhIZmRycHh0OE1teGhUZlo0NXg4WlVqMUh5WDFYTXFjNEw5ckx4?=
 =?utf-8?B?eUExV0N3NG5Vc3hMb2hrUktGOHh5c29LZnF6TVhZanhpUDFTNlJDblpsRHF0?=
 =?utf-8?B?VStLOEFRbTEvYkxSRERKdUNCRzc4eWtSdGdLbWFHdlhpdWR3cGdSUktINmxI?=
 =?utf-8?B?M2pOY0YrN1JwRTZxYVVvdlQ5b3d2aDk4WU9nUHkwTHA2NHo4LzVvK1VWSEkx?=
 =?utf-8?B?TG15dDZmTVRiNm9lU3U5REZWOHRWZ0syVjNQQkF4V0pobkcrZkNqZ05yY2dM?=
 =?utf-8?B?MnlFSk1XbUUwQkc1MWtvRjVOaXVrckE5TW9Gd2ZaVml4TmVsUnlOMi9MamFQ?=
 =?utf-8?B?ZDN5ajNySWhTYmV1UWgvSUUzN0t4YjU1ZVp0Q0MrejA0Q3hRWWxHcjNvREU1?=
 =?utf-8?B?bWE2R3JOMi9zd1RFZGhWdVdiSXkvczZyQ1N5UnM5YUdZVWsrSTFpNVBlbTcv?=
 =?utf-8?B?aFVXcG9QRzNLRkRUdll1OU9TL1NGeEY1MXdFQXNyVk16Q2xRZFBjRkdXaWN0?=
 =?utf-8?B?QnB5TUNXdWpZRDlQUk1QS0V3VDBvU250dGI5SUhlUXFlaGVpYXlYNmN6SERu?=
 =?utf-8?B?WmVEQm5OZjIxOTE4NGhOV1U4c2RHMm8xQzNib2JwVkNrZk9nWnM4QU1yRTgv?=
 =?utf-8?B?bDB0WDV3R1FvRXhnVVBTSXpOa3gwWEh6cDludGU2d3pCTUtKSU9RSitsR1lJ?=
 =?utf-8?Q?pyeAi98kGwL+N?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3EyOERjMlorQTR0K2xCVGZtRXVBcVhIalNSWEJKNWV5MXd4aVRobnJ0dmRi?=
 =?utf-8?B?S0VMeXUyZTlBTlBrRVN1QmcvL0lJYXNBSUk0dUN4cko1d3RHSmd6dFcwZlBB?=
 =?utf-8?B?VmMwRFZMNmpVMCtnQUVkY002WWpsVWROODM0NktYVWJaY3YrRzJaMXhWb3gw?=
 =?utf-8?B?S280dnNtQldUTWZPRGJTbGlwaWlOMGcvd1pUKzRMSjIzSE5Mem5lMG5uQTFY?=
 =?utf-8?B?VUxSODNacU9mVWIvTjRrQjdlWVJFTFg2c04zWXE0YXVQUURGa0k0THR0UDE3?=
 =?utf-8?B?Z1lHY0x0V3NIa281YXdtdENtVFgxMXR2YjFUR3N0eGVkaGxJaTdjeGNWZDk5?=
 =?utf-8?B?UVAySDdHOVpxcllnQk9oaFU3TlRwREtRczJXY0RGU04rNjBwZE16RWhlU3Rx?=
 =?utf-8?B?eEFBNFdnRlZQSTU0Mk1McVNuSTVyekk5dUJVclZPa2xtWG1lV1dJZVlXL0h6?=
 =?utf-8?B?WFBhTVhPeGVuQjI0cDlTdEFSeExLT3E1T09nc1lscmFIV3Bmb2J4KzRhdWRL?=
 =?utf-8?B?cDBsTlJ4N2t0WXQrZS9wY3JPdFl1bHo2b2Rta3dGb2ZpVWdVdkNGUnFyeklV?=
 =?utf-8?B?ODJ1bFlEMzdUN1M2Z1F4YUR5bk5nUUNvU2Q0a2kvWlFxdmpzZWFtT1l0ekpw?=
 =?utf-8?B?cWprRnl0MUozWnhXL2FHTTk5eFV6NjNpQjJ5Tml2QzF0dzdDMEQ3M2RKRWVR?=
 =?utf-8?B?TVl4Zm9rUEhFcG56YllOeGpxKzZXRSsrS0Iyd1ZQU2o3RFl1UkZwcThPSVpl?=
 =?utf-8?B?OWRUUjYzcEhLMkg4OVNFZHJwWlAxemY1VWRoMCtPNmw5OHREQW9nNmlNVm1D?=
 =?utf-8?B?NlZzSDRiYnlsSEc2MENyOHZyK09mbVdXaE9WUWpyZmYwZzE2dUdxSlAyNUVC?=
 =?utf-8?B?c0Z1R3plck83MUc1N3JaL0F4TkpZbXd5UHE5NU9TMUVuUHpPeEZwNThsczBY?=
 =?utf-8?B?b05Xc1dZcEdYTUxPNHQyVjFNN1A0d2dteWFrTW00OHcxNU5ibjI0aTdwOVgv?=
 =?utf-8?B?WityZkluMCtxdEU0T0Faa1lJcUl4c3d0eERHdmVER1dCcmdINWlRbGpQN3RM?=
 =?utf-8?B?a2c4dzZnZDNyT0oyYk9BQjVGUGpLbjVZUlFnbnRJenRha2NHQUQ5a2liVnhj?=
 =?utf-8?B?b1pqMjc3L3lTbTF1aEgybmdEeW1ic3B5L3NIVmtpRXVFMnlMS3drOERrblV6?=
 =?utf-8?B?MGVNRmFuUkRQdklLTFhtcHBWUklRZmVRR0tJaFQ1TVZneGVnbUZrN3pWNGdC?=
 =?utf-8?B?TEhMdW1TOHUzZHd4YUxBRGZXNHB2a1crbzRSbjNHb0xZdjZaYjJOZDJwQTRa?=
 =?utf-8?B?SVVqY21EdHBuU1U2b3JtRmRTejdiTXYwbTZmTGtvZnZNdWNvU1hRN2ZRdHYr?=
 =?utf-8?B?Zlc0bHpaY2R4VHY0OW95S2JZd1NQRjFJUVVkR1FTSjRHeGpZeWo5Z0JSZU1t?=
 =?utf-8?B?Z1RZT0o3Z0h2K2JUdUF1bEV1bTFFTGxRRXJleGx5Nk8ySGVMTk9xTVhCcWpG?=
 =?utf-8?B?cUQ5Vi95VGRFVk9mVGZLMTF6TG5UdFhYek0xN2x1QTFXSDZTZ1FYZDMxQTlL?=
 =?utf-8?B?eG00Z0RmOUduUFFONGNJWEFhNExUbTJpdHJVZHB6UlFoZ3ltSlpwSFJXYVRK?=
 =?utf-8?B?QXVWUXMzNkduejBQZ0syWkgzeTVPeTBWU1A0L2JIM3QvbHQ5NW1vNTREVmtw?=
 =?utf-8?B?Q1B6czFTQ29DUVFmS2NRcWZZbkc2alI4cVpuWUhINjJqcjdqaUlVR2lXSExP?=
 =?utf-8?B?QkViem5nSVhIM1BDd3pJSS9zSmd3b3YwaC94QnYvL0pBSjhrdkdHdjZoU0tI?=
 =?utf-8?B?bExlL3dQZjRFc0o0c2laZE9zbTdhbC9HeGhHa1kyS3k5L1ZoQTdtb0h4Tkxy?=
 =?utf-8?B?eXVTWGF0RVg2M01td3J4ODVDRjVKT1VHcGovKzRlZ3N1K0pmRVVqb1E1MWtr?=
 =?utf-8?B?b2dYVzRVK0loWE5EVmNLb2Jnd253S1NsYjhKLzRXZDlxV3Z4TTIyODYzK2g2?=
 =?utf-8?B?TVI4ZUZnT0thblNXdU9PQWZ1RThhejN6YktVYnNGZ3dyZDBkVkQzTzZiQklI?=
 =?utf-8?B?WnlwMG8rVkdHWVR3YkpCY2RMN2pkWnNESXZSY1Q5MXFDUWNvVEllYmRidkJU?=
 =?utf-8?Q?QOzudYRxPJDYvgjXojOLOUrdA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09174c91-2698-4b1f-9a48-08dd6d066fc4
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 08:07:37.2805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CcECuGDQDuFa/BxgJ7Pzx5rjACg1zGjQlKT1aP8rGKO8901Nw0B8Bq56iFu75AuyNb2bALSo3lNmW3JX7pq90A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8654

Hi Sebastian ,

On 2025/3/27 15:48, Sebastian Fricke wrote:
> Hey Ming,
> 
> On 05.03.2025 14:26, ming.qian@oss.nxp.com wrote:
>> From: Ming Qian <ming.qian@oss.nxp.com>
>>
>> By default the amphion decoder will pre-parse 3 frames before starting
>> to decode the first frame. Alternatively, a block of flush padding data
>> can be appended to the frame, which will ensure that the decoder can
>> start decoding immediately after parsing the flush padding data, thus
>> potentially reducing decoding latency.
>>
>> This mode was previously only enabled, when the display delay was set to
>> 0. Allow the user to manually toggle the use of that mode via a module
>> parameter called frame_flush_mode, which enables the mode without
>> changing the display order.
>>
>> Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
>> ---
>> v3
>> - Improve commit message as recommended
>> - Add some comments to avoid code looks cryptic
>>
>> drivers/media/platform/amphion/vpu_malone.c | 14 +++++++++++++-
>> 1 file changed, 13 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_malone.c 
>> b/drivers/media/platform/amphion/vpu_malone.c
>> index 1d9e10d9bec1..4ef9810d8142 100644
>> --- a/drivers/media/platform/amphion/vpu_malone.c
>> +++ b/drivers/media/platform/amphion/vpu_malone.c
>> @@ -25,6 +25,10 @@
>> #include "vpu_imx8q.h"
>> #include "vpu_malone.h"
>>
>> +static bool frame_flush_mode;
>> +module_param(frame_flush_mode, bool, 0644);
>> +MODULE_PARM_DESC(frame_flush_mode, "Set low latency flush mode: 0 
>> (disable) or 1 (enable)");
>> +
>> #define CMD_SIZE            25600
>> #define MSG_SIZE            25600
>> #define CODEC_SIZE            0x1000
>> @@ -1579,7 +1583,15 @@ static int vpu_malone_input_frame_data(struct 
>> vpu_malone_str_buffer __iomem *str
>>
>>     vpu_malone_update_wptr(str_buf, wptr);
>>
>> -    if (disp_imm && !vpu_vb_is_codecconfig(vbuf)) {
>> +    /*
>> +     * Enable the low latency flush mode if display delay is set to 0
>> +     * or parameter frame_flush_mode is set to 1.
> 
> s/or parameter frame_flush_mode is set to 1./
>    or the frame flush mode if it is set to 1./
> 
I will apply your suggestion.

>> +     * The low latency flush mode requires some padding data to be 
>> appended after each frame,
> 
> s/appended after each/appended to each/
> (the word append implies that something is added after something else)
> 
Got it
>> +     * but don't put it in between the sequence header and frame.
> 
> s/but don't put it in between the sequence header and frame./
>    but there must not be any padding data between the sequence header 
> and the frame./
> 
> (As this is not a suggestion for the developer but a description of what
> the code does)
> 
Got it
>> +     * Only H264 and HEVC decoder support this module yet,
> 
> s/decoder/formats/
> 
> I'd rewrite this part:
> This module is currently only supported for the H264 and HEVC formats,
> 
> but that is only because this sounds more natural to me.
> 
I will apply your suggestion.

>> +     * for other formats, vpu_malone_add_scode() will return 0.
>> +     */
>> +    if ((disp_imm || frame_flush_mode) && 
>> !vpu_vb_is_codecconfig(vbuf)) {
>>         ret = vpu_malone_add_scode(inst->core->iface,
>>                        inst->id,
>>                        &inst->stream_buffer,
>> -- 
>> 2.43.0-rc1
>>
>>
> 
> Thank you!
> 
> Regards,
> Sebastian Fricke

Thank you very much for your help in expressing.

Regards,
Ming

