Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 449A9589978
	for <lists+linux-media@lfdr.de>; Thu,  4 Aug 2022 10:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230447AbiHDIrE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Aug 2022 04:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiHDIrC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Aug 2022 04:47:02 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DF0D86
        for <linux-media@vger.kernel.org>; Thu,  4 Aug 2022 01:47:02 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2748O5BS024360;
        Thu, 4 Aug 2022 08:46:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=cbhOxiv/5RD/d3UO7HX3sggcKvt1p76/AdEK9mgAcGM=;
 b=lw1bTjGhXebrseVeRBWrT+Nx4/6HqrHaEsb6ODbRy9PQlXd/wc+4E28kraWRs6MmfIWm
 mZcJ5nAwIk1kkCx4NnpdG/0m+5sfa/yxAc78MFoegpuE8hQKtsI3uwM/5EwkfvNBw/vn
 QiH/YQpL3p3ZFMzb0hZqxwuOTAikaR/g+aiqgoj9GgAIHbRdyxDFgKVCKS3vDgyUycaa
 6wjIKSCz9UCzZV+7Wr5Gd115QZfBZIz8f3Y6g+vi6P3pZtuSi6JdyKgyckpSA5qQZlVk
 127UBYW7XRkGrcTT8r2IsF2NLzKbBr7S+i8BY3Pix8fgd6to//g4wQsYexEAVLCTNhiF /g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hmu2cc0pe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Aug 2022 08:46:45 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 2748NVYo001101;
        Thu, 4 Aug 2022 08:46:43 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hp57sy44r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 04 Aug 2022 08:46:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XiyH8r3XQ4Ppu+YyB2wwYhqtBrvaJnbmTKGw2j0fjjKSTwnFEw/jQTSGnjf6a/+K9GWW6TYLh0XwrTn4YRshFCtpjyQrge1P4e9/khqcN/5sFDGL8aN+VCqSAmwb5fGqUj9SxvLstkZZTpDwkRgQcbFGdU9I9u0UGO1Qux/IWYFyTv6bK2N5pWFcUfcItCVDJ2nv4yE9pbfeYvOFWM3zPaQUcxYpOHIjeMNWRlJI/5ekGWuHd5Yhdh5Gix/iq3cjoFqvJ3CY5GQ7m2TG47t9YU2pJbvK4tTvWutcX8MfuzY9Yn3lg86RseJAsoiRT7NAqlLYks1B/xyYKMTrYynnDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbhOxiv/5RD/d3UO7HX3sggcKvt1p76/AdEK9mgAcGM=;
 b=fZYkwALhdQSzA5aNrOHRsKFQ928ADVFCoqK/AAgi09/DkFtu3xkWBXKOkDIreBSxYeknBy0QUWtBRf7MYLVm5bGLOXSskSlIJahpNNQ83K9IyU/3LLtAMT5K9ZLYEMR+vRp9ncuncFO3Jz8BeMmAc/4/dsiJli5XWnFL68SUCQDZ+3uR0MaH2INw7nCG5g1ZbbZyWD2l/cAVWIp4FibUx1vwJFOHO+qXySlgbPJVs4KBrETpOzVk/HNnmsRYYnfEsT4s+pBgLfI2GqEMLDRfrKjQqim7Zz86dbLdGq3dWzveSqrkhjFWG7tsNbPahMicG7i5zeqj777TF/g3ZDGG3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cbhOxiv/5RD/d3UO7HX3sggcKvt1p76/AdEK9mgAcGM=;
 b=dGVwjAfP2gT0kZytZ9du7S1/H8vwme0/T+Wjaur/zO4XNN1S+L3IJGhbpttIL4OXEF13KAReli+/aGkxvTUqk98UC6amUHzMIuours7fCN/CXckFyF8jw1ZhaXilQyzRNtJDKd4a6QWAankffn6RaOjaih78nZR64oyPGnJtwss=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CH2PR10MB4152.namprd10.prod.outlook.com
 (2603:10b6:610:79::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.12; Thu, 4 Aug
 2022 08:46:41 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::209e:de4d:68ea:c026%3]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 08:46:41 +0000
Date:   Thu, 4 Aug 2022 11:46:22 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Chen Shi <shichen01@baidu.com>
Cc:     slongerbeam@gmail.com, p.zabel@pengutronix.de,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: media: imx: imx7-media-utils: Fix a
 coding style problem
Message-ID: <20220804084622.GF3438@kadam>
References: <20220804071046.31520-1-shichen01@baidu.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220804071046.31520-1-shichen01@baidu.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0007.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::12)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 657d7662-0063-4c31-9216-08da75f5d9b2
X-MS-TrafficTypeDiagnostic: CH2PR10MB4152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v+fM4fDg9KANkhpmtpVKTHCDEwrtkBYDOLJ5/E5TIa12ekNZrGB64NidiknqLrtd04yTnhcKGpztoFyCuZeRG4+FT6NSi8prhs5C58/T45jMpVxqRhPsxcBn8xM/7b6odR6Tj+1arLwGxup44u3qklLxtuqgS321vNjJehe14JaJWq4dYWfQ/UCr4wESPh7SqVshSgbt7vKYkcewyDcMW3J3hJalSuaeoDHb6IofKu3+WuIiJD8P4Kly76+yIkHs1kF+W6GQKoFTC+zrQqqu2ZNVjCdUSDw8AW1UZm+TGXKtD7NsIFZSia3vtsaPLLFub3HNCYSUGoyxReMtonnT+0bfD/3KpMVGralcNIos8gYlhlKatAITS9qm4zzIkrAyyfXE+wkNlYuG31mw6bKeYbddru7rs5/8jKZr9Bvdby2R5fhonzjyjc+vgchSHPqE7yLclI3SPY8/W+ei2TjO3rbpJWFUqbHLtu3vQlJAOYKVTu2K024fGju/cYLlZSmzyUmlPGJrreKmAUzJ6KYYMDGKQ9O6TTpYrRMGCm1PRSfdVjw+Aqiw+UJOI+rts4QvIyFgXrtfCp1IuMHgQURmAaly5aJJtrH7T+djFqegqr9iN50QLl+oseV4mhJ572I+otvNI/sq5nqn+BRiWNACTGO/5aPJ+XqDggzOUBjYD1r4jgzbObT7kfIKpClY8WvR5kL5/tGj13qKdOFS0DzP+aFlL/ibd4k9jfLAHAvmmfjXNqpvxP5K9XNFUbszOUcdsIKcVUZT75ci0wAwU4FC8D06c1r+EO4M3YRU7olShcrLKpxPnjp1Jafzy7CsMdwL
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(346002)(39860400002)(376002)(136003)(396003)(366004)(41300700001)(38100700002)(6666004)(9686003)(44832011)(186003)(83380400001)(38350700002)(2906002)(6512007)(6506007)(6486002)(26005)(478600001)(558084003)(4326008)(66476007)(66556008)(8676002)(6916009)(8936002)(66946007)(52116002)(1076003)(33656002)(33716001)(86362001)(5660300002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zjGxaRWAWQtYn00aT0eGIfsOoC7UnqP3BAcVDxF4DMspLtCydAgx+t7RICQd?=
 =?us-ascii?Q?p+wXQn4++OoWL5QUuADAXFMu7Tvfzt+B9QChpd26UGYiLQz8NvxkeKvawnJ/?=
 =?us-ascii?Q?kJsgWIIj9SPl2vdfaMIPC6oGTEWViyM8wan+yaTIoUADF2wgQBDP34J78DtR?=
 =?us-ascii?Q?em2SIv0cEqv+JunyWjRuudlxEY0G00bYCvVNGUqROWkMRexWQMebd4wUTNnN?=
 =?us-ascii?Q?U3B10+aW82vpAQTbl1Z0ZWUI+L61RV0/iATSb1fh+QsAYcZfYae9SWMxPMDu?=
 =?us-ascii?Q?bzaXbYOHyRpxnAL6DWXo6PePYnusuKqZNY/gquvT2QfgRU1YArYyR6nUaJEw?=
 =?us-ascii?Q?Y4cQLMknTIXak4CTuPAk+bgwzeg06ZFXLffTIwst88l/oNtHOz+WDhRklZod?=
 =?us-ascii?Q?QreyzmsjukYfupjhv4BexXR1XxTsWjZXErzcCpUzCxQpq2X1IqaDituXRh9K?=
 =?us-ascii?Q?xUcdZ80U62H1e6VXp7HY+HgfSVRVBpzmr8kRoZ1F5EO5CTsMya2OjzY4T0M4?=
 =?us-ascii?Q?clFiveN4lFHYiQBJx5gWW+eHKeRGIK2jsbDvhnlkklicoYtuXGa46//KWQKK?=
 =?us-ascii?Q?rLG7L6xoNMQr84CWFh0/GACqHy5e4mfw/+P+QvwCkadcvW/r0ax8sKBUIUK/?=
 =?us-ascii?Q?hgAAGEXzwdXkW8PEi9ICvJCV81cM1p+F/Y+f55G5kUmRW9VxXFGgV5Eo+xij?=
 =?us-ascii?Q?BE0vImwDLiexPGvewHKn7hAhfWlEvI4OrTxkvo6ysLkigi1BxZ+NdPnijd1a?=
 =?us-ascii?Q?d9iBt4UXZkOZr+Ednf98Qj3Uc+15CEquOF5CfDOH2BzxNPjJD9d1H6TYTVwZ?=
 =?us-ascii?Q?tAiwUlbKOFLUfXMmRa52qN1in6IhAgRADEmw6/2jkh0e8JuNhRspV/xGG+0e?=
 =?us-ascii?Q?tOHmHx1DHWX+/Exrh8RhbNPJWrCQd6fWxlVATeRwkK02NwbSKOflLJ9SHuuf?=
 =?us-ascii?Q?w/mwMGLQIb8r2OAxWo/6GIPztsb4QtbZK9Y28EDEIqAkJEpkJ4zBwnU8nQpF?=
 =?us-ascii?Q?PKpYVmzDd61cTQvdd08kuy3jw75m+CniytktawhN5SLeo/VX4ygJ/a59ztWF?=
 =?us-ascii?Q?PJFehQ8F3Cuj35GMzTIbV4XeAK0pw4bSA5wQw/sTwhWGow8FIpheIdUWkCAz?=
 =?us-ascii?Q?oZDyjVyjzjm//X+Fmrfp23/YJyMK5czBE0lDbDEFeB9ne2XMCGAAzmPHgnVq?=
 =?us-ascii?Q?OB8wHF0swsx9ZDiryF7QVa5cw+Z9rHdxMrNe1SBtBuJBLSznkPwBTOJpSnna?=
 =?us-ascii?Q?Ch041xAjGOZJauU3PjsLC1M8PxZldNo3y4korFFp1x/JsAgYRFVUfWYnb5rJ?=
 =?us-ascii?Q?Ja2vS2+v6SRib5yWcmpvKPtXYQrO5EC+ZfAYAeDMQF+nCcgaF9NCvlZZLpiO?=
 =?us-ascii?Q?i3fFDqj1qyuZWxU/irfqlgDml/1n21apY0uLjh9hVDRy0yjZ4DIlQ/tNsLF7?=
 =?us-ascii?Q?D6/iGf55YhKUJb1c+hXDNuPxa3wk0YA0jjZDZWjbIP5846ojBFQ+zNpWXij/?=
 =?us-ascii?Q?b2zDjO7KrfflDFCHaOmyI/K+ywyyt20ulHNhvTNPHWXx9ZNeiIcFf8YJbksL?=
 =?us-ascii?Q?8r7HMMH6JoPpYS52ATQK6U/ChjTXNxfZlNBLGqGztYnGPsK8U0kR1c9uK8LT?=
 =?us-ascii?Q?Mw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 657d7662-0063-4c31-9216-08da75f5d9b2
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 08:46:41.3954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1HSZYcc271OkivHjB0iLxjLUAdMJb4nxUD0VHn/w2KxB8Q2mVj+4el7FTIERuAQYMalnS5+DnYU5xJic/vaVham75MUq552HJdfViMmgILU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4152
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_03,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=999
 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208040037
X-Proofpoint-GUID: k8T-jMlhBd6b6yYfvtrSG8bPultHy6x1
X-Proofpoint-ORIG-GUID: k8T-jMlhBd6b6yYfvtrSG8bPultHy6x1
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 04, 2022 at 03:10:46PM +0800, Chen Shi wrote:
> Add parentheses to enclose macros with complex values.
> 
> Signed-off-by: Chen Shi <shichen01@baidu.com>

Always try to compile the code after you make a change.

regards,
dan carpenter

