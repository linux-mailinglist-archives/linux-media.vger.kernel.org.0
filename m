Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DEF6B50DC6B
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 11:22:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235643AbiDYJYz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 05:24:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232645AbiDYJYw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 05:24:52 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BA731FA71
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 02:21:39 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23P67v1N022267;
        Mon, 25 Apr 2022 09:21:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=gCVz0IVvt51+87zAUALilUGM6P7Mq0uprsIysaJv/Ys=;
 b=pJ2aUkvNQJ/1DP6zFulTt4pQtm9YnYDKazeR1/eKXXSALu5KxcqhJ3Ck3tR6pqwC0UWA
 SnVFNtvQANXKsjcfeiRhRz7XU8U5oniybMD1zLj8kFv63feaj3ZhFaeCx+2EtYl3Wyug
 xlNk6IqF/3YSek4Zwu1nPi8A1nG7SSzVA5rk4Sf0wmQbgJGf7rpRKLmmgqwCb1F0zdx2
 +CpFavXDmtuPQD6W2CunbZvwg3FTzcvLrMii8cM/VF2/UMqwN5TA5sNSjfS4iJlZr6Pg
 5l84Waxt3aLcglfIr3pK5j+PZKcvjVODV+IOYr5sdrf7C+m3AcaKmBvmslcgRqknx9gE KA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmaw4apaw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Apr 2022 09:21:15 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23P9GeSh004312;
        Mon, 25 Apr 2022 09:21:14 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3fm7w1f0ba-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Apr 2022 09:21:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OxgT5w/VM7rtQLsvbBynhheNMbRR3iu3HVSQlNdkIv8tsSgBVB+Pkk3d1t8imGqRqgMjBPCzidj6P9qJHy7p8fHSmde1oy7CIK3Si+OEtkQCv5joDC7zMMJiaxz9ens0aC9CGL1Mqxrerg1A5acyy1ewXekwnzmzruG7iZ/MN0sxQNXY6s4Ko+eLOHL5z/h9vL9Gn1scNH0soErvJHYAr7gA1sOjjedjMuuJw1GGXoHIv5lhYtBvySqNNjh9qQFzHPX2PzikMsaMGm8BqXy4nBWFhYEqwMkVKfj/fipPLxQXsSjxZ+6XP7UH6x/85kLh23d4317NfVrqxZJTbPKtJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCVz0IVvt51+87zAUALilUGM6P7Mq0uprsIysaJv/Ys=;
 b=BqJG/tYRN9ggDRcYZC69eGNX3HkmM98wYbzQkjaCWZsk8hc6kqdtV4snwU1ReFMjnAfzDs9XGytCMp8Q8U5G53CEbVa+tEEVkXLLV+s+Ep3oa5NmliDi8VyFiCedQqHM0EOlz7HPS3YjuW+uN6INZEjq+c+ZgKwTNcx8rYzCgQG3XOw/KXkqggY/7+hfx+wSIYJM+kWHIBZ7+1mEx6rA6jy3y9/nkuSRyQI3QLEVzCfCHFGMGc2iuQSvZeuLOonSj+MjI/BqicmLA91TBCQSGeelwNmeTIArRPl3D1J2nUe/1IaTB3ewv+AaCvBuNBuVhlAjg2/X+uk035NAWLJF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCVz0IVvt51+87zAUALilUGM6P7Mq0uprsIysaJv/Ys=;
 b=s434fMgpTe6Jp541eLUjH6swLJIHQcnS0VwHKeZK0OWx+d4PvKmHvrseO6B6xrt6dcbdAFBElNAxbhm/k0zTL8QabMdYd5WJ7k/KzzSVVABqPrSpl6JNHR854Cp2F3lHeMQmF+5Y2DR2w4bJWK9hJZ4HG95VHb8YEKpKiHcMzQs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN7PR10MB2546.namprd10.prod.outlook.com
 (2603:10b6:406:c5::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Mon, 25 Apr
 2022 09:21:12 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Mon, 25 Apr 2022
 09:21:12 +0000
Date:   Mon, 25 Apr 2022 12:20:49 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ian Cowan <ian@linux.cowan.aero>
Cc:     mripard@kernel.org, paul.kocialkowski@bootlin.com,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Message-ID: <20220425092048.GL2462@kadam>
References: <20220423180111.91602-1-ian@linux.cowan.aero>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220423180111.91602-1-ian@linux.cowan.aero>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: CT2P275CA0023.ZAFP275.PROD.OUTLOOK.COM
 (2603:1086:100:b::35) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbcb4539-22da-486c-c185-08da269cf056
X-MS-TrafficTypeDiagnostic: BN7PR10MB2546:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB25464B6DC0BEA90F8F254A5B8EF89@BN7PR10MB2546.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ii0XhsT788JlbxY1+nE8map79R5Cp1Oe2vq0G8bqGBL8/35JcVC91paBBYep2ZXfYKIzkPjeJJETHvANz8NCYucD4ai44sHYtxoPVN0wbDkkZVx3I7R6ty/IlYVxrKeG5RCGCz69pSIMgUxX3sq+DhHAVCxCf5288qa0VcbTLA6U1ipaxFXSdsMjO/PXSEJed/1ZX+ffbP0ZRxlMCtZ4BWaY6HnKWshZ+HbRgJhwjdQAfdhY+ztI4rL8HEsBajbsm7d0rumJM5Mo+RxGew8x7FEEREY1qyH+NYDqD+my7bqgCAklbvDq/RypaBuXT6J+TTFQ4uOX6pcjZQGFXmsATprQYLoblrFqOnOfJFtR327Byyd8xm0aQIbvSfcMJI15Rhfi0F8VlkbQIWaykJTT3ck6xGL/UU6yaMXHlgWPL3Rt6LpyGBdpEETl3x4kU8OiVEaWS5QIcmWgIrxVvtEMjAPPwW0gMAi5nxUHb0r5oUZ1K4NI5px5+St8m5OoTe/pdw9hxh0YjKqJ+b8Acd1cybA9yDJOLTVXhy0fw6cveLNPpz0ld/z3WNs0osqwLPVNAsXzskiH9XfPZZZx/V+5EWflagWvUWxQpdvw+3QvPMYLsBs9YXxpacuHLPgXURznNwCni4R2lCbsK7C2bcrlB2GXPay4F5QAM/xCqxfPVe1lDBYr+tU+1SC305dnNQ/V/h3BqDubHRikelcfLG6LUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(4326008)(508600001)(186003)(1076003)(66946007)(66476007)(8676002)(66556008)(52116002)(6506007)(6512007)(6666004)(26005)(33656002)(316002)(6486002)(9686003)(33716001)(6916009)(2906002)(86362001)(7416002)(4744005)(8936002)(38350700002)(38100700002)(44832011)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H82ypU0PwHtTxdHwbTi4QQqWuo8SezvzZ/NpiUKZgQr8PHj8EhxdrnyLwIoB?=
 =?us-ascii?Q?SoitW15B+eT13Dj8cbVBb/tzGZel75p9gWGd/oPX7r7rugEdSyU2lOEuuCNH?=
 =?us-ascii?Q?CgPqshjdP2gkCsWApN2KwAk4qPBe73Ge1qS5AbbBlUxgsRJ/4xQ9MsRvB6Ap?=
 =?us-ascii?Q?xFACq7ITAwPzFGQoNOEUq7LbPnDtxC5KcQuduQnwen6jnQSNX7WsG0OjHOEv?=
 =?us-ascii?Q?jSho1lr/9hAS93fEeB9sYAeWvksVsy+F7VIXr+fuj4ExWh3uu6RSvfwaD67d?=
 =?us-ascii?Q?DQepxoHAxxi0Hr3tChKquAav3Ik4zs1vB+kysdlFlNxw/9Rk7I2OFIbX5Xwo?=
 =?us-ascii?Q?o32T34lV2OBIl63Ej6nJ1Z1x01Z43jUtf4x88LxJyPE0h+XpjXTXUB6IxG8s?=
 =?us-ascii?Q?n9kHRnT0PXqThy0gvibYvEKxf91HsubjbAGKRghyf0om0r+ICtZ3O3jLRBen?=
 =?us-ascii?Q?DpPQ2xSkB/fvGvpBLBOk1hmZg21gnZboLpQQ+JDr2/NzPjfcOWx+yVjaHGK7?=
 =?us-ascii?Q?kmtD9U8OX7Zygekd3r9KWF/zT3DGI1XhgKbI3JL1Hj/4SC63xtmyabMxdc9V?=
 =?us-ascii?Q?AKV321XN5/wQ+zzRcaYhop1bVnScTETThmu6g1DTOJIX0+voShhGpQmUQ0ck?=
 =?us-ascii?Q?CgnmKEtysLPAPFABrMZjIh18xhds8H6ma+ErNAyQ8qZ/2OByLLTaDPDfFfOa?=
 =?us-ascii?Q?zMbpC8dTvkJ/njkGaB2qqyQXz0XbscKGUMNoeYmzT6XrN9kRA0/h4lmuB98P?=
 =?us-ascii?Q?cZz6bHWNnqfLEvKqj5qXaKY3VDd9Wv4n1NDyaxennzhFskYHyzDI0XABAUH1?=
 =?us-ascii?Q?JkUDXjw0NccbyGiCj+oeRI1EsGkyTUuo2bx6NPl0jt5lEYLGC77XWtr56i0a?=
 =?us-ascii?Q?bkh3JuExAC/XQszMhPwpX/e1pnAtTKGWgz/bcYlmXxRt/yCz8EWWnUmFipsM?=
 =?us-ascii?Q?gxHSmJ2bZeuswEWbtiTXMM39srmX+uL2zcRN9YG5qoA1C+8IG51LUKOW9g3U?=
 =?us-ascii?Q?teaiAy0TY4SJdKvXqaibWYHltbzd1UASbFUNyaVy0CryqZJj3RQfIjyPx1J2?=
 =?us-ascii?Q?gjA3o5SPGk8z1yuSQ0o5B0vl4cLbz/bjnAiCebjq7omaH9x+ydcfp9zCqxLH?=
 =?us-ascii?Q?si+N29CM5Iu3mUnYYGKn6JmboQsI2n409EktpNHNNUB5gTgAeE0J3L8GitfF?=
 =?us-ascii?Q?YcMYUulPjMckl+p8a9vDViRhLnyXUUgi/xfVHzG/cvCWnt7PVjfdS4/YLLal?=
 =?us-ascii?Q?EDU9yjCGEgLE6UaRkFRBhajCJSvsKghhH5QPkZV29F1esapQo1ppPcWXYaXg?=
 =?us-ascii?Q?C7u4EuYugBrnkTm/sewX1l0wFvzsbM9uFMtAFqLK+juzUuQpFWmXnMJw3D4V?=
 =?us-ascii?Q?daNzr+31bSHxJsNUhA9ncgxnRskMkKyTi5aSmBs7DYga+dIgTOPwAmk0xWyK?=
 =?us-ascii?Q?kTAWn1q0ROL/m+KQKboRi79UEsiIvWdBgZdaEssuxcwvc+rcPM+sgOUvDnTU?=
 =?us-ascii?Q?IjHciSQJHFpm404l6pDDZ3JzoaO4ftxjKJJNxY0yEcxIK8cWQPj9/dvEShIX?=
 =?us-ascii?Q?WzvCKsr36rEtcSfcD9kWpqmpO7iaQSzMhgslvfdbBDefmkyx6SmLqM03YK0R?=
 =?us-ascii?Q?uSUYFO+tey+SwEnVcogO0HgjNcKbu+W9jje4nNMNekKEXdJQsvIkbgB3Ad20?=
 =?us-ascii?Q?npV36Wy7Q9hjNrORNNhY6IjJ7oEl/n9OzYayHehLabrU+6QB96N3oCLeRRz+?=
 =?us-ascii?Q?VTNMm/5CDFR0XbfVNfw/5TckGgEF6TM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbcb4539-22da-486c-c185-08da269cf056
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 09:21:12.2660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2PYJTJGr9ybw+xt2+0nv2FpjaZJc3Dowf7q8F7HO2ebvOxHEjn4NZPBhGBey++s6QlO/776t72H3dF4qrFcIaM89ueSzKicXbJbxloSZJA4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2546
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-25_04:2022-04-22,2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=648
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250042
X-Proofpoint-GUID: Fl_cit53IoySAidsa_3Fi_HT9yVJYkPU
X-Proofpoint-ORIG-GUID: Fl_cit53IoySAidsa_3Fi_HT9yVJYkPU
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Apr 23, 2022 at 02:01:11PM -0400, Ian Cowan wrote:
> Refactor the cedrus_open() function so that there is only one exit to
> the function instead of 2. This prevents a future change from preventing
> the mutex from being unlocked after a successful exit.
> 
> Signed-off-by: Ian Cowan <ian@linux.cowan.aero>

No.  You are just making the code ugly and complicated for no reason.

I work in static analysis so I have focussed a lot of attention on
locking bugs.  In real life this theory is totally bogus.  Single exit
paths only cause bugs, they don't prevent bugs.

regards,
dan carpenter

