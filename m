Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3D95F7406
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 07:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiJGFw6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 01:52:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbiJGFw4 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 01:52:56 -0400
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50053.outbound.protection.outlook.com [40.107.5.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 499F4A3F5A
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 22:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8D9KW3zmKhjCwS8zAMoZwPCoX/k5c9De/ew/RODd1r+EvqJFqfVToPEcbuG7nRgGoNZgTORiJ+zguIVCb0afp2bLWtyi5kMjV7TMK3ByZDgcY21fVaIXcf0NS3uNygFVHOBBhzPV7+CNCFyw0oWjmgC3+VrtgdFyOiFYuG7hHXl5kbGxAfIe+PlxN2aujBsInEPJ4filLyyTHMKVRRkAn+062r0HFtLjUz5EaIBzix0otGm8IwvGoqDVpOq2cH/p7fH6UdLS5HeYH5RPodzndB1dO87PEfZTDW8pVnEUcp35pipdmR4rBQgGekSFW9APtD+qtVg0djQita/4RwJaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xl/sGvvsTD64o2I0YzMftGjNkInrYtw9Hehw+BbwXNg=;
 b=oFqmN/k9ynluLIrlVHJB00/qTgBRvTBRfzHyI5fuvbVcL5YSmSLcF5y2FLVJT2ZHdQVvEL++IhZ6m/Skp7/ETmWUMUeoHtjGmNynyGkh6Mpjy3TgWZL0mCkxNBmSt0vEuG1uJe735p60J8eXvF0fAiCjeSbepuk+dV9hcBrIgkDjPYq4hh7DUMRAeAngeBbLDxM3trem5LN82N1+5Z70sWUpDwkDJMEkVhJtyAA+dZRJSgHszGBmeKMuvGrO5hru40H73ioTO9jnwK1GMLxK3Kh4Lvl4X7ECrjRveXFpkkscTA6qBvI3ABmHneQfE20L5nVORiJg5cbg6G+BBKi8wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xl/sGvvsTD64o2I0YzMftGjNkInrYtw9Hehw+BbwXNg=;
 b=Tc8EhHRKIa4Znxj6wRDDTRmLLlf11FDrCJNegzEpY5guDq6hz+xj39HUWyVc5NF4TQ5AlCpQSKy0wgXH5+OGI7tzH8zB/xzqURYhBPKGNz+moNNV9zAU/9/N5YWPHiMlj/jKFvcxiMYv8mdWCktDKgBaXZGCY/JWzXnyEDTulLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by PR3P193MB0944.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.38; Fri, 7 Oct
 2022 05:52:52 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 05:52:52 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH 06/10] media: ar0521: Configure pixel rate using LINK_FREQ
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-7-jacopo@jmondi.org>
Date:   Fri, 07 Oct 2022 07:52:51 +0200
In-Reply-To: <20221005190613.394277-7-jacopo@jmondi.org> (Jacopo Mondi's
        message of "Wed, 5 Oct 2022 21:06:09 +0200")
Message-ID: <m3edvk5gek.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:22::14) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|PR3P193MB0944:EE_
X-MS-Office365-Filtering-Correlation-Id: 9640dd34-9627-4700-b8d1-08daa8282c54
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6tD6l9J5pTilL0x/xgk+DDO9YvJSGdmuqQN5MuoHL5uQx9c+ziMro653Bd2llv7pPMSDMoSi8Nw0zBa7G4oHlgIWoKZjqLJycKsZsntccCZ6+GM6WTjBBospT8T8GLmexMyCIt5dx0jQUNW1xLAGMhzMVwKYdnnZ4Grb/LT306u6Dg2yULtWSIRIoZayY42pUa0z0eSgKiQ97B0bsCC33IgyU+orAtN/2dBw0iC+yEP5NNwoirmpdxe7Cm/y7+NrH5iQehzhwyS9Bc+ee5XNLzO14S0cRP4ZuwY+083Z1rmuTybFHHAI3XDMrzwMmki3hy63C+/y3lNyQ0jpRhdR/+tSd7E9Bp/jOUcXsowxMo6PHumJHbv6zgtzbssONCj/DUJIugSFY6Xm6/HkeHABLF8Qr5lnMToYbLHPklUlxHbjihROKTS2PkGJEMDizwa2VKcNg/+xQbyhD7cNFRXtfl7b6T0l95725SQHTJBWPPV7LywWrKoJz14W67kc56uEuLZ2wdgbRjEuyEYtkkgceCkimlYzm1u1LztqZYIdsGv5IJ7xkWwergNRl0Xn6eNRDMkTeFIMxuTerXR6i8ybr5hL90Hsnw7k+Sg9AnYrQpqzhHq0dqnvp1QbLd1h+PvM6KP01ILbA2UkNHSn6nUJYIJBIiEgzS6zX0SHdAbW2ilaBImfJFXnsxEQ8RiaA5iDYym/zkMbGaAt3v8RlQFWGh9raJk9LO9fvQIBthfkBNMGxE/0MBedW2F+yGzG2QtA
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(39850400004)(396003)(136003)(451199015)(66574015)(83380400001)(83170400001)(38350700002)(38100700002)(66556008)(66476007)(66946007)(8676002)(4326008)(54906003)(316002)(786003)(8936002)(478600001)(6916009)(26005)(6486002)(5660300002)(6512007)(186003)(2906002)(42882007)(41300700001)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K2doQTlNOHdQUXJDdzNuZm1uS0tCYkVleHNHdXVTRWpwN0J0RWVLa2RBQVdZ?=
 =?utf-8?B?QktIVXdoai9aQWFYSXN6VEdhWnpUZ2FVMmFyS3NPbmQza3FhY3NEMlV1L0pr?=
 =?utf-8?B?eVJFSDFxamYxVW14RDNFUWJJRmdqVGNHQjh6SUkzV3RJRmlvVytEV2dST050?=
 =?utf-8?B?S3lqWEt6TjFkalZVTk1QRGw4dFp1azhvZEN2QU5aaEU3TkM0TEVIWWtSZFZK?=
 =?utf-8?B?aUh2cHFSTHF0Z3pQUUdBMXZPcWhmU2cyVVdpVzZEMmRBcERBVUJFL2xSaFdv?=
 =?utf-8?B?ZDloa2lDL1lDbytWeUFrREtiWDRwNjQ1QjRCZXo5YjJrUjZrY1AwMFVrMTJu?=
 =?utf-8?B?N0RXWUlWbVJ6WVQrOExRVXNDdDUxRmxITmRrNVdQZ2hSYW9yL2tNKzhNVEdO?=
 =?utf-8?B?eXUxaWxzc3BGQ255ZmlnQmZmZk9mcFNET29oZ0llRHBwZmo1YTVLTFUvS3ow?=
 =?utf-8?B?eE5Oa3JwVXZrKytEbnNMWTRwTlZjUFZDYWlPTVlMd1NTUWM3MUk2ZTZMM0lV?=
 =?utf-8?B?V2xrUExlMUZZR0lKTHZTd2FwNTh3d2djWkJKbWNLa0xvL2hJdytkclBGd3Fi?=
 =?utf-8?B?Zm1Ud29jTXl2bmlRT1dwWlpiWW5lNGw3TytVSTlnc3hXY3pZUTNYUnJtcDN4?=
 =?utf-8?B?R0VZV2Y0dENhUDFQNDVpRGR2dkpwRThmZ0g4SlhUQXozbExDaWJEQzQ1MEt0?=
 =?utf-8?B?dkxxMGxyWDQrc2VsRnhDd2xXOEV5alp1YVJnSnVKZ3Z2WmZCQ2FabnErSDlt?=
 =?utf-8?B?KzRGNFp0Y25haHVvRjdLTDFtU2tyeTdDQXIvZG4vSjRMci9pUU8wc3hsaDFU?=
 =?utf-8?B?d3ljWGlFQ1g2NFZzWnVldU5ZdW5RZUN4VmozbEx6dlVZYXVZNWtTSy92TnlB?=
 =?utf-8?B?KzNqaWdZajRuUk5yUFdjbDRxblBtZVh1YnZHL0w1SjQ1MGhqbWp1R1kzN29a?=
 =?utf-8?B?d2RlajZmbXBLKzAwanBXN29EY0IxOVFteWVPQyt6YWUyUEFQQURRV0lyOUtk?=
 =?utf-8?B?OWp4UkJNR2pYMXk1MXBkUWxocEs2dlJCL2d1VHZmV3g0UTZlb29hdWJ0Y2p5?=
 =?utf-8?B?NUFtTXFtUUk4b0dZb2E1dSs2dGlCR29CMVYxcm9SZThxWE5JbHhnMEJzcm4z?=
 =?utf-8?B?Z3IrOFFCSTh6TDhSWlBCcFV6S0xIYkRveEdrMWt3Nk1yTXFEU2V5aVhFM2Fk?=
 =?utf-8?B?QTI2bzZvODNEaXo1SlVlckEzVXhQOTJnWmg4SXhGbmxGanJvVXo2N1RndDJF?=
 =?utf-8?B?ZGp5WmVVcWZ2SUVJWW5HYStWTFAyVFlLc3BPRk85c25VcHIwQmVWM29XdmhZ?=
 =?utf-8?B?UFI1K2dzdzlyWGN4VDB3V1Q1VWlXVWJaR3RUYzlyM0FCVUkycGpYN1dYOHli?=
 =?utf-8?B?dnFZMU12cWsxZ2ZCK294cnlBZ0Z4eVNpeWJUMWRpUHZvZWNXZGlJUTVYMmtW?=
 =?utf-8?B?OVpFTHI1NUZBTm9pNlhNNGlmOUZHbkZJTCtDVHlLc1NETEtvcUNsZVArdkYx?=
 =?utf-8?B?NGdjRjg4WG9MZW4yWDU2Z2M2SXF1ZnRXWkVLMFVlcVhKS09uRFNWQjRUcmtB?=
 =?utf-8?B?bHlaUFE3Yld0ZEdEczI2NWZBMmhodXBZVlRhTU5adUdWcEdsNnVWaGova1RI?=
 =?utf-8?B?Y2lrblFGeGpnVjBKcXV2V2RseXNCRVM1TnV5Sk8vOUdvalBKU0kwamdEU1hX?=
 =?utf-8?B?S0l6NmNEK0lXNXUzTU1HZ0lVMVVialE0aTIyOVRHNCtFYXFsaS95Myt6SXVu?=
 =?utf-8?B?TnJiK0lxLzZueCthNkpTRmcvUjRhMkl4ckJ1c3BmY3VpYUN6OGt5NHhhaDV0?=
 =?utf-8?B?L3o0cGsvTE1FU3RIQ2RDcDVtMFZLTm9ZREVuVE5adkcvR3FyRUFkcUFLcEhZ?=
 =?utf-8?B?aUxUZWFtQndoUjNJTi9iZ29Rd2ZJQzF3OTFKUXF1WlVGREFTU0F0Q1EzbHpN?=
 =?utf-8?B?OU4xV044VjhwaGhoS1FXRHlFa0EyZ1E0Y3I0SmV2b3UzcUV0L2tmQWZJL0lW?=
 =?utf-8?B?NWVDdHRReEphdzRsWUtXeXdFWDNzL25ZNWxGUDNnRXlkR0VQWUJ0VjRJZHlm?=
 =?utf-8?B?SmREc2U5WHY4RTNyb1NIcVF0SkVkVGt1ZTNtZWIxb1BRa2RGMEVSS2xBeWxH?=
 =?utf-8?B?RElabFZ2NWczZTQ3TlJMRmROc1ZudzJQaTIyaXBuL2RjN3NIU0pQeC9aOXFP?=
 =?utf-8?Q?+9/+S8NzQXml4Jg6n7RCsvAYw36kWcGHlMTeY8vlpN8F?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 9640dd34-9627-4700-b8d1-08daa8282c54
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 05:52:52.3348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL1C/MILtHCf3HdJsZiG7PkoTHPBDNF/NYc7vtF/sGhlBnrWhY6ELCMf9EQeZXWpW0wRWIRa7BTP5M7KiZ7Z2nWWJZeXJcfUr+gu9y3odt/HhVNunJsesDZT4tHm95kvV5prSfxr8OW0r+CQkCycaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P193MB0944
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Jacopo Mondi <jacopo@jmondi.org> writes:

> Now that the V4L2_LINK_FREQUENCY control is available, use it to
> configure the sensor pixel rate.
>
> Adjust the default pixel rate to match the first listed link_frequency.
> @@ -330,10 +333,21 @@ static u32 calc_pll(struct ar0521_dev *sensor, u32 =
freq, u16 *pre_ptr, u16 *mult
>  static void ar0521_calc_mode(struct ar0521_dev *sensor)
>  {
>  	unsigned int pixel_clock;
> +	unsigned int link_freq;
> +	s64 frequency;
> +	u32 pixel_rate;
>  	u16 pre, mult;
>  	u32 vco;
>  	int bpp;
> =20
> +	/* Update the PIXEL_RATE value using the desired link_frequency. */
> +	bpp =3D ar0521_code_to_bpp(sensor);
> +	link_freq =3D sensor->ctrls.link_freq->val;
> +	frequency =3D ar0521_link_frequencies[link_freq];
> +	pixel_rate =3D frequency * sensor->lane_count * 2 / bpp;

Must be that div64 thing.

> +
> +	__v4l2_ctrl_s_ctrl_int64(sensor->ctrls.pixrate, pixel_rate);
> +

--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
