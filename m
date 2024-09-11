Return-Path: <linux-media+bounces-18165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8289758A2
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 18:38:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8CE221C23427
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 16:38:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F631B3728;
	Wed, 11 Sep 2024 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="g0aHtFXu";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="FjV2R+NU"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1912E1AE852;
	Wed, 11 Sep 2024 16:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726072657; cv=fail; b=M91U1zgD1R6WYG7oEEhJQLFLkCLe730U+vR8GlI6WI5eIgwFpgSfu21YvjvlkinObJO6TvzYMzvaCagHX6CYkBIyDuCJ4w4s3zE6TG572lkOZxZyQNWMscG5W+6pCHdKa84igsbHDkaqkSEnLvxrj5XJsHVx31apEtDw9y3ojIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726072657; c=relaxed/simple;
	bh=fdTcbjkYNoj61DxfWngph1HqccJGySAi64VuZ1y+3JE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pgvS6MlLwgCsLtO/QUPErdTMFyzM7PItEa0ysMH0kSiqmIJLHr0DsflNSb61BUgaKMDqEfawMb5LWKcC5QTV7BuWKn6l/Vmax8HuGBOY0sUgnZzFzdayd3UBFj1lWOkwdUVmVwnlJZEqq0aE9gdbUfRbkjVytHlnbzLrUXGi/0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=g0aHtFXu; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=FjV2R+NU; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BCgDYG030749;
	Wed, 11 Sep 2024 16:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=q4D6YTQixtt7WPl
	wD6vZYV3g6U1srhvWMQAKo4SOjv4=; b=g0aHtFXuqhcjH2URtP0tJpzDZHHFIIP
	ZlLesG99IBiaEnKTa9GGnUo3fMFQA+jzjb0b0EpQc7AUpUAB/1l9K85f/dxQ5VUu
	gcmrP9sMx5YkGjHwLX/xdTUsSqasWwPx9YDBPJvcnKypj8DIgLTF4CXvV6jjsl2/
	S1CSHYZTFAxo/1KyJDJd+03+jqEMAdMNmVDS3wQoWkunSj+e0O6iNrd1HbJ7CFM7
	fNQSuZXJyeODpBppvu/GT+Zfw3phbwqGnvXsiF/5RkXTDVjP+oCFLwNKDUQV1mXn
	EZ3VIYimdfPo/9MAp5Y28Jh0L3KKDD0EfS8/yghCYG/Umj4aegXH00A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gevcrru2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 16:37:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48BGTnob019927;
	Wed, 11 Sep 2024 16:37:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9gqg3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 16:37:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2QbC3m7Gp8WqYc1fNOyACUbtUKZr7yGOrn+B8E6aPy1IQINWEv6uU1vCG+W8M05+YyzraMfLVcIcAcctZeF3w6mdL9bEvBWN+KcQirSdS23tIdMFHJud8Xar4579rWQP3XgPP8/+Sd62EH4S4mA9yNsXx1lZPyNRN3xPb7mTdJnF/18RTJ2iJHmNxOKPgHtXb9IQQKw3lk00EjvRzWDCibg052T4/6gsAFZMr5Uvl3Due9VpawlLMHomcOcyA+GujlJSQ/gcJ3VtI+Nih0yc7beB2sHy3iUyGfOE/MdusN2Deoz5hbuNAc+WWsXCamsClvYD+gRkjUSFDFI57Bi4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4D6YTQixtt7WPlwD6vZYV3g6U1srhvWMQAKo4SOjv4=;
 b=D/eKmAaab/Hi8nU2gqNjwFjSQsl2Q7zJonmv97OHxajIHTeM2AAD5gxx0Ju0hO2wO0NDg12jeBavkd6cpW8zJtG891V51BaVekka/tGhqtnS4Vd62NPPCGmSzaBIPGoQMesNCxQXNzP0LxaDG446S2IQxtzqzWFVR1/brLzIrN8UP1el3QTdaL77MTMXwFJUo6AK8FII3BROvT0VG0yalhUTJQAqlR8cmHj7KLgxnTBmBtVIa4w14l33A2uFqf41CJw5DIdaokF7mOED4dBIFIWeOkZDhcHASvlCGKzjF3qdWK3aSKNm67aANtjWlpet5PYNRx8G9gokIMfB7hg60g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4D6YTQixtt7WPlwD6vZYV3g6U1srhvWMQAKo4SOjv4=;
 b=FjV2R+NUEivM4UhSLtknKz62AnVbQ4zt6RTvWzJLPcP3VqwMmTUbDiqY2lVPnZxdh+gvoz0zl3C7fT/dBu08nwHyDpNL1aJcIiKFdTraEEwVBblEUAbFGqCJKH2tfeNM+A54/lyL51Z66EQlsL/g2AG0PcoKQlknTItjccGWDeM=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by SA2PR10MB4810.namprd10.prod.outlook.com (2603:10b6:806:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14; Wed, 11 Sep
 2024 16:37:08 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 16:37:07 +0000
Date: Wed, 11 Sep 2024 17:37:03 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
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
Message-ID: <3f622e05-9843-4763-9191-c980feb831d2@lucifer.local>
References: <20240911153457.1005227-1-lorenzo.stoakes@oracle.com>
 <181dec64-5906-4cdd-bb29-40bc7c02d63e@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <181dec64-5906-4cdd-bb29-40bc7c02d63e@redhat.com>
X-ClientProxiedBy: LO2P265CA0010.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::22) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|SA2PR10MB4810:EE_
X-MS-Office365-Filtering-Correlation-Id: ec0db635-e6b9-4d4c-9367-08dcd27ff9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZbdRZW7k73Thy9/Y3tQ+GLkVEvXEwVAZBYCvzQnv3ndcyhRacPv3r0/5Chs0?=
 =?us-ascii?Q?dibIoiSZaOItkTyiwOvLsoT4MHvEPTXFs6JhMyJHRzGtGZMFWnOJLkv1GcTQ?=
 =?us-ascii?Q?89reGKObPBa+tSFLc1jxFj2Wpt/pdvondXekJeKw2TgXuZ18Oeqb1EyebEEz?=
 =?us-ascii?Q?BiBFRAIvK2cj3Efn/qbOF1E994QsbGbpy3FIg42dyYDHyNDPeaB+gd/M42rn?=
 =?us-ascii?Q?Azb/drYB62XTpsX8Vt4EwZBe7Lw0f+VqjV+IEbQbX2tVSo3qCDBokhwu+VFo?=
 =?us-ascii?Q?Uk4xzU/7+3tHwe7+LXK4AnEiywnopDgHZCBWfgPQWYj5jmgqbndVTh30RV0A?=
 =?us-ascii?Q?GtmvMutslgIQtDVbpD26ah1NjthonNlHQLvuPo64DI3jlxEWhndCFQqG7Lp0?=
 =?us-ascii?Q?63OtirjlESgvWB9BEyJLberZG6MZBqm+wXxAunb5iVGzpxdizuUv1c5ueTU4?=
 =?us-ascii?Q?wFeh7d7UuloPNs+1nGdcYobBIIpBATIxfm4YqoEreoAfe1qRhEs7CQqmg6AC?=
 =?us-ascii?Q?VfaLTV3jxKI51hGDkcgADlTgWeqPTBYeti0sa6z4lirQOJMZ6eMnYVhhMg4R?=
 =?us-ascii?Q?AOL0v68+RQNMsrnlIyInnrkTN2SZ8UnGx0DKlqvII/h/ASYtA9jubtL5Dd6M?=
 =?us-ascii?Q?J45lLvIqh+9OvYZCfkTPZxBMeoPkQf3GHCQYIlLAw11JQq1r92AM0JdgCGzg?=
 =?us-ascii?Q?dyaV1/XjkrQ1Q9qVx7mGwYVdLCn5x3Su01l7KkU8RmZ1zvWaLriPQvQiWTIr?=
 =?us-ascii?Q?upEbtK7RlKKsWSsysel81pLY80i0KHVmWLriByOkaSJ/u13O6eNOdGnCpacT?=
 =?us-ascii?Q?casRqOPlE7lqZ+ofEz59f64fF729YoAk2HTECi8iIZt9isskahbRNetYF1MI?=
 =?us-ascii?Q?Aau0A8m6uZQ8Eh5UF25Al4JtRhyVDjVeNKpPqe5PwAdkzx5vPgRc1mE51xi2?=
 =?us-ascii?Q?M7KM9OQi7N15wDl78S5liuuNgwBfsy2SiDsx5pcPyyeT/J0LCCI4ky3ILv1N?=
 =?us-ascii?Q?4Eo8rj5iIPk4cYpK2jbE4QodJ8HE9uRYNPmod5bXNXO4lNbKG5OIGoaXRhKp?=
 =?us-ascii?Q?rsZKv8y7WDO0QawqVhbVpcS0io6/g8UrbUAC8urOmc4kaWzURtobvdqhvwz/?=
 =?us-ascii?Q?SL8eDTftd/KTRS7X61QuBLjeB4GKEA1jjYJi+anYb6wQAWprcBlgF8+mGLCS?=
 =?us-ascii?Q?uJlKjtbS+H33yNrc1dlYzsb6x+MK71u2W9t4R1xJCRq+otDp90KZgtvIgmUb?=
 =?us-ascii?Q?aUSdATFialYbTckuLVUojSLzVNaLl6dJt6rJ/5bFV7Aqu15Na1She8l/vLyn?=
 =?us-ascii?Q?RhXzzVW1ry8nilqhZMoL6o6LU6ZAkUpM9jsjv+YTR1zH9IYvVauu3tWv5bWb?=
 =?us-ascii?Q?RF93PUI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HzlvrpxsA1FBDDYbo4VSZRPlnuBng+pXyjB49MYuUdnEX39OjtdG7Bop6Mg7?=
 =?us-ascii?Q?ywgl0zz8RbIuG2zjq3VWx6TS8wbRKpbwX0d+arNxSfZ673n1D2bsrvBljW3o?=
 =?us-ascii?Q?PhnEVwD/NBaECPMpBRPAjA/tJAuaztGRHVr8rESk9e9WY/CyJBtwA/aJ3aXc?=
 =?us-ascii?Q?eRYcZmRr3LD9KG37V7uG53Ko4ZeoeSzE+7QRqThif0+w838c7fwA7N9nnLM1?=
 =?us-ascii?Q?0yhC5bL+ZSQL/NESw1GcokrS1Ht49tJuGeJxLH5w6tf7gCIAjZ8OW/wEmDPV?=
 =?us-ascii?Q?yU1cUb1tlJ7aV3dX2UT29CGo0SeapjwAwhB1cnwc9Ugi0otCSAKYHwN0L7ux?=
 =?us-ascii?Q?AoOVTUq1vM4a40SHFjctIfBQ9Tln2MMMAgVOVNMVhlcwkXb9yjzlY3F12BHQ?=
 =?us-ascii?Q?BeeUBCMgLuyKqNAha1a/NDKdkAb1swU3Ymu7FLzDJBKSMoSDBW/cCXFgB2YK?=
 =?us-ascii?Q?4PDDyiHoyPZU/wjuzdDJLLQJe/QMD2dYF2tZ3BYQPhOfrMt+JBKtBW/D54zH?=
 =?us-ascii?Q?CRoQ3vXl9MvWE+4+Q4LjwFTdkK188sCtSc6DgeeLRdasBw6Oc9aywJlAbWbk?=
 =?us-ascii?Q?leacpxZrXSQOIv2m9q77/IDZc8eDml4WO4UkQ3PS1yygCyb53jpK4ZYxGPsZ?=
 =?us-ascii?Q?p8Y5QKq4QrrIlfCEPuDyt8wzf+ZpyFX/X5r4ZrpjwC4Bea6ZnnRhnc7lDvsE?=
 =?us-ascii?Q?+qAFX1R5Yf44FtKz8GWH+dLGZUOUsfNUqRLPsyMTHoAnrcABGPB29FhPN57T?=
 =?us-ascii?Q?K2MRXwufijULfg9z7+XDdY5lK3QoatAmZIpndK8Uyi2vsGJOOxPfpsc3vZNL?=
 =?us-ascii?Q?bWJR06bybWDedeu1xRKqRY8L5lJ0nhh8ILIOjhKISSO1V3Djb/ar+C1/I4lP?=
 =?us-ascii?Q?yP83HOlDtB8mQsgymZnOM+QOXmyPup9n+YeJiOil4IFCqAXKYsE8DD7x5IMC?=
 =?us-ascii?Q?3bF+PA1xSKC4wgdcDCBNUfjYI9/3SjeE2PMrgN9rNYNnZvewYNf4JvYfLyPn?=
 =?us-ascii?Q?dldAG9YE8APrecN8rx/VQD9wa2AkHum59cWohUexmpnWqxPTLZTW2oBREV9c?=
 =?us-ascii?Q?4Dwzrm5zwvV3tL5+cnYVOS+J96foTqDe+rpvYZfZ7P26zuy7n5LnFmcgTo17?=
 =?us-ascii?Q?GH7P9+pH4aRohiVLHztFfa8UB/f1NQPGLxm6C/XkC7VZhzIRkNyAv5H8A2zC?=
 =?us-ascii?Q?Z4eUUEA5P7cHZvXzbKRZ5F7OfuXRffexQGp8vDLt5hRIfmaZbZ5PfEV8H5vN?=
 =?us-ascii?Q?MrImX+UxHvbrr38fPz6gRaC0psl7LvA1LqXnoQnlfm6noe/G7Oun6JM4GYra?=
 =?us-ascii?Q?A7SnOCshgL9fnCBhxYjnN4TA21oV2TJO9hVptopbp79TcCsfg/MJazUQ1sRP?=
 =?us-ascii?Q?5vx0NvshCrr2HawWkD/XubgCDTtzXInsYnSygcBcQaJ3JG/KHADH/+W21Z7I?=
 =?us-ascii?Q?KC+Ba0/NMvyAKiEIoxQcLxbAqHaS2ncLDW5R2m0yB5ncqBVI6veRFoj/886X?=
 =?us-ascii?Q?w8X2pk44y6YRurOiCMGUxvJJJpCSoyIvJFVhaVpuPO4ChXEoEQ2t8Nq/TbMf?=
 =?us-ascii?Q?bbwsG5NAkiaie9jpAXXr/TDlCwmJc0XvgsC+4gyK3mpmlJG1SOKAWi2v0SkF?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	qP3s4KEBCblhNuAtU1zlZlZguc5inSei09BFhir/17o5ycdNKsx2oTz7bAjLMn/m7TuJ3YItLJZ38xcqd/PuXcUpE2prH50PxQfSxbBatY5Gu4igTsxftCGMQoEBzqzqze/12tb4n1telUTw1pmI1/m65o0AhxMPdZY8w8djBT5zBK9vwDSrb6lI+Zu1zbp4N9r+sLDzp87/UzofBGuj0e8JvorMZj4bhIYlYdOVQNUhJpZKSUud9v4yk0NN0qnf2jsBYtLWXkL1mix407UmkkjsXBbOPvuFzH1su4gogLNHzmV/BxpDBsgofYGPFMtX2UVHzLRhP1bcEOhQTNTh0P81F9Sx4rx0JinF3BEwjPCXdUdtJqbYs0HN3GsqreiW7v++JSSIsmbN5UmTzC+Z8QMjasPDcwJFR9N0YIj78zI2xQ421D8uWlSECshuopHyMiu/tpFPuU7y093NOpV1Xa9q77Cw0wIP9Psu9tG7aiTok76BYWkVFXSnE5KBO7t7cgH7Y+o/vrNuP978ocBhNXKWiXbVq+dUvuWrn3NAcN+kGcXRoa6GemVvIY8qF+R1yFHY75PLkHWw5T5QbAeP488JW2Ojf+dk3e954EzC8LM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec0db635-e6b9-4d4c-9367-08dcd27ff9c1
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 16:37:07.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JCOKeq1vdS61VGk6jh7wY2r+5vJdPq87TCbSMUIo5SSpGdh/FQNjLNbskk+VxOlLC+n0A24Yg7tH2DJjrBSXJOSMzvfCIYFoH+kqgG/vA7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4810
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409110126
X-Proofpoint-ORIG-GUID: ChtvN3Rn8-I4hMHSJHpfZnxjWUblcpO6
X-Proofpoint-GUID: ChtvN3Rn8-I4hMHSJHpfZnxjWUblcpO6

On Wed, Sep 11, 2024 at 06:24:54PM GMT, Hans de Goede wrote:
> Hi Lorenzo,
>
> On 9/11/24 5:34 PM, Lorenzo Stoakes wrote:
> > Avoid nested min()/max() which results in egregious macro expansion.
> >
> > This issue was introduced by commit 867046cc7027 ("minmax: relax check to
> > allow comparison between unsigned arguments and signed constants") [2].
> >
> > Work has been done to address the issue of egregious min()/max() macro
> > expansion in commit 22f546873149 ("minmax: improve macro expansion and type
> > checking") and related, however it appears that some issues remain on more
> > tightly constrained systems.
> >
> > Adjust a few known-bad cases of deeply nested macros to avoid doing so to
> > mitigate this. Porting the patch first proposed in [1] to Linus's tree.
> >
> > Running an allmodconfig build using the methodology described in [2] we
> > observe a 35 MiB reduction in generated code.
> >
> > The difference is much more significant prior to recent minmax fixes which
> > were not backported. As per [1] prior these the reduction is more like 200
> > MiB.
> >
> > This resolves an issue with slackware 15.0 32-bit compilation as reported
> > by Richard Narron.
> >
> > Presumably the min/max fixups would be difficult to backport, this patch
> > should be easier and fix's Richard's problem in 5.15.
> >
> > [0]:https://lore.kernel.org/all/b97faef60ad24922b530241c5d7c933c@AcuMS.aculab.com/
> > [1]:https://lore.kernel.org/lkml/5882b96e-1287-4390-8174-3316d39038ef@lucifer.local/
> > [2]:https://lore.kernel.org/linux-mm/36aa2cad-1db1-4abf-8dd2-fb20484aabc3@lucifer.local/
> >
> > Reported-by: Richard Narron <richard@aaazen.com>
> > Closes: https://lore.kernel.org/all/4a5321bd-b1f-1832-f0c-cea8694dc5aa@aaazen.com/
> > Fixes: 867046cc7027 ("minmax: relax check to allow comparison between unsigned arguments and signed constants")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Thank you for your patch.
>
> I must say that I'm not a fan of that this is patching 3 totally
> unrelated files here in a single patch.
>
> This is e.g. going to be a problem if we need to revert one of
> the changes because of regressions...
>
> So I would prefer this to be split into 3 patches.

Well, I was doing this as a favour to Richard between other work so put
this together quickly, but you're right this is going to be a pain to
backport/revert if issues so absolutely - will do.

Since this is a hotfix I'm going to risk annoying people and shoot out
a v2 on same day as v1. Sorry in advance.

>
> One review comment for the atomisp bits inline / below.
>
> > ---
> >  drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  2 +-
> >  .../staging/media/atomisp/pci/sh_css_frac.h   | 26 ++++++++++++++-----
> >  include/linux/skbuff.h                        |  6 ++++-
> >  3 files changed, 25 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > index e809f91c08fb..8b431f90efc3 100644
> > --- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > +++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
> > @@ -23,7 +23,7 @@
> >  /* The PacketOffset field is measured in units of 32 bytes and is 3 bits wide,
> >   * so the maximum offset is 7 * 32 = 224
> >   */
> > -#define MVPP2_SKB_HEADROOM	min(max(XDP_PACKET_HEADROOM, NET_SKB_PAD), 224)
> > +#define MVPP2_SKB_HEADROOM	clamp_t(int, XDP_PACKET_HEADROOM, NET_SKB_PAD, 224)
> >
> >  #define MVPP2_XDP_PASS		0
> >  #define MVPP2_XDP_DROPPED	BIT(0)
> > diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h b/drivers/staging/media/atomisp/pci/sh_css_frac.h
> > index b90b5b330dfa..a973394c5bc0 100644
> > --- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
> > +++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
> > @@ -32,12 +32,24 @@
> >  #define uISP_VAL_MAX		      ((unsigned int)((1 << uISP_REG_BIT) - 1))
> >
> >  /* a:fraction bits for 16bit precision, b:fraction bits for ISP precision */
> > -#define sDIGIT_FITTING(v, a, b) \
> > -	min_t(int, max_t(int, (((v) >> sSHIFT) >> max(sFRACTION_BITS_FITTING(a) - (b), 0)), \
> > -	  sISP_VAL_MIN), sISP_VAL_MAX)
> > -#define uDIGIT_FITTING(v, a, b) \
> > -	min((unsigned int)max((unsigned)(((v) >> uSHIFT) \
> > -	>> max((int)(uFRACTION_BITS_FITTING(a) - (b)), 0)), \
> > -	  uISP_VAL_MIN), uISP_VAL_MAX)
> > +static inline int sDIGIT_FITTING(short v, int a, int b)
> > +{
>
> drivers/staging/media/atomisp/pci/isp/kernels/s3a/s3a_1.0/ia_css_s3a.host.c
>
> calls this with ia_css_3a_config.af_fir1_coef / .af_fir2_coef
> as first argument those are of the ia_css_s0_15 type which is:
>
> /* Signed fixed point value, 0 integer bits, 15 fractional bits */
> typedef s32 ia_css_s0_15;
>
> please replace the "short v" with "int v"

Yeah I think you're right, it's odd, because it seems that the shift value
and the comments implies that this is a short, but perhaps it's more so
that values are shifted as to obtain 16 bits of precision.

>
> I think that you can then also replace clamp_t() with clamp()

The use of clamp_t() is to avoid egregious macro expansion in
clamp(). After the series improving min/max the clamp() is probably
equivalent. But in 5.15 it will likely not be. So this is, in line with the
purpose of this change, I believe necesasry.

>
>
> > +	int fit_shift = sFRACTION_BITS_FITTING(a) - b;
> > +
> > +	v >>= sSHIFT;
> > +	v >>= fit_shift > 0 ? fit_shift : 0;
> > +
> > +	return clamp_t(int, v, sISP_VAL_MIN, sISP_VAL_MAX);
> > +}
> > +
> > +static inline unsigned int uDIGIT_FITTING(unsigned int v, int a, int b)
> > +{
> > +	int fit_shift = uFRACTION_BITS_FITTING(a) - b;
> > +
> > +	v >>= uSHIFT;
> > +	v >>= fit_shift > 0 ? fit_shift : 0;
> > +
> > +	return clamp_t(unsigned int, v, uISP_VAL_MIN, uISP_VAL_MAX);
> > +}
>
> Regular clamp() should work here ? all parameters are already
> unsigned ints.

See above.

>
> Regards,
>
> Hans
>
>
>
>
> >
> >  #endif /* __SH_CSS_FRAC_H */
> > diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
> > index 29c3ea5b6e93..d53b296df504 100644
> > --- a/include/linux/skbuff.h
> > +++ b/include/linux/skbuff.h
> > @@ -3164,7 +3164,11 @@ static inline int pskb_network_may_pull(struct sk_buff *skb, unsigned int len)
> >   * NET_IP_ALIGN(2) + ethernet_header(14) + IP_header(20/40) + ports(8)
> >   */
> >  #ifndef NET_SKB_PAD
> > -#define NET_SKB_PAD	max(32, L1_CACHE_BYTES)
> > +#if L1_CACHE_BYTES < 32
> > +#define NET_SKB_PAD	32
> > +#else
> > +#define NET_SKB_PAD	L1_CACHE_BYTES
> > +#endif
> >  #endif
> >
> >  int ___pskb_trim(struct sk_buff *skb, unsigned int len);
> > --
> > 2.46.0
> >
>

