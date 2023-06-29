Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1674741DAC
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 03:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjF2BcB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jun 2023 21:32:01 -0400
Received: from mail-vi1eur03on2084.outbound.protection.outlook.com ([40.107.103.84]:40800
        "EHLO EUR03-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229533AbjF2Bb6 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jun 2023 21:31:58 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YfbKwjMEsgcU9xAZthoav7lTask1gm+cP5zSKpIR4HidlV8MK29r9Z8FBkCelUqoO7zSW0/fI40wkEDGA72AI2OjThh54dYM/C04VWvY0bLdYxw0DSJgLbaOtmTMX2qM0cjRe4Mxl89Q3jGbWDdzBUkH+6dPX2GAKJR3iXy7tAJHxGfegbtTQ/VDeOfIq/I2c9SbDJHOY67wLKyUm0UrUEZZRq2pW6O1+gILnte/vPqdLRTvElh3y781QJMBD0STfdkT3N1iyTPSE2JcxEgadw1n6WE58GdvtiOI09S3iOprIjxtCU2Lm6xURGtzjZQx+9hzCB8AGL89UJnqRdL/3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rfi/kAEK3VI9Ew4GBwiCZ/JdsGyhepbeHLi8+Rh3lw4=;
 b=a9GyDD4xzLp+e/gksqzg6EnPqHf59NECgB2Ar//qyIR0jICFwo+CZIeb0DHyGCqHw7lEPlRXQTQcJH89yMSsY5KszdBR5POZGiKwp37muGCJUt9u8JDO1gUmXGMeOV7t6rqqsALuLw7+695c/xB0u1tHmILPug0INloFh8DAleFJJu18Emq9yT88vTkeK+/yoChkO/L1t9B/tj+q8D9ZAqODaycYVw4ocS/fTM1mWHx2+blZlM5dA5jWPxEIPzFRkBJl9lJFwrdboJthuXa2HFKdoBL0kjpOwgD/0TDRcAitgHLR79am67zELCsLzhRakPMsmJcYKD9oRB1RpFtA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rfi/kAEK3VI9Ew4GBwiCZ/JdsGyhepbeHLi8+Rh3lw4=;
 b=Tdb8yG3of8jRxVt8j2kzJjrkJHk2vaEeLW81mtjqKYiS33MiVoMQZLUo8UaciHnYFegtiwJmpr0vLqR2EaAk3+DVfV9DHReasfrBlfvmgG8FcpVExrGXKb3739+ped+87IJrYG2UbflOeGNfodofUkhubGaU9PwAyyijFNRdKWc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAWPR04MB9888.eurprd04.prod.outlook.com (2603:10a6:102:385::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 01:31:55 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::1a0c:99b1:603a:e219%3]) with mapi id 15.20.6544.019; Thu, 29 Jun 2023
 01:31:55 +0000
From:   guoniu.zhou@oss.nxp.com
To:     linux-media@vger.kernel.org, linux-imx@nxp.com,
        devicetree@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, mchehab@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, xavier.roumegue@oss.nxp.com,
        kernel@pengutronix.de, jacopo.mondi@ideasonboard.com,
        sakari.ailus@linux.intel.com
Subject: [PATCH v5 0/3] add ISI support for iMX93
Date:   Thu, 29 Jun 2023 09:36:18 +0800
Message-Id: <20230629013621.2388121-1-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PAWPR04MB9888:EE_
X-MS-Office365-Filtering-Correlation-Id: e7391dcd-b894-45f2-3858-08db78409f97
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2oEv4+rL2SggWJ61YTmJoHy77vUz7coRsjLBwRV5QfRMExn7N8rDQyWndVfpKGKn7O4sLp+QjlBvN1iwZxsZWis1DzTSAWakkM8LpXg171AJlllVVjsULQtNNdjEuiYfLMY+j7RbH8tHkGGaTeE8pz/xawcXPvJsRtiFzRALGsU8buQJA/IdIJ+Dg6Kv7PRkqFuAyqELW5bpMlKFDnUE7lcPhsV0uyHS4xopfp4JnUXdgG0cCPxMFPSZNxul8n22GfXu3dNtYj8jdMpnvM9E0cOlT5xVpcUp3Xz19vS2X6e43xTaiJE4xUUOwePaMiijVpK5HHVeDsD2GuQl5+uHrqenWYkMQa35XHkJEPfSDpDNi9C+zm4bEn5KproS1494FWBg3MCfmVoPapTvGd/VVBgA1zlULd2+Rdx+0W6yxOOUAN+1ES1sJxUtWEyr6xJS0KWoe22evjSCv+Rg081ljNV3XAVk2mdH88ypPFGUm1MfGx9UVsNy2Fw+aiWUAofvdmDdhhdQCcJNa/q1FFhg/9IG6Gf9bKW4mNaYk6aBB8NGEnm8Qu6SljmQYEqDEo1lr0rwupFxiMmmvuj/QGumf1lTBBMWMfVO8526sPg86IbYI7icb1KAnS/RkV6UFpRa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(451199021)(6512007)(1076003)(5660300002)(7416002)(66556008)(8936002)(4326008)(66946007)(316002)(66476007)(8676002)(478600001)(6506007)(86362001)(2906002)(41300700001)(26005)(52116002)(6486002)(186003)(9686003)(2616005)(6666004)(38100700002)(38350700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RnMkYTHBCqms7rsb/RWxNZrgKqi98GQLFysDGobDAfhmxtSHtMn8my8KrvYQ?=
 =?us-ascii?Q?LpnBbADCcsPz5ZMDtjCjEjTEtZorsDEj8p+3sy7eH7/hXK8i6+/A/E0iKFXo?=
 =?us-ascii?Q?UrM5kMiIdP49T7NFaYgERKSkkS1rzDcM00xzDu2oTQnzY1tsDUo3rlsdMsfF?=
 =?us-ascii?Q?n7oiZTepbywO+PKz3+8IHUtvK+mNfu5mD86t/I7iVJ40ddrFUERdEoi8njLD?=
 =?us-ascii?Q?+qgJl3ZOibqdEo/d7L0qlGe3h3Qt7n75NwQJs5q5I6fPuL+SnFwWR4ttMdTs?=
 =?us-ascii?Q?Ucx558ZSEX11g8H4VD+QDJibrG2YkCvpyuQk9FY6cUpPRQM8ogyh3dtRKxan?=
 =?us-ascii?Q?gmvkhTfN61snhKo9Eearz//ok9A1f2XFL5bwZQYNZFJuYveMznASwaZBS2ap?=
 =?us-ascii?Q?LSNLTAifztlLXLwLr6AO32puRXrTB82C86dMwTlf5G0i42TRzmP73bw3/6aj?=
 =?us-ascii?Q?t9P/65oPHMnVyVdqPmpCzbiKSplGkk+84BzsZOdi/iO1sgEl7S6+K5obkgm1?=
 =?us-ascii?Q?8A58MrMT+JDjmwIv/eiwJDtAF8T789kUznLeewC39Ep9f24ahxI38K/CBM+0?=
 =?us-ascii?Q?NB8pY6mIcm5xYXwRZi6iyzS1IyMfYAoYXFZIk5CCRkpEYOt57I1B95sKBwUf?=
 =?us-ascii?Q?BF6fdzdC+6TFWb+Xi6SpFvaIOeDiUmk4r8GyIwhZQ6S0z0pZ9Gr6EOU6jnc1?=
 =?us-ascii?Q?U5UOyDF01WtWHElDk66fRWT7f2NHtCiom6q4vo8cVhxYF1qF6RcVnR8fnutF?=
 =?us-ascii?Q?Rapl99BqeTtSdhB9uZcxbdccrDi2anPXFf7iXcSxQFO2C5i/7kaKT+gWtMPs?=
 =?us-ascii?Q?ee45Ui/jzcXXKJvVNWaCTAx9ICWSs1MXKfefvORGWA4/3i0E0SYzlsEQGRW5?=
 =?us-ascii?Q?B2VZI5LnBakxwlSrggO3zy84sj+NEie85+eWNodJnyDfh9bK9egZxOGEu7+8?=
 =?us-ascii?Q?5zxWTsT7jApJVZLXAcgf4YOU46E0DGAc36qK08d7TkgowQWJ1/p4W7/SlTmO?=
 =?us-ascii?Q?N7J7NDMGqLWbYVWaaqLySjRIjVQgXBG8qkt4x4QbBB5/XCsUKCnoKvF2Gjfp?=
 =?us-ascii?Q?k+p382QwhPdgsnXnue5P5ajx5JeLLxyA/n+jv+jQiAfMweaftCuBKP0mSRGg?=
 =?us-ascii?Q?5B0DktyZyxYg3GCDCl+NKBUxECoE0sAChnYHf9U4S/bsxPnBDZ0hkQHoynvd?=
 =?us-ascii?Q?pEh61w3Nyss2zQATZfqCVIZJ5QseeNgeEZQZjxbGCI+Ien1bu+MnEPdR3ccW?=
 =?us-ascii?Q?qTSvWWBSla/sMyniFdnmQmoImXUvV33OQZ2vh02IIiuR7D5YV97e52Vm076y?=
 =?us-ascii?Q?Hj8dIYjzv59UNBH+Oeob9Z67SU0cFmOehMrcjqk4bU5dSVq7xZLQH8PMSliM?=
 =?us-ascii?Q?/essy+6mKI4X4WBi334j6IP9bj5dxziJkpBrk8rEaeErzRuwdkKn/eNCu2QH?=
 =?us-ascii?Q?0WXPlWVcgyE8HW+h2HH1dKmIgpSIaPl/VrrfES6+Gy5TOrIXZ7bx+4YeAV07?=
 =?us-ascii?Q?gTn2XTNmGkxIRqv7BUvy0ogzUacLkfEuc5/xvRhcY8KfUk3BsKYjdaqW6Eke?=
 =?us-ascii?Q?2Dzw5So1WJYMTJBKGV21ZrAdjN5+zELoyDEKWC9Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7391dcd-b894-45f2-3858-08db78409f97
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 01:31:55.7014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iV6b1nIG31J1C/3I9ENJfPGxnXeWf+XWFA8nNv80/ZBJDi2mFrlIUzJ6meWaYxEyRWIDVU1zMyTbTPw+M12r/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9888
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: "Guoniu.zhou" <guoniu.zhou@nxp.com>

NXP i.MX93 family almost reuse ISI IP from i.MX8M family, so add
it support in current ISI driver

Changes in version 5:
- Add back some header files removed in version 4
- Refine some comments placement to make code more clearly

Changes in version 4:
- Update commit message to explain why need to move gasket ops to a structure
- Remove some redundant and unused header files
- Move gasket ops structure variable to imx8-isi-gasket.c and export them by extern
- Drop some check

Changes in version 3:
- Split [PATCH v2 2/2] into two patches, one create a separate file to
  store gasket operation and the other to add ISI support for i.MX93.
- Drop some debug message in gasket operation.
- Merge .gasket_enable and .gasket_config to .gasket_enable
- Drop some dead code
- Some other small updates

Changes in version 2:
- Remove two patches which used to rename imx8 to imx.
  [PATCH 1/4] media: dt-bindings: media: rename nxp,imx8-isi.yaml to nxp,imx-isi.yaml
  [PATCH 2/4] media: nxp: rename imx8-isi to imx-isi and remove reference to i.MX8
- Modify commit log to more accurately match its goal.
- Remove redundant "media" in patch subject.

Guoniu.zhou (3):
  media: dt-bindings: nxp,imx8-isi: add i.MX93 ISI compatible string
  media: nxp: imx8-isi: move i.MX8 gasket configuration to an ops
    structure
  media: nxp: imx8-isi: add ISI support for i.MX93

 .../bindings/media/nxp,imx8-isi.yaml          |  5 +-
 drivers/media/platform/nxp/imx8-isi/Makefile  |  4 +-
 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 21 ++++-
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 14 ++-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c | 36 ++------
 .../platform/nxp/imx8-isi/imx8-isi-gasket.c   | 85 +++++++++++++++++++
 6 files changed, 128 insertions(+), 37 deletions(-)
 create mode 100644 drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c

-- 
2.37.1

