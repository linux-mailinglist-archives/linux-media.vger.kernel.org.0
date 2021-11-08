Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F6984497F2
	for <lists+linux-media@lfdr.de>; Mon,  8 Nov 2021 16:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235532AbhKHPSh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Nov 2021 10:18:37 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36016 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231127AbhKHPSg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Nov 2021 10:18:36 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A8EneII013241;
        Mon, 8 Nov 2021 15:15:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=/MCAY4FTjddqdOOqgeTb3KDpSkbaTU6yglLWgZsfyrA=;
 b=xKz5JUqQ6Slr0q6MZT3s7SKbx2j6aEZWa6QU0DBcXAKcaAP4XdINpCNCUV61CCmqWR3q
 8tV3tV+v8urMgHGa5jrnr1gkzfDR9xe/h3p9iG4+Vj2j+RcpKxd33D+MIAuP4wRwSMF5
 0r6B3q4V71NHdoUhtoa+zApvOCA0c1Pq1R2zBrkB1+TDJu23SuXW0sT2SjEj7N0uPL2o
 HQgCVFXb1nKcFCrpK9GZtAybyrH7IVYFq0ArFp6BYIw+uo61AuVqjo5lWmIErb99Wv+f
 c29V9AABs7YNbIWSEsNwdvsN4gJBTGROVaTNVTxIJrQC5mGSZC79a0iyTQodkT5LJfR9 3Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c6st8ks5f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Nov 2021 15:15:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A8FBJMG012605;
        Mon, 8 Nov 2021 15:15:30 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2045.outbound.protection.outlook.com [104.47.57.45])
        by userp3030.oracle.com with ESMTP id 3c5etu3n88-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 08 Nov 2021 15:15:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQ6AfdRLl9hRG7ZQsq708k00yUvE3lyfrKK7uhg4G4gkwAIF1gMSpnxX4cFWyyAMNAUmwh6nWYvmeDwHmdMenvOv2j7TZdBRqrlgBlRrtl4BSop+iGSKWW8mTw2z2huHGtgMNgkeU0Lk2AHojZYiPjO9xFU6hw605p0NPZuQL//Tl9HhygwAO+BmVQuBno/sHn9wpUjz7SNp7144QsKoKSlIhCFOpd+dZGbfdYxMAK8/GGgCvZiNhF5tAG6FWPo72MntDWxoWOb0HAjtZeW/YB0Z7GV+706xQ+jGofW4Myw/w2JDcNNR4IQk6WK/TGjY0FdADX5Rv9uqFxfKF1hsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MCAY4FTjddqdOOqgeTb3KDpSkbaTU6yglLWgZsfyrA=;
 b=UvkBSPXq5bOgDi3raOYk0eQMb+vCEotNgIwtsVbx+empixIfCYyHe+ObNQoaz9oZl6BnScCB8VkBNgC4Lb7gpdPTV0fK0PM9ZUtV2AQVhKSXPIq2sdPx6BGUMqaMpKJZhUWZyn1T/U+bpgNMTMXEuRHmqPEiTOnX/vdB35tkCqsGGxa7Js/0bSzIxYkIarTfWI5Q6y4ozoEOBqKgTTN25/NeHzIJlnndGkrPZdsIQDdd4uVgwHxvnROKWP1gPZXu6slvfOa6JOUf/hS5wX7INtW5eWdmo2YpE0Rt6Oxbl1HDBVqBK5pxILwCvpMoHmiPIja6pVdUQVQDWbJ1P/6knQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MCAY4FTjddqdOOqgeTb3KDpSkbaTU6yglLWgZsfyrA=;
 b=KpSHI7ihQTRiBzl9D0Tk1+2CysYuFEBUE0b00i/U9LHy9atE4qSht2//53CUj1grfacBJ8HGKoND2cN9p9H4UeOA1HKL+DdM+KOeqIsSLiWf89rIvCGsGLfQ8/Fi6TeTZRyzp71nYZ60h4PDQRPyTpHEADt3kDO4/jKEl/lbnQw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2206.namprd10.prod.outlook.com
 (2603:10b6:301:32::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.13; Mon, 8 Nov
 2021 15:15:28 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 15:15:28 +0000
Date:   Mon, 8 Nov 2021 18:14:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Tsuchiya Yuto <kitakar@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Alan <alan@linux.intel.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>,
        Deepak R Varma <drv@mailo.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/17] media: atomisp: pci: fix inverted error check for
 ia_css_mipi_is_source_port_valid()
Message-ID: <20211108151455.GI2001@kadam>
References: <20211017161958.44351-1-kitakar@gmail.com>
 <20211017161958.44351-6-kitakar@gmail.com>
 <20211102113332.GC2794@kadam>
 <ed17420d96bd302479b528f7ae8694ff9cd2e72a.camel@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed17420d96bd302479b528f7ae8694ff9cd2e72a.camel@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0034.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::22)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JN2P275CA0034.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 15:15:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1158f22-65b5-40a6-c51d-08d9a2ca991a
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2206:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2206E36F2528E69DC04906908E919@MWHPR1001MB2206.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q5ed70VvWsF3XYTvjYskcOG4xYlz4/aYs/d/3Sf9Uc3pvH0KyabC3vWZ80CxMyZrepMqhVK2KAcnnrflzPSU4rRu5Ec3SsVnycwQ4wUax7IvbjJ19vygmeTOAjdNEEzPmlZKx6lyCgU65xfolBBH5NFv13IEuyScp1hUD3M7Oc5zXO0sgkJ6AN7Uj7kUrtMMc/BucCBotxkBkVp5YWQes1MtDk2xqYxI11T4Azq3XkZxe4yj/laqSjh3rf2txEmYesWJsYrxVIi/gPjbMt2O5YaeboVJtG7tspbUDMwcEUa11ppF2W2g3kJzgc9idePwIvRMDSnBYwKjn+FMKo2sUpCTQ6uIsNj/43YfIwlQkLz982ldPuYynVZRjs+J9cO8bDmkYw4JQY9fMSvJolx07xDD8ol8NJkvG/tSNU+Wp2KLtIvyBwezYbt/wxQD/5t4Dwp93A46121W3tkMb76zCyD9VbB3Q5LS9/BvmPYH0PwEIJJcmyNJASz7FlrZAjo1mSGUGbxY13Q633KAlMprHA+cyxiFNEGUZyVkK86lxpxByuYBAp9zEmK0dfDB44XXlBdI97fuYB4+In5Z94U99T4ZEJwGaggsyLqptBJXV+b1EZhaEHCPf7ehdas1EAo7rElmEIiFA1Gi52qhGfvoGcxTnSmPQRszdqNOnl2T4rSa3doc9RsLO93jnIfY/9CIbVh6tKWdy95kdE34fFX54g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(66556008)(66476007)(316002)(9576002)(44832011)(52116002)(83380400001)(33656002)(55016002)(5660300002)(1076003)(6666004)(66946007)(508600001)(26005)(4326008)(33716001)(9686003)(8676002)(956004)(38100700002)(86362001)(8936002)(186003)(2906002)(6496006)(7416002)(38350700002)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ws/HybgEpF72yrxQ2vqmE5QURUCfOnHlMtrbgC5bT8rBplSHNpPGAAd4vVsU?=
 =?us-ascii?Q?DX+TMq5lgs8L0LQURzE7pDsNOOsCbq7ii1OZm7+MDh5YzGSt8Z+MuY/73ofH?=
 =?us-ascii?Q?6Up4hjf7iBIkUY2dHmIjV+WWX3pExr92oneFs0LyzCa5CF1HZGajrjcqfhde?=
 =?us-ascii?Q?zWz0gaz+mGGRsK30oi9FsObELv08Zuka0Cnq44DNhd7nYlRczT5dBEfOXDl8?=
 =?us-ascii?Q?owVuyF2Qp+V3kw/nCD8/sQ/oqVnzUTHgNx4aBcbre33Zbc0ST0BzyoMuKQ1B?=
 =?us-ascii?Q?vj5qN1L+Vj6JGY6SOjtIvdHLo4l1U7AB3mzPi8D3lB99R+QjyzAfduhFtg9X?=
 =?us-ascii?Q?/pQjTdeWZtKhzxhDQ6TM9py/n61qOJFnCDpqQjK/DGeJ1Se1+Vwv64LBt8Ol?=
 =?us-ascii?Q?Ikd6TKnc8yQbu796YDkcy3RUbR4r0GevZK60eKYsgPrA2U+AObkX+kqpb036?=
 =?us-ascii?Q?A+6A97s08cnB3RbqWwUAyHRvq2sMk01sMWlIoVuRT69e7ob0CFYSyR6FSYZb?=
 =?us-ascii?Q?8bxG0jXZFdE26KnGZsjRusgZJNSz8q4HmZWTZvWslYMCKAaGGjlQfkj/VJrM?=
 =?us-ascii?Q?4xb3sb/g9PRy9Yk+yB8QFjR2tA20+27rOdQaFmmvQo1x3bwjz61fywBx8WX+?=
 =?us-ascii?Q?vlxbQvhpb57ihKnSfkI/cVt7UCYhjzfVDaCAk2Kl6ump9m7iUNyX3FKOklEM?=
 =?us-ascii?Q?naML41XibmOJ2btVNFz+5q36f0sEenNZbHHESeBwJcNaStq6ORPE563praen?=
 =?us-ascii?Q?v1V9JDg72lFrewi3uens4asjrDq84+8DEkk5RsJxpp1E6GlZIJJ/8Wfq9ePL?=
 =?us-ascii?Q?PnUU7GZFNI/cZJArIi3/DP9NL6u9xMhFZQkC2V+BNpQ/VefCkgLua20dMNR8?=
 =?us-ascii?Q?3tTMpA7gnKjJFuQYqcoWDAMU1UEqHZ5z94qypBk+8TrDEPvNfI/KCf7R0mbL?=
 =?us-ascii?Q?yV9eHF1ydJE1UPawoWXmAv96pAGCTTvjGtlYz6NMIVspYUvRS8PE7DIFcMFb?=
 =?us-ascii?Q?r1cfEmlI7MBE07qJc+a/eVdrMGEYPtYBGTPCL3z4CPeybFIMPxmsdh7Ztlk0?=
 =?us-ascii?Q?OKO7M5cZKgGXHkAX+12wdw60B8pmTOxR+1lqLfycJ0TDV00L5czDBDiy/kx1?=
 =?us-ascii?Q?kEhriFTnQ4C95ufpH7Opes3+Lfds2WeJcD/6qzQaQNX86PeciwggTxjLlr+d?=
 =?us-ascii?Q?svkhPwxy9fCn9y0lSChDDRjn4ZR8i8x0u0V+bW8xVr/pM3pHkgONxudQ0eGn?=
 =?us-ascii?Q?g99FM/j+a/zCwEHx78w2osFMeUTCujP/iBIPa+p/Hvitd6YGZVh5P7gfUtHK?=
 =?us-ascii?Q?GKXdkXkNQXsvUQ1Wdu3ajsoH9j1AwzE5gXEYsUiS8Tr/3GtzI1SvcLMo+Ps4?=
 =?us-ascii?Q?NKLlXyp/or33SKLKlnCKz+OWxMmbmbs13l7zVncSYPdCDCmfSNs6Y38yko2n?=
 =?us-ascii?Q?bus3u9k111BXTWiBXQkKcHi+3iNuAyEhGVf2i75KBuwNoeHFX6GxepOhyGfs?=
 =?us-ascii?Q?YsuhG0ChKoCokNLWTOhHeE0tr95+4vDP1Eun6ZfmZhB6N5tWJt1I32yedzSa?=
 =?us-ascii?Q?ypXiYOH/06CX5Us7Bn6RKXkjCH76yp62zUzat9YPp6T1iE5OR9poW0Iqkl8j?=
 =?us-ascii?Q?K5AGq60OYWZtbD7fIsYLpDzzNosxeV4XsoFxcp/MwPGq4kBoGbiE6inubQGA?=
 =?us-ascii?Q?GD1ZsYATMBjYoHdmVSauKbcp5Z4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1158f22-65b5-40a6-c51d-08d9a2ca991a
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 15:15:28.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t6mD9Sq1D/h69dQ+Gt2RcOiHXHcA0GMiaCnUN5bk3fvF1oiqgkhsvvR3YSykVgII7h/FA+nnnL9Nw0/SCfTAkJKKyTnHKLbunUHG0fFHl28=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10161 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111080094
X-Proofpoint-ORIG-GUID: aQHAhjRFiD0t_USO4emAi7ZgtbsOzXHh
X-Proofpoint-GUID: aQHAhjRFiD0t_USO4emAi7ZgtbsOzXHh
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 09, 2021 at 12:00:29AM +0900, Tsuchiya Yuto wrote:
> On Tue, 2021-11-02 at 14:33 +0300, Dan Carpenter wrote:
> > On Mon, Oct 18, 2021 at 01:19:45AM +0900, Tsuchiya Yuto wrote:
> > > The function ia_css_mipi_is_source_port_valid() returns true if the port
> > > is valid. So, we can't use the existing err variable as is.
> > > 
> > > To fix this issue while reusing that variable, invert the return value
> > > when assigning it to the variable.
> > > 
> > > Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
> > > Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
> > > ---
> > >  .../staging/media/atomisp/pci/sh_css_mipi.c   | 24 ++++++++++++-------
> > >  1 file changed, 15 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > index 65fc93c5d56b..c1f2f6151c5f 100644
> > > --- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > +++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
> > > @@ -423,10 +423,12 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
> > >  		return 0; /* AM TODO: Check  */
> > >  	}
> > >  
> > > -	if (!IS_ISP2401)
> > > +	if (!IS_ISP2401) {
> > >  		port = (unsigned int)pipe->stream->config.source.port.port;
> > > -	else
> > > -		err = ia_css_mipi_is_source_port_valid(pipe, &port);
> > > +	} else {
> > > +		/* Returns true if port is valid. So, invert it */
> > > +		err = !ia_css_mipi_is_source_port_valid(pipe, &port);
> > 
> > Don't invert it...  This isn't supposed to return 1 on failure it's
> > supposed to return negative error codes.
> 
> You mean I should instead modify the return value of
> ia_css_mipi_is_source_port_valid() ?
> 

No.  ia_css_mipi_is_source_port_valid() is fine.  It has a boolean name
so returning bool is fine.  What I'm saying is that allocate_mipi_frames()
should do:

	if (!ia_css_mipi_is_source_port_valid(pipe, &port))
		err = -EINVAL;

Otherwise it returns negative error codes and 1 on failure.

regards,
dan carpenter

