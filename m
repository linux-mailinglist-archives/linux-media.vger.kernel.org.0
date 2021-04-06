Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B278D3552E6
	for <lists+linux-media@lfdr.de>; Tue,  6 Apr 2021 13:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343537AbhDFL4J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Apr 2021 07:56:09 -0400
Received: from rcdn-iport-5.cisco.com ([173.37.86.76]:26493 "EHLO
        rcdn-iport-5.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238161AbhDFL4I (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Apr 2021 07:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=298; q=dns/txt; s=iport;
  t=1617710161; x=1618919761;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=FviEa3ZWyab7HwGyIM0UlxdwFn2xI4lKZ4GgCyCzvzk=;
  b=l7sc0VoDlV+Bz2F+JNJpznlo+isz5dfut60blb3OJvQhnZsgx2ElEdGT
   YVtPQzfNxmJQ/jFj9z4yVmIOZf1qp40b/rAk2rqFqwF/5CJeYD1uRS1X5
   Bm11gSihOvHxwdB+/knp1T4Khe+Vnx6JYnpGNJYPG/ARRiAOkxWXRJzMG
   g=;
IronPort-PHdr: =?us-ascii?q?A9a23=3AkII5RRFj6CAPx/j9cmtN251GftoY04WcBSYc9?=
 =?us-ascii?q?4YnhrRSc6+q45XlOgnF6O5wiEPSNa3Q7PZAguDRqammUmsFst6Ns3EHJZpLU?=
 =?us-ascii?q?RJNycAbhBcpD8PND0rnZOXrYCo3EIUnNhdl8ni3PFITFJP4YFvf8Xa16TobE?=
 =?us-ascii?q?BLlPEx+IeGmUoLXht68gua1/ZCbag5UhT27NLV1Khj+rQjYusQMx4V4LaNkw?=
 =?us-ascii?q?RrSqXwOcONTlgtV?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AdxwMBq8jBAlkZEy8SYVuk+GIcb1zdoIgy1?=
 =?us-ascii?q?knxilNYDRvWIixi92ukPMH1RX9lTYWXzUalcqdPbSbKEm8ybdc2qNUGbu5Rg?=
 =?us-ascii?q?HptC+TLI9k5Zb/2DGIIUPD38Zn/+Nbf6B6YeeeMXFTh8z3+RT9Nt4mzsWO/q?=
 =?us-ascii?q?zAv5ai815GZ2hRGsZdxi1+DRuWFVAzYQFAC4YwGpb03Ls6mxOLf3MLYsOnQk?=
 =?us-ascii?q?QfV+/YqNHR0L7gaxgKBxkogTP+wg+Awrj8DhSew1MiQypCqI1SvVTtvi7Ywu?=
 =?us-ascii?q?GYs/+9wgLBzGO71fRrsfbo19crPr32tuE7MTPp4zzYAbhJf52nkHQLrPq06F?=
 =?us-ascii?q?As+eO87SsIG8ho8XveciWUjHLWqnPd+Q0j4XPj1lOU6EGLyaeSKV5KaLsiua?=
 =?us-ascii?q?tibhDb50A81esMtp5j4mODu5JbSTPGkSjtjuK4Ly1Cq0uurXIu1dMUlnxUOL?=
 =?us-ascii?q?FuEYN5kIp3xjIwLL4wWAbBrKw3GuhnC8/RoNxMd0mBUnzftm5zhPSxQ3UaBH?=
 =?us-ascii?q?69Mwk/k/3Q9wITsGFyzkMeysBatGwH7ogBR55N4PmBGrh0lYtJUtQdYctGda?=
 =?us-ascii?q?c8aPryLlaIbQPHMWqUL1iiProAIWjxp5n+56hww+22ZpoSzt8XlI7aWF1V8U?=
 =?us-ascii?q?4+EnieSvGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmNU1Yrn8y8o+gOA8?=
 =?us-ascii?q?HSVvqpUagmRsPLHC/LI8Jkzgf+U55dJT01S8sOoOs2XFqIv4bKJ+TRx6jmWc?=
 =?us-ascii?q?eWAICoPScvW2v5DHdGdiP0Pt984keiXWK9hBDQXnjqa1Hu5J4YKtmcw8EjjK?=
 =?us-ascii?q?w2cqFcuAkcjlq0ouuRLydZj6AwdExiZLX9kq26omGy9X3S73pgPwdcCko92s?=
 =?us-ascii?q?Sjb1p64Ssxd2/ke7cKvNuSPUpI2mGcGxN5R8TKVBJEq09v4qKxJZyIzSUkA9?=
 =?us-ascii?q?aqW1jqyUc7lTavddMxi6eD7cDqdtcEFZ4gQrV2DhiOPQdygxxWpGBKbxIkSk?=
 =?us-ascii?q?fTGij1s7isiIUZCYjkBoBBqTbuBfQRiHrE8W2AuMkkRxIgLkGTeP/SpTxreh?=
 =?us-ascii?q?15qRla9bQFjL+JhDC1QFFP/tgQARlrc2SYALVPEQKfQp5b84qbID1YfCOtmS?=
 =?us-ascii?q?GQjQ01dy7M8Ugf71aRdxG8SLXsHkdXvGxe3+LR1G5MMk+Zf052dxlBwNZAPG?=
 =?us-ascii?q?zbp3d+1vKKbKKv022XLkAP2P0ZLSutW0piHip+g9+wzxKbgzCECDEvwYgvJP?=
 =?us-ascii?q?XUCPA5f6jUwW7FEvzCqYgWW/tV9o1iLtbgr6sCVv+eYRacKFrDeqoU8h3Qon?=
 =?us-ascii?q?YuIy9vrnY41fvuxR3+9WC9mHoyG+DbLlgjR7YVJbinniDZbufN1JVyltQuu+?=
 =?us-ascii?q?Ssdm33d96d0KnSKydZNQm7mx/Dc8g47ZRP+a4ivrp6GJfWFTPOyXFcxR07aM?=
 =?us-ascii?q?P5jlkXTqh36K3IU7UfNfA6amZc5B4khd6PJEwkvkjtDugycUokgnXbM9mKio?=
 =?us-ascii?q?C434YHEwmEvk/9KFOf+ypS87PZRCOFz6cdEL91LmJMakQwgU4Ssd+qZsnVEk?=
 =?us-ascii?q?GteO5C9lbhbSP4f79ZVaSfGbIf6hx9+MqFmueLdyz+nADc1AELUJ5m4iKiW4?=
 =?us-ascii?q?e1BgnJBOtDt9q9Ml6IirGx4MGygCzsIAHLHHgwlMlAbwgIcs9HijM+l4U53S?=
 =?us-ascii?q?i5V7zvrise4ihjyCAikkSox5Ov72jaF1xXKAHVgp1ZWj9IL3iD5P61hNSwxT?=
 =?us-ascii?q?D6+zhK2Z7KCUdWcJVPArErP/jKExs=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CZBwDcSWxg/4oNJK1agQmBUoFTUQe?=
 =?us-ascii?q?BUTYxiAoDhTmIUJUwhAeBLoElA1QLAQEBDQEBMgIEAQGBFgGDOQKBdgIlNAk?=
 =?us-ascii?q?OAgMBAQwBAQUBAQECAQYEcROFUA2GRQEFJxMGAQE3AREBCBgeQicEDg2FPwM?=
 =?us-ascii?q?vAaAdAoofdYEBM4EBggQBAQaFHRiCEwmBOYJ2in0cgUlCgVaCXz6EQAKDSoI?=
 =?us-ascii?q?rgjsPfL18CoMKnRuDOwGhNS24EQIEAgQFAg4BAQaBVDqBWXAVgyRQFwIOjis?=
 =?us-ascii?q?WFYM5illzOAIGCgEBAwl8jE4BAQ?=
X-IronPort-AV: E=Sophos;i="5.81,309,1610409600"; 
   d="scan'208";a="611755033"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Apr 2021 11:48:55 +0000
Received: from mail.cisco.com (xbe-rcd-003.cisco.com [173.37.102.18])
        by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 136BmsCD018422
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
        Tue, 6 Apr 2021 11:48:55 GMT
Received: from xfe-rcd-005.cisco.com (173.37.227.253) by xbe-rcd-003.cisco.com
 (173.37.102.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:48:54 -0500
Received: from xfe-rcd-004.cisco.com (173.37.227.252) by xfe-rcd-005.cisco.com
 (173.37.227.253) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 6 Apr 2021
 06:48:54 -0500
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (72.163.14.9) by
 xfe-rcd-004.cisco.com (173.37.227.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3
 via Frontend Transport; Tue, 6 Apr 2021 06:48:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mniMsLK20mYBADnnFbgIfXdnR8104u/FwyCDKwB0tzzbEbDyC9eseFp52QnGAj0OArSEq3JzknrA4kESw9bKEe3rOA8byuffeWNkojnxpIO2SU2HsmVT8sy9IJG/XpmHgCqpIv9TRAEUOrZ+cZlaA+QZFFq3GX45W7Zt+pSJBIe/XqsFNC/52F11cm8MavixV5gorBd1M9lxtHiwayhnNir3J8zfn2bhE9Hjyqj6DtUXlkZ2ONSoeR8MxMXIc1FjfxfaJAVSG8w95M11BNG49yasPTzYeaxnw2h/1KkQLUnWf9rYDSi6hm0tWh4DVsTV63lVLZ3VjdwSh/1G+6wBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+w5sgiCNUTYBQBqa6kIS8ZLjXp5lCKI8QfhyyCTMvkY=;
 b=nYddzJcI4RguPrlM+aDAI8dKI+wpqsJTTEzqN7PoZjH3WQFcrLH4lws+xKauJPczlGujY7zMXuWwP4SBuZt3cJPkcTY7U1hOwlGptcAiDdTRt1d8vUw3+HgOswOvGijBsdIB3giI1v/FR8c1PnTVoNGrMiMSMgF9+t2bB/7QnM6YpAvsozLgnFIMnYM0Y/Uzwc64wwG9fnYkJGD0/jvHYT4ah/kimBkFyFXecL7NlepIe+VqA7aXu6eDI+rFyokM3OztkRZibVWl8bHoQf1Ui+ayJurdz6xipDCjGYY49eLatSEatPDmUcld3hOg7MLhuBPsRUA6aWuhUZqDtawBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+w5sgiCNUTYBQBqa6kIS8ZLjXp5lCKI8QfhyyCTMvkY=;
 b=IQonp8nSMlqQiQERx//HFeXY10H56lasVUkM7hYuoNF74FowLGfbUhY0+mV4SQt7gR0n3cv2RhwSfFYF+jLMLbxRaBX3P/fkY/Fo4neCc31k+HLaIq0yTzhf9XhlbN2dBQb1ltissb9e+EGdT4BYPZKqtIq7Ziws4zZkEEwdVV0=
Received: from DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24)
 by DM5PR1101MB2188.namprd11.prod.outlook.com (2603:10b6:4:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 11:48:53 +0000
Received: from DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32]) by DM6PR11MB4625.namprd11.prod.outlook.com
 ([fe80::9cc6:4f97:456c:dc32%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 11:48:53 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Benjamin Gaignard <benjamin.gaignard@collabora.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Ezequiel Garcia" <ezequiel@collabora.com>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: [PATCH v8 06/13] media: hantro: change hantro_codec_ops run
 prototype to return errors
Thread-Topic: [PATCH v8 06/13] media: hantro: change hantro_codec_ops run
 prototype to return errors
Thread-Index: AQHXKtrQDYOmZ+jCP0edngX/tScV/w==
Date:   Tue, 6 Apr 2021 11:48:53 +0000
Message-ID: <DM6PR11MB462543A2F7BB84AE39800B14DE769@DM6PR11MB4625.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [2001:420:c0c0:1002::b2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7e0e2bff-ff6f-47ba-899d-08d8f8f1f3c4
x-ms-traffictypediagnostic: DM5PR1101MB2188:
x-microsoft-antispam-prvs: <DM5PR1101MB2188E3465F2BCF3C6D3137ABDE769@DM5PR1101MB2188.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +Br4AcdMNkPlSoyqwVLeVxjKmqlfxWoJ56bA8Og/1l+Xy1mY0uh2k1B9EqTrzdlgZ6aRwCz99e/qul09FI9mqLGf11eTbh48h5BMsF50KjtV2koPD5fkt/zHUQkeOF3U36bdCc/2MfeHoOBhXJeW2Q99le27DNWsHimxgzTQLHxCxf9zEcq6eNVyuKNtkaEjBvpRhsXINBpGwEZGHwYuZ6ThlZDHzXbtcf8rD+fhgDUT0rXO4s6Sv/UnHVb6M35l7fINhErZ0ssPrsPNBLPltOiRrcJEQoWl6w6enYCZxxn79ePMZIDoNTHV98Bt5HWL8uoszzkA1XIm0u9STElpBBZmscdqw7P1X5E0cVZW/baMzAJj5svWc+1WPdtzwW7mEgYXJME+v6Ggkxg8MC82F8P/zjqt3IH5dhPTrpNXct/R36qclM06QucyjUeB1nK9szg1YUHQFJQk+by1xF1ryaoQssh9joExD+WxhvY5e8JsFl2awBwLGSRXYPiPNJZvEDqGx0bar818/9UxWSlOxXz6pUyt2zZJ5/sQOOFFqp1vQsYEfgLglmdQM7OazsPt4gNvGnAiBl/nGegJRpUHI6PDy++XEt/kvbIIzGLJGvssquJDPAmh1EUPjTUyqHjM26yUfRtqFyR78heCEiEjsJI/wSZ9OgReAAkLA+IaRhM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4625.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(366004)(396003)(39860400002)(376002)(86362001)(64756008)(91956017)(76116006)(66446008)(558084003)(66556008)(316002)(6506007)(55016002)(53546011)(4326008)(66476007)(66946007)(2906002)(5660300002)(8676002)(38100700001)(54906003)(52536014)(7696005)(6916009)(186003)(8936002)(9686003)(478600001)(33656002)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?GWgcdKQsy8tgu+Vy00qCRvIqQXFdBUsuaXsqFbxTQWzl7w8lrTGKt8gBRQFI?=
 =?us-ascii?Q?fgmxeukVsVZvL+KwsW0cU/CpHAUCWWz61sGLZM8m8vfndjfFDG7Fmm2HyMqg?=
 =?us-ascii?Q?UmK+PnqSJpVhleHypWIWDxzFFDxrDHDj9gjN3aCvAmZ6roVUb//umNlRVHTq?=
 =?us-ascii?Q?l4lUHvlSeneCV7WV7dz28riRuo6ysevxCDuvCXy05BYsnP68j1BbTkB5EnDm?=
 =?us-ascii?Q?qv0VI1/1DOmcebgoLrO9dFoQjJDRUaCrhj/JBTbj4mkPjmCeXEtgrgOkQxCb?=
 =?us-ascii?Q?wdHPJZuM2eXK4tfuSxFon68HPdyRaZIwzhHHj6Fs1to5/+KmHPvORrqquyZ4?=
 =?us-ascii?Q?3Vibex3HYzVnxmlOV/dKZQRk255EgxllzzWPNp94JAERjx0PYs1mbrWm/0Xv?=
 =?us-ascii?Q?Uk48GL5TyN1/FKUxsVhOmyiX5A8LUzw5V8Pp/yt95AXWJP9Vdy75PMdzKpgw?=
 =?us-ascii?Q?nDwFwrJaNFjCrhxO3+cyZKCO+iUXuJptxNNkQJ7qyVO2jWtI0P/nlALWdtxP?=
 =?us-ascii?Q?ULoDh8Ilff5W64tlNfzvCd+8TME0QFcaQU2YKVnwybZ96Nad1DgSzz96mJOg?=
 =?us-ascii?Q?uyOwsXv/GY2BZ/rrR8Je4uKJe9YkRbjbnFVIhkqfshV1S4D27S99fyWmrSN0?=
 =?us-ascii?Q?yNr6ZwHn8HgLkQcas+Hb7crZ/IbAPPdfHqYCZjTcNHb6pQ3/E0nQFWBiYsyO?=
 =?us-ascii?Q?8YLwSXPV8/lbFaDlSaW5trSeym2LZ8rF9S4kH8IyU9xKH7A/5X4YJ/yBcQhM?=
 =?us-ascii?Q?6b/VUHMu5DGweaPtU9Qg/PZFfpERhMKN46mmzWpqzFSkE+Wa9ncdEy8Igi2Z?=
 =?us-ascii?Q?FYxEyQavIH35yP7V9R3uetAgLLNWKtRIWqjqauQyyecMkHo7C+LfdsA8R3ah?=
 =?us-ascii?Q?2vKSuusHrL45v7T+NgoMbqy+DJ1cJ+eIP3xFTJY1tYdh+PEfe68jJUGM3OJs?=
 =?us-ascii?Q?KPFv/LIgQNh/vEjR8GtT4tXktewPBi5VZcV3OsvGe7AAxeCxgo0UNZzWbgLp?=
 =?us-ascii?Q?LoQpqTVhwOX/BycBJjNIetQy+wX3wv7RVYupMvUzzQ5hUPz36f5x+AtqzSQE?=
 =?us-ascii?Q?QLHWSis6PsygGL6saHRRnky+bi3fqU/AUrDj7nZTtDc18LsRoYjIvPshH+vK?=
 =?us-ascii?Q?lusNLJ+9wRPE9f8qpLtLi4WkG+r96ZcLEW9UjF7hdqZUAlA3g91U6qDMpztX?=
 =?us-ascii?Q?go3e050p4gEfaw0/TsUv+GFNiYlWFTWEpcu7czyiNqE3CDRFE3U9VfgHxovW?=
 =?us-ascii?Q?rN0RTnWeL6xuJYrTR9BqphFYn+l+wbctmxjdIG9k40aE60t97SSuQZa8udF8?=
 =?us-ascii?Q?nykoOp4d0O6DPhh+74LmTVovzxpw7IOdnXnVpxlb6zf844nCIAyPInT8dP+0?=
 =?us-ascii?Q?Fr0zNC0=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4625.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e0e2bff-ff6f-47ba-899d-08d8f8f1f3c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 11:48:53.2967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u1127o5F+NQQT4Vt4rY/JOw4pj9sURG3SpfS2aZssHUGX5lM03NjvTw8BE8T/bD/YoXyyPvdv+utCdIuqJJHGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2188
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.18, xbe-rcd-003.cisco.com
X-Outbound-Node: alln-core-5.cisco.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 01/04/2021 17:59, Benjamin Gaignard wrote:=0A=
 > > Change hantro_codec_ops run prototype from 'void' to 'int'.=0A=
 > > This allow to cancel the job if an error occur while configuring=0A=
=0A=
allow -> allows the driver=0A=
occur -> occurs=0A=
=0A=
Regards,=0A=
=0A=
	Hans=0A=
=0A=
