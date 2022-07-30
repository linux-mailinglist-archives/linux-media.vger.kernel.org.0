Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7758E585A11
	for <lists+linux-media@lfdr.de>; Sat, 30 Jul 2022 12:26:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbiG3KZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 30 Jul 2022 06:25:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbiG3KZq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 30 Jul 2022 06:25:46 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50060.outbound.protection.outlook.com [40.107.5.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F91F2C12B;
        Sat, 30 Jul 2022 03:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WegUmCFlEhjPG4NSxVlEIt/iYfYm5bPdU+nUA1AWyb/+mBmFeVsLLnkylpupm+saspdb4dLE+4d1DT3sWiVs7jYthScf9Jk1fF7/jDhUqDgedrRNgITyqOin/TIsf8zY9qIxxnlXtCGJnLhmNfrqt7xdiDXuhXAIm44nn65UDmfXroMR1hS/Ooq5PSA3zm9DLPzzTW42JPhaVKCoNBYzjCPLvGya1iqu4qpBTsC52jWV+TtNrTSBa6ddXEIhrCYARoZJ5Jz2Nog+Fx+nYhD2KzDTsIcQhnQsRvZyC0b1c8jI3RtWEYx7fTpaiqyP91WWojUnul3bnHNCIGWWXr151Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzPTxSpBvCED02QSOs2bcDzT8pYf2J9JntNxfaawM0o=;
 b=AqPmnq6F+0xRtIx1xDyThFtEf+Z7BCdPszeTDSuDQLOj0J/oNsdNUbFQshW4TJrIU9zNRxedsYWAjOrKpi104WwxnR/WZO+R5JnYRX2a/2f7EJ7c7tm7z1mlbmgvO8oJi84AMAhbVq5LwVfst/T1c/Y1S3aL+DK3iav3IhHpsnRgcvx8AXcJXnzhMpFSsOYqbLfF8Pg+ovR6CqRx/jZm+feVyVE99v4dY8LlKHgmcmsLQE60u1LPfBb++lko3+4V4DQ2Wf6hYagVtz5TsdUAH3nC6/PH7PQdLaG0ROZDOmwXAk/57oPcRaVFh7XkclUvq+FrUWhPHmi9ZXNUQc7G+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzPTxSpBvCED02QSOs2bcDzT8pYf2J9JntNxfaawM0o=;
 b=e9QRaGZ+fSCAuGgWHpJ+4yiOoiZG2nyH8Od47bmIsSzg9f1xhyZp1QbBWH6i5Wx4LonFkM7KrCSsps5vv4O2bmiPX111Mg7kR6U8FwQ0voaBCIbY7PXdb06tKAK1lch/bwtCGCdrjRZYWxxEEkYilj490uq+EWnkpWYkKkOi0RA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by PAXPR04MB8621.eurprd04.prod.outlook.com (2603:10a6:102:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.11; Sat, 30 Jul
 2022 10:25:39 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::9d8:f571:6ec7:521f%9]) with mapi id 15.20.5482.014; Sat, 30 Jul 2022
 10:25:39 +0000
From:   Xavier Roumegue <xavier.roumegue@oss.nxp.com>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org, laurent.pinchart@ideasonboard.com,
        tomi.valkeinen@ideasonboard.com, robh+dt@kernel.org,
        nicolas@ndufresne.ca, alexander.stein@ew.tq-group.com,
        ezequiel@vanguardiasur.com.ar
Cc:     Xavier Roumegue <xavier.roumegue@oss.nxp.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v9 8/8] media: MAINTAINERS: add entry for i.MX8MP DW100 v4l2 mem2mem driver
Date:   Sat, 30 Jul 2022 12:24:13 +0200
Message-Id: <20220730102413.547698-9-xavier.roumegue@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
References: <20220730102413.547698-1-xavier.roumegue@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0067.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2cc::9) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bc0eaa9-803a-4df6-d996-08da7215d3ee
X-MS-TrafficTypeDiagnostic: PAXPR04MB8621:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZLGsZHXZuBFaUmDHM3QrDZlfS9ueTTXu/fNiOkPI5UHfIRQeFJDVNTZJEFur/a5DjkobvTAUJMTl1+fsYeh/0N587OZvjcF4NK/uTBoTXQ3QsTFkZzPCpIkE9lu3lspbY/B6pmMTkmx1SfLMlnFlRp+/VRo2fXST38nUY7JgrSHFlr+vuKp1nY8jyxbwlEiKSXDvPkS4XcUef1+ahHvhj0YI7hKXKUIFy4z7oT0WAD13wcFeOasHhTd0H7UbpfXOs5NhpFlzaaSJZ31MDmUZp20VnbDwbp4GiA9uNB0IU4JGY7H67m2qP56+vQndOE/B738OmpdS9D95PVId5SmIWKrxKWqT13J8UIue6CRAZx7LRfcfQjW2ftGciFqUctVkrjY1mLQplQ+/jdVyxCI3tXHSkghPrZR0puhqzQsPprG+D0rLMy2HVmNskG7a+RBZ00cDEoSjrjaiQgFNfW22zR/VwvszciP2KLpIvrSCLIbbg54Y1C1LiJHYmouAxN2G2cAOHlSAqKN8V5nexo4p5KnJjk9PKvj+egSeZq/pDiedNmqzxSUyjyDkuqkrHTVu4nIgECuhaGwdHjj15vNq4QFTlOR/AeCjfQzQVkVojGQLyzg6tPglNsBRyFp9LiZ51rCZm1BoaI7Vewy5BFBJqnCb4mpKAQkeWZcjvG9zpI0319h6fQL0hLJsC7ABqXfe/M9+FDXFKj/Yt3F01iYnD9GBhqfF/LLq6qdYenSxUvswUMHtRR5cQTYl0PUmGVeM
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(39860400002)(136003)(396003)(346002)(7416002)(6512007)(4326008)(8676002)(44832011)(186003)(4744005)(52116002)(66556008)(6506007)(38100700002)(6666004)(66476007)(66946007)(2906002)(86362001)(8936002)(41300700001)(5660300002)(478600001)(1076003)(6486002)(2616005)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2J6uT8QVLwZwm0fujuNmzVt4slQkLWqBbMGb7V+hr0rCsV+JLvM9VRbXUO0N?=
 =?us-ascii?Q?F3th7zlhypVWhB7XuyVaEZW7YvcrQbXejCoyKoN6+sTgtd0N7aTHrjm9uu3t?=
 =?us-ascii?Q?d+NUiacQmF6jIUrYSky/eRPQwOZKbR8jThdflhK5NtskNvFFiqyHaaPCyG53?=
 =?us-ascii?Q?H96byjqhz+W3rru1FjxuqXBJzodFQjrYKB8AjoIMZpCrK9gtWOerTUAFZr/T?=
 =?us-ascii?Q?pxvF0VkOSxCZvZJmPtGzN/ik8POj/7hozXukSXqYv7xGLinZG/52p6iTMCEs?=
 =?us-ascii?Q?BvkSx5xIry7NrP4ITwkAPPZy6PKMIDQvuwBJSkvAqFAN44p/uJE035U/2XKE?=
 =?us-ascii?Q?fwv1eheSX+/wydSU5G/v4jUPMR8StBXY/IpDzLv8FR+2TllUxGApBiskH52G?=
 =?us-ascii?Q?3uUtgpSMhJ/HgRoTNE6rtEUZWU01MebBX29zN26pDCjNP6vNAi4llqzeQdaM?=
 =?us-ascii?Q?76fpdqb9oMuXaNecnnHv+auWQdoCN9q7qw4pFlKI8V+c3Noekb9xUdVAAaVX?=
 =?us-ascii?Q?Zghaiqlr9J4Nkhpr4oh8xmTCQ60BCgRI8CF+F9q7zYCVgL7lOUNj29VllBpv?=
 =?us-ascii?Q?Jy/8oM9uOyVIDOg6oCcJHHiIH1K7mRiX7PScz/5PKwWR6yfJm5Q1rxgekhIn?=
 =?us-ascii?Q?BViYLNjVYkH6+dILe4iUZZZI73pW1zJ4JDNFXlPlH7GBvMln9/QuePDgi7tH?=
 =?us-ascii?Q?RiVV02FYafuyj47jS3gPggZosb9AQUr5JWU8+uRReMMzekne2nJLt3Kzo/0w?=
 =?us-ascii?Q?KHL3Qu7H/cw6igY50IirRJr9UcBPUMSLL8225cKBFymMFF9tW7K5UmZNuF//?=
 =?us-ascii?Q?7yDZDkR1rKmhFbdPGPspqx66m3UzT7pgy4D0sCFE9EBrpwMMve0/rNROYnsE?=
 =?us-ascii?Q?r42NKxdq33Er+AWUqIvNMyrap1i2Gj4B82HkUDGQnm8TpaG6MQfksCRzsr+/?=
 =?us-ascii?Q?6Sae/Go4+6/MIDHHlPeE74EYAyZsZkUYMD2eUKrkBl1M3/fqZTgwheQ+OzJm?=
 =?us-ascii?Q?qP3mzOdJ9S/HVEOs0Wt2ya7q6lHOhH2GVdw+iupfjt68fXi3jfhzjPIg/p7a?=
 =?us-ascii?Q?qcMVI7y98vBM96msNU1yXT9tqB3Qh//bf7jf3vJFBH3xAbD0A93HqGX2DsNX?=
 =?us-ascii?Q?FXp9nlPmkg70uxj0Bdl+Os0FnjxCuBl4SbfiMQo6ZDeiUbNbzqjC1+0ggB36?=
 =?us-ascii?Q?m52cLzwRSmMD7noPv7Qsa8sPCtmHNo33fjoGkmlIT5DFeuLXHk1RUtWJm2jn?=
 =?us-ascii?Q?IgRUjhfQa3ChkUjksY9z+RLiryG1BI3QUtnEvZhdHT6ckZCxWQ4BxhJfNgAA?=
 =?us-ascii?Q?ELBoW6BfRVZl5VYZ4gJ9k4unQzZkFcB/zy3Tk87iH55ZDrVxjxt54oosBrb4?=
 =?us-ascii?Q?TaoAx+/XEeW0xN7KzCbBDEf3kfBjsbzMq0hc/Tob9W7vP0h6pPVat04FuzsD?=
 =?us-ascii?Q?mpaDrxzxZ7hwEPHnmM4BOkF2AOOEnerbn0cqTEIkKpfRNliZl9yqe1bpLlIn?=
 =?us-ascii?Q?lKRetfC3J5PEBX9Y/d3FU3b+v9paHcDJ5lv+ZjYZHYYYKmIlKeuUQO/mbMjO?=
 =?us-ascii?Q?M41psc/OWKQKW7b8AwNi7BMtg5KqwFSIIbQwuEoHWEOXIPHRrn/AtfCzjKb5?=
 =?us-ascii?Q?l5AM5xB12IW8s41NtEkz3PBoz1CVrxfEcwMMdStCw2eDS7C1JDrQUCC7KeG3?=
 =?us-ascii?Q?iF59LA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bc0eaa9-803a-4df6-d996-08da7215d3ee
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2022 10:25:30.3268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZcmbFJX++F/SYPxMMhHnoWm3gK7RNRjQtjUY7I1CzwUCkpp3wyudPF7+L96PYYy2aB0GaWaYHHXdMRiUcbAqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8621
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
index 1fc9ead83d2aa..a2e1174bc0bee 100644
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
2.37.1

