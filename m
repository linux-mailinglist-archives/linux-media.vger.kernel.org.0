Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08BAF8E2F3
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 04:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbfHOC7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 22:59:16 -0400
Received: from mail-eopbgr780052.outbound.protection.outlook.com ([40.107.78.52]:55760
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728014AbfHOC7P (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 22:59:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THhjTUauH8YlzFO+o8khj2cvpq85/gAKAX9IqSROzTWxsh5dUhw2bTTnEF46Ed60XUhp1uIjUjbUh3SAme/tb+H8DTP0gqVA8i7yxWqsxE0bhyTrgK+eQfGjck2WGUJH9T2eGk+EqpQCJjJk97UaZ5eesxk1H9NFXGNW6tJlUT73kge+hm3hzCMiuu+sWjpEJhvou77ZY/4pUXa1lGiyunu/+FRFtN5rkRuiv/camL3Xs1QJqWJ/4HZMs0MOD9u3vf4AOQULIDtMxeJuih8FcnBkgf5v3TfZ1DeCYhoHYvbMzLVe7T6rTQTOrowm9C4pz20ZbEl2OSi5xVVYf0R9sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv5osPN0zfkkB8CP3aSqyGczIGAtf5PNvSr+IP/P8jE=;
 b=Iyd0bCfdKr08n0m5fduT67aIQ2d6JpCAI4aBNrrKJ+Nn1ti23YCN03MaCKB/7RreM0w1MJrAocqlO/oNqm19fOdVeVGypGr/GBbLZxOY2z0moJ3IpT5G+85xmqt362KeBaduXK27rk08yBQagMfT987qaG0UnPFG4H0J1HdWukJXRpFuDMk1uPQhRLEuTG8hfe3DcSJ1EOWhnBZsbKDJxfsfuSxfBpmoShkY8cltxLbekYB5dTp5uMxqgNewdUSbPEaLkBm16KGfTba8Ic/ZC5t+dAehwWXrWNmf+lOxHuH9w/9P7j2X91C/ReVcYTHx9GIhQYiXaWG+uHHxzEgMmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nv5osPN0zfkkB8CP3aSqyGczIGAtf5PNvSr+IP/P8jE=;
 b=MnGNF89I3lF6+jW8kHU9rqRRjTCOPeE4VXEkx1NMq79++tTGgRGR+11xKVfJZ4NNu95q/LmpTcHKhffiGtGWvlNnkxM+H42zlcey8Mqw5MZf5ndwulorrR93iGaIZGAMN7nipj4ickmcbG4T27FH+F2QjTPgO1jagK+r/de2tBY=
Received: from BYAPR02MB4070.namprd02.prod.outlook.com (20.176.249.10) by
 BYAPR02MB5271.namprd02.prod.outlook.com (20.177.124.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Thu, 15 Aug 2019 02:59:13 +0000
Received: from BYAPR02MB4070.namprd02.prod.outlook.com
 ([fe80::2d2a:8eaa:d7f6:b18]) by BYAPR02MB4070.namprd02.prod.outlook.com
 ([fe80::2d2a:8eaa:d7f6:b18%3]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 02:59:12 +0000
From:   Satish Kumar Nagireddy <SATISHNA@xilinx.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: S/G_SELECTION: The target flag usage for capture/output buftype
Thread-Topic: S/G_SELECTION: The target flag usage for capture/output buftype
Thread-Index: AdVTFWCJDUKSaqr8QgaIWa6WMYmpVg==
Date:   Thu, 15 Aug 2019 02:59:12 +0000
Message-ID: <BYAPR02MB40708E7A8112B0738A09C2BDACAC0@BYAPR02MB4070.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=SATISHNA@xilinx.com; 
x-originating-ip: [73.162.139.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dade7b6e-6c4a-49f7-1939-08d7212c8d5a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:BYAPR02MB5271;
x-ms-traffictypediagnostic: BYAPR02MB5271:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR02MB5271EFCE55220DEF7406ABA5ACAC0@BYAPR02MB5271.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(189003)(199004)(53754006)(186003)(478600001)(71190400001)(71200400001)(86362001)(8936002)(7736002)(102836004)(74316002)(305945005)(26005)(6506007)(81156014)(81166006)(4744005)(256004)(2351001)(966005)(2906002)(25786009)(8676002)(33656002)(2501003)(6916009)(14454004)(5660300002)(6306002)(53936002)(316002)(476003)(9686003)(76116006)(6436002)(99286004)(55016002)(66446008)(6116002)(52536014)(66556008)(486006)(66476007)(66946007)(3846002)(66066001)(7696005)(5640700003)(64756008);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB5271;H:BYAPR02MB4070.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: K0FSGLoGZiVkyldQofygDJW4LkFA+ihYHNR3i6slzdWM+sDVyTcqzXnJfaxl7PkaAi4V52GGUbtwbflP8WF9XVsoanJ5xxFTx34eJvJz0g1P/H5oIj+2GAP77K1fkGxxTF3jquCYqT9qnPqPT6lOunNFgPMU0A+JZqeCiHJ3uTB9WGf2fBZQx2rQ6/4S7OPxwZuWq8E2jqEzTNxTH3WSH9DBZW6KPpwu/pJruEwKQm8f8lzm0SiiKLX0LtBvYxypHkHNRTTHPz+EYi5apW/aNaI2EN2Sk8rTRNzDwF3HtwL8wQ+mV5jYXM0PowrOAo4qkMsO3wSNe8xuoGJeb0BWYOfqKpn4gebje3g7eJ1W88L20ZpffcMyzQgmRhX3iRXMcGEU3TDt7vrL9bCCElxhoXuhUU0Bfs7xe0wn0YFCmlw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dade7b6e-6c4a-49f7-1939-08d7212c8d5a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 02:59:12.8715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oaMa781wSTIxDGaRD94ZoK8bY3QKXgbbv6LhhmbgN23GSJcixjWPcb5J4myOOgSQs1evHAyWODR9imCBvYlkEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5271
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

I need your help in understanding target flag usage in S/G_SELECTION ioctls=
.

I see that some of the applications like GStreamer has the the hardcoding o=
f target flag as V4L2_SEL_TGT_CROP for capture buftype.
https://github.com/Xilinx/gst-plugins-good-xlnx/blob/master/sys/v4l2/gstv4l=
2object.c#L4027

And on the other side, I see that few up-streamed drivers are clearly restr=
icting to use CROP for output buftype and COMPOSE for capture buftype.
I do not have the concrete data from V4L2 specifications. At this point in =
time, I can only share other up-streamed drivers as examples.
https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/sti/b=
disp/bdisp-v4l2.c#L935
https://elixir.bootlin.com/linux/latest/source/drivers/media/platform/rockc=
hip/rga/rga.c#L622
Any references from V4L2 specification?
Regards,
Satish


