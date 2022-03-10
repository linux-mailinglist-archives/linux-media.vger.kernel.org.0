Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 705C54D4C59
	for <lists+linux-media@lfdr.de>; Thu, 10 Mar 2022 16:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245287AbiCJOzY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Mar 2022 09:55:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346407AbiCJOoB (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Mar 2022 09:44:01 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591761405C4;
        Thu, 10 Mar 2022 06:42:52 -0800 (PST)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ADe42G010334;
        Thu, 10 Mar 2022 14:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=HgVWTxPqoAGBWM33n2PJFLwM4mbPNH3UrxbG254fdK8=;
 b=OqsB0oWdWBusfhw34q/ZcfUGoP5hVbSJV1nvgAVOpJkMPITjZp35DfO/pDNVZoUz+xoT
 8XxgMq5L3XEuC1GmZlKBuK1FjP8yD4LDnBcjJ3x8ufEPi5Qxep8j/0p1MgdAWTzBa05k
 S6d6ucO2T+lD5rsIaEa5bXQtizmp7iOG0HqGe1xzMW4ED81K7BH5rSsFHNFMTe8hHBNa
 FCoSAcTunzwT33KdCoeEyIbbD/fMW0t9l79480dAwqWZTo1I2gRpoNROYYq8zGsRyyn7
 ON25pFxrfTTsZkoqtrwPMJ5svcq/HORWcHjBFjRYZcHXzqVi/C06Lhfzih3qorTZqu1n JQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ekxn2nn8d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Mar 2022 14:42:49 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22AEaOQi033948;
        Thu, 10 Mar 2022 14:42:48 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
        by userp3020.oracle.com with ESMTP id 3envvnacmt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Mar 2022 14:42:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nWJ1bKgxTAPyfuew1TDlw3670IoOOHfq5XZKJ3F4VOdPX0yCy3r+8Kwz/zF/AA9XmQ3SduI2divAvoFLVVNlwbmAee0TOZhkewk1X6+ETEpt7HjgksL5bYnbCpfwY07DXo6qzcX337mwz3OTi5TQDBVv1E4u/6M3RyygD6bRb1ivxj3PrqvUFpywt/QXCW0lQTojILI9/bmYYYynNtWx3E87Y54n1aVGwr13GOyhoqqsw//dlmc9S86mqPG2T5l4wxNrl3ewfzXzgDzZ/MkhrHta8DlRvUmOAnslugUWTeDkM0AUq1QX7CU0WFJtCQ0HGClOnCBfE8qcNiCaR+nL2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgVWTxPqoAGBWM33n2PJFLwM4mbPNH3UrxbG254fdK8=;
 b=OWr/Q4TD6C/sEARCLDWOLAbBHt9YmfbJCUp6b47PMDlWlJq/xJzOz4RpaLSZe+gpXTJCC1gfylf3k3tJED5xyh30UAnd8JFvbMU6qn7lGTFrbOpbncuRRbf+ExXwlMdS7n32u6jcDz+PPTq0IchOpMuAHp7F7B4Koqzi8JIvY/7b44RkT6SCZRc3ju7lbD47SKdn1iZbnU9i/iNad1g735SGjGfUv/aJ4RunhYRwLK6O8MjpOADwuPp+6PUQ5I8xurGMl2Cr9fUDnMZI0CRkBVjlsGPnPVM2Dkr83WtvTTbBQvrnH9dFVqUxX2O6cdtwJSh0Nss2uVKwRip/39SStg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgVWTxPqoAGBWM33n2PJFLwM4mbPNH3UrxbG254fdK8=;
 b=XwY7UdDPROfxuiGyJILVy0MzgaPOJCwRstkgccWfyvzwSUuC19ONRK+/ArcsGBFcKgUxiS2Fe19V1CKF6Jrjh6r4VTTYXhh88D1E1jctZvUGCbP2HvaP06eEm3vMqBoB0TnC/QiD6Aj4aoSJqXZEu0l59RIpFuiUzp4WHjH08Uc=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CY4PR10MB1400.namprd10.prod.outlook.com
 (2603:10b6:903:22::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22; Thu, 10 Mar
 2022 14:42:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 14:42:46 +0000
Date:   Thu, 10 Mar 2022 17:42:30 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sean Young <sean@mess.org>
Cc:     linux-media@vger.kernel.org, smatch@vger.kernel.org
Subject: Re: [PATCH] media: lirc: suppress false positive smatch warning
Message-ID: <20220310144230.GI3315@kadam>
References: <20220310132350.78729-1-sean@mess.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310132350.78729-1-sean@mess.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0024.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::15)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 09741f24-ed20-4bf6-ec9c-08da02a43dac
X-MS-TrafficTypeDiagnostic: CY4PR10MB1400:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB1400E3E1FFD9D589534DAC268E0B9@CY4PR10MB1400.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynllXZPKqiSzHuz9u+pmn/ZrlT7NZbTrkNuPXmlP8Bo5sMHoW4jm390J2PMcTCWxxJdp9WBHcxnKUFYPLiR6mYWei1hWLn6yrTfApQ0hDkUQ4ePZw7pDg46dkAfghAs6fa4w3vcErKprZ7OcTDvPKguIvmmLWZrmc+/o+T45Zwe+v5/6wGon5wKMX4hqC+anBTHjsiBPnrgK/BgrXfOlc5KpwGpnZ7m7InaaF54ndkhLTRwflMdQyvMJyBgFxMtfJbpSX918RQIQTFwodXt+pL4s44Xx4bKIQhivxhcO8lMInPeZQG7tS7VFy9vCqbOwWIc7o1vou2wXeSqohT7Y++7oAbsfM6TgREvKLUHs3ZROFa82QzOXyRQyoYPtszt4b5pA29f5djHRS0URoiuzEBr0D6eckHd3mAsudV9dqUjpy2nmOIB6Hp0DNlLZ+9LoOJT1e4FOmEDm/iNwT/APTV08k1TFwspEvFy+kPaXCO15Bu568MvIm8UNOwVo/iK/zzfOowdch+qGux7ExFQ7uf2FMA6eJTGd9UgMzA+Yrj0O2JuvEWx+O2koxlZi6dswBvQWcCqhi31DGptMv26VaNetE1ecIIS5jdzKMXIJXHq49L/J4mbM9n330pMDgcB2SqLzCWjb2MShHGKUvbdLReRW7EVISoZtrVmjT0VSXRfPdiPrMLcHi3BWHPnV4NvNrWcXKqhcC115mrWGGCSLDw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(8676002)(66556008)(66476007)(66946007)(8936002)(4744005)(6916009)(316002)(4326008)(52116002)(86362001)(33716001)(33656002)(1076003)(9686003)(6512007)(6506007)(6666004)(186003)(44832011)(26005)(2906002)(508600001)(6486002)(5660300002)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1/DtQ7gPK0wgWwydgg9drI1Xtsq30xkEORQRcFtSRD3vZLEe9BdYrdFpgE+2?=
 =?us-ascii?Q?tQoKY0UybTgHzc9Osi7UhrtJidxPhgu2vv3vWABgoEfuGPoK7jHBdAtoGWOJ?=
 =?us-ascii?Q?UNdDAvF4RoRb4M/Iy3ZCE3flno4fFyjt+aAk6sbLOZVAd9KWIO3rDuEQy/6M?=
 =?us-ascii?Q?QTFqPqP4j8ZJ+CG5DqLdhbcvGprHGNFwJApBetu5nPoC8NZHbozeDMyUw+FP?=
 =?us-ascii?Q?zSoIsa97nVzHRIsqix6RVA0KDZqQUlWnrCCkacEqDjNJZyFPU7BhdeWmWS2g?=
 =?us-ascii?Q?e/dSYASJzDegNMG/ejzyw56sLMf11LDeFF40Qh1vE9vod1W542TG5JQAVrIa?=
 =?us-ascii?Q?SvYYsdUUAhPyHRl/D1ojNpHNyAHJzfdVEVSkmeE1hJKjQpcD35ZiuCe0dREk?=
 =?us-ascii?Q?FKecOdcluLjN7wwDx7+8+thi4jvdpCA/IxdCAUa7M2nvw32XkVRMyThWKp1h?=
 =?us-ascii?Q?4SOiBP+Qy0vW/q9TsS+5dDA5vmGxmrC/Y1JDRNwWjtK6GF9kcHuR1z5aWc4v?=
 =?us-ascii?Q?Lpvvq5A14N7kuOHr5SVwMzXpv4cmiIC5Gh9gGZIy5JMRiwzo2viz3riqlJfa?=
 =?us-ascii?Q?MReJ0R+fvfjZ8n8Lkz6X+meD73xC/IXhtkl/bDFD6xtoFhSXMR0NPtvsRm0R?=
 =?us-ascii?Q?fdmrdsguGobvatSLwcgeJvd85Oz0+/+UQfelKUyiq4ZOYsdJnF542FKMN4QQ?=
 =?us-ascii?Q?XkAFr4/0t/zAY+fAubIwYzv9xaXM/RoH8kjy8gx9cV5I8Pw7vE4DdKDsSLdI?=
 =?us-ascii?Q?YWu+JN2ThOYPXnJtPLD6EHx/3y3th97CbA1QsP49Xvxb1d8fotY+lV2L1DPG?=
 =?us-ascii?Q?i0fttcrq3wYiVK1wIdzbthyHqOXzJdSWv3z2isvkyB/x1F/1pozHSzdcc08z?=
 =?us-ascii?Q?k9G6VuI+JYMMYUO9KTI87BmCH0s7HlqAwHeUrBv99pKyM+lngLOPjjYPiJ4G?=
 =?us-ascii?Q?Zzwe9rjJUmOeraJU2578dVoYuFt8K6nCg9QviWx00M06knW5z8m7NTsSRayh?=
 =?us-ascii?Q?Ajwn5oa8EaecQXgQVaOOJz9sadSx3hY6TnfV7iN22K8e5CevhxsB77cUbWDL?=
 =?us-ascii?Q?nUuT24K4njFz/p4SiVjIAMKWL+vZUMNgZEsUxyz8DS7A5QYdGDZTtVrVuqQw?=
 =?us-ascii?Q?9ivnD41jLr3R8z30jieHBSiJIUGbsfdUXt9QlcvDoImaqo20hA96mYXvzvi+?=
 =?us-ascii?Q?z6r4vs5Qz3NtEFKvoz9qQjIWZ8avQEZJ30OtXbtQuUcCgBChvz8A5KRClyfX?=
 =?us-ascii?Q?ayxho1eclwr7BNYKL/bM0b1fEKknbSDfp3ZjF2S7lyxIKQfC1ynPFCDJlI7T?=
 =?us-ascii?Q?xf/6muR2j4/PrEgucg3jhv5yxbPBeE+oxbUKfHj6ZjKXtrjkNVhJwETRWMMP?=
 =?us-ascii?Q?4e7YL51wsBbq/UYbYz6SSilJPhKVWNoTTesMgujfR3sbCl6OLQ9oLlJyWks9?=
 =?us-ascii?Q?1aK9CGLd146LwsAYvUdic+QJGsmMBWzEhroeiZL/djL6kXyzFl8w5g=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09741f24-ed20-4bf6-ec9c-08da02a43dac
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 14:42:46.0856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSBtzu9bgIjrvwur34XUm9RGc2vKHSGL/93HbDZ5oXJONPKCDssCx0lAU2xaP4NAQMUr+tmzwA3SW4b3k9iDxGkj9QYgDHCPfP7yGDa/QyI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1400
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10281 signatures=692062
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 malwarescore=0 suspectscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203100079
X-Proofpoint-ORIG-GUID: ZQcDFH0JrE7J_6tfrGZadI7wqIp6Gvj-
X-Proofpoint-GUID: ZQcDFH0JrE7J_6tfrGZadI7wqIp6Gvj-
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Mar 10, 2022 at 01:23:50PM +0000, Sean Young wrote:
> The latest smatch says:
> 
> drivers/media/rc/lirc_dev.c:632 lirc_read_mode2() error: uninitialized symbol 'copied'.
> drivers/media/rc/lirc_dev.c:671 lirc_read_scancode() error: uninitialized symbol 'copied'.
> 
> This is a false positive since in all reaching code paths, copied will
> be set. Work around this by providing a zero initializer for copied.
> 
> Cc: Dan Carpenter <dan.carpenter@oracle.com>
> Cc: smatch@vger.kernel.org
> Signed-off-by: Sean Young <sean@mess.org>

I'm sorry for this.  I can't reproduce this on my system.  I just did a
push for something unrelated and I don't know what the previous HEAD
was...

regards,
dan carpenter

