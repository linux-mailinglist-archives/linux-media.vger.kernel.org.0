Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E723FEF47
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 16:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345472AbhIBOUw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 2 Sep 2021 10:20:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:41818 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345452AbhIBOUe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 2 Sep 2021 10:20:34 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 182E4nnj017081;
        Thu, 2 Sep 2021 14:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=LkcbIleM4cOqQMd9Ysuk7qXZqeoCWiPnCHAT609cgTE=;
 b=aSzoGyeodVIQEpIigfhth+isWH+bJlBqsH5C3PP136YJdw/QHB/Q5VLt9dbkSHITJgqm
 V/9lotWRm4wVkr24iBhek3ZtkMvs18vGt0ygymWeNrTpp8eCTHyoBx+97rz/8h7da8kh
 GLWmHo8ba1cAwbIol5JQPvh2R0GNTy8GcReQJGtLPeUlPoarca9uClmtLbWJ99QH/D+B
 /EE9u7agoOSyHm4U05GMLM++gobOJZAcEepINSX9fhVbexJrMYPjEeUZGXJDTstvgZNt
 EKJxplcW/ck+B0quFhdiETMhEg/KuZS4qpqcKeBCLuOaH3eSHgExmXW+5dc4ggEWqYnG vw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=LkcbIleM4cOqQMd9Ysuk7qXZqeoCWiPnCHAT609cgTE=;
 b=HiAe3tyPOReQg9ij62wADDB0Xt3Qq+rFtdtcya1UzKb7BN5YJgZ5BAQa0FLLaEwBdTFY
 XgSuTKavdl8nnkNOzGAPG/3LGMezE8bhwNRoTlN9QwwO99LfjEtbRvemXtPch+LvxOrd
 53OkstJ/cNfMWOs83gM7ByOB6Xyl/+/2aPD8P1u2J68pCWciR0hzTcw8uKgP8xIdyB3M
 OPiDJpUT4qgaoYVTI6RIOf5n3epe37wEYLP+3IkquowhY7nnljFVI+MG7OcNbX3Q1zfC
 5XUXraruzUg7yKMMmhAT0QFc+ZT2Sbr1nonxlwSTOUfVdwjLLe4Izs7xcmeMXXqCsxc5 lw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3atdw1awaw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 02 Sep 2021 14:18:07 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 182EFuRC166975;
        Thu, 2 Sep 2021 14:18:04 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
        by userp3020.oracle.com with ESMTP id 3atdyyx65a-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 02 Sep 2021 14:18:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfW+/lBh73oRygy3G753qTwVZtomYbKFavGiDxkQADSMkOKZqbLSRaaPZY8BHatLkZbPc4Vbaxw6wHZCxKGzo+OPefPfZ5BTojstO0ifcnUGanBdW/ScqwGz/lBrd35kiuS4ZeIy8adWvPpOtmqifFBT+dtDLjUfZ7OIITXyXX/mbOR20mM3DmulG2Idlvh+T0kf+diGt8yMPr7txy9mo+WWos6aGc87f1ri2amUmoZ3anr/pMVRYCPRbXaTpWf5qpNO42gZSmKNKYDIsxYNadF+wbmnPCq561A5Z+0djLMIggV1eFxmU9Q/M9w27dSuPe37HhtGyyS3+JbFPSL1OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LkcbIleM4cOqQMd9Ysuk7qXZqeoCWiPnCHAT609cgTE=;
 b=C6smf39QaI9HQIDTaKeCIjNdH7tSXbyyjIW8UKBIzy/aBXQH5I1I5yzHRpnFePhXU9X00rursrU1rdpVJ9dVTEWZanj3N56UTUInM+Tq0J6W73b8YsBfexAPUQ5b0Okg7C91aC/XSwONgM/JDuW+GlLvw3rsnTKnJlGRcTFyu8m0x8KL3n797uPQ96CxYaEW7pELmKMElwnk2zx0G9Y975yi61qIRubBXiDVabZAbao+6fVejL8ixXxMSz5dFAL7tfNUDvMc3EmZ3tR3MRv24qqJFFWVTxooZlEnfHiN0fn3uF053ALmZptFudcw1GkwK5JfWE/qUCkXob1pBS2PKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LkcbIleM4cOqQMd9Ysuk7qXZqeoCWiPnCHAT609cgTE=;
 b=pzgVz4EGjFl3Ikg6+OE9aqI5Dduhqb6kQOs8MdEB8busmhrOLA3Y8hmJEc5AEyVb3UGPlPmAa4ywPOoMH+slbu01rk2Wt9WgOickGQB/JoSu6xF/aMzxTVdxsYPMoSvx1KV6TykWrvN+LtzH2vRVZ89fta/tXjA+H/ATQgQhdqk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4692.namprd10.prod.outlook.com
 (2603:10b6:303:99::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Thu, 2 Sep
 2021 14:18:01 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4478.020; Thu, 2 Sep 2021
 14:18:01 +0000
Date:   Thu, 2 Sep 2021 17:17:45 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] media: usb: fix memory leak in stk_camera_probe
Message-ID: <20210902141745.GD2129@kadam>
References: <20210714032340.504836-1-mudongliangabcd@gmail.com>
 <CAD-N9QXWHeNvR06wyg3Pym8xUb27TsuFKKKG=tZ0-x5ZGCr-Hw@mail.gmail.com>
 <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QWj8w-xVAni2cGHyEei78iKEX_V0a00r0x3We7tfFGZjw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21 via Frontend Transport; Thu, 2 Sep 2021 14:17:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d951a077-72d4-45e9-75aa-08d96e1c78bf
X-MS-TrafficTypeDiagnostic: CO1PR10MB4692:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB46924E5EC22B8C41B486025C8ECE9@CO1PR10MB4692.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgSIPK4Sx4gTgqnN6ZiY3yNDhVfRX44mHcbPvTnvoBMs9dArSW7h2eVRtkxoO2/m33CsfGWYxcxo3v9FXvJYv0aKB5j2H1tpfovTDQqSD9HSyUsCpINEYbCDn+g+QXqZruQSqUJ08xWgk6blYVi3dHdSFuTeEvNdM3ygXzPZm238joDLU2ob6QVNhT5Tzg1rKYd9z3/vuUJ+VoBmFOqJ9063C0E5k/Km3PH/xAbWb4IB/xYO9S/9I0WFI/WWkcR82x6Q1y8+6xt8P7KmewSNf6kjL+fFRplfDLYX8Q00VWuD74Sp1WCt6C+BXDxDzarwnJrDupuuDV2QGLuHFfzQE2pwdsK8mYR2onwlM6wiLviowYm04LFhx+GDxWFKE0+dHqncGayI2nifeGh8vhkjxMuMUEqQlGzMb/Hs0qQGwvXBb5GnOjFELw7R5iUeJYdnQcAZ+6aYHro/7iI9ZEKedrZmOCry0S08LAKf86U11d5Z/sRCgPirYfiY5APBSUdBnaO96RvJiOTv2FE8n7O0NO75/DuPJcPkV8dtMxTUvT7Bpe65qdgDR5rZZhkPHSpaSBtmlxFYl+sbBZ+VmCrN0ceNks2VxDxwN+nyr7Yy2qnCQwQ4brHMmWQFT5hJ9Ip0i9RrCtemR5C3GkXXb2W66TUr2mK7RqOxaJjh/DwmuJK2lulb1qcRy3gkMOMwkYT90RVLH3/LWOVUR+I6EyGLQQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(366004)(346002)(39860400002)(396003)(136003)(956004)(6916009)(44832011)(2906002)(4326008)(316002)(54906003)(186003)(26005)(478600001)(52116002)(6496006)(53546011)(66946007)(66476007)(66574015)(66556008)(1076003)(83380400001)(86362001)(55016002)(9686003)(9576002)(6666004)(8936002)(8676002)(5660300002)(33716001)(33656002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G7VF7nOj/TNEIyw8J9mltoyPhOrhJoxH2uIU6D9pQL59s7bcjwgW7WpmJ1d2?=
 =?us-ascii?Q?xLoxrboZI9qhuN56+L219H1QjEK3pLZk/xk3hwoenD7MDkWeMkMSXYjsCaSZ?=
 =?us-ascii?Q?59yd8oS551l9IdlS9Sdh8DT3eXxKrbRGwACP7zHdKqzj7KEkhE3mhyy5Whhi?=
 =?us-ascii?Q?P6hJ2+eyZp+yIEali3OYS5ddraCOeOe8TjARhu20tc8HkTYPY6NqHVsw1hNc?=
 =?us-ascii?Q?WYqOrtMkSv6IMDwnbwgAUHtvqVSNxEYrQ61AuXs6bYCAUb07UuQY+6IEo/yF?=
 =?us-ascii?Q?LfRmXaZosvEXkQj64sEtUzAm7QM9+IXz+hcgkKCvHph3ZHzW7WBdh/Nw9Yv1?=
 =?us-ascii?Q?hh33LUiP3RjLBa1NiM6aYt4I1ys7uguKpXce/xb5T026eIYSOPeR1o0EkovD?=
 =?us-ascii?Q?T5KpYxaK9ir6BJJX0OO5/+1vBl1XgwFWxviqTh+GiPJRKGdjPz9kf6Ij4Y2e?=
 =?us-ascii?Q?RfxAQG4RBJmTMcSt8gpfBurCiwdb8S1sFeADDQDhHXd7CQDIC5jXyusm/6UT?=
 =?us-ascii?Q?RXwkDo+xtSJgooN21OMvgM1NCj1P5SMrHI6Sctu1xHh29jhA6Z0PD4G87nTs?=
 =?us-ascii?Q?gvzKYypkdJCa/ZYC1dwPHofu50MCHGdac6s3dddj25SZqf6qkbRhozVNyNus?=
 =?us-ascii?Q?+Nk4fHxBv8ipzwG3QbZY8slAX+3lSLLlCokdUwc+a62Ly/9IJ+w5CV49kYDD?=
 =?us-ascii?Q?aFyKK2C7UAxiEBF1wsNyDeGhj4QfMirTA0wpAsXtjqvuRzJBaPpvkjYMQJG6?=
 =?us-ascii?Q?eO0o/gZCihzHO1DTPUhg05TGLfkthbu6qyKdO4ObErE3UjsxfyJL1esKVOBo?=
 =?us-ascii?Q?o7Xj1+MMZYw+qys3OOQMmak5r8MDZTYMFUJTjVzSg0O870zU0S5AEAfBzIjw?=
 =?us-ascii?Q?vFQb+Jhkg4S/qUBoKfBJYOaU6V50cp4yXHwTRwdQ0WCV/F/iCcrtrdvmJT+H?=
 =?us-ascii?Q?EnzlL+qXsjT8igALmDv/kZiB7f9JBPmqjeI6RYXozubbVe3VuAy9uhhccWH+?=
 =?us-ascii?Q?qdJwoF+DGuNJAPRYfaNtFrYz+LHe/wyZL0k5YiIsMwx0G84KTOrPWlRLQ5AI?=
 =?us-ascii?Q?5KlGzFEJDH1AA65DQfSuY9gmQm28W867ZChpMKvtYGJreXJZ9hTshcgZqpiV?=
 =?us-ascii?Q?QS93Xn4t6PfW/l9nKxVl2y3StE/P3C0p5oLxGHrQcAg/0nhUCbWTu+wvWOht?=
 =?us-ascii?Q?WsU3/lvVGHMrI3RdUcBvW/p8tMeh/7n/2qeSW5/mowsvDa4irlWvM+KLefdt?=
 =?us-ascii?Q?p8cDlQdFvcQrCaFAEyrlCTk/vcuvDLM7Pi0Kskp/aB877OojGDUdyRgQ9ReF?=
 =?us-ascii?Q?mpuH7RgbzhpwEvgPervbtN0M?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d951a077-72d4-45e9-75aa-08d96e1c78bf
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 14:18:01.6317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWSU01QLl2XMWTIZDVLdV3xfi5pQikN++YTZitPeKY5c+lfWppnmlG+EQwYnJnMW9GhTz+mOoIhI/2Xz5NlF9e3NE8m054JZGRYEdtxEpOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4692
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10094 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109020088
X-Proofpoint-GUID: D6gEbqHxdE49KEaIOQheikDRh8gO8gjI
X-Proofpoint-ORIG-GUID: D6gEbqHxdE49KEaIOQheikDRh8gO8gjI
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Sep 02, 2021 at 06:23:36PM +0800, Dongliang Mu wrote:
> On Fri, Jul 23, 2021 at 6:11 PM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> >
> > On Wed, Jul 14, 2021 at 11:23 AM Dongliang Mu <mudongliangabcd@gmail.com> wrote:
> > >
> > > stk_camera_probe mistakenly execute usb_get_intf and increase the
> > > refcount of interface->dev.
> > >
> > > Fix this by removing the execution of usb_get_intf.
> >
> > Any idea about this patch?
> 
> +cc Dan Carpenter, gregkh
> 
> There is no reply in this thread in one month. Can someone give some
> feedback on this patch?
> 
> >
> > >
> > > Reported-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > Fixes: 0aa77f6c2954 ("[media] move the remaining USB drivers to drivers/media/usb")
> > > Signed-off-by: Dongliang Mu <mudongliangabcd@gmail.com>
> > > ---
> > >  drivers/media/usb/stkwebcam/stk-webcam.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/drivers/media/usb/stkwebcam/stk-webcam.c b/drivers/media/usb/stkwebcam/stk-webcam.c
> > > index a45d464427c4..5bd8e85b9452 100644
> > > --- a/drivers/media/usb/stkwebcam/stk-webcam.c
> > > +++ b/drivers/media/usb/stkwebcam/stk-webcam.c
> > > @@ -1311,7 +1311,6 @@ static int stk_camera_probe(struct usb_interface *interface,
> > >
> > >         dev->udev = udev;
> > >         dev->interface = interface;
> > > -       usb_get_intf(interface);


The patch is wrong.  We're storing a reference to "interface".

	dev->interface = interface;

So we need to boost the refcount of interface.  Pavel Skripkin was on
the right patch but you need to add a:

	usb_put_intf(interface);

to the stk_camera_disconnect() function as you sort of mentioned.
That's the correct fix.

regards,
dan carpenter
