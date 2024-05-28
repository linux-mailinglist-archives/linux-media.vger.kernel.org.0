Return-Path: <linux-media+bounces-12052-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45468D1191
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 04:04:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC98C1C21DE4
	for <lists+linux-media@lfdr.de>; Tue, 28 May 2024 02:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 564F7BE5D;
	Tue, 28 May 2024 02:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="AWD8I1CY"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5278E1C2E;
	Tue, 28 May 2024 02:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716861879; cv=fail; b=ADxbKJ3DbjEgiBCuwl5wNjuAmw92e++YpTucF/u9EFHSEVweHqth+6tYuyJaprtzgsH9aH7yYpsvPWUyC0ZLbZYp03u7nzxYplRRpRaS8amMbiOf9Il/Arhm8kaVDMqCjavjjq8FsXeQd3MU8wkwYL/or2Q9xmMr2DpuU3WHe2s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716861879; c=relaxed/simple;
	bh=tMyT2sSDxBhxe39F54EPp33kXcjYgwxAYK0MYQbFwWs=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WAZAxCM4IyljFueNB2YSXAUTc5uTHYmXef918Ugk7Nw86u40hHor2vXZk4JqcfOBFjamNcvKGnfKTFamHFsemRjmU1epIM2fm+dIW/aFyz1E8711cPRxCvgX6l8STwR+Cnr0FlUNLP0TQXCBwbyhtzSKf59g8+q82YB74J/ICkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=AWD8I1CY; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7H0H11okWGA4Q1t3+sAt/pOZ6syUmxzE+BRH/clal+Let+bkYX2W2kbJS1XAPrFEEfvuS9//CVRytaRw+K0oB6Z16nivbluX0xeex+X5d2vekWatshvz+Yq4enl0mWlT2tsjlzYOKFv0QCYOiSOtymMe8YYyGg5Nu8o/InCV7EmCd1ArAJFfPqZmni0HmzJF8PS2E/f5XxdBFZXpoUV49dkbXsZ0lus71/5xJKAnEJqpRLHBdqq7y+/UxCzTf+u01xkOnq5n8yPYH2qSkEmOtteSCI410r6mvuFz4D9/mogJ5xIXX9D4C7y2yk0zuYt4LqBzSgh/FdUVuS2L3O3fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xPmlE/higG1YRC2kVaDvfjD6V+re8TgdqojDHZgGKo8=;
 b=Ezm00wwu9r+OTp7XCP/0s2La5/ZFvuJM0jQuoK3Ey5sEnS7W/d63DiEz0QOoR5IEadLodTttSW8NlYsqwCP5R1Pir66OlKkMqaEInbTRsKdUr4+C8SxxF9vXNWugfSC2eCKEUa5/ayFBYyY3FgnMwce+J2K7LDcqjQKi/VVzxVRjY/fzSIc7tCkBdndQZMMfHzMgcBOCIxonMBLrS3qUVJ3BAsQtSpUKJdrPu5ooeiLL6ohvcNxT8d7PKumwgBPwez6c9G2sfTDmdftT1KTwQtQffiK7n4QMygGFrh7JehyjIKx6MPZLEpnpX35QXnSTEibUmw+SpnO0acMgXKbQIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPmlE/higG1YRC2kVaDvfjD6V+re8TgdqojDHZgGKo8=;
 b=AWD8I1CYM4Esn+HPyPzZD1I+Funb8hKaiV3UwM3WacD13qL+/+XFXknSFjXTAzFv/HETjEKjKxHcha7E3rGACmrdLKLfNOheY1gbtFhrhzdfyD1qPT0PqW5Jye/5AUtteNVgs59wRQOvXJmIiNYBHS3NuIDqgFsDT+zo2eJ0LrI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB1387.KORP216.PROD.OUTLOOK.COM (2603:1096:301:73::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7611.30; Tue, 28 May 2024 02:04:34 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::9e3d:ee20:8cc7:3c07%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 02:04:34 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org,
	sebastian.fricke@collabora.com,
	m.tretter@pengutronix.de
Cc: linux-kernel@vger.kernel.org,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v2] media: uapi: v4l: Change V4L2_TYPE_IS_CAPTURE condition
Date: Tue, 28 May 2024 11:04:25 +0900
Message-Id: <20240528020425.4994-1-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0086.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::19) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2P216MB1246:EE_|PS2P216MB1387:EE_
X-MS-Office365-Filtering-Correlation-Id: 1613553d-d29f-44d1-96f4-08dc7eba84ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|376005|52116005|366007|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wYNTmXOGKOtMce6iEvc3q1qKrsgmj3Dc1C8tdyKc0KkiUf+7yhiPyDs2BYDX?=
 =?us-ascii?Q?p1LNlZurd0G6GP7vZTd8AAautWkPRyYYasVXquygy8iFEwtcxOo7hlAoMlrh?=
 =?us-ascii?Q?wbPVH+e7dXp+DkktGVoDws8xuIdHdxMz6pnZBOyxx9a5C6yAqs0JVuVxvvG6?=
 =?us-ascii?Q?J4Mmm5/WXjaCYUVEPtLieudCUCE+RO5gNe9aR+4QUF/PjAzEUxvKWiLKS07V?=
 =?us-ascii?Q?efQpmzZlhu3QQ18XJMhtB+/rNYX8FM+7/HXuO63pjeGsapKB2XOEBSRKPIMF?=
 =?us-ascii?Q?usElJMybBdGsRQLI8O8xofH80nJT/fP93k4J5VoW7fn74qxqRnRkwo7JAV8y?=
 =?us-ascii?Q?7qLNB8uJGFALJ3TIZRoDbIGdvHOaUHeNbwzjgCJIFT6+dZZ04B16zzL1xlmd?=
 =?us-ascii?Q?w/fg+GOvEJVq7ne/u5ahusdk7wNWgH/uVPFgA0olpZCQFAj+XCAs0nm2qqUQ?=
 =?us-ascii?Q?4uJwHl5yZ9DO5ERUm/JG6lsoDGtUW9NWUConmgqtO1DkmgV5D99L0blBbX2V?=
 =?us-ascii?Q?C0vHtUdcewnNyxpZkG7oAkPieorA+hhktxM+LshqAsSVoUArXPTfIJ/zRfRX?=
 =?us-ascii?Q?RFPEPkcxydNgsfuSxouuv3VJZJK1/ZoPlIvglzONROY183eugSLMuJO8Nhjz?=
 =?us-ascii?Q?OrpuQ1DrO+K+1D5Gnf7jzn9c8ZguX2Kru9V84BKO+26eeNW7bxSZCmxc4iIp?=
 =?us-ascii?Q?CUnx9dfLoWWwObQo4pDahWMBj+BWbj2rvYH9ub36hn4EQWPOicjWqeoqndPH?=
 =?us-ascii?Q?ns5ZKHmWIZZ+aQkDvDmT1wPm3l46ewpeq8u3RYX9m07qZoncuRcgq5XT1a9A?=
 =?us-ascii?Q?NaHit9/ZaslZm/TwnjzD3tdjYru/S5lSHSmmvWL0Qhz9jA+P0u4MsjzmUn8I?=
 =?us-ascii?Q?e3CuQ52dQx73ZuYAnK+dnr5urup7uSYTeqBWF2Qr0kzR6fH83euHH+y1BujT?=
 =?us-ascii?Q?fbeCvSVIJmLaTGmdnoSD0Z3z8Rw6iM05FZtjWrl9Dn3Tj4yynyST67lPbAid?=
 =?us-ascii?Q?2gsu3y1povZ/YStudc6H3a+2yMMiLOmyfIKuO1YSP7eO0tTjs04AW9UK2bPg?=
 =?us-ascii?Q?6V6tFqSfNbZPsY4lI1B1BwC3rqCXHoKPOUDJUHRntkpMFc/iX2DWX7ugPf0E?=
 =?us-ascii?Q?CBapAYPQQ5EnPbYW9tf683rWQaDKkN9upgt7/2Inah1S8Kj7QWEGphma6zic?=
 =?us-ascii?Q?s7KPqLDyyvYLJ5i1M+Z6qgmEpayCp3OMHREwwbrGnRY2NjoyfaPvZhdDzDrh?=
 =?us-ascii?Q?bOktdM4psRsYSYSO875OMIrztXpLJNvlZdzMpdPrLLZuwMofHZKqrwzy87dM?=
 =?us-ascii?Q?VRYF8bvVbIl7AFKbXrYvB7gkf+3Ut/5rQNTWxMgL8zQsUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(52116005)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?23RZm70uVP8AcxFqhEiEbb2e52ksQ0eCxRfnNYVkq5JdWEvzIBKbU06c2BBN?=
 =?us-ascii?Q?lYchLc1OROCK2lFuLhZCUX+nz3Kg2zQmALB2CM2iiB7fJE6sPwdY2n2ohiRp?=
 =?us-ascii?Q?4U8aoIdlMN7OskcY7iHPY2Nb+3IYeN24QsszFYrWL96xvZ8pF26TY61q2JMO?=
 =?us-ascii?Q?nXkWnw7ui2LBh9PhpsEIOJ5Yih2PUXjylnzItJCeMiW5ZdIi32BcazAuQeiw?=
 =?us-ascii?Q?2KAl6lHyHwf0HLoO8FERkfmk5xLDJ7nIVC1KtLvvOOFn3WCPNMhq3yZgjcz1?=
 =?us-ascii?Q?dQB1+knJINvBODiU4rwR1fNYXJdckZiJO3tsW75QE+Sh/v9fhaQ99HvCzdOx?=
 =?us-ascii?Q?58oBTeO+afzqzdG5XsCqhOt9NJOpvZ975YrnlNRWZQZBq4S4Qa9bD8/iI/DM?=
 =?us-ascii?Q?1OdoKLvfyzDgVCsO/ksRfuNPXARUENGCYn3bwmH5rCs+jDkYJvePEbu8z7K6?=
 =?us-ascii?Q?/quUxQq5SHfeN+r2XTqI0p6RzA0r8bMmA2PD7hzoP7zqooD1qt3GocPIx/10?=
 =?us-ascii?Q?yTyMDKs9EsOBRRB4TzFGxw+XQNP9iNIY/PA4SSIRwQ27Uv2kSb7AWmdFsJAV?=
 =?us-ascii?Q?IzSx4m0+j2tMRGGTzjEws8Gw7/HOIrJSxcsZjqDm34xF5ZckzVOcX1yJVqIZ?=
 =?us-ascii?Q?sxqIXIi1wZvxvqg2f5t83DsE7G7K52GPKWPVndlJDbPTalq/LWEP0tpjKBw8?=
 =?us-ascii?Q?orXprtXHFE7EBf6CvP+80bLvCE2oVle63eNlpF2lALTGmcLqL7kVlaWaYc4h?=
 =?us-ascii?Q?4idrwrwS5fhG0Ues89rtSUqXGYAkKu/LARAghdKx06n+VBuUuE8w9v4HqLTL?=
 =?us-ascii?Q?fZXJBuCUd2KtWSHbbDReR8McRaA9H4i4wYKLemjpw9fjvanvx16oe/46fKTz?=
 =?us-ascii?Q?I9vCpLU3txfLBiBNAr6EaitgZlBn1L7pvlZbi0Y5ZT+KLb3Q2PrGgqjUrhCa?=
 =?us-ascii?Q?1xHuKiWkZvCg9QeaeFcz5wk0RbDukk7Hremkr1+dij29Fp9BkSBibrYDK+Hn?=
 =?us-ascii?Q?SYaBdLrVwxiAJ9dNp9h8VKJXLzOIVZD/vNNQxWkYB8mnr0pZf1yNsX3n8tAa?=
 =?us-ascii?Q?GeWBiizNeioHVehqmDd3j1JMOLPiHS3zxeVjP6lY0M7crQnnKLPP0Yqrg0Q6?=
 =?us-ascii?Q?z8lM4qPic5QmD4QzhvOtYRM86PG2wyMzH6TuLVONOEhfdcLOhTVaS+7P9uAt?=
 =?us-ascii?Q?sJyXLRR5bJjQUvFB16CYOyL1aRrdE4Q4ZlVGoJLSoLCP/yzIuhXNPnHAwVx9?=
 =?us-ascii?Q?LM70/aA3kU39/vwbHvzG6FeCtQREPIWosRwNIK6jRVIr5xfzTjxq8qXvSqd1?=
 =?us-ascii?Q?ANIcvPoaE/DyeNpnuwUJyICEJzcRrDoQELgidk7SSbkrZ/VdPBIpJgI+mKF6?=
 =?us-ascii?Q?+sVefNeSXWmFT1pp7loK1lOLkCJPJp1GuQeghDom60iAJi7Q9FIg+Sa76HvA?=
 =?us-ascii?Q?PKcYBfSI/JjZXjpbN/RI7x3QkattWMDClYNHr9wOel9pe7dg9GRTjUY5JkUw?=
 =?us-ascii?Q?tHOXpgCLNw5TMTHNXd/g9nQ8dN+vG1yPBQMYDhc03Jo1SHMRozuJ5lqeqVxy?=
 =?us-ascii?Q?BQpu+qBbcVme1J+eU4g7mpbfWJFbRRaCgABObCn2+zsPMjujU5HWU5CN/DmW?=
 =?us-ascii?Q?fg=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1613553d-d29f-44d1-96f4-08dc7eba84ef
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:04:34.0282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzPOYR7bg8f1s8maAr+Z7A6ST3gW/qfnA93F/vjM2VY+mYz0WXCUwwXIY5DK4j2la46/+hjvHysfbQCrC5zT4rdCKLaJCvF/OfVlEBnAX+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB1387

Explicitly compare a buffer type only with valid buffer types,
to avoid matching the buffer type outside of valid buffer
type set.

Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 include/uapi/linux/videodev2.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index fe6b67e83751..fa2b7086e480 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -157,6 +157,10 @@ enum v4l2_buf_type {
 	V4L2_BUF_TYPE_PRIVATE              = 0x80,
 };
 
+#define V4L2_TYPE_IS_VALID(type)		\
+	((type) >= V4L2_BUF_TYPE_VIDEO_CAPTURE	\
+	 && (type) <= V4L2_BUF_TYPE_META_OUTPUT)
+
 #define V4L2_TYPE_IS_MULTIPLANAR(type)			\
 	((type) == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE	\
 	 || (type) == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
@@ -171,7 +175,8 @@ enum v4l2_buf_type {
 	 || (type) == V4L2_BUF_TYPE_SDR_OUTPUT			\
 	 || (type) == V4L2_BUF_TYPE_META_OUTPUT)
 
-#define V4L2_TYPE_IS_CAPTURE(type) (!V4L2_TYPE_IS_OUTPUT(type))
+#define V4L2_TYPE_IS_CAPTURE(type)	\
+	(V4L2_TYPE_IS_VALID(type) && !V4L2_TYPE_IS_OUTPUT(type))
 
 enum v4l2_tuner_type {
 	V4L2_TUNER_RADIO	     = 1,
-- 
2.25.1


