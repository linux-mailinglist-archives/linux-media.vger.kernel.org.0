Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DE4A5282BF
	for <lists+linux-media@lfdr.de>; Mon, 16 May 2022 13:00:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236439AbiEPLAm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 May 2022 07:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiEPLAk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 May 2022 07:00:40 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AAD2F2B1B6
        for <linux-media@vger.kernel.org>; Mon, 16 May 2022 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1652698835;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wFF2dQ7xxxTQU04X8lsrvWdmt5bhbiHxkaWRJgLPudg=;
        b=ITFQWAYS+tqIhdNCqEK/3TQarcof3bT08ajBiyl4JDfijyUxRz2D8cwxD+TwtsloZujLHP
        9kQvk6VP1k2jbBFXzBVHr1AQZYYDYfjvqkEamngqu2lTgNpW5BREatGXYW5g9AXWfWwzr1
        ot7f5OqzzIXTBVUwRpgDCKoP/GSVAsw=
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2054.outbound.protection.outlook.com [104.47.13.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-x3Tb-KPkPTWxV9fZ3IyH-Q-1; Mon, 16 May 2022 13:00:34 +0200
X-MC-Unique: x3Tb-KPkPTWxV9fZ3IyH-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SxHg9Ni0U01UlhSdMpgvyRpYecOZV2FM89I4fpRb01zlC4eTAQrLGLODEN30XJprD0NWDwKiug80uLjK9n8x0YT9MN6CGiGkOdQ4tUVslnckPHB/HLfNans2CA8j/pRR77WUwyS08QgBEdlyla4S1MaQoTMwo7owy2MZvlNgwYrkR8QXukmyujO/bu1rX53Tsw/76x5ysW/bmnGS3cHthpas8MBqH/fgtfemBiWvmR4txql4rTDY1BfnpaKBENUZszafSazPHeW3AD9Qs6KFrthGFCtKYZXw+j8FNnHtbLDNVAdi+HIS7xfiJ7vuFORspU4CxpqBVC67UkrwzXrD6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/upuKrNGUxsEfAa47gqBeEHnjw1yv/cbVIYF1CVbEzQ=;
 b=Ru9r0pVbbDVwEmEuxdRhEoyIgK6QQo7C2FWyKTSG6DSwCJe7E8AmtZdsJ8eHuKRh/1rfv0dTLEesgUzxabDxTD5UfLzP6NiWBWZmjboRnEA7AwUVBfM19qGUy+XXyijg4NREgSKM7J00pKyOS2KAPXUVn2b8q1Tm0WqJFfLy1Lh1NqsWUebUJWc6+FNIq0Lsr7Q5REAgOasulMKjxmOx4v1NmTWzFP670psXdX6aFudVT3+GG5UP55cHO/V6ljkcQwpeu5bSvHh3cUyJBg2qV7ez8XK72dhk90LKF3Jp64iPu7gcO3zvz5BCnz3Q/NhTey4QXj6O2YZfwhWZURJoQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VI1PR04MB5215.eurprd04.prod.outlook.com
 (2603:10a6:803:59::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.18; Mon, 16 May
 2022 11:00:33 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::19e2:fafb:553f:d8c%10]) with mapi id 15.20.5250.018; Mon, 16 May 2022
 11:00:32 +0000
Message-ID: <2c6478af-6247-0cbf-8761-7ca288522f7f@suse.com>
Date:   Mon, 16 May 2022 13:00:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] imon_raw: respect DMA coherency
Content-Language: en-US
To:     Sean Young <sean@mess.org>, Oliver Neukum <oneukum@suse.com>
CC:     linux-media@vger.kernel.org, mchehab@kernel.org
References: <20220512130321.30599-1-oneukum@suse.com>
 <Yn6F87BxKsOaDYR5@gofer.mess.org>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <Yn6F87BxKsOaDYR5@gofer.mess.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0022.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::35) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7277b73-ca55-479b-e827-08da372b4c03
X-MS-TrafficTypeDiagnostic: VI1PR04MB5215:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VI1PR04MB521586F9C693BF0A5BD5A797C7CF9@VI1PR04MB5215.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NjF7V0MS8gCpQZVVD9uxMwsIi66bYsWj8Hs9SzxXdcTiX4FMXDVKFzRu6sxdMANV+M+Ka8JKMPHtrrtqZnDc4ImlG2gyjhAHjOSjWdSxtvRORjgyZUT0LmOwhuWqxIEXqBX1dUrN7d67CjTN/kfL/KuNRboi85ey1DqpIIffHjYm5L9Rq0bKmE5zrr4kHdr8qpcuNTh4hyAAhAl716guU+4EbvPNQfZo7hUmlAhsnzHB9tTliD8Nbn/G6trdMKsATvC9xCHfkRn9ztsNCGFgSA+Auic/F/TNB57jKizpv0wjqOmHH/cENxG+R0RHph5JKPznrUW34c0cnhCAjNvMmr0O7dRdQr7fyNerfa+84iK/WwvFAQBJC+6aqnGx9pbpf7b9495J8ViyIvFnWMToiAEC/qCI2Dm2uAZPyAVJ+494mkPiqQjVKe/MVkp5PFmjlHb4AAm6Cs2GRSxIx5Ygnz5mQuxXdT/gIJ4aHRSuCp9WQcIhgBkvV0x3QgakwyuInKC0lvCoKaQYlkJixlmG5kfKpSCvb/bJSGrOc8WGaB+j0chyrd45QkqnmbErnWkQvWpgvzjFMRWvza1SYMVx7g+3b8hRlaX5++//pAfL7OFMv4IhDXkBYGc/mpL3U8jq7IWpf1sER/Z17n7JwUqDyeIWjxw1tsbXmtjB6ofbwXKwr62DFOzDw7Od5clMkJiw3UHfQiYhOawGWOaKD3WZDVFzOUq5ONXeplx1RIzZnOo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(186003)(83380400001)(38100700002)(36756003)(2616005)(110136005)(6512007)(53546011)(66476007)(4326008)(5660300002)(4744005)(8936002)(2906002)(31686004)(86362001)(31696002)(6506007)(8676002)(66946007)(66556008)(316002)(6486002)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3VAhAiX72zZWq4EM8IhRhpmd8V7GS8tZa+rZrmCtu9j3k9UaRFv9Zg3ZtRRR?=
 =?us-ascii?Q?sPQh4Dp04rR4zuq0uOMxnQuRyr9NPPg8Ln5AvO0EMYTXDESDtXzo/JnOJ8VC?=
 =?us-ascii?Q?nJPt7IuozMbRUeEnhG+t8iZYW4ke5AuoRnt2RrnCXUpH4Wn4zUALCL+Y1to4?=
 =?us-ascii?Q?v/X5jU1xSLSwm0yUTCISG+thnLOJ4hd+CQYdIZUZQMHaEQTP6F/ifF3mZSX2?=
 =?us-ascii?Q?pWxMUwRmHOoYxk7fMvqPOrf38j0p4snUnV5KRUNpImWelxyevmRQb9MtHaZ6?=
 =?us-ascii?Q?2odFvdEih2xcptlMQDHuKl49MtIxj5gE7pe8fKkCTTF3GDESz/fBFAWeWbWB?=
 =?us-ascii?Q?vNqOd6k1l6jJK/ibpYPSZFtbCNh2kA1A0Bt8nKuj70fA8AHsAseL6rwspUBy?=
 =?us-ascii?Q?kKfQRr1NFRQSNDC6yMqoDouZbOVpq9pOSP/m0J5nE7ec53Euap0C9z0gUYXH?=
 =?us-ascii?Q?fqEHckJky1Qj2sHuFq4B8Ckt9/L1NvRxLdXYnhIK25K3PbjJShgYPlDYvR6F?=
 =?us-ascii?Q?Z4jG6v5KzFZTsgtbN+PfmIEQK74uwZzO3ErD1fmQk/B4iiclAKtK7NPPWQtz?=
 =?us-ascii?Q?LhFdX04P7uRvmOnaLe4fx+oOiJ5NVxwjXpxeDV62r/VOtuc3tpWD5KpbQkXT?=
 =?us-ascii?Q?j31pTdUap3OK/4ud0YGjawFd3fbvnS0F6Dk8ngUll1KaBhAiHwzicZhpP/UR?=
 =?us-ascii?Q?VuwYNpTjgoDSJn+NwRotJ6DAg0aKDXLmbv8caZP74yfsldfPVYEk+CuEEL3d?=
 =?us-ascii?Q?dT4y2Rqeq7pAKSqP9d9SK/cVuj9AYXPFhdgnX9rIG9DPmp3wQ9JHNvtdTwAQ?=
 =?us-ascii?Q?EN6y78X1vAS1cCRZ46T3ZROYhLJ4Zuk7DJVq4kLChURsMV4ob+dTaxQ7DQsO?=
 =?us-ascii?Q?QRMI88ekeTWkEZlrZKU8/uexRPKVtK5SBJ5AmJBDMwwvwv+28adg+p1aXuaO?=
 =?us-ascii?Q?cu9Rf4S2gIJGOmzXhqdI8f84SPSqOnd2+QoA4DSf98TNwFnXkd//FpWpY8sI?=
 =?us-ascii?Q?u1/kPC67KeScV+pcx7DVMqmY99jUTZVFQKpW4qfy/DBM0tl0lQ4MIA9wAr46?=
 =?us-ascii?Q?QZxHBtGIAa3CNUswR7MvrC2ZKF0libnKXWxyma27Ck4KZ1TXXASs3qhFI5Vt?=
 =?us-ascii?Q?dgbIJyv/QQPVwzGoxMgiEUKdTb6ArtR6NiKtbh1ClP6h4oVZSSVlz7sKAUYP?=
 =?us-ascii?Q?iQL6COYRsZdaZn+cxl/pyb27l3UTunuSwEb+vb1UGXoHEOBDnykJpfD4NEFy?=
 =?us-ascii?Q?zLQ+S+Et688N2F6tI8UfNR6qssEZXtGrXEBDwrsywIVa9N7MtnAdhG3bffwc?=
 =?us-ascii?Q?waWO2eiDSZ16RO4iq9LSoMSk+tjs/GAwekbgPo/64p1i2+CO/aEjSNl0Ln+g?=
 =?us-ascii?Q?uxiXa5WAl2+OVe+V/os4JpoaH/vB99JylrP+DUbaTjrOL5HTEcW4NFJUEBaK?=
 =?us-ascii?Q?hR9VltzdAmsea+sqNcnvy14L4X0rsUhsdkcQ+Zf92pvxVth0/fqkrEtAK1Xh?=
 =?us-ascii?Q?7B5pombZutFD0yLKkMmpFO02GYBAGrJnZctBCRDl9avXGbBiyQWdJ2/pIGSt?=
 =?us-ascii?Q?gj15b2EzN+cvoAX1kpqTe3LPXeNE0TsfC4PA+pfuRe//9mLLD/9tgy82UkuI?=
 =?us-ascii?Q?8eylx5oBquhRR6yyYf5ZPS3WZdmtN5bTdrjUcXClHYT1NTcnKYr/66QLhabF?=
 =?us-ascii?Q?LpYkPkkIA0djZPkUpyfRSGYXSUSjQ9D8PCda1Ri0nhUd33qxhCI7kdhhElEN?=
 =?us-ascii?Q?TxZhvZChEiPl2SeqhYBaMOdp8wliqi2N34RTBd1AwmOqF64+laZijP8M+qBQ?=
X-MS-Exchange-AntiSpam-MessageData-1: nhHVGYPa/ac72g==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7277b73-ca55-479b-e827-08da372b4c03
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2022 11:00:32.6979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rB5v6G5pGO7CK8pqOV5EzSIWc07otcVwHuSQT8zMfwTUFJrDpKZ51SIuJZTi1NWnRk8xrT+f1UMGNHzA75LYLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5215
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 13.05.22 18:23, Sean Young wrote:
Hi!
> On Thu, May 12, 2022 at 03:03:21PM +0200, Oliver Neukum wrote:
>> No buffer can be embedded inside a descriptor, not even a simple be64.
>> Use a separate kmalloc()
> This patch needs a tiny change from be64_to_cpu() to be64_to_cpup(), I've
> tested that change with the hardware.
Needs? It is certainly not wrong and the subsequent logging will be in the
converted order, but need

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

