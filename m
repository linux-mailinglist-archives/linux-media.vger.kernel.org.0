Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DB51724B95
	for <lists+linux-media@lfdr.de>; Tue,  6 Jun 2023 20:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239033AbjFFSlq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jun 2023 14:41:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233968AbjFFSlp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jun 2023 14:41:45 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2107.outbound.protection.outlook.com [40.92.99.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3B510CB;
        Tue,  6 Jun 2023 11:41:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ihfko02hqfQ6bHfVJEDafVtfiRSr3xOfT/GMH4CViM4CZO7m5yyWTUScpZ4wkBMIxEbfEMfeUTDAQFm2Vq5/9lfgYZUcMeBBJbY6f/yNZwI3oZIhcKRkAJPZHGucV+HJRlEEXXq+FbNv82qExDvAlyCFxCMW6KdgPtUxcm+3hVUcK0ZhTNCVZS59Dst742wr3+MoKfZvWaScep3kji0ZM1aMxedMutKsZniqMc3Gbt+8iBU1wDxSqSfadidKsJHuoHzmtGxHKv7egaJ5Tn4Kx4LAHvCNj3lA2w6UQui4z4uuHoPcrQC2x3WX0NLWCSgRxF+QPMzTdXM4G/OKXErslQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg/6n6kOTPybzKRkr6LSkSun5GWsXy+TsoePOAYAIcM=;
 b=Wn96G28UEjZjhZtb0K6mfRI8ZLN70ZoVuqhiBAqdprxVRAjCTARSbaKZJbgfWJh1srIC90JJV3sk1vDPpTpscuI56+NJ0A5LLmdG0JwnaCJ05SPSeipXsAmbPK8abYtv7hNs1wwRkPP7RA+yDoKG/7TZD0CIiQSJ4SAaolvmrGCoLIjtJMLIMzHQBdP6YUG28AcBzNeiz+hF0iRLStqdiWIp8lnR2BU5sG+W+TPeOOQ0gfcQseNdL9Fqy10WDjBgyKWQHHAWVUVPT2ir8eL/lQWMeUAAtSM/oKb9cVCtK5c8iKc+IjAeN8TjKYdW95e2iY13BDu00bWjT9fCg03WdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg/6n6kOTPybzKRkr6LSkSun5GWsXy+TsoePOAYAIcM=;
 b=kG/+6QJpyNMSAcZnTN1IlVnGwbejgIa0ds11OQ9j/oYWucRi78B2XL79V3/Hm15mHQJlbylFeD3j7IWuRHKk8SkTnrxa4sGHo5dc0PPM5oZhOqHpv0yIB8dFgomKNHSQcb2PloUGzOpspJmODJg3+VtDz5LMsI524LZV7I1HSZRoAucEYqlk8+lqdsZOfil0Zaf2iTCyjpl08lhxlhVIPiamr6sYRSsewDqmoRNbXAbLfJFLZfoAusf4AeJ01wKXI2hwfpE0GoyFPNOpbrasA1owSMSofCpFgUeGXiSSoD22SK4woFdjmXE/kXtfJ6/ezuadJLY4Tbyi2e56Wr7UbQ==
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:252::12)
 by TYTP286MB3628.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:39d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 18:41:33 +0000
Received: from TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5805:16d6:6ab7:6639]) by TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 ([fe80::5805:16d6:6ab7:6639%5]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 18:41:33 +0000
Message-ID: <TY3P286MB26116576E3E502CAE53834599852A@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
Date:   Wed, 7 Jun 2023 02:41:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Cc:     wiagn233@outlook.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        christian.koenig@amd.com, Bjorn Andersson <andersson@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
        Chris Morgan <macromorgan@hotmail.com>,
        Jack Zhu <jack.zhu@starfivetech.com>,
        Shengyang Chen <shengyang.chen@starfivetech.com>,
        Changhuang Liang <changhuang.liang@starfivetech.com>
To:     Conor Dooley <conor@kernel.org>,
        Keith Zhao <keith.zhao@starfivetech.com>
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-2-keith.zhao@starfivetech.com>
 <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
From:   Shengyu Qu <wiagn233@outlook.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
In-Reply-To: <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Bdn9EJ7FCQ0QRvpas7Efd6gF"
X-TMN:  [XDcHp05z/Lgag+icBwHqxwA7kjf9lSFi]
X-ClientProxiedBy: SI2PR01CA0006.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::14) To TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:252::12)
X-Microsoft-Original-Message-ID: <41a667da-c9d8-c2aa-482f-4723cdc7b7fe@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3P286MB2611:EE_|TYTP286MB3628:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc7013e-d87c-44bc-cac0-08db66bda638
X-MS-Exchange-SLBlob-MailProps: fcPjpjEBrqVyWeFOBzmypFHkYi6vrKlhxvjXdl7AVdPVu5R2jOCv0pC/MPD21Yjbb+k0vBwEhGCbgP1yJsr9uVdND7MGh86ttM9GbBe0JYx51SBtgCnkxW7nuk4ePFyeuqtnP4WIlJs+kKR8Pz9vkO4YQgEC8iNhk66bYj8hK5KyP3B9U0vGfzPL5yY+iFniN23LtJGQazf7YUa+Zujr4bk8C06uMenag1hbHBQVucCE2Gh6HjzC4xZdvZyR+xZecU97bY8Rsvaskj26pPyJkqrnsrRme+kA3qZbwloQ8OXH1FA0G/bqWJaTC5V8YqQoOFIFvR8Tp1TPPHMJVI0hcTviCkRZXcKrngRGU2VZjETWI7otIAiuUS5JtXR9mBomowfW17lQAOVkfH4/z756Nbtv6JgMCWvoMfqBLg+I5GfHZSr8R5QVhCDoBDRVAZWyw2g5+WlWDa0J8doa16wH8hWJd/oKhubzmt1/W7hTbLMiAns/PwTkeLx6i7dxj+sUVCcSQdD4RpjKSGclR/YywnoKlq0RAzgpycdDLTf0Q32Z7wJ4GEBEv/XHxF2KdWsMRggR/JGse5uwEWCCvcH7q7Ccr7IoLG/CPtLKuM/3pAogljFW1v0GyGrgFdeRXqjw/Owo5nNO+serphfGWrMUV0C/fq8ywSlN9YFwFjVtVjzw4Oo2u34WOcJw6AJl6w0fNuSSoQ840QGJQfaOy5PaiUi7VI0uoG4d7kdc/M94Bpr0U8wCj/fN3/Ftk5u4yWCYozAvHCxXmSgjCnfdChUEMJjegrcH/0U1r6NFgIR/b4g=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPGziGOH1mNYj7bIgq2bJtGQ3HJqjuCzoonT5S26vmDRx5tukmZDRWjgEuDRGc25V+xW+yOAyPQpevjNvSpjK8Bf1v6d1bycvZy3+8MMG16p2ft1a2l9OZhDUtJ5aNSE4mZnp+nnxCKIaJbeh29VaNIJW24PvjwzawlmD/r/+pZonYMR/qcSP9NDg0PumLR3URdgmjO5RKgEFZqEC7MZZ0MFFsyk7ibocJXQhCOqxPS91eZCLMPXKnKDesohV5pCUBSSW5wM/JyDeXmy9ngo6Spzq7iRTE2Yv2nJa9jHl/Hi28iIcePJEX7aVNzAqPj3kGync0Y8nKGLuPwGSJdXAbqEKLtB5oeh2mTNmq5eIers5Bjg6WOnvZlxvhj+Zi4RrEGqbRcMjSCw+0oTEaSsFOaFmuxnuzVfCGhIMiHfN6lLvbP7mlKDJI5eGIYTLtHWXM2ove88vNSmhRfIyWfZDQDzagojRloVV1JcUgC2+GsitJuSLxm1LJ2VMhFEbMuGXYnCYUbxGyK/YUvHTNyoTkDGOP5RJbbGBRkEqcdgEVbO2CXkCHQHNXRBu0d7sF32GdM3WIgYNBRI0PEAF57Y2AWF8nSWU1RCEwkBn0yq9SXEUwGvfC/gpWG4cpbaGQQzhSwAWrk43udKzx9/F0LMFhAQ75/eJBSmB/enFMxqo6LlNWtWWRQd5Ni7YDziiDqu
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3J1MWJTaSsrcFplVGY2MGluU3FlY1pYbVVNNTBySWpPcGYwZlMzdkRXTTlW?=
 =?utf-8?B?cWEvRm9qbDM2T0tYRlZsVGEvVTdMNWZFMyszdXFROWlHU0JwRkl0T2Z0eDU4?=
 =?utf-8?B?UzRTUlRmd2J3ZGRrZDlZcDBtdmcyOURxNUQ5dVpDYXlOTThtdEVDTmNnN1Fa?=
 =?utf-8?B?dElybDdzZUhUV3dxSnpRWlk2VkJlNW9rRm1XN1lJUzVVUlRtY3JUVjJFeURF?=
 =?utf-8?B?cnlqeGtNTG40QlFzOXhlSlZBcmVCdE1pU3hiYU9LZ1IzYWZFbnQrdFAwNHg1?=
 =?utf-8?B?eTZWTDZML2VqNFhGKzl3Zys3a0VKVFRmY3BkUm9nZEdiT2NROERaUFV6T20y?=
 =?utf-8?B?bTJ4bnA1N3haVmc0aUhQS21HK3pRVmV5R0ZnV0tIZ2kzc3o1eHlvdWU3cnJl?=
 =?utf-8?B?bEtFSDB3dEw1Q2xOZ3BtcjlwT0JMaGNuRmNac2dZazAyUDNFbEZ6ZytqSXds?=
 =?utf-8?B?RGE5OW5RZG9HRlc4NHJ2UUZOVXlHOXlmSUN4Sm9VeGFQYkY5amFNcGMxY2xs?=
 =?utf-8?B?MTUrOWorbUljT2pMSnVPendWZFFJazJWak01akp2TS96RDd4d0d0VGZnR0t4?=
 =?utf-8?B?Z3ZwUE4yNXBiNGMxZFlwclVDYlJlaTkxR0M5YnhLVjhkOVR2dmIzbVFncXYw?=
 =?utf-8?B?QmR1eUkrRU9ZRmJPdWFsSGdnenVkSjAyTTcvQU54bzRoTUlhVkNXMlBjeGN2?=
 =?utf-8?B?VFZ3SGtDa0x6SXk5YUtEQXg0UGtWOGtjcE5hcTBUVWYrQjhidmFNdjdZYmhF?=
 =?utf-8?B?aHRhdjZDL0NlM2FybG42NHp3Y2ZmM0o1bWl1aDk1ZzdBN0dqa2YzNjdxa1Ux?=
 =?utf-8?B?MzFyNmxGSG1YM1NkRDZZQWlCck5IT2JseFh4dGs2UmJrYXcyK0NEYnpPQWU0?=
 =?utf-8?B?c2lLNHU2b0xnUFp0OGtkZzFvMEhzWE1YMkFQc2dyZTFZcnRpSzkwYkhhZzlL?=
 =?utf-8?B?aitPVnNKbEFwM2NWM0trc2ZxK3VXVmk5T3Q3T0FZMmlMSUtOYlZ0RXB2MHdj?=
 =?utf-8?B?S2xiL3BMMjJ1ZDZITmRqdEVydnNkdXZUaG03aEg1cFJ4QWJrd3JBeGZoYzVj?=
 =?utf-8?B?c0FRcXFHZ3UwS3JieVRsNHcvQmpZVGtVS3dzSWJPQXNrblU2aXVFUEY2OEZm?=
 =?utf-8?B?R2hCa0RQMWF6dEFOam5vM0s5MmhpL25kWE5HZGdKaFJDRFNBbkpYQzlKekFa?=
 =?utf-8?B?N3NxWDVVQUk3UUFydFdZSitVQWdUT3VBNjNIeDZiYzRlN3JkQUlGSzJ0SHBD?=
 =?utf-8?B?c3I1MjZEYmxFNTh1UVJ0aU5ldnlOY1BZWk9pRjZPM282YjkyTXMzUmNHdUVP?=
 =?utf-8?B?Q1oyZFp1azV0SkdrL0RwZnVPSUZ3MnZBNkNUY1JpOXJ5YzlSaGZPTkpoVnVW?=
 =?utf-8?B?azdHeUZrZldRNVhhKzlUd2JXQUkyVHA1MkpTSXBiVGpLbnh3NEV2bUluU0xD?=
 =?utf-8?B?c0IrczRmTnI5aHA3azZYbllnUFRuelhnUEs5dFRSYTJaQ0JHbHlMM3RudnVG?=
 =?utf-8?B?OTNqNDcvdS9nbXR5bm9EL253WE5WR2k0NHJ1NHRCRGNLcTRlRFVVQ0FGbFBP?=
 =?utf-8?B?cHNVdURySUZHQmxQS1d6alh2czFwTm9XcFNUT2ZOVXR0UW5RL0ZGcCsxalI3?=
 =?utf-8?B?MXVaK2JRMXVMWVFDcUltUVZ1TWpsQXc9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc7013e-d87c-44bc-cac0-08db66bda638
X-MS-Exchange-CrossTenant-AuthSource: TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2023 18:41:33.0257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYTP286MB3628
X-Spam-Status: No, score=0.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_MUA_MOZILLA,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--------------Bdn9EJ7FCQ0QRvpas7Efd6gF
Content-Type: multipart/mixed; boundary="------------G1MgENzfrmb6x33BsN1N0elC";
 protected-headers="v1"
From: Shengyu Qu <wiagn233@outlook.com>
To: Conor Dooley <conor@kernel.org>, Keith Zhao <keith.zhao@starfivetech.com>
Cc: wiagn233@outlook.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Chris Morgan <macromorgan@hotmail.com>, Jack Zhu
 <jack.zhu@starfivetech.com>, Shengyang Chen
 <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Message-ID: <41a667da-c9d8-c2aa-482f-4723cdc7b7fe@outlook.com>
Subject: Re: [PATCH 1/9] dt-bindings: display: Add yamls for JH7110 display
 subsystem
References: <20230602074043.33872-1-keith.zhao@starfivetech.com>
 <20230602074043.33872-2-keith.zhao@starfivetech.com>
 <20230602-uncommon-rejoicing-e73c0c475f9f@spud>
In-Reply-To: <20230602-uncommon-rejoicing-e73c0c475f9f@spud>

--------------G1MgENzfrmb6x33BsN1N0elC
Content-Type: multipart/mixed; boundary="------------3hl4j24uhO3sWvAwEcZCrH57"

--------------3hl4j24uhO3sWvAwEcZCrH57
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ29ub3IsDQoNCj4gSGV5IEtlaXRoLA0KPg0KPiBPbiBGcmksIEp1biAwMiwgMjAyMyBh
dCAwMzo0MDozNVBNICswODAwLCBLZWl0aCBaaGFvIHdyb3RlOg0KPj4gQWRkIGJpbmRpbmdz
IGZvciBKSDcxMTAgZGlzcGxheSBzdWJzeXN0ZW0gd2hpY2gNCj4+IGhhcyBhIGRpc3BsYXkg
Y29udHJvbGxlciB2ZXJpc2lsaWNvbiBkYzgyMDANCj4+IGFuZCBhbiBIRE1JIGludGVyZmFj
ZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBLZWl0aCBaaGFvIDxrZWl0aC56aGFvQHN0YXJm
aXZldGVjaC5jb20+DQo+PiAtLS0NCj4+ICAgLi4uL2Rpc3BsYXkvdmVyaXNpbGljb24vc3Rh
cmZpdmUtaGRtaS55YW1sICAgIHwgIDkzICsrKysrKysrKysrKysrKw0KPj4gICAuLi4vZGlz
cGxheS92ZXJpc2lsaWNvbi92ZXJpc2lsaWNvbi1kYy55YW1sICAgfCAxMTAgKysrKysrKysr
KysrKysrKysrDQo+PiAgIC4uLi9kaXNwbGF5L3ZlcmlzaWxpY29uL3ZlcmlzaWxpY29uLWRy
bS55YW1sICB8ICA0MiArKysrKysrDQo+PiAgIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Zl
bmRvci1wcmVmaXhlcy55YW1sICB8ICAgMiArDQo+PiAgIE1BSU5UQUlORVJTICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArKw0KPj4gICA1IGZpbGVzIGNoYW5n
ZWQsIDI1NCBpbnNlcnRpb25zKCspDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbi9zdGFyZml2
ZS1oZG1pLnlhbWwNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uL3ZlcmlzaWxpY29uLWRjLnlh
bWwNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uL3ZlcmlzaWxpY29uLWRybS55YW1sDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3ZlcmlzaWxpY29uL3N0YXJmaXZlLWhkbWkueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uL3N0YXJmaXZlLWhkbWkueWFt
bA0KPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uYzMw
Yjc5NTRhMzU1DQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS92ZXJpc2lsaWNvbi9zdGFyZml2ZS1oZG1pLnlh
bWwNCj4+IEBAIC0wLDAgKzEsOTMgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICst
LS0NCj4+ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvdmVy
aXNpbGljb24vc3RhcmZpdmUtaGRtaS55YW1sIw0KPj4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZp
Y2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4gKw0KPj4gK3RpdGxlOiBT
dGFyRml2ZSBIRE1JIHRyYW5zbWl0ZXINCj4+ICsNCj4+ICtkZXNjcmlwdGlvbjoNCj4+ICsg
IFRoZSBTdGFyRml2ZSBTb0MgdXNlcyB0aGUgSERNSSBzaWduYWwgdHJhbnNtaXRlciBiYXNl
ZCBvbiBpbm5vc2lsaWNvbiBJUA0KPiBJcyBpbm5vc2lsaWNvbiB0aGUgc2FtZSB0aGluZyBh
cyB2ZXJpc2lsaWNvbj8gQWxzbw0KPiBzL3RyYW5zbWl0ZXIvdHJhbnNtaXR0ZXIvLCBib3Ro
IGhlcmUgYW5kIGluIHRoZSB0aXRsZS4NCg0KSSB0aGluayB0aGF0IGlzIG5vdCB0aGUgc2Ft
ZSwgSSByZW1lbWJlciBSb2NrY2hpcCBoYXMgdXNlZCBhIEhETUkgDQp0cmFuc21pdHRlciBm
cm9tDQoNCklubm9zaWxpY29uLCBhbmQgdGhlcmUgaXMgYSBleGlzdGluZyBkcml2ZXIgZm9y
IHRoYXQgaW4gbWFpbmxpbmUuDQoNClNvIEtlaXRoLCBpZiB0aGF0J3MgdHJ1ZSwgSSB0aGlu
ayBpdCBpcyBiZXR0ZXIgdG8gc2VwZXJhdGUgdGhlIEhETUkgDQpzdHVmZiBhbmQgcmV1c2Ug
ZXhpc3RpbmcNCg0KZHJpdmVyLg0KDQpCZXN0IHJlZ2FyZHMsDQoNClNoZW5neXUNCg0KPg0K
Pj4gKyAgdG8gZ2VuZXJhdGUgSERNSSBzaWduYWwgZnJvbSBpdHMgaW5wdXQgYW5kIHRyYW5z
bWl0IHRoZSBzaWduYWwgdG8gdGhlIHNjcmVlbi4NCj4+ICsNCj4+ICttYWludGFpbmVyczoN
Cj4+ICsgIC0gS2VpdGggWmhhbyA8a2VpdGguemhhb0BzdGFyZml2ZXRlY2guY29tPg0KPj4g
KyAgLSBTaGVuZ1lhbmcgQ2hlbiA8c2hlbmd5YW5nLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4N
Cj4+ICsNCj4+ICtwcm9wZXJ0aWVzOg0KPj4gKyAgY29tcGF0aWJsZToNCj4+ICsgICAgY29u
c3Q6IHN0YXJmaXZlLGhkbWkNCj4gSXMgdGhpcyBnb2luZyB0byB3b3JrIG9uIGV2ZXJ5IFNv
QyB0aGF0IFN0YXJGaXZlIGhhcyBldmVyICYgd2lsbCBldmVyDQo+IG1ha2U/IFBsZWFzZSB1
c2Ugc29jLWJhc2VkIGNvbXBhdGlibGVzIDspDQo+DQo+PiArDQo+PiArICByZWc6DQo+PiAr
ICAgIG1pbkl0ZW1zOiAxDQo+PiArDQo+PiArICBpbnRlcnJ1cHRzOg0KPj4gKyAgICBpdGVt
czoNCj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBUaGUgSERNSSBob3QgcGx1ZyBkZXRlY3Rp
b24gaW50ZXJydXB0Lg0KPj4gKw0KPj4gKyAgY2xvY2tzOg0KPj4gKyAgICBpdGVtczoNCj4+
ICsgICAgICAtIGRlc2NyaXB0aW9uOiBTeXN0ZW0gY2xvY2sgb2YgSERNSSBtb2R1bGUuDQo+
PiArICAgICAgLSBkZXNjcmlwdGlvbjogTWNsayBjbG9jayBvZiBIRE1JIGF1ZGlvLg0KPj4g
KyAgICAgIC0gZGVzY3JpcHRpb246IEJjbGsgY2xvY2sgb2YgSERNSSBhdWRpby4NCj4+ICsg
ICAgICAtIGRlc2NyaXB0aW9uOiBQaXhlbCBjbG9jayBnZW5lcmF0ZWQgYnkgSERNSSBtb2R1
bGUuDQo+PiArDQo+PiArICBjbG9jay1uYW1lczoNCj4+ICsgICAgaXRlbXM6DQo+PiArICAg
ICAgLSBjb25zdDogc3lzY2xrDQo+PiArICAgICAgLSBjb25zdDogbWNsaw0KPj4gKyAgICAg
IC0gY29uc3Q6IGJjbGsNCj4+ICsgICAgICAtIGNvbnN0OiBwY2xrDQo+PiArDQo+PiArICBy
ZXNldHM6DQo+PiArICAgIGl0ZW1zOg0KPj4gKyAgICAgIC0gZGVzY3JpcHRpb246IFJlc2V0
IGZvciBIRE1JIG1vZHVsZS4NCj4+ICsNCj4+ICsgIHJlc2V0LW5hbWVzOg0KPj4gKyAgICBp
dGVtczoNCj4+ICsgICAgICAtIGNvbnN0OiBoZG1pX3R4DQo+IFlvdSBvbmx5IGhhdmUgb25l
IGl0ZW0gaGVyZSwgeW91IGRvbid0IG5lZWQgdGhlICJpdGVtczogLSBjb25zdDoiLA0KPiAi
Y29uc3Q6IiBhbG9uZSB3aWxsIGRvLg0KPg0KPg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uL3ZlcmlzaWxp
Y29uLWRjLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS92ZXJpc2lsaWNvbi92ZXJpc2lsaWNvbi1kYy55YW1sDQo+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPj4gaW5kZXggMDAwMDAwMDAwMDAwLi4xMzIyNTAyYzRjZGUNCj4+IC0tLSAvZGV2
L251bGwNCj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L3ZlcmlzaWxpY29uL3ZlcmlzaWxpY29uLWRjLnlhbWwNCj4+IEBAIC0wLDAgKzEsMTEw
IEBADQo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBC
U0QtMi1DbGF1c2UpDQo+PiArJVlBTUwgMS4yDQo+PiArLS0tDQo+PiArJGlkOiBodHRwOi8v
ZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5L3ZlcmlzaWxpY29uL3ZlcmlzaWxpY29u
LWRjLnlhbWwjDQo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjDQo+PiArDQo+PiArdGl0bGU6IFN0YXJGaXZlIGRpc3BsYXkgY29u
dHJvbGxlcg0KPj4gKw0KPj4gK2Rlc2NyaXB0aW9uOg0KPj4gKyAgVGhlIFN0YXJGaXZlIFNv
QyB1c2VzIHRoZSBkaXNwbGF5IGNvbnRyb2xsZXIgYmFzZWQgb24gVmVyaXNpbGljb24gSVAN
Cj4+ICsgIHRvIHRyYW5zZmVyIHRoZSBpbWFnZSBkYXRhIGZyb20gYSB2aWRlbyBtZW1vcnkN
Cj4+ICsgIGJ1ZmZlciB0byBhbiBleHRlcm5hbCBMQ0QgaW50ZXJmYWNlLg0KPiBJcyBpdCBi
YXNlZCBvbiBWZXJpc2lsaWNvbiBJUCwgb3IgaXMgaXQgZXhhY3RseSB0aGF0IHZlcmlzaWxp
Y29uIElQPyBJDQo+IGFzayBiZWNhdXNlLi4uDQo+DQo+PiArbWFpbnRhaW5lcnM6DQo+PiAr
ICAtIEtlaXRoIFpoYW8gPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4+ICsgIC0g
U2hlbmdZYW5nIENoZW4gPHNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20+DQo+PiAr
DQo+PiArcHJvcGVydGllczoNCj4+ICsgIGNvbXBhdGlibGU6DQo+PiArICAgIGNvbnN0OiB2
ZXJpc2lsaWNvbixkYzgyMDANCj4gLi4udGhlIGNvbXBhdGlibGUgaXMgdGhlIHZlcmlzaWxp
Y29uIElQLiBJIHdvdWxkIGJlIGEgbG90IGhhcHBpZXIgaWYNCj4gdGhlIGNvbXBhdGlibGVz
IHdlcmUgc2V0IHlwIGZvciBzb21ldGhpbmcgbGlrZToNCj4gInN0YXJmaXZlLGpoNzExMC1m
b28iLCAidmVyaXNpbGljb24sZGM4MjAwIg0KPg0KPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uL3ZlcmlzaWxp
Y29uLWRybS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvdmVyaXNpbGljb24vdmVyaXNpbGljb24tZHJtLnlhbWwNCj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0DQo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmFlZDhkNGFmMmM1NQ0KPj4gLS0tIC9k
ZXYvbnVsbA0KPj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rp
c3BsYXkvdmVyaXNpbGljb24vdmVyaXNpbGljb24tZHJtLnlhbWwNCj4+IEBAIC0wLDAgKzEs
NDIgQEANCj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkNCj4+ICslWUFNTCAxLjINCj4+ICstLS0NCj4+ICskaWQ6IGh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL2Rpc3BsYXkvdmVyaXNpbGljb24vdmVyaXNpbGlj
b24tZHJtLnlhbWwjDQo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjDQo+PiArDQo+PiArdGl0bGU6IFZlcmlzaWxpY29uIERSTSBt
YXN0ZXIgZGV2aWNlDQo+PiArDQo+PiArbWFpbnRhaW5lcnM6DQo+PiArICAtIEtlaXRoIFpo
YW8gPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT4NCj4+ICsgIC0gU2hlbmdZYW5nIENo
ZW4gPHNoZW5neWFuZy5jaGVuQHN0YXJmaXZldGVjaC5jb20+DQo+PiArDQo+PiArZGVzY3Jp
cHRpb246IHwNCj4+ICsgIFRoZSBWZXJpc2lsaWNvbiBEUk0gbWFzdGVyIGRldmljZSBpcyBh
IHZpcnR1YWwgZGV2aWNlIG5lZWRlZCB0byBsaXN0IGFsbA0KPj4gKyAgZGlzcGxheSBjb250
cm9sbGVyIG9yIG90aGVyIGRpc3BsYXkgaW50ZXJmYWNlIG5vZGVzIHRoYXQgY29tcHJpc2Ug
dGhlDQo+PiArICBncmFwaGljcyBzdWJzeXN0ZW0uDQo+PiArDQo+PiArcHJvcGVydGllczoN
Cj4+ICsgIGNvbXBhdGlibGU6DQo+PiArICAgIGNvbnN0OiB2ZXJpc2lsaWNvbixkaXNwbGF5
LXN1YnN5c3RlbQ0KPiBTYW1lIGhlcmUuDQo+DQo+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhlcy55YW1sDQo+PiBp
bmRleCA4MmQzOWFiMDIzMWIuLjUyYzA0ZmQwOThiZSAxMDA2NDQNCj4+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbA0KPj4g
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZlbmRvci1wcmVmaXhl
cy55YW1sDQo+PiBAQCAtMTQzNiw2ICsxNDM2LDggQEAgcGF0dGVyblByb3BlcnRpZXM6DQo+
PiAgICAgICBkZXNjcmlwdGlvbjogVmFyaXNjaXRlIEx0ZC4NCj4+ICAgICAiXnZkbCwuKiI6
DQo+PiAgICAgICBkZXNjcmlwdGlvbjogVmFuIGRlciBMYWFuIGIudi4NCj4+ICsgICJedmVy
aXNpbGljb24sLioiOg0KPj4gKyAgICBkZXNjcmlwdGlvbjogVmVyaXNpbGljb24gVGVjaG5v
bG9naWVzLCBJbmMuDQo+IFRoaXMgc2hvdWxkIGJlIGluIGl0J3Mgb3duIHBhdGNoLg0KPg0K
PiBDaGVlcnMsDQo+IENvbm9yLg0KPg0KPj4gICAgICJedmVydGV4Y29tLC4qIjoNCj4+ICAg
ICAgIGRlc2NyaXB0aW9uOiBWZXJ0ZXhjb20gVGVjaG5vbG9naWVzLCBJbmMuDQo+PiAgICAg
Il52aWEsLioiOg0KPj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMN
Cj4+IGluZGV4IDJhMDQ5NjQ0OGI3Zi4uMjkzYWExM2Q0ODRjIDEwMDY0NA0KPj4gLS0tIGEv
TUFJTlRBSU5FUlMNCj4+ICsrKyBiL01BSU5UQUlORVJTDQo+PiBAQCAtNzA0OSw2ICs3MDQ5
LDEzIEBAIEY6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2Jy
Y20sYmNtMjgzNS0qLnlhbWwNCj4+ICAgRjoJZHJpdmVycy9ncHUvZHJtL3ZjNC8NCj4+ICAg
RjoJaW5jbHVkZS91YXBpL2RybS92YzRfZHJtLmgNCj4+ICAgDQo+PiArRFJNIERSSVZFUlMg
Rk9SIFZFUklTSUxJQ09ODQo+PiArTToJS2VpdGggWmhhbyA8a2VpdGguemhhb0BzdGFyZml2
ZXRlY2guY29tPg0KPj4gK0w6CWRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+
ICtTOglNYWludGFpbmVkDQo+PiArVDoJZ2l0IGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Au
b3JnL2RybS9kcm0tbWlzYw0KPj4gK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L3ZlcmlzaWxpY29uLw0KPj4gKw0KPj4gICBEUk0gRFJJVkVSUyBGT1Ig
VklWQU5URSBHUFUgSVANCj4+ICAgTToJTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+DQo+PiAgIFI6CVJ1c3NlbGwgS2luZyA8bGludXgrZXRuYXZpdkBhcm1saW51eC5v
cmcudWs+DQo+PiAtLSANCj4+IDIuMzQuMQ0KPj4NCg==
--------------3hl4j24uhO3sWvAwEcZCrH57
Content-Type: application/pgp-keys; name="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Disposition: attachment; filename="OpenPGP_0xE3520CC91929C8E7.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
lMSoVV3z1s8dA1DK95ykSdIFtVZT
=3Dr4B8
-----END PGP PUBLIC KEY BLOCK-----

--------------3hl4j24uhO3sWvAwEcZCrH57--

--------------G1MgENzfrmb6x33BsN1N0elC--

--------------Bdn9EJ7FCQ0QRvpas7Efd6gF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEET/yoGP3p5Zl+RKVuX75KBAfJsRkFAmR/fc4ACgkQX75KBAfJ
sRmg+A/+N5dL+KeCi1Oy3etP0LSAjj5MfGG944+OAsJA/7DgZ0nW9Jr3j+c3YHRi
tBbLzMoQ1PNOw1vH+KSmz0y6GA8zcTffCfHK/3+HT8qj3C2nS6zo2xroQSOcFxRr
WMTSBpOmZoWv1DGXzvT93E3/SIYyDr8O005+/+XpgRSQyP9eqtqa714wZCAjTQ3Q
hKo6s1U7wpkapkiOzZ6yb/OFMdeHU++zfbVztMcyLs2fysP7rii1VWZ2LRrfVlEP
VtgFnan5Nxe8jQoIiXbvLRW4CEseaqmWrBAvRfmGjV1/fWLwydSqLTzwo/FO/t9v
QNg9vzB1xZqefboJm5BFaQ2kJqkzeDBT+NsEALyOtYRX4F6I5m8um5fOUXkT8V/8
Oq8JDQI5sgpTSLgFQFa2g8PifW1GeemykHoJVKuAIXXmVLU46RD4BRUk0bE38yUO
T1iw/nwx6G8XieVXJk4cTWw9w7muAIUOPykI7rsmHbtoXqQlFHazEaIsgRc31JcT
U5uWXYEbMkXJ23RrdMOG1ZaBK3vkYBnxMN0nhARivc81huDUdXp3ENdnwuyK9De5
wqsW0mpWjDe6qySpTzFiarfTVmMKn35bvGbheBHYhTT9mhGZSOkO9MNIs74Yt6aP
XXb0YhLtzQm3CQTl+dXqbcTB2JUAURbaMJXRuXgGnrXG+QhC2vM=
=MkqD
-----END PGP SIGNATURE-----

--------------Bdn9EJ7FCQ0QRvpas7Efd6gF--
