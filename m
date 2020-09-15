Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02721269EFC
	for <lists+linux-media@lfdr.de>; Tue, 15 Sep 2020 08:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbgIOG6b (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Sep 2020 02:58:31 -0400
Received: from mail-eopbgr60077.outbound.protection.outlook.com ([40.107.6.77]:36743
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726031AbgIOG62 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Sep 2020 02:58:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJCkhUVgk6fPLDIUEkGohbs1M2BR9W64bWA5mtZZaCUojbGjO40Q7JoG1k/UjwL7iI0gKeQg6qlIbwPuEynR3Oa4WeNIZtA56/CZRMnLP0dsdsVcq49ZrhCHt4l/eb24Xd1U0A6Qfzxh3HOqi05g1QzYXl4az0rcH3UMDUkpvRFMfTsWOskyTgQGUD2ehHDoqAM+J4ItdCyayEFPaklG+lqHFZ2+2V6O/ZauZZenvyCK8xGlX232BCNxQu6mMh3RW9fWhxHS2eXM4K9CCgogJl+ffeFgU6jT8VaB84Z8ZXLJDJ/4BiNPAG+sjb08nLAiLkNNxtVe8m4pkuAuRCrI7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc7lAaRm6zKqktEQ98LbIyUFKubJ6Dl/RXtlbGuOoSw=;
 b=k11wTSKXoPMNx67UrdU1jEwFGf21hfa4WCYrSrRtCDEa5J2OEMvHBS/PkLaNPGVRY4q3bvMYKq2ZP/nSyNTgywDdJ224hTmraMlRwQ25yfLZZ0xwfGveQgj9WIp7GnvXeFRRQGn4G+z3Fl+QTQyjNQZ4fdbcpjc87PlgNxrmZ+5ZXWzlNCQUDJ8HSJA0riM7IQ38A6FaNOuhnq7rSOJisJzvE2D0EekiA5B0WoAaGbVtxdyQ1sU0DHxtD5/pqlVqr8O1bV+D+qePbfnpv9cpF8dtTYKewfstP2foPba3NSTPgVyVYk/AhzRYH5hmFxQ8+dIUEhiW4PL49d6n9xDsZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fc7lAaRm6zKqktEQ98LbIyUFKubJ6Dl/RXtlbGuOoSw=;
 b=sk6aamn3QdWHQt+9kQ4dhjDH/0Qkz+0Mp2ZC8GxUGR3tx2AnSnlrlqu5gSWNJBBdvZ21OwpXUirJSUSVNeZXiRCGFPCnyYTBfWeJrFff8GGTusO922aizqUCqu5iiLRtin1eKnN98KQik5WJyzJv4adWd//WnfkdmSKW3eA6o68=
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com (2603:10a6:10:fa::15)
 by DB7PR04MB5498.eurprd04.prod.outlook.com (2603:10a6:10:80::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.11; Tue, 15 Sep
 2020 06:58:24 +0000
Received: from DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68]) by DB8PR04MB6795.eurprd04.prod.outlook.com
 ([fe80::d12e:689a:169:fd68%8]) with mapi id 15.20.3370.019; Tue, 15 Sep 2020
 06:58:24 +0000
From:   Joakim Zhang <qiangqing.zhang@nxp.com>
To:     "sean@mess.org" <sean@mess.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        LnxRevLi <LnxRevLi@nxp.com>
Subject: Recall: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Thread-Topic: [PATCH] media: rc: gpio-ir-recv: add QoS support for cpuidle
 system
Thread-Index: AQHWiy2bq+eMdBITkk6RhyWwegYPvw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 35
X-FaxNumberOfPages: 0
Date:   Tue, 15 Sep 2020 06:58:24 +0000
Message-ID: <DB8PR04MB6795DA37297A19D37907701AE6200@DB8PR04MB6795.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mess.org; dkim=none (message not signed)
 header.d=none;mess.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 98ab7ef5-8d86-44e6-f64a-08d85944bd92
x-ms-traffictypediagnostic: DB7PR04MB5498:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5498021FDDEF5096F2A027BAE6200@DB7PR04MB5498.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tdKRAiXUaQ+zMvqvRwXPqZWur6Ay6zk/c8UJPVAyvDm+lQrBmveChKvvq3YT9pz783zsAgLz2sRs/G/ekoC/kYzomKreMiwRg7Jy8eCt3Im9nmde+PlvrhXMozWhdickCBjqJLHERaW3SZmOkKqjAKDWjuLneEn3TMVl9hZBUz5QmMAC8+Ts/XuJVqw97ViyxreXUP6Bz3ns0GWj35mhbkGKv9dx6qcnQGXPksKaa8TrqxQJL0FnyMDLUkPOaijROfNj2Kb5BhiFjHEC8ie5jE/W5CDNjpca+n+ZAOW/i0hv1SgvOvgApDtzRr0lzSZPHl036qVvQMEdsIq8lSW1XQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB6795.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(39860400002)(366004)(346002)(6506007)(2906002)(110136005)(54906003)(7696005)(8676002)(66476007)(66556008)(64756008)(66446008)(76116006)(52536014)(71200400001)(83380400001)(5660300002)(66946007)(478600001)(86362001)(558084003)(316002)(4326008)(26005)(9686003)(186003)(55016002)(33656002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9+yDrQhVYYqsGMVS2z/IsLeiHPFirAKTrLN3u4dTWxx7acOxeNvAOT06fe486ndaCcRN1QxQjNzm5Qelq5hdDX+VXiQQGtIZemSWHPk3XuE7KXdHpHUDVUy3j1pMskG60MF0ft/UF9GJOyNgOFG4pKmzYCzTzYfzilfRaW9/HEoHNcgjKeufRnUv78ryL+vZxCK3PgIhvUtL5jlMAg3vrU6ahfN1x1P5IBMR26GU4HhHTpD4vng4JEKs1QzwEpBuoJBdYbJ+iv0xQsv0vGdmMZ0PzqCk34PTuIyaR80/wCzpg/H7VFXGUP+aw5Ne4SZDcgWPkbPpvS50wCTFcNMGZTieCXJsxDQmTv1cX+s5cytHg8q3qOFQLfGFzjaXbVXYJ1XAH2tclOppRseZ2vms3hx5cy0Qcfj5EwVE2HiKgwn8gmHlDWGQn7ZrGyVMrP0Q6pdUY20XaT+632WzMz8eHMZzuKp6N8uNXLQ1ADoX/VhwTi1qcFFmbJLmgoeKLwTCgc6KYqZNrtNJysC1M+MXdRKH5TApxKwkUC4sRRkNwR3UMHRJDPz5KYd3dalkLJaalanqrth35mucn/1W5/C6QMxwf2ipvIVzxGX2A4bkAeE7ZMqi4FTcwuyXYEqGo+v41uq9y02xoH98YA/KV8yYFw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB6795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ab7ef5-8d86-44e6-f64a-08d85944bd92
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Sep 2020 06:58:24.5431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R1X2hD11lgjSAsvoQG4603TIAz0CjaXlDJJfZ9HzjDVLrXTQkoxj4XpwW/GEi497ugsxr1AYvM9Y6toQ4SL00Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5498
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Joakim Zhang would like to recall the message, "[PATCH] media: rc: gpio-ir-=
recv: add QoS support for cpuidle system".=
