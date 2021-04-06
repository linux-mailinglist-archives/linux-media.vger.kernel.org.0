Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 254DC3552D9
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 13:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233105AbhDFLyh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 07:54:37 -0400
Received: from rcdn-iport-4.cisco.com ([173.37.86.75]:61002 "EHLO
        rcdn-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343557AbhDFLye (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 07:54:34 -0400
X-Greylist: delayed 331 seconds by postgrey-1.27 at vger.kernel.org; Tue, 06 Apr 2021 07:54:34 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=421; q=dns/txt; s=iport;
  t=1617710067; x=1618919667;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=FelUGYeZtnQ6JTzSDeqa/wrHyU7frpBoDV1aHx3tI1U=;
  b=WJh1EvqI8IQ0lpBIPpN/3UZpWMniLBKta9jK7Ok7KOr3MLeVQd5q1Nf5
   9b8ywzLJMPmeQ9rRssZ0yiaFXZH4NuNOe3IpS7hMKMu6QXGHs+PasUT3F
   bMQdPX06HheK/wWE/VXrvYFIPZlI6PNESF9wxWmVlyAC+FG73Uvt7YmTR
   0=;
IronPort-PHdr: =?us-ascii?q?A9a23=3Av6shMB25CRamz97RsmDPU1BlVkAck7zpIg4Y7?=
 =?us-ascii?q?IYmgLtSc6Oluo7vJ1Hb+e4FpFTOWYHS4fVegqzdtKWzEWAD4JPUtncEfdQMU?=
 =?us-ascii?q?hIekswZkkQmB9LNEkz0KvPmLklYVMRPXVNo5Te3ZE5SHsutbFrWpnS46iQbX?=
 =?us-ascii?q?B74MFk9KuH8AIWHicOx2qi78IHSZAMdgj27bPtyIRy6oB+XuNMRhN5pK706z?=
 =?us-ascii?q?V3CpX4bE9k=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AvR2wW6tMsMv6/DA8AEZwlSmi7skCJocji2?=
 =?us-ascii?q?hD6mlwRA09T+WxrOrrtOgH1BPylTYaUGwhn9fFA6WbXXbA7/dOgLU5FYyJGC?=
 =?us-ascii?q?3ronGhIo0n14vtxDX8Bzbzn9Qy6Y5JSII7MtH5CDFB4vrSyAOzH888hPyO96?=
 =?us-ascii?q?61jenTpk0dMD1CQYsI1XYfNi+wFEpqSA5aQb8wE5SB7sRKzgDQBUg/RMK9G3?=
 =?us-ascii?q?UDQqz/vNXNjp3relorABQg5QmIg1qTmfHHOjKf2QoTVC4K/Kc6/QH+4kDEz4?=
 =?us-ascii?q?iAk9X+8B/T0GfP849b8eGA9vJvDNGB4/JlUQnEpR2vYO1aKti/lRQUhM3q11?=
 =?us-ascii?q?owitnLpH4bTopOwlfcZHu8rxeo+ySI6kdV11bYxVWVgWTurKXCLVpQYacs9O?=
 =?us-ascii?q?EpECfx0VYqv913zctwrgSknqdXFh/JkWDc4NXFRnhR5zKJiEciiuIagjhjV5?=
 =?us-ascii?q?IfYtZq3PUi1X5Sea1weB7S2cQCKq1DHcvc7PFZfRexdHbCpFRix9SqQzAaAg?=
 =?us-ascii?q?qGalJqgL3V7xFm2FRCi2cIzs0WmXkNsLgnTYNf2ujCOqN00JlTU84ta75nDu?=
 =?us-ascii?q?tpe7r2NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLsF0YU1g5aEdF9Dr2?=
 =?us-ascii?q?Y9dwbPBKS1rd522yGIZF/4cSXmy8lY6ZQ8kKb7XqDXPSqKT01rnNCnp/kZH8?=
 =?us-ascii?q?3HS/e+MJ9bGJbYXC7TMLcM+ze7d4hZKHEYXsFQkM08QUiyrsXCLZCvtuGzSo?=
 =?us-ascii?q?eWGJPdVRIfHk/vCHoKWzb+YO9a6FqwZ3P+iB/NH3fkekn1+4NsALHXltJjj7?=
 =?us-ascii?q?QlB8lpiEw4mF657saEJXlpqaotZnZzJ7vhj+e8vmm5/WHB6m1zIRpDBkNJ4L?=
 =?us-ascii?q?HtOkk65zMiAgfRS/Iuqt+fcWdd0D+sPRlkVf7bFwZZuhBq466tNoeRwiojEt?=
 =?us-ascii?q?qjNWqfgxIo1TS3ZqZZvpfGydbue5s+AJpjZbd4Eh/TEQdp3Sxwrn1YVQMCTk?=
 =?us-ascii?q?jDNz/nhKm/lqYIDOXHe9QUunbzHedk7Vbk8WSVv4UGW2YSVT/Ga7/pvS8eAx?=
 =?us-ascii?q?5vwmBX34BaqryagjqrIXY4m40DQSNxQVXSJqlHAgSDbJhTgZbxdmhLPD+3rA?=
 =?us-ascii?q?3frQ0vcWz38EhXoWrtIUSvCKv2K2sYnGxE2aD3914xTEGhRgZbb3B3tpAVLx?=
 =?us-ascii?q?Wchl96zfKLaq2v02GYd1sFxaUHPCvYZCYJSzketuyfxVqbni2PGm4hwYhrNu?=
 =?us-ascii?q?vBDK47e7WWwX+1LpaU/Jt2VMN87dJgNNr0tPUMXv/acwiJLCngA+dB4X3dml?=
 =?us-ascii?q?81fC11omIji/XmxVns63W5xmc2Bb7XLE59T78WZ9Ga4G6MfYfB7LxpydY0t/?=
 =?us-ascii?q?C3KGP/d5qPzrzWdSdKLlfLunGtJttY3ax8rOY3rv9+DpPbWTzH2DVO2wg/Nt?=
 =?us-ascii?q?79kAcbTL5g6L7MN4dzd6UpCmhk10tskM7KIFogswTwDON7Z10rgnPBN96C4r?=
 =?us-ascii?q?bDq9MUczu8jRq1PUPa/zxW/v/DUSfGyKUTDLgoJ39KLEc783Zv8Yq5BsDtIR?=
 =?us-ascii?q?Tvc/sG+lW0MnWwKuAADKeEHKgdtRZ87ZWDmfSNey/xxQDXun96L8t1ghSaaN?=
 =?us-ascii?q?L3BBjJH+hCt8G+MxCLhKCh5caoljf5STehcS0j9Pp4XF1Vat4GkyUoiY08zz?=
 =?us-ascii?q?O7RaP2qF80ilc220AVqnf9noy9pHrBFU5IMQfFkoxbUDlaPH+Pl9nE+4GjpQ?=
 =?us-ascii?q?HAySkA34LCGkdWdsxPHNZVTpGfFVYfFfQt?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CbBwAmSmxg/4YNJK1aHgEBCxIMQIF?=
 =?us-ascii?q?HC4FTUQeBUTYxiAoDhTmIT5k3gS6BJQNUCwEBAQ0BATICBAEBgRYBgzkCgXY?=
 =?us-ascii?q?CJTQJDgIDAQEMAQEFAQEBAgEGBHEThVANhkQBAQQBJxMGAQE3AREBCBgeQic?=
 =?us-ascii?q?EAQ0NhT8DDiEBoB0Cih91gQEzgQGCBAEBBoUdGIITCYE5gnaKfRyBSUKBE0O?=
 =?us-ascii?q?CXz6EQAKDSoIrhBu9JwqDCp0bgzsBoTWVFaMpAgICAgQFAg4BAQaBVDqBWXA?=
 =?us-ascii?q?VgyRQFwIOjh+DcIpZczgCBgoBAQMJfIxOAQE?=
X-IronPort-AV: E=Sophos;i="5.81,309,1610409600"; 
   d="scan'208";a="856970986"
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by rcdn-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 11:51:23 +0000
Received: from mail.cisco.com (xbe-rcd-006.cisco.com [173.37.102.21])
        by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 136BpNQA005063
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 6 Apr 2021 11:51:23 GMT
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by xbe-rcd-006.cisco.com
 (173.37.102.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:51:23 -0500
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by xfe-rcd-001.cisco.com
 (173.37.227.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:51:23 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-003.cisco.com (64.101.210.230) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 6 Apr 2021 07:51:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dg0uK5PzE+P2cTMi/JSmB9MklLSjf79qVCG/4er7Y7v9z3H49wpzVPUVW76NQcuOfrOSZIYhEvYEaqhrL0uDpVzxm/n5n+OyQf5DxIKAAnZZtvbS0dDAgM8n/VskJ+QxxBZTUXXOWSYvOBsh8g44pu7xQ0BwhzxmjjH8gZchhIWamNlYGAJpL2If+NfbaAf+EC25tXjhwZ8IzbChj3ROjQq0F6lRag11e/1H6FohJPfCAllqgxYnG9SiRqrBso9Lr12c3mrMkpyFuWahTSxbslqJ1nmuM+tKUIWsKO+EfItYBPEsSsooQNlBb/NsoTA9VO9E+iR/CTSehapcOG1dRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uh4NG9VVRAcCQfjtTzxN58duEfli88FC1TveRi0qP3E=;
 b=Znu/B1rEXhfBu49rcIYQWj6V27cYsxebU02O3c2W3UeCFzBkE8HDN2UwEVprfMkgMZZVo+n9OhPj0T9gMoRtuWutR7jadHC8YTz62j/HtRmN2mWYRsrIifJsRsEvOkr9SBiGMXeZFnMGVYC9JEJPheENJu0X4dkIIIHWqh5WW9ktu+jZ0cbeU25MqOsG8+yi6Dj43VJzXtABjV/7mBgrQnWfHMU4gal3MQsYPxvoOSQYbe/JYOEQ1EGaZk7p4TrBLgKR3f/DQdPXmR5qSSj/fRiWuui5surpjac99eEV6TAODA2EKh41y5W1Q15OFZJCW19rTLnbHsD2BosSVLso8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uh4NG9VVRAcCQfjtTzxN58duEfli88FC1TveRi0qP3E=;
 b=kP+pYLyHUlGxRHc3TuG9IzsCoaeAIsadHqqJcWWC1FSdZtTpoqpr+DvbucGijvtQ6OYvdF0ROjiyab3vmtD1a7BnZtNpNNHdLmPWcVjdlvzbHqQ/B4FuM9H11IVXxQgRa+ztv4UxyFwcHA8Z4w0FLDhn6BEMuhsQYejM6c1cYNg=
Received: from DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24)
 by DM5PR11MB1931.namprd11.prod.outlook.com (2603:10b6:3:10c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:51:22 +0000
Received: from DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32]) by DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:51:22 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v8 12/13] media: hantro: IMX8M: add variant for G2/HEVC
 codec
Thread-Topic: [PATCH v8 12/13] media: hantro: IMX8M: add variant for G2/HEVC
 codec
Thread-Index: AQHXKtspO0kqczgZNk+sOVk9ofVMug==
Date:   Tue, 6 Apr 2021 11:51:21 +0000
Message-ID: <DM6PR11MB462564D9864413A3732D4103DE769@DM6PR11MB4625.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c0:1002::b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e4a901c8-59f0-487b-7b07-08d8f8f24c6b
x-ms-traffictypediagnostic: DM5PR11MB1931:
x-microsoft-antispam-prvs: <DM5PR11MB19315A618BBFA977793DBE2CDE769@DM5PR11MB1931.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KuoMeQ68LrS8hP18O6+Mdh063WFMM4Y1FhA85e/7RdYukLXWKn0G2yiZi/qaxasUdUJF/gNgBsCdk0g/PoEq43070EwhMxIYpBXD1vf46XD6CuwSXiii6uCwPmoApck8ovdjgLv/93V5t5hMq27k3iZfQsuXABSMTRtj04hLX5r5h6LMlEzcdap/5WRd1zNTyHMo+/HqbqNEb2Yy+HwAq+LCyvetRrpTk8iDFjVpYdk8x/F0I+qaaCYgtkU/aK1QpQRfMpeZfR3g/+URHMt5USRefGj0a0w1/xOed3EuxQQkvvSQgiXEroCyzYs0QNorbADK25UdQXdusRWKbVWbij1FV/cBMLPhAZhltZ9COC0LlPTfX/zHWso+2rYOuBiW+wKg1/zYjZk/lxGnELk8q5GkEU5CO96N6MYGDqcy06Po3j/kcui14FpUPplA6Z7AV4NiD3l7AV6EuaoOt/PGyArT5lQLyInZbUMcYBEDu4ugZwu1Yn8iOX2GUsF/lCijYyNYKKLB3yTyvq14EHulsvchXT2vGRFjhrizJ2Ls5XudHWt9qJw2Tud4DbiP0b7FfQg/13xvqbeCWG4y7aFITNelq7g+avWbOZ+hHoT79c45Pc9ygMtsetzANazJVK3B1cLO1CYiMf7nzv3ebEQyCSedBaZoW2kxyKQqneOSbtGtf8ABPBya8UQiKa5Yp0n0
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(396003)(376002)(366004)(53546011)(83380400001)(64756008)(71200400001)(91956017)(52536014)(66946007)(4744005)(5660300002)(8676002)(316002)(54906003)(55016002)(33656002)(478600001)(110136005)(186003)(38100700001)(76116006)(7696005)(2906002)(4326008)(66446008)(66556008)(9686003)(66476007)(6506007)(86362001)(8936002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?vrFlb3gTc55cszB+xVjocwF9mvAn+ocSVpsTbJ7hHALXTMR8l/am/yHKRXrK?=
 =?us-ascii?Q?T36riBj39nnmIrRByh+z8J07LQoc53qCTXhDDo2t/5p2sUCH3ot0zEkM1zPu?=
 =?us-ascii?Q?1PLtGr2aPPXam0XAcepi+/HMFHX21IvPgAeO3bP/zU0kxlEIacrMBSxQqnBY?=
 =?us-ascii?Q?nA/SZYLPTj8xE9k7dLpXbMS61lxKZA7NCHr7xSlj5uxgY2JCgp0m85p1qoys?=
 =?us-ascii?Q?aa6RHZiXErtI6zBUlIAwqc4QY2TuYCbnkiTiam7YTo4tLnmNiqtO9ceBFF2y?=
 =?us-ascii?Q?YiXeqAoZljmBrMESq7swCa7RqN+wGw8+FFKKL9vmdBeGD3vVa9uv4sg35EYQ?=
 =?us-ascii?Q?VAdh5I9BEwkUJ4u40tS89vI2rXz0HVYClNHLU8dcl8Z3rcYZwHmMZ/pIHwDV?=
 =?us-ascii?Q?EhfJtYoma7T5GRiNZu8Ryc5d3m9A8AqeKAYfwlFogAArbATcvAH0c7D8T1Za?=
 =?us-ascii?Q?dA70X4yV7Jx2HIOQw5QgDn1a+4z2+E6eysjufBTjWLxc/PFIv8NNuNkO2hA9?=
 =?us-ascii?Q?dwzuwf7vFjVKMHFYV5W9ZYpE1CsaXy0nZjC5mXy+IMhEhuEmLhHzUZaWcpqw?=
 =?us-ascii?Q?m5QgGUW1qnW+mGyhKohLwUdSVa5+1A2aUNLGj3xgNShbZhlJw/vnvViLKTq2?=
 =?us-ascii?Q?rdnb8PXwnW4Rgph0PANmO7dY8XTs1+18J8hpFaWVsX5E80Nf/Ph4Uk49CJz7?=
 =?us-ascii?Q?ZBczc8X1eDU/euJFrsg6CsUeKAV9Zyy4eYBLyN/rEcS1FgNcFZT5KHMB5FZV?=
 =?us-ascii?Q?5Op4I+/qpYaY+KCoxFZAE7pJdFOkiVnTYbRxpG5uh/FvNIF3ufSCYs7W4WMZ?=
 =?us-ascii?Q?jHOW+hnMP7vxmLeyvnwPamwzL5YBLZbOuYIIvHM252m1u44MGhVA6TOgvBCi?=
 =?us-ascii?Q?g5kKiKDQSFJ7sm4PeZ7tl0f7vm+knOB/IXYTGoWjgZN0JCdIqtIlM2c6Khgd?=
 =?us-ascii?Q?IwbfU8Ks55CvAcKT5bh4Q91M22ZmQHK6gxiDqTeNKQr04xptUjxVmhw7RETk?=
 =?us-ascii?Q?NXw+AxGw4wdVHjK/+2qRtKXc8qRw4SZEhyygKngRegaH8wRkvX11AIp+YAfV?=
 =?us-ascii?Q?9cBjiHz+NJ0H4fWl6MITloqs3XzAaU/OBzuD6xnC/rSRGHvoZwbr8PPXqHCw?=
 =?us-ascii?Q?wTFDe4Z149H8p+HDzLHqLaOq6qDXyEOWIk+KXX8kd5SqTLYIqcspLg8Sd6Ac?=
 =?us-ascii?Q?6sCOC3Eb55PBzLzPMu5yI9kPcsk2i4e2nzDspBy1mKAeTrquAy9U/2YmgA1h?=
 =?us-ascii?Q?AAhRpcz9zikWXpWbHC3TEi2Uw5dA+Rku3j40g/0y+azvT00tpMeNE8b5FtkI?=
 =?us-ascii?Q?vaXmeaOU8JVk02yq3nDt9i0yKynHZHFIQ520uokjkthmlD/Kyz+zN6NPHKVO?=
 =?us-ascii?Q?4hBfBOg=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a901c8-59f0-487b-7b07-08d8f8f24c6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 11:51:21.9278
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +VvHTs0EFJYbEsrMSOSNYzdM9PxSefdSmhA5Gw6ZehNh5Dy5oiclrW+62YGaPhBVF6IqjJ/ADBhXENJSRBDDYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1931
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.21, xbe-rcd-006.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 18:00, Benjamin Gaignard wrote:=0A=
 > > Add variant to IMX8M to enable G2/HEVC codec.=0A=
 > > Define the capabilities for the hardware up to 3840x2160.=0A=
 > > G2 doesn't have postprocessor, use the same clocks and got it=0A=
=0A=
have -> have a=0A=
use -> uses=0A=
got it -> has its=0A=
=0A=
 > > own interruption.=0A=
=0A=
interruption -> interrupt=0A=
=0A=
Regards,=0A=
=0A=
	Hans=0A=
