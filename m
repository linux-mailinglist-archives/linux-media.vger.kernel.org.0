Return-Path: <linux-media+bounces-20456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 869199B3A1C
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 20:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46C0C282129
	for <lists+linux-media@lfdr.de>; Mon, 28 Oct 2024 19:09:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D7F51EE031;
	Mon, 28 Oct 2024 19:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fZaQ7Wcm"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2049.outbound.protection.outlook.com [40.107.21.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFFE1E0B7A;
	Mon, 28 Oct 2024 19:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730142428; cv=fail; b=SBOc9Jef5fY1m8VrT9JCmssTSIYcpUIe0VMdlJKNsvwgaUH2vYCuZwXfehTvC43TsDKbGOFJPi3o3Lkc2Ttdq8ALpnxgOw9quCpubvinOuYPttQvTcbBFNAkxecVZp6IGa9aBsUfsJBk20sUnA8NlIoU5NWqFJbnDCo+ducOGzU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730142428; c=relaxed/simple;
	bh=CgF7q2Z6ySMM7j4NxnDiYcGBz1QPv3/P46O4jsHryk4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g/QLfviHIC+NE5D96MfxhrQM1O3YrBFQUfFY6XQFVTCh10t+TTswl7NelgnX7Yed65PjRKYtYGuUrETyhYLXOu8NZuAhZeKjM7MdCjFjx4SQIc+Fg8wiBdDwdn/I1gk+G3Hvl7qg6jfj8KA40Gg9UmnqVIQW0ehP9nldNiE6beU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fZaQ7Wcm; arc=fail smtp.client-ip=40.107.21.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FvUW5aErXZ5mQtz31Npt9yj4P3+Co+YAIIA9pE3Vb135EuwtJWjylTQ6yVnPRfr/lkgrESVyRAUy58bHMiZsNvYTOfi6kOoKpkMdizyPjPnrJog+e5/XQnEjvErA/S1Z1WWX/yBHzlk8wRUmv+iPHUmNsZ60Qhlqh4tzQazMF+w5unKo2ZxywFxu7+lD4VO4bdo0gZc4FD1xmqmtYtttRGufubBPTmSAz36RqtsBqIdeO3nLjrfE/TBzxqK/B5iTiqkul3IP6Mr0NHhC3YeqjedZ/WYJSNVrjMYhqI8PA5w8FpPrulrvZ7Vy1ESXLAUyEmdciVwvwohAqC5fgoopnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOpKAgBlDaSsD2Uefq5z+Y/+mIkZ4a0SvPIF/56f5SQ=;
 b=Kasr0L81Pp0x1LEHHkp4vgP/toOrhb5EtaOJyLSVGzPQVPC80Yu3ZQfkEjGL4dLHf098PnvhiWzbrYfEEoyCFiX5J0JRZZ2nmtKXRj10RSxtSupPKu/8JL/M6U2fJW56HHgtS18vX5JCkjluymskyt4br07PCEGNoVEZKz4Mbx2nEc46r3TzcUsH+746W9ptiVgMmLYaozHQvbWDmEAOnEKR3BSOomXfoWANH/op4DBrND3evLdBPHGK/I2hzI2hIn/VjoWiT6FcyUKHnjrGfTbjiI0VHnUSdsgFs6hSc7cwnZLqTajfUAjAjm3sSnVV568jV7JT2yTojXND+JBUQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOpKAgBlDaSsD2Uefq5z+Y/+mIkZ4a0SvPIF/56f5SQ=;
 b=fZaQ7Wcmguyoj5qGEoOu5B1Q4w2+4Pk2eCGWSdlH6C7BdualdrZJvmzZOGLrMo2R886locUvIPKe6/ErY/tOimH1qLwKKmwrtAGaB/830FKO+iGKBugLFpF02n0Gx28HN+EpOrKbrcFqoZxJQXXaKifDHgNjIYiyModDdTEkuq4uIAoZq3Cv6IRdT6SQU3rvG2zNZKLBlbjGHwzjsiZaRTOjh6BeuPOH6m4KeBSDUGhUhEkr9fmYlzPkHiHrDEtG+tNR7himWlngoqXwoIzvD66br85pptHE1DW3u+0fpHVJoBQolxnufG4pBAiT0cf4S2eTbEsexqZxzj0baDuaYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by DU0PR04MB9441.eurprd04.prod.outlook.com (2603:10a6:10:359::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Mon, 28 Oct
 2024 19:06:50 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%4]) with mapi id 15.20.8093.018; Mon, 28 Oct 2024
 19:06:49 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	laurentiu.palcu@nxp.com,
	robert.chiras@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	kieran.bingham@ideasonboard.com,
	hdegoede@redhat.com,
	dave.stevenson@raspberrypi.com,
	mike.rudenko@gmail.com,
	alain.volmat@foss.st.com,
	julien.vuillaumier@nxp.com,
	alice.yuan@nxp.com
Subject: [PATCH 4/5] dt-bindings: media: i2c: Update bindings for OX05B1S with OS08A20
Date: Mon, 28 Oct 2024 21:06:27 +0200
Message-Id: <20241028190628.257249-5-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028190628.257249-1-mirela.rabulea@nxp.com>
References: <20241028190628.257249-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0289.eurprd07.prod.outlook.com
 (2603:10a6:800:130::17) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|DU0PR04MB9441:EE_
X-MS-Office365-Filtering-Correlation-Id: 26e8a96f-6892-4d5e-8db7-08dcf783ad10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lewOcMwiTSVzbfXUCjFnudrGE7bmxADwKqb0qIQD08T87qvuy4mfLkSKc1Jc?=
 =?us-ascii?Q?Sronj3NHm91Qg9Qraw80nVYTxyKuAeF/NXNAmAWdt7Fl4AKsHE0U+oQOwSMt?=
 =?us-ascii?Q?ObLccO0YCkR3vmZ8KD3Wh1weDrJuvK5wvQnNp2tqBhOwdZESVY9GjeWnT+G5?=
 =?us-ascii?Q?yHCA0l0rTV2sqY44ZK6yc+LeNivgq25kAhBXLZo1aMSQ4ywot7onUueCWWR7?=
 =?us-ascii?Q?w3aNIQ5ryBwd+WTp83mLUCDAuzQakSA3zlKp+54BV0mQdyM1W1WH8f3kdVhy?=
 =?us-ascii?Q?515XgvJ4bghcoV64+s9uwjzDaZGbeIjA2za1xYeELxTYH0bJSMbk0pvQ+dSS?=
 =?us-ascii?Q?KJqjUG9r1nsz9+LXjWn6iMQZf+epCfi9mf4BA2Sh1sGzocjuTfnHLK8AJaGc?=
 =?us-ascii?Q?cv/X7wgxAjxhTAMGsjj0u5Vywk12Xverlhks/1ag9k1ARX8iJC1FJDEHIcbi?=
 =?us-ascii?Q?U9f8HR4olMD+WgMteSlpioRPPNYMb8ELIPi+3as6g+X4hHSjRGgPFEMtmTVV?=
 =?us-ascii?Q?IBMXYlK/8AjXxC9xy7bn/Uad3zG7xihyCudzAexWQ6hqwi55J2snfECxdBGe?=
 =?us-ascii?Q?k/R8Ih9vf05GkhnMpO3UFQcBLdkVNj26Y9I5/G2ap1iXBgsOSaJ9Vu0fv5vf?=
 =?us-ascii?Q?CaGgCaHVWIiUpqTaBkH+U1ohwPELQwBh9mHsNB4k84+Ek73nC7RAVllyttSU?=
 =?us-ascii?Q?zWRcxOVa455+3kJ8HWfoY5TcuJIjHyNRbvbBRYnELrKLSmURnG1c+zXY1SqG?=
 =?us-ascii?Q?bP6oj3eJ7w/Ey3AFxA1fSAsYnkZ9HvqShC4vzzNsyFng7/Oa3d7Q6luBD/Br?=
 =?us-ascii?Q?ogBwtB9BVLaXpZnwYWPn7D6xSkSvCLa4fzM7B8PHkidSsBcDJfiXnWpP+d4V?=
 =?us-ascii?Q?DOmDttxo14iIO286ZuPYTTSI2qdrHYlaVnRMFA3CdynzIyqjHjguuhfB1JeJ?=
 =?us-ascii?Q?2Gwjis6G7d4BbXyexX4OpJZNAq2oUf/97hIZGu4LCgwPW9BizrdS+AczaZ4N?=
 =?us-ascii?Q?PRJTsfbt6cweA2tPZv1TMr5vXBTH8THmJWyPf3jR3F2Hld60z/rOLBHQE7Ph?=
 =?us-ascii?Q?3sOw4zeOMdXe73wLotvX6BFlOMTqqjdiuTc/eFHMl9OkGnmEGYhXAY7HHnPI?=
 =?us-ascii?Q?QiUOzDVxvTLQxnbwy5LRhiyDwNtMNMHWclRyZPAnPIdb+LngqO2VJYAUIFu0?=
 =?us-ascii?Q?HeC3vmUP8ahacuTVQjKyZ4pbM1V0dhPLK1ExBDAHi+yAB6yYM/UK//RxDaTr?=
 =?us-ascii?Q?bvP2CeKr1gFAY+mimsWfvDKDH4MgoiJhsYSd/XFN1nhtawHnjeOwqCLYLPo+?=
 =?us-ascii?Q?eNZs6nu0sO/mQLhPqUZOr+ivY0qJIiBi7vfDjs9RLCRKwAoywp05d9avECzw?=
 =?us-ascii?Q?vBAfUiE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tebf/geryo3rPvBNrQFtSW3c+i81brydjBQUTlhnvhH6ZIrN1TuQWizaUmcd?=
 =?us-ascii?Q?Mix8t4YO6o1HbXJqa5d4N+JMK04RwB/cEpJe2YQAjTaaTYMJr8qqrLWd3yYR?=
 =?us-ascii?Q?aXC56UZXZqAjl8R20dUor7GGcbEeKsgYT8Oz4PjF83rqhrEY6Jcsd61jh4dP?=
 =?us-ascii?Q?D32NN1lEI+5M1/ThYSVl765yji0oR9j+icw+lo57x+m6v/Pf6OjtbCALOVH8?=
 =?us-ascii?Q?nPj20AEU7a5M1CNaGOTg9uJ0sr8nlFz1Hk4RGo/eucThU3WjhaKSQXG1g3Gn?=
 =?us-ascii?Q?hqXOMMRQm0nZVg5JH/tGBnRC05eDWU2e45LcqPdwC7637eMKYDqw0Wmgp08i?=
 =?us-ascii?Q?BF8jcyju3hsYTRgb9OpCUTnDgl53HyR2pslrBhVhuZE6Pfi1OWQYa1NDz+Ba?=
 =?us-ascii?Q?Y1AnfZwA+K/yg4lbdyonmPvbSm2vYt2QqmMQP0ziyW8nnztHgsuhYuStNSYF?=
 =?us-ascii?Q?al4YwBq9z3T+wt+cFW1iTqtOl+KocupKv2pSZ4nuOHRA6x252TUHcOw3o5U8?=
 =?us-ascii?Q?GUTyJ9wjcIz6t4+G3euZy/t78qVAQesREJjDTXslp06hzLEceMmQ8X8ZLIrW?=
 =?us-ascii?Q?55+dLGy95bOE/v+Ty1+x54Z1cSVDhHNfSlzoZjHwoqB85vmC0McOWSnhUVjB?=
 =?us-ascii?Q?bG/JpX6ASh5Xo4IIguW+ijYriCySypMjeRlyyEpODqfKjzzrmhmRSHJdZVmb?=
 =?us-ascii?Q?2unWmDYZfh5mYKak5WQHm0ndMEOVSkef2FzPDEjbN+flEPrZzFXRwCeov/dN?=
 =?us-ascii?Q?TuTkFSg4oNXU4TRU3qcZGVSYq3CNCec7ygWSfBRoXkDqW+ZAKlNYB8LbNVjT?=
 =?us-ascii?Q?zgL+uhHldZOFFtNWE8OlpYcTVfNz2+2eYtHzWoOCrUPQVRZrKK8YurPnOSAM?=
 =?us-ascii?Q?0n5FZyjOpnIfAeULgF6KrMMBFgntf3bySIyukcpBnD1Pl721zdK8rNpTAdLx?=
 =?us-ascii?Q?Uiu1Y0Hm0XgOQSeamN+rXHMzjz3znVz5VYa2GZVzxAXFQ7ELCpvjaFaIEshN?=
 =?us-ascii?Q?3dUwxTr0u/rXS49S0hEuoihAK0FGC9z2BX7bN7EnbzBs+A7bwJw//3osWKOG?=
 =?us-ascii?Q?gE7N1tz+9IhtkYOJG0/ntkSr3BlDmuEws7zIWHSjzIKjQsNQ6G+Vn+46+bkR?=
 =?us-ascii?Q?8GE/jkONM24Lgfd1SNNK2jhw5HfFkdlV636stevFBC+5nX47X7kbZsBsKMGd?=
 =?us-ascii?Q?j2y6FsxNR4GJQ7ryBtiMVXF0cEw+R9Oq+cAdt/8UbT/WPvEVDKgD+PAJ64cc?=
 =?us-ascii?Q?d893w96dXJcf3TckNksS/XsY+mZP0n+/AIsE1UdU8AHEod4XRG6riG1ejyeM?=
 =?us-ascii?Q?GaO/XDZ45e53lfI34/ChyltSKPo598luxfxVCH9bEg1JWkTG2XZUu4vuO4qT?=
 =?us-ascii?Q?PK1y8hPyTQmqqb2Hm0FkaEimVfnZ390pc1TTsA21gTQywZwtxWARMiLGroyN?=
 =?us-ascii?Q?TP4q+6j6q+rlhS0DaXjqjtiSdS1zwSoFLfVsoOhOMWpY/ruUR5gDfuzkC9dB?=
 =?us-ascii?Q?ybWOZMR1lok4ofJYAkXIDdIPE+SuRc+IB5I9CnIDlcmOVVQysz6QR/JnLtKg?=
 =?us-ascii?Q?i5fy2DJ5ev6hlvSYIrCQWhz9Iev10tNsly0OAKNJbDnXmb+n8JRFXOHkdiAs?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26e8a96f-6892-4d5e-8db7-08dcf783ad10
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 19:06:49.8255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mh5NIpYO96LdTJXZLJmmN0LG2+N3MLWOlFKZq7K/aG+O5AZPnEUGi8LYUvN0wVYTN0L07yXCppcyCNJRWmKK1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9441

Add another compatible for OS08A20 sensor.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
index d47e1950f24d..a645c34dcc22 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ox05b1s.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - ovti,ox05b1s
+          - ovti,os08a20
 
   reg:
     maxItems: 1
-- 
2.25.1


