Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD35B402B89
	for <lists+linux-media@lfdr.de>; Tue,  7 Sep 2021 17:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345050AbhIGPRb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Sep 2021 11:17:31 -0400
Received: from mail-mw2nam08on2063.outbound.protection.outlook.com ([40.107.101.63]:12576
        "EHLO NAM04-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1344938AbhIGPR1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 7 Sep 2021 11:17:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QA0C9I0M8VONa7tLyUI4KHEerKJO1h5Iq3y+4IamMpgqJTiV3N2RSQNWoTSmK0AKFNDRPmVuoxlrZ4lG/FlHa1RDWKhTRn5UK6YeSr4o/nJymtHV8KHYaVXOkt7PPDJ1Hiyz1pkTFpLkN+DnvEcp/8yDSHOHSXmZw5mC6/x8+i0bI/sYLFO4m2UsppfESfw7YRtBAxXAte+rRsI/AAbXSpEDyJvxwIyERJO/MPKo1J9qDcHd0G7SjCRDEse1Kh9nAdIJLmGw3CYgYtoyqntP3I8/2jKd94ohC8ePEuZBvgvFrYaRqhWqgLXEwL96urdJ49YfiAg5N/kYpeaMWj8dRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HD/u8DDa2o8vcmaouBsfEkzELF47cE2gMTMeW7npPo=;
 b=ETQlLqull0OKJ4Muv17tqeccobRWeBl2yZLfR7d+mNPNKi50uNkOhwR8cVhNeGDAtMdKp3LZ/d6JQA8BlVPuH61nF1OOwvDLZZjf4GM400krnfY9i3h59DgsoLTQiM/TgRdrOOUaEd23qordS6fF/Am/Kup2WDDIC/Fyoutcj7RGwYZ21IhlQSdmMyly7xjCSezIzuy8yRrHBG8ontrzLim+9Utq8PA2az6n6VdyVVjgt4ecUHZHf9+NvftjyDYs4rUfbR0YQBvP9C/N4KDyWQh9dqqhyE9Z94LNafPEIgWNzkwcr1ZkAhwNmIT6qWDvt0Z0PwfrXp10ZG72wXBwcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HD/u8DDa2o8vcmaouBsfEkzELF47cE2gMTMeW7npPo=;
 b=Z5gXN6T975EbrXGrw+O/Ig9jhjB+BkNxV3RYAUYSmJaoW0VWJVBhxepW6EigSABmfoz3nIW5/Cm3TyND6XstxDg0UCu3NcdB47ff32+UzSNKPY5gY88cJHmD9aCdm/jqUZnSldUPAWjh6u9rGQu039aMLdlxFAQjqKOXo4V8loI=
Received: from SJ0PR02MB8514.namprd02.prod.outlook.com (2603:10b6:a03:3f5::9)
 by SJ0PR02MB7440.namprd02.prod.outlook.com (2603:10b6:a03:29c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Tue, 7 Sep
 2021 15:16:20 +0000
Received: from SJ0PR02MB8514.namprd02.prod.outlook.com
 ([fe80::cc66:baba:632a:a910]) by SJ0PR02MB8514.namprd02.prod.outlook.com
 ([fe80::cc66:baba:632a:a910%8]) with mapi id 15.20.4478.026; Tue, 7 Sep 2021
 15:16:20 +0000
From:   Anil Kumar Mamidala <amamidal@xilinx.com>
To:     "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Naveen Kumar Gaddipati <naveenku@xilinx.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Stefan Hladnik <stefan.hladnik@gmail.com>,
        Florian Rebaudo <frebaudo@witekio.com>
Subject: RE: [PATCH v2 1/2] media: i2c: Add ON Semiconductor AP1302 ISP driver
Thread-Topic: [PATCH v2 1/2] media: i2c: Add ON Semiconductor AP1302 ISP
 driver
Thread-Index: AQHXhHOywFZVtONePUePbBV06zFQwKti3d5AgAoRTICAASu7UIAq0lbQ
Date:   Tue, 7 Sep 2021 15:16:19 +0000
Message-ID: <SJ0PR02MB85140E02562D8C4B5B4CD738B7D39@SJ0PR02MB8514.namprd02.prod.outlook.com>
References: <1627560692-21675-1-git-send-email-anil.mamidala@xilinx.com>
 <SJ0PR02MB851449DED958C023D662E14CB7F19@SJ0PR02MB8514.namprd02.prod.outlook.com>
 <20210810152605.GM3@valkosipuli.retiisi.eu>
 <SJ0PR02MB851440739434B1C101FC8BE2B7F89@SJ0PR02MB8514.namprd02.prod.outlook.com>
In-Reply-To: <SJ0PR02MB851440739434B1C101FC8BE2B7F89@SJ0PR02MB8514.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: iki.fi; dkim=none (message not signed)
 header.d=none;iki.fi; dmarc=none action=none header.from=xilinx.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25388f72-6c36-43e6-b334-08d972127232
x-ms-traffictypediagnostic: SJ0PR02MB7440:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR02MB7440DE2C8FC8FD23CD7CF1D1B7D39@SJ0PR02MB7440.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2d3RYVDcELxQ8eLF2F2dyLLeYCUEPUQJwPBoe3v90nO5VQZGLGsV/WCbzuBAKGSOtCmm3GAh0Vc0lTzmTlM7LYxkF2K6YtTmtfCYhgiM96sjVK+oVQ2WrWaBwyZ9vqr5g1BP6+ITwfCapsQU6LCKzqVVWbFGcaocIjieyyvTecNNAKQhT/4LG1EQ7IMeg2YIqLDe148PuXdWD8jzpNQbPSqX/tS9HJ6LaunFu5Hjxo0XjpXhI+gPeWxKQVck58ZpV/sDk6wn9kjZxLYGLyt173IDyk2jQYB+n+peJUn8loH940BTxdHxlj0kAE3v/h9dyl3udTCz9yWMFWtBzOHlU+OPnXUhwMXx0DdTqH3rdBP7qd6ICpOLQ3XoD+iyli0hIClS1xpt+f9hwcXtyb7YAw8TdoDWSkVbcDRvKN3wxwDkqgGcGbiFXn2pNvkeNZkaLRRTuRnxMQznuk14w9wD3Xr2DZ5SaeURkc9b2+JQelQS2RANQQtc1oHfoncdJc0DcpNnj96XBQdrjTECEjYCzoBB+aPSxeoUI8gSi5eqosqeNQN0+EmjMshE/YGzvj40BMptZ8+ACATtcqSL+DByvc+gY7YWu/+jAANhnh7R2KtuqSUPBtNwHMlVMB+c6GTFuAmjdVqybty6jWk4WH9YNpXKrfq5jFipi91wlco87L8aHyxb9yvrRuLyJEMKNrFJAW0RlpzIUQKaYs5KtNqwng==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR02MB8514.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(38100700002)(53546011)(6506007)(66476007)(86362001)(5660300002)(76116006)(7696005)(66946007)(122000001)(33656002)(6916009)(64756008)(478600001)(38070700005)(71200400001)(83380400001)(8936002)(316002)(4326008)(9686003)(2906002)(26005)(66446008)(186003)(52536014)(8676002)(66556008)(55016002)(55236004)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?SKVaAOTYfcGnxjOx5Hfq6Fc/W+53L5urEWChl2wdJ3TlTFD4Jz62edm/cGsy?=
 =?us-ascii?Q?tyaSVZwGMpGL9BtC/unpVlZ7nfrj4TRDy3CQupRaY0KkYWf4V1ovcxQKUOVW?=
 =?us-ascii?Q?/5M3BTF7Q9YElm0AGpowQFDq/nLB78XlrJtLhn2/XtkYLlfiXkeCyX2pkbV4?=
 =?us-ascii?Q?fyE1BzmcMpl35WVCFU0AwC1sC+hi0G8w/kZNnouVFGKYP4kQrnzqw7fbKzXu?=
 =?us-ascii?Q?gXbTlImiOSKKgjU08W6p5pvUcKic/5/XBQoS7+XVczZHl1iUz8Vp2WQiKdl9?=
 =?us-ascii?Q?t2jU8QIcMERIPRqPnx9ddIVx93f+fdlTbxm08EqJ3+HQ4/9WDiLS5/gjS/zt?=
 =?us-ascii?Q?SvNFjICTiMGVdZCVGGTSJegTVdhIhKyiXS9ODwZixoV2jtzt3FS+k39BdSUv?=
 =?us-ascii?Q?wGSz3K6KwUZQLLzNvvdTirqnpNiuBWyUzdVXOKzgUsM68ppoD0ySBVEPNpPo?=
 =?us-ascii?Q?BzQDjVSQdTz7+SWcqjchpSb28exsJUa/l/0bwqnBqMMYzAblrhaMNVSkwhWt?=
 =?us-ascii?Q?m3exQz50+dBJOHbIWKmRf8QzdCgcvFC0ygoSk4gN5Fxnb4Cg+sKY1cofvmjd?=
 =?us-ascii?Q?3ItB+uSg/9KQjBTlMLsEzvCxiQvGfI0fbLKKTiELOVvpsZd6QoYxZstgIPpW?=
 =?us-ascii?Q?+/6BEN6TkWm31ukl19bq+RlYAqENmo8p63vMYMENTjPdwPysmkvZDOJrUIJT?=
 =?us-ascii?Q?ODfX0+2g1g/FPT11UQf8+nWddT0bLRI7w1Lb0S16A5VuE6FHuWv9nUkHXXYn?=
 =?us-ascii?Q?YoMFyYTmKCkCCY56muzJMkdD1Praq/Gn4fk7SiMYE93IveppTFqi/Vx86uum?=
 =?us-ascii?Q?Itb8fxZ1o/fkxX41bS/eax2TD3Fs5t039g/75yZscFcmNPY8ESdumrOAqMwU?=
 =?us-ascii?Q?HH0xL6Ywg8WHKsJ1EInObU4wDDfKOuZrq6xty5OPh+mSq3MpdD7c0B71q7Ll?=
 =?us-ascii?Q?O9h6v9lBF9gPrJePKdvoZ9OOOZ3TXBH8+rJdAxmjHi6zf6YGjSann0diXlto?=
 =?us-ascii?Q?BvvOwUq3nfpMUHyjibr+4/uuvRMmZWqOeWv9VzIJkzjKMvY1H2MJrRXPUlSM?=
 =?us-ascii?Q?96cWlSVMqQKyp4rVdUL7dP2vCIUvVVKyARC2iyObRjjtKMPL6zWmxmPLeN9k?=
 =?us-ascii?Q?rdd1hxMM4dUMSvVdNuPE2gG7VrSYJHRd1F61qEjElQaRiAwyFASloL2q/auB?=
 =?us-ascii?Q?EqQd9iGbh5LvY+T/cuGQjGvYdH5t8tZYA2OlLrjDoDGo0iv7PHXqso9VkKvF?=
 =?us-ascii?Q?jPGlIp0UXeHMQ+MYstfPZ5sXe2lMSkllRKPsVirjrJDnWz6cKnXLqwzoD3I2?=
 =?us-ascii?Q?jRc1K2rBBwjyGj/iR0MtcplY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR02MB8514.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25388f72-6c36-43e6-b334-08d972127232
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Sep 2021 15:16:19.9214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZzwFt9bO/l1dV2B32UPVKBDPuTuReLjLzOo4cDaTUpZkNASGkjGgGDicoxiDhcNUUnw5I8rvMaKHlJSxndvmJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7440
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Can you please review the patches and provide your valuable feedback.

Please find the change list w.r.to v1 patch below.
1.  Updated code with the review comments from you for patch v1.
	- Add check for firmware size
	- Remove hardcoding of MIPI lanes
	- Use fwnode_graph_get_endpoint_by_id() API instead of fwnode_graph_get_ne=
xt_endpoint
2.  Add streaming flag to avoid multiple times calling of stream on/off fun=
ctionality if already in that state.=20
3.  Add v4l2_ctrls for setting brightness, saturation, AE metering mode, co=
ntrast, gain ctrls.

Thanks and regards,
 Anil.

-----Original Message-----
From: Anil Kumar Mamidala=20
Sent: Wednesday, August 11, 2021 3:52 PM
To: sakari.ailus@iki.fi
Cc: linux-media@vger.kernel.org; Naveen Kumar Gaddipati <naveenku@xilinx.co=
m>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Stefan Hladnik <s=
tefan.hladnik@gmail.com>; Florian Rebaudo <frebaudo@witekio.com>
Subject: RE: [PATCH v2 1/2] media: i2c: Add ON Semiconductor AP1302 ISP dri=
ver

Hi Sakari,

Please find my reply inline.

Thanks and regards,
Anil
-----Original Message-----
From: sakari.ailus@iki.fi <sakari.ailus@iki.fi>=20
Sent: Tuesday, August 10, 2021 8:56 PM
To: Anil Kumar Mamidala <amamidal@xilinx.com>
Cc: linux-media@vger.kernel.org; Naveen Kumar Gaddipati <naveenku@xilinx.co=
m>; Laurent Pinchart <laurent.pinchart@ideasonboard.com>; Stefan Hladnik <s=
tefan.hladnik@gmail.com>; Florian Rebaudo <frebaudo@witekio.com>
Subject: Re: [PATCH v2 1/2] media: i2c: Add ON Semiconductor AP1302 ISP dri=
ver

Hi Anil,

On Wed, Aug 04, 2021 at 06:05:54AM +0000, Anil Kumar Mamidala wrote:
> Hi Sakari,
>=20
> Can you please review ap1302 ISP driver patch. Sorry for the delay in pus=
hing the changes.

No worries.

Could you elaborate what has changed here since v1?
<Anil> Please find the changes list below.
1.  Updated code with the review comments from you for patch v1.
	- Add check for firmware size
	- Remove hardcoding of MIPI lanes
	- Use fwnode_graph_get_endpoint_by_id() API instead of fwnode_graph_get_ne=
xt_endpoint

2.  Add streaming flag to avoid multiple times calling of stream on/off fun=
ctionality if already in that state.=20
3.  Add v4l2_ctrls for setting brightness, saturation, AE metering mode, co=
ntrast, gain ctrls.

--=20
Sakari Ailus
