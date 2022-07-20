Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1FFD57B3AD
	for <lists+linux-media@lfdr.de>; Wed, 20 Jul 2022 11:21:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbiGTJVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jul 2022 05:21:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbiGTJVP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jul 2022 05:21:15 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E418E40BC5;
        Wed, 20 Jul 2022 02:21:14 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26K6f8Rd031777;
        Wed, 20 Jul 2022 09:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=HFXfilSzWmZ1wr6s+IIuH1/M8mukocaFVQBG0LbZGls=;
 b=C5iKUgQv0h1rw8EAFGDZm+hNf4/Op57C4vGtLHEB+Ewd+MU/EwX/xVPCShx6phcemK8R
 taVe1ydPmhawcLtRhWKOPNVUCX4jh4QvJ2J/IoulXw1vo7TGpCJs7BgGVmCklhxmrmIf
 yKr8bUJhOoYFEGevsIIwdFrCWT3F4gtZN4vGbMBNbEHi/ajHcZZB9dAvOXTxnu3hYzPz
 HW5e1tuT2MTHeyGKafWe3HPgvUEG3E7+R6jsxFzfI3DcCxppVKgAujEQHFsm3myT0mNV
 xO2l/4OjV5u6UoVBDc3vqtSm6huRcxnt1cQP3vRHDiU383eBFSJojGvwdSA4v8YocK2u bg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbnvtgxwg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jul 2022 09:21:07 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26K87YaZ016395;
        Wed, 20 Jul 2022 09:21:07 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1enaetn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 20 Jul 2022 09:21:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U50TD2BZZHazfsQ3Qe+UrTWWcf7SjThg+qbRTqOZX70kbQJobU8WkgnSvPYxvx7lmF5X9LThvHbRCitjLuCmzgdawkHp6MJDy0J/V6e5TtPaU+pfBItAWvh2jZWk/c5TS0vbP3Al77yKp1Gfars+Y+sh9eheE6rSxA5UnPixkXPFj/ZkYbWpqi6rja72gflzqBwdYoBmK3t4WjAmkD6FCy3MCGOrcgg4pZDOopoitj3T6kh0pRtVPQK43+XjZDoSEENBrn6yNCk3Io5eH/xNRmd4r1/o0PDbWnnh23PNfjmU4HJ5ZV19FiAmjSKUfauisP9hZ2HpOK0mlNEsRCS6pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFXfilSzWmZ1wr6s+IIuH1/M8mukocaFVQBG0LbZGls=;
 b=g/i0k6dKaQ8gbUf0+yFs6lCX5Z+RMHEAj8c3EQdohPoHiaDiJWZeyfjBb9xhNiHwEJMJnx8w1Rfn7X9m5A/I6Fyiu4mro74p9QXnZ17Ls5Bc8Za9lwu+opZHvSPNfqr08YBNo8WS6p/bYVHmAjxmp3QRNntQA4r2fxbqnQwLpBixUw1/N/Tu8gL4wat7dY8F4bSKzhd1HUpZtHWUTMIIFg70Z8wrZ213IjUwQX9UB3c4mF2S0+nNzHfURnIldwGpRvW+ypP9kl41VH4dSTb7SgXZnHFlMAgHr5vpUH1tkWSU/een5SO5HXSEheo7FtaTA73aOBvZbPdWdXmy+yfGZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFXfilSzWmZ1wr6s+IIuH1/M8mukocaFVQBG0LbZGls=;
 b=RKP+3kpSqNtRwWdMy9rzV05GTXY6fFmt9Tz/e50UAJ1Gk9uiqFmiW4FBSF54fAJgGjuFxrfrzj5pfdzvqvL8dz6l1HGHQ3hjp1Lkz/y9BZuas7Xs+Ao+SoUnIneZk11d4J9AWW3hlWBthY/71NTNc9j7cuS/H9LnGZbGk7e81mg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DS7PR10MB5152.namprd10.prod.outlook.com
 (2603:10b6:5:3a9::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Wed, 20 Jul
 2022 09:21:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::24dc:9f9a:c139:5c97%4]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 09:21:05 +0000
Date:   Wed, 20 Jul 2022 12:20:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Ricardo Ribalda <ribalda@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: fix a crash in uvc_ctrl_init_ctrl()
Message-ID: <20220720092048.GI2338@kadam>
References: <Yta1eXgbVFGrVuTJ@kili>
 <YtcxkInnG3DUGbOr@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtcxkInnG3DUGbOr@pendragon.ideasonboard.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0029.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ca69bca-3963-4547-2a00-08da6a312c04
X-MS-TrafficTypeDiagnostic: DS7PR10MB5152:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SsWmukpovqI1LglsEQ1TSWPxHvEq4N+jvuA1he0ocO8agtobzc0lWYiNVKQgx2Q4A6nio03tCrLLV1RMUa2HIL2EDMtn6zkAA/Fd7x05NrnvunT7Ouyin8Mt24pO5cHJ1CfoniiMo5yJKSvN1Uf+4oUz+YEbQb4zrSVzVVg2Oe+TZyQD8R0nk3ZhfBcZNhVRUC87GcjLTF4Rp1ClmX/vQIYpZpNVH2pwNkI0D/VKMJxag621oZopqjReL4OiSq8PLVvH5Ma2wKQM7P6wVLpUCh9sbTrpXN09+Q5gohjNgEmjRR+XXbLkxw3MzPbxJUJ9ghaROGswk+7fYLoF5a2AGws/+brJwAq9bCUZbMtiUq586EZl+ZrXSfy2Fsm0AKAHkmy+fL5IBWp+f7cxV9aldsSOTo+3tO0EmAIz6vcpAw5ZSLA1cXS2lC3FyvTuxDE0/yZ0oeUoTWxKDcnrpSoceG+ijzM8ZLZf/G1fj7t9eBRfzwsfrSoCyr5kduZQIdf8sL4T6YUy6kJfX/Jz7bqM4Py45m2Ff0m/8Q432sT1dZn9Mt2tVM9CutXjcK9cHVGWBlmnl/QKHl9K/+YGtqcllbhUCsQH3vy5/rsCIZAbtM+fG4kEonw04eK5eE7bkA6jNRS7k3TcANroaFD9LSV+SbnuB+QuiIAMgr0+srl4qWtru3MgSdN+upCJHacgLlyG37MvLzscR8iErDHxKlA9r10+YLgO/HeJDc7PGo2AQuKvK/dvi5maxPJ7EyAm5CKTe0VS6wu6zC1W9Tr2RI6R0pdXEJW9AAsWWfjxy9fApGBQ26w4sadj+nZc+vadW0pt3LXg0M8RMES/EXEbHIe0aThiWkOtxJUiiTsMnQ8xIJFkycIr7/uOhqRHug2GENoJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(39860400002)(366004)(396003)(376002)(346002)(33656002)(33716001)(5660300002)(8936002)(44832011)(66556008)(4326008)(54906003)(2906002)(8676002)(86362001)(316002)(6916009)(66476007)(966005)(41300700001)(9686003)(6506007)(478600001)(6486002)(26005)(6512007)(6666004)(66946007)(52116002)(1076003)(186003)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HEiOLT8ynPDcpySeT63hoOO9vhb2UE39l80+j5ePXc4ixwLMSc31aYIouOTF?=
 =?us-ascii?Q?e3pdZaoqW/pWXZtgNPe+yA+FpttNHS8pJode1B4dj/4Ok08S7WJBAc7EXqur?=
 =?us-ascii?Q?5+EnQj0SIfk9pupM0Wx1w2dGrvcaLKOx0YTZ6yly0EuXve6z0lgPrVUHMI5m?=
 =?us-ascii?Q?cRfaqkvA4fsXNEmphyT0Mf39HjWH8M7BhygbpRu2ats1ODrbqCK8eLBYOxLH?=
 =?us-ascii?Q?AxjtFJJolI//vYffbRfQJGyqFm2MYKwKdOqBgt/QJlgWwWuKwYx8ybKU5RF7?=
 =?us-ascii?Q?c3yFxcnre7fuFtwTtCNKNvvKNDDLdsBpHH6G2odwckKn4HuD26G4g+8X73nm?=
 =?us-ascii?Q?BF83P5YiYGNmrhzy2yZG+RkJkLUG+8/5GIyNyzflTgj5yvJrDflC1Skdalsw?=
 =?us-ascii?Q?Ny/u62nTjEt6Pmni3EqR59Ui7fGXVo0RL1+XCCUiBnRD0wt99VgNT12hwILt?=
 =?us-ascii?Q?wzKrcV3Ykf6mn9E3Wq8MKw1wIqiZpg/87ef9KpCHaS5Hqf83cx+yCdFnFnyY?=
 =?us-ascii?Q?iL/vNzAZNCGBBTjpDu4mN9MBqv0TYWD1URtH2CCwXyYAk9XVrm7WDvx7tcRs?=
 =?us-ascii?Q?hEV1rdclvRYs+L/b5qhDb6caJLK3gI0T5UJRfrQcyMKU90mMT+/ztd4vf7z5?=
 =?us-ascii?Q?ov5UkAQagWuSY2/DG894gu4rwx5ocKVj3AP87M95gxT8U+e/L6/HT303zu7V?=
 =?us-ascii?Q?SeBqVWgC5/ChOzbszWtPMrp3Z38ehQw0CBy2RESuY8GcNz1/sJNEOeOuTIFH?=
 =?us-ascii?Q?2dPHJ3oBaZ/ljRVT8QXKJb3hDjSMGk0JcqF3D/X620n2pKyWiKsbWRCmK396?=
 =?us-ascii?Q?EGVBm6F0rNV1b9Pe+3B9x4clWoSXZ4XWeC1hmQpW6cTw15A6l8KhBfD4lVNf?=
 =?us-ascii?Q?RjtLTzl4icOgxqYJaWuMVEA9tqPKl3wES3NKw3KGNrimTuWPohoX8OaeQtnc?=
 =?us-ascii?Q?04ie+I8rpIW1OSwnmNgSsMF77OxOQYZ5DwD3MeSTncWmhGsiqm8RI41Z/bzM?=
 =?us-ascii?Q?paxSPFme5sM/s4Fywzhi35Pp+SG7LZGJk5odriADBOoHlXYLEyK78OVx3Ksi?=
 =?us-ascii?Q?dQDpUbPEOUmz3XByQOLrVTx11IC6m458s0m5pl8iTRQNyOQZYjKPm0K9YfLX?=
 =?us-ascii?Q?s5+t2+VRr5wc3U2dlKjTEaHIWyt51eFhthxlvZDOida3u4Wi14n8bqc2jD2L?=
 =?us-ascii?Q?xQJ9gqlm63wzLtcOnXFYazkkRoeo3J1UtISVVPmRnWR9+IQBVN79TemlF9KX?=
 =?us-ascii?Q?Pv7JrDv8yjrbdgPFs428orNpdXZRytXb6VAwlpuhPj/HwZLKIS3iOg7nuGob?=
 =?us-ascii?Q?ovLV0sjpiPvgnojCXd4HvK3CULIKtPmcrHBENtLvDJXxpC1DQFJ1BhsxNBJE?=
 =?us-ascii?Q?hU6YPlZX6j/Yu1GcGC9s1hT+geh+4sJuy3bCpdtUID4ozduVIXYzjjmzM3ES?=
 =?us-ascii?Q?6fATZJK+ggiPfsS9cvEjc2dE8zpA+p5N+qEVI+nE4UGePYFWo3FFuVBTjvFH?=
 =?us-ascii?Q?IpIfGre+pjXwykJbgk4NTCE6z2xa6T3s303VWxFib5MD8Gba+hge+gdkRmX4?=
 =?us-ascii?Q?OmOamNyYqaKRX7wZTTjF0mlFhpE2rn1xwCSBO1K438FBgCxRW/NSIKjeRmXa?=
 =?us-ascii?Q?aQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca69bca-3963-4547-2a00-08da6a312c04
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 09:21:05.2321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d9Ye0O3i4ruRe0DZG3Fp4WcLECStL9x9bXIoHzNNA0wTxzwVeCjTj9fZ2+yrt3IVA75ZonOgYyvm0Zu1c2nloCiYWulsSTzst3H8LH6vc54=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5152
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_05,2022-07-19_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207200038
X-Proofpoint-GUID: RbQdR36uWlXNhqMLv--WfezsRWZK3onu
X-Proofpoint-ORIG-GUID: RbQdR36uWlXNhqMLv--WfezsRWZK3onu
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jul 20, 2022 at 01:34:56AM +0300, Laurent Pinchart wrote:
> Hi Dan,
> 
> Thank you for the patch.
> 
> On Tue, Jul 19, 2022 at 04:45:29PM +0300, Dan Carpenter wrote:
> > There is a path where "mapping" is NULL when we try to process the
> > common mappings so it will crash.
> > 
> > Fixes: 86f7ef773156 ("media: uvcvideo: Add support for per-device control mapping overrides")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> I've submitted [1] to fix this issue, and [2] to replace all the
> error-prone loops in this function.
> 
> [1] https://lore.kernel.org/linux-media/20220718121219.16079-1-laurent.pinchart@ideasonboard.com/
> [2] https://lore.kernel.org/linux-media/20220718222757.8203-1-laurent.pinchart@ideasonboard.com/T/#u
> 

Ah, perfect.  Thank you!

regards,
dan carpenter

> > ---
> > This bug was previously reported by the kbuild bot and fixed in later
> > versions of the patchset.  The git log doesn't have a link to
> > lore.kernel.org but I suspect an earlier version got merged?

