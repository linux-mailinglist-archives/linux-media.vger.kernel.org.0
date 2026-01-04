Return-Path: <linux-media+bounces-49865-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01014CF0C82
	for <lists+linux-media@lfdr.de>; Sun, 04 Jan 2026 10:14:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C2AA3011403
	for <lists+linux-media@lfdr.de>; Sun,  4 Jan 2026 09:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D52027AC5C;
	Sun,  4 Jan 2026 09:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="LE+3/vRh"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013062.outbound.protection.outlook.com [52.101.127.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73904279DCE;
	Sun,  4 Jan 2026 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767518042; cv=fail; b=byySk11xdjZAFXub/Ee2BUbbUnUa3vYcFY0w/psXiquQZrXZZAL/Gl18HIGKgoTZD51Mp+nkihyq7FGBwY5EZD8EQRlr1O3oBNsTIG0kJyxz3rKrlHFfejjxoikPswB35TIZLeqDPWxNJxmmW8XiElDh9eQYIMnBxVQv8kY7u8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767518042; c=relaxed/simple;
	bh=4pG8erGGbpFJzNrJQPGkCN+7CLQ+O0dgHZJ51aA28oY=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YhpvmpFZd5zPgrdZ3osqkHHXuzTi3zpVwFFjFBURF/mKtil2yZ3X+ZlKmYLSDuqq22Cs/8INRGBXdqVtasoAocdNTobpObfrjY56JlvWK8nK1HuJevpHCM+XivRyNVUHheXypmTmleKZn4uUH9AH3RVOT4xeD+TWbYYiIl35d1A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=LE+3/vRh; arc=fail smtp.client-ip=52.101.127.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIJdlsbhvudehtav8MKKGPylQTSeE9rtJx3kTHOwEqJAwDtQoTc/OLejTTAapbJ0doSazln+fVsda6Zl7D3OG4RraxNWaATJ9pbn24hfout4Z2JtFjfBPfgBy/xtZ81SCrl78xkR5HUbIacDlObmV67pFRTBPNKvEXrALeMi40OHuvCW12RDWXq6E+Q7plTu5dZDDNzSEoH+/3iJDz4yVqeWUCFBTq2UumtG+9mGnGhcmg7Ot2SILl8mW+yy6ZYlHfmQ2OuNlWOnbZndMMqaNzN39cGk1OwgCSBNRp+1ym6xbRWXVTvfWEfu02ksqE8egZObTxZolr9OI/To+kudsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l1oY3Qidh2AqN/IiycfjetXn0AjnK66Civi7abpCbgk=;
 b=t3hnz01Fs2aGxCmkM7Eup9E16B6aDJtQnyGuddwCkDXZIqeaVCy6pKfst/+SZbfZfkAgavUbB82i1EnBM7ElZMrgPfZW0OF/oj6kzYKalUKabYG5eAOW9uaG3jkz4ntdNK6Gr+FPXyjlQXXA3Y3FYKjnSQXguLsngJwnpncBo0e3m1cIa2wPdWE6xFu7FUt+CduHqFCpa+1vUFpWJOLQmHFdS5HHRdfkN6ghet7anQxuuSYNOkuq9czlp6imRCqRoF/w10nmJy4cLBZfT+6eaF59vBbHlPzHkg2hmtabdL3DtrAKGwtTXdi8kjWvyMRFUtbEYLRKBknTr4pAyPTZiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l1oY3Qidh2AqN/IiycfjetXn0AjnK66Civi7abpCbgk=;
 b=LE+3/vRhvZzzNOZrnUG7aM0TgnWq8DcFvjJ1Ij6jUUeUfXpl6hJJ9eegTxBSchG4yaNgrYedK4FMD0Q5xSRJqc3QbsCKX7tZKshbF69CkUEinGoBFTq5QunJqx3iYG9xn9U1EIty73dSIjvfFP5+O5nV33R78VJmGgz9I58beAAYNqutZgrUhGV9GyM5UdbEPwbhvPbZN/oJAjwVNVrDo0S/fGC3OADPbm6tLVL6Q8kjl+EF+j5+gVtpkMpoFUBkp/FHek//hpm8A3gYgK17s9c+NCLpO4oYQ0QsDZa3Y5oxDBZIY02RPQtJsIcLgqvNQDzLr1xUTxo9rU9di7kq3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com (2603:1096:405:21::13)
 by KUZPR06MB8316.apcprd06.prod.outlook.com (2603:1096:d10:60::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sun, 4 Jan
 2026 09:13:54 +0000
Received: from TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::8fe4:2b45:9a9e:5dc1]) by TYZPR06MB6895.apcprd06.prod.outlook.com
 ([fe80::8fe4:2b45:9a9e:5dc1%4]) with mapi id 15.20.9456.013; Sun, 4 Jan 2026
 09:13:53 +0000
From: huanglipeng <huanglipeng@vivo.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shichuanshou <shichuanshou@vivo.corp-partner.google.com>
Subject: [PATCH v1] media: lirc: modify the timeout waiting time for the infrared remote control.
Date: Sun,  4 Jan 2026 17:13:41 +0800
Message-Id: <20260104091341.184843-1-huanglipeng@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SG2PR06CA0211.apcprd06.prod.outlook.com
 (2603:1096:4:68::19) To TYZPR06MB6895.apcprd06.prod.outlook.com
 (2603:1096:405:21::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB6895:EE_|KUZPR06MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 33b9bcf3-aae2-4e15-5f4c-08de4b719511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tIlpmry2Q4Z49ZENKF5/6/RNe7vigPxaRrPW6iDP3wEYUwHdvvWkD1K06XaY?=
 =?us-ascii?Q?6+3zegfeWTkL4pXQ/PhopDEyumpqH9K8eHnxAgRsT0eOXHDuzJuq8mZtcO8v?=
 =?us-ascii?Q?O27HlmsgE4kSww0xV0CEbmPAsKBNy8K62Had6j7a156SkGCy64ifeigRxoFu?=
 =?us-ascii?Q?oiQr0w5mELtggrOd64D1eu/wmo2TWsBv6GRbqoqcQd16Q+asdXERFgp5Ze6D?=
 =?us-ascii?Q?6IFxSzhTmLvRY3AXEhJna7gBAua573thuBXoneou+VZQRB6L5rPVS0s1VD5q?=
 =?us-ascii?Q?Rj9pdis5829xW6Pq2NZh+QiC/rYrQ4ZUhfVw1MomdQle1xJwIno4Xsa1XeGh?=
 =?us-ascii?Q?vEBSQaGP28gd6UkMThPTkKviM2O4q1uLtb6uIn3FhRZXBZdw93nynV0ovKSB?=
 =?us-ascii?Q?26DUgawVhTgBBvOaFZCzlUlINoY7NxrhN6GCwwILHImwu+P+FmJfEUMNIXC6?=
 =?us-ascii?Q?+hhdjkxKqjm2/YQwxdrvgzd5xY4GvI4LH9DlsRKmrAlAEGrXkcYRvf3MlCtP?=
 =?us-ascii?Q?7OhItoZf85datT0RPrVuKsKy73z0KyW14Or8x2AXBKbWqsIEBVwCmd++kESL?=
 =?us-ascii?Q?f8UoRSX/bmBSyzjABtLbi+zaK0C9Df3OsZzXNB9/wV4z2jumSDl7Hq7DFhRR?=
 =?us-ascii?Q?X9Ji7iYsueapMxKHbpYjiNXvIfZj8HnklsWJj3IDhI7Zk1Ayz5rUXjDLR+il?=
 =?us-ascii?Q?JFr2sa1ek4eAAq+qJOvrs1vPRXHDF4WAY8pKxIkLQ4JSCBCSfyS5R2nS0bv+?=
 =?us-ascii?Q?02Q/eUZo7qTo4CNJXoKsXv79wPWF8UwHdormp714Y3JzV2+avpCaCppeWbzX?=
 =?us-ascii?Q?63ZQwMfmLdCN+eVv4vYDZKrhofiOwUJNccZcA/V+rqNlpHPyCSK9Kj3lCVLF?=
 =?us-ascii?Q?EaBpW2QtvB77U3GQaLqn5ZBR4F9Jz66spxJwZ991DPz2fW8jUyewm1Qdo9rK?=
 =?us-ascii?Q?ChlJVNGM9PAXoEvVj5XTFfmF8DO17JeW9uNtdp3CRFbv/q33sfBH0DakXu0l?=
 =?us-ascii?Q?YQ6bLnb6+v5/4kDPT1vPudW7tmBXx5ZnG2xSYoKEjE3KveREOum2lunS2YyA?=
 =?us-ascii?Q?sFbXJiP/9BEXlfgfXO/4JONWghKCVtkbo8zBuy+/DULkf+OekmXIP8jR0V5U?=
 =?us-ascii?Q?ptIKjq7ejGia1zcQe1wYkbb6U8KeI6j7e+YsNs4xnDekdGqMu6uzlZtJ0meZ?=
 =?us-ascii?Q?TIsqxMDvrzUHY2y40nHv2qtYbbatMkTY16xcMEc16kL4gO3mbuT2b9OZbQ/t?=
 =?us-ascii?Q?ELhwGNJy2DCv52DYg1sI/ovpmJN6CFfHiQr/YLbuso0fjr7NY0NLTw3mYA93?=
 =?us-ascii?Q?rroLohGQPdxs0a3eshT69a77eVjMoGX49dAkvS9I/EuJ8sSyQUR3qtZo1X5t?=
 =?us-ascii?Q?N9csWV10ws41qBpEmql65DHducjHGw1AMJl4qYPJl/nglstnRogi1SDe6xT9?=
 =?us-ascii?Q?6Vf/EElp/4BWJ1HLKEMC/aMORXOW6VXehX3GvSb81+0BQ3+CFAl0AC+tOiWe?=
 =?us-ascii?Q?vyUZ18IfLy+azcB2HFlwfTxxcSY3GkXV+sQ9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR06MB6895.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nEkFcyUZY64n23WrE1outHxN9x7rLVGxpdSr/aKnBz2w5YktKIud9oCdGqNp?=
 =?us-ascii?Q?GSU8RrqWRwAk1Pt8895v0ZnC1Gin1EQgvoHcR4qtcDBVZZ4tWSjgQzuLBFF2?=
 =?us-ascii?Q?YDebsFmGx7YwnWXWYZZvQDOubk7mgGjNCS+a3hSxio0W2EFzFkGwF1dv1U29?=
 =?us-ascii?Q?77DYQ7wm0b8xBBlbDvPbZ4ojGb0MXKzx1nyCQ7NQCu5OV6RyfD0n7lRFQ9RA?=
 =?us-ascii?Q?G1LP0AlANAKiYi/4c8/VIq0h+noXQk5HKnrUWsY9N/RIqhRw2acB1H2eyBrt?=
 =?us-ascii?Q?KWu0lE7es75WlTCbbxjOEB4R1jAWD755zY1Ac1O3kfixQEbuenfXkl8NeY5c?=
 =?us-ascii?Q?pn5ReW/DnmD64KjmcK7+DUsyyIyHeEoTOkWk0pSiKwDfEnOgvCuErEuD8c9k?=
 =?us-ascii?Q?VSQ/RUzOm/TQwx4W8lZg6Pql6579sy7k4ZXl3o/AUcv/2x4hXQY5PsbUwDlk?=
 =?us-ascii?Q?KDWtDR6sENN+d7QwCXt9xnliI3P8Dp0BjOAGWXw5F3LL/2WSqgCZN4YcOdNm?=
 =?us-ascii?Q?oGnWnDcmmbsbwEiUlOnwe7FNIrmTc29N87OkPW0p7ekGCcBVh7zmegpthON5?=
 =?us-ascii?Q?6tQkH785SMznWDSgJrI91rfsSTcJ8t2OOkwkRGGeUZh7u4dkWlECV20LTv6U?=
 =?us-ascii?Q?L5ER9hFurkkCPQ5gm7f+if7xxbXaeCiSgb8n6VmKsmmH6WYsMAxj+XrVxT65?=
 =?us-ascii?Q?2a45JyusxvtHPg5kUwLto4No6Uuog4MNFdKaA9ZD5P0EVC87yqLQL3A9uVFN?=
 =?us-ascii?Q?jNjwDxkMBPyQxmlGKdFFA3SOA4ESd+GhyC/JUfxeo4ZDBjbVMh0829abOI3M?=
 =?us-ascii?Q?xUstAPa/yIIlo5Oeccik/bvIeDwLoY1GN8/urhMHoeCod/SOqG/r8QFQk1fu?=
 =?us-ascii?Q?DHPOcQkGOfhbPll8Nu6baCH1kp4RrqhMzGhVo0qdtPWz6YR1VQJCZDDw56Nt?=
 =?us-ascii?Q?U/DhEPxJ4zJFiU353MEVjRmS28JH+p0KLtSm4+3IZVO6HcK0aP/CS0yCUP8D?=
 =?us-ascii?Q?zN3XXNu5gLALcUMF2BWfI6VzaDu+CqS3ZXd7msqp7VIsjlJBawNQ6iRh/qJx?=
 =?us-ascii?Q?XpoGpAenKI54oVA6dOpmr3VvSJbMpABl4G1Q5IG66sNnzFcXeC7ADcj1SYpC?=
 =?us-ascii?Q?vk5zlIunUG5gyNw0rNllKD2AQy1uPmxIs/akfwbWp1slmWQaFSS61lBWeZ/U?=
 =?us-ascii?Q?+65mgqMlijHRi5/ADthq696bJFRyZqWElhZ69ZrdaMysgpx+1Yo0V9npcLlK?=
 =?us-ascii?Q?ZnHFWGymdpiJ3zMvDWouQsqfcbhkBmczk2Vlq7HUNbdRB1BxTmKdEfGHY12/?=
 =?us-ascii?Q?UGLiPtdCLyHEoZsZ5T74N1jh7Zvhs+U1R0u6KzsXW1pdZlWiwZcsyALl8Azr?=
 =?us-ascii?Q?vdU+dErNf/TJJHPhbilFb9g30ZZPorXa8ZZRmAzRksvrPehnHqU99eDyAE3O?=
 =?us-ascii?Q?kNiYyATRp7ViZ1rh0jUmqcK4n8YRrADOQUXZAcNU6C/xK4b4G/bRZNT5EK/p?=
 =?us-ascii?Q?VbKTosPdT5nJXy6nmDC7m6JjLN1cSshOaqTXC2zIkpC6adHHIsk83FwaAMq2?=
 =?us-ascii?Q?CUg+/QmJ4R4MgE2xoyGpNqS0fswGCIyR00hXR6lWbUYGEsW26h8rCRuw8cRm?=
 =?us-ascii?Q?ib4pTeiJd5JazURp/8A01XhP/wMBB47r/o4DmnE6Y7NxUVvWaIrq2Chq1aL0?=
 =?us-ascii?Q?qSpGbCS6t6+D2sf79+W0PjvwymODSOC7rZH+vbVuWKkHpR9ySiMDk26uxprs?=
 =?us-ascii?Q?VJLdoL9Elw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33b9bcf3-aae2-4e15-5f4c-08de4b719511
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB6895.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2026 09:13:53.9367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W86UKZ9Jln2w9VU3++AOwiWzKvlft2pSVPUDj8UjpcKkAcscsfwTPqlC7hLv9n3/h4z8cGH/ksW/Iq+LMZb5hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8316

From: shichuanshou <shichuanshou@vivo.corp-partner.google.com>

When certain infrared remote controls send codes, the kernel side
does not receive them, which is due to a timeout in transmission.
Modifying the maximum timeout time in this area can solve this issue.

Signed-off-by: shichuanshou <shichuanshou@vivo.corp-partner.google.com>
---
 include/media/rc-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index 35c7a0546f02..9214f3fc174d 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -303,7 +303,7 @@ struct ir_raw_event {

 #define US_TO_NS(usec)         ((usec) * 1000)
 #define MS_TO_US(msec)         ((msec) * 1000)
-#define IR_MAX_DURATION                MS_TO_US(500)
+#define IR_MAX_DURATION                MS_TO_US(1000)
 #define IR_DEFAULT_TIMEOUT     MS_TO_US(125)
 #define IR_MAX_TIMEOUT         LIRC_VALUE_MASK

--
2.34.1


________________________________
=E6=9C=AC=E9=82=AE=E4=BB=B6=E5=8F=8A=E5=85=B6=E9=99=84=E4=BB=B6=E5=86=85=E5=
=AE=B9=E5=8F=AF=E8=83=BD=E5=90=AB=E6=9C=89=E6=9C=BA=E5=AF=86=E5=92=8C/=E6=
=88=96=E9=9A=90=E7=A7=81=E4=BF=A1=E6=81=AF=EF=BC=8C=E4=BB=85=E4=BE=9B=E6=8C=
=87=E5=AE=9A=E4=B8=AA=E4=BA=BA=E6=88=96=E6=9C=BA=E6=9E=84=E4=BD=BF=E7=94=A8=
=E3=80=82=E8=8B=A5=E6=82=A8=E9=9D=9E=E5=8F=91=E4=BB=B6=E4=BA=BA=E6=8C=87=E5=
=AE=9A=E6=94=B6=E4=BB=B6=E4=BA=BA=E6=88=96=E5=85=B6=E4=BB=A3=E7=90=86=E4=BA=
=BA=EF=BC=8C=E8=AF=B7=E5=8B=BF=E4=BD=BF=E7=94=A8=E3=80=81=E4=BC=A0=E6=92=AD=
=E3=80=81=E5=A4=8D=E5=88=B6=E6=88=96=E5=AD=98=E5=82=A8=E6=AD=A4=E9=82=AE=E4=
=BB=B6=E4=B9=8B=E4=BB=BB=E4=BD=95=E5=86=85=E5=AE=B9=E6=88=96=E5=85=B6=E9=99=
=84=E4=BB=B6=E3=80=82=E5=A6=82=E6=82=A8=E8=AF=AF=E6=94=B6=E6=9C=AC=E9=82=AE=
=E4=BB=B6=EF=BC=8C=E8=AF=B7=E5=8D=B3=E4=BB=A5=E5=9B=9E=E5=A4=8D=E6=88=96=E7=
=94=B5=E8=AF=9D=E6=96=B9=E5=BC=8F=E9=80=9A=E7=9F=A5=E5=8F=91=E4=BB=B6=E4=BA=
=BA=EF=BC=8C=E5=B9=B6=E5=B0=86=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6=E3=80=81=
=E9=99=84=E4=BB=B6=E5=8F=8A=E5=85=B6=E6=89=80=E6=9C=89=E5=A4=8D=E6=9C=AC=E5=
=88=A0=E9=99=A4=E3=80=82=E8=B0=A2=E8=B0=A2=E3=80=82
The contents of this message and any attachments may contain confidential a=
nd/or privileged information and are intended exclusively for the addressee=
(s). If you are not the intended recipient of this message or their agent, =
please note that any use, dissemination, copying, or storage of this messag=
e or its attachments is not allowed. If you receive this message in error, =
please notify the sender by reply the message or phone and delete this mess=
age, any attachments and any copies immediately.
Thank you

