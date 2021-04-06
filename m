Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE833552EC
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 13:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343537AbhDFL5E (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 07:57:04 -0400
Received: from rcdn-iport-9.cisco.com ([173.37.86.80]:49671 "EHLO
        rcdn-iport-9.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343607AbhDFL5D (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 07:57:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=200; q=dns/txt; s=iport;
  t=1617710215; x=1618919815;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=BO+ASfHI32CayPXGw5P9dT/XKHPL+uo/bXVVI6CFq4A=;
  b=ZQOjMpnHT05sLK66PuEMEvowrO2GVgKsJXY6gIH1FWwvG5rwhSLF1DTh
   JPLsOiagNqj7GamZpk1VA67Pq/Tbhf4mUZCAVmR14zMIHNotIXqd+WIZJ
   meNNp9i7AG2uT2yx+KV6e11oDJXOBefFY8c9gR27YKWaeTJqglPAiEvRh
   g=;
IronPort-PHdr: =?us-ascii?q?A9a23=3AP3p/2RWiDUvqo0E5zq1i3nhzHrLV8K0GAWYlg?=
 =?us-ascii?q?qEPgq9Scqml45XpNVDe4vMollLSQIHH8JpsgO3St6nqXnYJp52GtSNKfJ9NU?=
 =?us-ascii?q?koDjsMb10wlDdWeAEL2ZPjtc2QhHctEWVMkmhPzMUVcFMvkIVGHpHq04G0ZH?=
 =?us-ascii?q?RH7PAByPO2zEYnX3Iy70umo8MjVZANFzDO2fbJ1KkCwqgPc/skbiIdvMOA/0?=
 =?us-ascii?q?BzM93BJYO9Rg2hvIAH7og=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AgRIQy62Xd/o9nZ0wRq1EFAqjBeJ2eYIsi2?=
 =?us-ascii?q?QD101hICF9Wvez0+izgfUW0gL1gj4NWHcm3euNIrWEXGm0z/9IyKErF/OHUB?=
 =?us-ascii?q?P9sGWlaLtj44zr3iH6F0TFmNJ1/ZxLN5JzANiYNzdHpO7x6gWgDpIEyN6I7K?=
 =?us-ascii?q?iniY7lvgpQZCtBApsQiDtRIACdD0FwWU1iDZ02CJKT6qN81kadUF4Qadm2AW?=
 =?us-ascii?q?RAYvPKoMfFmImjTRkNARMm7wfmt0Lm1JfRFR+E0hACFw5e2LtKyxmIryXVxI?=
 =?us-ascii?q?WG98u6xBjVynPJ4/1t+OfJ59NfCKW3+7MoAxr2jALAXvUFZ5SnnBQY5N6i80?=
 =?us-ascii?q?wrlt6kmWZvA+1W52nKdm+45TvBsjOQqgoG0HPpxV+GjXaLm6WQL1hWZ7sj9O?=
 =?us-ascii?q?BkWyHE4EkttswU6tMs40ultoFaBR6FvCPx68mgbWATqmOIoGEvmeNWsnpHUY?=
 =?us-ascii?q?F2Us4pkaUj+ipuYfM9NRO/zLpiPPhlDcna6voTW0iddWrlsm5mx8HpdmgvHz?=
 =?us-ascii?q?+dK3Jy+/C94nxzpjRU3kEYzMsQkjMr75QmUaRJ4OzCL+BBiKxOdMkLdqhwbd?=
 =?us-ascii?q?1xAfefOyjoe1bhIWiSKVPoGOUsIHTWsaP6570z+aWMdIEXyoAx3LDMSklRu2?=
 =?us-ascii?q?J3W0+GM7zM4LR7tjT2BEmtVzXkzc9To7JjvKfnebbtOSqfDF80lc+tpOgeH9?=
 =?us-ascii?q?3bV/6/NIk+OY6nEULeXaJymyHuUZhbLncTFOcPvMwgZl6IqsXXbo3m39arNM?=
 =?us-ascii?q?r7Ff7IK3IJS2n/CnwMUHzYP8Nb9H2mXXf+nVzUU3PpcUrv4IJoHMHhjq8u4b?=
 =?us-ascii?q?lIErcJnhkeiFy/6M3OAyZFqLYKcEx3J66ilLi6q2mw9WPB9H5oJRJZE0ZQ7N?=
 =?us-ascii?q?zbIjF3jD5PF3mxXacIut2Zd2wX9mCAPAVDQ8TfFxMau0564rutL5ubxTkrDt?=
 =?us-ascii?q?WuNm7ytQpUmFu6C7Mn3oGT78bsfZ01Sqs8UKtqDAPRClheggBxslpObwcCW2?=
 =?us-ascii?q?7SHj7jkr+ekZQRHe3THuMM2TuDEIpxkzb/vV/ZjdwzTnEbNgTeLvK/sEILfX?=
 =?us-ascii?q?5ooXFft4UYm6GNnD6zL3BXupVHDHR8LEKNALxHCwyZYp5zgb6DQnApcU66wR?=
 =?us-ascii?q?qHlho0Zm3ms2IVi2CJF1zPRdj7RnxAp3tfzqHmtGlRS1zYVUdxZndm2LcNTl?=
 =?us-ascii?q?jusmpv0OONe6q423aQbFxH2e0GLDTZe1IpU3JT7sHy2xiPlDmYE3I6gp0oI+?=
 =?us-ascii?q?zGFbwmN6rew3W3NeSz5Oo7Nu4R+JZuL9b1tOAXFeqZZg+ONTv9YtlZkjC9tz?=
 =?us-ascii?q?IgOCNurmMjnu6t0Br57HKg1Hp6BfbJOlxpS/UaJN6bhlKUD8qgwdF8jdgvu/?=
 =?us-ascii?q?G3PXi0YtmaybvPZzoGMwjNuweNPpUVgIERubh3uKp4HpHdXzeN3HZb3A8mJM?=
 =?us-ascii?q?OxkE8FWqx07L3IJ4cHRb1ZRwtJul4y0NifJkoitQL7RvUzelwglHfXNdKE6b?=
 =?us-ascii?q?igk8tYPmSR4A/rfVWP+SxU+PnIGzaZ3bkBEqQqPCBYblM/5HkKxpLOS6TATA?=
 =?us-ascii?q?GxM+dN81qxPiXjLPtTSK2ZFa4RqRg/6deShOOTfzf53geVvTYTGNM9z0+3Bc?=
 =?us-ascii?q?epRASLEqpU9tb/P1KGiK6j+tSygzf6UiHTUTVuuaRVMUgLKt1egTwjhpAt2i?=
 =?us-ascii?q?e8Sqbrslso+mEukg1PhxrowMy6+2/VEkFNLB3BjphXVTdVNGKUjc6ty5ns6F?=
 =?us-ascii?q?3tpD5f2ZfCE09MftZBX9gIJ7KHXxtTFQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CZBwDcSWxg/4ENJK1agQmBUoFTUQe?=
 =?us-ascii?q?BUTYxiAoDhTmIUJk3gS6BJQNUCwEBAQ0BATICBAEBgRYBgzkCgXYCJTQJDgI?=
 =?us-ascii?q?DAQEMAQEFAQEBAgEGBHEThVANhkUBBScTBgEBNwERAQgYHkInBAENDYU/Ay8?=
 =?us-ascii?q?BoB0Cih91gQEzgQGCBAEBBoUdGIITCYE5gnaKfRyBSUKBVoJfPoRAAoNKgiu?=
 =?us-ascii?q?FObwJCoMKnRuDOwGhNZUVoykCBAIEBQIOAQEGgVQ6gVlwFYMkUBcCDo5Wgzm?=
 =?us-ascii?q?KWXM4AgYKAQEDCXyMTgEB?=
X-IronPort-AV: E=Sophos;i="5.81,309,1610409600"; 
   d="scan'208";a="788688813"
Received: from alln-core-9.cisco.com ([173.36.13.129])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 11:49:48 +0000
Received: from mail.cisco.com (xbe-rcd-001.cisco.com [173.37.102.16])
        by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 136Bnnmt030504
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 6 Apr 2021 11:49:49 GMT
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by xbe-rcd-001.cisco.com
 (173.37.102.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:49:48 -0500
Received: from xfe-aln-001.cisco.com (173.37.135.121) by xfe-rcd-001.cisco.com
 (173.37.227.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:49:48 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-001.cisco.com (173.37.135.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3
 via Frontend Transport; Tue, 6 Apr 2021 06:49:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+jX0lnhKMy2nsg++zcpomlVX74vxBsWO9uYU3ZvXX0KQwoX2NgpYahUJN0B5IDHn+9P+ZZpUgcyYuReods/+8FPXvCxkps3aXAFi2C/2ThZf56+Vab2SR1trVziM2SGyzqbDZXbMf7mLzi1hy+hD1tqvOqn5BmxBjL1u4A+ohCDW00IXPN1wSs3d6tPCtaXQtFYYyn2PPhr4mLgOXl97SglFD9Ylk1B1tfJy+hgrBORyOvL/I1mAakoqJn1WWn9DdSEE5AC93WAYyMxiHAnuLzEl/gGBeEscdjo8BxMzCixJbVYncgj3cSIL8mu+SQjJkGNLdy4BUoiQ+Glas8NSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVDPqCjjR83zgNFazbaBX2X3zfyYS5NZ9xYPK89sS8Q=;
 b=D5IMLQ05CL+fGwP4VFHWf3/q2M9oDIcbm1aW7c9FS9lYHcuK7RD/1hYEtzaBdkOfzrNWZDq5trvtDRi7UyZQwaz/pjDMjucxaphO0NmwFXu+3jr10Hu4xbGQr429xvZHRzPScxwVyhAMZcn67sR4OyRm0ecGV0RxNDVde+L1vPKCKnJuUjtZ6qjdPTX8MTSBmjFBW93vXuH+Y95Qn+pJlcq9wXnDGHFk/cHDJIuGgAEcpOeVXEqgXZiZQT1mHIr4EuVCy2vjmS5PTOcLyZWhw0KGp9Q0CzsTb+NIgQ+EXNgbm6Zi6kB1MndtpYiMRrhsXFxO5R6BymNfQqqCJNjuqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gVDPqCjjR83zgNFazbaBX2X3zfyYS5NZ9xYPK89sS8Q=;
 b=hBJqTRIoUHUFl2LiJj8av4hdCJIO7UplCUhdE8MXELGKKjMzGRuUM7pfT4+ylnY5TzW4afRv78w4K/CTKz7u1gI50pUNWVa+5cX6xcH0xsnnFILx20tTZIzaRnBeC9VUOdC8G0QIEAczpbRMTWvD5bVVc027FrIMkWTlqq+Xons=
Received: from DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24)
 by DM5PR1101MB2188.namprd11.prod.outlook.com (2603:10b6:4:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:49:48 +0000
Received: from DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32]) by DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:49:48 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v8 08/13] media: hantro: Only use postproc when post
 processed formats are defined
Thread-Topic: [PATCH v8 08/13] media: hantro: Only use postproc when post
 processed formats are defined
Thread-Index: AQHXKtrx6FqKd7D7K02ODojzw/XOLw==
Date:   Tue, 6 Apr 2021 11:49:47 +0000
Message-ID: <DM6PR11MB46250FDE1323AF28DBC3166BDE769@DM6PR11MB4625.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c0:1002::b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 275f155d-8640-4841-4430-08d8f8f21458
x-ms-traffictypediagnostic: DM5PR1101MB2188:
x-microsoft-antispam-prvs: <DM5PR1101MB21887382B6C2976507710C76DE769@DM5PR1101MB2188.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9c2tkEzRqIHv8NtQQ2Gc15g1sfq2k037oQVJWqJhOXHY4hbmW6jL1KAFBCKcfXXMJpW7gr1gxEzInvQ4xWGv+ICp5/TolTlZQh13KJlzSPEado5VXZUZvWrFIK4ZFr2uKe7JWJc/MG0X4qN2bmxia3aIYAI9q0zZ4l8/+iJRiaN1J/YE1eH2pkLc7ESfRU+v0AqzCkqwiN9hG4Qk62XjVQlQFC5jL2mFAZcsQIJU5Ko6vNezO2YgIovyeBAy1d8WUXCijoFE8JsoWVNs9Ktjn3CODOKXvDGDx98H7hFS8qxGODRmVqU1JVfu0CVD2ThrLDHOBFk0OrP1PF8VLXGGNfvcLzvflXnBscTI5SRp+WVfHrKV8R8WaOfJ/8LDcz3DL05UGXGC8XQDHH4DV8TUnC7LNPs2kr7T9Cj7uBQGOluKdoJeyaWm6i/E69YDU45LhabLuASjN1jPgq/Bs8vuxSyxozMiHnYmvMyEnueuxoMerRf+jsHyv+FCcbFJD0kO9LAvxuVk5te9yZZSKlgpwRjgmpoc9T9pgUEosk7OySpG2ipGEgvNu+35TnHcT13UTLr6H9DtFE6V0N8KF5eV6KJya0rWqopbRFRRVeoc4pi55O3Q/EmwZ/HJ60YA239t/v2yeDW8wGrmLdiUJ+rv4yen6+1ABv2qAieduDzWKr0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(396003)(39860400002)(376002)(86362001)(64756008)(91956017)(76116006)(66446008)(558084003)(66556008)(316002)(6506007)(55016002)(53546011)(4326008)(66476007)(66946007)(2906002)(5660300002)(110136005)(8676002)(38100700001)(54906003)(52536014)(7696005)(186003)(8936002)(9686003)(478600001)(33656002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?xz61Iyync2yKjWaCFtHquioL2sJpg+9iH/FgkWRhZgWgrR+C4o2B/MbztKV0?=
 =?us-ascii?Q?YD4aGucae6jxbxiNElI1BcksAH6Y0c8r2eTO2qxypZuhrxANBtUAY97iBTnU?=
 =?us-ascii?Q?kj9oe///Mt087mi4ZvsJsBixc+vgAc4hJnHZ1nUxq2EGOsaTOtFJeH+tcJup?=
 =?us-ascii?Q?d3aDkhfD3gDdBZBd0E6zZyzcBrAFdyRMb5Ky0lUS9hugnOlK9E7PChgt+yeR?=
 =?us-ascii?Q?tRGEVkXwVbMCO71K9XLd70CCJs/E1TdXz7sQrIn4sJ1senOs/WgvlUTTI7LH?=
 =?us-ascii?Q?qYeA6y3NcBguLQIaNvNAWUQxj/KjMw+iPZxX9MJyBN3MSuFVydjotMFx5JAj?=
 =?us-ascii?Q?TGyQrYDFKHMp0LRYncgkm7w+aXSa0jR0ZpvwDLbqsHowendHO7i+fLMLkdUE?=
 =?us-ascii?Q?qBepJi+q7riTul8U8Ac4nlmuextUm0qj5gmCMT0a5uPGh+xn3yl2aVXp1gee?=
 =?us-ascii?Q?uE4U/2/LhXnLRO+f/Xocy0hBOIXPycmuXy71hrZIHO3clx8GlVnGEoo4IZdg?=
 =?us-ascii?Q?7NOVuxKEu6bevIEjCql5c3SiEY/nb8mjt8gulkLnonSYPAPWMIH4m8IytI1e?=
 =?us-ascii?Q?bQ6OzSmoSFNpciUplwFkSrL+/XcPc951CR9ilRNylIRaVONO6+uQEhE7yb1N?=
 =?us-ascii?Q?L8O6254GSOQDEIxcumU0OdfzO0Qe0OxGwTVwjidxi+voqZCxumYT5T7gQgxh?=
 =?us-ascii?Q?/cOf2vVPbk1A2pNx7vvf+aP4Gs+uhLeNaC9/ky9e0io9dHdOSj/3gR4HCuYZ?=
 =?us-ascii?Q?M+Z8b++Up7u8cy+Ii8Wy6eCnF1Gi5+QUF8jC+Ju/UBgQS3Dwe4dbDbiuY6XJ?=
 =?us-ascii?Q?NHF+wf0O6E0S8+HvwqRZQVIom0nyYjPSGzw+3BUXvJ9NJGiFV1DGvou0hpc9?=
 =?us-ascii?Q?59ekefVtsaXDoWCiEplVVp+vgLYeEEB7lfgRSHveOsxbAgT/g2vV0WoCAB9H?=
 =?us-ascii?Q?vFNe3Wmf1GHOeiV9RVR/O77GaTjNVXW93o3x8Djk5j4yuv3Hfl9VBGqIEvEE?=
 =?us-ascii?Q?zluNEWW9Y8jFEfz3NFD4vfALje32GEo2G8aHVgJPA2fD6lVhAEUNc6VxaB07?=
 =?us-ascii?Q?IpQNWEVktM4qy/uAtpk49U01yqaSnagFHYbXTAxGW9t6D/cC40qA8oYFQma5?=
 =?us-ascii?Q?g6oD5a2/WKQPpcFUJD8rN8hw/+Oic3IBeclfgQ+EYtxQbmaYg/ty/LLJCd/a?=
 =?us-ascii?Q?C5pzI4/PIOIObImAE+c8YLiGQHVXBHupLJwaBijMSTMQ7uMno6cGzTZyi5dg?=
 =?us-ascii?Q?MwaS7eYRljTpTQ2ztoakosVg75eojjLoI4mG2TL2d2ztMpvM9352LA/uU+Uh?=
 =?us-ascii?Q?nBGx4JYbVhNios0MwdoWJY0ljaArPEgZCIDBuZU0x1mmVzOdkUWsbQ81+uWH?=
 =?us-ascii?Q?h65G/hw=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 275f155d-8640-4841-4430-08d8f8f21458
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 11:49:47.9520
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aM0sYE/vJLT3vQdJSBZl2PdxDMXsfSpnw5dckg9308KLYGNiYeC8xaB3L10plF32Uorp/cO3zDL47FQ5ahxxWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2188
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.16, xbe-rcd-001.cisco.com
X-Outbound-Node: alln-core-9.cisco.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 17:59, Benjamin Gaignard wrote:=0A=
 > > If the variant doesn't offert postprocessed formats make sure it will=
=0A=
=0A=
offert -> support=0A=
=0A=
Regards,=0A=
=0A=
	Hans=0A=
