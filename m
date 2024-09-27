Return-Path: <linux-media+bounces-18693-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4369882E9
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 12:58:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 173311C21136
	for <lists+linux-media@lfdr.de>; Fri, 27 Sep 2024 10:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7936E1898E4;
	Fri, 27 Sep 2024 10:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="Bdh50HDO"
X-Original-To: linux-media@vger.kernel.org
Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011046.outbound.protection.outlook.com [52.101.129.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20360176231;
	Fri, 27 Sep 2024 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727434711; cv=fail; b=rMO05ECT2/u/KRSnG/ISKxDixrMnCe40JNVqaYbDcZSi/EEUYeb6gsSnhEsSWLgTyiIQsKmP+L9lFv6jJaw0Gbxzf8E7qfIU/nsYAkYBalAilbf7tLftfefOWYpZAOx3De5wMnIwLVoxfksAMq0aedqtFQPoxHEavno5i4/7ytM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727434711; c=relaxed/simple;
	bh=LiPnaBvGvBc9btmkEOmDSOz1aFyilL7GjrPbV/4pyyw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=crVK2VWNZCBKf6cHdGlyTtfPEeI9EV59AYOpefEJiw0TKJI5GUbcsArHCblbAovkkVBTGwlwJL8eXH48o7Me8STVqWpvlmeLy4yxb0uT3gVKKjZXRadjmsySamd9IAh+SvE00ETvwEkIP2Pxjr0l7t1QhPzJ0p7VQpkjKku1Bsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=Bdh50HDO; arc=fail smtp.client-ip=52.101.129.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFCYQkRNVzdAcyi8Nr6/8x856KUZDiBigwnoorkHQ4EmfBlFzgYIfSeUU5HdE2DuXCo99G62K372YYO2kA+jhIu+a+GItxlvs7JXvfsi84gyMGsgHaTpiIShL/IEavQIasB3Rd57C6LV1BT480/JYIX6btJ2YuvZDj8YwJM+zosU6uPK9Eh+GHDftqD3/KkvrwDZ2bUPoyml/eAJumZwVdK9O/mCYTzQXZxx5W+USvlbwzSwHDtKMwIBCSMBFh7niY5l/CckfVGdIwmNLzCOuGgZa0PzZS6/7dIVKaQsZgS+i4pLeqpaRl132VTvfqgMggzqgSAp6/22wu4DXyOuVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAOR8Y8MHpVAkGH5ls39VyT6KJt8jxLbNNkB6V6CKoE=;
 b=cVVvju2i2+8uS+uxVVgnTCeuLKsBtS4o70Vd15KAx0CV9SM+BxjRlA3aw869ZwYNR11X6hT8MtZxOSPRcxqd9iBWnnv5r0uGsmM+ACv+jBgPKSpagcLu7LAbVDPgPfAUsLe36lRxA7F6X5MHJmYc8AfHpZfzg6LDioTRr2vLXGoaLpVRS7J+pFWxTfO2ZZUCpPkXatlU698nr7drpvvbuKgR5ttG4xv/+JiDCeHeRkn0/hjGnQ5THjlsN+73zw+rs5W7J3i5B2H/adhSHFzCuycav3qdu1QWSrwXIQZnAyU0nbwik0qG4qA24RmFW/xtn+B8x1p3jxctJMRWquc0tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hAOR8Y8MHpVAkGH5ls39VyT6KJt8jxLbNNkB6V6CKoE=;
 b=Bdh50HDOLP3nV9F2gyuSDxslA7EEef4WEHhy/a+F+E7PxosQGu47QYfYR/C48fvfUMUnXsiu0WoXd0WMP1XLplMGa7YAZqBJDqZ+azwUr4k1xVvqX4CrO8n9Hej/Sms//RKdyT0gH7ztbZspokl3qhx///87OqRfE68LrCFaqgsPeN17NEE0bm/Yq8hDiHLcpq7ScYyYfr5oqftxIOopeRSZqbTA5z6Qpl89zqNwFGvBP1L9uKnj6wWIZRV4CagQijwIZNJBc1YnlHpX73HoVhkxI2jUILIkHt7HEEcmy4nLGOkIX5ajwsTT1wfY7xdUHhq6/+Oo7VpnF+2NYMSZdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by KL1PR06MB6906.apcprd06.prod.outlook.com (2603:1096:820:128::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 10:58:24 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 10:58:23 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: sean@mess.org,
	mchehab@kernel.org
Cc: huanglipeng@vivo.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] media: rc-core: Modify the timeout waiting time for the infrared remote control.
Date: Fri, 27 Sep 2024 18:58:08 +0800
Message-Id: <20240927105808.9284-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0076.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::16) To SEZPR06MB5899.apcprd06.prod.outlook.com
 (2603:1096:101:e3::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|KL1PR06MB6906:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd6913c-f611-4006-84ca-08dcdee34e3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PcBJgg4SopGJKC54U2xyeb0poP18b1x/gB36WIO7C0i8xC6DaBPSsPZUrUJA?=
 =?us-ascii?Q?qzPjrcvisIFRndKZfFvG5tBqXC1B5PhvteosK7Xam7+I72orBoZYNA8Pli89?=
 =?us-ascii?Q?A+lXK0cnwei8XHGfkxpuEla3s2HD/4TOZaTXaZ1+MU1bhOlcni2/nIREl5gS?=
 =?us-ascii?Q?Qm1BLJfgXNeFoXcSljFWT1/y/uWlxeXJbTmDb9JizcUbf/Y9MKFxrMktKBnI?=
 =?us-ascii?Q?Vodob/3FyK3JgsyHQXRSX0O7v6TMSta5z4g5j2k5fP8Dl6D5DzcdbL6oMRCI?=
 =?us-ascii?Q?PtOciZh3hyUi8wwYy++R00ygRl3QUsvC8AttlwRfCzfDYu0Nu3/9eDiYNTC0?=
 =?us-ascii?Q?sI5PsFIMhacEA7bAH4XVM5FSkVVDhg0nfcVqaFWpMVLuHZ5CzWxp1pMGbY/c?=
 =?us-ascii?Q?AX1K6sQBeNkidU4ZqHiikmFsdUncOm4797qYIQSrvpYnWS4SXwWsuV6e/vLI?=
 =?us-ascii?Q?sCfqciYb1/BFbyBmWfUmOIZGmk8MEYjanNP02+BaSVxQyT6pfocVFauAAl+C?=
 =?us-ascii?Q?jpRvKQIcUMHC335A/0rLmStTc5vNVPiuBIy3EZNHZMucqvnYzvmoh9fjCfLv?=
 =?us-ascii?Q?rR0nWgqFadR/T8PaByjs03/bz8qKfWKLDj1xDk3w0bkjKpb8uNxxOKRV+DzJ?=
 =?us-ascii?Q?3M7G0k31DqGZsH89P1EegD4kQKj7iGNGYzOZMLyVgzGSvdoGz9MfG2M6jr9I?=
 =?us-ascii?Q?fw0XVvc+7HG/zD5YF7lMKTd+Z/lR68qxUm/j9r3H6viRCC4XYN2ttgAmV35q?=
 =?us-ascii?Q?3MPo+xCEGJlxZmq27hoImBi6UstR2dfZUfm+/QgTwZPewrv3OA8O6HmfO4A4?=
 =?us-ascii?Q?nazu00qZGYQ0EFn2J8tVTYxaiqNWTgWO9pX3FfC7b6QYnKwThCsXxiodkG7B?=
 =?us-ascii?Q?Kd991RTtdfOQLSbtjGJ35VIdaaSe/FuD1pvVQ4Xw9Ue6sCrVF3w0h1+EN8k1?=
 =?us-ascii?Q?iEE8kMWfUrIkyD7wK/2Jz/FKYSaucTQuiZKTK8sNzLJgqUaTq0/9fC0ojCUb?=
 =?us-ascii?Q?vm35uQhFQe3tNFFTgdfEvfxL8PF8NEIqLACBhuaClYIxkPapeA2mcp7vE/hI?=
 =?us-ascii?Q?/o6tGrUshVOzNo8K3M23cH7n5alt10vztiO3gye50iC8hzQcxq41HWw6Ji/H?=
 =?us-ascii?Q?VT0Uy9fuMtTLBm6PlrU3ETOZXqwYi2BKRYug5UhHiGdKchnm0bp88Ik9gFsU?=
 =?us-ascii?Q?WYBy3Muz6EuLTlDqqnghYUL0i3Ur1TXXZrplgLO05/NR/gCpe/QYeKeHwaus?=
 =?us-ascii?Q?OiRvQME6n44PWF1ZGD8r9emFXZNoBQV5O1czQIhGVg2/FLOFwAbehzUOrDPH?=
 =?us-ascii?Q?rJgdOTpyzUXjPwG4gXs5wq16UvkPJBh8Xg3ySwkhUZSk/4de+K65qKFTz/qh?=
 =?us-ascii?Q?2dlmPtoUFqqVPdJOOXITb1BHjdhnRY+o9SxnDZ3oYlS/2YKiUQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MY6I9JAgMPPP+CEYCepRx+dMuBYS3c80HNBQZ2CCsYuPsQk5bbpE6wPh61E8?=
 =?us-ascii?Q?5L19VuTsZc+pawfFcp1SM7Qzce6o+K3qUHeuvLOvsJdmSquh5zmNY7BlCAKP?=
 =?us-ascii?Q?XInKlVmCQ6m+sPVS5ebvqXXKqQtmIQQkKnEYJYXdvXDlT7dEflWA9yPJfZnu?=
 =?us-ascii?Q?6h1k8ZKwYdt1b6UR3T8mYitby3CeJqMpQAVqQlajYrYo0cTAOHHyh285jHnn?=
 =?us-ascii?Q?ky1VSlgQadv4kyE2fe0zSg67DgOsgV8zfeM1dDBBjQ4wxahNRvQfUZLJ4pEE?=
 =?us-ascii?Q?dKMZ3X7dtBgoJFr5MSnq6NaLjpznQJYl35G59Z/q9UM/zgrZ+9VXmj7AGeZQ?=
 =?us-ascii?Q?fNsZG+lboPSIeqkm5G24ijRLP4dQYbmEHdiTFz493hPheM1hZdHglSpJa18o?=
 =?us-ascii?Q?JOabSKG9GtbQiBj3ARc+jaR9Z4G322Xb0zcDDxZ2ZaN+ICDol6goY89UkUQw?=
 =?us-ascii?Q?3498Xg5HlprRbQe3VDHu+CJPsjWYkCSvso6fjwtnpQFea8F1QiWySbQ/44R2?=
 =?us-ascii?Q?smMW1HOaePIIUR1ARsEDYtBLQXn0aLlzQMT86hM4goacigTOg8UsOYiytfJe?=
 =?us-ascii?Q?UY73WiNDxv0uo+nDmSIi0fCenT/+ODlVBlQvJnq6Du+kcX3uNJlqDuVgdqk6?=
 =?us-ascii?Q?DvteYUNvVcrcMJrfVbSW+8TlVfHj4TjwQLZnADrklQ9fSEndUs50fK+fcxBn?=
 =?us-ascii?Q?mNCSCez8rtYNkffBgeVl2bwsQPkLsjjOS+JyXL1XsfLaAtITvhG+xhjDnKjV?=
 =?us-ascii?Q?+NzSbzJV/8o/XFmDc+Uq+KO7RlhDqHIR4Dl41ZsixlOLfk6WQScJMxujH+aa?=
 =?us-ascii?Q?Qh7a+rsIicrFRPaPiuoq3WaKEc4XmMdM7RYQ1SUqysMF/sRv9JaygTXa5CRT?=
 =?us-ascii?Q?fDeD5y56KWfe+eyeo7WrxJcNqQpYr+BRrYhLyurYPVnir1ZJQsLjot82tN2e?=
 =?us-ascii?Q?ogLoC7iuYYt0hJO3FSlk5aA+DKhysMH664Rm3DBPpwxWcoYphtlxci+s3gvO?=
 =?us-ascii?Q?xhAUwFH6Kxt71QWyxs5IoRXy3Ufzv8df+eYHTntBmyriLm9S+bPAth5/XQAO?=
 =?us-ascii?Q?kGUhev39pij4zsuEplB7YIcUc1b2L8uIvnS45BtJBzuramZRyj/xGQ41pXUm?=
 =?us-ascii?Q?C2uZVw4MwQQQPbTc1ajgt2+N9JhedDhhwj5XBddvXQfIJwq44Ha01bfja0eR?=
 =?us-ascii?Q?UaqtXTQ8IFoY6ddGv5Oq5P5L7OMxpwfLCUTLZ1mdma1oUV36DphHQu5gux3V?=
 =?us-ascii?Q?iZ0NDS8WynQKC4R5R8YKI/+bXdbh4j/qC4trgYKqY13Pl7EFV64Ul6QCavjc?=
 =?us-ascii?Q?29tqHPuiIvJptR6IV4IppJ/PJi4l/DiTu44QonYoGyDU7EL5y7fWEbjsNidC?=
 =?us-ascii?Q?x9HsZnMVcN0Lk1KEvIJuVhzTrDlSPl6nU2phTvXqJgwMdtbHl9guoAy9GGab?=
 =?us-ascii?Q?vUW4O/o0U8R9nxKrCf9Q66qBbDln6hEM7dULEOYDap/g0S7Af8WAA4+/9Of9?=
 =?us-ascii?Q?7QSIuQNrVkvHJJIWJ7vmXtNUWcLKls5jJnahg6g79qJ0Il7WE1C+VnGWba1p?=
 =?us-ascii?Q?bpzPa6c4Cen3FPi7WCmaopqbFAVy5Rr0igVe7EGW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccd6913c-f611-4006-84ca-08dcdee34e3a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 10:58:23.3087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: URGoBzeXQoj4rMHmaGemkhOIr8s2pCmjDZml6xa8VQ7ffR6DVI4gXq+n4E0cSpXAZE9I9oYcrF6sK9yDmQ3OJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6906

When transmitting codes from certain infrared remote controls, the kernel
occasionally fails to receive them due to a timeout during transmission.

This issue arises specifically in instances where the duration of the 
signal exceeds the predefined limit (`IR_MAX_DURATION`) in the code
handling logic located within `lirc_dev.c`:

if (txbuf[i] > IR_MAX_DURATION - duration || !txbuf[i]) {
	pr_err("lirc_transmit duration out range[%d] txbuf:%d duration:%d\n",
		i, txbuf[i], duration);
	ret = -EINVAL;
	goto out_kfree;
}

The error manifests as an `EINVAL` (error number 22) being returned when
attempting to send infrared signals whose individual elements exceed the
maximum allowed duration (`xbuf[i] > IR_MAX_DURATION - duration`).

As evidenced by logs, attempts to send commands with extended durations,
such as those associated with the "Power" button on a Skyworth TV remote,
fail with this error.

To rectify this and ensure compatibility with a broader range of infrared
remote controls, particularly those with lengthy code sequences, this patch
proposes to increase the value of `IR_MAX_DURATION`. 

This adjustment will allow for successful transmission of these extended
codes, thereby enhancing overall device compatibility and ensuring proper
functionality of remotes with long duration signals.

Example log entries highlighting the issue:
	D ConsumerIrHal: IRTX: Send to driver <268>
	E ConsumerIrHal: irtx write fail, errno=22 <269>
	D ConsumerIrHal: Done, Turn OFF IRTX <270>

Modifying the maximum timeout time in this area can solve this issue.

Signed-off-by: Huang Lipeng <huanglipeng@vivo.com>
Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 include/media/rc-core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/media/rc-core.h b/include/media/rc-core.h
index d095908073ef..2f575c18b6b6 100644
--- a/include/media/rc-core.h
+++ b/include/media/rc-core.h
@@ -303,7 +303,7 @@ struct ir_raw_event {
 
 #define US_TO_NS(usec)		((usec) * 1000)
 #define MS_TO_US(msec)		((msec) * 1000)
-#define IR_MAX_DURATION		MS_TO_US(500)
+#define IR_MAX_DURATION		MS_TO_US(1000)
 #define IR_DEFAULT_TIMEOUT	MS_TO_US(125)
 #define IR_MAX_TIMEOUT		LIRC_VALUE_MASK
 
-- 
2.17.1


