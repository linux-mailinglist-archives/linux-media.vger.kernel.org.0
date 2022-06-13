Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95F6D549BBF
	for <lists+linux-media@lfdr.de>; Mon, 13 Jun 2022 20:39:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244943AbiFMSjH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Jun 2022 14:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344877AbiFMSin (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Jun 2022 14:38:43 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DF14EF75
        for <linux-media@vger.kernel.org>; Mon, 13 Jun 2022 07:59:16 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DDYxBu015109;
        Mon, 13 Jun 2022 14:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=1e/byytK0lL2jtOGZIEml8A1uv2p56Lam72Ex+EpIcA=;
 b=kcZr1yTqckY3S2g6TUdm2dH579dEkMi66jmkSmz9r7P2OTZp3fj5o7iR/cK/x/C4hS1G
 nRjxms9ie4Xibi/8dDPlbt/nzHjKIJfMKwNlpY9c0VCCX5rR/RhiJiYmt5EwAH80ALW4
 bVvcXwLmTCe7KvPo8cDTBItn1wMdQH422iRrVf72xNp63BQVMxwWH1qZSIv4U8Vv13IU
 U5PQnS9AJiPuedpAaG5CfoqEsDAYUxf5bPVtbcLq4+/QzWzi3tT+ms2iGYVIcyGopnqS
 FKcPQP8YnFnCYbvCGmerO2b4LiIZx+jdxCTSTdvydUjBM7hAo36fuRr9wiM9ALcUIM/j aw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjns3a2b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Jun 2022 14:58:50 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25DEu1dI030311;
        Mon, 13 Jun 2022 14:58:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gp7btr775-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Jun 2022 14:58:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O155R10+vMLsJmilnxid0OPQYp9uoLgkKIUc/pwnyv3LAbLg6166qmqFf2aVndzkPjjt+WzCQ44/Rb8AvIHxtZ3WhU3irExynycZ1O2rO9W9BbsqrZTqRL5CmEA3D8aQESaKXx1bCVsVTPa/lZ53uUcra0tYa41Hs9oHBIkkcv5bNqFGm5vgBCxMAPpMf3iMq/ru0pC3+uCk7wgFhrbTdIJvPRuYE48GW4CIoiWh8AIZrLsdIcgqWO7JvDFxWxcHbNM23MBSAx425tfSY12S9p5xJg47RTTBbFninZbmN+CGiihDclbt7rsxQxslsm9VmGrUGH9Jtz13bOK/ni9efA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1e/byytK0lL2jtOGZIEml8A1uv2p56Lam72Ex+EpIcA=;
 b=PJ+nkisP0XaRRCpRQpPdgvOuV6A2YXtXAzu8B3SPxATZZpmiaAfY+PXOhReyI7d0l1KEvnJw57KWM8NtSAu0h3xgCAtveptFtAi1/uZBFVsDF+Szcim3/wY3JCBnUEAF4H724U4Io0hAotwzTE/CIvbdeI8OWYD+8KvB1vHDOmENCc7bZDTGgidCx+4j5uAnp8pU5bNdkBVKYyVl7B6xeyu7mZ256TPW/0A56LvZFMoZz2bPvuouLfSTex62eZhZ8HnW7tNhpou5FUcxAvgwwNwzymW0FEPsSlP6it2pZ8rnSdGXrvdMXm+jdhEdi4p7cLVt925SDwH6azwJqG/kbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1e/byytK0lL2jtOGZIEml8A1uv2p56Lam72Ex+EpIcA=;
 b=QwRflJgUFsv8CB1fhzjJkfT70RYNEN/a9zylX1fNYblVKB4poFfBT5JW5DdDDeCeK42MVNVYOMFI2kjGYGcOqPrkaJtgfURtgtJxujT6LT79HomqVGAYp13hjzQlEOpmAue1i9L/9xP5KJWGYZuWD4c9WGC4W9gJ2R/WFJ0Mqfs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SJ0PR10MB5889.namprd10.prod.outlook.com
 (2603:10b6:a03:3ee::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Mon, 13 Jun
 2022 14:58:47 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 14:58:47 +0000
Date:   Mon, 13 Jun 2022 17:58:20 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: atomisp: revert "don't pass a pointer to a
 local variable"
Message-ID: <20220613145820.GF2146@kadam>
References: <20220612160556.108264-1-hdegoede@redhat.com>
 <20220612160556.108264-2-hdegoede@redhat.com>
 <CAHp75VcNjQ+0=LcMdi=64U5qvO2f3PeZCPAf9AKbrGLx4PdKmg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VcNjQ+0=LcMdi=64U5qvO2f3PeZCPAf9AKbrGLx4PdKmg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::36)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 222bb5f3-5a65-4f46-875c-08da4d4d376d
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5889:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB588918E37823C078581EE87D8EAB9@SJ0PR10MB5889.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E2ygKi/iogUOv/J0gEOm67taALs7ilODZWjFF3qnPMuQGMeA7NEcDLteBqjf5/c9MVS92QHraZ4eyF3wT0jGBp1Ssdvb+/WSCveBRIdeXY7x3jwdVXiqKqL6X3qWI7bpoyFYzJqO1ehaGYUBg8br1r11LEnA0ILAjM6nAC/9YZQOJVeCq0KotbCisbjs21d1y/jBreGrkSembXci5m8XSOzmQFjk4pWGKHaTsXLhanbKuqXbVnGb5K1VSIhUMc841nfphFZVPzMln4NE3ZfGyZSZVAVwNUCWB3Q+vXTDc95TlUBN8gWXTZzM9vdmZmWSggsrUhgn8YR+A+CjhIJPhuflIuVto4TmhvBcvqYfECrqDbMG6Gp8+khzPWoOQXTZ2rFh0Wh0ePS2500vhEwpQQJJNJV5qyEeOvvG8m2hzsryypl1sjnzmFa8gVCAh5+G4H5IgIGngXDrpsybxN3uiHJ+znhD1Ki6BsNvXtaWF3kpw7BeRo0O4U0/OTKF7OgR/e7VD9+fQmPHS7A+fcPyw4ti6l4VvfpHDKzz3mMP9GoT5gyCo9mVeMqWaEoT6Ro2llQpxocca6ry0pbItcTgh/AvkkWFUa8VEh4iE8d773258Qv1r1/44+eg2S303w9ZhOMlzOKRoCgZh+4r6wVszCUNiAV2RTmq1DqVBRjo76UFfGC5tAEGqQM0uYO3u1aEs8mRpVBwBjbET3qOyW1jeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(4326008)(66556008)(6666004)(8676002)(66946007)(66476007)(38100700002)(508600001)(8936002)(6486002)(44832011)(7416002)(33656002)(2906002)(6512007)(86362001)(52116002)(26005)(6506007)(5660300002)(38350700002)(9686003)(316002)(33716001)(54906003)(1076003)(186003)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EI6NoTV8xyuY2B968vZSiLDuKEiQ/5zoXB0Zj2GvvlTPu2TBxgfruulRpFh2?=
 =?us-ascii?Q?Hoh23lcbosOnAmejaaw1tID7qSPGIyykWtG0ORIHhg6G3FXYEEEjXjTukiY3?=
 =?us-ascii?Q?F21ihVcRdXSpilnNO0hHsraUHDbCYwOjs6hSvdgr3Z3NVhFLm9E1RiamB6OJ?=
 =?us-ascii?Q?4btN0wVQlaPWRv9daq1NmEaHvy14JWMsInazph2LvbN+LtTptfVQOd7tldXQ?=
 =?us-ascii?Q?ZdVbj/jJA91ndzhP0EjFEORpzsySqDL5Upbab+feuNmyHryYnp4qMCtU3vin?=
 =?us-ascii?Q?9Ixg1e4PnGpBvxnaZAkjMtJFqehwfrXvEGe8yaYyTo+0YOVExRr0syrUR2sw?=
 =?us-ascii?Q?W0TqpmutnM4dLd2SvC+9u6y1J4L/EKjDpGIo9ps706gkMH44InU1bIu8Q7Gb?=
 =?us-ascii?Q?WMZB1X/zKl9mnKS5bIB8IG+zEPHkCDGQ7Zdh+CzK+CsZde0A4h9/RfuabiwK?=
 =?us-ascii?Q?Y/qllRfxH/hgKfsUQIjNLi1X8W/TlXaVQyHm+7NxNdvzczjUtc+1g8kIHL+u?=
 =?us-ascii?Q?SE03SpcVF4BElVxSS0pUd1N3ACIf4vG0mSygJEt3nfC/Pgb/48eMqJW7dUwo?=
 =?us-ascii?Q?XN+mNWwWRjvD5tSWzFR67+FEA6E22asVQ0imwiseVRQMDwchT7OhJKHV1gfN?=
 =?us-ascii?Q?rG5424X519egOMK7jm6v7bqVILM66VdAC20/5YrpFD2E9ZCBDxy3jAYYdLYX?=
 =?us-ascii?Q?Wj/8I/0u+YXgDafkUiTGef8AF77oSujGJNAyOX7BhmZisqKZ9jE4kIp0ye83?=
 =?us-ascii?Q?OhiTrHabQLZHZm569wNnFsKvHiOpR8XOpuJa3NR7+7gBeVk9SxniPZLxp6Oa?=
 =?us-ascii?Q?d6tk8iUVLtwb0dOSElF9vmMK70eDb80OwT5rXIzdmdL+zdR7aNUWDgEhmjXp?=
 =?us-ascii?Q?3pkO8p40UYHv1BVgrmA1Z9VUWc4sxhGekfW4jwerG/C9lq1VcQJAhKe3dwcF?=
 =?us-ascii?Q?mQapduL9bc574+bMAJvB6gK3vakrDSRsnJdp1vt5lfjJjvyUWsXdBigtknfQ?=
 =?us-ascii?Q?kPyVEznD+2GisNcNNX4NKpiajYOM22NCd7zJdt+A6TBdSiygKfmKazCzcB/f?=
 =?us-ascii?Q?YvZTFqap0Vn+jx7s/IrGIKtQcSVjEBsFZaILO0gYM1RsZPR3xsMMec25EtqL?=
 =?us-ascii?Q?XPvsxPdS16A1OOfFbOYsTQxmhQKjyred0V1nLO7RE8D534E/USHCB0p14uCK?=
 =?us-ascii?Q?0vrLE4i+XAl3X0l+qqgHBt0RfwDPa3wYN3o63WRMLrrl4NsARDhRnBzArxst?=
 =?us-ascii?Q?TkOAvVpWlaoQduD+Kz6xJ1eo5wUkhhhkhCl61Wgb7OrtDDJnqmIbCrNt9FpL?=
 =?us-ascii?Q?JswkGdy64pWJ/x++kRVLj5SSMwxTQGtZGub0WAacTwSYxAc0T/naLQ2/MzYH?=
 =?us-ascii?Q?ROHo+wZHG5Ph9dF/Xmx7Q0PbkTWZjV0vIkAwxurOoXVnee/x239S1ziH8kWA?=
 =?us-ascii?Q?uQJKqGiz7whb0UFp/DFSbIfSxYdwllSOdc9L/jyoYwtxOlF/zPHYi5G3Qel1?=
 =?us-ascii?Q?lHadiexbpyrmjyzDzjlQgJXmVJ7G3HG8X3XWzppK786repSDVS6o6oSD6XJK?=
 =?us-ascii?Q?AUI226rOaMxfSnNZ8BPtPCWxVGgI7sdIfEDwUW3E1625ZDUGWzRkVP9m6QLd?=
 =?us-ascii?Q?Nx/kaI/RK0pOCTpwP8mEk6Yb+Wdik+SyhsM3yIjBQwlS5EZjfqcf9C3V30SM?=
 =?us-ascii?Q?x2YQ/jHf1WnZpprM1biP4neu2QfOBq0RsN+K755DAF6vFJJmidY5VOYu/Yei?=
 =?us-ascii?Q?FTTJ+kq8hF60+iGxMckVuMzD4x+JRMk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222bb5f3-5a65-4f46-875c-08da4d4d376d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 14:58:47.2060
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUWI9o5y43VfV3vDctuVVxaGv9H4GMIqGf6+xRw9Qja3ZFFdpQo/nlvXAkP1Mp6aPbyPZ/hcwUPO5W9pWaoW3F7o/xXTHyznrnudKkpkKvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5889
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-13_06:2022-06-13,2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0 spamscore=0
 mlxlogscore=892 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130067
X-Proofpoint-GUID: Bc9-hqNDPb15BDvPFkpOA9vzC4lAtEN8
X-Proofpoint-ORIG-GUID: Bc9-hqNDPb15BDvPFkpOA9vzC4lAtEN8
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Jun 12, 2022 at 09:22:55PM +0200, Andy Shevchenko wrote:
> > Note there is another patch in this series, which fixes the warning
> > in another way.
> 
> > Fixes: fa1451374ebf ("media: atomisp: don't pass a pointer to a local variable")
> 
> Dunno for media subsystem, but for ones that Greg is maintain, the
> point is that revert itself is already kinda fix and no need to have a
> Fixes tag, instead the commit message should clearly have the
> automatically generated line of revert (with the rest of the
> explanation why that is needed). Just sharing my experience.

How would that work in this case?  We don't have a reference to the git
hash.

The `git revert` command came from early days of git and I always
feel like it hasn't keep up with how git is used these days.  The
subject doesn't have the subsystem prefix.  The commit message is wrong.
It uses the full git hash instead of the 12 char hash.  It doesn't have
a fixes tag.  Hans's commit is only correct because he re-wrote
basically everything.

Do a `git --grep=revert`.  Some of them you can grep for "This reverts
commit 8bdc2a190105e862dfe7a4033f2fd385b7e58ae8." but there are a lot
which are not machine parsable like:

bd06db5ff9af ("lib/flex_proportions.c: remove local_irq_ops in fprop_new_period()")
4af2bd190a5b ("Revert "squashfs: provide backing_dev_info in order to disable read-ahead"")
646728dff254 ("dmaengine: Revert "dmaengine: add verification of DMA_INTERRUPT capability for dmatest"")

I feel like we should encourage people to not use git revert because
otherwise we're kind of setting them up for failure.

regards,
dan carpenter
