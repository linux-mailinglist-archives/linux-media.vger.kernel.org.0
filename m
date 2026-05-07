Return-Path: <linux-media+bounces-60707-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAdyILoR/GkjLAAAu9opvQ
	(envelope-from <linux-media+bounces-60707-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:14:50 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 801AE4E2D19
	for <lists+linux-media@lfdr.de>; Thu, 07 May 2026 06:14:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BA052300FCC6
	for <lists+linux-media@lfdr.de>; Thu,  7 May 2026 04:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C3B325483;
	Thu,  7 May 2026 04:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="h5GZ8qJR"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 607B1321F5F;
	Thu,  7 May 2026 04:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778127264; cv=fail; b=ny+Uy0mwqf4rUcTDsTKV3YI08PRyO915HZtnM3/ycdQ1uP3q00Ed2MvqtKx0fuQrs2Kr3E1jmtoPuqNaRM5X7k/Hzx3yIr3kVZjA7xRFvSl5pdoNWJ9aPwbKPnwzjhHa2qyXWkXZDTH+4k1Bw8Jk0WWK5fw/uy/qTT43GbFRhnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778127264; c=relaxed/simple;
	bh=D9/baKfEzjQDgmtIVyXynABPEFtLWM2uhtlluvSHY+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RtoZVja0tJqhAIinZ6V0kpKIptHrg7KKVtWDV8t7DihU2vsVmM0exUwtK6kqE5z33+O4rqJAV0uwsl15fjbYXeuIJshIusCB0DYj80O6PkxpNby8IaPfybwNKI3HUlJtZ/PAHVY8QNxV/KCry/mZGbJiMJa3qiwqQrzGMy5+iw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=h5GZ8qJR; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6473o1wn3113943;
	Wed, 6 May 2026 21:13:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=zHCqU9lGXmJhTN+4BDxwVYKM+DTTXM3yH+nO+rgXKPM=; b=
	h5GZ8qJRCGQ/1lCHmgc9yu6B2Re9bEIqm3Ie+f1moODg5i7QmiNgcoMG6wgL+0dv
	z5iv8poIXHlLplPZwCzypiYEB312LQkR9Q/xIIe5jCFpjzNfx8hrFJ1QXJgynDXf
	VQPVGdjKJ8eqRnREMCNok/mP3A2Flm0GrRNjVqWl6NQii/HWYf9Kh80RN07TTvBR
	cTF69Ua/222KoXQ+/zX9o20rbdpTq3tw5Ou6O2HlRUhu701DPj8OLsyBKu9ho11Z
	PG+P9NOHCgn5JqSj2mMd70v4QLaM8vlH+ECTglyG+XXa3/0lbQOSfVB5FhkHY78m
	IjAgYAsSJ+yHoMubMN4v9Q==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012055.outbound.protection.outlook.com [52.101.53.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchywts0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 06 May 2026 21:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tc8j+U7VBknxycTSe3VmvdVFrRPmip2k7y2bTqr4pxt1sqXIxdwDeZ+3E46bT5N27kcMGDopoIRH1Hl2ql8VAFZGlHv7fqvxadKBGdju1hMTc3cuvwrMnbislYZMaPlwxmTSMu+RU/9w1+Ug+/maFN1Q1yjqPPSMaEoay1ozytDsCRK8QzzfhCy/jrA9zIBWyeqdFQC/VJvtS0JB1qmiJOCdk9TfwjG2fdKaxXuxsGDohIntkEH73ns8hoGfE8963eBsrXZMfJ/Sn+NWS/WO4oprMkCkvMi4qgo/U27PxVNG5WgbgJQmISN37PmyTTu00oyPAv8VwQ9CBz3wEnu7/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHCqU9lGXmJhTN+4BDxwVYKM+DTTXM3yH+nO+rgXKPM=;
 b=cbWluVb4bO4qicbvqeXwP9Vravfi0R4rPeQbYh49yHFiRnGsvID4GdGIjKZuddmqgkzF4DiqdNFkbGnOZDhsqjm5ut7v9p2siEdS/3lkNKc8ATZpfjeBhDPOc/Lp4XNyNmO+SUzSqyZ4Gdtsejmgx+4yiBWGJh1A0lUVm7Bddino8PSxeIDXzaP62SQ3n868XKwBh+ihffQBuKMAPVqZk98r8kz9tPg63LnK6QYgrF/76WSg2Wkivmi0/+B/99JnM5O3ocnV+8PeofBLqDqxY2B/K2RBzwFCkZMZICOy49RhY88OeHAoipuE8QM8VtFIy14vJ5YGe/7u/lMwsEnqpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB7017.namprd11.prod.outlook.com (2603:10b6:806:2ac::17)
 by SA0PR11MB7159.namprd11.prod.outlook.com (2603:10b6:806:24b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Thu, 7 May
 2026 04:13:57 +0000
Received: from SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8]) by SN7PR11MB7017.namprd11.prod.outlook.com
 ([fe80::44b9:5767:8577:dee8%6]) with mapi id 15.20.9891.015; Thu, 7 May 2026
 04:13:57 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: laurent.pinchart@ideasonboard.com, mchehab@kernel.org, Frank.li@nxp.com,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        aisheng.dong@nxp.com, jacopo@jmondi.org, guoniu.zhou@nxp.com,
        s.riedmueller@phytec.de, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: [PATCH v3 3/4] media: nxp: imx8-isi: Fix missing v4l2_subdev_cleanup() in pipe init error path
Date: Thu,  7 May 2026 12:13:17 +0800
Message-ID: <20260507041318.491594-4-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507041318.491594-1-xiaolei.wang@windriver.com>
References: <20260507041318.491594-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0026.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::10) To SN7PR11MB7017.namprd11.prod.outlook.com
 (2603:10b6:806:2ac::17)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7017:EE_|SA0PR11MB7159:EE_
X-MS-Office365-Filtering-Correlation-Id: 73681704-7f3e-4a80-8b4f-08deabef0ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|56012099003|38350700014|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YqeROmrXMGlkTWtfOtH/DRteBTuVdh0gH/Q4jFs/9oe+wnQULJn5F8YXauRyKsm2eNVTN5+PB6e+TZlky1YGsIUtvQh45RuZa2wb5C6mcH8FrmniQHSbd/Pxjnirx5CLyV4BioT0iNVGWhGzdp9kNCpFbgtzaJbNvDUeusZW4N5Mp+COMtZItw8NSEQpbPIQDKz2vxYy+/51UglWuE0+cvL20sSJNvI+StTi/g/tXd+Z2H4pd2VmEfIt/UdVDNfuH7yrtI0CEVQohydVVLZMkXxlBn/rzZPm6b0HxgawztDGaXaBtWVcUaFbqxzBiZF+tQsJtrD09JW2OAXI86rjoVW9otYSbIucxLL4RnJdgwzyDdhLg7GxZSPQlt9uxofbM7hQV2VhFggNzKRmgKuhnVeqRgWTk9FHAvh/2wMmolQBKNYrB21GyebyJTVf0q2qtDh4fkm652pzK79LuhUJ6RkF5ft6iWxM16Pt9kjix62sfX6ppMB83XGCv9kuPr0OUY2BV/6N+ujVvUldW2cboEgdOEsucgxdBka/BP0vcD9+9zY4R6q+0cFe8jqIsp1GwHxr3EOpNWXR5nZeSkq347KtVvf5B/5u0OccQJ1lUbdOfRsK03GIeeu93y/LWzRT2CN/OzrUxO6gmBrLcnpRjwMlyP5w2OntowOOwwVhK05lUaRbKkYbqLg5dUdifqWN9S1vSg+2qjqPx/JA+MRGtcnkXltjh+zpXq/P6LHn55o+ip3ixf5q7FtlAQohgMZVD8A3PhzLIxBLR9LtCSUWvQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7017.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(56012099003)(38350700014)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ASVPRWc4MXonwCxD2sCNK7ZSwS0Dme/kGzV/x1Q8osD7Yz2Wn3aiH1t6NE2?=
 =?us-ascii?Q?h521Q70/LAVEdoc7c1C9ARZnFW5SeVvkA1gx1edmdw4478Kfist8bCt+OFM+?=
 =?us-ascii?Q?uyD4DeCgpUkBR0yEYZx35IZWMGTRrgpq0DRcbYpOFPjp3hbSZWJ7ihCH1pAK?=
 =?us-ascii?Q?aF3RKykPS75HLov79AG0LkczBTMJxQhwz9c9oaNi7APR5DL0qbwD8u1zeoHs?=
 =?us-ascii?Q?fXsqnRSMUDJIHN2dMceN//kV+JimLAOdwBzyWfqpLskZ8aB2DCmI+kRD+XJw?=
 =?us-ascii?Q?flPKJsDrqNkY8n3Ji3hvmt4qgiUdSVDBnQU2It/6x1/Bm96lMXFCPn8fD1XR?=
 =?us-ascii?Q?EJYVR9FDi9rC2e5lxzAnGgVSjHbhap7IXV35ViJA7zI7Qv+Y8524P2qOLhBa?=
 =?us-ascii?Q?wIonZz2vqh8stDcBVACU2mHHxuMVZtdUfhgwxaDgUs1VIJSb5EplTyPzM2g9?=
 =?us-ascii?Q?gtubNWWpAXLCkYiLn3tEqqA/w6YaTg1W7Xtx1bfkY8QlsyjrO5Cn1rHnR0Lo?=
 =?us-ascii?Q?NpAcOQWds1gxaqXCembt+qDeT/FTvrQ9qmH7qJ6TQp0HObEo7G212gJv4V8C?=
 =?us-ascii?Q?Kidfylzw0w1GQ7GLZRUAbvd0Ry+YsQ2sBBcnUCRvq5oxlaaH1T50TSAgfUP1?=
 =?us-ascii?Q?xSeGlzS3KZHUAHo1D/1dQJeshkzwKk7/7G1uMqDx0u6OpoU4XFdpUwiOTot+?=
 =?us-ascii?Q?OpVOe9whrZmTgF9VxQAWS4dybxn6p7ih53q/rNjeQkJiQQhYihnrt6bX1xAj?=
 =?us-ascii?Q?rl7ls4rBSu7POnMpaPnjUIG1uOAa3IdhNCIVJBfwlHiKnMJ7OwsZXt3PviIN?=
 =?us-ascii?Q?wcZ7NklkhZ3MpE+YWHytu/WQTQuiOXkACekpB0kb0/kt7I1yJMwj3j7xZt2W?=
 =?us-ascii?Q?InEgxHRBa2SrntWzGCL6kYiywmDtWbq/0KXuJbcLgU/Up2iQKUancJi6n0cE?=
 =?us-ascii?Q?WERxjX7dZuCSY73ugNhzba9dTvVvKwyne/xC/CQcxmmRRCZYlf6nWQ0aLj6n?=
 =?us-ascii?Q?RXWIYcfRfcntscaMW12ozHYDNZPkgPV19Zc8hWBREtXZMdxUkCJogCXzB1td?=
 =?us-ascii?Q?JdJBMFv9XX1JAIPX5LIGcyBQhYWUSHjMSz9ojS5T8JgHFpZYnIsoCovg8IMt?=
 =?us-ascii?Q?iQZ2cUseNT4SQ753GcIUinpfAR8Jb86kDacNxCYTaQ86TKYCETZ6GGwd7AP6?=
 =?us-ascii?Q?ugk8K4ugrQ58vbu4H2I3ZgARrqrFwwvRYBtiTNGNDv0zIynrPncbFv6/2awE?=
 =?us-ascii?Q?Kq7wK4uOEkWbD0YjrKZshyr40sWN0DYs+m7dC+q2gVnU4STOUzY6OAkW7V+C?=
 =?us-ascii?Q?QMa+zV+8YfeQoLYUs2ACuCfGWpiQaZhROdR9mXNoDXC0oPCuxVAuqOoKuCrz?=
 =?us-ascii?Q?AYNVbLchXoaUvZiW0vhElhe4BiR1UVOvQM2TSD7/CHNlN8kw2g/kGc9mp0KE?=
 =?us-ascii?Q?Ym0UGC6Hma7qJNeB778wh6Le52G5HjGYPz8BfKj8zMaSAydWf48p9yVfzN7W?=
 =?us-ascii?Q?8gF8aWO+c6MlUnHBlVJsHOubx1daRFn6BmxT4d9zXVALa+/I3drR1gcMF5+3?=
 =?us-ascii?Q?Ncs4yWoe5pbr5Ml/Rs7suT+PFS9WS8HHFcwpdBn4ALEiSxs+227N5ZgWB2K6?=
 =?us-ascii?Q?z5Fj8CfJGBvdu4+1eAm6ui3P56cVda8WkK05P0bBy7m2I88x+z9t8GqxnRBh?=
 =?us-ascii?Q?uiQ3NR/LvHZehD4+N9Oephv+EH+Z1LoCzyjO4lErpGgoV/8PG37BroKm5TNQ?=
 =?us-ascii?Q?s4vaKkGTCIJhq1RomjpJCQbDKBGOso8=3D?=
X-Exchange-RoutingPolicyChecked:
	bNuBun42r+WvtwSH8/VTM3Lkp48O74DRauvrcmP0dfgz+h16siMOew2Axdosc2B09KACzrU4XsISj0UOG/A9kSZDAANT/JEVMkGZq1+N2IQYyT2NF12QnbbKTOkgGvTlwV2rYIyu4JPq3H8RV0l3GwHozUXRU49fVg3rNUTEauZXllkOipTKrzlWve7i9N1GZR3rhfSL/zpQBzQwNnfd+i2cyv+TLbJaFKkSXSDvccn8x0i2NcW9I+VbFRvRknYJuxCjV24v0qmesnvQoKb1ngaRSHdy1HEg0T8cfszKf1z+sri/EHdt5vdFE7INk0fG3k3CIy4IRuxbLM+u3FMw/Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73681704-7f3e-4a80-8b4f-08deabef0ed5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7017.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 04:13:56.9475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F1SR/yUd8oj8ExkoqV2CfHH/yczwxf1mXbb0TrrBWtE4XaQp1MrGA4dKfiLRDXIh0QJbLPX50YCnJjNm7rDahRabgV/8iunB3SmHPoI79OE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB7159
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDAzOCBTYWx0ZWRfX5en2IKLStyDX
 XVSdRgoZHUBwql2KbnW7np3TqUmvH9HQS1pP2k3gnfu/gDStYrUrvbWOERgYZzh6nyZcithuZnP
 wiO6GQTKztyZoxs1UeK2IFmEu5cHZ4qk/vvtT4HoKQ9JzjPpPFVuQgrM+xogTgHQv+tFLRR4+Vs
 HSWlV24EzQn1BymbEkMNhcY3ZBpQquyBe+Oy8INcu2EXoDLj3jj9cXM2wiJ8UQXUnQEeaXDegt0
 1bVUCzGFz1sdQ6YAwR6+Ngq4VAhqW39qfHnWlCntgqottYfufc4tNL3Mp7Twk+X3T4A5HZAZokj
 rkGH/PIXQz2TwoCo57FQZHIvJ5HYNqNoWdU0ymO8OGCBqapmFb59v62aEDsCIRcdaoCkatQzEz5
 Ch20uqTb2LNohbDlq6e9UhDPRWVM6bfHxYbK0VTUCY+FfEYk0EjaFQusfkQ4abzMuIsJfR5c27W
 jh7tcyQKikp/WdWohNg==
X-Proofpoint-ORIG-GUID: BXRJOqI2cMGrUxyoEfzKqExELhLoF6Sh
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69fc1187 cx=c_pps
 a=ffjDj9JMBHEDizK9ymob3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=CGEsPDFH1TKow_CSP9sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: BXRJOqI2cMGrUxyoEfzKqExELhLoF6Sh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-06_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070038
X-Rspamd-Queue-Id: 801AE4E2D19
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[windriver.com,reject];
	R_DKIM_ALLOW(-0.20)[windriver.com:s=PPS06212021];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,nxp.com,pengutronix.de,gmail.com,jmondi.org,phytec.de,windriver.com];
	TAGGED_FROM(0.00)[bounces-60707-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xiaolei.wang@windriver.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[windriver.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

After v4l2_subdev_init_finalize() succeeds in mxc_isi_pipe_init(), if
platform_get_irq() or devm_request_irq() fails, the error path jumps to
a label that only calls media_entity_cleanup() and mutex_destroy(),
missing the v4l2_subdev_cleanup() call needed to free the subdev active
state allocated by v4l2_subdev_init_finalize().

Add an error_subdev label that calls v4l2_subdev_cleanup() before
falling through to the existing error cleanup.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
---
 drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index cb50af2270f6..a59b9456b590 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -796,18 +796,20 @@ int mxc_isi_pipe_init(struct mxc_isi_dev *isi, unsigned int id)
 	irq = platform_get_irq(to_platform_device(isi->dev), id);
 	if (irq < 0) {
 		ret = irq;
-		goto error;
+		goto error_subdev;
 	}
 
 	ret = devm_request_irq(isi->dev, irq, mxc_isi_pipe_irq_handler,
 			       0, dev_name(isi->dev), pipe);
 	if (ret < 0) {
 		dev_err(isi->dev, "failed to request IRQ (%d)\n", ret);
-		goto error;
+		goto error_subdev;
 	}
 
 	return 0;
 
+error_subdev:
+	v4l2_subdev_cleanup(sd);
 error:
 	media_entity_cleanup(&sd->entity);
 	mutex_destroy(&pipe->lock);
-- 
2.43.0


