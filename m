Return-Path: <linux-media+bounces-58719-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OG69HikA3mkRmAkAu9opvQ
	(envelope-from <linux-media+bounces-58719-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:51:53 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA83F787A
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 10:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9293A301DB8C
	for <lists+linux-media@lfdr.de>; Tue, 14 Apr 2026 08:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325D43B6C03;
	Tue, 14 Apr 2026 08:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="G3RYz/qZ"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021096.outbound.protection.outlook.com [40.107.51.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93C6296BDC;
	Tue, 14 Apr 2026 08:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156648; cv=fail; b=kmaLh9jHjyKI8TloA77vsLB70soTPJtVpRhQN1USCpuG5HdEyrPbDAcZww264Lm5tW/Y4PzcA7wJ2n7jr5lAy2hsf59p5ttQziV7da+lWK947+vqj5FAW1+vZjAn+mHt7X8Tt83xxTtIRmZwsSaTvqsMkJ898fvhGDeq/FgBvwA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156648; c=relaxed/simple;
	bh=hKPIR5l/bg7EKzPkUMf9KQn+KBDLqki6ByigRx+tmJw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=XTFvbNwXg3ZWf7GCdA5340VI9AfqdVXJpfcPow4eaNODFiVUFewXsSy8B4pKWCeRrCZjCZX5/RdBA9u8QXQW2YBWicEJWrcTsQ5dCkcbOyQDGH1QyqB9CFzR1Wcz/08VS7OhHHdWTyFP0vSwzrrDMsIe9SvXKiUCMS681AOObh4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=G3RYz/qZ; arc=fail smtp.client-ip=40.107.51.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vh8JV8A901qiQHjCsgl8JyZbFmAcx3uiP48NerIZsRP8b/nQzzBenhmmc8Jj+tvWNFnTpvYB/Skgv1cbzuYaSQKiH16rZtU1XAEhzua+FTpATrc0lNmpyL5xfXewtx+IwwpIVrIFQRVTHVlVwLzXN6smFY9BZ12zZ9MV88dKPhGF+qhUF1K5bi16ldUt5GQMIdhKN+sncNTycgBNnrIc2WpanL8g+C6QgUOC9eHja5TqEeUWERA0IEXHLv6ysHTYK41sLfL6a1LhNabPavQK9Sf3spxCGl6zeKJgyh+xXlDlrSW1izNvibBELzgVPpPWZu1+WrL5sEJtA/khFIkQnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIrq1rqAvgC6u1CgaCcpimRTwydXfBAJ/JVFxErYOPY=;
 b=lx5Y/w1poivlBLSRU3LUasAJ4tTCh8w+G/Ybj7AdZGeIKCJf1A3BSQH2nt/Ug4MGbviLUKaBwAqeiXyUwYkgBf/cLuxegTuCmcLpaeT7/IgYw5ayNSWq7vdBLS0/lhXatEErnJPi2gICKt1hZYTUe2cmpYYVtjdAt0OS+7vSc0T7EYKd/MRoKjG1s6acNw1RorZgGB176zc8V4Wr0daDlIQ5GlC9kJBiONmv6ePynE8weYTWT9kVZfPlEAiFdL6Qtii20ZsnS/G9A6AbLNIJjTC8crxfKRBtZCoSw6GVZcW9lKGqoZfvp13Sf4WIYt06EF2CW79mr9P9VxX1rf/IcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIrq1rqAvgC6u1CgaCcpimRTwydXfBAJ/JVFxErYOPY=;
 b=G3RYz/qZ9DZKYDjgkc3hOs0WRFxU6pXdHSdmIV7EdPeRtZP2PR1Gwgdz5RhkRH5xUt4incLjw6JT8ZY/TZZLpAPGvcdGyfSqxmz3MkQqFjA1THok6DxXv2zEKRFcEjdLmUkHtHqzmgNn3cfJU/bLrVnP7FF23eDFUwrxOizqGCjq9h8nO0WjQpDQIV9PTZphaLmi0Q0R+DPKSlqkkE35C3iznYtUyw6Aipw8+RVA1WvIBmiyBTYrPgL5QmL5bebwtKgp4F7LuexVCJXt0zcjvegGM94gB5Co6GhVRL1cz5+G5XOqqzTi3ZVismAeBblVbrMcQ6vG5vjGsjcZ2bL/BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by MAUP287MB5036.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 08:50:43 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%3]) with mapi id 15.20.9769.046; Tue, 14 Apr 2026
 08:50:42 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	tarang.raval@siliconsignals.io
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: Add os02g10 camera sensor driver
Date: Tue, 14 Apr 2026 14:19:43 +0530
Message-Id: <20260414084952.217215-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0231.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::7) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|MAUP287MB5036:EE_
X-MS-Office365-Filtering-Correlation-Id: 87597d41-0608-40f9-8046-08de9a02e8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|7416014|376014|366016|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ec2tWsyH8LWKZwYWuA+jS99JCQpntcZBjAaT/CSaOyVIyHYjkLY5YTyOKIcGx4sTUl6tZz0QR3euR9EMOrG5gLmcwv0NQIoKaq5wGIdqdH8MR7YOM5zJiF/HVDgFw90JxDJKOVfYMuAOYiyvCu3WxUlY4p1Ul37LTchiMp1Mq1CqzvHtmnZZ6PmUbk9sxVLqATdGDOOeKG5EmizpfPVEDREAAtJ2ymLJk3TrLrN+ZhZ2x4Ym9GinD9ie3sloi2HWVCOyAgGFmPSnjNFB1YpkR0suK98O4CCNdUcLMUdYNepiDEGSxrwFC/tZWvSjkSXhDjqVmQQr6+KOFv8er3coBFLWxCpExCGY9j09itdkXu3OteavAK6qhxZXM/GJ3xny6pEhG6HriSb8F1ja7F9FGHlUaKLzK+B4l/m4X0qtgQm8VtDJ7WF2C+/E50RHSkbYz7UJIwA0T2Vk3ydWvOIMbvnsMLYjVi993JmfZB7w9mJiWiFS0p1CwF4tK43e+mjlVVAtJyRz7C5I17PUt198Za0puaqtmBOMjulsaD+uykRtrsS3ddZvhsu0fTrI9ZVQbK0/GPTGS4n3MtSmQ6JTNayHq3W/SfcRnQykm8oGpgQ3rS3YMiY0wxlV21G4i2CgabJxRkO1OoKwyx+mmaQ8rJKZQp7/SwS6c073eYytQmSJUiNzY+VzoL+KwUjaYYz2M5flINDUVyJ+YYv4GmXH4UtERJtKEUBQAVzkgtIP3EaOWyaURm/JBLH8UO5GcOH65G0sTImuFuPOfbZSKN9+m9s4r/wYqhUOqpvK61ZxdhQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(7416014)(376014)(366016)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NQFhTyW00wLzfj/JBFizQEt/p8Y/L48SzZdB2XV5q/qUgRRaUb7+QbRvBd0C?=
 =?us-ascii?Q?DK5oYEFC97MtaWSNZNfc7Q3dc/1LsucYOgeOxL2q2JHkM0Orc0pMzeVqaWc6?=
 =?us-ascii?Q?Vw7s01kLAPoPj1GvStUoiGfW+q+o+dJJn8Kx/UzNCu4y7iwLlh22RrgUUtpW?=
 =?us-ascii?Q?mNoZRsAoWz58hXOkPdr4g4z82VuztY4IAvY9mUs4gIlkKYKjYXSR31QgAPpy?=
 =?us-ascii?Q?Y82HtwZOgHBhGrTy3cuiYB0QQo3RoBI7lKAXKYQ7Lm1xkviJZQV86j1agyjc?=
 =?us-ascii?Q?EotL+SLKippP12AMZtnS87UPnykkP5ylyOBox47j3enc9ejVeSZI0RAU8oFK?=
 =?us-ascii?Q?q5vtcf6SkQQjXtgbmWQPywNxH2sn49Sd3Y4bd9jdxpU+5f8u33PBzTMYyw4b?=
 =?us-ascii?Q?MXRmVYWr0Rn1XK4v/Ru5ukkTmKcDn4gpkWNiIKjCoG5JUhojGJM4hdMBLW2k?=
 =?us-ascii?Q?kAzOWiFZcaD1MKVHaBltinwN8Zvu5CDOS4xJ+/xVAPb/UQIxHCvw8emoT1Kz?=
 =?us-ascii?Q?2cV6C8jj0VBLJfkZH+JcDydVledfjyBt2xGuGmASxa9UtjT3nTvhVUCcsMuR?=
 =?us-ascii?Q?o0eqFjawGc/1gV2EX6YAzJLqppXXQmxasdA+ghEpy8D0zb3oAfvQCsTr5AyQ?=
 =?us-ascii?Q?kDg2UGgem0ZXLdPM9eFvJ62F/bg6JRVR8RRW7+RlT6kuU01hCr9fLI4b3YHX?=
 =?us-ascii?Q?K/fiECNKrCWwjSl8Wne4w7Jt5bJbuHHsFEA04+Fqw/WpS+2EVcRzELwTqoP+?=
 =?us-ascii?Q?UV61pdfsBldHGvCb0ZbwzsKhtsIzo2i+VdFOFbFs7IT00TWFU8erNRkr7PRZ?=
 =?us-ascii?Q?pFjvvWZsFZ1VnYVTKV/UocUSTBac6yKlMXwjg2WzQOvVDPb2l07w1GgfI6mm?=
 =?us-ascii?Q?PazAafzYUftRtFCnBdrGRhOigu6uoY9fdkNABHmzUAqVhHSFsVM3TIOZEEGQ?=
 =?us-ascii?Q?mWoJ86X4oYS4aIKsO1v0I9JTDAr8VhruYZwRKhODQ034ukY+PhjSUyPNJQ6l?=
 =?us-ascii?Q?YWvuhRWdnN99BYsWp/LuO73cEhAGeaqgzbdEVKMo3NtDjVEjC1G0XtM7s4Pq?=
 =?us-ascii?Q?3saSoBtMo4IpBNZZ8uBlmHnTJSsz0JsL/fzlSA4eC4l6LGr+oetV710QHWN5?=
 =?us-ascii?Q?lSTDwujVts47iLk0SH9jcnQTtLiOA7o1pB5Cw+B5e82cFucGFzCMat9SmS+6?=
 =?us-ascii?Q?6+RunHRUBRnNsw4VVcQk5emqy03sPPhRlvEYQu9CdxKTpRexdz8EZdCed4lI?=
 =?us-ascii?Q?o5V40JVhw5BvVuSak9brgzB9Jj7CokcYg/wFCMuWc9rDr5CzXxG6Z2Spx8p+?=
 =?us-ascii?Q?DksQ3e1Awhg/GTlHuGj/adlyZ5RouGS8muD7WWeD7VrgXGJKyhgGHbAvamQU?=
 =?us-ascii?Q?SZc5Fyn1BVHoiZ23gzEgNS9xL+xZmmfoQrV6uo/mYQjL5PeOMA+o4+jry1QY?=
 =?us-ascii?Q?W73ntIlA+KsqLMQkZYwCbbTymyKhvJ5ysmKi+AQLbeGw40TEnBwBQzJcsWw/?=
 =?us-ascii?Q?g3xZpHOo1SL/ULTrUND5mL74uIk3NvzRABH72dKmQr14pb9nXObOXH/rJ/aN?=
 =?us-ascii?Q?FozcKwRNLx18DdroUYVa4tN/hDSQo/1oW5Yy/kT1eodMD23DSycx/mUSpUvY?=
 =?us-ascii?Q?dWQoYvHKHDOOUM6tdGSHAJo7BEJVzv1Uo95n5yOjshwGlLRnDwdHbNO9tCmc?=
 =?us-ascii?Q?Yuf/G4EGcOAkTYIXiZwW0eHZZDPYDoM9YPUdQOmAxrVK0zrxVhI0pKBn3V/6?=
 =?us-ascii?Q?MwWIqPzGSg9BwXWYTsZqWVDxBpAlRa1Pc0w64G4o1KkHwKIl7Gif?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 87597d41-0608-40f9-8046-08de9a02e8f8
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 08:50:42.3763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dteHKlZ9vBFNZ1xU3Ecuhy05krAm7yDLMEc3I8cKSeRFWMeU2jafCZKCEzQcYgZPmdgvdNR+vgGcvDiZkIi5W1TPpsOpIevcOjktninB8av9uJPfkYRsLR2WvA6s0+A+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAUP287MB5036
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,foss.st.com,intel.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-58719-lists,linux-media=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imx8mp-debix:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:mid]
X-Rspamd-Queue-Id: C3AA83F787A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- vflip/hflip control support
- Test pattern control support.
- Supported resolution: 1920 x 1080 @ 30fps (SBGGR10).

The driver is tested on mainline branch v7.0-rc2 on IMX8MP Debix Model a.

debix@imx8mp-debix:~$ v4l2-compliance -d /dev/v4l-subdev3
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
        Standard Controls: 13 Private Controls: 0

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


V1 -> V2
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

 .../bindings/media/i2c/ovti,os02g10.yaml      |   96 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/os02g10.c                   | 1039 +++++++++++++++++
 5 files changed, 1154 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os02g10.yaml
 create mode 100644 drivers/media/i2c/os02g10.c

--
2.34.1


