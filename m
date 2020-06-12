Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34F121F7737
	for <lists+linux-media@lfdr.de>; Fri, 12 Jun 2020 13:20:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726314AbgFLLTz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Jun 2020 07:19:55 -0400
Received: from esa3.microchip.iphmx.com ([68.232.153.233]:26121 "EHLO
        esa3.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbgFLLTx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Jun 2020 07:19:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1591960792; x=1623496792;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=MzeAv/uxP+03PmE8sGcor5TRaIUdworcjSgMGdxm/zU=;
  b=EyaHB6UmUnEOhObHmUGFL/Svo43Iusqyi1eSihTyThCHqYZLy2NdQCGD
   cXV9WvBnBc+HUWj5GDSh1aCF92w7js4jd/kEaAiKIV1uZtsV92NL0buTb
   fmbdjkVy3M3CHC98/4ZvxBZjsHmugEG325spHSiIGUohe4QeEd+Y5OGj0
   5XShIuHdBdvt6I17WHLwrCBj4IcARziEY2SNfbgyR1llaoKsXsPmFQOiV
   vhB+qhVFOWs3hdIkcdI4aiyCAwK42O4qeIN/A2vgz0jwDYejbNaoglU/l
   UXln5V0R16GSE9TGwQ+chx7f0LT3kij4e69OaZdmWVjkAoy4OkDm8FzVW
   Q==;
IronPort-SDR: TlXdqw7HBokRsaptRgqS0yI+GxWUhaGHXLtguS15MR1s9CBroPvJIFf8wP45xt3ucPxcL7v1t9
 k3VL0bGfSR01JgGbPdKhVNHRpXG99q5JvyrzNdN2WUqiLqIY0LK13G2PMjySzXIN/4fBbhDzLR
 KPy7bnpRIzXIxhJ5gtpX1oeESJvsdGrxTsNlhm8kt6E+zKBT5jGGpjgk4XfLtPZPoriyF3Ac58
 RetA8FWKA9gRcd+E3fPLfZ3fO9CTZFD7KTkf9HXP70ZeMjNo+FfsQBfq58nzkUWvac0kXAlHs2
 +IA=
X-IronPort-AV: E=Sophos;i="5.73,503,1583218800"; 
   d="scan'208";a="79852257"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jun 2020 04:19:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Fri, 12 Jun 2020 04:19:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3 via Frontend
 Transport; Fri, 12 Jun 2020 04:19:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVF5QvfcbHSRC0wtBAzk6mnNgB5wa11fhyWcqOs55/xAVVhOcq1jAZwjK5INp5xi8jjPfhFudVD7tlz0R11JM2CRDuAdDEg/E9V5jxS0lFMR5XyiQz8ubuorqRY9duKVmpg6NxyQCpvxUHUnJvkOkbXgegbwYhdY1qYUAOYgscVUmACKSGZj6C6OINloh3FoCszxjmwp3D1QdPl8Zbs1ihbjJTkebJMSBO4taWpleDlIrSPjNAlXi3X5LXgbVJ9LttMokRN1L9Kvm4U+QPsyiZOVuZK9bdd+T8is6SIIaBWGVM0n0738Ik2xj46ccbLBPqD6Oy1EirNbBHwQmDYbWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtE5mJzFD2ITjLh14Q0+u1iHMZX+ApnVyj3ixnSpRvU=;
 b=D71nhHKpx/u916QLmqlUHp1M7qKRryJKx0CjaTW5wusim64VgjHP4cVugdQoxm+dWvASWoqmoKDmH+0XmplG0/gF6G5hKbwaYfYfdIcgIHBt2D/MUQ3ckZgwpQuavjlue/684CpKsHnTSP8O2vRcbSbZ5UFV3Kt1LIhJY/UoO1j9ziF6HgEkraHBrrw9xRYSyyA9oX+OavJQPqU6sHjMpo9t3QrOiIC1XPeqE1DRt167z/e6CckJjIbwFquG7dtTFlL+EHgST7MO1FDDtGwYicUutdjdJR0wdhYxB2CpDlNSp1BkEvrsNTfsTxtU1ZoZ76fEX3SZ8F5GtGddhRzAow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BtE5mJzFD2ITjLh14Q0+u1iHMZX+ApnVyj3ixnSpRvU=;
 b=YgsAK9m1dF3/f9XsMpq7/kv8mJZAyFbFeqXz0az9I40qYsKlnquiw30QZ4d82hybfQUYSss/YTq9OcF9PCMqI9suuuwbFvi74GWlawDHQQZRlTa64uIPrCkpPzLxrBEZH/NI/6G0GEj27iStsu3rJioqCysFBJzSw2i/zcMgu4w=
Received: from BYAPR11MB2999.namprd11.prod.outlook.com (2603:10b6:a03:90::17)
 by BYAPR11MB3655.namprd11.prod.outlook.com (2603:10b6:a03:f6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.21; Fri, 12 Jun
 2020 11:19:48 +0000
Received: from BYAPR11MB2999.namprd11.prod.outlook.com
 ([fe80::a9a1:a786:2e11:a5f5]) by BYAPR11MB2999.namprd11.prod.outlook.com
 ([fe80::a9a1:a786:2e11:a5f5%3]) with mapi id 15.20.3066.023; Fri, 12 Jun 2020
 11:19:48 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <linux-media@vger.kernel.org>
CC:     <lkp@intel.com>, <kbuild-all@lists.01.org>,
        <clang-built-linux@googlegroups.com>,
        <linux-kernel@vger.kernel.org>, <mchehab@kernel.org>,
        <hverkuil@xs4all.nl>
Subject: Re: drivers/media/platform/atmel/atmel-sama5d2-isc.c:323:34: warning:
 unused variable 'atmel_isc_of_match'
Thread-Topic: drivers/media/platform/atmel/atmel-sama5d2-isc.c:323:34:
 warning: unused variable 'atmel_isc_of_match'
Thread-Index: AQHWQH8vHj1heRZtYkSl4nyeGq2n4ajU1cSA
Date:   Fri, 12 Jun 2020 11:19:48 +0000
Message-ID: <328e45a4-ed0b-9ff7-9849-7a68d1a110d7@microchip.com>
References: <202006121424.PByDmwjQ%lkp@intel.com>
In-Reply-To: <202006121424.PByDmwjQ%lkp@intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none
 header.from=microchip.com;
x-originating-ip: [82.76.24.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e507d32a-33d8-4d71-2e40-08d80ec284a9
x-ms-traffictypediagnostic: BYAPR11MB3655:
x-microsoft-antispam-prvs: <BYAPR11MB3655A6D41CD35914B1797BFFE8810@BYAPR11MB3655.namprd11.prod.outlook.com>
x-bypassexternaltag: True
x-ms-oob-tlc-oobclassifiers: OLM:26;
x-forefront-prvs: 0432A04947
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q/Q2rZJ412XoyxeKpy/6P5ChazMBLkqy3muOfzB9YRC5i/lGk6jNS6FCw/lKN9t6ohK7u45A+ICJTvM6GZ6i4F/fQx184Qa/EamYZTi05H67bM8MzC+JOAQIMgkdNSg5FsVrOJl7oFZaKauS2SvKAKGtrPec0vYi09m0cJ6ksWONzT0MgI9d7Yb89KieTC2U4KCXiyChtisbDcecKDS8iZ1ssw1TmUBwpLeARRsmdh/HHKO5p/D9oFau6XbzapytepyDdgDX9XzoCbk8S6Is1V5Pz6IRFZGFcNFuONFdt7TRmauIkT+omDhm45QaJpnynKRrm7V7JoTpF11v89oet1zBBjSj4fpWuo6O6DwuA6SXi8ZATBasu+kSOAu8MMxK5SyQOALvKSypz7hcbEACDLl+cSD3/x6qdiR4ll5Nmm70ARs6s8Omg+IQvToBKlENIk+FlPeAMSR8eh0A69cSxw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2999.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39860400002)(396003)(376002)(366004)(136003)(346002)(66556008)(83380400001)(2906002)(6506007)(4326008)(6512007)(26005)(53546011)(71200400001)(186003)(83080400001)(5660300002)(6916009)(54906003)(8936002)(66476007)(316002)(478600001)(64756008)(2616005)(8676002)(966005)(66946007)(6486002)(31696002)(36756003)(66446008)(76116006)(91956017)(31686004)(86362001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: GbOpwJtmPheB7fy7aBs2EQvsNhT3ZHg11LvPjkUWmJpxYKjT9kih+CihjsQ5nVR4bZ2cbavf+qSZMbhGsFMoP+jprvSUTkzNxJXvfPes8SjkUuX+/xlhPe8nP7vUEnmRMPTJoPXYX2TQ/Dh/iaEudZkMaXKulpfWFVSiuppz2iko/kDOJm/i6Ul+d42txLacsKU1PMGuMP3E4VbJb8Fu5N9VKHJNBv4GeZFmFSeRSJC/H4/6DW9IeJC+/S1BmvhVLdZtzXKfTuNXf9L5Z3QcT63YOjZY1G9WOJINH4fGj1yO8puf1C3bfiSfdefTaig9BK5Pc3lBUH/Wu59K4F5bYOpfN8085jB4W8AuGfB1XFyb62hwnNnJIq63qe4Rf1BsOkzUyJ8Dv9OyIFnxOjoHIbjqfT6krHonVxHt03+F+KHGRZf60JxR1Eym7nJDKo84hGRT6SSF5MaNAOw5Xm+5pNyS1d1n4bbOFHxPWRZqfgg=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <8E156AB7CF1C004690A2DBAC90DDB8C2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e507d32a-33d8-4d71-2e40-08d80ec284a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2020 11:19:48.3790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P0xaAebiM6fzKfkLfhgp0IMHlumg+r55ON+yIthZ3ljZOXdDfZJgp5GzHxBQVgnFFjwPubVeaxYZsz8hCI5wc+5GK4Mm426IPyMHOxnvCjw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3655
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12.06.2020 09:02, kernel test robot wrote:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   b791d1bdf9212d944d749a5c7ff6febdba241771
> commit: 0a0e265515db7619d0da9331d74245d02c741f07 media: atmel: atmel-isc:=
 split driver into driver base and isc
> date:   12 months ago
> config: x86_64-randconfig-a012-20200612 (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 3b43=
f006294971b8049d4807110032169780e5b8)
> reproduce (this is a W=3D1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          git checkout 0a0e265515db7619d0da9331d74245d02c741f07
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross A=
RCH=3Dx86_64
>=20
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>

Sent a patch to address this warning

Thanks

>=20
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>=20
>>> drivers/media/platform/atmel/atmel-sama5d2-isc.c:323:34: warning: unuse=
d variable 'atmel_isc_of_match' [-Wunused-const-variable]
> static const struct of_device_id atmel_isc_of_match[] =3D {
> ^
> 1 warning generated.
>=20
> vim +/atmel_isc_of_match +323 drivers/media/platform/atmel/atmel-sama5d2-=
isc.c
>=20
>     322
>   > 323  static const struct of_device_id atmel_isc_of_match[] =3D {
>     324          { .compatible =3D "atmel,sama5d2-isc" },
>     325          { }
>     326  };
>     327  MODULE_DEVICE_TABLE(of, atmel_isc_of_match);
>     328
>=20
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>=20

