Return-Path: <linux-media+bounces-41625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51149B412D9
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 05:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1142B542FD3
	for <lists+linux-media@lfdr.de>; Wed,  3 Sep 2025 03:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89D92C2361;
	Wed,  3 Sep 2025 03:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="43Ic03p3"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2067.outbound.protection.outlook.com [40.107.101.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A962F2C187;
	Wed,  3 Sep 2025 03:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756869761; cv=fail; b=VRvQ90H99w9Wk7RqJuBmie8IPgK0zqTiA16n+1XA9o55+ecP2qWfr/gG+gg01j6qWvOz3LuuthI11KyUuWbPTOgD+fTYrXQm0UwUP8pTAxISGUpj2XDOAUJ6jAm5H4bBZJqwvP548Uooj1mbm9Py+5DKMI1t75Uv8KXW4eL5bFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756869761; c=relaxed/simple;
	bh=3eTc8xmKRCNcAcU/qGYj63DPOW8H9DfgHEyz80x4h5M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dKHtxoTD8+Eb0aLeIKhkF1e9fS+nrHRYmLwbclhzmWgKcuJ7hjrVvt4bEEH3l26cdBfvtXjGWfXvLMbcl6/9q1whhP/uEVnO7rU8Oq05gO7v1BBbC8Budt6WWYrm/EAJo2l18xUOWiGy/Xg03xZjbkPzJsZxH1XhMuvbbJF8uEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=43Ic03p3; arc=fail smtp.client-ip=40.107.101.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k179wubqOoSGqDhvQ0GxfP4AWKgqW29emIPVFk7sAr1Cw/wCOPaufQ9pX4qan93v4dEYDxDzuCN94HfcHBgWHy6EnQo9BcNsSIbybkmceEYO1i7GMSVVecJnvNyZOUsx3YzB6Qqp7E4NocQar95Sr3hJbavMSGQSXAouZ7xfHpxBu/o7LlmjUT4yRrL08SRIezi7yC7aY+MsjrmYVcyzDvR9vJxcf3tTOHROerpiZCXrcmrpFmDvYLJUkfhGVRwu7km7q8gw4Wu9ZnVwENm9/zt50NAcy8DrBJvQFGs5sufAoBMefF8GBeyGZkkdqBKl61EviavmBGAExyYDx+Ry7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S05ZxbBNCOBH1saTQ4LZB6fpLbWTVaN4gYPfuE7Jadk=;
 b=J5IggB5kZWPUGDoByRPw4bo+YQk5J3FUyiQXvqtsvB9TTTdH9STE0rxkmVuSRJFLK9xiFAaWloRTayfXWBL7YTiNwfuFT0c1XMXGRM9uhNd5nfBH7RQkdcS/ojL65nLjfMdIph0LG+ILZbpRvfsUDSKLBhzNVTBpJ9DZ9bqxgeXDE90VXmje+qTs6Sn8XhphHr8tIWkk3zyn06Mu76Epr/XAeiUeVy63lxl1s1C9b4f96UmkJY4LdARb9R86gtWWks5S+hxw8PJq9HLaMtn8FrkkBss+tQ984G7On3ffbuSwQGXZuitkAFKfU/Sx+ztNuo3CM0t34dKD57ZnPM+vFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S05ZxbBNCOBH1saTQ4LZB6fpLbWTVaN4gYPfuE7Jadk=;
 b=43Ic03p3HJ3YpJlR2cmNnIJRUBkSjjvV5Bs5lB1DsMFpPJBrG9jdUluKVCa3siSvGvqoLoC5GH8ajzmURik0eFRDCompdsE9pBzcJgCyfM71Vdr90KY78Hvt2Hr8vBBu97gHZEXOmPWNXJD1QHPvn38HPwke0CtZvetmu0jfV1Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 by SN7PR12MB7786.namprd12.prod.outlook.com (2603:10b6:806:349::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 03:22:37 +0000
Received: from PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7]) by PH8PR12MB7446.namprd12.prod.outlook.com
 ([fe80::e5c1:4cae:6e69:52d7%4]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 03:22:37 +0000
Message-ID: <2464e531-6ef3-4d27-8053-5e4874a15b8c@amd.com>
Date: Wed, 3 Sep 2025 11:22:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: platform: amd: Introduce amd isp4 capture
 driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: mchehab@kernel.org, hverkuil@xs4all.nl, bryan.odonoghue@linaro.org,
 sakari.ailus@linux.intel.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 sultan@kerneltoast.com, pratap.nirujogi@amd.com, benjamin.chan@amd.com,
 king.li@amd.com, gjorgji.rosikopulos@amd.com, Phil.Jawich@amd.com,
 Dominic.Antony@amd.com, mario.limonciello@amd.com, richard.gong@amd.com,
 anson.tsao@amd.com, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
References: <20250828100811.95722-1-Bin.Du@amd.com>
 <20250902124932.GN13448@pendragon.ideasonboard.com>
Content-Language: en-US
From: "Du, Bin" <bin.du@amd.com>
In-Reply-To: <20250902124932.GN13448@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: KL1PR02CA0007.apcprd02.prod.outlook.com
 (2603:1096:820:c::12) To PH8PR12MB7446.namprd12.prod.outlook.com
 (2603:10b6:510:216::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7446:EE_|SN7PR12MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cb4a9ed-c632-44a5-eee9-08ddea992147
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anF1OC9MZkNCTk4raUhmNjlpTXdFeGRaM0JhTXBGUnk3NEhBWUZmSXo5NW5p?=
 =?utf-8?B?ZWM2TnZnZkN1SXBOSDJwZzBQd2dJVGNoZWQxL21LOVl0TVdKc0dpZjgrYUxK?=
 =?utf-8?B?SDRPOXNwWU5PcmgrSERBTmhJUHUxdWtjVy9GbXBkQ1FwSDlVaVpyRm9pVllW?=
 =?utf-8?B?WGpMN3ZhWGhCZkNmU1YyREs4M2xqanZVVnhrT01qN20ydHQvM3J2dkRTVTNi?=
 =?utf-8?B?bFhsMS91K1BoOXloNmhyVGJPUUlsS2NNSkUxMlRSUlNNb2ZSakk4a3Nub0dV?=
 =?utf-8?B?eDJyR2t3Q28xMk10eEZxMFRWQ1RUTHhoTVpjckhXaWhmQzQ4MlFKMVFjcWdu?=
 =?utf-8?B?NEVaVjhhdldHamZVa1VXb292ZFFic3VJSXFlVzFHL1I0a1p5dmdldmI3YVhm?=
 =?utf-8?B?SHhPWm1JWXlsUjdDdnZjWDc4WmxCSUx1N2gveWRhTENwVnA3eGl3dUpJclFX?=
 =?utf-8?B?d1k4cEVWNzdkeWh2R1Q4L3dtOURuWmtQQjBabUN2dXY1WFdQN0U4YXJLS0dC?=
 =?utf-8?B?Q3JBWXh3WHNhdGdLYTMwMHJwbGNXSGcybUlLNnV5UnRUWlpoeTE4eUp3VW9B?=
 =?utf-8?B?M1hkZklFRFpZZ2I1Uk85TmdtRCtGZGdLeUNXSjcxVHoyajBsRDd5enNPWXFR?=
 =?utf-8?B?MHJmSis4eG1wSDRPdzY0OU1yK1k2N0l2ejV2NTJLanVFQjROdzlNa1FJT3pY?=
 =?utf-8?B?dkNhT2lMQVFUN1JwYUIvTDBGbThhTVA5NTQ2aElwaVhUZStNMXhMb3R5UGZl?=
 =?utf-8?B?d1FhMlFUUzg5VE0xQjVXczVnOURVS3RidGF1WlZBYlUyb1Baa2ZyRmxsK1Bk?=
 =?utf-8?B?ZnppVVB3WEZLMW5uSEYvaFVPU3VFaUFnVWt6NmZRN1lJZFZmcmRUQlYxVnJE?=
 =?utf-8?B?ZUFpNVRMamtXL3ZJOTJDdlRKdEoxb2RqZVlNVStMcE94a0NNMDA4R2lLT0Na?=
 =?utf-8?B?ckhkZHFaMjBLYkJJem1RSjlSQkhaRlJsYnhzSUg0TUZVTGY2VTZnWUdqNkFU?=
 =?utf-8?B?eVpWSW9DdEJYMWJzU0I2eHBjVFZxNUdlVStkMkFBcTl5Y2dzUHhISW1tZDM2?=
 =?utf-8?B?WmVETjlVZW50QjBOTEZmYnhwcStFY1l1dURKVk9hZnk4b29KQnAzcTdWSldj?=
 =?utf-8?B?d1Zrd3VjdWtOdy9iZ09yMGR0dVFMR1ZXL01hYzBpYlhSNGZ1WElQWnp6Ynp5?=
 =?utf-8?B?cVl4L2hFQ1V6ZVY0YWxJaEpXUGJoRVJmdzh3Q0Z2MUJ0bVFvSmo5T0tLNkNG?=
 =?utf-8?B?U1lDc3NmMmwwakowQXd5dXV4V20yZS93d2pkUHNlWlBQOGVrSXZ2NXhsS2M3?=
 =?utf-8?B?K0xJT0FkNnR5bnMzdkJVeWg3TnJKN09STUlQOXVldE9hamNVa0NOSHlzNlBk?=
 =?utf-8?B?NUhVTHZJUG5KbTIrdVlSalNEVnloQnN0b2Z5V1crT3hUWVRYYzdPbVR2MXlE?=
 =?utf-8?B?eUM1RUYyS2pPc1dPbHlQQzc5ZGQyR2M1emRlWk1lNVRSSTdqMVkvd2J4bHZN?=
 =?utf-8?B?dEtENVNtWFFoMEpVMnpGSFMyWk9rMFhZUVVsRWd1YTdSakJvUCtEbCtTd1B6?=
 =?utf-8?B?YWFrNlJTSkZ1T0lNYUZLZTRIaGJ4VnZLRmlmRW9iQVcyY08yK1M3K3BKWDEw?=
 =?utf-8?B?QnJjeVlhZm1UVXZMcy9zV0x3d0ZzUno3MjhZeTRPM2ZoYy9HT3FGVTRFVytx?=
 =?utf-8?B?dXRuT0FsQ2R6bHJkVkdLejNRdUNSVmJiWHV1Z1AvODM4RVVsdGZOWGE2TGQv?=
 =?utf-8?B?RW4weTlWbHhvWHFvcHBLcDYyRElFOStFZGtxVXdZM0Zpck9Md0JGVFI5VVlx?=
 =?utf-8?B?cXYzTHY0eDlIUXpXcXk3cG8zNTR0dnJXVkppKy84bW9WVXpJWlRtUEVyWUxL?=
 =?utf-8?B?U1Bya3QxS0c3ZFg1ajFTRXVuNFhoSmpEeE9EY2UxT2YxUGxueGMrSWxvUlNj?=
 =?utf-8?Q?1U+zFYL454Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7446.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzlRY0JlQmRjTm5VOTJBd2daamNqeFBrUEkwcS9wTzZQbURTR3NmRzBRWGZY?=
 =?utf-8?B?Tmc4U3RUNi9CUk5SMDlQemJvYWsxb1RxZ0luMnRZai9UeHhUSlZBcmNrVlor?=
 =?utf-8?B?UHZGSGRqeGF1MzFaSDJPeXFKRXFlRXhPY25NckRDMTlySmoyblROc1I3VktR?=
 =?utf-8?B?SFVHZno1c0c1QW5QVUorNDFOdk9Cci8waWVJcWZUcU9mOCtXNnE0MC9oc2Vj?=
 =?utf-8?B?ZEExbDFKbXZGR2JlZkdjNXFvRXYwcE93dDg2TnF4aVZYTXh5aS9pdndGQzAx?=
 =?utf-8?B?dFFhRzJldUZnWWN5M3NWR1NWak4vVUs0V2U4ZFVZNTZIMVVuOHlxMllyZ2F0?=
 =?utf-8?B?T3M5SDh1eGFzWnZRZG42aWtxa3pnRVZDWDRLNDQ0ejAyaDFxRU4vNUNzcWtU?=
 =?utf-8?B?NnZzQTIzNkVKQzFRdll1dDdYbWxUQzVjVHExRi9wS1BERlFlMnY1NmJxZE9r?=
 =?utf-8?B?WGkwSVZuSmo0WUsrWWZzZEFGZ29RYkx2aTlhTGNYZlNhMktIT2JqVXova0ha?=
 =?utf-8?B?Yy92QVpRbVZYelNaTWZ2dHZYakRKV2N4MjN3RUpPOE5GYnkvNlE3NkI0S3dV?=
 =?utf-8?B?aGY0R2ZIT2I5Ujh4WldvZDAxMXpYUERsS01uSmtHbmlldG9JV3dDc2JYckNi?=
 =?utf-8?B?RTlDSlpwT0RQcVN0LzQxdGxwNTZqL2UrbTAvY1BQUXcxRXRzU0dJRHBHemlT?=
 =?utf-8?B?b0RRNkdQQys1RThEa1IzRGxNQ1RHZFczc0pEbVpSRFVSMUl4TFQvTEMwMjhm?=
 =?utf-8?B?QUJ1NHptUWtLaUExVmEvS204Uk9XMTZVaHhTN2NnS2tHcWxIMUVRakZYa1VB?=
 =?utf-8?B?ZnM5V21yT1NQdWxHd1AvL0c4VnZCVnE5alNsZ3o4T1JzK2doMHFKUUN6ODJM?=
 =?utf-8?B?VmlBRW0xMCtJSlpJRWxid05QNGE2TGpzV2JtNHg4a21PeXk5U0c1ZXZONTNN?=
 =?utf-8?B?ZTRvajVJZFJlL05LTGNSdE8zWFBDa0lDbzNiR0Q0ajVYK2F1MkNsaTR2M2M3?=
 =?utf-8?B?eVFGNlpMclN3cmlxSXhOSDJlTTlxWjFaK2tLSWpnUVY4a0k1bEFXNWJxSjNo?=
 =?utf-8?B?aDk0TmRFQzNLc1Y3Z2ltUmlnT3JRSURVWGZkMEtuZ2J5OUlydkhMb1gzaWNN?=
 =?utf-8?B?cDJ0M3JlRmcyM1VwWG0rQ21zTDRvdXlFTitiWkdCUTJvSWU3dExBSEQzVHhw?=
 =?utf-8?B?eUVxTFdWaFFwV1RxWG9uYlpyQ2ExWlpmN2xQQm12aTRSVXRTQ3NJL1I1RmRh?=
 =?utf-8?B?QjE0Ukd5LzZxK0pCdWl1NTZyYXNVVG1VNkVwNndiZW5IWWxLbkJBRnNWbFV4?=
 =?utf-8?B?UjBVdFNBd2hhQ1lSL3RQNVZSL0Nnbm9EZ2hnM3BkNEY2MXdnRktyVTVzUHFJ?=
 =?utf-8?B?MEZRQ3V3TDNGN09uK2V0dnZBbjVsbFpudnpxNzhMRHkxSEMxMStXM2pWdHNB?=
 =?utf-8?B?MElrT3ROTkxBREdtZTlwSGorYTBycmFZL3o3T0p2WDh3WW5UeURIVEZLaEN3?=
 =?utf-8?B?RVJLNjVKSk4wN3dCWUhJRzhrUGgwN000T25tZGRYMDhidGpOem00VnNiSE5V?=
 =?utf-8?B?a1NHS0FuMU9uKzc1WU05d0lFK3FUOFFXSlBlbkVma2NhajY3Sm5SdGFWcmVz?=
 =?utf-8?B?NGJTZXFhWFVBUE9KOUlZQW1XSnZKNG9QOXpkRTFDUkNMYUlEWHYwWkRBR0xG?=
 =?utf-8?B?Zm5hbTNyVWVmTXVueU1KeFZjV0U4dTJtaHRZcDRxR0JjNDJyZGlKYkdINTha?=
 =?utf-8?B?a1RtQk5lcGZjbVkyckVtRTNNNFl6STJRMHZZZXk3WVJXQTk1Wi9IOHhwQU5j?=
 =?utf-8?B?WTVQbWp4aGJzUnpmWW9vVDhOczJYVEF3WGlIUUNJUFkrNzB0eHdQK2xEeW85?=
 =?utf-8?B?ZGdDMysyRW8wMmtubHZrditRUlh3dFlPRU1XKzVkVUFXSVJncWFwVFFKd3Yx?=
 =?utf-8?B?VWtYdkxjaEdUR2Q0UzZWZlJRYjRGVFcvbGFEZ0JEWGp2a1hXdUZXYWFIY3RG?=
 =?utf-8?B?cXkwbndBZmZNMFl3cWczZVY2d0FPYVNTMXBhNnRHT2xoUk1OYm45L0JTcHVX?=
 =?utf-8?B?R01qUmorRU9zUmloUWdadjhxK29RbysrUVdpc284ak5MOGhXYTVrVldlcHBY?=
 =?utf-8?Q?h4AY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb4a9ed-c632-44a5-eee9-08ddea992147
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7446.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 03:22:36.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP7oQyCldBNlg99Z95NZxqWlZnFAFU+fLOA9zk1OckFBCKXshf9uai9nnEBLayDZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7786

Thanks Laurent Pinchart

On 9/2/2025 8:49 PM, Laurent Pinchart wrote:
> Hi Bin,
> 
> Could you please provide the v4l2-compliance report (please use the
> very latest version of v4l2-compliance), as well as the output of
> `media-ctl -p -d /dev/media0` (replacing media0 with the appropriate
> device) ?
> 
> Generally speaking, you should include a cover letter in patch series,
> and that information can be included in the cover letter.
> 

Yes, there is a cover letter for the patch series 
https://lore.kernel.org/linux-media/20250828084507.94552-1-Bin.Du@amd.com/, 
because of some server issue, the cover letter and left patches are sent 
separately, really sorry for the confusing. It does contain 
v4l2-compliance report, but the media-ctl output is missing, many thanks 
for the guide, will include it either in the next patch

> On Thu, Aug 28, 2025 at 06:08:05PM +0800, Bin Du wrote:
>> AMD isp4 capture is a v4l2 media device which implements media controller
>> interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
>> be connected to a remote CSI2 TX endpoint. It supports only one physical
>> interface for now. Also add ISP4 driver related entry info into the
>> MAINTAINERS file
>>
>> Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
>> Signed-off-by: Bin Du <Bin.Du@amd.com>
>> ---
>>   MAINTAINERS                              |  13 +++
>>   drivers/media/platform/Kconfig           |   1 +
>>   drivers/media/platform/Makefile          |   1 +
>>   drivers/media/platform/amd/Kconfig       |   3 +
>>   drivers/media/platform/amd/Makefile      |   3 +
>>   drivers/media/platform/amd/isp4/Kconfig  |  13 +++
>>   drivers/media/platform/amd/isp4/Makefile |   6 ++
>>   drivers/media/platform/amd/isp4/isp4.c   | 121 +++++++++++++++++++++++
>>   drivers/media/platform/amd/isp4/isp4.h   |  24 +++++
>>   9 files changed, 185 insertions(+)
>>   create mode 100644 drivers/media/platform/amd/Kconfig
>>   create mode 100644 drivers/media/platform/amd/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/Kconfig
>>   create mode 100644 drivers/media/platform/amd/isp4/Makefile
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.c
>>   create mode 100644 drivers/media/platform/amd/isp4/isp4.h
> 

-- 
Regards,
Bin


