Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4431C13D7EA
	for <lists+linux-media@lfdr.de>; Thu, 16 Jan 2020 11:33:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgAPKdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jan 2020 05:33:12 -0500
Received: from mail-eopbgr1390093.outbound.protection.outlook.com ([40.107.139.93]:55276
        "EHLO IND01-BO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725800AbgAPKdL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jan 2020 05:33:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHUg89PmvpdS5BWN9oWQM/9iYjl5v4sb00XUHW1OOtlAOgydBGA7mKD1X7BfJUf2eh3APmev97ENLDpQ2nnPmsH7XBfglN7w2TS160Zvo3FbYZgTHPDrLrdtGIYnJyAhv/X8Hy56fsILkZPVY55VdWZh2C3QWarLmwUMhc+bPNaawrFUPB6pSrKYE1N9k5NtO35BrGNyJghMuCgIP1+MbDiQ1Rh59e40Qo3WykVzwn15ZOaN16w0NXasziLmo5s0XU3f+XD1dTbwBuvYed+2oFhZaCjfd437WKstszjQRiMQXsfZKzrfGMYksqyW/6SIho+sOaIJwZhZBg+cZjQV1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AWbmdXL4dBfOQx6DC6ZrxpV/mgZhUl7sbTtspuRaXE=;
 b=MkobMIpJ/S/yyFQI1geQK9V0JE6jujIb9QSqPmwSpbtGUdKhktbSxgYU9tey92JIjuVlbsDg91WeOPgULqr+//BoKAHZARJQX/NCbL8LSSrMzXn4TdkVu4Z+fxbQrrDXyb6ZiNnFvpQhqEaaAFCocm1XlQ0mgIuLUccU+ACE0xkLI+9mdvQd/SyDJOzx+/b6hlGYZ7tGJokiq/Qwz0gqYJ3+uQhqplCUPxJONpmBIEwuqsn+Sg8A+m+EIIECnxC9RO7U9L9iWTlFjyYq8wfc9zmWu0qVXwb49FysxzzgVA+iGoENdNrGm6DIwU8evGyV3PFwXd0xmA+XsCxh6pTlFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oceanedata.com; dmarc=pass action=none
 header.from=oceanedata.com; dkim=pass header.d=oceanedata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORGFT5553569.onmicrosoft.com;
 s=selector1-NETORGFT5553569-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/AWbmdXL4dBfOQx6DC6ZrxpV/mgZhUl7sbTtspuRaXE=;
 b=sRHOTSRxVhAiWhFrk7xOfJR1YD0xTqBNs7VBev6dl6PECRC2wFQHfQU0XlA972pRV+gbH7AE1oTmVoNKrXRUPdAHFxYsneQoPGe4FpPX8IHgb1Do58cHF2pCc4oUHAs07FAvr+dzPiU1V21lh325LK+D13eGrfU8C/xC75Zh1Nw=
Received: from BMXPR01MB3894.INDPRD01.PROD.OUTLOOK.COM (20.179.243.10) by
 BMXPR01MB0951.INDPRD01.PROD.OUTLOOK.COM (10.174.217.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19; Thu, 16 Jan 2020 10:33:07 +0000
Received: from BMXPR01MB3894.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d960:ff9d:e6e4:2c1]) by BMXPR01MB3894.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d960:ff9d:e6e4:2c1%5]) with mapi id 15.20.2644.015; Thu, 16 Jan 2020
 10:33:06 +0000
Received: from DESKTOPMPN5UI4 (106.51.17.50) by MAXPR0101CA0027.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2644.20 via Frontend Transport; Thu, 16 Jan 2020 10:33:06 +0000
From:   Mary Smith <mary.smith@oceanedata.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: 2020 Embedded World 
Thread-Topic: 2020 Embedded World 
Thread-Index: AdXMWFYlBb60zX6nShiUWL5Xnnns5A==
Importance: high
X-Priority: 1
Date:   Thu, 16 Jan 2020 10:33:06 +0000
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAPfxu8Y9lMVAhLaSR/F6sVHCgAAAEAAAANyDALlzIS5OudG48FSPTLYBAAAAAA==@oceanedata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0027.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::13) To BMXPR01MB3894.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:61::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=mary.smith@oceanedata.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Microsoft Outlook 15.0
x-originating-ip: [106.51.17.50]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 85f61d1d-bbc5-41f1-5c8e-08d79a6f798f
x-ms-traffictypediagnostic: BMXPR01MB0951:
x-microsoft-antispam-prvs: <BMXPR01MB0951E36FCC4264C900AD340EE4360@BMXPR01MB0951.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 02843AA9E0
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(376002)(39840400004)(346002)(366004)(199004)(189003)(8676002)(81166006)(71200400001)(6486002)(52116002)(86362001)(66446008)(4744005)(66556008)(5660300002)(16526019)(508600001)(81156014)(2906002)(64756008)(186003)(66476007)(4743002)(44832011)(956004)(6916009)(6496006)(26005)(1006002)(36756003)(7116003)(8936002)(2616005)(316002)(55236004)(66946007)(32040200004)(130950200001);DIR:OUT;SFP:1102;SCL:1;SRVR:BMXPR01MB0951;H:BMXPR01MB3894.INDPRD01.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: oceanedata.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8V0YpKE8VFdnIOBq61zIYzaTa4VrlHNU7D1f69YDXc2+EkOlhs8VmAeJgJtAuk3JP+AWVecLRIQxzrbY77AcVyTAGYKV7j45tjG6C9GJDOzdZ7aizO1sn9KSpl1t611vCLibcorSdo+wI6wvpqr/Gstbpgr8+iw/9nOfoTh0KzmMZnrfddegmJR7R50Hrac/UjMx8BGyl9mUiw9ib0yv9Bn55J13thzj0v0fOEobRzxCOczADVkpuRKbyvMHA2RQZyfHd9mHKfSrt5pEwWHYiIRAWAwLiqooC/0CMMgey1iYjpcq1kQX3aoY9Wj30N9arDg9ahnHS9iCanC3hS5GsyAPgtma73fxclhrwTengjZkhtBfJ03l3fFJQFgCKOLohtDVuRC5S9EPkCfECwmCl8/vB1QEbD1vacc9pSV7qLmxwMQZWvlw+IZBW46ypARQ3aCQEB0B3644SxNgvkanzzgVOss8fbp/VVJupP6BAmagwdPSvDh5Xv3Z317tjFVyYhtPBifueW4ZoQWTI9cdteyNA/G61b4zzMmjZtMhadg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <C0BD74FF7C90814EBA8EDBF65EE6A8A7@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oceanedata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85f61d1d-bbc5-41f1-5c8e-08d79a6f798f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2020 10:33:06.9079
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 03cbc421-e565-4cc8-bf1c-64e35a1b9e25
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 72+vJ2GgRh1X7+qzyfTp5bh/U7xKfhQjVRDgNanJUqeR1Y2pQq3btHgtoUm/DsFgbjyYYRlzpFgPrU1yr/4xOjKBX9N2sf9gfMK0VEVgUfI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0951
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I'm wondering if you would be interested in purchasing Embedded World 2020
Attendees List.

Target Audience: Electronic Systems, Embedded Technology, Embedded Systems,
E-mobility and Distributed Intelligence

Venue:  Nuremberg, Germany

Please let me know your thoughts, So that I can send you the Number of
Contacts available and the Cost for it.

Best Regards,
Mary Smith
B2B Tradeshow Specialist

If you're not interested kindly reply with the subject line "Opt-Out".

