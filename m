Return-Path: <linux-media+bounces-18174-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582E59759BA
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 19:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3D2CB22103
	for <lists+linux-media@lfdr.de>; Wed, 11 Sep 2024 17:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2A291B5EC8;
	Wed, 11 Sep 2024 17:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="bfAI+3/P";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jg0K8a8Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB321B1D5F;
	Wed, 11 Sep 2024 17:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726077109; cv=fail; b=r1QmZYmTXBkHLdBnnRu7tMMqT/rXgDZB1jFyRJTvW6EwujupTyH1HCy3jSiVlRwXrM8hfCubcEYMAwmVgHNOKc/GX74URHfq50QObxueNaNA8r6FO4dz/27CIF+SqgBqCEOYYyFXzfaUXtr0M+Zkc6xTwEdhaBfau2P1QtNUlrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726077109; c=relaxed/simple;
	bh=s2I8wnRgxloJGkk6USIIqIVA83OeHsBDtkRDzJe7S9g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nSai4TXCDHwr8D6GBvvquksoL6wc5RH67t84RBmd7ubV8m7yw06wUXpzHcDGpe3N0/ooeis7ZvhwLuUCurhxM53s3cD1XoeWvPN787YDRUJXiS3EkSBQJGrMEUcyomqsWl5mANAhOZYx4M48xRYVfL9F+lho8K0RHkT5XrY/OFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=bfAI+3/P; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jg0K8a8Q; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48BHfV7k006777;
	Wed, 11 Sep 2024 17:51:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	corp-2023-11-20; bh=aijDqYqfpfHC/xgzvGXjEYkRKd58eGDA7vJfJcZob40=; b=
	bfAI+3/P9GZTdsyL915IM0k10DjiJrguYzPbyV4DbQglhu69hA19Q1TNX+n0fLa8
	Fs903g3fiqLeAHUiakLFO1UjvNrodYebYu4xN3b6iwARF8vMsuEhg1K9GwCJEwwf
	oQjM972PgpzlSyAnfUeuhqYbugcYf6wKpkWnYhkhUms3Y/z+PPlYZx3v1hilW4B9
	J3Z+G3KZ0fkaEZVgatWhB4Q1c6mgSxVS7+JkJ0UA/xxSCJxEE+kN5FCrx1kEqGGH
	9BDjzCFY2Us2de04ViFZivqgCTaTdxqBuh6mwj2vfNPq2gmIPyfcxCj8AupGMPcL
	N5CjGTCp4IP28PrAzEZc7Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gjburndu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:51:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48BGDpT9032401;
	Wed, 11 Sep 2024 17:51:25 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9gjx1w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Sep 2024 17:51:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiNHU3F2m304SoHfz9HBDjsbLMvvYQ+SLvEpFbDKdXCTpEMWuL6RDrhQY20SJZd+ur1OmIoVuSj4HIs/gnLshGn95vSKTpzwNfJojZuiHGnL3faZuM6tSXiHM/0B1LoRyUBrDbllxxcjTlCaWfrSiLBTct3JqYZMMsFmkWoATA4Ui2gmG8+ku4YO0UZkp2PTLmIMiLMqTsOugLiG/pMONcC7YaUUjwQMBjHPujgJtk639v19gbtYtzc6gJvHKOr8b7KZKg1W7zQpEmBnMIku7IR2hKuMwE4RW1o525k2zMxiz46VpLZJPVThh77wbV+OY+1t3+s8pCrz4WyI5v5naQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aijDqYqfpfHC/xgzvGXjEYkRKd58eGDA7vJfJcZob40=;
 b=YoWaAdwsQ1Hgnt4LISgikxfvxepaFQABqEs/pFBrnjYaeeHec/+YQG1r8b7liFJ5Sxl5xGxLM3pcLJpsZMyoQArbHNDU6Z2VpNurDH4shGt6Mt3iPnoi/Ko7M+s7hrzrULPAnh0wxsPw3lQXRdMHPz/7gBhRca/sC3kDh3a4mp0rpCLPFL648zdE+x2epCZZ1YnrhlIrFKRLPrpy0Fkfzy3BowPC+0W9mA/HTzqoxgAfuqdM7fAOVU8gt41l+Zs6G81W0pHAR3zrJ7Tv8W9IU3Yos8LqG/EKHftkRg7W+XJHrHtBKSz8oMOaFK7gmG/V9ycBTwiOvQOyKhuN+CLiqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aijDqYqfpfHC/xgzvGXjEYkRKd58eGDA7vJfJcZob40=;
 b=jg0K8a8QUpwf9avlV8GCVhMBl3lvpSZGkvZjy6FlEvhqEkdOfijoJuvXz4cD5dP7bId6PrO8eYJD2yEccNM1imT5Dpcya5m07qxPfOJVls3T7U3lfIqNVLya7DPax/VReJaO9DaBUvzgp49B/IRhS0dIq3R9nFBWcV2UHjSBHq0=
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com (2603:10b6:a03:3d0::5)
 by MN6PR10MB8046.namprd10.prod.outlook.com (2603:10b6:208:4fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 17:51:22 +0000
Received: from SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e]) by SJ0PR10MB5613.namprd10.prod.outlook.com
 ([fe80::4239:cf6f:9caa:940e%5]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 17:51:22 +0000
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
Subject: [PATCH hotfix 6.11 v2 2/3] minmax: reduce min/max macro expansion in skbuff
Date: Wed, 11 Sep 2024 18:51:10 +0100
Message-ID: <a32131084038312529243bc22b06f0ee64c95fb6.1726074904.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726074904.git.lorenzo.stoakes@oracle.com>
References: <cover.1726074904.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::13) To SJ0PR10MB5613.namprd10.prod.outlook.com
 (2603:10b6:a03:3d0::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5613:EE_|MN6PR10MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 7822105f-cf4b-4593-241f-08dcd28a58fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?u/0TUfUstHVKDgxv2sEoHCvUJxdplIQimnSmpUfrbn/5fb0cqDHlT/3+w5G/?=
 =?us-ascii?Q?1mzMru9yD3KaiOFHFCekydN+QXHpUurKVva4CneU9SiQ8v/ZjtPFCSfdiB9N?=
 =?us-ascii?Q?2UHnf3wICii7dNalFudhrmkPrzyviZmtKzPbUeOzzDWl6jJQYn+chcm3m4fK?=
 =?us-ascii?Q?Yeil8UwXg41yzEbtBUfbdGbnVnk30haW0phHN8g9VyKtMi3fvuaPD3Op01Ll?=
 =?us-ascii?Q?IIFsla04KdZBJtNxwu4VW256a9egFk8mCT5HiJXbBCMl4OuSGvuhposTMQPI?=
 =?us-ascii?Q?Y2YcstnL0R3Si15BgjSBOZIb4vnfY8V1jegHvacMFqV59zw8psDy8CPX20EQ?=
 =?us-ascii?Q?wu1eIeBeYUEBrxvSHdorzroaHAbRMm/J5rRTkHFtsyVijdhv4jJ6px/IiaVE?=
 =?us-ascii?Q?TQdTgsP4sEvFayMxqeBj52JKAD17ZrqX7wvTI8fC28l/+WEGin5V0XtuKFAN?=
 =?us-ascii?Q?SDVymu4PgzWYK+t4yBQPC10FKLhtTp0vZegxNY4/1mPRk0UfoxkkiWHUbtfF?=
 =?us-ascii?Q?dv+32WUVK77mkCl3K9BaRHxeOBCqyxH7sxB7pF/+jb/Lb2c98IjZJJl0cLAK?=
 =?us-ascii?Q?orhlMtKj1dPXAkeFFO4eMIF7zsdkzEAUI9nejyyBSDXzMXxL+AAOf0TtLlMC?=
 =?us-ascii?Q?FmJmdbJAdg1A4SqpuYL6VmdKoboQd3ZGrQtZ/vqUReZ3PGuUElV5h2oH0XS4?=
 =?us-ascii?Q?yiINt3TT5hGV0Ri4gAt8Jkm1vpgVFeFXjsWBIneHnVEnc+Ue1fo3+ffoqhtH?=
 =?us-ascii?Q?fuYOqtLAiEXFPqml3AoVL80cOmvV0Z5MuG3kLcbAQps9W37pdrey0XMV4iJ/?=
 =?us-ascii?Q?8U7tlLM3b9zFm0svds91vsg6WmKoQ+eeufYoVZDxUWI9jPcawXQy1doZRChD?=
 =?us-ascii?Q?HxuZ56dREvXoNV6oxBGcvTFfaGSyd9LJ+t3GiJuCJ2jsS6YcgNQR2cJTN0Y7?=
 =?us-ascii?Q?dYAOSgNH5lhUVgqG7XpU5RbTMDoX1XMxRFBaVkjtClu+i9x7jIQjN6FXysNw?=
 =?us-ascii?Q?7cuB2Szl+5Rrf2HUMGXQaDSEu6KG7WI9Hl8VE3xVbfnA1+NxnDIgnSgQi8dI?=
 =?us-ascii?Q?9d2//wrX7FKZrFMv57xHqgR6OffX3gpdonW1zJJLE1xtfCQRAYI0dkiIaNkD?=
 =?us-ascii?Q?r1klpjgodzAYiZ8bwYkVTjQgV9ra165OJrmfH9jtdue2b4XFaWY9AByhY2ST?=
 =?us-ascii?Q?4OffR4YmnyaLXLvkEHXEtRecTjx5sQUw2Mtl1pRGEEbwfqyhT6V0cdmWO4Sq?=
 =?us-ascii?Q?RM8rm818DadqjS6JgL0O1V+mq2wfazWEe/Z0Nj+0J0Uuu1U7pvxANe+MS/PV?=
 =?us-ascii?Q?pYnDg0N320VER+w//xmJ+lrK5QVfbJmvM1uAc8OY/iIMRA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR10MB5613.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pcTbz+A+IrbgPuBSilM/5u2tvK8Z2PVgjehaI7ecySmbUJNuMKgvcNKlCMYE?=
 =?us-ascii?Q?5Zll7OpxCdYwP0ypPjbnd2HGmM89TQWYepVDdFcrEby2z0tC133CJQ6FhW2o?=
 =?us-ascii?Q?bAL7hGlMvesuvJbijnvc//CNKS8es2FGJ9QkHBpfDFX5tdivBQmAl/Ti6eDm?=
 =?us-ascii?Q?HnG/l4FusSI+02YJqYw9dPAZikmTBvvQKubC6nd7ezlLin6HLt7UjqsAmy4g?=
 =?us-ascii?Q?X1vo7MVhs6uiN6nTD+qhD1CH9PCh+8tkAHGH9knDDnOFLztu18FOJ6yEh+ge?=
 =?us-ascii?Q?h7/Y0MLk/hFaI0yXeFbtKeK41JL/fed15nIO4K4OxwSj+K6o64MQ1/8D5yuh?=
 =?us-ascii?Q?Ph1SJ1dWc5KgYRBY3ag8MeDpx9/oDpyuaV/odZdZcY0aiAO700Jwe5+5J3D1?=
 =?us-ascii?Q?7Xv76u0Skps+NYn0kji/QrQvERuh5yPcH5W7O4MDI6IEJfuraycEQdBwWa0O?=
 =?us-ascii?Q?U//tWG9Pt6OHXD6gDlgrHXsxP8lOBF5+GJFeP/UdiFWPMOZHJzAKodPGSanf?=
 =?us-ascii?Q?1xgQVLyb7H8+kjSDrlaEsSaqoYZbiYfUF5nbTayNSY101vx/9Xb0Y9dt52H9?=
 =?us-ascii?Q?NqiUA27ko6UXsxERt7ny/0WigjBlSEMNFdVpE3Dib2cVXeXKAsKBNe9/4vwJ?=
 =?us-ascii?Q?vI9c9xHR+AwcrySdaC4MeunLf+RVJdljdQPXvWQMaGLNJ1BUmyIQhjNQ2Oae?=
 =?us-ascii?Q?QAzyAGJnm5w4Swo9jpKQCJxKIC4mM+cUmIuU+LEolZl1+Gk5kErkLpscXoBp?=
 =?us-ascii?Q?+zVyxP1otERY+ugMMWgGA119A9OxNslmqJR0gYIJ60e8gCvm6upmgnnsM7z9?=
 =?us-ascii?Q?y1FaU/TqmveFOOwoOrC7p1BK7WvH9fwsgh1I/Rx8jilYsmRVfMNcnK4ynTCn?=
 =?us-ascii?Q?jIiUPH2d1Ouw0iGlkrgMRPTgsFH8E5134hzUQL1JecWqdN1wfdzf4qsLnWoi?=
 =?us-ascii?Q?INGKBKtUcPtmG9sT74WZ8oSI+xCHHTnxhhLr5+MeRp2mj5J7zBcLKGMHOmpm?=
 =?us-ascii?Q?D+QGhsjiMm2I0vFOEd+6KkvY4lunOcooyia/8gS97Jq4pxD/5CA9VHwf9a7W?=
 =?us-ascii?Q?gbtIK25+YNWYclMGHmLaqsgjMtwaXR0XeDORTkRNzvImRcyZRD/LS1T9lwJU?=
 =?us-ascii?Q?TheBAfUbErFWtVCwDjptQvqW1zGA88tjtNnQwGIBTNSUTZzRJG+JLTcpbqWT?=
 =?us-ascii?Q?AGLzymcBgYjJ2FBC2K+a0W65AEODiJcMMDeznH5M94ZTrGJvZMdq4w79OcY/?=
 =?us-ascii?Q?961qVFRecxs+rJvza34U664v/DKRBwnzdcQiTKSVI50v9d0yMK+M0OSqXSD1?=
 =?us-ascii?Q?NuUA30hmG3EQaSlhkvTAsS6UpsizACWBLulZzOCRefi40UKb96UlYLmhUbG5?=
 =?us-ascii?Q?NNB5jPyO4H3w/PEWwiJbO15B8Qw/U4Dj5TYy7g+4mkEYMFWjjwyW2ARQwJNi?=
 =?us-ascii?Q?n2Ul6KMvK21FJQg4h1XS1sHrKgDKZ849yykZtd5fq+dB8ZAAoNSexPBOFV7g?=
 =?us-ascii?Q?WSriCod3+Pznlw1EEbZxDbYG1YYVV0vfdTQpolJHvkQMZqnCAL0T6ddg2Z28?=
 =?us-ascii?Q?G647YtU38qyZ/fbMbfjwITQkvgakVcl11BpyMdrngFd1MjnCGbba1LakaRoU?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+tCI9IxaUVP2IfxUbbHo3dIzw0BfSt+E06AU9ATmhtoMePVlEjtlJY7NmVoVpHvKinv4KRVvGs/ZfubjmFiH8mk0tYwv/AeuTyF46kGpCEjUuWPYYxHgEAPPvXDlbWGhHThNu9dtary9nyMCJBv5I9p4qfnEndL56ebS7NVE8UeZThua8MxKEbrZQN/KVTaJ1GBuPew55R+mnewc7QTxMRQqj1y05LVMEArzOQJ3rQpB5S2azUJebLYG7aNlA2TnRqYziVAun2mVZUOaQCVaHqP/pOi7U00kf1070KhLN9FAEQWgBgRDvxQLrwM6rb0zlsIu2tNoz+xLO0uMMU3PbmDlUtQy3V7WZcgSKX6IpmOtr53vtBzyJ0BL0rEr+zQzVzjWQlkMMjPe3n/s98nwEQHxlC7cwHUVcQNJ4Vlbn5YIsQcc3ve1V7+wgRD9eCmsfUEt3lQQelkkKuHU4U8oeS5IlaNsAyld+B8w0uBMMKkcbsdYXMy7vU8CIWpgK6z2Rx5ELrwvjqQaP8m5qvKyvFnVTbPAzr0/JIwKQqKOhjLbW9tXVmSDXBknLD4a4ASPq69oSPf5+LtmEknmlmdwEkcVIfQTjY6wXgZkP/nj1co=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7822105f-cf4b-4593-241f-08dcd28a58fa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB5613.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 17:51:22.0975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c+UPsziK8VFTosBm3lN1N2sZIoxpeA1gEEX7FWCAeqiBqQhF5/QdpjFsCBKsZ4fuiMZOFYFjNcaUQifSbhP5XL8knS+8FUoYhtJ+69Ae8Vc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_12,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409110136
X-Proofpoint-GUID: r6ssqqUxzaPY6O7zUL2a3hF8cwYiZ8uh
X-Proofpoint-ORIG-GUID: r6ssqqUxzaPY6O7zUL2a3hF8cwYiZ8uh

Avoid unnecessary nested min()/max() which reults in egregious macro
expansion.

The nesting occurs when NET_SKB_PAD is used in a min() or max() invocation,
for instance, various ethernet drivers wrap it in a max().

Not doing so results in an impact on build times.

Cc: stable@vger.kernel.org
Fixes: 867046cc7027 ("minmax: relax check to allow comparison between unsigned arguments and signed constants")
Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 include/linux/skbuff.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

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

