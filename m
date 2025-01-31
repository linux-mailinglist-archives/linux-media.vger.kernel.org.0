Return-Path: <linux-media+bounces-25481-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D83CDA240BA
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:38:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A652E16A64D
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990361F3FE2;
	Fri, 31 Jan 2025 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bQnywLlY"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9F571F3D5D;
	Fri, 31 Jan 2025 16:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341281; cv=fail; b=M9s0YEp0SzTpDvW9WsDBiCthi+mb100+xtrS/+v6rDpNGa0fLTF5vj2z6pc7mDYsf61J1hBHrWi+BmUrxkD9cwaQeSiQGE/fQTTsWNUn5ug6hVSO1u+dWGe9+PCZhAUtLso3Gio7hWK0nEzeFjur1xSeYFgzSLVEXQeL3zm6HEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341281; c=relaxed/simple;
	bh=6+goBM3cDCo+o0NR9c6uGzcCul677phDo9F7ZrxX9R4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kix8w+GbhXrOKHVLMyWLrtx+Ms3s+8vYR/GpETyAy0jBkdIDkbqmsMKEGPehnFHemrEi67o9iPXCRFzGiP2p/8zAfqoY+M27/Jr165JWGCjntPYuuvTKhQDHDdp0QEbrzuqca04XNT/RVYVxoZTd3uyfkVbKAH1V/KqhdrnEdZE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bQnywLlY; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FkaX0FbXOo3s5Ktnzs0S7+s/DEvMYSy5hOS0uee5kl+DT68Tz6BRptw+hjlAaHHrLFTBRIhrs61AQWqutiOtG6v8IZ0jEeYNxEw6KDuvjVANYlKeFqgnw7ZV/AtElYQKd/Y/zXDq88AhBB+l9kx9gOlR2hu+5GReNpmVE72c/BwBjLBQ+4kaaI3cthwzyzSOwkq2n0szXGsZtTPrR5GzNq/xbIWFZCjexMWPIPBDZ8thsWKfsam6sm0I20oLxx3I8Nsmh1IBnA3A1+LU1cB8KmTT9r2qHRa1T1BoD4QLJIzz1exK9Ld7Dhh3XZetBfsdQ6Ug3Ep1KuiE7oyCl1RJ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=99jk/BeQH4XmYIzpWSWDLFnMvyGMdJSvwYvOWpYubF4=;
 b=jr987mAYXN7fvqAYy/z7xt4QYmv35k3VVsTUpZtnA7g3fwGUd88BnH4cXaNDxoZh1cJCJ6BsZQ4A8m1OopFmDIlzN6Ke2WtF2TjPN0EmJ8pkSpu7RQu3lLk1m5vntcjGDjutn9uIZX4B96sp70qP0R1JdGNT1L2K9XK/UmYRtDybWfFV7J4F1YQVjq0zqzWkyTpHtRW/JGlk3jZfmOweJI/Q/fvpv/jLP7OMpeJCP9HXhzZ+1pz4nCgGxV+j+skirbqByv/lcCVIqDSvnZiijZOfsa6LcYmHXiZzrKhBbwWvSOHOMo8RvO8zGIrk7Tw6XLYO3aTMeByf6KhlQy8aSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=99jk/BeQH4XmYIzpWSWDLFnMvyGMdJSvwYvOWpYubF4=;
 b=bQnywLlYfbPLlKck1VemzMRUq+k4Yq1OSHEhZKIMeswI2UP+hMw0nEJsNlwt/dd6zeCRmZ8qF8AgcgAJtULVfqBfs6AJlm/+RRm2kcT7VqsTgVCd1/jY9Jb5amZTZ1akwzJnGRdElmtBszYepEdbfB+cr+Yy5j03H5c6OohP01SmL6jyRhEa/tzuMs6fEgApjrDs+jlhp/jlFeu7AtIbeJx54eaU+650xsvXHgFSjbnZdyjWuKv1thHQp4MPUgbnLGd9ja/39tPgczz5Rb8UPakMRap5OHciGWUS7tC4xWRHThoShXXJ0uNvuDWu2HynjMZufSJFvWcWQOOWTzgftw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:35 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:35 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 04/12] staging: media: max96712: change DT parsing routine
Date: Fri, 31 Jan 2025 18:33:58 +0200
Message-Id: <20250131163408.2019144-5-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0008.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:17c::18) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac01bbc-be04-4e8b-c134-08dd421525dc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CncF1e/e+RE/nnEoosb22/m+TXi2Iok+XvSn4nKzzzgO3F65juJ6hxceIY7c?=
 =?us-ascii?Q?e/JrGg3egzaTy1ydrc58PdhWf39RBosf8/eBMs6sPsMmLr2tWHGbmIqFE2RS?=
 =?us-ascii?Q?4/fRXjvbqFNNFGxor12ASl4WtHHf6uj5sK5GnvReYXIkQ6AA1ciMycuYRNvW?=
 =?us-ascii?Q?27RZawyqsX/yQ655SnGslIjRWpJObWQuSZtJNR4OYim6TCLKEw4cGGLX1OFR?=
 =?us-ascii?Q?9cDPCzyXowTfmpXnx13wZgiKZwTQFWkTEvupN7551WLPifBdCYfgAVTFMO3O?=
 =?us-ascii?Q?Aexcexds5LBEBd/GHo57iAcbJQdqVPHTt9UbB6Ui8LQBKiV53VicSqM4kQxF?=
 =?us-ascii?Q?CfWWAEmbJ+UrGORXFjm3jCcwrSVKf5Zeo1Yaz9zqbJ3j8ftYsuDzWMPJtAEk?=
 =?us-ascii?Q?yrvdpZgrJUgiyvUa3R4ePo40oWLDX+0dyHd7HWZLL+nqSnqsPJuNZI8LYKft?=
 =?us-ascii?Q?1y0e3WUbyy9S/waBulNbCMrXuhBQ9mHbUsI4oFen+BKIIGkibqG3c03iJx7S?=
 =?us-ascii?Q?mt+uU8isOkLxDjClWbK/h2QkoaKtUSIEU9+lb0mPl4NpOJtkwZ21hwhJ04hC?=
 =?us-ascii?Q?XaS4RZ23qR4NMq1qsfrlEr038hcAiy9YxSysgIeq/OorAYawRXhz5nA2rPct?=
 =?us-ascii?Q?yIBMO8vsCNsAECwd2Go7m7dx5h7Qcm+vo3mfvNbgxZsfImO3eZQP0alZRsqo?=
 =?us-ascii?Q?4M8iX9kP2imrCja7pTBDgyrycFsKRSencHg8x9NYYpq1fsfL9Zq5FLJxzDOu?=
 =?us-ascii?Q?cfhJK+edWWTajA0l1ikC7C8HVGPE8C9T96jWacWhoaWlsVkRvYsxQNUCiSh+?=
 =?us-ascii?Q?t5+HdwERx+8iqwxqWjq5S4xKUhqt9R8n4BSRUiW7cmX1miLBjCr0VbtMzXC2?=
 =?us-ascii?Q?V6RaxF5QNUwhGbN9jJahmJ8OxBcYp1seFKnavX1y+lHxnazvkusBTuBLi4k2?=
 =?us-ascii?Q?fWWr0X/PGRTxh/pX59GUGw57vW1j4Ao2gLjcb1JJ50zSz1mSaauPR24PglTH?=
 =?us-ascii?Q?/yaoVPTcARLVFoX+wVp0i+FFwbgkZ2ADdHlGZJN8n70lU8Ktg0yfXnstVBNm?=
 =?us-ascii?Q?uTda51rE0QsvQWThOr2MgL7qFgvdUvBUJWe6Pe1DBCbDSjVE8Qj71GWWu9b4?=
 =?us-ascii?Q?WbLtLPrYpCTRqlRYCNkAjplTPZvE4R3WKjTDcrzDzfgSSWBclsMDgLcis8b8?=
 =?us-ascii?Q?xt4Ot10xZK5u+N7HQ2J5/fjqA2mmKoQA1IO4pcC0I3ZCo9Ra027rL6aUuqYw?=
 =?us-ascii?Q?WTqCZVtzyA+OJhyVNyplv/IYb0kfuT9GjWjzllcsx0utO7ON+j3NYunUllEM?=
 =?us-ascii?Q?bWej9PSAOizP9MJ53bOjat3z02eRPn3fZqLKcO2t6lq14/rZ7PURJCnMdhYe?=
 =?us-ascii?Q?KlthDV/mBx0uo6Snx0HFhK6t8M3z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iZVFU8BpbVZRAGK7R4Vn13G0VQDORt/I67Njc/sx+azocuyfK4m+gW8pVWQV?=
 =?us-ascii?Q?mSh+fpM7SAOJyPNe3Jm/ci8g/rlvETbUAkHqdc5taQMH+gXoVyBbhJRqGKdz?=
 =?us-ascii?Q?BACiQmCBaZ9hAIMULjdt4eVxXMNSR76NTVs6VY/bZGecRifJlitfgg12n8yZ?=
 =?us-ascii?Q?2F23mUJoAaf/I78YsQFDe71gDvLG+AExhg9knLYdGCNns1aeXu5tL6ASb7vI?=
 =?us-ascii?Q?z1x9gtwVuHrQRbWuipmG3aNfMwHe0jNbhSe/B8FrWCPjGmDRjvu8Rim6tqQ4?=
 =?us-ascii?Q?A6fBbuim/nJc93HZqCyx3YBs5w6QKK1SAVH47x1NjdFuxc1o1Yy6jx2YK1wa?=
 =?us-ascii?Q?yKhYPrKeyTHCOvWCwf7BfroktUUtpK7pT5DmynO7Mde1h1+RKe8OyrAWKVO5?=
 =?us-ascii?Q?8KDfCpjmHJCiGyPN3gqa4ldUcjKm2RRUSts45GGIgQSZcPAq7GD3qXh5Vspi?=
 =?us-ascii?Q?B8gxHhglLtffe4s3GjY1jLcNJtTzHu6jFTQF8cNCqw3WSzRB89hJ83v7tM04?=
 =?us-ascii?Q?7GF4/g8W6zCu8EhuBv3+/CdWCOfuckwYhyIIddVwoZWA8FtRMWarHIBy7i5u?=
 =?us-ascii?Q?YXS43aGMjsNdM1Yqkw/LOk8NxMJobkflH5M8CYg5Jdx6HHKzovvd1prTFgzG?=
 =?us-ascii?Q?F4RTt+sFZK7ro0gXNDEV4qwu1qISUJM2PrpikoGiHpetQpNeOhLAblRGwR9B?=
 =?us-ascii?Q?C6V2hR7y2+tYSrMxWyLtCOqWrWgTWlYnaJLyHSTYS0em78U5DJIM48QnqQDZ?=
 =?us-ascii?Q?uquKME3znF9edTBIJRCoRIo3o9Ky2U+rX8FBP3BgE9yqb/UHIk7Zdwcvd/cG?=
 =?us-ascii?Q?RssyKpY3if46xtK762XR/fahA9DuysN2KAEVefMjLtm1Gv78x26UUskVjyRn?=
 =?us-ascii?Q?O0D1PWvj3JCtTRVNd3ixrIpeZl6M5aNexuwjcjRGVKYfB5/PEvaoqhq4rvaR?=
 =?us-ascii?Q?gFa1rSpKIDQhxmeOYj49OHhXHJ3iV2tuKqGDQD4ijPjbrHuyPWOYyq6GYOWC?=
 =?us-ascii?Q?OYY5eHEfcLhDKIYOUFxtHWtYIXwi0FZM1Q6K1rLY5gily+OdMv/VH+H16Xqf?=
 =?us-ascii?Q?bxprCMJKJ+PVJhZyY+hffb6QWnBxsyPXgSLIbH9oILehemwbS6A3/r1nTFjH?=
 =?us-ascii?Q?5TRf/KEJdAFvgqAKXY2bxsXVCcEReuqKIRcx/xLlEkvh5FI3Q+0MR+Xn+zQy?=
 =?us-ascii?Q?LE2kT2jCZgToDbEEzZp8+JlUn1samBNYLqE1kU3HpvYUE6j3u4ULcV/uyj7H?=
 =?us-ascii?Q?dyFr38xmABE3DCgJIiuOXOBm8/RzhE063yAYqOLbMFPXRUaH+8JvVqI9Gec+?=
 =?us-ascii?Q?BS94nxn1myMFxs0jtp2+068pGojFU9Ef7hZvEx56GvebRakY3PgPera8wYNy?=
 =?us-ascii?Q?TZkhZmcP3qvsvw+7X7Qd6cLOPerE4vwqCmHsC7I2CVsulvmviOzEJ+Sf2wCg?=
 =?us-ascii?Q?/pFd2kjBmzSUr15MgN/6bUUrIsOo7rjlCzlY0VVExPkj36EPEI0YD4vslhWR?=
 =?us-ascii?Q?Vv1/0FM1V9INXJCCszDXtwAwjbJsKTjAZmy9C90jq8A3t9xDlkvjfgDkG0sv?=
 =?us-ascii?Q?p+67ouTdOqIltoVGJJdtQ4Dbbk2rmdlOG5Lx5XVPIUPV3YPYY8rTnSmy/O1G?=
 =?us-ascii?Q?4g=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac01bbc-be04-4e8b-c134-08dd421525dc
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:35.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SdMSXWRj2RX70oKrqOZhBXgHdmDgTLnUw5v19cs7BK5kVfNlgXQTYv7J3QtyphvxpnQWPE7UDUjPhlTbfsGvQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

Currently, the driver supports only one source media pad. In order to be
able to use the driver with other serializers we need sink media pads as
well. This patch adds support for parsing the source endpoints and
create the corresponding sink pads associated with the endpoints in DT.

The driver functionality is not changed at this point: only sink and
source pads are created. However, since the first source pad index is 4,
the user needs to make sure to link the source pad correctly to the next
downstream node.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 122 +++++++++++++++++++---
 1 file changed, 106 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index cf39f5243cd6d..9c255979932d6 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -130,6 +130,13 @@
 #define MAX96712_VRX_PATGEN_CHKR_RPT_B			CCI_REG8(0x1075)
 #define MAX96712_VRX_PATGEN_CHKR_ALT			CCI_REG8(0x1076)
 
+#define MAX96712_MAX_RX_PORTS				4
+#define MAX96712_MAX_TX_PORTS				2
+#define MAX96712_MAX_VPG_PORTS				1
+#define MAX96712_MAX_PORTS				(MAX96712_MAX_RX_PORTS + \
+							 MAX96712_MAX_TX_PORTS + \
+							 MAX96712_MAX_VPG_PORTS)
+
 enum max96712_pattern {
 	MAX96712_PATTERN_CHECKERBOARD = 0,
 	MAX96712_PATTERN_GRADIENT,
@@ -139,6 +146,11 @@ struct max96712_info {
 	unsigned int dpllfreq;
 };
 
+struct max96712_rx_port {
+	struct v4l2_subdev *sd;
+	struct fwnode_handle *fwnode;
+};
+
 struct max96712_priv {
 	struct i2c_client *client;
 	struct regmap *regmap;
@@ -151,7 +163,11 @@ struct max96712_priv {
 
 	struct v4l2_subdev sd;
 	struct v4l2_ctrl_handler ctrl_handler;
-	struct media_pad pads[1];
+	struct media_pad pads[MAX96712_MAX_PORTS];
+
+	struct max96712_rx_port rx_ports[MAX96712_MAX_RX_PORTS];
+	unsigned int rx_port_mask;
+	unsigned int n_rx_ports;
 
 	enum max96712_pattern pattern;
 };
@@ -343,9 +359,12 @@ static int max96712_init_state(struct v4l2_subdev *sd,
 		.xfer_func      = V4L2_XFER_FUNC_DEFAULT,
 	};
 	struct v4l2_mbus_framefmt *fmt;
+	int i;
 
-	fmt = v4l2_subdev_state_get_format(state, 0);
-	*fmt = default_fmt;
+	for (i = 0; i < MAX96712_MAX_PORTS; i++) {
+		fmt = v4l2_subdev_state_get_format(state, i);
+		*fmt = default_fmt;
+	}
 
 	return 0;
 }
@@ -392,6 +411,7 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 {
 	long pixel_rate;
 	int ret;
+	int i;
 
 	priv->sd.internal_ops = &max96712_internal_ops;
 	v4l2_i2c_subdev_init(&priv->sd, priv->client, &max96712_subdev_ops);
@@ -418,8 +438,14 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	if (ret)
 		goto error;
 
-	priv->pads[0].flags = MEDIA_PAD_FL_SOURCE;
-	ret = media_entity_pads_init(&priv->sd.entity, 1, priv->pads);
+	for (i = 0; i < MAX96712_MAX_RX_PORTS + MAX96712_MAX_TX_PORTS; i++)
+		priv->pads[i].flags = i < MAX96712_MAX_RX_PORTS ?
+				      MEDIA_PAD_FL_SINK : MEDIA_PAD_FL_SOURCE;
+
+	/* The last pad is the VPG pad. */
+	priv->pads[i].flags = MEDIA_PAD_FL_SINK | MEDIA_PAD_FL_INTERNAL;
+
+	ret = media_entity_pads_init(&priv->sd.entity, MAX96712_MAX_PORTS, priv->pads);
 	if (ret)
 		goto error;
 
@@ -443,24 +469,53 @@ static int max96712_v4l2_register(struct max96712_priv *priv)
 	return ret;
 }
 
-static int max96712_parse_dt(struct max96712_priv *priv)
+static int max96712_parse_rx_ports(struct max96712_priv *priv, struct device_node *node,
+				   struct of_endpoint *ep)
+{
+	struct device *dev = &priv->client->dev;
+	struct max96712_rx_port *source;
+	struct fwnode_handle *remote_port_parent;
+
+	if (priv->rx_ports[ep->port].fwnode) {
+		dev_info(dev, "Multiple port endpoints are not supported: %d", ep->port);
+		return 0;
+	}
+
+	source = &priv->rx_ports[ep->port];
+	source->fwnode = fwnode_graph_get_remote_endpoint(of_fwnode_handle(node));
+	if (!source->fwnode) {
+		dev_info(dev, "Endpoint %pOF has no remote endpoint connection\n", ep->local_node);
+		return 0;
+	}
+
+	remote_port_parent = fwnode_graph_get_remote_port_parent(of_fwnode_handle(node));
+
+	if (!fwnode_device_is_available(remote_port_parent)) {
+		dev_dbg(dev, "Skipping port %d as remote port parent is disabled.\n",
+			ep->port);
+		source->fwnode = NULL;
+		goto fwnode_put;
+	}
+
+	priv->rx_port_mask |= BIT(ep->port);
+	priv->n_rx_ports++;
+
+fwnode_put:
+	fwnode_handle_put(remote_port_parent);
+	fwnode_handle_put(source->fwnode);
+	return 0;
+}
+
+static int max96712_parse_tx_ports(struct max96712_priv *priv, struct device_node *node,
+				   struct of_endpoint *ep)
 {
-	struct fwnode_handle *ep;
 	struct v4l2_fwnode_endpoint v4l2_ep = {
 		.bus_type = V4L2_MBUS_UNKNOWN,
 	};
 	unsigned int supported_lanes;
 	int ret;
 
-	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(&priv->client->dev), 4,
-					     0, 0);
-	if (!ep) {
-		dev_err(&priv->client->dev, "Not connected to subdevice\n");
-		return -EINVAL;
-	}
-
-	ret = v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
-	fwnode_handle_put(ep);
+	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(node), &v4l2_ep);
 	if (ret) {
 		dev_err(&priv->client->dev, "Could not parse v4l2 endpoint\n");
 		return -EINVAL;
@@ -492,6 +547,41 @@ static int max96712_parse_dt(struct max96712_priv *priv)
 	return 0;
 }
 
+static int max96712_parse_dt(struct max96712_priv *priv)
+{
+	struct device *dev = &priv->client->dev;
+	struct device_node *node = NULL;
+	int ret = 0;
+
+	for_each_endpoint_of_node(dev->of_node, node) {
+		struct of_endpoint ep;
+
+		of_graph_parse_endpoint(node, &ep);
+
+		if (ep.port >= MAX96712_MAX_PORTS) {
+			dev_err(dev, "Invalid endpoint %s on port %d",
+				of_node_full_name(ep.local_node), ep.port);
+			continue;
+		}
+
+		if (ep.port >= MAX96712_MAX_RX_PORTS) {
+			ret = max96712_parse_tx_ports(priv, node, &ep);
+			if (ret)
+				goto exit;
+
+			continue;
+		}
+
+		ret = max96712_parse_rx_ports(priv, node, &ep);
+		if (ret)
+			goto exit;
+	}
+
+exit:
+	of_node_put(node);
+	return ret;
+}
+
 static const struct regmap_config max96712_i2c_regmap = {
 	.reg_bits = 16,
 	.val_bits = 8,
-- 
2.44.1


