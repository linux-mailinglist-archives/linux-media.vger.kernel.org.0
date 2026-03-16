Return-Path: <linux-media+bounces-55870-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PonN7LHt2kRVQEAu9opvQ
	(envelope-from <linux-media+bounces-55870-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:04:50 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F236296A6F
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 10:04:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 559953015D95
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 09:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142E7388E50;
	Mon, 16 Mar 2026 09:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="HuV52/Su"
X-Original-To: linux-media@vger.kernel.org
Received: from PNZPR01CU001.outbound.protection.outlook.com (mail-centralindiaazon11021084.outbound.protection.outlook.com [40.107.51.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EAE38425F;
	Mon, 16 Mar 2026 09:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.51.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651720; cv=fail; b=BaiGKwQPzdkHQUez3bGGiLlhUiYYVJtwFsP/Q5dVohXQWOq3fwn2lZWmGBut1HeSERcCufzhdGRKaTdPs4bCl5Hehar0wqVmyyGA/hmO6fFy6ujnx9vdOAuLC92NcQImL89nu4YfercoJVbxZbspijZaHown8kkQYf9JrTL4USk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651720; c=relaxed/simple;
	bh=zmVu3HoqOWOZRssVicSi9TNDFrtMnOnibF4th8sRsFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oqbrAFuA5rSOxD/5xS9h3xrPyabOGEcL5EKRaIT7QJ82QYUxR6Rk/oWhv+0umXSHAesStl6crTyAVEbUD9i1XAbPxMXIgRQeZTGWpGDLiZ+H3vlBtEMnTX0ViVapzT6tw9DRbs5+6p10k29ANs1QsvW+eNzrfOOAt2PlTmjhFx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=HuV52/Su; arc=fail smtp.client-ip=40.107.51.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=we79llDIq0h7Mt/Cn4z6t8PwrvODMSXLhIvPJxV1dBOqbIbvHChEiwKCSu0knwKDuON5yXy33qwpoXo+udemIp+y3zGeMxoY3+wkXuRoLSli9GhM3FbtCUUPGwY3Gb+ZARIN2RIyUL5R1gQJJucqQsCtmfwnMSQzcHsU6pf2saJm3bUOuor3j4+OO1/Om39+YHU6sYACoFE4Hp1jarU80hLxN3+kEihXb9afRdzIdAr7ctZSUsrdQgVqifQX5gnASVXapfLahi5DroXa4I0UjgyPE5uim1pXzmOHevXXrUtOz/HNhwMu2EPZVw+wCL2tgIh71eH5t7eQE4aqfD4t0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4gs4WUE9sj3BpaO9dtrd+soL3GgTjSlxaDedoBhzIE=;
 b=dAmkmuayXBbHegoyVGQ8SGNIyjbxOdIPTvyxxQPFWaqTuC7v/zBtP5LofIgBxZFQQ/CI4RCsMXCZDRtBzt8yKnbXKb+inaT/hKwdC7Z230FWqgsPk21L7cvhznAysN0tGyjxEDzgwBcJ8nG4JelDqFEwo2JcK0pjHbS9XgGAdaaYtN+93iLMPkP5vbiSpQ7sL9/WetsHyRGnKX7Jl6dPi8JwEIdWJWX//9bzrpntz3iEEyw6E5FP7ndyXOH0ju+YMmwFzDPD2uHRdL2IkWkwO3IK12ZyTXfjJdO8uBiWXT/monQOlw5IRnW+R2aWW/BMHKy4h8y835GUu/tiSBLsHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4gs4WUE9sj3BpaO9dtrd+soL3GgTjSlxaDedoBhzIE=;
 b=HuV52/SuxtPNjXDC5oE7+7DOpePQ4eVZ0CH8BXQndqg7zK3T21cXjsdxPrpDA0eSDpg9XEdiNIYf2JFYn8V6xqijoYy/1sqjif2QDrhWIGB5aenQCfLqx2ipW5cooWk2+tor+PjrfKSljd7Xq7+gr59nJLj08PGTE5NeKYWHxeY7VrxMlfmUcyUPbhLjZeO3uNLZKrwl3k+Ye5IS2U0fs2iz4tZObL4rYL8zEcMdpINakF4s1jrYq1ox6PhQuif8MGj0azUUuDbMZ8vg/P+0zChZPSs7nS3S5aq2WYjT0o7lTZ+xSLNrBvpuEbOL8IVR31/1XN2COMD2craZZbfdTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN3P287MB1479.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1a3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.24; Mon, 16 Mar
 2026 09:01:55 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.20.9700.022; Mon, 16 Mar 2026
 09:01:55 +0000
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
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Xiaolei Wang <xiaolei.wang@windriver.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: i2c: imx412: switch to {enable,disable}_streams
Date: Mon, 16 Mar 2026 14:30:56 +0530
Message-Id: <20260316090059.121605-4-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
References: <20260316090059.121605-1-elgin.perumbilly@siliconsignals.io>
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
X-MS-Office365-Filtering-Correlation-Id: c1ad272a-cf10-455d-bb69-08de833aac69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	D5goNTDzXtpxI7TqUxWK5Cut+mg2UVq86YReb6mz5t3k3NUOfRN7isq89haJdbyi68qHyvRb35BnCYpl4Xo97TO2D8bXImi4ICsjS9fMz8z5qovTtKxoP1tnWlKq3JLcxFZdnWjY4JVs2JqWpuOttMrZJCvKWxv18X9CgDHsJLUjvSpgOTvxB2ukBZ0VIDlGZNgp54oOQ5l06olayGRfxUKDlDYENe9/MrejMIjnq033+w6eNizqYAXs2lGnVzjM0f6zswWtr/PaguO8/EkzrqvKNp80oKgLZHL83leb/8iIZGwxu4soxvqW6lpl5McXToHHDDfjnYyq+PBMBbJAOtbFtZtuMsiIzyrVS/X1RWh+NwAWMdx0JbfzZzPjomPl25t1SKrJfcGvF/pK78FXTm+BR304DMq1xu+OxknPYwOuQyDnO+pkhPEJBr9FZPmNKDRuz0xqfIHsVdvB+Ro8MiagN4HU+kh/NA1XmWaSt8VDhUBoJCfG11E6cj4FLrzCG8kfkubwvDck3IZVESuvbaV9G1vDIPP6xAJvg3WyCI9487EV/NGccnfzB75vngSpTh9rficjXZShWxOEHpZmsxVmTjiMPD3uv3YCYsU6/CF9jdjIcqaf9SGYCn//F1fX2QdmcWVxf0lA6VRPMzFs3TsZU7EjDfjWxdTtX7f2AGKxVZVbx4hJFjjVFUDY1C/CvWwWk5xHR3Zh+ywRiktDa0F0xlonMaZsCCbLRU5Xo9K0rJEdFJvsO+LdDmQsY0GGZK9UU1kym0Lhp+IK5ooctR5VhwbabzaAp7dnn4YnyyY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DMeBLGZncay/FbmlotRfF4R0vyUB91JEKV+NiFguMgbEZSlpeb0/5pNg4PYw?=
 =?us-ascii?Q?PH0wsaQj1NSst8Rn4rimhykk5JZRfUR8KOViOLMV0jOcHe8iEloTxV+qKjQv?=
 =?us-ascii?Q?owWPevDs8b3aj04oMQtFZt20gVagulMvyYSQRqE4LBXeK1OuEbZbUpCNqWtX?=
 =?us-ascii?Q?ZF8OW+p/g6x+T8pub5qD94X8TUL3N2XN1rmqs77ktqUtFTImgACi3lylj9h6?=
 =?us-ascii?Q?miWpNAighz/4/Ig42madSDaJ9/d55XgWBM+65jRu4CaT5sEbFkDOALpcrG05?=
 =?us-ascii?Q?oysOKAEZ7T0ahPiFdJmUraNTubOwJYsf1IFq+f6xkqvf1dVan5hVTc7gaq9I?=
 =?us-ascii?Q?J+pUNYjraSofTJlRGAdDbfPads/cmh6fBMe4QzYBh/P/CrWb0Q0fWhqPTl3p?=
 =?us-ascii?Q?E+A98UPcQ3IKQRcszP7QsyLADJWr8K3kUC59RoeekbZVXDR4tlOhEe17wR9w?=
 =?us-ascii?Q?av8+C2wLuMoq81XgGN5tsdm4DgwoNpP1ev4Yb2QM4PPyteOrT9Yu1DxsK6pz?=
 =?us-ascii?Q?hFn1YVtFmxwmd07fwQoE4lJofnfhUHITQAlyKiTaRDvQJS+/JZbuOT+/L7aI?=
 =?us-ascii?Q?OPrZU5AMMYftscOi0jFrfaQTgS/hlotek11ooB5EMVv5L/tdHL7TOU128t7G?=
 =?us-ascii?Q?QAIJkiieMK/L/qd2wOHZPMpSXTWFiho5fbMeqzB+H84YeBwjKHhKMS7dgmzy?=
 =?us-ascii?Q?V+t8o/9B77P8n3QHl2dwRycoAfPXAS3NAlYagH3vxJePNnCiegfdGIgiSl0D?=
 =?us-ascii?Q?ikiTjiluw9QkhSpnQAKwrXQkEZ/sqZLXpksacLBXN7grtxT1zOQDOq7/bwqt?=
 =?us-ascii?Q?uKi5En8EsxVyLtcQ6tSNC/QCryCp2oYQ1KC/gIVJWsWWSw/T0Skmb1vmdQ4D?=
 =?us-ascii?Q?9keonrQYftBbekF5qShOjj9M3g8REkDpgNpxW5CI2nM8l4qERFdOz5MwI8Cq?=
 =?us-ascii?Q?afpEgx4exhvW1d64PDb+/Kyp3NlWf3tAYGUx2j56h7WTgDp9YREZqE2mRB6T?=
 =?us-ascii?Q?ynZicc7E5Kkm+n2SA+5LS4gc02aX1qtKcruw6+xMGnzQN6ZOvuuzQk7lvYgC?=
 =?us-ascii?Q?bRuYrEPqeoBnxya10C8cp7CPPod1oOiQR9K0NF1IM05e0bodvmgqEetOOZZZ?=
 =?us-ascii?Q?McWOxEfmIiag24bEdQBYvME6di7v6o6DhEqipO0bIs0NeeIeNEifwPKJFbCU?=
 =?us-ascii?Q?hjlb2xqK+//r44/tACOrkvPzeDEi/eS7yX2KIyguKNsUQXJmlpFAWoGSATC1?=
 =?us-ascii?Q?BsZMJfuAHPV9MSKESxd2Z4tXlcq246G+FW5g1bD1QGkDJ+QuJlwBZZ66MXaY?=
 =?us-ascii?Q?yWhHYCNMYQBAy411R0bdhGd6IY/4UvALAEkRzPL70t8gC+mxRYFGS6TKem+4?=
 =?us-ascii?Q?ZpIUSI2TCBbbfzhskKZS3x2utkVkpKBya+wLUJefvnsPa0UnjXToOzETnHBX?=
 =?us-ascii?Q?zboklcf8O47lsp87orKj6oPuhiuhKSTLPf5P77xjZ2LUNqmey1o+fGGiN+Xk?=
 =?us-ascii?Q?BZhZQ06S6s7bzAdFbw7XvQbQyN1+U8uCOY/pYKXtg7t3Tzp4RMBxWR2xKjLH?=
 =?us-ascii?Q?EUqAXsXG1k6bCKjrK/XFpu9ltfIldD5FcaXm/8WQCZzH4wK7J1DX5uVB1Fkq?=
 =?us-ascii?Q?ggt/Xc+KE6BH4bjv5BAqQoIyzLOdQ6ECLbNctE/aPrdxiIbs3pXri0yWftJN?=
 =?us-ascii?Q?y5wIXRfeLIiMq5y0TTONTOslYfFxEzsW7XuAM8af6qatfDp8BqQuQ4/VDWNE?=
 =?us-ascii?Q?i/wfB9eH9GwltpioOAkoZzrVsRJ33PE=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: c1ad272a-cf10-455d-bb69-08de833aac69
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:01:55.8627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jos8pQeRHKz3q+9flkQdiTyuH6lbmMl5XebioGFTXO4wxZYpBcW3BJr5qhsXkeniiU+xvAm8S0pgg/m2MrTPYE1HK+lKt/mMpLFuFj2g9tUOpiT10ujiEext23OFTD7n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1479
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,windriver.com,foss.st.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-55870-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Queue-Id: 9F236296A6F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Switch from s_stream to enable_streams and disable_streams callbacks.

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 drivers/media/i2c/imx412.c | 80 +++++++++++++++++---------------------
 1 file changed, 36 insertions(+), 44 deletions(-)

diff --git a/drivers/media/i2c/imx412.c b/drivers/media/i2c/imx412.c
index 42440bc5e0f3..f922fb5cc47a 100644
--- a/drivers/media/i2c/imx412.c
+++ b/drivers/media/i2c/imx412.c
@@ -676,30 +676,40 @@ static int imx412_init_state(struct v4l2_subdev *sd,
 }

 /**
- * imx412_start_streaming() - Start sensor stream
- * @imx412: pointer to imx412 device
+ * imx412_enable_streams() - Enable specified streams for the sensor
+ * @sd: pointer to the V4L2 subdevice
+ * @state: pointer to the subdevice state
+ * @pad: pad number for which streams are enabled
+ * @streams_mask: bitmask specifying the streams to enable
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_start_streaming(struct imx412 *imx412)
+static int imx412_enable_streams(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 u32 pad, u64 streams_mask)
 {
 	const struct imx412_reg_list *reg_list;
+	struct imx412 *imx412 = to_imx412(sd);
 	int ret;

+	ret = pm_runtime_resume_and_get(imx412->dev);
+	if (ret < 0)
+		return ret;
+
 	/* Write sensor mode registers */
 	reg_list = &imx412->cur_mode->reg_list;
 	ret = cci_multi_reg_write(imx412->cci, reg_list->regs,
 				  reg_list->num_of_regs, NULL);
 	if (ret) {
 		dev_err(imx412->dev, "fail to write initial registers\n");
-		return ret;
+		goto err_rpm_put;
 	}

 	/* Setup handler will write actual exposure and gain */
 	ret =  __v4l2_ctrl_handler_setup(imx412->sd.ctrl_handler);
 	if (ret) {
 		dev_err(imx412->dev, "fail to setup handler\n");
-		return ret;
+		goto err_rpm_put;
 	}

 	/* Delay is required before streaming*/
@@ -710,62 +720,42 @@ static int imx412_start_streaming(struct imx412 *imx412)
 			IMX412_MODE_STREAMING, NULL);
 	if (ret) {
 		dev_err(imx412->dev, "fail to start streaming\n");
-		return ret;
+		goto err_rpm_put;
 	}

 	return 0;
-}

-/**
- * imx412_stop_streaming() - Stop sensor stream
- * @imx412: pointer to imx412 device
- *
- * Return: 0 if successful, error code otherwise.
- */
-static int imx412_stop_streaming(struct imx412 *imx412)
-{
-	return cci_write(imx412->cci, IMX412_REG_MODE_SELECT,
-			 IMX412_MODE_STANDBY, NULL);
+err_rpm_put:
+	pm_runtime_put(imx412->dev);
+
+	return ret;
 }

 /**
- * imx412_set_stream() - Enable sensor streaming
- * @sd: pointer to imx412 subdevice
- * @enable: set to enable sensor streaming
+ * imx412_disable_streams() - Enable specified streams for the sensor
+ * @sd: pointer to the V4L2 subdevice
+ * @state: pointer to the subdevice state
+ * @pad: pad number for which streams are disabled
+ * @streams_mask: bitmask specifying the streams to disable
  *
  * Return: 0 if successful, error code otherwise.
  */
-static int imx412_set_stream(struct v4l2_subdev *sd, int enable)
+static int imx412_disable_streams(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *state,
+				  u32 pad, u64 streams_mask)
 {
 	struct imx412 *imx412 = to_imx412(sd);
-	struct v4l2_subdev_state *state;
 	int ret;

-	state = v4l2_subdev_lock_and_get_active_state(sd);
-
-	if (enable) {
-		ret = pm_runtime_resume_and_get(imx412->dev);
-		if (ret)
-			goto error_unlock;
-
-		ret = imx412_start_streaming(imx412);
-		if (ret)
-			goto error_power_off;
-	} else {
-		imx412_stop_streaming(imx412);
-		pm_runtime_put(imx412->dev);
-	}
-
-	v4l2_subdev_unlock_state(state);
+	ret = cci_write(imx412->cci, IMX412_REG_MODE_SELECT,
+			IMX412_MODE_STANDBY, NULL);

-	return 0;
+	if (ret)
+		dev_err(imx412->dev, "failed to set stream off\n");

-error_power_off:
 	pm_runtime_put(imx412->dev);
-error_unlock:
-	v4l2_subdev_unlock_state(state);

-	return ret;
+	return 0;
 }

 /**
@@ -882,7 +872,7 @@ static int imx412_parse_hw_config(struct imx412 *imx412)

 /* V4l2 subdevice ops */
 static const struct v4l2_subdev_video_ops imx412_video_ops = {
-	.s_stream = imx412_set_stream,
+	.s_stream = v4l2_subdev_s_stream_helper,
 };

 static const struct v4l2_subdev_pad_ops imx412_pad_ops = {
@@ -890,6 +880,8 @@ static const struct v4l2_subdev_pad_ops imx412_pad_ops = {
 	.enum_frame_size = imx412_enum_frame_size,
 	.get_fmt = imx412_get_pad_format,
 	.set_fmt = imx412_set_pad_format,
+	.enable_streams = imx412_enable_streams,
+	.disable_streams = imx412_disable_streams,
 };

 static const struct v4l2_subdev_ops imx412_subdev_ops = {
--
2.34.1


