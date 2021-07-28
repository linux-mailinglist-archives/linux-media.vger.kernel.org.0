Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79AE63D8F3F
	for <lists+linux-media@lfdr.de>; Wed, 28 Jul 2021 15:39:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236592AbhG1Njr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Jul 2021 09:39:47 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:54658 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236411AbhG1Njq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Jul 2021 09:39:46 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16SDQmqN017477;
        Wed, 28 Jul 2021 13:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=zbwar7pGYuoZfpX4naR3XAkpXMrg6lPo+uecQTXST2M=;
 b=cuK7jr3IAgYiDvjwdORHhgLIKGId/nwINwGfaIGMqlfcVOIUfMPmYYTidR9VHK4NnFie
 txo/sgO6gfsCiTbMdvP+ITKrgmipRzWAMOzUQqRVmOCvZ7rNkF0B5hoFHT7COxJoiMcW
 rg+XRmHdzqJstjUpwXQubab/fTNcmJi8sF+h531SuMa8AFUrLIjo5XkRGuzeRtVIzDvc
 kNgd/huRgyJStfVFVj4nrfhKSYMExKr7ebbDsPF6JrX2d0aFH0a6NU64xzRQ/0kWEODj
 HobsCpr0qBuwHr+jg3/RtC5nyrlbXl81C/sPqLoJG91Um8un26aC+DGm402CslTCFoi6 OA== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=zbwar7pGYuoZfpX4naR3XAkpXMrg6lPo+uecQTXST2M=;
 b=aeXQmfOcuPRjWxxxGRJEOcPbgSflmk1EthWHgiiKdO7IQxL4enjoqcUXAgTyfdu/t390
 ka+mNGFyRxwShEHeMoOfmifZzRWRPaLRHcSW67mpQTnjjWNsr+Se6kEvE2C68QJCSAr5
 UCBpWjhYepXwbNcqNgea8mczgD0PdTyo/4qrD1Mbyjx/CrHVe51AOsYuKnEsF6ho+epA
 2h8gJ9e5YUdfHZkY2xp2ow9xxke3nFCNRRUFTukkGzTl0NdBomHn8NVpUr38l+CMvjvZ
 4UkzrHzwLhQNz0uFess3jtf0lY4IRRflxuhjYyvspXiGulCWEaBB1fK6o7Rc36KrhSTh yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a2353cfuh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jul 2021 13:39:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16SDPaxb142010;
        Wed, 28 Jul 2021 13:39:33 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2101.outbound.protection.outlook.com [104.47.55.101])
        by aserp3020.oracle.com with ESMTP id 3a234a6auq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jul 2021 13:39:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KewFhH6ubGa6m2nvvT+7ValA2Dk6XS3apHjswPx6mDEfv/PKERKb2/B22HMtzssBZBV9X49usua6uM5DsYVXnMbZGsjSpimzFUl1cVEclpgiPJxmZVOmaS+es4yS4oxMvxJSeqO/jr4vfeZQ8ymdp2C0WAO4iLsQBvChpRlnTCWvGWAvfcP3/+324tYHwrLBEjG9jDGySdQDSvR2XFjH+DX96tFWeSQ2D/ii5bKIwoEvtjG4uUdjLRE/xqdci4kj73eP56ukHsQbRkvkIWYpLvHaibTGQMJ5u2zfSKDrlO1eiB+DF9LhYdxts3CKUR5ev2M83CZ/ewYoHkZCJRP2vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbwar7pGYuoZfpX4naR3XAkpXMrg6lPo+uecQTXST2M=;
 b=ZDXEJrSgLDUG9vZv7Vq3R8MpZfs+swUgr/X3CNjQjzcUfdY/CEEOE/EhHz7DUqevT3OjprME+nuql8TgoEKlWKiRcCESiGSqgSZ5jVHqCO7GJJov4K/brtQiBt0KvaQzuy26q90Ca6g35ksZD7XKh8lxnrjgfCj6DV8926Dsin9RmUuv9j2B6mHF2in+mJBc4NJCpA619NIURrUCXuS6o/CcGxx6aGIH3rEi5NQoDBqOXRN7qFCOzzzbGicEpBn2xZMYtuY+B0dD+Bqvg6awk4yCbwX8e6VVY8JqOLoudj52OiYhggP7JWFFxXxK6V9n3vwknF36yC1Tf4+U9VzC/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbwar7pGYuoZfpX4naR3XAkpXMrg6lPo+uecQTXST2M=;
 b=oe4JVf5O+E9AIrmMpMA59Agxib0p8hI4tJ5AEn62RWxpMhVUGOj9wogPSQGLlChh9CvIoQEn1r3OVIhY+Wc1HSDKzzkgvxu5jRx9TGAmshRxZC5mdeB10RrwuGS65w+D1S0slwVkgh2ztzfv8Xz8l4yK/QDDxSXuvPBxd0HoGrY=
Authentication-Results: sina.com; dkim=none (message not signed)
 header.d=none;sina.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4706.namprd10.prod.outlook.com
 (2603:10b6:303:9d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Wed, 28 Jul
 2021 13:39:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.032; Wed, 28 Jul 2021
 13:39:31 +0000
Date:   Wed, 28 Jul 2021 16:39:13 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Hillf Danton <hdanton@sina.com>
Cc:     syzbot <syzbot+005037419ebdf14e1d87@syzkaller.appspotmail.com>,
        igormtorrente@gmail.com, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] KASAN: use-after-free Read in em28xx_close_extension
Message-ID: <20210728133913.GU25548@kadam>
References: <000000000000d068cf05c716264c@google.com>
 <20210727100151.2051-1-hdanton@sina.com>
 <20210727141455.GM1931@kadam>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727141455.GM1931@kadam>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0048.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28 via Frontend Transport; Wed, 28 Jul 2021 13:39:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9158455c-a07e-4520-3650-08d951cd2093
X-MS-TrafficTypeDiagnostic: CO1PR10MB4706:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4706029228170E993374D5D98EEA9@CO1PR10MB4706.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BS3Ks2yz4fmRa3aclPpsxeWlAuDA3SekHRQFc75SwNmk8VzN+DqbLBNCDJ0U6+hfLKAmc+ujXFdz1aI1f8gYkSDwAoeNSB91vaXyWg9NptACVCG6uY8tP1Wel/sZqxSR+4iJYGJINPP+W9B2SR4x1jWU4VHMrwk/ZP8OwChoy+79EWEF3w2RFZEZZKvxNf9VKk7AsUzzr4elwqhPvXGuetTofdBpQsQQMkl1aWt6PSI/b5v0eSUWZuSESuKIywqC38J9P0bEvQe3D1z7b4nHJQN33n9ai5ey/0AtofwrULim9GTL7y9oJgwzBNAVISIpYiC7Vzb2OKORY7yzAkYUntGtqiA9v/6Ln05rGDp0+maZUCjuyp6KgGU8QUP7NgQcJKROWrB+U8iWtHUr3/CNjBZtaqoZkQ3f6mM/vmXztTfSttXaYZ/vZI7+qGlh2QrOnTUYqCdJmG+CFtu5Lti6rCF3H47QdRCfxrZkRmE2a+K0UsLFNbGxPSZzrghqjSG34xp/3gFGEu6qq2UwjIaKj6BspQSJOXmZo9ghI6KGijXqTpAYOi+szx3VSnlosBTcYZqjE4NEMe2DLO5zy1HgaLJSNFZbcPlZqvfU0NCoafl/H0LjFFt7mAKATFr1ZNeETR9aS706bcVmdEgEABUJayh/yMcPSvFZ3MKex9nVfolxpf4qdmRaAmaefizoKFdDgfw18Y2EL3VZf0mL8y0dIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(346002)(39860400002)(376002)(366004)(4744005)(6666004)(55016002)(5660300002)(9686003)(26005)(86362001)(8676002)(8936002)(2906002)(33716001)(1076003)(33656002)(44832011)(956004)(4326008)(316002)(186003)(66556008)(9576002)(66946007)(52116002)(38350700002)(38100700002)(478600001)(83380400001)(6916009)(6496006)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9Y7pCDXEXZIuBMhup+kSfRuHjSP7zs3ap6JrJCQxgZYFjd2AZv4iFvD4JcAr?=
 =?us-ascii?Q?usSlcD8xaTdWwO7GYJ1e4oQ/G+u9qljG4y+dY5E877M6hhhY1v30GO2VdQBQ?=
 =?us-ascii?Q?YqGMxyBAE0RzP4HqjvnX53trm2eE5CStThzZM61seP4uPkabGYPV8XTzAPFC?=
 =?us-ascii?Q?xDy+hGW24VEIA6axPTIEJ+nR7fK5gUQN7NaKHFAkeELdd01Z1jb0l87vu4Pl?=
 =?us-ascii?Q?bcP6nNMUi0hjH51TwBptuRFRKEQZ9Awy5bYejShjrm1aX0OhXZq1wBtWzZbM?=
 =?us-ascii?Q?8FikbbwWWi5wK27zRS2Y7ThVHlYdCWI6wV18ObToYnzAOkbLXjFi6wyg0YZZ?=
 =?us-ascii?Q?CfSNUls5kBu6pLuv9EBJeIhDMHbJKM2aDd2HHvDMyFHMHWjxNCualnptKToA?=
 =?us-ascii?Q?t+2HGI8MVlIGa67YWhjP3LXErmoKj7K4hXby9vwY21JRr2j3SBlnvl45xcYf?=
 =?us-ascii?Q?l7mysDUu0mURTx9/feJJbmzxnb8QsYYxNArNAdl1ZEYtf/VE3I6odv7I6wxm?=
 =?us-ascii?Q?LQ8abpsjuamCQCDbOPEkD1+xFcM6bozyRoRrPiHFyhCzTl9LxYmfzcYVv9Kd?=
 =?us-ascii?Q?lho9PBqdREtv079UZ+SmHT1DOvYNNLtx6utYUvhmLBqT+Xpmue28D8sSMxAh?=
 =?us-ascii?Q?T8GlyeZnMItIA6/OuRsRyeeO+cOu9MIWu4rpVZczPSaMQzTJrvzMvRjHI1GY?=
 =?us-ascii?Q?K32tL0vwmRAWikRM4S5IKPpzjwx2e0IVFRVLZZw3FGZqCM0O2zyhlj2gnnu6?=
 =?us-ascii?Q?/Sd5aPQgscn/dSvdE92a2VTRuuua0MlQs7rWmv3sAIPFggGVeU+1g3INpq5A?=
 =?us-ascii?Q?lv9jdv/W6doZdoZsOfrH/GoourK2jSKoZXsM9rmSpNXrGSxuQtHktMSYaOP1?=
 =?us-ascii?Q?+dgFUSv1/zrZIOISs+lycFjap8xRpZDVnYt54r2ANbDX9+kGETAAhAFhTRSE?=
 =?us-ascii?Q?pzZyh18ruCrwVL2sbfKCIqTBc2NsIzX1MlcH5TJD5JVG1ATKyX18p3ATrD2o?=
 =?us-ascii?Q?kUoX8i3tzDQ3kWlRRcwqU9A5FqAbCkZEHFKlE5Yk3Ovv+tSUO1Flk4jwdbTB?=
 =?us-ascii?Q?4NNxo1dSPVf/2RTGR2GBFyR5ECWVlThNJX9BHhLNvV/o+ugWoWX/JwdVvqud?=
 =?us-ascii?Q?Ta2ugnRSgsAbVAPo4PQLaEf53RA02uSJnXNlbSgkY83Gt06pQeiXvfI4uoWy?=
 =?us-ascii?Q?vtEixFifalLE65DTBaVXF38Z88Jm+PshcJn7HK0FKohTNhFAbrcwdqh7+6q9?=
 =?us-ascii?Q?41rGqreQG5Jz0udGK3kHQ3tg1LAIrFvzxbw52Ph5fq8IBR8pQf2r8JriFVar?=
 =?us-ascii?Q?BOIPAIdQVNqUTVKy/Wp42OiT?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9158455c-a07e-4520-3650-08d951cd2093
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 13:39:31.1506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GfXmT12I/b7G/Y7IoUr5pRd/A7pTsXVC4y0V5IU54CtscozFOHlOSEqqSR4/7nleVZK0n8OvHdStjunILcVy5fyfZ7Ozhczuexq+gFwUaz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4706
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10058 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2107280076
X-Proofpoint-GUID: 3lTuhILf9LCfxI55gJijhQuCvc7TY-0h
X-Proofpoint-ORIG-GUID: 3lTuhILf9LCfxI55gJijhQuCvc7TY-0h
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 27, 2021 at 05:14:55PM +0300, Dan Carpenter wrote:
> On Tue, Jul 27, 2021 at 06:01:51PM +0800, Hillf Danton wrote:
> > Along the probe path,
> > 
> > em28xx_usb_probe
> >   dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> >   retval = em28xx_init_dev(dev, udev, intf, nr);
> >     em28xx_init_extension(dev);
> >       em28xx_ir_init(struct em28xx *dev)
> >         kref_get(&dev->ref);
> > 
> >   kref_init(&dev->ref);
> 
> Good detective work.
> 
> I've created a Smatch check to try find these.  It uses the fact that
> Smatch creates a bunch of fake assignments to set all the struct members
> of "dev" to zero.  Then it uses the modification hook to find the
> kref_init().  Those are sort of new uses for those hooks so that's quite
> fun.
> 
> I'll test it out overnight and see how it works.

My Smatch check didn't find any other bugs, but it only had 3 false
positives so I'll keep running it nightly on new code.

regards,
dan carpenter

