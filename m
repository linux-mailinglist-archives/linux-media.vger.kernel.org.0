Return-Path: <linux-media+bounces-27064-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FCBA464A3
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:27:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0837F3B5451
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7D0722A4E8;
	Wed, 26 Feb 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Q0KsTCoJ"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3C22A4E6;
	Wed, 26 Feb 2025 15:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583553; cv=fail; b=BOYG5fzsG7DDBgJ1Gz5JvABzWDrnDHQni4W3hta36i2QEkkBcrRQbeRNJzchMhxHmpL7679vZheRZ+w62DNygFzvOA0miUko/Y9Hxwk2/E506jwaD5FCNuzvCoIfIiwz/7+PscKr36d8sLQBLS1rbcvmCYR6k/nFGXEGWNMd6FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583553; c=relaxed/simple;
	bh=9j4nPijH4a1+cIb9R/wA4gjImTTmMrJZfHI4NuQOBVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WVT8xn18qTBytTh//WuFrHZ5D73BB7s1e2SI/Zf4OZZyDqKOhx3VeJOHYJu0ICWmIyCYgjThC7Jj7cw8bf+WQOQQuovPhlWWh5fWvTFYOXrkBwM5CKx9wH3XjzZqinLCFrMc1EOTd+56M3g4MYvFWGz1Ce/U6XDVVhRttnx1ayo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Q0KsTCoJ; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S5MXbkgfd94997NXP2j4JjnkBUwOiD3+SjGaioxiPST3pkhl7OAxVvQKOXo6fnQrZghPe+YEqzt4uzxnGTLCkoqki/gpJTBjk/0T7EhaMKZy+GAvsKhmbvhfm67gb4qX1jj3LziAtWkc3fZre8bihucL5OpaEB8VGxvEhriYpdm5B1WxqmPCWazQ0gug2OHugH6f/NOyiDfq7+6ZSK6C1ldpQgXFOmRIz5oyiR2W83u5YbkUkRkSUIIeA2O4OLhW42AVdKzgi7We1XycVGmzKCTnsNh6/wHV+scG2LBeOnZuOmD21z5K3pb4jzVHkLkjFl0YggSUJhuHHUyBivjSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QqV2NgZjXgYjDJN6Evb6jvF0zTwv9S7UT5OmB6zxDc=;
 b=AYfV0G/LLpioJRckld7OBh20HhvLeb9b3bmaVIqdB+4N9S8aGu2AWRMDxFAMWwsOI+D7yuffF4LgnMQYbbqeyj4L/bRrjcuDW5klst9QFdWIhEwxeRlXl6X2NV/aR7PgfLTZzf9v7BMAIK1/n0YDW9G/efgjxiQTZ0TMrU+w8PxRArcbMRG3fgnOAZD5qmUvxcgbqP2r8I6/pKSiHeiTtCI4AcU+uxKku+MPQ80t49rsGuDRErTwx/zMhAHjKgLHEIy0GAtLIn+WC/oejO2YLCMLGVvaGNwWyGywD5LKgcE9EPUICnMZbldbBnfgrGIVtJ9mZx2gxzqYIqc0KPMZgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QqV2NgZjXgYjDJN6Evb6jvF0zTwv9S7UT5OmB6zxDc=;
 b=Q0KsTCoJpnuWvXxrA9eKpzlBR22V1X8mMn7GsGhCPZzHXYopH8udNyUzvgivRxpRk03XUNPvIdLxHaYD0dpJsDesEXAy1cQd0dppPRySYpgewSA9ebhk6ETs42hH9SEK7/v0kas0XDEAqsX6SsXAxMesuiWypegQ+Vrxz6cuA0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:25:49 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:25:49 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
Subject: [PATCH v3 05/17] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
Date: Wed, 26 Feb 2025 16:23:29 +0100
Message-ID: <20250226152418.1132337-6-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 12a63815-a949-4e8d-0473-08dd5679d8eb
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QcoPoDZn9DuTpzbcFGUn2pWoCnTLYzXCRGVNgqFV6AjXgfUb8N6CWRmYVMVB?=
 =?us-ascii?Q?eEz72J3/QlMtnH/vDqVUh9Ep1oTSfHOPAO0w6AMfHqlbXPugZgtD7tjGFMd2?=
 =?us-ascii?Q?mFNtC0c4ZkubDD3d62TsrvZMBAm3xP6SDv6sHm9XxcFBCpMng0iuZKskjBlb?=
 =?us-ascii?Q?4sRR2mumowxfzNfOFkMtV3cOBs2qX9Ko5XYCFh/NnlJ4JI62h+YiTydt7u6y?=
 =?us-ascii?Q?MXoxqpEw4DC0IJiMQMnx7MxuQP6QeHK6MXbCQpHZDogKQoLvsTFYdvxQkYyv?=
 =?us-ascii?Q?VFmCAs/DYk3iXjZWEcVXl7TbW5lodFUNXNesiMdLKp5VXztT4dqhCAuPW+sh?=
 =?us-ascii?Q?Pi7nNxlbOrwGfQ346apps5cS6J5Yz/QU0uOf5tAWvo6iVfa9jST6lkNgmwtk?=
 =?us-ascii?Q?nXmz7mNn4eTO9ZvY0RLLLgDgcLPwodwfg06N1bpjcRRixd/Pf3j0S09a47Hy?=
 =?us-ascii?Q?ssqS4nE9ySt7Ijsgoa2l9SReG3r6nLHgzlJNCNTFBRR5dQxeqsm+v383vPW3?=
 =?us-ascii?Q?dwztUq5MNGZ6qW+OCO4Ryzi7DerXOZ3sn4RifZmM42vptu2sepNqwSzfIw3R?=
 =?us-ascii?Q?3wm7jY9Fm+0fBAXSybs4nXbUI0XKWLpLJ97j/lJ/JvAH6f2djtazDFr7toa1?=
 =?us-ascii?Q?NMCVVvXbDsAN73tzljRquiz7z6eZwpzRK2HRsepBZhA8toFkTHTZjhqLT8LH?=
 =?us-ascii?Q?/nx4LPvaSSgRl7QL3ss5zBJQcxv/Vk27Xjv7lklVyRMaRhq2ZhwJdX64qP6v?=
 =?us-ascii?Q?h9lO+L1N7tb72snOeHe6b9YjRW67le/3mrqfoEWOXXgvabXJo+gcTmek1luk?=
 =?us-ascii?Q?VHdthApwGsuZ0TyvunKg37tY5hyOuFElciriI7lwG7J54qJRROu7JP4vdWev?=
 =?us-ascii?Q?np/sfpjcNK/C2gY7f0B0wAnBf8c6x6nyWPN3/EgSGjWxcti5CGV+LwHsuXI4?=
 =?us-ascii?Q?YtPUB1MyeC15g/3mNJWYFsKfAy+WZexioo5+V35AtHDktX9Z5pE/hWky1A+T?=
 =?us-ascii?Q?nzEmxzDoMNkruzgN97BVcS1JZsCIRbDCEHMVkgtr3FeHDTrEKn/Rp/8fVwf3?=
 =?us-ascii?Q?UFb40Vr0zlant8lqUltruep9MCjix1ORDtc1bORUqApsCq27poipxDCuyAJo?=
 =?us-ascii?Q?eLAHh2HBCj7pvvM1DaBRS9YHWQwW30iYJqmF416dbuj/wsBaFbUmLxbJVMdG?=
 =?us-ascii?Q?WQQz17mQZMeSYQXxCPoT/ePFofrQfu+jy0UvBgcVWJo/sWz9krxbM97icVdk?=
 =?us-ascii?Q?GDfbzoNIBrQMLkuErDI+Bf3SoSdlGXrCvPiJ9D7DV6QcD8rC3EIpeC8pBncF?=
 =?us-ascii?Q?OE0oxdONVYBfutN4NZvv1PRMSqIcvF9DoSK2tMoLLnqsxPtr63aLuDxKh85u?=
 =?us-ascii?Q?DT5mlXrvBv8zSHLfEp5rNGhKlKZW0/x6O3fVcEjrcp3F9TG0US7u8h98UOYu?=
 =?us-ascii?Q?3S7gvo8eHh6fVvKxfqeHgbK86Qd9NZJB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BAx9XoP0/4B3wzheCnS3kBkZzo8xDjZZUvdlxDqKgcZF/rnMesRi17ka3m4g?=
 =?us-ascii?Q?VoVoh7jnokm2TocqL6lMuB2IYatP7q4smS0Z+e8geazULipkDQU6aUDJpTte?=
 =?us-ascii?Q?PeXefGu02Fq1+pkXeHqj0z8qKviOAgKFn7sXSK89y1a8wt/a8xESDTy5EODq?=
 =?us-ascii?Q?+O7tOfhpaOZPNiaeIhlVSRPJhWlr9BWtoSEAkRtlku+X2QjZ7Sv6hfw8ym+p?=
 =?us-ascii?Q?0V7lv6Xt0RX8B7fA2vy7k5iMsk/x3/b+h9tJ/u9nVSb14LHh75yWKyD0iyB6?=
 =?us-ascii?Q?+DETP7+J8nN379MFV/ddU8CXChFqBIEygKucrhL6ZQ1cPqRvFqL3pEipVzGn?=
 =?us-ascii?Q?HOwmrzDYEn16QdGuMDUBikSkTQPPEnmQPv3VCxVuW5E5LK8tXoycyKZv8XVK?=
 =?us-ascii?Q?FMVJSiOlMT5Q+eqolZkeYnHEpKQOr2HLFDLfVNRl/qTXsAZn2elI8IkA+7SG?=
 =?us-ascii?Q?9cIOLfN6dwqZ/fqTq3ON3O6JB4iAhDJIJImiXGrkZUR7scCpTKDGhU7KSzgF?=
 =?us-ascii?Q?YDWZhuJzanqigygpJwLfldTSgX4neOXWTrY9lgGDyUWamRMm5jZQkvKDTOn6?=
 =?us-ascii?Q?Q4AjoKjzyySDc0EXDaCI7MwqFMclapEeYqOo3l5OVOkmmSO/LDrQN10YaVxO?=
 =?us-ascii?Q?UrgnKJaTLo4bGBkExbGroWbVRzOUYI/FSAT6pJ/AlpEAEG6MOCfBspj0bsty?=
 =?us-ascii?Q?O7idYVjV/HT42ARMBK2VsUZvIlnYuBt15+7RH3j7duTlIweMiY8wCsUDDI9O?=
 =?us-ascii?Q?gQN9vLDmUiMEKYwNHiHTQgOH8mHTbNEyeggAr2vEpcmGD38Qt4LTcR3ssp7o?=
 =?us-ascii?Q?j5FlUwSdmSK1jyc/zNsMlCqtCm5LoQRfKdnx6fIZsSGmCNuHC/dvFANk1YM2?=
 =?us-ascii?Q?aDebskp8hrlnVgZN1IjCcl0ggK054AFMQXNt83kKTPnqTgkVPHaent8pzdOQ?=
 =?us-ascii?Q?erEA1nWAiaag9T5rcJE98nooYui3FmHIz8RGMT4lKv19QFKyqAPAf0dIF+hQ?=
 =?us-ascii?Q?fLcPadouWaX5m9TIb+aOb8g9z1lgX52m63trZEd4TJxy39kbN3waMXEO8BWJ?=
 =?us-ascii?Q?DQSxaUalDHkJGJaw7lpyNJlutD5V8azlQW9Jpulr75vJ9IwVhtFEJEVueDaN?=
 =?us-ascii?Q?ITssSXW/JdTnDR7/yCsjhFdVWOabA7HOA3OC2nRXdDelwL01bSfEstZSoqL/?=
 =?us-ascii?Q?GpNtWkvdXPB30ida5FiNithDXlu+DMeXFbiv9Oi177wpJmxI+6p5W1nZONzW?=
 =?us-ascii?Q?F2AzhiOwVosLdY+j4YkOIpwIGYh+nEhM6v/erVI575pjovl+IFJQCZLufwHR?=
 =?us-ascii?Q?Z+3psdtvrhH8gdgB3mblYIZlcP2ScQeLem7PAwIxVIjmVQ0//7c8lDgOeCrJ?=
 =?us-ascii?Q?wwA/aYs8sygimWu95dEh9/a1+iStgZQ7jXiWsjoTaR8Qm6J8PN7v10y9Pqv5?=
 =?us-ascii?Q?cDlZCtNC0FdB6M9Eklh4iisgJuY7TyhvhBuF82gUn+E7xs4+gJFi5KcSIjyC?=
 =?us-ascii?Q?9INjdzSPPBVHDLTlKfGsliAqYwEvQBPJoR8cZJpCsfvkaEef8bbgYTNyLEFL?=
 =?us-ascii?Q?5M6XxM+Os9Wo6kBRcq1Q6tcdVIjjkrVhxKBdZ4YlDR6YVWNdrPeC0IMRy/1u?=
 =?us-ascii?Q?JN9eXtKiySWPnTQCvmre9oo=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a63815-a949-4e8d-0473-08dd5679d8eb
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:25:49.0016
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULf22aMYqkVbr40Kz3SDSYflse6GnDlLGMY8J/nyz7zRzfKIY9X+285x4VdKJHqrhJZLoIQzAhxRSkYRsct6H1asvFUVCgYPt3rT+mFJvWfuWJE+9949TW/jDtyFJfZp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

Use newly added devm_pm_runtime_enable() into rzg2l_csi2_probe() and
drop error path accordingly. Drop also unnecessary pm_runtime_disable()
from rzg2l_csi2_remove().

Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Collected tags

Changes since v2:
 - Collected tags

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 948f1917b830..4ccf7c5ea58b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -805,11 +805,13 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(dev);
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
@@ -834,7 +836,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
 				     csi2->pads);
 	if (ret)
-		goto error_pm;
+		return ret;
 
 	ret = v4l2_subdev_init_finalize(&csi2->subdev);
 	if (ret < 0)
@@ -852,8 +854,6 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_unregister(&csi2->notifier);
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
-error_pm:
-	pm_runtime_disable(dev);
 
 	return ret;
 }
@@ -867,7 +867,6 @@ static void rzg2l_csi2_remove(struct platform_device *pdev)
 	v4l2_async_unregister_subdev(&csi2->subdev);
 	v4l2_subdev_cleanup(&csi2->subdev);
 	media_entity_cleanup(&csi2->subdev.entity);
-	pm_runtime_disable(&pdev->dev);
 }
 
 static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
-- 
2.43.0


