Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59DD5ACECA
	for <lists+linux-media@lfdr.de>; Mon,  5 Sep 2022 11:29:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235585AbiIEJ0J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 5 Sep 2022 05:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236631AbiIEJZ7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 5 Sep 2022 05:25:59 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1D5D2C115
        for <linux-media@vger.kernel.org>; Mon,  5 Sep 2022 02:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgAwltF+0yv8JSF/vCFkKfUncbH6YIc+QQ0J7OrXqUJUFJ/Lw4HfFFjXFDLJbwhm4ktK6oY2gksnrsHMWR4+5DtLGqg8N5ytjGWDqUi3a2Hy9L+bhPC0S1/HkR02TcMsJ6OziqcRjb/FMSfkSRtEGPzmGr8dhCAh+iGVnIdL3EKrvr+JcI7GpGk27A+LjUaX/uiuw5sFli/bVJjnzWFycHggzOn+wG+smS4r9hWVrxyZZgXRLfenxwmK9x8NkwaZaCgX2Fy98UVUgux31/n+xT0ERawKFjWVuY2wGAdPGyF8qHZ7IXA5mG/MGy4Fbg+HjH2KTo59mZFcbyNv9pWDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=shXN+21UUk7ar6VnnbK8fvZ39+TtoeZbK3vfiF0KppU=;
 b=Emr7Ir3teuvRQTg/UAZXJwjjoKAL+Jd8BgIT2PUZEjQDkThdKt1ttehuTO3cMdbWuROcGBw1rXIUTHQ44h9BGxZERQeihLC53nq7wK+kJNQJAziKjdS7JJ+qbUUeJhKWsBJeo5gQB7jBnPgNpm0rMGdN3i5KVfIRWQss8MJ77Az2ZA8Nq4jM3QsX9DSHETnXeAEBAtjNkaD/mD6ikvOQ7D5IOqZPYmWN8gQ0nfU2Y+IELX+yA23rdbU+WhvhPHn0mkSN2MA+NIc5tp9XUQ5HsXyaC4FPOHf1pwiOE6KGVs9HhyVW82vwlVP6ujhZD+f92p2CoUuWxxv+O1U9O3qHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=shXN+21UUk7ar6VnnbK8fvZ39+TtoeZbK3vfiF0KppU=;
 b=EURA0BUgsnTKqSRghoPuQvqGKXdCDnEu4tdB85c5JfTAAHIlb2kUXELT2+fFCGyUhn10PHoDbYPvVE0AOQdSIm9NN1d0qkhiumSAjYGsWZ3r0SBpgjQ42rcPGFQgwk5mdaPr4J9JmG3OoCeVDnRQLrmzdSKYNh+kAtWC5lQssog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by AM8P193MB0801.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ea::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 09:25:53 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::8d12:1c00:ed1:2f0c]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::8d12:1c00:ed1:2f0c%2]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 09:25:53 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/1] ar0521: Fix return value check in writing initial
 registers
References: <20220830103456.3249168-1-sakari.ailus@linux.intel.com>
Date:   Mon, 05 Sep 2022 11:25:51 +0200
In-Reply-To: <20220830103456.3249168-1-sakari.ailus@linux.intel.com> (Sakari
        Ailus's message of "Tue, 30 Aug 2022 13:34:56 +0300")
Message-ID: <m37d2i9nq8.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE0P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::20) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e22c0ef-c604-4eee-f9a4-08da8f20a117
X-MS-TrafficTypeDiagnostic: AM8P193MB0801:EE_
X-MS-Exchange-AtpMessageProperties: SA|SL
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nxwwd7tCNBe+T6YlQNP3Zo1POvT6dLqNTgSODjr6F3BiKatqthPOTl4iJdH3O8Tr1Y2qj228wLe6Pm4e1yRlJJZ0HjPsG8D4xSvCypbJiPFeIQuYMVZcvl4SHxlEW8nG3ts1bcMH0bVjqxlVekxFSji2EZegrGN9mB1PiWOxYNyPdA2yamx0lSQGCRQSyxVd4TrtlmJMnYUk0vp7Y+TodBPviPQDMkUe96soD90z3g5ka5CodEGu3Pyl0Ojsq1NwR5Ni8HPNlVxOtxb2aW69cYis94E5wh+iaU8mqtwZzxXgi9nvUoQvkB+eGBOpsjYuM0IAPK/J+rlHEe+gxioUh0p/IJk02t+MkqJS1gckfCL5ftShGousjo8aX/Eoxd6gsQaoEAGxwUW68VTE8ufMOMkLg4EIpsVlnA+CcF0E7UbuC5kcnmPFNjmGR69rK+SrLfm0a4nEV8V3lZ6C/5rcVd3Bv+07+WWUOj288N5sHIw+dtpUAMZe9oNOeouA4rZy0lV7o8qbcS3BRq7k1i3fSW2qwyEOep7pTmyM9IfoyRnt0lkZNOvwH4OdtjXz6wkpuX9CisYZdNrAjznSh6K+zNgrDXJUVjeTCA+TgL5LIISs8rmPZhOCRT9lxDjmTMbT7Rg8Zg4gZfH8KCf5cYXFCQ80Y5Inac+45vFiUI8YlcVqu+iTYXTM1rVmhkb85Ln0LxKVQjYHJkK/8+syQX9JYYyN8v+slV7N/u3GykM3iztCbsSPFavuSoNjsAX9cCkQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39850400004)(346002)(366004)(376002)(396003)(38350700002)(38100700002)(42882007)(186003)(6916009)(786003)(316002)(8936002)(6486002)(83170400001)(6506007)(478600001)(5660300002)(66476007)(4326008)(8676002)(66946007)(52116002)(4744005)(83380400001)(66556008)(26005)(2906002)(41300700001)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXRKUFIySjZTLzFYaUFMRGRVTnFsdEpEdE0rbUpiMVI1N3E3alllRFNIZUhv?=
 =?utf-8?B?aE4yWmZVQXNEVWM0Mlp0SW1PUHM0QmNKMWtaN3RySFM4SEh6NkZzaUJUaHZJ?=
 =?utf-8?B?ZW10SHh0dWhvWktrdzkvSDB5MEJrOUw5ZUs0TlFIMWIzREdIR2MwK2p5eVZ3?=
 =?utf-8?B?Q0E0VEZMRjFEelZwWThJaWVGS3JVUk5oa2N2SnVWOG0yUlNhd2UvMUtTZ0cz?=
 =?utf-8?B?Qjhya1JFTjNGSERKRysramVURWFsaHp0VVdXOHlTdDRPcnhQc3ZzbEQyT0th?=
 =?utf-8?B?VW9qQUsvNzUwUU1jQ245VHROT08yMzJVMXEvSmFlc2xjZjY5d1hCUHF2bmw5?=
 =?utf-8?B?dWMvSWFXWTRFNDdWQlJGZ0FaYjJmRnZRVFdNbXYvZ3o4UUZtKzR2bVhqd0s5?=
 =?utf-8?B?eHgyS3ZlV1h4a1krcjN0a0V3bWl1QmJOTzZrK3V4WUpzemtFWjdyT3IvWlVF?=
 =?utf-8?B?bjVHbzNwWkk5UjNFMEVXaGNNYUtoenlML0c0MFFpSXdkSVVnSFlwNDkzalZE?=
 =?utf-8?B?eStBVUJMN1RQRFdLdVJWSUFMY3VGOHBBVUZCdUtxK3JjT3p1N2RRMG1mZkdV?=
 =?utf-8?B?UWQ5VDVmS0NwNkZ2V3VSWVI3K2dRWUlTcFZIa3BxZSsxK3F6UHdLK3dkaEJw?=
 =?utf-8?B?U2RXcHZUNncvemVvenBVUVBsNWlJNG8rQmlMd3BDaGJ2ZkFWOTVISjZMUXYx?=
 =?utf-8?B?U201NDFTMFB5U21Tc2Q2ODcrTURPVjhqMnRLQ1JuZmlMV2l3R3pKcFdrQ1Rt?=
 =?utf-8?B?M0hzcEptQmpheTFzbkZ4cEZpZ0ZXMGhCMFlZZGNnMmp0L1psU2tCOGM3SXI2?=
 =?utf-8?B?WXZoWkY4NzBoZS9iRkxuY0tCYklCckhpZ2ZNbGtScWlnN1VuTTVSS21iQUdk?=
 =?utf-8?B?eTNoK1hvV09qajZjN3BTcWZFa3poanZrWjBnZm1BcUdUd0pyN21GdUhnaDJN?=
 =?utf-8?B?VVhqZUh2U2xuaUlkWk9PdmNRQXpJOTRabEJLZmc3aGF3NDhMWHl1YmhKMjYy?=
 =?utf-8?B?dlhKT3YybWY3NXhmVGRQYVhLdVdiSjBiU2lYc1RVcUo1M3lQak5kUUVKeFla?=
 =?utf-8?B?RlBISnlOZmxJUldteFBadVhRYTZnOHBRNXpXdXJOd2NTM2lTY2xnNHovSkZD?=
 =?utf-8?B?MDYxdStjeFpwd1RzVmNGVWhSc0pMOFNUNkhOZG9mYUtOU0NKMndONDRDeURG?=
 =?utf-8?B?YUVNdGlBNkd5K3FQZlN1WlFpY0dyTnV0NG8vUHBoQ216ZUE0RjBUOXMrNmll?=
 =?utf-8?B?WkVHVkxuT0xYNUdTMzFjdzZwVldOTmhWZDNMalFQSVgvam1WMVdJTXFZeE5R?=
 =?utf-8?B?K3I0TzZrQVovRlBnOU5iRHZlVHlBdEJZbUxWTEVyMHQxQ1UzOEdNbnZET2I3?=
 =?utf-8?B?ZzV6clNmbExqSjNCSTh2NGlONzVaWU0yQXMrZFNzVFVyTHBQVzYrNDBva3do?=
 =?utf-8?B?UXJzcTFjUjVoOEg1VERSSnlkM3RESzJzRy9uSlZGcUFJRDRHNDdvMVNRK0FC?=
 =?utf-8?B?ZHBnU3pteXpIMDhWN1lWSVBLK2h5bWtOQjFxcElSQlZ5RlFMc3l4UjM4UjZy?=
 =?utf-8?B?eUxVaThWcGsyTFpFajJkM3hVRmJjWHVZaStUR29nWG0weWxqYk5WUHY5QnVx?=
 =?utf-8?B?OUhCZXNOT2JlYkh6N21BNGxTbkl0VGxFVmtNTWwyM2lZNmFmcUg4WmNCV1l4?=
 =?utf-8?B?V2xyVWVKTk5Od2g3WnVlblZKUGtzdWhBOXA4enFQMit3T25xMDJXVkhGWjRy?=
 =?utf-8?B?NHhaczBXNEI3cnZhQTRhc0Y3b0hwY0ZCQkFpNU52aGRoanNXMEFSd08rbFFD?=
 =?utf-8?B?WXlPZHEyWEtHZnIzRDYvVWpkb0FzTXRDajQ4aHFYeFRQRFpGdGNjNmFhU2tj?=
 =?utf-8?B?MnN0SHIzc05WT1lrdFJ5cGc0blJ5L1JHS1BWZ2JhcTRGRTM1TUcwdW5ueXJr?=
 =?utf-8?B?OHA4eVRCZFhrQmRKSjlPakx2OTFmd2NLSG9RaHN6dUpXNXM2K1U4ZTZoVGw5?=
 =?utf-8?B?UkpYVVdxa0sxbzJ3Yll2ZHNyTDY1dklINlhnVFpnbzFBOStmVHd4OVU5alV0?=
 =?utf-8?B?VFNQNU01RUdrN0lZNXNXYU1RRzB1UGVVYTE2d1NadU1nZnJIWlQwaGpjRzdZ?=
 =?utf-8?B?aFZydWtyZ2hXVmZlTnQ0ejJjWldTUjJ6QlZQbExnSm9ocmdtbUVpempidUMv?=
 =?utf-8?Q?08CPMbf1FsplorAWD8R2+wLOStyBUpZ9WoqOSibqj/jp?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e22c0ef-c604-4eee-f9a4-08da8f20a117
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2022 09:25:53.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jFfWIZT8BUghAn/yTcyOH0aTbLLGqmT3yJsv+Z20bVFM76a78q1UBqBRYrnmQCqMtnxX/RDDXHT3wl0NlGXFECdqVq+nknb0bKazZlyl1Y7BPz8ZwpCXL2oekQED6wH7Wdh7NMWXWOITG974lWwlgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P193MB0801
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Sakari Ailus <sakari.ailus@linux.intel.com> writes:

> The return value from register writes is ignored apart from the last
> value. Fix this.

Must be Emacs' fault :-)

> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

> +++ b/drivers/media/i2c/ar0521.c
> @@ -755,11 +755,12 @@ static int ar0521_power_on(struct device *dev)
>  		gpiod_set_value(sensor->reset_gpio, 0);
>  	usleep_range(4500, 5000); /* min 45000 clocks */
> =20
> -	for (cnt =3D 0; cnt < ARRAY_SIZE(initial_regs); cnt++)
> +	for (cnt =3D 0; cnt < ARRAY_SIZE(initial_regs); cnt++) {
>  		ret =3D ar0521_write_regs(sensor, initial_regs[cnt].data,
>  					initial_regs[cnt].count);
>  		if (ret)
>  			goto off;
> +	}

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
