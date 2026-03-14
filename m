Return-Path: <linux-media+bounces-55799-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MSBAr1TtWlGzQAAu9opvQ
	(envelope-from <linux-media+bounces-55799-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 13:25:33 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7499A28D1EA
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 13:25:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BD28C302A187
	for <lists+linux-media@lfdr.de>; Sat, 14 Mar 2026 12:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F9025487B;
	Sat, 14 Mar 2026 12:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="Pwpa9oEH"
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020143.outbound.protection.outlook.com [52.101.225.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096542C181;
	Sat, 14 Mar 2026 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773491125; cv=fail; b=AvFs1f17Ol4O4qyhiDNFZ27HRQaiVUJezQ+LsVvxJ8BzGavxbF2/RV55yYypkOw/MCebxRC7TL+Bf0QtOoG0fVkqo8EM4fUnmhIsBmXsVVUk02jHZuGbNKNjEINeZCVEgX/IKJxkWGlh7dausjpm8raNDuEMqtJPjKaaEBCx1DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773491125; c=relaxed/simple;
	bh=uNj0q274vTWI/t2p4n6H4L0Xtpt6rc6U3c9rOhOJSyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r+YOP5EEex8hKSZWLhMQmL/lXLttdL3TnVIIClq7ji8CbeXhoHxibBNTkH1i1gM681PW1GmGD7vvZKqg4FK3DzlWUz8JCfta8SaiHzfLozqlieAdzQohVrdgwD0uT51/R+y+uV22yzotux5kMWQ3Ytio3NY1ogRJmHPd5VaIYR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=Pwpa9oEH; arc=fail smtp.client-ip=52.101.225.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QcYzm8L9C2hP8Ci/bEpZ8J8o5XY1GJJxjIDRlcmeZ+rt1XgVAJJralKzguIVYXDZRuxgN0IjShhhlYuZ0YtsAZde+ArdXP7vtu7PLbC0qUfS9bM3T7wl73nN542bK25OriJ1FI5z28Ox8qVHWaP97dB+P+rVmerdk5cTC2P++a7AcWdRQu0A/iGPDtXP0ux/3JGqIhAinQ5F07ICYYe5Qi6RHPk894EmUWpV9GXWHQToEu+wApJt1UWpFtCZh1HCkFQUwipk2d0kQInj2ultaRqIP9lHZU5kblLBu9lpB5GsGy5FmVHWI0CyY9rbypi3HKAb0zQS8cFZicJ7YWHxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwDG6aOvHaB+SyNb4+MQTf1b8dAr/iBanyTzICdaKNs=;
 b=dU5a8H2SUAC8oDHFrGZbKVaF+OpVyjaNKjMCWF5cWRW4D/VDtC8h/SLkgDImGs5JqJJSC9gFsudDtQlRGYWdmnv8pQnBFfcrIHLoMvGSy5xosiDyz/UrbwXx87VZboJ+f5fuJPz+sHTNTrBC4msZ7CN9yVpboXp3KiOtQNy8ij15mcaS56gZaPNRKzMgySKH/un+7eavNiCdx/nO0sALgEwKPKoFddYZu0biftqMried8zdJwb1XfRDUHMAUDFF4LqzrDlzRr8wB1K/cavXhWMOILpzQ9Q7UOwY4V3I1/QCkzb1OprDtLl/b9ooY+pLgyQJz6R5Uo2Dib/CbzHBRmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwDG6aOvHaB+SyNb4+MQTf1b8dAr/iBanyTzICdaKNs=;
 b=Pwpa9oEHpKJZErPwuef9tcRt3oJv/FWNzg3IE+KXn1uPsAGoxqHiV2b71hLjDFYwxddNu57+31nw9t33pR9ti83cE9s5bRadQbA9lf9XCQmt9bAxsDjI0tw+C0PbGsHDWWepeHdh592rh5xhZqPIoGELojTH1RHEGplCFPGnxizroIDWVNdkm3AXyO2VVb/1fAeNu+PjYoo9w0r+2oRVoJPZRgJUZTg9pqR2sFKfP9iyFB2FD4czBfE0XUve0KsM3ZrRlYKcxTfkEot5ZJqkZaVrIyG++iBd6xkBzWAhVsmm6RYcb4TWkPHgD73/Nk2ZNli6TU1+EY0EKXF8capKzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d3::11)
 by MA0P287MB0466.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:bf::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.19; Sat, 14 Mar
 2026 12:25:19 +0000
Received: from PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7]) by PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 ([fe80::82b3:36a9:de62:6aa7%5]) with mapi id 15.20.9700.018; Sat, 14 Mar 2026
 12:25:19 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: i2c: imx412: Convert to CCI register access helpers
Date: Sat, 14 Mar 2026 17:54:37 +0530
Message-Id: <20260314122442.109356-2-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260314122442.109356-1-elgin.perumbilly@siliconsignals.io>
References: <20260314122442.109356-1-elgin.perumbilly@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0013.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::32) To PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1d3::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB2188:EE_|MA0P287MB0466:EE_
X-MS-Office365-Filtering-Correlation-Id: 8372aee2-aea2-44aa-1347-08de81c4c19e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	i0Ynho4e15+Hnw1m4vW4KzjFqYwC7a0aty25s60nCNRpjCxmqON7jnwJFiTF7b1cbwIpLvia4vTbBSucjy3jlOFiv56hNjgjbDeIC54U5Osq3kE3dbHi7X0gIM30rIAX7XIVPSSie6XC72Ec7/eRo7Sc6wDgJqNgbIroATI560HHFM8F70PZtT6dmJOWav5peK1KJLWLH3OZhjud52bgSicdtbkgC5CaTEBb9LIWKL08dYRx19/0rxzFndr+ygRD3IUdhI26Uu+sZlf6YYh2IdfmcfEcXPiqRaj/KVPzO7BgWMRgp5sCGm0ge+sLscArzsSXifBGrh/iwOkNY9IOACwqBwUnME9les6fP7tA1Kz30lJUVVp9/9br6CFETTFbWbw/QXEJ0CNx6eG1S+f+kFzrlJA4xbkVpMkBzhX2RRDQqtSFkPtnO+mF5ybXavpWNTuK4AR5Ce1Q1Y1+pTQbd3hVQGdsG7MBWUvXnv5mjcx45LXIvpnSvFp7EQk3u0nTZWIvrBVZ+pX/oHkvoAwSE3KNDdeDrHP9G6N/AqT6V7/9f4qkS94dIKnNE+WpBqJQM7WBi6UK7VZ5SFLdddaEQN1dwsMkjmknpVCFeLSK6qZORodV1MMxW03FDKFFwTutUvHZDG6U4lh5JXTDIFwJlK9pRmcfJ4+f7KrgYNRak2xKMPcaCm2VFfNvc2dzlgzju3ms7ZnM1Zk7qiXhzh3WOBeFOdm7IyhSG/gNs0xZ6r7qv7ZE8Y8hqQXAKU8g8i/ndo6LlXZuWWgT0B1+KmCd6jhzMJ+Q1/Gy0+bZjB+9xeQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB2188.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CgF/ieI+z7v5LtUNRNUHkSNJ56HJDNeVVZybFsJjbMeNkEY00rBMdK7fw1Rg?=
 =?us-ascii?Q?1fveHkP5Yo2RyBsTf8TP0y8n+V+WEDQ1Zrqxr4nrEfgrfLULbEpZOukeFqQL?=
 =?us-ascii?Q?CUpp7aE//UfVPLFgCqKimZugLwYTFfnsZFt9ZST1OzAo4KP31ouodXMXILhM?=
 =?us-ascii?Q?QEXvZlv7l97KfeuzJ9apuk+PUcgxKY1kxRlsiGtuoY8igxhqhicaJpEWTwFf?=
 =?us-ascii?Q?NCe7fZv3TPCXYokxXcDEMKcgNlGZYYNL5dqyr3JRwoRq+8qJ3hsQQgYO3j0n?=
 =?us-ascii?Q?XWkz57wgOHWYlw9OJ4JLWUrp/izwAfueAqX58eebWWABsrpipQYB51MwElyS?=
 =?us-ascii?Q?Mvo+F10vRMl4O2fpOrsFAV9ibWzDHanbA4nwmb6ClhRvTfowXGR3egBp40XT?=
 =?us-ascii?Q?AVkfEbVArZHvDGysyv8wNv9FGF6qSeVj5kbgyxVJnYLQTFdOTJGKMqcVmyrp?=
 =?us-ascii?Q?7tQ89izfmMKxJFYlJX3oWopyaMoEwJ5PWfrpHA8ewz1Yl0VCPRaYJG5DiZvc?=
 =?us-ascii?Q?QIqs2jC9KUpnpd6YmzXe1Pxu5jKNTlYcL0n383xdywQ5biVq2/ICMhNqhFP1?=
 =?us-ascii?Q?fWyE+9jc5xVvlLj8xWbVELgtDR2xk99zNt5jgd68+yBw5Nui7tLQ/SViwhBw?=
 =?us-ascii?Q?A1wyaRqRO2GgPcqdTFgA4T5HTBtHGm0sIk4IkuoHhlId336r/ZNVU/ts76lx?=
 =?us-ascii?Q?it/ddClFn+o9W448jo7AgCd0Szb66qKuIGQh+TmcjVvlgRP0krT8innmLuvz?=
 =?us-ascii?Q?8dDEBZhJT4s+n/yZb0z2ZhUHjql8XtIt7WZPuwVFnP55usLA4UOEbPrMJo/t?=
 =?us-ascii?Q?6oF0j8A0XtGe6fKQxCqBUq9ICqw26XRceEMslhaI88+obErbdYuNECjwcdb+?=
 =?us-ascii?Q?It7c2+uc+hIkH4jbXbd/WDBHgdl/a4OKhzqDaR+QiNSHuPU3BPu8RKsBG77H?=
 =?us-ascii?Q?NjEn2LKfnuHqIa50LA1xrJsxT9f4StYBero6wE0luz/ZWJy8jjfTuFYikZhS?=
 =?us-ascii?Q?2b1QTs/rzI0RQQd9Tp6K2rJQZsSqvfU+wIqP5FStrBDus5Zwn4BMns9xI2aQ?=
 =?us-ascii?Q?KvERjI36qo1bkbWl/4EG2g4kMpt97xvlIAlENQHOoKihrMJmfPjTd/Pgdshn?=
 =?us-ascii?Q?FbAKFt1+ZgEkGm0mBr9d5/zoocnqgAncXYwCQsz4WzFTeIGNsz3t7x8SG/FN?=
 =?us-ascii?Q?imXaM/CxRbQVAwidcroGNQ173W7vlGaI0Z890Gbv24by74l16Mad6Cl/l7zU?=
 =?us-ascii?Q?GLx1kuHBxW7qGDn413lFRZs7TvQQyFY+BWtrv1o+lWpaKZsVwb0Z+3192ifB?=
 =?us-ascii?Q?24hnt3Q4F7i1v5kut9yyr7vrAorfskOEJ8qQEM4GYNM2tthQFKk/yswmFT3F?=
 =?us-ascii?Q?1llUT0a67WxoHRAvVtSsrcuU1ByKYd+BCcGgrrTNod5bkvZdRbXsGr2eSR3j?=
 =?us-ascii?Q?ft4VOwtGS03XGksdliwgG27R5+gHixcjA0h3TV4bS+7Y3DrZKPh703bm/t2S?=
 =?us-ascii?Q?k/HW/CyqQeioAOoYbNC2qgCF+PYljvWuibTKsGd9XQeL46qx3TDPbhUsix6Z?=
 =?us-ascii?Q?1Z7NlPfyWFGJj5ykH0YiI+L6EpwETdv7c4qjhFDlA9YFqCkLorCoi1JglNhR?=
 =?us-ascii?Q?c9ve2xOaR3mQuXrXTzsL4Cn5j0rFpsAXpaeU5D+tQLhSp0RKVhN1zL4Tx1Ek?=
 =?us-ascii?Q?urulq0K+BfXShd5ePbwylT37f0JvvPMzESwtwfKILDeiyfebcS/wRlPbMGWj?=
 =?us-ascii?Q?KgKltVOnpBrYTOSuY9yxbYNaN1E4Cps=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8372aee2-aea2-44aa-1347-08de81c4c19e
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB2188.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2026 12:25:19.6597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sc763wdIICRKQsnnxKU0OWg3bXlVgvPHc74hPo+MGQl4lcEJbqtEVDVtgfBuUucNVPNnVVUe5cgjSVWbRvGUI1kjM/zju76+LnA5FRPiCJ8Hr+jnaAyn64H3LB51xylx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0466
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,windriver.com,ideasonboard.com,foss.st.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55799-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7499A28D1EA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Use the new common CCI register access helpers to replace the private
register access helpers in the imx412 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx412.c | 635 ++++++++++++++++---------------------
 2 files changed, 271 insertions(+), 365 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 20482be35f26..1881da7a3967 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -269,6 +269,7 @@ config VIDEO_IMX355
 config VIDEO_IMX412
 	tristate "Sony IMX412 sensor support"
 	depends on OF_GPIO
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the Sony
 	  IMX412 camera.
diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index e25e0a9ff65c..13d6fe79dcf7 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -13,38 +13,39 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>

+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-fwnode.h>
 #include <media/v4l2-subdev.h>

 /* Streaming Mode */
-#define IMX412_REG_MODE_SELECT	0x0100
+#define IMX412_REG_MODE_SELECT	CCI_REG8(0x0100)
 #define IMX412_MODE_STANDBY	0x00
 #define IMX412_MODE_STREAMING	0x01

 /* Lines per frame */
-#define IMX412_REG_LPFR		0x0340
+#define IMX412_REG_LPFR		CCI_REG16(0x0340)

 /* Chip ID */
-#define IMX412_REG_ID		0x0016
+#define IMX412_REG_ID		CCI_REG16(0x0016)
 #define IMX412_ID		0x577

 /* Exposure control */
-#define IMX412_REG_EXPOSURE_CIT	0x0202
+#define IMX412_REG_EXPOSURE_CIT	CCI_REG16(0x0202)
 #define IMX412_EXPOSURE_MIN	8
 #define IMX412_EXPOSURE_OFFSET	22
 #define IMX412_EXPOSURE_STEP	1
 #define IMX412_EXPOSURE_DEFAULT	0x0648

 /* Analog gain control */
-#define IMX412_REG_AGAIN	0x0204
+#define IMX412_REG_AGAIN	CCI_REG16(0x0204)
 #define IMX412_AGAIN_MIN	0
 #define IMX412_AGAIN_MAX	978
 #define IMX412_AGAIN_STEP	1
 #define IMX412_AGAIN_DEFAULT	0

 /* Group hold register */
-#define IMX412_REG_HOLD		0x0104
+#define IMX412_REG_HOLD		CCI_REG8(0x0104)

 /* Input clock rate */
 #define IMX412_INCLK_RATE	24000000
@@ -56,16 +57,6 @@
 #define IMX412_REG_MIN		0x00
 #define IMX412_REG_MAX		0xffff

-/**
- * struct imx412_reg - imx412 sensor register
- * @address: Register address
- * @val: Register value
- */
-struct imx412_reg {
-	u16 address;
-	u8 val;
-};
-
 /**
  * struct imx412_reg_list - imx412 sensor register list
  * @num_of_regs: Number of registers in the list
@@ -73,7 +64,7 @@ struct imx412_reg {
  */
 struct imx412_reg_list {
 	u32 num_of_regs;
-	const struct imx412_reg *regs;
+	const struct cci_reg_sequence *regs;
 };

 /**
@@ -111,6 +102,7 @@ static const char * const imx412_supply_names[] = {
 /**
  * struct imx412 - imx412 sensor device structure
  * @dev: Pointer to generic device
+ * @cci: CCI register map
  * @client: Pointer to i2c client
  * @sd: V4L2 sub-device
  * @pad: Media pad. Only one pad supported
@@ -130,6 +122,7 @@ static const char * const imx412_supply_names[] = {
  */
 struct imx412 {
 	struct device *dev;
+	struct regmap *cci;
 	struct i2c_client *client;
 	struct v4l2_subdev sd;
 	struct media_pad pad;
@@ -155,238 +148,238 @@ static const s64 link_freq[] = {
 };

 /* Sensor mode registers */
-static const struct imx412_reg mode_4056x3040_regs[] = {
-	{0x0136, 0x18},
-	{0x0137, 0x00},
-	{0x3c7e, 0x08},
-	{0x3c7f, 0x02},
-	{0x38a8, 0x1f},
-	{0x38a9, 0xff},
-	{0x38aa, 0x1f},
-	{0x38ab, 0xff},
-	{0x55d4, 0x00},
-	{0x55d5, 0x00},
-	{0x55d6, 0x07},
-	{0x55d7, 0xff},
-	{0x55e8, 0x07},
-	{0x55e9, 0xff},
-	{0x55ea, 0x00},
-	{0x55eb, 0x00},
-	{0x575c, 0x07},
-	{0x575d, 0xff},
-	{0x575e, 0x00},
-	{0x575f, 0x00},
-	{0x5764, 0x00},
-	{0x5765, 0x00},
-	{0x5766, 0x07},
-	{0x5767, 0xff},
-	{0x5974, 0x04},
-	{0x5975, 0x01},
-	{0x5f10, 0x09},
-	{0x5f11, 0x92},
-	{0x5f12, 0x32},
-	{0x5f13, 0x72},
-	{0x5f14, 0x16},
-	{0x5f15, 0xba},
-	{0x5f17, 0x13},
-	{0x5f18, 0x24},
-	{0x5f19, 0x60},
-	{0x5f1a, 0xe3},
-	{0x5f1b, 0xad},
-	{0x5f1c, 0x74},
-	{0x5f2d, 0x25},
-	{0x5f5c, 0xd0},
-	{0x6a22, 0x00},
-	{0x6a23, 0x1d},
-	{0x7ba8, 0x00},
-	{0x7ba9, 0x00},
-	{0x886b, 0x00},
-	{0x9002, 0x0a},
-	{0x9004, 0x1a},
-	{0x9214, 0x93},
-	{0x9215, 0x69},
-	{0x9216, 0x93},
-	{0x9217, 0x6b},
-	{0x9218, 0x93},
-	{0x9219, 0x6d},
-	{0x921a, 0x57},
-	{0x921b, 0x58},
-	{0x921c, 0x57},
-	{0x921d, 0x59},
-	{0x921e, 0x57},
-	{0x921f, 0x5a},
-	{0x9220, 0x57},
-	{0x9221, 0x5b},
-	{0x9222, 0x93},
-	{0x9223, 0x02},
-	{0x9224, 0x93},
-	{0x9225, 0x03},
-	{0x9226, 0x93},
-	{0x9227, 0x04},
-	{0x9228, 0x93},
-	{0x9229, 0x05},
-	{0x922a, 0x98},
-	{0x922b, 0x21},
-	{0x922c, 0xb2},
-	{0x922d, 0xdb},
-	{0x922e, 0xb2},
-	{0x922f, 0xdc},
-	{0x9230, 0xb2},
-	{0x9231, 0xdd},
-	{0x9232, 0xe2},
-	{0x9233, 0xe1},
-	{0x9234, 0xb2},
-	{0x9235, 0xe2},
-	{0x9236, 0xb2},
-	{0x9237, 0xe3},
-	{0x9238, 0xb7},
-	{0x9239, 0xb9},
-	{0x923a, 0xb7},
-	{0x923b, 0xbb},
-	{0x923c, 0xb7},
-	{0x923d, 0xbc},
-	{0x923e, 0xb7},
-	{0x923f, 0xc5},
-	{0x9240, 0xb7},
-	{0x9241, 0xc7},
-	{0x9242, 0xb7},
-	{0x9243, 0xc9},
-	{0x9244, 0x98},
-	{0x9245, 0x56},
-	{0x9246, 0x98},
-	{0x9247, 0x55},
-	{0x9380, 0x00},
-	{0x9381, 0x62},
-	{0x9382, 0x00},
-	{0x9383, 0x56},
-	{0x9384, 0x00},
-	{0x9385, 0x52},
-	{0x9388, 0x00},
-	{0x9389, 0x55},
-	{0x938a, 0x00},
-	{0x938b, 0x55},
-	{0x938c, 0x00},
-	{0x938d, 0x41},
-	{0x5078, 0x01},
-	{0x0112, 0x0a},
-	{0x0113, 0x0a},
-	{0x0114, 0x03},
-	{0x0342, 0x11},
-	{0x0343, 0xa0},
-	{0x0340, 0x0d},
-	{0x0341, 0xda},
-	{0x3210, 0x00},
-	{0x0344, 0x00},
-	{0x0345, 0x00},
-	{0x0346, 0x00},
-	{0x0347, 0x00},
-	{0x0348, 0x0f},
-	{0x0349, 0xd7},
-	{0x034a, 0x0b},
-	{0x034b, 0xdf},
-	{0x00e3, 0x00},
-	{0x00e4, 0x00},
-	{0x00e5, 0x01},
-	{0x00fc, 0x0a},
-	{0x00fd, 0x0a},
-	{0x00fe, 0x0a},
-	{0x00ff, 0x0a},
-	{0xe013, 0x00},
-	{0x0220, 0x00},
-	{0x0221, 0x11},
-	{0x0381, 0x01},
-	{0x0383, 0x01},
-	{0x0385, 0x01},
-	{0x0387, 0x01},
-	{0x0900, 0x00},
-	{0x0901, 0x11},
-	{0x0902, 0x00},
-	{0x3140, 0x02},
-	{0x3241, 0x11},
-	{0x3250, 0x03},
-	{0x3e10, 0x00},
-	{0x3e11, 0x00},
-	{0x3f0d, 0x00},
-	{0x3f42, 0x00},
-	{0x3f43, 0x00},
-	{0x0401, 0x00},
-	{0x0404, 0x00},
-	{0x0405, 0x10},
-	{0x0408, 0x00},
-	{0x0409, 0x00},
-	{0x040a, 0x00},
-	{0x040b, 0x00},
-	{0x040c, 0x0f},
-	{0x040d, 0xd8},
-	{0x040e, 0x0b},
-	{0x040f, 0xe0},
-	{0x034c, 0x0f},
-	{0x034d, 0xd8},
-	{0x034e, 0x0b},
-	{0x034f, 0xe0},
-	{0x0301, 0x05},
-	{0x0303, 0x02},
-	{0x0305, 0x04},
-	{0x0306, 0x00},
-	{0x0307, 0xc8},
-	{0x0309, 0x0a},
-	{0x030b, 0x01},
-	{0x030d, 0x02},
-	{0x030e, 0x01},
-	{0x030f, 0x5e},
-	{0x0310, 0x00},
-	{0x0820, 0x12},
-	{0x0821, 0xc0},
-	{0x0822, 0x00},
-	{0x0823, 0x00},
-	{0x3e20, 0x01},
-	{0x3e37, 0x00},
-	{0x3f50, 0x00},
-	{0x3f56, 0x00},
-	{0x3f57, 0xe2},
-	{0x3c0a, 0x5a},
-	{0x3c0b, 0x55},
-	{0x3c0c, 0x28},
-	{0x3c0d, 0x07},
-	{0x3c0e, 0xff},
-	{0x3c0f, 0x00},
-	{0x3c10, 0x00},
-	{0x3c11, 0x02},
-	{0x3c12, 0x00},
-	{0x3c13, 0x03},
-	{0x3c14, 0x00},
-	{0x3c15, 0x00},
-	{0x3c16, 0x0c},
-	{0x3c17, 0x0c},
-	{0x3c18, 0x0c},
-	{0x3c19, 0x0a},
-	{0x3c1a, 0x0a},
-	{0x3c1b, 0x0a},
-	{0x3c1c, 0x00},
-	{0x3c1d, 0x00},
-	{0x3c1e, 0x00},
-	{0x3c1f, 0x00},
-	{0x3c20, 0x00},
-	{0x3c21, 0x00},
-	{0x3c22, 0x3f},
-	{0x3c23, 0x0a},
-	{0x3e35, 0x01},
-	{0x3f4a, 0x03},
-	{0x3f4b, 0xbf},
-	{0x3f26, 0x00},
-	{0x0202, 0x0d},
-	{0x0203, 0xc4},
-	{0x0204, 0x00},
-	{0x0205, 0x00},
-	{0x020e, 0x01},
-	{0x020f, 0x00},
-	{0x0210, 0x01},
-	{0x0211, 0x00},
-	{0x0212, 0x01},
-	{0x0213, 0x00},
-	{0x0214, 0x01},
-	{0x0215, 0x00},
-	{0xbcf1, 0x00},
+static const struct cci_reg_sequence mode_4056x3040_regs[] = {
+	{ CCI_REG8(0x0136), 0x18 },
+	{ CCI_REG8(0x0137), 0x00 },
+	{ CCI_REG8(0x3c7e), 0x08 },
+	{ CCI_REG8(0x3c7f), 0x02 },
+	{ CCI_REG8(0x38a8), 0x1f },
+	{ CCI_REG8(0x38a9), 0xff },
+	{ CCI_REG8(0x38aa), 0x1f },
+	{ CCI_REG8(0x38ab), 0xff },
+	{ CCI_REG8(0x55d4), 0x00 },
+	{ CCI_REG8(0x55d5), 0x00 },
+	{ CCI_REG8(0x55d6), 0x07 },
+	{ CCI_REG8(0x55d7), 0xff },
+	{ CCI_REG8(0x55e8), 0x07 },
+	{ CCI_REG8(0x55e9), 0xff },
+	{ CCI_REG8(0x55ea), 0x00 },
+	{ CCI_REG8(0x55eb), 0x00 },
+	{ CCI_REG8(0x575c), 0x07 },
+	{ CCI_REG8(0x575d), 0xff },
+	{ CCI_REG8(0x575e), 0x00 },
+	{ CCI_REG8(0x575f), 0x00 },
+	{ CCI_REG8(0x5764), 0x00 },
+	{ CCI_REG8(0x5765), 0x00 },
+	{ CCI_REG8(0x5766), 0x07 },
+	{ CCI_REG8(0x5767), 0xff },
+	{ CCI_REG8(0x5974), 0x04 },
+	{ CCI_REG8(0x5975), 0x01 },
+	{ CCI_REG8(0x5f10), 0x09 },
+	{ CCI_REG8(0x5f11), 0x92 },
+	{ CCI_REG8(0x5f12), 0x32 },
+	{ CCI_REG8(0x5f13), 0x72 },
+	{ CCI_REG8(0x5f14), 0x16 },
+	{ CCI_REG8(0x5f15), 0xba },
+	{ CCI_REG8(0x5f17), 0x13 },
+	{ CCI_REG8(0x5f18), 0x24 },
+	{ CCI_REG8(0x5f19), 0x60 },
+	{ CCI_REG8(0x5f1a), 0xe3 },
+	{ CCI_REG8(0x5f1b), 0xad },
+	{ CCI_REG8(0x5f1c), 0x74 },
+	{ CCI_REG8(0x5f2d), 0x25 },
+	{ CCI_REG8(0x5f5c), 0xd0 },
+	{ CCI_REG8(0x6a22), 0x00 },
+	{ CCI_REG8(0x6a23), 0x1d },
+	{ CCI_REG8(0x7ba8), 0x00 },
+	{ CCI_REG8(0x7ba9), 0x00 },
+	{ CCI_REG8(0x886b), 0x00 },
+	{ CCI_REG8(0x9002), 0x0a },
+	{ CCI_REG8(0x9004), 0x1a },
+	{ CCI_REG8(0x9214), 0x93 },
+	{ CCI_REG8(0x9215), 0x69 },
+	{ CCI_REG8(0x9216), 0x93 },
+	{ CCI_REG8(0x9217), 0x6b },
+	{ CCI_REG8(0x9218), 0x93 },
+	{ CCI_REG8(0x9219), 0x6d },
+	{ CCI_REG8(0x921a), 0x57 },
+	{ CCI_REG8(0x921b), 0x58 },
+	{ CCI_REG8(0x921c), 0x57 },
+	{ CCI_REG8(0x921d), 0x59 },
+	{ CCI_REG8(0x921e), 0x57 },
+	{ CCI_REG8(0x921f), 0x5a },
+	{ CCI_REG8(0x9220), 0x57 },
+	{ CCI_REG8(0x9221), 0x5b },
+	{ CCI_REG8(0x9222), 0x93 },
+	{ CCI_REG8(0x9223), 0x02 },
+	{ CCI_REG8(0x9224), 0x93 },
+	{ CCI_REG8(0x9225), 0x03 },
+	{ CCI_REG8(0x9226), 0x93 },
+	{ CCI_REG8(0x9227), 0x04 },
+	{ CCI_REG8(0x9228), 0x93 },
+	{ CCI_REG8(0x9229), 0x05 },
+	{ CCI_REG8(0x922a), 0x98 },
+	{ CCI_REG8(0x922b), 0x21 },
+	{ CCI_REG8(0x922c), 0xb2 },
+	{ CCI_REG8(0x922d), 0xdb },
+	{ CCI_REG8(0x922e), 0xb2 },
+	{ CCI_REG8(0x922f), 0xdc },
+	{ CCI_REG8(0x9230), 0xb2 },
+	{ CCI_REG8(0x9231), 0xdd },
+	{ CCI_REG8(0x9232), 0xe2 },
+	{ CCI_REG8(0x9233), 0xe1 },
+	{ CCI_REG8(0x9234), 0xb2 },
+	{ CCI_REG8(0x9235), 0xe2 },
+	{ CCI_REG8(0x9236), 0xb2 },
+	{ CCI_REG8(0x9237), 0xe3 },
+	{ CCI_REG8(0x9238), 0xb7 },
+	{ CCI_REG8(0x9239), 0xb9 },
+	{ CCI_REG8(0x923a), 0xb7 },
+	{ CCI_REG8(0x923b), 0xbb },
+	{ CCI_REG8(0x923c), 0xb7 },
+	{ CCI_REG8(0x923d), 0xbc },
+	{ CCI_REG8(0x923e), 0xb7 },
+	{ CCI_REG8(0x923f), 0xc5 },
+	{ CCI_REG8(0x9240), 0xb7 },
+	{ CCI_REG8(0x9241), 0xc7 },
+	{ CCI_REG8(0x9242), 0xb7 },
+	{ CCI_REG8(0x9243), 0xc9 },
+	{ CCI_REG8(0x9244), 0x98 },
+	{ CCI_REG8(0x9245), 0x56 },
+	{ CCI_REG8(0x9246), 0x98 },
+	{ CCI_REG8(0x9247), 0x55 },
+	{ CCI_REG8(0x9380), 0x00 },
+	{ CCI_REG8(0x9381), 0x62 },
+	{ CCI_REG8(0x9382), 0x00 },
+	{ CCI_REG8(0x9383), 0x56 },
+	{ CCI_REG8(0x9384), 0x00 },
+	{ CCI_REG8(0x9385), 0x52 },
+	{ CCI_REG8(0x9388), 0x00 },
+	{ CCI_REG8(0x9389), 0x55 },
+	{ CCI_REG8(0x938a), 0x00 },
+	{ CCI_REG8(0x938b), 0x55 },
+	{ CCI_REG8(0x938c), 0x00 },
+	{ CCI_REG8(0x938d), 0x41 },
+	{ CCI_REG8(0x5078), 0x01 },
+	{ CCI_REG8(0x0112), 0x0a },
+	{ CCI_REG8(0x0113), 0x0a },
+	{ CCI_REG8(0x0114), 0x03 },
+	{ CCI_REG8(0x0342), 0x11 },
+	{ CCI_REG8(0x0343), 0xa0 },
+	{ CCI_REG8(0x0340), 0x0d },
+	{ CCI_REG8(0x0341), 0xda },
+	{ CCI_REG8(0x3210), 0x00 },
+	{ CCI_REG8(0x0344), 0x00 },
+	{ CCI_REG8(0x0345), 0x00 },
+	{ CCI_REG8(0x0346), 0x00 },
+	{ CCI_REG8(0x0347), 0x00 },
+	{ CCI_REG8(0x0348), 0x0f },
+	{ CCI_REG8(0x0349), 0xd7 },
+	{ CCI_REG8(0x034a), 0x0b },
+	{ CCI_REG8(0x034b), 0xdf },
+	{ CCI_REG8(0x00e3), 0x00 },
+	{ CCI_REG8(0x00e4), 0x00 },
+	{ CCI_REG8(0x00e5), 0x01 },
+	{ CCI_REG8(0x00fc), 0x0a },
+	{ CCI_REG8(0x00fd), 0x0a },
+	{ CCI_REG8(0x00fe), 0x0a },
+	{ CCI_REG8(0x00ff), 0x0a },
+	{ CCI_REG8(0xe013), 0x00 },
+	{ CCI_REG8(0x0220), 0x00 },
+	{ CCI_REG8(0x0221), 0x11 },
+	{ CCI_REG8(0x0381), 0x01 },
+	{ CCI_REG8(0x0383), 0x01 },
+	{ CCI_REG8(0x0385), 0x01 },
+	{ CCI_REG8(0x0387), 0x01 },
+	{ CCI_REG8(0x0900), 0x00 },
+	{ CCI_REG8(0x0901), 0x11 },
+	{ CCI_REG8(0x0902), 0x00 },
+	{ CCI_REG8(0x3140), 0x02 },
+	{ CCI_REG8(0x3241), 0x11 },
+	{ CCI_REG8(0x3250), 0x03 },
+	{ CCI_REG8(0x3e10), 0x00 },
+	{ CCI_REG8(0x3e11), 0x00 },
+	{ CCI_REG8(0x3f0d), 0x00 },
+	{ CCI_REG8(0x3f42), 0x00 },
+	{ CCI_REG8(0x3f43), 0x00 },
+	{ CCI_REG8(0x0401), 0x00 },
+	{ CCI_REG8(0x0404), 0x00 },
+	{ CCI_REG8(0x0405), 0x10 },
+	{ CCI_REG8(0x0408), 0x00 },
+	{ CCI_REG8(0x0409), 0x00 },
+	{ CCI_REG8(0x040a), 0x00 },
+	{ CCI_REG8(0x040b), 0x00 },
+	{ CCI_REG8(0x040c), 0x0f },
+	{ CCI_REG8(0x040d), 0xd8 },
+	{ CCI_REG8(0x040e), 0x0b },
+	{ CCI_REG8(0x040f), 0xe0 },
+	{ CCI_REG8(0x034c), 0x0f },
+	{ CCI_REG8(0x034d), 0xd8 },
+	{ CCI_REG8(0x034e), 0x0b },
+	{ CCI_REG8(0x034f), 0xe0 },
+	{ CCI_REG8(0x0301), 0x05 },
+	{ CCI_REG8(0x0303), 0x02 },
+	{ CCI_REG8(0x0305), 0x04 },
+	{ CCI_REG8(0x0306), 0x00 },
+	{ CCI_REG8(0x0307), 0xc8 },
+	{ CCI_REG8(0x0309), 0x0a },
+	{ CCI_REG8(0x030b), 0x01 },
+	{ CCI_REG8(0x030d), 0x02 },
+	{ CCI_REG8(0x030e), 0x01 },
+	{ CCI_REG8(0x030f), 0x5e },
+	{ CCI_REG8(0x0310), 0x00 },
+	{ CCI_REG8(0x0820), 0x12 },
+	{ CCI_REG8(0x0821), 0xc0 },
+	{ CCI_REG8(0x0822), 0x00 },
+	{ CCI_REG8(0x0823), 0x00 },
+	{ CCI_REG8(0x3e20), 0x01 },
+	{ CCI_REG8(0x3e37), 0x00 },
+	{ CCI_REG8(0x3f50), 0x00 },
+	{ CCI_REG8(0x3f56), 0x00 },
+	{ CCI_REG8(0x3f57), 0xe2 },
+	{ CCI_REG8(0x3c0a), 0x5a },
+	{ CCI_REG8(0x3c0b), 0x55 },
+	{ CCI_REG8(0x3c0c), 0x28 },
+	{ CCI_REG8(0x3c0d), 0x07 },
+	{ CCI_REG8(0x3c0e), 0xff },
+	{ CCI_REG8(0x3c0f), 0x00 },
+	{ CCI_REG8(0x3c10), 0x00 },
+	{ CCI_REG8(0x3c11), 0x02 },
+	{ CCI_REG8(0x3c12), 0x00 },
+	{ CCI_REG8(0x3c13), 0x03 },
+	{ CCI_REG8(0x3c14), 0x00 },
+	{ CCI_REG8(0x3c15), 0x00 },
+	{ CCI_REG8(0x3c16), 0x0c },
+	{ CCI_REG8(0x3c17), 0x0c },
+	{ CCI_REG8(0x3c18), 0x0c },
+	{ CCI_REG8(0x3c19), 0x0a },
+	{ CCI_REG8(0x3c1a), 0x0a },
+	{ CCI_REG8(0x3c1b), 0x0a },
+	{ CCI_REG8(0x3c1c), 0x00 },
+	{ CCI_REG8(0x3c1d), 0x00 },
+	{ CCI_REG8(0x3c1e), 0x00 },
+	{ CCI_REG8(0x3c1f), 0x00 },
+	{ CCI_REG8(0x3c20), 0x00 },
+	{ CCI_REG8(0x3c21), 0x00 },
+	{ CCI_REG8(0x3c22), 0x3f },
+	{ CCI_REG8(0x3c23), 0x0a },
+	{ CCI_REG8(0x3e35), 0x01 },
+	{ CCI_REG8(0x3f4a), 0x03 },
+	{ CCI_REG8(0x3f4b), 0xbf },
+	{ CCI_REG8(0x3f26), 0x00 },
+	{ CCI_REG8(0x0202), 0x0d },
+	{ CCI_REG8(0x0203), 0xc4 },
+	{ CCI_REG8(0x0204), 0x00 },
+	{ CCI_REG8(0x0205), 0x00 },
+	{ CCI_REG8(0x020e), 0x01 },
+	{ CCI_REG8(0x020f), 0x00 },
+	{ CCI_REG8(0x0210), 0x01 },
+	{ CCI_REG8(0x0211), 0x00 },
+	{ CCI_REG8(0x0212), 0x01 },
+	{ CCI_REG8(0x0213), 0x00 },
+	{ CCI_REG8(0x0214), 0x01 },
+	{ CCI_REG8(0x0215), 0x00 },
+	{ CCI_REG8(0xbcf1), 0x00 },
 };

 /* Supported sensor mode configurations */
@@ -417,97 +410,6 @@ static inline struct imx412 *to_imx412(struct v4l2_subdev *subdev)
 	return container_of(subdev, struct imx412, sd);
 }

-/**
- * imx412_read_reg() - Read registers.
- * @imx412: pointer to imx412 device
- * @reg: register address
- * @len: length of bytes to read. Max supported bytes is 4
- * @val: pointer to register value to be filled.
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx412_read_reg(struct imx412 *imx412, u16 reg, u32 len, u32 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx412->sd);
-	struct i2c_msg msgs[2] = {0};
-	u8 addr_buf[2] = {0};
-	u8 data_buf[4] = {0};
-	int ret;
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, addr_buf);
-
-	/* Write register address */
-	msgs[0].addr = client->addr;
-	msgs[0].flags = 0;
-	msgs[0].len = ARRAY_SIZE(addr_buf);
-	msgs[0].buf = addr_buf;
-
-	/* Read data from register */
-	msgs[1].addr = client->addr;
-	msgs[1].flags = I2C_M_RD;
-	msgs[1].len = len;
-	msgs[1].buf = &data_buf[4 - len];
-
-	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
-	if (ret != ARRAY_SIZE(msgs))
-		return -EIO;
-
-	*val = get_unaligned_be32(data_buf);
-
-	return 0;
-}
-
-/**
- * imx412_write_reg() - Write register
- * @imx412: pointer to imx412 device
- * @reg: register address
- * @len: length of bytes. Max supported bytes is 4
- * @val: register value
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx412_write_reg(struct imx412 *imx412, u16 reg, u32 len, u32 val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(&imx412->sd);
-	u8 buf[6] = {0};
-
-	if (WARN_ON(len > 4))
-		return -EINVAL;
-
-	put_unaligned_be16(reg, buf);
-	put_unaligned_be32(val << (8 * (4 - len)), buf + 2);
-	if (i2c_master_send(client, buf, len + 2) != len + 2)
-		return -EIO;
-
-	return 0;
-}
-
-/**
- * imx412_write_regs() - Write a list of registers
- * @imx412: pointer to imx412 device
- * @regs: list of registers to be written
- * @len: length of registers array
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx412_write_regs(struct imx412 *imx412,
-			     const struct imx412_reg *regs, u32 len)
-{
-	unsigned int i;
-	int ret;
-
-	for (i = 0; i < len; i++) {
-		ret = imx412_write_reg(imx412, regs[i].address, 1, regs[i].val);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 /**
  * imx412_update_controls() - Update control ranges based on streaming mode
  * @imx412: pointer to imx412 device
@@ -543,29 +445,25 @@ static int imx412_update_controls(struct imx412 *imx412,
 static int imx412_update_exp_gain(struct imx412 *imx412, u32 exposure, u32 gain)
 {
 	u32 lpfr;
-	int ret;
+	int ret = 0;
+	int ret_hold;

 	lpfr = imx412->vblank + imx412->cur_mode->height;

 	dev_dbg(imx412->dev, "Set exp %u, analog gain %u, lpfr %u\n",
 		exposure, gain, lpfr);

-	ret = imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 1);
-	if (ret)
-		return ret;
+	cci_write(imx412->cci, IMX412_REG_HOLD, 1, &ret);

-	ret = imx412_write_reg(imx412, IMX412_REG_LPFR, 2, lpfr);
-	if (ret)
-		goto error_release_group_hold;
+	cci_write(imx412->cci, IMX412_REG_LPFR, lpfr, &ret);

-	ret = imx412_write_reg(imx412, IMX412_REG_EXPOSURE_CIT, 2, exposure);
-	if (ret)
-		goto error_release_group_hold;
+	cci_write(imx412->cci, IMX412_REG_EXPOSURE_CIT, exposure, &ret);

-	ret = imx412_write_reg(imx412, IMX412_REG_AGAIN, 2, gain);
+	cci_write(imx412->cci, IMX412_REG_AGAIN, gain, &ret);

-error_release_group_hold:
-	imx412_write_reg(imx412, IMX412_REG_HOLD, 1, 0);
+	ret_hold = cci_write(imx412->cci, IMX412_REG_HOLD, 0, NULL);
+	if (ret_hold)
+		return ret_hold;

 	return ret;
 }
@@ -800,8 +698,8 @@ static int imx412_start_streaming(struct imx412 *imx412)

 	/* Write sensor mode registers */
 	reg_list = &imx412->cur_mode->reg_list;
-	ret = imx412_write_regs(imx412, reg_list->regs,
-				reg_list->num_of_regs);
+	ret = cci_multi_reg_write(imx412->cci, reg_list->regs,
+				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx412->dev, "fail to write initial registers\n");
 		return ret;
@@ -818,8 +716,8 @@ static int imx412_start_streaming(struct imx412 *imx412)
 	usleep_range(7400, 8000);

 	/* Start streaming */
-	ret = imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
-			       1, IMX412_MODE_STREAMING);
+	ret = cci_write(imx412->cci, IMX412_REG_MODE_SELECT,
+			IMX412_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(imx412->dev, "fail to start streaming\n");
 		return ret;
@@ -836,8 +734,8 @@ static int imx412_start_streaming(struct imx412 *imx412)
  */
 static int imx412_stop_streaming(struct imx412 *imx412)
 {
-	return imx412_write_reg(imx412, IMX412_REG_MODE_SELECT,
-				1, IMX412_MODE_STANDBY);
+	return cci_write(imx412->cci, IMX412_REG_MODE_SELECT,
+			 IMX412_MODE_STANDBY, NULL);
 }

 /**
@@ -888,16 +786,18 @@ static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
 static int imx412_detect(struct imx412 *imx412)
 {
 	int ret;
-	u32 val;
+	u64 val;

-	ret = imx412_read_reg(imx412, IMX412_REG_ID, 2, &val);
+	ret = cci_read(imx412->cci, IMX412_REG_ID, &val, NULL);
 	if (ret)
-		return ret;
+		return dev_err_probe(imx412->dev, ret,
+				     "failed to read chip id %x\n",
+				     IMX412_ID);

 	if (val != IMX412_ID) {
-		dev_err(imx412->dev, "chip id mismatch: %x!=%x\n",
-			IMX412_ID, val);
-		return -ENXIO;
+		return dev_err_probe(imx412->dev, -ENODEV,
+				     "chip id mismatch: %x!=%llx",
+				     IMX412_ID, val);
 	}

 	return 0;
@@ -1180,6 +1080,11 @@ static int imx412_probe(struct i2c_client *client)
 	if (!name)
 		return -ENODEV;

+	imx412->cci = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(imx412->cci))
+		return dev_err_probe(imx412->dev, PTR_ERR(imx412->cci),
+				     "Failed to init CCI\n");
+
 	/* Initialize subdev */
 	v4l2_i2c_subdev_init(&imx412->sd, client, &imx412_subdev_ops);
 	imx412->sd.internal_ops = &imx412_internal_ops;
--
2.34.1


