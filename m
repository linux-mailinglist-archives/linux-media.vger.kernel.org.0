Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1253B50A4B3
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 17:52:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390172AbiDUPzr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 11:55:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244480AbiDUPzp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 11:55:45 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBCC315722
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 08:52:55 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23LEwce8019231;
        Thu, 21 Apr 2022 15:52:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=MB00xf//ODi/IEGODuUqxhtHMTibB+MiFlLrWajIW1U=;
 b=GJqFBdjNOJWiRIhcRJ2RDu8S1tgyx0yEdKGX2hcQhoDH95f6Bme+m2SKUODsk22oAYze
 loSk+Ezundbs1ssibhAKhptUOMLyxdlj2af0hA8y26poi1NSF29sxxOr1pWvle+Nx8iZ
 YBh2cAhzjpWcM2/UaOSYo2sOFViJnP93XXH1Iqg7jTgaws87I2xqDKafmbYRQXo23DPW
 ZU7N61kenEYT5IPGthol0ijG08c8D5fIqJDFTlJiNt+t8InLxpjpRw33aROuzSP0tMA2
 RnJpdOoGs7xCiuohkG9N9ceriDMBvudjZqmeDOgoso/SHBWwnxgznemh7iGWuUrahsQm rw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ffmk2ve5j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Apr 2022 15:52:33 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2) with SMTP id 23LFpmL8001812;
        Thu, 21 Apr 2022 15:52:32 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2041.outbound.protection.outlook.com [104.47.51.41])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id 3ffm894ws0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 21 Apr 2022 15:52:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVtRVVbxoqHXV6zqfoD3BR1SLAqHEeKD5QEMv55Uz9VnWij1Cp66TtPEcm9SKDLZfpSraV3ypTzWA+7ORd0hVlsa49FiD5haFaEkC5CPWZaWKzZCuXVAR2wh/tGDRr14aYIf1p/1hise7qQ2UHbSyyC/Ih07LikIAdXlUHVw2ev6CANr1wvDp+r+301mSlxqe81Qz3S9I2VuBHBoaapiqPd3ilkRaGWmVrwtUtchrnx8aMQykCdrWg4TeTW02dTUC6fDHv6gn7R9KCchTZZLIPfgbZ1w4oSpUpyR+EuzSubJAOA1gZine6uHPwJuEQj59Kd/hZu2PUOIGHVreY6SGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MB00xf//ODi/IEGODuUqxhtHMTibB+MiFlLrWajIW1U=;
 b=hfKH9dF4VNHdCcjboHsF+0Tiqq0eWxOJqeDanPHPz5WFNbADv6vMJmC0AKK8Ln5u8ppw9ktXBJGEczZmVBTzfNos6/yDIJ3nSAw9K1P7J7hTTV+couHYig5odd0vtqADYLc6lULvq4XpmkDW1atrMB8t8RQFViWzI3GI8hzDTQpl+/bfZbxn6MXyB6QXns7JQGb4nlw9J+yxjJHYI/5m5/5qp6DHouAoxdGzuvcAbbmCdeAAfdQd3Cuhi6qcc7tAZXGpr1hIarDRoP1k7xxpS55Q2XevjpEaCnn8zL9M5S+EJp3yDoReUJBEV9JtFMjP2E0UoJRER3aw3cvBXvjJgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MB00xf//ODi/IEGODuUqxhtHMTibB+MiFlLrWajIW1U=;
 b=HsspPuZtw1zc6K/vfwQZR6DRSJxfVng2DwANHhFi0mfwIjKx3yh0A4N43QoWhSVM2s7nAbdCOuZoJA+ljpQpzK8+SyzkKA6TAfJ1hOYvPx2157u6qnEl10vtunaaE5QDIxKA/4e/3W3+SEmCIIL1bGCpICvxnf9tqb0yNHkXPtg=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MN2PR10MB3982.namprd10.prod.outlook.com
 (2603:10b6:208:1bc::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Thu, 21 Apr
 2022 15:52:31 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::b5d5:7b39:ca2d:1b87%5]) with mapi id 15.20.5164.025; Thu, 21 Apr 2022
 15:52:30 +0000
Date:   Thu, 21 Apr 2022 18:52:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Ian Cowan <ian@linux.cowan.aero>
Cc:     clabbe@baylibre.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, mjpeg-users@lists.sourceforge.net,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: staging: zoran: refactor printk debugging function
Message-ID: <20220421155203.GB2462@kadam>
References: <20220421002316.873109-1-ian@linux.cowan.aero>
 <20220421142153.GA2462@kadam>
 <YmF2mM+Lqv/HOgFl@fedora>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YmF2mM+Lqv/HOgFl@fedora>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0027.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::17)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7e03619-eb95-4c30-0d34-08da23aef163
X-MS-TrafficTypeDiagnostic: MN2PR10MB3982:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB39827FCD76FBF041E923CF6C8EF49@MN2PR10MB3982.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aI3Suua/3x2Fk6X+8LAz/haT5CnyO14n5mCtxG1cW9GWyxINAA7r2QAXO0pKKx/nol8w/JSIsyMJdPeoWdDm320Scil+sqxNjVkM/PdWTJ+98uWkvVvC3DCcVgbxx4JZB6Thogobc4oAXMt74fjm2r2DefJ8ui+CDXZMMBpBy/9hjzBJNPytg2Vqv4f11TxAJPfp75UIRsAP5bJpJc5ech6ppdwSV2RPVdxVTnAk8P6zM21/dbGakBxtD0WZ411AEdnLVmdH13y1CN4qLaEf9crosl7DNNdMr0swEXHYDtqQenc57l2rTYpX5KuDZhFbndn2SO320Z+7CjVlS0Xb24IT2pSFdjuP8+QdJVR1hZ81X+/ytWk0zDnndt4xMKBsRBVomVnwaTrkR15PuVXNOyowf6dvnwRt2HLHe5JY88AnEUIrasMYUrubsQI91IpoNYN8aCat7KhCUbaTTK2v62nrx9HT6DH7gEvs73+j9nm78lKRennScyI+TR06VbqZbSaPvuYs4AM/ZElVkC+nJoA+nGbADczIUL35gc7wpMsgm8XY9z9AxIt9Da0jpUf2REM3czYRVol1ASKKY9ROHrGwyG+rIkpYYfUy8JlJAdi+ch3TGO/A/7nZDdR9NPg0cceAwSFU1T1rVDSYWWdKm5o+JG2MLdqlhJTYdsiVOTF5H6b2E4+VF0IjnIU+JMGW9Rrxb/0P3sX7IpnjJyAwUw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6916009)(86362001)(66946007)(316002)(66556008)(33656002)(38100700002)(66476007)(83380400001)(186003)(38350700002)(4326008)(26005)(9686003)(2906002)(44832011)(4744005)(5660300002)(52116002)(6512007)(1076003)(6506007)(6666004)(508600001)(33716001)(8676002)(8936002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hfH0HhUz5jadKuxm6UjCUxvVw/kKizpXmR4MHCNXOKzSs+3gPDoucWznpQpR?=
 =?us-ascii?Q?18OzOL0t/unvjT2tkCBEPChvgNp2RlxnsLP+XtqxCbM11EBv+MyGVFlYJOcX?=
 =?us-ascii?Q?5I0varLFmhFVr0Eft7wbHnERY/yjjma3AfjEFDtbIt92aepmt9+NEzfPgIfy?=
 =?us-ascii?Q?Bynmaqddh3T1wM1O5nD5me2+4h/bWrIGsScb92dyoTCn0o3FQgMZHkYU9JXr?=
 =?us-ascii?Q?EgY3+X0QxKhdtLcKc34vk28Z5R26PPiUOg/93iMZROnpUR3KLLs3Cza6Kf5g?=
 =?us-ascii?Q?HFIrVw3BLb7szffDVGVgS7C3Qu6jdwSpUVZr1oPuB9UuWSqcQSo96+RplExy?=
 =?us-ascii?Q?c9VhlGdQleGEHbfxAnkijQ7AUIaFSn12Fbi8O9sHTypEhM9s9WswfQ/hXyoE?=
 =?us-ascii?Q?iy88HpxTQS17cw6qbieCCMOGgh4f2ZM7EZFLBRzNX542efwfBiMfWXytK4zv?=
 =?us-ascii?Q?ojGA9H54cPOaAfBQAqjtD1h271FFNMEsTJv5Y7rl+q+2hGs6/0+Na8Xrhmi9?=
 =?us-ascii?Q?AFwwb65MDbzotlHHLaHneTgAvk34Y0zcg5bTm3E6zVh7c+fjFGNloyvbjI+T?=
 =?us-ascii?Q?xlUTJIulD7+UeVCHDZ/DKm6NZpJ3Nb2mm4TWn9Td3LN60mZn0OvEDsJ0o3FI?=
 =?us-ascii?Q?dVm9Ka0TeB0wqzRAHZmgoPVe/Dc+GJBCZzMvtTU10YXG3QUHwhKxOddiD4KZ?=
 =?us-ascii?Q?pq+T7Jdj/nW5xzHd+kjT2JaXgwgG0j7YNMv0bVINqtrc6wGRC6JEnBbPWAJf?=
 =?us-ascii?Q?ks6MbXhKq35fDO0UmdKzsYfRciqce3+4OHO68i4SLEc+g5E/eDsLLTH+kxN1?=
 =?us-ascii?Q?tOWkkbcQ/Xw/0sMm9sp3WTxK/Jx5Mvz0WBLanjE6yGWA/LVVh0SZ43SdvjSI?=
 =?us-ascii?Q?JcTTjvwWImFOvcpgR3pUr72PpzRunbfCuXjveT4d1FKEwf5fgRlAettvv13/?=
 =?us-ascii?Q?+iCTlDWAZq8mP52TpPymduuDgVtrqj+xXHXgbo5ld7QkARBhdxhmPzbQ9IDV?=
 =?us-ascii?Q?aSqk8vsw2hpCwg434dGQoRCDUQLNhWmHL7ML7cwPdmNlEPlqH5bFvvysqW2r?=
 =?us-ascii?Q?EVnIOCHSpfYafeSWsPzQkFQUUPyZs8GbDcSIpgBGs2ALFtZ9CV3PhQyw+kYI?=
 =?us-ascii?Q?dGC49LIluFuVgwMSuFByCDLZ7GCg3G/2uWY1cQtNw3gIucZCoLhT/tH5kedE?=
 =?us-ascii?Q?gDGyFIQU68PX3kTNIOuOnudS7V07VB/OIAn4jNyYQVVl6++o49yBmawxXc4X?=
 =?us-ascii?Q?+5dzsBGELLBMHAR85huWOa5n+5qjQQo5yKOIrjhonnY892b43R/JYn4J2WyH?=
 =?us-ascii?Q?c4Gtfq1dBMEnIBTe4hCYTrZxKiJKzIzf6qF4N92rywxpP5kjGpVts7mQF9yX?=
 =?us-ascii?Q?TmE5VDShT3wbJT2NS/EDPjjQAW8K1Nm99DDKpluH6E+L3U+ZFrunLBy5B0R+?=
 =?us-ascii?Q?uYvrh41izMnCqBj6uG+ODnQ2AfR0LVk8cnctfbu86zbuaXF4Bm3MIIZ0vRSR?=
 =?us-ascii?Q?aLONeuBvQddpgeiIsM091dBfP//rFHVwQldem3Q6KGv8REgbg/RKI4r8Bvkq?=
 =?us-ascii?Q?G3TZZwD+a0alXskCx5N0tmfkZA2PpQbrtgE3x7OakJ2ZO5keWTrz30C33TN+?=
 =?us-ascii?Q?HU0J4ib4bnvV0LESnFnpHrfODKtsYpyHcoqc9agJ0b0OteIFB9H57CPgn0pg?=
 =?us-ascii?Q?3t37b7MJQhl4moPlE+VY7HnbC4LhlLStdKrsCpbPlTuWxewnVb2fYRBAuJQg?=
 =?us-ascii?Q?o4T9SEKqt6chOJzU/ckWg0sXCJwbqSI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e03619-eb95-4c30-0d34-08da23aef163
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 15:52:30.8991
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o+KqLntjxb+PeiaZcDnQWZbzUxsNMwiohMjV92i0FO3JklNwh4QJgrWXjMHH8NmRVJ/KBmuyrCGydjYCu3qQ8JhmSwk9eVXnjv2jEjJSVkQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3982
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486,18.0.858
 definitions=2022-04-21_02:2022-04-21,2022-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 mlxscore=0
 adultscore=0 mlxlogscore=892 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204210086
X-Proofpoint-GUID: W8RbLhG9BE-wS_KGq95QIKBMuD45UQ0d
X-Proofpoint-ORIG-GUID: W8RbLhG9BE-wS_KGq95QIKBMuD45UQ0d
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Apr 21, 2022 at 11:22:00AM -0400, Ian Cowan wrote:
> 
> For using the dev_dbg() macro, do you define this in the header file
> (i.e. for this it would be videocodec.h), or where should this be
> included from?

dev_dbg() is defined in include/linux/dev_printk.h.  Look around at how
it's used.  pr_debug() might be an option, but I don't know if we will
accept that, we prefer dev_dbg().

regards,
dan carpenter

