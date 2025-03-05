Return-Path: <linux-media+bounces-27639-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0C7A501D4
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 15:25:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0812188D271
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:23:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E79324CEF9;
	Wed,  5 Mar 2025 14:22:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020129.outbound.protection.outlook.com [52.101.225.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5C324C68D;
	Wed,  5 Mar 2025 14:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184577; cv=fail; b=SzztnlQuWuU/OXqBRBIPF0TOqGzOsEBDo4jPHJVgQusRpnSVFLKiSri130Sr9dizqDm3DFzAWOjZGo1vi7sqLB9n6kfa6LDq4gmiFPzzgygVFHd20CMqFjrQhUb8l+FvFER43vrwHp06Bc2Ds+pg+5U2D8cBW8XCc3/cLm8vt+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184577; c=relaxed/simple;
	bh=mcyCQG0hkTm3j/oHJf4p7PcA9PafMu5K2wSTemthCbM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=gjD+jrvVuTHKe0LBkIgbJZZ0Y9F9v9J3RScolClANQZaesA/B1bMlIdQcmrQu739zcNp37B60+AtOFqPfr2yL/flwExPxu2gltkg7K0CPBNeqqXKaVYs2kU10/s8SjAPlcWk1ZJFrSNTTqQpJccKo3mfjlJMHRrrJm1y3KmrtPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FXQSJ/uIPCWMRq6JJgCLg1PUTYYBptkNjFwlNf17z2JTyxBPVz5YSACm5KGW+hm7NXh91aSsMSNEgm2nfmO5j75/AEwnpXzs9uvWe1OGQCUNR3rY2F8U/G9O0C0XkSb+ii2o5FXN0ZESNJlQKsT72ibAink/khfKyNXHQjGZDygzKeYEcXY2k6376MqjshGaUBSlhKVMNCsGnvVrt0Q138YLBznb1j9mX77F04uAaXgubonRyDKq1rKbH9VVJlQ6umvg0N+z2M7poFyW1uovUnL9Rql5UIyqEht9mz/515HxNqRQRgs2uGC+bTzfRsWrFoE37yVr2lOTiD2KNrojJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayQ1+8+50Phz9Cauw/t/0yRMaG7/CxszamS9+ch5xmE=;
 b=cKe7Pcimzq+Vw1CgSONPKl6FUzty1nho8yn6c/MxScpgNXSNHxPWzHKd+/xvqwgMi+xt9zZxaTfDVYjHVMI3rEmVtiGpf3D8otshib0/t1LC04TxyRGmolvfHTrZ1faG9zcMO1vhTV2VszfPPiTcOJ93BCXYMSlJ8TeFJw9Uu5XTFyhgVYOFI69eOnybaEVlJM8I0QiBWUT0jJKiTSHEDRJ4gIOBD5hNgPrlJRf+MxKoTwbnhfzOqellq2puDNGbHD1oe4zuICSCAIdi78s5Srm6gs9gVgHdaFuNE2kyoHbnJJL6lj3aLH2tI42ovVSyXE8RPHfkuTgkMnXcXf6j4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MAZP287MB0486.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:d5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 14:22:51 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 14:22:51 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: kieran.bingham@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] media: i2c: imx219: Minor improvements for runtime PM and stream handling
Date: Wed,  5 Mar 2025 19:51:14 +0530
Message-Id: <20250305142117.29182-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::19) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MAZP287MB0486:EE_
X-MS-Office365-Filtering-Correlation-Id: fab63553-bb60-4623-e4d1-08dd5bf1364d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ct8oObcahlswVENbAN/CqgLfROwV/SUeRz0HQ/79ymZKYzAW8Cyn9IW8JIVE?=
 =?us-ascii?Q?jgvnIxQMvhfM+jY6ra+KXN4KMvBYA5D8xd5mZWR76yPmoGoAAQX2gASIzKGz?=
 =?us-ascii?Q?VDxcpMANaQm6tBVO9xH8Te6VjD9qPmQp4bIiLC3Es8Anx/rr//3x/0ELknod?=
 =?us-ascii?Q?ETdzXaN+eT7Q0aF4mGtN6alJa4xUgn078tbEEV+wl1D2TwDHNuWu1eNhkwhs?=
 =?us-ascii?Q?VIBSh6K6UEb+bwwa8LRsVL7BTkVHG00hxTssqjXZ3eSX0clVwuLV+71CLLlz?=
 =?us-ascii?Q?FmP37+aMMTqlm3LEHmguTL9YPcw0sArH2wtApt1uSjmRasvhgXqVmp7Hxc42?=
 =?us-ascii?Q?GK14iJ25wCgcr6FK7oEW2qsCYcgmpluibKHg7tMm1Xf1tt4yew/azG7CXP5t?=
 =?us-ascii?Q?AGw7ZyyeAcQbllTwlml47O8LmOAecZf0CbW6+v6uedbbFMKcsHTYqgbn0kxG?=
 =?us-ascii?Q?u9/OuLfVKv4i+u52i9opoF5Q7wH8/iQGaELk5ltsOA+4/hO+UAfyzNTqYo3p?=
 =?us-ascii?Q?lJ0xwC38qNnnWkkYFSqQU/2yhd8Z/pBGL/i2TjHjLz6ZFzFlvJgdlT3CAI47?=
 =?us-ascii?Q?tZgqodSHNKB87ZwdDAkWuFRIgSWj3eTlAxKi5MtT95HxSOHzEdPN1unyqMpe?=
 =?us-ascii?Q?oMTZWaf0jNDpaU8VkTmMrGznpyuow7tdnEaXl6Nc/Fiz10tZtYxUJq8a72BJ?=
 =?us-ascii?Q?aVoGvZig6eyRcmr3qDwG5oCpfsBNjLIZlGu2TbxvjMlV4IJHREBKJ51tqsio?=
 =?us-ascii?Q?bkODhKVAqh2KJ3hZo2FIqY/qfbIzsIwRxf9Ohlp1w7XvK7fEqOPfVBSX6fOt?=
 =?us-ascii?Q?9t3RDyAqrpvJSURdTqFCAKfvkZxG1x/FZ3o//9Q/PKMl1Be8MUYNyZMdBHia?=
 =?us-ascii?Q?ZR2z0EN6QfeVyFDF172mz+AXYkOkf8oonqPKvy/fQd7fcxc9pOiHK5DAYzO3?=
 =?us-ascii?Q?22aoJfArSLn6d/myBsCPJe1Hzq+ge5AukSxS4wQdJZlq2cqxZu2WowxrC4+9?=
 =?us-ascii?Q?ibNF4hnEgZD7quQYs9V9SLG4kOOZn6hCH2kvcdjIVitV9sRNBuo4qihbEIBn?=
 =?us-ascii?Q?S9Kwtt/uT7HNVhsv4cVW/D0SBXmYeZyM2WNmK9A20jgslOetmYUhufak0ten?=
 =?us-ascii?Q?xpQ6KiBSyRo3gRnqwEG5LN5rzQG0HYvMdWlhmH/tCM9KYXKcDBXsBw4LjD76?=
 =?us-ascii?Q?h08MFjdnfAp+c/snXIOukQd/XjNbtBYSimds6JiOVDcAyqrXXQdvDNAAlYz+?=
 =?us-ascii?Q?v3TqS1vAPOiNG/sgI5wjcxAvACdfC+smGayuzAgf2wAsVD5svMaMEjG7mAo/?=
 =?us-ascii?Q?XlBM2QEDfjY6ZZ42Cma/NFszhSm3JI2ivrYY5fZisS/HTvUSoJ4ZeQANR7L3?=
 =?us-ascii?Q?h801AhqNcckbZdj/cA76oNTF4c1Ci+d0FK/E+Q5t9cdcpusFTT0E6LpM1VRH?=
 =?us-ascii?Q?Ndeg2FFmQENQ3wNHrm30EdzGejP2Eico?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nY4eCthyBkBTA/mthNMKcqq7y6oPOuj4Mt+s41blT1jshYydclWePiijegKJ?=
 =?us-ascii?Q?OunaDOL4BxaeeN/MH0de7foSIPHKymAworSkqsTBdCvZkkQ6Smi/7ddgedL+?=
 =?us-ascii?Q?ZqQXBLCJabvmBo+48uXCLTYoHb2qWfzqVuwJcDIZJWDz5tACA/Lnb6jUyqcZ?=
 =?us-ascii?Q?c6ukB29U89qqmP4ZfTNj8j9491F3mdFulS3j3D0mZEkjghbqdjVPJ2fOKg+h?=
 =?us-ascii?Q?YBBTdzs9QSDNVe6y8VDpvvN0sx5BM7bPrVjvANAY5bzTwC3W+dssLblf+grH?=
 =?us-ascii?Q?6HbFqvKT22mCamkIB640a1UWB/UqoY4wcLnf0sAxka5/qRlu6qgYTKkeJ8x0?=
 =?us-ascii?Q?XbBgMAtX9p8nMw+8EReDsWPLRJPgdCr2fHZV6dfA2C107w/grhLy47ZJPAB5?=
 =?us-ascii?Q?Ib6Kou2JZrKvkKJ/mj1IApqoy0DTyaIKQKiOc1ptsPHUVyHKdnSBd2eKuvv6?=
 =?us-ascii?Q?/xbqAizRjD+czMygELsigCtWjJZUZwF8rhgk8EImrOiIb3xiBAHKxQskfbj0?=
 =?us-ascii?Q?1UUN/sCWdMCAhNPF+hjWFWS7i/ZL8iC73lHT9svUHaaheo3kP2gmqTSVGScy?=
 =?us-ascii?Q?qOvlWWZGtB5a3i/y2zp7eLks1uFW5mxpJpb3o10knfpbXJoL+VgL7QeyoM7r?=
 =?us-ascii?Q?LA7anLuZogwaLAVwcBDXBWKZ/KfCvppKDUV2LE2aV+QXiCE4vZqYsE69T1XJ?=
 =?us-ascii?Q?dHePgX2aXCXbaPsIC1Hu4Y9xPrZ6rTvh88zN5+9XT70ejhTvLc2M4vSJD3ly?=
 =?us-ascii?Q?u8uvMwYb15yHfcM4keXiD9iTtt9LayL1PpW4p6IJR65MOBq4Jd5jcrpW5G8I?=
 =?us-ascii?Q?LE40lSk5TfnttOQz6K7RO42hrHqRqlWwTAjEj6UrxZdyCPmlB5IlZImU8Rxx?=
 =?us-ascii?Q?4nskwubshOShEXYMzhQRAWX++GWLOuY+vN2NcWt6cFLskeKgfk5XLTlpG4MQ?=
 =?us-ascii?Q?yXGkrOS/l33c5JdNv+miSQdq39gZTtrgcABbwY3duI76BxwHdesBfc0q47Vt?=
 =?us-ascii?Q?+AfEhM815LlL/F2oY/6nCJ/jyR8L+Ie1rDWYf2lLhl+IqyzYIdBjUO03MTY4?=
 =?us-ascii?Q?h7pLYXivoR1brOtz3ui9eUfAO1sH5BtEpoFEdZd7wo8ZfTR3sRperrnlpkhe?=
 =?us-ascii?Q?rASC+aZHv7mxHF+ROQgrcX2c/0KTn7XdYZ89HK1GnKRGT7XUiy1F7xOS3+qu?=
 =?us-ascii?Q?1HE6qzptLpMJdz25MTVCv8pWhtfoM4F0bFzMY1zl+1ulhYLP4iVnn83CB/DV?=
 =?us-ascii?Q?whEjLk2TlUJvbrH+/IusshWG24VbQmT8sim/vYCAYO2IB3YBzJN2vOwSf1u5?=
 =?us-ascii?Q?QKH0ssqsVNrCPol0NyoPYRnvGHztuJJ1Eg6GQkp/Xa7GsENBeftC/r45HLNR?=
 =?us-ascii?Q?8tZxzZsBcspSzcHpvxyS/ngF06iz2Ntb+/hW5BlH+l10vtsoaaQ0n2MNj9sH?=
 =?us-ascii?Q?IY1AkgkDrRj/cmR9AVsTFq1OHqxrzfIg72u9mM6xWPfZmg00Rbm9ZCWqMtSL?=
 =?us-ascii?Q?Ax0XXOU2G6FnqK7uhQ3/gT8RbeLb7PzfRvgdSlFpF+UZG5RdnC0t3R35ld20?=
 =?us-ascii?Q?jjjKMvSMU27X76OrTumvfgmbe97GAN5mV26lmImu93brMbuvjmAW6dBP/hgJ?=
 =?us-ascii?Q?dQ=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: fab63553-bb60-4623-e4d1-08dd5bf1364d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:22:51.4560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8nMtAZg+cqLelVz2xuj6lWIH147QPNLcBFIgoO1delwmKttcEMOlvDUtvmiMoN//M1rLsQpXuaTzz+gCTi9SlFqa3a+C8j4IDesg9ZjWuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZP287MB0486

v2 -> v3

- Add locking/unlocking of vflip and hflip controls,
  which was mistakenly removed. 

v1 -> v2                                                           
                                                                   
- Dropped "Enable runtime PM before sub-device registration" patch,
  as it has already been applied.                                  

Tarang Raval (2):
  media: i2c: imx219: switch to {enable,disable}_streams
  media: i2c: imx219: Enable runtime PM autosuspend

 drivers/media/i2c/imx219.c | 44 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

-- 
2.34.1


