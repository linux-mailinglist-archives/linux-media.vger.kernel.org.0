Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B01206C9B8E
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 08:56:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjC0G4L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 02:56:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbjC0G4K (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 02:56:10 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2089.outbound.protection.outlook.com [40.107.247.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0089949E5
        for <linux-media@vger.kernel.org>; Sun, 26 Mar 2023 23:56:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPeRQRSKYhzeDr4R3xKHS6V8zXwFE9kC/5u4dKGeKthJAlcIcZ9IM4eN4whu1c/GZroxgPaIV7m3br8mU8YOhZChXqUz+hKpg1rHhC5o4ylRXuZitYm/vMETHw7+YIp0/OKj1ilHlt1MN/U9v0lSVqjdj0MoOrncMYFGedPmictfvLBwQZ9spdXWU8k6ieGvxceqTW1D6iKGYk9pejiu1UtJz5WgYoPGqqBekNR7CgPspKLIM2YWTV0Ywsk5cO1FjLOSJMtSA/FSiu/NatJ5ZdHP8UIN3D2TwLxQU5ZP6y0wKmoTlDQHGsoEPz6feSRglAJJobyv5TDr0zQYgFxj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=egSgpOd9C1yy7B6e8T7dWl7ZQp5S/sh24TLMeFiyn7E=;
 b=GiJROwCPXcCYe0hm/DULDAyp+TFJyB0NGzVDHftLUGZzg9LoIQVX9yFfHIP9Zns7WRCB7tVDCk2LgceoHBS09EsVgSxvcL/Ud48pu5Kd765V0MVhe9ZP4Q0jC0IjUfmwsZoMcNCeeR2zsWDgEq5Gn6IJEzh1aYxTyRyo9H1kSNt+OV/XwjxigdyYH5K8VBuPyrkGesLckRfl2tU9F1WbvKNgHEznvyd5gHKqUEe31GSDKxUhhsd1ZluKdgPCeq91Grke2LgvUwmcu0Ku3H0TE9XBDcswPxl25JXNcwFfgOCexT6iao+UalOlpQOPccoYIKF22JNkx8iYGjOYPQB3UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=egSgpOd9C1yy7B6e8T7dWl7ZQp5S/sh24TLMeFiyn7E=;
 b=hGW3Ige8v27LRmSmhAYXsNbc77MYwFI4zhJ1vDnIBO60bAxWNtQ8uCPdhKxQz83DQf7Lp1XQ2jviWumNQesH+jZbsZblBu2oYjx12n7fZXI91xiWkGxB+nqrm9h/uIAJUOHlG6ddhVcKCS8GhlF5YFVpceQI2iEfJujUZmAPfJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com (2603:10a6:102:21e::22)
 by DB9PR04MB9580.eurprd04.prod.outlook.com (2603:10a6:10:307::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 06:56:04 +0000
Received: from PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::df0f:dc11:af95:c6e2]) by PAXPR04MB8703.eurprd04.prod.outlook.com
 ([fe80::df0f:dc11:af95:c6e2%7]) with mapi id 15.20.6222.029; Mon, 27 Mar 2023
 06:56:04 +0000
Message-ID: <c008500d-ce28-9975-0281-b4cdbc8a6485@oss.nxp.com>
Date:   Mon, 27 Mar 2023 08:56:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 036/117] media: dw100: Convert to platform remove callback
 returning void
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-media@vger.kernel.org, kernel@pengutronix.de
References: <20230326143224.572654-1-u.kleine-koenig@pengutronix.de>
 <20230326143224.572654-39-u.kleine-koenig@pengutronix.de>
Content-Language: en-US
From:   "Xavier Roumegue (OSS)" <xavier.roumegue@oss.nxp.com>
In-Reply-To: <20230326143224.572654-39-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4PR09CA0006.eurprd09.prod.outlook.com
 (2603:10a6:20b:5e0::16) To PAXPR04MB8703.eurprd04.prod.outlook.com
 (2603:10a6:102:21e::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8703:EE_|DB9PR04MB9580:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d37600-04d3-4c36-9327-08db2e9054c6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 61RXxP95ms8EaAgCKB/kiWvoPfZXA8qa8sfch2artyNKbyRmpldAj5kwW3905umbS+620pQFF4A61P6HGcFI82RkwWq751wmnrCsDmHxprRWuNlHDo4LDNaHE1GVBVs30sk7Yln6vRVliaUPImOfn2SA6AtFR4KLaB4KXeqVrvmPdOA8wW5N5AdRxEBT2JeR9uq9jEEJ0rR5ag3Ap0RsLO3HCUEJ/b1MWs1X32KD6U9xQXMOE4VnpNC00YTala9tbECr7exxnpzMu2dtE7lcSeJN+nM112zyZTXjXvIzpkqh2v39/khKm7UcVERw1wQlSoCDoc/7t/LaGD8unTs0B9DglTzOb2mlEZHWmC6wgdfQrBHt7vWZi/rh1DpO49fh1wrXXBgWtDfXl+cyJtEbCHACKFiYfYx3vm6kWDHR9bBjzzxMNFZ9xZi3Mg8LoIxY3oMAMQB9N0RWWjOaofX+L1F3hW3OZXSwpVJS3V1+tZidZfAoilnDJ6jUNEp4fRTfdfa9vn1nnh8cEV1OOO5UmL6FGjJDDfIwdr8kj+JbAXK9IJqieNW9JQwdudCBzhqz1BBDT6dvBRQ4vS6GKXWPTotJSKSgZ0KDDwS1JmoXngEEohsChQV1SUIzwChlL8253dkmfzqmah037J2wO6R+wcgZ6w26P3wcJft08RHj6W66DX5b26z9uzqeRLxg4jql
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8703.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(66946007)(66556008)(66476007)(8676002)(4326008)(110136005)(316002)(8936002)(41300700001)(38100700002)(38350700002)(5660300002)(186003)(53546011)(6512007)(6506007)(2616005)(66574015)(52116002)(6486002)(6666004)(83380400001)(26005)(478600001)(31696002)(86362001)(2906002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjJ1VDk0dDgxWko4cUZLc2p5bUJ6WXV6bVFiYWlRYzhFblJjMjQzTElNVFUv?=
 =?utf-8?B?UnRwaTZFalVVQVRoS0xEOUZFOVJZOFZnbVloSVBLaElIa0trVlFSazdZUmYv?=
 =?utf-8?B?dUl0SVI2WnNvbGNkWXpheGJUV3dqdnRZN2luWCtCN0lQY3J3RXVSSTduYW9Y?=
 =?utf-8?B?NHV1S0x2TWhJMnZkMk1yTTh2bVNPNmJyU1puSWV6aG1zWXFubEZ5dTk0RjQz?=
 =?utf-8?B?QTNnckF6aXBjYVozOWRKWTYzalpCcU9FK0MxZDlpSnU3bzliTkJDQWpoZW1X?=
 =?utf-8?B?TnlzOG9yMkJVQTY0MW5GbzBnVUxsWVpjSU5Gb1BzRVRvY0FyQ2hNRjRQUkQ3?=
 =?utf-8?B?a25HVTdnUEZwUTJJRHlSVHNXeGZSa1huUlNieUFseGVGbTVtZThLa09oVnNk?=
 =?utf-8?B?TGlnSTdKRXdERjVFYXYrYTkyT2cvdGczN0RZQUtJYmZBWGEyam9lbkp3b1Q0?=
 =?utf-8?B?QzhlSjZ5Q3BIaUx4UWFnbnFXK29la1loam9FRHl4NFluK0RTTW9BQzZpZzQ2?=
 =?utf-8?B?ZVNjN0paOEo2L1owWHA4a2EzNFR0eis5eDBxcUNHUHVtSHJBTCtDN0IyeVRO?=
 =?utf-8?B?N2ZBRGNUK2tTVUJQNUxaamwrT3cvTjIvZTYxVVNnZkU4bGd0Y2tqVU82SFpB?=
 =?utf-8?B?QXVBQ0JETmJDWWo3VkpsRU5HTklETEJVeis4Qy9ITW9ocURTRE1EVjZvYmVr?=
 =?utf-8?B?cTF5TU1KSVlHNlNFMjBKeUFIanhiekpHU0x0YW5JTG5VQUNsYTZ3d1RPZnZw?=
 =?utf-8?B?NEJ5RUVCa3hmWVRqUVQrTGk1TldmTEpseFN6Zk0yeHFGdGEwT2VEVlpTUkVs?=
 =?utf-8?B?VTJseTdtZWJyM0RlVUIvVjN4TlZGbHo5QUxmendvWW9FR0FmcnBYT3ZlV2lN?=
 =?utf-8?B?WDZCeW4za0syKzllK2Z1M0NEWWo5U2VEVXB6VGJQbWI0ZEtmeE5aUWNCZ0pB?=
 =?utf-8?B?SklDMzdZQmZOZ0diQm5wOHF5L1AzZDZQaUZEUTZRd09pSWJWRGJTSk9xNHJK?=
 =?utf-8?B?OEg2bHhhTHRpVE15aFJtZWJzWlpvbzBCZ3V1eVNuN0lSZHVJdTBmSlJQUit0?=
 =?utf-8?B?SFpzN3gwTG5HYTRFaGxPem9ONXdsRVBkMzdlTDlDOXJHc2JYMTkzekpUV0pM?=
 =?utf-8?B?cVlhVm4yREIybmdaM3BySUtPUThLTnJqNFZ2akJ5ZFNaN0x4N0wwWU5zVFNB?=
 =?utf-8?B?N0MzODN1Q2VjREVmOFJ4Sk9UeEV0aHBpcmdmOUVveTl2Vm13QzdCdWtoMzBk?=
 =?utf-8?B?bXU2NStNamdFdVJ0MDhxaU9OY2dZV3VScnNhVmJZbUpORElWMldOTG9yZmd1?=
 =?utf-8?B?K2dTNEZ1aGthdlpzMTUyK0dKOW8rWGU0TDN1VVJ6VnhzWU5nV3RTS2psd2lO?=
 =?utf-8?B?UG9LUmlnTGhRRHkraC9XTmV0TC9SaHI1U2x1WmJUS0E0YkNsYlNKL0Z1cTZW?=
 =?utf-8?B?STd6NTlsRUtqck5OMno2Zm1FQWdaMzRBVGFYVTlScjAzZy9jUThWN21IL09R?=
 =?utf-8?B?WnlnWll2OWh2b004b1l3aFd1L1RLZDAvS3R6NkJISm1VNkNaY0wxSGdZaTN1?=
 =?utf-8?B?eVRNRm1VSzJIeHdDWVZBQzJpaU1CZzBTZzgvOE5ta0VVcUhVNmlid1NNSWgy?=
 =?utf-8?B?ZGUyR0xDZ1VsRzA2UHdIWW5BaDFaNUZ0L0dzUW96VXJmYk5yRFJGbzZaZWRP?=
 =?utf-8?B?SXEveTVaeGJDZnRqR1pmWTUrWHQ1WkFidG5FeTVLdmQxVnB4dkVWMlBCNC8y?=
 =?utf-8?B?Wkl1anVPYTlmQXErV1pDNmZGNFNWUW5SbU5BZ2RpQjhRZGcwZUJjekMwSGFU?=
 =?utf-8?B?Um1xNHp2TUp0ZHFmSThOS3JOMW9hNlUrZ1NCQjlHMTZZNWpHS3BFKytMSVAv?=
 =?utf-8?B?TkNEeXpDKzRzeWErUmZjMU0yeXB4MG9UV0VQYiswZ0VFR0hXVHdvM2x6dEZM?=
 =?utf-8?B?ZnJDY3pmaWhsZ3poZC9QOE5ocUhaNEMrZ0lOTm40Q1JkZ1d1ZERaaGNVUkpk?=
 =?utf-8?B?Nmp0V2taUWhlSy9yNWxtU1E2V0lzSTBLTnA0VFVnL2F3OVI5Y0Q2K0FjRHBa?=
 =?utf-8?B?WWw5UHkxUnFRQ1BYVTYxYi9PdlM1Y05VNDgwNU9QeE9NYWhJNjRqNjlOdXF5?=
 =?utf-8?B?RnZWNlFJNGNtOERzWGNtV082emVTdWlhbVZkbDRiUVFLK2IvWjl0QW5MTnRQ?=
 =?utf-8?B?Z3c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d37600-04d3-4c36-9327-08db2e9054c6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8703.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 06:56:04.3776
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ofs36YSry2fXfvsSwEdaJywQnXP+b1/0ShHp/xX7gh/stpoWKOd5Xp6f0FmQILMTRlzMT4SmyhMZc6Uwz7uDOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9580
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/26/23 16:31, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/media/platform/nxp/dw100/dw100.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/dw100/dw100.c b/drivers/media/platform/nxp/dw100/dw100.c
> index 189d60cd5ed1..6eed4bde9611 100644
> --- a/drivers/media/platform/nxp/dw100/dw100.c
> +++ b/drivers/media/platform/nxp/dw100/dw100.c
> @@ -1633,7 +1633,7 @@ static int dw100_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static int dw100_remove(struct platform_device *pdev)
> +static void dw100_remove(struct platform_device *pdev)
>   {
>   	struct dw100_device *dw_dev = platform_get_drvdata(pdev);
>   
> @@ -1649,8 +1649,6 @@ static int dw100_remove(struct platform_device *pdev)
>   	mutex_destroy(dw_dev->vfd.lock);
>   	v4l2_m2m_release(dw_dev->m2m_dev);
>   	v4l2_device_unregister(&dw_dev->v4l2_dev);
> -
> -	return 0;
>   }
>   
>   static int __maybe_unused dw100_runtime_suspend(struct device *dev)
> @@ -1692,7 +1690,7 @@ MODULE_DEVICE_TABLE(of, dw100_dt_ids);
>   
>   static struct platform_driver dw100_driver = {
>   	.probe		= dw100_probe,
> -	.remove		= dw100_remove,
> +	.remove_new	= dw100_remove,
>   	.driver		= {
>   		.name	= DRV_NAME,
>   		.pm = &dw100_pm,

Reviewed-by: Xavier Roumegue <xavier.roumegue@oss.nxp.com>
