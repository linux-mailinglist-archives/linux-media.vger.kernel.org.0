Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1955A7FB3
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbiHaON2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 31 Aug 2022 10:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232007AbiHaONU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:13:20 -0400
Received: from mgw4.skoda-auto.cz (mgw4.skoda-auto.cz [193.108.106.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15163D75BB
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:13:04 -0700 (PDT)
X-AuditID: 0ad97bd6-3f5c070000001f76-27-630f6c6e5d23
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5RQdx6hE9Ld6tdNera+LI/hwmEebpsUndV6HRA67pe4TnrhU+PfEPwuV8J2sYnBnK1UyD0lQ6ZrFuWDrp4JDVrajpebnSMK7NA0zkVNuUM+U1jRni14PVKFqQpHXA10HhAgSF+G2Vjg77TuCVGBn6Okv1Cz9YYo+BeCtpUvbKGkVo5Ujs4b2jOBIBY+AC5bChvM5RE4iZZxX+6HekgJn7mKpQeJbIEHUdFNZQUz9sdynZ8nqDZZORu0JqVIUYbvubTdAhy+gYYHb32yoI+1n5EUEna0XwX1Zeeie3VAX9G9ON1dTSWrNoZhhrwyegwRrqtDO/10vmRdOLkyZdK3Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QSwwGDLBuJMosBOWktgcntYnwt+t9zmwnTVsUWNP5c=;
 b=aH4ABhdLzgUWipXDxdQwcQw40qAcH/aeev3OXqkkcWLBZ/bgsFBLZAdGnVTewlxB8m7Yr7kvMMSKdQ7+wUD6Q/i/oZkNZ/g4AYgn4XSo4gA3Cr9c5JNYQzvCuvUi2Sz8SsQBXXjyLp3h8fiX65Lw1zVYFHfAaK/XxdPoWKwiHXfeqB1wdrGuvfXOvPwltW4oEZgpG35dptNkWPiDAciaWbxOR4YVYzrRbnlpgwBs1KH4JKqLRuLLX4dzue/YwRbTdNS0xUZUtdqLTlajrvsX3GTd9qPnhe3UQjoahqoDBiLesBw1j/2iB/wCSTBZd0ZQS43uBK0l8lJn67Ad3GsZCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digiteqautomotive.com; dmarc=pass action=none
 header.from=digiteqautomotive.com; dkim=pass header.d=digiteqautomotive.com;
 arc=none
From:   "Tuma, Martin (Digiteq Automotive)" 
        <Martin.Tuma@digiteqautomotive.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Thread-Topic: [PATCH 2/3] Added Xilinx PCIe DMA IP core driver
Thread-Index: AQHYtlB0rAV1wpLUzkq9iS8nnMGQe63EcLkAgAFB0L6AAWfOAIAB97+v
Date:   Wed, 31 Aug 2022 14:12:59 +0000
Message-ID: <AM8PR05MB72350548F27F413298FF032AFB789@AM8PR05MB7235.eurprd05.prod.outlook.com>
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-3-martin.tuma@digiteqautomotive.com>
 <22204e2d-e0cc-b4bf-7501-9e4c2bf32ff8@linaro.org>
 <AM8PR05MB7235B6CBA34C981D456F74EAFB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
 <1b7c6c4d-7f26-de21-df51-0428bc0af715@linaro.org>
In-Reply-To: <1b7c6c4d-7f26-de21-df51-0428bc0af715@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Enabled=True;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SiteId=2882be50-2012-4d88-ac86-544124e120c8;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SetDate=2022-08-31T14:12:59.544Z;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Name=Internal;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_ContentBits=0;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digiteqautomotive.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 828929b7-46bb-4dcd-9064-08da8b5ae916
x-ms-traffictypediagnostic: PAXPR05MB9073:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 053BvU16fZXuiT5miLQ6Kilq3BkFyjDUHoesKy2Ymxz1H2JN25OPWkavZJAh3C+zfI3L9KGGpOfa4zl2fs2C6byCG2EjKbHh655EwVIbBO6zM42kZyCgVcdW8t0oKwLTVJJaEwn5xEphrwni7QV7atmqezlmIrC/UbLssLqHSkjNP1koK1rcdpvlpBKxSVIA9NyvZ0jyz2rqGtKk7M/itDlmaZAqBd6GzHh5IMd7HOpj6M+Y6cc1PgZ3vIvio5RXwkhfV3HZQlui5CevKLP9KLP26Rp/q1xpZD1Uf/wDpbnJxo/aZQ6ACRUfDnENFIE9xgV2lpQUCY4+2q/Spa74gjK1xWLlehvQ/OIhcMBoaeAHfjfF9UcVGofdwBvQ8Vnt4e3FLzGM1RZwaW5ChzymLWKOyEbfW9ITseOlN4r54k8RKlGOM3c5E3Pc3mDY+Sdc2d9aW+oZy71d6gTAt5xmBBbDNsEAQjEmtoQDsLGnmd4hg/g4ouHD+GkzyJEK0+SFN3cu9M5+5XbnSRVKe6tS3+cCin1vSIl4vLR2Gj9Mo2xhyBUbGwpUbj6mrc7ambITNhNdHVMxlCcc6w9ClNxqm6m0vG+63Cvl9ei3AQMDEf00R7xJc5Uz42vKTk9ZZgv5rxA9awKbpYRUw6YMmTraHK0P8z+UPtvVNUxTuD8x76vXYk+Z/UcOz6cAe9B8kLIszsr3zdk18iUFVnu5cSBQvSdWSzEZ4pVPygMVCTNcXo3VUpiI3PXZrgJeISxnuQBdzB9tw399/5eiUgn+X/TA2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR05MB7235.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(38070700005)(110136005)(316002)(71200400001)(186003)(38100700002)(86362001)(122000001)(82960400001)(66574015)(45080400002)(55016003)(83380400001)(2906002)(66446008)(66476007)(66946007)(8676002)(66556008)(5660300002)(76116006)(64756008)(6506007)(478600001)(33656002)(41300700001)(7696005)(52536014)(8936002)(9686003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-15?Q?xE6lgaXmqre/Ld2RSH26d0donyBC3GfeOvw3VmbNxMZiGvm58Zv9nUVyl?=
 =?iso-8859-15?Q?NTpXX+wQz50fF12Gec4Y2ikvZ7wk7ESHGLLxiu0DGsgG52Xg5BnmoJeUU?=
 =?iso-8859-15?Q?s2vIkJsXJyIyK8T/Tc+MTrQXy67t8Tv2RZYCHsvHS981lol3XpNoKTVr7?=
 =?iso-8859-15?Q?wXzX4TtCxzFRQMp6iqJudRdyHUIOXBOOerOvbgggfHFcVukHfDOUsn2Gi?=
 =?iso-8859-15?Q?mQMinGvcn92MryNWXIVeOAfdRUzw/b6wJ5zTK9Fw63/cljxLVOZnl4uF3?=
 =?iso-8859-15?Q?er8Eo5UlH+KcOXd9s8DydMP6jzMkeVrWSaoX0e8tqGgDnhmOqQ1nVj1J8?=
 =?iso-8859-15?Q?zui/DCRy1TQ+/q+5V0MfVHuqTyzDXZjCcT6MfoB0LD/jCSZmiVVzsysZC?=
 =?iso-8859-15?Q?bGrgc6+/K+a8HOwzpP7jSiW3alPv2cMgMjK7NFJxfHD0lHNFC3nBM2NoM?=
 =?iso-8859-15?Q?dUDsaNOwiptP0Yj+orQKWlfbbkiOZEESQY4SfAPN7p+C8gGsXxJD6Djum?=
 =?iso-8859-15?Q?D2gcASg22WXgIWj71lm6zAkqORdMXJH6EfQ3sug8kcdcl0pPJpSyuXgkv?=
 =?iso-8859-15?Q?rn4MkpLJSWrTMNarl23LZBysEQaQhUJkOMX6nSf6SSZdaIk/ORPw6JfPY?=
 =?iso-8859-15?Q?Uhzood0CwzNstxeSjxiTX1cRA811HBBtsKMOIGTbZdhDDzaTdPDCONylW?=
 =?iso-8859-15?Q?k/hSo2Ls3tYb7vVFscetveJuWPnlcuFO+CcxTv/rRjVUOfIy/Jsm83+Y8?=
 =?iso-8859-15?Q?/+RFJm6D0g8lcqHaChs2s9WWuVkHS+q7ppW8r7gqkuiuiOi+d8DMLOIjh?=
 =?iso-8859-15?Q?NOg6ec0l2+QHPlm9Rvc/FJLwwhRptyk02e1oz+CwQJ5oP5AomHOuRyUUd?=
 =?iso-8859-15?Q?Lp/k1ZHhRFtdpkbSjM/U3+i+uVqSV8lZvcL45/kW+znyykpqIT11SrAqk?=
 =?iso-8859-15?Q?NhWiOFICCAsnSP5rp8QvLuQN92NinSxVLnsX5ECAWbRXxvTvKeb9qc+4q?=
 =?iso-8859-15?Q?CJ57frrDu8BjAOAbEk1fbKu0CMbpCNllREaXeMgAmzOdd0Ud1E2rnmWpU?=
 =?iso-8859-15?Q?qeU57Zk6xYb1cFuGcxwwBR5N2++pJiAnRWdXow+NmDERvSEAndfApELYB?=
 =?iso-8859-15?Q?+kHQ20G8HCpy6WxhQRD6GDu138cp8c155eiPNPCdDcc7XHDHlvlhsJcmy?=
 =?iso-8859-15?Q?hDNkDuYs3lL2SkPcG4mhmJzslb4uO+RjrgMPCBrBb6IRDzi7qF2/bqGT2?=
 =?iso-8859-15?Q?79bj5k5Dy6d6P/yUqqNOoyspJ4qzhiOPgoFG6vL8Sj+1R2PDKs9Bk9lTq?=
 =?iso-8859-15?Q?plMzcp9gACsRB2z47cE54zzdnlDiEp6akAZ5gAjO9AquxFoq98W+3f6nu?=
 =?iso-8859-15?Q?fLzbievm+CEuug0V6GZ6WKxHqS7JpSAM+cQBVjh/l69kiYe9y6TK1e5o2?=
 =?iso-8859-15?Q?uNpQlzuAX3zqg9vm2V5VIYpTpDavPVL6ANActlP+GXoIJEeKml2+CW9wq?=
 =?iso-8859-15?Q?UZNN/Tv9D1gepFnxM48uotr64wQQIMb7yOp7AEKQyJamoa67em+hBsGR9?=
 =?iso-8859-15?Q?6mKzJZJo10wxTfO+l4vIEH9KXvPeAp4OEP7ctSshscv7mLe3tibugC+h2?=
 =?iso-8859-15?Q?AtC6i9NKNrFxipIqIhFXqiOaNIwl7Ob+I4E6FHa2AhYdimiwsRhIaQE6d?=
 =?iso-8859-15?Q?yb0kIwRQccnVQ61RYTa0jbmMqw=3D=3D?=
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR05MB7235.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 828929b7-46bb-4dcd-9064-08da8b5ae916
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:12:59.9609
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2882be50-2012-4d88-ac86-544124e120c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vyfQW3ByAa/CSQMWqLM4s7sjOU9CYF+9VDghQ8jaIkwtzxR/Q6vjF/ckyAixJYbKqlGWTNVVAneb2JmmMMT89c+oBEAayC8ulyHqtko/p2AZb4TgE0CIzgmeXXypxga1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR05MB9073
X-OriginatorOrg: digiteqautomotive.com
X-SGG-UMAMSID: 20220831141301Z7677mxmos01.wob.vw.vwg 1oTOSj-0001zp-Kj
X-SGG-RESULT: 20220831141301Z7677mxmos01.wob.vw.vwg C1:OK E1:OK MX1:OK BL:OK SPF:off  CT: CM: SIP:10.186.25.87 SMF:Martin.Tuma@digiteqautomotive.com
X-SGG-MF: Martin.Tuma@digiteqautomotive.com
X-SGG-DKIM-Signing: fe5a965be60fd73f3484b58bce070295
X-OriginalArrivalTime: 31 Aug 2022 14:13:01.0860 (UTC) FILETIME=[C7B7CE40:01D8BD43]
X-EEG-SA-PASSED: outgoing
X-EEG-SA-LOOP-COUNT: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42LhulkpppuXw59s0HJIwKJnw1ZWB0aPz5vk
        AhijuG2SEkvKgjPT8/TtErgzjm7+yVJwRrCi7dRrpgbGL7xdjJwcQgJ6EneubWEFsSUETCTe
        vPvN3sXIxcEosIxZov/+NRYoh1Xi1IQjUM5VRonJ/W2MIC1sAr4S3+88Yeti5OAQESiXmHQh
        FiQsLGArsWzqe7ASEQE7iVtrJzBD2G4SM9ous4OUswioSuzYwAQS5hWIkTh08QIzyHghgT1M
        Ej0HPoCN5ATqnTUtGaSGUUBM4vupNWD1zALiEreezGeCOFpAYsme88wQtqjEy8f/WEHm8Aps
        ZpbYMPcuG8TNDYwSX+f3QVXJSlya380IskAC6P77D1IgwroS16//Y4Ow5SRW9T5kgbDlJaYt
        es8OYctIPLixHWymhMBuNomTN74yQzhbWCR2d+6AhqOBxLxvR6CqHghKvFt6nQ3ibn2J1Q0H
        oGxtiWULXzNPYDSaheSlWUjKZiEpmwUOJkGJkzOfsCxgZFnFKFKcm5SbXm6il1auV5ydn5Ko
        V1aevokRnCCqr+1g/LJU6RAjEwfjIUYJDmYlEd7v53iShXhTEiurUovy44tKc1KLDzFKc7Ao
        ifO2CPAlCwmkJ5akZqemFqQWwWSZODhBurmkRIpT81JSixJLSzLiQSkqvhiYpKQaGHcd4uxQ
        /lPLOmf/cRW1xG2Nx//4ebzTayl5doTThu3E+3CL/y+2xzfIBwpzfDN3Yjmiq1WVsakpcVPY
        20MbHhYLGZcbsk9Kslix8W+LuK6bwr4pVmXcE26yckj2+MeduiL7RrdNo2/ukn79bV+sD/TV
        qgT5HWH/NefAYteM63z7Om//s/nxX4mlOCPRUIu5qDgRAMZaKysZAwAA
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



>> The Xilinx XDMA IP core is a complex device that is bound to PCIe and
>> also handles stuff like MSI/MSI-X interrupts of the PCIe card/FPGA.
>> The FPGA IP core is different from those that already have drivers in
>> dma/xilinx so a new dma device would be required anyway.
>
> Just because it is different does not mean it requires a new driver...

Just because the HW is from Xilinx and has DMA in it's name does not mean
it can be merged with some other Xilinx DMA driver... I suggest we stop this kind
of argumentation as it is pointless and we look at the facts. The XDMA IP core
really is very different from the other three Xilinx DMA engines which already have
a driver in linux. Additionally as you can see, there are three supported Xilinx
DMA engines and each of them has its own driver, so I see no reason for
breaking this "rule" and try to violently merge the XDMA driver with one of
the existing drivers (their maintainers would IMHO not be very happy...)

> I don't understand your quoting style. You typed here my message instead
> of quoting. I recommend to use some standard mail clients so that emails
> are properly formatted.

The story behind the weird  quoting style is, I only have a web Outlook accesible
through Citrix, where even copy&paste does not work... This is how things are if
you work for the Volkswagen/¦koda corporate (Digiteq is a subsidiary of ¦koda)
like I do. The official mail addresses and their infrastructure is simply unusable for
"serious" work. I even had to set up my own SMTP server in the Internet to actually
send the patches... I will switch to different email address the next time I send
the reworked patches and use some sane email client. There were two reasons for
using the broken mail infrastructure:

1) By using the "official" company mail address I wanted to make clear that the driver
is developed by the company producing the HW.
2) I didn't know that the web Outlook is that bad and only designed for the "corporate"
style of replyies where you post your response on top of the previous message.

TLDR - sorry for the "style", it will get better the next time I send the patches.

M.

INTERNAL
