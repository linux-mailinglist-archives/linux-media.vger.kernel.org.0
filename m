Return-Path: <linux-media+bounces-65287-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LAc3C7I9NWrmpgYAu9opvQ
	(envelope-from <linux-media+bounces-65287-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:01:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2B36A5E86
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 15:01:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none ("invalid DKIM record") header.d=siliconsignals.io header.s=selector1 header.b=ZK7dMc99;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65287-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65287-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=siliconsignals.io (policy=quarantine);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D2DB3011351
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B891389453;
	Fri, 19 Jun 2026 12:55:37 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021082.outbound.protection.outlook.com [40.107.51.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C603389E04;
	Fri, 19 Jun 2026 12:55:34 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781873736; cv=fail; b=ohWNjD6zB8VigF+aHifwaGcwGCY7ygxVcxG2jgky/VaWLQN6Dvw7AagkYnsjdHOj3GRvvg0wF/hVxCS94WRusi/AMR5pThx/Shpf8B1+zVstquFiWPo/HZb8OKLkrmJQKQDnKEQFuuxKWul9ngtUUPS+w9m1Wss9CvuybE1yI/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781873736; c=relaxed/simple;
	bh=ykHJAfAMP4/d0J6dwkt/e2JsrgLOC+T6QggXB1LO/l0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N/V7K2QJfix7tEvB/M5aIKXljwEALD8xnQdTHuHU/+KVR9rLa0J4Ayeczi8eJR89ygHZefFJHl38+pid2AzCCcPaAKDZkMlGK6frmwAtpuQVpW8auXn4tdcxDEPQy+B8+4rt5pIpqfmWlkDrLBPpZHHeHzX0DYJp/cvg7sW+nmI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=fail (0-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=ZK7dMc99 reason="key not found in DNS"; arc=fail smtp.client-ip=40.107.51.82
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rwdKbgkHs2N8PHS7hApRFJrbY0WjsRl0QhI0H0vgH1qOUxADtsT4u2oE+E9rYJMQ+6Wbdk99O6rafC7MRMwlfCBYhzy4K04S6qfjFiWN8amK95+QT58sAetIHR0q2JvYwOOOjQ1/NVLGWsk8g2dEj/+TggTLikvKY15bIVIuCS5JvG6XvlW91urZ+fQrMIYlARX1FaK5KfB+X89uVFNCIv0lE+iNTP5RQzpM3XYtbjrqCyno8QL3iZHOA1iPewJojAslb5DV+O1L5TYBH4vina39Tb/88TPXfx0g9rym/3wFsMV7lQqv2aimwMuFowbhIOOlvjKHB3xDBVzUY0y7+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlvYkdhyYYdfX9rrWpwZh5LK5+8axo6Pz2mmA39ef5M=;
 b=j0DQgoIt8I1CpxYcXzMkybxTPeWXTdGbbpvcTdJcpVDbUyFGc0uUkIjQ2YcYf7aXkP1513V3J4u9dUepa8Q90tUuhdfY8V6017SIkHLKFeJ3sX6vpPXQsMZMpURaW/4PFv8L2zCye63WM/w96pOBHIk5pDN1AfBAfdpL312CDdIVa9czjtRXB+zwNtcLGizMLjtK/0mYT0D7CRhJne6ZgDFXlXC6Ugw8PTnDHgAc/IHhuMEZnnfZW3d85Ck9kXEqIwPK5L9LrQjLZwvMv4sLYagArL7dTSW114dhLoZ5kq1nX8MonF6+53ym3pe/uWloMIkbdHXOP/ZGx6OZWUu3sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlvYkdhyYYdfX9rrWpwZh5LK5+8axo6Pz2mmA39ef5M=;
 b=ZK7dMc99BnOPJHS9PZB3IMXNlS+14f+oytStpnQBpH2ellv+xRCyyLmImhyaSo4Col/2oJWmMs52DNhQrlsnkz1Vhm8OW3J6TBLtRq+yISADV5x492/K0RHzHywnPA8lDOPQ52rUEQCI8EVXGm5/Q+uhzwx2WjXCdfe6SHV8G4fbjC3ku9ckzGsyzCIev5brhKvvL4aQ5k7ySUcUYwmdtRUTa2aAPYaaPJG/funA3TLNvbV8LevsmoOkAIzvDB7gO/zag5ovhxk8EM4pqi3s7kBKy89rBucBofpv4+dvhJ97O9RALq3vfQszCmd6ylQ7Gw4vV9iLyHtebTrkunrpMw==
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA5P287MB4612.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:199::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Fri, 19 Jun
 2026 12:55:32 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%6]) with mapi id 15.21.0139.011; Fri, 19 Jun 2026
 12:55:32 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	luca.weiss@fairphone.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Walter Werner Schneider <contact@schnwalter.eu>,
	Kate Hsuan <hpa@redhat.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony IMX576 front camera support
Date: Fri, 19 Jun 2026 18:24:33 +0530
Message-Id: <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26c::9) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MA5P287MB4612:EE_
X-MS-Office365-Filtering-Correlation-Id: 131267d5-5562-46d4-c3b1-08dece020bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|23010399003|18002099003|22082099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	R8w47aYgSu+wDsxjWK9qnFAI3HeWBv+9mreLKYutPZudItwbTTqBH9DimDOljlpUM4YlSP3q6I5L48oJDndy6vScgy4KWIeJKCgwrBuyQ4FdySlZQ7ls5sL47cmznfGm41f3ZvvYBj8rV1lBdojewleA94GnMBfzy3mmS/blBh+WztqhBFuhLY9ukBBKYoqKM1jVU+Y7LAvbF4FlsibpQ85cWMhf5HU88qH2acxS2rc9OUFgwyIYhY4myVFLTw1RZ7oLRT82AbkWtKA7ntDX+ixo1Swv8lMkMVCfA7IMNNP/cSqgqW9KDASZ6Am5tjMczwm77hlYyWIm9dwdQIpAcYklrXGrdGDhqcDu6xXY4xaAd+zianlY35gp7gT5qCqiFdPiNXMiZhOihmA+PppsrOnjaU/hT/X53Bw1jAfHGXG6x1dD19iCQmmjFCPhCv5c/kxQAJbI+LyHIAutmKnlErPneIllOOv0ITUrNPrHPHhTU64YNm2JQvYMto3rHYOwE4kG5vRgoTEPGL/LMk+tp/D1ixg65IPqDCmX6A5NUGRkJcRAshGICwJ5jZTULvpGywnoRh0VN0q5rlKuCyJbYAay8RoYgeigBBjL3VZb7+bjP/fdtTUSLaEBRpa1dHqSfoLc+Lo0lY35SUxPbHybcuc70eRMIAdKAnTz14TN2YXFSBviDwVL5LJDxG4VDxWWmZH0bWRR4xGe5kvxxISuGA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zzLreDE+AzgTP/JEJmSpIYQflgfX1zYGE77Fs2Uep2NAeiE0zQDb+Ct2+qGU?=
 =?us-ascii?Q?agJk8tk8sNwCRXWhzl4OyYe7D65/a/SexB/DkgCAwXaXBVmuVIPIBcXc6Uty?=
 =?us-ascii?Q?n7jMb2oUhYEZKUR1EzaWUklllHonMsUBwEmx7BXDoMwcCMDKAL/Jk+Ri0IdD?=
 =?us-ascii?Q?hjkUWZUIlP2eP06jzugkNYU1Utojc3Lszo3bToPBvvTKXKHt3882kBtUC23g?=
 =?us-ascii?Q?xtwXiLVTh5vVKxnDZC6HXDzZ8BDwBbBa2/wZ0D0dEUYtmBuBWQy7YTANZDAh?=
 =?us-ascii?Q?wZPZrub+YmeR/KG63wC/rkARFNEHHZg+RDC6X/lwv0eZuXOgmne5mIRgFoh5?=
 =?us-ascii?Q?cWEUIa7wNgZCb+n2L8f8WFvGKlb6iMysOYVZlyepP1G0Bqpe6d13A9lNgPGW?=
 =?us-ascii?Q?nSy3Ka/Nvn0hVlocc/EpfNfV3CHtIwRO6uLJmj2RSUeBVUnBZCa+3gbpsvfF?=
 =?us-ascii?Q?2/2QteEBGLExrSdgdjZpuqoa+SZ7SwGkD32COOVuc5z6VS+eIRBxUASDfpFP?=
 =?us-ascii?Q?KgXA9DmXilrD2Rfbwem11rYj8ybuxHeMw0Dx8JTXoVU15EOueFRc/AagEXI7?=
 =?us-ascii?Q?46vQwWInYHcRJIJ5s8l0uMJxb7EKD3c1Qi7ci7eqhoYetMPQj8LAX37l96xM?=
 =?us-ascii?Q?Yrz+pT4Y0OACkp30rK7/Su7s+/KTbDbevsCZXdCwsP6L1m4IYdRYB4mTLlQn?=
 =?us-ascii?Q?Oge7wFMOB7wv1lpfz3Ufd8Gx6XKRhD5yMOF7sc7j3yV2NQzar4yVozRsftWk?=
 =?us-ascii?Q?MCAHTJAtMAcv8a2xFVMb2ROH88nI/kD0oTJPzAt2yD/F/C5u6D+gIANt3mgn?=
 =?us-ascii?Q?T/RiEFDFuYOe3TcBQdY3C0MGzkegMXySaEA/XzyTGzgxPN2USniFM97So8UX?=
 =?us-ascii?Q?fsGFAg8UiMazWfrNR+kuODt4BjFK+E8GoX7u4oAqfD2qEgWXsqBZETCzyc1U?=
 =?us-ascii?Q?2axnmYeeIsLD/cY6BBqGYBW9rzIktSQfhQREoFHrbmnhTo3aOp0br5T+7ZZA?=
 =?us-ascii?Q?kFLXJ+2fKmOcdGRkA8/hd/z9BgY94DKUR/tru3hEwU5UbeJc5ghF1V5ejHKu?=
 =?us-ascii?Q?SyIKJvkEwTiFSbbbbvVLdfNeTfzNym0ha5HhNGCYqj1nORGrBAXt03prIKj4?=
 =?us-ascii?Q?N2C0KsqexW8irB9o2PVqpeP2HTGoKN8bFXjGz+KsaCMP7RH2tsUfpfcGxGT/?=
 =?us-ascii?Q?0D1OLNOjoDNd1OKXgQ7gMwg7auK1H7UKb0rWRyVEWIcs+FTAKJXLy1u38pk7?=
 =?us-ascii?Q?OBnZRWLS3q22eUlwgcNtbaI9Mp0FxcPpo9udZnoVicdvJZDBqpM2duqyD1nk?=
 =?us-ascii?Q?pcFUeikpsEHmiMrtPQmgmQiuT0Ont1isKHP/emIdDK7nc/a20rehuxRmxf/M?=
 =?us-ascii?Q?9N7OzKZfb7voJ1Er4hpns8pbaT9hacq2/rFJZ+2jjjmOp1tmfz00Mz7uI4Ed?=
 =?us-ascii?Q?CYCVoevfhiaXU6ZCFvODJ8gWXpZu98a2r9odjjU2hFOJSY3qD3lFW8QEMfmT?=
 =?us-ascii?Q?9BD0xnLTsO0uVtRLx5BuIA3CFD6tkLj9PZawni10xjHczdT1qsqevGI6g8sE?=
 =?us-ascii?Q?g/+7Sw3l22ztAXI+vQMvQlb4bCfgVDxInP2RfC+0IoT924jfBBSJVk5l+aWF?=
 =?us-ascii?Q?0RR6EBF10SYWim6MwHPBdRUx363KAsBWuZ5V5qQrKC+NGq2V3VNVi2po0JIs?=
 =?us-ascii?Q?BAJSZrJnZvVb5zi+K8qhcbCpYIX7/IVle7EyUV5f+i8GlbRaxk6OtThPuocQ?=
 =?us-ascii?Q?urJqcoAoIyRRwqOaBJVjO1eUCP3E7pg+MbgqWEs4zLukRp3GjfMh?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 131267d5-5562-46d4-c3b1-08dece020bef
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2026 12:55:31.9379
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikWIuDvuIX/DIu4kwvD6w3YPOcDL062WUaSC9XcpbVOzv1/jh8F2TdZpR6DpOSJDE2QaY6ogT2w9y63CrAdJmR+zBDYCI6GNJeApKSmk6xMRtVx4VakRwmLfBZwdVFIh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA5P287MB4612
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[siliconsignals.io : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65287-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:hardevsinh.palaniya@siliconsignals.io,m:himanshu.bhavani@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:elgin.perumbilly@siliconsignals.io,m:laurent.pinchart@ideasonboard.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	R_DKIM_PERMFAIL(0.00)[siliconsignals.io:s=selector1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[himanshu.bhavani@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:~];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:email,siliconsignals.io:mid,siliconsignals.io:from_mime,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5B2B36A5E86

From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>

Add device tree support for the Sony IMX576 front camera
sensor and connect it to CAMSS via CSIPHY3.

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 arch/arm64/boot/dts/qcom/sm6350.dtsi          |  7 +++
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    | 53 ++++++++++++++++++-
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 4f5934cf290a..ad8e8b450afc 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -2848,6 +2848,13 @@ cci2_sleep: cci2-sleep-state {
 				bias-pull-down;
 			};

+			cam_mclk1_default: cam-mclk1-default-state {
+				pins = "gpio30";
+				function = "cam_mclk1";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			sdc2_off_state: sdc2-off-state {
 				clk-pins {
 					pins = "sdc2_clk";
diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 3964aae47fd4..1cacd17e7c47 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -17,6 +17,7 @@
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include <dt-bindings/sound/qcom,q6asm.h>
@@ -547,6 +548,29 @@ vreg_bob: bob {
 	};
 };

+&camss {
+	vdd-csiphy0-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy0-1p25-supply = <&vreg_l22a>;
+	vdd-csiphy1-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy1-1p25-supply = <&vreg_l22a>;
+	vdd-csiphy2-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy2-1p25-supply = <&vreg_l22a>;
+	vdd-csiphy3-0p9-supply = <&vreg_l18a>;
+	vdd-csiphy3-1p25-supply = <&vreg_l22a>;
+
+	status = "okay";
+
+	ports {
+		port@3 {
+			csiphy3_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				remote-endpoint = <&camera_imx576_ep>;
+			};
+		};
+	};
+};
+
 &cci0 {
 	status = "okay";
 };
@@ -581,7 +605,34 @@ &cci1 {
 };

 &cci1_i2c0 {
-	/* Front cam (Sony IMX576) @ 0x10 */
+	camera@10 {
+		compatible = "sony,imx576";
+		reg = <0x10>;
+
+		vana-supply = <&vreg_l3p>;
+		vif-supply = <&vreg_l6p>;
+		vdig-supply = <&vreg_32m_cam_dvdd_1p05>;
+
+		clocks = <&camcc CAMCC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAMCC_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+
+		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_mclk1_default>;
+		pinctrl-names = "default";
+
+		orientation = <0>; /* Front facing */
+		rotation = <90>;
+
+		port {
+			camera_imx576_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				link-frequencies = /bits/ 64 <600000000>;
+				remote-endpoint = <&csiphy3_ep>;
+			};
+		};
+	};

 	eeprom@50 {
 		compatible = "giantec,gt24p64a", "atmel,24c64";
--
2.34.1


