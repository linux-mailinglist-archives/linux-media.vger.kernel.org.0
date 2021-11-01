Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4386442017
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 19:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231861AbhKASgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 14:36:16 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:40958 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232156AbhKASgF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 1 Nov 2021 14:36:05 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A1HtNhZ005969;
        Mon, 1 Nov 2021 18:33:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=dJwO0KqbqUfeStKrLiVHgQOliv3ZhmBP0dKiFWFZr8g=;
 b=ZQ2wmlFh9O3gIUfxVRxXMf69wzowq06/CrC7oCg5o1PLElXlhZEMpO+6hVqCiKnwm/I5
 s0gPdiaWsk0RsngeZxZQO59ORk3H7hDjhkJS6YFTjafIfN0e6VBaNOwpFZ+g/C2V9Awn
 zqjjbzxSk6ptsX3JMs6HwE23l5MEpTO//TvWRpsQIdytnNcY6OJVO9RY8NKHPy0/hY6Z
 hGAfrfcSKlGyTeA96Tlg8Y8UWLbHE9A5Vz+OrtEQ7jCfvGeWvlq+2rMUMbvOP1RcidgH
 TwJhuQFK+fiA+w+KWr1m8o++pFF6scJvW+U4qC92y9UhM4jdY9EPeTCSrjdsdYmIV0/j DA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3c27r5bb4b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Nov 2021 18:33:24 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A1IKRnH065290;
        Mon, 1 Nov 2021 18:33:22 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
        by userp3030.oracle.com with ESMTP id 3c27k3v16v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 01 Nov 2021 18:33:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IKfkE1l1IUD05mCjH/jcuXF3HfHycJTrfqaQvYnSSTGc+TBVd/8rAQ7lwqsMBA1N6zSPFkpdkVx5nBZIN+R1X374vZdBD0gb3s7h7pbX653UsSH1hjLvMs+rd5lsMxfDP708sA29lvqcpf1TAOTSOyEi09D6CqQxizYprGgnatRK0xOUHWxqNpRSEb6A9a2lvH5XIQccdD25l3/7iFTnobTIu2kIT4um6ZafwHYXvJLa39gMbXRFG296WKsuCGMmeWwnvCtdnyyt4gdPceaDVFDb5aQvz8MJQYF+MhYCAGUvHOKE6FzgyLbE2vzNZAnzZ1GxQol6EHMTD1ttj4BK3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dJwO0KqbqUfeStKrLiVHgQOliv3ZhmBP0dKiFWFZr8g=;
 b=IDbW41OFQhqlR6+JdIb6kcCN5YeLXLJAHC4WFHuyd7zFis3qYzyxXMFc0muBBUl+DUZw34YBRgOY5lZMgDa8RN84sXZP770zQHbGVW+tO1RGoxytjqyJutvK1anLrB8WKRS5dKW1KLVU5r5zKBOzt3FfDAMjuUwgGeYQQloG058f3pDpNnzoct/QRq/gpPp8nCEL6rddg8wBzEjRSHzzCZ1LXRQUb9HG7joQrAg1RAWabXLZkfLJT6cESBkVwC8uoRAMTaKH5JH0ht0jErzdfFt6e2aFpAJvImcS4BM+9tfuZiLfRGFQXvuXqZkHIxOVN4LICgAKM0o8m5PLZi33vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJwO0KqbqUfeStKrLiVHgQOliv3ZhmBP0dKiFWFZr8g=;
 b=kQRB+v5A/df4BQTUeey2KzKdzlxvQo7I24knvgBCwsti4+VXAtsdvUkh0ZesxQ/zfIRunw/L/8YvlUzFKbceyhu7xG3quJL9/z0EuV1Sm1HFIt1OzT4m7OxsUyvy8qJE9oYeU+4iI43xSbwbTLn2R1mE/EFXkfELu8vb1YDPu2U=
Authentication-Results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4513.namprd10.prod.outlook.com
 (2603:10b6:303:93::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Mon, 1 Nov
 2021 18:33:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 18:33:20 +0000
Date:   Mon, 1 Nov 2021 21:33:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Dongliang Mu <mudongliangabcd@gmail.com>,
        Pavel Skripkin <paskripkin@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Need help in debugging "memory leak in em28xx_init_dev"
Message-ID: <20211101183301.GF2914@kadam>
References: <CAD-N9QXsUcczurqq9LdaVjXFZMBSbStynwFJyu0UayDazGe=nw@mail.gmail.com>
 <55f04cb1-18ac-085b-3d35-7a01716fbcbe@gmail.com>
 <CAD-N9QVN7cepUpRu3d-xtr1L3DG90-nLS4gmkjerDZO21F_ejQ@mail.gmail.com>
 <f622f569-25d5-f38e-e9fb-7f07e12c4b7e@gmail.com>
 <CAD-N9QWeGOZdnuRuHVVNzZHWeP3eSHg=tsm+Qn3tqGqACSNbhg@mail.gmail.com>
 <ffbaeb72-0f76-fb1e-dde5-6e6bdcce1301@gmail.com>
 <CAD-N9QWQkivwR0mWwiaW_pLE6J_b03x4dP8RyxbmuKYRkcRhoQ@mail.gmail.com>
 <20211101143004.GD2914@kadam>
 <c0e25c48-84cc-6ad1-8312-1957f459148d@infradead.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0e25c48-84cc-6ad1-8312-1957f459148d@infradead.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::6)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.22) by JNAP275CA0039.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4e::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21 via Frontend Transport; Mon, 1 Nov 2021 18:33:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 419d2f46-4c44-42b1-7124-08d99d661453
X-MS-TrafficTypeDiagnostic: CO1PR10MB4513:
X-Microsoft-Antispam-PRVS: <CO1PR10MB4513962CEF6345E27924CAA88E8A9@CO1PR10MB4513.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dwq5hRwNtWheQ9Lmaj4nZL7aSewaq5tMtxgG9PBLp5J/yF3TUG6FJJuBrMoATKqo6cZW7mI1NV34CTju6ylsjDNE6fMJyiYuYFqppglGwtiiC1u1webmuQPXU/BII8VPEpsfhoYGZUscOoqhSYjGghMokWUPc1jkb7RKTIMxhmWKYRo1AxO+tsORM+EpLcpEnZU9kK/2sdLhA5fRwDhinbEPf7/Q3F35lB0k9Z1TEm1Uti2HSYczjTAwDp1V60LZ8pcwYwGZkIzwLY8flg4aUyXfg2g9n5uPKFPIGazctblbDEjtAQRto6a5VTHgrJKLUKzU0N7jGYh79xN4spN+lDk5J85JV5IIh3wfz99X7rVXTcj+1BkQTFmluKZlPiSNRFRaOcdVWiPjkMpsknCf0BQE8KNdeRiMgcMPm3+2HcGhZIo91STRqktrw4d/TAVapP20ztPX8MqUP8P0iM9foyNRrZNOYYgNe73fxxaVvDWgm5sv8tQ2GA5pmf5VIlMTM4GHYjgUNapT3kXf4kJklAwKmBOA2rwIO3PZTH/QbMFRT2s2fCn9C1sOOk8IIlikmtKJS8KHh2lI0pukm+NtcdLLvHB0A7SfwszW3hBXcnfWC7QutUptCFgwA+82S5vBza9y/M3+W0XHC9CkhNaIRKzaE8ffvsemnWTiMi5zbUi4opCxzjCb1HOCZJ2ex3etsQIegZ1P1rOlFQ1PU1+MBw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(8676002)(6916009)(26005)(8936002)(1076003)(52116002)(4326008)(316002)(9576002)(5660300002)(33716001)(6496006)(9686003)(83380400001)(55016002)(508600001)(6666004)(2906002)(38100700002)(38350700002)(53546011)(66556008)(54906003)(956004)(66476007)(86362001)(44832011)(66946007)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ja5euTCPnSqxNAS0VD1pfpHG5yRhcIIiVxukGkkPYYzW3zb1BohwXkPxD8is?=
 =?us-ascii?Q?9Rxb81nyWcq1fw+JM1UoGXoRh1HGw1J21irLSZX+N45jALv4eLL871Cn9YvF?=
 =?us-ascii?Q?rlnq7t8d8/SKZB4RBq/nGAJXFPmMPJ2RKD/NS1PF0E3zguhGh8eLad7Zbm8G?=
 =?us-ascii?Q?4mqK1JySWfmTTngAnLub75PKwcVSRJfBnI/TuVXmL6YlREOvgJAVn8mNHhhW?=
 =?us-ascii?Q?EcZusWNXDbzTB4Ib9ClA7g9cWRa3rTwDzoMtWoomMt4WPJOMc12BWR04dDFM?=
 =?us-ascii?Q?/2RSB/WB/N0BU2EE17nJfb1p+B6/egFj1Pg8D8q6V8Zgs3uJjjZjRbl080V4?=
 =?us-ascii?Q?gBLBR509+Pmog+5RAaKRNfRwZ/Lko6zkpK501tAqah/AmVN9Nc+HEH+Z0a0L?=
 =?us-ascii?Q?+8AR0/m3q7ODDnKfcQLXWAHRAoWv9EjO1v4MllltLY2hoaJ5e1hjy1IKmEzd?=
 =?us-ascii?Q?kqGwxXweHJM4sFXPOpYSziafiVIdqZnsA9zIcIY5I3wBaTdwnGSDowO3I4Cc?=
 =?us-ascii?Q?OgFRPCFXPI59cNoIxEMNRLRr/RzxV/WQeRaAtLrkoTh7lLpGPlU/xhVzWGGh?=
 =?us-ascii?Q?sEBt/PGMd7ojoWK+xD4bFTbKx668jCsp+XsETDdQ1FHR+hTdwYYCimC+c4Lf?=
 =?us-ascii?Q?jtuT8DLutoozoKYOMhsklcHQK5d8mWt4QhCcYx5GvKzaeOFiBonKjUM1xy9x?=
 =?us-ascii?Q?O5Zt9F0WvJduc3hGTD8mrMbP9cXUXd+uf36TS56YsCdhRraPIk1YQOfe7qRP?=
 =?us-ascii?Q?KQvWC2u4RLEW2SAIWr4mSFdRzhBdzCt0o2nLyYVCiSVIEVeB70LAIsaY+lc6?=
 =?us-ascii?Q?7JYhcQEu4FDqa6V3QPFgwf6cbDo4lSiyMoitN+lLAWXHVO65phKavmqh6G+a?=
 =?us-ascii?Q?y62/HVCQ6KaARmBmzdI1vKPI2bmSkjra7EzQzoeZtRNP9oAxWS3/uPuVqu49?=
 =?us-ascii?Q?FSD61T5yp7G31qiHaqz4IowznXCSrBHOeAWZQr2J5yMhqF1UM2/0BtxWLaoy?=
 =?us-ascii?Q?x06q+TMqU6g2qGB8S/IwBvijfx7xdJs3j4KhpyxUT2lTRKkKCohiQO5o7jBu?=
 =?us-ascii?Q?7vPGxAzezncYtIS6CXth6Ef9+CQPZDFoxWGpvZ3l14NxgtkMl/07hUOgFs62?=
 =?us-ascii?Q?KXDDKstTuYSObsENbppwvhRfilwlyu31GlvHntwh4y5XOjktmxyxp1W9zgpd?=
 =?us-ascii?Q?U9hl1NRV0SMaZv9LcdXoQdNxajqF72FN3/t7jQyaCKJvsqQ1KVaiPaOci+Ig?=
 =?us-ascii?Q?q4FINEs5pM50P48Q/1gXzduhWE5Kz9ymN0ZFREOQGr3TICewpKYs+JGhwztC?=
 =?us-ascii?Q?q4ttZUljiOQ9T1d2GD4xGEKUOjisuJYAl5mbhEwH3k4bcoQLHOKmOSACo1Bq?=
 =?us-ascii?Q?gk1iHYh9sjHYw1H4oV7/fDhua646uIPfGNgrbhNnXzWOO5lwK9jSQe38pG3H?=
 =?us-ascii?Q?EFg2SqNIex7lVrNPBTevpMnK9vZcZekZ0j/5MX2y4MQkIN5vlFtX9I/nZjta?=
 =?us-ascii?Q?30TuBAwca4+5PES3iICrkkQVbpSn2XTPtBGcmNw+psfDPGvAgo/d7wmBtqIR?=
 =?us-ascii?Q?QeahC0PpH5IjqgbohpktNLME4zfq10lpOj8va0C0dREBp/6kbWFGH/IaZ89O?=
 =?us-ascii?Q?V17MfhOlfW2yCwGAv4poKM+fPRAF7zJtCIDVT0yXt9858qubQlsJsafZch72?=
 =?us-ascii?Q?0n4ysQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 419d2f46-4c44-42b1-7124-08d99d661453
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 18:33:20.7540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W6YdYpEHD9i1Xeg2ItczlE1oP+wG2KffD5LBC8h5NNU6aJfVQO2KnXIGvuEzT3sv6e9bd/8mu0wS7BqK2jdOv5vBRUkdz2Ur5wQO7H4DfT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4513
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10155 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 mlxlogscore=822 adultscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111010099
X-Proofpoint-ORIG-GUID: ZI6h-eY9XoabvhgUY2iI97G9ZAxYJ5Uo
X-Proofpoint-GUID: ZI6h-eY9XoabvhgUY2iI97G9ZAxYJ5Uo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Nov 01, 2021 at 08:05:47AM -0700, Randy Dunlap wrote:
> On 11/1/21 7:30 AM, Dan Carpenter wrote:
> > On Mon, Nov 01, 2021 at 05:58:56PM +0800, Dongliang Mu wrote:
> > > On Mon, Nov 1, 2021 at 5:43 PM Pavel Skripkin <paskripkin@gmail.com> wrote:
> > > > 
> > > > On 11/1/21 12:41, Dongliang Mu wrote:
> > > > > > Hi, Dongliang,
> > > > > > 
> > > > > > Did patch attached to my previous email pass syzbot's reproducer test?
> > > > > > Unfortunately, I am not able to test rn :(
> > > > > 
> > > > > Yes, it works. The memory leak does not occur anymore.
> > > > > 
> > > > > But I am crafting another patch based on yours as there is a small
> > > > > issue in the retval and I would like to make the error handling code
> > > > > uniform.
> > > > > 
> > > > 
> > > > Cool! Thank you for confirmation.
> > > 
> > > Hi Pavel,
> > > 
> > > Thanks for your advice. I have sent the patch and you are on the CC
> > > list. Can you please take a look at and review my patch?
> > > 
> > 
> > What's the Message-ID of your patch so I can b4 it.
> 
> <20211101095539.423246-1-mudongliangabcd@gmail.com>
> 

Thanks, Randy!

regards,
dan carpenter

