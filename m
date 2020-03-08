Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6A9C17D10D
	for <lists+linux-media@lfdr.de>; Sun,  8 Mar 2020 04:30:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgCHDai (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 22:30:38 -0500
Received: from mail-mw2nam10on2102.outbound.protection.outlook.com ([40.107.94.102]:32480
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726138AbgCHDai (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 7 Mar 2020 22:30:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VvjAydC3llMQEzoSEuTExC7jryS8GTbiCwusRZpsEqRhKzPlk5ffviapCNyBhcJOu25xogTwSlGxWs7HUMiF4OnmN1zM93FpvDFlqmpj0V7I9dufcwOiC3EBHnDpUFK3BY+PURJ3UF+fBYEg4VdHy6sFr1TPsaQuLOGbPy4M30grgfBhqMVLLkTkq7kDDcD9vWzkZUk2kMgquIFAutBVBKCOHqRbY/i71aypOWUkEUhClHTmw1yDyxr0ajZ7xCHFPTR0EdXot9TnhG//a6wd1f7FO5eMWAgos+rwRIDVMABEjPQteXkj/d9aAOeZaDCo0GTuak4juymqG3PKMUpDzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmTDvdA+ZEvjMCfSG+lHn2meTFDvisOJo97MtfFikf4=;
 b=WgvTDB2GcEQev+ZDNNNKNc8NLixqY5/zQeakjxTIPgET/wPpiNP/3YC5cT0ztCYkFDtXgCOo2kJ6X8p4ldD8NRU3GSnLR8L8YvfyodSmVNHZLNCMMyzzVJ6hXlgS4n3Ynk946qnwEyR9zsiJ/I5KFd1bodSXP1IgkCLxsOdf23P6sCXgCyD6bxqhU0Or1NXGhLeH06bMV1KuaMWEOzBvUHi6Hbp/hCmVlBJwedlYVRLT0KHlIzkHMMqwnkg+l6va5Kz0sEMRYX8N+1y2JCXTgX3QCWHX65gOf4VmaQZbO230AM29a/LUZdCkpSSxwQA+25tT/9t+yU9UTaMHU6isDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BmTDvdA+ZEvjMCfSG+lHn2meTFDvisOJo97MtfFikf4=;
 b=HNgJKoqxhppN+utSU2LBLp9r/mkzfRhTtvbKixxCVgN9V4Zq/2t3kHLcUGs0DA4tBkhuNCLCg5mB2z5EFX0k2+ORkCXQtc76NiSShsro62L8lEjk2G5UxhChczsTcledUomxMPUv0ZaoSl9NkrbsMRxm98WOqYjFgKbjOK+hFB0=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4579.namprd06.prod.outlook.com (2603:10b6:208:5e::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2772.15; Sun, 8 Mar
 2020 03:30:29 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2%7]) with mapi id 15.20.2793.013; Sun, 8 Mar 2020
 03:30:29 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: [bug-report]  drivers/media/platform/am437x/: illegal value of enum
 in vpfe_ccdc_set_params
Thread-Topic: [bug-report]  drivers/media/platform/am437x/: illegal value of
 enum in vpfe_ccdc_set_params
Thread-Index: AdX0+c6tRlIFwg3nSPOew0gokOyZpw==
Date:   Sun, 8 Mar 2020 03:30:29 +0000
Message-ID: <BL0PR06MB454878CAF243C837B7131597E5E10@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=liu.changm@northeastern.edu; 
x-originating-ip: [155.33.132.17]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4c40f95e-3554-40f4-3b85-08d7c3110d29
x-ms-traffictypediagnostic: BL0PR06MB4579:
x-microsoft-antispam-prvs: <BL0PR06MB4579D24ABB597128F2094595E5E10@BL0PR06MB4579.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 03361FCC43
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(199004)(189003)(6916009)(5660300002)(9686003)(26005)(33656002)(52536014)(55016002)(71200400001)(6506007)(7696005)(186003)(53546011)(81156014)(81166006)(8676002)(2906002)(786003)(75432002)(8936002)(316002)(64756008)(66476007)(478600001)(66446008)(66946007)(66556008)(76116006)(86362001);DIR:OUT;SFP:1102;SCL:1;SRVR:BL0PR06MB4579;H:BL0PR06MB4548.namprd06.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: northeastern.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1aWfslddl5eMPydAPnRoiUiB+MGSsoII3IRR3Ddt1F5/h1dX8YFjEdGaWIHCsFFw5nFGNnT4lRsXYpyOYGEiwkes71AYKZ/xYzucVh0OgsBsk66GPdrHYj4mCHBrsLcbL16fcOf3bM3F4BHJ+ba2AnWhcOlN+UwHstTbACYo5RjefEKY6htqXFUryKkA9VO+eaPs4nEL5B5Vzv7mLPNq0BwkaM09+8TYipXrxUEX2nFf1AA9Jkk8mFrxKnj4FIm3yD0cmLXtsV79LDsUEosadWIvr8E4QWIE/AGPsbmGp6dTn8tUlM1RF6e9GBYNPu2kz8ktbFm7ZxYlK/4X+5BNcq3DBP9iUww77HGR94E6fpz4CJMkE0D/GffMw3vlWInYlb6JUicNSHM1erKft8Q8VvGXr006m/vkuwvuCTE3bL7ucI7gVmKHB7c6ohuxtwVz
x-ms-exchange-antispam-messagedata: y1kz43uRtyXFUGRy4pgCndXx/tkHjDzX7jsyO14eaeHYEx0eBjYFf/aWC8B3tn9KyVU/5+MAi3y3LNfcZ1mYPCtweGfd/0AxoSo6KZeDHG60pc4/G7INooWdke2klDJvqeT3zS6u0hpJ2hgy8pc79A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c40f95e-3554-40f4-3b85-08d7c3110d29
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Mar 2020 03:30:29.8131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6q6qknAudzNVSAr2h9EDbL116jK8vp2KlZyurCaT6oYOCyCuvo1EHIMqJPdVT6PaXN0MKwUGuRY2S1UaoIJQrTWy+t10gyS2XhCMMvg76xE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4579
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This email was sent due to the previous one was rejected because of it's in=
 HTML form.

From: Changming Liu=20
Sent: Saturday, March 7, 2020 8:33 PM
To: prabhakar.csengg@gmail.com
Cc: linux-media@vger.kernel.org; yaohway@gmail.com
Subject: [bug-report] drivers/media/platform/am437x/: illegal value of enum=
 in vpfe_ccdc_set_params

Hi Lad,
Greetings, I'm a first-year PhD student who is interested in the usage of U=
BSan in linux kernel. With some experiments, I've found that, a unsigned un=
derflow might cause undesired behavior in
drivers/media/platform/am437x/am437x-vpfe.c function vpfe_ccdc_set_params.

More specifically, after the execution of
x =3D copy_from_user(&raw_params, params, sizeof(raw_params));
the raw_params are filled with data from user space.

Then diving into function vpfe_ccdc_validate_param, when calling function c=
cdc_data_size_max_bit, at=20
max_data =3D ccdc_data_size_max_bit(ccdcparam->data_sz);
the enum member, named data_sz, of structure ccdcparam is compared with 7, =
otherwise data_sz is subtracted from 15, as in=20
return sz =3D=3D VPFE_CCDC_DATA_8BITS ? 7 : 15 - sz;

The potential problem with this snippet of code is that, although in functi=
on ccdc_data_size_max_bit, ccdcparam->data_sz is treated as an enumeration =
with the range from 0 to 7 according to the definition of enum vpfe_ccdc_da=
ta_size, however it's essentially an unsigned 32 bit integer from user spac=
e. As a consequence, the return value of function ccdc_data_size_max_bit mi=
ght be any value from 0 to 255 due to the unsigned underflow and truncation=
.

It's worth noting that, although the usage of function of ccdc_gamma_width_=
max_bit has similar underflow problem, i.e. the value of ccdcparam->alaw.ga=
mma_wd is also an unsigned 32 bit from user space, while itself is a enum t=
ype. However it's checked in=20
if (ccdcparam->alaw.gamma_wd > VPFE_CCDC_GAMMA_BITS_09_0 ||
    max_gamma > max_data) {
                vpfe_dbg(1, vpfe, "Invalid data line select\n");
                return -EINVAL;
}
This if clause exclude all illegal values and keep the enum variable in ran=
ge, I wonder if it's necessary to apply the similar check to ccdcparam->dat=
a_sz to keep the its value legal as well.

Due to the lack of knowledge of the interaction between this module and the=
 user space, I'm not able to assess if this is a security-related issue. Ju=
dging from the appearance, a malicious user can possibly manipulate the ret=
urn value of ccdc_data_size_max_bit and make the check of "max_gamma > max_=
data" always pass. I'd be more than happy to hear your valuable opinions an=
d provide more information if needed. If such a check is unnecessary, I wou=
ld appreciate it if I can know why, this can help me understand linux a lot=
!

Looking forward to your response!

Best regards,
Changming Liu
