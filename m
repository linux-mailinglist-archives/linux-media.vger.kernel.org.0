Return-Path: <linux-media+bounces-18176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7B99759C6
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:53:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 395B01C21B33
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD931BAECA;
	Wed, 11 Sep 2024 17:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f1kHuZjJ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sAcGkrM7"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C2B1B4C56;
	Wed, 11 Sep 2024 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726077116; cv=fail; b=MLTctAwBGh2PthPjb3NvGgEuWNOE1QDiuhraQ8wm7fFVLwn/WT8niI6yuCd2sfjWstYs9b4dk38l/6Nvsej2SIzydZEpcADxhdI6zJd+Mw097J9V1hrK/XAAhqJOnyIIJ2+YY0QODy1Xto/SMvOo+7BoULknr17zq1+v2mRFLKM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726077116; c=relaxed/simple;
	bh=3WSGzcuUgBVUtOIRoPJ5RFRPerzQ41vnQfDItUn0g3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uUIBzGjBGJW+fROE8F2mf2Vo9tay9M0g5G97Q/aeXgTP/2iyGqrFnWrsJJtgr5ndGeg04+11/GhVYX9L5HNWs5gjGy476SJR4nq183qexkSo9vHgwSHPsxHGWtQWmnYymkT8ngo9/UWgqLxWP3fjteykc3KErDIt1gsl9wyYcg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f1kHuZjJ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sAcGkrM7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BHfVBu012781;
	Wed, 11 Sep 2024 17:51:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=Xo9RaLBa9atMO4ZoStLw7lMwJc1kqTeCMxkNkvOt45M=; b=
	f1kHuZjJzz0xSuglkXLGOXUaZYAUptqnjnNgMvDrunUNsF85yLEIXqSgGMWIQ7Yi
	bHj+MnTimzCyKZpNuGLGUpIM70fU6bQYCXD/7X5/nBJEBVhYAVTRYBMa0yy77G6n
	rj/PhP28C7ZBRgbw/1TaOjzsp/ORlZOUJ7/rbERH/oz6MLNRfb5ga9Ov33hEDgOj
	afhrGHlcu8s9evOTrWhMJMeSSxotUUh3XUjrz6AJpSnNWsgDBiCod9Ezfjire7Je
	xpzj1QY2LAVkwEi3hDcm3+K32WqZaI3Idhg9+wqAoROdHCoQjeU5rvUJ8IINf6SP
	qwWLsRUUSKZmzRYNrV1afA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gdm2rwp0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:51:29 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48BGghQp033536;
	Wed, 11 Sep 2024 17:51:28 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9a9jm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:51:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qv0L3APyYTi2IaRGuoCby3jainUnPwgx/4mIn7qCVsDsOAuqnLJBYKTU2Fo7Yfk/9Tzk3ju3NvutifesOPhkJA7f4vvvY1lJRdvNprGtusoTZZ/NOOmS2dUIS4EzVvMkbeoWJ0zZee8ZbOtwm6BmwN2ZU0TTpIu0BxID/uhkmn4AjnIGih3Ya+3cPIjvn/j+gvjMPuqR8X/b2ln5/nSwbi3mkkyZb3u6LhX8lP0eI2n7vbxJCpr4Kx2r2wffnhVMEIpcC5sHYIkyhXKkYUxyJV656xCVF6zmj2XkrNE6xjtRHD/vzI+Qp7N5Ra93h5SVgJxOHy/Tk/1HvLbLaY75KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xo9RaLBa9atMO4ZoStLw7lMwJc1kqTeCMxkNkvOt45M=;
 b=lVW/ZS0ea19SVmlcut0F0G6bukb5QH4jFrlJZnQ3ywfmTSli3VNE8BBoEL3F8I+GHk5F+eMpxBZF6aXUsO6q4VaT5Xb+QBjYMlc5TvzYyqQRpgrzQ1VRS7zt5ytJQDdL2g/eHEMmGwvDWEu5e7aM070VEQ+RL5p8aQ+miv+N0VoUyRbj+1jEqo3TNLEur37DtyunUd7NLbEDf2WpAf2krTV9e+elxArOl2IvKU+SkgF+jJSmFJV+ad3U/Rpxp1mHgzvJ+QnwbqGkcTlb1G8InJjljgTMfvwJU0txIklm3CjNa6vMKfOI5Bk2ROyqDMF78LGUyKzsW4h1wbckEAob8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xo9RaLBa9atMO4ZoStLw7lMwJc1kqTeCMxkNkvOt45M=;
 b=sAcGkrM7JQ9RXmEIop40ht0RTMXlgcAbtvtC6rKuLj2SDHm0pmi8YkIKVgJqinyc5VgmvbwI/MCDoN53rsuZQr6fp1FQQJ5RnuEm/IqJGs9qMZG8/qcQHVtMSIOkpc+Lsp6QL9liAd9OXIByL2OLbVQ2c1I899jKhnktirORwhw=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by MN6PR10MB8046.namprd10.prod.outlook.com (2603:10b6:208:4fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 17:51:25 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 17:51:24 +0000
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
Subject: [PATCH hotfix 6.11 v2 3/3] minmax: reduce min/max macro expansion in atomisp driver
Date: Wed, 11 Sep 2024 18:51:11 +0100
Message-ID: <b38d8936eaddd524d19823f7429138e2ef24e0d1.1726074904.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726074904.git.lorenzo.stoakes@oracle.com>
References: <cover.1726074904.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0452.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::32) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|MN6PR10MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 88680aaa-a288-42b2-8a72-08dcd28a5aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BCumDvTvGSs+3Laf31bCGhwm3IjCGCeBF0gnuUHEnqdK60pi3Gb39e2s2ejP?=
 =?us-ascii?Q?QwqbIORfmRrOpHI5AdABEC4njJwIvRPCO68JVjC7FFHQiWheMbdwCjt+1Jgf?=
 =?us-ascii?Q?6Ovei73c57uNPvSWvtzzJIJVSzel2hzzHchdWoeqzc71Gr1wOuHtAk5JChbr?=
 =?us-ascii?Q?TvrBt8HuOOcyBGTewj7v6CbHhhA3W+0POskKO+Ojq3hXb5UMn3XYNItRJ+vZ?=
 =?us-ascii?Q?LVlVwGb3odsqqz8LwJZIhPBhOyOXuFhHbCwhwQ+51QO4sllgS5MzLhrhvUan?=
 =?us-ascii?Q?LxJjLqvyhC3jKuV8syUBmqIpYqm4tVEEPFn/VQxiUHLn0v/OlIaxRKHliU0G?=
 =?us-ascii?Q?zX3mMSFiLWQuVzDoSHG9XPQIGqg5ayo7v0NRFWUMNtLynosG44oiIgBIv2Tt?=
 =?us-ascii?Q?m4poWQv7yrfXazbEwyaEG/1ZdWHEKWyoZTjWlZ7tBnSbvMJts5W2kWksvpPL?=
 =?us-ascii?Q?qA+yfaWc/mIBEOkfhPmB+CJSEWvBXdYG3dEULjZOCNjqoRCVRFmPTieD4woB?=
 =?us-ascii?Q?uSQv97TyN0m5ZTvF1vefB/73veXMgkJWoQeSwPw3QaW2Aj0dMHAFbsG/pHkM?=
 =?us-ascii?Q?2Lr+uoe1rUFM99Pc6AB6VHhz01ow7VJ/P/O81OEh+/0XXLSJoiL501pbagx4?=
 =?us-ascii?Q?T+R5s2hm3D/1U2/dXKLFv8WJU9H4Y5hJU+Eivh7fNkdLmpLnTiTAZdXVb13A?=
 =?us-ascii?Q?zDLdhQvROV73YqPm0XpZbJNg86w3D0K0QrwopiVsoAydNAizI80hS0mv0FsO?=
 =?us-ascii?Q?PchopInW7dJS3Zc0jz7utaMRtkdWPGXRceAb+cnxQF2RI3niYRZYQUB4sJaa?=
 =?us-ascii?Q?g+M/WveT2fMNaveVWga6RjSUelPjfwjWsvc41xshaXoFMBpYqDB4HA5k743f?=
 =?us-ascii?Q?yYpujfAx/XmS+m9F9NhezUZNO/UAlnzEcXMcniepLRleM8Fzk4DP9Sq8Od6Q?=
 =?us-ascii?Q?RDwcu/DE6wvH91rfddTu+6/zBUpwNo767fDeZgB3djcNb/KeVgX1mw/DMj10?=
 =?us-ascii?Q?0NJW7jacMFWxZkXJ3YybXcT1IurmrTjM9W/72E9sIYmMHyDqlMoIqEIA31qj?=
 =?us-ascii?Q?AqvEPojdc1gTA5vc6Ie7++73BVLT5Q9dRD2zRTeVr03r0XqrMym8KQ+ely+3?=
 =?us-ascii?Q?C/qWZdpVR26TFAIykF8IwbNvyYQPhlqP1k6vWSeq4ZYiNYcSEfGX6d60shqi?=
 =?us-ascii?Q?/xLIueaflGrjBR9bEUxYkawvYfKIVf/rGd7p3tbzqgo4hQR2GEvkPOOenbB7?=
 =?us-ascii?Q?mfZKSatsFlBtLTGEXqq0XJ5RxYhSHIKv9eSohs7Xu0N0T3RNmHxa6gbwdDHP?=
 =?us-ascii?Q?x4DHiB35I2IwmCaHD5Otb3IUhX0/SPV3vCbxgg6CXVRxr7l6Neban7+k23Z1?=
 =?us-ascii?Q?aSXFOcQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?H7UY2yi7fE3VDRK/lzW83uTg3q1SogNfjieg+H/CscIC7xhhcxX9+8emv+hy?=
 =?us-ascii?Q?F8Z4PzO2YwmddW97d++T4+qEyAsNLXZwkPCCzhk4w0U3Lmw8uRI5SULA4yWH?=
 =?us-ascii?Q?PqsdwOedcHoSnmvQ/LXiF4jng1E7G7QA2KroApuqi+Lil62X37OSnCjEDRxj?=
 =?us-ascii?Q?r77x5oPs+VQ6pUOeVQvsiqVUjDxXR0HY4DlMnP/z8dgxAK5IonlV5gXDmqsY?=
 =?us-ascii?Q?jA9W560js2nXYS7ny8VpBzzGElN+Pt30wl6WZ9bPQ1ZiC8k8x9ujBKrm0X1o?=
 =?us-ascii?Q?it3yAKIi5D8j6iEx4LuAQC5LdLtpti9jaSaGZxW18mb9iuW4c1m+z/ksO31T?=
 =?us-ascii?Q?JR0ym5AUUPAwwkGlR75876OYZ6j2G9DuxOc3CnFySzgz4mJaEkqppFoEo7tE?=
 =?us-ascii?Q?ekjnsE6eog4C56KnAq6pTslrT582sVawg6Hq0QKfZTwuATRwTG3hrN2aIALH?=
 =?us-ascii?Q?8UwspqM2kc8sc9eVRSM1ZdAh+e0uIF+YfFEEzLF2rVTTQXeiSqf6DPHJFgru?=
 =?us-ascii?Q?0N0uOxIJxjBbJmErESZudLFmmeQPtP5c5XGCtoLmU2EeiMjYk3stnMpOrDXr?=
 =?us-ascii?Q?3M6Cw1IllDzoBSg47E3nbA0Bdi0wpQG35ZD9UTeIcuo7C7mGNDAw+zOHhqPH?=
 =?us-ascii?Q?uW/UzkxHM83M92dnF+qFN1SgmSf1B1vBNF9zdKzVuJ97RWDt0ToRzAvPXM5G?=
 =?us-ascii?Q?/KBa7vRRo807FeBX6YYGPcFH6UA7Fa9z8pv7jdNlhKYa3zbAVOx421L5Nc7A?=
 =?us-ascii?Q?s571Jmci++mO1tC/VLGIhd3BKXgEoAU9xEGT+nEbY37ZhccEND7ERdd6qbV5?=
 =?us-ascii?Q?PHqWlIgbzX+rHMz9HRA1H1lPJJbAhiXd3xXnx4rfz5RL1NaF6x3nLRKLLRCF?=
 =?us-ascii?Q?x4pg5WIsn+/jvIOqBs421QsSI/MeyD1SkC7O28dew+mwllmDsho84C2t/pxp?=
 =?us-ascii?Q?cV47AnTvWNG+HT3AjQ02BitkwGq42DMVuU8YVpyqtxShtlIz8GVaPp1Ijou/?=
 =?us-ascii?Q?7yG1hMaZJHRBpQInPHgL8Rlcy+iG3AEtSDff15Bs73yXrL3nHIP3L8dRtKKt?=
 =?us-ascii?Q?jjlGb/DIFn/LMUDeBJO0Zz7TW+cPe4usDsAcQW2i1i0ZmaGwymszy18pXWp/?=
 =?us-ascii?Q?nV0XQ9ZUk9+LHk8+ukzqeOpDhLalUOCOXia10Kznx9MbZ6WzscZ/61UVbGsY?=
 =?us-ascii?Q?N15JkjNII04hmXgPX5fCJwhJxncGdwGy2D6hA+kCwuLPRecXRbFp9ewWENfJ?=
 =?us-ascii?Q?f59ZzRdil/XWM3vuWrv2ikANgwxDzoJquIYx2NmcmP/W2udb+/1OfZts3mVy?=
 =?us-ascii?Q?If9VGpaXbPXYedW8bcbc0QtXZvVYj9hy6WJQQ9FXktyvSuK0PuOMQdauqkY9?=
 =?us-ascii?Q?NCfDDGWUkV9uKXtdfyW5kAI7kh83jorpWicI8s7BsJhbNdHvL0n6zoySytVI?=
 =?us-ascii?Q?2DgeWh/TFZ4nPXKcLh6s/ljJtIr8/6R8E2zIEPaOqCnGlurggwvte/nok/vx?=
 =?us-ascii?Q?SvvI73PT6l4Lts+6Zb01drUW0fL3BHDfl7ySDRNHObNTSHRfh0mmE19fllQQ?=
 =?us-ascii?Q?ZyN9vNUmPUUbeqe8paGC1q+FIB7JJc66WcnLODNXlSpOhIL6ZE2pNPArkwjz?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	poUJ1h6lVk/nuvw98Y5LjLVCN9wjpuvKNG4p6YmyNJpcvhipEqi5DoTTlkvvtZJXBeUO0Otfi71WtP8bTx/jf55uDto/uLRPRMfXbtW73KyVZ8iVTPW/N4ExN13yfELz7lszUG1aL+2Urf+Pz5VRYuI3YSql3LngQx5EocdW59M741+T0S5txwTB1yKYy1uN/uZvCG9lXTkE5NANNCIA3FPkUYteeTrAM8teWBDvebgLImmzeQeDmFxFIceOwdD2R8xbbbcY5yElDEHt5xUGKR6k7PyawcI/rG0vSeHan8ZETSrOc8UM4WppguR7hgi97NrYWAyHbqKYBi/olVnPCGdTA5wX9z0sqFNp/ZPUIqcc/XrAUOtNniWUHGB4DU2QuOmVSUnUwrqS3HtQotJLmVCjoJim1vUqfVC4JLBWfesrt3UloFCv/wKwEBror9RxnCSEbXeP+isRSeJ8kjpdvyEOFS24zChYNPkfcDMXIg/yale0jMkSyHLCAjZeUewBJSyZCK9uZZBu6f2fx7R99aPAfv3LawvzS7zFdWDgMJRAxY5TZiZPNIoDMKuWkLF2ScsCnd1vhFhatUgw8aqyqaPI1SpHqJbY87HHMNKrXkk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88680aaa-a288-42b2-8a72-08dcd28a5aae
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 17:51:24.9367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ub0vPHUsCv9YU1lqVTRe/ARYcQXMmaMHCl3XZhFiMno8XesixTHEQ8E/7qrS4NHcEeOE2SSvOLVEPrjmlmbEsOd/iB61D6iox6cfqmAXaow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409110136
X-Proofpoint-GUID: 39i1THJ-djTH1ub2lkPD41PyHN7TdYF7
X-Proofpoint-ORIG-GUID: 39i1THJ-djTH1ub2lkPD41PyHN7TdYF7

Avoid unnecessary nested min()/max() which results in egregious macro
expansion. Use clamp_t() as this introduces the least possible expansion.

Not doing so results in an impact on build times.

This resolves an issue with slackware 15.0 32-bit compilation as reported
by Richard Narron.

Presumably the min/max fixups would be difficult to backport, this patch
should be easier and fix's Richard's problem in 5.15.

Reported-by: Richard Narron <richard@aaazen.com>
Closes: https://lore.kernel.org/all/4a5321bd-b1f-1832-f0c-cea8694dc5aa@aaazen.com/
Fixes: 867046cc7027 ("minmax: relax check to allow comparison between unsigned arguments and signed constants")
Cc: stable@vger.kernel.org
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 .../staging/media/atomisp/pci/sh_css_frac.h   | 26 ++++++++++++++-----
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h b/drivers/staging/media/atomisp/pci/sh_css_frac.h
index b90b5b330dfa..8ba65161f7a9 100644
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
+static inline int sDIGIT_FITTING(int v, int a, int b)
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
--
2.46.0

