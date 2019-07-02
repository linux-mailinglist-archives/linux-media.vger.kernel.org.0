Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF6435CE37
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2019 13:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726213AbfGBLOk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Jul 2019 07:14:40 -0400
Received: from mail-eopbgr1320079.outbound.protection.outlook.com ([40.107.132.79]:6426
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725801AbfGBLOj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 2 Jul 2019 07:14:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector1-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1EF0mLyJo4FSIyvMojzRsbdJuMyeaM06IVq4oUo1YTk=;
 b=ZSghtGp9w6U4YPxJJzNf3T67xMPgBPDBLHNIqlLIpB1t01oR13sDX0F5/yT9uiyWT1V1vOia5qWpB4qIoWz9YCbDNfXCt2XN0rq1Tp0r6FvLr58Dzcm4N7vBCJwkTPdbM7vaDugJL/a0CmT1lFKxlGJmk86pju71CYUOl3n439s=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2442.apcprd01.prod.exchangelabs.com (20.177.82.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 11:14:35 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::d503:3d71:ce06:19d2]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::d503:3d71:ce06:19d2%6]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 11:14:35 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Are there any device drivers for Hauppauge WinTV-HVR-935 HD Tri-Mode
 TV Stick DVB-T2 TV Tuner?
Thread-Topic: Are there any device drivers for Hauppauge WinTV-HVR-935 HD
 Tri-Mode TV Stick DVB-T2 TV Tuner?
Thread-Index: AdUwxw8cui4+EbAXQCmeFhdX2QGEhw==
Date:   Tue, 2 Jul 2019 11:14:35 +0000
Message-ID: <SG2PR01MB2141854D0E99451C9F4A951B87F80@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9336ee13-1109-41ba-1913-08d6fede775e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:SG2PR01MB2442;
x-ms-traffictypediagnostic: SG2PR01MB2442:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <SG2PR01MB2442671E4171990312D98D1487F80@SG2PR01MB2442.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(39830400003)(366004)(396003)(376002)(346002)(189003)(199004)(316002)(33656002)(6436002)(4326008)(9686003)(3846002)(107886003)(55016002)(6116002)(2906002)(53936002)(86362001)(186003)(6306002)(66066001)(26005)(6506007)(66946007)(7736002)(76116006)(7696005)(8936002)(71190400001)(102836004)(71200400001)(8676002)(81156014)(99286004)(68736007)(25786009)(6916009)(73956011)(81166006)(66556008)(14454004)(966005)(476003)(74316002)(486006)(64756008)(305945005)(4744005)(66446008)(256004)(52536014)(5660300002)(66476007)(508600001);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2PR01MB2442;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ekiFAfwHe9Sm6ZA99fS7/Jn3aBWXaBanh9iHFm7Sw3Y6oGFLFa/Sox4/QIHmdDt/aE1eZU0ibHepZsd6uWu1Zq7L8n6iQq7Ec5VO980ipuDw/kecfF9H3In+wHn9K5G+Vyob/u2PKx7f34ZNgrZBnB25+cXhU7efd2XKQNYHsiuPQRRwGoMedYxNCkVZTFd4CeJ/IyeecVsvBCRKLf2odfT2Zi0hLrB8t5ALpOqjRSITwemFgc7lEa+t665XV+gr1hlLesMjunnone9o00wqipnXX5I0s3zDgiLIgXy476QO/ypxa88YEPjZfS0eZztMb9N0cbxtbLRrmOgbRBEum1p6OAYiw8rtDIhTdyF166rgVHZM1Wv2mrQRB9yn1+q/soGwNL8rx7CjUsEpRSgR3IKwnviy2ZCO2iYrt/VoKOY=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9336ee13-1109-41ba-1913-08d6fede775e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 11:14:35.7354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ceo@teo-en-ming-corp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2442
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Good evening from Singapore,

Are there any Linux device drivers for Hauppauge WinTV-HVR-935 HD Tri-Mode =
TV Stick DVB-T2 TV Tuner?

I would also need an open source TV tuner app for Linux as well. Please rec=
ommend.

I am using the above-mentioned DVB-T2 TV Tuner in Singapore.

Thank you.






-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link: https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microwav=
e.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019

[1] https://tdtemcerts.wordpress.com/

[2] https://tdtemcerts.blogspot.sg/

[3] https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

