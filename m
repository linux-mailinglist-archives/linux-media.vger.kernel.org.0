Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D478F55D158
	for <lists+linux-media@lfdr.de>; Tue, 28 Jun 2022 15:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345400AbiF1LIq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jun 2022 07:08:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345399AbiF1LIo (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jun 2022 07:08:44 -0400
Received: from KOR01-SL2-obe.outbound.protection.outlook.com (mail-sl2kor01on2100.outbound.protection.outlook.com [40.107.129.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53BEB2A278
        for <linux-media@vger.kernel.org>; Tue, 28 Jun 2022 04:08:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RU4p81MVBSfyu5jTe0WtxqXClaRLqE5RIQVhjPMDxdIyexiFI3TqnMw5Q7VvBTD589a8Gg3lLdhY8BDThitkkF3b/9lgV68xV+nB/Qz4QktV9yX4cmnSi5SAJA+yuoakmeD5aFqyKpgz0OaJtg2vGrWMZySHmqL7GZOIlzX1JwaYA+aGHrI/6A1RK2ds1We07U8C6WYqD8tMZULV3kZ/zVoOcbBdhPX1rdxo19VAQpAhEFppGLeh6yhPdh6HnI1BMpS/sdWNUbCbooMbF/CV/UvYb5LdruJyeEvqE142FD94er8yv38qvflj5dEkd7yrddlvb195ybS7RnbLhCoSwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNFGaGgcXTX7bbbTaDHAkJvjIU8TVT9QgnFsW/OeaDA=;
 b=ABCh8hLcYDxbXRG6uIrEfA9YUfhctAjMW9Xxc6ZW9B7dybnT0oMkAh89FEIvkUCWf5eQXsfqJEJ6yjz0FuXYiFFRB9/wKHTarsUPXegChDKAgda5RDnKaPMG9XqeoqlBsy/LJJUv/0grwi7Z0YZS9/ZxiRWG30Hkp8Pz7v7OGl3FcVR093HfWW419K3bJt82uvth3j0woqX1g+qIMEvJEZxwXwe1JQYiWoqeEDHpo30kDUDNnfsmefG3lMEZXa44Zfaddsmd+6+QjcVVyxZaqNrQzLjmAMc4oQ9C4lkCGw+njzBCSq7rZEglU0h3EYHsCyuqMnVeI6Fc2ZOg9WJWrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNFGaGgcXTX7bbbTaDHAkJvjIU8TVT9QgnFsW/OeaDA=;
 b=LCqVgP/TK8X7DdPiHQ2tr2RW9Qq7tDRIdSJt/eDrjFXqW2034qadJG/ojhD3I3cxxbdeFlbbbiwoKTIS9GS04KVCsp4h1b6SmcNRWi9TDj91gIJQc8D7W/VpfAxEAxhtxZR/2SJnduyHb7yPz7vqgVTh8Qz0Fi8Sv9Ir/AavmRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 PS2P216MB0386.KORP216.PROD.OUTLOOK.COM (2603:1096:300:28::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.15; Tue, 28 Jun 2022 11:08:39 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::60c1:b54d:bd3f:3617%6]) with mapi id 15.20.5373.018; Tue, 28 Jun 2022
 11:08:39 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, linux-staging@lists.linux.dev,
        mchehab@kernel.org, Robert Beckett <bob.beckett@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [PATCH v9 6/6] media: wave5: Add wave5 driver to maintainers file
Date:   Tue, 28 Jun 2022 20:08:21 +0900
Message-Id: <20220628110821.716-7-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220628110821.716-1-nas.chung@chipsnmedia.com>
References: <20220628110821.716-1-nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0222.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:18::7) To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ab46403-9256-42a0-edb3-08da58f68e13
X-MS-TrafficTypeDiagnostic: PS2P216MB0386:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnoOiJrfo/S4czd8pAcCsDBj6cADmXnSWnBGPRxgElL74HAhukfK+wxSkDexFYoX/XqcTxlwMWq/+9CIMvlz2txrDdrDN6JG4271BbebdxRzdGy/36BWx8+K7+7Jbu/l7qQEnlvhxHh6nwNvIlbscLUGKhHFrvtBSydV9cjH5d+lFElqaEzlZlrChMcwKzsZ5tymHVolAwWS/WfCr/Esw7NC43Gem6iFWjT+wM3yKP6x6hEEyugyLxCFedERorbKmWlaidq8zUV9PmoVL675yhGqKlh/kG+j5mFNvBVxdjAZZMqoXhbWdtAntIKuC8rzamKZtt42LvIMz9PBmzR7XADhvTC8HzVEXPwuaeZjcEvp8jmXdqBySdkK1rXSEYp9rDcV6SlNSUPSJsf4A7KLDE849BGaR9/9recWdgmKFYBeXl9trDjPNvXdeN/VnelqK3/UCm5gVTPeQHbqavQiRMvT7ve1FO2e6D7itnXrAToScOkBS/+hxRHyMKYHGfuVvXMrJ4dUkXprrPkEf/W8TS60oGG5NqOLPyyUHVniqhjLDdi+dmyJ/Z6gt9+YwZ2iEsf8D+CWP4R1bpC3EyFgLd8SMUzZU1we81qxsJ67cbmSOgutGeTZyO6GVP9Nzv4tnLYpTP8NmPT1dTRgsZLj2NUiV5S98i8XUFunybG3haaW2YklNLSWyy7Xr5yBxClZme6F/KXXTF/xui4I0HRxby/hpOeX1dWAxGUkUOQyZYeiJ1iU3oxcB0ALszzULWhNMkJKY0reRq8ck4Q7h+P+ISaoweDatPidOuQe50fXLIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(366004)(39850400004)(346002)(396003)(376002)(136003)(1076003)(66476007)(66556008)(4326008)(8676002)(6486002)(2616005)(66946007)(8936002)(6916009)(52116002)(6512007)(6506007)(186003)(6666004)(478600001)(54906003)(41300700001)(26005)(38100700002)(2906002)(4744005)(86362001)(44832011)(5660300002)(36756003)(316002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tJ0NXLKpMtmCqtbXhHzqgTTjvzqS97/rjJwgd2Ltboi+nFp1WPIRbDoGHFJj?=
 =?us-ascii?Q?3ViU8K5xfjHkUX7JdeJ9NoXtDutj++NjCprkcAud4qEGqDZ7n8oZQeqZvzu4?=
 =?us-ascii?Q?dlA3em01t1X0iaE7fhfgXevkyRqZNELNnaZBqTFBX/Xmb627Un4DyXWFm9AN?=
 =?us-ascii?Q?6AVm11wNUjwmG9D94SdQu7Bg45HrmiB5iRnnX8HcxhKBSHv9cTn6/DnsOnkd?=
 =?us-ascii?Q?W2MQCW2NgTgjL3tc1Y+/woOyatcNOp8aCwNXYUCvcG3ehgPAA4ZvBhXfoFmN?=
 =?us-ascii?Q?Se/jRblat/+LPZ9nQr/Ya2+p9bw6LmRkZD+wDfxZSDDyzncSk6T+QULyj7Jd?=
 =?us-ascii?Q?iGtpGz0YZEstnc1HWTLndxnSSbw2Nth0MeuhBMDr3fNuW6qsv6dcCX2qzfUc?=
 =?us-ascii?Q?ojkQ6xQVwvfp8pLPsouhy3jVF176los6aAQAzja4lzXaN45AWUegf5uyEXhi?=
 =?us-ascii?Q?wqf4rIiYYtqE4SJdpuj48wfl+3VEsUnSqOYPpH+Bgj3kQbUMmAQU3z6bQ9hJ?=
 =?us-ascii?Q?oaG+99IeXSM5WVUe+tYm3DRtYpboLKraceBm3kYQRir1wkTteAlnwgMkayBy?=
 =?us-ascii?Q?4t2RADSy2GndMrmAj3+ieH7droRWPeE0WUGSpN9dPA6KB10yzmjr9Ha+swqD?=
 =?us-ascii?Q?XCGHRgTztj2hQUqeSuTEBY5b5u/KBJl8PGqlENhqxU5fesJDI3fqB0MLspWQ?=
 =?us-ascii?Q?dtdhDbyItEH0Bsq10svX4x7hdkxdG4Jvs7YZiFpxclsLH4p9njszgSdDLe+1?=
 =?us-ascii?Q?Vflv6sQagL+zk+zA8PVpU0QFkODus27HhX1+2QhzU9eHwf5a9x/lqdkbxW2q?=
 =?us-ascii?Q?PW+52PoN0HvMO9LEFkba2w8aMyAaciFymeNvJZoCqNxMuLJRCc1qSsdP1VML?=
 =?us-ascii?Q?X4etTa8RpDa6fW33tC0Nmd+sd0uI+HKPVcR2jcWR8oRVhb6h0AmTiptDXY5f?=
 =?us-ascii?Q?RD3WsksEdag+QVhlZiWv50BpovAOOcW7G2uUkBBTcLQ2SddU3vj2Mp4e5N+3?=
 =?us-ascii?Q?uqHVpwuDp5A9OSd/ZzzmnfeVtKqc2dXrMqzfV1ruFzeau2RCT7fznnCQpdPo?=
 =?us-ascii?Q?EW9XopDycLVEZZgyz2VK7GGLQ/zQvfSOfx+J4K1RiAdkr0gFXhgjURJkAzpQ?=
 =?us-ascii?Q?KHanz3ncSRUVr9KZLdJrONkB9tk9bSq6fEc0Q633l+xMLOGTmeKS4YzF07ch?=
 =?us-ascii?Q?H889J57/GD1brVMGuz+ENhG5X552WxVOq2IodJWX0veEwTMBGPP1lwnt1v+r?=
 =?us-ascii?Q?FjLCIlnTa5i/9+x6ITiy5ixHqWq7OBXRbq07t6BHNh4AGyJAz5NdF/MIv4+Q?=
 =?us-ascii?Q?S320waRQ7xt9yWAdnmh+voL/FZK/VX3gsr4fLOpQDMRkAYoVMJ/7tpnZb9+f?=
 =?us-ascii?Q?V3Fq7CUhezHKESK/kPLBN0GLK+gqvM/drh/12zJxoskDRFzzRbLxP/FQc1Ac?=
 =?us-ascii?Q?cvX2JgejLsY4jbtSnuZtNX2vlsnYNHLSNakCQg5X/s2IDPr+MzJNf/Jrqbl0?=
 =?us-ascii?Q?FuHkPeezwa1geIJYag2TVyJvtTHg51hDmOobcEXgT1EXjj1DhXqRHh5vG3H+?=
 =?us-ascii?Q?n3vqkOBZT4deePGe9WcM5PwWNjfgVetZEIUUP35wNICEiyaKdDAwRSbjNIKh?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab46403-9256-42a0-edb3-08da58f68e13
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 11:08:39.6323
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tpW+ZBZ0LfrJ1ABPbm4LocLq3XP3u7+sl2HXLd0TaADWKtLBPq0r8S0asmqZltxxKikXo5geg9Oas9Pa9tNH2fXJJseOTq11+nEv6One/PY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0386
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Robert Beckett <bob.beckett@collabora.com>

Add the Chips&Media wave5 encoder/decoder driver to the maintainers file

Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe5daf141501..a7debcbf1545 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21499,6 +21499,15 @@ F:	drivers/watchdog/
 F:	include/linux/watchdog.h
 F:	include/uapi/linux/watchdog.h
 
+WAVE5 VPU CODEC DRIVER
+M:	Nas Chung <nas.chung@chipsnmedia.com>
+M:	Robert Beckett <bob.beckett@collabora.com>
+M:	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/staging/media/cnm,wave.yaml
+F:	drivers/staging/media/wave5/
+
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
 L:	linux-gpio@vger.kernel.org
-- 
2.30.2

