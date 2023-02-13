Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 701A8693ED9
	for <lists+linux-media@lfdr.de>; Mon, 13 Feb 2023 08:17:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBMHRK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Feb 2023 02:17:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjBMHRJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Feb 2023 02:17:09 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04on2049.outbound.protection.outlook.com [40.107.8.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609DB212F
        for <linux-media@vger.kernel.org>; Sun, 12 Feb 2023 23:17:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B8jZwjsb0kN7NzGdNeIB0TT4bKxftY3CdP98hG/NnrnSfsGPANnJQZLPxXWAda+lStE8zDIFTEeIy6DKhlisvDxOmQ7irasbVnogdJECSWtL0L0RSFsLt3ntJVYS8BLqjzNzjfXi4iaIuDAJjwT7zTOYw71YGbw0HM1uB9CRMTftQ+BCNdswnkr1fixVQ5Iz696jNZnBrTk1O9naL9airmqQCJgQkfCTDBWxTE1nzV8tIzYkBkEhNvgs9CNFH54dqucxL3+EGIRZw8amDk4rVqaTP7f5iSex0CT9m2PSgVrTU/7MK8MGm4OOVxaRTcRtNBMCfsyfctvHOsbJzRuhdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9wYLJ7k6XKxBT9zXUNG0vxsxo5yHmy47pzyKDoeO9w=;
 b=gN/WTZFmhepHHgfcCjqdEVyRLSWhih71WENcCHsVrrAbv8wO+NDmbPjOAzW34uCcToc6zwnQNSkdkMad3u+I+GCDaP2B57/RE9N8p6zqQCiehyMQ2YkrYQJHGZFEEuusnYGZmE/27NBZ0S7dm0ce8VLjjr9FXfvObis0QvsDzEm+xxysZfE9x91fI5iE8bsEIGK8DeoUOdXFaSr6T2XvwzMHkozPTLswXS8cS5n2jptrv9ah0iXrtA6cVRMkmDaebJoTOyPwyd1F0xKW2SNf72guAg0afg2SeBgmQ8pIAMXrL4t6vW3d4gkpCfhgeeIKsh/eiVQGdJVdceMAomV8Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=brainlab.com; dmarc=pass action=none header.from=brainlab.com;
 dkim=pass header.d=brainlab.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brainlab.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9wYLJ7k6XKxBT9zXUNG0vxsxo5yHmy47pzyKDoeO9w=;
 b=kf9bfE3/J/BTr+EzEvUQwKq47TNQ2MJdkZrY7+mzmVl68W/TnRiy+9aCQ79gc1X92PD4putkPb1RxjzQPpHSM3tsSIag/2U9NHxocJ5MlBQFU3cp5JivVFfLq0qAxSwCxLnJ5y4+eZRaYUa4ojkoIOsTBPfWP716lB6L9iVmCUkerOxS+14XFGYIx3P9Nl1Jem52kxXrI9AzdVjsHPgjHWgBPFU9WVeQKoYTNraUfhjJT31xic0xoPVPlUA5kBZZ6N8xkKGt9oTew0oXlizV8ikRwLPVx7lC3cJ6PVYC3JQPC97XlRq5zBYLAHNHJtTISoBo+/CX64h/F7bsE7w4tQ==
Received: from FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:62::8) by
 FR2P281MB3023.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:64::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.24; Mon, 13 Feb 2023 07:17:04 +0000
Received: from FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3df:1ff8:852d:3b20]) by FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3df:1ff8:852d:3b20%4]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 07:17:03 +0000
From:   Laurenz Eschwey <laurenz.eschwey@brainlab.com>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
CC:     Deji Aribuki Ext <deji.aribuki.ext@brainlab.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: Mainline zyncmp vcu driver: support for the video decoder
Thread-Topic: Mainline zyncmp vcu driver: support for the video decoder
Thread-Index: Adk8bZITpd6izXBFRSS+kOsFRTSUBAAIH4wAADaY14AAA5BmAACBAi2Q
Date:   Mon, 13 Feb 2023 07:17:03 +0000
Message-ID: <FR2P281MB2669449FD1DE98CB047453C48FDD9@FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM>
References: <FR2P281MB28166C9AD7111B3488BCE297A8D99@FR2P281MB2816.DEUP281.PROD.OUTLOOK.COM>
 <20230209135444.GB30549@pengutronix.de>
 <e1bf1a456ef83eeca9ad4dd18c55f7e423105be8.camel@ndufresne.ca>
 <20230210174004.GB29504@pengutronix.de>
In-Reply-To: <20230210174004.GB29504@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=brainlab.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: FR2P281MB2669:EE_|FR2P281MB3023:EE_
x-ms-office365-filtering-correlation-id: b8c275c1-9751-4e0d-798b-08db0d924e9f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZBGc6ZyKPY8s0lkQp/R1mbjxQMazQmHcGNVlAo5SeLz68Oo73aUMG6VvUKFVmKoHxVkAWHMnql1evvxmggWKBHvGE5gzY4zi+CltCw3It5Cr0FZuFDJ+MG9PToo8+54Fet4j6DOKlwYoBt6OEKHMs1R9JuqF0Iko9OMmpAizX6v740SLD7XKDTClliprT47y1BWjW3ZqIYge5oBEDfXPkGxLOE6rLciJEshYLsyHfRnnUjrwO+1pBNnAFqNC1mpnFFaQqV1aDGFxAjPr6tp+AOcCjxjYIQhP78i81Dx1OKdKILVgacqWwvLj/8VmL5pzsr1GCqNU1krMqiPiqikm31LxACxFEP82Ec9I2U5hC0sn/m6I6Z/jiPp1DCU6JNNR+PUMzBGKCkC+MFo7jKDj+Yb/OTciOiSv9EufGCxdtj1JqevidTe4UqhVvVYl4N2DiFwSfzJujbFUOPKfdbmLIa8O6kNrfKVUBN/OO5cVA7QTt+ZhpMSf+3CfIsOjxxKchSbjC0palTb459ygDni+dOjMzOAv0r5BIGO7JsMoRJ0Kx0hHWdOSng7yLyzFmnE2eOQEFcdOMbgXCuCjTboi+Yf35xYVe7j1AVxe80OF9CTyvdDtxScRieHNrAxvUY68DZkMN9emCRRJPI+H8dGqsBVT3TTpOx3zvOLnsqbnlQ3qOoEeP23mVexzD6CDCsIOe1L0Uufd5vsiOKaOt/rw25zN6O7dZt26J6ztoICsr7k=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(376002)(39840400004)(366004)(346002)(451199018)(83380400001)(7696005)(2906002)(44832011)(71200400001)(186003)(6506007)(8676002)(66446008)(66476007)(41300700001)(53546011)(66556008)(33656002)(64756008)(478600001)(966005)(9686003)(26005)(38070700005)(122000001)(55016003)(86362001)(38100700002)(66574015)(8936002)(66946007)(316002)(52536014)(54906003)(5660300002)(4326008)(110136005)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2iB7DPTQ9FCCxFf1PChD9RcvZZMaINxkHY+jZqxqP5l4AGtMYPjYS3ZArL?=
 =?iso-8859-1?Q?euzEjYD4qRY8AAyCXXjqtbEV41AV4s52RqUxlC8s3/kJMwUdldsJHrKuV4?=
 =?iso-8859-1?Q?xM3vcfeztVxQWH8lfAxW3LL+L7094yUPIdSm67SZdYUMVujq0awYHYcRb+?=
 =?iso-8859-1?Q?qnplhOMG68ocRK4ykxJYpzDOOveFo60Qsrb3v7cJnVyzqO4yGUOXM6kHGI?=
 =?iso-8859-1?Q?/4TjGETdJRBDMBwpF31myemEHJXdUDYv2d8s+CIhLcCCUlEpMPnRMA2ly/?=
 =?iso-8859-1?Q?Ua4wOUIvNbmCmJN+jWZCgOjsIsCjO3d4tQM30yILP6ATGiZHA1eXZ//GG1?=
 =?iso-8859-1?Q?AQDo2nUCRv7rmtg9jvVF8aD4sSPSU0Jexwy5awiv942NRwLaBrzQBlui23?=
 =?iso-8859-1?Q?aFY1jJpf3cT8NZJGdk9ouREfW3G3AMLvNWnIF42catvon3tg66Do5rbBSo?=
 =?iso-8859-1?Q?8leRmVsEJ1fzlLyertyatAvZECso2HBTQLs5IFAsgjqmUqxosQYkQrIXjo?=
 =?iso-8859-1?Q?tLLYomtVOSv7D5Uw6CtaRYoWDLL6nngRo8l6S53cnG1UKra+rcY97eFIng?=
 =?iso-8859-1?Q?rb9UyRVv0kfAUAKa70dxRNaEqUNx3BxDL7mk31oNlNEcUkey/UFwzw181E?=
 =?iso-8859-1?Q?jnGXWEyMTv4DZMImlpZTf4blhX7cvXiwuo14ulI591ccf+3xNAXtjfb6Iw?=
 =?iso-8859-1?Q?HEA49Xs/j35SfA8TEgB2J9GfkYSMeOvesOyxnkfp6XWwI4XYB1yJnSMDjN?=
 =?iso-8859-1?Q?PTTOtlh3qhwbET411oMW1Lk83NeFUdxvhkV0BZk+O1j2ysnc3CRDg5Icjk?=
 =?iso-8859-1?Q?56qBiQ2cU6FYXl+DAhWZPt3RlIIjMYtrhS63+vwv6PbESLRPgvAnjU4HdK?=
 =?iso-8859-1?Q?/wWdiC0OMCwvj2YPOLAxLtUMH39jbrMxxGr68TrkPY8lkZxWim6DVVO/FF?=
 =?iso-8859-1?Q?TSTUl+AyxvtTYveObaX6Zbpx0AwTT45CyMDl5yu12ItmQUliCZj9oXrPH/?=
 =?iso-8859-1?Q?sxB5yFBcwW+a/ZX8td6Tuda5nbbUn9WWu4WCMqI7f+glT3SGc5SFcSx323?=
 =?iso-8859-1?Q?jgqdg/FxkNizPZVsf1sWSEL/J2lw4ClbQVCDtuodBfBwGnAOZS7SCX73xp?=
 =?iso-8859-1?Q?rGi6clgf+mB8Jtn8z5HLF4qLhw2tpx1RROSGoS67TNxvBhmWNb8LWFciNA?=
 =?iso-8859-1?Q?/Mnjp3c/cUB1QIJQ3jPK6Yiby+vEEoqpB2AQhywIG6b0F6gZqX9a5psWXj?=
 =?iso-8859-1?Q?vf08HyN+pWkQWMZGJHSM2G6QWSHxcYY09RCHLBLQbP0HkvRpd0kSpe3d4R?=
 =?iso-8859-1?Q?Cpo2zrRGlSHO36Shon8BpMbv/zR+h077zyOVMzFjx3VkAOFpkUyiTeGki9?=
 =?iso-8859-1?Q?4E8N8qxHAp32Wf2PglmPl4x0nzLTSBHsZU04+rS/4qyCxZozF0iAElcqC+?=
 =?iso-8859-1?Q?CQ0yRzw6/flLSs+megeCrNK5N1JfgcGQbp5GprRv4xT+yGag8skfVszei3?=
 =?iso-8859-1?Q?cYfzUYw1R7hz5aqyXbjI7cucTTkRWotqeD9v5EzeIWgRa5v1Jfw/Iioqc5?=
 =?iso-8859-1?Q?9E02MWMXny/7C3y6lYryoZVM3M0K2LcxDFkox8zx/XFGaUoHqoNQ50oB7C?=
 =?iso-8859-1?Q?KaRdNuFiBBiHPHUtyIIR3haV/tl4s3KViLnB/WDqqK1Z12kHCrToYZCA?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: brainlab.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: FR2P281MB2669.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b8c275c1-9751-4e0d-798b-08db0d924e9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2023 07:17:03.8048
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e904fb52-a46f-4d6b-ad97-6dc605bf3879
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WNJDjx2O4sFpJyGI5Vs1AIExNliWoXhToV+Zuf8qWawBsKGI0bewTYBKKHboOKFMvcsr2ZpFtsMHRUQh07nSivOrVJW8FZDDXbxZUT2qRu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR2P281MB3023
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The decoder does use the same message box type interface as the encoder, re=
ference implementation would be available here:
https://github.com/Xilinx/vcu-ctrl-sw
We are currently investigating on what needs to be done, first issue was a =
change in the interface with the later firmware images, we will start with =
the older firmware since the encoder is working for that one.

-----Original Message-----
From: Michael Tretter <m.tretter@pengutronix.de>=20
Sent: Freitag, 10. Februar 2023 18:40
To: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Deji Aribuki Ext <deji.aribuki.ext@brainlab.com>; linux-media@vger.kern=
el.org; Laurenz Eschwey <laurenz.eschwey@brainlab.com>; kernel@pengutronix.=
de
Subject: Re: Mainline zyncmp vcu driver: support for the video decoder

[You don't often get email from m.tretter@pengutronix.de. Learn why this is=
 important at https://aka.ms/LearnAboutSenderIdentification ]

On Fri, 10 Feb 2023 10:58:01 -0500, Nicolas Dufresne wrote:
> Le jeudi 09 f=E9vrier 2023 =E0 14:54 +0100, Michael Tretter a =E9crit :
> > Hi Deji,
> >
> > On Thu, 09 Feb 2023 10:03:19 +0000, Deji Aribuki Ext wrote:
> > > I would like to know if there is a plan (or if there is already=20
> > > have a
> > > patch-set) for adding support for allegro dvt video decoder.
> >
> > I currently don't have any plans or patches to add decoder support.
> >
> > A while ago, there was a bit of interest in decoder support, but I=20
> > haven't heard of anything new for a long time.
> >
> > Are you interested in adding decoder support to the driver? I would=20
> > be happy to review and test patches.
>
> Isn't the decoder side stateless ? That could be difficult to achieve=20
> without reference code or documentation.

There is at least some firmware running on the decoder. And I am pretty sur=
e that it provides a similar mailbox interface as the encoder that the driv=
er must use.

However, I don't know, what messages the firmware expects. Thus, the decode=
r maybe stateless. Maybe it even keeps some state in the firmware, but stil=
l requires the software to parse the stream and explicitly set the stream p=
arameters.

Michael
