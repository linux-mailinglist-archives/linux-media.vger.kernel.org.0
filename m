Return-Path: <linux-media+bounces-59508-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMWBNNM362nRJwAAu9opvQ
	(envelope-from <linux-media+bounces-59508-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:28:51 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3645B45C316
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 11:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 098803037D61
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C3138758E;
	Fri, 24 Apr 2026 09:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="gLb41z2f"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020116.outbound.protection.outlook.com [52.101.225.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E039D382294;
	Fri, 24 Apr 2026 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022788; cv=fail; b=rJJBKdopoGSeG63BktQeTTIuF2Inkj58GdNXyVJJc+lHIy3SNuKYErr1zw7nT8ZBhCmgX13cQg+DU+K63RbhfPCSwGr1hDs/yj0uJXwf35Ldf8azoluvTclJMA3NDo9FCovl9/pVxguTChe/EBb52Ryb/zqs4qFy1rebxk8CXhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022788; c=relaxed/simple;
	bh=a8vxsaNEvPcua5r0k4q93KXlf/RzVfZieCHSlGIVQ9o=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=mTHpGsYJo7vQiTHR7whq5Qocv0CwiJaypE4fCFiQu8dfBSteSppR8W8WVlFuwqFJ/D589d0PbCzfzIdYId+EtzOuiQbLS6k8Fu7VFKm95/2NN0JpZ9rKl8ixo1OCW/P4lY1yW7l4LH+l1GKtEUkDUmTpUKod6cmijCqqNf9LiNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=gLb41z2f; arc=fail smtp.client-ip=52.101.225.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6HBnmsuf9k9cDCduTeNhzTujTl7f9aWmgu/9F6IJNanileVvpTa28EU4SjCsgsB0U4clnBFw56fynBaOzfxFz1J5g58Paf5yFzf+KI0RxhipidrJpJcSnqohNPF33Wp5+2aTDd1QO1FES+JShA/EAxlV14E15tnnDiS30yuW4s7x7LIqmOVJemN62veRkUcjrFXYRqMkI/gIjH5sW++1BM/X6kMthXLoe5gXejG7bIFuy/F9gHLoTimAcozy26XypNRBoE2xDMax30EMEq8+PKVJZlTL26XY5vlBfw0T/GvmRGM9Gpw6UwdPFZl/SKMuIwn3e9oprmJH61P3oGUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1RjZfsypGO4CFr60EWaj+t3XOBCTXKlPvSO6T3vO0uU=;
 b=XO+/qcITuphYEQW8rLWKZ+CnOBWMldQnj5wPxVL3+o9jDTTc1oA6FZX8gwAAZvGobCj8k5k8tlwjJmkvOEecXWLfBvuVOc4KPWCNLxYUG7EwsOe5eUu/6SeORlTLniBnUwPMXZSNJjO3QmedKpv2/inAs/1TXZcSXHZ799aQHzEWCQXbStFYmRdVJQYdZVTIcBqPlBmPayEjDIfokZc6U3SpizTGWAEs+erbTBrRA0YQW1Wcp22lKNbSeFfeYJHwJeZLcMRhSALBY7Yt4GXkC1bw3CbtErVzouhlnkH9QGV5XDoQStySEDvyyc9ff8P5u28vu+iJ/DwEqfJd8kNfCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1RjZfsypGO4CFr60EWaj+t3XOBCTXKlPvSO6T3vO0uU=;
 b=gLb41z2fe1g/+jYz7ccpp8bX3e3f4Wh0ADVTexgQ3cxOZd7sLu3eUF0IVTO6RSLZnuT85ofej2eKweoCpjzArsYSH+RMyxDCv/WLdIk8mtsJgC8iEwHVtZPBs+Xk0l3sbIYDppVkbbxWoOVuDjLp4CgMxjN1VNO508L3dOUk+IZ8xgqWYd4V29xudDeyAWsep9D74e9EbLCgmsRDmZMkV0w/oG6ZaXV+VgWOJOyDKnB3B30y9iFXCOl/6ehiv265Vs/sXnm8duL699nww+xwaMTbUT9EjVAstvH8CcBNpW2qaDxFUgVsAGYSWMqXorK6D7A2i024wyq754rIaz+j1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN3P287MB1959.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 09:26:22 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9846.021; Fri, 24 Apr 2026
 09:26:22 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	laurent.pinchart@ideasonboard.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] media: i2c: Add os02g10 camera sensor driver
Date: Fri, 24 Apr 2026 14:55:44 +0530
Message-Id: <20260424092554.26130-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::24) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PN3P287MB1959:EE_
X-MS-Office365-Filtering-Correlation-Id: 98e9b8ea-85cd-4d87-c710-08dea1e38c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	llLGHJ2qSAUR/riDN0RcCzPTX6KyvR+QIqJfJIBZsk1HrUoPm47Z9JR8IhUnKFjyMR2hPcUhMgbM/4QyifsaenwiPhghNbfp6PjWl+oJB3iOx0pWqDkMHmRNPh8c2mXR7kjVww05hsnjja6R8eWBQ9I0TzCKMBh+vWG5idIWYCDiHxA3n2SGubuVExYy8Upu2iQ4fnTJk+SsKhWx0I/kl1ShDCIQ1KWbOpWDuxp3gU0fkPcS9XMQMb7iVirtEmcBqGeUZJCBxT7ndAu4lGqP3ja3Hi3btgEyixi9zRIYOe/J4rR/3sLVEYVlN0jQsDYAWBR5cJYfS3LAYAXdPiDvb0ClEoayUqoBGuhmqi982QLlFImPqwHg8yqYVVQkJSeswXLo33Tf7Ejk6Vqcg5iQ40N9B4KHbqiX0fzUNLCVGGOXAvUcTaSo53Wpa3huAgm0k+AseqrfRmy7n4IpwRtkRWq/HfDt9Wmvqzbik/niUlyY/iSa9156OryrOQFwjKSEaNHfRcFWdbuWkNrj3CHjIspz1nNtH0uY+jY/yqJAGMkiZKSyh518/QHA9SFItEuWPAb1/eQeDv/+kjA0NOH4aE3t17hEOBRcxR5lKKP6B0sobEpNp11HVtYp7nUZQhCgsWZqJBdAK1E+lPt6rBaA9xcSgsyF2yNHOx/QnwqPTcqZX1bRF6SKCCkWeO8fuP+11wWuLgCYc/fGaplYWbiNiLuPBJomuXfO4g2wmY6lvXzXyjm69/WVdvx+EUqwrzfmywYA0Kefg6Y2v6Oot3f10TRB2wBU9Q09rZytXMAjmBY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bUt5/OKG1ppyXg7nDFMSA3ljImnDmigGhDrxysINh1WCAA1U8i7mhsC4pzbb?=
 =?us-ascii?Q?YiF4mcD3ZC4wP9tgP6SAGzpta0YmIRFKCf3Nq/nXDtQWyuHlcU+aGjawwLgA?=
 =?us-ascii?Q?+xe/Qo508UGpIkBSam0jyr/J4pm7tfkZI1aPWmVqqSt4saLccWbwRe6BF76O?=
 =?us-ascii?Q?e2Jn2+S3e7wF+0NG6+A6wbAx2nlvxnlJZ6jTmOOTtw8gdHbponQisyAu2oj9?=
 =?us-ascii?Q?C3gsz4o/aKrVLvP8o7cW3FUC60Z1Nd0fxkv51Tm1YToNDc5A8xILxlZedFKi?=
 =?us-ascii?Q?nKdfGCY3MhR9/JXR6QL9V692NSqJtvQt/jT5lN1zlGo3Wupuh26IG1RQAsrD?=
 =?us-ascii?Q?Jx0Vaf/4C0BYNS1pVD4gIZD4KWTKm2eS/lLinbihqNQJQzC1yW0fSQ7T+Wf4?=
 =?us-ascii?Q?Wby/eexMR98sFJ3OJNpyj3OAHE54ZjMCazAkOUBSttryDE90a9PaHaQxBm2Q?=
 =?us-ascii?Q?PrxojI8OefwnfnHxV5vjg/VpjHEDN5g52ejeDUxZ5iLeOokZkHuyy2SYeAYY?=
 =?us-ascii?Q?AnQbIpLPBXJjxEen/jOiPY34BBrKKb/l5bcf3ybygIbBZU8WtLHIMOwLpI56?=
 =?us-ascii?Q?gQAbfHrgGmoGvb5srueL6D2KYhIRjflDI5U0OR5RCxLt0zYwVuL9QFPgp4+9?=
 =?us-ascii?Q?sYQDYvLGPyTEAyV8l+PrslhmpG+e36vzBwYtx2L90MHIAOoWNZeKPDlnFZm4?=
 =?us-ascii?Q?0D7t9cbm4i+nEhXOFX8MkEstvvtzif+PO+I5nflBza0jcq9vCQo8wvx92Kqe?=
 =?us-ascii?Q?uB8bpgvCCRw3VOAc/7BCD9obyc2XNXXMUxi9+Vpk6TcsO2V/VXETAbNY128y?=
 =?us-ascii?Q?79BsBRehQ9qA1N6WnDMM3qcWp5st0MTTfxuXjK8XImo01YvbX8bEBFIgGyPt?=
 =?us-ascii?Q?lsjxEaSUtfVSQXkE70+eCc981QB5n3XBggXl2gWaAEQWFxLf/MeBX3UuP3L1?=
 =?us-ascii?Q?C1Kkimg6iliUDwM5HowwyquWPJ6hy4w/tx5j9y5YscikMOVhwQyIOvyyzcLK?=
 =?us-ascii?Q?gXehmpCsZOfBh8Yc2NcLw0A0SMeROxNNds0+QSjJpopb7EsAYX3+xzBvS7Bc?=
 =?us-ascii?Q?mr8ZeVQlYxh5Kk9WUawCKnqHFKM8N5LIwI/qUodsd97gl2U0vutVQtbRs2Z9?=
 =?us-ascii?Q?M07Ouw/3wRUT/SX6MosXI2naD6+5NN+ARztBbb8KNI5RN7lkSVoo8WL3a0RS?=
 =?us-ascii?Q?uJwffdWAimxJzetLt25F1UFB7Z5khCK33LuH+OXyxzOIhNnlzLDo5rOj1pGf?=
 =?us-ascii?Q?IF3jJtOKfW5QGyxrkzMloUZzd636K5yiofUmrMQtKTNFyoX8D7Jbru9RzagU?=
 =?us-ascii?Q?ZNmOYc5q6MPeKs43spyuLk1EXnHbKn5Ll9k3Zp6R3lu6FDOu7LqRNhg2xqW2?=
 =?us-ascii?Q?6KiOSQE+pTJFGiVOcXBV+J9rsTE6siD90UNufTGzxfAiKGGqPFd2AKWQ2J4U?=
 =?us-ascii?Q?n8ysp6T0KnBA+UmZqjGEft5GbpB6PMJAil++En5utvoLhDe/3kiZt4iclL2a?=
 =?us-ascii?Q?Gi7z25i/gER5NuBKeI9LsWR1r5WlTOfAdF1VX7RFkSxqFbygjiJS6OmXwz5T?=
 =?us-ascii?Q?BdSo9TtHUnIxl05+ch9Kfk9UDuMiJG4Sp174Q08ildBcR9q716l4oLAQYbFV?=
 =?us-ascii?Q?fzIyf+PHGi+JMKSgitsFk97gqq9ovQdiDYdFeTbtlpofm4ehahXXkagI2GU+?=
 =?us-ascii?Q?R10DrsbWStFNwhD6FGhv7i1aLt/+cGjVwywpADat5G/uKsqnoI8Tqq4ON3R9?=
 =?us-ascii?Q?grK7kN1Rod5CAbaYz08nLvk3VLS7O4qnhBWPdK0rNxtLjENzY1tp?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 98e9b8ea-85cd-4d87-c710-08dea1e38c8a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 09:26:22.1620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQu8XBmnWnHPIgfMX0frMjxnd8HvoHtsEOe1w+yOqTPmqf/eWvExZlP6jxTilOce59Nvbo/w9wGuMa6S/zr1b40Dx2KeXETKZ4ISD7FpnAXxQBpDYJ1PnqTfrGHAc4SA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1959
X-Rspamd-Queue-Id: 3645B45C316
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,foss.st.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-59508-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:mid]

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- vflip/hflip control support
- Test pattern control support.
- Dynamic mode configuration (e.g. up to 1920 x 1080 @ 30 fps, SBGGR10)

The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.

v4l2-compliance 1.31.0-5387, 64 bits, 64-bit time_t
v4l2-compliance SHA: 5508bc4301ac 2025-08-25 08:14:22

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 7.0.0
        Capabilities     : 0x00000000
        Client Capabilities: 0x0000000000000002
interval-uses-which
Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 12 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)
        test blocking wait: OK (Not Supported)

Total for device /dev/v4l-subdev3: 46, Succeeded: 46, Failed: 0, Warnings: 0

V2 -> V3

Patch 1/3:
- Drop the fixed data-lanes property, as the sensor supports only a 2-lane MIPI interface.

Patch 2/3:
- Use regmap paging features for page selection.
- Use sd instead of _sd.
- Remove an extra blank line.
- Remove hblank control, as it is not used to set hblank on this sensor.
- Remove an unnecessary error check.
- Reduce the scope of the ret variable in os02g10_set_pad_format().
- Rely on the control value for link_freq_index.
- Call os02g10_parse_endpoint() before initializing regulators, GPIOs, and the clock in probe().

Add new Patch 3/3:
- Add dynamic mode configuration instead of using a hardcoded specific mode, as suggested by Laurent.

V1 -> V2

patch 1/2:
- Corrected $id to ovti,os02g10.yaml
- Fixed data-lanes property structure to use proper items format

patch 2/2:
- Mode-specific register writes handled dynamically.
- Moved page 2 registers into a dedicated page 2 block.
- Used pm_runtime_get_if_active() in set_ctrls.
- Resolved negative hblank issue.
- Improved error messages in disable_stream.
- Updated V4L2_SEL_TGT_CROP and V4L2_SEL_TGT_CROP_BOUNDS.
- Added my name to the author list.

Elgin Perumbilly (2):
  dt-bindings: media: i2c: Add os02g10 sensor
  media: i2c: add os02g10 image sensor driver

Tarang Raval (1):
  media: i2c: os02g10: implement crop handling with set_selection

 .../bindings/media/i2c/ovti,os02g10.yaml      |  91 ++
 MAINTAINERS                                   |   8 +
 drivers/media/i2c/Kconfig                     |  10 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/os02g10.c                   | 989 ++++++++++++++++++
 5 files changed, 1099 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
 create mode 100644 drivers/media/i2c/os02g10.c

--
2.34.1


