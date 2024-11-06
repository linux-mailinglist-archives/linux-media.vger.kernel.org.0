Return-Path: <linux-media+bounces-20977-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7099BDEAD
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 07:17:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 616E2B20BAE
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2024 06:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AD71917F6;
	Wed,  6 Nov 2024 06:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rz7YjMw2"
X-Original-To: linux-media@vger.Kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013041.outbound.protection.outlook.com [52.101.67.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41F11925B9
	for <linux-media@vger.Kernel.org>; Wed,  6 Nov 2024 06:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873813; cv=fail; b=PkCNgwd55lLCQ4T1q8BPfN4qOs2OsVUabg70CXz0qg0SvoVCtwAE6Cdg8VIyDxWuoCjWms7sAR902Rvtfa9p2Y26y/abw+G4kOKq4gJtN4pbZVcbRfu4UIkLgV8Wk3iGJxaD8OvHb9luxcKpsu9J3RvSK+y7DUQ/yPQZ5HBKWVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873813; c=relaxed/simple;
	bh=uAtyLIbJP6HaiWdUinnnpFP91qlE5nWvr7QfzYLuoMU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CAfP5uXen6Va/rOKH2CuWKc5elHfzTQy523bpYlwthcBf3YhPEspVpOFNQzZYa/hKPMLca1k2C40dCa4MVu3z+ji9o05iOkemgp4EZs/vGX8Ic83SvBqw0LMxD0HuW0LzorzybFuBQkWkk0x6RjngTAA/oAfb/hfZT+aQDLsQDE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rz7YjMw2; arc=fail smtp.client-ip=52.101.67.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I//oMHmSa/mLzlsND3pGpF4qnqR4ijdXkm1g6c9bOoLoNDlD37QGu2sUsIspbTSOg53uyAqE/t/tkSKDFCReGzaL0ZuccdXwkxG7mv09KGFoqKMmAmrwm69RIJBp9PNaCIFs8Ys841FcrmHGrDDAmkUMhw4xwuQvOYQN1wqMZub4yT3iJVYPNlP0/wVC9eQTYJD6JH3XvW4x26e/g0SMW9NyIsrdQtdeg7nxgxTRlnnDaJzcNWdgXWdTPcuQAFzmPYL8RI+6V8Mp7n45MY884qVLXeN/ROpkowj2bI/9gDbB7CK2AGfegVN60GKOSVQPnLGMX11uef+jGwe+yPMyAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PM5zzJb9zrMrtKPi2D961+LfdRDo2iUcX3DmfpRAzpg=;
 b=d4K71OT9aRZH4DHEAGP2Zq826l3FGrp3akEDBVtaF33IH2EsQ4uGqxFqzMV71CFx+PmVflMVRjVC9GdW5SgJrsugfOWx1nRkI7h1aM8sZg63Hx3FZ+OLFPomu4g1V8b8WRAPhqGwl7s+yHVhr9L8zXXjnUUttg35Hya31xViW8hD5vt2oAczfY44NV2cdxtcbt1InQjnpe9BVHbhp6uaN9NkHVpYqPiE2KlGeGCmEkE0VuRP2B12cLp4i711UyE4ip7kjpLnHKsmf16Mw7F+BOTgjXzWse6E8N0WAC0P6/QyIrsIzZWtNNaxkc3OMQ1RHf1N4ro6nCZhZW7g99oXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PM5zzJb9zrMrtKPi2D961+LfdRDo2iUcX3DmfpRAzpg=;
 b=Rz7YjMw2YIOskg4ZTon1srzcM0+h80mf75ld//RI5eZZ6F6/sE3qYCPRGOSO2HCm5jP6bdWtLEsys3JhPEX5FDL9Mdiz/jQpN3XycTKmCfRxEaDOw1ovtz23HP5bEJcfT5yFAZfs+ib5AYBIAdYdWOBk7uaFUxmzmy2Bu4Jn1ceb7Rtczt4WhhSVX0klBbWp73+24R6jmKiba0ij13PQBYaA2zsGReBFPIYZURU9Q0yXMEDTOJHKxEFkcCPgx8epDM72mJaj4Z2Qp1AhHBTM6gUKFzUCYAJlV/9n0VpDvE4iVIGqrxS3sMBwRXcyTVFYW606xtSAa6FZN9MvBEOIaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DU4PR04MB10599.eurprd04.prod.outlook.com (2603:10a6:10:593::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Wed, 6 Nov
 2024 06:16:48 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8114.031; Wed, 6 Nov 2024
 06:16:48 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.Kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: laurent.pinchart@ideasonboard.com,
	tfiga@chromium.org,
	ribalda@chromium.org,
	yunkec@google.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com
Subject: [PATCH v3 0/4] Support V4L2_CTRL_TYPE_RECT and
Date: Wed,  6 Nov 2024 15:15:33 +0900
Message-ID: <20241106061537.211002-1-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0250.apcprd06.prod.outlook.com
 (2603:1096:4:ac::34) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|DU4PR04MB10599:EE_
X-MS-Office365-Filtering-Correlation-Id: f7253109-8c2b-414e-48ed-08dcfe2a9897
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?g03vFTJMoUx5WkgFHhvh+iQttNhnpMLkZUb28AaIKmFKEL4uw7xOcJO1002U?=
 =?us-ascii?Q?sGGe4BqxMQVTjS6+yLKJIUqVtJpKUaQP4mRWonox/MTvpR2KR9/xPXpANmF4?=
 =?us-ascii?Q?Gh8Th5UEtWp3M75T0LvWrWSC2v+upoizueBALjEYvvvLK/cmH/Rtn87cUkt+?=
 =?us-ascii?Q?GfYVl2VD2q2z9J8KuR6mpz4MCFIfGq4nKSphbb0SZxL5FCWSwcaEjjnN9GKM?=
 =?us-ascii?Q?fucfJoRWSRYg9sj2eS3iNFpfSvXR+PiH4TBc+vAKSAz5rH5jZyHs6syqm80O?=
 =?us-ascii?Q?twCcGUy7NJTZnwO3Algopwky2WiFQMPOVKxYGOiQrIRlMsfJ7gOrkBlQxG1g?=
 =?us-ascii?Q?h0J8pjnPKTRxUBrzMLIZLWEANkYPYXL9ktCY/Fbo/DMrWn4+xOgbJCF4e6SE?=
 =?us-ascii?Q?djadHylsiU3M2TCALhaDjsNno3YhHrgGLc36g4xB5dqCqp15I+E+EqxItlEz?=
 =?us-ascii?Q?bNR8MKtXNze013lIrcu4SkgdVl8nA4pf+xY7GeJXczjsRYOi5d3AUBLavy1A?=
 =?us-ascii?Q?v5mwXEsCOSMW05pjtuKUOAiQiJmIczNpBm3Xe9hHJL3Sh6DqJLbZYoP2t7UC?=
 =?us-ascii?Q?Qtrl+vWWTSWX6oWm1i8FXd6bjhGR6eahrF4/TrhzhlXHQhLRJ+el7nGLUszH?=
 =?us-ascii?Q?neFB5NDnkEUbVjKY3TgRCQOzXgQjydw8vFOWOl6/Js9UDNVK8v5WCypo8Y6D?=
 =?us-ascii?Q?CDBkkD/FivI1vfxZnx8FST2P2i/J52S+bXzIrs/GAH4l5FFaZSBMtFt28q58?=
 =?us-ascii?Q?+NFk6evzsUY+7I2A/nxKYWXCfcRHxE1bWweHqKKQiLQu+5jJsWd5nK8Jnelt?=
 =?us-ascii?Q?BLIfnKLD/fsL6jqYPFRZgHVX8/C2ISr+iGAUDsAgkaZXgrbZTenXwLtEqkQy?=
 =?us-ascii?Q?TfoUpvg/Tqw/MNsQOX69NFNHAQOcj+wine63VoKey+8XvtZT6yacOZD7gUJJ?=
 =?us-ascii?Q?MQFQqAEjyMZ5EhN27kBl1qp8jJrVf3EfEqr4NFDIbwXQdbSmNyJAb15w7GAX?=
 =?us-ascii?Q?9JAei6NUfLrMMJX3Z3T6O7koya224Hu6ZahaY5AEb/MPmqpyWukT8MEFwSBM?=
 =?us-ascii?Q?yRuTL/LHaoCU3TMhzryRenpO63tjauEERjK3U1aRoD3M1LrfxhM/wNgHp6Xz?=
 =?us-ascii?Q?Ud5QvvbBJVpVyFRwxkkkomdWhOneBko5JA6lXnhuS/WSZ9UYAQu+jvh5VgPY?=
 =?us-ascii?Q?i/8W10tzyzDPi/2B98zk6uozkvJ3oT+X5GuhYVH3asZ8mwBpbB5WJQrCKWAr?=
 =?us-ascii?Q?sEf3pdoz1afAH3F5sGXYhs8KvtK+9UxeyUY20pavCrbZ4yCSEBhCuKgnpPI/?=
 =?us-ascii?Q?RS2fQIKcEVkmjxgKNtS46ffkyInqAQ1zTlasgCuR3MpK0jzD16HeivYQZjP1?=
 =?us-ascii?Q?3LRude6nbPCSKab786aXyVx5yPon?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?5XlIU4I7RgdB/2YF0ICTpbQey53tL2akiUNuVfSAWbGRtA3LnyaW7yYXXAkt?=
 =?us-ascii?Q?XQA9A+ZOWY5OXmzPZMbR+jUY1zwcEdf1/fErtKDZSsIQ9STIKlgtt78s1xum?=
 =?us-ascii?Q?Hr/rYyy8/Fl1R8TkvkwJUhSm9lo5x16iA5ukuINh/ivr/X1KOezcjUno9j1p?=
 =?us-ascii?Q?tQLaWD+NmDSWVA+5MhE2bjWupaX7VsFNli7tTKSi4IBv4B24yvh08qQCBFYo?=
 =?us-ascii?Q?XCrE4GsTWvnJehvCQCrEEn2OV0EWAXXWnocNv7qQorS+2/1J5+aOSpILufVh?=
 =?us-ascii?Q?3mD5XuxZ27n2TUDU91NZYVGbIU0cO+uIRTi5oaApXFX9dzGG0bVsTPdZ7hqx?=
 =?us-ascii?Q?zqoHPVXnzhHk8LIVFnPEue+i7gs/asm5ucubwnzPpHXbbsBXr/8egPl6z/GI?=
 =?us-ascii?Q?7XEktdwuAWqFK6iaMbMQydBJoL/huPvgv6VY4CdDEK36YF5+AG9+8aL1wNqj?=
 =?us-ascii?Q?tXgdaxGmmuAvzTO1RsgULBo1Fp2QfQKucxrGQFZFTW6zLGIp+nzDfsCa7y7E?=
 =?us-ascii?Q?XsdFHAfs9hdF4cuVX7aR2BHTAg65FHI2oX3X8HGwdUMxQy78AgBh372F5v4a?=
 =?us-ascii?Q?e97G7K3BBLrCFEpqHscl4/wMNtO4taobX+cwIlOUdWqJx71hVA2NY+r8Q2TW?=
 =?us-ascii?Q?4tFiLPp/gKcjDDgW8Y1PF0dE5lwLJRuAaglWD8f28E89L8TQzoYYeBQLH10V?=
 =?us-ascii?Q?jfZeF0/HbVZ0oVOD3R7RkSrbHy2o3SC10FMgtImY9AFETS5M+KzPN3Cc2PO7?=
 =?us-ascii?Q?BVhJHngIZgcoTCok3nfrqeIEk3ELwMB9BicmJ7TotvB44gRFztx3WQJV+9SQ?=
 =?us-ascii?Q?l92IGrPpUKvLXNQU0Psgi3c22SOioLNgSGSL1P/H7+qBglPwz5r11Q3x5wUT?=
 =?us-ascii?Q?dSsjiI/ViXeTTPq50WFkTdrVK5JaHV9v+65DXGSP+J2V51lw/MtUKWK9Bpva?=
 =?us-ascii?Q?C9hUvtVFNcVt6T3FbfqCzFRaNZ9EKbB8FO9zz+E75pk1u+06Vb7s+oehuaP+?=
 =?us-ascii?Q?4sGsXje4Y3FIBo0eSRSG/mPtFZFd/vXbMH0YrYZP8MaHWwgRWojQ8Ch72HFn?=
 =?us-ascii?Q?9nbZOHwPZnBuD7mBJe5RLokt4P5bGhA6pcH3l1v+ycUwFR+7/jnD3Ftol1Oh?=
 =?us-ascii?Q?BO89kA39dm6wkoFRS+8jTQEhZvSwY3+hiieunXr9BJvF8pKkHQG+YLjkhfCX?=
 =?us-ascii?Q?XmbzcypBH3HP1iAP1zPaKGk/6NS6Zqxd1r/nF5WIuo5E7y1om74tyKvt/Tcr?=
 =?us-ascii?Q?5a5QKTFW6tiRdfOqxUXifkakFH6fB+rj34WTbCGwBJi+A4XiN3Q9CF5QbiDL?=
 =?us-ascii?Q?zhzZvPmImaSabASuRk4EDJLon1cq+L2dc8ukk4VGqPPfl5s5rrJoCUJzERVr?=
 =?us-ascii?Q?7Ys/T7gO/fm+oOcBaUrAcOSMflHtzyC2F4RzEKUhyDic9lgonxyB3YiiCqXR?=
 =?us-ascii?Q?QeuH+ZaURH6WsIeGCPTovvyo4SP6HzYYR0NCS70qrtDMNTvVcnNqPTAw2T6h?=
 =?us-ascii?Q?39yfI9u8asYJk4k+93eD/G87gBvymWnWn4t64GWKnBoA7CLKRdSEInpGDtU4?=
 =?us-ascii?Q?T6FqqflwWHyltpx3YjKbwfeGOSViudM4ykMDolue?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7253109-8c2b-414e-48ed-08dcfe2a9897
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2024 06:16:48.5919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rML5egYWromh0plEXKzzbcSPqRVtyZDT7n9A1bfRhD8kgDHpVhGaplVZALaCeGeweGNHpIA6PUAsLzUuMhH2NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10599

From: Ming Qian <ming.qian@oss.nxp.com>

Hi!

This patchset adds basic support for V4L2_CTRL_TYPE_RECT and
V4L2_CTRL_WHICH_MIN/MAX_VAL in v4l2-ctl and v4l2-compliance.

The corresponding linux kernel patchset can be found at
https://lore.kernel.org/lkml/20241106060752.205074-1-ming.qian@oss.nxp.com

changelog:
v3
- Improve the rect ctrl value notation as (x,y)/WxH

Ming Qian (2):
  v4l-utils: Define V4L2_CTRL_TYPE_RECT
  v4l-utils: Ignore comma in bracket when getting subopt

Yunke Cao (2):
  v4l2-ctl: Support V4L2_CTRL_TYPE_RECT
  v4l2-utils: Support V4L2_CTRL_WHICH_MIN/MAX_VAL

 include/linux/videodev2.h                    |  5 +++
 include/v4l-getsubopt.h                      | 35 +++++++++++++++++---
 meson.build                                  |  1 +
 utils/common/v4l2-info.cpp                   |  1 +
 utils/v4l2-compliance/v4l2-test-controls.cpp | 24 ++++++++++++++
 utils/v4l2-ctl/v4l2-ctl-common.cpp           | 13 ++++++++
 6 files changed, 75 insertions(+), 4 deletions(-)

-- 
2.43.0-rc1


