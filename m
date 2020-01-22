Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72D63145CED
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2020 21:13:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725933AbgAVUNq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Jan 2020 15:13:46 -0500
Received: from mail-bn8nam12on2058.outbound.protection.outlook.com ([40.107.237.58]:47424
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725827AbgAVUNq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Jan 2020 15:13:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMg9T0f5g+SqaO2LwEwk+DZXXDfqYJwbsK3YY7/a2LxQEjJqzePK3EZSe4XpxHFgt4lgndfNVFtNO5ykErLLQtaS2JsYpOKpBY1+Ff+eKlXGfr1Sdr5GgHst+pYuJDGVf62TjCSymlQuZzyOAilIN3BcG0RVtBnqhS9fp5EpFvATq3ooSYbKtTD/AgAbJJSDDq517XINWjzfWokR8HDXGymKw6HWyaVRhagOJ8Ldh0Ba2hOO3DyxMggEXz+q5ptEkOtMT5bPlFM1d+YoNWTxFT1jQNSeBFJhZTYqAXyWri9lGR5hAK/R4RBLZeaH6MzxZk2dE/YEZZDHNg6rvPqKQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDkRa4dGMApD2yiuJjm1uwEhcBhUOOsUcq5bmZkmacU=;
 b=ULC8k7Iik5g26p7wQ0GMTtwY0pKfCeT+BYR1zyCNOF4DHvsKs8Bi8BNtd6zabTc/2lHNO3MQ+CLy4byjCqLvK11V6crraKbopX8jTKRMOmVEj2ArkZZIcAV3SWtjh3MSRjTudPPcFODYXE+xPzpyv7CHLVrMFX0eqY/i0BPwYrixtJzTlV+wMQCqEVnSBsGV5W2ZWEdAHO9z1wl/mDbM3GR/ti+Q4JjyFhQOEx8VhpDimnHasXxmB/Vk1BZHETt5G/lUH84JzfCNXWeeMyH60NNv/WTO0HWX6aaeCyl5XF6SvmX8O4LiI+4Q6MdICb4FW6xFVbOfYdtGYkbopEG9sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDkRa4dGMApD2yiuJjm1uwEhcBhUOOsUcq5bmZkmacU=;
 b=hc6s9FjbONpafNRqXLKYKvI3kzyqeBuBBnfXAOw+gRUZ2tFg3AIukZcOH92u5aeo1NRtqqrGqnzGHpZcuWyR4K95wgVioDqEZAprAlfw373jyCcVR+pVejV2/6otm+RNcVgPHYcbYvUn+WA8y6C7rvOGB17YK/Q7J26XnhRZYaI=
Received: from BYAPR02MB5702.namprd02.prod.outlook.com (20.178.0.221) by
 BYAPR02MB5574.namprd02.prod.outlook.com (20.177.229.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.24; Wed, 22 Jan 2020 20:13:42 +0000
Received: from BYAPR02MB5702.namprd02.prod.outlook.com
 ([fe80::a9d0:f3e1:2bcc:9088]) by BYAPR02MB5702.namprd02.prod.outlook.com
 ([fe80::a9d0:f3e1:2bcc:9088%4]) with mapi id 15.20.2644.027; Wed, 22 Jan 2020
 20:13:42 +0000
From:   Dylan Yip <dylany@xilinx.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Varunkumar Allagadapa <VARUNKUM@xilinx.com>,
        Madhurkiran Harikrishnan <MADHURKI@xilinx.com>,
        Jianqiang Chen <jianqian@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
        Cyril Chemparathy <cyrilc@xilinx.com>,
        Vishal Sagar <vsagar@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Subhransu Sekhar Prusty <sprusty@xilinx.com>
Subject: [RFC]  V4L HDR Architecture Proposal
Thread-Topic: [RFC]  V4L HDR Architecture Proposal
Thread-Index: AdXRXtbkAv95ZhGhTwC1gbHX/gwgWA==
Date:   Wed, 22 Jan 2020 20:13:42 +0000
Message-ID: <BYAPR02MB57027075B640D2F530E890E8B00C0@BYAPR02MB5702.namprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dylany@xilinx.com; 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3afbf65b-8e68-4249-171a-08d79f7793c7
x-ms-traffictypediagnostic: BYAPR02MB5574:|BYAPR02MB5574:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB557456D4A48CF100EF4453D9B00C0@BYAPR02MB5574.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 029097202E
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(366004)(136003)(346002)(376002)(39860400002)(199004)(189003)(316002)(86362001)(54906003)(5660300002)(478600001)(9686003)(55016002)(110136005)(2906002)(64756008)(26005)(107886003)(33656002)(6506007)(76116006)(8936002)(66476007)(8676002)(81156014)(4326008)(186003)(66446008)(71200400001)(52536014)(7696005)(66946007)(66556008)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:BYAPR02MB5574;H:BYAPR02MB5702.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9L9pqjn2mjdDblaZdvdaqtgvX36bH2gHoKgzSEeZ26DJF5ZIRAv7zNT6/mdor9rhU8P685H9jXGnny/KzufOPRVDVRmneA9GgYNlvJX9Hy7T+rqCpI/MFetsFdl0Ma91lBuM5ZRUvwx9W3CrVaHinDxFPUkdSnMkE+C+0FbWavxTp4hXeJLw8tkQ0WViRTo9NN+cQIHLQmBmF4Hm0Jtsf2ra1sxLjyPioh01X/u0PxwgTYZz6kjwhhd41K0sOJpQ7nK8fypOUWbbLSTlsU/IB1fQFuOhDhlFeChS+Ycc5J5O31vQjv0fCmUrDi/W5Pv67G/9CGhkhDCtEKSNVVmQARrjsVh8cmD6HvqQMry9DhGx7cR5QO4HSvA4ImjiXBTHkYkqqX2NU5QdyQGQezNAP8hYY3U/b87P7bP8mh9o4PLzYPi5qxQp0N1a4oHOzt5iy3BDVRpKe5reyHjOi8hKqJQM4pG9K/2uzxUQ8n9nGpk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3afbf65b-8e68-4249-171a-08d79f7793c7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2020 20:13:42.2878
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AsTLIFkz7UitKd+auD77kr2hGOuX3BD4VITczhWDVIW0RC3FhobSnEkaOGfFvMlyR/HgOlHipbl8TPBCTcpOFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5574
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi All,

We are planning to add HDR10 and HDR10+ metadata support into the V4L frame=
work and were hoping for some feedback before we started implementation.

For context, Xilinx HDMI RX IP currently uses a AXI LITE interface where HD=
R metadata is obtained from a hardware FIFO. To access these packets a CPU =
copy is required.=20
We are in the process of migrating towards a AXI MM interface where the har=
dware will directly write HDR metadata into memory.=20
Currently the HDMI RX driver (https://github.com/Xilinx/hdmi-modules/blob/m=
aster/hdmi/xilinx-hdmirx.c) is modeled as a v4l subdev. This is linked to a=
 DMA IP which utilizes the DMA engine APIs and registers itself as a video =
node for video data.=20

HDR10 will only consist of static metadata which will come once per stream.=
 However, HDR10+ will have dynamic metadata which can potentially come once=
 per frame and be up to ~4000 bytes. We would like V4L architecture to be f=
lexible to support both.=20

We have 2 different proposals that we believe will work:

A. 2 video node approach (1 for video, 1 for metadata) - This will align wi=
th current v4l metadata structure (i.e. uvc) but will require our HDMI RX d=
river to register a subdev and device node
	a. Our HDMI RX driver will register a v4l subdev (for video data) and a me=
tadata node
		i. Is this acceptable?
	b. Applications will qbuf/dqbuf to both video and metadata nodes for each =
frame

B. 1 video node approach - This will avoid mixing v4l subdev and v4l device=
 node functionality inside HDMI RX driver but it strays from current v4l me=
tadata architecture and also changes v4l subdev functionality
	a. We would add a "read" function to v4l subdev's
		i. This will also require us to add some "capabilities" field to subdev o=
r be able to query for the "read" function
	b. HDMI Rx driver will register a v4l subdev with "read" function/capabili=
ty
	c. Application can directly pass a buffer in the "read" function to HDMI R=
X subdev to obtain HDR metadata
		i. We will need to pass subdev name from application or be able to query =
all subdevs for this "read" capability, is this acceptable?

Please let me know your opinions on which approach is best or propose anoth=
er approach if these 2 are unfit. Thanks

Best,
Dylan Yip
