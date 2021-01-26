Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD4B3044CB
	for <lists+linux-media@lfdr.de>; Tue, 26 Jan 2021 18:18:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389280AbhAZROX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Jan 2021 12:14:23 -0500
Received: from alln-iport-2.cisco.com ([173.37.142.89]:47707 "EHLO
        alln-iport-2.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390214AbhAZIed (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Jan 2021 03:34:33 -0500
X-Greylist: delayed 559 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Jan 2021 03:34:32 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3266; q=dns/txt; s=iport;
  t=1611650072; x=1612859672;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iKfQqlWJ/w99NKH3+ar9Xwx1yfBV+8R0YCOohYY0U4Y=;
  b=TEJNaobWwRCr06qoMzgbnWk+VNe9jN+Cvizaar/P+qlYJtQ8gvZVzXYv
   V/Zg66cXmxAtUwiQM7pJVBnum0ox7uftClRFNN95qjdCQrgZX/XFQ5eHc
   yFZmYctKpu04ywARIwuZ/qGzHqOO7D8XVTKLtLwTv9g0hLX0TkpbHMCvo
   4=;
X-IPAS-Result: =?us-ascii?q?A0BZAwBpzw9gmIQNJK1ihCtRfVsvLwqHfgOODAOKHYw3g?=
 =?us-ascii?q?kOCUwNUCwEBAQ0BASMKAgQBAYRKAoF4AiU4EwIDAQEBAwIDAQEBAQUBAQECA?=
 =?us-ascii?q?QYEFAEBAQEBAQEBhjYMhXMBAQEEBCAcAQE3AQ8CAQgRAwECBCgDIREdCAIEA?=
 =?us-ascii?q?Q0FCIMeAYJVAy4BAwunTAKKJXeBMYMFAQEGgTMBg14NC4ISAwaBDymCd4JwE?=
 =?us-ascii?q?j2HCCYbgUE/gVSBWH4+ghtCAoFNEgKDGDOCLIJCgUEXCQJZCj6BL49NqARYC?=
 =?us-ascii?q?oJ3iTCNHYVEoniGI40mVYgsgnOCfI5lhFYCAgICBAUCDgEBBoFtIYFZcBWDJ?=
 =?us-ascii?q?FAXAg2OKgMOCYNOilh0NwIGAQkBAQMJfIoIAYEQAQE?=
IronPort-PHdr: =?us-ascii?q?9a23=3AiXng9BTT6v8V1LDcRdxJx11wSNpsv++ubAcI9p?=
 =?us-ascii?q?oqja5Pea2//pPkeVbS/uhpkESQBNmJ5PdNiu6QuKflCiQM4peE5XYFdpEEFx?=
 =?us-ascii?q?oIkt4fkAFoBsmZQVb6I/jnY21ffoxCWVZp8mv9PR1TH8DzNFLXq3y2qzUVH0?=
 =?us-ascii?q?a3OQ98PO+gHInUgoy+3Pyz/JuGZQJOiXK9bLp+IQ/wox/Ws5wdgJBpLeA6zR?=
 =?us-ascii?q?6arw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.79,375,1602547200"; 
   d="scan'208";a="657867456"
Received: from alln-core-10.cisco.com ([173.36.13.132])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 26 Jan 2021 08:24:27 +0000
Received: from XCH-RCD-003.cisco.com (xch-rcd-003.cisco.com [173.37.102.13])
        by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 10Q8ORUI022898
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Tue, 26 Jan 2021 08:24:27 GMT
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by XCH-RCD-003.cisco.com
 (173.37.102.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 26 Jan
 2021 02:24:26 -0600
Received: from xhs-rcd-003.cisco.com (173.37.227.248) by xfe-rcd-001.cisco.com
 (173.37.227.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; Tue, 26 Jan 2021
 02:24:26 -0600
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (72.163.14.9) by
 xhs-rcd-003.cisco.com (173.37.227.248) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 26 Jan 2021 02:24:26 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PSwYi0CsRzj9ryVB6y1GM6EdSQAD11LbxS1jt5fVFFFo2zrz0UM1uHx4sSgojrW0T0aAQ7aCRRv9dTSEBurn0ODPg9NYeSpt5u5srY+ynipyW36EvDSQZBDRXksvW4xcOHsFfLwCngdyxQ7um2YwLFZkgsGI56W2+59m4GL/C//0RFEMl4ElTZiCK2h3CB0UbI4a0LJ9UlGn7lv/WkI5doCo7wHxZSDlFeSpsVipKSAcgzow2y1F4Ovvnv2g0UBdK5a1OEt65+2wLRQpIpWdrZQfIRnVBm4l3a4bgAH6ZC22EIskIgM+3HmcqvMAfMNLmYZTBh1MwALw1CceL82uhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKfQqlWJ/w99NKH3+ar9Xwx1yfBV+8R0YCOohYY0U4Y=;
 b=IPwX5nGk4LCdeVAz+8s2/hD+ly4UKIvBJ1tMM1nLtru/A4O5dPg5u1f/uCAwVMM0G93Tqd7lkDge4zvC5JxoZqbJSsVwHQkdhjaupH7GVpHLY8M/8c+g0U29UOceMa4eaJU3M+ODN3IGnyR19o5pRiXwKCgv0f/hNmp9achbCPxmgRsSldaAbmoEPJ4ZsbElUAE1ky3NLHmyKS+R0hByMY4M95VF4Vpw2hXfraytpyA6fBDxbyatmj0ghiHARvgkSuoZsGX0ALVjoCRgvmexd/zVYJhARsBpSH0wE3QYoBpEGXuTOQ+5jssPtxWggi1UaeFcDkvQ1K77HwRoP3j+ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKfQqlWJ/w99NKH3+ar9Xwx1yfBV+8R0YCOohYY0U4Y=;
 b=HKbI/a0ZIDWlWux2dobTba5w+LsPwFo+w239QCRxc4Me0EZp8g+XV9s5kQZpCcK5rQG9X7zRn8g2P3CXlbmwxl40lIvzajgo/8VI2iEhoA8rI01GsW12qC4/31bCwTQJ8X40Pnra+IAwFyHz8QKM2L/VnZFnRupclDNXq9sNv9w=
Received: from CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10)
 by CO1PR11MB4996.namprd11.prod.outlook.com (2603:10b6:303:90::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Tue, 26 Jan
 2021 08:24:25 +0000
Received: from CO1PR11MB4852.namprd11.prod.outlook.com
 ([fe80::c67:76f5:efdd:a8e]) by CO1PR11MB4852.namprd11.prod.outlook.com
 ([fe80::c67:76f5:efdd:a8e%6]) with mapi id 15.20.3784.019; Tue, 26 Jan 2021
 08:24:25 +0000
From:   "Mats Randgaard (matrandg)" <matrandg@cisco.com>
To:     =?windows-1250?Q?Jakub_Van=ECk?= <linuxtardis@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: tc358743 - first rx'd frame is incomplete
Thread-Topic: tc358743 - first rx'd frame is incomplete
Thread-Index: AQHW7+yyEOXID5QeX06E4aGcvsEONKo5hQROgAATjYI=
Date:   Tue, 26 Jan 2021 08:24:25 +0000
Message-ID: <CO1PR11MB48527F22C71C8F669D42F2F5C6BC9@CO1PR11MB4852.namprd11.prod.outlook.com>
References: <c6ecd6a7f8a655d6089c3f0dbbaf9fafe11305a2.camel@gmail.com>,<CO1PR11MB4852AC77AEEC87FDB1752E6FC6BC9@CO1PR11MB4852.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB4852AC77AEEC87FDB1752E6FC6BC9@CO1PR11MB4852.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [109.189.184.228]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ffd09334-6b0f-4683-7734-08d8c1d3cadc
x-ms-traffictypediagnostic: CO1PR11MB4996:
x-microsoft-antispam-prvs: <CO1PR11MB4996A58CE5BAF522E1A052FEC6BC9@CO1PR11MB4996.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eXzC6RxHsmG3LqCZ81eP7Phmi2ADRngBnhTkFD3mG39NA/q/ExwwdCQzO5ktn1LOnZo9WWmKocC/o6Tj+lGHWjVB1s0K4Z/dOZnEA7rlxM+UPoyZmJPf4ruYo+qyMT+gqSTlpiL5L+IeWPxk1p1enmOoYD8gpdzcYBo9E3pccb5xrnV1NHHwKWWXP5dx+sHzBkOvMyD96baY4WS9hpQbbzjxI/fg1OTdPFNutj7nX4LlbnFUuBYW/Vyq/9S64tIZScWjLg7jk8UYHCbdxmzXk9Bvo9uGPB/JWUD5XbczHh96ZQMIiRyiGDco2pRuD5sVG8Ia3QXvvHEj29zYLWsHinArA4w/eXlOxj5SM7VGCW5e9uRt5HbtVlJ9Lw+DpZQIoKlCYRp4czLPra4+9cUyxm4M70WDsp7WCQzLupuQ8YqgIgpzt/TASxT4E6vRH15AWCiydNDq/Cf6I1kz0IevOA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4852.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(396003)(346002)(39860400002)(366004)(136003)(66446008)(26005)(66556008)(91956017)(4326008)(7696005)(33656002)(316002)(55016002)(64756008)(52536014)(66946007)(76116006)(110136005)(5660300002)(8936002)(86362001)(966005)(66476007)(53546011)(478600001)(9686003)(2940100002)(83380400001)(71200400001)(6506007)(8676002)(186003)(2906002)(66574015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?windows-1250?Q?T7Q8lb4jYIQsYjRZYbn7h0PKk3Xe8b4G+MxAa4GtK96pOPEeGiKtlxyz?=
 =?windows-1250?Q?2MKNHo0ICyiQpMATKHibRqLaJYLXUZSjs3tGzSmaB3hyV3qTOhCMIYwP?=
 =?windows-1250?Q?WH5/IEkBM0bDqLF1HDMGDTooA8+j0F1ZiGnkIwJS+PWkJUpIQqAYDpab?=
 =?windows-1250?Q?B60XRs37Wq59vmDzKxdcmP6GsX7ZpUHpfY2MbYhctSTQZr4hpDQg+Vty?=
 =?windows-1250?Q?VJg+iHG3P6fBzbnv9xyLtEshDQcjhiQZKQaob8fg+lVDuStZCW25rOGX?=
 =?windows-1250?Q?SOjXuW3Hz9s1YG/LdwpINrMtShxz30uHL+ojkiMYfX6ma/XKz7+GcjiW?=
 =?windows-1250?Q?Q0ZCTKsKBotEfpOy0+jhtLWzjX3pNH6gQfdgPpzcYOXagKNlI0Us3Ks2?=
 =?windows-1250?Q?ap+WCTuG/tQoi8UpYT6a2h7zeQe8ilSD5bk/uqrrrNUnsPR43TkFmsJx?=
 =?windows-1250?Q?23/EsyKahIwdWzb4yYJqa9y8G0q/aZprWu9bYBlQFewwjST8Y6wL8m0b?=
 =?windows-1250?Q?4Ya3W0mQML+sz1ADIsltS+IYuFWC7YKl9Mt+t002wrqdMTfjLRRWbfdQ?=
 =?windows-1250?Q?Fk9eNTW90NuoWL+ZsXzWkceU8JfXTB7Onux2uSxsMBqPehPDf46Br/LI?=
 =?windows-1250?Q?My2UUrD9CXvZtUNvnMcECR9VoMYzKVH3yEnaS0Y8eOzZSvTzHx+nUEL9?=
 =?windows-1250?Q?uDBTl+i2g/fslT/tqTr0ZVUBuF9VZtRKaF0SsMi3z14sfws6gJNoctPt?=
 =?windows-1250?Q?1IdYRXbeOg2GgGUfI7akFXGvxyY5HIdQ637pkjjR8AjzQWpWusm3OyKW?=
 =?windows-1250?Q?nvbSTCvIo048eb92SoNIYHWnXGs7cyyzuUwTcKn6nRcRg1sqVebOtUvu?=
 =?windows-1250?Q?2GHDMf7WcnFWCw4G2qNgvJYXPICClwnakpCiDsKEdQNsb/WixKVexFEu?=
 =?windows-1250?Q?iVqYbYS+GZ/qLQ3I6dwK3/TA2QTzrcoaXDdIE5xNPWcaZJnLYzTqbfCe?=
 =?windows-1250?Q?sw7VRoACTuxlQzeaD32wALgwiKuU4/nol0TUOYK1vUe9CD17g+KxhSlQ?=
 =?windows-1250?Q?ZPd0BOVPz9VAxh+QnKsqSELuSK++z56k48LYb1Pa8dAdv7B9pAoy9MGF?=
 =?windows-1250?Q?ETqb6YJvMCrZnfncEFHQFczK9OuSgKVemvAuWr+BA0jUsg=3D=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4852.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd09334-6b0f-4683-7734-08d8c1d3cadc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2021 08:24:25.7725
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ElAnDGongCgNl3SxVn0v2WFEPQqPJ0WBaD6cjkbaInkp5WwHeW6h4MkAx7nvEbJo005LLIpA/RLmoNgQ0aKFJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4996
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.13, xch-rcd-003.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jakub,
Great that you have found and documented this issue! The product this drive=
r originally was written for skips 20 frames when it starts streaming, so t=
his first half frame is completely hidden. My colleague said he doesn=92t k=
now why the number is so high, but remember there were issues when the vide=
o stream was started. This might be related to other parts of the video pip=
eline.
=A0
Regards,
Mats Randgaard
=A0
----------------------------------------------------------------

From: Jakub Van=ECk <linuxtardis@gmail.com>
Date: Thursday, 21 January 2021 at 12:58
To: linux-media@vger.kernel.org <linux-media@vger.kernel.org>
Cc: Mats Randgaard (matrandg) <matrandg@cisco.com>, Dave Stevenson <dave.st=
evenson@raspberrypi.com>
Subject: tc358743 - first rx'd frame is incomplete
Hello,

I think I might have found a bug in the tc358743 driver.
The issue is that only the bottom part of the first captured
frame is received by userspace V4L2 applications. All frames
following the first one are received without this issue.

I'm observing this on a Raspberry Pi 4 w/ their 5.4.83 kernel.
To communicate with the chip, I'm using the unicam+tc358743
kernel drivers. The chip itself is on the Auvidea B101 board.

I can reproduce the problem by running the following commands
with the HDMI-CSI bridge running (1024x768@60Hz input):

# sync timings between HDMI and CSI
$ v4l2-ctl --device /dev/video0 \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --set-dv-bt-timings query
# capture one raw frame without skipping the first one:
$ v4l2-ctl --device /dev/video0 \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --stream-mmap=3D1 \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --stream-to=3Dframe.raw \
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --stream-count=3D1

Then, to convert from raw pixels to PNG, I would run one of these
ImageMagick commands (depending on the format - size of YUV frame
would be 2*w*h bytes, size of RGB 3*w*h bytes):

# from yuv to png (set WxH to HDMI input resolution):
$ convert -size WxH -depth 8 -colorspace YUV \
=A0=A0=A0=A0=A0=A0=A0=A0=A0 -sampling-factor 4:2:2 yuv:frame.raw frame.png

# from rgb to png (set WxH to HDMI input resolution):
$ convert -size WxH -depth 8 -colorspace RGB rgb:frame.raw \
=A0=A0=A0=A0=A0=A0=A0=A0=A0 -separate +channel -swap 0,2 -combine -gamma 2.=
2 frame.png

The result is that the remaining part of the frame is shifted upwards
and the bottom of the picture is green (YUV) or black (RGB).

In this case, I can work the issue around with --stream-skip=3D1.
However, it gets a bit more complicated when GStreamer is involved.

I have already created a ticket for the Raspberry kernel here:
https://github.com/raspberrypi/linux/issues/4058,
but given that tc358743 is a mainline driver, it would be better
to solve this issue in mainline first.

Can anyone reproduce this on other kernels or boards?
There is some chance that this problem is Raspberry-specific.

If it turns out that the issue happens on multiple boards,
a fix was suggested by Dave Stevenson - implementing
v4l2_subdev_sensor_ops's g_skip_frames() in the tc358743 driver.
This would signal to CSI2 RX drivers that the first frame is invalid
and needs to be skipped.

With best regards

Jakub
