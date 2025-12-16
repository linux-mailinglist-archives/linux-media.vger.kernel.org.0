Return-Path: <linux-media+bounces-48852-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C60CCC13BA
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 08:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0A9B7303EBBB
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 07:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99A95338F56;
	Tue, 16 Dec 2025 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="KBl+Npj1"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021089.outbound.protection.outlook.com [40.107.57.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F387338586;
	Tue, 16 Dec 2025 07:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868437; cv=fail; b=YitOktguZ6OKHRiGN2bV0+90jzR40Li3a+fV9NWx1cb2uo5fpF+z2JUfzv5gY9is3O3innSLh0FDkATqJrzhbEZLvbfgHwFujbiYpAbAFkr+fw6Rc/DIe5/nhuN/bKPu+bpquffRESPO8JCvoG1WIcnJKNdzHZsgjvPsih9Icxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868437; c=relaxed/simple;
	bh=t6dFzvw9k7TEsJ4E45A2M+L0vKk65OFjeOLHyku25YE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k242PGbB0c14g5/QUxNjxQJ5DUpJ9fdLiZ42TH34H/tBmP/gMc/B2Cxpvqzr+YXaJtyE7v5I3uHViDJR8LlZGU4OSnAtuMQ2gZziT/YMJtGexe8qWAMK+L7UB4SJJcBisVIh8yFfSHCzmfWB7Q+rXIgG3+ZKsuoCX/c38Rf5XNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=KBl+Npj1; arc=fail smtp.client-ip=40.107.57.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncLg9NQGsB8lNKZN0HeGBrlnt3MC4hibw9FPRVzBLZ1A/VVGlGCbAisWjWmW3wij3KEGLBztsoVtA2xwGRu+NP2SQ+/bkwgB2TZtx0F5y43qaMMhFsAMLe4mzWE/p/qThHxiUx7J6gtFfLoNSUgEcRzcNefh/YT64DJkvqvQSqRw5uLEucEC1dx+DkeS9PLFy8bIOkohFnst8N1XzuQZHuo5HDwzoveM/dF3vF49P3AmGj5No4LntKa01IYN2r/xbLSYdrTsoo+JTCTa1ZMik5cNaGzF4veJuTi468IBO4omShJn7uLPilNv//RoPRxC9rDbqA3FxF6noU/gufmlzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Py12aDljtRViByS9P7aIEKRxR5LhoWwzF1FHridyJTg=;
 b=q0OmUeWWk1fbw1tIqUxnZnG+fnlNA0zSGnNyxUmfp9GfGOCcEgSFT/6Mguy4zlMzhHqwa8xS80OMlWmDVChAu3bH9abj9ScvsXUloLNLXORSNmhQCgDFdR+LcjshyjlzkZASYgDc2fTuYvZhvryOMLjMXWWmndTmX5V2R5qJmqwCYUMnINlW9dak5K9uTukSxuMigwyW/5+d2TZRdBGKPDURzxUMszmBk14xQon9tQdIZcyCz5mkVSUbW104199woKn5Rg606XslIXHJ5d5oqbk83vaVkFHo3tMK4PN5QUEFOkwOGU1ecpLojaLVcGXKpIuJ/qVSfcCXV//Rbzmxtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Py12aDljtRViByS9P7aIEKRxR5LhoWwzF1FHridyJTg=;
 b=KBl+Npj1xNedf5SRryYPY0ZPqzdDFGAVN2sRM6UEI3C9aykfs93rO1blzSIOcQYb7+Oq37NVeet6tEkC+p/cFpFKKsv6ip/2A0uw+TQet0fQKmfkmnFz+u6Fm+TMFJ2RlSPW+mwfwC+UjYYPup48TZw+SCGOXMvSBwt49LDTQS5HILXCCr5q+/Hor+8nWo3PPd3FcYvEQWNfz1xDnWh0yjl62ZmUtyO3HQo4TWD0jf5V1W5bpjO3rjD3CiGpYiAfeFhDbkCcsroSewHVbVCiF9pNqSVGU3iHCioPiV2VQkNsyNti0G4IyF6h3jPnQlhkHEmuR6vpYYiWIV5k92g4cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN2P287MB2109.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 07:00:31 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:00:31 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/2] dt-bindings: media: i2c: Add os05b10 sensor
Date: Tue, 16 Dec 2025 12:29:49 +0530
Message-Id: <20251216065956.13604-2-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216065956.13604-1-himanshu.bhavani@siliconsignals.io>
References: <20251216065956.13604-1-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0186.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::13) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN2P287MB2109:EE_
X-MS-Office365-Filtering-Correlation-Id: 87fa7af3-df55-4e0d-9f79-08de3c70cd37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hYjQ8ApGo2nmObd4/lhGeJNy02+B/Ryn4FAHTpXb6ztj2lipJri2LkgeG1vy?=
 =?us-ascii?Q?JyjrvPnFwm+LtwSrrScIfY0EUzncSs/5Pf4OVPPED3PzKR9C/kflQXBm9goq?=
 =?us-ascii?Q?dS+RFy7x1NdqWK2ISjZ55As/5VjBlgY9vtb314FAtzWdvaqXQKpepMckBvfw?=
 =?us-ascii?Q?T/3m/hg32ymPTw0R+7AzpXRAPY5j/39MNm9H+xt3O8mGygW5KNusL05gGuue?=
 =?us-ascii?Q?zSwqGEKxKjX5tf8ysiK69sp4ReQedL5LcRToVYcBJ3ALJRq1wrcywtrOE6fR?=
 =?us-ascii?Q?o4JUoNuOnStjF6e/i2h/p9SPvEGGl5gJROG5Q+VFdH+L3xfq2HPx9wLn9nL8?=
 =?us-ascii?Q?Ne8Tu53604/4IqY7qMvHPi5Wn2t9kSJgxKj9JCeb4fthRx7eiOlIWK061icW?=
 =?us-ascii?Q?rmVdFPRoBxz16FKnWKLOocxUzzknxao/hwEtvVpUI1DH8tZlVZ9yNWPPJGlW?=
 =?us-ascii?Q?tM/zcR+GDJxmo8r4RpDx+ZPrRnwS+KDvw3WyeobFedrheHianFzIoIN3QFjM?=
 =?us-ascii?Q?92cLEamf0hbenDM88deBXIyCZnypu9qzLjALNFABZ/q9PYf++9PeCXJjdMwH?=
 =?us-ascii?Q?vSMf72I8y88hknIlS0xpg1Fl/u3rx3xRzoT2SfzN5PjajClgPNsYtqSRpj05?=
 =?us-ascii?Q?2SGatj32N05ftz2gGz5u3ksto2qKY5VbAnF82WLVRhSBenHAe9/dDRkANNIY?=
 =?us-ascii?Q?k1xeoB3zw7+7vpGpFaf75b/dRvg3IyRW2T3rr5sFcOYPvIx00965hDUWyfbW?=
 =?us-ascii?Q?igwexl8NdsHATK/qA7hWAgCuET/UnQPWJ18EqCur/W3DCMCj7YmlCvPi2QCC?=
 =?us-ascii?Q?1IaCZX/7xqDbEjEp+ppQTwNjHHmwiMjHxTCDbsEfQa9z+DI76gfMVJOtHG7I?=
 =?us-ascii?Q?y/gpfzzScqsnU3fzq6siZ68lz5bxqOMV6XzQhjCvF7G1ogJgDnbmxjvWF4KN?=
 =?us-ascii?Q?hMLPQ46CTO46S5lDpzdnUP0Tktr2mklZszw1cw5nPVRPg90VRHe4C7s/t8GZ?=
 =?us-ascii?Q?3U2k3BKnUTn2ZNS6Fpa3Jf+cwN+TTtq5rVFO6TNZ/sTfrvRFbxUV+Rx+a2Ih?=
 =?us-ascii?Q?RcWQkRXso3Wqy/SxGTal2F1QZ2dhvO2OhnCYYz+1eRWc7yjvqnSWW7I4Klgq?=
 =?us-ascii?Q?q/YJ+aHgIp1MqaW+Fsb2AQIykeTnCF7Z0bXi0fyI09tzQ9k1Wq9Fu/GyeGNg?=
 =?us-ascii?Q?vkdK830Y/ciji/0BDaDt3vsAAza4YzSJQ5g2nsjngKJRA25zys14wCjZtIql?=
 =?us-ascii?Q?Q2lwZijeLaC0oz4hNxkDEB1cFtXH95z8WsVOJxNrzCpCKOo7GWrdrEFFm70B?=
 =?us-ascii?Q?uRmcndcm7xJ6jtrrnoyLaNqfT7Bvieqqvzfv9AIGFP3Modwj3i2m8nrjhMaS?=
 =?us-ascii?Q?Xcl95FLlVDNF+0Izx9Bd8BAxb05lIITZEvyiiPaZFOCcPjcuLP9I4OyyTcAs?=
 =?us-ascii?Q?E2t0s5dJFJbKjYToT6GLG5RG1D/ATQg4PYC+SqCh185RL/UHaba+zA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dXtJZQHWluJxfoLm8MrMpwAGhMl3aaMNXZPoMDFhyugwLjITxmTbK9ppEZpV?=
 =?us-ascii?Q?xZRmjafxNfoeprH+jtKEhXtAgHiS7Ln53rtrtWyx2denkWjJlz7sDhZxiQq6?=
 =?us-ascii?Q?EzH9X4sj8tq34k3JzBPAsOAP0vByLHAkXKOlRSxjwoQ1Zm+D6wxbw9C8h7lc?=
 =?us-ascii?Q?yvbpwrS3ObF3Gb5j29+D+elB+rUcVXB5Yq+qGNtZwIPY2gVpa+keFo5PpUog?=
 =?us-ascii?Q?DBJkc/2aYneJJkSTSNckRcgGo3o9YQ1O0hEZ0Yr0evQMUvcuOZKdB9U6mv6K?=
 =?us-ascii?Q?I1tJz1NrydpcJDl5zWoh0I5DdlEwnjvYjtcatRB88UofFjoL2zuIouabyV4L?=
 =?us-ascii?Q?phyh2bGYNcJmUhtC8aav5+weArSAFCoABUGyYqYQ+OZGiubyFawd9/Rs4MbH?=
 =?us-ascii?Q?XNy7C1kcczY5POTt+uhISQ9uoKz5lWNA2Z6YJ6Njrqgp79n3MWF8rexODAeA?=
 =?us-ascii?Q?xZKIEz+pKwIU/LwU2BJ/XCnJUOYAWZgMztWpm2jLBL67Gg26WfVXN5sqnER8?=
 =?us-ascii?Q?WNwAjn4GeNg3PcMa294o9JEYkSg7kPPh2e+y/2pofVrEpGYwKksvvsgrcd/C?=
 =?us-ascii?Q?vjweNx1vD2lU2Jh6QuzgtxNosGKhq0pGqqsnKmPpznZJIBFC1FhIvj9tGL6P?=
 =?us-ascii?Q?g3t/VEOza/tQSqEZhd52JYrkSMv5PomvBSWqWavF/N5sYLQH4K2h+O+GsgaO?=
 =?us-ascii?Q?zXWJsqEB6fw/u+QrrJfFMT85HiR0yYMM40JM7VFEWtYC2eXZFy34VUiebUea?=
 =?us-ascii?Q?NDhyIsB1v95CnZuZIuaS/emVAbJuKSyEQgO9d15hgVFw9aRa10ZvLz6N+c2q?=
 =?us-ascii?Q?NsL7XMxxM5sfPalSUuRpBqxojLL7Pz6JDaNnLu12GUxA2mv+7mDVKt/tTOlV?=
 =?us-ascii?Q?dhXZXlNfax0XNWPLmLd7ATO3pzpoLZAQEU6GnHKKaxpdaDcV2kCsRRQ5UcSc?=
 =?us-ascii?Q?Da6vXD1nb6iwiy+ilQf/JhQg/tFXhyFki58BrPQ1f4hxbClNVD0iKms8rdQX?=
 =?us-ascii?Q?0hAJLDlM+QV14BrcZLZGwC/ZQv2t1nL30hwGw//ivQDo6nq2TuQvEMYhQuCy?=
 =?us-ascii?Q?Eg1qD4neGGOqRlSn27StUMTrWz7umW8KqWUFphJ3LH4Ik1MhE4orad6BvVJu?=
 =?us-ascii?Q?SvBpimJM3l0IIsodOsBvTdEHGuimVjajkFdRARUNFx2OfvjMh+25NS6bgTPN?=
 =?us-ascii?Q?3ThpDT8+hL36xRyp3UMl3qlbt+7kcGi1A+25i96ZjSmF33HehgTd/7Seff3P?=
 =?us-ascii?Q?+thtVF2RwUuWzDLXx5oDPbDke/VZqXEzYarB3DzHGBolZPeU97elUQbKtddE?=
 =?us-ascii?Q?mgtRMuW0Oc3kdenNvWWrexVZqW8hSICr7YhysQa9IyXHIOgGcpWBlppOTkg1?=
 =?us-ascii?Q?PmZfQLCc4rsyTaWrjWBipjwTNKBRYal9ntDha3pbf/ftuGMIfNtqbOxU/Mxb?=
 =?us-ascii?Q?kVp1+HNxwx0tPcdvIPTTil9LD/uHqNNrrMMOBGNzSfJlvEj1vmA2Q084Maw3?=
 =?us-ascii?Q?isG17ixcL0dDfxwepMlLZjjGHy4/6jlhnficmAIoTFipz8Hon6cTvUhSR3SW?=
 =?us-ascii?Q?zZR/7FX38m7aRwy3TfINXK8NRTmmFQLD2PgSC0Dfx+7MNCYDh27UqAouqkhu?=
 =?us-ascii?Q?RotTPsESkzoJ60ssFX3sKFM=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 87fa7af3-df55-4e0d-9f79-08de3c70cd37
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:00:31.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0q3m+INyLADc7trinK8rA4KZiS2UC8WmGivq8mgi75ZTZGjt92y1pIMZCgzGFLdjF7uaBGYDZ6fkMdAU9TgFnHIvyjyrFUz3yMOFFj8NiUlW5GNoBlz8ASKEcDciSTtF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB2109

From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>

Add bindings for Omnivision OS05B10 sensor.

Add MAINTAINERS entry for Omnivision OS05B10 binding documentation

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../bindings/media/i2c/ovti,os05b10.yaml      | 103 ++++++++++++++++++
 MAINTAINERS                                   |   7 ++
 2 files changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
new file mode 100644
index 000000000000..b76771d81851
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,os05b10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: OmniVision OS05B10 Image Sensor
+
+maintainers:
+  - Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+
+description:
+  The OmniVision OS05B10 is a 5MP (2592x1944) color CMOS image sensor controlled
+  through an I2C-compatible SCCB bus. it outputs RAW10/RAW12 format and uses a
+  1/2.78" optical format.
+
+properties:
+  compatible:
+    const: ovti,os05b10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: XCLK clock
+
+  avdd-supply:
+    description: Analog Domain Power Supply (2.8v)
+
+  dovdd-supply:
+    description: I/O Domain Power Supply (1.8v)
+
+  dvdd-supply:
+    description: Digital Domain Power Supply (1.2v)
+
+  reset-gpios:
+    maxItems: 1
+    description: Reset Pin GPIO Control (active low)
+
+  port:
+    description: MIPI CSI-2 transmitter port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            oneOf:
+              - items:
+                  - const: 1
+                  - const: 2
+                  - const: 3
+                  - const: 4
+              - items:
+                  - const: 1
+                  - const: 2
+        required:
+          - data-lanes
+          - link-frequencies
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dovdd-supply
+  - dvdd-supply
+  - port
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@36 {
+            compatible = "ovti,os05b10";
+            reg = <0x36>;
+            clocks = <&os05b10_clk>;
+            reset-gpios = <&gpio1 7 GPIO_ACTIVE_LOW>;
+
+            avdd-supply = <&os05b10_avdd_2v8>;
+            dvdd-supply = <&os05b10_dvdd_1v2>;
+            dovdd-supply = <&os05b10_dovdd_1v8>;
+
+            port {
+                cam_out: endpoint {
+                    remote-endpoint = <&mipi_in_cam>;
+                    data-lanes = <1 2 3 4>;
+                    link-frequencies = /bits/ 64 <600000000>;
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 663e86eb9ff1..c85915d5d20e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19234,6 +19234,13 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,og0ve1b.yaml
 F:	drivers/media/i2c/og0ve1b.c

+OMNIVISION OS05B10 SENSOR DRIVER
+M:	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
+M:	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
+
 OMNIVISION OV01A10 SENSOR DRIVER
 M:	Bingbu Cao <bingbu.cao@intel.com>
 L:	linux-media@vger.kernel.org
--
2.34.1


