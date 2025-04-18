Return-Path: <linux-media+bounces-30525-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8807FA93367
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 09:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 106AB189CEB8
	for <lists+linux-media@lfdr.de>; Fri, 18 Apr 2025 07:20:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB9D25A35A;
	Fri, 18 Apr 2025 07:19:50 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021127.outbound.protection.outlook.com [40.107.51.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81D1D86D6;
	Fri, 18 Apr 2025 07:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744960789; cv=fail; b=WB+OpfOOpU66hK88UmZYP5ewkqTUo6WCG0toCnUuVQJY9htRE3fj9lcgkMXQglAqNR3VImAeDGrehUJ7HEv9VGcef5aGwLKmQSyf/dXSD7iPINvEGKhXhWi2QZrU8r8rU6zMsqC3i4rLeuW+rXZ4zYZItiZkAe76wLRlzNivadc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744960789; c=relaxed/simple;
	bh=Akh/F5rNR5A4/GMpx4GBMCyrUdfDjdlCuit1xyVhjCM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GpgXSBUJfvPte9eUm5trINehkSp24nxT71vUEmwsphbOUrmAn8NysYbbVbZJRHiEbgkwR1xImOPQST8jS+ktE4Hg0LW1t8tpYLxwsM3Qhe5QXBZRrE3AbFcmIIG4mpP1slDn7JTAb7OJmOsHpAAWUgll4NK4UXVFgnuvYnbKb+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.51.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7FJqdY+m9th099OquCTV2Rcb5QvYRnICE9WXbauABhZETDWHlUj0QnQ4zAQh6Fh57BETWYq9mXZuDyOp9QoWNe1N40HTf/SFWGbFX7EyyTuGKSfxXljYuMs0flPGcInhRFkAr5msre74cymZbx48E5hkNQ+Hx14GIT+A/ZhXEd4RmR0p2FoQou5M9p2YvOwGw4y88FjKJuRi4rWNvQb9QfsSlMekutZhpg14PKgJalzMTTU3KdFp5+MLRdAmNv0Gvo1HZkDaUSmwu3Vrmw97kKT+ajn7OSuZ80dnkIoWjsJdI+nMxRW+VZZvArlTDTJ9TMrlCc1wdxpzlx1A7EXxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gHuUAp7E9TsPgJtBFOhAu+Du/SEEWMNEx1iHa0AxxcM=;
 b=f6I8iGWLUhGmkTUw+OA7on6JholnPRWfHdNzy+zQ0rdk22mQ+SU8Hi/wn+jR4F/CB+qJus9UuUGB+/56PGYqvlEDk9aLaUTbn1LYKTEk9CpP6NupEILpcosoYadOeiKHU/Mv2QkTOZE+lWlykTcEzchm0JOfUtodlWPocfNYu/exeETr7a8RbmMkCCl9sztk5WhKqkYR0dYq8R/qnlRegmNRiVFZdAMZasdANlcBQTx+80SlerGHZwqQdwsLdtmFeA+U3aPFJTIILGiHsxYSUzsRQtpPJihhBmsRYqZa63JB1a7HoCqCqLSvUPbyJ66nj2bcRtZEJYIC+S/qHfNSCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:229::21)
 by PN2P287MB1743.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.27; Fri, 18 Apr
 2025 07:19:45 +0000
Received: from PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418]) by PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 ([fe80::5c9a:906e:318b:c418%5]) with mapi id 15.20.8655.025; Fri, 18 Apr 2025
 07:19:45 +0000
From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
To: andy@kernel.org,
	sakari.ailus@linux.intel.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/2] media: atomisp: Remove unused atomisp_compat_ioctl32() declaration
Date: Fri, 18 Apr 2025 12:48:18 +0530
Message-Id: <20250418071823.8756-2-hardevsinh.palaniya@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
References: <20250418071823.8756-1-hardevsinh.palaniya@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0237.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::19) To PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:229::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB3519:EE_|PN2P287MB1743:EE_
X-MS-Office365-Filtering-Correlation-Id: 811adfbe-90ef-4b53-4e02-08dd7e49653c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HPCqbNZboVHqT0mbBQ+8oksQWhGS5n86xrnWyH/o6wmV19NL5weFQ9qYqxZk?=
 =?us-ascii?Q?3ntu5G8ocK2k8W7PjV2HnDjJ7NaSfGxitZnupEPSnWzsV3YGM650M5D75uXz?=
 =?us-ascii?Q?J+WLKx5cFscllYFFcpiFGop2XhZhqnraA/FzkWnC32svdJvaqd/sGHrMcpZQ?=
 =?us-ascii?Q?G76G3UL33Ue1k21l0plvbfLpckajEMVvSxZCpust6+YJKNWd8Mextq+Bfauv?=
 =?us-ascii?Q?3lBY4ehKba0IMbMaxBgv6gko/JYZbI7kmKX2cnzPj29SO99OtUTUYXU2O/5X?=
 =?us-ascii?Q?QvOQtrlL6uDNLKoOhM5Jrvg7ZNP5SxxhmEMLY3E16eBZDvRb2cTLhGpnRWxR?=
 =?us-ascii?Q?OW0d9VQnVK4FviUuqcILUEOYAoF0qomOc8buRuV0k8lWKyVVVaDYnkxo+QDS?=
 =?us-ascii?Q?dA2u6M0B0W0Ny6NgWLWNvwNYt49seeWgzVvbaWlUuWPPlzpQhH0B5UvWV1aI?=
 =?us-ascii?Q?jtwtV22JYzRRJj7xQo8Psd72YtGTcRwP6haTg5i706nMxkFm1szbrwz005MH?=
 =?us-ascii?Q?3UOTIY1PyYTt08BGW9L4MbDqwI5eMnLcFMWn0+JESbMaRaV7tTFmp3RRURzf?=
 =?us-ascii?Q?j5VqPkAif1Kjo2RMftzHif2q9lkft0kDZ0UhCl6RksTgsca4St99cEZ6Z1Rh?=
 =?us-ascii?Q?3eRQH7aZa7RAOO0IhPwKiqS8qNtMwylHqz9TAUOzmZ1Dks6jsjkah1Q31ujb?=
 =?us-ascii?Q?mxC6lVErEPtPg9kt/noNSYYnCuOUTUQSyYiKxeKxV+C5ZPcvx3dZexGW2sbs?=
 =?us-ascii?Q?23Ogu1Hlh9WB18v7AhpRhaluKVLzc07ehk82hmY9UnBsRJlJYdVr1eGe/7JB?=
 =?us-ascii?Q?NJVNeD8n6J8RnIasuQreM+vRjbCmAffg/L5BUr/2IB/TJT1Cjg47ZPGTnTSJ?=
 =?us-ascii?Q?J6gWyFsV1K2D09RM9GZDWh6vRngzInRVeAG7lSzqU0OeDVpns1FeowN+K12y?=
 =?us-ascii?Q?4a4/+OxbuPVK9ktq1kv3GmnIRZSX8m7PjTozhy3AegpoeFyK0Zmn8uc72Y3x?=
 =?us-ascii?Q?0EGsJ6rCz0V4LgwGwjR9lJPyZG7Vjn2MMuCxGAF04SeKd3n3A81EEeaz3PGR?=
 =?us-ascii?Q?FdU7gsJf/7OPIrnc4fZBeCsvEwQvXC3p7GlUR44V8vUEHAdVskuzlLsfTEsF?=
 =?us-ascii?Q?0A3gRGw62CfPQpyQevpsBEqrjwNS6dw26F05B85/Qk+Co+PheqP0MONVNXxR?=
 =?us-ascii?Q?cRwSzIS3OYJV6mtxmLFmoJcozZ2WBEp6+H/A2gRXlNilwlFv96H9Q52l9wP2?=
 =?us-ascii?Q?ls9+WzrmBOdEzPg/B1dPNlSr4+PcnEt8UqHlA0puZt27sMcKFVX41E3tkcr2?=
 =?us-ascii?Q?L8HMGdnfHhTAwNL5hBJkvB6OA29udVVhwO2MKAy/Oo14flHqXQqsCDHOxXUA?=
 =?us-ascii?Q?PWCidIND0LVNhVI5JJ5dqRtzTHrr7SgpBOuwZBkH0vjsCNl8QxX8BFSAW0Nh?=
 =?us-ascii?Q?GmW1sIvIkkPysaB2DwKhgha+DVjEdEu2muqP5pR1PuWhHWkUrlZL1fwcStFC?=
 =?us-ascii?Q?HJK2lEGC9fpGmHA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB3519.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CqO8ozIWb/8fzyHEPUI12I5ZnTJ1e3v2thiQF8GOJb0iW/TSAqsIhIY5CWlb?=
 =?us-ascii?Q?VbCyMgN1IOUk3OhkXDt6eqydXAs13vuJCMSih3IiE31k6qrFMNHqglOAbRcq?=
 =?us-ascii?Q?QCepZO1JL36SHnQ41xN/8+4+WZTkGFydQEec8t6oaTh4UHgHy7Afh61ZStTO?=
 =?us-ascii?Q?cawmGRd4wtt1vleSZZlBB3ZQBx5KUITgFmIVh98RH82GTyS6QZCXxfegfKcD?=
 =?us-ascii?Q?N6myr4oN2UizNzx9Y7NUOLr6CbrJmyNY5Vqf7U1jhd+9mcgMM2Ed30H/DCqR?=
 =?us-ascii?Q?UQHLi0x0xVGdYh0ZqJUFO6TCovBV/VuXavgWj3N0qEHIBAq3Sw8uwXhmnIS4?=
 =?us-ascii?Q?ggvDYuysBY6R6qcPqrrp671RP83Fgzzz4ra+S2Fl/3mm5ry2CMxvfPbzixeM?=
 =?us-ascii?Q?JgVToHn406iIoekaRFuBRo/enYqvJwifgrnJfMhadzdeUQaSf7YTtWNyHAba?=
 =?us-ascii?Q?qGoTI9HgebB/CJW9HSuFPlArVeacVuDShNfuGfFLj5AoJlf8W/03RLl0FCIC?=
 =?us-ascii?Q?5PbE58guV/Zfx4YOnOgqo/+/LHcjwujpsSMRDr2rXIshK9eJYwHXnuAqnvFP?=
 =?us-ascii?Q?jDcVqib5E7aHAb4tvLPbX1mer93ZiLtu1W7rNErTu8LV3Jl8KObgePmVpL45?=
 =?us-ascii?Q?yEDl5jrkl9caVvMpSP7JJSEH9GczYjsqP562oJpx4ZZIqAGtDjCFPtthE3Pr?=
 =?us-ascii?Q?4J8gdT10VXeQTVr1TqBkv6dfDWZ2OC6dl3zt3QjpI6FjC8UX8Tl0nqj8bhnO?=
 =?us-ascii?Q?jbnr14GJ7XEPUI2mLDwiwSDDixjqj9fsQHsI9p3MESxhWPfMo5vtAdxELOGd?=
 =?us-ascii?Q?38XJ1RHHhm5QwIN4WNfkYwDBWbtH/+VzAY7bpzz0r6QUOkz21bbbNzbVin6+?=
 =?us-ascii?Q?I1ouzM/c7EoGDaHfBkOb+A8xiHPxgzjwiT2H7IMQ6yJzWo+B0UjW4Re1RTdr?=
 =?us-ascii?Q?IjMs3vq0m1z9clY8nRc+ktfe2eTiJlEGUvNF/DmLIFbOY2xC3tCMsSU28q0l?=
 =?us-ascii?Q?7rOStxZ4eaUTD1rJkVYcfAm4sfGg+XYVQd0V+0dMRR9sA4QX2ShOIrlCCQof?=
 =?us-ascii?Q?hfSDnI7NxRa1ZVearMzFHZPj8Dh7IijV+4k9w9k/1qCJ+9BUOZX57Dozs0SW?=
 =?us-ascii?Q?37wCiPoIULpULAP6vDnqD2RsFfhG+c444cI7PujWteczK8j81d61avUF+TEU?=
 =?us-ascii?Q?5dRv1tXmBRWeltmGyC3gKmbjGOPCgFWzcWpvMLWF62LmXj1AyLeL4SFDLTif?=
 =?us-ascii?Q?SKrxLrVQiRKjNqBkziOPQ1yisVnxdGKACoN1M/RN3hG4/92RvVtu2EtUCD6K?=
 =?us-ascii?Q?jttgT8bCNwySMIUuSYOZUVBEGLEJriZhEJeJvUeZ1fQtLCQjB0PftfKCK/7s?=
 =?us-ascii?Q?xHvMXw3PyAtyo4kuOM/DgbHH6qasK3hc6t/gT3GJmZKysdjdPCupCJwhEdUi?=
 =?us-ascii?Q?i94DxfQBNxyouNwN4WrpF6XQEQtmboxkw0kQOfyxnazKMXMQ4aeSD/q518oE?=
 =?us-ascii?Q?I8k8KPhDYgPJ4uOyRBPpf9cXMCQZixfLhDp55rYZ22BYf9QqoSs0C6h43xnD?=
 =?us-ascii?Q?9M1/VNGJvjAm8Y0ojS+CSqgILsKDAVOrTM8lfhbzjO7DQ9gBMTiAVV9dxlsp?=
 =?us-ascii?Q?x0kC35QE0l9+3XE34MBivzc=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 811adfbe-90ef-4b53-4e02-08dd7e49653c
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB3519.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 07:19:45.3687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gB2WUnY2u/RwnHi3ztbd5VdfgQbMZeDhonsl0EDVS7BGILiHeO/JzXl/X5+trwcF2K+ow3kamm+eVfCnIPNkpzTubn7dDgdEVKHgjGrVvx+3eZjygtYj5/oBUCJWr/cS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1743

Since its definition was deleted in a previous patch[1]
and there are no remaining users of this function in
the codebase.

Link[1]:https://lore.kernel.org/linux-media/20210614103409.3154127-7-arnd@kernel.org/

Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
index 4feaa0338cb4..57f608f9db56 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.h
@@ -33,8 +33,4 @@ void atomisp_stop_streaming(struct vb2_queue *vq);
 
 extern const struct v4l2_ioctl_ops atomisp_ioctl_ops;
 
-/* compat_ioctl for 32bit userland app and 64bit kernel */
-long atomisp_compat_ioctl32(struct file *file,
-			    unsigned int cmd, unsigned long arg);
-
 #endif /* __ATOMISP_IOCTL_H__ */
-- 
2.34.1


