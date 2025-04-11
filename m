Return-Path: <linux-media+bounces-30056-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E1CA86469
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6E7CB9C756E
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B48962343C9;
	Fri, 11 Apr 2025 17:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="H8MWCXv9"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010068.outbound.protection.outlook.com [52.101.229.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA84233D89;
	Fri, 11 Apr 2025 17:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391323; cv=fail; b=RJwiJaolEYXZrwfBUKsmsiCojpAf8W9F/gUvSgJLDB82QAJcLOdhG2hmIFV+J6RfbZ/JfsSsjWxbfhepSDiQEBaHqDie8dEEE6uchfCROuKAIw3odjP4EbC9DeETXeXhZDx3sJ7JXL4zVgEMzQiXirrqtRumwBBcgsNvA09OXYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391323; c=relaxed/simple;
	bh=BwMdyd9cXErkqgO7KNE+QnGSmFxEJ9uiT/QszJkTmvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CidONY/ll73/le/JdTffyXal7XXBmB4/pUzeRj7VbZ/Bgu+MbX7GDdDoK1eAhIawxeZjS9HcLT7I5uzm6NUVT0VUQ+G2rq1xI7O91Wf5AQEk9fMGhxR0f/jGs6wAc07MLf2vDy0S4tMXPWqAvEjimlD/R4ljdjDgt1sPlCkge3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=H8MWCXv9; arc=fail smtp.client-ip=52.101.229.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ChclZL+K+JTN9tvZD61VA3ats2F9U1ydWw6p+3LpyBmjCqBYMoFyRtGQUtPddvgO91LBiw/VfoB1FUIp1Cz8p4yr5u0+oT7dMayE6I6x8fIpmMiSazBmz8zPk7M5xqdBbZluWvYPBh5WcpvIuC0WsB4DL5n/r/t2dI133oqWAulzPLIZzjEmTGMclKegtmpea2iRyL/Mr/Z5EgdhPaOcz9J9eKhpDuuFnxIW3yp1Tp7EBBCYRLZwZnS167/Zp25/9yHvGDRqE2Z9FPsAYdG/PKZp9or48t1SAuFti8oCdGhfA9vfF4L01WApD9sgXgdK98LOxf0DYC2KqVsBT+FrJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05qQ8UP3Aw+u40SNKlmVQBkWbhMPE8HadAe4XHbgzQk=;
 b=LpNPhtVNqn3tX4G/eud+Kjn4+zMjZwEgXtPDu6eighpMM4/JXMdkv45PNKiS/te9yTaTMNFtz4UgqvBesjMhg5PMdUbgOgmmwyD0YnQhbhHQSX1up2suR6jDvdDNnyWv51yam6eJjR0zZXmLikV9oP9NaXb/kmkntIA812KLUQgcR/i84JMSMIe710sqKdMw2n/q0NM7e0tTaFmKg/Pp9j4BSHHZj6zEQ9U+x6kDcXAj6WiDFXsl806JSFW42hjRlsABipeoPC6A+Pxa3XVDrOw/YIPA1TnCLOVZBOjbRSIivfrVhcAzb3plYJYYVUb6F0bAcOGwc+zBY46XYvnW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05qQ8UP3Aw+u40SNKlmVQBkWbhMPE8HadAe4XHbgzQk=;
 b=H8MWCXv9HUYZ2WhcyA+FMTFnO/MgmMdAhBfG5pINLPmherYVbxUttcRadFmeqFbSK+QLChhZh0rJh/lUwNOB222diIf1a0a82XaDTfCqkVpB77/SdjpzGfeJuWFWRB3i4255o5oSzkpsVKjf8QPhHh7+qnoji77A1ue7ZonDyy8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSCPR01MB12643.jpnprd01.prod.outlook.com (2603:1096:604:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 17:08:35 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:08:35 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 14/17] media: rzg2l-cru: Add IRQ handler to OF data
Date: Fri, 11 Apr 2025 19:05:42 +0200
Message-ID: <20250411170624.472257-15-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSCPR01MB12643:EE_
X-MS-Office365-Filtering-Correlation-Id: c6b01af2-414a-4216-0c23-08dd791b7e6d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TBmaKLKPbPJb56bRA9Rq6mfi+xk/6f2XAaqAbyhCjFZM9vLl/hVsq3g11v0s?=
 =?us-ascii?Q?tRMsv9X1rupcBPPlx1nkFjuAwxLetj/aLaCAISFhx4dxYBZOzEBHgO1XwJJF?=
 =?us-ascii?Q?VM3G6PCbO3AkMRekvU1ZYjMBOTmaMRNB2KfhhezwPxIJnhUV1rpCzO4skPo3?=
 =?us-ascii?Q?N/5AUDDRulO2cfwQgzCT2wXRFZGPidLgyxzvcTxfmc5TBU+uC7gg5XugnKAj?=
 =?us-ascii?Q?dD11dIfyfvyjyq7T1l+qyL/N4WTDDd3j/BIGKgKZddXc6AMpoKiF77Sif31e?=
 =?us-ascii?Q?NP7K7wOIInmNBDPYCDGLxyo3RbHSGXfs/d8ew9RlqGYfVNHBehGfIbLr/213?=
 =?us-ascii?Q?MQsKSXI92yM5UFZEXRNVt+HSRhTXkvHO/m7+oAijPXPNzdfXGBCfHTKc+urE?=
 =?us-ascii?Q?sE9kxmfCqZ+Nuk81vx2DnBj+Ut0qdG6ChmZVuzh5kvvGvI357yQviJVJf/4c?=
 =?us-ascii?Q?ipGmd3iaB7fTKB46bEYSxkegNLuOqrcJqe+8kPH6eEoi8735UnuSMSGewo1P?=
 =?us-ascii?Q?dVcXhbYxDReufHbLETjIVghmybdR9ESvH3x4pZaqQ5Xbu35c4HgraGv5KshG?=
 =?us-ascii?Q?rJtWDQrIlornXdc0Af46vPmv0qzgHRh0l2DpSl2FkdLJfoTvMlbfzTS/U1D9?=
 =?us-ascii?Q?5bf+O4F3F1M1ObXIBPL+tDG+TEHG4Upuw7z949R5Cbf0zK2ENUzufDzOs78+?=
 =?us-ascii?Q?AcKj4DVnKYA9SxKR1ZUJw1MlDU+b/kSd0H8TwWJWpW3iv4LETKWwC/lou3no?=
 =?us-ascii?Q?ARCB8HVfD8kUnam/k5ZhHnKjwk+yJgmkW0NyyQPEbu4jnTKWr7phl1hKXouJ?=
 =?us-ascii?Q?xFEF+mzFUrbbqlod8SXgYXveGFGzj3bLayianG2duncl9Dnxt7Qtb3bN7v42?=
 =?us-ascii?Q?l3EbZuRMn9pVc2cOT8ULzBqrYJ8AynEV8uvCOMZIX/i2eWoBeJcRrjTe2P/N?=
 =?us-ascii?Q?qHiF0/Vj7cEvvWK6Gx+A+YCFXTUShupnml5xO2Ch5m8qj584dlMNH3IisLYl?=
 =?us-ascii?Q?X5QM0fvc10hSvWWJEqij/MXJoCy7eELeWfvKgNDERAd96hWceIYlfCD/NA6V?=
 =?us-ascii?Q?HN0Ibp/Yzmy4airnHCThgc90c0fkjVS0jhyHLP2Wir93ijBvXx++HWQYUU+d?=
 =?us-ascii?Q?2lz+qizTruHajWfi57zHLN/eUf2KMgAMYMUWyWfXfKoBO/k+n/j8AtvDhfbA?=
 =?us-ascii?Q?ofYj6k51sCVrEnQesT0rK+Vt+3japEV/x5GTJdoJ2qVQGg7Ijq5gvtq0ZxeJ?=
 =?us-ascii?Q?P9oV4pm/PaKlO15JvIlyHWbu20XfL87So8noPy4FCU0VO6rZCcKahFW4Sg+m?=
 =?us-ascii?Q?HgkmYVgXYn20/v9ugIAbs9yqNqTes9g7SrG4hvvRUhvJitn8M8ESP54XyuFE?=
 =?us-ascii?Q?janRALz4vkD9BpHRzSofY1Ga7OsDCCsFVvyyr43bKyfDIsourDY3dsb83tyr?=
 =?us-ascii?Q?q76jxWgniK1ShYlNoFbDplPjyHpSvuopFl0iluun2ZaDYQSl8lS8Sw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3A0sR0wgJjCPpwCKNXiTJKRNYl0uiURUBK/+K4FUZeW7h3zXHGk4dW6Y8sm3?=
 =?us-ascii?Q?OdIDAm/FOMQP8Js9zri5dAaKb1ozCff49UTq9H6U40Z0Q/BBukavHwTQf+vQ?=
 =?us-ascii?Q?ezegE5FG55ZHm875NvfACFdWvZNV6xAJOMTLwsGNTAYfMaYGnC52Z85MJCGu?=
 =?us-ascii?Q?fpXWUZCep6L9xTScQb3IdAhPevDF8xLP9Zwu3BZcLUc2VrwGcse6On/oHEgE?=
 =?us-ascii?Q?n/Xe3b9jgBN38xWLDNdEWJEGN5MecJyCSvPahuXaPXPaz8DDqS4ZocQ/Z0bn?=
 =?us-ascii?Q?guzMbtxZhxJHMY8Bp0z6QQMAT7Y/jxX7qyWejT3dP4egbKdnGMdZhG4zkOgV?=
 =?us-ascii?Q?e4QcYMWAeg/+EQB5+jzKQ+p5oKU6KcV8e3JrdPhj9LvrkqD5VvZ6c5zNd72y?=
 =?us-ascii?Q?heStxBTlcF4dyAnIk6rP3jyXRf8V9AipbCh88jc4gk3unFd5biZKfq0wmG+z?=
 =?us-ascii?Q?hYsSKg0e8UQWl6ixg6wGkKdhDZTTJEM1YsFPnTKh/1Ram9Nu7Yma4o1jsb+/?=
 =?us-ascii?Q?zzc4OFOIGEpRsX3MM9/E2v/XkT+NxSRjgDUtqLXbdVxiUVf26ciRMN5WvypZ?=
 =?us-ascii?Q?MW0KgQZ0Oon3BJ0bUJDYH+iHqs7kVf8VuLWDq2vNPEoY9c0XdmiGn98Cvlfx?=
 =?us-ascii?Q?Q55/RQXIs9D0waUoNsFadqC7BKFOFg3+qp6quO9akykCQdOVXLXKo05GRSSY?=
 =?us-ascii?Q?D4F7J0nYo0Z9z8uGBSRh8Y3mLYq2EAahCFcTO02yxIpu/1/w2XMWjWyL4ydM?=
 =?us-ascii?Q?CDbSvFksozqwG8+wmrywdA3pU0THWhWerguW+bujbpy1HPt4HOo5lwIQT5xE?=
 =?us-ascii?Q?1estehJNTi53ex1XZy5ip1Q4o1Gzes68jWQHa1QULAkEN7U6ZX43O0/2eTxy?=
 =?us-ascii?Q?lb+jZvce4XhdpcOmr8frDQZvWidmMArXqDKU+AX5ZmkkIybIc+10GMuZH+ND?=
 =?us-ascii?Q?ty/ltDvqQxXSPwo/W9820CttT8SWYpcECJldq8yF3A+WJKoMHsY89gE727Xn?=
 =?us-ascii?Q?Nmcr7XiIIIxsp2Fx2/BEJ+n3qpmevTZcUAgs9sBudQPZI49rZ3/3N6eFCZFE?=
 =?us-ascii?Q?mtXK9pU2pFVsSvw+z4+shrMb0aD16adVIjHEoVOIZKaaEJoImjAy6ySUpJB3?=
 =?us-ascii?Q?q9ko0wlgYH8P/GrEYoJGMZE41tA9e+h+ABMQeAK5LeATJccPl4BVIS2+EV6P?=
 =?us-ascii?Q?2HntUmjbNnBUkYL72CTT+k3Avx7800vu8kbWcloVTU1wpZrTKwtV7FxXFQ7e?=
 =?us-ascii?Q?+qqsQURoZGy3WbIX1HM9tP/83qz0lgOzzeiJtYkhPktjlY8UdTZzzqeWkERo?=
 =?us-ascii?Q?9o27clhJg9P/Lu0qJdchyxF9bRjfGaHG31gYNEYu8BIycZFnu9eiw8no5K1A?=
 =?us-ascii?Q?AhbsvsZ2Q+XgiFfBLaKu2W4WD3u6RDT6nvzbTVJG14nc8fTXyUrIYfFA9TRh?=
 =?us-ascii?Q?3TpKAJGc0kj2DFwjG6DUuWQ8I7sK67VS61A0DeCIvtMXc6KMfCJrfsSg7YwG?=
 =?us-ascii?Q?4QprAIGoqcSKflbj9KuYf3XM7fMlTD4uOmeb0FaUJ1J5y39O8LOfFkmdTGxB?=
 =?us-ascii?Q?mbOlWnsGYn7F5YJii66jLO5FNKTMyPwPCzgymXYCJ+fHT+paY1/1/vRWfaVe?=
 =?us-ascii?Q?u4/Sx4l/5h/TLRGjFFi4C74=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6b01af2-414a-4216-0c23-08dd791b7e6d
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:08:35.1738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XAi1wOl5GPBbpS/3ZLT+G4VFUSgljfMxUHn2JrNRe1f1k2G/6U7K4zjV+EcOClvSMI3B+Wf4uvdzixw1turTXTA4ov7o9e5FJq8zNW97okIkPcdhUPWgsNqF5Gy7rvhK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12643

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `irq_handler` to the `rzg2l_cru_info` structure and pass it as part of
the OF data. This prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which
require a different IRQ handler. Update the IRQ request code to use the
handler from the OF data.

Add `enable_interrupts` and `disable_interrupts` function pointers to the
`rzg2l_cru_info` structure and pass them as part of the OF data. This
prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which require different
interrupt configurations.

Implement `rzg2l_cru_enable_interrupts()` and
`rzg2l_cru_disable_interrupts()` functions and update the code to use them
instead of directly writing to interrupt registers.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Squashed patch 15 and 14
 - Collected tag

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  5 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  8 ++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 19 ++++++++++++++-----
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index e7fef7f3f8223..ae989fa2768b3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -275,7 +275,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, cru->info->irq_handler, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request irq\n");
@@ -356,6 +356,9 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_height = 4095,
 	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
+	.irq_handler = rzg2l_cru_irq,
+	.enable_interrupts = rzg2l_cru_enable_interrupts,
+	.disable_interrupts = rzg2l_cru_disable_interrupts,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ca156772b949b..3f694044d8cd1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -34,6 +34,8 @@ enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SOURCE,
 };
 
+struct rzg2l_cru_dev;
+
 /**
  * enum rzg2l_cru_dma_state - DMA states
  * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
@@ -83,6 +85,9 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	irqreturn_t (*irq_handler)(int irq, void *data);
+	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
+	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -177,4 +182,7 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 95cce250b3272..a104821d823f9 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -300,8 +300,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Disable and clear the interrupt */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001F0F0F);
+	cru->info->disable_interrupts(cru);
 
 	/* Stop the operation of image conversion */
 	rzg2l_cru_write(cru, ICnEN, 0);
@@ -393,6 +392,17 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	return fd.entry[0].bus.csi2.vc;
 }
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+}
+
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+}
+
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
@@ -414,8 +424,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, CRUnRST, CRUnRST_VRESETN);
 
 	/* Disable and clear the interrupt before using */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+	cru->info->disable_interrupts(cru);
 
 	/* Initialize the AXI master */
 	rzg2l_cru_initialize_axi(cru);
@@ -428,7 +437,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	}
 
 	/* Enable interrupt */
-	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+	cru->info->enable_interrupts(cru);
 
 	/* Enable image processing reception */
 	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
-- 
2.43.0


