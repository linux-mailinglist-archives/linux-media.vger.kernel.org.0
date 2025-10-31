Return-Path: <linux-media+bounces-46070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C927C24D93
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 12:50:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 365CC4F20E9
	for <lists+linux-media@lfdr.de>; Fri, 31 Oct 2025 11:50:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CFF346FA9;
	Fri, 31 Oct 2025 11:49:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from PNYPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11020138.outbound.protection.outlook.com [52.101.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F67332909;
	Fri, 31 Oct 2025 11:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.225.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911342; cv=fail; b=YYxXU2//M6BVXC8au8kv0MGblfNay4bcFjNycaut2Qk6CgAGFS0M3+Fhth1lgONWDvH979YyimuD0/nmp9mFYBz1Eb8sBPXoYTnLnPvTpBswf6XVoLBN4VVEU2nEOvj5ssDh2bOvviYhdox2CiV82AHLeYVuz2beh1xmtm1yGdw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911342; c=relaxed/simple;
	bh=9b46ybM9TLkB7sZjmHvEn/ATaYL/df0VqATu5Q6VdTg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=LZbO5gHJiO1acJCgfGrLjpZRCXGJY3gNJOeOb+abrt5GRMQOeE4+OMMv/wFVyaNmJYD7hvKrBViAtTvOQosu2NH0fjGDYh5hrVxvQPpNL/Yyt71XeaIs+6H5jGAsXLrldwAqHxh7giJiyUSOBcXPUOAlvG09IpLvBhzoOUDChTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=fail smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWxQ/EFWsl5UXq7qnWJxT+xkDw5/aHMzLTslLb9EtLvYe+Kf3BpSxMNA77cbwdqnLRXOg0LS6mvRB0NNiM3AkwBDf/s0MCCmH4OOLAtrauM4we7HU7tsjxl489Eko4gZe+WR6zlyK+1vqWRj2P34szMwsfEcImWkuUqbBz55VnHOioUvmY/ulynnZ/fwyPFGH56uydTAsxbqL/WxDrj0rxwjfdicZkXnJmdmzYg7/6DJ/ihPJ2GBi7rdCv+CFDG/xiat2hSNaq5nr/m1K7lTH7yo3eR/vHxByGaxLcCuFA/Lx/4/S1GVwtP5TQ24H0kx32mTkpXmZNttzySscT5gZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvA5Oopd2l9wZoPlxHcXf+IxHAw5OubInBMwZN7wdVo=;
 b=VSE8bk5fYlHA1mgaERhqkHiE7ZS5uzWz8/TrAgf3qIcuJgz0SMHHuXFxiY6DEg4+YiohszBs9GO55VIXXbtMlVAsQVLurqnbDhOrY5Mh5Cw1rVqvrR5asZrWenjwdKNCgiN90YMWw3Wt3r/CA6VZgVovO7tZvRrpfRol7qYlZrmy3FLxbBRPdbPF96ZVehmBVDS3qCI0eLPAfftD4kYM0oAKl0oR2Mr2OYGiw9roXcYvvqWbiy9XAwt0cLzpB0MbtcgW0iUCqxgUT/SSLqH5Bi2djCrjfMux982PeNnbcg5O8BkFwvv3e6T9bWmKpDSP0lPI4zLtKca/Np3s/jhHgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN4P287MB5137.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:305::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 31 Oct
 2025 11:48:56 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 11:48:56 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] media: i2c: imx219: Improve error handling and readability
Date: Fri, 31 Oct 2025 17:18:33 +0530
Message-Id: <20251031114835.113026-1-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0220.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:ea::18) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN4P287MB5137:EE_
X-MS-Office365-Filtering-Correlation-Id: f68895d8-4920-4d85-c2aa-08de18737894
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nDDusZBJYErwreBjUwYYZLeVb0yJ0Agx6VzRMqnJ2lgtSJSgYeCJqEKDGSNd?=
 =?us-ascii?Q?/JI7H8AgRQ8HHmeZoMmMpxvKFL4QMgGyHWI7UhtsmEyvc3wEDG07xxmuWU9D?=
 =?us-ascii?Q?aaaBpU9qX0cUTtG57Xep7kZviLaCVMSbsHwW90ohPAa+tSntX1YBecbPTK+Y?=
 =?us-ascii?Q?WmhjMS5jSqy3gfTv4ZTV6ueYubj2C0/0TvUXxPZ2BhmRQ9EeXP8BpLj/7ApX?=
 =?us-ascii?Q?962eZf333zqtSEODfWq2F438ecvP7a3IzNgybESLaGPYyFnTu7ESFrNvyhr+?=
 =?us-ascii?Q?fD+35fEz6TaUMyM/G+/M/t0iZLzKSFXIb/KPuQZbg6ChkXejHxUK+0bKn5u/?=
 =?us-ascii?Q?dH1RzAuBi3cy3+bDHI67/s8V/qVWGzPJ1T5jSkc4com8GpgFEDczTJlrodeP?=
 =?us-ascii?Q?1qS3tDGsfNzOJ9IqAzDT8/98vz7Zad3Ez0vOXx+uY4CV52eerBilcWNrxeqr?=
 =?us-ascii?Q?QUbne+mjKY5yGwuUueHbb2G295coJHp84CWFZl1GhfPg3EjG/HZUn1MZdNHR?=
 =?us-ascii?Q?BR7inGm/thFDbW9nIBjFxtSVwzTeDMrf7w/pkChINBJwYFvdlUasOCgQni7p?=
 =?us-ascii?Q?JZ3cZuemoJRsxycPvwkXbz4TJVWF8j9/GjrqudaJSxHjrfvOvsqIxobl7wDR?=
 =?us-ascii?Q?o2SMfPSf9ktxPLa1sEOlCI38G4xgzfO3t4PFAxhIXG6TEgLdcJZDGyEu5r81?=
 =?us-ascii?Q?Hd6wjdF2kE0AstriUD7TpsyrojYRFbdGFeCN/P5mab401kp6yY0kn0bsRzHL?=
 =?us-ascii?Q?JBGw+Bj7zzIKogdmwe5Y932kED85dtOjs3OqRqs0cYYOQY31sGPdR1MQjC9M?=
 =?us-ascii?Q?Lg+AuF38ghuFRF5H028NwiBsfNXsFr8pqyY5DdoME1yYxXHsIjoEp80vozP3?=
 =?us-ascii?Q?0YLTUQYoF1OPnm0SLDiy8OKr8HR6GCduN3LW9a8LwfiCo+bxtSU38R9cJWSA?=
 =?us-ascii?Q?7S6hxry7GgfOD2u3JpDp+4Ek9i1Ux+EdsXhp6oHs5k+EocNtc1iriZr8xrpQ?=
 =?us-ascii?Q?pRSWz0nQX5V2n26+SZ5vxtEoB5tJizc9bhPOfsjL3HMvMUMfLq6iixdfEz5D?=
 =?us-ascii?Q?7/QVE9jCP/sJFH4iia54Zs7srlPYfFN3xp6tiQgWgHYQplb6le5aKSpJ2gV8?=
 =?us-ascii?Q?8vTmkMmpFlEXTSSYsf7/wnZSd8YjMchnfvXGqqXSTJUz1rSJ3P30zPdwB4FQ?=
 =?us-ascii?Q?5uOvof4V4HkDSWlOHmtqy3CxnXtx4oFvLARdSbC6DCkdxJOr8ZzAXj3R7gd8?=
 =?us-ascii?Q?3LL/HsS232z/NqfQxbxv7QwEy2vM4mGA8aMek0PEkv6ec7aArlctqmShSpNK?=
 =?us-ascii?Q?WUQo3vKD/lqN68WOVL/pGmVIDdVvKvjAUgSnVl4IM0mDbMx9cY8LulT9rsJE?=
 =?us-ascii?Q?0IFHGbjAsgicpCngGRVwfu310o7v4Uo9vLwcyMdtXXgsdCdBAXpYYyTcqnoi?=
 =?us-ascii?Q?L+LAs7wiLvifjvVSnhshdGWjl6Z6/Th+y6OVzSTH4e9S9O74nN+pjBr4mbWU?=
 =?us-ascii?Q?VgvtpGgJGA75ptFnta3rGNH09nE/D6T4cQlT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SvrQ4yeFn2TaFjZhRNqruonp6neMGOzfs+yinn4Mpv/0pe6iQzXtaRnTMF0I?=
 =?us-ascii?Q?AwHHzDTfZx4Orj3qZYpEUOn8cFVTj4wO27WNfdwP7WDFyUZvEikqx5xRBEMH?=
 =?us-ascii?Q?bXP0F5Z5YBnt7m3Dvcp4Zw1VZNTkVpqusJdAQTYy41i1LdFcG6+nFCraFRb6?=
 =?us-ascii?Q?SpdA+7q4S7kzY0C5ez+1DQdkfYo6Qhy6ylBWIHRJXBIy77eLjPQz5iX7Fq8b?=
 =?us-ascii?Q?j6g+kpaFwesxdjwgPAtzJYpakt+oqaeQH6OIfrEE8O9ztnmW3Icc+Za6z5Gd?=
 =?us-ascii?Q?hyJvpF69alsbJo7tYbbKcxeXawytjI+uhFuTe5DCE50XqqSdbwmGyuHV1ljm?=
 =?us-ascii?Q?3GZq2x1p8oOa+P+xQ6QB9RVKqFMuPbvhJS3JAM7NcHo8djqJ6JrIZ6LSUpLH?=
 =?us-ascii?Q?sBNqObGt6l9wQyVRTAunkDIx657QqOx6ezjPDEK1dZPdpzc83zJIldaxB78P?=
 =?us-ascii?Q?BFqk7saW7t5yabYYBrw2SCfGaes6S4lU2K/Y2HfoCq0/Jr3XzqS6JrQwIHkm?=
 =?us-ascii?Q?DUtJOa7CqQp3eqPM5bsKzGpJuDUWroU/yN2qEYJkT8/EiBULP9h0sLPFRqIG?=
 =?us-ascii?Q?W6Ks6mz5zHFtuOTLoOigj5S7JAdZ5WZRL7mIEVZJmprHg32wI0dt/OO3eH0y?=
 =?us-ascii?Q?dzQwSS1v84jnZ3kNuYkbvdCff8uaQuJRDfxwLC0WEXt8YP0EUuGptCEulXMo?=
 =?us-ascii?Q?A/PiDRey27A5Ea4pKWWWVLyVDJ9EfYrR7oTKK2t4VK1NqW08UAtmTfSWTr/O?=
 =?us-ascii?Q?x+T2amX+z+xtBXdu6TsIBJdilfnl30cBtcfoI4qsxuzDT7QnIRKEPP3fAEFs?=
 =?us-ascii?Q?LdVPkwE4H0KJNrdska0CDIluwl036JCLH8KKFkoKTVtuyUpUmhQCDCqrm3oG?=
 =?us-ascii?Q?XYDf+XAtKxPab142/ZSY0EVKlJyv91FZa7Y8Q4KIdIzXUwFNB0n3fGXsT867?=
 =?us-ascii?Q?o4dqZ6wqwx+nEVAjGgWG+DvX9UfQLG5ObDB92b8BzJafBTagHAaGbPsgfX/7?=
 =?us-ascii?Q?K1n/d3zP8rDT63TrHyKA/mlgRh9pSp5rqcU3V3fOeaLtgx3kpS/d2JxWkMQ7?=
 =?us-ascii?Q?jztipCw86GthMVWwcXxcG8F0HrM7hhsFn6eB+hhnh0TaFDGlguvGM4tabqHZ?=
 =?us-ascii?Q?u7wzSPcoIXwWXVX504TpvRMUmzlhkohR03lAzvLJkVY4PIqCAd0JbEqlwUCc?=
 =?us-ascii?Q?Xl3K88ViRovrmllSd1/jLuyzCLFhGGHZ30ZsnpDN016ZZJg4nyW1qOu1pNdM?=
 =?us-ascii?Q?VKxA7SoSkqmdkh9xBLhYE5OnYPOSH+1sG5TQLa2rdsQqtNtMfP6r0LUtGjC6?=
 =?us-ascii?Q?a9iRICQjuuyx4R35VuZJgO/qr9Tmwq40/CtToNRVacK/UkJ6VIgFvRSP2/zs?=
 =?us-ascii?Q?ooI0qtklOmJGxVMqijTb751B5vLjklcJghXRBburM+zolpqYUGmiaqmkCegD?=
 =?us-ascii?Q?L9+evShZA8VXGj+0ZxXda9xtiNcnjTfVezUcW878MHhsJQDkszHtqdeUydjR?=
 =?us-ascii?Q?h9mwKAnuyz5xpq8vNEFWKsUjExqrbYOpH81UTvdg9TAQSnExj+3nE8BGy710?=
 =?us-ascii?Q?CgTR/mKJl+LfQSKn/bvfqfHbqNwZ8OGy2S5UO1y2Zam5+qmpOi8EW9ynr1MQ?=
 =?us-ascii?Q?uw=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: f68895d8-4920-4d85-c2aa-08de18737894
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 11:48:56.0938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GB9z6org+i/vfkARyP9cnrmbKExIeU/3W0tBgnD78u2E2VJ9szdJe3y0sS+eI+GOQeXQN647GLX+xAPQO9ZbEpNVgRc/qWjVVJpI9oV9c0I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN4P287MB5137

This series improves the IMX219 driver by adding proper error propagation
for control range updates and replacing a hardcoded exposure value with a
named constant as per the datasheet.

Tarang Raval (2):
  media: i2c: imx219: Propagate errors from control range updates
  media: i2c: imx219: Replace exposure magic value with named constant

 drivers/media/i2c/imx219.c | 74 ++++++++++++++++++++++++--------------
 1 file changed, 47 insertions(+), 27 deletions(-)

-- 
2.34.1


