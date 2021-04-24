Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 604F936A0D0
	for <lists+linux-media@lfdr.de>; Sat, 24 Apr 2021 13:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232556AbhDXLQS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 24 Apr 2021 07:16:18 -0400
Received: from mail-db8eur05on2066.outbound.protection.outlook.com ([40.107.20.66]:21985
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231203AbhDXLQR (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 24 Apr 2021 07:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23ApRiuHam9Lnk4qN/QnPKQQF2cQ9L+eBlGBTdXZqXw=;
 b=cVpj7RoEC+OQr8pkrYarQ1dR+w5/6dOmkm3ErVpcIiC8w6RqV1G0BfZ4S5wB531F8VKZNJuaCKxVSh2V0pKcWqstMQJhaXq19MxqRH6s2fE0Ecwte37BJnZp4xxFCqADIRjSNKDnH509ilm4ENApxRr60S2Pk9615G+rV5O975M=
Received: from AM7PR04CA0007.eurprd04.prod.outlook.com (2603:10a6:20b:110::17)
 by DBBPR04MB6171.eurprd04.prod.outlook.com (2603:10a6:10:c4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Sat, 24 Apr
 2021 11:15:38 +0000
Received: from HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::16) by AM7PR04CA0007.outlook.office365.com
 (2603:10a6:20b:110::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Sat, 24 Apr 2021 11:15:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.81.10.179)
 smtp.mailfrom=topic.nl; leopardimaging.com; dkim=none (message not signed)
 header.d=none;leopardimaging.com; dmarc=bestguesspass action=none
 header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topic.nl designates
 13.81.10.179 as permitted sender) receiver=protection.outlook.com;
 client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
 HE1EUR01FT015.mail.protection.outlook.com (10.152.0.154) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.21 via Frontend Transport; Sat, 24 Apr 2021 11:15:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (104.47.17.105) by westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP Server (TLS12) via SMTP; Sat, 24 Apr 2021 11:15:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJdoCa+ytJJYqeqn8y658H+jVtx+Ew3R/FzQgdoZfugxn/ZjZhM3aAJatkf5LDTsGpprZPwZLD9inKz/rk1rq0Pu9uGKP2gLnScB939K66t6MiW6ReAaqSXeBg/tljEtln6vwhO8lvvMiGSdYnP+Yl+ihBSC19Wi83AjQi26cl2BxGvYp4gC/ByVeFn3cpAsYVBITbVnm/WidRgc4KZ2EMs41jlnzKY5OggiNrmxnUEyTyi7G2gJRLK2z4hnfFH5OZ68JrIMtmTR01oBVNMvjCqD+0M+K4PoNsjSivjY4h2YPkcbwILu3k36cpw9BaKCP2+jVXLL2TVHkUEJ3xsugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duGJvtf4uzUXeoDaP5IdsnbN75C42XiXidtplgs8On0=;
 b=A4dNAU8NqVE6ro4AMK4iFV96bgWbE9uX4cqxTiywE+iUseY11YD4ahl53HGw5ZqOtVy7vDlgLE5xIKW1hcb4ohNLzGkciUlIquehcflR+4rviQmjR2lBu9BkSeTMCQs9rxph3Oh/A/V+YmRMTQm9020b/GtLU78VtJVkaF983kAzfKh1LIbRHWgkwGv1T6UsuO4hBundLu9OtnZiLzHDjbhQMvwUhprr1OZCmpDCH1STGnMMJGv84kv0bzlWZj6NzjOgaEb7LKIyvQuZpX7w/OSJbLJhJH5/wis4BZmwKsiBQU3LJiLBaMEXGN8t/rTa3HqECRXeDmh1htthgasMqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=topic.nl; dmarc=pass action=none header.from=topic.nl;
 dkim=pass header.d=topic.nl; arc=none
Authentication-Results-Original: leopardimaging.com; dkim=none (message not
 signed) header.d=none;leopardimaging.com; dmarc=none action=none
 header.from=topic.nl;
Received: from AM0PR0402MB3444.eurprd04.prod.outlook.com
 (2603:10a6:208:20::16) by AM9PR04MB7505.eurprd04.prod.outlook.com
 (2603:10a6:20b:285::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Sat, 24 Apr
 2021 11:15:36 +0000
Received: from AM0PR0402MB3444.eurprd04.prod.outlook.com
 ([fe80::8175:49ba:9d62:1d33]) by AM0PR0402MB3444.eurprd04.prod.outlook.com
 ([fe80::8175:49ba:9d62:1d33%4]) with mapi id 15.20.4065.025; Sat, 24 Apr 2021
 11:15:36 +0000
From:   Bob Veringa <bob.veringa@topic.nl>
To:     leonl@leopardimaging.com
CC:     mchehab@kernel.org, linux-media@vger.kernel.org,
        bob.veringa@topic.nl, mike.looijmans@topic.nl
Subject: [PATCH 2/2] media: imx274: remove imx274_load_default
Date:   Sat, 24 Apr 2021 13:14:59 +0200
Message-ID: <20210424111459.20730-2-bob.veringa@topic.nl>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210424111459.20730-1-bob.veringa@topic.nl>
References: <20210424111459.20730-1-bob.veringa@topic.nl>
 <b236611b-3635-40c5-988a-5c9e9fae4458.949ef384-8293-46b8-903f-40a477c056ae.ad56e9af-b436-4404-b6ae-4ce93968c3b3@emailsignatures365.codetwo.com>
 <b236611b-3635-40c5-988a-5c9e9fae4458.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.8af6a0ab-fe37-4108-bf7a-19098799e037@emailsignatures365.codetwo.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [81.173.50.109]
X-ClientProxiedBy: AM0PR01CA0132.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::37) To AM0PR0402MB3444.eurprd04.prod.outlook.com
 (2603:10a6:208:20::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bob-OptiPlex-7020.TOPIC.LOCAL (81.173.50.109) by AM0PR01CA0132.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::37) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21 via Frontend Transport; Sat, 24 Apr 2021 11:15:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b763a48c-2327-434e-b8f2-08d9071249f3
X-MS-TrafficTypeDiagnostic: AM9PR04MB7505:|DBBPR04MB6171:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DBBPR04MB6171CF9D4AA9E13B0303DA9096449@DBBPR04MB6171.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:147;OLM:147;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: jA4yOUUIj0scei2yIKfELFD1r/9ip3ZK9M3R+rx+eI4dRzerr35SQeQQe1hOZf83vH6WIRWjWdhclzSwVV17iUeTqtvuq1lMaAPHZIXqvrezCvC9l0CB/3Ye4GlWrPTVZ/xKQ+qKLrdLXLq8ON46k0qxUdoVAII8nFOWmLCXQV9O1D6zcT2ropwCqZqWoRbwoFZsGWpKJcjXvd7rPNITGQY3SF1z4DP5JnpipcpIhP7T+nUpgbO4J1aqekdogx/2D41ksOq6vH44vxWLRBxJoTsskdtN5O8CbjPvJXhCe8mky4jeDkzRfbRmyotrmHlkkI0nsYqd+FFiVHyvjP4bJ9+V3J54cV1dk4BCiJPC8GmanmgU+0zLFqTOPFGRa81GIF7CW0VrC+qBJHZ7xhtrTO+3OPiu+9bNUCkqLQbvYqRq1fRzKF0bOgBU7QSPPPfv5EDyuI5gmiXjHMX+bS0rpq5NabN4RSkVbn84mQCMyUImBbOrjEJqEQP41bB5VWAJW0K49rxT+Ttc/pSD9zvKe9K/6hACKBQEKym4T3X/1c25VB624T+2Ty4e+5ZonT3LiYhRTz4UDi/BvtNGuqkzFDXInJs2OWcdyk0e/t62i5K97rOvFLgKGsbufjBpWMg7OtXO+ePEoZAvJzwxtvEc/+LfudxVRta3A4qq4LPrRbw=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3444.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39830400003)(136003)(366004)(396003)(376002)(66946007)(8676002)(86362001)(4326008)(8936002)(6506007)(26005)(83380400001)(316002)(478600001)(186003)(38350700002)(6666004)(66556008)(66476007)(16526019)(107886003)(38100700002)(44832011)(5660300002)(36756003)(2616005)(6512007)(1076003)(956004)(2906002)(6916009)(6486002)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?F+kke3JN66emAPr2DBMliWo+cKd/YnO3mTgjSTyoadxzNtLfl0bn44kWCXMk?=
 =?us-ascii?Q?EPt07JbtzbqqJAO5NH/NoegtVkfm0ihTsy3FrJ0YlB/y9S8WV60gTMl6HLse?=
 =?us-ascii?Q?wYIansJvjGgq36uEGhscm1U/3yidLyLMXNK8PHhhAyfZN0LV1SLdIXuidaOM?=
 =?us-ascii?Q?56lw+E9iT/veQicSLgZ8FYahIk4brwtSoaYpkSI5r6L2XstwDmQ+EOaDsva/?=
 =?us-ascii?Q?z6P8HoyTUYv/6yiNSxPY5IriNZGbyatxwyOmY7+avRbFazH+QAm9Q4HCkCDj?=
 =?us-ascii?Q?yDGjB6fx13P9VWXNpf/gBVY1OM/obO56dXGoSmgSoiLXEhoKQ/RE0QymCMVT?=
 =?us-ascii?Q?aqJWRVjfLBlw0JPlu/TH9lZLHMw3AiUEzsyd8kOXiCDUqA3ZJQuvKN3gO69a?=
 =?us-ascii?Q?vqcjqvr7nwzchto9/xqxuaelzEL+QBE3+yJ8rlZG10wyCf46Jykw1fLaOnfX?=
 =?us-ascii?Q?8NzR/c3DRmWRspX61jERe9zQbHrjuIvJbFycho+SpyH1HsPlGNngTXlbAlE6?=
 =?us-ascii?Q?WLnhjkqEIvotY8S8hR8Mg/FdNBT+SFaEIjUJehXTLSOlKpnci9Mo3NyvfPd2?=
 =?us-ascii?Q?3HGSas0BquaZzWjYHoxNExWZulOqtdQZFp+6KosL+dr65ejH9x4pNVZKVDR8?=
 =?us-ascii?Q?UtwsSRjVQEIEmXbbwGRlY6xF3eWDhdwkU779aq7mGbPI8+4tH1F4rtSgtiFb?=
 =?us-ascii?Q?FJK8u1uDLEVUnjeD0Ile+D1Kbpcgd2YnXQbzABjAtdZtvd3f1ofI8RLZ0TUx?=
 =?us-ascii?Q?6BnemYZOaH3r5W4acFYIDL1LYeiLJFxDTiDwwJL4GjyTf5TaSYqOVNlIQZA+?=
 =?us-ascii?Q?M3qUNvgFw7pLDB4jDEepkkyyJpip3pLhbpPwViYAKhI+LYDfW3jb5bSjQnTa?=
 =?us-ascii?Q?++IzZUHfDRihxxRaK0iTCnJI/qOTsXX5+rXE06761RnfeuE3QnMyXzQxLcrY?=
 =?us-ascii?Q?j6DC3B8tjKNX3bSnsow+emurrzM06Im1H57uxKfIkq6u/hgK+aegPxFpr4KA?=
 =?us-ascii?Q?HQSOGl8gs6FZ57IyckcQUWqKp8YKJsbrqQv6e8uXHMOiQVPkT7M0wk0a9X7w?=
 =?us-ascii?Q?9/NzWvmsK8Gz32F9o2LYP88+DopVkamcKfyWNn5WxcY6VvhuNN7uXsbprTo7?=
 =?us-ascii?Q?FPbzVOvn8lGkpJmw1hRkdFeoffum3uxq1PcIdgFOvFGsPSZ3qvDAWKHhAroi?=
 =?us-ascii?Q?ycXM7AE35D1oiOeSGtq0iRdn4OpSpLZVWuki/UXAS2zgkcFk1Z9M5i3pPxNH?=
 =?us-ascii?Q?EhX/fgz7hdnHx3NB9MRe3hx29DJxzP1+Fxy5PBFVItnPAV4GE0naYyzz3FSY?=
 =?us-ascii?Q?ug1MVq3H31/4zQ1VQypfaCYN?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7505
X-CodeTwo-MessageID: a513db6f-c898-4841-9322-6a5b51431ecc.20210424111537@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 8dea6886-774c-458e-97b3-08d9071248be
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWD7bvpcrefA/AGCq+Ikn0V+K+MCRvxVTV2AaE+S3vqSEooWfNCKfnxYiA+CkrphXicC26sV8dNDLOucANTMsF2ejAdHD2dQO2fwvxRdDJdWl+3Xcd0o+NDrzyFRmJuhYk6or4I17NIafmnWy7VzYjbCZGQqBYKGpdwaV1kfpOu44PqvYXt18eFph2xMGtu2siyW6SKaH7j/qXE72rdRjfS769ClSqPqh1qHYxM2CMjvOSOnMZlmbPoqV18jMb8uVq++UkYPxMxIwf7XxjbX7YlylbrWSshEPwhpQrjA68QGZVDZ40BI+D43I+pjwI5ynmbUacpF9GQCsrqco8/PPI9rqVc0iiS+9OUGKd8ub2QUF+2NxrYj2npGtsd526dn2G949lYko2YISF/NZ/3lcXS9kyFvlK/m4PY4nPQKuogzAVRaaWu8a3vm0V2nzb8PCMVHlhD/xTQlaoMjIBUYRR5CUy/humtGZNXRsw6Qr0F4OKR4cCWich2U0LOJGuPLgQNmx4zri3LpTYbTXbI3A1ex6Nm+qFCqcDGTdFdtlb3tqkWBdTvNdZQLaQFHNYFgXca++iX1jUiUF4KvfCSBHYcPStGb0X8RUYq5I8dBKvJsMfXX9hHmpPpblMECTK7/icWd6D05dIHs5ZhrRfBQxssgsjyBdm1pDGBysoeSPnJw57RHE/ypR66SGa1YhBHvtwJQrUcUD1nPkVUqI9X8dnFtYsxi8ZSkVsRqS64bJ5M=
X-Forefront-Antispam-Report: CIP:13.81.10.179;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:westeu13-emailsignatures-cloud.codetwo.com;PTR:westeu13-emailsignatures-cloud.codetwo.com;CAT:NONE;SFS:(396003)(376002)(136003)(346002)(39830400003)(36840700001)(46966006)(86362001)(4326008)(82310400003)(16526019)(956004)(15974865002)(8676002)(186003)(2616005)(1076003)(336012)(316002)(26005)(6666004)(36860700001)(6506007)(5660300002)(6486002)(83380400001)(7596003)(7636003)(478600001)(36756003)(70586007)(44832011)(356005)(6512007)(2906002)(47076005)(107886003)(8936002)(6916009)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2021 11:15:37.9801
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b763a48c-2327-434e-b8f2-08d9071249f3
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;Ip=[13.81.10.179];Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-AuthSource: HE1EUR01FT015.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6171
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The function imx274_load_default no longer serves a purpose as it
does not configure the values since
commit=C2=A0ad97bc37426c1eec1464 ("media: i2c: imx274: Add IMX274
power on and off sequence')

All the values set in this function match the default value set when
registering the controls, except for exposure. The default value
of this is set to the minimal value for this field. The result of this=C2=
=A0
is that the output video is black when exposure is not explicitly=C2=A0
set by the user. By setting the default value when registering=C2=A0
the control to the same value originally used in the function,=C2=A0
this issue is avoided.

Signed-off-by: Bob Veringa <bob.veringa@topic.nl>
Acked-by: Mike Looijmans <mike.looijmans@topic.nl>
---
 drivers/media/i2c/imx274.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
index 942407ed931b..9dc0bcb1e0df 100644
--- a/drivers/media/i2c/imx274.c
+++ b/drivers/media/i2c/imx274.c
@@ -1455,23 +1455,6 @@ static int imx274_s_frame_interval(struct v4l2_subde=
v *sd,
 	return ret;
 }
=20
-/**
- * imx274_load_default - load default control values
- * @priv: Pointer to device structure
- *
- * Return: 0 on success, errors otherwise
- */
-static void imx274_load_default(struct stimx274 *priv)
-{
-	/* load default control values */
-	priv->frame_interval.numerator =3D 1;
-	priv->frame_interval.denominator =3D IMX274_DEF_FRAME_RATE;
-	priv->ctrls.exposure->val =3D 1000000 / IMX274_DEF_FRAME_RATE;
-	priv->ctrls.gain->val =3D IMX274_DEF_GAIN;
-	priv->ctrls.vflip->val =3D 0;
-	priv->ctrls.test_pattern->val =3D TEST_PATTERN_DISABLED;
-}
-
 /**
  * imx274_s_stream - It is used to start/stop the streaming.
  * @sd: V4L2 Sub device
@@ -2094,7 +2077,7 @@ static int imx274_probe(struct i2c_client *client)
 	imx274->ctrls.test_pattern =3D v4l2_ctrl_new_std_menu_items(
 		&imx274->ctrls.handler, &imx274_ctrl_ops,
 		V4L2_CID_TEST_PATTERN,
-		ARRAY_SIZE(tp_qmenu) - 1, 0, 0, tp_qmenu);
+		ARRAY_SIZE(tp_qmenu) - 1, 0, TEST_PATTERN_DISABLED, tp_qmenu);
=20
 	imx274->ctrls.gain =3D v4l2_ctrl_new_std(
 		&imx274->ctrls.handler,
@@ -2108,7 +2091,7 @@ static int imx274_probe(struct i2c_client *client)
 		&imx274_ctrl_ops,
 		V4L2_CID_EXPOSURE, IMX274_MIN_EXPOSURE_TIME,
 		1000000 / IMX274_DEF_FRAME_RATE, 1,
-		IMX274_MIN_EXPOSURE_TIME);
+		1000000 / IMX274_DEF_FRAME_RATE);
=20
 	imx274->ctrls.vflip =3D v4l2_ctrl_new_std(
 		&imx274->ctrls.handler,
@@ -2121,9 +2104,6 @@ static int imx274_probe(struct i2c_client *client)
 		goto err_ctrls;
 	}
=20
-	/* load default control values */
-	imx274_load_default(imx274);
-
 	/* register subdevice */
 	ret =3D v4l2_async_register_subdev(sd);
 	if (ret < 0) {
--=20
2.17.1


Met vriendelijke groet / kind regards,=0A=
=0A=
Bob Veringa=0A=
=0A=
=0A=
TOPIC Embedded Systems B.V.=0A=
Materiaalweg 4, 5681 RJ Best=0A=
The Netherlands=0A=
=0A=
T: +31 (0) 499 33 69 79=0A=
E: bob.Veringa@topic.nl=0A=
W: www.topic.nl=0A=
=0A=
Please consider the environment before printing this e-mail=0A=
