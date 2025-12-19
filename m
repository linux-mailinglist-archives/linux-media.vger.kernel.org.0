Return-Path: <linux-media+bounces-49182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF50CD046E
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:32:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96CE630B0252
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7EAB31B114;
	Fri, 19 Dec 2025 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="nFcOQxVz"
X-Original-To: linux-media@vger.kernel.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B7D337B8C;
	Fri, 19 Dec 2025 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154685; cv=fail; b=KvQD7Q6IW0IXGeq998UTtD2mDryfLoIPKNxLsHpN2rn0Kszg1/OKGZxImDigjejefZxRkvdMSVZyKo/SIO1ulkYj8gv5lNAsE/Toix1A5E3IMmg260GZ3n++7DF/VTprk7ihPxttnrSy40TDz7MDRJGv+XxfKHrG6sjkNLXHnq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154685; c=relaxed/simple;
	bh=ni5suILTbOvIavVzI2BAUPmLPE1GXoRuzMuP2OfId/I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=u2mh1tKM+slEEv/QHWnSOQ2sxV3x4zLk710hz9hrTn7EttbMlQuABvkaBLN8KtZjpcu4sLUO/WWYLMt/SVsSOWS30aRZw6Cv8w6RRg9JyI9gLnn5Xr2RUq2eTvXRfD7Owj+wXzyYP6Bdf2dckRUM2GIDTY2/MCx+mRrnrsFOBAU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=nFcOQxVz; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJEToSb876615;
	Fri, 19 Dec 2025 15:30:53 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011066.outbound.protection.outlook.com [52.101.65.66])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r32kq4m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 15:30:53 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fee//ljLfRajt//W2iytTeiiU+hA28Pgui5sAqsl0RRTd1IBQsYA1JojtjhGxzstUxkB3s385VeawdOSrumOTbIJo2+YaeE0iXQ6irXkiYOsTOwWybRwsBew2QPjK3MiBAAclUNjgNzVEWaqhe+TKCCHBF/4RAXog9NJrfYiA/CjP/bPecyYKGxI1TFftSVPHDi0U918TSy1tBNP3FIRcw5VXTQSlxQIcAD7yBQpwWgl+f8f5vIxvTp4SrQ3QK3iCgh0UYmqr7IRgYYOYPlZNe+i25+VC+dZGsIUEHEFX7poYcSmM1PZSKGm4eF3UDbrgabfrn0pm/GupiufxEcPzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BHpfEPekOJRDRWMd7+aOidRAH/zq8dDpQGbbUx8SfuM=;
 b=tjj9UMyBMJxZ6C/StoDZnkkWI+p2n38VpLrUyipNx6D0oCd7+BNlG3Cd8Ju/hZu66JDqpa8LWP6Gqo4wePaQ64FCrpPkx6Wj0AqYv/76yU7ZNVI8CQ/8WlUwOBKnmaT1aAWhsBLUMa9mDp2AgumbRZ1/cyzPFBWQWevnIwifr8hU6WkB7hCga+AaRj0W+tISzZ6ZzpQynlRPVS4f1imSxuWIbXZbVT10jKXli2bYR8lk3v1P5oxFWyEXvKV/Y3u3PwKNA3GlcqKW9EY94+pV8o7ildR+wnOT4Sw5MBmhf+YgO5yoHlHEkTE+d4pdO4ceHPIoGweH5GKQS6STiArXLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BHpfEPekOJRDRWMd7+aOidRAH/zq8dDpQGbbUx8SfuM=;
 b=nFcOQxVzb+Y61AMhDd1fMccx4BOgfxDqkRUE0jFByYPGNyzlyPu3xNZYaYWyMKg7JGKf0NMpzl1DChnKCVgCzjvgwJI6dxdp4lM7GYJ/RvFDH5DfL3+sCwFYAzDfJncTgRPP7hjBVeu1IX8Q8AYQrXZIJJGz7jXHgnDxVAH8bE/O0kVbMSUdqg76Y9LP8HPZZ89mHJG8Wp4hKWQ6YYR2zA7T3PMy2SwgNEr1JnB5IJdFI59ThGET6QNZ8wtSUk4DqhimBeUKAs9aI+DFwS33fR7VUchZp3tHMUDaMhm4WwFgFgz5nGBtlKbLu+2AJ/yXZLWSqZfF3rv2DKRfrp+HKg==
Received: from AM8P190CA0004.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::9)
 by GV1PR10MB8821.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 14:30:51 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::15) by AM8P190CA0004.outlook.office365.com
 (2603:10a6:20b:219::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Fri,
 19 Dec 2025 14:30:40 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 14:30:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:31:36 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:30:49 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 15:30:35 +0100
Subject: [PATCH 1/6] media: stm32: dcmipp: bytecap: clear all interrupts
 upon stream stop
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-dcmipp-enhancements-v1-1-e2f8d46f022c@foss.st.com>
References: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
In-Reply-To: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|GV1PR10MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 5087f23b-e856-44e5-c577-08de3f0b3550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TWdIbkhkM3JCQlpiNG41MmN0M1k1anFWZ1lJbmJNbTBvMk8xMXFBVlYyZW56?=
 =?utf-8?B?aWc3TmFyWXRLZ214VEluaWg2amZGQm8vV3JyK3ExSEZSMmFwY2wwaytyME14?=
 =?utf-8?B?TmxOaDRQZzRlUU1CWlY1ckdCVm9aTEpTR3B3S3ZkcndoSDBHeE5DOGU1cnpn?=
 =?utf-8?B?NWo4UUFLSG43VXc1eWttM2JsTURVWlhmc1JTeUJOYUxubVM4ajNFK29MRG0v?=
 =?utf-8?B?VXczaFdWbnhlN2tHSHRVMk5sTGxIN2paSkZ5RWo0UlNpSkd3bkFMLzdsVURN?=
 =?utf-8?B?VWI5MWFHZkF4eVZHeEI4NkcvODRuaDdSQ29PM0srcWNRZVdCNnVVOUJuS0Vw?=
 =?utf-8?B?ZFhEZkM3VmIyUzEvd0hiaGI0QmRvTzlEMUd1dnhkM2Y0aUVrM0ltcSs5dG9I?=
 =?utf-8?B?QWlSSjcyZHhRQ2tkNmFjcWowcmQ4Z0JFT1l0Tk9iazNnOHkwY05CNEgxRndT?=
 =?utf-8?B?aGx6Z0o5VGRvRWJJWWZwNlZ4Nkt4Q24vN3JRRnorbFZHL3NlTktLcDdxQTVJ?=
 =?utf-8?B?VS9aKzI2TzFPcXJPUXBTV1NsVkZLMGk1dGJzRUIyUStSTjQ4Ym9HNW9IVEFo?=
 =?utf-8?B?K3E3bjJpV2IvNWUzUjdYTGpWdXZ0K044cGhIQk9RbFFhRDQyUERiYzg5cjF1?=
 =?utf-8?B?NDI0QWNDc0N0QWdJVk5KM081aTkyNDFSWHJUOU5ORXRTeXNscEY0R0J2czEz?=
 =?utf-8?B?T1JZRVdzcXRuOHE2QVJOL3AvTkZzV05kNTliRmc2R25KaTdLSndWUFJZcC9Z?=
 =?utf-8?B?ekZxOTNEYjIra2k1UHdEU25mbWZTWjRzSUp2RWlQckpSUytqVFhvL3NCRElH?=
 =?utf-8?B?c2tsWGZ4UWhiUk51c3RBL0liMUhRQTR2VXBBQXRIa0R5U0p5akhDUkVmSFk4?=
 =?utf-8?B?d0hDaVFHUTNxY2FQZUkybFYxNnoyV3lmOHdERjg1ZjlqN1VJRG1aa1lxQUEx?=
 =?utf-8?B?bjVuMnFVMlREVVJrWFQybTI5RW5MTDFDMThwU2NsYkk5c0RoZnFLUkwxdFgz?=
 =?utf-8?B?VUNSUEYrdG5FM2kydVFWVDR5dHZQMWFGakVwME5EZmFPOFg3TlJVUTVPc29O?=
 =?utf-8?B?Vmd2bDA1bHJjaCt0RG9XdkRwZWpLc21nQm02RmdkMlhNSHd4YVhXRDkzU0g2?=
 =?utf-8?B?WGNBWUZQS0F4U3ZKOVJvUXhTY3pld1V0ZEFpZHd1M3VsWWtrbmgrVmx6UVdl?=
 =?utf-8?B?VEVrNWlzME5EZXZSbDBzdmFHTXc5M3lPaFF4Ynkwakd6QmlmWGlGczJjUHJF?=
 =?utf-8?B?OWw4U3BLWENKdHhEYnRQdXJPNHdaZStMZmhPUnhFTi80cThqV05JaGF4VFBh?=
 =?utf-8?B?VkZuYjhCWW84K3dxL1VPWERqTDFPdCtsMzlCSE9PRy9kaEpOY0NFd0FUMElC?=
 =?utf-8?B?czNONldTb05nR1lzNkI4cDY4UUJRa29BWHhjL1Y1bG00dDRxUnRDaFVZNmpC?=
 =?utf-8?B?c2p4bmpSTWNSbHZ6Sy9uajJ3UWxkMFpzczRwbmlnelNIUUFjbEdPcklwelVi?=
 =?utf-8?B?QXNKS0ZQTzM3SVUyMm1Ia3VQYk96VFpwd2V0RWVEV3hSUzVQUFA3M0VPQzFu?=
 =?utf-8?B?eFNLa2pEQlJIanVPVDdtclZITWQveldhYWxmMDlabFpNaStrY2VZSE00b2cv?=
 =?utf-8?B?cWxlSE1ZalJycjhQL1NDVllHb1YySUs1Zy9oci95dS85TU5kY0gyaUFnT2dz?=
 =?utf-8?B?MjM3RjFYVEI5cWMvdThVQW5FNkxNTFlDbmt0VmNTSTJ3RUFMYklqZURKVXBY?=
 =?utf-8?B?YXgweFYvWXltVHgxUnN1VnBvNWlEOTJQZWVmRjc5cE8yRXY5UjA1dStLZXFF?=
 =?utf-8?B?MGlEd0ZOLy9YSE1SYmVvTkhocndaMVJsT2VnRjRBL1hIVXlCdy9CWmEzcEgv?=
 =?utf-8?B?OWN2Tjh6UUt1NHMvd2ZmbnYzNWNsVGZOQzNFRXdmS2h5TVpJV1lrSmViVmlh?=
 =?utf-8?B?dTZxNGtuSnhxM0x4aG9nKzM1QzdsMm5ZKzRBaHFZLzl5alRtZy9XMFJrZ0Vu?=
 =?utf-8?B?bkFqN3J3Q2dkaEVVcVd4TU5PL1NGSmhYNi9zSmxjUnNsMEJ3YmloMWRTN2Zu?=
 =?utf-8?B?YU05ZXRSekczempkam5Kbmd6UzMyanF1VnBEbnp3S3lYR0VmREZaNGZ0dmht?=
 =?utf-8?Q?rCQY=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:30:50.3956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5087f23b-e856-44e5-c577-08de3f0b3550
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8821
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMSBTYWx0ZWRfXw/s/NmIONPoT
 xa+NfeA72eZA17zjT5zYuuyDVBibIbW2ryljvLDxRQ6H1BII22OY0zSbPNWIhSpx9rPjhmnwgMO
 +Z0/4gk/DwFL5YLw7XHvEdG3sCbCQLpI5TvQma9ir4vdTa7VTZup+IpMIgORkzTFOF0oG1GG1EZ
 o9uEXs7nAtT0Gwlo8pO1n+cZrOPunNKvqpWRvT1TyeTWl9jaePlRy24KSJAZQ3gd7HstLZpw4/+
 exBi+uoEg1BlMW0fRrO0aT9jjkWoC8L8QmPPpxogDVkT8VNJgCTEwhzLMI/ryb9nTo9YwrIlNbb
 19MkwmibWTkS8JtsUNWxuA36jLqWhyWmGwyLunj/PAEdxJFdiI485cNF/+cMYBxpZ3kUjWX6921
 wBH26DtVQAPmqY2RFnqLafUYiQibYukSGohuOxSsBwoZlYUKhyBil1/g4gDMID4cBgFmC+YH63m
 O1QAfiUCOrP9tg+/JMQ==
X-Proofpoint-GUID: r0ZUxR0l0K6Ofq01-xpRSmYutFbUqWKv
X-Authority-Analysis: v=2.4 cv=XdyEDY55 c=1 sm=1 tr=0 ts=6945619d cx=c_pps
 a=T/jJOQ1jOsfbeIr9+q7grw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=-5AulJX1IUtsbpJIfbwA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: r0ZUxR0l0K6Ofq01-xpRSmYutFbUqWKv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1011 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190121

Ensure that there are no pending interrupts after we have stopped the
pipeline. Indeed, it could happen that new interrupt has been generated
during the stop_streaming processing hence clear them in order to avoid
getting a new interrupt right from the start of a next start_streaming.

Fixes: 28e0f3772296 ("media: stm32-dcmipp: STM32 DCMIPP camera interface driver")

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index 1c1b6b48918e..b18e273ef4a3 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -512,6 +512,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	/* Disable pipe */
 	reg_clear(vcap, DCMIPP_P0FSCR, DCMIPP_P0FSCR_PIPEN);
 
+	/* Clear any pending interrupts */
+	reg_write(vcap, DCMIPP_CMFCR, DCMIPP_CMIER_P0ALL);
+
 	spin_lock_irq(&vcap->irqlock);
 
 	/* Return all queued buffers to vb2 in ERROR state */

-- 
2.34.1


