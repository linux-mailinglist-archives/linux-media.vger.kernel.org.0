Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D04E5A8080
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiHaOpE convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Wed, 31 Aug 2022 10:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231351AbiHaOo7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:44:59 -0400
Received: from mgw4.skoda-auto.cz (mgw4.skoda-auto.cz [193.108.106.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589C017595
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:44:53 -0700 (PDT)
X-AuditID: 0ad97bd6-3f5c070000001f76-64-630f73e3d068
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da6XDcJNYTZ1kcIbBlGAZ+eGbnMtNpWZMiW3MDBApDmwKUqnYfVxzpsijANK+1nFzTAPsxqS7e5qDSdAVrzBUQy8N9SoUGDD04+3dawWHStRTqtIwEtVPjjqoxJjEMC0TOWQ66+I5C13I6xnQZU2exB9nL5xwEmmlzRkubYbX2/ExHQWOzAuzu9dDi6z7sNOcqzIgwJSqLP/LVj12BvWNvi36qsLIEuwJ6D0guQFARyz1f1MIh3ozpdi7+20K9Eo1aLDRxlQXtOf7wBlBfSFS2KPq5WYyqq4S50SOPEpWy8KipHJ1LYfUiEQjOqP9Qyxgpa0hez2S5TW6i4UA/UQFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKvJgpvcMHc8hh62rBX+yqJmb/kniAi2RG7yM3an8H0=;
 b=RkJc4S19yMPEQOSP4HY0MSnBQpPHBEK88/V78ruSgjCrZY8EycHyQkCvrYl+CAgJmiYdiZkNN9RR9mR+gENKcv38PKns/YHLOLGFt+iN6LeiKh1UZClUrnSy6CPIOiii3z/dnEvvVA9VsIa5CZ05PU7EhtKbEAqTq7+bU1CYJ6gYqunjXWPXKZzE06RFj5gAOrLcl7+wrqKxUVq6th8ASNZbtKK3CTt+UFlFtRBQRIkaCKitqHr7oks7wlY9NQKx0gvzkRdk5l+QQqn4rWg8bYLBKyqBu1IsgIbDJouDThxJ+9dPsnH1DjEvHHO3xle0/aBAK19Xaae6hOUCLK43iA==
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
Thread-Index: AQHYtlB0bcuRWm9+fkOhJxc9utSH4q3EbX2AgAFfZDGAAUyKAIAAqM4ngAAKKACAAU8msw==
Date:   Wed, 31 Aug 2022 14:44:49 +0000
Message-ID: <AM8PR05MB72357051DCC01058CC5BDCBBFB789@AM8PR05MB7235.eurprd05.prod.outlook.com>
References: <20220822194721.1238-1-martin.tuma@digiteqautomotive.com>
 <20220822194721.1238-2-martin.tuma@digiteqautomotive.com>
 <51e77545-e029-69f3-f5cd-f2fdf8846582@linaro.org>
 <AM8PR05MB723552BC9CB2FE2FB23EF273FB769@AM8PR05MB7235.eurprd05.prod.outlook.com>
 <812ca17b-5e51-b974-16aa-2180d07b4be9@linaro.org>
 <AM8PR05MB7235232C96D3F847EE5AFC8CFB799@AM8PR05MB7235.eurprd05.prod.outlook.com>
 <096ad2e8-8a54-5ca0-b4a0-0ba652a88cc4@linaro.org>
In-Reply-To: <096ad2e8-8a54-5ca0-b4a0-0ba652a88cc4@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Enabled=True;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SiteId=2882be50-2012-4d88-ac86-544124e120c8;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_SetDate=2022-08-31T14:44:49.439Z;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Name=Internal;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_ContentBits=0;MSIP_Label_b1c9b508-7c6e-42bd-bedf-808292653d6c_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digiteqautomotive.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 52340ab5-f93f-4c00-dcf2-08da8b5f5b59
x-ms-traffictypediagnostic: AM5PR0502MB2865:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3L+E43AbSfwnPIm/CBqvXQDy4nqdBnU3EkwcpCtku+PKUPTNYsoy/aH9HSoCzVXUP3rGpC/+oCEniPNh1l4qu8cjurkIq6rYduhyI9M/uUjUoUihAgEROwXYmGUpGmFtzLsC+XTVEKlJd24DExL99iC8vQ4b+EEQsRyptRYTf6ehj6MqQZ5N0sPJARNUvQohOSwdipfK7n4rDV9U04I1VUWlT4hzoOD2Sy0QzuxjE84h4bHjLts3X1RInYgzuU1FStbuLr+1cnwkQ8i2xvIgDMYDp3imqTqGc2n2m2R1IChLiStvxgUFrayZS6WGMb2y0Yati2rXyKshCbN8iJMzl1TOYkZQW+4MUG840zavRMprHUOAxCuUSLbNmdDZj3j/YvGtqoor5cQlST9qUrsTsYSe0c2GduupXFWK7G9BotsZMErqCG/yv9rA4HCPJy2hsi8EKq1TpayE1TZ5WpuJpYtyLgLIJUeuZXPbkDvdhDjstA/LN/AAWiVnlQ0nFUwhHktG+rml4ypSviswhvOSRNg5A/hR7/60hkxK3A9ZV+dTGcDjeFeaJEw+Fke2yIRcjbqvOYymFvaNx+iwve6hV7BebqeVzABTrqkKv8AImLXhUrYdPqiLewzhBiXAINSClWndInZ24C1uRO4i3kfdWJcJlmK5CZSpVFTUSeWWJuRgf8bqzuM99vd3nCH1UCv487/5PxZB5k84rwJ8vcuuFeAshXQpJo/ohr6ABn8RkDs5fc6KoXXQlTw9A8HrjoewIY+Ho48Pz75SxYLZUAZBVw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR05MB7235.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(366004)(39860400002)(396003)(346002)(110136005)(9686003)(2906002)(26005)(122000001)(71200400001)(38100700002)(316002)(76116006)(478600001)(55016003)(33656002)(66946007)(52536014)(8936002)(41300700001)(5660300002)(38070700005)(86362001)(7696005)(82960400001)(6506007)(64756008)(66556008)(8676002)(186003)(66446008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?h3IKYSlRf7Cfz2cq2CXX21pbuaBAx/fsWaSCnjMMcAbxhYdx0l7HgtIfU9?=
 =?iso-8859-1?Q?V+kldzL+xMS1fEAmSI5c1Sw60hJoOT4rrjC1QCu0UqVyXliKUXxWJb2vbH?=
 =?iso-8859-1?Q?2m7yaJK5Va4GfcWrGWEch+iNOHLeUSJJtI4IU2BzYIDCqGEbhlghnicmxO?=
 =?iso-8859-1?Q?nt2nRrgdO7J9sy3yS1D3JuZuyRDNrdqGjOqfXsxYs/tBHuxvG0VLldQiQD?=
 =?iso-8859-1?Q?dN5AErkycT7oGBTeKlGGoOSIm+fMeGunD5WXcxRjEGVWMiPIQtgNNYttgg?=
 =?iso-8859-1?Q?lmMNAonYDYGr2/YLV6kMdmH7l5mhFi2YbDahpk8MU7TGEJraxiiwXbqqZZ?=
 =?iso-8859-1?Q?MZz9TfphH3gvBztID7k5esZaIWFqXJwBo98fkXRXrTMeuf9cmHlZ8nWZDB?=
 =?iso-8859-1?Q?zIGZHEMDHzB42Fq4DcCIJltISLkZjDwmJjm8HX/SZ+VGYTjCJW6fWdncOB?=
 =?iso-8859-1?Q?r7pc6YzMOx4HYzFjfeuhvCW1XQsUa7T7GV2TOiiP5owYsacsqEy4Rv9j2n?=
 =?iso-8859-1?Q?CuxaHWXAOw5mFpJbUpGTcSGOGdvqesNn/sQqSH6qHmacoTGsJBdfQJ6hOK?=
 =?iso-8859-1?Q?qZ1F68GlFskRZE6zJIFGLuBVlsdDc+iMIyzTHsA5wufxtD4SoNnpvOgLpE?=
 =?iso-8859-1?Q?aWXmn54CIDosPQqbGdzAV7QiZp9j8IaFwCg7d7XVbyP6g7/lX97IDXni0l?=
 =?iso-8859-1?Q?5zPez2Q1GHe3ZiiKKpQjZQKR62nuv5widgvTVRig7xznE0Dp6RRhk1fVmX?=
 =?iso-8859-1?Q?OEQvv3OulwKO++PAA/S9Ty4U4wuAXjSnPfB3hxFCH16jAcYlrYVcy2Xt7m?=
 =?iso-8859-1?Q?1YqHGctBvgPnImkLSClSwQFKiqClaRt8ptgXYWClpB9dtzrCeUIdAhJGgj?=
 =?iso-8859-1?Q?38NtlzfkSLcG+byWLLWSyhehdU7CFRr3KdofBMQTmysJdcWOqbFWkldxlh?=
 =?iso-8859-1?Q?FMwEpCxrexhKidGEfsiUQd0sI1Eg0nZo5sw8st+a471TyByKj2i55VBToI?=
 =?iso-8859-1?Q?nJaKkJMCNkZ2TZhUyQEJe55MLIwYb54D4YrG3DIuqCGSv4Lnfk9lFQf9Gu?=
 =?iso-8859-1?Q?8rypB6N4snw40gWL2pf0c7KuCLk6FbRUrSbCHNuHdHJezLkab5BIoKcJd0?=
 =?iso-8859-1?Q?y56n7+gztlV5Mhbj5xask4HzI7C6hcYnBrRIg4xeFzA8wImnGzxu0LyxQI?=
 =?iso-8859-1?Q?c+IkAKKj9U/eHyRWdlXdqdBggOc8xK9PjhF78QpWV9jAKPpSCaE7NBHAyR?=
 =?iso-8859-1?Q?Y0gHmRCrL+l5cPA6TksaPeFezzTbusSYYtKvPSZ34C/RQD6vyTjpSQQeUH?=
 =?iso-8859-1?Q?H+E46suhZFBKybxAeGafvtkwRbxOqQpCL35EivcUQWvBiPtsR8D7pes2fd?=
 =?iso-8859-1?Q?k4+3My3fYQA4ChimYAe5t2Ycw4kXxjoE1geRx9QNB3V0y5UXHkSybJ7zpB?=
 =?iso-8859-1?Q?sO3bSICjidO+igmsFSKfbkggdKlMjmeUu4sW03yxVbWSWknKwJcxe2nVNg?=
 =?iso-8859-1?Q?+jBJmahiAoJWgBAETGM6hPTqHZf52Z8fzizeJF+kfa82qRD/Qn5lu/LLO4?=
 =?iso-8859-1?Q?2X4sl0xx2qEQiVVDsTEJDWeqJXaepK6NT34bAGFBbSz+nk1xVFkxU2Uac+?=
 =?iso-8859-1?Q?UFHmkLqrLpsEqwTl9dN602pvlykxe7EaAmpBd9lmJEo7KLAM3a4S1PUQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR05MB7235.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52340ab5-f93f-4c00-dcf2-08da8b5f5b59
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Aug 2022 14:44:49.6803
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2882be50-2012-4d88-ac86-544124e120c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r7RdBSQ+5KWaik8hMF/AIIpj2WeEM0LPnGc+OClqHTfAqUt4kzTmNSO3j9GJaCjHRQrK8VD8n4DRy0C9HHgXGSkqZLBzu+vI3cC45CqzIzUMmaodfrMgAqju9d5XkFpk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0502MB2865
X-OriginatorOrg: digiteqautomotive.com
X-SGG-UMAMSID: 20220831144451Z53368mxmos05.wob.vw.vwg 1oTOxX-000Dsm-4r
X-SGG-RESULT: 20220831144451Z53368mxmos05.wob.vw.vwg C1:OK E1:OK MX1:OK BL:OK SPF:off  CT: CM: SIP:10.186.25.208 SMF:Martin.Tuma@digiteqautomotive.com
X-SGG-MF: Martin.Tuma@digiteqautomotive.com
X-SGG-DKIM-Signing: fe5a965be60fd73f3484b58bce070295
X-OriginalArrivalTime: 31 Aug 2022 14:44:51.0459 (UTC) FILETIME=[39ED7D30:01D8BD48]
X-EEG-SA-PASSED: outgoing
X-EEG-SA-LOOP-COUNT: 1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpnleLIzCtJLcpLzFFi42Lhulkppvu4mD/Z4OBcPYueDVtZHRg9Pm+S
        C2CM4rZJSiwpC85Mz9O3S+DOuHL+BlvBCaGKhjdTmRsYb/J1MXJyCAnoSdy5toUVxJYQMJFo
        n/qZsYuRi4NRYBmzxOnzi1ihHFaJ6xO2QTlXGSUm97cxgrSwCfhKfL/zhK2LkYNDRKBcYtKF
        WJCwsICPROeFfnYQWwSo5HbbJ2YIO0xi+a/HYDaLgKrE0QmtYJt5BWIkNjV+AZsvJHCYWeLk
        hfUsIAlOATuJ9W96wWxGATGJ76fWMIHYzALiEreezGeCOFtAYsme88wQtqjEy8f/wAbxCmxm
        lth/dwHU1Q2MEl/n90FVyUpcmt/NCGH7SjSd3gZl60ssaD/LAmHLSazqfQhly0tMW/SeHcKW
        kXhwYzsbhL2bDeikEAh7AovE4WPJELaBxLxvR9hAFksIHBaU+HWyhQ3ibD2JG1OnQNnaEssW
        vmaewGg0C8lHs5CUzUJSNgscTIISJ2c+YVnAyLKKUaQ4Nyk3vdxEL61crzg7PyVRr6w8fRMj
        OEVUX9vB+GWp0iFGJg7GQ4wSHMxKIrzfz/EkC/GmJFZWpRblxxeV5qQWH2KU5mBREudtEeBL
        FhJITyxJzU5NLUgtgskycXCCdHNJiRSn5qWkFiWWlmTEg5JUfDEwTUk1MPIzbQng3Gx2UnfT
        /xtTjvZWuZn0H7LXzglmntx3N+Ok0Y+g1mcWl2/YcLMq8Okxic7etfjg/f88nzOXvTbaHGV/
        9/4ra8aOoNIvQjIvv5lV+TIwFey/pH1uo13N5cM3ON79uzl73+86zhuiLNvFjI6vKL3Qcmj6
        Xw6HMrlvoiedl+f3HO7IvafEUpyRaKjFXFScCABIOM6CGgMAAA==
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> Ah, right, you do not use it for DT platform. Then you need proper ID
> table, e.g. for ACPI. platform_device_id table would also do the trick
> but I don't think it is suitable for such matching via ACPI.

The mgb4 driver of course uses the propper device id table (the PCI id) and
matches and loads fine. The problem is, it needs two other modules to be loaded
prior to it, where one of them is the xiic module. It is used by a platform device
that gets created/instantiated during the mgb4 inicialization. As there is no symbol
dependency, the dependency between the modules can only be defined using
MODULE_SOFTDEP. And for modprobe to work correctly you need the platform
alias.

>> The fact really is, that on x86_64 and ARM (Nvidia jetson) without any specific devicetree
>> where I tested the driver, the mgb4 driver loads properly both the I2C and SPI modules
>> defined using MODULE_SOFTDEP (there is no link dependency) if and only if they are
>> defined using the "platform" prefix (and the module has that alias, hence this patch). So
>> there must IMHO be some mechanism in the kernel or in modprobe, that works based
>> on the prefix.
>
> Nvidia Jetson is ARM (and not an ACPI?) so it comes with DT. Let's don't
> mix problems. Depending on the type of your system where this is used,
> you need proper matching. Sprinkling aliases is not the way, usually.

This is not problem mixing. You really can not expect every user to define a DT
for a PCI Express card that he may or may not use! The type of the system is
irrelevant here, a PCIe card has to work based on the PCI id and not some
additional mechanism like DT or ACPI you suggest.

The problem this patch is solving is the inter-module dependency (mgb4
requires xiic to be loaded). If you think that this inter-module dependency should
be solved differently, then please provide _how exactly_ this should be done, not
some hypotetic solutions for problems that we do not have like some platform
dependency of the drivers, and I will rewrite the patches. Otherwise I really do not
see any reason for your fight agains this one line patch, that adds an alias that
many other drivers (like the second one we are using in mgb4 - the Xilinx SPI
driver) already have and that actually solves the problem.

M.

INTERNAL
