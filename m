Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E10C73D79E2
	for <lists+linux-media@lfdr.de>; Tue, 27 Jul 2021 17:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232511AbhG0PfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Jul 2021 11:35:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22526 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232710AbhG0Pen (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Jul 2021 11:34:43 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16RFIOX8028132;
        Tue, 27 Jul 2021 15:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=UlJi+K5xgZyKridylqebnBDbP0tTZbPd7P47WsYi8II=;
 b=njn/XAb0Wsy7NW/mSrXR0xB4RvCFD5oSAxcx2oiG8m1B9+OQ/nB2yNzwQ4T+d/Gh+m8x
 RGaXaM+l2XEeFiY4P894wjcP0JtBWmDKE06M2znH/T+DebMhLYAR9uBd+qKVUcebpAt8
 EBC+9PjQ2Lr5naVmGU/lOSBAmZ1A6ozQ/Db+H1lna+sq4kRw4U6IMd7OMWFLfOwn82hy
 OcwSiXVCWAaNKLYmoLWljTFBs8NfaF1pqpLOCOab/AKce3ZnTOZ2NmZLjof7v6OTw5Cp
 8Mm72mghrroXz11QCaJAXlOOsHwgZzjkzDe20TH0dMV4Vy3nxCW81emRXwZ1EAf3Q8uj Jw== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=UlJi+K5xgZyKridylqebnBDbP0tTZbPd7P47WsYi8II=;
 b=MBAomIF61UMOQrOraajx6OtGvkax08G3NCYGWZxG7KdHZdmPBHHm9cyzZSkiZ9b8wk2x
 Xw37TIAh7/C5eKiSZ6SJ+gyjkta5RKsmWsZnO2vGr9RvqmaG0KJ81OGWtvgNvedxtxbe
 505mhcKu2VaLYJlQOhGhw48kUdc3PkU52V+e3Kbq2WwXMPYc+SzBA2UOWKjzeP70wjS1
 gituK6lix5zgSn4hiMsJmcv2blRCqg7b/rSQJz0eRM24aBrdsGbygCr6EqWhhiQ2ezfP
 5pYVC4F/d0Yxds3JzWrxSmG3dhF4dEk9G9PL3pMvOQaLFxheTVcq7lMU4rPS7hm5frFo Wg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3a2jkf8ehq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 15:33:46 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16RFFjMm159503;
        Tue, 27 Jul 2021 15:33:45 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
        by aserp3030.oracle.com with ESMTP id 3a234am3p2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 27 Jul 2021 15:33:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XM6sK4OEfas0g/NF8P/cJAdHg6sJEOLvv1FLcKPKsysiK0+/jEut3ZCaNhJgdTSE9tNIvHCHk3PjHPwp1srL+gMf1N/6cIzx1sEkXAvJ0jRFjjbc1zDaYv4UHIIRgDLR5+h+iFrCxSrFMX+iPntw+OiYx+0etVSBUJIly7GLCs4plKIac6vVhi1eK8aULitUPjkfSIR+DLhnYaBoNuM6yRwvtOF5zSm9LA0UFi0oyQxppmJqZnsz757MFDMlDWhAx+o/fsu4DtwUmqOpK2dJvHOE6BzALUgeGR5f7poOfCqnSQ1sSz749XvC5FNbZlTJZ6yaOj9q54jloDjT6pRKgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlJi+K5xgZyKridylqebnBDbP0tTZbPd7P47WsYi8II=;
 b=mpxZwMI0eiJyI9K5/4VOUYq717fr/JdajpQVc9TT8GM6SWerfJgkWbP/qO1ppXsubI5qs+cHZEiJ0gol3Ci7xV42fwG2eW/Cd0WqGzLn4k7Kfj3ZesU88/60ffHHl2c3QScrTBTFOOsSYfbDu9Jak7k0hUQfOiMveBhHOC0HLQH93CX8vozb/Nfqay3aldq3NthQVQR2wJt5plU4ItPFsdA+x2JV/ug4rwDRvk5h9i5Q3tb/ZHppAIV3rq6YGmFj4R8tqgT2ZRjUapdKFOXZ6MpqId0JFeDBkjNA3r2SNzwXGZvPPT3E1Mzj8kkt8UJgv6mVlDJuxAsHkxOmPHd7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UlJi+K5xgZyKridylqebnBDbP0tTZbPd7P47WsYi8II=;
 b=ZnbL2vdVu+G9MkMpXiwUZwB89nYDSy9YQwQV3drP15p9qTXHXdkQX3eqv29E8Qi95CdmbY7gpQdRYWjcNu2srYup/Q0im09rrxTMu6IkVN6GTkW2IZlJh5usSbOfIVnDhl+13E4pfJX2EunHT3v9Kb0yGl2v5mJUjn/E3rCTj+A=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1360.namprd10.prod.outlook.com
 (2603:10b6:300:22::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Tue, 27 Jul
 2021 15:33:43 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4352.031; Tue, 27 Jul 2021
 15:33:43 +0000
Date:   Tue, 27 Jul 2021 18:33:23 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Dongliang Mu <mudongliangabcd@gmail.com>
Cc:     Hillf Danton <hdanton@sina.com>,
        syzbot <syzbot+005037419ebdf14e1d87@syzkaller.appspotmail.com>,
        Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-media@vger.kernel.org,
        syzkaller-bugs <syzkaller-bugs@googlegroups.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in em28xx_close_extension
Message-ID: <20210727153323.GO1931@kadam>
References: <000000000000d068cf05c716264c@google.com>
 <20210727100151.2051-1-hdanton@sina.com>
 <20210727141455.GM1931@kadam>
 <CAD-N9QUz_7pxAFda9QYjhJf6tGLYvHr7hF_qZ3DmtP=J_yqWAg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD-N9QUz_7pxAFda9QYjhJf6tGLYvHr7hF_qZ3DmtP=J_yqWAg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0001.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::6)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kadam (102.222.70.252) by JNAP275CA0001.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30 via Frontend Transport; Tue, 27 Jul 2021 15:33:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73688209-f0ee-489d-f1c6-08d95113ea99
X-MS-TrafficTypeDiagnostic: MWHPR10MB1360:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB13603ED9CC1FB2207FA04B9D8EE99@MWHPR10MB1360.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oMp9I2WqU2aPUdBKJIJ/5he6FL1gVNO8RyTe5lBkjBkl89Du8GcmmgtKK/c4GOlpGafxqn9HpOkhqZdFsiSRZzOVSD98djhEdMRYK2jOR5BIB9X3Dcg/cv29Fb/WWLwr6eVSW6kGFGRokWAgwSEJxvNyoG8El53eHP8yfs7IegSlh+uqFhlhXzR+BS+JYKg2+LF2E6P8EJi75mL4bn32IyMDuzcmnQ4+nj8EAv5mKnv2aEH51xi1PfRn941V7X0Rd0EL/XuEWHwIY+QOFsOvvSKxQ6zixTryeJQCj3h864hIH24Zm2ICa89qfuPUk7GamymW3IyJdtMqj8mTEKkBMhLjW6kZ7rCEuRfSLNERRFM0KRdkkdW7kV4B9eoF+rnX21gtx8b2HPbGaN+tkQzadInLDO2yAypGQ1yTx28yODjFNRSHapiu1RcL+zUbM0B976BjW/uG+UtG0Vmul5STHiFSyPHmQTZlLFPUOOkFE/yIh8g7i/YzJkZVig0zdqL8qb+Frgh7Ht0SUOVNTpqpi/OECHxarx6eHASe/9vb85TS33JJA3n4vT2+cJbuly9wF8h21g82LUQNFv3outLfWLziUZuO8fDFL94noFFpOXz5mEkIRSYXByFo953KWDzXXpB1PSEmcFlW9be8fwnTS1YjL48iEO2OG37c1HJjcySSzMPj7M9P6lHsfPAmgHNtvdxeHxVrBNrD/YI1QaHNk8a4AoBSufL0Gxf9ruO0nF6r8FlxVOfTlFacVXpHpmUrFKapfc0aOZ6c/wlnFQrpEi8V720DyHnifSH6rWKcEy0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(39860400002)(136003)(366004)(396003)(186003)(54906003)(33656002)(38100700002)(38350700002)(83380400001)(5660300002)(6916009)(316002)(4326008)(1076003)(66476007)(66946007)(9576002)(8676002)(66556008)(33716001)(52116002)(8936002)(966005)(55016002)(86362001)(9686003)(53546011)(6496006)(44832011)(6666004)(478600001)(956004)(26005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8uzZr+fSwNgyf9ipOUN+NgV4gQGqvevZhqlcjTpXyM7OR4cyy9rwSEZkBW5f?=
 =?us-ascii?Q?fJHUPW22CFmJMqlIjuQ92PAXYMtMTiDw6NcDt32C8qdosM2vfTN2+WYdrZnK?=
 =?us-ascii?Q?zSXKqhmCMHXAQthZjON3yPfkiWU6UasgQ4ETSFsrsnYVwTGuKTbfayUlEKcs?=
 =?us-ascii?Q?zie2OQQ/H2DUL6GQUUbqwPg37/yMDbLbqbqSzIAhxxFyE745tYMF+ImM1l21?=
 =?us-ascii?Q?ExjSzvy7ZNS4LzIK8CZo2ddoJZdPzkYcY6KhPDiWRYC65p53hqg14kbLKATV?=
 =?us-ascii?Q?JWn+EFTcfaCaGwGAb9YwQO6NpgLsFmScy4GGA46SobCI/b53P2LRNens8+Qv?=
 =?us-ascii?Q?EBFJtRE77G/ZglRSpoqsEN54sh+EMHKP6Knnt2vnCUgalfV304Py46HFhRuU?=
 =?us-ascii?Q?3ptbBlw5rmQnyaXguJGE9E/oTZ/s6h7OyagfNkbBPAbOzoFgaW7FKcxIcdMf?=
 =?us-ascii?Q?w8eVGOWNC0KPY/YfxZRaq9Pg4l/Qsp0QQcuj8M3hYdoDBZJqLApgNu+0cCsF?=
 =?us-ascii?Q?m6BQ+ln32dPgOL8ef9nd0eqOIaRime5XTxf81kr8jmxhxWZ8HhtguK28ggyp?=
 =?us-ascii?Q?KERqxIohjbp86ouXVg4BPSRmcPp28Olg9TwWAx9426Uqnd5rpzjkbmZ/0ANx?=
 =?us-ascii?Q?CBHcyferiG3R7ouVKsFxnqvRVZsXcD5LdjAeSlnqDWQ4OlpgxOVlcPl6vNkx?=
 =?us-ascii?Q?021/RYKWnbtQrt9fAXBoVptueDi+S4759gTwmJ+vVHLjp4ObRULgGa6nddcC?=
 =?us-ascii?Q?IwDYI2DQcB78i0rAgegjH7/RiallX+M9ctwkmpsUYl0m6UBQICK+C8mW0qm6?=
 =?us-ascii?Q?wvDvS7GsXJMSmj2FBdE/foLC1ilHqw70sniI1m2hrxjWf6aN7aG8xOw+SQ5w?=
 =?us-ascii?Q?wLrv80f4RsRCpLPPkku8LOjI4jMzRQ1FVCZZTB4qqeN96pURvbIKg+EiyG1m?=
 =?us-ascii?Q?nBpAYfn/bb+7wVh0VimyVKVXq5GLXwuqY0M8Vk77vG8wkRy7Y1h1s+L+IdYn?=
 =?us-ascii?Q?wnpgAne01ajWLC9wIT/qzb9vK1/Y3jz+YMDrFH1FpOjrUSERu5z7BcSbvzEt?=
 =?us-ascii?Q?0HVpjZDpBCx5rscx/8hXI47NlKQNuHs9gOawlguRzREd09wVwgWT8foKBu6l?=
 =?us-ascii?Q?LWjpNN1OrNEHPHcIaa2pli8/FvmRMwfia7e/gcV26bs8mU1wZ16XJ3A4fFSF?=
 =?us-ascii?Q?tXFzXVgj0bcjBnSDlNAZKr8UCllF1Wfpu8B7B39Afg8j82F0wu2N7clCqqBz?=
 =?us-ascii?Q?3VnXy0+iwgcM/o58198pdKwXCji/WW77rGixTWSK25Iq0efLEV9f3SAXZz+h?=
 =?us-ascii?Q?Nxc9IjUByuTsj2ugic9yAe2t?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73688209-f0ee-489d-f1c6-08d95113ea99
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 15:33:43.6009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/r9YheM9Av3tG4ZPdJ0SOU6HxET1XsASa7dtrlKa5wsmwLsFn+C6jbNTuVeUYiJTWd7VAuUpX7FLrykj2RWl6JUqxuywawg2nVLI7V+0VY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1360
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10057 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107270092
X-Proofpoint-GUID: PLpo73ll-ydNzrd0iQSsYlZgkETDPtIg
X-Proofpoint-ORIG-GUID: PLpo73ll-ydNzrd0iQSsYlZgkETDPtIg
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 27, 2021 at 11:13:13PM +0800, Dongliang Mu wrote:
> On Tue, Jul 27, 2021 at 10:15 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > On Tue, Jul 27, 2021 at 06:01:51PM +0800, Hillf Danton wrote:
> > > Along the probe path,
> > >
> > > em28xx_usb_probe
> > >   dev = kzalloc(sizeof(*dev), GFP_KERNEL);
> > >   retval = em28xx_init_dev(dev, udev, intf, nr);
> > >     em28xx_init_extension(dev);
> > >       em28xx_ir_init(struct em28xx *dev)
> > >         kref_get(&dev->ref);
> > >
> > >   kref_init(&dev->ref);
> >
> 
> Hi Dan,
> 
> I have developed a patch [1] to fix this crash. Would you like to help
> me double-check if it correctly fixes the underlying bug?
> 
> [1] [PATCH v2] [media] em28xx-input: fix refcount bug in
> em28xx_usb_disconnect  https://lkml.org/lkml/2021/7/19/263

No one likes to review patches which aren't sent over email...  :/
LKML.org doesn't give the message-id so I can't use b4 to download the
email.

That patch doesn't make any sense.  We call kref_get() at the start of
the function so we need to call kref_put() at the end.  The fact that
em28xx_ir_fini() calls kref_put() doesn't matter.  We will only call
fini if the init() succeeds (hopefully).  The em28xx_ir_init() error
handling is Ad Hoc Style but I don't see anything outright buggy.

I think Hillf's approach is correct.

regards,
dan carpenter

