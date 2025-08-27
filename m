Return-Path: <linux-media+bounces-41182-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BDAB3829B
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 14:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6E9A7B558E
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 12:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F36B3352080;
	Wed, 27 Aug 2025 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="marJK7Hv"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012038.outbound.protection.outlook.com [52.101.126.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C3535082E;
	Wed, 27 Aug 2025 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298393; cv=fail; b=OfOxGDquB8AUkWVDQHpXEfyDyYMcPfRltoIra/IhkXOBP752DV4oyk2sIbOJas8LMFhSj8TRqxqD4cDhALv5orJNc+YlNT5KbOySpduHfAOeuCICv6zSFTHaelFKo+sZnWP6T0XzPXoumY1bSHvCHQ4jUhVtiAc9ztLsbXfhzAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298393; c=relaxed/simple;
	bh=N1J/uYqQQt64J/LboJWKLPHp76oKij4AJgkX3KczFSo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mHglu0RnQZsuiBIKgqNdkDmQjIaawYI2WjvDY6oKf7vnvupTzMEbF9rjc4YmBaNsxfFCI/95xX1VY6uzONjEWKCO9IK5AbwX7qAFM1RqV3cpC1UjO4dswcBe45ZYQ3tT+AUSPsT6mNLaGFecC5nPoA4GGXweiD0u/u+lDKyWMxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=marJK7Hv; arc=fail smtp.client-ip=52.101.126.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRYdkAnAUGh3xFiGgLLSjYdwE3D3IT3c/RIVMnZN0HOMgqRCpO+aO8WCxR1GMI3ATckOrnNfyTzqgt/TBXl/s0bukvLftTeVQUzwvWlgfeAH01Tb6PVr1G5RKvDwNDTzsTyAVaJfu6kInP9l0gttAuu6865n+Ro29aWrvU53fvw0zqajgSe4RPjoO/hI8Eo1Grht5vxSoC/bunHHGnnOk5tOuiLQiZL0FWYYi9Ej01qnTBrgbFwXaTS+S9FRLaDvGyyYh6aPjQsFtjYg3rIEZW4X8R1vd56VfV41xajkbV1o4mE6aLSolMd8Bd9NZ9Z336LnIV8i29RULX6aRbOhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPSaDWZ5UWJp40FE2AerA/TeUScRIKV4FkeX02TeZi4=;
 b=MjeDPPHFDLJWoM3XSXsZudoPhMFU2IjVrvgm8NuA//QX9ZloJuM0ws9F1dSZ7T+nAvGZA9sbLA9BuJcwEPtt89KGArr1+NSNDV/uIoXYELKWjWhia89VvXPyR313NgwZuwsu2V5+arwoizgit0b/CBFQqqeCGoXQSgQlJDtpZp4TivnqJNp/ZvNNtiZ0j9XbFZtIPyUT1O4sfnuBX9irX7T2oXhr25RotFebCWF3AkR2V4gJIjcCJ+cCoYLxw0F5xO2Jzl/UzCwUDDEGUCdiGexUcAnWBP9u6exvxgiFjbNqQWRXu4vYbB6Q6OYjZ+4XzBoqHa/nzX3AQHLvbxRZfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPSaDWZ5UWJp40FE2AerA/TeUScRIKV4FkeX02TeZi4=;
 b=marJK7HvmyxJg6zwulC3R7HLVfwUuyfrUr2isrXcLo3aaG3HSRPPqFSaqB71b4R2CJbia0FV3wYzHsDsHcJwlEowwEOUUZU0ivq0oUqbFhtzcRqSqsVRPpAdSRGacbgtNPKu4FQgfN3immhZ2cScKKsvADa93anSOIjmXSVBohHA9yr8bMeNAcF6fDd2EoH+KBDkX4bGbAE2h+W5s7E4S19OwaRJYnf8YtptNpQzYDXz8Z0zN1H9NWdya2P0rH2DbZMjliU1VP/nPf1C0En7oQrDRZwTrciqBhF5oi4gnr/nG1J1kzvjVe9DYzbZTsfgdhTpluYtn//IyAFEm+6rRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 PUZPR06MB5539.apcprd06.prod.outlook.com (2603:1096:301:e9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.13; Wed, 27 Aug 2025 12:39:47 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%5]) with mapi id 15.20.9073.010; Wed, 27 Aug 2025
 12:39:46 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org (open list:RC-CORE / LIRC FRAMEWORK),
	linux-kernel@vger.kernel.org (open list)
Cc: Qianfeng Rong <rongqianfeng@vivo.com>
Subject: [PATCH 5/5] media: redrat3: use int type to store negative error codes
Date: Wed, 27 Aug 2025 20:39:13 +0800
Message-Id: <20250827123916.504189-6-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827123916.504189-1-rongqianfeng@vivo.com>
References: <20250827123916.504189-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0049.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::13) To SI2PR06MB5140.apcprd06.prod.outlook.com
 (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|PUZPR06MB5539:EE_
X-MS-Office365-Filtering-Correlation-Id: fde2d42a-43d9-4e49-ead6-08dde566cde8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9t2M25kPj3cqasS/nxqJGumEaDzxE56u6Ywnxh1NFG6YsmBTU2ISXN53ppD/?=
 =?us-ascii?Q?wEqV6hy+ZUhzhE2JWRL8A99kncjcQnRd7ZW4hwKBe0bCzJJbZahewLqqdmYc?=
 =?us-ascii?Q?7H8qGxyzZ8PeTffbaLh23JgwbEnYc4fSNawuOQWo5MpgFdUrHkJeJBi17x2Y?=
 =?us-ascii?Q?Xs82GXR3+mQyb+Bx6SIJMNp6D/fV08cKYQndVvsoLZuKYecvON04CU8jlPCi?=
 =?us-ascii?Q?uHkJ3sGjCGbfeFABPqIoRBzvB5EdGBZDFOXc9EcL9bC5ABkoAOkD4S6vbyHZ?=
 =?us-ascii?Q?Hwv4fomS4bMxjmDbQWSJH7AbnFST6kvdx+nRK+rMYN2PO8R6BYgNocm4Hlxa?=
 =?us-ascii?Q?jsDxbC1OrVqqBI45qC5WQnh6wQvEx8EPezOhoniFnZFb16uiMNOYIaXztwpW?=
 =?us-ascii?Q?WRe5eIrV+BViueHIY6g2URJ9dRXG0M5v2+tUFGeHTawPxCwzAwSH3kba0XFt?=
 =?us-ascii?Q?p+dTaf5shy3IPVnWSi6ZGNgHl7ccvKNnffPzk9GkH4sXc1rYy1tlFEcZChBp?=
 =?us-ascii?Q?Ciz9o7lBnimTaf7Z3UoiRBR6zuDIJeNNJXBj2VEKPZ4PKoy9MMIu/krA/Uqq?=
 =?us-ascii?Q?nFO2ptV8QgrTCoLo3zsNliv3jq228FDhnKTt89eADSM2S5j2XduHFKANZXK5?=
 =?us-ascii?Q?szmr+TEwh5AXurZ9v5Ps9vL1K64wSdevhY1npIzgfDODSIbe9I9HLP271ebp?=
 =?us-ascii?Q?3n89aLNw28q3cM2MJCNhleMtiRlz5YEFg0TaZT97MnGgFVMZjDtVEcyp8oFK?=
 =?us-ascii?Q?BnzJBcXoUaVBPhc+C8R7SVK9kObO67ZSi0dyZwIbd/TbVPc6dKR4JLsZ61Tc?=
 =?us-ascii?Q?13RqpldZUh6Cw5lrnZkOTsFtPKPqB0RABZSA/aGHXZqcVsBff9TzJ96RwSKd?=
 =?us-ascii?Q?pKt+S3rOwPQkmgJkPpOP1DiZO4uduNAuc5NE/oDp9uEiVtIi7wS6OH1R6YHi?=
 =?us-ascii?Q?fTQHS736zG0FJwiyyYathsuqq7+W/OzPTxmxMXoypq2cezrGa6vYe35x1jvE?=
 =?us-ascii?Q?mS6gL0CacBS3Un9n6c138/ev/yHIy3mjGrJquNx0MwG6vHGna0OZU4KaAaEJ?=
 =?us-ascii?Q?+iiu8YcteM8j935oxtOomWxfnvVaaarLtqzCnad3PIyH0ShP/a5H8qePhHgT?=
 =?us-ascii?Q?YB3Trr7hM+xQ7GkBR4FpB3UoQ70nOp5wsQrSKRu+/xCOv1Ag1iNCIMt5m9bZ?=
 =?us-ascii?Q?JmeHxOundeJfxVOB4roLNaj6OCh0xQx3K5cPUdsnDO4R6sP0J0VTmgOiQ4zu?=
 =?us-ascii?Q?AZY+vruGy4S1Py0UG9M+xUFdkOEo3Fl3Vh1lESWKUFakA+jyYOMvmE7fia+N?=
 =?us-ascii?Q?8Xwu5NzWJN9pYfRizCO4qtp4C6NqvHgxSK2mQOcfJ9ovRoH4YX/bLQPALsju?=
 =?us-ascii?Q?zijlwdqY5qz2SN0BDNJEnzMTDmjBR+xlFVJ2PPMcjrpm9JVW1kQLE9MRea7s?=
 =?us-ascii?Q?1U2e3rt3miAIxjXAbI5gHzyw2v5xwP0WmN9J4JiO4AHi+xEugKbNAQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nm2TBP2Xo5frC/G674a89VURFcWDz4gNN/O8RgLI2MjJGOuE7LYom5L5gQKY?=
 =?us-ascii?Q?x17xudHrUgWJm3K5BZtHiJ49TBKbHLdip8k2GEQ964CbZa6edI2TG+R2pNwo?=
 =?us-ascii?Q?AxRk75MGdn7/vZG06dQgS04jwuFEM8VdS1mLZixYZ/kR+N4YEhz8lpdOVWvl?=
 =?us-ascii?Q?WwcvjxtDd7TlnEyTdP02TaLT7WDWd0uatG/CFSKYpT2vsKZS/cWLX9Fe+cAe?=
 =?us-ascii?Q?HoRimftAwoPVgrjEM/mfiwGv1Mbca++mZ8X6SliTS0EeKZyhJdK/PPWeVqPX?=
 =?us-ascii?Q?Et+u7WddgGlL9grUJdLkV1Apm1NvBIwtw+4pveCHNs2UqaipkiHewoN61Mcb?=
 =?us-ascii?Q?+CwzgcN/JC85asPnZw9XFEJNWWa9rt5+Vz1PvOW59z//m+/9wGC/bDKupfFa?=
 =?us-ascii?Q?zlOxpcXOrzSBQIZlgZanTPgL1Mqs9CKrD7CYnhHVE231Bb9/tVkuvfsFRBbx?=
 =?us-ascii?Q?ECUX9B9WZvDyd+uMk9noMbWwKi/FJu3xN6fNjwITDCRiKn6lUJgoPGfyN1VO?=
 =?us-ascii?Q?P3Ku5QFqmP/NVqjIeQkmp+Dm3crWJ3ZiWSgiqJtBh7fgpPF3uRchxGiIZmp8?=
 =?us-ascii?Q?St1ugKJwoj8qZxm7PPvCu0T+KoWdcLTVJUjWj0Ug2Tbz+iED5B2mCgOS5kVb?=
 =?us-ascii?Q?b1hGuPlB+GhH6SHYniFOnNM55DjzUAWmlGL6IhHAsj+zQNARXmMLz3/t5XAY?=
 =?us-ascii?Q?6PI1oiE5GkFhTFsUxIjXbNuJEt0jPkFmQO4A664Fp0kBYgf57JgnaEjECuEr?=
 =?us-ascii?Q?BxLtQPIDgcpXM1ir6uhgQKOJf9QdVIXDBy5Yu/ld4ojgXybkrtHDgQJFgi70?=
 =?us-ascii?Q?vu7NBdnokRjvMWZV1r+YO+7Ovs4Xb3NPyBbv9OXuK2xl+Q29pTjnMuwcA5in?=
 =?us-ascii?Q?hvHe/aLp8nJ5Cozk9F07bxsMCv1KNyvuio2yOYmB8pru6w694L9aHB24PRp/?=
 =?us-ascii?Q?Wfsrxavn9KFxvGyYEHUcjbQ2UGIXTzVP0sHt6jKD0y8bQ7kx3y/YtuIDBszW?=
 =?us-ascii?Q?6hyhC80BU9MPnsLgQoJ1CINwGtA8haCCaA8bpvUWuP0YliDeVYCGPeVuvodO?=
 =?us-ascii?Q?+XNJPjap9wtuI4nD8pLoX/ea3udHd7Ta8HmBwW6+vxpSW78MlNLHGxwOE34Z?=
 =?us-ascii?Q?IosmWs2XnHqP0/OdzoUqwsGX51xlN/+8V1MgkUhjcY4uSq6B1JUWpn3OBY+R?=
 =?us-ascii?Q?CwuHFjZNQa0uCc/LoNzUfMERbva+BBF4viOIt/EkC+dEiAx4svDwbnXS/yXy?=
 =?us-ascii?Q?j1ajaprfoV9ePmil4k6pHfKcFaZiNGAn4e6IG51v3BEkD9MOkRxsM8mEzoNZ?=
 =?us-ascii?Q?ndtp8dCloH6qpaoWYkP1xVRC8mSAEa53tSMo5iv8ZCsxJthQ/4eBRcpNoT9F?=
 =?us-ascii?Q?aP6x3FYTGrQuUqYxIfo7QQ5PJcNe2z0tGz4o40AJvNS6p79NUJsQ8ynjmb84?=
 =?us-ascii?Q?DbAbcsmQnkVknCv+YsoU36kA8+fy0YijqtWonHvgjsebFygmAIb+mIEa1k3u?=
 =?us-ascii?Q?qoWozEoc15vrkXrmz72QIJWYbvxmfQpIffetvAgv9EAIuSvpKTq2js6NuLGG?=
 =?us-ascii?Q?+1GhWwK4hJT+7LyJPCcwSbgURqfXtBcUJ7guzLWn?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fde2d42a-43d9-4e49-ead6-08dde566cde8
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 12:39:46.4469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BW73GaX9z1p65Q5yOd72b6numt0SQIJQYcjw8OhZt+hecLREj5GmpkFD3hMse63lJOlLGshX0n6h1C4vssBrEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5539

Change "ret" from u8 to int type in redrat3_enable_detector() to store
negative error codes or zero returned by redrat3_send_cmd() and
usb_submit_urb() - this better aligns with the coding standards and
maintains code consistency.

No effect on runtime.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/media/rc/redrat3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
index d89a4cfe3c89..a49173f54a4d 100644
--- a/drivers/media/rc/redrat3.c
+++ b/drivers/media/rc/redrat3.c
@@ -422,7 +422,7 @@ static int redrat3_send_cmd(int cmd, struct redrat3_dev *rr3)
 static int redrat3_enable_detector(struct redrat3_dev *rr3)
 {
 	struct device *dev = rr3->dev;
-	u8 ret;
+	int ret;
 
 	ret = redrat3_send_cmd(RR3_RC_DET_ENABLE, rr3);
 	if (ret != 0)
-- 
2.34.1


