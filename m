Return-Path: <linux-media+bounces-27641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E987A501D5
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 15:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01C0F3B0C8F
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B960D24E01A;
	Wed,  5 Mar 2025 14:23:01 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazon11020107.outbound.protection.outlook.com [52.101.227.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D2924E4A0;
	Wed,  5 Mar 2025 14:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.227.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741184581; cv=fail; b=d4puQbiggQZlErHumcLcpa/SuC8ZfPXeNYlmL3u1voltgaayQq7jpwVlw68xFPu98koRCmITFWXLVF/gd91V4Uht+j5TU/XJ8WQ/akKW/h4v9KHa0bXi2vvVpbTVnu/0alZ8ijp510O+0+DZE9SAJ6Fyk7ky3st7BOC78TmvbN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741184581; c=relaxed/simple;
	bh=0eayuhFhVwQU3vb6K/w4wa1Jv3KL1e6txft/JEbdADg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iroipApAY1p+uQiTHHpg71aR32dIrGpYvEpfsfA1c+irCwv8CdVyo1uK6s9M4i/u32pLOtMjtJU2ew65g4wM+d6EPfdS470Mx78unJGNJP4w2rFWwT9CtTkesgJ1C8A/HYgQc+19jnezIYbWcHGcmFPbaH+6eh8A2jMgaf6YSBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=52.101.227.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B9A5X6379oExi+ST7BTnLM9lTvocTbiCofvs3WXvL9ZwEJ35t2uvubGVseHjYMT2PQZUXKbzkbNM5R2+xMFt15kcGHyIrq49wfU4CBTgskDsQC3ZYxh9JHmJONlGl/hI3XNJt0BzPz14QblaFZT3fyMM4zZGHM8QAoMiTuUJjfqU++SOKkdOZX6aL9078Pml0CzTnNwoXAJAjpLytEJ4i0frHgT8ResnZmcbBkAKbNJZ7KZrCu7WMVn/8lH3fLEcYONct/2ba3sTOtFXhpaJd+g7Hu3yYQ9wDzGfn7S9HeoCJiMQi9M5I4NARN3b5dasZGBVXJ4qmSYQn0eIIy4zVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHW2cgajjpHAIf+7wcHQd5ExKKfxv9LFuQTfJthd/IY=;
 b=xTlI87uW9a/7tnhkNwk8s09mqY0tKHrPX9VRM6drU/9KOH2xM4/gt0JnjVjJNvt15L47isuvgb9gWG7tw7VGYmTmQecskdNEA4p+eVvuuEODB9HHi2UViA8zqnr0+he8cytv8AGoDeBy4AXTOsfmWKsdKRKwF0ehLirV3Aj9xSWf8hMoCcyT+oUojdwO8LGGbnf86sQTkby3TEnL2gyAqXVCQSExsQYz6v/XDKq1nAwGR6SWGTfZ1v2JyiEAZ84tU1dlptHYUoddvp5sq/4H2n7wvR6yHv/+Hfp7o6NbJ5Jm9VDPvXR6NPIqziSc6MA2AKVFKfDnsxUbzn37huRc0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:199::7)
 by MA0P287MB0313.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Wed, 5 Mar
 2025 14:22:55 +0000
Received: from PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f]) by PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 ([fe80::58ec:81a0:9454:689f%3]) with mapi id 15.20.8511.017; Wed, 5 Mar 2025
 14:22:55 +0000
From: Tarang Raval <tarang.raval@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: kieran.bingham@ideasonboard.com,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] media: i2c: imx219: Enable runtime PM autosuspend
Date: Wed,  5 Mar 2025 19:51:16 +0530
Message-Id: <20250305142117.29182-3-tarang.raval@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305142117.29182-1-tarang.raval@siliconsignals.io>
References: <20250305142117.29182-1-tarang.raval@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXP287CA0005.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:2c::19) To PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:199::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN3P287MB1829:EE_|MA0P287MB0313:EE_
X-MS-Office365-Filtering-Correlation-Id: 96769ba7-8558-466f-229b-08dd5bf13878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0yM+ReiJFd4wUs1mc6oIYq/0BCEwiTLq26/62gGGGheDNx7YIMwcFX8xlWqO?=
 =?us-ascii?Q?T2zBYoBvxUtjdB9op0MdvmcgRdNkp5OPwBmkFhB3W6/ogWJ09ePwagyDsfnP?=
 =?us-ascii?Q?ZRxqE7XHLWgsOMP9O3YGiazvktW+HQbqE4CnwXCKeToQ9x7yDhQ4GnpjNc7f?=
 =?us-ascii?Q?32d5kzMOkr4ZxnOy6b4TVB2vtAy/4RGLkD859acfxjCJIhANijpauBNRgRQ/?=
 =?us-ascii?Q?DXbTstbMASXQqz6bHD/BbmHBCs+X2W6sI5NMIOeT7UejywGbBo8aiUcqNg0C?=
 =?us-ascii?Q?LewLPPo9JaF5aDqqdRMKxJNyF5C7YVFYz+y7TnutEUNKo0Y3bsWK7RO/DSIa?=
 =?us-ascii?Q?MQtdNaB59fZM9UnENmJ36xdMJ5G1IH/sZC7MWe1YohKwKBCr+wrmY6e+2FMX?=
 =?us-ascii?Q?0EESxZN9cOsuVjILBRFKUiabsyRQ3qgGTlycbSe3OCKn8JAnFl1MmIQDyo68?=
 =?us-ascii?Q?Y5w0H0IB0sfZXJeNhp18L48DjkYZT8oDIcMuo0moq0+GG4WtVG2pWVIsWtbW?=
 =?us-ascii?Q?ss+9T3IGCHYZBqsBhlCEfkIzpAduIVcW8Df3YSdjSUvUtWD6BoTfYu5LI20X?=
 =?us-ascii?Q?EoNp9jdZGiYycJvHqZNP3FVs0G5sxM0kL04l5ae1AUDrMD8UTPGCkUfR5+RE?=
 =?us-ascii?Q?D4nXZKfEVh7JZp8dN5TVe5Ibyrtrg6Rl3Mp8LyairYo65kHJzOfrFccLlpnN?=
 =?us-ascii?Q?gaP6bBqtgNDNbN1v/7oDvpyC9STujjg2rfErKGxbLkw8gG+6Gmb+MaMh7+cc?=
 =?us-ascii?Q?Gouv3IR5tprYcuphi6QT314Kqo9CJVD1cwVjY+/xYyg9ZSktlQ75Zkv9YvN8?=
 =?us-ascii?Q?6UMm3v6TSrvt3yWsGNkKjzo4gzTXLszsDirci4PJVY0DlFQcZs90+u6Mj4fX?=
 =?us-ascii?Q?ogobyODlRZVSS2vY+hEutExav+Wg5dPjI94g+r0Rd+AQeFpk/6vCKBvyKJjF?=
 =?us-ascii?Q?4eAnUt8Qmo0wOClUowJgjxtBvj0fbIISnduD3NLcQlioVbuOvk5L31cs/cE7?=
 =?us-ascii?Q?uLYaLPLDsqppoaDbLJAr0HZtLFLmlD0W7SPeGnSssx/ViET+892Cqw2TglmG?=
 =?us-ascii?Q?S6cXXelbZAzexXLIkmM8fZHpe3WLZjAE85OABNBk7f5+P8y8fpJTZ3ptZ37x?=
 =?us-ascii?Q?oT4x7g32lFdnmDLty90YGQwFkmp1CjO7G8S+o2yh+HuKDGmpfGaOmgDLk+JF?=
 =?us-ascii?Q?w9vfMuSK6eOEJyHqMSIpzZFW83hmpsVjiWGkC6elbt5nY9EmmfI97ZuK7JdG?=
 =?us-ascii?Q?EUR28o51NPo+noitmHGI4DsIi3NpLRHSpIzuuEYOazR/LbNSePx+mgls/Rsb?=
 =?us-ascii?Q?ASJB4T2p7ZCoFQ0AbnsNjgX6H0HepgaC5btl/GuBuS7bNwXt/pffylFJOMCr?=
 =?us-ascii?Q?SRQEg3gjcobRhRB2zPUvsAmCB7JhUmjz7jof8/kt60QlS8/3wDPv4cnUgOuq?=
 =?us-ascii?Q?ve5aRa6atRmu3Ks6nEXnuHkmgXZL6rPc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3P287MB1829.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d3lIkbwZAHdZ10nFBsr7OcXl+SPnvtdRWOOQTUHuuFaQ4OsnKHBm9hof8mB8?=
 =?us-ascii?Q?tGmlzvu85feE5PBYNYML7Uav63yFEkR4uCa5RNd+UHYSP5Sohk03niDAmsvK?=
 =?us-ascii?Q?EEFl1cZk3kt9GLFqxCkPYW10utpWgh3CzQD/pQuqQl6oAHmKogjfvcovbEOj?=
 =?us-ascii?Q?umzAR61BRWN+4pK9HQGPTNaBdecaLL1TlBvsOAoF8tI2JHQWgjerkvj1Rsn7?=
 =?us-ascii?Q?jBXhjVq8exS3UQjL0meOveeUWgf7EpxnqjWNMwctVvnPow4HDmkHSnXrApy3?=
 =?us-ascii?Q?85AHiHKjM+ATKkoLZO1YLScaEUh5eGotMmnGi4KVWShSAadROy+oa/6tltox?=
 =?us-ascii?Q?lnLntxpXkfaVQUfYOeaS1d8q6hBqb5THrtceAbydcpysxaIPi0V/cEj0hqBD?=
 =?us-ascii?Q?leipHE/NprnA0v1SiyHdTLEcCmUeeiEBZDJtLSMK2Ta1z0LyYoEM39VLQApj?=
 =?us-ascii?Q?8vofE1I6s431gEGdXkmTCLFiauRTVxmLa6QbX4mLRRIns7PwjJd2vslJrjwE?=
 =?us-ascii?Q?EcT/7MfMXur97v2ShNtyWR7e40HeI8btdKmgpvKxQn1HQ4OFE9Chia+H/kXG?=
 =?us-ascii?Q?w/EQIqppAGaAeXK0bz05S5p5FM+602bFIJQVPmFLkeF87voUQHw2LUnuQo8h?=
 =?us-ascii?Q?qJZSxSxO30W4sMssFaRv4B7Xlj+WoBUGQjVOA4T78FaqP0vGtWse9qDtGmni?=
 =?us-ascii?Q?O3oF4RiInbdkeE3fXI4F9WWw5bIq8t/OiZf7B/4f9rgUG2Hd6zOYW3DlqtIA?=
 =?us-ascii?Q?F0GeqLwBR3QsA+C8AiiK0cVg4KrjOFDhE9+NRLPl6v55MAk+Cp0NcpaOPRYG?=
 =?us-ascii?Q?Yync3VlMyjaB6dv3lk+SCVJjKkZrPUbWma1XCp49xxHVlXyFg5LKq4WPk9Kl?=
 =?us-ascii?Q?HKgSg6drTQvoe/+rhCOr0o96Litxy+ktChG3lsC/jyl7cT4xY9LvUJX/f5So?=
 =?us-ascii?Q?0EQLic6cnZOf/1JeeJQUu0BgD/HqyRHhgRRXmVrJznUmZkRpgEzkMhjjl7oQ?=
 =?us-ascii?Q?4lqAqaxHaCpOGapskCOythy4Xx20SFJ3brmzVA6uMFFDSsb8rWssx0mdKI43?=
 =?us-ascii?Q?2MuNKf13mr61jtza3otC1DuV8eU+1JtkyPxt85izqVKNRfW9zem1mKWtthIe?=
 =?us-ascii?Q?nWUEW57BQ1LDCIFpHghKuN/5Mu5fmFOMxJmDLNs7LeuyWLiAP5ZjkIGMajcd?=
 =?us-ascii?Q?nDfIyPdBfcPnQ56noBDukgQRO7cZnE2kG01bFORsrWcbOJJASXX6YRq61HlH?=
 =?us-ascii?Q?0QVU7YCo5IAUbOh+vtIAxkNbGuKyqLfhuPR4xGyXPAohC4nrC6pt++wzGMax?=
 =?us-ascii?Q?6uwUd8UEvgZXYvgNhfbXz88ZJ0NHELeJUDmisYerUuG4pzu6pTyJjvzENZxb?=
 =?us-ascii?Q?S96GBYBTp94z1qut076qLi2vpkmpq5QArpfu4J30/X/02BU9bwNNIj/TG4B0?=
 =?us-ascii?Q?vIE8F2DqvUjFDStbEhmFoepwh4qsgb7h+881O1QTLcGThLga0XXeTNZBHTo3?=
 =?us-ascii?Q?ESwPjYJX6nbYTqLLLVd1vTI3OsBQPqaw2ZZTs0V+HWn7V1qkAxvdxNxIrn1G?=
 =?us-ascii?Q?FgrOrZn8wOetHPREXa/6Pip0cGEcoVUmdW+ZBsu7cOrQA8mV3GZWCAQIjnxa?=
 =?us-ascii?Q?NQ=3D=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 96769ba7-8558-466f-229b-08dd5bf13878
X-MS-Exchange-CrossTenant-AuthSource: PN3P287MB1829.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 14:22:54.9939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MgjjiTn6HMT5L7lp353kpaKWA1og8joppkfoMKr9j5bn+cOk+Jh++VNa9rqgfHU1sxgKiXwxZzYIO1y6mNF4QGdbgNSUOLOYmTR46ZU/dyA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0313

Use pm_runtime_put_autosuspend() instead of pm_runtime_put()
to allow autosuspend. Set a 1000ms autosuspend delay in
imx219_probe() to improve power efficiency.

Signed-off-by: Tarang Raval <tarang.raval@siliconsignals.io>
---
 drivers/media/i2c/imx219.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
index 12f1aa8824fe..fb18fdc0a834 100644
--- a/drivers/media/i2c/imx219.c
+++ b/drivers/media/i2c/imx219.c
@@ -779,7 +779,8 @@ static int imx219_enable_streams(struct v4l2_subdev *sd,
 	return 0;
 
 err_rpm_put:
-	pm_runtime_put(&client->dev);
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 	return ret;
 }
 
@@ -803,7 +804,8 @@ static int imx219_disable_streams(struct v4l2_subdev *sd,
 	__v4l2_ctrl_grab(imx219->vflip, false);
 	__v4l2_ctrl_grab(imx219->hflip, false);
 
-	pm_runtime_put(&client->dev);
+	pm_runtime_mark_last_busy(&client->dev);
+	pm_runtime_put_autosuspend(&client->dev);
 
 	return ret;
 }
@@ -1275,6 +1277,8 @@ static int imx219_probe(struct i2c_client *client)
 	}
 
 	pm_runtime_idle(dev);
+	pm_runtime_set_autosuspend_delay(dev, 1000);
+	pm_runtime_use_autosuspend(dev);
 
 	return 0;
 
-- 
2.34.1


