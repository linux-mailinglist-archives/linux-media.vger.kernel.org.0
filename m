Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6FC5517F14
	for <lists+linux-media@lfdr.de>; Tue,  3 May 2022 09:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232399AbiECHpe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 3 May 2022 03:45:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbiECHpd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 3 May 2022 03:45:33 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDDB637BF1
        for <linux-media@vger.kernel.org>; Tue,  3 May 2022 00:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1651563720;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VDMxT2GiadU/fJZbsT4xYbKd8FHBCSFHJePSM5SjKwM=;
        b=Q90QYl8VPgHtpfBk+OwbGGvJvqswsW5Vko2DNMzVzsgPcQLx3GDf/peuGGh7PfPm1qPVFh
        UNY5F6d8ESUqWLww4LrFV6fEGp3GTQ1c4iqPh5BMA3yGP69JVg68rtp7J9+Wxo1tKo/tWl
        TMSCNwUxr6+KNWMkuzZZ42EKo58Jmo4=
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2051.outbound.protection.outlook.com [104.47.12.51]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-fsGUuzGOMh6oYPv0v-RFCw-1; Tue, 03 May 2022 09:41:55 +0200
X-MC-Unique: fsGUuzGOMh6oYPv0v-RFCw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BjJFbuHZ1ts4QzvdG9TL2uJOGJvwT4gaePff9uUDR7Ivyu+UR5N+vOhD1NYYGoX57yLf/Vd4mXoZ0C0cLHVMq6MVTR4Tar9ukYNzg7sL5PZV6nrkeKJuKyC/KyD6QQtEkex6aacgAzhZGWjjVkPW2JOjak2PlM680TJgTe88vBs7uRndp41PonwyTzyAUsvGzeTz8Vd5XpFUe3KvBwRCS9pPlnX2ucAISqdqeORQpO2pzxHNkLd0k/Wl66tX2Wb0K+kKHDKDsQG0DeSHzAxZaROzuE2HZlWqzX4/zj5g9UuBvysEZaRLxhVesgSh6d5jdT20kZeAK0qdvwn5AsajlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z6gWoWzQtIA9c4QzS8v2744nWtmotqZLEGgxAz9MY8w=;
 b=HdlCrUsaWCOVHBCyo85YCANMWgj0KI2evuUABT8jH/i9T6WheuYnMUMg7E3dSdu1o+xvCUO+6SBt9vKjtESC83iAlAm32D5U/EIo/I1EMlh5BXKBJo7o3uMXG7vIKP/IipqmteGZsya946nNB68GbnBZFzVO+/6MkE744e3NkiKSNBUROrqRwe0Moa5b1j1KFJC1RC6SrkwMT1AbxPZxMMgdk7HWoHAvvorc3Gty9r2scOU2NEm4ZcdyQfPbB2TcfGlrQdBLgS2QGICJhYpdv6JJOtj2NT8co3r61hOMzEbEgiou0WU7Go9NL4Vu//ygZYAJA1DWAtedwlDczhbc+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by AM0PR04MB6354.eurprd04.prod.outlook.com
 (2603:10a6:208:178::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 07:41:53 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5206.024; Tue, 3 May 2022
 07:41:53 +0000
Message-ID: <92cf40db-bb38-a85e-76bb-61e985947d20@suse.com>
Date:   Tue, 3 May 2022 09:41:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 (resend)] media: imon: reorganize serialization
Content-Language: en-US
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Oliver Neukum <oneukum@suse.com>, Sean Young <sean@mess.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     Jarod Wilson <jarod@redhat.com>,
        syzbot <syzbot+c558267ad910fc494497@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <00000000000043b599058faf0145@google.com>
 <5a06c7f1-9a29-99e4-c700-fec3f09509d2@I-love.SAKURA.ne.jp>
 <YmZny7mzugFe0t+X@gofer.mess.org>
 <62dddbb9-3053-f284-f9db-3beda5e8e951@I-love.SAKURA.ne.jp>
 <YmaMY/XKBmEfl8i6@gofer.mess.org> <YmbF071fSKUff6R2@rowland.harvard.edu>
 <YmbKiPna01aMQhJw@gofer.mess.org>
 <349f3e34-41ed-f832-3b22-ae10c50e3868@I-love.SAKURA.ne.jp>
 <Ymel5XtWC7rwpiXF@gofer.mess.org>
 <e17d6647-2c65-638b-1469-f546da7d0ba8@I-love.SAKURA.ne.jp>
 <21ffa07a-1bc1-cb1f-eef4-6c3a73953061@I-love.SAKURA.ne.jp>
 <6ab13405-b942-ddbe-c2de-dd193fe40795@suse.com>
 <1b7b9a2a-d52c-ff35-f32d-d22d7980a80f@I-love.SAKURA.ne.jp>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1b7b9a2a-d52c-ff35-f32d-d22d7980a80f@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P250CA0018.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::21) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 490c5eb3-6717-4483-eed9-08da2cd8645f
X-MS-TrafficTypeDiagnostic: AM0PR04MB6354:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <AM0PR04MB6354216DD75FA1AD5EF7B2BDC7C09@AM0PR04MB6354.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: R7YUceDofVJGP0wIWC5Z9bwe6wZdOdshzCY7dU+Ov7InQPoWVEXRR0NHlPkOhGkCRgcz5mIUMjMwjTs/BkgADwVXBWZ2UM/afW9kIwnAT9M/W6djGLtoRkUNGQXR/n95W6vWnyR1JLS6g3B6zKGGg+axkKcubNxzSNpj2oOBB9Hh41McrUiKBslwBK8cLwtJCdTA76+dNnR/90irPMr99ISQQajoIh6IwdkhpMlPPxO0RPRiaPM2ETsJNs1grCy4Lue0kJlumRNLCTi34d0uqzXDbWrXh82jM2kXzdDm9PYbEcz9QwHQhK7GEFJ5emPe0MshFtYGX+ckI8w6HZ5n46M9BPQGtkd6q4OiSPKP94WWoS3aXt5uvmUkNwCnuKcaIA2A9c7UOirL6kbuONt/3v12OQ5aN22qLsfyGkE/d4JVG7SPMJr1ym1o3xf9L9Rh1DyvYCOfIml3EApiUsbTH8iW7P5+vlJu7s5mpLXUTJYbNI97jx9lSP6KPvsVlK5QcWXIc1/RCwgg2wcjB+Up2OOK7q+vPcngy6AAKIpl1CKTS60ke9XktfZcnQ0FAUl3EigeC+W143UTA656i5jItp/6XX16GqKQjKbtQV6XnLVtbRsPYDQfcC3mDqszYahAW143slrbmN4IKAYiBVS9OCn2GiWvB5ZRyZ6twKo4j7XY25ndL5XH/wSQ8Fm1w0hehDXWCxqKUTlzEIAW/DFSir6NB3BCTfOheadUQhPf0tM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(66476007)(8676002)(86362001)(66946007)(4326008)(31686004)(5660300002)(508600001)(66556008)(6486002)(2616005)(54906003)(6506007)(6512007)(53546011)(31696002)(38100700002)(316002)(2906002)(7416002)(8936002)(4744005)(110136005)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kiEusewcRE1LI2c/F38ofFGECkUMeGzmqw39wUmijJ78mzzOTaH1RdEw3tC/?=
 =?us-ascii?Q?kYjxmu8Jq9R13LhV6dta7KXYu5LCkrFB/R+ju7QRhKuAQilfU2I3lzNrnCKK?=
 =?us-ascii?Q?VB/4Y6aoHamHqelO8SSciEniCTYC/DS+lRL7spq/goJwVIExtG3umyvd6m/V?=
 =?us-ascii?Q?5cq5VujffVbMRIE2D2R72a14+8hZ3fQZY4ylbqAlUClc2xrBRiGrFNH0LHuZ?=
 =?us-ascii?Q?EftSrwiA6VLkrq7TYtxCtmr1JyNV1+raWbsVxGNBZzfyhZrado3MM30cBC94?=
 =?us-ascii?Q?CQgwElHIL0adtIMAYX6fYIB0i0WKrM8Ua3jQIV935biiXCaVjhR1ssPEZuoj?=
 =?us-ascii?Q?Cu0/tODw9L6ha6QKmyGXcFNsDrkPl/Tm0Ft0E2V/bVZkF9vklpNcaZhYCH/N?=
 =?us-ascii?Q?RySMMvpelC64ias01dBEde4DxNhTaFaYVfEYHtLgUIN4vSxHDNj1rj4fSCl/?=
 =?us-ascii?Q?PUur6VOaf+D+fHe+xohszIRcwL+DlWwMkjeFgsFpSmgCGWKqcChNdUdzqYIH?=
 =?us-ascii?Q?JFNbHFhGtSnLoGJec/eszkSRDLdkUTSiCX3JPX+a1ibsgz1S+kWACC4MmeyW?=
 =?us-ascii?Q?dsWFS+2CvZXq4rvK/AawqcV/n3/UsaSHvSRUxGrFVzlU9vdU7+TJP7I4h15P?=
 =?us-ascii?Q?PWg0ltzSTbTZdpNpFNaaLtDDrz5f2rx70J0DCyZEhQi0CJBmmkXRT5+BlBCg?=
 =?us-ascii?Q?O+ejQPqx/WMyCOb5NdoI1VaVbYUaOgg1W+yVBS5LJkb81lqirRNCVWdOu/qa?=
 =?us-ascii?Q?lHnCr7FEi4sCahqmNglne0pYz8PKC1feGYiH2gUntq8JnpELkfyUOJKwzdeR?=
 =?us-ascii?Q?9Nb4ef+2egOoxaJ9oomDNvlFnk/8+4ck1KFRyFgdAb39cp+EEbfIqpouYwJB?=
 =?us-ascii?Q?uGOW2z3AYaLjid/Wzyt5fqNg7o7wwMj+PS1xCw4wwg6eBlD33XFMjeYqCQKO?=
 =?us-ascii?Q?rOKEMkGqkx2hh3WwLDhum+rmiTICj4HN92bCJgMBc6rO2H00Genkyvl18DBH?=
 =?us-ascii?Q?d7/6l3p6DZdX/YeaWwbOp827P0A3nO2Ki9bl2P3LjbrzNt2Vk55S7P4O6CVx?=
 =?us-ascii?Q?u/weT0OK2ATPFJ5+EaDo2VhEUFuGn9mtbYQG4AWSkSNvLlGtGrIjkW0dsM/E?=
 =?us-ascii?Q?0ODwxN2ZDs8zYrLe3v8HwJRbmjhAEVnQDumM1nNqCWllqaZyRZrmijG4OR6U?=
 =?us-ascii?Q?7Ho9Yu0hBLQm2/Vpw38Mv/+AtKO2gyWI+NoJ1RG+akw1fmAb1WFkvxeOFuWH?=
 =?us-ascii?Q?+N/IQoe0xQwxfYEgdQIt+nQDyg1i+uEPE3wDBksm+xKiWmhaYn/l68J5d5B1?=
 =?us-ascii?Q?w4gQxV4Ad/DiYYNftS+FWkhfJ6mDdls5gaIsXGWqkSherwxnScbhUE6Y4m8T?=
 =?us-ascii?Q?hBHZCGUZPrhuIY5SF56+QNBcaXC/vG1BOKW6/HDIKnZfqw3YlQVhF3KQJnud?=
 =?us-ascii?Q?eONO2AP7e9ccrZQJGbkYNMg5sVSSg32XIa/sy08Fhj9TNBOrLmAt6kZoBSWl?=
 =?us-ascii?Q?ZymnsnjGRujZCOdfK5OlVxmvlrNRBtdy9vDGvOEKVJyuGNhdpVBllfMCCE6T?=
 =?us-ascii?Q?g8BValaard5qOoOpc6O6IpzPzEVTONWyHAyryr85AIMbMtJKrZXQvAqFVor0?=
 =?us-ascii?Q?B7fEuMDDnCZO9gIAoWIG5Xv0vlWl+kGrHkWJarbWhILAgSCq9o3uzLb23HAy?=
 =?us-ascii?Q?I1Iln0E//EXaIMSS1J/YFoYh/2BYBCv8RbrrPToyt0oiaSE9WxeehR8CDDOm?=
 =?us-ascii?Q?SMesoOd35Abz6zk4vE/UYNr439yE2zj93mlak+3ckes/Tt8PgaSMO9YeoR4r?=
X-MS-Exchange-AntiSpam-MessageData-1: Safd6ramGBF29Q==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490c5eb3-6717-4483-eed9-08da2cd8645f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 07:41:53.6475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xjMIeCf3tasoM0KTroQS9wFdqk8QYJo7d4VxSeCkJcTeXsgSOPVfjR70Da/sUKOmaj5iRmym1sgb13D4uncTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6354
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 02.05.22 13:05, Tetsuo Handa wrote:
> On 2022/05/02 19:46, Oliver Neukum wrote:
>>
>> When could this ever happen? Either the device is disconnected, then
>> you'll go to 'exit' or the refcount will go back to something >0, won't =
it?
>>
> (Step 0) Say, ictx->users is initially 1.
>
> (Step 1) display_open() increments via refcount_inc_not_zero(), now is 2.
>
> (Step 2) imon_disconnect() decrements via refcount_dec_and_test(), now is=
 1.
>
> (Step 3) if retval !=3D 0, display_open() needs to undo (Step 1) via
>          refcount_dec_and_test(), now is 0.
>
> because imon_disconnect() can be called while display_open() is in progre=
ss...
>
Hi,

thank you. I did not think of error handling. You are correct.

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

