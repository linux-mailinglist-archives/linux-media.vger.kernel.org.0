Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505A94554ED
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 07:53:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243463AbhKRG4v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 01:56:51 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43756 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243452AbhKRG4u (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 01:56:50 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AI6AQg8009982;
        Thu, 18 Nov 2021 06:53:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=pfxLa1JAqp6v/2yM9J+nP82yhHj4bif/Jpu1fqni8EM=;
 b=FUMCk0PBNaWlwIutjI4Int8tof1sRu7VT38higabjD3FMTWdE1Y/oInvcAJFrFjccKFn
 7PCmQ+ZYumvlMq2ML1OTJ/m973LNrHsZ4UtNzhlFsuIMlnwUgbciD0MnKM1W/UNPHbNG
 FW8Tfo5ODmGPeIO38CDR8Izt9Y39A6ndjPZLIc8pLWuH3ayo2guSKMD6VR5hPPSEwtv8
 K34buzBa7PjyfQsA7RWL8kDgQbo8G1JA7LYMrSyBk+NTzakde++ni1RYnhi9I073c3WE
 4vezejRXh2JeFZT9kl6EDWqmpfmeslDXE9wRTjzkbuuUjX5ZjodaVQh3nN5Va6r3dqLu Og== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cd382d9k8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 06:53:40 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AI6p8bX091737;
        Thu, 18 Nov 2021 06:53:38 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
        by userp3020.oracle.com with ESMTP id 3caq4vh1sg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 18 Nov 2021 06:53:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jX85mxforebBwkprQdb+9QIWGn1IwRvKRONzPkvQiRpMJEZ6S6xKPPVdMgon1udGopT31QILxvXu9Zyuo5IfRFstTko9qrNJm3d5UvjlK6/Cuc2Ynzoj1HakxhQlTl4ahkNdT12/wWeWraWHKjjd/0VtZKi6PnMyFGuYUU/9azbeprpnf5kYvKczJEitKl/CARU+og0NnNUWRojlBX/wMgb9MzczXJRtveDoS4kAMrzpwWzdWHRQk8kuO8eA6/ugu32GjA4kt/sV9sr4YjMjR2+tdpXSgDg/Yd8yZkYkTon9t/BTu7vqlMgeuvQlwSx0k2dFBrxRcgXUoaAqPbsBCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfxLa1JAqp6v/2yM9J+nP82yhHj4bif/Jpu1fqni8EM=;
 b=lSmkE/0OtahNUVbC1+gE/IC9iajxBzBniK8MbQuWCq3zB0lYuWaDIq42NMJID0JPzRmaI2CzVIasJRFiY+09FRZ9uRXD5Xxhq2WwYn89YmvaOKYLtuPr79wQcfaOPrAi7256DUjGO3kU7fkDPyktJUUH8V7IeLb1RPfDZgQSb76y6hb16vWLfG2J9n3ACtNaET3+9bszY4AuitjqaOf3b4AbmRRobE7IpFtf3x83TkEeAzytP4ScWnHnG9GkkwMwj3n6aCMl+LSse8U8y7RNX9aCDeVL+Zuju0kPkjFHzTCdFmyFxhSCVj2ygy9iexleRuFJ38KCalwE2ix9838fow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfxLa1JAqp6v/2yM9J+nP82yhHj4bif/Jpu1fqni8EM=;
 b=X66mB1iTJZTjGgznRyXwCjpu/MWMzn4vjT2IZ/xFYEyyCYShBsYmSU3UfnXRJybuo/FkwqiQIfb5Bygr7Tb91xEriDT80e7AnvUeknJInWxnCbdvWQcEg/aqqtqd+yv/5XU/5MmTD+x9h5VWqigD6BqNvUXOIGXol57v4AC9JpY=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2157.namprd10.prod.outlook.com
 (2603:10b6:301:32::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 06:53:36 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 06:53:36 +0000
Date:   Thu, 18 Nov 2021 09:53:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Joe Perches <joe@perches.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Anton Bambura <jenneron@protonmail.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] media: staging: tegra-vde: Support reference
 picture marking
Message-ID: <20211118065315.GP26989@kadam>
References: <20211114222353.22435-1-digetx@gmail.com>
 <20211114222353.22435-2-digetx@gmail.com>
 <42b24cd0-ac37-3cfe-1fb2-d6292015318a@gmail.com>
 <20211115124402.GE26989@kadam>
 <e4b9d596-d206-71d1-6ec5-1a41af579836@gmail.com>
 <20211115154858.GG27562@kadam>
 <89166c20-6b05-ed4b-ed45-451f4f1e10bc@gmail.com>
 <20211118061418.GO26989@kadam>
 <cec5c6cf048eacec2c8204b99c5708996fa9f178.camel@perches.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cec5c6cf048eacec2c8204b99c5708996fa9f178.camel@perches.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0057.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::9)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0057.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::9) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend Transport; Thu, 18 Nov 2021 06:53:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb99745d-eb2d-43ba-4ec7-08d9aa602499
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2157:
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2157683E99595D5F585C32738E9B9@MWHPR1001MB2157.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Sz1zQI2OyaZfAt6fFvvr9Y8V88kUTIMXLXVhWELnoh/+qGmLA1hhMWcIDo9OXpp8erfXB7Ix5MyrELya00r0pveZ5hS9RPRQvbRh0PxATDzIgWqM17ypfbEVfUUBHNdiayGhzZQ/PK1Fv/Lt3YD9QxnQnOi+jsOfuVGkBySB6s3z40ucrCfnw3BNsm7svVlVX6G/NFwadlqNy7mO83sfDqsBx4wPP07BJ7hhFN9CCv6s63A46Lzra6hDpQQ2VmBGud2IFU2ZWCLiCxLblnJZbMw0S0m0mGZWW1zwdmg5uP6U5vQQi6me0eKQS1nQq61+iHuXdiYKNWN+Q7yZag9mCtv5y7lC7QB9UVbF7SolT1u2jeQKs0vU4RZNLDnEYc+CdiaCVA8QRRS4i9SFO968Ed43/oQG6JaSAA1I0hb5Hlvk4w4S1rq8LJXDNt8u9iB1+GYc/xxTdss1KxLm1ArHPbR+D9kqRd7+finWypTXBmhw80QLN9zQXQc3OX6ZUbOICq2drIGr/70og85BAr7kqy/3Gqd5CRI0eruUmVSlQAi4Sa47H6EQaaEyVm7/UlAdZ20oaV4IlWuWXAwgjhRHrfZRahDrGANvd4oDmWzdxsPJiPinNn3MvNaEdZWZtOqHcJi7mI02rpmJw6LWG5qW5anSGUCa3FUWN367dbpGTk71ycwbVMDJ6xDch0aNBjreImim2zuZO6flcBhL0+igUrK9N9W9mwt4MoPCT3Gdof/tPqOjhICNtUV4/CR6b0dyQEIFvEOUw2IBbhauXwSvUMj+wx4VWuJVR0tQhBrGC4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(508600001)(86362001)(956004)(54906003)(66476007)(33716001)(66556008)(1076003)(966005)(6916009)(2906002)(66946007)(7416002)(6496006)(44832011)(8936002)(38350700002)(33656002)(9576002)(38100700002)(8676002)(5660300002)(6666004)(316002)(26005)(4326008)(9686003)(55016002)(52116002)(4001150100001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YujaI1uRPMb1iiBajp2ZAgstALmPwe+mGU9f9y+oQG7L5i6qdUgP9LGBins4?=
 =?us-ascii?Q?L/YL97gnI05E3tnlrVCFYFCtk8alGjGtLDncPhgD6Rs2r5EXUQmSAvwMioCN?=
 =?us-ascii?Q?pEXptJ+8bPpmDP7MSF+tGYoZVkz7m8bm+CaCoZ2EX4D2VlGGyALh/9uAdMdl?=
 =?us-ascii?Q?rgL1HvK0peYslGFgq0MH6Vf8FiNpR0saiCsceHodbaE1he/qw5jBtKfxk+Eg?=
 =?us-ascii?Q?W+p5whBOdiEKfJXRQGnHGCUSowXlgVvSatplykU6NegNXS4RbttdYPpxI6Vl?=
 =?us-ascii?Q?05JUqjw12vKe7HCJVLLlDn/hySQiw/bFIwM4Cvx6M+BeYcBTW770XxYmKEi/?=
 =?us-ascii?Q?30NAbtZv1ZeVLxUB7BpTCt8SAc2/qnMcervS+wZ8j54+etJyXAtmKG3DjTPf?=
 =?us-ascii?Q?34OdvmAdI5xAJrlewztuZCF4wlFFFSnl8Q2+6peDM9Ygczh2hF2MYC1dI5DW?=
 =?us-ascii?Q?0RHl10GcZDnv1Z9a9lVO6zpqMcvq+FNPoDnuADSAugaYF0ltPaIzgi86dY4f?=
 =?us-ascii?Q?IBbGqVfxBgReA4+209nU1Wsbau5HEfyjPDW+zvRi3LnSX+jyWVNolorV3Y9A?=
 =?us-ascii?Q?9TcAVjgK5YV1eRJj/huX/SWF+GojlRxP1jFcH+ZjjXRuk8orKuMf8GyGS0hK?=
 =?us-ascii?Q?s/WQNC3WsqdVOoL0FJMH7ZxrMpIS8jCLy/CxUT+JVLOsGVP2IShv4rk7ZlUi?=
 =?us-ascii?Q?hgbsccIQnBKUU6TXqWuAvzk5Po9GtlvCAGo73J6QT4PA/+E20Xl09Mb/TR0F?=
 =?us-ascii?Q?py8xHk63OsAPXJXKq1FEwQl8mcbTLToCea0iuAZQY/RqWtfi4cqaWAF04qO6?=
 =?us-ascii?Q?OSzuJreZ1GOvIYWjf2Xj6ZEVgOL0LKosyYXCEazvhrYXq7aK2mnONuYbanrC?=
 =?us-ascii?Q?4iRionC9ZoXHnUoL1OprWc2RGmy7r/cTJAqHuoVR9CkwgWj2AYDLCpgwmkxU?=
 =?us-ascii?Q?RD4f12ihAjVmWSsdLjlEvkrFomSOYiclXbGMEFyW1KGWKpC7NC4Hpo0B+dl+?=
 =?us-ascii?Q?TQgOHitnH0FCDVia0NHR81UbG0pR9AZVMrt/2KFBwlNaCTtpkXA7GlGvZ5Ss?=
 =?us-ascii?Q?DH2HICBvfpWf9EHt95Akw1UBsdRhfGu+R1SYnGWvyZ63zKDfZE7uox0Asyz/?=
 =?us-ascii?Q?Q8XlUrAj+2+pjhvTYlWBRliMiMaqT1iF7K4gSxrBRcmi/Tze1vzpTOPpYHNu?=
 =?us-ascii?Q?E8VcVwFDXYHJEM7N/1tJm6wQnsUTLuKcqeI7ktRnJbNCx8ggEIeexZYI1BbZ?=
 =?us-ascii?Q?WFHFxzMhjF2/DK9R0fyRbt+csLRfaGTKkE7B/RV5PRcPC7VixjNh+PSZ8FhR?=
 =?us-ascii?Q?IcGv9FvmVtItNUmPHDucCNvydoYJrcO8lOADBt3tYCkcd22FSq8eTKf93FC0?=
 =?us-ascii?Q?M2Wgk8GM/LI9xy7zhn3FsrsKTX+24pworQQUpFodhClsnCJZXDDbq1RS2W3k?=
 =?us-ascii?Q?lMtbo7QS0pnxrrgox4clSrIKlxidYmuovAi6KYLB1LRmf3FAq7SQsHT1Ju98?=
 =?us-ascii?Q?vjlHuZJ/9ua0iMfYMJOTnaeTT6A8vwPQtQeAvNtoHoFiRj9JOD0GGXYx2Vap?=
 =?us-ascii?Q?w/gYHZZC/8L3Sq+X2SnkRu1Wwf4DrZPLv0+++bkmzloaeV02lSai0hbuH426?=
 =?us-ascii?Q?qPtDGmr4uyhPQ4C+F2HvEin7Xqvy+pt1Eo/rK8x0GVPmSgmCKUIs2jU3Mxe6?=
 =?us-ascii?Q?8u0gyU9aDEC352KaI3YEa+oCR0o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb99745d-eb2d-43ba-4ec7-08d9aa602499
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 06:53:36.1512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0hei4fgzOGhwpoQRLqNWJL4oXyQE/0kOaCwluSi77rwsTx68CW2d7SwlnNVUdfmvbWJBE0Hz4J0QI9ZyMS/HUY+hUYXzvdK95OZChFni+uQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2157
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0 mlxscore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180039
X-Proofpoint-ORIG-GUID: prZycTB3idBV9g4ZWnzXE5VkYIUHTx9D
X-Proofpoint-GUID: prZycTB3idBV9g4ZWnzXE5VkYIUHTx9D
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 17, 2021 at 10:21:00PM -0800, Joe Perches wrote:
> On Thu, 2021-11-18 at 09:14 +0300, Dan Carpenter wrote:
> > It's not hard to run Smatch yourself...
> > 
> > Depending on if you're on a apt distro or yum distro then fetch the
> > dependencies with one of the follow commands:
> > apt-get install gcc make sqlite3 libsqlite3-dev libdbd-sqlite3-perl libssl-dev libtry-tiny-perl
> > yum install gcc make sqlite3 sqlite-devel sqlite perl-DBD-SQLite openssl-devel perl-Try-Tiny
> > 
> > git clone https://github.com/error27/smatch
> > cd smatch
> > make
> > cd ~/kernel_source/
> > ~/smatch/smatch_scripts/kchecker drivers/subsystem/
> 
> Might want to stick something in Documentation about that.
> 

That's a good idea.  I was trying to figure out where it should go and
I looked at Documentation/process/submit-checklist.rst and point 4 had
me a bit puzzled:

4) ppc64 is a good architecture for cross-compilation checking because it
   tends to use ``unsigned long`` for 64-bit quantities.

It took me a while to realize that this must have been written when 64
bit systems were new and rare.  :P  This documentation is old old old...

regards,
dan carpenter
