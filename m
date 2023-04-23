Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE01C6EBC61
	for <lists+linux-media@lfdr.de>; Sun, 23 Apr 2023 04:10:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbjDWCKH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Apr 2023 22:10:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbjDWCKG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Apr 2023 22:10:06 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC26D1FEB
        for <linux-media@vger.kernel.org>; Sat, 22 Apr 2023 19:10:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzfW3H0M/ZbYugkmxrFt4TN4xS8QVQJ4u8JPSzlmI7lkMh2+85fjifBOYv04TZPKHd08SA6Nuc7dEUgUFc1vHfpmCgeb1qwowME8zDkj9U/8tzsY8LlAx+IxDLua0ttAvsJG7SXJs4Y4VbIu8CI8Ik0gQOFuzHd4CAGJFu+tz4eKDZ65kFWvG4+xGNZ9HZZkBpNgz9heFiPRk+TBrJ+9JtmQsietNWKk3D8nu4QTChqYEi/vsApwT7JpZvvXhLad7vuFtjIEM5nzuTD+FlscE2KDwZlUjgGQlTfgnLX+kj1h0dD140icwbR7VkgPrhOI+gTVkZU+T8ULbdN0HjdX0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkI9LFxEf91u32bChf8j9YrF4lUG2B+tgY/2nebqjF8=;
 b=PsRGybsTuV2bFFPqzt2wFnXfuSMU/2Rf0RnhogN7pw2vAfKLGjXanqYVcS40YdCtVZZjcYAOTtmqHiJ9DMnGIwJoNBEDfBZOCePecITW353Nl0v5l3La4TlgN/0W+4+mMqlfpw2WaacH9TF1UY9TzNIIDrU1oWNROCPJpwZ/kPIYxMkFyzQHYRvsaY/f+fDvkXut4nuRHLzFI8aeYPp6hPUeIXrMCdK7Hq/cByIQSTPt2ukKxW3koQJwvnS6DnS7jivnVtl72LvCv+XxH3O8WEjuKoOcVNXr3o4hHwFNtK6d7Jki75waXaJDWWinn63xTcfbnqYweWOO0X+D7ePEVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkI9LFxEf91u32bChf8j9YrF4lUG2B+tgY/2nebqjF8=;
 b=BVopAVhDJjt33+jRSTuSKl/7UVG41kQSPIMo+dWd5uzPDhRY5fMLzfmcQsNmUAn7FBvyR1FMPCjMyaIBnBJsOEb3kFsguW6lT+dAT7NQ7ArUsE86X927QFVNC/yVXzA+l44ciJOrGAWoQDYy3MrZn+SZuFVRlwuGqAa2rFsCxu4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS8PR04MB8264.eurprd04.prod.outlook.com (2603:10a6:20b:3fd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Sun, 23 Apr
 2023 02:10:02 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::c29b:eeeb:d22b:7bd8%3]) with mapi id 15.20.6319.032; Sun, 23 Apr 2023
 02:10:02 +0000
From:   "Guoniu.zhou" <guoniu.zhou@nxp.com>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        slongerbeam@gmail.com
Cc:     laurent.pinchart@ideasonboard.com, jacopo.mondi@ideasonboard.com
Subject: [PATCH] media: ov5640: fix incorrect frame frate issue for defulat VGA
Date:   Sun, 23 Apr 2023 10:14:58 +0800
Message-Id: <20230423021458.1138760-1-guoniu.zhou@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) To
 AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|AS8PR04MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 206cf725-0485-4539-6124-08db439fd8e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ON4nJYnQXjXm8RfkjgoMpfixSyhGAgPkQ42Mqj4zJJKXUlE5PbArKtr6WrzUqLlCzG6k+WUyLnFWOYcvstMhTd6ImInour/zMQDtKgRWB1rvJ/VNbMBEr9yOSKM02yu896eJ7eI9aHKLnG+2JNTDDH/asXBiAyAb7rhwXstGjLRn4lTJNpEG2msa/qz07crK1cTy4xvN2iQTemZVBRE/HszkbN1CmLbzyV002PhtthqRw/6c914Fr0Tkm0CnyXp+8vH0eXUY9wFHp6pboZYBJu+o9M8vVxD1h2Lu5Vgs2VIMVe3ra4wB21JiWvmhi9ipozyAhHZ+v1icxCsgMoBykg5HvS130MmUR5JmbbSpfCpKGxy4hPyP1Q/0te1rHrNYCLem7soGEB1yAEpyynG7YmflWnzH6IF6e1kSLJMMmOgtiH8fDkGZB2FPoqEOQKfIy/wr8oHWiwj8ecdHosLpGs8Gu5bLMrbX1TbFRBxSuwF1rnPQYC0pH3w1BS6Oku7HVOxhdxGBBOQXLKodjaNIIFZZLVqhP15EoCtC3sANoVPHX01tpRUkjTX+4q9fvDmmbnlPI7cvXfYQ4d5qlEp4PtzyHe/8ydQRrVAdoFaghHfGg1H23jGYDLgY2CIG9RZd
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(451199021)(2616005)(4744005)(2906002)(5660300002)(26005)(6506007)(6512007)(1076003)(41300700001)(83380400001)(8936002)(8676002)(38350700002)(38100700002)(316002)(66476007)(66556008)(66946007)(4326008)(186003)(36756003)(86362001)(6666004)(478600001)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lGdtrAcGoBiy+hzkG5Y24f/nqiNRPucp63bfSE84JxNdYub6CxeMW07tDmBO?=
 =?us-ascii?Q?8gsGRmG8FKhqTh7Pn/hfTiHwXnG652qmXYf4qJYLJfV0dfq84AkAzneWj9WO?=
 =?us-ascii?Q?2zoarJ+gqhesVZsK9AuYDT1wKQO9eoxggxBsLb7GQlCdapSUvO8cpkvlZLJC?=
 =?us-ascii?Q?mrSnkI5RPcAejH5YizF8yVmk1MwShYArOsD3M3u+WZw1YtV0VSXXpP9w2Xn/?=
 =?us-ascii?Q?iIYULCKXSLGcQJwoae0WU34ohPtvXtpSTLI49M/ea/czOoO3lcYr6O8eflUR?=
 =?us-ascii?Q?9SwlfgHnAwn0LfVLIoUVsu7w8Ewowini8c2meChzCkLTM+WIvZbxzmivhARF?=
 =?us-ascii?Q?PoWokvA+gEKb4Cjpo3r0v9FmTgHxGEMgh5Urtbfn1Q9hhRjbitXAKJW6iWVu?=
 =?us-ascii?Q?ON9xgMfvgC0B0YPaH3mCvZX3trnE5O20Qwt7Qt4o/3PtqJyhNa6uvqF6BXwR?=
 =?us-ascii?Q?ruo645yv0+cOoP7hoIeEa6Ub3wnsCwKNlPedlqMr4UMXw/ln9JvFCKfMHxUn?=
 =?us-ascii?Q?Hlwh+yioD8GBlmtW3SUd/NMZ5rzbzpkS3oCqH1+lY/TYKZXE2VCvWbgRnvRf?=
 =?us-ascii?Q?Ocg1g9C7fXTk3NyvRXqXKkWDpFXGcpC5IePztHuGYUac0F+kxRSRtz7dfzLR?=
 =?us-ascii?Q?U077SjicFPZU2hYrhDCyZ6GZ2xDqY2GaZPE22x78dZIrdrzFaCF5axhgoECY?=
 =?us-ascii?Q?wpSlmMEePbZuVpl6Sfvm/12uAaTDMjbke8q10qH3wCwJ85FXOV3d0rgBxVz4?=
 =?us-ascii?Q?Wkv8bZ0ZdUBjh/qB6jNc99TLskBDJOx2qBqnNKb04aBMx6S28L5D8DzS8hmk?=
 =?us-ascii?Q?fPOXnTvmjoj+PQyQzTrqtvHkfpnpOuXrwCCGj3ZyENsGicvPKmrp8BrZqdM/?=
 =?us-ascii?Q?/PlHa8AUgLI5k5QSDypRw1wKAbKgBvrK0mgMTCaPFogvVTb5/OgHmFdtwHuR?=
 =?us-ascii?Q?hPqfv07JqFT9746GVahGoi4I+OSMoL7XMGY6ICgakspk690aALmXPEGYLNd6?=
 =?us-ascii?Q?3MAYWuB9EA1afzSFIxwFDEJWNgW4W+IRC3w5OJDcOawD0+ylDJdLa0TH7o+z?=
 =?us-ascii?Q?09T9Bq9/UkTPR5fDcqytSdp78RnV2cqCOE17CSLuBIkoBxQ0/PWS+mkZgdN/?=
 =?us-ascii?Q?5PLg6TLLbdWrxqbqVNEtgjzjFcH5AA2fE4ufkXiupp5gDhCIK0WPzau6XJPD?=
 =?us-ascii?Q?Pqi2Z28JP0YccDKkfD8hI9EvHvmi8HsMYCqH3XRay8Kn1nmUc90KlzYDwIDE?=
 =?us-ascii?Q?PfcPb7UyvEGALhjhLk1VCV/cHGhQZdlxw487tmwlaQMBI0prLlzb9wsg3ZE1?=
 =?us-ascii?Q?b053N3cLs+3UaAJ/ucr3DztQkwe5srHEuJPRdICWcBdPLy2DZQ8WLDGYQfPs?=
 =?us-ascii?Q?wNo6rgQjH+fwEBXZkcorFy61i4WBpQOok9WDRqgaNqaiVcbMuLHIUT2XNRvc?=
 =?us-ascii?Q?PqZCtww2yZmV/YapG3Hq6KYPBls6U+4n6mLP99G9yOSOBQvEPWaY+Ona3sw0?=
 =?us-ascii?Q?t2bS8qonLD/LP6RkZcvIR6It9DFCQJpVZO92EJyjYr4klEz6iVoQPFobZH21?=
 =?us-ascii?Q?B55PDCA3+0A6oxws32tjk0uWH0roDm98pJUUUqeu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 206cf725-0485-4539-6124-08db439fd8e3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2023 02:10:02.3607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vUI28O3ozxlO3UR6zYRNl7UutU9oRV224489i7bZRho6X2sc4C6QUQIELSIZiIR+Q+8yrYicpfe0Kgyx6k25yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8264
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If runn OV5640 with 640x480@30 default setting after power up,
the real frame rate for it is 60, not 30. The reason is default
frame interval parameter initialized in probe is 30 but default
link frequency is to generate 60 frame rate, so correct it.

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
 drivers/media/i2c/ov5640.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 1536649b9e90..80e1a2858abd 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -179,7 +179,7 @@ static const s64 ov5640_csi2_link_freqs[] = {
 };
 
 /* Link freq for default mode: UYVY 16 bpp, 2 data lanes. */
-#define OV5640_DEFAULT_LINK_FREQ	13
+#define OV5640_DEFAULT_LINK_FREQ	19
 
 enum ov5640_format_mux {
 	OV5640_FMT_MUX_YUV422 = 0,
-- 
2.37.1

