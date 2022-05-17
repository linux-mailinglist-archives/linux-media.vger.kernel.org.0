Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0676952A300
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 15:16:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344752AbiEQNQe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 09:16:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347479AbiEQNPd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 09:15:33 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A4C40E79
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1652793315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zLQSC02vXTZVgJAkODwieZz4cOOV2N7PfvAcWU3Bzgo=;
        b=jMS8gVDF/qroKkE7b0x+Dn0Eq7W3fJT79pmkqD3jnb9mdHoqja5BzHPnxE2QwfWtx5n6/5
        2Gp82AGVunywrtNbjY2GsX40mQalzO+1viTfktQuvyBuAusOLjQRgcfs+VMet0I2PI9J22
        QKDoCVRvn8cOrjeV1uPOXSCge+RnAgg=
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02lp2053.outbound.protection.outlook.com [104.47.6.53]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-12-KS4PCFclPLC6VZ1puWqL5A-1; Tue, 17 May 2022 15:15:13 +0200
X-MC-Unique: KS4PCFclPLC6VZ1puWqL5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dELDvKO7YmRzmJ7UWchyyOQzU3Wr63kEEPUtshFaXBavuzaTDxFnnNsHh21AavPoPqvJWfT4oC4/alzLCUtQSUwO9KYvWL5PL/K5wkUZG/TnEF0i9OTSt7THflEBrV/ipIN2QKQjmRL45cNcEnr30rBqtPy1GyL/ETpK1ruyiZTBSPFr4yb8wz8QIyZaVAqvnnLO1HTsPB1zFzG6YiZsvnFTkcxsLnfAeA1WMzRS1GJU7dNC7qL3L4VG0nh40hh1XjqVkmPR/t/yN52VW8wOi/rfMZN3YqY1RCUqWtYRuZqDUWsi68s4paJApopmQyfoKwPJsheSUczoo8s+nX2OCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JG3SVIsUwkNx/a+5QFWgl8lq0YuBHLllTkQN3zQMHSQ=;
 b=C/05kq/Oclv/MTVEIG9CaTlBLxYZVSP+yb0LBFV0pPWRaFKjGzwaU+CcHlq3VHG4AscCAgFcWcsFyVpikRxneWCMPWoAFrhNjxOl0nKCKtoG12eLLQQZtSjHCp/uSaWw32jo1Jnmskj1W8Z6YUi8q4sXbibwuxVaxlmBiO5s6z0fl0SPF9qUSIPL5chbVQp9dT/PLS4KQ6pB3w1vdwNTEwdZROxtA70kjmCIbnE5Hf6Nz3VI5FgWHUviOS5DKbQs8+5OJj+gjIYcJ9m7TKqiS7ybYVbFOVyuqWpk8cvo+VkF0HySB4p6FIe6QPBlz8hErM4U/svTDhoSTgH1a+VrOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VE1PR04MB6701.eurprd04.prod.outlook.com
 (2603:10a6:803:124::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 13:15:10 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c%10]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:15:10 +0000
Message-ID: <7f809320-4dd5-c8e3-1a77-e9d8627d292d@suse.com>
Date:   Tue, 17 May 2022 15:15:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] au0828: allow higher speeds
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Oliver Neukum <oneukum@suse.com>
CC:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org
References: <20220517125447.19535-1-oneukum@suse.com>
 <20220517130315.GK29930@kadam>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20220517130315.GK29930@kadam>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR05CA0021.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::17) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70c394ae-aec4-4452-adc8-08da3807451f
X-MS-TrafficTypeDiagnostic: VE1PR04MB6701:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VE1PR04MB67017AD9EE3ACBBF99AB4DF0C7CE9@VE1PR04MB6701.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bJcDAnXq+YkEJ4szYwJTqyEN4CE9oLg2lZd2p3xrpvUxhfWIWr5fO8tMgPHt3SwNjn8a3dVr/yLu8mOABGXdDrkane4Fw1JG1WSKQf5U1oaGVZwuRRKIzA//C5Ja2oes4/Llh+CY0lGIC6R+v1UG90vbC+m+SAKHIY0HHoVqrMpgpT0NQRfSBI6rew8if5nB9QZ/EAQ/1qZgKJwQhg/bkFEajQ34lzY6+/PHdR9bVNu7VaVTPSnl+dmP7vSt/NPzjbcdvcIDCkSEY/iUJG8pplsfHqYZZOAAgshswKYCgvdkt7SH6kBUPZR6s4Bs68sR/+cDknxUwNyiZ8om/b6a3DusKevTaUtIYsvLpjyLjAV8py22dj8t9MIssYbQb0RTmLb0OITl6F3JHF6k5JoLXWejXdkO5vPp6/LYx9IdF+xSmyrziTcwQ1X16v92mkFQvrK0xo9+sMXQEg8b9PcgKzZSZro/0R1xk9OLpR3PD4JgVQVFeLfXhNIYtkTM9Pmv1f11zPKSLq4flZITOjVGq/zyE893QjH/wBCtspUmmH1boqGTsyEIGQyN1RFM9hRCf6b9Fiw7tD9ZrQFu7NJu/PlWX++Joudc9CDtkqzhGt17T3PnxIMuW1knCHA85CoC6GpHuXv4rliYnIADoJZIS2xntoxTab1607rhAGEQqMRdwbyq40JqRhG0buGnf4OnfX8UckCL28hXY+WpW5UsdZpFiUw5G+khf8ot9P4jekQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(6486002)(8936002)(508600001)(31686004)(6512007)(2906002)(8676002)(6506007)(31696002)(5660300002)(36756003)(186003)(66946007)(66556008)(66476007)(53546011)(316002)(4326008)(4744005)(38100700002)(86362001)(110136005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+FriNmbpzOnRwE04jBtsW+JogCTnA70TdJtqh8ycPErjUzXQo7Eb7yJ7cafJ?=
 =?us-ascii?Q?PQe+/lVgN/ZOVuDQZalSe1TA0p2OUctEb+i5BzFSQ5u1bp/TEvcJnOFDyj7X?=
 =?us-ascii?Q?o4jqL65fiKiZPLVBmCgNAyY5Bh0s+ui/Aa4cS+Te+8DlLsMqv6UfnOVWk3GS?=
 =?us-ascii?Q?kSFPI3Scm5g+3wswwY7acH7LBUMHyiBBFhv61wt71xnimGbguv2ZKGYDiOMD?=
 =?us-ascii?Q?+rAed0x4iJ8PeUBecblGyMVv106WBxDeAuPWOZuHoNmBonSJfJy4IiPVDQ+R?=
 =?us-ascii?Q?si/N2uXIi7tcxw+DOyC4qBNm96DJhjRHXw0hGDs2W5bEmRIpfs80TPNmPPKf?=
 =?us-ascii?Q?YXqcS+owAUeFoLuKszH/DYRAGUT0TMx5EuYHMG6fq1OntOp7LM1wwz+xsiXk?=
 =?us-ascii?Q?BSyTK/1mTZesDOya+M+sxjgM5MnChIPryDHqbEqPfmVFxK16NuK8gEbkOr3/?=
 =?us-ascii?Q?V27yj6CCoYGDYERSj9u4FllAOzA12QSZfOLAwgxwVlA+hfagPx6vwo+LD0ra?=
 =?us-ascii?Q?+Vl1Oe+o5MINph70E5MpwMALW9kIyE9WSp9CB0BYd69uK4/9xLX8WQV1peQi?=
 =?us-ascii?Q?LsTlgQ/4niAEzqsjX8TeKkub4gR/d52f+YvPH123uLFXzQ8AaeprXuk6iXec?=
 =?us-ascii?Q?t8T8MOqp+192Gcb3w5Aq8ctS1dwOkiqRJgyUn/y28PPIQ/YkXN38pbg4fFok?=
 =?us-ascii?Q?96xGOkRE7muOZesQ7HfEDc41uyH3NZMF1Su/F9GyUoq0WYlAA4RsCn6v0yrl?=
 =?us-ascii?Q?0eRt/wkp3eDBHwh2VGbCa9cKIWHPLoq8Fwq6qlGMlMIDc6/m+udIPzXAU0sd?=
 =?us-ascii?Q?AwvkRYUuOxmf2gFt3ujy5T56OUi0NarY8OWlmjuDYNjGs79XnH6bSVJ0A03b?=
 =?us-ascii?Q?m2LmXZnfcVh4ieloCTLzr7g2En2kz1TyAwTGnvTRf2PhPvPPFpndZIMz8KW3?=
 =?us-ascii?Q?JYoiI5caYFsNVxh9OK79TGVJraj/3FFawqtBmbV5Yss0kfm5g5Q4WR4H1c3h?=
 =?us-ascii?Q?PSqaCug9OWjqnC6nau+YigDjFQnYbjB7mCqIcXJWr0Lo7N7HRZftWZmRUlWt?=
 =?us-ascii?Q?BDfS4OFC7i3YMGu9o/6VqdKQDt1PxoNk3HVwK2bL+Ihsp4wA0PCIF+7XZH95?=
 =?us-ascii?Q?EkqgF4x7ds7OugcJ8m2tBeiGAfMprPG93H4wLMygPpP6KsFI3ExZ5pT/Zuyw?=
 =?us-ascii?Q?BAlxc5OAvme/+2Yw0zjuQ6Lwc0hErA65MCQEaWvJaEI0zU+KShp4uH82ngWf?=
 =?us-ascii?Q?f9o/IicqM0FkrFJe3lYb602Xpy1blLC+nyXdOsLIeX07iKgRnjLvteZCq9oC?=
 =?us-ascii?Q?NheUQI+8Da5Acf6U73I8hF/+yT+rGn8asl159Im5AX9mcvY3tYuZOw6RwPsq?=
 =?us-ascii?Q?mJ4+8UD7YcMgxsBrwSfyib78CzpjQAATdE66aVwTZTKPe3er7qqDFKenTqUE?=
 =?us-ascii?Q?mhpb4Mg/lRSq4F4QC6gQJQ+clbh2GEl9cEgoYo2uf+cexLENRhUedMcVj4aa?=
 =?us-ascii?Q?8HJ0s1DSipICMJ8fUNJZ38UgbDX6Y7pxRLiccNm6tCleSc46d8GiW89S4nD9?=
 =?us-ascii?Q?Of5XRKJOpJxw/4OXIJYqzwzxgJj1nkyT+/JFJdtXID9V1XQtDuIwRR2CZAc6?=
 =?us-ascii?Q?Lb36vygVG+EfDdGWqz3tFfwwkdKhdc/EP89cKnS+4oYuv4BSYqeX8lpIyVGV?=
 =?us-ascii?Q?QGXyMLpf8LvDnseiBJTZKC7CfYhAZNJ+iAbaFnnk38XfbqF1pd1XGvbYijNV?=
 =?us-ascii?Q?p778SNNvFtLin9toO6GlVl0AAyqkSpW7SOo6L76wh1l3lOBMlbvyEc/thDJw?=
X-MS-Exchange-AntiSpam-MessageData-1: EaclxPcSdM3kSQ==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c394ae-aec4-4452-adc8-08da3807451f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:15:10.4164
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NIpAzWjCX6KoioPbrjJYQJqjsj3p0/XnIyS1SBEu9INC3Oqttb6oRuUhqaprqveJsZ1ntw3Znj2BzNaUqYv9uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6701
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 17.05.22 15:03, Dan Carpenter wrote:
> On Tue, May 17, 2022 at 02:54:47PM +0200, Oliver Neukum wrote:
>> This should be taken as a minimum speed.
>>
> Did you find this by testing or by reviewing the code?  What does this
Review.
> bug look like to the user?
The device will refuse to work if you connect it via a USB 3.0 hub
to XHCI
> Presumably there is a redit page webpage where someone discovered the
> bug and instead of reporting it to us they just told everyone to set the
> module parameter disable_usb_speed_check=3D1?
>

Now, that you mention it, it isn't on reddit, but yes, someone's blog.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

