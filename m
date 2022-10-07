Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A9175F73B4
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 06:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiJGE52 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 00:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiJGE51 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 00:57:27 -0400
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2048.outbound.protection.outlook.com [40.107.247.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D18F112AAB
        for <linux-media@vger.kernel.org>; Thu,  6 Oct 2022 21:57:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3JqaM+JVgTAQAtTjHumz9oG4/XswUT/plksUypwXQTWKqBVOXFYI9wCYgEgl97bAWalq1BwOMN9IE4atcnzJrE+QkhdPCfn2aLeAHNGhhD9YRjiXXW2ZdJLJwuWMfZoDJv9FC133F4VEgoRDyvk4jPYcrawswklo+rRy4JVVVc4clSS3xshoy3y99jRfoFcncX8bP2pCuzMTvQgrqxcsp7FPUof36hSl/rtYsfVa9/ou500O+8eZ/2jvzXY6DJp8Tg2FIJeYNqsRhzP6cSF2RFgiBagT10Ed4tkNoshYZruM60ngY/2G8YllVgs5LjxFwtHp3Du18jX1tW9tWMfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+bjW0p8flXVozZxxqRAHrdXJlxp+clEY2ff+Gs9oDU=;
 b=jsrQ8SJrlgkvSRuTgsP7Fh3JvJnxniWHJcICQau8bZffaykpbQxZ9FS0Twkzuxo9an4gGfMJ3rMAKe3icLfj+YyZPyUBEZvNRo3mlcFnYrJ7dwKgIkB4kBTSb00NdBQmAmCoU8X21QsDzCA3IjY35MdaFblfuE31AYlwG6VUc1S8ABdDqux/55mGuLZLbJ3iwr7AzHlc8SV9s/5nJ7aSkP5kfToRJmaQY8WEUJOqhc4sWymqj5iP+F31LZ+JxfUiIFws3SrF/Yv1GGyaUXLRfWfdly85QE7co/vB5S3jj/DEyLZ23y0LnMOcZ8ZWxH8l/T+CGhWrMLcvTbAMrEqNfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+bjW0p8flXVozZxxqRAHrdXJlxp+clEY2ff+Gs9oDU=;
 b=Gd7EwAhxu7GfkdSvWiDiyhZyTk6gg7zJ1ea4DA3QyttTxBDogdgX4aQt129p7mxG+m35iaUrDLIwVRsO7qvJ+nVuxqGV/DnwqZycYE+d6bWfe7bweIJove5i78tO6GrD5zLrw3STDZK+arwkfrkqGofJWe/9go95cRSVIO3s/zE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by GV1P193MB2296.EURP193.PROD.OUTLOOK.COM (2603:10a6:150:29::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Fri, 7 Oct
 2022 04:57:21 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 04:57:21 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 01/10] media: ar0521: Implement enum_frame_sizes
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-2-jacopo@jmondi.org>
        <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com>
Date:   Fri, 07 Oct 2022 06:57:19 +0200
In-Reply-To: <Yz8DaZvFAOMKPlCQ@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Thu, 6 Oct 2022 19:33:45 +0300")
Message-ID: <m35ygw6xjk.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::16) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|GV1P193MB2296:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e5ccebc-44b8-412f-6468-08daa8206ab8
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BZJLEC1QIj8wFjq8zafz6QK9SmpoHoP/jrvQZEtay3FBPgbwtyqVU6XGerGGh0T529ecq4OwydV3SZ3U6zp02mGFBq2jBO0upJxZBHxEFqedm0d1rdv3OM5DOAVSu8Ua1/HuZZHHYqK3PiY/uRPpdGsFbZVK83WR3o0hUayxqy43amwvACbbLthsPOw2plCbnS1f/0SgC8MMVUmS4hIc43eR8lPygtohZi0RD0GBRqubtn60jrz7mgIuL/BGE6sqdd+EEt2+iw5MCzaZrlju/KbQlIIADt+i/ICHjO+dOgnulmL985lvcrx8ueOZ382Tvpyo8qJBpb4C7yBEtqDbIYiR4cN19cQz3cCmXw8qreLobkzz4yRicvARX4A2t00lGuIQ7qqXDolKSPrLBjJEQpl6yWSLDHGW+JCqmsRO7iRg0BDSq4qtj4ha7XCm4P8W0a2W8GPjYq0GHaWdlkninXmtdG8zjAGCx6KAajKWn+/2JWURXd8rYk1zjnZoCMA8M8QPMTA8UJh1c2C5f2nEPm+I6jBP9aMF8VBWIKOeopYW1sBeulaAVuwfOCeR/Z5XSXhp8jWr60bcuAfeb+BUwCRQS07dYsWv4YPRiHUQBluCEesJBRcD9B7onXtuYahbq8TsRoUPJjy6LTXHoKPBdTObjmUVprM1BVlXQ6tpgKFyMEtRjwOZ7islCLNBwxPRy++c5Q0EzOMPHbEFiQSSROa8fWQ4THW2IXNnfe43qVvGohrSofKs+M4y1yBO45b4
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(396003)(39850400004)(451199015)(6512007)(41300700001)(52116002)(186003)(6506007)(42882007)(26005)(478600001)(6486002)(54906003)(786003)(316002)(8676002)(66476007)(4326008)(66556008)(4744005)(38350700002)(83170400001)(5660300002)(38100700002)(6916009)(66946007)(2906002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUxMak50WDJIcWxWWmMyWGhHbVNCQXRaRUx3RWhZNkVpRGxWVk1peXlCdnFF?=
 =?utf-8?B?M1E3bDBXWnduYTI2OGJXNlVUV1JNUWo2UC94NitEVHVGUzhDWE5Cbk55TDM5?=
 =?utf-8?B?amNqdjBZblBMV3MzRGpBbHZjWC9qVE53Y3RjYW5QaXBUTXF0N0dtc1QydmlS?=
 =?utf-8?B?ckFrWTM5QStyRkJwNnZCT1JXclNXTnMwWnlBblN4bUN6dzVhMmlyY3ZjbXR5?=
 =?utf-8?B?SWZOa3JSWm1jVEFONlJYM3hnbFJFQWJhUEc0dmVyN0tRZktIT1Rpc3B4RFlt?=
 =?utf-8?B?Tjh6a0d4MlVrU3hYekhsM2pnSDk3OTF1MlpTU0tWWGl6TGVaczdTbVJlNFJN?=
 =?utf-8?B?aG9HbFBSWmpSS2swRzFxc282ZXU4YWovZXZTYjY2OVQ5OU5Zelo0eTRvcjlH?=
 =?utf-8?B?d3lJK0R3MnhJRWZvOEh5N0J6cUxZZlN0VHRWRytCcUgwL0gxdlE4cEo2K0ZK?=
 =?utf-8?B?WXVHUSt2akZEcjR2a0N6UHlrMmRlT0Q3ZWxZOXBMb1oyaTRjY2xCQlNySkd0?=
 =?utf-8?B?TWhVNG9hc1p5UHdKcEpLdFpUZ05DNTlzQjBEOWZPWkVIMmR1TkxWb09KUFM4?=
 =?utf-8?B?UmJkTGVWZzhHbFdWRGxtdXdpMlMrbVBCSVp3a3A3RUFLZDlYZzg2ZmpHN1Av?=
 =?utf-8?B?OW1tK3VoZFhOd0thNlo2dWRJUnRTL0VCaGZ4bGFneVI5NlhWWXRSakJ3dFdP?=
 =?utf-8?B?a2JRNVpxNFZJdE9Cd2lpcTJoaEU2YjNqdnQxVEUwM2xyV1RENVg2eVNCelFJ?=
 =?utf-8?B?QlQwZXJNUUJhOXVqYkhwT2xGTHpOYmV6TXIzY3MwTmhVMk5UZEtONGc2VjVw?=
 =?utf-8?B?b2FQMXhlRGZlZFg2YkVkM2xqQlpLamFOb2wrUDZhRDVQb0w1T3JxNVEzWG9W?=
 =?utf-8?B?ZEhzSXZmQk5GR244U25LKzlhR241cFhzRlVkYXBVeGVNYUY5UUg2RFV4dHlL?=
 =?utf-8?B?WWtQRG41NnJpNStCOENNbVRmT1NpTVNaMlIzemVYOUJaU1RoZElKbGM2ZndL?=
 =?utf-8?B?N3l6a3dYZGxmRHc4VTBsdWhlRjdONkIrQnMwd0llMjFJWE1FMm1hY2Vxek4r?=
 =?utf-8?B?UWNzL0EvS2lPTmxvRU9CTEhZVU1Vcmtray9BMHVKbkZ0Z1BlQnpaa09KUmlT?=
 =?utf-8?B?K3VjelFzSXhJcWFlQUFYUW0yN3J3RUt0eEdXTVVIQWFFNnlHWjluaEU3aDhM?=
 =?utf-8?B?WGk3OG9lNXFmVTd2OERVNWR4cU1qVlppVTFDcXI1RU1GY0txY1d6ZGk2TGNJ?=
 =?utf-8?B?OElLd2RPMWJNZzFXd2dLRkVyT0cwSkNLVkxlbzBXUk51V0JocHUvQk1TcnRM?=
 =?utf-8?B?Rnd0ZE9SOHRsTURrRHZwcytkNVRqNDBMSkpkYnBvR3RZOVV6OUdNNVRxQlBI?=
 =?utf-8?B?UnVCbVVYMmgyTU9pMG5xRC9sM3orVjBlUUk3Sms4eG9yYkFMNDZhdENWbkpw?=
 =?utf-8?B?Njc1WWtDQTJYWnRzNTlLR294UElJa09WRzEwQ3kvOGVOdUtoS29wZElBZ0JP?=
 =?utf-8?B?eVVtSnY0eTlzYmVrK3FNTkU0WWF1UzQwNXRYTkRQRzRtNGNOaFlUWjNOWWhU?=
 =?utf-8?B?WHUyN3ZQWTRzSGJTRkVNbzNycXpHdHhISSttNU4rQUUweUVYRElDSEJSK0ZX?=
 =?utf-8?B?Vy9CcnFJeDd3MnFVMk4zbVRxUy9Uc2VZdVNKSUROT21QV2pZVHRXSkJ6ZWgv?=
 =?utf-8?B?SEVLanA2L2t4eTVYSThzVTBCMm54bENkMENUZjBZbjVpVG5CdEhRVlBTakEx?=
 =?utf-8?B?dHRrT1g4bWd0ditSdTlnUUQ5eEtxUUxIZm43Y1hwd0QvOWRrZUNvU2l2NElq?=
 =?utf-8?B?bFR0d2tJOW1TTW1CaEZtdEZpVTBEdk9JTFd1TDVIbjJ4dGtZZEpGSkhnMCtI?=
 =?utf-8?B?M2RTc3V4OHl6WFUwSVBVQXI2eHAveTFpSlBmb2krZmFWZjF4bzg5Sm5RNW40?=
 =?utf-8?B?UVFZQ1U2R2ozcmNaQTNzNTdlNUl6VEZ4YnFlZW5EWUx3WWFrV3dwRmRNNko5?=
 =?utf-8?B?M1hhdWJSVXR6Sy80TEF1R0JWcDMySlB3UzVsTmpSa1praXhnR2JFWlZscmpI?=
 =?utf-8?B?cXp3YzBzWjY3Tk1TR21xUG90UWExeEl2QWNqczJCTnJTaEc3dXFxSnNuSExs?=
 =?utf-8?B?MWVIYkRTR2lmWUJMMlRMU2l3OTJ2T2JYMmp4VEU1aHNBWVVzM3hIeldJM29O?=
 =?utf-8?Q?BJ+v700SWMhzx1Z/Nd3TOVVg2JUOR+uzg6SUlMvl3rMc?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e5ccebc-44b8-412f-6468-08daa8206ab8
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 04:57:21.0955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtptkPBako33Hw/MFOZQ0Fs4DL/XpnuKZmNJW4cIvvod62Lw9gSO8ZiGd3vnCVr6nbWb1vhKbh9b7aj98uwl+DwGfzWhv85+z3gqAHnIirjRyd8W6zQkmkZqSYmX5QOwojL7aRd2LM2IIJIg4D1i4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P193MB2296
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent,

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> This matches the driver implementation of .set_fmt(), but that's because
> the driver is *really* wrong :-( It uses the format to configure the
> crop rectangle, which is not right. This needs to be fixed.

How should it work?
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
