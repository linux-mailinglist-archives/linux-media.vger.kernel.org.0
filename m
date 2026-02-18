Return-Path: <linux-media+bounces-53041-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKX9IcublWmsSgIAu9opvQ
	(envelope-from <linux-media+bounces-53041-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:00:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B4155BC6
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 12:00:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E143B30421E1
	for <lists+linux-media@lfdr.de>; Wed, 18 Feb 2026 10:59:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB2573033EC;
	Wed, 18 Feb 2026 10:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b="DhhrOdGh"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023107.outbound.protection.outlook.com [40.107.159.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B462FFFB7
	for <linux-media@vger.kernel.org>; Wed, 18 Feb 2026 10:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412383; cv=fail; b=Rc82r7Vy37tBPpRsp7pSJVwokPMiCn4zr6N3tJZsgRQRtc3JLkbwlt/MC0IHbUoRqEnHWNW+0IvShl1qnVnRT3Ut1EgXeXBjQmqNYukpuEr1S74SAOn54YCVAW8TjWC+ac7k62SaxA/kB6DDcuLq1/UVdvlfiz47mfShHTRi2X8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412383; c=relaxed/simple;
	bh=B4v2LenIpr7GnlwZ9h/ucbET2D0Kno2FKH2znWfIOx0=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=m3Lq00qo5V7PtPDCmFGmwHTX3uZfncBHfQrge0ropxh3TJ1FJdEP9R/tWdqvpb6cIduKtKtb5Kcjm/bG60GpRKI/g51bIxPjaDt/YAarPkHqSYl0ytZM5dXMYA3+i40poL8VPgOYI6loyl3o4tVgpt7+5bsN6KTl+wf9Ro/29+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai; spf=pass smtp.mailfrom=q.ai; dkim=pass (2048-bit key) header.d=q.ai header.i=@q.ai header.b=DhhrOdGh; arc=fail smtp.client-ip=40.107.159.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=q.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=q.ai
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=usLi7HP+0sugySj/Scp5Ck3WoU5WPZnwHzX5tIBraSXt75PEG755LgG+q9ILIN18pkLFQO9iKf4JgQcsJOZVp9yN37K52IYRiOjU3hfHPUwAepOC9VcebPV/xhyM5QIagCFN/VPLWwTWG0kg2xFRke37ZvwOJMygVvWDAMSe0Kf/ia+VfoRHIvemUmvrTSTZFOadh3ojIOyKtXUkM1L2haCbMMY3JLLC3eA/6aoi5G1zJcGmOLOz5Dd9CCXVspN/yV72lDEvfkWzpOI1QSWoLokEQ2YOamTaR293O59fqiMqVwT5weybgDHoJFXfdD2ti5w/HHa2TqGQYGTh5NWcbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4v2LenIpr7GnlwZ9h/ucbET2D0Kno2FKH2znWfIOx0=;
 b=qWTR86+U34hr44IiaCm8FCw7i7tRevXhaTiTRdidl/56U4004/D6c8V9K6cYgpgYBvndH5klcJ7GpDnEG6jx/ni8FHHgRmG2ygjMke5FBfSAYP+jMDhRPxzJdrikBe6gdGUAPETzGPBmQG0FLVXrF+mxTtKsBxj8fHGDxLCQ4MbByat07n09PkZGPFlfhgTKIFA9YsRgm6LNc4feactKz83Wct2lMaURtE0W34uPSA9fDfy7BDdwFhU1Vqxrbzcjrx2bHh1AcRMfnaQpJ2LrKZAbHg52ApFJpttadDJr+1o4+vvEKWJA/6fn12qobOn/rDc/5Qu8mXimu4yepPwb0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=q.ai; dmarc=pass action=none header.from=q.ai; dkim=pass
 header.d=q.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=q.ai; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4v2LenIpr7GnlwZ9h/ucbET2D0Kno2FKH2znWfIOx0=;
 b=DhhrOdGh5yKf2lUT1Bdg8W94lBUOvbj03N2/01ehA7RpYyohTPcMY42e40stz4M66IL+sybnfsUIjqT0XCFTPYp5SuRsZS/pjS1ncKoS9v3tsCVRWBMuFC6q0CvbKIAm/RvinY7PqfxtRxfUIGBNXlPJwWOJxtNNp7EQV963I/bEiGqfCKsXHeN1PnW8782OWrZIzLzmxw4QW/UXa/Gxw7uRTKT8GINv1SsDSrCFuagItN6lcssIERlmkVv/oMIfUu5jBEWJ1oTLA3kmyCJQYIu4Xl6+2x7EXaEPoEFEZBQmpw4pbjFzcNaXpsyuKRfgApy2CagGeqHid2/NdKuCMQ==
Received: from AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6a8::23)
 by GV1PR10MB8636.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1ca::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Wed, 18 Feb
 2026 10:59:37 +0000
Received: from AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b928:6ac:a43f:e736]) by AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b928:6ac:a43f:e736%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 10:59:37 +0000
From: Itay Perl <itay.perl@q.ai>
To: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Itay Chamiel <itay.chamiel@q.ai>, "ribalda@chromium.org"
	<ribalda@chromium.org>
Subject: uvcvideo regression: loss of access to full UVC payload header for
 generic UVC devices since 6.17
Thread-Topic: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
Thread-Index: AQHcoMQ56VCXsngA4UKzyfhKPmFOcg==
Date: Wed, 18 Feb 2026 10:59:37 +0000
Message-ID:
 <AMBPR10MB9376E972B02F45815C729C318D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=q.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AMBPR10MB9376:EE_|GV1PR10MB8636:EE_
x-ms-office365-filtering-correlation-id: 3a1efefe-868b-4155-bf7a-08de6edccef9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?6Wi0aA3zgTBS7T1aJyvG9bz5T97wTtQJphBQiFd8tqYVPjW2C/h3QeldS1?=
 =?iso-8859-1?Q?62PUsK7sjT0uvPzTKJPymg3fnqzRKiIduMXsRqPUPts7uQYkfvwz97D3bN?=
 =?iso-8859-1?Q?lop959vFLF5bBNd9Ho9B9esd++l2eQCeBK6Q2ON1RAIrAW+3PYuDwDPOFe?=
 =?iso-8859-1?Q?WBosXuRVdFchivpWKcB62KsjkhPOmH38kRHva72rgXpHqNK4Me98dd6tbQ?=
 =?iso-8859-1?Q?JG3wVJDIGoi4DWnvU7lrcSwenWrGZbSzclpWhL/XN48Gi8fa1ibhYIncdR?=
 =?iso-8859-1?Q?pqyNxLoDL7ER9g79lbvB1JnOvGqoxqxdQHa5COj29o/+tbSfxnGU64aU57?=
 =?iso-8859-1?Q?mI9xQcbb/4PWSIiC/bFsUGRPgwAdCKYztnlgQvWE/XWc3TMMuK9Q0WXdOD?=
 =?iso-8859-1?Q?AanNWMWoYdSjYBTZfBEZI0FIQCct9+MwWo0l03233zXUDu4wOt8yEw5vQq?=
 =?iso-8859-1?Q?TPWgeJWEPy26VwbkjulSk2Up71EXC2lHJT1WZJqw4YVBiF/oY8oTTWRVdS?=
 =?iso-8859-1?Q?pFD1S0DIlrAwNLP6lQZGhv7lazEote7MrrHjMqPz1L0PPVXvl14vQP+0+r?=
 =?iso-8859-1?Q?DeAIMeTRhZXbbLKlF+E5W37HDsvovgyEkbLX37nkATgd1mdVP/cjfb7vfb?=
 =?iso-8859-1?Q?fZYIj1YeO9m/A6dkJB0R9v22rCbED4ipc5MPE2XJ4QVuzXFHWTVYTWPQa/?=
 =?iso-8859-1?Q?kbf6ixA8KumWibjSl1HBsH7hjVDBzr/uEAk6n0HqH7OHp4knURNMHEEiTC?=
 =?iso-8859-1?Q?x051Im5omU0+jEXuwTZyywNh6dEkJl/lKGE+6VHStZzjxkqP2FLQaMiw9s?=
 =?iso-8859-1?Q?vmvwwNlvoPI5w2b5UV1wOhhVOZw+D3fbB/4QsAAMWmkSetzW1JwPyE4EO5?=
 =?iso-8859-1?Q?5RErooCoeE6avw2+jDWobheVFFVzWLeE8RxptJUS8+4fYZEezVMOyZ4OTV?=
 =?iso-8859-1?Q?rMqIc41k4ZjEVdwU2d8wB5h4BZrvolnx5Sv6gwtsm6suR2E2D5k7Bt62f7?=
 =?iso-8859-1?Q?htmskRM0d843L5xaUKCvIfto2/tVOO40s0oQu8Cks4EITkgiG5Xq7Hd4jy?=
 =?iso-8859-1?Q?ozGurZFqhUqM0T+u/ua0IJBCxCq+M30Z+jHBgswLxgO80GTxtHhEl21A6k?=
 =?iso-8859-1?Q?qwNBWRV0VdVewkqpJJoHFRJwT7EFTDueBaZSFcA2w2K7Q8/w4VeNleZ6ui?=
 =?iso-8859-1?Q?HeAxw+lKgl8Bf8cWUUIucr0nsG47QcuemerCwaEFbeF+SWXmo3312J53Aw?=
 =?iso-8859-1?Q?I03c3sfskymP3sRy5Q6eRzLS/iSyAT4UsAvm1O/kvo5PMb1Oyso9c3CcO3?=
 =?iso-8859-1?Q?mem2Ca7gR6BD2MxYarbOMHrU2z/WqYzuN71cudU33w9ifpqr9XH5itHTLz?=
 =?iso-8859-1?Q?4lrrAflfptU3pDx2kSr/P4ZvyKyMU9TXp5aUXsnQcsIRIwN7jDtpkp33HJ?=
 =?iso-8859-1?Q?oxKPGvUDIzxWMkuMKI8ihShxLzRhBBx0aQYwKkQuCujmUVuLAulpDBVwaB?=
 =?iso-8859-1?Q?nSQSDOqIjAKj9dqpK0XNh5Y7t3A+es9lc3afcPwMTJkAs+8TiyVFr6wlqq?=
 =?iso-8859-1?Q?1dncZgEHMX5wBxwgiEqdwQyD66eIZPkbpMsP4mg4zORCFxrBDH1QhNB+GA?=
 =?iso-8859-1?Q?Y4vK69/GyOMJDkU2TlQIeYuSQnxzch7HKU2LaC78ohr2dd+7PzneLWG3PF?=
 =?iso-8859-1?Q?cx7mX9S0+JceZbXr3PA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(366016)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lNuB/CINlHtxU7/iipevqbhDvyqyuw11Jvy6kj/V9EWTF4f4HqUufga/a/?=
 =?iso-8859-1?Q?XWv7BUr5ip11IxQBllSYG1o30aH+Oc8XdTVOOiCHIV4FtEw2do4fqXvc1o?=
 =?iso-8859-1?Q?Ij3OzEPmmn4X+HEgWSnWrddLxXmymGJGbdEHGHUzo5XNRbA1KAUQ4llSlO?=
 =?iso-8859-1?Q?UAyQ3fhZ1a15DS8+jFquiyT/OPkCTXt3aJp/HLKfGszPRMltfMklqINI3L?=
 =?iso-8859-1?Q?VO2GHZ8huacWE8QdOr8V2t9eoSVwHcKVLRWeqRx8gesEO/4vjhW1DkzWSB?=
 =?iso-8859-1?Q?epJfg6Iw+rAqD1jiZHHBO4dJG7l2Q2sszIyKgBFYnSGegUuFWiSJrZ3Vc4?=
 =?iso-8859-1?Q?SHJOyUWmMUCQoq+REaw/y+TqEWXNqpcyXpWGPsXSLJIVK2POo53URPg3Es?=
 =?iso-8859-1?Q?3CKIS94qsQJA17Psd7EfFqqkcReSxWEdpkd6wguR/zvatnjc/AYO7mFdJe?=
 =?iso-8859-1?Q?HF+1IgqntpokkzB/yZp90vH1EI+3RPaIBnoEKY41l9bO0vLbZ5WeSg/Qk7?=
 =?iso-8859-1?Q?HZyGi8kJMt+psdYtNBe/e6UbnfFyzDSZLVVVVDZHHB+S1pdwrxTnuUSWDv?=
 =?iso-8859-1?Q?JBU9wbkuJdqS0hxnMXVKkiIZr0K18QHoMdBIQQfBh6LXpGcx4f3bu0ok12?=
 =?iso-8859-1?Q?YTcNZqOVEqKNtbrTk3vGjyiJEr9uTy4hmBfFLXzf9XCDfcldVKoKgMpvQK?=
 =?iso-8859-1?Q?p8PdRq/z1LYG8MRsuaBdrUIHSfTZkKA3HtR0H+JdpNiTRaoxL3pDOBUS/x?=
 =?iso-8859-1?Q?ZFj1p8LX94fMn1sLAUkzFjPCEbzOW3tnrrMKF+ji/SjY45NumkyRgsXwhf?=
 =?iso-8859-1?Q?LhVa9UOxH/K1ShKSJpr+a5U5mX7bRryAGZKwvhOZWQqMiGdwlJueNtEUaF?=
 =?iso-8859-1?Q?rCrv/mYQwLosEDQsvMZHJsFRdv+hSInKsLgqbOBAM9fR2BrlkVxqOZXyTm?=
 =?iso-8859-1?Q?UpUIPULVquY87GeDJT90xn4WJjnscdJa8ADdOW14DPs2TxTZx0fHfpwdk2?=
 =?iso-8859-1?Q?dCzXuDAEcnFDkdTIyt2+bwYd36vfeYHWMWl0qnnk8v7bYkBhpIY63CsA/q?=
 =?iso-8859-1?Q?QjQe95DdMxxJOmFntqyyeObB2OHiwoCOK1XpDIK5/e9orS3wagNhrzv4fO?=
 =?iso-8859-1?Q?odCnyXkEIh9loF/cSIaW/CjjHrGq0MK+ljRqW4/yngc6kKT3Eh2vZ5eX4/?=
 =?iso-8859-1?Q?C267K1f5eJIvbPZWL4x4LRlGwlfXBCXQT8hDNMedFG/HrYA0hLPhLnjvlZ?=
 =?iso-8859-1?Q?to8FDhqjW9Ag/vfpHRF3sT4OQPt2zfPDGPhvex1E+JdsL5XNAmNV2a5rJo?=
 =?iso-8859-1?Q?2STGtaPI/0FmHMPqSh6urLgBDtcAWv3MHvNA0GlMBLeKmOyCSyioPtsELA?=
 =?iso-8859-1?Q?85QwCMML6/zMIl4btmUQufpGMZZiSz74xmnbpJEeABU/92YTgEvX6sfCqL?=
 =?iso-8859-1?Q?VKzyJsVfM//Bn2IHHK98s1hZpwYI2twxSa26xbRheTFeHtRH1Pf/D9+LGP?=
 =?iso-8859-1?Q?N4ZDEp+PBlo2qWY4rnRzu8ygqGWa/R2qJDN4zLbkhVbKjqPyeQcd2jDwA4?=
 =?iso-8859-1?Q?ayBDAmvq3VbInXcLDGdzNNsefdr9+q+VfzqdY9+z1dHc1cpnynFbldHST5?=
 =?iso-8859-1?Q?6+gxDUlA72kCKNH9gFU9fZoycNda4m1D90N7hUpQmTwvLWoGepe9ZP8QlV?=
 =?iso-8859-1?Q?MwBAcGhnHcQYBoSgVmpODxWnkmXV2VUvwqxVY7mQ8XUNXMmoTqqCPBaWQn?=
 =?iso-8859-1?Q?GUAolv/CegYHhGGV0e4jOetkY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: q.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1efefe-868b-4155-bf7a-08de6edccef9
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 10:59:37.6997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7aac50ea-5b23-4e88-8c1c-f6c7ceede9fc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3khuPWReMFRDnn7EFOXf9hqEmvOv/Q5L5v/zOZjsrxPaFkxK33ntMPJm4zRhiOU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8636
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[q.ai,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[q.ai:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53041-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[q.ai:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[itay.perl@q.ai,linux-media@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 677B4155BC6
X-Rspamd-Action: no action

Hello,=0A=
=0A=
I'm observing a behavior change in uvcvideo starting with kernel 6.17 that=
=0A=
appears to remove userspace access to the full UVC payload header on generi=
c UVC=0A=
devices.=0A=
=0A=
In kernels up to 6.16, requesting a metadata format of 0 allowed userspace =
to receive the=0A=
complete UVC header. uvc_meta_v4l2_try_format had=0A=
=0A=
=A0 =A0 fmt->dataformat =3D fmeta =3D=3D dev->info->meta_format ? fmeta : V=
4L2_META_FMT_UVC;=0A=
=0A=
and since dev->info->meta_format was 0 for generic devices, format 0 was ac=
cepted as=0A=
the metadata format.=0A=
=0A=
Since 6.17, requesting 0 falls back to V4L2_META_FMT_UVC which only exposes=
 the=0A=
standard portion of the header to userspace. As a result, there is currentl=
y no=0A=
mechanism for userspace to access the full UVC header for generic devices.=
=0A=
=0A=
Would restoring the previous behavior be acceptable for compatibility?=0A=
Alternatively (or additionally), would it make sense to introduce a dedicat=
ed=0A=
metadata format that allows userspace to request the full UVC header for=0A=
generic devices?=0A=
=0A=
Regards,=0A=
Itay=

