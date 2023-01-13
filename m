Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 116AA6695DB
	for <lists+linux-media@lfdr.de>; Fri, 13 Jan 2023 12:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234479AbjAMLuP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 13 Jan 2023 06:50:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241007AbjAMLto (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 13 Jan 2023 06:49:44 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8DA98D3AE
        for <linux-media@vger.kernel.org>; Fri, 13 Jan 2023 03:39:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kn1cQWKIqeZA0izbIoDnZFGK1OK9x3F1ER3TkOaZX4P8i1+64sWVRkFHfzJIJqwdGla3WCciGD1dFKcrWmglLXfYxP57jRAKkf3DIp8AlxRsnGH/JuMPyf/cfn8ZGlFuHt864z9TsntNSLBz2AmQPYhjqs3p5UQpd1hUOu/5WESrxG66Mn+J2xPZXiK9FnWrN1dnA6R4vNFVHgnfigAW9tQyRWXDtQghjXrfnbY2rByjb6LUcv7QMI+IbXBnjqcx779sRPbTBu0OzEsRk7BkrRfCsd52bDceYAWcoZ9EVQAUxKVnO6imUmaAGwbF9He81aHiXVtorUgQqyQMtrVayw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wclYXZvbTIJrXjfW1raEvXrPtijR6AWTMnPqGZ0lrZ0=;
 b=SBtYflKrbKlwCwFpCqNW044t+/1JrB+z5FdpBjlyBqKewuKNvFIAliY+UEkqAfti0LDN82NHRIt+6ODEzSCb8/TBN4RTvI96OBHCwGitU/uU0q29ZE/1Kswq1IiBbM/l+93SPQ0R/oMtUfjgMrqEpSAZyMKWhnJ+NyaGgLiGRcYutqI9LN/9w9FLU0jHADaETAYUzUgaYhhrApKH7OnRFStv6tWBXFf26jxiRXQ9DcJrzMvafkhvrnC5qyoGHhDU6v7Rf0CmXp29/1qPWSiQrQb8RBuhWAOiZ3GC/WDWIHByxgnIENWlndzL91rb39xiftILn5nLydhc/ttRWqyj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wclYXZvbTIJrXjfW1raEvXrPtijR6AWTMnPqGZ0lrZ0=;
 b=q1WKDnKIomZQy5ZTJHDqdTU2/S2tKQPoD5CJYsnUToASJlOncvROPx4WXhR8ad9lIYSzt83PIFo/98oVUfiYPblUmsx/TE50oP6Tnl9WsjKO+FNsaiT2rBddYkAjQEJtxaRXGZSAl1WlGFDnHBPdMuexe/CmwURKbj+haagKSYA=
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com (2603:1096:604:13c::8)
 by OS0PR01MB5764.jpnprd01.prod.outlook.com (2603:1096:604:bb::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 11:39:53 +0000
Received: from OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a249:60f:e09a:70bc]) by OSZPR01MB7019.jpnprd01.prod.outlook.com
 ([fe80::a249:60f:e09a:70bc%9]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 11:39:53 +0000
From:   Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: RE: [PATCHv2 06/16] vpfe_capture: remove deprecated davinci drivers
Thread-Topic: [PATCHv2 06/16] vpfe_capture: remove deprecated davinci drivers
Thread-Index: AQHZJa9JERG+f3Z6lEyqo498N9Rdm66cO+Xw
Date:   Fri, 13 Jan 2023 11:39:53 +0000
Message-ID: <OSZPR01MB7019469DDAFE226121B15F27AAC29@OSZPR01MB7019.jpnprd01.prod.outlook.com>
References: <20230111112418.687882-1-hverkuil-cisco@xs4all.nl>
 <20230111112418.687882-7-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230111112418.687882-7-hverkuil-cisco@xs4all.nl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSZPR01MB7019:EE_|OS0PR01MB5764:EE_
x-ms-office365-filtering-correlation-id: e41f20bc-b5d3-4dd0-d2c1-08daf55ae317
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: P7+QFMSwfEFfwyakQfFOuQsBvSlKgDOYKRiurA528wOFDxkgOyJdRpKhUvPxUrUAN9Zak2NZXzYo4J2hupN2B49Tc+p/dOSxPVJ322zf4Mzn+HPqBwp3nbNz/8MldBuqmrDoaD6UwsXmBkh/4FLeeo5HVzIUDIEBDWC/ui3Xn98astwHqwWrNJ5c+Ssj+ThFPk2jyLXbAtrXxXOn9zKO4bDfeLZsf2yRw0yGG+3NAnr/KpsT6m2/hOB4Ix1Qs51ghGMQXeQbIOO5iN8P1E0Q5zCZQW+lz5avS5T1SNOBdDP5zwg0bwwwUXHXgH9gNpf6vn8rK/0h373t/tAGuUyZih8VEpHB4bo8wzHKGgnYt7lS+RqsPveH1+IIYj3NBrTnORxsgVa48K2GAJNapOhrby3bCHYDvPWMVywomkWVVuv/vp3BnTI19jNO7SKU/LCRo83wDcTj49Cux9NYA3zUpAbqnhF6yOWWTXHmOmkOzEVQ/h8mvFchKA2smrJ2NKZyYXrOvwEsT9/nao2RLr+/bdMT1QyRoKHOlEeArkoGEkaQ3eydndVkrLzr3/+yQhOZRNiBepiPvCrgLdaE++h67RfoU8sGMDTaVFllIFwAjqI5ipSuxBAgU3+HiX5EUcf8HQW6bRkDkg7hzf0OESaW+TVSg7gQz2z13srt5wIsKL0Q0KzKbFR21wOsdIG9I2P2sBumXpz/d88+OUFXBFOSrw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSZPR01MB7019.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(366004)(451199015)(52536014)(8936002)(5660300002)(4326008)(41300700001)(83380400001)(38100700002)(122000001)(2906002)(38070700005)(55016003)(86362001)(7696005)(478600001)(26005)(9686003)(186003)(8676002)(66556008)(71200400001)(66446008)(66946007)(6506007)(76116006)(64756008)(33656002)(110136005)(316002)(66476007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+49vER62EsCf8zkL3tLwQo5iwWlm/qbFXPKTrNl6htXdkZfpW5wbB5LAKTcN?=
 =?us-ascii?Q?E30O8/UvyaQz2tbMszH7hqOc0mtAhoZoIm4HNSpP4kyRfDEEIIK2PVrNlWk1?=
 =?us-ascii?Q?yyLUZAGXyhDQo9yVO5UntEAtqhKaAS2ZDwhGq/SBKpimo+CfuCgRn7RiPEvR?=
 =?us-ascii?Q?T61LPmvcBywkAvpschnGrnq3g99SQF1VokgIa2OPfvIG+UFfssacVLt2SFBV?=
 =?us-ascii?Q?wFUPCZSzBkBoK+5sSUwTzImswMCb+t0cFGW21EsC4UKT2FHYa4cwRsBKOSlX?=
 =?us-ascii?Q?tQcyV2WTxS7gha5A7f03ysaPxOLUC2mgWjkWLFbWMO3wrSw9blU6B8DNpkVy?=
 =?us-ascii?Q?p7ZO9iNQ+372lzoGrxCpZ5rbBNsCQuXjaLimtUp2kNK4zd23Ej3oOz+gAZzR?=
 =?us-ascii?Q?ws/jiIBJyH+Bn+gG/pEh61UCkWrxk/J+RfAkizbaJwF1JuE5mlpN7WKWWI5e?=
 =?us-ascii?Q?o1H+y9UVAEVclTwdhl9HHt0ZxRsL6NrLQShDC9hvGCrC//AaFoxC8SW2eXbp?=
 =?us-ascii?Q?mBHfLnrsTw+/8TPUCURZJew0rQuSQvnpQXFbRp7mm81uKRIJxUFs8nEhEW4C?=
 =?us-ascii?Q?c+JYXpB6/mBGsVx5DwIDycoGdPGunS9bccdSxAqQEX/OnktysFNKKyUvl5qb?=
 =?us-ascii?Q?UCBHGLi1SFmxIFrBZx6lvh1zH++ZclB6QpwMKOGYxgoznu2oG7R/RJ/+LvKc?=
 =?us-ascii?Q?Y20u7fyIsGrYiSWjvdTkqa5F+CkWyu3vR6hQVmgx0Vjt5OV94+Zg11OYlRoJ?=
 =?us-ascii?Q?WHFVvZ94U+XHycr8j03EdVKQOwHweFI3Ht1olRcdxvbUIxFnBAI41ziykasU?=
 =?us-ascii?Q?V12K4lD16QzyoAaOUzvuPEWHVgfN2glGXOoknfFIzh1CJHQAQYvElCvYVKwf?=
 =?us-ascii?Q?SS9va4ks7/t+PMG+Y6pn3LhEwMHOuTieTASQC4N78oAa8aaaZ6oAP6JNPPdn?=
 =?us-ascii?Q?IDkkUQyQ6rXJX/nAzij0P2FeASMDce3SIfOdknUNrPCpvCarbrLN3Gojdmie?=
 =?us-ascii?Q?D/YUKmKTMkwe0qndFARRIY8iiezm5zm42U4zV/L0d48LXqte/JrGQHW7E6bB?=
 =?us-ascii?Q?z66PeXQhIn4BaLInn4tCGaKoZkPaatRbW70DQ8gUgzSL5WpP2jj7HnfdOZ0S?=
 =?us-ascii?Q?eSDvNQtUPLXVgTyIatquflS8Nm09RvSGLYgHaRI7czD053Zofq4/8OBsCyjP?=
 =?us-ascii?Q?iU8PLVnDW3sL35rym1iVh3AEkUeQPGlVlRlbvIV7kiSpbhEqIleWuqNrW7aw?=
 =?us-ascii?Q?CrAQwIAFgocCwulwuQCvuI2fH/WVYgggnHE4MYO05NNyt6iqll/VgdLQLfwv?=
 =?us-ascii?Q?8qB2puKLVkEAncTf9gncupctalMqUoXhkXGsXboY+TeXfrvAq6sMRgwlgwQS?=
 =?us-ascii?Q?S1lohy6NnTxYF973BLz+pUb2CBBu9omiM1hvobiqN/Wj8MmTVb8b3TYlhyRy?=
 =?us-ascii?Q?KXeQdnuKgIQe1gs6kU17lrja0PpimWBG4QgsEPMXerNDq5UbnkmbO9QoDNZ3?=
 =?us-ascii?Q?SS6qcptAVoSAEj8gS26FjPIWsiKBwXH34hOwdt+KN8TwFCbW2W3kKnqFniQ5?=
 =?us-ascii?Q?V8maa9yZdrUgQFa0JaxjSXPxvGr6xosftMZo2y4wDStnuTYuUUfSE3O2Pfcp?=
 =?us-ascii?Q?TTL1zctLwU1qNiSc4kcjpgE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSZPR01MB7019.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41f20bc-b5d3-4dd0-d2c1-08daf55ae317
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 11:39:53.1885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vlVOcWPAcO3eodo7XrWoUW+kCgS1GxcPofQgQPmYhfu7yNKSAO3W76NHnzYHYt1Kil305srdGtU6CiIm6XkWQxgfBxQU97B407j37qoDxvdxPm7dMFOUmETCzoN0Eb53
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5764
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> The vpfe_capture drivers do not use the vb2 framework for streaming
> video, instead they use the old vb1 framework and nobody stepped in to
> convert these drivers to vb2.
>=20
> The hardware is very old, so the decision was made to remove them
> altogether since we want to get rid of the old vb1 framework.
>=20
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>  drivers/staging/media/Kconfig                 |    1 -
>  drivers/staging/media/Makefile                |    1 -
>  .../media/deprecated/vpfe_capture/Kconfig     |   58 -
>  .../media/deprecated/vpfe_capture/Makefile    |    4 -
>  .../media/deprecated/vpfe_capture/TODO        |    7 -
>  .../deprecated/vpfe_capture/ccdc_hw_device.h  |   80 -
>  .../deprecated/vpfe_capture/dm355_ccdc.c      |  934 --------
>  .../deprecated/vpfe_capture/dm355_ccdc.h      |  308 ---
>  .../deprecated/vpfe_capture/dm355_ccdc_regs.h |  297 ---
>  .../deprecated/vpfe_capture/dm644x_ccdc.c     |  879 --------
>  .../deprecated/vpfe_capture/dm644x_ccdc.h     |  171 --
>  .../vpfe_capture/dm644x_ccdc_regs.h           |  140 --
>  .../media/deprecated/vpfe_capture/isif.c      | 1127 ----------
>  .../media/deprecated/vpfe_capture/isif.h      |  518 -----
>  .../media/deprecated/vpfe_capture/isif_regs.h |  256 ---
>  .../deprecated/vpfe_capture/vpfe_capture.c    | 1902 -----------------
>  include/media/davinci/ccdc_types.h            |   30 -
>  17 files changed, 6713 deletions(-)
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/Kconfig
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/Makefil=
e
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/TODO
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/ccdc_hw=
_device.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_c=
cdc.c
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_c=
cdc.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm355_c=
cdc_regs.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_=
ccdc.c
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_=
ccdc.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/dm644x_=
ccdc_regs.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif.c
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/isif_re=
gs.h
>  delete mode 100644 drivers/staging/media/deprecated/vpfe_capture/vpfe_ca=
pture.c
>  delete mode 100644 include/media/davinci/ccdc_types.h
>=20

Acked-by: Lad Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar
