Return-Path: <linux-media+bounces-18163-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 08225975740
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:35:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B9F2B2838AD
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 15:35:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FEA1AB6FF;
	Wed, 11 Sep 2024 15:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="iLg4OmpG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z4QQGQOJ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0DF1E498;
	Wed, 11 Sep 2024 15:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726068937; cv=fail; b=Vhe4+VeiTWgDy+6ZJr1WzxfUqD4ER0jmWE/N13iGbz1yts4EkZQWBYnxRqPQety1k54S2iOBbbZho8S0l90ZWO8j8DxLNAkzN3iNavO6xrmvf3Gn79xi5+F1DXkXabJ3qXjleEYNoLHFYBGtJrITXmpfzikOIlSM7hwstyYG5us=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726068937; c=relaxed/simple;
	bh=9cNMKNcLLZoFsVkHyXGxMNVMIfytkKWKWuKtEHb87EQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Fr1EhfqriOkiVzDUQ78xdtiIbtiAkeap/n6LvuqkvTSxJp/vy17Y15sI6e8ctXZjmnCcGIwd5WDgkYRW2br1TpRinuCqs4WC6Fa+H2EyiiTo3nOtHiKmwGrXWnfno6O9eNiOXsENrHSO9zH+Lv5b8DdjAJlhhIcuJZaJd7nqMFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=iLg4OmpG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z4QQGQOJ; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BCgKYx029050;
	Wed, 11 Sep 2024 15:35:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=corp-2023-11-20; bh=zPLb9nAaWKiEJF
	ZP5IdeNSvq052g4acKgJEqK9nuHnQ=; b=iLg4OmpG5/8FUKAzcclzX8EM2Zqlk/
	OsLTbGH8QBhX62SsrGJw1jJuIv3uD0DJdQryfsnrerZR1hPjup2dsD9ox/WTdiXv
	0jEhURKUXcT1hJYME2df3gBO7IreoTbIEzV0QkJU0T7lEg5irrQCOAmDFrfP5xpI
	VCjnm/XRYYfFk5PcEYCfvs8we8qwAHQFQnKQyvPCPes1wrOvljbnk6ra7fiFWwFL
	8RuQWV2ayqzBco9ENVTJZbGTwSoVhjhq+jsYYcJHqFAy7LJcWQh9cTVKbWPdcQy0
	VLSo6w/DnZ0mzIM5ZggFNxcnb/i0fIyt4z5EELHOGOnYVARTVMlplZYQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdrb8k4u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 15:35:10 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48BF3EDG019854;
	Wed, 11 Sep 2024 15:35:08 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9gmu3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 15:35:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fY5Gr/SYWsARR2w6Y6XtYRN7GNuRP1/+lwm88/dypm1j5EJA5FHC2QVsyytK5ZNuAhulW/AqdQT82yOEqWV2SbNKRO3Rp//iKVIZHPIQnT9MucEPRP7E7HfGV+9Vah2GcCFJdS/nhicOrffII/mgc9jQcruWJozqOLUS6neYl5t2H5v4mEGsGTPYYsSQ7Sa+g5GkRUZHwlWE30hje4aEiuZP/+3JagB7kP6vYFAsw3hEpE8VI3p2G5V8ZN2IQHcYrVCJ4bWyxyC9/dx3jN/tSN58qDtpfzmyDRLf9dCM44bEi5Od9ASfTocvZ3MfJewPyQXY9ysgIYRNT2hk0H9yLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPLb9nAaWKiEJFZP5IdeNSvq052g4acKgJEqK9nuHnQ=;
 b=qLzjOGBLEAoydCSUHzOR8IbbSYIb5DIaAwVFQ3ZnVUMl8x1SM07/B211wc7LYo0pkxVAWjbAGemOt7lKMwUG0IHofpotZsn/PwucCI0JxV0bjLQWLZvMlxvI3mcECZMSPdzqRa37HCVreFDX79FVeeqzUgQFggASA6L4LKkwqdImVEma8kvhuQtPczTJQ6c8bn8UdD2iKY3twDcfe+DrEC1IEHrVGkS0SBZNs8Do8cKeWY/HwTkvlO/6wjrkjTjQXu5sf1m1apj6Hjc0JmFIXP4iw32e3mqTSvuZkLlEEj9eSOWkSXbUCFUDxiy72LnspNyu+RL/DvrnqNLqOWJ7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zPLb9nAaWKiEJFZP5IdeNSvq052g4acKgJEqK9nuHnQ=;
 b=Z4QQGQOJTIkZnHrhDYNjRI/RTh7+6DODw2qp9ZQSqPExyJsJKH3e8wISyne1007HoiMXcSRP1zjaBlEqx0AUrxeDCdTmUB8KioceBqx8H7RD6GPPMvmwCSTNZs1iiWRMA5ZuA2qxju00Qlc3ihOy/As38yf+YeLRcdQUJMx2W5g=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by DS7PR10MB4976.namprd10.prod.outlook.com (2603:10b6:5:3a5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Wed, 11 Sep
 2024 15:35:05 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 15:35:05 +0000
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
        stable@vger.kernel.org
Subject: [PATCH hotfix 6.11] minmax: reduce egregious min/max macro expansion
Date: Wed, 11 Sep 2024 16:34:57 +0100
Message-ID: <20240911153457.1005227-1-lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::15) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|DS7PR10MB4976:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6f50eb-14c6-4228-7726-08dcd2774f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OP0Vj+Q/Ah+5gjFxOv19bJhXUTeBj8h4Y31eMQg8uTOPRjai+qENAvCZ31IP?=
 =?us-ascii?Q?LGo9FMrdDn7G4YJhPrJJS4XUJvLU8CEJaC61h68AYe11IKWFrl0OeT7qKXoL?=
 =?us-ascii?Q?S3GUwwF/JM8R1av3RVqXiB8z20SWlDvpB93XcKranPZDDm/EdMA7UwdUvKg/?=
 =?us-ascii?Q?I0IFOiFAB26QGEJAKRtG+L7Uu7XFxmmJNUBTOlZIq6HcS3++sqZ0h3xBeWKg?=
 =?us-ascii?Q?mKxEYfLvbByB04kwGtQPhXabmmsWv0D5/G9JBgBYou1U+6zc6oJDiHCXAsCe?=
 =?us-ascii?Q?F1POUUTPUCAR2Fbi19nE9DySFX2Bi+Th5EbhLZQ6+7KQM+b7Sa85eb9M45Z3?=
 =?us-ascii?Q?KvlLs9iOwhNud4fCO30Nixtj4d4aAYOLqN/6Q8XYFVTfpQt0fbP9oy1cFipv?=
 =?us-ascii?Q?FBGLVc59SOWwBr7dHz5sPMdXN2uFcOnmnHc+0gTz/m778dS4KNsgAd8HIWbG?=
 =?us-ascii?Q?XEa0hkw0W3ToJyeWgmgiEVO82nD0O5W8fjvef8G8RTLxvRO4Wc3sXC/L31Xc?=
 =?us-ascii?Q?E8ORqOZqZfcKUB4fYbqPSC4x6tThS+0vs3RKkzbTGsR1a1R3vx1WcYyQ/Dhe?=
 =?us-ascii?Q?L/0PmWuwYADQvM96WRutw0fgHC/MdbUPUBixo1zzgsmAQoGuKMpfUrnOzFiQ?=
 =?us-ascii?Q?ux98fDdMtY2UqWFCPpM63vKaD87tOugMckhFQ865kLCu6P7lyTRgGbiT9xbk?=
 =?us-ascii?Q?8WaBve45CkpVSQGFvuf00VHa0DSF1xP+ehsCfX2gXgI8qW5eoE3QyCUHE37G?=
 =?us-ascii?Q?jWgepLCUkmxmiPj1mWRr+OnOWT844v+yUP1/yAvRSlcVqcbbhb+Foxim82mn?=
 =?us-ascii?Q?BeD5xru4q6wBG+j9BayVrNDhTmozQBkCwXDFYs93kBdrO/RDGYYaaB76mNyX?=
 =?us-ascii?Q?0kreJ2vE5/e/nZgMl6Jed+xXD6HTSi9/RBPDw4I4fcAZVnlmTz667wdPYN1n?=
 =?us-ascii?Q?7nFF60yBd60oZH0IsTTcaI4zxarc6/xGYICaqyZbRSYR+qwcl+92SQqJKgmj?=
 =?us-ascii?Q?bnX/HOMsP62KqbjErvOj6IIVmX7S/AqQ+1DuLQUojlZ5JMwUNk4aIKM2zzqp?=
 =?us-ascii?Q?lKQqPGXOGMecEbxmG999AP6lly9WWfkOwwVHzbb5I1W4DoE/pnYJBrr8x0pq?=
 =?us-ascii?Q?miVT2z0jdPeHIAHVXOWtEFREKcSOb/XxOxCEJUjjn7NypWlQEOUiQVsCS1t/?=
 =?us-ascii?Q?pbWcX8APWvVi52F2Tb6bAFYV6PFRe0IOvv9ZI3tFku7rfeXXB9K+wICtwzQR?=
 =?us-ascii?Q?J5Lnz7IoDyrLxHeT26yymIjZ6xgwC9UgdhSzlGbfa1NdVohEdYq/m9SIDiHf?=
 =?us-ascii?Q?XeX41659d0sDjdsw1Vd3PtXt0AHGLFFwjZtL77N2qAOc1xEovZX0EkQwbeKR?=
 =?us-ascii?Q?yZOMc4A=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PF14XC+HVHm13NsuP39TrWZMLDgF+ZZPYUG2GoBVGO+HjzggZ/jPkEZE4KpE?=
 =?us-ascii?Q?qUTUWyaHOH5t2/lEVIXZ8pGzNf6NBSVVP+vpYbc3bV5uYDFtq2LJ1f/kbs/G?=
 =?us-ascii?Q?G3tPNupA5pVCDTlHLuI08cs9bgJM8y5xspeNqpPw0cEn5Gy6+n6V+1B4vY/y?=
 =?us-ascii?Q?35jWBJMhRNgneUpPJ4ALYaZz1UEmHjVAxvCTkmUHMdaTcSoP1SKGYoqSCoLE?=
 =?us-ascii?Q?tFQWhvhkNPtpD3WldGaFNprqtC/zvWMXggXfdvVZP5Ttw+F+Oyav/TEzxaXg?=
 =?us-ascii?Q?bsVQO7t3NO7DSu+UyDruEtb4ob0YLYNmDGiqyFeTIPnThEBuLeyoLPszV2xz?=
 =?us-ascii?Q?tjaMUaAA2sNH0EDlFHx0pcNo3U5Alib5e9THyhDOI5DzGd/HBbNsocoW7krK?=
 =?us-ascii?Q?OrdA9K6JqjUvRGVVP2wAyRM2qS6tGhToSjo2aY/R/jG/xruvaPf7839trqig?=
 =?us-ascii?Q?t/wR3EgGDLCN5Vsvll7bH6sguPOP0dhNb/UThfZfTjFEQWkdI0f/JW/WwZvs?=
 =?us-ascii?Q?DC+LFKy2UKm30LanE8rjZsvf5HTZVTJDbbogXpKlOH8R2f9wv57nvYfC254c?=
 =?us-ascii?Q?v+Biofe+ANXWOdO+/rNf5l5sCNT3fkov09wer5qsgIXWdMIkzUcvdXvk3s64?=
 =?us-ascii?Q?3ZRA4j6zTrzEmmv4ADIs4b02DoLpHTbFWZEMrzEi6x8lUfHzERJXXb2ctTPE?=
 =?us-ascii?Q?08Y9oumVSzmDGsUAqmv6ICWW7PiFyRlnRu9dDqcF8AXOUbOM5drYQPkE1n/Q?=
 =?us-ascii?Q?MOTwOHtL76iQ/PZ2AbEfSxcHn/tCmFNsTIDLLc8WsL/CGCQUgVMsicPfle3K?=
 =?us-ascii?Q?qVlhLhrHwEmGG7bYEl2J8FK/R1VobP3k+rAAOcaItc8I4jXkp9Y+VkOEBJtt?=
 =?us-ascii?Q?laU5s+cQJzth2eLzdfZhULZRVxy1Al65/kN7nZHgbejZoYqStqAHqUeouuvd?=
 =?us-ascii?Q?r18RAzOdl8g49EJf7vVaiJbFvKcmD/ErTLj6aFyjZ0PTErSlLauQNqOEpKPk?=
 =?us-ascii?Q?Tf0GXOo6psdSTz3ZrcOxHYYws32CO7kTStvnDvFY0WVyHQP6Kz/IVIwVsCX+?=
 =?us-ascii?Q?MVUtE0OfD9XNjoamfMST0B7coKo2uALbB3Ff/grSbzxfkdloamJ2hCdzOXrK?=
 =?us-ascii?Q?hqrIgUQpAXlRB4lH6fwyBJ2lja2fInH1bleCCGNGP4lwhXAt5OHYjIknL/TS?=
 =?us-ascii?Q?aohFBeZbMOFZode6JqkbFUHAxTFRawBqBZdnUy+FSfpT/OZdzl4p5XmkNQiS?=
 =?us-ascii?Q?4e+C9f1PFq0mSz2HF5bVEHZ9wUodZUGpW4mXai1QjZ7F5PLuApMTYrWneocz?=
 =?us-ascii?Q?3dn5knrgIc0YVhWqBlxgNJakzJTay4gvdwJkuIndB8JOfRnjbEz5wRNbJfr5?=
 =?us-ascii?Q?FStEdCR9EA3xPly1uwiHFJmoKHLfJYrFRDBGaL9bwW1nzzr0w+CSTiJA+xtE?=
 =?us-ascii?Q?xhpu1p7dutS2VBkMDPQ0bpU5iz2zn920kxoik8Nu2IaLTuojd4Ru8bQa1e/x?=
 =?us-ascii?Q?jLBOyC+TWNRhPwEOcjut8SpCDlsmhIsdGWHIn07EK5azfUjRkqNBm5f3rSMh?=
 =?us-ascii?Q?B7p7+UJLgmtFw0+J1kl+WwpPGDcVcDFv6KOCf6EVu881iv+8ht52EZp0BISw?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	wKt2Vn/rX6ryuJ73K1/NPzFgGuqoKe755/vF15YISiqp4+hxfAgy9DP5UHqOD/9otWZqHX/I+LaxfBm1TyHsGa0jXQb0CegplvRTHhNa9yLKUxS8Fj/G45ciLb9NmYx0t9gu5krKaS8BAjzEhaMk1sUlPIM4dWB7aMw6DwtJ4pyTsbuRKfsf70isDwu0BA7W77U6eByt6d4MezP/+ekmKvsiFRUyxI/qvX1sXYJ45YMNz2KcM24dwkm5A6oNYN4O6YOXes5beSZOSVETwzJVlAhZZrqrqiAmQXOlYZb5qKSDc+AiDWlAtgRylElA4EcBc2zod5jXecwyFgPusJGePs3w6w88In46HiB2CSGxCBOHrIpUs6IHhSywPOcdCeqBir83CXav6AFt7v3nlsf6lw3bynN7xAgsEYltTx6hn/hfwsAMsSfdnurbN2Xbj1zgRCF5W+8dY91BvVi0EFf00xf8UxGoVaNCH5qTalJqHfpa2aBaGKWvAXTfPvfR6JsUD65ScQ5HWLUikN5/VaIui3WCytfUwm1er9fyKdrlHVPbiQCIDxX01rPSNYdTdDIOztT1OSv5MQV9xiC5MWm68dwcb0Buxcx5sAU1Y6XOvwU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6f50eb-14c6-4228-7726-08dcd2774f83
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 15:35:05.7749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ApBU/7LR5sKmFntxPot5FFfNuaWNTWVHKuYOGwl7UbnMNtnZR6HX32tX16pC4++81SSkeGf3ro0acJ4DR95oVB2QVN9M6GYFCxIOUl0z9yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4976
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409110118
X-Proofpoint-ORIG-GUID: VWOhwP_lXaEvL0Ny3nh40PcpAJu6SwMS
X-Proofpoint-GUID: VWOhwP_lXaEvL0Ny3nh40PcpAJu6SwMS

Avoid nested min()/max() which results in egregious macro expansion.

This issue was introduced by commit 867046cc7027 ("minmax: relax check to
allow comparison between unsigned arguments and signed constants") [2].

Work has been done to address the issue of egregious min()/max() macro
expansion in commit 22f546873149 ("minmax: improve macro expansion and type
checking") and related, however it appears that some issues remain on more
tightly constrained systems.

Adjust a few known-bad cases of deeply nested macros to avoid doing so to
mitigate this. Porting the patch first proposed in [1] to Linus's tree.

Running an allmodconfig build using the methodology described in [2] we
observe a 35 MiB reduction in generated code.

The difference is much more significant prior to recent minmax fixes which
were not backported. As per [1] prior these the reduction is more like 200
MiB.

This resolves an issue with slackware 15.0 32-bit compilation as reported
by Richard Narron.

Presumably the min/max fixups would be difficult to backport, this patch
should be easier and fix's Richard's problem in 5.15.

[0]:https://lore.kernel.org/all/b97faef60ad24922b530241c5d7c933c@AcuMS.aculab.com/
[1]:https://lore.kernel.org/lkml/5882b96e-1287-4390-8174-3316d39038ef@lucifer.local/
[2]:https://lore.kernel.org/linux-mm/36aa2cad-1db1-4abf-8dd2-fb20484aabc3@lucifer.local/

Reported-by: Richard Narron <richard@aaazen.com>
Closes: https://lore.kernel.org/all/4a5321bd-b1f-1832-f0c-cea8694dc5aa@aaazen.com/
Fixes: 867046cc7027 ("minmax: relax check to allow comparison between unsigned arguments and signed constants")
Cc: stable@vger.kernel.org
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2.h    |  2 +-
 .../staging/media/atomisp/pci/sh_css_frac.h   | 26 ++++++++++++++-----
 include/linux/skbuff.h                        |  6 ++++-
 3 files changed, 25 insertions(+), 9 deletions(-)

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
diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h b/drivers/staging/media/atomisp/pci/sh_css_frac.h
index b90b5b330dfa..a973394c5bc0 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
@@ -32,12 +32,24 @@
 #define uISP_VAL_MAX		      ((unsigned int)((1 << uISP_REG_BIT) - 1))

 /* a:fraction bits for 16bit precision, b:fraction bits for ISP precision */
-#define sDIGIT_FITTING(v, a, b) \
-	min_t(int, max_t(int, (((v) >> sSHIFT) >> max(sFRACTION_BITS_FITTING(a) - (b), 0)), \
-	  sISP_VAL_MIN), sISP_VAL_MAX)
-#define uDIGIT_FITTING(v, a, b) \
-	min((unsigned int)max((unsigned)(((v) >> uSHIFT) \
-	>> max((int)(uFRACTION_BITS_FITTING(a) - (b)), 0)), \
-	  uISP_VAL_MIN), uISP_VAL_MAX)
+static inline int sDIGIT_FITTING(short v, int a, int b)
+{
+	int fit_shift = sFRACTION_BITS_FITTING(a) - b;
+
+	v >>= sSHIFT;
+	v >>= fit_shift > 0 ? fit_shift : 0;
+
+	return clamp_t(int, v, sISP_VAL_MIN, sISP_VAL_MAX);
+}
+
+static inline unsigned int uDIGIT_FITTING(unsigned int v, int a, int b)
+{
+	int fit_shift = uFRACTION_BITS_FITTING(a) - b;
+
+	v >>= uSHIFT;
+	v >>= fit_shift > 0 ? fit_shift : 0;
+
+	return clamp_t(unsigned int, v, uISP_VAL_MIN, uISP_VAL_MAX);
+}

 #endif /* __SH_CSS_FRAC_H */
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 29c3ea5b6e93..d53b296df504 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -3164,7 +3164,11 @@ static inline int pskb_network_may_pull(struct sk_buff *skb, unsigned int len)
  * NET_IP_ALIGN(2) + ethernet_header(14) + IP_header(20/40) + ports(8)
  */
 #ifndef NET_SKB_PAD
-#define NET_SKB_PAD	max(32, L1_CACHE_BYTES)
+#if L1_CACHE_BYTES < 32
+#define NET_SKB_PAD	32
+#else
+#define NET_SKB_PAD	L1_CACHE_BYTES
+#endif
 #endif

 int ___pskb_trim(struct sk_buff *skb, unsigned int len);
--
2.46.0

