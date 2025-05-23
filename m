Return-Path: <linux-media+bounces-33264-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F032AC2463
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:46:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 331E04E1EFE
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 13:45:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2792C29550A;
	Fri, 23 May 2025 13:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="L6mXB9U8"
X-Original-To: linux-media@vger.kernel.org
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazon11021072.outbound.protection.outlook.com [40.107.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F97293B7C;
	Fri, 23 May 2025 13:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.160.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007792; cv=fail; b=Gr/2Pb/n8CErplaRM65Xnqd8V9KhxG2ERv0s+rkfwgHQZ0v3CAPFwcNtPykS2BFOSiYySg0SnGoB80Yk1YILaRtgbC94jADDu8yuCxnbGwx5pUku+PXOs3E/tQs56O6P0+hEmLihEsr8B1PLBMP4NhZaC2fiX/YZ3WHS5RFCXWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007792; c=relaxed/simple;
	bh=EnudffPALagR/MOOeNz4GC/eTjIMHYr6jk2/bf/Gz9Y=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MSIbyxXwjHYqjYezirmshtay7hfkpAQfoBJff3qlGuVglGhTnLJaW8iP3g+HLu0tP5fueoL0lfevAWABDdruefu3+S8Jor+SWxqlxW6uyr2Fs3PY2cARMYd1rl4+SWBhBJbJaOUJ6WRRpHy+Avf+12eQ/lbXO0P7KeT+V+efOIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=L6mXB9U8; arc=fail smtp.client-ip=40.107.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ti8xHvZnlRcVfKsxAO4z2byAwdeoLW7zQkf2lpNTB2n88hcwt94Ch8NPkW0vbAdKQ6Hbbq7kwVWTygN1wVCTiJCiG3AyoCw9le9bMxqUbLbpE75TJHOQR6meceUGQsofTSEKKP7s3aykKp/Jbc2Ijgrkya1n/5QInDauXc5cclLMNhan3FtEooMYG8uXJI/DzBMXFObu6yOFckZs2NaYLV/ZfU/jH2tzuglWe/5DCNWNfnl/q5sGMLEMdHg/TtimRU6As4lBUCrdcUQZ1Z6tu9x65iNsjW8cJT6bQ+AkhYfT4K2zZoPDtzAjH1FmgDDidlikfHei5O09BsilWcCl5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StAOPmEuwx31Gv/QcciJ0JcKEYHZGf5nk+Ep1DjQS+k=;
 b=r70kkoSzc4CUaK1/YZq/BwXV7GGx0nAdgawDyCjgA//WWxuLuAA4ZtSHGzDsS+Jbr987y/1XcDdM3lvvqa+z5BMDHAiJan00fkrWgVh4+7YaPy+F62MxyH4jOjXFrnBYLbx7/VsKU7MOJ5ujwSgVNpSrC9ZjJCVaNNAeXMytYLMXi734fO9na4ncgrfoWWPAs5F3dBrBPduJcFtAEOsCgICIaAV1vGOj+bMpSmlzhIyeVttGTQuJ0Yi4dSekZsBSaDVNaUsWwdpME9dbWo9ULGprpUA5iqZEmMiRjhCEKxfMxlzpZxHvN0Hm8KP4bwvFE4UN/FdLOYRn0Xzdl9dgwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StAOPmEuwx31Gv/QcciJ0JcKEYHZGf5nk+Ep1DjQS+k=;
 b=L6mXB9U8HeSgDVEXb+FuATIScEF203dQnLJr2w//pzlo06H20m6ClFCkoFEPQdQzjSctBvh9Fp4zins/725h2xDqPNGXGuCHXS8AH6FlsZowyK4VnyIVvhWtmipyiU01KOzf5/BRhcYyzylZmbkda934EqB2gW8d3lUGbVJNegC/RzG7xahw1xbk47Nn7Rf3IA3y6VhAHSM7KGCpRuapPtn/KgCEwk/vRGtNEbhtXtfI79KUtg+ZH0m1azp22XjgFXFcEAS0j1voxZK8lNnPnAsCi5rm15yREIvUJFbxZuTlCmuOG5Eh/M04CPWvQGpUMpbwxj/fqzdt72Y1JMI4ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PATP264MB4619.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:428::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Fri, 23 May
 2025 13:43:07 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 13:43:07 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Kever Yang <kever.yang@rock-chips.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/5] dt-bindings: media: allegro-dvt: add decoder dt-bindings for Gen3 IP
Date: Fri, 23 May 2025 15:41:47 +0200
Message-Id: <20250523134207.68481-3-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0431.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:37d::18) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PATP264MB4619:EE_
X-MS-Office365-Filtering-Correlation-Id: b334a59e-0235-48b7-ade0-08dd99ffbfa5
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?LUnkQBCUCMdP7T9nlCKjgm2DhkeLxEbuDxCYoWZISzc/afZQ3gffOR7iW1un?=
 =?us-ascii?Q?Y4kb/L1XYMspAa8rFvwKjSMpZZCU5jJ5l2QTReyDrA/hnQYyYsjFcb6ovKNc?=
 =?us-ascii?Q?dpptQM7I7ZThcdzeJHNjQxOJ+txDUdfMBschCg/SCtFZL2ih6leW+ttMQCFP?=
 =?us-ascii?Q?W1EoPQLHPCuDkTZOZdSA9JKYOn9hCCQrTyMi6ePcfGgtcW1gd5tH8T0VD9Or?=
 =?us-ascii?Q?T4K6bmDx+qc6dFFjDyU+WNr2opKlLaG7Tk69UZPLjyBm9dcKYP4KojxMDWdu?=
 =?us-ascii?Q?XvsDtbWnc9x6c/vfZpkZARNg2YB9cVTdb7kY7Wshb6IicQQHhVEmbqMgi0D3?=
 =?us-ascii?Q?3H6JjpnL4agAekDn3D3kz1dl4MA/a88oXjFeXYKLpEHrhegA50CMUFZF99Z6?=
 =?us-ascii?Q?Y7lqlTcaTvm+1UBEzLJV2pu7aqWXaHWfIzU3luD5oBbb8V3sjTjTpSIzRiBH?=
 =?us-ascii?Q?C6fvRl8PPO39FTCVUomUkYDxhA17RHcEANk0ZucF9yale5JYaABmSwEtcu/Q?=
 =?us-ascii?Q?Z1Vt+5MxCWexQRK06qvdW61sJuJf5W2wXuWsiDhDOYZofMUjsXf18FyOlqiB?=
 =?us-ascii?Q?fgiCMXcicq+Y6qkCnyi4ztEBFQoBAjbY11orTcXh5FQID9N290xbY4QO4R7X?=
 =?us-ascii?Q?Dw9HAuzBz/fi8XDah02Mfg56yjRrWvjuhFhKqT+pOoi9p8WmJNQ9mqb9X/Oj?=
 =?us-ascii?Q?SQ/0YHY4yFiMyAtVRavq84bpY6IqMbmBU7KG6xEpeaB2qC716fL62uVppKsy?=
 =?us-ascii?Q?d3DxJOmzpbS1TCBOJyJ7Idlqm1wftuZZdkPJixNf7F5GZUwkh94dWTT90lX1?=
 =?us-ascii?Q?SMFVw3ziBziOScghBQ1laAQ02yEJHgdu58Cjf22T59HMhRExIQRO04cmKAzz?=
 =?us-ascii?Q?8NJyML2Zs/wdyhat+o3aCqD3zoT/1A2pGtrC3mY9wZUgkH1VY2Fy7oCYv6D3?=
 =?us-ascii?Q?9vIzRek9FrUzWxxDsTlawS5l/IpSGEL+KxeDFbzZrXa2yvtf6Y37jsQfnIjT?=
 =?us-ascii?Q?psJ+DbaOJd1EqavkGWF9lMfyqU5N4qZ38UokW2iCaBSJkfSZm1SgZcRE2WhG?=
 =?us-ascii?Q?KyYUHZCE+0jYdN8n4CIZiunciYtD9LnGHYWYP6Ii+k0frBQtZiLwA7ZUGzNZ?=
 =?us-ascii?Q?W23c56lGK9Wv2SevXaUvDAJqyKmkKR2qG+llIonHrd0HvrkExE2K7laccz1u?=
 =?us-ascii?Q?155iPWdoNd+f9LWNb/eFL1Q6aa16N0bPgEySiYe59kkCjO58qbhhQZoJIog6?=
 =?us-ascii?Q?/6wX0ThsB6J1l5p3EWbCGwC0FyGQeYveFr3PsUr6X/aDbND2HCc9Nx02k4f2?=
 =?us-ascii?Q?pOVxG9JXHweLTje8dVNE2kAxz1ODN2vdj5gAiDbs79xLcfdEmRwhgHFb40Gr?=
 =?us-ascii?Q?5iKn3hfhaCPbTNLISqbhM9PhAXbhKy1nbG/UAAsh2WYC2HCLEg=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?gSdS5JAk2qwxkMGGPijT9fVw/YAE0IR6Uf38lTI5TnWWggg6IGH5r+RXbWuW?=
 =?us-ascii?Q?Nssvq0T4N+/OHIDy13LS1t22Iq+EeX/vkI7VuZH/Xr0hd/KwxaZSyJMTwt5m?=
 =?us-ascii?Q?Vnnvfkq659zSkNW49ehW84w/GjwKe9m6jsYiiypfES6PF1MI0F2eK8pFN7N1?=
 =?us-ascii?Q?iSJ7Ke50wpeDh2E88yhYCIz5FgqkzPKQhFVgM+HhBjm3RjLHk5+tI7pIgaum?=
 =?us-ascii?Q?Ia3sOV+mSsVWKYXKg4nyWGWZaQvQJ3U6zsl7U7JjVz6uKtmnZz6nFS0lvif4?=
 =?us-ascii?Q?O69m/ZqCd3oz0k3LzXcgzoZympLG3wxIE2/wbH11CZ34bHiS5XHqdVM7SBe5?=
 =?us-ascii?Q?7cahEfc+T1RT9Iluota54dq25sw8hfVn28N+K92RgA7Cg/S2hJfIf3maN1ic?=
 =?us-ascii?Q?ZD+EerInzgC/GsqvbtE9u8ktXtD79f/FGeWi6nxFe7ollCCtrJttb6Ug21lx?=
 =?us-ascii?Q?V+CYfrIaQaYMLtW4ebRPvLLmxgwdCJfJBkiOT+8ZhkY0Yvzz76wQC1VhuseL?=
 =?us-ascii?Q?JwbAOI+oBZ+LfnwyfVmujOFX3tQcraBFesJ7qtrOPUpqF9qYZ7lL1XJatyAo?=
 =?us-ascii?Q?BGfHOZ65CsManZJ4sLHiUIxVbA7qAgGH2Gjs+9LaH3REbUyAuUNIdatyLzEt?=
 =?us-ascii?Q?JXjzibK5SlAsH6bZkSjodb5ZaRC6zjkKc6c7AkCoSoeo1f7t+soIqFoDtN+9?=
 =?us-ascii?Q?/z/O7VoPb8HTDYjC9I27NPgbxs/MSEfAM+2byVbPnmQzGLvYLowSmRpPDczT?=
 =?us-ascii?Q?PqzSVbRPJr5HAescoNu21r+o4jEqslDzooW1IG/ooh7DzeW6G2cNmbYwmVTG?=
 =?us-ascii?Q?mBuIrCJZG937RypuhY8UHWMHXJQrojSy6QBInO9Sdd69aFVAU2gXu7ysE3h0?=
 =?us-ascii?Q?QZ8lKRySwVU5WRNPjrGn3YUyZE71I4u4lt51QhhwNRYsFDFo/bIyEHBVTJDk?=
 =?us-ascii?Q?A3pe0f3rdsGQW30FVR+/xiu1oQDa5wg0Ij9V+nDWFa1EhCi8OSARDOpp6up7?=
 =?us-ascii?Q?x8eHkG51IOysWkYqKfTC3OETmYgCqlvToEj/qRAuvlQJMd97jJqc+kMUDZum?=
 =?us-ascii?Q?a70ECgUdCDgjbctW/THx+mlGX6oSpm6CkA0W2VGqdkqBpkXWOvh7XGBwgfNM?=
 =?us-ascii?Q?IEHnsFROIyWQMD9se8JSQ1wLRx297Ku1LdJkuheik4mgymRloVEzgkClqgJO?=
 =?us-ascii?Q?1T/WC7vHZRwle84hqyNHTvl5Zw00yfzfdFYko0PfGnJ/2ZhcKLPAv8K3ogNs?=
 =?us-ascii?Q?I33g4CPCjoBSy0pFtjCsWSjfGzo28oFBgDZG2yMUQgFaqO9XVEBfxURbouNj?=
 =?us-ascii?Q?bkzWqeLXnK85U6lwE1wIQJkCGfDECamAGf+00h7D1/+uSfFwWgqDDVpmAO7R?=
 =?us-ascii?Q?yUIso7Vjl5LzUIhLcI6Y2olBUOf79Y0C/b1cVCcw22eARZZKq4rzpevU1Wk5?=
 =?us-ascii?Q?Flu6TMwgrKbRhgRj+1i6B0uOBLyF45pvHm5U89cQ1tBnWQCxMx59DhJ/gV2K?=
 =?us-ascii?Q?QEkhYBWQg5lOHUWMFRM4EFxX+LOF9tg3i2MqImrXpZ4EUTsGmYXiqtuQdEQ+?=
 =?us-ascii?Q?ki2D9DgWVkgj0bRpCvX2gUZYDSLuK2zB3Hrcygh9MqD4xB5kVwsLHn9WHf0W?=
 =?us-ascii?Q?TOTKiJ23idXiivD3dhe/F/C7MLHeRCMAj7hnXF+b6nPyxNPNQ8cCwITiuq0+?=
 =?us-ascii?Q?E4BIjA=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b334a59e-0235-48b7-ade0-08dd99ffbfa5
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 13:43:06.9461
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E8pjBIEXO3q7IwFP5z9Azdnv9c0EpdqOdDhaypipcFPfgY0tKTd3nMeNLC6DBIX3+N9cLuK0x8J+0Fov+LIe+6e3K2uMXS3KSqwzJ32IXAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB4619

Add compatible for video decoder on allegrodvt Gen 3 IP.

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 .../bindings/media/allegro,al300-vdec.yaml    | 75 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml

diff --git a/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
new file mode 100644
index 000000000000..e853e7634c4f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/allegro,al300-vdec.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/allegrodvt,al300-vdec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allegro DVT Video IP Decoder Gen 3
+
+maintainers:
+  - Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
+
+description:
+  The al300-vdec represents the latest generation of Allegro DVT IP decoding
+  technology, offering significant advancements over its predecessors.
+  This new decoder features enhanced processing capabilities with improved
+  throughput and reduced latency.
+
+  Communication between the host driver software and the MCU is implemented
+  through a specialized mailbox interface mechanism. This mailbox system
+  provides a structured channel for exchanging commands, parameters, and
+  status information between the host CPU and the MCU controlling the codec
+  engines.
+
+properties:
+  compatible:
+    const: allegro,al300-vdec
+
+  reg:
+    maxItems: 2
+    minItems: 2
+
+  reg-names:
+    items:
+      - const: regs
+      - const: apb
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  firmware-name:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: False
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    axi {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        video-decoder@a0120000 {
+            compatible = "allegro,al300-vdec";
+            reg = <0x00 0xa0120000 0x00 0x10000>,
+                  <0x01 0x80000000 0x00 0x8000>;
+            reg-names = "regs", "apb";
+            interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&mcu_core_clk>;
+            firmware-name = "al300_vdec.fw";
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index d81d2756cb2e..e59011a36e6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -806,6 +806,7 @@ R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
+F:	Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
 F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER
-- 
2.30.2


