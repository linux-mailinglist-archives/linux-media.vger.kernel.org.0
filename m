Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27DD63520AB
	for <lists+linux-media@lfdr.de>; Thu,  1 Apr 2021 22:39:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbhDAUjp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Apr 2021 16:39:45 -0400
Received: from mail-bn7nam10on2088.outbound.protection.outlook.com ([40.107.92.88]:31328
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234114AbhDAUjo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Apr 2021 16:39:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y+ZVyHtnwE4XfU1XomgB5is6btNvooVod0dz3B2I39R6tknPiqksEXTeK8rUmfRsC0loHwQQhEjwEDeKneJWZG88BLj4jvjT50XQom96WzVCR8miljT+eIXbyhWdoewQwD8sFr43brfpnjJDzRz2rXWXTmQNCkIunNM4aAo7V8f9wPSyfVqBnysC+Js7yRhWlfRMkjrJ/AmdqCegYQwGN2nls4kop3Z7wqUWoVOa8q+f2kgFgumF/lyghuJ4iXi66fcVSlYiNNktW1YGiNOA4ZIVJpI64I6N6w6IBei2a7ebWMO5BCNDSH43UKsUK4yaw4e4+o2LRYOAKSZhFDYhlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKTepArWvxnxwKPiM5zmzXLqNxRCdx7Bgc25qMqS0Rc=;
 b=PXdpYPs5jaoc29kvmGhSWtcurYTs2/McMow7HW+6BTouFIx46NwLArClSEAg0uEkOu+ZEXzRdY9rSnYdd96OrKA3G9scaszdw4RX6+4Ii7UfdWE9aILhLCG7zoBR9Z8hEK34VE+bCk6wfQKv14kmjZUA4l0wsDIQSJJMPPs4owLwLZyDKnr5TTaKC6WAreirn9mlGDTtuPvzqqliL8TebFg8SvJ+pShmxfAFfU0x2mbXovfAjnnKis3ug/HD7RQxwxxrCv9G9jSn6JfF4hDWTPbcoUI8vfYpbGGZT5i2cJZpLlkPUWsrfaTnUPcaDyKdQiNLR4tF51FSyxrRwgcbYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=10zig.com; dmarc=pass action=none header.from=10zig.com;
 dkim=pass header.d=10zig.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=10zig.onmicrosoft.com;
 s=selector2-10zig-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKTepArWvxnxwKPiM5zmzXLqNxRCdx7Bgc25qMqS0Rc=;
 b=g1XRCRYuNGEnlmai8nQoxJ6guj89vBENYgD04ZEtE4ajKeB0AaCGT6kdonvsPNzLgT9T3Gks6Mf7cx5EoroW9TGnvalriGYjdujWHcvHBJzH7W2IsEGLgY+Q7V+yZtFFkM5LcMiH1Bhz9ssu4pipk7M/QA/EmQriuFdVtBX7ozo=
Received: from BY5PR17MB3905.namprd17.prod.outlook.com (2603:10b6:a03:23a::9)
 by BYAPR17MB2984.namprd17.prod.outlook.com (2603:10b6:a03:e8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Thu, 1 Apr
 2021 20:39:42 +0000
Received: from BY5PR17MB3905.namprd17.prod.outlook.com
 ([fe80::e453:982c:aadb:a0a5]) by BY5PR17MB3905.namprd17.prod.outlook.com
 ([fe80::e453:982c:aadb:a0a5%3]) with mapi id 15.20.3999.028; Thu, 1 Apr 2021
 20:39:42 +0000
From:   Fabian Becerra <fabianb@10zig.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: Re: UVC Question 
Thread-Topic: Re: UVC Question 
Thread-Index: AdcnNtKKABRqQb0HTK6uf1d55DQCdwAACXPQ
Date:   Thu, 1 Apr 2021 20:39:42 +0000
Message-ID: <BY5PR17MB39055A9CEF7108223BC9CE4FA17B9@BY5PR17MB3905.namprd17.prod.outlook.com>
References: <BY5PR17MB390580EC7572476CAB5E59EFA17B9@BY5PR17MB3905.namprd17.prod.outlook.com>
In-Reply-To: <BY5PR17MB390580EC7572476CAB5E59EFA17B9@BY5PR17MB3905.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=10zig.com;
x-originating-ip: [72.166.76.202]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cc33a716-8bc1-474e-414d-08d8f54e476b
x-ms-traffictypediagnostic: BYAPR17MB2984:
x-microsoft-antispam-prvs: <BYAPR17MB2984B41C5E4C6EF9D0ABBEB2A17B9@BYAPR17MB2984.namprd17.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ezl+yh5C2/sA6bV5DwibgJ4mw/wWRCOVUr6zGMqxLFPuzmBztMMKZgWNmdyOGIxz4yk/G+B5A5N9Di2f6bHYjyLPU4/BxX3KI1gNsjELK8jdAoeLcivlkWCxXWyZ9KkbMbTOi3ThxyE77P8+CIdrKNxIpe2zW0cmn5Udcb2sW11l5HZygP6tfl4xg86OYBvN0G+Y7Pny+RUhEXmsxri0gdvndA4YfUhpFA3ZEAfPvAuF1r58ZerDkFx0PllD9OgfCSOVhHxt/SGrQfn7XFpa/x4EDIDrW9jhVKyzlYYhEavQ5CQxPLORANL5x3GQ3wb719ZQclbUQJHvWg223qH/OKz0QZ55/nMGMURrybiGxom+zBsl3DoUBTXvSio7M4iHA+UZzyKI5UHLKvBVoE/W/j2hKLfIb0sumnf7v1abkgSgyp9i2UMNmnN3ljMPnzQYwoE/Uy0kSer+3xISVXlgDg5r/E5Vhl0xuUt71N5XBuk3w1mrcXFX0k9o1SZRbhOv0Lq86qeQDZMdzBXGQNFwqHXPOYnQJa7OiFrzrlBpcX2Nb/3vqbbFoDxKR8X7z9a83/731gdoAS2DUHCf7yTm949i84YZbtiVKJMCC1BToGN0NfdJJ0VGRxicUWXH0sQOOKLxEVfp+Vr02klBxSeLNEyDVQ1vgQ/vKnES2ZAWpN8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR17MB3905.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(366004)(39840400004)(396003)(4744005)(5660300002)(52536014)(26005)(186003)(71200400001)(7696005)(6506007)(8676002)(55016002)(4743002)(66574015)(2906002)(478600001)(316002)(8936002)(2940100002)(6916009)(76116006)(38100700001)(64756008)(66476007)(9686003)(86362001)(66946007)(66446008)(66556008)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cH59Ziye/HBIxpBxWIrXPdF2tjF11WyLzRpHbV6bowmOTBDiVOsNhCaHEb82?=
 =?us-ascii?Q?GUTv72qDZTzwfYYc0PwckmFPX9SsDsJgB7kWG9s6SMNfTr33uebqJXilfsSH?=
 =?us-ascii?Q?XY6SQo4fQpIlS7K4yMFXJLV+2qqt6CiR6Mb7xkXhzC6Ff/mQZBtF0kzAxdzB?=
 =?us-ascii?Q?9TbDyAbWg4SeJK5KD/CYWHniZQWcHkFScC7UE0kS3j5rHuapTDnHni+ZcRxe?=
 =?us-ascii?Q?R1jq1/XkjjsqAM7QeBWoK9Nl6uPxQQA+MqSNT7tuh7H2BCznONnLNZQFXtd8?=
 =?us-ascii?Q?4w3h+CRZI0dtqL9nJkg/YaQMl6BDdIYX09bTviQoairbyHSUDHubahXSIfcb?=
 =?us-ascii?Q?RpdBm4Yik+IG/EmOSA/9y7CI2WXCKFF1daVj5mPfA5u18+AkMNjFdolSRdLD?=
 =?us-ascii?Q?Qgm4vvJx1dALYdqoQbLlssYU/HSwDWyH+y8BSowqqc0RW07UGrIoeJHrENTA?=
 =?us-ascii?Q?g9EAwLv0xB/fB1sAJ4zvoqvuoHvt913UBkNZOAG07GJtcPOCo+LHpuOzIpRT?=
 =?us-ascii?Q?dEG9YJjmXCHOD79SgOzH0PZ5wi8nK6I3/KgwVEv/gNXpBkQnnQYVYG6ZRoRC?=
 =?us-ascii?Q?iGIpDM7l/9g33xuCBUVwJ7nueXG1mrxxOSKDAL0EAIHxO31GV9OEJr1dkRGo?=
 =?us-ascii?Q?cUeNP0YuOCaiZMLzEDukNAmaZv9U0mBZDrIzIW3jEvs88ll+0/HTnV93zd7T?=
 =?us-ascii?Q?SnKVXVhsVYFQoutYfnq9uD7u37H92ByO0ko5BF83iWdXPg73TwmCee05kaKz?=
 =?us-ascii?Q?yr94EYlvkbaSGWOPiHGSPUUblAzicq0bYB9RfWssvYGxUTAeSS/wWo6Ymj4G?=
 =?us-ascii?Q?etXs0k1vjkETQ4nQs/VWAvFoNFEc5r1b5+Kq5iLEb1w+Sy03UovbHTAIGphm?=
 =?us-ascii?Q?CaenBAqricYUcwOGofyPvScYcwaU956mTQ9n9t8Cw4wh07E9jy4WUm3CH4Od?=
 =?us-ascii?Q?TzvZ6E/zm8pI1/t4dY/FzitM1AKGAVGFBW66lF65j5ZyDJpp9ZXTM7S0yGIe?=
 =?us-ascii?Q?11XLzipKpcC9GeRdqnzVHxyinulxX8RTRMauOw0KxlOxivdTWeUUqk7dbidA?=
 =?us-ascii?Q?KwqH5yTNz4iloDICODUmTgP0avE0TwIOI3mBEVodR4B1LwS43W0LfT6K3rw7?=
 =?us-ascii?Q?hUG/ybPVhjgqHeloKsXOsBniSu/iE/IVtrMQgYLoB31kSP0Oyba3DKlIQ2yT?=
 =?us-ascii?Q?eaBK8fgLSLHH3x9KwlGrkwUfxRlH13Kk9F6mEbAIji+QEPn0MmObwrPflnwj?=
 =?us-ascii?Q?axNjuwoRT7+QLyyyUn5DUAinYCj6taFbh7RtoPclxevSozXA155u4GQwbsuD?=
 =?us-ascii?Q?YEWiZBv3sl8Gt1fN7ehNEjYS?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: 10zig.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR17MB3905.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc33a716-8bc1-474e-414d-08d8f54e476b
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Apr 2021 20:39:42.6405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f49eeaec-d72a-4619-87a5-36df37e8c43c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EwWmD9JpQOQlkDNqOf23Dgglyd6P4hQyEf5QKi0bt4T+Ygk0oUfHxY8p4DRR9mbHNITXf9e/A+eZ0FA6dnwp7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR17MB2984
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Linux Media Development,=20

Thank you so much for gathering all the UVC information on Ideas On Board -=
 super helpful!=20

I have a quick question - could you explain what does this mean? (I just kn=
ow that it verifies that the webcam is UVC but if you can explain what I'm =
looking at)=20

lsusb -d 045e:0811 -v | grep "14 Video"
      bFunctionClass         14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video
      bInterfaceClass        14 Video


-Fabian=20
