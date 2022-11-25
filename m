Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BC963857B
	for <lists+linux-media@lfdr.de>; Fri, 25 Nov 2022 09:47:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiKYIrN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Nov 2022 03:47:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiKYIrM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Nov 2022 03:47:12 -0500
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2053.outbound.protection.outlook.com [40.107.103.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 988961F628
        for <linux-media@vger.kernel.org>; Fri, 25 Nov 2022 00:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gef+7JGuwrZcNa88ZFMXd/PzzgjpO19JOcaXQFOuvo1tzy1QPrJF/rEmo+tZ8b6YpJUNfgs098wPS82Zo2JfvuvR+I6EZjFI4/d4E5kU6oCmXmtLSZAq/WBVE/AnVjzLELgAd3/pD3VRktMMdmVaGEMkroFPArmQygLPIbCswW1UMmrvE1L1BTS3A2zN7a5b/fK0EbNdoY9zP7W6CToUoNk5pIWmEh1r8riqW/qpNFvtFk3hrqfA8lCXekPPtwmAinGURycIpG6ZW+GWxNfQOrZ3N2+lSKgrz07pEZ6QwdAvfNAxOZBwhklJVY//HpDPUkzI3J2iblVjUchJa4UYkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9WP6jyry6iTs/spNAaw0p0CXhT4fqzF+1Q7xxXPClk=;
 b=CIz859FscS0oYlE/TGSN4cvtMT8oFMwnlFfiO206/VPQECMF92rHUZA0eqPnW4Hq+dDSRUu0I0OfIJxXQ8GbdhtiiblqosOvp5jLrcpg5f/RurEgBy51t/Czt7EAyz/D7n4w7ybnGwNIRRpCgGNSUZ9vjzvgcWoECcInTVG/gRQnpiaKQ66Y50MG/nUpMHXuUJ2ZYuASm/pT51UfKcbFdB6s2pepHld0rx/t6Jk93tKA2mDZyIIaZy4jUzBKXOFnpd8b3BobRVzFku9zh4HGlYjnn75frnTRf5eeS7hmPlfnIonGaJ4xxoguyvohY6TTxTGESQoABeREi5xSrx5/Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k9WP6jyry6iTs/spNAaw0p0CXhT4fqzF+1Q7xxXPClk=;
 b=bDNugl8pQq3lGqf74Llv3ade7PEeoY9EISpFQOfZGWBj3w2XXF/48gwUvDwa1ZntXSswAcy6YIBZUEzswvPiQcIrcQhHFg72tL/82lxNsZcd3rb7I5BCW4dp0+SVgfuUW6wip1HLMq62YFQYyY053230qE9i4TLF86mLHeqzuns=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PR3PR04MB7435.eurprd04.prod.outlook.com (2603:10a6:102:88::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20; Fri, 25 Nov
 2022 08:47:09 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::d355:6f96:866e:b857%3]) with mapi id 15.20.5857.019; Fri, 25 Nov 2022
 08:47:09 +0000
From:   "Guoniu.zhou" <guoniu.zhou@nxp.com>
To:     linux-media@vger.kernel.org
Cc:     slongerbeam@gmail.com, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hugues.fruchet@st.com,
        laurent.pinchart@ideasonboard.com, jacopo@jmondi.org
Subject: [PATCH v2] media: ov5640: set correct default link frequency
Date:   Fri, 25 Nov 2022 16:48:32 +0800
Message-Id: <20221125084832.2857820-1-guoniu.zhou@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0107.apcprd02.prod.outlook.com
 (2603:1096:4:92::23) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|PR3PR04MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: 308b1dd8-fe04-4c3f-606e-08dacec1a333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N2nz/thoVUVEoWv9uiTAhYVbn90yQYFdxZJmSXLhdvZc7a7ma98u2A4+dmo8zIvgAEXQ8wFWX1nOT0iVmQOCWHKizLPN1hp6xZIbaGMd5YJz69Lyh7YMGNyAtg+WGrJZs27xjbQk14Z6QOUDeAmjcj/NewFowViLrNTtW5HCBBOtAMeLn+OUj2GaF5qHE0QUvBV7slnAhBISCgktEgfw4+lBc493gCF7H1S+sr2jJBJar+33TYWglxwW5BiB/ZNcCvS9EoRuc2eKnwWk/pqdQF4ex6wIulR7wXdxiJtgBKiU4g9d3WsQUC/PdZuJ039xBgCH//l44RIj8xl2VDU9LVzjHm4v6ttV+r5e2xdUAjHmxsjbwoHn1CwI9f4h0gDSHYUCEtx2yp1n1aLJVdrsugLdLve7uL4x4xUEYfp/VfFMF1qyAuuEAIMN/LB7L04OfliKnwQNhRugTpC//pL5a9MBGlOS8hqIJjrcWip1P0R5ZMJycDV4smKekUqU2k/lm52GkJwibS4nHEQ6hkl4PXG74yJQRPxTMtA9wd1fTzfHlLidm14pGHPTlAXlN/TiuvzcWM5Te+BdYe+bX5bIpvvaIFt1GRLvOEYyReSbk3M4WdFWcfKcmpvPFXsQfzfAmcDbx0zI5+u01mOVMmZU4ZeRu3+xaPCNO3ffJEnWqwa1u8w84qOs8/QEgFFIL+N/gUqwQqW+AiKEyTztBMi29Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(451199015)(186003)(2906002)(1076003)(5660300002)(6666004)(83380400001)(2616005)(478600001)(8936002)(4744005)(86362001)(6486002)(66476007)(8676002)(66556008)(4326008)(36756003)(66946007)(41300700001)(38350700002)(38100700002)(6512007)(52116002)(26005)(316002)(6916009)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k4NPIwHzHGtU/oJ6xx14Ho7pnEfZd0PvCjOPmOPDzATKRfDWvx6XQpDeveHp?=
 =?us-ascii?Q?z+ZRMBjPOhpNcPZVAkIN8QXGXnD2T7UAXXTSQO9jk1w6hYx1okMlsyoMo77Q?=
 =?us-ascii?Q?+d3RM7EB6upynhS/ney8oDp5HBIWzPeXoLv3wVVFw3kHOVfqPvWuC22DntrY?=
 =?us-ascii?Q?E/FZF/mlSJZF5h/rZB0BIZAj8V2o49S/48yZyWzg6kRiaL8IBn93qxkOkgMz?=
 =?us-ascii?Q?8bIiHAlLif8gYcwCFmnuD7KA9iXaOxGVb2SHDPOOiRgHoj8osDDFpIIz/cce?=
 =?us-ascii?Q?9U6gzvUO96dzcpBIxi1+U3eMcijLm/YekarEgB4b8h4PhcKZGjiUKTuz9eSL?=
 =?us-ascii?Q?RoRNaSb9oXOyGz4he6fLj2f/b8aeSYmHANlHScEo+6kGwhwbPNFhL0+4YOwC?=
 =?us-ascii?Q?sAZx6ZEK8qhli2Anr9a99blSGzndn0fo9/pZdCVG8SmJ/kU78BHjWKallhID?=
 =?us-ascii?Q?miHLnTN3jM0Jp+Etohg4llemY9udqkW1aEgUCJWc0flKGtsFaLZLkh1fjV/y?=
 =?us-ascii?Q?dxpBQg7/m//l2QzahR3uiH8w5iDr0HF+aR9MBZdofNPBlp6XMsyAyE5R2IEj?=
 =?us-ascii?Q?M0UL1tzPrRX8le4hhtNxL78hemN7jBsVxCkt3pMZMsisQdMsETuZ707HgsTj?=
 =?us-ascii?Q?q8usCTu8gYXsqS9fCSpoHM4UbVZOFPuSt5akXhhTOHXomTm65LdgoeuZ/af7?=
 =?us-ascii?Q?nXIcPLMJOFmDdFHCrBe7WTcMnnto+NXGijgZidonkGI84JlAJ/4x9fYVe1dg?=
 =?us-ascii?Q?dvh15Abf0CtnoYsYNTBnWYj8IZKJRWSfq4+sYmfixLyCm59ngNw5802v3o1j?=
 =?us-ascii?Q?m9RNDH7CxkawkbymSkgHKd0IGtvO3au2R4ZV141qApkB3+ETJaR+C5hoLJSR?=
 =?us-ascii?Q?bYCaR4hABsWxDGNvtbf2xFnBwCUONpN9R4slqzWSUeiJH1BNsa2hIccg2cjm?=
 =?us-ascii?Q?0CryKoTyQJseOqafvPXr8h5fKXwjMnc08WojsXfKWYomwLsJzW9mKQVXPNP/?=
 =?us-ascii?Q?vb7Bp7sASb6FkIrzc6esnVFa1V+APaOFNS11Kc3JUNfuKHYmjzmqVwFM8Q/B?=
 =?us-ascii?Q?10CfDO9yevq3ylnQr6o6u3K3V5iX4YMNH6UOay0vqglgPUcA3EgjD5eFEh8F?=
 =?us-ascii?Q?MLaRbAAPkzRZlfcd8liBCDBKMiNTkxOLFBKnk4/Tispk5Hxu90fQSGgpacXe?=
 =?us-ascii?Q?nHsBgjekWh9fDMVnIzoifkh69j7Um0pFi3JkMb99bWOxfi7bAOwAk3EREkpB?=
 =?us-ascii?Q?jDhBxRjRyI8knOIBthbogauUV7IPCNnozPzkf0KWsgMMhOwUwDC10rYVIa0L?=
 =?us-ascii?Q?87YtTWRc4QZiJ6rl2UNsYUJKpwZY6s2yOBV4tVyCXL60OfEbj/O06pogDHvV?=
 =?us-ascii?Q?373gGjPIJL6WMQ3uqEb2fZRW1UVU7d+xrvr3oNCP2YCRybzA6uCBnVGVxumM?=
 =?us-ascii?Q?PMksUf1QM7HrYVNOzJDAIyxjNRMdWo3YtZ1+b1++C5U+qz4H0KNAQBNf82p7?=
 =?us-ascii?Q?Gb5j0usuqbAJa/zGUmlgrXHwgKaknUOPBaKdkhdQUTWmB0ceMbETR4hCuIj2?=
 =?us-ascii?Q?UE7XszHxfjmXik7oTSOYIdpK5qbfMn3GE4rhHduP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 308b1dd8-fe04-4c3f-606e-08dacec1a333
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 08:47:09.1221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ANfkjnGnvyElJ+MmcPED0G7dh4InQ1Nb6c5s0f95Wm+cQ/vA2hjLbORQvXoL3yNkPyHdjeMl2euzT2fvEkJoEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7435
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

current_link_freq field in ov5640_dev structure is link frequency,
not link frequency array index, so correct it.

Fixes: 3c28588f35d3 ("media: ov5640: Update pixel_rate and link_freq")

Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
---
v2:
  - Correct typo issue(s/structrue/structure)
---
 drivers/media/i2c/ov5640.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index 2d740397a5d4..3f6d715efa82 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -3817,7 +3817,8 @@ static int ov5640_probe(struct i2c_client *client)
 	sensor->current_mode =
 		&ov5640_mode_data[OV5640_MODE_VGA_640_480];
 	sensor->last_mode = sensor->current_mode;
-	sensor->current_link_freq = OV5640_DEFAULT_LINK_FREQ;
+	sensor->current_link_freq =
+		ov5640_csi2_link_freqs[OV5640_DEFAULT_LINK_FREQ];
 
 	sensor->ae_target = 52;
 
-- 
2.37.1

