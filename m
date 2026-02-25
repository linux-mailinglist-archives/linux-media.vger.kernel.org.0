Return-Path: <linux-media+bounces-53321-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDvUNH26nmnwWwQAu9opvQ
	(envelope-from <linux-media+bounces-53321-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 10:01:49 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F250E1948E3
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 10:01:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22077301D972
	for <lists+linux-media@lfdr.de>; Wed, 25 Feb 2026 08:58:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51BC932E732;
	Wed, 25 Feb 2026 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="Wh6gGzFK"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264B8332900;
	Wed, 25 Feb 2026 08:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772009860; cv=fail; b=A5wsyKUpX7WD53esINzHql+OxnLvLEoVrzWxdX04/uOWKHTQOdf09j+NZKbf8wfB3GUk3cUUbTePIi6o8XSFX1OKcNJFa3IDYCY0x8bdA7lz/4zBqXWWRKASEipBGTeB+RkaamKZGywp/L5qAuJBFjOuWsYGbyEgkzndX5ZxT4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772009860; c=relaxed/simple;
	bh=XOhgpEI9j/fvGO/IjSCLchee8LltTnTkp1GMGBdXICc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NvzSWeI7zh9KE/Yh1dOd9JyEbz7gbkzAtnccRfDyosAL1HFmUPX76hl8hDuIC4UimlFsmAuYFWdhzRW381RK+W+OfPD539RaByqP2gfh8tOWrsZJXUlTRKQz+ERw5Jf5nd6ImrV3qzOXjopF2q8WKP/ICV+EJK/GU+DS/YtnTf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=Wh6gGzFK; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P8FVXN1872206;
	Wed, 25 Feb 2026 00:56:44 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=SMm7QgC3m
	Zq9gSfEA1Ls7+QDWYuxBOJA8NlY49XkwuQ=; b=Wh6gGzFKDi/bFLfrDTbwR/ZDH
	e9PupqmD/B9J7c+pP7k7uerP+78RT8o4sPXmiTVRXs5prV6e94E6EmaF6PG9BG5z
	XMGbeV26YdldjqwufdjQZl0le1ci+8VRnR5AcHGqUcK+PhFCFWQDELulXH73aW3x
	2XgCrMeRKba1NeUbVHUnSdVHdpRC1FRNMVAWU9IFTrYnzOq+6y1OR7lfna7fLOEL
	Ts65RazlVvpHSmlN7qHA+9r1LFNBnln4JGnLeJA+FaKbsFwlYhivnCatfqoSt5aL
	M0qOtXQkTyadG5N5g/lSeyYVQrPHTUaAcHIfEgoIXePH/dmgZmbmKfygthc6w==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013027.outbound.protection.outlook.com [40.93.201.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cfd3k4b4u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 25 Feb 2026 00:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcIRcMJ9H6iqoRmZqL25LHJ5JZwLfSEn605ptNSOotJEISVzPGARbdbRGcj0KDCeyh28srbh0odRS/smbAtShSmUzLY31FOLTBwdsNUoVAnzY3wsuTsaoBe6M6m8gbOsOOtX5XQaiz+vj3B58slwRgt2gmhhxPAw51+qIR+DwO9uDMSusZc8pvTXl75LpgJVjNHff30QTRBxy5EUxiCd2lo7LzzOL78PJVi5uAox5IM1GLxRVo5TWNevrlN/K2Q+Ktt5StXaSFbN9DIjUoIKrMv6YAxRyHK+zIyOKlJNDsEfkJ+v20U1tO3M2DiCwiQTt4uoI3kiF2k55d6w32izQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMm7QgC3mZq9gSfEA1Ls7+QDWYuxBOJA8NlY49XkwuQ=;
 b=jZsZdi8e5dh1JevwGRgx7ZIJWnrAkCLjiqi1Ar2n0kf11X5607hoKwmrfaOS0c0gRNVHkWyubGXF0pH1HgLKnOd85fxgV0zT1miFtSMm952wKfacEwyT3/PcJarMsDSe35G4ViNSK9gZsC4eha+QRbUwc1k086wg59cjUbGSSvI8xa1bLqRdX3Ktp7UWVkRMBc4qRCg0T3zl9XcCM9v+JZgAy8KnpYLbi9bZUMFryxnVDIIYewZvvMpXMsMipjgvQz+jW6DgyWF/7rcg0DKitQtccYthgMA38tpvQhIuSQHOZCAM5CeHNghOnIeJ3wlGzyImoaFUf9hgcWlFRtfVNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by DM4PR11MB6213.namprd11.prod.outlook.com
 (2603:10b6:8:ae::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Wed, 25 Feb
 2026 08:56:42 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b21:f3ac:a1f9:6965]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::4b21:f3ac:a1f9:6965%4]) with mapi id 15.20.9611.013; Wed, 25 Feb 2026
 08:56:42 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: ov5647: Fix runtime PM refcount leak in s_ctrl
Date: Wed, 25 Feb 2026 16:56:21 +0800
Message-ID: <20260225085621.1756643-1-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|DM4PR11MB6213:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b2a5d3-01cf-4c94-1fbe-08de744bcb76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	hGrChVZO4kgxqTsOsDbdJVaXyndS1glyPjqejP3LkNQB37DgP7Dz9tuHnpyuaVLQJC23I2vQ3MwNXJ9AzqT5PpmAeRGT2xc59RRiuJm8Awn9H6admSVoX4hER5oX0A8MkS42n02q9ulQ1T2Z6DF4d5tJtuR6RbjhsLDa1zrPZ4o0V3NiZavbhTIj5v6S8a90n8rHF+JDIjz8MC1+WTI0JR6XDj+AAOuZVg5QhoYasFurfeaiix9oJ8wx8XhzWfJlTe/meP9N4Nhd+acnBOirkYAf47MrcO0YMqtlk9BNa+69A72cN1W3Gbuh+BpoxP1TiNEgbz6ibx57XCdLYAHGliTjDPFAnYTLtjL2vMHuHpE0ZM/KwhPh8rW8cbsNS/CJWQuSz/fsASzWfeBSOy1cjqPtBv8z8MaWkBDn+ytirmB3/wd2YEFsoZ06eabqxHntlVdkIOI7/1xDLVKrxYXPGt1XILNVeTfMdRcqtmHENSvUp755ut/56YIMQhmtcv+yu2oEdkPlSKZLJviDvGN7JzEmBI3Wys57dKQ3bH0C+myz5J4Ufh28jYgO14Xyk+A3b7eGOiea31lAvNRgr+sMpttT7RMlvD2ESu/XQMKBAGoAVo7LyORFXoslNNUdeiDSa22n4UW5UUiProvFOsT9uVqzgSS5nAHT6yh9nvAxg8wX1rFQVnGo7n+8sRNXkHUbiZMaQ5QpnIrrN7Y8h2niMh6+8/opOkzYS+9DOEyocFYeljTfhlWH0YTT3ayXJ2g/07UT/TsrHgQf/nN+KN3BeYwgQqRP+a6lh2dh1fOByA8pLV1eHdJrYIMdKr6Mv5KK
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xohMwS8YZTGklxxM7J+DqhFTjTgc665EUxfnWH56FCv2MnSMhvlylnXepdQY?=
 =?us-ascii?Q?qcEoW2jz6vK3SaBtjE7bhunkxOZz5HBwr3uC4HMO6a+RUmbsxq39YU9ZitbR?=
 =?us-ascii?Q?OOMdKTdwiIHt/2VYS6iKTUAEcBjn7A3JEGIXmJGZ0Ce/dIGcHEpFi3fyF0et?=
 =?us-ascii?Q?JKZHxvvh4TFlAcfDceJEFv78QLfYPi3abYDERb6m9fFsyQHSTT8k57TUGO1+?=
 =?us-ascii?Q?WxlSwjzs6OHTxfXerj8ZN1/q/qAmxO3c30+Uc5lc1zUyWEEfj/EgEhtciGuH?=
 =?us-ascii?Q?CE971rzVTx7ABG2x19aIAKFM9W20VZI1Mw6VTarMKK+zPm+wZ/qTau8KhqXx?=
 =?us-ascii?Q?7BYzpQdrtwaVOGPJjrW9TM1aBOpCvHN4qn3Wrvzr5+YaL+GK3qjjdlYvwwjB?=
 =?us-ascii?Q?7gOvAzloSrOoL0B/1DbRhgLBp5cBWJR1sbVbNXSusV6LyYEbeE7VVZO/fwcD?=
 =?us-ascii?Q?P80jDMK+oifQdEjBEhZvhCIRtmwpa2B8dlxfCJ/SlbMXZdBCouMO64mqLnQx?=
 =?us-ascii?Q?wgNlvrmYq0NhaLvLHK/6YSTpCdBMuF3COmufZ1/b0CZD4uLRvFWyL30ueTKy?=
 =?us-ascii?Q?q/tinXW6hohBCjKAHaTNnQpmx2XY66XQS5lohrgRtrB0pdF9vkZ0fMC7gv85?=
 =?us-ascii?Q?dL9kCLgXB7wMhowbRfLOfyIzdn8EygrJyeeehXwG/KgB7Bl31VIkg0RLSc6g?=
 =?us-ascii?Q?B5YT3n2rUHEe98ELn3nJ11Smmygy35FmNIsAC8vABfwqAmC5YIXi31PHXw4O?=
 =?us-ascii?Q?6If/1QOpUPELQtfDeV+cR3WRDVpVbMzkd6JKYvoX9Okj06uqhsyiNTj+/rrE?=
 =?us-ascii?Q?4ZTR7fc6DUZOXjFUzgSvuLnu2U182qpfaGKtDSNRdaAaqx5LNGV38LVxjTJu?=
 =?us-ascii?Q?J68C5m23gzcdpSeOpVcWgCZEbkG7V3qxZeCptfpvwwStTkQdnndIhuht8Cxv?=
 =?us-ascii?Q?VNc2F3HsdXDk5zbP1Yp34Zm49mAcfjvZJwpOXHjVsjMjevZgV7ze7FB7jsDh?=
 =?us-ascii?Q?FiNVC5JD8EPVSJskTdxsZz05YoLtMLJUzxU7AJeL4o9610MFBw2g3TZRKMmx?=
 =?us-ascii?Q?QHB8p4VA4jUV59QaDIkyyfOlTGp18mLA+bEX7ApgVlNk+sPBZaTM8tBZh03c?=
 =?us-ascii?Q?2JQLBI6n2o78yyataD3vqXZm2pYF+QwcrKePXXLOs9Iq2D4xgYMdBWgwH0+Q?=
 =?us-ascii?Q?BVX36xr0vX88hW0RbyBCNpc0w7ouA3L6/XcXvl0kgXzlGfIzX6v1JgpF+YYK?=
 =?us-ascii?Q?B5FaF8jVujqNbOf5pDbcmtYgYQw1QtCkETp74uLgelvJYEYlRLXCJl5+odVz?=
 =?us-ascii?Q?QUZYaemE0dEYXhGRhwpxTWYKBAHos7FWgn8SVdN5FsCM2QgKsTJs9+6SXoVZ?=
 =?us-ascii?Q?Kh6Gf7OHXcrijGdqmVVO67gIGvziTViv54ajZ3dfLGJFzbmCYkbW5uvL4FWR?=
 =?us-ascii?Q?W1tZSHXmJ9M3TkPICXVPdo8ZhfQfStO0rkXUaXBjCVCQemYnnnRr+JTAHOu3?=
 =?us-ascii?Q?bWy6HVBa7M1rElrulJsnC9tCK+OVqReZrC6+yCztnT6XY9gKgPvRePfZ5d4R?=
 =?us-ascii?Q?gdYmyX92K572REyOhZk/ptuAPY9STtFlNXiiiYlDoKtsnVQFphrlSbh0aewI?=
 =?us-ascii?Q?YXj6zzwkIkQAuJuFB42YHTEmDXRP7rmdIYpbGeO6CnZR3SLEGbf9XJuAjE4w?=
 =?us-ascii?Q?wXu161sIUDUCtIkgsm2WcF+wjh04pDiQhlnvGpvSF+nFFoSkzunZ2xOa7bY3?=
 =?us-ascii?Q?6CV/KrxOe1T2dkwkjvkiBsiewCMJcig=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b2a5d3-01cf-4c94-1fbe-08de744bcb76
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 08:56:41.9880
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y/XPITA8FkjUPBLK3VQ0vg/aKWv1PaV8dgc0gRVirlMc2e0byQ8qv19AOL4iVjMCqDlW4mFBDwzbYjOk0XRLs43PstM85NJSLkA69LBN6Nc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6213
X-Proofpoint-GUID: szk43wZ92kTVv_r-_DyARJSNpf_iaBdj
X-Authority-Analysis: v=2.4 cv=Bo2QAIX5 c=1 sm=1 tr=0 ts=699eb94c cx=c_pps
 a=WwHAhc24fKszT02xmrP0gg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=4uR0G3v9NBxWH19R9ToA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: szk43wZ92kTVv_r-_DyARJSNpf_iaBdj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA4NiBTYWx0ZWRfX0Xtxronh0xaD
 HbusMK5izY7GFddEYQoVrfrlot/WsJoAZDgjxqDB6x5xAe6ufs6xNzBWboCgREt4tvbmg95Nxwb
 KSJoleivhG7cUfLHva7qFMSb9S+c7/RnIeZK8BUd0CzEG73OkyigpjUTPEU4wlYUwxcfe+21RQi
 iZh11uGdmk7C+F42vI3KYAoRuNIGa5PAnOZH1lGbrZfV9UmYqtuZ9NbPf6Tk7Qijqlwi+uzVMu4
 ybFrLylKmdPVksBqczJh/XIcG65euBg5t+TK4eLlwPUrCHqX1TfDMSMgWL/bcWGZUKdr2SSt61W
 FU17jLphPQzRBFDU8g1vr16lSGNsj7C2xQ67juEQNFgMaZJfWr3SKG3x/mNVM6c1VbXjl/8Vp6S
 oOFM19EyVwy6rkGrBYO0+EzHJH115R0bCVORfZcf1qPCaYjS+ehMfcbWu/sTAnuwR4dN3bxbxIp
 udbMm07I8jrbFNz90Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250086
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[linux.intel.com,siliconsignals.io,ideasonboard.com,raspberrypi.com,jmondi.org,kernel.org,bp.renesas.com,oss.qualcomm.com,xs4all.nl,windriver.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[windriver.com:query timed out];
	TAGGED_FROM(0.00)[bounces-53321-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	PRECEDENCE_BULK(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	RCVD_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	NEURAL_HAM(-0.00)[-0.999];
	RSPAMD_EMAILBL_FAIL(0.00)[xiaolei.wang.windriver.com:query timed out];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F250E1948E3
X-Rspamd-Action: no action

Three control cases (AUTOGAIN, EXPOSURE_AUTO, ANALOGUE_GAIN) directly
return without calling pm_runtime_put(), causing runtime PM reference
count leaks.

Change these cases from 'return' to 'ret = ... break' pattern to ensure
pm_runtime_put() is always called before function exit.

Fixes: 4f66f36388d5 ("media: i2c: ov5647: Convert to CCI register access helpers")
Cc: stable@vger.kernel.org
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/i2c/ov5647.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 6a46ef7233ac..db9bd2892140 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -967,21 +967,21 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 		break;
 	case V4L2_CID_AUTOGAIN:
 		/* Non-zero turns on AGC by clearing bit 1.*/
-		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
-				       ctrl->val ? 0 : BIT(1), NULL);
+		ret = cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
+				      ctrl->val ? 0 : BIT(1), NULL);
 		break;
 	case V4L2_CID_EXPOSURE_AUTO:
 		/*
 		 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
 		 * clearing bit 0.
 		 */
-		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(0),
-				       ctrl->val == V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);
+		ret = cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(0),
+				      ctrl->val == V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
 		/* 10 bits of gain, 2 in the high register. */
-		return cci_write(sensor->regmap, OV5647_REG_GAIN,
-				 ctrl->val & 0x3ff, NULL);
+		ret = cci_write(sensor->regmap, OV5647_REG_GAIN,
+				ctrl->val & 0x3ff, NULL);
 		break;
 	case V4L2_CID_EXPOSURE:
 		/*
-- 
2.43.0


