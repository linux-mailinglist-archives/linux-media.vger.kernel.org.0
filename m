Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD9395F7964
	for <lists+linux-media@lfdr.de>; Fri,  7 Oct 2022 16:02:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbiJGOCj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 7 Oct 2022 10:02:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbiJGOCh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 7 Oct 2022 10:02:37 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2060.outbound.protection.outlook.com [40.107.21.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D95F46863
        for <linux-media@vger.kernel.org>; Fri,  7 Oct 2022 07:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g4G5nF/DX4+Xu2C3aefwHHqysbGfo4p05SpTgFuZVQzaVeDsVmigo4O4LpBiBoFoHuB48jxevuzLuzzOM4ebBzw3SSQrhkDct/uBxCqKiz7c7lVGp4rgP/SYVnf1tajut1PK/MpMThMLCodZ/B72aKnOKyc80hLgJVuBiARlXVUMutJdl+nf8ZA+Rp/lxygFWjlKrrJj3wp5bLyD9jyrqtBQmqZq7iHyLcIMK5DhAocr+KNSuBt701n2HK9GFgFsmEajjiCzIPOv6PBO9A0poQhY1H93w1DQVutUo+C5dT4rNmhF1B8T8Z3goSHZpQE/C6fREkDJrUJfD05JlcueYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIRgDuW1nIvJgm5SWbJly1z1SNdjKDvxmCEREK4q4f4=;
 b=OT2IPPo6x464ekzMMeDefvL5cB+YdQeuUp/uJ55f9GjMfvDLMWR/A0N5sA9MWCOpAcQY3ZIgU+03f3KolUiR+GlZ7dYNZAWRYNCmIA+cCffoQttwYcoir6AQxZt/iuH5BVyQgsjDQgIbFZhdgnE+2Zizdd0tmBWgq34Lj9CwPDAbHkwfQMGeeG/zT9z4rKnJUD0OeH13xXnJBnAjMhDbdgZ03CkKF2lCLji0li2LIFPDwF1mao55ppStDcdzk/N32yvvkbynek39qb9FLXvoVklPeYm2CNveeHPAaFmjKj09lQWHg57csDIGrBQowzv2+e526mUKDIbqsWFRAnGWnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=piap.lukasiewicz.gov.pl; dmarc=pass action=none
 header.from=piap.pl; dkim=pass header.d=piap.pl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lukasiewiczgov.onmicrosoft.com; s=selector1-lukasiewiczgov-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIRgDuW1nIvJgm5SWbJly1z1SNdjKDvxmCEREK4q4f4=;
 b=vIhiwUP2fFL+s/7tvVzKdARSrofH8abF64uDTX94rXBV1BCFjRk99YtW2hFRH0Op7f4K8b/ehhpzIwSZp5P5LHIIeOYXGJ8q/azpBD6/Dl8a0AW6rx4Px+ae8wff2q5Wm1SeuH9IthTlvyMDJtIqw8Ga9q6SDJ9K2sPRdu14zBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=piap.pl;
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM (2603:10a6:800:155::18)
 by PAXP193MB2171.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:233::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.34; Fri, 7 Oct
 2022 14:02:33 +0000
Received: from VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8]) by VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 ([fe80::a859:9fdb:38b7:b0f8%3]) with mapi id 15.20.5676.034; Fri, 7 Oct 2022
 14:02:33 +0000
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/10] media: ar0521: Add V4L2_CID_ANALOG_GAIN
References: <20221005190613.394277-1-jacopo@jmondi.org>
        <20221005190613.394277-3-jacopo@jmondi.org>
        <m31qrk6wgc.fsf@t19.piap.pl>
        <20221007071725.zxcbx4kwwh2pt7ax@uno.localdomain>
        <Yz/jqA6ZACHOXxl/@pendragon.ideasonboard.com>
        <m3sfjz4zcg.fsf@t19.piap.pl>
        <Y0AWhH3K6L/01U07@pendragon.ideasonboard.com>
Date:   Fri, 07 Oct 2022 16:02:32 +0200
In-Reply-To: <Y0AWhH3K6L/01U07@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Fri, 7 Oct 2022 15:07:32 +0300")
Message-ID: <m3fsfz4tqf.fsf@t19.piap.pl>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::7) To VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:800:155::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1P193MB0685:EE_|PAXP193MB2171:EE_
X-MS-Office365-Filtering-Correlation-Id: 773676d4-f312-41cf-1f62-08daa86c94c1
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ijSBsgnjcf1SlST7jN9EnB/TQRxtd3cF120NwkpPDn2X6mmPh5V9nnCeNaAvv8Jnux8N+MCVS90tV1lmc8In9C9uzF/4Qf1gdD7Vi7rLpZivILM0iBRlv1YXtyaW52t7VyQ82YTZbfjEFqWKEmPXHDdSEZDdRjD9atkJZWe6tkidzBj4P+rR4KIfArKijPfyWU7CLIMhAzwuJbPEr6Si6bAJhgTwqI1DsBdpFgcS+ID50Ej9GTer+/fUAcMnJpv10oo/F9sOhA9sb3Ubzg+e7F+y4urfcW8ZbJ5MVFJtxju9sEtIHVOdQJG2hPsE0bM6USeEHkxC7cjiC/+Fm1RPN30WEJDE55E3sfBvh1OXM2rMSgdf4DAUrSXkAflKEcWBHfrLgWHpeImLrocXEa5zZnVBixQL8VkaNnhtkOGodCoStn3My4AINeA6o7xeTh33kQPOt5bZxYzfEqKhcLhaEHiLfelGviwYLfmgKRq5zMw4M3AzBIjuxTgNbHPwF4G2Wxt4k64zh+YIqPof0b+8WkxCusSeBUd1/T+/J3B94yhB9fZnN7lM32NBipJlm6xciuQ5xeBXCmufCk4bQw4HvHxrTvatOb2CU7Oqa94dFwNKO5rfvm55T7Mxyg/PhsPAgQGI54b8kwG0MqLXRbMAjB1LPmSzPjfLJPcwSOETBdVwkmO0dzpEYSb7tjCYnRetXHBQS/pw0BtI6gHmiKZQwVLdTKovu9KfBZI8y3c7ct0c2kqaMeM25oBBxmgJl698
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1P193MB0685.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(396003)(366004)(451199015)(66556008)(83170400001)(38100700002)(8676002)(38350700002)(316002)(786003)(6916009)(42882007)(186003)(4326008)(54906003)(6512007)(26005)(478600001)(4744005)(6506007)(2906002)(6486002)(66946007)(66476007)(5660300002)(41300700001)(52116002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVBzK05SWmMwcjVNc3ZVMXg1blgzUVJvTWtqMlpGR2dqZzIyYSswWHJ1SDll?=
 =?utf-8?B?eEdYY1ZTa3pZMDdNNHZvWEkrZGltaFE1U25JVEdMZHQ0NjRpRWNrTDQ4dS9O?=
 =?utf-8?B?VXdxeVJlYjY2Zm40d0FBQ1pmdzNVMWF2eVZ1Qnp3Szd3K2p0cWV0Qm9ydUdy?=
 =?utf-8?B?ZXc0SmF2YXliRzNKMStwbHRzcFE2bm9oSDB6UEt4VURrV3ExK0F4aE5jNWhU?=
 =?utf-8?B?Z0FzemdZWXE0MDYzVE91eUN2OVZ2WitRQTJxUXl2cUdHWHQ0NmJQS3ZraGR5?=
 =?utf-8?B?OFErZnJqSWZCVU0zVXh0emQ4eE85THVJWU9GelNCNUo2WXc0M2xQQkdFdnMz?=
 =?utf-8?B?WHZTSXNHT2JCLzVZNmkveTF2Z2hobFVGVWpaSkg1alM4OEVYOFRKdnl5amYy?=
 =?utf-8?B?MkZocVZOWXRlWWdBbm55UkI5dGJHb1VBeTlxMkpxT3Q1WVJQZDFNeERpVklo?=
 =?utf-8?B?Nzd5TEg0eExGSFJvWGd4elZXNzJ5ajh1bWJjRlZhUm1ObnNQV0QwZVZSWG5u?=
 =?utf-8?B?cWg5TENicGN6QjZkeHZSL2NyTitBcUFXeUxRMHJIbk9ubkZvRTZxWVlJaXE0?=
 =?utf-8?B?S3dXSWxWNkorb0x3am9xc01USW5DNnFxdkFPYzVKZG5mSnIxa21ERDVWOWFT?=
 =?utf-8?B?eUppOFliVkkrUDIwbGYrbTNvWisrbTViZ3ovRGFaWXBtMHFpSWxRK0ZpMHIz?=
 =?utf-8?B?RGpDUlpLZFljVkwxNWhmQjhqNTRyMnhqN2FzeVdROUt4VkZOYVRLSVJNek9R?=
 =?utf-8?B?a0RFZ01CdUdFUWFHd0dxeFRUQXlBNmQxYzlYTGZLYUVFSkVPdXcrLzNYTjFI?=
 =?utf-8?B?djUrUW5WVlpYeE5IOURONmw1TTVGSS96eVNucm5xakxlL0V4ZG54TFFmN3du?=
 =?utf-8?B?RGlEY1FUKyt0VGo4L0lJSHlnSlo5QjhLL3ZiMnpHZXduSnZ3OHFMTUVqZWFU?=
 =?utf-8?B?bUkyeGNML0tJd2tod1V1TVk2OUl2eFF6ZHZFUXlpNlI2eE5BUnl5aGcvY05L?=
 =?utf-8?B?alI0R2dMZEQ2SlhIQ0M1WUhaaUtIZ1RXRjZNL0FaenBDMHI4UzcwSzVqZFJa?=
 =?utf-8?B?RDYrbUNxMldYQmV6YW1YQXJXekhsbTh4eDBLWlV3VXQvc0xyOFQ1SzdpSnAr?=
 =?utf-8?B?RitVNERSSXRFa1k4MkNvWXhPTW16aUR2d0NKS21lV1RMSUxZYmY4Tm12UEJz?=
 =?utf-8?B?ZVd3WEgyUWVDK1U1Sm1Zem9xU2NvZDRSSFcvVzZlaXk3N3RFZFQ5R093OUh5?=
 =?utf-8?B?dkdmMXB1UW55VmNyakZzYm83Mm90dXVFZUtPdE9BcjJtWktTQ3dYeW00Z3FB?=
 =?utf-8?B?Z2NuR0lQV3Eva0F6WHpSOXZhZy9nTmZ3NE1FbVZ2RmRyMW0rdjZiM0FBSnhX?=
 =?utf-8?B?YW03cnJtWW5pUnIzY3paTGgwdDY5VUZ1ZXZVdHJySXBSbTVVa2VSTEl6cmMr?=
 =?utf-8?B?NWw4bEZLZFFWZlM4MDV0SUpvQnZHMHhkWVBKenV2TDZqdHpNeTNnc013ekFn?=
 =?utf-8?B?MnA5azFVcGxwOGtmTXdkM0NEWHZkWld0NDRiOWtIeHBPRWd1WkNRcWJuWndh?=
 =?utf-8?B?alVxaWNTeWU2TGI4SU1QOVVzZ044Vmx6VlNEcGo5SktlYVNrM2tEL0VBVm5i?=
 =?utf-8?B?dE5HNU1NVHpxVEEyN3V0VDVXbnhYWiswOTFZaEtFWUlYZHhwb3o0dXZGVWpM?=
 =?utf-8?B?SUF3MHN0bHMybnc2Q2Q0eTZ6NlRLN1ZSczltVklIekFTMHh3YmJtZzZrdlpW?=
 =?utf-8?B?QUJyZkhSNDdXVDRHT0N3bDdWOWVNd0Qra1lrMVNmdmFKU1ZkclR4ZlNhTFRN?=
 =?utf-8?B?SDFsTUdvRmQwL1VXODdzQ0tHd2d4d1haNXdEN2RNNmpyVldPMmdGZ3o2Rno4?=
 =?utf-8?B?SzhKTktNdVNXeUdwOW1aVzBuaUVNYlJSOEV6SCt0UFBTNWJCcnh4ZWNBK2tN?=
 =?utf-8?B?dU51Z1lsRkwxSCt1eE1QNVdSVG5Xb0J4ZzBvdXJLcGpvTUYveDBiNnBpeE1S?=
 =?utf-8?B?dzI2cm9XV1QwVDVZN0xMa0lWSUxHb0lPNEFqNE1xVWVxNE9YeWE1OWRvMnRL?=
 =?utf-8?B?dWJIbXZvQ1dnUkNyMEk1MzVaQlp5NWVkODZuczZMTTcrOFV5ZGd5RlE4NkpS?=
 =?utf-8?B?dVFyS3NWMzdjbVhMQlNSbVJLZzFiZi9YOW00dXg3Vi9iR08zdXlsLzVKZEky?=
 =?utf-8?Q?j3V07ib2D8Otr/zzva6/eteQM62pPJ+iI9pyeqX6WAEz?=
X-OriginatorOrg: piap.pl
X-MS-Exchange-CrossTenant-Network-Message-Id: 773676d4-f312-41cf-1f62-08daa86c94c1
X-MS-Exchange-CrossTenant-AuthSource: VI1P193MB0685.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2022 14:02:33.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3e05b101-c6fe-47e5-82e1-c6a410bb95c0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAqmIwJxGD+l4SNGKl9jdkmTniq3KWl2VZ589NtLwceiA1amrUgWs99X9vPjE5D2D4IJM6FjqyORsFtcxSaQV/NeHYZMhXB6Tpf2MryAhlpoqVIyvlvOdNgDXTpsCz9b9fCYLzfpAZZEDXqw6qrguQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXP193MB2171
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

> That's an interesting question. We could make it a write-only control,
> but that would complicate userspace applications that don't need the
> per-color controls. This being said, I'm not sure I've seen any use case
> for reading back gain controls (beside on sensors that implement AEGC).

Maybe we could have a control which is write-only "on demand"?
I mean when an individual control is written, and until the main
control is written again.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
