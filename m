Return-Path: <linux-media+bounces-62729-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBJVA0+TFGowOgcAu9opvQ
	(envelope-from <linux-media+bounces-62729-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 20:22:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3E65CD9BC
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 20:22:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4E9D3023E0C
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2026 18:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2BDA336EC5;
	Mon, 25 May 2026 18:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DwlgeeVH"
X-Original-To: linux-media@vger.kernel.org
Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011008.outbound.protection.outlook.com [52.101.62.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6DA345CB2;
	Mon, 25 May 2026 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779733310; cv=fail; b=W8x9mg9ZKt9io1lcNpbRfWibg+iurhloXDKuGYf1kU2rGWuvRZgkvF6ywyhK4FvkcT7VUNVLcEEJ3vjF1HVSek39dqIP4+FrWnKljMYzCD8R7BrKEtaITkLOq7rKLG+5aQJ7oi8x1CKZZYZVn2ar81B/rEFpG2FJFaU2/d9j4p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779733310; c=relaxed/simple;
	bh=XSYIisLjky2cafe9sDPEfoKJDWVYN086VmZAM5rkicY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C09KXUwkKTmNMsgeF4RHfreiMPyA1RSlUJRz5DZsRaexS8WFW1tuibhcnoh0QT9sBM3Feg57Q6MVYfXp6GQyUwtJlFHxaO7w0yACqeO7TPQwrxNK/0uITb/3zVr4u5x3syaOXSD/h1r+SEDx0HHnC2cTM7lvU7keqLocFnWrqe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DwlgeeVH; arc=fail smtp.client-ip=52.101.62.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/rzs9Mjn7XYZimgskeG63xu4o/XCLw0RA9wGrdnqqY0m88/hbT05VCaPqVsbL5/+I5fWorriddSZN67JMAFXq/aK3vakh7aCsgaumRw5+cln/zYHT8dlmucR3b2K7jlZnSIfpGmb8kYd5TWM/w3ygff33QOu0TQoC3G/s1rgBebBF/3qR0A5hyZ8XptypZnatZL0kHre7+exB+cLa/6+6BJSXWyYtCO92RdM3F0X7MRzvxdg8Ncpl3XSEFxCGYxcGMCR7O3/fA2TK/Ws6DJ9yTIG99uNmqSkbJMZINAeLxFGcWxDu8YP+CyziS/ZIWCk8tMkKMv9fSTC0FJGlhepA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q06Je9sQ1PTKEZd4t5QQWIj2VJK7mOmdweTFayf0Wmg=;
 b=YmL0b3kiQPP9wnG0ejqTG2sBjKh6aY3GXaKgbX+pZsvjOcF9RZLAsgVQzjZkiN3B2Qd3ZEWyqDFJzcRozAOqc35e8ME8d+NkcidMndc3rC6wANX1akJHCHOGLjAiGJydc1YtKcZAFSJSSy+Lw/nlfNkUjXKG3H5WaXCnfh77I58oiwZ58Elwd9PSnpttmMX8dy5y0X0VT9p8088AV8Z34vNjn+fEYSD6ekWvgx3AEBdXl430a5b6oEacX+KofyGbwsP6TS3/MaGPHdl8k84AioWNQpDL7144c2LaaLlCA/sNY2gYN1/lPf2tlBCZNNjAOiAlyFPA56ODlSLjGoQysw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=ideasonboard.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q06Je9sQ1PTKEZd4t5QQWIj2VJK7mOmdweTFayf0Wmg=;
 b=DwlgeeVHt6V/PC/ue/g0u8776U4LW5Miyr7/5eRsdWyRB3bON0/TLC5z+o/b79012pVkeXRF8VoMg1Zqv+lw1rNUY1aXxOMXfQG2TslaWj/5DVG2vbqJE6NdjovrrS3AfyE8GI39gJO2DQFOGf95npXVjyhL6FBDFTndmtf9skOC2dIEvo6wsfMPtjMGB6LlYa22DAYJcJTzfsiPNNiXHNXLgCaN73NdtFPtr//aCpvK5UZvVwG0FG4ko5MoPW3FmwuNyhNPbliCMJqYiKt6VL0uDNMwABoLo0AN26OFo2BQc/zO/CyELF/LRpnuDfMvBCTNNSk6ME+X0xmXfXrrDg==
Received: from PH8P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:2d8::11)
 by SJ2PR12MB8111.namprd12.prod.outlook.com (2603:10b6:a03:4fe::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Mon, 25 May
 2026 18:21:43 +0000
Received: from CY4PEPF0000E9D1.namprd03.prod.outlook.com
 (2603:10b6:510:2d8:cafe::a9) by PH8P221CA0023.outlook.office365.com
 (2603:10b6:510:2d8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.20 via Frontend Transport; Mon, 25
 May 2026 18:21:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9D1.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.71.7 via Frontend Transport; Mon, 25 May 2026 18:21:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 25 May
 2026 11:21:32 -0700
Received: from build-henryl-noble-20260506.internal (10.126.231.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Mon, 25 May 2026 11:21:31 -0700
From: Henry Lin <henryl@nvidia.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "Mauro Carvalho
 Chehab" <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Henry Lin <henryl@nvidia.com>
Subject: [RFC PATCH 0/1] media: uvcvideo: reset interface on bulk stream stop
Date: Mon, 25 May 2026 18:20:27 +0000
Message-ID: <20260525182028.2148267-1-henryl@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D1:EE_|SJ2PR12MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: afb0dbee-cfc3-4d18-8543-08deba8a78cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700016|82310400026|56012099003|11063799006|18002099003|6133799003|13003099007;
X-Microsoft-Antispam-Message-Info:
	JseN0SjamOyHhLoHpFYFMizKG0V1/TdE6MHy6vNHI8F+TfHa+PrBfsaP84+3OhaY4FhUtqXU7mfHOupRQwfpGs3XsBWbzNSOyzJrTvkl2GFBEIGIgjeRQwys+k425YtavPJ/u/51HXB4gNWEt6//S5dsWtCEC0/PTYFSI7exFMSKoDylVhKm+JnkHu0Q7xXWL2PggdbrvTlohMqGMt1MtTyF2toZVBzyxfGs+ZuD5iKLes5DT9nNjKSafKeNSUpL5eVXJKOu5LjinYKe3GHNfyrQ0tr47mYaIV/9tn7JJd/q6LMQK3zoGTmvISmoTSrRfL/SyEnf2nZXmpq6+sDo4Aeqvi/ac9kQbi8+BaDsmi744sjYjBITVEZrP8gg4GYrc/VGhbD/Ty4Dj3xqtRfglJcjjFxVnQg6YYNO8qS9D4WLO/q+rVqzeYLGSbfgK4H8QZhozO8j0VKSVNtGMzMzBeAyZ/TzPbihc5FQRZMXmN0VowDWIrwZjXDIVzivV/30HMFoPLXFac0rWJGYX+1PuDhPOX7P21ttUma6HpXPKuYuV/cjtAYCvvgZ+6QNFPIF3O9j/UYH0U0PCjKbH6Lbk/YFG+BAyNy1Ja+aOdzRUzzK1wR3S8n5LYmN6IukT5jaIdm4oUXusou0ZXHKcvvAENTxbjG34P76dHSh9E9GbDZiqPXaTE7xdqJsOXTIMYB6lFmb6vJBdX7EuE+pxx1SI4SgJ2n4AOi+HUunNjWaWtU=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700016)(82310400026)(56012099003)(11063799006)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	e1Fr0q7crk5PBC0dMAOZJsKvSG8EJ5s8vTsW79lce0jqjRV20FgmPnoRxGgI2VaJ8KuG3JsUzp/iHQVF4Fo7YHwFvaBU+VKd+8UgS2nylvP/fdDZOHpEzEGpTKlFMHXnMI2fNROCFsjbu4P0Q1Qa6dYKem9Z3IXYu3JkgV6ez9fI0uUj96I9tD4nLurFMAWgZtfUN5VEVTZ0I19iLmDrRHF21rLxxIciRoN8z+bOxsY8NOhsR7zRlovdn4MbvZ6DvHoFNUcNO2pFKJnm2QwE8eyxQlNqTE8vdnjdUg5DHigzJuX4acxlBm1cnLtlNGdaC7a670F7Ahdql6idUbu1iFdqKLMZlc06dMcL042fwsC/mAPvEII8QdjVIeo8nR0eq2r99IGIXNcqb1kuhTOGPyWU3MtU24zL37N7ncogbYhEZKaQUGcmc6pdnEbT9hlR
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2026 18:21:42.6876
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afb0dbee-cfc3-4d18-8543-08deba8a78cf
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8111
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62729-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[henryl@nvidia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,spinics.net:url,nvidia.com:mid,Nvidia.com:dkim];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 6F3E65CD9BC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

I would like to revive an old UVC bulk-streaming issue originally reported
by Hans Yang. I am sending this RFC on his behalf for discussion before
submitting a non-RFC patch.

Hans previously proposed making uvcvideo call usb_set_interface(..., 0)
when stopping a bulk-based stream, before clearing halt on the bulk endpoint.
The issue was discussed here:

  https://www.spinics.net/lists/linux-usb/msg171584.html

The current upstream stop path calls usb_set_interface(..., 0) only when the
streaming interface has more than one alternate setting. For single-altsetting
bulk devices, uvcvideo only sends CLEAR_FEATURE(ENDPOINT_HALT) to the bulk
endpoint.

The patch in this RFC changes uvc_video_stop_streaming() to always call
usb_set_interface(..., 0) to reset the streaming interface first. For
bulk devices, the existing CLEAR_FEATURE(ENDPOINT_HALT) request is still
sent afterwards.

On the affected devices, current upstream stop/start sequence can leave
the next bulk stream failing immediately with transfer errors such as:

  uvcvideo: Non-zero status (-71) in video completion handler.

USB bus traces show that, without usb_set_interface(..., 0), the host
continues the next bulk stream with the previous stream's sequence state,
while the device expects the new stream to start from the initial sequence
state. With usb_set_interface(..., 0), the host and device sequence states
match again and repeated stop/start cycles complete successfully.

The affected devices we have seen include:

  - ID 8086:0b07 Intel Corp. RealSense D435
  - ID 2560:c1d0 e-con Systems See3CAM_CU130
  - ID 2b03:f582 STEREOLABS ZED camera

I understand that the earlier discussion raised two important concerns:

  1. Whether this should be fixed in uvcvideo or lower in the USB/xHCI stack,
     since CLEAR_FEATURE(ENDPOINT_HALT) should normally reset the endpoint
     halt condition and data toggle/sequence state.

  2. Whether calling usb_set_interface(..., 0) for single-altsetting bulk UVC
     devices could regress existing devices.

For the first point, my understanding is that the kernel helper
usb_set_interface(..., 0) issues SET_INTERFACE and lets the USB core
reinitialize the endpoints for the selected alternate setting, including their
data toggle/sequence state. The traces suggest that, in this stop/start path,
CLEAR_FEATURE(ENDPOINT_HALT) alone is not enough to make the host and device
restart the next bulk stream from the same sequence state. The additional
usb_set_interface(..., 0) call makes repeated stop/start cycles reliable on
the affected hardware.

For the second point, I can provide before/after test results from the
affected hardware listed above. I can also test a quirk-based version if that
would be preferred over changing the generic bulk-stream stop path.

I would appreciate guidance on whether this one-patch RFC is the preferred
direction, or whether upstream would prefer a UVC quirk-based change for the
affected devices listed above.

Thanks,
Henry

