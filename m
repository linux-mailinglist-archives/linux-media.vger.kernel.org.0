Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E87B39B541
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 10:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhFDI4e (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 04:56:34 -0400
Received: from mail-eopbgr1400094.outbound.protection.outlook.com ([40.107.140.94]:25600
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229953AbhFDI4e (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 4 Jun 2021 04:56:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=daycWIsX3/wuk0c1Wx0qd7fw17zcDln5Iuml6jkZq6+Oku+cDRjCQ4HjlWT0zAC+MNbzdxxCcRQUFWDzYnVGeRmAIHzUtPpj8eulURxScr5Unmw3u7ufn9ewlKUYp0FM2EPeojaryWYZDVXlByhwPos9MBiuLCONVELwmPJM0ar09gN1n1c5BG53b0bKtFKP2mdR+OlLf6tbmcRR89LUaH6MldBCzsFnsVNNLlN7ZAu/w90Ec4kjcns3ZnvH6Ns1G9zC/G1L5pBj++Yy13FkzAnodI7bsXx4/6DICZYk0D/dr9e0UfMvK85U21zIh2MtTa+P7FwPjxHHYGdP4Vf+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znIkoqGC7pTaJOd1cWQHUN/H90B4de870k6v9Nkh9mI=;
 b=NWCPUolFP7DO7FvtVB1hOYnm0CBr/PzVVUYIIS61xnWg9y0b5jnViPPYQLG9oJ1IRPtC0edc3meLjB1n4yd60UG5k5jCIbYVXvScUfZ6kgbGQXbwJ2PHXRL8wM3z1wJT5izUHFGttJLo78dUaX8V0GZFP4m6ntci7ILxtCh/2WKd9dl02oKOBIOZIltZiWhojJijwymsNjMaIS/3wcWbsSKn4Jy9WJuzOnfh87ZNi7HnprToKKYrgCJ2x45k3nKgz670od8SuLuHBYtD2RfrBdBmC5o2dumW9GqEwrxHEM+pH7/7T5atqDAsrVwkuBJwjK+W93EKE9WpTnRsvNN0Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znIkoqGC7pTaJOd1cWQHUN/H90B4de870k6v9Nkh9mI=;
 b=nszfN7taKkcmFh2+XxBSDK8rpePuGJJL+FVYwT+g+H5Pq/OeTknZXua20rQA07W23kcgMpWi8xvZFp9pmAn5kvMe5eaHll64F9cxIBCB/jvBEWghnkPg1dUu6c2up8neE+YzKXtqnc4rlDu6rn+mcXgPtSF32FhDrSETBEl9r0Q=
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com (2603:1096:603:38::21)
 by OSAPR01MB2642.jpnprd01.prod.outlook.com (2603:1096:604:3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.27; Fri, 4 Jun
 2021 08:54:45 +0000
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::48dd:a7cb:a2b2:8d46]) by OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::48dd:a7cb:a2b2:8d46%6]) with mapi id 15.20.4173.030; Fri, 4 Jun 2021
 08:54:45 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Zhen Lei <thunder.leizhen@huawei.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        linux-renesas-soc <linux-renesas-soc@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>
Subject: RE: [PATCH 1/1] media: dt-bindings: media: renesas,drif: Fix a
 dt_binding_check warning
Thread-Topic: [PATCH 1/1] media: dt-bindings: media: renesas,drif: Fix a
 dt_binding_check warning
Thread-Index: AQHXTW5HTQ+ABLw2vEeT+OXEpe/6sKsDoslg
Date:   Fri, 4 Jun 2021 08:54:45 +0000
Message-ID: <OSAPR01MB2737D302E34693F9F85AD4ACC23B9@OSAPR01MB2737.jpnprd01.prod.outlook.com>
References: <20210520114953.8206-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210520114953.8206-1-thunder.leizhen@huawei.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [2.28.163.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c12d007d-d064-478e-281c-08d9273666dd
x-ms-traffictypediagnostic: OSAPR01MB2642:
x-microsoft-antispam-prvs: <OSAPR01MB26429D20E0D9CC2F81797BE0C23B9@OSAPR01MB2642.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:257;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BPIXg0QVboyyeXrjs/LEVrO3PEKfG8fUlnBcwrXUOu0pRLg1b18oRl1L77Z+JoX6YHfH+8DiVLbPWRYuow9AlPnLeN0U5vGWIJqn4i2CVhNkfFYnlMNZ8LkHUwtkCsOP680GBBzlETYWCGHovsbwmrLafbS/zXFT6G0fbf30fAIU8prIMmDxSgJ++Nbx+CoG2c7A+kEnoBIKLKZfolSEAHH+CHGdDgVTvMyFQOkRatghq0ZR1ZQcIXGvPvFCY1gJvfxqxnOKImmdeHO9Kwo6z1iaqRzaJrFcsxenm9v/Ghicn4tJwIbo8D9kUPHYkuj+C27Eymm5BYkwXr+9fymmt2CvNfs8rBoXQSv5u0hqsRaNEpY+4T6IMxdiTaJl5z8GA/TBqCRddzTsJfcysYun1FXOpFeCyWDmjEgTkFUDbcWAhR6MsWkSdzKnqRX7DwMeSe1JA++u/VH4rBHfXEQuaFeNJsrnYJQw8bGDLBj5Ox3WCLOu7o6BUBbVLzIpMMG/VwsKSLc4B7p2QzxIhOOHQAzLohaDbkqQT0VqNhGRsD3tHa4Vx0iYn0M34BHyZMDbusUW/TyM6ZwIctwRHQCkF9xY8aWDNhYZr/QVmDNarzb2A5TvAAb98jAaUmJfbFFVZOmcCCnVox9rwSPA7zgzK3vXr2VGtQE3loOfrzp6my1k0vlLBJkBvIKOctIPhA6y0bxjhorCSS78NsdSZFz/OFj0S7kUNzve2XV1rXCaqNf/SKjCtNPq1HHl79hSld52Iu+t488zx/OKOqoduLqiUA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2737.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(66946007)(71200400001)(966005)(33656002)(478600001)(6506007)(83380400001)(8936002)(122000001)(7696005)(38100700002)(316002)(186003)(2906002)(5660300002)(76116006)(66476007)(26005)(55016002)(9686003)(66446008)(64756008)(8676002)(52536014)(110136005)(66556008)(53546011)(86362001)(21314003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?GdCWmnQlbgBnZLeO6Nz89v89XgWGc2Uw391IASZBxSuFrdc68gE5IIGxuL3i?=
 =?us-ascii?Q?mRT9GYWC78z5idoeCDrXGQN6qCCzllfLxeRSxVvIDkggZ/reRMqmoQN5hCuT?=
 =?us-ascii?Q?Uz9ExTUNcPBUbFeF7e84isjPHp9M6/Mhf0vKwcwqfc0QKKWiVjZC1fUkmezu?=
 =?us-ascii?Q?o3Z7V06oAy5hF58exeah6SUgjPsQtEvkhReJjDiNVQVXBYRTkAbTIxrt/rGP?=
 =?us-ascii?Q?GgTR1aj9XYR+hGHXdzfqfT3tdUAocp8OC22OsHb6yOeKvkKqw7wXSjNAC1Oo?=
 =?us-ascii?Q?Xhqov4vFDRtxWFgd6UFy2NlfN+9+zBecB1zHqIxFvto0OhZALtO/enAX/TYj?=
 =?us-ascii?Q?6MXZR5s6ObzlOEBvsMUzal3En1mMHFFQGlMABF/6Gztmcselcc/w62fwBSxe?=
 =?us-ascii?Q?gIMAlz0bh/o98yUFulSSRLoaOApO+aoXIXuzpxdNTtUCoB4LKN61cD4vLD7e?=
 =?us-ascii?Q?0Dx8s8f0YQWTtBCwZ/bE146/MhnbHMmpUPS+UDYGsur3gV6PVHsFBKQ2NsZ3?=
 =?us-ascii?Q?OmggArYHDJEtN9undt2mZwXbrh3w5t44Dq8+FZ7ve6wI3udWyEPXiX3o0nPs?=
 =?us-ascii?Q?6tBMv/P/zQ12SmuIax6bCN48lu6Z9tysvB+oS3hmNrqwf5/UEiWRz7We+YXk?=
 =?us-ascii?Q?6MAlpdchq2f+ZN+meQ30m1KgyJKIcRfmoqmyAKE6VALnPvBZsCo2hAR+OR24?=
 =?us-ascii?Q?8xEBT6B8CIiOyCTFvjHWEDCItQQ1H915+GfXU5ORt9rpCParyEUlD3bJA3y+?=
 =?us-ascii?Q?L261yZAmQxCZIL75MqhRSfVvg7k9FcVJYIFqjAYUcQ612CPTGvg4b2VTXDSx?=
 =?us-ascii?Q?SrrUD3Eukd+U69v3LebeF40/mh6W3W5T4Wb3qL9i0oqTwbgtU1wfLJRMFm8K?=
 =?us-ascii?Q?RVTrLwaq81mAuRhj+qcOgofwJEkRqbLOXB9pw2MDw3J1z7ZEaJp5mRMA9kR8?=
 =?us-ascii?Q?6RQ9S87rZuDQh9q1ixvKCkdnMtdPYhcwPg/MFEpW0ylOZvkGCon+Yn4wKFEM?=
 =?us-ascii?Q?dm6Hqdkk0yKR2c3fJV3qgIcZpz3ZTNxKGg0kqzh7BrL0GSv43PQQSQ4pL91M?=
 =?us-ascii?Q?ELJvAMzx8jJu7neieF5AgHFnPI++9xYG8gCngfaMYS82TjNtHqX8lJrqEy1A?=
 =?us-ascii?Q?hz6rqHNakpupqzpPyx1v705uEijQf9fuMj9Ac6GvEBDprsmJIXCPaWYT1/PX?=
 =?us-ascii?Q?0zpRtTtS5rEcAPPO0NrpWoQqfLFjHwDvS9f3Nl2h8wDB/y7V5nVgohiGSldF?=
 =?us-ascii?Q?mPzhq4fkYfVcwnvePWF3zwKjJivqYi66+Wq9liAnOGJQHmTuLgtbCV3hi64s?=
 =?us-ascii?Q?fiU=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2737.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c12d007d-d064-478e-281c-08d9273666dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2021 08:54:45.6123
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JUolIspKyozD8eZpz6SgRjd+qXwDMuiF9CfJHQSj89QW4eLdhMgMfTULo8/voJA/+HirD8AtMaQs1H8nCTj+pKJTncAPxl/fv40UaMeyQo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2642
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Zhen,

Thanks for your patch!

> From: Zhen Lei <thunder.leizhen@huawei.com>
> Sent: 20 May 2021 12:50
> Subject: [PATCH 1/1] media: dt-bindings: media: renesas,drif: Fix a
> dt_binding_check warning
>=20
> The value of the property 'clock-names' is a constant string, so the
> 'maxItems: 1' is not needed, should be removed. Otherwise, the following
> warning is reported:
> properties:clock-names:maxItems: False schema does not allow 1
> ignoring, error in schema: properties: clock-names: maxItems
> warning: no schema found in file: xxx/bindings/media/renesas,drif.yaml

A similar fix was sent and accepted a while ago, please see:
https://lkml.org/lkml/2021/4/8/1329

Best regards,
Fab

>=20
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/media/renesas,drif.yaml | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> index f1bdaeab4053..b7f07062922f 100644
> --- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> @@ -67,7 +67,6 @@ properties:
>      maxItems: 1
>=20
>    clock-names:
> -    maxItems: 1
>      items:
>        - const: fck
>=20
> --
> 2.21.1
>=20

