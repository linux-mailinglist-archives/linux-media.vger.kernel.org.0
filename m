Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0337967EFA3
	for <lists+linux-media@lfdr.de>; Fri, 27 Jan 2023 21:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbjA0Uig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Jan 2023 15:38:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjA0Uif (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Jan 2023 15:38:35 -0500
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on2040.outbound.protection.outlook.com [40.107.13.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB39486AF
        for <linux-media@vger.kernel.org>; Fri, 27 Jan 2023 12:38:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/oa90jnmLO+uCLJwpaxT28PRJFsd1G/MP9hCfyy++6ZfX/YhPqySq98UiLoJW4g8+DjIFKnO6TmW2d+tuM3c2PQARcFUp0hxg7Saa4smubAmVZZqe738dB5vVEMKIN0tn1hkiPf8ZXiDTbtDOEWOe12TowTcecrKzeOh/5/GoLke+pYisbikNvHQmhTdSkikJN3j+egZ8wmhb7m7yPeTSi0xU3D0p+TQHMoOLhLbktLee36fHE2Vpc2ihz8bmD3n/XVqZfnwWd/mBdGm6ZUBh19X1EVsUK+/1DKsg0iKWfNuwFCwNxtFF7MxkwRIuSFURxPqguUvtVCiILLJziSqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5p3xuKoLYuzpldDiM20Vgixr073/x2l3NVvuZ9tyyPk=;
 b=TezYZTeKJ0G1LdcspNRCnayYm4LRGIm6+BbzUVcNIK2K640IR1PJnp4IJN1b0fBaK5vJeUpaxlIvs3khV6/AO1vEYalvOSxb6kq1IdEsZ89lTNuh1WA+4qG/Ak6ALWW7BaPAO9ieFjH8GVc0YnzMCZakrowJaDXhBLN14o4B21A+NK1SUmCYELprU9xQeV5usmKmq38WKP4519gMYWQBXyg6rH9nMFrkliyoXmYxGHciLqaeaXdimVirKeTS5DHTVTvEyDPJW+TMFWNF2O7JBBxFwtZ2X+yHSgYho6xqPGLIMSXL33FsSs1qooyxfyONQVHE+GoxrpyyAe5Dnw4n0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5p3xuKoLYuzpldDiM20Vgixr073/x2l3NVvuZ9tyyPk=;
 b=iHpgdRT3Gh1wS6gHuzZE5M2CHzMPlRxi+9nsyfIoGA1UbWsx8r2x/Fe3qvHWfpXyQuDjbcaIf0ZmdxsP3ItJ7uSw9AUT5OurWtG1lhQOI2SaqlYydNo1Aeb5/acE4BUwvcLIAtTEA7P+SLdZDpmMzGuYKSZQiuNO0sTFYv0fkeQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by PAXPR04MB9090.eurprd04.prod.outlook.com (2603:10a6:102:227::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 20:38:32 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::d71c:fd55:d8cf:4fc0]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::d71c:fd55:d8cf:4fc0%8]) with mapi id 15.20.6043.021; Fri, 27 Jan 2023
 20:38:32 +0000
Message-ID: <00078e43-5a01-74c0-4073-25de48806d5f@nxp.com>
Date:   Fri, 27 Jan 2023 22:38:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [EXT] [PATCH 09/17] media: nxp: imx-jpeg: replace dummy gotos by
 returns
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Cc:     Mirela Rabulea <mirela.rabulea@nxp.com>
References: <20230126150657.367921-1-hverkuil-cisco@xs4all.nl>
 <20230126150657.367921-10-hverkuil-cisco@xs4all.nl>
Content-Language: en-US
From:   Mirela Rabulea <mirela.rabulea@nxp.com>
In-Reply-To: <20230126150657.367921-10-hverkuil-cisco@xs4all.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0036.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::49) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|PAXPR04MB9090:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e02960c-68ba-49b4-5363-08db00a67410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LUB7dq/WPnqsSObii2hCUOzbCIxBoIg3i8jdue2U7Ga6eS8QGoL7gwao1FZHMAEZMADO3zzLHX3f0bpOGlNnmpzuCOqz+1mSO6NmHPnbYgE+i6hWIYQVZG5oA2FBMxKYCWPRuwAk5E6OC8v83PF+L7L9TDe/hcWFzTzNxD4qXc/D5prSNYbzYi9r1Hmaa4kBn5XVKojkInGElqYzEXazTs++32MSIkbfkWEhrx87i6AtEnOT+qLKrhVPiKRG3rNRdFVImv/zwJSzl18PMOCo0tsMWVAGo7tLqLGponi5aQcWgZKwf2DAzR3d5GvpgacuDula8NpOScDfzMMU1QJX3YDKDi9Ky5Ct64bBMvd0zB/7GTNL1XQlrEoEKMS8Y/pYrNXcnQ7DWXD+JKH4ejoyfILLBGkcr87sv2W3UBICBzKM5buum6PL2gth6OPtGc/spP9igtyn1rZHFwiFtA8mZD7R/WLm/a6zryIME0JipIAQ14wIs7ntpQpbgdheL9InM/v7sGFZ95egSo7WhXqFkvK/UNNH8d7COYARhVlzIohyTe65GZm4RvHnjzfW0cle0rNlQKBeQW898Tj/Etu+pYSzTpFInbGUg8GAm86SZYLyuwvgvpseHnHOc6VgLg+BnwWbH7pOiyTQhwSQDVyBGEe/Ju3+X6uGjjC4fcEH7MXn3AH5iE8Wvcv6wGgNzQzNr4ChDjkV7ryzer96jQ324gWDlCaMFGwM2UgJRBqoigr/tVAVPL9t15EWHOokIX7As3nPoaz0kH0tGNW0TERT6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(451199018)(36756003)(478600001)(52116002)(6666004)(316002)(86362001)(6512007)(26005)(4326008)(38100700002)(38350700002)(83380400001)(66476007)(31686004)(186003)(31696002)(53546011)(2616005)(8936002)(44832011)(5660300002)(2906002)(6486002)(8676002)(66946007)(6506007)(41300700001)(66556008)(110136005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0Rsekhpc2ZPS1J3VDUrYkhRK1BDNm9udE9EZXZlSG01OW1NWStRRUY2emNa?=
 =?utf-8?B?MVdockEwQ29LUGVXaVVzRFVhYzczN3JtalNqb0trYUFiaXY2TWVBVW9iL2Jv?=
 =?utf-8?B?bHR3TGJmSkJkRHVoQzFHOFIxSXU0R1RDdE83R3lyNE14Q3M1R3RUN2tLR2dD?=
 =?utf-8?B?YktRTk8wcHRQNFNUNlpqNXloMWVzNnBGcFlTWlBjVE1UbFBXNkZVS2RVQTRN?=
 =?utf-8?B?cTJKMGJFVW4wTFpTQ1VqbjhldGZLOW1oZU5tV3B5ME9mbEFtZVM1ODJITFZY?=
 =?utf-8?B?QUwyeUZSUjZGOXZLbytOU1Z5VVZUemVZbnVXTVhvNWhrdThnWHhoa3oxUTd0?=
 =?utf-8?B?eFFmZ2kxK1lONWJvRFhWOENJZmJJYXZiODhtYWk0eTVMSnFtOUNLYk5vZXdZ?=
 =?utf-8?B?M29OWG1NWnRWNnFoRkpEZG1uUGV0dGQvQnhCdG9QL01Xd3ZQamQ0QzRxR25n?=
 =?utf-8?B?VkViOXZxS1Z6WmtSOFVRQjdScjg4R1FVQVlzNlBVVFhTbTRoaFc2VWF1Qzhy?=
 =?utf-8?B?aHBZL1llcTRlcVNHWDR1ZE9SdHV3YmxZa3RRcjNBV2xZVEtqZURyc25OZXBh?=
 =?utf-8?B?bllicFhOTG5WcGF3QzdscWZMWFI0aW5pVE5SYVZHL1kyWDl5b0xSeDhWUGgr?=
 =?utf-8?B?a3ROQ1l5dFQ4TWNQZ0VQaUtKYittVExMcDR3WVdPbHd6OUVqMGM3SVdMMVp3?=
 =?utf-8?B?ekVxdjQwTHViejNZUTRLSVpuaVdydGhTTGVuRUl1a2RGejg0Z1RvQmkzNTBn?=
 =?utf-8?B?Qi9NM2tBV0YzdzZIejJSeVp3aWNkUEQ2SWZIMmtUMHJHOHdwQ2RTZjNuNDRE?=
 =?utf-8?B?ZDRRU3N5M1NvaUlrVkhIc0xNMGNWUm11Wjc0dWQxZnNJK1d3Ukt2U2l0RjU3?=
 =?utf-8?B?dVpGUEFhejgvcURnVUVPTmVtdy9FZTcrbEJUbXlBTG1kdzllUVZiclZ5dStH?=
 =?utf-8?B?RFNLeVI3eHFGOGFVcW1MZnRGVG5KWmRIK2ZXd3JWRUhaUVJlaEJCdE81ZHI2?=
 =?utf-8?B?VWF6T3h1b2FIWStWam5hNlRzYU1WSGZYaE1GcEtjVHorODZxM2tscmZYWEgz?=
 =?utf-8?B?RHN1TjI0MUEvUmlYYTdaQzhsZDBmWmhsYU1rWUZtbHNJaE8wcGtTRXRSRW1F?=
 =?utf-8?B?NTFyaE9iZk9XS205T1BEYTRxNFdIOW5uZFNSK05sbkVwR0JkVjlIYjNxVmhN?=
 =?utf-8?B?a09DclJFQmdYK0s2Wmc2RHBZazcrUUZBQ2xZNlRjSzVlQWVGeTlMWjFFTVFV?=
 =?utf-8?B?NDQwM2F6WmhWak5hOFNmM0dXVjdadzlRSWpkUVMvNHc5R3Rnbi9CSGU0VTl3?=
 =?utf-8?B?dU1zMU5tUVE0UnNhdEkvN2JRVTFpM2UzY3ExNTZMU0M5dVk1NVJPQmRCeGdp?=
 =?utf-8?B?aGl5WUdXNWlYMlcwc0lzYlN5K3NnSktGQ0RGdlVVbVMwVnJWditVblJWTE80?=
 =?utf-8?B?VjJFSGxvZlk4TStPVDF2S0d4V3Z3elVFNGRjSDVUc2ZpdEtsQmw4NzBoV2M5?=
 =?utf-8?B?Tmo3c3RUTlg0OTlNSlRRVlpHaG9iNlhPM3czOGlwUnVtcitxQ0RXb1RaSUlF?=
 =?utf-8?B?UEw5ekFMNEtSbXdGd0oyaDJCZFdwMEpEUHEzT281NlVlbTl6U2FiUUY5aitU?=
 =?utf-8?B?RXdTZ3lYZmV2eTZFNjFNMjlIbXYrZ1FVYm1LMmNra21ia3Y5TFdsdUJwaEp3?=
 =?utf-8?B?eGphYkZTS2NpZkNIcHlSMk1udWs1dU5OYWE2cEZaQ0gzOHkyYlExZUNzM3NO?=
 =?utf-8?B?bG56N0lPNW1QZGdqU1lRemhibW1HdUFES2k0MS8waSsxTEg5L2RxT2JkV1dC?=
 =?utf-8?B?MkJZRTNXUXZJcTFmV0ErVXk2V1BybndXbzZXZ3o4QnVZV3h3VTUwQkNjTnZz?=
 =?utf-8?B?Y2hkL2dTNmdEN1JOTDI5UjBSaEF1dUpzSVJrMDU0enkvWGx2cTR0UjgyRmN6?=
 =?utf-8?B?NkpSTGFONG5IOHE5K2k2ajVxSUtXM2JlZGRvTVlaaGM2algzcGU0M2UwWWpU?=
 =?utf-8?B?L0dkekxRK3VzOFB5SDhwWDVwVGRhWW9yR2ZzbTNsWE1Ed1M3aFd4czVFMXBa?=
 =?utf-8?B?dWlQWStIRXFydkdBMVhaQkljZDc5ZTZxcXNQYkNXYnVxc3BNMTFjNTNnamw0?=
 =?utf-8?B?V3lBQzUweEZjRWpPbXpYUXBieDk5UnFGT2VEalJqWjdHYWpPZnRIcEtFNDVw?=
 =?utf-8?B?aGc9PQ==?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e02960c-68ba-49b4-5363-08db00a67410
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 20:38:32.0010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 41flOFZHotejWwXq2WBgIQ3mepqL4KlHUNsY7I31rcuF9HtPX3VBPtIan6wKCRALQqemMChtW1rHXm8P/xGt8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9090
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 26.01.2023 17:06, Hans Verkuil wrote:
> 
> The err_irq and err_clk labels just did a 'return ret'. So
> drop these and replace them by just a return.
> 
> This fixes a smatch warning:
> 
> mxc-jpeg.c:2492 mxc_jpeg_probe() warn: missing unwind goto?
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Reviewed-by: Mirela Rabulea <mirela.rabulea@gmail.com>

> Cc: Mirela Rabulea <mirela.rabulea@nxp.com>
> ---
>   .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 19 ++++++-------------
>   1 file changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index 6cd015a35f7c..552d0900cb26 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -2445,7 +2445,7 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>          ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
>          if (ret) {
>                  dev_err(&pdev->dev, "No suitable DMA available.\n");
> -               goto err_irq;
> +               return ret;
>          }
> 
>          jpeg->base_reg = devm_platform_ioremap_resource(pdev, 0);
> @@ -2454,16 +2454,14 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
> 
>          for (slot = 0; slot < MXC_MAX_SLOTS; slot++) {
>                  dec_irq = platform_get_irq(pdev, slot);
> -               if (dec_irq < 0) {
> -                       ret = dec_irq;
> -                       goto err_irq;
> -               }
> +               if (dec_irq < 0)
> +                       return dec_irq;
>                  ret = devm_request_irq(&pdev->dev, dec_irq, mxc_jpeg_dec_irq,
>                                         0, pdev->name, jpeg);
>                  if (ret) {
>                          dev_err(&pdev->dev, "Failed to request irq %d (%d)\n",
>                                  dec_irq, ret);
> -                       goto err_irq;
> +                       return ret;
>                  }
>          }
> 
> @@ -2475,15 +2473,13 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
>          jpeg->clk_ipg = devm_clk_get(dev, "ipg");
>          if (IS_ERR(jpeg->clk_ipg)) {
>                  dev_err(dev, "failed to get clock: ipg\n");
> -               ret = PTR_ERR(jpeg->clk_ipg);
> -               goto err_clk;
> +               return PTR_ERR(jpeg->clk_ipg);
>          }
> 
>          jpeg->clk_per = devm_clk_get(dev, "per");
>          if (IS_ERR(jpeg->clk_per)) {
>                  dev_err(dev, "failed to get clock: per\n");
> -               ret = PTR_ERR(jpeg->clk_per);
> -               goto err_clk;
> +               return PTR_ERR(jpeg->clk_per);
>          }
> 
>          ret = mxc_jpeg_attach_pm_domains(jpeg);
> @@ -2569,9 +2565,6 @@ static int mxc_jpeg_probe(struct platform_device *pdev)
> 
>   err_register:
>          mxc_jpeg_detach_pm_domains(jpeg);
> -
> -err_irq:
> -err_clk:
>          return ret;
>   }
> 
> --
> 2.39.0
> 
