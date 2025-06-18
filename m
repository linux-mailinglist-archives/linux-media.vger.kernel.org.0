Return-Path: <linux-media+bounces-35134-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C1DADE679
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 11:20:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 95CF47A90D0
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 09:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D57028032F;
	Wed, 18 Jun 2025 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gvKpW6cJ"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49A38460;
	Wed, 18 Jun 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238424; cv=fail; b=URmbDjSYmKR5EKRfnSlZdom/WTb6KwECnBISppN2iSIp3jad96PxoMy/EZiWQ/d3iRWQytiHQNHIKqx/DDMP6zkPkiwluBz0N0neXJjJBxH3DMkhQj8KR2EPS++G2KW/cIJk+irUX0K+wnJZWYPiqB4Yf4ztTUqfCPdXJtw71jk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238424; c=relaxed/simple;
	bh=ZzG3Rgw05+4fIZxm/IPRQqMeJ5umeS+RtAlRCwx72jM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IrPo8PRxInnGRCaVHWOMCwVoEKGxkDMKXNr2RAaxqh/iPmdM2z+G2aAVC93WyZP/NS0V57Z9cJVRSrNpnf1bRbTKQuXdibkk4eoPMaZpKIXOgoCYrkXnikcX7dHj7lUQl5tVr2XflQ2jD4RDcP8U0NnGqlBP92sw9PFQHi2uxcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gvKpW6cJ; arc=fail smtp.client-ip=40.107.94.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyhLFnvRLWlsMs4svvlMb0GixTHDNFTeBZfiWqBJcGmQ2+usHgFoBBLD9HNn8H7J8dv7X6x0cAj6lGvvxhwLOJW89STzli4J6WheoXcV5kbc7jS0RPUlSoEof/DQVf1ZcgnCsIEkxKB4Oa3vIWLuAkolLRdH8J+TIvAO/NGb2xy8pkRKietBTsRFW+zomLsoiJICNh3Mrbzz3Q/qBNfTmhcI9V3y2QBdjZU5u5JzPxTxWuS7qflx2OHWxIU7aOJO/gVHvNA2W0rBh06Y2XWQwmJEtgFmIuW9O2Pd8VXBrkc1SqH7xraZzS9npFemWdqHJ00WaEwXz0A7aNERUQxRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4dCs+5V9xFTdoAbm3qxNmTFiNNGjWNAQT1RRvRZI/U=;
 b=PUfrcjfr+Tuf+5y9AYimDyMpDENihyeGxuVToE6nBJj/hb69Uh2BSME32k8QjaNtgZgnaSduMFO43G/SrlclYvWJrpFViPeQVc8BQuK+BCY6vMJ/OiyzvqClGgxcL0GFD6xk9xugNmVRWzcCf4lYDwZOVwyfrDCP5rcn7qjEP10ADL18e1U/n89Q0zafiqi6BboM3WfBcTwSniA1vW8pkqXavXNZGDWBrsmZXS84NHEDv/lyTeK5gJuLmCCaAYYMd3uKyiR/mCWADfdLlAH3mm6VlXGkHKPImFkrt23hIshO1PCVrBsj5Hl27lMQKvUCbZN4Kuy6hQKPLUGdAah/JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4dCs+5V9xFTdoAbm3qxNmTFiNNGjWNAQT1RRvRZI/U=;
 b=gvKpW6cJi0M/E4AZAS06YEKhphvH4yTrcGBLJGsaeYN7LWDgX7jvwM+jc1QR0RiulmCMU1cnME01jwAVudvQPBUEde8vGqlwFdEvtOArKWXaDtxd1cnbD/wAgQRB61tobJ6t4JF0JP6DMkjG3GvZ+JwfRJnIIWNX47a2xFe1YMw=
Received: from SJ0PR03CA0033.namprd03.prod.outlook.com (2603:10b6:a03:33e::8)
 by BN7PPF915F74166.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6d9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 18 Jun
 2025 09:20:18 +0000
Received: from SJ1PEPF000023CB.namprd02.prod.outlook.com
 (2603:10b6:a03:33e:cafe::52) by SJ0PR03CA0033.outlook.office365.com
 (2603:10b6:a03:33e::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Wed,
 18 Jun 2025 09:20:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CB.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 09:20:17 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 04:20:13 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <Svetoslav.Stoilov@amd.com>, <bin.du@amd.com>, "Bin
 Du" <Bin.Du@amd.com>
Subject: [PATCH v2 0/8] Add AMD ISP4 driver
Date: Wed, 18 Jun 2025 17:19:51 +0800
Message-ID: <20250618091959.68293-1-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CB:EE_|BN7PPF915F74166:EE_
X-MS-Office365-Filtering-Correlation-Id: ebf53aa0-b773-4864-e4af-08ddae49574d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SO5MRKQzrtAGt6Q0iCmrg1pgz9Fvs+Akxn97qvpMO3ehDvP6iA8kqTsrrir3?=
 =?us-ascii?Q?vLgbCgDZDZj6joS5PXz/AZ5DpJDhKHq2uAjOx12ag1unKl6YDHX3I3onb85k?=
 =?us-ascii?Q?j0lolN73mHWstDVQrgacnitIQgirr5aSM1ai3MWcDXSea3drMT0vKZbf1Dd4?=
 =?us-ascii?Q?K0MPIFjLyCN6p4PAW0grwQDq9VVGSp301vNEuGGi7AbsfT54mOMTuA52e8no?=
 =?us-ascii?Q?gKSEAWHnLh0+BskGpSeY+Ks1OzbXd+NPeVHvmN90oDj2AnQQ/NS/GZPD6Pf2?=
 =?us-ascii?Q?8De1KcPu4dEj5bHQ8u4gyD7CaxkoLwfw+mF3yiMq57pN/uFDZm9vJMGJHs5b?=
 =?us-ascii?Q?iRhl2hJ8yir1yYSsNRvAWhvAB9YUwkbupEMBaw0djoxgUJP9jsNe55TL1uhu?=
 =?us-ascii?Q?FfFO5qJoqMUvAQBu3ZzAebRVuKE3N5OWd0OdgdKmdAAq0Fd+po1J6Z4Rd9nm?=
 =?us-ascii?Q?Nwj16w96yloQM7541m+vcx0UTFD4RO4W+uvXu+8xHYBBxNTSsV1ZjXR2LCs+?=
 =?us-ascii?Q?Z+MPDRFjsF97EHCTqRHc6dJwKzXF/LioCoPOJhZt1x0Rx8uJwfB/8T0aMng/?=
 =?us-ascii?Q?p1UdnkxxrCulgWqeGJo3EwYXeMXzKGbrkM+iQuGk1T/EyBMxBH9vMKJnFigA?=
 =?us-ascii?Q?3pTvKsNgDup1+I8GgeFJKIYg7tzXpwJ/6V+b0mtmMyNeaTHKEY7dqELYW3nc?=
 =?us-ascii?Q?z1VMI/nVb4bxdI8sKiwVsGSaXlOoI6U6U2hKEwO6nMlhhmjXsQSovNxRFA49?=
 =?us-ascii?Q?H5WBKwbUhlSEsyHz9zbHl4liNitpcYL8rrtKmXw+Q/fQ4KiKDudLD0xMP93k?=
 =?us-ascii?Q?dHtqJp36DmmyXFCOWEJZiN9Bd4v/Aecgh0TpwqbvCOXyZ2jLhN/mWQo0jel0?=
 =?us-ascii?Q?T8uPmMqlch1G5B/BLZ+HXK+CNyX5XUwuP3EIlbt7Vr+3oKwkPCyQ8lJDcpvd?=
 =?us-ascii?Q?8z69rSyKyO7MdQrlasKUxsL0yIiZFku/n8h6losifkDwBvFwMseHwAL64Y0d?=
 =?us-ascii?Q?o2ImxPvJ+Dl5vkAa8fSZGTFnmAtG80838jbI5ViILeiYEsTDpzSF9rU9yGQU?=
 =?us-ascii?Q?L6w5IwO5H6UnbjBcTPiJftyh6t2eAK3+SDPG4s0pVxW7VigM9egBbsPDLvZq?=
 =?us-ascii?Q?lg25sHbWnyuCEh6yL4AVnEbfrW/eubfgwDiohsFcrSZ0w+kxb/tMCLItMDQO?=
 =?us-ascii?Q?biHcErZnoDvyh3TgiUak5fBnVslOFjIsx1e/+IX0K4Ztt7agdlwCIviXhTLv?=
 =?us-ascii?Q?grXw29oQyn1uu7sW6Wyl4oh126TAz4Op/0EdqtG7s7RPw4hyPd9+n/uwxczW?=
 =?us-ascii?Q?Cep/6Lyn/UfqmhYwrNz6IDJJKEbowQJy5z795hkXMP6Mlobuxk3s7sFx2ufg?=
 =?us-ascii?Q?qBKCx8Kldjh6lavv0p/FTmLzo08yt8VtvH14NI4sJxzkqAaQS+xjbUN4oT+S?=
 =?us-ascii?Q?jeYV5OGJbM9Y2/LpsDTdUhVpX0CNgQFQRnbz8DqTZz25+RUfP9/0cogg64kZ?=
 =?us-ascii?Q?mUMNBYgSqve0YgE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 09:20:17.5676
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebf53aa0-b773-4864-e4af-08ddae49574d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF915F74166

Hello,

AMD ISP4 is the AMD image processing gen 4 which can be found in HP ZBook Ultra G1a 14 inch Mobile Workstation PC ( Ryzen AI Max 385)
(https://ubuntu.com/certified/202411-36043)
This patch series introduces the initial driver support for the AMD ISP4.

Patch summary:
- Powers up/off and initializes ISP HW
- Configures and kicks off ISP FW
- Interacts with APP using standard V4l2 interface by video node
- Controls ISP HW and interacts with ISP FW to do image processing
- Support enum/set output image format and resolution
- Support queueing buffer from app and dequeueing ISP filled buffer to App
- Starts/stops sensor and mipi csi when camera App starts/stops streaming.
- It supports libcamera ver0.2 SimplePipeline
- It is verified on qv4l2, cheese and qcam
- It is verified together with following patches
	platform/x86: Add AMD ISP platform config for OV05C10 (https://lore.kernel.org/all/20250514215623.522746-1-pratap.nirujogi@amd.com/)
	media: i2c: Add OV05C10 camera sensor driver (https://lore.kernel.org/all/20250408221246.911508-1-pratap.nirujogi@amd.com/)
	pinctrl: amd: isp411: Add amdisp GPIO pinctrl (https://github.com/torvalds/linux/commit/e97435ab09f3ad7b6a588dd7c4e45a96699bbb4a)
	i2c: amd-isp: Add ISP i2c-designware driver (https://github.com/torvalds/linux/commit/d6263c468a761cd4c89887073614394ac48441e1)
	drm/amd/amdgpu: Add GPIO resources required for amdisp (https://gitlab.freedesktop.org/agd5f/linux/-/commit/ad0f5966ed8297aa47b3184192b00b7379ae0758)

AMD ISP4 Key features:
- Processes bayer raw data from the connected sensor and output them to different YUV formats
- Downscale input image to different output image resolution
- Pipeline to do image processing on the input image including demosaic, denoise, 3A, etc

Changes v1 -> v2:
- Fix media CI test errors and valid warnings
- Reduce patch number in the series from 9 to 8 by merging MAINTAINERS adding patch to the first patch
- In patch 5
	- do modification to use remote endpoint instead of local endpoint
	- use link frequency and port number as start phy parameter instead of extra added phy-id and phy-bit-rate property of endpoint

It passes v4l2 compliance test, the test reports for:

(a) ov05c10 device /dev/v4l-subdev0
(b) amd_isp_capture device /dev/video0


Compliance test for device /dev/v4l-subdev0:
--------------------------------------------

atg@isp-pv-linux:~/v4l-utils/build/utils/v4l2-compliance$ sudo ./v4l2-compliance -u 0 v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17

Compliance test for device /dev/v4l-subdev0:

Driver Info:
         Driver version   : 6.14.0
         Capabilities     : 0x00000000
         Client Capabilities: 0x0000000000000002 interval-uses-which Required ioctls:
         test VIDIOC_SUDBEV_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/v4l-subdev0 open: OK
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
         Standard Controls: 11 Private Controls: 0

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

Total for device /dev/v4l-subdev0: 46, Succeeded: 46, Failed: 0, Warnings: 0
---

Compliance test for amd_isp_capture device /dev/video0:
-------------------------------------------------------
atg@isp-pv-linux:~/test$ sudo ./v4l2-compliance -d /dev/video0
v4l2-compliance 1.29.0-5348, 64 bits, 64-bit time_t v4l2-compliance SHA: 75e3f0e2c2cb 2025-03-17 18:12:17

Compliance test for amd_isp_capture device /dev/video0:

Driver Info:
         Driver name      : amd_isp_capture
         Card type        : amd_isp_capture
         Bus info         : platform:amd_isp_capture
         Driver version   : 6.14.0
         Capabilities     : 0xa4200001
                 Video Capture
                 I/O MC
                 Streaming
                 Extended Pix Format
                 Device Capabilities
         Device Caps      : 0x24200001
                 Video Capture
                 I/O MC
                 Streaming
                 Extended Pix Format
Media Driver Info:
         Driver name      : amd_isp_capture
         Model            : amd_isp41_mdev
         Serial           :
         Bus info         : platform:amd_isp_capture
         Media version    : 6.14.0
         Hardware revision: 0x00000000 (0)
         Driver version   : 6.14.0
Interface Info:
         ID               : 0x03000003
         Type             : V4L Video
Entity Info:
         ID               : 0x00000001 (1)
         Name             : Preview
         Function         : V4L2 I/O
         Pad 0x01000002   : 0: Sink
           Link 0x02000007: from remote pad 0x1000006 of entity 'ov05c10 99-0010' (Camera Sensor): Data, Enabled, Immutable

Required ioctls:
         test MC information (see 'Media Driver Info' above): OK
         test VIDIOC_QUERYCAP: OK
         test invalid ioctls: OK

Allow for multiple opens:
         test second /dev/video0 open: OK
         test VIDIOC_QUERYCAP: OK
         test VIDIOC_G/S_PRIORITY: OK
         test for unlimited opens: OK

Debug ioctls:
         test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
         test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
         test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
         test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
         test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
         test VIDIOC_ENUMAUDIO: OK (Not Supported)
         test VIDIOC_G/S/ENUMINPUT: OK
         test VIDIOC_G/S_AUDIO: OK (Not Supported)
         Inputs: 1 Audio Inputs: 0 Tuners: 0

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

Control ioctls (Input 0):
         test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
         test VIDIOC_QUERYCTRL: OK (Not Supported)
         test VIDIOC_G/S_CTRL: OK (Not Supported)
         test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
         test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
         test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
         Standard Controls: 0 Private Controls: 0

Format ioctls (Input 0):
         test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
         test VIDIOC_G/S_PARM: OK
         test VIDIOC_G_FBUF: OK (Not Supported)
         test VIDIOC_G_FMT: OK
         test VIDIOC_TRY_FMT: OK
         test VIDIOC_S_FMT: OK
         test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
         test Cropping: OK (Not Supported)
         test Composing: OK (Not Supported)
         test Scaling: OK (Not Supported)

Codec ioctls (Input 0):
         test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
         test VIDIOC_G_ENC_INDEX: OK (Not Supported)
         test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Input 0):
         test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
         test CREATE_BUFS maximum buffers: OK
         test VIDIOC_REMOVE_BUFS: OK
         test VIDIOC_EXPBUF: OK
         test Requests: OK (Not Supported)
         test blocking wait: OK

Total for amd_isp_capture device /dev/video0: 49, Succeeded: 49, Failed: 0, Warnings: 0

Please review and provide feedback.

Many thanks,

Bin Du (8):
  media: platform: amd: Introduce amd isp4 capture driver
  media: platform: amd: low level support for isp4 firmware
  media: platform: amd: Add helpers to configure isp4 mipi phy
  media: platform: amd: Add isp4 fw and hw interface
  media: platform: amd: isp4 subdev and firmware loading handling added
  media: platform: amd: isp4 video node and buffers handling added
  media: platform: amd: isp4 debug fs logging and  more descriptive
    errors
  Documentation: add documentation of AMD isp 4 driver

 Documentation/admin-guide/media/amdisp4-1.rst |   64 +
 Documentation/admin-guide/media/amdisp4.dot   |    8 +
 MAINTAINERS                                   |   12 +
 drivers/media/platform/Kconfig                |    1 +
 drivers/media/platform/Makefile               |    1 +
 drivers/media/platform/amd/Kconfig            |   17 +
 drivers/media/platform/amd/Makefile           |    5 +
 drivers/media/platform/amd/isp4/Makefile      |   38 +
 drivers/media/platform/amd/isp4/isp4.c        |  406 +++++
 drivers/media/platform/amd/isp4/isp4.h        |   37 +
 drivers/media/platform/amd/isp4/isp4_debug.c  |  272 +++
 drivers/media/platform/amd/isp4/isp4_debug.h  |   41 +
 .../platform/amd/isp4/isp4_fw_cmd_resp.h      |  318 ++++
 drivers/media/platform/amd/isp4/isp4_hw.c     |   46 +
 drivers/media/platform/amd/isp4/isp4_hw.h     |   14 +
 drivers/media/platform/amd/isp4/isp4_hw_reg.h |  116 ++
 .../media/platform/amd/isp4/isp4_interface.c  | 1064 ++++++++++++
 .../media/platform/amd/isp4/isp4_interface.h  |  164 ++
 drivers/media/platform/amd/isp4/isp4_phy.c    | 1547 +++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_phy.h    |   14 +
 drivers/media/platform/amd/isp4/isp4_subdev.c | 1308 ++++++++++++++
 drivers/media/platform/amd/isp4/isp4_subdev.h |  147 ++
 drivers/media/platform/amd/isp4/isp4_video.c  | 1443 +++++++++++++++
 drivers/media/platform/amd/isp4/isp4_video.h  |   93 +
 24 files changed, 7176 insertions(+)
 create mode 100644 Documentation/admin-guide/media/amdisp4-1.rst
 create mode 100644 Documentation/admin-guide/media/amdisp4.dot
 create mode 100644 drivers/media/platform/amd/Kconfig
 create mode 100644 drivers/media/platform/amd/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/isp4.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_interface.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_phy.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_subdev.h
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_video.h

-- 
2.34.1


