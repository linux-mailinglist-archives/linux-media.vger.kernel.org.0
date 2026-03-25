Return-Path: <linux-media+bounces-57006-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLuQLh3Vw2lwuQQAu9opvQ
	(envelope-from <linux-media+bounces-57006-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:29:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB5C324E01
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 13:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EA823216C03
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2026 11:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281863D0902;
	Wed, 25 Mar 2026 11:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="ieM8iHRl"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021092.outbound.protection.outlook.com [40.107.57.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537D33CF682;
	Wed, 25 Mar 2026 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439255; cv=fail; b=NA+URHebpKRGcVuZau5IJCVQZmJN9hn0HQPC4SfpWynRjvlW72azt1ZSlYijuMKD44SYJUwSvxmuuSYDYbzxzpDu8RKX73SbnXlRp7Gh+GaTUFNbfHg50fiyVZjEXhcs8EkqdvgBfHStgsGbJg5mMlHOm5HkewGtM/+VQrC1cIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439255; c=relaxed/simple;
	bh=P4nTqaZeGMZn/EZdoQSpBk4fReRYtxEIEjhHKF6QBZg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iMVeWd1c7nvVlf3m5ynIre2St8uFymqrRwRSC+9pGB8pKgmSR8IjpFtIv/MFlKGMJlg3CWbQ0Hdqqumyf/WAndvE7JK+PZVc//vp9JmtV3J+tD5fQ99DY0Enbh11YfLE8FfDyI4HW12vZMeTpT0y/GywOJs46FjWk9fyltdql+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=ieM8iHRl; arc=fail smtp.client-ip=40.107.57.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x5yutHNIECx6ScZH5+CLmVHfVv4Wne3JnWJkKJpUT4MiWcK+GafVq2Sh3OGI+CjqedLb+4WrXQimob/wZTnW6EI1dZAHReFrMWL3DGpST6ODxrL5AJ+3pawLNcuZxGGTbPm4PF8+00ZbQTl0Cz/fwkXbwrDfsdGp9ltPnhrM9HiYSfxuScBkviMe2akfDApgeph3G3gqmPL9SQxxqpEqsqzHUtx7OjZowN8OGmoR0BHggry1QeCodeIsBrTgfBN9NWRfR7F5On4G37kP08u+nwB+rwA/N1C6P29cu2Mzo9rutnsVt4n4wxQhqUh8t2qTNigXQW4yCBa4zL6IIAKpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTvCUHnZzgZN8jdgQ6UucRi7PmbDQL5KSYAiv48Wi/I=;
 b=vpASA1HSxS4e9UbiY/V+yEFSZy1DiaN4/kKviVQBRrLHRXOk5ErmRE7AJxlz5+PJ2PLW5b0CFa4wfYakYUDsqTJFP+YymdqYIdhqoJlJTJG7l7vMGJd155aCM47h119pJDPHPBmB6LsBl2WcCjF9iq0kgmge6KmLyxdC9GpK4o79M6/DXIZh+wNlEbjdXfKwR+dbbOgsdKAze2RzzF32eUb4uyqf6SbHEMw3EvCAvlDYwB/a+eSp7e5uQut53nqsJ7/nMsPLZy1hyoP+LCyv3O7DGn7hL+qtg4VKky/Bu6EikIw8mtYniEK6k8oPspEhXQf5ivTitGHl00swI1ujbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTvCUHnZzgZN8jdgQ6UucRi7PmbDQL5KSYAiv48Wi/I=;
 b=ieM8iHRlR5nc1g46GlIv/bc9IXJVzIojfZ7n3bXB3lL8ab09C70Dp2WWRsmJSVDz70hS1wAZ9lFi/d/qjbdkV73V0kTSeErkW8oSI5VPSmj8KfRC9B+MxBFX9RHGrVkeqOieaGxe7X//pdxF6dvXBuHjNGGGQfws3d4Ab3AM6hNTffQ0XfzIK8IT/XgbOz2cXRUWc/cXJeZSX4bR3F6MicTR0xmMPRW7mrWBE8UGaaH+c8LHcuSoKFOmMWiNiAF6ubULnqU1ChU6cmv518/EASwnnhZf1ueMbHorP7BLB1YlsvIt9nSkywV0EBieCdXDaOSMHYu6Q2hbisH8jMNFTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB4294.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:2a2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 11:47:30 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::ce63:5749:b390:508b%6]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 11:47:30 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/15] media: i2c: os05b10: add V4L2 digital gain control
Date: Wed, 25 Mar 2026 17:13:51 +0530
Message-Id: <20260325114404.95188-6-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
References: <20260325114404.95188-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2P287CA0008.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::13) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: 219179c5-50fa-453c-597d-08de8a644b8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nDucQDkMS36BrwC/3F3mvPRzsOZyLiUoLZ4fZspJ4fpnPgxnSR8ms966p5Uoyt7/2QX8Rw9AzgQDGbcgbi/Bejoltdws8SGIs6Ewn+SGaPcBSRBFzmcyeR3Q0YF/aEyRr1JLV4TC6po77kemOpiZdVkDuFyPN+sk4urc9v95cjxP0z3pZwtoM5Tj909vkEzQYJ5exhbAKTgFmsVeLp5G/+9H5ANEu18sf/A9gLLo8czcvkowDOGWt0Q33ZgLVjOpCOfhkO3e69TtcaiIBlOyBDz0kOI2K5Ih73JFdU/ckPk27c75lC7NdzKVOt+v+DGC1dTVrgkd0079fEbkl1i1ob3AiVAEtDTRseAAWlbl/nxzVRRpYPHPT92oPxspto0SxG8V9TSQHwk8ntu0te4DAQoB3DDB3CqisMGQpa5eeL4KoHyhhWtlc1BCWTSjB1903K1z3+5pTV12U4uo7kTL8XEzjpSaRQiyCKH1kzL/wg4N1h7Cot1OwJ2YwIgFuXJOHasING3fjeaaiJ79aeTWxlB8O4zuXQxHI6JPRwHWH2mB4G4kXPQ6girBATMRm+6a1xKEG9olo7wOSYjPJxgCz+8vXF9X4izwD5YoyLZQKTFtq1B9h7UF5sCQYUmb1VrdnT+sUAAi9hlmIEg4Pdk1NHJbN8L984zIiDAhl1ATnDjdxSuqFnyD2ykd5CVGf1a2ht8RLG5AvDzUpK+QlCSwb4O9OERleuNHa6lXiBNJa2Opp9GxfmPprgvara7SWpS/2mZ1wG7OmuxVmx7Q7SAa5L3JfEn/d38K7idfHwpMgSA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HPshzzn+WG1/XTSexQrpiTrxos+AgfWnUUvf4vzAJn6L24P/977DjfHrCP1T?=
 =?us-ascii?Q?lbs9BVXyExrgieLyLxezdX8U27YmFDzl6tDGojk2Q/Btg+NXTB8JbmUc2spZ?=
 =?us-ascii?Q?KCCO1DDuXYNVcejORhE+qo+R4qUtHDF2togkrqIAJsEaIDVu00+vXBTd+Zb6?=
 =?us-ascii?Q?cSTrtJykEhCNKD+kR7Vzkq/N6B3s9ZjAcvvJyqnh0P7q+zbCnmmwO8v+mlzM?=
 =?us-ascii?Q?e/C2oeJNlpor7XKN9w2guv72Vv+jNeehfTaVbQp6dvfocMnB9XbyApUOLKEs?=
 =?us-ascii?Q?OJA8GieOTKByXjUMOEPzA4S35Ao+kI8gO4t4v/PPxaX1W7DMzXtrMxTz6WXV?=
 =?us-ascii?Q?WXhQHYprVyrabuvEla44Ne98HM92OirVa+znr3WOSswBhVOaFjt26BT8//Hg?=
 =?us-ascii?Q?+jfnmiBin+3QIBf5GG5QM69eldi/8Pk+Id9I7ggt5cCuRUEzQ9AFMGL4Cwsv?=
 =?us-ascii?Q?vBrf1rZXsbqxqjGFUrO4lSzIiFIwFOQNNSe4KbrSjs7/HYkZ+8p66KFjEFWP?=
 =?us-ascii?Q?JairiRawxjZRvJWO2/1Ny+ao90yBVUmOS4kWw+wsbrpN76OTEinoDW9T37qb?=
 =?us-ascii?Q?qnT4R1VugUuFW4dHvxYnyfGqJxkwxxJrpDeUefvtYJ0ztAZLqQfVhFq8eicX?=
 =?us-ascii?Q?KlVeFwS5pXAFE1n7/EuFi/3l84zwUS6CNcxClzhSLKfiIz5/+8RJcqeObSem?=
 =?us-ascii?Q?/qOyRcnSHkimzyY0YlBvFssgCIg+e9QUleOiR2vLrWEtXSFXppl7s8Gf1w9O?=
 =?us-ascii?Q?wvuJcXcvVNqbTw/il+E7mhoTwIykP/YFaILVYsm6ImO6IwtIF353uR8mwOKm?=
 =?us-ascii?Q?B9eM7dBGKTnXOHhTWg6hJ16YpLvy1JdyFvHoWaHgeXGA7MO4NJpZuIs7AkDr?=
 =?us-ascii?Q?S8+3zUECTYvOdPt1CynmD29a2/MyC7UAr/JIkbzlwKK5yvSDK02bZJlVxwrz?=
 =?us-ascii?Q?Mul8RrvApRNIKZloPJiVPp0YyqTjLNg0FRbtIS+VzoBSjORTsZAc3CHZG2sh?=
 =?us-ascii?Q?I20SpQYgHp5NVK+h49odWDwUXwuMquthqHa7HFjzGxCUTdYoGBYBTepi1NUh?=
 =?us-ascii?Q?f76f9dFLyM4xb6bY/lllOZOZf3CrWqhSisqiOiykAIZcEP680uGUbA3N1dhu?=
 =?us-ascii?Q?Y3bSt4uVKA/mgYcAec97T8fIMYeaJ8nn/AY/uwj25Or/MwHGPq1RaOA2A8U7?=
 =?us-ascii?Q?2913nTU+azr8Je70brmBNo8jZVx5Q/WHQb7qQkhPlsRjHyhn9bIH4p/8G3MF?=
 =?us-ascii?Q?pVEwcdHioPbflJpgCd8Yum2ZHBbZrIRptzBuYRxgAtnEO5BBNvKUp1/QnOqi?=
 =?us-ascii?Q?k5HQKmUtl4Q1m/XuqEHji81XNZw32+TO2NjGmC6JWH3QktIrazSLQwA4x/sk?=
 =?us-ascii?Q?qubwBNhP9jd8BQ9h5VVr4VS+Mc7D9k1xEoDT2S2ZDCYXjYEtUPnqf3LLEktI?=
 =?us-ascii?Q?ozzC6WHwGJkmnHmC/8OZILqiGIbmAIEgqhMrvs9Nen5PaYzMfaRWX4OCf4MW?=
 =?us-ascii?Q?V0L7BJDKD0qA0IIVJ4YC48KEuFjIxyTxZ9V9J15EnnxBrF2WBKQn8UGE5xRP?=
 =?us-ascii?Q?p3Nzmhrc7MoMG7Y3JSZSoqe47zmjyjezrHyJCh/gOji7wODUg0ESnlfN0qFn?=
 =?us-ascii?Q?7UdLGAl728bo8NqwEMZnP9a1l9kxgSjllz4u9YOSlE6SA9pXJ4PorNIvRvNf?=
 =?us-ascii?Q?Mz4TNyn3dsDTDJMjX5i63LYWS0E85XypVeoeVXaLRdb6zTMCr4hvKq/iVOdU?=
 =?us-ascii?Q?n4U5T3XXD8QxWGe7VQxzvSLWAHzxFZc=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 219179c5-50fa-453c-597d-08de8a644b8c
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 11:47:30.3099
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h+sEt7pbtDYet+jvpf0LjM8iwNgJf7fEmVySpK+AjVRfESe+OvGJongGzL8dtjoK8rQcfS6KfpLMUXCxIlbrX8w8iwUX13SSYQ5AXDfoeIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB4294
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57006-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tarang.raval@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Queue-Id: 1DB5C324E01
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Stop programming digital gain in the common register sequence and expose it as
a V4L2_CID_DIGITAL_GAIN control. Initialize the new control and handle writes
in the ctrl callback.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 9499867ad40e..2f47b02149b7 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -129,7 +129,6 @@ static const struct cci_reg_sequence os05b10_common_regs[] = {
 	{ OS05B10_REG_PLL_CTRL_25,		0x3b },
 	{ OS05B10_REG_MIPI_SC_CTRL,		0x72 },
 	{ OS05B10_REG_MIPI_SC_CTRL_1,		0x01 },
-	{ OS05B10_REG_DIGITAL_GAIN,		0x0400 },
 	{ OS05B10_REG_ANALOG_GAIN_SHORT,	0x0080 },
 	{ OS05B10_REG_DIGITAL_GAIN_SHORT,	0x0400 },
 	{ OS05B10_REG_EXPOSURE_SHORT,		0x000020 },
@@ -550,6 +549,10 @@ static int os05b10_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret = cci_write(os05b10->cci, OS05B10_REG_ANALOG_GAIN,
 				ctrl->val, NULL);
 		break;
+	case V4L2_CID_DIGITAL_GAIN:
+		ret = cci_write(os05b10->cci, OS05B10_REG_DIGITAL_GAIN,
+				ctrl->val, NULL);
+		break;
 	case V4L2_CID_EXPOSURE:
 		ret = cci_write(os05b10->cci, OS05B10_REG_EXPOSURE,
 				ctrl->val, NULL);
@@ -926,7 +929,7 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 	int ret;
 
 	ctrl_hdlr = &os05b10->handler;
-	v4l2_ctrl_handler_init(ctrl_hdlr, 8);
+	v4l2_ctrl_handler_init(ctrl_hdlr, 9);
 
 	pixel_rate = os05b10_pixel_rate(os05b10, mode);
 	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_PIXEL_RATE,
@@ -968,6 +971,10 @@ static int os05b10_init_controls(struct os05b10 *os05b10)
 					  OS05B10_ANALOG_GAIN_STEP,
 					  OS05B10_ANALOG_GAIN_DEFAULT);
 
+	v4l2_ctrl_new_std(ctrl_hdlr, &os05b10_ctrl_ops, V4L2_CID_DIGITAL_GAIN,
+			  OS05B10_DIGITAL_GAIN_MIN, OS05B10_DIGITAL_GAIN_MAX,
+			  OS05B10_DIGITAL_GAIN_STEP, OS05B10_DIGITAL_GAIN_DEFAULT);
+
 	if (ctrl_hdlr->error) {
 		ret = ctrl_hdlr->error;
 		dev_err(os05b10->dev, "control init failed (%d)\n", ret);
-- 
2.34.1


