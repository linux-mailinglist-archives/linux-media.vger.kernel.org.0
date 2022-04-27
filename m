Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA8551174D
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 14:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbiD0Luk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 07:50:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233113AbiD0Lui (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 07:50:38 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-eopbgr1290103.outbound.protection.outlook.com [40.107.129.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3E2991AF
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 04:47:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ+oX5Lwac4NiN31vUwwqy12wKnqxI06KJ3bGmpBJZ/g/4Xbp49w1sCjLAXrlQIvZYFKVHLU0dNuAqXFNiP+fMUySe15WVCOC5FtwbSxdgKXu+5N7op0GwWHZabiZiqql/cfX0aVowDLnRpUjuPV96pBcp5ARe+B/jjMIXWm0o6MN/ouZJOWcInc/qo7ZYT5Bag2nN8ZKYcEiN3fDS8RUKpVhhRuJ1KUcXPsaCtTT6f+zkHHdeqB6XJ0RnXUyL9rDwnTzLT7SAiRTuopDQHtAYKC5suqXYox+qQyrt9LXLRwixtipYRoZ0YwJdAGTOTkgrrw9pipeedmk7h+p+aC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9c23af4nW8vWImDv4QWSE8dhxvJEWYS5ZUkBzHV7RHA=;
 b=ExmedGeWH6wr89O2p0d7zGBLw+kx5NQuMfjbIG2hh6XLsIIiFKGKiziTK96/XrH+3eRQkLI8orzgOI0M93mRcefFhyBsU9yu7FzKJmX+brMQbGndEwVVPp/etRbOcJh4oRXgvJJsuFzde1oDONJmLIhHf2wcERhsjqHe1qvVA0MHWkQ0eNqHYKwn49Ws1/kN2htV3tBEdQJ9+3nXFYMK2EDca6X2rjOEbPgq+qE01B/fBDLwpMzGcmxgiiy5ibDcAxcdp6i+BP13O+2Fe/oAIpu+YG6Pp4AJCfO7Ssx65prTdS/HWPhebOlm4UtTS8K94LeHZNpPpXfZbn/qtmLARg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9c23af4nW8vWImDv4QWSE8dhxvJEWYS5ZUkBzHV7RHA=;
 b=PhAbRxW351CYt/aWX55PI2CSFzQCj3kmZZrzOKF2ExjssQ+6B8RL8mSbvB7tKAFdAcXvKaNLYdL03xV9N7JLaUCd1nYaQHEzLt7WsG3Yd1BL2yTt86SFwcpf4I9YK8sX5ATT9np4Rs3ClV6Vxy/ipktNNkuEjNlodMxD+YO3sWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PU4P216MB1502.KORP216.PROD.OUTLOOK.COM (2603:1096:301:cd::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.12; Wed, 27 Apr 2022 11:47:13 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%9]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 11:47:13 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Nas Chung <nas.chung@chipsnmedia.com>,
        Robert Beckett <bob.beckett@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [PATCH v8 4/6] staging: media: wave5: Add TODO file
Date:   Wed, 27 Apr 2022 20:46:36 +0900
Message-Id: <20220427114638.1638-5-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
References: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0124.KORP216.PROD.OUTLOOK.COM (2603:1096:101::21)
 To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70a1bdbc-273d-40ad-29ee-08da2843ab99
X-MS-TrafficTypeDiagnostic: PU4P216MB1502:EE_
X-Microsoft-Antispam-PRVS: <PU4P216MB1502057C38C5F474B0F7B08EFBFA9@PU4P216MB1502.KORP216.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cB+S26htFAkUy/S/n3bhBU6uKnkMTG3IGfVcanGjV8lgBvsZ0FI+H92s0jMFRhbBpUsCwcBSBXKFypIXSgkk/v9KhJwMnL3/voqAp7rLrnooHHp0rH8VdbW1U0Xrwn86e3nvsO8mm8RzfdJUyg2mJ9DmpWvQJ88XQIyJfhSCuHQUS8K/5Oooi86QAjTCPbnKzVjcsv/yHMu6zwDOAYf5JHiNH1cYPqokKfhLMV2q/gQ8WZfjf64SBrl1049TiqVoS7pgTN6inhjPWM7ItVg6AqmGOVRlBHf55piVKV2WCKEycBA+AA3CITAQuOuiuHGd2Q0Lscqw21Vora5UAkMDvuo1CWcwuGHklP+t7izs4ayNbM+10d1xVT7ZeZWXkdNn6rhPZdAQc2ol5RIIDmoO+zLCxW5Zmtf8hgJwBqcagJkQOBR0RDS+adAzL+XFIY5cLi82ZBKe0Cr4+cn5uPJ0rKT79ZWxXCxCN4hgUo7Fa4rYgaXcY+xO1a9Dz93uL+qXLi+1K+U5VdXZU0fydUxylRyiXTK3LEVLqaf4Z5IYQHRq6/gYO8ok7do9dxrwf/UyojaWPg2F9RYHEZpoEv4tmCD4+iop7aOTj2CLhejL5+pXlLVj0mWcQo+KrGlkWDfHWTh904d9sXlGQmzpz1uiXWOktx5cYgHHEPjHgw2AC5Z21MvKoxOcPDLdmPE2LAyerBDon9YWhWY81B3dybdqrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(39850400004)(396003)(136003)(346002)(366004)(376002)(1076003)(83380400001)(66946007)(44832011)(2616005)(5660300002)(2906002)(54906003)(38100700002)(6916009)(38350700002)(86362001)(508600001)(36756003)(6666004)(6486002)(6506007)(4326008)(316002)(8676002)(52116002)(6512007)(66556008)(66476007)(8936002)(26005)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vLzZ4bd1rNkzoF/27IFvfsaCmUPa0p8gWZMAwUzraGC/23ImGLeZ6lC9OwYy?=
 =?us-ascii?Q?+TZCxcbd11TmereyyYkxSacZ25Yiwuk9Wa2kAWfILqGU0yTZwLYL1TcfNKSY?=
 =?us-ascii?Q?P7LPqbJFt+f4+o3GSXIA3p0kNnAhB8VXt82L7NzU2EnuqxI22rmjz1T7/jC8?=
 =?us-ascii?Q?G4KZTAHLn/BfQE23IBj8Fq9L00+coFuBdXdNKL3M3WYb07LCT1S7ILixVWDM?=
 =?us-ascii?Q?VnCCjuW4U+wivQDQYlBClyxtokIWBnfEeYdhExFOYvb91+uo10PbeSXpPTXa?=
 =?us-ascii?Q?vyh5ti/ttVy5JwBYL52ihjeqopDzNlNunraK2jGhBqLr7oTCECVwhAiLIuDW?=
 =?us-ascii?Q?t4cWhM4Z5JyRPRk3RURoCtJ+IGKw1zbijgY0s7G/k+Gf8SX4DkNgTb0zpNqz?=
 =?us-ascii?Q?0tCL1elVEnAxwxP6OHHhzkf++Ihxn2p4kJOBppGB9BMe8AZa2vQvj4nKnY7t?=
 =?us-ascii?Q?9C6P4pFSiroUjAlJOl5zdARgrYPjxaidlviQR6GFRE7uOS7ezv5c26H5kL32?=
 =?us-ascii?Q?dASZKmPmnQAiZw6MxFNGZUPAmTeA71gJWukFfepPDrOZgLvOls4HUe4xm6dz?=
 =?us-ascii?Q?sdwTielZRXbayjVGH9Mmmewe5Liez0fRJNXa2FzoYI91iMKlfg1b/cpqd9pB?=
 =?us-ascii?Q?dayk/I31FovQH/oNhtXdvVbA/fibDqJ49U9AWyuuXUpL0WWQPABjk0+c78ux?=
 =?us-ascii?Q?SC5N2SSdicOTQE6fGZbcP6kEdX9ZhsaAK03Pz+lmTQ44DMfUAvJ0JlNk9R8i?=
 =?us-ascii?Q?LsNWvzYaoyaYGumqRYrL1Dc3a1Irdm8Ad5XD9NR+P5lAxvRWa0DC3sFdzCUy?=
 =?us-ascii?Q?wrZNJC24PvWWYIGRFYSY6sI3LOkzRyafNtA2ISCj4mWA/B66PdAFVs6WZPot?=
 =?us-ascii?Q?756y+dqWr00ROCzlC/fdglXHo3cbuXZStbd7bqInUDoUkqbpxawn/yKhYWEJ?=
 =?us-ascii?Q?xvN6/Ef9jDj84Ybu5My7IRkmq65dxTRK/3Bg2+UiarfXfr7+9d/3UAnBDOZb?=
 =?us-ascii?Q?epdZJgnA+rAA9tFjfQGOeWXp3HbkcEIkKZFzlqKmmU+eE/AdGvfLJKlWRlgL?=
 =?us-ascii?Q?8YcJjbV8bqxixNG4T/brJpCe83A1caK6UupA74zurcVEG8XocOTOfhFDMlaq?=
 =?us-ascii?Q?fKrCA+jn3U8Z28ZZOaa6aHI9qbdaEN6fhkO02HyBLd2403vl80YxmmmqJtHV?=
 =?us-ascii?Q?UqpQrb4NDz1zqu9X0yzGOUf+eElNJzjIbH54CK7Bk5iHVmlyaCMbfN6URKit?=
 =?us-ascii?Q?r6/OEuXE+dx6W/IrrjDIvF+UmWQfgttAXKKdZM4dR+5ofhKJgtDx9fPfTZ1m?=
 =?us-ascii?Q?xihIJnPuMjSKzEkLKfzs99VOHpPDkAEmNWX9rbfgHhI5i6i3yVLfvzRXRNqa?=
 =?us-ascii?Q?DPO2/P+r8FGAIZbkV0L+HELRS4Wug+3UYH7RCNUy3f3r56HMpmX/JdP2NrB1?=
 =?us-ascii?Q?KgdTNeYGS9XIX+T7oMG7q9oIReDzeToVHUmOj1Til8Q1iw4RNxpvJCxaBtfw?=
 =?us-ascii?Q?LSICR3Dl5PKzyJIQyIYIXlOfkKIB/Ldla5mImcywPQ4/1GT35KkfXWTq9UPq?=
 =?us-ascii?Q?/C1mgIqC/fBTYm2/fq9KedDkCWacHefY12X/UOsUT7nQNfkk8mkx4QqgaO6S?=
 =?us-ascii?Q?7quRqSjXPFJIVTwYUYNr0KgLHpwOnBzuaY0fg3Srr7WEhxYeGcGdxwuupdOe?=
 =?us-ascii?Q?QhWvnehQuMRTl8whPiOFdaAvelqS/Z6lD30LJKMXEcB+XZBTc+JuLQR3VeKs?=
 =?us-ascii?Q?RNhOS7qvKDiClJCUZTlV1/ozKWBTtWY=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a1bdbc-273d-40ad-29ee-08da2843ab99
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:47:13.3989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tv+rFLgxcEVwgc3ra3Nb4nm9wX6ckl/z6Uy/+XZzWXe3TojJsYJzSrCYXUyLC+qtz3WEHZPpNWXbMtYnXe2BMBTKFyFRbYQdOopBZTdgnOs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU4P216MB1502
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a TODO file listing all that is need for destaging.

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/staging/media/wave5/TODO | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 drivers/staging/media/wave5/TODO

diff --git a/drivers/staging/media/wave5/TODO b/drivers/staging/media/wave5/TODO
new file mode 100644
index 000000000000..070a1171b211
--- /dev/null
+++ b/drivers/staging/media/wave5/TODO
@@ -0,0 +1,34 @@
+* Mutli-stream Test
+
+* Loop Test
+
+* Handle interrupts better
+
+  Currently the interrupt handling uses an unusual design employing a kfifo to
+  transfer irq status to irq thread. This was done as a work around for dropped
+  interrupts seen with IRQF_ONESHOT based handling.
+
+  This needs further investigation and fixing properly, with the aid of
+  C&M and StarFive engineers.
+
+* appropreate error handling:
+allocation failure, mutex acquire failure etc.
+
+* remove all unused struct fields
+
+* change struct fields to 'bool' type or bitfield when appropreate
+Likely good candidates are fields named '*_enable' , '*_on'
+
+* handle vdi_allocate_dma_memory failure , each function has to clean after itself
+
+* make sure that 'u32', 's32' etc. are only used when reading/writing hw
+and change s32 to u32 when s32 is not required
+
+* power management handling - add (runtime_)suspen/resume cb where the clock is enabled
+
+* fix checkpatch issues (mostly fixes , only left to fix MACRO_ARG_REUSE, LONG_LINE)
+
+* revise logic of wave5_vpu_(dec/enc)_register_framebuffer
+
+* check if the  normal kernel endianness/__swab32 routines are sufficient. (instead of the ones
+  implemented in the driver
-- 
2.30.2

