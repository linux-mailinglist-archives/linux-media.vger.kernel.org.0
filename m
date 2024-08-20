Return-Path: <linux-media+bounces-16538-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ADE9585F4
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 13:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFAA32821E3
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 11:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3AAA18E754;
	Tue, 20 Aug 2024 11:36:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2120.outbound.protection.partner.outlook.cn [139.219.146.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9726218CBF3;
	Tue, 20 Aug 2024 11:36:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724153800; cv=fail; b=IlcUeCAKzDqk/yO/XyY8QPk3jQxRCTELhD5UAJTYWIn7xXWglHvs2lpnEbSaYmyOJm8fq/pFWlnImGLtQ5xzURWLVLE4n6szZ+jyB6j9AlYa2H12BMQQW6gzU21QY5Fv+8Cznu8ZnJeAIXTiyYNIRRe5dqPzCRHAVz+vpwF4QjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724153800; c=relaxed/simple;
	bh=0pbdUTNVnvaM1L+x2mMj0U+TziwrSD0X1VEGO+8r2YA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Xm+DDLMfbouqi14GfQxFpVvWQs1sUB+J4vLhXxikuu0/icQK5mhbyjT/zcHltyizzS7ScPHevna5+j2obl1Jm0jqlp41pfH7TWrziQALd7JyOoO7TOdgU5zevochxEuppcujLqbyqkKESKGPcDAOyzf8kSERFn0lDQRNgR6jWyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SZU1q/GLiGMvePIt2PGp9N9Ob0fmDmDbeU5K9xagSSBLr1S+GiNv3eFBnWQ0VzirnVrCi+a8AkaV35cWkiWL7Ev+gKEWpK8Y9aw2p3jc0Ydk21UsN750aSXyRcrLYXqS2lMDOywWB00UXslMCQTJ32UtyDWN3c1wSsSe0EJrpMT7SMJGz4Kh2omNSxuj+oejIJTwlc/ZPbjqFkMIA4cJo7UVJhxBIw0C9XJnNKdgl+95UKXIHAB7wh1Z1PfnFgxBg+SBeFoZdvIlZ7e+VKT44Kj0mwF+UnffDZsBxIdjQKuSzWe0mYDOSt2cO6tp/DB3MGGx9O0WJrMWjjgWBJhx2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhVnfC8oWWrotk82x5SU9xTqcKcNS8KLDrtGwm9ow0E=;
 b=CGVhqIEYNhdCDAalZZ/ZDTgvkv4EqU4IguK9iRbo/Hxol2TtT1OksMr7pK4KQOSkr1pyXJlxJ8lp7kidEdBqqDJV0lLGc9y1w8tm4x1UoUPKWmzt3sQCaGaY4XMnAaCzxsGq0EXv58T7itChMOIKsQYcLuK9vbBr+UkF8dvRJoJg6kKKMvVsBdVLEJxQvunMlaCar5owqd56h4DSQgCNaa0+bsy47bAv95y5EDIwhrYkWmhOsMfRHjRIjwsM4l4+rbDhu5EYqyi2lhTt6b6/14WxAVHchfhRQPSq6nbEAh+EILOFdMWQVnMlODajNAqO5GvG694D7AwwUBxCGP2ENw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9) by ZQ0PR01MB0998.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Tue, 20 Aug
 2024 11:21:01 +0000
Received: from ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 ([fe80::64c5:50d8:4f2c:59aa]) by
 ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn ([fe80::64c5:50d8:4f2c:59aa%3])
 with mapi id 15.20.7875.023; Tue, 20 Aug 2024 11:21:01 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [v1] MAINTAINERS: Add "qcom," substring for Qualcomm Camera Subsystem
Date: Tue, 20 Aug 2024 04:20:53 -0700
Message-Id: <20240820112053.560605-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0032.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::6) To ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1302:EE_|ZQ0PR01MB0998:EE_
X-MS-Office365-Filtering-Correlation-Id: f3672323-a509-4777-59eb-08dcc10a2bc7
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|41320700013|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	Hlobs6r86PVvUZvoB2ajSYirvH1Xfrs5dPsciUN0+Lz0tCU6SfabqOAAxgGYwX6lEBFy/awFoqeYoXERpVChSC3O9khf6lV6ucLeutSlVJDnSRo5/dntEnZwe1NtC9Wn7V2FpQAxWQ3wNk0L5GRR0UQFTEZTUEd5iY9oKAlHbxLmeB9gyqbkUm7H/izPQxV3oBuBJUgys0f35llfxuggxlsxsZpYf6PVBZHv5nLVHx9BtRIU3xHUuEtaoS4cQL2iZBp6ZlOKmvK61OBZ+YI7JRNNiAqQT3qnx/kj9WFvx/WmZmdxLgXGmJI1yLWf6uziTNjUdufps4ehTRn2vachpAF71P+XftLgSZU4ERp7nGaerTbD3Lthw6gJGZS1R5MC2mh1woluPDYxs8HKpgss+qJ/GVxLq74XvMBTVtDiMkIQ5flpSLWTDMUydvgx6UehtJBDc5D2dQypx+XRKTUQgJH+0mN/I+1rBTfLEIVVUaAbiX5YKhqZXG6NQw+eyZnHxDmJIxu1LbRRFzQJ9y29erC0TtN2qeuLCUWNxZxq7amvaHYKHoPJEsHSOUSWRL8kUucMA027j3SpGftCYeSij96QMKyfP0Qsi1Li0x1XvEbdDoz2r8HMdE98ksiNz3Hq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d7dJoP2QFKRH8y85yk5Ik4wxu9kRTCooO5P8YPVtjG+PT7IWN6Unb43YvN+r?=
 =?us-ascii?Q?SdrewpV23Tz8Iio5Gnf2Dl+/MW5K8OK/ILh+zKIzWnWHve2vEwRDUkRsj111?=
 =?us-ascii?Q?M6DnSlS4XV4qxAoBWhNYzCZdEQk/gYRFNy0VlSmpgglQBjEqelmKL4jTBJRU?=
 =?us-ascii?Q?6kJ9QmlT9q5SBbkYQHME/+qGQwN+cTG464QkBZshAo0xXCTfemgUFgBveCdT?=
 =?us-ascii?Q?fYAW3/DNZVfYRrv328fH3m2hNUlCz+RL3SGrlitmfoIY3QxThYmZg7gR1hvy?=
 =?us-ascii?Q?fhp1HEJg7inU9SIoClHzswDEluHu7K3VPLTSGLBhbBGG/xLosTrlwxV6B1MP?=
 =?us-ascii?Q?BzvnM4cxqlexyp+SsCUtLxM0Ve8ecXt/9oQLb4zLVev7CD4dw2SZgJVdraQt?=
 =?us-ascii?Q?EAHrf7HzVKz9e8j9iH7mf+ymgj2TW6t3AVLnTlTfiNjSKzH9xL2oucYOi/6z?=
 =?us-ascii?Q?ri4K4Ov70pXLsqjwh+k4JLCm7ZM8ZYccvVczVZEm+yitUCYq+ONrAc6NLWJC?=
 =?us-ascii?Q?4godOQuTBJp8cl5A15zSihpwW3y8Di2j9uTU5C+iGO4WEfLJeB2AAR6eYMJf?=
 =?us-ascii?Q?9SIE94hrIaKQedtgQL3OVZZPnmalJgWOI7FykwcXScGHc9jamTmoe1In899j?=
 =?us-ascii?Q?ttQihXOF+66DuOhA+9AnAQsolEqedxc5/OEvWhTwhT0+cfI1NqLXQ5yG2jA+?=
 =?us-ascii?Q?ISGoRXqvMWEK2elIr8nUTS/LjUiZDaUrkLpnV4YWWw0waWUjJsUYTjW6g2Hw?=
 =?us-ascii?Q?Wk8iDt7gMhrdr2bU81nYa7snZtokUv9zdIeKRlHFmR1vwxTVjFy4CzMF5TX6?=
 =?us-ascii?Q?ILjbBbYDNiXNJAYRtolsW2xzcPskuTXTci3zN5kHoKJDpDQClJJTKZl1D3uO?=
 =?us-ascii?Q?BobYjt4kwdEIXG4xN4ZdXN0zlmVzqMfqbp/o+5HZ7PmgoRqcknn9KSf2lrc9?=
 =?us-ascii?Q?pMFbpRDE3Q23KTQWEqKvy9rwhxI+YB0ASy+NES7QEwIFf5vBOKTkj5qnXRXm?=
 =?us-ascii?Q?8IyvFq3CtqcG8Rg9j2B3yWKh/yoo89tgmhmdX9p3iEWNmxNTMUttp0kEQRgz?=
 =?us-ascii?Q?13+m8v6yhCUEqOBSi4l7ubhBs9ZAQgkB67wWWa3dMWZlcHpZylBtnEtyJVOd?=
 =?us-ascii?Q?qWaJc42g8mu29bCjY+UE8R2SGevTh2p1KHM2uP2803tA6uSmu5Ank4TFtkA3?=
 =?us-ascii?Q?XRWrR5WfJYLwLcE78rBbTW24XaH1RTOr7LdyngWciFoZsYCHHATzSUhdKKYQ?=
 =?us-ascii?Q?fxK2BbqQ/x+ASpXjNBR7Db+xSFOqTgPwmupNP7t3AK9GJ0S44XOhYQr8SY2l?=
 =?us-ascii?Q?YD4Prk/f3PKV+FJ23+QgvXBjZoMcHGtrFepAZeE/WGJJTM/a8DlPwX/yolM4?=
 =?us-ascii?Q?NfD8hjjVJLhK5hCaRQoq+MY5pHxXq2kJmIPic2awiFj2zADb+xTzBYR2gMfp?=
 =?us-ascii?Q?SJYe1s3JTM2MxRhzZFXPoFd8O2m08sMEGaCc/xhiCKaVTt9njOL3GTFOOPyR?=
 =?us-ascii?Q?mOU2GLhnQ0T/AQrvXMD4Z70dzVzRQse48U914RD2szBBpWXUjtmerA2Ku0kW?=
 =?us-ascii?Q?X9b9IyL0JsncVWGUOCYVhlqd4Afq2/VwaNCcq9BGrn/VfF7g251H4QIyOR+e?=
 =?us-ascii?Q?2Zy9ixsjBBZOJYWtkrs/bTA=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3672323-a509-4777-59eb-08dcc10a2bc7
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 11:21:00.9431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NU/flp79hOdx0lszhx3nN1RG9Vm+pXFtCAtGXpI3tsRweM+HFbbgFaYTO3wHunJf343sve5FKHR3mL4JlrDVgoh9uw8mklDFbKAY5QdwK9YB/XfDmXVE8s1YXJetmLPK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0998

Commit f5502cd25ac0 ("media: dt-bindings: Add JH7110 Camera Subsystem")
adds the StarFive Camera Subsystem parts, also complies with Qualcomm's
rules. Add "qcom," substring restrcting this condition.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f328373463b0..7dc2dfcc1f66 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18748,7 +18748,7 @@ M:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/media/qcom_camss.rst
-F:	Documentation/devicetree/bindings/media/*camss*
+F:	Documentation/devicetree/bindings/media/qcom,*camss*
 F:	drivers/media/platform/qcom/camss/
 
 QUALCOMM CLOCK DRIVERS
-- 
2.25.1


