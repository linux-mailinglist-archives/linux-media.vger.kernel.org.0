Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBBD552A29A
	for <lists+linux-media@lfdr.de>; Tue, 17 May 2022 15:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245339AbiEQNFN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 May 2022 09:05:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347347AbiEQNE6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 May 2022 09:04:58 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5014DF70
        for <linux-media@vger.kernel.org>; Tue, 17 May 2022 06:03:42 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24HAqf0j003221;
        Tue, 17 May 2022 13:03:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=br3TcYK3LxTse7pKGCh/0BuJUCuX9Z/vLB1lloch9y8=;
 b=xeF0vkAzDimJKA+t9ZIuTR6oBFXL9FQjQaOBOiIVRv2ElrREEn6XOO17/4Uum+byx336
 8GCVoIa3dhwaVpPOdy8dwMfkHfji+33E5Bs6uMlqp/aLuxzZzDBNveRktAmACNWZ8l3y
 w/g0VGbl44aNq8xcrRUun9UW98lnX9aAvFyoAXKP3OVcamFlOqnIRrFaHmGeQUdXLnE+
 IB0jUPyT49OxvFR5Yy5a3VsK0KCRC9UH7YfUwAa8TedyEOemks4mHtzg541CqQYaHWaR
 dn5bPZOTKDzcDAonwjJU5ufkFdA6zB+UzemLemHjrfZM7F4uNrfVqyJQ4QhoyFre+95l 2A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3g24aae3wa-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 May 2022 13:03:36 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 24HCtUeI009428;
        Tue, 17 May 2022 13:03:34 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3g22v2tp9r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 May 2022 13:03:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QqoG78Rjo2U4RcW6PND//b6I6XRNnMLPWzWMKD5uEybU8GKvsuDsSyc4LYfJX+I3DGh0yCxLTAeAWzaxSFT4Q0v3AG53C3jaeEf3hLpHRm/7ypAI/EFNH69yCAMIQjJHa4Dwb4XolOmI3fbSerb8h7k+f7e0oQbeRLYACVAji8c8+8B5yG1h7uvHwuXXSRbHHt4w6xB5wsMyWJinrK4CXs5lxIECvO5gj2NvwAd0SJt2sy0fqiootTRxmP1zS9X+sZJrdid3r5vYcPEBmfaWrJugRffel9pgMWYDmO996fM/q30XFwsbmM/te9xkmxkGaJe8yim7nEqpmNe9Tv5UAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br3TcYK3LxTse7pKGCh/0BuJUCuX9Z/vLB1lloch9y8=;
 b=U4QZf5z0nX7ibsin1qtpHbsqnhuLfkOJ/R0UeK+jQkixKwadTEjVAIAwhx7Xe6kAY7sD04cBfe5a4y6hXSVa21Qm+O8HoY7Kq6agNxIL6lQvy0t0bIhLoUdKSZB+gLk7JcV2VL85JuMu824gRIWKihkitWdO071Nd0Sg7Fayxl7Aln1z7HDWanZI3ZTMlR7JCv7Z3w6wAG+l5n3ojbcd2mezxjhjthCu4fxUU1PBCHyE/Hqi6HhTFLfJ6MJ6tpr7eg4KPghpVCZp88OMxHWmJx4+dXzud5D5jTAX/n0hl7LBYEez3BPT9NE4SC7AkSYxia+5HbrZ8JWJCe3W8c97Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br3TcYK3LxTse7pKGCh/0BuJUCuX9Z/vLB1lloch9y8=;
 b=QwFaDdPnTw+Jwq9iwFWTEMliDaJnfgYEoiq9ZFMIdobnROaPX44cPhizkL2zbrgC/vK/kXsmTEaa5KfdOskMHGp0SYZW2uSz18yHZVPRB+DlqLCNT2SmJ+t87tj8VDpKCitGitKJhCxnZ64ezgxanhsUTOWLmnWQNdp/mCU+Gyk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB3500.namprd10.prod.outlook.com
 (2603:10b6:5:153::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Tue, 17 May
 2022 13:03:33 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c053:117c:bd99:89ba%5]) with mapi id 15.20.5250.018; Tue, 17 May 2022
 13:03:33 +0000
Date:   Tue, 17 May 2022 16:03:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org
Subject: Re: [PATCH] au0828: allow higher speeds
Message-ID: <20220517130315.GK29930@kadam>
References: <20220517125447.19535-1-oneukum@suse.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517125447.19535-1-oneukum@suse.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0019.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:19::31)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2699389-2466-40ae-57ac-08da3805a57d
X-MS-TrafficTypeDiagnostic: DM6PR10MB3500:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB35009907198A04593DF4CB668ECE9@DM6PR10MB3500.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RtAir/Cu5zQCL/+lBkLG6ebi5mKq1UhArjr28gJaTTimaoGpb1KZGmeJD9ReBv4Qyt+uxB5VSMSF2c3KqwI+M4mpruqutoi8mWWR8QGZxVeXUuNpUS9esfOScKUpwl9huu8YDM+40xxGoOfUVRHq/hwR6g8o+1l0VnEN5ch2c17aNerFARabZcQTrqDoN3h5yDfqYXo4sQM7IKR7GQCblvjM1Y74cRJ2ynWctCgn9eJ0tuY/SNKus9aQlOUZG7OrXjjDUkbqzq4+gvEGtSj8fAcQZ2A9SUBNNWuTohD8KwrpfEpiybNsft1TBKin1UHIYzz4YaLWQ9TmyaHAkf2YTNF2nkURr2ZeKdHdn2ceR8wiEnVP9rHBf6EdlC8EU3bsc/gE49wVdumoYb3peKG/we99m1ConfZtg0TCdGWsLWu6cpEwIK7Yx967qaC4MlUN41knZlhA/l1Vq8GlOPVW6nqolWbAhT3jbENntntnbLWoB0snQy2e0sLWFpG/FY1fJnY00xcv3komTqxsPnsyZUR3O9lBSYsrV8Vx6U6eZUGSzCi5LU6UndkELje8150kvQ7Bvj2jhu0c3GfdQKtj8CLYnilvU9VBFj2NnrCNIdIsmQbuxWTNfTXwZb4CFQiGErwzac9nXW5lpADkKv2lLqnAXVzOiNRvDANwv7RU2Q9Vfe1SvB+NnFbTnXUEz1oo9LG0KVuq+vt7zyMa0aZv7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(8676002)(4326008)(66556008)(66946007)(66476007)(186003)(6486002)(52116002)(6666004)(6506007)(26005)(9686003)(6512007)(508600001)(1076003)(316002)(2906002)(33716001)(86362001)(33656002)(4744005)(44832011)(5660300002)(38100700002)(8936002)(38350700002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DEEDhC7J1dA6eu2EXqpmQdke1SVHvsMd68MboXUo2shNb5LUUv+cetetilTo?=
 =?us-ascii?Q?VVf3P7PNIYEaxX7Z0oYTtnaLlTNawO2SOQa+nIRkr4zBBOD3O8TzvzX0nEUd?=
 =?us-ascii?Q?YeFnpU2FpzgP0SKT81WiWYUmASWBGVIOLFvxE3oAIT84RDtQBfaQPKewV4P0?=
 =?us-ascii?Q?XXbCmp+JCadHt6Pdnhq2wae8EAtPHGTwNxD3xuxAAGVNEadmJu9vf6dONqd/?=
 =?us-ascii?Q?qxfBtpdi9kLgvgnlJGdDNTBfcl0ZjI2jAOvOGNOmuyiHTjgSMTqzOeLx7TcW?=
 =?us-ascii?Q?0PNNc9kSHO0ulpehC2KSkvoJ/i55UfbB5xD4DJUyVDc5KhKfkS/60+jSNwdu?=
 =?us-ascii?Q?d+tEY1TemE9oVY3XFwSIDBbJLsfo4sL4eESImQPkGA8DDgjMH9LQ7m6EXIs+?=
 =?us-ascii?Q?mTJgy2vSwayrmVnt/6zXh54fHA4Y4QX3qfx9BoaaHOjnYPMQyLs2vlrKH4Se?=
 =?us-ascii?Q?9GS+manxMdGp3aY9FFkbW9QQLcx+s5981aQDuBu3U9K0eA5IUcHeAoihg+rL?=
 =?us-ascii?Q?sB98COcNYHIcMmWPyTZCFzVYlyiB0guu3eEsGFIjQ5c2mWi/1J3ldKQwiTeQ?=
 =?us-ascii?Q?BairFyOaSqfN9iVx48/bs2aSDO/Nz6NMK1gFHf1c6YCrOY9MQeHcHrIOvOi9?=
 =?us-ascii?Q?CDwCdlLcI3DkjcieCAAokjxZLB53i/XnwFe9vt8UAHO1/hUiKTCXph+4j+n2?=
 =?us-ascii?Q?b83dnJrN3YrmwER3jW3R7VyCpQH8X3Yg0LwgKyMOw7HZjZxLrZsxMQLzaEhl?=
 =?us-ascii?Q?7PXLJ0jw37gYjcmxntC/wSeyM9Qa9127xxiwjYa8cFU6Glhbc6C2y6JNhH6H?=
 =?us-ascii?Q?NOjSbJPHo/0XJ8oKPBwNuWS4yGoKb1D0ec58uI2q7x4y9a6rEMVfa5eaTJtz?=
 =?us-ascii?Q?FalvaT7z8yCU6w+C1XlN+0l37nxDEaxydxrLnZWBd6O2M73VfV1Z3ERImd6m?=
 =?us-ascii?Q?uzgYKUJdPy6E+a7uG4GsHU1zD+QRCZ5PY770YfMnVqwCnK7Dued5FPryBI9t?=
 =?us-ascii?Q?nHgVRVj2PASjl5V8V5ekzJT+YrunZefs1zQoarOkO1BSzobHZQi9/jlG65dL?=
 =?us-ascii?Q?y80f8k6h4PnpOFyCls+2LARuSRfqX7rBCLrECZMMrx+aJdcgmnSax0Pj57kv?=
 =?us-ascii?Q?uYnr7WhshsfE7iFB/PviLuriHCiJXJJYCrDGetmGywFM3c5fF5rHuqeJluYl?=
 =?us-ascii?Q?tWs+lWuJ7t/Ko+xlHAU08SVm8Fz5wX0qP5y/SVPS7Tt+AuBTiy88Wc24y6gB?=
 =?us-ascii?Q?m9Lo45yF7ODs8wJ0rC7eikic1o736TguXQsAfGKgHA8yJmRFN5L+wfbsroOe?=
 =?us-ascii?Q?D+9h9Zf6Nm/pjmwB4CpeN6F2ja0704Zo09yogikcFt5XaD6qqQ9ze+gj13lk?=
 =?us-ascii?Q?0Ibep2t3TvOoZ6wcNdl2S1q/1o6rsEkDKAdvJHhmY2Lxiwgdsl7i0Mls7b38?=
 =?us-ascii?Q?eivntf3z28RyLqaFmThA2J8BOOebTjGqH4DZ0uxtAe3PE0eYdwOSGUD9cJAk?=
 =?us-ascii?Q?ZsW0w8W+q3yBnX7PNV1kiIr9JeIQEgXYtFnu2XRz2khM24W85dELM1fKUNtS?=
 =?us-ascii?Q?yvh49oe1oE9E/3TZ3zDVATDYwbNoPBqbQSrH42kjKvETtuvwRUGcpwnx0DLv?=
 =?us-ascii?Q?o9woovt1XrxmGq8z67KxuuuH9GlFxqugmwpEs6H2F7R+XIfdAIWpwvM0PXqD?=
 =?us-ascii?Q?s9JmhPC42ohgPjg02aeMOxrHeYRKBxuQuQkn3+XUVbXD1bo9IGXJVufH+/TF?=
 =?us-ascii?Q?yr6YOhEh76DEJAiW/xTJ8G7rajsTCSc=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2699389-2466-40ae-57ac-08da3805a57d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2022 13:03:33.1137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ue7hW/WLQGhmDPo4cu56vMhvjq3Yf4qM3eh2YiigfxFDadkWSxsiRHY0xKc3NJL0tMMNYyszGd8nwwMLMB9kmpM4aQBq4Ux6v3Giepdr7yw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB3500
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.874
 definitions=2022-05-17_03:2022-05-17,2022-05-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 phishscore=0 bulkscore=0 adultscore=0 mlxlogscore=678 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205170079
X-Proofpoint-ORIG-GUID: vAvtbswXzL1Vz9olPbPA8FONlDjOuATy
X-Proofpoint-GUID: vAvtbswXzL1Vz9olPbPA8FONlDjOuATy
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, May 17, 2022 at 02:54:47PM +0200, Oliver Neukum wrote:
> This should be taken as a minimum speed.
> 

Did you find this by testing or by reviewing the code?  What does this
bug look like to the user?

Presumably there is a redit page webpage where someone discovered the
bug and instead of reporting it to us they just told everyone to set the
module parameter disable_usb_speed_check=1?

regards,
dan carpenter

