Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3C446A2C87
	for <lists+linux-media@lfdr.de>; Fri, 30 Aug 2019 03:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727413AbfH3B6m (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Aug 2019 21:58:42 -0400
Received: from mail-eopbgr1300058.outbound.protection.outlook.com ([40.107.130.58]:41281
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727344AbfH3B6m (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Aug 2019 21:58:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RTUCdd6Z1MzvG9CBWtFtqOe0oZ3ojolXtM5+ZkgP19eP+yGfCfq6DbdQq+/c+B1qB6KT8Q+A4yyNkXqNIpwItkMTm36zid5NO0dbWAliMaLPASHQwH2e6X2CIp0diIswRy4YpYyviJoHVBpRyJEPFHRPKc2tng/ufUzEzasotnAFQgeGrhVmRGK9vYwouk45PYOs7U2TbUE4osjng96qNSNcVrPVwby0ycnca6tS2CEEZWvJvQfZNX3F0ZDzOTUuE0VQVP0ZRc2q0BALV5R1y/cgE6VxKOycJ03N2OpcH//vLL52YbEGFMJo2AzVGAQtyelBSs11O72wGwCaaApcnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4isZp/PzGBjqlMvBYOKyg33r5kkCtHtvwX4lv1gu04=;
 b=ZluH+j1NEBcfWk/ZNAH5yqjVfXj44vUEBvT45HlWFdTIGNKxLsCt+v57uUj4uaNzHW2Wpl5wjHU7bPVOgRnrfcEwRXacOCZgATpT+CQusQ7uOy9sETp/R6DnDWyuWo7B8O+XQFx8s9bw7vNmNFF8A3CAmrkmvDE20C9mvvH6OFQiAdXLkGedsYTyiVSYzqx5ouiOQOA3Sc8ABQsv68Q5qfgMX0cj5AGcyBXVCKQdSZpUkYfOmRS9ZQng+wE6D2b0Lj90BqevXkKmaTdZKCzS/ZYAqih6JH8EeB77fi/2FF9+LV2fUIRkx7sNt83Vm7Ovj/IhWr/q0vZGBBcGkQJAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector1-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4isZp/PzGBjqlMvBYOKyg33r5kkCtHtvwX4lv1gu04=;
 b=P23YoZF1XF3VadiUJJTSHaY/muMcsoMWhCFiQz9V1d+gVkOdz0NwzxsYopZHGwWECl4NiFx/e52bmZXn4VOHEbwPaqA7VxRbEpFUYqerQQsH0QZFuEo9m5+IE0NlC/5fAUZOeqjPRFOAVbADk7jC5VK0xsR616X/2ghSg9j6c94=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2552.apcprd01.prod.exchangelabs.com (20.177.95.80) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2220.19; Fri, 30 Aug 2019 01:58:34 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::508e:ee77:4ba7:9278]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::508e:ee77:4ba7:9278%7]) with mapi id 15.20.2199.021; Fri, 30 Aug 2019
 01:58:34 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts
Thread-Topic: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts
Thread-Index: AdVe1mXog7WbTWhjRVuauzVW9AADZg==
Date:   Fri, 30 Aug 2019 01:58:34 +0000
Message-ID: <SG2PR01MB2141AC5BE736CDCE3391D17987BD0@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [118.189.211.120]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1ad066b5-0cd7-4e10-95ff-08d72ced90b0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:SG2PR01MB2552;
x-ms-traffictypediagnostic: SG2PR01MB2552:
x-ms-exchange-purlcount: 7
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR01MB255274AEC6966E4208C6298487BD0@SG2PR01MB2552.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0145758B1D
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(366004)(346002)(136003)(396003)(39830400003)(199004)(189003)(66446008)(107886003)(64756008)(316002)(55016002)(76116006)(66556008)(9686003)(66946007)(6306002)(71200400001)(26005)(4326008)(6916009)(3846002)(6116002)(25786009)(71190400001)(486006)(66476007)(66066001)(102836004)(6436002)(6506007)(476003)(33656002)(5660300002)(8676002)(81166006)(966005)(81156014)(52536014)(14444005)(8936002)(7696005)(7736002)(2906002)(305945005)(186003)(53936002)(86362001)(99286004)(508600001)(74316002)(256004)(14454004);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2PR01MB2552;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /zewHMNUVqaMDQVvNEHSnLAGxokdYvDfawzBCkdCapdMtTdJCzTZZoQZESLkCZiBPopDWA7g42yHH2K4mBaHG9a3C5OD22wb9I7xavGK8Z7Unw/GJcLneWbv0qyQwmjAkjVawRYlahnTk9q6z58W3FD61rNR5hCbFsgYBfV5gONqE9bEVdKeGhhaAhSEgXbL1RZdXUhAsJ+ZfN5PLP1E2oNrq+5p1X3CE7cOttPoT9/8l6O7ox+D5HO87DGZSo1/1VxH74XgvevFSKXjDKSVWoMswb1C5eMwSu9C8hXoTqAiOt1pWflCRuHHrx9koQ99dx4ud7dDEjsO95tKCSVAPDXaUpqOM28LoGNdpnjuILzbjSICPyYU7cs9IbxN0Rf6fueoQDnlJxQqSP0iYtTLxYywcu+QgHpf8PRIvK+3UII=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad066b5-0cd7-4e10-95ff-08d72ced90b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2019 01:58:34.1838
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LymI0pdOb+wfq2dtPRe/z4p/RD41a9G8917ayYECwK17wHOFeMaY/38mjxO5XQwEO6ezZo5cIlBtRSTvBQHO1LhRfJl8W9cEwgPyQ1BkP98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2552
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Subject: Singaporean Mr. Teo En Ming's Refugee Seeking Attempts

In reverse chronological order:

[1] Petition to the Government of Taiwan for Refugee Status, 5th August 201=
9 Monday

Photo #1: At the building of the National Immigration Agency, Ministry of t=
he Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket at the National Immigration Agency, Ministry of the =
Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration Agen=
cy, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt for the submission of document=
s/petition from the National Immigration Agency, Ministry of the Interior, =
Taipei, Taiwan, 5th August 2019

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th August 201=
9 Monday (Blogspot)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiw=
an-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th August 201=
9 Monday (Wordpress)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-governmen=
t-of-taiwan-for-refugee-status/

[2] Application for Refugee Status at the United Nations Refugee Agency, Ba=
ngkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at UNHCR Ban=
gkok

Link: https://www.youtube.com/watch?v=3DutpuAa1eUNI

YouTube video Published on March 22nd, 2017





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

