Return-Path: <linux-media+bounces-65659-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qLefIvNGPWqw0ggAu9opvQ
	(envelope-from <linux-media+bounces-65659-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 17:19:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C0D6C700C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 17:19:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ti.com header.s=proofpoint-05-2026 header.b=XV2lxphc;
	dkim=pass header.d=ti.com header.s=selector1 header.b="FQbxVB/f";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65659-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65659-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=ti.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9F5FD3047404
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2026 15:19:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEB643E833E;
	Thu, 25 Jun 2026 15:19:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2D9146D53;
	Thu, 25 Jun 2026 15:19:05 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782400747; cv=fail; b=YmedjVii6wyfOox31ZXjSuVMfFN3Bvy89Iz4VwgOEjRxqxvbOQvy5OSFiEREqL2aMBkupIjBtI6uDvH5FfQEi+LbVDOjNNozkNzdwcQ5Icf+lHSTLUWmlL+1j1c/xONLBrcdSUXu8os5VSXdTgH7Ksi3q1F6QRaKpKFAOE08DCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782400747; c=relaxed/simple;
	bh=qdIekHcWcYzPXVIToMpigsTkWLUxy714aGv3zm8EEac=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rURBw+3zTo1Lw6CUg78SdZEDnL/JJ3wuf9/nkamJ6Dlc/KvL6AIjhbGUHYMvtSQ1sWfgw7L/BY9uYJSgCv874/IiOzaXMR9uaP1ByoBflOedXFnw/6RB5X7oZ4hME7YfOL/9APza6zTtuV5RF9osSRg2nYs+V2B3NCFZeVVsi5k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=XV2lxphc; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=FQbxVB/f; arc=fail smtp.client-ip=148.163.150.75
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65P9KO712642531;
	Thu, 25 Jun 2026 10:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=D23yk6f06LsBtvYOQNwalJixo+BtZBYF0dOb9sI3A
	Ss=; b=XV2lxphcmUgI4lDbiNMs2yhy2eh1LFIp/N7VgSmZYEsfHeN3eCtSX5wKp
	5qvsUx8dc/RuZ5g42QLDMWs37sWCZ6fu2L8LdYmArhie5IdBsuyNGauGQJyowj3c
	E0K6CHEc1BZ2cviDMey62TF2xsEkGUPGsrmKCUP+vjqMumEO6TU8EThWH0Ea+Pcq
	PJIsLrbZMuKM6prFEbmeH5KzULEdDAS110mg/LLT8amc0GbrSZqprmmjJG7VYgK/
	Qsw29e0zCqcWpvpijfjNLqIPi3Em9Vow4Q/AN86LDkqatPcCePSeG6f8x3lFzJa+
	5R+haUCZVAMhMA3slCRbUbIc5Nqyg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f11m4sup9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 10:19:00 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EcegfD/M3nSSQaeOHA4gY800OccjzS3Qj/Zmf8gocYODQEwCb1OvHzrsS3LGfBj2Zplfyn80MUC6Ht90+uVFjSOnB6c6j/U77LhKwCIqknwNrBFps7e89n7LDaquoZfbsuV0dz2kKCuAFwajs24trM9xT1RCV2cMNhbH0qC4MIN54iYxL4yCtQFTxpNt+m+UB8J3DJ3mr5x33i6tiFLTLYEM8Jjp7Ox2rUr0/GqC6wyf4XDwC96JXebR+OtOPKoA4GSaPcYVCtdDMF17EJLcBdf2sHwSPEr+HfyhIL6wLCyri7nSh7bbFyolIyugpWCMEqtnIwjk5gtTY9wbp2l97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D23yk6f06LsBtvYOQNwalJixo+BtZBYF0dOb9sI3ASs=;
 b=KmVVZBQXs2eZHDrmvGQrAyxZZzl3BJk5AXYtGK+XjtgS1xd0jXxlpTl4OiQpS8+VOUUd/xXWDX/hvhllPKwuhOzVuuiIoYuw6+wvQkg4uSevd4MfObOqdOBErf5PZ7GFUA6QA8PNc3u5LtnYl6suXma5N1W2j4zdWZDtxSEtunaL3Qc5w1N+A2ieCRFvReuuzjFnb6ztzjzvPKCtBU0ymo6IAQi9WauIrOkqhhNUrqcQ3qm5DAhc60SSmiyBmQ7iMeLLFSRT4TNYXPOYAX3ygdqCwFjvfHrLdKeZ2wwF/Du2tFNNSyER1u9uIDz/MDIUJYPiyABXJny4wLbeiMk7Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D23yk6f06LsBtvYOQNwalJixo+BtZBYF0dOb9sI3ASs=;
 b=FQbxVB/f3IDtilgjWhZfuE9qDRgWObuQX+uxolsd6ODlrjcEvS8K6qXCg9M8AUaD0TEVGFmtmkLd9DvDKkw8T+ghPkdki2r3U36uZSHFUkdn94OsST+ppvqjONzaZZF6W8bJVSBgLcrpMN0YyC4hksAwycalYa/MeJ6u09sKdj8=
Received: from CH2PR11CA0026.namprd11.prod.outlook.com (2603:10b6:610:54::36)
 by IA0PR10MB6745.namprd10.prod.outlook.com (2603:10b6:208:43f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Thu, 25 Jun
 2026 15:18:56 +0000
Received: from DS3PEPF0000C37C.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::17) by CH2PR11CA0026.outlook.office365.com
 (2603:10b6:610:54::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Thu,
 25 Jun 2026 15:18:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DS3PEPF0000C37C.mail.protection.outlook.com (10.167.23.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 25 Jun 2026 15:18:54 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:18:13 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Thu, 25 Jun
 2026 10:18:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Thu, 25 Jun 2026 10:18:13 -0500
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65PFI1gA3012270;
	Thu, 25 Jun 2026 10:18:10 -0500
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <mchehab@kernel.org>, <mripard@kernel.org>, <jai.luthra@linux.dev>,
        <sakari.ailus@linux.intel.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <r-donadkar@ti.com>, <devarsht@ti.com>, <u-kumar1@ti.com>
Subject: [PATCH 2/2] media: cadence: csi2rx: Support RAW12 bayer formats
Date: Thu, 25 Jun 2026 20:47:56 +0530
Message-ID: <20260625151756.221096-3-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260625151756.221096-1-y-abhilashchandra@ti.com>
References: <20260625151756.221096-1-y-abhilashchandra@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37C:EE_|IA0PR10MB6745:EE_
X-MS-Office365-Filtering-Correlation-Id: 575826f2-6b27-45c0-d90a-08ded2cd11f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|36860700016|82310400026|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	BUPb9gcL1CdtfJsZ1gV6UuQ4LhqykAX0ToZpSrX0lN6UEL5UKRTwosWWWboSoMTMJME1zuYp3uaGuisGVgfJx/I2TuM6NARYSJlgzJZCSs2JvGeiQfI/o/uL/CF0Kr/RP7nraX+YDnPyhbqG+TumtUv/Mpj4kyrOQF3kTw7o3G90xRgBdGIokyMr95KWarKQZIzFuvEqLM9LV+POe5nVOulHfr1s2li9V3NmGjT6cLgXB/xZ5HoelWLlztULFKmX7PpzYU0rHIObWcuB8TlpHXxXqTpjVmuPjfC09NVVqT9CD38UviJaFTFz19HEoROaNj145K5AZuPS7OX7fT1Kje2Gu/YMhgOmOUp9+aKp3e1pllQfdznrFY8+WcENW3wdvAu2JOy2HE4iTtVKSnD51MrJEt90NJKS+TwQMK1JPDPtX3rKfO2tuHgkZymCuV1c2gNzgIXf/RxB+Jw0hhCSiA/nnbIQf3n3AFBy03AXhIasiqCLU1QJT5Ge6O4ZtceBf0FLcjxYqn4igiAP9bgq6K3jLbrCawATh8OPmeb0FlJwR4z8BKGdxqFPkggYwexy0Zk80WGYXLtdTFealRHAkg5IDJfUnIKlXUfpLdNUN63UyG3yo7UvPj8P5ow0PoHCSybPO9pfpBOhwIfVeE4e+jZneq7Agsp5eZ5mVC4sbL9j1XHJar9KWeMQ/OKeXpOhyPbuqGcLjXi0dOehLHNzHQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(36860700016)(82310400026)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lTeL3c0yIAUvBkj1Trk4kpvMCb4oIXv9Vhhg3ytQpy5nhHiNjiZCqPUgH/ISj8tNDDz85P3jcpbEL6+i5ZKfhk1E7+x9GZkp9HxCFJdk3F8mTYKGKXiOHQu9IQ55MKUiOlHsLRSctn4JVtMPoNNBxaVxPn6XE2NsLR6uB8KVQAS/eSCRPoqxtX+55Rl6A83hSjcK6P8p6UdzOUBWW7H2ry+YhQXACVQQOrsZr6vLX2Zuikf6vE066QNti3nZ5+Iv6uvvfJTUlgCiQBCPa65a5uKiEo0ICxoY6dJWKpgLihOeAQzlrnEGR4p81HV2lUaOPmENfg9u5yUSWI8cJBZRXwolLpKaxad+uZCR8WavcOHIKOJsbBGZe6u9UuDD4X6ZcIw/kwpHGLs7zMDLdZHdXVXeziBEZe6hlkM/KpUPBJTfBFWvYljEvWoREu5hV+vw
X-Exchange-RoutingPolicyChecked:
	RvLrDEc4MZ8GlobsNlkoI7BKtQe5NilhN+JPi5wZtQayRDC3lSzbHymDWAnseOT0i1dXg9BF2dFUdhv93XktNybaksTHssWdhELoMUYWo9DS0KwIS3gPbKYxX+aSIQRmAcHmnjrthocDe9YmHGpMZGNxehqN3ueeqPi1zlZ828/RCRJjyvE6t3uTEkJuCVwHKIlmtki5kjQDxbKjsKnFNX5u0Asjb2CVH0AttWq99sayVxkIwdvgifdwu8apOY5kwSOnLfYg/tJOCCfTzfr5ZQWPlp/ZWeLo9jNEpQyVzpKbD02/nsbs1binL4QoT8wft8Pn8wwXLmIA7FRkIMPXzQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2026 15:18:54.3657
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 575826f2-6b27-45c0-d90a-08ded2cd11f6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6745
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDEzMSBTYWx0ZWRfX8SjbakvsdYGo
 GDbSo5tiuJu9Cm1WRVNCGVdHNJ4ylBAslZUUjLz8U0Uon4jUb6T6Y7Oohevyig5sRp5gCSzJ7pd
 HsGjJJsxvX4djCSdPOBp2UQJ5azhlfg=
X-Authority-Analysis: v=2.4 cv=TbumcxQh c=1 sm=1 tr=0 ts=6a3d46e4 cx=c_pps
 a=uej8S9duoQdrJ4czObxKNw==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=JXg5cjf7I2CoFG6Bu14A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDEzMSBTYWx0ZWRfX2xmVJA+ojoJK
 qKOh02uNPiu+mQxQSnV6JuziDN2C4uPIdvn9DHNJc0mYZZxmUdAwAfQ7ns4YfTYyGXm83oaKeHq
 5q/VzdwuNjR9aNigMMyN7lSLcDFhOGgQ17bbbQXiQuKUJtVlN2V20PhacbVnMCcxD9iq8Vw1j3c
 ngxqva9nhuqZQltYTBghufkvVDCyJQnHJ3W0E1T/euINSeLHO8AV5vDS6WybUSGwDUVPGgjxxSA
 KYW4my5Y+Ny7iP7yIt9BkDfd9xBa95bUA5xYa/XNraxzFIzVgYsFWvnXt2wTP5JP1bcD0+DhPeO
 p/h9oJe0tMeVnWFTTW794IxLAhk10yAbkhVtRWll1PTTQeUsEVUPlaUk6Q8dwR7Rc9m/mK5gf7q
 ZK2ftdk6JIwd6/I3Q1PaLMq/Yd8QqoW+DGE90oacJlltnL2wLpZz0U7J56TFTyJfujp8Gr2c5l6
 HnkA6NjKPG4yiQZHFtA==
X-Proofpoint-GUID: 4MqDVZ4mYi1pL5yuO9Gg7L0BnvsDhzx2
X-Proofpoint-ORIG-GUID: 4MqDVZ4mYi1pL5yuO9Gg7L0BnvsDhzx2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250131
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.34 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_DKIM_ALLOW(-0.20)[ti.com:s=proofpoint-05-2026,ti.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-65659-lists,linux-media=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:mripard@kernel.org,m:jai.luthra@linux.dev,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:r-donadkar@ti.com,m:devarsht@ti.com,m:u-kumar1@ti.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:dkim,ti.com:email,ti.com:mid,ti.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03C0D6C700C

From: Jai Luthra <j-luthra@ti.com>

Add support for RAW12 bayer formats in the cadence csi2rx driver.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 1ff2d8f78d5b..9e05b3b9ee34 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -166,6 +166,10 @@ static const struct csi2rx_fmt formats[] = {
 	{ .code	= MEDIA_BUS_FMT_SGBRG10_1X10, .bpp = 10, .max_pixels = 2, },
 	{ .code	= MEDIA_BUS_FMT_SGRBG10_1X10, .bpp = 10, .max_pixels = 2, },
 	{ .code	= MEDIA_BUS_FMT_SRGGB10_1X10, .bpp = 10, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_SBGGR12_1X12, .bpp = 12, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_SGBRG12_1X12, .bpp = 12, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_SGRBG12_1X12, .bpp = 12, .max_pixels = 2, },
+	{ .code	= MEDIA_BUS_FMT_SRGGB12_1X12, .bpp = 12, .max_pixels = 2, },
 	{ .code	= MEDIA_BUS_FMT_RGB565_1X16,  .bpp = 16, .max_pixels = 1, },
 	{ .code	= MEDIA_BUS_FMT_RGB888_1X24,  .bpp = 24, .max_pixels = 1, },
 	{ .code	= MEDIA_BUS_FMT_BGR888_1X24,  .bpp = 24, .max_pixels = 1, },
-- 
2.34.1


