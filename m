Return-Path: <linux-media+bounces-17145-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2984A9647C6
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 16:17:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61035B238FA
	for <lists+linux-media@lfdr.de>; Thu, 29 Aug 2024 14:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0318F1AE024;
	Thu, 29 Aug 2024 14:15:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2133.outbound.protection.partner.outlook.cn [139.219.146.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D532E19005B
	for <linux-media@vger.kernel.org>; Thu, 29 Aug 2024 14:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.133
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724940948; cv=fail; b=QEVnaRroCHf3HOV+D/MEp1nbR+KRLv9m/mda+otdqiZXIDYH+z7cbp6qMDljE7gNAxmJMcjYsMHKl5u77F54BOt30Ilk7zn2oBI1mjHtKNy8adGrp9X090cwYAwQIhPMy3zQYHy4Ymrpc+FKHjVNtCEEU9vcornt/h5nw7B+OOs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724940948; c=relaxed/simple;
	bh=0IUmAiVfElQUaLQrFLms3GqmjgWjBcOs0pndjBbTmOE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=axpS4dqdF08/6f9RdhU7tT5u2NuyG/GPtI0PUizBDRzzSj6rGw5Km+eyArop55rE19+Y7JoHtI9lacqFQUhcsVE13VDGGB0aa61k8ufCEnDCHLbEMPcXJoG2023hG+x6KqkLbOVtpzuGROAb/i4Am3sc0ncecP1J6NMHbhH6BE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myuEcN6cv2mRAdeKqFAd4DnZhI2hJ8Jk7NCUiH169JS4qOXV0gckM1TYjjEI8nhzGAGCtzAbLJKDpLVZnaMde5fdfcpui7z6XPZy3LbBLm168DNuruvAH5HLZtd2oQ8WL7lDrnjMir+I4F49wzmQ2l+6QElUd4qqHvW+NDnmw5VngoKN96QE6IkSO0IhGKVsQpp6mo+fjJxmXt/C/oesxVtqwCK+HaRkafTPqgmsL9sENGpkO31f4WUOK42vZXuGIRS2pCxqza+xO2S++hSqzNsQ1OFtWvoFa/WUlSS4oBB3VFpwyzQ0iZiVBTsCHziH7Vq5Ts9Lx3rhC/Bb3zJGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IUmAiVfElQUaLQrFLms3GqmjgWjBcOs0pndjBbTmOE=;
 b=aNha0z1h796I21stN0W4jhsjNb+O90ATtbHLH2JgWxtEVQjuxt8AzphOuaVS+q9i/c7KyATfEMC2v/QdEhKPUuuuUrMebCk/S1S2hvq0yjQIUFMBXBShHHy1eeeXtRhW0dayR9axzx5jxV2teMDK7yx/c/l/CO/5GHOgYcT9Lu6i8il4z46jKf5OnG+gUBJc+s9W6X9C5XJaVdfh2T8M79WOrUqokZrLs1LmUPMyAdia4lAJQUZ17kZJUOhhmi/cuPKHhTTHdzecvnyXaAMVpDkP2gmw6dg/d7tJPbLST34j93FZ7evnO+4JWmW5hECTZvd4XfPR/aVUGTgQfhqlyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1047.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Thu, 29 Aug
 2024 12:42:06 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%4])
 with mapi id 15.20.7897.027; Thu, 29 Aug 2024 12:42:06 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: zhangzekun11@huawei.com
Cc: hdegoede@redhat.com,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	changhuang.liang@starfivetech.com
Subject:
Date: Thu, 29 Aug 2024 05:41:58 -0700
Message-Id: <20240829124158.708156-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240827071122.26706-1-zhangzekun11@huawei.com>
References: <20240827071122.26706-1-zhangzekun11@huawei.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SH0PR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:5::29) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1047:EE_
X-MS-Office365-Filtering-Correlation-Id: 198374e9-2db2-4444-b404-08dcc827fd7d
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|41320700013|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	TmpghIvRSUIQv+e+kGRvzKfbCvrnylTI0lur7vJU/iYsWEZPZg+IQ1Z9ekjCrwZbm7klw/XT55Bi47UXAEHiMieSxub1WyY7gDlLyXdCHb1YEp60Q2qfL5RXTFLF8+1z3B/sOXWtw6+/UEb9otMMTpxE8qcTZLnjtqZamrPMZCh+7IL7NGSPiGf3W86EhOGLRuHvGfEmPVQIsY5AnT0TaaBN4AC9nPLOWiz6qR+GDrU/hI//A6aEf5PlycPTAxKUAj5pj7MSPAFtdIDK5EKTZuIrZ4Uzlh8b4YGi28ZH74G0uJyP0P3eAy9CqO2m0/mIitcU3b7WwkkZcD3pKlWO0DU/MBklzcJRqWZdgmoVfvO3U1S4Y2vCPh0/tJQIcK1GkRyA/0i7z56oK6+slSu4M5yY7XLEJokuZ0e0Lxr8HG2fYr9TwIhiE56qSR4Kh50IX3ombIfer3CxnMGIdUilA+zVmmbSswVT6AK82gqQuTQYEVs2eJVSqJYZYo8W8QEo4Rp/4KDnqiHuRqY530eD5V3J5WhCeY/2H5JuHWbUBJjC83g/QLSWdItFVqnJNQ1hZbxKgrUnPG4iIofwpXyPLUsWTo+3Fy/gwpuDBLJpzNSvl0TwmkTO1Oqn5MOajwek
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vSkCYHUEKmy7RGqFFOOpo7wZet1g0vqH7dFwQCB1w106XW7OoIbo1maoqzVH?=
 =?us-ascii?Q?58MyN3pMw2Hx/ryobBRyKQ82vx3zDNRYb402mCIfRzbdoRZXqBpanZtI9r8J?=
 =?us-ascii?Q?gIXTbFniKYVnIe3WZRm3rPfoui2NebVZrdlR/1TL5fka0caQT+6MggEs9uyd?=
 =?us-ascii?Q?vA91qgIKcltAZhOI2+UE/nosGBg9gzCIPPQ2O7FeY6e48Rp8MjKpYM5+eUaF?=
 =?us-ascii?Q?hXFy5JAXTQMUab5dZ35vvNN6Xhy5BarK3hbiPxednd07fBGgL+hucEXl8F0w?=
 =?us-ascii?Q?vcw9S8FN/xbjd4RJ4JK7IWWz+SyCLsYmWWD8cOfUhwxadV9Nriu4pWoF71yY?=
 =?us-ascii?Q?QhocG80kKqnfraPdWKiZxZCf353xMDN8ySa5IGJN1ZgLAqdpbCj6TXY6P7+J?=
 =?us-ascii?Q?TFIdab2iX2L5eyzq9m9IZLDXEwnbVRIdPr9XkcRcLGvRDo5qyoRm4j0A8GAB?=
 =?us-ascii?Q?qBzvbYvfF0E6WzFtlL0FOjjGEdOnF7n4kLROU59dVr83tyi1KHuU5bImcfkI?=
 =?us-ascii?Q?dsljfh5splhUOb0g5TqjndOcNnIRx+hCCPlke23xqK1TgoqHFjRRqt80lKCC?=
 =?us-ascii?Q?Ivizlf5iARnvOQtKoXdHH4cMpBv0geexZGf5tx1+RgDxwi01u8O1G0NEddZt?=
 =?us-ascii?Q?0BzNwAqm0Zt8mVeclRJcnRtKo8nLAvncPP8GRr1ycrB3vv5yb/LgjlCINTeU?=
 =?us-ascii?Q?S/utOzOUSvBczQeIbGBwhIt6xe9ccvIvQgQfHClZdia9/bUoWf4cEYuKsGpV?=
 =?us-ascii?Q?g0mQOfF1Vb9nAm9y90Wn/zGmIvUfZkK8QMAFXa3iiTlIUUABqRn84B+5sD7q?=
 =?us-ascii?Q?ndCh3fd23SYOjTes747PYKYxVgNkw1WorFrabVS0iSa+RriCapZi0Uch8USW?=
 =?us-ascii?Q?GeKGaX0LLGVHiMuycZ3MrlJt9NyRO4AQWXYS+qXili6iss+DCUdpiX+Je6bo?=
 =?us-ascii?Q?nP3ZFTMb8IR13EEUO9n5BWYPcgEcV0NPPvv9AqMP+9x6smvUK4Cpaysa35kM?=
 =?us-ascii?Q?Bq8d9xk7H+ENdQG/hzonFSquqc7ijhDFXiV23VLeXNA51a4eit23y4XEFQzY?=
 =?us-ascii?Q?L2xkO/O/VKG3iG7YlLpxKnnGpgXXw4VbCTFORrpPGOi0hBbF9+ZcbStBrQut?=
 =?us-ascii?Q?z6g6JlbCHSqLbJr77X3DF0kk/oB8/kvkAZHIfdZamz4noLJAP2GN5K6F+2nV?=
 =?us-ascii?Q?6G+iHGRnelrIlLkaThsy6+d44oDb96u6AnE5TjkC0mNVG1VLKccnPGNz/Qxj?=
 =?us-ascii?Q?Em307JtY98JPHymgUYnoBNbGrC0OMxA3YZoKI39iafJe1sk2IHgn9jnfOSe5?=
 =?us-ascii?Q?fBgFIYf201E2JzEaYChVV3peebSAys+w2uKPcQaGtPC4YcwgHP2Brc7LiylY?=
 =?us-ascii?Q?8By/vLOwUXBI5c01heYqmfRRwxJd/qCTlf7FvqcsbAwUKtKNSzy79zN0HzoX?=
 =?us-ascii?Q?2/UETOxceco70TqzkCRA1Fel/xAAOl4SL/kBa27UGQVHoESZo96j21C54QXy?=
 =?us-ascii?Q?QCBGEKvQxTGMAmToLly40pPOu9yQcPABXZS117RzAON2TXkSBe0gO/j6aboU?=
 =?us-ascii?Q?mlPtV/dFPuy8G2jmlrugJ1iAXOPmmaNZSbye9uqE9xx9p8EwcBikDFImblhL?=
 =?us-ascii?Q?FM0dfZgAKI48q9fYfVaa81I=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198374e9-2db2-4444-b404-08dcc827fd7d
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 12:42:06.3916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C00clHjeRnm6ejcfOMmqPPHlQ79/fY8ivdUB4Vr0uPNjmVhHHLWUMcUFQqb9jndmIj5ryqGEkoHTJZn/hIaAXUCI2/P0OlGzXPogxLuO9w8DPXS59S8td9tzQbWqZ91Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1047

Subject: [PATCH] media: atomisp: Remove unused declartions

Hi, Zekun

> v4l2_get_acpi_sensor_info() has been removed since commit d80be6a10cd3
> ("media: atomisp: Drop v4l2_get_acpi_sensor_info() function"), remain
> the declarations untouched in the header files. So, let's remove these
> unused declartions.
>

You just remove one declartion.
Or:
declartions => declartion.
these => this.

Best Regards,
Changhuang

