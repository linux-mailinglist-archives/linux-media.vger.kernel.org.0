Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E65137DA72F
	for <lists+linux-media@lfdr.de>; Sat, 28 Oct 2023 15:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229458AbjJ1NVV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 28 Oct 2023 09:21:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjJ1NVU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 28 Oct 2023 09:21:20 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02olkn2074.outbound.protection.outlook.com [40.92.15.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A177E3
        for <linux-media@vger.kernel.org>; Sat, 28 Oct 2023 06:21:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMfVV/YJVJDJzTwM7C1P9JRdl5ThMeAhRVTX38mx35wSTnY68Hv7MyeJqyZb8Yefm3MyX/QQE5uoG/WZ9vK9vYQSSJFuIJHSlhdwyXZ/9QXyx5N4aTNLFDkq1dvgttDzDn7i2cf5g/ZjX28/r8Py18mqKx+OO05Bl5gfBYZoLQ0tYsgX84DxaOfLIyDMFfyxGXL/GTtS8IqDSH9Gb7Td4bOUFr73fpeDibn69nQNz5WeLDiKOyG/KmR27NtwL5TkuYQpk8UusPAuXlfiku02mo14VPlmdQxTAIGM6uVe+7dj9R7IHZqMspRwMjxy7CI7PEGKGCiWc2mj3wRnmKGSAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5DwGaK2vISbfxTGZg0tcTj4n2U4Qbyq99QvRLDtziQc=;
 b=nzuXKrubjhHBv8URT0fLraXRKkxQ/dtTNyiapAHE47s/LI9f6WWUDZkfz/LF5CNvbo/c9CcibjsigijVjxXrrdgnfaEIkd4Rl6n9VUdX7ACZbfwuvHX9D30If8bAPDu5ZabVVZzWL5oBlUjXqpZmtXkE7onpoybVwJ/vw+IhRhXWfUKmKNZZaPm7ECWa4xv9P69tWUaFTABt7sUX2Uoz8WxfSK6BSOxq9wuWpbsqJDpzP58Rcg/vHmRaWleFXWgmNTNUNIBy0fxNN+hpzkkrtJ+lhpd4bECOKV6OVANBiOqZnRfBDZaLDZKNbjBKNiIqsQqew/YjVeNd7zoUY46s+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5DwGaK2vISbfxTGZg0tcTj4n2U4Qbyq99QvRLDtziQc=;
 b=j6+pA6EgGP5DoHuev7U9ehxY6zi1M037umO8DQBRr5KuKj2z6NRInpWmc8I1CjOJfjU+Bvep8vwMTHBgLw3xmCDOzH+MQEy6Pwfi+z+gEika3RstDgV8CXKZ/vQwIrvEdyk4EREkSYD+TpPKQn97k5T9jPBcUxLiFiLbcptxjTT1LyTm8nEkMQKRQ5kO4a1/kL7LATwSmpvvHDq1tY6N8iHOg2G91amkFg6683nZwZ8frs+trnXEjMxSPw0+L4QPbTWxmQDUfQZ84wxVBEmNLOGIXcEPmuk1895qYVHD4ZKWryy7bfIEFOUm7VMVzZVdoj289DceCtKfMcM4hMgOGQ==
Received: from DS0PR19MB6526.namprd19.prod.outlook.com (2603:10b6:8:c6::6) by
 MN0PR19MB6044.namprd19.prod.outlook.com (2603:10b6:208:383::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6933.24; Sat, 28 Oct 2023 13:21:15 +0000
Received: from DS0PR19MB6526.namprd19.prod.outlook.com
 ([fe80::49d1:6864:22d3:80e9]) by DS0PR19MB6526.namprd19.prod.outlook.com
 ([fe80::49d1:6864:22d3:80e9%2]) with mapi id 15.20.6907.022; Sat, 28 Oct 2023
 13:21:15 +0000
From:   Vince Ricosti <vricosti@outlook.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Questions about ir-keytable and ir-ctl
Thread-Topic: Questions about ir-keytable and ir-ctl
Thread-Index: AQHaCaBbVCT9IO1MKkGOHNs3mwDN1w==
Date:   Sat, 28 Oct 2023 13:21:15 +0000
Message-ID: <DS0PR19MB6526C9164F0E0883B380D2D3D3A3A@DS0PR19MB6526.namprd19.prod.outlook.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn:  [DH7v9xOAFreGAYee835oBDQ5sTrab1xyPpU9mEOzUtfj1REow/5tQGj1nMSegqHO]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR19MB6526:EE_|MN0PR19MB6044:EE_
x-ms-office365-filtering-correlation-id: bdf7cdf8-e3a5-4f8f-0115-08dbd7b8c340
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1Y4uP/HhW+YTqzLYlNpqnu1mm9MlEj0QVVHgL9w49g+Pm6mKa0N3HkDsTi89XV2zbNDMtcfA0oLpxEu/ya3LvEC9WO59W45PlV3u30zjCz2S/t8ID3TeCGlZVIuNcg6/YOO8ChLnppfWsg4u09NBFLKAnethQFfmAWPlX7NtG/cjjsnVPTgJ586VzElHNhu75KjAQm7ezEn+0zFVZS4648BxmYhIW01jt1dCJVI/0lCwCr7X8ZYD1wJnAwSyq6vsP/UFIgWKWLw9fEmGN6p8vSptRm0mSOPcRrpj0W9q5y7/2x6tJZxaW9zpUAjc+ZN4bTTGTxNpJJdp4Y5I9Hv9Gcp+iaVfMJfUsHAcm57mO8wltqMNr+8FXfijoqbRugsA8v/1VExxSDkJqR1JyK3gDIdX2BE6iD8O3LLRSnZT8sdpwBIkg56sgO+TYip84IkE4E+Yayjmbl4qrGFZ6YUQHNpOub/hYpzSz2mHQK97QRLBz5UywNXSk34nto5Xn3pbZQazol9szlTB2wxsNrPinJLEWYErYkG3nttqdS79kNtz5NTHpDpX/o8qUCzA6dBajEYk3V3QPPkS0G2bv7M/Z8emQZsOfe3VOZOHqjdowLw=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hWcwjS2gH4y/MNBJYHEKN00vqORwSAeuXofnI04AYl/M2PLQKlSj/y0wsx?=
 =?iso-8859-1?Q?ihhvb+nsfbmoHhcDMXScjroW4gk/b3YqEso/N1M8oAKb5a2NXRgpGnyNQa?=
 =?iso-8859-1?Q?JAUdLFFAICI9GRC/pHMrLcKpB7/tQnlTWn8RMFuJnqA8TOFAISnGIsw14m?=
 =?iso-8859-1?Q?+CXhmome6Cl44hMVnc+vi1KDsL8/NennV3T9I2zRFgrCRAlmRsBD5E0IFK?=
 =?iso-8859-1?Q?MH087jJpSaRZztsrqHfk5iQk0WnGQQPBIMpJs0MxnYMnSObP19R7jpsZ/n?=
 =?iso-8859-1?Q?nnPdjifXvKFvzN5NDMKURs/rbL77ElogyXVowu7cAWtaJeV4b22/bYggs/?=
 =?iso-8859-1?Q?djKjf63tgO709jv4ko3g0cyxx0ovJFKyxAGFj96w2QWQEuvHLm4mFOzpnJ?=
 =?iso-8859-1?Q?iNBKRu0jiNq8Wd717kZsIbkecWWRIpGNGmT6xYgum0/nkHnupCecAg92OX?=
 =?iso-8859-1?Q?WKEwyJ/ZceCradRdG78OCCQiH1E4Xh1xU3HW0wO3xFcj1/K9cMGxqjo7z6?=
 =?iso-8859-1?Q?obKRkytHhn8T47DtiJQ7IsmprKOm9WqdZ6TpQzWaffIQypwyGtAoQJhuAA?=
 =?iso-8859-1?Q?pkV4gqnjHs9XsNILWFJtxpnEQ11HZ1F6C6vaNxxH2e6gzt+3t5fCqqiLG3?=
 =?iso-8859-1?Q?gSz5XRvprf5KSTNxompJ/IdPEHqDxDds24SuEezQShtA6Y7Byqafw5nLjW?=
 =?iso-8859-1?Q?svC8hS2B6EDXYufBYIuVdc1nAYYkDFxbFT4KIBOUs9wp8LiThnltVcd8sd?=
 =?iso-8859-1?Q?WZWjbWp5AhM9hA8X+b1XMBbYKZCCqVpcHOS36myt7kWhyQB4k/ZYG/TCv8?=
 =?iso-8859-1?Q?qrg20euN6ClD00aq+UCQ/RUpXWoiodBayU6Q5IyxnjqFMF96bew2bdeITR?=
 =?iso-8859-1?Q?BU8eIctCoicpB32KX73rU7uVGeeMNq4kjZZ1SiUxEkhDO+DmrkFgp4p9Yw?=
 =?iso-8859-1?Q?bMmqlpTalOtXZANRKUgqdiY3AqOxKvSwWrt8n4Rmr5W1AtemT/seij1t2e?=
 =?iso-8859-1?Q?IGMPrzYmq8eIw4MQuUie2aMkcXekA5j0aCkSQDFQt8Uvhv3hVwziGpSj57?=
 =?iso-8859-1?Q?vTKmmsf8f6zLZFRtjOEVo9FH/VAaDyO7ysPLi5h2/pWJFmozOTmEjOt3LS?=
 =?iso-8859-1?Q?yE6/g5xajaom9eW0pUUo5KYnpxC833JBRtZ+7C9tFqFodGQp1m/qDAGpL8?=
 =?iso-8859-1?Q?kO0hUzbuKuzU715gbehIMw8OLQf5PsSDhtx9azCPko8v3GNpuW+ibU5QBP?=
 =?iso-8859-1?Q?7exi7nN2BHkmUIb/5OpU++FXGmaRnqpd1p+LvywAQl3ThElmfNfRjAZ8Dp?=
 =?iso-8859-1?Q?afSM+JO8DCGRgvw+weckaT/kLA=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR19MB6526.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf7cdf8-e3a5-4f8f-0115-08dbd7b8c340
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2023 13:21:15.2230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6044
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,=0A=
=0A=
I have described my experiments on linux with a rpi and I am a bit surprise=
d that nothing works as it should.=0A=
I have posted here my tests=A0https://forums.raspberrypi.com/viewtopic.php?=
t=3D358522=0A=
And I would like to discuss the different issues.=0A=
=0A=
1) Why when enabling all protocols a sony15 is not properly recognized ?=0A=
=0A=
Testing events. Please, press CTRL-C to abort.=0A=
557.572052: lirc protocol(rc5_sz): scancode =3D 0x2fff toggle=3D1=0A=
557.572077: event type EV_MSC(0x04): scancode =3D 0x2fff=0A=
557.572077: event type EV_SYN(0x00).=0A=
557.572138: event type EV_MSC(0x04): scancode =3D 0x970026=0A=
557.572138: event type EV_SYN(0x00).=0A=
557.572130: lirc protocol(sony15): scancode =3D 0x970026=0A=
=0A=
and when I enable only sony protocol it's properly recognized:=0A=
1236.384059: lirc protocol(sony15): scancode =3D 0x970026=0A=
1236.384082: event type EV_MSC(0x04): scancode =3D 0x970026=0A=
1236.384082: event type EV_SYN(0x00).=0A=
=0A=
2) When sending a sony scancode it doesn't work because the scancode is sen=
t only once while for it work it need to be sent 3 times (or at least 2 tim=
es separated with a space of 43 * 600ms =3D 28500. Is there any flags to do=
 that because I had to patch ir-ctl to make it work.=0A=
If nothing exists can I submit some patches to fix it ?=0A=
=0A=
Regards=0A=
