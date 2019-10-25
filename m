Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37507E4120
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 03:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389181AbfJYBl1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Oct 2019 21:41:27 -0400
Received: from mail-eopbgr1300041.outbound.protection.outlook.com ([40.107.130.41]:2414
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2389164AbfJYBl1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Oct 2019 21:41:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLm8Vax9aJ6kuQy4Fov3iwx5MaziHDMme3dMihy2sLPpuq02fsze69DcUIun7prKgq5kZfBtGBj574jI+jXcQ7g8bGKsiPJrFCk/wzaj/gzxpKKCRA6oRJ7umftWWUYvTrNk89Eo25Jf+rUu61raH29Gc1mlL5QlfHkn74faBkPbnWi9vLxtpVjr5Ju6W0Ig7rpe3GcuGC98rucanXtk3QfUf0fS2ROPW3XMgUAFtRihMsmmeGgcsQDRShRV44wD5IAflHn4ldzDD7BffYmChkP6DfXYfK4TVWX775f9JOUz+iPQtH/u8YXN9dXXlU4yYkT1ioBp85+g4J848qcS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ekeqnocrcbc5M3c/bGfJ2Yxvcw81NBvyAUFlf3Je/g=;
 b=kyqmjnYU68lYhgkF02DoiYbtAvsHv9hOGY9H8Yr9V/pV57wAr0rkIw0dXGhF4ZFfbrx9PSQNSeSXNFPrs01cB8TQc+QXadPbV89SS3drfhb9n+VbsYjytzsp0lmIb/ON8R00nVty3GCEK+PKF7OgjW8/CpmODV7bx80Br3cNlpx4BmOflEHvupoFHPBreUp31qxap8NNKgEQlep0Jpd3OjsjQcYRw5NIECJmz8EjEke7ktr0oQcXw4OGav+gRxQC9/u/fJCMXiNxj8ONtL66tWpnUSNvHYh0obGN7k1Y10qrEVLFqflMkYLllkdrH/4rX/uFpCQCzOVWqchYnzHyfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ekeqnocrcbc5M3c/bGfJ2Yxvcw81NBvyAUFlf3Je/g=;
 b=LdGLYevCjSrvedlTFi3kSahSQLODf4COTyleAF04yBaMmZXUcaMNPBVu0jU+PmWIQfRey3pF0zuJErUD+lSUdPY6OlgDHVQdewLnXxFsXmaLrIieVhWudQgGZZihqhZWeIdSrDVcRay/a04sUkXbfI2rGc6d0xey3sY1bD5FOD4=
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com (10.170.143.19) by
 SG2PR01MB2966.apcprd01.prod.exchangelabs.com (20.177.92.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2367.24; Fri, 25 Oct 2019 01:41:22 +0000
Received: from SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::48a5:3998:fd15:92e8]) by SG2PR01MB2141.apcprd01.prod.exchangelabs.com
 ([fe80::48a5:3998:fd15:92e8%6]) with mapi id 15.20.2367.027; Fri, 25 Oct 2019
 01:41:22 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Replacement of Supercomputer @ Home in Singapore Due to Motherboard
 Malfunction
Thread-Topic: Replacement of Supercomputer @ Home in Singapore Due to
 Motherboard Malfunction
Thread-Index: AdWK1UlCwXg976n8Rm+GtB7N4DLyqA==
Date:   Fri, 25 Oct 2019 01:41:22 +0000
Message-ID: <SG2PR01MB21419FBF7FD52510A6BDA50387650@SG2PR01MB2141.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [2401:7400:c802:1ef3:d923:25a:c4b4:68f8]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19631148-04dc-4896-65b3-08d758ec70a2
x-ms-traffictypediagnostic: SG2PR01MB2966:
x-ms-exchange-purlcount: 4
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SG2PR01MB2966909979CEFBDA953F887087650@SG2PR01MB2966.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39830400003)(346002)(366004)(136003)(376002)(189003)(199004)(81156014)(71200400001)(486006)(71190400001)(316002)(14444005)(256004)(102836004)(7736002)(74316002)(4326008)(6916009)(6436002)(14454004)(305945005)(107886003)(76116006)(186003)(66556008)(508600001)(66476007)(46003)(8936002)(6506007)(6306002)(99286004)(966005)(52536014)(86362001)(7696005)(66446008)(33656002)(8676002)(9686003)(25786009)(81166006)(66946007)(476003)(5660300002)(2906002)(6116002)(55016002)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:SG2PR01MB2966;H:SG2PR01MB2141.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c0zULFZpDqG5YWjh4xe+NECAXRSGH7zqbI/5z7ANO2OPipz5QHVQ4M5JHXp+WzDvbDtDorJ/BXx/fZt5csAFq05WfDtc7RCOgoe/tE895EsgmVHTtYO7ePQiM34lfs3GaeF/ZlQrSICaGs0ZRb3aqDVGSa0lqM9mFGLPHxS3UpDWpTN+joFBh7XIqYm6rPGFNpoczJJbUlP3aq9yORiaK3Sj/JIcKGlTqyCeWjpfBiigSQh1ihd5ahJ3aHuEvuigGdkhN7oSWa0Q3zhHCUwbXlou/O/GQ0wink3nB9mBVqJ96+q2w0wTum8KeUTpAWHMRTNXUYdvF3cZ4LzEpcY/EoLgI3YwX2EbeWkcxFRdReSp79gX7kh5bLFFyFrkymvCV+H0iYv4r4dCs5gVgpZncuarB7BlBZdVVoCuiNP7AjNMj2AK/LdW4o8DvELI2MQQCvwQbS4XKpCYDk/uJvbkH0nuJIN2yDy/MM5K0vnss2w=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19631148-04dc-4896-65b3-08d758ec70a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 01:41:22.0612
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c+HGH3Mg16POlLMMHY/tsgC2hUTfVB2Gi5JYNj3eJmNBlKBdBuO8pFUQChRwAh25sN5COON/L38wM+z9oeygqM9hacA2XmirmbuOBFgWEQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR01MB2966
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Subject: Replacement of Supercomputer @ Home in Singapore Due to Motherboar=
d Malfunction

Good day from Singapore,

Section A: Old Supercomputer Bought on 30 August 2015
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D

I had bought the following computer components on 30 August 2015 (confirmed=
 date), which is slightly more than 4 years ago.

[1] 5th Generation Intel Core i7-5820K 3.3 GHz 15 MB LGA2011(V3) (140W) SGD=
$530

[2] MSI X99A SLI Krait Edition USB3.1 LGA2011-3 DDR4 MAINBOARD SGD$439

[3] Kingston PC4-2133 8 GB DDR4 DIMM (KVR21N15D8/8) SGD$90

[4] ANDYSON AG-SERIES 650W 80PLUS SILVER (5YRS) SGD$95

[5] Coolermaster Hyper 103 CPU Cooler SGD$68

Grand Total: SGD$1,222.00 (on 30 Aug 2015)

Section B: Malfunction of MSI X99A SLI Krait Edition Motherboard on 23 Oct =
2019 Wed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

Symptoms:

When power is supplied, there are LED lights on the motherboard. However, t=
he power supply unit fan, casing fan, CPU fan, and GPU fan keeps spinning u=
p and down repeatedly forever. The RESET LED on the motherboard also turns =
on and off repeatedly forever.

Troubleshooting Steps:

1. Removed all existing DDR4 memory sticks on the motherboard. Insert brand=
 new G.SKILL DDR4 memory stick. Symptoms persist.

2. Use another known working power supply unit. Symptoms persist.

Conclusion:=20

The MSI X99A SLI Krait Edition motherboard, which has been in service with =
me for slightly more than 4 years, is now dead.

Credits: Troubleshooting is performed by a computer shop in 4th story of Si=
m Lim Square in Singapore, because I don't have the necessary spare parts t=
o troubleshoot. Troubleshooting fee is SGD$30. Plus Grab fare from my home =
to Sim Lim Square is SGD$20.

Section C: Buying Brand New AMD Ryzen 3 3200G processor, Gigabyte B450M DS3=
H SOC motherboard and Transcend 2666 MHz 8 GB DDR4 DIMM on 23 Oct 2019 Wed
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

On 23 Oct 2019 Wednesday, I bought the following *replacement* computer com=
ponents.

[1] Gigabyte B450M DS3H SOC AM4 ATX DDR4 MAINBOARD SGD$113

[2] AMD Ryzen 3 3200G 3.6 GHZ AMD (VEGA 8 GRAPHICS) SGD$138

[3] Transcend 2666 MHZ 8 GB DDR4 DIMM JM2666HLB-8G SGD$58 (bought on 24 Oct=
 2019)

Notes: My previous 1X Kingston DDR4-2133, 2X Crucial DDR4-2133 and 1X Cruci=
al DDR4-2400 memory sticks are not compatible with the new motherboard, acc=
ording to the computer shop. I am reusing the MSI GeForce GTX1650 4 GB GDD5=
 GPU video card and other peripherals in my computer casing.

Grand Total: SGD$309 (on 24 Oct 2019)

Conclusion: Windows 10 Home Edition 64-bit version 1903 is working beautifu=
lly without needing to reinstall the operating system after a complete over=
haul of supercomputer hardware.

Remarks:=20

For the past 13 years after graduation from National University of Singapor=
e (NUS) with a Bachelor's degree (Second Class Lower Honours) in mechanical=
 engineering, I have NEVER had a stable and permanent job because I am a TA=
RGETED INDIVIDUAL (TI). A Targeted Individual is a person who is persecuted=
, targeted, and marked by the [Singapore] Government. Covertly and subtlely=
, the Singapore Government does not allow me to have a stable and permanent=
 job earning high PMET salaries like $8000 or $9000 a month. For the past 1=
3 years after graduation from NUS, I was *frequently* fired/terminated from=
 employment or forced to resign. I am always *struggling* to find part time=
/temporary jobs earning $7-$8 per hour. As a result, I do not have much per=
sonal savings. When another Singaporean flaunted he has $354,000 in his ban=
k account, I only have less than $1000 in my bank account. I can also recal=
l that The Straits Times reported that a Singaporean housewife was cheated =
of some $700,000 some time ago. When my home supercomputer failed, I can on=
ly buy the cheapest AMD Ryzen 3 processor and the cheapest AMD Socket AM4 m=
otherboard. Singaporean Mr. Turritopsis Dohrnii Teo En Ming is the poorest =
university graduate in the world! I SIMPLY LOVE TO FLAUNT MY POVERTY!

POSTED WORLD WIDE.


-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link:=A0https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microw=
ave.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019 and refugee seeking attempts at the
United Nations Refugee Agency Bangkok (21 Mar 2017) and in Taiwan (5
Aug 2019):

[1]=A0https://tdtemcerts.wordpress.com/

[2]=A0https://tdtemcerts.blogspot.sg/

[3]=A0https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

