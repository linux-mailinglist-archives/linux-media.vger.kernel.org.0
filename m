Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39754704CED
	for <lists+linux-media@lfdr.de>; Tue, 16 May 2023 13:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbjEPLte (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 May 2023 07:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232958AbjEPLtV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 May 2023 07:49:21 -0400
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01hn2247.outbound.protection.outlook.com [52.100.0.247])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A9666A69
        for <linux-media@vger.kernel.org>; Tue, 16 May 2023 04:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iz79W2XX3zjeQ3gl44SuXU3MGIeGvMTHDcXi0WgamZXpkD8RUrMekMr6h8RCBjKQT5QCvhiz2+HjXAe9PmRwZz6WfpKdSlbKt9xr0d3NzqgKJkw+EfhE3YHt4vBxQl8GKBZvLKHD7cuok1ZY/WjUM50bXcxKFeHXkX9q4v6ERu86/tCnsO9N+BcI/Rph8ZZ7DsN2GckC9O6tMcZrmFMxGrvNPCplZOJelMTRzDdjI3ATAZfHe/O4C/i3EKwLrDDAYLgfxmLu0jOorVweo1dwjBnTnGd0TPie4rKETWVAag0c5l6ECr7JEMgLIJ53m7K4X8hnIWYEWGgLnpyeJSbUDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAR4+PTZw0iHbyJ05crs7VdVV7Ihh5x2+8bOisRIy74=;
 b=YGc0HKXxzhQ1RkJag0uvZYxiR4hND14cryrcGOL4gT/1cBpyaPVMksZjdyPShH01HnN3B71Jeah7Iti4sLXj2MYEkQ0I2hXj7c1GyG18TQ8Ux0/AL88+8+Smcg3YnygxkqMmZdgDTqQDxiyIzrnNu4EzST7u9Xo547DftDft9FXd//S9tBkR8zGoRuK7yx5IysG43SK+RWUTlf+IfbSZt4X43SViEOq2o9Rn0ktHeakBIkhFufeqyd8ATA96840ONPycIqnpATbfwNXSNpfmDeRI/rz/zKXHx3avwG1kiIBIkThU1Zb3O8HExRpAO7csSgkObj+I6EodzzJ486SKfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAR4+PTZw0iHbyJ05crs7VdVV7Ihh5x2+8bOisRIy74=;
 b=Nk6tY/LGxBN91KvNy5S2XVJgEcFEYxvVKwLooYmhYp2BSNtyvXG9SZYOr8yl4BxsGmWdpF3hFGDKA1RUAa0mU4wk4bYHcMcxlBfkDGhGQH/mN/6WMppdT4M1PQFiST9VEhGR0ZchKzx4Jc4y/90AOs2+ubwMPUCAVl+/URx4AFDSxKB66EyUfq3Fo4aRf0fegX28oYYz/J5uNQDfhm8NT7YzXYo7IPMZzIo+Fw3gdOteP1Gw570K3aGq239dZVUNWbWJLM7/kjtO8tNUwYIS2jStOQNhkSAHoX+pGijVICH7TGs5TyvHCqJY5+uo47ChHhN4YrO7kvHc1RGW6I5KzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SG2PR03MB5085.apcprd03.prod.outlook.com (2603:1096:4:ae::22) by
 PSAPR03MB6348.apcprd03.prod.outlook.com (2603:1096:301:ac::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6387.32; Tue, 16 May 2023 11:47:38 +0000
Received: from SG2PR03MB5085.apcprd03.prod.outlook.com
 ([fe80::51f9:1127:6ce:5837]) by SG2PR03MB5085.apcprd03.prod.outlook.com
 ([fe80::51f9:1127:6ce:5837%6]) with mapi id 15.20.6387.030; Tue, 16 May 2023
 11:47:37 +0000
Message-ID: <32954093-cf5d-8802-eb1b-3458596a24ea@amlogic.com>
Date:   Tue, 16 May 2023 19:47:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] media: rc: meson-ir: support MMIO regmaps to access
 registers
To:     Dan Carpenter <dan.carpenter@linaro.org>,
        oe-kbuild@lists.linux.dev,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sean Young <sean@mess.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     lkp@intel.com, oe-kbuild-all@lists.linux.dev,
        linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
        Qianggui.Song@amlogic.com, Yonghui.Yu@amlogic.com,
        kelvin.zhang@amlogic.com
References: <95860d11-8317-4082-a1b8-a1fdaba9f6aa@kili.mountain>
From:   Zelong Dong <Zelong.Dong@amlogic.com>
In-Reply-To: <95860d11-8317-4082-a1b8-a1fdaba9f6aa@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21)
 To SG2PR03MB5085.apcprd03.prod.outlook.com (2603:1096:4:ae::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR03MB5085:EE_|PSAPR03MB6348:EE_
X-MS-Office365-Filtering-Correlation-Id: 5099604e-b534-4759-93d3-08db560357fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0ZrL1Z5Z1pRTmUycFVjL2V1bTVhU29RR01wTDB1R3ErZUVWL2VBTFVzNGRL?=
 =?utf-8?B?TFM0T3UrU0lvTy9YRmtMYkRMNHRwL2NkTktReWNyM1hWd2xRVElnOHhIZFJl?=
 =?utf-8?B?YjZwbnFiSm44TVozc3F6RU5kUlpvQkJJcWpucEVKUFJKd0hQRzJvOGJHalB3?=
 =?utf-8?B?WG5YZEtqV2JnS3JFazR4QVZLVjlFT0c4Ly9sdW5VTElubXozeEMvcmdkczdo?=
 =?utf-8?B?MVpUUjdCNE1TSmRuZk93RWcvTG9xWVk1ekFpWTlaWXA0d3IvcjVrRTVsbmZY?=
 =?utf-8?B?UjcyL0NwcXh6aWk1NnBJaHFmU0l0VDMvVFo0dVVTbmZtZlVxMWlFalk3d3Z6?=
 =?utf-8?B?RVFqUTE1VE9ZSlF6MFVvZ0hMSit3Qk1OeU9QZ1RGa3R2L0R6Sm9sYkcrRHZu?=
 =?utf-8?B?R25SbnQ5bS90dUlYOTh6dUVuOVd1cmw0T2hDZUhvMXk4TVBpenI2N3FRa2I3?=
 =?utf-8?B?cGlhOE94YklGUGx3cXdwRS9zYTJ1R2lLdW1iMDhQenZzc0hqLzUwNXVCQ25z?=
 =?utf-8?B?UCtBSTFHeCtwMkZ6QzhtRlVnV0xnSWxkVEVlWDBxNlZUWEpybFNKR21TU3ls?=
 =?utf-8?B?QWZobUdVTG5idWR5TlNCVmRydHBwV3BieUpmWHNzMlpNY2hBcEhRaHpwQ0Z2?=
 =?utf-8?B?K1FaNHM3cG8zc0dvUWxEKytUaVdzVFZCd09PRmlvU09QNHJUd3dmOGZpYkt3?=
 =?utf-8?B?QjUwSC9udkRYRis1SGRvRUtmTzVqakZBL1IvWGhVOU5RWDhtWjJWMUlGVE56?=
 =?utf-8?B?SkQ5c1ZyanpRRlR4elpjZEYyakZuOXYraXdLZ3NwTVVxcmx0dFlDMkVOOFk5?=
 =?utf-8?B?aVdKZldqMndlbWRQNzlHSWNmNmRmcytoSVNhMTdsUmQvNGw4QmR1Y1ZSak4y?=
 =?utf-8?B?UlpXUHg4MmpLTXF0V3NkTjc0RHlvWHc3bG9JNGJ2eTFMOGF6TG00NmgvVUpw?=
 =?utf-8?B?RjhDSmJ6U1BZcVdBUG9FbC9TMnpVaXpzdU13L2pQYU10MWxXTFdSK250aW1x?=
 =?utf-8?B?T3hwQU9tMVpsOWdXM0dYZDVLZE9MYlQrV0lnWHljQlpsQzJubnhpNlFtWFlR?=
 =?utf-8?B?OEhSTE92aUZleTIwbWc4WWo0TEFPNlI4anJlM2h1Rjkxd1hNdXo4LzY0b0c3?=
 =?utf-8?B?Y0FHY0ppemhObnhUNmRxeEsveS9sTVdXcndVd0R0eHhVM2F6aWFqajNhdU5D?=
 =?utf-8?B?QnE1NThLQzhyV1Eya2tiU3ZtMGpQTktYc3I0ZUJsRUdEMFpQdmRIc1ZmcEJX?=
 =?utf-8?B?d25WWHBKYXBxZThTYi8zbzFGblc1M0VwWVE4ZmpwWFZnKytFdUpDeHYxcSs2?=
 =?utf-8?B?ekJQYXBVSmxlN1J1WXRZK1FCa1B4eUNXcytUR0g0U1JXOTM4U2x6MEg3emtz?=
 =?utf-8?B?dkNPMUZua0FETE1mRkp3QmdCOThCSkpPZkVoU2E5Nkd3aTRsc2RUenVudHoy?=
 =?utf-8?B?VS9zQVRZbGI5SEtCOFFIYVM5RUVyQjhYSHBrNlFPbzYyckRZU2tCRGQyN0N6?=
 =?utf-8?B?SzQxMlV0WFZ2NlB0eG5hTnBtUkJzZXdwQ0ZuNmgxNGlxRDNQWEM0MGcveFhL?=
 =?utf-8?B?ZXh6NDdGYUNNUC9FdnFLVGI3cmJkM1FMRkpldG16YkhJdmVOM2tvMW9UWU5Y?=
 =?utf-8?B?b3Q2MlFsUmwveTVqSi9HZWRMSHVKTU5QbjNBb25mYldUUjI2VHhMb1UrZ09G?=
 =?utf-8?B?Wml4NlFOemdXd1ZKZ1VNaTFFYjBVL2ZtR1NGdWdpYndlQ2hJKzlNenBKWDZ0?=
 =?utf-8?Q?1CDEzldTQVsLxQ3O4k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:SG2PR03MB5085.apcprd03.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230028)(4636009)(346002)(366004)(136003)(376002)(39850400004)(396003)(451199021)(66556008)(66476007)(66946007)(107886003)(966005)(38100700002)(26005)(6486002)(6666004)(6512007)(2616005)(83380400001)(86362001)(31696002)(6506007)(186003)(110136005)(31686004)(7416002)(8936002)(8676002)(5660300002)(4001150100001)(41300700001)(478600001)(36756003)(2906002)(316002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHhMblpmY0tQRkxoTVhEZkFUbUR0SERBSkhla1pueExBdVVOQW5ITkN4YVdV?=
 =?utf-8?B?TlNrUmpKVDc4MGwzQ2xzUC82eDlGRm5NNmcwUW9PZkZreVRDSVpyZkpBVVJJ?=
 =?utf-8?B?ZUl2c1JkY3FvV0kwdGhWU1ZkOTdtSVAyVVp3d3lVZTJiOVRTWU1tWW42cDlv?=
 =?utf-8?B?NTRiNkpteWZhaUxwSnY3d3dtYnJINVNsZzFtQW5FNmsxdG84YjQ0amg1SHd5?=
 =?utf-8?B?UHNmMWlqVXBoYXRTODF1MWp1NlllNUorOEw0MzJJcEhkZXJxK3RxVCttVFVa?=
 =?utf-8?B?YmZIczlhVHN0YnYrTTBKN0F5d0g4OGt5MjU2ekxNd0xMSUtGbU03RGhTMVk2?=
 =?utf-8?B?ZkVTcitVUE1BbkRDQW5adUhSaHRIZHU5MjRiUUpqeThwaTdNMzgwc2FLVzRC?=
 =?utf-8?B?WFljOGJDNGNuVERJVVd6MmJMSm02SzNQT2pLWU03VjJHT3IwV0tIc2VpTW05?=
 =?utf-8?B?K1pKY2VVbk9hUWxka2d0SlJvRWpTQjdpbXpUV2c4dUxGR281OHVKYWVUc0tL?=
 =?utf-8?B?Q2ptdDN4RFErUWt6YWM4NXh2MlI4c0hZY3RQelRyM1pVT2lKazlYdk5IaXY0?=
 =?utf-8?B?VmxrRm5FSU56QjFScmRFcGxiSHRaYmh0NzRoMXJHOTludmpXYW8vN2NobGE5?=
 =?utf-8?B?K2V0SUIrMTF0dHBKQjNnYkRPS0hOMUl6UWlOSGNNNk1wN08zdlBhaDFTbGpJ?=
 =?utf-8?B?SHFUK0x5NVBUeWVFMzZpVXZDa1RHTGNOVUFpdEw1Wko2clpob2ZsNE5hNlA0?=
 =?utf-8?B?QnRXNVY4WjQrTzZFYkl1L05YQ3dOeTRGOVNtUHVNWnQxZUNhYXVuNEMyOCsw?=
 =?utf-8?B?NTUrWVlpTkEyYWJwbXNNNkpEZ0x2VElZenhMSkpORzVlTnFxRE13a05mTXh4?=
 =?utf-8?B?SDF0bE1xNm4weU9YZ0V0Y0cwajZDTnNzMzgvc3JLSHVqZkRWMG96OFN3SlVk?=
 =?utf-8?B?ZzZqanNuTW54dnJtci9GSTdNa05HVng2ZzJuaDBJQ0ZNeDg4dEJTUlZhenlC?=
 =?utf-8?B?elZxTEZKZURkd0dFa3pIcURFWDVQVERYbVZscU8wam10SDJpVjZZZk5jZjdk?=
 =?utf-8?B?ajM2WmdVWFdVWUx0VnlDM1lMaE15THFUK1cxY2UzaHNYQjlZcUJ4a0JaZXJI?=
 =?utf-8?B?eGJBQXA4cnlKNExiT2VjbEdUc3ZFZzlKOTVvMFlxOVlOZlFsRGJhY0xHL1pw?=
 =?utf-8?B?bjVxWXR1QUZKejN4WVppR0xOVmkxdklnN2hnR1NxQk51b29hUURXYW9kc0tQ?=
 =?utf-8?B?YzJlS09LbzJ5ZTNSN0lFZ2hIbE9rSXNIeU1LTVVvekg5Nkp0QVZid1R0VVlE?=
 =?utf-8?B?WS9aN054cDdreTJlMjNMZHVBQ0xaYWRnQUtBNDgyRkkvU2ZmTlBURkhxR213?=
 =?utf-8?B?cnpxM2x6U1FhMUtIczJmOW1tTjlxUDdyeGl2VjhLOGJxUW9IakpZaVJLQmtD?=
 =?utf-8?B?bWNwUTVMNWd3YUdwdkVIU3FwMG16c09IZFVDRm9xRzlsUjBWUDNKUGRRT3dv?=
 =?utf-8?B?VWJIekNveC90MU41aXlaWldkUWhBNXppSW9EZkd2Si9hRmgxb1dpL0NzWTNP?=
 =?utf-8?B?czJjbm9ZTmU5QjV3UlpLejRjaGpVZ2hleGc0M3NLeExYbjZISEFuR1JxYXFh?=
 =?utf-8?B?MXpSd0JGNk4yM0hoQUdBVXZpaVppNDRBZ3RRNDZxUExTdjhLSW9SbVd5elNI?=
 =?utf-8?B?UGhta3VaRXpVN2VCT0ZHVVE1c3R3RW1xZ09sMEZJaE82cDB0YXA0YlI5T25i?=
 =?utf-8?B?dUNzYkZEMkF4QUxrakdLVVI3c1J6V0dudnVacUt1VzhGMVd0c004ZlZqS25j?=
 =?utf-8?B?T3pUaUVEem9rTjlSRkQyblBjdUpYdEw4S1BZVmFMSmV5QVQ1Q2Z5NE9pNWND?=
 =?utf-8?B?M2tLWXRRSHB6QkpFazU4TzhnaENZcFRlUWhIdElST2h2R1VUQ2JaeWE2ZnRt?=
 =?utf-8?B?dVhpRlV6WVU3SnlJUlVBUXpYdVVXNzFmRFg1ZlB3b2QvU040TmNCUGczbDl4?=
 =?utf-8?B?azRQTFh4VmdSYUFCMWhjd24wMHZDVmJyM29zV2tDVDducTVuMjdwOVRtVFlQ?=
 =?utf-8?B?QklGb2V3U1NwTTZ6RXZBMFUyK3NBTkg1Uzl2MlpNVmcwNFcvNGVCaXVEbjE3?=
 =?utf-8?B?d1I5M3Jid3haZlo0RDRrWmZuTnI2YXI0UWM5T2hTVkRibUJSR21UMWFXOVIy?=
 =?utf-8?B?K3c9PQ==?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5099604e-b534-4759-93d3-08db560357fe
X-MS-Exchange-CrossTenant-AuthSource: SG2PR03MB5085.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 11:47:36.6037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qH+Y+/YeQCkQplfEvxwWJ7kt+TgTXvIyFEGpz+lQXdVKGKj8d3fc59Bp33P1ILrxyB4AXWx4OpBRO1HCSehh7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR03MB6348
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan Carpenter,

Thanks for your review.

Neil suggest to use devm_platform_ioremap_resource(), would it be better 
like this?

	res_start = devm_platform_ioremap_resource(pdev, 0);;
	if (IS_ERR(res_start))
         	return PTR_ERR(res_start);

	ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
                                 	&meson_ir_regmap_config);
	if (IS_ERR(ir->reg))
         	return PTR_ERR(ir->reg);



在 2023/5/12 21:08, Dan Carpenter 写道:
> [????????? dan.carpenter@linaro.org ????????? https://aka.ms/LearnAboutSenderIdentification?????????????]
> 
> [ EXTERNAL EMAIL ]
> 
> Hi zelong,
> 
> kernel test robot noticed the following build warnings:
> 
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/zelong-dong/media-rc-meson-ir-support-MMIO-regmaps-to-access-registers/20230511-114604
> base:   457391b0380335d5e9a5babdec90ac53928b23b4
> patch link:    https://lore.kernel.org/r/20230511034333.26800-1-zelong.dong%40amlogic.com
> patch subject: [PATCH] media: rc: meson-ir: support MMIO regmaps to access registers
> config: parisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230512/202305122010.lGsFA089-lkp@intel.com/config)
> compiler: hppa-linux-gcc (GCC) 12.1.0
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Link: https://lore.kernel.org/r/202305122010.lGsFA089-lkp@intel.com/
> 
> New smatch warnings:
> drivers/media/rc/meson-ir.c:111 meson_ir_probe() warn: passing zero to 'PTR_ERR'
> 
> Old smatch warnings:
> drivers/media/rc/meson-ir.c:113 meson_ir_probe() warn: passing zero to 'PTR_ERR'
> 
> vim +/PTR_ERR +111 drivers/media/rc/meson-ir.c
> 
> 12ddbadf383d55 Beniamino Galvani 2014-11-18   95  static int meson_ir_probe(struct platform_device *pdev)
> 12ddbadf383d55 Beniamino Galvani 2014-11-18   96  {
> 12ddbadf383d55 Beniamino Galvani 2014-11-18   97        struct device *dev = &pdev->dev;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18   98        struct device_node *node = dev->of_node;
> 5a048b4c2c04b7 Zelong Dong       2023-05-11   99        struct resource *res;
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  100        void __iomem *res_start;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  101        const char *map_name;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  102        struct meson_ir *ir;
> 1ffc931c320a8a Heiner Kallweit   2017-04-12  103        int irq, ret;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  104
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  105        ir = devm_kzalloc(dev, sizeof(struct meson_ir), GFP_KERNEL);
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  106        if (!ir)
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  107                return -ENOMEM;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  108
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  109        res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  110        if (IS_ERR_OR_NULL(res)) {
> 5a048b4c2c04b7 Zelong Dong       2023-05-11 @111                dev_err(&pdev->dev, "get mem resource error, %ld\n",
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  112                        PTR_ERR(res));
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  113                return PTR_ERR(res);
> 
> The platform_get_resource() function returns NULL on failure.  It never
> returns error pointers.  This means that return PTR_ERR(res); returns
> 0 (which means success).  Please read my blog for more information.
> https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/
> 
> This should be:
> 
>          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>          if (!res) {
>                  dev_err(&pdev->dev, "get mem resource error\n");
>                  return -EINVAL;
>          }
> 
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  114        }
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  115
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  116        res_start = devm_ioremap_resource(&pdev->dev, res);
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  117        meson_ir_regmap_config.max_register = resource_size(res) - 4;
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  118        ir->reg = devm_regmap_init_mmio(&pdev->dev, res_start,
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  119                                        &meson_ir_regmap_config);
> 9e2e4382ec72d9 Ding Xiang        2019-06-18  120        if (IS_ERR(ir->reg))
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  121                return PTR_ERR(ir->reg);
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  122
> 1ffc931c320a8a Heiner Kallweit   2017-04-12  123        irq = platform_get_irq(pdev, 0);
> 97299a3035328d Stephen Boyd      2019-07-30  124        if (irq < 0)
> 1ffc931c320a8a Heiner Kallweit   2017-04-12  125                return irq;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  126
> 705aa578d408f6 Heiner Kallweit   2017-04-12  127        ir->rc = devm_rc_allocate_device(dev, RC_DRIVER_IR_RAW);
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  128        if (!ir->rc) {
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  129                dev_err(dev, "failed to allocate rc device\n");
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  130                return -ENOMEM;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  131        }
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  132
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  133        ir->rc->priv = ir;
> 518f4b26be1ebf Sean Young        2017-07-01  134        ir->rc->device_name = DRIVER_NAME;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  135        ir->rc->input_phys = DRIVER_NAME "/input0";
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  136        ir->rc->input_id.bustype = BUS_HOST;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  137        map_name = of_get_property(node, "linux,rc-map-name", NULL);
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  138        ir->rc->map_name = map_name ? map_name : RC_MAP_EMPTY;
> 6d741bfed5ed06 Sean Young        2017-08-07  139        ir->rc->allowed_protocols = RC_PROTO_BIT_ALL_IR_DECODER;
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  140        ir->rc->rx_resolution = MESON_RAW_TRATE;
> b358e747aebc4a Sean Young        2018-03-12  141        ir->rc->min_timeout = 1;
> b358e747aebc4a Sean Young        2018-03-12  142        ir->rc->timeout = IR_DEFAULT_TIMEOUT;
> b358e747aebc4a Sean Young        2018-03-12  143        ir->rc->max_timeout = 10 * IR_DEFAULT_TIMEOUT;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  144        ir->rc->driver_name = DRIVER_NAME;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  145
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  146        spin_lock_init(&ir->lock);
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  147        platform_set_drvdata(pdev, ir);
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  148
> 705aa578d408f6 Heiner Kallweit   2017-04-12  149        ret = devm_rc_register_device(dev, ir->rc);
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  150        if (ret) {
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  151                dev_err(dev, "failed to register rc device\n");
> 705aa578d408f6 Heiner Kallweit   2017-04-12  152                return ret;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  153        }
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  154
> 611ee552a538b0 Heiner Kallweit   2017-04-12  155        ret = devm_request_irq(dev, irq, meson_ir_irq, 0, NULL, ir);
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  156        if (ret) {
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  157                dev_err(dev, "failed to request irq\n");
> 705aa578d408f6 Heiner Kallweit   2017-04-12  158                return ret;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  159        }
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  160
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  161        /* Reset the decoder */
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  162        regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET,
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  163                           IR_DEC_REG1_RESET);
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  164        regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_RESET, 0);
> 6edf27ee258925 Neil Armstrong    2016-08-20  165
> 6edf27ee258925 Neil Armstrong    2016-08-20  166        /* Set general operation mode (= raw/software decoding) */
> 6edf27ee258925 Neil Armstrong    2016-08-20  167        if (of_device_is_compatible(node, "amlogic,meson6-ir"))
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  168                regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_MODE,
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  169                                   FIELD_PREP(IR_DEC_REG1_MODE, DEC_MODE_RAW));
> 6edf27ee258925 Neil Armstrong    2016-08-20  170        else
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  171                regmap_update_bits(ir->reg, IR_DEC_REG2, IR_DEC_REG2_MODE,
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  172                                   FIELD_PREP(IR_DEC_REG2_MODE, DEC_MODE_RAW));
> 6edf27ee258925 Neil Armstrong    2016-08-20  173
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  174        /* Set rate */
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  175        regmap_update_bits(ir->reg, IR_DEC_REG0, IR_DEC_REG0_BASE_TIME,
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  176                           FIELD_PREP(IR_DEC_REG0_BASE_TIME,
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  177                                      MESON_RAW_TRATE - 1));
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  178        /* IRQ on rising and falling edges */
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  179        regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_IRQSEL,
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  180                           FIELD_PREP(IR_DEC_REG1_IRQSEL, IRQSEL_RISE_FALL));
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  181        /* Enable the decoder */
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  182        regmap_update_bits(ir->reg, IR_DEC_REG1, IR_DEC_REG1_ENABLE,
> 5a048b4c2c04b7 Zelong Dong       2023-05-11  183                           IR_DEC_REG1_ENABLE);
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  184
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  185        dev_info(dev, "receiver initialized\n");
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  186
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  187        return 0;
> 12ddbadf383d55 Beniamino Galvani 2014-11-18  188  }
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests
> 
