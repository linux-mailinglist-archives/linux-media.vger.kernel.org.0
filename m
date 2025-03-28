Return-Path: <linux-media+bounces-28948-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B60EA74F7A
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:35:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B192177D7B
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:34:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CC841E1A2D;
	Fri, 28 Mar 2025 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="BdaLdY4w"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862991DE8AA;
	Fri, 28 Mar 2025 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183176; cv=fail; b=r9T0I3wuGzQqo5LEP2UFZAWSB2y0QdsCey8G1p3r5vhP1S4Svug6ungYcIrwwhBup4RluBBNMEm+Z0RHJtAwAobzx1M/Q8rPMwe9PQsJJ7l7AGPu5gQuiemvQnGAWN4fREYiz7tmnON0c5Gjfcz42GcIGDmLAI4kKgBgv+T2/CU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183176; c=relaxed/simple;
	bh=72YViCBUc2DIx97riqsnuQVfu1D6fH2x6tjgOZq73dE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ANsAsLBTNHckmOO9yc3xjaB4bbJ4Km97wKno3ZFoxt0GUbBVU6K/nZi+onxJbFtyWrtO+Eb360Cl470AyY0dXVXAcvkgDnp0TRsIq4fhw/TPppqVJYBhmUIDhkM598zSTY2YOPAJUlplJiIoc9fXEQ9zal27Ehl3IRkoor9qpqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=BdaLdY4w; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQx/OCzAk7/7oyxUWJKcmcDIZzRDxsHiJqk0FacpRKEmeSy5VjO3n3ePY3iYme5MKYtaEcN5+7xb+EQODCs6hxmVgd08sp+0P/YenEkjE9AMSWyMX2tfC+afRKrwumAO9p3Aiod3LKousoc5932uA97KyWiOXBS6ZL69OX0XE91qvVLD0T0mRf0k1xAw8AKOzVy76a9VFa/yL+T1pKCd/k++REnWatS9eR99jLbdOUQnIGlstJ92abpT7XYWW5bhZVhvqd4kChZI3pHDPdDV56SPkm52eTwznx1cRGfZqF82ddHNW8KMO+NlaVpEO1pZYUweUvghZhFeONVY3jX7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uj/sNgo8Dza/0ahn25v30HSulEm2Y/LC1NBzbAHwG/4=;
 b=S0rrfOvpi75XnL12Y3o2lse8YtauvoYFZOTH3ZJrSeBGI8siXwXtEXmf4Y8LczGdU92mSZC9gUEx3I8bae8RAVDfAG8qdu6DAReFjBdMtBPZtiKyIq83OlpJFcio/vsoVbFQgNFzQCFxBYetN7dthtiy0ltcNsUAELbnUz+gYDYJTh1lG3D2wG/LPBNp9VgrkqvDwQ8tQ1Y+4tFdr7ewtaUjXgdd8jSWTY8stEvTiMX57DMjUz+J4szgnV7Ef4NVsM9O58AzWiBeVpCw+ECxuhBI7UMyAlohDFP9UFH/JMD8k9mwIU1Rl8ibQUi6czze4Emodw8ot97ZAcJUurRkaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uj/sNgo8Dza/0ahn25v30HSulEm2Y/LC1NBzbAHwG/4=;
 b=BdaLdY4wWnQ+jKMoAdP5dF4c1UAS5qm0GU0KLtYacbMsFsNR7fgJdbqkH5ugmo9gIPHF4KDKjZ3KW82Y+PUwH5pJ5XufZROyeUy0FvLEPm5r+OQWVjM3wrOiUkQVpaghepIr1jN0E23dgrmYUMqc6SdQFXaOMQXnntAGxrH59aU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:32:51 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:32:51 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 13/17] media: rzg2l-cru: Add image_conv offset to OF data
Date: Fri, 28 Mar 2025 18:29:49 +0100
Message-ID: <20250328173032.423322-14-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 718ea1da-419b-4581-721e-08dd6e1e908f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?glKGgH/mxejQEXhdTYyvSjHszeI3dc+tXpdxLqBhaOVLk5ay6oYyYKQz0m/P?=
 =?us-ascii?Q?UNYrrJWmOzaZMuHDK25pxp52ynSCuGHalfgJ6UXpJOKarRhAi0gdnRFKhsO4?=
 =?us-ascii?Q?cLxzJ3DDnToMulqBa4bOk0iwwTHy30mTJO9jmihpBig2MROWMPvQp5j5Bhot?=
 =?us-ascii?Q?PAleEViSgpV3imKApjcNL9BRSDTiQGNdTp8ORx1fRThMulCE2N50w81bYK+D?=
 =?us-ascii?Q?P1t/hQSz7ijjsrs+IDBaVocegowkgd/vKDEBJwxaYN6kV0U3qIeC7zaSopim?=
 =?us-ascii?Q?KVmzPenZHdQZuERUdofYF4sgv3ihDybXoOlfgmRDlGSW3Lx+Xgf7uB+eq80b?=
 =?us-ascii?Q?CIrkrkg9KvzoCVRwD8dS6pfF8KA7/5hQyzMIdfLz1YIECXJOn1M2YXR4Ae0h?=
 =?us-ascii?Q?BramE7XevDSEox/zXpDCROzBxma8xIUzBhCo+yE+Gt99D4eOOwjEL/xtkyON?=
 =?us-ascii?Q?fdrMmG4RLO4wpYFnSXD5RAwefykdkjDqYVDX3JCdT1q1IzF7AyEZMxuqao0u?=
 =?us-ascii?Q?J9YBdtQS9DnKhBP9t1o901bOGrW9UHLohPAPJH8l1pJ5IgtbflUnHmrg1Uzn?=
 =?us-ascii?Q?DKx/hXrR/tArMd2ObQ4Lrt1BAHWZlhPjdfF0Zknzuda21uWPrkASkM4kMmMd?=
 =?us-ascii?Q?HXUjJu71FjL5fcSygerxXFfuMGB4CKY9YviQYLlhhaww/REF9f6Lk2mFPsRS?=
 =?us-ascii?Q?JyvSjiuYpyvkX+54UaqiqPK8TfQXoU1FiHQZm7BqfIWuoaK6NLDpcQqMYF5k?=
 =?us-ascii?Q?snA/4Dbb4ZVT3T+2mZtQPYEyHhfqp/0bCGrt0m0N86xXT0HU0xjwVhZ0faRm?=
 =?us-ascii?Q?wPTGUDJrmt5GzZLACLbEFhp5+saQZLAU7m1SpGXsDW/C/13egf6IKqnY+vKa?=
 =?us-ascii?Q?jS4KuDe2ksXBhdlq8N4cKpP+7PWxJ5rWKVitgYRvoxcJCjwNQSe8zSvXAv+4?=
 =?us-ascii?Q?w3Iixx+ySip5qcVGefDHf0WEPdfBqElZfcWhm59k2kGGUVwldXQFvRNnQKGW?=
 =?us-ascii?Q?j/2S6ayevfUhx2/VWYzWTs5KJo44n6Dtv31crYQMsLzdNGrEVGNhyDykiDnI?=
 =?us-ascii?Q?YpHLCcusc8+ZDXX5o2utlcwaO26rJ+5IpCSn3EF1dfhrH/nYEJ1kgoKovJqI?=
 =?us-ascii?Q?z8ADcqXEwpqeqKiScLPHW8vrBX1jAQ0gHvtiDUFzIzAU3x3p5JCTJl36rrZ5?=
 =?us-ascii?Q?iJ051pYjAIbW9P3WBW/16y2USB1GY8ymH6NURHIdIBOR+UiC1DuXF6UqFJJC?=
 =?us-ascii?Q?KKew7sdRKFdRCvQngAsNf9nwa+FUzAL9vZaF1/WVj9mXkplVLc+GLN5P3bfv?=
 =?us-ascii?Q?jh78QModwKVmTzjV7GxfOpnmktU8UWPzFFNLJ8le31BS5iFEQfy2nmCVBIPQ?=
 =?us-ascii?Q?k5lpVp8Hscqqb257uuU9tEAaeKaBOamgQD2EN1oe0kLTN/UhSnHTLHCpfpti?=
 =?us-ascii?Q?n2fDBUOTUgRO6dk8kONzbMv16C+hFuB7Nn9dKPqM4lt7oA7MlWT37g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GIYWujbGpMj1nIqHlRGgaLg8MS8IAh4e8jOPtEzXJRCmAwKCpWHKeJX9QiyH?=
 =?us-ascii?Q?XMif+6gCABf9YzZZKOychHRAQLSj2wv6Li80FRDqdjfV5ynZJ0yFs1TciuNe?=
 =?us-ascii?Q?azT1W9YK42BLehRNq/zbHu9AUcvsGYaJei8Iubw2yDU1lmnV/pKSoUPreOUw?=
 =?us-ascii?Q?ujFEf2JS+AtDUgZbYcIB1WjhApILXcK76y5IjCzun+ohTUkJUMJOcqNFrQ9U?=
 =?us-ascii?Q?sI2jvQnJ8byxbqXl3nrFkK/W8fjW5aOPWGyApojWKXH3vHcGphEf1X0GWqrH?=
 =?us-ascii?Q?I0hdRfDLYdrCNtdpymIqSx1+7RPiH8aL0haTUL5ELVI61/3KiI0AIVRHDRTy?=
 =?us-ascii?Q?q+0NUZibpzMt8cTWyZ52qVtKkOrpxJsmgP2CqpcPdUsAPDMKWYP5kBMqPitP?=
 =?us-ascii?Q?I/aG+EfjlS34yc62+CW92aEgQXVeDyqeTGIGz239h8Bm2REHdlSopnL8Jx1x?=
 =?us-ascii?Q?kn8v3oPO06yLzswiKtaw823YGaob43EJ8iOeMXyjagVYDR9xpcHCZLJCo3SH?=
 =?us-ascii?Q?H1Ih8dtsVxhA/+PYBKARKbbRMMRoWquJADgBLEGf3e4FRhjaz9xWkRDBm8Dr?=
 =?us-ascii?Q?nrWde/KqLcjKnp6VuegHWgxRNDOFP7HsS4AI61/am7To32UzBl7zxGO+1/pk?=
 =?us-ascii?Q?DxWhR26xcEn6EMuyBYxeIOsQlTg13g83/xyRXtokIWuWSq+yLzz0Y/V1QG4O?=
 =?us-ascii?Q?HaOLn2G7vwNS2I1NG/ImIqOOZK64SIy621kC5nQ1nHgV9ZmNdw5jqCRAlxmT?=
 =?us-ascii?Q?MMx2rie7q1+6YtaR4uQpHckKQLPPN0dUKiURnIfNrBaNmVg60pvVdJKqYRWd?=
 =?us-ascii?Q?FbNIDf1ONJRwtRGgUm5YrybWTqk0otkh6uXoORrJwnuy9lCDKp3aRFltVWao?=
 =?us-ascii?Q?KMaoBpzklqA4hVwwpARewB3mJ7GuK/vysFvlWYIwIbiOcFwwkEa84nCkLb7/?=
 =?us-ascii?Q?WJEzxiPA4bBM3EZvxjebMFHW1BzKmV3O/0KZMpVjOmOTswd4eB6IW8wbLyQI?=
 =?us-ascii?Q?muMDG16AHG7U7PuQHIkmdYgXXsiKwkoDjI44C8Qvi/45NWZpw8a9c1zkSHZ9?=
 =?us-ascii?Q?D3oMs6ZFOyR5feOSgrRdX3dl5pZcOs+JyiiKHN2BzXvoU7ZRpb1k+qUVpo+d?=
 =?us-ascii?Q?egqgSl/UcA/RX9cj8icWWyIbYaqkpmrLZHrZ1c8gmfMGBGVr7pYe8BeTPFOs?=
 =?us-ascii?Q?rtGNW8uRPoJAtpVjKvzS3cPFk9F3ei3lEbqZwj+Ln91vt92RLVJDInppIn72?=
 =?us-ascii?Q?YS/aXvrmsVs02XrDFhnjR+zJaPkXDiOf1HHpf9kG+bf7J7I4eLZKZLgTh771?=
 =?us-ascii?Q?k3BlmdDbBA5VsVr/Z1PmWlgV4pu12d6lXo9hA9yCn4ps7+WoNGSGaZOAOo28?=
 =?us-ascii?Q?ENrvEBQUQGyM6VKt0qIRwTVcYA/5sjmeqfAHqob4EYXqawsY5oOfYIc1DqxO?=
 =?us-ascii?Q?+GhZF2fZqfKiUvrTrKrkOnlvwonKXiUIVBGnSPx6LMOTfODansqS5JNYy57M?=
 =?us-ascii?Q?ljG/3sCTzd0bUfzfGzKUHVb3ItYAfpD52527OfNmvO2ATpJjoBi061BLMAdh?=
 =?us-ascii?Q?YQBXBFEJET5RWonxBE3yJXuuSzeCOYZPPnxrYhfwPW0rFXffOPvIR1mdvF6C?=
 =?us-ascii?Q?VJJwBrnGxIkbQS0xVNct9Ic=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 718ea1da-419b-4581-721e-08dd6e1e908f
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:32:51.3282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HHowxVvoz9+zTTdmZRPE9FWKmC59VG7Qn+HzMPf1t2tKdphrje+mNk9LZxjs0wLMwiofs7R1/lzXweo1ztzdXR4Wh9ry54lGSUCabZHOzrQ9fBeKRiWVl9Ao1p+0tlft
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `image_conv` field to the `rzg2l_cru_info` structure to store the
register offset for image conversion control. RZ/G2L uses `ICnMC`, while
RZ/G3E and RZ/V2H(P) use `ICnIPMC_C0`.

Update `rzg2l_cru_initialize_image_conv()` and `rzg2l_cru_csi2_setup()`
to use this `image_conv` offset from the OF data, facilitating future
support for RZ/G3E and RZ/V2H(P) SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 19f93b7fe6fb9..7e94ae8039677 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -357,6 +357,7 @@ static const u16 rzg2l_cru_regs[] = {
 static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_width = 2800,
 	.max_height = 4095,
+	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 6a621073948aa..ca156772b949b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -81,6 +81,7 @@ struct rzg2l_cru_ip_format {
 struct rzg2l_cru_info {
 	unsigned int max_width;
 	unsigned int max_height;
+	u16 image_conv;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 395c4d3d0f0fa..e13f633a687b2 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -246,20 +246,22 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 				 const struct rzg2l_cru_ip_format *ip_fmt,
 				 u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
 
-	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
+	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);
 
 	/* Set virtual channel CSI2 */
 	icnmc |= ICnMC_VCSEL(csi_vc);
 
-	rzg2l_cru_write(cru, ICnMC, icnmc);
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
 }
 
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
@@ -276,11 +278,11 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 
 	/* If input and output use same colorspace, do bypass mode */
 	if (cru_ip_fmt->yuv == cru_video_fmt->yuv)
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) | ICnMC_CSCTHR);
 	else
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) & (~ICnMC_CSCTHR));
 
 	/* Set output data format */
 	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);
-- 
2.43.0


