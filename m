Return-Path: <linux-media+bounces-27544-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B55A4F6F6
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 07:15:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FBB67A905A
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 06:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC7B11E5B77;
	Wed,  5 Mar 2025 06:14:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020075.outbound.protection.outlook.com [52.101.227.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BC81DE4EC;
	Wed,  5 Mar 2025 06:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741155252; cv=fail; b=ddhcFiHYC1pu2YbAObzoQCnxeFof2EWAWJ31ADA41gQ5AMT+aO6PnDWYJhpNWY8btHtMO6AtV7AWf06UMT2K+24LEdPi/cftkMGQ1FLFF7W0xblmCX2LqDidU94uctc7Ru54u++U/e0Z+CZpEXyZqHv1fJqpJKLvb5Z6Ds6vlFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741155252; c=relaxed/simple;
	bh=Mu59Gj2/APELO742uAKdKEFoZ+MDRMwaXz77ZnRDFls=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A2bnHly2SqpGNTQch79ed4qT56h9nZW2Yo/tYl4OsAIICPv6tzBtUn+5ZNlVlz/HqJXLXwnYv4dc/9EnmAtes1wlyj/F2kwbXQnvtWVTP6RTC0gibDLTUjYiy/7CNRuufi+sTXkD4pTjnjLKeRA3cgloVhCjrbqbSt2uHr741Rc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dNcXYsJajFfc9gSR4Sq7g6OOjGwKyh2pAYJQ+z5AGObyhmBHPAUrCGZIKAGDGtu1Z3IJed4/slLQOFqgn5gAwT9VXaq3C9CXURX0zxjFzsD4wE247p/RxCKemIHukPp+SJcCm4RbrKDywTIoRPrlPhoVJrluBeu6ruif1KQFgePDopVQyyy50BN2IAyOrCKsvDHfW5WURcKwrR+82KvK9VG9qoD/5Bd0VeMqWKJp8EN8O7eNF51+kdz20EnOb3bUiUe4SXOnSsbwJYKMwjlgv/plyp9piPJd5JSnKCnvbZjFAX+E0+8Fbl/YsQmPcUycelFwUJDlwNSiI2J01kDXWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kDqJRTGj4qJc1uE9t7tu74v6Mtqk4B8hIfQkFENXhxg=;
 b=D0dKapFZbu0bxadTStRoWVE/Nl0JqxA4rNGdVGLqDE9QVE/VMpHgXXMxhW5iEOX8SOhtyduXHje3aSMUdfTgBdGYfXo2yBMdx0hQ8v8tt3AMvVBJGr0rtbspPXAByXk09wWA+8FJHdYqwCE7qSXzsHOnQKF5OGZv2EhKXbkUf2xBuldEgo1Mx0bWn7pHkRLYv9tDOfJsCJQVzYq6myq+3Daon0q+m7EYUmVDhHaWH5Z8kmc+eQ7kEnGSSYXGVX+4r3/5WgR1yjnbvNh3UTramQ6mgrYjbIHrFZmAfaKAUAidkE2TtPnDotkZVBdbo2Kq5ObFnoK/T/k2BroAuoauNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by PN2P287MB1027.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:154::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 06:14:06 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 06:14:06 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: imx219: Enable runtime PM autosuspend
Date: Wed,  5 Mar 2025 11:43:09 +0530
Message-Id: <20250305061309.17911-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305061309.17911-1-tarang.raval@siliconsignals.io>
References: <20250305061309.17911-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN3PEPF00000189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::54) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|PN2P287MB1027:EE_
X-MS-Office365-Filtering-Correlation-Id: 58ad64e8-6d2b-48dd-0c67-08dd5bacef4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fxI0TZ6aneBEgHSQo9yKfcNJ55pD64WcQw9tf0kuuyNPSLpf4Q3lIdin+prP?=
 =?us-ascii?Q?ETpQHlFsjXOO2OFrtisAFh5xO5pSGdHDF5GpksERWNApQFu7XlxMtbIVa3K+?=
 =?us-ascii?Q?CGe2XILPNGFEcYAoJDpk7QOgB34CFr+CxVMfk1np8LiFLezhv56XvSjR2yHd?=
 =?us-ascii?Q?DIZYWXFtBE6g95hP0vMJXAxrSLcPKl21MAELrlwZN8nlXy5SnPrAi4eQHVAD?=
 =?us-ascii?Q?g/LZvImG/1rOUbBKX9Zv2Gc8KFfcfZr3BIUykAqtggqCiUaVPfd7p257C/eT?=
 =?us-ascii?Q?UB8UQX+ANfLskLRfpTyMPT3Mzw+/PkoXlLve9olqeq7Q8YUUiS0qKAXDxs9U?=
 =?us-ascii?Q?ahhqid8raCDahljqIBbTdyhw/LrSJ62LKtGfRX5XPDUCZai6XM18MoLPd0h/?=
 =?us-ascii?Q?V90qrnUa1GhG0gITQTJuYm71fZYaD/jMGZe2PT2MMt9A3ZsBv1nKVycGdUmk?=
 =?us-ascii?Q?QVgQLR3z6FybgRojqdcpfcxBTAfzq7nn2/jdbzZbtFGvYXeP9J4FFzLdWqFc?=
 =?us-ascii?Q?6g7wu5110b2Z5STlHt4pm1wScIqgRZ7nWZWwyJp1EO8bwlamLRJD7iWiC2Ib?=
 =?us-ascii?Q?+b3TmokrFiAt2aDZ+CM4O5fnySbefIhAg+uIlMFxZj7myR027mH/KuDznGK6?=
 =?us-ascii?Q?GfyFsyzRaTWuqDAAGBN1s3gy26F4AgSEuv6QzfMq7v/AwpS4OfEm0b0KUySe?=
 =?us-ascii?Q?CBvwNZuMKMmXJfS3GX4Grz2JxsV5kO3Q0MpPr3n9EYFSMni/TnuvFQWxq9Vk?=
 =?us-ascii?Q?eb6oMpsLmvQbBEOm4VDUFTtARwMgYAnEXJntp0Eyg6UNEG3p6TWr1PC4Xk/b?=
 =?us-ascii?Q?M/oUYPh3QiYDw41ftDdxOrLdunjSwYUtFt7VTVJ8pFCDljxXwLNqit4J0s6d?=
 =?us-ascii?Q?5JNySFL3D9t+a50cdxqKyow+NaPA7ZBSvDMfWv6jHEAgziv/LIpGYnxsrQsa?=
 =?us-ascii?Q?w9u8k8o2+pM3ub7FFo14Gj4EAcvWjbAdZnDYH3hr1GC2G1FrBjyBv006PyPC?=
 =?us-ascii?Q?bt/UXL6FIB0/DBBS/QXqSX6SJnRMwsaQ4EodHnWlLj19cbANZ87d4lAol6LZ?=
 =?us-ascii?Q?BSlBIii1uove9RRURbV6pgx1IhzfdyBrmSJAp1QCMpMZbwW/4ae6RmOHqYE1?=
 =?us-ascii?Q?XGxAYI5UdHaBw0MdVFLzM1HB8ajV5Rib/Su7ywxIN7K68WjDc8FMzbovsLz5?=
 =?us-ascii?Q?fU62cLNb3eMeE/C/CrkyM07+Zh2HYrT5MdqCP3Kd1wrXxMJd7P3KEw6MOu96?=
 =?us-ascii?Q?bmAp8E/58ECJyn2FRqp9neGKBIcZoRLlAZePKzxIBNnXL8Yuwnf6AJvjUMc6?=
 =?us-ascii?Q?ttkLT9FKjoUrpIbNRSfOR1UyeHYF6AjDFcjKxLN7nxHWYG7N0hOgicecUh+J?=
 =?us-ascii?Q?uHAgb9G3Q6MJihncYii/rWxJ0y4KEfN4Ao25l7RYSsZwB25TWDUtU+RtlkyP?=
 =?us-ascii?Q?t+6AqHAvEvbr5yxvzwdauwQNoVIitp2L?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NekoHRltSEsz+NCF/Fiom3Bz/UxdapEx4imyoX2jdxS/MTcxfD6BLLl2cOJx?=
 =?us-ascii?Q?dxZKgmc0V48vilY/kItHjZBQPpB4crftdLTMFO303PfAXhT0qX5v7eo2A+Kn?=
 =?us-ascii?Q?qVPMsbLy93XEqs1XruPbVmjrIlpixAC5qvyJKE1FRiQwTqIhOuZRxQp0Fnft?=
 =?us-ascii?Q?KhZX+zd+KSY0UgvhO15Nl+MoKT2NRYcU6VqxMNhf8tN1TN/iCIjmsi9EGDwW?=
 =?us-ascii?Q?b8frsJCI6HZOdbmL5Ww0Qx/NqhM5eKTytsdDhixPDRbblOdVtGygKtaw4KD5?=
 =?us-ascii?Q?b6OaidgJgy16vU9iH3j/33qyJDoxwGpatIpEx5s6gy4I0cWJ1uoxiGiSfiGn?=
 =?us-ascii?Q?6U5+v+p/DijvpxLxjMXn/NQ5UTPdfQkbBG/bicbCHXWQJdykspHK3L98oU8c?=
 =?us-ascii?Q?4uIpimS3JugveN1wnEJxabVlk9m/nG1JS0mZ+e3EsxCBSSoZw18g/nmxzAb6?=
 =?us-ascii?Q?7fK8zuDeA8hzsBP7m1Mpw2hhEaMP4h9SfQ4KhGApEHLZoXqnzABYfc2aGSWd?=
 =?us-ascii?Q?RtKoUMJzXzmGnXKvsuMPNaB8NwVX6UzzzLoyxZR+eRh2Mz881zyk9k8f2N+p?=
 =?us-ascii?Q?rB1caAgnjmCuQP4Og0Q+9OS9LBrLbuBulwrvUm8Itq3XOPWIwuAUcvuF54CW?=
 =?us-ascii?Q?I1gM8nrSf+5LsJgfuEdJreDrxCLsFkptsuA6V7R3tPbUSBkj3zQlSm6rnW5M?=
 =?us-ascii?Q?xcJFsUHT0iUJPffMYpRC3FFW4svfqt7ILTL+ic+7Ui13lWONSpq2baHPcF6m?=
 =?us-ascii?Q?Msa0QvjGSN/qSnuYCPkbAOW2Z0ObQiP7iGjmkYKhXSpAhjlICfR6H8Gz5SYA?=
 =?us-ascii?Q?IWPOXqnO8LtsmwopedS0V02k69sLHQG0fbcmPTq6KhOqWp41hDZ9QPEaX3gN?=
 =?us-ascii?Q?vETfyxDff4bIGVigdZVyGwmde/OGOz6k7hUFBR88s0nDrEiiCfxetaKm+JIe?=
 =?us-ascii?Q?ziwvvLYCMDYV+ZQ987kLRAu1831khl5f6nXS6p4J2f03eT9k+y3ZTf9GOkTX?=
 =?us-ascii?Q?5HLE8MX0IR8acRH/h7QOirZhHCOihchDUeOzsumn1c2SVr/d3UMwCgFxX3Jk?=
 =?us-ascii?Q?jZyfFIAYcllnkZRx4Cty6cvR+2cKQSWTwTYdFt0xgxYn2BBHXLOqvfaW/CeR?=
 =?us-ascii?Q?djdBEl/LZwQ2QeZpvK6FHQPL+xTowlXUwcpxvXXhr3YN0wQ/A4tXnfe2ZFjj?=
 =?us-ascii?Q?0EjxMXdw+PHUKQHP67c570oO0v0inK7UawFBrMCR+nOWOGTfFirf27KvXe/+?=
 =?us-ascii?Q?iHK7sez/h/gDx3FKd0XDesDADnsA0twNQ9w9V/2c+5mx7+lOy5WpIMu2y65V?=
 =?us-ascii?Q?1ap944D+0O61UvrvEG+mPZae6sBg/lzyJf51Ux1AA3fKycBw08aPH+5HbSe1?=
 =?us-ascii?Q?mztDGEY4VdL5kaCsGkENGTHSiqJtFSG1b+caC+BdTKkFdFQxlXKDcpHEHr7i?=
 =?us-ascii?Q?X8ealD4+qAlkDbPrtLUTiHs191yKZniVt+WF0X+Dqp5eqWFaGCylYYGilg9S?=
 =?us-ascii?Q?vCi1VlKTB3TUuJVRU6IhAlUQyxLFYxVbYKrzdwO4BO1fEXfmiCqvw10X6VYt?=
 =?us-ascii?Q?Cse2792wP3ncpvSqeJ4ijsuaiYF5Ufof4ZU28QIZcRlwp2/Gvb5oo95ZngEf?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ad64e8-6d2b-48dd-0c67-08dd5bacef4d
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 06:14:06.4670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5Y6u3VRNcC5p2oZpQmod7c7lcIL9T2f8BdvP9FN8rSN+w57JS+3wZmj9pptBj9YcmidmcCGzhMM3kFu2gHJAEYGRDqdarkVX+RgtycO96c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB1027

Use pm_runtime_put_autosuspend() instead of pm_runtime_put()
to allow autosuspend. Set a 1000ms autosuspend delay in
imx219_probe() to improve power efficiency.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 75d3123d47b4..5e134c9029cb 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -775,7 +775,8 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 	return ret;
 }
 
@@ -796,7 +797,8 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
 	if (ret)
 		dev_err(&client->dev, "%s failed to set stream\n", __func__);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1268,6 +1270,8 @@ static int imx219_probe(struct i2c_client *client)
 	}
 
 	pm_runtime_idle(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	return 0;
 
-- 
2.34.1


