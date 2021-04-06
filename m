Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A0C73552DD
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 13:55:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239425AbhDFLzQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 07:55:16 -0400
Received: from rcdn-iport-6.cisco.com ([173.37.86.77]:34466 "EHLO
        rcdn-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbhDFLzQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 07:55:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=890; q=dns/txt; s=iport;
  t=1617710108; x=1618919708;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=OhP3C+jMAk8XDjh7nEqgyHnXo/VhYp1xv0sswrMaI9o=;
  b=XXlLmkqW+ZpuKsNng94pgSsF+ecsL/GME07378QFVITWvNmJZyiPhlHm
   RZ6qQEKXPWaW/wZpK/+wMal1igN/BYetoPd6lzAsXiwEi6EzADHe81vpH
   WcmZWJ/RSV1ATSw9LBQTKYQ4cT6hwVZp2NmfSefihyELpP7HSMIwSwSPh
   A=;
IronPort-PHdr: =?us-ascii?q?A9a23=3AkSev/Ba6t2CTTChKiYWTy6X/LTDVhN3EVjU94?=
 =?us-ascii?q?4c7i79IbqWo9ojjO0qa//h2kVvVRu3z4PVAj+PctLrpH2cH5MXJvHMDdclKU?=
 =?us-ascii?q?BkIwYUTkhc7CcGIQUv8MLbxbiM8EcgDMT0t/3yyPUVPXsqrYVrUry656joWE?=
 =?us-ascii?q?x/4LwMzLePwScbeis2t3LW0/JveKwxDmDu6Z+Z0KxO75QXcv8Ubm81sMKE0n?=
 =?us-ascii?q?xDIuXBPPe9RwDAAGA=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3APOYoT6nyI+PesgWidEtDsgjLwxXpDfN8jm?=
 =?us-ascii?q?dD5ilNYBxZY6WkvuiUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLNxAZ6LZy?=
 =?us-ascii?q?OjnGezNolt4c/ZwzPmEzDj7eI178ldWoBEIpnLAVB+5PyU3CCRGdwt2cTC1a?=
 =?us-ascii?q?iui/vXwXsFd3AWV4hLxW5Ce2GmO2dxQxRLAod8MZKa6NZOqTbIQwVqUu2QAH?=
 =?us-ascii?q?4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKXCSw9BEYTj9J3PMe4XHI+jaJqp?=
 =?us-ascii?q?mLntOa7lvn12HV54lLg9eJ8Lt+LeGFl8R9EESWti+Gf4JkMofy2QwdhMGKxB?=
 =?us-ascii?q?IUnMLXoxEmVv4DpU/5Wm2uuxPi103B/V8VmgXf4GSVi3fivsD1LQhSY6Eq6O?=
 =?us-ascii?q?4pEWq612MboNp+3KhXtljp0aZ/MBLakCzxo/jOWh16/3DE2UYKrO8Jg3RTFb?=
 =?us-ascii?q?YZcb9axLZvhX99LZFoJlOf1KkXVM1VSO3M7vdfdl2XK1rDuHN0/dCqVnMvWj?=
 =?us-ascii?q?+bX0kroKWuonlrtUE863Fd6N0Un38G+p54YYJD/f74PqNhk6wLZtMKbJh6GP?=
 =?us-ascii?q?wKTaKMeyzwaCOJFFjXDUXsFakBNX6IgYXw+q8J6Oajf4FN65cuhpLbUhd9uX?=
 =?us-ascii?q?Qpc0zjTe2Ctac7sSzlcSGYZ3DA28te7592tvnXX7zwKxCOT1gojo+uuPMaDs?=
 =?us-ascii?q?rHW+uiOZ5fDvP5RFGeXLph7knbYd1/OHMeWMoatpIQQFSVuP/GLYXsq6jafZ?=
 =?us-ascii?q?/oVf7QOAdhflm6LmoIXTD1KskFxFusQGXEjB/YXG6ofkT++Jl3AbXL5uR78v?=
 =?us-ascii?q?lLCqR89iwuzXip7MCCLjNP9oYselFlHb/hmqSn4W+s/WjJ6G1tMgFHDllc5a?=
 =?us-ascii?q?jhV38in35JD2rENZI4//mPc2Fb23WKYjVlSdnNLQJZr1Nrvb6sI4eI3iAkAd?=
 =?us-ascii?q?K/Omech38ezUj6Cas0q+mm34PIa5k4BpEpVOhNDg3NDQVyghsvgnxEchU4Sk?=
 =?us-ascii?q?jWES7Oha2pgIcPPvzWc8BxjW6QUJdpgEOakX/ZhMk0AlMHQjalUKes8HkTbg?=
 =?us-ascii?q?sRomc0zogyr/6rny21JW42neIiWWc8Fli/MfZhFwSKZIJdh7bxXhp/JF363Q?=
 =?us-ascii?q?CyulUUZnfg8VkUiyjHKyCZEMu7WGZ1izR/zrvg9k9yeyGmW39ILlp+sYF7CA?=
 =?us-ascii?q?39yy1O+OeWe6u+1HaQYFMewucbdCrIeycWPxkG/aHH6DeF3DmFDnko3ZMoI6?=
 =?us-ascii?q?jUC6kiaaja3je3JJSPjrxuJY4ewL91cNTvuPQMS+SRZkucKy75Efog32Wu1z?=
 =?us-ascii?q?8YETgxrHkvivXz3hL5qGC+wX4kGPLXZFBrXasSLd3Z72/qQZ+zod1EpMNwue?=
 =?us-ascii?q?u7KWPqbNGajanRcj5YMxvW5XesUPtAk+EhgYsi8L9oW5XLWzrB039KmB04Mc?=
 =?us-ascii?q?fvjUsbBKB2+qrININjd9EbEhgptGYBhZCKNg8mowb2CugxcRU2g3jXM8iA7r?=
 =?us-ascii?q?DIpbAsa3fx0jfYKB2a6WlQ7v3FVyyM2foGEKo2O31Rc1V553J4/u+OHregRT?=
 =?us-ascii?q?mCZqVG5h69PXC8erMGF/TAFrUUsxpg49aH2+WQbDH13QjMvT19ZqJCmlzXM/?=
 =?us-ascii?q?+aEUaJA6pP9df/JFGHxq2t68S3hC3sSTS6Z18D7Lc1AnA4f4BGkH06kIYz0i?=
 =?us-ascii?q?KuUaT5rUIujktG7Vhc5y3Q85nj5H2eAFpPPgLYiIhHRDVfMnCHisLe7OiTvU?=
 =?us-ascii?q?6NlQRtyN3ED0dfftZHBtgWQMz2Nk5VWLgtgII=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CcBwDESmxg/4QNJK1agQmBUoFTUQe?=
 =?us-ascii?q?BUTYxiAoDhTmIT5k3gS6BJQNUCwEBAQ0BATICBAEBgRYBgzkCgXYCJTQJDgI?=
 =?us-ascii?q?DAQEMAQEFAQEBAgEGBHEThVANhkQBAQQBJxMGAQE3AREBCBgeQicEAQ0NhT8?=
 =?us-ascii?q?DDiEBoCACih91gQEzgQGCBAEBBoUdGIITCYE5gnaKfRyBSUKBVoJfPoRAAoN?=
 =?us-ascii?q?KgiuCKx+DN7tBCoMKnRukcZUVoykCAgICBAUCDgEBBoFUOoFZcBWDJFAXAg6?=
 =?us-ascii?q?SD4pZczgCBgoBAQMJfIxOAQE?=
X-IronPort-AV: E=Sophos;i="5.81,309,1610409600"; 
   d="scan'208";a="882648040"
Received: from alln-core-10.cisco.com ([173.36.13.132])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 11:52:03 +0000
Received: from mail.cisco.com (xbe-rcd-004.cisco.com [173.37.102.19])
        by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 136Bq2st014437
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 6 Apr 2021 11:52:03 GMT
Received: from xfe-aln-003.cisco.com (173.37.135.123) by xbe-rcd-004.cisco.com
 (173.37.102.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:52:02 -0500
Received: from xhs-rtp-003.cisco.com (64.101.210.230) by xfe-aln-003.cisco.com
 (173.37.135.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:52:02 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-003.cisco.com (64.101.210.230) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 6 Apr 2021 07:52:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nr87U1pKEmpj6mDyxas7vxVGZIzu4+X0y1aT6d/WeXE9hvsOMEn9N0XR97dEecQ52SP6nqkknhvIuI27l4aFStp3Qiy3NcvQAhK6uSvsW0WWCkKWzUWaCjEtMc+7KDg+qdWXu9SNZETppyzlzDuJOqVh2bAzI34LzzY53kf8tXS+yoTDHJLV0xXrAILukm9P7Szf+ZC4migE9GwEmP/DWXo499SQu8JQ/pQ1t437i/r6lbc5n1dLVuZL5SlKg56Wplt1ARWR9l8DQP/y/Mdu20xEf2+0rgaBkZ5oKX+Ac6WflAir7x4OPmjff0TvC3oD/SJ/7PEN9AOG20ceZ17LOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIKFVrmqIZe9M3fh/UH+5uKrGG9AUFeiZRW7GOFSvKo=;
 b=Osp7/7KdpPUKafmmIuwsROo0HtuH9/9aLJJ6z51fBlO3LfbFYi4hxGP3Jt6Va+LN1wPB9/wi6YDxygftRowLUun8kkRbLYJC4RFlTodbnl8W4uiaz0xoLulEykPCcqYi75xtEGkWIOqP6dcpkNzNy7+Nl8OmBzMCgKC7iQ3JuVjwsFhZltWWP8a+Vyzcj66PFI2/zuACQJncJFenHvKHddepGqdk8lArKYQjoUmj2uKNATKH5h2hTDJpsLHGPy23Bjrxejk06wAfZ8T+C6y6WD1qXM6vtQdDRdVsQTGR2drwz5It9HbDoBd+7YSf5JIRATFIBqeCmz+qPz2Ag4PEtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIKFVrmqIZe9M3fh/UH+5uKrGG9AUFeiZRW7GOFSvKo=;
 b=S6QY7GyOJQA5L1YPcEgrLntRB0XOefEq7ourCh+u1X/ha9Skcyvs/4K5xLxsW9WDlJC2YXevVtMvxsoxbECNdCTBjg+fb+Dm5Dd2dAb8uHPFNHR4oe84ExHgxOYVTtn9a9/qbmVqQ+raFcqIPrk9kEG1jyQi/oN3LoclBJXdWdI=
Received: from DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24)
 by DM5PR11MB1931.namprd11.prod.outlook.com (2603:10b6:3:10c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 11:52:00 +0000
Received: from DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32]) by DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:52:00 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        "ezequiel@collabora.com" <ezequiel@collabora.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v8 13/13] arm64: dts: imx8mq: Add node to G2 hardware
Thread-Topic: [PATCH v8 13/13] arm64: dts: imx8mq: Add node to G2 hardware
Thread-Index: AQHXKttAd3t2Dnxl+UOQFVOpxZC0cQ==
Date:   Tue, 6 Apr 2021 11:52:00 +0000
Message-ID: <DM6PR11MB462517EAD141E41104D51E42DE769@DM6PR11MB4625.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c0:1002::b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 114aaa13-59c5-4f81-c2aa-08d8f8f26387
x-ms-traffictypediagnostic: DM5PR11MB1931:
x-microsoft-antispam-prvs: <DM5PR11MB1931D350EF71E041EFD16054DE769@DM5PR11MB1931.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5owxv124j2uFIeJ9lzNKguVH0GOdutxbeYeoN1MMV2+R331p/MpL+ROJNMBC/5yakZdqQTj6qH94g/ojzCyBwyY4tYDsCq/3uyx7WA1NevhEZ90ML9lAzhK1xAWpmcUjlYA9aGsNU8njg93KsDem5KLm0DdoHRAwtrVJtx3tYnO24q9GSsurNlJBiXQzrZEtYhfLJAQGMguoGIDybR1ZcYMblig0ai5KxL/rhClt92DA3+rjNgc6mSkHo5kfzQQlEX46zQGgjvVVnesjFCLiUx4eaaScUnl0NsvKfEwysDcrCdd2gzKhG4yepJJ6IBGBmYarwd33XEvPrZa5IoSz7tQS32FSkKW3LcTvEcx+3UM3daispjqAX90xPYq5J4wgoyXknzWuJSvS9TpVP1kOFgKV/CWNTTnMg0/4LG3ROJZ5HRUVDebZBCHyWfR5wug11TYYDIziXnsTOHQbZfTsaMjE8J+iI6WB2iuJ438jFr3N2wk7njglm4oqE9gaLL88DcXwGbClPMy3ld/FEY4g/yGfsdrfIxc1ApBsSTgIsS/IVVTvJCPtIUUSOA2zmidKXzxXt8oxy+r6Zp1p2QhbHJ7KpS+Z5BzauM6wdvRQbPBPDykd9dfRE27YwALPt+EWTC1eJ75rCZfBc3jw99S+2uyI1ZlNGJLc5V4SrLKtigN03tNYCuG1eo9CRK3/jO2q
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(39860400002)(346002)(396003)(376002)(366004)(53546011)(83380400001)(64756008)(71200400001)(91956017)(52536014)(66946007)(4744005)(5660300002)(8676002)(316002)(54906003)(55016002)(33656002)(478600001)(110136005)(186003)(38100700001)(76116006)(7696005)(2906002)(4326008)(66446008)(66556008)(9686003)(66476007)(6506007)(86362001)(8936002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?LkHbnNomt32+c+tXUgVxFICYLc7RLpXUtX3qOS3anEbg7hfXtOn4pDxaOfui?=
 =?us-ascii?Q?whqix+xOFfB2cSsHquVuMjCI/WaIVL38trd1ycIQ0jQvyB282NfkgGDKjtCo?=
 =?us-ascii?Q?fnBi26hlbIxlQmc7u3gcXPYLT0NHCtisX89kc6z0ph/rQWd3WizjdXGc0iDX?=
 =?us-ascii?Q?fwpuh/EnAbyxDTtjA2R18kOv2lvuJzboFv2vfBkeXCHtf4YAQFLH1URNfR1Q?=
 =?us-ascii?Q?K1R6O1ZXQJBxqDYOqdBWzH6BVqQNXxN5X0iIkR7zTmvzrBrUt/qmGsEj6PlX?=
 =?us-ascii?Q?ojWLdc30BHIt4U2E6Ql3u0jLG+w3HJS61CG+VzZB4wUw4qEEZFlfeQktg2Wr?=
 =?us-ascii?Q?j94Jm/crP3QkIke3O4/b5ctaCxBXX4yqsFRleeDXOmVrI5ZGSVJH+/GwFqL/?=
 =?us-ascii?Q?0tqcHHXgtgzIrtQdJmOsrI1Akv2kFv34rlmN8JZQSxU3XrGJ+K5kfob4KO96?=
 =?us-ascii?Q?mVxcmM7gpSsHX1dSckDfeYH3DhopxTOzDKE81X9AwGNU4JLSRnbwilZEKqsu?=
 =?us-ascii?Q?fLmqdZct+7UAJS/RZfaSRRcdZDExFPHwHJHxxkbrxhTnE77NHm0tCSWoK8E7?=
 =?us-ascii?Q?ti2MSSLmo/w7aR3H7IQtVKnKcmxSOSubd7T5C6Ez/UBXr3Nmjh80isOGaKOH?=
 =?us-ascii?Q?DpXwKvEPv7Cf3FhlMAmgQS47oNNGsQXoRnDcQ1y1qQ42IS2akReQtxp+ZHmG?=
 =?us-ascii?Q?QVWEnwUJdyQEyHf8ajaH09Qj0h3BXq1ehmXaI35/M095kQrK4QOcOe40wXaG?=
 =?us-ascii?Q?yPZlKygC05OGdJuqz++9EQeXo30BFdSnjFV6PhL10CPnmPZKqLnFcePzXYnk?=
 =?us-ascii?Q?XBHUwYMdt6W0VbUq+Z1zTr2dDUYcmgD7B0qLfxOBjVrHUEtUoKg4ecVxPK8s?=
 =?us-ascii?Q?sIe+4hmMlsabVis6B4+BpdnXbfwznUui4liRtCECYjx8Q9/gB0nsRlqTDtgs?=
 =?us-ascii?Q?IN+wVNeUnPi6U+PcVFWvT5IE1J49ShcsJUJlSfQq5WlOJ4pvhfQaSmzMyrr5?=
 =?us-ascii?Q?0DiI9zixvZ00KdFJoc9DCrofFNEdAO1E19QjE3wiwNwbnImBgAiXq0mha9v2?=
 =?us-ascii?Q?BVZI3rxXpfmMQL05HoD9LNis2ShKGWxRXmYUX000H+sSHbHN7vT0hr6Gjyls?=
 =?us-ascii?Q?+ZVWTOJcmCpVEYwC8z1Y0PAN2iI26fnmDv7zRIhQgQVTXspJTBrVBUeNISPE?=
 =?us-ascii?Q?LmpZNw55WMuYOnnAlmYRG1Pi7Wf0oby19sAgQEzLZ/u4bY8mRoNWaBqzboBU?=
 =?us-ascii?Q?kSND9xQVi1yCAAOMHt5P3C5uzo4eP65XzydNxtFnJ1XJbeRLiok0gVcOGjA3?=
 =?us-ascii?Q?fm2rOUfK5gs09ChZjXosEPqkszanCARxeEuHDh4/o4bokHvsHNH9ZMFlb74b?=
 =?us-ascii?Q?w75Pfrs=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114aaa13-59c5-4f81-c2aa-08d8f8f26387
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 11:52:00.7575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TCy9Z9aONILCep8j4KeIgzowWIazc4Qkki6WjNKEuKRwbiopJ3QB5N7k4+HtiT4Ju/yVsYR5Hq2eyhnvAZQrdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1931
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.19, xbe-rcd-004.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 18:00, Benjamin Gaignard wrote:=0A=
 > > Split VPU node in two: one for G1 and one for G2 since they are=0A=
=0A=
Split -> Split the=0A=
=0A=
 > > different hardware blocks.=0A=
 > > Add syscon for hardware control block.=0A=
=0A=
for -> for the=0A=
=0A=
 > > Remove reg-names property that is useless.=0A=
=0A=
Remove -> Remove the=0A=
=0A=
 > > Each VPU node only need one interrupt.=0A=
=0A=
need -> needs=0A=
=0A=
 > > Change G2 assigned clock to match to the specifications.=0A=
=0A=
to the specifications -> the specification=0A=
=0A=
 > > In the both nodes all the clocks need to assigned to make=0A=
=0A=
In the -> In=0A=
need to -> need to be=0A=
=0A=
 > > sure that control block will be correctly clocked even if=0A=
=0A=
that -> that the=0A=
=0A=
 > > only one device node is enabled.=0A=
=0A=
Regards,=0A=
=0A=
	Hans=0A=
=0A=
