Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AE0B513276
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 13:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345421AbiD1Lbc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 07:31:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbiD1Lba (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 07:31:30 -0400
Received: from de-smtp-delivery-102.mimecast.com (de-smtp-delivery-102.mimecast.com [194.104.111.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DE85BD0E
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 04:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1651145293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HS76DW9NHj3FLf8PNNySheSBFZ2lJ+RdhgAq5wY55JM=;
        b=lLKKFKoJGMYVshuRKTevwTgGJjbIEO+eNMpEekZKM6U+yzNj/Tue+JS+V6fqFtGY6EVEAC
        z/dftlF7uLfCvjGsL9NocQFQNDG52XFl5lCyjOJ2LRLeXxSlbnImOghDtqjAhqSESEayfF
        3UcW8Pe5Fkbg6GPxMg9A/5KEoSS8tEs=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2111.outbound.protection.outlook.com [104.47.18.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-4-Acd2SBfqNeODJbYSOGDwcA-1; Thu, 28 Apr 2022 13:28:10 +0200
X-MC-Unique: Acd2SBfqNeODJbYSOGDwcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMX9enpF1gt3b1BPrrWXnftJQZ64l21qOE6Q8zQSH/EdmVyUntPIAVtbHlT8h8x300077csiBydpGot5o6RCBO9aMkTX6XgicOiO2eDuQaaTz6xSyzR+sqZPjgQ0zoYjIX8u46QT03kE1EdXO+gxvOZUqSTwSfZH92ymbk4ts7C1hwtQrkpzUiruOx/yOTvICl2C9hWGZapM+ZR4hGW4HOv/2kkvvf4OgJIeSdCUD/QJMj7E+6lCs9c2mzvItNe/Cnw28r6lQbA0W1R2pfMzXdRmMf/ADrOP5DgFhykDa97leexm/W6HzJg0jHvOeuHuxMBSal3CLBaCVmqGsnKwFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jxkQ01P43uOfFWn3seGRYrDj7aPva4qHg2yCRQMZW/8=;
 b=I64mLx+V3GCf1T+5NwXefy6KrsSnqaLvHKYVGt2eer4ObRjn5VU/TqFz0vYy1VFe0M5OqaccMPAQMWblV1DjKAeQUclMIjnQjLRHMMlWTrLnp3A6+zHcj0NYyTjtAfuOLBKfidhF63ycMW1XUrV9La9Rw1hNWNXlzyDbp7v31YzrXYyP5VR4tQYSnR67jBnn62S9QsatCFPxr+RMvGc6Fh1q13PGup8DaLdE/mPixhy1ug8RPGJSO6MV//xp6W+4YK3pWptEgLG15/6CSe7/p6Bd8YAoyqrMaZWXdBi7wiDbL1nyNqglZxaANXrvsxQXTxmrg2RMb9vtDtDmx444Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16) by VI1PR04MB6048.eurprd04.prod.outlook.com
 (2603:10a6:803:f7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Thu, 28 Apr
 2022 11:28:08 +0000
Received: from VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b]) by VI1PR0401MB2526.eurprd04.prod.outlook.com
 ([fe80::8c82:19c5:ce96:491b%4]) with mapi id 15.20.5206.014; Thu, 28 Apr 2022
 11:28:07 +0000
Message-ID: <b6c8c1ab-b1fb-376a-c74c-a2766d97c1a0@suse.com>
Date:   Thu, 28 Apr 2022 13:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: possible clash between 8ea0f2ba0fa3f and 4affafd7bec7c both
 decrementing refcount
Content-Language: en-US
To:     Alexey Khoroshilov <khoroshilov@ispras.ru>,
        Oliver Neukum <oneukum@suse.com>, Yu Kuai <yukuai3@huawei.com>
CC:     linux-media@vger.kernel.org
References: <ef931be9-51b0-6990-211b-b8450b395bf5@suse.com>
 <3db2b997-bba5-425e-e271-33ffec06b16f@ispras.ru>
From:   Oliver Neukum <oneukum@suse.com>
In-Reply-To: <3db2b997-bba5-425e-e271-33ffec06b16f@ispras.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR10CA0064.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:80::41) To VI1PR0401MB2526.eurprd04.prod.outlook.com
 (2603:10a6:800:58::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db7bb400-39af-4605-7fce-08da290a2b37
X-MS-TrafficTypeDiagnostic: VI1PR04MB6048:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS: <VI1PR04MB6048988570072DCA85A9AA39C7FD9@VI1PR04MB6048.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J2zSyoGW+7AKMXE0oehVpqpoXEhnnt4FbG/niQMTSAgAT1hAR77AtWTINNi4GyAFWlQZpXB/MCU8C+25+KbNSp4P/Jm7CxBx33xG1mYnq1Apq7O6xYzm0XeIbM8Rzjt2h7JfWMaUpVnOutc2Jy9Ff9iWleZZ1mkp0hvZpINHtI6vgS6gpajwWU6gmdW0u1ZovOde/PZnM6P2TlYhOBpY20ywJqTS9wPBR3Q62lFW5iqyWfuWOodrg0Fyne1UbmmZuRI853NaiyXuer1uuxYYSQoV3ueYPxugamOxwJisetijdqQEv/vTuaBhJb7LOU9ktfUnv5Be4JDEahS3EETZaJUclVcApps7qKC1riUU3S4XduDV4i1gbE6i2G2osGOQbV33eK3HM/nlsdPDSL0pfqDiMoMydEhbOUHkRQ9rEQrHTWl8CiUh1oDw+yIMRRTblvfjSbxI56Ac4fcfNHAvZaPBAJJDKo9r6dJijV757VS0scVq9jEdAPU4uaFbgyv6Xe9O8f19BPZpq8H+UrmCtXfZ422r92JZN68LNA4LbYi2rZ6u64bg6jn6jaiQV1ldFmzHqxQyloJES0NtLGDW2iQdyJoEbTbYiujrsmPgkN5NgQZ654NjAi7uWurHirsSo2vyqBwVR8L+9wyqhgx3rdHfdgZvb+I8XJU0Twun05LBpleimqP6lrN2xxuSTEptpNOYpNkoRR92ir9CGbNiy/3yt9l8WPrW35eoTJI2dtI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2526.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(110136005)(6506007)(53546011)(36756003)(6512007)(2616005)(86362001)(186003)(66556008)(66946007)(4326008)(8676002)(66476007)(31686004)(508600001)(6486002)(316002)(38100700002)(8936002)(2906002)(31696002)(5660300002)(4744005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jyBqJB7ExGNuzZle6kuyOmHJooGOwFCJKT7V1UhgtcLIKFWKCPO6vniD1QeJ?=
 =?us-ascii?Q?PEqJxt17Q9Bt+SMOBEveCmUUH21uLs4aKQCK1FvQQsaEI6JKsawexJDTq1s8?=
 =?us-ascii?Q?kkMtjPnNzXUDsjEECnxwL3BNWAdOynOuQrNru+hB0zBcBPxHKGYYGbXF9eha?=
 =?us-ascii?Q?HofO6c8O7K3/1aqKmmiC71TPoIUZ2yKT5aNHBku9WbDzog4tnuzKJWnyICPX?=
 =?us-ascii?Q?M2z2PHt8WGX1610GU1FzjLlSxNzDob5tCfyy/AkYhfaglxl9C/fPbaAlNZxF?=
 =?us-ascii?Q?0Z+ALo5zNAGv8Id1HZ83NfKhaL5MimmHOM3egjcitl4UPk9oaslaRYFqCoX/?=
 =?us-ascii?Q?XyR+osUDCoY0+UpmJqhuxRv/zIraCayie5AB5R94lKV3ONvG9RHpgaJxb3On?=
 =?us-ascii?Q?/8Ze6tCWyxVlmNfO1RlqS05ZYrIqkZq+qmfDC2pdvL2B7+CCDDD1BIjKVQjb?=
 =?us-ascii?Q?rDUy0UDTmCeA7dszd37mCIkSVPxYCG/KU27np04QJiNBXxksKc1G4kBvd1X3?=
 =?us-ascii?Q?j+uTVXlcM/T9Rbd5t0RHxHqxtsNiL2yCa7oZvnY3R2MM3hfvkEzyowd7jXDI?=
 =?us-ascii?Q?SR4Wp6jk0tHgeTArhM+PHtmoBNUMegDX7uVdNbRsM5LDCLAsnJn+Gy97lrQs?=
 =?us-ascii?Q?b95WNh5ZXZF22Kc8OtEHK1txl1A1eVY/KxSwpbiBGgeliz3Ighad5n9Kt1X3?=
 =?us-ascii?Q?IZRRlQbE96kJvo442iLgPmgSjpkYi8d/MpxMKha5jZBfr59JKxZN7tnPRCdS?=
 =?us-ascii?Q?mjLEVwEVtwricnGa5QWCHLDc6/jfKh90d4ZO2GNRT4Ww0fDReHekmzMK3j3F?=
 =?us-ascii?Q?HcxeamWQ7FvWVACQweJ/PW7RoY5WX9wJnKfHesgk7Rd4Zr2I2Fy4U2ldFR2r?=
 =?us-ascii?Q?fXtRNEbscvbKcrVDJNylUUx+J0kXjsNRwlfm79XrCTD1SeYcxfHJic8SKziC?=
 =?us-ascii?Q?X2SCVi0M0gnkcHKxARD6M7J6aMdfok4KL9cRG+WE55Qys6x2b0mfmqwu/Xtz?=
 =?us-ascii?Q?T+ium51BS4XrvJSCdK2e4Hk2xiE0WpcgU2ffrxxqluRlbXkJ0X5lOOk/i4vN?=
 =?us-ascii?Q?6+0srAQ6hhbamAneB8C+FETWRh6yjZHW073daaf/oq5KlmCfHCAYxBRvyCHR?=
 =?us-ascii?Q?6KCXKnCUkd0CQAXsDDVqdbkjmun7+egO2W9jlbbfcRfWgl+qamAMDCoEM61r?=
 =?us-ascii?Q?Al8i2j3ziBakg3QRCwqc/J+7S6zDdTucTSJtvYnZeS3WVL5wx6ktfLmB4YRu?=
 =?us-ascii?Q?eF/rGEI6Ib5HivbSRq9s9fonYkASJ6ID1KxdybkhtnngJ959TF8LUsjt9v9Y?=
 =?us-ascii?Q?cu+8O6QXfH+VVZlWfCUil12ByHV5SmZ9mtg03bv1dCNjvAML/Nbnw2CEPLLe?=
 =?us-ascii?Q?pLeybQiPPAI33uDChYQQviGVoOxJuayxyE114A9aa+GYUT1M88UfmpkebeRU?=
 =?us-ascii?Q?WyAzQ+tR01JRNJZMgMWawuu/LY5YNALyjOvm3hkYixARQzp4soGN4KRz8kzm?=
 =?us-ascii?Q?kued8LERus/wYA2PDuqdmRrw8ym81TF4JKJTzp8IynCxqiP2QuOg4w991yL9?=
 =?us-ascii?Q?I6ohugZ16pTJcobe9gUMk1g6tgDkS8yvzhhAHD7Rp7owwGFM2f0pcqJWG3u/?=
 =?us-ascii?Q?ZedxFGMtscdeMSrdeGh6afxd4LOqBeqchMpqKHy9z3IiZXrw7IohqbNfXVyu?=
 =?us-ascii?Q?2d5786nG/eXXXgx6VIwSCvJdwyXuE3yu76ov6ujhz57zd70l3QB0w/Lcl2AR?=
 =?us-ascii?Q?lTl9UZHN+m10lIovgqZ8aaTfBQTN8tPoXOUq5GObqYOoZndGhOjZnG8E4yin?=
X-MS-Exchange-AntiSpam-MessageData-1: 26UX6PCMBmhCrA==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db7bb400-39af-4605-7fce-08da290a2b37
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2526.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 11:28:07.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZtVNc3HkPVBEp+1GMmwgniI5NtPZxCZx+2C+foMExA9KHv5E8PgFdwJWsn7xRn/nJTUNqUOp0WKGUp9VajKyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6048
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 27.04.22 12:29, Alexey Khoroshilov wrote:
> On 27.04.2022 12:34, Oliver Neukum wrote:
>> Hi,
>>
>> I was looking at those two patches and I cannot help myself,
>> it looks to me like they are both fixing the same issue in two
>> different ways.
>> Could you clarify?
> Hi!
>
> As far as I can see
>
> 8ea0f2ba0fa3f
> adds of_node_put(node);
>
> while 4affafd7bec7c
> adds put_device(pm->larbvenclt & pm->larbvenc);
>
> Which clash do you mean?
>
Hi,

thank you. I think I had a brain short circuit. It is clear to me,
why of_put_node() needed to be added in=C2=A0 8ea0f2ba0fa3f.
Yet I just cannot see where the get_device() corresponding
to the put_device added in=C2=A0 4affafd7bec7c is. So I jumped
to conclusions.

=C2=A0=C2=A0=C2=A0 Sorry
=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

