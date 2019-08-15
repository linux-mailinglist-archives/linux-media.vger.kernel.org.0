Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C14F38E2F9
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 04:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728864AbfHOC74 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 22:59:56 -0400
Received: from mail-eopbgr810059.outbound.protection.outlook.com ([40.107.81.59]:57746
        "EHLO NAM01-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728014AbfHOC7z (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 22:59:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jq86dZ8Kpv/E/9NxwVdtkihklTUxivIOLWZI4ddLtS7bTRty6+5u/ayZ7uXZ5I7Sm0U2CRcub8GhFpwirB24c1/L3gaoet8vQ13S3Jf/Yat+2hc7exnFzwRFq60k2kE9nPPwpNriwx/Zho95nCQhFLupY9w36PEhfQrDQXQx5+CluGBQdgtrknf7/iGdAd+JmwMfjqhNX0qo9c7sDIQmSjF4vXcaKt7dhuNaXQYIeoRoq6QTj2uOnRD+MsmGomUZoBbuP1awhspy7WARaG8BBlOK/+I9oZ3ZU8H6BAC5ZMKNdVxIWjdQyGs8EOuE3ATLf/QfKQOnYtk523Ty+UDQDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWvdEJ2DZ2KZq8MUFJ+gQy5jFPiXg4vtEsJsROE3E1I=;
 b=M5f9i/YBqOyRfjgoC1e6oSp+y3cSPiU36TslBkUnsQemMOrRGSxOMIhOCBAQtnTfKHywumHbi6MFxYYxnlgUq73OE5xoEHM4xCRVtrlsH7+CVdTNChBcg39AlTHffxaEDW1aJdc9Hlpt+hWYsjNu9loWNbZMk8xvRQx+aYf9CbxIsCaZyBlhIOPgL8CSzFyjl7/bpBMdAhCkp4szz98Qnhy8eU0/0NSfDa9z/A/b/nvquD5BWjfW8mjIT6LT/1qsGkuDDDW0jMoJE7evQSqkXB3U34lQnxEPm18q6OtEznNTdRvOwVVNrEMotxz9Co8Z8Ga3ykIEIJ0B4udGk5opIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWvdEJ2DZ2KZq8MUFJ+gQy5jFPiXg4vtEsJsROE3E1I=;
 b=fraji8EdjbnjZ83NCZJnv79J5zEWlpYVHGq/UyanmFyJXU9IEHy03QjkhPyszfK7bEb1Op8gTVnD03yNBuMCUEZAlXdrhAT0gc68+8G/jtrrnBkWjPkWQf2EU4CGRTuQhJAzuHyDN1uAxGYI84ADWRcKrdp8BzY0CqCuOp5Jryw=
Received: from BYAPR02MB4070.namprd02.prod.outlook.com (20.176.249.10) by
 BYAPR02MB4312.namprd02.prod.outlook.com (52.135.237.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.23; Thu, 15 Aug 2019 02:59:52 +0000
Received: from BYAPR02MB4070.namprd02.prod.outlook.com
 ([fe80::2d2a:8eaa:d7f6:b18]) by BYAPR02MB4070.namprd02.prod.outlook.com
 ([fe80::2d2a:8eaa:d7f6:b18%3]) with mapi id 15.20.2157.022; Thu, 15 Aug 2019
 02:59:52 +0000
From:   Satish Kumar Nagireddy <SATISHNA@xilinx.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: S/G_SELECTION: The target flag usage for capture/output buftype
Thread-Topic: S/G_SELECTION: The target flag usage for capture/output buftype
Thread-Index: AdVSG/UwUmn/zDarTX2WRkdyxNJx/gA+XeMw
Date:   Thu, 15 Aug 2019 02:59:52 +0000
Message-ID: <BYAPR02MB40705A1E677EB5917AAF448EACAC0@BYAPR02MB4070.namprd02.prod.outlook.com>
References: <BYAPR02MB4070A517D6C71196D3414605ACD20@BYAPR02MB4070.namprd02.prod.outlook.com>
In-Reply-To: <BYAPR02MB4070A517D6C71196D3414605ACD20@BYAPR02MB4070.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=SATISHNA@xilinx.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.162.139.124]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c82a5d18-a035-45ca-6472-08d7212ca510
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:BYAPR02MB4312;
x-ms-traffictypediagnostic: BYAPR02MB4312:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BYAPR02MB43122A4DA0869B247BB33B16ACAC0@BYAPR02MB4312.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01304918F3
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(53754006)(189003)(199004)(53936002)(25786009)(6306002)(6916009)(476003)(11346002)(446003)(66066001)(9686003)(81166006)(486006)(6436002)(52536014)(5660300002)(81156014)(316002)(71200400001)(71190400001)(8936002)(4744005)(102836004)(6116002)(3846002)(256004)(76176011)(74316002)(33656002)(8676002)(478600001)(66476007)(76116006)(186003)(305945005)(2906002)(6506007)(5640700003)(66446008)(64756008)(66556008)(55016002)(2501003)(66946007)(7696005)(2351001)(14454004)(26005)(99286004)(966005)(7736002);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB4312;H:BYAPR02MB4070.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vM93w82heove5x244rsJcoVSpwnHlXYGGGowwvgx/cWuK48XegdaJHNrLO50hQNRRt3jvpT76ECPKgwr/ynEw15THeYW7FyRoryXQi9vgzC0fvK7Gis7Yma5jESMPel5LawwBPjBkwgJQirjxKq4e/Pwn+Ulc2wg+OArWq1FYMlFd9x/FgkwyXEgSBY3OjxG8BW8Sb38VjuP19KiSEr7IclbxdyWMMO1/+6dYlW9UoJ9J4HLPw0BjhSr/o4seWkjWL3WmaKfRE04+BIyk0h4s3NNV/jFlT5NbjQ6eRE5wJemDplQW6UIvBRoxwNRRdSYWHKGfQKgCnnyAczPU5PykbQMtoNCmS7KT+3sx44GnPpk9/j+UpjlSmT/eWZEJtcyjyNwgVjSZwfzJTB36z3X9+HWYrXBhDgLGJKScuKRIEE=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82a5d18-a035-45ca-6472-08d7212ca510
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2019 02:59:52.6997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7v9d1Fm5wYYRrCRYWIp+TGjSJdP4BFCqdHnmnsQZrq/6Xv8EPOzGP74vFUBAQK9i7C28zilSUkxo3pc/5n31bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4312
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

