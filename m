Return-Path: <linux-media+bounces-32365-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B1FAB4E3A
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 10:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6BAA188AD61
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 08:36:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA0C820E03F;
	Tue, 13 May 2025 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="KRqjDy7M"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022116.outbound.protection.outlook.com [40.107.161.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CAF20CCE3;
	Tue, 13 May 2025 08:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125390; cv=fail; b=nKpXSygYQbEhvnCDlCqblCc5y5hcb42PPnSxOcxLQHrIGcWhUoQPwIDFd4pBitaMWBw0SGYJkDMIN0ktKtOnwHMI3W58lIhkgtokeeEIiz6WRWrg7c4Ps/0hBjFCXWNgymONHL+3i/zlEM+R7jNj8D+K71tVD8udgX+wlfE2tVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125390; c=relaxed/simple;
	bh=G3K0pmTTy+y5fH+C2iBP856Mj9KRdx27DA23cg81004=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=SYGgWUPcqqMdqEAnPRfQQD2N6M2KAnoCFn6J3QX/6TWgU79EWdDPsVSTH0SzdIix3rAYzeppeFPHFx9ecj4QK9twf+9M42kAH4k9Tpo4KADann63dFSKkB9eprKTMW0LcE47HaPEZ5CqExWLkDf4vIuoqs9+pKWCuD0wnLX+w8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=KRqjDy7M; arc=fail smtp.client-ip=40.107.161.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rs1fSiF8fFtSiBQu7/gQt3nKUJRK1cAa+He0d0fgIV1e5BV5k2M9qdVWwYdQrz8OhxTl8F+DlPk+9GoHkkPIQmQMUH2KfT+b9tOxFzyuNbBQPUFGgInWdR1RUdSN4F0H1d/wsN7ijC7DbN12j2GbkxQUmg8AQYvKh9SADsM4gn5If6mok6qNZPoBnGHwWpMgFqaAZ8x9rt0ZcH0c3FDfF5MPLqMImyQQCjVjOrH8OwBjMywYQTJL70BGygwMzzgsQXEoeHf3IZAlUMK1OmanAJO7fMzfSR7wXgGzcY6cBwmytf6wq6KhKg//s5feVQB9ID4aRllJ/WCRl35QkRnOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J+oo8UYqw4yz+59n0gnzk7rC2HCWZuxyCs25AV5+UEA=;
 b=rzTCtPylAQGB2Xn8jqCKgw8UXjCdyu2vMf5Igbhi6HAM0Lx41Z6Ias0eCSQzjB47v1x43+posgvtb0CFDMqNk4soIoKOSo/hqONjKyBKV+6YvlkBJ1VZUUf9AMi+VqL5W2toKTTgjagvbqCGGnjPr91vBbb0poH40gQCU7OAEETY4/m0BwjMVhfs1bmRR7iBTi4gWxkYn2rSXIaCT5GXoxbIYlRXL8LY44qzEflHi+xhzLHfov8JC1L5ZnSP21VeyTgHSJhtflVhVYb/gMg9oedmaEbsbLH17IeHotjb2nQf1QcpA6Yb8KsVo97PuTrgs2opM3312qSF7+ClDamSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J+oo8UYqw4yz+59n0gnzk7rC2HCWZuxyCs25AV5+UEA=;
 b=KRqjDy7MZWVyWV9UhXvouWceCMb+cJN5TR+4yW1Wz2M30taxMdAd2nFel6dDWe5w5k473wuGmWQ9h532Tgn01fHoquhXVrsnJoFbnjaa5wZSAObpRmeHddUgWePOoNICh9nxJ/aiWjpu4EtdRgBFfUGo4h/DhUFtngN4T/5sgw5KedkCDfWZsRG9ZXWr7pG+R7b9pVLb1sPrQPsYkhW6bVHxgeQcdAPg/WNdnGUNbSuUo/nLxvEMRicI0+TT2cLQDXQ1ZFpkyr16SyAju5jH04/Irlr5ykT+OsCg3CaP/guoSnZD5Zkwpo+BMsHTTBlnshFfNGYWX1/6c2htZwg4EA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PASP264MB5252.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:43f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Tue, 13 May
 2025 08:36:20 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:36:20 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 0/5] media: Add Gen 3 IP stateful decoder driver
Date: Tue, 13 May 2025 10:35:45 +0200
Message-Id: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0013.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2d3::18) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PASP264MB5252:EE_
X-MS-Office365-Filtering-Correlation-Id: 998747d4-fcb0-4beb-9b85-08dd91f93b1d
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Fjh4c7JTRjMqgVqEtXhrapELwFVCpX30iM56BWQStgK1qcetpyq3heQkdkvg?=
 =?us-ascii?Q?rX2eqTpJZaN7Rq793NqD60TvjcqVjWS2NxoGszwxTxv3BbIKluL1W3Umkuvy?=
 =?us-ascii?Q?Lb6duMl/nEUN292fbuWhE/Al+t7lq6zGzFA9+EAV43XJnvGEIJySmX+DJsHF?=
 =?us-ascii?Q?bnVfkRfBEG0f+Y8hSx7LV5/nQlp4s5aslu1RuBvLkrVabFSmMlOuAHVHvaWC?=
 =?us-ascii?Q?4ehvaFB9iIjRnfw2KR5YT8se2TelJ5diDUCJ3TtkJG6xDxXEraIcJZxDNg0D?=
 =?us-ascii?Q?1PltKEsqONMoI+mQwCVC5G4nA+dr40MYKyakxRmSg6HCurVI24C5GdDnL2nS?=
 =?us-ascii?Q?hpADgThK4yK8Tr3BbBY1UhqNw0y87DErvWBSqPXQDwANjhZ2V8WLOMFj58Hl?=
 =?us-ascii?Q?pA7+pCdA7ryNTWs6TV3iJlZfxa5xnxcGNLYJNjVI3L8Np55r20qkWnm0aZVt?=
 =?us-ascii?Q?jzrwQ4LawuPfh6md94JtIdBY2duGy6W59ZE48rIZi3qrFjrLOgO53bbv/tqK?=
 =?us-ascii?Q?c+lcDtux9K22ng9w3iIzLvEkRW/srPfvay8QPBhMMqZB8sCjlCnE6Nug4Ef6?=
 =?us-ascii?Q?jAKzHFrD5lATwF/3bMvXaQQtzKB9bmaWPjvD9+oHOGO3mfSj8JRCPdLWGPzV?=
 =?us-ascii?Q?GuI4BdAt/HiG8IU5epD/mV8f1BnH9nZVXa6OpWkHdPL2F0S6R+fPA7HJWidH?=
 =?us-ascii?Q?vFrf/xzplX+gdCnk95Aieswtv0m2uo7vAnZfaAutvz7GiTsfIy6SmS69FvYI?=
 =?us-ascii?Q?gTtuYnWhrZsz3OOD7mautmzPXLygRTLSx2QN8EC4/U6/sKM8p4Pf5Mp0LMc9?=
 =?us-ascii?Q?GVfh1rqEr3XSZDkNROtFiXhhJBd65Fs25MN6Qs7rODqz1yECALvIplmemeuf?=
 =?us-ascii?Q?zOV9WryMHpUtBN85t6EnF1iPfPNpUzyNDpEworiBptDp+K759c7WKa5Xz/gN?=
 =?us-ascii?Q?8tvIyHcwIXUeJ4++7EZVtl9YN+MD+DC24pPmD3v7W6hdvJQLRU7YOO3fMmP/?=
 =?us-ascii?Q?b8swF6TIruzky3jbuPURfSHVfgzuD8xGBjUtyICGU4G2wPyzuDkJDzoDrUbw?=
 =?us-ascii?Q?l1cjuZYPaKH2wvh8/ZcLMf65tQn73JvAl0wpZZK8LTOfNCIV9pOxixWFfL4d?=
 =?us-ascii?Q?loF259XxiQnXlEfXw9hjwJqhj5sjIEocPY43KJ18/WR3Nukd7b6tFMi4U6lZ?=
 =?us-ascii?Q?xBB9Fi3gDb4aZGke21co+j6Lm9JuKzycUDQSQ7fkt30dMexK6HVC/lbrIF2B?=
 =?us-ascii?Q?BdQjI+d1a7mED6ZAUP7C1ef4oTEmyEKvfo/d8IoR/O/Fa8bRt1sSVSOWfjAJ?=
 =?us-ascii?Q?dwNOo6VamIXDsHFJYIpiUijllTAyLUavIZ4d4ARjN1FdX+dtWpKgUi6vUgzy?=
 =?us-ascii?Q?euSiQfCTGULeDtH5huUMj6QY1o/QiEUIFZvSMc91n7Y+hirLKv4C18WNEpvg?=
 =?us-ascii?Q?iWWbMRe+K6tPfuuv67rk2ZUq3KXRUxcwyfSKk63QQTXW/XFtEqgLdw=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?l8/1/7R27IsFqKGX0kp+iZzD/0M5fPsD5QJTDHUwm0ghYC91oi/0yD8UFviR?=
 =?us-ascii?Q?IeLvYDinFIBTgvb+rTAgRyyEgKu2t6gSTX2C83Ad3BqeLqf9EA8bFhO97Yah?=
 =?us-ascii?Q?+tanHaRAvufenrlmhgMHBjN0DeM5YNTuUBRBRRm1DxUkPKQGDd21fhaZkmXf?=
 =?us-ascii?Q?rWn6qdTZzGrpKfslGIbgnv8AbZpr19t/pqA14s6Y4UecAMEZ0eZ983dY6CP5?=
 =?us-ascii?Q?wyD+8PH8TuB6x+jHZfEIU6aZx5Ly/76LqXm6bhW30Th6+F8PEavoiylDoPYa?=
 =?us-ascii?Q?w4HF5t8zvuv6QmDjQDqxXhxbRnqMsI4tKgxqda6LiZ2akmQyq+wsgu/dJs0v?=
 =?us-ascii?Q?mMwKdmMFQzILB7IouEQQOM/lgWNInTD7mUIvOH5/9piZBCkFLq6etNWiJAC1?=
 =?us-ascii?Q?zo8ilX6cNeu71Hp2irT80i0zIZ/bdwTaEnSQP/ia/iTl45DESYuv3Xrvf+Vw?=
 =?us-ascii?Q?Vwu1VybJUJYxpDKRPRu5pFEDewwbqpnD6YOr416D38xa1JLsLXlAnt3EPBBl?=
 =?us-ascii?Q?WWkhCPiBg6aYINsgWkN5KkBJUGUD1K9o4sH/E2qfUmCULMztEfmeqQ56b21H?=
 =?us-ascii?Q?oGkXt3zzW3BHIPYvhyz6DC7eqts+op1OXX6wsi4V3LxUkjcgxYp5Hu7RXUa/?=
 =?us-ascii?Q?Q97L2vwOkCWFClrt4jUGwi0mvW1jdL3WCHlak2Gg0jwgMQiHy1W6ggysm8DU?=
 =?us-ascii?Q?UOaF1h3saXroTSb9YrOhuIxXzQVutEHnlM6IMou4YGQ9iifJgEa883Ylm/Zv?=
 =?us-ascii?Q?SFJ6c33vLKwkYgxpzrzmkxxOEg7Tld8HJ3jLm5QbmrK/znKlxAsmoVP4/zmu?=
 =?us-ascii?Q?x3hD9UejzTMe+Nt1slRH0dmehiiBGHV0UUYEN8FH7wGYQcAcgmXd/SNzvBps?=
 =?us-ascii?Q?a9+JTUZ8rY/ytrXLsj/m5kh1rZx3w2HPIiSYfiQi85fgA1/pQQ3KpgP2DPQE?=
 =?us-ascii?Q?pGuEVZqxcL99lggszX4p5x9OAfSQnax4Olnorp6UmXfu4xpP+YQJ9MkeT4M4?=
 =?us-ascii?Q?rS0qn76ZLuhwxPU+cN1u88MuT7uFt/eULozupNpVbprX+MSpyHHFc6sRsnLh?=
 =?us-ascii?Q?OPah7x1ZoOPuU/t29SSMpRt9PedvgyAUMM8V5QUY+2FDaqL70c4kyvEo/YlR?=
 =?us-ascii?Q?vG3EePHm3am8U6tzps4Ubh1kxgkWPKZo+t41+OU1MhDgen969h/mKaDETijn?=
 =?us-ascii?Q?91xKkjzVeEMT4+uCHegLZ/Wg9ueoYcnbMg52om44zsqCxS36TzgL8ibTASfo?=
 =?us-ascii?Q?569aZkxk6xtCdqc1bbQTLYijs5LAKvRZXnitPCbmZ1B0KnJYQLNlzGQvdRur?=
 =?us-ascii?Q?Zz6cvYFE8KRYD45Z8brvDTF580Sy4sryTRA0P1avSbPU2RgaCDJaAC3g9q0z?=
 =?us-ascii?Q?s1wjcBfBMQms8vMeqSuXIgFiSe/4c6/3J/pur5Sr1ipb91Mqvnr5jxuhQsE6?=
 =?us-ascii?Q?RJcZjYQDl0ch4Hh1aE8U3buIRUFfFwLrO6ZigkOZqMrV5L1ScXNf5a5Lh/Ip?=
 =?us-ascii?Q?zeNOpyItij+HVH/UdxzolVuS2WN/OvTdGSTRxKmKac1sW2ouy5ddl0e+c6iS?=
 =?us-ascii?Q?F3Tz1plPEt3LFCGV49e54DEWSJ/krGYtJyBuFvdl7NbGD6b2+fuScPAe1wx/?=
 =?us-ascii?Q?wA=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 998747d4-fcb0-4beb-9b85-08dd91f93b1d
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 08:36:20.0979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYSw8MgjPLXaNLGwd514kXmSGI8jWiO/10jMTnhA109YB+8Mb6ACOkPUYoKddmKuK2zqKUBkzu7AfNXhcrdW9FBMDJgYJNCFP/8uT/a2LkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB5252

# V4L2 Video Decoder Driver System Description

** Hardware Architecture **

The system implements a heterogeneous computing architecture with two primary components:

- **Host Subsystem**: Linux-based CPU running the V4L2 framework and associated drivers
- **IP Subsystem**: Dedicated hardware containing an MCU and a hardware video CODEC

The communication between the two subsystems uses a shared DDR shared memory with bidirectional interrupt mechanism for synchronization.

The architecture is represented in the following diagram:

```
+---------------------+                  +----------------------+
|       Host          |                  |        IP            |
|                     |                  |                      |
|  +---------------+  |                  |  +----------------+  |
|  |               |  |   DDR Shared     |  |                |  |
|  | Linux Kernel  |<-|----------------->|->|     MCU        |  |
|  | (CPU)         |  |    Memory        |  |                |  |
|  |   +--------+  |  |                  |  +----------------+  |
|  |   |        |  |  |    IRQ when      |           ^          |
|  |   | V4L2   |  |<-|----new message-->|           |          |
|  |   | Drivers|  |  |                  |           |          |
|  |   |        |  |  |                  |           | APB      |
|  |   +--------+  |  |                  |           |          |
|  |               |  |                  |           v          |
|  +---------------+  |                  |  +----------------+  |
|                     |                  |  |                |  |
|                     |                  |  |     CODEC      |  |
|                     |                  |  |                |  |
|                     |                  |  |                |  |
+---------------------+                  +----------------------+
```

** Communication Protocol **

-- Current Implementation - Custom Mailbox --

The host CPU and MCU currently communicate through a custom mailbox protocol implemented over shared memory. The protocol operates as follows:

1. When the host has a new message for the MCU:
   - The host writes data to a dedicated shared memory region
   - The host triggers an interrupt to the MCU
   - The MCU reads the shared memory to obtain the message type and data

2. Similarly, when the MCU has a message for the host:
   - The MCU writes to the shared memory
   - The MCU triggers an interrupt to the host
   - The host reads the shared memory to process the message

-- Migration to RPMSG --

The custom mailbox implementation will be replaced by the standard Linux RPMSG framework.

** Driver Implementation **

This driver implements a V4L2-compliant stateful video decoder with the following characteristics:

-- Technical Specifications --

- **Codec Support**: AVC (H.264), HEVC (H.265), and JPEG
- **Resolution Support**: Up to 4K
- **Pixel Formats**:
  - Currently supported: V4L2_PIX_FMT_NV12, V4L2_PIX_FMT_NV16, V4L2_PIX_FMT_P010
  - Additional formats planned for future releases
- **Buffer Configuration**: Currently supports semi-planar format only; multiplanar support forthcoming

-- Initialization Sequence --

During probe, the driver performs the following operations:

1. Allocates memory for the MCU firmware
2. Loads the firmware into the allocated memory
3. Initializes the MCU by configuring internal registers (e.g BOOT_ADDR)
4. Establishes the shared memory communication interface (to be replaced by RPMSG)
5. Sets up interrupt handlers for MCU communication

-- Processing Model --

The driver implements a stateful decoding model with the following workflow:

-- Stream Initialization --

1. Upon `VIDIOC_STREAMON` on the OUTPUT queue:
   - The driver sends a context creation request to the MCU
   - This operation is blocking; the driver waits until the MCU responds with a context handler
   - The context handler is stored in a driver-maintained list for subsequent operations
   - Each context has its own unique handler to support multiple simultaneous streams

2. Initial stream analysis:
   - The driver submits the first compressed buffer (OUTPUT queue)
   - The MCU analyzes the stream and reports capability via:
     - `resolution_found_event`: Stream is supported, includes stream parameters
     - `error_event`: Stream format is unsupported or invalid

-- Decoding Pipeline --

1. After successful stream initialization and receiving the resolution_found_evt:
   - The driver can begin normal decoding operations
   - V4L2 framework can be informed of format requirements

2. For each compressed buffer (OUTPUT queue):
   - The driver submits buffer to MCU with the appropriate context handler
   - The MCU processes the buffer and sends `release_bitstream_evt` when complete
   - This event signals that the input buffer can be returned to the application

3. For each decoded buffer (CAPTURE queue):
   - The MCU fills the buffer with decoded frame data
   - The MCU sends `frame_buffer_decode_evt` with important metadata including:
     - Original source buffer timestamp
     - Flags
     - Timecode
     - Actual payload size (bytes used in the decoded frame)
   - This enables the driver to properly queue the filled buffer to the application

4. End-of-stream handling:
   - The MCU sends an event with `eos_evt` when reaching the end of stream
   - This allows proper handling of end-of-stream conditions

-- Multi-stream Support --

The driver architecture supports multiple simultaneous decoding contexts with the following characteristics:

1. Each context maintains separate state information
2. The driver manages multiple context handlers returned by the MCU
3. Buffer submissions include the appropriate context handler for routing
4. The system can decode multiple independent streams concurrently

-- Stream Termination --

When `VIDIOC_STREAMOFF` is called:

1. The driver sends a flush command to the MCU for the specific context
2. The driver issues a non-blocking destroy context message
3. All associated resources are released
4. The context handler is removed from the driver's context list

** Error Handling **

The driver implements comprehensive error handling including:

1. Firmware loading failures
2. MCU initialization errors
3. Context creation failures
4. Unsupported stream formats
5. Decoding errors reported by the MCU
6. Timeout handling for unresponsive hardware

** Memory Management **

The system uses the following memory management strategy:

1. Firmware memory is allocated during probe
2. Buffer memory is managed through the V4L2 buffer management interfaces
3. DMA-capable memory is used for buffer transfers between host and MCU
4. The driver properly synchronizes memory access to avoid coherency issues

** Future Enhancements **

Planned future enhancements include:

1. Migration from custom mailbox to RPMSG (in progress)
2. Support for additional pixel formats
3. Implementation of multiplanar buffer support

This comprehensive architecture enables efficient hardware-accelerated video decoding while adhering to standard V4L2 interfaces, making it suitable for upstream inclusion in the Linux kernel.

** Decoder Compliance Testing **

-- AVC and HEVC Fluster Report --

This section contains the compliance test results from Fluster framework for both AVC and HEVC decoders.
The reports validate the decoder's conformance to relevant standards and demonstrate compatibility with a wide range of video streams.

[FLUSTER REPORT FOR THE H.264]
 -- JVT-AVC_V1

| Test                     | FFmpeg-H.264-v4l2m2m |
| ------------------------ | -------------------- |
| TOTAL                    | 79/135               |
| TOTAL TIME               | 439.031s             |
| -                        | -                    |
| AUD_MW_E                 | OK                   |
| BA1_FT_C                 | OK                   |
| BA1_Sony_D               | OK                   |
| BA2_Sony_F               | OK                   |
| BA3_SVA_C                | OK                   |
| BA_MW_D                  | OK                   |
| BAMQ1_JVC_C              | OK                   |
| BAMQ2_JVC_C              | OK                   |
| BANM_MW_D                | OK                   |
| BASQP1_Sony_C            | OK                   |
| CABA1_Sony_D             | OK                   |
| CABA1_SVA_B              | OK                   |
| CABA2_Sony_E             | OK                   |
| CABA2_SVA_B              | OK                   |
| CABA3_Sony_C             | OK                   |
| CABA3_SVA_B              | OK                   |
| CABA3_TOSHIBA_E          | OK                   |
| cabac_mot_fld0_full      | ER                   |
| cabac_mot_frm0_full      | OK                   |
| cabac_mot_mbaff0_full    | ER                   |
| cabac_mot_picaff0_full   | KO                   |
| CABACI3_Sony_B           | OK                   |
| CABAST3_Sony_E           | OK                   |
| CABASTBR3_Sony_B         | OK                   |
| CABREF3_Sand_D           | ER                   |
| CACQP3_Sony_D            | OK                   |
| CAFI1_SVA_C              | ER                   |
| CAMA1_Sony_C             | ER                   |
| CAMA1_TOSHIBA_B          | ER                   |
| cama1_vtc_c              | ER                   |
| cama2_vtc_b              | ER                   |
| CAMA3_Sand_E             | ER                   |
| cama3_vtc_b              | ER                   |
| CAMACI3_Sony_C           | ER                   |
| CAMANL1_TOSHIBA_B        | ER                   |
| CAMANL2_TOSHIBA_B        | ER                   |
| CAMANL3_Sand_E           | ER                   |
| CAMASL3_Sony_B           | ER                   |
| CAMP_MOT_MBAFF_L30       | ER                   |
| CAMP_MOT_MBAFF_L31       | ER                   |
| CANL1_Sony_E             | OK                   |
| CANL1_SVA_B              | OK                   |
| CANL1_TOSHIBA_G          | OK                   |
| CANL2_Sony_E             | OK                   |
| CANL2_SVA_B              | OK                   |
| CANL3_Sony_C             | OK                   |
| CANL3_SVA_B              | OK                   |
| CANL4_SVA_B              | OK                   |
| CANLMA2_Sony_C           | ER                   |
| CANLMA3_Sony_C           | ER                   |
| CAPA1_TOSHIBA_B          | ER                   |
| CAPAMA3_Sand_F           | ER                   |
| CAPCM1_Sand_E            | OK                   |
| CAPCMNL1_Sand_E          | OK                   |
| CAPM3_Sony_D             | OK                   |
| CAQP1_Sony_B             | OK                   |
| cavlc_mot_fld0_full_B    | ER                   |
| cavlc_mot_frm0_full_B    | OK                   |
| cavlc_mot_mbaff0_full_B  | ER                   |
| cavlc_mot_picaff0_full_B | KO                   |
| CAWP1_TOSHIBA_E          | OK                   |
| CAWP5_TOSHIBA_E          | OK                   |
| CI1_FT_B                 | OK                   |
| CI_MW_D                  | OK                   |
| CVBS3_Sony_C             | OK                   |
| CVCANLMA2_Sony_C         | ER                   |
| CVFC1_Sony_C             | OK                   |
| CVFI1_Sony_D             | ER                   |
| CVFI1_SVA_C              | ER                   |
| CVFI2_Sony_H             | ER                   |
| CVFI2_SVA_C              | ER                   |
| CVMA1_Sony_D             | ER                   |
| CVMA1_TOSHIBA_B          | ER                   |
| CVMANL1_TOSHIBA_B        | ER                   |
| CVMANL2_TOSHIBA_B        | ER                   |
| CVMAPAQP3_Sony_E         | ER                   |
| CVMAQP2_Sony_G           | ER                   |
| CVMAQP3_Sony_D           | ER                   |
| CVMP_MOT_FLD_L30_B       | ER                   |
| CVMP_MOT_FRM_L31_B       | ER                   |
| CVNLFI1_Sony_C           | ER                   |
| CVNLFI2_Sony_H           | ER                   |
| CVPA1_TOSHIBA_B          | ER                   |
| CVPCMNL1_SVA_C           | OK                   |
| CVPCMNL2_SVA_C           | OK                   |
| CVSE2_Sony_B             | OK                   |
| CVSE3_Sony_H             | OK                   |
| CVSEFDFT3_Sony_E         | OK                   |
| CVWP1_TOSHIBA_E          | OK                   |
| CVWP2_TOSHIBA_E          | OK                   |
| CVWP3_TOSHIBA_E          | OK                   |
| CVWP5_TOSHIBA_E          | OK                   |
| FI1_Sony_E               | ER                   |
| FM1_BT_B                 | ER                   |
| FM1_FT_E                 | KO                   |
| FM2_SVA_C                | ER                   |
| HCBP1_HHI_A              | OK                   |
| HCBP2_HHI_A              | OK                   |
| HCMP1_HHI_A              | OK                   |
| LS_SVA_D                 | OK                   |
| MIDR_MW_D                | OK                   |
| MPS_MW_A                 | OK                   |
| MR1_BT_A                 | OK                   |
| MR1_MW_A                 | OK                   |
| MR2_MW_A                 | OK                   |
| MR2_TANDBERG_E           | OK                   |
| MR3_TANDBERG_B           | OK                   |
| MR4_TANDBERG_C           | OK                   |
| MR5_TANDBERG_C           | OK                   |
| MR6_BT_B                 | ER                   |
| MR7_BT_B                 | OK                   |
| MR8_BT_B                 | ER                   |
| MR9_BT_B                 | ER                   |
| MV1_BRCM_D               | OK                   |
| NL1_Sony_D               | OK                   |
| NL2_Sony_H               | OK                   |
| NL3_SVA_E                | OK                   |
| NLMQ1_JVC_C              | OK                   |
| NLMQ2_JVC_C              | OK                   |
| NRF_MW_E                 | OK                   |
| Sharp_MP_Field_1_B       | ER                   |
| Sharp_MP_Field_2_B       | ER                   |
| Sharp_MP_Field_3_B       | ER                   |
| Sharp_MP_PAFF_1r2        | ER                   |
| Sharp_MP_PAFF_2r         | ER                   |
| SL1_SVA_B                | OK                   |
| SP1_BT_A                 | ER                   |
| sp2_bt_b                 | ER                   |
| SVA_BA1_B                | OK                   |
| SVA_BA2_D                | OK                   |
| SVA_Base_B               | OK                   |
| SVA_CL1_E                | OK                   |
| SVA_FM1_E                | OK                   |
| SVA_NL1_B                | OK                   |
| SVA_NL2_E                | OK                   |
| -                        | -                    |
| Test                     | FFmpeg-H.264-v4l2m2m |
| TOTAL                    | 79/135               |
| TOTAL TIME               | 439.031s             |

NOTE: The ER (ERROR) streams are not supported by the decoder.
      The driver print error message "Unsupported stream"

- JVT-FR-EXT

| Test                | FFmpeg-H.264-v4l2m2m |
| ------------------- | -------------------- |
| TOTAL               | 23/69                |
| TOTAL TIME          | 182.362s             |
| -                   | -                    |
| alphaconformanceG   | OK                   |
| brcm_freh10         | ER                   |
| brcm_freh11         | ER                   |
| brcm_freh3          | OK                   |
| brcm_freh4          | ER                   |
| brcm_freh5          | ER                   |
| brcm_freh6          | ER                   |
| brcm_freh8          | OK                   |
| brcm_freh9          | OK                   |
| FREH10-1            | ER                   |
| FREH10-2            | ER                   |
| freh12_b            | OK                   |
| freh1_b             | OK                   |
| freh2_b             | OK                   |
| freh7_b             | ER                   |
| FREXT01_JVC_D       | ER                   |
| FREXT02_JVC_C       | ER                   |
| FRExt1_Panasonic_D  | OK                   |
| FREXT1_TANDBERG_A   | ER                   |
| FRExt2_Panasonic_C  | ER                   |
| FREXT2_TANDBERG_A   | ER                   |
| FRExt3_Panasonic_E  | OK                   |
| FREXT3_TANDBERG_A   | ER                   |
| FRExt4_Panasonic_B  | ER                   |
| FRExt_MMCO4_Sony_B  | OK                   |
| HCAFF1_HHI_B        | ER                   |
| HCAFR1_HHI_C        | OK                   |
| HCAFR2_HHI_A        | OK                   |
| HCAFR3_HHI_A        | OK                   |
| HCAFR4_HHI_A        | OK                   |
| HCAMFF1_HHI_B       | ER                   |
| HCHP1_HHI_B         | OK                   |
| HCHP2_HHI_A         | OK                   |
| HCHP3_HHI_A         | ER                   |
| Hi422FR10_SONY_A    | ER                   |
| Hi422FR11_SONY_A    | ER                   |
| Hi422FR12_SONY_A    | ER                   |
| Hi422FR13_SONY_A    | ER                   |
| Hi422FR14_SONY_A    | ER                   |
| Hi422FR15_SONY_A    | ER                   |
| Hi422FR1_SONY_A     | ER                   |
| Hi422FR2_SONY_A     | ER                   |
| Hi422FR3_SONY_A     | ER                   |
| Hi422FR4_SONY_A     | ER                   |
| Hi422FR6_SONY_A     | ER                   |
| Hi422FR7_SONY_A     | ER                   |
| Hi422FR8_SONY_A     | ER                   |
| Hi422FR9_SONY_A     | ER                   |
| Hi422FREXT16_SONY_A | ER                   |
| Hi422FREXT17_SONY_A | ER                   |
| Hi422FREXT18_SONY_A | ER                   |
| Hi422FREXT19_SONY_A | ER                   |
| HPCA_BRCM_C         | OK                   |
| HPCADQ_BRCM_B       | OK                   |
| HPCAFL_BRCM_C       | ER                   |
| HPCAFLNL_BRCM_C     | ER                   |
| HPCALQ_BRCM_B       | OK                   |
| HPCAMAPALQ_BRCM_B   | ER                   |
| HPCAMOLQ_BRCM_B     | ER                   |
| HPCANL_BRCM_C       | OK                   |
| HPCAQ2LQ_BRCM_B     | OK                   |
| HPCV_BRCM_A         | OK                   |
| HPCVFL_BRCM_A       | ER                   |
| HPCVFLNL_BRCM_A     | ER                   |
| HPCVMOLQ_BRCM_B     | ER                   |
| HPCVNL_BRCM_A       | OK                   |
| HVLCFI0_Sony_B      | ER                   |
| HVLCMFF0_Sony_B     | ER                   |
| HVLCPFF0_Sony_B     | ER                   |
| -                   | -                    |
| Test                | FFmpeg-H.264-v4l2m2m |
| TOTAL               | 23/69                |
| TOTAL TIME          | 182.362s             |

NOTE: The ER (ERROR) streams are not supported by the decoder.
      The driver print error message "Unsupported stream"

- JVT-MVC

| Test       | FFmpeg-H.264-v4l2m2m |
| ---------- | -------------------- |
| TOTAL      | 18/20                |
| TOTAL TIME | 147.076s             |
| -          | -                    |
| MVCDS-4    | OK                   |
| MVCDS-5    | OK                   |
| MVCDS-6    | OK                   |
| MVCDS1     | OK                   |
| MVCDS2     | OK                   |
| MVCDS3     | OK                   |
| MVCICT-1   | ER                   |
| MVCICT-2   | ER                   |
| MVCNV-2    | OK                   |
| MVCNV-3    | OK                   |
| MVCNV1     | OK                   |
| MVCNV4     | OK                   |
| MVCRP_1    | OK                   |
| MVCRP_2    | OK                   |
| MVCRP_3    | OK                   |
| MVCRP_4    | OK                   |
| MVCRP_5    | OK                   |
| MVCRP_6    | OK                   |
| MVCSPS-1   | OK                   |
| MVCSPS-2   | OK                   |
| -          | -                    |
| Test       | FFmpeg-H.264-v4l2m2m |
| TOTAL      | 18/20                |
| TOTAL TIME | 147.076s             |

- JVT-SVC


| Test            | FFmpeg-H.264-v4l2m2m |
| --------------- | -------------------- |
| TOTAL           | 75/185               |
| TOTAL TIME      | 727.240s             |
| -               | -                    |
| SVCBC-1-L0      | OK                   |
| SVCBC-1-L1      | KO                   |
| SVCBCT-1-L0     | OK                   |
| SVCBCT-1-L1     | KO                   |
| SVCBCTS-1-r1-L0 | OK                   |
| SVCBCTS-1-r1-L1 | KO                   |
| SVCBCTS-1-r1-L2 | KO                   |
| SVCBCTS-2-r1-L0 | OK                   |
| SVCBCTS-2-r1-L1 | KO                   |
| SVCBCTS-2-r1-L2 | KO                   |
| SVCBCTS-3-L0    | OK                   |
| SVCBCTS-3-L1    | KO                   |
| SVCBCTS-3-L2    | KO                   |
| SVCBM-1-L0      | OK                   |
| SVCBM-1-L1      | KO                   |
| SVCBM-2-L0      | OK                   |
| SVCBM-2-L1      | KO                   |
| SVCBM-3-L0      | OK                   |
| SVCBM-3-L1      | KO                   |
| SVCBM-4-r1-L0   | OK                   |
| SVCBM-4-r1-L1   | KO                   |
| SVCBM-4-r1-L2   | KO                   |
| SVCBM-5-L0      | OK                   |
| SVCBM-5-L1      | KO                   |
| SVCBM-5-L2      | KO                   |
| SVCBM-5-L3      | KO                   |
| SVCBMST-1-L0    | OK                   |
| SVCBMST-1-L1    | KO                   |
| SVCBMST-1-L2    | KO                   |
| SVCBMST-2-L0    | OK                   |
| SVCBMST-2-L1    | KO                   |
| SVCBMST-2-L2    | KO                   |
| SVCBMST-3-L0    | OK                   |
| SVCBMST-3-L1    | KO                   |
| SVCBMST-3-L2    | KO                   |
| SVCBMT-1-L0     | OK                   |
| SVCBMT-1-L1     | KO                   |
| SVCBMT-10-L0    | OK                   |
| SVCBMT-10-L1    | KO                   |
| SVCBMT-11-L0    | OK                   |
| SVCBMT-11-L1    | KO                   |
| SVCBMT-12-L0    | OK                   |
| SVCBMT-12-L1    | KO                   |
| SVCBMT-13-L0    | OK                   |
| SVCBMT-13-L1    | KO                   |
| SVCBMT-13-L2    | KO                   |
| SVCBMT-2-L0     | OK                   |
| SVCBMT-2-L1     | KO                   |
| SVCBMT-3-L0     | OK                   |
| SVCBMT-3-L1     | KO                   |
| SVCBMT-4-L0     | OK                   |
| SVCBMT-4-L1     | KO                   |
| SVCBMT-5-L0     | OK                   |
| SVCBMT-5-L1     | KO                   |
| SVCBMT-6-L0     | OK                   |
| SVCBMT-6-L1     | KO                   |
| SVCBMT-7-L0     | OK                   |
| SVCBMT-7-L1     | KO                   |
| SVCBMT-8-L0     | OK                   |
| SVCBMT-8-L1     | KO                   |
| SVCBMT-9-L0     | OK                   |
| SVCBMT-9-L1     | KO                   |
| SVCBS-1-L0      | OK                   |
| SVCBS-1-L1      | KO                   |
| SVCBS-2-L0      | OK                   |
| SVCBS-2-L1      | KO                   |
| SVCBS-3-r1-L0   | OK                   |
| SVCBS-3-r1-L1   | KO                   |
| SVCBS-4-r1-L0   | OK                   |
| SVCBS-4-r1-L1   | KO                   |
| SVCBS-5-r1-L0   | OK                   |
| SVCBS-5-r1-L1   | KO                   |
| SVCBS-6-r1-L0   | OK                   |
| SVCBS-6-r1-L1   | KO                   |
| SVCBS-6-r1-L2   | KO                   |
| SVCBS-7-L0      | OK                   |
| SVCBS-7-L1      | KO                   |
| SVCBS-8-L0      | OK                   |
| SVCBS-8-L1      | KO                   |
| SVCBST-1-L0     | OK                   |
| SVCBST-1-L1     | KO                   |
| SVCBST-10-r1-L0 | OK                   |
| SVCBST-10-r1-L1 | KO                   |
| SVCBST-11-r1-L0 | OK                   |
| SVCBST-11-r1-L1 | KO                   |
| SVCBST-12-r1-L0 | OK                   |
| SVCBST-12-r1-L1 | KO                   |
| SVCBST-13-L0    | OK                   |
| SVCBST-13-L1    | KO                   |
| SVCBST-14-L0    | OK                   |
| SVCBST-14-L1    | KO                   |
| SVCBST-14-L2    | KO                   |
| SVCBST-15-L0    | OK                   |
| SVCBST-15-L1    | KO                   |
| SVCBST-15-L2    | KO                   |
| SVCBST-16-r1-L0 | OK                   |
| SVCBST-16-r1-L1 | KO                   |
| SVCBST-16-r1-L2 | KO                   |
| SVCBST-17-r1-L0 | OK                   |
| SVCBST-17-r1-L1 | KO                   |
| SVCBST-17-r1-L2 | KO                   |
| SVCBST-18-r1-L0 | OK                   |
| SVCBST-18-r1-L1 | KO                   |
| SVCBST-18-r1-L2 | KO                   |
| SVCBST-19-L0    | OK                   |
| SVCBST-19-L1    | KO                   |
| SVCBST-2-L0     | OK                   |
| SVCBST-2-L1     | KO                   |
| SVCBST-20-L0    | OK                   |
| SVCBST-20-L1    | KO                   |
| SVCBST-3-L0     | OK                   |
| SVCBST-3-L1     | KO                   |
| SVCBST-4-L0     | OK                   |
| SVCBST-4-L1     | KO                   |
| SVCBST-5-L0     | OK                   |
| SVCBST-5-L1     | KO                   |
| SVCBST-6-r1-L0  | OK                   |
| SVCBST-6-r1-L1  | KO                   |
| SVCBST-7-r1-L0  | OK                   |
| SVCBST-7-r1-L1  | KO                   |
| SVCBST-8-r1-L0  | OK                   |
| SVCBST-8-r1-L1  | KO                   |
| SVCBST-9-r1-L0  | OK                   |
| SVCBST-9-r1-L1  | KO                   |
| SVCBSTC-1-L0    | OK                   |
| SVCBSTC-1-L1    | KO                   |
| SVCBSTC-1-L2    | KO                   |
| SVCHCTS-1-r1-L0 | OK                   |
| SVCHCTS-1-r1-L1 | KO                   |
| SVCHCTS-1-r1-L2 | KO                   |
| SVCHCTS-1-r1-L3 | KO                   |
| SVCHCTS-1-r1-L4 | KO                   |
| SVCHCTS-1-r1-L5 | KO                   |
| SVCHCTS-1-r1-L6 | KO                   |
| SVCHCTS-1-r1-L7 | KO                   |
| SVCHICS-1-L0    | OK                   |
| SVCHICS-1-L1    | KO                   |
| SVCHICS-1-L2    | KO                   |
| SVCHICS-1-L3    | KO                   |
| SVCHIS-1-L0     | OK                   |
| SVCHIS-1-L1     | KO                   |
| SVCHIS-1-L2     | KO                   |
| SVCHIS-2-L0     | OK                   |
| SVCHIS-2-L1     | KO                   |
| SVCHIS-2-L2     | KO                   |
| SVCHIS-3-L0     | OK                   |
| SVCHIS-3-L1     | KO                   |
| SVCHIS-3-L2     | KO                   |
| SVCHM-1-L0      | OK                   |
| SVCHM-1-L1      | KO                   |
| SVCHM-1-L2      | KO                   |
| SVCHM-1-L3      | KO                   |
| SVCHM-2-L0      | OK                   |
| SVCHM-2-L1      | OK                   |
| SVCHM-3-L0      | OK                   |
| SVCHM-3-L1      | OK                   |
| SVCHM-4-L0      | OK                   |
| SVCHM-4-L1      | OK                   |
| SVCHM-4-L2      | OK                   |
| SVCHMTS-1-r1-L0 | OK                   |
| SVCHMTS-1-r1-L1 | KO                   |
| SVCHMTS-1-r1-L2 | KO                   |
| SVCHMTS-1-r1-L3 | KO                   |
| SVCHMTS-1-r1-L4 | KO                   |
| SVCHMTS-1-r1-L5 | KO                   |
| SVCHMTS-2-r1-L0 | OK                   |
| SVCHMTS-2-r1-L1 | KO                   |
| SVCHMTS-2-r1-L2 | KO                   |
| SVCHS-1-r1-L0   | OK                   |
| SVCHS-1-r1-L1   | KO                   |
| SVCHS-2-r1-L0   | OK                   |
| SVCHS-2-r1-L1   | KO                   |
| SVCHST-1-r1-L0  | OK                   |
| SVCHST-1-r1-L1  | KO                   |
| SVCHST-1-r1-L2  | KO                   |
| SVCHST-2-r1-L0  | OK                   |
| SVCHST-2-r1-L1  | KO                   |
| SVCHST-2-r1-L2  | KO                   |
| SVCHST-3-r1-L0  | ER                   |
| SVCHST-3-r1-L1  | ER                   |
| SVCHST-4-r1-L0  | ER                   |
| SVCHST-4-r1-L1  | ER                   |
| SVCHSTC-1-r1-L0 | OK                   |
| SVCHSTC-1-r1-L1 | KO                   |
| SVCHSTC-1-r1-L2 | KO                   |
| -               | -                    |
| Test            | FFmpeg-H.264-v4l2m2m |
| TOTAL           | 75/185               |
| TOTAL TIME      | 727.240s             |

NOTE: The current implementation of the decoder only supports Layer 0 (base layer) processing.
When attempting to decode streams that contain multiple layers (such as scalable or multi-view content), the decoding operation fails.
This limitation means that enhanced features requiring layer-based processing beyond the base layer cannot be properly handled by the current decoder.
For successful decoding, input streams must be limited to single-layer content only.

[FLUSTER REPORT FOR THE H.265]

| -                               | -                    |
| AMP_A_Samsung_7                 | OK                   |
| AMP_B_Samsung_7                 | OK                   |
| AMP_D_Hisilicon_3               | OK                   |
| AMP_E_Hisilicon_3               | OK                   |
| AMP_F_Hisilicon_3               | ER                   |
| AMVP_A_MTK_4                    | ER                   |
| AMVP_B_MTK_4                    | OK                   |
| AMVP_C_Samsung_7                | ER                   |
| BUMPING_A_ericsson_1            | OK                   |
| CAINIT_A_SHARP_4                | OK                   |
| CAINIT_B_SHARP_4                | OK                   |
| CAINIT_C_SHARP_3                | OK                   |
| CAINIT_D_SHARP_3                | OK                   |
| CAINIT_E_SHARP_3                | OK                   |
| CAINIT_F_SHARP_3                | OK                   |
| CAINIT_G_SHARP_3                | OK                   |
| CAINIT_H_SHARP_3                | OK                   |
| CIP_A_Panasonic_3               | OK                   |
| cip_B_NEC_3                     | OK                   |
| CIP_C_Panasonic_2               | OK                   |
| CONFWIN_A_Sony_1                | OK                   |
| DBLK_A_MAIN10_VIXS_4            | ER                   |
| DBLK_A_SONY_3                   | OK                   |
| DBLK_B_SONY_3                   | OK                   |
| DBLK_C_SONY_3                   | OK                   |
| DBLK_D_VIXS_2                   | OK                   |
| DBLK_E_VIXS_2                   | OK                   |
| DBLK_F_VIXS_2                   | OK                   |
| DBLK_G_VIXS_2                   | OK                   |
| DELTAQP_A_BRCM_4                | OK                   |
| DELTAQP_B_SONY_3                | OK                   |
| DELTAQP_C_SONY_3                | OK                   |
| DSLICE_A_HHI_5                  | OK                   |
| DSLICE_B_HHI_5                  | OK                   |
| DSLICE_C_HHI_5                  | OK                   |
| ENTP_A_QUALCOMM_1               | OK                   |
| ENTP_B_Qualcomm_1               | OK                   |
| ENTP_C_Qualcomm_1               | OK                   |
| EXT_A_ericsson_4                | OK                   |
| FILLER_A_Sony_1                 | OK                   |
| HRD_A_Fujitsu_3                 | OK                   |
| INITQP_A_Sony_1                 | OK                   |
| INITQP_B_Main10_Sony_1          | ER                   |
| ipcm_A_NEC_3                    | OK                   |
| ipcm_B_NEC_3                    | OK                   |
| ipcm_C_NEC_3                    | OK                   |
| ipcm_D_NEC_3                    | OK                   |
| ipcm_E_NEC_2                    | OK                   |
| IPRED_A_docomo_2                | OK                   |
| IPRED_B_Nokia_3                 | OK                   |
| IPRED_C_Mitsubishi_3            | OK                   |
| LS_A_Orange_2                   | OK                   |
| LS_B_Orange_4                   | OK                   |
| LTRPSPS_A_Qualcomm_1            | KO                   |
| MAXBINS_A_TI_5                  | OK                   |
| MAXBINS_B_TI_5                  | OK                   |
| MAXBINS_C_TI_5                  | OK                   |
| MERGE_A_TI_3                    | OK                   |
| MERGE_B_TI_3                    | OK                   |
| MERGE_C_TI_3                    | OK                   |
| MERGE_D_TI_3                    | OK                   |
| MERGE_E_TI_3                    | OK                   |
| MERGE_F_MTK_4                   | OK                   |
| MERGE_G_HHI_4                   | OK                   |
| MVCLIP_A_qualcomm_3             | OK                   |
| MVDL1ZERO_A_docomo_4            | OK                   |
| MVEDGE_A_qualcomm_3             | OK                   |
| NoOutPrior_A_Qualcomm_1         | OK                   |
| NoOutPrior_B_Qualcomm_1         | OK                   |
| NUT_A_ericsson_5                | OK                   |
| OPFLAG_A_Qualcomm_1             | OK                   |
| OPFLAG_B_Qualcomm_1             | OK                   |
| OPFLAG_C_Qualcomm_1             | OK                   |
| PICSIZE_A_Bossen_1              | OK                   |
| PICSIZE_B_Bossen_1              | ER                   |
| PICSIZE_C_Bossen_1              | OK                   |
| PICSIZE_D_Bossen_1              | ER                   |
| PMERGE_A_TI_3                   | OK                   |
| PMERGE_B_TI_3                   | OK                   |
| PMERGE_C_TI_3                   | OK                   |
| PMERGE_D_TI_3                   | OK                   |
| PMERGE_E_TI_3                   | OK                   |
| POC_A_Bossen_3                  | OK                   |
| PPS_A_qualcomm_7                | OK                   |
| PS_B_VIDYO_3                    | ER                   |
| RAP_A_docomo_6                  | OK                   |
| RAP_B_Bossen_2                  | OK                   |
| RPLM_A_qualcomm_4               | OK                   |
| RPLM_B_qualcomm_4               | OK                   |
| RPS_A_docomo_5                  | OK                   |
| RPS_B_qualcomm_5                | OK                   |
| RPS_C_ericsson_5                | OK                   |
| RPS_D_ericsson_6                | OK                   |
| RPS_E_qualcomm_5                | OK                   |
| RPS_F_docomo_2                  | OK                   |
| RQT_A_HHI_4                     | OK                   |
| RQT_B_HHI_4                     | OK                   |
| RQT_C_HHI_4                     | OK                   |
| RQT_D_HHI_4                     | OK                   |
| RQT_E_HHI_4                     | OK                   |
| RQT_F_HHI_4                     | OK                   |
| RQT_G_HHI_4                     | OK                   |
| SAO_A_MediaTek_4                | OK                   |
| SAO_B_MediaTek_5                | OK                   |
| SAO_C_Samsung_5                 | OK                   |
| SAO_D_Samsung_5                 | OK                   |
| SAO_E_Canon_4                   | OK                   |
| SAO_F_Canon_3                   | OK                   |
| SAO_G_Canon_3                   | OK                   |
| SAO_H_Parabola_1                | OK                   |
| SAODBLK_A_MainConcept_4         | OK                   |
| SAODBLK_B_MainConcept_4         | OK                   |
| SDH_A_Orange_4                  | OK                   |
| SLICES_A_Rovi_3                 | OK                   |
| SLIST_A_Sony_5                  | OK                   |
| SLIST_B_Sony_9                  | OK                   |
| SLIST_C_Sony_4                  | OK                   |
| SLIST_D_Sony_9                  | OK                   |
| SLPPLP_A_VIDYO_2                | ER                   |
| STRUCT_A_Samsung_7              | ER                   |
| STRUCT_B_Samsung_7              | ER                   |
| TILES_A_Cisco_2                 | ER                   |
| TILES_B_Cisco_1                 | ER                   |
| TMVP_A_MS_3                     | OK                   |
| TSCL_A_VIDYO_5                  | OK                   |
| TSCL_B_VIDYO_4                  | ER                   |
| TSKIP_A_MS_3                    | OK                   |
| TSUNEQBD_A_MAIN10_Technicolor_2 | ER                   |
| TUSIZE_A_Samsung_1              | OK                   |
| VPSID_A_VIDYO_2                 | ER                   |
| VPSSPSPPS_A_MainConcept_1       | KO                   |
| WP_A_MAIN10_Toshiba_3           | ER                   |
| WP_A_Toshiba_3                  | ER                   |
| WP_B_Toshiba_3                  | OK                   |
| WP_MAIN10_B_Toshiba_3           | ER                   |
| WPP_A_ericsson_MAIN10_2         | ER                   |
| WPP_A_ericsson_MAIN_2           | OK                   |
| WPP_B_ericsson_MAIN10_2         | ER                   |
| WPP_B_ericsson_MAIN_2           | OK                   |
| WPP_C_ericsson_MAIN10_2         | ER                   |
| WPP_C_ericsson_MAIN_2           | OK                   |
| WPP_D_ericsson_MAIN10_2         | ER                   |
| WPP_D_ericsson_MAIN_2           | OK                   |
| WPP_E_ericsson_MAIN10_2         | ER                   |
| WPP_E_ericsson_MAIN_2           | OK                   |
| WPP_F_ericsson_MAIN10_2         | ER                   |
| WPP_F_ericsson_MAIN_2           | OK                   |
| -                               | -                    |
| Test                            | FFmpeg-H.265-v4l2m2m |
| TOTAL                           | 120/147              |
| TOTAL TIME                      | 12669.641s           |


Failed streams :
 - VPSSPSPPS_A_MainConcept_1 : Failed due to evolutive dynamic resolution increases. The decoder cannot properly handle upward resolution changes within the same stream.
 - LTRPSPS_A_Qualcomm_1

This patch series introduces a new stateful decoder driver for the
allegrodvt GEN 3 IPs.

Yassine Ouaissa (5):
  media: allegro-dvt: Move the current driver to a subdirectory
  dt-bindings: Add vendor prefix for allegrodvt
  dt-bindings: media: allegrodvt: add decoder dt-bindings for Gen3 IP
  MAINTAINERS: Add entry for allegrodvt Gen 3 drivers
  media: allegro-dvt: Add Gen 3 IP stateful decoder driver

 .../bindings/media/allegrodvt,al300-vdec.yaml |   83 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +-
 MAINTAINERS                                   |    5 +-
 drivers/media/platform/allegro-dvt/Kconfig    |   17 +-
 drivers/media/platform/allegro-dvt/Makefile   |    6 +-
 .../media/platform/allegro-dvt/al300/Kconfig  |   12 +
 .../media/platform/allegro-dvt/al300/Makefile |    6 +
 .../allegro-dvt/al300/al_codec_common.c       |  789 +++++++++
 .../allegro-dvt/al300/al_codec_common.h       |  226 +++
 .../allegro-dvt/al300/al_codec_util.c         |  179 ++
 .../allegro-dvt/al300/al_codec_util.h         |  186 ++
 .../platform/allegro-dvt/al300/al_vdec_drv.c  | 1533 +++++++++++++++++
 .../platform/allegro-dvt/al300/al_vdec_drv.h  |   94 +
 .../media/platform/allegro-dvt/zynqmp/Kconfig |   17 +
 .../platform/allegro-dvt/zynqmp/Makefile      |    6 +
 .../allegro-dvt/{ => zynqmp}/allegro-core.c   |    0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.c   |    0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.h   |    0
 .../allegro-dvt/{ => zynqmp}/nal-h264.c       |    0
 .../allegro-dvt/{ => zynqmp}/nal-h264.h       |    0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.c       |    0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.h       |    0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.c       |    0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.h       |    0
 24 files changed, 3140 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
 create mode 100644 drivers/media/platform/allegro-dvt/al300/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/al300/Makefile
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.h
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.h
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-core.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)

-- 
2.30.2

