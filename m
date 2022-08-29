Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D725A4B71
	for <lists+linux-media@lfdr.de>; Mon, 29 Aug 2022 14:20:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbiH2MUR convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Mon, 29 Aug 2022 08:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiH2MTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 Aug 2022 08:19:53 -0400
Received: from mgw1.skoda-auto.cz (mgw1.skoda-auto.cz [193.108.106.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDB32A5981
        for <linux-media@vger.kernel.org>; Mon, 29 Aug 2022 05:03:13 -0700 (PDT)
X-AuditID: 0ad97bd3-dab727000000627e-b2-630ca75a60a8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WymyqZVQ49NQNUPbPhXggIZ4cE3vpAmQgk631DeJGOcbKCRqJi2xO99SzjJNMkxT94Y0s1CNtUNPB/dw0QHUmzFTvLhPN/HgG6/ji78zuUDD/5xuT5oHe9mpjffFEltoxzf+EHZHDTOwXf+Sdy0UQ5nA2iPrKFMusHyNAvWVKDDMEgssCe6XZZcEH5nqttCiEDYUADgjtAbOeAGiGaFLJo9MZLvZIxFfeo/gyzv9eP71itDZMztHQU6nZpgohZPfJJuR1d7MM2hAvVcNyfzVANC2OAXCVQArzqzVndHGPMpU/GLdvA/5QR1FjCeh79wRnOjaGAvFCPkB2QBtcqVqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/9aotnqqEWilG72EaqQZVqpgr/UYcXVAFcPK9ml0+s=;
 b=f41YnnLTlx7AAjJ3/o8dRKJUSZoYMLw5I6+EFVY3KkxejB0DhRkHt7ZmbDwcgJDVXGwBlShi0eGPktn+XQCOuMeu11yD3sGMLXMreimnu2yNZTsXB+tBKqu4PTSBEnY1FFoC0omV1wlhUrWeeSSUycy87RAuBgTsKK8HSSYd1iEF9Y/yEE0Tc2rikoJBqyoFl3YNnfA4xk6jKy65DpRZ483Vr/wJt6HwlXVeoMOzXY3IauKfd1Db0PQNQJfBFBpwMfPg2GXn34Aa4vpfKBDsz7vu9StsrmjEEOlQL1At4dG4uArj6z3qQ/MXiM/wjCMectgXNgijLkJm6n3QO4T1kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digiteqautomotive.com; dmarc=pass action=none
 header.from=digiteqautomotive.com; dkim=pass header.d=digiteqautomotive.com;
 arc=none
From:   "Tuma, Martin (Digiteq Automotive)" 
        <Martin.Tuma@digiteqautomotive.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH 1/3] Added platform module alias for the xiic I2C driver
Thread-Topic: [PATCH 1/3] Added platform module alias for the xiic I2C driver
Thread-Index: AQHYtlB0bcuRWm9+fkOhJxc9utSH4q3EbX2AgAFfZDE=
Date:   Mon, 29 Aug 2022 11:47:25 +0000
Message-ID: <AM8PR05MB723552BC9CB2FE2FB23EF273FB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-2-martin.tuma@digiteqautomotive.com>
 <51e77545-e029-69f3-f5cd-f2fdf8846582@linaro.org>
In-Reply-To: <51e77545-e029-69f3-f5cd-f2fdf8846582@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Enabled=True;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SiteId=2882be50-2012-4d88-ac86-544124e120c8;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SetDate=2022-08-29T11:47:25.630Z;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Name=Internal;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_ContentBits=0;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digiteqautomotive.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ab332b0e-b8ff-4d41-0ecc-08da89b43e59
x-ms-traffictypediagnostic: AM0PR05MB4977:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9hI34IsE+GXY+zZ1OWLNADgpYJVMQM9tMUk2eUx8ktI4e1p+n3JLFqHv+dTuZAmOMFki3WaKdJ0iGyEg5EjoCF5CG5VedZh6xxi2SFbeGuA5sH1K+HDA9eZ9rf4wbVMZo3VU6HseyCw4dhDU3yiAubKYn7kJVpoPYhnaJqEBtRwA0bJtLNEQptgj9U9lr8nTjl5EAFgqdESghc7lffL3BaQ1AbmqXQZUjTDnQi40pZU965E/ObZoDS/jiTFyLEuHR0hANpLAx5h9/8d+hL6IXLY+UAX3beNiWf3cVOHypVCL+iv5Hm88jwnaN3DSq3+d1AG6ldh20sAKmRC8beaG5aS1gcfqP27Lhqy8oH6fuqXHANE1GUo/QwdWhmhz4FiK6mwJ0+GoS2w5emRS6wApqBsGdw1Jxb98TFFVDbs49YyAHsnjvYDcoh6gUrtqB/UgkadogbN5Nj6k+RmSb/O7ZcheKIfcULt8Err55wR15QNH9GUyrgR97FaraW1mHEsHSWtzVcGRhXQ0Mn7sUESx9Tr0NxRfoPoctnbm0weJK3oXw7lSve80wH8+aZYWHEzj94qSoTL6Rxk7LebD5Z8fDgw61KS/oFLZjpTJvGevYevXEUmekDkKj7PxFhnX817b8E9IxVYh1unyIYz1s2LtXryxG2U4U8MbkBDRAjQfE5nKgoGY+zs//XapTp70vSfR5cJDDjr65vQdlUPkBHB5OMnSnjr7jrCOUbahBNGi7entTd6c+iZ0iPa/16wtFLNvAz9JaRog2YHsHTa9QD2HDg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR05MB7235.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(366004)(6506007)(122000001)(38100700002)(7696005)(2906002)(66574015)(55016003)(53546011)(83380400001)(33656002)(186003)(26005)(9686003)(316002)(8676002)(86362001)(64756008)(66476007)(66556008)(71200400001)(76116006)(66946007)(66446008)(110136005)(82960400001)(52536014)(38070700005)(41300700001)(8936002)(478600001)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?rWbS/pY3xSy0I30mKnwLUt2eeQnW3Vr2eJS4EGPpbdqCnneBcFQbcPn6Ai?=
 =?iso-8859-2?Q?J5C0NUAQPHIZzghMiE55DCjALf8/kC3HhxwbNVgemrrcuV9pUHsWDZhGtQ?=
 =?iso-8859-2?Q?asOcX02GARFLSEmNKysXWZqCrriKnaRqmPGy1ba4PsiFNofFyZMKHqd16/?=
 =?iso-8859-2?Q?0qOi/5tkxA1m8ORYlUb5BVMG3P33atw4Jj4wVGdEf7vl7Vk1/0s0kD9VVj?=
 =?iso-8859-2?Q?5RxnqC9ckeDNrPoZmMemmdMT9n31rPctR7gv648VlDtZwWayQZYWp8FTFt?=
 =?iso-8859-2?Q?JfL+ydoG8QAC5/TcKvkSkkxdMTG8XPZTHDiOkMbA8MpFYtcirkDfyZ/N/n?=
 =?iso-8859-2?Q?DShj4wXAjcfPRxbvyemgOYkWraKo8gKJOg8MNgFwmYTnIB0vjiR4FMLFj2?=
 =?iso-8859-2?Q?QYfLaAE+nKzMm761H8t6Zdef460HBjiIUMFMsyPK+7EUOa48yzvYgPNeFs?=
 =?iso-8859-2?Q?F2Ni+BT/DfiTo0cLO7hdapsFB5VavFzv0SLj9pMI+Zp2uQJ/u8SemaycRN?=
 =?iso-8859-2?Q?4HEZ6jZl84VP5guS1CKYfhcmLi02vQF4F3nMzc9aMeZ9qqXbzYIMZD6OAd?=
 =?iso-8859-2?Q?4mJyuX//FhDjE5Vr9xwcZ7QEE+M2PbGtkG1s3tQ6ucQ/4p28kc+19TW4L9?=
 =?iso-8859-2?Q?MYRWaNu5eO5d7EeJjeKTd7Y1dbDz93HEBfiYx2f2dAYEmGy5m25KFD23u7?=
 =?iso-8859-2?Q?OovlmdkqmBOaeOD1O88K+ys6nCZNxh3QzSGpH/pYUrD/W66dwFX+VHivSo?=
 =?iso-8859-2?Q?t22G8lfEcYPyF0FKi4ZHjo1HfmvZZx0KdWTivFv4+PmKIGqAd7z1q9erJa?=
 =?iso-8859-2?Q?cMOEs0rIZgXs9IH+ByyB77yPLmlU63r6HVGzSAUKMKdPViv2TB91cKqLYD?=
 =?iso-8859-2?Q?UUUwucjOeFK+g3JQRGSq7LPPCGPJAXwqKAA+bvIHRttXAANtOGtYVaPrzR?=
 =?iso-8859-2?Q?qTTmmQmj61je7YIhWtlnbp5nivc9nksBryK1TsaKl2KNXpacVZrAmE9u2W?=
 =?iso-8859-2?Q?HgO7OT9JTaINDrYA/3F+F20N/lNdokVG81+8GKzx5/O8D7jSUpny5qa6F9?=
 =?iso-8859-2?Q?v2OsZO9Kgbj3IBn8st9Ur519Q/JyYXDQ3JS7AIhQ+pfRPndLNxXqijoy+k?=
 =?iso-8859-2?Q?/ECn1Q1qOjECslXbTZF9jrVTHLA6g4kOPEvePf9uKr5h0hJ6qN8ME8Keos?=
 =?iso-8859-2?Q?uGNsN4TCevtz6j5JxY+CQkRyJVVGrIE9sOCA8PL/L23k5CZDQskgBmMPmo?=
 =?iso-8859-2?Q?NrVcfb6uZ4DPoDY9I8/KCLvdBUgISaFKq2ARU7150hs0msUNrLXPELroQY?=
 =?iso-8859-2?Q?g4rsIQSgxGNeSx6/kvPvoDBQ5bjseFuNClaK5Q7y3I4GylmC5RyvQRIIHU?=
 =?iso-8859-2?Q?WIwKNbWGvkMs4xrqZ5qZ0ByfO5Sr5uqMBd7Dpo8tyDD0DXU5LPT20mw3Wo?=
 =?iso-8859-2?Q?hkHMiBQB43Vn9jCPRhyPmuOUT0r8xc6pbhkdi11k33wmVZ1aHA4ELvRI6+?=
 =?iso-8859-2?Q?Hi1iJL+aLCC81vb661IrDQjmkk/xIEafbcr6oP4ufla9dMothFHSqtyZdD?=
 =?iso-8859-2?Q?NvmkFmM4P7Z7j/6TbDBo8j+SELOnOwwlL6T2aaep2DduXDYiAw9NkD7Oq1?=
 =?iso-8859-2?Q?58A07iQbQGRl+nOP1vIgKqbwjI+Tky857MaZ5/oN5T2JuCvnRI98np1g?=
 =?iso-8859-2?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR05MB7235.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab332b0e-b8ff-4d41-0ecc-08da89b43e59
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 11:47:25.8864
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2882be50-2012-4d88-ac86-544124e120c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0MvbT2R231ACFqywkXFtZYFE3rsRmJGpahArkSvpbnJpiBUvvvSxtomd9gINBfp8LUKwfcFwrxCnnWLlJEaKhPP0fmT2ZnEN/MVVyHOueS5c5bs5kBI8ival4XN4KHO4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR05MB4977
X-OriginatorOrg: digiteqautomotive.com
X-SGG-UMAMSID: 20220829114733Z10308mxmos05.wob.vw.vwg 1oSdEr-0002gG-Lc
X-SGG-RESULT: 20220829114733Z10308mxmos05.wob.vw.vwg C1:OK E1:OK MX1:OK BL:OK SPF:off  CT: CM: SIP:10.186.25.86 SMF:Martin.Tuma@digiteqautomotive.com
X-SGG-MF: Martin.Tuma@digiteqautomotive.com
X-SGG-DKIM-Signing: fe5a965be60fd73f3484b58bce070295
X-OriginalArrivalTime: 29 Aug 2022 11:47:34.0191 (UTC) FILETIME=[20CBB3F0:01D8BB9D]
X-EEG-SA-PASSED: outgoing
X-EEG-SA-LOOP-COUNT: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42Lhulkpqhu1nCfZoHeZuUXPhq2sDowenzfJ
        BTBGcdskJZaUBWem5+nbJXBn3Dn/ja2gj6di6asmxgbG55xdjJwcQgJ6EneubWEFsSUETCTO
        relk7mLk4mAUWMYsMWHlVlYoh1Xi98k37BDOVUaJyf1tjCAtbAK+Et/vPGHrYuTgEBEol5h0
        IRYkLCzgI9F5oZ8dxBYBKrnd9okZwraS6NyynQnEZhFQlei8vRtsDK9AjETPvu0sIPOFBLYy
        Svx99g+smVPATuLSqR9gDYwCYhLfT60Bs5kFxCVuPZnPBHG2gMSSPeeZIWxRiZeP/4FdzSuw
        mVnixrYFUC80MEp8nd8HVSUrcWl+NyOE7StxbtJNqEm6EqsX90ADQ05iVe9DFghbXmLaovfs
        ELaMxIMb29kg7N1sEn8vW4MskBDYyCLxdv53qGYDiXnfjrBBJA4LSsxZ3wF1t57Es1OzWCBs
        bYllC18zT2A0moXkpVlIymYhKZsFDidBiZMzn7AsYGRZxShSnJuUm15uqJdWrlecnZ+SqFdW
        nr6JEZwkqi/vYHy3yOAQIxMH4yFGCQ5mJRHer7s4koV4UxIrq1KL8uOLSnNSiw8xSnOwKInz
        VjJdTRISSE8sSc1OTS1ILYLJMnFwgnRzSYkUp+alpBYllpZkxIPSVHwxMFFJNTDqXuH3ONOj
        7VSx8oK0n/6rnOXbO/+/Nnaujy5f8iFc0dvaPK6HZc6aAq5iq0OmfXM7PkzvW87q8NXlxIsz
        fGmhhp/iCpb4xouo1d7SzF1Z3jIhOdbpWVlIq29zSpTLvh0S3++tjGZ7IMW4rFgsctvsx3US
        UQzrkmafFWARLWr/USL1O2PzGSWW4oxEQy3mouJEAD60J5kbAwAA
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Sunday, August 28, 2022 4:47 PM
> To: Tuma, Martin (Digiteq Automotive) <Martin.Tuma@digiteqautomotive.com>; linux-media@vger.kernel.org <linux-media@vger.kernel.org>
> Subject: Re: [PATCH 1/3] Added platform module alias for the xiic I2C driver

>> On 22/08/2022 22:47, martin.tuma@digiteqautomotive.com wrote:
>> From: Martin Tùma <martin.tuma@digiteqautomotive.com>

> Thanks for the patch. Empty commits are not accepted, so instead you
> should explain here why do you need it. In general, your change should
> not be needed, so please explain in detail why do you think otherwise.

The reason the alias is required is that without the "platform" prefix, loading
the xiic module does not work properly in the mgb4 module. I can not explain
exactly why as my knowledge of the module loading mechanism in linux/modprobe
is quite limited, but that's how it is. The mgb4 v4l2 module requires two modules
that are defined using MODULE_SOFTDEP() to be loaded prior to the mgb4
module - the Xilinx I2C module and the Xilinx SPI module. The SPI module already
has the "platform" prefixed alias and loads fine, while the I2C doesn't and does
not get loaded without it. So I added the alias to make the loading work.

I will add the info that the alias is required by the mgb4 module to the commit
message the next time I will send the fixed patches, thanks for pointing this out.

M.

> Best regards,
> Krzysztof

INTERNAL
