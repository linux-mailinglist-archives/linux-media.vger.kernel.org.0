Return-Path: <linux-media+bounces-49616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5FCE5BD0
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 03:31:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E89E430038CC
	for <lists+linux-media@lfdr.de>; Mon, 29 Dec 2025 02:31:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD60121D3C5;
	Mon, 29 Dec 2025 02:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="mMxiR1+a"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A893A1E66;
	Mon, 29 Dec 2025 02:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766975495; cv=fail; b=ak9P4BlhYKrHMLxYn38zMZTk9ZK2uUNwU3NOorVn8qqk5jAWEECaIgCXIU+3eNv1fOl/QQwYoG2Nno91S43z2lZl7AsPWbi8PWceedKX2nedRujBpKIyg51u1qsKonMYConCT5NSgDPyFgUlyfDOcdCMXWHOvInVntrKzJJPk4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766975495; c=relaxed/simple;
	bh=H1/JmXTVTWLbavEZr/rm4Mi4BspPkK0Kbi6PiljHewI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AWO3blVB34NL8eNIdqI2OS79CYE/5p8h1yqmboYawIs9s2v/1sJaE5H1IoFGEND37a/bKNeREDCXYDnkcCz025aEOFB9bJBdDlF4cxp1W05zTGPH2fVBN2I/2HFtytLyN2bTy5szg0Ilg0kHNDAY8hEpPrzsTlGt3c348QJDrag=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=mMxiR1+a; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BT1t1fL151482;
	Sun, 28 Dec 2025 18:31:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=YpdQfu9aunAyCccxatGyS3NEA0bSSx+fdUDjhr+oK38=; b=
	mMxiR1+a/xwckbx1WSV5rHcbUy4wC09+lugyx/c8ebnd1J1IOjeCslgqxGVKV2b9
	Y9fYrlgZ/jdPO3IC7TD1QRLtTGoTKfyBauHG1P9dLfB/n75sxCQR8XElhuCjZ3Dh
	szDeb1NPMVbfYGgvVWdDP5Nw9SHYtlnJko3iV+qKSFStbQLX9Q/8Q0VfRjhnDw7R
	l05mkeE9uyudXQf85cffqd7WyQv7umLePHhF4Kilz50NVIhLCjyBjydu+8ir56iF
	oYh1QakfmZLvHFe1/V12+Bxc65AvCwcyxMW4EF2T03ZouClbAnrvzybDI+s1fW4R
	pifn7lxynnv/MbEE4Cr61w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010026.outbound.protection.outlook.com [52.101.46.26])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafuk901w-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 28 Dec 2025 18:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sACj2AfcBhHHi+LoaxvFCP0iDwybAcOsdoCDsKWdfg0Sf+rzfz7ti8eitS2poJRqCZpYHdxBoCTRktk8Mm1JXVsWh5VIwHmGgi6Hx4c2bXBcpDmp7//CHL2IEvhDvuyK87Y9pbxpUGt2OtaiA8SZ8CofHM3NAvN8jGYuANoHA2js1p6YnPD4bb/48ojf2sj/Gjo4M1ljwsHoVoIhvA8XZnRQfTi0PPEpUJ3I4RNqFD/UBsi1HjQfhkAVXptWAFKpcPDKZJlFV32umSBdsNOpTE2xuTYrwAJhBADS3x3TpHEy1dDBF1BROymM7foJWrFMOCJ0AZvcGHr12gr5y4LFzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YpdQfu9aunAyCccxatGyS3NEA0bSSx+fdUDjhr+oK38=;
 b=HbKADlIShIkAZ82rAV2cI2e3ePAHE3GovMBeojL7FKrho5fGThc4ECB/PfICJ53txRVuWLwoacj3VgViOLtZBzTCrNOGd6vaRzExFnzITAuerL6Qw12dFSMQfmukkG158jTF+VAdLtzfWEjt7VwD0k7V6yzmAae0JiNMAaKRr/S1z/YeksagBfAqrDTJZxxGxtnQIutm7p+xCBOUq5DJdkr3mLFxkjmpYnFuGoQcVEWFwIZ1Htb1snATMvpEExbIKnDAZhVvSFXDI2O31LzM6r+wv1JDpyNOxLLT6ysI631/VXK8vC8lyMeg/qJiGrCwjd3KlzVxF0S9AXZE9z+3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by MW4PR11MB7103.namprd11.prod.outlook.com
 (2603:10b6:303:225::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Mon, 29 Dec
 2025 02:31:11 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::56cb:3868:6b6c:193d%6]) with mapi id 15.20.9456.013; Mon, 29 Dec 2025
 02:31:10 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com,
        dave.stevenson@raspberrypi.com, jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, xiaolei.wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] media: i2c: ov5647: Switch to using the sub-device state lock
Date: Mon, 29 Dec 2025 10:30:17 +0800
Message-ID: <20251229023018.2933405-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
References: <20251229023018.2933405-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::11) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|MW4PR11MB7103:EE_
X-MS-Office365-Filtering-Correlation-Id: 9801229a-8983-4e8c-fca5-08de4682542e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?G0fAmD7QL/MmiO+TxzfVi3toYS6KP5T7C8Zkbo2xVLKLw7A35l55AgTe9nc/?=
 =?us-ascii?Q?636QDrIj1o4dxsLZLnTUVw05dPTTXYK1zfqPjx6gUAEW3Opd6yviKVdjXAgM?=
 =?us-ascii?Q?OZzIwnw1Qu0vDX2aT1pQz7mtUQMfH9sR7c57AiEuYB+Re6P1TjCuWj5LtDrP?=
 =?us-ascii?Q?6xU8bNNZ4hVOyRNxNJMfEjEYnPDq3poHpXBoWkXQOFYkG2nuwlEIzyCk/QLf?=
 =?us-ascii?Q?1ef8ZCQwPubkAnXQORra0SD3BD08BEowI1xqZfeVgTYJEBaS5DbpIeVWiGnR?=
 =?us-ascii?Q?9JM7PyNBVudTswrZIVZbe+4Mhff7sEqNl4084sKbBdRKa8P5d3ubKUXqHNbH?=
 =?us-ascii?Q?w+nir88RKPoZMxbSOGz2vCAnGZF8vNFV5hjHRU8/Bd37hJq4pjL/hMxCRVRP?=
 =?us-ascii?Q?weKhKBKTwOD8G47umnU+OU2/8Y1aw5RO7cqwuLDZzmDTgj5jnBAoyZ1/pEFd?=
 =?us-ascii?Q?+hC1o007GNRZUd66N1p9460lwUw2CCHplcfftGEfsbBB/xnDi5xcSXm7F933?=
 =?us-ascii?Q?IXqqK7DlWq9xAuXoltm/1UmDXahDW6XTi6q+18nW0QOcFFZ6AFBqCXrof7B5?=
 =?us-ascii?Q?YfpHUAvnGOYSpKB3LNq/RK8yflMgPVEG5w4HgJIynTAXTc8YFm74heau1T/S?=
 =?us-ascii?Q?FFSiH4IT9302fKJZMl0nkay5ewo6aSIzjIe3ZPtzDJFZMH0d7aDtodIcIeaD?=
 =?us-ascii?Q?VoCSngFvchAeSIoHkSEDfPqDxJk/JrMH+umaWB0T27a8VbkTjJNHhsPA+s1X?=
 =?us-ascii?Q?pzAVMHkEXBLv1csyj8MPs+SJS8ZllAoDtbNEyG9p0xXbMUAni4wtLVzyiEGL?=
 =?us-ascii?Q?fOksh9FTTcZrOdkLbMP/3E9BbwtzwqjwqN+fqaWVSdZKOWlFG39+1756+XcX?=
 =?us-ascii?Q?2yXr/PPFdvgU2f0RnwefCrGl82q6wtwt5JQZORf4q6XLTO0xdVy0zxPZq2i/?=
 =?us-ascii?Q?1LrtjsjgLeom8FmOpSc1TqBAbPRtQ3noGSX9rzYVKArSLPqzHWjYyWCZYsSI?=
 =?us-ascii?Q?W36uRQ36JL3VmOupkq8P9aln0C1KZi+MRfn8RIlcKV6p2N+cuT17zQ7lSvZe?=
 =?us-ascii?Q?VcYkpLJJy2wFCc0My+qMPrm2pomB8293Sefei4/VWcoKIRUu222MB2hcBdjZ?=
 =?us-ascii?Q?ERsxBrUVMbgDz0ctC5cs3CtLsviiYI1TgP0UpukO6ZVkcMcgUZCWjHCWdODU?=
 =?us-ascii?Q?eimslejunLLkMAhuCt5rYO2WE7aNqQJebPOEiWD931guSWRovaD0oxIsTvW9?=
 =?us-ascii?Q?g3scp4N6mdgLwv4T8qFsP4tBMMYxh5Pyad1Zoux8RpPW4Q0Mb6EkRV6JGuJn?=
 =?us-ascii?Q?hFyJxA7wBNRMXOPvpik7TNC9shMNL+49l9HqGJBRT1BAjRrhVQnvJI9YGH5K?=
 =?us-ascii?Q?xhsB9LMxkJLd4m2+XOF87AIqYU5kyeCy/TOIYoAige/W0SpNB1dWzHRxus1N?=
 =?us-ascii?Q?hn4VQnc+sI/xy3jBTdYr+CIY4rd/QsfytUMhXuDQ8f+lCGI0Y49WHWqHXprt?=
 =?us-ascii?Q?BWZBPM9mUaQOKes4imqKOp4SHZkjL4ZLeeFnxKepKYNS+vR1LeJ5DHnGig?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7tVb7Eet45/gGKw1L6gJTXY1g3yAfLsg7A85XHe2baurOZlYbggCDy4ysv8t?=
 =?us-ascii?Q?v/hKLaAbl07Y2o3VVOt3/Z8RqVheVFX8NwaijuFJwmvUBdL7JcCQhIgLT4U/?=
 =?us-ascii?Q?WVW/otSrMSXBFUserELq7YNzyyGVjFp0vK75zQZEfw+klcG7piscPC2Txb4g?=
 =?us-ascii?Q?KI2y3k1qyEHPdI/gM+ZSBOdRJQrZu7HZyGw3+ZoOZb2be8C4YYluM8oULDnn?=
 =?us-ascii?Q?+76lfQ7By652YuQAt8n43u3SYX6N361plvH0N7DYHhzzw5YBcyhHM1pWRl82?=
 =?us-ascii?Q?P5nilAubAhjlzoYoEt/o18QqhbGVjLjT1NxUQllNqqr1fHYhQGyv3MBDRFgE?=
 =?us-ascii?Q?6Ci+9+m+4bDYDtsV9FeGDFtud1y8rRjS3fGP71slDYX8X5CbiuXSGaDbUtzn?=
 =?us-ascii?Q?y7X1XPnQuFrqOfoQqiHdE6GW3gVjz4lQCmz3Hx3G5VK1Ld6zbJByEfQtgjTO?=
 =?us-ascii?Q?a+gxSgx9KpTxR7DM4ZNBMBwzh1Vb6yARtCEddv9A4zoIrkO+618FTq9ULvzz?=
 =?us-ascii?Q?xVtg4+e9TVJt48Xd6hMqhdYGGw9w+3uqS05ohwkrv044iHmIfSD2qeBEDlbt?=
 =?us-ascii?Q?j1qAWK1Dq8DiVl5LvOqPsewuq51TEN02gMZFBP/tMaIJHrNAKThJeFqzswSo?=
 =?us-ascii?Q?2pOszo0V1cCGGiEejpmGZ4s1prRRn0T1QL9j6ayPksYLjZviIXuX1rFDIAYA?=
 =?us-ascii?Q?xrmmaH36yhBjTckHLe4hCkw++CHN/55ClAINoRkNh57u2LvrKJvEa2KWSWSF?=
 =?us-ascii?Q?ubuO5aUvj4ZLz4Xvm8TTRW4RJI5D2pwAKw0jedhU07jtfl9A1kSAvkh4HSoM?=
 =?us-ascii?Q?O2TqzyMz9jPuIN5gvmJ3t6wi/5eej/2PDkknIs2RXIdmcbzXhIqad0V+ZF61?=
 =?us-ascii?Q?NBShzTMlThs5vEE13wITXOlA9MH/PbghK9BZEzF2w/9sjDsm2ltTTefX/RUe?=
 =?us-ascii?Q?wEhkX3zDKnnRZF9fmTFrSchuUSBIMGOBNr+MSDVktKRQjC7RwEqsAkkyZLen?=
 =?us-ascii?Q?h2iHFGUGPD3ZU7L8yihPPMwf3Gdx+LzeNTjDafQfmyyQNQFfXv6RL1yn8sai?=
 =?us-ascii?Q?gb8eFPpcZ14TbSkYGFGs+/YjkXuVxdiMXATgmwbLrU7fG450LSwKbrbFRBLk?=
 =?us-ascii?Q?CqYzBBpTJUm93p9QQvRMROF5JndIWJUmoxlTP782Lh9G1cmUrdVxUqwGS2zJ?=
 =?us-ascii?Q?aCrh2WMOavBLCzPA5yLbXWXpMs3cf005HLRP/zY4K1RKR0UEvvCZoyhZb6Kt?=
 =?us-ascii?Q?HuBzQuN33wAJofTv8nX0jjCpixnpnnD65IuKJiaVFPdCN3DJ9v9HNGCrw+Rt?=
 =?us-ascii?Q?Mnzv1UpwOiNc/crz1/nGVCS9VnrWj8UJH/Z7og++Vl12XoINkBA1MUyf1OOa?=
 =?us-ascii?Q?WA0ITlE32rvzNy2Bt7HQwu4vTq0muq6CN6Z7MFOg3fXpjDqQ1Or3SVlJqw66?=
 =?us-ascii?Q?WKRDYDjtBaqClqUyShk1xQ5OpUJBG5hOyL/7He6EkoIRY5CtivAsr6KM84eg?=
 =?us-ascii?Q?B7heArpM0PBT8yclKgNElwoIxkf2Wh5Xdpwl1UEIK7KSdVoXeGf6qIhZcYtv?=
 =?us-ascii?Q?4kh2IWks5OHzeojWOEyoiy0cFhTM/KL1s5KOYmWPN5fh6WeNu35aZyTcLlTc?=
 =?us-ascii?Q?SQfl35BbUiJKhEPZ0RXPtmJJ6h1eBgUfCAXjniFd7T1oIAGPMnQ50vkRDox/?=
 =?us-ascii?Q?Yi++v9syhebVwY3qWeru5VQrwYfApw+twMCconE/k6t3EeL3n+z12xZ4l1f5?=
 =?us-ascii?Q?ESY/wLtpIAGft7tn93SBZH/TqKkj6eM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9801229a-8983-4e8c-fca5-08de4682542e
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2025 02:31:10.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pSISnP/m7gIH8piqij698dYwsBJbRwHbSuLehAMsJQi0Y0sXnywphGdbyVo9N1Lls4jsBBIl7F2w3l5A84paeBct8FHkuiAS7IWin+JyWuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7103
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6951e7f0 cx=c_pps
 a=oJ9tI0XfeScUaspqi3eqJg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Lc8NSlXapXXr_nlJwJIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gJN3sX1-yyRnhdaUg4AOShu5YSj8kMcN
X-Proofpoint-ORIG-GUID: gJN3sX1-yyRnhdaUg4AOShu5YSj8kMcN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDAyMSBTYWx0ZWRfX84rLHrwztBMm
 X8wqofeVGgDKBU1EQPzclb9aaC3DtL8ZkDJJfxGP2Leuxw8DybU9FiJgmoeWGgQ2U0KAOFjKUJd
 7kP4YGgTRIcOzkL+zr/okAWnccqoa+6WDgMUS17JPD2adjTHykUfUKhVEO+GMDQuagjOTk38rWP
 mRnQJcAd4LiXg4LebR+MEfhNeXAAvyKyFa3ZFCBOXEeY8LQrPbq10QQe/e9DyQJ834NapfZBQzP
 epcR/jow+2VcK7vofY8Qw726FvKt9Wctjst/mXbXCD22SZP6Ghy9joxLiZ8h65RYpf25l1+LH/3
 ZE9jJ2JkPK9B6bNMieOmPlgbIrZGLHnT/By1n7Feb2FDIDAUieL1mHEy4M1a0+TVSQOueIjH++T
 Rlr6DlELVSDLFx2tI5FbRfQ9Lyh1fmCJ6sKge/uoh/fXNVLnFgXhV8LhOSmQPzZSc2sEX4YO293
 JdCiUiuitFH37TpdVYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_08,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290021

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/ov5647.c | 40 +++++++++++++-------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index fd69f1616794..f0ca8cc14794 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -91,7 +91,6 @@ struct ov5647 {
 	struct v4l2_subdev		sd;
 	struct regmap                   *regmap;
 	struct media_pad		pad;
-	struct mutex			lock;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
 	bool				clock_ncont;
@@ -652,7 +651,7 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 	}
 
 	/* Apply customized values from user when stream starts. */
-	ret =  __v4l2_ctrl_handler_setup(sd->ctrl_handler);
+	ret =  v4l2_ctrl_handler_setup(sd->ctrl_handler);
 	if (ret)
 		return ret;
 
@@ -807,15 +806,12 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
 static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
 
-	mutex_lock(&sensor->lock);
-
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
 		if (ret < 0)
-			goto error_unlock;
+			return ret;
 
 		ret = ov5647_stream_on(sd);
 		if (ret < 0) {
@@ -831,14 +827,10 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	mutex_unlock(&sensor->lock);
-
 	return 0;
 
 error_pm:
 	pm_runtime_put(&client->dev);
-error_unlock:
-	mutex_unlock(&sensor->lock);
 
 	return ret;
 }
@@ -886,7 +878,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	const struct v4l2_mbus_framefmt *sensor_format;
 	struct ov5647 *sensor = to_sensor(sd);
 
-	mutex_lock(&sensor->lock);
 	switch (format->which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
 		sensor_format = v4l2_subdev_state_get_format(sd_state,
@@ -898,7 +889,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	}
 
 	*fmt = *sensor_format;
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -916,7 +906,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 				      fmt->width, fmt->height);
 
 	/* Update the sensor mode and apply at it at streamon time. */
-	mutex_lock(&sensor->lock);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_state_get_format(sd_state, format->pad) = mode->format;
 	} else {
@@ -945,7 +934,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 					 exposure_def);
 	}
 	*fmt = mode->format;
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -958,10 +946,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP: {
 		struct ov5647 *sensor = to_sensor(sd);
 
-		mutex_lock(&sensor->lock);
 		sel->r = *__ov5647_get_pad_crop(sensor, sd_state, sel->pad,
 						sel->which);
-		mutex_unlock(&sensor->lock);
 
 		return 0;
 	}
@@ -1114,9 +1100,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-
-	/* v4l2_ctrl_lock() locks our own mutex */
-
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
 
@@ -1316,13 +1299,11 @@ static int ov5647_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	mutex_init(&sensor->lock);
-
 	sensor->mode = OV5647_DEFAULT_MODE;
 
 	ret = ov5647_init_controls(sensor);
 	if (ret)
-		goto mutex_destroy;
+		return ret;
 
 	sd = &sensor->sd;
 	v4l2_i2c_subdev_init(sd, client, &ov5647_subdev_ops);
@@ -1350,9 +1331,16 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto power_off;
 
+	sd->state_lock = sensor->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed to init subdev: %d", ret);
+		goto power_off;
+	}
+
 	ret = v4l2_async_register_subdev(sd);
 	if (ret < 0)
-		goto power_off;
+		goto v4l2_subdev_cleanup;
 
 	/* Enable runtime PM and turn off the device */
 	pm_runtime_set_active(dev);
@@ -1363,14 +1351,14 @@ static int ov5647_probe(struct i2c_client *client)
 
 	return 0;
 
+v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
 power_off:
 	ov5647_power_off(dev);
 entity_cleanup:
 	media_entity_cleanup(&sd->entity);
 ctrl_handler_free:
 	v4l2_ctrl_handler_free(&sensor->ctrls);
-mutex_destroy:
-	mutex_destroy(&sensor->lock);
 
 	return ret;
 }
@@ -1381,11 +1369,11 @@ static void ov5647_remove(struct i2c_client *client)
 	struct ov5647 *sensor = to_sensor(sd);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	pm_runtime_disable(&client->dev);
-	mutex_destroy(&sensor->lock);
 }
 
 static const struct dev_pm_ops ov5647_pm_ops = {
-- 
2.43.0


