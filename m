Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 379E850DD81
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 12:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241148AbiDYKFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 06:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240014AbiDYKFF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 06:05:05 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521AC15FC5
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 03:01:52 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23P7gENI013187;
        Mon, 25 Apr 2022 10:01:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=K9ydtKyJkEFQJCYcmagGsJ49+30yfNSnEzieRgwXJtM=;
 b=BKeJmrQ6P/Ub6YFtNInzkYRyV+PMHufQWlUXMc140xkkoAX/kAUpgKFiCkiamZUZgSI8
 Pv3R2E6UFmeJb+wyO9Ch12qaEdVLhpKqv5vswAZ2+1eDq9ZZy4ac7xCgL9F9oLwsanTY
 m/+gxVzV5yVkRy+78g6t/FrkWx7zjOwP2gbEQfpNOYwjBKPUPCYWeulDdECHIuQx5M89
 Pk4gogOa1OiCcMbI8cXQMQtQnuXCVZLalktMcyMIqleP5O1l78O59/sFu+WnBR+G8gjp
 lcGKxn/hQgJAtaDuwfusHllbIAabrLVTJXVW0Pp30ozcrt6+JL2V/Zxa3iVZ7U697jcj XA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fmb9ajqar-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Apr 2022 10:01:22 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23P9o25t030887;
        Mon, 25 Apr 2022 10:01:20 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3fm7w27bwn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 25 Apr 2022 10:01:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KKfeenaM5ROg0IQnrm/hAtZh7+rv8fUySjQs2NO1nXDb89l67m1Oo074/TNKuX+hrEohPTPYe939CT1mjxzkdjmsu9sdhWH1Dc2jDa2wTbC1oA52GeoR/pC7NFpLYnkKgSc40GNvfEn2tu5swzIWVq82GNbMOlF20fwr4jIJdqgksR1SVDYFwrEdbw00wi0PzcKMWpRDPRlDXqDzUo1eOcPD2KT0YlVD0Fz2DfdxmtYHv51Pp+bfhDDX0vUG/emHXzDymOMxVrfg40J4Wn5O3NRfwwOAqOOPfJSnowOaIFgfbCb/+6uNANVwjKZWaTQuy2vY9uGn01I6fskLFbERMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9ydtKyJkEFQJCYcmagGsJ49+30yfNSnEzieRgwXJtM=;
 b=Hp9Pu4saNUmOrPFcrYUv+G1pCVxGOnlVTaUWryOt4fZwwCL8nhHhj2DdSEh5a8wB0+8vksKYBZ+OKKoxAVyKlRz5lq2HcjoJH+GZ9UIcCvvQrbGiVgav+kS7KfXroAFlVDujhZYp5TDHdQTU5YPK9felegLA0Gj2qDizNO2EdX7IUsGq47JW7sNXDxxmQ7eqYjJhz7iChzO9JjbpJVxN6Nvifb6GyL0Owlxpn7+GOfgLxxuZA1AtZlGJ9gABpX+jonYJFzT+qruZX/Ial90O+3FJWj7719opEHE9M/YH5qkGuTsM4iX6q9CiIJJkRi2IJzim8eagSQTmYMfs7AQfZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9ydtKyJkEFQJCYcmagGsJ49+30yfNSnEzieRgwXJtM=;
 b=si8T7UOBZnsg8KxIvoyWc1HbT0cb1IrLpDucNSkz4t5uBBdkW6ji+YWdIAenHygK3YYAGYdxNlibcfN4wNqJwqUIb6XvqmzOur/CdTpOuVFexQZvjPIFlWfI72I1FFofSHAbHt43ge7LTqBErRc4zQTBl3Gk56yBQmhKxvtpZ7Y=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Mon, 25 Apr
 2022 10:01:19 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Mon, 25 Apr 2022
 10:01:18 +0000
Date:   Mon, 25 Apr 2022 13:00:57 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc:     Ian Cowan <ian@linux.cowan.aero>, mripard@kernel.org,
        mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
        jernej.skrabec@gmail.com, samuel@sholland.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] staging: sunxi: cedrus: centralize cedrus_open exit
Message-ID: <20220425100057.GB2090@kadam>
References: <20220423180111.91602-1-ian@linux.cowan.aero>
 <20220425092048.GL2462@kadam>
 <YmZp+qgSLpT5PP2u@aptenodytes>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmZp+qgSLpT5PP2u@aptenodytes>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0035.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b0ee7f3e-9c96-44cd-b725-08da26a28b21
X-MS-TrafficTypeDiagnostic: DM6PR10MB2523:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB2523B90C31A4611008BE21FC8EF89@DM6PR10MB2523.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j+BgSq4p6I6ROl/tnURIjh6WqiuPfs4MnLZvN59Rv5o0UsrmdQtMFRRjlTtnnFwVEphcqMF3XHwA/4sE8iTgp/SRglwXjOjRbd7Bo9OqZ5tiLDAlOJZBW2BtwjyJccyxWi+DHnbSKY9FOYMyo0tSP1riAxpSxcn5r/jQY68j4OL8ROl0hyw0kHMWaeiFnidUpe4MXM39Z0VAjDoqNiu7DJrzjwMqqHFFYfHL+bvVZRU0fZEI9CF2wiYeAzuv9ObnJXD44FnT99ReLr2go2bNonXsIBiFIGayz9Ezo2VWquUy+ChVTBd8We8AUrM36xCPENB4GvHf3qlIrpk0WHW50OF6AQmLMtD0plKM+KWNEsyE21s70obn/wUHh/LD73HBXMYJlkE23TSDfoPlWnloI5P1SLKcJPhlWwpMZTy1Dg2gr7++dF3ObeTcg21HNmQ7VzNqbF9kCZHTveh1+h1Q3rUP1EBlb1Zdc1CWLDc9vJNoJTVFKqYxpx7xWhDf2UyB3WBfeb2N9hA0PMgcAZvPMGMuBBWmYrPSp6gy+2F5Bf24V+z4CtFduKcYR8B4W4eX/rsg/BAyQS24+Rph/31ABLB7MtLgQPlFRcKJb341wujT3CHNbk1+J+sJosJnjyiqO0K6ygKceo6l93hAbDWjF3fZC2HSEm2N2Yu5oPoz2OX9fAqNPdW29HmkO7OlBW4I7vyHSwStKd5g52j3rvaIUg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(38100700002)(6486002)(86362001)(2906002)(38350700002)(508600001)(66946007)(4326008)(66556008)(8676002)(33716001)(66476007)(7416002)(5660300002)(6916009)(316002)(44832011)(8936002)(26005)(9686003)(83380400001)(6512007)(6506007)(186003)(1076003)(52116002)(33656002)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hseZFjSAk2M8WxwvVohomSJmHMZ0YnCOiXFfnBHTkhMvDrpCeD9IFrt34rcH?=
 =?us-ascii?Q?YemI7r3gVui4Jmvc0BusfLoNptZIJ0+cfqr+aAScW9McDJuA/P6U3g45F/kL?=
 =?us-ascii?Q?3hYlRRTm5LvMVavk2fz8h5UjVziCKYTuy3k189RPiD/SkHjDPmekfg83dRu1?=
 =?us-ascii?Q?DYlZOXwqbAQ0zzNrDCc5t3W6LvMj6bunI3BclTZFEjj/ICDwzm7SNSJFXQJW?=
 =?us-ascii?Q?wEXTtol5gSyWUhh8/m4l9Ojxb1aRdCfcSSL1OHYCp5UEfDd+o5B5eMbdEZke?=
 =?us-ascii?Q?ctpeFTP0TsAjaxgGBXeehYemV+7PyrOwPazcww7KzWIHEHX+VFeZm5gxCCYB?=
 =?us-ascii?Q?qhUvQc4md8z9C/Jhpl+tQy9+ZiN+28VD2W4d2AMT2BFGeSWnQkn7pQXWsDf+?=
 =?us-ascii?Q?8Xn7cO7c9+zfrGHBsd1s3kXeqN8TgfAnyxXQIIv3IzKtXBAbSxs4eomhKbIT?=
 =?us-ascii?Q?wIHQ4IpR+7rp7qH66QPGB7eERuwjowegDEQZ5hIwbGnp8d5Olo1AYwS2cTyK?=
 =?us-ascii?Q?oZ8m2xTi4HiAJYRo5fbK1ryrSoRPWirna15swQiH0SBSJh2n7qrfbtFtZCQA?=
 =?us-ascii?Q?FL7rE3cXlpwYcTwkM2icBoA6fMpZLuHwnIKjwvKkFZf8cbY5EBVdoHJQR034?=
 =?us-ascii?Q?fAoaVYcDLMxsuB2Jq7NL6byB1v7ndIcTKUKWrUBxsAGUBcZredVWJ8mHs4Sh?=
 =?us-ascii?Q?GIwKTKK4rx/9oM8bAUMtHou396wjPOy7AVfATzDHU3/AXOmPt0aPZvhneTb5?=
 =?us-ascii?Q?56LDYDXgL2UvLvb5HYGbOFPiATLlNq/ZA3fR57aTOOi3r1XE6rlb9awylCtQ?=
 =?us-ascii?Q?guMjgFAtXc5qVqvmmIiIMwbVnIxCgoUAUJJbbs4AQ5yeDDgyIhJTU1KDbGEV?=
 =?us-ascii?Q?P9p2JjhXKKu75Y6mEgO8NihQ/jhuaAYyRDS0QBT8Pm/Jio1Xpe10nJroScp6?=
 =?us-ascii?Q?zXhBOtpXVYCtB3j/Ign9bGXsbcPKzvAMPiHa87I32bgixb374deth28e6mJn?=
 =?us-ascii?Q?JdyZq2Efbi1HZrx40YPh9EJvxkHjqVAYdVTdVrni2bMX5xly2xYX8dtV2V/F?=
 =?us-ascii?Q?4amSnL7fdk06coislsdVU5r18Xtji4djKyfLgYhKBcMaB/hZls/HfnZd5RvG?=
 =?us-ascii?Q?uwB5dt/NWZyDOa/3vuei/MpnCP21tC8zt64lhW9RaooxtWxWe4X5AIQ6JcQ2?=
 =?us-ascii?Q?Ki44PJTdFm2jw49qBS+xotljgqgYKpdJXc2r0wt7N31QOvVBk3lKiXBzH9Mj?=
 =?us-ascii?Q?LpR1QrSmVMsnyNPnuyydktSg2HcF2TOFFlGkwARn2StDa41LdZkqvUxy5zGY?=
 =?us-ascii?Q?IDvnx2BnD8JRn1RJHDuofHWRj7ChSVBUjEYI9SpN2eKsWuAK8TVw1pDKe8Zh?=
 =?us-ascii?Q?JvebCPoc0Xnxhp6gXQ6PcETZpfLR6ls0S/XdFQi25hOqaKzuxTnMS+gRgRJ9?=
 =?us-ascii?Q?+o41WQUjsZq3ClGsNZBkGOQMsJ6DY0P2POHiz6+LRKWwfBo+r19Mgy29j/UT?=
 =?us-ascii?Q?maqsppbpOsJ9rzKg9JGG2m7MBKyvFBUxcTHelGvvNhmTt9Hk4H5NxOwicLqK?=
 =?us-ascii?Q?n/5ScU/zxUZBaTpfFtPSX2lgU19VkzWyfhFt9mDM77IDtKi0Udy+EesziB8y?=
 =?us-ascii?Q?03j30Qm4jerrRkj4Jrw+ejqhFg0sXQzwtloKDu06gb086V9rd3uKTZ+jDMMz?=
 =?us-ascii?Q?RFaC0+1wpdYH5TGZVN/mC7MK/pNquytWUtMut09c2rtLVRAdqCMF4RlnkoiZ?=
 =?us-ascii?Q?S3a8zh5DxIq9iCmUD6kcVl6TMRR6WeA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ee7f3e-9c96-44cd-b725-08da26a28b21
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 10:01:18.8396
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ojb+QtW0CB04CyrCqRYy/Fi5JEFM4lexy9JwRYcaMPYTxSg6t4SquiWnPVug0VflFdrb6GmC7yDOOcl0RcQzNCYv1EI1RU3vOwkm+EKORmg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB2523
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-25_04:2022-04-22,2022-04-25 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=760
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204250044
X-Proofpoint-ORIG-GUID: UZkXqzpuIFhrhIsRoSK9Q8ceFz8wFyuN
X-Proofpoint-GUID: UZkXqzpuIFhrhIsRoSK9Q8ceFz8wFyuN
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Apr 25, 2022 at 11:29:30AM +0200, Paul Kocialkowski wrote:
> > 
> > No.  You are just making the code ugly and complicated for no reason.
> > 
> > I work in static analysis so I have focussed a lot of attention on
> > locking bugs.  In real life this theory is totally bogus.  Single exit
> > paths only cause bugs, they don't prevent bugs.
> 
> I'm really surprised by this and honestly it feels a bit dogmatic.
> 
> It reminds me of CS teachers telling me "gotos are evil and you must
> never use them". In practice there are many situations where they make
> the code more readable and don't introduce any significant incertainty.

Gotos are fine.  Backwards gotos are horrible, but sometimes necessary.
But pointless gotos are bad.  And "out" is a bad label name.

	return -ENOMEM;

That's perfectly readable.

	ret = -ENOMEM;
	goto out;

That's vague.  The out label is likely to do nothing or everything.  The
problem with do-nothing gotos are that people forget to set the error
code.  Also it interrupts the reader, now you have to scroll to the
bottom of the function, you have lost your train of thought, and then
you have scroll back and find your place again.

Do-everything gotos are the most bug prone style of error handling.
Imagine the function is trying to do three things.  It fails part way
through.  Now you're trying to undo the second thing which was never
done.  Just moments ago I was just looking at one of these do-everything
bugs where it was using uninitialized memory.

Another problem with do-everything error handling is that eventually it
gets too complicated so people just leave the error handling out.  It's
hard to audit to see if everything is freed.

With static analysis, I'm mostly looking at error handling instead of
success paths paths.  The one error label style is the by far the
worst.

People think single labels will prevent locking bugs.  It doesn't work.
There is two people who use indenting to remind them about locks:

	lock(); {
		frob();
		frob();
		frob();
	} unlock();

And occasionally they still forget to drop the lock before returning on
error paths.  Nothing works for forgot to drop the lock bugs except
static analysis.

regards,
dan carpenter
