Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8A726F86B
	for <lists+linux-media@lfdr.de>; Fri, 18 Sep 2020 10:35:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgIRIfp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 18 Sep 2020 04:35:45 -0400
Received: from mail-eopbgr40043.outbound.protection.outlook.com ([40.107.4.43]:3386
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726109AbgIRIfp (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 18 Sep 2020 04:35:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GCOR1GGPZGc8R2oHqLkfcqnAoZJN8AzG+1aGBTYl6W29sCudwZqLCJSHsP6oNF+PPt34WP2Tr4/rbKtCl2XUABFWmDOU94SU67ntF0Wec5ErxTMjaTOTY+q41mMnUh9NPv8Ef5RQ+Uawk4BpZ6eR0Ap7h48XWRaNggSRl6gCC0oRpTaObtrLvTIYqwa+YqwIfEKm0BBktT2Z3T9kRBbDy/PRJQlgITspIW2XJzTMwgTe3gsQxw0zfwWforVtqe8kL4kOpYJvMNxvyoX5ZxYpzjzLSt/07lehqWptaV9KeM6h6eQKan65iw/cgV9anzLzp7WsTtZjK/xSbpjZC0vRVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRBiWWgPRyH8s5nzbDYACtzpj4TIl7HDwHvxyaarL/A=;
 b=ldua9S+rcRPt52DPupvq5/u0XuEC19ih3RlcpzF1aY5TCUqypqgyhoWA4J0Hwra0q7s/oy99h4bzo6WVcMUVo24wv4N02LUezHDppbzqwfKNH3ATYK/7mZnjFN4M6jmnG/rGp4iO3KD26X/VC90Hz/WLLPb3y85Qewvhw/jCOJwN4VPDhchijaTCpJBzqHAxNFOkp82q+OH6U9f2g/odW/DuOOx8SpWHjrhWZqajhQS1H8D1ee0Nob46PSOdVbK8D6e/11Vpniv5qRNsdUJkwF4Di2IOv83a0UlGcjxlKS1bV/7ue6VTuRndZsAQ9r6m6GEqGHd6UnZ/U48MTarpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=skidata.onmicrosoft.com; s=selector2-skidata-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRBiWWgPRyH8s5nzbDYACtzpj4TIl7HDwHvxyaarL/A=;
 b=1ZUwoGDh8di/0HI3OeC5VXaabjjq1aJqOEZgzxMXcu6IMfY5UK0YQ7l224Icr13fvTMY3O9pBMSzHTuEGtiNz2uAs7c22oieKF+/FLjNeih/bjNTCzg7yI6+MvKNhzL2uxvIpv6Y1x0vU18b5p4iQTheR8InRT4QH21P57ubgB0=
Received: from AM6PR01MB5574.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:fc::33) by AM5PR0101MB2404.eurprd01.prod.exchangelabs.com
 (2603:10a6:203:35::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.13; Fri, 18 Sep
 2020 08:35:38 +0000
Received: from AM6PR01MB5574.eurprd01.prod.exchangelabs.com
 ([fe80::8474:983e:b991:d1b8]) by AM6PR01MB5574.eurprd01.prod.exchangelabs.com
 ([fe80::8474:983e:b991:d1b8%5]) with mapi id 15.20.3391.011; Fri, 18 Sep 2020
 08:35:38 +0000
From:   Benjamin Bara - SKIDATA <Benjamin.Bara@skidata.com>
To:     "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "mchehab@kernel.org" <mchehab@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>
Subject: RE: [PATCH] media: coda: avoid starvation on well-compressed data
Thread-Topic: [PATCH] media: coda: avoid starvation on well-compressed data
Thread-Index: AdZ3sFkqxzglukE+Rf6iMENtrYblXQAAhVYwBXiB3HA=
Date:   Fri, 18 Sep 2020 08:35:38 +0000
Message-ID: <AM6PR01MB55741EE09532A7C60CD05B71E23F0@AM6PR01MB5574.eurprd01.prod.exchangelabs.com>
References: <3b140eaf883b4666985c0be0db8d53e8@skidata.com>
 <9444c9375f58436b9e6a0fa3a4088e17@skidata.com>
In-Reply-To: <9444c9375f58436b9e6a0fa3a4088e17@skidata.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=skidata.com;
x-originating-ip: [91.230.2.244]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 373900ed-6740-4cd7-56c3-08d85badd253
x-ms-traffictypediagnostic: AM5PR0101MB2404:
x-ld-processed: 3d52ce8f-cef6-4b27-bace-cf9989cf3973,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR0101MB240475635B44FB0CF1C7126FE23F0@AM5PR0101MB2404.eurprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9+JtGkSiDTPD5qPaRgGY1D9exb9qZ12PtzPBVuAUL2dIlem2ItIJ+bhZGDxPxUjpd69byojALsCXrIoFtRt46gwUX+NlIKSHLoU0BPOXirhfpvRMe7jDRK/lFgGtG3KzgdapwSIzvWtuOgJAvrIoDyO4bSiJip+Zyddq1LWTXcGwpsf3GBx7jR4ezBt6D75U6ymHXZWee9f8YjZkpbjGEuIJV8aIZfYQE3rG/3IXRLtlhJzKosZZbN7hOk6Vh5+WoyuEt/mD7xnd7m6hxQAPYdRZ+EU2M+sR3qD8oKDM+QCla1iP/q2RrhGz0jyQLt5GrnJ7MtdTptyfbLYRlykVPg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR01MB5574.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(396003)(136003)(366004)(39850400004)(376002)(346002)(110136005)(71200400001)(9686003)(55016002)(4326008)(76116006)(186003)(7696005)(26005)(64756008)(66946007)(66476007)(8936002)(66556008)(316002)(2906002)(66446008)(54906003)(83380400001)(478600001)(5660300002)(6506007)(33656002)(52536014)(8676002)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 9RCClhP26Rvuw4ZALU9QV7HnpSWK37VeSsprxt1sFB/i7L/3c1WIce0zBrtRrAJefp1h8Wd2ZqthwGl+mPuVastIqukXTUx8ARZwJcxiAbrnhZiIybXnY+iCqPDyEnuvoB39bzX/eHLABQmsdcDvtviyOHAvbWIp1HRWmJewClvSavd375/tDi66qR3sRjYnB35uADfVHT7Dc9or3z5OX88IHyPfIW+hF6hZ1UapAszXfGdo+yr6yqgZVL4cD9cWk1Vr3XfPLUynCLtFMoh0E2KZAYP85DdpSVvjtRnIjDt3Lo7+U4hqhwQxqguQ5Bi7WjWeR+OT1TQrjrXWkoy695+yXdZzvSDx8bunlkU4XFhl86fYCLiAUFj2wxxs2yNdFkFu0SCgwOeon22kidnMZOSapnFBd6BeQbDyQuEKzIEgT+rgMLV1OsDGNSFEVVMHPA1av/CHFtbV0X7Dg4zPyugONQs+Qb0p/h7+sdS5UuGzIYbrxVoitAmo+6lQMkGzQbzI57tkDS2Ho90fEhR9IbiFg5KsEjIUYjaIf2CPDSjti4NSBVmhoqqSLv7HW4p7fyMpRMP9XkVH2dKhB89IbnMxrfKDYZVacd7oSdBjIpC8pwn8K9r4hJL8WYQ+Q9ZfwgHtaGjw+9kDor1YiF0AHg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR01MB5574.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373900ed-6740-4cd7-56c3-08d85badd253
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2020 08:35:38.8352
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3d52ce8f-cef6-4b27-bace-cf9989cf3973
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 60Cor+Y2CI8aUUg8bqsLqoyZQxEM2nkY0kraRlB8TbC0gbA8HnhZDGDgtqR4TmdjA5sJY8Zfnog+HPjEV3k6hOhUhRr6My7gzVS+vyRHfpQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0101MB2404
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

there are still cases where the decoder starves.
Also, the failure log at the bottom contradicts with the 2x256 bytes assump=
tion.
When I increase the threshold to 512 bytes, the respective video (and all m=
y other tests) work.

Is it possible that the limitation is 2x512 bytes or is there another "limi=
tation",
beside the "two window" one, which is "accidentally fulfilled" with this ap=
proach?

What do you think about the approach in the patch; is it possible to get it=
 mainline?
Any help, feedback, hints or suggestions would be really appreciated!

I will do some additional testing to see if the 2x512 threshold finally cat=
ches the problem.
When I'm done, I will provide a second version of the patch.

Many thanks & best regards
Benjamin

*Failure Log:*
[  108.108711] coda 2040000.vpu: 0: active metas:
[  108.108716] coda 2040000.vpu: 0: - payload: 4240
[  108.108721] coda 2040000.vpu: 0: - payload: 900
[  108.108726] coda 2040000.vpu: 0: - payload: 170
[  108.108730] coda 2040000.vpu: 0: - payload: 403
[  108.108734] coda 2040000.vpu: 0: want to queue: payload: 405
[  109.057738] coda 2040000.vpu: CODA PIC_RUN timeout

