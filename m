Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88DC1513144
	for <lists+linux-media@lfdr.de>; Thu, 28 Apr 2022 12:27:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234695AbiD1KaQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Apr 2022 06:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234722AbiD1KaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Apr 2022 06:30:12 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F2C2E6A3
        for <linux-media@vger.kernel.org>; Thu, 28 Apr 2022 03:26:58 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S7rNcG015530;
        Thu, 28 Apr 2022 10:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=Hqf3vEaA91c0fbGSyuUiIoD6NDXuNLIqrPEBKAwPY7Y=;
 b=qvsrxfTcklFAHDHz9ndPrHo0FgEikAMLp85Xz4pGBN6OWOsJ/eY1NIAtHKGnFsTu5vEe
 wSiSQCdNkG8WjG+AHpoLqFB1nWVpsNNbE08jIywYaBCFmUzxmhPl7UJvrorjFXGtrAx/
 KUuminAVI+ufGgHv03d54dyjaClCugtuW3/VCrn4jsHqpiq2Lo9wvEjXVi7ay0FlvzMs
 JZnbI1DIkpchW/l0hgQGSjh34vSly6GMgnohUBvyD6V61L6xA6Q3oLIhQa6MHK8Etb1o
 z6w+Wocq2uFmZY5GRxUs5WJd80hKorRgzNm75AxwQupzFhEq+ekkrqboHd9ED6bLzKy3 vA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb9auh1u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Apr 2022 10:26:34 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23SAABhL037196;
        Thu, 28 Apr 2022 10:26:32 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fm7w6awrx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 28 Apr 2022 10:26:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MaHVW+099hKYJgd2pVlYA8jrzoig48oqYhF6XIL7A5sXBqlyOl7f2a/UrBkkOCtEUhGIud5Ose6gfozrJC+ynVxFWzHBKYh78+SmHdkHs2ak1Ja5FiKL1rmp8e76GRaGh7GO3YbK+dkV4n9Oebo/yEU1lE+ZxWX2+rID2qMPXTAx3SRJM8hqa2Xy5fUfJ9GBlkhDRvMD+rvdddbA8DagGUAScIIhexSNjXcWnoxHI/9CetOEP79b8rS2nzZelk5Xi2keiob/Fky9cMjkkwjeGGnpC9YJ1psa+DLBD8mANJywomANBD9H1Ko3eSnKr237hs0YMc6/xNYP3D1Xk+xSLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hqf3vEaA91c0fbGSyuUiIoD6NDXuNLIqrPEBKAwPY7Y=;
 b=mCkM6c6OzGENidsI1dB+lLbYn4axLDYHxX5BKSU5IoMuzow7MtdJxaMRGxX0G10LjQcRpZ/oqHcM+ygNvMGcj8Rs2F5UzsWcU1migoxAOY39fOZiyvOdUXBViQ3fY8t93/sU5cCxaTXOA6I6sNpgmAK9+XiZv0a/wuWDSLUWdT81Y6y+MzO4Vghk7rCVctPEGmIK8XvjA82F91Pr/tT58LaLFtgvSGgzGHPNaIEJA2fBFwyPW2XcCZ+DHJ5GE1W/Xyyfi8aqXqGuOffiMmzm9PsgypZJwYAhrRuB+KxR86FOO+NCZltI4uaqiTIYPowGAQOfaPFbJ1SIJK92MFHY3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hqf3vEaA91c0fbGSyuUiIoD6NDXuNLIqrPEBKAwPY7Y=;
 b=fLCKcFftRvht2cb1y/RIdzcZt6u5I4FE/wHQZtQgJ7Ch8xskwF1dEYZpcsc/OYaPsBx66vGquAr9pE+O3bkH0BfFKAiY6QiF0hC5ldvulAiKLNw0YJAjPEgdLHg27C1HmeMbvH8JFqyB/3CS/41LDQTHZ2uISKAy8XyqRNwsp1Q=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4074.namprd10.prod.outlook.com
 (2603:10b6:5:1d3::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 28 Apr
 2022 10:26:30 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 28 Apr 2022
 10:26:30 +0000
Date:   Thu, 28 Apr 2022 13:26:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Ian Cowan <ian@linux.cowan.aero>, mripard@kernel.org,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Message-ID: <20220428102608.GU2462@kadam>
References: <20220423180111.91602-1-ian@linux.cowan.aero>
 <20220425092048.GL2462@kadam>
 <YmZp+qgSLpT5PP2u@aptenodytes>
 <20220425100057.GB2090@kadam>
 <Ymehl27gmW41a3FY@aptenodytes>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ymehl27gmW41a3FY@aptenodytes>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0022.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::34)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 948ee310-2610-499d-b348-08da29018e44
X-MS-TrafficTypeDiagnostic: DM6PR10MB4074:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB40745DC40B6BAEE83DEFD4A48EFD9@DM6PR10MB4074.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TGT7yfSTJXeXnRcpGIFtpPzTKIr8+T/DVBzC9hqeOxyCfg4xdfh7cAnTUAultO4R1c0XhQYSxKSgC83nQ0O6fqX7YUz1tPGmFjGxt3Kb7JXd1RuYsBgjFGPgjQuVWQv0fv/eVm3lZdvLFA9QLz4JkbRmmunn+qcLKWPH0SIR2i8HQbkS10Q+otDiPI2a8+5ubxfiC92JysLlPfgafSherbjfOunjsZH/jUPXU2jPYgZUoIvYMmPKAAv8kYz/3lihnr1x+/dLo70AjRksEz+ANyTsZ+vDKLaNwLDWsPECB5zQBBxzr0vJkUqRweSumj2JU2as1Sq7X/PWcY3MlZH+hHQTyjB8Ulw77eq4a4s/VAX2YL3RZORz6pQOO+7ipLZB/tMDWM0JT8E/v7efBgI3GHJweQshBKwzItq+nmOi7S0hltSroGXpqqsGNm84kLJ7BygIKW6x2yBw0jrnWh5J1k2rSx5xDgSYgiJSKb713Xzix6Mz2mcOqhka71a8QpjL5FMrzEs8hnghLS+gcAIfSD0gv7Cosq4jFAFsPFLemKYWUxhhIkaFvzNAu9Pwoamlkf0A7HxM2nr9B9+Bu1rh+ROtsEdTECgJ+BGp/UeBqPe5iimCr9r9ntqh/TAYMWi0Uxv7CtiD1ADrIkvU30Zh1pK96IN3je0VG0Gl53MA9vttxc1WvZA3YhHt2QCg7KI2Hgzqmh9xyBph1B051t3QaGWbUj4KIx3k2UOms94J9Ua5oLVkzmEp1AefLffiTyCg+Bq3RNT6AOdHnEl+v1M6eWvPk2YqsTE8tloZVtsHe/0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66476007)(66556008)(8676002)(186003)(66946007)(4326008)(5660300002)(38100700002)(38350700002)(6512007)(6506007)(6666004)(26005)(9686003)(316002)(52116002)(6916009)(86362001)(1076003)(33656002)(966005)(6486002)(7416002)(2906002)(33716001)(508600001)(8936002)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VAtryLl0GMLOMJhoUGIoaseXUGtmJK6ZDdORYuaIiBS7viTSHN6+l8S9Alyo?=
 =?us-ascii?Q?NYSKXXBI5SfMRIO8AbNo2jDqAvjZqTwqZfJV3bKrXTMq4aMIjahRoR+V3Z4N?=
 =?us-ascii?Q?gZQGQ7pyWWRJebnM1KyCqUvT7Flvn5cBvsjzzPx2EKDPyv8uPA9DuuG+r9+t?=
 =?us-ascii?Q?He43JEZSnwgLJ+6XyBv+Q1M/sU1THEL6BiUvsmBRt1hrD2YztCphE2kEhJv2?=
 =?us-ascii?Q?biKEI4hBP2GV1ll1qF8svrrAQa3sRH/kLMSFCORYHdcIW4aT3zeiWRsQl09m?=
 =?us-ascii?Q?jQYvhlyU/SaM8TjAoBJ9ZzJpRfqI3unXS6XXEPt8OURBAxB2XcVJpywXNMeP?=
 =?us-ascii?Q?U7wzzq+ecqrBIbX0GU4DOj3X8sLWHlK+xrc0IWJPQMOsfSrDyEf/beQsOLBu?=
 =?us-ascii?Q?t2jbNUk6d7sAJzWigXXZoLkr4WF2IaEoKUMlatoLEBTzBtaAMBa6Xl/TKT0+?=
 =?us-ascii?Q?JjzVCpleYheKzv53QzsNsT+md9x2d6tAxCwtieRfQTYRFx6HOE1uBiX0y9Kn?=
 =?us-ascii?Q?tihoIQT0WQw7VUVjCi+UDsY2Oh7vRJSHPGazA0WTmFLX3KwK7pYcavFQEwLs?=
 =?us-ascii?Q?RowyaLzEMhm9qUkXUjxsAg5EdMOdmSM018Nyp+6iBUVqaXRiZgiOgmmef1Oy?=
 =?us-ascii?Q?sPGigxacSFwwwj1M9gjD07JRfYbpo53uVralOH2OpZdmxRy03AoYizJctc7v?=
 =?us-ascii?Q?pm7nI0JGsBihhXleQwL2baQ+tYLbWm/qFRwqKn0i4N81MRAtjpZEygpy1lNl?=
 =?us-ascii?Q?Dcep1pgtkbFWC7Wlxj1LRvzg9Q/uzv1Mwa4X7tJxhkTMnu4qZ5XLxZJgAv2P?=
 =?us-ascii?Q?58nf/TxW2+YDngEvNjEBZc3oXdtSXxXkxoCSLOxMb1/ykPVcxJSCzvMY3Trv?=
 =?us-ascii?Q?ZTYu9r8nkfGIGYhfBf6ZLmqdRuEeX2/6wV+hodPXYLOmZHR75XRi7AWOFYxh?=
 =?us-ascii?Q?Xkwmp1qvOnldxL8cOex0a2PV0kRheEjJkM27Kl2X33vosX4whFBm1suZWEU3?=
 =?us-ascii?Q?Udzq8JdIoOZ55HQnXRnITYZK5Zo5hR89OR5YFn5YJTgWsZLRvj2fOqzraGQF?=
 =?us-ascii?Q?pLCWs7tlW/ubwjV/zcEHnJfDu1kgRse9wJNe/cja1ZQDt73b6QY4rzcRwJr4?=
 =?us-ascii?Q?y8RalmRZbqr9MR+9ILdtIrjRMjXcRhIrfcYIcScqoZgr39s78gwQ1Vrd/ccR?=
 =?us-ascii?Q?L51i2nszzVB2NcApQE0tZrKx7gWQAiV+yxA0APEUP9bZ38DDwYnCOBzd9UCZ?=
 =?us-ascii?Q?vZivZB44GAbDuJluuBBEwsUZUKGXAUBf3gr92+SjtG02gtGJtV4K8vSJhNdw?=
 =?us-ascii?Q?4WJOmj1RN9El8y8Jq70RnGg+0/rk4CSKw3ZCBMx1ifRIbcjzmMH4evpKedtH?=
 =?us-ascii?Q?BgXh1NrHpkV/nhX7+BvXYMYz2F+0XuM1JctoTt4GjSflMdz7kuiKg6veyTT8?=
 =?us-ascii?Q?gzkdrhkqocSkwinQSmTqQSSTNcjJT9ugkXQLcJBhGl0bVhb+EoJ2U025ZENA?=
 =?us-ascii?Q?EoQ6qVXKhATp8WDPUqN6DBmBK8F6XX1XRMNh73OsNtsJ8fnZVoty/BbdsfcX?=
 =?us-ascii?Q?rHnoE24m9xrrzIjYoZePfXFOtFNv0kBCpKpja/d6iiTLG7jR1T7/KbMWsGAd?=
 =?us-ascii?Q?kvZE2dJLjhukcmtk+9vb4gI+bZ6z4bxNiA8mfNgDOaY6pMYiJM/31hCveFYo?=
 =?us-ascii?Q?l7JAiMvqYWkMLz6VYGf7yYGDwBYjE/cZucsN9PdcgmYIACHjhWwKtIqoimib?=
 =?us-ascii?Q?WZSevEwmv0casbDFSnq1H7U3TK2yzFs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 948ee310-2610-499d-b348-08da29018e44
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 10:26:29.9449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8pqRSdBbzQOh81Zf1NKw2SN33qqSEeGH/AnvaByKcy25tSnquXvP5y0U+dKsoNm1f9RoJbnJ0p4lVjWW+x/h1cVlXmeucUETB3Pv/K5OqQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4074
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-28_01:2022-04-28,2022-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=415
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280063
X-Proofpoint-ORIG-GUID: rBXgoq-lwgvNerL5TB6OqjPMvJp2TEU7
X-Proofpoint-GUID: rBXgoq-lwgvNerL5TB6OqjPMvJp2TEU7
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Apr 26, 2022 at 09:39:03AM +0200, Paul Kocialkowski wrote:
> 
> > Do-everything gotos are the most bug prone style of error handling.
> > Imagine the function is trying to do three things.  It fails part way
> > through.  Now you're trying to undo the second thing which was never
> > done.  Just moments ago I was just looking at one of these do-everything
> > bugs where it was using uninitialized memory.
> 
> So by that you mean having just one label for all error handling instead
> of labels for each undo step?
> 

Yes.  Don't do that.  If you try to free everything, half the stuff is
not allocated so you will undo things which have not been done and it
leads to a bug.

> I've also seen conditionals used in error labels to undo stuff.
> 

I don't understand what you're describing?

> Would you recommend duplicating error cleanup in each error condition?
> It feels like another set of issue on its own, besides the obvious downside
> of duplication.

Let me write a blog about it:

https://staticthinking.wordpress.com/2022/04/28/free-the-last-thing-style/

regards,
dan carpenter

