Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCBDD5A6B7A
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 19:58:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbiH3R6v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 30 Aug 2022 13:58:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiH3R6N (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 13:58:13 -0400
Received: from mgw1.skoda-auto.cz (mgw1.skoda-auto.cz [193.108.106.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E16515A27
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 10:56:32 -0700 (PDT)
X-AuditID: 0ad97bd3-dab727000000627e-03-630e4f4ef4b7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nzVXpHqorYcjZucaYRJA4eeNElpsAUUZCljO7ro5ptCYn0Kdwg2J3kn3yy17uIwTQUt8PaHUOk/eStPdB/s1xvFm4A6KIkANHmtjy1LdtA7qhjpja8EHTwoPjKaOB4AWVNVJmnBWLGzXkRecSzuEKMb+6jBkVA0bMgRklViCUKsfNgovMMvR3dKtyHi0qF+rcDBqwXvFaAnY6szNRyvyMBNFYHAd4Kbne0nIDkULXrHNeejb+aXQsxoOwKxGcmTtRV27NTg8ajIW4ZeBqQeKTK2fWfyeS6npyx/C060EUUFiHSndFOav4PH/YZ39vFqwaaDyCumbgcBhAdvAM+VRWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAOWl0MsDQ0cU9sE7Yfs4/IwXZOrjqFaga8HYoOmzA8=;
 b=mx016C3MggrOACXcQIlNH3Vo28Xg/ah6M9Hy8wbld+IDOkcoUHZ1yaYMOzgJKHpdyF9z4ouw27WYUxwMYq8iErDJDxfApABj2JzSycc2AatIBno11cUZeh/+mDLOlo0cO0/JtI48PBy4gNXMuLXLCRKadTpCj/GcLgg9KN9asUd+3w+ST2Y4+2i5QaDUtY51Ro9Vd8nWFLcJlNH+GZtkZLGXGK1XYd4W5juYxkbEgDUjMKFZ8G0Q8H9XuavVNBvH74ioDpEAPe9vS+CRbPB5uqr2NX+X33Qnkxba7avMf8WGPFVk+puUacbr11J2dCwS8qHQCI4x4FOuqXkxUpiO4Q==
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
Thread-Index: AQHYtlB0bcuRWm9+fkOhJxc9utSH4q3EbX2AgAFfZDGAAUyKAIAAqM4n
Date:   Tue, 30 Aug 2022 17:56:27 +0000
Message-ID: <AM8PR05MB7235232C96D3F847EE5AFC8CFB799@AM8PR05MB7235.eurprd05.prod.outlook.com>
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-2-martin.tuma@digiteqautomotive.com>
 <51e77545-e029-69f3-f5cd-f2fdf8846582@linaro.org>
 <AM8PR05MB723552BC9CB2FE2FB23EF273FB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
 <812ca17b-5e51-b974-16aa-2180d07b4be9@linaro.org>
In-Reply-To: <812ca17b-5e51-b974-16aa-2180d07b4be9@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Enabled=True;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SiteId=2882be50-2012-4d88-ac86-544124e120c8;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SetDate=2022-08-30T17:56:26.622Z;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Name=Internal;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_ContentBits=0;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digiteqautomotive.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fed60b0c-f827-4b7a-6b12-08da8ab0f623
x-ms-traffictypediagnostic: PAXPR05MB8287:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3+ciB8dTIiyFyq6izfTLBW10ufTq94XrFCDp5ubwwGd3fLFQm9XKVEJdDoq059KRAo8QxvZum3OvayQZ4ZoYaEWQsAYZ5B9y7QGXpqdAKjDa8J50z2LOhVjrFerKGqmvKv4JHxJKBIiFjE/idun069VzV0thx63rl2bfX8PmXoi7Qfm/+Dci8Rc0ag/cLeDnLZC+YFy4z9dlciF4vNmpC16Zb8bGk7QGjP/O3bzkYmAPKlH0BAqb7BnqO+69vaEmMW3C4BQmIz6U/OzN1qiqP6xvxF4foi/VGwECKDxscnOVxJT0t5EBIzJbDi1fRYhE4VrLt1i82IAthAAjqkeptv/crFUz5IuaSz4sxjdeh9EF08SeagOKqgQhAmmBnnQq8BVLX1xRIIYXTulJa6fgs7jkFhodDXFhE5/9Gh0776a8j9gzktVmg9qmINp3F/c0Fwnsvq8vKDSH7usAfv6+TmH87TJMZ3lnCKlvfQAYq6MeGcpp/jdwBGLXjuMkrA0vQnAYfMuGEQQ1ssnxega5dJu8L4xy4uqBVjMkwq9GSiPIybsetsMT02hScvWmLPqTRzrTEhD3DsIqKQZLHN9BgXfuydfWQNjXXWnEZEtxwHcjoLSDFgtAYwytdfwD8oAHz+LocBgYUlXi0EBjV5N1TjIn30B1R3zCU6Y4tMca8WF7b5PZsCymJ5KnWI6YMuUcKzz4mHpYBbsIOSUkQtmEnCnOm0E161qf2LSNVoOZdzKsuOsi0Aca+9SJzBb0TsHNuA5F9ZOEtic1IW5oSIc4jA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR05MB7235.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(366004)(376002)(136003)(396003)(346002)(38070700005)(110136005)(9686003)(316002)(26005)(6506007)(86362001)(7696005)(478600001)(83380400001)(41300700001)(71200400001)(38100700002)(122000001)(82960400001)(186003)(5660300002)(52536014)(8936002)(2906002)(33656002)(8676002)(66556008)(66476007)(66446008)(64756008)(66946007)(55016003)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sY0JQA5Xu8ITJSaHBfq3e/n0XrsgAzOkdqgFqK7z+IGDkF+Bg8ZDHTjJ0Y?=
 =?iso-8859-1?Q?jwgIc0AYFBpV7vWBWwWnA3o5WaCnv9lYRqdzagXH7CXOwmy1/XMZezxYe2?=
 =?iso-8859-1?Q?yum9y/Dk5pIJ294EVS4l6rV7c0+5undanO5JCR0gPENoDhYLaGqm23sgAs?=
 =?iso-8859-1?Q?Hmlo3v5RdxJEivvSVmdISpohZ3elngabtUsFPLNhwmsXruUWsJFzR8CaW4?=
 =?iso-8859-1?Q?NfKfqyd0jKe/Ulp1mLtNBvrD73iIx/ogZ7BrkdPWwhvRl5ykZCS7p5y0yK?=
 =?iso-8859-1?Q?jELLxd3+2Rpal4mTzgICh87YuCpFiWKggv4ZvfRXH2lPuu0HstY/zuneSe?=
 =?iso-8859-1?Q?I+zNXgm7TUjsi3yRzITKoy30drp8YigexH9tyIMNHc6lpsuGByv93IrAsO?=
 =?iso-8859-1?Q?lky36uyCaFsDTavvFSpvXP4b60voAlXG1X7+F6qD/CvRgJ0zWntrkr+G2Y?=
 =?iso-8859-1?Q?FBwGAH7itGeg/IFm/84IB/JLq5eyYwIsugDidZVGXX9pHP1stoehnaEI8C?=
 =?iso-8859-1?Q?UnwjShrMN6sk+H1GdkmAD+r57L3uDcBVjFEz4Lh0TY/FquUHu6oASlaj+W?=
 =?iso-8859-1?Q?c2j6bplzAmeAWSo0MdyjlJLJmw0rEOzp2tRpnR6uny+BVVfcRIPx5mDbAP?=
 =?iso-8859-1?Q?vHBKc6uVlxkBQnEiSuuI6B0nddFfvZxGbKead5kTTZ0VUF4atGlq2+Cz0c?=
 =?iso-8859-1?Q?eTHrsm45rVFIeS6J/M8+GCh8zxfxvcLNvGasx8k16Ci0rfpvHsFQS//hp1?=
 =?iso-8859-1?Q?R+659Rozv0Yh9HaaF3OKBD7aUZiVqdYoZRmL6J5T0fawqjrtkcjUYU567v?=
 =?iso-8859-1?Q?NdNh+loaxmIX0NOI/logVtaXxoEpk5z9Xp86WLMGZKklmmRq3Izd0hDely?=
 =?iso-8859-1?Q?Dd6I7f45OP/VEwWWGiADcGZksy7v7BjMyej/dVhwgUqqJwrud7lxHtWPhI?=
 =?iso-8859-1?Q?3oacimQ9faJt6jIU/XzmjJXr9+tgTCSMJmg5H35IXeD32w/m6aOvoMdxTD?=
 =?iso-8859-1?Q?xOBYEwHCnmo7eE5TaJvQfBCapxJfmLxze2UyvTrrlw/1bM6HqzLxWmISpe?=
 =?iso-8859-1?Q?kOtYjAKfFUFFjk10wPwtUgTS0ag73/QYzr8F0jHljkWTUFIgPCTjeHnHKq?=
 =?iso-8859-1?Q?Zu7a3pTXxMP26n122aAlL7YNNnUIIN7lfnun4VCcGu9V2MmYAuVC5fDKwI?=
 =?iso-8859-1?Q?pgIK64yLjNYGZvNBQJ0Wfa3j0nYE256oMHhGKYm0bYuLec6lHJuRt99f4U?=
 =?iso-8859-1?Q?c2YU96+MD2XxvBh1Fdinl5vL20Y5bAhahcpit4hvPlHbG1Vj68z/9DgqhH?=
 =?iso-8859-1?Q?/4KrBraGHxQ/iLyEIM5ZVaGNys7SKzu3OER/pavUCZcmVaavbXfDFo5orX?=
 =?iso-8859-1?Q?HaPSEwyLPs7lgxcCPu51S+dm12QtLznyQ4ecXNcw/oj+uN8gNdK4ZE4ceH?=
 =?iso-8859-1?Q?pokmxsVL+gKepKujp/wVsRPys7rlQfNMng/vd6taKB94GufVjaVNiQeOFr?=
 =?iso-8859-1?Q?iHXDAB+XvrGeiS0uVYfcgj46qR1nySrfaDqD1dAbTgT5A2jslOKuqTLsFv?=
 =?iso-8859-1?Q?871xGz3y/7hW+A1Hq8vpEqr0GAkPQ2sOD1nWRydWhyQvpk6dki/cIEtiNU?=
 =?iso-8859-1?Q?RmiwLQjTSLhkpY5Mt5+yn0a9IbjSifOjyjZl/PLcwDBeZKMTnjA12V3Q?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR05MB7235.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fed60b0c-f827-4b7a-6b12-08da8ab0f623
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 17:56:27.4271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2882be50-2012-4d88-ac86-544124e120c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iKD89z3nIGwe2ojWP/xkVsDMy4hYuymxQpLDZEeugkgQkxr3Y9FICgAxY2nv4N9gJJxBGN2xjZh8pT5Gshv46A0yzry9YrIZtACR0KsH8rn3zrzaZH0XhEgS4+RSAx0t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR05MB8287
X-OriginatorOrg: digiteqautomotive.com
X-SGG-UMAMSID: 20220830175629Z55118mxmos03.wob.vw.vwg 1oT5TR-000EL0-DM
X-SGG-RESULT: 20220830175629Z55118mxmos03.wob.vw.vwg C1:OK E1:OK MX1:OK BL:OK SPF:off  CT: CM: SIP:10.186.25.210 SMF:Martin.Tuma@digiteqautomotive.com
X-SGG-MF: Martin.Tuma@digiteqautomotive.com
X-SGG-DKIM-Signing: fe5a965be60fd73f3484b58bce070295
X-OriginalArrivalTime: 30 Aug 2022 17:56:29.0966 (UTC) FILETIME=[D528AAE0:01D8BC99]
X-EEG-SA-PASSED: outgoing
X-EEG-SA-LOOP-COUNT: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjleLIzCtJLcpLzFFi42Lhulkpquvnz5ds8PkJm0XPhq2sDowenzfJ
        BTBGcdskJZaUBWem5+nbJXBnrN7nWLCMr+L/t3eMDYzzuLsYOTmEBPQk7lzbwgpiSwiYSMxo
        esUIYjMKLGOW+DC3sIuRC8RmlWh8sZUdwrnKKDG5vw2sik3AV+L7nSdsXYwcHCIC5RKTLsSC
        hIUFfCQ6L/Szg9giQCW32z4xQ9huEp2zPoDFWQRUJXZcvg4W5xWIkVix+zAryHwhgT1MEndP
        nQIr4hSwk5h85RkbxEViEt9PrWECsZkFxCVuPZnPBHG1gMSSPeeZIWxRiZeP/4EN4hXYzCxx
        8vQdRoirGxglvs7vg6qSlbg0v5sRwvaV+PjpAdT/uhKT2i5CxeUkVvU+ZIGw5SWmLXrPDmHL
        SDy4sZ0Nwt7NJjF/QyTIAgmBuSwSfy9chRpkIDHv2xE2iMRhQYnXG+ezQdytJ3Fj6hQoW1ti
        2cLXzBMYjWYheWkWkrJZSMpmgcNJUOLkzCcsCxhZVjGKFOcm5aaXG+qllesVZ+enJOqVladv
        YgQniOrLOxjfLTI4xMjEwXiIUYKDWUmE9/s5nmQh3pTEyqrUovz4otKc1OJDjNIcLErivB0C
        fMlCAumJJanZqakFqUUwWSYOTpBuLimR4tS8lNSixNKSjHhQioovBiYpqQbGWwEePjc/L2yy
        PX5+gaDe8448peW2p11OLpuYrVzbrvJFd8/6lfwyN3L57/84bv5q/h49+V5OeYYpimL9zHXO
        v/pPvZ2VXi+efKyK6fCciL47JX1veEv8q8QrWRe8iJx1LEaL0eK3d+Lhzx8cstjUt7cLz18Z
        soHlupg2n8KqR3tulstd1NFXYinOSDTUYi4qTgQA1EjKmRkDAAA=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



>>> Thanks for the patch. Empty commits are not accepted, so instead you
>>> should explain here why do you need it. In general, your change should
>>> not be needed, so please explain in detail why do you think otherwise.
>>
>> The reason the alias is required is that without the "platform" prefix, loading
>> the xiic module does not work properly in the mgb4 module. I can not explain
>> exactly why as my knowledge of the module loading mechanism in linux/modprobe
>> is quite limited, but that's how it is. The mgb4 v4l2 module requires two modules
>> that are defined using MODULE_SOFTDEP() to be loaded prior to the mgb4
>> module - the Xilinx I2C module and the Xilinx SPI module. The SPI module already
>> has the "platform" prefixed alias and loads fine, while the I2C doesn't and does
>> not get loaded without it. So I added the alias to make the loading work.
>>
>> I will add the info that the alias is required by the mgb4 module to the commit
>> message the next time I will send the fixed patches, thanks for pointing this out.

> Driver matches only by Devicetree, so instead of this patch you rather
> miss proper DTS.

Can you please explain this in more depth? There is AFAIK no device tree on x86
and I have no idea how this should work for a PCIe card on ARM either.

The fact really is, that on x86_64 and ARM (Nvidia jetson) without any specific devicetree
where I tested the driver, the mgb4 driver loads properly both the I2C and SPI modules
defined using MODULE_SOFTDEP (there is no link dependency) if and only if they are
defined using the "platform" prefix (and the module has that alias, hence this patch). So
there must IMHO be some mechanism in the kernel or in modprobe, that works based
on the prefix.

M.

INTERNAL
