Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C86AD516E5E
	for <lists+linux-media@lfdr.de>; Mon,  2 May 2022 12:46:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384638AbiEBKuZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 2 May 2022 06:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384700AbiEBKuR (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 2 May 2022 06:50:17 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.109.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BFE4222A9
        for <linux-media@vger.kernel.org>; Mon,  2 May 2022 03:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1651488386;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=2U2OZBeF5wzxN+2v+C9Azbxa9oq81nOcNIA8Vyk3V2Q=;
        b=NFQ7FzYCNCOetvz3bbohq4aE/Ri0Uck67Odf8wMuqp359UR2NIzJBMr0QNLily+fDvI3yG
        kYs2mKfE5gq2DODl3eLCjP4GMdcUZogsSEz0eXmD2oxOLO1P1V9yb0fCwTbPY0hlSOQL4j
        4mY/GUbj8vC/D7n8hQeKy5k2Shss26w=
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02lp2058.outbound.protection.outlook.com [104.47.5.58]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-23-gjUNqOOfOdK-fbgEMPtl-Q-1; Mon, 02 May 2022 12:46:21 +0200
X-MC-Unique: gjUNqOOfOdK-fbgEMPtl-Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIJG7FdtAEHiSAe9F5BM8Qwcvb/oKgOsLEsogh+5XittO1Zl4CNi0wB1FAb8yhBLAc913PiiGRmqDybaqHkRIcrEWQsGvjhf7xnilNEbjY3R5CM74Tqu1OTkF3KcPBKy4Zh6gEsfzwM8SormOWYMm5GqyQNfZwcVM6n5aXWwrUrNANgN8JtjUsnmqwb8aAvj5F+5mOYBSmhGp//+jOJBnVQTFDAk8kd5fz/NoQRMAJ+wQ2l/Qcet+43ENoJhvqXgBkvsT0eKHAzIh8ESg3RsGl5CpuTPVfxIvT1zeRrMx/ZNldRJ9p4mb4EeD8Vlq2UTNaqYe6B0KbDc+Aa+RdhYzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N51JMwQG3N4Z2HYNhMNJ+88YGwljrrVk/wCV5RRqZnw=;
 b=iv4BiGTh7LOL8uOjMI59gEJwFk2WtqNNczi1GE+mjmCoMtDRJwF/NnzaV1N6oaWzBg3AvRyZq6KG70aJHN3nRDFcIhOF1s7g34lrJ51N+hYmlY1sTn2Plzs/YJuwqhQNRC6fajKJZ7yoVUAa2FfG8HyqoMtwxqn2SF95EdNqsPJfNgqtHH/+x1/WLfgOJTDkkRE09/Vuc9UEpPXETPomGv8051mQatqFsmbPXsgKkyqoz58ymSKUgb3ulbsj9LVZnbrY74qLIRAG/rGPTgv9MjC0AuUbSm29LMHUfw6yu4x0sMep4mFqw5wSStBLtbQVMi9auSbKABQXw89dAJ6FBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by DB6PR0402MB2901.eurprd04.prod.outlook.com
 (2603:10a6:4:99::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13; Mon, 2 May
 2022 10:46:18 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5206.024; Mon, 2 May 2022
 10:46:18 +0000
Message-ID: <6ab13405-b942-ddbe-c2de-dd193fe40795@suse.com>
Date:   Mon, 2 May 2022 12:46:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 (resend)] media: imon: reorganize serialization
Content-Language: en-US
To:     Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
        Sean Young <sean@mess.org>,
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
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <21ffa07a-1bc1-cb1f-eef4-6c3a73953061@I-love.SAKURA.ne.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR0301CA0034.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::23) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 560610d6-854f-4e85-a062-08da2c28fcd2
X-MS-TrafficTypeDiagnostic: DB6PR0402MB2901:EE_
X-Microsoft-Antispam-PRVS: <DB6PR0402MB290197B22029D762B9AB01E5C7C19@DB6PR0402MB2901.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CWGWHnrL+phLz41GpXsy0Yl6t8wIIr805h2uO+Om7S9R5JFfYYpJlzpl4bSK8X7F6x8ny309krNBX9I+q65LWfQO2DbezccQgnk09KnBQuYRMyMrCn0WqDi8SYTGOoZZ+mpYy+sl4a7IXhn09DgCobCMJnrwpfSK5Qzf2d+RWjK4uhZbZS8EnEzu9hePhRJ6FbvgPLqq+82GDgldeIRXXyRJtTw/qwlDthuFW1OQodU1QPT/yTXyJqSSLvPsZwWpY5YRMn59zTHqyKAqbBLDRX4LZqqflQvkNSwchaErJaTD1ZSnN79/DRdKk2V+pVkhegIiKDUV3yM5BOD+BUv02BcMrrHfri6FZJGijJaql+RLhbJtQzwP+Sx4DCSYBKZGc2/tp5NcbZ3PfKquAEBtMLmzc214dMATXulWpWF3apwroitZO3le1eohymEJv/lbbG9v3BMCciM0DMLl8ONtGcuKmLqYxZrfjwogNdnuJ/kB4atsbLVtS+cEODk5f5nYfAZvvdarSCgpb9VGdaqRNyXUTSg1aSuovnakKPNJzhoGfaYWU5MNeFBIsFMrCDdx8dK/AiqsCTYYJv4vtVjYoUTxQ3DA1ym7G4Y6QdKDeOxfvoL8xW7oIDHLyiSZwkD8GWAkol929+if3FGOMZBLG44tw8IbQSC3RqkHeT4bXhpiS+dDE84KalTiiUEotNxsA3CNEUVXoQM07l6VejX8PDzoU9DCfe8bhnVVTO89AU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(110136005)(8676002)(8936002)(7416002)(4744005)(4326008)(5660300002)(36756003)(54906003)(316002)(6666004)(508600001)(31686004)(6486002)(6512007)(53546011)(6506007)(2906002)(66476007)(66946007)(66556008)(83380400001)(186003)(2616005)(86362001)(38100700002)(31696002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oh17zDdV95JxzGb3hyIxZ1ctyXNepJHxrI0sfvnuOUO3ChtPkhQWU/ICXTz8?=
 =?us-ascii?Q?1Z3RWcUYuKXJ+8vhNDTD1z0eGuw1ArF1rlISyy++v/SA+Nx4GWjE5CFgkocx?=
 =?us-ascii?Q?2k22917RqtLbXSNQm9IeNdecOeVGWz72AXBjKoqXloyGBDaN5Y+IYonERZ3H?=
 =?us-ascii?Q?1KCnkOjqHOO7uGGzyKc/x05L+Q+V9VVKIMLyvanZv7PaqkbuW20cIwp99DKo?=
 =?us-ascii?Q?8LVLYmYzcXu0myvZ4GxMwOFJylB3KDId5Wv5MwTKrwaO2ReKIRrToJXi4uA2?=
 =?us-ascii?Q?1+fghcE/YYQF9yCR7lEkvbuFWZ3kwPaNbNHaVZAs78GmGyWynXmq/Riz7vhE?=
 =?us-ascii?Q?QHQruWjD3DRjzHjgjvA8UiORP6GnPOM0gZwxqHWfoTQuGB/AJTxMLCPOSSlA?=
 =?us-ascii?Q?xioJabUeFwRufI7dVKwJDvLqml7V5kJqjFq4sclrvIfil0roCTkeF3x3ajO5?=
 =?us-ascii?Q?wCerAb166TMizJ/s+zr6MeRNBzbQM9HfFQp657mZpGhm5rqZd6aO6siEYnO5?=
 =?us-ascii?Q?LGLJR/1Yy28qVGlNocQo9c6NNN8SKTkWHAu39ZlFqU7tgg8QZKBF1ONFNAXz?=
 =?us-ascii?Q?Upl6SA+lf6DH4YyLWR9Cqoc+yDxhHeMlZO04jPrFukMsENaodMlpfEmYTFpb?=
 =?us-ascii?Q?YcvCSqrD2lLndOg3kVruGTkufcRgdJzgUkYoW6cFNbehmnqcJEfWvYJIpS/P?=
 =?us-ascii?Q?BHRbaG33aL8EZMscH3cTLSkO0a0Mz1fk7CaMqXkFmJxH0fkNkIQX/umZjSqz?=
 =?us-ascii?Q?uRvqttTtnqYRuP56vjRTVh+Gh9XLLG7LJmIEKWRbwhaNHl61wmkjLh9vVZEB?=
 =?us-ascii?Q?FS+Ov11b3y3y9b0LIkO9emY6tCREK+9SqRZre/0017gaL9umVyQuKXjLxBvD?=
 =?us-ascii?Q?bmXWtsXQIcIPV5s/ReetFjM1/PjbGZK5CYyuonEqpKXHuVryUhjIMqZNipE7?=
 =?us-ascii?Q?U+rtKLcbV2rRCcumQdSexOEKAWwfmBVX5w8bGqzkWIkyJcT9Zi8sw07aKQEp?=
 =?us-ascii?Q?CI781IQViex6v2D0uuE0lNbaalaKfJuZHKM47ZnBu4NWZ5wSAWa4vPsorRTp?=
 =?us-ascii?Q?t/m7aebSoI54MmWWxVgwm/7dzU7pCRV3tuu610mqIMzCxSf5zMJHT9zWNTW0?=
 =?us-ascii?Q?7TnJm/y/ugPPAN4EomnORLoIdPnMpVKb8lrd4inNtQ1Pg2Swq+ozNer6nFvM?=
 =?us-ascii?Q?UyyNJCNSmfSiHkOD1w5trOeskaXvceDvg8I7bjhxe7Bdprc1TES7PyIzuX8J?=
 =?us-ascii?Q?XZP5z+mAq/FwqCbEOgbkhcn0yOk6x2x7YaIJxFVwCMVCQ/pE+U5iQya41B9Y?=
 =?us-ascii?Q?OIbLamVhBajfcfn6/uues2mhdu7VgOnERP+uVq8MLndBhaMJbWtyKWbKLcMy?=
 =?us-ascii?Q?ElSx8MY+cYBnunRj4bSovZQe4BtqrYz5VSoVlETQh40/sptc4qOyDiy0QAns?=
 =?us-ascii?Q?fr1Z6vFR+i8+N6ZudWcjJuvd4v1EpDmlC3YbjTYpryq2LSnpDpXBBcvD8vTy?=
 =?us-ascii?Q?Ny2RDRmxL/DiNP902HjJvidQ9u1uoJySMMSIccMnFuWk95ZA+R4lZzxOBAzL?=
 =?us-ascii?Q?uPb/EH0Sankcv5hLYOilvzdPWqE5mejK++qUH4Nlmj3fF4hY1KD29+GCwdG+?=
 =?us-ascii?Q?AyvaIdznyVaHkYhF66HVdTVngQH8KZPDpZGDtGc3BFZQxaRARjzB5pUYMaDR?=
 =?us-ascii?Q?R0o/Qt2ejdlf1wWQh8ZB7glvB+XPfBkxjguFAg3utI2oJL2JrbrYJsNtngai?=
 =?us-ascii?Q?xpi2Dkb+Ciy1+3s89MulEmP+lMND36pdgfD/07/u2ZHju25FEtjukBnHbS2p?=
X-MS-Exchange-AntiSpam-MessageData-1: qiBXTQYoQGaxRA==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 560610d6-854f-4e85-a062-08da2c28fcd2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2022 10:46:17.9884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naUCVFrSaw+VIuOPwWZ2ArAWBTHn9bqF2Z3ype34schyipKIwcOQbXcD086KrFDcwTjCzVhTr6r7yq87y3CUeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2901
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 02.05.22 05:49, Tetsuo Handa wrote:
Hi,

there is one open question with this patch I am afraid.
> =20
> @@ -533,8 +550,10 @@ static int display_open(struct inode *inode, struct =
file *file)
> =20
>  	mutex_unlock(&ictx->lock);
> =20
> +	if (retval && refcount_dec_and_test(&ictx->users))
> +		free_imon_context(ictx);
> +
>

When could this ever happen? Either the device is disconnected, then
you'll go to 'exit' or the refcount will go back to something >0, won't it?

=C2=A0=C2=A0=C2=A0 Regards
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

