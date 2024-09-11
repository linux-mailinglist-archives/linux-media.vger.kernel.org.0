Return-Path: <linux-media+bounces-18172-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5597598C
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:36:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C182B233C6
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 632EF1B4C2E;
	Wed, 11 Sep 2024 17:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FwvE0o42";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fv14+9p9"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2721A1B1D53;
	Wed, 11 Sep 2024 17:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726076194; cv=fail; b=L+xCPQgdbX+3oxHNP8WDEXgQg+6ECYgNsN4m5JXTGtuCaN2Ea3mukzMkqHmyaS5MR3dCkfhrgpTY5WEV7hFp7TE41h2Yt+KZxM8DKxCl32x0k77WqX/0om6uM61wjpnukGFMkFWlOF6wwpkSaMglSiDNtR1uYNULuBfCp65mqqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726076194; c=relaxed/simple;
	bh=/gEZNYn9ej+ONEnR5oytzw7p+ic3sQVV52B4VqSUk8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NSdX1sto3gXV8wJDBnQtFmCQfY0+X5/3c/+bTjGaGQ7C2bQOxGM59pv+vBNGmpJqs5QuPnrbEPfzt5632FgWiBwwjjRKv+A3/sFbbccse1fNq47JV8IbXywzeBHgcTv5G0V2tbf5bNmQlqEM7USRFuQootXc7ykXyrUuFDAFyNA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=FwvE0o42; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fv14+9p9; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BCgBo6032140;
	Wed, 11 Sep 2024 17:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=JH+gvFAcILCSPEa
	3DPAWhAdAsl5arvXT5zTTVXo3uOY=; b=FwvE0o420s35mzRtMAJ+uqr8h6Z+rIA
	XTBeD4zaJWECQzgrBPcSuDMzBzjPn2D23HDJKbG7PEF4PGWo0R4Yh2u/PNHR/5jq
	WmxR6EjR7BaOJ5LARUmZZf5zu1nioqXsXz5aIQq4DT+EClg2WU6llxeiEsCylqUm
	9MLKsy/0xHrPJaQ/OEZtswSAGISfVGxaUQE5c1byw7+rNv61UxwA5otVhdD+x3Dr
	nvZhmxq24VoS6gpgnUvlAs0tSyefWnU7OCmzLBQMLql4YZilrUkloE7AdShv/Fpb
	wKXQ2eb3T6ylB9vBHimF2ywWhjifZ3+saNyCfdpb9v3HxZo24xlZUTA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gde08wtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:36:11 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48BGRCue040803;
	Wed, 11 Sep 2024 17:36:10 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9btahk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:36:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w9EsMzFlHvXpcDZSKtGwJpz0JZr+/u8d6LCNuF61gIYStD8C2MUtX3NV+D21Fz6wzaSqVf/3FJALy1kFh4ThOcfEpbZoKbZFOT2tWuV8tZ2Ehf+WO3SbaEk7OuJq0WSZvOGY7IRMTbtOzFAt8g5WBLs3hm0gum712aEwUyp8BrBLMPKfDwu1SXTIYsyynzGrKyYCGqWdRsIA2GmgNn48WxdmcpFAr6wRd8lfHuIHFDZxIwf6WZGXTuy4i4qWcHWYZq5C8rgUohiuUT9NUtMXNvzaK3o6qVGv/ipk8tcb/7SS30fJur4DLrD6ctwdbmtk3DUom82mf7Rk4tNVwsjzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JH+gvFAcILCSPEa3DPAWhAdAsl5arvXT5zTTVXo3uOY=;
 b=bmfMaG+yIpmdwL5VqK5u6bXWAXRSW4PI+/MA93KRZ1uju9Xvzq2I2CsGxt82PVQuU204mIny4A31Ym4xMPbNmEagyuXz37EjqFhFSgFin1UKrqrrfBWy8Nqb3SZyDq89ujzVloJ1H0YNCJFZm1m8LsmQU5I+GAqPoCUOUlyGdmKKAuMS89dFmugthlbDogyA6WW2hqjbQ5FQic+arK5b/qCt+lCVAPLVyhjMaGX/VmpA5z+K1hcP9ILuSU48gugKj0LuatNEHR1P5DsLU1gyAAETPyorA8SuJy7PyYnqxRJIfZxknTfasxIQ+0rYPh549BFAbeXbeZkk77/EQ+aANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JH+gvFAcILCSPEa3DPAWhAdAsl5arvXT5zTTVXo3uOY=;
 b=Fv14+9p9MdCSs1IHWPbrWf4up1kic+hl4WBBnctcOLPTtu7N2z/6yGQMxdUzs1UobxbGZgNnWaFhOF90YYNhOTmfUUxpGGG9x+tG/hKOBip3eS7AYWWGR6IoXfwWAGYRve/IIOF/P/PZLX4JiYjECnLwct1DhBRA+0bjyAl534U=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DM6PR10MB4393.namprd10.prod.outlook.com (2603:10b6:5:223::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 17:36:07 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 17:36:07 +0000
Date: Wed, 11 Sep 2024 18:36:04 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Richard Narron <richard@aaazen.com>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marcin Wojtas <marcin.s.wojtas@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-mm@kvack.org,
        stable@vger.kernel.org
Subject: Re: [PATCH hotfix 6.11] minmax: reduce egregious min/max macro
 expansion
Message-ID: <0a73fda5-e6b5-446c-832a-e6df8d3c0c90@lucifer.local>
References: <20240911153457.1005227-1-lorenzo.stoakes@oracle.com>
 <181dec64-5906-4cdd-bb29-40bc7c02d63e@redhat.com>
 <cd6e01fb-4605-4f5f-835e-592ca70ebe03@stanley.mountain>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd6e01fb-4605-4f5f-835e-592ca70ebe03@stanley.mountain>
X-ClientProxiedBy: LO4P123CA0176.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::19) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DM6PR10MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f020de-7561-4927-dd06-08dcd28837cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PLsAFlpGbE/V7VDfGZoSj8tSoB8A6I+/lCwJh6t5aMjSLtD/It6pYrb7/JxD?=
 =?us-ascii?Q?maUgoAREfE2UkRZwE/oClcEn3eTy7D2Aq8wcjFZKtvZ2V88u5Yb0Ubz8zVVV?=
 =?us-ascii?Q?mXBllvGydqX/rJkVmSWbJIKq5NRc/W8CzUL+gaEExhp7Eu2ePRJLtjiVTFXl?=
 =?us-ascii?Q?qsaoFapw/wDfGUH6fsFdTg10t7AoLTjM4klbTkwXuNi0rNmvFMh9gDkqYWOt?=
 =?us-ascii?Q?YMt+VxoHvC+HRhRsdW4D/xKQMCVNB7rDwgLV5H9HJ6Qnw3Ll5VUopkz7BAhW?=
 =?us-ascii?Q?cO0rE9IJpdwDMgv+cJRzsfGMTBwoDgkPTazMcQ/F/ZGLSdsVxvYYqSX2pQRC?=
 =?us-ascii?Q?Ewph6RGbsF5kRxNyh6qHlUrBNM5rKQG3UG3/3KK40JmbXWtOT7w1kBjvHrav?=
 =?us-ascii?Q?Q5iYKRDl6n9YJFurj8aGFdJe5681srOScuURbJmuqOUimJDG4f7UKPqaIA81?=
 =?us-ascii?Q?RsJmId9SOS1Ww80xJeN2aaHLVc5sbbuHrYbmpbiW5UvYemLiW62uCA0MwfG0?=
 =?us-ascii?Q?lOyw7pTdzmvP7kW1E8NpcUbzz/b08hrDUjKDsBUHCX2fdeHUeihT/NceeCvv?=
 =?us-ascii?Q?wUsHV+MhmC4WnKud7DqSgcQk7INVhTAeTMXPe/J9BSB5GQwWGxj3qGWB/QGL?=
 =?us-ascii?Q?pAjOfAD3oAhqYkHT0r535xCV696LxHKe6jeY7VybS7VrYBXf7pgM2EJ6gI20?=
 =?us-ascii?Q?zju8nXgCknKyzefrSUgpAFjqgIZHJPNOaclzwPwacjsI5Yma0D3NF+uuQZGk?=
 =?us-ascii?Q?PZeS/kA27yWQjYgxp7Da8n3PfUJJk6bSu+MP1ciWx8iNVSgSG17zxcY8R8NZ?=
 =?us-ascii?Q?rg3SB4CywULY0U9fPZl0GscyZs3onmHbWKzklL1mhsGaZO5e0pUpnNqCYY7i?=
 =?us-ascii?Q?7rwh2wwHoTPWJlphizhOA4/qUUXnGdmWHfeSge1A64tiW1Zh4Xs4hMdlNwGC?=
 =?us-ascii?Q?7hJQZ5qvK2vJI+rubHMOpW+w/hgWoUksaTUYxLhcQcM33jig8O3VAxQJMCOO?=
 =?us-ascii?Q?nZvAt2utU+slQhLRkA5ShlM3ImSYS/wtsVSrYpOarpyeWNzvrkfw2ZGTniJ5?=
 =?us-ascii?Q?lN7SpJRjjmZCHO4vrteFMMi1SMKwhA3tHTfZCVpciWXfa18rVQ/ftA9EHE2O?=
 =?us-ascii?Q?NV5W4Jgkjjdq2e2UhEoYF2P/nAykPMFORaR0iUAfjtXrCFhubTnplB7KFxA7?=
 =?us-ascii?Q?Inl/kocIuMuTwR3pQXrSVgPnVXM7jna/Chgh05m9OzjMe+8qccZ6EtCEg+UI?=
 =?us-ascii?Q?52ApsB6zWfOK4+7C8W/OCAWa6TCFILE7ZmDujsJSu1MtgTfhzbbJjPdpr86l?=
 =?us-ascii?Q?0fZjGNF4xiolWXQSW3Mc49KeN9qTPVj1822SUidUThYXTl3/CMdxIyINwR+t?=
 =?us-ascii?Q?4+kuWKI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?htiMwbUJ2ni6Kwg71gh46PND+9u9I9WiuACM5h2Z6LWuIvXaj8IHkjxhPvVZ?=
 =?us-ascii?Q?/38DeWYcEMcy0ts4WVuJEXZPbLYxHSldBV1XaUJTtOIB1klKKez5oBezpG6i?=
 =?us-ascii?Q?KjByhswhSsW9HThccF9F/uQNtH7IJqsfKtVMZUXoe35VYt8KqRFqULErRvgM?=
 =?us-ascii?Q?1C5EALg0huYX5MuKpGu49LHOt9LySdTdoPlzh7Gfw+KjM/MYiOvY8TiNPrB/?=
 =?us-ascii?Q?5bJ/LbbICzbJsezDYzTxpOew0TfR2LBIn4vG6YbTinXNf8EK/l+ZqrF3oeVP?=
 =?us-ascii?Q?AWQhcxfQEcYA6T4f62JR5jcH2YizlZfdV5bayBR7RCHF52w4XgAWOShiHu9v?=
 =?us-ascii?Q?lQaLeItc+WT0Be6VFPcvndMNFNlwFVi1rpGOBunstQhs0XyoXPoq3pO1B1uH?=
 =?us-ascii?Q?KB+sTOy7p4ZmEPVpqzsA1YRUTd2Jel6JG7OEcGBmrO5a9iovtNy4DeplWwzr?=
 =?us-ascii?Q?KFmrcNhu3NmOi11afg46JMJ79zeO1Vj9vVBOiHFKe6/NAk4gAje0g2OcRC9R?=
 =?us-ascii?Q?ua0Je6aTpS7gQ1Rd7FJU73KrTAbk31WULmFix6Sdpg4T8U1MbYxRMYYarLER?=
 =?us-ascii?Q?tH6nkk4gF9hIJgiT2C39sDIoZhOF7PIpabkG8xQ/OwTaYlx8GkmKuY6EFPIT?=
 =?us-ascii?Q?gfhK12V1V5x53+sFKVTEhgU35l1wGc2ASPXzzJBu3ek6RYGGT1V/BVTsnKC+?=
 =?us-ascii?Q?uA+VG06O9qkxbPTEO0ZG7tywCmiM8BsHT241cOGIo4G4xtRp1+N0Ufd0JJ8B?=
 =?us-ascii?Q?Hez93UimN4l7IPKwwl1UxY3c0NNooE/iTH9jEtmNAUNQNOEKb2KuhLUIrXSU?=
 =?us-ascii?Q?BRJJHAcdJViQezT36DLgcyGn7ZehyZSGw+Uzso8BhDFMYqljHW5nZbmg4ulg?=
 =?us-ascii?Q?Xoj/ewtmeQxBE/v2a7Cf6IJKV7gNmOSWhmZ6dhHrBaepb2Y+EaIQakcZ3CjS?=
 =?us-ascii?Q?ADMKMiuJ6kyLfW9lHRCktf+P9E2niu8A5j2aGm2/peH1QYxJfo4WfvefuPV2?=
 =?us-ascii?Q?21sLAGFMSOXNNPi3Dc6YJ09+Y11zmLdieg8Gy8SB0Tk9m+IFd+JvOJ07ioJJ?=
 =?us-ascii?Q?pXf3SF27jE9bwm/aRaYJ1U58zLLVqHEEjz/nb8agV5Gd7TuddIyXpM7fU2xz?=
 =?us-ascii?Q?aAfh2kibEc2xzmbeKlfI6ytVXbwO+CKoCmMwTu2Lzcgr3EeHF9LUNdIXttxQ?=
 =?us-ascii?Q?q6E2UaMJKDbYKJvjopoYcvBaSRLpBlKIcnMXMpBR6GeXxa4iLbBJFOz2P5Gv?=
 =?us-ascii?Q?p87Alc3FvoFGFA3+RJabI1vvQ95y6oHdVcVHLXAbKkG1IUMmtZLrObMbmkFw?=
 =?us-ascii?Q?mSRd0Y1i7HwCnXwkEBW3oHRgC237ETPikqI3rsXqhZG20sbMkW/lQNIiPYoY?=
 =?us-ascii?Q?ab+N7ryEiVVF5aLWKiLiXzdA3DfrccPZOffIQLpkaJxIs2Xhyaapiy3WCUhU?=
 =?us-ascii?Q?+sM5IhM1ASjDrj6sdHu/M4B4Gt9SqnKELvDTIo7DIbQk8PS9vMH7UNCuB11T?=
 =?us-ascii?Q?GsYqlo5DKUd2wfN5XkjB1v57ccKefde4xy0f2eZR0caWrPvROXd/YpN2qo63?=
 =?us-ascii?Q?3hPJhrGo1LrjjB7S7QfAJeOyA7m/ltmSiseGp+gY84FOJeT1V2zV4H/wosK7?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	4amNPDSk6J+/KW1N8htYOP5DucMICiGHOtf5sDQZ/gBp68+Ce/a8H/9WXt+hA40pKVum86+hb447Ock/3XxHdu5e4UPYqVQLqsqgCN2ECni4kgO6VKnfGfOyFUdLx8YhRcD0Y0LbZOPdeBEMVhUT+mFaiVBn6mIVAYuZ8CXIor+wItvnp9UViJX32YMiNJReHVusghO+tdy0WkZfHHPp3ocnDWcm/R6pSPGR/SRfDnOccqF2b+qLZ2gD2IJVpvvV5AbSgJ9i9DVLgdAv1HZxigb+HmxdSaULo+qSww/s6gwg1iFdFep0bEdVmMXy3hygsP/OvR4oep89+Q6RoOZSTDPwu+hw5lPtaWiaogMRhABLDQ0ZP18N8RA3rPORUtYeXs0iQs0iGhHGJyyRD9cAuZdmgcnyuAHE3jWZZpsr30A6m7/norSxdl0JAkL6EOupxdVoIzjf8d2t9JRAbGOgBMZM52EcWJ9rkKRykUuxPXvvGIcIb6ji69WAqg9jo+K16M0uIsYQqIiAP55cF6EQOhVNK7tk0xq8UD0sVw0P8HO7jesRWA7ZXb+UKsVH33gNyba0WEVOJcDO0teIPosJ3ydXjbj3qEk0R8XpopG3eQQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f020de-7561-4927-dd06-08dcd28837cb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 17:36:07.5505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QFO5Q6/8B+NwehoTn8/f2vjejJwV6LWQHrgWRzCJYyBsyYdwY1MyL/FWADmG8slqivaguz2kXq8yaSdPgsphqFXWZ6RbD/9MapVQn3YePSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4393
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409110134
X-Proofpoint-ORIG-GUID: q2CZQd6XU8oAR-gHSXpFWQjOkjslgXiW
X-Proofpoint-GUID: q2CZQd6XU8oAR-gHSXpFWQjOkjslgXiW

On Wed, Sep 11, 2024 at 08:25:33PM GMT, Dan Carpenter wrote:
> On Wed, Sep 11, 2024 at 06:24:54PM +0200, Hans de Goede wrote:
> > Hi Lorenzo,
> >
> > On 9/11/24 5:34 PM, Lorenzo Stoakes wrote:
> > > Avoid nested min()/max() which results in egregious macro expansion.
> > >
> > > This issue was introduced by commit 867046cc7027 ("minmax: relax check to
> > > allow comparison between unsigned arguments and signed constants") [2].
> > >
> > > Work has been done to address the issue of egregious min()/max() macro
> > > expansion in commit 22f546873149 ("minmax: improve macro expansion and type
> > > checking") and related, however it appears that some issues remain on more
> > > tightly constrained systems.
> > >
> > > Adjust a few known-bad cases of deeply nested macros to avoid doing so to
> > > mitigate this. Porting the patch first proposed in [1] to Linus's tree.
> > >
> > > Running an allmodconfig build using the methodology described in [2] we
> > > observe a 35 MiB reduction in generated code.
> > >
> > > The difference is much more significant prior to recent minmax fixes which
> > > were not backported. As per [1] prior these the reduction is more like 200
> > > MiB.
> > >
> > > This resolves an issue with slackware 15.0 32-bit compilation as reported
> > > by Richard Narron.
> > >
> > > Presumably the min/max fixups would be difficult to backport, this patch
> > > should be easier and fix's Richard's problem in 5.15.
> > >
> > > [0]:https://lore.kernel.org/all/b97faef60ad24922b530241c5d7c933c@AcuMS.aculab.com/
> > > [1]:https://lore.kernel.org/lkml/5882b96e-1287-4390-8174-3316d39038ef@lucifer.local/
> > > [2]:https://lore.kernel.org/linux-mm/36aa2cad-1db1-4abf-8dd2-fb20484aabc3@lucifer.local/
> > >
> > > Reported-by: Richard Narron <richard@aaazen.com>
> > > Closes: https://lore.kernel.org/all/4a5321bd-b1f-1832-f0c-cea8694dc5aa@aaazen.com/
> > > Fixes: 867046cc7027 ("minmax: relax check to allow comparison between unsigned arguments and signed constants")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> >
> > Thank you for your patch.
> >
> > I must say that I'm not a fan of that this is patching 3 totally
> > unrelated files here in a single patch.
> >
> > This is e.g. going to be a problem if we need to revert one of
> > the changes because of regressions...
>
> These kinds of thing also complicates backporting to stable.  The stable kernel
> developers like whole, unmodified patches.  So if we have to fix something in
> sDIGIT_FITTING() then we'd want to pull this back instead of re-writing the fix
> on top of the original define (unmodified patches).  But now we have to backport
> the chunk which changes mvpp2 as well (whole patches).

Sure absolutely, as I said to Hans I did it all as one as I wanted to get
this out quickly as a favour to Richard, but this was a mistake, very
obviously it's much easier to have these separate.

About to send out a v2 with this done. Cheers!

>
> regards,
> dan carpenter
>

