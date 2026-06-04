Return-Path: <linux-media+bounces-63722-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d5NGHk7eIGqs8gAAu9opvQ
	(envelope-from <linux-media+bounces-63722-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:09:18 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E248463C60B
	for <lists+linux-media@lfdr.de>; Thu, 04 Jun 2026 04:09:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=chipsnmedia.com header.s=selector1 header.b=PHr64MAX;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63722-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63722-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3EB0A30D95E9
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2026 02:02:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E972F7EE5;
	Thu,  4 Jun 2026 02:02:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021077.outbound.protection.outlook.com [40.107.42.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484672EC0A4;
	Thu,  4 Jun 2026 02:02:17 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780538539; cv=fail; b=r/YgihER0yOtO6Y7Tl3e6fjy/LfnvPo1Gtmya2Kt+PA6aaXtnEvIJEMNkSUfoMDz3Mzn6TqqIBFLz85zCs2jM26PSYrlsH5kfTl+LNAzkMiE6D66EpmcC7G46y/yfeVO0ul07sHA9OXi8QsgNrY5SMG+3s87p+iFC4z6yOJJcio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780538539; c=relaxed/simple;
	bh=m32EHftW5D9Nj37kbAF7GpsDLXeHTpsV8LSkdFQHdjM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FEsTSN8fJJaMwQW8PmIm1IsbCG4e1xH+oZA9QgpcivRuxPBXmteVWH33aMbrJNeSQxCtTCdO/sOkrSFfE4vcwFlOtlkaaGhmSnlDjgMfFNAyk+nFXZisGSqsOeyZ0sB+ol2hno+38PDLTa12eY6nSHHpZtskuSWyXKXY/4UaxxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=PHr64MAX; arc=fail smtp.client-ip=40.107.42.77
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/AcQw2zj2+E46xvPM4/mS7I/zmT3kasopjrn2H6KgfREjVnixlqIqrqy1YKVzQFwHWVziPAVYG/Dl6fkWwA9QhNA/TLJyIhd4+ieuwtV3XQIWhtitTa2qwv02BN/jA7la8AdwqheMWBl9txj/Jc8CUsVYE0B/afRBzLpW/pbvRVwJCSmR7aPqhSHoimP0aA73Oh8nlMqv1cJ6jM5/bcBRqzPjyI28Q93jHKM6f5z2huQPKDQO3kmHf3Er1HOG9TM5oMi+3kn1jzHfHCqjPlEKGJGA7iytzCZNaJb+PI2SUh2RtptYqeYNbMKEdsl56x1VC9yO1AiU56lhz7Yy2f/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Hzd7yz77ca24/wR0auQx2gI4O205MuAlPRgseqmlpY=;
 b=hm5e7+xHd5vompfAki9LKfUmTWvgdTzKC85LzOqbFHfxFBksagNM32o5tAwI33KX9d6KTVsF8xjktx97NZjWIZvKihUYsFI9L9fsGWcye0O8kJhFz8iOCVZr69KoLAxJe/Ep+tc2ge/k8Nxm/rIBekEm8jh4Y9d9LZfaCzpAPG+rutbK7/LG9Z+hbdOOGzDiC9GnI/Is/SaVpu4e51/GCyCXQ1NzofJZN0zUL7HvaZLQFNKlNg0cCUPVOgnRsDMhQinwHNX0IaNx3lj9f/Hn1bmG7E2r8U1sdiAx8CtVkuW29YsWhhNmNboCiOI+qqOjdoIwM1wyo270UbJDbBY20g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Hzd7yz77ca24/wR0auQx2gI4O205MuAlPRgseqmlpY=;
 b=PHr64MAX+tfhxSfimSQGwA9S1K7bKQLY8w6jxV+IahWfIfQOO8p8hR0Sh9UMU0jmk15o/V6I8Olja+BJxMNX0RJwdnmxTnv5gKMK64zFHHQAohueJ8JqF1NuzowC8smSPobFa7BZ67sy4l8z6a44+dCLe7d3D2W9rxMTRK20D74=
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3229.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fe::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.7; Thu, 4 Jun 2026 02:02:06 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%4]) with mapi id 15.21.0092.006; Thu, 4 Jun 2026
 02:02:06 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	stable@vger.kernel.org
Subject: [PATCH v0 1/4] media: chips-media: wave5: Guard bit depth check with initial_info_obtained
Date: Thu,  4 Jun 2026 11:01:52 +0900
Message-Id: <20260604020155.77-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
References: <20260604020155.77-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0024.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b6::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE5P216MB3229:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a746d89-1d95-4432-8715-08dec1dd4761
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	PkeRbDe/h8cnLsu29rZLPzfUpVzDpIsc9ydppvVKAR7/UdJBLKjteAgEPVvqcf0gB5mXZa4crI/HDD+ITMB/Hy7Ycws6yqz7SRnDkJZa1oFNCXoTr5zPoAxKPHZatgWTzEJohxbHOIy1MyrxNjP2RPBEqz2tNTXk9zUKkLHCR/5VczmSNs2ZNzGB0lWiHrQlqrJE9mjbhW3s8Boi4UaDCQwJ6OAc2kh6Vo55z1sLNH46jqSagFj7HmM7aO0KBsmrXK25MQf3xstqAxpNFiuzcOr0P5lTOs2H9CYRnH8YoSd+8eBBmoyI8qsCvHNFzOsS29rRMPX4EJUvqFVLIEX33kqX/M6d659du2zIp2vh5ehCb9pyJJpy717pMHm6ccaLxtEbQwhTBmfqfPVCbInZ0Wa3I1CXUeBAezivg8rKy4GaGEg43FYHZCiJ9t+qFZw6Ujhzjgau7IIjk2B964NALh1QdVbI44OptAz+AOV+Zbjf7G2KSR3kLHXP9422ll3kLvX8CYkJ5kHMWyqBC/PEQDb+4t2xwJl+FFjPA+T3GP6EPiUEyJc6zX4TwHhMUSMTwCZfmuTbIETLPuvR4sND1CvDCex5An44+gSfZ753pJtqQK6wJZh2ZxlG1wmzdcYnOxZiEqHadbcKYIKFmw6oaPvm+kNq353EYGmvD8hnwPfJp8T/x+Y1QYOzA10Ms5jANV5gD2c/G2zmDs6+dyIiRw1nDP0ut7UvvvrHXj67jlQinWMYlSbarNPLSgx05VKi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WdguLEwh7USCt7plaFXR7Vo1POCFnYzmobw4TebVanzzB/83LASmdlsXFKwp?=
 =?us-ascii?Q?YyOaCvKVTQwY+QT/j1NsYhumYQZ0nTikKnIGXDZV0xIbl1MM4RoWyckWav/J?=
 =?us-ascii?Q?b3KJXZFb2w0deBdnmZDoFe/I/HbOC2YU4AKbi6iWRuRXgkZPPEhFh5S8MT47?=
 =?us-ascii?Q?18DlTnbSY2pGh9pEOVnbbFagidLdXcfSpEyUTx8X7ipkTEs6pXhT8bkkqNsY?=
 =?us-ascii?Q?16CEvA+TNMEANNzgyi4Q5KWQlRrPvg8zQNiuXvd42SHpGwTpTnZJT3g9TRPv?=
 =?us-ascii?Q?11CYXhuT8CvtvifVkH5FdTknGJxlApFJRBmyTcfFATAx8+5KNv1NhgepCChD?=
 =?us-ascii?Q?RT/1/y2qhT9/p27qo7uiu43JHnEhPMIXIdvBGXGlz0MfzmipBC296sato6Pr?=
 =?us-ascii?Q?bx1MtoBw/thWRRPMljfinRM/vRmWrx6uc+vzu7JovN7twYPwTWCHab0R6aHQ?=
 =?us-ascii?Q?z6obqss6sd6NL9HsHHDDPGIbGhAfTXCuDd1wxj1Ko/UDOVGQYhu8NTIxNLF7?=
 =?us-ascii?Q?tUEMy45nj2tMUUqAQUiY8tHWQ3DFY0kdMe0u4mfzo553qJ2CfLoh7rI6QJyH?=
 =?us-ascii?Q?4CfL57OseKt/kHzNqLJDwTgZVmV+0mqt7/ad8rnoXNNFahxjBIdbb2eB5jO9?=
 =?us-ascii?Q?qJnmHzoGYbAVQjfLjRxBrKR9H9ZSoWJRsnGdGAmElvhD5+ZUME9leM95atV2?=
 =?us-ascii?Q?BfzXCrwpi+Ooog0Pdk5KDgALXPk6Fz+bi3rQDLh5NtNjyRPi7xFRyyBIG0Gv?=
 =?us-ascii?Q?9PWih3RO3s+On2z13+ytNn7fPrcsFr49jGpcqygwbvYCR8vZp180IKkKWVfA?=
 =?us-ascii?Q?fxHOyNPBjfRG1fjsVSAqZ5e5VF3LZHR38JVn6H+2eRv/A8c9n8Ui76ajbWXG?=
 =?us-ascii?Q?n6ckaA3Sfs5k1PmK3wQbYGWi/AC1VTr0V9TzpU98cahGJsxUzFmHe9vF01WO?=
 =?us-ascii?Q?YOIetfPKHonHnvEJdMQmh4WqiRqSAcr5E58lAzus48GxM1s/HMBDOrYQE/g3?=
 =?us-ascii?Q?JrL6mwSXknO3WuTOxj2Ue8ejNJmClsA/Gya6zXlHDCFEh18L5jv4dSz84G2o?=
 =?us-ascii?Q?CgMiTogwBOMcZ3qXkKIl2UASA0kGhJGYI54fDx1KbLTH7iprgtzKDjvWLB8C?=
 =?us-ascii?Q?NdFQqpK4FOZ18WoCZS1thncurCrn/ZKrDiC4Iwfjr1mypxtB06JX6n1bRCYH?=
 =?us-ascii?Q?ZVrWaml+uhFo83v/eVSa/NKOcZtK9GuFnTJLDlddn9VKiRTmgUHRGHP7UIgo?=
 =?us-ascii?Q?3mnnQN/vzGQfFC+QCStatbbpmzMmJyBaJpLF7o5aQguZtF41GrwK0VW2C2Rk?=
 =?us-ascii?Q?uhNOf53fXCKEvvAfmpwtxmiFKiHKu3uJwA/TqWoaOjidAQ8gGMPKLNGVsS6l?=
 =?us-ascii?Q?11gGxqPBQdDseYg0S/0TE+Nin7of/MHM8BKnM99O0LSGdbjbRbaeAXzMCcRm?=
 =?us-ascii?Q?9iE/vS+X1M8c4BZWtrKazoF+VVKZGmmtYuRtKlb3oHj6ndRYH3ID9Bfce+DU?=
 =?us-ascii?Q?stDfwrVgP2EX6Of5echuNTSl7H1sQxtFUGcSDhYTRjdnClxVMIQg6ZNGCCNe?=
 =?us-ascii?Q?pr+8U2zZnJRZSQELVpc9DvnR4dld/GYjwCm4toNdMlLe/U03SGxDX7mq0R7e?=
 =?us-ascii?Q?c/XWTrC465IR5+XUhHCp9KfjfCsWvO3tvX2luKC/1mVHGAxJmK7Q9kPbJN3v?=
 =?us-ascii?Q?+4GLKwu1lxVilcuWRGGPpjYXLO88mUFk+WdAyE5McOpYteDQHWJSw7sPop6N?=
 =?us-ascii?Q?sK/ABHhX+GN+C/Ey902BzcVjmqlE9ic=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a746d89-1d95-4432-8715-08dec1dd4761
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 02:02:06.5051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZsjWjTLnFkazRkmra/s5Fcv5HKsfB5QzEQV2bM9lZdUA8gRW83AAjUUsg6KSYVciK8umxDXEBPhDlAY/2Po0eFAZEngWgi1kydoCMRaVw4Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3229
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-63722-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[chipsnmedia.com];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,collabora.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,chipsnmedia.com,ti.com,xs4all.nl];
	FORGED_RECIPIENTS(0.00)[m:mchehab@kernel.org,m:hverkuil-cisco@xs4all.nl,m:nicolas.dufresne@collabora.com,m:bob.beckett@collabora.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jackson.lee@chipsnmedia.com,m:lafley.kim@chipsnmedia.com,m:b-brnich@ti.com,m:hverkuil@xs4all.nl,m:nas.chung@chipsnmedia.com,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chipsnmedia.com:mid,chipsnmedia.com:dkim,chipsnmedia.com:from_mime,chipsnmedia.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E248463C60B

From: Jackson Lee <jackson.lee@chipsnmedia.com>

When CAPTURE STREAMON is called before the VPU has completed sequence
initialization (initial_info_obtained == false), the initial_info fields
contain uninitialized data. The driver checks
luma_bitdepth and rejects anything other than 8-bit, so garbage values
(e.g. 15) cause STREAMON to fail spuriously.

This is reproducible with the following multi-threaded test scenario:
  1. Allocate 2 CAPTURE buffers.
  2. Call STREAMON on the CAPTURE queue.
  3. Call DQBUF, which blocks waiting for a decoded frame.
  4. A second thread calls STREAMOFF on the CAPTURE queue.
  5. The blocked DQBUF should be released, allowing graceful termination.

At step 2, STREAMON reads uninitialized luma_bitdepth and rejects the
stream, causing the test to fail.

Fix this by checking initial_info_obtained before accessing the bit
depth fields, so the validation is only performed when the sequence
info has actually been parsed by the VPU.

Fixes: 035371c9e509 ("media: chips-media: wave5: Fix timeout while testing 10bit hevc fluster")
Cc: stable@vger.kernel.org
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
index bb2ba9204a83..01d1368b2965 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
@@ -1403,6 +1403,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 	} else if (q->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE) {
 		struct dec_initial_info *initial_info =
 			&inst->codec_info->dec_info.initial_info;
+		struct dec_info *p_dec_info = &inst->codec_info->dec_info;
 
 		if (inst->state == VPU_INST_STATE_STOP)
 			ret = switch_state(inst, VPU_INST_STATE_INIT_SEQ);
@@ -1410,6 +1411,7 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 			goto return_buffers;
 
 		if (inst->state == VPU_INST_STATE_INIT_SEQ &&
+		    p_dec_info->initial_info_obtained &&
 		    inst->dev->product_code == WAVE521C_CODE) {
 			if (initial_info->luma_bitdepth != 8) {
 				dev_info(inst->dev->dev, "%s: no support for %d bit depth",
@@ -1418,7 +1420,6 @@ static int wave5_vpu_dec_start_streaming(struct vb2_queue *q, unsigned int count
 				goto return_buffers;
 			}
 		}
-
 	}
 	pm_runtime_put_autosuspend(inst->dev->dev);
 	return ret;
-- 
2.43.0


