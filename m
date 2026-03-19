Return-Path: <linux-media+bounces-56268-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKRFF6Zdu2knjQIAu9opvQ
	(envelope-from <linux-media+bounces-56268-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 03:21:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AA56B2C4DC3
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 03:21:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 51C24302F9AF
	for <lists+linux-media@lfdr.de>; Thu, 19 Mar 2026 02:21:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957C53859CE;
	Thu, 19 Mar 2026 02:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gZ1zk+4g"
X-Original-To: linux-media@vger.kernel.org
Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010057.outbound.protection.outlook.com [52.101.61.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4837036C58F;
	Thu, 19 Mar 2026 02:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773886877; cv=fail; b=Jm38w27UbDXR2eBN8dH+3Bu1hJXGsT56no8MsXxsUIV6Xs22MOhlTLlX5dSvgUuiPGHn9O/GAzfur2T9yM1fNeprrNth+m2R2G0IINENXVsGr1HJawCp7l8+V6/SAT7NA7RsD1cYtcB9e0hSInVI7SWb+nhVkZdvEpUFyxk9QS4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773886877; c=relaxed/simple;
	bh=Xmntd1ncKxfu95BxBHd0TenZ8kT6gsypVUeNasjhlnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jCHIG1AojbtcwfERS8Jbxt2m4v5G7NeatlulMHfIWasAMz/vl+A54Mp+k0hxV3TIiXhcARoaryK3hsI+xIe2VkAiqAUzc8hTT7eghJpeY0SzTIlV3DMVzaiNNyGItfmR56f84ikc2EmZ6UQK9+0ve4l9SkqHp8BLXCxiA9dFgZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gZ1zk+4g; arc=fail smtp.client-ip=52.101.61.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEjVfgw5O9szRKcBbkY2y/JIuhuHeQj0AoV8s9xu+mYppvnIW7uf85D310oSoa0ao04hZlCQHYVOq9d45U/IVVHX9oJJK2jaJbEd7lhiVeMlzkh838+hB+zuLbxywuspx94YmsBj/o1gEDs4BXwn2HoZJLM25prNIgYSSgW89LIGdRqEg8ov1kUgkZXDYtAtI5bps1EF1A3eTq9MjLT7RraPNABh08HlomA0DGqdJeVptwcwvtcSzkYPo/0JhVnEVooPmoGvM6fkvNjkUTKm9W+z2csp7Nb0RRpZh3YAKEBO3AnEPweJuv1CSZ4kJpuU+tuRvlxrN4ynSY9KEW5AWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fdtv1s/WJzGykwqUbTpDM/HXuJoWd03T0gjtk1xKdeM=;
 b=adOl1GFx8/JcnWPC89V41FjvnYLNPa8JYEs3CSr5aV2cgq6GRdJnxwwoJDKUtpxZAIIeSQBJjM8dGCs8mnjBLYBzzWGfcYWhFgkY0eyk+SCMJ7Ly8iURLb0C9txLxaUVlTQx6dLRDdWb46nsFtI5eqx5wnTpncO1xaGsE+8uKOVZOEFiNdW6z0Gh8gs0/44njk5viQo4UoMb6NUZYXq39RhRDp8yBFnFdTU8uNnAs4qW1a1Jn0cZgUMWSzlRQPlYLqDslO76bESDUMt4W9QmiqDSTtTedKmfFuMGOBW2JhBIYn0dXdBPb1a1SkA2P5FFr32cKt6WUz5x1yBdfE1vrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fdtv1s/WJzGykwqUbTpDM/HXuJoWd03T0gjtk1xKdeM=;
 b=gZ1zk+4gZB8PAlcKT2tbc5ODHl0Oz4hUoo1NsU/dtEjjc+4SspMWzQWeSGicjNQkfk0twgBU43RVIdwERaPIBshTyQdUpiEB22v3OuBDk3e/Fy+Gxz1ciOZ2iHN4Hi0Ek61wgGBTr1AbN7UqCo3DTN06CYpEeMPoxb+C+eC5mc4BpOvNbBsNTk/cR8DnzMdZfelT80Ym++Oe7XbbsitZ64JPrmf0bDrB0hO7NbEucDqjbmUdlxDisYH3ypsZJzX9VTbZxr+pKsZigt3qR4PxaPtihkOIbQo/hE9Ojx8y5FP9hN3ydkwJHI8zxTYin1RANz1w6CdJTCgYOv1/u3FGKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by SA1PR12MB6799.namprd12.prod.outlook.com (2603:10b6:806:25b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 02:21:02 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::d9d1:8c49:a703:b017%4]) with mapi id 15.20.9723.016; Thu, 19 Mar 2026
 02:21:02 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject:
 Re: [PATCH v7 05/15] gpu: host1x: convert MIPI to use operation function
 pointers
Date: Thu, 19 Mar 2026 11:20:58 +0900
Message-ID: <10139201.lOV4Wx5bFT@senjougahara>
In-Reply-To: <31e56301-2764-4d3b-bc21-555227248e5f@kernel.org>
References:
 <20260303084239.15007-1-clamor95@gmail.com>
 <20260303084239.15007-6-clamor95@gmail.com>
 <31e56301-2764-4d3b-bc21-555227248e5f@kernel.org>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TY4P286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::6) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|SA1PR12MB6799:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9dabbc-2088-4c65-9448-08de855e2a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016|921020|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	StYu5QcuhI0alpYajx2vdDw3YvfzRcVgPpOfPjEnhgmaVx0CNuUO10ASmJ8v19g45NV+IE+d8C8lo+XZ/AaYXPTGbeijGhy1gfWQpK9CaDi+JGztaDJ03fA89Yi300KWesN68gg8iXagvRu1BKXeE0ggshDWfqSlGQqDJZUdTRRjFEbBxkbR3yszAf3EH9i2d3ZJoNUHzYpCC13HZfNCN3ZuEy+wPbquEwuVyaRO2NcrveZ6L3kewGIbT43dIfX6eN0wxZewApsTbcg4jORwlyp56z/vLCRGbMvxQU6EaZA+IAm38arGUCBaiCVyA+HtjrcFmh8LhetAQScr11J8p5goI13EIYz69DQQAl358VMBoLgzgoAXYusMLHZ7arIzujBMG10HUH8UuBXSUMRNL3IxAN1mQHPjq3p8O7VLELiGKg+Dej8fLI9wdctuX3JLeIijd7Ddd2G+whxBSPDhWW7k8BGr8FFHDPOAuLBi4TPPEgzCvs39HEVmOPXCBy+YSrCD/FwlWPLw7Td02yu6xRpk4qha7OiYS3f0X3w7tx5Tmz/OOFbK1Ny3P81nbWl3bsoEy0YobpcirMj/XVHTZRDzw4qMdS9PHSzyYxxsv1Azc3cEaiQKOUItC+HivYZaoUJn8Fi3hvpTXq5rO8UfKtg22n3doDpMnMh0JQz3+5oIAsXqimYipd4i2YYk7B7hqDhBH9JI1ql/UQ+uNqfMpaMxUzRq6FVHwpJEIa4gEKTQUnwFco0CR7o9aOxh0oeGEwxoZd1EISFSy3TyohXe7Wlkizk90D12c+za8SP+h5k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB9161.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016)(921020)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0w0T1hxaCs5bitjUGdPRXJUTjJla0VYTlM3dit4SGFGUUVvTzZFT3NDTWZu?=
 =?utf-8?B?T3owQi9HckNxVzZyZGdRRHQ0b2EwQjdoSFNzZkFPVEd1QTAxR3RGUWhxdzY3?=
 =?utf-8?B?QXhNRzRHVis0cFg0ellXTmUzdEIrVzl4SS9TU2pvQW5hMlVxR2xVdTlTWVlB?=
 =?utf-8?B?dFBsYy82UU5GTXdObXhyNXNDK0lvYlQ3dDRNZTJ1SXIvWTdkWFBlbmxjQjBk?=
 =?utf-8?B?Q2d4eUtyYlIyUkwrZjcvRFFPVFBlWmpJM1BZbkczVUlWRGlBWjQrcXVyRi9v?=
 =?utf-8?B?YXV2VWhFQWtlSTdSRStYQlI4UG1GSHIxYXJOV3p2V2x3cmt0TlVRaVIzRlZl?=
 =?utf-8?B?djdQWVpnOWlGdzZScDREQlpWN0VGUHVuc2d0YWo4a1lPcmYzc0JSS2QyaG5j?=
 =?utf-8?B?VU43RENiMkZZdnZRR20vMUp6T0dNbkh6YTIydytNRnNRV3ZLdDVXREQ2S1RC?=
 =?utf-8?B?WWZyejBWVmY3cWdwN3lrL0xDVnYvT2pQbTV2bmR5RVc2NmpWOFlaOTB6clIv?=
 =?utf-8?B?bi8wb1Jjd2ZzcXY2ckM0SEdjWXlnVkhLaWt0UXJFMkVQRFRBYkdMTTlDdFpK?=
 =?utf-8?B?SjRWK1JwTEFIU2ptTDFGNHY2Q0NIZ00vSlMycGR1SllYb2R6Z3d6cU0vOGVJ?=
 =?utf-8?B?NUJFUDVPT2daWFVSS0dnWXQ3NmNsTDBBWlh0cFJub1JndDBRTHlzRVJ5SUxE?=
 =?utf-8?B?a25OTTlSMnR1d3BGTmJrQlV3a2dMV0NncnBGRmM2R0NEblU2VmJtelNnd2FN?=
 =?utf-8?B?QzF6YXR1a1lCSkdEZ0NxTmh1czhURkg4eDNHL0RHVjNpOG9qM0xlUU9mbGlZ?=
 =?utf-8?B?eWptdmFPMTBTY0VxLzcwNUk4V0JmWUVRLzJZbWt6b0xQYldDWlM4aEpObmdu?=
 =?utf-8?B?bTNIanVMaUxBeXJiaHo4dU1MaC83bDE3eXNFNVVDSkFXaC91SmQxNVRUalZO?=
 =?utf-8?B?QkRZQnRwSGp5dnd4QllaSVh4NCtNckZ0MzcxSDBwd3NKOGYzU2ludWR4Vmg0?=
 =?utf-8?B?Wnd5VkZnRlFLTEpqRUtCb3d2dE9YQ0ROMm53emt4bmFDbldrUjZYQkNZZ3VM?=
 =?utf-8?B?UGU0T2JvMW5GcVlGa2Z0eEQ3alJyS1pVaWRVSU1WV3FscUlza0UvU0J2QmFS?=
 =?utf-8?B?bW8xVWVVWEdLTGVxRjdRdWltT3dxYWttM1Y1cnFYRUNzUGtpanFjSndxelZU?=
 =?utf-8?B?Si90dVNjWVE2OFdHUW9LNFhZK1BCUnIxUVZxWUZ0dW5rWUJ2Q1Z6eS9QWWR6?=
 =?utf-8?B?bGN0cTJWaThHbzZscDhYWDVzNThhMEYxYkxlb2p2amh6Z2puZHplQWNwN2d3?=
 =?utf-8?B?UFRQUTFqZ3BEVFRZZG1LYUNDcndFLzFMZnQ1cFFyTFFJUXBQczV1ZDVod2dv?=
 =?utf-8?B?a290VmZsOEgzRlQ5SXFxSHZ0SFpDRW83WGNjdGJ0UHFpTGIzTUg2TzNwQ1Vp?=
 =?utf-8?B?NkIybWcvTDdQNW5MNkQzQTdHRDZod0x2NHpndExLU0pPcWV2WmJTT0YvUkZ1?=
 =?utf-8?B?YXdXNGE3S0thSUFqVExWKzhaNmZmOThKUHI4QnkvWlBoVjFIQUczY0FTclox?=
 =?utf-8?B?Y0ZtZk5MbjdOdUc1V2VVdS9DdzdPYlpEN1hqZHp6OUdYbHA0WkZQL0tpelVt?=
 =?utf-8?B?Vk1sZEhjRFdZNEVQL1JXVTNnOXFKakV5QWprWS9YY3NxTXVWSHRIc2NqdE9Z?=
 =?utf-8?B?UEZacXl0ZHpBSGdpQTdEYUptTU5vK0h0T0RaeW9RdzBpNW1MeHU2MG02QnE0?=
 =?utf-8?B?MWtwWW1DTmdZZ0pDVVRHQlduSHRRWVZUNHV3czgzbHovQjZ5TGpTTDRjSGlM?=
 =?utf-8?B?Um1IL3c5ZUdHbzIyRHduZFpBOW5KYS9vN0wzZ3l1SGk2TlJjaytJTjl6WFZq?=
 =?utf-8?B?bklOOTlXaVU2SFJJQm8xN3QrQms5Q1g1c0VueE1NdndLbWJ6cXd2ODlheXp2?=
 =?utf-8?B?eHlGYTNnRkNvU1pXQmRGclZEZlVicmZmUWFLcjJQNldpTEI3SlFxYUIyVWRS?=
 =?utf-8?B?VDBOeVJjc29zaW51YnRDTlYxZ1RIakE3ZWVXVnE0aUhyWWFITGdxSHVQZWlr?=
 =?utf-8?B?UFdndFh5Y1ZqdDJzRTJrQk9UQVBSNGdOc1ZYbWZsRHh4MDBaS01ZWDgrNDFr?=
 =?utf-8?B?VXpkeEtWMlBJaWFrTTVGa2VXdXphSjJId29ZRlJMWjg4NmwySHhKUlovQTJa?=
 =?utf-8?B?N2kzeEd1WitlMEoyVzE5dTZDVGY1NlB6b0YvbVd4dnc2Z3RPUGZINnRSRFNn?=
 =?utf-8?B?b3pTVy9vZTkyWGNQQkJ0VkcwQmJmY0srR3NuejZhVHdnTUVOWWlkbFN1Z3lL?=
 =?utf-8?B?NlphajNWMWR6SWROV2Z2UWtwRWl4RUFYWHhhWGZGU05ZeVplamFCVlZBKzA0?=
 =?utf-8?Q?41UUAVSWtBKag+L6h9YJnaLFDyqDQ1yAJQRct3j/e+Jj0?=
X-MS-Exchange-AntiSpam-MessageData-1: kWK8xF2J9nk9MQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9dabbc-2088-4c65-9448-08de855e2a5b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 02:21:02.0140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irZ8iTuOvxwh65Q5mgpf+SFujTRKNrjo+TTCXIi3QE4K4DZVI1WyxY/a8eD/CyqrTrRfKW8ddDXeD4SMRuIaug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6799
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56268-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com,ffwll.ch,bootlin.com,kernel.org,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mperttunen@nvidia.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.972];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AA56B2C4DC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tuesday, March 17, 2026 10:07=E2=80=AFPM Hans Verkuil wrote:
> Hi Svyatoslav, Mikko, Thierry,
>=20
> On 03/03/2026 09:42, Svyatoslav Ryhel wrote:
> > Convert existing MIPI code to use operation function pointers, a necess=
ary
> > step for supporting Tegra20/Tegra30 SoCs. All common MIPI configuration
> > that is SoC-independent remains in mipi.c, while all SoC-specific code =
is
> > moved to tegra114-mipi.c (The naming matches the first SoC generation w=
ith
> > a dedicated calibration block). Shared structures and function calls ar=
e
> > placed into tegra-mipi-cal.h.
> >=20
> > Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com> # tegra20, paralle=
l
> > camera Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> I would like to merge this series, but in the v5 series there was a
> discussion about this host1x split:
>=20
> https://lore.kernel.org/linux-media/CAPVz0n0fkMYV-O4xWTBELd6HtKR83wrs+DS1=
wTV
> DOXdWuAK2OA@mail.gmail.com/
>=20
> Mikko Acked this patch, but Thierry objected. However, I saw no further
> updates on this, and I do agree with Svyatoslav that this patch makes
> sense.
>=20
> If there are no objections, then I plan to merge series this on Monday fo=
r
> v7.1.

Please do, I believe we ended up resolving that discussion offline.

Thanks,
Mikko

>=20
> Regards,
>=20
> 	Hans
>=20
> > ---
> >=20
> >  drivers/gpu/drm/tegra/dsi.c             |   1 +
> >  drivers/gpu/host1x/Makefile             |   1 +
> >  drivers/gpu/host1x/mipi.c               | 592 +++++-------------------
> >  drivers/gpu/host1x/tegra114-mipi.c      | 483 +++++++++++++++++++
> >  drivers/staging/media/tegra-video/csi.c |   1 +
> >  include/linux/host1x.h                  |  10 -
> >  include/linux/tegra-mipi-cal.h          |  57 +++
> >  7 files changed, 666 insertions(+), 479 deletions(-)
> >  create mode 100644 drivers/gpu/host1x/tegra114-mipi.c
> >  create mode 100644 include/linux/tegra-mipi-cal.h
> >=20
> > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> > index 2c5aefe9621a..7f25c50621c9 100644
> > --- a/drivers/gpu/drm/tegra/dsi.c
> > +++ b/drivers/gpu/drm/tegra/dsi.c
> > @@ -14,6 +14,7 @@
> >=20
> >  #include <linux/pm_runtime.h>
> >  #include <linux/regulator/consumer.h>
> >  #include <linux/reset.h>
> >=20
> > +#include <linux/tegra-mipi-cal.h>
> >=20
> >  #include <video/mipi_display.h>
> >=20
> > diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
> > index ee5286ffe08d..fead483af0b4 100644
> > --- a/drivers/gpu/host1x/Makefile
> > +++ b/drivers/gpu/host1x/Makefile
> > @@ -9,6 +9,7 @@ host1x-y =3D \
> >=20
> >  	job.o \
> >  	debug.o \
> >  	mipi.o \
> >=20
> > +	tegra114-mipi.o \
> >=20
> >  	fence.o \
> >  	hw/host1x01.o \
> >  	hw/host1x02.o \
> >=20
> > diff --git a/drivers/gpu/host1x/mipi.c b/drivers/gpu/host1x/mipi.c
> > index fea9f491df66..01513b775d89 100644
> > --- a/drivers/gpu/host1x/mipi.c
> > +++ b/drivers/gpu/host1x/mipi.c
> > @@ -1,215 +1,110 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> >=20
> >  /*
> > =20
> >   * Copyright (C) 2013 NVIDIA Corporation
> >=20
> > - *
> > - * Permission to use, copy, modify, distribute, and sell this software
> > and its - * documentation for any purpose is hereby granted without fee=
,
> > provided that - * the above copyright notice appear in all copies and
> > that both that copyright - * notice and this permission notice appear i=
n
> > supporting documentation, and - * that the name of the copyright holder=
s
> > not be used in advertising or - * publicity pertaining to distribution =
of
> > the software without specific, - * written prior permission.  The
> > copyright holders make no representations - * about the suitability of
> > this software for any purpose.  It is provided "as - * is" without
> > express or implied warranty.
> > - *
> > - * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
> > SOFTWARE, - * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
> > FITNESS, IN NO - * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
> > SPECIAL, INDIRECT OR - * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVE=
R
> > RESULTING FROM LOSS OF USE, - * DATA OR PROFITS, WHETHER IN AN ACTION O=
F
> > CONTRACT, NEGLIGENCE OR OTHER - * TORTIOUS ACTION, ARISING OUT OF OR IN
> > CONNECTION WITH THE USE OR PERFORMANCE - * OF THIS SOFTWARE.
> > + * Copyright (C) 2025 Svyatoslav Ryhel <clamor95@gmail.com>
> >=20
> >   */
> > =20
> >  #include <linux/clk.h>
> >=20
> > -#include <linux/host1x.h>
> >=20
> >  #include <linux/io.h>
> >  #include <linux/iopoll.h>
> >=20
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> >=20
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/slab.h>
> >=20
> > +#include <linux/tegra-mipi-cal.h>
> >=20
> > -#include "dev.h"
> > -
> > -#define MIPI_CAL_CTRL			0x00
> > -#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
> > -#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
> > -#define MIPI_CAL_CTRL_CLKEN_OVR		(1 << 4)
> > -#define MIPI_CAL_CTRL_START		(1 << 0)
> > -
> > -#define MIPI_CAL_AUTOCAL_CTRL		0x01
> > -
> > -#define MIPI_CAL_STATUS			0x02
> > -#define MIPI_CAL_STATUS_DONE		(1 << 16)
> > -#define MIPI_CAL_STATUS_ACTIVE		(1 <<  0)
> > -
> > -#define MIPI_CAL_CONFIG_CSIA		0x05
> > -#define MIPI_CAL_CONFIG_CSIB		0x06
> > -#define MIPI_CAL_CONFIG_CSIC		0x07
> > -#define MIPI_CAL_CONFIG_CSID		0x08
> > -#define MIPI_CAL_CONFIG_CSIE		0x09
> > -#define MIPI_CAL_CONFIG_CSIF		0x0a
> > -#define MIPI_CAL_CONFIG_DSIA		0x0e
> > -#define MIPI_CAL_CONFIG_DSIB		0x0f
> > -#define MIPI_CAL_CONFIG_DSIC		0x10
> > -#define MIPI_CAL_CONFIG_DSID		0x11
> > -
> > -#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
> > -#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
> > -#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
> > -#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
> > -#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
> > -#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
> > -#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
> > -
> > -/* for data and clock lanes */
> > -#define MIPI_CAL_CONFIG_SELECT		(1 << 21)
> > -
> > -/* for data lanes */
> > -#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
> > -#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
> > -#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
> > -
> > -/* for clock lanes */
> > -#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
> > -#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
> > -
> > -#define MIPI_CAL_BIAS_PAD_CFG0		0x16
> > -#define MIPI_CAL_BIAS_PAD_PDVCLAMP	(1 << 1)
> > -#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	(1 << 0)
> > -
> > -#define MIPI_CAL_BIAS_PAD_CFG1		0x17
> > -#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
> > -#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
> > -
> > -#define MIPI_CAL_BIAS_PAD_CFG2		0x18
> > -#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
> > -#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
> > -#define MIPI_CAL_BIAS_PAD_PDVREG	(1 << 1)
> > -
> > -struct tegra_mipi_pad {
> > -	unsigned long data;
> > -	unsigned long clk;
> > -};
> > -
> > -struct tegra_mipi_soc {
> > -	bool has_clk_lane;
> > -	const struct tegra_mipi_pad *pads;
> > -	unsigned int num_pads;
> > -
> > -	bool clock_enable_override;
> > -	bool needs_vclamp_ref;
> > -
> > -	/* bias pad configuration settings */
> > -	u8 pad_drive_down_ref;
> > -	u8 pad_drive_up_ref;
> > +/* only need to support one provider */
> > +static struct {
> > +	struct device_node *np;
> > +	const struct tegra_mipi_ops *ops;
> > +} provider;
> >=20
> > -	u8 pad_vclamp_level;
> > -	u8 pad_vauxp_level;
> > -
> > -	/* calibration settings for data lanes */
> > -	u8 hspdos;
> > -	u8 hspuos;
> > -	u8 termos;
> > -
> > -	/* calibration settings for clock lanes */
> > -	u8 hsclkpdos;
> > -	u8 hsclkpuos;
> > -};
> > -
> > -struct tegra_mipi {
> > -	const struct tegra_mipi_soc *soc;
> > -	struct device *dev;
> > -	void __iomem *regs;
> > -	struct mutex lock;
> > -	struct clk *clk;
> > -
> > -	unsigned long usage_count;
> > -};
> > -
> > -struct tegra_mipi_device {
> > -	struct platform_device *pdev;
> > -	struct tegra_mipi *mipi;
> > -	struct device *device;
> > -	unsigned long pads;
> > -};
> > -
> > -static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> > -				   unsigned long offset)
> > +/**
> > + * tegra_mipi_enable - Enable the Tegra MIPI calibration device.
> > + * @device: Handle to the Tegra MIPI calibration device.
> > + *
> > + * This calls the enable sequence for the Tegra MIPI calibration devic=
e.
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int tegra_mipi_enable(struct tegra_mipi_device *device)
> >=20
> >  {
> >=20
> > -	return readl(mipi->regs + (offset << 2));
> > -}
> > +	if (device->ops->enable)
> > +		return device->ops->enable(device);
> >=20
> > -static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 valu=
e,
> > -				     unsigned long offset)
> > -{
> > -	writel(value, mipi->regs + (offset << 2));
> > +	return 0;
> >=20
> >  }
> >=20
> > +EXPORT_SYMBOL(tegra_mipi_enable);
> >=20
> > -static int tegra_mipi_power_up(struct tegra_mipi *mipi)
> > +/**
> > + * tegra_mipi_disable - Disable the Tegra MIPI calibration device.
> > + * @device: Handle to the Tegra MIPI calibration device.
> > + *
> > + * This calls the disable sequence for the Tegra MIPI calibration devi=
ce.
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int tegra_mipi_disable(struct tegra_mipi_device *device)
> >=20
> >  {
> >=20
> > -	u32 value;
> > -	int err;
> > -
> > -	err =3D clk_enable(mipi->clk);
> > -	if (err < 0)
> > -		return err;
> > -
> > -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> > -	value &=3D ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> > -
> > -	if (mipi->soc->needs_vclamp_ref)
> > -		value |=3D MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> > -
> > -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> > -
> > -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> > -	value &=3D ~MIPI_CAL_BIAS_PAD_PDVREG;
> > -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> > -
> > -	clk_disable(mipi->clk);
> > +	if (device->ops->disable)
> > +		return device->ops->disable(device);
> >=20
> >  	return 0;
> > =20
> >  }
> >=20
> > +EXPORT_SYMBOL(tegra_mipi_disable);
> >=20
> > -static int tegra_mipi_power_down(struct tegra_mipi *mipi)
> > +/**
> > + * tegra_mipi_start_calibration - Start the Tegra MIPI calibration
> > sequence. + * @device: Handle to the Tegra MIPI calibration device.
> > + *
> > + * This initiates the calibration of CSI/DSI interfaces via the Tegra
> > MIPI
> > + * calibration device.
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
> >=20
> >  {
> >=20
> > -	u32 value;
> > -	int err;
> > -
> > -	err =3D clk_enable(mipi->clk);
> > -	if (err < 0)
> > -		return err;
> > -
> > -	/*
> > -	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
> > -	 * supplies the DSI pads. This must be kept enabled until none of the
> > -	 * DSI lanes are used anymore.
> > -	 */
> > -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> > -	value |=3D MIPI_CAL_BIAS_PAD_PDVREG;
> > -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> > -
> > -	/*
> > -	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
> > -	 * control a regulator that supplies current to the pre-driver logic.
> > -	 * Powering down this regulator causes DSI to fail, so it must remain
> > -	 * powered on until none of the DSI lanes are used anymore.
> > -	 */
> > -	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> > +	if (device->ops->start_calibration)
> > +		return device->ops->start_calibration(device);
> >=20
> > -	if (mipi->soc->needs_vclamp_ref)
> > -		value &=3D ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL(tegra_mipi_start_calibration);
> >=20
> > -	value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
> > -	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> > +/**
> > + * tegra_mipi_finish_calibration - Finish the Tegra MIPI calibration
> > sequence. + * @device: Handle to the Tegra MIPI calibration device.
> > + *
> > + * This completes the calibration of CSI/DSI interfaces via the Tegra
> > MIPI
> > + * calibration device.
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> > +{
> > +	if (device->ops->finish_calibration)
> > +		return device->ops->finish_calibration(device);
> >=20
> >  	return 0;
> > =20
> >  }
> >=20
> > +EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> >=20
> > +/**
> > + * tegra_mipi_request - Request a Tegra MIPI calibration device.
> > + * @device: Handle of the device requesting the MIPI calibration
> > function.
> > + * @np: Device node pointer of the device requesting the MIPI calibrat=
ion
> > + *	function.
> > + *
> > + * This function requests a reference to a Tegra MIPI calibration devi=
ce.
> > + *
> > + * Returns a pointer to the Tegra MIPI calibration device on success,
> > + * or an ERR_PTR-encoded error code on failure.
> > + */
> >=20
> >  struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> > =20
> >  					     struct device_node *np)
> > =20
> >  {
> >=20
> > -	struct tegra_mipi_device *dev;
> > +	struct tegra_mipi_device *mipidev;
> >=20
> >  	struct of_phandle_args args;
> >  	int err;
> >=20
> > @@ -219,321 +114,80 @@ struct tegra_mipi_device *tegra_mipi_request(str=
uct
> > device *device,>=20
> >  	if (err < 0)
> >  =09
> >  		return ERR_PTR(err);
> >=20
> > -	dev =3D kzalloc_obj(*dev);
> > -	if (!dev) {
> > +	if (provider.np !=3D args.np)
> > +		return ERR_PTR(-ENODEV);
> > +
> > +	mipidev =3D kzalloc_obj(*mipidev);
> > +	if (!mipidev) {
> >=20
> >  		err =3D -ENOMEM;
> >  		goto out;
> >  =09
> >  	}
> >=20
> > -	dev->pdev =3D of_find_device_by_node(args.np);
> > -	if (!dev->pdev) {
> > +	mipidev->pdev =3D of_find_device_by_node(args.np);
> > +	if (!mipidev->pdev) {
> >=20
> >  		err =3D -ENODEV;
> >  		goto free;
> >  =09
> >  	}
> >=20
> > -	dev->mipi =3D platform_get_drvdata(dev->pdev);
> > -	if (!dev->mipi) {
> > -		err =3D -EPROBE_DEFER;
> > -		goto put;
> > -	}
> > -
> >=20
> >  	of_node_put(args.np);
> >=20
> > -	dev->pads =3D args.args[0];
> > -	dev->device =3D device;
> > +	mipidev->ops =3D provider.ops;
> > +	mipidev->pads =3D args.args[0];
> >=20
> > -	return dev;
> > +	return mipidev;
> >=20
> > -put:
> > -	platform_device_put(dev->pdev);
> >=20
> >  free:
> > -	kfree(dev);
> > +	kfree(mipidev);
> >=20
> >  out:
> >  	of_node_put(args.np);
> >  	return ERR_PTR(err);
> > =20
> >  }
> >  EXPORT_SYMBOL(tegra_mipi_request);
> >=20
> > -void tegra_mipi_free(struct tegra_mipi_device *device)
> > +/**
> > + * tegra_mipi_free - Free a Tegra MIPI calibration device.
> > + * @mipidev: Handle to the Tegra MIPI calibration device.
> > + *
> > + * This function releases a reference to a Tegra MIPI calibration devi=
ce
> > + * previously requested by tegra_mipi_request().
> > + */
> > +void tegra_mipi_free(struct tegra_mipi_device *mipidev)
> >=20
> >  {
> >=20
> > -	platform_device_put(device->pdev);
> > -	kfree(device);
> > +	platform_device_put(mipidev->pdev);
> > +	kfree(mipidev);
> >=20
> >  }
> >  EXPORT_SYMBOL(tegra_mipi_free);
> >=20
> > -int tegra_mipi_enable(struct tegra_mipi_device *dev)
> > +static void tegra_mipi_remove_provider(void *data)
> >=20
> >  {
> >=20
> > -	int err =3D 0;
> > -
> > -	mutex_lock(&dev->mipi->lock);
> > -
> > -	if (dev->mipi->usage_count++ =3D=3D 0)
> > -		err =3D tegra_mipi_power_up(dev->mipi);
> > -
> > -	mutex_unlock(&dev->mipi->lock);
> > -
> > -	return err;
> > -
> > -}
> > -EXPORT_SYMBOL(tegra_mipi_enable);
> > -
> > -int tegra_mipi_disable(struct tegra_mipi_device *dev)
> > -{
> > -	int err =3D 0;
> > -
> > -	mutex_lock(&dev->mipi->lock);
> > -
> > -	if (--dev->mipi->usage_count =3D=3D 0)
> > -		err =3D tegra_mipi_power_down(dev->mipi);
> > -
> > -	mutex_unlock(&dev->mipi->lock);
> > -
> > -	return err;
> > -
> > -}
> > -EXPORT_SYMBOL(tegra_mipi_disable);
> > -
> > -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device)
> > -{
> > -	struct tegra_mipi *mipi =3D device->mipi;
> > -	void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
> > -	u32 value;
> > -	int err;
> > -
> > -	err =3D readl_relaxed_poll_timeout(status_reg, value,
> > -					 !(value &=20
MIPI_CAL_STATUS_ACTIVE) &&
> > -					 (value & MIPI_CAL_STATUS_DONE),=20
50,
> > -					 250000);
> > -	mutex_unlock(&device->mipi->lock);
> > -	clk_disable(device->mipi->clk);
> > -
> > -	return err;
> > +	provider.np =3D NULL;
> > +	provider.ops =3D NULL;
> >=20
> >  }
> >=20
> > -EXPORT_SYMBOL(tegra_mipi_finish_calibration);
> > -
> > -int tegra_mipi_start_calibration(struct tegra_mipi_device *device)
> > -{
> > -	const struct tegra_mipi_soc *soc =3D device->mipi->soc;
> > -	unsigned int i;
> > -	u32 value;
> > -	int err;
> > -
> > -	err =3D clk_enable(device->mipi->clk);
> > -	if (err < 0)
> > -		return err;
> > -
> > -	mutex_lock(&device->mipi->lock);
> > -
> > -	value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> > -		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> > -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
> > -
> > -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_BIAS_PAD_CFG2);
> > -	value &=3D ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
> > -	value &=3D ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
> > -	value |=3D MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
> > -	value |=3D MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
> > -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> > -
> > -	for (i =3D 0; i < soc->num_pads; i++) {
> > -		u32 clk =3D 0, data =3D 0;
> > -
> > -		if (device->pads & BIT(i)) {
> > -			data =3D MIPI_CAL_CONFIG_SELECT |
> > -			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> > -			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
> > -			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
> > -			clk =3D MIPI_CAL_CONFIG_SELECT |
> > -			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
> > -			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
> > -		}
> >=20
> > -		tegra_mipi_writel(device->mipi, data, soc->pads[i].data);
> > -
> > -		if (soc->has_clk_lane && soc->pads[i].clk !=3D 0)
> > -			tegra_mipi_writel(device->mipi, clk, soc-
>pads[i].clk);
> > -	}
> > -
> > -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
> > -	value &=3D ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
> > -	value &=3D ~MIPI_CAL_CTRL_PRESCALE(0x3);
> > -	value |=3D MIPI_CAL_CTRL_NOISE_FILTER(0xa);
> > -	value |=3D MIPI_CAL_CTRL_PRESCALE(0x2);
> > -
> > -	if (!soc->clock_enable_override)
> > -		value &=3D ~MIPI_CAL_CTRL_CLKEN_OVR;
> > -	else
> > -		value |=3D MIPI_CAL_CTRL_CLKEN_OVR;
> > -
> > -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
> > -
> > -	/* clear any pending status bits */
> > -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_STATUS);
> > -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_STATUS);
> > -
> > -	value =3D tegra_mipi_readl(device->mipi, MIPI_CAL_CTRL);
> > -	value |=3D MIPI_CAL_CTRL_START;
> > -	tegra_mipi_writel(device->mipi, value, MIPI_CAL_CTRL);
> > -
> > -	/*
> > -	 * Wait for min 72uS to let calibration logic finish calibration
> > -	 * sequence codes before waiting for pads idle state to apply the
> > -	 * results.
> > -	 */
> > -	usleep_range(75, 80);
> > -
> > -	return 0;
> > -}
> > -EXPORT_SYMBOL(tegra_mipi_start_calibration);
> > -
> > -static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIA },
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIB },
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIC },
> > -	{ .data =3D MIPI_CAL_CONFIG_CSID },
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIE },
> > -	{ .data =3D MIPI_CAL_CONFIG_DSIA },
> > -	{ .data =3D MIPI_CAL_CONFIG_DSIB },
> > -	{ .data =3D MIPI_CAL_CONFIG_DSIC },
> > -	{ .data =3D MIPI_CAL_CONFIG_DSID },
> > -};
> > -
> > -static const struct tegra_mipi_soc tegra114_mipi_soc =3D {
> > -	.has_clk_lane =3D false,
> > -	.pads =3D tegra114_mipi_pads,
> > -	.num_pads =3D ARRAY_SIZE(tegra114_mipi_pads),
> > -	.clock_enable_override =3D true,
> > -	.needs_vclamp_ref =3D true,
> > -	.pad_drive_down_ref =3D 0x2,
> > -	.pad_drive_up_ref =3D 0x0,
> > -	.pad_vclamp_level =3D 0x0,
> > -	.pad_vauxp_level =3D 0x0,
> > -	.hspdos =3D 0x0,
> > -	.hspuos =3D 0x4,
> > -	.termos =3D 0x5,
> > -	.hsclkpdos =3D 0x0,
> > -	.hsclkpuos =3D 0x4,
> > -};
> > -
> > -static const struct tegra_mipi_pad tegra124_mipi_pads[] =3D {
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK =
},
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK =
},
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK =
},
> > -	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK =
},
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D MIPI_CAL_CONFIG_CSIE_CLK  =
},
> > -	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK  =
},
> > -	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK  =
},
> > -};
> > -
> > -static const struct tegra_mipi_soc tegra124_mipi_soc =3D {
> > -	.has_clk_lane =3D true,
> > -	.pads =3D tegra124_mipi_pads,
> > -	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> > -	.clock_enable_override =3D true,
> > -	.needs_vclamp_ref =3D true,
> > -	.pad_drive_down_ref =3D 0x2,
> > -	.pad_drive_up_ref =3D 0x0,
> > -	.pad_vclamp_level =3D 0x0,
> > -	.pad_vauxp_level =3D 0x0,
> > -	.hspdos =3D 0x0,
> > -	.hspuos =3D 0x0,
> > -	.termos =3D 0x0,
> > -	.hsclkpdos =3D 0x1,
> > -	.hsclkpuos =3D 0x2,
> > -};
> > -
> > -static const struct tegra_mipi_soc tegra132_mipi_soc =3D {
> > -	.has_clk_lane =3D true,
> > -	.pads =3D tegra124_mipi_pads,
> > -	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> > -	.clock_enable_override =3D false,
> > -	.needs_vclamp_ref =3D false,
> > -	.pad_drive_down_ref =3D 0x0,
> > -	.pad_drive_up_ref =3D 0x3,
> > -	.pad_vclamp_level =3D 0x0,
> > -	.pad_vauxp_level =3D 0x0,
> > -	.hspdos =3D 0x0,
> > -	.hspuos =3D 0x0,
> > -	.termos =3D 0x0,
> > -	.hsclkpdos =3D 0x3,
> > -	.hsclkpuos =3D 0x2,
> > -};
> > -
> > -static const struct tegra_mipi_pad tegra210_mipi_pads[] =3D {
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D 0 },
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D 0 },
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D 0 },
> > -	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D 0 },
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D 0 },
> > -	{ .data =3D MIPI_CAL_CONFIG_CSIF, .clk =3D 0 },
> > -	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK }=
,
> > -	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK }=
,
> > -	{ .data =3D MIPI_CAL_CONFIG_DSIC, .clk =3D MIPI_CAL_CONFIG_DSIC_CLK }=
,
> > -	{ .data =3D MIPI_CAL_CONFIG_DSID, .clk =3D MIPI_CAL_CONFIG_DSID_CLK }=
,
> > -};
> > -
> > -static const struct tegra_mipi_soc tegra210_mipi_soc =3D {
> > -	.has_clk_lane =3D true,
> > -	.pads =3D tegra210_mipi_pads,
> > -	.num_pads =3D ARRAY_SIZE(tegra210_mipi_pads),
> > -	.clock_enable_override =3D true,
> > -	.needs_vclamp_ref =3D false,
> > -	.pad_drive_down_ref =3D 0x0,
> > -	.pad_drive_up_ref =3D 0x3,
> > -	.pad_vclamp_level =3D 0x1,
> > -	.pad_vauxp_level =3D 0x1,
> > -	.hspdos =3D 0x0,
> > -	.hspuos =3D 0x2,
> > -	.termos =3D 0x0,
> > -	.hsclkpdos =3D 0x0,
> > -	.hsclkpuos =3D 0x2,
> > -};
> > -
> > -static const struct of_device_id tegra_mipi_of_match[] =3D {
> > -	{ .compatible =3D "nvidia,tegra114-mipi", .data =3D &tegra114_mipi_so=
c },
> > -	{ .compatible =3D "nvidia,tegra124-mipi", .data =3D &tegra124_mipi_so=
c },
> > -	{ .compatible =3D "nvidia,tegra132-mipi", .data =3D &tegra132_mipi_so=
c },
> > -	{ .compatible =3D "nvidia,tegra210-mipi", .data =3D &tegra210_mipi_so=
c },
> > -	{ },
> > -};
> > -
> > -static int tegra_mipi_probe(struct platform_device *pdev)
> > +/**
> > + * devm_tegra_mipi_add_provider - Managed registration of a Tegra MIPI
> > + *				  calibration function provider.
> > + * @device: Handle to the device providing the MIPI calibration functi=
on.
> > + * @np: Device node pointer of the device providing the MIPI calibrati=
on
> > + *	function.
> > + * @ops: Operations supported by the MIPI calibration device.
> > + *
> > + * This registers a device that provides MIPI calibration functions.
> > + * For Tegra20 and Tegra30, this is the CSI block, while Tegra114 and
> > + * newer SoC generations have a dedicated hardware block for these
> > + * functions.
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> > +int devm_tegra_mipi_add_provider(struct device *device, struct
> > device_node *np, +				 const struct=20
tegra_mipi_ops *ops)
> >=20
> >  {
> >=20
> > -	const struct of_device_id *match;
> > -	struct tegra_mipi *mipi;
> > -
> > -	match =3D of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
> > -	if (!match)
> > -		return -ENODEV;
> > +	if (provider.np)
> > +		return -EBUSY;
> >=20
> > -	mipi =3D devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
> > -	if (!mipi)
> > -		return -ENOMEM;
> > +	provider.np =3D np;
> > +	provider.ops =3D ops;
> >=20
> > -	mipi->soc =3D match->data;
> > -	mipi->dev =3D &pdev->dev;
> > -
> > -	mipi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> > -	if (IS_ERR(mipi->regs))
> > -		return PTR_ERR(mipi->regs);
> > -
> > -	mutex_init(&mipi->lock);
> > -
> > -	mipi->clk =3D devm_clk_get_prepared(&pdev->dev, NULL);
> > -	if (IS_ERR(mipi->clk)) {
> > -		dev_err(&pdev->dev, "failed to get clock\n");
> > -		return PTR_ERR(mipi->clk);
> > -	}
> > -
> > -	platform_set_drvdata(pdev, mipi);
> > -
> > -	return 0;
> > +	return devm_add_action_or_reset(device, tegra_mipi_remove_provider,
> > NULL);>=20
> >  }
> >=20
> > -
> > -struct platform_driver tegra_mipi_driver =3D {
> > -	.driver =3D {
> > -		.name =3D "tegra-mipi",
> > -		.of_match_table =3D tegra_mipi_of_match,
> > -	},
> > -	.probe =3D tegra_mipi_probe,
> > -};
> > +EXPORT_SYMBOL(devm_tegra_mipi_add_provider);
> > diff --git a/drivers/gpu/host1x/tegra114-mipi.c
> > b/drivers/gpu/host1x/tegra114-mipi.c new file mode 100644
> > index 000000000000..c084a09784d1
> > --- /dev/null
> > +++ b/drivers/gpu/host1x/tegra114-mipi.c
> > @@ -0,0 +1,483 @@
> > +/*
> > + * Copyright (C) 2013 NVIDIA Corporation
> > + *
> > + * Permission to use, copy, modify, distribute, and sell this software
> > and its + * documentation for any purpose is hereby granted without fee=
,
> > provided that + * the above copyright notice appear in all copies and
> > that both that copyright + * notice and this permission notice appear i=
n
> > supporting documentation, and + * that the name of the copyright holder=
s
> > not be used in advertising or + * publicity pertaining to distribution =
of
> > the software without specific, + * written prior permission.  The
> > copyright holders make no representations + * about the suitability of
> > this software for any purpose.  It is provided "as + * is" without
> > express or implied warranty.
> > + *
> > + * THE COPYRIGHT HOLDERS DISCLAIM ALL WARRANTIES WITH REGARD TO THIS
> > SOFTWARE, + * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND
> > FITNESS, IN NO + * EVENT SHALL THE COPYRIGHT HOLDERS BE LIABLE FOR ANY
> > SPECIAL, INDIRECT OR + * CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVE=
R
> > RESULTING FROM LOSS OF USE, + * DATA OR PROFITS, WHETHER IN AN ACTION O=
F
> > CONTRACT, NEGLIGENCE OR OTHER + * TORTIOUS ACTION, ARISING OUT OF OR IN
> > CONNECTION WITH THE USE OR PERFORMANCE + * OF THIS SOFTWARE.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/host1x.h>
> > +#include <linux/io.h>
> > +#include <linux/iopoll.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +#include <linux/tegra-mipi-cal.h>
> > +
> > +#include "dev.h"
> > +
> > +#define MIPI_CAL_CTRL			0x00
> > +#define MIPI_CAL_CTRL_NOISE_FILTER(x)	(((x) & 0xf) << 26)
> > +#define MIPI_CAL_CTRL_PRESCALE(x)	(((x) & 0x3) << 24)
> > +#define MIPI_CAL_CTRL_CLKEN_OVR		BIT(4)
> > +#define MIPI_CAL_CTRL_START		BIT(0)
> > +
> > +#define MIPI_CAL_AUTOCAL_CTRL		0x01
> > +
> > +#define MIPI_CAL_STATUS			0x02
> > +#define MIPI_CAL_STATUS_DONE		BIT(16)
> > +#define MIPI_CAL_STATUS_ACTIVE		BIT(0)
> > +
> > +#define MIPI_CAL_CONFIG_CSIA		0x05
> > +#define MIPI_CAL_CONFIG_CSIB		0x06
> > +#define MIPI_CAL_CONFIG_CSIC		0x07
> > +#define MIPI_CAL_CONFIG_CSID		0x08
> > +#define MIPI_CAL_CONFIG_CSIE		0x09
> > +#define MIPI_CAL_CONFIG_CSIF		0x0a
> > +#define MIPI_CAL_CONFIG_DSIA		0x0e
> > +#define MIPI_CAL_CONFIG_DSIB		0x0f
> > +#define MIPI_CAL_CONFIG_DSIC		0x10
> > +#define MIPI_CAL_CONFIG_DSID		0x11
> > +
> > +#define MIPI_CAL_CONFIG_DSIA_CLK	0x19
> > +#define MIPI_CAL_CONFIG_DSIB_CLK	0x1a
> > +#define MIPI_CAL_CONFIG_CSIAB_CLK	0x1b
> > +#define MIPI_CAL_CONFIG_DSIC_CLK	0x1c
> > +#define MIPI_CAL_CONFIG_CSICD_CLK	0x1c
> > +#define MIPI_CAL_CONFIG_DSID_CLK	0x1d
> > +#define MIPI_CAL_CONFIG_CSIE_CLK	0x1d
> > +
> > +/* for data and clock lanes */
> > +#define MIPI_CAL_CONFIG_SELECT		BIT(21)
> > +
> > +/* for data lanes */
> > +#define MIPI_CAL_CONFIG_HSPDOS(x)	(((x) & 0x1f) << 16)
> > +#define MIPI_CAL_CONFIG_HSPUOS(x)	(((x) & 0x1f) <<  8)
> > +#define MIPI_CAL_CONFIG_TERMOS(x)	(((x) & 0x1f) <<  0)
> > +
> > +/* for clock lanes */
> > +#define MIPI_CAL_CONFIG_HSCLKPDOSD(x)	(((x) & 0x1f) <<  8)
> > +#define MIPI_CAL_CONFIG_HSCLKPUOSD(x)	(((x) & 0x1f) <<  0)
> > +
> > +#define MIPI_CAL_BIAS_PAD_CFG0		0x16
> > +#define MIPI_CAL_BIAS_PAD_PDVCLAMP	BIT(1)
> > +#define MIPI_CAL_BIAS_PAD_E_VCLAMP_REF	BIT(0)
> > +
> > +#define MIPI_CAL_BIAS_PAD_CFG1		0x17
> > +#define MIPI_CAL_BIAS_PAD_DRV_DN_REF(x) (((x) & 0x7) << 16)
> > +#define MIPI_CAL_BIAS_PAD_DRV_UP_REF(x) (((x) & 0x7) << 8)
> > +
> > +#define MIPI_CAL_BIAS_PAD_CFG2		0x18
> > +#define MIPI_CAL_BIAS_PAD_VCLAMP(x)	(((x) & 0x7) << 16)
> > +#define MIPI_CAL_BIAS_PAD_VAUXP(x)	(((x) & 0x7) << 4)
> > +#define MIPI_CAL_BIAS_PAD_PDVREG	BIT(1)
> > +
> > +struct tegra_mipi_pad {
> > +	unsigned long data;
> > +	unsigned long clk;
> > +};
> > +
> > +struct tegra_mipi_soc {
> > +	bool has_clk_lane;
> > +	const struct tegra_mipi_pad *pads;
> > +	unsigned int num_pads;
> > +
> > +	bool clock_enable_override;
> > +	bool needs_vclamp_ref;
> > +
> > +	/* bias pad configuration settings */
> > +	u8 pad_drive_down_ref;
> > +	u8 pad_drive_up_ref;
> > +
> > +	u8 pad_vclamp_level;
> > +	u8 pad_vauxp_level;
> > +
> > +	/* calibration settings for data lanes */
> > +	u8 hspdos;
> > +	u8 hspuos;
> > +	u8 termos;
> > +
> > +	/* calibration settings for clock lanes */
> > +	u8 hsclkpdos;
> > +	u8 hsclkpuos;
> > +};
> > +
> > +struct tegra_mipi {
> > +	const struct tegra_mipi_soc *soc;
> > +	struct device *dev;
> > +	void __iomem *regs;
> > +	struct mutex lock; /* for register access */
> > +	struct clk *clk;
> > +
> > +	unsigned long usage_count;
> > +};
> > +
> > +static inline u32 tegra_mipi_readl(struct tegra_mipi *mipi,
> > +				   unsigned long offset)
> > +{
> > +	return readl(mipi->regs + (offset << 2));
> > +}
> > +
> > +static inline void tegra_mipi_writel(struct tegra_mipi *mipi, u32 valu=
e,
> > +				     unsigned long offset)
> > +{
> > +	writel(value, mipi->regs + (offset << 2));
> > +}
> > +
> > +static int tegra114_mipi_power_up(struct tegra_mipi *mipi)
> > +{
> > +	u32 value;
> > +	int err;
> > +
> > +	err =3D clk_enable(mipi->clk);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> > +	value &=3D ~MIPI_CAL_BIAS_PAD_PDVCLAMP;
> > +
> > +	if (mipi->soc->needs_vclamp_ref)
> > +		value |=3D MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> > +
> > +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> > +
> > +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> > +	value &=3D ~MIPI_CAL_BIAS_PAD_PDVREG;
> > +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> > +
> > +	clk_disable(mipi->clk);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra114_mipi_power_down(struct tegra_mipi *mipi)
> > +{
> > +	u32 value;
> > +	int err;
> > +
> > +	err =3D clk_enable(mipi->clk);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	/*
> > +	 * The MIPI_CAL_BIAS_PAD_PDVREG controls a voltage regulator that
> > +	 * supplies the DSI pads. This must be kept enabled until none of the
> > +	 * DSI lanes are used anymore.
> > +	 */
> > +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> > +	value |=3D MIPI_CAL_BIAS_PAD_PDVREG;
> > +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> > +
> > +	/*
> > +	 * MIPI_CAL_BIAS_PAD_PDVCLAMP and MIPI_CAL_BIAS_PAD_E_VCLAMP_REF
> > +	 * control a regulator that supplies current to the pre-driver logic.
> > +	 * Powering down this regulator causes DSI to fail, so it must remain
> > +	 * powered on until none of the DSI lanes are used anymore.
> > +	 */
> > +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG0);
> > +
> > +	if (mipi->soc->needs_vclamp_ref)
> > +		value &=3D ~MIPI_CAL_BIAS_PAD_E_VCLAMP_REF;
> > +
> > +	value |=3D MIPI_CAL_BIAS_PAD_PDVCLAMP;
> > +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int tegra114_mipi_enable(struct tegra_mipi_device *mipidev)
> > +{
> > +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> > +	int err =3D 0;
> > +
> > +	mutex_lock(&mipi->lock);
> > +
> > +	if (mipi->usage_count++ =3D=3D 0)
> > +		err =3D tegra114_mipi_power_up(mipi);
> > +
> > +	mutex_unlock(&mipi->lock);
> > +
> > +	return err;
> > +}
> > +
> > +static int tegra114_mipi_disable(struct tegra_mipi_device *mipidev)
> > +{
> > +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> > +	int err =3D 0;
> > +
> > +	mutex_lock(&mipi->lock);
> > +
> > +	if (--mipi->usage_count =3D=3D 0)
> > +		err =3D tegra114_mipi_power_down(mipi);
> > +
> > +	mutex_unlock(&mipi->lock);
> > +
> > +	return err;
> > +}
> > +
> > +static int tegra114_mipi_finish_calibration(struct tegra_mipi_device
> > *mipidev) +{
> > +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> > +	void __iomem *status_reg =3D mipi->regs + (MIPI_CAL_STATUS << 2);
> > +	u32 value;
> > +	int err;
> > +
> > +	err =3D readl_relaxed_poll_timeout(status_reg, value,
> > +					 !(value &=20
MIPI_CAL_STATUS_ACTIVE) &&
> > +					 (value & MIPI_CAL_STATUS_DONE),=20
50,
> > +					 250000);
> > +	mutex_unlock(&mipi->lock);
> > +	clk_disable(mipi->clk);
> > +
> > +	return err;
> > +}
> > +
> > +static int tegra114_mipi_start_calibration(struct tegra_mipi_device
> > *mipidev) +{
> > +	struct tegra_mipi *mipi =3D platform_get_drvdata(mipidev->pdev);
> > +	const struct tegra_mipi_soc *soc =3D mipi->soc;
> > +	unsigned int i;
> > +	u32 value;
> > +	int err;
> > +
> > +	err =3D clk_enable(mipi->clk);
> > +	if (err < 0)
> > +		return err;
> > +
> > +	mutex_lock(&mipi->lock);
> > +
> > +	value =3D MIPI_CAL_BIAS_PAD_DRV_DN_REF(soc->pad_drive_down_ref) |
> > +		MIPI_CAL_BIAS_PAD_DRV_UP_REF(soc->pad_drive_up_ref);
> > +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG1);
> > +
> > +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_BIAS_PAD_CFG2);
> > +	value &=3D ~MIPI_CAL_BIAS_PAD_VCLAMP(0x7);
> > +	value &=3D ~MIPI_CAL_BIAS_PAD_VAUXP(0x7);
> > +	value |=3D MIPI_CAL_BIAS_PAD_VCLAMP(soc->pad_vclamp_level);
> > +	value |=3D MIPI_CAL_BIAS_PAD_VAUXP(soc->pad_vauxp_level);
> > +	tegra_mipi_writel(mipi, value, MIPI_CAL_BIAS_PAD_CFG2);
> > +
> > +	for (i =3D 0; i < soc->num_pads; i++) {
> > +		u32 clk =3D 0, data =3D 0;
> > +
> > +		if (mipidev->pads & BIT(i)) {
> > +			data =3D MIPI_CAL_CONFIG_SELECT |
> > +			       MIPI_CAL_CONFIG_HSPDOS(soc->hspdos) |
> > +			       MIPI_CAL_CONFIG_HSPUOS(soc->hspuos) |
> > +			       MIPI_CAL_CONFIG_TERMOS(soc->termos);
> > +			clk =3D MIPI_CAL_CONFIG_SELECT |
> > +			      MIPI_CAL_CONFIG_HSCLKPDOSD(soc->hsclkpdos) |
> > +			      MIPI_CAL_CONFIG_HSCLKPUOSD(soc->hsclkpuos);
> > +		}
> > +
> > +		tegra_mipi_writel(mipi, data, soc->pads[i].data);
> > +
> > +		if (soc->has_clk_lane && soc->pads[i].clk !=3D 0)
> > +			tegra_mipi_writel(mipi, clk, soc->pads[i].clk);
> > +	}
> > +
> > +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
> > +	value &=3D ~MIPI_CAL_CTRL_NOISE_FILTER(0xf);
> > +	value &=3D ~MIPI_CAL_CTRL_PRESCALE(0x3);
> > +	value |=3D MIPI_CAL_CTRL_NOISE_FILTER(0xa);
> > +	value |=3D MIPI_CAL_CTRL_PRESCALE(0x2);
> > +
> > +	if (!soc->clock_enable_override)
> > +		value &=3D ~MIPI_CAL_CTRL_CLKEN_OVR;
> > +	else
> > +		value |=3D MIPI_CAL_CTRL_CLKEN_OVR;
> > +
> > +	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
> > +
> > +	/* clear any pending status bits */
> > +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_STATUS);
> > +	tegra_mipi_writel(mipi, value, MIPI_CAL_STATUS);
> > +
> > +	value =3D tegra_mipi_readl(mipi, MIPI_CAL_CTRL);
> > +	value |=3D MIPI_CAL_CTRL_START;
> > +	tegra_mipi_writel(mipi, value, MIPI_CAL_CTRL);
> > +
> > +	/*
> > +	 * Wait for min 72uS to let calibration logic finish calibration
> > +	 * sequence codes before waiting for pads idle state to apply the
> > +	 * results.
> > +	 */
> > +	usleep_range(75, 80);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct tegra_mipi_ops tegra114_mipi_ops =3D {
> > +	.enable =3D tegra114_mipi_enable,
> > +	.disable =3D tegra114_mipi_disable,
> > +	.start_calibration =3D tegra114_mipi_start_calibration,
> > +	.finish_calibration =3D tegra114_mipi_finish_calibration,
> > +};
> > +
> > +static const struct tegra_mipi_pad tegra114_mipi_pads[] =3D {
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIA },
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIB },
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIC },
> > +	{ .data =3D MIPI_CAL_CONFIG_CSID },
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIE },
> > +	{ .data =3D MIPI_CAL_CONFIG_DSIA },
> > +	{ .data =3D MIPI_CAL_CONFIG_DSIB },
> > +	{ .data =3D MIPI_CAL_CONFIG_DSIC },
> > +	{ .data =3D MIPI_CAL_CONFIG_DSID },
> > +};
> > +
> > +static const struct tegra_mipi_soc tegra114_mipi_soc =3D {
> > +	.has_clk_lane =3D false,
> > +	.pads =3D tegra114_mipi_pads,
> > +	.num_pads =3D ARRAY_SIZE(tegra114_mipi_pads),
> > +	.clock_enable_override =3D true,
> > +	.needs_vclamp_ref =3D true,
> > +	.pad_drive_down_ref =3D 0x2,
> > +	.pad_drive_up_ref =3D 0x0,
> > +	.pad_vclamp_level =3D 0x0,
> > +	.pad_vauxp_level =3D 0x0,
> > +	.hspdos =3D 0x0,
> > +	.hspuos =3D 0x4,
> > +	.termos =3D 0x5,
> > +	.hsclkpdos =3D 0x0,
> > +	.hsclkpuos =3D 0x4,
> > +};
> > +
> > +static const struct tegra_mipi_pad tegra124_mipi_pads[] =3D {
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK =
},
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D MIPI_CAL_CONFIG_CSIAB_CLK =
},
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK =
},
> > +	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D MIPI_CAL_CONFIG_CSICD_CLK =
},
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D MIPI_CAL_CONFIG_CSIE_CLK  =
},
> > +	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK  =
},
> > +	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK  =
},
> > +};
> > +
> > +static const struct tegra_mipi_soc tegra124_mipi_soc =3D {
> > +	.has_clk_lane =3D true,
> > +	.pads =3D tegra124_mipi_pads,
> > +	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> > +	.clock_enable_override =3D true,
> > +	.needs_vclamp_ref =3D true,
> > +	.pad_drive_down_ref =3D 0x2,
> > +	.pad_drive_up_ref =3D 0x0,
> > +	.pad_vclamp_level =3D 0x0,
> > +	.pad_vauxp_level =3D 0x0,
> > +	.hspdos =3D 0x0,
> > +	.hspuos =3D 0x0,
> > +	.termos =3D 0x0,
> > +	.hsclkpdos =3D 0x1,
> > +	.hsclkpuos =3D 0x2,
> > +};
> > +
> > +static const struct tegra_mipi_soc tegra132_mipi_soc =3D {
> > +	.has_clk_lane =3D true,
> > +	.pads =3D tegra124_mipi_pads,
> > +	.num_pads =3D ARRAY_SIZE(tegra124_mipi_pads),
> > +	.clock_enable_override =3D false,
> > +	.needs_vclamp_ref =3D false,
> > +	.pad_drive_down_ref =3D 0x0,
> > +	.pad_drive_up_ref =3D 0x3,
> > +	.pad_vclamp_level =3D 0x0,
> > +	.pad_vauxp_level =3D 0x0,
> > +	.hspdos =3D 0x0,
> > +	.hspuos =3D 0x0,
> > +	.termos =3D 0x0,
> > +	.hsclkpdos =3D 0x3,
> > +	.hsclkpuos =3D 0x2,
> > +};
> > +
> > +static const struct tegra_mipi_pad tegra210_mipi_pads[] =3D {
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIA, .clk =3D 0 },
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIB, .clk =3D 0 },
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIC, .clk =3D 0 },
> > +	{ .data =3D MIPI_CAL_CONFIG_CSID, .clk =3D 0 },
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIE, .clk =3D 0 },
> > +	{ .data =3D MIPI_CAL_CONFIG_CSIF, .clk =3D 0 },
> > +	{ .data =3D MIPI_CAL_CONFIG_DSIA, .clk =3D MIPI_CAL_CONFIG_DSIA_CLK }=
,
> > +	{ .data =3D MIPI_CAL_CONFIG_DSIB, .clk =3D MIPI_CAL_CONFIG_DSIB_CLK }=
,
> > +	{ .data =3D MIPI_CAL_CONFIG_DSIC, .clk =3D MIPI_CAL_CONFIG_DSIC_CLK }=
,
> > +	{ .data =3D MIPI_CAL_CONFIG_DSID, .clk =3D MIPI_CAL_CONFIG_DSID_CLK }=
,
> > +};
> > +
> > +static const struct tegra_mipi_soc tegra210_mipi_soc =3D {
> > +	.has_clk_lane =3D true,
> > +	.pads =3D tegra210_mipi_pads,
> > +	.num_pads =3D ARRAY_SIZE(tegra210_mipi_pads),
> > +	.clock_enable_override =3D true,
> > +	.needs_vclamp_ref =3D false,
> > +	.pad_drive_down_ref =3D 0x0,
> > +	.pad_drive_up_ref =3D 0x3,
> > +	.pad_vclamp_level =3D 0x1,
> > +	.pad_vauxp_level =3D 0x1,
> > +	.hspdos =3D 0x0,
> > +	.hspuos =3D 0x2,
> > +	.termos =3D 0x0,
> > +	.hsclkpdos =3D 0x0,
> > +	.hsclkpuos =3D 0x2,
> > +};
> > +
> > +static const struct of_device_id tegra_mipi_of_match[] =3D {
> > +	{ .compatible =3D "nvidia,tegra114-mipi", .data =3D &tegra114_mipi_so=
c },
> > +	{ .compatible =3D "nvidia,tegra124-mipi", .data =3D &tegra124_mipi_so=
c },
> > +	{ .compatible =3D "nvidia,tegra132-mipi", .data =3D &tegra132_mipi_so=
c },
> > +	{ .compatible =3D "nvidia,tegra210-mipi", .data =3D &tegra210_mipi_so=
c },
> > +	{ },
> > +};
> > +
> > +static int tegra_mipi_probe(struct platform_device *pdev)
> > +{
> > +	const struct of_device_id *match;
> > +	struct tegra_mipi *mipi;
> > +
> > +	match =3D of_match_node(tegra_mipi_of_match, pdev->dev.of_node);
> > +	if (!match)
> > +		return -ENODEV;
> > +
> > +	mipi =3D devm_kzalloc(&pdev->dev, sizeof(*mipi), GFP_KERNEL);
> > +	if (!mipi)
> > +		return -ENOMEM;
> > +
> > +	mipi->soc =3D match->data;
> > +	mipi->dev =3D &pdev->dev;
> > +
> > +	mipi->regs =3D devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> > +	if (IS_ERR(mipi->regs))
> > +		return PTR_ERR(mipi->regs);
> > +
> > +	mutex_init(&mipi->lock);
> > +
> > +	mipi->clk =3D devm_clk_get_prepared(&pdev->dev, NULL);
> > +	if (IS_ERR(mipi->clk)) {
> > +		dev_err(&pdev->dev, "failed to get clock\n");
> > +		return PTR_ERR(mipi->clk);
> > +	}
> > +
> > +	platform_set_drvdata(pdev, mipi);
> > +
> > +	return devm_tegra_mipi_add_provider(&pdev->dev, pdev->dev.of_node,
> > +					    &tegra114_mipi_ops);
> > +}
> > +
> > +struct platform_driver tegra_mipi_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "tegra-mipi",
> > +		.of_match_table =3D tegra_mipi_of_match,
> > +	},
> > +	.probe =3D tegra_mipi_probe,
> > +};
> > diff --git a/drivers/staging/media/tegra-video/csi.c
> > b/drivers/staging/media/tegra-video/csi.c index
> > f858c05ce6c9..bcaea20c3025 100644
> > --- a/drivers/staging/media/tegra-video/csi.c
> > +++ b/drivers/staging/media/tegra-video/csi.c
> > @@ -12,6 +12,7 @@
> >=20
> >  #include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> >=20
> > +#include <linux/tegra-mipi-cal.h>
> >=20
> >  #include <media/v4l2-fwnode.h>
> >=20
> > diff --git a/include/linux/host1x.h b/include/linux/host1x.h
> > index 5e7a63143a4a..1f5f55917d1c 100644
> > --- a/include/linux/host1x.h
> > +++ b/include/linux/host1x.h
> > @@ -453,16 +453,6 @@ void host1x_client_unregister(struct host1x_client
> > *client);>=20
> >  int host1x_client_suspend(struct host1x_client *client);
> >  int host1x_client_resume(struct host1x_client *client);
> >=20
> > -struct tegra_mipi_device;
> > -
> > -struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> > -					     struct device_node *np);
> > -void tegra_mipi_free(struct tegra_mipi_device *device);
> > -int tegra_mipi_enable(struct tegra_mipi_device *device);
> > -int tegra_mipi_disable(struct tegra_mipi_device *device);
> > -int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> > -int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> > -
> >=20
> >  /* host1x memory contexts */
> > =20
> >  struct host1x_memory_context {
> >=20
> > diff --git a/include/linux/tegra-mipi-cal.h
> > b/include/linux/tegra-mipi-cal.h new file mode 100644
> > index 000000000000..2a540b50f65d
> > --- /dev/null
> > +++ b/include/linux/tegra-mipi-cal.h
> > @@ -0,0 +1,57 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> > +#ifndef __TEGRA_MIPI_CAL_H_
> > +#define __TEGRA_MIPI_CAL_H_
> > +
> > +struct tegra_mipi_device {
> > +	const struct tegra_mipi_ops *ops;
> > +	struct platform_device *pdev;
> > +	unsigned long pads;
> > +};
> > +
> > +/**
> > + * Operations for Tegra MIPI calibration device
> > + */
> > +struct tegra_mipi_ops {
> > +	/**
> > +	 * @enable:
> > +	 *
> > +	 * Enable MIPI calibration device
> > +	 */
> > +	int (*enable)(struct tegra_mipi_device *device);
> > +
> > +	/**
> > +	 * @disable:
> > +	 *
> > +	 * Disable MIPI calibration device
> > +	 */
> > +	int (*disable)(struct tegra_mipi_device *device);
> > +
> > +	/**
> > +	 * @start_calibration:
> > +	 *
> > +	 * Start MIPI calibration
> > +	 */
> > +	int (*start_calibration)(struct tegra_mipi_device *device);
> > +
> > +	/**
> > +	 * @finish_calibration:
> > +	 *
> > +	 * Finish MIPI calibration
> > +	 */
> > +	int (*finish_calibration)(struct tegra_mipi_device *device);
> > +};
> > +
> > +int devm_tegra_mipi_add_provider(struct device *device, struct
> > device_node *np, +				 const struct=20
tegra_mipi_ops *ops);
> > +
> > +struct tegra_mipi_device *tegra_mipi_request(struct device *device,
> > +					     struct device_node *np);
> > +void tegra_mipi_free(struct tegra_mipi_device *device);
> > +
> > +int tegra_mipi_enable(struct tegra_mipi_device *device);
> > +int tegra_mipi_disable(struct tegra_mipi_device *device);
> > +int tegra_mipi_start_calibration(struct tegra_mipi_device *device);
> > +int tegra_mipi_finish_calibration(struct tegra_mipi_device *device);
> > +
> > +#endif /* __TEGRA_MIPI_CAL_H_ */





