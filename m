Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48D14576329
	for <lists+linux-media@lfdr.de>; Fri, 15 Jul 2022 15:54:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234657AbiGONyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 Jul 2022 09:54:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbiGONyD (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 Jul 2022 09:54:03 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80048.outbound.protection.outlook.com [40.107.8.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8F9F24F29;
        Fri, 15 Jul 2022 06:54:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D0yEuq5WrV/zhCW1xu5LEnos27aK+uRZOyWyIEGhPL59Y74V3iMNlICeJ27+BiF0iSJ9R4vYDuIPgOJGpiXZw8cId26nWHQsUnBIkrBJBu/5A28Eh51LwgDPaFrCAymBIhmjnTHho1mU3s+/9A9BHVv2OIl+jsJA1tV5FmmSxgv1H9CF5SJW2ovpB7Q9y4ACVUtT130wXQft2Q/nLR2rOLtpclzte3wyvD2f5rAUbbqyyieMXF+bXPP15Kp9NXRkEqn0zPwqOYdEQL29fe+k11nSzK1EWkngGbLaYmYBRREuGjrnQIbNtmMjaFfhMctKf58C9680Rb/t29yIlpnB4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ovrcl+8ua66la0c/B04Ms+KmUl+7NtWMDBTceDurdr4=;
 b=YkJPovxPOLUD9ktO29UdKwq97agHDnljPezJXLN+k9lhd3ZlMEhm/F950HY1J7/rwRM0spJbjV+LYKuXPxOEEOGtcp/X5U4ilARwg/EvlAPS8qj9B+Dg3zk6p3xlyO7SroZXiHOMcf41YjpGiV7HNCoRj+2zHobA3b1R/D5jS9/JBqSIxTNWFkAZnaCtZc/uZ2JY1pggCRYhXKH9NElg8NPZqFAMdba4yUnHGczCDnUhpv31Upo8WzskNy4+El+nuWhxeyQEnEJ52nS+BPrhm1MlJzxz1EYzIX5KPTKYpkUjJzxmX7J/FhOgqBTUhx7qY9TPiylLqGY+PFMdDIxS0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ovrcl+8ua66la0c/B04Ms+KmUl+7NtWMDBTceDurdr4=;
 b=Y9nfuAzR7WUEtNbpuZv4Z8QKhE4RbR6x9LijKtwiUawhf9/5VQQ64RwZSVwVqo0x0cdv6YU2e5cbMcP7XDV3uIJh6cv41AhQzV9B0A1qIvx07khu8NBoGf70bJz0cuG5jkZM+3Oq6sqNGuPT+0cXOHozu7zUM0Y7723hw8eQakc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by VE1PR04MB6640.eurprd04.prod.outlook.com (2603:10a6:803:122::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.12; Fri, 15 Jul
 2022 13:53:51 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::d51c:319c:bf4:199f%5]) with mapi id 15.20.5438.012; Fri, 15 Jul 2022
 13:53:51 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v8 6/6] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Fri, 15 Jul 2022 15:53:29 +0200
Message-Id: <20220715135329.975400-7-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
References: <20220715135329.975400-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0061.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::15) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d0347d79-935b-4f27-3a3b-08da6669725f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6640:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k1tvcSQpmHyGHuIyHLUXE0YQRf33W1MjoqNvI9uOjSzJK1s6q5zLrT1rlEW3AFKKAw5DkYbd0KlDVpmyLcH+qW3wXPzaj/tw4uTEZb3Zrzy2h8SpPbwJJ6sWGLQSEqri5gQhfW4Pxo91HaJB9ptxYx8lERarDOVaHW/j+eBblsHtKNZjPycr7c52Fi7g0EH8wpKW/I0v2uqFFzhiMsNNKa4DwrSK2OeOFazFQFhAUCSnN5I8sKcaQIQx3YoWObSPr1C070DKouQyXPGeFCm93dVdL2D/wpwCJoqvqWK6zobw3n1JJgOZpgr4cqKX2VucVRxAQAMveyG6LteW6VbHqRv3zP/lZ71c4qdm4zvipyb59PrdDItctUaorvJPXxpvuqrw8tVGxf+L9tV64QUycNC/JBGb0HX1jdnC93trDNpIDMS3SpMO3NsPL+NhRUNv0C/BrE8qOloP6p+upzkIke/eKoCgFs7sK7pzOZXgOp+CYds62H9oo2/NwjB56z21N57hO+wUryU5ItZiuEaA1INBYQt3z82OZAwwlbZhh/Awv3fOtg6oGlFm8MgYDcBxJ41iRVLjxFXB4UmrNYmzix4Jq0FMqxVf/2cQAWMJsZe4BpENmJsBF5ApQiJr0kKh/XwXi7+HOCE361O12P1QisP0NWvp3SryO5uRU6y0MlzS4/zrsW3ddjAnnwbkWBlLWiQk85LjqacAWElpcjxiZmgXv7qMox05452Qf/DHy6cDuorvRCqf+aOjHw4bmYVh
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(6506007)(52116002)(6486002)(86362001)(478600001)(6512007)(66556008)(66476007)(6666004)(5660300002)(41300700001)(38100700002)(66946007)(316002)(2616005)(1076003)(8676002)(2906002)(8936002)(44832011)(7416002)(4326008)(186003)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jnQyDuce6PS2a8E6dO3qjDCEq67khMxvKrzQvBfQhiOtR3ywPMJApsBOX6HZ?=
 =?us-ascii?Q?RWDoaTemHtqxesRg7nPLmGo7aDcSS8+GWWfHbp1dkMMNpG8/7PZCVMmcw4LF?=
 =?us-ascii?Q?2j3fFs3D0Sf71MKmRIqj4hc1qXZxwRXDTbJPBmV5yh63k8drS7G2+l7prTQD?=
 =?us-ascii?Q?b/7LZv45QTdTZ2qbdy0BkAxwobhxFocaYvPVWOuA92Q6fPbPKmDDtj6+PTZe?=
 =?us-ascii?Q?CId9nNTqXAPoQKU6k05tC9J+5+6/QbNgPgISuXKxx7m/CBH+52xg5rGiZhA7?=
 =?us-ascii?Q?itXdGPwb75jplCsAZah3wXbb3Cqk+hWB4DhQk2P24XA23P/RTHfqFDQTncJ/?=
 =?us-ascii?Q?0QOS/8QcA21LaN2FTcOsQPYp6s+X/QWpfaJTVIErPRHPiC3e/OinXQMjwTNP?=
 =?us-ascii?Q?AYAV7/TPQxTI8PiIxXjRYYY4qalvNK7QUEQq5QHRRpR356cZaE01vtwx9e4Y?=
 =?us-ascii?Q?rvKCSBx0xL5LwFv+2+3IaBjHDimTXCwL+MbwpEeLeGQ2i6Em3NaeEhUAKtDS?=
 =?us-ascii?Q?5lE3lxifEjEwm3DxyznHDATezEkJLSHch+SzcnxZ8//jQlpO90MIExiu8jhJ?=
 =?us-ascii?Q?IqnE2ratNYyrO3yGdGQDdk8vHVjRtAnVa5evucid3vJhq1rcqYbH/GC6M+yn?=
 =?us-ascii?Q?7XEBNrpNY2O5BwKIScDOpAPGqoDtEhzl+4KUBMP8y15NAitVBsrgFQ7dNWyo?=
 =?us-ascii?Q?ZDz+9pkvAubhxxxQMgUzoialQvig4EMwMzKAA0GLgLP+62uV7oN3U45z0CqW?=
 =?us-ascii?Q?bYH5qIU2hsVogCek9jGwRwI0Ryte6bEo6tLz/GcAD3ISvrTT8W1V1qsm3HGk?=
 =?us-ascii?Q?mOYr02fPS9PKoDB4MfYPY0WQqVBpxECPOelSTa/mz4Xs9Ure9q9ULYWYhKlH?=
 =?us-ascii?Q?/pzlHGANDIymUziuALfTOxpNWl5hb6/eO8UflYS3njTms08WaAdOVr2sJE8T?=
 =?us-ascii?Q?7bbgRrzl8Pjy1FGyl69PX5+TFJ/fsv9J3FL8ht1EgaY+jGAEA9UjEAU6yAHj?=
 =?us-ascii?Q?ihkzKmi5skGE9i3iNoZWaapQUKFS7Km/7R74DO5pxZNTsHdK1BjMB8t5uICg?=
 =?us-ascii?Q?mBNoghnSZVpZ7q01C1DvfGI8QujJAHu5Cs35nZD8S9wyLfZ2f5nUQtjYfIFT?=
 =?us-ascii?Q?QLWgntknXUe267SmQnUjbru4TyoALWPlCYQFo+tJgmOg/apzq7J6Nv3I4RNH?=
 =?us-ascii?Q?g7B6UGt/3QTw7qeBB7dH/cFSvdz0RAIT6eyT8QWMc804JrVkKn6gI8zJSvoa?=
 =?us-ascii?Q?4Qu3tvewr5zOS7ORvVyqDv4PvNXaVoezpsCsEP9cVJW1uYRT76aFi66UpKRq?=
 =?us-ascii?Q?FS6ICnlW5mbg48F714kVd8FDS+hoZtFOzko9B6LKilhIGviTkceW33lfAA3S?=
 =?us-ascii?Q?vt6TsDLAbJdaxQ2Kr/XIltEstQZhlGrPmJzI/+Fo7ZGFeja77dpo2QpnXCVP?=
 =?us-ascii?Q?Wu2HBwR9rnp2qTa5aQdFAZCcWjoZa7HA9CKtEguOlviKglNGrS8TxMrSKrSe?=
 =?us-ascii?Q?/UsHUFbKnkgFcRmvfdxmTdyvKADCp7/ap/aL2KvZMj4jACt3ZW3rky+DyE2G?=
 =?us-ascii?Q?NXlxEw4r8j+8P9IuzV6HIrqrCK9ynOdAxMcSwgSLgjMEpjY/QNodUtNlo/qs?=
 =?us-ascii?Q?qHJZO5YVl7Px7JRO5XCJPlocvotEjxNXUq/Ax71AlOkzorlAtpZGwy8T+C5k?=
 =?us-ascii?Q?iiAP7Q=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0347d79-935b-4f27-3a3b-08da6669725f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2022 13:53:50.5288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nk82IXhBQBAEGZusXAOpRsoolY0apyz66QrVLey235MZRpjlswBm8MF5BcrwGz9I6YWyZWpM0+30ifqSPcsMpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add myself as maintainer of the dw100 driver which offers hardware
accelerated dewarping operations through a v4l2 mem2mem interface.

Signed-off-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1fc9ead83d2a..a2e1174bc0be 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14355,6 +14355,15 @@ S:	Supported
 F:	Documentation/devicetree/bindings/net/nfc/nxp,nci.yaml
 F:	drivers/nfc/nxp-nci
 
+NXP i.MX 8MP DW100 V4L2 DRIVER
+M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml
+F:	Documentation/userspace-api/media/drivers/dw100.rst
+F:	drivers/media/platform/nxp/dw100/
+F:	include/uapi/linux/dw100.h
+
 NXP i.MX 8QXP/8QM JPEG V4L2 DRIVER
 M:	Mirela Rabulea <mirela.rabulea@nxp.com>
 R:	NXP Linux Team <linux-imx@nxp.com>
-- 
2.36.1

