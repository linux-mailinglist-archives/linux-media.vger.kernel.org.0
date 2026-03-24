Return-Path: <linux-media+bounces-56876-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGeII+6IwmkAegQAu9opvQ
	(envelope-from <linux-media+bounces-56876-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:51:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5B0308AE6
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E11130A4234
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 12:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7073241665;
	Tue, 24 Mar 2026 12:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="ggzycyS7"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020137.outbound.protection.outlook.com [52.101.227.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632AB3064B2;
	Tue, 24 Mar 2026 12:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356377; cv=fail; b=gINcFE3t3tNUBl55yqOq7KYaii2J3Py6+2fICv85MfeT059kL1rVd5xKvsfeInK1Qvz4r19JQFx3bBw9od9/dUqrd2/NTAn+erlLBRCN9faEiuJBm7WIBARxG3rUcgoBzEOBaxxLejk/MYL3hM+3NEBag/f/q/fNClvFhQbH5T4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356377; c=relaxed/simple;
	bh=2UTQugErUkjnlgTso4ZPMl05HrlaCf/vqe84uNB1gj8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=vGX/U/Ff3Rv0Qx2l1sN0zgs8v1nkmyDNJmY689GT6jPPINZBI36D6GKuaJ5JI1kSg+DdKSIjBYZaZXK2ryCze9ythXlCEbB/TjYUFfudkk2Equ5XhpcICMIqJgWNdhAntYy4R1G3koXjd0KDnhIiqA2+8czQsBxqKYBXLYsSHjQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=ggzycyS7; arc=fail smtp.client-ip=52.101.227.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGY3F1ZMfJUMpI5wDCGjKpanYCYEF2E5NaErbzKpvDFRLI3OrmOJGw9/rD70RPShMDCwu2a5jN32W0y38MNZkqKJ27l96PtKHnyb5UTlMa4yP9lCjaw67zicziUqvvIjs6VPU5V47lcMr4atQCdXXz1pyT7JRygSlE8w4PGk5MGd7giWcWzisi+IZzadEqEa5ecH4+bqmsUa3FBfAgL46mWzZXUexomHtRXFVtYCoiYeb1rkTE+fwo5gLhpmZmohgWGzkLIT0TL5Hdk8JvDDPfy9dsaMykzWwE2RkGANJF5IzTsQw0XAbMEusXd3/HCWoc+96pKn+CGj5ai0pUSzgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9B7Gi2fMG/AEM36p3jXQ4gf2EWIwie+ElUEZCKLHvBw=;
 b=Fslo9SljQE/iTrx3s3LNAL3PT7/6uikB+g8LdUpO7CNuHpUTVLDtYM5Qaj1wKf5Lo6Q4aRTWTKpSw7FJU8WnoRv59+S1Z1Xpntv+zhws/bTTUK28hhH3krVclYt0Vy5z5GJgNt7p/OB2X6Ea81yrJILEyZAzXisiMRVZ8RhwB09HRg1SbWQNmkWrLY3+SZu6G5MYGAGcFz4I31fIEkxGqAFq7IEtbK5+VBbETw+/X9VQ93to+ATQWR+MNJroz4egNOHVUilxo0gW3Zlw91adaP+FGb7dwSxq2MzunWt+WV74GPGFjykp23k49Y6dNjoV98ocjJSCSLxNaAPw1TZiyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9B7Gi2fMG/AEM36p3jXQ4gf2EWIwie+ElUEZCKLHvBw=;
 b=ggzycyS7bRq0RpvMT5mJuFf8KfQjhRrV2ncpO4mOVLHMQaKbSK/K/Hky9cWC3zJdHuZncC6vK8sKbu8HACdhyvWJg0gO+kKll9m1gG9j7AwbPmgCG47ECxva3IblplRLgWYkpNiynXS9rexbdM6exxFl7YlDhTqaKfMNQGu92t/i18qM1FmFDdfZuoi+NtDF6MCwbE3+j1aVLxqwVoH/2uO7ZwpsJNAGhNFj3DpuQbpSCako9rGKJfwbcYBT1LfGlrKh5WAt3sHqp1aBVO7D4Vg2ptzl+8xrMznejC907Hia7hNwxFnyshjQMAOvZc071/7U6NTvEMAaFlTG+kAsLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11e::14)
 by PN2P287MB0854.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:131::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.20; Tue, 24 Mar
 2026 12:46:09 +0000
Received: from MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167]) by MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 ([fe80::f8da:c075:cde1:e167%4]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 12:46:09 +0000
From: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: tarang.raval@siliconsignals.io,
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: i2c: imx415: Drop redundant runtime PM callbacks
Date: Tue, 24 Mar 2026 18:15:24 +0530
Message-Id: <20260324124524.135278-1-elgin.perumbilly@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BM1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::16) To MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:11e::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2178:EE_|PN2P287MB0854:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a21e127-3c79-43b2-3bcb-08de89a352d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|56012099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	OgZBVyXYbS6lAElBKrUxpTDbWGdARpDSRabVQQdIor+JkBeAN2Gbj5DQlhs/wWLOU0wuSbmJTG+tr/o6fJqXVuXoehm0E3tjmiZidd8R0AJCvXmh+hXKqaBjgAPmUNEZe6uFV7fuFO2bJb/pbpD7OGB3XD/KSqePhA5Zmn4L74RHxpjfoZ2P5QvcTgeN2jR2xxPAFiNUPPBtWQzMlyGHzzuO6NZX1nBPYxJPf6hcsgEzUG62lQ2YJxFPww1xtwYnz8zW7wd1OfEkbYZuJQ1q+vam/WHK3mHvwCRIrYtZD0Qehc5cjPkc0szMFkJvkQRTNjwJx7hDtE3VrkBWD9sWc5ni/lELAJBNZGvvvjaXFcKVJ6DyDYBnNDBhi/6WzxQt9DKmgdhluPMwOYZ5gI/fIKi0zwKmejf22/iVqdryBKDR7aASLNmuSeUlUwvWPNNqoc/hO6bHmJBGzh6CS2vxHalYdh4Gp8l0TUr7ZsKOzg1BZA296slWd0n4YcVNI5GDXm5ibuY+q+6QKpX9uN6GVTKWVwMn4x97NA9EMYEXCAHDZDIZeuLGiEmY8W8iYhg7yqS+6Wgcg397IFwTs69daeq/2Y3FE5uud6Yxa3Z5iZzgjb2+oizyb9ZW6QSW+WkyR8+xtWC1DtwQr1PPGiZrdjnrXjL723DoniPT4Nouj24HVkybTNFPdrUkn1I5G8zBBC1ouFi2bIY8XE6Ii1G7VB5tlUWipneTAHgg5jxL1ATdsK9SjlLh8Cuzb5mh0SWWzDeonyx9VnyQ0k32MxY6P/7viO1ZGJKxY5yypJPw2NQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA0P287MB2178.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(56012099003)(18002099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BxHaf7L+Ty4jz291QV0efr+3eNk52X5ixmnscBFNGOURUO0BzApQ1FBqhReW?=
 =?us-ascii?Q?Raxy8nrNxg65RZysiM1YZK0zPo+QdUGOdmF7KGcPbooPHhUmng1ByoUDRdFT?=
 =?us-ascii?Q?ODckcT9mTBTc4cuyrvxBRzUVV0incd1xvVuv2G80I5L5dzShKGk0gSSOQFwf?=
 =?us-ascii?Q?ibTHOPAP7Cnfu49J+rdy+ghabgoc8SNIKDO4LT4/arXNAzwIGWmJSLyrSuQk?=
 =?us-ascii?Q?MLqDsg9nHh5Xr5C1gJDwkN8s4jbnAHaAB6fS8B7CvstVF908jHZwT/SRYlFR?=
 =?us-ascii?Q?yyISvMmmOzNIhdlSnZoCDd/JCEfHKAAKdXNc52zHEWo9jkZWAaH+Sivm7Zwn?=
 =?us-ascii?Q?zN6c5toXv60SMsiec1hoaqD0ensyQlC+NSM+qAB7HbOUzghjyIcjpiBRlOVt?=
 =?us-ascii?Q?vKRfPmfnNKkFYNGLoZ3CFZ77518zqOJenNxr6BROOTUJDXB4NF2h4jmdkmOG?=
 =?us-ascii?Q?WKezOav72QckRRX6ctgvWW1TedVRi1HogUJkVffHT7vCRyGyOjc3goh/c0ZO?=
 =?us-ascii?Q?QzWU6Z+4Gd5xPdZIQ3faYQQ8igtkLdPJA1e+Uwd6q34SyR8mPg0mJQDMjepZ?=
 =?us-ascii?Q?mva5j9f7XdMiXtlEzz/deT33GkU1LAUcXIijz7i5xLi7hULHuysCucRdj0UV?=
 =?us-ascii?Q?qWZbZByl3Jjz6rulkGIVvvZ+zGqOrQCQ2it//6SKz9OSA0gVbRhXfv8MVAsH?=
 =?us-ascii?Q?lTOawm5aY63bAZGu2J38U2I1smhpIl/9e6vX+I8Poxf/eZGW0LjvjWPOBqk7?=
 =?us-ascii?Q?q1+0fbm5QbCKN1KyZzswc7qLlbig+yi3OzMvy3YUkUG4UvveYi6MYFF6Xm+c?=
 =?us-ascii?Q?I+UARZXxugzy0Cf9LelEhcUha+iNjl9xLQCcklsEHQKrP/PBOGeFzTDgdhnM?=
 =?us-ascii?Q?kYfxVXYrLG1j7wpT4eNDWbXH7IU1bxPgbqszP6RUxJ0WAfShyyLaWBOY7yVG?=
 =?us-ascii?Q?4qXXTjdAwOZtuhHDY7jpgS1vk3FdbZExz6KJxvPjaeQO1FXn1ormFzUO4cp4?=
 =?us-ascii?Q?dEgT77Yfae00syeNlmJP7iByB2uFonxUgAikB0aBJKy611Re+D2dV76K/Zmb?=
 =?us-ascii?Q?2elB7bn5CJhmMQofx5bZbmsMb/8XH30d76YYGpcFPFq3ENUeSSqCwq4I75Pj?=
 =?us-ascii?Q?DC4/5i3QYIihvTz0yIRuBVn5wmJeXuYL7KUi4uvP87/o0Qbn9cC8bMjC+i/d?=
 =?us-ascii?Q?b6C7diRob6i3FU6Z5I8hIubV26CvEWqIeO39N7jInUEfX++W2eyo0Dfx737w?=
 =?us-ascii?Q?4RGSUt01ZtJf19PD/MH9uePsub9JiIugUZvzrz0gY32arf8Y218naoDafxux?=
 =?us-ascii?Q?jvblHNCsp2Y9GkkupXJsxdGhUcWoYwTrT1CQPiqWMSTjbxWhu10/J39B+F92?=
 =?us-ascii?Q?SEaa/Bixbl3i/iJtSXkFBIcVL3J40EWqxHZO3MFu22awFtj8odWH+I2TL44m?=
 =?us-ascii?Q?wlLLFaPqjgDF7gtDsAQ0NMlb2bw62RsKr4KEZykQUwSnRlpLN0/gq3mXfTYe?=
 =?us-ascii?Q?a0VPONi8p1nGvi+tK+5arZe942s+bWA7XrMLDuwSSceWGjWYL2MBW4CoE0O3?=
 =?us-ascii?Q?Thxpq5uMEHQq//hSnNitR92g31SgyKJ20YST3mCoOkDhIb8ljN1SHSgSNf6a?=
 =?us-ascii?Q?M3r+KYQH2iwjXhG9g35j31k5Go2jkXT3pcS5GxDsmve6orG6hTq/wlYStwXy?=
 =?us-ascii?Q?iKgH58YPZQYwcLTYpkEC1LHOxFDICHXLbvaqr/XKgXxc7F9F5XKqqS7kcs/a?=
 =?us-ascii?Q?TJvLz0rdBg31aS2IQoUUheTypPgoedfDKeXNcBjqvuak0Ii/ll5z?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a21e127-3c79-43b2-3bcb-08de89a352d2
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2178.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 12:46:09.6227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: htAkBXCkGu+WVpMcNlxEYXdslJ/u6PjFvbNFHKTh8rDw7HyfSgT6cNdrq8oRS8W70eiRwe7R354Sh5RmyM1vYakY7QDa8qbZqCrVzszLuxjrxgdtEAoOBW6dS5Sx3q91
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0854
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[siliconsignals.io,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[siliconsignals.io:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-56876-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[siliconsignals.io:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elgin.perumbilly@siliconsignals.io,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,siliconsignals.io:dkim,siliconsignals.io:email,siliconsignals.io:mid]
X-Rspamd-Queue-Id: 0A5B0308AE6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace runtime_suspend/resume wrappers by using power helpers
directly with DEFINE_RUNTIME_DEV_PM_OPS().

Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
---
 drivers/media/i2c/imx415.c | 44 +++++++++++++++-----------------------
 1 file changed, 17 insertions(+), 27 deletions(-)

diff --git a/drivers/media/i2c/imx415.c b/drivers/media/i2c/imx415.c
index 0b424c17e880..b7d44f3e165b 100644
--- a/drivers/media/i2c/imx415.c
+++ b/drivers/media/i2c/imx415.c
@@ -1129,8 +1129,12 @@ static void imx415_subdev_cleanup(struct imx415 *sensor)
 	v4l2_ctrl_handler_free(&sensor->ctrls);
 }

-static int imx415_power_on(struct imx415 *sensor)
+static int imx415_power_on(struct device *dev)
 {
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
+	struct imx415 *sensor = to_imx415(subdev);
+
 	int ret;

 	ret = regulator_bulk_enable(ARRAY_SIZE(sensor->supplies),
@@ -1161,11 +1165,17 @@ static int imx415_power_on(struct imx415 *sensor)
 	return ret;
 }

-static void imx415_power_off(struct imx415 *sensor)
+static int imx415_power_off(struct device *dev)
 {
+	struct i2c_client *client = to_i2c_client(dev);
+	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
+	struct imx415 *sensor = to_imx415(subdev);
+
 	clk_disable_unprepare(sensor->clk);
 	gpiod_set_value_cansleep(sensor->reset, 1);
 	regulator_bulk_disable(ARRAY_SIZE(sensor->supplies), sensor->supplies);
+
+	return 0;
 }

 static int imx415_identify_model(struct imx415 *sensor)
@@ -1371,7 +1381,7 @@ static int imx415_probe(struct i2c_client *client)
 	 * work when runtime PM is disabled in the kernel. To that end, power
 	 * the sensor on manually here, identify it, and fully initialize it.
 	 */
-	ret = imx415_power_on(sensor);
+	ret = imx415_power_on(sensor->dev);
 	if (ret)
 		return ret;

@@ -1411,7 +1421,7 @@ static int imx415_probe(struct i2c_client *client)
 	pm_runtime_put_noidle(sensor->dev);
 	imx415_subdev_cleanup(sensor);
 err_power:
-	imx415_power_off(sensor);
+	imx415_power_off(sensor->dev);
 	return ret;
 }

@@ -1430,32 +1440,12 @@ static void imx415_remove(struct i2c_client *client)
 	 */
 	pm_runtime_disable(sensor->dev);
 	if (!pm_runtime_status_suspended(sensor->dev))
-		imx415_power_off(sensor);
+		imx415_power_off(sensor->dev);
 	pm_runtime_set_suspended(sensor->dev);
 }

-static int imx415_runtime_resume(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct imx415 *sensor = to_imx415(subdev);
-
-	return imx415_power_on(sensor);
-}
-
-static int imx415_runtime_suspend(struct device *dev)
-{
-	struct i2c_client *client = to_i2c_client(dev);
-	struct v4l2_subdev *subdev = i2c_get_clientdata(client);
-	struct imx415 *sensor = to_imx415(subdev);
-
-	imx415_power_off(sensor);
-
-	return 0;
-}
-
-static DEFINE_RUNTIME_DEV_PM_OPS(imx415_pm_ops, imx415_runtime_suspend,
-				 imx415_runtime_resume, NULL);
+static DEFINE_RUNTIME_DEV_PM_OPS(imx415_pm_ops, imx415_power_off,
+				 imx415_power_on, NULL);

 static const struct of_device_id imx415_of_match[] = {
 	{ .compatible = "sony,imx415" },
--
2.34.1


