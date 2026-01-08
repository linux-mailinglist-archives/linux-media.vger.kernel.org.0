Return-Path: <linux-media+bounces-50188-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D3BD0112D
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 06:25:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 639EE3065148
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 05:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9572DC344;
	Thu,  8 Jan 2026 05:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="EclZMOdm"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B239C2DAFA1;
	Thu,  8 Jan 2026 05:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.166.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849807; cv=fail; b=NqdIvzburiGjO07v+IWlVwjo5GZjYYOvn/M2x3xaacUuibtMmpQR1Q1rohGo2on5oJ2qbYHJp9h++WvoKUog9F7T8bzsZBa2aqHmcQp18RUKTQsyTjC4N8NzpFQE+qhIamZKXWIh+lCFhZ6/D/CZ9xVaD+g5IhuZIjGHWXa1YGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849807; c=relaxed/simple;
	bh=+PscFfv8kf/1NAXW5wdxdt9GuBTzXHkVjGU5/y3oXnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eoW4u/k/4AvZvhm9mFNn7RhSgJSmSIT1u8bECuQYRUqhWKN0Akp4mD41hAF7O7zVtIqHcnumMHzYnnui/FGXf0lDm83Z+km9JpKDb9uiBttU4lyZU3V1njugz0J1x30xikNKJT7HHEJ6arTYg3K7HK836Ep7hdPql+hp9D5DW8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=EclZMOdm; arc=fail smtp.client-ip=205.220.166.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6084Osl73468562;
	Wed, 7 Jan 2026 21:22:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=+2CgcnFZegxYN66uSZNUzGYl6wqyb37vdEnLXazMiKI=; b=
	EclZMOdmcdOsHDc57iSB0vQ2Oy+r6NyHYKNVrWdXh/0XQG9DZMNqSVHx03r9a0H/
	y+zIKN8Eo3CcWB0++slBjKq8XM53aNmyu4KU1768Z5NyMpWEm15UV4uIM2G7a/Pl
	yyt9O4LqHy89LV5JegtiM5lWd4+osZhe7g9PPdT8a2yjGa6WkpdW0MpC1qaNM6Ai
	d8NhPSHbYH4DXxVFqObk5Y66GMG08Iqrbyy9qXCxulzh86PEvs1l+TF6TwQCgXv5
	O2iSZgg2zmd26rmUTEZeGcweFvnOrdmys4sMpy0B+u0V9ebtbba+Vpn4cSCHNDz3
	IejFW8AilUHLpPsUJqks0g==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010046.outbound.protection.outlook.com [52.101.61.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bf3gkcqga-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 07 Jan 2026 21:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sp6X0fjIc+Ok45aRdsjrBsfOdcAEBmNK0Zuqns2vtOc7qpE8H1PfVu3SmeXLrlRFHomlYBeq8P96qrZeKwjlECz2S3cszSjgtbEDf7k+mL6R/q2B2ZJhY/0cdr9mRyaJuNPmDMFRlGD9c5gLUC6S7sSyY6Dc58TNZ3Q5h1FzI5K81YQXp8nlMHVeLAMH77TUq98fPBlLWPcIK/Vg1/tpzqlWkssSRcG2Qa3QOaQy534oA0QKWPdwLGU1hdNMnrtz0L0+mobxCKcD00+negIATyiJvsRBHRc8T4rkQ8Ja8kk9S7XhSAT4ZrllWDuQNR7wxwLz7YGGn33cC4/KhRzSzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2CgcnFZegxYN66uSZNUzGYl6wqyb37vdEnLXazMiKI=;
 b=CoBNMWPuYQGEVaJRWAT99/Rr8m+jk+ZQFP5A+R05OW1fl/RrGbDadtmzJs+fJiHJZBxJK0ioIVDDVV2H9CK31uhRisWxtkqE4IA37K+/6N4xx86tajqNLuPoCwQrtJv+3yj6Fx1V+bs9S5QNzjfIg1aI10gwXtjZ2/1lEqU/uX57DMAjXfnm5KAuH2A1MXBZFV6XCesb0GEsLsv+WuvXrxxE3q9BrJnDhYgJI7bzGZGP+wFMVxO5zKeWdoUIWddKV4HV3nVdkxjJYIAPXlqdSEQr3s7hXHpM8qQ/7t1JgjBX/rLBGYu4A1myujlvGaeclDq42P0eb63dmHDwbxVhSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by LV8PR11MB8510.namprd11.prod.outlook.com
 (2603:10b6:408:1e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:22:32 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:22:32 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/3] media: i2c: ov5647: Switch to using the sub-device state lock
Date: Thu,  8 Jan 2026 13:21:58 +0800
Message-ID: <20260108052159.3879884-3-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108052159.3879884-1-xiaolei.wang@windriver.com>
References: <20260108052159.3879884-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|LV8PR11MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: aa8885cc-16af-4284-9fbb-08de4e75ecd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UgX1vhkejTfFUkQzUKX1SwDoMv60gO9QCNfNwKE0SuH74WE5u5/pxRbdkVe0?=
 =?us-ascii?Q?UJx5HzVycXazpHQ31nUBsks7QxA/xpAHTJcExKcbVX3RCB5cADxcIK92OC4J?=
 =?us-ascii?Q?0m8+Hp3BSNyLS9WrSJUBcWrE7zdbQwVdfR946c+NP8B6RQ6GiLojiiLmn6Ys?=
 =?us-ascii?Q?hLAYNiM2er403TMZhavnPGuMdcV/yfPXEfoKvGQK4hjSidnpP6ewK6Ly0QlQ?=
 =?us-ascii?Q?6kQtAyoxqW2wqi4/+Hv26aAaDRquwTmKP0abxFzXvNULr7G+x3OAsZgGUUWW?=
 =?us-ascii?Q?+7Y22JrvpDOkG9IFI854Doxmh6Se+XFtuOdXgtyhUpI1ZqMRtHEQu50h24QC?=
 =?us-ascii?Q?HjxvhtXcyyaIIDHXSuvgf1KV+1hA4boHx9tLM03sD8AkiUPcNXnvmIrW8KKY?=
 =?us-ascii?Q?lyjH2JzqBGsstjNiApKHV0I8RpX6sYYiTLTYOZWD2DiG8bslzJmRufdKTuab?=
 =?us-ascii?Q?hCO4HCgqPdCu6TouVaYy8g4p8fpot+mP6t9b/GG2PiEngmjzKWMKmBiWAI2K?=
 =?us-ascii?Q?eTINweSfYlQKUPpSX7c1tKfCUyEVEDpnDC4nmCnvXhtFEQFnUNEnr2DdKAOR?=
 =?us-ascii?Q?TvwwSndbaBLtdAu6aoYzvU81TO6mhFJ7qsv8FdnLfwYtIsqB6WSrKigI1TsT?=
 =?us-ascii?Q?hKPsdGWz5SVj2QeY9ChW3MB+dqLfVGxaKZQ/7DrG1qM0rS3gt8HKxc4dC5AB?=
 =?us-ascii?Q?vtnrcttJtaREl3aXuW253gmbBtWb1T0whT7TaK7th6GkYVrwN1WYnfYbwcER?=
 =?us-ascii?Q?qGR8/fBIOKVH1NKGDY8SXMSmxzIWX5bYnPHtS14NkESwxilo0kfcwcB/OlrK?=
 =?us-ascii?Q?k9WQkdoxbQFEpKUHbHkOKq+Nr4Ecq1D3o7fWL/6nA+QzT0G8kliVPsMwfFX2?=
 =?us-ascii?Q?OuAV89fJ28VbYEkU92q0Wy6IrNcKRimAMvSG96i1CAZiSUn07NiWxW3lvHyn?=
 =?us-ascii?Q?GojgWoiQB7tGBobD50tgvdfC5Um5GbrjPPCDgAQxPkHXE5UThknwbjICXLyc?=
 =?us-ascii?Q?dy6lnOW2vXzxh4yp85XrLU6xApEBsyyCoLxVa/IyoK6OoELg4qD7vPONWLQc?=
 =?us-ascii?Q?QzN06IpvoADwo9JJsrN9BgvqOM+qOrWfdEOXmj2+RL2+wi+dpmxKePO4zI0J?=
 =?us-ascii?Q?TOQEEIM1h1uD5xMOVdlhVc1DXhAfs4JuNrpwPVXJkOmDFakqLOcS7WjdCDGb?=
 =?us-ascii?Q?q2YPjlDS15TOzDbh00uxLX9/pfuxqrEZWcxzTUWaAtJ2qu7SATRMISSC7TfH?=
 =?us-ascii?Q?Ame5w1l1mQJS4JYdAvu23wHYB9ty5Cy9ThCMGatE+VEpUWWWGrEikJm17FAS?=
 =?us-ascii?Q?0xc2z5XAUybSz1faUrd67GysPFpBbyfUseTu83AjCu+Yvzyzn5PW8Kr84Iqo?=
 =?us-ascii?Q?+p7x/T7nUxdTacKMFcBfzuqDXqLsNZwob6EWFCrzqAC5BptouUUDZKyX97tY?=
 =?us-ascii?Q?cLIR/vcPeyQVoj2wPmue9Rl6BG7Ok5R2Unyol7ZqLmKMGEeOe/EtqUp1yF2Y?=
 =?us-ascii?Q?N76rsotahhyPToOF6xDjzEYynaB+1XBKdFkW/o6rV4tpDKWBVOMigK9RFg?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?17rni1x3f+eIG6bmr6CBzQ74W61AoXCoHBpxNAbic5ClUuOPoImCCWr7/wNQ?=
 =?us-ascii?Q?MoOBD6zi4felFq+P8Yrz2AaRAxjGKxmHv1fHsgQSawrHjmTIVQXBXgrpuqbo?=
 =?us-ascii?Q?sypRU/xk7GasysBNYErXUNBbm2CuO5ddQSWPNNdebue2kkl0e3RDYPDUWgxX?=
 =?us-ascii?Q?rTBKK6PrctBTZVFzya08mr8N+7Ehv6niXxsOCmFx1EOxUH6EiS+yl9euiZPq?=
 =?us-ascii?Q?ILLOOId2ncp+c2X6kuJPOtvaPjwm5n7ax2b6ljIUaJ917UHQcrEuunON+Kvn?=
 =?us-ascii?Q?2GcwvmK1zUe2GsMQvNO3sLV2twVChvgE2Kf+UC+TpSTUvPfC39WkqGkYBlLC?=
 =?us-ascii?Q?jvQI7pQrnqK0Eq3tCbs+aTq12NbbrLD7vTZCJX506sjlO7CQcF45xpAsgRtW?=
 =?us-ascii?Q?YXrifY5DImEMBn2yQpdCtE4j6nqGt/M4X1e1KuUmRKLbJbMX2tVIUdSBHhtD?=
 =?us-ascii?Q?dxX43J8WNPsOczQowUvifRoJbnMxfYjq/5B2Dgu0nLBEQiPE0ftqGK005goP?=
 =?us-ascii?Q?t7kG0d//VoxSSD8N7I5yf36VtsZFRj5k71ldhryP7ZXStlEbm2y3MVomRONt?=
 =?us-ascii?Q?RoEN7b43OLJ6ChsxFqLDC6fcKR/Vp6Q62VpPNVl2qlytT2DyWAmoJQqTR8Hp?=
 =?us-ascii?Q?7tlP0Pr+Wq1w1gU/bvYB0u3mvusRgRBjeJKvKpxd/stmyKgQECYADAKj3Z33?=
 =?us-ascii?Q?woUwMkPxsTsInWU+hSUcbLc9ZkKN0e6aM4BqfatpZXvlOe2P7L2FrK01Wcv2?=
 =?us-ascii?Q?mzt/3cB9nRBpk1DZOGaYbUGLKgAMWq3P/9ZWonMEWRKgGbzKa8ZuLC9M6D7C?=
 =?us-ascii?Q?il/n9+5dtzgyNnberzSji1s+3mzk1PFNOJCJSD2hkqhUaQ2O8Z/R6+Tq/XbM?=
 =?us-ascii?Q?2mQRxa1gWhil/xvgafdDFQ2ApAa0oxOcw+HMDzpCrbuQVZ/IBTQ9unXLs86/?=
 =?us-ascii?Q?B3hXf131285dwf0uTBKMQXD1u5ZtTqwtrT7bNehC+UozMmXgVwe4YRCrIjRI?=
 =?us-ascii?Q?jCNipMWGVknEUQujfQ+Fqv3vvOWBzMBdOZc04BOnIL+7kVK040QKQd01fn24?=
 =?us-ascii?Q?ORxI3Aa3KJrtfTw7lnuQQ06hSjgZhXGhvmXXosGl5NTYebGp1HDMNgZ5OyuY?=
 =?us-ascii?Q?m8fkg113QBWq7RWamiM5aSrSbq6IKk8ZHG8vkQYP/anJUbj4rDdSOI1QeLdI?=
 =?us-ascii?Q?zQm3t5q7FJvxxgg2khNu/Hf2VD6TLFr0Ak7r/eFcRPAVDwVl7h1chHMrIAaK?=
 =?us-ascii?Q?0zIg/gjSPpDP593wtLgX2xHdyOz9HNIyWMFoIeXB4AFjpDbyK0eApUcHb2ms?=
 =?us-ascii?Q?XlD3o38VCAMtX5AWmUcS7xCaShBa5DefvQjGzJUn+vZIuQDs74VOKW5GjCnO?=
 =?us-ascii?Q?D8qGrhco7TmAoMpPSgCVYjN/IDLahIawA7HfQHacx/Za2klc2uwOhJm02gkY?=
 =?us-ascii?Q?gClHPlx/Lye5nfxn07/wAsQYzYWVgke/f6u70R/xI3IRzj5aBPmunEwXgk/q?=
 =?us-ascii?Q?i/BsWpndV4tdf0EiMUiQfmtjWptE2Bt6K6u80PAKxfiy5xgE2zCo//W2DZYH?=
 =?us-ascii?Q?oBj7exA8KzLJauFK6y6ryZvK+SXBkgPgznPaZN0B2keKVyxBsUx3SDQugBhR?=
 =?us-ascii?Q?I42kBytoAw+FRxaoio+XWh8/kUk0y8gdOtqtfAAGslbEAE3qP1BIkvgKzWSd?=
 =?us-ascii?Q?4exUVmHXvMQ9esz0B5W47S+dAgaki2Bmwc3cO5837f05j0JEDkhu6W21ZUeA?=
 =?us-ascii?Q?rm8uIrxSR2n3ZDi2SAegvcOv4ZO4DEQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8885cc-16af-4284-9fbb-08de4e75ecd7
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:22:32.6716
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhhwNc9gK+s3PhmFOfxQDUOVBaMStDr2zI83/NUXGhWr06QT33FIUMn7c2MA7bosWc8vJ6Ad8BBimfFlvo2BwhL0xVTtvWB7yxDk+QkmVug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzMiBTYWx0ZWRfX299V6efuzi1s
 zED9J1raJQUV6HMcHPKdfx6c7o/ocVxiocdqovv67VH6ImzponEaDKVEwbteATdqeJXZId67xex
 MH+rYA8pQ05ljv8R+Cka8akbun8yJNJVKpUE/WBzNxzOUoW6EVMFBvjC3ycUYPpup1+Odhqj3cu
 08qptPbimywM5h0xNtV9PojvxSNYEu9ASyl4vub5nzfF9uIDO5fKDG7f2uvtY+9NrtIbGCm7eQr
 K/oBrs43QqB4Pd9gHm72Fzc5N3khoqbanV7bd8pHXJt7vDGWWO0tU4RzrgdReRxxHzGRD4KZ6HI
 2Sbx66jAoSa2m3Jf9baNjIrrYkwtstO2DD0rXYDxeVtWU7G5ce7R5sHdUaYYL9qi8laWzqHdhyL
 /7Mo9ktuN8Vealz38CHp2DBuRe0iNArbt0qtSWNTq2allUEl2LqF07/jwLfn7KpcIOkAF6NUGpl
 FiWuGiA28gOYQksjRqg==
X-Proofpoint-ORIG-GUID: gHNQTSstFz_Wv9bBT9woREnLotk2x5oE
X-Authority-Analysis: v=2.4 cv=TYubdBQh c=1 sm=1 tr=0 ts=695f3f1a cx=c_pps
 a=JoWddxUZA+6WKbGFiApbuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=nBoEaXBCCWQ9D2kOqs0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: gHNQTSstFz_Wv9bBT9woREnLotk2x5oE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080032

Switch to using the sub-device state lock and properly call
v4l2_subdev_init_finalize() / v4l2_subdev_cleanup() on probe() /
remove().

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/ov5647.c | 40 +++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 47c0d4485..4660c06de 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -118,7 +118,6 @@ struct ov5647 {
 	struct v4l2_subdev		sd;
 	struct regmap			*regmap;
 	struct media_pad		pad;
-	struct mutex			lock;
 	struct clk			*xclk;
 	struct gpio_desc		*pwdn;
 	struct regulator_bulk_data	supplies[OV5647_NUM_SUPPLIES];
@@ -686,10 +685,10 @@ __ov5647_get_pad_crop(struct ov5647 *ov5647,
 static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	struct ov5647 *sensor = to_sensor(sd);
+	struct v4l2_subdev_state *state;
 	int ret;
 
-	mutex_lock(&sensor->lock);
+	state = v4l2_subdev_lock_and_get_active_state(sd);
 
 	if (enable) {
 		ret = pm_runtime_resume_and_get(&client->dev);
@@ -710,14 +709,14 @@ static int ov5647_s_stream(struct v4l2_subdev *sd, int enable)
 		pm_runtime_put(&client->dev);
 	}
 
-	mutex_unlock(&sensor->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return 0;
 
 error_pm:
 	pm_runtime_put(&client->dev);
 error_unlock:
-	mutex_unlock(&sensor->lock);
+	v4l2_subdev_unlock_state(state);
 
 	return ret;
 }
@@ -785,7 +784,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	const struct v4l2_mbus_framefmt *sensor_format;
 	struct ov5647 *sensor = to_sensor(sd);
 
-	mutex_lock(&sensor->lock);
 	switch (format->which) {
 	case V4L2_SUBDEV_FORMAT_TRY:
 		sensor_format = v4l2_subdev_state_get_format(sd_state,
@@ -799,7 +797,6 @@ static int ov5647_get_pad_fmt(struct v4l2_subdev *sd,
 	*fmt = *sensor_format;
 	/* The code we pass back must reflect the current h/vflips. */
 	fmt->code = ov5647_get_mbus_code(sd);
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -817,7 +814,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 				      fmt->width, fmt->height);
 
 	/* Update the sensor mode and apply at it at streamon time. */
-	mutex_lock(&sensor->lock);
 	if (format->which == V4L2_SUBDEV_FORMAT_TRY) {
 		*v4l2_subdev_state_get_format(sd_state, format->pad) = mode->format;
 	} else {
@@ -851,7 +847,6 @@ static int ov5647_set_pad_fmt(struct v4l2_subdev *sd,
 	*fmt = mode->format;
 	/* The code we pass back must reflect the current h/vflips. */
 	fmt->code = ov5647_get_mbus_code(sd);
-	mutex_unlock(&sensor->lock);
 
 	return 0;
 }
@@ -864,10 +859,8 @@ static int ov5647_get_selection(struct v4l2_subdev *sd,
 	case V4L2_SEL_TGT_CROP: {
 		struct ov5647 *sensor = to_sensor(sd);
 
-		mutex_lock(&sensor->lock);
 		sel->r = *__ov5647_get_pad_crop(sensor, sd_state, sel->pad,
 						sel->which);
-		mutex_unlock(&sensor->lock);
 
 		return 0;
 	}
@@ -960,9 +953,6 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-
-	/* v4l2_ctrl_lock() locks our own mutex */
-
 	if (ctrl->id == V4L2_CID_VBLANK) {
 		int exposure_max, exposure_def;
 
@@ -1218,8 +1208,6 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret)
 		dev_err_probe(dev, ret, "Failed to get power regulators\n");
 
-	mutex_init(&sensor->lock);
-
 	sensor->mode = OV5647_DEFAULT_MODE;
 
 	sd = &sensor->sd;
@@ -1229,7 +1217,7 @@ static int ov5647_probe(struct i2c_client *client)
 
 	ret = ov5647_init_controls(sensor);
 	if (ret)
-		goto mutex_destroy;
+		return ret;
 
 	sensor->pad.flags = MEDIA_PAD_FL_SOURCE;
 	sd->entity.function = MEDIA_ENT_F_CAM_SENSOR;
@@ -1252,27 +1240,35 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto power_off;
 
-	ret = v4l2_async_register_subdev_sensor(sd);
-	if (ret < 0)
+	sd->state_lock = sensor->ctrls.lock;
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret < 0) {
+		ret = dev_err_probe(dev, ret, "failed to init subdev\n");
 		goto power_off;
+	}
 
 	/* Enable runtime PM and turn off the device */
 	pm_runtime_set_active(dev);
 	pm_runtime_enable(dev);
+
+	ret = v4l2_async_register_subdev_sensor(sd);
+	if (ret < 0)
+		goto v4l2_subdev_cleanup;
+
 	pm_runtime_idle(dev);
 
 	dev_dbg(dev, "OmniVision OV5647 camera driver probed\n");
 
 	return 0;
 
+v4l2_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
 power_off:
 	ov5647_power_off(dev);
 entity_cleanup:
 	media_entity_cleanup(&sd->entity);
 ctrl_handler_free:
 	v4l2_ctrl_handler_free(&sensor->ctrls);
-mutex_destroy:
-	mutex_destroy(&sensor->lock);
 
 	return ret;
 }
@@ -1283,11 +1279,11 @@ static void ov5647_remove(struct i2c_client *client)
 	struct ov5647 *sensor = to_sensor(sd);
 
 	v4l2_async_unregister_subdev(&sensor->sd);
+	v4l2_subdev_cleanup(sd);
 	media_entity_cleanup(&sensor->sd.entity);
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 	v4l2_device_unregister_subdev(sd);
 	pm_runtime_disable(&client->dev);
-	mutex_destroy(&sensor->lock);
 }
 
 static const struct dev_pm_ops ov5647_pm_ops = {
-- 
2.43.0


