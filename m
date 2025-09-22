Return-Path: <linux-media+bounces-42882-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42621B8F0D3
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 07:53:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE7693B7774
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 05:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D259224A063;
	Mon, 22 Sep 2025 05:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="hqxKs3Hk"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022089.outbound.protection.outlook.com [40.107.43.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07DB23D7C5;
	Mon, 22 Sep 2025 05:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758520395; cv=fail; b=qtF5yCNzKo9vqmUfhoC2hJOaTpXM5gsmq/i0F/pqIkh9PxQj/FwzukY6D6gQgBTbxKO0ssfWf0NvOZvnqJamDzRZMNkLNwgpqgUuqh0+oyoCYwj+lBh0Zavb8hx4cHG9KdZ2FJb34r1sBPZHcIUnLQqJplNKR1EuFAJsosK/1yE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758520395; c=relaxed/simple;
	bh=hcWEnFrAwikUa8o1i6SVHEiotu5A8c9SsftWEujbNVg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ln/Nf6bTgDFvm7Et49q/ODDQULnW8F5Yg53Pbq42fuC16p4Sp5VOc52ylYOFECqUvXIinP9O9IgSDs3aMURVLeFSC8D9B3ytB9PbUojfsjwocVO30+oeMns8CJoZbaFpYdrF2L/MmFsY+FSGwt8yDcZx0dJD9SIEM11P6EeGcMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=hqxKs3Hk; arc=fail smtp.client-ip=40.107.43.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CT8IHSRTvG8qUfJRS3p6dQSewObMET7+tvicS/0v8tp6QsgUd6Wwf/y16/EJhXprXe0E4TAY5BgbtPRqiXr/yxWbYUujKhUzr1rvckXdrHUK6keT4zNV/GxZEiHYQHWCutpc9wUJYOTvnFYxznF9WMia4DMj1imlIg+D5tFTc1zzdd88RU9reiPhuQ6lM2FUULpXNJrw/qkqXmpGaTym5Ou6f8/PkrmLHDjXzFBvVGS0NvVY/lgQ7xrDDQr9DlqQSH6RksmA65QBqXRxocMDtvMMO7Mr/1jPSaNaM1zyNy1rPMU//Ca4H2+p5DnfOe5QxcVaELTqY8I2YtRlzf1vZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FRRCWxPVcpeyA431VhNF4fW/eAtIHPP1dmdtgR9CLb8=;
 b=P7whuqd3njPw+2Tz64Lk/A34PoNIylq2fc64lASrwc0VGYtCQfIcgQHzsUmvRjsVheS+pdqlR0D1dW8Kig3w4aDuv0SD5QCxhCQkZ1mOwNsmOs3DNH8vmcaswi8eHWJixBpvDXX9QPfWqxPotEns/Q075akk3gov7nk9q+GkqGjXAZKht0xvJuOyB/96b6EEcQJOjj62HCPlMXJlE/qk0onyKD2WCC6mkMFW5LI31Z9oqf7U17WFHoTps5RFPMzPVWqGQJ0V6701tctdnDqWxticiHPCLZhb//EPNQPpw5sR/iz7aHLPSB4fMGwEV2KU4NyIEcCZ9F42Ma9qPHfn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FRRCWxPVcpeyA431VhNF4fW/eAtIHPP1dmdtgR9CLb8=;
 b=hqxKs3HkZNa1w0UeD0XPi4cJcz7t52rmXmZGltW3zHDv/7SPsezTb/FH3EO5HLFGgkYZG+U/BaZ5H70BY7dxolbx1JQnnJLSSpvrNfwV6IghfBVBgozApoFey39K9gdgfXXiMkAqkKYla8Iy6LSqSV4Mipwd2MUWv9UfN/Tv4vs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM (2603:1096:301:72::14)
 by SE2P216MB3024.KORP216.PROD.OUTLOOK.COM (2603:1096:101:28b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 05:53:06 +0000
Received: from PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d]) by PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 ([fe80::689e:6dca:162:dc0d%4]) with mapi id 15.20.9137.017; Mon, 22 Sep 2025
 05:53:06 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v5 1/4] media: chips-media: wave5: Fix SError of kernel panic when closed
Date: Mon, 22 Sep 2025 14:52:52 +0900
Message-Id: <20250922055255.116-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
References: <20250922055255.116-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::23) To PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
 (2603:1096:301:72::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PU4P216MB1149:EE_|SE2P216MB3024:EE_
X-MS-Office365-Filtering-Correlation-Id: 64f7d50d-7782-4ed5-3ec4-08ddf99c4cda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GXuZ18vKD2kxTkfzkayIFdXzF24sfF71VWYBp8QseyCTRQFL347LmFg+Y458?=
 =?us-ascii?Q?jwQrxDGOK+o8PyD6aZ9rJmBIGdPaeeiAOObv8rTxeg54Tp86H9wavPuPnWNJ?=
 =?us-ascii?Q?w+cleE4NoZKTAoPDAUf5514uT8siqLuMNcFK8rfPYGuZgJpPu9El9Ohfv8aY?=
 =?us-ascii?Q?dydjoS7KK3SjzGswq907KSzTCrt3K6Z6fWyc3jlprSbcaOfWpVeIBQ6UiiwQ?=
 =?us-ascii?Q?1jEcXlXH3PDTPJmNJOPQd7UopRh1VdIs89EhONrhclQKnIU/BM6UHl2yXyvo?=
 =?us-ascii?Q?aFyPya7PqTVC9K5NQVX9xYiQnOGxXfg+T22pS6EEPME25XdyNIvRSd7EfUJQ?=
 =?us-ascii?Q?VKMxzb7oZNdZ0cEzjGa3MAJjKpLfHIpQOm6c4A1PsYyqPP+7WWe8po9M+u50?=
 =?us-ascii?Q?7ra7UyT2J95G5YHQY3iMUkk2o107QNv9U6gunG+XljlK0v9Os9sMAeNctFjY?=
 =?us-ascii?Q?EkVKA21QMMYQxlhoKcZxQmxt8brv79CFiAj/1GMTEv0iwumI2p2qzEwNUiEB?=
 =?us-ascii?Q?c9+U3Bxebzu+c1EbwHFx7FlcYNLohsFo0Fxg/pTFfEDv+qnEwAi4qhK1/yxC?=
 =?us-ascii?Q?ch8t/SRtX7nd+2VzfOIv2iGhXdSHW6DagO/Br2eb8xuRb1pVOhibCPqGrVPe?=
 =?us-ascii?Q?BCpqlcK9bltpjshlfRCBvVUiqd2udiGRMtrFXij+3MrsunKrS9wbyEIL+x7Y?=
 =?us-ascii?Q?cQhl2Hq0oAYB2ABRLQ+B0biB+e+uRwAq7Yq5a+92pJhdz6vQFDgjN15RfCRQ?=
 =?us-ascii?Q?8fZOaIRwbc3WWj53+lrXN36EHvLg1kfz2BioPTtzo6Zm3rYcoSHhPfJ5PWHh?=
 =?us-ascii?Q?VGJ1fPmI0Dwcs3C+X+iRLpIytNeIZ6jFifxz9+n2y7xuIg28bzcP7KbI1xoi?=
 =?us-ascii?Q?Pf5kJIlOQHYZRTsOdx381oTIP2cuPEGSgRDfsB9FmMYrE9QaQ6xnZLcNhfD3?=
 =?us-ascii?Q?DF6Knjx7WdzIT9MlyALs/LXLuYInjqdSbfDDCF/nEc6/crkw+2OAcc3OrLwo?=
 =?us-ascii?Q?EcZ+Fy0FDTDn7i9gVbU8nuFDpO1uDj+a+T/yVlpGbSNQcvE6SARqrGJiKBzp?=
 =?us-ascii?Q?T88Nsj8CotgIXkuzRvaNXnnQJlgt+arn/XSYxOKCF6UjAMgrJ9ww8WotKxxn?=
 =?us-ascii?Q?M9Lpcqhu0a4eD2Z4bLM2EVCEbZ1yYO0pfoqSW12ueZTpWl1cCA1E8GqV9jBL?=
 =?us-ascii?Q?OEbGoNrXhqs+DPzEs1ap1GYvd2t+8tislbqNiPQS4LKYgsPYi2wywoqB7/uo?=
 =?us-ascii?Q?SiypBnnNqDergKqTlWxd8+erLwxId4kzuzTUMdpklN/b/2PTmD4vjVkIOqRR?=
 =?us-ascii?Q?5xTxGClUa+tF2CNngysPdhqxPGBeoUkgGupTTjnnpEk16sJpwStXyN3rnlFn?=
 =?us-ascii?Q?XZic0lFEYfJBwc4fJFFUgBzjTbe9eJqMcNrXyKkkGyHU7FcvhDbbG/IccD5b?=
 =?us-ascii?Q?hlrpCmW/B89itvfdIKcP0MCBJZcKUzo3hkqyMlAMLn4DUp/rmrzidA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PU4P216MB1149.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tUIoiumfmoImfQ89tiQkYk3U4oWcP3wjULNtbXB+vVChX8LpEQuf1dqmeL4I?=
 =?us-ascii?Q?w94Wofuw5dEuKyESuGbOS35iwVob8T9YAi2nXxgomtHXuw6vE1XAtepkvQOb?=
 =?us-ascii?Q?Qt35WNIoaAdlcRrZXgBNxvSw42WVz5kq9CuLKeFBVr+M05vtZLY4ZVM5iF8r?=
 =?us-ascii?Q?f2aB91pOw3IJw7cjgWhfxTFt3IPztAZwG0pAQSXoKktfTgwXYVQ/I4IeLifA?=
 =?us-ascii?Q?aTulE9wK28fssQ6MVM43ajr62cd8wWQDaSqUkl+GFMyXcWAcfF+lm3SkKyjD?=
 =?us-ascii?Q?5/zqJ8Vuyd+8dRE9xPbncaF/3agqWoOVLsf5PsNWsEdIvz9sE4FV50mioQJx?=
 =?us-ascii?Q?pntsN2fZyNguhsf1zUjLZIIMtCzpCLy5P0euCWl/5KLmNHGtBAbnZomtwHND?=
 =?us-ascii?Q?K2+7ktnnKPDkeauEUcxu5nlSR84QWisbwUlSSAK+fvfKV9GIn+9tYvU2SUAe?=
 =?us-ascii?Q?DM1jYTfYPyUSLa0kyuiPGyvqYiRMpiwZTooJOHnFSIqfykgXkl5R8oIF1vSZ?=
 =?us-ascii?Q?SMvHCN5KosTumiZnYvM+gXO/ftlaOBl99U1cVd767somk9WnZepyiai2K46j?=
 =?us-ascii?Q?dUcgCULb/QpUzhyElmzBh+rfwwcJYiTn0IvylXWYDkLF2dQhxRja2LzSz63C?=
 =?us-ascii?Q?2PeHmmFQ7n2yDmfMUoa9fmPYFpweUrJE+MV+ZgvZY8DVAI7F019az8G+WZKW?=
 =?us-ascii?Q?6cEGGiO3tR/HSFz3Cskmr3w1iL0YZowvmFgPnwnqYI9Sskc+EZWifmTdK4XY?=
 =?us-ascii?Q?pRZZg/eJ5H7nj8siNEchchLxAVTAKxFYWGxx6QV6qDVlVgq+NVWY/ZkSQDvY?=
 =?us-ascii?Q?8pPd034Omvpz1JVGnPUi6+3J3ozAh3BtZLhL8eXOsBCALxt71bHJ8f3nLFSx?=
 =?us-ascii?Q?+uLXwm3N/hqDRJu9scSkTUWQxsokUnNr7VC2IuPxiYfM49dU90VZcei+23JJ?=
 =?us-ascii?Q?4L0yC500Roez8CKazJFJOn3ljxF7FWiFmpfSn144hrS3toL1lI5N3zEX4umz?=
 =?us-ascii?Q?N2R70TCkg6cgIKIxtfiozDeyaPWa002Vy31E5IMTNMMJdiwTdS3s5WxoeYZj?=
 =?us-ascii?Q?s0YfehQP+HBaf1V5KNP6JnyTNNNHNiCo1ik6es8ZRSd8Vpd4iQHKnD2gLusi?=
 =?us-ascii?Q?rjIP9WoAzGc80RVwWhG7OBBgdsC/tcfzS+wshBuFLges0kNlQ7/hPOl/2HVo?=
 =?us-ascii?Q?eFl3RlEJCNx1wYgxs9C/+xaAP3NC2D++QNq5tReTRomqyzwx/pPgg/CIlTb2?=
 =?us-ascii?Q?jTfWq1pOjTqQJ6rASOAlAgrqTb2zgK/3/wqlZHAYCUSgzjeHfbKAY5ZcVpRN?=
 =?us-ascii?Q?oRkHuDkVMdPF/XKQNfzNFBPnEx6hWputvIkGwUgPRAZfOzgBJYSHYbJ75M0p?=
 =?us-ascii?Q?+ByrgXkaz80B02Ukr5IfRo/O97g+woEJodYw0GZT/5vX8yTnAavnz6Li2nTO?=
 =?us-ascii?Q?UZ6l8R+94iuIFWz8fyarEVH+XcH4UdE4UxE5m51C8B/vO53R4KQXYIXVVVrK?=
 =?us-ascii?Q?Grmtk/1tAKDZxOvseknVYuiq0WdpXFgUDUF1Kk57QGbbq6kQRPSEIkZuINYt?=
 =?us-ascii?Q?02Fi0PZ5PrhVli+ZjySErMd8Lq4Ab8QMWgwe/hbMVRRNxk/9YmyWlw6WGcef?=
 =?us-ascii?Q?6g=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64f7d50d-7782-4ed5-3ec4-08ddf99c4cda
X-MS-Exchange-CrossTenant-AuthSource: PU4P216MB1149.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 05:53:06.2517
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2+QqWATPJTHuvVAMbzoY0S5YKfBH/qv+hH6rV0pz3uVjmIpXoPAVNZMru0mHi+oBZkdHLnbgElkTvKnklMsNW2APJnDVkVr24+dO/KETZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB3024

From: Jackson Lee <jackson.lee@chipsnmedia.com>

SError of kernel panic rarely happened while testing fluster.
The root cause was to enter suspend mode because timeout of autosuspend
delay happened.

[   48.834439] SError Interrupt on CPU0, code 0x00000000bf000000 -- SError
[   48.834455] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7
[   48.834461] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
[   48.834464] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[   48.834468] pc : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834488] lr : wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834495] sp : ffff8000856e3a30
[   48.834497] x29: ffff8000856e3a30 x28: ffff0008093f6010 x27: ffff000809158130
[   48.834504] x26: 0000000000000000 x25: ffff00080b625000 x24: ffff000804a9ba80
[   48.834509] x23: ffff000802343028 x22: ffff000809158150 x21: ffff000802218000
[   48.834513] x20: ffff0008093f6000 x19: ffff0008093f6000 x18: 0000000000000000
[   48.834518] x17: 0000000000000000 x16: 0000000000000000 x15: 0000ffff74009618
[   48.834523] x14: 000000010000000c x13: 0000000000000000 x12: 0000000000000000
[   48.834527] x11: ffffffffffffffff x10: ffffffffffffffff x9 : ffff000802343028
[   48.834532] x8 : ffff00080b6252a0 x7 : 0000000000000038 x6 : 0000000000000000
[   48.834536] x5 : ffff00080b625060 x4 : 0000000000000000 x3 : 0000000000000000
[   48.834541] x2 : 0000000000000000 x1 : ffff800084bf0118 x0 : ffff800084bf0000
[   48.834547] Kernel panic - not syncing: Asynchronous SError Interrupt
[   48.834549] CPU: 0 UID: 0 PID: 1067 Comm: v4l2h265dec0:sr Not tainted 6.12.9-gc9e21a1ebd75-dirty #7
[   48.834554] Hardware name: ti Texas Instruments J721S2 EVM/Texas Instruments J721S2 EVM, BIOS 2025.01-00345-gbaf3aaa8ecfa 01/01/2025
[   48.834556] Call trace:
[   48.834559]  dump_backtrace+0x94/0xec
[   48.834574]  show_stack+0x18/0x24
[   48.834579]  dump_stack_lvl+0x38/0x90
[   48.834585]  dump_stack+0x18/0x24
[   48.834588]  panic+0x35c/0x3e0
[   48.834592]  nmi_panic+0x40/0x8c
[   48.834595]  arm64_serror_panic+0x64/0x70
[   48.834598]  do_serror+0x3c/0x78
[   48.834601]  el1h_64_error_handler+0x34/0x4c
[   48.834605]  el1h_64_error+0x64/0x68
[   48.834608]  wave5_dec_clr_disp_flag+0x40/0x80 [wave5]
[   48.834615]  wave5_vpu_dec_clr_disp_flag+0x54/0x80 [wave5]
[   48.834622]  wave5_vpu_dec_buf_queue+0x19c/0x1a0 [wave5]
[   48.834628]  __enqueue_in_driver+0x3c/0x74 [videobuf2_common]
[   48.834639]  vb2_core_qbuf+0x508/0x61c [videobuf2_common]
[   48.834646]  vb2_qbuf+0xa4/0x168 [videobuf2_v4l2]
[   48.834656]  v4l2_m2m_qbuf+0x80/0x238 [v4l2_mem2mem]
[   48.834666]  v4l2_m2m_ioctl_qbuf+0x18/0x24 [v4l2_mem2mem]
[   48.834673]  v4l_qbuf+0x48/0x5c [videodev]
[   48.834704]  __video_do_ioctl+0x180/0x3f0 [videodev]
[   48.834725]  video_usercopy+0x2ec/0x68c [videodev]
[   48.834745]  video_ioctl2+0x18/0x24 [videodev]
[   48.834766]  v4l2_ioctl+0x40/0x60 [videodev]
[   48.834786]  __arm64_sys_ioctl+0xa8/0xec
[   48.834793]  invoke_syscall+0x44/0x100
[   48.834800]  el0_svc_common.constprop.0+0xc0/0xe0
[   48.834804]  do_el0_svc+0x1c/0x28
[   48.834809]  el0_svc+0x30/0xd0
[   48.834813]  el0t_64_sync_handler+0xc0/0xc4
[   48.834816]  el0t_64_sync+0x190/0x194
[   48.834820] SMP: stopping secondary CPUs
[   48.834831] Kernel Offset: disabled
[   48.834833] CPU features: 0x08,00002002,80200000,4200421b
[   48.834837] Memory Limit: none
[   49.161404] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---

Fixes: 2092b3833487 ("media: chips-media: wave5: Support runtime suspend/resume")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-vpu-dec.c    |  3 ---
 .../platform/chips-media/wave5/wave5-vpu-enc.c    |  3 ---
 .../media/platform/chips-media/wave5/wave5-vpu.c  |  2 +-
 .../platform/chips-media/wave5/wave5-vpuapi.c     | 15 ---------------
 4 files changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index 72af0faa3ef2..1df78e427c6a 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1829,9 +1829,6 @@ static int wave5_vpu_open_dec(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 506d6c6166a6..d2b047706626 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1773,9 +1773,6 @@ static int wave5_vpu_open_enc(struct file *filp)
 	if (ret)
 		goto cleanup_inst;
 
-	if (list_empty(&dev->instances))
-		pm_runtime_use_autosuspend(inst->dev->dev);
-
 	list_add_tail(&inst->list, &dev->instances);
 
 	mutex_unlock(&dev->dev_lock);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu.c b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
index e1715d3f43b0..b3c633dd3df1 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu.c
@@ -322,7 +322,7 @@ static int wave5_vpu_probe(struct platform_device *pdev)
 	dev_info(&pdev->dev, "Product Code:      0x%x\n", dev->product_code);
 	dev_info(&pdev->dev, "Firmware Revision: %u\n", fw_revision);
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 100);
+	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 	wave5_vpu_sleep_wake(&pdev->dev, true, NULL, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e5e879a13e8b..e94d6ebc9f81 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -207,8 +207,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
 	int i;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -250,11 +248,6 @@ int wave5_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_dec_info->vb_task);
 
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 unlock_and_return:
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
@@ -720,8 +713,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	int ret;
 	int retry = 0;
 	struct vpu_device *vpu_dev = inst->dev;
-	int inst_count = 0;
-	struct vpu_instance *inst_elm;
 
 	*fail_res = 0;
 	if (!inst->codec_info)
@@ -764,12 +755,6 @@ int wave5_vpu_enc_close(struct vpu_instance *inst, u32 *fail_res)
 	}
 
 	wave5_vdi_free_dma_memory(vpu_dev, &p_enc_info->vb_task);
-
-	list_for_each_entry(inst_elm, &vpu_dev->instances, list)
-		inst_count++;
-	if (inst_count == 1)
-		pm_runtime_dont_use_autosuspend(vpu_dev->dev);
-
 	mutex_unlock(&vpu_dev->hw_lock);
 	pm_runtime_put_sync(inst->dev->dev);
 
-- 
2.43.0


