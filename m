Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E8383B9052
	for <lists+linux-media@lfdr.de>; Thu,  1 Jul 2021 12:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235884AbhGAKJa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jul 2021 06:09:30 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:45719 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234907AbhGAKJ3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jul 2021 06:09:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1625134018; x=1656670018;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hqtKaaUgR8TfTh+TLoRfep50KVe1rmfpBR59CPYQfhc=;
  b=hjUsq61s/LlX1WuMBc0u1jq8Z3uqYvVPlw68dzjmMmrbJ8AbaZ9J0G7c
   cRYXNd9XNZbEJ2THuINRzk9hEPLKrrtZs4SZNcN+fhTQZvOH7WVWvmfB6
   o7mb0vwbtF5csj4BpxudfuIp8OLClt9AoPqs8ttBaAGV7NL+84jU+wxt8
   EHbE88akd9ORwHAjDAlJWmg1encFZ4ugQoQWgfY/qFzXLc8nPcj6ozOoj
   kwMZ968QzaDe4Q8FpsCiRRD/rVijw+G2ez14A7ak0WEzw7R/eOIKC5fzv
   /zWTEB0LmB9affXS7gjEtkgGvrdA8/U89Y5NU7wLRduKNPbacBTmNN5Lu
   w==;
IronPort-SDR: zXUZRTgu/pla2ydPagNdFVqyGTXqL/a69VpAtegXJTRb81hct5qvy9u6DbpX+UVl8/COxZl88m
 iXr/LeD8aMlQmBRVOTleRhRnLlwjFjLzoSFja1wFChcVo5eimxbCmCwc+Pdthm9h1ed09VyrPz
 ntgaSjWoOMMTLHv+ep5EzCaJi5xTyhmzTo7PsvegEVhs+r5LN2AuvXqsa9IK79kbm2Bjutsb3k
 ShBJ+2JXLmwjH9AU1CbWqZajyoKNIujlY7LxoPR2Ilr7MPP6GzDXNEGGt5LvTGX6Db8RqmJqk/
 lQY=
X-IronPort-AV: E=Sophos;i="5.83,313,1616482800"; 
   d="scan'208";a="134216811"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jul 2021 03:06:58 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 1 Jul 2021 03:06:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Thu, 1 Jul 2021 03:06:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LmkuwTj0oHdjh0EAEtSvSjbamUaG04ZFyQcR0aZNCZB6PVFZSLNTAoUPJP+yzz9QS3keFHTpmSmzC9szuTeiby30Xw6DjSMX+ACbqY1tOMM3IE4yEC4K5Tu49zDfSdk4nItq0nfyqP/VIqcqbun0+mlHxnNjocrkGmqm/T+L2IJNrQIKu390Rymoz7HQi/+C/pJZiP5dLUMI2QOruHbwIzhjqBn3V6rrWNZZMeQh/PLBk46u/Os7XPT30eXwiSvwu4Go+gEnSNtrONMGIcllyCsO+0Gzzet+NHZ/n+qRX4tnizc7ER/r9JskV2O70/vXS3hMlYP2K7WkFc8hS7V7cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQPmuCDk2sZH2lkYOEWAEFYA3UYDsynR1HjpuDljkXI=;
 b=eSTM4lzLA62LoMO3FSlnUIIkCXfQDS5/z11ojaBBH+O7/bacysL5gc7RfLT9xaDw3BiRw+0kTpEcvs/sK/wfViEn9YqAc2bLWbpwGHUF4rFgOiQUYheu0p+PHVr31j4LP0QQhipPUkjihhkXE///L4Msjha2t60817+pRyXe9L+Hw2OLqC9jdXTkJGVlMu6IujnTYmS7MjJTSATVwmfpibp3UOg2NTn0JtdU0Cu/0fZP6ONa9C1y9LxiT566j0Cdj3ktG0fVTYWHJfUg2LOoAHeXDVPq6nXrTddp3J+FecpbdR1iVLR5jbwN3Ddo3dYdfvW/Lan1KKEpSJ58YAFw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YQPmuCDk2sZH2lkYOEWAEFYA3UYDsynR1HjpuDljkXI=;
 b=ZxhxtQ6LYhACWO46/zK+TtEuC21t/CgVIvBk1UloILTP9iGJ0H3SV+6WTLd6hdV2XHXk8KlYpwfIFjIjd/ySEINeiofFvT4wPhHXU9kfwo606gkISHuE+BVPW23Lo+VEd4tsulNVE3VQKU5n20FQDVs0NhqOmOf+YiSkKSQ5yFo=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN6PR11MB1908.namprd11.prod.outlook.com (2603:10b6:404:103::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.23; Thu, 1 Jul
 2021 10:06:53 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12%7]) with mapi id 15.20.4287.022; Thu, 1 Jul 2021
 10:06:52 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <hverkuil@xs4all.nl>
CC:     <lkp@intel.com>, <kbuild-all@lists.01.org>,
        <linux-kernel@vger.kernel.org>, <mchehab@kernel.org>,
        <linux-media@vger.kernel.org>
Subject: Re: nios2-linux-ld: atmel-isc-base.c:undefined reference to
 `__this_module'
Thread-Topic: nios2-linux-ld: atmel-isc-base.c:undefined reference to
 `__this_module'
Thread-Index: AQHXbYKEAGfnChAOPEi/GiNVPrjIeKst5psA
Date:   Thu, 1 Jul 2021 10:06:52 +0000
Message-ID: <be5820da-19a6-7119-94d3-46a1ac3b83c8@microchip.com>
References: <202106301531.2BaYyZUI-lkp@intel.com>
In-Reply-To: <202106301531.2BaYyZUI-lkp@intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: xs4all.nl; dkim=none (message not signed)
 header.d=none;xs4all.nl; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [94.177.32.157]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 735b79c5-a8e6-4676-374c-08d93c77f342
x-ms-traffictypediagnostic: BN6PR11MB1908:
x-microsoft-antispam-prvs: <BN6PR11MB1908371D61DFA49D73B7A3A4E8009@BN6PR11MB1908.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LeD8U6TM2JDUs/Vy0v1rYvDPIW0Uqhf/QRwUwSqkrKnyAYqC+gWUsmsWX5GphC9cBk8nOIFtmJYBSaCsQfYT1NbcCrYvtRe+b1/zfO+l82LIbV61UIBw3w/D/MXkdmdTcJTudUHXWQ5LMyOXWJ7oOJlo9CUrnpojAToy4lEH6bpGlvpTtHAHtjym2sR9+HEPu2FEePOM63Mc5m0y5lNR9nz4Lera7XIpEKlj64TZo2kjhzB2PTsehM/vkkp4noVi7h5CSTZXfUR+glfEjcCiA81r3WhZIkuAGYo84ezq9d1HmvgoJooj9OrN+/z4dphIGDZ3QCYGRLYMoNRNuBVs5zar917NFmMBwZI1uH3H/1UqlMvPv2QzVXlSiede8+E54kH+uCqMWAbJkgaJT97s+Tif11nFxCvYTBX9OM0ZbzGslUBfX1wRo83U4Ipn3FFaYGegGL0ULu4nOWNNEivskLncrCgG8rf/KRZnTorV5xTqdLg8dDm/Qa175PBzIvwGiaZYvU97MvsQsL3J6a4Dq/wzfdNUlaG3GadH17U5XV545QWN1r/NiDlC2sM0AHNtHosBE5bZMVd/sv1OSGUAe9OPqiBoBV6rBuXA8B1IArHeUhvXdbsDHZ5WQL9ukQQb4EHlqUikg43FHdSLYiLyxyaR+wd8iVkYgOCxmylm/D1d+5ZH46LbDztFFsOGZiyOTUzFG6qtI3E9nENkzEWHE4JbyveAoOWasGsc3ZfLQ0Andnt07+Df5YS4ynwCPusmKjfrJpZwL/hYy13ArnfFqI0CF3kMRVg86fW5KgRL7QrqqbgRKK7KHCDzEPWuIadsoQiZnStldVjavY9KtrY2TJkT9iYGISsBBOToGkdtQSgzXGIy6eiCK6EKELVhViYQKgPmSTFylgT/yD15Ui58OQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(39860400002)(396003)(136003)(346002)(376002)(36756003)(6486002)(6916009)(6512007)(2616005)(8676002)(38100700002)(966005)(53546011)(91956017)(26005)(122000001)(6506007)(76116006)(31696002)(5660300002)(8936002)(66556008)(66946007)(86362001)(66476007)(64756008)(186003)(316002)(4326008)(31686004)(478600001)(66446008)(71200400001)(54906003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?rc2OE9l2tvdAflKJucfHRkGvGOLp/OW5oraCkTpewq69FltPIiEu6t3b?=
 =?Windows-1252?Q?mQE3SYyIUI7NoBjp4BuiU2XaZmor1QVfUGAKVHm8ntGgwGXFe9LryaIz?=
 =?Windows-1252?Q?DrK3+CqH/bGt4tWtj0qPGiMpXPyYU/Z0aePKQJrW1PfZ1fULiNDcTGlx?=
 =?Windows-1252?Q?UoSbK2bmnwtOqtCwKyKf4GYlolRIs5gK1cqRrNlGe43Ee/PzBnHwFTaY?=
 =?Windows-1252?Q?eWuuanSsozafBidjczdWbAsTJPihlJrlSi3ih2Z9/omj11BrzuS1iP1I?=
 =?Windows-1252?Q?In0TtZIPM0MCB3WD0QM5tbVZhD8gacEm9ZPy310O2ONfkLoA5nzHdVZ2?=
 =?Windows-1252?Q?k9MSicljOXQqMl41772gBVbRQUyfpOwlICPgzEG33yUd1TiRvwjwDlMt?=
 =?Windows-1252?Q?wb0vXK1iv+mQI0LXGpkTj/h89W0qbeptfXRxu/nM3CZrKx4R57Rdngr5?=
 =?Windows-1252?Q?rqnc4M/2999KcRv4aNEb36bv8cyL0kwQmrCLPVWC3pZMsKuzR6gTnTvR?=
 =?Windows-1252?Q?9eBMDtSTS6qNa+AJUYbZXz3ZbC3gbvCW2la/4wl95pruo5vhG4mzTTew?=
 =?Windows-1252?Q?lHv7GHG+EC1+VxH7m6317daXoRS/Q5XDZ4UmVjLCZCcv6XmHqLtm6uri?=
 =?Windows-1252?Q?Zr2gfFIZ5kr+pmh6z2XbML7uG+69xtIdCGpKX4/eJ0BEwguUiDVG1bsj?=
 =?Windows-1252?Q?NQ2DxujdDEAOsp0dcotHVImRI/5Yu3B+/o3gV38EZOS2GWeBxEnv/VXI?=
 =?Windows-1252?Q?lZOY3DqW6kWPy+SPBgsfw3yvdAkGqv29OnNteFDBNJaOlJ6zYOwfnjYq?=
 =?Windows-1252?Q?qBSHtfiJaondLyG3UzMxWXTJoL6v0n9/cLCu4nd7oP3EQ3gQwCZLqHCN?=
 =?Windows-1252?Q?MHYreAxIQy0YoP5h+u7adf3c/TkbKuUstrdTK7S2xjSqx4CBcd48ey4S?=
 =?Windows-1252?Q?LLKmN5NILhBeldOKit5p5CujT5rIOuFhpBAkSqsYiKlmr5sJLqkB/m/a?=
 =?Windows-1252?Q?SdueZWlO/NLtc3WVlVCENK2H2i856hQg3H6RVhTilAkU1hY+h74OdbE3?=
 =?Windows-1252?Q?z83Br5JG/yvNI0S/v4zFLLXzKjQVI8HfFf4PlrMOvxfWHapDICYjbYe3?=
 =?Windows-1252?Q?JbGp2oQAWJg2d8GbL/jQvMSRDE9IkJ2CMw7ZiGnwaalu9xfMsBvt2QIG?=
 =?Windows-1252?Q?50gMfplwgnH5/Mn1M2iwLv/LaVv7skTizSMnnpuXQL5n76WZ/g9h0oAG?=
 =?Windows-1252?Q?ey7o9cLyMtosNc91L7tpbYWQjGiy4ABvNgSjsfezeDTd29n2Oqw2cMFa?=
 =?Windows-1252?Q?V0uXfJjmgGwOHYKnPuuPo2uG7suDit+UER9wyQCqwC+2qD5hSTqFTCod?=
 =?Windows-1252?Q?2PieCnYIpSJogl9GHzL2eZrPyKCqVneHCWY=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <039BCBEDB1D2204DA1641434319561C8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 735b79c5-a8e6-4676-374c-08d93c77f342
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2021 10:06:52.9006
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LAMIe/zs8NGVI0vA989EbsnZy2gilk+CmU+eIXjkMSRfPiNMce3uZwsus+GcqstM8GFgQN31Jr/PH6yLRylCOsDCXriWfcZT4PSwytzN20o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1908
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 6/30/21 10:34 AM, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   007b350a58754a93ca9fe50c498cc27780171153
> commit: c9aa973884a163ecb6d5d4d3be9137058adcaf8c media: atmel: atmel-isc:=
 add microchip-xisc driver
> date:   3 weeks ago
> config: nios2-randconfig-r035-20210630 (attached as .config)
> compiler: nios2-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git/commit/?id=3Dc9aa973884a163ecb6d5d4d3be9137058adcaf8c
>          git remote add linus https://git.kernel.org/pub/scm/linux/kernel=
/git/torvalds/linux.git
>          git fetch --no-tags linus master
>          git checkout c9aa973884a163ecb6d5d4d3be9137058adcaf8c
>          # save the attached .config to linux build tree
>          mkdir build_dir
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cro=
ss O=3Dbuild_dir ARCH=3Dnios2 SHELL=3D/bin/bash
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>=20
> All errors (new ones prefixed by >>):
>=20
>     nios2-linux-ld: drivers/media/platform/atmel/atmel-isc-base.o: in fun=
ction `isc_async_complete':
>     atmel-isc-base.c:(.text+0x279c): undefined reference to `__this_modul=
e'
>>> nios2-linux-ld: atmel-isc-base.c:(.text+0x27c4): undefined reference to=
 `__this_module'
>>> nios2-linux-ld: drivers/media/platform/atmel/atmel-isc-base.o:(.rodata+=
0x414): undefined reference to `__this_module'
>>> nios2-linux-ld: drivers/media/platform/atmel/atmel-isc-base.o:(__param+=
0x4): undefined reference to `__this_module'
>     nios2-linux-ld: drivers/media/platform/atmel/atmel-isc-base.o:(__para=
m+0x18): undefined reference to `__this_module'
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>=20


Hello Hans,

Could you please help me to solve this ?
The cause is that both the XISC and the ISC have the common file=20
atmel-isc-base.c and building one as a module and the other as built-in=20
is problematic , as atmel-isc-base.o is only built once.
One solution is to enforce the other as a module if one of them is=20
selected as a module. Do you know how I can do that ?

Thanks,
Eugen
