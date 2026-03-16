Return-Path: <linux-media+bounces-55867-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOjyNzPHt2kRVQEAu9opvQ
	(envelope-from <linux-media+bounces-55867-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:02:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3FE2969AB
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3B69E3015138
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:01:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01DC385534;
	Mon, 16 Mar 2026 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="B2XNFyU7"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021121.outbound.protection.outlook.com [40.107.51.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C32B383C69;
	Mon, 16 Mar 2026 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651692; cv=fail; b=HOw2+pVI+iZMw/EmhLD5200nxHdUZgSLGyQ7JeEDGbmezn6PaeO4W9VKqxpZP0jurDzCiQqp9z3FxgfWHOYMxKQ1Gi7GySI+ReXcV56bo2Xo5eH+aqlDoFA1vlYpNGM8J2UPn84AW6sR6VfOzay1iFNLSM5T8qSb7pZrT9cZL8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651692; c=relaxed/simple;
	bh=t+f9i704Oepj8pLHdjWaw4dBN/GGNVwFMcR5k0jKvX0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=i45wRYMuGkKI4g6eypZVKHzYWT+seMFB7MBff6MypaPRo+o3lutGpU01+Php9H2RIZXSo1Ap5L1EN51P9BjepnuqhGrHeHCFTKSvyLFJfw5JfKHGj4nGCGvxZrlsR0/trmt1KwsrxBdHVo1NxHaUSL8haYmg80IrQvJr+vzofv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=B2XNFyU7; arc=fail smtp.client-ip=40.107.51.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VSePG1NQd/4RKQAKXguXcsCStTgbpx/3KrTIDD2dlPPB9tBo3NPtDLUqRUEXFFKPi2XZslw7qXjRtX8IQ2NkuIuI9UrLTJv6/PHy9Sz8ZTqq3crnpXhb9dXc4ySW1MdIbwW2GD8s1sKQHPjyJRZaCXO6AtkW3CCHDxb4F++VdhLPMkTP/JOS8fT9X0OqPwDg7HnTn91GcninbcmU9Lbgt7mAsquQpsoYsPbA3p3SqvLBWzvKZJO0VI4wJdV3wHFiHIRpB0WdxcZKJGzo2v9IvOdjgLYsfmrG5O37PPY7N0QHaPzbCc9+3oG03tPvqKsH7EQ6wLZId+b1GE0qHrcyoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZyYaqf/7xzm4E64sjxFHdi5st4/dsjbAO0Ecxv786o=;
 b=Xqz2k3KwtuYEThmhsFcZZJwYpkQ8+Cs21Niftc2RjUXPIR4xPMmjXWSD7rG8my02x99VPGqV72GWwFUiOc4DTZoYKRoEkyoDLn9XtvacxNaJl7KwIGf8emNgGCiAQpQQ0Oy8PxFOxUpifM2tQyCteTqvMAwjoLthuWu8cPikvqC5v8eGKjJBd4c0Cbj5Nb1rvKg4n8tM5wQ3VbBrLc3cA5Kh29B6xZikHYKUGKolVakbbC5XazeZ528iJGi0w9YPzk6Ph8QX+fe+xKjc0C1xtXyUA3Gid9ls8d2pNi9VlEfMN5dnzCebpzyQJC9IPoLGrPnAxucVLBIFxntd9W9Wpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZyYaqf/7xzm4E64sjxFHdi5st4/dsjbAO0Ecxv786o=;
 b=B2XNFyU73Li9uBerWKRfbZX6dRJL09ZzBYWNaBdgqxxHT15VrmVodaTuzqt5n1dQwiiPSogK+laAPFNHtnzUXav7MiUlg05WnApq1dVWaiW7xrj8A79Kc8Q7lt/z5V7DJKEtUSy78UqKFgKzdaPUpP14HkMhLa+7m9rAjchNcQ55XbgtCFhvjWzjFULCFnsO+noyLEoYRy8dwgIPLlrzbecsQnvu/pwbVBhWDU7Sm4BYqYwHcZXRz8kMerW9kihcJ6Nx/jauAP4C0bCvBmGD4paacPiYVCIc6UTCo0ec/TH659wjVOFEw3omj2YaYbf8a/VzRpdCQrT9Uj7CIV7Thw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN3P287MB1479.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:01:26 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:01:25 +0000
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
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] media: i2c: imx412: Modernize driver with CCI and streams API
Date: Mon, 16 Mar 2026 14:30:53 +0530
Message-Id: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::35) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PN3P287MB1479:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d091c73-abd9-486d-c68e-08de833a9a84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ByYzcI2SQLIm7U/cnM22PdRelnaYhDmhuW9+txeJ52MXQeC3zbiY8SKrZa/7o+sZ4P2N5fXrWXyD4LVNdpXo7xHqCcAu++Yn8tADj/Ko84COEBLuNGgwMpDHPwAMcZIfDdE4iWdGXTva3ZG/a3M+N9CW1TzL7iP+TJEbPsAW2hkZ1J4xll9jpwIEr5/pLn38Kj0XRi/eQV+zXs/5SC/k17Gfygl38ePLTVNQNza79zQ0dUET+FcdJqzFagvkxomYZaP94lAHFjezUxzsbBrHQXhcS+8zPlnXufMTHu7ALN8Yrom6zMDrU3LsODGLu4PY3mhVX7rvy5igguMqwGJfT3bQ8Lg05+k9grQrLIQG8rejMnxK+cTaLJ8HSWr9h5kgEmw/UKgISGYjOxj5lts2fXFdTtcrLq26LJzApthMvv9/Jeur2DU8Gc0tIgYaQj6ZO/x6mU6nBNnKOg5Vf3JWcA7mvV4KmAXcwiB+dGtzpqVnImZO5psn+0DmYkDLB8OhwVVPXC4Tngvms993LJpNz2/3zM421TG3+mkPJFe85c0IQLCEZ4hQC5EP8FoLlLq8U2ZsGATvMPp43QgTXaP3wW1unnTfBdSpgVI9i/gDeGWuhWJbggbSaAs/XNU/qmCzoL0McVzXCy6u1Eq8pMSAAKEDvsk+i8GF658P/LKUQt6eTI99QUFBgFu3baoZ/2NDRydIpivGclKFGD4iPb9B2O9nvspaEm4E6pegur/Ad+0TTh4YNKSnxhE6K1+8XZS3LKk3ufawLw3mWR1ex3eO2OoLzgyjL6oQ6Cj9ZZZrNOc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LY1objzHDrasHrxK6+l8a0kwUO6GFu+u5i5vnorTyT05GaBx00/9nyX4AP0z?=
 =?us-ascii?Q?KXiPQahMZMw7uWNLQO2EiEXpXuua+2PCUeuhkdFsy2Q5zTGBlLCvEpkPX5rM?=
 =?us-ascii?Q?ngo4+/xsPtNVeSPc+qMgAivIJCLjfIeCoQlt24MdtS/O8pv8I9tLjAWeMfTH?=
 =?us-ascii?Q?XhnxZK/kRsefVxEenB9Zz+4QeSMnrOHvB/sXbrq7bJyDtUbbrCPvjW/WA7UG?=
 =?us-ascii?Q?LUhhyGJeMj7c8LjcYx2Z9emQVxD2bEwWDmUBmCfsf6ZHWB+hr5ApuY/O4cDX?=
 =?us-ascii?Q?z5c2ewEsIhIkJ+2TvURVpuCEXc5a5AhG9GbJ1EY9mEzQSsqfaa+cN3E4N421?=
 =?us-ascii?Q?pZ72qbnY80SZIssMtwhoklS2c7DEo6d9G4PsNYPKosEPSbmALrQbeyXoIY50?=
 =?us-ascii?Q?X71W6gLiVuKiHyF0gsH4/Vz97V13lT2vV7vMz/3rwJvzrEmA89nudRoaLSi8?=
 =?us-ascii?Q?J2e9wfpQJwPU8V6ZpePOf0AzVKCDc2tO0IjcpsnfZrP6iAOYxCYXLtrvByYt?=
 =?us-ascii?Q?b5AFvpBNc2H0wy8pqFxnUA+KHN+mU3AdOyQSVu8bSZQsAbHT4ph30peSERr2?=
 =?us-ascii?Q?Ug3vj2fqaytSjsMn6PKW35rDsiQ9rdL2v8RKOmFoqIYsqq6XHe424IucABR/?=
 =?us-ascii?Q?Pz88M9nprF1BfYcbPuSgr7yQkFTGt0N63TJmrnKxPD3onCh3glDjM+4+XfwM?=
 =?us-ascii?Q?7ThRbigUafSnc8+5N5UER14pN5sdZUPCon1dTpDhtsmYAtSHQgf4B/rrHtkV?=
 =?us-ascii?Q?xTAZdo7zTAWADxCauKd+SwTQvXHkh2FqS0aU31h2kHdXabqJGjnETR7sLWeN?=
 =?us-ascii?Q?gLfldBNE2mvoj5sdJ+zm/kJuOXOmp0O/XVcI/PsxAcnVi8VBjFf617KnfFUq?=
 =?us-ascii?Q?60GLz5NrporVZ03DqUa/bJ5xcBYhVBNrwXziXQ++WWzkRkSI2qalf/nKAoXp?=
 =?us-ascii?Q?z1XYuiv4UXbkpZWdxkLe7X70QLNNIclTYtpO5Xt1VLmjWN5yBI2M+B0sTkIh?=
 =?us-ascii?Q?r/y/6QDc+F4wT4symil8QCiQ+oa5UWUGNG4tRobdEUv489k9ukgcgZ3MJOsY?=
 =?us-ascii?Q?IUXFR7jPcZwEX/LMEIvOI9w8tVMgfsVx/t1k7VM+VmX7P40Uu6669WcKuaWF?=
 =?us-ascii?Q?xYZ8MlVOeA8fDymVsfCvat3QPzJ1emKFoovy0VOYLXwhO3mxuEmkub4dFGwQ?=
 =?us-ascii?Q?JDh5EsHAVaT6sm5jzJ6ozkb2reikHCtD4A0wBISQL7oIUiNkOeMTo9Itzphl?=
 =?us-ascii?Q?u19TJaNI8sDeQcjc+vhe1mnTKaPneFhPmIi8khACNUhO19KBq0VbIXt9RRJF?=
 =?us-ascii?Q?75ZjBLcLUK6Vr/kkGjtip3seiS/8jkd6u+EMCam3cPRt3j4SU8QdegoOqkPV?=
 =?us-ascii?Q?LWviPjh5rhFCZfjnORh4U6WGgFEPq6nMPZ913fltZbhj7SZskesitGtLnB0w?=
 =?us-ascii?Q?rNNUVnh0Qm5UaIE77dbp22URcvRQxawvLjkQFKkRqmNK7+0ZQduiZs2GW/9b?=
 =?us-ascii?Q?BCP62Kd9uYXjmDj97ylCp5QmPJAJxGMIeAqU+NlS+D+AbXFYZoVj1lzNiCX3?=
 =?us-ascii?Q?nCkPr5qrslUhucJEz0MazgO/zGcY7NKRXD+N9mXlOW5aEN5vu/YPuk3YC4M4?=
 =?us-ascii?Q?fiwlQKgj1/DGloqNN1SdqW2n+nQ7b7Ac0gwIwYk04Fntq8g36nd9AXUadS0Q?=
 =?us-ascii?Q?zfIfp4ekpApF+sVL4+d4tgYfD0uv6BM6JDNo7sKzT4OMX2YtIefhMPeJzZV4?=
 =?us-ascii?Q?qCt5BbVeozLeuMR80oCd0i5l0CRjmKA=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d091c73-abd9-486d-c68e-08de833a9a84
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:01:25.8469
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nrzsb7MMyRmXMQK0+7icoxCRIVVccAUlVDuh8osjNf14IxFjtvI0yRKGylH78/xBTqHi0oDLZso9dTxkjOyMNp91ZSj9g/LvCUtt5RDFU2TcaH1ncWal44b3zQsWO9pq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1479
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55867-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3D3FE2969AB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series modernizes the imx412 driver by:

1. Converting to the common CCI (Camera Control Interface) register
   access helpers, which simplifies the code by removing custom I2C
   register access functions.

2. Switching to use the V4L2 sub-device state lock instead of a
   private mutex, improving integration with the V4L2 framework.

3. Migrating from the legacy s_stream callback to the modern
   enable_streams/disable_streams callbacks, providing better support
   for multiplexed streams.

These changes reduce code complexity, improve maintainability, and
align the driver with current V4L2 best practices.

v1 -> v2

In Patch 2/3:
- Fix incorrect sensor name in error message

Elgin Perumbilly (3):
  media: i2c: imx412: Convert to CCI register access helpers
  media: i2c: imx412: Switch to using the sub-device state lock
  media: i2c: imx412: switch to {enable,disable}_streams

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx412.c | 756 ++++++++++++++++---------------------
 2 files changed, 324 insertions(+), 433 deletions(-)

--
2.34.1


