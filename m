Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EAAA2F0056
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 14:58:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbhAIN6V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 08:58:21 -0500
Received: from mail-am7eur06olkn2082.outbound.protection.outlook.com ([40.92.16.82]:9184
        "EHLO EUR06-AM7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725942AbhAIN6U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Jan 2021 08:58:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSNyYEgd0IXtj+xold3L8OGmz8PvaNPvFnvcJzyAVOyAcT5MZa06kV5rpHZYz7DWRFkZa3lAFflUBZb90gwizcG9MGXYudQsSiEcgxtH4XGOT+mDenknPoccwg8rq2KcJM5cENY15PngockQHA/U58km8g1o1s1/CDDN1n1TtaRQCh6m2kySQY5vcSmkZh447px99MetA4RCR9YkSAHR4GYifddXq9Ze9P60n7DWdfnXNYq1NZtACcTGUx4vb3HT+6vki+qKH41whKqb14Ll2Loll+Tz2YUwltW+2XbXBF7OA+nO3Uad1fYywQizllVOz1ntvYUIYIFTjpiu+/yUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVKx1raY1U/YcNq1ISPw0N6J76ORq68Lxg9kNiXk7gw=;
 b=j2VxkB2cnsLBUdVa3fuU/jSzD7+qsdDhJyKIQqsI7fv2YbTf2wmQf3/X61CUKkr9U+SGGNFPAvNTF1FbKfgauUQ2lIe0/x67YveR1jaVXejSmZdvBMCy+EU6LW1uwgQUjY4MVhoQMXyC2VzCOFPSKbEvXw6R+hOpYU2R1NnrSKpWMTrT8O9bgI3gMfImEovQPBsAy2LauqbfADBJdjj2XIAslDZn6JilNgtEiEsuLuCNLddFEJ47BEsFV0fnlisn0uZsu35NOHwd2wOKKo2T2MyAKKgu1so7Zz6KuilfRXYvHm5Yy54tNQPsCJYRaUWAntKE8KqM3OtTKpUuhl/6yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVKx1raY1U/YcNq1ISPw0N6J76ORq68Lxg9kNiXk7gw=;
 b=fow/nu9UozT2dgDhWq34wsxrgmaOPXRbws1ZmnC/TGYZ3VHprmtSNYG4MCupOfhdqvghoOaA6Tou0McVb83cAw7K6izt2SaFfi4PGqrCfroDO5tkz1Hv0Ky/wlCHWbKnyIvq/0/pOn1Wye+YBu/MsJID6aWZk2uThCawfuluyWriTNwc3CQ36QuEh7hM0lJz4dAVVfirg8kNhp2GPTlvUhlo3d0jtfDrkIaYmvGiOEUks1KlSYi23D4Yg6UIPbwTPBl1Eq3dOdRAN2kijs+deb6KzVdivzQeKnfTz3jAmkGuIg0Z4Pyj0sgHCTtKqYkc11c1BQHPGGBWD0i4x8tVdA==
Received: from AM7EUR06FT067.eop-eur06.prod.protection.outlook.com
 (2a01:111:e400:fc36::53) by
 AM7EUR06HT140.eop-eur06.prod.protection.outlook.com (2a01:111:e400:fc36::134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 13:57:32 +0000
Received: from VI1PR0102MB2637.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc36::43) by AM7EUR06FT067.mail.protection.outlook.com
 (2a01:111:e400:fc36::166) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 13:57:32 +0000
Received: from VI1PR0102MB2637.eurprd01.prod.exchangelabs.com
 ([fe80::c8d7:969c:676c:57c4]) by
 VI1PR0102MB2637.eurprd01.prod.exchangelabs.com
 ([fe80::c8d7:969c:676c:57c4%7]) with mapi id 15.20.3742.012; Sat, 9 Jan 2021
 13:57:32 +0000
From:   Mrs Aisha Al-Qaddafi <johnsonanna12@live.com>
Subject: Dear Partner,
Thread-Topic: Dear Partner,
Thread-Index: AQHW5o9f6GvhTDwKukyw7X1Jr+MDEA==
Date:   Sat, 9 Jan 2021 13:57:32 +0000
Message-ID: <VI1PR0102MB2637195F9F133347D6FC77A6D1AD0@VI1PR0102MB2637.eurprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:6F5D38725364822EB8E9AB7E122A4EEA21759A2DFA440FE111B5482A05391359;UpperCasedChecksum:EDC31EA71E882BB3B28F034D2D02121ADEEB62AF340404A242693C85AC30D5B3;SizeAsReceived:7897;Count:40
x-tmn:  [0PhuqY1jAVGlErVGFNqFxwctpyQlZU/4]
x-ms-publictraffictype: Email
x-incomingheadercount: 40
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 9f5b1c56-8f7d-4741-feae-08d8b4a68298
x-ms-exchange-slblob-mailprops: NS9Gj58uCj34z0eXouu96gXZAa5tQhpZfWMnrn+TUnc6RPYL8jtJBYZxscYryk4omZAk5tmG24GAZEqg0RPPoEvJNjfHVk5U+J8nvogImrQ7DGZfelewaGQ5KHHhAiwNLpfkeMNSuGqBzCH0x/0kvOwJ5ytsgHsMtKwI2vlfD0wcffCo/iHS72L0IFev6fnA/8nkkZ4qlJYMfXhx9hjV5x9fSKVK9ZBjhRC6z/YJqjp5bhAHvvZUFDhGbzQ7h3ZF8A0YdAH7YNF3WadH7pEtEoIltLz6gnrZNBtR/1rbFYQH4Hj8mfKqSEQHRMLocg2je5yTfjupXPeXq8y7U8Ulgyx8P1802XBR0aLBMLgpf6tlDN+SRw5qjBrC2eTnr3QUkvNSVDs1DR/BR103sPIP61pGUq5izXnUxfNX0+ZZgMPlYMbLPFqHdTQ/gdTT1Y88Mp63hbLwqXKzvaOvkHBNsVszRukxqOxpzQd5luh9caOJAy642iyt7rx3d6PobrIwdaXmp35+oiF5qn9zAM759OieWtUeOD8r8NZqHu3Ap+WMCXhd1TpYZwl/K/AOprJKj8MtIMuqb84hACLr/t+pwFMrQSpa5Yel5umHu4ekxkE/EKpjy5UViKymCwWNfT37NasocuDK7pBKbGcBRlj+tQSw80wp8vXDFlbhPAhxl8ftRbvDI3zefayRByx57T69RJaXbpj5EhJXfm2sQK8NHg==
x-ms-traffictypediagnostic: AM7EUR06HT140:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tCL3oijG+9ZW+WVRJLErzeEpDru4pwEzJs3rPdKJl2NSYW2sngeDQRgF+n59X6kHlssE8ZDPrWZDNabWjNXGQS0M6jXQ1d9iJvbzTTcKfigLnPn4htuzEqiI7m5jj0owmZuxliI5NHK5Bdk8HcCFvJm6EUvftj3Y85lXJelZGJQCQZ680QcV69O9odV4R2xX1jMv1YrjlRIcVDWvEDOFVZcl1x8UBPMuTMEZRSTsDyOJFO12oyP1t60yN1VABiMA
x-ms-exchange-antispam-messagedata: WV/HMGSWojlJ6xf4b1+EuAhttURTM6hSdfnZck+bbBqt3SoUVf1Nq6jUmaNnJohXRoioBGkXwMore4GwCsz/GFnDE8U/AVjs/W/1jcw8XgfdeiEw57axlQ94qfqYK8Q+0O0wlyqMJQ8tVG/qQc6FCw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: live.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: AM7EUR06FT067.eop-eur06.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f5b1c56-8f7d-4741-feae-08d8b4a68298
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2021 13:57:32.0572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7EUR06HT140
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org




Dear Partner,

I came across your contact during my private search Mrs Aisha Al-Qaddafi is=
 my name, the only daughter of late Libyan president, I have funds the sum =
of $27.5 million USD for investment, I am interested in you for investment =
project assistance in your country, i shall compensate you 30% of the total=
 sum after the funds are transfer into your account, Reply me urgent for mo=
re details. Please kindly respond quickly for further details through my pr=
ivate e_mail address:mrs.aishaa@yahoo.com

Mrs Aisha Al-Qaddafi.=
