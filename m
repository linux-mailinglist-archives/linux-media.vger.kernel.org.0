Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27675117E2
	for <lists+linux-media@lfdr.de>; Wed, 27 Apr 2022 14:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233102AbiD0Luq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Apr 2022 07:50:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbiD0Luj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Apr 2022 07:50:39 -0400
Received: from KOR01-PS2-obe.outbound.protection.outlook.com (mail-eopbgr1280118.outbound.protection.outlook.com [40.107.128.118])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DEEC9FE6F
        for <linux-media@vger.kernel.org>; Wed, 27 Apr 2022 04:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD64Bf1i2fXPdhe5Kb4WmxstpgjThAIPSV6xVC2X407fDZ9CVq4892a3pow3WMUG8nJz9E3tpU5qnZU4eapUM+RiF3sRH9A3NM8Pw8gjE4nkuU0GnP6ZDttaH96fwpiRcd5hfWrtQ4ijtVh1zB9qbW6XSApGWPLk48z4wAKXIrPdDO3m7Dk6jtTATqeJBz4Cd1NR7y3vnrRGamlFvgyDro2qpFWTWDe3xEox93MeFA6Oz8EYTGrZ7gNjC89FSfXv4FvCfrdQwPtwMis7weECpizHfU7RaezJk6YU1e4DTsjiiz8xxZK8AiToLAP8Ts/uMlgL5e0s4TN9/WYs4bDaMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dy79d7aLvvjunBIDS2Lx9AZ8wJZE9VIyM/fCZYNfvuk=;
 b=WZ4dWDKkw+lZvWITjXYPgMDUwwBlMb+wb5MtchhLoinqfKLuJzSHlKvP4KPe3otX9G1rwNI5CJP8/7JPVwqW/uZcxssMWTfo0mwturGkNjommS8l4OHe1bbEt8yBN4BrWLfspD+558UqNi8vh+OcRCG03zOjwa2nBIL0Q1CveSWmfe38XYQc0f+CjUStIj5qdWEsox8dEubLdIy77g6TIieNCSkDErsIaiPLhxZbZdUGUqz1nM3snl31PxIHkwMO76/qUesUoVOksQP/8mdOolaQy/3mnOiBWdoYIRcl5bMluuJCGxiXoCkkUNJtdl2jqG5tW9RqEwsztUfS2fNXXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chipsnmedia.onmicrosoft.com; s=selector2-chipsnmedia-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dy79d7aLvvjunBIDS2Lx9AZ8wJZE9VIyM/fCZYNfvuk=;
 b=RkgschNViVIlAAJ1qjjrB0Ora6Sn4u3hqEO3zqFWFWYAn15FaMfvLHBEUOh/dQHE4LrW5QhYAmMiTGBAPpiiW/ZGTkDvNpChjH1Qg/ibRAg+hljhhCq8zOo4Bf04MvXEOnf+RqD6a+/IFjk5PdQm8bqE52RBmun7u1tC/8MZqOc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9) by
 SLXP216MB0382.KORP216.PROD.OUTLOOK.COM (2603:1096:100:e::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.18; Wed, 27 Apr 2022 11:47:21 +0000
Received: from SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281]) by SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
 ([fe80::480d:52da:5403:281%9]) with mapi id 15.20.5206.013; Wed, 27 Apr 2022
 11:47:20 +0000
From:   Nas Chung <nas.chung@chipsnmedia.com>
To:     linux-media@vger.kernel.org
Cc:     hverkuil@xs4all.nl, Robert Beckett <bob.beckett@collabora.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Subject: [PATCH v8 6/6] media: wave5: Add wave5 driver to maintainers file
Date:   Wed, 27 Apr 2022 20:46:38 +0900
Message-Id: <20220427114638.1638-7-nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
References: <20220427114638.1638-1-nas.chung@chipsnmedia.com>
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0124.KORP216.PROD.OUTLOOK.COM (2603:1096:101::21)
 To SL2P216MB1246.KORP216.PROD.OUTLOOK.COM (2603:1096:101:a::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec862d8d-43e8-4594-2c0d-08da2843b012
X-MS-TrafficTypeDiagnostic: SLXP216MB0382:EE_
X-Microsoft-Antispam-PRVS: <SLXP216MB03826FC97833CB5A8F747873FBFA9@SLXP216MB0382.KORP216.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+SE/GFC5V2FaRZuxbQIqFq84DUz6MMjqYPlPEqW+HfqUNXzbZnxJzdDtXhxOce4mm8TZlwKOQ/KNKXT3qmRZ7CB8WWYdQjS4DFAbmvrB4dId2OGOFTvooJS7GddkpI7SSSQ7LHB2oCMQYzT5lriy7d8k8DXsOgvkCGoYE7cBwXRSD+ijUaEcgju9roYyNLyb/KpMgSHoD5Du0KPehKAFr94dJyimxPH4gvdBeg3DOJCfBtgmnw9NRA1aQMNI2JNATMXs2PgpfWAASsOlSLkcNNFhngHM4E6MZXGLVuhgnp0oQOLg5aRWdgazmvpo8WIW0fBqbTL8zfOssLZCfKnbpV/ZxlFQ6uOwjFLQGbvbsjDIagza224fOE40uyjhDbsv2JU+M6VGnGBg2EIG29yNqXEB55rIuhjmS5YGz4iRtSnF41VYrXzCXyzFBNRWgKdhIXQwvLji01sJHUkuM6nVdu1wDU7FcCWKbz1zIz3C6HbFXEnRRUe1ZCkTZIs/9eurTbqbgK1TmIdR3U7e2jqMKo4uTHsdkc+ZSL8wrgrIKcAyy+5smFyd7M+B9D0uYrjtR8kt/X3fwVLWMihWXnGGy9AP5aXf49Gq+IQWm/xk3HSaH9UK1QwKcmEgwJ80vXnm5IzBU7i9oi0r8zXYWw4IzDiAkvBgkpVBqjpeqlNWm4ycjJ1Cdj4PQD+hS5HJ3yE6uI7z2e6Qkql+KT4leSEDA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB1246.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(39850400004)(366004)(396003)(136003)(376002)(346002)(6486002)(316002)(54906003)(26005)(86362001)(186003)(38100700002)(38350700002)(6916009)(508600001)(6506007)(36756003)(6512007)(6666004)(52116002)(1076003)(66946007)(66556008)(66476007)(8676002)(4326008)(2906002)(4744005)(8936002)(5660300002)(44832011)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O1pvS6X48sTYc0cO0jj0KErjTwUvRuF8epl6NgFdcWxzfTwbTNx3xLdmSuMe?=
 =?us-ascii?Q?DgHBe2zq+O87r6PU9pDG3icaxYxAs01bQAx7JESl2krwd96PYHv7fu1S93sh?=
 =?us-ascii?Q?ae8fS0V3nQcxrZMUD09oJEEjRfZLCpYqaqX0JJPzB2GF6vb7YGWAmtB9QXc0?=
 =?us-ascii?Q?E2b2EyhHexaE3yCn693a4ugySPYm4DG75qhefU5FRU+lEaWt1XDbZ+QGUC4n?=
 =?us-ascii?Q?q2ZJ+7LWEMMcAyAjtr/AsnRkn7aoZQfW3BMWNMpTr7bm7v12jgbeTvjz4yje?=
 =?us-ascii?Q?q8YZeuuAV15VGoYXxMxfQFOthHXKTPfrIDcLuoafb5qkICVi1UgtDzAOEhbe?=
 =?us-ascii?Q?zZtHv5YaN/O58StGHd21nfuTpgC7GafvNgmphQgmsdY1AYvMl8VNd5mVSkW1?=
 =?us-ascii?Q?wuH4xBvBXoleiw56YQN4Xzs0NcFS8Ws4eiZhVwcwv7/+ezPj8jHDgvWFR0qp?=
 =?us-ascii?Q?/hjvlTgwB0WAckP8Yx1kiMbfhxitPxCDELQ8ZzR2exYdRqdz/z4QBGTfBwEZ?=
 =?us-ascii?Q?mFLYO7odwWA/MVGTm1DMfB8x+76M3naZRhV8d3s21Hu2VqdF24rDM/6LcoEe?=
 =?us-ascii?Q?N9fFYv9AfB87pHqM6ofJHC/c5/9ntkoD6wAXbOHMwIGbg3S7ie4TS+6E83wT?=
 =?us-ascii?Q?Aby5I8yh7M0KwIOxZWlDMupg+V+ZhvFx+4woK2BCwZYpl1Nnc762/qj87sQa?=
 =?us-ascii?Q?QeHfEUFA6ZHrGn56gO0HU7J+TP4Ccj1ALsWilkum+5krfgj3rO3s/B5JV9Fw?=
 =?us-ascii?Q?zPCSP5Cvu93VgS02OZ8/WYSmKar7TutGE18ENe8JUYdJsHQRQ6zR6QTdsPed?=
 =?us-ascii?Q?GYNM4VztMktIBxzR5Ah/zN5eKlHeNAwfQjPnrtQtwDZup83yfVqrO/GldHYu?=
 =?us-ascii?Q?iNKnkBvC8K1NZu+VTKGkrDsy5XG8Jh1CzO7d8p9rUf8H6Bx9ATfPWsfmpnbA?=
 =?us-ascii?Q?0ZYnzqqU+lcbhd5poUEB7Elga5poEyPJuXwBC9E3Av+I2qVel2AjeJ8JQOXO?=
 =?us-ascii?Q?IAXz08uVrtVOs+/MQZ/wf4I+zDQE9zSg6bGTLJsVKKkRC3jGbe+cEpDAqhmP?=
 =?us-ascii?Q?kJdZlTebvldPag8BjfrKUZZ0EZnTtuz6n0g9se0ZuRubdeJiVCoWC4Rf8eyd?=
 =?us-ascii?Q?lqbNiivw4IROW+SmIu8O6fa2BOwKB8hvgIGyuMrABIMM0D0O79iJoDX6PJDF?=
 =?us-ascii?Q?IcW0xjYj2k6EqhBcLahHDp7Jf5vq0r7E+JZfnE/WZionf6jC9XLmyBBDFdTE?=
 =?us-ascii?Q?gSU19VapBDvaYUolU0Yqv5XgP5lpDaZ77f97DgklOVBrhnVAuZnCV7+LJbYK?=
 =?us-ascii?Q?kGK4I83CwRO0geC3H7r6Cm4zP7ubrQlba5mKPw4/yM7/J6sAJT4MP81242XI?=
 =?us-ascii?Q?7V3x8jtz1HD2+pN9GwgeXliXjsFH/bRQDt7d2VOuy2a5NvGtuh9fJUjusUS0?=
 =?us-ascii?Q?EpMMJMYtmql2OdNsLxUeuvM8rvIwmczs2Jgvk06qZ2Zpw597ymQWsT6P70n5?=
 =?us-ascii?Q?zvwLGz+f0H3OCjnyrUHehdCzzHFt5vKAviPBrtX369gg6emzM6/nRfHAcRXR?=
 =?us-ascii?Q?gWbeCFeYl2IJ0YJjuDGl6JIxlMFfJ++tNk2RoJG9XDQ8OaUFtXbfoYLChXLN?=
 =?us-ascii?Q?ibS5p4T5vmH2is2DStJWdJBD1BfGB9S2uftrWzGo2xAGIjtDnsJ1OaDCGtrM?=
 =?us-ascii?Q?eCFGSOMcgfwqzF/lRRQz2eP0NNLaYdm+niRtD8DNMDB9B+RtyvSwdy4bbSH7?=
 =?us-ascii?Q?IhWmrvd1qBSkBO01J/XVaIFqIlY5EII=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec862d8d-43e8-4594-2c0d-08da2843b012
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB1246.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 11:47:20.9184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCIS4BkmB7PYvNkuJFgUXepqo7dqOpKa7zzNP2mRc3BDpszoTSvDu92Iirddw5hlS4G4KrHU6MhHjaxH1sDFZrkoa+y8T7pLkU3WKpEA56w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SLXP216MB0382
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
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
index 5e8c2f611766..129034ed7e7d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21210,6 +21210,15 @@ F:	drivers/watchdog/
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

