Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 583EF17E74C
	for <lists+linux-media@lfdr.de>; Mon,  9 Mar 2020 19:36:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgCISgz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Mar 2020 14:36:55 -0400
Received: from mail-eopbgr1380095.outbound.protection.outlook.com ([40.107.138.95]:63761
        "EHLO IND01-MA1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727381AbgCISgz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 9 Mar 2020 14:36:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oLqgIh5zczMWltY/tFhXtvrUo6MGzDrBwzC5H8FUrjum+OKj4jqSbgPegCqdm55TiBOVusrpj2EyH32H1M8FN2HXYq2c6S+QdfMGQJC3IpPWvIEHKK+zh3cDMg4GSU+5o4hGmGKyv9RW1KfMUXhFsLtM7Uhdu0o5sMdx0gbhgN1VuVenUC6or2UH+GTOi3Qs09ozKjCBDR39mg91vTQVnYJXqD6uJw2IK1WSH7ZmyEB8+QtH0ouBXG2noD2Gu/9WDhi4ygpKa6ONBqyVV1IfbwmyVtVNSUf29J4OO7y7+M/wAAbxs/GtlcfgvaE0U65LaQK0WOYItWoSYZVzRFinDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ8iS+ee7z53EuxeR6x+ssszDVWFz6pc5Dm8RlkAmq4=;
 b=GMSh3kPF/2d7kDn+ty9ZMcdklSTe7aidR2ikVfxkM9Zi5zWXnJ4pccccHu2Ju1nCpi9pw9du5LjDVUY8q4sS2py2sOXiy/LAT1e1dyOpt8IXbrboGJ3dwgAdkLq/IQ8Sh84XQZIwSzkVM2GV3Rb/UtdODqt1ZcFpRFh5msRm+gaacpHslf+LLlWxSzUZRldTl8HevzFEpfYZ1XDDVsz9ckx87TOBJaO1iXD1JL9Tu6kk2yOyEG8Rseehl3myKtGPIDhzT1wtJuG9nJrvdu6wM3bVL2Jnx2OYNvb+3GTVC12WhrZIGCzmY3GPXKY3nZ1453la2hhtF9aF5hhSTsTh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=a2zdb.com; dmarc=pass action=none header.from=a2zdb.com;
 dkim=pass header.d=a2zdb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=NETORGFT5695220.onmicrosoft.com;
 s=selector2-NETORGFT5695220-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aQ8iS+ee7z53EuxeR6x+ssszDVWFz6pc5Dm8RlkAmq4=;
 b=dvF1xVi7A63oIjD263nPLRCYkZP4xcCMVh+V29kBfWim0/l0K9Wxrl/nofnfBK0tBVrAGh+u0TBvv7zKDc++WFppu9RbeQxOsBfnaV4y5dFEorpcxScLAqARF+nmEMdVeHdAfMLlzDeWuRAIauHKYrcjI31RiV9Bi3xDJtpGjhU=
Received: from BMXPR01MB3896.INDPRD01.PROD.OUTLOOK.COM (20.179.241.14) by
 BMXPR01MB2150.INDPRD01.PROD.OUTLOOK.COM (20.178.169.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2793.17; Mon, 9 Mar 2020 18:36:46 +0000
Received: from BMXPR01MB3896.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d20:663d:1fc1:cc46]) by BMXPR01MB3896.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d20:663d:1fc1:cc46%6]) with mapi id 15.20.2793.013; Mon, 9 Mar 2020
 18:36:46 +0000
Content-Type: multipart/mixed;
        boundary="_000_BMXPR01MB389683A6194910D69F56555CCBFE0BMXPR01MB3896INDP_"
From:   Patricia Allen <patricia.allen@a2zdb.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: MGE UPS Systems Users Contact List
Thread-Topic: MGE UPS Systems Users Contact List
Thread-Index: AdX2QRKB8mi4Iua2TcOipd+4Sycx5Q==
Date:   Mon, 9 Mar 2020 18:36:46 +0000
Message-ID: <BMXPR01MB389683A6194910D69F56555CCBFE0@BMXPR01MB3896.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-VI, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: <BMXPR01MB389683A6194910D69F56555CCBFE0@BMXPR01MB3896.INDPRD01.PROD.OUTLOOK.COM>
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=patricia.allen@a2zdb.com; 
x-originating-ip: [49.206.228.230]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2a339d2-bcc6-40ff-ff8e-08d7c458d2c3
x-ms-traffictypediagnostic: BMXPR01MB2150:
x-microsoft-antispam-prvs: <BMXPR01MB2150825E5E93EA9D3D5BDAF1CBFE0@BMXPR01MB2150.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0337AFFE9A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(136003)(396003)(39850400004)(346002)(376002)(199004)(189003)(71200400001)(4744005)(44832011)(33656002)(2906002)(86362001)(316002)(9326002)(8676002)(8936002)(81166006)(81156014)(26005)(186003)(66476007)(66556008)(66446008)(64756008)(52536014)(66946007)(45080400002)(5660300002)(55236004)(76116006)(478600001)(55016002)(9686003)(7696005)(6506007)(6916009)(26710200004);DIR:OUT;SFP:1102;SCL:1;SRVR:BMXPR01MB2150;H:BMXPR01MB3896.INDPRD01.PROD.OUTLOOK.COM;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: a2zdb.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tNfSraa0Y2VL9Sx7qqUR1H0zLQ/qZCbwcbpsTMgkZtYYCUx80nyozN9BWRlQrhTAvCeCf0+9sR4oXmTpel7958YT0ARTnDhFdytoE4RcImI1krwC1raFkJYH6kg5bJAFwCKv7U1bZqb7rKitYy+l4ksMX8rbDNEgI4lCWzcRJDmn8Dn5ueuv0OPuUDsYUGHarhCTsZMMC5k8b7SNerPXnx38hy8W8u9mH8cnyWqyF+YWxtht/a16GvBjuBSJsinGPAKF2glZcp1jssf0/ilbDEvY/gOKaEpgV9q8yYU22ALto3eR726Jpfkf2wrAHd1EWLymHyU0hOJypj/doB3ndQCU/dPAvcOE8Z9J9TS8qP5DSkP9I+HdF6sO8CSf1Cb/i/oANC5Q+SHkFuHuO1OXZo1WKnPJsnceA//SjYjpDHkJ5PWp3i9Hl+BuJFXmwDtj6iula23gUuyR7pJ8Q9QbjENS/AB/wqhSvUiVZckYrBnJjhOwadiOtzTesVGWcCP6
x-ms-exchange-antispam-messagedata: xhOWf305N92duSYVvYkqMV0y/cLkEg2RqIPm7xLkA6Z1XsISbXGXdt8+WzcdI1iyfy17pfTH0gu9FZH40+rYkk4fpS5s0ZXDwB4ZBl8jztSeZIR6QL3lQsxG95mEhiYzlSUKU2zPFtP9izEFoON+aA==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: a2zdb.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2a339d2-bcc6-40ff-ff8e-08d7c458d2c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2020 18:36:46.7071
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2d431b7d-2908-4c53-b357-a8137832d964
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PlAqmRNAaGT4d/rKO9VYFBNlznq1rRRVWbbfGWVcgeTzl7JjdKrcKNMqT2A0FoD+LcyF2YEEdhSKw+L11X1ahUEJa+nCaTl4tG6CkFWlrcg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2150
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--_000_BMXPR01MB389683A6194910D69F56555CCBFE0BMXPR01MB3896INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I would like to know if you are interested in acquiring MGE UPS Systems Use=
rs Contact List.

Information fields: Names, Title, Email, Phone, Company Name, Company URL, =
Company physical address, SIC Code, Industry, Company Size (Revenue and Emp=
loyee), LinkedIn profile link and kind of technology using/solution in plac=
e.

Let me know your target geography so that i will get back to you with the c=
ounts and pricing.

Await your response!

Regards,
Patricia Allen
Marketing Executive

If you do not wish to receive further emails, please respond with Remove me=
.


--_000_BMXPR01MB389683A6194910D69F56555CCBFE0BMXPR01MB3896INDP_
Content-Disposition: attachment; filename="winmail.dat"
Content-Transfer-Encoding: base64
Content-Type: application/ms-tnef; name="winmail.dat"

eJ8+ItR8AQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEJgAEAIQAAAENCQjkwRkMx
RTc2OThDNDg5NzcwMzc0NDdFOTIxM0RFADkHAQ2ABAACAAAAAgACAAEFgAMADgAAAOQHAwAJABIA
JAAuAAEAXAEBIIADAA4AAADkBwMACQASACQALgABAFwBAQiABwAYAAAASVBNLk1pY3Jvc29mdCBN
YWlsLk5vdGUAMQgBBIABACMAAABNR0UgVVBTIFN5c3RlbXMgVXNlcnMgQ29udGFjdCBMaXN0AOML
AQOQBgDYNAAAZQAAAAIBfwABAAAAUQAAADxCTVhQUjAxTUIzODk2ODNBNjE5NDkxMEQ2OUY1NjU1
NUNDQkZFMEBCTVhQUjAxTUIzODk2LklORFBSRDAxLlBST0QuT1VUTE9PSy5DT00+AAAAAAIBExAB
AAAARA8AADxodG1sIHhtbG5zOnY9InVybjpzY2hlbWFzLW1pY3Jvc29mdC1jb206dm1sIiB4bWxu
czpvPSJ1cm46c2NoZW1hcy1taWNyb3NvZnQtY29tOm9mZmljZTpvZmZpY2UiIHhtbG5zOnc9InVy
bjpzY2hlbWFzLW1pY3Jvc29mdC1jb206b2ZmaWNlOndvcmQiIHhtbG5zOm09Imh0dHA6Ly9zY2hl
bWFzLm1pY3Jvc29mdC5jb20vb2ZmaWNlLzIwMDQvMTIvb21tbCIgeG1sbnM9Imh0dHA6Ly93d3cu
dzMub3JnL1RSL1JFQy1odG1sNDAiPjxoZWFkPjxNRVRBIEhUVFAtRVFVSVY9IkNvbnRlbnQtVHlw
ZSIgQ09OVEVOVD0idGV4dC9odG1sOyBjaGFyc2V0PXVzLWFzY2lpIj48bWV0YSBuYW1lPUdlbmVy
YXRvciBjb250ZW50PSJNaWNyb3NvZnQgV29yZCAxNSAoZmlsdGVyZWQgbWVkaXVtKSI+PHN0eWxl
PjwhLS0NCi8qIEZvbnQgRGVmaW5pdGlvbnMgKi8NCkBmb250LWZhY2UNCgl7Zm9udC1mYW1pbHk6
IkNhbWJyaWEgTWF0aCI7DQoJcGFub3NlLTE6MiA0IDUgMyA1IDQgNiAzIDIgNDt9DQpAZm9udC1m
YWNlDQoJe2ZvbnQtZmFtaWx5OkNhbGlicmk7DQoJcGFub3NlLTE6MiAxNSA1IDIgMiAyIDQgMyAy
IDQ7fQ0KQGZvbnQtZmFjZQ0KCXtmb250LWZhbWlseTpDYW1icmlhOw0KCXBhbm9zZS0xOjIgNCA1
IDMgNSA0IDYgMyAyIDQ7fQ0KLyogU3R5bGUgRGVmaW5pdGlvbnMgKi8NCnAuTXNvTm9ybWFsLCBs
aS5Nc29Ob3JtYWwsIGRpdi5Nc29Ob3JtYWwNCgl7bWFyZ2luOjBpbjsNCgltYXJnaW4tYm90dG9t
Oi4wMDAxcHQ7DQoJZm9udC1zaXplOjExLjBwdDsNCglmb250LWZhbWlseToiQ2FsaWJyaSIsInNh
bnMtc2VyaWYiO30NCi5Nc29DaHBEZWZhdWx0DQoJe21zby1zdHlsZS10eXBlOmV4cG9ydC1vbmx5
Ow0KCWZvbnQtZmFtaWx5OiJDYWxpYnJpIiwic2Fucy1zZXJpZiI7fQ0KLk1zb1BhcERlZmF1bHQN
Cgl7bXNvLXN0eWxlLXR5cGU6ZXhwb3J0LW9ubHk7DQoJbWFyZ2luLWJvdHRvbTo4LjBwdDsNCgls
aW5lLWhlaWdodDoxMDclO30NCkBwYWdlIFdvcmRTZWN0aW9uMQ0KCXtzaXplOjguNWluIDExLjBp
bjsNCgltYXJnaW46MS4waW4gMS4waW4gMS4waW4gMS4waW47fQ0KZGl2LldvcmRTZWN0aW9uMQ0K
CXtwYWdlOldvcmRTZWN0aW9uMTt9DQotLT48L3N0eWxlPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1s
Pg0KPG86c2hhcGVkZWZhdWx0cyB2OmV4dD0iZWRpdCIgc3BpZG1heD0iMTAyNiIgLz4NCjwveG1s
PjwhW2VuZGlmXS0tPjwhLS1baWYgZ3RlIG1zbyA5XT48eG1sPg0KPG86c2hhcGVsYXlvdXQgdjpl
eHQ9ImVkaXQiPg0KPG86aWRtYXAgdjpleHQ9ImVkaXQiIGRhdGE9IjEiIC8+DQo8L286c2hhcGVs
YXlvdXQ+PC94bWw+PCFbZW5kaWZdLS0+PC9oZWFkPjxib2R5IGxhbmc9RU4tVVM+PGRpdiBjbGFz
cz1Xb3JkU2VjdGlvbjE+PHAgY2xhc3M9TXNvTm9ybWFsPjxzcGFuIGxhbmc9RU4tTlogc3R5bGU9
J2ZvbnQtZmFtaWx5OiJDYW1icmlhIiwic2VyaWYiO2NvbG9yOiMxRjRFNzknPkhlbGxvLDxvOnA+
PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNwYW4gbGFuZz1FTi1OWiBzdHls
ZT0nZm9udC1mYW1pbHk6IkNhbWJyaWEiLCJzZXJpZiI7Y29sb3I6IzFGNEU3OSc+Jm5ic3A7PG86
cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPU1zb05vcm1hbD48c3BhbiBsYW5nPUVOLU5aIHN0
eWxlPSdmb250LWZhbWlseToiQ2FtYnJpYSIsInNlcmlmIjtjb2xvcjojMUY0RTc5Jz5JIHdvdWxk
IGxpa2UgdG8ga25vdyBpZiB5b3UgYXJlIGludGVyZXN0ZWQgaW4gYWNxdWlyaW5nIDxiPjx1Pk1H
RSBVUFMgU3lzdGVtcyBVc2VycyBDb250YWN0IExpc3Q8L3U+PC9iPi48L3NwYW4+PHNwYW4gc3R5
bGU9J2ZvbnQtZmFtaWx5OiJDYW1icmlhIiwic2VyaWYiO2NvbG9yOiMxRjRFNzknPjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNwYW4gbGFuZz1FTi1OWiBzdHlsZT0n
Zm9udC1mYW1pbHk6IkNhbWJyaWEiLCJzZXJpZiI7Y29sb3I6IzFGNEU3OSc+Jm5ic3A7PG86cD48
L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPU1zb05vcm1hbD48Yj48c3BhbiBsYW5nPUVOLU5aIHN0
eWxlPSdmb250LWZhbWlseToiQ2FtYnJpYSIsInNlcmlmIjtjb2xvcjojMUY0RTc5Jz5JbmZvcm1h
dGlvbiBmaWVsZHM6PC9zcGFuPjwvYj48c3BhbiBsYW5nPUVOLU5aIHN0eWxlPSdmb250LWZhbWls
eToiQ2FtYnJpYSIsInNlcmlmIjtjb2xvcjojMUY0RTc5Jz4gTmFtZXMsIFRpdGxlLCBFbWFpbCwg
UGhvbmUsIENvbXBhbnkgTmFtZSwgQ29tcGFueSBVUkwsIENvbXBhbnkgcGh5c2ljYWwgYWRkcmVz
cywgU0lDIENvZGUsIEluZHVzdHJ5LCBDb21wYW55IFNpemUgKFJldmVudWUgYW5kIEVtcGxveWVl
KSwgTGlua2VkSW4gcHJvZmlsZSBsaW5rIGFuZCBraW5kIG9mIHRlY2hub2xvZ3kgdXNpbmcvc29s
dXRpb24gaW4gcGxhY2UuPG86cD48L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPU1zb05vcm1hbD48
c3BhbiBsYW5nPUVOLU5aIHN0eWxlPSdmb250LWZhbWlseToiQ2FtYnJpYSIsInNlcmlmIjtjb2xv
cjojMUY0RTc5Jz48bzpwPiZuYnNwOzwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9TXNvTm9ybWFs
PjxzcGFuIGxhbmc9RU4tTlogc3R5bGU9J2ZvbnQtZmFtaWx5OiJDYW1icmlhIiwic2VyaWYiO2Nv
bG9yOiMxRjRFNzknPkxldCBtZSBrbm93IHlvdXIgdGFyZ2V0IGdlb2dyYXBoeSBzbyB0aGF0IGkg
d2lsbCBnZXQgYmFjayB0byB5b3Ugd2l0aCB0aGUgY291bnRzIGFuZCBwcmljaW5nLjxvOnA+PC9v
OnA+PC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNwYW4gbGFuZz1FTi1OWiBzdHlsZT0n
Zm9udC1mYW1pbHk6IkNhbWJyaWEiLCJzZXJpZiI7Y29sb3I6IzFGNEU3OSc+PG86cD4mbmJzcDs8
L286cD48L3NwYW4+PC9wPjxwIGNsYXNzPU1zb05vcm1hbD48c3BhbiBsYW5nPUVOLU5aIHN0eWxl
PSdmb250LWZhbWlseToiQ2FtYnJpYSIsInNlcmlmIjtjb2xvcjojMUY0RTc5Jz5Bd2FpdCB5b3Vy
IHJlc3BvbnNlISA8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9TXNvTm9ybWFsPjxzcGFu
IGxhbmc9RU4tTlogc3R5bGU9J2ZvbnQtZmFtaWx5OiJDYW1icmlhIiwic2VyaWYiO2NvbG9yOiMx
RjRFNzknPjxvOnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvcD48cCBjbGFzcz1Nc29Ob3JtYWw+PHNw
YW4gbGFuZz1FTi1OWiBzdHlsZT0nZm9udC1mYW1pbHk6IkNhbWJyaWEiLCJzZXJpZiI7Y29sb3I6
IzFGNEU3OSc+UmVnYXJkcyw8bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9TXNvTm9ybWFs
PjxiPjxzcGFuIGxhbmc9RU4tTlogc3R5bGU9J2ZvbnQtZmFtaWx5OiJDYW1icmlhIiwic2VyaWYi
O2NvbG9yOiMxRjRFNzknPlBhdHJpY2lhIEFsbGVuPG86cD48L286cD48L3NwYW4+PC9iPjwvcD48
cCBjbGFzcz1Nc29Ob3JtYWw+PGI+PHNwYW4gbGFuZz1FTi1OWiBzdHlsZT0nZm9udC1mYW1pbHk6
IkNhbWJyaWEiLCJzZXJpZiI7Y29sb3I6IzFGNEU3OSc+TWFya2V0aW5nIEV4ZWN1dGl2ZTxvOnA+
PC9vOnA+PC9zcGFuPjwvYj48L3A+PHAgY2xhc3M9TXNvTm9ybWFsPjxiPjxzcGFuIGxhbmc9RU4t
Tlogc3R5bGU9J2ZvbnQtZmFtaWx5OiJDYW1icmlhIiwic2VyaWYiO2NvbG9yOiMxRjRFNzknPjxv
OnA+Jm5ic3A7PC9vOnA+PC9zcGFuPjwvYj48L3A+PHAgY2xhc3M9TXNvTm9ybWFsPjxzcGFuIGxh
bmc9RU4tTlogc3R5bGU9J2ZvbnQtc2l6ZTo4LjBwdDtjb2xvcjojREVFQUY2Jz5JZiB5b3UgZG8g
bm90IHdpc2ggdG8gcmVjZWl2ZSBmdXJ0aGVyIGVtYWlscywgcGxlYXNlIHJlc3BvbmQgd2l0aCBS
ZW1vdmUgbWUuPC9zcGFuPjxzcGFuIGxhbmc9RU4tTlogc3R5bGU9J2ZvbnQtc2l6ZTo4LjBwdDtj
b2xvcjojQkRENkVFJz48bzpwPjwvbzpwPjwvc3Bhbj48L3A+PHAgY2xhc3M9TXNvTm9ybWFsPjxv
OnA+Jm5ic3A7PC9vOnA+PC9wPjwvZGl2PjwvYm9keT48L2h0bWw+HwBCAAEAAAAeAAAAUABhAHQA
cgBpAGMAaQBhACAAQQBsAGwAZQBuAAAAAAAfAGUAAQAAADIAAABwAGEAdAByAGkAYwBpAGEALgBh
AGwAbABlAG4AQABhADIAegBkAGIALgBjAG8AbQAAAAAAHwBkAAEAAAAKAAAAUwBNAFQAUAAAAAAA
AgFBAAEAAAByAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAACAUABhAHQAcgBpAGMAaQBhACAAQQBs
AGwAZQBuAAAAUwBNAFQAUAAAAHAAYQB0AHIAaQBjAGkAYQAuAGEAbABsAGUAbgBAAGEAMgB6AGQA
YgAuAGMAbwBtAAAAAAAfAAJdAQAAADIAAABwAGEAdAByAGkAYwBpAGEALgBhAGwAbABlAG4AQABh
ADIAegBkAGIALgBjAG8AbQAAAAAAHwDlXwEAAAAEAAAAIAAAAB8AGgwBAAAAHgAAAFAAYQB0AHIA
aQBjAGkAYQAgAEEAbABsAGUAbgAAAAAAHwAfDAEAAAAyAAAAcABhAHQAcgBpAGMAaQBhAC4AYQBs
AGwAZQBuAEAAYQAyAHoAZABiAC4AYwBvAG0AAAAAAB8AHgwBAAAACgAAAFMATQBUAFAAAAAAAAIB
GQwBAAAAcgAAAAAAAACBKx+kvqMQGZ1uAN0BD1QCAAAAgFAAYQB0AHIAaQBjAGkAYQAgAEEAbABs
AGUAbgAAAFMATQBUAFAAAABwAGEAdAByAGkAYwBpAGEALgBhAGwAbABlAG4AQABhADIAegBkAGIA
LgBjAG8AbQAAAAAAHwABXQEAAAAyAAAAcABhAHQAcgBpAGMAaQBhAC4AYQBsAGwAZQBuAEAAYQAy
AHoAZABiAC4AYwBvAG0AAAAAAB8AK0ABAAAAHgAAAFAAYQB0AHIAaQBjAGkAYQAgAEEAbABsAGUA
bgAAAAAAHwAqQAEAAAAyAAAAcABhAHQAcgBpAGMAaQBhAC4AYQBsAGwAZQBuAEAAYQAyAHoAZABi
AC4AYwBvAG0AAAAAAB8AKUABAAAACgAAAFMATQBUAFAAAAAAAAIBRgABAAAAcgAAAAAAAACBKx+k
vqMQGZ1uAN0BD1QCAAAAgFAAYQB0AHIAaQBjAGkAYQAgAEEAbABsAGUAbgAAAFMATQBUAFAAAABw
AGEAdAByAGkAYwBpAGEALgBhAGwAbABlAG4AQABhADIAegBkAGIALgBjAG8AbQAAAAAAHwAFXQEA
AAAyAAAAcABhAHQAcgBpAGMAaQBhAC4AYQBsAGwAZQBuAEAAYQAyAHoAZABiAC4AYwBvAG0AAAAA
AAsAQDoBAAAAHwAaAAEAAAASAAAASQBQAE0ALgBOAG8AdABlAAAAAAADAPE/CQQAAAsAQDoBAAAA
AwD9P+QEAAACAQswAQAAABAAAADLuQ/B52mMSJdwN0R+khPeAwAXAAEAAABAADkAADPMr0H21QFA
AAgwqm02sEH21QELACkAAQAAAB8A2T8BAAAAAAIAAEgAZQBsAGwAbwAsAA0ACgANAAoASQAgAHcA
bwB1AGwAZAAgAGwAaQBrAGUAIAB0AG8AIABrAG4AbwB3ACAAaQBmACAAeQBvAHUAIABhAHIAZQAg
AGkAbgB0AGUAcgBlAHMAdABlAGQAIABpAG4AIABhAGMAcQB1AGkAcgBpAG4AZwAgAE0ARwBFACAA
VQBQAFMAIABTAHkAcwB0AGUAbQBzACAAVQBzAGUAcgBzACAAQwBvAG4AdABhAGMAdAAgAEwAaQBz
AHQALgANAAoADQAKAEkAbgBmAG8AcgBtAGEAdABpAG8AbgAgAGYAaQBlAGwAZABzADoAIABOAGEA
bQBlAHMALAAgAFQAaQB0AGwAZQAsACAARQBtAGEAaQBsACwAIABQAGgAbwBuAGUALAAgAEMAbwBt
AHAAYQBuAHkAIABOAGEAbQBlACwAIABDAG8AbQBwAGEAbgB5ACAAVQBSAEwALAAgAEMAbwBtAHAA
YQBuAHkAIABwAGgAeQBzAGkAYwBhAGwAIABhAGQAZAByAGUAcwBzACwAIABTAEkAQwAgAEMAbwBk
AGUALAAgAEkAbgBkAHUAcwB0AHIAeQAsACAAQwBvAG0AcABhAG4AeQAgAFMAaQB6AGUAIAAoAFIA
ZQB2AGUAbgB1AGUAIABhAG4AZAAgAEUAbQBwAAAACwAAgAggBgAAAAAAwAAAAAAAAEYAAAAAFIUA
AAAAAAALACMAAQAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAB4AAABhAGMAYwBlAHAAdABsAGEA
bgBnAHUAYQBnAGUAAAAAAAEAAAAaAAAAZQBuAC0AVgBJACwAIABlAG4ALQBVAFMAAAAAAAIBMQAB
AAAAZAAAAFBDREZFQjA5AAEAAgAAAAAAAAAAAAAAAAAuAAAAAAAAAAHABjdiZYlAkvv8+nadw+4B
AAjobdsyFyRGu5t147a4VmYAAAAAAQkAABAAAADLuQ/B52mMSJdwN0R+khPeAQAAAAADAACACCAG
AAAAAADAAAAAAAAARgEAAAAyAAAARQB4AGMAaABhAG4AZwBlAEEAcABwAGwAaQBjAGEAdABpAG8A
bgBGAGwAYQBnAHMAAAAAACAAAABIAACACCAGAAAAAADAAAAAAAAARgEAAAAiAAAATgBlAHQAdwBv
AHIAawBNAGUAcwBzAGEAZwBlAEkAZAAAAAAA0jmjosa8/0D/jgjXxFjSwx8AAIATj/JB9IMUQaWE
7ttaawv/AQAAABYAAABDAGwAaQBlAG4AdABJAG4AZgBvAAAAAAABAAAAKgAAAEMAbABpAGUAbgB0
AD0ATQBTAEUAeABjAGgAYQBuAGcAZQBSAFAAQwAAAAAAHwD6PwEAAAAeAAAAUABhAHQAcgBpAGMA
aQBhACAAQQBsAGwAZQBuAAAAAAALAACACCAGAAAAAADAAAAAAAAARgAAAAAGhQAAAAAAAB8ANwAB
AAAARgAAAE0ARwBFACAAVQBQAFMAIABTAHkAcwB0AGUAbQBzACAAVQBzAGUAcgBzACAAQwBvAG4A
dABhAGMAdAAgAEwAaQBzAHQAAAAAAB8APQABAAAAAgAAAAAAAAADADYAAAAAAAIBcQABAAAAFgAA
AAHV9kESgfJouCLmtk3DoqXfuEsnMeUAAB8AcAABAAAARgAAAE0ARwBFACAAVQBQAFMAIABTAHkA
cwB0AGUAbQBzACAAVQBzAGUAcgBzACAAQwBvAG4AdABhAGMAdAAgAEwAaQBzAHQAAAAAAB8ANRAB
AAAAogAAADwAQgBNAFgAUABSADAAMQBNAEIAMwA4ADkANgA4ADMAQQA2ADEAOQA0ADkAMQAwAEQA
NgA5AEYANQA2ADUANQA1AEMAQwBCAEYARQAwAEAAQgBNAFgAUABSADAAMQBNAEIAMwA4ADkANgAu
AEkATgBEAFAAUgBEADAAMQAuAFAAUgBPAEQALgBPAFUAVABMAE8ATwBLAC4AQwBPAE0APgAAAAAA
AwDeP59OAAALAACACCAGAAAAAADAAAAAAAAARgAAAAADhQAAAAAAAAMAAIAIIAYAAAAAAMAAAAAA
AABGAAAAAAGFAAAAAAAAAwCAEP////8DABMSAAAAAAIBAIATj/JB9IMUQaWE7ttaawv/AQAAAC4A
AABIAGUAYQBkAGUAcgBCAG8AZAB5AEYAcgBhAGcAbQBlAG4AdABMAGkAcwB0AAAAAAABAAAAIgAA
AAEACgAAAAQAAAAAAAAAFAAAAAAAAAAAAAAA/////wAAAAAAAAsAAIATj/JB9IMUQaWE7ttaawv/
AQAAABwAAABIAGEAcwBRAHUAbwB0AGUAZABUAGUAeAB0AAAAAAAAAAsAAIATj/JB9IMUQaWE7tta
awv/AQAAACgAAABJAHMAUQB1AG8AdABlAGQAVABlAHgAdABDAGgAYQBuAGcAZQBkAAAAAAAAAEAA
BzBHbi2wQfbVAQsAAgABAAAAAwAmAAAAAAALAAYMAQAAAAIBEDABAAAARgAAAAAAAAABwAY3YmWJ
QJL7/Pp2ncPuBwAI6G3bMhckRrubdeO2uFZmAAAAAAELAAAI6G3bMhckRrubdeO2uFZmAABEoOSz
AAAAAAIBEzABAAAAEAAAAPJouCLmtk3DoqXfuEsnMeUCARQwAQAAAAwAAABaAAAACkyVSBI+WcoD
AFo2AAAAAAMAaDYNAAAAHwD4PwEAAAAeAAAAUABhAHQAcgBpAGMAaQBhACAAQQBsAGwAZQBuAAAA
AAAfACJAAQAAAAYAAABFAFgAAAAAAB8AI0ABAAAAAgEAAC8ATwA9AEUAWABDAEgAQQBOAEcARQBM
AEEAQgBTAC8ATwBVAD0ARQBYAEMASABBAE4ARwBFACAAQQBEAE0ASQBOAEkAUwBUAFIAQQBUAEkA
VgBFACAARwBSAE8AVQBQACAAKABGAFkARABJAEIATwBIAEYAMgAzAFMAUABEAEwAVAApAC8AQwBO
AD0AUgBFAEMASQBQAEkARQBOAFQAUwAvAEMATgA9AEQANwAyADUAMQAwADIANgA5AEMANgA0ADQA
NgAzADQAOQBFAEUANwA5AEUAMQA4ADYAMQA2AEMANgA0AEMAMgAtAFAAQQBUAFIASQBDAEkAQQAu
AEEATAAAAAAAHwAkQAEAAAAGAAAARQBYAAAAAAAfACVAAQAAAAIBAAAvAE8APQBFAFgAQwBIAEEA
TgBHAEUATABBAEIAUwAvAE8AVQA9AEUAWABDAEgAQQBOAEcARQAgAEEARABNAEkATgBJAFMAVABS
AEEAVABJAFYARQAgAEcAUgBPAFUAUAAgACgARgBZAEQASQBCAE8ASABGADIAMwBTAFAARABMAFQA
KQAvAEMATgA9AFIARQBDAEkAUABJAEUATgBUAFMALwBDAE4APQBEADcAMgA1ADEAMAAyADYAOQBD
ADYANAA0ADYAMwA0ADkARQBFADcAOQBFADEAOAA2ADEANgBDADYANABDADIALQBQAEEAVABSAEkA
QwBJAEEALgBBAEwAAAAAAB8AMEABAAAAHgAAAFAAYQB0AHIAaQBjAGkAYQAgAEEAbABsAGUAbgAA
AAAAHwAxQAEAAAAeAAAAUABhAHQAcgBpAGMAaQBhACAAQQBsAGwAZQBuAAAAAAAfADhAAQAAAB4A
AABQAGEAdAByAGkAYwBpAGEAIABBAGwAbABlAG4AAAAAAB8AOUABAAAAHgAAAFAAYQB0AHIAaQBj
AGkAYQAgAEEAbABsAGUAbgAAAAAAAwBZQAAAAAADAFpAAAAAAAMAAlkAABYAAwAJWQIAAAAfAApd
AQAAADIAAABwAGEAdAByAGkAYwBpAGEALgBhAGwAbABlAG4AQABhADIAegBkAGIALgBjAG8AbQAA
AAAAHwALXQEAAAAyAAAAcABhAHQAcgBpAGMAaQBhAC4AYQBsAGwAZQBuAEAAYQAyAHoAZABiAC4A
YwBvAG0AAAAAAAMAAIBQ42MLzJzQEbzbAIBfzM4EAQAAACQAAABJAG4AZABlAHgAaQBuAGcARQBy
AHIAbwByAEMAbwBkAGUAAAAbAAAAHwAAgFDjYwvMnNARvNsAgF/MzgQBAAAAKgAAAEkAbgBkAGUA
eABpAG4AZwBFAHIAcgBvAHIATQBlAHMAcwBhAGcAZQAAAAAAAQAAAHAAAABJAG4AZABlAHgAaQBu
AGcAIABQAGUAbgBkAGkAbgBnACAAdwBoAGkAbABlACAAQgBpAGcARgB1AG4AbgBlAGwAUABPAEkA
SQBzAFUAcABUAG8ARABhAHQAZQAgAGkAcwAgAGYAYQBsAHMAZQAuAAAACwAAgFDjYwvMnNARvNsA
gF/MzgQBAAAAJgAAAEkAcwBQAGUAcgBtAGEAbgBlAG4AdABGAGEAaQBsAHUAcgBlAAAAAAAAAAAA
HwAAgB+k6zOoei5Cvnt54amOVLMBAAAAOAAAAEMAbwBuAHYAZQByAHMAYQB0AGkAbwBuAEkAbgBk
AGUAeABUAHIAYQBjAGsAaQBuAGcARQB4AAAAAQAAAC4BAABJAEkAPQBbAEMASQBEAD0AMgAyAGIA
OAA2ADgAZgAyAC0AYgA2AGUANgAtAGMAMwA0AGQALQBhADIAYQA1AC0AZABmAGIAOAA0AGIAMgA3
ADMAMQBlADUAOwBJAEQAWABIAEUAQQBEAD0ARAA1AEYANgA0ADEAMQAyADgAMQA7AEkARABYAEMA
TwBVAE4AVAA9ADEAXQA7AFQARgBSAD0ATgBvAHQARgBvAHIAawBpAG4AZwA7AFYAZQByAHMAaQBv
AG4APQBWAGUAcgBzAGkAbwBuACAAMQA1AC4AMgAwACAAKABCAHUAaQBsAGQAIAAyADcAOQAzAC4A
MAApACwAIABTAHQAYQBnAGUAPQBIADQAOwBVAFAAPQAxADAAOwBEAFAAPQAxAEMANQAAAAAAAwAA
gAggBgAAAAAAwAAAAAAAAEYAAAAAEIUAAAAAAAALAACACCAGAAAAAADAAAAAAAAARgAAAAAOhQAA
AAAAAAMAAIAIIAYAAAAAAMAAAAAAAABGAAAAABiFAAAAAAAACwAAgAggBgAAAAAAwAAAAAAAAEYA
AAAAgoUAAAAAAAADAA00/T8AAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAC4AAABhAHUAdABoAGUA
bgB0AGkAYwBhAHQAaQBvAG4ALQByAGUAcwB1AGwAdABzAAAAAAABAAAAhAAAAHMAcABmAD0AbgBv
AG4AZQAgACgAcwBlAG4AZABlAHIAIABJAFAAIABpAHMAIAApACAAcwBtAHQAcAAuAG0AYQBpAGwA
ZgByAG8AbQA9AHAAYQB0AHIAaQBjAGkAYQAuAGEAbABsAGUAbgBAAGEAMgB6AGQAYgAuAGMAbwBt
ADsAIAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAACAAAAB4AC0AbQBzAC0AaABhAHMALQBhAHQA
dABhAGMAaAAAAAEAAAACAAAAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAACIAAAB4AC0AbwBy
AGkAZwBpAG4AYQB0AGkAbgBnAC0AaQBwAAAAAAABAAAAIgAAAFsANAA5AC4AMgAwADYALgAyADIA
OAAuADIAMwAwAF0AAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAC4AAAB4AC0AbQBzAC0AcAB1
AGIAbABpAGMAdAByAGEAZgBmAGkAYwB0AHkAcABlAAAAAAABAAAADAAAAEUAbQBhAGkAbAAAAB8A
AICGAwIAAAAAAMAAAAAAAABGAQAAAFAAAAB4AC0AbQBzAC0AbwBmAGYAaQBjAGUAMwA2ADUALQBm
AGkAbAB0AGUAcgBpAG4AZwAtAGMAbwByAHIAZQBsAGEAdABpAG8AbgAtAGkAZAAAAAEAAABKAAAA
YQAyAGEAMwAzADkAZAAyAC0AYgBjAGMANgAtADQAMABmAGYALQBmAGYAOABlAC0AMAA4AGQANwBj
ADQANQA4AGQAMgBjADMAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAADYAAAB4AC0AbQBzAC0A
dAByAGEAZgBmAGkAYwB0AHkAcABlAGQAaQBhAGcAbgBvAHMAdABpAGMAAAAAAAEAAAAeAAAAQgBN
AFgAUABSADAAMQBNAEIAMgAxADUAMAA6AAAAAAAfAACAhgMCAAAAAADAAAAAAAAARgEAAAA0AAAA
eAAtAG0AaQBjAHIAbwBzAG8AZgB0AC0AYQBuAHQAaQBzAHAAYQBtAC0AcAByAHYAcwAAAAEAAACi
AAAAPABCAE0AWABQAFIAMAAxAE0AQgAyADEANQAwADgAMgA1AEUANQBFADkAMwBFAEEAOQBEADMA
RAA1AEIARABBAEYAMQBDAEIARgBFADAAQABCAE0AWABQAFIAMAAxAE0AQgAyADEANQAwAC4ASQBO
AEQAUABSAEQAMAAxAC4AUABSAE8ARAAuAE8AVQBUAEwATwBPAEsALgBDAE8ATQA+AAAAAAAfAACA
hgMCAAAAAADAAAAAAAAARgEAAAA4AAAAeAAtAG0AcwAtAG8AbwBiAC0AdABsAGMALQBvAG8AYgBj
AGwAYQBzAHMAaQBmAGkAZQByAHMAAAABAAAAFAAAAE8ATABNADoANAA3ADEANAA7AAAAHwAAgIYD
AgAAAAAAwAAAAAAAAEYBAAAAIgAAAHgALQBmAG8AcgBlAGYAcgBvAG4AdAAtAHAAcgB2AHMAAAAA
AAEAAAAWAAAAMAAzADMANwBBAEYARgBFADkAQQAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAA
OAAAAHgALQBmAG8AcgBlAGYAcgBvAG4AdAAtAGEAbgB0AGkAcwBwAGEAbQAtAHIAZQBwAG8AcgB0
AAAAAQAAACoEAABTAEYAVgA6AE4AUwBQAE0AOwBTAEYAUwA6ACgAMQAwADAAMQA5ADAAMgAwACkA
KAAzADYANgAwADAANAApACgAMQAzADYAMAAwADMAKQAoADMAOQA2ADAAMAAzACkAKAAzADkAOAA1
ADAANAAwADAAMAAwADQAKQAoADMANAA2ADAAMAAyACkAKAAzADcANgAwADAAMgApACgAMQA5ADkA
MAAwADQAKQAoADEAOAA5ADAAMAAzACkAKAA3ADEAMgAwADAANAAwADAAMAAwADEAKQAoADQANwA0
ADQAMAAwADUAKQAoADQANAA4ADMAMgAwADEAMQApACgAMwAzADYANQA2ADAAMAAyACkAKAAyADkA
MAA2ADAAMAAyACkAKAA4ADYAMwA2ADIAMAAwADEAKQAoADMAMQA2ADAAMAAyACkAKAA5ADMAMgA2
ADAAMAAyACkAKAA4ADYANwA2ADAAMAAyACkAKAA4ADkAMwA2ADAAMAAyACkAKAA4ADEAMQA2ADYA
MAAwADYAKQAoADgAMQAxADUANgAwADEANAApACgAMgA2ADAAMAA1ACkAKAAxADgANgAwADAAMwAp
ACgANgA2ADQANwA2ADAAMAA3ACkAKAA2ADYANQA1ADYAMAAwADgAKQAoADYANgA0ADQANgAwADAA
OAApACgANgA0ADcANQA2ADAAMAA4ACkAKAA1ADIANQAzADYAMAAxADQAKQAoADYANgA5ADQANgAw
ADAANwApACgANAA1ADAAOAAwADQAMAAwADAAMAAyACkAKAA1ADYANgAwADMAMAAwADAAMAAyACkA
KAA1ADUAMgAzADYAMAAwADQAKQAoADcANgAxADEANgAwADAANgApACgANAA3ADgANgAwADAAMAAw
ADEAKQAoADUANQAwADEANgAwADAAMgApACgAOQA2ADgANgAwADAAMwApACgANwA2ADkANgAwADAA
NQApACgANgA1ADAANgAwADAANwApACgANgA5ADEANgAwADAAOQApACgAMgA2ADcAMQAwADIAMAAw
ADAAMAA0ACkAOwBEAEkAUgA6AE8AVQBUADsAUwBGAFAAOgAxADEAMAAyADsAUwBDAEwAOgAxADsA
UwBSAFYAUgA6AEIATQBYAFAAUgAwADEATQBCADIAMQA1ADAAOwBIADoAQgBNAFgAUABSADAAMQBN
AEIAMwA4ADkANgAuAEkATgBEAFAAUgBEADAAMQAuAFAAUgBPAEQALgBPAFUAVABMAE8ATwBLAC4A
QwBPAE0AOwBGAFAAUgA6ADsAUwBQAEYAOgBOAG8AbgBlADsATABBAE4ARwA6AGUAbgA7AFAAVABS
ADoASQBuAGYAbwBOAG8AUgBlAGMAbwByAGQAcwA7AEEAOgAwADsATQBYADoAMQA7AAAAAAAfAACA
hgMCAAAAAADAAAAAAAAARgEAAAAaAAAAcgBlAGMAZQBpAHYAZQBkAC0AcwBwAGYAAAAAAAEAAACm
AAAATgBvAG4AZQAgACgAcAByAG8AdABlAGMAdABpAG8AbgAuAG8AdQB0AGwAbwBvAGsALgBjAG8A
bQA6ACAAYQAyAHoAZABiAC4AYwBvAG0AIABkAG8AZQBzACAAbgBvAHQAIABkAGUAcwBpAGcAbgBh
AHQAZQAgAHAAZQByAG0AaQB0AHQAZQBkACAAcwBlAG4AZABlAHIAIABoAG8AcwB0AHMAKQAAAAAA
HwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAOAAAAHgALQBtAHMALQBlAHgAYwBoAGEAbgBnAGUALQBz
AGUAbgBkAGUAcgBhAGQAYwBoAGUAYwBrAAAAAQAAAAQAAAAxAAAAHwAAgIYDAgAAAAAAwAAAAAAA
AEYBAAAAKgAAAHgALQBtAGkAYwByAG8AcwBvAGYAdAAtAGEAbgB0AGkAcwBwAGEAbQAAAAAAAQAA
AA4AAABCAEMATAA6ADAAOwAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAARAAAAHgALQBtAGkA
YwByAG8AcwBvAGYAdAAtAGEAbgB0AGkAcwBwAGEAbQAtAG0AZQBzAHMAYQBnAGUALQBpAG4AZgBv
AAAAAQAAAAIEAAB0AE4AZgBTAHIAYQBhADAAWQAyAFYATAA5AFMAeAA3AHEAcQBVAFIAMQBIADAA
egBMAFEALwBxAFoAQwBiAHcAYwBiAHAAcwBUAE0AZwBrAFoAdABZAFkAQwBVAHgAOAAwAG4AeQBv
AHoATgA5AEIAVwBSAGwAUQByAGgAVABBAHYAQwBlAEMAZgAwACsAOQBzAFIANABvAFgAbQBUAHAA
ZQBsADcAOQA1ADgAWQBUADAAQQBSAFQAbgBEAGgARgBkAHkAdABvAEUANABSAGMASQBtAEkAMQBr
AHIAdwBDADEAcgBhAEYAawBKAFkASAA2AGsAZwA1AGIASgBBAEYAdwBDAEsAdgA3AFUAMQBiAFoA
cQBiADcAcgBLAGkAdABZAHkAKwBsADQAawBzAE0AWAA4AHIAYgBEAE4ARQBnAEkANABsAEMAVwB6
AGMAUgBKAEQAbQBuADgARABuADUAdQBlAHUAdgAwAE8AUAB1AFUARABzAFkAVQBHAEgAYQByAGgA
QwBUAHMAWgBNAE0AQwA1AGsAOABiADcAUwBOAGUAcgBQAFgAbgB4ADMAOABoAHkAOABXADgAdQA5
AG0ASAA4AGMAbgB5AFcAcQB5AEYAKwBZAFcAeAB0AGgAdAAvAGEAMQA2AEcAdgBCAGoAdQBCAFMA
SgBzAGkAbgBHAFAAQQBLAEYAMgBnAGwAWgBjAHAAMQBqAHMAcwBmADAALwBpAGwAYgBEAEUAdgBZ
AC8AZwBPAEsAYQBFAHAAZwBWADkAcQA4AHkAWQBVADIAMgBBAEwAdABvADMAZQBSADcAMgA2AEoA
cABmAGsAZgAyAHcAcgBBAEgAZAAxAEUAVwBMAHkAbQBIAHkAVQAwAGgATwBKAHkAcABqAC8AZABv
AEIAMwBuAGQAUQBDAFUALwBkAFAAQQB2AGMATwBFADgAWgA5AEoAOQBUAFMAOABxAFAANQBEAFMA
awBQADkASQArAEgAZABGADYAcwBPADgAQwBTAGYAMQBDAGIALwBpAC8AbwBBAE4AQwA1AFEAKwBT
AEgAawBGAHUASAB1AE8AMQBPAFgAWgBvADEAVwBLAG4AUABKAHMAbgBjAGUAQQAvAC8AUwBqAFkA
agBwAEQASABrAEoANQBQAFcAcAAzAGkAOQBIAGwAKwBCAHUASgBGAFgAbQB3AEQAdABqADYAaQB1
AGwAYQAyADMAZwBVAHUAeQBSADcAcABKADgAUQA5AFEAYgBqAEUATgBTAC8AQQBCAC8AdwBxAGgA
UwB2AFUAaQBWAFoAYwBrAFkAcgBCAG4ASgBqAGgATwB3AGEAZABpAE8AdAB6AFQAZQBzAFYARwBX
AGMAQwBQADYAAAAAAB8AAICGAwIAAAAAAMAAAAAAAABGAQAAAEYAAAB4AC0AbQBzAC0AZQB4AGMA
aABhAG4AZwBlAC0AYQBuAHQAaQBzAHAAYQBtAC0AbQBlAHMAcwBhAGcAZQBkAGEAdABhAAAAAAAB
AAAAMgEAAHgAaABPAFcAZgAzADAANQBOADkAMgBkAHUAUwBZAFYAdgBZAGsAcQBNAFYAMAB5AC8A
YwBMAGsARQBnADIAUgBxAEkAUABtADcAeABMAGsAQQA2AFoAMQBYAHMASQBTAGIAWABHAFgAZAB0
ADgAKwBXAHoAYwBkAEkAMQBpAHkAZgB5ADEANwBwAGYAVABIADAAZwB1ADkARgBaAEgANAAwACsA
cgBZAGsAawA0AGYAcABTADUAcwAwAFoAWABEAHcAQgA0AFoAQgBsADgAagB6AHQAUwBlAFoASQBS
ADYAUQBMADMAbABRAHMAeABHADkANQBtAEUAaABpAFkAegBsAFMAVQBLAFUAMgB6AFAARgB0AFAA
OQBpAHoARQBGAG8ATwBOACsAYQBBAD0APQAAAAAAHwAAgIYDAgAAAAAAwAAAAAAAAEYBAAAAPgAA
AHgALQBtAHMALQBlAHgAYwBoAGEAbgBnAGUALQB0AHIAYQBuAHMAcABvAHIAdAAtAGYAbwByAGsA
ZQBkAAAAAAABAAAACgAAAFQAcgB1AGUAAAAAAL23

--_000_BMXPR01MB389683A6194910D69F56555CCBFE0BMXPR01MB3896INDP_--
