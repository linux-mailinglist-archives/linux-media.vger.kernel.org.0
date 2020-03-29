Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7FC5197044
	for <lists+linux-media@lfdr.de>; Sun, 29 Mar 2020 22:31:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728539AbgC2Ubf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 29 Mar 2020 16:31:35 -0400
Received: from mail-eopbgr690102.outbound.protection.outlook.com ([40.107.69.102]:12610
        "EHLO NAM04-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727370AbgC2Ubf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 29 Mar 2020 16:31:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FvoRcjNFS5kKZ55N3NDum3pJ7fj4ewoKsG6Dl/c49kHcc2Qrxz+j307f7BaNMqK1Jz7i+1BFPAOTrBNHDrx+Q2aKN4zRO4NTAfSWeAk5+c4hKvtzoeRl73m0D3tRiMSOUzbGmkZndvGZ+qZZo+Y3YxbbuUTTXk2UXfKUzTbFofiP0VN+NyjWhFK+jpQpFMqaEZiep091GRF9B0BiGoauT7dAvzmVlGjG5WtPBcTVmBaKJMj+oqrnIVsRLY3pbr8FCX3bEQ1Gn9mOUi0klJetpaeUxDbYyl97EwNdQeugycZSopcR6j2Wcdh5LxD/izLhKsvzxMd6/6wEF6EIU4J5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AO04l4gGsS1w7rJlCrFkAw3HYEDi4Je2t8KM0Ac/Ahs=;
 b=XwDpuzt3C6tRQCpUzJsdv37FnL8tIkTD/g3PkYvhkCex8xKpoySDLY25bA782v249mtyeWUBhgC/Mmg9ANYCe7gGf44ZrXS8Ve7fJtW9Pj4UfAPLECOEqK6yOyIDwbApbCWiFE3DYnh0ZMbFekLHIGFESR8IYxA7lKA34h1UxneAvh9LWcNDScWz9aKpGeBaFVQ2Gc8NQAzcDGkxmHmYSQv6HmbzYSbK2U3U0c3pCE3iRNvgPbeVzzd4LH5FeZm+DAm2omXtw+X81Nc37e3K/EQ3xuJT/lQDhryY89SYXaomdv49zYfs8kXN9p5eMupf6fJCh0Kd4aeq94YT6BxzIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=northeastern.edu; dmarc=pass action=none
 header.from=northeastern.edu; dkim=pass header.d=northeastern.edu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=northeastern.edu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AO04l4gGsS1w7rJlCrFkAw3HYEDi4Je2t8KM0Ac/Ahs=;
 b=NubTrXxReEjwclnd1hUeR5Nkl5SCys6zOARdG9QaZqfUmM7rDfTc5YC1zDq+Jhj9b6/i/0ZmT8/wI2hQCYuPwNMcMtPMQvIwh12Uky/GYZ8iZ6V6LW7jeY0Cuk6tfetE5xq6GckUR5REJAijfSkd0Afp4nah1F8/fqausuR5y3k=
Received: from BL0PR06MB4548.namprd06.prod.outlook.com (2603:10b6:208:56::26)
 by BL0PR06MB4754.namprd06.prod.outlook.com (2603:10b6:208:58::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.20; Sun, 29 Mar
 2020 20:31:31 +0000
Received: from BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2]) by BL0PR06MB4548.namprd06.prod.outlook.com
 ([fe80::20f8:a2f2:5ebc:da2%7]) with mapi id 15.20.2856.019; Sun, 29 Mar 2020
 20:31:31 +0000
From:   Changming Liu <liu.changm@northeastern.edu>
To:     "mporter@kernel.crashing.org" <mporter@kernel.crashing.org>,
        "alex.bou9@gmail.com" <alex.bou9@gmail.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "yaohway@gmail.com" <yaohway@gmail.com>,
        "Lu, Long" <l.lu@northeastern.edu>
Subject: [Bug Report] drivers/rapidio: integer overflow in rio_mport_maint_rd
 and 
Thread-Topic: [Bug Report] drivers/rapidio: integer overflow in
 rio_mport_maint_rd and 
Thread-Index: AdYGAsewaHVHbFTDQ4aivM4PIZPJZA==
Date:   Sun, 29 Mar 2020 20:31:31 +0000
Message-ID: <BL0PR06MB4548F541520DA55D6756E8D4E5CA0@BL0PR06MB4548.namprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=liu.changm@northeastern.edu; 
x-originating-ip: [2601:197:a7f:5cb0:217d:acb0:7278:589d]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6e27fd1e-be0f-42b8-61f0-08d7d4202ac5
x-ms-traffictypediagnostic: BL0PR06MB4754:|BL0PR06MB4754:
x-ld-processed: a8eec281-aaa3-4dae-ac9b-9a398b9215e7,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR06MB47549A89762C9C98518B9478E5CA0@BL0PR06MB4754.namprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 035748864E
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR06MB4548.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10019020)(4636009)(396003)(376002)(366004)(346002)(39850400004)(136003)(478600001)(81156014)(8936002)(8676002)(75432002)(5660300002)(52536014)(2906002)(4326008)(81166006)(33656002)(4743002)(6506007)(86362001)(55016002)(7696005)(64756008)(71200400001)(786003)(9686003)(66946007)(66476007)(66556008)(316002)(54906003)(107886003)(110136005)(76116006)(66446008)(186003);DIR:OUT;SFP:1102;
received-spf: None (protection.outlook.com: northeastern.edu does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: /cvsdR50qqoOlz0RCZmXq8Qc04tUmTj8QoKxqde4APR2TE0p9mrvs31tIQf22tSCLs176uTxSHGK5Zh+IbUSQBxZHbmj8HbrxbS5HG6GqCh1U291SD/gZqQddGVjiZSWy40GPnN+cxTUyd5NshLADKSWtNt2N0bSIFCD68kblDgSk89UAP6NT7JQ+6/Zpr47Qcj3Yraq5WTnf2k+VfBv3nk+b/swvCxprY4Rq7QoYo3fQb7l2an+GOq90inus94vVWbOT9is/bw+8MOhkTjxYAU/sSM6Wd4JvRIKMHR6pgzbMla8LFAaIEytAJTWePJTcvZVkLhuYMoyIDHCeHrAc15kNskho19vs7h/ylrehMKh/Fi+Gtpg5khfQsOwhZiTY0DQ4H6f3KnCYL4Y/ufls/4CVBzt0/RgDTZXX44hYVVnvBv83AusC0SV+vcDPkHS
x-ms-exchange-antispam-messagedata: YIV++3GfzWO5e/cjJdrU+V0G9gwxIDqWCQCt1AppDsHSH2mCMOM2paNszVvmo8nHgdDlcFeIS/cu9K7PHsDVpVpTwl+SpQNp2PAjYpZE9Dd9PUuhLS4qn24MvtNXg2CfpOPTg+eTY9HPydGaJ6Jkfq1erlqB4OYOXXAdQQhiLMdSWoHgojGGeJSKczXYbDuqPmaah0nYlmVHxPv6F1F6fg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: northeastern.edu
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e27fd1e-be0f-42b8-61f0-08d7d4202ac5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2020 20:31:31.6765
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a8eec281-aaa3-4dae-ac9b-9a398b9215e7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DAdURMqnxYkhGJsVBDl3PlNoPJUK76nHgR+WFQWzOA+/MIsxJlFt7blk49cLKtS5qYHJeMoQ+Bc048IAu07O5OxLq+iiHCO8fs+fKd0/1kc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR06MB4754
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Matt and Alexandre,
Greetings, I'm a first-year PhD student who is interested in the usage of U=
BSan in linux kernel. With some experiments, I found that in=20
drivers/rapidio/devices/rio_mport_cdev.c function rio_mport_maint_rd and ri=
o_mport_maint_wr, there are respectively 2 similar integer overflows that m=
ight cause unexpected behavior.

More specifically, after the execution of copy_from_user in these 2 functio=
ns, the main_io structures are filled with data from user space,  the two a=
ddition at line 273 and line 318 in these two function which both are:

(maint_io.length + maint_io.offset) > RIO_MAINT_SPACE_SZ

could overflow because maint_io.length and maint_io.offset are both 32-bit =
user-provided unsigned integers. And this check can be bypassed due to this=
 overflow.
As a consequence, the parameters passed to vmalloc() or other following cal=
lee functions e.g. rio_mport_write_config_32  can be manipulated directly b=
y users.

Due to the lack of knowledge of the interaction between this module and the=
 user space, I'm not able to assess if this is security-related problem.=20
Judging from the appearance, a malicious user can possibly allocate big chu=
nk of kernel memory and cause performance issue.=20
I'd be more than happy to hear you valuable opinions on whether this is wor=
th fixing or not, if not, I'd be very interested to know why, this will hel=
p me understand the kernel and UBSan a lot!

Looking forward to your valuable response!

Changming Liu
