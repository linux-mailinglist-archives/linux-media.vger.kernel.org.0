Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3014616150
	for <lists+linux-media@lfdr.de>; Wed,  2 Nov 2022 11:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229988AbiKBK7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Nov 2022 06:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiKBK7V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Nov 2022 06:59:21 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2099.outbound.protection.outlook.com [40.107.114.99])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3414F222A4;
        Wed,  2 Nov 2022 03:59:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzMYPv5xxnqJaz7JNVAeTGud8dLmPBinbCVleprn2L2zym56PGKeDZxaw5ucdYjFmYExacdWiPv3fJIpv2iizSaYgp2GUBRaFqclblEwnsBQcLe67tQe24aH9VyWlUfdVl5094m2xy+/eb7P2qOEqScqR20z2nF0ED1BKxZIpMImSgyJUaymxTVf7/RmNZqZ6PpCoq5eEyqiNT3+/ympL3T1SJ1V3eFqB1FkvPKe1Mo3eQ8DLCEQhLGrjcVrv2hFrgSLhkfpTpyboaY0jRun0JlFIAxeV33CCad4yUsZBRT1vm8j6SvWEqoLH5vyASrWFYhv9cBYymPjvgDcpJnwtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K8FoIDM5NCF5+v2mzNFjVRnCp4G/FbF/Pm2rPqKBw8=;
 b=JlBQDvBstOvHt80QZINaLYZ1POJbz8B+jJrE1SZgH05XJOIuNIRvHENIiKxhZj5npIksaCCGCTjncEHPdEJsVV19VVWluNv8ZbGYSMKzUc7UC8ioNgPwhf/bSWMEtEkj4p7YuHzQkchQdBH1iXa3cdoHx9B+6ePjhHYaVUX+weZerp+lVPvxf7ObnadXPF11ewM/NL8xTS8Tl2cR3UBBJoPCYm6SmtBn9hbwenCKxn0MBTAZthyj+x4JJi9PQmSw9DbPxChLPMEPDCEcIPP+/OjQtsclLVRzUs6yVmCjvIv481IhZOonaMkMCzhYYuRkOy8P5+li/22WZsalUzHOBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K8FoIDM5NCF5+v2mzNFjVRnCp4G/FbF/Pm2rPqKBw8=;
 b=c47n/KXU6+gmZHpBMFaT4xSvMnROoV+5EIIxPwe3XKf2a9cgOnw8LicttaVLNulkwK+52tJKNzvO/BidzbrYUowZZDQDpwnBOGCERpDtBsyayOo32sZhid8HLJ8QqO+jhNpgfoTm9bNESy0U/BfaDuk9U2/LFVaTH9MPJCAjvRI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB10869.jpnprd01.prod.outlook.com (2603:1096:400:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.20; Wed, 2 Nov
 2022 10:59:17 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::5b24:f581:85bd:6ce2%3]) with mapi id 15.20.5791.020; Wed, 2 Nov 2022
 10:59:16 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh@kernel.org>
Subject: RE: [PATCH v3 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/{G2,V2}L FCPVD bindings
Thread-Topic: [PATCH v3 1/3] media: dt-bindings: media: renesas,fcp: Document
 RZ/{G2,V2}L FCPVD bindings
Thread-Index: AQHYvpfBqkZEHwihH02kfxkXRevipq3UfHsAgFdaBcA=
Date:   Wed, 2 Nov 2022 10:59:16 +0000
Message-ID: <OS0PR01MB5922025713FD09A17DF2E10D86399@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220902064628.59001-1-biju.das.jz@bp.renesas.com>
 <20220902064628.59001-2-biju.das.jz@bp.renesas.com>
 <20220907210018.GA336305-robh@kernel.org>
In-Reply-To: <20220907210018.GA336305-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB10869:EE_
x-ms-office365-filtering-correlation-id: a2cef242-b694-4073-4dfc-08dabcc148fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zfz6kuV3srSMm+6qoqnfA6tQ709q6EdrbxFFPYNuaCKh+etOQrA8RGyzyelr/K3I14bUqtbEgx1hcGSMusIw6voxeuOH9B3AznAM55nhKb1FyivS2pGjMBlLLPEtB+zpUa3jyF5EkR8gmtec32id+QExW7VTaB9h9j5GPDOrJoOPy53keXxhgr7RrgmoBZyOaWv06BsscG6AoMbJG16XqzWWsuRkwndFu96TmUzJrCeLG/Atc2etnuBsXjkbtdV/2s3KGx5J6Pz9q6zIk70UveFiVS8/tdiE78fN26p07PSWG/So6XDQfQFNMkIkdlw+pVfNm5ZHIGvsx7aAvx6QyVK64nJknQoOu9vseICzh2ke6fGP7FpDwzu/kM/huOkiwpnIZpCi+CKYyAs7FublibxdixbHepDUSufXQJeNNntZ6NmAqqGIBFrqNXn90a3pnimKpHyCugRU6npDKYeQkh6AqBDNom2dZzJitaix8pveZHLyes3w+8lnAXD8NFdCwNEnKIlk6WHJ0i75sDoSArXghSDNGCSPr2uMs+vyLM0O/ndBpzkHSznenicJL4VyvjM44NrsyiXgUzum4raAxFrDZA4J7buhomjLys1A+zgwhsofhd9mIhj6ltO/CHeA2anqYzH0zibGEm992tdsqlM3YnUSA0olGJX0YQsVh1BH7ymmRirgmkUEkk1lf4zaR5XanmM1YGmErzFaSTcmE5tLSdW8dDHTyaRbft5+pOpbKPrOFI1BREn9gZ+D7RjtfMYNt0nWj3JDCInm80EAEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(451199015)(83380400001)(86362001)(55016003)(6506007)(7696005)(2906002)(71200400001)(38070700005)(38100700002)(33656002)(4326008)(26005)(9686003)(186003)(478600001)(316002)(64756008)(66946007)(66556008)(66476007)(66446008)(8676002)(41300700001)(54906003)(76116006)(8936002)(5660300002)(122000001)(110136005)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZjroTvogjozNE5AB1dr61A3swkkqDuo+uIB0mUKARMR9LZQ/+Ex8WMKrwdpZ?=
 =?us-ascii?Q?SgMzpbGlFyuQjdY9At57YnotoEuXIQ6qDsytTJzkoE6R1zWBUJFWHECC+lcA?=
 =?us-ascii?Q?du0LJcVAsIaqKjGzKW2SjFTxUkN0gVn2AzTe1buaIG3p0/7LuNUogWOGNSWJ?=
 =?us-ascii?Q?NLM9TQJqmwoBcHEcubWxvH8sTy5sthsUlGRzfG8cjECH43svskUFmp468g2w?=
 =?us-ascii?Q?V4BfOQGjc1HWaSwQTFJoEZRKMrbVCefPbOaXa0YSGP6882xxedk5I8Is3/49?=
 =?us-ascii?Q?68TFwHIhlqjQLCElrDxx7aNv6SqAXQpovvZiFVjyWDj6Ydvo+KnxAg04/8+G?=
 =?us-ascii?Q?lUm3KAFvJ1M4+C73yhnlGJHyCyOl72g7s5HY+ZqhK6xuZfWRQTorFYPSjyrO?=
 =?us-ascii?Q?BEvV9G/QPv86AeysBp2x3uJGtpClGtGfrohwefeYqp1NputezQ8eSXsOkNKz?=
 =?us-ascii?Q?gLASLhwz0HhtgYPkIk9O/D4e/rXFW242eHWpHw76nu0gtGrlL4aLrf9y66KX?=
 =?us-ascii?Q?5kGJvF1GR6fX/R/lGL/UZ8VDKGASpAn0HCK+lxjtBF/NNiUnzzXmUEGF/76P?=
 =?us-ascii?Q?12qnhfanwccY9qzm367lZart1GH0jdC0x7pFjjjjOhPng6oU2emh1sCrlzs0?=
 =?us-ascii?Q?ub38F+sPoSkThV1EVdrORoAzGEtjDvKwwDDsLr2RxAT8sjk/bpFD/SKfSrSC?=
 =?us-ascii?Q?arsO30L/2YVCG7kW/yb36k8eMeDVlsiY63dWbXIYO5attD0yiNLWM8O1A1E3?=
 =?us-ascii?Q?4GgdyEs1v8v448dEicXUmWfCpl7o0tuOLrn55wVnOhPmWDgMHAZ4OL2BW/8f?=
 =?us-ascii?Q?fKMYUsBv3gmzosOsraH/RVHUiQBavOO7wyeCqMprIiSugDnUj62ihtHb2iKS?=
 =?us-ascii?Q?a9dOUapG23tyCMa9r7jyNd6bCNZlaobFlPJ8lIiTga3CA4Ia6kDX9uEyWmi2?=
 =?us-ascii?Q?JYOxXg8PW7zUw2Nsm51fuw2wrwQZR/pOxmIxsMePw0nRcx6Njoe7Vbkjj5wP?=
 =?us-ascii?Q?/QoCl2Yu5dgVo5phou26N/06y94kzJWZyUvRGhOTys/wnOL++bcsO+uXfH+y?=
 =?us-ascii?Q?YVtn6kLkOEQcB+9PH/Ib2jwFmPJyW1d5H5uguk1la2tfZipCVzUxIZzhavxs?=
 =?us-ascii?Q?iFcUH+72HKMfxeTiwH4zBjelILL9eEeDnDrNDG3UMbS1jK9tqSzW4HQABq4c?=
 =?us-ascii?Q?kzkhLQ4N+HipOfythl341xHaD6yeHgShcGb6WhfkfWd8DfjoWmIH+CIUeDQp?=
 =?us-ascii?Q?PEpLC/i9WiWy2SG87MfFeSJaBdfhzL5jN1d5zT0u3iUQcilc2ZQvOsm8noc1?=
 =?us-ascii?Q?MhRCv8x5MU4S9NaorGPV+0utrXti3vbbREABUDzZJZb6wtR5aWjMdDHTNP5b?=
 =?us-ascii?Q?AeeOXz55MX+kl4/5O7k+eUIzD2SJBu2pv2rGs53lb2EiuOLk5jm7ZfqKl2l0?=
 =?us-ascii?Q?vIFqx8eAqURVsjTiiCwEGez+XzHGj5BO6qPcnqHp11m9jy1Jd2K7NpJXosZQ?=
 =?us-ascii?Q?4iaTQQX1IFLhcwAnmdTuqrLgqvnOcc37PgBn/37BNAdfMIfwiQPU3XEJjQAN?=
 =?us-ascii?Q?/HTrWQ71SO/RVOBQcn9+XQMRGOTNCNzclWjDaYOMqzpaG8AbkmUkk4cVhSKQ?=
 =?us-ascii?Q?Fg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2cef242-b694-4073-4dfc-08dabcc148fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Nov 2022 10:59:16.5263
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NlCY897Sb7q3d4Z1YklkBU5XMYgDlbvFDaSgmrXNTylBqgKAdlhY0f/rePoet1q5Eg9AyDGbPMZTluYuAk7pD9j3jIEuJ3SOD82rj5BCvao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10869
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

Gentle ping. Are we happy with this patch? Can we add this to mainline?

Cheers,
Biju

> Subject: Re: [PATCH v3 1/3] media: dt-bindings: media: renesas,fcp:
> Document RZ/{G2,V2}L FCPVD bindings
>=20
> On Fri, 02 Sep 2022 07:46:26 +0100, Biju Das wrote:
> > Document FCPVD found in RZ/G2L alike SoCs. FCPVD block is similar to
> > FCP for VSP found on R-Car SoC's . It has 3 clocks compared to 1
> clock
> > on fcpv. Introduce new compatibles renesas,r9a07g044-fcpvd for
> > RZ/G2{L,LC} and renesas,r9a07g054-fcpvd for RZ/V2L to handle this
> > difference.
> >
> > The 3 clocks are shared between du, vspd and fcpvd. No driver
> changes
> > are required as generic compatible string "renesas,fcpv" will be
> used
> > as a fallback.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> > v2->v3:
> >  * Updated the compatibles by replacing items->enum as
> >    it is just one item.
> > v1->v2:
> >  * Documented RZ/{G2,V2}L FCPVD bindings
> >  * Introduces new compatibles renesas,r9a07g0{44,54}-fcpvd
> >  * Added clock-names property
> >  * described clocks.
> > ---
> >  .../bindings/media/renesas,fcp.yaml           | 45
> ++++++++++++++++---
> >  1 file changed, 40 insertions(+), 5 deletions(-)
> >
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
