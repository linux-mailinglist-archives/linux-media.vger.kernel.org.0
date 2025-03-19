Return-Path: <linux-media+bounces-28451-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A080A683F6
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 04:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3543B4D81
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 03:50:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBCD24EAB1;
	Wed, 19 Mar 2025 03:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="CCx7JjFF"
X-Original-To: linux-media@vger.kernel.org
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022108.outbound.protection.outlook.com [40.107.43.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17DC24E4C7;
	Wed, 19 Mar 2025 03:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.43.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742356248; cv=fail; b=mErn8k53FRwFrnZ3Lo/50J0jeZSaQ0HO2NsDIZ7KCL8ukLIHwkSqre0E0opACry9hIjL/IfROuzOu6mNX78O7CHX7aOE5F28omrWsFM/aKAhUexc28UKh805muTaWKW8Yl+0YPfVVyEbzc1qle8rnFZ3CcaslWQYKmBfNwNhRlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742356248; c=relaxed/simple;
	bh=u6at0thV7255BNXbZezQd7/9s8Y+Cn5yUd1jbNP5+O0=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jy+Xut5S5GHOMe4n/mnInALUSwALMXJ69OZSKxdbORCPysJVqV5EjNyUxnsvVwZCCIV7alyuiWP4NWTqHgG6HIztuH8YFfXzoI6+XPa8/VRfV6fuTxfc9lpcQBEio5bXiE+ooL4TbF9hT0w6QXdI1YRCRjuy3iVIHTARGchZTpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=CCx7JjFF; arc=fail smtp.client-ip=40.107.43.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tY4vXEwgZeVKXlPza8BUXMYZV2liVsVK1ca1fGCSSIRc6e+bKicMcPYwRyh+ZjH/sP/xkgEx0TJxvfECzYlFE1xpyFhECpR123Bkw3J9lSYXQoolW4rIfGjVCqKH8tVvuXrTSjPiSCjmihd670aNLkkb9UN6LBf7Iq/j43XEpL3Zn6nqPlzboI3bOptCEVtlYWzbHKFZiXfjUARpai9HBqjWYQuR8dtRLlvZFjvI6ZpVas6So/5RikzQta3yFmWUv+HFCb7q5Svi0nI9bW110gww+sqDgFdT8u2DXFIXOIOPUH1npSVWR4zlG8WvyivfEGqbyUBPGZug3uu3rOlS8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EE+raeSK6DhbikAmvxAvKA7FiPaPEVn3UunaUZQAt/s=;
 b=zTm8y6/5BCikiEe5KerXxL5Pb+aEqJeTb6eOcwMrB1FrOQBH6Mugw1YkGlOHBRsLsfefR6e1VEkbNBC7Siybannck/yjkrYbL3cfk82kItKKYlL16FUD9Tp3EkQYfwDI2kJpUqCr54YffKNLSVzfiDkFtp1OP78Q5K37vovDE0qymmlXE+bYGCdhMjAXghY1C8D4RmaRgqSB0CYm+swOJ7xOWLMqQuM2BXd9xE/a0Z3Mfh1zfk2nu9BKwfePyunvOCpZpnL2yuCBMryMIpUn5NkD3eEpu1AawQOifwYbdTACvbnajhhGGJyfNtcnZdU9QeY5hX3PDj8fm6WvAZEI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EE+raeSK6DhbikAmvxAvKA7FiPaPEVn3UunaUZQAt/s=;
 b=CCx7JjFF+WF7kPdh1ZI/6K3hszqtiaCladxNnCbW1loXEPTK7JFHHQDJtDltnunbAAsWI3GSfvqZtMVYdb27FnIgTpNMac8H3LhyZPzR3fgGQU0acKEEgScEDxcZjiaL8xt4nQMUHnUAhEhSwDlZTvXTgih8L/kFvHDntdzBnak=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 PU4P216MB2051.KORP216.PROD.OUTLOOK.COM (2603:1096:301:130::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.33; Wed, 19 Mar 2025 03:50:42 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%6]) with mapi id 15.20.8534.034; Wed, 19 Mar 2025
 03:50:42 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	sebastian.fricke@collabora.com,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com,
	dafna.hirschfeld@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [RESEND PATCH v0 0/3] Performance improvement of decoder
Date: Wed, 19 Mar 2025 12:50:31 +0900
Message-Id: <20250319035034.111-1-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0085.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::18) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|PU4P216MB2051:EE_
X-MS-Office365-Filtering-Correlation-Id: e652f357-21ef-47bc-14c8-08dd669938be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UU9Py8f/Cp57Ot3HaF0u56lXjGuRnDqfnGso/4/mzX1KhOEfO06/MXz6L0PI?=
 =?us-ascii?Q?5xegNTNMDK2p4p1p7jh/8YfseDuY2/Y9veBo6gvnTQbqUJxsSep0phgPr10n?=
 =?us-ascii?Q?WYrURsjwrimndxh4aNJ0zsWmw/JieinT9gKs2E4Sij49obnnei7bUGx7AiCX?=
 =?us-ascii?Q?unk+fbWjevkJbLNN/vPKJWZD5XEkB89qM5WwfScpvG5NLQSoS+XSK8d35aKM?=
 =?us-ascii?Q?2PPgl6IRCEcNK1VecjBfp9O0Qx6oLE+jbNHJ8oXX6ItC/OnaPS4CgDHqGUBI?=
 =?us-ascii?Q?lIaEjjYcthCBgRtEjUGgm2XD9JSIl5diLcyO/8i8Sje4A8WYqpBQWFsPYEo9?=
 =?us-ascii?Q?2xox7rmzvZE/8UYx3nlcD5rsqW4++2+3RPxiWdyIuqxA8McfqYE6JWpcppMb?=
 =?us-ascii?Q?59Z5bq0e1KBkLW1ve0cwIo4CJMeCS306PHOoOeATiNkkg87BCpP3Qrk3qzjs?=
 =?us-ascii?Q?w+KI+78EFYX+IYBLkJE/ROfgOhKlzJSNvuPCOPXn3LGHFlMOd0c/6Tcy5zll?=
 =?us-ascii?Q?kb8AWmX7hK3wMCqQ5xwb7kaJVdLlriCsZR7FYFYmZ51vTFgVYRqH4ld7p4Gh?=
 =?us-ascii?Q?189XBeg4rAu67824l051p05Zp4PycP2hAxnP0lhobuUZAoRjOdn2oaA1IXgX?=
 =?us-ascii?Q?lOXOoLUjnLci5clQB0WWZZt0kuUC9YrOpCQDRk6OU2CligfGQ6ksbHd+T3Vv?=
 =?us-ascii?Q?4IHGRgNpWCHKCYiv2npG+JR+fTFoUmxagg8LXJPZXRC3WV06DpNBCec5dSWV?=
 =?us-ascii?Q?3IMwZG1goICqjWqFN5ETRJDkWCulH5BJ42mH2yRZ4JtqxrRLa15OGnLw83mx?=
 =?us-ascii?Q?ygZhrBCUe5S07E16TZVb5pEP807fhmk22RSimrQJ5Cbgi0I9NhK0vVV2u/DZ?=
 =?us-ascii?Q?3lB1EMHpd/Yws+lb14SFPL3JneDtQNCtCrAZUiALVKjsJj6XaeNHYS6r7CqU?=
 =?us-ascii?Q?4LBSwSwLqECv3Y+SlpTH15C0SlNXMkxSN0VRD17SQ7m6v/J0Wubc/w7l/LNr?=
 =?us-ascii?Q?K2Xyweafjqh5yL1fIupYSoFe5NY7t/sMLdyGSqxSCmknzo1bx+XE6GmwG5VV?=
 =?us-ascii?Q?eDZsArE+qi4bX3E5WGaOsn/4cW9OSbRFkIa8sQd3ke5ijrcGqYPkcsDwVvXf?=
 =?us-ascii?Q?1tSMnPkVLWJVX1bnYUH1FVIKZTq0esLGVxKTQw7ikofCd4FOtoKJ3lW/5W9y?=
 =?us-ascii?Q?5aWrmqxG8vyMvL/AV7PtdYkSnq9g13iJjJc/hc64vWj+iZUMSZCZGRoCGncJ?=
 =?us-ascii?Q?J7vGOI+pMtvN1+BhKgGKd7g9Xmyu1IPn6Ok3kXSLVwV8roe4YE0jfXXqqrYm?=
 =?us-ascii?Q?xalvY39Sq2nHJr52Eq/UQR6ZCsCc2qagjDBm43+HJuGIvh/REpI5G89qvzbB?=
 =?us-ascii?Q?Fdu7tTvnBnRbx0BqiuV0TpVcenQhicPJD57d3QbH9q0vYpUhpmYXipchFpnQ?=
 =?us-ascii?Q?sYNYh1vNXjemst/tsvWUVObD5FTA4OS3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KxOweMJ3kQeYloWwsQZh/f4BEvw25194uhWPQBTnvbHPgf3LZk+QKz7rr1Gt?=
 =?us-ascii?Q?3HKppGJlXlO+T24rq3O3n4eSlbN356u/VSQjtwbjLy9gZ1GRqm46lmcM3aSW?=
 =?us-ascii?Q?E9l/JkKBdOC6OLmStIAF/eeJDA5FFE1z1aKxP248Ob1kENO/t3F3UjR9ekxc?=
 =?us-ascii?Q?xrHWDhSK/VY2jrGsKkLfNl6t7/xePPcoWE7Ag1B3G/23+A22GQB6up23R8lt?=
 =?us-ascii?Q?BbwZsFPBqFDKBVbZtel31fV+kOn4G577H/LWf439eLaNf2Oasps3MFfvNa1r?=
 =?us-ascii?Q?KHP0XTV/pvVc8sgC30linXxBMtYYwmLdWXL7/b6OcKlHh/cfe2c9rymS/RPd?=
 =?us-ascii?Q?55CNPtQ9mqF1F9K5cN9R2FC4Hqlis8HoYX/D41AUw/tRvPdBqqQ+euI5GRGF?=
 =?us-ascii?Q?PlyaMyKqguF2C36C66t8B2rjtH3AKos6bysG1xmMeUeJ8q8vrEJ425nEkOm9?=
 =?us-ascii?Q?ryG4NtnbfyxZl09fiL2Uph18MQWwqOC/U0GKmrzNXZK1Jp977voGM/ktWCNr?=
 =?us-ascii?Q?fw4HHzXU+elwlkKHyqDzBxV/6arlGo5lddYt0DjZbni9HKkXvO/pWhFaGnEb?=
 =?us-ascii?Q?83KUFGRImpnMW4TzeHNIXDx7no+KfF9G6j/ksxl0EF9Ui5C2rtivklr+Ynu0?=
 =?us-ascii?Q?3uzQNMsAWjMIEKWidpVp8fgIxH2pBv06+has+AjY/H8vKgAMTpu9gnYcImhA?=
 =?us-ascii?Q?wFQzlZnwqUd/VK7WHaIUI8b09vngUJZ88lwmWI88bdd+7GK4p0wp+6T0yUiG?=
 =?us-ascii?Q?g67b5xGkK0RDRUzbAlK3yvinMaOkCXSZF8z4olcG2DJ5rqAzBy3Od2buQeNj?=
 =?us-ascii?Q?JGc5hVxbNb0cqpRTexJJ0krlJTYWslHLSw0+aUEhJ19d5TFlEw6lemWbvtlS?=
 =?us-ascii?Q?ChX0TU3ROrJXHqE+RsL9Z9xm7EFbcsEJIDUFS5vhQvRVOfv1sFwSgbUcF9b1?=
 =?us-ascii?Q?HuZqW7IgAwrcC6Xf8dveqtEEuBrjkuQEUhZZViooevAkSqf2X5IfU+fmxJ/w?=
 =?us-ascii?Q?udtMvLj7nOrSdPoP7q9hV5ykiTECqDuBp/8nKLQCmg7TE0IyUwO7lmVYxp/c?=
 =?us-ascii?Q?Qre0IHytC6Yw1q3AEWyU+mSMFpiun/RO60Y+hvh4zTAbj5zCS6IgohRwt20e?=
 =?us-ascii?Q?N2O4kaYwUHkYu3kTqaL8qWaa8CdLj4h70SdV/nJmIGXtxXSA+hVi7rGPMhns?=
 =?us-ascii?Q?fOqARrstYsLDxARxt7jMUh/vEDLKHiHAnhnot+C/mItNOUqRk8h0OitQ9PxT?=
 =?us-ascii?Q?aQ/ztx8OqCFCNjWQvXAMw7XCbDIuzAiINDC4OUWUkVJbFXKhvFILG8KCskuJ?=
 =?us-ascii?Q?ECEH6+W2jSJfGJtv3qMYs9fSUH6/KcOuovV9iqURxZg/a6YK4yN15FwIL/PD?=
 =?us-ascii?Q?wKtF1g/y+wI5IPabUgIXIa/SArV91b6IXw2ufOHHTDs/CP6r6C4oIg17w2nF?=
 =?us-ascii?Q?U2O2fEaIAdZJaxtoD2ZZ3SowpIW+F5TD0i7DoJPSh76D6lvWBsrF5VSDLZYA?=
 =?us-ascii?Q?b4VzxxJLzcJGI8/PEaY+952NPFKZcsmlE4FIIB4J7A4CmWDMvYc8slmXCET0?=
 =?us-ascii?Q?oqAreEedbJ+hx+G74wy1RplTuXd0YszaNu2g5nphB4DuPWBOZWiUUhBOAuZr?=
 =?us-ascii?Q?2A=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e652f357-21ef-47bc-14c8-08dd669938be
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 03:50:42.6061
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXrPD0OK0/EkvjP9OR2ym1VkSkY5XTZ8PNK9Es1urxLqf25UxiiLsmJ17Z2jHZZdhI7JJpGsdI3M8pA2Ypt7eaxNjM3v/uCoxOgbil5cfJk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB2051

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The wave5 codec driver is a stateful encoder/decoder.
The following patches is for improving decoder performance. 

v4l2-compliance results:
========================

v4l2-compliance 1.28.1-5233, 64 bits, 64-bit time_t

Buffer ioctls:
                warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
                warn: v4l2-test-buffers.cpp(693): VIDIOC_CREATE_BUFS not supported
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK
        test Requests: OK (Not Supported)

Total for wave5-dec device /dev/video0: 46, Succeeded: 46, Failed: 0, Warnings: 2 
Total for wave5-enc device /dev/video1: 46, Succeeded: 46, Failed: 0, Warnings: 0

Fluster test results:
=====================

Running test suite JCT-VC-HEVC_V1 with decoder GStreamer-H.265-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 133/147 tests successfully               in 68.517 secs

(1 test fails because of not supporting to parse multi frames, 1 test fails because of a missing frame and slight corruption,
 2 tests fail because of sizes which are incompatible with the IP, 11 tests fail because of unsupported 10 bit format)

Running test suite JVT-AVC_V1 with decoder GStreamer-H.264-V4L2-Gst1.0 Using 1 parallel job(s)
Ran 78/135 tests successfully               in 35.015 secs

(57 fail because the hardware is unable to decode  MBAFF / FMO / Field / Extended profile streams.)


Jackson Lee (3):
  media: chips-media: wave5: Improve performance of decoder
  media: chips-media: wave5: Reduce high CPU load
  media: chips-media: wave5: Fix Null reference while testing fluster

 .../platform/chips-media/wave5/wave5-helper.c |  10 +-
 .../chips-media/wave5/wave5-vpu-dec.c         | 361 ++++++++++--------
 .../chips-media/wave5/wave5-vpu-enc.c         |   8 +-
 .../platform/chips-media/wave5/wave5-vpu.c    |  69 +++-
 .../platform/chips-media/wave5/wave5-vpuapi.c |  25 +-
 .../platform/chips-media/wave5/wave5-vpuapi.h |  12 +-
 6 files changed, 307 insertions(+), 178 deletions(-)

-- 
2.43.0


