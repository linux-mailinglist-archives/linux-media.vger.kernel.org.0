Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 708EC4D31A8
	for <lists+linux-media@lfdr.de>; Wed,  9 Mar 2022 16:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbiCIPVz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Mar 2022 10:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbiCIPVy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Mar 2022 10:21:54 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF93D7664D
        for <linux-media@vger.kernel.org>; Wed,  9 Mar 2022 07:20:55 -0800 (PST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 229EW68S028061;
        Wed, 9 Mar 2022 15:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=E3oVbcoLO2ADilC8qKBR3Tn89M26Su2v/OCqCfuKsvk=;
 b=yAl6Wn2FZm6ahcFVo3nRbFwLCGwsVGaU/2cz9sORmKTa5gCrh7KR2ab7wfSBpRVbVXkR
 MGHUCqrY/W0asBtUpYNGT0B5pKmx5NyCgHP/U2YVHqZmy+6bmYhGJcABn0omspAwkR7I
 mFovEqXO2tTA7v/xZo3HVY9thrtfuzXquwhs+ZA5P3f4eJ2h/I/Gh0HaXr72/uobMeER
 Mz6U6HqvaDfZwpquAKjeRQ3xIi2po4MaZx2qZoP7tBlXlgUHSslYMmshoIa8B9PvGKXz
 nIG5bb3C9Yr27nrK5Fv9lOZ9Jr9lkJCZFTUOy4RPVzddPkoXvXuUwRcMnClaPgPJzzCc /Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2jjpj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Mar 2022 15:20:52 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 229FBEZc097736;
        Wed, 9 Mar 2022 15:20:52 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2105.outbound.protection.outlook.com [104.47.55.105])
        by aserp3020.oracle.com with ESMTP id 3ekyp30jyy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Mar 2022 15:20:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y7a2eLKQFZ2jJBI8XpJVh2JPV7Mdk2Us3MtAAU1KmyZQnCbMbtbFlyFdRE6M00bcgUL3PDNp6o9NiwVzaaiJboUIqIo23D65wLzetbc+PLU0rRh/QG0+goixzxI5nl3zCS3NQRLFYS20ELx+3dUwvbYdU3gTnbhs2k8cJJIQy8zRgrkqHC6jTMhTHQsEh15d6VyvnWChGzolt13jOGaVY+ZYjLUOG/2JktJOW9cYn8kaHhg45vGvIuhcf7j5Un8O0HnYDQV5rQTmVWaI9sQOWFS/eFfNji3TdV/7XB7alGGBkkEcOMXyK6B1lqXey85qQWwczpjiDDDJpsfANLYCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E3oVbcoLO2ADilC8qKBR3Tn89M26Su2v/OCqCfuKsvk=;
 b=Rml1DrYeR7Qn7da/6qgrP+Em0LvQ068DkULzhY67jOzeAlhZxhSieYerGd+v9/9yVS1Es6ccdF/zemjdiWmdHoAsBx4PLaktqKvUJVX/TPZxNna6VwB/gksPUGQKyfGp7W71FDGj4CQqOojxNufacNXZ7g+EDA/Bth8cCq9vM3oZXTpdefI7dWzwXGGIsyUz7AdfpOEMEC6TsUt7KelXdwmzejqWXI2/M+8+SRkmgEwwqOO5PBfFFuk38L3ScReiG7pCD41RPqU/dINKgLXPMX8xMUYgsw0rhLweD0TDmxQ1q8G5uv8DOgQog1T5vVjqlM7EHVodgB/qllhQsz/t3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E3oVbcoLO2ADilC8qKBR3Tn89M26Su2v/OCqCfuKsvk=;
 b=gJ32Cg1Ry39zybg8ccUC3WaDCgvBSkNPLH/8ybHqjYsqAsmCvSEdAnvEYN59o9nEmAxmzLWposJ850ZBhUM+F0haOl8QXd1nk6qEqE5LrLIMK1wr+HyBWmMI+RYQkkJDHyKpkfDAolW3azjm0bR5JgOdMy2VLkjyr58AAGMb/lI=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB5236.namprd10.prod.outlook.com
 (2603:10b6:208:321::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Wed, 9 Mar
 2022 15:20:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Wed, 9 Mar 2022
 15:20:49 +0000
Date:   Wed, 9 Mar 2022 18:20:33 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     ming.qian@nxp.com, linux-media@vger.kernel.org
Subject: Re: [bug report] media: amphion: add vpu core driver
Message-ID: <20220309152033.GY3315@kadam>
References: <20220309104337.GA29869@kili>
 <c662ab37-6e47-59f1-0bbc-4003b905f70a@xs4all.nl>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c662ab37-6e47-59f1-0bbc-4003b905f70a@xs4all.nl>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0068.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::16)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa0f3a19-125d-4738-c6c9-08da01e0646d
X-MS-TrafficTypeDiagnostic: BLAPR10MB5236:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB523623BD32ABBA80A5D170FF8E0A9@BLAPR10MB5236.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E0bo1UAPfFUglki+AddGiNgVjM06sw2ccIZkF83mpin3XIfDu2YhyHLDE5HFdUjlSCjHXamfiUq9OxAf5SOOa5uj9NkLd0Jj/Wgn4aifD82pL1v7l8t7J3maxkwaZJ0SHWIh/TmrWaPz9qYafdDWKeN1R+ljRTH/pkcN8wUyX6Il6+/5U6Mb45aOIeWeuOj8qiiIHU0YDh+qJWpmgXDM+QC83QyplWkcr7P8O1Rys7ytWrVU5Wrb6kUKWByqFJbTZ1VpMqTzH4tLTi8T4hERU+yZx3ZQJHTLvfRwA9ul+nUDh0cnXJJvlvfOovssOukn3icec98VJk6av/2l30unnYJqTmxKkyWYwo7Q1WtNfNY7Er72KsNsDdyr9yKKWhxZp36l3aQlCsllxoqmjs5TBjybvaQza6FiB+bgludfg32fV2aoMwUom9iWXSdMq1iVy4z05YoEzYCGu1QBi8ogTURDpvtrjGwBqJjKPz8XRjUjxuQmkjFJO25AZVrjvP1xMeeJAb7fWbt36Lpu6imR4jCHKAfrJ+tiLHnmew5wwqAX1dY1HttbQMfdwn7y/IRo6dW4yLvz185eKwhmY2UzFvanSgJTgoi8Jb9BAL9e9EfikJE4z/uU/BVP33MUjnzdzYGlrrIWDzoZuT8MIA+04vDw0/vU3DJu5jjfZBy4YSr9meTvWJ78G7OBT1CGqfywLU1Hh3Ra+H3ALxDAf8e7hA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(316002)(52116002)(6916009)(26005)(2906002)(53546011)(186003)(6506007)(6666004)(83380400001)(86362001)(8936002)(508600001)(9686003)(5660300002)(6512007)(1076003)(44832011)(4744005)(33656002)(6486002)(66556008)(66476007)(66946007)(8676002)(33716001)(4326008)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tNE737SYUeysHxcv3TxQZ1SKFezxsCkDnrbo9dE2+SBICm4idFhDkL3cwDVc?=
 =?us-ascii?Q?soL4PccIqWYyaTnZxRlARA4ZdYdWz6+rmPE3FI2URIz0Dhuze7AcaOUJ9nUw?=
 =?us-ascii?Q?C2esCCccL9JDWpo2+Y1lZpI93Z93EtafmGY95i6E9i757ifOotRWA0Rnw5GI?=
 =?us-ascii?Q?TGbgx6L0a5EhthfNAU9HKpcO4/ks4Aw2fyStInKRc7qu2b6In493zf4lqShw?=
 =?us-ascii?Q?SSglCoatpJ4/YoOb5m/jsw6FA3a8lnTQgY2EbbYTKrXXjG4CV6HY55GAmjlK?=
 =?us-ascii?Q?gHceqj1MGrTUJunusl4ytNYDrD7xs30Ob+2f9HAVEvmkamFtohk+2pBkOStM?=
 =?us-ascii?Q?kQKJIGYhR6nLaGZLEqPydiQDDY0caqh1DcDEjrC8QSPNEpAHMPvncA6r6jlq?=
 =?us-ascii?Q?LRelO54gSmOK7skTIMAVxCj4IbSGFRGzs4qcGYB+u+Q2oUYX9LY2NsYfockR?=
 =?us-ascii?Q?NAKhOrT20yZoXJM1bhFCQbDMgK0iiAnAf0dMH7CpMAt0w2GrfW4Ce2Xo33FZ?=
 =?us-ascii?Q?rDN7JX85MLD5IQ0xFbQk2TgVnDDQibcbb7XoESRf5CdT2Fwyc6KM26t7n5jE?=
 =?us-ascii?Q?MYJrXGsFGO9EP0zRF0Ji2uOf3BNok9RjIMpptDZglBtd46MpNvwzHX1ozrFg?=
 =?us-ascii?Q?d+We1gH51XKs4Yetj0FsYA18YZkF4i9jztDtynCe0PuANTBKQQh/KterXtAz?=
 =?us-ascii?Q?8Up6foGZFfs8P2I3UMahp8qpOmpbNWJ9sle+xYJRL8tQssMSN+ktrxmR2hc2?=
 =?us-ascii?Q?vN587BRdAjXvcX6n/hdKZi2DnNhp1NKx2Pytk0/AWdoiWErzAqLqx1wpLIfO?=
 =?us-ascii?Q?LAaFilP5M++vD2otKIdd6B6gemhH5GX0bKA7vO87QM7NddHcGwNie26brcbe?=
 =?us-ascii?Q?lD/NYeWHp/Gpw+OZ7tlt4Ongf5HWvjhMJ5F9rhV1mxp2cgOjLKUTRlmv9Awd?=
 =?us-ascii?Q?N8rZowFhAr+DH38acM7kY6vJ/u+SATQjIQN2Q+YatEBAxZp/oP7ZITl80YOX?=
 =?us-ascii?Q?TlIaOpCpqGvw6I75BYmnQSb9EK9+bj1IsY2T7wmEmYI5K3hzqujyASrkTWRq?=
 =?us-ascii?Q?62wcGfuPk5x7qRAXQUqyQ+XbcvFNUKkC6MGFoW1al5V4yR2MReop50sC6jZ9?=
 =?us-ascii?Q?v909TcurWnrhK3ZPSGJ4jUSI/bFxYDK3u/mgFSpfBwpyuY/qzZOc3bubZQ6A?=
 =?us-ascii?Q?FG8o/A3E8s3kqlvfU9VZ6CFFSXvgoEeTiFYsCswLUnf0fW2kXKG1A+jzokNN?=
 =?us-ascii?Q?uOHC+440FNDgBdrDC2Xcav7ai7Kp7xmmEFlK+ypGA7z/4wsFLFsyoxXiFAqn?=
 =?us-ascii?Q?sM/jlafoAghLScGzCRXsdSnHPEScejV7dGpGGL0OoaMkNadqnqUfHRz5xzKJ?=
 =?us-ascii?Q?iefaQWRZuu1qVX7tQNW3Yydj5Yvmfn8VP/QV4VPmM6x7tpIJpaINWsoIfH5g?=
 =?us-ascii?Q?P4tssH6rEMM2SjOgTB9vAyH5sNCuCNxcXpbjdQjLr/2YxmqcjHT0Gw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa0f3a19-125d-4738-c6c9-08da01e0646d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 15:20:49.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIbtw/hExd3XcCA9pae0YhD2bPJK40acuIFVjXvnvRLKqmBbsY9IrpHEIDIEcN6wSh722RdSD9y2KBQkt8pZQEBayR4rkLbGlYjMd9AbOdo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5236
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10281 signatures=692062
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203090085
X-Proofpoint-ORIG-GUID: Y5VMngo6Zk7RV8rNiWHqXPgnrqBPVlr-
X-Proofpoint-GUID: Y5VMngo6Zk7RV8rNiWHqXPgnrqBPVlr-
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 09, 2022 at 02:33:20PM +0100, Hans Verkuil wrote:
> Hi Dan,
> 
> On 3/9/22 11:43, Dan Carpenter wrote:
> > Hello Ming Qian,
> > 
> > The patch 9f599f351e86: "media: amphion: add vpu core driver" from
> > Feb 24, 2022, leads to the following Smatch static checker warning:
> > 
> > 	drivers/media/platform/amphion/vpu_core.c:654 vpu_core_probe()
> > 	warn: pm_runtime_get_sync() also returns 1 on success
> 
> Odd, I didn't get this warning when I ran smatch.

Sorry, I will push this Smatch check tomorrow.  It's simple and has few
false positives.

regards,
dan carpenter

