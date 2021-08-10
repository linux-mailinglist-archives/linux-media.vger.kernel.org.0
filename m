Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD643E7BE8
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 17:15:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242747AbhHJPPj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 11:15:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:28782 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242743AbhHJPPg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 11:15:36 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17AF5hAW032499;
        Tue, 10 Aug 2021 15:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=RR5qCNyhEDAT0V0CI83/sj9ryd6TYq7WmAmI2GkvDtY=;
 b=0Z9x5U/ZV4LQhl+wUgHARq3MfnoESliDAYel4yrwHhViP0hfr/EnYgFJdJC+Nv2pePSb
 fHIElf+1bFJ5o1KF+NxOb1AiIkXkwS7sZbD0aLnACRPX6/DoOx9I6icFh0P6GANshZz6
 nqXuhxNQqjc4F0X2T+B30fmko69lhlof6GsEPoo0d3JkdGYGgTK5kFcKSvo3TSH8MSLP
 BUAIWRwWSGPF1LK0qPrTxEUIQ5VPKMO5ntGRJ7k+HJkZjrOJcujSIq6YM19PhGEWwCHj
 8coMUuPOkGCu0wciQ8Pd0+Immtm+pN0u1bWIKXTSfDVaTncHx+HGsSvAazaEiFtWWh2A 3w== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=RR5qCNyhEDAT0V0CI83/sj9ryd6TYq7WmAmI2GkvDtY=;
 b=cRbcoKE6ZXRhWshhK2yuDf5j3KeJkoVNB+yD2u3T7Y3Dzm+FS2PUNDfnsUQKOS6pW3G1
 cTgc+km3TBwRzT6dDlIO0TFyjW+nqm8fS+Y6VsDq0TVLXNGvygyaSFBuHil/jn5TakmF
 VC5QwYodWcYIACi+A8YzG99hkal35kB45abaslQ6zzac/aREI0jz6WXm5pdptpJHVtXF
 ywwWjpIkCpJqkmipZWBp7LDvp/xwpDIqUs6u4QOJQhFJoO3cx2e0v1o7W+6EySOPYc7L
 zGGobvhVZEzibMNemzsQuHkh0SlDLhBxBL5FWpZjZWPOd3HrO/19cBJhoj39qdt8qb0r Dw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3aav18mdht-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Aug 2021 15:14:55 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 17AF6OVW186412;
        Tue, 10 Aug 2021 15:14:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
        by aserp3020.oracle.com with ESMTP id 3a9vv4vp63-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 10 Aug 2021 15:14:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjVrQi8iLvYklpM2r7ejxSfbZ+CwOkA7y5KUd7voPR72XN1MMqUb2JchGFcipcj4nuDoeMAzIQ6tbSRCDAs5HA3APebCjJhH01Jtp0bVMIDOogWs85gEz68h3mg449xzupzmmt4sEvWdAGwhmZ0eUO2I1z+M+GE3bx8DsdUwNUtytcQWN0kmvOMqJUydebxgwJm+/UWDjH96SAXTRKyqrFeqvM+/OE9fGxaov1SdsM7pfyJK9gOGRMd5nKoBaTav56ymvcKzmaviXJb7bYRGg9Nsd4dtvSWh29rhLx3rEntim9a29DfZqhwVUmHdxMBjoJhb/zpBtJEQkJ6agz7tjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR5qCNyhEDAT0V0CI83/sj9ryd6TYq7WmAmI2GkvDtY=;
 b=nGgwQUOKHGb+CPiSMfZ73YUGfZIGGVsAeaCrgboeZOJnMEiWSA9F7BTsTd0lZ/a+4B8UbFXf2labRa52yEcB8IKdlnQ+RNJ20wV8flCrIFlVnM/7yExkV+FeTRKL9tEYMpOm1VLaSKcC/j7y22KFPz/b0M45eCam8YhBcD0+SzBbZTPD1q98RHJXASuogXkrPrpzGCswrBKgG71C4/spsvSmwhzBJbkIfNmXQppBZSHNWu7/iL4R45l0bcqdH07FOqwredlz9R6XmRfWVXXMkQwGqrfGT5KL5d5nF2a1We+c7bD4knrnGrVVoySr7vWrJEmm/QRqCF81VShEuuFs+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RR5qCNyhEDAT0V0CI83/sj9ryd6TYq7WmAmI2GkvDtY=;
 b=WJ2ZalHqehJZfVJrfuZd7mp1mLMx4sO2qAASAAoQOomxcGLJcim99Q+f3yBGPRqs8EXm3ZHCqwtpFsK2HzSnWD14HGwziHTA3EES37GSg0/ZngXm//lAm8Rn0AX6wEtt2vl/msELepIL59BQxYABWELHZEQtcbTZg7eT/1gBdsI=
Authentication-Results: ispras.ru; dkim=none (message not signed)
 header.d=none;ispras.ru; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1358.namprd10.prod.outlook.com
 (2603:10b6:300:23::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Tue, 10 Aug
 2021 15:14:52 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4394.023; Tue, 10 Aug 2021
 15:14:52 +0000
Date:   Tue, 10 Aug 2021 18:14:27 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Evgeny Novikov <novikov@ispras.ru>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Colin Ian King <colin.king@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
Subject: Re: [PATCH] media: atomisp: Fix error handling in probe
Message-ID: <20210810151427.GY1931@kadam>
References: <20210810115303.9089-1-novikov@ispras.ru>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810115303.9089-1-novikov@ispras.ru>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0035.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JN2P275CA0035.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend Transport; Tue, 10 Aug 2021 15:14:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56279926-6678-4277-9d34-08d95c119a28
X-MS-TrafficTypeDiagnostic: MWHPR10MB1358:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB13581890761A12058C94D42E8EF79@MWHPR10MB1358.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SHFqG4zCxppY2A/Aw8XHs2URfD3dWAq+c5we6vWQes3mVt5ybm6S+yljuwsEHOa6SsfT+bPdlE0yFXPHr3p1IRLhFePc+sSyt/YZVNXR6uCxUbNy08Dk2PW46lowIOPTMFglO8JeWJP4xwu/rs1j2gxmkML1Ou8Lm8f8cj8hDc+eKUVMytUUhaZAtlAONAzaYpHCSIqxDmMp67zLk4jnfZ0gPeNMzF0GQXAA8soG5viNj7wpYOvAjr0CVBX6Ab4e3IkhLYuYejKwLVJISeT4lRJwp1YRxtli+Bmyslyq4EYZ6UXGPl9SKC8ayjwjzzmvTii9o0a4uGpCNcjv7K//4FeNbCczYW61NOr68TXJuacuZdNvXC+19R8h/G4AEyAGObB50qAduxNoFa/FqvCwvzo5A8daDIbvTmcX83nW0QPRKHG3847c6sVsEgfT+C/ijYjItnTZ5kmTaNFSR7cw6xd280kW05bH8iQdqC79cyLLOSE45HIIAb2rEmVK7BklAMRXBLRBRZs4+zZGcd0TWyATWaThYcboSSmIOdnYYy3149GKNYDSJi3totArXz5e6UeoacpJb3pkfHnB1X2ootAdJIBVdnToun8H+YdhsH+fuy2GQKnOyS+APPi6iVIDujTDiWDRBc75jR6dBaGtin8iJBvrMbVCdDWJMu/wWMIjYSOAsuFWui6roTiP1jA4OyojJVY4/iP6sVbIEaF3wQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(39860400002)(366004)(376002)(136003)(346002)(9576002)(54906003)(52116002)(6496006)(186003)(9686003)(33716001)(38350700002)(38100700002)(66556008)(55016002)(66476007)(86362001)(478600001)(83380400001)(66946007)(4326008)(7416002)(6916009)(5660300002)(316002)(2906002)(44832011)(956004)(1076003)(6666004)(26005)(33656002)(8936002)(8676002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?seUawm7Z9IxDy8HhEnwyngixb3zK2dytM5/MK7p6G1YCVjrxOJPSpBJ3eVtU?=
 =?us-ascii?Q?42To4Xxcw+qCCUSADYIvHCNFyr4YENzeLw1RSh5HudrpOqIofJmlGc+zZ+dY?=
 =?us-ascii?Q?GNQ+QkaJsr2PXIJPonEWz1+49xJsXOtZkapC8I1iBnrGVT3cvq42QoOR2Lnd?=
 =?us-ascii?Q?Op4fU/0ZcWKBc4+zsy/H6yl5mavJJ6EVG8WgN19GRGjbtWROf6QiPWg/cMjU?=
 =?us-ascii?Q?pWqpiQXIXtgeSDh9bdwsialFjU/V7uYsPyoJ6pgc5yuBHfQEFmemhi1C85ye?=
 =?us-ascii?Q?WW++qeP0QnDX9DKR/IZOU0HPRgZOuQ+SGtGNod8wVpDS/TyhW0MNZdSBriv9?=
 =?us-ascii?Q?8Jy5eJWJPRSqhPH6Ci3azDHmGDl+axEzwp++MIycy1Mhb5I3Pd9tmCs6MhjU?=
 =?us-ascii?Q?xDWHexlm5F6dwDGIog90lTUqA2IlPU7SJ3ak2SwLjPIeXywG+NON+I5rHZHQ?=
 =?us-ascii?Q?bfj/rKuSTH3uV9xxvnXoacJHlwDEKm/aBQsE9dUdZCYguwgm27sPXP2iTyf/?=
 =?us-ascii?Q?YdljVdi5eTZutaQIqXeBnqWzM24QBzmCyJC9R0JBHkw/vewSBiYCsu6VNj6P?=
 =?us-ascii?Q?SwyrSfVCxMWuz5l1LvCGqDhk3IWrSz96u+KzUq0rWEqwEfT6y5sJnLs7uYQW?=
 =?us-ascii?Q?K3x7LjxUtu2AGnFd9DmWJcXtWKM4jsA+RaWoOjYER/gFnsRyxDKObi6G2LZD?=
 =?us-ascii?Q?YdzqBShyhS8bCejn3EQKTS2/gaELSYCQ7RrdC9q5Sp3DOTcnFWaG0yyFpZxk?=
 =?us-ascii?Q?c4yYI08nrAyoul+TbtMmZ5mzcuuS8ibpY5AmDdV/LVaJjt6+rY5GOVoxOpPR?=
 =?us-ascii?Q?vQ3VeMsvX9HBUf4JC2b7XQ9PvFzg8y/B3ItAAfKtDpZoKAowdscwR/kXSrfJ?=
 =?us-ascii?Q?FIh+T4BT6sxgM5AaYgSzAb8whghCTQcGWIpXWlN85SgpfiXLdi9DOpBA0Stk?=
 =?us-ascii?Q?Mt11ATrxj/D/tRHIh6jMmvY8AT/7aCSu+gyUjzB8B9Vl9efswAs9qpbmSGdx?=
 =?us-ascii?Q?WzeXWIp85u586dT2f/bGuRPdDhjQsDZDA/O7K4n/kNP+HvuUZi9Y6MA90L1f?=
 =?us-ascii?Q?AZT0Ms3AiGbLuPvpY8W99jMB+wT9ksn3T984LjtA2SFHIaCvnFYqeILSXvR4?=
 =?us-ascii?Q?uocLNlxOCOxa9vu27RHjRmjTJkepqB30JPunpu7Ml+KCYbXoCM22QPhAXBx9?=
 =?us-ascii?Q?BuqnQrH+jKQg3Sx/Z/huO7gjEfl+4cybsbZ4DgeT4Xo7erAnzOOWVtCqRCYW?=
 =?us-ascii?Q?TOdcyoeSCil3uykOwqdpd/mEVI2aO8PvkpVX1FG/eVtSQ+CMR6NF3TRUwstN?=
 =?us-ascii?Q?ET2VvXwflWMnDfpQ5ki6tUVK?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56279926-6678-4277-9d34-08d95c119a28
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2021 15:14:52.7404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q+I8mdnUO6E/Z3bpqJZri93xzTofxVrIVjPPkgV1B7Tj/ivP36958gUg4U3N9RBvdZJ+QcpwZd7I+PwirhUTaTUuMcNqsO+GHDrpGc4rQgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1358
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10072 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=705 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108100097
X-Proofpoint-ORIG-GUID: 7kcEP6PKFehOJ33gVXjjno_5dpuuNoVd
X-Proofpoint-GUID: 7kcEP6PKFehOJ33gVXjjno_5dpuuNoVd
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Aug 10, 2021 at 02:53:03PM +0300, Evgeny Novikov wrote:
> There were several issues with handling errors in lm3554_probe():
> - Probe did not set the error code when v4l2_ctrl_handler_init() failed.
> - It intermixed gotos for handling errors of v4l2_ctrl_handler_init()
>   and media_entity_pads_init().
> - Probe did not free resources in case of failures of
>   atomisp_register_i2c_module().
> 
> The patch fixes all these issues.
> 
> Found by Linux Driver Verification project (linuxtesting.org).

This patch is good, but two things:

1) Please can you rename all the labels to say what the goto does?

err_uninit:
	lm3554_gpio_uninit(client);
cleanup_media:
 	media_entity_cleanup(&flash->sd.entity);
free_handler:
 	v4l2_ctrl_handler_free(&flash->ctrl_handler);
unregister_subdev:
 	v4l2_device_unregister_subdev(&flash->sd);

2) There is a missing error code still:

drivers/staging/media/atomisp/i2c/atomisp-lm3554.c
   858          if (ret) {
   859                  dev_err(&client->dev, "error initialize a ctrl_handler.\n");
   860                  goto fail3;
   861          }
   862  
   863          for (i = 0; i < ARRAY_SIZE(lm3554_controls); i++)
   864                  v4l2_ctrl_new_custom(&flash->ctrl_handler, &lm3554_controls[i],
   865                                       NULL);
   866  
   867          if (flash->ctrl_handler.error) {
   868                  dev_err(&client->dev, "ctrl_handler error.\n");
   869                  goto fail3;
                        ^^^^^^^^^^
	err = flash->ctrl_handler.error;

   870          }
   871  
   872          flash->sd.ctrl_handler = &flash->ctrl_handler;
   873          err = media_entity_pads_init(&flash->sd.entity, 0, NULL);
   874          if (err) {
   875                  dev_err(&client->dev, "error initialize a media entity.\n");
   876                  goto fail2;
   877          }

regards,
dan carpenter

