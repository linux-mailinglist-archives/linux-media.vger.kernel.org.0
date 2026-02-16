Return-Path: <linux-media+bounces-52847-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOZSHL/ekmlvzQEAu9opvQ
	(envelope-from <linux-media+bounces-52847-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:09:19 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E7458141DC6
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 10:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A3190300F52E
	for <lists+linux-media@lfdr.de>; Mon, 16 Feb 2026 09:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3111285CA4;
	Mon, 16 Feb 2026 09:09:14 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SY2PR01CU004.outbound.protection.outlook.com (mail-australiaeastazon11021085.outbound.protection.outlook.com [40.107.39.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABA223D7F5
	for <linux-media@vger.kernel.org>; Mon, 16 Feb 2026 09:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.39.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232954; cv=fail; b=tK5X4QWL0U6Sm/uRjwNMnUzxqNDzwZCchB+ImFjOhnY51VSLIkAWt8Fi59RPjokBL05esGaC35K4NtPmyepTOeSQx/xXWbhxDwrX4uNNfSwoYZTtNUMq7/g7HbK7PctqrWxGrDzUlCAUigAsJyOpdgBA6xvyRKlp86dtNSi31+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232954; c=relaxed/simple;
	bh=Oc57cogYMRG52RMoA7z1eCbwoSnTiw5t9sO73JJH5pI=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=seJLQ2xi1iNOUoMfnS2VYX9c43oaX9x5IQeUK9ZZoBnjn8c1j/nzw4xu7xnFG4UrvK8BkNwiP5GShcmfOC9ndVL7/XUzC3RfgEdo3pohCjkvu6MMH0ggQ9D51hJV7YQtqk/QrKwGn48+1yA9P0qgMb0km+EU9MFkh5WZmjk3sY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com; spf=pass smtp.mailfrom=heitbaum.com; arc=fail smtp.client-ip=40.107.39.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=heitbaum.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=heitbaum.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XV6je752VbH4sFKkE+JA27JJMyFD/1PuVT08SsX4/HPTyvsgF7iF5Uds/WDX+zjnRCg2dsgFJB9T4dHLBXq2c8v3DFyccO/FkATbEAeY/3oGRM0TMULqBZKaQ48uopbwzwHxN/uosC3V+eLTt8imxN9zOmWem/7nExa7LJGgTNw0j44zcXhzn4tlH3NLbwus4jWTVVI/ovormwj9ePfl/DRG9xwSwyaiEXO5uOT+eandsSvbv6RXxwpiUYZTO3yE+jolNDuiikJuxib8W+Q4ziZ9Z13KaU0qRVe+6iD2cb6Vjy1XsMZY+fn2w7SNlRCzM0zdJp9LpedINYCuXR46iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6n5CBK22EmF8v1Nynt8Eu5mGTkC1i27VdKIr2mB3iGA=;
 b=kx5Sl6Mn2scUUvbcPORXzct2xpRG2me4ANmO1eC3L06DHNu16H9ixKGLnDx1YRkAZRbmsL/+ig0On3kJnQqgrCGz/MxHsqjw9aHKF0Ypl+xiBUKz0oRZJoPeO3ivaaixfXuN58aBVfRexrMSHS9Zp96uBm50NiZaIQsiB0Y3fYHnJw2dA9SED9q6svHvpy2ye4Fa+9PMPBj6QbYjZX5enbxwQa/N8vje3jj4MP+O9nbxjNuTbdIzRIcOhtS89h9T+Ln/jTZmyKl4xj4JlBVCKF6l9QPtHJlgkB+F78XSPrbmqT66CJyLaQxOPmFX6eIDxDEvFZqO8qhYc84GvgjKwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=heitbaum.com; dmarc=pass action=none header.from=heitbaum.com;
 dkim=pass header.d=heitbaum.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=heitbaum.com;
Received: from SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:73::13) by
 SY4P282MB4158.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:1c7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Mon, 16 Feb 2026 09:09:08 +0000
Received: from SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM
 ([fe80::7340:fb70:eaa2:ee1f]) by SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM
 ([fe80::7340:fb70:eaa2:ee1f%4]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 09:09:08 +0000
Date: Mon, 16 Feb 2026 09:08:54 +0000
From: Rudi Heitbaum <rudi@heitbaum.com>
To: linux-media@vger.kernel.org
Cc: rudi@heitbaum.com
Subject: [PATCH v4l-utils] treewide: fix discards 'const' qualifier from
 pointer
Message-ID: <aZLepuHgTGpgBc2m@f4d934329c4f>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MEWP282CA0210.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:220:1da::17) To SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:73::13)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SYYP282MB0960:EE_|SY4P282MB4158:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c94dfa1-9de5-4243-77ec-08de6d3b0aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EyKNT4D8v/T9/FIlNf5FPlgbEUxGdRqVm2bBUAD4Y8XsV9JZAv7oaWoZchJ4?=
 =?us-ascii?Q?y5nC5qRBqfXAPlDx1+uM9KFmV7VnDyM8Ym6eJCF8U1arrVxcZqGa3VngXWMo?=
 =?us-ascii?Q?jbDXedj5QpZ0VQvfvz2uis8ZHTRa2UjlRijO195eoNrz11IM1Zmjx5slx/Z5?=
 =?us-ascii?Q?eENXpjOTWxiqBaxkCXfdbnNg1qj2Kq6cmcMsE05unbD0VakXLS74Ltf2/+ye?=
 =?us-ascii?Q?9wlOkllXPeM4LoK0hSdaSXEecm+bL428iiL3ENRomg+GXBXy5trG8h/Jm+dn?=
 =?us-ascii?Q?Dq35cek4Vud84Te6XWg3eTt33wNd6gplAx7xNqYY0YthUXI89TLZb4zE/EyS?=
 =?us-ascii?Q?ytyFgd4w8fXS2u0KDzGeNHAYem50R/vfXFfgJY3SqcJJuTcU5VYRbN2o5Ad3?=
 =?us-ascii?Q?DUquU1q1XhC+n0sjsSnUzb9vD8HpmLl9b5eUdq04EPq62rK2TnDl+mVpSgLX?=
 =?us-ascii?Q?rqzD1fIYyMf4hmy3HNHES7p50K4Em519eJZyH6Acq7kN0oE1WTFABktEku0G?=
 =?us-ascii?Q?bQzkjYHpoW+UL4Y+McPUJDps+C/BU6jsxkq0goTMZwSOcPUOnRAs/upDOraI?=
 =?us-ascii?Q?BAR8dmN7pHB3g2Qn6d7E6DB3liDR999b79pOjPTlk23Dqd0cU3hlfCMslXqa?=
 =?us-ascii?Q?AMngyrvmcugRUD6N6qgTIszOP7KLADTG3rBFmm7SzE+c8MYHmNW0x60dwOBA?=
 =?us-ascii?Q?1OtVHa06oRUbIHkXKH9uOa0u0dHUN37q8GLn3GwpfTGz7LjCYuommrXuc0lj?=
 =?us-ascii?Q?EZ5MlNsSglq7826jQXqG5ObfzuL75xafIx0rR8fRla9gmMpdc3kkJ32n3f0B?=
 =?us-ascii?Q?s/L+JMSgNcZGLpKiA5/K+kBqNrP3ggJ5vd+bBW8ybzF2kMYdkhNRABjWKKM8?=
 =?us-ascii?Q?8+SRPRx0sJZna552MOEMd47qlPjRK1S5IqEl1tejJoNuAaBxqeI2IPFs+6Dn?=
 =?us-ascii?Q?LCrLEunsgKv3xOJEfowG4u2XwbPrkV+ZnFY56OnudE/IF1LK6ZF0XeTf10Fa?=
 =?us-ascii?Q?3718NmiPro5MXwDjhUrpDr8G4cTe2NnbBy8Vt5h0j8jg6VP0C7ggKuJmakv3?=
 =?us-ascii?Q?+bmoObliVzC6kAMzHeBZvSgIZPQ/zb3sRLn3EvyGrEQogA35MESsGJYi/gsc?=
 =?us-ascii?Q?rS2rc48X55+eE6ts0IFFhQvrIa1Rqk8RHdzhk6/3Exy5nbP+RUV4uVAknGL2?=
 =?us-ascii?Q?GGs5MH2nNvAkiawcV1Cf0qQLJTX1zSMMbINxOZZh+b+UXGVhq5JjWH3KtgoI?=
 =?us-ascii?Q?057lZOuCg59fgzXPyqU12dOo2SQOP+I/coLCQDtS7EF7FCHckh7V0dVMEEk/?=
 =?us-ascii?Q?q+BUyYN+VKFezUF7dVOrsLRYumso+UTUw6TYVPpfl5iAHSNoo8sl8N4a6Ubh?=
 =?us-ascii?Q?HGiz9pSpw1sNKC0ZvedQM/iWZY5APjC2Oi4+qslRpIm0CJu1gmFEulA7LSkx?=
 =?us-ascii?Q?7NXzGFpTcb55zZqD/FlMxQ8pRv+nIrybSPaH5yk5/kQbDiY8dHNageRkJBXD?=
 =?us-ascii?Q?q4Ks764Gdrurei0dd4EQkRVl5Nsyog+lIAosAhTc/Bc15AbppbmHdrHFjmCM?=
 =?us-ascii?Q?a6AAtQjYAOir7pFGyHc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KwtdOkTygzG6x9z57hapldfMkjCzee2tfigGoOGp5HMdipUzKURNmA5uvfwd?=
 =?us-ascii?Q?voxYTn7RUXyeG0bV7j7FMqtpaVEQTJdH31HDpRTvHxujgfLwAXjSD5DSSqQb?=
 =?us-ascii?Q?daEf0QU24zu6YHH3OaKYUQrmITpxDzUgc67xqGrFdwqLnVDJUgFvl05SuUox?=
 =?us-ascii?Q?NNfTe6arvTNXEMZqScSkXCkL1/6TrqSlECDX+ZVZyxmPGCS+YtBbTng+uPxs?=
 =?us-ascii?Q?BWvyQ2anep7ptBBgWHKy0uWHRbb/y0oLc07aGhEMMnRg0Eb7d2hpVov7wLh0?=
 =?us-ascii?Q?epJg+7pxvXpiUDvpD+jvpU9tOqN80giNiiAe9o09wTItUlQsJFHIqxFmBZ4X?=
 =?us-ascii?Q?LyrVNmzmNil2e+slUD/oRq0bt2OXXuckGngwHccoMhUIfO2XxBStNXI8vNyQ?=
 =?us-ascii?Q?sdP4DXQgtW0FCvoqXVdqFqdTBu/HyQeQkES6u0lzPId/SWxArMzQu5P+KUuj?=
 =?us-ascii?Q?UU0SgizVW2Ik8PknrYAAWIWxvufqUiDWmR/nPdfYLD1AeeSO81DyFedSDn5+?=
 =?us-ascii?Q?yR73jDJOGo7tpUF85DyTRAr7yeotwldRa49OZf57Q1uTyqWvGpAT6rswTq81?=
 =?us-ascii?Q?1D7Df9UMz5ps8nyelMz0VKFPLYS8IpjPiwiP2G+jsKjMfznIa/4yJoxV+qXW?=
 =?us-ascii?Q?Jt/Lm136i9IlSJ/TKpxUJvv5o9STUo87mNwWe3YKgHK3kanQGCOkRWym8SQN?=
 =?us-ascii?Q?VMJpRrsBaOajMmm1fQYSMGQoyqAX1Dv7rGQzlRyqOMEXo99yEGWKYxtEZDMO?=
 =?us-ascii?Q?6OMszHfe7gMitQrVSaE0MQeAYZPS9krKWkjn0JXC+Lqw4FPDbxulh4JoM8s2?=
 =?us-ascii?Q?1lm520fbJtAhsVHS5mCP3Jze9tbIPbjFdUAsYiUE288tgWL6pNCMH7Oy4EJM?=
 =?us-ascii?Q?DDMkNB6hWl4rVK0B7o6ShF3xx7QrY5JEskUcrY7t2RVV76KxFcaYtYDGBmnQ?=
 =?us-ascii?Q?+K/b5mBwG7ZVWW3q1KUwOKLmCB2xvGRwgDMdDw7E67Ab7HA/PvWR8AFORW2I?=
 =?us-ascii?Q?FtuK0ROj1S4YHz2MeQGcMYMl5V4MswbtXp4OC0tUoajaQxUBZmdRRnzETghH?=
 =?us-ascii?Q?DK9HaMDk0MucKX8+zAmXiRGO2QBvNOEhc1hmu5qz3C21Xan19yDVIYziUV/l?=
 =?us-ascii?Q?pNKmM0LXiPQf80gu6IOVNZbCZKz4OOxpOAJtDtNUfsiWYjaT7YX9hY8lPpew?=
 =?us-ascii?Q?kdJwuiPEkzceQ0cM0U9n7acThfVL5HdUnyCF3IkVQ4wxXHi+N4oohNiTlFGN?=
 =?us-ascii?Q?9gqrnWebFsb/jh/F3ADVKhq0MkAULG1XbVW0zDosc+jbFwitu1CAgkj4BCq6?=
 =?us-ascii?Q?4Ea3kcRLyCo1CsSy+AEgx7fBzngnMp93udOuoasapB5W+9BMYRSDVKGFhh+o?=
 =?us-ascii?Q?li6JADGh+t1CDd6zqYn4bJU0wyTOfxuD6ezRfmSfsKx622/TeXs0yK787zaA?=
 =?us-ascii?Q?l2UjvscB2c2O3h8trqDmKLnW/PLY27hd/b44IWourtMVrXAui6sWwOeA4A1i?=
 =?us-ascii?Q?Zes/SS50yZPneMsH78SEJlXi3YRFzk4Tw1+Ae/CtlcGNEFrwEc1QlHfodvfp?=
 =?us-ascii?Q?Verqe8u5Ucke2LEDG8dXufM7icar9kuAcRcvv4oymljLBswOm6I7vD0/KCA3?=
 =?us-ascii?Q?G4Qz64KJF+dBpw3zmUsOKtD3BvLUMrtAWYUNquuGT/iiuGrrQz42GTS00mYr?=
 =?us-ascii?Q?gnuHkyy45VXE7lg3qC1Do4RmGFQEXZ4jUnt3Bz8wtMak0Snz?=
X-OriginatorOrg: heitbaum.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c94dfa1-9de5-4243-77ec-08de6d3b0aa1
X-MS-Exchange-CrossTenant-AuthSource: SYYP282MB0960.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 09:09:08.2965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 35ffebb5-7282-4da6-8519-efab29b0108e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DzngcG4N9/RFiVV6Kc9HKdQ3Qd7yyMD+XS8Fiqk1qy9xAM2P0qWv/Yl6GkBASAlVB5L2pWUzgm6wUVnavpXnWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB4158
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.04 / 15.00];
	DMARC_POLICY_REJECT(2.00)[heitbaum.com : SPF not aligned (relaxed), No valid DKIM,reject];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rudi@heitbaum.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	R_DKIM_NA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52847-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,heitbaum.com:email]
X-Rspamd-Queue-Id: E7458141DC6
X-Rspamd-Action: no action

For ISO C23, the functions strchr, strrchr, and strstr that return
pointers into their input arrays now have definitions as macros that
return a pointer to a const-qualified type when the input argument is
a pointer to a const-qualified type.

Update to const type for variable, as returned string is only used in
comparisons which const can be used.

fixes:
    ../lib/libdvbv5/dvb-dev-local.c:220:19: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      220 |                 p = strstr(pci_dev, "0x");
          |                   ^
    ../lib/libdvbv5/dvb-dev-local.c:224:19: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      224 |                 p = strstr(pci_vend, "0x");
          |                   ^
    ../utils/libmedia_dev/get_media_devices.c: In function 'get_associated_device':
    ../utils/libmedia_dev/get_media_devices.c:459:19: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      459 |                 p = strrchr(seek_device, '/');
          |                   ^
    ../utils/ir-ctl/ir-ctl.c: In function 'read_scancode':
    ../utils/ir-ctl/ir-ctl.c:530:19: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      530 |         char *p = strchr(name, ':');
          |                   ^~~~~~

Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
---
 lib/libdvbv5/dvb-dev-local.c           | 3 +--
 utils/ir-ctl/ir-ctl.c                  | 2 +-
 utils/libmedia_dev/get_media_devices.c | 3 ++-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/libdvbv5/dvb-dev-local.c b/lib/libdvbv5/dvb-dev-local.c
index ea511471..b89a6c87 100644
--- a/lib/libdvbv5/dvb-dev-local.c
+++ b/lib/libdvbv5/dvb-dev-local.c
@@ -208,8 +208,7 @@ static int handle_device_change(struct dvb_device_priv *dvb,
 
 	/* Get optional per-bus fields associated with the device parent */
 	if (!strcmp(bus_type, "pci")) {
-		const char *pci_dev, *pci_vend;
-		char *p;
+		const char *p, *pci_dev, *pci_vend;
 
 		pci_dev = udev_device_get_sysattr_value(parent, "subsystem_device");
 		pci_vend = udev_device_get_sysattr_value(parent, "subsystem_vendor");
diff --git a/utils/ir-ctl/ir-ctl.c b/utils/ir-ctl/ir-ctl.c
index 8600fbe6..d2ff77e4 100644
--- a/utils/ir-ctl/ir-ctl.c
+++ b/utils/ir-ctl/ir-ctl.c
@@ -527,7 +527,7 @@ static struct send *read_scancode(const char *name)
 	struct send *f;
 	unsigned scancode;
 	char *pstr;
-	char *p = strchr(name, ':');
+	const char *p = strchr(name, ':');
 
 	if (!p) {
 		fprintf(stderr, _("error: scancode '%s' must be in protocol:scancode format\n"), name);
diff --git a/utils/libmedia_dev/get_media_devices.c b/utils/libmedia_dev/get_media_devices.c
index 21920867..28efb658 100644
--- a/utils/libmedia_dev/get_media_devices.c
+++ b/utils/libmedia_dev/get_media_devices.c
@@ -452,7 +452,8 @@ const char *get_associated_device(void *opaque,
 	struct media_devices *md = opaque;
 	struct media_device_entry *md_ptr = md->md_entry;
 	int i, found = 0;
-	char *prev, *p;
+	const char *p;
+	char *prev;
 
 	if (seek_type != NONE && seek_device[0]) {
 		/* Get just the device name */
-- 
2.51.0


