Return-Path: <linux-media+bounces-18168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7940E9758EC
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB4891F26E1E
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9177B1B1507;
	Wed, 11 Sep 2024 17:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="X7yL60pe";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ysv3dfeB"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EC742A94;
	Wed, 11 Sep 2024 17:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726074099; cv=fail; b=RMlkmQt8HjTh4fPFg8cGRuopy+r+QP92gIoSP0JK4DGq1dOubcmQ8gRPGayRXpXMNxVqt+mnrWV2noHZyL8Qrcy/nrH3B3RKmjuIzXQargpXR7GgniEA6oz52tPr+D4ma8r//9H2MZjNW6ASUdcZMD35hb6RzjxkGHPQLn2mLKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726074099; c=relaxed/simple;
	bh=dwPRLfBeVK6HQq4pXqBgy6ICu8ZBwUyI7+sgny0Namg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kDn2969LE4v93S2h5EEFHiZM0TIX/NXxx8RyYSniQKQz7/RsTuCRIgOby9BChQVgFeeku8wc3flL89h08xX5qPgeMz2tiE5Van5j1zUPEj+Ju/3xJnz5hf4ZSS6ZRxAx0pUNPKKOP8XZ/stg2jS0/UBJwYJhQ96VjjDBWXpLCEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=X7yL60pe; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ysv3dfeB; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BCgUQB032269;
	Wed, 11 Sep 2024 17:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	date:from:to:cc:subject:message-id:references:content-type
	:in-reply-to:mime-version; s=corp-2023-11-20; bh=OsWewUrUkJsuoMh
	pxGnVO1PWMDuaAJizn11LWIcbfR4=; b=X7yL60pexUdxNnY9Nz0mv6UyDrSrZyC
	swPrdaKX7VVAt8KIRgzWU0r8zTIoZlwQ3D6/s8krUrYokUPHvYq573A+5/xcUkQI
	dp3vxtn7xDeBpV2xPRqwht1lNC/1vhrdJUvDs8iqLDX2TTDUpClpZ4L9nzZgL0yN
	Mxcy35fWavqjWQxIOgCsa1x5CjWzbD+Ud48NJZ95fQKKbO2lmg3gu67Aq1zeAHXo
	W3LLt0uNRMcLY0/Cs1zTomReFlm+A/D0bMfPkObkms/9zjlt4xiJdt1oLoB9Oxjh
	eIpkqIJnLAJx3rzDr0CF7VA/ofPkd9WF1Q8OeAdWnLry6BwD2D6fHNw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gde08uee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:01:07 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48BGIU94031606;
	Wed, 11 Sep 2024 17:01:07 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2177.outbound.protection.outlook.com [104.47.56.177])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9apw0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSRkQlUWExQ0f92UdcmZPBdCdwrlCi/ONU7CacA2CDVAhQ9ayNtorrAO5KrnsH2oLI8qyIwcC5BSzQmM39BY9iHFaRNBMH6UTu1zcG/k2Tm/LTiS0FxjZaHtI2pK/LTEYLwwK2i8pzzan7lr5mcGfej/AKgSeBmCP6YJDlxUt1RtmhryaQepCdJdRTlk9WyupQ7IS47wvipD7gZOfOUCjaa4QkNprp+X93a/xDZrQEKCqQktrBWe6Khk7i3Sx3Vmgbs98gMAYD9JyMrGFmQWGkTbL33DOrNJahe2nfMOP6XhzrGd4LWluOjyPZXgLSWrkEAjcc3hCPYMbW11G3HG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OsWewUrUkJsuoMhpxGnVO1PWMDuaAJizn11LWIcbfR4=;
 b=j9QocMQKXHJgSVKpq7ByufQuXMvyTGhPbu+Kk1whh+811PEcHG2CVPIhEewPfyHd37FgixUJ68/bbFDQB1gxKA71eyN9/fw+TsAIALAV87YGx9V6ZynewnO7RnSMTw33Lqb14aUSSzEdXmh4AziSw+CLLpJZhpj1Fm6MYTi9tLlAKRjBGxz5be1C8TyiAolH1IFKu+oESWxBKs0oGcEk3KdIXS2yxuX5VFAdRkgUEM5Ow/owqPPw0wqx2HndHFGYwm0SDLrfcrCevQTB8EwFKz+E1lWAFCjUOR1PIX4eHzsX4gY5IeQg66gIGJS3XEwCmVKQE5lt+V0QN08lxta81w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OsWewUrUkJsuoMhpxGnVO1PWMDuaAJizn11LWIcbfR4=;
 b=ysv3dfeBvezTpMkDGHAjdzoOm1w/WuJr6EQQkJaz4g9h79znVDUxFWl2JiQCl6RzrrNyhD975vhUvyPnGQWFt2XxD5Knnluit2WLO2fzKa2EChn+LMo6snivGTdxY1e3nex+wOOUP9FN0mVUZbWctMbnRbn8z/Mlet/VQlyvLks=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by SJ2PR10MB7038.namprd10.prod.outlook.com (2603:10b6:a03:4c5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 17:01:02 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 17:01:02 +0000
Date: Wed, 11 Sep 2024 18:00:59 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Lunn <andrew@lunn.ch>
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
Message-ID: <6b2c2dd1-1dd4-4d0a-8652-ea2caac4332e@lucifer.local>
References: <20240911153457.1005227-1-lorenzo.stoakes@oracle.com>
 <181dec64-5906-4cdd-bb29-40bc7c02d63e@redhat.com>
 <3f622e05-9843-4763-9191-c980feb831d2@lucifer.local>
 <827b2d90-d23f-41c8-8e72-ecd5ca9ee534@lunn.ch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <827b2d90-d23f-41c8-8e72-ecd5ca9ee534@lunn.ch>
X-ClientProxiedBy: LO4P123CA0051.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::20) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|SJ2PR10MB7038:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e944445-d65f-49c3-72e5-08dcd283513a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QlPIlLZwb016ftIneVBm17GroPLi9i30TVSQaVSKLft32TPCcIhP/Qmmkw1W?=
 =?us-ascii?Q?p748uWP5ySyPzKRDnAZXHWdL4rzsh3uKlLFP2CEGOKaXd8aG3XUKIOqVQqA3?=
 =?us-ascii?Q?c3FltJ9bY1KvUHKgu7cDvXeo7g6kSrbLp2mSM+AVej0cn+oZG7Zql0pauBj0?=
 =?us-ascii?Q?E0fWokh9Fw4t5G4pfKJHT8dEEf4FbOMIM3yyCSVHD2u/O+5tOsWRUTWpOmRq?=
 =?us-ascii?Q?+mNdZ4QQB5qtgzkv6p4fifnWXAWa/hyZ0Rk1fdYsWqbSvRUdjJUEMQSvTa2v?=
 =?us-ascii?Q?Kr/gEYMMWMOga/DTpDbKEOkHR5yWbOlsYNUBqspIYhlGH7mcdcdg2XZ2bWSu?=
 =?us-ascii?Q?sVnE0CdhXwgEETotZ5htnPrpVArgP9s1mubZN57c6ongkQPhNiTfJmt8wLfj?=
 =?us-ascii?Q?7kRfCKK4e5avT07SnPDZIogd1OJYUda8hrU65yhnifm3wrWV8qMMb5Nks2um?=
 =?us-ascii?Q?ESDNRRCqm/jIE9JZmkDIqgVGJ8/4ZlKVYfndHNGQ8cPRElh/t8ZONZZGucFB?=
 =?us-ascii?Q?qCHLAy31G4jmCg+8CO8tixlcoHtqdxcwWBIlyaaA9lg9IWU0VRpxmeYrcMBF?=
 =?us-ascii?Q?OI1rwkokmqU8TSR4ILYWu1QwwYt3psil4EbjwJM8QVCLdyP6F1dZ1nSJ8js5?=
 =?us-ascii?Q?tA1ejDTVuAeJNFkv5E7zqZ1syN5H6pdn017ZZnSt7KOVYbxVG6wgShB3G4Ed?=
 =?us-ascii?Q?/JTgnls6fR2q9FQ9uWPA5ZfN++cYySaZjZ8wknBxx1jSa7JiGwi0gxpEvXMv?=
 =?us-ascii?Q?hAnVXHwcNvcJoYwklm89f+doMrwsOsvJ0AFhA3KU++dIao54jo55d01Eetvc?=
 =?us-ascii?Q?5kU044H5unOwpjuRnq3/3S2wI6yxyuzJN4WNdSMGP3vk8MeLXXC4MYnN0Y/M?=
 =?us-ascii?Q?qQabJjNxWU+PGD0xz4O3FTCybgD70atyayr9OERBO1BTIpLtBSt+IixWzvF6?=
 =?us-ascii?Q?rjiKBpQAGg1jE0iXo4JgFUqwge//pRgjyq+PNlBYCAr+bxqWp8y6RlZYtEbt?=
 =?us-ascii?Q?nb+MfjRbPyg+BQCFAgO7RkxygHRJemOmLBJJtIBUfiWP+E1f+1bHWGJeH6WM?=
 =?us-ascii?Q?ZZOj8bKcorxZGItamekEfAI6m4OVQD76armdednJGlkDQnOcj7J9fGBTCCpR?=
 =?us-ascii?Q?xSS4q0wCFFqmYEq9CPF0XR4cMUzRTdDCRXFovSHmjF7VNuvvfe0O9lrzOBu1?=
 =?us-ascii?Q?Gt75w8n6bOV4PEinVcQKZ85VredjztcZGDHYmnM5mA9JQbxJ8ZCkkhsEFi0V?=
 =?us-ascii?Q?VTE6RnuQ1t+88KPK6Iq3J2COLFyg39LKmhMlecdsNe1B5MOM2+uFMiFF1q4U?=
 =?us-ascii?Q?UB4T4T+ekObSR4oApRVBEzTkoV1sqF7wpdz6qU0zNepazg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?y4LQL474+bWHH257S14qe5B5JwQoyHLeeMdLjeRq2NXgwNOjiBFUzVuB4ExB?=
 =?us-ascii?Q?I9MqFot4CVbKjR+2zbWzdkEt4kUSU8wwsNtA2OBbaPJgGimAOFleiKnrDMIJ?=
 =?us-ascii?Q?qcA8zOMdXgRzKW2dxlnfoztgn2m8LtikYSXwOWXsoR47zOtBytpRHx9SrSkh?=
 =?us-ascii?Q?FVYsgEklf76aProDa6T2JXN6m/nMgz1LdccgVJHsCLWb4lzxR86kbFjweNef?=
 =?us-ascii?Q?LRXh/ZztCPF/Vz+7KNfFtr1Sr9g0jfnKZeJtG/x7CQBB1S6FAm3C1wNBMTJz?=
 =?us-ascii?Q?ihZKnVW5f5sOE6Ludn3lPYa/Ob2qkyAt+3jZCKuLYpbDiZR6HS2ZPrbt8Ik0?=
 =?us-ascii?Q?J525bMP3XWuqodx3pnOrCt5fD5DQBwoykJbTtNJ01XmdSp2f6aVAUlcrar/w?=
 =?us-ascii?Q?gsivJ+06xAAyH0t1a7SQhyUebOF8yQyT1QKpe6BDqLjBhuBu+2/R0WB9zEgE?=
 =?us-ascii?Q?U4nciQL6bRTOrcaOPKul9YpyalxeFUrCaJnmlSFgkDFp/AOQml8pLv8pkJwJ?=
 =?us-ascii?Q?gvhlipthnuccbRXplhu+mdsk3GqmulzMLylK6Bmf0Ma/qKcf3lrtUhj8l5Jm?=
 =?us-ascii?Q?NPrdps3qMazWmzJi9+gvekjo7GbhRU/W5rpS+mDL0Nc5Kt1xqwgf8Pk95Z9F?=
 =?us-ascii?Q?oX5OhkvOdI9u/LyaZnOhZviQ4YT3ONIjphzx4VGuDtOaCYc7+cJcvNXMacDF?=
 =?us-ascii?Q?3yan4cCDMX/c2FGZ7zVpNHtOPb8NjULyGkSLi/6om+mIoMTXmuiTtdRc6qwq?=
 =?us-ascii?Q?0U4wQvz8DGMMnwUZBIvgYdba87/WFxi9JYYXL1ILAgBmSNIuA+6m5OuzkoY/?=
 =?us-ascii?Q?ud+ARX30eIqYXZsb4foxQ2kgyuDGG2rSNGvx3L4eTh+uHANyziEB2qrBTqEr?=
 =?us-ascii?Q?BwKtQO7ayX89VUhbUtlFueL5LNXTQxKv4aI9qVfGrN2Qi2jA5zvcLCOTPgKo?=
 =?us-ascii?Q?0zsVCSD/H9dt+Ck0wWsYKAiDvZC+UOfxDL6kn6rqlnKZjF4Uke+eCuB9Z+u0?=
 =?us-ascii?Q?JvB54jGe+x9PS3vzNSAmgH4JoVXxPk4teUkRQG80cO6Hn7R0gA5OjCvqRDH6?=
 =?us-ascii?Q?zH07dHt/C7vYmDjnTdmNvVQAk0pCIvOCmZup1FhvWOjscnnnGI4fKlRycF5L?=
 =?us-ascii?Q?Gr+nIVTwDWPZyUWQ+vvNK2P830X7LZn7KKvBsQnXudzGUSJLzjXt8uB7P7oI?=
 =?us-ascii?Q?EEzQdJE9V4K/DoA+AjoMNdiWRaI7c5VhIe4kIg9Hvd5JsYkIJbpd/UfcmVFV?=
 =?us-ascii?Q?2YKUeI5WqHhLcObGxHMiastv9JWVgSDwhC6rRTpi+vQpnZfcg9rsaNW22nKG?=
 =?us-ascii?Q?HvWRz25mhMtDQ7UYlFEIXc5IZuhIihgqdWB+vSQzVgrAGsdsbaWUlQNn4ccb?=
 =?us-ascii?Q?Qil9pIXDP3oYA/u56FovSLXKOyxblgnX7EK3ELnCns/+2paqDtj+TzAnwKNd?=
 =?us-ascii?Q?At34RlzLfxdnSMoRNHeqX6j5bTLjgT8spA6oiU03Wo7sVlx9UOo2maepQHSX?=
 =?us-ascii?Q?iupmJ5evGnxuUTJXdnpxqTZcRIwpEpyWe03sFUYNK+lDkgld1idzd9blcL8t?=
 =?us-ascii?Q?9cd0FVfBtT2bZdeuInBHwq3gYMigojbuvgb+eq5jEeYhtFkfzJjCR65dS8eY?=
 =?us-ascii?Q?qw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	e5g4caSKeNTUKPtxOOz0W3lxPXRcNUM5+GgMdGxjBf0LR6UUQCP38UvAB3gHZgmdfw2N+WM9W800SyKtH+oXZndmCiuF32yZoGDmUz/3cevUbeyZKP6pi7ot1unSmJrsZFMGBubv1D+EI1Olwicx7ZXWwb0WIYuZ4B4RyJf2i2EqJgBEsmf5jv+lqXNDHA8Cpgu85fi8U/4cf+8nPz/dMi46XZRb/CBZqok9ofoo1nWcqR2rwVujyXhOTt35nYbYZKEWA1RlPiXdv5PyhoOmEnBuk3twbe1371AB/6fnjj/E5hHZvIHZXoSIayIvHvVGhUpxYdPvopEEEPqILZsuMS6/U6J6G+lV6SpbJWWnQK1tkW2bYanRbMDL8Ep4WJS/UBBg3AESJHBMYDSOyCpNwwBeRodSYI9vwYz8OebjiCjQAWEvoh2TrQLqXpTZCSems8XZEiaBx5Gw8JnYy+RrF8DBvQIRUFlyS09dvMCvGPN6oeCEpNoILdzpLk4Y8WCdQ915nkde9Im2uUXys40vB2s96P6EMWHW9Q+x3mZGnLpvLnkpL6MBVBOsf91Oe290zaWgwVFA7Ps2+GCCdSGULdJmHFBh8LIgotwFb1BKz4w=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e944445-d65f-49c3-72e5-08dcd283513a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 17:01:02.6167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b61bwgMx/NEP4fTJZpXmCk0OX1XXtJ0t54lbJ9Idq+WxQKPcucrFA7nBIfWL+l1e7ndyI5HM2kF7NAENuFr/gjudGUSXSwMN3Ffc32a7HTw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7038
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=878 bulkscore=0
 suspectscore=0 phishscore=0 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409110129
X-Proofpoint-ORIG-GUID: rWQ6kuxFFL1jKM1KsaHFpUIPxni9Vrcg
X-Proofpoint-GUID: rWQ6kuxFFL1jKM1KsaHFpUIPxni9Vrcg

On Wed, Sep 11, 2024 at 06:57:47PM GMT, Andrew Lunn wrote:
> > > I think that you can then also replace clamp_t() with clamp()
> >
> > The use of clamp_t() is to avoid egregious macro expansion in
> > clamp(). After the series improving min/max the clamp() is probably
> > equivalent. But in 5.15 it will likely not be. So this is, in line with the
> > purpose of this change, I believe necesasry.
>
> Maybe that should be in the commit message?

message-s :)

Yup, I'm putting that in.

>
> 	Andrew

