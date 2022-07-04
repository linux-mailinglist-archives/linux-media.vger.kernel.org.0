Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9377565F89
	for <lists+linux-media@lfdr.de>; Tue,  5 Jul 2022 00:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbiGDWzh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jul 2022 18:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGDWzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jul 2022 18:55:36 -0400
Received: from GBR01-LO2-obe.outbound.protection.outlook.com (mail-lo2gbr01on2067.outbound.protection.outlook.com [40.107.10.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1102D1C5
        for <linux-media@vger.kernel.org>; Mon,  4 Jul 2022 15:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmfiUDi4sWWBMEWS+QT1lenah6JX2bMwjRmF8D2WSeGJ2wSTxzr2nTY1qUh7OcH0MLi68V1a7kzwz3TwkW8r/8qqps8W/OjUEt6LGvPu+WTWc3i9EG+A9a/3WBerXHrRPFB4Y/K3mesECI5y8sYJYqJ3COZfcP6qk00L+jA/L6o752g2Hauxv2QIHhpYrYREMKzWuqVcZnsfWm50KDzTKB1DFApkqnc+/qkOre53e79P3EBC8qYrspxgR0hoY7CZNKvm2cVAtHeaobjncutKn09DPRS5X3fPFyzTNYwrtfL/MaLeFLlhMWXe5Wau0yHJ18imEA8c1qOBUvKIvPhkWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7KMI23q3sYHUD5pJqdFg/nUroqHI6rR72Pq4+IkMAE=;
 b=cSUPdeXWhegm6Z0SO+lh+ldHQ71TUQJQ7ughdlZ5IMcIGpszo1mid4ec4d/AydVDA/NR8TeZmqRQ16g8Dkvf3QUCLIfdaGff7BUVkgvnWSX0ancDtq9d42l/xry6+jGbNpD5M/qqbr2watMQ5M7P9kA5KYzxo+2mhap+SsfC1SXvqBa+EUpepw/TFm+MtOttWX8JFRAQJ8oNmolYs5Pi8YGTwA3EEIQ7xH4Yck0znkMaaLL3yhJzR1IQApbFNj1pGbdBcQ7ev8OuwWwJYI8LlDnYbYsr0Jh5fSh8KlOJT5U9e5rflJAltJBQaZbZQGm+470+nrSLCwaKDHECaJpJew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ziath.com; dmarc=pass action=none header.from=ziath.com;
 dkim=pass header.d=ziath.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziathoffice.onmicrosoft.com; s=selector1-ziathoffice-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7KMI23q3sYHUD5pJqdFg/nUroqHI6rR72Pq4+IkMAE=;
 b=QFR+4UGyKC8DuAb0LY9d/mY3ozyB9C8G6QYjAaxWMKX8PdjbOzccsENAGbU8L9fkdC5wFyr8T971OVPxllwRovXd1oedDo4vlITOgM2DofqtVK4fyQSS/DRFqnPRQGNvi9ZkR1TS84WcXPNfGRT9UKSOFPlJZ/SW8kHumjeOFp0=
Received: from LO0P123MB6617.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:24a::7)
 by CWLP123MB3492.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:69::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Mon, 4 Jul
 2022 22:55:34 +0000
Received: from LO0P123MB6617.GBRP123.PROD.OUTLOOK.COM
 ([fe80::39ef:4123:cdfd:cd28]) by LO0P123MB6617.GBRP123.PROD.OUTLOOK.COM
 ([fe80::39ef:4123:cdfd:cd28%5]) with mapi id 15.20.5395.021; Mon, 4 Jul 2022
 22:55:33 +0000
From:   Neil Benn <neil.benn@ziath.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: New Logitech C270 Model
Thread-Topic: New Logitech C270 Model
Thread-Index: AQHYj/j/aylyTLCNy0CAfgT/1GI61A==
Date:   Mon, 4 Jul 2022 22:55:33 +0000
Message-ID: <LO0P123MB661754838A2DD31F70DCC12EFCBE9@LO0P123MB6617.GBRP123.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ziath.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 97280ed2-a39d-489d-0a12-08da5e104d89
x-ms-traffictypediagnostic: CWLP123MB3492:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nN5E+w/MdgBgok2UAS1OyDJmU0eTKzfqqvcXfXI79FYFLb02F+76u3XbM2fVwt6nCJ5/Z4TeqABNZt8gBuBgxNNqqO6LevSoqVaD8+cer9nH9EAHLu9e9Lrt2kA9PHkaZuAf7k2UfJVEuSvDvX0RnkQK+Wj+SoInQR3qJt0q2vnBlWGFQ/pIzRBQ+cKa5afoe4ArW4BysHHnq+/yW9cacSy+JsrOvD5JzUQeP48hys4L8azhWcu0bCI7NJA6LQRAcZ1D9/nUXL6rf3HIOW2fXWrDF3twdNmc/FBUbkuekLmNmDcygq/wuYnw2nwG0zLCxiC/otoRpAi6EGppcuOvCXMm+n+3YWjWucB+Ju3RsHbse2EH2f9oTc5ZMP/3DwVCXdLgvRSQXCGX6/qDvfRhNLMiUyBvE/dXN6h5KvlmzpAnHlZeRca4qhzlBToir19GTZ5RIRSmPNPEwNkXs8u9vR/VN1b6kyJ0ftArXpvobZOMZVi/OPV+m50R2pPXDXp+w/A9QmqnPQi5l82E5XILrd+S2fNC5bJ2JMAOKL/tYojdY1a8Q9Z+Z/J4YqvhyFpfRseoF7VgXv2hqUe7SPtZZ6ZDJviIQ+hA9NMNyF/H0fbRcoAN5vVjS+Timjt3VQUiYjOdAyYA2nymUmMRsMuVU/cc09opulwj5bSqroOWt/zKFQKzn1W+H97YhV7JLtnLMKGCnOwcH3fDndu3dzJ4pOysUDjyfDnKXfx6O2nKrfV9a8LAoBETVjOfeFlZvSBrEA3qlqyMxcXXSooAQa+dKjHPl3+9s6gMkSflav1mGdRJxLBOAeWhDqnawpbztnXm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LO0P123MB6617.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(39830400003)(34036004)(376002)(366004)(136003)(396003)(346002)(8936002)(508600001)(5660300002)(55016003)(52536014)(186003)(7696005)(6506007)(26005)(86362001)(9686003)(33656002)(2906002)(44832011)(83380400001)(41300700001)(41320700001)(38100700002)(6916009)(66556008)(76116006)(316002)(66446008)(66476007)(66946007)(8676002)(64756008)(122000001)(38070700005)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nkN3JcB4iQDR4eIZ7OaTvB4heQIW/sE89TVSCpJW55CU4Qb7Lwd4c7AmE7?=
 =?iso-8859-1?Q?2hK8Ua7AXeqkEuE0SmQhrQsjORysrQnMg7FHgKYIkzTdk81QcpXEdPke43?=
 =?iso-8859-1?Q?dU2Rjb+qUTlp19tmNk3tI170mjJTrLYF8tVpkSi6CCe/rDTm3jXtBFZgf0?=
 =?iso-8859-1?Q?K0MAYTrCwk2bh7AmhlqPz+Pe0XyuktynKSrp1gflRH1sT9pjgdFpYrCAEW?=
 =?iso-8859-1?Q?zb0IY4X5NV3vjB82eXv9L8d+urmNOYM6UhSt7CZMeiktigD34JGP9g+AWj?=
 =?iso-8859-1?Q?e7+Lj13GUMrNVqk7YBFglNl+ZLTVPyW1KlZq/bwqhrwbuxuttPlWuxWqOh?=
 =?iso-8859-1?Q?JTTTakBfhXN5BV7cocogzjJIX6Khg1xomoov7X/alk6QiG2s+bKDEtL/ub?=
 =?iso-8859-1?Q?Xqfc+BSVpowdcWVdgEj49TfdtebZJaUoMFD6VzK/4+TUMVmg8k2OHxHXH7?=
 =?iso-8859-1?Q?d9k2C95RqMilcMF1DeMxvfHkUuEi/HMA3k8rW7kAxvXDsJguITRmcA8KlE?=
 =?iso-8859-1?Q?mroghh14BVLJRo0IXkhAhgv2vedWgXlyjDtKtK9pw3SiGccLbshyrp1F95?=
 =?iso-8859-1?Q?Gcyx1cB2uIIk/oesdfLKp8L+MuNiGWLl5EKGdHchJ08+vh/YSLkqIOiXTr?=
 =?iso-8859-1?Q?XeOdF2hS5L9NFsDv1fnAmy7gMNjUD/0i0OgkwgGMG343PElqNhqKx30OHB?=
 =?iso-8859-1?Q?x4lSyvrK9PZfSWxO7Dexe0FlfHcPK4i4RTZf3gw6KYhmcgvFHaO1gmNlbh?=
 =?iso-8859-1?Q?jieeL4dhNT8y1Cz1wRhhBlxBiZdikLHoXhk3h5+2BbX5ddlvNqBtz9YRR5?=
 =?iso-8859-1?Q?ZZHNQdK+0m0NtiGqsS5s/FvuDRw1WHQ1S2ivBlxvyqtcpHTktsrltS8GfO?=
 =?iso-8859-1?Q?S2BXxk9tyFO39roeou9YPBQOEs8dEeoIqRdhoTsel7BZmZtVqc02FkUNjf?=
 =?iso-8859-1?Q?hc+tBgPkRcjAEc05pJ64sryTmW+F4xQE/gw8yFwSUvyx1BkyM61RPENE44?=
 =?iso-8859-1?Q?4m82Ssewfgaeq2HYtymwUJisxAMVMb2rrWxPTfu0wzFFnX575gxyXY3caK?=
 =?iso-8859-1?Q?8v5DuhjgjwPW/hmNvWfSb9PQcdsqYITY36Jymd4PQ6H7mB98Ai5QZ+FKMU?=
 =?iso-8859-1?Q?G3disAfqLIXUSa+We8B6o4p1ZD6gYAs2VdNotccVEXX3Wt/6IhVgBEz9NQ?=
 =?iso-8859-1?Q?loU3rSg7HV0GAq3N+4dz5+gDMei5ZDVlXnClMx/IOmQx7qk45SYGkGO+sH?=
 =?iso-8859-1?Q?I9SvVyeZIUSwYsonTmcTNt5IBeOz68TYzLjc1iB8vbwI3fWkYcOy3o7ZI6?=
 =?iso-8859-1?Q?I4TPuDlhWwBG89IuRdpIiWqk5elRTC+lnNZNeUY8EhkBro5OWFjEoGwEGc?=
 =?iso-8859-1?Q?qyRJK1nOVO/jz0CpGMPQrSCPh1jvGn31HjGGRfPvRymZ7XX0Z3u/TWVm0z?=
 =?iso-8859-1?Q?ZJlOESArdL271oPPnSTdFpXjemDpmTfnfubiFp1vb4shnVLSgccv7+fO83?=
 =?iso-8859-1?Q?1aogahcyDYJMk64FYMK/cLxs8IT083t/09i50J5wBTEjaS36NMt/cZx8nJ?=
 =?iso-8859-1?Q?ROAY+RW53iDg1YB4FwO8zR/BOKlV0cZmx7I0fktNQF+h/xFGlV1LckE2n1?=
 =?iso-8859-1?Q?TPRaf421qhqeQKh5hZNA5ugVqdfMFYqn92?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ziath.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LO0P123MB6617.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 97280ed2-a39d-489d-0a12-08da5e104d89
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2022 22:55:33.9192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5fbb4c2b-111d-4722-93d2-2a62d785eb95
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: megbe0i3LtS2wf6I/Pk5GPadvK7fJCTtTQxT9tZtwSjxfPX7H/XoTWjTABdvcB18sm7Wjc9/bKTdI+ZKCCQs+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB3492
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,=0A=
=0A=
  Please accept my apologies, if this is the wrong place to ask but it is s=
o specialist I doubt I'll get much traction outside of this group.=0A=
=0A=
  Logitech recently changed the C270 camera with a totally new board that b=
ehaves in subtle yet important ways - it is noticeable because the new boar=
d is blue whereas the old one is green.  We've got some V4L code that uses =
ioctl DQBUF and QBUF to grab frames from the C270 unit, we have two units c=
onnected and they are both streaming at 1280x960 with an fps of 5.  With th=
e old, green, board this has been working for years.  However on the new, b=
lue, board we can only stream 1 camera in a process - if we try to stream t=
wo we have constant EAGAIN errno reported.=0A=
=0A=
  Is this something seen before?  It seems weird that the new revision of t=
he logitech C270 causes the issue.=0A=
=0A=
  Again, apologies if this is very specific and not of interest but I was h=
oping someone wiser than me would have some advice!=0A=
=0A=
Regards,=0A=
=0A=
Neil=0A=
=0A=
--=0A=
Neil Benn MSc=0A=
Ziath Ltd=0A=
Phone: +44 (0) 1223 855021=0A=
mmunication is strictly prohibited. If you have received this communication=
 in error, please notify Ziath Ltd immediately by email at=A0info@ziath.com=
. Thank you.=0A=
