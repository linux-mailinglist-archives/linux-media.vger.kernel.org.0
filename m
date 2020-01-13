Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82C41138C75
	for <lists+linux-media@lfdr.de>; Mon, 13 Jan 2020 08:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728512AbgAMHo3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jan 2020 02:44:29 -0500
Received: from mail-ma1ind01hn2035.outbound.protection.outlook.com ([52.103.200.35]:52186
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727021AbgAMHo3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jan 2020 02:44:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MsrkQCL5/iTw6WfQRd97cZiw+H4HsO3Ulc4h7fLufjcI/MOFy1YBE3uxH3SgdF2CiJ33z8hoa3mkQv3eSX1cAuo43N+0/v8j+ElnZqJbGSilKXNuYAyUImYr2ncaCIk34Tu74pQudNzCb1sZsKlsPxVbnzYVAbGz5CZQtsVPMzrIrgEyU3/4S00S4QM37DU3roEsQ3j4t1SUiL8dpzLkOoAJosjdrlCm63VoAO8Cvg/M2Noy0XKD/M5FzyOLYiZRcgJ1GjFK3Q+rzD19uwm6+5VnILY8f+d4eME5BHOjgg9LQqybYWwJOPcfIwUAwWUnwHuLqrPxRbqP++cs7e253w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VTUqdNCfmz+XgTaEFqj4wt+KWzO/RiTluWlKU9D9cM=;
 b=lmR4zQzTYqcD3vSGdYEtkttzgZjdhWSvD+6wFjXyz3AEEp/gKqLKJLf2fMBDjus1ld3t/TWRRHVxVsTwTTwmTyN9L/WmkiaEOnhNZ8d//yQw5Dfb/CIOXTDHA49yQbZnSwika1mBEq3HRIkke1hGXaHueRtA7CISsGZ/tNn7NBOjLwzse3wHZf/V3U4P6BdTLjBUIobnfUvWigGm4KmMpzonqlnUzG20siousfHA6mBx8//MC5POB7aaQGURuUCWb49QJ5Bn2e2C4A7D84AuDp0a0MzeoeJnHc+C7HAl4DZgLMxOk3t/33A5reTfmITF/HeMoHAAXAEIqh2ZSyqvPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=universaledigitaldata.com; dmarc=pass action=none
 header.from=universaledigitaldata.com; dkim=pass
 header.d=universaledigitaldata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORGFT5553547.onmicrosoft.com;
 s=selector1-NETORGFT5553547-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VTUqdNCfmz+XgTaEFqj4wt+KWzO/RiTluWlKU9D9cM=;
 b=X8N5yuo+S0jvwrQNB60+qdAlsxM8Cq/eCZyDWSuVxLKjkZ+YTCuS9pLBw2+JvHAAw1g9WxGHgINqBGRmus+j7F21rQle5QAeEXoiYiguuMPi30g5wZEKcClUmIf2b7niZNjbn8JV/NeHnyTtTvWya+G8xvyPmoeXv4sQhHR54Yk=
Received: from BMXPR01MB3735.INDPRD01.PROD.OUTLOOK.COM (20.179.243.22) by
 BMXPR01MB4023.INDPRD01.PROD.OUTLOOK.COM (20.179.243.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 07:44:25 +0000
Received: from BMXPR01MB3735.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a10c:740:420:ec6e]) by BMXPR01MB3735.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::a10c:740:420:ec6e%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 07:44:25 +0000
Received: from DESKTOPMPN5UI4 (106.51.26.46) by MAXPR0101CA0047.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:d::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend Transport; Mon, 13 Jan 2020 07:44:25 +0000
From:   Sarah Wilson <sarah.wilson@universaledigitaldata.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Leads On Integrated Systems Europe  2020
Thread-Topic: Leads On Integrated Systems Europe  2020
Thread-Index: AdXJ5UXDiY/HIT7XQhWRzyX6qxdsGg==
Date:   Mon, 13 Jan 2020 07:44:25 +0000
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAAPTePss7+FFKu8Ddkhz/AhXCgAAAEAAAAGGRCFxGnftAguW7oRNQFmkBAAAAAA==@universaledigitaldata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MAXPR0101CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:d::33) To BMXPR01MB3735.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:61::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=sarah.wilson@universaledigitaldata.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Microsoft Outlook 15.0
x-antivirus: Avast (VPS 200112-0, 01/12/2020), Outbound message
x-antivirus-status: Clean
x-originating-ip: [106.51.26.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 24ba8a2c-501b-440f-e2a1-08d797fc69a5
x-ms-traffictypediagnostic: BMXPR01MB4023:
x-microsoft-antispam-prvs: <BMXPR01MB40234C907310AC9CB336C4E790350@BMXPR01MB4023.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:SPM;SFS:(10009020)(346002)(366004)(376002)(39830400003)(136003)(396003)(189003)(199004)(64756008)(66556008)(6496006)(66476007)(1006002)(186003)(26005)(71200400001)(5660300002)(4744005)(66946007)(16526019)(44832011)(2906002)(52116002)(8936002)(81166006)(81156014)(8676002)(956004)(2616005)(316002)(86362001)(66446008)(6916009)(55236004)(6486002)(508600001)(36756003)(32030200002);DIR:OUT;SFP:1501;SCL:5;SRVR:BMXPR01MB4023;H:BMXPR01MB3735.INDPRD01.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: universaledigitaldata.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1jGkrFNFKemiUQ4+oFy4zzDpB+HfpIr9qxTylkxQIbuuwRXSZ3PQx0CkkVbrFeMUxFKdmimkKkqqBK49+Q7yg+TfA/oaMQAY2BSrfTTw861yswpA90yVaAMJaWbbGWjl1zu3njnDu+DeVB/PujjQhDWEjCbaB+gtf97v44TRErnblcVJWn5AebBhC71NhJjbtrHBWRboplG/oYuTtgc/L3/IYlbyzTRldq05qSRmnHdiNFLnarWn03xU9IMZDkACbCDe9tAr2dBxIbEcp6mBpFztpWHQRnd9IOoxLMfuKfGj9lt57d0Tl73b2+dagrRn5qfs6TPmgpUGAUb4eIMQPaA4m3xFVeaJ1FDOcl1PEG6zERK4fbgNht74R+BlpbhX/fMGW7RPycwsRfejkcUPc14nvIGFyI8NH0ipAC3akbY7FweB0KZelNMjWL3hmAP0PV0yGkhkD5uIVD3l47R27DrMiKXI5x6GW8BM8sgBFcnqglnk5gkrlF1AftIeohN+puITAu8rEx5jYvpZ8LxNdl7CC9r38KllYhXXHUs/+u0hEqWtCQeOClSQN36HTprV5TaVAFzuPFbZ+a4dVOiJc/E8hnn0CHFr+QlBFWlQ3pVWw6kfgQFlbdGtOe5TOqbXGAwaWEMvmS43KEMjatMF6erktX+6aeJuOHgaJPBdSsVf5Y0Q6OfkyjjRQKflKOqd8FsOO8G5yvxSsQGdcbgQJVbyPVrJm9/bB9ntp+fbBAZ5vi9zqEl7I0kEILPb1ePGyX3Tcz1h2WFJ96EIYHu3CQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <075288F4AC42BD4AB1D75AC93937E151@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: universaledigitaldata.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ba8a2c-501b-440f-e2a1-08d797fc69a5
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 07:44:25.7395
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 136679fb-fa93-4ffb-ae24-fda892c47083
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NvcwwWwCcJOYg9yeGsGfS2BdkegC8RRgUwuLaVgFi1ngvTDJTfqAq1PIIh2f1UYJnwXkHBLEilQh1nSZ1qT6lJ4YQuFvBEFkU0v8bH7lnMthFn26NN6JehuTz5vE4Le7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB4023
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

I hope you're the right person to discuss about Integrated Systems Europe
2020 Attendees Database.
=20
Key Contacts:
                              .	Computer
                              .	Electronics
                              .	Electrical Engineering
                              .	Integrated Systems
                              .	Electronic Systems
                              .	Audiovisual and AV Industry


Venue: Amsterdam, Netherlands

Please let me know your thoughts, So that I can send you the Number of
Contacts available and the Cost for it.

Best Regards,
Sarah Wilson
B2B Tradeshow Specialist

If you're not interested kindly reply with the subject line "Opt-Out".

