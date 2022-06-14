Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A266E54AA88
	for <lists+linux-media@lfdr.de>; Tue, 14 Jun 2022 09:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354007AbiFNHZU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Jun 2022 03:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353151AbiFNHZT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Jun 2022 03:25:19 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DFC33702A
        for <linux-media@vger.kernel.org>; Tue, 14 Jun 2022 00:25:19 -0700 (PDT)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25E7Mw7g014557;
        Tue, 14 Jun 2022 07:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=+nRg+Gcy40YY1/9mNiuOuI+N2nlrEMpUylapn3ObVwQ=;
 b=bro86lcm2p4VXGHdwDtXYzMq7eQ0GjiNBLPi2pSW+2Na7ByRn3b7J8izEGApAgxVOT9a
 M3cjzlO7fQU5TJb1ZY2++wncaEAgdONQ8EDISWMCO1KEI8FmLDv+wwgRy0slhiIcllK1
 nTfc0J5SH95YcbSt6wJfClykAYcrsyK6+Ny58vGR6FFPaecEqXwIhtZtsyfQH6GxILLn
 Uk9bsCa7mmTDzW7uavjmAZjJHgLmnzgAWGr9IvxcqLaP91EXszyc2q/E1R0Ec00AavaQ
 Dr3a9/sctCPaANXGTqNI+ASKzA/+QngNKTxQgxNS58mJx4TiYL3sbEOkDeRQ4+fT1pUZ 2g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmkktd05c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jun 2022 07:25:08 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 25E7GIeb027041;
        Tue, 14 Jun 2022 07:25:08 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id 3gpnsx86dw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jun 2022 07:25:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0poe6QoUNBhHm8fiaCrCd6bBjYsC3Q8JBl3A5ga0YHTgLyKNpHkrDViWfJZmj6SaDcvIYeNRKTnfGLt//f5WRcbilOgFJpCRLhG5AJtUT+gACrD9ExFQg3wjZZJ07qnzDd9+212zaqgUvvBZUh8F3xYCt9dmobpF/ixcfyh4AWAc3eBQI1bFbtT17qm8FpDR0Q228Ge9vqs2CjL3bP4vuKddDHyOpHq6ncHWUTLHyzeWRoBqw4Qek1I20eocBZafgFz1Z26Dbo1VYzU4jx3Lzw0OY7loWPJ2OPBy+jXX9xI+CYqbPTfKrwkTGx6FWnbcobyIogMnNKSod5U9yJE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nRg+Gcy40YY1/9mNiuOuI+N2nlrEMpUylapn3ObVwQ=;
 b=UVshhMuduhVi4J9Nog2E41JO0y9Az/HkqBL1Vtapsh2cOQ0vKiz5uL16r+tIApZa2mP0M++SQtCUcYqjIqvaZ4Tm9RF8/sG4PfXC/pl/rWKIcaZzXXs6gFMGY7muwlsVKZ7qvZbRnkOXaWW4cKnb0Phar9gQYruHKgeebqeTOE1jvYvTugwENj8fA6YvF27f4yrOQAtnZwUjPA5FBbnXX009bE52/NKcbgb28H8OtSBwj0qcoRWMrsMa4kKa8WftIi6TAV72IaXfBh3thSjdF8jKgRBobAFI3EB81Fce8nKCnBvnEv/zur1skTJNyTyTb4YXDRigZK+SqHGJkQJjAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nRg+Gcy40YY1/9mNiuOuI+N2nlrEMpUylapn3ObVwQ=;
 b=CloMlW3nvfzOjuPVlZMil9OK26WKhgj5YFp81bYWePvb5fMldHcRQdOsJbExU2mNwFS6qrIx8b5YN9o6IyAThGntTniy87i6dqs0gW46/KVLqmfxr0b17LPvPYaepalfAmqYqwb5BdtWegYzmOBY7mKO8meLdA0d/k05WlOI3wg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5839.namprd10.prod.outlook.com
 (2603:10b6:303:18f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.20; Tue, 14 Jun
 2022 07:20:04 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5332.020; Tue, 14 Jun 2022
 07:20:04 +0000
Date:   Tue, 14 Jun 2022 10:19:31 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Yury Luneff <yury.lunev@gmail.com>,
        Nable <nable.maininbox@googlemail.com>,
        "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>,
        Fabio Aiuto <fabioaiuto83@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/3] media: atomisp: revert "don't pass a pointer to a
 local variable"
Message-ID: <20220614071931.GG2146@kadam>
References: <20220612160556.108264-1-hdegoede@redhat.com>
 <20220612160556.108264-2-hdegoede@redhat.com>
 <CAHp75VcNjQ+0=LcMdi=64U5qvO2f3PeZCPAf9AKbrGLx4PdKmg@mail.gmail.com>
 <20220613145820.GF2146@kadam>
 <YqdaJ6fzEzeWpIGz@smile.fi.intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqdaJ6fzEzeWpIGz@smile.fi.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0067.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::13)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5174be18-f345-4c0d-664b-08da4dd64d2f
X-MS-TrafficTypeDiagnostic: MW4PR10MB5839:EE_
X-Microsoft-Antispam-PRVS: <MW4PR10MB5839DE132653D62E5B9E6FA18EAA9@MW4PR10MB5839.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: afzBWXoDgfCpFr6AdoVwEvEMtACTekcxKdrlPXQ2Mihp9jcpXPRo4S4tSS3s0vpQ805NltDU+ZpPPBAznipHb7JKP5U2eoC/gTCDqYN1s8gu2cbZo1Y0vCSsKwOLOv1nP43ItdIsqQdVnjGBT2NkoKpjgkoB5xSvKyiFgfKEZwd3p9R5Cfj2zeS+/an0xeP+h5vaCrlcu/H2nuGQAMZVKhU2Kho2QngFTqaMLT4wLQNHstpqFChwqpMAkqJstZI7hazfwKIQZU0a7FDbXllnrm7dYul8yxQafiZb5Qutd4kONMcG+nliy0954Xqj0967izsNQtfsshhs+y8X/eubj6FQf7MgfLMgoOkh5nMV3DalgE+xGjee1g+jhPWsxh+mBtiLWGkvHidL02pZA5OXSifVu2hZMpxlsag62qv4P0lSw0APY/G/yZQ2cFxdLPcBlSZfDHhMRyk+bLzt01qu2p+3tMyXD8OxH0OFv9DQgV1pEMp0tRT2tzk0GyV/y3ZPg37IpYcvl6egwWkc8rB1Dl5gG3v9njCy9CLqwQAa8YJFr+hsm3ZHXTGIoK4dSRb0wGQk615J8aieafOSNRblnV44nAiT9GO4o42NAJtsNy1w7de3FOB99Ws/RKiyaPqfy1z/9yL/JooQiFHh2kah8oJ0Vw8tVm9NVzCRSsx2YiciUGIEeo0CxyqKFd4jII6OXYcv7Ut2wUM2vT0G/eVUdt6W3NbnAOaUnUl0xnta5Xw6Jv+eblJNJsL7OTyV99KtVM+QHeuiGL7YKAFgyzrRBRjMUtNcEk8580eS14mQzCJDVkmjbuZJGDGQhDlWHmsV2T78Nv9snMs2YXFgQe5dWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(366004)(966005)(6666004)(45080400002)(33716001)(508600001)(54906003)(6916009)(6486002)(26005)(44832011)(6512007)(9686003)(7416002)(66556008)(2906002)(8936002)(316002)(66946007)(5660300002)(8676002)(86362001)(4326008)(38350700002)(66476007)(33656002)(6506007)(1076003)(83380400001)(38100700002)(52116002)(186003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CvPETZyATZzb/0x83cRp+5gMj6bhMMamSbW7n3v9sEw5OCJE20b5K/mDw0P0?=
 =?us-ascii?Q?5k2gYQ4HEG0Cqvy6EusWHjl4oPFHLDEyza2TVrCURTwHHeBMI+NYD3q7v5Zc?=
 =?us-ascii?Q?w7O2H6LVHLNIeBj99Ju6KiPQY8GPtn3eCeJJoZrJQgvUiKIveN72wJZrcgk2?=
 =?us-ascii?Q?HZVvB09pnpj9mzvKs6Djky9fMVXuasok+PZ51e+6BksSiP4FIyv/D0hg1o8/?=
 =?us-ascii?Q?bhgXW0Kl7bqW+0Th6LKoR3MKUJDC0mt1FGUm0We8hY0OvaUM5ppladFLMDEC?=
 =?us-ascii?Q?gAOHnroDcq+3ErDKu32RjrcHRYr1uVfZsVrisvgA1pYVHLVuLrCu36K0nyGJ?=
 =?us-ascii?Q?AZ0t7DMzZJBOcjdv77AdJka1xcvzCE7CePs/MkH20cDwMs1QK3Jx3txFm1un?=
 =?us-ascii?Q?sSJJBps6Mc0hozUxHFgXOSAs+wf2qRgkVuUG+GvUS8SatOZzWBGmQFfijbLs?=
 =?us-ascii?Q?IhfJ4NY0RvScaZeqS4JL8Mn5FRN7tQtw6LYWz3q/wA+Oascoox2yVLybsuNC?=
 =?us-ascii?Q?ffpRgPhpbNJkgW08S87inC2vbnAaeEG4xEsOUYMrf+PbrlzbntmkBcJ+gASH?=
 =?us-ascii?Q?3d3g/OfkOhuVMTOJNwTl1vbDWJp1m6v0zpXMNnxmnHvPbL6mleo45hP3K7c/?=
 =?us-ascii?Q?oVY2w2zOOD4zuoJSulgZTuO5Jf0GKcWPLka2qwjifKMVEnAFoh9SbjpxjygO?=
 =?us-ascii?Q?NczJ/2K0vVq8rMWVrKGUcOOGKkMqlrODYFrp5aTRHCb1AR7fyvWbDaXQ9/jL?=
 =?us-ascii?Q?46jXG15wCX5TpsAB26kNRt/x/h3XKf8gsBf70pGqPMlfJ8nR1Dwbgv80h1mi?=
 =?us-ascii?Q?+7F3b/L0kSK+9C59WVSwB5HPSugJ+sFsZ90ZWeAtJmLSZRkGty8bd+iMDnRA?=
 =?us-ascii?Q?CRZ593i0ZoYpqnuee2QtesT/HSryL7IFBdRpcA/vZBcOS6MZks3d+uWrxYjo?=
 =?us-ascii?Q?w+5+nytLi15jfd3EJXj1PB6H3vflMmEjL0ts6D2Nlf1vINEwwuNIthuBOehs?=
 =?us-ascii?Q?7tamyzlyBR3LVkO7yfNlJ2gWY7itFq0n0e9cUyUcFqmxHgbCzV3VDO7WUvac?=
 =?us-ascii?Q?pVEHZW3zB39MDoepvrX6dr7VRfExm5gDH999bKmnaYg9HseFBxjXZET3QhRa?=
 =?us-ascii?Q?+9it2nw1S+kEy5UCMSuRclum2qm7seFjNPp92MRGB+ID/pjCILTzBDTisrkT?=
 =?us-ascii?Q?igWH6VY7CKbBUcNPuQHsF44M/MHlM+kTc+nW+9YSfCOoRj9Zkij+mbUrnaHh?=
 =?us-ascii?Q?81CNSpb/Z7L7kHeElfVko1a1BCKkiRVkRdtSHU5ii0rpkX054WRQbT1a5Eu4?=
 =?us-ascii?Q?dpR+9pX3VnCliznvhSBCNiPRFgYhDQ9RubxHsuKquVFKGNd1H4fMRFbKqdrK?=
 =?us-ascii?Q?VKMQ711RBdVSFPdruEkEGHaxJks46TqmAWsITEGeKt5mW5wqT1bKnjzZwHdT?=
 =?us-ascii?Q?U4TTKaOqwE1VeiivHIWZuiBnHQisdxJvocqnp9NXz9jp13cUk7j3DdqJTQr6?=
 =?us-ascii?Q?fyMa/dnhM9TgQTQIrlIMMWAn8FRaiVPKxtvDbe5NC5MtbB7Rg/tyD5YXUXcL?=
 =?us-ascii?Q?M4nRakp5fq1EWQKL2ecyYtsdbHfSPzaVXrhu9E4Q4hQhh7tetAMd2ZznFv1A?=
 =?us-ascii?Q?KWAH5OWy2H/b9itFwa0y04B6p8UINGVUUYWd9lZuKbh+zRjvq98AZ1af1piM?=
 =?us-ascii?Q?IICLXDtFSqeE2P4y9dEbP1UzEMWaGsVt51sECtl9faKZ1XlvAUPh3Iskmfyp?=
 =?us-ascii?Q?wvz8kUfRAHATYHGmy3E/PQLo1GDW3w4=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5174be18-f345-4c0d-664b-08da4dd64d2f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 07:20:04.4950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyUtjExH/nApwQie2PO21uN5r0eTB1gJH7Z4RgBtF2yv2G6V12YHVNEmnMHCstgJp0kbTuje7hjQ35p5IzpIGJcAWzf0OWwgLmAVKw6e85g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5839
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517,18.0.874
 definitions=2022-06-14_02:2022-06-13,2022-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxlogscore=953
 suspectscore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206140028
X-Proofpoint-GUID: yYVW2xPv96j985SlzBPMBJWeOpcdQz8U
X-Proofpoint-ORIG-GUID: yYVW2xPv96j985SlzBPMBJWeOpcdQz8U
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 13, 2022 at 06:39:19PM +0300, Andy Shevchenko wrote:
> > Do a `git --grep=revert`.  Some of them you can grep for "This reverts
> > commit 8bdc2a190105e862dfe7a4033f2fd385b7e58ae8." but there are a lot
> > which are not machine parsable
> 
> Why not? The format of the string hasn't been changed, no difference from other
> patterns.
> 

With the Fixes tag you can just do a:

	git log | grep Fixes: | cut -d : -f 2 | cut -d '(' -f 1

It's easily machine parseable.  But if you look at the examples I posted
they're stuff like this:

    This reverts commit 9eec1d897139e5d ("squashfs: provide backing_dev_info

It can't be grepped for, it needs a human to try figure it out.  And the
reason for that is that we always tell people that git hashes need to
be in a specific format which git revert violates.

Having two hashes *is* duplicative but if we're to delete a hash we
should do Hans did and delete the "This reverts commit
fb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee." line.  (As an aside, in
that commit the reverts line is not a Fixes line.  The original commit
was a temporary hack and it was deleted when it was no longer required.
So reverts and Fixes are not the same.  Reverts is ambiguous.)

The problem with the reverts line is that most other people besides Greg
only look for the Fixes tags.  It had never occured to me to look for
the reverts line.  I was just reading an LWN article about bugs in
-stable and LWN only used Fixes tags, not reverts lines.  Or when people
are backporting patches I tell them to look for the Fixes tags to see if
they are backporting buggy patches.  If they're searching
lore.kernel.org most people will use the 12 char git hash instead of the
full hash.

My main problem with `git revert` is that it writes the commit message
for you and it does it really badly.  When I'm reviewing those patches
I have to tell people, "No, never use git revert format.  Send normal
patches."  I always tell them to redo it like Hans did.

Subject is wrong:
https://lore.kernel.org/all/20220614011528.32118-1-tangmeng@uniontech.com/

No Signed-off-by:
https://lore.kernel.org/all/BN9PR12MB5257FB6CA192626D5D108C2DFCAB9@BN9PR12MB5257.namprd12.prod.outlook.com/

Terrible commit message:
https://lore.kernel.org/all/20210414233533.24012-2-qingqing.zhuo@amd.com/

No commit message.
https://lore.kernel.org/all/20220613132116.2021055-2-idosch@nvidia.com/

These are just the first view I looked at from yesterday afternoon.
Almost every patch with Revert in the subject needs to be NAKed.

regards,
dan carpenter


