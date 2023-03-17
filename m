Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92A066BE454
	for <lists+linux-media@lfdr.de>; Fri, 17 Mar 2023 09:53:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjCQIxC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Mar 2023 04:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229881AbjCQIw7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Mar 2023 04:52:59 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2054.outbound.protection.outlook.com [40.107.8.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 336B64C6F6
        for <linux-media@vger.kernel.org>; Fri, 17 Mar 2023 01:52:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AmxELPrYbEG2Bcpp2jiv2y1OKgURRhEbQoeFmBKfhCGovjtPbQwUu3Vo1kwgk8hddJSqbk2UZdA2WZejZnkg+uf/EGkRV+ILdukzSqD42uciIrV7kzjVKAFAG8KiIOi3TdcpHjdhF1kqW27AHxNuI56XdhX5oaOKriQgdb8oPfoJiuK99RBZUWHPvNZLteGFPfjwlUEmbQGE7XJL+nFTeoIQc8S5I/4Xcac+WNFi6JgX+sAQXjuwOPVGB4ih1i+g16BVPE5Br/x0aOlkqnD9/Yvvcs4iRJzLfcShCx4lVLDB/hhebCj7S3HyhnD//WEaJx4+ro84CanjLvlz2pD7ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XHxdhMP2WRE4RY/YinJnUTGHZPxVA8tf12A1RRzMSGg=;
 b=oeeKSojkeJr7Z18P4ITtQvExNVs1RSwkfjWLphX0BQejJuJHx800ZBquUS5KRVsC0kvRt0nd8L+e6ypZt8bFmHNmOBVLa1I4kSTjUgstvQwQCXxHCKUA2LX1cx1OqauIWdTG2exCsI3pssNCUJp1xG7L4aEL9Zj3wHhFWt2z53z8EbxBoJyRvBhNuN6W6GtVR7wctQtnkJWMcZs0kRA2A1jJGLsRa0CNBaMBDN12yh+jvYnVoeiwe89FtExNfDalmV1mpt64NRHxuWLGzXTLpL85iLXZLAi2GqnGL+RLbIoO5I7kqSBBD+nZrj9zVKK7PCU5GFT7KGI1s2Cu28MRcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XHxdhMP2WRE4RY/YinJnUTGHZPxVA8tf12A1RRzMSGg=;
 b=aKjaJw+0yPJLE+J+aNib/Vw5GjxXNh8xVCtf5GDEcRb3gpEHsNt094cMwqfx8dPBwLOTxFhJ7r/j+n03m5YXeI6lbovzAtAahCg1B88cwA+7Z5fgCxYDRV+/janzKtrWaajvBo0zw6tdtI8SEUWTIBHlpjZKBt9Rsfq0vz/1UZA=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by DU2PR04MB9068.eurprd04.prod.outlook.com (2603:10a6:10:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.35; Fri, 17 Mar
 2023 08:52:52 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::89aa:9204:790d:e46b]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::89aa:9204:790d:e46b%5]) with mapi id 15.20.6178.035; Fri, 17 Mar 2023
 08:52:52 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Shijie Qin <shijie.qin@nxp.com>,
        Eagle Zhou <eagle.zhou@nxp.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH 1/1] media: amphion: use dev_err_probe
Thread-Topic: [EXT] Re: [PATCH 1/1] media: amphion: use dev_err_probe
Thread-Index: AQHZVwpvsxwAWUBDyECX8o0SHLX1Nq7+rOSw
Date:   Fri, 17 Mar 2023 08:52:51 +0000
Message-ID: <AM6PR04MB634181E89FCBAC78DB6F78C1E7BD9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <20230131103244.624698-1-alexander.stein@ew.tq-group.com>
 <4055673.mvXUDI8C0e@steina-w>
In-Reply-To: <4055673.mvXUDI8C0e@steina-w>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB6341:EE_|DU2PR04MB9068:EE_
x-ms-office365-filtering-correlation-id: 530bf7ec-d8c9-4ea3-2d14-08db26c4fda8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ErIdajIJLvbvNfpPhRn++2A5ICKNPsMcWLjtUHzUOEpxI5gAMdM24iFsQ7ST2Hrukql/nKz2TljxeB+jslxQMO/J+OXfNDBjKW8PMnMrYhLA4C9TupavpunUZqD5U/ESfKZproOGkYv602SX2kkd0CWAA/JXrGJiLMK5N4FFcICrJ+L0OZNiF0xR1vwqWRulbvdUUz7+6NUCdeKaypDDnkh6/b40AxRD+6+wJ6kIIpdzBl2LfydddsoiC4I6Rgd3CN/0lTve6T8GXwMXQCNRxoJC0pjXjY7EzXf7R2kHPMeeEXa+PJ/5RJ+dM2cYVUwH16wgFYZCS/7B5495VvJiFfhca+h6wuWQJujN/pfBXtl09SSKrrp6ZAcMi3/+dgFgo/uuKIeByWNBbYIGer5XlgqFzkmWgJsJxVIWfqR1/Rcusc/tOgUy+iizqCwqv659arWkrM+AzAbekYAtJo3/l3YT6C6cJExulTK33Jpf/o0XQ4ziqqM1H9Ms9+NiDS18eRUGSErQrqP6IkBhzjsnpkeyWOjRBYKJ3hsiZ/bFjos6bgpQCiFzyKGid7SjvZv0mJ4eZ5ah9ONjPS8ARXk5Eq02nEq9r3Es3oUeTnrhpKgREo+S8y/Q4LGMfodEgXJJsgqjF8VkFB1T0GuWtNq0HxdWqCRHDzehi5Fh2Ka5QxWaEKF7Ehf8iDIGpCqxzqdL
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39860400002)(346002)(136003)(366004)(451199018)(86362001)(55016003)(33656002)(71200400001)(7696005)(45080400002)(316002)(4326008)(66476007)(66946007)(76116006)(64756008)(66556008)(66446008)(8676002)(478600001)(83380400001)(26005)(9686003)(110136005)(186003)(6506007)(66574015)(38100700002)(38070700005)(44832011)(52536014)(5660300002)(8936002)(2906002)(41300700001)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?V80C2D9wvqN5UdtZ7PWWmnLUtgp5EOVBY1LoVRZ7RHuRSs950r1k52qs0H?=
 =?iso-8859-1?Q?5BkTN1Y3Fzf1tqM+wi+sg1Z8nwdyqesn/e6KU9nXf/F0yjl6xgj9J8pH3j?=
 =?iso-8859-1?Q?A0YG5wEMMRzCVMQMHs3t9Ta2mXXrPorA4xZInoUv7EKFzlbXYkD3YMdFtq?=
 =?iso-8859-1?Q?pyv+/4Xdaz7HhusOCULf1qZSahZaOTRxQ0LF4MU7s8pnhiXb5WoAUJkZQO?=
 =?iso-8859-1?Q?cJP3rWxgMIu36JVX0dyGoRlOfWkTAOEs8t282hUipk1mjQTOt/1wJ0kKdg?=
 =?iso-8859-1?Q?1ezZhKI3qODYGDwan8l6LDP/StWYs3cVXFEt0sKUlbpC7HlgsWCg53+qVh?=
 =?iso-8859-1?Q?1uv7Gua1+7088at8Gru3SEl3sFnwhiVXV7O8HlXTU3kgK2m8GhqsBxyX+9?=
 =?iso-8859-1?Q?AiWIIZNwvJY8EQRSXl0ULD7O60Na/M1yUwZROkyXvy2fw7SbRkuTkHHfwj?=
 =?iso-8859-1?Q?hjvvyTaTITaRJOJD4IMy2W4rUB75EFlwItbg9UeQ/k7vikkyYerNfBP4mD?=
 =?iso-8859-1?Q?TbGh6Y/J1s4P/Zh9eSKSKDE3oiOfFZ2hIE2pDf2EMzVu86IfKdLZH4ZQFq?=
 =?iso-8859-1?Q?++VqQTlii0IKSrBj7K0hKuyBsERUdnEQQgaY6KmfnbQxKcyV2U8WBwsplm?=
 =?iso-8859-1?Q?9jJCLCzbWirpCxdas69aWgEs8fO1+JssWCIIevRzI1flGkPjlycNJusxV0?=
 =?iso-8859-1?Q?axlwIGJr2RUyPRTZ7wTD1Jrd4WUNnSjaThDsR95CtfK3Olz6dG9+Dsjdba?=
 =?iso-8859-1?Q?/CoM1e/Nx12PH2OAMHrXMZJioWwrjNrFKRXMR1mWJ8cYmb/V9NVmi4Us3s?=
 =?iso-8859-1?Q?UmcNDE+Bl9CNmHtlOV+AknsQYIhF0E11OsLcDr8400RpKWaKANVal66Hk/?=
 =?iso-8859-1?Q?Na2GySTuot0hVQB5aU4Q+qXGxtcWYCnpaYXj8zRntqw+NkMJKexMHk0mLW?=
 =?iso-8859-1?Q?aLN7qQqlq5wTLQBLNQQ0ogjVG+WTDfe5okt7wcuDJ5QxXGrzwfJzALjhK5?=
 =?iso-8859-1?Q?Qj1HFcB6+z3yDPFNiv7YI22H08pYl59KjCWFmDjWRapv+Im2JDKc17fZbf?=
 =?iso-8859-1?Q?hRw0q0sXtYSqqooU16uDwsFv0oMzmNo8tmrZ2Fm6YlwIUZ3xD5GF8yOn7A?=
 =?iso-8859-1?Q?HqyU3SmcuKVa/E/XQtyK38DcaTxLSqoWJQd/0GVHuQBzhRG0okDLIRJMYj?=
 =?iso-8859-1?Q?gntj4D5XnxvoO27Ez2pYz8/udi8gBrqwRMHvF2LwbM+Izfd8587vJ1U5jt?=
 =?iso-8859-1?Q?gaK2qk1RocVbXto253R48Awb7OWO1JSYz01EKqVaKzkVOfVPjdwTuArYne?=
 =?iso-8859-1?Q?aaMCY0RuKPtgxLDfLH8bLSdHtzRT9HmI8qJ3q8bHuFcYNhAm+BISEOkXRS?=
 =?iso-8859-1?Q?mTqktlJc7qga/M4IByUg/o7WGTuLHAS9kEGbFZUKzZX+5TWybtfduKHbqF?=
 =?iso-8859-1?Q?cwDdn2LRsr2JeWS226uhFPfh8KPVWkhL76k5J7PmSab9GGdQNl78tarUvF?=
 =?iso-8859-1?Q?GY5B7WhQL+yufHKgqzizxl4UiUoiaUjZHjYtgzb5Mzv9m3zPg540sTpbtV?=
 =?iso-8859-1?Q?254d7hoPxeMaMol5ngUsbjJUgOLPWPmDnloKuKCkOPcbipX7JznT7Z0scJ?=
 =?iso-8859-1?Q?iY5qHjx3hYMVs=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530bf7ec-d8c9-4ea3-2d14-08db26c4fda8
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2023 08:52:51.3847
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5P5sF+0h7e0q2VCh8T8wYGwG6/Jqfcw+kyI5qwIc0R27dvPMnrxrjwqVnnuqpR8ivpehGpRXdVVaOVuWS6zQjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9068
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,RCVD_IN_VALIDITY_RPBL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

>Hi,
>
>Am Dienstag, 31. Januar 2023, 11:32:44 CET schrieb Alexander Stein:
>> This simplifies the code and silences -517 error messages. Also the
>> reason is listed in /sys/kernel/debug/devices_deferred.
>>
>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: ming_qian <ming.qian@nxp.com>

>
>is there any feedback on this?
>
>Thanks and best regards,
>Alexander
>
>> ---
>>  drivers/media/platform/amphion/vpu_mbox.c | 9 ++++-----
>>  1 file changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/media/platform/amphion/vpu_mbox.c
>> b/drivers/media/platform/amphion/vpu_mbox.c index
>> bf759eb2fd46..b6d5b4844f67 100644
>> --- a/drivers/media/platform/amphion/vpu_mbox.c
>> +++ b/drivers/media/platform/amphion/vpu_mbox.c
>> @@ -46,11 +46,10 @@ static int vpu_mbox_request_channel(struct device
>> *dev, struct vpu_mbox *mbox) cl->rx_callback =3D vpu_mbox_rx_callback;
>>
>>       ch =3D mbox_request_channel_byname(cl, mbox->name);
>> -     if (IS_ERR(ch)) {
>> -             dev_err(dev, "Failed to request mbox chan %s, ret :
>%ld\n",
>> -                     mbox->name, PTR_ERR(ch));
>> -             return PTR_ERR(ch);
>> -     }
>> +     if (IS_ERR(ch))
>> +             return dev_err_probe(dev, PTR_ERR(ch),
>> +                                  "Failed to request mbox chan
>%s\n",
>> +                                  mbox->name);
>>
>>       mbox->ch =3D ch;
>>       return 0;
>
>
>--
>TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
>Amtsgericht M=FCnchen, HRB 105018
>Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
>https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww.tq
>-
>group.com%2F&data=3D05%7C01%7Cming.qian%40nxp.com%7Cf727eee294b74
>d6b250d08db25219119%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%
>7C638144598318747307%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
>MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%
>7C&sdata=3DUREXcvYNz6K%2FoF%2Bahc7%2Bhos7fv9Lz3N0Fx2u5a%2F8Jlo%3D
>&reserved=3D0
>

