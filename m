Return-Path: <linux-media+bounces-14745-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA6D92B655
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 13:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2F3BC283C9E
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2024 11:12:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81301586C4;
	Tue,  9 Jul 2024 11:12:15 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2112.outbound.protection.partner.outlook.cn [139.219.17.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA659157E78;
	Tue,  9 Jul 2024 11:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523535; cv=fail; b=JrEVmiUiwrrDLFm2Hyq2PlRE8v8e4+ySZKXpYjfLGl9oZTmJKpcAEWNhUWcUc8sm5ltqzzA/2jnaaQnVykgk4MjIZhko6SIoFYA7knqk50mlP+SALklaqt3sOmMpq5xCn5arPBhHpAG8IxLJ5pzKS2ismoqHpfmUwulAijGAtr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523535; c=relaxed/simple;
	bh=l2eQBzej24IjzdZ3yeayafRT5sLEKwPTMgtQXRN62s4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OvV9QooRV6OowaZ2c1idtgpsbyMRmarHpcHGUE8IkWaDB34oJoJSyRrFkN8Jdu49TC+tRX5vhcvc8yfAW8bhYHsj7TyRSiMUdnSk7qDgWC+JY7wTHJlFEZesCh0gT0LeCHLxhKep+zL8PO4qz81EIdXv6uCp3oSXl0dIjpRZePI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMfPCIJJfBXlaftFUfDoes0NvIwwl5uyAdACY9yQzcr046ScWzw0Uc5/hYj2ycSac1DRocKtHN/4WWSVeNxHsUh4r6N5YFZPmTZaH873ITtxIzYrH0Bw0/fSaI1Oybs5vKa3wFLlCRb9Vc2PvLCGsnv1TnXBids38C/XNLFSxVgCslioZxsdPLV9Tg/jQWGK/MH4u63hLwCVVvd6aYHegUzzv8d/tQ5rNmDL+htURmcRb8L9FqDqcnxPlIgkEa3rV7sZbORqqSWulgItDMtMKYXhZQSEVM17scsT5BUs1W3vzbDyQLSIRjB3vHRuXNp10VN2dxgpVWawxy0v36Vbdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6X3adM2k6EIyu9eez4lG13vTog4sjUA3WmIRtsko+vQ=;
 b=NjmnBcUQYZcYe69FrGDAfv2gPIzsRjGIV7IAB55Z4laXZ+oq/z5SoxojpPlYgIk5z/T4v4/A0OoFJHob2Wx1MpUdwvml944IXR5i1Soghg5sFWQ5ezrWqOnJyCLeeOhQIZAL8T5tvvtpHXL/Ehg3oY3eJEg3iHpO4fp3nFtOxAwnVMEMhGSsDQFBixs9CpiBTPr6gR1P74k/bcaYQSl948EgFKJ3E9cdm4BgLEz+48x9gfUREnPgqn0IUHybY1/UbMZP7O9yeyBnDQdCK2PTcKiif5lKWWIW9Sqr52RCAPz77ku+3D+rC9KKehihuEIzr1NJI8sI64rWKUgtZzDe5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB1271.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:18::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.37; Tue, 9 Jul
 2024 08:38:32 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%6])
 with mapi id 15.20.7741.033; Tue, 9 Jul 2024 08:38:32 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>
Cc: Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v5 00/14] Add ISP 3A for StarFive
Date: Tue,  9 Jul 2024 01:38:10 -0700
Message-Id: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0031.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::16) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB1271:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c66862-b23a-4de7-22de-08dc9ff283a9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|41320700013|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	ZBIlS9qUDOVdpgqu4dSkGaj5WhDIkRUYEYf0QlSZrQG4utaXvMIxeuzljv86kWJC5xTfSYlaKOM3trYAU4JUXShnUEXCM4ZtkfAWrM1IAdopYdqkZGAgfxHEpZlyE88WP1gDhGPQn+V+gS1pwI5eZKrjGxDlA+sC8zTuiaZbV1Hj0iQqsUJQwJ0fty9fVULl3kPwQEqa5xpmIr4IwvrWBXmshUqs8+OapK+l8yRtuQMr5jRDfSqMtat1X4VRH6h67XjJEUs7VLEspz7o42wVBLLlDxzB6+SWz9+/DQmvjd51J7KYLKna3nOXRae4lzat7g6Jxj6B6+qQvniL9u+fE5C/8EKGCoED1KL8tHJ/2NdtuflPmUjGQxGgJkem9U1W48VYGmojaIm66Os5m1ciVtu5cmv9OkmOS4+Adv0g9f2zLDWgV4apprjHJcAy6T6zxlIFm612WdgUC7wGuJPjMvmRdzNjFt7659ugPglwKuPkmDzlvaRLiAyN+uP/676aT1AhqcLL/T1cJG29t/bNwRiSvhceJDgq34pmPlXTp9QMIH59tfyi3uxnJ/jqW/XFurZrLz8r86RplLpKAZh0YTHg9RlNcwnAIonbi0ijlLAhH6Cxk9sA/shz6jiIencN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(41320700013)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fFGEI6x9cxsrxXRo8mVD5rkGJzT7c1nfOMmKzrTzPliTlA5bKfu3mb3oaJUw?=
 =?us-ascii?Q?C9wr+A6EfnqtolnmfRPNKIzcu2pde1twxUAaTgowYkpgTVcI4Z9C5dbbHAbh?=
 =?us-ascii?Q?OFWaVQDSIIrTYc2Js0a18FWYDt8lcj0uz6aWG39F61KSgnTZtJ+Trpl2V9se?=
 =?us-ascii?Q?n/d7VanMPfr7VRfZCuxKnyttiI4e/ERw6xUDpc7OsrUBMJ1n8/tF3LbAtSaX?=
 =?us-ascii?Q?oW2RUHgXY1G+FmCUxaYXaFcuIbSK9363NgvoZn1DL0AwfJLNKRRSY+4N8UAR?=
 =?us-ascii?Q?eoGW2z+wsvAiiggndz5jub8KyxuSUiNQvgzQuHmBo1bw8WRGMAa2feYva6aT?=
 =?us-ascii?Q?BJbmJT13c0ouXIlkw1w4JzyViHxIkU25ZGaGkmClX+bo7qsqwR1UuWMmC/cO?=
 =?us-ascii?Q?cdIoT5OcVKb0gjpZ2IlYY0m0Pop4c0Saagiv6v3jXaty1cLrFcxCRHKQeh9M?=
 =?us-ascii?Q?d5d+biYShzUrRbquMwK3hxvGqVyL15+n4czpMLLrlBULRItwU2MEwLtXILuo?=
 =?us-ascii?Q?zVcyIBj3KGW6TexOB+EXKokIXUSOVMkQ7wdHT1uMRWRjt22YTjcASaCurUxa?=
 =?us-ascii?Q?X3NRFXvOshUo5rFGGGQvwqJ0LBXVy/BGwglL8xtvaYSZOJZiRVPvVdIVUOKL?=
 =?us-ascii?Q?uMTNY20el+o7bX7LUqHiLWuS4zO8jDwazWj5q3c3oUYrDqPIMcrwi00m4ifc?=
 =?us-ascii?Q?HpxOBfILA70/Yapu5bwhqXWwerGu+7CNn+qSFp9M73q+gjEIwiQuEd8nrrsy?=
 =?us-ascii?Q?6+faH6PtyNHDQp/8R4dqk3zU8kFADQ8VBwZHCC1Jdgkub1p1nTIjxfm7/ci9?=
 =?us-ascii?Q?1ntyi4rFiZ8G6YPRLvHnJViuH78/My58ZZXgjBLhs3vf4rhjZ/5NvwKnUluJ?=
 =?us-ascii?Q?5vS2uJdLw9B3ZWYJu3JzbQ2eXrKEj4uA0Gnbl13cJLgliaowH3RmMctdrqev?=
 =?us-ascii?Q?FU/9Glo2N0yz41F/y50rlKgdqE8IK9Dnr2r2U7pNhoTpgVLGYHT23Hoi3CkC?=
 =?us-ascii?Q?OYXth4KKCYuj+WHEIEL7eqGtMFX1ELc68R0IO3e/I1qH+6inwTi7SwKjNYJt?=
 =?us-ascii?Q?w41QJsOq9K9/YDGIJInmRIdppIOHRjNrBEJbMylFisZBZKdkW/UD5k/y4mn/?=
 =?us-ascii?Q?0tSGjfacwe0OQRLGtUtnw0zarFy7hMtUDwprO+roW9ZtVkbMUFWai1524bGu?=
 =?us-ascii?Q?yn4dDbIGv5ifYBEZwxit9bkw3FPoOJwIRmNM1Q9S7D+6HLqFjljfU8f9R3/F?=
 =?us-ascii?Q?oDFRSKPVSrFKFPfinhuzwZQwI8IRxvKuiLznvBDu8Iwvh2v23dw9pwHpZvhd?=
 =?us-ascii?Q?5G5LTnYaqwcZo1EKhUpHHg7WJguID1aLyw1lsr0SYBFXLYn79uKLTjpb2tRe?=
 =?us-ascii?Q?TFCBcvhbq6zQ8s9h0YPE9B6XXbMXR4iQbCEW94Gk4pxA6f2bGVbFPDUL4y2e?=
 =?us-ascii?Q?ibA4vyeif4Qu53gN/QEKmyL+9ifWU1W7gqkVFuCL/2bw6z/qj3mT+v5QEFQG?=
 =?us-ascii?Q?Fyz6SwNyWQjh5Dj93wK67E+bdcyk4wjROjhW9ZcJxXNRBDI0qwOJofli/JMB?=
 =?us-ascii?Q?ZcQcSw1ARzMSxIT7FgLIMKMb/7dWroUoKR0LBQcWvNZQUyCEsk9Pjs5OOlyT?=
 =?us-ascii?Q?ECSC0KtMmM0yD7NWtDrLW1o=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c66862-b23a-4de7-22de-08dc9ff283a9
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 08:38:32.0960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pwm5wvq7SQHPECVIWQRb9bEOoPysJ8wFqO/cI8hRsIbt+ArN8OzSSlmNP/8AkZdQAbP0cmSwFr47agLXoJ5P1eN9iezXAb1TF4RppCle4yI0nZU1MPaJNv8MTWVoV9lv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1271

This series implements the ISP 3A function to the Camera Subsystem on StarFive
JH7110 SoC. The series has been tested on the VisionFive 2 board.

This series is based on top of the master branch of media_stage repository,
which is tested with a v4l2-compliance compiled from the git repo
(git://linuxtv.org/v4l-utils.git).

changes since v4:
- Rebase on top of the master branch of media_stage repository.
- Insert a new PATCH 13
- PATCH 1:
1. Fix spelling error:
	- corsstakl -> crosstalk
	- balck -> black
	- magbitude -> magnitude
	- FALG -> FLAG
2. Exchange of the values of JH7110_ISP_SC_FLAG_AE_AF and JH7110_ISP_SC_FLAG_AWB

- PATCH 8:
1. Synchronous spelling error: FALG -> FLAG
2. Add:

if (*num_planes)
	return sizes[0] < sizeof(struct jh7110_isp_sc_buffer) ? -EINVAL : 0;

- PATCH 11:
1. Drop read hook.
2. Add:

if (*num_planes)
	return sizes[0] < sizeof(struct jh7110_isp_params_buffer) ? -EINVAL : 0;

- PATCH 12:
1. Add:

ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
ready_buf->vb.sequence = output->buffers.sequence++;

to fix "v4l2-compliance -s" Failed.

v4: https://lore.kernel.org/all/20240402100011.13480-1-changhuang.liang@starfivetech.com/

changes since v3:
- Rebased on top of the master branch of media_stage repository and patch [1][2].
- Replaced "stf_get_isp_scd_type" with "stf_isp_get_scd_type" in PATCH 8.

v3: https://lore.kernel.org/all/20240205090424.40302-1-changhuang.liang@starfivetech.com/

changes since v2:
- Rebased on top of the master branch of media_stage repository.
- Added helper function "media_entity_remove_links" in PATCH 8 and PATCH 11 to cleanup links.

v2: https://lore.kernel.org/all/20240111084120.16685-1-changhuang.liang@starfivetech.com/

changes since v1:
- Rebased on top of the master branch of media_stage repository.
- Documentated ISP submodule.
- Added new ISP parameters format and document it.
- Added a meta output video device and link to ISP subdev.
- Replaced control with meta output video buffer for write ISP parameters.
- Separated buffer operation which can use for capture and output device.
- Droped ISP frame sync event.

v1: https://lore.kernel.org/all/20231214065027.28564-1-changhuang.liang@starfivetech.com/

The following are the media graph for the device and the v4l2-compliance
output.

==========================================================================================

[the media graph]:

digraph board {
	rankdir=TB
	n00000001 [label="{{<port0> 0 | <port1> 1} | stf_isp\n/dev/v4l-subdev0 | {<port2> 2 | <port3> 3}}", shape=Mrecord, style=filled, fillcolor=green]
	n00000001:port2 -> n0000000e
	n00000001:port3 -> n00000012 [style=dashed]
	n00000006 [label="output_params\n/dev/video0", shape=box, style=filled, fillcolor=yellow]
	n00000006 -> n00000001:port1 [style=dashed]
	n0000000a [label="capture_raw\n/dev/video1", shape=box, style=filled, fillcolor=yellow]
	n0000000e [label="capture_yuv\n/dev/video2", shape=box, style=filled, fillcolor=yellow]
	n00000012 [label="capture_scd\n/dev/video3", shape=box, style=filled, fillcolor=yellow]
	n0000001c [label="{{<port0> 0} | cdns_csi2rx.19800000.csi-bridge\n/dev/v4l-subdev1 | {<port1> 1 | <port2> 2 | <port3> 3 | <port4> 4}}", shape=Mrecord, style=filled, fillcolor=green]
	n0000001c:port1 -> n00000001:port0 [style=dashed]
	n0000001c:port1 -> n0000000a [style=dashed]
	n00000026 [label="{{} | imx219 6-0010\n/dev/v4l-subdev2 | {<port0> 0}}", shape=Mrecord, style=filled, fillcolor=green]
	n00000026:port0 -> n0000001c:port0 [style=bold]
}

[v4l2-compliance test]:

# ./v4l2-compliance -s -d /dev/video0
v4l2-compliance 1.27.0-5220, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8387e3673837 2024-07-01 11:09:32

Compliance test for starfive-camss device /dev/video0:

Driver Info:
        Driver name      : starfive-camss
        Card type        : Starfive Camera Subsystem
        Bus info         : platform:19840000.isp
        Driver version   : 6.10.0
        Capabilities     : 0xac200000
                Metadata Output
                I/O MC
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x2c200000
                Metadata Output
                I/O MC
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : starfive-camss
        Model            : Starfive Camera Subsystem
        Serial           :
        Bus info         : platform:19840000.isp
        Media version    : 6.10.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.10.0
Interface Info:
        ID               : 0x03000008
        Type             : V4L Video
Entity Info:
        ID               : 0x00000006 (6)
        Name             : output_params
        Function         : V4L2 I/O
        Pad 0x01000007   : 0: Source
          Link 0x0200001a: to remote pad 0x1000003 of entity 'stf_isp' (Image Signal Processor): Data

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
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 1 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls (Output 0):
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK (Not Supported)
        test VIDIOC_QUERYCTRL: OK (Not Supported)
        test VIDIOC_G/S_CTRL: OK (Not Supported)
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK (Not Supported)
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK (Not Supported)
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 0 Private Controls: 0

Format ioctls (Output 0):
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK
        test VIDIOC_TRY_FMT: OK
        test VIDIOC_S_FMT: OK
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls (Output 0):
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls (Output 0):
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_REMOVE_BUFS: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Test output 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        test MMAP (no poll): OK
        test MMAP (select): OK
        test MMAP (epoll): OK
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for starfive-camss device /dev/video0: 55, Succeeded: 55, Failed: 0, Warnings: 0

# ./v4l2-compliance -s -d /dev/video3
v4l2-compliance 1.27.0-5220, 64 bits, 64-bit time_t
v4l2-compliance SHA: 8387e3673837 2024-07-01 11:09:32

Compliance test for starfive-camss device /dev/video3:

Driver Info:
        Driver name      : starfive-camss
        Card type        : Starfive Camera Subsystem
        Bus info         : platform:19840000.isp
        Driver version   : 6.10.0
        Capabilities     : 0xa4a00000
                Metadata Capture
                I/O MC
                Streaming
                Extended Pix Format
                Device Capabilities
        Device Caps      : 0x24a00000
                Metadata Capture
                I/O MC
                Streaming
                Extended Pix Format
Media Driver Info:
        Driver name      : starfive-camss
        Model            : Starfive Camera Subsystem
        Serial           :
        Bus info         : platform:19840000.isp
        Media version    : 6.10.0
        Hardware revision: 0x00000000 (0)
        Driver version   : 6.10.0
Interface Info:
        ID               : 0x03000014
        Type             : V4L Video
Entity Info:
        ID               : 0x00000012 (18)
        Name             : capture_scd
        Function         : V4L2 I/O
        Pad 0x01000013   : 0: Sink
          Link 0x02000018: from remote pad 0x1000005 of entity 'stf_isp' (Image Signal Processor): Data

Required ioctls:
        test MC information (see 'Media Driver Info' above): OK
        test VIDIOC_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/video3 open: OK
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
        test VIDIOC_G/S_PARM: OK (Not Supported)
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

Test input 0:

Streaming ioctls:
        test read/write: OK (Not Supported)
        test blocking wait: OK
        test MMAP (no poll): OK
        test MMAP (select): OK
        test MMAP (epoll): OK
        test USERPTR (no poll): OK (Not Supported)
        test USERPTR (select): OK (Not Supported)
        test DMABUF: Cannot test, specify --expbuf-device

Total for starfive-camss device /dev/video3: 55, Succeeded: 55, Failed: 0, Warnings: 0

Changhuang Liang (14):
  media: starfive: Add JH7110 ISP module definitions
  media: Documentation: Add description for StarFive ISP metadata
    formats
  media: videodev2.h, v4l2-ioctl: Add StarFive ISP meta buffer format
  staging: media: starfive: Add a params sink pad and a scd source pad
    for ISP
  staging: media: starfive: Separate buffer from ISP hardware operation
  staging: media: starfive: Separate buffer be a common file
  staging: media: starfive: Separate ISP hardware from capture device
  staging: media: starfive: Add for StarFive ISP 3A SC
  staging: media: starfive: Update ISP initialise config for 3A
  staging: media: starfive: Add V4L2_CAP_IO_MC capability
  staging: media: starfive: Add ISP params video device
  staging: media: starfive: Add ISP parameters hardware configure
  staging: media: starfive: Drop read support for video capture devices
  admin-guide: media: Update documents for StarFive Camera Subsystem

 .../admin-guide/media/starfive_camss.rst      |  11 +-
 .../media/starfive_camss_graph.dot            |  22 +-
 .../media/v4l/metafmt-starfive-isp.rst        |  75 ++
 MAINTAINERS                                   |   2 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   2 +
 drivers/staging/media/starfive/camss/Makefile |   3 +
 .../staging/media/starfive/camss/stf-buffer.c | 166 ++++
 .../staging/media/starfive/camss/stf-buffer.h |  53 ++
 .../staging/media/starfive/camss/stf-camss.c  |  38 +-
 .../staging/media/starfive/camss/stf-camss.h  |  12 +
 .../media/starfive/camss/stf-capture.c        | 248 +-----
 .../media/starfive/camss/stf-capture.h        |  22 -
 .../media/starfive/camss/stf-isp-hw-ops.c     | 722 +++++++++++++++++
 .../media/starfive/camss/stf-isp-params.c     | 240 ++++++
 .../staging/media/starfive/camss/stf-isp.c    |  77 +-
 .../staging/media/starfive/camss/stf-isp.h    | 188 +++++
 .../staging/media/starfive/camss/stf-output.c |  83 ++
 .../staging/media/starfive/camss/stf-output.h |  22 +
 .../staging/media/starfive/camss/stf-video.c  | 147 +++-
 .../staging/media/starfive/camss/stf-video.h  |  11 +-
 include/uapi/linux/jh7110-isp.h               | 739 ++++++++++++++++++
 include/uapi/linux/videodev2.h                |   4 +
 22 files changed, 2608 insertions(+), 279 deletions(-)
 create mode 100644 Documentation/userspace-api/media/v4l/metafmt-starfive-isp.rst
 create mode 100644 drivers/staging/media/starfive/camss/stf-buffer.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-buffer.h
 create mode 100644 drivers/staging/media/starfive/camss/stf-isp-params.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-output.c
 create mode 100644 drivers/staging/media/starfive/camss/stf-output.h
 create mode 100644 include/uapi/linux/jh7110-isp.h

--
2.25.1

