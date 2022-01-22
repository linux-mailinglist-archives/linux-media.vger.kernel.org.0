Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D821496C09
	for <lists+linux-media@lfdr.de>; Sat, 22 Jan 2022 12:23:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234188AbiAVLXe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 22 Jan 2022 06:23:34 -0500
Received: from mail-os0jpn01on2122.outbound.protection.outlook.com ([40.107.113.122]:10400
        "EHLO JPN01-OS0-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229847AbiAVLXe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 22 Jan 2022 06:23:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FVkedRZ3N2N4Uj7Se3abNTsjMQjUmj+iHNVQRXrFDwk/dQZsaEdFXad+3M2f4lXVLIw4VJb2QMn4xzzH0X9f1DvGpbMIhA+qS4uG638V+coDOK+QVdM/B1zd+Cv4uBEGz+/T1Ls8qc9I3YAoxMFP/DhrnH0fMN7lsCFSXix7FlwSUuYiFscu2HvhzGF4+zPUbhQ0b/SLl7bp/h3AOkhxBqn5uJFmoxUEAe5x/32+MHn1saNkYyNXpTP47CacisRzlRVrN9yutPQNppNfDDkWxcUPVzni+m/3Bpm8aP9dBibOgPtixVUFms/j8i5KC3Rzfdca8FYkRm+tY3B1hs7iCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1B6WWHYqE20L3fq4Pn3zmZK1u/yy+3L3kGKrjHP7eQ8=;
 b=Ri8P77F5sXWxdmPuXVj+WOLlT5kOsRNXTkAAsJ5UuAvVuwDXemVTASDThVZb/UTexTL8CzVU6HVdOxkjpWohPXXN4pO52gnoI7Glo9LLeCrDSk31GUlkHilNmjs0I2VW/4hJ23OMiRcPt/v+onhHr7SO1DAspOiehh+ZPHEfLkeFHbgY1ig3zS005696nPUtgw8CdDh/v10TtLYVRyzkdjpV1W/x6E9ayNVOElyS1ytDYK56hPjRMQ94sb/I6dG8HyaESLwGX48kajWFRkQfKYzNb7soSaj47hwY2jNAv5w8yqggy3cLpPfzdCqVuK5g8BTsfF72kVXwy1OH0PRLEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1B6WWHYqE20L3fq4Pn3zmZK1u/yy+3L3kGKrjHP7eQ8=;
 b=TkRNd4mk2vH9nNsCGBVfGoUappEkdGkLydsZyuTbU42x+J5bMj6Zhlp40WrWvIR9KSpioZagbYGnUYsPTI3qq26TKslmL3vzicJ7+Tnq9U526Q2+fTIWAwJ62jRLjdUayCPdbZs1hJM7yT9zKh/An9mcFkTQjIyi9+U3rfM7ncg=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSAPR01MB2881.jpnprd01.prod.outlook.com (2603:1096:603:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Sat, 22 Jan
 2022 11:23:32 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::3847:4115:3fbe:619%7]) with mapi id 15.20.4909.014; Sat, 22 Jan 2022
 11:23:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [RFC 19/28] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Topic: [RFC 19/28] media: dt-bindings: media: renesas,vsp1: Document
 RZ/{G2L,V2L} VSPD bindings
Thread-Index: AQHYB9xts4jxdkHKi0iBE9shTZbblKxuR7AAgACswuA=
Date:   Sat, 22 Jan 2022 11:23:32 +0000
Message-ID: <OS0PR01MB5922E4E0E015D3EE42A97F36865C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
 <20220112174612.10773-20-biju.das.jz@bp.renesas.com>
 <YetXnJf85MMlJjAW@robh.at.kernel.org>
In-Reply-To: <YetXnJf85MMlJjAW@robh.at.kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 38434eaf-a4d4-4a46-412b-08d9dd999f50
x-ms-traffictypediagnostic: OSAPR01MB2881:EE_
x-microsoft-antispam-prvs: <OSAPR01MB288108614478CB8207B80AD8865C9@OSAPR01MB2881.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z1qvVm+utZYSzbgR5QtvGM07u2vBc0hVRFV6KSg8MQLbt/NCvCXjC3YKY3g6OqGhYtKdK83HqP47ICZ0+gZkVzk3GKHSK7mD2SLXaxr3m5V8LRKCXMFQMmeQFs9ZJlsbclPqzxZiIVD0NwT4Jqi4z3J3E3iC/s28xV3BQEKQIcvRB9Ap0WX9gK+QCSU6rpM3IA+aqZCkmthbWLVXayo+QbpZ8B7LUojuZLm9c5ct/7nbpnndrjo/DqGYYe4duBkRZ6dGvRNPBMdVExz0QAJ8Ir6sGKWVzDmbg8puAuvN5LX2SlMVyQy+lR3PA0ewO7DbQevPm7HvlU53ZF6wRVoPXQacRvpZHyMbL2gp+cGJdz9Ogil1c6FRfDBle0HFZqfEc8D9Ns9CD8q72rmC6MSFNICpcVG4gwuYOC1oAdDxvD1JJ60XXzo4/Autn7ZVS/aNSgRqe+HMpocBcMV1cN66l9HoDtPQkPUtSkyKSAGydYrzYfZGE2IBawounwxPjil0qeV1rNVQRPDccI6mhiV4CNLZU21y1ubM4Zq8INmpCwa2YVdqm8RT05dyP315iz6PN5+aNN4X6j1ldHjiOV2HMngLxRn69W62RC5PTCQNXakUyeg9Q2ZduXugkxI5zBsGNBarsh8wSCaXU1lQbvqcUCjJarAZlNVyboFwkk3tb8X1b6AZ6n4QDrEDPxAc3WgLdeD2o8AAYk8C9dvKILMQsw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38070700005)(8676002)(54906003)(6916009)(66476007)(66446008)(66556008)(66946007)(64756008)(8936002)(76116006)(2906002)(122000001)(71200400001)(316002)(38100700002)(55016003)(107886003)(6506007)(4326008)(52536014)(83380400001)(86362001)(33656002)(186003)(26005)(7696005)(508600001)(5660300002)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qxvxV+4AgrVEX+fhf2k3OOdk/eJHG6tjfZENjpRV6Db7M3miZrv7zq4y/UGS?=
 =?us-ascii?Q?gdtogdBy2KRchFBIa6b2VfqxQZ6uC7wSkGvRL7rwpxDoLgmgN1fkosCqIfSj?=
 =?us-ascii?Q?4kOCvTbBXCpsr0ASNOLg1wWGCPLURDR0U/pyTzQp7RxrktNDjNk0rsMf9xqx?=
 =?us-ascii?Q?VCUYEOTXL06d8HZfjpcGtx8MTmibfmbwXG+l3IzcSCTvF+HQj9G1y9jL67ET?=
 =?us-ascii?Q?rTS/5b2ywbupjMdPjzex8yhiEksGqXCYmD69uyK1Eb54m62Ex2AVcAgT5VKG?=
 =?us-ascii?Q?wgvC39da8kpilwyzONPIOZ4849UlkxBKVj8/e7VcAyg1moyGTUSsQLthK7Ij?=
 =?us-ascii?Q?Q4gp/HlldGtxIZtNnOVZu3+AYyW+DO8vbebXghviJaD/g7pcCOAHetaVUfk/?=
 =?us-ascii?Q?lJ+AXc8xW/Ad/QwzIMXIHCTHW/JKpmr2EZ6YoNsu/INHv1awrOqPq0aERymX?=
 =?us-ascii?Q?YWwJNuQhyMjC5+zUcmLVMqBMRWsyeFvdJ3T0NtHFrTudDRrykBvYvAokyEHA?=
 =?us-ascii?Q?WNrCVcECo/uyc7/JTS2L14LPoFMUG5fVfkZ4K9fLo4Nv8F4s9S6owjg2Tacz?=
 =?us-ascii?Q?Q1d7t2L/FWi+ur/ybq+pA1NhynlYJ9UEHLmArORkdJloDVkRER2Avc8GaSBE?=
 =?us-ascii?Q?ptIPCfL1E5w2RvN8AYDJmpvqbHBtW+PK+KaxCs/uH+FsUqeP2HukDjVWAzIh?=
 =?us-ascii?Q?B/+px8Asodl41WFFRQ80DRtsdAOfZJI6EeSH+7RrsIm5/8QQjA8aKSSy62cb?=
 =?us-ascii?Q?Leb9kYN07gfty2d9WXgVEL3cWFsA6QCtSLHDmc6B1XrtvPRPJ3e0WTfe8V4N?=
 =?us-ascii?Q?DpID2MqRfP/V1FLF6wWPqWrBdiu3UQN5bZxzD0SINFnPYOn8U1Y0OUR9swlU?=
 =?us-ascii?Q?dgR+OOrcgf9OCGzzaxXUIB7IA+Pzr1kiyxLnpWs3aLxVIup6nwXyymRFw8ys?=
 =?us-ascii?Q?UwGweOAHn+C1PmbTtkxhjhUAmlGfc3brod3hgwVHsoyGRa+4El4wgKkwzhAK?=
 =?us-ascii?Q?60yPwXCXEZ/FVP9Y94LRf88cHI1GkRXsf7w7CIUcib9Ew+zXaNIh3maewF13?=
 =?us-ascii?Q?w/Bw1ILd9M3cdXWYXVePNDXFrVsUvTBJcNwz/aF5YKiSErFza0ujuQGUWgPB?=
 =?us-ascii?Q?oVrcwt+ZfuxHROcC7MQJ40j+BidWpEQNbQNhM431O5SBxVWBRksHl25C17+g?=
 =?us-ascii?Q?qSVsbBtrueA3klbldahHSdDeqS85RUBLz2jKH9ZKFQrQ+eJY5YXbBKnjVApa?=
 =?us-ascii?Q?8w/Kq59b8DrH9JWZl/wDeHRXLYspI489DfnwNRFmKVX+FzIA+aTC87Xv/pkW?=
 =?us-ascii?Q?TLFpu51mC+XsP/tbRlN5/I+T3OyTz5pXRf8u4/Fh+58TI3PU2eKubMnlGesF?=
 =?us-ascii?Q?VdGSUGMCoLl5zCx8+f530zMcmxCggjbo7GmPu5AmTDzxFlgzXdHY81iwqazr?=
 =?us-ascii?Q?u0+ktqO1zOCy/jEg8W0Cd9TiaaGmp3BekbnPSlXBGI7JTp+Xa7ZQ/ySAEK7Z?=
 =?us-ascii?Q?DQkbHyo+9lc+cC3PDMnhyWTO/w3YmYY7Ukp3j2aeQNKNDImz5Qt+YZ9RMnBF?=
 =?us-ascii?Q?VrSQg1L0sK7GT6qQZLl5OJDSKj3JbVh7QEOoE2LGJwbSLroU5myu/ee3vSpr?=
 =?us-ascii?Q?zZdcQbErOdCxOR/urfo1kX7bafVWh9kPxDfgKbaERBMZiu0xRMbG2F+hCKqB?=
 =?us-ascii?Q?ulY3Cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38434eaf-a4d4-4a46-412b-08d9dd999f50
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2022 11:23:32.1426
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gtV2HakVbA54uhqjxfnv1e9zVJeR6W6WOTQQXzpiJILOIwIjboQeXnbW6KPT+S9zIR3/bNwdyB6jlhNGGzNJkDK4r1d5lvOUEXRVrd/BZTM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2881
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

Thanks for the review.

> Subject: Re: [RFC 19/28] media: dt-bindings: media: renesas,vsp1: Documen=
t
> RZ/{G2L,V2L} VSPD bindings
>=20
> On Wed, Jan 12, 2022 at 05:46:03PM +0000, Biju Das wrote:
> > Document VSPD found in RZ/G2L and RZ/V2L family SoC's.
> >
> > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > ---
> >  Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > index 990e9c1dbc43..b27ee23d2b29 100644
> > --- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > +++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
> > @@ -19,6 +19,7 @@ properties:
> >      enum:
> >        - renesas,vsp1 # R-Car Gen2 and RZ/G1
> >        - renesas,vsp2 # R-Car Gen3 and RZ/G2
> > +      - renesas,vsp2-r9a07g044 # RZ/G2L and RZ/V2L
> >
> >    reg:
> >      maxItems: 1
> > @@ -27,7 +28,8 @@ properties:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 3
>=20
> You have to define what each one is once you have more than 1.

Agreed, Will define each clocks.

Regards,
Biju

>=20
> >
> >    power-domains:
> >      maxItems: 1
> > --
> > 2.17.1
> >
> >
