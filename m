Return-Path: <linux-media+bounces-18175-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E339759BE
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:52:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E7BA1F23900
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23BAF1B9B26;
	Wed, 11 Sep 2024 17:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EyPGmlfy";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="olj0DW34"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F3E1B1D5E;
	Wed, 11 Sep 2024 17:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726077110; cv=fail; b=sQX5e0nKQzZiduKT9hEqDPmiyLu/VGJ69j2V+nyAGtcE8ewrRV3Xd0blrMFE9SqXn50Rbm65y61N84vCULfbzk1jGkayL9OnKjcBoh6FKhoDFO4qbTJ160/p2ZUpvFeBwVdqeGQuDcT4+0LyNPNr2sItR6J6N/vPJlnFTcfAZr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726077110; c=relaxed/simple;
	bh=kOzRzpwQO/kcTO6NvZvIiFGE28kL1HXzWO44O4sUCOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CU+uS9WEY2MHbjEbYt782/UtBa+K3csVAtZEkKeDJ6aG7APKLx6OTwvaawMe9X1Q+QxDemiqzjcHv14wqgYfrMv8KaNkN/EGza2QpIBjXSruoRgxhRcSaubWebuBcqKhdnSOB2MEPpfI0ELMYy/5yAFcFpAoTUwn8Gb3CiGFhVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EyPGmlfy; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=olj0DW34; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BHfWsP006826;
	Wed, 11 Sep 2024 17:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=TnFDmLnySwS7TzxUCDVEsw91kZuig8JFy1CuaAyJJK8=; b=
	EyPGmlfyITCq2k3+5k1vOhHEvtfYkgjIXR2XdDT4rHpATgbJF5qKqtobtxUiQoJf
	u5Kf3EbowMGlto0UEOi6dqgYM9Savl3eT3HaR48MQQaizvaYF0/fkpsSqKmM41R9
	FusCPQFbjfarrqZ/32vAPSa9tvkQvalhxCdxMWpm8vgzanZwRARlxgfcVsWFTz07
	MqwklsqcrVJygpXnMAXEr9YEqkg76FbcB9HNkXbmPuFX7f6LytG7NgSJE+fNsSqF
	4QGkQafjWb8AIUtoO0CSn58qPooivendfRbeOKyENnSv9T6TBQkrVZ5CcHwZQ3ej
	OO5tAmrP5+ktHavnfzNDuw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gjburnds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:51:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48BH9QEI006225;
	Wed, 11 Sep 2024 17:51:22 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9aa0yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:51:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpJuFJjytWq/I3fdjqOMO+koinoZZ7UlvDOL/WTs4LHiIhYuPFUENW8k5R7qcihsPXuorDQl0HPZ2Sd2eFPw8gDIwKswXPv3wsRJlR5Cs/EV3ybP/OolKKZr1J5fJNaAzSlz0d64K+CEpmxVzTjbPODK4RafsjP1QiPvVhlIXxwr+WXR4ywfhy3+JC50BrRAp3cwXBHC2UlZXDVnhqT4ad1ONC+ybSQTJjSAf4Yn58QIZTHGdqOw+Dx9PDfvCJa1stuTWR91Hb/31DK7+KNPXw5AhZ30cG7Oys3XMP0ZJPrDIf8mSw99yOUwZ8iP8rtevlX5q5kADEl6+M46vNP3mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TnFDmLnySwS7TzxUCDVEsw91kZuig8JFy1CuaAyJJK8=;
 b=YWpz7BAbG+MzIn2LUvP1k/RE5I/MOnUW7CuE5PQNaQwkSZ4cZobMzKXvvY/t1zPZTY1s/g8Q+utGS6lEfEcqLPk9z0NscDfbYe68khIVSkmHhpLvhMZ0wp4WoZu+So344nho9mlSMQcPupxxGNLIvzKD9IzZyD3kuA1xwz4eGgNuyZZklcLeFx7x3NeJ5gmDTiahpbb+ah+Ztg6+SeKv/RyBngfwtF+RQnCbv2eIlb4tqrAO5d4N1+BAe8tVR8gcza82xKnjyfo7EIWjHLN/Sr0xpnK91Mm17S0y3q0yix7mzr7VJD1bzGMGNlCHrghGSOFFSdxj4i9VZDJH6uyjxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TnFDmLnySwS7TzxUCDVEsw91kZuig8JFy1CuaAyJJK8=;
 b=olj0DW34MMvJomGmWTSyHGihP4+9nBaX7NbUpdD3+zpyPaOZllz9USjXHSu8fgxcyx8/xDYBAW5gOiWGiaUjaDSEn2GCngV57Z297vmpTwJc7rxAo72xC/jXi2/ypTpPptlhcQbj9cLaOF4HA+m17a3KANZuiIgmaELMcwfr/8I=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by MN6PR10MB8046.namprd10.prod.outlook.com (2603:10b6:208:4fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 17:51:20 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 17:51:19 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Narron <richard@aaazen.com>, Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
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
        Andrew Lunn <andrew@lunn.ch>, Dan Carpenter <dan.carpenter@linaro.org>,
        stable@vger.kernel.org
Subject: [PATCH hotfix 6.11 v2 1/3] minmax: reduce min/max macro expansion in mvpp2 driver
Date: Wed, 11 Sep 2024 18:51:09 +0100
Message-ID: <0f2607b7c4a7863e2f9590301d88e61dd89c31d0.1726074904.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726074904.git.lorenzo.stoakes@oracle.com>
References: <cover.1726074904.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0041.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::12) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|MN6PR10MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 757b6dce-ea71-4ff5-b6e6-08dcd28a5739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IL7JHDyrXnv1O4ttHT7PRtNFYfntUR8zAL/GGsnMPS9YuHFSKEyNtVKlJcP7?=
 =?us-ascii?Q?Bw93VG0aW2w2eMq8z7EKeYy1hyVTZPxGCTUQt/LaG63oyMKKjum5smhyDevH?=
 =?us-ascii?Q?39shWivNZDMoms35vLc9RqDq1Q46kqzL8YcDbMr8jdcbNsjx1vwD9IXR2G3g?=
 =?us-ascii?Q?15OHoM+EsvhnUbIxbj3Tt/iwEp8o0EA92WrxlZgUF83OU/M9Gpb1ABBM3mG4?=
 =?us-ascii?Q?wGXrUpTfZvKfqbBMyInBsUPgfLY8EmXT3gqCwAsgwEG7H5RS+/sEL2Z6v5kq?=
 =?us-ascii?Q?pxLsAhfPhzQAwVDkayK5xNFCB7mib39GAihAn1+XfAx8lrKQkgEqK+qzoE+3?=
 =?us-ascii?Q?IYqlGtNf5CNfGHkBaVd1jlCVMmUQAI4KrCgIsj19/CpNT16zqkdeqCugHTpl?=
 =?us-ascii?Q?tODVPwkY+uvaPKrOPhOsum66/dunNzmIDp6VdpTNK9A05S1qHbw+AVyCllv5?=
 =?us-ascii?Q?za1YF1aV31eYQXpk1JugbDVr8pR0MZKMVbkDB5ts0EbuvZ7ScpzFLYp78CvN?=
 =?us-ascii?Q?f/dFV3RTxrKjyMQKNXA7KZsJcbo/PhrWqfuHhvyaCofT8HLb5aDq8YzYUEhj?=
 =?us-ascii?Q?3BjVZLza/svmxVVcOx6JNV9HdIAYjUXtRDgbfDyRY64jqkkvp97z3VxJUWGY?=
 =?us-ascii?Q?xcNQhc+7+uK5go7jIYg/5FuBSrQjwcuf7F5w79tktZAw3pa3dgkVnbDI9NLv?=
 =?us-ascii?Q?GXXiOKl07UCTWr6DS2qpejsA6Vi8r8JZi7L3Tv4gqsEl1Uno0FdoVC/ZwCrW?=
 =?us-ascii?Q?xnWkNV9qnZJhl6mtYgLQUYMNtup5kqEjlhDOXq6gk5Yl/gVqcAKwo/KyJw73?=
 =?us-ascii?Q?OZsCM4IjbrFdUHWBKKDrV/oUc9WX2nWsMGDR9Xi6gV2MMCkhxJmtZ/G7HyIP?=
 =?us-ascii?Q?9YoH6W4Mx+CE0NGQZl0Yyw97iYQh82sfCNik2mMtv2FIh+iBQu+tUVSgZO0n?=
 =?us-ascii?Q?fs6FNnzfCpabjwTtyqhgaL1HcLrcx15QNdHGotRKi2AWSljnVdVJfHJiW6id?=
 =?us-ascii?Q?cO0tZpfkkS++Hh7cLLRHVYDA90TW8ZGXNWxYw5wMnA0gO8gp/7DpHqYw4Ooy?=
 =?us-ascii?Q?W/CG5oxQP404IOGq2RGFVDLyaoBXGwD9tFykGIob/sJxawS8jWi/OucBPWc5?=
 =?us-ascii?Q?5dSEBigq8HUw7Y1KIMfRUO+VsDUkHUNi4CswwFThquSWvUUidkRi/ZPKYL1u?=
 =?us-ascii?Q?xm/ThulVdrdHfzNcADdGEqhkt10ZPh+8BLOXvbOc8fnKyaSR80RYf4UnzYIc?=
 =?us-ascii?Q?hHvK1pKephDuATLm4Cp1G1XIFafs71ouGieab9NBBq7bMpY2oKKVoTZd4B59?=
 =?us-ascii?Q?vFF1N4YxfwvxqD8I1VZLca6ibgUmZHxnbA9vnFSXA2N1Vw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1CU/yZuIX8J0hmAq0Dh/YYbKxaOKnjxsKT4h2HDcvkYerUPnbwpgM0vwt/Rt?=
 =?us-ascii?Q?Wq47ivdxRCNLoe12mhLweOS+nYb3ANgFT10neA4cdawEMcEeebY8tshYgjb1?=
 =?us-ascii?Q?38WnOA7hOMhOzwuvlIVpYXQw9/dPyr8cvvgZMVsj7wWPDaXJoGARc7clpWjF?=
 =?us-ascii?Q?QYt0Ecv2RFZBayVKqPy3QO/We4BNG5UzZLfk2keAtcrWbQ+V3oEr5xVG6V8g?=
 =?us-ascii?Q?LjNTgo2QCIMrpGFWLH45K65s368dLpIiWqmmnk/IsZquCq6haX2lwa+p5/Em?=
 =?us-ascii?Q?p5leUmhcqLjrwgDxCWXhn9Daw7uZE+/wVPMQObRZbEG0xFK5FhfEAUsL5jQI?=
 =?us-ascii?Q?YPFyQ1cy4Uw1FocIkQ6XCRTv4K+uEo2Jh2cPeflDADlc0sUpJ+wn6/TTdJgy?=
 =?us-ascii?Q?/iPyoT0B0K+dGhNuE/FM5fuLQzpIRbFkoxll8/UjLCmhDbhXkPrDpIr9zENO?=
 =?us-ascii?Q?E70AD7kMuGQR0o9EbXO/wnTjcdrgub3FYdNqbWvms//bpkuzQyJwgve8M28a?=
 =?us-ascii?Q?QMmGfejGgByZFHNOiWuzkmWRQmqb6cYkbVhYbIfRH5sCtL0ZgXl6Z/m7+R2/?=
 =?us-ascii?Q?lckXEUxsQdT9A2NM9t9SkaMrBtUUPMSBDhpBOVLRp8XiX5yOZQZYQA/kJhoK?=
 =?us-ascii?Q?ljAtlbsQlDc8i5xtVtKbfILOTH89zWBGEhBAdzyBRs5iRZ5TXcbnwj3tgyiq?=
 =?us-ascii?Q?lmJr8x2SkpsL9FQHfosULwmVhqGJl5Hzp7UdFiAWTG36W0Dky4e7T870nf1d?=
 =?us-ascii?Q?pE7sX1pkNPxWmSO3LZV0y0MH1A8IlMXL8IUnu8d546Vkuiway4aqNsNzNmbG?=
 =?us-ascii?Q?fvAkTjhMG+Ko89cNBhxBP5bMSwSBn4NVxxDDE0qAi7QzjePku2vHpBK8nUDA?=
 =?us-ascii?Q?1prjhSixYbQ5i94+Uc0qOrP47sy/f3U6C06ywDrl+uRE69/nlGsKA3YwUgVO?=
 =?us-ascii?Q?XzxLcUqR6ZjIFns1Wuu7/9L3LBYD5qBjvve3hdd24yxzVWq5gkjChao023Pp?=
 =?us-ascii?Q?2pjN/EgxqbGWAMTQQWq0oI2SfYafNBEQhnx7ufmUznA8Os3v2YsIJlwU3Swu?=
 =?us-ascii?Q?RYsO1HDZhUz3uASyRdaM+J89MCcXkZHTvtWz3N6slz2eTd/O+o4iTyXr8hDq?=
 =?us-ascii?Q?azMJPEZw2Ngo33e/ytKJ5AwbIDWpzVyhIeu+yNy4p3DgkcBoBjzHCAvw2z5Y?=
 =?us-ascii?Q?KUryML7pyvRBmv+YhlFZ7kIwZ8EctVsGRn0+CGUFLTsseKCc4XGz83cgsB1d?=
 =?us-ascii?Q?1W8qie1TESLCIh93jO3t/20WdT0PyQWnLpcO5eUkqHaxNOxOFzQPIZBKSiBA?=
 =?us-ascii?Q?4lsuPMEyCP6EdfUQqakTRjTi9aN0Z9biyIZ8ZS3dYnes0T0ouRqZXPQQjZup?=
 =?us-ascii?Q?4rg2cL/1500l9LWvczAsS11EMpFpPviScP7ZmpX8Ua8JgZdhP3QNsZsyKGQ+?=
 =?us-ascii?Q?jUzsOM5KrAcWY7Vry+aERCdaWN3eDMqe+7yfmYGZvgWnhA+6l8ze36XB8kTS?=
 =?us-ascii?Q?ybpfv6+MhENE2pLQJxN8n9FGZ+URw24M5zMGNaPOiX/OVJj56zSsC5C9Hhvm?=
 =?us-ascii?Q?L6ltaNwAd/mryI9HQBSt0hh9YtGSdT/fjfapHT/7efgpuhwB1OP/5UZg/RcP?=
 =?us-ascii?Q?Rw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	FjahzdgT7A/TEsKxQeYGROtLyEmTVGybNJQGvWjHPC+I3yJtGlus3V/VLAvoRHwflBuy+8z9ZyNy/hvLJVewm16OjTg7Xw7LxW5lmroHdL7Ua/ojE/UvP5w+7vO25iSVNpsvdzJyXZ1mGqMnXKI2V1IIuBEx4cc83UW6s2s1U10LMURsubMRnmRvlLZtededzYmDgJKMhpVgMlw8EykE3i6qz++CpSd1946bSYFNUJCqeZQnlVtIDvSaECpOJl4W3YpKrQm7wGfoTS7dhvbFw1noMwxz8Je/ARRbr73iNrQfDedkbGEDeAs38TYd6jQ9Vzx62dBoWXh6fQX0nmuYFYNzfwrmjzFp44YnPQfqPxcQKr7SLZIBegrcAUCfwAXSXCOFJ/FOiBsi18Vh8WeZygcg+qL+HItNLHq6aOkMc+UuwDvtfMo8V35ugXuU/5EVf5Ah1c3reIJKZc0D8R08oWSgBoBMKIYwy5BMtvgqGhtbI2s4CF3PK9AZuIkz75x3Gs6r4Wxa+E6C4t9WExpAbMalGCqS/GYWxQ42wfAPrfqUvvwJ+CWmGCiS9qzLOH2jyjR5dtP7mxS05z8Tq4fwi4ymbkoHqEU519oqAUTaVbg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 757b6dce-ea71-4ff5-b6e6-08dcd28a5739
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 17:51:19.1966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyGA29UgNf2yO+YesG405X+MVXEQompswTFrmKf/gC1ZtNF0VHjr/uGHromzW8VIKH7J/TxbRkrkXL5cOAJPitNw6d8ppp4aoLvZtkpEdH4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409110136
X-Proofpoint-GUID: n9XENYsE-zlZBTn9EjBrwwhp2BBDIxpc
X-Proofpoint-ORIG-GUID: n9XENYsE-zlZBTn9EjBrwwhp2BBDIxpc

Avoid unnecessary nested min()/max() which reults in egregious macro
expansion. Use clamp_t() as this introduces the least possible expansion.

Not doing so results in an impact on build times.

Cc: stable@vger.kernel.org
Fixes: 867046cc7027 ("minmax: relax check to allow comparison between unsigned arguments and signed constants")
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
index e809f91c08fb..8b431f90efc3 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2.h
@@ -23,7 +23,7 @@
 /* The PacketOffset field is measured in units of 32 bytes and is 3 bits wide,
  * so the maximum offset is 7 * 32 = 224
  */
-#define MVPP2_SKB_HEADROOM	min(max(XDP_PACKET_HEADROOM, NET_SKB_PAD), 224)
+#define MVPP2_SKB_HEADROOM	clamp_t(int, XDP_PACKET_HEADROOM, NET_SKB_PAD, 224)

 #define MVPP2_XDP_PASS		0
 #define MVPP2_XDP_DROPPED	BIT(0)
--
2.46.0

