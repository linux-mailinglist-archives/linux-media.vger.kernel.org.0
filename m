Return-Path: <linux-media+bounces-27542-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B4A4F6EB
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8E45D1885B77
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9CB1D8E01;
	Wed,  5 Mar 2025 06:14:08 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020075.outbound.protection.outlook.com [52.101.227.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA94843AB7;
	Wed,  5 Mar 2025 06:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741155248; cv=fail; b=NqbMD6Gn+ck3HyBVlt6Prc49wcxqR6cg3zDzx6xjN0rJMA13P0Pb578NaHQVW+AjzXxnOFUMKoZVHPSVAynb8HKr6fvKcvAepzejpWOYNcIgaTVoLHC6FWeUbhsZk2BsAv3MyZ744C1GhYk8nhUrWTGFbga0y/7ShQMA23+129o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741155248; c=relaxed/simple;
	bh=iTCUcRAx0BWPY5Bpl4/08skvPU2JEak1hEUmBrdgoZU=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=NNJ/PTBrjlwkj2vIIg47DkuKBNi0fm1lPL0nfhboXXIRHmP/O2Pat0zEqxZtv8xuU7G0UCWNAdfK+8m7d0hRj95SPr6lPg44OATypmO637GehXs4YutR8JPx0xReYjXm1+CxaGipXPiP5xcPwnfJwnth0RrAOzquFSwJYwCoY+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eue/CTCpcDRY4qo2VCM0qpBJszIiKwx7dTPg6k4nbyK431RptN+6h7Cgtqfj7ddUvqp0LBUyE0wJDBp99uny0NZdg4SpwO9dF1P8XfuotAmBo1nDcTiGT7WU1aIe4yyMy9qQfGfR4/yW314cdq+cOkjvEcVOQeQSyGDCf2xHLTrrDLlOZu3G2KAhMbiuPh70jeVZ3h44UO8P/jYVsg0KsqizMJlBM2t9rjDyGmi6vVXUNETUZsI5MfFggBn0BT8XzhoosszXdDc8OUJBwFuqWmahIGf1gkBV6OJe7s6vWBxxhkNhVDeB4cViruyM+I1NWDKg+El8BpHhB684oUyPdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Za+R4ZNw9vKHbkDPbj+xFDlnMZ2jWKusfq7tOz2ykk=;
 b=SjJhsFCRuGtrqdbrY/o9XGR800dR3EJ6AqTcsNGM8QTJENnv9a/LHB1MTJ/hb03mC6JuC4sPdVaOcT/OU1QAn9s7yqM+SCL+b/RjeZoS6bXHLqcQ7G9mOkNs1UDnr6lf1O7M7e3tpMU1mf/ysXwiCpJtBt53OABHcfcKhwa7bewPJFa/qE3WhkSR2u8qAIDMGXwx1Rhafhh7sMPIzs83eZKxaZRkpDBtX0jMod9mFH6K5uVGZXNrT95Sn3t/tk6mDpuhEWOItiBJyAGzMG6YZk/ElkJmNBriOlXwNC+GwXXvdMLyKZb79Tsi2bfXERPlpGAfLyT9n/Ia7NjOpBpv1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1027.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 06:14:02 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 06:14:02 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] media: i2c: imx219: Minor improvements for runtime PM and stream handling 
Date: Wed,  5 Mar 2025 11:43:07 +0530
Message-Id: <20250305061309.17911-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PEPF00000189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::54) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1027:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e32544-4711-429e-0413-08dd5bacecad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?k8MlMtVvUxCpoTatLY3+NfLOgdZFKXdSIsLAn4whi+oliYL/d8v1hHewPtyO?=
 =?us-ascii?Q?wK/pbjnYY2QaoUF/dm0HF9I6X3ukbUXX5d33vHZ6v+dSz+hPWHYulsoMF0e8?=
 =?us-ascii?Q?BtkiLg05oXf1e7HPPnrHRNbN1Rxqz9t71Rcoexrnmgesp3dKSxUUIbVFcq73?=
 =?us-ascii?Q?z+rdGqIu0Gxv/HJAoffIIsW33nhqxYq6jUlKrM4+8CJregkfyFR6DshRbtXG?=
 =?us-ascii?Q?YqGMpl2pNHyDheZd5RNX9D/Ho3bjwF834oLUS0A34pYnKWnViAZvCkLGLQqW?=
 =?us-ascii?Q?7x7VrhoKylyFF9MOs7jQa1z4ZMzpEbOzDnUwkK1kEC9kQIcVIcKq3suH1jyO?=
 =?us-ascii?Q?3aaBhKmbjZNiV4boprwr89mjskV6dnTpzcrmgFeRtvoZ1QfMGgUPoiGRLf0M?=
 =?us-ascii?Q?j1D9eRlXVr3JO9TR0pmBsqxxTQ8VDRXDEbzaiqdDhGNrQrbCGlNWfRddUptJ?=
 =?us-ascii?Q?4TwC2TQQDt2ZUSdBUtkoYE4HvlUtFW7xSLzvQTruwplZbBUAoGi+iLng2EW8?=
 =?us-ascii?Q?JtT55uazEt5J9YTkkt84tzTHdye0rmwsnQjDunEd/FHg1yMsP1BIK4L0Crme?=
 =?us-ascii?Q?tAs7/Ctl+uiAbfLGlO62Cb604ODKC//9Mx4rwQU+JpkpafTnlJMwtyKshjIB?=
 =?us-ascii?Q?WdOaHKxNXj3yUZc7wwChKirFhUC7a4jnbcTDj0qPBilQ4HHxV1limy/WxUXr?=
 =?us-ascii?Q?3xys9giUB0UtpFzkwFs4JBOQOlqN/jjduIbsF5QmTMohlqg5ERJvXs7zB3OB?=
 =?us-ascii?Q?CX6py49sDJ3URsXQDKTd/JQYskRC6az94kYbvyIqK0uPMZjfiRiSxVWq85wr?=
 =?us-ascii?Q?oK7xQr9JQ91qPkQIXZnLK9g+xlRcu84z7zixP7G3kqgUYECuATwku93Ugokz?=
 =?us-ascii?Q?oImXR+aUa+XlV6RVFkT8xWsI8uX7bOWgy3G8CIYtQw6MPpWtllYGFC6wcbiR?=
 =?us-ascii?Q?RBGNfiJsDZt+Tm2lGRrhRy454/pZKFrPKiSjCvyRbjV1SjZaw39xE+v2Ubzr?=
 =?us-ascii?Q?gtYtEPD9TbL7wPEd1bI0HOYCyTa4oEFraPEq1P00rLdi+DFXryJV5wJKfwtj?=
 =?us-ascii?Q?HGStIp67F5po7Sgan7FbvHED3kcTlZvpiQspbjwMQcSA9UpH3iYvjLz281cO?=
 =?us-ascii?Q?P+1QLTckyWTHKf8WW1MWxSSTLV4/fJygjBm1kDsgbqMIzPJKB3jE977k7BKd?=
 =?us-ascii?Q?ArVHeuXk8KN20OCMcVIi+5vy728ymeTberKmo1bNyv5aq5y6N9wYGQFIZqMC?=
 =?us-ascii?Q?uE6e+m4o5znatGtPK3mnCjZQM6ClXVzOIhpkd8Yklf+PKvRqaNcEaz6FfarS?=
 =?us-ascii?Q?zZE2moM02ogc20zf0ERCUE96wsQYevlm+pdu6Wf2ZAh1D298HOwbT72AU0bo?=
 =?us-ascii?Q?lOxjr1WUJvdYRYMsOOwTrMjT8IU/xdWngQKCM+rg/iNTU0sLeDLR4jA46R3j?=
 =?us-ascii?Q?NLDPBv0hFd8NvF0YCpw5zUwajtWNDD7x?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xSOTU07llF2MOyaWR/LQDqKAhsUJ8qmN1ISBR3sSWrtcx3KpndbXBl/3/Ivm?=
 =?us-ascii?Q?Z/Y7cVbQZvu+k4Az/Dy6KFF/GSdR9D4M7IA2oL84RMMTmVQma0gdJ3mYLyrN?=
 =?us-ascii?Q?kZj2kF8/i4/+TzdBf+O/rMOv9qY/cIePNM88L1wDLy9kDaNHEAmPk8s1e65M?=
 =?us-ascii?Q?WMm436+OgfsrbmpT1UG073gcdMWvqfR/tjbdJFuqxy/32GGSBwcr8lQn9W86?=
 =?us-ascii?Q?Gl8Hra55/aYO3Y/cirEAE4fuX7eGxOo9HYJeTm496jxHDUmx0OXtuJYj3AiL?=
 =?us-ascii?Q?FUGKZK2tS/ehLPYlLn4kLOj0SLWC0Vaoi6MYDGSQUc/N/o+7vWiVQXDfluiV?=
 =?us-ascii?Q?qjhMdhhlrfVFkU8r7cxmn4umRFB3RTurEcciQw7lbYzbmpPNk7FR+geezviQ?=
 =?us-ascii?Q?Sv1sX69WvhuujFai+584j21w0/yDJCDgZEq3c5MPEAURDG4vfffj/lCAARoY?=
 =?us-ascii?Q?EJ5C/QcYM5d95L5jfU8tjumUZdt3c+x+FNitLU/57Py0oNk0LDBubgHaodjz?=
 =?us-ascii?Q?qIjcSkvzt79Gz+eLyT2YKkDjSVpGrD29Aa43LP5hXdRzWZp5P0j+pzQq+DMe?=
 =?us-ascii?Q?s9DHmtRZYR0P7Kcm6V2dhcjF+3L3tbqfY8Fy5CjYpyTHalP+ZeqVl7B8kmuZ?=
 =?us-ascii?Q?MR13GTUSaXtAWW+k8tayKKhKTVaKiDiO3vior0+z/wAjYDYtquKjg2sn2QoM?=
 =?us-ascii?Q?WdtUiqX9L/1eqWOCyf1+Ho4Gg9xqSOac8B06CtFBYJQusqi0GCadw0q3OqFy?=
 =?us-ascii?Q?V5vujxjkNFz7qSjnYyC0Oy1oqV2N8oIiIkHLsMpToLzboc+C9MfMiYwRbxiD?=
 =?us-ascii?Q?oJBpfhK9DiSoAeqbRDuWDdCK9nIbHcVzYJOlXfGWrwW+rhyZ77fEt0apc6Lm?=
 =?us-ascii?Q?Yi+1v66T0Brl2fLOZyp8GDKlx/ze1UONc0r6eBbhbHO+kptPJyOzlE4OT8g0?=
 =?us-ascii?Q?Mk1oBKctGbnew7e3jcXhZXHaqFGGb6Z2r2x0C3a9iROOELXwPMEiwosbiV3P?=
 =?us-ascii?Q?aVJE0DVkaJQRNDWpU0AVjq7MSxkL07GbIasgGi+SdreyuKF1J0btl/phyAg7?=
 =?us-ascii?Q?jvLhxv6yRJQflDDMcZtfH4TvZq9Evaas2bpjkcNS/FW35h138mDxxURHYaLJ?=
 =?us-ascii?Q?k3zTFP/QcMl+NuzOWpfBxgo9t37VdBNgnQXxwChcwRDR8267PIlAjlEwL1RY?=
 =?us-ascii?Q?dOV/UMt6SduBYUAVB5WUSpPW08+JNrVpDrFya6MgX8XvVrXDYq2VCpNxGXLa?=
 =?us-ascii?Q?NzZxAfxNly04hD/kza477X0AOH6eSdK1giQGjsox+MDb10WghlpLqz4fg8P1?=
 =?us-ascii?Q?A3QdkpWCu2VdOltdVyfYnlWP24hqZOfLUCFNtDXbf4Dilen3AWksFfNMYWz5?=
 =?us-ascii?Q?B+uJ5zhv3briToEQ/L+yBktM3zUyLDK1qUl7+iXPbXYg/f6lHG6udCToG5xA?=
 =?us-ascii?Q?2E8jfcyh/8OrWa4mCNR59LAXTE5V8v68wqASKLBLcluFH/kTH5KrGMD6UHkG?=
 =?us-ascii?Q?hRvI9qKq5+s1c3UeYCnqe1xZrlZ3Quu6nrdkxDOpWyjM6gdUiIZK/lwBOpDe?=
 =?us-ascii?Q?m7SLsjOzxtvGXWZoPwIk0Mafib7sx27SR42aBMYcCheLhdyLKGPa/gWUNxAS?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e32544-4711-429e-0413-08dd5bacecad
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 06:14:02.1358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LRwxEPPL+yJcLTlWpe8Ue+0sP8qK29M7wScN0+s1GTVuV2esA6UEw++rP4uz1coUIU1GxFsLLtT/T/VJNnyt7Y904lDKvmAwWjjBKYHU/wI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1027

v2 -> v1

- Dropped "Enable runtime PM before sub-device registration" patch, 
  as it has already been applied.

Tarang Raval (2):
  media: i2c: imx219: switch to {enable,disable}_streams
  media: i2c: imx219: Enable runtime PM autosuspend

 drivers/media/i2c/imx219.c | 51 +++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 28 deletions(-)

-- 
2.34.1


