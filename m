Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 350BD3C2530
	for <lists+linux-media@lfdr.de>; Fri,  9 Jul 2021 15:46:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbhGINsw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Jul 2021 09:48:52 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:3008 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231454AbhGINst (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 9 Jul 2021 09:48:49 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 169Dahk1023327;
        Fri, 9 Jul 2021 13:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=tA5r5SKQ2PIsbBFKiuiIhTkH9olR3AD70viiTW9x4fQ=;
 b=n8GR0FWjRXvQeTX0YQWbpWcr9P1G9+gxQvAWgtoJC6pHBPRNAEfYX5rsURn0fITbGTs4
 09iOj2V9L57ZvGeuv1zqGJyS+2imQlXhx0T+IeEuMegoYyczSUtB1FrZaYAfZ3tzhPgL
 ZY+/C1g8MRgkGo62ySPQm0iob7z5z+dWjhaTY7v6BdJ+BXdejICTFMDXoMGC+yGQhGsD
 w4m7VAOpXB1JAE3WZx8xlfTE6gd/kEqTX336EbZkpEGteSwldL7T2Vlz4aLy+0RAXZ+Z
 mF4jzBg1Jeb/3MFnS+Ww76RXLp1OGIr+UisThSCsDp5OHAJO3RcBgdhrbdagcH1OSxFQ 3A== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 39pkn48eg8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Jul 2021 13:45:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 169DaS3h052241;
        Fri, 9 Jul 2021 13:45:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
        by aserp3020.oracle.com with ESMTP id 39jfqgwcgg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 09 Jul 2021 13:45:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/TddY9UTb8EzM7wNAavMs93Q7SoxCCz0AJBzqTes8aDcoVAY8TCuJwvCNecEqfnqKRSIE8QAS+8Ply2Uc3JBIEsrcjHdmogh9weoAiIJlyPqEdYAtCPThCzJ2Sz9pvTK+p954b+kHwAdiIcTd4e9b9RVDMeZAzaJbGJYeA1FV5EceuNytTM+6cVherlVTn0DYttSSvnDHuGa0gC9HQ5XFhJ8tTd8qFsncgwzhqL2MTlD1M6c7uyvKvfOh7//1mZXsDtueMzbTTmgJY8ZyqZWsK2bPLcLZN67zOE8MkEso4bL8D33Un/YI4BrR20IUIbLzbjZ0xg89jgpsaavcjePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA5r5SKQ2PIsbBFKiuiIhTkH9olR3AD70viiTW9x4fQ=;
 b=mJfqgsuA8RTP9BmC10ry63LMQWiqxddnSd47UH2z+Bkomhm28EJqLVP/gELqMc134a08bHVD3fTs2VCYWq1WprkbPXiOCKEJDcn1TBAqUq6PgN+C7Cb44QHpABaNFyhhJglgxChAXrIXgkvJTAUvwRqyFmo7bmU3rdz7NbOGk1Na7JTxjstotZvOZ9NAx3Vs3mL/aZDhRuWne81Rbr9YhhIXnxyr//KwPxpwtkREiBnx5bsMc5Q7yhvkDMyrxAcCljoQBlgPY9syYfvttyc4qa2TVytRm+CYZ6K8bMY+oWUtSxQtpZIjt7YZX/LJ5hGntgVCN40R1YHbgMyUmDcvGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tA5r5SKQ2PIsbBFKiuiIhTkH9olR3AD70viiTW9x4fQ=;
 b=duq6hNSUfytKahYPe90skwK5o5yKdEi1kmzIHqNLnC2lxtf/Cg/QBtJTTG8YR83HYGmnIzfXg09XG9HEFeTFs8hC3/3NNPzsJw1AmFhoaPpFXXQyjJx3/Ty6zxWJFyxk/3VeKqA0vuEJowsEeRI95rLpp0ePvkR9C7hNWq0B1Ic=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5459.namprd10.prod.outlook.com
 (2603:10b6:5:359::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Fri, 9 Jul
 2021 13:45:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::3413:3c61:5067:ba73%5]) with mapi id 15.20.4287.033; Fri, 9 Jul 2021
 13:45:49 +0000
Date:   Fri, 9 Jul 2021 16:45:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Jacob Chen <jacob-chen@iotwrt.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Hans Verkuil <hansverk@cisco.com>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: rockchip/rga: fix a use after free in rga_probe()
Message-ID: <20210709134528.GA2168@kadam>
References: <YOfu5Zb2kpN/0Prn@mwanda>
 <CAD-N9QV-x3pzwN4HvpR9w04NnVHs1aafASQvD+gpTWg01K_YUw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QV-x3pzwN4HvpR9w04NnVHs1aafASQvD+gpTWg01K_YUw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0023.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::35)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNXP275CA0023.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend Transport; Fri, 9 Jul 2021 13:45:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbdbd5f3-08c8-4f1b-292b-08d942dfdc90
X-MS-TrafficTypeDiagnostic: CO6PR10MB5459:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54598AB43847EA8DDCAACCF98E189@CO6PR10MB5459.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: npuOSW21s/+9xImuhXrwULKhO6JBbemNKqeo0O+o1hhw1ceazL64Gut46DUwRgfUWBYa1iMbL1eE0AJSlpw74KzP5qkEHzgNMLm09LVcwGa02XWqtbjM8OpreZoODro5I3DkeVYO15oUEWEDZ0bADVSo3+UlQ1usMo5tTbpi0JjACeR4niexmULLD80aUStjdmuA7PdlZcoDavF3uUw8NvUFm5wSDjq1hw7rtk6HLqaLp1kGOkPl4SUtxOCSBcyY5GGtuG0PQ9q3kAEJ6sVEDu4YqKHHe+DiA5MgI62cEi8hjxxCrDvRZvl3S/0u7jUUcqwx3FdfmZFKdeNaboBeEeWrDj+9c4KjUfunxURqRTjG2D5q/lJpVFmLpL275o/5y/h9eqWaGHDhy5VAutEiqNJivicDlWHBudPXGFv1p84vSPktgouUWb+nFOtCDh8SjexIIh9OgKmhuG1xnrmuf9xV1GjXGyvBPesCITyo2ev6tpQcm6W6byOzq6orkK61IYkdG3zRWXC3bEmajEZfyOjUPwGx70gw8Fp+A0QBoMOLioie/yG/Fl7nsEabwcJZtxe0DtmMiBdNRpCzpgWqwDSxYpQb/GFDoHEA8F0fO+O37wIc9vh+41xn7ZDQfa/YJsFz53bjqL73bZkhZ5dNPFEJ39ZG+RhvwxPryg0XMvNrEpjedTw/NSce/Fp7l97brU912ajVxfc+xuca33fNwQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(346002)(376002)(396003)(366004)(39860400002)(478600001)(53546011)(38350700002)(66556008)(7416002)(956004)(26005)(8936002)(6496006)(55016002)(83380400001)(86362001)(6666004)(38100700002)(33656002)(33716001)(186003)(8676002)(2906002)(9576002)(66476007)(4326008)(66946007)(44832011)(6916009)(1076003)(5660300002)(316002)(9686003)(52116002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uQ8pZJIbZlTSxb9RNBVqWxysigbKuC22oQBkZkQHmtfi8FnUari8B4TMykxN?=
 =?us-ascii?Q?OeiJBP39UBfA1x83r/U4nHZPDqVQUC1nIs0Ju/ENuFwa+g+pkds06S7NJpFy?=
 =?us-ascii?Q?4lfX17IobxMbK7AxtvP3e9P5tRmF7jkSiCrbv7gNeECCjSPePNb9UNpMRDAn?=
 =?us-ascii?Q?oNzw7WKz2sZpINud5DA7ZULNcRiTAnp87JgaJfaDSaegovaPArfcVxn135DV?=
 =?us-ascii?Q?kvmxPLW626JuN+Y5kNq/bx2WEzSCNUuLJeRk1cI75Gk6R5hJVIxXbcJDr6cs?=
 =?us-ascii?Q?CPWHbIhsvfNN9wDn8gvgGLRsyhjL+a01wykNYo5AIe8Gn9RUr8UHr7DZ3mKq?=
 =?us-ascii?Q?Gkv91MUo9vPccykfQntcabaKAF5P3iRge56lWHGN3Dbu5lbiB5q7PrRHzRyn?=
 =?us-ascii?Q?Ft9u6dPX76KkZtCEKPwz62plV56VDbKIr2UJ5T3zHYNo3i2Ly36FYT3F0w3I?=
 =?us-ascii?Q?aJVu+6T8OW5v7ZlILl5aHZfWn5F1BFDsmopPR0lfApqab5MrRl0A38wc2H10?=
 =?us-ascii?Q?tn0K4Ix8fNEXZV2STjpIVj0rXozC2w/8ebJcO7al/WGbMSEFibe7JmtsttFV?=
 =?us-ascii?Q?NwZFLQRLa27EPA2GkHjw/60PRnUz60rdFnh50xb/EE7cJYBfo28qDirordQL?=
 =?us-ascii?Q?yGJrxb8XvJ0DFR1SnkYTPUi2vLoypdSCJXkYfebDC5pKyTF/CJYLBrsFlJiY?=
 =?us-ascii?Q?66CG/jKBmKOCtTjhJ3R4QovD436vrSsDu3D/a5EiKcqp0uSVv7Z6ZHi8AdNO?=
 =?us-ascii?Q?RXBnjA9agH75Mj3mxkoB9txp72ZQKPFGDZ6QCfhPSFjv0yjMvsEImxDXMx9H?=
 =?us-ascii?Q?hLwOJzr20I2EwEWYjfxW6yGWzI6+vvfVUp2HqTbJ6Kurerh+Z/RjUgGVkrAS?=
 =?us-ascii?Q?tSxJA0u0MRHVedSBBWuTa7kJ5b9hNBCz0Hia5Tdh9MT2y8jLlnjoumo9ajxc?=
 =?us-ascii?Q?PjL0G/ubnQc4CHa1viPhO+3Tk6pK9QtxHoL9R4wVtaHj6X+ozRThJ1g7BOKc?=
 =?us-ascii?Q?X/5Oivj/Z4QPEoKyESw2ONq0wWxdOQYFipn1sWK06m6r1eWaVN8fGTNX2aEi?=
 =?us-ascii?Q?lhWkBTK00iZRFIGRQbHJRcpjeFSFA3QdAHOxB02+dZycyYgatuaYM3U/gU7Q?=
 =?us-ascii?Q?QgMu2jksgyxnFP5pyNv9l9yBrPTWQ4alDl5c1UqaGneMFlfboEd1AWbGZjYd?=
 =?us-ascii?Q?yy2zJLQHgesi0Wiwe+3nQLfUPBuxE0qz3lyjjBGialIwpGS6PuwyGVKyjXnM?=
 =?us-ascii?Q?7GUgHko/OzW31zNLk0UCVkGA75o4lMm1FVXtxDD4SXEfpqh/oPL+WV8Fp/E6?=
 =?us-ascii?Q?UK7AoD/cBVbW5ykIU/Dwnemh?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbdbd5f3-08c8-4f1b-292b-08d942dfdc90
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 13:45:49.7949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDk2dkRjlampudsxMs4HFUI+3O8/t0RuRs+YJ1EgZ6FhMq85L/FTjqCer8UU4NU88aZ9nYqCgMi1AYGCvwNdxpLPPGaGydTJahcjZTXiDYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5459
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10039 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107090067
X-Proofpoint-GUID: eSwFUPIJM4tHRen1zcb69H_dPW-l5m5N
X-Proofpoint-ORIG-GUID: eSwFUPIJM4tHRen1zcb69H_dPW-l5m5N
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jul 09, 2021 at 05:49:26PM +0800, Dongliang Mu wrote:
> On Fri, Jul 9, 2021 at 2:38 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > The video_device_release() frees the "vfd" pointer so passing it to
> > video_unregister_device() on the next line results in a use after free.
> > Calling video_unregister_device() on a device that hasn't been
> > registered is supposed to be a no-op so that can be removed.  The paths
> > with to goto unreg_video_dev have a memory leak and should be updated to
> > goto rel_vdev instead.
> >
> > Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >  drivers/media/platform/rockchip/rga/rga.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> > index bf3fd71ec3af..37f7fd060c38 100644
> > --- a/drivers/media/platform/rockchip/rga/rga.c
> > +++ b/drivers/media/platform/rockchip/rga/rga.c
> > @@ -863,12 +863,12 @@ static int rga_probe(struct platform_device *pdev)
> >         if (IS_ERR(rga->m2m_dev)) {
> >                 v4l2_err(&rga->v4l2_dev, "Failed to init mem2mem device\n");
> >                 ret = PTR_ERR(rga->m2m_dev);
> > -               goto unreg_video_dev;
> > +               goto rel_vdev;
> >         }
> >
> >         ret = pm_runtime_resume_and_get(rga->dev);
> >         if (ret < 0)
> > -               goto unreg_video_dev;
> > +               goto rel_vdev;
> >
> >         rga->version.major = (rga_read(rga, RGA_VERSION_INFO) >> 24) & 0xFF;
> >         rga->version.minor = (rga_read(rga, RGA_VERSION_INFO) >> 20) & 0x0F;
> > @@ -904,8 +904,6 @@ static int rga_probe(struct platform_device *pdev)
> >
> >  rel_vdev:
> >         video_device_release(vfd);
> > -unreg_video_dev:
> > -       video_unregister_device(rga->vfd);
> >  unreg_v4l2_dev:
> >         v4l2_device_unregister(&rga->v4l2_dev);
> >  err_put_clk:
> 
> >From the analysis of rga_probe and rga_remove function, the init and
> cleanup functions are in pairs as follows:
> 

Yeah.  You're right.  It's leaky.  This is like the stuff Christophe
Jaillet has been working on.

This is also slightly complicated because what about if the call to
device_register() fails inside video_register_device()?  In that case
we're not allowed to call video_device_release().  I think the way
people deal with that is because device_register() never fails in real
life so let's ignore that possibility.

I sort of hate device_register() because it introduces a lot of bugs
like this which don't affect real life.  Inside the __video_register_device()
function itself we just ignore errors from video_register_media_controller()
because there is no possible way to handle it in a bug free way.  Again,
it's not a bug which is going to affect real life, but it's just
frustrating to not be able to write code which is correct in a technical
sense.

Ah well...  Fine.  I'll resend.

regards,
dan carpenter


